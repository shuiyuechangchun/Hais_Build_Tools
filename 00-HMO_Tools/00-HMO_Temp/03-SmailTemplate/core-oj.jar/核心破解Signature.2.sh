SMALI_FILE="/smali/java/security/Signature.smali"						#文件路径
FIND_START='.method public final verify(\[B)Z'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method public final verify([B)Z
    .locals 2
	
    const/4 v0, 0x1
	
    return v0
.end method	
'