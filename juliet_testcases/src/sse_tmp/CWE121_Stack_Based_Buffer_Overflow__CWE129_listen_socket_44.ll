; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_44_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !78, metadata !DIExpression()), !dbg !82
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !82
  store i32 -1, i32* %data, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !84, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !87, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %listenSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %acceptSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  br label %do.body, !dbg !111

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !112
  store i32 %call, i32* %listenSocket, align 4, !dbg !114
  %0 = load i32, i32* %listenSocket, align 4, !dbg !115
  %cmp = icmp eq i32 %0, -1, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !119

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !121
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !122
  store i16 2, i16* %sin_family, align 4, !dbg !123
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !124
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !125
  store i32 0, i32* %s_addr, align 4, !dbg !126
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !127
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !128
  store i16 %call1, i16* %sin_port, align 2, !dbg !129
  %2 = load i32, i32* %listenSocket, align 4, !dbg !130
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !132
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !133
  %cmp3 = icmp eq i32 %call2, -1, !dbg !134
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !135

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !136

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !138
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !140
  %cmp7 = icmp eq i32 %call6, -1, !dbg !141
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !142

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !143

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !145
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !146
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !147
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !148
  %cmp11 = icmp eq i32 %6, -1, !dbg !150
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !151

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !152

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !154
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !156
  %conv = trunc i64 %call14 to i32, !dbg !156
  store i32 %conv, i32* %recvResult, align 4, !dbg !157
  %8 = load i32, i32* %recvResult, align 4, !dbg !158
  %cmp15 = icmp eq i32 %8, -1, !dbg !160
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !161

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !162
  %cmp17 = icmp eq i32 %9, 0, !dbg !163
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !164

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !165

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !167
  %idxprom = sext i32 %10 to i64, !dbg !168
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !170
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !171
  store i32 %call22, i32* %data, align 4, !dbg !172
  br label %do.end, !dbg !173

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !174
  %cmp23 = icmp ne i32 %11, -1, !dbg !176
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !177

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !178
  %call26 = call i32 @close(i32 %12), !dbg !180
  br label %if.end27, !dbg !181

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !182
  %cmp28 = icmp ne i32 %13, -1, !dbg !184
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !185

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !186
  %call31 = call i32 @close(i32 %14), !dbg !188
  br label %if.end32, !dbg !189

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !190
  %16 = load i32, i32* %data, align 4, !dbg !191
  call void %15(i32 %16), !dbg !190
  ret void, !dbg !192
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !193 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata i32* %i, metadata !196, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !199, metadata !DIExpression()), !dbg !203
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !203
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !203
  %1 = load i32, i32* %data.addr, align 4, !dbg !204
  %cmp = icmp sge i32 %1, 0, !dbg !206
  br i1 %cmp, label %if.then, label %if.else, !dbg !207

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !208
  %idxprom = sext i32 %2 to i64, !dbg !210
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !210
  store i32 1, i32* %arrayidx, align 4, !dbg !211
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !215
  %cmp1 = icmp slt i32 %3, 10, !dbg !217
  br i1 %cmp1, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !219
  %idxprom2 = sext i32 %4 to i64, !dbg !221
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !221
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !221
  call void @printIntLine(i32 %5), !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !224
  %inc = add nsw i32 %6, 1, !dbg !224
  store i32 %inc, i32* %i, align 4, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !229

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !230
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !232
}

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #2

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #2

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_44_good() #0 !dbg !233 {
entry:
  call void @goodG2B(), !dbg !234
  call void @goodB2G(), !dbg !235
  ret void, !dbg !236
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !237 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !242, metadata !DIExpression()), !dbg !243
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !244, metadata !DIExpression()), !dbg !245
  %call = call i64 @time(i64* null) #7, !dbg !246
  %conv = trunc i64 %call to i32, !dbg !247
  call void @srand(i32 %conv) #7, !dbg !248
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !249
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_44_good(), !dbg !250
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !251
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !252
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_44_bad(), !dbg !253
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !254
  ret i32 0, !dbg !255
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !256 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !257, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !259, metadata !DIExpression()), !dbg !260
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !260
  store i32 -1, i32* %data, align 4, !dbg !261
  store i32 7, i32* %data, align 4, !dbg !262
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !263
  %1 = load i32, i32* %data, align 4, !dbg !264
  call void %0(i32 %1), !dbg !263
  ret void, !dbg !265
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !266 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !267, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata i32* %i, metadata !269, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !272, metadata !DIExpression()), !dbg !273
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !273
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !273
  %1 = load i32, i32* %data.addr, align 4, !dbg !274
  %cmp = icmp sge i32 %1, 0, !dbg !276
  br i1 %cmp, label %if.then, label %if.else, !dbg !277

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !278
  %idxprom = sext i32 %2 to i64, !dbg !280
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !280
  store i32 1, i32* %arrayidx, align 4, !dbg !281
  store i32 0, i32* %i, align 4, !dbg !282
  br label %for.cond, !dbg !284

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !285
  %cmp1 = icmp slt i32 %3, 10, !dbg !287
  br i1 %cmp1, label %for.body, label %for.end, !dbg !288

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !289
  %idxprom2 = sext i32 %4 to i64, !dbg !291
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !291
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !291
  call void @printIntLine(i32 %5), !dbg !292
  br label %for.inc, !dbg !293

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !294
  %inc = add nsw i32 %6, 1, !dbg !294
  store i32 %inc, i32* %i, align 4, !dbg !294
  br label %for.cond, !dbg !295, !llvm.loop !296

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !298

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !299
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !301
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !302 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !303, metadata !DIExpression()), !dbg !304
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !305, metadata !DIExpression()), !dbg !306
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !306
  store i32 -1, i32* %data, align 4, !dbg !307
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !308, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !311, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !313, metadata !DIExpression()), !dbg !314
  store i32 -1, i32* %listenSocket, align 4, !dbg !314
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !315, metadata !DIExpression()), !dbg !316
  store i32 -1, i32* %acceptSocket, align 4, !dbg !316
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !317, metadata !DIExpression()), !dbg !318
  br label %do.body, !dbg !319

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !320
  store i32 %call, i32* %listenSocket, align 4, !dbg !322
  %0 = load i32, i32* %listenSocket, align 4, !dbg !323
  %cmp = icmp eq i32 %0, -1, !dbg !325
  br i1 %cmp, label %if.then, label %if.end, !dbg !326

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !327

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !329
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !329
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !330
  store i16 2, i16* %sin_family, align 4, !dbg !331
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !332
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !333
  store i32 0, i32* %s_addr, align 4, !dbg !334
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !335
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !336
  store i16 %call1, i16* %sin_port, align 2, !dbg !337
  %2 = load i32, i32* %listenSocket, align 4, !dbg !338
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !340
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !341
  %cmp3 = icmp eq i32 %call2, -1, !dbg !342
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !343

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !344

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !346
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !348
  %cmp7 = icmp eq i32 %call6, -1, !dbg !349
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !350

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !351

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !353
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !354
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !355
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !356
  %cmp11 = icmp eq i32 %6, -1, !dbg !358
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !359

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !360

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !362
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !363
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !364
  %conv = trunc i64 %call14 to i32, !dbg !364
  store i32 %conv, i32* %recvResult, align 4, !dbg !365
  %8 = load i32, i32* %recvResult, align 4, !dbg !366
  %cmp15 = icmp eq i32 %8, -1, !dbg !368
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !369

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !370
  %cmp17 = icmp eq i32 %9, 0, !dbg !371
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !372

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !373

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !375
  %idxprom = sext i32 %10 to i64, !dbg !376
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !376
  store i8 0, i8* %arrayidx, align 1, !dbg !377
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !378
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !379
  store i32 %call22, i32* %data, align 4, !dbg !380
  br label %do.end, !dbg !381

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !382
  %cmp23 = icmp ne i32 %11, -1, !dbg !384
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !385

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !386
  %call26 = call i32 @close(i32 %12), !dbg !388
  br label %if.end27, !dbg !389

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !390
  %cmp28 = icmp ne i32 %13, -1, !dbg !392
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !393

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !394
  %call31 = call i32 @close(i32 %14), !dbg !396
  br label %if.end32, !dbg !397

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !398
  %16 = load i32, i32* %data, align 4, !dbg !399
  call void %15(i32 %16), !dbg !398
  ret void, !dbg !400
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !401 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !402, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.declare(metadata i32* %i, metadata !404, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !407, metadata !DIExpression()), !dbg !408
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !408
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !408
  %1 = load i32, i32* %data.addr, align 4, !dbg !409
  %cmp = icmp sge i32 %1, 0, !dbg !411
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !412

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !413
  %cmp1 = icmp slt i32 %2, 10, !dbg !414
  br i1 %cmp1, label %if.then, label %if.else, !dbg !415

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !416
  %idxprom = sext i32 %3 to i64, !dbg !418
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !418
  store i32 1, i32* %arrayidx, align 4, !dbg !419
  store i32 0, i32* %i, align 4, !dbg !420
  br label %for.cond, !dbg !422

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !423
  %cmp2 = icmp slt i32 %4, 10, !dbg !425
  br i1 %cmp2, label %for.body, label %for.end, !dbg !426

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !427
  %idxprom3 = sext i32 %5 to i64, !dbg !429
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !429
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !429
  call void @printIntLine(i32 %6), !dbg !430
  br label %for.inc, !dbg !431

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !432
  %inc = add nsw i32 %7, 1, !dbg !432
  store i32 %inc, i32* %i, align 4, !dbg !432
  br label %for.cond, !dbg !433, !llvm.loop !434

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !436

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !437
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !439
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_44.c", directory: "/root/SSE-Assessment")
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
!45 = !{!46, !51, !5}
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
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_44_bad", scope: !71, file: !71, line: 67, type: !72, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_44.c", directory: "/root/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 69, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 69, column: 9, scope: !70)
!78 = !DILocalVariable(name: "funcPtr", scope: !70, file: !71, line: 71, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DISubroutineType(types: !81)
!81 = !{null, !76}
!82 = !DILocation(line: 71, column: 12, scope: !70)
!83 = !DILocation(line: 73, column: 10, scope: !70)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !71, line: 79, type: !76)
!85 = distinct !DILexicalBlock(scope: !70, file: !71, line: 74, column: 5)
!86 = !DILocation(line: 79, column: 13, scope: !85)
!87 = !DILocalVariable(name: "service", scope: !85, file: !71, line: 80, type: !88)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !89)
!89 = !{!90, !91, !95, !99}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !88, file: !17, line: 239, baseType: !56, size: 16)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !88, file: !17, line: 240, baseType: !92, size: 16, offset: 16)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !88, file: !17, line: 241, baseType: !96, size: 32, offset: 32)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !97)
!97 = !{!98}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !96, file: !17, line: 33, baseType: !46, size: 32)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !88, file: !17, line: 244, baseType: !100, size: 64, offset: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 64, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 8)
!104 = !DILocation(line: 80, column: 28, scope: !85)
!105 = !DILocalVariable(name: "listenSocket", scope: !85, file: !71, line: 81, type: !76)
!106 = !DILocation(line: 81, column: 16, scope: !85)
!107 = !DILocalVariable(name: "acceptSocket", scope: !85, file: !71, line: 82, type: !76)
!108 = !DILocation(line: 82, column: 16, scope: !85)
!109 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !71, line: 83, type: !60)
!110 = !DILocation(line: 83, column: 14, scope: !85)
!111 = !DILocation(line: 84, column: 9, scope: !85)
!112 = !DILocation(line: 94, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !85, file: !71, line: 85, column: 9)
!114 = !DILocation(line: 94, column: 26, scope: !113)
!115 = !DILocation(line: 95, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !71, line: 95, column: 17)
!117 = !DILocation(line: 95, column: 30, scope: !116)
!118 = !DILocation(line: 95, column: 17, scope: !113)
!119 = !DILocation(line: 97, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !71, line: 96, column: 13)
!121 = !DILocation(line: 99, column: 13, scope: !113)
!122 = !DILocation(line: 100, column: 21, scope: !113)
!123 = !DILocation(line: 100, column: 32, scope: !113)
!124 = !DILocation(line: 101, column: 21, scope: !113)
!125 = !DILocation(line: 101, column: 30, scope: !113)
!126 = !DILocation(line: 101, column: 37, scope: !113)
!127 = !DILocation(line: 102, column: 32, scope: !113)
!128 = !DILocation(line: 102, column: 21, scope: !113)
!129 = !DILocation(line: 102, column: 30, scope: !113)
!130 = !DILocation(line: 103, column: 22, scope: !131)
!131 = distinct !DILexicalBlock(scope: !113, file: !71, line: 103, column: 17)
!132 = !DILocation(line: 103, column: 36, scope: !131)
!133 = !DILocation(line: 103, column: 17, scope: !131)
!134 = !DILocation(line: 103, column: 81, scope: !131)
!135 = !DILocation(line: 103, column: 17, scope: !113)
!136 = !DILocation(line: 105, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !71, line: 104, column: 13)
!138 = !DILocation(line: 107, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !113, file: !71, line: 107, column: 17)
!140 = !DILocation(line: 107, column: 17, scope: !139)
!141 = !DILocation(line: 107, column: 54, scope: !139)
!142 = !DILocation(line: 107, column: 17, scope: !113)
!143 = !DILocation(line: 109, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !71, line: 108, column: 13)
!145 = !DILocation(line: 111, column: 35, scope: !113)
!146 = !DILocation(line: 111, column: 28, scope: !113)
!147 = !DILocation(line: 111, column: 26, scope: !113)
!148 = !DILocation(line: 112, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !113, file: !71, line: 112, column: 17)
!150 = !DILocation(line: 112, column: 30, scope: !149)
!151 = !DILocation(line: 112, column: 17, scope: !113)
!152 = !DILocation(line: 114, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !71, line: 113, column: 13)
!154 = !DILocation(line: 117, column: 31, scope: !113)
!155 = !DILocation(line: 117, column: 45, scope: !113)
!156 = !DILocation(line: 117, column: 26, scope: !113)
!157 = !DILocation(line: 117, column: 24, scope: !113)
!158 = !DILocation(line: 118, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !113, file: !71, line: 118, column: 17)
!160 = !DILocation(line: 118, column: 28, scope: !159)
!161 = !DILocation(line: 118, column: 44, scope: !159)
!162 = !DILocation(line: 118, column: 47, scope: !159)
!163 = !DILocation(line: 118, column: 58, scope: !159)
!164 = !DILocation(line: 118, column: 17, scope: !113)
!165 = !DILocation(line: 120, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !71, line: 119, column: 13)
!167 = !DILocation(line: 123, column: 25, scope: !113)
!168 = !DILocation(line: 123, column: 13, scope: !113)
!169 = !DILocation(line: 123, column: 37, scope: !113)
!170 = !DILocation(line: 125, column: 25, scope: !113)
!171 = !DILocation(line: 125, column: 20, scope: !113)
!172 = !DILocation(line: 125, column: 18, scope: !113)
!173 = !DILocation(line: 126, column: 9, scope: !113)
!174 = !DILocation(line: 128, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !85, file: !71, line: 128, column: 13)
!176 = !DILocation(line: 128, column: 26, scope: !175)
!177 = !DILocation(line: 128, column: 13, scope: !85)
!178 = !DILocation(line: 130, column: 26, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !71, line: 129, column: 9)
!180 = !DILocation(line: 130, column: 13, scope: !179)
!181 = !DILocation(line: 131, column: 9, scope: !179)
!182 = !DILocation(line: 132, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !85, file: !71, line: 132, column: 13)
!184 = !DILocation(line: 132, column: 26, scope: !183)
!185 = !DILocation(line: 132, column: 13, scope: !85)
!186 = !DILocation(line: 134, column: 26, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !71, line: 133, column: 9)
!188 = !DILocation(line: 134, column: 13, scope: !187)
!189 = !DILocation(line: 135, column: 9, scope: !187)
!190 = !DILocation(line: 144, column: 5, scope: !70)
!191 = !DILocation(line: 144, column: 13, scope: !70)
!192 = !DILocation(line: 145, column: 1, scope: !70)
!193 = distinct !DISubprogram(name: "badSink", scope: !71, file: !71, line: 44, type: !80, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!194 = !DILocalVariable(name: "data", arg: 1, scope: !193, file: !71, line: 44, type: !76)
!195 = !DILocation(line: 44, column: 25, scope: !193)
!196 = !DILocalVariable(name: "i", scope: !197, file: !71, line: 47, type: !76)
!197 = distinct !DILexicalBlock(scope: !193, file: !71, line: 46, column: 5)
!198 = !DILocation(line: 47, column: 13, scope: !197)
!199 = !DILocalVariable(name: "buffer", scope: !197, file: !71, line: 48, type: !200)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !201)
!201 = !{!202}
!202 = !DISubrange(count: 10)
!203 = !DILocation(line: 48, column: 13, scope: !197)
!204 = !DILocation(line: 51, column: 13, scope: !205)
!205 = distinct !DILexicalBlock(scope: !197, file: !71, line: 51, column: 13)
!206 = !DILocation(line: 51, column: 18, scope: !205)
!207 = !DILocation(line: 51, column: 13, scope: !197)
!208 = !DILocation(line: 53, column: 20, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !71, line: 52, column: 9)
!210 = !DILocation(line: 53, column: 13, scope: !209)
!211 = !DILocation(line: 53, column: 26, scope: !209)
!212 = !DILocation(line: 55, column: 19, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !71, line: 55, column: 13)
!214 = !DILocation(line: 55, column: 17, scope: !213)
!215 = !DILocation(line: 55, column: 24, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !71, line: 55, column: 13)
!217 = !DILocation(line: 55, column: 26, scope: !216)
!218 = !DILocation(line: 55, column: 13, scope: !213)
!219 = !DILocation(line: 57, column: 37, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !71, line: 56, column: 13)
!221 = !DILocation(line: 57, column: 30, scope: !220)
!222 = !DILocation(line: 57, column: 17, scope: !220)
!223 = !DILocation(line: 58, column: 13, scope: !220)
!224 = !DILocation(line: 55, column: 33, scope: !216)
!225 = !DILocation(line: 55, column: 13, scope: !216)
!226 = distinct !{!226, !218, !227, !228}
!227 = !DILocation(line: 58, column: 13, scope: !213)
!228 = !{!"llvm.loop.mustprogress"}
!229 = !DILocation(line: 59, column: 9, scope: !209)
!230 = !DILocation(line: 62, column: 13, scope: !231)
!231 = distinct !DILexicalBlock(scope: !205, file: !71, line: 61, column: 9)
!232 = !DILocation(line: 65, column: 1, scope: !193)
!233 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_44_good", scope: !71, file: !71, line: 288, type: !72, scopeLine: 289, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!234 = !DILocation(line: 290, column: 5, scope: !233)
!235 = !DILocation(line: 291, column: 5, scope: !233)
!236 = !DILocation(line: 292, column: 1, scope: !233)
!237 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 302, type: !238, scopeLine: 303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!238 = !DISubroutineType(types: !239)
!239 = !{!76, !76, !240}
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !241, size: 64)
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!242 = !DILocalVariable(name: "argc", arg: 1, scope: !237, file: !71, line: 302, type: !76)
!243 = !DILocation(line: 302, column: 14, scope: !237)
!244 = !DILocalVariable(name: "argv", arg: 2, scope: !237, file: !71, line: 302, type: !240)
!245 = !DILocation(line: 302, column: 27, scope: !237)
!246 = !DILocation(line: 305, column: 22, scope: !237)
!247 = !DILocation(line: 305, column: 12, scope: !237)
!248 = !DILocation(line: 305, column: 5, scope: !237)
!249 = !DILocation(line: 307, column: 5, scope: !237)
!250 = !DILocation(line: 308, column: 5, scope: !237)
!251 = !DILocation(line: 309, column: 5, scope: !237)
!252 = !DILocation(line: 312, column: 5, scope: !237)
!253 = !DILocation(line: 313, column: 5, scope: !237)
!254 = !DILocation(line: 314, column: 5, scope: !237)
!255 = !DILocation(line: 316, column: 5, scope: !237)
!256 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 175, type: !72, scopeLine: 176, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!257 = !DILocalVariable(name: "data", scope: !256, file: !71, line: 177, type: !76)
!258 = !DILocation(line: 177, column: 9, scope: !256)
!259 = !DILocalVariable(name: "funcPtr", scope: !256, file: !71, line: 178, type: !79)
!260 = !DILocation(line: 178, column: 12, scope: !256)
!261 = !DILocation(line: 180, column: 10, scope: !256)
!262 = !DILocation(line: 183, column: 10, scope: !256)
!263 = !DILocation(line: 184, column: 5, scope: !256)
!264 = !DILocation(line: 184, column: 13, scope: !256)
!265 = !DILocation(line: 185, column: 1, scope: !256)
!266 = distinct !DISubprogram(name: "goodG2BSink", scope: !71, file: !71, line: 152, type: !80, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!267 = !DILocalVariable(name: "data", arg: 1, scope: !266, file: !71, line: 152, type: !76)
!268 = !DILocation(line: 152, column: 29, scope: !266)
!269 = !DILocalVariable(name: "i", scope: !270, file: !71, line: 155, type: !76)
!270 = distinct !DILexicalBlock(scope: !266, file: !71, line: 154, column: 5)
!271 = !DILocation(line: 155, column: 13, scope: !270)
!272 = !DILocalVariable(name: "buffer", scope: !270, file: !71, line: 156, type: !200)
!273 = !DILocation(line: 156, column: 13, scope: !270)
!274 = !DILocation(line: 159, column: 13, scope: !275)
!275 = distinct !DILexicalBlock(scope: !270, file: !71, line: 159, column: 13)
!276 = !DILocation(line: 159, column: 18, scope: !275)
!277 = !DILocation(line: 159, column: 13, scope: !270)
!278 = !DILocation(line: 161, column: 20, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !71, line: 160, column: 9)
!280 = !DILocation(line: 161, column: 13, scope: !279)
!281 = !DILocation(line: 161, column: 26, scope: !279)
!282 = !DILocation(line: 163, column: 19, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !71, line: 163, column: 13)
!284 = !DILocation(line: 163, column: 17, scope: !283)
!285 = !DILocation(line: 163, column: 24, scope: !286)
!286 = distinct !DILexicalBlock(scope: !283, file: !71, line: 163, column: 13)
!287 = !DILocation(line: 163, column: 26, scope: !286)
!288 = !DILocation(line: 163, column: 13, scope: !283)
!289 = !DILocation(line: 165, column: 37, scope: !290)
!290 = distinct !DILexicalBlock(scope: !286, file: !71, line: 164, column: 13)
!291 = !DILocation(line: 165, column: 30, scope: !290)
!292 = !DILocation(line: 165, column: 17, scope: !290)
!293 = !DILocation(line: 166, column: 13, scope: !290)
!294 = !DILocation(line: 163, column: 33, scope: !286)
!295 = !DILocation(line: 163, column: 13, scope: !286)
!296 = distinct !{!296, !288, !297, !228}
!297 = !DILocation(line: 166, column: 13, scope: !283)
!298 = !DILocation(line: 167, column: 9, scope: !279)
!299 = !DILocation(line: 170, column: 13, scope: !300)
!300 = distinct !DILexicalBlock(scope: !275, file: !71, line: 169, column: 9)
!301 = !DILocation(line: 173, column: 1, scope: !266)
!302 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 210, type: !72, scopeLine: 211, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!303 = !DILocalVariable(name: "data", scope: !302, file: !71, line: 212, type: !76)
!304 = !DILocation(line: 212, column: 9, scope: !302)
!305 = !DILocalVariable(name: "funcPtr", scope: !302, file: !71, line: 213, type: !79)
!306 = !DILocation(line: 213, column: 12, scope: !302)
!307 = !DILocation(line: 215, column: 10, scope: !302)
!308 = !DILocalVariable(name: "recvResult", scope: !309, file: !71, line: 221, type: !76)
!309 = distinct !DILexicalBlock(scope: !302, file: !71, line: 216, column: 5)
!310 = !DILocation(line: 221, column: 13, scope: !309)
!311 = !DILocalVariable(name: "service", scope: !309, file: !71, line: 222, type: !88)
!312 = !DILocation(line: 222, column: 28, scope: !309)
!313 = !DILocalVariable(name: "listenSocket", scope: !309, file: !71, line: 223, type: !76)
!314 = !DILocation(line: 223, column: 16, scope: !309)
!315 = !DILocalVariable(name: "acceptSocket", scope: !309, file: !71, line: 224, type: !76)
!316 = !DILocation(line: 224, column: 16, scope: !309)
!317 = !DILocalVariable(name: "inputBuffer", scope: !309, file: !71, line: 225, type: !60)
!318 = !DILocation(line: 225, column: 14, scope: !309)
!319 = !DILocation(line: 226, column: 9, scope: !309)
!320 = !DILocation(line: 236, column: 28, scope: !321)
!321 = distinct !DILexicalBlock(scope: !309, file: !71, line: 227, column: 9)
!322 = !DILocation(line: 236, column: 26, scope: !321)
!323 = !DILocation(line: 237, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !321, file: !71, line: 237, column: 17)
!325 = !DILocation(line: 237, column: 30, scope: !324)
!326 = !DILocation(line: 237, column: 17, scope: !321)
!327 = !DILocation(line: 239, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !71, line: 238, column: 13)
!329 = !DILocation(line: 241, column: 13, scope: !321)
!330 = !DILocation(line: 242, column: 21, scope: !321)
!331 = !DILocation(line: 242, column: 32, scope: !321)
!332 = !DILocation(line: 243, column: 21, scope: !321)
!333 = !DILocation(line: 243, column: 30, scope: !321)
!334 = !DILocation(line: 243, column: 37, scope: !321)
!335 = !DILocation(line: 244, column: 32, scope: !321)
!336 = !DILocation(line: 244, column: 21, scope: !321)
!337 = !DILocation(line: 244, column: 30, scope: !321)
!338 = !DILocation(line: 245, column: 22, scope: !339)
!339 = distinct !DILexicalBlock(scope: !321, file: !71, line: 245, column: 17)
!340 = !DILocation(line: 245, column: 36, scope: !339)
!341 = !DILocation(line: 245, column: 17, scope: !339)
!342 = !DILocation(line: 245, column: 81, scope: !339)
!343 = !DILocation(line: 245, column: 17, scope: !321)
!344 = !DILocation(line: 247, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !339, file: !71, line: 246, column: 13)
!346 = !DILocation(line: 249, column: 24, scope: !347)
!347 = distinct !DILexicalBlock(scope: !321, file: !71, line: 249, column: 17)
!348 = !DILocation(line: 249, column: 17, scope: !347)
!349 = !DILocation(line: 249, column: 54, scope: !347)
!350 = !DILocation(line: 249, column: 17, scope: !321)
!351 = !DILocation(line: 251, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !347, file: !71, line: 250, column: 13)
!353 = !DILocation(line: 253, column: 35, scope: !321)
!354 = !DILocation(line: 253, column: 28, scope: !321)
!355 = !DILocation(line: 253, column: 26, scope: !321)
!356 = !DILocation(line: 254, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !321, file: !71, line: 254, column: 17)
!358 = !DILocation(line: 254, column: 30, scope: !357)
!359 = !DILocation(line: 254, column: 17, scope: !321)
!360 = !DILocation(line: 256, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !71, line: 255, column: 13)
!362 = !DILocation(line: 259, column: 31, scope: !321)
!363 = !DILocation(line: 259, column: 45, scope: !321)
!364 = !DILocation(line: 259, column: 26, scope: !321)
!365 = !DILocation(line: 259, column: 24, scope: !321)
!366 = !DILocation(line: 260, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !321, file: !71, line: 260, column: 17)
!368 = !DILocation(line: 260, column: 28, scope: !367)
!369 = !DILocation(line: 260, column: 44, scope: !367)
!370 = !DILocation(line: 260, column: 47, scope: !367)
!371 = !DILocation(line: 260, column: 58, scope: !367)
!372 = !DILocation(line: 260, column: 17, scope: !321)
!373 = !DILocation(line: 262, column: 17, scope: !374)
!374 = distinct !DILexicalBlock(scope: !367, file: !71, line: 261, column: 13)
!375 = !DILocation(line: 265, column: 25, scope: !321)
!376 = !DILocation(line: 265, column: 13, scope: !321)
!377 = !DILocation(line: 265, column: 37, scope: !321)
!378 = !DILocation(line: 267, column: 25, scope: !321)
!379 = !DILocation(line: 267, column: 20, scope: !321)
!380 = !DILocation(line: 267, column: 18, scope: !321)
!381 = !DILocation(line: 268, column: 9, scope: !321)
!382 = !DILocation(line: 270, column: 13, scope: !383)
!383 = distinct !DILexicalBlock(scope: !309, file: !71, line: 270, column: 13)
!384 = !DILocation(line: 270, column: 26, scope: !383)
!385 = !DILocation(line: 270, column: 13, scope: !309)
!386 = !DILocation(line: 272, column: 26, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !71, line: 271, column: 9)
!388 = !DILocation(line: 272, column: 13, scope: !387)
!389 = !DILocation(line: 273, column: 9, scope: !387)
!390 = !DILocation(line: 274, column: 13, scope: !391)
!391 = distinct !DILexicalBlock(scope: !309, file: !71, line: 274, column: 13)
!392 = !DILocation(line: 274, column: 26, scope: !391)
!393 = !DILocation(line: 274, column: 13, scope: !309)
!394 = !DILocation(line: 276, column: 26, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !71, line: 275, column: 9)
!396 = !DILocation(line: 276, column: 13, scope: !395)
!397 = !DILocation(line: 277, column: 9, scope: !395)
!398 = !DILocation(line: 285, column: 5, scope: !302)
!399 = !DILocation(line: 285, column: 13, scope: !302)
!400 = !DILocation(line: 286, column: 1, scope: !302)
!401 = distinct !DISubprogram(name: "goodB2GSink", scope: !71, file: !71, line: 188, type: !80, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!402 = !DILocalVariable(name: "data", arg: 1, scope: !401, file: !71, line: 188, type: !76)
!403 = !DILocation(line: 188, column: 29, scope: !401)
!404 = !DILocalVariable(name: "i", scope: !405, file: !71, line: 191, type: !76)
!405 = distinct !DILexicalBlock(scope: !401, file: !71, line: 190, column: 5)
!406 = !DILocation(line: 191, column: 13, scope: !405)
!407 = !DILocalVariable(name: "buffer", scope: !405, file: !71, line: 192, type: !200)
!408 = !DILocation(line: 192, column: 13, scope: !405)
!409 = !DILocation(line: 194, column: 13, scope: !410)
!410 = distinct !DILexicalBlock(scope: !405, file: !71, line: 194, column: 13)
!411 = !DILocation(line: 194, column: 18, scope: !410)
!412 = !DILocation(line: 194, column: 23, scope: !410)
!413 = !DILocation(line: 194, column: 26, scope: !410)
!414 = !DILocation(line: 194, column: 31, scope: !410)
!415 = !DILocation(line: 194, column: 13, scope: !405)
!416 = !DILocation(line: 196, column: 20, scope: !417)
!417 = distinct !DILexicalBlock(scope: !410, file: !71, line: 195, column: 9)
!418 = !DILocation(line: 196, column: 13, scope: !417)
!419 = !DILocation(line: 196, column: 26, scope: !417)
!420 = !DILocation(line: 198, column: 19, scope: !421)
!421 = distinct !DILexicalBlock(scope: !417, file: !71, line: 198, column: 13)
!422 = !DILocation(line: 198, column: 17, scope: !421)
!423 = !DILocation(line: 198, column: 24, scope: !424)
!424 = distinct !DILexicalBlock(scope: !421, file: !71, line: 198, column: 13)
!425 = !DILocation(line: 198, column: 26, scope: !424)
!426 = !DILocation(line: 198, column: 13, scope: !421)
!427 = !DILocation(line: 200, column: 37, scope: !428)
!428 = distinct !DILexicalBlock(scope: !424, file: !71, line: 199, column: 13)
!429 = !DILocation(line: 200, column: 30, scope: !428)
!430 = !DILocation(line: 200, column: 17, scope: !428)
!431 = !DILocation(line: 201, column: 13, scope: !428)
!432 = !DILocation(line: 198, column: 33, scope: !424)
!433 = !DILocation(line: 198, column: 13, scope: !424)
!434 = distinct !{!434, !426, !435, !228}
!435 = !DILocation(line: 201, column: 13, scope: !421)
!436 = !DILocation(line: 202, column: 9, scope: !417)
!437 = !DILocation(line: 205, column: 13, scope: !438)
!438 = distinct !DILexicalBlock(scope: !410, file: !71, line: 204, column: 9)
!439 = !DILocation(line: 208, column: 1, scope: !401)
