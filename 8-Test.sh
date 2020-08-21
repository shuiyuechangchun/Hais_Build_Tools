#!/bin/bash
SH_FILE=$(readlink -f "$0")			#脚本的文件
BASE_PATH=$(dirname $SH_FILE)		#脚本的目录
BINS=$BASE_PATH/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录
SMALI_TEMP=$TOOLS_HMO_TEMP/03-SmailTemplate			#Smail模板目录
ApkTools="java -jar $PWD/00-Bins/apktool.jar"



bash ./01-UnpackRom.sh ../../$ROM_FILE


show ">>>>>>关闭WIFI日记文件"
for file in `find ${OthorFiles}/init.qcom.rc/* -type f` ;do
	doInsert $file $WORK_SRC_PATH
done
