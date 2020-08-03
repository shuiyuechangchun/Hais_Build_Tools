#!/bin/bash
BINS=$PWD/00-Bins				#依赖目录
source $BINS/_init_hais_tools_		#依赖目录
SMALI_TEMP=$TOOLS_HMO_TEMP/03-SmailTemplate			#Smail模板目录
ApkTools="java -jar $PWD/00-Bins/apktool.jar"
#ApkTools="java -jar -Xms512m -Xmx512m $PWD/00-Bins/apktool.jar"


#安装Framework框架
$ApkTools if $WORK_SRC_PATH/system/system/framework/framework-res.apk
$ApkTools if $WORK_SRC_PATH/system/system/framework/framework-ext-res/framework-ext-res.apk
$ApkTools if $WORK_SRC_PATH/system/system/app/miuisystem/miuisystem.apk
$ApkTools if $WORK_SRC_PATH/system/system/app/miui/miui.apk


#核心破解跟卡米  core-oj.jar framework.jar services.jar
doUnApk "/system/system/apex/com.android.runtime.release/javalib/core-oj.jar" "$SMALI_TEMP/core-oj.jar"
doUnApk "/system/system/framework/framework.jar" "$SMALI_TEMP/framework.jar"
doUnApk "/system/system/framework/services.jar" "$SMALI_TEMP/services.jar"
exit
#破解桌面 MiuiHome.apk
doUnApk "/system/system/priv-app/MiuiHome/MiuiHome.apk" "$SMALI_TEMP/MiuiHome.apk"

#开放电源键 Settings.jar
doUnApk "/system/system/product/priv-app/Settings/Settings.apk" "$SMALI_TEMP/Settings.apk"


#破解主题 ThemeManager.apk miuisystem.apk
doUnApk "/system/system/app/miuisystem/miuisystem.apk" "$SMALI_TEMP/miuisystem.apk"
doUnApk "/system/system/app/ThemeManager/ThemeManager.apk" "$SMALI_TEMP/ThemeManager.apk"
mkdir -p $WORK_SRC_PATH/system/system/app/ThemeManager/lib/
cp -r $WORK_TMP_PATH/ThemeManager.apk/lib/arm64-v8a $WORK_SRC_PATH/system/system/app/ThemeManager/lib/arm64



