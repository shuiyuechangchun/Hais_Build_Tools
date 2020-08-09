SMALI_FILE='/smali_classes2/com/android/server/wm/WindowSurfaceController.smali'						#文件路径
FIND_START='.method setSecure(Z)V'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method setSecure(Z)V
    .locals 1

    return-void
.end method

'