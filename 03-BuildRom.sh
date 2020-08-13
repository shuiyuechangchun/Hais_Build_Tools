#!/bin/bash
SH_FILE=$(readlink -f "$0")			#脚本的文件
BASE_PATH=$(dirname $SH_FILE)		#脚本的目录
BINS=$BASE_PATH/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录


show "----------------开始执行 打包 脚本----------------"


nowDate=$(date "+%Y.%m.%d")
mkdir -p $WORK_TMP_PATH
touch "$WORK_TMP_PATH/system.patch.dat"
touch "$WORK_TMP_PATH/vendor.patch.dat"

zipImage system &
zipImage vendor &
wait

#移动刷机脚本
cp -r "$WORK_SRC_PATH/META-INF" "$WORK_OUT_PATH"
cp -r "$WORK_SRC_PATH/firmware-update" "$WORK_OUT_PATH"

#加密脚本
shFile=$WORK_OUT_PATH/META-INF/pw/hais/rom/hais_diy_rom
echo `sh $BINS/zexe $shFile.so $shFile.zexe`
mv -f $shFile.zexe $shFile.so


#---------------------------------多机型适配-------------------------------------
DeviceName=$(getProp "ro.product.system.device")
RomVersion=$(getProp "ro.system.build.version.incremental")
if [ "$DeviceName" == "raphael" ]; then DevicePathName="RedMi_K20P_Raphael" ; fi
if [ "$DeviceName" == "cepheus" ]; then DevicePathName="XiaoMi_Mi9_Cepheus" ; fi
if [ "$DeviceName" == "dipper" ]; then DevicePathName="XiaoMi_Mi8_Dipper" ; fi
if [ "$DeviceName" == "polaris" ]; then DevicePathName="XiaoMi_Mix2s_Polaris" ; fi
if [ "$DeviceName" == "equuleus" ]; then DevicePathName="XiaoMi_Mi8UD_Equuleus" ; fi
if [ "$DeviceName" == "grus" ]; then DevicePathName="XiaoMi_Mi9SE_Grus" ; fi
if [ "$DeviceName" == "ursa" ]; then DevicePathName="XiaoMi_Mi8Explorer_Ursa" ; fi
if [ "$DeviceName" == "sirius" ]; then DevicePathName="XiaoMi_Mi8SE_Sirius" ; fi


#开始打包ROM
RomPath=$WORK_ROM_PATH/$DevicePathName/${DeviceName^}_${RomVersion}
RomName="Hais@${DeviceName^}_${RomVersion}"
rm -rf $RomPath
mkdir -p $RomPath

show "正在打包 ${DeviceName}_${RomVersion}"
7z a -tzip -r "${WORK_TMP_PATH}/${RomName}.tmp" "${WORK_OUT_PATH}/*" -mx=${ZIP_LEVEL} >>$LOG_FILE 

show "正在制作 面具 文件"
bash ./04-CreateMagisk.sh $DevicePathName

show "正在压缩 备份 文件"
rm -rf "${WORK_BAK_PATH}/firmware-update"
rm -rf "${WORK_BAK_PATH}/META-INF/META-INF/pw"
7z a -tzip -r "${RomPath}/ROM精简文件备份.zip" "${WORK_BAK_PATH}/*" -mx=${ZIP_LEVEL} >>$LOG_FILE 

show "正在压缩 日记 文件"
7z a -tzip -r "${RomPath}/AutoBuildLogs.zip" -pweihaisheng "${LOG_FILE}*" -mx=${ZIP_LEVEL} >>$LOG_FILE 

show "正在计算MD5文件"
fileMd5=`md5sum "${WORK_TMP_PATH}/${RomName}.tmp"`
fileName="${RomName}_${fileMd5:0:8}.zip"
mv "${WORK_TMP_PATH}/${RomName}.tmp" "${RomPath}/${fileName}"

show "正在移动最终文件到ROM目录"
path="${BASE_PATH}/../Q群：616490741/$DevicePathName"
mkdir -p "$path"
sudo rm -rf "${path}/${DeviceName^}_${RomVersion}"
mv -f "${RomPath}/" "${path}"

sudo rm -rf ${BASE_PATH}