.class Lcom/meizu/widget/DragGridView$1;
.super Landroid/database/DataSetObserver;
.source "DragGridView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/meizu/widget/DragGridView;->setAdapter(Landroid/widget/ListAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/meizu/widget/DragGridView;


# direct methods
.method constructor <init>(Lcom/meizu/widget/DragGridView;)V
    .locals 0

    .prologue
    iput-object p1, p0, Lcom/meizu/widget/DragGridView$1;->this$0:Lcom/meizu/widget/DragGridView;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .prologue
    invoke-super {p0}, Landroid/database/DataSetObserver;->onChanged()V

    iget-object v0, p0, Lcom/meizu/widget/DragGridView$1;->this$0:Lcom/meizu/widget/DragGridView;

    # invokes: Lcom/meizu/widget/DragGridView;->handleDataChange()V
    invoke-static {v0}, Lcom/meizu/widget/DragGridView;->access$000(Lcom/meizu/widget/DragGridView;)V

    return-void
.end method

.method public onInvalidated()V
    .locals 0

    .prologue
    invoke-super {p0}, Landroid/database/DataSetObserver;->onInvalidated()V

    return-void
.end method
