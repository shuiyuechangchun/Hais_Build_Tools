SMALI_FILE='/smali/com/android/settings/KeySettingsSelectFragment.smali'			#文件路径
FIND_START='.method public onActivityCreated(Landroid'								#解压后要查找的开始代码
FILE_END='.end method'																#解压后要查找的结束代码

#要替换的内容
#重要的是70-75行
REPLACE_CODE='
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 8

    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    const p1, 0x7f1500b0

    invoke-virtual {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->addPreferencesFromResource(I)V

    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->resources:Landroid/content/res/Resources;

    invoke-virtual {p0}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/settings/KeySettingsSelectFragment;->resources:Landroid/content/res/Resources;

    const v1, 0x7f120cf0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, ":settings:show_fragment_title"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mTitle:Ljava/lang/String;

    :cond_0
    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->resources:Landroid/content/res/Resources;

    const v0, 0x7f0300e7

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2
	
	
	const-string v4, "long_press_power_key"

    .line 30
    invoke-virtual {v0, v2, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V


    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, p1, v3

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0}, Lcom/android/settings/KeySettingsSelectFragment;->j(Ljava/util/ArrayList;)V

    const-string p1, "key_gesture_function_preview"

    invoke-virtual {p0, p1}, Landroidx/preference/q;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lcom/android/settings/KeySettingsPreviewPreference;

    iput-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Kg:Lcom/android/settings/KeySettingsPreviewPreference;

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mPreferenceKey:Ljava/lang/String;

    const-string v1, "dump_log"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "key_gesture_function_category"

    invoke-virtual {p0, p1}, Landroidx/preference/q;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Landroidx/preference/PreferenceCategory;

    iput-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Ig:Landroidx/preference/PreferenceCategory;

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Ig:Landroidx/preference/PreferenceCategory;

    iget-object v1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Kg:Lcom/android/settings/KeySettingsPreviewPreference;

    invoke-virtual {p1, v1}, Landroidx/preference/PreferenceGroup;->q(Landroidx/preference/Preference;)Z

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Ig:Landroidx/preference/PreferenceCategory;

    const v1, 0x7f1208ed

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setTitle(I)V

    new-instance p1, Lcom/android/settingslib/miuisettings/preference/ValuePreference;

    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->Rd()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Lcom/android/settingslib/miuisettings/preference/ValuePreference;-><init>(Landroid/content/Context;)V

    const v1, 0x7f1208ec

    invoke-virtual {p1, v1}, Landroidx/preference/Preference;->setSummary(I)V

    invoke-virtual {p1, v2}, Lcom/android/settingslib/miuisettings/preference/ValuePreference;->setShowRightArrow(Z)V

    invoke-virtual {p1, v2}, Landroidx/preference/Preference;->setSelectable(Z)V

    iget-object v1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Ig:Landroidx/preference/PreferenceCategory;

    invoke-virtual {v1, p1}, Landroidx/preference/PreferenceGroup;->o(Landroidx/preference/Preference;)Z

    :cond_2
    const-string p1, "key_gesture_function_optional"

    invoke-virtual {p0, p1}, Landroidx/preference/q;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lmiuix/preference/RadioButtonPreferenceCategory;

    iput-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Jg:Lmiuix/preference/RadioButtonPreferenceCategory;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const-string v1, "key_none"

    const-string v3, "three_gesture_long_press"

    const-string v4, "long_press_power_key"

    const/4 v5, 0x1

    if-eqz v0, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v6, Lmiuix/preference/RadioButtonPreference;

    invoke-virtual {p0}, Lcom/android/settings/core/InstrumentedPreferenceFragment;->Rd()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Lmiuix/preference/RadioButtonPreference;-><init>(Landroid/content/Context;)V

    const v7, 0x7f0d0176

    invoke-virtual {v6, v7}, Landroidx/preference/Preference;->setLayoutResource(I)V

    invoke-virtual {v6, v0}, Landroidx/preference/Preference;->setKey(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v3, p0, Lcom/android/settings/KeySettingsSelectFragment;->resources:Landroid/content/res/Resources;

    const v4, 0x7f120e4e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v6, v3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_2

    :cond_4
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/android/settings/KeySettingsSelectFragment;->resources:Landroid/content/res/Resources;

    const v4, 0x7f1219a9

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Landroidx/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_2

    :cond_5
    iget-object v3, p0, Lcom/android/settings/KeySettingsSelectFragment;->resources:Landroid/content/res/Resources;

    iget-object v4, p0, Lcom/android/settings/KeySettingsSelectFragment;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "string"

    invoke-virtual {v3, v0, v5, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v6, v3}, Landroidx/preference/Preference;->setTitle(I)V

    :goto_2
    invoke-virtual {v6, v2}, Landroidx/preference/Preference;->setPersistent(Z)V

    iget-object v3, p0, Lcom/android/settings/KeySettingsSelectFragment;->mContext:Landroid/content/Context;

    invoke-static {v3, v0}, Landroid/provider/MiuiSettings$Key;->getKeyAndGestureShortcutFunction(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/android/settings/KeySettingsSelectFragment;->Jg:Lmiuix/preference/RadioButtonPreferenceCategory;

    invoke-virtual {v4, v6}, Lmiuix/preference/RadioButtonPreferenceCategory;->o(Landroidx/preference/Preference;)Z

    iget-object v4, p0, Lcom/android/settings/KeySettingsSelectFragment;->mPreferenceKey:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    iput-object v6, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    :cond_6
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    if-nez v0, :cond_3

    iput-object v6, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    goto/16 :goto_1

    :cond_7
    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "force_fsg_nav_bar"

    invoke-static {p1, v0}, Landroid/provider/MiuiSettings$Global;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    const-string v0, "double_click_power_key"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    const-string v0, "three_gesture_down"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    invoke-virtual {p1}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    iput-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Lg:Lmiuix/preference/RadioButtonPreference;

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Jg:Lmiuix/preference/RadioButtonPreferenceCategory;

    invoke-virtual {p1}, Landroidx/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    sub-int/2addr v0, v5

    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->getPreference(I)Landroidx/preference/Preference;

    move-result-object p1

    check-cast p1, Lmiuix/preference/RadioButtonPreference;

    iput-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    :cond_8
    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Jg:Lmiuix/preference/RadioButtonPreferenceCategory;

    iget-object v0, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    invoke-virtual {p1, v0}, Lmiuix/preference/RadioButtonPreferenceCategory;->t(Landroidx/preference/Preference;)V

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Kg:Lcom/android/settings/KeySettingsPreviewPreference;

    iget-object v0, p0, Lcom/android/settings/KeySettingsSelectFragment;->mPreferenceKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/android/settings/KeySettingsPreviewPreference;->va(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->Kg:Lcom/android/settings/KeySettingsPreviewPreference;

    iget-object v0, p0, Lcom/android/settings/KeySettingsSelectFragment;->mRadioButtonPreference:Lmiuix/preference/RadioButtonPreference;

    invoke-virtual {v0}, Landroidx/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/settings/KeySettingsPreviewPreference;->ua(Ljava/lang/String;)V

    new-instance p1, Lcom/android/settings/rd;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    invoke-direct {p1, p0, v0}, Lcom/android/settings/rd;-><init>(Lcom/android/settings/KeySettingsSelectFragment;Landroid/os/Handler;)V

    iput-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mContentObserver:Landroid/database/ContentObserver;

    iget-object p1, p0, Lcom/android/settings/KeySettingsSelectFragment;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v0, "long_press_power_launch_xiaoai"

    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-object p0, p0, Lcom/android/settings/KeySettingsSelectFragment;->mContentObserver:Landroid/database/ContentObserver;

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v2, p0, v1}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    return-void
.end method
'