#!/bin/bash
SH_FILE=$(readlink -f "$0")			#脚本的文件
BASE_PATH=$(dirname $SH_FILE)		#脚本的目录
BINS=$BASE_PATH/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录


show ">>>>解压 ROM 到 $WORK_SRC_PATH"
7za x $ROM_FILE -o$WORK_TMP_PATH >$LOG_FILE
unImage system &
unImage vendor &
wait



mkdir -p $WORK_OUT_PATH

show ">>>>修复fs"
sed -i 's/\/system//' "$WORK_TMP_PATH/system_file_contexts"
sed -i 's/system\///' "$WORK_TMP_PATH/system_fs_config"



show ">>>>破解Boot.img"
rm -rf $WORK_SRC_PATH/system/system/recovery-from-boot.p
mv -f  $WORK_TMP_PATH/boot.img -t $BINS/boot/
$BINS/boot/unpackimg.sh >> $LOG_FILE
$BINS/boot/repackimg.sh >> $LOG_FILE
mv -f $BINS/boot/image-new.img $WORK_OUT_PATH/boot.img
bash $BINS/boot/cleanup.sh

show "分发文件到目录，结束解包流程"
rm -rf $WORK_TMP_PATH/system.img $WORK_TMP_PATH/vendor.img 
mv -f $WORK_TMP_PATH/system_file_contexts $WORK_TMP_PATH/system_fs_config -t $WORK_SRC_PATH/ 
mv -f $WORK_TMP_PATH/vendor_file_contexts $WORK_TMP_PATH/vendor_fs_config -t $WORK_SRC_PATH/ 
mv -f $WORK_TMP_PATH/system.patch.dat $WORK_TMP_PATH/vendor.patch.dat -t $WORK_OUT_PATH/ 
mv -f $WORK_TMP_PATH/firmware-update -t $WORK_SRC_PATH/ 
mv -f $WORK_TMP_PATH/META-INF -t $WORK_SRC_PATH/ 

