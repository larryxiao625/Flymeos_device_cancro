.class public Lmeizu/samba/client/SambaAuthException;
.super Ljava/lang/RuntimeException;
.source "SambaAuthException.java"


# static fields
.field private static final serialVersionUID:J = 0x7b689d27d110L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "detailMessage"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    return-void
.end method
