; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_01_bad() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 -1, i32* %data, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !76, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !79, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %connectSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  br label %do.body, !dbg !106

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !107
  store i32 %call, i32* %connectSocket, align 4, !dbg !109
  %0 = load i32, i32* %connectSocket, align 4, !dbg !110
  %cmp = icmp eq i32 %0, -1, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !114

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !116
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !117
  store i16 2, i16* %sin_family, align 4, !dbg !118
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !119
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !120
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !121
  store i32 %call1, i32* %s_addr, align 4, !dbg !122
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !123
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !124
  store i16 %call2, i16* %sin_port, align 2, !dbg !125
  %2 = load i32, i32* %connectSocket, align 4, !dbg !126
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !128
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !129
  %cmp4 = icmp eq i32 %call3, -1, !dbg !130
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !131

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !132

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !134
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !135
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !136
  %conv = trunc i64 %call7 to i32, !dbg !136
  store i32 %conv, i32* %recvResult, align 4, !dbg !137
  %5 = load i32, i32* %recvResult, align 4, !dbg !138
  %cmp8 = icmp eq i32 %5, -1, !dbg !140
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !141

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !142
  %cmp10 = icmp eq i32 %6, 0, !dbg !143
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !144

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !145

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !147
  %idxprom = sext i32 %7 to i64, !dbg !148
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !150
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !151
  store i32 %call15, i32* %data, align 4, !dbg !152
  br label %do.end, !dbg !153

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !154
  %cmp16 = icmp ne i32 %8, -1, !dbg !156
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !157

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !158
  %call19 = call i32 @close(i32 %9), !dbg !160
  br label %if.end20, !dbg !161

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !165, metadata !DIExpression()), !dbg !166
  %call21 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !167
  %10 = bitcast i8* %call21 to i32*, !dbg !168
  store i32* %10, i32** %buffer, align 8, !dbg !166
  %11 = load i32*, i32** %buffer, align 8, !dbg !169
  %cmp22 = icmp eq i32* %11, null, !dbg !171
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !172

if.then24:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !173
  unreachable, !dbg !173

if.end25:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %if.end25
  %12 = load i32, i32* %i, align 4, !dbg !178
  %cmp26 = icmp slt i32 %12, 10, !dbg !180
  br i1 %cmp26, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !182
  %14 = load i32, i32* %i, align 4, !dbg !184
  %idxprom28 = sext i32 %14 to i64, !dbg !182
  %arrayidx29 = getelementptr inbounds i32, i32* %13, i64 %idxprom28, !dbg !182
  store i32 0, i32* %arrayidx29, align 4, !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !187
  %inc = add nsw i32 %15, 1, !dbg !187
  store i32 %inc, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !192
  %cmp30 = icmp sge i32 %16, 0, !dbg !194
  br i1 %cmp30, label %if.then32, label %if.else, !dbg !195

if.then32:                                        ; preds = %for.end
  %17 = load i32*, i32** %buffer, align 8, !dbg !196
  %18 = load i32, i32* %data, align 4, !dbg !198
  %idxprom33 = sext i32 %18 to i64, !dbg !196
  %arrayidx34 = getelementptr inbounds i32, i32* %17, i64 %idxprom33, !dbg !196
  store i32 1, i32* %arrayidx34, align 4, !dbg !199
  store i32 0, i32* %i, align 4, !dbg !200
  br label %for.cond35, !dbg !202

for.cond35:                                       ; preds = %for.inc41, %if.then32
  %19 = load i32, i32* %i, align 4, !dbg !203
  %cmp36 = icmp slt i32 %19, 10, !dbg !205
  br i1 %cmp36, label %for.body38, label %for.end43, !dbg !206

for.body38:                                       ; preds = %for.cond35
  %20 = load i32*, i32** %buffer, align 8, !dbg !207
  %21 = load i32, i32* %i, align 4, !dbg !209
  %idxprom39 = sext i32 %21 to i64, !dbg !207
  %arrayidx40 = getelementptr inbounds i32, i32* %20, i64 %idxprom39, !dbg !207
  %22 = load i32, i32* %arrayidx40, align 4, !dbg !207
  call void @printIntLine(i32 %22), !dbg !210
  br label %for.inc41, !dbg !211

for.inc41:                                        ; preds = %for.body38
  %23 = load i32, i32* %i, align 4, !dbg !212
  %inc42 = add nsw i32 %23, 1, !dbg !212
  store i32 %inc42, i32* %i, align 4, !dbg !212
  br label %for.cond35, !dbg !213, !llvm.loop !214

for.end43:                                        ; preds = %for.cond35
  br label %if.end44, !dbg !216

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !217
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end43
  %24 = load i32*, i32** %buffer, align 8, !dbg !219
  %25 = bitcast i32* %24 to i8*, !dbg !219
  call void @free(i8* %25) #8, !dbg !220
  ret void, !dbg !221
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #2

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #5

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_01_good() #0 !dbg !222 {
entry:
  call void @goodG2B(), !dbg !223
  call void @goodB2G(), !dbg !224
  ret void, !dbg !225
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !226 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !231, metadata !DIExpression()), !dbg !232
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !233, metadata !DIExpression()), !dbg !234
  %call = call i64 @time(i64* null) #8, !dbg !235
  %conv = trunc i64 %call to i32, !dbg !236
  call void @srand(i32 %conv) #8, !dbg !237
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !238
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_01_good(), !dbg !239
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !240
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !241
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_01_bad(), !dbg !242
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !243
  ret i32 0, !dbg !244
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !245 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !246, metadata !DIExpression()), !dbg !247
  store i32 -1, i32* %data, align 4, !dbg !248
  store i32 7, i32* %data, align 4, !dbg !249
  call void @llvm.dbg.declare(metadata i32* %i, metadata !250, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !253, metadata !DIExpression()), !dbg !254
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !255
  %0 = bitcast i8* %call to i32*, !dbg !256
  store i32* %0, i32** %buffer, align 8, !dbg !254
  %1 = load i32*, i32** %buffer, align 8, !dbg !257
  %cmp = icmp eq i32* %1, null, !dbg !259
  br i1 %cmp, label %if.then, label %if.end, !dbg !260

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !261
  unreachable, !dbg !261

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !263
  br label %for.cond, !dbg !265

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !266
  %cmp1 = icmp slt i32 %2, 10, !dbg !268
  br i1 %cmp1, label %for.body, label %for.end, !dbg !269

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !270
  %4 = load i32, i32* %i, align 4, !dbg !272
  %idxprom = sext i32 %4 to i64, !dbg !270
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !270
  store i32 0, i32* %arrayidx, align 4, !dbg !273
  br label %for.inc, !dbg !274

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !275
  %inc = add nsw i32 %5, 1, !dbg !275
  store i32 %inc, i32* %i, align 4, !dbg !275
  br label %for.cond, !dbg !276, !llvm.loop !277

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !279
  %cmp2 = icmp sge i32 %6, 0, !dbg !281
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !282

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !283
  %8 = load i32, i32* %data, align 4, !dbg !285
  %idxprom4 = sext i32 %8 to i64, !dbg !283
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !283
  store i32 1, i32* %arrayidx5, align 4, !dbg !286
  store i32 0, i32* %i, align 4, !dbg !287
  br label %for.cond6, !dbg !289

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !290
  %cmp7 = icmp slt i32 %9, 10, !dbg !292
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !293

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !294
  %11 = load i32, i32* %i, align 4, !dbg !296
  %idxprom9 = sext i32 %11 to i64, !dbg !294
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !294
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !294
  call void @printIntLine(i32 %12), !dbg !297
  br label %for.inc11, !dbg !298

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !299
  %inc12 = add nsw i32 %13, 1, !dbg !299
  store i32 %inc12, i32* %i, align 4, !dbg !299
  br label %for.cond6, !dbg !300, !llvm.loop !301

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !303

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !304
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !306
  %15 = bitcast i32* %14 to i8*, !dbg !306
  call void @free(i8* %15) #8, !dbg !307
  ret void, !dbg !308
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !309 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !310, metadata !DIExpression()), !dbg !311
  store i32 -1, i32* %data, align 4, !dbg !312
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !313, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !316, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !318, metadata !DIExpression()), !dbg !319
  store i32 -1, i32* %connectSocket, align 4, !dbg !319
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !320, metadata !DIExpression()), !dbg !321
  br label %do.body, !dbg !322

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !323
  store i32 %call, i32* %connectSocket, align 4, !dbg !325
  %0 = load i32, i32* %connectSocket, align 4, !dbg !326
  %cmp = icmp eq i32 %0, -1, !dbg !328
  br i1 %cmp, label %if.then, label %if.end, !dbg !329

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !330

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !332
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !332
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !333
  store i16 2, i16* %sin_family, align 4, !dbg !334
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !335
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !336
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !337
  store i32 %call1, i32* %s_addr, align 4, !dbg !338
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !339
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !340
  store i16 %call2, i16* %sin_port, align 2, !dbg !341
  %2 = load i32, i32* %connectSocket, align 4, !dbg !342
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !344
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !345
  %cmp4 = icmp eq i32 %call3, -1, !dbg !346
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !347

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !348

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !350
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !351
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !352
  %conv = trunc i64 %call7 to i32, !dbg !352
  store i32 %conv, i32* %recvResult, align 4, !dbg !353
  %5 = load i32, i32* %recvResult, align 4, !dbg !354
  %cmp8 = icmp eq i32 %5, -1, !dbg !356
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !357

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !358
  %cmp10 = icmp eq i32 %6, 0, !dbg !359
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !360

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !361

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !363
  %idxprom = sext i32 %7 to i64, !dbg !364
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !364
  store i8 0, i8* %arrayidx, align 1, !dbg !365
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !366
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !367
  store i32 %call15, i32* %data, align 4, !dbg !368
  br label %do.end, !dbg !369

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !370
  %cmp16 = icmp ne i32 %8, -1, !dbg !372
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !373

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !374
  %call19 = call i32 @close(i32 %9), !dbg !376
  br label %if.end20, !dbg !377

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !378, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !381, metadata !DIExpression()), !dbg !382
  %call21 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !383
  %10 = bitcast i8* %call21 to i32*, !dbg !384
  store i32* %10, i32** %buffer, align 8, !dbg !382
  %11 = load i32*, i32** %buffer, align 8, !dbg !385
  %cmp22 = icmp eq i32* %11, null, !dbg !387
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !388

if.then24:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !389
  unreachable, !dbg !389

if.end25:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !391
  br label %for.cond, !dbg !393

for.cond:                                         ; preds = %for.inc, %if.end25
  %12 = load i32, i32* %i, align 4, !dbg !394
  %cmp26 = icmp slt i32 %12, 10, !dbg !396
  br i1 %cmp26, label %for.body, label %for.end, !dbg !397

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !398
  %14 = load i32, i32* %i, align 4, !dbg !400
  %idxprom28 = sext i32 %14 to i64, !dbg !398
  %arrayidx29 = getelementptr inbounds i32, i32* %13, i64 %idxprom28, !dbg !398
  store i32 0, i32* %arrayidx29, align 4, !dbg !401
  br label %for.inc, !dbg !402

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !403
  %inc = add nsw i32 %15, 1, !dbg !403
  store i32 %inc, i32* %i, align 4, !dbg !403
  br label %for.cond, !dbg !404, !llvm.loop !405

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !407
  %cmp30 = icmp sge i32 %16, 0, !dbg !409
  br i1 %cmp30, label %land.lhs.true, label %if.else, !dbg !410

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !411
  %cmp32 = icmp slt i32 %17, 10, !dbg !412
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !413

if.then34:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !414
  %19 = load i32, i32* %data, align 4, !dbg !416
  %idxprom35 = sext i32 %19 to i64, !dbg !414
  %arrayidx36 = getelementptr inbounds i32, i32* %18, i64 %idxprom35, !dbg !414
  store i32 1, i32* %arrayidx36, align 4, !dbg !417
  store i32 0, i32* %i, align 4, !dbg !418
  br label %for.cond37, !dbg !420

for.cond37:                                       ; preds = %for.inc43, %if.then34
  %20 = load i32, i32* %i, align 4, !dbg !421
  %cmp38 = icmp slt i32 %20, 10, !dbg !423
  br i1 %cmp38, label %for.body40, label %for.end45, !dbg !424

for.body40:                                       ; preds = %for.cond37
  %21 = load i32*, i32** %buffer, align 8, !dbg !425
  %22 = load i32, i32* %i, align 4, !dbg !427
  %idxprom41 = sext i32 %22 to i64, !dbg !425
  %arrayidx42 = getelementptr inbounds i32, i32* %21, i64 %idxprom41, !dbg !425
  %23 = load i32, i32* %arrayidx42, align 4, !dbg !425
  call void @printIntLine(i32 %23), !dbg !428
  br label %for.inc43, !dbg !429

for.inc43:                                        ; preds = %for.body40
  %24 = load i32, i32* %i, align 4, !dbg !430
  %inc44 = add nsw i32 %24, 1, !dbg !430
  store i32 %inc44, i32* %i, align 4, !dbg !430
  br label %for.cond37, !dbg !431, !llvm.loop !432

for.end45:                                        ; preds = %for.cond37
  br label %if.end46, !dbg !434

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !435
  br label %if.end46

if.end46:                                         ; preds = %if.else, %for.end45
  %25 = load i32*, i32** %buffer, align 8, !dbg !437
  %26 = bitcast i32* %25 to i8*, !dbg !437
  call void @free(i8* %26) #8, !dbg !438
  ret void, !dbg !439
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
!llvm.module.flags = !{!62, !63, !64, !65, !66}
!llvm.ident = !{!67}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !59, !61, !5}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 178, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 180, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 181, baseType: !55, size: 112, offset: 16)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 112, elements: !57)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !{!58}
!58 = !DISubrange(count: 14)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!62 = !{i32 7, !"Dwarf Version", i32 4}
!63 = !{i32 2, !"Debug Info Version", i32 3}
!64 = !{i32 1, !"wchar_size", i32 4}
!65 = !{i32 7, !"uwtable", i32 1}
!66 = !{i32 7, !"frame-pointer", i32 2}
!67 = !{!"clang version 13.0.0"}
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_01_bad", scope: !69, file: !69, line: 44, type: !70, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_01.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 46, type: !60)
!74 = !DILocation(line: 46, column: 9, scope: !68)
!75 = !DILocation(line: 48, column: 10, scope: !68)
!76 = !DILocalVariable(name: "recvResult", scope: !77, file: !69, line: 54, type: !60)
!77 = distinct !DILexicalBlock(scope: !68, file: !69, line: 49, column: 5)
!78 = !DILocation(line: 54, column: 13, scope: !77)
!79 = !DILocalVariable(name: "service", scope: !77, file: !69, line: 55, type: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !81)
!81 = !{!82, !83, !89, !96}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !80, file: !17, line: 240, baseType: !51, size: 16)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !80, file: !17, line: 241, baseType: !84, size: 16, offset: 16)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !86, line: 25, baseType: !87)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !88, line: 40, baseType: !53)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !80, file: !17, line: 242, baseType: !90, size: 32, offset: 32)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !91)
!91 = !{!92}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !90, file: !17, line: 33, baseType: !93, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !86, line: 26, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !88, line: 42, baseType: !5)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !80, file: !17, line: 245, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 55, column: 28, scope: !77)
!102 = !DILocalVariable(name: "connectSocket", scope: !77, file: !69, line: 56, type: !60)
!103 = !DILocation(line: 56, column: 16, scope: !77)
!104 = !DILocalVariable(name: "inputBuffer", scope: !77, file: !69, line: 57, type: !55)
!105 = !DILocation(line: 57, column: 14, scope: !77)
!106 = !DILocation(line: 58, column: 9, scope: !77)
!107 = !DILocation(line: 68, column: 29, scope: !108)
!108 = distinct !DILexicalBlock(scope: !77, file: !69, line: 59, column: 9)
!109 = !DILocation(line: 68, column: 27, scope: !108)
!110 = !DILocation(line: 69, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !69, line: 69, column: 17)
!112 = !DILocation(line: 69, column: 31, scope: !111)
!113 = !DILocation(line: 69, column: 17, scope: !108)
!114 = !DILocation(line: 71, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !69, line: 70, column: 13)
!116 = !DILocation(line: 73, column: 13, scope: !108)
!117 = !DILocation(line: 74, column: 21, scope: !108)
!118 = !DILocation(line: 74, column: 32, scope: !108)
!119 = !DILocation(line: 75, column: 39, scope: !108)
!120 = !DILocation(line: 75, column: 21, scope: !108)
!121 = !DILocation(line: 75, column: 30, scope: !108)
!122 = !DILocation(line: 75, column: 37, scope: !108)
!123 = !DILocation(line: 76, column: 32, scope: !108)
!124 = !DILocation(line: 76, column: 21, scope: !108)
!125 = !DILocation(line: 76, column: 30, scope: !108)
!126 = !DILocation(line: 77, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !108, file: !69, line: 77, column: 17)
!128 = !DILocation(line: 77, column: 40, scope: !127)
!129 = !DILocation(line: 77, column: 17, scope: !127)
!130 = !DILocation(line: 77, column: 85, scope: !127)
!131 = !DILocation(line: 77, column: 17, scope: !108)
!132 = !DILocation(line: 79, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !69, line: 78, column: 13)
!134 = !DILocation(line: 83, column: 31, scope: !108)
!135 = !DILocation(line: 83, column: 46, scope: !108)
!136 = !DILocation(line: 83, column: 26, scope: !108)
!137 = !DILocation(line: 83, column: 24, scope: !108)
!138 = !DILocation(line: 84, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !108, file: !69, line: 84, column: 17)
!140 = !DILocation(line: 84, column: 28, scope: !139)
!141 = !DILocation(line: 84, column: 44, scope: !139)
!142 = !DILocation(line: 84, column: 47, scope: !139)
!143 = !DILocation(line: 84, column: 58, scope: !139)
!144 = !DILocation(line: 84, column: 17, scope: !108)
!145 = !DILocation(line: 86, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !139, file: !69, line: 85, column: 13)
!147 = !DILocation(line: 89, column: 25, scope: !108)
!148 = !DILocation(line: 89, column: 13, scope: !108)
!149 = !DILocation(line: 89, column: 37, scope: !108)
!150 = !DILocation(line: 91, column: 25, scope: !108)
!151 = !DILocation(line: 91, column: 20, scope: !108)
!152 = !DILocation(line: 91, column: 18, scope: !108)
!153 = !DILocation(line: 92, column: 9, scope: !108)
!154 = !DILocation(line: 94, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !77, file: !69, line: 94, column: 13)
!156 = !DILocation(line: 94, column: 27, scope: !155)
!157 = !DILocation(line: 94, column: 13, scope: !77)
!158 = !DILocation(line: 96, column: 26, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !69, line: 95, column: 9)
!160 = !DILocation(line: 96, column: 13, scope: !159)
!161 = !DILocation(line: 97, column: 9, scope: !159)
!162 = !DILocalVariable(name: "i", scope: !163, file: !69, line: 106, type: !60)
!163 = distinct !DILexicalBlock(scope: !68, file: !69, line: 105, column: 5)
!164 = !DILocation(line: 106, column: 13, scope: !163)
!165 = !DILocalVariable(name: "buffer", scope: !163, file: !69, line: 107, type: !59)
!166 = !DILocation(line: 107, column: 15, scope: !163)
!167 = !DILocation(line: 107, column: 31, scope: !163)
!168 = !DILocation(line: 107, column: 24, scope: !163)
!169 = !DILocation(line: 108, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !69, line: 108, column: 13)
!171 = !DILocation(line: 108, column: 20, scope: !170)
!172 = !DILocation(line: 108, column: 13, scope: !163)
!173 = !DILocation(line: 108, column: 30, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !69, line: 108, column: 29)
!175 = !DILocation(line: 110, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !163, file: !69, line: 110, column: 9)
!177 = !DILocation(line: 110, column: 14, scope: !176)
!178 = !DILocation(line: 110, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !69, line: 110, column: 9)
!180 = !DILocation(line: 110, column: 23, scope: !179)
!181 = !DILocation(line: 110, column: 9, scope: !176)
!182 = !DILocation(line: 112, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !69, line: 111, column: 9)
!184 = !DILocation(line: 112, column: 20, scope: !183)
!185 = !DILocation(line: 112, column: 23, scope: !183)
!186 = !DILocation(line: 113, column: 9, scope: !183)
!187 = !DILocation(line: 110, column: 30, scope: !179)
!188 = !DILocation(line: 110, column: 9, scope: !179)
!189 = distinct !{!189, !181, !190, !191}
!190 = !DILocation(line: 113, column: 9, scope: !176)
!191 = !{!"llvm.loop.mustprogress"}
!192 = !DILocation(line: 116, column: 13, scope: !193)
!193 = distinct !DILexicalBlock(scope: !163, file: !69, line: 116, column: 13)
!194 = !DILocation(line: 116, column: 18, scope: !193)
!195 = !DILocation(line: 116, column: 13, scope: !163)
!196 = !DILocation(line: 118, column: 13, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !69, line: 117, column: 9)
!198 = !DILocation(line: 118, column: 20, scope: !197)
!199 = !DILocation(line: 118, column: 26, scope: !197)
!200 = !DILocation(line: 120, column: 19, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !69, line: 120, column: 13)
!202 = !DILocation(line: 120, column: 17, scope: !201)
!203 = !DILocation(line: 120, column: 24, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !69, line: 120, column: 13)
!205 = !DILocation(line: 120, column: 26, scope: !204)
!206 = !DILocation(line: 120, column: 13, scope: !201)
!207 = !DILocation(line: 122, column: 30, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !69, line: 121, column: 13)
!209 = !DILocation(line: 122, column: 37, scope: !208)
!210 = !DILocation(line: 122, column: 17, scope: !208)
!211 = !DILocation(line: 123, column: 13, scope: !208)
!212 = !DILocation(line: 120, column: 33, scope: !204)
!213 = !DILocation(line: 120, column: 13, scope: !204)
!214 = distinct !{!214, !206, !215, !191}
!215 = !DILocation(line: 123, column: 13, scope: !201)
!216 = !DILocation(line: 124, column: 9, scope: !197)
!217 = !DILocation(line: 127, column: 13, scope: !218)
!218 = distinct !DILexicalBlock(scope: !193, file: !69, line: 126, column: 9)
!219 = !DILocation(line: 129, column: 14, scope: !163)
!220 = !DILocation(line: 129, column: 9, scope: !163)
!221 = !DILocation(line: 131, column: 1, scope: !68)
!222 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_01_good", scope: !69, file: !69, line: 263, type: !70, scopeLine: 264, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!223 = !DILocation(line: 265, column: 5, scope: !222)
!224 = !DILocation(line: 266, column: 5, scope: !222)
!225 = !DILocation(line: 267, column: 1, scope: !222)
!226 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 278, type: !227, scopeLine: 279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!227 = !DISubroutineType(types: !228)
!228 = !{!60, !60, !229}
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!231 = !DILocalVariable(name: "argc", arg: 1, scope: !226, file: !69, line: 278, type: !60)
!232 = !DILocation(line: 278, column: 14, scope: !226)
!233 = !DILocalVariable(name: "argv", arg: 2, scope: !226, file: !69, line: 278, type: !229)
!234 = !DILocation(line: 278, column: 27, scope: !226)
!235 = !DILocation(line: 281, column: 22, scope: !226)
!236 = !DILocation(line: 281, column: 12, scope: !226)
!237 = !DILocation(line: 281, column: 5, scope: !226)
!238 = !DILocation(line: 283, column: 5, scope: !226)
!239 = !DILocation(line: 284, column: 5, scope: !226)
!240 = !DILocation(line: 285, column: 5, scope: !226)
!241 = !DILocation(line: 288, column: 5, scope: !226)
!242 = !DILocation(line: 289, column: 5, scope: !226)
!243 = !DILocation(line: 290, column: 5, scope: !226)
!244 = !DILocation(line: 292, column: 5, scope: !226)
!245 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 138, type: !70, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!246 = !DILocalVariable(name: "data", scope: !245, file: !69, line: 140, type: !60)
!247 = !DILocation(line: 140, column: 9, scope: !245)
!248 = !DILocation(line: 142, column: 10, scope: !245)
!249 = !DILocation(line: 145, column: 10, scope: !245)
!250 = !DILocalVariable(name: "i", scope: !251, file: !69, line: 147, type: !60)
!251 = distinct !DILexicalBlock(scope: !245, file: !69, line: 146, column: 5)
!252 = !DILocation(line: 147, column: 13, scope: !251)
!253 = !DILocalVariable(name: "buffer", scope: !251, file: !69, line: 148, type: !59)
!254 = !DILocation(line: 148, column: 15, scope: !251)
!255 = !DILocation(line: 148, column: 31, scope: !251)
!256 = !DILocation(line: 148, column: 24, scope: !251)
!257 = !DILocation(line: 149, column: 13, scope: !258)
!258 = distinct !DILexicalBlock(scope: !251, file: !69, line: 149, column: 13)
!259 = !DILocation(line: 149, column: 20, scope: !258)
!260 = !DILocation(line: 149, column: 13, scope: !251)
!261 = !DILocation(line: 149, column: 30, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !69, line: 149, column: 29)
!263 = !DILocation(line: 151, column: 16, scope: !264)
!264 = distinct !DILexicalBlock(scope: !251, file: !69, line: 151, column: 9)
!265 = !DILocation(line: 151, column: 14, scope: !264)
!266 = !DILocation(line: 151, column: 21, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !69, line: 151, column: 9)
!268 = !DILocation(line: 151, column: 23, scope: !267)
!269 = !DILocation(line: 151, column: 9, scope: !264)
!270 = !DILocation(line: 153, column: 13, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !69, line: 152, column: 9)
!272 = !DILocation(line: 153, column: 20, scope: !271)
!273 = !DILocation(line: 153, column: 23, scope: !271)
!274 = !DILocation(line: 154, column: 9, scope: !271)
!275 = !DILocation(line: 151, column: 30, scope: !267)
!276 = !DILocation(line: 151, column: 9, scope: !267)
!277 = distinct !{!277, !269, !278, !191}
!278 = !DILocation(line: 154, column: 9, scope: !264)
!279 = !DILocation(line: 157, column: 13, scope: !280)
!280 = distinct !DILexicalBlock(scope: !251, file: !69, line: 157, column: 13)
!281 = !DILocation(line: 157, column: 18, scope: !280)
!282 = !DILocation(line: 157, column: 13, scope: !251)
!283 = !DILocation(line: 159, column: 13, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !69, line: 158, column: 9)
!285 = !DILocation(line: 159, column: 20, scope: !284)
!286 = !DILocation(line: 159, column: 26, scope: !284)
!287 = !DILocation(line: 161, column: 19, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !69, line: 161, column: 13)
!289 = !DILocation(line: 161, column: 17, scope: !288)
!290 = !DILocation(line: 161, column: 24, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !69, line: 161, column: 13)
!292 = !DILocation(line: 161, column: 26, scope: !291)
!293 = !DILocation(line: 161, column: 13, scope: !288)
!294 = !DILocation(line: 163, column: 30, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !69, line: 162, column: 13)
!296 = !DILocation(line: 163, column: 37, scope: !295)
!297 = !DILocation(line: 163, column: 17, scope: !295)
!298 = !DILocation(line: 164, column: 13, scope: !295)
!299 = !DILocation(line: 161, column: 33, scope: !291)
!300 = !DILocation(line: 161, column: 13, scope: !291)
!301 = distinct !{!301, !293, !302, !191}
!302 = !DILocation(line: 164, column: 13, scope: !288)
!303 = !DILocation(line: 165, column: 9, scope: !284)
!304 = !DILocation(line: 168, column: 13, scope: !305)
!305 = distinct !DILexicalBlock(scope: !280, file: !69, line: 167, column: 9)
!306 = !DILocation(line: 170, column: 14, scope: !251)
!307 = !DILocation(line: 170, column: 9, scope: !251)
!308 = !DILocation(line: 172, column: 1, scope: !245)
!309 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 175, type: !70, scopeLine: 176, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!310 = !DILocalVariable(name: "data", scope: !309, file: !69, line: 177, type: !60)
!311 = !DILocation(line: 177, column: 9, scope: !309)
!312 = !DILocation(line: 179, column: 10, scope: !309)
!313 = !DILocalVariable(name: "recvResult", scope: !314, file: !69, line: 185, type: !60)
!314 = distinct !DILexicalBlock(scope: !309, file: !69, line: 180, column: 5)
!315 = !DILocation(line: 185, column: 13, scope: !314)
!316 = !DILocalVariable(name: "service", scope: !314, file: !69, line: 186, type: !80)
!317 = !DILocation(line: 186, column: 28, scope: !314)
!318 = !DILocalVariable(name: "connectSocket", scope: !314, file: !69, line: 187, type: !60)
!319 = !DILocation(line: 187, column: 16, scope: !314)
!320 = !DILocalVariable(name: "inputBuffer", scope: !314, file: !69, line: 188, type: !55)
!321 = !DILocation(line: 188, column: 14, scope: !314)
!322 = !DILocation(line: 189, column: 9, scope: !314)
!323 = !DILocation(line: 199, column: 29, scope: !324)
!324 = distinct !DILexicalBlock(scope: !314, file: !69, line: 190, column: 9)
!325 = !DILocation(line: 199, column: 27, scope: !324)
!326 = !DILocation(line: 200, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !324, file: !69, line: 200, column: 17)
!328 = !DILocation(line: 200, column: 31, scope: !327)
!329 = !DILocation(line: 200, column: 17, scope: !324)
!330 = !DILocation(line: 202, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !69, line: 201, column: 13)
!332 = !DILocation(line: 204, column: 13, scope: !324)
!333 = !DILocation(line: 205, column: 21, scope: !324)
!334 = !DILocation(line: 205, column: 32, scope: !324)
!335 = !DILocation(line: 206, column: 39, scope: !324)
!336 = !DILocation(line: 206, column: 21, scope: !324)
!337 = !DILocation(line: 206, column: 30, scope: !324)
!338 = !DILocation(line: 206, column: 37, scope: !324)
!339 = !DILocation(line: 207, column: 32, scope: !324)
!340 = !DILocation(line: 207, column: 21, scope: !324)
!341 = !DILocation(line: 207, column: 30, scope: !324)
!342 = !DILocation(line: 208, column: 25, scope: !343)
!343 = distinct !DILexicalBlock(scope: !324, file: !69, line: 208, column: 17)
!344 = !DILocation(line: 208, column: 40, scope: !343)
!345 = !DILocation(line: 208, column: 17, scope: !343)
!346 = !DILocation(line: 208, column: 85, scope: !343)
!347 = !DILocation(line: 208, column: 17, scope: !324)
!348 = !DILocation(line: 210, column: 17, scope: !349)
!349 = distinct !DILexicalBlock(scope: !343, file: !69, line: 209, column: 13)
!350 = !DILocation(line: 214, column: 31, scope: !324)
!351 = !DILocation(line: 214, column: 46, scope: !324)
!352 = !DILocation(line: 214, column: 26, scope: !324)
!353 = !DILocation(line: 214, column: 24, scope: !324)
!354 = !DILocation(line: 215, column: 17, scope: !355)
!355 = distinct !DILexicalBlock(scope: !324, file: !69, line: 215, column: 17)
!356 = !DILocation(line: 215, column: 28, scope: !355)
!357 = !DILocation(line: 215, column: 44, scope: !355)
!358 = !DILocation(line: 215, column: 47, scope: !355)
!359 = !DILocation(line: 215, column: 58, scope: !355)
!360 = !DILocation(line: 215, column: 17, scope: !324)
!361 = !DILocation(line: 217, column: 17, scope: !362)
!362 = distinct !DILexicalBlock(scope: !355, file: !69, line: 216, column: 13)
!363 = !DILocation(line: 220, column: 25, scope: !324)
!364 = !DILocation(line: 220, column: 13, scope: !324)
!365 = !DILocation(line: 220, column: 37, scope: !324)
!366 = !DILocation(line: 222, column: 25, scope: !324)
!367 = !DILocation(line: 222, column: 20, scope: !324)
!368 = !DILocation(line: 222, column: 18, scope: !324)
!369 = !DILocation(line: 223, column: 9, scope: !324)
!370 = !DILocation(line: 225, column: 13, scope: !371)
!371 = distinct !DILexicalBlock(scope: !314, file: !69, line: 225, column: 13)
!372 = !DILocation(line: 225, column: 27, scope: !371)
!373 = !DILocation(line: 225, column: 13, scope: !314)
!374 = !DILocation(line: 227, column: 26, scope: !375)
!375 = distinct !DILexicalBlock(scope: !371, file: !69, line: 226, column: 9)
!376 = !DILocation(line: 227, column: 13, scope: !375)
!377 = !DILocation(line: 228, column: 9, scope: !375)
!378 = !DILocalVariable(name: "i", scope: !379, file: !69, line: 237, type: !60)
!379 = distinct !DILexicalBlock(scope: !309, file: !69, line: 236, column: 5)
!380 = !DILocation(line: 237, column: 13, scope: !379)
!381 = !DILocalVariable(name: "buffer", scope: !379, file: !69, line: 238, type: !59)
!382 = !DILocation(line: 238, column: 15, scope: !379)
!383 = !DILocation(line: 238, column: 31, scope: !379)
!384 = !DILocation(line: 238, column: 24, scope: !379)
!385 = !DILocation(line: 239, column: 13, scope: !386)
!386 = distinct !DILexicalBlock(scope: !379, file: !69, line: 239, column: 13)
!387 = !DILocation(line: 239, column: 20, scope: !386)
!388 = !DILocation(line: 239, column: 13, scope: !379)
!389 = !DILocation(line: 239, column: 30, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !69, line: 239, column: 29)
!391 = !DILocation(line: 241, column: 16, scope: !392)
!392 = distinct !DILexicalBlock(scope: !379, file: !69, line: 241, column: 9)
!393 = !DILocation(line: 241, column: 14, scope: !392)
!394 = !DILocation(line: 241, column: 21, scope: !395)
!395 = distinct !DILexicalBlock(scope: !392, file: !69, line: 241, column: 9)
!396 = !DILocation(line: 241, column: 23, scope: !395)
!397 = !DILocation(line: 241, column: 9, scope: !392)
!398 = !DILocation(line: 243, column: 13, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !69, line: 242, column: 9)
!400 = !DILocation(line: 243, column: 20, scope: !399)
!401 = !DILocation(line: 243, column: 23, scope: !399)
!402 = !DILocation(line: 244, column: 9, scope: !399)
!403 = !DILocation(line: 241, column: 30, scope: !395)
!404 = !DILocation(line: 241, column: 9, scope: !395)
!405 = distinct !{!405, !397, !406, !191}
!406 = !DILocation(line: 244, column: 9, scope: !392)
!407 = !DILocation(line: 246, column: 13, scope: !408)
!408 = distinct !DILexicalBlock(scope: !379, file: !69, line: 246, column: 13)
!409 = !DILocation(line: 246, column: 18, scope: !408)
!410 = !DILocation(line: 246, column: 23, scope: !408)
!411 = !DILocation(line: 246, column: 26, scope: !408)
!412 = !DILocation(line: 246, column: 31, scope: !408)
!413 = !DILocation(line: 246, column: 13, scope: !379)
!414 = !DILocation(line: 248, column: 13, scope: !415)
!415 = distinct !DILexicalBlock(scope: !408, file: !69, line: 247, column: 9)
!416 = !DILocation(line: 248, column: 20, scope: !415)
!417 = !DILocation(line: 248, column: 26, scope: !415)
!418 = !DILocation(line: 250, column: 19, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !69, line: 250, column: 13)
!420 = !DILocation(line: 250, column: 17, scope: !419)
!421 = !DILocation(line: 250, column: 24, scope: !422)
!422 = distinct !DILexicalBlock(scope: !419, file: !69, line: 250, column: 13)
!423 = !DILocation(line: 250, column: 26, scope: !422)
!424 = !DILocation(line: 250, column: 13, scope: !419)
!425 = !DILocation(line: 252, column: 30, scope: !426)
!426 = distinct !DILexicalBlock(scope: !422, file: !69, line: 251, column: 13)
!427 = !DILocation(line: 252, column: 37, scope: !426)
!428 = !DILocation(line: 252, column: 17, scope: !426)
!429 = !DILocation(line: 253, column: 13, scope: !426)
!430 = !DILocation(line: 250, column: 33, scope: !422)
!431 = !DILocation(line: 250, column: 13, scope: !422)
!432 = distinct !{!432, !424, !433, !191}
!433 = !DILocation(line: 253, column: 13, scope: !419)
!434 = !DILocation(line: 254, column: 9, scope: !415)
!435 = !DILocation(line: 257, column: 13, scope: !436)
!436 = distinct !DILexicalBlock(scope: !408, file: !69, line: 256, column: 9)
!437 = !DILocation(line: 259, column: 14, scope: !379)
!438 = !DILocation(line: 259, column: 9, scope: !379)
!439 = !DILocation(line: 261, column: 1, scope: !309)
