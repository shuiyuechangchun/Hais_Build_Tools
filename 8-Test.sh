#!/bin/bash
SH_FILE=$(readlink -f "$0")			#脚本的文件
BASE_PATH=$(dirname $SH_FILE)		#脚本的目录
BINS=$BASE_PATH/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录

#clean
#bash $TOOLS_HMO_PATH/03-Other.sh
echo "正在上传文件..."
fileName="/root/Hais_Build_Tools/90-RomFile/Hais@Raphael_MIUI_20.7.30_95bd973f.img"
updateInfo=$(python3 ./00-Bins/wss.py upload "$fileName")
echo -en $updateInfo
exit
curl https://sc.ftqq.com/SCU41677T94c1f08c9520275c79b20c3a0da68e345c400a38e0d95.send -X POST -d "text=${fileName}&desp=${updateInfo}"
exit
clean