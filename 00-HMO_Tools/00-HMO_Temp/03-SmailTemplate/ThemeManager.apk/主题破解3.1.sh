SMALI_FILE="/smali_classes2/com/android/thememanager/module/detail/presenter/OnlineResourceDetailPresenter.smali"						#文件路径
DEFAULT_CODE='iget v0, v0, Lcom/android/thememanager/detail/theme/model/OnlineResourceDetail;->productPrice:I'	#旧代码

#要替换的内容
REPLACE_CODE='
	const/4 v0, 0x1
	return v0
'