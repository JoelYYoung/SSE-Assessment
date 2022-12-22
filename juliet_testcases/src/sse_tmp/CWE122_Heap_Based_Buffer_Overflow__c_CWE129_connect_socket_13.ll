; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_13.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_13_bad() #0 !dbg !68 {
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
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !76
  %cmp = icmp eq i32 %0, 5, !dbg !78
  br i1 %cmp, label %if.then, label %if.end23, !dbg !79

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !80, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !84, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %connectSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  br label %do.body, !dbg !111

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !112
  store i32 %call, i32* %connectSocket, align 4, !dbg !114
  %1 = load i32, i32* %connectSocket, align 4, !dbg !115
  %cmp1 = icmp eq i32 %1, -1, !dbg !117
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !118

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !119

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !121
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !122
  store i16 2, i16* %sin_family, align 4, !dbg !123
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !124
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !125
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !126
  store i32 %call3, i32* %s_addr, align 4, !dbg !127
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !128
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !129
  store i16 %call4, i16* %sin_port, align 2, !dbg !130
  %3 = load i32, i32* %connectSocket, align 4, !dbg !131
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !133
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !134
  %cmp6 = icmp eq i32 %call5, -1, !dbg !135
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !136

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !137

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !139
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !140
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !141
  %conv = trunc i64 %call9 to i32, !dbg !141
  store i32 %conv, i32* %recvResult, align 4, !dbg !142
  %6 = load i32, i32* %recvResult, align 4, !dbg !143
  %cmp10 = icmp eq i32 %6, -1, !dbg !145
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !146

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !147
  %cmp12 = icmp eq i32 %7, 0, !dbg !148
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !149

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !150

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !152
  %idxprom = sext i32 %8 to i64, !dbg !153
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call17 = call i32 @atoi(i8* %arraydecay16) #10, !dbg !156
  store i32 %call17, i32* %data, align 4, !dbg !157
  br label %do.end, !dbg !158

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !159
  %cmp18 = icmp ne i32 %9, -1, !dbg !161
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !162

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !163
  %call21 = call i32 @close(i32 %10), !dbg !165
  br label %if.end22, !dbg !166

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !167

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !168
  %cmp24 = icmp eq i32 %11, 5, !dbg !170
  br i1 %cmp24, label %if.then26, label %if.end51, !dbg !171

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !172, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !176, metadata !DIExpression()), !dbg !177
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !178
  %12 = bitcast i8* %call27 to i32*, !dbg !179
  store i32* %12, i32** %buffer, align 8, !dbg !177
  %13 = load i32*, i32** %buffer, align 8, !dbg !180
  %cmp28 = icmp eq i32* %13, null, !dbg !182
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !183

if.then30:                                        ; preds = %if.then26
  call void @exit(i32 -1) #11, !dbg !184
  unreachable, !dbg !184

if.end31:                                         ; preds = %if.then26
  store i32 0, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end31
  %14 = load i32, i32* %i, align 4, !dbg !189
  %cmp32 = icmp slt i32 %14, 10, !dbg !191
  br i1 %cmp32, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !193
  %16 = load i32, i32* %i, align 4, !dbg !195
  %idxprom34 = sext i32 %16 to i64, !dbg !193
  %arrayidx35 = getelementptr inbounds i32, i32* %15, i64 %idxprom34, !dbg !193
  store i32 0, i32* %arrayidx35, align 4, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !198
  %inc = add nsw i32 %17, 1, !dbg !198
  store i32 %inc, i32* %i, align 4, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !203
  %cmp36 = icmp sge i32 %18, 0, !dbg !205
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !206

if.then38:                                        ; preds = %for.end
  %19 = load i32*, i32** %buffer, align 8, !dbg !207
  %20 = load i32, i32* %data, align 4, !dbg !209
  %idxprom39 = sext i32 %20 to i64, !dbg !207
  %arrayidx40 = getelementptr inbounds i32, i32* %19, i64 %idxprom39, !dbg !207
  store i32 1, i32* %arrayidx40, align 4, !dbg !210
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond41, !dbg !213

for.cond41:                                       ; preds = %for.inc47, %if.then38
  %21 = load i32, i32* %i, align 4, !dbg !214
  %cmp42 = icmp slt i32 %21, 10, !dbg !216
  br i1 %cmp42, label %for.body44, label %for.end49, !dbg !217

for.body44:                                       ; preds = %for.cond41
  %22 = load i32*, i32** %buffer, align 8, !dbg !218
  %23 = load i32, i32* %i, align 4, !dbg !220
  %idxprom45 = sext i32 %23 to i64, !dbg !218
  %arrayidx46 = getelementptr inbounds i32, i32* %22, i64 %idxprom45, !dbg !218
  %24 = load i32, i32* %arrayidx46, align 4, !dbg !218
  call void @printIntLine(i32 %24), !dbg !221
  br label %for.inc47, !dbg !222

for.inc47:                                        ; preds = %for.body44
  %25 = load i32, i32* %i, align 4, !dbg !223
  %inc48 = add nsw i32 %25, 1, !dbg !223
  store i32 %inc48, i32* %i, align 4, !dbg !223
  br label %for.cond41, !dbg !224, !llvm.loop !225

for.end49:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !227

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !228
  br label %if.end50

if.end50:                                         ; preds = %if.else, %for.end49
  %26 = load i32*, i32** %buffer, align 8, !dbg !230
  %27 = bitcast i32* %26 to i8*, !dbg !230
  call void @free(i8* %27) #8, !dbg !231
  br label %if.end51, !dbg !232

if.end51:                                         ; preds = %if.end50, %if.end23
  ret void, !dbg !233
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_13_good() #0 !dbg !234 {
entry:
  call void @goodB2G1(), !dbg !235
  call void @goodB2G2(), !dbg !236
  call void @goodG2B1(), !dbg !237
  call void @goodG2B2(), !dbg !238
  ret void, !dbg !239
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !240 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !245, metadata !DIExpression()), !dbg !246
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !247, metadata !DIExpression()), !dbg !248
  %call = call i64 @time(i64* null) #8, !dbg !249
  %conv = trunc i64 %call to i32, !dbg !250
  call void @srand(i32 %conv) #8, !dbg !251
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !252
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_13_good(), !dbg !253
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !254
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !255
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_13_bad(), !dbg !256
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !257
  ret i32 0, !dbg !258
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !259 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !260, metadata !DIExpression()), !dbg !261
  store i32 -1, i32* %data, align 4, !dbg !262
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !263
  %cmp = icmp eq i32 %0, 5, !dbg !265
  br i1 %cmp, label %if.then, label %if.end23, !dbg !266

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !267, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !271, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !273, metadata !DIExpression()), !dbg !274
  store i32 -1, i32* %connectSocket, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !275, metadata !DIExpression()), !dbg !276
  br label %do.body, !dbg !277

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !278
  store i32 %call, i32* %connectSocket, align 4, !dbg !280
  %1 = load i32, i32* %connectSocket, align 4, !dbg !281
  %cmp1 = icmp eq i32 %1, -1, !dbg !283
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !284

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !285

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !287
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !287
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !288
  store i16 2, i16* %sin_family, align 4, !dbg !289
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !290
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !291
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !292
  store i32 %call3, i32* %s_addr, align 4, !dbg !293
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !294
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !295
  store i16 %call4, i16* %sin_port, align 2, !dbg !296
  %3 = load i32, i32* %connectSocket, align 4, !dbg !297
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !299
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !300
  %cmp6 = icmp eq i32 %call5, -1, !dbg !301
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !302

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !303

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !305
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !306
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !307
  %conv = trunc i64 %call9 to i32, !dbg !307
  store i32 %conv, i32* %recvResult, align 4, !dbg !308
  %6 = load i32, i32* %recvResult, align 4, !dbg !309
  %cmp10 = icmp eq i32 %6, -1, !dbg !311
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !312

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !313
  %cmp12 = icmp eq i32 %7, 0, !dbg !314
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !315

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !316

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !318
  %idxprom = sext i32 %8 to i64, !dbg !319
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !319
  store i8 0, i8* %arrayidx, align 1, !dbg !320
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !321
  %call17 = call i32 @atoi(i8* %arraydecay16) #10, !dbg !322
  store i32 %call17, i32* %data, align 4, !dbg !323
  br label %do.end, !dbg !324

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !325
  %cmp18 = icmp ne i32 %9, -1, !dbg !327
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !328

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !329
  %call21 = call i32 @close(i32 %10), !dbg !331
  br label %if.end22, !dbg !332

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !333

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !334
  %cmp24 = icmp ne i32 %11, 5, !dbg !336
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !337

if.then26:                                        ; preds = %if.end23
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !338
  br label %if.end54, !dbg !340

if.else:                                          ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !341, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !345, metadata !DIExpression()), !dbg !346
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !347
  %12 = bitcast i8* %call27 to i32*, !dbg !348
  store i32* %12, i32** %buffer, align 8, !dbg !346
  %13 = load i32*, i32** %buffer, align 8, !dbg !349
  %cmp28 = icmp eq i32* %13, null, !dbg !351
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !352

if.then30:                                        ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !353
  unreachable, !dbg !353

if.end31:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !355
  br label %for.cond, !dbg !357

for.cond:                                         ; preds = %for.inc, %if.end31
  %14 = load i32, i32* %i, align 4, !dbg !358
  %cmp32 = icmp slt i32 %14, 10, !dbg !360
  br i1 %cmp32, label %for.body, label %for.end, !dbg !361

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !362
  %16 = load i32, i32* %i, align 4, !dbg !364
  %idxprom34 = sext i32 %16 to i64, !dbg !362
  %arrayidx35 = getelementptr inbounds i32, i32* %15, i64 %idxprom34, !dbg !362
  store i32 0, i32* %arrayidx35, align 4, !dbg !365
  br label %for.inc, !dbg !366

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !367
  %inc = add nsw i32 %17, 1, !dbg !367
  store i32 %inc, i32* %i, align 4, !dbg !367
  br label %for.cond, !dbg !368, !llvm.loop !369

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !371
  %cmp36 = icmp sge i32 %18, 0, !dbg !373
  br i1 %cmp36, label %land.lhs.true, label %if.else52, !dbg !374

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* %data, align 4, !dbg !375
  %cmp38 = icmp slt i32 %19, 10, !dbg !376
  br i1 %cmp38, label %if.then40, label %if.else52, !dbg !377

if.then40:                                        ; preds = %land.lhs.true
  %20 = load i32*, i32** %buffer, align 8, !dbg !378
  %21 = load i32, i32* %data, align 4, !dbg !380
  %idxprom41 = sext i32 %21 to i64, !dbg !378
  %arrayidx42 = getelementptr inbounds i32, i32* %20, i64 %idxprom41, !dbg !378
  store i32 1, i32* %arrayidx42, align 4, !dbg !381
  store i32 0, i32* %i, align 4, !dbg !382
  br label %for.cond43, !dbg !384

for.cond43:                                       ; preds = %for.inc49, %if.then40
  %22 = load i32, i32* %i, align 4, !dbg !385
  %cmp44 = icmp slt i32 %22, 10, !dbg !387
  br i1 %cmp44, label %for.body46, label %for.end51, !dbg !388

for.body46:                                       ; preds = %for.cond43
  %23 = load i32*, i32** %buffer, align 8, !dbg !389
  %24 = load i32, i32* %i, align 4, !dbg !391
  %idxprom47 = sext i32 %24 to i64, !dbg !389
  %arrayidx48 = getelementptr inbounds i32, i32* %23, i64 %idxprom47, !dbg !389
  %25 = load i32, i32* %arrayidx48, align 4, !dbg !389
  call void @printIntLine(i32 %25), !dbg !392
  br label %for.inc49, !dbg !393

for.inc49:                                        ; preds = %for.body46
  %26 = load i32, i32* %i, align 4, !dbg !394
  %inc50 = add nsw i32 %26, 1, !dbg !394
  store i32 %inc50, i32* %i, align 4, !dbg !394
  br label %for.cond43, !dbg !395, !llvm.loop !396

for.end51:                                        ; preds = %for.cond43
  br label %if.end53, !dbg !398

if.else52:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !399
  br label %if.end53

if.end53:                                         ; preds = %if.else52, %for.end51
  %27 = load i32*, i32** %buffer, align 8, !dbg !401
  %28 = bitcast i32* %27 to i8*, !dbg !401
  call void @free(i8* %28) #8, !dbg !402
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.then26
  ret void, !dbg !403
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !404 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !405, metadata !DIExpression()), !dbg !406
  store i32 -1, i32* %data, align 4, !dbg !407
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !408
  %cmp = icmp eq i32 %0, 5, !dbg !410
  br i1 %cmp, label %if.then, label %if.end23, !dbg !411

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !412, metadata !DIExpression()), !dbg !415
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !416, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !418, metadata !DIExpression()), !dbg !419
  store i32 -1, i32* %connectSocket, align 4, !dbg !419
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !420, metadata !DIExpression()), !dbg !421
  br label %do.body, !dbg !422

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !423
  store i32 %call, i32* %connectSocket, align 4, !dbg !425
  %1 = load i32, i32* %connectSocket, align 4, !dbg !426
  %cmp1 = icmp eq i32 %1, -1, !dbg !428
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !429

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !430

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !432
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !432
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !433
  store i16 2, i16* %sin_family, align 4, !dbg !434
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !435
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !436
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !437
  store i32 %call3, i32* %s_addr, align 4, !dbg !438
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !439
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !440
  store i16 %call4, i16* %sin_port, align 2, !dbg !441
  %3 = load i32, i32* %connectSocket, align 4, !dbg !442
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !444
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !445
  %cmp6 = icmp eq i32 %call5, -1, !dbg !446
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !447

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !448

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !450
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !451
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !452
  %conv = trunc i64 %call9 to i32, !dbg !452
  store i32 %conv, i32* %recvResult, align 4, !dbg !453
  %6 = load i32, i32* %recvResult, align 4, !dbg !454
  %cmp10 = icmp eq i32 %6, -1, !dbg !456
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !457

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !458
  %cmp12 = icmp eq i32 %7, 0, !dbg !459
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !460

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !461

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !463
  %idxprom = sext i32 %8 to i64, !dbg !464
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !464
  store i8 0, i8* %arrayidx, align 1, !dbg !465
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !466
  %call17 = call i32 @atoi(i8* %arraydecay16) #10, !dbg !467
  store i32 %call17, i32* %data, align 4, !dbg !468
  br label %do.end, !dbg !469

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !470
  %cmp18 = icmp ne i32 %9, -1, !dbg !472
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !473

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !474
  %call21 = call i32 @close(i32 %10), !dbg !476
  br label %if.end22, !dbg !477

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !478

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !479
  %cmp24 = icmp eq i32 %11, 5, !dbg !481
  br i1 %cmp24, label %if.then26, label %if.end53, !dbg !482

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !483, metadata !DIExpression()), !dbg !486
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !487, metadata !DIExpression()), !dbg !488
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !489
  %12 = bitcast i8* %call27 to i32*, !dbg !490
  store i32* %12, i32** %buffer, align 8, !dbg !488
  %13 = load i32*, i32** %buffer, align 8, !dbg !491
  %cmp28 = icmp eq i32* %13, null, !dbg !493
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !494

if.then30:                                        ; preds = %if.then26
  call void @exit(i32 -1) #11, !dbg !495
  unreachable, !dbg !495

if.end31:                                         ; preds = %if.then26
  store i32 0, i32* %i, align 4, !dbg !497
  br label %for.cond, !dbg !499

for.cond:                                         ; preds = %for.inc, %if.end31
  %14 = load i32, i32* %i, align 4, !dbg !500
  %cmp32 = icmp slt i32 %14, 10, !dbg !502
  br i1 %cmp32, label %for.body, label %for.end, !dbg !503

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !504
  %16 = load i32, i32* %i, align 4, !dbg !506
  %idxprom34 = sext i32 %16 to i64, !dbg !504
  %arrayidx35 = getelementptr inbounds i32, i32* %15, i64 %idxprom34, !dbg !504
  store i32 0, i32* %arrayidx35, align 4, !dbg !507
  br label %for.inc, !dbg !508

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !509
  %inc = add nsw i32 %17, 1, !dbg !509
  store i32 %inc, i32* %i, align 4, !dbg !509
  br label %for.cond, !dbg !510, !llvm.loop !511

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !513
  %cmp36 = icmp sge i32 %18, 0, !dbg !515
  br i1 %cmp36, label %land.lhs.true, label %if.else, !dbg !516

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* %data, align 4, !dbg !517
  %cmp38 = icmp slt i32 %19, 10, !dbg !518
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !519

if.then40:                                        ; preds = %land.lhs.true
  %20 = load i32*, i32** %buffer, align 8, !dbg !520
  %21 = load i32, i32* %data, align 4, !dbg !522
  %idxprom41 = sext i32 %21 to i64, !dbg !520
  %arrayidx42 = getelementptr inbounds i32, i32* %20, i64 %idxprom41, !dbg !520
  store i32 1, i32* %arrayidx42, align 4, !dbg !523
  store i32 0, i32* %i, align 4, !dbg !524
  br label %for.cond43, !dbg !526

for.cond43:                                       ; preds = %for.inc49, %if.then40
  %22 = load i32, i32* %i, align 4, !dbg !527
  %cmp44 = icmp slt i32 %22, 10, !dbg !529
  br i1 %cmp44, label %for.body46, label %for.end51, !dbg !530

for.body46:                                       ; preds = %for.cond43
  %23 = load i32*, i32** %buffer, align 8, !dbg !531
  %24 = load i32, i32* %i, align 4, !dbg !533
  %idxprom47 = sext i32 %24 to i64, !dbg !531
  %arrayidx48 = getelementptr inbounds i32, i32* %23, i64 %idxprom47, !dbg !531
  %25 = load i32, i32* %arrayidx48, align 4, !dbg !531
  call void @printIntLine(i32 %25), !dbg !534
  br label %for.inc49, !dbg !535

for.inc49:                                        ; preds = %for.body46
  %26 = load i32, i32* %i, align 4, !dbg !536
  %inc50 = add nsw i32 %26, 1, !dbg !536
  store i32 %inc50, i32* %i, align 4, !dbg !536
  br label %for.cond43, !dbg !537, !llvm.loop !538

for.end51:                                        ; preds = %for.cond43
  br label %if.end52, !dbg !540

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !541
  br label %if.end52

if.end52:                                         ; preds = %if.else, %for.end51
  %27 = load i32*, i32** %buffer, align 8, !dbg !543
  %28 = bitcast i32* %27 to i8*, !dbg !543
  call void @free(i8* %28) #8, !dbg !544
  br label %if.end53, !dbg !545

if.end53:                                         ; preds = %if.end52, %if.end23
  ret void, !dbg !546
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !547 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !548, metadata !DIExpression()), !dbg !549
  store i32 -1, i32* %data, align 4, !dbg !550
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !551
  %cmp = icmp ne i32 %0, 5, !dbg !553
  br i1 %cmp, label %if.then, label %if.else, !dbg !554

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !555
  br label %if.end, !dbg !557

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !558
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !560
  %cmp1 = icmp eq i32 %1, 5, !dbg !562
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !563

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !564, metadata !DIExpression()), !dbg !567
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !568, metadata !DIExpression()), !dbg !569
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !570
  %2 = bitcast i8* %call to i32*, !dbg !571
  store i32* %2, i32** %buffer, align 8, !dbg !569
  %3 = load i32*, i32** %buffer, align 8, !dbg !572
  %cmp3 = icmp eq i32* %3, null, !dbg !574
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !575

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !576
  unreachable, !dbg !576

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !578
  br label %for.cond, !dbg !580

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !581
  %cmp6 = icmp slt i32 %4, 10, !dbg !583
  br i1 %cmp6, label %for.body, label %for.end, !dbg !584

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !585
  %6 = load i32, i32* %i, align 4, !dbg !587
  %idxprom = sext i32 %6 to i64, !dbg !585
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !585
  store i32 0, i32* %arrayidx, align 4, !dbg !588
  br label %for.inc, !dbg !589

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !590
  %inc = add nsw i32 %7, 1, !dbg !590
  store i32 %inc, i32* %i, align 4, !dbg !590
  br label %for.cond, !dbg !591, !llvm.loop !592

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !594
  %cmp7 = icmp sge i32 %8, 0, !dbg !596
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !597

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !598
  %10 = load i32, i32* %data, align 4, !dbg !600
  %idxprom9 = sext i32 %10 to i64, !dbg !598
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !598
  store i32 1, i32* %arrayidx10, align 4, !dbg !601
  store i32 0, i32* %i, align 4, !dbg !602
  br label %for.cond11, !dbg !604

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !605
  %cmp12 = icmp slt i32 %11, 10, !dbg !607
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !608

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !609
  %13 = load i32, i32* %i, align 4, !dbg !611
  %idxprom14 = sext i32 %13 to i64, !dbg !609
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !609
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !609
  call void @printIntLine(i32 %14), !dbg !612
  br label %for.inc16, !dbg !613

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !614
  %inc17 = add nsw i32 %15, 1, !dbg !614
  store i32 %inc17, i32* %i, align 4, !dbg !614
  br label %for.cond11, !dbg !615, !llvm.loop !616

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !618

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !619
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !621
  %17 = bitcast i32* %16 to i8*, !dbg !621
  call void @free(i8* %17) #8, !dbg !622
  br label %if.end21, !dbg !623

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !624
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !625 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !626, metadata !DIExpression()), !dbg !627
  store i32 -1, i32* %data, align 4, !dbg !628
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !629
  %cmp = icmp eq i32 %0, 5, !dbg !631
  br i1 %cmp, label %if.then, label %if.end, !dbg !632

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !633
  br label %if.end, !dbg !635

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !636
  %cmp1 = icmp eq i32 %1, 5, !dbg !638
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !639

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !640, metadata !DIExpression()), !dbg !643
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !644, metadata !DIExpression()), !dbg !645
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !646
  %2 = bitcast i8* %call to i32*, !dbg !647
  store i32* %2, i32** %buffer, align 8, !dbg !645
  %3 = load i32*, i32** %buffer, align 8, !dbg !648
  %cmp3 = icmp eq i32* %3, null, !dbg !650
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !651

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !652
  unreachable, !dbg !652

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !654
  br label %for.cond, !dbg !656

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !657
  %cmp6 = icmp slt i32 %4, 10, !dbg !659
  br i1 %cmp6, label %for.body, label %for.end, !dbg !660

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !661
  %6 = load i32, i32* %i, align 4, !dbg !663
  %idxprom = sext i32 %6 to i64, !dbg !661
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !661
  store i32 0, i32* %arrayidx, align 4, !dbg !664
  br label %for.inc, !dbg !665

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !666
  %inc = add nsw i32 %7, 1, !dbg !666
  store i32 %inc, i32* %i, align 4, !dbg !666
  br label %for.cond, !dbg !667, !llvm.loop !668

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !670
  %cmp7 = icmp sge i32 %8, 0, !dbg !672
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !673

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !674
  %10 = load i32, i32* %data, align 4, !dbg !676
  %idxprom9 = sext i32 %10 to i64, !dbg !674
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !674
  store i32 1, i32* %arrayidx10, align 4, !dbg !677
  store i32 0, i32* %i, align 4, !dbg !678
  br label %for.cond11, !dbg !680

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !681
  %cmp12 = icmp slt i32 %11, 10, !dbg !683
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !684

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !685
  %13 = load i32, i32* %i, align 4, !dbg !687
  %idxprom14 = sext i32 %13 to i64, !dbg !685
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !685
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !685
  call void @printIntLine(i32 %14), !dbg !688
  br label %for.inc16, !dbg !689

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !690
  %inc17 = add nsw i32 %15, 1, !dbg !690
  store i32 %inc17, i32* %i, align 4, !dbg !690
  br label %for.cond11, !dbg !691, !llvm.loop !692

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !694

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !695
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !697
  %17 = bitcast i32* %16 to i8*, !dbg !697
  call void @free(i8* %17) #8, !dbg !698
  br label %if.end20, !dbg !699

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !700
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_13.c", directory: "/root/SSE-Assessment")
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_13_bad", scope: !69, file: !69, line: 44, type: !70, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_13.c", directory: "/root/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 46, type: !60)
!74 = !DILocation(line: 46, column: 9, scope: !68)
!75 = !DILocation(line: 48, column: 10, scope: !68)
!76 = !DILocation(line: 49, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !68, file: !69, line: 49, column: 8)
!78 = !DILocation(line: 49, column: 25, scope: !77)
!79 = !DILocation(line: 49, column: 8, scope: !68)
!80 = !DILocalVariable(name: "recvResult", scope: !81, file: !69, line: 56, type: !60)
!81 = distinct !DILexicalBlock(scope: !82, file: !69, line: 51, column: 9)
!82 = distinct !DILexicalBlock(scope: !77, file: !69, line: 50, column: 5)
!83 = !DILocation(line: 56, column: 17, scope: !81)
!84 = !DILocalVariable(name: "service", scope: !81, file: !69, line: 57, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !86)
!86 = !{!87, !88, !94, !101}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !85, file: !17, line: 239, baseType: !51, size: 16)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !85, file: !17, line: 240, baseType: !89, size: 16, offset: 16)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !91, line: 25, baseType: !92)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !93, line: 39, baseType: !53)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !85, file: !17, line: 241, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !17, line: 33, baseType: !98, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !91, line: 26, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !93, line: 41, baseType: !5)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !85, file: !17, line: 244, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 57, column: 32, scope: !81)
!107 = !DILocalVariable(name: "connectSocket", scope: !81, file: !69, line: 58, type: !60)
!108 = !DILocation(line: 58, column: 20, scope: !81)
!109 = !DILocalVariable(name: "inputBuffer", scope: !81, file: !69, line: 59, type: !55)
!110 = !DILocation(line: 59, column: 18, scope: !81)
!111 = !DILocation(line: 60, column: 13, scope: !81)
!112 = !DILocation(line: 70, column: 33, scope: !113)
!113 = distinct !DILexicalBlock(scope: !81, file: !69, line: 61, column: 13)
!114 = !DILocation(line: 70, column: 31, scope: !113)
!115 = !DILocation(line: 71, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !69, line: 71, column: 21)
!117 = !DILocation(line: 71, column: 35, scope: !116)
!118 = !DILocation(line: 71, column: 21, scope: !113)
!119 = !DILocation(line: 73, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !69, line: 72, column: 17)
!121 = !DILocation(line: 75, column: 17, scope: !113)
!122 = !DILocation(line: 76, column: 25, scope: !113)
!123 = !DILocation(line: 76, column: 36, scope: !113)
!124 = !DILocation(line: 77, column: 43, scope: !113)
!125 = !DILocation(line: 77, column: 25, scope: !113)
!126 = !DILocation(line: 77, column: 34, scope: !113)
!127 = !DILocation(line: 77, column: 41, scope: !113)
!128 = !DILocation(line: 78, column: 36, scope: !113)
!129 = !DILocation(line: 78, column: 25, scope: !113)
!130 = !DILocation(line: 78, column: 34, scope: !113)
!131 = !DILocation(line: 79, column: 29, scope: !132)
!132 = distinct !DILexicalBlock(scope: !113, file: !69, line: 79, column: 21)
!133 = !DILocation(line: 79, column: 44, scope: !132)
!134 = !DILocation(line: 79, column: 21, scope: !132)
!135 = !DILocation(line: 79, column: 89, scope: !132)
!136 = !DILocation(line: 79, column: 21, scope: !113)
!137 = !DILocation(line: 81, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !69, line: 80, column: 17)
!139 = !DILocation(line: 85, column: 35, scope: !113)
!140 = !DILocation(line: 85, column: 50, scope: !113)
!141 = !DILocation(line: 85, column: 30, scope: !113)
!142 = !DILocation(line: 85, column: 28, scope: !113)
!143 = !DILocation(line: 86, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !113, file: !69, line: 86, column: 21)
!145 = !DILocation(line: 86, column: 32, scope: !144)
!146 = !DILocation(line: 86, column: 48, scope: !144)
!147 = !DILocation(line: 86, column: 51, scope: !144)
!148 = !DILocation(line: 86, column: 62, scope: !144)
!149 = !DILocation(line: 86, column: 21, scope: !113)
!150 = !DILocation(line: 88, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !144, file: !69, line: 87, column: 17)
!152 = !DILocation(line: 91, column: 29, scope: !113)
!153 = !DILocation(line: 91, column: 17, scope: !113)
!154 = !DILocation(line: 91, column: 41, scope: !113)
!155 = !DILocation(line: 93, column: 29, scope: !113)
!156 = !DILocation(line: 93, column: 24, scope: !113)
!157 = !DILocation(line: 93, column: 22, scope: !113)
!158 = !DILocation(line: 94, column: 13, scope: !113)
!159 = !DILocation(line: 96, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !81, file: !69, line: 96, column: 17)
!161 = !DILocation(line: 96, column: 31, scope: !160)
!162 = !DILocation(line: 96, column: 17, scope: !81)
!163 = !DILocation(line: 98, column: 30, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !69, line: 97, column: 13)
!165 = !DILocation(line: 98, column: 17, scope: !164)
!166 = !DILocation(line: 99, column: 13, scope: !164)
!167 = !DILocation(line: 107, column: 5, scope: !82)
!168 = !DILocation(line: 108, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !68, file: !69, line: 108, column: 8)
!170 = !DILocation(line: 108, column: 25, scope: !169)
!171 = !DILocation(line: 108, column: 8, scope: !68)
!172 = !DILocalVariable(name: "i", scope: !173, file: !69, line: 111, type: !60)
!173 = distinct !DILexicalBlock(scope: !174, file: !69, line: 110, column: 9)
!174 = distinct !DILexicalBlock(scope: !169, file: !69, line: 109, column: 5)
!175 = !DILocation(line: 111, column: 17, scope: !173)
!176 = !DILocalVariable(name: "buffer", scope: !173, file: !69, line: 112, type: !59)
!177 = !DILocation(line: 112, column: 19, scope: !173)
!178 = !DILocation(line: 112, column: 35, scope: !173)
!179 = !DILocation(line: 112, column: 28, scope: !173)
!180 = !DILocation(line: 113, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !173, file: !69, line: 113, column: 17)
!182 = !DILocation(line: 113, column: 24, scope: !181)
!183 = !DILocation(line: 113, column: 17, scope: !173)
!184 = !DILocation(line: 113, column: 34, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !69, line: 113, column: 33)
!186 = !DILocation(line: 115, column: 20, scope: !187)
!187 = distinct !DILexicalBlock(scope: !173, file: !69, line: 115, column: 13)
!188 = !DILocation(line: 115, column: 18, scope: !187)
!189 = !DILocation(line: 115, column: 25, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !69, line: 115, column: 13)
!191 = !DILocation(line: 115, column: 27, scope: !190)
!192 = !DILocation(line: 115, column: 13, scope: !187)
!193 = !DILocation(line: 117, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !69, line: 116, column: 13)
!195 = !DILocation(line: 117, column: 24, scope: !194)
!196 = !DILocation(line: 117, column: 27, scope: !194)
!197 = !DILocation(line: 118, column: 13, scope: !194)
!198 = !DILocation(line: 115, column: 34, scope: !190)
!199 = !DILocation(line: 115, column: 13, scope: !190)
!200 = distinct !{!200, !192, !201, !202}
!201 = !DILocation(line: 118, column: 13, scope: !187)
!202 = !{!"llvm.loop.mustprogress"}
!203 = !DILocation(line: 121, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !173, file: !69, line: 121, column: 17)
!205 = !DILocation(line: 121, column: 22, scope: !204)
!206 = !DILocation(line: 121, column: 17, scope: !173)
!207 = !DILocation(line: 123, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !69, line: 122, column: 13)
!209 = !DILocation(line: 123, column: 24, scope: !208)
!210 = !DILocation(line: 123, column: 30, scope: !208)
!211 = !DILocation(line: 125, column: 23, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !69, line: 125, column: 17)
!213 = !DILocation(line: 125, column: 21, scope: !212)
!214 = !DILocation(line: 125, column: 28, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !69, line: 125, column: 17)
!216 = !DILocation(line: 125, column: 30, scope: !215)
!217 = !DILocation(line: 125, column: 17, scope: !212)
!218 = !DILocation(line: 127, column: 34, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !69, line: 126, column: 17)
!220 = !DILocation(line: 127, column: 41, scope: !219)
!221 = !DILocation(line: 127, column: 21, scope: !219)
!222 = !DILocation(line: 128, column: 17, scope: !219)
!223 = !DILocation(line: 125, column: 37, scope: !215)
!224 = !DILocation(line: 125, column: 17, scope: !215)
!225 = distinct !{!225, !217, !226, !202}
!226 = !DILocation(line: 128, column: 17, scope: !212)
!227 = !DILocation(line: 129, column: 13, scope: !208)
!228 = !DILocation(line: 132, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !204, file: !69, line: 131, column: 13)
!230 = !DILocation(line: 134, column: 18, scope: !173)
!231 = !DILocation(line: 134, column: 13, scope: !173)
!232 = !DILocation(line: 136, column: 5, scope: !174)
!233 = !DILocation(line: 137, column: 1, scope: !68)
!234 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_13_good", scope: !69, file: !69, line: 429, type: !70, scopeLine: 430, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!235 = !DILocation(line: 431, column: 5, scope: !234)
!236 = !DILocation(line: 432, column: 5, scope: !234)
!237 = !DILocation(line: 433, column: 5, scope: !234)
!238 = !DILocation(line: 434, column: 5, scope: !234)
!239 = !DILocation(line: 435, column: 1, scope: !234)
!240 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 446, type: !241, scopeLine: 447, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!241 = !DISubroutineType(types: !242)
!242 = !{!60, !60, !243}
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !244, size: 64)
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!245 = !DILocalVariable(name: "argc", arg: 1, scope: !240, file: !69, line: 446, type: !60)
!246 = !DILocation(line: 446, column: 14, scope: !240)
!247 = !DILocalVariable(name: "argv", arg: 2, scope: !240, file: !69, line: 446, type: !243)
!248 = !DILocation(line: 446, column: 27, scope: !240)
!249 = !DILocation(line: 449, column: 22, scope: !240)
!250 = !DILocation(line: 449, column: 12, scope: !240)
!251 = !DILocation(line: 449, column: 5, scope: !240)
!252 = !DILocation(line: 451, column: 5, scope: !240)
!253 = !DILocation(line: 452, column: 5, scope: !240)
!254 = !DILocation(line: 453, column: 5, scope: !240)
!255 = !DILocation(line: 456, column: 5, scope: !240)
!256 = !DILocation(line: 457, column: 5, scope: !240)
!257 = !DILocation(line: 458, column: 5, scope: !240)
!258 = !DILocation(line: 460, column: 5, scope: !240)
!259 = distinct !DISubprogram(name: "goodB2G1", scope: !69, file: !69, line: 144, type: !70, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!260 = !DILocalVariable(name: "data", scope: !259, file: !69, line: 146, type: !60)
!261 = !DILocation(line: 146, column: 9, scope: !259)
!262 = !DILocation(line: 148, column: 10, scope: !259)
!263 = !DILocation(line: 149, column: 8, scope: !264)
!264 = distinct !DILexicalBlock(scope: !259, file: !69, line: 149, column: 8)
!265 = !DILocation(line: 149, column: 25, scope: !264)
!266 = !DILocation(line: 149, column: 8, scope: !259)
!267 = !DILocalVariable(name: "recvResult", scope: !268, file: !69, line: 156, type: !60)
!268 = distinct !DILexicalBlock(scope: !269, file: !69, line: 151, column: 9)
!269 = distinct !DILexicalBlock(scope: !264, file: !69, line: 150, column: 5)
!270 = !DILocation(line: 156, column: 17, scope: !268)
!271 = !DILocalVariable(name: "service", scope: !268, file: !69, line: 157, type: !85)
!272 = !DILocation(line: 157, column: 32, scope: !268)
!273 = !DILocalVariable(name: "connectSocket", scope: !268, file: !69, line: 158, type: !60)
!274 = !DILocation(line: 158, column: 20, scope: !268)
!275 = !DILocalVariable(name: "inputBuffer", scope: !268, file: !69, line: 159, type: !55)
!276 = !DILocation(line: 159, column: 18, scope: !268)
!277 = !DILocation(line: 160, column: 13, scope: !268)
!278 = !DILocation(line: 170, column: 33, scope: !279)
!279 = distinct !DILexicalBlock(scope: !268, file: !69, line: 161, column: 13)
!280 = !DILocation(line: 170, column: 31, scope: !279)
!281 = !DILocation(line: 171, column: 21, scope: !282)
!282 = distinct !DILexicalBlock(scope: !279, file: !69, line: 171, column: 21)
!283 = !DILocation(line: 171, column: 35, scope: !282)
!284 = !DILocation(line: 171, column: 21, scope: !279)
!285 = !DILocation(line: 173, column: 21, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !69, line: 172, column: 17)
!287 = !DILocation(line: 175, column: 17, scope: !279)
!288 = !DILocation(line: 176, column: 25, scope: !279)
!289 = !DILocation(line: 176, column: 36, scope: !279)
!290 = !DILocation(line: 177, column: 43, scope: !279)
!291 = !DILocation(line: 177, column: 25, scope: !279)
!292 = !DILocation(line: 177, column: 34, scope: !279)
!293 = !DILocation(line: 177, column: 41, scope: !279)
!294 = !DILocation(line: 178, column: 36, scope: !279)
!295 = !DILocation(line: 178, column: 25, scope: !279)
!296 = !DILocation(line: 178, column: 34, scope: !279)
!297 = !DILocation(line: 179, column: 29, scope: !298)
!298 = distinct !DILexicalBlock(scope: !279, file: !69, line: 179, column: 21)
!299 = !DILocation(line: 179, column: 44, scope: !298)
!300 = !DILocation(line: 179, column: 21, scope: !298)
!301 = !DILocation(line: 179, column: 89, scope: !298)
!302 = !DILocation(line: 179, column: 21, scope: !279)
!303 = !DILocation(line: 181, column: 21, scope: !304)
!304 = distinct !DILexicalBlock(scope: !298, file: !69, line: 180, column: 17)
!305 = !DILocation(line: 185, column: 35, scope: !279)
!306 = !DILocation(line: 185, column: 50, scope: !279)
!307 = !DILocation(line: 185, column: 30, scope: !279)
!308 = !DILocation(line: 185, column: 28, scope: !279)
!309 = !DILocation(line: 186, column: 21, scope: !310)
!310 = distinct !DILexicalBlock(scope: !279, file: !69, line: 186, column: 21)
!311 = !DILocation(line: 186, column: 32, scope: !310)
!312 = !DILocation(line: 186, column: 48, scope: !310)
!313 = !DILocation(line: 186, column: 51, scope: !310)
!314 = !DILocation(line: 186, column: 62, scope: !310)
!315 = !DILocation(line: 186, column: 21, scope: !279)
!316 = !DILocation(line: 188, column: 21, scope: !317)
!317 = distinct !DILexicalBlock(scope: !310, file: !69, line: 187, column: 17)
!318 = !DILocation(line: 191, column: 29, scope: !279)
!319 = !DILocation(line: 191, column: 17, scope: !279)
!320 = !DILocation(line: 191, column: 41, scope: !279)
!321 = !DILocation(line: 193, column: 29, scope: !279)
!322 = !DILocation(line: 193, column: 24, scope: !279)
!323 = !DILocation(line: 193, column: 22, scope: !279)
!324 = !DILocation(line: 194, column: 13, scope: !279)
!325 = !DILocation(line: 196, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !268, file: !69, line: 196, column: 17)
!327 = !DILocation(line: 196, column: 31, scope: !326)
!328 = !DILocation(line: 196, column: 17, scope: !268)
!329 = !DILocation(line: 198, column: 30, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !69, line: 197, column: 13)
!331 = !DILocation(line: 198, column: 17, scope: !330)
!332 = !DILocation(line: 199, column: 13, scope: !330)
!333 = !DILocation(line: 207, column: 5, scope: !269)
!334 = !DILocation(line: 208, column: 8, scope: !335)
!335 = distinct !DILexicalBlock(scope: !259, file: !69, line: 208, column: 8)
!336 = !DILocation(line: 208, column: 25, scope: !335)
!337 = !DILocation(line: 208, column: 8, scope: !259)
!338 = !DILocation(line: 211, column: 9, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !69, line: 209, column: 5)
!340 = !DILocation(line: 212, column: 5, scope: !339)
!341 = !DILocalVariable(name: "i", scope: !342, file: !69, line: 216, type: !60)
!342 = distinct !DILexicalBlock(scope: !343, file: !69, line: 215, column: 9)
!343 = distinct !DILexicalBlock(scope: !335, file: !69, line: 214, column: 5)
!344 = !DILocation(line: 216, column: 17, scope: !342)
!345 = !DILocalVariable(name: "buffer", scope: !342, file: !69, line: 217, type: !59)
!346 = !DILocation(line: 217, column: 19, scope: !342)
!347 = !DILocation(line: 217, column: 35, scope: !342)
!348 = !DILocation(line: 217, column: 28, scope: !342)
!349 = !DILocation(line: 218, column: 17, scope: !350)
!350 = distinct !DILexicalBlock(scope: !342, file: !69, line: 218, column: 17)
!351 = !DILocation(line: 218, column: 24, scope: !350)
!352 = !DILocation(line: 218, column: 17, scope: !342)
!353 = !DILocation(line: 218, column: 34, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !69, line: 218, column: 33)
!355 = !DILocation(line: 220, column: 20, scope: !356)
!356 = distinct !DILexicalBlock(scope: !342, file: !69, line: 220, column: 13)
!357 = !DILocation(line: 220, column: 18, scope: !356)
!358 = !DILocation(line: 220, column: 25, scope: !359)
!359 = distinct !DILexicalBlock(scope: !356, file: !69, line: 220, column: 13)
!360 = !DILocation(line: 220, column: 27, scope: !359)
!361 = !DILocation(line: 220, column: 13, scope: !356)
!362 = !DILocation(line: 222, column: 17, scope: !363)
!363 = distinct !DILexicalBlock(scope: !359, file: !69, line: 221, column: 13)
!364 = !DILocation(line: 222, column: 24, scope: !363)
!365 = !DILocation(line: 222, column: 27, scope: !363)
!366 = !DILocation(line: 223, column: 13, scope: !363)
!367 = !DILocation(line: 220, column: 34, scope: !359)
!368 = !DILocation(line: 220, column: 13, scope: !359)
!369 = distinct !{!369, !361, !370, !202}
!370 = !DILocation(line: 223, column: 13, scope: !356)
!371 = !DILocation(line: 225, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !342, file: !69, line: 225, column: 17)
!373 = !DILocation(line: 225, column: 22, scope: !372)
!374 = !DILocation(line: 225, column: 27, scope: !372)
!375 = !DILocation(line: 225, column: 30, scope: !372)
!376 = !DILocation(line: 225, column: 35, scope: !372)
!377 = !DILocation(line: 225, column: 17, scope: !342)
!378 = !DILocation(line: 227, column: 17, scope: !379)
!379 = distinct !DILexicalBlock(scope: !372, file: !69, line: 226, column: 13)
!380 = !DILocation(line: 227, column: 24, scope: !379)
!381 = !DILocation(line: 227, column: 30, scope: !379)
!382 = !DILocation(line: 229, column: 23, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !69, line: 229, column: 17)
!384 = !DILocation(line: 229, column: 21, scope: !383)
!385 = !DILocation(line: 229, column: 28, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !69, line: 229, column: 17)
!387 = !DILocation(line: 229, column: 30, scope: !386)
!388 = !DILocation(line: 229, column: 17, scope: !383)
!389 = !DILocation(line: 231, column: 34, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !69, line: 230, column: 17)
!391 = !DILocation(line: 231, column: 41, scope: !390)
!392 = !DILocation(line: 231, column: 21, scope: !390)
!393 = !DILocation(line: 232, column: 17, scope: !390)
!394 = !DILocation(line: 229, column: 37, scope: !386)
!395 = !DILocation(line: 229, column: 17, scope: !386)
!396 = distinct !{!396, !388, !397, !202}
!397 = !DILocation(line: 232, column: 17, scope: !383)
!398 = !DILocation(line: 233, column: 13, scope: !379)
!399 = !DILocation(line: 236, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !372, file: !69, line: 235, column: 13)
!401 = !DILocation(line: 238, column: 18, scope: !342)
!402 = !DILocation(line: 238, column: 13, scope: !342)
!403 = !DILocation(line: 241, column: 1, scope: !259)
!404 = distinct !DISubprogram(name: "goodB2G2", scope: !69, file: !69, line: 244, type: !70, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!405 = !DILocalVariable(name: "data", scope: !404, file: !69, line: 246, type: !60)
!406 = !DILocation(line: 246, column: 9, scope: !404)
!407 = !DILocation(line: 248, column: 10, scope: !404)
!408 = !DILocation(line: 249, column: 8, scope: !409)
!409 = distinct !DILexicalBlock(scope: !404, file: !69, line: 249, column: 8)
!410 = !DILocation(line: 249, column: 25, scope: !409)
!411 = !DILocation(line: 249, column: 8, scope: !404)
!412 = !DILocalVariable(name: "recvResult", scope: !413, file: !69, line: 256, type: !60)
!413 = distinct !DILexicalBlock(scope: !414, file: !69, line: 251, column: 9)
!414 = distinct !DILexicalBlock(scope: !409, file: !69, line: 250, column: 5)
!415 = !DILocation(line: 256, column: 17, scope: !413)
!416 = !DILocalVariable(name: "service", scope: !413, file: !69, line: 257, type: !85)
!417 = !DILocation(line: 257, column: 32, scope: !413)
!418 = !DILocalVariable(name: "connectSocket", scope: !413, file: !69, line: 258, type: !60)
!419 = !DILocation(line: 258, column: 20, scope: !413)
!420 = !DILocalVariable(name: "inputBuffer", scope: !413, file: !69, line: 259, type: !55)
!421 = !DILocation(line: 259, column: 18, scope: !413)
!422 = !DILocation(line: 260, column: 13, scope: !413)
!423 = !DILocation(line: 270, column: 33, scope: !424)
!424 = distinct !DILexicalBlock(scope: !413, file: !69, line: 261, column: 13)
!425 = !DILocation(line: 270, column: 31, scope: !424)
!426 = !DILocation(line: 271, column: 21, scope: !427)
!427 = distinct !DILexicalBlock(scope: !424, file: !69, line: 271, column: 21)
!428 = !DILocation(line: 271, column: 35, scope: !427)
!429 = !DILocation(line: 271, column: 21, scope: !424)
!430 = !DILocation(line: 273, column: 21, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !69, line: 272, column: 17)
!432 = !DILocation(line: 275, column: 17, scope: !424)
!433 = !DILocation(line: 276, column: 25, scope: !424)
!434 = !DILocation(line: 276, column: 36, scope: !424)
!435 = !DILocation(line: 277, column: 43, scope: !424)
!436 = !DILocation(line: 277, column: 25, scope: !424)
!437 = !DILocation(line: 277, column: 34, scope: !424)
!438 = !DILocation(line: 277, column: 41, scope: !424)
!439 = !DILocation(line: 278, column: 36, scope: !424)
!440 = !DILocation(line: 278, column: 25, scope: !424)
!441 = !DILocation(line: 278, column: 34, scope: !424)
!442 = !DILocation(line: 279, column: 29, scope: !443)
!443 = distinct !DILexicalBlock(scope: !424, file: !69, line: 279, column: 21)
!444 = !DILocation(line: 279, column: 44, scope: !443)
!445 = !DILocation(line: 279, column: 21, scope: !443)
!446 = !DILocation(line: 279, column: 89, scope: !443)
!447 = !DILocation(line: 279, column: 21, scope: !424)
!448 = !DILocation(line: 281, column: 21, scope: !449)
!449 = distinct !DILexicalBlock(scope: !443, file: !69, line: 280, column: 17)
!450 = !DILocation(line: 285, column: 35, scope: !424)
!451 = !DILocation(line: 285, column: 50, scope: !424)
!452 = !DILocation(line: 285, column: 30, scope: !424)
!453 = !DILocation(line: 285, column: 28, scope: !424)
!454 = !DILocation(line: 286, column: 21, scope: !455)
!455 = distinct !DILexicalBlock(scope: !424, file: !69, line: 286, column: 21)
!456 = !DILocation(line: 286, column: 32, scope: !455)
!457 = !DILocation(line: 286, column: 48, scope: !455)
!458 = !DILocation(line: 286, column: 51, scope: !455)
!459 = !DILocation(line: 286, column: 62, scope: !455)
!460 = !DILocation(line: 286, column: 21, scope: !424)
!461 = !DILocation(line: 288, column: 21, scope: !462)
!462 = distinct !DILexicalBlock(scope: !455, file: !69, line: 287, column: 17)
!463 = !DILocation(line: 291, column: 29, scope: !424)
!464 = !DILocation(line: 291, column: 17, scope: !424)
!465 = !DILocation(line: 291, column: 41, scope: !424)
!466 = !DILocation(line: 293, column: 29, scope: !424)
!467 = !DILocation(line: 293, column: 24, scope: !424)
!468 = !DILocation(line: 293, column: 22, scope: !424)
!469 = !DILocation(line: 294, column: 13, scope: !424)
!470 = !DILocation(line: 296, column: 17, scope: !471)
!471 = distinct !DILexicalBlock(scope: !413, file: !69, line: 296, column: 17)
!472 = !DILocation(line: 296, column: 31, scope: !471)
!473 = !DILocation(line: 296, column: 17, scope: !413)
!474 = !DILocation(line: 298, column: 30, scope: !475)
!475 = distinct !DILexicalBlock(scope: !471, file: !69, line: 297, column: 13)
!476 = !DILocation(line: 298, column: 17, scope: !475)
!477 = !DILocation(line: 299, column: 13, scope: !475)
!478 = !DILocation(line: 307, column: 5, scope: !414)
!479 = !DILocation(line: 308, column: 8, scope: !480)
!480 = distinct !DILexicalBlock(scope: !404, file: !69, line: 308, column: 8)
!481 = !DILocation(line: 308, column: 25, scope: !480)
!482 = !DILocation(line: 308, column: 8, scope: !404)
!483 = !DILocalVariable(name: "i", scope: !484, file: !69, line: 311, type: !60)
!484 = distinct !DILexicalBlock(scope: !485, file: !69, line: 310, column: 9)
!485 = distinct !DILexicalBlock(scope: !480, file: !69, line: 309, column: 5)
!486 = !DILocation(line: 311, column: 17, scope: !484)
!487 = !DILocalVariable(name: "buffer", scope: !484, file: !69, line: 312, type: !59)
!488 = !DILocation(line: 312, column: 19, scope: !484)
!489 = !DILocation(line: 312, column: 35, scope: !484)
!490 = !DILocation(line: 312, column: 28, scope: !484)
!491 = !DILocation(line: 313, column: 17, scope: !492)
!492 = distinct !DILexicalBlock(scope: !484, file: !69, line: 313, column: 17)
!493 = !DILocation(line: 313, column: 24, scope: !492)
!494 = !DILocation(line: 313, column: 17, scope: !484)
!495 = !DILocation(line: 313, column: 34, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !69, line: 313, column: 33)
!497 = !DILocation(line: 315, column: 20, scope: !498)
!498 = distinct !DILexicalBlock(scope: !484, file: !69, line: 315, column: 13)
!499 = !DILocation(line: 315, column: 18, scope: !498)
!500 = !DILocation(line: 315, column: 25, scope: !501)
!501 = distinct !DILexicalBlock(scope: !498, file: !69, line: 315, column: 13)
!502 = !DILocation(line: 315, column: 27, scope: !501)
!503 = !DILocation(line: 315, column: 13, scope: !498)
!504 = !DILocation(line: 317, column: 17, scope: !505)
!505 = distinct !DILexicalBlock(scope: !501, file: !69, line: 316, column: 13)
!506 = !DILocation(line: 317, column: 24, scope: !505)
!507 = !DILocation(line: 317, column: 27, scope: !505)
!508 = !DILocation(line: 318, column: 13, scope: !505)
!509 = !DILocation(line: 315, column: 34, scope: !501)
!510 = !DILocation(line: 315, column: 13, scope: !501)
!511 = distinct !{!511, !503, !512, !202}
!512 = !DILocation(line: 318, column: 13, scope: !498)
!513 = !DILocation(line: 320, column: 17, scope: !514)
!514 = distinct !DILexicalBlock(scope: !484, file: !69, line: 320, column: 17)
!515 = !DILocation(line: 320, column: 22, scope: !514)
!516 = !DILocation(line: 320, column: 27, scope: !514)
!517 = !DILocation(line: 320, column: 30, scope: !514)
!518 = !DILocation(line: 320, column: 35, scope: !514)
!519 = !DILocation(line: 320, column: 17, scope: !484)
!520 = !DILocation(line: 322, column: 17, scope: !521)
!521 = distinct !DILexicalBlock(scope: !514, file: !69, line: 321, column: 13)
!522 = !DILocation(line: 322, column: 24, scope: !521)
!523 = !DILocation(line: 322, column: 30, scope: !521)
!524 = !DILocation(line: 324, column: 23, scope: !525)
!525 = distinct !DILexicalBlock(scope: !521, file: !69, line: 324, column: 17)
!526 = !DILocation(line: 324, column: 21, scope: !525)
!527 = !DILocation(line: 324, column: 28, scope: !528)
!528 = distinct !DILexicalBlock(scope: !525, file: !69, line: 324, column: 17)
!529 = !DILocation(line: 324, column: 30, scope: !528)
!530 = !DILocation(line: 324, column: 17, scope: !525)
!531 = !DILocation(line: 326, column: 34, scope: !532)
!532 = distinct !DILexicalBlock(scope: !528, file: !69, line: 325, column: 17)
!533 = !DILocation(line: 326, column: 41, scope: !532)
!534 = !DILocation(line: 326, column: 21, scope: !532)
!535 = !DILocation(line: 327, column: 17, scope: !532)
!536 = !DILocation(line: 324, column: 37, scope: !528)
!537 = !DILocation(line: 324, column: 17, scope: !528)
!538 = distinct !{!538, !530, !539, !202}
!539 = !DILocation(line: 327, column: 17, scope: !525)
!540 = !DILocation(line: 328, column: 13, scope: !521)
!541 = !DILocation(line: 331, column: 17, scope: !542)
!542 = distinct !DILexicalBlock(scope: !514, file: !69, line: 330, column: 13)
!543 = !DILocation(line: 333, column: 18, scope: !484)
!544 = !DILocation(line: 333, column: 13, scope: !484)
!545 = !DILocation(line: 335, column: 5, scope: !485)
!546 = !DILocation(line: 336, column: 1, scope: !404)
!547 = distinct !DISubprogram(name: "goodG2B1", scope: !69, file: !69, line: 339, type: !70, scopeLine: 340, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!548 = !DILocalVariable(name: "data", scope: !547, file: !69, line: 341, type: !60)
!549 = !DILocation(line: 341, column: 9, scope: !547)
!550 = !DILocation(line: 343, column: 10, scope: !547)
!551 = !DILocation(line: 344, column: 8, scope: !552)
!552 = distinct !DILexicalBlock(scope: !547, file: !69, line: 344, column: 8)
!553 = !DILocation(line: 344, column: 25, scope: !552)
!554 = !DILocation(line: 344, column: 8, scope: !547)
!555 = !DILocation(line: 347, column: 9, scope: !556)
!556 = distinct !DILexicalBlock(scope: !552, file: !69, line: 345, column: 5)
!557 = !DILocation(line: 348, column: 5, scope: !556)
!558 = !DILocation(line: 353, column: 14, scope: !559)
!559 = distinct !DILexicalBlock(scope: !552, file: !69, line: 350, column: 5)
!560 = !DILocation(line: 355, column: 8, scope: !561)
!561 = distinct !DILexicalBlock(scope: !547, file: !69, line: 355, column: 8)
!562 = !DILocation(line: 355, column: 25, scope: !561)
!563 = !DILocation(line: 355, column: 8, scope: !547)
!564 = !DILocalVariable(name: "i", scope: !565, file: !69, line: 358, type: !60)
!565 = distinct !DILexicalBlock(scope: !566, file: !69, line: 357, column: 9)
!566 = distinct !DILexicalBlock(scope: !561, file: !69, line: 356, column: 5)
!567 = !DILocation(line: 358, column: 17, scope: !565)
!568 = !DILocalVariable(name: "buffer", scope: !565, file: !69, line: 359, type: !59)
!569 = !DILocation(line: 359, column: 19, scope: !565)
!570 = !DILocation(line: 359, column: 35, scope: !565)
!571 = !DILocation(line: 359, column: 28, scope: !565)
!572 = !DILocation(line: 360, column: 17, scope: !573)
!573 = distinct !DILexicalBlock(scope: !565, file: !69, line: 360, column: 17)
!574 = !DILocation(line: 360, column: 24, scope: !573)
!575 = !DILocation(line: 360, column: 17, scope: !565)
!576 = !DILocation(line: 360, column: 34, scope: !577)
!577 = distinct !DILexicalBlock(scope: !573, file: !69, line: 360, column: 33)
!578 = !DILocation(line: 362, column: 20, scope: !579)
!579 = distinct !DILexicalBlock(scope: !565, file: !69, line: 362, column: 13)
!580 = !DILocation(line: 362, column: 18, scope: !579)
!581 = !DILocation(line: 362, column: 25, scope: !582)
!582 = distinct !DILexicalBlock(scope: !579, file: !69, line: 362, column: 13)
!583 = !DILocation(line: 362, column: 27, scope: !582)
!584 = !DILocation(line: 362, column: 13, scope: !579)
!585 = !DILocation(line: 364, column: 17, scope: !586)
!586 = distinct !DILexicalBlock(scope: !582, file: !69, line: 363, column: 13)
!587 = !DILocation(line: 364, column: 24, scope: !586)
!588 = !DILocation(line: 364, column: 27, scope: !586)
!589 = !DILocation(line: 365, column: 13, scope: !586)
!590 = !DILocation(line: 362, column: 34, scope: !582)
!591 = !DILocation(line: 362, column: 13, scope: !582)
!592 = distinct !{!592, !584, !593, !202}
!593 = !DILocation(line: 365, column: 13, scope: !579)
!594 = !DILocation(line: 368, column: 17, scope: !595)
!595 = distinct !DILexicalBlock(scope: !565, file: !69, line: 368, column: 17)
!596 = !DILocation(line: 368, column: 22, scope: !595)
!597 = !DILocation(line: 368, column: 17, scope: !565)
!598 = !DILocation(line: 370, column: 17, scope: !599)
!599 = distinct !DILexicalBlock(scope: !595, file: !69, line: 369, column: 13)
!600 = !DILocation(line: 370, column: 24, scope: !599)
!601 = !DILocation(line: 370, column: 30, scope: !599)
!602 = !DILocation(line: 372, column: 23, scope: !603)
!603 = distinct !DILexicalBlock(scope: !599, file: !69, line: 372, column: 17)
!604 = !DILocation(line: 372, column: 21, scope: !603)
!605 = !DILocation(line: 372, column: 28, scope: !606)
!606 = distinct !DILexicalBlock(scope: !603, file: !69, line: 372, column: 17)
!607 = !DILocation(line: 372, column: 30, scope: !606)
!608 = !DILocation(line: 372, column: 17, scope: !603)
!609 = !DILocation(line: 374, column: 34, scope: !610)
!610 = distinct !DILexicalBlock(scope: !606, file: !69, line: 373, column: 17)
!611 = !DILocation(line: 374, column: 41, scope: !610)
!612 = !DILocation(line: 374, column: 21, scope: !610)
!613 = !DILocation(line: 375, column: 17, scope: !610)
!614 = !DILocation(line: 372, column: 37, scope: !606)
!615 = !DILocation(line: 372, column: 17, scope: !606)
!616 = distinct !{!616, !608, !617, !202}
!617 = !DILocation(line: 375, column: 17, scope: !603)
!618 = !DILocation(line: 376, column: 13, scope: !599)
!619 = !DILocation(line: 379, column: 17, scope: !620)
!620 = distinct !DILexicalBlock(scope: !595, file: !69, line: 378, column: 13)
!621 = !DILocation(line: 381, column: 18, scope: !565)
!622 = !DILocation(line: 381, column: 13, scope: !565)
!623 = !DILocation(line: 383, column: 5, scope: !566)
!624 = !DILocation(line: 384, column: 1, scope: !547)
!625 = distinct !DISubprogram(name: "goodG2B2", scope: !69, file: !69, line: 387, type: !70, scopeLine: 388, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!626 = !DILocalVariable(name: "data", scope: !625, file: !69, line: 389, type: !60)
!627 = !DILocation(line: 389, column: 9, scope: !625)
!628 = !DILocation(line: 391, column: 10, scope: !625)
!629 = !DILocation(line: 392, column: 8, scope: !630)
!630 = distinct !DILexicalBlock(scope: !625, file: !69, line: 392, column: 8)
!631 = !DILocation(line: 392, column: 25, scope: !630)
!632 = !DILocation(line: 392, column: 8, scope: !625)
!633 = !DILocation(line: 396, column: 14, scope: !634)
!634 = distinct !DILexicalBlock(scope: !630, file: !69, line: 393, column: 5)
!635 = !DILocation(line: 397, column: 5, scope: !634)
!636 = !DILocation(line: 398, column: 8, scope: !637)
!637 = distinct !DILexicalBlock(scope: !625, file: !69, line: 398, column: 8)
!638 = !DILocation(line: 398, column: 25, scope: !637)
!639 = !DILocation(line: 398, column: 8, scope: !625)
!640 = !DILocalVariable(name: "i", scope: !641, file: !69, line: 401, type: !60)
!641 = distinct !DILexicalBlock(scope: !642, file: !69, line: 400, column: 9)
!642 = distinct !DILexicalBlock(scope: !637, file: !69, line: 399, column: 5)
!643 = !DILocation(line: 401, column: 17, scope: !641)
!644 = !DILocalVariable(name: "buffer", scope: !641, file: !69, line: 402, type: !59)
!645 = !DILocation(line: 402, column: 19, scope: !641)
!646 = !DILocation(line: 402, column: 35, scope: !641)
!647 = !DILocation(line: 402, column: 28, scope: !641)
!648 = !DILocation(line: 403, column: 17, scope: !649)
!649 = distinct !DILexicalBlock(scope: !641, file: !69, line: 403, column: 17)
!650 = !DILocation(line: 403, column: 24, scope: !649)
!651 = !DILocation(line: 403, column: 17, scope: !641)
!652 = !DILocation(line: 403, column: 34, scope: !653)
!653 = distinct !DILexicalBlock(scope: !649, file: !69, line: 403, column: 33)
!654 = !DILocation(line: 405, column: 20, scope: !655)
!655 = distinct !DILexicalBlock(scope: !641, file: !69, line: 405, column: 13)
!656 = !DILocation(line: 405, column: 18, scope: !655)
!657 = !DILocation(line: 405, column: 25, scope: !658)
!658 = distinct !DILexicalBlock(scope: !655, file: !69, line: 405, column: 13)
!659 = !DILocation(line: 405, column: 27, scope: !658)
!660 = !DILocation(line: 405, column: 13, scope: !655)
!661 = !DILocation(line: 407, column: 17, scope: !662)
!662 = distinct !DILexicalBlock(scope: !658, file: !69, line: 406, column: 13)
!663 = !DILocation(line: 407, column: 24, scope: !662)
!664 = !DILocation(line: 407, column: 27, scope: !662)
!665 = !DILocation(line: 408, column: 13, scope: !662)
!666 = !DILocation(line: 405, column: 34, scope: !658)
!667 = !DILocation(line: 405, column: 13, scope: !658)
!668 = distinct !{!668, !660, !669, !202}
!669 = !DILocation(line: 408, column: 13, scope: !655)
!670 = !DILocation(line: 411, column: 17, scope: !671)
!671 = distinct !DILexicalBlock(scope: !641, file: !69, line: 411, column: 17)
!672 = !DILocation(line: 411, column: 22, scope: !671)
!673 = !DILocation(line: 411, column: 17, scope: !641)
!674 = !DILocation(line: 413, column: 17, scope: !675)
!675 = distinct !DILexicalBlock(scope: !671, file: !69, line: 412, column: 13)
!676 = !DILocation(line: 413, column: 24, scope: !675)
!677 = !DILocation(line: 413, column: 30, scope: !675)
!678 = !DILocation(line: 415, column: 23, scope: !679)
!679 = distinct !DILexicalBlock(scope: !675, file: !69, line: 415, column: 17)
!680 = !DILocation(line: 415, column: 21, scope: !679)
!681 = !DILocation(line: 415, column: 28, scope: !682)
!682 = distinct !DILexicalBlock(scope: !679, file: !69, line: 415, column: 17)
!683 = !DILocation(line: 415, column: 30, scope: !682)
!684 = !DILocation(line: 415, column: 17, scope: !679)
!685 = !DILocation(line: 417, column: 34, scope: !686)
!686 = distinct !DILexicalBlock(scope: !682, file: !69, line: 416, column: 17)
!687 = !DILocation(line: 417, column: 41, scope: !686)
!688 = !DILocation(line: 417, column: 21, scope: !686)
!689 = !DILocation(line: 418, column: 17, scope: !686)
!690 = !DILocation(line: 415, column: 37, scope: !682)
!691 = !DILocation(line: 415, column: 17, scope: !682)
!692 = distinct !{!692, !684, !693, !202}
!693 = !DILocation(line: 418, column: 17, scope: !679)
!694 = !DILocation(line: 419, column: 13, scope: !675)
!695 = !DILocation(line: 422, column: 17, scope: !696)
!696 = distinct !DILexicalBlock(scope: !671, file: !69, line: 421, column: 13)
!697 = !DILocation(line: 424, column: 18, scope: !641)
!698 = !DILocation(line: 424, column: 13, scope: !641)
!699 = !DILocation(line: 426, column: 5, scope: !642)
!700 = !DILocation(line: 427, column: 1, scope: !625)
