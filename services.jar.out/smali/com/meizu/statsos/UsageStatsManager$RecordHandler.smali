.class Lcom/meizu/statsos/UsageStatsManager$RecordHandler;
.super Landroid/os/Handler;
.source "UsageStatsManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/meizu/statsos/UsageStatsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecordHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/meizu/statsos/UsageStatsManager;


# direct methods
.method public constructor <init>(Lcom/meizu/statsos/UsageStatsManager;Landroid/os/Looper;)V
    .locals 0
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    iput-object p1, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    :try_start_0
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v6

    .local v6, "data":Landroid/os/Bundle;
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # getter for: Lcom/meizu/statsos/UsageStatsManager;->mUsageStatsManager:Lcom/meizu/statsos/IUsageStatsManager;
    invoke-static {v0}, Lcom/meizu/statsos/UsageStatsManager;->access$200(Lcom/meizu/statsos/UsageStatsManager;)Lcom/meizu/statsos/IUsageStatsManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # getter for: Lcom/meizu/statsos/UsageStatsManager;->mUsageStatsManager:Lcom/meizu/statsos/IUsageStatsManager;
    invoke-static {v0}, Lcom/meizu/statsos/UsageStatsManager;->access$200(Lcom/meizu/statsos/UsageStatsManager;)Lcom/meizu/statsos/IUsageStatsManager;

    move-result-object v0

    const-string v1, "pckageName"

    invoke-virtual {v6, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "start"

    invoke-virtual {v6, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "name"

    invoke-virtual {v6, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "time"

    invoke-virtual {v6, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-interface/range {v0 .. v5}, Lcom/meizu/statsos/IUsageStatsManager;->onPage(Ljava/lang/String;ZLjava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v6    # "data":Landroid/os/Bundle;
    :catch_0
    move-exception v7

    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .end local v7    # "e":Ljava/lang/Exception;
    :pswitch_1
    :try_start_1
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # getter for: Lcom/meizu/statsos/UsageStatsManager;->mUsageStatsManager:Lcom/meizu/statsos/IUsageStatsManager;
    invoke-static {v0}, Lcom/meizu/statsos/UsageStatsManager;->access$200(Lcom/meizu/statsos/UsageStatsManager;)Lcom/meizu/statsos/IUsageStatsManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # getter for: Lcom/meizu/statsos/UsageStatsManager;->mUsageStatsManager:Lcom/meizu/statsos/IUsageStatsManager;
    invoke-static {v0}, Lcom/meizu/statsos/UsageStatsManager;->access$200(Lcom/meizu/statsos/UsageStatsManager;)Lcom/meizu/statsos/IUsageStatsManager;

    move-result-object v1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/meizu/statsos/UsageStatsProxy$Event;

    invoke-interface {v1, v0}, Lcom/meizu/statsos/IUsageStatsManager;->onEvent(Lcom/meizu/statsos/UsageStatsProxy$Event;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v7

    .restart local v7    # "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .end local v7    # "e":Ljava/lang/Exception;
    :pswitch_2
    :try_start_2
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # getter for: Lcom/meizu/statsos/UsageStatsManager;->mUsageStatsManager:Lcom/meizu/statsos/IUsageStatsManager;
    invoke-static {v0}, Lcom/meizu/statsos/UsageStatsManager;->access$200(Lcom/meizu/statsos/UsageStatsManager;)Lcom/meizu/statsos/IUsageStatsManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # getter for: Lcom/meizu/statsos/UsageStatsManager;->mUsageStatsManager:Lcom/meizu/statsos/IUsageStatsManager;
    invoke-static {v0}, Lcom/meizu/statsos/UsageStatsManager;->access$200(Lcom/meizu/statsos/UsageStatsManager;)Lcom/meizu/statsos/IUsageStatsManager;

    move-result-object v1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/meizu/statsos/UsageStatsProxy$Event;

    invoke-interface {v1, v0}, Lcom/meizu/statsos/IUsageStatsManager;->onEventRealtime(Lcom/meizu/statsos/UsageStatsProxy$Event;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    :catch_2
    move-exception v7

    .restart local v7    # "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .end local v7    # "e":Ljava/lang/Exception;
    :pswitch_3
    iget v0, p1, Landroid/os/Message;->arg1:I

    if-nez v0, :cond_1

    const/4 v8, 0x0

    .local v8, "upload":Z
    :goto_1
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # getter for: Lcom/meizu/statsos/UsageStatsManager;->mUpload:Z
    invoke-static {v0}, Lcom/meizu/statsos/UsageStatsManager;->access$300(Lcom/meizu/statsos/UsageStatsManager;)Z

    move-result v0

    if-eq v0, v8, :cond_0

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # setter for: Lcom/meizu/statsos/UsageStatsManager;->mUpload:Z
    invoke-static {v0, v8}, Lcom/meizu/statsos/UsageStatsManager;->access$302(Lcom/meizu/statsos/UsageStatsManager;Z)Z

    :try_start_3
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # getter for: Lcom/meizu/statsos/UsageStatsManager;->mUsageStatsManager:Lcom/meizu/statsos/IUsageStatsManager;
    invoke-static {v0}, Lcom/meizu/statsos/UsageStatsManager;->access$200(Lcom/meizu/statsos/UsageStatsManager;)Lcom/meizu/statsos/IUsageStatsManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # getter for: Lcom/meizu/statsos/UsageStatsManager;->mUsageStatsManager:Lcom/meizu/statsos/IUsageStatsManager;
    invoke-static {v0}, Lcom/meizu/statsos/UsageStatsManager;->access$200(Lcom/meizu/statsos/UsageStatsManager;)Lcom/meizu/statsos/IUsageStatsManager;

    move-result-object v0

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsManager$RecordHandler;->this$0:Lcom/meizu/statsos/UsageStatsManager;

    # getter for: Lcom/meizu/statsos/UsageStatsManager;->mUpload:Z
    invoke-static {v1}, Lcom/meizu/statsos/UsageStatsManager;->access$300(Lcom/meizu/statsos/UsageStatsManager;)Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/meizu/statsos/IUsageStatsManager;->setUploaded(Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_0

    :catch_3
    move-exception v7

    .restart local v7    # "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .end local v7    # "e":Ljava/lang/Exception;
    .end local v8    # "upload":Z
    :cond_1
    const/4 v8, 0x1

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
