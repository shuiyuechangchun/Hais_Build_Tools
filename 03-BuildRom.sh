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


#开始打包ROM
show "正在打包 ${DeviceName}_${RomVersion}"
RomPath=$WORK_ROM_PATH/$DevicePathName/${DeviceName^}_${RomVersion}
rm -rf $RomPath
mkdir -p $RomPath

RomName="Hais@${DeviceName^}_${RomVersion}"
7z a -tzip -r "${WORK_TMP_PATH}/${RomName}.tmp" "${WORK_OUT_PATH}/*" -mx=${ZIP_LEVEL}  | tee -a $LOG_FILE

fileMd5=`md5sum "${WORK_TMP_PATH}/${RomName}.tmp"`
fileName="${RomName}_${fileMd5:0:8}.zip"
mv "${WORK_TMP_PATH}/${RomName}.tmp" "${RomPath}/${fileName}"

bash ./04-CreateMagisk.sh $DevicePathName
#复制日记
mkdir -p "${RomPath}/log"
mv ${LOG_FILE}* ${RomPath}/log
#复制备份文件
mv "${WORK_BAK_PATH}" "${RomPath}"
#统一移动
mv "${WORK_ROM_PATH}" "../"
cd ../
#sudo rm -rf ${BASE_PATH}




#python3 ../cloud189/main.py upload $WORK_ROM_PATH


curl https://sc.ftqq.com/SCU41677T94c1f08c9520275c79b20c3a0da68e345c400a38e0d95.send -X POST -d "text=打包结束：${DeviceName}_${RomVersion}"













exit

echo "正在上传：$fileName"
RomInfo=$(python3 ./00-Bins/wss.py upload "$fileName")
curl https://sc.ftqq.com/SCU41677T94c1f08c9520275c79b20c3a0da68e345c400a38e0d95.send -X POST -d "text=打包结束：${DeviceName}_${RomVersion}&desp=${updateInfo}"
exit

#加密Zip包
#java -jar $curPath/bin/ZipCenOp.jar e $fileName
