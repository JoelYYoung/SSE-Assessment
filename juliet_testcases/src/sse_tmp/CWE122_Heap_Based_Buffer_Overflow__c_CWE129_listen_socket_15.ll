; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_bad() #0 !dbg !73 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !81, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !84, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %listenSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %acceptSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %do.body, !dbg !108

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !109
  store i32 %call, i32* %listenSocket, align 4, !dbg !111
  %0 = load i32, i32* %listenSocket, align 4, !dbg !112
  %cmp = icmp eq i32 %0, -1, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !116

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !118
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !119
  store i16 2, i16* %sin_family, align 4, !dbg !120
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !121
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !122
  store i32 0, i32* %s_addr, align 4, !dbg !123
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !124
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !125
  store i16 %call1, i16* %sin_port, align 2, !dbg !126
  %2 = load i32, i32* %listenSocket, align 4, !dbg !127
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !129
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !130
  %cmp3 = icmp eq i32 %call2, -1, !dbg !131
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !132

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !133

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !135
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !137
  %cmp7 = icmp eq i32 %call6, -1, !dbg !138
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !139

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !140

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !142
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !143
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !144
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !145
  %cmp11 = icmp eq i32 %6, -1, !dbg !147
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !148

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !149

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !151
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !152
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !153
  %conv = trunc i64 %call14 to i32, !dbg !153
  store i32 %conv, i32* %recvResult, align 4, !dbg !154
  %8 = load i32, i32* %recvResult, align 4, !dbg !155
  %cmp15 = icmp eq i32 %8, -1, !dbg !157
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !158

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !159
  %cmp17 = icmp eq i32 %9, 0, !dbg !160
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !161

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !162

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !164
  %idxprom = sext i32 %10 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !167
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !168
  store i32 %call22, i32* %data, align 4, !dbg !169
  br label %do.end, !dbg !170

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !171
  %cmp23 = icmp ne i32 %11, -1, !dbg !173
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !174

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !175
  %call26 = call i32 @close(i32 %12), !dbg !177
  br label %if.end27, !dbg !178

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !179
  %cmp28 = icmp ne i32 %13, -1, !dbg !181
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !182

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !183
  %call31 = call i32 @close(i32 %14), !dbg !185
  br label %if.end32, !dbg !186

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !187, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !190, metadata !DIExpression()), !dbg !191
  %call33 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !192
  %15 = bitcast i8* %call33 to i32*, !dbg !193
  store i32* %15, i32** %buffer, align 8, !dbg !191
  %16 = load i32*, i32** %buffer, align 8, !dbg !194
  %cmp34 = icmp eq i32* %16, null, !dbg !196
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !197

if.then36:                                        ; preds = %if.end32
  call void @exit(i32 -1) #11, !dbg !198
  unreachable, !dbg !198

if.end37:                                         ; preds = %if.end32
  store i32 0, i32* %i, align 4, !dbg !200
  br label %for.cond, !dbg !202

for.cond:                                         ; preds = %for.inc, %if.end37
  %17 = load i32, i32* %i, align 4, !dbg !203
  %cmp38 = icmp slt i32 %17, 10, !dbg !205
  br i1 %cmp38, label %for.body, label %for.end, !dbg !206

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !207
  %19 = load i32, i32* %i, align 4, !dbg !209
  %idxprom40 = sext i32 %19 to i64, !dbg !207
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !207
  store i32 0, i32* %arrayidx41, align 4, !dbg !210
  br label %for.inc, !dbg !211

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !212
  %inc = add nsw i32 %20, 1, !dbg !212
  store i32 %inc, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !213, !llvm.loop !214

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !217
  %cmp42 = icmp sge i32 %21, 0, !dbg !219
  br i1 %cmp42, label %if.then44, label %if.else, !dbg !220

if.then44:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !221
  %23 = load i32, i32* %data, align 4, !dbg !223
  %idxprom45 = sext i32 %23 to i64, !dbg !221
  %arrayidx46 = getelementptr inbounds i32, i32* %22, i64 %idxprom45, !dbg !221
  store i32 1, i32* %arrayidx46, align 4, !dbg !224
  store i32 0, i32* %i, align 4, !dbg !225
  br label %for.cond47, !dbg !227

for.cond47:                                       ; preds = %for.inc53, %if.then44
  %24 = load i32, i32* %i, align 4, !dbg !228
  %cmp48 = icmp slt i32 %24, 10, !dbg !230
  br i1 %cmp48, label %for.body50, label %for.end55, !dbg !231

for.body50:                                       ; preds = %for.cond47
  %25 = load i32*, i32** %buffer, align 8, !dbg !232
  %26 = load i32, i32* %i, align 4, !dbg !234
  %idxprom51 = sext i32 %26 to i64, !dbg !232
  %arrayidx52 = getelementptr inbounds i32, i32* %25, i64 %idxprom51, !dbg !232
  %27 = load i32, i32* %arrayidx52, align 4, !dbg !232
  call void @printIntLine(i32 %27), !dbg !235
  br label %for.inc53, !dbg !236

for.inc53:                                        ; preds = %for.body50
  %28 = load i32, i32* %i, align 4, !dbg !237
  %inc54 = add nsw i32 %28, 1, !dbg !237
  store i32 %inc54, i32* %i, align 4, !dbg !237
  br label %for.cond47, !dbg !238, !llvm.loop !239

for.end55:                                        ; preds = %for.cond47
  br label %if.end56, !dbg !241

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !242
  br label %if.end56

if.end56:                                         ; preds = %if.else, %for.end55
  %29 = load i32*, i32** %buffer, align 8, !dbg !244
  %30 = bitcast i32* %29 to i8*, !dbg !244
  call void @free(i8* %30) #8, !dbg !245
  ret void, !dbg !246
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_good() #0 !dbg !247 {
entry:
  call void @goodB2G1(), !dbg !248
  call void @goodB2G2(), !dbg !249
  call void @goodG2B1(), !dbg !250
  call void @goodG2B2(), !dbg !251
  ret void, !dbg !252
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !253 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !258, metadata !DIExpression()), !dbg !259
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !260, metadata !DIExpression()), !dbg !261
  %call = call i64 @time(i64* null) #8, !dbg !262
  %conv = trunc i64 %call to i32, !dbg !263
  call void @srand(i32 %conv) #8, !dbg !264
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !265
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_good(), !dbg !266
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !267
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !268
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_bad(), !dbg !269
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !270
  ret i32 0, !dbg !271
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !272 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !273, metadata !DIExpression()), !dbg !274
  store i32 -1, i32* %data, align 4, !dbg !275
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !276, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !279, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !281, metadata !DIExpression()), !dbg !282
  store i32 -1, i32* %listenSocket, align 4, !dbg !282
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !283, metadata !DIExpression()), !dbg !284
  store i32 -1, i32* %acceptSocket, align 4, !dbg !284
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !285, metadata !DIExpression()), !dbg !286
  br label %do.body, !dbg !287

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !288
  store i32 %call, i32* %listenSocket, align 4, !dbg !290
  %0 = load i32, i32* %listenSocket, align 4, !dbg !291
  %cmp = icmp eq i32 %0, -1, !dbg !293
  br i1 %cmp, label %if.then, label %if.end, !dbg !294

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !295

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !297
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !297
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !298
  store i16 2, i16* %sin_family, align 4, !dbg !299
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !300
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !301
  store i32 0, i32* %s_addr, align 4, !dbg !302
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !303
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !304
  store i16 %call1, i16* %sin_port, align 2, !dbg !305
  %2 = load i32, i32* %listenSocket, align 4, !dbg !306
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !308
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !309
  %cmp3 = icmp eq i32 %call2, -1, !dbg !310
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !311

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !312

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !314
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !316
  %cmp7 = icmp eq i32 %call6, -1, !dbg !317
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !318

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !319

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !321
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !322
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !323
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !324
  %cmp11 = icmp eq i32 %6, -1, !dbg !326
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !327

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !328

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !330
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !331
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !332
  %conv = trunc i64 %call14 to i32, !dbg !332
  store i32 %conv, i32* %recvResult, align 4, !dbg !333
  %8 = load i32, i32* %recvResult, align 4, !dbg !334
  %cmp15 = icmp eq i32 %8, -1, !dbg !336
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !337

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !338
  %cmp17 = icmp eq i32 %9, 0, !dbg !339
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !340

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !341

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !343
  %idxprom = sext i32 %10 to i64, !dbg !344
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !344
  store i8 0, i8* %arrayidx, align 1, !dbg !345
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !346
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !347
  store i32 %call22, i32* %data, align 4, !dbg !348
  br label %do.end, !dbg !349

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !350
  %cmp23 = icmp ne i32 %11, -1, !dbg !352
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !353

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !354
  %call26 = call i32 @close(i32 %12), !dbg !356
  br label %if.end27, !dbg !357

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !358
  %cmp28 = icmp ne i32 %13, -1, !dbg !360
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !361

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !362
  %call31 = call i32 @close(i32 %14), !dbg !364
  br label %if.end32, !dbg !365

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !366, metadata !DIExpression()), !dbg !368
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !369, metadata !DIExpression()), !dbg !370
  %call33 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !371
  %15 = bitcast i8* %call33 to i32*, !dbg !372
  store i32* %15, i32** %buffer, align 8, !dbg !370
  %16 = load i32*, i32** %buffer, align 8, !dbg !373
  %cmp34 = icmp eq i32* %16, null, !dbg !375
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !376

if.then36:                                        ; preds = %if.end32
  call void @exit(i32 -1) #11, !dbg !377
  unreachable, !dbg !377

if.end37:                                         ; preds = %if.end32
  store i32 0, i32* %i, align 4, !dbg !379
  br label %for.cond, !dbg !381

for.cond:                                         ; preds = %for.inc, %if.end37
  %17 = load i32, i32* %i, align 4, !dbg !382
  %cmp38 = icmp slt i32 %17, 10, !dbg !384
  br i1 %cmp38, label %for.body, label %for.end, !dbg !385

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !386
  %19 = load i32, i32* %i, align 4, !dbg !388
  %idxprom40 = sext i32 %19 to i64, !dbg !386
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !386
  store i32 0, i32* %arrayidx41, align 4, !dbg !389
  br label %for.inc, !dbg !390

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !391
  %inc = add nsw i32 %20, 1, !dbg !391
  store i32 %inc, i32* %i, align 4, !dbg !391
  br label %for.cond, !dbg !392, !llvm.loop !393

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !395
  %cmp42 = icmp sge i32 %21, 0, !dbg !397
  br i1 %cmp42, label %land.lhs.true, label %if.else, !dbg !398

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !399
  %cmp44 = icmp slt i32 %22, 10, !dbg !400
  br i1 %cmp44, label %if.then46, label %if.else, !dbg !401

if.then46:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !402
  %24 = load i32, i32* %data, align 4, !dbg !404
  %idxprom47 = sext i32 %24 to i64, !dbg !402
  %arrayidx48 = getelementptr inbounds i32, i32* %23, i64 %idxprom47, !dbg !402
  store i32 1, i32* %arrayidx48, align 4, !dbg !405
  store i32 0, i32* %i, align 4, !dbg !406
  br label %for.cond49, !dbg !408

for.cond49:                                       ; preds = %for.inc55, %if.then46
  %25 = load i32, i32* %i, align 4, !dbg !409
  %cmp50 = icmp slt i32 %25, 10, !dbg !411
  br i1 %cmp50, label %for.body52, label %for.end57, !dbg !412

for.body52:                                       ; preds = %for.cond49
  %26 = load i32*, i32** %buffer, align 8, !dbg !413
  %27 = load i32, i32* %i, align 4, !dbg !415
  %idxprom53 = sext i32 %27 to i64, !dbg !413
  %arrayidx54 = getelementptr inbounds i32, i32* %26, i64 %idxprom53, !dbg !413
  %28 = load i32, i32* %arrayidx54, align 4, !dbg !413
  call void @printIntLine(i32 %28), !dbg !416
  br label %for.inc55, !dbg !417

for.inc55:                                        ; preds = %for.body52
  %29 = load i32, i32* %i, align 4, !dbg !418
  %inc56 = add nsw i32 %29, 1, !dbg !418
  store i32 %inc56, i32* %i, align 4, !dbg !418
  br label %for.cond49, !dbg !419, !llvm.loop !420

for.end57:                                        ; preds = %for.cond49
  br label %if.end58, !dbg !422

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !423
  br label %if.end58

if.end58:                                         ; preds = %if.else, %for.end57
  %30 = load i32*, i32** %buffer, align 8, !dbg !425
  %31 = bitcast i32* %30 to i8*, !dbg !425
  call void @free(i8* %31) #8, !dbg !426
  ret void, !dbg !427
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !428 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !429, metadata !DIExpression()), !dbg !430
  store i32 -1, i32* %data, align 4, !dbg !431
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !432, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !435, metadata !DIExpression()), !dbg !436
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !437, metadata !DIExpression()), !dbg !438
  store i32 -1, i32* %listenSocket, align 4, !dbg !438
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !439, metadata !DIExpression()), !dbg !440
  store i32 -1, i32* %acceptSocket, align 4, !dbg !440
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !441, metadata !DIExpression()), !dbg !442
  br label %do.body, !dbg !443

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !444
  store i32 %call, i32* %listenSocket, align 4, !dbg !446
  %0 = load i32, i32* %listenSocket, align 4, !dbg !447
  %cmp = icmp eq i32 %0, -1, !dbg !449
  br i1 %cmp, label %if.then, label %if.end, !dbg !450

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !451

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !453
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !453
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !454
  store i16 2, i16* %sin_family, align 4, !dbg !455
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !456
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !457
  store i32 0, i32* %s_addr, align 4, !dbg !458
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !459
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !460
  store i16 %call1, i16* %sin_port, align 2, !dbg !461
  %2 = load i32, i32* %listenSocket, align 4, !dbg !462
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !464
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !465
  %cmp3 = icmp eq i32 %call2, -1, !dbg !466
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !467

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !468

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !470
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !472
  %cmp7 = icmp eq i32 %call6, -1, !dbg !473
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !474

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !475

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !477
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !478
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !479
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !480
  %cmp11 = icmp eq i32 %6, -1, !dbg !482
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !483

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !484

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !486
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !487
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !488
  %conv = trunc i64 %call14 to i32, !dbg !488
  store i32 %conv, i32* %recvResult, align 4, !dbg !489
  %8 = load i32, i32* %recvResult, align 4, !dbg !490
  %cmp15 = icmp eq i32 %8, -1, !dbg !492
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !493

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !494
  %cmp17 = icmp eq i32 %9, 0, !dbg !495
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !496

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !497

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !499
  %idxprom = sext i32 %10 to i64, !dbg !500
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !500
  store i8 0, i8* %arrayidx, align 1, !dbg !501
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !502
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !503
  store i32 %call22, i32* %data, align 4, !dbg !504
  br label %do.end, !dbg !505

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !506
  %cmp23 = icmp ne i32 %11, -1, !dbg !508
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !509

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !510
  %call26 = call i32 @close(i32 %12), !dbg !512
  br label %if.end27, !dbg !513

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !514
  %cmp28 = icmp ne i32 %13, -1, !dbg !516
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !517

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !518
  %call31 = call i32 @close(i32 %14), !dbg !520
  br label %if.end32, !dbg !521

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !522, metadata !DIExpression()), !dbg !524
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !525, metadata !DIExpression()), !dbg !526
  %call33 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !527
  %15 = bitcast i8* %call33 to i32*, !dbg !528
  store i32* %15, i32** %buffer, align 8, !dbg !526
  %16 = load i32*, i32** %buffer, align 8, !dbg !529
  %cmp34 = icmp eq i32* %16, null, !dbg !531
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !532

if.then36:                                        ; preds = %if.end32
  call void @exit(i32 -1) #11, !dbg !533
  unreachable, !dbg !533

if.end37:                                         ; preds = %if.end32
  store i32 0, i32* %i, align 4, !dbg !535
  br label %for.cond, !dbg !537

for.cond:                                         ; preds = %for.inc, %if.end37
  %17 = load i32, i32* %i, align 4, !dbg !538
  %cmp38 = icmp slt i32 %17, 10, !dbg !540
  br i1 %cmp38, label %for.body, label %for.end, !dbg !541

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !542
  %19 = load i32, i32* %i, align 4, !dbg !544
  %idxprom40 = sext i32 %19 to i64, !dbg !542
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !542
  store i32 0, i32* %arrayidx41, align 4, !dbg !545
  br label %for.inc, !dbg !546

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !547
  %inc = add nsw i32 %20, 1, !dbg !547
  store i32 %inc, i32* %i, align 4, !dbg !547
  br label %for.cond, !dbg !548, !llvm.loop !549

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !551
  %cmp42 = icmp sge i32 %21, 0, !dbg !553
  br i1 %cmp42, label %land.lhs.true, label %if.else, !dbg !554

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !555
  %cmp44 = icmp slt i32 %22, 10, !dbg !556
  br i1 %cmp44, label %if.then46, label %if.else, !dbg !557

if.then46:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !558
  %24 = load i32, i32* %data, align 4, !dbg !560
  %idxprom47 = sext i32 %24 to i64, !dbg !558
  %arrayidx48 = getelementptr inbounds i32, i32* %23, i64 %idxprom47, !dbg !558
  store i32 1, i32* %arrayidx48, align 4, !dbg !561
  store i32 0, i32* %i, align 4, !dbg !562
  br label %for.cond49, !dbg !564

for.cond49:                                       ; preds = %for.inc55, %if.then46
  %25 = load i32, i32* %i, align 4, !dbg !565
  %cmp50 = icmp slt i32 %25, 10, !dbg !567
  br i1 %cmp50, label %for.body52, label %for.end57, !dbg !568

for.body52:                                       ; preds = %for.cond49
  %26 = load i32*, i32** %buffer, align 8, !dbg !569
  %27 = load i32, i32* %i, align 4, !dbg !571
  %idxprom53 = sext i32 %27 to i64, !dbg !569
  %arrayidx54 = getelementptr inbounds i32, i32* %26, i64 %idxprom53, !dbg !569
  %28 = load i32, i32* %arrayidx54, align 4, !dbg !569
  call void @printIntLine(i32 %28), !dbg !572
  br label %for.inc55, !dbg !573

for.inc55:                                        ; preds = %for.body52
  %29 = load i32, i32* %i, align 4, !dbg !574
  %inc56 = add nsw i32 %29, 1, !dbg !574
  store i32 %inc56, i32* %i, align 4, !dbg !574
  br label %for.cond49, !dbg !575, !llvm.loop !576

for.end57:                                        ; preds = %for.cond49
  br label %if.end58, !dbg !578

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !579
  br label %if.end58

if.end58:                                         ; preds = %if.else, %for.end57
  %30 = load i32*, i32** %buffer, align 8, !dbg !581
  %31 = bitcast i32* %30 to i8*, !dbg !581
  call void @free(i8* %31) #8, !dbg !582
  ret void, !dbg !583
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !584 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !585, metadata !DIExpression()), !dbg !586
  store i32 -1, i32* %data, align 4, !dbg !587
  store i32 7, i32* %data, align 4, !dbg !588
  call void @llvm.dbg.declare(metadata i32* %i, metadata !589, metadata !DIExpression()), !dbg !591
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !592, metadata !DIExpression()), !dbg !593
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !594
  %0 = bitcast i8* %call to i32*, !dbg !595
  store i32* %0, i32** %buffer, align 8, !dbg !593
  %1 = load i32*, i32** %buffer, align 8, !dbg !596
  %cmp = icmp eq i32* %1, null, !dbg !598
  br i1 %cmp, label %if.then, label %if.end, !dbg !599

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !600
  unreachable, !dbg !600

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !602
  br label %for.cond, !dbg !604

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !605
  %cmp1 = icmp slt i32 %2, 10, !dbg !607
  br i1 %cmp1, label %for.body, label %for.end, !dbg !608

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !609
  %4 = load i32, i32* %i, align 4, !dbg !611
  %idxprom = sext i32 %4 to i64, !dbg !609
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !609
  store i32 0, i32* %arrayidx, align 4, !dbg !612
  br label %for.inc, !dbg !613

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !614
  %inc = add nsw i32 %5, 1, !dbg !614
  store i32 %inc, i32* %i, align 4, !dbg !614
  br label %for.cond, !dbg !615, !llvm.loop !616

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !618
  %cmp2 = icmp sge i32 %6, 0, !dbg !620
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !621

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !622
  %8 = load i32, i32* %data, align 4, !dbg !624
  %idxprom4 = sext i32 %8 to i64, !dbg !622
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !622
  store i32 1, i32* %arrayidx5, align 4, !dbg !625
  store i32 0, i32* %i, align 4, !dbg !626
  br label %for.cond6, !dbg !628

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !629
  %cmp7 = icmp slt i32 %9, 10, !dbg !631
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !632

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !633
  %11 = load i32, i32* %i, align 4, !dbg !635
  %idxprom9 = sext i32 %11 to i64, !dbg !633
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !633
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !633
  call void @printIntLine(i32 %12), !dbg !636
  br label %for.inc11, !dbg !637

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !638
  %inc12 = add nsw i32 %13, 1, !dbg !638
  store i32 %inc12, i32* %i, align 4, !dbg !638
  br label %for.cond6, !dbg !639, !llvm.loop !640

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !642

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !643
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !645
  %15 = bitcast i32* %14 to i8*, !dbg !645
  call void @free(i8* %15) #8, !dbg !646
  ret void, !dbg !647
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !648 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !649, metadata !DIExpression()), !dbg !650
  store i32 -1, i32* %data, align 4, !dbg !651
  store i32 7, i32* %data, align 4, !dbg !652
  call void @llvm.dbg.declare(metadata i32* %i, metadata !653, metadata !DIExpression()), !dbg !655
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !656, metadata !DIExpression()), !dbg !657
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !658
  %0 = bitcast i8* %call to i32*, !dbg !659
  store i32* %0, i32** %buffer, align 8, !dbg !657
  %1 = load i32*, i32** %buffer, align 8, !dbg !660
  %cmp = icmp eq i32* %1, null, !dbg !662
  br i1 %cmp, label %if.then, label %if.end, !dbg !663

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !664
  unreachable, !dbg !664

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !666
  br label %for.cond, !dbg !668

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !669
  %cmp1 = icmp slt i32 %2, 10, !dbg !671
  br i1 %cmp1, label %for.body, label %for.end, !dbg !672

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !673
  %4 = load i32, i32* %i, align 4, !dbg !675
  %idxprom = sext i32 %4 to i64, !dbg !673
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !673
  store i32 0, i32* %arrayidx, align 4, !dbg !676
  br label %for.inc, !dbg !677

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !678
  %inc = add nsw i32 %5, 1, !dbg !678
  store i32 %inc, i32* %i, align 4, !dbg !678
  br label %for.cond, !dbg !679, !llvm.loop !680

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !682
  %cmp2 = icmp sge i32 %6, 0, !dbg !684
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !685

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !686
  %8 = load i32, i32* %data, align 4, !dbg !688
  %idxprom4 = sext i32 %8 to i64, !dbg !686
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !686
  store i32 1, i32* %arrayidx5, align 4, !dbg !689
  store i32 0, i32* %i, align 4, !dbg !690
  br label %for.cond6, !dbg !692

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !693
  %cmp7 = icmp slt i32 %9, 10, !dbg !695
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !696

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !697
  %11 = load i32, i32* %i, align 4, !dbg !699
  %idxprom9 = sext i32 %11 to i64, !dbg !697
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !697
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !697
  call void @printIntLine(i32 %12), !dbg !700
  br label %for.inc11, !dbg !701

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !702
  %inc12 = add nsw i32 %13, 1, !dbg !702
  store i32 %inc12, i32* %i, align 4, !dbg !702
  br label %for.cond6, !dbg !703, !llvm.loop !704

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !706

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !707
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !709
  %15 = bitcast i32* %14 to i8*, !dbg !709
  call void @free(i8* %15) #8, !dbg !710
  ret void, !dbg !711
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { nounwind readnone willreturn }
attributes #10 = { nounwind readonly willreturn }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!67, !68, !69, !70, !71}
!llvm.ident = !{!72}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15.c", directory: "/root/SSE-Assessment")
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
!45 = !{!46, !51, !64, !66, !5}
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
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!67 = !{i32 7, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 3}
!69 = !{i32 1, !"wchar_size", i32 4}
!70 = !{i32 7, !"uwtable", i32 1}
!71 = !{i32 7, !"frame-pointer", i32 2}
!72 = !{!"clang version 13.0.0"}
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_bad", scope: !74, file: !74, line: 44, type: !75, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15.c", directory: "/root/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 46, type: !65)
!79 = !DILocation(line: 46, column: 9, scope: !73)
!80 = !DILocation(line: 48, column: 10, scope: !73)
!81 = !DILocalVariable(name: "recvResult", scope: !82, file: !74, line: 57, type: !65)
!82 = distinct !DILexicalBlock(scope: !73, file: !74, line: 52, column: 5)
!83 = !DILocation(line: 57, column: 13, scope: !82)
!84 = !DILocalVariable(name: "service", scope: !82, file: !74, line: 58, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !86)
!86 = !{!87, !88, !92, !96}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !85, file: !17, line: 239, baseType: !56, size: 16)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !85, file: !17, line: 240, baseType: !89, size: 16, offset: 16)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !85, file: !17, line: 241, baseType: !93, size: 32, offset: 32)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !94)
!94 = !{!95}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !93, file: !17, line: 33, baseType: !46, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !85, file: !17, line: 244, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 58, column: 28, scope: !82)
!102 = !DILocalVariable(name: "listenSocket", scope: !82, file: !74, line: 59, type: !65)
!103 = !DILocation(line: 59, column: 16, scope: !82)
!104 = !DILocalVariable(name: "acceptSocket", scope: !82, file: !74, line: 60, type: !65)
!105 = !DILocation(line: 60, column: 16, scope: !82)
!106 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !74, line: 61, type: !60)
!107 = !DILocation(line: 61, column: 14, scope: !82)
!108 = !DILocation(line: 62, column: 9, scope: !82)
!109 = !DILocation(line: 72, column: 28, scope: !110)
!110 = distinct !DILexicalBlock(scope: !82, file: !74, line: 63, column: 9)
!111 = !DILocation(line: 72, column: 26, scope: !110)
!112 = !DILocation(line: 73, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !74, line: 73, column: 17)
!114 = !DILocation(line: 73, column: 30, scope: !113)
!115 = !DILocation(line: 73, column: 17, scope: !110)
!116 = !DILocation(line: 75, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !74, line: 74, column: 13)
!118 = !DILocation(line: 77, column: 13, scope: !110)
!119 = !DILocation(line: 78, column: 21, scope: !110)
!120 = !DILocation(line: 78, column: 32, scope: !110)
!121 = !DILocation(line: 79, column: 21, scope: !110)
!122 = !DILocation(line: 79, column: 30, scope: !110)
!123 = !DILocation(line: 79, column: 37, scope: !110)
!124 = !DILocation(line: 80, column: 32, scope: !110)
!125 = !DILocation(line: 80, column: 21, scope: !110)
!126 = !DILocation(line: 80, column: 30, scope: !110)
!127 = !DILocation(line: 81, column: 22, scope: !128)
!128 = distinct !DILexicalBlock(scope: !110, file: !74, line: 81, column: 17)
!129 = !DILocation(line: 81, column: 36, scope: !128)
!130 = !DILocation(line: 81, column: 17, scope: !128)
!131 = !DILocation(line: 81, column: 81, scope: !128)
!132 = !DILocation(line: 81, column: 17, scope: !110)
!133 = !DILocation(line: 83, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !74, line: 82, column: 13)
!135 = !DILocation(line: 85, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !110, file: !74, line: 85, column: 17)
!137 = !DILocation(line: 85, column: 17, scope: !136)
!138 = !DILocation(line: 85, column: 54, scope: !136)
!139 = !DILocation(line: 85, column: 17, scope: !110)
!140 = !DILocation(line: 87, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !74, line: 86, column: 13)
!142 = !DILocation(line: 89, column: 35, scope: !110)
!143 = !DILocation(line: 89, column: 28, scope: !110)
!144 = !DILocation(line: 89, column: 26, scope: !110)
!145 = !DILocation(line: 90, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !110, file: !74, line: 90, column: 17)
!147 = !DILocation(line: 90, column: 30, scope: !146)
!148 = !DILocation(line: 90, column: 17, scope: !110)
!149 = !DILocation(line: 92, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !74, line: 91, column: 13)
!151 = !DILocation(line: 95, column: 31, scope: !110)
!152 = !DILocation(line: 95, column: 45, scope: !110)
!153 = !DILocation(line: 95, column: 26, scope: !110)
!154 = !DILocation(line: 95, column: 24, scope: !110)
!155 = !DILocation(line: 96, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !110, file: !74, line: 96, column: 17)
!157 = !DILocation(line: 96, column: 28, scope: !156)
!158 = !DILocation(line: 96, column: 44, scope: !156)
!159 = !DILocation(line: 96, column: 47, scope: !156)
!160 = !DILocation(line: 96, column: 58, scope: !156)
!161 = !DILocation(line: 96, column: 17, scope: !110)
!162 = !DILocation(line: 98, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !74, line: 97, column: 13)
!164 = !DILocation(line: 101, column: 25, scope: !110)
!165 = !DILocation(line: 101, column: 13, scope: !110)
!166 = !DILocation(line: 101, column: 37, scope: !110)
!167 = !DILocation(line: 103, column: 25, scope: !110)
!168 = !DILocation(line: 103, column: 20, scope: !110)
!169 = !DILocation(line: 103, column: 18, scope: !110)
!170 = !DILocation(line: 104, column: 9, scope: !110)
!171 = !DILocation(line: 106, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !82, file: !74, line: 106, column: 13)
!173 = !DILocation(line: 106, column: 26, scope: !172)
!174 = !DILocation(line: 106, column: 13, scope: !82)
!175 = !DILocation(line: 108, column: 26, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !74, line: 107, column: 9)
!177 = !DILocation(line: 108, column: 13, scope: !176)
!178 = !DILocation(line: 109, column: 9, scope: !176)
!179 = !DILocation(line: 110, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !82, file: !74, line: 110, column: 13)
!181 = !DILocation(line: 110, column: 26, scope: !180)
!182 = !DILocation(line: 110, column: 13, scope: !82)
!183 = !DILocation(line: 112, column: 26, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !74, line: 111, column: 9)
!185 = !DILocation(line: 112, column: 13, scope: !184)
!186 = !DILocation(line: 113, column: 9, scope: !184)
!187 = !DILocalVariable(name: "i", scope: !188, file: !74, line: 131, type: !65)
!188 = distinct !DILexicalBlock(scope: !73, file: !74, line: 130, column: 5)
!189 = !DILocation(line: 131, column: 13, scope: !188)
!190 = !DILocalVariable(name: "buffer", scope: !188, file: !74, line: 132, type: !64)
!191 = !DILocation(line: 132, column: 15, scope: !188)
!192 = !DILocation(line: 132, column: 31, scope: !188)
!193 = !DILocation(line: 132, column: 24, scope: !188)
!194 = !DILocation(line: 133, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !188, file: !74, line: 133, column: 13)
!196 = !DILocation(line: 133, column: 20, scope: !195)
!197 = !DILocation(line: 133, column: 13, scope: !188)
!198 = !DILocation(line: 133, column: 30, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !74, line: 133, column: 29)
!200 = !DILocation(line: 135, column: 16, scope: !201)
!201 = distinct !DILexicalBlock(scope: !188, file: !74, line: 135, column: 9)
!202 = !DILocation(line: 135, column: 14, scope: !201)
!203 = !DILocation(line: 135, column: 21, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !74, line: 135, column: 9)
!205 = !DILocation(line: 135, column: 23, scope: !204)
!206 = !DILocation(line: 135, column: 9, scope: !201)
!207 = !DILocation(line: 137, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !74, line: 136, column: 9)
!209 = !DILocation(line: 137, column: 20, scope: !208)
!210 = !DILocation(line: 137, column: 23, scope: !208)
!211 = !DILocation(line: 138, column: 9, scope: !208)
!212 = !DILocation(line: 135, column: 30, scope: !204)
!213 = !DILocation(line: 135, column: 9, scope: !204)
!214 = distinct !{!214, !206, !215, !216}
!215 = !DILocation(line: 138, column: 9, scope: !201)
!216 = !{!"llvm.loop.mustprogress"}
!217 = !DILocation(line: 141, column: 13, scope: !218)
!218 = distinct !DILexicalBlock(scope: !188, file: !74, line: 141, column: 13)
!219 = !DILocation(line: 141, column: 18, scope: !218)
!220 = !DILocation(line: 141, column: 13, scope: !188)
!221 = !DILocation(line: 143, column: 13, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !74, line: 142, column: 9)
!223 = !DILocation(line: 143, column: 20, scope: !222)
!224 = !DILocation(line: 143, column: 26, scope: !222)
!225 = !DILocation(line: 145, column: 19, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !74, line: 145, column: 13)
!227 = !DILocation(line: 145, column: 17, scope: !226)
!228 = !DILocation(line: 145, column: 24, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !74, line: 145, column: 13)
!230 = !DILocation(line: 145, column: 26, scope: !229)
!231 = !DILocation(line: 145, column: 13, scope: !226)
!232 = !DILocation(line: 147, column: 30, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !74, line: 146, column: 13)
!234 = !DILocation(line: 147, column: 37, scope: !233)
!235 = !DILocation(line: 147, column: 17, scope: !233)
!236 = !DILocation(line: 148, column: 13, scope: !233)
!237 = !DILocation(line: 145, column: 33, scope: !229)
!238 = !DILocation(line: 145, column: 13, scope: !229)
!239 = distinct !{!239, !231, !240, !216}
!240 = !DILocation(line: 148, column: 13, scope: !226)
!241 = !DILocation(line: 149, column: 9, scope: !222)
!242 = !DILocation(line: 152, column: 13, scope: !243)
!243 = distinct !DILexicalBlock(scope: !218, file: !74, line: 151, column: 9)
!244 = !DILocation(line: 154, column: 14, scope: !188)
!245 = !DILocation(line: 154, column: 9, scope: !188)
!246 = !DILocation(line: 162, column: 1, scope: !73)
!247 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_good", scope: !74, file: !74, line: 518, type: !75, scopeLine: 519, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!248 = !DILocation(line: 520, column: 5, scope: !247)
!249 = !DILocation(line: 521, column: 5, scope: !247)
!250 = !DILocation(line: 522, column: 5, scope: !247)
!251 = !DILocation(line: 523, column: 5, scope: !247)
!252 = !DILocation(line: 524, column: 1, scope: !247)
!253 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 535, type: !254, scopeLine: 536, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!254 = !DISubroutineType(types: !255)
!255 = !{!65, !65, !256}
!256 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!258 = !DILocalVariable(name: "argc", arg: 1, scope: !253, file: !74, line: 535, type: !65)
!259 = !DILocation(line: 535, column: 14, scope: !253)
!260 = !DILocalVariable(name: "argv", arg: 2, scope: !253, file: !74, line: 535, type: !256)
!261 = !DILocation(line: 535, column: 27, scope: !253)
!262 = !DILocation(line: 538, column: 22, scope: !253)
!263 = !DILocation(line: 538, column: 12, scope: !253)
!264 = !DILocation(line: 538, column: 5, scope: !253)
!265 = !DILocation(line: 540, column: 5, scope: !253)
!266 = !DILocation(line: 541, column: 5, scope: !253)
!267 = !DILocation(line: 542, column: 5, scope: !253)
!268 = !DILocation(line: 545, column: 5, scope: !253)
!269 = !DILocation(line: 546, column: 5, scope: !253)
!270 = !DILocation(line: 547, column: 5, scope: !253)
!271 = !DILocation(line: 549, column: 5, scope: !253)
!272 = distinct !DISubprogram(name: "goodB2G1", scope: !74, file: !74, line: 169, type: !75, scopeLine: 170, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!273 = !DILocalVariable(name: "data", scope: !272, file: !74, line: 171, type: !65)
!274 = !DILocation(line: 171, column: 9, scope: !272)
!275 = !DILocation(line: 173, column: 10, scope: !272)
!276 = !DILocalVariable(name: "recvResult", scope: !277, file: !74, line: 182, type: !65)
!277 = distinct !DILexicalBlock(scope: !272, file: !74, line: 177, column: 5)
!278 = !DILocation(line: 182, column: 13, scope: !277)
!279 = !DILocalVariable(name: "service", scope: !277, file: !74, line: 183, type: !85)
!280 = !DILocation(line: 183, column: 28, scope: !277)
!281 = !DILocalVariable(name: "listenSocket", scope: !277, file: !74, line: 184, type: !65)
!282 = !DILocation(line: 184, column: 16, scope: !277)
!283 = !DILocalVariable(name: "acceptSocket", scope: !277, file: !74, line: 185, type: !65)
!284 = !DILocation(line: 185, column: 16, scope: !277)
!285 = !DILocalVariable(name: "inputBuffer", scope: !277, file: !74, line: 186, type: !60)
!286 = !DILocation(line: 186, column: 14, scope: !277)
!287 = !DILocation(line: 187, column: 9, scope: !277)
!288 = !DILocation(line: 197, column: 28, scope: !289)
!289 = distinct !DILexicalBlock(scope: !277, file: !74, line: 188, column: 9)
!290 = !DILocation(line: 197, column: 26, scope: !289)
!291 = !DILocation(line: 198, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !289, file: !74, line: 198, column: 17)
!293 = !DILocation(line: 198, column: 30, scope: !292)
!294 = !DILocation(line: 198, column: 17, scope: !289)
!295 = !DILocation(line: 200, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !292, file: !74, line: 199, column: 13)
!297 = !DILocation(line: 202, column: 13, scope: !289)
!298 = !DILocation(line: 203, column: 21, scope: !289)
!299 = !DILocation(line: 203, column: 32, scope: !289)
!300 = !DILocation(line: 204, column: 21, scope: !289)
!301 = !DILocation(line: 204, column: 30, scope: !289)
!302 = !DILocation(line: 204, column: 37, scope: !289)
!303 = !DILocation(line: 205, column: 32, scope: !289)
!304 = !DILocation(line: 205, column: 21, scope: !289)
!305 = !DILocation(line: 205, column: 30, scope: !289)
!306 = !DILocation(line: 206, column: 22, scope: !307)
!307 = distinct !DILexicalBlock(scope: !289, file: !74, line: 206, column: 17)
!308 = !DILocation(line: 206, column: 36, scope: !307)
!309 = !DILocation(line: 206, column: 17, scope: !307)
!310 = !DILocation(line: 206, column: 81, scope: !307)
!311 = !DILocation(line: 206, column: 17, scope: !289)
!312 = !DILocation(line: 208, column: 17, scope: !313)
!313 = distinct !DILexicalBlock(scope: !307, file: !74, line: 207, column: 13)
!314 = !DILocation(line: 210, column: 24, scope: !315)
!315 = distinct !DILexicalBlock(scope: !289, file: !74, line: 210, column: 17)
!316 = !DILocation(line: 210, column: 17, scope: !315)
!317 = !DILocation(line: 210, column: 54, scope: !315)
!318 = !DILocation(line: 210, column: 17, scope: !289)
!319 = !DILocation(line: 212, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !315, file: !74, line: 211, column: 13)
!321 = !DILocation(line: 214, column: 35, scope: !289)
!322 = !DILocation(line: 214, column: 28, scope: !289)
!323 = !DILocation(line: 214, column: 26, scope: !289)
!324 = !DILocation(line: 215, column: 17, scope: !325)
!325 = distinct !DILexicalBlock(scope: !289, file: !74, line: 215, column: 17)
!326 = !DILocation(line: 215, column: 30, scope: !325)
!327 = !DILocation(line: 215, column: 17, scope: !289)
!328 = !DILocation(line: 217, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !74, line: 216, column: 13)
!330 = !DILocation(line: 220, column: 31, scope: !289)
!331 = !DILocation(line: 220, column: 45, scope: !289)
!332 = !DILocation(line: 220, column: 26, scope: !289)
!333 = !DILocation(line: 220, column: 24, scope: !289)
!334 = !DILocation(line: 221, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !289, file: !74, line: 221, column: 17)
!336 = !DILocation(line: 221, column: 28, scope: !335)
!337 = !DILocation(line: 221, column: 44, scope: !335)
!338 = !DILocation(line: 221, column: 47, scope: !335)
!339 = !DILocation(line: 221, column: 58, scope: !335)
!340 = !DILocation(line: 221, column: 17, scope: !289)
!341 = !DILocation(line: 223, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !335, file: !74, line: 222, column: 13)
!343 = !DILocation(line: 226, column: 25, scope: !289)
!344 = !DILocation(line: 226, column: 13, scope: !289)
!345 = !DILocation(line: 226, column: 37, scope: !289)
!346 = !DILocation(line: 228, column: 25, scope: !289)
!347 = !DILocation(line: 228, column: 20, scope: !289)
!348 = !DILocation(line: 228, column: 18, scope: !289)
!349 = !DILocation(line: 229, column: 9, scope: !289)
!350 = !DILocation(line: 231, column: 13, scope: !351)
!351 = distinct !DILexicalBlock(scope: !277, file: !74, line: 231, column: 13)
!352 = !DILocation(line: 231, column: 26, scope: !351)
!353 = !DILocation(line: 231, column: 13, scope: !277)
!354 = !DILocation(line: 233, column: 26, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !74, line: 232, column: 9)
!356 = !DILocation(line: 233, column: 13, scope: !355)
!357 = !DILocation(line: 234, column: 9, scope: !355)
!358 = !DILocation(line: 235, column: 13, scope: !359)
!359 = distinct !DILexicalBlock(scope: !277, file: !74, line: 235, column: 13)
!360 = !DILocation(line: 235, column: 26, scope: !359)
!361 = !DILocation(line: 235, column: 13, scope: !277)
!362 = !DILocation(line: 237, column: 26, scope: !363)
!363 = distinct !DILexicalBlock(scope: !359, file: !74, line: 236, column: 9)
!364 = !DILocation(line: 237, column: 13, scope: !363)
!365 = !DILocation(line: 238, column: 9, scope: !363)
!366 = !DILocalVariable(name: "i", scope: !367, file: !74, line: 260, type: !65)
!367 = distinct !DILexicalBlock(scope: !272, file: !74, line: 259, column: 5)
!368 = !DILocation(line: 260, column: 13, scope: !367)
!369 = !DILocalVariable(name: "buffer", scope: !367, file: !74, line: 261, type: !64)
!370 = !DILocation(line: 261, column: 15, scope: !367)
!371 = !DILocation(line: 261, column: 31, scope: !367)
!372 = !DILocation(line: 261, column: 24, scope: !367)
!373 = !DILocation(line: 262, column: 13, scope: !374)
!374 = distinct !DILexicalBlock(scope: !367, file: !74, line: 262, column: 13)
!375 = !DILocation(line: 262, column: 20, scope: !374)
!376 = !DILocation(line: 262, column: 13, scope: !367)
!377 = !DILocation(line: 262, column: 30, scope: !378)
!378 = distinct !DILexicalBlock(scope: !374, file: !74, line: 262, column: 29)
!379 = !DILocation(line: 264, column: 16, scope: !380)
!380 = distinct !DILexicalBlock(scope: !367, file: !74, line: 264, column: 9)
!381 = !DILocation(line: 264, column: 14, scope: !380)
!382 = !DILocation(line: 264, column: 21, scope: !383)
!383 = distinct !DILexicalBlock(scope: !380, file: !74, line: 264, column: 9)
!384 = !DILocation(line: 264, column: 23, scope: !383)
!385 = !DILocation(line: 264, column: 9, scope: !380)
!386 = !DILocation(line: 266, column: 13, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !74, line: 265, column: 9)
!388 = !DILocation(line: 266, column: 20, scope: !387)
!389 = !DILocation(line: 266, column: 23, scope: !387)
!390 = !DILocation(line: 267, column: 9, scope: !387)
!391 = !DILocation(line: 264, column: 30, scope: !383)
!392 = !DILocation(line: 264, column: 9, scope: !383)
!393 = distinct !{!393, !385, !394, !216}
!394 = !DILocation(line: 267, column: 9, scope: !380)
!395 = !DILocation(line: 269, column: 13, scope: !396)
!396 = distinct !DILexicalBlock(scope: !367, file: !74, line: 269, column: 13)
!397 = !DILocation(line: 269, column: 18, scope: !396)
!398 = !DILocation(line: 269, column: 23, scope: !396)
!399 = !DILocation(line: 269, column: 26, scope: !396)
!400 = !DILocation(line: 269, column: 31, scope: !396)
!401 = !DILocation(line: 269, column: 13, scope: !367)
!402 = !DILocation(line: 271, column: 13, scope: !403)
!403 = distinct !DILexicalBlock(scope: !396, file: !74, line: 270, column: 9)
!404 = !DILocation(line: 271, column: 20, scope: !403)
!405 = !DILocation(line: 271, column: 26, scope: !403)
!406 = !DILocation(line: 273, column: 19, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !74, line: 273, column: 13)
!408 = !DILocation(line: 273, column: 17, scope: !407)
!409 = !DILocation(line: 273, column: 24, scope: !410)
!410 = distinct !DILexicalBlock(scope: !407, file: !74, line: 273, column: 13)
!411 = !DILocation(line: 273, column: 26, scope: !410)
!412 = !DILocation(line: 273, column: 13, scope: !407)
!413 = !DILocation(line: 275, column: 30, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !74, line: 274, column: 13)
!415 = !DILocation(line: 275, column: 37, scope: !414)
!416 = !DILocation(line: 275, column: 17, scope: !414)
!417 = !DILocation(line: 276, column: 13, scope: !414)
!418 = !DILocation(line: 273, column: 33, scope: !410)
!419 = !DILocation(line: 273, column: 13, scope: !410)
!420 = distinct !{!420, !412, !421, !216}
!421 = !DILocation(line: 276, column: 13, scope: !407)
!422 = !DILocation(line: 277, column: 9, scope: !403)
!423 = !DILocation(line: 280, column: 13, scope: !424)
!424 = distinct !DILexicalBlock(scope: !396, file: !74, line: 279, column: 9)
!425 = !DILocation(line: 282, column: 14, scope: !367)
!426 = !DILocation(line: 282, column: 9, scope: !367)
!427 = !DILocation(line: 286, column: 1, scope: !272)
!428 = distinct !DISubprogram(name: "goodB2G2", scope: !74, file: !74, line: 289, type: !75, scopeLine: 290, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!429 = !DILocalVariable(name: "data", scope: !428, file: !74, line: 291, type: !65)
!430 = !DILocation(line: 291, column: 9, scope: !428)
!431 = !DILocation(line: 293, column: 10, scope: !428)
!432 = !DILocalVariable(name: "recvResult", scope: !433, file: !74, line: 302, type: !65)
!433 = distinct !DILexicalBlock(scope: !428, file: !74, line: 297, column: 5)
!434 = !DILocation(line: 302, column: 13, scope: !433)
!435 = !DILocalVariable(name: "service", scope: !433, file: !74, line: 303, type: !85)
!436 = !DILocation(line: 303, column: 28, scope: !433)
!437 = !DILocalVariable(name: "listenSocket", scope: !433, file: !74, line: 304, type: !65)
!438 = !DILocation(line: 304, column: 16, scope: !433)
!439 = !DILocalVariable(name: "acceptSocket", scope: !433, file: !74, line: 305, type: !65)
!440 = !DILocation(line: 305, column: 16, scope: !433)
!441 = !DILocalVariable(name: "inputBuffer", scope: !433, file: !74, line: 306, type: !60)
!442 = !DILocation(line: 306, column: 14, scope: !433)
!443 = !DILocation(line: 307, column: 9, scope: !433)
!444 = !DILocation(line: 317, column: 28, scope: !445)
!445 = distinct !DILexicalBlock(scope: !433, file: !74, line: 308, column: 9)
!446 = !DILocation(line: 317, column: 26, scope: !445)
!447 = !DILocation(line: 318, column: 17, scope: !448)
!448 = distinct !DILexicalBlock(scope: !445, file: !74, line: 318, column: 17)
!449 = !DILocation(line: 318, column: 30, scope: !448)
!450 = !DILocation(line: 318, column: 17, scope: !445)
!451 = !DILocation(line: 320, column: 17, scope: !452)
!452 = distinct !DILexicalBlock(scope: !448, file: !74, line: 319, column: 13)
!453 = !DILocation(line: 322, column: 13, scope: !445)
!454 = !DILocation(line: 323, column: 21, scope: !445)
!455 = !DILocation(line: 323, column: 32, scope: !445)
!456 = !DILocation(line: 324, column: 21, scope: !445)
!457 = !DILocation(line: 324, column: 30, scope: !445)
!458 = !DILocation(line: 324, column: 37, scope: !445)
!459 = !DILocation(line: 325, column: 32, scope: !445)
!460 = !DILocation(line: 325, column: 21, scope: !445)
!461 = !DILocation(line: 325, column: 30, scope: !445)
!462 = !DILocation(line: 326, column: 22, scope: !463)
!463 = distinct !DILexicalBlock(scope: !445, file: !74, line: 326, column: 17)
!464 = !DILocation(line: 326, column: 36, scope: !463)
!465 = !DILocation(line: 326, column: 17, scope: !463)
!466 = !DILocation(line: 326, column: 81, scope: !463)
!467 = !DILocation(line: 326, column: 17, scope: !445)
!468 = !DILocation(line: 328, column: 17, scope: !469)
!469 = distinct !DILexicalBlock(scope: !463, file: !74, line: 327, column: 13)
!470 = !DILocation(line: 330, column: 24, scope: !471)
!471 = distinct !DILexicalBlock(scope: !445, file: !74, line: 330, column: 17)
!472 = !DILocation(line: 330, column: 17, scope: !471)
!473 = !DILocation(line: 330, column: 54, scope: !471)
!474 = !DILocation(line: 330, column: 17, scope: !445)
!475 = !DILocation(line: 332, column: 17, scope: !476)
!476 = distinct !DILexicalBlock(scope: !471, file: !74, line: 331, column: 13)
!477 = !DILocation(line: 334, column: 35, scope: !445)
!478 = !DILocation(line: 334, column: 28, scope: !445)
!479 = !DILocation(line: 334, column: 26, scope: !445)
!480 = !DILocation(line: 335, column: 17, scope: !481)
!481 = distinct !DILexicalBlock(scope: !445, file: !74, line: 335, column: 17)
!482 = !DILocation(line: 335, column: 30, scope: !481)
!483 = !DILocation(line: 335, column: 17, scope: !445)
!484 = !DILocation(line: 337, column: 17, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !74, line: 336, column: 13)
!486 = !DILocation(line: 340, column: 31, scope: !445)
!487 = !DILocation(line: 340, column: 45, scope: !445)
!488 = !DILocation(line: 340, column: 26, scope: !445)
!489 = !DILocation(line: 340, column: 24, scope: !445)
!490 = !DILocation(line: 341, column: 17, scope: !491)
!491 = distinct !DILexicalBlock(scope: !445, file: !74, line: 341, column: 17)
!492 = !DILocation(line: 341, column: 28, scope: !491)
!493 = !DILocation(line: 341, column: 44, scope: !491)
!494 = !DILocation(line: 341, column: 47, scope: !491)
!495 = !DILocation(line: 341, column: 58, scope: !491)
!496 = !DILocation(line: 341, column: 17, scope: !445)
!497 = !DILocation(line: 343, column: 17, scope: !498)
!498 = distinct !DILexicalBlock(scope: !491, file: !74, line: 342, column: 13)
!499 = !DILocation(line: 346, column: 25, scope: !445)
!500 = !DILocation(line: 346, column: 13, scope: !445)
!501 = !DILocation(line: 346, column: 37, scope: !445)
!502 = !DILocation(line: 348, column: 25, scope: !445)
!503 = !DILocation(line: 348, column: 20, scope: !445)
!504 = !DILocation(line: 348, column: 18, scope: !445)
!505 = !DILocation(line: 349, column: 9, scope: !445)
!506 = !DILocation(line: 351, column: 13, scope: !507)
!507 = distinct !DILexicalBlock(scope: !433, file: !74, line: 351, column: 13)
!508 = !DILocation(line: 351, column: 26, scope: !507)
!509 = !DILocation(line: 351, column: 13, scope: !433)
!510 = !DILocation(line: 353, column: 26, scope: !511)
!511 = distinct !DILexicalBlock(scope: !507, file: !74, line: 352, column: 9)
!512 = !DILocation(line: 353, column: 13, scope: !511)
!513 = !DILocation(line: 354, column: 9, scope: !511)
!514 = !DILocation(line: 355, column: 13, scope: !515)
!515 = distinct !DILexicalBlock(scope: !433, file: !74, line: 355, column: 13)
!516 = !DILocation(line: 355, column: 26, scope: !515)
!517 = !DILocation(line: 355, column: 13, scope: !433)
!518 = !DILocation(line: 357, column: 26, scope: !519)
!519 = distinct !DILexicalBlock(scope: !515, file: !74, line: 356, column: 9)
!520 = !DILocation(line: 357, column: 13, scope: !519)
!521 = !DILocation(line: 358, column: 9, scope: !519)
!522 = !DILocalVariable(name: "i", scope: !523, file: !74, line: 376, type: !65)
!523 = distinct !DILexicalBlock(scope: !428, file: !74, line: 375, column: 5)
!524 = !DILocation(line: 376, column: 13, scope: !523)
!525 = !DILocalVariable(name: "buffer", scope: !523, file: !74, line: 377, type: !64)
!526 = !DILocation(line: 377, column: 15, scope: !523)
!527 = !DILocation(line: 377, column: 31, scope: !523)
!528 = !DILocation(line: 377, column: 24, scope: !523)
!529 = !DILocation(line: 378, column: 13, scope: !530)
!530 = distinct !DILexicalBlock(scope: !523, file: !74, line: 378, column: 13)
!531 = !DILocation(line: 378, column: 20, scope: !530)
!532 = !DILocation(line: 378, column: 13, scope: !523)
!533 = !DILocation(line: 378, column: 30, scope: !534)
!534 = distinct !DILexicalBlock(scope: !530, file: !74, line: 378, column: 29)
!535 = !DILocation(line: 380, column: 16, scope: !536)
!536 = distinct !DILexicalBlock(scope: !523, file: !74, line: 380, column: 9)
!537 = !DILocation(line: 380, column: 14, scope: !536)
!538 = !DILocation(line: 380, column: 21, scope: !539)
!539 = distinct !DILexicalBlock(scope: !536, file: !74, line: 380, column: 9)
!540 = !DILocation(line: 380, column: 23, scope: !539)
!541 = !DILocation(line: 380, column: 9, scope: !536)
!542 = !DILocation(line: 382, column: 13, scope: !543)
!543 = distinct !DILexicalBlock(scope: !539, file: !74, line: 381, column: 9)
!544 = !DILocation(line: 382, column: 20, scope: !543)
!545 = !DILocation(line: 382, column: 23, scope: !543)
!546 = !DILocation(line: 383, column: 9, scope: !543)
!547 = !DILocation(line: 380, column: 30, scope: !539)
!548 = !DILocation(line: 380, column: 9, scope: !539)
!549 = distinct !{!549, !541, !550, !216}
!550 = !DILocation(line: 383, column: 9, scope: !536)
!551 = !DILocation(line: 385, column: 13, scope: !552)
!552 = distinct !DILexicalBlock(scope: !523, file: !74, line: 385, column: 13)
!553 = !DILocation(line: 385, column: 18, scope: !552)
!554 = !DILocation(line: 385, column: 23, scope: !552)
!555 = !DILocation(line: 385, column: 26, scope: !552)
!556 = !DILocation(line: 385, column: 31, scope: !552)
!557 = !DILocation(line: 385, column: 13, scope: !523)
!558 = !DILocation(line: 387, column: 13, scope: !559)
!559 = distinct !DILexicalBlock(scope: !552, file: !74, line: 386, column: 9)
!560 = !DILocation(line: 387, column: 20, scope: !559)
!561 = !DILocation(line: 387, column: 26, scope: !559)
!562 = !DILocation(line: 389, column: 19, scope: !563)
!563 = distinct !DILexicalBlock(scope: !559, file: !74, line: 389, column: 13)
!564 = !DILocation(line: 389, column: 17, scope: !563)
!565 = !DILocation(line: 389, column: 24, scope: !566)
!566 = distinct !DILexicalBlock(scope: !563, file: !74, line: 389, column: 13)
!567 = !DILocation(line: 389, column: 26, scope: !566)
!568 = !DILocation(line: 389, column: 13, scope: !563)
!569 = !DILocation(line: 391, column: 30, scope: !570)
!570 = distinct !DILexicalBlock(scope: !566, file: !74, line: 390, column: 13)
!571 = !DILocation(line: 391, column: 37, scope: !570)
!572 = !DILocation(line: 391, column: 17, scope: !570)
!573 = !DILocation(line: 392, column: 13, scope: !570)
!574 = !DILocation(line: 389, column: 33, scope: !566)
!575 = !DILocation(line: 389, column: 13, scope: !566)
!576 = distinct !{!576, !568, !577, !216}
!577 = !DILocation(line: 392, column: 13, scope: !563)
!578 = !DILocation(line: 393, column: 9, scope: !559)
!579 = !DILocation(line: 396, column: 13, scope: !580)
!580 = distinct !DILexicalBlock(scope: !552, file: !74, line: 395, column: 9)
!581 = !DILocation(line: 398, column: 14, scope: !523)
!582 = !DILocation(line: 398, column: 9, scope: !523)
!583 = !DILocation(line: 406, column: 1, scope: !428)
!584 = distinct !DISubprogram(name: "goodG2B1", scope: !74, file: !74, line: 409, type: !75, scopeLine: 410, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!585 = !DILocalVariable(name: "data", scope: !584, file: !74, line: 411, type: !65)
!586 = !DILocation(line: 411, column: 9, scope: !584)
!587 = !DILocation(line: 413, column: 10, scope: !584)
!588 = !DILocation(line: 423, column: 14, scope: !584)
!589 = !DILocalVariable(name: "i", scope: !590, file: !74, line: 430, type: !65)
!590 = distinct !DILexicalBlock(scope: !584, file: !74, line: 429, column: 5)
!591 = !DILocation(line: 430, column: 13, scope: !590)
!592 = !DILocalVariable(name: "buffer", scope: !590, file: !74, line: 431, type: !64)
!593 = !DILocation(line: 431, column: 15, scope: !590)
!594 = !DILocation(line: 431, column: 31, scope: !590)
!595 = !DILocation(line: 431, column: 24, scope: !590)
!596 = !DILocation(line: 432, column: 13, scope: !597)
!597 = distinct !DILexicalBlock(scope: !590, file: !74, line: 432, column: 13)
!598 = !DILocation(line: 432, column: 20, scope: !597)
!599 = !DILocation(line: 432, column: 13, scope: !590)
!600 = !DILocation(line: 432, column: 30, scope: !601)
!601 = distinct !DILexicalBlock(scope: !597, file: !74, line: 432, column: 29)
!602 = !DILocation(line: 434, column: 16, scope: !603)
!603 = distinct !DILexicalBlock(scope: !590, file: !74, line: 434, column: 9)
!604 = !DILocation(line: 434, column: 14, scope: !603)
!605 = !DILocation(line: 434, column: 21, scope: !606)
!606 = distinct !DILexicalBlock(scope: !603, file: !74, line: 434, column: 9)
!607 = !DILocation(line: 434, column: 23, scope: !606)
!608 = !DILocation(line: 434, column: 9, scope: !603)
!609 = !DILocation(line: 436, column: 13, scope: !610)
!610 = distinct !DILexicalBlock(scope: !606, file: !74, line: 435, column: 9)
!611 = !DILocation(line: 436, column: 20, scope: !610)
!612 = !DILocation(line: 436, column: 23, scope: !610)
!613 = !DILocation(line: 437, column: 9, scope: !610)
!614 = !DILocation(line: 434, column: 30, scope: !606)
!615 = !DILocation(line: 434, column: 9, scope: !606)
!616 = distinct !{!616, !608, !617, !216}
!617 = !DILocation(line: 437, column: 9, scope: !603)
!618 = !DILocation(line: 440, column: 13, scope: !619)
!619 = distinct !DILexicalBlock(scope: !590, file: !74, line: 440, column: 13)
!620 = !DILocation(line: 440, column: 18, scope: !619)
!621 = !DILocation(line: 440, column: 13, scope: !590)
!622 = !DILocation(line: 442, column: 13, scope: !623)
!623 = distinct !DILexicalBlock(scope: !619, file: !74, line: 441, column: 9)
!624 = !DILocation(line: 442, column: 20, scope: !623)
!625 = !DILocation(line: 442, column: 26, scope: !623)
!626 = !DILocation(line: 444, column: 19, scope: !627)
!627 = distinct !DILexicalBlock(scope: !623, file: !74, line: 444, column: 13)
!628 = !DILocation(line: 444, column: 17, scope: !627)
!629 = !DILocation(line: 444, column: 24, scope: !630)
!630 = distinct !DILexicalBlock(scope: !627, file: !74, line: 444, column: 13)
!631 = !DILocation(line: 444, column: 26, scope: !630)
!632 = !DILocation(line: 444, column: 13, scope: !627)
!633 = !DILocation(line: 446, column: 30, scope: !634)
!634 = distinct !DILexicalBlock(scope: !630, file: !74, line: 445, column: 13)
!635 = !DILocation(line: 446, column: 37, scope: !634)
!636 = !DILocation(line: 446, column: 17, scope: !634)
!637 = !DILocation(line: 447, column: 13, scope: !634)
!638 = !DILocation(line: 444, column: 33, scope: !630)
!639 = !DILocation(line: 444, column: 13, scope: !630)
!640 = distinct !{!640, !632, !641, !216}
!641 = !DILocation(line: 447, column: 13, scope: !627)
!642 = !DILocation(line: 448, column: 9, scope: !623)
!643 = !DILocation(line: 451, column: 13, scope: !644)
!644 = distinct !DILexicalBlock(scope: !619, file: !74, line: 450, column: 9)
!645 = !DILocation(line: 453, column: 14, scope: !590)
!646 = !DILocation(line: 453, column: 9, scope: !590)
!647 = !DILocation(line: 461, column: 1, scope: !584)
!648 = distinct !DISubprogram(name: "goodG2B2", scope: !74, file: !74, line: 464, type: !75, scopeLine: 465, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!649 = !DILocalVariable(name: "data", scope: !648, file: !74, line: 466, type: !65)
!650 = !DILocation(line: 466, column: 9, scope: !648)
!651 = !DILocation(line: 468, column: 10, scope: !648)
!652 = !DILocation(line: 474, column: 14, scope: !648)
!653 = !DILocalVariable(name: "i", scope: !654, file: !74, line: 485, type: !65)
!654 = distinct !DILexicalBlock(scope: !648, file: !74, line: 484, column: 5)
!655 = !DILocation(line: 485, column: 13, scope: !654)
!656 = !DILocalVariable(name: "buffer", scope: !654, file: !74, line: 486, type: !64)
!657 = !DILocation(line: 486, column: 15, scope: !654)
!658 = !DILocation(line: 486, column: 31, scope: !654)
!659 = !DILocation(line: 486, column: 24, scope: !654)
!660 = !DILocation(line: 487, column: 13, scope: !661)
!661 = distinct !DILexicalBlock(scope: !654, file: !74, line: 487, column: 13)
!662 = !DILocation(line: 487, column: 20, scope: !661)
!663 = !DILocation(line: 487, column: 13, scope: !654)
!664 = !DILocation(line: 487, column: 30, scope: !665)
!665 = distinct !DILexicalBlock(scope: !661, file: !74, line: 487, column: 29)
!666 = !DILocation(line: 489, column: 16, scope: !667)
!667 = distinct !DILexicalBlock(scope: !654, file: !74, line: 489, column: 9)
!668 = !DILocation(line: 489, column: 14, scope: !667)
!669 = !DILocation(line: 489, column: 21, scope: !670)
!670 = distinct !DILexicalBlock(scope: !667, file: !74, line: 489, column: 9)
!671 = !DILocation(line: 489, column: 23, scope: !670)
!672 = !DILocation(line: 489, column: 9, scope: !667)
!673 = !DILocation(line: 491, column: 13, scope: !674)
!674 = distinct !DILexicalBlock(scope: !670, file: !74, line: 490, column: 9)
!675 = !DILocation(line: 491, column: 20, scope: !674)
!676 = !DILocation(line: 491, column: 23, scope: !674)
!677 = !DILocation(line: 492, column: 9, scope: !674)
!678 = !DILocation(line: 489, column: 30, scope: !670)
!679 = !DILocation(line: 489, column: 9, scope: !670)
!680 = distinct !{!680, !672, !681, !216}
!681 = !DILocation(line: 492, column: 9, scope: !667)
!682 = !DILocation(line: 495, column: 13, scope: !683)
!683 = distinct !DILexicalBlock(scope: !654, file: !74, line: 495, column: 13)
!684 = !DILocation(line: 495, column: 18, scope: !683)
!685 = !DILocation(line: 495, column: 13, scope: !654)
!686 = !DILocation(line: 497, column: 13, scope: !687)
!687 = distinct !DILexicalBlock(scope: !683, file: !74, line: 496, column: 9)
!688 = !DILocation(line: 497, column: 20, scope: !687)
!689 = !DILocation(line: 497, column: 26, scope: !687)
!690 = !DILocation(line: 499, column: 19, scope: !691)
!691 = distinct !DILexicalBlock(scope: !687, file: !74, line: 499, column: 13)
!692 = !DILocation(line: 499, column: 17, scope: !691)
!693 = !DILocation(line: 499, column: 24, scope: !694)
!694 = distinct !DILexicalBlock(scope: !691, file: !74, line: 499, column: 13)
!695 = !DILocation(line: 499, column: 26, scope: !694)
!696 = !DILocation(line: 499, column: 13, scope: !691)
!697 = !DILocation(line: 501, column: 30, scope: !698)
!698 = distinct !DILexicalBlock(scope: !694, file: !74, line: 500, column: 13)
!699 = !DILocation(line: 501, column: 37, scope: !698)
!700 = !DILocation(line: 501, column: 17, scope: !698)
!701 = !DILocation(line: 502, column: 13, scope: !698)
!702 = !DILocation(line: 499, column: 33, scope: !694)
!703 = !DILocation(line: 499, column: 13, scope: !694)
!704 = distinct !{!704, !696, !705, !216}
!705 = !DILocation(line: 502, column: 13, scope: !691)
!706 = !DILocation(line: 503, column: 9, scope: !687)
!707 = !DILocation(line: 506, column: 13, scope: !708)
!708 = distinct !DILexicalBlock(scope: !683, file: !74, line: 505, column: 9)
!709 = !DILocation(line: 508, column: 14, scope: !654)
!710 = !DILocation(line: 508, column: 9, scope: !654)
!711 = !DILocation(line: 516, column: 1, scope: !648)
