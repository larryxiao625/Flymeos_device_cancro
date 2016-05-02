.class public Lcom/meizu/statsos/UsageStatsUploader;
.super Ljava/lang/Object;
.source "UsageStatsUploader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/meizu/statsos/UsageStatsUploader$TimeChangedReceiver;,
        Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;
    }
.end annotation


# static fields
.field private static final BATCH_UPLOAD_URL:Ljava/lang/String; = "https://uxip.meizu.com/api/upload"

.field private static final GET_UMID_URL:Ljava/lang/String; = "https://umid.orion.meizu.com/umid/generator"

.field private static final NETWORK_STATE_CHANGED:I = 0x3

.field private static final ONE_UPLOAD_URL:Ljava/lang/String; = "https://uxip.meizu.com/api/report/realtime"

.field private static final POWER_CONNECTED:I = 0x5

.field private static final SIGN_KEY_FORMAT:Ljava/lang/String; = "key=OjUiuYe80AUYnbgBNT6&nonce=%s&ts=%s&md5=%s"

.field private static final TAG:Ljava/lang/String; = "UsageStatsUploader"

.field private static final TIME_CHANGED:I = 0x4

.field private static final UPLOAD:I = 0x1

.field private static final UPLOAD_TIME_ALARM:I = 0x2

.field private static sLock:Ljava/lang/Object;

.field private static volatile sUsageStatsUploader:Lcom/meizu/statsos/UsageStatsUploader;


# instance fields
.field private mAllowUpload:Z

.field private mContext:Landroid/content/Context;

.field private mEventCome:I

.field private mHandler:Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;

.field private mIsUploadByEventCome:Z

.field private mLastAlarmTime:J

.field private mLastUploadTime:J

.field private mNetworkConnected:Z

.field private mOnline:Z

.field private mOnlineDayFlowSum:J

.field private mPackageSession:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/meizu/statsos/UsageStatsProxy$Event;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private mParcelLimit:I

.field private volatile mPowerConnecting:Z

.field private mRatio:I

.field private mSharedPreferences:Landroid/content/SharedPreferences;

.field private mStatsUploadThread:Landroid/os/HandlerThread;

.field private volatile mUpload:Z

.field private mUsageStatsProviderHelper:Lcom/meizu/statsos/UsageStatsProviderHelper;

.field private mUsageStatsReceiver:Lcom/meizu/statsos/UsageStatsReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/meizu/statsos/UsageStatsUploader;->sLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;ZZ)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "online"    # Z
    .param p3, "upload"    # Z

    .prologue
    const/4 v9, 0x1

    const-wide/16 v10, 0x0

    const/4 v8, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v5, Landroid/os/HandlerThread;

    const-string v6, "StatsUploadThread"

    invoke-direct {v5, v6}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mStatsUploadThread:Landroid/os/HandlerThread;

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    iput-boolean v8, p0, Lcom/meizu/statsos/UsageStatsUploader;->mAllowUpload:Z

    iput-boolean v8, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPowerConnecting:Z

    iput v8, p0, Lcom/meizu/statsos/UsageStatsUploader;->mRatio:I

    iput-wide v10, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnlineDayFlowSum:J

    iput-boolean v8, p0, Lcom/meizu/statsos/UsageStatsUploader;->mIsUploadByEventCome:Z

    iput-object p1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    iput-boolean p2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    iput-boolean p3, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUpload:Z

    iget-boolean v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    if-eqz v5, :cond_4

    sget v5, Lcom/meizu/experiencedatasync/UsageStatsConstants;->ONLINE_EVENTS_PARCEL_LIMIT:I

    :goto_0
    iput v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mParcelLimit:I

    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    iget-boolean v6, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    invoke-static {v5, v6}, Lcom/meizu/statsos/UsageStatsProviderHelper;->getInstance(Landroid/content/Context;Z)Lcom/meizu/statsos/UsageStatsProviderHelper;

    move-result-object v5

    iput-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUsageStatsProviderHelper:Lcom/meizu/statsos/UsageStatsProviderHelper;

    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    const-string v6, "com.meizu.stats"

    invoke-virtual {v5, v6, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    iput-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v6, "last_upload_time"

    invoke-interface {v5, v6, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/meizu/statsos/UsageStatsUploader;->mLastUploadTime:J

    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v6, "today_upload_flag"

    invoke-interface {v5, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mAllowUpload:Z

    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v6, "ratio"

    invoke-interface {v5, v6, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mRatio:I

    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v6, "online_flow_sum"

    invoke-interface {v5, v6, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnlineDayFlowSum:J

    iget-boolean v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    if-nez v5, :cond_0

    invoke-static {}, Lcom/meizu/statsos/UsageStatusLog;->initLog()V

    :cond_0
    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mStatsUploadThread:Landroid/os/HandlerThread;

    invoke-virtual {v5}, Landroid/os/HandlerThread;->start()V

    new-instance v5, Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;

    iget-object v6, p0, Lcom/meizu/statsos/UsageStatsUploader;->mStatsUploadThread:Landroid/os/HandlerThread;

    invoke-virtual {v6}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v5, p0, v6}, Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;-><init>(Lcom/meizu/statsos/UsageStatsUploader;Landroid/os/Looper;)V

    iput-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mHandler:Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;

    iget-boolean v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    if-eqz v5, :cond_1

    new-instance v5, Lcom/meizu/statsos/UsageStatsReceiver;

    invoke-direct {v5}, Lcom/meizu/statsos/UsageStatsReceiver;-><init>()V

    iput-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUsageStatsReceiver:Lcom/meizu/statsos/UsageStatsReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .local v3, "filter":Landroid/content/IntentFilter;
    const-string v5, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v3, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    :try_start_0
    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUsageStatsReceiver:Lcom/meizu/statsos/UsageStatsReceiver;

    invoke-virtual {v5, v6}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :goto_1
    :try_start_1
    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUsageStatsReceiver:Lcom/meizu/statsos/UsageStatsReceiver;

    invoke-virtual {v5, v6, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .end local v3    # "filter":Landroid/content/IntentFilter;
    :cond_1
    :goto_2
    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mHandler:Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;

    new-instance v6, Lcom/meizu/statsos/UsageStatsUploader$1;

    invoke-direct {v6, p0}, Lcom/meizu/statsos/UsageStatsUploader$1;-><init>(Lcom/meizu/statsos/UsageStatsUploader;)V

    invoke-virtual {v5, v6}, Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;->post(Ljava/lang/Runnable;)Z

    iget-boolean v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    if-nez v5, :cond_3

    :try_start_2
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .local v0, "batteryfilter":Landroid/content/IntentFilter;
    const-string v5, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v4

    .local v4, "result":Landroid/content/Intent;
    if-eqz v4, :cond_2

    const-string v5, "plugged"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    if-eqz v5, :cond_2

    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPowerConnecting:Z

    :cond_2
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .restart local v3    # "filter":Landroid/content/IntentFilter;
    const-string v5, "android.intent.action.TIME_SET"

    invoke-virtual {v3, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v5, "android.intent.action.ACTION_POWER_CONNECTED"

    invoke-virtual {v3, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v5, "android.intent.action.ACTION_POWER_DISCONNECTED"

    invoke-virtual {v3, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    new-instance v6, Lcom/meizu/statsos/UsageStatsUploader$TimeChangedReceiver;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7}, Lcom/meizu/statsos/UsageStatsUploader$TimeChangedReceiver;-><init>(Lcom/meizu/statsos/UsageStatsUploader;Lcom/meizu/statsos/UsageStatsUploader$1;)V

    invoke-virtual {v5, v6, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .end local v0    # "batteryfilter":Landroid/content/IntentFilter;
    .end local v3    # "filter":Landroid/content/IntentFilter;
    .end local v4    # "result":Landroid/content/Intent;
    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/meizu/statsos/UsageStatsUploader;->sendOfflineUploadAlarm(J)V

    invoke-virtual {p0}, Lcom/meizu/statsos/UsageStatsUploader;->checkUpload()V

    :cond_3
    return-void

    :cond_4
    sget v5, Lcom/meizu/experiencedatasync/UsageStatsConstants;->EVENTS_PARCEL_LIMIT:I

    goto/16 :goto_0

    .restart local v3    # "filter":Landroid/content/IntentFilter;
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "filter":Landroid/content/IntentFilter;
    :catch_1
    move-exception v2

    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .end local v2    # "ex":Ljava/lang/Exception;
    .restart local v3    # "filter":Landroid/content/IntentFilter;
    :catch_2
    move-exception v5

    goto :goto_1
.end method

.method static synthetic access$000(Lcom/meizu/statsos/UsageStatsUploader;)Lcom/meizu/statsos/UsageStatsProviderHelper;
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUsageStatsProviderHelper:Lcom/meizu/statsos/UsageStatsProviderHelper;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/meizu/statsos/UsageStatsUploader;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/meizu/statsos/UsageStatsUploader;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    invoke-direct {p0}, Lcom/meizu/statsos/UsageStatsUploader;->parcelEvents()Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200(Lcom/meizu/statsos/UsageStatsUploader;Lorg/json/JSONObject;Z)Z
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .param p2, "x2"    # Z

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/meizu/statsos/UsageStatsUploader;->uploadEvents(Lorg/json/JSONObject;Z)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1300(Lcom/meizu/statsos/UsageStatsUploader;)Z
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    return v0
.end method

.method static synthetic access$1400(Lcom/meizu/statsos/UsageStatsUploader;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    invoke-direct {p0}, Lcom/meizu/statsos/UsageStatsUploader;->parcelSimpleEvents()Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1500(Lcom/meizu/statsos/UsageStatsUploader;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;
    .param p1, "x1"    # Z

    .prologue
    invoke-direct {p0, p1}, Lcom/meizu/statsos/UsageStatsUploader;->setTodayAllowUpload(Z)V

    return-void
.end method

.method static synthetic access$1600(Lcom/meizu/statsos/UsageStatsUploader;J)V
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;
    .param p1, "x1"    # J

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/meizu/statsos/UsageStatsUploader;->setLastUploadTime(J)V

    return-void
.end method

.method static synthetic access$1700(Lcom/meizu/statsos/UsageStatsUploader;)Z
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mIsUploadByEventCome:Z

    return v0
.end method

.method static synthetic access$1702(Lcom/meizu/statsos/UsageStatsUploader;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;
    .param p1, "x1"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mIsUploadByEventCome:Z

    return p1
.end method

.method static synthetic access$1800(Lcom/meizu/statsos/UsageStatsUploader;)I
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mRatio:I

    return v0
.end method

.method static synthetic access$1802(Lcom/meizu/statsos/UsageStatsUploader;I)I
    .locals 0
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;
    .param p1, "x1"    # I

    .prologue
    iput p1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mRatio:I

    return p1
.end method

.method static synthetic access$1902(Lcom/meizu/statsos/UsageStatsUploader;I)I
    .locals 0
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;
    .param p1, "x1"    # I

    .prologue
    iput p1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mEventCome:I

    return p1
.end method

.method static synthetic access$200(Lcom/meizu/statsos/UsageStatsUploader;Lorg/json/JSONObject;)V
    .locals 0
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    invoke-direct {p0, p1}, Lcom/meizu/statsos/UsageStatsUploader;->parcelUmidInfo(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/meizu/statsos/UsageStatsUploader;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/meizu/statsos/UsageStatsUploader;)Z
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPowerConnecting:Z

    return v0
.end method

.method static synthetic access$2102(Lcom/meizu/statsos/UsageStatsUploader;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;
    .param p1, "x1"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPowerConnecting:Z

    return p1
.end method

.method static synthetic access$300(Lcom/meizu/statsos/UsageStatsUploader;)Landroid/content/SharedPreferences;
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$400(Lcom/meizu/statsos/UsageStatsUploader;)Z
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    invoke-direct {p0}, Lcom/meizu/statsos/UsageStatsUploader;->isNetworkWorking()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/meizu/statsos/UsageStatsUploader;)Z
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mNetworkConnected:Z

    return v0
.end method

.method static synthetic access$502(Lcom/meizu/statsos/UsageStatsUploader;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;
    .param p1, "x1"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mNetworkConnected:Z

    return p1
.end method

.method static synthetic access$600(Lcom/meizu/statsos/UsageStatsUploader;J)V
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;
    .param p1, "x1"    # J

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/meizu/statsos/UsageStatsUploader;->sendOfflineUploadAlarm(J)V

    return-void
.end method

.method static synthetic access$700(Lcom/meizu/statsos/UsageStatsUploader;)J
    .locals 2
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget-wide v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mLastAlarmTime:J

    return-wide v0
.end method

.method static synthetic access$800(Lcom/meizu/statsos/UsageStatsUploader;)V
    .locals 0
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    invoke-direct {p0}, Lcom/meizu/statsos/UsageStatsUploader;->checkOnlineResetConditions()V

    return-void
.end method

.method static synthetic access$900(Lcom/meizu/statsos/UsageStatsUploader;)Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;
    .locals 1
    .param p0, "x0"    # Lcom/meizu/statsos/UsageStatsUploader;

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mHandler:Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;

    return-object v0
.end method

.method private checkOfflineMobile(Lorg/json/JSONObject;)Z
    .locals 6
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    const/4 v0, 0x0

    .local v0, "result":Z
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    array-length v1, v1

    int-to-long v2, v1

    const-wide/16 v4, 0x2800

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    iget-boolean v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mAllowUpload:Z

    if-eqz v1, :cond_0

    const-string v1, "UsageStatsUploader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "offline this data.size="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    array-length v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private checkOnlineMobile(Lorg/json/JSONObject;)Z
    .locals 8
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    const/4 v0, 0x0

    .local v0, "result":Z
    const-wide/16 v2, 0x0

    .local v2, "tempSum":J
    if-eqz p1, :cond_0

    iget-wide v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnlineDayFlowSum:J

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    array-length v1, v1

    int-to-long v6, v1

    add-long v2, v4, v6

    const-string v1, "UsageStatsUploader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mOnlineDayFlowSum="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v6, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnlineDayFlowSum:J

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " online this data.size="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    array-length v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/32 v4, 0x100000

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    iput-wide v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnlineDayFlowSum:J

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v4, "online_flow_sum"

    iget-wide v6, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnlineDayFlowSum:J

    invoke-interface {v1, v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private checkOnlineResetConditions()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    iget-boolean v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    if-eqz v4, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .local v0, "cur":J
    iget-object v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v5, "online_last_upload_time"

    invoke-interface {v4, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .local v2, "last":J
    cmp-long v4, v6, v2

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "online_last_upload_time"

    invoke-interface {v4, v5, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .end local v0    # "cur":J
    .end local v2    # "last":J
    :cond_0
    :goto_0
    return-void

    .restart local v0    # "cur":J
    .restart local v2    # "last":J
    :cond_1
    sub-long v4, v0, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    const-wide/32 v6, 0x5265c00

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    iget-object v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "online_last_upload_time"

    invoke-interface {v4, v5, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-direct {p0}, Lcom/meizu/statsos/UsageStatsUploader;->resetOnlineUploadConditions()V

    goto :goto_0
.end method

.method private clearUploadedEvents()V
    .locals 7

    .prologue
    iget-object v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .local v2, "packageSessionEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .local v3, "sessionMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    iget-object v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUsageStatsProviderHelper:Lcom/meizu/statsos/UsageStatsProviderHelper;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    invoke-virtual {v5, v4}, Lcom/meizu/statsos/UsageStatsProviderHelper;->deleteEvent(Ljava/util/Collection;)I

    goto :goto_0

    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "packageSessionEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;>;"
    .end local v3    # "sessionMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :cond_1
    iget-boolean v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUsageStatsProviderHelper:Lcom/meizu/statsos/UsageStatsProviderHelper;

    invoke-virtual {v4}, Lcom/meizu/statsos/UsageStatsProviderHelper;->getEventsCount()I

    move-result v4

    iput v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mEventCome:I

    const-string v4, "UsageStatsUploader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "upload successful! update mEventCome="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/meizu/statsos/UsageStatsUploader;->mEventCome:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method private generateMultipartEntity([B)[Lcom/meizu/experiencedatasync/net/multipart/Part;
    .locals 14
    .param p1, "pushData"    # [B

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    invoke-static {p1}, Lcom/meizu/experiencedatasync/util/Utils;->getMD5([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/meizu/experiencedatasync/util/Utils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v6

    .local v6, "md5":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v11, v0

    .local v11, "tsValue":I
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    add-int/2addr v0, v11

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    .local v7, "nonce":Ljava/lang/String;
    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    .local v10, "ts":Ljava/lang/String;
    const-string v0, "key=OjUiuYe80AUYnbgBNT6&nonce=%s&ts=%s&md5=%s"

    new-array v1, v13, [Ljava/lang/Object;

    aput-object v7, v1, v4

    aput-object v10, v1, v5

    aput-object v6, v1, v12

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/meizu/experiencedatasync/util/Utils;->getMD5([B)[B

    move-result-object v0

    invoke-static {v0}, Lcom/meizu/experiencedatasync/util/Utils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v9

    .local v9, "sign":Ljava/lang/String;
    const/4 v0, 0x5

    new-array v8, v0, [Lcom/meizu/experiencedatasync/net/multipart/Part;

    .local v8, "partArray":[Lcom/meizu/experiencedatasync/net/multipart/Part;
    new-instance v0, Lcom/meizu/experiencedatasync/net/multipart/StringPart;

    const-string v1, "nonce"

    invoke-direct {v0, v1, v7}, Lcom/meizu/experiencedatasync/net/multipart/StringPart;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v0, v8, v4

    new-instance v0, Lcom/meizu/experiencedatasync/net/multipart/StringPart;

    const-string v1, "ts"

    invoke-direct {v0, v1, v10}, Lcom/meizu/experiencedatasync/net/multipart/StringPart;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v0, v8, v5

    new-instance v0, Lcom/meizu/experiencedatasync/net/multipart/StringPart;

    const-string v1, "md5"

    invoke-direct {v0, v1, v6}, Lcom/meizu/experiencedatasync/net/multipart/StringPart;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v0, v8, v12

    new-instance v0, Lcom/meizu/experiencedatasync/net/multipart/StringPart;

    const-string v1, "sign"

    invoke-direct {v0, v1, v9}, Lcom/meizu/experiencedatasync/net/multipart/StringPart;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v0, v8, v13

    const/4 v12, 0x4

    new-instance v0, Lcom/meizu/experiencedatasync/net/multipart/DataPart;

    const-string v1, "collect"

    const-string v2, "collect"

    const/4 v4, 0x0

    const-string v5, "UTF-8"

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/meizu/experiencedatasync/net/multipart/DataPart;-><init>(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;)V

    aput-object v0, v8, v12

    return-object v8
.end method

.method private generateUploadData(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "flymeVersion"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ge v4, v5, :cond_0

    move-object v2, v3

    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .local v2, "uploadData":Lorg/json/JSONObject;
    :try_start_0
    const-string v4, "ver"

    const-string v5, "2.0"

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-direct {p0, v2, p1}, Lcom/meizu/statsos/UsageStatsUploader;->parcelDeviceInfo(Lorg/json/JSONObject;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/meizu/statsos/UsageStatsUploader;->parcelPackages()Lorg/json/JSONArray;

    move-result-object v0

    .local v0, "apps":Lorg/json/JSONArray;
    if-nez v0, :cond_1

    move-object v2, v3

    goto :goto_0

    :cond_1
    const-string v4, "apps"

    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v0    # "apps":Lorg/json/JSONArray;
    :catch_0
    move-exception v1

    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    move-object v2, v3

    goto :goto_0
.end method

.method private getEventType(I)Ljava/lang/String;
    .locals 1
    .param p1, "type"    # I

    .prologue
    packed-switch p1, :pswitch_data_0

    const-string v0, ""

    :goto_0
    return-object v0

    :pswitch_0
    const-string v0, "action_x"

    goto :goto_0

    :pswitch_1
    const-string v0, "page"

    goto :goto_0

    :pswitch_2
    const-string v0, "log"

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static getInstance(Landroid/content/Context;ZZ)Lcom/meizu/statsos/UsageStatsUploader;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "online"    # Z
    .param p2, "upload"    # Z

    .prologue
    sget-object v0, Lcom/meizu/statsos/UsageStatsUploader;->sUsageStatsUploader:Lcom/meizu/statsos/UsageStatsUploader;

    if-nez v0, :cond_1

    sget-object v1, Lcom/meizu/statsos/UsageStatsUploader;->sLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/meizu/statsos/UsageStatsUploader;->sUsageStatsUploader:Lcom/meizu/statsos/UsageStatsUploader;

    if-nez v0, :cond_0

    new-instance v0, Lcom/meizu/statsos/UsageStatsUploader;

    invoke-direct {v0, p0, p1, p2}, Lcom/meizu/statsos/UsageStatsUploader;-><init>(Landroid/content/Context;ZZ)V

    sput-object v0, Lcom/meizu/statsos/UsageStatsUploader;->sUsageStatsUploader:Lcom/meizu/statsos/UsageStatsUploader;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/meizu/statsos/UsageStatsUploader;->sUsageStatsUploader:Lcom/meizu/statsos/UsageStatsUploader;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private isNetworkWorking()Z
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/meizu/experiencedatasync/util/Utils;->isNetworkWorking(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isUploadSuccess(Ljava/lang/String;)Z
    .locals 5
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    :goto_0
    return v2

    :cond_1
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .local v1, "object":Lorg/json/JSONObject;
    const/16 v3, 0xc8

    const-string v4, "code"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-ne v3, v4, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    .end local v1    # "object":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private parcelDeviceInfo(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 2
    .param p1, "data"    # Lorg/json/JSONObject;
    .param p2, "flymeVersion"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const-string v0, "device"

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "os_version"

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "imei"

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->getIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "country"

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->getCountry(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "operator"

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->getOperater(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "root"

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->isRoot(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string v0, "sn"

    invoke-static {}, Lcom/meizu/experiencedatasync/util/Utils;->getSN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "flyme_uid"

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->getFlymeUid(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "flyme_ver"

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object p2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    .end local p2    # "flymeVersion":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "mac_address"

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->getMACAddress(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "product_model"

    sget-object v1, Lcom/meizu/experiencedatasync/util/Utils;->PRODUCT_MODEL:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "build_mask"

    sget-object v1, Lcom/meizu/experiencedatasync/util/Utils;->BUILD_MASK:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "sre"

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->getSre(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "lla"

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->getLocationLanguage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "umid"

    sget-object v1, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "ter_type"

    invoke-static {}, Lcom/meizu/experiencedatasync/util/Utils;->getDeviceType()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "os_type"

    invoke-static {}, Lcom/meizu/experiencedatasync/util/Utils;->getOSType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "brand"

    invoke-static {}, Lcom/meizu/experiencedatasync/util/Utils;->getBrand()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private parcelEvents()Lorg/json/JSONObject;
    .locals 14

    .prologue
    const/4 v5, 0x0

    .local v5, "flymeVersion":Ljava/lang/String;
    iget-object v11, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUsageStatsProviderHelper:Lcom/meizu/statsos/UsageStatsProviderHelper;

    iget v12, p0, Lcom/meizu/statsos/UsageStatsUploader;->mParcelLimit:I

    invoke-virtual {v11, v12}, Lcom/meizu/statsos/UsageStatsProviderHelper;->getEvents(I)Landroid/database/Cursor;

    move-result-object v0

    .local v0, "cursor":Landroid/database/Cursor;
    if-nez v0, :cond_0

    const/4 v11, 0x0

    :goto_0
    return-object v11

    :cond_0
    const-string v11, "UsageStatsUploader"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "parcelEvents, count="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v11, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->clear()V

    const/4 v9, 0x0

    .local v9, "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    const/4 v3, 0x0

    .local v3, "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    const/4 v2, 0x0

    .local v2, "event":Lcom/meizu/statsos/UsageStatsProxy$Event;
    const/4 v6, 0x0

    .local v6, "packageName":Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "packageVersion":Ljava/lang/String;
    const/4 v8, 0x0

    .local v8, "sessionid":Ljava/lang/String;
    move-object v4, v3

    .end local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .local v4, "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v10, v9

    .end local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .local v10, "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :cond_1
    :goto_1
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-static {v0}, Lcom/meizu/statsos/UsageStatsProviderHelper;->creatEvent(Landroid/database/Cursor;)Lcom/meizu/statsos/UsageStatsProxy$Event;

    move-result-object v2

    if-eqz v2, :cond_1

    if-nez v5, :cond_2

    invoke-virtual {v2}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getFlymeVersion()Ljava/lang/String;

    move-result-object v5

    :cond_2
    invoke-virtual {v2}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPackageVersion()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_3

    iget-object v11, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v6, v11}, Lcom/meizu/experiencedatasync/util/Utils;->getPackageVersion(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    :goto_2
    invoke-virtual {v2}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getSessionid()Ljava/lang/String;

    move-result-object v8

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "*"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v11, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v11, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_4

    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :try_start_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .end local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    :try_start_2
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v9, v8, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v11, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v11, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-object v4, v3

    .end local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v10, v9

    .end local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    goto :goto_1

    :cond_3
    :try_start_3
    invoke-virtual {v2}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPackageVersion()Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    :cond_4
    iget-object v11, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v11, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .end local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :try_start_4
    invoke-interface {v9, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_5

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .end local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    :try_start_5
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v9, v8, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-object v4, v3

    .end local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v10, v9

    .end local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    goto/16 :goto_1

    .end local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :cond_5
    :try_start_6
    invoke-interface {v9, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .end local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    :try_start_7
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    move-object v4, v3

    .end local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v10, v9

    .end local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    goto/16 :goto_1

    :cond_6
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    move-object v3, v4

    .end local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v9, v10

    .end local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :goto_3
    invoke-direct {p0, v5}, Lcom/meizu/statsos/UsageStatsUploader;->generateUploadData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    goto/16 :goto_0

    .end local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .end local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :catch_0
    move-exception v1

    move-object v3, v4

    .end local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v9, v10

    .end local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .local v1, "e":Ljava/lang/Exception;
    .restart local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :goto_4
    :try_start_8
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_3

    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .end local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :catchall_0
    move-exception v11

    move-object v3, v4

    .end local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v9, v10

    .end local v10    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v9    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :goto_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v11

    .end local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    :catchall_1
    move-exception v11

    move-object v3, v4

    .end local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    goto :goto_5

    :catchall_2
    move-exception v11

    goto :goto_5

    .end local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    :catch_1
    move-exception v1

    move-object v3, v4

    .end local v4    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v3    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    goto :goto_4

    :catch_2
    move-exception v1

    goto :goto_4
.end method

.method private parcelPackages()Lorg/json/JSONArray;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, -0x1

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .local v1, "apps":Lorg/json/JSONArray;
    const/4 v7, 0x0

    .local v7, "version":Ljava/lang/String;
    iget-object v8, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .local v4, "packageName":Ljava/lang/String;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .local v0, "app":Lorg/json/JSONObject;
    const-string v8, "*"

    invoke-virtual {v4, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .local v6, "splitIndex":I
    if-ne v10, v6, :cond_1

    move-object v3, v4

    .local v3, "name":Ljava/lang/String;
    :goto_1
    const-string v8, "package"

    invoke-virtual {v0, v8, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v8, "com.meizu.uxip.log"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    const-string v7, "1.0"

    :goto_2
    const-string v8, "sdk_ver"

    const-string v9, "2.5"

    invoke-virtual {v0, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v8, "version"

    invoke-virtual {v0, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-direct {p0, v4}, Lcom/meizu/statsos/UsageStatsUploader;->parcelSessions(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .local v5, "sessions":Lorg/json/JSONArray;
    if-eqz v5, :cond_0

    const-string v8, "sessions"

    invoke-virtual {v0, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "sessions":Lorg/json/JSONArray;
    :cond_1
    const/4 v8, 0x0

    invoke-virtual {v4, v8, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .restart local v3    # "name":Ljava/lang/String;
    :cond_2
    if-ne v10, v6, :cond_3

    iget-object v8, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v3, v8}, Lcom/meizu/experiencedatasync/util/Utils;->getPackageVersion(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    :goto_3
    goto :goto_2

    :cond_3
    add-int/lit8 v8, v6, 0x1

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_3

    .end local v0    # "app":Lorg/json/JSONObject;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "packageName":Ljava/lang/String;
    .end local v6    # "splitIndex":I
    :cond_4
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-lez v8, :cond_5

    .end local v1    # "apps":Lorg/json/JSONArray;
    :goto_4
    return-object v1

    .restart local v1    # "apps":Lorg/json/JSONArray;
    :cond_5
    const/4 v1, 0x0

    goto :goto_4
.end method

.method private parcelSessions(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 18
    .param p1, "packageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .local v2, "channel":J
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    move-object/from16 v0, p1

    invoke-interface {v15, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map;

    .local v12, "sessionMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    if-eqz v12, :cond_0

    invoke-interface {v12}, Ljava/util/Map;->size()I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ge v15, v0, :cond_2

    :cond_0
    const/4 v14, 0x0

    :cond_1
    :goto_0
    return-object v14

    :cond_2
    new-instance v14, Lorg/json/JSONArray;

    invoke-direct {v14}, Lorg/json/JSONArray;-><init>()V

    .local v14, "sessions":Lorg/json/JSONArray;
    invoke-interface {v12}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_3
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_8

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map$Entry;

    .local v13, "sessionMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .local v7, "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    if-eqz v7, :cond_3

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-lt v15, v0, :cond_3

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .local v11, "session":Lorg/json/JSONObject;
    const-string v15, "sid"

    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v11, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v8, Lorg/json/JSONArray;

    invoke-direct {v8}, Lorg/json/JSONArray;-><init>()V

    .local v8, "events":Lorg/json/JSONArray;
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_7

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/meizu/statsos/UsageStatsProxy$Event;

    .local v5, "event":Lcom/meizu/statsos/UsageStatsProxy$Event;
    const-wide/16 v16, 0x0

    cmp-long v15, v16, v2

    if-nez v15, :cond_4

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getChannelNum()J

    move-result-wide v2

    :cond_4
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .local v6, "eventJson":Lorg/json/JSONObject;
    const-string v15, "network"

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getNetwork()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v15, "type"

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getType()I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/meizu/statsos/UsageStatsUploader;->getEventType(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v15, "name"

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const/4 v15, 0x2

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getType()I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_6

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getProperties()Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_5

    :try_start_0
    const-string v16, "launch"

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getProperties()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/json/JSONObject;

    const-string v17, "start_time"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    move-object/from16 v0, v16

    invoke-virtual {v6, v0, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v16, "terminate"

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getProperties()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/json/JSONObject;

    const-string v17, "stop_time"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    move-object/from16 v0, v16

    invoke-virtual {v6, v0, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_5
    :goto_3
    invoke-virtual {v8, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2

    :catch_0
    move-exception v4

    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .end local v4    # "e":Ljava/lang/Exception;
    :cond_6
    const-string v15, "time"

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getTime()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v6, v15, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v15, "page"

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPage()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v15, "value"

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getProperties()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .end local v5    # "event":Lcom/meizu/statsos/UsageStatsProxy$Event;
    .end local v6    # "eventJson":Lorg/json/JSONObject;
    :cond_7
    const-string v15, "channel_id"

    invoke-virtual {v11, v15, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v15, "events"

    invoke-virtual {v11, v15, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v14, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_1

    .end local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .end local v8    # "events":Lorg/json/JSONArray;
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "session":Lorg/json/JSONObject;
    .end local v13    # "sessionMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :cond_8
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-gtz v15, :cond_1

    const/4 v14, 0x0

    goto/16 :goto_0
.end method

.method private parcelSimpleEvents()Lorg/json/JSONObject;
    .locals 20

    .prologue
    const/4 v8, 0x0

    .local v8, "flymeVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/meizu/statsos/UsageStatsUploader;->mUsageStatsProviderHelper:Lcom/meizu/statsos/UsageStatsProviderHelper;

    move-object/from16 v0, p0

    iget v15, v0, Lcom/meizu/statsos/UsageStatsUploader;->mParcelLimit:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    const-wide/32 v18, 0x5265c00

    sub-long v16, v16, v18

    invoke-virtual/range {v14 .. v17}, Lcom/meizu/statsos/UsageStatsProviderHelper;->getOldEvents(IJ)Landroid/database/Cursor;

    move-result-object v2

    .local v2, "cursor":Landroid/database/Cursor;
    if-nez v2, :cond_1

    const/4 v3, 0x0

    :cond_0
    return-object v3

    :cond_1
    const-string v14, "UsageStatsUploader"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "parcelSimpleEvents, count="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v14}, Ljava/util/Map;->clear()V

    const/4 v12, 0x0

    .local v12, "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    const/4 v6, 0x0

    .local v6, "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    const/4 v5, 0x0

    .local v5, "event":Lcom/meizu/statsos/UsageStatsProxy$Event;
    const/4 v10, 0x0

    .local v10, "packageName":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "sessionid":Ljava/lang/String;
    move-object v7, v6

    .end local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .local v7, "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v13, v12

    .end local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .local v13, "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :cond_2
    :goto_0
    :try_start_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v14

    if-eqz v14, :cond_6

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v14}, Ljava/util/Map;->size()I

    move-result v14

    sget v15, Lcom/meizu/experiencedatasync/UsageStatsConstants;->OFFLINE_MOBILE_EVENTS_PARCEL_LIMIT:I

    if-ge v14, v15, :cond_6

    invoke-static {v2}, Lcom/meizu/statsos/UsageStatsProviderHelper;->creatEvent(Landroid/database/Cursor;)Lcom/meizu/statsos/UsageStatsProxy$Event;

    move-result-object v5

    if-eqz v5, :cond_2

    if-nez v8, :cond_3

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getFlymeVersion()Ljava/lang/String;

    move-result-object v8

    :cond_3
    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getSessionid()Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v14, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_4

    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :try_start_1
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .end local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    :try_start_2
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v12, v11, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v14, v10, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-object v7, v6

    .end local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v13, v12

    .end local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    goto :goto_0

    :cond_4
    :try_start_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v14, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .end local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :try_start_4
    invoke-interface {v12, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_5

    move-object v13, v12

    .end local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    goto :goto_0

    .end local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :cond_5
    invoke-interface {v12, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .end local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    :try_start_5
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-object v7, v6

    .end local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v13, v12

    .end local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    goto :goto_0

    :cond_6
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    move-object v6, v7

    .end local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v12, v13

    .end local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :goto_1
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/meizu/statsos/UsageStatsUploader;->generateUploadData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .local v3, "data":Lorg/json/JSONObject;
    :goto_2
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    array-length v14, v14

    int-to-long v14, v14

    const-wide/16 v16, 0x2800

    cmp-long v14, v14, v16

    if-lez v14, :cond_0

    const-string v14, "UsageStatsUploader"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "data.size="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->getBytes()[B

    move-result-object v16

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v14}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    if-eqz v9, :cond_7

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/meizu/statsos/UsageStatsUploader;->mPackageSession:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    invoke-interface {v14, v15}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/meizu/statsos/UsageStatsUploader;->generateUploadData(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    goto :goto_2

    .end local v3    # "data":Lorg/json/JSONObject;
    .end local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .end local v9    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :catch_0
    move-exception v4

    move-object v6, v7

    .end local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v12, v13

    .end local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .local v4, "e":Ljava/lang/Exception;
    .restart local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :goto_3
    :try_start_6
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .end local v4    # "e":Ljava/lang/Exception;
    .end local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .end local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :catchall_0
    move-exception v14

    move-object v6, v7

    .end local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    move-object v12, v13

    .end local v13    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    .restart local v12    # "sessions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;>;"
    :goto_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    throw v14

    .restart local v3    # "data":Lorg/json/JSONObject;
    .restart local v9    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_7
    const/4 v3, 0x0

    goto :goto_2

    .end local v3    # "data":Lorg/json/JSONObject;
    .end local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .end local v9    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    :catchall_1
    move-exception v14

    move-object v6, v7

    .end local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    goto :goto_4

    :catchall_2
    move-exception v14

    goto :goto_4

    .end local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    :catch_1
    move-exception v4

    move-object v6, v7

    .end local v7    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    .restart local v6    # "eventList":Ljava/util/List;, "Ljava/util/List<Lcom/meizu/statsos/UsageStatsProxy$Event;>;"
    goto :goto_3

    :catch_2
    move-exception v4

    goto :goto_3
.end method

.method private parcelUmidInfo(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "data"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const-string v0, "imei"

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->getIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "mac"

    iget-object v1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->getMACAddress(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "sn"

    invoke-static {}, Lcom/meizu/experiencedatasync/util/Utils;->getSN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "version"

    const-string v1, "2.0"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "nonce"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/meizu/experiencedatasync/util/Utils;->getIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "U@M##I$$$D"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->getMD5([B)[B

    move-result-object v1

    invoke-static {v1}, Lcom/meizu/experiencedatasync/util/Utils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method static receiverNotifyUpload(Z)V
    .locals 2
    .param p0, "isAlarm"    # Z

    .prologue
    sget-object v0, Lcom/meizu/statsos/UsageStatsUploader;->sUsageStatsUploader:Lcom/meizu/statsos/UsageStatsUploader;

    if-eqz v0, :cond_0

    if-eqz p0, :cond_1

    sget-object v0, Lcom/meizu/statsos/UsageStatsUploader;->sUsageStatsUploader:Lcom/meizu/statsos/UsageStatsUploader;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/meizu/statsos/UsageStatsUploader;->sendEmptyMessage(I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v0, Lcom/meizu/statsos/UsageStatsUploader;->sUsageStatsUploader:Lcom/meizu/statsos/UsageStatsUploader;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lcom/meizu/statsos/UsageStatsUploader;->sendEmptyMessage(I)V

    goto :goto_0
.end method

.method private resetOnlineUploadConditions()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    iput v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mRatio:I

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnlineDayFlowSum:J

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ratio"

    iget v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mRatio:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "online_flow_sum"

    iget-wide v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnlineDayFlowSum:J

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private sendEmptyMessage(I)V
    .locals 1
    .param p1, "what"    # I

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mHandler:Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;

    invoke-virtual {v0, p1}, Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;->sendEmptyMessage(I)Z

    return-void
.end method

.method private sendOfflineUploadAlarm(J)V
    .locals 7
    .param p1, "time"    # J

    .prologue
    const/4 v5, 0x1

    iget-object v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.meizu.usagestats.check_upload"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v4, 0x8000000

    invoke-static {v2, v5, v3, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .local v1, "pIntent":Landroid/app/PendingIntent;
    iget-object v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    const-string v3, "alarm"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .local v0, "alarmManager":Landroid/app/AlarmManager;
    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    const-wide/32 v2, 0x1b77400

    add-long/2addr v2, p1

    invoke-virtual {v0, v5, v2, v3, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    iput-wide p1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mLastAlarmTime:J

    goto :goto_0
.end method

.method private setLastUploadTime(J)V
    .locals 5
    .param p1, "time"    # J

    .prologue
    iput-wide p1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mLastUploadTime:J

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_upload_time"

    iget-wide v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mLastUploadTime:J

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private setTodayAllowUpload(Z)V
    .locals 3
    .param p1, "isAllow"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mAllowUpload:Z

    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "today_upload_flag"

    iget-boolean v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mAllowUpload:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private uploadEvents(Lorg/json/JSONObject;Z)Z
    .locals 8
    .param p1, "data"    # Lorg/json/JSONObject;
    .param p2, "isWifi"    # Z

    .prologue
    const/4 v4, 0x0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return v4

    :cond_1
    if-nez p2, :cond_3

    iget-boolean v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    if-eqz v5, :cond_2

    invoke-direct {p0, p1}, Lcom/meizu/statsos/UsageStatsUploader;->checkOnlineMobile(Lorg/json/JSONObject;)Z

    move-result v5

    if-eqz v5, :cond_0

    :cond_2
    iget-boolean v5, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    if-nez v5, :cond_3

    invoke-direct {p0, p1}, Lcom/meizu/statsos/UsageStatsUploader;->checkOfflineMobile(Lorg/json/JSONObject;)Z

    move-result v5

    if-eqz v5, :cond_0

    :cond_3
    sget-object v5, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_4

    const-string v5, "00000000000000000000000000000000000"

    sget-object v6, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    :cond_4
    invoke-virtual {p0}, Lcom/meizu/statsos/UsageStatsUploader;->requestUmid()V

    :try_start_0
    const-string v5, "umid"

    sget-object v6, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_5
    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, "dataStr":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "UsageStatsUploader"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "uploadEvent data="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/meizu/statsos/UsageStatsUploader;->generateMultipartEntity([B)[Lcom/meizu/experiencedatasync/net/multipart/Part;

    move-result-object v3

    .local v3, "uploadData":[Lcom/meizu/experiencedatasync/net/multipart/Part;
    if-eqz v3, :cond_0

    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    const/4 v5, 0x3

    if-ge v2, v5, :cond_0

    invoke-direct {p0}, Lcom/meizu/statsos/UsageStatsUploader;->isNetworkWorking()Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, "https://uxip.meizu.com/api/upload"

    invoke-static {v5, v3}, Lcom/meizu/experiencedatasync/net/HttpUrlConnectionUtils;->postMultipart(Ljava/lang/String;[Lcom/meizu/experiencedatasync/net/multipart/Part;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/meizu/statsos/UsageStatsUploader;->isUploadSuccess(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v4, "UsageStatsUploader"

    const-string v5, "uploadEvents, upload successfully."

    invoke-static {v4, v5}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/meizu/statsos/UsageStatsUploader;->clearUploadedEvents()V

    const/4 v4, 0x1

    goto :goto_0

    .end local v0    # "dataStr":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "uploadData":[Lcom/meizu/experiencedatasync/net/multipart/Part;
    :catch_0
    move-exception v1

    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v0    # "dataStr":Ljava/lang/String;
    .restart local v2    # "i":I
    .restart local v3    # "uploadData":[Lcom/meizu/experiencedatasync/net/multipart/Part;
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method


# virtual methods
.method checkUpload()V
    .locals 10

    .prologue
    const-wide/32 v8, 0x5265c00

    const/4 v6, 0x1

    iget-boolean v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUpload:Z

    if-nez v2, :cond_1

    const-string v2, "UsageStatsUploader"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "checkUpload, mUpload="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUpload:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mLastUploadTime:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    .local v0, "intervalTime":J
    const-string v2, "UsageStatsUploader"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "checkUpload, mOnline="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", intervalTime="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-wide/32 v4, 0x36ee80

    div-long v4, v0, v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "h, mPowerConnecting="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPowerConnecting:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mLastUploadTime="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mLastUploadTime:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    cmp-long v2, v0, v8

    if-ltz v2, :cond_2

    invoke-direct {p0, v6}, Lcom/meizu/statsos/UsageStatsUploader;->setTodayAllowUpload(Z)V

    :cond_2
    iget-boolean v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mOnline:Z

    if-nez v2, :cond_3

    const-wide/16 v2, 0x0

    iget-wide v4, p0, Lcom/meizu/statsos/UsageStatsUploader;->mLastUploadTime:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_3

    cmp-long v2, v0, v8

    if-gez v2, :cond_3

    iget-boolean v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mPowerConnecting:Z

    if-eqz v2, :cond_0

    const-wide/32 v2, 0x1b77400

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    :cond_3
    iget-object v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mHandler:Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;

    invoke-virtual {v2, v6}, Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;->removeMessages(I)V

    iget-object v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mHandler:Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;

    invoke-virtual {v2, v6}, Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method eventComein()V
    .locals 3

    .prologue
    iget v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mEventCome:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mEventCome:I

    const-string v0, "UsageStatsUploader"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "eventComein, mEventCome="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mEventCome:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mRatio="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mRatio:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mEventCome:I

    sget v1, Lcom/meizu/experiencedatasync/UsageStatsConstants;->ONLINE_EVENTS_THRESHOLD:I

    iget v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mRatio:I

    mul-int/2addr v1, v2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mIsUploadByEventCome:Z

    invoke-virtual {p0}, Lcom/meizu/statsos/UsageStatsUploader;->checkUpload()V

    :cond_0
    return-void
.end method

.method public postRequestUmid()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mHandler:Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;

    new-instance v1, Lcom/meizu/statsos/UsageStatsUploader$2;

    invoke-direct {v1, p0}, Lcom/meizu/statsos/UsageStatsUploader$2;-><init>(Lcom/meizu/statsos/UsageStatsUploader;)V

    invoke-virtual {v0, v1}, Lcom/meizu/statsos/UsageStatsUploader$UploaderHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public requestUmid()V
    .locals 10

    .prologue
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .local v5, "uploadData":Lorg/json/JSONObject;
    invoke-direct {p0, v5}, Lcom/meizu/statsos/UsageStatsUploader;->parcelUmidInfo(Lorg/json/JSONObject;)V

    const/4 v2, 0x0

    .local v2, "response":Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "umid":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "mac":Ljava/lang/String;
    const-string v7, "https://umid.orion.meizu.com/umid/generator"

    invoke-static {v7, v5}, Lcom/meizu/experiencedatasync/net/HttpUrlConnectionUtils;->postJsonPart(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    .end local v1    # "mac":Ljava/lang/String;
    .end local v2    # "response":Ljava/lang/String;
    .end local v4    # "umid":Ljava/lang/String;
    .end local v5    # "uploadData":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .restart local v1    # "mac":Ljava/lang/String;
    .restart local v2    # "response":Ljava/lang/String;
    .restart local v4    # "umid":Ljava/lang/String;
    .restart local v5    # "uploadData":Lorg/json/JSONObject;
    :cond_1
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .local v3, "result":Lorg/json/JSONObject;
    const/16 v7, 0xc8

    const-string v8, "code"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    if-ne v7, v8, :cond_0

    const-string v7, "value"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .local v6, "value":Lorg/json/JSONObject;
    if-eqz v6, :cond_0

    const-string v7, "umid"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v7, "mac"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v4, :cond_2

    sput-object v4, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    iget-object v7, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    sget-object v8, Lcom/meizu/experiencedatasync/UsageStatsConstants;->PREFERENCES_UMID:Ljava/lang/String;

    sget-object v9, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_2
    if-eqz v1, :cond_0

    iget-object v7, p0, Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    sget-object v8, Lcom/meizu/experiencedatasync/UsageStatsConstants;->PREFERENCES_UMID_MAC:Ljava/lang/String;

    invoke-interface {v7, v8, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .end local v1    # "mac":Ljava/lang/String;
    .end local v2    # "response":Ljava/lang/String;
    .end local v3    # "result":Lorg/json/JSONObject;
    .end local v4    # "umid":Ljava/lang/String;
    .end local v5    # "uploadData":Lorg/json/JSONObject;
    .end local v6    # "value":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method setUploaded(Z)V
    .locals 3
    .param p1, "upload"    # Z

    .prologue
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUpload:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUpload:Z

    const-string v0, "UsageStatsUploader"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setUploaded, mUpload="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUpload:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/meizu/statsos/UsageStatusLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-boolean v0, p0, Lcom/meizu/statsos/UsageStatsUploader;->mUpload:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/meizu/statsos/UsageStatsUploader;->checkUpload()V

    :cond_1
    return-void
.end method

.method uploadEvent(Lcom/meizu/statsos/UsageStatsProxy$Event;Z)Z
    .locals 18
    .param p1, "event"    # Lcom/meizu/statsos/UsageStatsProxy$Event;
    .param p2, "isWifi"    # Z

    .prologue
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/meizu/statsos/UsageStatsUploader;->mUpload:Z

    if-eqz v13, :cond_0

    if-nez p1, :cond_1

    :cond_0
    const/4 v13, 0x0

    :goto_0
    return v13

    :cond_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .local v2, "data":Lorg/json/JSONObject;
    :try_start_0
    const-string v13, "ver"

    const-string v14, "2.0"

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getFlymeVersion()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v13}, Lcom/meizu/statsos/UsageStatsUploader;->parcelDeviceInfo(Lorg/json/JSONObject;Ljava/lang/String;)V

    const-string v13, "package"

    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v14, "version"

    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPackageVersion()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_2

    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPackageName()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/meizu/statsos/UsageStatsUploader;->mContext:Landroid/content/Context;

    invoke-static {v13, v15}, Lcom/meizu/experiencedatasync/util/Utils;->getPackageVersion(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    :goto_1
    invoke-virtual {v2, v14, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v13, "sid"

    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getSessionid()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .local v4, "eventJson":Lorg/json/JSONObject;
    const-string v13, "type"

    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getType()I

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/meizu/statsos/UsageStatsUploader;->getEventType(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v13, "name"

    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v13, "time"

    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getTime()J

    move-result-wide v14

    invoke-virtual {v4, v13, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v13, "page"

    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPropertiesToJSONString()Ljava/lang/String;

    move-result-object v8

    .local v8, "propertiesJson":Ljava/lang/String;
    invoke-static {v8}, Lcom/meizu/experiencedatasync/util/Utils;->isEmpty(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_3

    const-string v13, "value"

    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :goto_2
    const-string v13, "event"

    invoke-virtual {v2, v13, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v4    # "eventJson":Lorg/json/JSONObject;
    .end local v8    # "propertiesJson":Ljava/lang/String;
    :goto_3
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result v13

    const/4 v14, 0x1

    if-ge v13, v14, :cond_4

    const/4 v13, 0x0

    goto/16 :goto_0

    :cond_2
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Lcom/meizu/statsos/UsageStatsProxy$Event;->getPackageVersion()Ljava/lang/String;

    move-result-object v13

    goto :goto_1

    .restart local v4    # "eventJson":Lorg/json/JSONObject;
    .restart local v8    # "propertiesJson":Ljava/lang/String;
    :cond_3
    const-string v13, "value"

    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .end local v4    # "eventJson":Lorg/json/JSONObject;
    .end local v8    # "propertiesJson":Ljava/lang/String;
    :catch_0
    move-exception v3

    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_3

    .end local v3    # "e":Lorg/json/JSONException;
    :cond_4
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    .local v9, "pushData":[B
    if-nez v9, :cond_5

    const/4 v13, 0x0

    goto/16 :goto_0

    :cond_5
    if-nez p2, :cond_6

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/meizu/statsos/UsageStatsUploader;->checkOnlineMobile(Lorg/json/JSONObject;)Z

    move-result v13

    if-nez v13, :cond_6

    const/4 v13, 0x0

    goto/16 :goto_0

    :cond_6
    sget-object v13, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_7

    const-string v13, "00000000000000000000000000000000000"

    sget-object v14, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    :cond_7
    invoke-virtual/range {p0 .. p0}, Lcom/meizu/statsos/UsageStatsUploader;->requestUmid()V

    :try_start_2
    const-string v13, "umid"

    sget-object v14, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    invoke-virtual {v2, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    :cond_8
    :goto_4
    invoke-static {v9}, Lcom/meizu/experiencedatasync/util/Utils;->getMD5([B)[B

    move-result-object v13

    invoke-static {v13}, Lcom/meizu/experiencedatasync/util/Utils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v5

    .local v5, "md5":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v14, v14, v16

    long-to-int v12, v14

    .local v12, "tsValue":I
    new-instance v13, Ljava/util/Random;

    invoke-direct {v13}, Ljava/util/Random;-><init>()V

    invoke-virtual {v13}, Ljava/util/Random;->nextInt()I

    move-result v13

    add-int/2addr v13, v12

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    .local v6, "nonce":Ljava/lang/String;
    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v11

    .local v11, "ts":Ljava/lang/String;
    const-string v13, "key=OjUiuYe80AUYnbgBNT6&nonce=%s&ts=%s&md5=%s"

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v6, v14, v15

    const/4 v15, 0x1

    aput-object v11, v14, v15

    const/4 v15, 0x2

    aput-object v5, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v13

    invoke-static {v13}, Lcom/meizu/experiencedatasync/util/Utils;->getMD5([B)[B

    move-result-object v13

    invoke-static {v13}, Lcom/meizu/experiencedatasync/util/Utils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v10

    .local v10, "sign":Ljava/lang/String;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .local v7, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v13, "nonce"

    invoke-interface {v7, v13, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v13, "ts"

    invoke-interface {v7, v13, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v13, "md5"

    invoke-interface {v7, v13, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v13, "sign"

    invoke-interface {v7, v13, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v13, "uxip_data"

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v7, v13, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v13, "https://uxip.meizu.com/api/report/realtime"

    invoke-static {v13, v7}, Lcom/meizu/experiencedatasync/net/HttpUrlConnectionUtils;->postStringPart(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/meizu/statsos/UsageStatsUploader;->isUploadSuccess(Ljava/lang/String;)Z

    move-result v13

    goto/16 :goto_0

    .end local v5    # "md5":Ljava/lang/String;
    .end local v6    # "nonce":Ljava/lang/String;
    .end local v7    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "sign":Ljava/lang/String;
    .end local v11    # "ts":Ljava/lang/String;
    .end local v12    # "tsValue":I
    :catch_1
    move-exception v3

    .restart local v3    # "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_4
.end method
