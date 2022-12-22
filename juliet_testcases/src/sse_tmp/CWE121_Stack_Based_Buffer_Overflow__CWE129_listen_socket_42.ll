; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  %0 = load i32, i32* %data, align 4, !dbg !79
  %call = call i32 @badSource(i32 %0), !dbg !80
  store i32 %call, i32* %data, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata i32* %i, metadata !82, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !85, metadata !DIExpression()), !dbg !89
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !89
  %2 = load i32, i32* %data, align 4, !dbg !90
  %cmp = icmp sge i32 %2, 0, !dbg !92
  br i1 %cmp, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !94
  %idxprom = sext i32 %3 to i64, !dbg !96
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !96
  store i32 1, i32* %arrayidx, align 4, !dbg !97
  store i32 0, i32* %i, align 4, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !101
  %cmp1 = icmp slt i32 %4, 10, !dbg !103
  br i1 %cmp1, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !105
  %idxprom2 = sext i32 %5 to i64, !dbg !107
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !107
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !107
  call void @printIntLine(i32 %6), !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !110
  %inc = add nsw i32 %7, 1, !dbg !110
  store i32 %inc, i32* %i, align 4, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !118
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !119 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !127, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !145, metadata !DIExpression()), !dbg !146
  store i32 -1, i32* %listenSocket, align 4, !dbg !146
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !147, metadata !DIExpression()), !dbg !148
  store i32 -1, i32* %acceptSocket, align 4, !dbg !148
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  br label %do.body, !dbg !151

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !152
  store i32 %call, i32* %listenSocket, align 4, !dbg !154
  %0 = load i32, i32* %listenSocket, align 4, !dbg !155
  %cmp = icmp eq i32 %0, -1, !dbg !157
  br i1 %cmp, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !159

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !161
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !162
  store i16 2, i16* %sin_family, align 4, !dbg !163
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !164
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !165
  store i32 0, i32* %s_addr, align 4, !dbg !166
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !167
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !168
  store i16 %call1, i16* %sin_port, align 2, !dbg !169
  %2 = load i32, i32* %listenSocket, align 4, !dbg !170
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !172
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !173
  %cmp3 = icmp eq i32 %call2, -1, !dbg !174
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !175

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !176

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !178
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !180
  %cmp7 = icmp eq i32 %call6, -1, !dbg !181
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !182

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !183

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !185
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !186
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !187
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !188
  %cmp11 = icmp eq i32 %6, -1, !dbg !190
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !191

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !192

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !194
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !195
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !196
  %conv = trunc i64 %call14 to i32, !dbg !196
  store i32 %conv, i32* %recvResult, align 4, !dbg !197
  %8 = load i32, i32* %recvResult, align 4, !dbg !198
  %cmp15 = icmp eq i32 %8, -1, !dbg !200
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !201

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !202
  %cmp17 = icmp eq i32 %9, 0, !dbg !203
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !204

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !205

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !207
  %idxprom = sext i32 %10 to i64, !dbg !208
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !208
  store i8 0, i8* %arrayidx, align 1, !dbg !209
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !210
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !211
  store i32 %call22, i32* %data.addr, align 4, !dbg !212
  br label %do.end, !dbg !213

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !214
  %cmp23 = icmp ne i32 %11, -1, !dbg !216
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !217

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !218
  %call26 = call i32 @close(i32 %12), !dbg !220
  br label %if.end27, !dbg !221

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !222
  %cmp28 = icmp ne i32 %13, -1, !dbg !224
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !225

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !226
  %call31 = call i32 @close(i32 %14), !dbg !228
  br label %if.end32, !dbg !229

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data.addr, align 4, !dbg !230
  ret i32 %15, !dbg !231
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_good() #0 !dbg !232 {
entry:
  call void @goodB2G(), !dbg !233
  call void @goodG2B(), !dbg !234
  ret void, !dbg !235
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !236 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !241, metadata !DIExpression()), !dbg !242
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !243, metadata !DIExpression()), !dbg !244
  %call = call i64 @time(i64* null) #7, !dbg !245
  %conv = trunc i64 %call to i32, !dbg !246
  call void @srand(i32 %conv) #7, !dbg !247
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !248
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_good(), !dbg !249
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !250
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !251
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_bad(), !dbg !252
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !253
  ret i32 0, !dbg !254
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
define internal void @goodB2G() #0 !dbg !255 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !256, metadata !DIExpression()), !dbg !257
  store i32 -1, i32* %data, align 4, !dbg !258
  %0 = load i32, i32* %data, align 4, !dbg !259
  %call = call i32 @goodB2GSource(i32 %0), !dbg !260
  store i32 %call, i32* %data, align 4, !dbg !261
  call void @llvm.dbg.declare(metadata i32* %i, metadata !262, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !265, metadata !DIExpression()), !dbg !266
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !266
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !266
  %2 = load i32, i32* %data, align 4, !dbg !267
  %cmp = icmp sge i32 %2, 0, !dbg !269
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !270

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !271
  %cmp1 = icmp slt i32 %3, 10, !dbg !272
  br i1 %cmp1, label %if.then, label %if.else, !dbg !273

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !274
  %idxprom = sext i32 %4 to i64, !dbg !276
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !276
  store i32 1, i32* %arrayidx, align 4, !dbg !277
  store i32 0, i32* %i, align 4, !dbg !278
  br label %for.cond, !dbg !280

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !281
  %cmp2 = icmp slt i32 %5, 10, !dbg !283
  br i1 %cmp2, label %for.body, label %for.end, !dbg !284

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !285
  %idxprom3 = sext i32 %6 to i64, !dbg !287
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !287
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !287
  call void @printIntLine(i32 %7), !dbg !288
  br label %for.inc, !dbg !289

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !290
  %inc = add nsw i32 %8, 1, !dbg !290
  store i32 %inc, i32* %i, align 4, !dbg !290
  br label %for.cond, !dbg !291, !llvm.loop !292

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !294

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !295
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !297
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !298 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !299, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !301, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !304, metadata !DIExpression()), !dbg !305
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !306, metadata !DIExpression()), !dbg !307
  store i32 -1, i32* %listenSocket, align 4, !dbg !307
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !308, metadata !DIExpression()), !dbg !309
  store i32 -1, i32* %acceptSocket, align 4, !dbg !309
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !310, metadata !DIExpression()), !dbg !311
  br label %do.body, !dbg !312

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !313
  store i32 %call, i32* %listenSocket, align 4, !dbg !315
  %0 = load i32, i32* %listenSocket, align 4, !dbg !316
  %cmp = icmp eq i32 %0, -1, !dbg !318
  br i1 %cmp, label %if.then, label %if.end, !dbg !319

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !320

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !322
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !322
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !323
  store i16 2, i16* %sin_family, align 4, !dbg !324
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !325
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !326
  store i32 0, i32* %s_addr, align 4, !dbg !327
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !328
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !329
  store i16 %call1, i16* %sin_port, align 2, !dbg !330
  %2 = load i32, i32* %listenSocket, align 4, !dbg !331
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !333
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !334
  %cmp3 = icmp eq i32 %call2, -1, !dbg !335
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !336

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !337

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !339
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !341
  %cmp7 = icmp eq i32 %call6, -1, !dbg !342
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !343

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !344

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !346
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !347
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !348
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !349
  %cmp11 = icmp eq i32 %6, -1, !dbg !351
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !352

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !353

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !355
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !356
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !357
  %conv = trunc i64 %call14 to i32, !dbg !357
  store i32 %conv, i32* %recvResult, align 4, !dbg !358
  %8 = load i32, i32* %recvResult, align 4, !dbg !359
  %cmp15 = icmp eq i32 %8, -1, !dbg !361
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !362

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !363
  %cmp17 = icmp eq i32 %9, 0, !dbg !364
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !365

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !366

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !368
  %idxprom = sext i32 %10 to i64, !dbg !369
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !369
  store i8 0, i8* %arrayidx, align 1, !dbg !370
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !371
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !372
  store i32 %call22, i32* %data.addr, align 4, !dbg !373
  br label %do.end, !dbg !374

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !375
  %cmp23 = icmp ne i32 %11, -1, !dbg !377
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !378

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !379
  %call26 = call i32 @close(i32 %12), !dbg !381
  br label %if.end27, !dbg !382

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !383
  %cmp28 = icmp ne i32 %13, -1, !dbg !385
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !386

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !387
  %call31 = call i32 @close(i32 %14), !dbg !389
  br label %if.end32, !dbg !390

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data.addr, align 4, !dbg !391
  ret i32 %15, !dbg !392
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !393 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !394, metadata !DIExpression()), !dbg !395
  store i32 -1, i32* %data, align 4, !dbg !396
  %0 = load i32, i32* %data, align 4, !dbg !397
  %call = call i32 @goodG2BSource(i32 %0), !dbg !398
  store i32 %call, i32* %data, align 4, !dbg !399
  call void @llvm.dbg.declare(metadata i32* %i, metadata !400, metadata !DIExpression()), !dbg !402
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !403, metadata !DIExpression()), !dbg !404
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !404
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !404
  %2 = load i32, i32* %data, align 4, !dbg !405
  %cmp = icmp sge i32 %2, 0, !dbg !407
  br i1 %cmp, label %if.then, label %if.else, !dbg !408

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !409
  %idxprom = sext i32 %3 to i64, !dbg !411
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !411
  store i32 1, i32* %arrayidx, align 4, !dbg !412
  store i32 0, i32* %i, align 4, !dbg !413
  br label %for.cond, !dbg !415

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !416
  %cmp1 = icmp slt i32 %4, 10, !dbg !418
  br i1 %cmp1, label %for.body, label %for.end, !dbg !419

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !420
  %idxprom2 = sext i32 %5 to i64, !dbg !422
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !422
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !422
  call void @printIntLine(i32 %6), !dbg !423
  br label %for.inc, !dbg !424

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !425
  %inc = add nsw i32 %7, 1, !dbg !425
  store i32 %inc, i32* %i, align 4, !dbg !425
  br label %for.cond, !dbg !426, !llvm.loop !427

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !429

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !430
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !432
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !433 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !434, metadata !DIExpression()), !dbg !435
  store i32 7, i32* %data.addr, align 4, !dbg !436
  %0 = load i32, i32* %data.addr, align 4, !dbg !437
  ret i32 %0, !dbg !438
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42.c", directory: "/root/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_bad", scope: !71, file: !71, line: 118, type: !72, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42.c", directory: "/root/SSE-Assessment")
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
!82 = !DILocalVariable(name: "i", scope: !83, file: !71, line: 125, type: !76)
!83 = distinct !DILexicalBlock(scope: !70, file: !71, line: 124, column: 5)
!84 = !DILocation(line: 125, column: 13, scope: !83)
!85 = !DILocalVariable(name: "buffer", scope: !83, file: !71, line: 126, type: !86)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !87)
!87 = !{!88}
!88 = !DISubrange(count: 10)
!89 = !DILocation(line: 126, column: 13, scope: !83)
!90 = !DILocation(line: 129, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !71, line: 129, column: 13)
!92 = !DILocation(line: 129, column: 18, scope: !91)
!93 = !DILocation(line: 129, column: 13, scope: !83)
!94 = !DILocation(line: 131, column: 20, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !71, line: 130, column: 9)
!96 = !DILocation(line: 131, column: 13, scope: !95)
!97 = !DILocation(line: 131, column: 26, scope: !95)
!98 = !DILocation(line: 133, column: 19, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !71, line: 133, column: 13)
!100 = !DILocation(line: 133, column: 17, scope: !99)
!101 = !DILocation(line: 133, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !71, line: 133, column: 13)
!103 = !DILocation(line: 133, column: 26, scope: !102)
!104 = !DILocation(line: 133, column: 13, scope: !99)
!105 = !DILocation(line: 135, column: 37, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !71, line: 134, column: 13)
!107 = !DILocation(line: 135, column: 30, scope: !106)
!108 = !DILocation(line: 135, column: 17, scope: !106)
!109 = !DILocation(line: 136, column: 13, scope: !106)
!110 = !DILocation(line: 133, column: 33, scope: !102)
!111 = !DILocation(line: 133, column: 13, scope: !102)
!112 = distinct !{!112, !104, !113, !114}
!113 = !DILocation(line: 136, column: 13, scope: !99)
!114 = !{!"llvm.loop.mustprogress"}
!115 = !DILocation(line: 137, column: 9, scope: !95)
!116 = !DILocation(line: 140, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !91, file: !71, line: 139, column: 9)
!118 = !DILocation(line: 143, column: 1, scope: !70)
!119 = distinct !DISubprogram(name: "badSource", scope: !71, file: !71, line: 44, type: !120, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!120 = !DISubroutineType(types: !121)
!121 = !{!76, !76}
!122 = !DILocalVariable(name: "data", arg: 1, scope: !119, file: !71, line: 44, type: !76)
!123 = !DILocation(line: 44, column: 26, scope: !119)
!124 = !DILocalVariable(name: "recvResult", scope: !125, file: !71, line: 51, type: !76)
!125 = distinct !DILexicalBlock(scope: !119, file: !71, line: 46, column: 5)
!126 = !DILocation(line: 51, column: 13, scope: !125)
!127 = !DILocalVariable(name: "service", scope: !125, file: !71, line: 52, type: !128)
!128 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !129)
!129 = !{!130, !131, !135, !139}
!130 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !128, file: !17, line: 239, baseType: !56, size: 16)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !128, file: !17, line: 240, baseType: !132, size: 16, offset: 16)
!132 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !133)
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !134)
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !128, file: !17, line: 241, baseType: !136, size: 32, offset: 32)
!136 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !137)
!137 = !{!138}
!138 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !136, file: !17, line: 33, baseType: !46, size: 32)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !128, file: !17, line: 244, baseType: !140, size: 64, offset: 64)
!140 = !DICompositeType(tag: DW_TAG_array_type, baseType: !141, size: 64, elements: !142)
!141 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!142 = !{!143}
!143 = !DISubrange(count: 8)
!144 = !DILocation(line: 52, column: 28, scope: !125)
!145 = !DILocalVariable(name: "listenSocket", scope: !125, file: !71, line: 53, type: !76)
!146 = !DILocation(line: 53, column: 16, scope: !125)
!147 = !DILocalVariable(name: "acceptSocket", scope: !125, file: !71, line: 54, type: !76)
!148 = !DILocation(line: 54, column: 16, scope: !125)
!149 = !DILocalVariable(name: "inputBuffer", scope: !125, file: !71, line: 55, type: !60)
!150 = !DILocation(line: 55, column: 14, scope: !125)
!151 = !DILocation(line: 56, column: 9, scope: !125)
!152 = !DILocation(line: 66, column: 28, scope: !153)
!153 = distinct !DILexicalBlock(scope: !125, file: !71, line: 57, column: 9)
!154 = !DILocation(line: 66, column: 26, scope: !153)
!155 = !DILocation(line: 67, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !71, line: 67, column: 17)
!157 = !DILocation(line: 67, column: 30, scope: !156)
!158 = !DILocation(line: 67, column: 17, scope: !153)
!159 = !DILocation(line: 69, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !71, line: 68, column: 13)
!161 = !DILocation(line: 71, column: 13, scope: !153)
!162 = !DILocation(line: 72, column: 21, scope: !153)
!163 = !DILocation(line: 72, column: 32, scope: !153)
!164 = !DILocation(line: 73, column: 21, scope: !153)
!165 = !DILocation(line: 73, column: 30, scope: !153)
!166 = !DILocation(line: 73, column: 37, scope: !153)
!167 = !DILocation(line: 74, column: 32, scope: !153)
!168 = !DILocation(line: 74, column: 21, scope: !153)
!169 = !DILocation(line: 74, column: 30, scope: !153)
!170 = !DILocation(line: 75, column: 22, scope: !171)
!171 = distinct !DILexicalBlock(scope: !153, file: !71, line: 75, column: 17)
!172 = !DILocation(line: 75, column: 36, scope: !171)
!173 = !DILocation(line: 75, column: 17, scope: !171)
!174 = !DILocation(line: 75, column: 81, scope: !171)
!175 = !DILocation(line: 75, column: 17, scope: !153)
!176 = !DILocation(line: 77, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !171, file: !71, line: 76, column: 13)
!178 = !DILocation(line: 79, column: 24, scope: !179)
!179 = distinct !DILexicalBlock(scope: !153, file: !71, line: 79, column: 17)
!180 = !DILocation(line: 79, column: 17, scope: !179)
!181 = !DILocation(line: 79, column: 54, scope: !179)
!182 = !DILocation(line: 79, column: 17, scope: !153)
!183 = !DILocation(line: 81, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !179, file: !71, line: 80, column: 13)
!185 = !DILocation(line: 83, column: 35, scope: !153)
!186 = !DILocation(line: 83, column: 28, scope: !153)
!187 = !DILocation(line: 83, column: 26, scope: !153)
!188 = !DILocation(line: 84, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !153, file: !71, line: 84, column: 17)
!190 = !DILocation(line: 84, column: 30, scope: !189)
!191 = !DILocation(line: 84, column: 17, scope: !153)
!192 = !DILocation(line: 86, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !71, line: 85, column: 13)
!194 = !DILocation(line: 89, column: 31, scope: !153)
!195 = !DILocation(line: 89, column: 45, scope: !153)
!196 = !DILocation(line: 89, column: 26, scope: !153)
!197 = !DILocation(line: 89, column: 24, scope: !153)
!198 = !DILocation(line: 90, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !153, file: !71, line: 90, column: 17)
!200 = !DILocation(line: 90, column: 28, scope: !199)
!201 = !DILocation(line: 90, column: 44, scope: !199)
!202 = !DILocation(line: 90, column: 47, scope: !199)
!203 = !DILocation(line: 90, column: 58, scope: !199)
!204 = !DILocation(line: 90, column: 17, scope: !153)
!205 = !DILocation(line: 92, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !71, line: 91, column: 13)
!207 = !DILocation(line: 95, column: 25, scope: !153)
!208 = !DILocation(line: 95, column: 13, scope: !153)
!209 = !DILocation(line: 95, column: 37, scope: !153)
!210 = !DILocation(line: 97, column: 25, scope: !153)
!211 = !DILocation(line: 97, column: 20, scope: !153)
!212 = !DILocation(line: 97, column: 18, scope: !153)
!213 = !DILocation(line: 98, column: 9, scope: !153)
!214 = !DILocation(line: 100, column: 13, scope: !215)
!215 = distinct !DILexicalBlock(scope: !125, file: !71, line: 100, column: 13)
!216 = !DILocation(line: 100, column: 26, scope: !215)
!217 = !DILocation(line: 100, column: 13, scope: !125)
!218 = !DILocation(line: 102, column: 26, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !71, line: 101, column: 9)
!220 = !DILocation(line: 102, column: 13, scope: !219)
!221 = !DILocation(line: 103, column: 9, scope: !219)
!222 = !DILocation(line: 104, column: 13, scope: !223)
!223 = distinct !DILexicalBlock(scope: !125, file: !71, line: 104, column: 13)
!224 = !DILocation(line: 104, column: 26, scope: !223)
!225 = !DILocation(line: 104, column: 13, scope: !125)
!226 = !DILocation(line: 106, column: 26, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !71, line: 105, column: 9)
!228 = !DILocation(line: 106, column: 13, scope: !227)
!229 = !DILocation(line: 107, column: 9, scope: !227)
!230 = !DILocation(line: 115, column: 12, scope: !119)
!231 = !DILocation(line: 115, column: 5, scope: !119)
!232 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_good", scope: !71, file: !71, line: 286, type: !72, scopeLine: 287, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!233 = !DILocation(line: 288, column: 5, scope: !232)
!234 = !DILocation(line: 289, column: 5, scope: !232)
!235 = !DILocation(line: 290, column: 1, scope: !232)
!236 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 301, type: !237, scopeLine: 302, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!237 = !DISubroutineType(types: !238)
!238 = !{!76, !76, !239}
!239 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!241 = !DILocalVariable(name: "argc", arg: 1, scope: !236, file: !71, line: 301, type: !76)
!242 = !DILocation(line: 301, column: 14, scope: !236)
!243 = !DILocalVariable(name: "argv", arg: 2, scope: !236, file: !71, line: 301, type: !239)
!244 = !DILocation(line: 301, column: 27, scope: !236)
!245 = !DILocation(line: 304, column: 22, scope: !236)
!246 = !DILocation(line: 304, column: 12, scope: !236)
!247 = !DILocation(line: 304, column: 5, scope: !236)
!248 = !DILocation(line: 306, column: 5, scope: !236)
!249 = !DILocation(line: 307, column: 5, scope: !236)
!250 = !DILocation(line: 308, column: 5, scope: !236)
!251 = !DILocation(line: 311, column: 5, scope: !236)
!252 = !DILocation(line: 312, column: 5, scope: !236)
!253 = !DILocation(line: 313, column: 5, scope: !236)
!254 = !DILocation(line: 315, column: 5, scope: !236)
!255 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 260, type: !72, scopeLine: 261, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!256 = !DILocalVariable(name: "data", scope: !255, file: !71, line: 262, type: !76)
!257 = !DILocation(line: 262, column: 9, scope: !255)
!258 = !DILocation(line: 264, column: 10, scope: !255)
!259 = !DILocation(line: 265, column: 26, scope: !255)
!260 = !DILocation(line: 265, column: 12, scope: !255)
!261 = !DILocation(line: 265, column: 10, scope: !255)
!262 = !DILocalVariable(name: "i", scope: !263, file: !71, line: 267, type: !76)
!263 = distinct !DILexicalBlock(scope: !255, file: !71, line: 266, column: 5)
!264 = !DILocation(line: 267, column: 13, scope: !263)
!265 = !DILocalVariable(name: "buffer", scope: !263, file: !71, line: 268, type: !86)
!266 = !DILocation(line: 268, column: 13, scope: !263)
!267 = !DILocation(line: 270, column: 13, scope: !268)
!268 = distinct !DILexicalBlock(scope: !263, file: !71, line: 270, column: 13)
!269 = !DILocation(line: 270, column: 18, scope: !268)
!270 = !DILocation(line: 270, column: 23, scope: !268)
!271 = !DILocation(line: 270, column: 26, scope: !268)
!272 = !DILocation(line: 270, column: 31, scope: !268)
!273 = !DILocation(line: 270, column: 13, scope: !263)
!274 = !DILocation(line: 272, column: 20, scope: !275)
!275 = distinct !DILexicalBlock(scope: !268, file: !71, line: 271, column: 9)
!276 = !DILocation(line: 272, column: 13, scope: !275)
!277 = !DILocation(line: 272, column: 26, scope: !275)
!278 = !DILocation(line: 274, column: 19, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !71, line: 274, column: 13)
!280 = !DILocation(line: 274, column: 17, scope: !279)
!281 = !DILocation(line: 274, column: 24, scope: !282)
!282 = distinct !DILexicalBlock(scope: !279, file: !71, line: 274, column: 13)
!283 = !DILocation(line: 274, column: 26, scope: !282)
!284 = !DILocation(line: 274, column: 13, scope: !279)
!285 = !DILocation(line: 276, column: 37, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !71, line: 275, column: 13)
!287 = !DILocation(line: 276, column: 30, scope: !286)
!288 = !DILocation(line: 276, column: 17, scope: !286)
!289 = !DILocation(line: 277, column: 13, scope: !286)
!290 = !DILocation(line: 274, column: 33, scope: !282)
!291 = !DILocation(line: 274, column: 13, scope: !282)
!292 = distinct !{!292, !284, !293, !114}
!293 = !DILocation(line: 277, column: 13, scope: !279)
!294 = !DILocation(line: 278, column: 9, scope: !275)
!295 = !DILocation(line: 281, column: 13, scope: !296)
!296 = distinct !DILexicalBlock(scope: !268, file: !71, line: 280, column: 9)
!297 = !DILocation(line: 284, column: 1, scope: !255)
!298 = distinct !DISubprogram(name: "goodB2GSource", scope: !71, file: !71, line: 186, type: !120, scopeLine: 187, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!299 = !DILocalVariable(name: "data", arg: 1, scope: !298, file: !71, line: 186, type: !76)
!300 = !DILocation(line: 186, column: 30, scope: !298)
!301 = !DILocalVariable(name: "recvResult", scope: !302, file: !71, line: 193, type: !76)
!302 = distinct !DILexicalBlock(scope: !298, file: !71, line: 188, column: 5)
!303 = !DILocation(line: 193, column: 13, scope: !302)
!304 = !DILocalVariable(name: "service", scope: !302, file: !71, line: 194, type: !128)
!305 = !DILocation(line: 194, column: 28, scope: !302)
!306 = !DILocalVariable(name: "listenSocket", scope: !302, file: !71, line: 195, type: !76)
!307 = !DILocation(line: 195, column: 16, scope: !302)
!308 = !DILocalVariable(name: "acceptSocket", scope: !302, file: !71, line: 196, type: !76)
!309 = !DILocation(line: 196, column: 16, scope: !302)
!310 = !DILocalVariable(name: "inputBuffer", scope: !302, file: !71, line: 197, type: !60)
!311 = !DILocation(line: 197, column: 14, scope: !302)
!312 = !DILocation(line: 198, column: 9, scope: !302)
!313 = !DILocation(line: 208, column: 28, scope: !314)
!314 = distinct !DILexicalBlock(scope: !302, file: !71, line: 199, column: 9)
!315 = !DILocation(line: 208, column: 26, scope: !314)
!316 = !DILocation(line: 209, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !314, file: !71, line: 209, column: 17)
!318 = !DILocation(line: 209, column: 30, scope: !317)
!319 = !DILocation(line: 209, column: 17, scope: !314)
!320 = !DILocation(line: 211, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !71, line: 210, column: 13)
!322 = !DILocation(line: 213, column: 13, scope: !314)
!323 = !DILocation(line: 214, column: 21, scope: !314)
!324 = !DILocation(line: 214, column: 32, scope: !314)
!325 = !DILocation(line: 215, column: 21, scope: !314)
!326 = !DILocation(line: 215, column: 30, scope: !314)
!327 = !DILocation(line: 215, column: 37, scope: !314)
!328 = !DILocation(line: 216, column: 32, scope: !314)
!329 = !DILocation(line: 216, column: 21, scope: !314)
!330 = !DILocation(line: 216, column: 30, scope: !314)
!331 = !DILocation(line: 217, column: 22, scope: !332)
!332 = distinct !DILexicalBlock(scope: !314, file: !71, line: 217, column: 17)
!333 = !DILocation(line: 217, column: 36, scope: !332)
!334 = !DILocation(line: 217, column: 17, scope: !332)
!335 = !DILocation(line: 217, column: 81, scope: !332)
!336 = !DILocation(line: 217, column: 17, scope: !314)
!337 = !DILocation(line: 219, column: 17, scope: !338)
!338 = distinct !DILexicalBlock(scope: !332, file: !71, line: 218, column: 13)
!339 = !DILocation(line: 221, column: 24, scope: !340)
!340 = distinct !DILexicalBlock(scope: !314, file: !71, line: 221, column: 17)
!341 = !DILocation(line: 221, column: 17, scope: !340)
!342 = !DILocation(line: 221, column: 54, scope: !340)
!343 = !DILocation(line: 221, column: 17, scope: !314)
!344 = !DILocation(line: 223, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !340, file: !71, line: 222, column: 13)
!346 = !DILocation(line: 225, column: 35, scope: !314)
!347 = !DILocation(line: 225, column: 28, scope: !314)
!348 = !DILocation(line: 225, column: 26, scope: !314)
!349 = !DILocation(line: 226, column: 17, scope: !350)
!350 = distinct !DILexicalBlock(scope: !314, file: !71, line: 226, column: 17)
!351 = !DILocation(line: 226, column: 30, scope: !350)
!352 = !DILocation(line: 226, column: 17, scope: !314)
!353 = !DILocation(line: 228, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !71, line: 227, column: 13)
!355 = !DILocation(line: 231, column: 31, scope: !314)
!356 = !DILocation(line: 231, column: 45, scope: !314)
!357 = !DILocation(line: 231, column: 26, scope: !314)
!358 = !DILocation(line: 231, column: 24, scope: !314)
!359 = !DILocation(line: 232, column: 17, scope: !360)
!360 = distinct !DILexicalBlock(scope: !314, file: !71, line: 232, column: 17)
!361 = !DILocation(line: 232, column: 28, scope: !360)
!362 = !DILocation(line: 232, column: 44, scope: !360)
!363 = !DILocation(line: 232, column: 47, scope: !360)
!364 = !DILocation(line: 232, column: 58, scope: !360)
!365 = !DILocation(line: 232, column: 17, scope: !314)
!366 = !DILocation(line: 234, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !360, file: !71, line: 233, column: 13)
!368 = !DILocation(line: 237, column: 25, scope: !314)
!369 = !DILocation(line: 237, column: 13, scope: !314)
!370 = !DILocation(line: 237, column: 37, scope: !314)
!371 = !DILocation(line: 239, column: 25, scope: !314)
!372 = !DILocation(line: 239, column: 20, scope: !314)
!373 = !DILocation(line: 239, column: 18, scope: !314)
!374 = !DILocation(line: 240, column: 9, scope: !314)
!375 = !DILocation(line: 242, column: 13, scope: !376)
!376 = distinct !DILexicalBlock(scope: !302, file: !71, line: 242, column: 13)
!377 = !DILocation(line: 242, column: 26, scope: !376)
!378 = !DILocation(line: 242, column: 13, scope: !302)
!379 = !DILocation(line: 244, column: 26, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !71, line: 243, column: 9)
!381 = !DILocation(line: 244, column: 13, scope: !380)
!382 = !DILocation(line: 245, column: 9, scope: !380)
!383 = !DILocation(line: 246, column: 13, scope: !384)
!384 = distinct !DILexicalBlock(scope: !302, file: !71, line: 246, column: 13)
!385 = !DILocation(line: 246, column: 26, scope: !384)
!386 = !DILocation(line: 246, column: 13, scope: !302)
!387 = !DILocation(line: 248, column: 26, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !71, line: 247, column: 9)
!389 = !DILocation(line: 248, column: 13, scope: !388)
!390 = !DILocation(line: 249, column: 9, scope: !388)
!391 = !DILocation(line: 257, column: 12, scope: !298)
!392 = !DILocation(line: 257, column: 5, scope: !298)
!393 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 158, type: !72, scopeLine: 159, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!394 = !DILocalVariable(name: "data", scope: !393, file: !71, line: 160, type: !76)
!395 = !DILocation(line: 160, column: 9, scope: !393)
!396 = !DILocation(line: 162, column: 10, scope: !393)
!397 = !DILocation(line: 163, column: 26, scope: !393)
!398 = !DILocation(line: 163, column: 12, scope: !393)
!399 = !DILocation(line: 163, column: 10, scope: !393)
!400 = !DILocalVariable(name: "i", scope: !401, file: !71, line: 165, type: !76)
!401 = distinct !DILexicalBlock(scope: !393, file: !71, line: 164, column: 5)
!402 = !DILocation(line: 165, column: 13, scope: !401)
!403 = !DILocalVariable(name: "buffer", scope: !401, file: !71, line: 166, type: !86)
!404 = !DILocation(line: 166, column: 13, scope: !401)
!405 = !DILocation(line: 169, column: 13, scope: !406)
!406 = distinct !DILexicalBlock(scope: !401, file: !71, line: 169, column: 13)
!407 = !DILocation(line: 169, column: 18, scope: !406)
!408 = !DILocation(line: 169, column: 13, scope: !401)
!409 = !DILocation(line: 171, column: 20, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !71, line: 170, column: 9)
!411 = !DILocation(line: 171, column: 13, scope: !410)
!412 = !DILocation(line: 171, column: 26, scope: !410)
!413 = !DILocation(line: 173, column: 19, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !71, line: 173, column: 13)
!415 = !DILocation(line: 173, column: 17, scope: !414)
!416 = !DILocation(line: 173, column: 24, scope: !417)
!417 = distinct !DILexicalBlock(scope: !414, file: !71, line: 173, column: 13)
!418 = !DILocation(line: 173, column: 26, scope: !417)
!419 = !DILocation(line: 173, column: 13, scope: !414)
!420 = !DILocation(line: 175, column: 37, scope: !421)
!421 = distinct !DILexicalBlock(scope: !417, file: !71, line: 174, column: 13)
!422 = !DILocation(line: 175, column: 30, scope: !421)
!423 = !DILocation(line: 175, column: 17, scope: !421)
!424 = !DILocation(line: 176, column: 13, scope: !421)
!425 = !DILocation(line: 173, column: 33, scope: !417)
!426 = !DILocation(line: 173, column: 13, scope: !417)
!427 = distinct !{!427, !419, !428, !114}
!428 = !DILocation(line: 176, column: 13, scope: !414)
!429 = !DILocation(line: 177, column: 9, scope: !410)
!430 = !DILocation(line: 180, column: 13, scope: !431)
!431 = distinct !DILexicalBlock(scope: !406, file: !71, line: 179, column: 9)
!432 = !DILocation(line: 183, column: 1, scope: !393)
!433 = distinct !DISubprogram(name: "goodG2BSource", scope: !71, file: !71, line: 150, type: !120, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!434 = !DILocalVariable(name: "data", arg: 1, scope: !433, file: !71, line: 150, type: !76)
!435 = !DILocation(line: 150, column: 30, scope: !433)
!436 = !DILocation(line: 154, column: 10, scope: !433)
!437 = !DILocation(line: 155, column: 12, scope: !433)
!438 = !DILocation(line: 155, column: 5, scope: !433)
