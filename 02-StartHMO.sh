#!/bin/bash
SH_FILE=$(readlink -f "$0")			#脚本的文件
BASE_PATH=$(dirname $SH_FILE)		#脚本的目录
BINS=$BASE_PATH/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录


show "----------------开始执行 精简/替换 脚本----------------"
rm -rf $WORK_BAK_PATH
mkdir $WORK_BAK_PATH

show ">>>>正在 删除和精简 文件"
bash $TOOLS_HMO_PATH/01-DeleteFiles.sh  >>$LOG_FILE

show ">>>>正在 替换和增加 文件"
bash $TOOLS_HMO_PATH/02-Replace.sh >>$LOG_FILE

show ">>>>正在 执行其它 优化"
bash $TOOLS_HMO_PATH/03-Other.sh

show ">>>>正在 进行插桩 破解"
bash $TOOLS_HMO_PATH/04-Smali.sh