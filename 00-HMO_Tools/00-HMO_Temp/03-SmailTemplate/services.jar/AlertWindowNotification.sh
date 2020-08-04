SMALI_FILE='/smali_classes2/com/android/server/wm/AlertWindowNotification.smali'						#文件路径
FIND_START='.method private onPostNotification()V'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method private onPostNotification()V
    .locals 11
	return-void
.end method
'