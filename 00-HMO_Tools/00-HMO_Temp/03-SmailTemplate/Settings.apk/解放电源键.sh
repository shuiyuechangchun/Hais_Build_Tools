SMALI_FILE='/smali/com/android/settings/KeySettingsSelectFragment.smali'			#文件路径
FIND_START='move v3, v2'								#解压后要查找的开始代码
FILE_END='if-ge v3, v1, :cond_1'																#解压后要查找的结束代码

#要替换的内容
#重要的是70-75行
REPLACE_CODE='
    move v3, v2
	
	
	const-string v4, "long_press_power_key"

    .line 30
    invoke-virtual {v0, v2, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V


    :goto_0
    if-ge v3, v1, :cond_1
'