.class Landroid/webkit/ClientCertRequestHandler$1;
.super Ljava/lang/Object;
.source "ClientCertRequestHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/webkit/ClientCertRequestHandler;->proceed(Ljava/security/PrivateKey;[Ljava/security/cert/X509Certificate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/webkit/ClientCertRequestHandler;


# direct methods
.method constructor <init>(Landroid/webkit/ClientCertRequestHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 66
    iput-object p1, p0, Landroid/webkit/ClientCertRequestHandler$1;->this$0:Landroid/webkit/ClientCertRequestHandler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 68
    iget-object v0, p0, Landroid/webkit/ClientCertRequestHandler$1;->this$0:Landroid/webkit/ClientCertRequestHandler;

    #getter for: Landroid/webkit/ClientCertRequestHandler;->mBrowserFrame:Landroid/webkit/BrowserFrame;
    invoke-static {v0}, Landroid/webkit/ClientCertRequestHandler;->access$100(Landroid/webkit/ClientCertRequestHandler;)Landroid/webkit/BrowserFrame;

    move-result-object v1

    iget-object v0, p0, Landroid/webkit/ClientCertRequestHandler$1;->this$0:Landroid/webkit/ClientCertRequestHandler;

    #getter for: Landroid/webkit/ClientCertRequestHandler;->mHandle:I
    invoke-static {v0}, Landroid/webkit/ClientCertRequestHandler;->access$000(Landroid/webkit/ClientCertRequestHandler;)I

    move-result v2

    const-wide/16 v3, 0x0

    const/4 v0, 0x0

    check-cast v0, [[B

    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/webkit/BrowserFrame;->nativeSslClientCert(IJ[[B)V

    .line 69
    return-void
.end method
