#!/bin/bash
SH_FILE=$(readlink -f "$0")			#脚本的文件
BASE_PATH=$(dirname $SH_FILE)		#脚本的目录
ROM_FILE=${1}									#ROM文件
IS_ZIP=${2}										#是否极限压缩,1-9
if [ ! -n "$ROM_FILE" ] ; then echo "请传入ROM路径";exit;fi;
if [ ! -n "$IS_ZIP" ] ; then IS_ZIP=1;fi;
ROM_BUILD_FILE="./11-Build_Temp/Build_${1##*/}"

#开始做准备工作
chmod 0777 *
chmod 0777 ./00-Bins/*
chmod 0777 ./00-Bins/boot/*

printf "\033c"
echo ">正在清理坟墓，请耐心等待~~~"
rm -rf $ROM_BUILD_FILE
echo ">创建编译目录：${ROM_BUILD_FILE}"
mkdir -p $ROM_BUILD_FILE
mkdir -p ${ROM_BUILD_FILE}/11-TempWork 
cp -rf ./0* ./$ROM_BUILD_FILE/
sed -i "s/ZIP_LEVEL=1/ZIP_LEVEL=${IS_ZIP}/" $ROM_BUILD_FILE/00-Bins/_init_hais_tools_
echo ">开始0${IS_ZIP}级编译：${ROM_FILE}"


cd ./$ROM_BUILD_FILE
bash ./01-UnpackRom.sh ../../$ROM_FILE
bash ./02-StartHMO.sh ../../$ROM_FILE
bash ./03-BuildRom.sh ../../$ROM_FILE
cd $BASE_PATH


#echo ">打包结束，正在上传文件"
#../cloud189/main.py upload "./11-Build_Temp/Q群：616490741"
#curl https://sc.ftqq.com/SCU41677T94c1f08c9520275c79b20c3a0da68e345c400a38e0d95.send -X POST -d "text=打包结束：${1##*/}"