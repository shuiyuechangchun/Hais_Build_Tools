SMALI_FILE="/smali/miui/drm/DrmManager.smali"						#文件路径
FIND_START='.method public static isLegal'					#解压后要查找的开始代码,匹配第一个
FILE_END='.method private static nodeToString'																	#解压后要查找的结束代码

#要替换的内容,主要是修改 const-string v1, "content_center"
REPLACE_CODE='
.method public static isLegal(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)Lmiui/drm/DrmManager$DrmResult;
    .locals 1

    sget-object v0, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object v0
.end method

.method public static isLegal(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Lmiui/drm/DrmManager$DrmResult;
    .locals 1

    sget-object v0, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object v0
.end method

.method private static isLegal(Landroid/content/Context;Ljava/lang/String;Lmiui/drm/DrmManager$RightObject;)Lmiui/drm/DrmManager$DrmResult;
    .locals 1

    sget-object v0, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object v0
.end method

.method public static isPermanentRights(Ljava/io/File;)Z
    .locals 8

    const/4 v0, 0x1

    return v0
.end method

.method private static isPermanentRights(Lmiui/drm/DrmManager$RightObject;)Z
    .locals 8

    const/4 v0, 0x1

    return v0
.end method

.method private static isRightsFileLegal(Ljava/io/File;)Z
    .locals 8

    const/4 v0, 0x1

    return v0
.end method

.method public static isSupportAd(Landroid/content/Context;)Z
    .locals 8

    const/4 v0, 0x0

    return v0
.end method

.method public static isSupportAd(Ljava/io/File;)Z
    .locals 8

    const/4 v0, 0x0

    return v0
.end method

.method private static nodeToString(Lorg/w3c/dom/Node;)Ljava/lang/String;
'