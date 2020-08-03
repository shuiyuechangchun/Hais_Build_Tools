SMALI_FILE="/smali/com/android/server/SystemServerInjector.smali"						#文件路径
FIND_START='.method static addDeviceName(Ljava\/lang\/String;)V'					#解压后要查找的开始代码
FILE_END='.end method'													#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method private checkSafeMediaVolume(III)Z
    .locals 3

	return-void
.end method
'