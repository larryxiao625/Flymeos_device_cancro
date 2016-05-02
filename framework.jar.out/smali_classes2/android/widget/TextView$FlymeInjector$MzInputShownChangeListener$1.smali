.class Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener$1;
.super Ljava/lang/Object;
.source "TextView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;->onInputShownChanged(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;

.field final synthetic val$shown:Z


# direct methods
.method constructor <init>(Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;Z)V
    .locals 0

    .prologue
    iput-object p1, p0, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener$1;->this$0:Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;

    iput-boolean p2, p0, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener$1;->val$shown:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    iget-object v0, p0, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener$1;->this$0:Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;

    iget-boolean v1, p0, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener$1;->val$shown:Z

    invoke-virtual {v0, v1}, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;->onInputShownChanged(Z)V

    return-void
.end method
