; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_32.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_32_bad() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data22 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !75, metadata !DIExpression()), !dbg !76
  store i32* %data, i32** %dataPtr1, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* %data, i32** %dataPtr2, align 8, !dbg !78
  store i32 -1, i32* %data, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !80, metadata !DIExpression()), !dbg !82
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !83
  %1 = load i32, i32* %0, align 4, !dbg !84
  store i32 %1, i32* %data1, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !88, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %connectSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  br label %do.body, !dbg !115

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !116
  store i32 %call, i32* %connectSocket, align 4, !dbg !118
  %2 = load i32, i32* %connectSocket, align 4, !dbg !119
  %cmp = icmp eq i32 %2, -1, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !123

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !125
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !126
  store i16 2, i16* %sin_family, align 4, !dbg !127
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !128
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !129
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !130
  store i32 %call2, i32* %s_addr, align 4, !dbg !131
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !132
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !133
  store i16 %call3, i16* %sin_port, align 2, !dbg !134
  %4 = load i32, i32* %connectSocket, align 4, !dbg !135
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !137
  %call4 = call i32 @connect(i32 %4, %struct.sockaddr* %5, i32 16), !dbg !138
  %cmp5 = icmp eq i32 %call4, -1, !dbg !139
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !140

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !141

if.end7:                                          ; preds = %if.end
  %6 = load i32, i32* %connectSocket, align 4, !dbg !143
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !144
  %call8 = call i64 @recv(i32 %6, i8* %arraydecay, i64 13, i32 0), !dbg !145
  %conv = trunc i64 %call8 to i32, !dbg !145
  store i32 %conv, i32* %recvResult, align 4, !dbg !146
  %7 = load i32, i32* %recvResult, align 4, !dbg !147
  %cmp9 = icmp eq i32 %7, -1, !dbg !149
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !150

lor.lhs.false:                                    ; preds = %if.end7
  %8 = load i32, i32* %recvResult, align 4, !dbg !151
  %cmp11 = icmp eq i32 %8, 0, !dbg !152
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !153

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !154

if.end14:                                         ; preds = %lor.lhs.false
  %9 = load i32, i32* %recvResult, align 4, !dbg !156
  %idxprom = sext i32 %9 to i64, !dbg !157
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !157
  store i8 0, i8* %arrayidx, align 1, !dbg !158
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %call16 = call i32 @atoi(i8* %arraydecay15) #10, !dbg !160
  store i32 %call16, i32* %data1, align 4, !dbg !161
  br label %do.end, !dbg !162

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %10 = load i32, i32* %connectSocket, align 4, !dbg !163
  %cmp17 = icmp ne i32 %10, -1, !dbg !165
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !166

if.then19:                                        ; preds = %do.end
  %11 = load i32, i32* %connectSocket, align 4, !dbg !167
  %call20 = call i32 @close(i32 %11), !dbg !169
  br label %if.end21, !dbg !170

if.end21:                                         ; preds = %if.then19, %do.end
  %12 = load i32, i32* %data1, align 4, !dbg !171
  %13 = load i32*, i32** %dataPtr1, align 8, !dbg !172
  store i32 %12, i32* %13, align 4, !dbg !173
  call void @llvm.dbg.declare(metadata i32* %data22, metadata !174, metadata !DIExpression()), !dbg !176
  %14 = load i32*, i32** %dataPtr2, align 8, !dbg !177
  %15 = load i32, i32* %14, align 4, !dbg !178
  store i32 %15, i32* %data22, align 4, !dbg !176
  call void @llvm.dbg.declare(metadata i32* %i, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !182, metadata !DIExpression()), !dbg !183
  %call23 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !184
  %16 = bitcast i8* %call23 to i32*, !dbg !185
  store i32* %16, i32** %buffer, align 8, !dbg !183
  %17 = load i32*, i32** %buffer, align 8, !dbg !186
  %cmp24 = icmp eq i32* %17, null, !dbg !188
  br i1 %cmp24, label %if.then26, label %if.end27, !dbg !189

if.then26:                                        ; preds = %if.end21
  call void @exit(i32 -1) #11, !dbg !190
  unreachable, !dbg !190

if.end27:                                         ; preds = %if.end21
  store i32 0, i32* %i, align 4, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %if.end27
  %18 = load i32, i32* %i, align 4, !dbg !195
  %cmp28 = icmp slt i32 %18, 10, !dbg !197
  br i1 %cmp28, label %for.body, label %for.end, !dbg !198

for.body:                                         ; preds = %for.cond
  %19 = load i32*, i32** %buffer, align 8, !dbg !199
  %20 = load i32, i32* %i, align 4, !dbg !201
  %idxprom30 = sext i32 %20 to i64, !dbg !199
  %arrayidx31 = getelementptr inbounds i32, i32* %19, i64 %idxprom30, !dbg !199
  store i32 0, i32* %arrayidx31, align 4, !dbg !202
  br label %for.inc, !dbg !203

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !204
  %inc = add nsw i32 %21, 1, !dbg !204
  store i32 %inc, i32* %i, align 4, !dbg !204
  br label %for.cond, !dbg !205, !llvm.loop !206

for.end:                                          ; preds = %for.cond
  %22 = load i32, i32* %data22, align 4, !dbg !209
  %cmp32 = icmp sge i32 %22, 0, !dbg !211
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !212

if.then34:                                        ; preds = %for.end
  %23 = load i32*, i32** %buffer, align 8, !dbg !213
  %24 = load i32, i32* %data22, align 4, !dbg !215
  %idxprom35 = sext i32 %24 to i64, !dbg !213
  %arrayidx36 = getelementptr inbounds i32, i32* %23, i64 %idxprom35, !dbg !213
  store i32 1, i32* %arrayidx36, align 4, !dbg !216
  store i32 0, i32* %i, align 4, !dbg !217
  br label %for.cond37, !dbg !219

for.cond37:                                       ; preds = %for.inc43, %if.then34
  %25 = load i32, i32* %i, align 4, !dbg !220
  %cmp38 = icmp slt i32 %25, 10, !dbg !222
  br i1 %cmp38, label %for.body40, label %for.end45, !dbg !223

for.body40:                                       ; preds = %for.cond37
  %26 = load i32*, i32** %buffer, align 8, !dbg !224
  %27 = load i32, i32* %i, align 4, !dbg !226
  %idxprom41 = sext i32 %27 to i64, !dbg !224
  %arrayidx42 = getelementptr inbounds i32, i32* %26, i64 %idxprom41, !dbg !224
  %28 = load i32, i32* %arrayidx42, align 4, !dbg !224
  call void @printIntLine(i32 %28), !dbg !227
  br label %for.inc43, !dbg !228

for.inc43:                                        ; preds = %for.body40
  %29 = load i32, i32* %i, align 4, !dbg !229
  %inc44 = add nsw i32 %29, 1, !dbg !229
  store i32 %inc44, i32* %i, align 4, !dbg !229
  br label %for.cond37, !dbg !230, !llvm.loop !231

for.end45:                                        ; preds = %for.cond37
  br label %if.end46, !dbg !233

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !234
  br label %if.end46

if.end46:                                         ; preds = %if.else, %for.end45
  %30 = load i32*, i32** %buffer, align 8, !dbg !236
  %31 = bitcast i32* %30 to i8*, !dbg !236
  call void @free(i8* %31) #8, !dbg !237
  ret void, !dbg !238
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_32_good() #0 !dbg !239 {
entry:
  call void @goodG2B(), !dbg !240
  call void @goodB2G(), !dbg !241
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_32_good(), !dbg !256
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !257
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !258
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_32_bad(), !dbg !259
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !260
  ret i32 0, !dbg !261
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !262 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !263, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !265, metadata !DIExpression()), !dbg !266
  store i32* %data, i32** %dataPtr1, align 8, !dbg !266
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !267, metadata !DIExpression()), !dbg !268
  store i32* %data, i32** %dataPtr2, align 8, !dbg !268
  store i32 -1, i32* %data, align 4, !dbg !269
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !270, metadata !DIExpression()), !dbg !272
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !273
  %1 = load i32, i32* %0, align 4, !dbg !274
  store i32 %1, i32* %data1, align 4, !dbg !272
  store i32 7, i32* %data1, align 4, !dbg !275
  %2 = load i32, i32* %data1, align 4, !dbg !276
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !277
  store i32 %2, i32* %3, align 4, !dbg !278
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !279, metadata !DIExpression()), !dbg !281
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !282
  %5 = load i32, i32* %4, align 4, !dbg !283
  store i32 %5, i32* %data2, align 4, !dbg !281
  call void @llvm.dbg.declare(metadata i32* %i, metadata !284, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !287, metadata !DIExpression()), !dbg !288
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !289
  %6 = bitcast i8* %call to i32*, !dbg !290
  store i32* %6, i32** %buffer, align 8, !dbg !288
  %7 = load i32*, i32** %buffer, align 8, !dbg !291
  %cmp = icmp eq i32* %7, null, !dbg !293
  br i1 %cmp, label %if.then, label %if.end, !dbg !294

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !295
  unreachable, !dbg !295

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !297
  br label %for.cond, !dbg !299

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4, !dbg !300
  %cmp3 = icmp slt i32 %8, 10, !dbg !302
  br i1 %cmp3, label %for.body, label %for.end, !dbg !303

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %buffer, align 8, !dbg !304
  %10 = load i32, i32* %i, align 4, !dbg !306
  %idxprom = sext i32 %10 to i64, !dbg !304
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom, !dbg !304
  store i32 0, i32* %arrayidx, align 4, !dbg !307
  br label %for.inc, !dbg !308

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !309
  %inc = add nsw i32 %11, 1, !dbg !309
  store i32 %inc, i32* %i, align 4, !dbg !309
  br label %for.cond, !dbg !310, !llvm.loop !311

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %data2, align 4, !dbg !313
  %cmp4 = icmp sge i32 %12, 0, !dbg !315
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !316

if.then5:                                         ; preds = %for.end
  %13 = load i32*, i32** %buffer, align 8, !dbg !317
  %14 = load i32, i32* %data2, align 4, !dbg !319
  %idxprom6 = sext i32 %14 to i64, !dbg !317
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 %idxprom6, !dbg !317
  store i32 1, i32* %arrayidx7, align 4, !dbg !320
  store i32 0, i32* %i, align 4, !dbg !321
  br label %for.cond8, !dbg !323

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %15 = load i32, i32* %i, align 4, !dbg !324
  %cmp9 = icmp slt i32 %15, 10, !dbg !326
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !327

for.body10:                                       ; preds = %for.cond8
  %16 = load i32*, i32** %buffer, align 8, !dbg !328
  %17 = load i32, i32* %i, align 4, !dbg !330
  %idxprom11 = sext i32 %17 to i64, !dbg !328
  %arrayidx12 = getelementptr inbounds i32, i32* %16, i64 %idxprom11, !dbg !328
  %18 = load i32, i32* %arrayidx12, align 4, !dbg !328
  call void @printIntLine(i32 %18), !dbg !331
  br label %for.inc13, !dbg !332

for.inc13:                                        ; preds = %for.body10
  %19 = load i32, i32* %i, align 4, !dbg !333
  %inc14 = add nsw i32 %19, 1, !dbg !333
  store i32 %inc14, i32* %i, align 4, !dbg !333
  br label %for.cond8, !dbg !334, !llvm.loop !335

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !337

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !338
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %20 = load i32*, i32** %buffer, align 8, !dbg !340
  %21 = bitcast i32* %20 to i8*, !dbg !340
  call void @free(i8* %21) #8, !dbg !341
  ret void, !dbg !342
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !343 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data22 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !344, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !346, metadata !DIExpression()), !dbg !347
  store i32* %data, i32** %dataPtr1, align 8, !dbg !347
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !348, metadata !DIExpression()), !dbg !349
  store i32* %data, i32** %dataPtr2, align 8, !dbg !349
  store i32 -1, i32* %data, align 4, !dbg !350
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !351, metadata !DIExpression()), !dbg !353
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !354
  %1 = load i32, i32* %0, align 4, !dbg !355
  store i32 %1, i32* %data1, align 4, !dbg !353
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !356, metadata !DIExpression()), !dbg !358
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !359, metadata !DIExpression()), !dbg !360
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !361, metadata !DIExpression()), !dbg !362
  store i32 -1, i32* %connectSocket, align 4, !dbg !362
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !363, metadata !DIExpression()), !dbg !364
  br label %do.body, !dbg !365

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !366
  store i32 %call, i32* %connectSocket, align 4, !dbg !368
  %2 = load i32, i32* %connectSocket, align 4, !dbg !369
  %cmp = icmp eq i32 %2, -1, !dbg !371
  br i1 %cmp, label %if.then, label %if.end, !dbg !372

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !373

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !375
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !375
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !376
  store i16 2, i16* %sin_family, align 4, !dbg !377
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !378
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !379
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !380
  store i32 %call2, i32* %s_addr, align 4, !dbg !381
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !382
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !383
  store i16 %call3, i16* %sin_port, align 2, !dbg !384
  %4 = load i32, i32* %connectSocket, align 4, !dbg !385
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !387
  %call4 = call i32 @connect(i32 %4, %struct.sockaddr* %5, i32 16), !dbg !388
  %cmp5 = icmp eq i32 %call4, -1, !dbg !389
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !390

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !391

if.end7:                                          ; preds = %if.end
  %6 = load i32, i32* %connectSocket, align 4, !dbg !393
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !394
  %call8 = call i64 @recv(i32 %6, i8* %arraydecay, i64 13, i32 0), !dbg !395
  %conv = trunc i64 %call8 to i32, !dbg !395
  store i32 %conv, i32* %recvResult, align 4, !dbg !396
  %7 = load i32, i32* %recvResult, align 4, !dbg !397
  %cmp9 = icmp eq i32 %7, -1, !dbg !399
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !400

lor.lhs.false:                                    ; preds = %if.end7
  %8 = load i32, i32* %recvResult, align 4, !dbg !401
  %cmp11 = icmp eq i32 %8, 0, !dbg !402
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !403

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !404

if.end14:                                         ; preds = %lor.lhs.false
  %9 = load i32, i32* %recvResult, align 4, !dbg !406
  %idxprom = sext i32 %9 to i64, !dbg !407
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !407
  store i8 0, i8* %arrayidx, align 1, !dbg !408
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !409
  %call16 = call i32 @atoi(i8* %arraydecay15) #10, !dbg !410
  store i32 %call16, i32* %data1, align 4, !dbg !411
  br label %do.end, !dbg !412

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %10 = load i32, i32* %connectSocket, align 4, !dbg !413
  %cmp17 = icmp ne i32 %10, -1, !dbg !415
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !416

if.then19:                                        ; preds = %do.end
  %11 = load i32, i32* %connectSocket, align 4, !dbg !417
  %call20 = call i32 @close(i32 %11), !dbg !419
  br label %if.end21, !dbg !420

if.end21:                                         ; preds = %if.then19, %do.end
  %12 = load i32, i32* %data1, align 4, !dbg !421
  %13 = load i32*, i32** %dataPtr1, align 8, !dbg !422
  store i32 %12, i32* %13, align 4, !dbg !423
  call void @llvm.dbg.declare(metadata i32* %data22, metadata !424, metadata !DIExpression()), !dbg !426
  %14 = load i32*, i32** %dataPtr2, align 8, !dbg !427
  %15 = load i32, i32* %14, align 4, !dbg !428
  store i32 %15, i32* %data22, align 4, !dbg !426
  call void @llvm.dbg.declare(metadata i32* %i, metadata !429, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !432, metadata !DIExpression()), !dbg !433
  %call23 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !434
  %16 = bitcast i8* %call23 to i32*, !dbg !435
  store i32* %16, i32** %buffer, align 8, !dbg !433
  %17 = load i32*, i32** %buffer, align 8, !dbg !436
  %cmp24 = icmp eq i32* %17, null, !dbg !438
  br i1 %cmp24, label %if.then26, label %if.end27, !dbg !439

if.then26:                                        ; preds = %if.end21
  call void @exit(i32 -1) #11, !dbg !440
  unreachable, !dbg !440

if.end27:                                         ; preds = %if.end21
  store i32 0, i32* %i, align 4, !dbg !442
  br label %for.cond, !dbg !444

for.cond:                                         ; preds = %for.inc, %if.end27
  %18 = load i32, i32* %i, align 4, !dbg !445
  %cmp28 = icmp slt i32 %18, 10, !dbg !447
  br i1 %cmp28, label %for.body, label %for.end, !dbg !448

for.body:                                         ; preds = %for.cond
  %19 = load i32*, i32** %buffer, align 8, !dbg !449
  %20 = load i32, i32* %i, align 4, !dbg !451
  %idxprom30 = sext i32 %20 to i64, !dbg !449
  %arrayidx31 = getelementptr inbounds i32, i32* %19, i64 %idxprom30, !dbg !449
  store i32 0, i32* %arrayidx31, align 4, !dbg !452
  br label %for.inc, !dbg !453

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !454
  %inc = add nsw i32 %21, 1, !dbg !454
  store i32 %inc, i32* %i, align 4, !dbg !454
  br label %for.cond, !dbg !455, !llvm.loop !456

for.end:                                          ; preds = %for.cond
  %22 = load i32, i32* %data22, align 4, !dbg !458
  %cmp32 = icmp sge i32 %22, 0, !dbg !460
  br i1 %cmp32, label %land.lhs.true, label %if.else, !dbg !461

land.lhs.true:                                    ; preds = %for.end
  %23 = load i32, i32* %data22, align 4, !dbg !462
  %cmp34 = icmp slt i32 %23, 10, !dbg !463
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !464

if.then36:                                        ; preds = %land.lhs.true
  %24 = load i32*, i32** %buffer, align 8, !dbg !465
  %25 = load i32, i32* %data22, align 4, !dbg !467
  %idxprom37 = sext i32 %25 to i64, !dbg !465
  %arrayidx38 = getelementptr inbounds i32, i32* %24, i64 %idxprom37, !dbg !465
  store i32 1, i32* %arrayidx38, align 4, !dbg !468
  store i32 0, i32* %i, align 4, !dbg !469
  br label %for.cond39, !dbg !471

for.cond39:                                       ; preds = %for.inc45, %if.then36
  %26 = load i32, i32* %i, align 4, !dbg !472
  %cmp40 = icmp slt i32 %26, 10, !dbg !474
  br i1 %cmp40, label %for.body42, label %for.end47, !dbg !475

for.body42:                                       ; preds = %for.cond39
  %27 = load i32*, i32** %buffer, align 8, !dbg !476
  %28 = load i32, i32* %i, align 4, !dbg !478
  %idxprom43 = sext i32 %28 to i64, !dbg !476
  %arrayidx44 = getelementptr inbounds i32, i32* %27, i64 %idxprom43, !dbg !476
  %29 = load i32, i32* %arrayidx44, align 4, !dbg !476
  call void @printIntLine(i32 %29), !dbg !479
  br label %for.inc45, !dbg !480

for.inc45:                                        ; preds = %for.body42
  %30 = load i32, i32* %i, align 4, !dbg !481
  %inc46 = add nsw i32 %30, 1, !dbg !481
  store i32 %inc46, i32* %i, align 4, !dbg !481
  br label %for.cond39, !dbg !482, !llvm.loop !483

for.end47:                                        ; preds = %for.cond39
  br label %if.end48, !dbg !485

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !486
  br label %if.end48

if.end48:                                         ; preds = %if.else, %for.end47
  %31 = load i32*, i32** %buffer, align 8, !dbg !488
  %32 = bitcast i32* %31 to i8*, !dbg !488
  call void @free(i8* %32) #8, !dbg !489
  ret void, !dbg !490
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_32_bad", scope: !69, file: !69, line: 44, type: !70, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_32.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 46, type: !60)
!74 = !DILocation(line: 46, column: 9, scope: !68)
!75 = !DILocalVariable(name: "dataPtr1", scope: !68, file: !69, line: 47, type: !59)
!76 = !DILocation(line: 47, column: 10, scope: !68)
!77 = !DILocalVariable(name: "dataPtr2", scope: !68, file: !69, line: 48, type: !59)
!78 = !DILocation(line: 48, column: 10, scope: !68)
!79 = !DILocation(line: 50, column: 10, scope: !68)
!80 = !DILocalVariable(name: "data", scope: !81, file: !69, line: 52, type: !60)
!81 = distinct !DILexicalBlock(scope: !68, file: !69, line: 51, column: 5)
!82 = !DILocation(line: 52, column: 13, scope: !81)
!83 = !DILocation(line: 52, column: 21, scope: !81)
!84 = !DILocation(line: 52, column: 20, scope: !81)
!85 = !DILocalVariable(name: "recvResult", scope: !86, file: !69, line: 58, type: !60)
!86 = distinct !DILexicalBlock(scope: !81, file: !69, line: 53, column: 9)
!87 = !DILocation(line: 58, column: 17, scope: !86)
!88 = !DILocalVariable(name: "service", scope: !86, file: !69, line: 59, type: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !90)
!90 = !{!91, !92, !98, !105}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !89, file: !17, line: 240, baseType: !51, size: 16)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !89, file: !17, line: 241, baseType: !93, size: 16, offset: 16)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !95, line: 25, baseType: !96)
!95 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !97, line: 40, baseType: !53)
!97 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !89, file: !17, line: 242, baseType: !99, size: 32, offset: 32)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !100)
!100 = !{!101}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !99, file: !17, line: 33, baseType: !102, size: 32)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !95, line: 26, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !97, line: 42, baseType: !5)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !89, file: !17, line: 245, baseType: !106, size: 64, offset: 64)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 64, elements: !108)
!107 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!108 = !{!109}
!109 = !DISubrange(count: 8)
!110 = !DILocation(line: 59, column: 32, scope: !86)
!111 = !DILocalVariable(name: "connectSocket", scope: !86, file: !69, line: 60, type: !60)
!112 = !DILocation(line: 60, column: 20, scope: !86)
!113 = !DILocalVariable(name: "inputBuffer", scope: !86, file: !69, line: 61, type: !55)
!114 = !DILocation(line: 61, column: 18, scope: !86)
!115 = !DILocation(line: 62, column: 13, scope: !86)
!116 = !DILocation(line: 72, column: 33, scope: !117)
!117 = distinct !DILexicalBlock(scope: !86, file: !69, line: 63, column: 13)
!118 = !DILocation(line: 72, column: 31, scope: !117)
!119 = !DILocation(line: 73, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !69, line: 73, column: 21)
!121 = !DILocation(line: 73, column: 35, scope: !120)
!122 = !DILocation(line: 73, column: 21, scope: !117)
!123 = !DILocation(line: 75, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !69, line: 74, column: 17)
!125 = !DILocation(line: 77, column: 17, scope: !117)
!126 = !DILocation(line: 78, column: 25, scope: !117)
!127 = !DILocation(line: 78, column: 36, scope: !117)
!128 = !DILocation(line: 79, column: 43, scope: !117)
!129 = !DILocation(line: 79, column: 25, scope: !117)
!130 = !DILocation(line: 79, column: 34, scope: !117)
!131 = !DILocation(line: 79, column: 41, scope: !117)
!132 = !DILocation(line: 80, column: 36, scope: !117)
!133 = !DILocation(line: 80, column: 25, scope: !117)
!134 = !DILocation(line: 80, column: 34, scope: !117)
!135 = !DILocation(line: 81, column: 29, scope: !136)
!136 = distinct !DILexicalBlock(scope: !117, file: !69, line: 81, column: 21)
!137 = !DILocation(line: 81, column: 44, scope: !136)
!138 = !DILocation(line: 81, column: 21, scope: !136)
!139 = !DILocation(line: 81, column: 89, scope: !136)
!140 = !DILocation(line: 81, column: 21, scope: !117)
!141 = !DILocation(line: 83, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !69, line: 82, column: 17)
!143 = !DILocation(line: 87, column: 35, scope: !117)
!144 = !DILocation(line: 87, column: 50, scope: !117)
!145 = !DILocation(line: 87, column: 30, scope: !117)
!146 = !DILocation(line: 87, column: 28, scope: !117)
!147 = !DILocation(line: 88, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !117, file: !69, line: 88, column: 21)
!149 = !DILocation(line: 88, column: 32, scope: !148)
!150 = !DILocation(line: 88, column: 48, scope: !148)
!151 = !DILocation(line: 88, column: 51, scope: !148)
!152 = !DILocation(line: 88, column: 62, scope: !148)
!153 = !DILocation(line: 88, column: 21, scope: !117)
!154 = !DILocation(line: 90, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !148, file: !69, line: 89, column: 17)
!156 = !DILocation(line: 93, column: 29, scope: !117)
!157 = !DILocation(line: 93, column: 17, scope: !117)
!158 = !DILocation(line: 93, column: 41, scope: !117)
!159 = !DILocation(line: 95, column: 29, scope: !117)
!160 = !DILocation(line: 95, column: 24, scope: !117)
!161 = !DILocation(line: 95, column: 22, scope: !117)
!162 = !DILocation(line: 96, column: 13, scope: !117)
!163 = !DILocation(line: 98, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !86, file: !69, line: 98, column: 17)
!165 = !DILocation(line: 98, column: 31, scope: !164)
!166 = !DILocation(line: 98, column: 17, scope: !86)
!167 = !DILocation(line: 100, column: 30, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !69, line: 99, column: 13)
!169 = !DILocation(line: 100, column: 17, scope: !168)
!170 = !DILocation(line: 101, column: 13, scope: !168)
!171 = !DILocation(line: 109, column: 21, scope: !81)
!172 = !DILocation(line: 109, column: 10, scope: !81)
!173 = !DILocation(line: 109, column: 19, scope: !81)
!174 = !DILocalVariable(name: "data", scope: !175, file: !69, line: 112, type: !60)
!175 = distinct !DILexicalBlock(scope: !68, file: !69, line: 111, column: 5)
!176 = !DILocation(line: 112, column: 13, scope: !175)
!177 = !DILocation(line: 112, column: 21, scope: !175)
!178 = !DILocation(line: 112, column: 20, scope: !175)
!179 = !DILocalVariable(name: "i", scope: !180, file: !69, line: 114, type: !60)
!180 = distinct !DILexicalBlock(scope: !175, file: !69, line: 113, column: 9)
!181 = !DILocation(line: 114, column: 17, scope: !180)
!182 = !DILocalVariable(name: "buffer", scope: !180, file: !69, line: 115, type: !59)
!183 = !DILocation(line: 115, column: 19, scope: !180)
!184 = !DILocation(line: 115, column: 35, scope: !180)
!185 = !DILocation(line: 115, column: 28, scope: !180)
!186 = !DILocation(line: 116, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !180, file: !69, line: 116, column: 17)
!188 = !DILocation(line: 116, column: 24, scope: !187)
!189 = !DILocation(line: 116, column: 17, scope: !180)
!190 = !DILocation(line: 116, column: 34, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !69, line: 116, column: 33)
!192 = !DILocation(line: 118, column: 20, scope: !193)
!193 = distinct !DILexicalBlock(scope: !180, file: !69, line: 118, column: 13)
!194 = !DILocation(line: 118, column: 18, scope: !193)
!195 = !DILocation(line: 118, column: 25, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !69, line: 118, column: 13)
!197 = !DILocation(line: 118, column: 27, scope: !196)
!198 = !DILocation(line: 118, column: 13, scope: !193)
!199 = !DILocation(line: 120, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !69, line: 119, column: 13)
!201 = !DILocation(line: 120, column: 24, scope: !200)
!202 = !DILocation(line: 120, column: 27, scope: !200)
!203 = !DILocation(line: 121, column: 13, scope: !200)
!204 = !DILocation(line: 118, column: 34, scope: !196)
!205 = !DILocation(line: 118, column: 13, scope: !196)
!206 = distinct !{!206, !198, !207, !208}
!207 = !DILocation(line: 121, column: 13, scope: !193)
!208 = !{!"llvm.loop.mustprogress"}
!209 = !DILocation(line: 124, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !180, file: !69, line: 124, column: 17)
!211 = !DILocation(line: 124, column: 22, scope: !210)
!212 = !DILocation(line: 124, column: 17, scope: !180)
!213 = !DILocation(line: 126, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !69, line: 125, column: 13)
!215 = !DILocation(line: 126, column: 24, scope: !214)
!216 = !DILocation(line: 126, column: 30, scope: !214)
!217 = !DILocation(line: 128, column: 23, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !69, line: 128, column: 17)
!219 = !DILocation(line: 128, column: 21, scope: !218)
!220 = !DILocation(line: 128, column: 28, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !69, line: 128, column: 17)
!222 = !DILocation(line: 128, column: 30, scope: !221)
!223 = !DILocation(line: 128, column: 17, scope: !218)
!224 = !DILocation(line: 130, column: 34, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !69, line: 129, column: 17)
!226 = !DILocation(line: 130, column: 41, scope: !225)
!227 = !DILocation(line: 130, column: 21, scope: !225)
!228 = !DILocation(line: 131, column: 17, scope: !225)
!229 = !DILocation(line: 128, column: 37, scope: !221)
!230 = !DILocation(line: 128, column: 17, scope: !221)
!231 = distinct !{!231, !223, !232, !208}
!232 = !DILocation(line: 131, column: 17, scope: !218)
!233 = !DILocation(line: 132, column: 13, scope: !214)
!234 = !DILocation(line: 135, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !210, file: !69, line: 134, column: 13)
!236 = !DILocation(line: 137, column: 18, scope: !180)
!237 = !DILocation(line: 137, column: 13, scope: !180)
!238 = !DILocation(line: 140, column: 1, scope: !68)
!239 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_32_good", scope: !69, file: !69, line: 290, type: !70, scopeLine: 291, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!240 = !DILocation(line: 292, column: 5, scope: !239)
!241 = !DILocation(line: 293, column: 5, scope: !239)
!242 = !DILocation(line: 294, column: 1, scope: !239)
!243 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 304, type: !244, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!244 = !DISubroutineType(types: !245)
!245 = !{!60, !60, !246}
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!248 = !DILocalVariable(name: "argc", arg: 1, scope: !243, file: !69, line: 304, type: !60)
!249 = !DILocation(line: 304, column: 14, scope: !243)
!250 = !DILocalVariable(name: "argv", arg: 2, scope: !243, file: !69, line: 304, type: !246)
!251 = !DILocation(line: 304, column: 27, scope: !243)
!252 = !DILocation(line: 307, column: 22, scope: !243)
!253 = !DILocation(line: 307, column: 12, scope: !243)
!254 = !DILocation(line: 307, column: 5, scope: !243)
!255 = !DILocation(line: 309, column: 5, scope: !243)
!256 = !DILocation(line: 310, column: 5, scope: !243)
!257 = !DILocation(line: 311, column: 5, scope: !243)
!258 = !DILocation(line: 314, column: 5, scope: !243)
!259 = !DILocation(line: 315, column: 5, scope: !243)
!260 = !DILocation(line: 316, column: 5, scope: !243)
!261 = !DILocation(line: 318, column: 5, scope: !243)
!262 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 147, type: !70, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!263 = !DILocalVariable(name: "data", scope: !262, file: !69, line: 149, type: !60)
!264 = !DILocation(line: 149, column: 9, scope: !262)
!265 = !DILocalVariable(name: "dataPtr1", scope: !262, file: !69, line: 150, type: !59)
!266 = !DILocation(line: 150, column: 10, scope: !262)
!267 = !DILocalVariable(name: "dataPtr2", scope: !262, file: !69, line: 151, type: !59)
!268 = !DILocation(line: 151, column: 10, scope: !262)
!269 = !DILocation(line: 153, column: 10, scope: !262)
!270 = !DILocalVariable(name: "data", scope: !271, file: !69, line: 155, type: !60)
!271 = distinct !DILexicalBlock(scope: !262, file: !69, line: 154, column: 5)
!272 = !DILocation(line: 155, column: 13, scope: !271)
!273 = !DILocation(line: 155, column: 21, scope: !271)
!274 = !DILocation(line: 155, column: 20, scope: !271)
!275 = !DILocation(line: 158, column: 14, scope: !271)
!276 = !DILocation(line: 159, column: 21, scope: !271)
!277 = !DILocation(line: 159, column: 10, scope: !271)
!278 = !DILocation(line: 159, column: 19, scope: !271)
!279 = !DILocalVariable(name: "data", scope: !280, file: !69, line: 162, type: !60)
!280 = distinct !DILexicalBlock(scope: !262, file: !69, line: 161, column: 5)
!281 = !DILocation(line: 162, column: 13, scope: !280)
!282 = !DILocation(line: 162, column: 21, scope: !280)
!283 = !DILocation(line: 162, column: 20, scope: !280)
!284 = !DILocalVariable(name: "i", scope: !285, file: !69, line: 164, type: !60)
!285 = distinct !DILexicalBlock(scope: !280, file: !69, line: 163, column: 9)
!286 = !DILocation(line: 164, column: 17, scope: !285)
!287 = !DILocalVariable(name: "buffer", scope: !285, file: !69, line: 165, type: !59)
!288 = !DILocation(line: 165, column: 19, scope: !285)
!289 = !DILocation(line: 165, column: 35, scope: !285)
!290 = !DILocation(line: 165, column: 28, scope: !285)
!291 = !DILocation(line: 166, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !285, file: !69, line: 166, column: 17)
!293 = !DILocation(line: 166, column: 24, scope: !292)
!294 = !DILocation(line: 166, column: 17, scope: !285)
!295 = !DILocation(line: 166, column: 34, scope: !296)
!296 = distinct !DILexicalBlock(scope: !292, file: !69, line: 166, column: 33)
!297 = !DILocation(line: 168, column: 20, scope: !298)
!298 = distinct !DILexicalBlock(scope: !285, file: !69, line: 168, column: 13)
!299 = !DILocation(line: 168, column: 18, scope: !298)
!300 = !DILocation(line: 168, column: 25, scope: !301)
!301 = distinct !DILexicalBlock(scope: !298, file: !69, line: 168, column: 13)
!302 = !DILocation(line: 168, column: 27, scope: !301)
!303 = !DILocation(line: 168, column: 13, scope: !298)
!304 = !DILocation(line: 170, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !69, line: 169, column: 13)
!306 = !DILocation(line: 170, column: 24, scope: !305)
!307 = !DILocation(line: 170, column: 27, scope: !305)
!308 = !DILocation(line: 171, column: 13, scope: !305)
!309 = !DILocation(line: 168, column: 34, scope: !301)
!310 = !DILocation(line: 168, column: 13, scope: !301)
!311 = distinct !{!311, !303, !312, !208}
!312 = !DILocation(line: 171, column: 13, scope: !298)
!313 = !DILocation(line: 174, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !285, file: !69, line: 174, column: 17)
!315 = !DILocation(line: 174, column: 22, scope: !314)
!316 = !DILocation(line: 174, column: 17, scope: !285)
!317 = !DILocation(line: 176, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !69, line: 175, column: 13)
!319 = !DILocation(line: 176, column: 24, scope: !318)
!320 = !DILocation(line: 176, column: 30, scope: !318)
!321 = !DILocation(line: 178, column: 23, scope: !322)
!322 = distinct !DILexicalBlock(scope: !318, file: !69, line: 178, column: 17)
!323 = !DILocation(line: 178, column: 21, scope: !322)
!324 = !DILocation(line: 178, column: 28, scope: !325)
!325 = distinct !DILexicalBlock(scope: !322, file: !69, line: 178, column: 17)
!326 = !DILocation(line: 178, column: 30, scope: !325)
!327 = !DILocation(line: 178, column: 17, scope: !322)
!328 = !DILocation(line: 180, column: 34, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !69, line: 179, column: 17)
!330 = !DILocation(line: 180, column: 41, scope: !329)
!331 = !DILocation(line: 180, column: 21, scope: !329)
!332 = !DILocation(line: 181, column: 17, scope: !329)
!333 = !DILocation(line: 178, column: 37, scope: !325)
!334 = !DILocation(line: 178, column: 17, scope: !325)
!335 = distinct !{!335, !327, !336, !208}
!336 = !DILocation(line: 181, column: 17, scope: !322)
!337 = !DILocation(line: 182, column: 13, scope: !318)
!338 = !DILocation(line: 185, column: 17, scope: !339)
!339 = distinct !DILexicalBlock(scope: !314, file: !69, line: 184, column: 13)
!340 = !DILocation(line: 187, column: 18, scope: !285)
!341 = !DILocation(line: 187, column: 13, scope: !285)
!342 = !DILocation(line: 190, column: 1, scope: !262)
!343 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 193, type: !70, scopeLine: 194, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!344 = !DILocalVariable(name: "data", scope: !343, file: !69, line: 195, type: !60)
!345 = !DILocation(line: 195, column: 9, scope: !343)
!346 = !DILocalVariable(name: "dataPtr1", scope: !343, file: !69, line: 196, type: !59)
!347 = !DILocation(line: 196, column: 10, scope: !343)
!348 = !DILocalVariable(name: "dataPtr2", scope: !343, file: !69, line: 197, type: !59)
!349 = !DILocation(line: 197, column: 10, scope: !343)
!350 = !DILocation(line: 199, column: 10, scope: !343)
!351 = !DILocalVariable(name: "data", scope: !352, file: !69, line: 201, type: !60)
!352 = distinct !DILexicalBlock(scope: !343, file: !69, line: 200, column: 5)
!353 = !DILocation(line: 201, column: 13, scope: !352)
!354 = !DILocation(line: 201, column: 21, scope: !352)
!355 = !DILocation(line: 201, column: 20, scope: !352)
!356 = !DILocalVariable(name: "recvResult", scope: !357, file: !69, line: 207, type: !60)
!357 = distinct !DILexicalBlock(scope: !352, file: !69, line: 202, column: 9)
!358 = !DILocation(line: 207, column: 17, scope: !357)
!359 = !DILocalVariable(name: "service", scope: !357, file: !69, line: 208, type: !89)
!360 = !DILocation(line: 208, column: 32, scope: !357)
!361 = !DILocalVariable(name: "connectSocket", scope: !357, file: !69, line: 209, type: !60)
!362 = !DILocation(line: 209, column: 20, scope: !357)
!363 = !DILocalVariable(name: "inputBuffer", scope: !357, file: !69, line: 210, type: !55)
!364 = !DILocation(line: 210, column: 18, scope: !357)
!365 = !DILocation(line: 211, column: 13, scope: !357)
!366 = !DILocation(line: 221, column: 33, scope: !367)
!367 = distinct !DILexicalBlock(scope: !357, file: !69, line: 212, column: 13)
!368 = !DILocation(line: 221, column: 31, scope: !367)
!369 = !DILocation(line: 222, column: 21, scope: !370)
!370 = distinct !DILexicalBlock(scope: !367, file: !69, line: 222, column: 21)
!371 = !DILocation(line: 222, column: 35, scope: !370)
!372 = !DILocation(line: 222, column: 21, scope: !367)
!373 = !DILocation(line: 224, column: 21, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !69, line: 223, column: 17)
!375 = !DILocation(line: 226, column: 17, scope: !367)
!376 = !DILocation(line: 227, column: 25, scope: !367)
!377 = !DILocation(line: 227, column: 36, scope: !367)
!378 = !DILocation(line: 228, column: 43, scope: !367)
!379 = !DILocation(line: 228, column: 25, scope: !367)
!380 = !DILocation(line: 228, column: 34, scope: !367)
!381 = !DILocation(line: 228, column: 41, scope: !367)
!382 = !DILocation(line: 229, column: 36, scope: !367)
!383 = !DILocation(line: 229, column: 25, scope: !367)
!384 = !DILocation(line: 229, column: 34, scope: !367)
!385 = !DILocation(line: 230, column: 29, scope: !386)
!386 = distinct !DILexicalBlock(scope: !367, file: !69, line: 230, column: 21)
!387 = !DILocation(line: 230, column: 44, scope: !386)
!388 = !DILocation(line: 230, column: 21, scope: !386)
!389 = !DILocation(line: 230, column: 89, scope: !386)
!390 = !DILocation(line: 230, column: 21, scope: !367)
!391 = !DILocation(line: 232, column: 21, scope: !392)
!392 = distinct !DILexicalBlock(scope: !386, file: !69, line: 231, column: 17)
!393 = !DILocation(line: 236, column: 35, scope: !367)
!394 = !DILocation(line: 236, column: 50, scope: !367)
!395 = !DILocation(line: 236, column: 30, scope: !367)
!396 = !DILocation(line: 236, column: 28, scope: !367)
!397 = !DILocation(line: 237, column: 21, scope: !398)
!398 = distinct !DILexicalBlock(scope: !367, file: !69, line: 237, column: 21)
!399 = !DILocation(line: 237, column: 32, scope: !398)
!400 = !DILocation(line: 237, column: 48, scope: !398)
!401 = !DILocation(line: 237, column: 51, scope: !398)
!402 = !DILocation(line: 237, column: 62, scope: !398)
!403 = !DILocation(line: 237, column: 21, scope: !367)
!404 = !DILocation(line: 239, column: 21, scope: !405)
!405 = distinct !DILexicalBlock(scope: !398, file: !69, line: 238, column: 17)
!406 = !DILocation(line: 242, column: 29, scope: !367)
!407 = !DILocation(line: 242, column: 17, scope: !367)
!408 = !DILocation(line: 242, column: 41, scope: !367)
!409 = !DILocation(line: 244, column: 29, scope: !367)
!410 = !DILocation(line: 244, column: 24, scope: !367)
!411 = !DILocation(line: 244, column: 22, scope: !367)
!412 = !DILocation(line: 245, column: 13, scope: !367)
!413 = !DILocation(line: 247, column: 17, scope: !414)
!414 = distinct !DILexicalBlock(scope: !357, file: !69, line: 247, column: 17)
!415 = !DILocation(line: 247, column: 31, scope: !414)
!416 = !DILocation(line: 247, column: 17, scope: !357)
!417 = !DILocation(line: 249, column: 30, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !69, line: 248, column: 13)
!419 = !DILocation(line: 249, column: 17, scope: !418)
!420 = !DILocation(line: 250, column: 13, scope: !418)
!421 = !DILocation(line: 258, column: 21, scope: !352)
!422 = !DILocation(line: 258, column: 10, scope: !352)
!423 = !DILocation(line: 258, column: 19, scope: !352)
!424 = !DILocalVariable(name: "data", scope: !425, file: !69, line: 261, type: !60)
!425 = distinct !DILexicalBlock(scope: !343, file: !69, line: 260, column: 5)
!426 = !DILocation(line: 261, column: 13, scope: !425)
!427 = !DILocation(line: 261, column: 21, scope: !425)
!428 = !DILocation(line: 261, column: 20, scope: !425)
!429 = !DILocalVariable(name: "i", scope: !430, file: !69, line: 263, type: !60)
!430 = distinct !DILexicalBlock(scope: !425, file: !69, line: 262, column: 9)
!431 = !DILocation(line: 263, column: 17, scope: !430)
!432 = !DILocalVariable(name: "buffer", scope: !430, file: !69, line: 264, type: !59)
!433 = !DILocation(line: 264, column: 19, scope: !430)
!434 = !DILocation(line: 264, column: 35, scope: !430)
!435 = !DILocation(line: 264, column: 28, scope: !430)
!436 = !DILocation(line: 265, column: 17, scope: !437)
!437 = distinct !DILexicalBlock(scope: !430, file: !69, line: 265, column: 17)
!438 = !DILocation(line: 265, column: 24, scope: !437)
!439 = !DILocation(line: 265, column: 17, scope: !430)
!440 = !DILocation(line: 265, column: 34, scope: !441)
!441 = distinct !DILexicalBlock(scope: !437, file: !69, line: 265, column: 33)
!442 = !DILocation(line: 267, column: 20, scope: !443)
!443 = distinct !DILexicalBlock(scope: !430, file: !69, line: 267, column: 13)
!444 = !DILocation(line: 267, column: 18, scope: !443)
!445 = !DILocation(line: 267, column: 25, scope: !446)
!446 = distinct !DILexicalBlock(scope: !443, file: !69, line: 267, column: 13)
!447 = !DILocation(line: 267, column: 27, scope: !446)
!448 = !DILocation(line: 267, column: 13, scope: !443)
!449 = !DILocation(line: 269, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !69, line: 268, column: 13)
!451 = !DILocation(line: 269, column: 24, scope: !450)
!452 = !DILocation(line: 269, column: 27, scope: !450)
!453 = !DILocation(line: 270, column: 13, scope: !450)
!454 = !DILocation(line: 267, column: 34, scope: !446)
!455 = !DILocation(line: 267, column: 13, scope: !446)
!456 = distinct !{!456, !448, !457, !208}
!457 = !DILocation(line: 270, column: 13, scope: !443)
!458 = !DILocation(line: 272, column: 17, scope: !459)
!459 = distinct !DILexicalBlock(scope: !430, file: !69, line: 272, column: 17)
!460 = !DILocation(line: 272, column: 22, scope: !459)
!461 = !DILocation(line: 272, column: 27, scope: !459)
!462 = !DILocation(line: 272, column: 30, scope: !459)
!463 = !DILocation(line: 272, column: 35, scope: !459)
!464 = !DILocation(line: 272, column: 17, scope: !430)
!465 = !DILocation(line: 274, column: 17, scope: !466)
!466 = distinct !DILexicalBlock(scope: !459, file: !69, line: 273, column: 13)
!467 = !DILocation(line: 274, column: 24, scope: !466)
!468 = !DILocation(line: 274, column: 30, scope: !466)
!469 = !DILocation(line: 276, column: 23, scope: !470)
!470 = distinct !DILexicalBlock(scope: !466, file: !69, line: 276, column: 17)
!471 = !DILocation(line: 276, column: 21, scope: !470)
!472 = !DILocation(line: 276, column: 28, scope: !473)
!473 = distinct !DILexicalBlock(scope: !470, file: !69, line: 276, column: 17)
!474 = !DILocation(line: 276, column: 30, scope: !473)
!475 = !DILocation(line: 276, column: 17, scope: !470)
!476 = !DILocation(line: 278, column: 34, scope: !477)
!477 = distinct !DILexicalBlock(scope: !473, file: !69, line: 277, column: 17)
!478 = !DILocation(line: 278, column: 41, scope: !477)
!479 = !DILocation(line: 278, column: 21, scope: !477)
!480 = !DILocation(line: 279, column: 17, scope: !477)
!481 = !DILocation(line: 276, column: 37, scope: !473)
!482 = !DILocation(line: 276, column: 17, scope: !473)
!483 = distinct !{!483, !475, !484, !208}
!484 = !DILocation(line: 279, column: 17, scope: !470)
!485 = !DILocation(line: 280, column: 13, scope: !466)
!486 = !DILocation(line: 283, column: 17, scope: !487)
!487 = distinct !DILexicalBlock(scope: !459, file: !69, line: 282, column: 13)
!488 = !DILocation(line: 285, column: 18, scope: !430)
!489 = !DILocation(line: 285, column: 13, scope: !430)
!490 = !DILocation(line: 288, column: 1, scope: !343)
