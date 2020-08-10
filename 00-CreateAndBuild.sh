#!/bin/bash
ROM_FILE=${1}									#ROM文件
IS_ZIP=${2}										#是否极限压缩,1-9
if [ ! -n "$ROM_FILE" ] ; then echo "请传入ROM路径";exit;fi;
if [ ! -n "$IS_ZIP" ] ; then IS_ZIP=1;fi;
ROM_BUILD_FILE="./11-Build_Temp/Hais_Build_Tools_${1##*/}"

#开始做准备工作
sudo chmod 0777 *
sudo chmod 0777 ./00-Bins/*
sudo chmod 0777 ./00-Bins/boot/*

printf "\033c"
echo "正在清理坟墓，请耐心等待~~~"
sudo rm -rf $ROM_BUILD_FILE
echo "创建编译目录：${ROM_BUILD_FILE}"
mkdir -p $ROM_BUILD_FILE
mkdir -p ${ROM_BUILD_FILE}/11-TempWork 
cp -rf ./0* ./$ROM_BUILD_FILE/
sed -i "s/ZIP_LEVEL=1/ZIP_LEVEL=${IS_ZIP}/" $ROM_BUILD_FILE/00-Bins/_init_hais_tools_
echo "开始0${IS_ZIP}级编译：${ROM_FILE}"

cd ./$ROM_BUILD_FILE && 
sudo bash ./01-UnpackRom.sh ../../$ROM_FILE && 
sudo bash ./02-StartHMO.sh ../../$ROM_FILE &&
sudo bash ./03-BuildRom.sh ../../$ROM_FILE &&
echo "打包结束"