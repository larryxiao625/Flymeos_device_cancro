.class public abstract Lcom/meizu/statsos/IUsageStatsManager$Stub;
.super Landroid/os/Binder;
.source "IUsageStatsManager.java"

# interfaces
.implements Lcom/meizu/statsos/IUsageStatsManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/meizu/statsos/IUsageStatsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/meizu/statsos/IUsageStatsManager$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.meizu.stats.IUsageStatsManager"

.field static final TRANSACTION_onEvent:I = 0x2

.field static final TRANSACTION_onEventRealtime:I = 0x3

.field static final TRANSACTION_onPage:I = 0x1

.field static final TRANSACTION_setUploaded:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.meizu.stats.IUsageStatsManager"

    invoke-virtual {p0, p0, v0}, Lcom/meizu/statsos/IUsageStatsManager$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/meizu/statsos/IUsageStatsManager;
    .locals 2
    .param p0, "binder"    # Landroid/os/IBinder;

    .prologue
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    const-string v1, "com.meizu.stats.IUsageStatsManager"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/meizu/statsos/IUsageStatsManager;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/meizu/statsos/IUsageStatsManager;

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/meizu/statsos/IUsageStatsManager$Stub$Proxy;

    .end local v0    # "iin":Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/meizu/statsos/IUsageStatsManager$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    return-object p0
.end method

.method protected onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 9
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v8, 0x1

    sparse-switch p1, :sswitch_data_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v8

    :goto_0
    return v8

    :sswitch_0
    const-string v0, "com.meizu.stats.IUsageStatsManager"

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    :sswitch_1
    const-string v0, "com.meizu.stats.IUsageStatsManager"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    .local v1, "packageName":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-nez v0, :cond_0

    .local v2, "start":Z
    :goto_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .local v3, "name":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    .local v4, "time":J
    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/meizu/statsos/IUsageStatsManager$Stub;->onPage(Ljava/lang/String;ZLjava/lang/String;J)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .end local v2    # "start":Z
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "time":J
    :cond_0
    move v2, v8

    goto :goto_1

    .end local v1    # "packageName":Ljava/lang/String;
    :sswitch_2
    const-string v0, "com.meizu.stats.IUsageStatsManager"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    new-instance v6, Lcom/meizu/statsos/UsageStatsProxy$Event;

    invoke-direct {v6, p2}, Lcom/meizu/statsos/UsageStatsProxy$Event;-><init>(Landroid/os/Parcel;)V

    .local v6, "event":Lcom/meizu/statsos/UsageStatsProxy$Event;
    invoke-virtual {p0, v6}, Lcom/meizu/statsos/IUsageStatsManager$Stub;->onEvent(Lcom/meizu/statsos/UsageStatsProxy$Event;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .end local v6    # "event":Lcom/meizu/statsos/UsageStatsProxy$Event;
    :sswitch_3
    const-string v0, "com.meizu.stats.IUsageStatsManager"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    new-instance v6, Lcom/meizu/statsos/UsageStatsProxy$Event;

    invoke-direct {v6, p2}, Lcom/meizu/statsos/UsageStatsProxy$Event;-><init>(Landroid/os/Parcel;)V

    .restart local v6    # "event":Lcom/meizu/statsos/UsageStatsProxy$Event;
    invoke-virtual {p0, v6}, Lcom/meizu/statsos/IUsageStatsManager$Stub;->onEventRealtime(Lcom/meizu/statsos/UsageStatsProxy$Event;)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .end local v6    # "event":Lcom/meizu/statsos/UsageStatsProxy$Event;
    :sswitch_4
    const-string v0, "com.meizu.stats.IUsageStatsManager"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-nez v0, :cond_1

    move v7, v2

    .local v7, "upload":Z
    :goto_2
    invoke-virtual {p0, v7}, Lcom/meizu/statsos/IUsageStatsManager$Stub;->setUploaded(Z)V

    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .end local v7    # "upload":Z
    :cond_1
    move v7, v8

    goto :goto_2

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
