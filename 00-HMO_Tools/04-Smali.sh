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


#破解桌面 MiuiHome.apk
doUnApk "/system/system/priv-app/MiuiHome/MiuiHome.apk" "$SMALI_TEMP/MiuiHome.apk"

#开放电源键 Settings.jar
doUnApk "/system/system/product/priv-app/Settings/Settings.apk" "$SMALI_TEMP/Settings.apk"

#破解卡米 services.jar
doUnApk "/system/system/framework/services.jar" "$SMALI_TEMP/services.jar"

#破解主题 ThemeManager.apk miuisystem.apk
#doUnApk "/system/system/app/miuisystem/miuisystem.apk" "$SMALI_TEMP/miuisystem.apk"
doUnApk "/system/system/app/ThemeManager/ThemeManager.apk" "$SMALI_TEMP/ThemeManager.apk"



