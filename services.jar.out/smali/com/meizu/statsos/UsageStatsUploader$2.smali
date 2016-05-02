.class Lcom/meizu/statsos/UsageStatsUploader$2;
.super Ljava/lang/Object;
.source "UsageStatsUploader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/meizu/statsos/UsageStatsUploader;->postRequestUmid()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/meizu/statsos/UsageStatsUploader;


# direct methods
.method constructor <init>(Lcom/meizu/statsos/UsageStatsUploader;)V
    .locals 0

    .prologue
    iput-object p1, p0, Lcom/meizu/statsos/UsageStatsUploader$2;->this$0:Lcom/meizu/statsos/UsageStatsUploader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .local v5, "uploadData":Lorg/json/JSONObject;
    iget-object v7, p0, Lcom/meizu/statsos/UsageStatsUploader$2;->this$0:Lcom/meizu/statsos/UsageStatsUploader;

    # invokes: Lcom/meizu/statsos/UsageStatsUploader;->parcelUmidInfo(Lorg/json/JSONObject;)V
    invoke-static {v7, v5}, Lcom/meizu/statsos/UsageStatsUploader;->access$200(Lcom/meizu/statsos/UsageStatsUploader;Lorg/json/JSONObject;)V

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

    if-eqz v4, :cond_2

    sput-object v4, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    iget-object v7, p0, Lcom/meizu/statsos/UsageStatsUploader$2;->this$0:Lcom/meizu/statsos/UsageStatsUploader;

    # getter for: Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;
    invoke-static {v7}, Lcom/meizu/statsos/UsageStatsUploader;->access$300(Lcom/meizu/statsos/UsageStatsUploader;)Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    sget-object v8, Lcom/meizu/experiencedatasync/UsageStatsConstants;->PREFERENCES_UMID:Ljava/lang/String;

    sget-object v9, Lcom/meizu/statsos/UsageStatsManagerServer;->UMID:Ljava/lang/String;

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_2
    const-string v7, "mac"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v7, p0, Lcom/meizu/statsos/UsageStatsUploader$2;->this$0:Lcom/meizu/statsos/UsageStatsUploader;

    # getter for: Lcom/meizu/statsos/UsageStatsUploader;->mSharedPreferences:Landroid/content/SharedPreferences;
    invoke-static {v7}, Lcom/meizu/statsos/UsageStatsUploader;->access$300(Lcom/meizu/statsos/UsageStatsUploader;)Landroid/content/SharedPreferences;

    move-result-object v7

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
