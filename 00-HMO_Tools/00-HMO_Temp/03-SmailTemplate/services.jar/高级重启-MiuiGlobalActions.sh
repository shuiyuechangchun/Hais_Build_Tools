SMALI_FILE='/smali/com/android/server/policy/MiuiGlobalActions$1.smali'						#文件路径
DEFAULT_CODE='.method public onCommand(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/String;)V'	#旧代码

#要替换的内容
REPLACE_CODE='
.method public onCommand(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/String;)V
    .locals 4

    const/4 v1, 0x0

    const-string v0, "airplane"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/server/policy/MiuiGlobalActions$1;->this$0:Lcom/android/server/policy/MiuiGlobalActions;

    const/16 v1, 0x9

    invoke-static {v0, v1}, Lcom/android/server/policy/MiuiGlobalActions;->access$000(Lcom/android/server/policy/MiuiGlobalActions;I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string/jumbo v0, "silent"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/server/policy/MiuiGlobalActions$1;->this$0:Lcom/android/server/policy/MiuiGlobalActions;

    const/4 v1, 0x5

    invoke-static {v0, v1}, Lcom/android/server/policy/MiuiGlobalActions;->access$000(Lcom/android/server/policy/MiuiGlobalActions;I)V

    goto :goto_0

    :cond_2
    const-string/jumbo v0, "reboot"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :try_start_0
    invoke-static {}, Lcom/android/server/policy/MiuiGlobalActions;->access$100()Landroid/os/IPowerManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/os/IPowerManager;->reboot(ZLjava/lang/String;Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0

    :cond_3
    const-string/jumbo v0, "recovery"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :try_start_1
    invoke-static {}, Lcom/android/server/policy/MiuiGlobalActions;->access$100()Landroid/os/IPowerManager;

    move-result-object v0

    const/4 v1, 0x0

    const-string/jumbo v2, "recovery"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/os/IPowerManager;->reboot(ZLjava/lang/String;Z)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :cond_4
    const-string v0, "bootloader"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    :try_start_2
    invoke-static {}, Lcom/android/server/policy/MiuiGlobalActions;->access$100()Landroid/os/IPowerManager;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "bootloader"

    const/4 v3, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/os/IPowerManager;->reboot(ZLjava/lang/String;Z)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    :catch_2
    move-exception v0

    goto :goto_0

    :cond_5
    const-string/jumbo v0, "shutdown"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    new-instance v0, Lcom/android/server/policy/MiuiGlobalActions$1$1;

    const-string v1, "ShutdownThread"

    invoke-direct {v0, p0, v1}, Lcom/android/server/policy/MiuiGlobalActions$1$1;-><init>(Lcom/android/server/policy/MiuiGlobalActions$1;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/android/server/policy/MiuiGlobalActions$1$1;->start()V

    goto :goto_0

    :cond_6
    const-string v0, "dismiss"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/policy/MiuiGlobalActions$1;->this$0:Lcom/android/server/policy/MiuiGlobalActions;

    invoke-static {v0}, Lcom/android/server/policy/MiuiGlobalActions;->access$200(Lcom/android/server/policy/MiuiGlobalActions;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method public onCommand$Pr(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/String;)V
'