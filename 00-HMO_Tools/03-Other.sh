#!/bin/bash
BINS=$PWD/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录


show "优化 build.prop 文件"
OthorFiles=$TOOLS_HMO_TEMP/02-OthorFiles	#文件来源目录
SYS_FILE=/system/system/build.prop	#系统文件所在路径
mergeEndBack $SYS_FILE $OthorFiles/system.prop


show "关闭日记文件"
OthorFiles=$TOOLS_HMO_TEMP/02-OthorFiles	#文件来源目录
SYS_FILE=/vendor/bin/init.qcom.post_boot.sh	#系统文件所在路径
mergeEndBack $SYS_FILE $OthorFiles/init.qcom.post_boot.sh


show "添加第三方WebView支持（需要置入WebView）"
OthorFiles=$TOOLS_HMO_TEMP/02-OthorFiles/framework-res.apk
SYS_FILE=/system/system/framework/framework-res.apk	#系统文件所在路径
cd $OthorFiles
zip -u $WORK_SRC_PATH$SYS_FILE "res/xml/config_webview_packages.xml"
cd $BASE_PATH


show "替换刷机脚本"
ZipTemplateFiles=$TOOLS_HMO_TEMP/04-ZipTemplate	#文件来源目录

replaceBack "$ZipTemplateFiles/META-INF/." "$WORK_SRC_PATH/META-INF/"
replaceBack "$ZipTemplateFiles/firmware-update/." "$WORK_SRC_PATH/firmware-update/"
