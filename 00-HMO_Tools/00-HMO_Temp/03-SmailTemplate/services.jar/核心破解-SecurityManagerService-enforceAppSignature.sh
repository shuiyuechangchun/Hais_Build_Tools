SMALI_FILE="/smali_classes2/com/miui/server/SecurityManagerService.smali"						#文件路径
FIND_START='.method private enforceAppSignature(\[Landroid\/content\/pm\/Signature;Ljava\/lang\/String;Z)V'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method private enforceAppSignature([Landroid/content/pm/Signature;Ljava/lang/String;Z)V
    .locals 1

    return-void
.end method
'