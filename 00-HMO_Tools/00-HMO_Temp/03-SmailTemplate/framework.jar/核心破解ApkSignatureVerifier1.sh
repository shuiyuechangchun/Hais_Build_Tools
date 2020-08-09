SMALI_FILE="/smali_classes2/android/util/apk/ApkSignatureVerifier.smali"						#文件路径
DEFAULT_CODE='invoke-static {v1, v3}, Landroid/util/apk/ApkSignatureVerifier;->verifyV1Signature(Ljava/lang/String;Z)Landroid/content/pm/PackageParser$SigningDetails;'	#旧代码

#要替换的内容
REPLACE_CODE='
	const v3, 0x0

    invoke-static  {v1, v3}, Landroid/util/apk/ApkSignatureVerifier;->verifyV1Signature(Ljava/lang/String;Z)Landroid/content/pm/PackageParser$SigningDetails;
'