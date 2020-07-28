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

#重命名
mkdir -p $WORK_ROM_PATH
show "正在打包Rom"
cd $WORK_OUT_PATH
RomName=${WORK_ROM_PATH}/HaisTeam@$(getProp "ro.product.system.device")_$(getProp "ro.system.build.version.incremental")
7z a -tzip -r "$RomName" "${WORK_OUT_PATH}/*" -mx=9  | tee -a $LOG_FILE
#zip -qr $RomName *
cd $curPath
fileMd5=`md5sum $RomName`
fileName="${RomName}_${fileMd5:0:8}.zip"
mv $RomName $fileName
echo "输出包：$fileName"
exit
clean

#加密Zip包
#java -jar $curPath/bin/ZipCenOp.jar e $fileName
