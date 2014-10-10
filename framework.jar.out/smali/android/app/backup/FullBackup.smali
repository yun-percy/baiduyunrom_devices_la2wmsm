.class public Landroid/app/backup/FullBackup;
.super Ljava/lang/Object;
.source "FullBackup.java"


# static fields
.field public static final APK_TREE_TOKEN:Ljava/lang/String; = "a"

.field public static final APPS_PREFIX:Ljava/lang/String; = "apps/"

.field public static final CACHE_TREE_TOKEN:Ljava/lang/String; = "c"

.field public static final CONF_TOKEN_INTENT_EXTRA:Ljava/lang/String; = "conftoken"

.field public static final DATABASE_TREE_TOKEN:Ljava/lang/String; = "db"

.field public static final DATA_TREE_TOKEN:Ljava/lang/String; = "f"

.field public static final FULL_BACKUP_INTENT_ACTION:Ljava/lang/String; = "fullback"

.field public static final FULL_RESTORE_INTENT_ACTION:Ljava/lang/String; = "fullrest"

.field public static final MANAGED_EXTERNAL_TREE_TOKEN:Ljava/lang/String; = "ef"

.field public static final OBB_TREE_TOKEN:Ljava/lang/String; = "obb"

.field public static final ROOT_TREE_TOKEN:Ljava/lang/String; = "r"

.field public static final SHAREDPREFS_TREE_TOKEN:Ljava/lang/String; = "sp"

.field public static final SHARED_PREFIX:Ljava/lang/String; = "shared/"

.field public static final SHARED_STORAGE_TOKEN:Ljava/lang/String; = "shared"

.field static final TAG:Ljava/lang/String; = "FullBackup"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native backupToTar(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/backup/BackupDataOutput;)I
.end method

.method public static restoreFile(Landroid/os/ParcelFileDescriptor;JIJJLjava/io/File;)V
    .locals 18
    .parameter "data"
    .parameter "size"
    .parameter "type"
    .parameter "mode"
    .parameter "mtime"
    .parameter "outFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    const/4 v14, 0x2

    move/from16 v0, p3

    if-ne v0, v14, :cond_2

    .line 101
    if-eqz p8, :cond_0

    invoke-virtual/range {p8 .. p8}, Ljava/io/File;->mkdirs()Z

    .line 164
    :cond_0
    :goto_0
    const-wide/16 v14, 0x0

    cmp-long v14, p4, v14

    if-ltz v14, :cond_1

    if-eqz p8, :cond_1

    .line 167
    const-wide/16 v14, 0x1c0

    and-long p4, p4, v14

    .line 168
    :try_start_0
    sget-object v14, Llibcore/io/Libcore;->os:Llibcore/io/Os;

    invoke-virtual/range {p8 .. p8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v15

    move-wide/from16 v0, p4

    long-to-int v0, v0

    move/from16 v16, v0

    invoke-interface/range {v14 .. v16}, Llibcore/io/Os;->chmod(Ljava/lang/String;I)V
    :try_end_0
    .catch Llibcore/io/ErrnoException; {:try_start_0 .. :try_end_0} :catch_3

    .line 172
    :goto_1
    move-object/from16 v0, p8

    move-wide/from16 v1, p6

    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setLastModified(J)Z

    .line 174
    :cond_1
    return-void

    .line 104
    :cond_2
    const/4 v10, 0x0

    .line 105
    .local v10, out:Ljava/io/FileOutputStream;
    const/4 v6, 0x0

    .line 110
    .local v6, in:Ljava/io/FileInputStream;
    if-eqz p8, :cond_4

    .line 111
    :try_start_1
    invoke-virtual/range {p8 .. p8}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v12

    .line 112
    .local v12, parent:Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_3

    .line 115
    invoke-virtual {v12}, Ljava/io/File;->mkdirs()Z

    .line 117
    :cond_3
    new-instance v11, Ljava/io/FileOutputStream;

    move-object/from16 v0, p8

    invoke-direct {v11, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v10           #out:Ljava/io/FileOutputStream;
    .local v11, out:Ljava/io/FileOutputStream;
    move-object v10, v11

    .line 123
    .end local v11           #out:Ljava/io/FileOutputStream;
    .end local v12           #parent:Ljava/io/File;
    .restart local v10       #out:Ljava/io/FileOutputStream;
    :cond_4
    :goto_2
    const v14, 0x8000

    :try_start_2
    new-array v3, v14, [B

    .line 124
    .local v3, buffer:[B
    move-wide/from16 v8, p1

    .line 125
    .local v8, origSize:J
    new-instance v7, Ljava/io/FileInputStream;

    invoke-virtual/range {p0 .. p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v14

    invoke-direct {v7, v14}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    .end local v6           #in:Ljava/io/FileInputStream;
    .local v7, in:Ljava/io/FileInputStream;
    :goto_3
    const-wide/16 v14, 0x0

    cmp-long v14, p1, v14

    if-lez v14, :cond_5

    .line 127
    :try_start_3
    array-length v14, v3

    int-to-long v14, v14

    cmp-long v14, p1, v14

    if-lez v14, :cond_9

    array-length v13, v3

    .line 128
    .local v13, toRead:I
    :goto_4
    const/4 v14, 0x0

    invoke-virtual {v7, v3, v14, v13}, Ljava/io/FileInputStream;->read([BII)I

    move-result v5

    .line 129
    .local v5, got:I
    if-gtz v5, :cond_a

    .line 130
    const-string v14, "FullBackup"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Incomplete read: expected "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-wide/from16 v0, p1

    invoke-virtual {v15, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " but got "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sub-long v16, v8, p1

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 149
    .end local v5           #got:I
    .end local v13           #toRead:I
    :cond_5
    if-eqz v10, :cond_6

    .line 151
    :try_start_4
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 154
    :cond_6
    :goto_5
    if-eqz v7, :cond_0

    .line 156
    :try_start_5
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_0

    .line 157
    :catch_0
    move-exception v14

    goto/16 :goto_0

    .line 119
    .end local v3           #buffer:[B
    .end local v7           #in:Ljava/io/FileInputStream;
    .end local v8           #origSize:J
    .restart local v6       #in:Ljava/io/FileInputStream;
    :catch_1
    move-exception v4

    .line 120
    .local v4, e:Ljava/io/IOException;
    :try_start_6
    const-string v14, "FullBackup"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Unable to create/open file "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual/range {p8 .. p8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_2

    .line 149
    .end local v4           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v14

    :goto_6
    if-eqz v10, :cond_7

    .line 151
    :try_start_7
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    .line 154
    :cond_7
    :goto_7
    if-eqz v6, :cond_8

    .line 156
    :try_start_8
    invoke-virtual {v6}, Ljava/io/FileInputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    .line 157
    :cond_8
    :goto_8
    throw v14

    .line 127
    .end local v6           #in:Ljava/io/FileInputStream;
    .restart local v3       #buffer:[B
    .restart local v7       #in:Ljava/io/FileInputStream;
    .restart local v8       #origSize:J
    :cond_9
    move-wide/from16 v0, p1

    long-to-int v13, v0

    goto :goto_4

    .line 134
    .restart local v5       #got:I
    .restart local v13       #toRead:I
    :cond_a
    if-eqz v10, :cond_b

    .line 136
    const/4 v14, 0x0

    :try_start_9
    invoke-virtual {v10, v3, v14, v5}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2

    .line 146
    :cond_b
    :goto_9
    int-to-long v14, v5

    sub-long p1, p1, v14

    .line 147
    goto :goto_3

    .line 137
    :catch_2
    move-exception v4

    .line 140
    .restart local v4       #e:Ljava/io/IOException;
    :try_start_a
    const-string v14, "FullBackup"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Unable to write to file "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual/range {p8 .. p8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 141
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V

    .line 142
    const/4 v10, 0x0

    .line 143
    invoke-virtual/range {p8 .. p8}, Ljava/io/File;->delete()Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    goto :goto_9

    .line 149
    .end local v4           #e:Ljava/io/IOException;
    .end local v5           #got:I
    .end local v13           #toRead:I
    :catchall_1
    move-exception v14

    move-object v6, v7

    .end local v7           #in:Ljava/io/FileInputStream;
    .restart local v6       #in:Ljava/io/FileInputStream;
    goto :goto_6

    .line 169
    .end local v3           #buffer:[B
    .end local v6           #in:Ljava/io/FileInputStream;
    .end local v8           #origSize:J
    .end local v10           #out:Ljava/io/FileOutputStream;
    :catch_3
    move-exception v4

    .line 170
    .local v4, e:Llibcore/io/ErrnoException;
    invoke-virtual {v4}, Llibcore/io/ErrnoException;->rethrowAsIOException()Ljava/io/IOException;

    goto/16 :goto_1

    .line 152
    .end local v4           #e:Llibcore/io/ErrnoException;
    .restart local v3       #buffer:[B
    .restart local v7       #in:Ljava/io/FileInputStream;
    .restart local v8       #origSize:J
    .restart local v10       #out:Ljava/io/FileOutputStream;
    :catch_4
    move-exception v14

    goto :goto_5

    .end local v3           #buffer:[B
    .end local v7           #in:Ljava/io/FileInputStream;
    .end local v8           #origSize:J
    .restart local v6       #in:Ljava/io/FileInputStream;
    :catch_5
    move-exception v15

    goto :goto_7

    .line 157
    :catch_6
    move-exception v15

    goto :goto_8
.end method
