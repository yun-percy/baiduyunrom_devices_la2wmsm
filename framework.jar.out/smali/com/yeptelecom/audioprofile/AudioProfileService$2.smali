.class Lcom/yeptelecom/audioprofile/AudioProfileService$2;
.super Lcom/yeptelecom/common/audioprofile/AudioProfileListener;
.source "AudioProfileService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yeptelecom/audioprofile/AudioProfileService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;


# direct methods
.method constructor <init>(Lcom/yeptelecom/audioprofile/AudioProfileService;)V
    .locals 0
    .parameter

    .prologue
    .line 243
    iput-object p1, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    invoke-direct {p0}, Lcom/yeptelecom/common/audioprofile/AudioProfileListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onRingerVolumeChanged(IILjava/lang/String;)V
    .locals 4
    .parameter "oldVolume"
    .parameter "newVolume"
    .parameter "extra"

    .prologue
    .line 246
    if-ne p1, p2, :cond_1

    .line 247
    const-string v2, "AudioProfileService"

    const-string/jumbo v3, "onRingerVolumeChanged with Volume don\'t change, do nothing!"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    :cond_0
    :goto_0
    return-void

    .line 252
    :cond_1
    iget-object v2, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    #getter for: Lcom/yeptelecom/audioprofile/AudioProfileService;->mExt:Lcom/yeptelecom/common/audioprofile/IAudioProfileExtension;
    invoke-static {v2}, Lcom/yeptelecom/audioprofile/AudioProfileService;->access$200(Lcom/yeptelecom/audioprofile/AudioProfileService;)Lcom/yeptelecom/common/audioprofile/IAudioProfileExtension;

    move-result-object v2

    invoke-interface {v2, p1, p2, p3}, Lcom/yeptelecom/common/audioprofile/IAudioProfileExtension;->onRingerVolumeChanged(IILjava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 254
    iget-object v2, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    #getter for: Lcom/yeptelecom/audioprofile/AudioProfileService;->mProfileStates:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/yeptelecom/audioprofile/AudioProfileService;->access$600(Lcom/yeptelecom/audioprofile/AudioProfileService;)Ljava/util/HashMap;

    move-result-object v2

    iget-object v3, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    #getter for: Lcom/yeptelecom/audioprofile/AudioProfileService;->mActiveProfileKey:Ljava/lang/String;
    invoke-static {v3}, Lcom/yeptelecom/audioprofile/AudioProfileService;->access$300(Lcom/yeptelecom/audioprofile/AudioProfileService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/yeptelecom/audioprofile/AudioProfileState;

    .line 255
    .local v0, activeProfileState:Lcom/yeptelecom/audioprofile/AudioProfileState;
    iget-object v2, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    #getter for: Lcom/yeptelecom/audioprofile/AudioProfileService;->mActiveProfileKey:Ljava/lang/String;
    invoke-static {v2}, Lcom/yeptelecom/audioprofile/AudioProfileService;->access$300(Lcom/yeptelecom/audioprofile/AudioProfileService;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/yeptelecom/audioprofile/AudioProfileManager;->getScenario(Ljava/lang/String;)Lcom/yeptelecom/audioprofile/AudioProfileManager$Scenario;

    move-result-object v1

    .line 256
    .local v1, activeScenario:Lcom/yeptelecom/audioprofile/AudioProfileManager$Scenario;
    sget-object v2, Lcom/yeptelecom/audioprofile/AudioProfileService$8;->$SwitchMap$com$yeptelecom$audioprofile$AudioProfileManager$Scenario:[I

    invoke-virtual {v1}, Lcom/yeptelecom/audioprofile/AudioProfileManager$Scenario;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 292
    if-lez p1, :cond_0

    if-nez p2, :cond_0

    .line 293
    iget-object v2, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    iget-object v3, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    #getter for: Lcom/yeptelecom/audioprofile/AudioProfileService;->mLastActiveProfileKey:Ljava/lang/String;
    invoke-static {v3}, Lcom/yeptelecom/audioprofile/AudioProfileService;->access$700(Lcom/yeptelecom/audioprofile/AudioProfileService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p1, p2, v3}, Lcom/yeptelecom/audioprofile/AudioProfileService;->notifyRingerVolumeChanged(IILjava/lang/String;)V

    .line 294
    iget-object v2, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    iget-object v3, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    #getter for: Lcom/yeptelecom/audioprofile/AudioProfileService;->mLastActiveProfileKey:Ljava/lang/String;
    invoke-static {v3}, Lcom/yeptelecom/audioprofile/AudioProfileService;->access$700(Lcom/yeptelecom/audioprofile/AudioProfileService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, p2}, Lcom/yeptelecom/audioprofile/AudioProfileService;->syncRingerVolumeToProfile(Ljava/lang/String;I)V

    .line 295
    const-string v2, "AudioProfileService"

    const-string/jumbo v3, "onRingerVolumeChanged: sync volume 1->0 to last active profile when it cause ringemode change!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 275
    :pswitch_0
    iget v2, v0, Lcom/yeptelecom/audioprofile/AudioProfileState;->mRingerVolume:I

    if-eq v2, p2, :cond_0

    .line 278
    iget-object v2, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    iget-object v3, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    #getter for: Lcom/yeptelecom/audioprofile/AudioProfileService;->mActiveProfileKey:Ljava/lang/String;
    invoke-static {v3}, Lcom/yeptelecom/audioprofile/AudioProfileService;->access$300(Lcom/yeptelecom/audioprofile/AudioProfileService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p1, p2, v3}, Lcom/yeptelecom/audioprofile/AudioProfileService;->notifyRingerVolumeChanged(IILjava/lang/String;)V

    .line 279
    iget-object v2, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    iget-object v3, p0, Lcom/yeptelecom/audioprofile/AudioProfileService$2;->this$0:Lcom/yeptelecom/audioprofile/AudioProfileService;

    #getter for: Lcom/yeptelecom/audioprofile/AudioProfileService;->mActiveProfileKey:Ljava/lang/String;
    invoke-static {v3}, Lcom/yeptelecom/audioprofile/AudioProfileService;->access$300(Lcom/yeptelecom/audioprofile/AudioProfileService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, p2}, Lcom/yeptelecom/audioprofile/AudioProfileService;->syncRingerVolumeToProfile(Ljava/lang/String;I)V

    .line 280
    const-string v2, "AudioProfileService"

    const-string/jumbo v3, "onRingerVolumeChanged: ringer volume changed, sysn to active profile except silent, meeting and outdoor!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 256
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
