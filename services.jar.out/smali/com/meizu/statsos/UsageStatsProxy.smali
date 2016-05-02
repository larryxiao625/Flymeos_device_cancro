.class public Lcom/meizu/statsos/UsageStatsProxy;
.super Ljava/lang/Object;
.source "UsageStatsProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/meizu/statsos/UsageStatsProxy$Event;
    }
.end annotation


# static fields
.field public static final EVENT_PROPERTY_VALUE:Ljava/lang/String; = "value"

.field public static final EVENT_TYPE_EVENT:I = 0x1

.field public static final EVENT_TYPE_LOG:I = 0x3

.field public static final EVENT_TYPE_PAGE:I = 0x2

.field public static final LOG_PACKAGE:Ljava/lang/String; = "com.meizu.uxip.log"

.field public static final PAGE_START_TIME:Ljava/lang/String; = "start_time"

.field public static final PAGE_STOP_TIME:Ljava/lang/String; = "stop_time"

.field private static sLock:Ljava/lang/Object;

.field private static volatile sUsageStatsProxy:Lcom/meizu/statsos/UsageStatsProxy;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mOnline:Z

.field private mPackageName:Ljava/lang/String;

.field private mPackageVersion:Ljava/lang/String;

.field private mSharedPreferences:Landroid/content/SharedPreferences;

.field private mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/meizu/statsos/UsageStatsProxy;->sLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;ZZ)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "online"    # Z
    .param p3, "upload"    # Z

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The context is null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xf

    if-gt v1, v2, :cond_1

    :goto_0
    return-void

    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mContext:Landroid/content/Context;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mContext:Landroid/content/Context;

    if-nez v1, :cond_2

    iput-object p1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mContext:Landroid/content/Context;

    :cond_2
    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mContext:Landroid/content/Context;

    const-string v2, "com.meizu.stats"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mSharedPreferences:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageName:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/meizu/statsos/UsageStatsProxy;->mOnline:Z

    new-instance v1, Lcom/meizu/statsos/UsageStatsManager;

    iget-object v2, p0, Lcom/meizu/statsos/UsageStatsProxy;->mContext:Landroid/content/Context;

    iget-boolean v3, p0, Lcom/meizu/statsos/UsageStatsProxy;->mOnline:Z

    invoke-direct {v1, v2, v3, p3}, Lcom/meizu/statsos/UsageStatsManager;-><init>(Landroid/content/Context;ZZ)V

    iput-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageName:Ljava/lang/String;

    iget-object v2, p0, Lcom/meizu/statsos/UsageStatsProxy;->mContext:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/meizu/experiencedatasync/util/Utils;->getPackageVersion(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageVersion:Ljava/lang/String;

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static getInstance(Landroid/content/Context;Z)Lcom/meizu/statsos/UsageStatsProxy;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "online"    # Z

    .prologue
    sget-object v0, Lcom/meizu/statsos/UsageStatsProxy;->sUsageStatsProxy:Lcom/meizu/statsos/UsageStatsProxy;

    if-nez v0, :cond_1

    sget-object v1, Lcom/meizu/statsos/UsageStatsProxy;->sLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/meizu/statsos/UsageStatsProxy;->sUsageStatsProxy:Lcom/meizu/statsos/UsageStatsProxy;

    if-nez v0, :cond_0

    new-instance v0, Lcom/meizu/statsos/UsageStatsProxy;

    const/4 v2, 0x1

    invoke-direct {v0, p0, p1, v2}, Lcom/meizu/statsos/UsageStatsProxy;-><init>(Landroid/content/Context;ZZ)V

    sput-object v0, Lcom/meizu/statsos/UsageStatsProxy;->sUsageStatsProxy:Lcom/meizu/statsos/UsageStatsProxy;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/meizu/statsos/UsageStatsProxy;->sUsageStatsProxy:Lcom/meizu/statsos/UsageStatsProxy;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private static getInstance(Landroid/content/Context;ZZ)Lcom/meizu/statsos/UsageStatsProxy;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "online"    # Z
    .param p2, "upload"    # Z

    .prologue
    sget-object v0, Lcom/meizu/statsos/UsageStatsProxy;->sUsageStatsProxy:Lcom/meizu/statsos/UsageStatsProxy;

    if-nez v0, :cond_1

    sget-object v1, Lcom/meizu/statsos/UsageStatsProxy;->sLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/meizu/statsos/UsageStatsProxy;->sUsageStatsProxy:Lcom/meizu/statsos/UsageStatsProxy;

    if-nez v0, :cond_0

    new-instance v0, Lcom/meizu/statsos/UsageStatsProxy;

    invoke-direct {v0, p0, p1, p2}, Lcom/meizu/statsos/UsageStatsProxy;-><init>(Landroid/content/Context;ZZ)V

    sput-object v0, Lcom/meizu/statsos/UsageStatsProxy;->sUsageStatsProxy:Lcom/meizu/statsos/UsageStatsProxy;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/meizu/statsos/UsageStatsProxy;->sUsageStatsProxy:Lcom/meizu/statsos/UsageStatsProxy;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static getOfflineInstance(Landroid/content/Context;)Lcom/meizu/statsos/UsageStatsProxy;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/meizu/statsos/UsageStatsProxy;->getInstance(Landroid/content/Context;ZZ)Lcom/meizu/statsos/UsageStatsProxy;

    move-result-object v0

    return-object v0
.end method

.method public static getOnlineInstance(Landroid/content/Context;Z)Lcom/meizu/statsos/UsageStatsProxy;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "upload"    # Z

    .prologue
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lcom/meizu/statsos/UsageStatsProxy;->getInstance(Landroid/content/Context;ZZ)Lcom/meizu/statsos/UsageStatsProxy;

    move-result-object v0

    return-object v0
.end method

.method private static isEmpty(Ljava/lang/String;)Z
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v1, v0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getUMID()Ljava/lang/String;
    .locals 4

    .prologue
    const-string v0, "00000000000000000000000000000000000"

    .local v0, "result":Ljava/lang/String;
    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mSharedPreferences:Landroid/content/SharedPreferences;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mSharedPreferences:Landroid/content/SharedPreferences;

    sget-object v2, Lcom/meizu/experiencedatasync/UsageStatsConstants;->PREFERENCES_UMID:Ljava/lang/String;

    const-string v3, "00000000000000000000000000000000000"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public onEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "pageName"    # Ljava/lang/String;
    .param p3, "property"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mOnline:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    invoke-virtual {v0}, Lcom/meizu/statsos/UsageStatsManager;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_2
    invoke-static {p1}, Lcom/meizu/statsos/UsageStatsProxy;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v9, 0x0

    .local v9, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p3}, Lcom/meizu/statsos/UsageStatsProxy;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v9, Ljava/util/HashMap;

    .end local v9    # "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .restart local v9    # "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "value"

    invoke-interface {v9, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    new-instance v1, Lcom/meizu/statsos/UsageStatsProxy$Event;

    const/4 v3, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageName:Ljava/lang/String;

    sget-object v10, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    iget-object v11, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageVersion:Ljava/lang/String;

    move-object v2, p1

    move-object v8, p2

    invoke-direct/range {v1 .. v11}, Lcom/meizu/statsos/UsageStatsProxy$Event;-><init>(Ljava/lang/String;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/meizu/statsos/UsageStatsManager;->onEvent(Lcom/meizu/statsos/UsageStatsProxy$Event;)V

    goto :goto_0
.end method

.method public onEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 12
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "pageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mOnline:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    invoke-virtual {v0}, Lcom/meizu/statsos/UsageStatsManager;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_2
    invoke-static {p1}, Lcom/meizu/statsos/UsageStatsProxy;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    new-instance v1, Lcom/meizu/statsos/UsageStatsProxy$Event;

    const/4 v3, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageName:Ljava/lang/String;

    sget-object v10, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    iget-object v11, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageVersion:Ljava/lang/String;

    move-object v2, p1

    move-object v8, p2

    move-object v9, p3

    invoke-direct/range {v1 .. v11}, Lcom/meizu/statsos/UsageStatsProxy$Event;-><init>(Ljava/lang/String;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/meizu/statsos/UsageStatsManager;->onEvent(Lcom/meizu/statsos/UsageStatsProxy$Event;)V

    goto :goto_0
.end method

.method public onEventRealtime(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 12
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "pageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mOnline:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    invoke-virtual {v0}, Lcom/meizu/statsos/UsageStatsManager;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_2
    invoke-static {p1}, Lcom/meizu/statsos/UsageStatsProxy;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v1, Lcom/meizu/statsos/UsageStatsProxy$Event;

    const/4 v3, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageName:Ljava/lang/String;

    sget-object v10, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    iget-object v11, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageVersion:Ljava/lang/String;

    move-object v2, p1

    move-object v8, p2

    move-object v9, p3

    invoke-direct/range {v1 .. v11}, Lcom/meizu/statsos/UsageStatsProxy$Event;-><init>(Ljava/lang/String;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .local v1, "event":Lcom/meizu/statsos/UsageStatsProxy$Event;
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mOnline:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    invoke-virtual {v0, v1}, Lcom/meizu/statsos/UsageStatsManager;->onEventRealtime(Lcom/meizu/statsos/UsageStatsProxy$Event;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    invoke-virtual {v0, v1}, Lcom/meizu/statsos/UsageStatsManager;->onEvent(Lcom/meizu/statsos/UsageStatsProxy$Event;)V

    goto :goto_0
.end method

.method public onLog(Ljava/lang/String;Ljava/util/Map;)V
    .locals 12
    .param p1, "logName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v6, 0x0

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mOnline:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    invoke-virtual {v0}, Lcom/meizu/statsos/UsageStatsManager;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_2
    invoke-static {p1}, Lcom/meizu/statsos/UsageStatsProxy;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    new-instance v1, Lcom/meizu/statsos/UsageStatsProxy$Event;

    const/4 v3, 0x3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v7, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageName:Ljava/lang/String;

    sget-object v10, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    iget-object v11, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageVersion:Ljava/lang/String;

    move-object v2, p1

    move-object v8, v6

    move-object v9, p2

    invoke-direct/range {v1 .. v11}, Lcom/meizu/statsos/UsageStatsProxy$Event;-><init>(Ljava/lang/String;IJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/meizu/statsos/UsageStatsManager;->onEvent(Lcom/meizu/statsos/UsageStatsProxy$Event;)V

    goto :goto_0
.end method

.method public onPageStart(Ljava/lang/String;)V
    .locals 6
    .param p1, "pageName"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mOnline:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    invoke-virtual {v0}, Lcom/meizu/statsos/UsageStatsManager;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_2
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageName:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/meizu/statsos/UsageStatsManager;->onPage(Ljava/lang/String;ZLjava/lang/String;J)V

    goto :goto_0
.end method

.method public onPageStop(Ljava/lang/String;)V
    .locals 6
    .param p1, "pageName"    # Ljava/lang/String;

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mOnline:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    invoke-virtual {v0}, Lcom/meizu/statsos/UsageStatsManager;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_2
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsProxy;->mPackageName:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/meizu/statsos/UsageStatsManager;->onPage(Ljava/lang/String;ZLjava/lang/String;J)V

    goto :goto_0
.end method

.method public setUploaded(Z)V
    .locals 1
    .param p1, "upload"    # Z

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mOnline:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsProxy;->mUsageStatsManager:Lcom/meizu/statsos/UsageStatsManager;

    invoke-virtual {v0, p1}, Lcom/meizu/statsos/UsageStatsManager;->setUploaded(Z)V

    goto :goto_0
.end method
