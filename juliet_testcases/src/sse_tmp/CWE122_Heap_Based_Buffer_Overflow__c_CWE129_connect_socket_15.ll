; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_bad() #0 !dbg !68 {
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_good() #0 !dbg !222 {
entry:
  call void @goodB2G1(), !dbg !223
  call void @goodB2G2(), !dbg !224
  call void @goodG2B1(), !dbg !225
  call void @goodG2B2(), !dbg !226
  ret void, !dbg !227
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !228 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !233, metadata !DIExpression()), !dbg !234
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !235, metadata !DIExpression()), !dbg !236
  %call = call i64 @time(i64* null) #8, !dbg !237
  %conv = trunc i64 %call to i32, !dbg !238
  call void @srand(i32 %conv) #8, !dbg !239
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !240
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_good(), !dbg !241
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !242
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !243
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_bad(), !dbg !244
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !245
  ret i32 0, !dbg !246
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !247 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !248, metadata !DIExpression()), !dbg !249
  store i32 -1, i32* %data, align 4, !dbg !250
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !251, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !254, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !256, metadata !DIExpression()), !dbg !257
  store i32 -1, i32* %connectSocket, align 4, !dbg !257
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !258, metadata !DIExpression()), !dbg !259
  br label %do.body, !dbg !260

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !261
  store i32 %call, i32* %connectSocket, align 4, !dbg !263
  %0 = load i32, i32* %connectSocket, align 4, !dbg !264
  %cmp = icmp eq i32 %0, -1, !dbg !266
  br i1 %cmp, label %if.then, label %if.end, !dbg !267

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !268

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !270
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !270
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !271
  store i16 2, i16* %sin_family, align 4, !dbg !272
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !273
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !274
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !275
  store i32 %call1, i32* %s_addr, align 4, !dbg !276
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !277
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !278
  store i16 %call2, i16* %sin_port, align 2, !dbg !279
  %2 = load i32, i32* %connectSocket, align 4, !dbg !280
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !282
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !283
  %cmp4 = icmp eq i32 %call3, -1, !dbg !284
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !285

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !286

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !288
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !289
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !290
  %conv = trunc i64 %call7 to i32, !dbg !290
  store i32 %conv, i32* %recvResult, align 4, !dbg !291
  %5 = load i32, i32* %recvResult, align 4, !dbg !292
  %cmp8 = icmp eq i32 %5, -1, !dbg !294
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !295

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !296
  %cmp10 = icmp eq i32 %6, 0, !dbg !297
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !298

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !299

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !301
  %idxprom = sext i32 %7 to i64, !dbg !302
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !302
  store i8 0, i8* %arrayidx, align 1, !dbg !303
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !304
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !305
  store i32 %call15, i32* %data, align 4, !dbg !306
  br label %do.end, !dbg !307

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !308
  %cmp16 = icmp ne i32 %8, -1, !dbg !310
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !311

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !312
  %call19 = call i32 @close(i32 %9), !dbg !314
  br label %if.end20, !dbg !315

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !316, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !319, metadata !DIExpression()), !dbg !320
  %call21 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !321
  %10 = bitcast i8* %call21 to i32*, !dbg !322
  store i32* %10, i32** %buffer, align 8, !dbg !320
  %11 = load i32*, i32** %buffer, align 8, !dbg !323
  %cmp22 = icmp eq i32* %11, null, !dbg !325
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !326

if.then24:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !327
  unreachable, !dbg !327

if.end25:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !329
  br label %for.cond, !dbg !331

for.cond:                                         ; preds = %for.inc, %if.end25
  %12 = load i32, i32* %i, align 4, !dbg !332
  %cmp26 = icmp slt i32 %12, 10, !dbg !334
  br i1 %cmp26, label %for.body, label %for.end, !dbg !335

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !336
  %14 = load i32, i32* %i, align 4, !dbg !338
  %idxprom28 = sext i32 %14 to i64, !dbg !336
  %arrayidx29 = getelementptr inbounds i32, i32* %13, i64 %idxprom28, !dbg !336
  store i32 0, i32* %arrayidx29, align 4, !dbg !339
  br label %for.inc, !dbg !340

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !341
  %inc = add nsw i32 %15, 1, !dbg !341
  store i32 %inc, i32* %i, align 4, !dbg !341
  br label %for.cond, !dbg !342, !llvm.loop !343

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !345
  %cmp30 = icmp sge i32 %16, 0, !dbg !347
  br i1 %cmp30, label %land.lhs.true, label %if.else, !dbg !348

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !349
  %cmp32 = icmp slt i32 %17, 10, !dbg !350
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !351

if.then34:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !352
  %19 = load i32, i32* %data, align 4, !dbg !354
  %idxprom35 = sext i32 %19 to i64, !dbg !352
  %arrayidx36 = getelementptr inbounds i32, i32* %18, i64 %idxprom35, !dbg !352
  store i32 1, i32* %arrayidx36, align 4, !dbg !355
  store i32 0, i32* %i, align 4, !dbg !356
  br label %for.cond37, !dbg !358

for.cond37:                                       ; preds = %for.inc43, %if.then34
  %20 = load i32, i32* %i, align 4, !dbg !359
  %cmp38 = icmp slt i32 %20, 10, !dbg !361
  br i1 %cmp38, label %for.body40, label %for.end45, !dbg !362

for.body40:                                       ; preds = %for.cond37
  %21 = load i32*, i32** %buffer, align 8, !dbg !363
  %22 = load i32, i32* %i, align 4, !dbg !365
  %idxprom41 = sext i32 %22 to i64, !dbg !363
  %arrayidx42 = getelementptr inbounds i32, i32* %21, i64 %idxprom41, !dbg !363
  %23 = load i32, i32* %arrayidx42, align 4, !dbg !363
  call void @printIntLine(i32 %23), !dbg !366
  br label %for.inc43, !dbg !367

for.inc43:                                        ; preds = %for.body40
  %24 = load i32, i32* %i, align 4, !dbg !368
  %inc44 = add nsw i32 %24, 1, !dbg !368
  store i32 %inc44, i32* %i, align 4, !dbg !368
  br label %for.cond37, !dbg !369, !llvm.loop !370

for.end45:                                        ; preds = %for.cond37
  br label %if.end46, !dbg !372

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !373
  br label %if.end46

if.end46:                                         ; preds = %if.else, %for.end45
  %25 = load i32*, i32** %buffer, align 8, !dbg !375
  %26 = bitcast i32* %25 to i8*, !dbg !375
  call void @free(i8* %26) #8, !dbg !376
  ret void, !dbg !377
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !378 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !379, metadata !DIExpression()), !dbg !380
  store i32 -1, i32* %data, align 4, !dbg !381
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !382, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !385, metadata !DIExpression()), !dbg !386
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !387, metadata !DIExpression()), !dbg !388
  store i32 -1, i32* %connectSocket, align 4, !dbg !388
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !389, metadata !DIExpression()), !dbg !390
  br label %do.body, !dbg !391

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !392
  store i32 %call, i32* %connectSocket, align 4, !dbg !394
  %0 = load i32, i32* %connectSocket, align 4, !dbg !395
  %cmp = icmp eq i32 %0, -1, !dbg !397
  br i1 %cmp, label %if.then, label %if.end, !dbg !398

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !399

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !401
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !401
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !402
  store i16 2, i16* %sin_family, align 4, !dbg !403
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !404
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !405
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !406
  store i32 %call1, i32* %s_addr, align 4, !dbg !407
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !408
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !409
  store i16 %call2, i16* %sin_port, align 2, !dbg !410
  %2 = load i32, i32* %connectSocket, align 4, !dbg !411
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !413
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !414
  %cmp4 = icmp eq i32 %call3, -1, !dbg !415
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !416

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !417

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !419
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !420
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !421
  %conv = trunc i64 %call7 to i32, !dbg !421
  store i32 %conv, i32* %recvResult, align 4, !dbg !422
  %5 = load i32, i32* %recvResult, align 4, !dbg !423
  %cmp8 = icmp eq i32 %5, -1, !dbg !425
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !426

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !427
  %cmp10 = icmp eq i32 %6, 0, !dbg !428
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !429

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !430

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !432
  %idxprom = sext i32 %7 to i64, !dbg !433
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !433
  store i8 0, i8* %arrayidx, align 1, !dbg !434
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !435
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !436
  store i32 %call15, i32* %data, align 4, !dbg !437
  br label %do.end, !dbg !438

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !439
  %cmp16 = icmp ne i32 %8, -1, !dbg !441
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !442

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !443
  %call19 = call i32 @close(i32 %9), !dbg !445
  br label %if.end20, !dbg !446

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !447, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !450, metadata !DIExpression()), !dbg !451
  %call21 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !452
  %10 = bitcast i8* %call21 to i32*, !dbg !453
  store i32* %10, i32** %buffer, align 8, !dbg !451
  %11 = load i32*, i32** %buffer, align 8, !dbg !454
  %cmp22 = icmp eq i32* %11, null, !dbg !456
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !457

if.then24:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !458
  unreachable, !dbg !458

if.end25:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !460
  br label %for.cond, !dbg !462

for.cond:                                         ; preds = %for.inc, %if.end25
  %12 = load i32, i32* %i, align 4, !dbg !463
  %cmp26 = icmp slt i32 %12, 10, !dbg !465
  br i1 %cmp26, label %for.body, label %for.end, !dbg !466

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !467
  %14 = load i32, i32* %i, align 4, !dbg !469
  %idxprom28 = sext i32 %14 to i64, !dbg !467
  %arrayidx29 = getelementptr inbounds i32, i32* %13, i64 %idxprom28, !dbg !467
  store i32 0, i32* %arrayidx29, align 4, !dbg !470
  br label %for.inc, !dbg !471

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !472
  %inc = add nsw i32 %15, 1, !dbg !472
  store i32 %inc, i32* %i, align 4, !dbg !472
  br label %for.cond, !dbg !473, !llvm.loop !474

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !476
  %cmp30 = icmp sge i32 %16, 0, !dbg !478
  br i1 %cmp30, label %land.lhs.true, label %if.else, !dbg !479

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !480
  %cmp32 = icmp slt i32 %17, 10, !dbg !481
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !482

if.then34:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !483
  %19 = load i32, i32* %data, align 4, !dbg !485
  %idxprom35 = sext i32 %19 to i64, !dbg !483
  %arrayidx36 = getelementptr inbounds i32, i32* %18, i64 %idxprom35, !dbg !483
  store i32 1, i32* %arrayidx36, align 4, !dbg !486
  store i32 0, i32* %i, align 4, !dbg !487
  br label %for.cond37, !dbg !489

for.cond37:                                       ; preds = %for.inc43, %if.then34
  %20 = load i32, i32* %i, align 4, !dbg !490
  %cmp38 = icmp slt i32 %20, 10, !dbg !492
  br i1 %cmp38, label %for.body40, label %for.end45, !dbg !493

for.body40:                                       ; preds = %for.cond37
  %21 = load i32*, i32** %buffer, align 8, !dbg !494
  %22 = load i32, i32* %i, align 4, !dbg !496
  %idxprom41 = sext i32 %22 to i64, !dbg !494
  %arrayidx42 = getelementptr inbounds i32, i32* %21, i64 %idxprom41, !dbg !494
  %23 = load i32, i32* %arrayidx42, align 4, !dbg !494
  call void @printIntLine(i32 %23), !dbg !497
  br label %for.inc43, !dbg !498

for.inc43:                                        ; preds = %for.body40
  %24 = load i32, i32* %i, align 4, !dbg !499
  %inc44 = add nsw i32 %24, 1, !dbg !499
  store i32 %inc44, i32* %i, align 4, !dbg !499
  br label %for.cond37, !dbg !500, !llvm.loop !501

for.end45:                                        ; preds = %for.cond37
  br label %if.end46, !dbg !503

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !504
  br label %if.end46

if.end46:                                         ; preds = %if.else, %for.end45
  %25 = load i32*, i32** %buffer, align 8, !dbg !506
  %26 = bitcast i32* %25 to i8*, !dbg !506
  call void @free(i8* %26) #8, !dbg !507
  ret void, !dbg !508
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !509 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !510, metadata !DIExpression()), !dbg !511
  store i32 -1, i32* %data, align 4, !dbg !512
  store i32 7, i32* %data, align 4, !dbg !513
  call void @llvm.dbg.declare(metadata i32* %i, metadata !514, metadata !DIExpression()), !dbg !516
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !517, metadata !DIExpression()), !dbg !518
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !519
  %0 = bitcast i8* %call to i32*, !dbg !520
  store i32* %0, i32** %buffer, align 8, !dbg !518
  %1 = load i32*, i32** %buffer, align 8, !dbg !521
  %cmp = icmp eq i32* %1, null, !dbg !523
  br i1 %cmp, label %if.then, label %if.end, !dbg !524

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !525
  unreachable, !dbg !525

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !527
  br label %for.cond, !dbg !529

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !530
  %cmp1 = icmp slt i32 %2, 10, !dbg !532
  br i1 %cmp1, label %for.body, label %for.end, !dbg !533

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !534
  %4 = load i32, i32* %i, align 4, !dbg !536
  %idxprom = sext i32 %4 to i64, !dbg !534
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !534
  store i32 0, i32* %arrayidx, align 4, !dbg !537
  br label %for.inc, !dbg !538

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !539
  %inc = add nsw i32 %5, 1, !dbg !539
  store i32 %inc, i32* %i, align 4, !dbg !539
  br label %for.cond, !dbg !540, !llvm.loop !541

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !543
  %cmp2 = icmp sge i32 %6, 0, !dbg !545
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !546

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !547
  %8 = load i32, i32* %data, align 4, !dbg !549
  %idxprom4 = sext i32 %8 to i64, !dbg !547
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !547
  store i32 1, i32* %arrayidx5, align 4, !dbg !550
  store i32 0, i32* %i, align 4, !dbg !551
  br label %for.cond6, !dbg !553

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !554
  %cmp7 = icmp slt i32 %9, 10, !dbg !556
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !557

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !558
  %11 = load i32, i32* %i, align 4, !dbg !560
  %idxprom9 = sext i32 %11 to i64, !dbg !558
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !558
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !558
  call void @printIntLine(i32 %12), !dbg !561
  br label %for.inc11, !dbg !562

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !563
  %inc12 = add nsw i32 %13, 1, !dbg !563
  store i32 %inc12, i32* %i, align 4, !dbg !563
  br label %for.cond6, !dbg !564, !llvm.loop !565

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !567

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !568
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !570
  %15 = bitcast i32* %14 to i8*, !dbg !570
  call void @free(i8* %15) #8, !dbg !571
  ret void, !dbg !572
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !573 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !574, metadata !DIExpression()), !dbg !575
  store i32 -1, i32* %data, align 4, !dbg !576
  store i32 7, i32* %data, align 4, !dbg !577
  call void @llvm.dbg.declare(metadata i32* %i, metadata !578, metadata !DIExpression()), !dbg !580
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !581, metadata !DIExpression()), !dbg !582
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !583
  %0 = bitcast i8* %call to i32*, !dbg !584
  store i32* %0, i32** %buffer, align 8, !dbg !582
  %1 = load i32*, i32** %buffer, align 8, !dbg !585
  %cmp = icmp eq i32* %1, null, !dbg !587
  br i1 %cmp, label %if.then, label %if.end, !dbg !588

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !589
  unreachable, !dbg !589

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !591
  br label %for.cond, !dbg !593

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !594
  %cmp1 = icmp slt i32 %2, 10, !dbg !596
  br i1 %cmp1, label %for.body, label %for.end, !dbg !597

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !598
  %4 = load i32, i32* %i, align 4, !dbg !600
  %idxprom = sext i32 %4 to i64, !dbg !598
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !598
  store i32 0, i32* %arrayidx, align 4, !dbg !601
  br label %for.inc, !dbg !602

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !603
  %inc = add nsw i32 %5, 1, !dbg !603
  store i32 %inc, i32* %i, align 4, !dbg !603
  br label %for.cond, !dbg !604, !llvm.loop !605

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !607
  %cmp2 = icmp sge i32 %6, 0, !dbg !609
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !610

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !611
  %8 = load i32, i32* %data, align 4, !dbg !613
  %idxprom4 = sext i32 %8 to i64, !dbg !611
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !611
  store i32 1, i32* %arrayidx5, align 4, !dbg !614
  store i32 0, i32* %i, align 4, !dbg !615
  br label %for.cond6, !dbg !617

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !618
  %cmp7 = icmp slt i32 %9, 10, !dbg !620
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !621

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !622
  %11 = load i32, i32* %i, align 4, !dbg !624
  %idxprom9 = sext i32 %11 to i64, !dbg !622
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !622
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !622
  call void @printIntLine(i32 %12), !dbg !625
  br label %for.inc11, !dbg !626

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !627
  %inc12 = add nsw i32 %13, 1, !dbg !627
  store i32 %inc12, i32* %i, align 4, !dbg !627
  br label %for.cond6, !dbg !628, !llvm.loop !629

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !631

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !632
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !634
  %15 = bitcast i32* %14 to i8*, !dbg !634
  call void @free(i8* %15) #8, !dbg !635
  ret void, !dbg !636
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15.c", directory: "/root/SSE-Assessment")
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
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 175, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 177, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 178, baseType: !55, size: 112, offset: 16)
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_bad", scope: !69, file: !69, line: 44, type: !70, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15.c", directory: "/root/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 46, type: !60)
!74 = !DILocation(line: 46, column: 9, scope: !68)
!75 = !DILocation(line: 48, column: 10, scope: !68)
!76 = !DILocalVariable(name: "recvResult", scope: !77, file: !69, line: 57, type: !60)
!77 = distinct !DILexicalBlock(scope: !68, file: !69, line: 52, column: 5)
!78 = !DILocation(line: 57, column: 13, scope: !77)
!79 = !DILocalVariable(name: "service", scope: !77, file: !69, line: 58, type: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !81)
!81 = !{!82, !83, !89, !96}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !80, file: !17, line: 239, baseType: !51, size: 16)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !80, file: !17, line: 240, baseType: !84, size: 16, offset: 16)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !86, line: 25, baseType: !87)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !88, line: 39, baseType: !53)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !80, file: !17, line: 241, baseType: !90, size: 32, offset: 32)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !91)
!91 = !{!92}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !90, file: !17, line: 33, baseType: !93, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !86, line: 26, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !88, line: 41, baseType: !5)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !80, file: !17, line: 244, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 58, column: 28, scope: !77)
!102 = !DILocalVariable(name: "connectSocket", scope: !77, file: !69, line: 59, type: !60)
!103 = !DILocation(line: 59, column: 16, scope: !77)
!104 = !DILocalVariable(name: "inputBuffer", scope: !77, file: !69, line: 60, type: !55)
!105 = !DILocation(line: 60, column: 14, scope: !77)
!106 = !DILocation(line: 61, column: 9, scope: !77)
!107 = !DILocation(line: 71, column: 29, scope: !108)
!108 = distinct !DILexicalBlock(scope: !77, file: !69, line: 62, column: 9)
!109 = !DILocation(line: 71, column: 27, scope: !108)
!110 = !DILocation(line: 72, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !69, line: 72, column: 17)
!112 = !DILocation(line: 72, column: 31, scope: !111)
!113 = !DILocation(line: 72, column: 17, scope: !108)
!114 = !DILocation(line: 74, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !69, line: 73, column: 13)
!116 = !DILocation(line: 76, column: 13, scope: !108)
!117 = !DILocation(line: 77, column: 21, scope: !108)
!118 = !DILocation(line: 77, column: 32, scope: !108)
!119 = !DILocation(line: 78, column: 39, scope: !108)
!120 = !DILocation(line: 78, column: 21, scope: !108)
!121 = !DILocation(line: 78, column: 30, scope: !108)
!122 = !DILocation(line: 78, column: 37, scope: !108)
!123 = !DILocation(line: 79, column: 32, scope: !108)
!124 = !DILocation(line: 79, column: 21, scope: !108)
!125 = !DILocation(line: 79, column: 30, scope: !108)
!126 = !DILocation(line: 80, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !108, file: !69, line: 80, column: 17)
!128 = !DILocation(line: 80, column: 40, scope: !127)
!129 = !DILocation(line: 80, column: 17, scope: !127)
!130 = !DILocation(line: 80, column: 85, scope: !127)
!131 = !DILocation(line: 80, column: 17, scope: !108)
!132 = !DILocation(line: 82, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !69, line: 81, column: 13)
!134 = !DILocation(line: 86, column: 31, scope: !108)
!135 = !DILocation(line: 86, column: 46, scope: !108)
!136 = !DILocation(line: 86, column: 26, scope: !108)
!137 = !DILocation(line: 86, column: 24, scope: !108)
!138 = !DILocation(line: 87, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !108, file: !69, line: 87, column: 17)
!140 = !DILocation(line: 87, column: 28, scope: !139)
!141 = !DILocation(line: 87, column: 44, scope: !139)
!142 = !DILocation(line: 87, column: 47, scope: !139)
!143 = !DILocation(line: 87, column: 58, scope: !139)
!144 = !DILocation(line: 87, column: 17, scope: !108)
!145 = !DILocation(line: 89, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !139, file: !69, line: 88, column: 13)
!147 = !DILocation(line: 92, column: 25, scope: !108)
!148 = !DILocation(line: 92, column: 13, scope: !108)
!149 = !DILocation(line: 92, column: 37, scope: !108)
!150 = !DILocation(line: 94, column: 25, scope: !108)
!151 = !DILocation(line: 94, column: 20, scope: !108)
!152 = !DILocation(line: 94, column: 18, scope: !108)
!153 = !DILocation(line: 95, column: 9, scope: !108)
!154 = !DILocation(line: 97, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !77, file: !69, line: 97, column: 13)
!156 = !DILocation(line: 97, column: 27, scope: !155)
!157 = !DILocation(line: 97, column: 13, scope: !77)
!158 = !DILocation(line: 99, column: 26, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !69, line: 98, column: 9)
!160 = !DILocation(line: 99, column: 13, scope: !159)
!161 = !DILocation(line: 100, column: 9, scope: !159)
!162 = !DILocalVariable(name: "i", scope: !163, file: !69, line: 118, type: !60)
!163 = distinct !DILexicalBlock(scope: !68, file: !69, line: 117, column: 5)
!164 = !DILocation(line: 118, column: 13, scope: !163)
!165 = !DILocalVariable(name: "buffer", scope: !163, file: !69, line: 119, type: !59)
!166 = !DILocation(line: 119, column: 15, scope: !163)
!167 = !DILocation(line: 119, column: 31, scope: !163)
!168 = !DILocation(line: 119, column: 24, scope: !163)
!169 = !DILocation(line: 120, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !69, line: 120, column: 13)
!171 = !DILocation(line: 120, column: 20, scope: !170)
!172 = !DILocation(line: 120, column: 13, scope: !163)
!173 = !DILocation(line: 120, column: 30, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !69, line: 120, column: 29)
!175 = !DILocation(line: 122, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !163, file: !69, line: 122, column: 9)
!177 = !DILocation(line: 122, column: 14, scope: !176)
!178 = !DILocation(line: 122, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !69, line: 122, column: 9)
!180 = !DILocation(line: 122, column: 23, scope: !179)
!181 = !DILocation(line: 122, column: 9, scope: !176)
!182 = !DILocation(line: 124, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !69, line: 123, column: 9)
!184 = !DILocation(line: 124, column: 20, scope: !183)
!185 = !DILocation(line: 124, column: 23, scope: !183)
!186 = !DILocation(line: 125, column: 9, scope: !183)
!187 = !DILocation(line: 122, column: 30, scope: !179)
!188 = !DILocation(line: 122, column: 9, scope: !179)
!189 = distinct !{!189, !181, !190, !191}
!190 = !DILocation(line: 125, column: 9, scope: !176)
!191 = !{!"llvm.loop.mustprogress"}
!192 = !DILocation(line: 128, column: 13, scope: !193)
!193 = distinct !DILexicalBlock(scope: !163, file: !69, line: 128, column: 13)
!194 = !DILocation(line: 128, column: 18, scope: !193)
!195 = !DILocation(line: 128, column: 13, scope: !163)
!196 = !DILocation(line: 130, column: 13, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !69, line: 129, column: 9)
!198 = !DILocation(line: 130, column: 20, scope: !197)
!199 = !DILocation(line: 130, column: 26, scope: !197)
!200 = !DILocation(line: 132, column: 19, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !69, line: 132, column: 13)
!202 = !DILocation(line: 132, column: 17, scope: !201)
!203 = !DILocation(line: 132, column: 24, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !69, line: 132, column: 13)
!205 = !DILocation(line: 132, column: 26, scope: !204)
!206 = !DILocation(line: 132, column: 13, scope: !201)
!207 = !DILocation(line: 134, column: 30, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !69, line: 133, column: 13)
!209 = !DILocation(line: 134, column: 37, scope: !208)
!210 = !DILocation(line: 134, column: 17, scope: !208)
!211 = !DILocation(line: 135, column: 13, scope: !208)
!212 = !DILocation(line: 132, column: 33, scope: !204)
!213 = !DILocation(line: 132, column: 13, scope: !204)
!214 = distinct !{!214, !206, !215, !191}
!215 = !DILocation(line: 135, column: 13, scope: !201)
!216 = !DILocation(line: 136, column: 9, scope: !197)
!217 = !DILocation(line: 139, column: 13, scope: !218)
!218 = distinct !DILexicalBlock(scope: !193, file: !69, line: 138, column: 9)
!219 = !DILocation(line: 141, column: 14, scope: !163)
!220 = !DILocation(line: 141, column: 9, scope: !163)
!221 = !DILocation(line: 149, column: 1, scope: !68)
!222 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_good", scope: !69, file: !69, line: 479, type: !70, scopeLine: 480, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!223 = !DILocation(line: 481, column: 5, scope: !222)
!224 = !DILocation(line: 482, column: 5, scope: !222)
!225 = !DILocation(line: 483, column: 5, scope: !222)
!226 = !DILocation(line: 484, column: 5, scope: !222)
!227 = !DILocation(line: 485, column: 1, scope: !222)
!228 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 496, type: !229, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!229 = !DISubroutineType(types: !230)
!230 = !{!60, !60, !231}
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!233 = !DILocalVariable(name: "argc", arg: 1, scope: !228, file: !69, line: 496, type: !60)
!234 = !DILocation(line: 496, column: 14, scope: !228)
!235 = !DILocalVariable(name: "argv", arg: 2, scope: !228, file: !69, line: 496, type: !231)
!236 = !DILocation(line: 496, column: 27, scope: !228)
!237 = !DILocation(line: 499, column: 22, scope: !228)
!238 = !DILocation(line: 499, column: 12, scope: !228)
!239 = !DILocation(line: 499, column: 5, scope: !228)
!240 = !DILocation(line: 501, column: 5, scope: !228)
!241 = !DILocation(line: 502, column: 5, scope: !228)
!242 = !DILocation(line: 503, column: 5, scope: !228)
!243 = !DILocation(line: 506, column: 5, scope: !228)
!244 = !DILocation(line: 507, column: 5, scope: !228)
!245 = !DILocation(line: 508, column: 5, scope: !228)
!246 = !DILocation(line: 510, column: 5, scope: !228)
!247 = distinct !DISubprogram(name: "goodB2G1", scope: !69, file: !69, line: 156, type: !70, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!248 = !DILocalVariable(name: "data", scope: !247, file: !69, line: 158, type: !60)
!249 = !DILocation(line: 158, column: 9, scope: !247)
!250 = !DILocation(line: 160, column: 10, scope: !247)
!251 = !DILocalVariable(name: "recvResult", scope: !252, file: !69, line: 169, type: !60)
!252 = distinct !DILexicalBlock(scope: !247, file: !69, line: 164, column: 5)
!253 = !DILocation(line: 169, column: 13, scope: !252)
!254 = !DILocalVariable(name: "service", scope: !252, file: !69, line: 170, type: !80)
!255 = !DILocation(line: 170, column: 28, scope: !252)
!256 = !DILocalVariable(name: "connectSocket", scope: !252, file: !69, line: 171, type: !60)
!257 = !DILocation(line: 171, column: 16, scope: !252)
!258 = !DILocalVariable(name: "inputBuffer", scope: !252, file: !69, line: 172, type: !55)
!259 = !DILocation(line: 172, column: 14, scope: !252)
!260 = !DILocation(line: 173, column: 9, scope: !252)
!261 = !DILocation(line: 183, column: 29, scope: !262)
!262 = distinct !DILexicalBlock(scope: !252, file: !69, line: 174, column: 9)
!263 = !DILocation(line: 183, column: 27, scope: !262)
!264 = !DILocation(line: 184, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !69, line: 184, column: 17)
!266 = !DILocation(line: 184, column: 31, scope: !265)
!267 = !DILocation(line: 184, column: 17, scope: !262)
!268 = !DILocation(line: 186, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !69, line: 185, column: 13)
!270 = !DILocation(line: 188, column: 13, scope: !262)
!271 = !DILocation(line: 189, column: 21, scope: !262)
!272 = !DILocation(line: 189, column: 32, scope: !262)
!273 = !DILocation(line: 190, column: 39, scope: !262)
!274 = !DILocation(line: 190, column: 21, scope: !262)
!275 = !DILocation(line: 190, column: 30, scope: !262)
!276 = !DILocation(line: 190, column: 37, scope: !262)
!277 = !DILocation(line: 191, column: 32, scope: !262)
!278 = !DILocation(line: 191, column: 21, scope: !262)
!279 = !DILocation(line: 191, column: 30, scope: !262)
!280 = !DILocation(line: 192, column: 25, scope: !281)
!281 = distinct !DILexicalBlock(scope: !262, file: !69, line: 192, column: 17)
!282 = !DILocation(line: 192, column: 40, scope: !281)
!283 = !DILocation(line: 192, column: 17, scope: !281)
!284 = !DILocation(line: 192, column: 85, scope: !281)
!285 = !DILocation(line: 192, column: 17, scope: !262)
!286 = !DILocation(line: 194, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !281, file: !69, line: 193, column: 13)
!288 = !DILocation(line: 198, column: 31, scope: !262)
!289 = !DILocation(line: 198, column: 46, scope: !262)
!290 = !DILocation(line: 198, column: 26, scope: !262)
!291 = !DILocation(line: 198, column: 24, scope: !262)
!292 = !DILocation(line: 199, column: 17, scope: !293)
!293 = distinct !DILexicalBlock(scope: !262, file: !69, line: 199, column: 17)
!294 = !DILocation(line: 199, column: 28, scope: !293)
!295 = !DILocation(line: 199, column: 44, scope: !293)
!296 = !DILocation(line: 199, column: 47, scope: !293)
!297 = !DILocation(line: 199, column: 58, scope: !293)
!298 = !DILocation(line: 199, column: 17, scope: !262)
!299 = !DILocation(line: 201, column: 17, scope: !300)
!300 = distinct !DILexicalBlock(scope: !293, file: !69, line: 200, column: 13)
!301 = !DILocation(line: 204, column: 25, scope: !262)
!302 = !DILocation(line: 204, column: 13, scope: !262)
!303 = !DILocation(line: 204, column: 37, scope: !262)
!304 = !DILocation(line: 206, column: 25, scope: !262)
!305 = !DILocation(line: 206, column: 20, scope: !262)
!306 = !DILocation(line: 206, column: 18, scope: !262)
!307 = !DILocation(line: 207, column: 9, scope: !262)
!308 = !DILocation(line: 209, column: 13, scope: !309)
!309 = distinct !DILexicalBlock(scope: !252, file: !69, line: 209, column: 13)
!310 = !DILocation(line: 209, column: 27, scope: !309)
!311 = !DILocation(line: 209, column: 13, scope: !252)
!312 = !DILocation(line: 211, column: 26, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !69, line: 210, column: 9)
!314 = !DILocation(line: 211, column: 13, scope: !313)
!315 = !DILocation(line: 212, column: 9, scope: !313)
!316 = !DILocalVariable(name: "i", scope: !317, file: !69, line: 234, type: !60)
!317 = distinct !DILexicalBlock(scope: !247, file: !69, line: 233, column: 5)
!318 = !DILocation(line: 234, column: 13, scope: !317)
!319 = !DILocalVariable(name: "buffer", scope: !317, file: !69, line: 235, type: !59)
!320 = !DILocation(line: 235, column: 15, scope: !317)
!321 = !DILocation(line: 235, column: 31, scope: !317)
!322 = !DILocation(line: 235, column: 24, scope: !317)
!323 = !DILocation(line: 236, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !317, file: !69, line: 236, column: 13)
!325 = !DILocation(line: 236, column: 20, scope: !324)
!326 = !DILocation(line: 236, column: 13, scope: !317)
!327 = !DILocation(line: 236, column: 30, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !69, line: 236, column: 29)
!329 = !DILocation(line: 238, column: 16, scope: !330)
!330 = distinct !DILexicalBlock(scope: !317, file: !69, line: 238, column: 9)
!331 = !DILocation(line: 238, column: 14, scope: !330)
!332 = !DILocation(line: 238, column: 21, scope: !333)
!333 = distinct !DILexicalBlock(scope: !330, file: !69, line: 238, column: 9)
!334 = !DILocation(line: 238, column: 23, scope: !333)
!335 = !DILocation(line: 238, column: 9, scope: !330)
!336 = !DILocation(line: 240, column: 13, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !69, line: 239, column: 9)
!338 = !DILocation(line: 240, column: 20, scope: !337)
!339 = !DILocation(line: 240, column: 23, scope: !337)
!340 = !DILocation(line: 241, column: 9, scope: !337)
!341 = !DILocation(line: 238, column: 30, scope: !333)
!342 = !DILocation(line: 238, column: 9, scope: !333)
!343 = distinct !{!343, !335, !344, !191}
!344 = !DILocation(line: 241, column: 9, scope: !330)
!345 = !DILocation(line: 243, column: 13, scope: !346)
!346 = distinct !DILexicalBlock(scope: !317, file: !69, line: 243, column: 13)
!347 = !DILocation(line: 243, column: 18, scope: !346)
!348 = !DILocation(line: 243, column: 23, scope: !346)
!349 = !DILocation(line: 243, column: 26, scope: !346)
!350 = !DILocation(line: 243, column: 31, scope: !346)
!351 = !DILocation(line: 243, column: 13, scope: !317)
!352 = !DILocation(line: 245, column: 13, scope: !353)
!353 = distinct !DILexicalBlock(scope: !346, file: !69, line: 244, column: 9)
!354 = !DILocation(line: 245, column: 20, scope: !353)
!355 = !DILocation(line: 245, column: 26, scope: !353)
!356 = !DILocation(line: 247, column: 19, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !69, line: 247, column: 13)
!358 = !DILocation(line: 247, column: 17, scope: !357)
!359 = !DILocation(line: 247, column: 24, scope: !360)
!360 = distinct !DILexicalBlock(scope: !357, file: !69, line: 247, column: 13)
!361 = !DILocation(line: 247, column: 26, scope: !360)
!362 = !DILocation(line: 247, column: 13, scope: !357)
!363 = !DILocation(line: 249, column: 30, scope: !364)
!364 = distinct !DILexicalBlock(scope: !360, file: !69, line: 248, column: 13)
!365 = !DILocation(line: 249, column: 37, scope: !364)
!366 = !DILocation(line: 249, column: 17, scope: !364)
!367 = !DILocation(line: 250, column: 13, scope: !364)
!368 = !DILocation(line: 247, column: 33, scope: !360)
!369 = !DILocation(line: 247, column: 13, scope: !360)
!370 = distinct !{!370, !362, !371, !191}
!371 = !DILocation(line: 250, column: 13, scope: !357)
!372 = !DILocation(line: 251, column: 9, scope: !353)
!373 = !DILocation(line: 254, column: 13, scope: !374)
!374 = distinct !DILexicalBlock(scope: !346, file: !69, line: 253, column: 9)
!375 = !DILocation(line: 256, column: 14, scope: !317)
!376 = !DILocation(line: 256, column: 9, scope: !317)
!377 = !DILocation(line: 260, column: 1, scope: !247)
!378 = distinct !DISubprogram(name: "goodB2G2", scope: !69, file: !69, line: 263, type: !70, scopeLine: 264, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!379 = !DILocalVariable(name: "data", scope: !378, file: !69, line: 265, type: !60)
!380 = !DILocation(line: 265, column: 9, scope: !378)
!381 = !DILocation(line: 267, column: 10, scope: !378)
!382 = !DILocalVariable(name: "recvResult", scope: !383, file: !69, line: 276, type: !60)
!383 = distinct !DILexicalBlock(scope: !378, file: !69, line: 271, column: 5)
!384 = !DILocation(line: 276, column: 13, scope: !383)
!385 = !DILocalVariable(name: "service", scope: !383, file: !69, line: 277, type: !80)
!386 = !DILocation(line: 277, column: 28, scope: !383)
!387 = !DILocalVariable(name: "connectSocket", scope: !383, file: !69, line: 278, type: !60)
!388 = !DILocation(line: 278, column: 16, scope: !383)
!389 = !DILocalVariable(name: "inputBuffer", scope: !383, file: !69, line: 279, type: !55)
!390 = !DILocation(line: 279, column: 14, scope: !383)
!391 = !DILocation(line: 280, column: 9, scope: !383)
!392 = !DILocation(line: 290, column: 29, scope: !393)
!393 = distinct !DILexicalBlock(scope: !383, file: !69, line: 281, column: 9)
!394 = !DILocation(line: 290, column: 27, scope: !393)
!395 = !DILocation(line: 291, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !393, file: !69, line: 291, column: 17)
!397 = !DILocation(line: 291, column: 31, scope: !396)
!398 = !DILocation(line: 291, column: 17, scope: !393)
!399 = !DILocation(line: 293, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !69, line: 292, column: 13)
!401 = !DILocation(line: 295, column: 13, scope: !393)
!402 = !DILocation(line: 296, column: 21, scope: !393)
!403 = !DILocation(line: 296, column: 32, scope: !393)
!404 = !DILocation(line: 297, column: 39, scope: !393)
!405 = !DILocation(line: 297, column: 21, scope: !393)
!406 = !DILocation(line: 297, column: 30, scope: !393)
!407 = !DILocation(line: 297, column: 37, scope: !393)
!408 = !DILocation(line: 298, column: 32, scope: !393)
!409 = !DILocation(line: 298, column: 21, scope: !393)
!410 = !DILocation(line: 298, column: 30, scope: !393)
!411 = !DILocation(line: 299, column: 25, scope: !412)
!412 = distinct !DILexicalBlock(scope: !393, file: !69, line: 299, column: 17)
!413 = !DILocation(line: 299, column: 40, scope: !412)
!414 = !DILocation(line: 299, column: 17, scope: !412)
!415 = !DILocation(line: 299, column: 85, scope: !412)
!416 = !DILocation(line: 299, column: 17, scope: !393)
!417 = !DILocation(line: 301, column: 17, scope: !418)
!418 = distinct !DILexicalBlock(scope: !412, file: !69, line: 300, column: 13)
!419 = !DILocation(line: 305, column: 31, scope: !393)
!420 = !DILocation(line: 305, column: 46, scope: !393)
!421 = !DILocation(line: 305, column: 26, scope: !393)
!422 = !DILocation(line: 305, column: 24, scope: !393)
!423 = !DILocation(line: 306, column: 17, scope: !424)
!424 = distinct !DILexicalBlock(scope: !393, file: !69, line: 306, column: 17)
!425 = !DILocation(line: 306, column: 28, scope: !424)
!426 = !DILocation(line: 306, column: 44, scope: !424)
!427 = !DILocation(line: 306, column: 47, scope: !424)
!428 = !DILocation(line: 306, column: 58, scope: !424)
!429 = !DILocation(line: 306, column: 17, scope: !393)
!430 = !DILocation(line: 308, column: 17, scope: !431)
!431 = distinct !DILexicalBlock(scope: !424, file: !69, line: 307, column: 13)
!432 = !DILocation(line: 311, column: 25, scope: !393)
!433 = !DILocation(line: 311, column: 13, scope: !393)
!434 = !DILocation(line: 311, column: 37, scope: !393)
!435 = !DILocation(line: 313, column: 25, scope: !393)
!436 = !DILocation(line: 313, column: 20, scope: !393)
!437 = !DILocation(line: 313, column: 18, scope: !393)
!438 = !DILocation(line: 314, column: 9, scope: !393)
!439 = !DILocation(line: 316, column: 13, scope: !440)
!440 = distinct !DILexicalBlock(scope: !383, file: !69, line: 316, column: 13)
!441 = !DILocation(line: 316, column: 27, scope: !440)
!442 = !DILocation(line: 316, column: 13, scope: !383)
!443 = !DILocation(line: 318, column: 26, scope: !444)
!444 = distinct !DILexicalBlock(scope: !440, file: !69, line: 317, column: 9)
!445 = !DILocation(line: 318, column: 13, scope: !444)
!446 = !DILocation(line: 319, column: 9, scope: !444)
!447 = !DILocalVariable(name: "i", scope: !448, file: !69, line: 337, type: !60)
!448 = distinct !DILexicalBlock(scope: !378, file: !69, line: 336, column: 5)
!449 = !DILocation(line: 337, column: 13, scope: !448)
!450 = !DILocalVariable(name: "buffer", scope: !448, file: !69, line: 338, type: !59)
!451 = !DILocation(line: 338, column: 15, scope: !448)
!452 = !DILocation(line: 338, column: 31, scope: !448)
!453 = !DILocation(line: 338, column: 24, scope: !448)
!454 = !DILocation(line: 339, column: 13, scope: !455)
!455 = distinct !DILexicalBlock(scope: !448, file: !69, line: 339, column: 13)
!456 = !DILocation(line: 339, column: 20, scope: !455)
!457 = !DILocation(line: 339, column: 13, scope: !448)
!458 = !DILocation(line: 339, column: 30, scope: !459)
!459 = distinct !DILexicalBlock(scope: !455, file: !69, line: 339, column: 29)
!460 = !DILocation(line: 341, column: 16, scope: !461)
!461 = distinct !DILexicalBlock(scope: !448, file: !69, line: 341, column: 9)
!462 = !DILocation(line: 341, column: 14, scope: !461)
!463 = !DILocation(line: 341, column: 21, scope: !464)
!464 = distinct !DILexicalBlock(scope: !461, file: !69, line: 341, column: 9)
!465 = !DILocation(line: 341, column: 23, scope: !464)
!466 = !DILocation(line: 341, column: 9, scope: !461)
!467 = !DILocation(line: 343, column: 13, scope: !468)
!468 = distinct !DILexicalBlock(scope: !464, file: !69, line: 342, column: 9)
!469 = !DILocation(line: 343, column: 20, scope: !468)
!470 = !DILocation(line: 343, column: 23, scope: !468)
!471 = !DILocation(line: 344, column: 9, scope: !468)
!472 = !DILocation(line: 341, column: 30, scope: !464)
!473 = !DILocation(line: 341, column: 9, scope: !464)
!474 = distinct !{!474, !466, !475, !191}
!475 = !DILocation(line: 344, column: 9, scope: !461)
!476 = !DILocation(line: 346, column: 13, scope: !477)
!477 = distinct !DILexicalBlock(scope: !448, file: !69, line: 346, column: 13)
!478 = !DILocation(line: 346, column: 18, scope: !477)
!479 = !DILocation(line: 346, column: 23, scope: !477)
!480 = !DILocation(line: 346, column: 26, scope: !477)
!481 = !DILocation(line: 346, column: 31, scope: !477)
!482 = !DILocation(line: 346, column: 13, scope: !448)
!483 = !DILocation(line: 348, column: 13, scope: !484)
!484 = distinct !DILexicalBlock(scope: !477, file: !69, line: 347, column: 9)
!485 = !DILocation(line: 348, column: 20, scope: !484)
!486 = !DILocation(line: 348, column: 26, scope: !484)
!487 = !DILocation(line: 350, column: 19, scope: !488)
!488 = distinct !DILexicalBlock(scope: !484, file: !69, line: 350, column: 13)
!489 = !DILocation(line: 350, column: 17, scope: !488)
!490 = !DILocation(line: 350, column: 24, scope: !491)
!491 = distinct !DILexicalBlock(scope: !488, file: !69, line: 350, column: 13)
!492 = !DILocation(line: 350, column: 26, scope: !491)
!493 = !DILocation(line: 350, column: 13, scope: !488)
!494 = !DILocation(line: 352, column: 30, scope: !495)
!495 = distinct !DILexicalBlock(scope: !491, file: !69, line: 351, column: 13)
!496 = !DILocation(line: 352, column: 37, scope: !495)
!497 = !DILocation(line: 352, column: 17, scope: !495)
!498 = !DILocation(line: 353, column: 13, scope: !495)
!499 = !DILocation(line: 350, column: 33, scope: !491)
!500 = !DILocation(line: 350, column: 13, scope: !491)
!501 = distinct !{!501, !493, !502, !191}
!502 = !DILocation(line: 353, column: 13, scope: !488)
!503 = !DILocation(line: 354, column: 9, scope: !484)
!504 = !DILocation(line: 357, column: 13, scope: !505)
!505 = distinct !DILexicalBlock(scope: !477, file: !69, line: 356, column: 9)
!506 = !DILocation(line: 359, column: 14, scope: !448)
!507 = !DILocation(line: 359, column: 9, scope: !448)
!508 = !DILocation(line: 367, column: 1, scope: !378)
!509 = distinct !DISubprogram(name: "goodG2B1", scope: !69, file: !69, line: 370, type: !70, scopeLine: 371, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!510 = !DILocalVariable(name: "data", scope: !509, file: !69, line: 372, type: !60)
!511 = !DILocation(line: 372, column: 9, scope: !509)
!512 = !DILocation(line: 374, column: 10, scope: !509)
!513 = !DILocation(line: 384, column: 14, scope: !509)
!514 = !DILocalVariable(name: "i", scope: !515, file: !69, line: 391, type: !60)
!515 = distinct !DILexicalBlock(scope: !509, file: !69, line: 390, column: 5)
!516 = !DILocation(line: 391, column: 13, scope: !515)
!517 = !DILocalVariable(name: "buffer", scope: !515, file: !69, line: 392, type: !59)
!518 = !DILocation(line: 392, column: 15, scope: !515)
!519 = !DILocation(line: 392, column: 31, scope: !515)
!520 = !DILocation(line: 392, column: 24, scope: !515)
!521 = !DILocation(line: 393, column: 13, scope: !522)
!522 = distinct !DILexicalBlock(scope: !515, file: !69, line: 393, column: 13)
!523 = !DILocation(line: 393, column: 20, scope: !522)
!524 = !DILocation(line: 393, column: 13, scope: !515)
!525 = !DILocation(line: 393, column: 30, scope: !526)
!526 = distinct !DILexicalBlock(scope: !522, file: !69, line: 393, column: 29)
!527 = !DILocation(line: 395, column: 16, scope: !528)
!528 = distinct !DILexicalBlock(scope: !515, file: !69, line: 395, column: 9)
!529 = !DILocation(line: 395, column: 14, scope: !528)
!530 = !DILocation(line: 395, column: 21, scope: !531)
!531 = distinct !DILexicalBlock(scope: !528, file: !69, line: 395, column: 9)
!532 = !DILocation(line: 395, column: 23, scope: !531)
!533 = !DILocation(line: 395, column: 9, scope: !528)
!534 = !DILocation(line: 397, column: 13, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !69, line: 396, column: 9)
!536 = !DILocation(line: 397, column: 20, scope: !535)
!537 = !DILocation(line: 397, column: 23, scope: !535)
!538 = !DILocation(line: 398, column: 9, scope: !535)
!539 = !DILocation(line: 395, column: 30, scope: !531)
!540 = !DILocation(line: 395, column: 9, scope: !531)
!541 = distinct !{!541, !533, !542, !191}
!542 = !DILocation(line: 398, column: 9, scope: !528)
!543 = !DILocation(line: 401, column: 13, scope: !544)
!544 = distinct !DILexicalBlock(scope: !515, file: !69, line: 401, column: 13)
!545 = !DILocation(line: 401, column: 18, scope: !544)
!546 = !DILocation(line: 401, column: 13, scope: !515)
!547 = !DILocation(line: 403, column: 13, scope: !548)
!548 = distinct !DILexicalBlock(scope: !544, file: !69, line: 402, column: 9)
!549 = !DILocation(line: 403, column: 20, scope: !548)
!550 = !DILocation(line: 403, column: 26, scope: !548)
!551 = !DILocation(line: 405, column: 19, scope: !552)
!552 = distinct !DILexicalBlock(scope: !548, file: !69, line: 405, column: 13)
!553 = !DILocation(line: 405, column: 17, scope: !552)
!554 = !DILocation(line: 405, column: 24, scope: !555)
!555 = distinct !DILexicalBlock(scope: !552, file: !69, line: 405, column: 13)
!556 = !DILocation(line: 405, column: 26, scope: !555)
!557 = !DILocation(line: 405, column: 13, scope: !552)
!558 = !DILocation(line: 407, column: 30, scope: !559)
!559 = distinct !DILexicalBlock(scope: !555, file: !69, line: 406, column: 13)
!560 = !DILocation(line: 407, column: 37, scope: !559)
!561 = !DILocation(line: 407, column: 17, scope: !559)
!562 = !DILocation(line: 408, column: 13, scope: !559)
!563 = !DILocation(line: 405, column: 33, scope: !555)
!564 = !DILocation(line: 405, column: 13, scope: !555)
!565 = distinct !{!565, !557, !566, !191}
!566 = !DILocation(line: 408, column: 13, scope: !552)
!567 = !DILocation(line: 409, column: 9, scope: !548)
!568 = !DILocation(line: 412, column: 13, scope: !569)
!569 = distinct !DILexicalBlock(scope: !544, file: !69, line: 411, column: 9)
!570 = !DILocation(line: 414, column: 14, scope: !515)
!571 = !DILocation(line: 414, column: 9, scope: !515)
!572 = !DILocation(line: 422, column: 1, scope: !509)
!573 = distinct !DISubprogram(name: "goodG2B2", scope: !69, file: !69, line: 425, type: !70, scopeLine: 426, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!574 = !DILocalVariable(name: "data", scope: !573, file: !69, line: 427, type: !60)
!575 = !DILocation(line: 427, column: 9, scope: !573)
!576 = !DILocation(line: 429, column: 10, scope: !573)
!577 = !DILocation(line: 435, column: 14, scope: !573)
!578 = !DILocalVariable(name: "i", scope: !579, file: !69, line: 446, type: !60)
!579 = distinct !DILexicalBlock(scope: !573, file: !69, line: 445, column: 5)
!580 = !DILocation(line: 446, column: 13, scope: !579)
!581 = !DILocalVariable(name: "buffer", scope: !579, file: !69, line: 447, type: !59)
!582 = !DILocation(line: 447, column: 15, scope: !579)
!583 = !DILocation(line: 447, column: 31, scope: !579)
!584 = !DILocation(line: 447, column: 24, scope: !579)
!585 = !DILocation(line: 448, column: 13, scope: !586)
!586 = distinct !DILexicalBlock(scope: !579, file: !69, line: 448, column: 13)
!587 = !DILocation(line: 448, column: 20, scope: !586)
!588 = !DILocation(line: 448, column: 13, scope: !579)
!589 = !DILocation(line: 448, column: 30, scope: !590)
!590 = distinct !DILexicalBlock(scope: !586, file: !69, line: 448, column: 29)
!591 = !DILocation(line: 450, column: 16, scope: !592)
!592 = distinct !DILexicalBlock(scope: !579, file: !69, line: 450, column: 9)
!593 = !DILocation(line: 450, column: 14, scope: !592)
!594 = !DILocation(line: 450, column: 21, scope: !595)
!595 = distinct !DILexicalBlock(scope: !592, file: !69, line: 450, column: 9)
!596 = !DILocation(line: 450, column: 23, scope: !595)
!597 = !DILocation(line: 450, column: 9, scope: !592)
!598 = !DILocation(line: 452, column: 13, scope: !599)
!599 = distinct !DILexicalBlock(scope: !595, file: !69, line: 451, column: 9)
!600 = !DILocation(line: 452, column: 20, scope: !599)
!601 = !DILocation(line: 452, column: 23, scope: !599)
!602 = !DILocation(line: 453, column: 9, scope: !599)
!603 = !DILocation(line: 450, column: 30, scope: !595)
!604 = !DILocation(line: 450, column: 9, scope: !595)
!605 = distinct !{!605, !597, !606, !191}
!606 = !DILocation(line: 453, column: 9, scope: !592)
!607 = !DILocation(line: 456, column: 13, scope: !608)
!608 = distinct !DILexicalBlock(scope: !579, file: !69, line: 456, column: 13)
!609 = !DILocation(line: 456, column: 18, scope: !608)
!610 = !DILocation(line: 456, column: 13, scope: !579)
!611 = !DILocation(line: 458, column: 13, scope: !612)
!612 = distinct !DILexicalBlock(scope: !608, file: !69, line: 457, column: 9)
!613 = !DILocation(line: 458, column: 20, scope: !612)
!614 = !DILocation(line: 458, column: 26, scope: !612)
!615 = !DILocation(line: 460, column: 19, scope: !616)
!616 = distinct !DILexicalBlock(scope: !612, file: !69, line: 460, column: 13)
!617 = !DILocation(line: 460, column: 17, scope: !616)
!618 = !DILocation(line: 460, column: 24, scope: !619)
!619 = distinct !DILexicalBlock(scope: !616, file: !69, line: 460, column: 13)
!620 = !DILocation(line: 460, column: 26, scope: !619)
!621 = !DILocation(line: 460, column: 13, scope: !616)
!622 = !DILocation(line: 462, column: 30, scope: !623)
!623 = distinct !DILexicalBlock(scope: !619, file: !69, line: 461, column: 13)
!624 = !DILocation(line: 462, column: 37, scope: !623)
!625 = !DILocation(line: 462, column: 17, scope: !623)
!626 = !DILocation(line: 463, column: 13, scope: !623)
!627 = !DILocation(line: 460, column: 33, scope: !619)
!628 = !DILocation(line: 460, column: 13, scope: !619)
!629 = distinct !{!629, !621, !630, !191}
!630 = !DILocation(line: 463, column: 13, scope: !616)
!631 = !DILocation(line: 464, column: 9, scope: !612)
!632 = !DILocation(line: 467, column: 13, scope: !633)
!633 = distinct !DILexicalBlock(scope: !608, file: !69, line: 466, column: 9)
!634 = !DILocation(line: 469, column: 14, scope: !579)
!635 = !DILocation(line: 469, column: 9, scope: !579)
!636 = !DILocation(line: 477, column: 1, scope: !573)
