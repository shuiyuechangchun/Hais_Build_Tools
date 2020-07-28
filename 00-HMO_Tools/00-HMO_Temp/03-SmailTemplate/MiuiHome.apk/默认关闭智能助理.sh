SMALI_FILE="/smali/com/miui/home/launcher/Launcher.smali"						#文件路径
FIND_START='.method private updateAssistantOpen()V'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容,主要是修改 const/4 v1, 0x0
REPLACE_CODE='
.method private updateAssistantOpen()V
    .registers 3

    const-string v0, "open_personal_assistant"

    const/4 v1, 0x0

    .line 3374
    invoke-static {p0, v0, v1}, Lcom/miui/launcher/utils/LauncherUtils;->getBooleanValueFromMiuiSettings(Landroid/content/Context;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/home/launcher/Launcher;->mAssistantOpen:Z

    return-void
.end method

'