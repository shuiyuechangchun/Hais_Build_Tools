SMALI_FILE="/smali/com/miui/home/launcher/MiuiHomeLog.smali"						#文件路径
FIND_START='.method public static init(Landroid\/content\/Context;)V'				#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容,主要是修改 const-string v1, "content_center"
REPLACE_CODE='
.method public static init(Landroid/content/Context;)V
    .registers 3

    const-string v0, "is_miui_home_debug_log_enable"

    const p0, 0x0

    move-result p0

    sput-boolean p0, Lcom/miui/home/launcher/MiuiHomeLog;->sIsDebugLogEnable:Z

    return-void
.end method
'