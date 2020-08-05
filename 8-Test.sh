#!/bin/bash
SH_FILE=$(readlink -f "$0")			#脚本的文件
BASE_PATH=$(dirname $SH_FILE)		#脚本的目录
BINS=$BASE_PATH/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录
SMALI_TEMP=$TOOLS_HMO_TEMP/03-SmailTemplate			#Smail模板目录
ApkTools="java -jar $PWD/00-Bins/apktool.jar"

DeviceName=$(getProp "ro.product.system.device")
if [ "$DeviceName" == "raphael" ]; then DevicePathName="RedMi_K20P_Raphael" ; fi
if [ "$DeviceName" == "cepheus" ]; then DevicePathName="XiaoMi_Mi9_Cepheus" ; fi
if [ "$DeviceName" == "dipper" ]; then DevicePathName="XiaoMi_Mi8_Dipper" ; fi
if [ "$DeviceName" == "polaris" ]; then DevicePathName="XiaoMi_Mix2s_Polaris" ; fi

echo "${DeviceName}目录${DevicePathName}"

clean