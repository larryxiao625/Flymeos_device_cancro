.class final Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;
.super Ljava/lang/Object;
.source "TextView.java"

# interfaces
.implements Landroid/view/inputmethod/InputMethodManager$InputShownChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/TextView$FlymeInjector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MzInputShownChangeListener"
.end annotation


# instance fields
.field private tv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;)V
    .locals 0
    .param p1, "textView"    # Landroid/widget/TextView;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;->tv:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public onInputShownChanged(Z)V
    .locals 3
    .param p1, "shown"    # Z

    .prologue
    iget-object v1, p0, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;->tv:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    .local v0, "vh":Landroid/os/Handler;
    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;->tv:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->updateCurrentCursorVisbility(Z)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;->tv:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->invalidate()V

    goto :goto_0

    :cond_2
    new-instance v1, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener$1;

    invoke-direct {v1, p0, p1}, Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener$1;-><init>(Landroid/widget/TextView$FlymeInjector$MzInputShownChangeListener;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
