SMALI_FILE="/smali_classes2/com/miui/server/SecurityManagerService.smali"						#文件路径
FIND_START='.method private enforcePlatformSignature(\[Landroid\/content\/pm\/Signature;)V'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method private enforcePlatformSignature([Landroid/content/pm/Signature;)V
    .locals 1

    return-void
.end method
'