SMALI_FILE='/smali/com/android/server/pm/PackageManagerServiceInjector.smali'						#文件路径
FIND_START='.method private static isApkForbiddenToInstall(Ljava\/io\/File;)Z'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method private static isApkForbiddenToInstall(Ljava/io/File;)Z
    .locals 2

    const/4 v0, 0x0

    return v0
.end method
'