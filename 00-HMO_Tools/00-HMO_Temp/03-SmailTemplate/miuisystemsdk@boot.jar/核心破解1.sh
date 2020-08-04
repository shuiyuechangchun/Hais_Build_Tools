SMALI_FILE="/smali/miui/drm/DrmManager.smali"						#文件路径
FIND_START='.method public static isLegal(Landroid\/content\/Context;Ljava\/io\/File;Ljava\/io\/File;)Lmiui\/drm\/DrmManager$DrmResult;'								#解压后要查找的开始代码
FILE_END='.method public static isPermanentRights(Ljava\/io\/File;)Z'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method public static isLegal(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)Lmiui/drm/DrmManager$DrmResult;
    .locals 0

    sget-object p0, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object p0
.end method

.method public static isLegal(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Lmiui/drm/DrmManager$DrmResult;
    .locals 0

    sget-object p0, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object p0
.end method

.method private static isLegal(Landroid/content/Context;Ljava/lang/String;Lmiui/drm/DrmManager$RightObject;)Lmiui/drm/DrmManager$DrmResult;
    .locals 0

    sget-object p0, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object p0
.end method

.method public static isPermanentRights(Ljava/io/File;)Z
'