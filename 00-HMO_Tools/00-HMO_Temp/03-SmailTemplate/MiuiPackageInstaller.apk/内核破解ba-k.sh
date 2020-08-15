SMALI_FILE="/smali/com/android/packageinstaller/b/a.smali"						#文件路径
FIND_START='.method public k()Z'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method public k()Z
    .locals 1

    const v0, 0x0

    return v0
.end method

'