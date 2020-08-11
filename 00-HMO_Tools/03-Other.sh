#!/bin/bash
BINS=$PWD/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录


show "优化 build.prop 文件"
OthorFiles=$TOOLS_HMO_TEMP/02-OthorFiles	#文件来源目录
SYS_FILE=/system/system/build.prop	#系统文件所在路径
mergeEndBack $SYS_FILE $OthorFiles/system.prop
sed -i '/ro.build.version.min_supported_target_sdk=23/d' $WORK_SRC_PATH/$SYS_FILE


show "优化 prop.default 文件"
OthorFiles=$TOOLS_HMO_TEMP/02-OthorFiles	#文件来源目录
SYS_FILE=/system/system/etc/prop.default	#系统文件所在路径
mergeEndBack $SYS_FILE $OthorFiles/prop.default
#修改编译模式
sed -i '/pm.dexopt.first-boot=quicken/d' $WORK_SRC_PATH/$SYS_FILE
sed -i '/pm.dexopt.boot=verify/d' $WORK_SRC_PATH/$SYS_FILE
sed -i '/pm.dexopt.install=speed-profile/d' $WORK_SRC_PATH/$SYS_FILE
sed -i '/pm.dexopt.bg-dexopt=speed-profile/d' $WORK_SRC_PATH/$SYS_FILE
sed -i '/pm.dexopt.ab-ota=speed-profile/d' $WORK_SRC_PATH/$SYS_FILE
sed -i '/pm.dexopt.inactive=verify/d' $WORK_SRC_PATH/$SYS_FILE
sed -i '/pm.dexopt.shared=speed/d' $WORK_SRC_PATH/$SYS_FILE
#杂七杂八
sed -i '/ro.secureboot.devicelock=1/d' $WORK_SRC_PATH/$SYS_FILE
sed -i '/persist.sys.usb.config=none/d' $WORK_SRC_PATH/$SYS_FILE
sed -i '/ro.secure=1/d' $WORK_SRC_PATH/$SYS_FILE



show "关闭日记文件"
OthorFiles=$TOOLS_HMO_TEMP/02-OthorFiles	#文件来源目录
SYS_FILE=/vendor/bin/init.qcom.post_boot.sh	#系统文件所在路径
mergeEndBack $SYS_FILE $OthorFiles/init.qcom.post_boot.sh

show "关闭WIFI日记文件"
for file in `find ${OthorFiles}/init.qcom.rc/* -type f` ;do
	doInsert $file $WORK_SRC_PATH
done


show "添加第三方WebView支持（需要置入WebView）"
OthorFiles=$TOOLS_HMO_TEMP/02-OthorFiles/framework-res.apk
SYS_FILE=/system/system/framework/framework-res.apk	#系统文件所在路径
cd $OthorFiles
zip -u $WORK_SRC_PATH$SYS_FILE "res/xml/config_webview_packages.xml"
cd $BASE_PATH


Device=$(getProp "ro.product.system.device")
ZipTemplateFiles=$TOOLS_HMO_TEMP/04-ZipTemplate/	#文件来源目录
show "添加Hais脚本"
replaceBack "$ZipTemplateFiles/0-base/META-INF/." "$WORK_SRC_PATH/META-INF/"
show "替换 ${Device} 刷机脚本"
replaceBack "$ZipTemplateFiles/$Device/META-INF/." "$WORK_SRC_PATH/META-INF/"
replaceBack "$ZipTemplateFiles/$Device/firmware-update/." "$WORK_SRC_PATH/firmware-update/"
