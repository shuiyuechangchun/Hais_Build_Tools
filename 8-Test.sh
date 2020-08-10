#!/bin/bash
SH_FILE=$(readlink -f "$0")			#脚本的文件
BASE_PATH=$(dirname $SH_FILE)		#脚本的目录
BINS=$BASE_PATH/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录
SMALI_TEMP=$TOOLS_HMO_TEMP/03-SmailTemplate			#Smail模板目录
ApkTools="java -jar $PWD/00-Bins/apktool.jar"



echo ""> $WORK_TMP_PATH/MiuiHome.apk/lib/arm64-v8a/libsdk_patcher_jni.so
7z a $WORK_SRC_PATH/system/system/priv-app/MiuiHome/MiuiHome.apk $WORK_TMP_PATH/MiuiHome.apk/lib/arm64-v8a/libsdk_patcher_jni.so