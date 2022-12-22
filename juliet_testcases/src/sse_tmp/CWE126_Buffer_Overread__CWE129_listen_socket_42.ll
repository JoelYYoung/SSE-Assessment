; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_42.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_42_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  %0 = load i32, i32* %data, align 4, !dbg !79
  %call = call i32 @badSource(i32 %0), !dbg !80
  store i32 %call, i32* %data, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !82, metadata !DIExpression()), !dbg !87
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !87
  %2 = load i32, i32* %data, align 4, !dbg !88
  %cmp = icmp sge i32 %2, 0, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !92
  %idxprom = sext i32 %3 to i64, !dbg !94
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !94
  %4 = load i32, i32* %arrayidx, align 4, !dbg !94
  call void @printIntLine(i32 %4), !dbg !95
  br label %if.end, !dbg !96

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !99
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !100 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !105, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !108, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !126, metadata !DIExpression()), !dbg !127
  store i32 -1, i32* %listenSocket, align 4, !dbg !127
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !128, metadata !DIExpression()), !dbg !129
  store i32 -1, i32* %acceptSocket, align 4, !dbg !129
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  br label %do.body, !dbg !132

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !133
  store i32 %call, i32* %listenSocket, align 4, !dbg !135
  %0 = load i32, i32* %listenSocket, align 4, !dbg !136
  %cmp = icmp eq i32 %0, -1, !dbg !138
  br i1 %cmp, label %if.then, label %if.end, !dbg !139

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !140

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !142
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !143
  store i16 2, i16* %sin_family, align 4, !dbg !144
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !145
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !146
  store i32 0, i32* %s_addr, align 4, !dbg !147
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !148
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !149
  store i16 %call1, i16* %sin_port, align 2, !dbg !150
  %2 = load i32, i32* %listenSocket, align 4, !dbg !151
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !153
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !154
  %cmp3 = icmp eq i32 %call2, -1, !dbg !155
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !156

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !157

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !159
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !161
  %cmp7 = icmp eq i32 %call6, -1, !dbg !162
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !163

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !164

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !166
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !167
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !168
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !169
  %cmp11 = icmp eq i32 %6, -1, !dbg !171
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !172

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !173

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !175
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !176
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !177
  %conv = trunc i64 %call14 to i32, !dbg !177
  store i32 %conv, i32* %recvResult, align 4, !dbg !178
  %8 = load i32, i32* %recvResult, align 4, !dbg !179
  %cmp15 = icmp eq i32 %8, -1, !dbg !181
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !182

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !183
  %cmp17 = icmp eq i32 %9, 0, !dbg !184
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !185

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !186

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !188
  %idxprom = sext i32 %10 to i64, !dbg !189
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !189
  store i8 0, i8* %arrayidx, align 1, !dbg !190
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !191
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !192
  store i32 %call22, i32* %data.addr, align 4, !dbg !193
  br label %do.end, !dbg !194

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !195
  %cmp23 = icmp ne i32 %11, -1, !dbg !197
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !198

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !199
  %call26 = call i32 @close(i32 %12), !dbg !201
  br label %if.end27, !dbg !202

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !203
  %cmp28 = icmp ne i32 %13, -1, !dbg !205
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !206

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !207
  %call31 = call i32 @close(i32 %14), !dbg !209
  br label %if.end32, !dbg !210

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data.addr, align 4, !dbg !211
  ret i32 %15, !dbg !212
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_42_good() #0 !dbg !213 {
entry:
  call void @goodB2G(), !dbg !214
  call void @goodG2B(), !dbg !215
  ret void, !dbg !216
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !217 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !222, metadata !DIExpression()), !dbg !223
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !224, metadata !DIExpression()), !dbg !225
  %call = call i64 @time(i64* null) #7, !dbg !226
  %conv = trunc i64 %call to i32, !dbg !227
  call void @srand(i32 %conv) #7, !dbg !228
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !229
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_42_good(), !dbg !230
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !231
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !232
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_42_bad(), !dbg !233
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !234
  ret i32 0, !dbg !235
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #4

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #5

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #4

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #4

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #3

declare dso_local i64 @recv(i32, i8*, i64, i32) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !236 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 -1, i32* %data, align 4, !dbg !239
  %0 = load i32, i32* %data, align 4, !dbg !240
  %call = call i32 @goodB2GSource(i32 %0), !dbg !241
  store i32 %call, i32* %data, align 4, !dbg !242
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !243, metadata !DIExpression()), !dbg !245
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !245
  %2 = load i32, i32* %data, align 4, !dbg !246
  %cmp = icmp sge i32 %2, 0, !dbg !248
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !249

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !250
  %cmp1 = icmp slt i32 %3, 10, !dbg !251
  br i1 %cmp1, label %if.then, label %if.else, !dbg !252

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !253
  %idxprom = sext i32 %4 to i64, !dbg !255
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !255
  %5 = load i32, i32* %arrayidx, align 4, !dbg !255
  call void @printIntLine(i32 %5), !dbg !256
  br label %if.end, !dbg !257

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !258
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !260
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !261 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !264, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !267, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !269, metadata !DIExpression()), !dbg !270
  store i32 -1, i32* %listenSocket, align 4, !dbg !270
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !271, metadata !DIExpression()), !dbg !272
  store i32 -1, i32* %acceptSocket, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !273, metadata !DIExpression()), !dbg !274
  br label %do.body, !dbg !275

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !276
  store i32 %call, i32* %listenSocket, align 4, !dbg !278
  %0 = load i32, i32* %listenSocket, align 4, !dbg !279
  %cmp = icmp eq i32 %0, -1, !dbg !281
  br i1 %cmp, label %if.then, label %if.end, !dbg !282

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !283

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !285
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !285
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !286
  store i16 2, i16* %sin_family, align 4, !dbg !287
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !288
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !289
  store i32 0, i32* %s_addr, align 4, !dbg !290
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !291
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !292
  store i16 %call1, i16* %sin_port, align 2, !dbg !293
  %2 = load i32, i32* %listenSocket, align 4, !dbg !294
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !296
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !297
  %cmp3 = icmp eq i32 %call2, -1, !dbg !298
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !299

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !300

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !302
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !304
  %cmp7 = icmp eq i32 %call6, -1, !dbg !305
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !306

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !307

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !309
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !310
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !311
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !312
  %cmp11 = icmp eq i32 %6, -1, !dbg !314
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !315

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !316

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !318
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !319
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !320
  %conv = trunc i64 %call14 to i32, !dbg !320
  store i32 %conv, i32* %recvResult, align 4, !dbg !321
  %8 = load i32, i32* %recvResult, align 4, !dbg !322
  %cmp15 = icmp eq i32 %8, -1, !dbg !324
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !325

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !326
  %cmp17 = icmp eq i32 %9, 0, !dbg !327
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !328

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !329

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !331
  %idxprom = sext i32 %10 to i64, !dbg !332
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !332
  store i8 0, i8* %arrayidx, align 1, !dbg !333
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !334
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !335
  store i32 %call22, i32* %data.addr, align 4, !dbg !336
  br label %do.end, !dbg !337

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !338
  %cmp23 = icmp ne i32 %11, -1, !dbg !340
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !341

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !342
  %call26 = call i32 @close(i32 %12), !dbg !344
  br label %if.end27, !dbg !345

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !346
  %cmp28 = icmp ne i32 %13, -1, !dbg !348
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !349

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !350
  %call31 = call i32 @close(i32 %14), !dbg !352
  br label %if.end32, !dbg !353

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data.addr, align 4, !dbg !354
  ret i32 %15, !dbg !355
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !356 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !357, metadata !DIExpression()), !dbg !358
  store i32 -1, i32* %data, align 4, !dbg !359
  %0 = load i32, i32* %data, align 4, !dbg !360
  %call = call i32 @goodG2BSource(i32 %0), !dbg !361
  store i32 %call, i32* %data, align 4, !dbg !362
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !363, metadata !DIExpression()), !dbg !365
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !365
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !365
  %2 = load i32, i32* %data, align 4, !dbg !366
  %cmp = icmp sge i32 %2, 0, !dbg !368
  br i1 %cmp, label %if.then, label %if.else, !dbg !369

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !370
  %idxprom = sext i32 %3 to i64, !dbg !372
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !372
  %4 = load i32, i32* %arrayidx, align 4, !dbg !372
  call void @printIntLine(i32 %4), !dbg !373
  br label %if.end, !dbg !374

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !375
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !377
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !378 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !379, metadata !DIExpression()), !dbg !380
  store i32 7, i32* %data.addr, align 4, !dbg !381
  %0 = load i32, i32* %data.addr, align 4, !dbg !382
  ret i32 %0, !dbg !383
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_42.c", directory: "/root/SSE-Assessment")
!2 = !{!3, !16}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !4, line: 24, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15}
!7 = !DIEnumerator(name: "SOCK_STREAM", value: 1)
!8 = !DIEnumerator(name: "SOCK_DGRAM", value: 2)
!9 = !DIEnumerator(name: "SOCK_RAW", value: 3)
!10 = !DIEnumerator(name: "SOCK_RDM", value: 4)
!11 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5)
!12 = !DIEnumerator(name: "SOCK_DCCP", value: 6)
!13 = !DIEnumerator(name: "SOCK_PACKET", value: 10)
!14 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288)
!15 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048)
!16 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !17, line: 40, baseType: !5, size: 32, elements: !18)
!17 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!18 = !{!19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44}
!19 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!20 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!21 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!22 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!23 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!24 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!25 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!26 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!27 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!28 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!29 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!30 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!31 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!32 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!33 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!34 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!35 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!36 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!37 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!38 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!39 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!40 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!41 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!42 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!43 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!44 = !DIEnumerator(name: "IPPROTO_MAX", value: 256)
!45 = !{!5, !46, !51}
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !48, line: 26, baseType: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !50, line: 41, baseType: !5)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !53, line: 175, size: 128, elements: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!54 = !{!55, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !52, file: !53, line: 177, baseType: !56, size: 16)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !57, line: 28, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!58 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !52, file: !53, line: 178, baseType: !60, size: 112, offset: 16)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 112, elements: !62)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !{!63}
!63 = !DISubrange(count: 14)
!64 = !{i32 7, !"Dwarf Version", i32 4}
!65 = !{i32 2, !"Debug Info Version", i32 3}
!66 = !{i32 1, !"wchar_size", i32 4}
!67 = !{i32 7, !"uwtable", i32 1}
!68 = !{i32 7, !"frame-pointer", i32 2}
!69 = !{!"clang version 13.0.0"}
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_42_bad", scope: !71, file: !71, line: 118, type: !72, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_42.c", directory: "/root/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 120, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 120, column: 9, scope: !70)
!78 = !DILocation(line: 122, column: 10, scope: !70)
!79 = !DILocation(line: 123, column: 22, scope: !70)
!80 = !DILocation(line: 123, column: 12, scope: !70)
!81 = !DILocation(line: 123, column: 10, scope: !70)
!82 = !DILocalVariable(name: "buffer", scope: !83, file: !71, line: 125, type: !84)
!83 = distinct !DILexicalBlock(scope: !70, file: !71, line: 124, column: 5)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 10)
!87 = !DILocation(line: 125, column: 13, scope: !83)
!88 = !DILocation(line: 128, column: 13, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !71, line: 128, column: 13)
!90 = !DILocation(line: 128, column: 18, scope: !89)
!91 = !DILocation(line: 128, column: 13, scope: !83)
!92 = !DILocation(line: 130, column: 33, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !71, line: 129, column: 9)
!94 = !DILocation(line: 130, column: 26, scope: !93)
!95 = !DILocation(line: 130, column: 13, scope: !93)
!96 = !DILocation(line: 131, column: 9, scope: !93)
!97 = !DILocation(line: 134, column: 13, scope: !98)
!98 = distinct !DILexicalBlock(scope: !89, file: !71, line: 133, column: 9)
!99 = !DILocation(line: 137, column: 1, scope: !70)
!100 = distinct !DISubprogram(name: "badSource", scope: !71, file: !71, line: 44, type: !101, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!101 = !DISubroutineType(types: !102)
!102 = !{!76, !76}
!103 = !DILocalVariable(name: "data", arg: 1, scope: !100, file: !71, line: 44, type: !76)
!104 = !DILocation(line: 44, column: 26, scope: !100)
!105 = !DILocalVariable(name: "recvResult", scope: !106, file: !71, line: 51, type: !76)
!106 = distinct !DILexicalBlock(scope: !100, file: !71, line: 46, column: 5)
!107 = !DILocation(line: 51, column: 13, scope: !106)
!108 = !DILocalVariable(name: "service", scope: !106, file: !71, line: 52, type: !109)
!109 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !110)
!110 = !{!111, !112, !116, !120}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !109, file: !17, line: 239, baseType: !56, size: 16)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !109, file: !17, line: 240, baseType: !113, size: 16, offset: 16)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !114)
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !115)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !109, file: !17, line: 241, baseType: !117, size: 32, offset: 32)
!117 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !118)
!118 = !{!119}
!119 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !117, file: !17, line: 33, baseType: !46, size: 32)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !109, file: !17, line: 244, baseType: !121, size: 64, offset: 64)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !122, size: 64, elements: !123)
!122 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!123 = !{!124}
!124 = !DISubrange(count: 8)
!125 = !DILocation(line: 52, column: 28, scope: !106)
!126 = !DILocalVariable(name: "listenSocket", scope: !106, file: !71, line: 53, type: !76)
!127 = !DILocation(line: 53, column: 16, scope: !106)
!128 = !DILocalVariable(name: "acceptSocket", scope: !106, file: !71, line: 54, type: !76)
!129 = !DILocation(line: 54, column: 16, scope: !106)
!130 = !DILocalVariable(name: "inputBuffer", scope: !106, file: !71, line: 55, type: !60)
!131 = !DILocation(line: 55, column: 14, scope: !106)
!132 = !DILocation(line: 56, column: 9, scope: !106)
!133 = !DILocation(line: 66, column: 28, scope: !134)
!134 = distinct !DILexicalBlock(scope: !106, file: !71, line: 57, column: 9)
!135 = !DILocation(line: 66, column: 26, scope: !134)
!136 = !DILocation(line: 67, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !71, line: 67, column: 17)
!138 = !DILocation(line: 67, column: 30, scope: !137)
!139 = !DILocation(line: 67, column: 17, scope: !134)
!140 = !DILocation(line: 69, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !71, line: 68, column: 13)
!142 = !DILocation(line: 71, column: 13, scope: !134)
!143 = !DILocation(line: 72, column: 21, scope: !134)
!144 = !DILocation(line: 72, column: 32, scope: !134)
!145 = !DILocation(line: 73, column: 21, scope: !134)
!146 = !DILocation(line: 73, column: 30, scope: !134)
!147 = !DILocation(line: 73, column: 37, scope: !134)
!148 = !DILocation(line: 74, column: 32, scope: !134)
!149 = !DILocation(line: 74, column: 21, scope: !134)
!150 = !DILocation(line: 74, column: 30, scope: !134)
!151 = !DILocation(line: 75, column: 22, scope: !152)
!152 = distinct !DILexicalBlock(scope: !134, file: !71, line: 75, column: 17)
!153 = !DILocation(line: 75, column: 36, scope: !152)
!154 = !DILocation(line: 75, column: 17, scope: !152)
!155 = !DILocation(line: 75, column: 81, scope: !152)
!156 = !DILocation(line: 75, column: 17, scope: !134)
!157 = !DILocation(line: 77, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !152, file: !71, line: 76, column: 13)
!159 = !DILocation(line: 79, column: 24, scope: !160)
!160 = distinct !DILexicalBlock(scope: !134, file: !71, line: 79, column: 17)
!161 = !DILocation(line: 79, column: 17, scope: !160)
!162 = !DILocation(line: 79, column: 54, scope: !160)
!163 = !DILocation(line: 79, column: 17, scope: !134)
!164 = !DILocation(line: 81, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !160, file: !71, line: 80, column: 13)
!166 = !DILocation(line: 83, column: 35, scope: !134)
!167 = !DILocation(line: 83, column: 28, scope: !134)
!168 = !DILocation(line: 83, column: 26, scope: !134)
!169 = !DILocation(line: 84, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !134, file: !71, line: 84, column: 17)
!171 = !DILocation(line: 84, column: 30, scope: !170)
!172 = !DILocation(line: 84, column: 17, scope: !134)
!173 = !DILocation(line: 86, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !71, line: 85, column: 13)
!175 = !DILocation(line: 89, column: 31, scope: !134)
!176 = !DILocation(line: 89, column: 45, scope: !134)
!177 = !DILocation(line: 89, column: 26, scope: !134)
!178 = !DILocation(line: 89, column: 24, scope: !134)
!179 = !DILocation(line: 90, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !134, file: !71, line: 90, column: 17)
!181 = !DILocation(line: 90, column: 28, scope: !180)
!182 = !DILocation(line: 90, column: 44, scope: !180)
!183 = !DILocation(line: 90, column: 47, scope: !180)
!184 = !DILocation(line: 90, column: 58, scope: !180)
!185 = !DILocation(line: 90, column: 17, scope: !134)
!186 = !DILocation(line: 92, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !180, file: !71, line: 91, column: 13)
!188 = !DILocation(line: 95, column: 25, scope: !134)
!189 = !DILocation(line: 95, column: 13, scope: !134)
!190 = !DILocation(line: 95, column: 37, scope: !134)
!191 = !DILocation(line: 97, column: 25, scope: !134)
!192 = !DILocation(line: 97, column: 20, scope: !134)
!193 = !DILocation(line: 97, column: 18, scope: !134)
!194 = !DILocation(line: 98, column: 9, scope: !134)
!195 = !DILocation(line: 100, column: 13, scope: !196)
!196 = distinct !DILexicalBlock(scope: !106, file: !71, line: 100, column: 13)
!197 = !DILocation(line: 100, column: 26, scope: !196)
!198 = !DILocation(line: 100, column: 13, scope: !106)
!199 = !DILocation(line: 102, column: 26, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !71, line: 101, column: 9)
!201 = !DILocation(line: 102, column: 13, scope: !200)
!202 = !DILocation(line: 103, column: 9, scope: !200)
!203 = !DILocation(line: 104, column: 13, scope: !204)
!204 = distinct !DILexicalBlock(scope: !106, file: !71, line: 104, column: 13)
!205 = !DILocation(line: 104, column: 26, scope: !204)
!206 = !DILocation(line: 104, column: 13, scope: !106)
!207 = !DILocation(line: 106, column: 26, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !71, line: 105, column: 9)
!209 = !DILocation(line: 106, column: 13, scope: !208)
!210 = !DILocation(line: 107, column: 9, scope: !208)
!211 = !DILocation(line: 115, column: 12, scope: !100)
!212 = !DILocation(line: 115, column: 5, scope: !100)
!213 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_42_good", scope: !71, file: !71, line: 268, type: !72, scopeLine: 269, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!214 = !DILocation(line: 270, column: 5, scope: !213)
!215 = !DILocation(line: 271, column: 5, scope: !213)
!216 = !DILocation(line: 272, column: 1, scope: !213)
!217 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 283, type: !218, scopeLine: 284, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!218 = !DISubroutineType(types: !219)
!219 = !{!76, !76, !220}
!220 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !221, size: 64)
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!222 = !DILocalVariable(name: "argc", arg: 1, scope: !217, file: !71, line: 283, type: !76)
!223 = !DILocation(line: 283, column: 14, scope: !217)
!224 = !DILocalVariable(name: "argv", arg: 2, scope: !217, file: !71, line: 283, type: !220)
!225 = !DILocation(line: 283, column: 27, scope: !217)
!226 = !DILocation(line: 286, column: 22, scope: !217)
!227 = !DILocation(line: 286, column: 12, scope: !217)
!228 = !DILocation(line: 286, column: 5, scope: !217)
!229 = !DILocation(line: 288, column: 5, scope: !217)
!230 = !DILocation(line: 289, column: 5, scope: !217)
!231 = !DILocation(line: 290, column: 5, scope: !217)
!232 = !DILocation(line: 293, column: 5, scope: !217)
!233 = !DILocation(line: 294, column: 5, scope: !217)
!234 = !DILocation(line: 295, column: 5, scope: !217)
!235 = !DILocation(line: 297, column: 5, scope: !217)
!236 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 248, type: !72, scopeLine: 249, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!237 = !DILocalVariable(name: "data", scope: !236, file: !71, line: 250, type: !76)
!238 = !DILocation(line: 250, column: 9, scope: !236)
!239 = !DILocation(line: 252, column: 10, scope: !236)
!240 = !DILocation(line: 253, column: 26, scope: !236)
!241 = !DILocation(line: 253, column: 12, scope: !236)
!242 = !DILocation(line: 253, column: 10, scope: !236)
!243 = !DILocalVariable(name: "buffer", scope: !244, file: !71, line: 255, type: !84)
!244 = distinct !DILexicalBlock(scope: !236, file: !71, line: 254, column: 5)
!245 = !DILocation(line: 255, column: 13, scope: !244)
!246 = !DILocation(line: 257, column: 13, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !71, line: 257, column: 13)
!248 = !DILocation(line: 257, column: 18, scope: !247)
!249 = !DILocation(line: 257, column: 23, scope: !247)
!250 = !DILocation(line: 257, column: 26, scope: !247)
!251 = !DILocation(line: 257, column: 31, scope: !247)
!252 = !DILocation(line: 257, column: 13, scope: !244)
!253 = !DILocation(line: 259, column: 33, scope: !254)
!254 = distinct !DILexicalBlock(scope: !247, file: !71, line: 258, column: 9)
!255 = !DILocation(line: 259, column: 26, scope: !254)
!256 = !DILocation(line: 259, column: 13, scope: !254)
!257 = !DILocation(line: 260, column: 9, scope: !254)
!258 = !DILocation(line: 263, column: 13, scope: !259)
!259 = distinct !DILexicalBlock(scope: !247, file: !71, line: 262, column: 9)
!260 = !DILocation(line: 266, column: 1, scope: !236)
!261 = distinct !DISubprogram(name: "goodB2GSource", scope: !71, file: !71, line: 174, type: !101, scopeLine: 175, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!262 = !DILocalVariable(name: "data", arg: 1, scope: !261, file: !71, line: 174, type: !76)
!263 = !DILocation(line: 174, column: 30, scope: !261)
!264 = !DILocalVariable(name: "recvResult", scope: !265, file: !71, line: 181, type: !76)
!265 = distinct !DILexicalBlock(scope: !261, file: !71, line: 176, column: 5)
!266 = !DILocation(line: 181, column: 13, scope: !265)
!267 = !DILocalVariable(name: "service", scope: !265, file: !71, line: 182, type: !109)
!268 = !DILocation(line: 182, column: 28, scope: !265)
!269 = !DILocalVariable(name: "listenSocket", scope: !265, file: !71, line: 183, type: !76)
!270 = !DILocation(line: 183, column: 16, scope: !265)
!271 = !DILocalVariable(name: "acceptSocket", scope: !265, file: !71, line: 184, type: !76)
!272 = !DILocation(line: 184, column: 16, scope: !265)
!273 = !DILocalVariable(name: "inputBuffer", scope: !265, file: !71, line: 185, type: !60)
!274 = !DILocation(line: 185, column: 14, scope: !265)
!275 = !DILocation(line: 186, column: 9, scope: !265)
!276 = !DILocation(line: 196, column: 28, scope: !277)
!277 = distinct !DILexicalBlock(scope: !265, file: !71, line: 187, column: 9)
!278 = !DILocation(line: 196, column: 26, scope: !277)
!279 = !DILocation(line: 197, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !277, file: !71, line: 197, column: 17)
!281 = !DILocation(line: 197, column: 30, scope: !280)
!282 = !DILocation(line: 197, column: 17, scope: !277)
!283 = !DILocation(line: 199, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !71, line: 198, column: 13)
!285 = !DILocation(line: 201, column: 13, scope: !277)
!286 = !DILocation(line: 202, column: 21, scope: !277)
!287 = !DILocation(line: 202, column: 32, scope: !277)
!288 = !DILocation(line: 203, column: 21, scope: !277)
!289 = !DILocation(line: 203, column: 30, scope: !277)
!290 = !DILocation(line: 203, column: 37, scope: !277)
!291 = !DILocation(line: 204, column: 32, scope: !277)
!292 = !DILocation(line: 204, column: 21, scope: !277)
!293 = !DILocation(line: 204, column: 30, scope: !277)
!294 = !DILocation(line: 205, column: 22, scope: !295)
!295 = distinct !DILexicalBlock(scope: !277, file: !71, line: 205, column: 17)
!296 = !DILocation(line: 205, column: 36, scope: !295)
!297 = !DILocation(line: 205, column: 17, scope: !295)
!298 = !DILocation(line: 205, column: 81, scope: !295)
!299 = !DILocation(line: 205, column: 17, scope: !277)
!300 = !DILocation(line: 207, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !295, file: !71, line: 206, column: 13)
!302 = !DILocation(line: 209, column: 24, scope: !303)
!303 = distinct !DILexicalBlock(scope: !277, file: !71, line: 209, column: 17)
!304 = !DILocation(line: 209, column: 17, scope: !303)
!305 = !DILocation(line: 209, column: 54, scope: !303)
!306 = !DILocation(line: 209, column: 17, scope: !277)
!307 = !DILocation(line: 211, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !303, file: !71, line: 210, column: 13)
!309 = !DILocation(line: 213, column: 35, scope: !277)
!310 = !DILocation(line: 213, column: 28, scope: !277)
!311 = !DILocation(line: 213, column: 26, scope: !277)
!312 = !DILocation(line: 214, column: 17, scope: !313)
!313 = distinct !DILexicalBlock(scope: !277, file: !71, line: 214, column: 17)
!314 = !DILocation(line: 214, column: 30, scope: !313)
!315 = !DILocation(line: 214, column: 17, scope: !277)
!316 = !DILocation(line: 216, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !71, line: 215, column: 13)
!318 = !DILocation(line: 219, column: 31, scope: !277)
!319 = !DILocation(line: 219, column: 45, scope: !277)
!320 = !DILocation(line: 219, column: 26, scope: !277)
!321 = !DILocation(line: 219, column: 24, scope: !277)
!322 = !DILocation(line: 220, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !277, file: !71, line: 220, column: 17)
!324 = !DILocation(line: 220, column: 28, scope: !323)
!325 = !DILocation(line: 220, column: 44, scope: !323)
!326 = !DILocation(line: 220, column: 47, scope: !323)
!327 = !DILocation(line: 220, column: 58, scope: !323)
!328 = !DILocation(line: 220, column: 17, scope: !277)
!329 = !DILocation(line: 222, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !323, file: !71, line: 221, column: 13)
!331 = !DILocation(line: 225, column: 25, scope: !277)
!332 = !DILocation(line: 225, column: 13, scope: !277)
!333 = !DILocation(line: 225, column: 37, scope: !277)
!334 = !DILocation(line: 227, column: 25, scope: !277)
!335 = !DILocation(line: 227, column: 20, scope: !277)
!336 = !DILocation(line: 227, column: 18, scope: !277)
!337 = !DILocation(line: 228, column: 9, scope: !277)
!338 = !DILocation(line: 230, column: 13, scope: !339)
!339 = distinct !DILexicalBlock(scope: !265, file: !71, line: 230, column: 13)
!340 = !DILocation(line: 230, column: 26, scope: !339)
!341 = !DILocation(line: 230, column: 13, scope: !265)
!342 = !DILocation(line: 232, column: 26, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !71, line: 231, column: 9)
!344 = !DILocation(line: 232, column: 13, scope: !343)
!345 = !DILocation(line: 233, column: 9, scope: !343)
!346 = !DILocation(line: 234, column: 13, scope: !347)
!347 = distinct !DILexicalBlock(scope: !265, file: !71, line: 234, column: 13)
!348 = !DILocation(line: 234, column: 26, scope: !347)
!349 = !DILocation(line: 234, column: 13, scope: !265)
!350 = !DILocation(line: 236, column: 26, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !71, line: 235, column: 9)
!352 = !DILocation(line: 236, column: 13, scope: !351)
!353 = !DILocation(line: 237, column: 9, scope: !351)
!354 = !DILocation(line: 245, column: 12, scope: !261)
!355 = !DILocation(line: 245, column: 5, scope: !261)
!356 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 152, type: !72, scopeLine: 153, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!357 = !DILocalVariable(name: "data", scope: !356, file: !71, line: 154, type: !76)
!358 = !DILocation(line: 154, column: 9, scope: !356)
!359 = !DILocation(line: 156, column: 10, scope: !356)
!360 = !DILocation(line: 157, column: 26, scope: !356)
!361 = !DILocation(line: 157, column: 12, scope: !356)
!362 = !DILocation(line: 157, column: 10, scope: !356)
!363 = !DILocalVariable(name: "buffer", scope: !364, file: !71, line: 159, type: !84)
!364 = distinct !DILexicalBlock(scope: !356, file: !71, line: 158, column: 5)
!365 = !DILocation(line: 159, column: 13, scope: !364)
!366 = !DILocation(line: 162, column: 13, scope: !367)
!367 = distinct !DILexicalBlock(scope: !364, file: !71, line: 162, column: 13)
!368 = !DILocation(line: 162, column: 18, scope: !367)
!369 = !DILocation(line: 162, column: 13, scope: !364)
!370 = !DILocation(line: 164, column: 33, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !71, line: 163, column: 9)
!372 = !DILocation(line: 164, column: 26, scope: !371)
!373 = !DILocation(line: 164, column: 13, scope: !371)
!374 = !DILocation(line: 165, column: 9, scope: !371)
!375 = !DILocation(line: 168, column: 13, scope: !376)
!376 = distinct !DILexicalBlock(scope: !367, file: !71, line: 167, column: 9)
!377 = !DILocation(line: 171, column: 1, scope: !356)
!378 = distinct !DISubprogram(name: "goodG2BSource", scope: !71, file: !71, line: 144, type: !101, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!379 = !DILocalVariable(name: "data", arg: 1, scope: !378, file: !71, line: 144, type: !76)
!380 = !DILocation(line: 144, column: 30, scope: !378)
!381 = !DILocation(line: 148, column: 10, scope: !378)
!382 = !DILocation(line: 149, column: 12, scope: !378)
!383 = !DILocation(line: 149, column: 5, scope: !378)
