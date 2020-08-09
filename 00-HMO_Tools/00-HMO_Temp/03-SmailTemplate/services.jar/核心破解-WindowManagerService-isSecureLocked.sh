SMALI_FILE='/smali_classes2/com/android/server/wm/WindowManagerService.smali'						#文件路径
FIND_START='.method isSecureLocked(Lcom\/android\/server\/wm\/WindowState;)Z'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method isSecureLocked(Lcom/android/server/wm/WindowState;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
'