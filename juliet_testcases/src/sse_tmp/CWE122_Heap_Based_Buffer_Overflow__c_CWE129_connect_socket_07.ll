; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_07_bad() #0 !dbg !72 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  %0 = load i32, i32* @staticFive, align 4, !dbg !79
  %cmp = icmp eq i32 %0, 5, !dbg !81
  br i1 %cmp, label %if.then, label %if.end23, !dbg !82

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !83, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !87, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 -1, i32* %connectSocket, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  br label %do.body, !dbg !114

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !115
  store i32 %call, i32* %connectSocket, align 4, !dbg !117
  %1 = load i32, i32* %connectSocket, align 4, !dbg !118
  %cmp1 = icmp eq i32 %1, -1, !dbg !120
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !121

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !122

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !124
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !125
  store i16 2, i16* %sin_family, align 4, !dbg !126
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !127
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !128
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !129
  store i32 %call3, i32* %s_addr, align 4, !dbg !130
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !131
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !132
  store i16 %call4, i16* %sin_port, align 2, !dbg !133
  %3 = load i32, i32* %connectSocket, align 4, !dbg !134
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !136
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !137
  %cmp6 = icmp eq i32 %call5, -1, !dbg !138
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !139

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !140

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !142
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !143
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !144
  %conv = trunc i64 %call9 to i32, !dbg !144
  store i32 %conv, i32* %recvResult, align 4, !dbg !145
  %6 = load i32, i32* %recvResult, align 4, !dbg !146
  %cmp10 = icmp eq i32 %6, -1, !dbg !148
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !149

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !150
  %cmp12 = icmp eq i32 %7, 0, !dbg !151
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !152

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !153

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !155
  %idxprom = sext i32 %8 to i64, !dbg !156
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !156
  store i8 0, i8* %arrayidx, align 1, !dbg !157
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !158
  %call17 = call i32 @atoi(i8* %arraydecay16) #10, !dbg !159
  store i32 %call17, i32* %data, align 4, !dbg !160
  br label %do.end, !dbg !161

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !162
  %cmp18 = icmp ne i32 %9, -1, !dbg !164
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !165

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !166
  %call21 = call i32 @close(i32 %10), !dbg !168
  br label %if.end22, !dbg !169

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !170

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @staticFive, align 4, !dbg !171
  %cmp24 = icmp eq i32 %11, 5, !dbg !173
  br i1 %cmp24, label %if.then26, label %if.end51, !dbg !174

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !175, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !179, metadata !DIExpression()), !dbg !180
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !181
  %12 = bitcast i8* %call27 to i32*, !dbg !182
  store i32* %12, i32** %buffer, align 8, !dbg !180
  %13 = load i32*, i32** %buffer, align 8, !dbg !183
  %cmp28 = icmp eq i32* %13, null, !dbg !185
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !186

if.then30:                                        ; preds = %if.then26
  call void @exit(i32 -1) #11, !dbg !187
  unreachable, !dbg !187

if.end31:                                         ; preds = %if.then26
  store i32 0, i32* %i, align 4, !dbg !189
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc, %if.end31
  %14 = load i32, i32* %i, align 4, !dbg !192
  %cmp32 = icmp slt i32 %14, 10, !dbg !194
  br i1 %cmp32, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !196
  %16 = load i32, i32* %i, align 4, !dbg !198
  %idxprom34 = sext i32 %16 to i64, !dbg !196
  %arrayidx35 = getelementptr inbounds i32, i32* %15, i64 %idxprom34, !dbg !196
  store i32 0, i32* %arrayidx35, align 4, !dbg !199
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !201
  %inc = add nsw i32 %17, 1, !dbg !201
  store i32 %inc, i32* %i, align 4, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !206
  %cmp36 = icmp sge i32 %18, 0, !dbg !208
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !209

if.then38:                                        ; preds = %for.end
  %19 = load i32*, i32** %buffer, align 8, !dbg !210
  %20 = load i32, i32* %data, align 4, !dbg !212
  %idxprom39 = sext i32 %20 to i64, !dbg !210
  %arrayidx40 = getelementptr inbounds i32, i32* %19, i64 %idxprom39, !dbg !210
  store i32 1, i32* %arrayidx40, align 4, !dbg !213
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond41, !dbg !216

for.cond41:                                       ; preds = %for.inc47, %if.then38
  %21 = load i32, i32* %i, align 4, !dbg !217
  %cmp42 = icmp slt i32 %21, 10, !dbg !219
  br i1 %cmp42, label %for.body44, label %for.end49, !dbg !220

for.body44:                                       ; preds = %for.cond41
  %22 = load i32*, i32** %buffer, align 8, !dbg !221
  %23 = load i32, i32* %i, align 4, !dbg !223
  %idxprom45 = sext i32 %23 to i64, !dbg !221
  %arrayidx46 = getelementptr inbounds i32, i32* %22, i64 %idxprom45, !dbg !221
  %24 = load i32, i32* %arrayidx46, align 4, !dbg !221
  call void @printIntLine(i32 %24), !dbg !224
  br label %for.inc47, !dbg !225

for.inc47:                                        ; preds = %for.body44
  %25 = load i32, i32* %i, align 4, !dbg !226
  %inc48 = add nsw i32 %25, 1, !dbg !226
  store i32 %inc48, i32* %i, align 4, !dbg !226
  br label %for.cond41, !dbg !227, !llvm.loop !228

for.end49:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !230

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !231
  br label %if.end50

if.end50:                                         ; preds = %if.else, %for.end49
  %26 = load i32*, i32** %buffer, align 8, !dbg !233
  %27 = bitcast i32* %26 to i8*, !dbg !233
  call void @free(i8* %27) #8, !dbg !234
  br label %if.end51, !dbg !235

if.end51:                                         ; preds = %if.end50, %if.end23
  ret void, !dbg !236
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_07_good() #0 !dbg !237 {
entry:
  call void @goodB2G1(), !dbg !238
  call void @goodB2G2(), !dbg !239
  call void @goodG2B1(), !dbg !240
  call void @goodG2B2(), !dbg !241
  ret void, !dbg !242
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !243 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !248, metadata !DIExpression()), !dbg !249
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !250, metadata !DIExpression()), !dbg !251
  %call = call i64 @time(i64* null) #8, !dbg !252
  %conv = trunc i64 %call to i32, !dbg !253
  call void @srand(i32 %conv) #8, !dbg !254
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !255
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_07_good(), !dbg !256
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !257
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !258
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_07_bad(), !dbg !259
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !260
  ret i32 0, !dbg !261
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !262 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 -1, i32* %data, align 4, !dbg !265
  %0 = load i32, i32* @staticFive, align 4, !dbg !266
  %cmp = icmp eq i32 %0, 5, !dbg !268
  br i1 %cmp, label %if.then, label %if.end23, !dbg !269

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !270, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !274, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !276, metadata !DIExpression()), !dbg !277
  store i32 -1, i32* %connectSocket, align 4, !dbg !277
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !278, metadata !DIExpression()), !dbg !279
  br label %do.body, !dbg !280

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !281
  store i32 %call, i32* %connectSocket, align 4, !dbg !283
  %1 = load i32, i32* %connectSocket, align 4, !dbg !284
  %cmp1 = icmp eq i32 %1, -1, !dbg !286
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !287

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !288

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !290
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !290
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !291
  store i16 2, i16* %sin_family, align 4, !dbg !292
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !293
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !294
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !295
  store i32 %call3, i32* %s_addr, align 4, !dbg !296
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !297
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !298
  store i16 %call4, i16* %sin_port, align 2, !dbg !299
  %3 = load i32, i32* %connectSocket, align 4, !dbg !300
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !302
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !303
  %cmp6 = icmp eq i32 %call5, -1, !dbg !304
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !305

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !306

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !308
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !309
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !310
  %conv = trunc i64 %call9 to i32, !dbg !310
  store i32 %conv, i32* %recvResult, align 4, !dbg !311
  %6 = load i32, i32* %recvResult, align 4, !dbg !312
  %cmp10 = icmp eq i32 %6, -1, !dbg !314
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !315

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !316
  %cmp12 = icmp eq i32 %7, 0, !dbg !317
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !318

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !319

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !321
  %idxprom = sext i32 %8 to i64, !dbg !322
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !322
  store i8 0, i8* %arrayidx, align 1, !dbg !323
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !324
  %call17 = call i32 @atoi(i8* %arraydecay16) #10, !dbg !325
  store i32 %call17, i32* %data, align 4, !dbg !326
  br label %do.end, !dbg !327

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !328
  %cmp18 = icmp ne i32 %9, -1, !dbg !330
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !331

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !332
  %call21 = call i32 @close(i32 %10), !dbg !334
  br label %if.end22, !dbg !335

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !336

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @staticFive, align 4, !dbg !337
  %cmp24 = icmp ne i32 %11, 5, !dbg !339
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !340

if.then26:                                        ; preds = %if.end23
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !341
  br label %if.end54, !dbg !343

if.else:                                          ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !344, metadata !DIExpression()), !dbg !347
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !348, metadata !DIExpression()), !dbg !349
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !350
  %12 = bitcast i8* %call27 to i32*, !dbg !351
  store i32* %12, i32** %buffer, align 8, !dbg !349
  %13 = load i32*, i32** %buffer, align 8, !dbg !352
  %cmp28 = icmp eq i32* %13, null, !dbg !354
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !355

if.then30:                                        ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !356
  unreachable, !dbg !356

if.end31:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !358
  br label %for.cond, !dbg !360

for.cond:                                         ; preds = %for.inc, %if.end31
  %14 = load i32, i32* %i, align 4, !dbg !361
  %cmp32 = icmp slt i32 %14, 10, !dbg !363
  br i1 %cmp32, label %for.body, label %for.end, !dbg !364

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !365
  %16 = load i32, i32* %i, align 4, !dbg !367
  %idxprom34 = sext i32 %16 to i64, !dbg !365
  %arrayidx35 = getelementptr inbounds i32, i32* %15, i64 %idxprom34, !dbg !365
  store i32 0, i32* %arrayidx35, align 4, !dbg !368
  br label %for.inc, !dbg !369

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !370
  %inc = add nsw i32 %17, 1, !dbg !370
  store i32 %inc, i32* %i, align 4, !dbg !370
  br label %for.cond, !dbg !371, !llvm.loop !372

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !374
  %cmp36 = icmp sge i32 %18, 0, !dbg !376
  br i1 %cmp36, label %land.lhs.true, label %if.else52, !dbg !377

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* %data, align 4, !dbg !378
  %cmp38 = icmp slt i32 %19, 10, !dbg !379
  br i1 %cmp38, label %if.then40, label %if.else52, !dbg !380

if.then40:                                        ; preds = %land.lhs.true
  %20 = load i32*, i32** %buffer, align 8, !dbg !381
  %21 = load i32, i32* %data, align 4, !dbg !383
  %idxprom41 = sext i32 %21 to i64, !dbg !381
  %arrayidx42 = getelementptr inbounds i32, i32* %20, i64 %idxprom41, !dbg !381
  store i32 1, i32* %arrayidx42, align 4, !dbg !384
  store i32 0, i32* %i, align 4, !dbg !385
  br label %for.cond43, !dbg !387

for.cond43:                                       ; preds = %for.inc49, %if.then40
  %22 = load i32, i32* %i, align 4, !dbg !388
  %cmp44 = icmp slt i32 %22, 10, !dbg !390
  br i1 %cmp44, label %for.body46, label %for.end51, !dbg !391

for.body46:                                       ; preds = %for.cond43
  %23 = load i32*, i32** %buffer, align 8, !dbg !392
  %24 = load i32, i32* %i, align 4, !dbg !394
  %idxprom47 = sext i32 %24 to i64, !dbg !392
  %arrayidx48 = getelementptr inbounds i32, i32* %23, i64 %idxprom47, !dbg !392
  %25 = load i32, i32* %arrayidx48, align 4, !dbg !392
  call void @printIntLine(i32 %25), !dbg !395
  br label %for.inc49, !dbg !396

for.inc49:                                        ; preds = %for.body46
  %26 = load i32, i32* %i, align 4, !dbg !397
  %inc50 = add nsw i32 %26, 1, !dbg !397
  store i32 %inc50, i32* %i, align 4, !dbg !397
  br label %for.cond43, !dbg !398, !llvm.loop !399

for.end51:                                        ; preds = %for.cond43
  br label %if.end53, !dbg !401

if.else52:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !402
  br label %if.end53

if.end53:                                         ; preds = %if.else52, %for.end51
  %27 = load i32*, i32** %buffer, align 8, !dbg !404
  %28 = bitcast i32* %27 to i8*, !dbg !404
  call void @free(i8* %28) #8, !dbg !405
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.then26
  ret void, !dbg !406
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !407 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !408, metadata !DIExpression()), !dbg !409
  store i32 -1, i32* %data, align 4, !dbg !410
  %0 = load i32, i32* @staticFive, align 4, !dbg !411
  %cmp = icmp eq i32 %0, 5, !dbg !413
  br i1 %cmp, label %if.then, label %if.end23, !dbg !414

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !415, metadata !DIExpression()), !dbg !418
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !419, metadata !DIExpression()), !dbg !420
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !421, metadata !DIExpression()), !dbg !422
  store i32 -1, i32* %connectSocket, align 4, !dbg !422
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !423, metadata !DIExpression()), !dbg !424
  br label %do.body, !dbg !425

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !426
  store i32 %call, i32* %connectSocket, align 4, !dbg !428
  %1 = load i32, i32* %connectSocket, align 4, !dbg !429
  %cmp1 = icmp eq i32 %1, -1, !dbg !431
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !432

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !433

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !435
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !435
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !436
  store i16 2, i16* %sin_family, align 4, !dbg !437
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !438
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !439
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !440
  store i32 %call3, i32* %s_addr, align 4, !dbg !441
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !442
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !443
  store i16 %call4, i16* %sin_port, align 2, !dbg !444
  %3 = load i32, i32* %connectSocket, align 4, !dbg !445
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !447
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !448
  %cmp6 = icmp eq i32 %call5, -1, !dbg !449
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !450

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !451

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !453
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !454
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !455
  %conv = trunc i64 %call9 to i32, !dbg !455
  store i32 %conv, i32* %recvResult, align 4, !dbg !456
  %6 = load i32, i32* %recvResult, align 4, !dbg !457
  %cmp10 = icmp eq i32 %6, -1, !dbg !459
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !460

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !461
  %cmp12 = icmp eq i32 %7, 0, !dbg !462
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !463

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !464

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !466
  %idxprom = sext i32 %8 to i64, !dbg !467
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !467
  store i8 0, i8* %arrayidx, align 1, !dbg !468
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !469
  %call17 = call i32 @atoi(i8* %arraydecay16) #10, !dbg !470
  store i32 %call17, i32* %data, align 4, !dbg !471
  br label %do.end, !dbg !472

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !473
  %cmp18 = icmp ne i32 %9, -1, !dbg !475
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !476

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !477
  %call21 = call i32 @close(i32 %10), !dbg !479
  br label %if.end22, !dbg !480

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !481

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @staticFive, align 4, !dbg !482
  %cmp24 = icmp eq i32 %11, 5, !dbg !484
  br i1 %cmp24, label %if.then26, label %if.end53, !dbg !485

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !486, metadata !DIExpression()), !dbg !489
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !490, metadata !DIExpression()), !dbg !491
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !492
  %12 = bitcast i8* %call27 to i32*, !dbg !493
  store i32* %12, i32** %buffer, align 8, !dbg !491
  %13 = load i32*, i32** %buffer, align 8, !dbg !494
  %cmp28 = icmp eq i32* %13, null, !dbg !496
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !497

if.then30:                                        ; preds = %if.then26
  call void @exit(i32 -1) #11, !dbg !498
  unreachable, !dbg !498

if.end31:                                         ; preds = %if.then26
  store i32 0, i32* %i, align 4, !dbg !500
  br label %for.cond, !dbg !502

for.cond:                                         ; preds = %for.inc, %if.end31
  %14 = load i32, i32* %i, align 4, !dbg !503
  %cmp32 = icmp slt i32 %14, 10, !dbg !505
  br i1 %cmp32, label %for.body, label %for.end, !dbg !506

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !507
  %16 = load i32, i32* %i, align 4, !dbg !509
  %idxprom34 = sext i32 %16 to i64, !dbg !507
  %arrayidx35 = getelementptr inbounds i32, i32* %15, i64 %idxprom34, !dbg !507
  store i32 0, i32* %arrayidx35, align 4, !dbg !510
  br label %for.inc, !dbg !511

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !512
  %inc = add nsw i32 %17, 1, !dbg !512
  store i32 %inc, i32* %i, align 4, !dbg !512
  br label %for.cond, !dbg !513, !llvm.loop !514

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !516
  %cmp36 = icmp sge i32 %18, 0, !dbg !518
  br i1 %cmp36, label %land.lhs.true, label %if.else, !dbg !519

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* %data, align 4, !dbg !520
  %cmp38 = icmp slt i32 %19, 10, !dbg !521
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !522

if.then40:                                        ; preds = %land.lhs.true
  %20 = load i32*, i32** %buffer, align 8, !dbg !523
  %21 = load i32, i32* %data, align 4, !dbg !525
  %idxprom41 = sext i32 %21 to i64, !dbg !523
  %arrayidx42 = getelementptr inbounds i32, i32* %20, i64 %idxprom41, !dbg !523
  store i32 1, i32* %arrayidx42, align 4, !dbg !526
  store i32 0, i32* %i, align 4, !dbg !527
  br label %for.cond43, !dbg !529

for.cond43:                                       ; preds = %for.inc49, %if.then40
  %22 = load i32, i32* %i, align 4, !dbg !530
  %cmp44 = icmp slt i32 %22, 10, !dbg !532
  br i1 %cmp44, label %for.body46, label %for.end51, !dbg !533

for.body46:                                       ; preds = %for.cond43
  %23 = load i32*, i32** %buffer, align 8, !dbg !534
  %24 = load i32, i32* %i, align 4, !dbg !536
  %idxprom47 = sext i32 %24 to i64, !dbg !534
  %arrayidx48 = getelementptr inbounds i32, i32* %23, i64 %idxprom47, !dbg !534
  %25 = load i32, i32* %arrayidx48, align 4, !dbg !534
  call void @printIntLine(i32 %25), !dbg !537
  br label %for.inc49, !dbg !538

for.inc49:                                        ; preds = %for.body46
  %26 = load i32, i32* %i, align 4, !dbg !539
  %inc50 = add nsw i32 %26, 1, !dbg !539
  store i32 %inc50, i32* %i, align 4, !dbg !539
  br label %for.cond43, !dbg !540, !llvm.loop !541

for.end51:                                        ; preds = %for.cond43
  br label %if.end52, !dbg !543

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !544
  br label %if.end52

if.end52:                                         ; preds = %if.else, %for.end51
  %27 = load i32*, i32** %buffer, align 8, !dbg !546
  %28 = bitcast i32* %27 to i8*, !dbg !546
  call void @free(i8* %28) #8, !dbg !547
  br label %if.end53, !dbg !548

if.end53:                                         ; preds = %if.end52, %if.end23
  ret void, !dbg !549
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !550 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !551, metadata !DIExpression()), !dbg !552
  store i32 -1, i32* %data, align 4, !dbg !553
  %0 = load i32, i32* @staticFive, align 4, !dbg !554
  %cmp = icmp ne i32 %0, 5, !dbg !556
  br i1 %cmp, label %if.then, label %if.else, !dbg !557

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !558
  br label %if.end, !dbg !560

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !561
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !563
  %cmp1 = icmp eq i32 %1, 5, !dbg !565
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !566

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !567, metadata !DIExpression()), !dbg !570
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !571, metadata !DIExpression()), !dbg !572
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !573
  %2 = bitcast i8* %call to i32*, !dbg !574
  store i32* %2, i32** %buffer, align 8, !dbg !572
  %3 = load i32*, i32** %buffer, align 8, !dbg !575
  %cmp3 = icmp eq i32* %3, null, !dbg !577
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !578

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !579
  unreachable, !dbg !579

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !581
  br label %for.cond, !dbg !583

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !584
  %cmp6 = icmp slt i32 %4, 10, !dbg !586
  br i1 %cmp6, label %for.body, label %for.end, !dbg !587

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !588
  %6 = load i32, i32* %i, align 4, !dbg !590
  %idxprom = sext i32 %6 to i64, !dbg !588
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !588
  store i32 0, i32* %arrayidx, align 4, !dbg !591
  br label %for.inc, !dbg !592

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !593
  %inc = add nsw i32 %7, 1, !dbg !593
  store i32 %inc, i32* %i, align 4, !dbg !593
  br label %for.cond, !dbg !594, !llvm.loop !595

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !597
  %cmp7 = icmp sge i32 %8, 0, !dbg !599
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !600

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !601
  %10 = load i32, i32* %data, align 4, !dbg !603
  %idxprom9 = sext i32 %10 to i64, !dbg !601
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !601
  store i32 1, i32* %arrayidx10, align 4, !dbg !604
  store i32 0, i32* %i, align 4, !dbg !605
  br label %for.cond11, !dbg !607

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !608
  %cmp12 = icmp slt i32 %11, 10, !dbg !610
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !611

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !612
  %13 = load i32, i32* %i, align 4, !dbg !614
  %idxprom14 = sext i32 %13 to i64, !dbg !612
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !612
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !612
  call void @printIntLine(i32 %14), !dbg !615
  br label %for.inc16, !dbg !616

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !617
  %inc17 = add nsw i32 %15, 1, !dbg !617
  store i32 %inc17, i32* %i, align 4, !dbg !617
  br label %for.cond11, !dbg !618, !llvm.loop !619

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !621

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !622
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !624
  %17 = bitcast i32* %16 to i8*, !dbg !624
  call void @free(i8* %17) #8, !dbg !625
  br label %if.end21, !dbg !626

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !627
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !628 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !629, metadata !DIExpression()), !dbg !630
  store i32 -1, i32* %data, align 4, !dbg !631
  %0 = load i32, i32* @staticFive, align 4, !dbg !632
  %cmp = icmp eq i32 %0, 5, !dbg !634
  br i1 %cmp, label %if.then, label %if.end, !dbg !635

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !636
  br label %if.end, !dbg !638

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !639
  %cmp1 = icmp eq i32 %1, 5, !dbg !641
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !642

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !643, metadata !DIExpression()), !dbg !646
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !647, metadata !DIExpression()), !dbg !648
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !649
  %2 = bitcast i8* %call to i32*, !dbg !650
  store i32* %2, i32** %buffer, align 8, !dbg !648
  %3 = load i32*, i32** %buffer, align 8, !dbg !651
  %cmp3 = icmp eq i32* %3, null, !dbg !653
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !654

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !655
  unreachable, !dbg !655

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !657
  br label %for.cond, !dbg !659

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !660
  %cmp6 = icmp slt i32 %4, 10, !dbg !662
  br i1 %cmp6, label %for.body, label %for.end, !dbg !663

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !664
  %6 = load i32, i32* %i, align 4, !dbg !666
  %idxprom = sext i32 %6 to i64, !dbg !664
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !664
  store i32 0, i32* %arrayidx, align 4, !dbg !667
  br label %for.inc, !dbg !668

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !669
  %inc = add nsw i32 %7, 1, !dbg !669
  store i32 %inc, i32* %i, align 4, !dbg !669
  br label %for.cond, !dbg !670, !llvm.loop !671

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !673
  %cmp7 = icmp sge i32 %8, 0, !dbg !675
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !676

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !677
  %10 = load i32, i32* %data, align 4, !dbg !679
  %idxprom9 = sext i32 %10 to i64, !dbg !677
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !677
  store i32 1, i32* %arrayidx10, align 4, !dbg !680
  store i32 0, i32* %i, align 4, !dbg !681
  br label %for.cond11, !dbg !683

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !684
  %cmp12 = icmp slt i32 %11, 10, !dbg !686
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !687

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !688
  %13 = load i32, i32* %i, align 4, !dbg !690
  %idxprom14 = sext i32 %13 to i64, !dbg !688
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !688
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !688
  call void @printIntLine(i32 %14), !dbg !691
  br label %for.inc16, !dbg !692

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !693
  %inc17 = add nsw i32 %15, 1, !dbg !693
  store i32 %inc17, i32* %i, align 4, !dbg !693
  br label %for.cond11, !dbg !694, !llvm.loop !695

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !697

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !698
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !700
  %17 = bitcast i32* %16 to i8*, !dbg !700
  call void @free(i8* %17) #8, !dbg !701
  br label %if.end20, !dbg !702

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !703
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!66, !67, !68, !69, !70}
!llvm.ident = !{!71}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !65, line: 45, type: !62, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !64, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{!5, !18}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !6, line: 24, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17}
!9 = !DIEnumerator(name: "SOCK_STREAM", value: 1)
!10 = !DIEnumerator(name: "SOCK_DGRAM", value: 2)
!11 = !DIEnumerator(name: "SOCK_RAW", value: 3)
!12 = !DIEnumerator(name: "SOCK_RDM", value: 4)
!13 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5)
!14 = !DIEnumerator(name: "SOCK_DCCP", value: 6)
!15 = !DIEnumerator(name: "SOCK_PACKET", value: 10)
!16 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288)
!17 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048)
!18 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !19, line: 40, baseType: !7, size: 32, elements: !20)
!19 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!20 = !{!21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46}
!21 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!22 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!23 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!24 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!25 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!26 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!27 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!28 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!29 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!30 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!31 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!32 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!33 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!34 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!35 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!36 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!37 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!38 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!39 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!40 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!41 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!42 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!43 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!44 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!45 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!46 = !DIEnumerator(name: "IPPROTO_MAX", value: 256)
!47 = !{!48, !61, !63, !7}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !50, line: 178, size: 128, elements: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!51 = !{!52, !56}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !49, file: !50, line: 180, baseType: !53, size: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !54, line: 28, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!55 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !49, file: !50, line: 181, baseType: !57, size: 112, offset: 16)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 112, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 14)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!64 = !{!0}
!65 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_07.c", directory: "/home/joelyang/SSE-Assessment")
!66 = !{i32 7, !"Dwarf Version", i32 4}
!67 = !{i32 2, !"Debug Info Version", i32 3}
!68 = !{i32 1, !"wchar_size", i32 4}
!69 = !{i32 7, !"uwtable", i32 1}
!70 = !{i32 7, !"frame-pointer", i32 2}
!71 = !{!"clang version 13.0.0"}
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_07_bad", scope: !65, file: !65, line: 49, type: !73, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !75)
!73 = !DISubroutineType(types: !74)
!74 = !{null}
!75 = !{}
!76 = !DILocalVariable(name: "data", scope: !72, file: !65, line: 51, type: !62)
!77 = !DILocation(line: 51, column: 9, scope: !72)
!78 = !DILocation(line: 53, column: 10, scope: !72)
!79 = !DILocation(line: 54, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !65, line: 54, column: 8)
!81 = !DILocation(line: 54, column: 18, scope: !80)
!82 = !DILocation(line: 54, column: 8, scope: !72)
!83 = !DILocalVariable(name: "recvResult", scope: !84, file: !65, line: 61, type: !62)
!84 = distinct !DILexicalBlock(scope: !85, file: !65, line: 56, column: 9)
!85 = distinct !DILexicalBlock(scope: !80, file: !65, line: 55, column: 5)
!86 = !DILocation(line: 61, column: 17, scope: !84)
!87 = !DILocalVariable(name: "service", scope: !84, file: !65, line: 62, type: !88)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !89)
!89 = !{!90, !91, !97, !104}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !88, file: !19, line: 240, baseType: !53, size: 16)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !88, file: !19, line: 241, baseType: !92, size: 16, offset: 16)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !94, line: 25, baseType: !95)
!94 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !96, line: 40, baseType: !55)
!96 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !88, file: !19, line: 242, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !19, line: 33, baseType: !101, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !94, line: 26, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !96, line: 42, baseType: !7)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !88, file: !19, line: 245, baseType: !105, size: 64, offset: 64)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 64, elements: !107)
!106 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!107 = !{!108}
!108 = !DISubrange(count: 8)
!109 = !DILocation(line: 62, column: 32, scope: !84)
!110 = !DILocalVariable(name: "connectSocket", scope: !84, file: !65, line: 63, type: !62)
!111 = !DILocation(line: 63, column: 20, scope: !84)
!112 = !DILocalVariable(name: "inputBuffer", scope: !84, file: !65, line: 64, type: !57)
!113 = !DILocation(line: 64, column: 18, scope: !84)
!114 = !DILocation(line: 65, column: 13, scope: !84)
!115 = !DILocation(line: 75, column: 33, scope: !116)
!116 = distinct !DILexicalBlock(scope: !84, file: !65, line: 66, column: 13)
!117 = !DILocation(line: 75, column: 31, scope: !116)
!118 = !DILocation(line: 76, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !65, line: 76, column: 21)
!120 = !DILocation(line: 76, column: 35, scope: !119)
!121 = !DILocation(line: 76, column: 21, scope: !116)
!122 = !DILocation(line: 78, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !65, line: 77, column: 17)
!124 = !DILocation(line: 80, column: 17, scope: !116)
!125 = !DILocation(line: 81, column: 25, scope: !116)
!126 = !DILocation(line: 81, column: 36, scope: !116)
!127 = !DILocation(line: 82, column: 43, scope: !116)
!128 = !DILocation(line: 82, column: 25, scope: !116)
!129 = !DILocation(line: 82, column: 34, scope: !116)
!130 = !DILocation(line: 82, column: 41, scope: !116)
!131 = !DILocation(line: 83, column: 36, scope: !116)
!132 = !DILocation(line: 83, column: 25, scope: !116)
!133 = !DILocation(line: 83, column: 34, scope: !116)
!134 = !DILocation(line: 84, column: 29, scope: !135)
!135 = distinct !DILexicalBlock(scope: !116, file: !65, line: 84, column: 21)
!136 = !DILocation(line: 84, column: 44, scope: !135)
!137 = !DILocation(line: 84, column: 21, scope: !135)
!138 = !DILocation(line: 84, column: 89, scope: !135)
!139 = !DILocation(line: 84, column: 21, scope: !116)
!140 = !DILocation(line: 86, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !65, line: 85, column: 17)
!142 = !DILocation(line: 90, column: 35, scope: !116)
!143 = !DILocation(line: 90, column: 50, scope: !116)
!144 = !DILocation(line: 90, column: 30, scope: !116)
!145 = !DILocation(line: 90, column: 28, scope: !116)
!146 = !DILocation(line: 91, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !116, file: !65, line: 91, column: 21)
!148 = !DILocation(line: 91, column: 32, scope: !147)
!149 = !DILocation(line: 91, column: 48, scope: !147)
!150 = !DILocation(line: 91, column: 51, scope: !147)
!151 = !DILocation(line: 91, column: 62, scope: !147)
!152 = !DILocation(line: 91, column: 21, scope: !116)
!153 = !DILocation(line: 93, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !147, file: !65, line: 92, column: 17)
!155 = !DILocation(line: 96, column: 29, scope: !116)
!156 = !DILocation(line: 96, column: 17, scope: !116)
!157 = !DILocation(line: 96, column: 41, scope: !116)
!158 = !DILocation(line: 98, column: 29, scope: !116)
!159 = !DILocation(line: 98, column: 24, scope: !116)
!160 = !DILocation(line: 98, column: 22, scope: !116)
!161 = !DILocation(line: 99, column: 13, scope: !116)
!162 = !DILocation(line: 101, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !84, file: !65, line: 101, column: 17)
!164 = !DILocation(line: 101, column: 31, scope: !163)
!165 = !DILocation(line: 101, column: 17, scope: !84)
!166 = !DILocation(line: 103, column: 30, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !65, line: 102, column: 13)
!168 = !DILocation(line: 103, column: 17, scope: !167)
!169 = !DILocation(line: 104, column: 13, scope: !167)
!170 = !DILocation(line: 112, column: 5, scope: !85)
!171 = !DILocation(line: 113, column: 8, scope: !172)
!172 = distinct !DILexicalBlock(scope: !72, file: !65, line: 113, column: 8)
!173 = !DILocation(line: 113, column: 18, scope: !172)
!174 = !DILocation(line: 113, column: 8, scope: !72)
!175 = !DILocalVariable(name: "i", scope: !176, file: !65, line: 116, type: !62)
!176 = distinct !DILexicalBlock(scope: !177, file: !65, line: 115, column: 9)
!177 = distinct !DILexicalBlock(scope: !172, file: !65, line: 114, column: 5)
!178 = !DILocation(line: 116, column: 17, scope: !176)
!179 = !DILocalVariable(name: "buffer", scope: !176, file: !65, line: 117, type: !61)
!180 = !DILocation(line: 117, column: 19, scope: !176)
!181 = !DILocation(line: 117, column: 35, scope: !176)
!182 = !DILocation(line: 117, column: 28, scope: !176)
!183 = !DILocation(line: 118, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !176, file: !65, line: 118, column: 17)
!185 = !DILocation(line: 118, column: 24, scope: !184)
!186 = !DILocation(line: 118, column: 17, scope: !176)
!187 = !DILocation(line: 118, column: 34, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !65, line: 118, column: 33)
!189 = !DILocation(line: 120, column: 20, scope: !190)
!190 = distinct !DILexicalBlock(scope: !176, file: !65, line: 120, column: 13)
!191 = !DILocation(line: 120, column: 18, scope: !190)
!192 = !DILocation(line: 120, column: 25, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !65, line: 120, column: 13)
!194 = !DILocation(line: 120, column: 27, scope: !193)
!195 = !DILocation(line: 120, column: 13, scope: !190)
!196 = !DILocation(line: 122, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !65, line: 121, column: 13)
!198 = !DILocation(line: 122, column: 24, scope: !197)
!199 = !DILocation(line: 122, column: 27, scope: !197)
!200 = !DILocation(line: 123, column: 13, scope: !197)
!201 = !DILocation(line: 120, column: 34, scope: !193)
!202 = !DILocation(line: 120, column: 13, scope: !193)
!203 = distinct !{!203, !195, !204, !205}
!204 = !DILocation(line: 123, column: 13, scope: !190)
!205 = !{!"llvm.loop.mustprogress"}
!206 = !DILocation(line: 126, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !176, file: !65, line: 126, column: 17)
!208 = !DILocation(line: 126, column: 22, scope: !207)
!209 = !DILocation(line: 126, column: 17, scope: !176)
!210 = !DILocation(line: 128, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !65, line: 127, column: 13)
!212 = !DILocation(line: 128, column: 24, scope: !211)
!213 = !DILocation(line: 128, column: 30, scope: !211)
!214 = !DILocation(line: 130, column: 23, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !65, line: 130, column: 17)
!216 = !DILocation(line: 130, column: 21, scope: !215)
!217 = !DILocation(line: 130, column: 28, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !65, line: 130, column: 17)
!219 = !DILocation(line: 130, column: 30, scope: !218)
!220 = !DILocation(line: 130, column: 17, scope: !215)
!221 = !DILocation(line: 132, column: 34, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !65, line: 131, column: 17)
!223 = !DILocation(line: 132, column: 41, scope: !222)
!224 = !DILocation(line: 132, column: 21, scope: !222)
!225 = !DILocation(line: 133, column: 17, scope: !222)
!226 = !DILocation(line: 130, column: 37, scope: !218)
!227 = !DILocation(line: 130, column: 17, scope: !218)
!228 = distinct !{!228, !220, !229, !205}
!229 = !DILocation(line: 133, column: 17, scope: !215)
!230 = !DILocation(line: 134, column: 13, scope: !211)
!231 = !DILocation(line: 137, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !207, file: !65, line: 136, column: 13)
!233 = !DILocation(line: 139, column: 18, scope: !176)
!234 = !DILocation(line: 139, column: 13, scope: !176)
!235 = !DILocation(line: 141, column: 5, scope: !177)
!236 = !DILocation(line: 142, column: 1, scope: !72)
!237 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_07_good", scope: !65, file: !65, line: 434, type: !73, scopeLine: 435, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !75)
!238 = !DILocation(line: 436, column: 5, scope: !237)
!239 = !DILocation(line: 437, column: 5, scope: !237)
!240 = !DILocation(line: 438, column: 5, scope: !237)
!241 = !DILocation(line: 439, column: 5, scope: !237)
!242 = !DILocation(line: 440, column: 1, scope: !237)
!243 = distinct !DISubprogram(name: "main", scope: !65, file: !65, line: 451, type: !244, scopeLine: 452, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !75)
!244 = !DISubroutineType(types: !245)
!245 = !{!62, !62, !246}
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!248 = !DILocalVariable(name: "argc", arg: 1, scope: !243, file: !65, line: 451, type: !62)
!249 = !DILocation(line: 451, column: 14, scope: !243)
!250 = !DILocalVariable(name: "argv", arg: 2, scope: !243, file: !65, line: 451, type: !246)
!251 = !DILocation(line: 451, column: 27, scope: !243)
!252 = !DILocation(line: 454, column: 22, scope: !243)
!253 = !DILocation(line: 454, column: 12, scope: !243)
!254 = !DILocation(line: 454, column: 5, scope: !243)
!255 = !DILocation(line: 456, column: 5, scope: !243)
!256 = !DILocation(line: 457, column: 5, scope: !243)
!257 = !DILocation(line: 458, column: 5, scope: !243)
!258 = !DILocation(line: 461, column: 5, scope: !243)
!259 = !DILocation(line: 462, column: 5, scope: !243)
!260 = !DILocation(line: 463, column: 5, scope: !243)
!261 = !DILocation(line: 465, column: 5, scope: !243)
!262 = distinct !DISubprogram(name: "goodB2G1", scope: !65, file: !65, line: 149, type: !73, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!263 = !DILocalVariable(name: "data", scope: !262, file: !65, line: 151, type: !62)
!264 = !DILocation(line: 151, column: 9, scope: !262)
!265 = !DILocation(line: 153, column: 10, scope: !262)
!266 = !DILocation(line: 154, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !262, file: !65, line: 154, column: 8)
!268 = !DILocation(line: 154, column: 18, scope: !267)
!269 = !DILocation(line: 154, column: 8, scope: !262)
!270 = !DILocalVariable(name: "recvResult", scope: !271, file: !65, line: 161, type: !62)
!271 = distinct !DILexicalBlock(scope: !272, file: !65, line: 156, column: 9)
!272 = distinct !DILexicalBlock(scope: !267, file: !65, line: 155, column: 5)
!273 = !DILocation(line: 161, column: 17, scope: !271)
!274 = !DILocalVariable(name: "service", scope: !271, file: !65, line: 162, type: !88)
!275 = !DILocation(line: 162, column: 32, scope: !271)
!276 = !DILocalVariable(name: "connectSocket", scope: !271, file: !65, line: 163, type: !62)
!277 = !DILocation(line: 163, column: 20, scope: !271)
!278 = !DILocalVariable(name: "inputBuffer", scope: !271, file: !65, line: 164, type: !57)
!279 = !DILocation(line: 164, column: 18, scope: !271)
!280 = !DILocation(line: 165, column: 13, scope: !271)
!281 = !DILocation(line: 175, column: 33, scope: !282)
!282 = distinct !DILexicalBlock(scope: !271, file: !65, line: 166, column: 13)
!283 = !DILocation(line: 175, column: 31, scope: !282)
!284 = !DILocation(line: 176, column: 21, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !65, line: 176, column: 21)
!286 = !DILocation(line: 176, column: 35, scope: !285)
!287 = !DILocation(line: 176, column: 21, scope: !282)
!288 = !DILocation(line: 178, column: 21, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !65, line: 177, column: 17)
!290 = !DILocation(line: 180, column: 17, scope: !282)
!291 = !DILocation(line: 181, column: 25, scope: !282)
!292 = !DILocation(line: 181, column: 36, scope: !282)
!293 = !DILocation(line: 182, column: 43, scope: !282)
!294 = !DILocation(line: 182, column: 25, scope: !282)
!295 = !DILocation(line: 182, column: 34, scope: !282)
!296 = !DILocation(line: 182, column: 41, scope: !282)
!297 = !DILocation(line: 183, column: 36, scope: !282)
!298 = !DILocation(line: 183, column: 25, scope: !282)
!299 = !DILocation(line: 183, column: 34, scope: !282)
!300 = !DILocation(line: 184, column: 29, scope: !301)
!301 = distinct !DILexicalBlock(scope: !282, file: !65, line: 184, column: 21)
!302 = !DILocation(line: 184, column: 44, scope: !301)
!303 = !DILocation(line: 184, column: 21, scope: !301)
!304 = !DILocation(line: 184, column: 89, scope: !301)
!305 = !DILocation(line: 184, column: 21, scope: !282)
!306 = !DILocation(line: 186, column: 21, scope: !307)
!307 = distinct !DILexicalBlock(scope: !301, file: !65, line: 185, column: 17)
!308 = !DILocation(line: 190, column: 35, scope: !282)
!309 = !DILocation(line: 190, column: 50, scope: !282)
!310 = !DILocation(line: 190, column: 30, scope: !282)
!311 = !DILocation(line: 190, column: 28, scope: !282)
!312 = !DILocation(line: 191, column: 21, scope: !313)
!313 = distinct !DILexicalBlock(scope: !282, file: !65, line: 191, column: 21)
!314 = !DILocation(line: 191, column: 32, scope: !313)
!315 = !DILocation(line: 191, column: 48, scope: !313)
!316 = !DILocation(line: 191, column: 51, scope: !313)
!317 = !DILocation(line: 191, column: 62, scope: !313)
!318 = !DILocation(line: 191, column: 21, scope: !282)
!319 = !DILocation(line: 193, column: 21, scope: !320)
!320 = distinct !DILexicalBlock(scope: !313, file: !65, line: 192, column: 17)
!321 = !DILocation(line: 196, column: 29, scope: !282)
!322 = !DILocation(line: 196, column: 17, scope: !282)
!323 = !DILocation(line: 196, column: 41, scope: !282)
!324 = !DILocation(line: 198, column: 29, scope: !282)
!325 = !DILocation(line: 198, column: 24, scope: !282)
!326 = !DILocation(line: 198, column: 22, scope: !282)
!327 = !DILocation(line: 199, column: 13, scope: !282)
!328 = !DILocation(line: 201, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !271, file: !65, line: 201, column: 17)
!330 = !DILocation(line: 201, column: 31, scope: !329)
!331 = !DILocation(line: 201, column: 17, scope: !271)
!332 = !DILocation(line: 203, column: 30, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !65, line: 202, column: 13)
!334 = !DILocation(line: 203, column: 17, scope: !333)
!335 = !DILocation(line: 204, column: 13, scope: !333)
!336 = !DILocation(line: 212, column: 5, scope: !272)
!337 = !DILocation(line: 213, column: 8, scope: !338)
!338 = distinct !DILexicalBlock(scope: !262, file: !65, line: 213, column: 8)
!339 = !DILocation(line: 213, column: 18, scope: !338)
!340 = !DILocation(line: 213, column: 8, scope: !262)
!341 = !DILocation(line: 216, column: 9, scope: !342)
!342 = distinct !DILexicalBlock(scope: !338, file: !65, line: 214, column: 5)
!343 = !DILocation(line: 217, column: 5, scope: !342)
!344 = !DILocalVariable(name: "i", scope: !345, file: !65, line: 221, type: !62)
!345 = distinct !DILexicalBlock(scope: !346, file: !65, line: 220, column: 9)
!346 = distinct !DILexicalBlock(scope: !338, file: !65, line: 219, column: 5)
!347 = !DILocation(line: 221, column: 17, scope: !345)
!348 = !DILocalVariable(name: "buffer", scope: !345, file: !65, line: 222, type: !61)
!349 = !DILocation(line: 222, column: 19, scope: !345)
!350 = !DILocation(line: 222, column: 35, scope: !345)
!351 = !DILocation(line: 222, column: 28, scope: !345)
!352 = !DILocation(line: 223, column: 17, scope: !353)
!353 = distinct !DILexicalBlock(scope: !345, file: !65, line: 223, column: 17)
!354 = !DILocation(line: 223, column: 24, scope: !353)
!355 = !DILocation(line: 223, column: 17, scope: !345)
!356 = !DILocation(line: 223, column: 34, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !65, line: 223, column: 33)
!358 = !DILocation(line: 225, column: 20, scope: !359)
!359 = distinct !DILexicalBlock(scope: !345, file: !65, line: 225, column: 13)
!360 = !DILocation(line: 225, column: 18, scope: !359)
!361 = !DILocation(line: 225, column: 25, scope: !362)
!362 = distinct !DILexicalBlock(scope: !359, file: !65, line: 225, column: 13)
!363 = !DILocation(line: 225, column: 27, scope: !362)
!364 = !DILocation(line: 225, column: 13, scope: !359)
!365 = !DILocation(line: 227, column: 17, scope: !366)
!366 = distinct !DILexicalBlock(scope: !362, file: !65, line: 226, column: 13)
!367 = !DILocation(line: 227, column: 24, scope: !366)
!368 = !DILocation(line: 227, column: 27, scope: !366)
!369 = !DILocation(line: 228, column: 13, scope: !366)
!370 = !DILocation(line: 225, column: 34, scope: !362)
!371 = !DILocation(line: 225, column: 13, scope: !362)
!372 = distinct !{!372, !364, !373, !205}
!373 = !DILocation(line: 228, column: 13, scope: !359)
!374 = !DILocation(line: 230, column: 17, scope: !375)
!375 = distinct !DILexicalBlock(scope: !345, file: !65, line: 230, column: 17)
!376 = !DILocation(line: 230, column: 22, scope: !375)
!377 = !DILocation(line: 230, column: 27, scope: !375)
!378 = !DILocation(line: 230, column: 30, scope: !375)
!379 = !DILocation(line: 230, column: 35, scope: !375)
!380 = !DILocation(line: 230, column: 17, scope: !345)
!381 = !DILocation(line: 232, column: 17, scope: !382)
!382 = distinct !DILexicalBlock(scope: !375, file: !65, line: 231, column: 13)
!383 = !DILocation(line: 232, column: 24, scope: !382)
!384 = !DILocation(line: 232, column: 30, scope: !382)
!385 = !DILocation(line: 234, column: 23, scope: !386)
!386 = distinct !DILexicalBlock(scope: !382, file: !65, line: 234, column: 17)
!387 = !DILocation(line: 234, column: 21, scope: !386)
!388 = !DILocation(line: 234, column: 28, scope: !389)
!389 = distinct !DILexicalBlock(scope: !386, file: !65, line: 234, column: 17)
!390 = !DILocation(line: 234, column: 30, scope: !389)
!391 = !DILocation(line: 234, column: 17, scope: !386)
!392 = !DILocation(line: 236, column: 34, scope: !393)
!393 = distinct !DILexicalBlock(scope: !389, file: !65, line: 235, column: 17)
!394 = !DILocation(line: 236, column: 41, scope: !393)
!395 = !DILocation(line: 236, column: 21, scope: !393)
!396 = !DILocation(line: 237, column: 17, scope: !393)
!397 = !DILocation(line: 234, column: 37, scope: !389)
!398 = !DILocation(line: 234, column: 17, scope: !389)
!399 = distinct !{!399, !391, !400, !205}
!400 = !DILocation(line: 237, column: 17, scope: !386)
!401 = !DILocation(line: 238, column: 13, scope: !382)
!402 = !DILocation(line: 241, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !375, file: !65, line: 240, column: 13)
!404 = !DILocation(line: 243, column: 18, scope: !345)
!405 = !DILocation(line: 243, column: 13, scope: !345)
!406 = !DILocation(line: 246, column: 1, scope: !262)
!407 = distinct !DISubprogram(name: "goodB2G2", scope: !65, file: !65, line: 249, type: !73, scopeLine: 250, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!408 = !DILocalVariable(name: "data", scope: !407, file: !65, line: 251, type: !62)
!409 = !DILocation(line: 251, column: 9, scope: !407)
!410 = !DILocation(line: 253, column: 10, scope: !407)
!411 = !DILocation(line: 254, column: 8, scope: !412)
!412 = distinct !DILexicalBlock(scope: !407, file: !65, line: 254, column: 8)
!413 = !DILocation(line: 254, column: 18, scope: !412)
!414 = !DILocation(line: 254, column: 8, scope: !407)
!415 = !DILocalVariable(name: "recvResult", scope: !416, file: !65, line: 261, type: !62)
!416 = distinct !DILexicalBlock(scope: !417, file: !65, line: 256, column: 9)
!417 = distinct !DILexicalBlock(scope: !412, file: !65, line: 255, column: 5)
!418 = !DILocation(line: 261, column: 17, scope: !416)
!419 = !DILocalVariable(name: "service", scope: !416, file: !65, line: 262, type: !88)
!420 = !DILocation(line: 262, column: 32, scope: !416)
!421 = !DILocalVariable(name: "connectSocket", scope: !416, file: !65, line: 263, type: !62)
!422 = !DILocation(line: 263, column: 20, scope: !416)
!423 = !DILocalVariable(name: "inputBuffer", scope: !416, file: !65, line: 264, type: !57)
!424 = !DILocation(line: 264, column: 18, scope: !416)
!425 = !DILocation(line: 265, column: 13, scope: !416)
!426 = !DILocation(line: 275, column: 33, scope: !427)
!427 = distinct !DILexicalBlock(scope: !416, file: !65, line: 266, column: 13)
!428 = !DILocation(line: 275, column: 31, scope: !427)
!429 = !DILocation(line: 276, column: 21, scope: !430)
!430 = distinct !DILexicalBlock(scope: !427, file: !65, line: 276, column: 21)
!431 = !DILocation(line: 276, column: 35, scope: !430)
!432 = !DILocation(line: 276, column: 21, scope: !427)
!433 = !DILocation(line: 278, column: 21, scope: !434)
!434 = distinct !DILexicalBlock(scope: !430, file: !65, line: 277, column: 17)
!435 = !DILocation(line: 280, column: 17, scope: !427)
!436 = !DILocation(line: 281, column: 25, scope: !427)
!437 = !DILocation(line: 281, column: 36, scope: !427)
!438 = !DILocation(line: 282, column: 43, scope: !427)
!439 = !DILocation(line: 282, column: 25, scope: !427)
!440 = !DILocation(line: 282, column: 34, scope: !427)
!441 = !DILocation(line: 282, column: 41, scope: !427)
!442 = !DILocation(line: 283, column: 36, scope: !427)
!443 = !DILocation(line: 283, column: 25, scope: !427)
!444 = !DILocation(line: 283, column: 34, scope: !427)
!445 = !DILocation(line: 284, column: 29, scope: !446)
!446 = distinct !DILexicalBlock(scope: !427, file: !65, line: 284, column: 21)
!447 = !DILocation(line: 284, column: 44, scope: !446)
!448 = !DILocation(line: 284, column: 21, scope: !446)
!449 = !DILocation(line: 284, column: 89, scope: !446)
!450 = !DILocation(line: 284, column: 21, scope: !427)
!451 = !DILocation(line: 286, column: 21, scope: !452)
!452 = distinct !DILexicalBlock(scope: !446, file: !65, line: 285, column: 17)
!453 = !DILocation(line: 290, column: 35, scope: !427)
!454 = !DILocation(line: 290, column: 50, scope: !427)
!455 = !DILocation(line: 290, column: 30, scope: !427)
!456 = !DILocation(line: 290, column: 28, scope: !427)
!457 = !DILocation(line: 291, column: 21, scope: !458)
!458 = distinct !DILexicalBlock(scope: !427, file: !65, line: 291, column: 21)
!459 = !DILocation(line: 291, column: 32, scope: !458)
!460 = !DILocation(line: 291, column: 48, scope: !458)
!461 = !DILocation(line: 291, column: 51, scope: !458)
!462 = !DILocation(line: 291, column: 62, scope: !458)
!463 = !DILocation(line: 291, column: 21, scope: !427)
!464 = !DILocation(line: 293, column: 21, scope: !465)
!465 = distinct !DILexicalBlock(scope: !458, file: !65, line: 292, column: 17)
!466 = !DILocation(line: 296, column: 29, scope: !427)
!467 = !DILocation(line: 296, column: 17, scope: !427)
!468 = !DILocation(line: 296, column: 41, scope: !427)
!469 = !DILocation(line: 298, column: 29, scope: !427)
!470 = !DILocation(line: 298, column: 24, scope: !427)
!471 = !DILocation(line: 298, column: 22, scope: !427)
!472 = !DILocation(line: 299, column: 13, scope: !427)
!473 = !DILocation(line: 301, column: 17, scope: !474)
!474 = distinct !DILexicalBlock(scope: !416, file: !65, line: 301, column: 17)
!475 = !DILocation(line: 301, column: 31, scope: !474)
!476 = !DILocation(line: 301, column: 17, scope: !416)
!477 = !DILocation(line: 303, column: 30, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !65, line: 302, column: 13)
!479 = !DILocation(line: 303, column: 17, scope: !478)
!480 = !DILocation(line: 304, column: 13, scope: !478)
!481 = !DILocation(line: 312, column: 5, scope: !417)
!482 = !DILocation(line: 313, column: 8, scope: !483)
!483 = distinct !DILexicalBlock(scope: !407, file: !65, line: 313, column: 8)
!484 = !DILocation(line: 313, column: 18, scope: !483)
!485 = !DILocation(line: 313, column: 8, scope: !407)
!486 = !DILocalVariable(name: "i", scope: !487, file: !65, line: 316, type: !62)
!487 = distinct !DILexicalBlock(scope: !488, file: !65, line: 315, column: 9)
!488 = distinct !DILexicalBlock(scope: !483, file: !65, line: 314, column: 5)
!489 = !DILocation(line: 316, column: 17, scope: !487)
!490 = !DILocalVariable(name: "buffer", scope: !487, file: !65, line: 317, type: !61)
!491 = !DILocation(line: 317, column: 19, scope: !487)
!492 = !DILocation(line: 317, column: 35, scope: !487)
!493 = !DILocation(line: 317, column: 28, scope: !487)
!494 = !DILocation(line: 318, column: 17, scope: !495)
!495 = distinct !DILexicalBlock(scope: !487, file: !65, line: 318, column: 17)
!496 = !DILocation(line: 318, column: 24, scope: !495)
!497 = !DILocation(line: 318, column: 17, scope: !487)
!498 = !DILocation(line: 318, column: 34, scope: !499)
!499 = distinct !DILexicalBlock(scope: !495, file: !65, line: 318, column: 33)
!500 = !DILocation(line: 320, column: 20, scope: !501)
!501 = distinct !DILexicalBlock(scope: !487, file: !65, line: 320, column: 13)
!502 = !DILocation(line: 320, column: 18, scope: !501)
!503 = !DILocation(line: 320, column: 25, scope: !504)
!504 = distinct !DILexicalBlock(scope: !501, file: !65, line: 320, column: 13)
!505 = !DILocation(line: 320, column: 27, scope: !504)
!506 = !DILocation(line: 320, column: 13, scope: !501)
!507 = !DILocation(line: 322, column: 17, scope: !508)
!508 = distinct !DILexicalBlock(scope: !504, file: !65, line: 321, column: 13)
!509 = !DILocation(line: 322, column: 24, scope: !508)
!510 = !DILocation(line: 322, column: 27, scope: !508)
!511 = !DILocation(line: 323, column: 13, scope: !508)
!512 = !DILocation(line: 320, column: 34, scope: !504)
!513 = !DILocation(line: 320, column: 13, scope: !504)
!514 = distinct !{!514, !506, !515, !205}
!515 = !DILocation(line: 323, column: 13, scope: !501)
!516 = !DILocation(line: 325, column: 17, scope: !517)
!517 = distinct !DILexicalBlock(scope: !487, file: !65, line: 325, column: 17)
!518 = !DILocation(line: 325, column: 22, scope: !517)
!519 = !DILocation(line: 325, column: 27, scope: !517)
!520 = !DILocation(line: 325, column: 30, scope: !517)
!521 = !DILocation(line: 325, column: 35, scope: !517)
!522 = !DILocation(line: 325, column: 17, scope: !487)
!523 = !DILocation(line: 327, column: 17, scope: !524)
!524 = distinct !DILexicalBlock(scope: !517, file: !65, line: 326, column: 13)
!525 = !DILocation(line: 327, column: 24, scope: !524)
!526 = !DILocation(line: 327, column: 30, scope: !524)
!527 = !DILocation(line: 329, column: 23, scope: !528)
!528 = distinct !DILexicalBlock(scope: !524, file: !65, line: 329, column: 17)
!529 = !DILocation(line: 329, column: 21, scope: !528)
!530 = !DILocation(line: 329, column: 28, scope: !531)
!531 = distinct !DILexicalBlock(scope: !528, file: !65, line: 329, column: 17)
!532 = !DILocation(line: 329, column: 30, scope: !531)
!533 = !DILocation(line: 329, column: 17, scope: !528)
!534 = !DILocation(line: 331, column: 34, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !65, line: 330, column: 17)
!536 = !DILocation(line: 331, column: 41, scope: !535)
!537 = !DILocation(line: 331, column: 21, scope: !535)
!538 = !DILocation(line: 332, column: 17, scope: !535)
!539 = !DILocation(line: 329, column: 37, scope: !531)
!540 = !DILocation(line: 329, column: 17, scope: !531)
!541 = distinct !{!541, !533, !542, !205}
!542 = !DILocation(line: 332, column: 17, scope: !528)
!543 = !DILocation(line: 333, column: 13, scope: !524)
!544 = !DILocation(line: 336, column: 17, scope: !545)
!545 = distinct !DILexicalBlock(scope: !517, file: !65, line: 335, column: 13)
!546 = !DILocation(line: 338, column: 18, scope: !487)
!547 = !DILocation(line: 338, column: 13, scope: !487)
!548 = !DILocation(line: 340, column: 5, scope: !488)
!549 = !DILocation(line: 341, column: 1, scope: !407)
!550 = distinct !DISubprogram(name: "goodG2B1", scope: !65, file: !65, line: 344, type: !73, scopeLine: 345, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!551 = !DILocalVariable(name: "data", scope: !550, file: !65, line: 346, type: !62)
!552 = !DILocation(line: 346, column: 9, scope: !550)
!553 = !DILocation(line: 348, column: 10, scope: !550)
!554 = !DILocation(line: 349, column: 8, scope: !555)
!555 = distinct !DILexicalBlock(scope: !550, file: !65, line: 349, column: 8)
!556 = !DILocation(line: 349, column: 18, scope: !555)
!557 = !DILocation(line: 349, column: 8, scope: !550)
!558 = !DILocation(line: 352, column: 9, scope: !559)
!559 = distinct !DILexicalBlock(scope: !555, file: !65, line: 350, column: 5)
!560 = !DILocation(line: 353, column: 5, scope: !559)
!561 = !DILocation(line: 358, column: 14, scope: !562)
!562 = distinct !DILexicalBlock(scope: !555, file: !65, line: 355, column: 5)
!563 = !DILocation(line: 360, column: 8, scope: !564)
!564 = distinct !DILexicalBlock(scope: !550, file: !65, line: 360, column: 8)
!565 = !DILocation(line: 360, column: 18, scope: !564)
!566 = !DILocation(line: 360, column: 8, scope: !550)
!567 = !DILocalVariable(name: "i", scope: !568, file: !65, line: 363, type: !62)
!568 = distinct !DILexicalBlock(scope: !569, file: !65, line: 362, column: 9)
!569 = distinct !DILexicalBlock(scope: !564, file: !65, line: 361, column: 5)
!570 = !DILocation(line: 363, column: 17, scope: !568)
!571 = !DILocalVariable(name: "buffer", scope: !568, file: !65, line: 364, type: !61)
!572 = !DILocation(line: 364, column: 19, scope: !568)
!573 = !DILocation(line: 364, column: 35, scope: !568)
!574 = !DILocation(line: 364, column: 28, scope: !568)
!575 = !DILocation(line: 365, column: 17, scope: !576)
!576 = distinct !DILexicalBlock(scope: !568, file: !65, line: 365, column: 17)
!577 = !DILocation(line: 365, column: 24, scope: !576)
!578 = !DILocation(line: 365, column: 17, scope: !568)
!579 = !DILocation(line: 365, column: 34, scope: !580)
!580 = distinct !DILexicalBlock(scope: !576, file: !65, line: 365, column: 33)
!581 = !DILocation(line: 367, column: 20, scope: !582)
!582 = distinct !DILexicalBlock(scope: !568, file: !65, line: 367, column: 13)
!583 = !DILocation(line: 367, column: 18, scope: !582)
!584 = !DILocation(line: 367, column: 25, scope: !585)
!585 = distinct !DILexicalBlock(scope: !582, file: !65, line: 367, column: 13)
!586 = !DILocation(line: 367, column: 27, scope: !585)
!587 = !DILocation(line: 367, column: 13, scope: !582)
!588 = !DILocation(line: 369, column: 17, scope: !589)
!589 = distinct !DILexicalBlock(scope: !585, file: !65, line: 368, column: 13)
!590 = !DILocation(line: 369, column: 24, scope: !589)
!591 = !DILocation(line: 369, column: 27, scope: !589)
!592 = !DILocation(line: 370, column: 13, scope: !589)
!593 = !DILocation(line: 367, column: 34, scope: !585)
!594 = !DILocation(line: 367, column: 13, scope: !585)
!595 = distinct !{!595, !587, !596, !205}
!596 = !DILocation(line: 370, column: 13, scope: !582)
!597 = !DILocation(line: 373, column: 17, scope: !598)
!598 = distinct !DILexicalBlock(scope: !568, file: !65, line: 373, column: 17)
!599 = !DILocation(line: 373, column: 22, scope: !598)
!600 = !DILocation(line: 373, column: 17, scope: !568)
!601 = !DILocation(line: 375, column: 17, scope: !602)
!602 = distinct !DILexicalBlock(scope: !598, file: !65, line: 374, column: 13)
!603 = !DILocation(line: 375, column: 24, scope: !602)
!604 = !DILocation(line: 375, column: 30, scope: !602)
!605 = !DILocation(line: 377, column: 23, scope: !606)
!606 = distinct !DILexicalBlock(scope: !602, file: !65, line: 377, column: 17)
!607 = !DILocation(line: 377, column: 21, scope: !606)
!608 = !DILocation(line: 377, column: 28, scope: !609)
!609 = distinct !DILexicalBlock(scope: !606, file: !65, line: 377, column: 17)
!610 = !DILocation(line: 377, column: 30, scope: !609)
!611 = !DILocation(line: 377, column: 17, scope: !606)
!612 = !DILocation(line: 379, column: 34, scope: !613)
!613 = distinct !DILexicalBlock(scope: !609, file: !65, line: 378, column: 17)
!614 = !DILocation(line: 379, column: 41, scope: !613)
!615 = !DILocation(line: 379, column: 21, scope: !613)
!616 = !DILocation(line: 380, column: 17, scope: !613)
!617 = !DILocation(line: 377, column: 37, scope: !609)
!618 = !DILocation(line: 377, column: 17, scope: !609)
!619 = distinct !{!619, !611, !620, !205}
!620 = !DILocation(line: 380, column: 17, scope: !606)
!621 = !DILocation(line: 381, column: 13, scope: !602)
!622 = !DILocation(line: 384, column: 17, scope: !623)
!623 = distinct !DILexicalBlock(scope: !598, file: !65, line: 383, column: 13)
!624 = !DILocation(line: 386, column: 18, scope: !568)
!625 = !DILocation(line: 386, column: 13, scope: !568)
!626 = !DILocation(line: 388, column: 5, scope: !569)
!627 = !DILocation(line: 389, column: 1, scope: !550)
!628 = distinct !DISubprogram(name: "goodG2B2", scope: !65, file: !65, line: 392, type: !73, scopeLine: 393, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!629 = !DILocalVariable(name: "data", scope: !628, file: !65, line: 394, type: !62)
!630 = !DILocation(line: 394, column: 9, scope: !628)
!631 = !DILocation(line: 396, column: 10, scope: !628)
!632 = !DILocation(line: 397, column: 8, scope: !633)
!633 = distinct !DILexicalBlock(scope: !628, file: !65, line: 397, column: 8)
!634 = !DILocation(line: 397, column: 18, scope: !633)
!635 = !DILocation(line: 397, column: 8, scope: !628)
!636 = !DILocation(line: 401, column: 14, scope: !637)
!637 = distinct !DILexicalBlock(scope: !633, file: !65, line: 398, column: 5)
!638 = !DILocation(line: 402, column: 5, scope: !637)
!639 = !DILocation(line: 403, column: 8, scope: !640)
!640 = distinct !DILexicalBlock(scope: !628, file: !65, line: 403, column: 8)
!641 = !DILocation(line: 403, column: 18, scope: !640)
!642 = !DILocation(line: 403, column: 8, scope: !628)
!643 = !DILocalVariable(name: "i", scope: !644, file: !65, line: 406, type: !62)
!644 = distinct !DILexicalBlock(scope: !645, file: !65, line: 405, column: 9)
!645 = distinct !DILexicalBlock(scope: !640, file: !65, line: 404, column: 5)
!646 = !DILocation(line: 406, column: 17, scope: !644)
!647 = !DILocalVariable(name: "buffer", scope: !644, file: !65, line: 407, type: !61)
!648 = !DILocation(line: 407, column: 19, scope: !644)
!649 = !DILocation(line: 407, column: 35, scope: !644)
!650 = !DILocation(line: 407, column: 28, scope: !644)
!651 = !DILocation(line: 408, column: 17, scope: !652)
!652 = distinct !DILexicalBlock(scope: !644, file: !65, line: 408, column: 17)
!653 = !DILocation(line: 408, column: 24, scope: !652)
!654 = !DILocation(line: 408, column: 17, scope: !644)
!655 = !DILocation(line: 408, column: 34, scope: !656)
!656 = distinct !DILexicalBlock(scope: !652, file: !65, line: 408, column: 33)
!657 = !DILocation(line: 410, column: 20, scope: !658)
!658 = distinct !DILexicalBlock(scope: !644, file: !65, line: 410, column: 13)
!659 = !DILocation(line: 410, column: 18, scope: !658)
!660 = !DILocation(line: 410, column: 25, scope: !661)
!661 = distinct !DILexicalBlock(scope: !658, file: !65, line: 410, column: 13)
!662 = !DILocation(line: 410, column: 27, scope: !661)
!663 = !DILocation(line: 410, column: 13, scope: !658)
!664 = !DILocation(line: 412, column: 17, scope: !665)
!665 = distinct !DILexicalBlock(scope: !661, file: !65, line: 411, column: 13)
!666 = !DILocation(line: 412, column: 24, scope: !665)
!667 = !DILocation(line: 412, column: 27, scope: !665)
!668 = !DILocation(line: 413, column: 13, scope: !665)
!669 = !DILocation(line: 410, column: 34, scope: !661)
!670 = !DILocation(line: 410, column: 13, scope: !661)
!671 = distinct !{!671, !663, !672, !205}
!672 = !DILocation(line: 413, column: 13, scope: !658)
!673 = !DILocation(line: 416, column: 17, scope: !674)
!674 = distinct !DILexicalBlock(scope: !644, file: !65, line: 416, column: 17)
!675 = !DILocation(line: 416, column: 22, scope: !674)
!676 = !DILocation(line: 416, column: 17, scope: !644)
!677 = !DILocation(line: 418, column: 17, scope: !678)
!678 = distinct !DILexicalBlock(scope: !674, file: !65, line: 417, column: 13)
!679 = !DILocation(line: 418, column: 24, scope: !678)
!680 = !DILocation(line: 418, column: 30, scope: !678)
!681 = !DILocation(line: 420, column: 23, scope: !682)
!682 = distinct !DILexicalBlock(scope: !678, file: !65, line: 420, column: 17)
!683 = !DILocation(line: 420, column: 21, scope: !682)
!684 = !DILocation(line: 420, column: 28, scope: !685)
!685 = distinct !DILexicalBlock(scope: !682, file: !65, line: 420, column: 17)
!686 = !DILocation(line: 420, column: 30, scope: !685)
!687 = !DILocation(line: 420, column: 17, scope: !682)
!688 = !DILocation(line: 422, column: 34, scope: !689)
!689 = distinct !DILexicalBlock(scope: !685, file: !65, line: 421, column: 17)
!690 = !DILocation(line: 422, column: 41, scope: !689)
!691 = !DILocation(line: 422, column: 21, scope: !689)
!692 = !DILocation(line: 423, column: 17, scope: !689)
!693 = !DILocation(line: 420, column: 37, scope: !685)
!694 = !DILocation(line: 420, column: 17, scope: !685)
!695 = distinct !{!695, !687, !696, !205}
!696 = !DILocation(line: 423, column: 17, scope: !682)
!697 = !DILocation(line: 424, column: 13, scope: !678)
!698 = !DILocation(line: 427, column: 17, scope: !699)
!699 = distinct !DILexicalBlock(scope: !674, file: !65, line: 426, column: 13)
!700 = !DILocation(line: 429, column: 18, scope: !644)
!701 = !DILocation(line: 429, column: 13, scope: !644)
!702 = !DILocation(line: 431, column: 5, scope: !645)
!703 = !DILocation(line: 432, column: 1, scope: !628)
