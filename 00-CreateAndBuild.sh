#!/bin/bash
ROM_FILE=${1}									#ROM文件
ROM_BUILD_FILE=${2}								#ROM编译目录
if [ ! -n "$ROM_FILE" ] ; then echo "请传入ROM路径";exit;fi;
if [ ! -n "$ROM_BUILD_FILE" ] ; then ROM_BUILD_FILE=$$;fi;
ROM_BUILD_FILE="./11-Build_Temp/Hais_Build_Tools_$ROM_BUILD_FILE"

echo "创建编译目录：${ROM_BUILD_FILE}"
mkdir -p $ROM_BUILD_FILE
cp -rf ./0* ./$ROM_BUILD_FILE/
echo "开始编译：${ROM_FILE}"

cd ./$ROM_BUILD_FILE && 
sudo bash ./01-UnpackRom.sh ../../$ROM_FILE && 
sudo bash ./02-StartHMO.sh ../../$ROM_FILE &&
sudo bash ./03-BuildRom.sh ../../$ROM_FILE &&
echo "打包结束"