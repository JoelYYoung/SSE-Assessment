; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_bad() #0 !dbg !70 {
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !79
  %cmp = icmp eq i32 %0, 5, !dbg !81
  br i1 %cmp, label %if.then, label %if.end35, !dbg !82

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !83, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !87, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %listenSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %acceptSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  br label %do.body, !dbg !111

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !112
  store i32 %call, i32* %listenSocket, align 4, !dbg !114
  %1 = load i32, i32* %listenSocket, align 4, !dbg !115
  %cmp1 = icmp eq i32 %1, -1, !dbg !117
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !118

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !119

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !121
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !122
  store i16 2, i16* %sin_family, align 4, !dbg !123
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !124
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !125
  store i32 0, i32* %s_addr, align 4, !dbg !126
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !127
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !128
  store i16 %call3, i16* %sin_port, align 2, !dbg !129
  %3 = load i32, i32* %listenSocket, align 4, !dbg !130
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !132
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !133
  %cmp5 = icmp eq i32 %call4, -1, !dbg !134
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !135

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !136

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !138
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !140
  %cmp9 = icmp eq i32 %call8, -1, !dbg !141
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !142

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !143

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !145
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !146
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !147
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !148
  %cmp13 = icmp eq i32 %7, -1, !dbg !150
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !151

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !152

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !154
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !156
  %conv = trunc i64 %call16 to i32, !dbg !156
  store i32 %conv, i32* %recvResult, align 4, !dbg !157
  %9 = load i32, i32* %recvResult, align 4, !dbg !158
  %cmp17 = icmp eq i32 %9, -1, !dbg !160
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !161

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !162
  %cmp19 = icmp eq i32 %10, 0, !dbg !163
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !164

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !165

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !167
  %idxprom = sext i32 %11 to i64, !dbg !168
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !170
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !171
  store i32 %call24, i32* %data, align 4, !dbg !172
  br label %do.end, !dbg !173

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !174
  %cmp25 = icmp ne i32 %12, -1, !dbg !176
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !177

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !178
  %call28 = call i32 @close(i32 %13), !dbg !180
  br label %if.end29, !dbg !181

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !182
  %cmp30 = icmp ne i32 %14, -1, !dbg !184
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !185

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !186
  %call33 = call i32 @close(i32 %15), !dbg !188
  br label %if.end34, !dbg !189

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !190

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !191
  %cmp36 = icmp eq i32 %16, 5, !dbg !193
  br i1 %cmp36, label %if.then38, label %if.end49, !dbg !194

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !195, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !199, metadata !DIExpression()), !dbg !203
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !203
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !203
  %18 = load i32, i32* %data, align 4, !dbg !204
  %cmp39 = icmp sge i32 %18, 0, !dbg !206
  br i1 %cmp39, label %if.then41, label %if.else, !dbg !207

if.then41:                                        ; preds = %if.then38
  %19 = load i32, i32* %data, align 4, !dbg !208
  %idxprom42 = sext i32 %19 to i64, !dbg !210
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !210
  store i32 1, i32* %arrayidx43, align 4, !dbg !211
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %if.then41
  %20 = load i32, i32* %i, align 4, !dbg !215
  %cmp44 = icmp slt i32 %20, 10, !dbg !217
  br i1 %cmp44, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %21 = load i32, i32* %i, align 4, !dbg !219
  %idxprom46 = sext i32 %21 to i64, !dbg !221
  %arrayidx47 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom46, !dbg !221
  %22 = load i32, i32* %arrayidx47, align 4, !dbg !221
  call void @printIntLine(i32 %22), !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %i, align 4, !dbg !224
  %inc = add nsw i32 %23, 1, !dbg !224
  store i32 %inc, i32* %i, align 4, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  br label %if.end48, !dbg !229

if.else:                                          ; preds = %if.then38
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !230
  br label %if.end48

if.end48:                                         ; preds = %if.else, %for.end
  br label %if.end49, !dbg !232

if.end49:                                         ; preds = %if.end48, %if.end35
  ret void, !dbg !233
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

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_good() #0 !dbg !234 {
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
  %call = call i64 @time(i64* null) #7, !dbg !249
  %conv = trunc i64 %call to i32, !dbg !250
  call void @srand(i32 %conv) #7, !dbg !251
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !252
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_good(), !dbg !253
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !254
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !255
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_bad(), !dbg !256
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !257
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
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !260, metadata !DIExpression()), !dbg !261
  store i32 -1, i32* %data, align 4, !dbg !262
  %0 = load i32, i32* @globalFive, align 4, !dbg !263
  %cmp = icmp eq i32 %0, 5, !dbg !265
  br i1 %cmp, label %if.then, label %if.end35, !dbg !266

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !267, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !271, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !273, metadata !DIExpression()), !dbg !274
  store i32 -1, i32* %listenSocket, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !275, metadata !DIExpression()), !dbg !276
  store i32 -1, i32* %acceptSocket, align 4, !dbg !276
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !277, metadata !DIExpression()), !dbg !278
  br label %do.body, !dbg !279

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !280
  store i32 %call, i32* %listenSocket, align 4, !dbg !282
  %1 = load i32, i32* %listenSocket, align 4, !dbg !283
  %cmp1 = icmp eq i32 %1, -1, !dbg !285
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !286

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !287

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !289
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !289
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !290
  store i16 2, i16* %sin_family, align 4, !dbg !291
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !292
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !293
  store i32 0, i32* %s_addr, align 4, !dbg !294
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !295
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !296
  store i16 %call3, i16* %sin_port, align 2, !dbg !297
  %3 = load i32, i32* %listenSocket, align 4, !dbg !298
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !300
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !301
  %cmp5 = icmp eq i32 %call4, -1, !dbg !302
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !303

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !304

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !306
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !308
  %cmp9 = icmp eq i32 %call8, -1, !dbg !309
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !310

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !311

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !313
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !314
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !315
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !316
  %cmp13 = icmp eq i32 %7, -1, !dbg !318
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !319

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !320

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !322
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !323
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !324
  %conv = trunc i64 %call16 to i32, !dbg !324
  store i32 %conv, i32* %recvResult, align 4, !dbg !325
  %9 = load i32, i32* %recvResult, align 4, !dbg !326
  %cmp17 = icmp eq i32 %9, -1, !dbg !328
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !329

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !330
  %cmp19 = icmp eq i32 %10, 0, !dbg !331
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !332

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !333

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !335
  %idxprom = sext i32 %11 to i64, !dbg !336
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !336
  store i8 0, i8* %arrayidx, align 1, !dbg !337
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !338
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !339
  store i32 %call24, i32* %data, align 4, !dbg !340
  br label %do.end, !dbg !341

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !342
  %cmp25 = icmp ne i32 %12, -1, !dbg !344
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !345

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !346
  %call28 = call i32 @close(i32 %13), !dbg !348
  br label %if.end29, !dbg !349

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !350
  %cmp30 = icmp ne i32 %14, -1, !dbg !352
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !353

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !354
  %call33 = call i32 @close(i32 %15), !dbg !356
  br label %if.end34, !dbg !357

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !358

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !359
  %cmp36 = icmp ne i32 %16, 5, !dbg !361
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !362

if.then38:                                        ; preds = %if.end35
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !363
  br label %if.end52, !dbg !365

if.else:                                          ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !366, metadata !DIExpression()), !dbg !369
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !370, metadata !DIExpression()), !dbg !371
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !371
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !371
  %18 = load i32, i32* %data, align 4, !dbg !372
  %cmp39 = icmp sge i32 %18, 0, !dbg !374
  br i1 %cmp39, label %land.lhs.true, label %if.else50, !dbg !375

land.lhs.true:                                    ; preds = %if.else
  %19 = load i32, i32* %data, align 4, !dbg !376
  %cmp41 = icmp slt i32 %19, 10, !dbg !377
  br i1 %cmp41, label %if.then43, label %if.else50, !dbg !378

if.then43:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !379
  %idxprom44 = sext i32 %20 to i64, !dbg !381
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !381
  store i32 1, i32* %arrayidx45, align 4, !dbg !382
  store i32 0, i32* %i, align 4, !dbg !383
  br label %for.cond, !dbg !385

for.cond:                                         ; preds = %for.inc, %if.then43
  %21 = load i32, i32* %i, align 4, !dbg !386
  %cmp46 = icmp slt i32 %21, 10, !dbg !388
  br i1 %cmp46, label %for.body, label %for.end, !dbg !389

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !390
  %idxprom48 = sext i32 %22 to i64, !dbg !392
  %arrayidx49 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom48, !dbg !392
  %23 = load i32, i32* %arrayidx49, align 4, !dbg !392
  call void @printIntLine(i32 %23), !dbg !393
  br label %for.inc, !dbg !394

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !395
  %inc = add nsw i32 %24, 1, !dbg !395
  store i32 %inc, i32* %i, align 4, !dbg !395
  br label %for.cond, !dbg !396, !llvm.loop !397

for.end:                                          ; preds = %for.cond
  br label %if.end51, !dbg !399

if.else50:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !400
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %for.end
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then38
  ret void, !dbg !402
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !403 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !404, metadata !DIExpression()), !dbg !405
  store i32 -1, i32* %data, align 4, !dbg !406
  %0 = load i32, i32* @globalFive, align 4, !dbg !407
  %cmp = icmp eq i32 %0, 5, !dbg !409
  br i1 %cmp, label %if.then, label %if.end35, !dbg !410

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !411, metadata !DIExpression()), !dbg !414
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !415, metadata !DIExpression()), !dbg !416
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !417, metadata !DIExpression()), !dbg !418
  store i32 -1, i32* %listenSocket, align 4, !dbg !418
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !419, metadata !DIExpression()), !dbg !420
  store i32 -1, i32* %acceptSocket, align 4, !dbg !420
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !421, metadata !DIExpression()), !dbg !422
  br label %do.body, !dbg !423

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !424
  store i32 %call, i32* %listenSocket, align 4, !dbg !426
  %1 = load i32, i32* %listenSocket, align 4, !dbg !427
  %cmp1 = icmp eq i32 %1, -1, !dbg !429
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !430

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !431

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !433
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !433
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !434
  store i16 2, i16* %sin_family, align 4, !dbg !435
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !436
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !437
  store i32 0, i32* %s_addr, align 4, !dbg !438
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !439
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !440
  store i16 %call3, i16* %sin_port, align 2, !dbg !441
  %3 = load i32, i32* %listenSocket, align 4, !dbg !442
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !444
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !445
  %cmp5 = icmp eq i32 %call4, -1, !dbg !446
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !447

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !448

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !450
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !452
  %cmp9 = icmp eq i32 %call8, -1, !dbg !453
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !454

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !455

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !457
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !458
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !459
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !460
  %cmp13 = icmp eq i32 %7, -1, !dbg !462
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !463

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !464

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !466
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !467
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !468
  %conv = trunc i64 %call16 to i32, !dbg !468
  store i32 %conv, i32* %recvResult, align 4, !dbg !469
  %9 = load i32, i32* %recvResult, align 4, !dbg !470
  %cmp17 = icmp eq i32 %9, -1, !dbg !472
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !473

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !474
  %cmp19 = icmp eq i32 %10, 0, !dbg !475
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !476

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !477

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !479
  %idxprom = sext i32 %11 to i64, !dbg !480
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !480
  store i8 0, i8* %arrayidx, align 1, !dbg !481
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !482
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !483
  store i32 %call24, i32* %data, align 4, !dbg !484
  br label %do.end, !dbg !485

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !486
  %cmp25 = icmp ne i32 %12, -1, !dbg !488
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !489

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !490
  %call28 = call i32 @close(i32 %13), !dbg !492
  br label %if.end29, !dbg !493

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !494
  %cmp30 = icmp ne i32 %14, -1, !dbg !496
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !497

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !498
  %call33 = call i32 @close(i32 %15), !dbg !500
  br label %if.end34, !dbg !501

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !502

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !503
  %cmp36 = icmp eq i32 %16, 5, !dbg !505
  br i1 %cmp36, label %if.then38, label %if.end51, !dbg !506

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !507, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !511, metadata !DIExpression()), !dbg !512
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !512
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !512
  %18 = load i32, i32* %data, align 4, !dbg !513
  %cmp39 = icmp sge i32 %18, 0, !dbg !515
  br i1 %cmp39, label %land.lhs.true, label %if.else, !dbg !516

land.lhs.true:                                    ; preds = %if.then38
  %19 = load i32, i32* %data, align 4, !dbg !517
  %cmp41 = icmp slt i32 %19, 10, !dbg !518
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !519

if.then43:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !520
  %idxprom44 = sext i32 %20 to i64, !dbg !522
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !522
  store i32 1, i32* %arrayidx45, align 4, !dbg !523
  store i32 0, i32* %i, align 4, !dbg !524
  br label %for.cond, !dbg !526

for.cond:                                         ; preds = %for.inc, %if.then43
  %21 = load i32, i32* %i, align 4, !dbg !527
  %cmp46 = icmp slt i32 %21, 10, !dbg !529
  br i1 %cmp46, label %for.body, label %for.end, !dbg !530

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !531
  %idxprom48 = sext i32 %22 to i64, !dbg !533
  %arrayidx49 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom48, !dbg !533
  %23 = load i32, i32* %arrayidx49, align 4, !dbg !533
  call void @printIntLine(i32 %23), !dbg !534
  br label %for.inc, !dbg !535

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !536
  %inc = add nsw i32 %24, 1, !dbg !536
  store i32 %inc, i32* %i, align 4, !dbg !536
  br label %for.cond, !dbg !537, !llvm.loop !538

for.end:                                          ; preds = %for.cond
  br label %if.end50, !dbg !540

if.else:                                          ; preds = %land.lhs.true, %if.then38
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !541
  br label %if.end50

if.end50:                                         ; preds = %if.else, %for.end
  br label %if.end51, !dbg !543

if.end51:                                         ; preds = %if.end50, %if.end35
  ret void, !dbg !544
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !545 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !546, metadata !DIExpression()), !dbg !547
  store i32 -1, i32* %data, align 4, !dbg !548
  %0 = load i32, i32* @globalFive, align 4, !dbg !549
  %cmp = icmp ne i32 %0, 5, !dbg !551
  br i1 %cmp, label %if.then, label %if.else, !dbg !552

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !553
  br label %if.end, !dbg !555

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !556
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !558
  %cmp1 = icmp eq i32 %1, 5, !dbg !560
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !561

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !562, metadata !DIExpression()), !dbg !565
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !566, metadata !DIExpression()), !dbg !567
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !567
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !567
  %3 = load i32, i32* %data, align 4, !dbg !568
  %cmp3 = icmp sge i32 %3, 0, !dbg !570
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !571

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !572
  %idxprom = sext i32 %4 to i64, !dbg !574
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !574
  store i32 1, i32* %arrayidx, align 4, !dbg !575
  store i32 0, i32* %i, align 4, !dbg !576
  br label %for.cond, !dbg !578

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !579
  %cmp5 = icmp slt i32 %5, 10, !dbg !581
  br i1 %cmp5, label %for.body, label %for.end, !dbg !582

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !583
  %idxprom6 = sext i32 %6 to i64, !dbg !585
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !585
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !585
  call void @printIntLine(i32 %7), !dbg !586
  br label %for.inc, !dbg !587

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !588
  %inc = add nsw i32 %8, 1, !dbg !588
  store i32 %inc, i32* %i, align 4, !dbg !588
  br label %for.cond, !dbg !589, !llvm.loop !590

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !592

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !593
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !595

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !596
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !597 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !598, metadata !DIExpression()), !dbg !599
  store i32 -1, i32* %data, align 4, !dbg !600
  %0 = load i32, i32* @globalFive, align 4, !dbg !601
  %cmp = icmp eq i32 %0, 5, !dbg !603
  br i1 %cmp, label %if.then, label %if.end, !dbg !604

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !605
  br label %if.end, !dbg !607

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !608
  %cmp1 = icmp eq i32 %1, 5, !dbg !610
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !611

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !612, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !616, metadata !DIExpression()), !dbg !617
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !617
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !617
  %3 = load i32, i32* %data, align 4, !dbg !618
  %cmp3 = icmp sge i32 %3, 0, !dbg !620
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !621

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !622
  %idxprom = sext i32 %4 to i64, !dbg !624
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !624
  store i32 1, i32* %arrayidx, align 4, !dbg !625
  store i32 0, i32* %i, align 4, !dbg !626
  br label %for.cond, !dbg !628

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !629
  %cmp5 = icmp slt i32 %5, 10, !dbg !631
  br i1 %cmp5, label %for.body, label %for.end, !dbg !632

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !633
  %idxprom6 = sext i32 %6 to i64, !dbg !635
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !635
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !635
  call void @printIntLine(i32 %7), !dbg !636
  br label %for.inc, !dbg !637

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !638
  %inc = add nsw i32 %8, 1, !dbg !638
  store i32 %inc, i32* %i, align 4, !dbg !638
  br label %for.cond, !dbg !639, !llvm.loop !640

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !642

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !643
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !645

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !646
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocation(line: 49, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 49, column: 8)
!81 = !DILocation(line: 49, column: 18, scope: !80)
!82 = !DILocation(line: 49, column: 8, scope: !70)
!83 = !DILocalVariable(name: "recvResult", scope: !84, file: !71, line: 56, type: !76)
!84 = distinct !DILexicalBlock(scope: !85, file: !71, line: 51, column: 9)
!85 = distinct !DILexicalBlock(scope: !80, file: !71, line: 50, column: 5)
!86 = !DILocation(line: 56, column: 17, scope: !84)
!87 = !DILocalVariable(name: "service", scope: !84, file: !71, line: 57, type: !88)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !89)
!89 = !{!90, !91, !95, !99}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !88, file: !17, line: 240, baseType: !56, size: 16)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !88, file: !17, line: 241, baseType: !92, size: 16, offset: 16)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !88, file: !17, line: 242, baseType: !96, size: 32, offset: 32)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !97)
!97 = !{!98}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !96, file: !17, line: 33, baseType: !46, size: 32)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !88, file: !17, line: 245, baseType: !100, size: 64, offset: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 64, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 8)
!104 = !DILocation(line: 57, column: 32, scope: !84)
!105 = !DILocalVariable(name: "listenSocket", scope: !84, file: !71, line: 58, type: !76)
!106 = !DILocation(line: 58, column: 20, scope: !84)
!107 = !DILocalVariable(name: "acceptSocket", scope: !84, file: !71, line: 59, type: !76)
!108 = !DILocation(line: 59, column: 20, scope: !84)
!109 = !DILocalVariable(name: "inputBuffer", scope: !84, file: !71, line: 60, type: !60)
!110 = !DILocation(line: 60, column: 18, scope: !84)
!111 = !DILocation(line: 61, column: 13, scope: !84)
!112 = !DILocation(line: 71, column: 32, scope: !113)
!113 = distinct !DILexicalBlock(scope: !84, file: !71, line: 62, column: 13)
!114 = !DILocation(line: 71, column: 30, scope: !113)
!115 = !DILocation(line: 72, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !71, line: 72, column: 21)
!117 = !DILocation(line: 72, column: 34, scope: !116)
!118 = !DILocation(line: 72, column: 21, scope: !113)
!119 = !DILocation(line: 74, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !71, line: 73, column: 17)
!121 = !DILocation(line: 76, column: 17, scope: !113)
!122 = !DILocation(line: 77, column: 25, scope: !113)
!123 = !DILocation(line: 77, column: 36, scope: !113)
!124 = !DILocation(line: 78, column: 25, scope: !113)
!125 = !DILocation(line: 78, column: 34, scope: !113)
!126 = !DILocation(line: 78, column: 41, scope: !113)
!127 = !DILocation(line: 79, column: 36, scope: !113)
!128 = !DILocation(line: 79, column: 25, scope: !113)
!129 = !DILocation(line: 79, column: 34, scope: !113)
!130 = !DILocation(line: 80, column: 26, scope: !131)
!131 = distinct !DILexicalBlock(scope: !113, file: !71, line: 80, column: 21)
!132 = !DILocation(line: 80, column: 40, scope: !131)
!133 = !DILocation(line: 80, column: 21, scope: !131)
!134 = !DILocation(line: 80, column: 85, scope: !131)
!135 = !DILocation(line: 80, column: 21, scope: !113)
!136 = !DILocation(line: 82, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !71, line: 81, column: 17)
!138 = !DILocation(line: 84, column: 28, scope: !139)
!139 = distinct !DILexicalBlock(scope: !113, file: !71, line: 84, column: 21)
!140 = !DILocation(line: 84, column: 21, scope: !139)
!141 = !DILocation(line: 84, column: 58, scope: !139)
!142 = !DILocation(line: 84, column: 21, scope: !113)
!143 = !DILocation(line: 86, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !71, line: 85, column: 17)
!145 = !DILocation(line: 88, column: 39, scope: !113)
!146 = !DILocation(line: 88, column: 32, scope: !113)
!147 = !DILocation(line: 88, column: 30, scope: !113)
!148 = !DILocation(line: 89, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !113, file: !71, line: 89, column: 21)
!150 = !DILocation(line: 89, column: 34, scope: !149)
!151 = !DILocation(line: 89, column: 21, scope: !113)
!152 = !DILocation(line: 91, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !71, line: 90, column: 17)
!154 = !DILocation(line: 94, column: 35, scope: !113)
!155 = !DILocation(line: 94, column: 49, scope: !113)
!156 = !DILocation(line: 94, column: 30, scope: !113)
!157 = !DILocation(line: 94, column: 28, scope: !113)
!158 = !DILocation(line: 95, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !113, file: !71, line: 95, column: 21)
!160 = !DILocation(line: 95, column: 32, scope: !159)
!161 = !DILocation(line: 95, column: 48, scope: !159)
!162 = !DILocation(line: 95, column: 51, scope: !159)
!163 = !DILocation(line: 95, column: 62, scope: !159)
!164 = !DILocation(line: 95, column: 21, scope: !113)
!165 = !DILocation(line: 97, column: 21, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !71, line: 96, column: 17)
!167 = !DILocation(line: 100, column: 29, scope: !113)
!168 = !DILocation(line: 100, column: 17, scope: !113)
!169 = !DILocation(line: 100, column: 41, scope: !113)
!170 = !DILocation(line: 102, column: 29, scope: !113)
!171 = !DILocation(line: 102, column: 24, scope: !113)
!172 = !DILocation(line: 102, column: 22, scope: !113)
!173 = !DILocation(line: 103, column: 13, scope: !113)
!174 = !DILocation(line: 105, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !84, file: !71, line: 105, column: 17)
!176 = !DILocation(line: 105, column: 30, scope: !175)
!177 = !DILocation(line: 105, column: 17, scope: !84)
!178 = !DILocation(line: 107, column: 30, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !71, line: 106, column: 13)
!180 = !DILocation(line: 107, column: 17, scope: !179)
!181 = !DILocation(line: 108, column: 13, scope: !179)
!182 = !DILocation(line: 109, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !84, file: !71, line: 109, column: 17)
!184 = !DILocation(line: 109, column: 30, scope: !183)
!185 = !DILocation(line: 109, column: 17, scope: !84)
!186 = !DILocation(line: 111, column: 30, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !71, line: 110, column: 13)
!188 = !DILocation(line: 111, column: 17, scope: !187)
!189 = !DILocation(line: 112, column: 13, scope: !187)
!190 = !DILocation(line: 120, column: 5, scope: !85)
!191 = !DILocation(line: 121, column: 8, scope: !192)
!192 = distinct !DILexicalBlock(scope: !70, file: !71, line: 121, column: 8)
!193 = !DILocation(line: 121, column: 18, scope: !192)
!194 = !DILocation(line: 121, column: 8, scope: !70)
!195 = !DILocalVariable(name: "i", scope: !196, file: !71, line: 124, type: !76)
!196 = distinct !DILexicalBlock(scope: !197, file: !71, line: 123, column: 9)
!197 = distinct !DILexicalBlock(scope: !192, file: !71, line: 122, column: 5)
!198 = !DILocation(line: 124, column: 17, scope: !196)
!199 = !DILocalVariable(name: "buffer", scope: !196, file: !71, line: 125, type: !200)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !201)
!201 = !{!202}
!202 = !DISubrange(count: 10)
!203 = !DILocation(line: 125, column: 17, scope: !196)
!204 = !DILocation(line: 128, column: 17, scope: !205)
!205 = distinct !DILexicalBlock(scope: !196, file: !71, line: 128, column: 17)
!206 = !DILocation(line: 128, column: 22, scope: !205)
!207 = !DILocation(line: 128, column: 17, scope: !196)
!208 = !DILocation(line: 130, column: 24, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !71, line: 129, column: 13)
!210 = !DILocation(line: 130, column: 17, scope: !209)
!211 = !DILocation(line: 130, column: 30, scope: !209)
!212 = !DILocation(line: 132, column: 23, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !71, line: 132, column: 17)
!214 = !DILocation(line: 132, column: 21, scope: !213)
!215 = !DILocation(line: 132, column: 28, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !71, line: 132, column: 17)
!217 = !DILocation(line: 132, column: 30, scope: !216)
!218 = !DILocation(line: 132, column: 17, scope: !213)
!219 = !DILocation(line: 134, column: 41, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !71, line: 133, column: 17)
!221 = !DILocation(line: 134, column: 34, scope: !220)
!222 = !DILocation(line: 134, column: 21, scope: !220)
!223 = !DILocation(line: 135, column: 17, scope: !220)
!224 = !DILocation(line: 132, column: 37, scope: !216)
!225 = !DILocation(line: 132, column: 17, scope: !216)
!226 = distinct !{!226, !218, !227, !228}
!227 = !DILocation(line: 135, column: 17, scope: !213)
!228 = !{!"llvm.loop.mustprogress"}
!229 = !DILocation(line: 136, column: 13, scope: !209)
!230 = !DILocation(line: 139, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !205, file: !71, line: 138, column: 13)
!232 = !DILocation(line: 142, column: 5, scope: !197)
!233 = !DILocation(line: 143, column: 1, scope: !70)
!234 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_good", scope: !71, file: !71, line: 433, type: !72, scopeLine: 434, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!235 = !DILocation(line: 435, column: 5, scope: !234)
!236 = !DILocation(line: 436, column: 5, scope: !234)
!237 = !DILocation(line: 437, column: 5, scope: !234)
!238 = !DILocation(line: 438, column: 5, scope: !234)
!239 = !DILocation(line: 439, column: 1, scope: !234)
!240 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 450, type: !241, scopeLine: 451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!241 = !DISubroutineType(types: !242)
!242 = !{!76, !76, !243}
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !244, size: 64)
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!245 = !DILocalVariable(name: "argc", arg: 1, scope: !240, file: !71, line: 450, type: !76)
!246 = !DILocation(line: 450, column: 14, scope: !240)
!247 = !DILocalVariable(name: "argv", arg: 2, scope: !240, file: !71, line: 450, type: !243)
!248 = !DILocation(line: 450, column: 27, scope: !240)
!249 = !DILocation(line: 453, column: 22, scope: !240)
!250 = !DILocation(line: 453, column: 12, scope: !240)
!251 = !DILocation(line: 453, column: 5, scope: !240)
!252 = !DILocation(line: 455, column: 5, scope: !240)
!253 = !DILocation(line: 456, column: 5, scope: !240)
!254 = !DILocation(line: 457, column: 5, scope: !240)
!255 = !DILocation(line: 460, column: 5, scope: !240)
!256 = !DILocation(line: 461, column: 5, scope: !240)
!257 = !DILocation(line: 462, column: 5, scope: !240)
!258 = !DILocation(line: 464, column: 5, scope: !240)
!259 = distinct !DISubprogram(name: "goodB2G1", scope: !71, file: !71, line: 150, type: !72, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!260 = !DILocalVariable(name: "data", scope: !259, file: !71, line: 152, type: !76)
!261 = !DILocation(line: 152, column: 9, scope: !259)
!262 = !DILocation(line: 154, column: 10, scope: !259)
!263 = !DILocation(line: 155, column: 8, scope: !264)
!264 = distinct !DILexicalBlock(scope: !259, file: !71, line: 155, column: 8)
!265 = !DILocation(line: 155, column: 18, scope: !264)
!266 = !DILocation(line: 155, column: 8, scope: !259)
!267 = !DILocalVariable(name: "recvResult", scope: !268, file: !71, line: 162, type: !76)
!268 = distinct !DILexicalBlock(scope: !269, file: !71, line: 157, column: 9)
!269 = distinct !DILexicalBlock(scope: !264, file: !71, line: 156, column: 5)
!270 = !DILocation(line: 162, column: 17, scope: !268)
!271 = !DILocalVariable(name: "service", scope: !268, file: !71, line: 163, type: !88)
!272 = !DILocation(line: 163, column: 32, scope: !268)
!273 = !DILocalVariable(name: "listenSocket", scope: !268, file: !71, line: 164, type: !76)
!274 = !DILocation(line: 164, column: 20, scope: !268)
!275 = !DILocalVariable(name: "acceptSocket", scope: !268, file: !71, line: 165, type: !76)
!276 = !DILocation(line: 165, column: 20, scope: !268)
!277 = !DILocalVariable(name: "inputBuffer", scope: !268, file: !71, line: 166, type: !60)
!278 = !DILocation(line: 166, column: 18, scope: !268)
!279 = !DILocation(line: 167, column: 13, scope: !268)
!280 = !DILocation(line: 177, column: 32, scope: !281)
!281 = distinct !DILexicalBlock(scope: !268, file: !71, line: 168, column: 13)
!282 = !DILocation(line: 177, column: 30, scope: !281)
!283 = !DILocation(line: 178, column: 21, scope: !284)
!284 = distinct !DILexicalBlock(scope: !281, file: !71, line: 178, column: 21)
!285 = !DILocation(line: 178, column: 34, scope: !284)
!286 = !DILocation(line: 178, column: 21, scope: !281)
!287 = !DILocation(line: 180, column: 21, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !71, line: 179, column: 17)
!289 = !DILocation(line: 182, column: 17, scope: !281)
!290 = !DILocation(line: 183, column: 25, scope: !281)
!291 = !DILocation(line: 183, column: 36, scope: !281)
!292 = !DILocation(line: 184, column: 25, scope: !281)
!293 = !DILocation(line: 184, column: 34, scope: !281)
!294 = !DILocation(line: 184, column: 41, scope: !281)
!295 = !DILocation(line: 185, column: 36, scope: !281)
!296 = !DILocation(line: 185, column: 25, scope: !281)
!297 = !DILocation(line: 185, column: 34, scope: !281)
!298 = !DILocation(line: 186, column: 26, scope: !299)
!299 = distinct !DILexicalBlock(scope: !281, file: !71, line: 186, column: 21)
!300 = !DILocation(line: 186, column: 40, scope: !299)
!301 = !DILocation(line: 186, column: 21, scope: !299)
!302 = !DILocation(line: 186, column: 85, scope: !299)
!303 = !DILocation(line: 186, column: 21, scope: !281)
!304 = !DILocation(line: 188, column: 21, scope: !305)
!305 = distinct !DILexicalBlock(scope: !299, file: !71, line: 187, column: 17)
!306 = !DILocation(line: 190, column: 28, scope: !307)
!307 = distinct !DILexicalBlock(scope: !281, file: !71, line: 190, column: 21)
!308 = !DILocation(line: 190, column: 21, scope: !307)
!309 = !DILocation(line: 190, column: 58, scope: !307)
!310 = !DILocation(line: 190, column: 21, scope: !281)
!311 = !DILocation(line: 192, column: 21, scope: !312)
!312 = distinct !DILexicalBlock(scope: !307, file: !71, line: 191, column: 17)
!313 = !DILocation(line: 194, column: 39, scope: !281)
!314 = !DILocation(line: 194, column: 32, scope: !281)
!315 = !DILocation(line: 194, column: 30, scope: !281)
!316 = !DILocation(line: 195, column: 21, scope: !317)
!317 = distinct !DILexicalBlock(scope: !281, file: !71, line: 195, column: 21)
!318 = !DILocation(line: 195, column: 34, scope: !317)
!319 = !DILocation(line: 195, column: 21, scope: !281)
!320 = !DILocation(line: 197, column: 21, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !71, line: 196, column: 17)
!322 = !DILocation(line: 200, column: 35, scope: !281)
!323 = !DILocation(line: 200, column: 49, scope: !281)
!324 = !DILocation(line: 200, column: 30, scope: !281)
!325 = !DILocation(line: 200, column: 28, scope: !281)
!326 = !DILocation(line: 201, column: 21, scope: !327)
!327 = distinct !DILexicalBlock(scope: !281, file: !71, line: 201, column: 21)
!328 = !DILocation(line: 201, column: 32, scope: !327)
!329 = !DILocation(line: 201, column: 48, scope: !327)
!330 = !DILocation(line: 201, column: 51, scope: !327)
!331 = !DILocation(line: 201, column: 62, scope: !327)
!332 = !DILocation(line: 201, column: 21, scope: !281)
!333 = !DILocation(line: 203, column: 21, scope: !334)
!334 = distinct !DILexicalBlock(scope: !327, file: !71, line: 202, column: 17)
!335 = !DILocation(line: 206, column: 29, scope: !281)
!336 = !DILocation(line: 206, column: 17, scope: !281)
!337 = !DILocation(line: 206, column: 41, scope: !281)
!338 = !DILocation(line: 208, column: 29, scope: !281)
!339 = !DILocation(line: 208, column: 24, scope: !281)
!340 = !DILocation(line: 208, column: 22, scope: !281)
!341 = !DILocation(line: 209, column: 13, scope: !281)
!342 = !DILocation(line: 211, column: 17, scope: !343)
!343 = distinct !DILexicalBlock(scope: !268, file: !71, line: 211, column: 17)
!344 = !DILocation(line: 211, column: 30, scope: !343)
!345 = !DILocation(line: 211, column: 17, scope: !268)
!346 = !DILocation(line: 213, column: 30, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !71, line: 212, column: 13)
!348 = !DILocation(line: 213, column: 17, scope: !347)
!349 = !DILocation(line: 214, column: 13, scope: !347)
!350 = !DILocation(line: 215, column: 17, scope: !351)
!351 = distinct !DILexicalBlock(scope: !268, file: !71, line: 215, column: 17)
!352 = !DILocation(line: 215, column: 30, scope: !351)
!353 = !DILocation(line: 215, column: 17, scope: !268)
!354 = !DILocation(line: 217, column: 30, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !71, line: 216, column: 13)
!356 = !DILocation(line: 217, column: 17, scope: !355)
!357 = !DILocation(line: 218, column: 13, scope: !355)
!358 = !DILocation(line: 226, column: 5, scope: !269)
!359 = !DILocation(line: 227, column: 8, scope: !360)
!360 = distinct !DILexicalBlock(scope: !259, file: !71, line: 227, column: 8)
!361 = !DILocation(line: 227, column: 18, scope: !360)
!362 = !DILocation(line: 227, column: 8, scope: !259)
!363 = !DILocation(line: 230, column: 9, scope: !364)
!364 = distinct !DILexicalBlock(scope: !360, file: !71, line: 228, column: 5)
!365 = !DILocation(line: 231, column: 5, scope: !364)
!366 = !DILocalVariable(name: "i", scope: !367, file: !71, line: 235, type: !76)
!367 = distinct !DILexicalBlock(scope: !368, file: !71, line: 234, column: 9)
!368 = distinct !DILexicalBlock(scope: !360, file: !71, line: 233, column: 5)
!369 = !DILocation(line: 235, column: 17, scope: !367)
!370 = !DILocalVariable(name: "buffer", scope: !367, file: !71, line: 236, type: !200)
!371 = !DILocation(line: 236, column: 17, scope: !367)
!372 = !DILocation(line: 238, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !367, file: !71, line: 238, column: 17)
!374 = !DILocation(line: 238, column: 22, scope: !373)
!375 = !DILocation(line: 238, column: 27, scope: !373)
!376 = !DILocation(line: 238, column: 30, scope: !373)
!377 = !DILocation(line: 238, column: 35, scope: !373)
!378 = !DILocation(line: 238, column: 17, scope: !367)
!379 = !DILocation(line: 240, column: 24, scope: !380)
!380 = distinct !DILexicalBlock(scope: !373, file: !71, line: 239, column: 13)
!381 = !DILocation(line: 240, column: 17, scope: !380)
!382 = !DILocation(line: 240, column: 30, scope: !380)
!383 = !DILocation(line: 242, column: 23, scope: !384)
!384 = distinct !DILexicalBlock(scope: !380, file: !71, line: 242, column: 17)
!385 = !DILocation(line: 242, column: 21, scope: !384)
!386 = !DILocation(line: 242, column: 28, scope: !387)
!387 = distinct !DILexicalBlock(scope: !384, file: !71, line: 242, column: 17)
!388 = !DILocation(line: 242, column: 30, scope: !387)
!389 = !DILocation(line: 242, column: 17, scope: !384)
!390 = !DILocation(line: 244, column: 41, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !71, line: 243, column: 17)
!392 = !DILocation(line: 244, column: 34, scope: !391)
!393 = !DILocation(line: 244, column: 21, scope: !391)
!394 = !DILocation(line: 245, column: 17, scope: !391)
!395 = !DILocation(line: 242, column: 37, scope: !387)
!396 = !DILocation(line: 242, column: 17, scope: !387)
!397 = distinct !{!397, !389, !398, !228}
!398 = !DILocation(line: 245, column: 17, scope: !384)
!399 = !DILocation(line: 246, column: 13, scope: !380)
!400 = !DILocation(line: 249, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !373, file: !71, line: 248, column: 13)
!402 = !DILocation(line: 253, column: 1, scope: !259)
!403 = distinct !DISubprogram(name: "goodB2G2", scope: !71, file: !71, line: 256, type: !72, scopeLine: 257, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!404 = !DILocalVariable(name: "data", scope: !403, file: !71, line: 258, type: !76)
!405 = !DILocation(line: 258, column: 9, scope: !403)
!406 = !DILocation(line: 260, column: 10, scope: !403)
!407 = !DILocation(line: 261, column: 8, scope: !408)
!408 = distinct !DILexicalBlock(scope: !403, file: !71, line: 261, column: 8)
!409 = !DILocation(line: 261, column: 18, scope: !408)
!410 = !DILocation(line: 261, column: 8, scope: !403)
!411 = !DILocalVariable(name: "recvResult", scope: !412, file: !71, line: 268, type: !76)
!412 = distinct !DILexicalBlock(scope: !413, file: !71, line: 263, column: 9)
!413 = distinct !DILexicalBlock(scope: !408, file: !71, line: 262, column: 5)
!414 = !DILocation(line: 268, column: 17, scope: !412)
!415 = !DILocalVariable(name: "service", scope: !412, file: !71, line: 269, type: !88)
!416 = !DILocation(line: 269, column: 32, scope: !412)
!417 = !DILocalVariable(name: "listenSocket", scope: !412, file: !71, line: 270, type: !76)
!418 = !DILocation(line: 270, column: 20, scope: !412)
!419 = !DILocalVariable(name: "acceptSocket", scope: !412, file: !71, line: 271, type: !76)
!420 = !DILocation(line: 271, column: 20, scope: !412)
!421 = !DILocalVariable(name: "inputBuffer", scope: !412, file: !71, line: 272, type: !60)
!422 = !DILocation(line: 272, column: 18, scope: !412)
!423 = !DILocation(line: 273, column: 13, scope: !412)
!424 = !DILocation(line: 283, column: 32, scope: !425)
!425 = distinct !DILexicalBlock(scope: !412, file: !71, line: 274, column: 13)
!426 = !DILocation(line: 283, column: 30, scope: !425)
!427 = !DILocation(line: 284, column: 21, scope: !428)
!428 = distinct !DILexicalBlock(scope: !425, file: !71, line: 284, column: 21)
!429 = !DILocation(line: 284, column: 34, scope: !428)
!430 = !DILocation(line: 284, column: 21, scope: !425)
!431 = !DILocation(line: 286, column: 21, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !71, line: 285, column: 17)
!433 = !DILocation(line: 288, column: 17, scope: !425)
!434 = !DILocation(line: 289, column: 25, scope: !425)
!435 = !DILocation(line: 289, column: 36, scope: !425)
!436 = !DILocation(line: 290, column: 25, scope: !425)
!437 = !DILocation(line: 290, column: 34, scope: !425)
!438 = !DILocation(line: 290, column: 41, scope: !425)
!439 = !DILocation(line: 291, column: 36, scope: !425)
!440 = !DILocation(line: 291, column: 25, scope: !425)
!441 = !DILocation(line: 291, column: 34, scope: !425)
!442 = !DILocation(line: 292, column: 26, scope: !443)
!443 = distinct !DILexicalBlock(scope: !425, file: !71, line: 292, column: 21)
!444 = !DILocation(line: 292, column: 40, scope: !443)
!445 = !DILocation(line: 292, column: 21, scope: !443)
!446 = !DILocation(line: 292, column: 85, scope: !443)
!447 = !DILocation(line: 292, column: 21, scope: !425)
!448 = !DILocation(line: 294, column: 21, scope: !449)
!449 = distinct !DILexicalBlock(scope: !443, file: !71, line: 293, column: 17)
!450 = !DILocation(line: 296, column: 28, scope: !451)
!451 = distinct !DILexicalBlock(scope: !425, file: !71, line: 296, column: 21)
!452 = !DILocation(line: 296, column: 21, scope: !451)
!453 = !DILocation(line: 296, column: 58, scope: !451)
!454 = !DILocation(line: 296, column: 21, scope: !425)
!455 = !DILocation(line: 298, column: 21, scope: !456)
!456 = distinct !DILexicalBlock(scope: !451, file: !71, line: 297, column: 17)
!457 = !DILocation(line: 300, column: 39, scope: !425)
!458 = !DILocation(line: 300, column: 32, scope: !425)
!459 = !DILocation(line: 300, column: 30, scope: !425)
!460 = !DILocation(line: 301, column: 21, scope: !461)
!461 = distinct !DILexicalBlock(scope: !425, file: !71, line: 301, column: 21)
!462 = !DILocation(line: 301, column: 34, scope: !461)
!463 = !DILocation(line: 301, column: 21, scope: !425)
!464 = !DILocation(line: 303, column: 21, scope: !465)
!465 = distinct !DILexicalBlock(scope: !461, file: !71, line: 302, column: 17)
!466 = !DILocation(line: 306, column: 35, scope: !425)
!467 = !DILocation(line: 306, column: 49, scope: !425)
!468 = !DILocation(line: 306, column: 30, scope: !425)
!469 = !DILocation(line: 306, column: 28, scope: !425)
!470 = !DILocation(line: 307, column: 21, scope: !471)
!471 = distinct !DILexicalBlock(scope: !425, file: !71, line: 307, column: 21)
!472 = !DILocation(line: 307, column: 32, scope: !471)
!473 = !DILocation(line: 307, column: 48, scope: !471)
!474 = !DILocation(line: 307, column: 51, scope: !471)
!475 = !DILocation(line: 307, column: 62, scope: !471)
!476 = !DILocation(line: 307, column: 21, scope: !425)
!477 = !DILocation(line: 309, column: 21, scope: !478)
!478 = distinct !DILexicalBlock(scope: !471, file: !71, line: 308, column: 17)
!479 = !DILocation(line: 312, column: 29, scope: !425)
!480 = !DILocation(line: 312, column: 17, scope: !425)
!481 = !DILocation(line: 312, column: 41, scope: !425)
!482 = !DILocation(line: 314, column: 29, scope: !425)
!483 = !DILocation(line: 314, column: 24, scope: !425)
!484 = !DILocation(line: 314, column: 22, scope: !425)
!485 = !DILocation(line: 315, column: 13, scope: !425)
!486 = !DILocation(line: 317, column: 17, scope: !487)
!487 = distinct !DILexicalBlock(scope: !412, file: !71, line: 317, column: 17)
!488 = !DILocation(line: 317, column: 30, scope: !487)
!489 = !DILocation(line: 317, column: 17, scope: !412)
!490 = !DILocation(line: 319, column: 30, scope: !491)
!491 = distinct !DILexicalBlock(scope: !487, file: !71, line: 318, column: 13)
!492 = !DILocation(line: 319, column: 17, scope: !491)
!493 = !DILocation(line: 320, column: 13, scope: !491)
!494 = !DILocation(line: 321, column: 17, scope: !495)
!495 = distinct !DILexicalBlock(scope: !412, file: !71, line: 321, column: 17)
!496 = !DILocation(line: 321, column: 30, scope: !495)
!497 = !DILocation(line: 321, column: 17, scope: !412)
!498 = !DILocation(line: 323, column: 30, scope: !499)
!499 = distinct !DILexicalBlock(scope: !495, file: !71, line: 322, column: 13)
!500 = !DILocation(line: 323, column: 17, scope: !499)
!501 = !DILocation(line: 324, column: 13, scope: !499)
!502 = !DILocation(line: 332, column: 5, scope: !413)
!503 = !DILocation(line: 333, column: 8, scope: !504)
!504 = distinct !DILexicalBlock(scope: !403, file: !71, line: 333, column: 8)
!505 = !DILocation(line: 333, column: 18, scope: !504)
!506 = !DILocation(line: 333, column: 8, scope: !403)
!507 = !DILocalVariable(name: "i", scope: !508, file: !71, line: 336, type: !76)
!508 = distinct !DILexicalBlock(scope: !509, file: !71, line: 335, column: 9)
!509 = distinct !DILexicalBlock(scope: !504, file: !71, line: 334, column: 5)
!510 = !DILocation(line: 336, column: 17, scope: !508)
!511 = !DILocalVariable(name: "buffer", scope: !508, file: !71, line: 337, type: !200)
!512 = !DILocation(line: 337, column: 17, scope: !508)
!513 = !DILocation(line: 339, column: 17, scope: !514)
!514 = distinct !DILexicalBlock(scope: !508, file: !71, line: 339, column: 17)
!515 = !DILocation(line: 339, column: 22, scope: !514)
!516 = !DILocation(line: 339, column: 27, scope: !514)
!517 = !DILocation(line: 339, column: 30, scope: !514)
!518 = !DILocation(line: 339, column: 35, scope: !514)
!519 = !DILocation(line: 339, column: 17, scope: !508)
!520 = !DILocation(line: 341, column: 24, scope: !521)
!521 = distinct !DILexicalBlock(scope: !514, file: !71, line: 340, column: 13)
!522 = !DILocation(line: 341, column: 17, scope: !521)
!523 = !DILocation(line: 341, column: 30, scope: !521)
!524 = !DILocation(line: 343, column: 23, scope: !525)
!525 = distinct !DILexicalBlock(scope: !521, file: !71, line: 343, column: 17)
!526 = !DILocation(line: 343, column: 21, scope: !525)
!527 = !DILocation(line: 343, column: 28, scope: !528)
!528 = distinct !DILexicalBlock(scope: !525, file: !71, line: 343, column: 17)
!529 = !DILocation(line: 343, column: 30, scope: !528)
!530 = !DILocation(line: 343, column: 17, scope: !525)
!531 = !DILocation(line: 345, column: 41, scope: !532)
!532 = distinct !DILexicalBlock(scope: !528, file: !71, line: 344, column: 17)
!533 = !DILocation(line: 345, column: 34, scope: !532)
!534 = !DILocation(line: 345, column: 21, scope: !532)
!535 = !DILocation(line: 346, column: 17, scope: !532)
!536 = !DILocation(line: 343, column: 37, scope: !528)
!537 = !DILocation(line: 343, column: 17, scope: !528)
!538 = distinct !{!538, !530, !539, !228}
!539 = !DILocation(line: 346, column: 17, scope: !525)
!540 = !DILocation(line: 347, column: 13, scope: !521)
!541 = !DILocation(line: 350, column: 17, scope: !542)
!542 = distinct !DILexicalBlock(scope: !514, file: !71, line: 349, column: 13)
!543 = !DILocation(line: 353, column: 5, scope: !509)
!544 = !DILocation(line: 354, column: 1, scope: !403)
!545 = distinct !DISubprogram(name: "goodG2B1", scope: !71, file: !71, line: 357, type: !72, scopeLine: 358, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!546 = !DILocalVariable(name: "data", scope: !545, file: !71, line: 359, type: !76)
!547 = !DILocation(line: 359, column: 9, scope: !545)
!548 = !DILocation(line: 361, column: 10, scope: !545)
!549 = !DILocation(line: 362, column: 8, scope: !550)
!550 = distinct !DILexicalBlock(scope: !545, file: !71, line: 362, column: 8)
!551 = !DILocation(line: 362, column: 18, scope: !550)
!552 = !DILocation(line: 362, column: 8, scope: !545)
!553 = !DILocation(line: 365, column: 9, scope: !554)
!554 = distinct !DILexicalBlock(scope: !550, file: !71, line: 363, column: 5)
!555 = !DILocation(line: 366, column: 5, scope: !554)
!556 = !DILocation(line: 371, column: 14, scope: !557)
!557 = distinct !DILexicalBlock(scope: !550, file: !71, line: 368, column: 5)
!558 = !DILocation(line: 373, column: 8, scope: !559)
!559 = distinct !DILexicalBlock(scope: !545, file: !71, line: 373, column: 8)
!560 = !DILocation(line: 373, column: 18, scope: !559)
!561 = !DILocation(line: 373, column: 8, scope: !545)
!562 = !DILocalVariable(name: "i", scope: !563, file: !71, line: 376, type: !76)
!563 = distinct !DILexicalBlock(scope: !564, file: !71, line: 375, column: 9)
!564 = distinct !DILexicalBlock(scope: !559, file: !71, line: 374, column: 5)
!565 = !DILocation(line: 376, column: 17, scope: !563)
!566 = !DILocalVariable(name: "buffer", scope: !563, file: !71, line: 377, type: !200)
!567 = !DILocation(line: 377, column: 17, scope: !563)
!568 = !DILocation(line: 380, column: 17, scope: !569)
!569 = distinct !DILexicalBlock(scope: !563, file: !71, line: 380, column: 17)
!570 = !DILocation(line: 380, column: 22, scope: !569)
!571 = !DILocation(line: 380, column: 17, scope: !563)
!572 = !DILocation(line: 382, column: 24, scope: !573)
!573 = distinct !DILexicalBlock(scope: !569, file: !71, line: 381, column: 13)
!574 = !DILocation(line: 382, column: 17, scope: !573)
!575 = !DILocation(line: 382, column: 30, scope: !573)
!576 = !DILocation(line: 384, column: 23, scope: !577)
!577 = distinct !DILexicalBlock(scope: !573, file: !71, line: 384, column: 17)
!578 = !DILocation(line: 384, column: 21, scope: !577)
!579 = !DILocation(line: 384, column: 28, scope: !580)
!580 = distinct !DILexicalBlock(scope: !577, file: !71, line: 384, column: 17)
!581 = !DILocation(line: 384, column: 30, scope: !580)
!582 = !DILocation(line: 384, column: 17, scope: !577)
!583 = !DILocation(line: 386, column: 41, scope: !584)
!584 = distinct !DILexicalBlock(scope: !580, file: !71, line: 385, column: 17)
!585 = !DILocation(line: 386, column: 34, scope: !584)
!586 = !DILocation(line: 386, column: 21, scope: !584)
!587 = !DILocation(line: 387, column: 17, scope: !584)
!588 = !DILocation(line: 384, column: 37, scope: !580)
!589 = !DILocation(line: 384, column: 17, scope: !580)
!590 = distinct !{!590, !582, !591, !228}
!591 = !DILocation(line: 387, column: 17, scope: !577)
!592 = !DILocation(line: 388, column: 13, scope: !573)
!593 = !DILocation(line: 391, column: 17, scope: !594)
!594 = distinct !DILexicalBlock(scope: !569, file: !71, line: 390, column: 13)
!595 = !DILocation(line: 394, column: 5, scope: !564)
!596 = !DILocation(line: 395, column: 1, scope: !545)
!597 = distinct !DISubprogram(name: "goodG2B2", scope: !71, file: !71, line: 398, type: !72, scopeLine: 399, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!598 = !DILocalVariable(name: "data", scope: !597, file: !71, line: 400, type: !76)
!599 = !DILocation(line: 400, column: 9, scope: !597)
!600 = !DILocation(line: 402, column: 10, scope: !597)
!601 = !DILocation(line: 403, column: 8, scope: !602)
!602 = distinct !DILexicalBlock(scope: !597, file: !71, line: 403, column: 8)
!603 = !DILocation(line: 403, column: 18, scope: !602)
!604 = !DILocation(line: 403, column: 8, scope: !597)
!605 = !DILocation(line: 407, column: 14, scope: !606)
!606 = distinct !DILexicalBlock(scope: !602, file: !71, line: 404, column: 5)
!607 = !DILocation(line: 408, column: 5, scope: !606)
!608 = !DILocation(line: 409, column: 8, scope: !609)
!609 = distinct !DILexicalBlock(scope: !597, file: !71, line: 409, column: 8)
!610 = !DILocation(line: 409, column: 18, scope: !609)
!611 = !DILocation(line: 409, column: 8, scope: !597)
!612 = !DILocalVariable(name: "i", scope: !613, file: !71, line: 412, type: !76)
!613 = distinct !DILexicalBlock(scope: !614, file: !71, line: 411, column: 9)
!614 = distinct !DILexicalBlock(scope: !609, file: !71, line: 410, column: 5)
!615 = !DILocation(line: 412, column: 17, scope: !613)
!616 = !DILocalVariable(name: "buffer", scope: !613, file: !71, line: 413, type: !200)
!617 = !DILocation(line: 413, column: 17, scope: !613)
!618 = !DILocation(line: 416, column: 17, scope: !619)
!619 = distinct !DILexicalBlock(scope: !613, file: !71, line: 416, column: 17)
!620 = !DILocation(line: 416, column: 22, scope: !619)
!621 = !DILocation(line: 416, column: 17, scope: !613)
!622 = !DILocation(line: 418, column: 24, scope: !623)
!623 = distinct !DILexicalBlock(scope: !619, file: !71, line: 417, column: 13)
!624 = !DILocation(line: 418, column: 17, scope: !623)
!625 = !DILocation(line: 418, column: 30, scope: !623)
!626 = !DILocation(line: 420, column: 23, scope: !627)
!627 = distinct !DILexicalBlock(scope: !623, file: !71, line: 420, column: 17)
!628 = !DILocation(line: 420, column: 21, scope: !627)
!629 = !DILocation(line: 420, column: 28, scope: !630)
!630 = distinct !DILexicalBlock(scope: !627, file: !71, line: 420, column: 17)
!631 = !DILocation(line: 420, column: 30, scope: !630)
!632 = !DILocation(line: 420, column: 17, scope: !627)
!633 = !DILocation(line: 422, column: 41, scope: !634)
!634 = distinct !DILexicalBlock(scope: !630, file: !71, line: 421, column: 17)
!635 = !DILocation(line: 422, column: 34, scope: !634)
!636 = !DILocation(line: 422, column: 21, scope: !634)
!637 = !DILocation(line: 423, column: 17, scope: !634)
!638 = !DILocation(line: 420, column: 37, scope: !630)
!639 = !DILocation(line: 420, column: 17, scope: !630)
!640 = distinct !{!640, !632, !641, !228}
!641 = !DILocation(line: 423, column: 17, scope: !627)
!642 = !DILocation(line: 424, column: 13, scope: !623)
!643 = !DILocation(line: 427, column: 17, scope: !644)
!644 = distinct !DILexicalBlock(scope: !619, file: !71, line: 426, column: 13)
!645 = !DILocation(line: 430, column: 5, scope: !614)
!646 = !DILocation(line: 431, column: 1, scope: !597)
