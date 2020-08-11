SMALI_FILE="/smali/com/android/org/conscrypt/OpenSSLSignature.smali"						#文件路径
FIND_START='.method protected engineVerify(\[B)Z'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method protected engineVerify([B)Z
    .locals 4

    const v0, 0x1

    return v0
.end method
'