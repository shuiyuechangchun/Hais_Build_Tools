SMALI_FILE='/smali/com/android/server/am/ServiceRecord$1.smali'						#文件路径
DEFAULT_CODE='invoke-virtual {v6}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;'	#旧代码

#要替换的内容
REPLACE_CODE='
	invoke-virtual {v6}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;
	return-void
'