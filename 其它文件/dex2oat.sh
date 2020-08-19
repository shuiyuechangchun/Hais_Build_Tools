#!/bin/bash
apkFile="/system/framework/framework.jar"
apkExtPath="/sdcard/HaisApkDex/${apkFile}_"
rm -rf $apkExtPath
mkdir -p $apkExtPath
unzip -d $apkExtPath "${apkFile}"
rm -rf $apkFile
dex2oat --dex-file=$apkExtPath/classes.dex --dex-file=$apkExtPath/classes2.dex --dex-file=$apkExtPath/classes3.dex --dex-file=$apkExtPath/classes4.dex --compiler-filter=everything --instruction-set=arm64 --oat-file=$apkFile
rm -rf $0