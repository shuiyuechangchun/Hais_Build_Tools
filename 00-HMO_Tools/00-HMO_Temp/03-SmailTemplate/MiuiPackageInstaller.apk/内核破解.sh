SMALI_FILE="/smali/com/android/packageinstaller/qa.smali"						#文件路径
FIND_START='.method public static a(Landroid\/content\/pm\/ApplicationInfo;)Z'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method public static a(Landroid/content/pm/ApplicationInfo;)Z
    .locals 1

    const/4 p0, 0x0

    return p0
.end method

'