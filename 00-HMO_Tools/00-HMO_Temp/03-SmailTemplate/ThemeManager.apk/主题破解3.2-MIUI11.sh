SMALI_FILE="/smali/com/android/thememanager/detail/theme/model/OnlineResourceDetail.smali"						#文件路径

DEFAULT_CODE='iget-boolean v0, v0, Lcom/android/thememanager/detail/theme/model/OnlineResourceDetail;->bought:Z'	#旧代码

#要替换的内容
REPLACE_CODE='const/4 v0, 0x1'