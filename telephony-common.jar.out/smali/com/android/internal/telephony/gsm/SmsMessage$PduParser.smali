.class Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;
.super Ljava/lang/Object;
.source "SmsMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/gsm/SmsMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PduParser"
.end annotation


# instance fields
.field mCur:I

.field mPdu:[B

.field mUserData:[B

.field mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

.field mUserDataSeptetPadding:I


# direct methods
.method constructor <init>([B)V
    .locals 1
    .parameter "pdu"

    .prologue
    const/4 v0, 0x0

    .line 671
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 672
    iput-object p1, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    .line 673
    iput v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 674
    iput v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataSeptetPadding:I

    .line 675
    return-void
.end method


# virtual methods
.method constructUserData(ZZ)I
    .locals 13
    .parameter "hasUserDataHeader"
    .parameter "dataInSeptets"

    .prologue
    const/4 v10, 0x0

    .line 790
    iget v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 791
    .local v4, offset:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    add-int/lit8 v5, v4, 0x1

    .end local v4           #offset:I
    .local v5, offset:I
    aget-byte v9, v9, v4

    and-int/lit16 v8, v9, 0xff

    .line 792
    .local v8, userDataLength:I
    const/4 v3, 0x0

    .line 793
    .local v3, headerSeptets:I
    const/4 v7, 0x0

    .line 795
    .local v7, userDataHeaderLength:I
    if-eqz p1, :cond_6

    .line 796
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    add-int/lit8 v4, v5, 0x1

    .end local v5           #offset:I
    .restart local v4       #offset:I
    aget-byte v9, v9, v5

    and-int/lit16 v7, v9, 0xff

    .line 798
    new-array v6, v7, [B

    .line 799
    .local v6, udh:[B
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    invoke-static {v9, v4, v6, v10, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 800
    invoke-static {v6}, Lcom/android/internal/telephony/SmsHeader;->fromByteArray([B)Lcom/android/internal/telephony/SmsHeader;

    move-result-object v9

    iput-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    .line 801
    add-int/2addr v4, v7

    .line 803
    add-int/lit8 v9, v7, 0x1

    mul-int/lit8 v2, v9, 0x8

    .line 804
    .local v2, headerBits:I
    div-int/lit8 v3, v2, 0x7

    .line 805
    rem-int/lit8 v9, v2, 0x7

    if-lez v9, :cond_1

    const/4 v9, 0x1

    :goto_0
    add-int/2addr v3, v9

    .line 806
    mul-int/lit8 v9, v3, 0x7

    sub-int/2addr v9, v2

    iput v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataSeptetPadding:I

    .line 810
    .end local v2           #headerBits:I
    .end local v6           #udh:[B
    :goto_1
    if-eqz p2, :cond_2

    .line 816
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    array-length v9, v9

    sub-int v0, v9, v4

    .line 828
    .local v0, bufferLen:I
    :cond_0
    :goto_2
    new-array v9, v0, [B

    iput-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    .line 829
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget-object v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    iget-object v12, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    array-length v12, v12

    invoke-static {v9, v4, v11, v10, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 830
    iput v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 832
    if-eqz p2, :cond_5

    .line 834
    sub-int v1, v8, v3

    .line 836
    .local v1, count:I
    if-gez v1, :cond_4

    .line 839
    .end local v1           #count:I
    :goto_3
    return v10

    .end local v0           #bufferLen:I
    .restart local v2       #headerBits:I
    .restart local v6       #udh:[B
    :cond_1
    move v9, v10

    .line 805
    goto :goto_0

    .line 822
    .end local v2           #headerBits:I
    .end local v6           #udh:[B
    :cond_2
    if-eqz p1, :cond_3

    add-int/lit8 v9, v7, 0x1

    :goto_4
    sub-int v0, v8, v9

    .line 823
    .restart local v0       #bufferLen:I
    if-gez v0, :cond_0

    .line 824
    const/4 v0, 0x0

    goto :goto_2

    .end local v0           #bufferLen:I
    :cond_3
    move v9, v10

    .line 822
    goto :goto_4

    .restart local v0       #bufferLen:I
    .restart local v1       #count:I
    :cond_4
    move v10, v1

    .line 836
    goto :goto_3

    .line 839
    .end local v1           #count:I
    :cond_5
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    array-length v10, v9

    goto :goto_3

    .end local v0           #bufferLen:I
    .end local v4           #offset:I
    .restart local v5       #offset:I
    :cond_6
    move v4, v5

    .end local v5           #offset:I
    .restart local v4       #offset:I
    goto :goto_1
.end method

.method getAddress()Lcom/android/internal/telephony/gsm/GsmSmsAddress;
    .locals 6

    .prologue
    .line 725
    iget-object v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v5, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v4, v4, v5

    and-int/lit16 v0, v4, 0xff

    .line 726
    .local v0, addressLength:I
    add-int/lit8 v4, v0, 0x1

    div-int/lit8 v4, v4, 0x2

    add-int/lit8 v2, v4, 0x2

    .line 729
    .local v2, lengthBytes:I
    :try_start_0
    new-instance v3, Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    iget-object v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v5, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    invoke-direct {v3, v4, v5, v2}, Lcom/android/internal/telephony/gsm/GsmSmsAddress;-><init>([BII)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 735
    .local v3, ret:Lcom/android/internal/telephony/gsm/GsmSmsAddress;
    :goto_0
    iget v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/2addr v4, v2

    iput v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 737
    return-object v3

    .line 730
    .end local v3           #ret:Lcom/android/internal/telephony/gsm/GsmSmsAddress;
    :catch_0
    move-exception v1

    .line 731
    .local v1, e:Ljava/text/ParseException;
    const-string v4, "SmsMessage"

    invoke-virtual {v1}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 732
    const/4 v3, 0x0

    .restart local v3       #ret:Lcom/android/internal/telephony/gsm/GsmSmsAddress;
    goto :goto_0
.end method

.method getByte()I
    .locals 3

    .prologue
    .line 711
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v1, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method getSCAddress()Ljava/lang/String;
    .locals 5

    .prologue
    .line 686
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v0

    .line 688
    .local v0, len:I
    if-nez v0, :cond_0

    .line 690
    const/4 v1, 0x0

    .line 702
    .local v1, ret:Ljava/lang/String;
    :goto_0
    iget v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/2addr v3, v0

    iput v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 704
    return-object v1

    .line 694
    .end local v1           #ret:Ljava/lang/String;
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    invoke-static {v3, v4, v0}, Landroid/telephony/PhoneNumberUtils;->calledPartyBCDToString([BII)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .restart local v1       #ret:Ljava/lang/String;
    goto :goto_0

    .line 696
    .end local v1           #ret:Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 697
    .local v2, tr:Ljava/lang/RuntimeException;
    const-string v3, "SmsMessage"

    const-string v4, "invalid SC address: "

    invoke-static {v3, v4, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 698
    const/4 v1, 0x0

    .restart local v1       #ret:Ljava/lang/String;
    goto :goto_0
.end method

.method getSCTimestampMillis()J
    .locals 13

    .prologue
    .line 747
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v8

    .line 748
    .local v8, year:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v3

    .line 749
    .local v3, month:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v0

    .line 750
    .local v0, day:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v1

    .line 751
    .local v1, hour:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v2

    .line 752
    .local v2, minute:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v4

    .line 759
    .local v4, second:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v7, v9, v10

    .line 762
    .local v7, tzByte:B
    and-int/lit8 v9, v7, -0x9

    int-to-byte v9, v9

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v6

    .line 764
    .local v6, timezoneOffset:I
    and-int/lit8 v9, v7, 0x8

    if-nez v9, :cond_0

    .line 766
    :goto_0
    new-instance v5, Landroid/text/format/Time;

    const-string v9, "UTC"

    invoke-direct {v5, v9}, Landroid/text/format/Time;-><init>(Ljava/lang/String;)V

    .line 769
    .local v5, time:Landroid/text/format/Time;
    const/16 v9, 0x5a

    if-lt v8, v9, :cond_1

    add-int/lit16 v9, v8, 0x76c

    :goto_1
    iput v9, v5, Landroid/text/format/Time;->year:I

    .line 770
    add-int/lit8 v9, v3, -0x1

    iput v9, v5, Landroid/text/format/Time;->month:I

    .line 771
    iput v0, v5, Landroid/text/format/Time;->monthDay:I

    .line 772
    iput v1, v5, Landroid/text/format/Time;->hour:I

    .line 773
    iput v2, v5, Landroid/text/format/Time;->minute:I

    .line 774
    iput v4, v5, Landroid/text/format/Time;->second:I

    .line 777
    const/4 v9, 0x1

    invoke-virtual {v5, v9}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v9

    mul-int/lit8 v11, v6, 0xf

    mul-int/lit8 v11, v11, 0x3c

    mul-int/lit16 v11, v11, 0x3e8

    int-to-long v11, v11

    sub-long/2addr v9, v11

    return-wide v9

    .line 764
    .end local v5           #time:Landroid/text/format/Time;
    :cond_0
    neg-int v6, v6

    goto :goto_0

    .line 769
    .restart local v5       #time:Landroid/text/format/Time;
    :cond_1
    add-int/lit16 v9, v8, 0x7d0

    goto :goto_1
.end method

.method getUserData()[B
    .locals 1

    .prologue
    .line 849
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    return-object v0
.end method

.method getUserDataGSM7Bit(III)Ljava/lang/String;
    .locals 7
    .parameter "septetCount"
    .parameter "languageTable"
    .parameter "languageShiftTable"

    .prologue
    .line 872
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v1, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    iget v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataSeptetPadding:I

    move v2, p1

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/android/internal/telephony/GsmAlphabet;->gsm7BitPackedToString([BIIIII)Ljava/lang/String;

    move-result-object v6

    .line 875
    .local v6, ret:Ljava/lang/String;
    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    mul-int/lit8 v1, p1, 0x7

    div-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 877
    return-object v6
.end method

.method getUserDataHeader()Lcom/android/internal/telephony/SmsHeader;
    .locals 1

    .prologue
    .line 858
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    return-object v0
.end method

.method getUserDataKSC5601(I)Ljava/lang/String;
    .locals 5
    .parameter "byteCount"

    .prologue
    .line 912
    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    const-string v4, "KSC5601"

    invoke-direct {v1, v2, v3, p1, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 918
    .local v1, ret:Ljava/lang/String;
    :goto_0
    iget v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/2addr v2, p1

    iput v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 919
    return-object v1

    .line 913
    .end local v1           #ret:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 914
    .local v0, ex:Ljava/io/UnsupportedEncodingException;
    const-string v1, ""

    .line 915
    .restart local v1       #ret:Ljava/lang/String;
    const-string v2, "SmsMessage"

    const-string v3, "implausible UnsupportedEncodingException"

    invoke-static {v2, v3, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method getUserDataUCS2(I)Ljava/lang/String;
    .locals 5
    .parameter "byteCount"

    .prologue
    .line 891
    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    const-string v4, "utf-16"

    invoke-direct {v1, v2, v3, p1, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 897
    .local v1, ret:Ljava/lang/String;
    :goto_0
    iget v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/2addr v2, p1

    iput v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 898
    return-object v1

    .line 892
    .end local v1           #ret:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 893
    .local v0, ex:Ljava/io/UnsupportedEncodingException;
    const-string v1, ""

    .line 894
    .restart local v1       #ret:Ljava/lang/String;
    const-string v2, "SmsMessage"

    const-string v3, "implausible UnsupportedEncodingException"

    invoke-static {v2, v3, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method moreDataPresent()Z
    .locals 2

    .prologue
    .line 923
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    array-length v0, v0

    iget v1, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method