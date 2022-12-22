; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_31.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_31_bad() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data21 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !162, metadata !DIExpression()), !dbg !164
  %10 = load i32, i32* %data, align 4, !dbg !165
  store i32 %10, i32* %dataCopy, align 4, !dbg !164
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !166, metadata !DIExpression()), !dbg !167
  %11 = load i32, i32* %dataCopy, align 4, !dbg !168
  store i32 %11, i32* %data21, align 4, !dbg !167
  call void @llvm.dbg.declare(metadata i32* %i, metadata !169, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !172, metadata !DIExpression()), !dbg !173
  %call22 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !174
  %12 = bitcast i8* %call22 to i32*, !dbg !175
  store i32* %12, i32** %buffer, align 8, !dbg !173
  %13 = load i32*, i32** %buffer, align 8, !dbg !176
  %cmp23 = icmp eq i32* %13, null, !dbg !178
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !179

if.then25:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !180
  unreachable, !dbg !180

if.end26:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.end26
  %14 = load i32, i32* %i, align 4, !dbg !185
  %cmp27 = icmp slt i32 %14, 10, !dbg !187
  br i1 %cmp27, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !189
  %16 = load i32, i32* %i, align 4, !dbg !191
  %idxprom29 = sext i32 %16 to i64, !dbg !189
  %arrayidx30 = getelementptr inbounds i32, i32* %15, i64 %idxprom29, !dbg !189
  store i32 0, i32* %arrayidx30, align 4, !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !194
  %inc = add nsw i32 %17, 1, !dbg !194
  store i32 %inc, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data21, align 4, !dbg !199
  %cmp31 = icmp sge i32 %18, 0, !dbg !201
  br i1 %cmp31, label %if.then33, label %if.else, !dbg !202

if.then33:                                        ; preds = %for.end
  %19 = load i32*, i32** %buffer, align 8, !dbg !203
  %20 = load i32, i32* %data21, align 4, !dbg !205
  %idxprom34 = sext i32 %20 to i64, !dbg !203
  %arrayidx35 = getelementptr inbounds i32, i32* %19, i64 %idxprom34, !dbg !203
  store i32 1, i32* %arrayidx35, align 4, !dbg !206
  store i32 0, i32* %i, align 4, !dbg !207
  br label %for.cond36, !dbg !209

for.cond36:                                       ; preds = %for.inc42, %if.then33
  %21 = load i32, i32* %i, align 4, !dbg !210
  %cmp37 = icmp slt i32 %21, 10, !dbg !212
  br i1 %cmp37, label %for.body39, label %for.end44, !dbg !213

for.body39:                                       ; preds = %for.cond36
  %22 = load i32*, i32** %buffer, align 8, !dbg !214
  %23 = load i32, i32* %i, align 4, !dbg !216
  %idxprom40 = sext i32 %23 to i64, !dbg !214
  %arrayidx41 = getelementptr inbounds i32, i32* %22, i64 %idxprom40, !dbg !214
  %24 = load i32, i32* %arrayidx41, align 4, !dbg !214
  call void @printIntLine(i32 %24), !dbg !217
  br label %for.inc42, !dbg !218

for.inc42:                                        ; preds = %for.body39
  %25 = load i32, i32* %i, align 4, !dbg !219
  %inc43 = add nsw i32 %25, 1, !dbg !219
  store i32 %inc43, i32* %i, align 4, !dbg !219
  br label %for.cond36, !dbg !220, !llvm.loop !221

for.end44:                                        ; preds = %for.cond36
  br label %if.end45, !dbg !223

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !224
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end44
  %26 = load i32*, i32** %buffer, align 8, !dbg !226
  %27 = bitcast i32* %26 to i8*, !dbg !226
  call void @free(i8* %27) #8, !dbg !227
  ret void, !dbg !228
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_31_good() #0 !dbg !229 {
entry:
  call void @goodG2B(), !dbg !230
  call void @goodB2G(), !dbg !231
  ret void, !dbg !232
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !233 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !238, metadata !DIExpression()), !dbg !239
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !240, metadata !DIExpression()), !dbg !241
  %call = call i64 @time(i64* null) #8, !dbg !242
  %conv = trunc i64 %call to i32, !dbg !243
  call void @srand(i32 %conv) #8, !dbg !244
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !245
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_31_good(), !dbg !246
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !247
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !248
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_31_bad(), !dbg !249
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !250
  ret i32 0, !dbg !251
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !252 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 -1, i32* %data, align 4, !dbg !255
  store i32 7, i32* %data, align 4, !dbg !256
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !257, metadata !DIExpression()), !dbg !259
  %0 = load i32, i32* %data, align 4, !dbg !260
  store i32 %0, i32* %dataCopy, align 4, !dbg !259
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !261, metadata !DIExpression()), !dbg !262
  %1 = load i32, i32* %dataCopy, align 4, !dbg !263
  store i32 %1, i32* %data1, align 4, !dbg !262
  call void @llvm.dbg.declare(metadata i32* %i, metadata !264, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !267, metadata !DIExpression()), !dbg !268
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !269
  %2 = bitcast i8* %call to i32*, !dbg !270
  store i32* %2, i32** %buffer, align 8, !dbg !268
  %3 = load i32*, i32** %buffer, align 8, !dbg !271
  %cmp = icmp eq i32* %3, null, !dbg !273
  br i1 %cmp, label %if.then, label %if.end, !dbg !274

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !275
  unreachable, !dbg !275

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !277
  br label %for.cond, !dbg !279

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !280
  %cmp2 = icmp slt i32 %4, 10, !dbg !282
  br i1 %cmp2, label %for.body, label %for.end, !dbg !283

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !284
  %6 = load i32, i32* %i, align 4, !dbg !286
  %idxprom = sext i32 %6 to i64, !dbg !284
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !284
  store i32 0, i32* %arrayidx, align 4, !dbg !287
  br label %for.inc, !dbg !288

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !289
  %inc = add nsw i32 %7, 1, !dbg !289
  store i32 %inc, i32* %i, align 4, !dbg !289
  br label %for.cond, !dbg !290, !llvm.loop !291

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !293
  %cmp3 = icmp sge i32 %8, 0, !dbg !295
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !296

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !297
  %10 = load i32, i32* %data1, align 4, !dbg !299
  %idxprom5 = sext i32 %10 to i64, !dbg !297
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !297
  store i32 1, i32* %arrayidx6, align 4, !dbg !300
  store i32 0, i32* %i, align 4, !dbg !301
  br label %for.cond7, !dbg !303

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !304
  %cmp8 = icmp slt i32 %11, 10, !dbg !306
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !307

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !308
  %13 = load i32, i32* %i, align 4, !dbg !310
  %idxprom10 = sext i32 %13 to i64, !dbg !308
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !308
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !308
  call void @printIntLine(i32 %14), !dbg !311
  br label %for.inc12, !dbg !312

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !313
  %inc13 = add nsw i32 %15, 1, !dbg !313
  store i32 %inc13, i32* %i, align 4, !dbg !313
  br label %for.cond7, !dbg !314, !llvm.loop !315

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !317

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !318
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !320
  %17 = bitcast i32* %16 to i8*, !dbg !320
  call void @free(i8* %17) #8, !dbg !321
  ret void, !dbg !322
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !323 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data21 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !324, metadata !DIExpression()), !dbg !325
  store i32 -1, i32* %data, align 4, !dbg !326
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !327, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !330, metadata !DIExpression()), !dbg !331
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !332, metadata !DIExpression()), !dbg !333
  store i32 -1, i32* %connectSocket, align 4, !dbg !333
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !334, metadata !DIExpression()), !dbg !335
  br label %do.body, !dbg !336

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !337
  store i32 %call, i32* %connectSocket, align 4, !dbg !339
  %0 = load i32, i32* %connectSocket, align 4, !dbg !340
  %cmp = icmp eq i32 %0, -1, !dbg !342
  br i1 %cmp, label %if.then, label %if.end, !dbg !343

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !344

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !346
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !346
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !347
  store i16 2, i16* %sin_family, align 4, !dbg !348
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !349
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !350
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !351
  store i32 %call1, i32* %s_addr, align 4, !dbg !352
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !353
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !354
  store i16 %call2, i16* %sin_port, align 2, !dbg !355
  %2 = load i32, i32* %connectSocket, align 4, !dbg !356
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !358
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !359
  %cmp4 = icmp eq i32 %call3, -1, !dbg !360
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !361

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !362

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !364
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !365
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !366
  %conv = trunc i64 %call7 to i32, !dbg !366
  store i32 %conv, i32* %recvResult, align 4, !dbg !367
  %5 = load i32, i32* %recvResult, align 4, !dbg !368
  %cmp8 = icmp eq i32 %5, -1, !dbg !370
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !371

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !372
  %cmp10 = icmp eq i32 %6, 0, !dbg !373
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !374

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !375

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !377
  %idxprom = sext i32 %7 to i64, !dbg !378
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !378
  store i8 0, i8* %arrayidx, align 1, !dbg !379
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !380
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !381
  store i32 %call15, i32* %data, align 4, !dbg !382
  br label %do.end, !dbg !383

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !384
  %cmp16 = icmp ne i32 %8, -1, !dbg !386
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !387

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !388
  %call19 = call i32 @close(i32 %9), !dbg !390
  br label %if.end20, !dbg !391

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !392, metadata !DIExpression()), !dbg !394
  %10 = load i32, i32* %data, align 4, !dbg !395
  store i32 %10, i32* %dataCopy, align 4, !dbg !394
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !396, metadata !DIExpression()), !dbg !397
  %11 = load i32, i32* %dataCopy, align 4, !dbg !398
  store i32 %11, i32* %data21, align 4, !dbg !397
  call void @llvm.dbg.declare(metadata i32* %i, metadata !399, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !402, metadata !DIExpression()), !dbg !403
  %call22 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !404
  %12 = bitcast i8* %call22 to i32*, !dbg !405
  store i32* %12, i32** %buffer, align 8, !dbg !403
  %13 = load i32*, i32** %buffer, align 8, !dbg !406
  %cmp23 = icmp eq i32* %13, null, !dbg !408
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !409

if.then25:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !410
  unreachable, !dbg !410

if.end26:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !412
  br label %for.cond, !dbg !414

for.cond:                                         ; preds = %for.inc, %if.end26
  %14 = load i32, i32* %i, align 4, !dbg !415
  %cmp27 = icmp slt i32 %14, 10, !dbg !417
  br i1 %cmp27, label %for.body, label %for.end, !dbg !418

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !419
  %16 = load i32, i32* %i, align 4, !dbg !421
  %idxprom29 = sext i32 %16 to i64, !dbg !419
  %arrayidx30 = getelementptr inbounds i32, i32* %15, i64 %idxprom29, !dbg !419
  store i32 0, i32* %arrayidx30, align 4, !dbg !422
  br label %for.inc, !dbg !423

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !424
  %inc = add nsw i32 %17, 1, !dbg !424
  store i32 %inc, i32* %i, align 4, !dbg !424
  br label %for.cond, !dbg !425, !llvm.loop !426

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data21, align 4, !dbg !428
  %cmp31 = icmp sge i32 %18, 0, !dbg !430
  br i1 %cmp31, label %land.lhs.true, label %if.else, !dbg !431

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* %data21, align 4, !dbg !432
  %cmp33 = icmp slt i32 %19, 10, !dbg !433
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !434

if.then35:                                        ; preds = %land.lhs.true
  %20 = load i32*, i32** %buffer, align 8, !dbg !435
  %21 = load i32, i32* %data21, align 4, !dbg !437
  %idxprom36 = sext i32 %21 to i64, !dbg !435
  %arrayidx37 = getelementptr inbounds i32, i32* %20, i64 %idxprom36, !dbg !435
  store i32 1, i32* %arrayidx37, align 4, !dbg !438
  store i32 0, i32* %i, align 4, !dbg !439
  br label %for.cond38, !dbg !441

for.cond38:                                       ; preds = %for.inc44, %if.then35
  %22 = load i32, i32* %i, align 4, !dbg !442
  %cmp39 = icmp slt i32 %22, 10, !dbg !444
  br i1 %cmp39, label %for.body41, label %for.end46, !dbg !445

for.body41:                                       ; preds = %for.cond38
  %23 = load i32*, i32** %buffer, align 8, !dbg !446
  %24 = load i32, i32* %i, align 4, !dbg !448
  %idxprom42 = sext i32 %24 to i64, !dbg !446
  %arrayidx43 = getelementptr inbounds i32, i32* %23, i64 %idxprom42, !dbg !446
  %25 = load i32, i32* %arrayidx43, align 4, !dbg !446
  call void @printIntLine(i32 %25), !dbg !449
  br label %for.inc44, !dbg !450

for.inc44:                                        ; preds = %for.body41
  %26 = load i32, i32* %i, align 4, !dbg !451
  %inc45 = add nsw i32 %26, 1, !dbg !451
  store i32 %inc45, i32* %i, align 4, !dbg !451
  br label %for.cond38, !dbg !452, !llvm.loop !453

for.end46:                                        ; preds = %for.cond38
  br label %if.end47, !dbg !455

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !456
  br label %if.end47

if.end47:                                         ; preds = %if.else, %for.end46
  %27 = load i32*, i32** %buffer, align 8, !dbg !458
  %28 = bitcast i32* %27 to i8*, !dbg !458
  call void @free(i8* %28) #8, !dbg !459
  ret void, !dbg !460
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_31.c", directory: "/root/SSE-Assessment")
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_31_bad", scope: !69, file: !69, line: 44, type: !70, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_31.c", directory: "/root/SSE-Assessment")
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
!162 = !DILocalVariable(name: "dataCopy", scope: !163, file: !69, line: 106, type: !60)
!163 = distinct !DILexicalBlock(scope: !68, file: !69, line: 105, column: 5)
!164 = !DILocation(line: 106, column: 13, scope: !163)
!165 = !DILocation(line: 106, column: 24, scope: !163)
!166 = !DILocalVariable(name: "data", scope: !163, file: !69, line: 107, type: !60)
!167 = !DILocation(line: 107, column: 13, scope: !163)
!168 = !DILocation(line: 107, column: 20, scope: !163)
!169 = !DILocalVariable(name: "i", scope: !170, file: !69, line: 109, type: !60)
!170 = distinct !DILexicalBlock(scope: !163, file: !69, line: 108, column: 9)
!171 = !DILocation(line: 109, column: 17, scope: !170)
!172 = !DILocalVariable(name: "buffer", scope: !170, file: !69, line: 110, type: !59)
!173 = !DILocation(line: 110, column: 19, scope: !170)
!174 = !DILocation(line: 110, column: 35, scope: !170)
!175 = !DILocation(line: 110, column: 28, scope: !170)
!176 = !DILocation(line: 111, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !170, file: !69, line: 111, column: 17)
!178 = !DILocation(line: 111, column: 24, scope: !177)
!179 = !DILocation(line: 111, column: 17, scope: !170)
!180 = !DILocation(line: 111, column: 34, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !69, line: 111, column: 33)
!182 = !DILocation(line: 113, column: 20, scope: !183)
!183 = distinct !DILexicalBlock(scope: !170, file: !69, line: 113, column: 13)
!184 = !DILocation(line: 113, column: 18, scope: !183)
!185 = !DILocation(line: 113, column: 25, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !69, line: 113, column: 13)
!187 = !DILocation(line: 113, column: 27, scope: !186)
!188 = !DILocation(line: 113, column: 13, scope: !183)
!189 = !DILocation(line: 115, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !69, line: 114, column: 13)
!191 = !DILocation(line: 115, column: 24, scope: !190)
!192 = !DILocation(line: 115, column: 27, scope: !190)
!193 = !DILocation(line: 116, column: 13, scope: !190)
!194 = !DILocation(line: 113, column: 34, scope: !186)
!195 = !DILocation(line: 113, column: 13, scope: !186)
!196 = distinct !{!196, !188, !197, !198}
!197 = !DILocation(line: 116, column: 13, scope: !183)
!198 = !{!"llvm.loop.mustprogress"}
!199 = !DILocation(line: 119, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !170, file: !69, line: 119, column: 17)
!201 = !DILocation(line: 119, column: 22, scope: !200)
!202 = !DILocation(line: 119, column: 17, scope: !170)
!203 = !DILocation(line: 121, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !69, line: 120, column: 13)
!205 = !DILocation(line: 121, column: 24, scope: !204)
!206 = !DILocation(line: 121, column: 30, scope: !204)
!207 = !DILocation(line: 123, column: 23, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !69, line: 123, column: 17)
!209 = !DILocation(line: 123, column: 21, scope: !208)
!210 = !DILocation(line: 123, column: 28, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !69, line: 123, column: 17)
!212 = !DILocation(line: 123, column: 30, scope: !211)
!213 = !DILocation(line: 123, column: 17, scope: !208)
!214 = !DILocation(line: 125, column: 34, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !69, line: 124, column: 17)
!216 = !DILocation(line: 125, column: 41, scope: !215)
!217 = !DILocation(line: 125, column: 21, scope: !215)
!218 = !DILocation(line: 126, column: 17, scope: !215)
!219 = !DILocation(line: 123, column: 37, scope: !211)
!220 = !DILocation(line: 123, column: 17, scope: !211)
!221 = distinct !{!221, !213, !222, !198}
!222 = !DILocation(line: 126, column: 17, scope: !208)
!223 = !DILocation(line: 127, column: 13, scope: !204)
!224 = !DILocation(line: 130, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !200, file: !69, line: 129, column: 13)
!226 = !DILocation(line: 132, column: 18, scope: !170)
!227 = !DILocation(line: 132, column: 13, scope: !170)
!228 = !DILocation(line: 135, column: 1, scope: !68)
!229 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_31_good", scope: !69, file: !69, line: 275, type: !70, scopeLine: 276, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!230 = !DILocation(line: 277, column: 5, scope: !229)
!231 = !DILocation(line: 278, column: 5, scope: !229)
!232 = !DILocation(line: 279, column: 1, scope: !229)
!233 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 289, type: !234, scopeLine: 290, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!234 = !DISubroutineType(types: !235)
!235 = !{!60, !60, !236}
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64)
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!238 = !DILocalVariable(name: "argc", arg: 1, scope: !233, file: !69, line: 289, type: !60)
!239 = !DILocation(line: 289, column: 14, scope: !233)
!240 = !DILocalVariable(name: "argv", arg: 2, scope: !233, file: !69, line: 289, type: !236)
!241 = !DILocation(line: 289, column: 27, scope: !233)
!242 = !DILocation(line: 292, column: 22, scope: !233)
!243 = !DILocation(line: 292, column: 12, scope: !233)
!244 = !DILocation(line: 292, column: 5, scope: !233)
!245 = !DILocation(line: 294, column: 5, scope: !233)
!246 = !DILocation(line: 295, column: 5, scope: !233)
!247 = !DILocation(line: 296, column: 5, scope: !233)
!248 = !DILocation(line: 299, column: 5, scope: !233)
!249 = !DILocation(line: 300, column: 5, scope: !233)
!250 = !DILocation(line: 301, column: 5, scope: !233)
!251 = !DILocation(line: 303, column: 5, scope: !233)
!252 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 142, type: !70, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!253 = !DILocalVariable(name: "data", scope: !252, file: !69, line: 144, type: !60)
!254 = !DILocation(line: 144, column: 9, scope: !252)
!255 = !DILocation(line: 146, column: 10, scope: !252)
!256 = !DILocation(line: 149, column: 10, scope: !252)
!257 = !DILocalVariable(name: "dataCopy", scope: !258, file: !69, line: 151, type: !60)
!258 = distinct !DILexicalBlock(scope: !252, file: !69, line: 150, column: 5)
!259 = !DILocation(line: 151, column: 13, scope: !258)
!260 = !DILocation(line: 151, column: 24, scope: !258)
!261 = !DILocalVariable(name: "data", scope: !258, file: !69, line: 152, type: !60)
!262 = !DILocation(line: 152, column: 13, scope: !258)
!263 = !DILocation(line: 152, column: 20, scope: !258)
!264 = !DILocalVariable(name: "i", scope: !265, file: !69, line: 154, type: !60)
!265 = distinct !DILexicalBlock(scope: !258, file: !69, line: 153, column: 9)
!266 = !DILocation(line: 154, column: 17, scope: !265)
!267 = !DILocalVariable(name: "buffer", scope: !265, file: !69, line: 155, type: !59)
!268 = !DILocation(line: 155, column: 19, scope: !265)
!269 = !DILocation(line: 155, column: 35, scope: !265)
!270 = !DILocation(line: 155, column: 28, scope: !265)
!271 = !DILocation(line: 156, column: 17, scope: !272)
!272 = distinct !DILexicalBlock(scope: !265, file: !69, line: 156, column: 17)
!273 = !DILocation(line: 156, column: 24, scope: !272)
!274 = !DILocation(line: 156, column: 17, scope: !265)
!275 = !DILocation(line: 156, column: 34, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !69, line: 156, column: 33)
!277 = !DILocation(line: 158, column: 20, scope: !278)
!278 = distinct !DILexicalBlock(scope: !265, file: !69, line: 158, column: 13)
!279 = !DILocation(line: 158, column: 18, scope: !278)
!280 = !DILocation(line: 158, column: 25, scope: !281)
!281 = distinct !DILexicalBlock(scope: !278, file: !69, line: 158, column: 13)
!282 = !DILocation(line: 158, column: 27, scope: !281)
!283 = !DILocation(line: 158, column: 13, scope: !278)
!284 = !DILocation(line: 160, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !69, line: 159, column: 13)
!286 = !DILocation(line: 160, column: 24, scope: !285)
!287 = !DILocation(line: 160, column: 27, scope: !285)
!288 = !DILocation(line: 161, column: 13, scope: !285)
!289 = !DILocation(line: 158, column: 34, scope: !281)
!290 = !DILocation(line: 158, column: 13, scope: !281)
!291 = distinct !{!291, !283, !292, !198}
!292 = !DILocation(line: 161, column: 13, scope: !278)
!293 = !DILocation(line: 164, column: 17, scope: !294)
!294 = distinct !DILexicalBlock(scope: !265, file: !69, line: 164, column: 17)
!295 = !DILocation(line: 164, column: 22, scope: !294)
!296 = !DILocation(line: 164, column: 17, scope: !265)
!297 = !DILocation(line: 166, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !69, line: 165, column: 13)
!299 = !DILocation(line: 166, column: 24, scope: !298)
!300 = !DILocation(line: 166, column: 30, scope: !298)
!301 = !DILocation(line: 168, column: 23, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !69, line: 168, column: 17)
!303 = !DILocation(line: 168, column: 21, scope: !302)
!304 = !DILocation(line: 168, column: 28, scope: !305)
!305 = distinct !DILexicalBlock(scope: !302, file: !69, line: 168, column: 17)
!306 = !DILocation(line: 168, column: 30, scope: !305)
!307 = !DILocation(line: 168, column: 17, scope: !302)
!308 = !DILocation(line: 170, column: 34, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !69, line: 169, column: 17)
!310 = !DILocation(line: 170, column: 41, scope: !309)
!311 = !DILocation(line: 170, column: 21, scope: !309)
!312 = !DILocation(line: 171, column: 17, scope: !309)
!313 = !DILocation(line: 168, column: 37, scope: !305)
!314 = !DILocation(line: 168, column: 17, scope: !305)
!315 = distinct !{!315, !307, !316, !198}
!316 = !DILocation(line: 171, column: 17, scope: !302)
!317 = !DILocation(line: 172, column: 13, scope: !298)
!318 = !DILocation(line: 175, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !294, file: !69, line: 174, column: 13)
!320 = !DILocation(line: 177, column: 18, scope: !265)
!321 = !DILocation(line: 177, column: 13, scope: !265)
!322 = !DILocation(line: 180, column: 1, scope: !252)
!323 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 183, type: !70, scopeLine: 184, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!324 = !DILocalVariable(name: "data", scope: !323, file: !69, line: 185, type: !60)
!325 = !DILocation(line: 185, column: 9, scope: !323)
!326 = !DILocation(line: 187, column: 10, scope: !323)
!327 = !DILocalVariable(name: "recvResult", scope: !328, file: !69, line: 193, type: !60)
!328 = distinct !DILexicalBlock(scope: !323, file: !69, line: 188, column: 5)
!329 = !DILocation(line: 193, column: 13, scope: !328)
!330 = !DILocalVariable(name: "service", scope: !328, file: !69, line: 194, type: !80)
!331 = !DILocation(line: 194, column: 28, scope: !328)
!332 = !DILocalVariable(name: "connectSocket", scope: !328, file: !69, line: 195, type: !60)
!333 = !DILocation(line: 195, column: 16, scope: !328)
!334 = !DILocalVariable(name: "inputBuffer", scope: !328, file: !69, line: 196, type: !55)
!335 = !DILocation(line: 196, column: 14, scope: !328)
!336 = !DILocation(line: 197, column: 9, scope: !328)
!337 = !DILocation(line: 207, column: 29, scope: !338)
!338 = distinct !DILexicalBlock(scope: !328, file: !69, line: 198, column: 9)
!339 = !DILocation(line: 207, column: 27, scope: !338)
!340 = !DILocation(line: 208, column: 17, scope: !341)
!341 = distinct !DILexicalBlock(scope: !338, file: !69, line: 208, column: 17)
!342 = !DILocation(line: 208, column: 31, scope: !341)
!343 = !DILocation(line: 208, column: 17, scope: !338)
!344 = !DILocation(line: 210, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !69, line: 209, column: 13)
!346 = !DILocation(line: 212, column: 13, scope: !338)
!347 = !DILocation(line: 213, column: 21, scope: !338)
!348 = !DILocation(line: 213, column: 32, scope: !338)
!349 = !DILocation(line: 214, column: 39, scope: !338)
!350 = !DILocation(line: 214, column: 21, scope: !338)
!351 = !DILocation(line: 214, column: 30, scope: !338)
!352 = !DILocation(line: 214, column: 37, scope: !338)
!353 = !DILocation(line: 215, column: 32, scope: !338)
!354 = !DILocation(line: 215, column: 21, scope: !338)
!355 = !DILocation(line: 215, column: 30, scope: !338)
!356 = !DILocation(line: 216, column: 25, scope: !357)
!357 = distinct !DILexicalBlock(scope: !338, file: !69, line: 216, column: 17)
!358 = !DILocation(line: 216, column: 40, scope: !357)
!359 = !DILocation(line: 216, column: 17, scope: !357)
!360 = !DILocation(line: 216, column: 85, scope: !357)
!361 = !DILocation(line: 216, column: 17, scope: !338)
!362 = !DILocation(line: 218, column: 17, scope: !363)
!363 = distinct !DILexicalBlock(scope: !357, file: !69, line: 217, column: 13)
!364 = !DILocation(line: 222, column: 31, scope: !338)
!365 = !DILocation(line: 222, column: 46, scope: !338)
!366 = !DILocation(line: 222, column: 26, scope: !338)
!367 = !DILocation(line: 222, column: 24, scope: !338)
!368 = !DILocation(line: 223, column: 17, scope: !369)
!369 = distinct !DILexicalBlock(scope: !338, file: !69, line: 223, column: 17)
!370 = !DILocation(line: 223, column: 28, scope: !369)
!371 = !DILocation(line: 223, column: 44, scope: !369)
!372 = !DILocation(line: 223, column: 47, scope: !369)
!373 = !DILocation(line: 223, column: 58, scope: !369)
!374 = !DILocation(line: 223, column: 17, scope: !338)
!375 = !DILocation(line: 225, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !369, file: !69, line: 224, column: 13)
!377 = !DILocation(line: 228, column: 25, scope: !338)
!378 = !DILocation(line: 228, column: 13, scope: !338)
!379 = !DILocation(line: 228, column: 37, scope: !338)
!380 = !DILocation(line: 230, column: 25, scope: !338)
!381 = !DILocation(line: 230, column: 20, scope: !338)
!382 = !DILocation(line: 230, column: 18, scope: !338)
!383 = !DILocation(line: 231, column: 9, scope: !338)
!384 = !DILocation(line: 233, column: 13, scope: !385)
!385 = distinct !DILexicalBlock(scope: !328, file: !69, line: 233, column: 13)
!386 = !DILocation(line: 233, column: 27, scope: !385)
!387 = !DILocation(line: 233, column: 13, scope: !328)
!388 = !DILocation(line: 235, column: 26, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !69, line: 234, column: 9)
!390 = !DILocation(line: 235, column: 13, scope: !389)
!391 = !DILocation(line: 236, column: 9, scope: !389)
!392 = !DILocalVariable(name: "dataCopy", scope: !393, file: !69, line: 245, type: !60)
!393 = distinct !DILexicalBlock(scope: !323, file: !69, line: 244, column: 5)
!394 = !DILocation(line: 245, column: 13, scope: !393)
!395 = !DILocation(line: 245, column: 24, scope: !393)
!396 = !DILocalVariable(name: "data", scope: !393, file: !69, line: 246, type: !60)
!397 = !DILocation(line: 246, column: 13, scope: !393)
!398 = !DILocation(line: 246, column: 20, scope: !393)
!399 = !DILocalVariable(name: "i", scope: !400, file: !69, line: 248, type: !60)
!400 = distinct !DILexicalBlock(scope: !393, file: !69, line: 247, column: 9)
!401 = !DILocation(line: 248, column: 17, scope: !400)
!402 = !DILocalVariable(name: "buffer", scope: !400, file: !69, line: 249, type: !59)
!403 = !DILocation(line: 249, column: 19, scope: !400)
!404 = !DILocation(line: 249, column: 35, scope: !400)
!405 = !DILocation(line: 249, column: 28, scope: !400)
!406 = !DILocation(line: 250, column: 17, scope: !407)
!407 = distinct !DILexicalBlock(scope: !400, file: !69, line: 250, column: 17)
!408 = !DILocation(line: 250, column: 24, scope: !407)
!409 = !DILocation(line: 250, column: 17, scope: !400)
!410 = !DILocation(line: 250, column: 34, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !69, line: 250, column: 33)
!412 = !DILocation(line: 252, column: 20, scope: !413)
!413 = distinct !DILexicalBlock(scope: !400, file: !69, line: 252, column: 13)
!414 = !DILocation(line: 252, column: 18, scope: !413)
!415 = !DILocation(line: 252, column: 25, scope: !416)
!416 = distinct !DILexicalBlock(scope: !413, file: !69, line: 252, column: 13)
!417 = !DILocation(line: 252, column: 27, scope: !416)
!418 = !DILocation(line: 252, column: 13, scope: !413)
!419 = !DILocation(line: 254, column: 17, scope: !420)
!420 = distinct !DILexicalBlock(scope: !416, file: !69, line: 253, column: 13)
!421 = !DILocation(line: 254, column: 24, scope: !420)
!422 = !DILocation(line: 254, column: 27, scope: !420)
!423 = !DILocation(line: 255, column: 13, scope: !420)
!424 = !DILocation(line: 252, column: 34, scope: !416)
!425 = !DILocation(line: 252, column: 13, scope: !416)
!426 = distinct !{!426, !418, !427, !198}
!427 = !DILocation(line: 255, column: 13, scope: !413)
!428 = !DILocation(line: 257, column: 17, scope: !429)
!429 = distinct !DILexicalBlock(scope: !400, file: !69, line: 257, column: 17)
!430 = !DILocation(line: 257, column: 22, scope: !429)
!431 = !DILocation(line: 257, column: 27, scope: !429)
!432 = !DILocation(line: 257, column: 30, scope: !429)
!433 = !DILocation(line: 257, column: 35, scope: !429)
!434 = !DILocation(line: 257, column: 17, scope: !400)
!435 = !DILocation(line: 259, column: 17, scope: !436)
!436 = distinct !DILexicalBlock(scope: !429, file: !69, line: 258, column: 13)
!437 = !DILocation(line: 259, column: 24, scope: !436)
!438 = !DILocation(line: 259, column: 30, scope: !436)
!439 = !DILocation(line: 261, column: 23, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !69, line: 261, column: 17)
!441 = !DILocation(line: 261, column: 21, scope: !440)
!442 = !DILocation(line: 261, column: 28, scope: !443)
!443 = distinct !DILexicalBlock(scope: !440, file: !69, line: 261, column: 17)
!444 = !DILocation(line: 261, column: 30, scope: !443)
!445 = !DILocation(line: 261, column: 17, scope: !440)
!446 = !DILocation(line: 263, column: 34, scope: !447)
!447 = distinct !DILexicalBlock(scope: !443, file: !69, line: 262, column: 17)
!448 = !DILocation(line: 263, column: 41, scope: !447)
!449 = !DILocation(line: 263, column: 21, scope: !447)
!450 = !DILocation(line: 264, column: 17, scope: !447)
!451 = !DILocation(line: 261, column: 37, scope: !443)
!452 = !DILocation(line: 261, column: 17, scope: !443)
!453 = distinct !{!453, !445, !454, !198}
!454 = !DILocation(line: 264, column: 17, scope: !440)
!455 = !DILocation(line: 265, column: 13, scope: !436)
!456 = !DILocation(line: 268, column: 17, scope: !457)
!457 = distinct !DILexicalBlock(scope: !429, file: !69, line: 267, column: 13)
!458 = !DILocation(line: 270, column: 18, scope: !400)
!459 = !DILocation(line: 270, column: 13, scope: !400)
!460 = !DILocation(line: 273, column: 1, scope: !323)
