#!/bin/bash
SH_FILE=$(readlink -f "$0")			#脚本的文件
BASE_PATH=$(dirname $SH_FILE)		#脚本的目录
BINS=$BASE_PATH/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录


#mkdir -p $WORK_SRC_PATH/system/system/app/ThemeManager/lib/
#cp -r $WORK_TMP_PATH/ThemeManager.apk/lib/arm64-v8a $WORK_SRC_PATH/system/system/app/ThemeManager/lib/arm64


bash $TOOLS_HMO_PATH/04-Smali.sh