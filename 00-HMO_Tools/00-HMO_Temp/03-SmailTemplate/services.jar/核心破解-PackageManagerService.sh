SMALI_FILE='/smali/com/android/server/pm/PackageManagerService.smali'						#文件路径
FIND_START='.method private static checkDowngrade(Landroid\/content\/pm\/PackageParser$Package;Landroid\/content\/pm\/PackageInfoLite;)V'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method private static checkDowngrade(Landroid/content/pm/PackageParser$Package;Landroid/content/pm/PackageInfoLite;)V
    .locals 8

    return-void
.end method
'