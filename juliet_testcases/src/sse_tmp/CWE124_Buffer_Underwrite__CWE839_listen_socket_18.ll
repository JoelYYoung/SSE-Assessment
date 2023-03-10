; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_18.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_18.c"
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_18_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  br label %source, !dbg !79

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !80), !dbg !81
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !82, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !85, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 -1, i32* %listenSocket, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %acceptSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  br label %do.body, !dbg !109

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !110
  store i32 %call, i32* %listenSocket, align 4, !dbg !112
  %0 = load i32, i32* %listenSocket, align 4, !dbg !113
  %cmp = icmp eq i32 %0, -1, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !117

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !119
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !120
  store i16 2, i16* %sin_family, align 4, !dbg !121
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !122
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !123
  store i32 0, i32* %s_addr, align 4, !dbg !124
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !125
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !126
  store i16 %call1, i16* %sin_port, align 2, !dbg !127
  %2 = load i32, i32* %listenSocket, align 4, !dbg !128
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !130
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !131
  %cmp3 = icmp eq i32 %call2, -1, !dbg !132
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !133

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !134

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !136
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !138
  %cmp7 = icmp eq i32 %call6, -1, !dbg !139
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !140

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !141

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !143
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !144
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !145
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !146
  %cmp11 = icmp eq i32 %6, -1, !dbg !148
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !149

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !150

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !152
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !153
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !154
  %conv = trunc i64 %call14 to i32, !dbg !154
  store i32 %conv, i32* %recvResult, align 4, !dbg !155
  %8 = load i32, i32* %recvResult, align 4, !dbg !156
  %cmp15 = icmp eq i32 %8, -1, !dbg !158
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !159

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !160
  %cmp17 = icmp eq i32 %9, 0, !dbg !161
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !162

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !163

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !165
  %idxprom = sext i32 %10 to i64, !dbg !166
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !166
  store i8 0, i8* %arrayidx, align 1, !dbg !167
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !168
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !169
  store i32 %call22, i32* %data, align 4, !dbg !170
  br label %do.end, !dbg !171

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !172
  %cmp23 = icmp ne i32 %11, -1, !dbg !174
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !175

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !176
  %call26 = call i32 @close(i32 %12), !dbg !178
  br label %if.end27, !dbg !179

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !180
  %cmp28 = icmp ne i32 %13, -1, !dbg !182
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !183

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !184
  %call31 = call i32 @close(i32 %14), !dbg !186
  br label %if.end32, !dbg !187

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %sink, !dbg !188

sink:                                             ; preds = %if.end32
  call void @llvm.dbg.label(metadata !189), !dbg !190
  call void @llvm.dbg.declare(metadata i32* %i, metadata !191, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !194, metadata !DIExpression()), !dbg !198
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !198
  %16 = load i32, i32* %data, align 4, !dbg !199
  %cmp33 = icmp slt i32 %16, 10, !dbg !201
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !202

if.then35:                                        ; preds = %sink
  %17 = load i32, i32* %data, align 4, !dbg !203
  %idxprom36 = sext i32 %17 to i64, !dbg !205
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !205
  store i32 1, i32* %arrayidx37, align 4, !dbg !206
  store i32 0, i32* %i, align 4, !dbg !207
  br label %for.cond, !dbg !209

for.cond:                                         ; preds = %for.inc, %if.then35
  %18 = load i32, i32* %i, align 4, !dbg !210
  %cmp38 = icmp slt i32 %18, 10, !dbg !212
  br i1 %cmp38, label %for.body, label %for.end, !dbg !213

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !214
  %idxprom40 = sext i32 %19 to i64, !dbg !216
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom40, !dbg !216
  %20 = load i32, i32* %arrayidx41, align 4, !dbg !216
  call void @printIntLine(i32 %20), !dbg !217
  br label %for.inc, !dbg !218

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !219
  %inc = add nsw i32 %21, 1, !dbg !219
  store i32 %inc, i32* %i, align 4, !dbg !219
  br label %for.cond, !dbg !220, !llvm.loop !221

for.end:                                          ; preds = %for.cond
  br label %if.end42, !dbg !224

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !225
  br label %if.end42

if.end42:                                         ; preds = %if.else, %for.end
  ret void, !dbg !227
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_18_good() #0 !dbg !228 {
entry:
  call void @goodB2G(), !dbg !229
  call void @goodG2B(), !dbg !230
  ret void, !dbg !231
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !232 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !237, metadata !DIExpression()), !dbg !238
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !239, metadata !DIExpression()), !dbg !240
  %call = call i64 @time(i64* null) #7, !dbg !241
  %conv = trunc i64 %call to i32, !dbg !242
  call void @srand(i32 %conv) #7, !dbg !243
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !244
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_18_good(), !dbg !245
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !246
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !247
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_18_bad(), !dbg !248
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !249
  ret i32 0, !dbg !250
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !251 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 -1, i32* %data, align 4, !dbg !254
  br label %source, !dbg !255

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !256), !dbg !257
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !258, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !261, metadata !DIExpression()), !dbg !262
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 -1, i32* %listenSocket, align 4, !dbg !264
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !265, metadata !DIExpression()), !dbg !266
  store i32 -1, i32* %acceptSocket, align 4, !dbg !266
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !267, metadata !DIExpression()), !dbg !268
  br label %do.body, !dbg !269

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !270
  store i32 %call, i32* %listenSocket, align 4, !dbg !272
  %0 = load i32, i32* %listenSocket, align 4, !dbg !273
  %cmp = icmp eq i32 %0, -1, !dbg !275
  br i1 %cmp, label %if.then, label %if.end, !dbg !276

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !277

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !279
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !279
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !280
  store i16 2, i16* %sin_family, align 4, !dbg !281
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !282
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !283
  store i32 0, i32* %s_addr, align 4, !dbg !284
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !285
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !286
  store i16 %call1, i16* %sin_port, align 2, !dbg !287
  %2 = load i32, i32* %listenSocket, align 4, !dbg !288
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !290
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !291
  %cmp3 = icmp eq i32 %call2, -1, !dbg !292
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !293

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !294

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !296
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !298
  %cmp7 = icmp eq i32 %call6, -1, !dbg !299
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !300

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !301

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !303
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !304
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !305
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !306
  %cmp11 = icmp eq i32 %6, -1, !dbg !308
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !309

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !310

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !312
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !313
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !314
  %conv = trunc i64 %call14 to i32, !dbg !314
  store i32 %conv, i32* %recvResult, align 4, !dbg !315
  %8 = load i32, i32* %recvResult, align 4, !dbg !316
  %cmp15 = icmp eq i32 %8, -1, !dbg !318
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !319

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !320
  %cmp17 = icmp eq i32 %9, 0, !dbg !321
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !322

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !323

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !325
  %idxprom = sext i32 %10 to i64, !dbg !326
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !326
  store i8 0, i8* %arrayidx, align 1, !dbg !327
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !328
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !329
  store i32 %call22, i32* %data, align 4, !dbg !330
  br label %do.end, !dbg !331

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !332
  %cmp23 = icmp ne i32 %11, -1, !dbg !334
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !335

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !336
  %call26 = call i32 @close(i32 %12), !dbg !338
  br label %if.end27, !dbg !339

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !340
  %cmp28 = icmp ne i32 %13, -1, !dbg !342
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !343

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !344
  %call31 = call i32 @close(i32 %14), !dbg !346
  br label %if.end32, !dbg !347

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %sink, !dbg !348

sink:                                             ; preds = %if.end32
  call void @llvm.dbg.label(metadata !349), !dbg !350
  call void @llvm.dbg.declare(metadata i32* %i, metadata !351, metadata !DIExpression()), !dbg !353
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !354, metadata !DIExpression()), !dbg !355
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !355
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !355
  %16 = load i32, i32* %data, align 4, !dbg !356
  %cmp33 = icmp sge i32 %16, 0, !dbg !358
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !359

land.lhs.true:                                    ; preds = %sink
  %17 = load i32, i32* %data, align 4, !dbg !360
  %cmp35 = icmp slt i32 %17, 10, !dbg !361
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !362

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !363
  %idxprom38 = sext i32 %18 to i64, !dbg !365
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !365
  store i32 1, i32* %arrayidx39, align 4, !dbg !366
  store i32 0, i32* %i, align 4, !dbg !367
  br label %for.cond, !dbg !369

for.cond:                                         ; preds = %for.inc, %if.then37
  %19 = load i32, i32* %i, align 4, !dbg !370
  %cmp40 = icmp slt i32 %19, 10, !dbg !372
  br i1 %cmp40, label %for.body, label %for.end, !dbg !373

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !374
  %idxprom42 = sext i32 %20 to i64, !dbg !376
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !376
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !376
  call void @printIntLine(i32 %21), !dbg !377
  br label %for.inc, !dbg !378

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !379
  %inc = add nsw i32 %22, 1, !dbg !379
  store i32 %inc, i32* %i, align 4, !dbg !379
  br label %for.cond, !dbg !380, !llvm.loop !381

for.end:                                          ; preds = %for.cond
  br label %if.end44, !dbg !383

if.else:                                          ; preds = %land.lhs.true, %sink
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !384
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end
  ret void, !dbg !386
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !387 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !388, metadata !DIExpression()), !dbg !389
  store i32 -1, i32* %data, align 4, !dbg !390
  br label %source, !dbg !391

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !392), !dbg !393
  store i32 7, i32* %data, align 4, !dbg !394
  br label %sink, !dbg !395

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !396), !dbg !397
  call void @llvm.dbg.declare(metadata i32* %i, metadata !398, metadata !DIExpression()), !dbg !400
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !401, metadata !DIExpression()), !dbg !402
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !402
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !402
  %1 = load i32, i32* %data, align 4, !dbg !403
  %cmp = icmp slt i32 %1, 10, !dbg !405
  br i1 %cmp, label %if.then, label %if.else, !dbg !406

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !407
  %idxprom = sext i32 %2 to i64, !dbg !409
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !409
  store i32 1, i32* %arrayidx, align 4, !dbg !410
  store i32 0, i32* %i, align 4, !dbg !411
  br label %for.cond, !dbg !413

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !414
  %cmp1 = icmp slt i32 %3, 10, !dbg !416
  br i1 %cmp1, label %for.body, label %for.end, !dbg !417

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !418
  %idxprom2 = sext i32 %4 to i64, !dbg !420
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !420
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !420
  call void @printIntLine(i32 %5), !dbg !421
  br label %for.inc, !dbg !422

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !423
  %inc = add nsw i32 %6, 1, !dbg !423
  store i32 %inc, i32* %i, align 4, !dbg !423
  br label %for.cond, !dbg !424, !llvm.loop !425

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !427

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !428
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !430
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !50, line: 42, baseType: !5)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !53, line: 178, size: 128, elements: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!54 = !{!55, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !52, file: !53, line: 180, baseType: !56, size: 16)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !57, line: 28, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!58 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !52, file: !53, line: 181, baseType: !60, size: 112, offset: 16)
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
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_18_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_18.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocation(line: 49, column: 5, scope: !70)
!80 = !DILabel(scope: !70, name: "source", file: !71, line: 50)
!81 = !DILocation(line: 50, column: 1, scope: !70)
!82 = !DILocalVariable(name: "recvResult", scope: !83, file: !71, line: 56, type: !76)
!83 = distinct !DILexicalBlock(scope: !70, file: !71, line: 51, column: 5)
!84 = !DILocation(line: 56, column: 13, scope: !83)
!85 = !DILocalVariable(name: "service", scope: !83, file: !71, line: 57, type: !86)
!86 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !87)
!87 = !{!88, !89, !93, !97}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !86, file: !17, line: 240, baseType: !56, size: 16)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !86, file: !17, line: 241, baseType: !90, size: 16, offset: 16)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !86, file: !17, line: 242, baseType: !94, size: 32, offset: 32)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !95)
!95 = !{!96}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !94, file: !17, line: 33, baseType: !46, size: 32)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !86, file: !17, line: 245, baseType: !98, size: 64, offset: 64)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !99, size: 64, elements: !100)
!99 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!100 = !{!101}
!101 = !DISubrange(count: 8)
!102 = !DILocation(line: 57, column: 28, scope: !83)
!103 = !DILocalVariable(name: "listenSocket", scope: !83, file: !71, line: 58, type: !76)
!104 = !DILocation(line: 58, column: 16, scope: !83)
!105 = !DILocalVariable(name: "acceptSocket", scope: !83, file: !71, line: 59, type: !76)
!106 = !DILocation(line: 59, column: 16, scope: !83)
!107 = !DILocalVariable(name: "inputBuffer", scope: !83, file: !71, line: 60, type: !60)
!108 = !DILocation(line: 60, column: 14, scope: !83)
!109 = !DILocation(line: 61, column: 9, scope: !83)
!110 = !DILocation(line: 71, column: 28, scope: !111)
!111 = distinct !DILexicalBlock(scope: !83, file: !71, line: 62, column: 9)
!112 = !DILocation(line: 71, column: 26, scope: !111)
!113 = !DILocation(line: 72, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !71, line: 72, column: 17)
!115 = !DILocation(line: 72, column: 30, scope: !114)
!116 = !DILocation(line: 72, column: 17, scope: !111)
!117 = !DILocation(line: 74, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !71, line: 73, column: 13)
!119 = !DILocation(line: 76, column: 13, scope: !111)
!120 = !DILocation(line: 77, column: 21, scope: !111)
!121 = !DILocation(line: 77, column: 32, scope: !111)
!122 = !DILocation(line: 78, column: 21, scope: !111)
!123 = !DILocation(line: 78, column: 30, scope: !111)
!124 = !DILocation(line: 78, column: 37, scope: !111)
!125 = !DILocation(line: 79, column: 32, scope: !111)
!126 = !DILocation(line: 79, column: 21, scope: !111)
!127 = !DILocation(line: 79, column: 30, scope: !111)
!128 = !DILocation(line: 80, column: 22, scope: !129)
!129 = distinct !DILexicalBlock(scope: !111, file: !71, line: 80, column: 17)
!130 = !DILocation(line: 80, column: 36, scope: !129)
!131 = !DILocation(line: 80, column: 17, scope: !129)
!132 = !DILocation(line: 80, column: 81, scope: !129)
!133 = !DILocation(line: 80, column: 17, scope: !111)
!134 = !DILocation(line: 82, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !71, line: 81, column: 13)
!136 = !DILocation(line: 84, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !111, file: !71, line: 84, column: 17)
!138 = !DILocation(line: 84, column: 17, scope: !137)
!139 = !DILocation(line: 84, column: 54, scope: !137)
!140 = !DILocation(line: 84, column: 17, scope: !111)
!141 = !DILocation(line: 86, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !71, line: 85, column: 13)
!143 = !DILocation(line: 88, column: 35, scope: !111)
!144 = !DILocation(line: 88, column: 28, scope: !111)
!145 = !DILocation(line: 88, column: 26, scope: !111)
!146 = !DILocation(line: 89, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !111, file: !71, line: 89, column: 17)
!148 = !DILocation(line: 89, column: 30, scope: !147)
!149 = !DILocation(line: 89, column: 17, scope: !111)
!150 = !DILocation(line: 91, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !71, line: 90, column: 13)
!152 = !DILocation(line: 94, column: 31, scope: !111)
!153 = !DILocation(line: 94, column: 45, scope: !111)
!154 = !DILocation(line: 94, column: 26, scope: !111)
!155 = !DILocation(line: 94, column: 24, scope: !111)
!156 = !DILocation(line: 95, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !111, file: !71, line: 95, column: 17)
!158 = !DILocation(line: 95, column: 28, scope: !157)
!159 = !DILocation(line: 95, column: 44, scope: !157)
!160 = !DILocation(line: 95, column: 47, scope: !157)
!161 = !DILocation(line: 95, column: 58, scope: !157)
!162 = !DILocation(line: 95, column: 17, scope: !111)
!163 = !DILocation(line: 97, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !71, line: 96, column: 13)
!165 = !DILocation(line: 100, column: 25, scope: !111)
!166 = !DILocation(line: 100, column: 13, scope: !111)
!167 = !DILocation(line: 100, column: 37, scope: !111)
!168 = !DILocation(line: 102, column: 25, scope: !111)
!169 = !DILocation(line: 102, column: 20, scope: !111)
!170 = !DILocation(line: 102, column: 18, scope: !111)
!171 = !DILocation(line: 103, column: 9, scope: !111)
!172 = !DILocation(line: 105, column: 13, scope: !173)
!173 = distinct !DILexicalBlock(scope: !83, file: !71, line: 105, column: 13)
!174 = !DILocation(line: 105, column: 26, scope: !173)
!175 = !DILocation(line: 105, column: 13, scope: !83)
!176 = !DILocation(line: 107, column: 26, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !71, line: 106, column: 9)
!178 = !DILocation(line: 107, column: 13, scope: !177)
!179 = !DILocation(line: 108, column: 9, scope: !177)
!180 = !DILocation(line: 109, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !83, file: !71, line: 109, column: 13)
!182 = !DILocation(line: 109, column: 26, scope: !181)
!183 = !DILocation(line: 109, column: 13, scope: !83)
!184 = !DILocation(line: 111, column: 26, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !71, line: 110, column: 9)
!186 = !DILocation(line: 111, column: 13, scope: !185)
!187 = !DILocation(line: 112, column: 9, scope: !185)
!188 = !DILocation(line: 120, column: 5, scope: !70)
!189 = !DILabel(scope: !70, name: "sink", file: !71, line: 121)
!190 = !DILocation(line: 121, column: 1, scope: !70)
!191 = !DILocalVariable(name: "i", scope: !192, file: !71, line: 123, type: !76)
!192 = distinct !DILexicalBlock(scope: !70, file: !71, line: 122, column: 5)
!193 = !DILocation(line: 123, column: 13, scope: !192)
!194 = !DILocalVariable(name: "buffer", scope: !192, file: !71, line: 124, type: !195)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 10)
!198 = !DILocation(line: 124, column: 13, scope: !192)
!199 = !DILocation(line: 127, column: 13, scope: !200)
!200 = distinct !DILexicalBlock(scope: !192, file: !71, line: 127, column: 13)
!201 = !DILocation(line: 127, column: 18, scope: !200)
!202 = !DILocation(line: 127, column: 13, scope: !192)
!203 = !DILocation(line: 129, column: 20, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !71, line: 128, column: 9)
!205 = !DILocation(line: 129, column: 13, scope: !204)
!206 = !DILocation(line: 129, column: 26, scope: !204)
!207 = !DILocation(line: 131, column: 19, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !71, line: 131, column: 13)
!209 = !DILocation(line: 131, column: 17, scope: !208)
!210 = !DILocation(line: 131, column: 24, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !71, line: 131, column: 13)
!212 = !DILocation(line: 131, column: 26, scope: !211)
!213 = !DILocation(line: 131, column: 13, scope: !208)
!214 = !DILocation(line: 133, column: 37, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !71, line: 132, column: 13)
!216 = !DILocation(line: 133, column: 30, scope: !215)
!217 = !DILocation(line: 133, column: 17, scope: !215)
!218 = !DILocation(line: 134, column: 13, scope: !215)
!219 = !DILocation(line: 131, column: 33, scope: !211)
!220 = !DILocation(line: 131, column: 13, scope: !211)
!221 = distinct !{!221, !213, !222, !223}
!222 = !DILocation(line: 134, column: 13, scope: !208)
!223 = !{!"llvm.loop.mustprogress"}
!224 = !DILocation(line: 135, column: 9, scope: !204)
!225 = !DILocation(line: 138, column: 13, scope: !226)
!226 = distinct !DILexicalBlock(scope: !200, file: !71, line: 137, column: 9)
!227 = !DILocation(line: 141, column: 1, scope: !70)
!228 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_18_good", scope: !71, file: !71, line: 280, type: !72, scopeLine: 281, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!229 = !DILocation(line: 282, column: 5, scope: !228)
!230 = !DILocation(line: 283, column: 5, scope: !228)
!231 = !DILocation(line: 284, column: 1, scope: !228)
!232 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 295, type: !233, scopeLine: 296, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!233 = !DISubroutineType(types: !234)
!234 = !{!76, !76, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!237 = !DILocalVariable(name: "argc", arg: 1, scope: !232, file: !71, line: 295, type: !76)
!238 = !DILocation(line: 295, column: 14, scope: !232)
!239 = !DILocalVariable(name: "argv", arg: 2, scope: !232, file: !71, line: 295, type: !235)
!240 = !DILocation(line: 295, column: 27, scope: !232)
!241 = !DILocation(line: 298, column: 22, scope: !232)
!242 = !DILocation(line: 298, column: 12, scope: !232)
!243 = !DILocation(line: 298, column: 5, scope: !232)
!244 = !DILocation(line: 300, column: 5, scope: !232)
!245 = !DILocation(line: 301, column: 5, scope: !232)
!246 = !DILocation(line: 302, column: 5, scope: !232)
!247 = !DILocation(line: 305, column: 5, scope: !232)
!248 = !DILocation(line: 306, column: 5, scope: !232)
!249 = !DILocation(line: 307, column: 5, scope: !232)
!250 = !DILocation(line: 309, column: 5, scope: !232)
!251 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 148, type: !72, scopeLine: 149, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!252 = !DILocalVariable(name: "data", scope: !251, file: !71, line: 150, type: !76)
!253 = !DILocation(line: 150, column: 9, scope: !251)
!254 = !DILocation(line: 152, column: 10, scope: !251)
!255 = !DILocation(line: 153, column: 5, scope: !251)
!256 = !DILabel(scope: !251, name: "source", file: !71, line: 154)
!257 = !DILocation(line: 154, column: 1, scope: !251)
!258 = !DILocalVariable(name: "recvResult", scope: !259, file: !71, line: 160, type: !76)
!259 = distinct !DILexicalBlock(scope: !251, file: !71, line: 155, column: 5)
!260 = !DILocation(line: 160, column: 13, scope: !259)
!261 = !DILocalVariable(name: "service", scope: !259, file: !71, line: 161, type: !86)
!262 = !DILocation(line: 161, column: 28, scope: !259)
!263 = !DILocalVariable(name: "listenSocket", scope: !259, file: !71, line: 162, type: !76)
!264 = !DILocation(line: 162, column: 16, scope: !259)
!265 = !DILocalVariable(name: "acceptSocket", scope: !259, file: !71, line: 163, type: !76)
!266 = !DILocation(line: 163, column: 16, scope: !259)
!267 = !DILocalVariable(name: "inputBuffer", scope: !259, file: !71, line: 164, type: !60)
!268 = !DILocation(line: 164, column: 14, scope: !259)
!269 = !DILocation(line: 165, column: 9, scope: !259)
!270 = !DILocation(line: 175, column: 28, scope: !271)
!271 = distinct !DILexicalBlock(scope: !259, file: !71, line: 166, column: 9)
!272 = !DILocation(line: 175, column: 26, scope: !271)
!273 = !DILocation(line: 176, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !271, file: !71, line: 176, column: 17)
!275 = !DILocation(line: 176, column: 30, scope: !274)
!276 = !DILocation(line: 176, column: 17, scope: !271)
!277 = !DILocation(line: 178, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !71, line: 177, column: 13)
!279 = !DILocation(line: 180, column: 13, scope: !271)
!280 = !DILocation(line: 181, column: 21, scope: !271)
!281 = !DILocation(line: 181, column: 32, scope: !271)
!282 = !DILocation(line: 182, column: 21, scope: !271)
!283 = !DILocation(line: 182, column: 30, scope: !271)
!284 = !DILocation(line: 182, column: 37, scope: !271)
!285 = !DILocation(line: 183, column: 32, scope: !271)
!286 = !DILocation(line: 183, column: 21, scope: !271)
!287 = !DILocation(line: 183, column: 30, scope: !271)
!288 = !DILocation(line: 184, column: 22, scope: !289)
!289 = distinct !DILexicalBlock(scope: !271, file: !71, line: 184, column: 17)
!290 = !DILocation(line: 184, column: 36, scope: !289)
!291 = !DILocation(line: 184, column: 17, scope: !289)
!292 = !DILocation(line: 184, column: 81, scope: !289)
!293 = !DILocation(line: 184, column: 17, scope: !271)
!294 = !DILocation(line: 186, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !289, file: !71, line: 185, column: 13)
!296 = !DILocation(line: 188, column: 24, scope: !297)
!297 = distinct !DILexicalBlock(scope: !271, file: !71, line: 188, column: 17)
!298 = !DILocation(line: 188, column: 17, scope: !297)
!299 = !DILocation(line: 188, column: 54, scope: !297)
!300 = !DILocation(line: 188, column: 17, scope: !271)
!301 = !DILocation(line: 190, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !297, file: !71, line: 189, column: 13)
!303 = !DILocation(line: 192, column: 35, scope: !271)
!304 = !DILocation(line: 192, column: 28, scope: !271)
!305 = !DILocation(line: 192, column: 26, scope: !271)
!306 = !DILocation(line: 193, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !271, file: !71, line: 193, column: 17)
!308 = !DILocation(line: 193, column: 30, scope: !307)
!309 = !DILocation(line: 193, column: 17, scope: !271)
!310 = !DILocation(line: 195, column: 17, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !71, line: 194, column: 13)
!312 = !DILocation(line: 198, column: 31, scope: !271)
!313 = !DILocation(line: 198, column: 45, scope: !271)
!314 = !DILocation(line: 198, column: 26, scope: !271)
!315 = !DILocation(line: 198, column: 24, scope: !271)
!316 = !DILocation(line: 199, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !271, file: !71, line: 199, column: 17)
!318 = !DILocation(line: 199, column: 28, scope: !317)
!319 = !DILocation(line: 199, column: 44, scope: !317)
!320 = !DILocation(line: 199, column: 47, scope: !317)
!321 = !DILocation(line: 199, column: 58, scope: !317)
!322 = !DILocation(line: 199, column: 17, scope: !271)
!323 = !DILocation(line: 201, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !317, file: !71, line: 200, column: 13)
!325 = !DILocation(line: 204, column: 25, scope: !271)
!326 = !DILocation(line: 204, column: 13, scope: !271)
!327 = !DILocation(line: 204, column: 37, scope: !271)
!328 = !DILocation(line: 206, column: 25, scope: !271)
!329 = !DILocation(line: 206, column: 20, scope: !271)
!330 = !DILocation(line: 206, column: 18, scope: !271)
!331 = !DILocation(line: 207, column: 9, scope: !271)
!332 = !DILocation(line: 209, column: 13, scope: !333)
!333 = distinct !DILexicalBlock(scope: !259, file: !71, line: 209, column: 13)
!334 = !DILocation(line: 209, column: 26, scope: !333)
!335 = !DILocation(line: 209, column: 13, scope: !259)
!336 = !DILocation(line: 211, column: 26, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !71, line: 210, column: 9)
!338 = !DILocation(line: 211, column: 13, scope: !337)
!339 = !DILocation(line: 212, column: 9, scope: !337)
!340 = !DILocation(line: 213, column: 13, scope: !341)
!341 = distinct !DILexicalBlock(scope: !259, file: !71, line: 213, column: 13)
!342 = !DILocation(line: 213, column: 26, scope: !341)
!343 = !DILocation(line: 213, column: 13, scope: !259)
!344 = !DILocation(line: 215, column: 26, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !71, line: 214, column: 9)
!346 = !DILocation(line: 215, column: 13, scope: !345)
!347 = !DILocation(line: 216, column: 9, scope: !345)
!348 = !DILocation(line: 224, column: 5, scope: !251)
!349 = !DILabel(scope: !251, name: "sink", file: !71, line: 225)
!350 = !DILocation(line: 225, column: 1, scope: !251)
!351 = !DILocalVariable(name: "i", scope: !352, file: !71, line: 227, type: !76)
!352 = distinct !DILexicalBlock(scope: !251, file: !71, line: 226, column: 5)
!353 = !DILocation(line: 227, column: 13, scope: !352)
!354 = !DILocalVariable(name: "buffer", scope: !352, file: !71, line: 228, type: !195)
!355 = !DILocation(line: 228, column: 13, scope: !352)
!356 = !DILocation(line: 230, column: 13, scope: !357)
!357 = distinct !DILexicalBlock(scope: !352, file: !71, line: 230, column: 13)
!358 = !DILocation(line: 230, column: 18, scope: !357)
!359 = !DILocation(line: 230, column: 23, scope: !357)
!360 = !DILocation(line: 230, column: 26, scope: !357)
!361 = !DILocation(line: 230, column: 31, scope: !357)
!362 = !DILocation(line: 230, column: 13, scope: !352)
!363 = !DILocation(line: 232, column: 20, scope: !364)
!364 = distinct !DILexicalBlock(scope: !357, file: !71, line: 231, column: 9)
!365 = !DILocation(line: 232, column: 13, scope: !364)
!366 = !DILocation(line: 232, column: 26, scope: !364)
!367 = !DILocation(line: 234, column: 19, scope: !368)
!368 = distinct !DILexicalBlock(scope: !364, file: !71, line: 234, column: 13)
!369 = !DILocation(line: 234, column: 17, scope: !368)
!370 = !DILocation(line: 234, column: 24, scope: !371)
!371 = distinct !DILexicalBlock(scope: !368, file: !71, line: 234, column: 13)
!372 = !DILocation(line: 234, column: 26, scope: !371)
!373 = !DILocation(line: 234, column: 13, scope: !368)
!374 = !DILocation(line: 236, column: 37, scope: !375)
!375 = distinct !DILexicalBlock(scope: !371, file: !71, line: 235, column: 13)
!376 = !DILocation(line: 236, column: 30, scope: !375)
!377 = !DILocation(line: 236, column: 17, scope: !375)
!378 = !DILocation(line: 237, column: 13, scope: !375)
!379 = !DILocation(line: 234, column: 33, scope: !371)
!380 = !DILocation(line: 234, column: 13, scope: !371)
!381 = distinct !{!381, !373, !382, !223}
!382 = !DILocation(line: 237, column: 13, scope: !368)
!383 = !DILocation(line: 238, column: 9, scope: !364)
!384 = !DILocation(line: 241, column: 13, scope: !385)
!385 = distinct !DILexicalBlock(scope: !357, file: !71, line: 240, column: 9)
!386 = !DILocation(line: 244, column: 1, scope: !251)
!387 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 247, type: !72, scopeLine: 248, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!388 = !DILocalVariable(name: "data", scope: !387, file: !71, line: 249, type: !76)
!389 = !DILocation(line: 249, column: 9, scope: !387)
!390 = !DILocation(line: 251, column: 10, scope: !387)
!391 = !DILocation(line: 252, column: 5, scope: !387)
!392 = !DILabel(scope: !387, name: "source", file: !71, line: 253)
!393 = !DILocation(line: 253, column: 1, scope: !387)
!394 = !DILocation(line: 256, column: 10, scope: !387)
!395 = !DILocation(line: 257, column: 5, scope: !387)
!396 = !DILabel(scope: !387, name: "sink", file: !71, line: 258)
!397 = !DILocation(line: 258, column: 1, scope: !387)
!398 = !DILocalVariable(name: "i", scope: !399, file: !71, line: 260, type: !76)
!399 = distinct !DILexicalBlock(scope: !387, file: !71, line: 259, column: 5)
!400 = !DILocation(line: 260, column: 13, scope: !399)
!401 = !DILocalVariable(name: "buffer", scope: !399, file: !71, line: 261, type: !195)
!402 = !DILocation(line: 261, column: 13, scope: !399)
!403 = !DILocation(line: 264, column: 13, scope: !404)
!404 = distinct !DILexicalBlock(scope: !399, file: !71, line: 264, column: 13)
!405 = !DILocation(line: 264, column: 18, scope: !404)
!406 = !DILocation(line: 264, column: 13, scope: !399)
!407 = !DILocation(line: 266, column: 20, scope: !408)
!408 = distinct !DILexicalBlock(scope: !404, file: !71, line: 265, column: 9)
!409 = !DILocation(line: 266, column: 13, scope: !408)
!410 = !DILocation(line: 266, column: 26, scope: !408)
!411 = !DILocation(line: 268, column: 19, scope: !412)
!412 = distinct !DILexicalBlock(scope: !408, file: !71, line: 268, column: 13)
!413 = !DILocation(line: 268, column: 17, scope: !412)
!414 = !DILocation(line: 268, column: 24, scope: !415)
!415 = distinct !DILexicalBlock(scope: !412, file: !71, line: 268, column: 13)
!416 = !DILocation(line: 268, column: 26, scope: !415)
!417 = !DILocation(line: 268, column: 13, scope: !412)
!418 = !DILocation(line: 270, column: 37, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !71, line: 269, column: 13)
!420 = !DILocation(line: 270, column: 30, scope: !419)
!421 = !DILocation(line: 270, column: 17, scope: !419)
!422 = !DILocation(line: 271, column: 13, scope: !419)
!423 = !DILocation(line: 268, column: 33, scope: !415)
!424 = !DILocation(line: 268, column: 13, scope: !415)
!425 = distinct !{!425, !417, !426, !223}
!426 = !DILocation(line: 271, column: 13, scope: !412)
!427 = !DILocation(line: 272, column: 9, scope: !408)
!428 = !DILocation(line: 275, column: 13, scope: !429)
!429 = distinct !DILexicalBlock(scope: !404, file: !71, line: 274, column: 9)
!430 = !DILocation(line: 278, column: 1, scope: !387)
