.class public abstract Lcom/meizu/experiencedatasync/net/multipart/Part;
.super Ljava/lang/Object;
.source "Part.java"


# static fields
.field protected static final BOUNDARY:Ljava/lang/String; = "----------------314159265358979323846"

.field protected static final BOUNDARY_BYTES:[B

.field protected static final CHARSET:Ljava/lang/String; = "; charset="

.field protected static final CHARSET_BYTES:[B

.field protected static final CONTENT_DISPOSITION:Ljava/lang/String; = "Content-Disposition: form-data; name="

.field protected static final CONTENT_DISPOSITION_BYTES:[B

.field protected static final CONTENT_TRANSFER_ENCODING:Ljava/lang/String; = "Content-Transfer-Encoding: "

.field protected static final CONTENT_TRANSFER_ENCODING_BYTES:[B

.field protected static final CONTENT_TYPE:Ljava/lang/String; = "Content-Type: "

.field protected static final CONTENT_TYPE_BYTES:[B

.field protected static final CRLF:Ljava/lang/String; = "\r\n"

.field protected static final CRLF_BYTES:[B

.field private static final DEFAULT_BOUNDARY_BYTES:[B

.field protected static final EXTRA:Ljava/lang/String; = "--"

.field protected static final EXTRA_BYTES:[B

.field protected static final QUOTE:Ljava/lang/String; = "\""

.field protected static final QUOTE_BYTES:[B


# instance fields
.field private boundaryBytes:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-string v0, "----------------314159265358979323846"

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->BOUNDARY_BYTES:[B

    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->BOUNDARY_BYTES:[B

    sput-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->DEFAULT_BOUNDARY_BYTES:[B

    const-string v0, "\r\n"

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->CRLF_BYTES:[B

    const-string v0, "\""

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->QUOTE_BYTES:[B

    const-string v0, "--"

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->EXTRA_BYTES:[B

    const-string v0, "Content-Disposition: form-data; name="

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->CONTENT_DISPOSITION_BYTES:[B

    const-string v0, "Content-Type: "

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->CONTENT_TYPE_BYTES:[B

    const-string v0, "; charset="

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->CHARSET_BYTES:[B

    const-string v0, "Content-Transfer-Encoding: "

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->CONTENT_TRANSFER_ENCODING_BYTES:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBoundary()Ljava/lang/String;
    .locals 1

    .prologue
    const-string v0, "----------------314159265358979323846"

    return-object v0
.end method

.method public static getLengthOfParts([Lcom/meizu/experiencedatasync/net/multipart/Part;)J
    .locals 2
    .param p0, "parts"    # [Lcom/meizu/experiencedatasync/net/multipart/Part;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->DEFAULT_BOUNDARY_BYTES:[B

    invoke-static {p0, v0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->getLengthOfParts([Lcom/meizu/experiencedatasync/net/multipart/Part;[B)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getLengthOfParts([Lcom/meizu/experiencedatasync/net/multipart/Part;[B)J
    .locals 8
    .param p0, "parts"    # [Lcom/meizu/experiencedatasync/net/multipart/Part;
    .param p1, "partBoundary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v6, "Parts may not be null"

    invoke-direct {v1, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    const-wide/16 v4, 0x0

    .local v4, "total":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_2

    aget-object v1, p0, v0

    invoke-virtual {v1, p1}, Lcom/meizu/experiencedatasync/net/multipart/Part;->setPartBoundary([B)V

    aget-object v1, p0, v0

    invoke-virtual {v1}, Lcom/meizu/experiencedatasync/net/multipart/Part;->length()J

    move-result-wide v2

    .local v2, "l":J
    const-wide/16 v6, 0x0

    cmp-long v1, v2, v6

    if-gez v1, :cond_1

    const-wide/16 v6, -0x1

    .end local v2    # "l":J
    :goto_1
    return-wide v6

    .restart local v2    # "l":J
    :cond_1
    add-long/2addr v4, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v2    # "l":J
    :cond_2
    sget-object v1, Lcom/meizu/experiencedatasync/net/multipart/Part;->EXTRA_BYTES:[B

    array-length v1, v1

    int-to-long v6, v1

    add-long/2addr v4, v6

    array-length v1, p1

    int-to-long v6, v1

    add-long/2addr v4, v6

    sget-object v1, Lcom/meizu/experiencedatasync/net/multipart/Part;->EXTRA_BYTES:[B

    array-length v1, v1

    int-to-long v6, v1

    add-long/2addr v4, v6

    sget-object v1, Lcom/meizu/experiencedatasync/net/multipart/Part;->CRLF_BYTES:[B

    array-length v1, v1

    int-to-long v6, v1

    add-long/2addr v4, v6

    move-wide v6, v4

    goto :goto_1
.end method

.method public static sendParts(Ljava/io/OutputStream;[Lcom/meizu/experiencedatasync/net/multipart/Part;)V
    .locals 1
    .param p0, "out"    # Ljava/io/OutputStream;
    .param p1, "parts"    # [Lcom/meizu/experiencedatasync/net/multipart/Part;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->DEFAULT_BOUNDARY_BYTES:[B

    invoke-static {p0, p1, v0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendParts(Ljava/io/OutputStream;[Lcom/meizu/experiencedatasync/net/multipart/Part;[B)V

    return-void
.end method

.method public static sendParts(Ljava/io/OutputStream;[Lcom/meizu/experiencedatasync/net/multipart/Part;[B)V
    .locals 3
    .param p0, "out"    # Ljava/io/OutputStream;
    .param p1, "parts"    # [Lcom/meizu/experiencedatasync/net/multipart/Part;
    .param p2, "partBoundary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Parts may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    if-eqz p2, :cond_1

    array-length v1, p2

    if-nez v1, :cond_2

    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "partBoundary may not be empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_3

    aget-object v1, p1, v0

    invoke-virtual {v1, p2}, Lcom/meizu/experiencedatasync/net/multipart/Part;->setPartBoundary([B)V

    aget-object v1, p1, v0

    invoke-virtual {v1, p0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->send(Ljava/io/OutputStream;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    sget-object v1, Lcom/meizu/experiencedatasync/net/multipart/Part;->EXTRA_BYTES:[B

    invoke-virtual {p0, v1}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0, p2}, Ljava/io/OutputStream;->write([B)V

    sget-object v1, Lcom/meizu/experiencedatasync/net/multipart/Part;->EXTRA_BYTES:[B

    invoke-virtual {p0, v1}, Ljava/io/OutputStream;->write([B)V

    sget-object v1, Lcom/meizu/experiencedatasync/net/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p0, v1}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method


# virtual methods
.method public abstract getCharSet()Ljava/lang/String;
.end method

.method public abstract getContentType()Ljava/lang/String;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method protected getPartBoundary()[B
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/meizu/experiencedatasync/net/multipart/Part;->boundaryBytes:[B

    if-nez v0, :cond_0

    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->DEFAULT_BOUNDARY_BYTES:[B

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/meizu/experiencedatasync/net/multipart/Part;->boundaryBytes:[B

    goto :goto_0
.end method

.method public abstract getTransferEncoding()Ljava/lang/String;
.end method

.method public isRepeatable()Z
    .locals 1

    .prologue
    const/4 v0, 0x1

    return v0
.end method

.method public length()J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    invoke-virtual {p0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->lengthOfData()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    const-wide/16 v2, -0x1

    :goto_0
    return-wide v2

    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .local v0, "overhead":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendStart(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendDispositionHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendContentTypeHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendTransferEncodingHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendEndOfHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendEnd(Ljava/io/OutputStream;)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {p0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->lengthOfData()J

    move-result-wide v4

    add-long/2addr v2, v4

    goto :goto_0
.end method

.method protected abstract lengthOfData()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public send(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    invoke-virtual {p0, p1}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendStart(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendDispositionHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendContentTypeHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendTransferEncodingHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendEndOfHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendData(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcom/meizu/experiencedatasync/net/multipart/Part;->sendEnd(Ljava/io/OutputStream;)V

    return-void
.end method

.method protected sendContentTypeHeader(Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    invoke-virtual {p0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->getContentType()Ljava/lang/String;

    move-result-object v1

    .local v1, "contentType":Ljava/lang/String;
    if-eqz v1, :cond_0

    sget-object v2, Lcom/meizu/experiencedatasync/net/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    sget-object v2, Lcom/meizu/experiencedatasync/net/multipart/Part;->CONTENT_TYPE_BYTES:[B

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    invoke-static {v1}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->getCharSet()Ljava/lang/String;

    move-result-object v0

    .local v0, "charSet":Ljava/lang/String;
    if-eqz v0, :cond_0

    sget-object v2, Lcom/meizu/experiencedatasync/net/multipart/Part;->CHARSET_BYTES:[B

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .end local v0    # "charSet":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method protected abstract sendData(Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected sendDispositionHeader(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->CONTENT_DISPOSITION_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->QUOTE_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->QUOTE_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method protected sendEnd(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method protected sendEndOfHeader(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method protected sendStart(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->EXTRA_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->getPartBoundary()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    sget-object v0, Lcom/meizu/experiencedatasync/net/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method protected sendTransferEncodingHeader(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    invoke-virtual {p0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->getTransferEncoding()Ljava/lang/String;

    move-result-object v0

    .local v0, "transferEncoding":Ljava/lang/String;
    if-eqz v0, :cond_0

    sget-object v1, Lcom/meizu/experiencedatasync/net/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    sget-object v1, Lcom/meizu/experiencedatasync/net/multipart/Part;->CONTENT_TRANSFER_ENCODING_BYTES:[B

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    :cond_0
    return-void
.end method

.method setPartBoundary([B)V
    .locals 0
    .param p1, "boundaryBytes"    # [B

    .prologue
    iput-object p1, p0, Lcom/meizu/experiencedatasync/net/multipart/Part;->boundaryBytes:[B

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    invoke-virtual {p0}, Lcom/meizu/experiencedatasync/net/multipart/Part;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method