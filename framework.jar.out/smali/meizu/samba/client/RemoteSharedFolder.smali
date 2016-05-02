.class public Lmeizu/samba/client/RemoteSharedFolder;
.super Ljava/lang/Object;
.source "RemoteSharedFolder.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lmeizu/samba/client/RemoteSharedFolder;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public domain:Ljava/lang/String;

.field public password:Ljava/lang/String;

.field public path:Ljava/lang/String;

.field public user:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    new-instance v0, Lmeizu/samba/client/RemoteSharedFolder$1;

    invoke-direct {v0}, Lmeizu/samba/client/RemoteSharedFolder$1;-><init>()V

    sput-object v0, Lmeizu/samba/client/RemoteSharedFolder;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lmeizu/samba/client/RemoteSharedFolder;->path:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lmeizu/samba/client/RemoteSharedFolder;->user:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lmeizu/samba/client/RemoteSharedFolder;->domain:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lmeizu/samba/client/RemoteSharedFolder;->password:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "domain"    # Ljava/lang/String;
    .param p3, "password"    # Ljava/lang/String;
    .param p4, "path"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    const-string p1, ""

    :cond_0
    if-nez p2, :cond_1

    const-string p2, ""

    :cond_1
    if-nez p3, :cond_2

    const-string p3, ""

    :cond_2
    if-nez p4, :cond_3

    const-string p4, ""

    :cond_3
    iput-object p4, p0, Lmeizu/samba/client/RemoteSharedFolder;->path:Ljava/lang/String;

    iput-object p1, p0, Lmeizu/samba/client/RemoteSharedFolder;->user:Ljava/lang/String;

    iput-object p2, p0, Lmeizu/samba/client/RemoteSharedFolder;->domain:Ljava/lang/String;

    iput-object p3, p0, Lmeizu/samba/client/RemoteSharedFolder;->password:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .local v1, "sb":Ljava/lang/StringBuffer;
    const-string v0, "<none>"

    .local v0, "none":Ljava/lang/String;
    const-string v2, "path: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v2, p0, Lmeizu/samba/client/RemoteSharedFolder;->path:Ljava/lang/String;

    if-nez v2, :cond_0

    move-object v2, v0

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", user: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v2, p0, Lmeizu/samba/client/RemoteSharedFolder;->user:Ljava/lang/String;

    if-nez v2, :cond_1

    move-object v2, v0

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", domain: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lmeizu/samba/client/RemoteSharedFolder;->domain:Ljava/lang/String;

    if-nez v3, :cond_2

    .end local v0    # "none":Ljava/lang/String;
    :goto_2
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .restart local v0    # "none":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lmeizu/samba/client/RemoteSharedFolder;->path:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lmeizu/samba/client/RemoteSharedFolder;->user:Ljava/lang/String;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lmeizu/samba/client/RemoteSharedFolder;->domain:Ljava/lang/String;

    goto :goto_2
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    iget-object v0, p0, Lmeizu/samba/client/RemoteSharedFolder;->user:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lmeizu/samba/client/RemoteSharedFolder;->domain:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lmeizu/samba/client/RemoteSharedFolder;->password:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lmeizu/samba/client/RemoteSharedFolder;->path:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
