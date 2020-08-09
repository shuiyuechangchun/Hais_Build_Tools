SMALI_FILE='/smali/android/content/pm/PackageParser$SigningDetails.smali'						#文件路径
FIND_START='.method public checkCapabilityRecover(Landroid\/content\/pm\/PackageParser$SigningDetails;I)Z'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method public checkCapabilityRecover(Landroid/content/pm/PackageParser$SigningDetails;I)Z
	.locals 8

    const v0, 0x1

    return v0
.end method
'