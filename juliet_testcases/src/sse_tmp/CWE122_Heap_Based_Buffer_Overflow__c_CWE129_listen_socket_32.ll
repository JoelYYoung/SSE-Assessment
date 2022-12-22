; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_32.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_32_bad() #0 !dbg !73 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data34 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !80, metadata !DIExpression()), !dbg !81
  store i32* %data, i32** %dataPtr1, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !82, metadata !DIExpression()), !dbg !83
  store i32* %data, i32** %dataPtr2, align 8, !dbg !83
  store i32 -1, i32* %data, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !85, metadata !DIExpression()), !dbg !87
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !88
  %1 = load i32, i32* %0, align 4, !dbg !89
  store i32 %1, i32* %data1, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !93, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %listenSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 -1, i32* %acceptSocket, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  br label %do.body, !dbg !117

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !118
  store i32 %call, i32* %listenSocket, align 4, !dbg !120
  %2 = load i32, i32* %listenSocket, align 4, !dbg !121
  %cmp = icmp eq i32 %2, -1, !dbg !123
  br i1 %cmp, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !125

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !127
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !128
  store i16 2, i16* %sin_family, align 4, !dbg !129
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !130
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !131
  store i32 0, i32* %s_addr, align 4, !dbg !132
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !133
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !134
  store i16 %call2, i16* %sin_port, align 2, !dbg !135
  %4 = load i32, i32* %listenSocket, align 4, !dbg !136
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !138
  %call3 = call i32 @bind(i32 %4, %struct.sockaddr* %5, i32 16) #8, !dbg !139
  %cmp4 = icmp eq i32 %call3, -1, !dbg !140
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !141

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !142

if.end6:                                          ; preds = %if.end
  %6 = load i32, i32* %listenSocket, align 4, !dbg !144
  %call7 = call i32 @listen(i32 %6, i32 5) #8, !dbg !146
  %cmp8 = icmp eq i32 %call7, -1, !dbg !147
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !148

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !149

if.end10:                                         ; preds = %if.end6
  %7 = load i32, i32* %listenSocket, align 4, !dbg !151
  %call11 = call i32 @accept(i32 %7, %struct.sockaddr* null, i32* null), !dbg !152
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !153
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !154
  %cmp12 = icmp eq i32 %8, -1, !dbg !156
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !157

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !158

if.end14:                                         ; preds = %if.end10
  %9 = load i32, i32* %acceptSocket, align 4, !dbg !160
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !161
  %call15 = call i64 @recv(i32 %9, i8* %arraydecay, i64 13, i32 0), !dbg !162
  %conv = trunc i64 %call15 to i32, !dbg !162
  store i32 %conv, i32* %recvResult, align 4, !dbg !163
  %10 = load i32, i32* %recvResult, align 4, !dbg !164
  %cmp16 = icmp eq i32 %10, -1, !dbg !166
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !167

lor.lhs.false:                                    ; preds = %if.end14
  %11 = load i32, i32* %recvResult, align 4, !dbg !168
  %cmp18 = icmp eq i32 %11, 0, !dbg !169
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !170

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !171

if.end21:                                         ; preds = %lor.lhs.false
  %12 = load i32, i32* %recvResult, align 4, !dbg !173
  %idxprom = sext i32 %12 to i64, !dbg !174
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !174
  store i8 0, i8* %arrayidx, align 1, !dbg !175
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !176
  %call23 = call i32 @atoi(i8* %arraydecay22) #10, !dbg !177
  store i32 %call23, i32* %data1, align 4, !dbg !178
  br label %do.end, !dbg !179

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %13 = load i32, i32* %listenSocket, align 4, !dbg !180
  %cmp24 = icmp ne i32 %13, -1, !dbg !182
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !183

if.then26:                                        ; preds = %do.end
  %14 = load i32, i32* %listenSocket, align 4, !dbg !184
  %call27 = call i32 @close(i32 %14), !dbg !186
  br label %if.end28, !dbg !187

if.end28:                                         ; preds = %if.then26, %do.end
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !188
  %cmp29 = icmp ne i32 %15, -1, !dbg !190
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !191

if.then31:                                        ; preds = %if.end28
  %16 = load i32, i32* %acceptSocket, align 4, !dbg !192
  %call32 = call i32 @close(i32 %16), !dbg !194
  br label %if.end33, !dbg !195

if.end33:                                         ; preds = %if.then31, %if.end28
  %17 = load i32, i32* %data1, align 4, !dbg !196
  %18 = load i32*, i32** %dataPtr1, align 8, !dbg !197
  store i32 %17, i32* %18, align 4, !dbg !198
  call void @llvm.dbg.declare(metadata i32* %data34, metadata !199, metadata !DIExpression()), !dbg !201
  %19 = load i32*, i32** %dataPtr2, align 8, !dbg !202
  %20 = load i32, i32* %19, align 4, !dbg !203
  store i32 %20, i32* %data34, align 4, !dbg !201
  call void @llvm.dbg.declare(metadata i32* %i, metadata !204, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !207, metadata !DIExpression()), !dbg !208
  %call35 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !209
  %21 = bitcast i8* %call35 to i32*, !dbg !210
  store i32* %21, i32** %buffer, align 8, !dbg !208
  %22 = load i32*, i32** %buffer, align 8, !dbg !211
  %cmp36 = icmp eq i32* %22, null, !dbg !213
  br i1 %cmp36, label %if.then38, label %if.end39, !dbg !214

if.then38:                                        ; preds = %if.end33
  call void @exit(i32 -1) #11, !dbg !215
  unreachable, !dbg !215

if.end39:                                         ; preds = %if.end33
  store i32 0, i32* %i, align 4, !dbg !217
  br label %for.cond, !dbg !219

for.cond:                                         ; preds = %for.inc, %if.end39
  %23 = load i32, i32* %i, align 4, !dbg !220
  %cmp40 = icmp slt i32 %23, 10, !dbg !222
  br i1 %cmp40, label %for.body, label %for.end, !dbg !223

for.body:                                         ; preds = %for.cond
  %24 = load i32*, i32** %buffer, align 8, !dbg !224
  %25 = load i32, i32* %i, align 4, !dbg !226
  %idxprom42 = sext i32 %25 to i64, !dbg !224
  %arrayidx43 = getelementptr inbounds i32, i32* %24, i64 %idxprom42, !dbg !224
  store i32 0, i32* %arrayidx43, align 4, !dbg !227
  br label %for.inc, !dbg !228

for.inc:                                          ; preds = %for.body
  %26 = load i32, i32* %i, align 4, !dbg !229
  %inc = add nsw i32 %26, 1, !dbg !229
  store i32 %inc, i32* %i, align 4, !dbg !229
  br label %for.cond, !dbg !230, !llvm.loop !231

for.end:                                          ; preds = %for.cond
  %27 = load i32, i32* %data34, align 4, !dbg !234
  %cmp44 = icmp sge i32 %27, 0, !dbg !236
  br i1 %cmp44, label %if.then46, label %if.else, !dbg !237

if.then46:                                        ; preds = %for.end
  %28 = load i32*, i32** %buffer, align 8, !dbg !238
  %29 = load i32, i32* %data34, align 4, !dbg !240
  %idxprom47 = sext i32 %29 to i64, !dbg !238
  %arrayidx48 = getelementptr inbounds i32, i32* %28, i64 %idxprom47, !dbg !238
  store i32 1, i32* %arrayidx48, align 4, !dbg !241
  store i32 0, i32* %i, align 4, !dbg !242
  br label %for.cond49, !dbg !244

for.cond49:                                       ; preds = %for.inc55, %if.then46
  %30 = load i32, i32* %i, align 4, !dbg !245
  %cmp50 = icmp slt i32 %30, 10, !dbg !247
  br i1 %cmp50, label %for.body52, label %for.end57, !dbg !248

for.body52:                                       ; preds = %for.cond49
  %31 = load i32*, i32** %buffer, align 8, !dbg !249
  %32 = load i32, i32* %i, align 4, !dbg !251
  %idxprom53 = sext i32 %32 to i64, !dbg !249
  %arrayidx54 = getelementptr inbounds i32, i32* %31, i64 %idxprom53, !dbg !249
  %33 = load i32, i32* %arrayidx54, align 4, !dbg !249
  call void @printIntLine(i32 %33), !dbg !252
  br label %for.inc55, !dbg !253

for.inc55:                                        ; preds = %for.body52
  %34 = load i32, i32* %i, align 4, !dbg !254
  %inc56 = add nsw i32 %34, 1, !dbg !254
  store i32 %inc56, i32* %i, align 4, !dbg !254
  br label %for.cond49, !dbg !255, !llvm.loop !256

for.end57:                                        ; preds = %for.cond49
  br label %if.end58, !dbg !258

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !259
  br label %if.end58

if.end58:                                         ; preds = %if.else, %for.end57
  %35 = load i32*, i32** %buffer, align 8, !dbg !261
  %36 = bitcast i32* %35 to i8*, !dbg !261
  call void @free(i8* %36) #8, !dbg !262
  ret void, !dbg !263
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_32_good() #0 !dbg !264 {
entry:
  call void @goodG2B(), !dbg !265
  call void @goodB2G(), !dbg !266
  ret void, !dbg !267
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !268 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !273, metadata !DIExpression()), !dbg !274
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !275, metadata !DIExpression()), !dbg !276
  %call = call i64 @time(i64* null) #8, !dbg !277
  %conv = trunc i64 %call to i32, !dbg !278
  call void @srand(i32 %conv) #8, !dbg !279
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !280
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_32_good(), !dbg !281
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !282
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !283
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_32_bad(), !dbg !284
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !285
  ret i32 0, !dbg !286
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !287 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !288, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !290, metadata !DIExpression()), !dbg !291
  store i32* %data, i32** %dataPtr1, align 8, !dbg !291
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !292, metadata !DIExpression()), !dbg !293
  store i32* %data, i32** %dataPtr2, align 8, !dbg !293
  store i32 -1, i32* %data, align 4, !dbg !294
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !295, metadata !DIExpression()), !dbg !297
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !298
  %1 = load i32, i32* %0, align 4, !dbg !299
  store i32 %1, i32* %data1, align 4, !dbg !297
  store i32 7, i32* %data1, align 4, !dbg !300
  %2 = load i32, i32* %data1, align 4, !dbg !301
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !302
  store i32 %2, i32* %3, align 4, !dbg !303
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !304, metadata !DIExpression()), !dbg !306
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !307
  %5 = load i32, i32* %4, align 4, !dbg !308
  store i32 %5, i32* %data2, align 4, !dbg !306
  call void @llvm.dbg.declare(metadata i32* %i, metadata !309, metadata !DIExpression()), !dbg !311
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !312, metadata !DIExpression()), !dbg !313
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !314
  %6 = bitcast i8* %call to i32*, !dbg !315
  store i32* %6, i32** %buffer, align 8, !dbg !313
  %7 = load i32*, i32** %buffer, align 8, !dbg !316
  %cmp = icmp eq i32* %7, null, !dbg !318
  br i1 %cmp, label %if.then, label %if.end, !dbg !319

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !320
  unreachable, !dbg !320

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !322
  br label %for.cond, !dbg !324

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !325
  %cmp3 = icmp slt i32 %8, 10, !dbg !327
  br i1 %cmp3, label %for.body, label %for.end, !dbg !328

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %buffer, align 8, !dbg !329
  %10 = load i32, i32* %i, align 4, !dbg !331
  %idxprom = sext i32 %10 to i64, !dbg !329
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !329
  store i32 0, i32* %arrayidx, align 4, !dbg !332
  br label %for.inc, !dbg !333

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !334
  %inc = add nsw i32 %11, 1, !dbg !334
  store i32 %inc, i32* %i, align 4, !dbg !334
  br label %for.cond, !dbg !335, !llvm.loop !336

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %data2, align 4, !dbg !338
  %cmp4 = icmp sge i32 %12, 0, !dbg !340
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !341

if.then5:                                         ; preds = %for.end
  %13 = load i32*, i32** %buffer, align 8, !dbg !342
  %14 = load i32, i32* %data2, align 4, !dbg !344
  %idxprom6 = sext i32 %14 to i64, !dbg !342
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 %idxprom6, !dbg !342
  store i32 1, i32* %arrayidx7, align 4, !dbg !345
  store i32 0, i32* %i, align 4, !dbg !346
  br label %for.cond8, !dbg !348

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %15 = load i32, i32* %i, align 4, !dbg !349
  %cmp9 = icmp slt i32 %15, 10, !dbg !351
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !352

for.body10:                                       ; preds = %for.cond8
  %16 = load i32*, i32** %buffer, align 8, !dbg !353
  %17 = load i32, i32* %i, align 4, !dbg !355
  %idxprom11 = sext i32 %17 to i64, !dbg !353
  %arrayidx12 = getelementptr inbounds i32, i32* %16, i64 %idxprom11, !dbg !353
  %18 = load i32, i32* %arrayidx12, align 4, !dbg !353
  call void @printIntLine(i32 %18), !dbg !356
  br label %for.inc13, !dbg !357

for.inc13:                                        ; preds = %for.body10
  %19 = load i32, i32* %i, align 4, !dbg !358
  %inc14 = add nsw i32 %19, 1, !dbg !358
  store i32 %inc14, i32* %i, align 4, !dbg !358
  br label %for.cond8, !dbg !359, !llvm.loop !360

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !362

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !363
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %20 = load i32*, i32** %buffer, align 8, !dbg !365
  %21 = bitcast i32* %20 to i8*, !dbg !365
  call void @free(i8* %21) #8, !dbg !366
  ret void, !dbg !367
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !368 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data34 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !369, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !371, metadata !DIExpression()), !dbg !372
  store i32* %data, i32** %dataPtr1, align 8, !dbg !372
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !373, metadata !DIExpression()), !dbg !374
  store i32* %data, i32** %dataPtr2, align 8, !dbg !374
  store i32 -1, i32* %data, align 4, !dbg !375
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !376, metadata !DIExpression()), !dbg !378
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !379
  %1 = load i32, i32* %0, align 4, !dbg !380
  store i32 %1, i32* %data1, align 4, !dbg !378
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !381, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !384, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !386, metadata !DIExpression()), !dbg !387
  store i32 -1, i32* %listenSocket, align 4, !dbg !387
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !388, metadata !DIExpression()), !dbg !389
  store i32 -1, i32* %acceptSocket, align 4, !dbg !389
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !390, metadata !DIExpression()), !dbg !391
  br label %do.body, !dbg !392

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !393
  store i32 %call, i32* %listenSocket, align 4, !dbg !395
  %2 = load i32, i32* %listenSocket, align 4, !dbg !396
  %cmp = icmp eq i32 %2, -1, !dbg !398
  br i1 %cmp, label %if.then, label %if.end, !dbg !399

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !400

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !402
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !402
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !403
  store i16 2, i16* %sin_family, align 4, !dbg !404
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !405
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !406
  store i32 0, i32* %s_addr, align 4, !dbg !407
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !408
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !409
  store i16 %call2, i16* %sin_port, align 2, !dbg !410
  %4 = load i32, i32* %listenSocket, align 4, !dbg !411
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !413
  %call3 = call i32 @bind(i32 %4, %struct.sockaddr* %5, i32 16) #8, !dbg !414
  %cmp4 = icmp eq i32 %call3, -1, !dbg !415
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !416

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !417

if.end6:                                          ; preds = %if.end
  %6 = load i32, i32* %listenSocket, align 4, !dbg !419
  %call7 = call i32 @listen(i32 %6, i32 5) #8, !dbg !421
  %cmp8 = icmp eq i32 %call7, -1, !dbg !422
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !423

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !424

if.end10:                                         ; preds = %if.end6
  %7 = load i32, i32* %listenSocket, align 4, !dbg !426
  %call11 = call i32 @accept(i32 %7, %struct.sockaddr* null, i32* null), !dbg !427
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !428
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !429
  %cmp12 = icmp eq i32 %8, -1, !dbg !431
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !432

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !433

if.end14:                                         ; preds = %if.end10
  %9 = load i32, i32* %acceptSocket, align 4, !dbg !435
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !436
  %call15 = call i64 @recv(i32 %9, i8* %arraydecay, i64 13, i32 0), !dbg !437
  %conv = trunc i64 %call15 to i32, !dbg !437
  store i32 %conv, i32* %recvResult, align 4, !dbg !438
  %10 = load i32, i32* %recvResult, align 4, !dbg !439
  %cmp16 = icmp eq i32 %10, -1, !dbg !441
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !442

lor.lhs.false:                                    ; preds = %if.end14
  %11 = load i32, i32* %recvResult, align 4, !dbg !443
  %cmp18 = icmp eq i32 %11, 0, !dbg !444
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !445

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !446

if.end21:                                         ; preds = %lor.lhs.false
  %12 = load i32, i32* %recvResult, align 4, !dbg !448
  %idxprom = sext i32 %12 to i64, !dbg !449
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !449
  store i8 0, i8* %arrayidx, align 1, !dbg !450
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !451
  %call23 = call i32 @atoi(i8* %arraydecay22) #10, !dbg !452
  store i32 %call23, i32* %data1, align 4, !dbg !453
  br label %do.end, !dbg !454

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %13 = load i32, i32* %listenSocket, align 4, !dbg !455
  %cmp24 = icmp ne i32 %13, -1, !dbg !457
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !458

if.then26:                                        ; preds = %do.end
  %14 = load i32, i32* %listenSocket, align 4, !dbg !459
  %call27 = call i32 @close(i32 %14), !dbg !461
  br label %if.end28, !dbg !462

if.end28:                                         ; preds = %if.then26, %do.end
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !463
  %cmp29 = icmp ne i32 %15, -1, !dbg !465
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !466

if.then31:                                        ; preds = %if.end28
  %16 = load i32, i32* %acceptSocket, align 4, !dbg !467
  %call32 = call i32 @close(i32 %16), !dbg !469
  br label %if.end33, !dbg !470

if.end33:                                         ; preds = %if.then31, %if.end28
  %17 = load i32, i32* %data1, align 4, !dbg !471
  %18 = load i32*, i32** %dataPtr1, align 8, !dbg !472
  store i32 %17, i32* %18, align 4, !dbg !473
  call void @llvm.dbg.declare(metadata i32* %data34, metadata !474, metadata !DIExpression()), !dbg !476
  %19 = load i32*, i32** %dataPtr2, align 8, !dbg !477
  %20 = load i32, i32* %19, align 4, !dbg !478
  store i32 %20, i32* %data34, align 4, !dbg !476
  call void @llvm.dbg.declare(metadata i32* %i, metadata !479, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !482, metadata !DIExpression()), !dbg !483
  %call35 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !484
  %21 = bitcast i8* %call35 to i32*, !dbg !485
  store i32* %21, i32** %buffer, align 8, !dbg !483
  %22 = load i32*, i32** %buffer, align 8, !dbg !486
  %cmp36 = icmp eq i32* %22, null, !dbg !488
  br i1 %cmp36, label %if.then38, label %if.end39, !dbg !489

if.then38:                                        ; preds = %if.end33
  call void @exit(i32 -1) #11, !dbg !490
  unreachable, !dbg !490

if.end39:                                         ; preds = %if.end33
  store i32 0, i32* %i, align 4, !dbg !492
  br label %for.cond, !dbg !494

for.cond:                                         ; preds = %for.inc, %if.end39
  %23 = load i32, i32* %i, align 4, !dbg !495
  %cmp40 = icmp slt i32 %23, 10, !dbg !497
  br i1 %cmp40, label %for.body, label %for.end, !dbg !498

for.body:                                         ; preds = %for.cond
  %24 = load i32*, i32** %buffer, align 8, !dbg !499
  %25 = load i32, i32* %i, align 4, !dbg !501
  %idxprom42 = sext i32 %25 to i64, !dbg !499
  %arrayidx43 = getelementptr inbounds i32, i32* %24, i64 %idxprom42, !dbg !499
  store i32 0, i32* %arrayidx43, align 4, !dbg !502
  br label %for.inc, !dbg !503

for.inc:                                          ; preds = %for.body
  %26 = load i32, i32* %i, align 4, !dbg !504
  %inc = add nsw i32 %26, 1, !dbg !504
  store i32 %inc, i32* %i, align 4, !dbg !504
  br label %for.cond, !dbg !505, !llvm.loop !506

for.end:                                          ; preds = %for.cond
  %27 = load i32, i32* %data34, align 4, !dbg !508
  %cmp44 = icmp sge i32 %27, 0, !dbg !510
  br i1 %cmp44, label %land.lhs.true, label %if.else, !dbg !511

land.lhs.true:                                    ; preds = %for.end
  %28 = load i32, i32* %data34, align 4, !dbg !512
  %cmp46 = icmp slt i32 %28, 10, !dbg !513
  br i1 %cmp46, label %if.then48, label %if.else, !dbg !514

if.then48:                                        ; preds = %land.lhs.true
  %29 = load i32*, i32** %buffer, align 8, !dbg !515
  %30 = load i32, i32* %data34, align 4, !dbg !517
  %idxprom49 = sext i32 %30 to i64, !dbg !515
  %arrayidx50 = getelementptr inbounds i32, i32* %29, i64 %idxprom49, !dbg !515
  store i32 1, i32* %arrayidx50, align 4, !dbg !518
  store i32 0, i32* %i, align 4, !dbg !519
  br label %for.cond51, !dbg !521

for.cond51:                                       ; preds = %for.inc57, %if.then48
  %31 = load i32, i32* %i, align 4, !dbg !522
  %cmp52 = icmp slt i32 %31, 10, !dbg !524
  br i1 %cmp52, label %for.body54, label %for.end59, !dbg !525

for.body54:                                       ; preds = %for.cond51
  %32 = load i32*, i32** %buffer, align 8, !dbg !526
  %33 = load i32, i32* %i, align 4, !dbg !528
  %idxprom55 = sext i32 %33 to i64, !dbg !526
  %arrayidx56 = getelementptr inbounds i32, i32* %32, i64 %idxprom55, !dbg !526
  %34 = load i32, i32* %arrayidx56, align 4, !dbg !526
  call void @printIntLine(i32 %34), !dbg !529
  br label %for.inc57, !dbg !530

for.inc57:                                        ; preds = %for.body54
  %35 = load i32, i32* %i, align 4, !dbg !531
  %inc58 = add nsw i32 %35, 1, !dbg !531
  store i32 %inc58, i32* %i, align 4, !dbg !531
  br label %for.cond51, !dbg !532, !llvm.loop !533

for.end59:                                        ; preds = %for.cond51
  br label %if.end60, !dbg !535

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !536
  br label %if.end60

if.end60:                                         ; preds = %if.else, %for.end59
  %36 = load i32*, i32** %buffer, align 8, !dbg !538
  %37 = bitcast i32* %36 to i8*, !dbg !538
  call void @free(i8* %37) #8, !dbg !539
  ret void, !dbg !540
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_32.c", directory: "/root/SSE-Assessment")
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
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_32_bad", scope: !74, file: !74, line: 44, type: !75, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_32.c", directory: "/root/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 46, type: !65)
!79 = !DILocation(line: 46, column: 9, scope: !73)
!80 = !DILocalVariable(name: "dataPtr1", scope: !73, file: !74, line: 47, type: !64)
!81 = !DILocation(line: 47, column: 10, scope: !73)
!82 = !DILocalVariable(name: "dataPtr2", scope: !73, file: !74, line: 48, type: !64)
!83 = !DILocation(line: 48, column: 10, scope: !73)
!84 = !DILocation(line: 50, column: 10, scope: !73)
!85 = !DILocalVariable(name: "data", scope: !86, file: !74, line: 52, type: !65)
!86 = distinct !DILexicalBlock(scope: !73, file: !74, line: 51, column: 5)
!87 = !DILocation(line: 52, column: 13, scope: !86)
!88 = !DILocation(line: 52, column: 21, scope: !86)
!89 = !DILocation(line: 52, column: 20, scope: !86)
!90 = !DILocalVariable(name: "recvResult", scope: !91, file: !74, line: 58, type: !65)
!91 = distinct !DILexicalBlock(scope: !86, file: !74, line: 53, column: 9)
!92 = !DILocation(line: 58, column: 17, scope: !91)
!93 = !DILocalVariable(name: "service", scope: !91, file: !74, line: 59, type: !94)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !95)
!95 = !{!96, !97, !101, !105}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !94, file: !17, line: 239, baseType: !56, size: 16)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !94, file: !17, line: 240, baseType: !98, size: 16, offset: 16)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !94, file: !17, line: 241, baseType: !102, size: 32, offset: 32)
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !103)
!103 = !{!104}
!104 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !102, file: !17, line: 33, baseType: !46, size: 32)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !94, file: !17, line: 244, baseType: !106, size: 64, offset: 64)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 64, elements: !108)
!107 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!108 = !{!109}
!109 = !DISubrange(count: 8)
!110 = !DILocation(line: 59, column: 32, scope: !91)
!111 = !DILocalVariable(name: "listenSocket", scope: !91, file: !74, line: 60, type: !65)
!112 = !DILocation(line: 60, column: 20, scope: !91)
!113 = !DILocalVariable(name: "acceptSocket", scope: !91, file: !74, line: 61, type: !65)
!114 = !DILocation(line: 61, column: 20, scope: !91)
!115 = !DILocalVariable(name: "inputBuffer", scope: !91, file: !74, line: 62, type: !60)
!116 = !DILocation(line: 62, column: 18, scope: !91)
!117 = !DILocation(line: 63, column: 13, scope: !91)
!118 = !DILocation(line: 73, column: 32, scope: !119)
!119 = distinct !DILexicalBlock(scope: !91, file: !74, line: 64, column: 13)
!120 = !DILocation(line: 73, column: 30, scope: !119)
!121 = !DILocation(line: 74, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !74, line: 74, column: 21)
!123 = !DILocation(line: 74, column: 34, scope: !122)
!124 = !DILocation(line: 74, column: 21, scope: !119)
!125 = !DILocation(line: 76, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !74, line: 75, column: 17)
!127 = !DILocation(line: 78, column: 17, scope: !119)
!128 = !DILocation(line: 79, column: 25, scope: !119)
!129 = !DILocation(line: 79, column: 36, scope: !119)
!130 = !DILocation(line: 80, column: 25, scope: !119)
!131 = !DILocation(line: 80, column: 34, scope: !119)
!132 = !DILocation(line: 80, column: 41, scope: !119)
!133 = !DILocation(line: 81, column: 36, scope: !119)
!134 = !DILocation(line: 81, column: 25, scope: !119)
!135 = !DILocation(line: 81, column: 34, scope: !119)
!136 = !DILocation(line: 82, column: 26, scope: !137)
!137 = distinct !DILexicalBlock(scope: !119, file: !74, line: 82, column: 21)
!138 = !DILocation(line: 82, column: 40, scope: !137)
!139 = !DILocation(line: 82, column: 21, scope: !137)
!140 = !DILocation(line: 82, column: 85, scope: !137)
!141 = !DILocation(line: 82, column: 21, scope: !119)
!142 = !DILocation(line: 84, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !74, line: 83, column: 17)
!144 = !DILocation(line: 86, column: 28, scope: !145)
!145 = distinct !DILexicalBlock(scope: !119, file: !74, line: 86, column: 21)
!146 = !DILocation(line: 86, column: 21, scope: !145)
!147 = !DILocation(line: 86, column: 58, scope: !145)
!148 = !DILocation(line: 86, column: 21, scope: !119)
!149 = !DILocation(line: 88, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !74, line: 87, column: 17)
!151 = !DILocation(line: 90, column: 39, scope: !119)
!152 = !DILocation(line: 90, column: 32, scope: !119)
!153 = !DILocation(line: 90, column: 30, scope: !119)
!154 = !DILocation(line: 91, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !119, file: !74, line: 91, column: 21)
!156 = !DILocation(line: 91, column: 34, scope: !155)
!157 = !DILocation(line: 91, column: 21, scope: !119)
!158 = !DILocation(line: 93, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !74, line: 92, column: 17)
!160 = !DILocation(line: 96, column: 35, scope: !119)
!161 = !DILocation(line: 96, column: 49, scope: !119)
!162 = !DILocation(line: 96, column: 30, scope: !119)
!163 = !DILocation(line: 96, column: 28, scope: !119)
!164 = !DILocation(line: 97, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !119, file: !74, line: 97, column: 21)
!166 = !DILocation(line: 97, column: 32, scope: !165)
!167 = !DILocation(line: 97, column: 48, scope: !165)
!168 = !DILocation(line: 97, column: 51, scope: !165)
!169 = !DILocation(line: 97, column: 62, scope: !165)
!170 = !DILocation(line: 97, column: 21, scope: !119)
!171 = !DILocation(line: 99, column: 21, scope: !172)
!172 = distinct !DILexicalBlock(scope: !165, file: !74, line: 98, column: 17)
!173 = !DILocation(line: 102, column: 29, scope: !119)
!174 = !DILocation(line: 102, column: 17, scope: !119)
!175 = !DILocation(line: 102, column: 41, scope: !119)
!176 = !DILocation(line: 104, column: 29, scope: !119)
!177 = !DILocation(line: 104, column: 24, scope: !119)
!178 = !DILocation(line: 104, column: 22, scope: !119)
!179 = !DILocation(line: 105, column: 13, scope: !119)
!180 = !DILocation(line: 107, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !91, file: !74, line: 107, column: 17)
!182 = !DILocation(line: 107, column: 30, scope: !181)
!183 = !DILocation(line: 107, column: 17, scope: !91)
!184 = !DILocation(line: 109, column: 30, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !74, line: 108, column: 13)
!186 = !DILocation(line: 109, column: 17, scope: !185)
!187 = !DILocation(line: 110, column: 13, scope: !185)
!188 = !DILocation(line: 111, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !91, file: !74, line: 111, column: 17)
!190 = !DILocation(line: 111, column: 30, scope: !189)
!191 = !DILocation(line: 111, column: 17, scope: !91)
!192 = !DILocation(line: 113, column: 30, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !74, line: 112, column: 13)
!194 = !DILocation(line: 113, column: 17, scope: !193)
!195 = !DILocation(line: 114, column: 13, scope: !193)
!196 = !DILocation(line: 122, column: 21, scope: !86)
!197 = !DILocation(line: 122, column: 10, scope: !86)
!198 = !DILocation(line: 122, column: 19, scope: !86)
!199 = !DILocalVariable(name: "data", scope: !200, file: !74, line: 125, type: !65)
!200 = distinct !DILexicalBlock(scope: !73, file: !74, line: 124, column: 5)
!201 = !DILocation(line: 125, column: 13, scope: !200)
!202 = !DILocation(line: 125, column: 21, scope: !200)
!203 = !DILocation(line: 125, column: 20, scope: !200)
!204 = !DILocalVariable(name: "i", scope: !205, file: !74, line: 127, type: !65)
!205 = distinct !DILexicalBlock(scope: !200, file: !74, line: 126, column: 9)
!206 = !DILocation(line: 127, column: 17, scope: !205)
!207 = !DILocalVariable(name: "buffer", scope: !205, file: !74, line: 128, type: !64)
!208 = !DILocation(line: 128, column: 19, scope: !205)
!209 = !DILocation(line: 128, column: 35, scope: !205)
!210 = !DILocation(line: 128, column: 28, scope: !205)
!211 = !DILocation(line: 129, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !205, file: !74, line: 129, column: 17)
!213 = !DILocation(line: 129, column: 24, scope: !212)
!214 = !DILocation(line: 129, column: 17, scope: !205)
!215 = !DILocation(line: 129, column: 34, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !74, line: 129, column: 33)
!217 = !DILocation(line: 131, column: 20, scope: !218)
!218 = distinct !DILexicalBlock(scope: !205, file: !74, line: 131, column: 13)
!219 = !DILocation(line: 131, column: 18, scope: !218)
!220 = !DILocation(line: 131, column: 25, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !74, line: 131, column: 13)
!222 = !DILocation(line: 131, column: 27, scope: !221)
!223 = !DILocation(line: 131, column: 13, scope: !218)
!224 = !DILocation(line: 133, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !74, line: 132, column: 13)
!226 = !DILocation(line: 133, column: 24, scope: !225)
!227 = !DILocation(line: 133, column: 27, scope: !225)
!228 = !DILocation(line: 134, column: 13, scope: !225)
!229 = !DILocation(line: 131, column: 34, scope: !221)
!230 = !DILocation(line: 131, column: 13, scope: !221)
!231 = distinct !{!231, !223, !232, !233}
!232 = !DILocation(line: 134, column: 13, scope: !218)
!233 = !{!"llvm.loop.mustprogress"}
!234 = !DILocation(line: 137, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !205, file: !74, line: 137, column: 17)
!236 = !DILocation(line: 137, column: 22, scope: !235)
!237 = !DILocation(line: 137, column: 17, scope: !205)
!238 = !DILocation(line: 139, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !74, line: 138, column: 13)
!240 = !DILocation(line: 139, column: 24, scope: !239)
!241 = !DILocation(line: 139, column: 30, scope: !239)
!242 = !DILocation(line: 141, column: 23, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !74, line: 141, column: 17)
!244 = !DILocation(line: 141, column: 21, scope: !243)
!245 = !DILocation(line: 141, column: 28, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !74, line: 141, column: 17)
!247 = !DILocation(line: 141, column: 30, scope: !246)
!248 = !DILocation(line: 141, column: 17, scope: !243)
!249 = !DILocation(line: 143, column: 34, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !74, line: 142, column: 17)
!251 = !DILocation(line: 143, column: 41, scope: !250)
!252 = !DILocation(line: 143, column: 21, scope: !250)
!253 = !DILocation(line: 144, column: 17, scope: !250)
!254 = !DILocation(line: 141, column: 37, scope: !246)
!255 = !DILocation(line: 141, column: 17, scope: !246)
!256 = distinct !{!256, !248, !257, !233}
!257 = !DILocation(line: 144, column: 17, scope: !243)
!258 = !DILocation(line: 145, column: 13, scope: !239)
!259 = !DILocation(line: 148, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !235, file: !74, line: 147, column: 13)
!261 = !DILocation(line: 150, column: 18, scope: !205)
!262 = !DILocation(line: 150, column: 13, scope: !205)
!263 = !DILocation(line: 153, column: 1, scope: !73)
!264 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_32_good", scope: !74, file: !74, line: 316, type: !75, scopeLine: 317, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!265 = !DILocation(line: 318, column: 5, scope: !264)
!266 = !DILocation(line: 319, column: 5, scope: !264)
!267 = !DILocation(line: 320, column: 1, scope: !264)
!268 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 330, type: !269, scopeLine: 331, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!269 = !DISubroutineType(types: !270)
!270 = !{!65, !65, !271}
!271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!273 = !DILocalVariable(name: "argc", arg: 1, scope: !268, file: !74, line: 330, type: !65)
!274 = !DILocation(line: 330, column: 14, scope: !268)
!275 = !DILocalVariable(name: "argv", arg: 2, scope: !268, file: !74, line: 330, type: !271)
!276 = !DILocation(line: 330, column: 27, scope: !268)
!277 = !DILocation(line: 333, column: 22, scope: !268)
!278 = !DILocation(line: 333, column: 12, scope: !268)
!279 = !DILocation(line: 333, column: 5, scope: !268)
!280 = !DILocation(line: 335, column: 5, scope: !268)
!281 = !DILocation(line: 336, column: 5, scope: !268)
!282 = !DILocation(line: 337, column: 5, scope: !268)
!283 = !DILocation(line: 340, column: 5, scope: !268)
!284 = !DILocation(line: 341, column: 5, scope: !268)
!285 = !DILocation(line: 342, column: 5, scope: !268)
!286 = !DILocation(line: 344, column: 5, scope: !268)
!287 = distinct !DISubprogram(name: "goodG2B", scope: !74, file: !74, line: 160, type: !75, scopeLine: 161, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!288 = !DILocalVariable(name: "data", scope: !287, file: !74, line: 162, type: !65)
!289 = !DILocation(line: 162, column: 9, scope: !287)
!290 = !DILocalVariable(name: "dataPtr1", scope: !287, file: !74, line: 163, type: !64)
!291 = !DILocation(line: 163, column: 10, scope: !287)
!292 = !DILocalVariable(name: "dataPtr2", scope: !287, file: !74, line: 164, type: !64)
!293 = !DILocation(line: 164, column: 10, scope: !287)
!294 = !DILocation(line: 166, column: 10, scope: !287)
!295 = !DILocalVariable(name: "data", scope: !296, file: !74, line: 168, type: !65)
!296 = distinct !DILexicalBlock(scope: !287, file: !74, line: 167, column: 5)
!297 = !DILocation(line: 168, column: 13, scope: !296)
!298 = !DILocation(line: 168, column: 21, scope: !296)
!299 = !DILocation(line: 168, column: 20, scope: !296)
!300 = !DILocation(line: 171, column: 14, scope: !296)
!301 = !DILocation(line: 172, column: 21, scope: !296)
!302 = !DILocation(line: 172, column: 10, scope: !296)
!303 = !DILocation(line: 172, column: 19, scope: !296)
!304 = !DILocalVariable(name: "data", scope: !305, file: !74, line: 175, type: !65)
!305 = distinct !DILexicalBlock(scope: !287, file: !74, line: 174, column: 5)
!306 = !DILocation(line: 175, column: 13, scope: !305)
!307 = !DILocation(line: 175, column: 21, scope: !305)
!308 = !DILocation(line: 175, column: 20, scope: !305)
!309 = !DILocalVariable(name: "i", scope: !310, file: !74, line: 177, type: !65)
!310 = distinct !DILexicalBlock(scope: !305, file: !74, line: 176, column: 9)
!311 = !DILocation(line: 177, column: 17, scope: !310)
!312 = !DILocalVariable(name: "buffer", scope: !310, file: !74, line: 178, type: !64)
!313 = !DILocation(line: 178, column: 19, scope: !310)
!314 = !DILocation(line: 178, column: 35, scope: !310)
!315 = !DILocation(line: 178, column: 28, scope: !310)
!316 = !DILocation(line: 179, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !310, file: !74, line: 179, column: 17)
!318 = !DILocation(line: 179, column: 24, scope: !317)
!319 = !DILocation(line: 179, column: 17, scope: !310)
!320 = !DILocation(line: 179, column: 34, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !74, line: 179, column: 33)
!322 = !DILocation(line: 181, column: 20, scope: !323)
!323 = distinct !DILexicalBlock(scope: !310, file: !74, line: 181, column: 13)
!324 = !DILocation(line: 181, column: 18, scope: !323)
!325 = !DILocation(line: 181, column: 25, scope: !326)
!326 = distinct !DILexicalBlock(scope: !323, file: !74, line: 181, column: 13)
!327 = !DILocation(line: 181, column: 27, scope: !326)
!328 = !DILocation(line: 181, column: 13, scope: !323)
!329 = !DILocation(line: 183, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !74, line: 182, column: 13)
!331 = !DILocation(line: 183, column: 24, scope: !330)
!332 = !DILocation(line: 183, column: 27, scope: !330)
!333 = !DILocation(line: 184, column: 13, scope: !330)
!334 = !DILocation(line: 181, column: 34, scope: !326)
!335 = !DILocation(line: 181, column: 13, scope: !326)
!336 = distinct !{!336, !328, !337, !233}
!337 = !DILocation(line: 184, column: 13, scope: !323)
!338 = !DILocation(line: 187, column: 17, scope: !339)
!339 = distinct !DILexicalBlock(scope: !310, file: !74, line: 187, column: 17)
!340 = !DILocation(line: 187, column: 22, scope: !339)
!341 = !DILocation(line: 187, column: 17, scope: !310)
!342 = !DILocation(line: 189, column: 17, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !74, line: 188, column: 13)
!344 = !DILocation(line: 189, column: 24, scope: !343)
!345 = !DILocation(line: 189, column: 30, scope: !343)
!346 = !DILocation(line: 191, column: 23, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !74, line: 191, column: 17)
!348 = !DILocation(line: 191, column: 21, scope: !347)
!349 = !DILocation(line: 191, column: 28, scope: !350)
!350 = distinct !DILexicalBlock(scope: !347, file: !74, line: 191, column: 17)
!351 = !DILocation(line: 191, column: 30, scope: !350)
!352 = !DILocation(line: 191, column: 17, scope: !347)
!353 = !DILocation(line: 193, column: 34, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !74, line: 192, column: 17)
!355 = !DILocation(line: 193, column: 41, scope: !354)
!356 = !DILocation(line: 193, column: 21, scope: !354)
!357 = !DILocation(line: 194, column: 17, scope: !354)
!358 = !DILocation(line: 191, column: 37, scope: !350)
!359 = !DILocation(line: 191, column: 17, scope: !350)
!360 = distinct !{!360, !352, !361, !233}
!361 = !DILocation(line: 194, column: 17, scope: !347)
!362 = !DILocation(line: 195, column: 13, scope: !343)
!363 = !DILocation(line: 198, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !339, file: !74, line: 197, column: 13)
!365 = !DILocation(line: 200, column: 18, scope: !310)
!366 = !DILocation(line: 200, column: 13, scope: !310)
!367 = !DILocation(line: 203, column: 1, scope: !287)
!368 = distinct !DISubprogram(name: "goodB2G", scope: !74, file: !74, line: 206, type: !75, scopeLine: 207, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!369 = !DILocalVariable(name: "data", scope: !368, file: !74, line: 208, type: !65)
!370 = !DILocation(line: 208, column: 9, scope: !368)
!371 = !DILocalVariable(name: "dataPtr1", scope: !368, file: !74, line: 209, type: !64)
!372 = !DILocation(line: 209, column: 10, scope: !368)
!373 = !DILocalVariable(name: "dataPtr2", scope: !368, file: !74, line: 210, type: !64)
!374 = !DILocation(line: 210, column: 10, scope: !368)
!375 = !DILocation(line: 212, column: 10, scope: !368)
!376 = !DILocalVariable(name: "data", scope: !377, file: !74, line: 214, type: !65)
!377 = distinct !DILexicalBlock(scope: !368, file: !74, line: 213, column: 5)
!378 = !DILocation(line: 214, column: 13, scope: !377)
!379 = !DILocation(line: 214, column: 21, scope: !377)
!380 = !DILocation(line: 214, column: 20, scope: !377)
!381 = !DILocalVariable(name: "recvResult", scope: !382, file: !74, line: 220, type: !65)
!382 = distinct !DILexicalBlock(scope: !377, file: !74, line: 215, column: 9)
!383 = !DILocation(line: 220, column: 17, scope: !382)
!384 = !DILocalVariable(name: "service", scope: !382, file: !74, line: 221, type: !94)
!385 = !DILocation(line: 221, column: 32, scope: !382)
!386 = !DILocalVariable(name: "listenSocket", scope: !382, file: !74, line: 222, type: !65)
!387 = !DILocation(line: 222, column: 20, scope: !382)
!388 = !DILocalVariable(name: "acceptSocket", scope: !382, file: !74, line: 223, type: !65)
!389 = !DILocation(line: 223, column: 20, scope: !382)
!390 = !DILocalVariable(name: "inputBuffer", scope: !382, file: !74, line: 224, type: !60)
!391 = !DILocation(line: 224, column: 18, scope: !382)
!392 = !DILocation(line: 225, column: 13, scope: !382)
!393 = !DILocation(line: 235, column: 32, scope: !394)
!394 = distinct !DILexicalBlock(scope: !382, file: !74, line: 226, column: 13)
!395 = !DILocation(line: 235, column: 30, scope: !394)
!396 = !DILocation(line: 236, column: 21, scope: !397)
!397 = distinct !DILexicalBlock(scope: !394, file: !74, line: 236, column: 21)
!398 = !DILocation(line: 236, column: 34, scope: !397)
!399 = !DILocation(line: 236, column: 21, scope: !394)
!400 = !DILocation(line: 238, column: 21, scope: !401)
!401 = distinct !DILexicalBlock(scope: !397, file: !74, line: 237, column: 17)
!402 = !DILocation(line: 240, column: 17, scope: !394)
!403 = !DILocation(line: 241, column: 25, scope: !394)
!404 = !DILocation(line: 241, column: 36, scope: !394)
!405 = !DILocation(line: 242, column: 25, scope: !394)
!406 = !DILocation(line: 242, column: 34, scope: !394)
!407 = !DILocation(line: 242, column: 41, scope: !394)
!408 = !DILocation(line: 243, column: 36, scope: !394)
!409 = !DILocation(line: 243, column: 25, scope: !394)
!410 = !DILocation(line: 243, column: 34, scope: !394)
!411 = !DILocation(line: 244, column: 26, scope: !412)
!412 = distinct !DILexicalBlock(scope: !394, file: !74, line: 244, column: 21)
!413 = !DILocation(line: 244, column: 40, scope: !412)
!414 = !DILocation(line: 244, column: 21, scope: !412)
!415 = !DILocation(line: 244, column: 85, scope: !412)
!416 = !DILocation(line: 244, column: 21, scope: !394)
!417 = !DILocation(line: 246, column: 21, scope: !418)
!418 = distinct !DILexicalBlock(scope: !412, file: !74, line: 245, column: 17)
!419 = !DILocation(line: 248, column: 28, scope: !420)
!420 = distinct !DILexicalBlock(scope: !394, file: !74, line: 248, column: 21)
!421 = !DILocation(line: 248, column: 21, scope: !420)
!422 = !DILocation(line: 248, column: 58, scope: !420)
!423 = !DILocation(line: 248, column: 21, scope: !394)
!424 = !DILocation(line: 250, column: 21, scope: !425)
!425 = distinct !DILexicalBlock(scope: !420, file: !74, line: 249, column: 17)
!426 = !DILocation(line: 252, column: 39, scope: !394)
!427 = !DILocation(line: 252, column: 32, scope: !394)
!428 = !DILocation(line: 252, column: 30, scope: !394)
!429 = !DILocation(line: 253, column: 21, scope: !430)
!430 = distinct !DILexicalBlock(scope: !394, file: !74, line: 253, column: 21)
!431 = !DILocation(line: 253, column: 34, scope: !430)
!432 = !DILocation(line: 253, column: 21, scope: !394)
!433 = !DILocation(line: 255, column: 21, scope: !434)
!434 = distinct !DILexicalBlock(scope: !430, file: !74, line: 254, column: 17)
!435 = !DILocation(line: 258, column: 35, scope: !394)
!436 = !DILocation(line: 258, column: 49, scope: !394)
!437 = !DILocation(line: 258, column: 30, scope: !394)
!438 = !DILocation(line: 258, column: 28, scope: !394)
!439 = !DILocation(line: 259, column: 21, scope: !440)
!440 = distinct !DILexicalBlock(scope: !394, file: !74, line: 259, column: 21)
!441 = !DILocation(line: 259, column: 32, scope: !440)
!442 = !DILocation(line: 259, column: 48, scope: !440)
!443 = !DILocation(line: 259, column: 51, scope: !440)
!444 = !DILocation(line: 259, column: 62, scope: !440)
!445 = !DILocation(line: 259, column: 21, scope: !394)
!446 = !DILocation(line: 261, column: 21, scope: !447)
!447 = distinct !DILexicalBlock(scope: !440, file: !74, line: 260, column: 17)
!448 = !DILocation(line: 264, column: 29, scope: !394)
!449 = !DILocation(line: 264, column: 17, scope: !394)
!450 = !DILocation(line: 264, column: 41, scope: !394)
!451 = !DILocation(line: 266, column: 29, scope: !394)
!452 = !DILocation(line: 266, column: 24, scope: !394)
!453 = !DILocation(line: 266, column: 22, scope: !394)
!454 = !DILocation(line: 267, column: 13, scope: !394)
!455 = !DILocation(line: 269, column: 17, scope: !456)
!456 = distinct !DILexicalBlock(scope: !382, file: !74, line: 269, column: 17)
!457 = !DILocation(line: 269, column: 30, scope: !456)
!458 = !DILocation(line: 269, column: 17, scope: !382)
!459 = !DILocation(line: 271, column: 30, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !74, line: 270, column: 13)
!461 = !DILocation(line: 271, column: 17, scope: !460)
!462 = !DILocation(line: 272, column: 13, scope: !460)
!463 = !DILocation(line: 273, column: 17, scope: !464)
!464 = distinct !DILexicalBlock(scope: !382, file: !74, line: 273, column: 17)
!465 = !DILocation(line: 273, column: 30, scope: !464)
!466 = !DILocation(line: 273, column: 17, scope: !382)
!467 = !DILocation(line: 275, column: 30, scope: !468)
!468 = distinct !DILexicalBlock(scope: !464, file: !74, line: 274, column: 13)
!469 = !DILocation(line: 275, column: 17, scope: !468)
!470 = !DILocation(line: 276, column: 13, scope: !468)
!471 = !DILocation(line: 284, column: 21, scope: !377)
!472 = !DILocation(line: 284, column: 10, scope: !377)
!473 = !DILocation(line: 284, column: 19, scope: !377)
!474 = !DILocalVariable(name: "data", scope: !475, file: !74, line: 287, type: !65)
!475 = distinct !DILexicalBlock(scope: !368, file: !74, line: 286, column: 5)
!476 = !DILocation(line: 287, column: 13, scope: !475)
!477 = !DILocation(line: 287, column: 21, scope: !475)
!478 = !DILocation(line: 287, column: 20, scope: !475)
!479 = !DILocalVariable(name: "i", scope: !480, file: !74, line: 289, type: !65)
!480 = distinct !DILexicalBlock(scope: !475, file: !74, line: 288, column: 9)
!481 = !DILocation(line: 289, column: 17, scope: !480)
!482 = !DILocalVariable(name: "buffer", scope: !480, file: !74, line: 290, type: !64)
!483 = !DILocation(line: 290, column: 19, scope: !480)
!484 = !DILocation(line: 290, column: 35, scope: !480)
!485 = !DILocation(line: 290, column: 28, scope: !480)
!486 = !DILocation(line: 291, column: 17, scope: !487)
!487 = distinct !DILexicalBlock(scope: !480, file: !74, line: 291, column: 17)
!488 = !DILocation(line: 291, column: 24, scope: !487)
!489 = !DILocation(line: 291, column: 17, scope: !480)
!490 = !DILocation(line: 291, column: 34, scope: !491)
!491 = distinct !DILexicalBlock(scope: !487, file: !74, line: 291, column: 33)
!492 = !DILocation(line: 293, column: 20, scope: !493)
!493 = distinct !DILexicalBlock(scope: !480, file: !74, line: 293, column: 13)
!494 = !DILocation(line: 293, column: 18, scope: !493)
!495 = !DILocation(line: 293, column: 25, scope: !496)
!496 = distinct !DILexicalBlock(scope: !493, file: !74, line: 293, column: 13)
!497 = !DILocation(line: 293, column: 27, scope: !496)
!498 = !DILocation(line: 293, column: 13, scope: !493)
!499 = !DILocation(line: 295, column: 17, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !74, line: 294, column: 13)
!501 = !DILocation(line: 295, column: 24, scope: !500)
!502 = !DILocation(line: 295, column: 27, scope: !500)
!503 = !DILocation(line: 296, column: 13, scope: !500)
!504 = !DILocation(line: 293, column: 34, scope: !496)
!505 = !DILocation(line: 293, column: 13, scope: !496)
!506 = distinct !{!506, !498, !507, !233}
!507 = !DILocation(line: 296, column: 13, scope: !493)
!508 = !DILocation(line: 298, column: 17, scope: !509)
!509 = distinct !DILexicalBlock(scope: !480, file: !74, line: 298, column: 17)
!510 = !DILocation(line: 298, column: 22, scope: !509)
!511 = !DILocation(line: 298, column: 27, scope: !509)
!512 = !DILocation(line: 298, column: 30, scope: !509)
!513 = !DILocation(line: 298, column: 35, scope: !509)
!514 = !DILocation(line: 298, column: 17, scope: !480)
!515 = !DILocation(line: 300, column: 17, scope: !516)
!516 = distinct !DILexicalBlock(scope: !509, file: !74, line: 299, column: 13)
!517 = !DILocation(line: 300, column: 24, scope: !516)
!518 = !DILocation(line: 300, column: 30, scope: !516)
!519 = !DILocation(line: 302, column: 23, scope: !520)
!520 = distinct !DILexicalBlock(scope: !516, file: !74, line: 302, column: 17)
!521 = !DILocation(line: 302, column: 21, scope: !520)
!522 = !DILocation(line: 302, column: 28, scope: !523)
!523 = distinct !DILexicalBlock(scope: !520, file: !74, line: 302, column: 17)
!524 = !DILocation(line: 302, column: 30, scope: !523)
!525 = !DILocation(line: 302, column: 17, scope: !520)
!526 = !DILocation(line: 304, column: 34, scope: !527)
!527 = distinct !DILexicalBlock(scope: !523, file: !74, line: 303, column: 17)
!528 = !DILocation(line: 304, column: 41, scope: !527)
!529 = !DILocation(line: 304, column: 21, scope: !527)
!530 = !DILocation(line: 305, column: 17, scope: !527)
!531 = !DILocation(line: 302, column: 37, scope: !523)
!532 = !DILocation(line: 302, column: 17, scope: !523)
!533 = distinct !{!533, !525, !534, !233}
!534 = !DILocation(line: 305, column: 17, scope: !520)
!535 = !DILocation(line: 306, column: 13, scope: !516)
!536 = !DILocation(line: 309, column: 17, scope: !537)
!537 = distinct !DILexicalBlock(scope: !509, file: !74, line: 308, column: 13)
!538 = !DILocation(line: 311, column: 18, scope: !480)
!539 = !DILocation(line: 311, column: 13, scope: !480)
!540 = !DILocation(line: 314, column: 1, scope: !368)
