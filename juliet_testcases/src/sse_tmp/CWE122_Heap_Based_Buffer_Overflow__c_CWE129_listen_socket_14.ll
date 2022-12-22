; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_14.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_14_bad() #0 !dbg !73 {
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !81
  %cmp = icmp eq i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.end35, !dbg !84

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !85, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !89, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %listenSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %acceptSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  br label %do.body, !dbg !113

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !114
  store i32 %call, i32* %listenSocket, align 4, !dbg !116
  %1 = load i32, i32* %listenSocket, align 4, !dbg !117
  %cmp1 = icmp eq i32 %1, -1, !dbg !119
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !120

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !121

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !123
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !124
  store i16 2, i16* %sin_family, align 4, !dbg !125
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !126
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !127
  store i32 0, i32* %s_addr, align 4, !dbg !128
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !129
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !130
  store i16 %call3, i16* %sin_port, align 2, !dbg !131
  %3 = load i32, i32* %listenSocket, align 4, !dbg !132
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !134
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !135
  %cmp5 = icmp eq i32 %call4, -1, !dbg !136
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !137

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !138

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call8 = call i32 @listen(i32 %5, i32 5) #8, !dbg !142
  %cmp9 = icmp eq i32 %call8, -1, !dbg !143
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !144

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !145

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !147
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !148
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !149
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !150
  %cmp13 = icmp eq i32 %7, -1, !dbg !152
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !153

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !154

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !156
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !157
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !158
  %conv = trunc i64 %call16 to i32, !dbg !158
  store i32 %conv, i32* %recvResult, align 4, !dbg !159
  %9 = load i32, i32* %recvResult, align 4, !dbg !160
  %cmp17 = icmp eq i32 %9, -1, !dbg !162
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !163

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !164
  %cmp19 = icmp eq i32 %10, 0, !dbg !165
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !166

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !167

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !169
  %idxprom = sext i32 %11 to i64, !dbg !170
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !172
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !173
  store i32 %call24, i32* %data, align 4, !dbg !174
  br label %do.end, !dbg !175

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !176
  %cmp25 = icmp ne i32 %12, -1, !dbg !178
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !179

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !180
  %call28 = call i32 @close(i32 %13), !dbg !182
  br label %if.end29, !dbg !183

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !184
  %cmp30 = icmp ne i32 %14, -1, !dbg !186
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !187

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !188
  %call33 = call i32 @close(i32 %15), !dbg !190
  br label %if.end34, !dbg !191

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !192

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !193
  %cmp36 = icmp eq i32 %16, 5, !dbg !195
  br i1 %cmp36, label %if.then38, label %if.end63, !dbg !196

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !197, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !201, metadata !DIExpression()), !dbg !202
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !203
  %17 = bitcast i8* %call39 to i32*, !dbg !204
  store i32* %17, i32** %buffer, align 8, !dbg !202
  %18 = load i32*, i32** %buffer, align 8, !dbg !205
  %cmp40 = icmp eq i32* %18, null, !dbg !207
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !208

if.then42:                                        ; preds = %if.then38
  call void @exit(i32 -1) #11, !dbg !209
  unreachable, !dbg !209

if.end43:                                         ; preds = %if.then38
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %if.end43
  %19 = load i32, i32* %i, align 4, !dbg !214
  %cmp44 = icmp slt i32 %19, 10, !dbg !216
  br i1 %cmp44, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !218
  %21 = load i32, i32* %i, align 4, !dbg !220
  %idxprom46 = sext i32 %21 to i64, !dbg !218
  %arrayidx47 = getelementptr inbounds i32, i32* %20, i64 %idxprom46, !dbg !218
  store i32 0, i32* %arrayidx47, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !223
  %inc = add nsw i32 %22, 1, !dbg !223
  store i32 %inc, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !228
  %cmp48 = icmp sge i32 %23, 0, !dbg !230
  br i1 %cmp48, label %if.then50, label %if.else, !dbg !231

if.then50:                                        ; preds = %for.end
  %24 = load i32*, i32** %buffer, align 8, !dbg !232
  %25 = load i32, i32* %data, align 4, !dbg !234
  %idxprom51 = sext i32 %25 to i64, !dbg !232
  %arrayidx52 = getelementptr inbounds i32, i32* %24, i64 %idxprom51, !dbg !232
  store i32 1, i32* %arrayidx52, align 4, !dbg !235
  store i32 0, i32* %i, align 4, !dbg !236
  br label %for.cond53, !dbg !238

for.cond53:                                       ; preds = %for.inc59, %if.then50
  %26 = load i32, i32* %i, align 4, !dbg !239
  %cmp54 = icmp slt i32 %26, 10, !dbg !241
  br i1 %cmp54, label %for.body56, label %for.end61, !dbg !242

for.body56:                                       ; preds = %for.cond53
  %27 = load i32*, i32** %buffer, align 8, !dbg !243
  %28 = load i32, i32* %i, align 4, !dbg !245
  %idxprom57 = sext i32 %28 to i64, !dbg !243
  %arrayidx58 = getelementptr inbounds i32, i32* %27, i64 %idxprom57, !dbg !243
  %29 = load i32, i32* %arrayidx58, align 4, !dbg !243
  call void @printIntLine(i32 %29), !dbg !246
  br label %for.inc59, !dbg !247

for.inc59:                                        ; preds = %for.body56
  %30 = load i32, i32* %i, align 4, !dbg !248
  %inc60 = add nsw i32 %30, 1, !dbg !248
  store i32 %inc60, i32* %i, align 4, !dbg !248
  br label %for.cond53, !dbg !249, !llvm.loop !250

for.end61:                                        ; preds = %for.cond53
  br label %if.end62, !dbg !252

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !253
  br label %if.end62

if.end62:                                         ; preds = %if.else, %for.end61
  %31 = load i32*, i32** %buffer, align 8, !dbg !255
  %32 = bitcast i32* %31 to i8*, !dbg !255
  call void @free(i8* %32) #8, !dbg !256
  br label %if.end63, !dbg !257

if.end63:                                         ; preds = %if.end62, %if.end35
  ret void, !dbg !258
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_14_good() #0 !dbg !259 {
entry:
  call void @goodB2G1(), !dbg !260
  call void @goodB2G2(), !dbg !261
  call void @goodG2B1(), !dbg !262
  call void @goodG2B2(), !dbg !263
  ret void, !dbg !264
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !265 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !270, metadata !DIExpression()), !dbg !271
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !272, metadata !DIExpression()), !dbg !273
  %call = call i64 @time(i64* null) #8, !dbg !274
  %conv = trunc i64 %call to i32, !dbg !275
  call void @srand(i32 %conv) #8, !dbg !276
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !277
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_14_good(), !dbg !278
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !279
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !280
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_14_bad(), !dbg !281
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !282
  ret i32 0, !dbg !283
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !284 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !285, metadata !DIExpression()), !dbg !286
  store i32 -1, i32* %data, align 4, !dbg !287
  %0 = load i32, i32* @globalFive, align 4, !dbg !288
  %cmp = icmp eq i32 %0, 5, !dbg !290
  br i1 %cmp, label %if.then, label %if.end35, !dbg !291

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !292, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !296, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !298, metadata !DIExpression()), !dbg !299
  store i32 -1, i32* %listenSocket, align 4, !dbg !299
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !300, metadata !DIExpression()), !dbg !301
  store i32 -1, i32* %acceptSocket, align 4, !dbg !301
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !302, metadata !DIExpression()), !dbg !303
  br label %do.body, !dbg !304

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !305
  store i32 %call, i32* %listenSocket, align 4, !dbg !307
  %1 = load i32, i32* %listenSocket, align 4, !dbg !308
  %cmp1 = icmp eq i32 %1, -1, !dbg !310
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !311

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !312

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !314
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !314
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !315
  store i16 2, i16* %sin_family, align 4, !dbg !316
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !317
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !318
  store i32 0, i32* %s_addr, align 4, !dbg !319
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !320
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !321
  store i16 %call3, i16* %sin_port, align 2, !dbg !322
  %3 = load i32, i32* %listenSocket, align 4, !dbg !323
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !325
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !326
  %cmp5 = icmp eq i32 %call4, -1, !dbg !327
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !328

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !329

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !331
  %call8 = call i32 @listen(i32 %5, i32 5) #8, !dbg !333
  %cmp9 = icmp eq i32 %call8, -1, !dbg !334
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !335

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !336

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !338
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !339
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !340
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !341
  %cmp13 = icmp eq i32 %7, -1, !dbg !343
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !344

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !345

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !347
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !348
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !349
  %conv = trunc i64 %call16 to i32, !dbg !349
  store i32 %conv, i32* %recvResult, align 4, !dbg !350
  %9 = load i32, i32* %recvResult, align 4, !dbg !351
  %cmp17 = icmp eq i32 %9, -1, !dbg !353
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !354

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !355
  %cmp19 = icmp eq i32 %10, 0, !dbg !356
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !357

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !358

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !360
  %idxprom = sext i32 %11 to i64, !dbg !361
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !361
  store i8 0, i8* %arrayidx, align 1, !dbg !362
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !363
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !364
  store i32 %call24, i32* %data, align 4, !dbg !365
  br label %do.end, !dbg !366

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !367
  %cmp25 = icmp ne i32 %12, -1, !dbg !369
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !370

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !371
  %call28 = call i32 @close(i32 %13), !dbg !373
  br label %if.end29, !dbg !374

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !375
  %cmp30 = icmp ne i32 %14, -1, !dbg !377
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !378

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !379
  %call33 = call i32 @close(i32 %15), !dbg !381
  br label %if.end34, !dbg !382

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !383

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !384
  %cmp36 = icmp ne i32 %16, 5, !dbg !386
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !387

if.then38:                                        ; preds = %if.end35
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !388
  br label %if.end66, !dbg !390

if.else:                                          ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !391, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !395, metadata !DIExpression()), !dbg !396
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !397
  %17 = bitcast i8* %call39 to i32*, !dbg !398
  store i32* %17, i32** %buffer, align 8, !dbg !396
  %18 = load i32*, i32** %buffer, align 8, !dbg !399
  %cmp40 = icmp eq i32* %18, null, !dbg !401
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !402

if.then42:                                        ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !403
  unreachable, !dbg !403

if.end43:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !405
  br label %for.cond, !dbg !407

for.cond:                                         ; preds = %for.inc, %if.end43
  %19 = load i32, i32* %i, align 4, !dbg !408
  %cmp44 = icmp slt i32 %19, 10, !dbg !410
  br i1 %cmp44, label %for.body, label %for.end, !dbg !411

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !412
  %21 = load i32, i32* %i, align 4, !dbg !414
  %idxprom46 = sext i32 %21 to i64, !dbg !412
  %arrayidx47 = getelementptr inbounds i32, i32* %20, i64 %idxprom46, !dbg !412
  store i32 0, i32* %arrayidx47, align 4, !dbg !415
  br label %for.inc, !dbg !416

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !417
  %inc = add nsw i32 %22, 1, !dbg !417
  store i32 %inc, i32* %i, align 4, !dbg !417
  br label %for.cond, !dbg !418, !llvm.loop !419

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !421
  %cmp48 = icmp sge i32 %23, 0, !dbg !423
  br i1 %cmp48, label %land.lhs.true, label %if.else64, !dbg !424

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data, align 4, !dbg !425
  %cmp50 = icmp slt i32 %24, 10, !dbg !426
  br i1 %cmp50, label %if.then52, label %if.else64, !dbg !427

if.then52:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !428
  %26 = load i32, i32* %data, align 4, !dbg !430
  %idxprom53 = sext i32 %26 to i64, !dbg !428
  %arrayidx54 = getelementptr inbounds i32, i32* %25, i64 %idxprom53, !dbg !428
  store i32 1, i32* %arrayidx54, align 4, !dbg !431
  store i32 0, i32* %i, align 4, !dbg !432
  br label %for.cond55, !dbg !434

for.cond55:                                       ; preds = %for.inc61, %if.then52
  %27 = load i32, i32* %i, align 4, !dbg !435
  %cmp56 = icmp slt i32 %27, 10, !dbg !437
  br i1 %cmp56, label %for.body58, label %for.end63, !dbg !438

for.body58:                                       ; preds = %for.cond55
  %28 = load i32*, i32** %buffer, align 8, !dbg !439
  %29 = load i32, i32* %i, align 4, !dbg !441
  %idxprom59 = sext i32 %29 to i64, !dbg !439
  %arrayidx60 = getelementptr inbounds i32, i32* %28, i64 %idxprom59, !dbg !439
  %30 = load i32, i32* %arrayidx60, align 4, !dbg !439
  call void @printIntLine(i32 %30), !dbg !442
  br label %for.inc61, !dbg !443

for.inc61:                                        ; preds = %for.body58
  %31 = load i32, i32* %i, align 4, !dbg !444
  %inc62 = add nsw i32 %31, 1, !dbg !444
  store i32 %inc62, i32* %i, align 4, !dbg !444
  br label %for.cond55, !dbg !445, !llvm.loop !446

for.end63:                                        ; preds = %for.cond55
  br label %if.end65, !dbg !448

if.else64:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !449
  br label %if.end65

if.end65:                                         ; preds = %if.else64, %for.end63
  %32 = load i32*, i32** %buffer, align 8, !dbg !451
  %33 = bitcast i32* %32 to i8*, !dbg !451
  call void @free(i8* %33) #8, !dbg !452
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %if.then38
  ret void, !dbg !453
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !454 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !455, metadata !DIExpression()), !dbg !456
  store i32 -1, i32* %data, align 4, !dbg !457
  %0 = load i32, i32* @globalFive, align 4, !dbg !458
  %cmp = icmp eq i32 %0, 5, !dbg !460
  br i1 %cmp, label %if.then, label %if.end35, !dbg !461

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !462, metadata !DIExpression()), !dbg !465
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !466, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !468, metadata !DIExpression()), !dbg !469
  store i32 -1, i32* %listenSocket, align 4, !dbg !469
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !470, metadata !DIExpression()), !dbg !471
  store i32 -1, i32* %acceptSocket, align 4, !dbg !471
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !472, metadata !DIExpression()), !dbg !473
  br label %do.body, !dbg !474

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !475
  store i32 %call, i32* %listenSocket, align 4, !dbg !477
  %1 = load i32, i32* %listenSocket, align 4, !dbg !478
  %cmp1 = icmp eq i32 %1, -1, !dbg !480
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !481

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !482

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !484
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !484
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !485
  store i16 2, i16* %sin_family, align 4, !dbg !486
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !487
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !488
  store i32 0, i32* %s_addr, align 4, !dbg !489
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !490
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !491
  store i16 %call3, i16* %sin_port, align 2, !dbg !492
  %3 = load i32, i32* %listenSocket, align 4, !dbg !493
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !495
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !496
  %cmp5 = icmp eq i32 %call4, -1, !dbg !497
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !498

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !499

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !501
  %call8 = call i32 @listen(i32 %5, i32 5) #8, !dbg !503
  %cmp9 = icmp eq i32 %call8, -1, !dbg !504
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !505

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !506

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !508
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !509
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !510
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !511
  %cmp13 = icmp eq i32 %7, -1, !dbg !513
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !514

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !515

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !517
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !518
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !519
  %conv = trunc i64 %call16 to i32, !dbg !519
  store i32 %conv, i32* %recvResult, align 4, !dbg !520
  %9 = load i32, i32* %recvResult, align 4, !dbg !521
  %cmp17 = icmp eq i32 %9, -1, !dbg !523
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !524

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !525
  %cmp19 = icmp eq i32 %10, 0, !dbg !526
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !527

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !528

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !530
  %idxprom = sext i32 %11 to i64, !dbg !531
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !531
  store i8 0, i8* %arrayidx, align 1, !dbg !532
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !533
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !534
  store i32 %call24, i32* %data, align 4, !dbg !535
  br label %do.end, !dbg !536

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !537
  %cmp25 = icmp ne i32 %12, -1, !dbg !539
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !540

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !541
  %call28 = call i32 @close(i32 %13), !dbg !543
  br label %if.end29, !dbg !544

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !545
  %cmp30 = icmp ne i32 %14, -1, !dbg !547
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !548

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !549
  %call33 = call i32 @close(i32 %15), !dbg !551
  br label %if.end34, !dbg !552

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !553

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !554
  %cmp36 = icmp eq i32 %16, 5, !dbg !556
  br i1 %cmp36, label %if.then38, label %if.end65, !dbg !557

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !558, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !562, metadata !DIExpression()), !dbg !563
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !564
  %17 = bitcast i8* %call39 to i32*, !dbg !565
  store i32* %17, i32** %buffer, align 8, !dbg !563
  %18 = load i32*, i32** %buffer, align 8, !dbg !566
  %cmp40 = icmp eq i32* %18, null, !dbg !568
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !569

if.then42:                                        ; preds = %if.then38
  call void @exit(i32 -1) #11, !dbg !570
  unreachable, !dbg !570

if.end43:                                         ; preds = %if.then38
  store i32 0, i32* %i, align 4, !dbg !572
  br label %for.cond, !dbg !574

for.cond:                                         ; preds = %for.inc, %if.end43
  %19 = load i32, i32* %i, align 4, !dbg !575
  %cmp44 = icmp slt i32 %19, 10, !dbg !577
  br i1 %cmp44, label %for.body, label %for.end, !dbg !578

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !579
  %21 = load i32, i32* %i, align 4, !dbg !581
  %idxprom46 = sext i32 %21 to i64, !dbg !579
  %arrayidx47 = getelementptr inbounds i32, i32* %20, i64 %idxprom46, !dbg !579
  store i32 0, i32* %arrayidx47, align 4, !dbg !582
  br label %for.inc, !dbg !583

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !584
  %inc = add nsw i32 %22, 1, !dbg !584
  store i32 %inc, i32* %i, align 4, !dbg !584
  br label %for.cond, !dbg !585, !llvm.loop !586

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !588
  %cmp48 = icmp sge i32 %23, 0, !dbg !590
  br i1 %cmp48, label %land.lhs.true, label %if.else, !dbg !591

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data, align 4, !dbg !592
  %cmp50 = icmp slt i32 %24, 10, !dbg !593
  br i1 %cmp50, label %if.then52, label %if.else, !dbg !594

if.then52:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !595
  %26 = load i32, i32* %data, align 4, !dbg !597
  %idxprom53 = sext i32 %26 to i64, !dbg !595
  %arrayidx54 = getelementptr inbounds i32, i32* %25, i64 %idxprom53, !dbg !595
  store i32 1, i32* %arrayidx54, align 4, !dbg !598
  store i32 0, i32* %i, align 4, !dbg !599
  br label %for.cond55, !dbg !601

for.cond55:                                       ; preds = %for.inc61, %if.then52
  %27 = load i32, i32* %i, align 4, !dbg !602
  %cmp56 = icmp slt i32 %27, 10, !dbg !604
  br i1 %cmp56, label %for.body58, label %for.end63, !dbg !605

for.body58:                                       ; preds = %for.cond55
  %28 = load i32*, i32** %buffer, align 8, !dbg !606
  %29 = load i32, i32* %i, align 4, !dbg !608
  %idxprom59 = sext i32 %29 to i64, !dbg !606
  %arrayidx60 = getelementptr inbounds i32, i32* %28, i64 %idxprom59, !dbg !606
  %30 = load i32, i32* %arrayidx60, align 4, !dbg !606
  call void @printIntLine(i32 %30), !dbg !609
  br label %for.inc61, !dbg !610

for.inc61:                                        ; preds = %for.body58
  %31 = load i32, i32* %i, align 4, !dbg !611
  %inc62 = add nsw i32 %31, 1, !dbg !611
  store i32 %inc62, i32* %i, align 4, !dbg !611
  br label %for.cond55, !dbg !612, !llvm.loop !613

for.end63:                                        ; preds = %for.cond55
  br label %if.end64, !dbg !615

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !616
  br label %if.end64

if.end64:                                         ; preds = %if.else, %for.end63
  %32 = load i32*, i32** %buffer, align 8, !dbg !618
  %33 = bitcast i32* %32 to i8*, !dbg !618
  call void @free(i8* %33) #8, !dbg !619
  br label %if.end65, !dbg !620

if.end65:                                         ; preds = %if.end64, %if.end35
  ret void, !dbg !621
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !622 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !623, metadata !DIExpression()), !dbg !624
  store i32 -1, i32* %data, align 4, !dbg !625
  %0 = load i32, i32* @globalFive, align 4, !dbg !626
  %cmp = icmp ne i32 %0, 5, !dbg !628
  br i1 %cmp, label %if.then, label %if.else, !dbg !629

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !630
  br label %if.end, !dbg !632

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !633
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !635
  %cmp1 = icmp eq i32 %1, 5, !dbg !637
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !638

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !639, metadata !DIExpression()), !dbg !642
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !643, metadata !DIExpression()), !dbg !644
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !645
  %2 = bitcast i8* %call to i32*, !dbg !646
  store i32* %2, i32** %buffer, align 8, !dbg !644
  %3 = load i32*, i32** %buffer, align 8, !dbg !647
  %cmp3 = icmp eq i32* %3, null, !dbg !649
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !650

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !651
  unreachable, !dbg !651

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !653
  br label %for.cond, !dbg !655

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !656
  %cmp6 = icmp slt i32 %4, 10, !dbg !658
  br i1 %cmp6, label %for.body, label %for.end, !dbg !659

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !660
  %6 = load i32, i32* %i, align 4, !dbg !662
  %idxprom = sext i32 %6 to i64, !dbg !660
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !660
  store i32 0, i32* %arrayidx, align 4, !dbg !663
  br label %for.inc, !dbg !664

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !665
  %inc = add nsw i32 %7, 1, !dbg !665
  store i32 %inc, i32* %i, align 4, !dbg !665
  br label %for.cond, !dbg !666, !llvm.loop !667

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !669
  %cmp7 = icmp sge i32 %8, 0, !dbg !671
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !672

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !673
  %10 = load i32, i32* %data, align 4, !dbg !675
  %idxprom9 = sext i32 %10 to i64, !dbg !673
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !673
  store i32 1, i32* %arrayidx10, align 4, !dbg !676
  store i32 0, i32* %i, align 4, !dbg !677
  br label %for.cond11, !dbg !679

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !680
  %cmp12 = icmp slt i32 %11, 10, !dbg !682
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !683

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !684
  %13 = load i32, i32* %i, align 4, !dbg !686
  %idxprom14 = sext i32 %13 to i64, !dbg !684
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !684
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !684
  call void @printIntLine(i32 %14), !dbg !687
  br label %for.inc16, !dbg !688

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !689
  %inc17 = add nsw i32 %15, 1, !dbg !689
  store i32 %inc17, i32* %i, align 4, !dbg !689
  br label %for.cond11, !dbg !690, !llvm.loop !691

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !693

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !694
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !696
  %17 = bitcast i32* %16 to i8*, !dbg !696
  call void @free(i8* %17) #8, !dbg !697
  br label %if.end21, !dbg !698

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !699
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !700 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !701, metadata !DIExpression()), !dbg !702
  store i32 -1, i32* %data, align 4, !dbg !703
  %0 = load i32, i32* @globalFive, align 4, !dbg !704
  %cmp = icmp eq i32 %0, 5, !dbg !706
  br i1 %cmp, label %if.then, label %if.end, !dbg !707

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !708
  br label %if.end, !dbg !710

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !711
  %cmp1 = icmp eq i32 %1, 5, !dbg !713
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !714

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !715, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !719, metadata !DIExpression()), !dbg !720
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !721
  %2 = bitcast i8* %call to i32*, !dbg !722
  store i32* %2, i32** %buffer, align 8, !dbg !720
  %3 = load i32*, i32** %buffer, align 8, !dbg !723
  %cmp3 = icmp eq i32* %3, null, !dbg !725
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !726

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !727
  unreachable, !dbg !727

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !729
  br label %for.cond, !dbg !731

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !732
  %cmp6 = icmp slt i32 %4, 10, !dbg !734
  br i1 %cmp6, label %for.body, label %for.end, !dbg !735

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !736
  %6 = load i32, i32* %i, align 4, !dbg !738
  %idxprom = sext i32 %6 to i64, !dbg !736
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !736
  store i32 0, i32* %arrayidx, align 4, !dbg !739
  br label %for.inc, !dbg !740

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !741
  %inc = add nsw i32 %7, 1, !dbg !741
  store i32 %inc, i32* %i, align 4, !dbg !741
  br label %for.cond, !dbg !742, !llvm.loop !743

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !745
  %cmp7 = icmp sge i32 %8, 0, !dbg !747
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !748

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !749
  %10 = load i32, i32* %data, align 4, !dbg !751
  %idxprom9 = sext i32 %10 to i64, !dbg !749
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !749
  store i32 1, i32* %arrayidx10, align 4, !dbg !752
  store i32 0, i32* %i, align 4, !dbg !753
  br label %for.cond11, !dbg !755

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !756
  %cmp12 = icmp slt i32 %11, 10, !dbg !758
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !759

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !760
  %13 = load i32, i32* %i, align 4, !dbg !762
  %idxprom14 = sext i32 %13 to i64, !dbg !760
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !760
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !760
  call void @printIntLine(i32 %14), !dbg !763
  br label %for.inc16, !dbg !764

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !765
  %inc17 = add nsw i32 %15, 1, !dbg !765
  store i32 %inc17, i32* %i, align 4, !dbg !765
  br label %for.cond11, !dbg !766, !llvm.loop !767

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !769

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !770
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !772
  %17 = bitcast i32* %16 to i8*, !dbg !772
  call void @free(i8* %17) #8, !dbg !773
  br label %if.end20, !dbg !774

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !775
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_14.c", directory: "/root/SSE-Assessment")
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
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_14_bad", scope: !74, file: !74, line: 44, type: !75, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_14.c", directory: "/root/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 46, type: !65)
!79 = !DILocation(line: 46, column: 9, scope: !73)
!80 = !DILocation(line: 48, column: 10, scope: !73)
!81 = !DILocation(line: 49, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !74, line: 49, column: 8)
!83 = !DILocation(line: 49, column: 18, scope: !82)
!84 = !DILocation(line: 49, column: 8, scope: !73)
!85 = !DILocalVariable(name: "recvResult", scope: !86, file: !74, line: 56, type: !65)
!86 = distinct !DILexicalBlock(scope: !87, file: !74, line: 51, column: 9)
!87 = distinct !DILexicalBlock(scope: !82, file: !74, line: 50, column: 5)
!88 = !DILocation(line: 56, column: 17, scope: !86)
!89 = !DILocalVariable(name: "service", scope: !86, file: !74, line: 57, type: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !91)
!91 = !{!92, !93, !97, !101}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !90, file: !17, line: 239, baseType: !56, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !90, file: !17, line: 240, baseType: !94, size: 16, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !90, file: !17, line: 241, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !17, line: 33, baseType: !46, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !90, file: !17, line: 244, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 57, column: 32, scope: !86)
!107 = !DILocalVariable(name: "listenSocket", scope: !86, file: !74, line: 58, type: !65)
!108 = !DILocation(line: 58, column: 20, scope: !86)
!109 = !DILocalVariable(name: "acceptSocket", scope: !86, file: !74, line: 59, type: !65)
!110 = !DILocation(line: 59, column: 20, scope: !86)
!111 = !DILocalVariable(name: "inputBuffer", scope: !86, file: !74, line: 60, type: !60)
!112 = !DILocation(line: 60, column: 18, scope: !86)
!113 = !DILocation(line: 61, column: 13, scope: !86)
!114 = !DILocation(line: 71, column: 32, scope: !115)
!115 = distinct !DILexicalBlock(scope: !86, file: !74, line: 62, column: 13)
!116 = !DILocation(line: 71, column: 30, scope: !115)
!117 = !DILocation(line: 72, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !74, line: 72, column: 21)
!119 = !DILocation(line: 72, column: 34, scope: !118)
!120 = !DILocation(line: 72, column: 21, scope: !115)
!121 = !DILocation(line: 74, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !74, line: 73, column: 17)
!123 = !DILocation(line: 76, column: 17, scope: !115)
!124 = !DILocation(line: 77, column: 25, scope: !115)
!125 = !DILocation(line: 77, column: 36, scope: !115)
!126 = !DILocation(line: 78, column: 25, scope: !115)
!127 = !DILocation(line: 78, column: 34, scope: !115)
!128 = !DILocation(line: 78, column: 41, scope: !115)
!129 = !DILocation(line: 79, column: 36, scope: !115)
!130 = !DILocation(line: 79, column: 25, scope: !115)
!131 = !DILocation(line: 79, column: 34, scope: !115)
!132 = !DILocation(line: 80, column: 26, scope: !133)
!133 = distinct !DILexicalBlock(scope: !115, file: !74, line: 80, column: 21)
!134 = !DILocation(line: 80, column: 40, scope: !133)
!135 = !DILocation(line: 80, column: 21, scope: !133)
!136 = !DILocation(line: 80, column: 85, scope: !133)
!137 = !DILocation(line: 80, column: 21, scope: !115)
!138 = !DILocation(line: 82, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !74, line: 81, column: 17)
!140 = !DILocation(line: 84, column: 28, scope: !141)
!141 = distinct !DILexicalBlock(scope: !115, file: !74, line: 84, column: 21)
!142 = !DILocation(line: 84, column: 21, scope: !141)
!143 = !DILocation(line: 84, column: 58, scope: !141)
!144 = !DILocation(line: 84, column: 21, scope: !115)
!145 = !DILocation(line: 86, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !74, line: 85, column: 17)
!147 = !DILocation(line: 88, column: 39, scope: !115)
!148 = !DILocation(line: 88, column: 32, scope: !115)
!149 = !DILocation(line: 88, column: 30, scope: !115)
!150 = !DILocation(line: 89, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !115, file: !74, line: 89, column: 21)
!152 = !DILocation(line: 89, column: 34, scope: !151)
!153 = !DILocation(line: 89, column: 21, scope: !115)
!154 = !DILocation(line: 91, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !74, line: 90, column: 17)
!156 = !DILocation(line: 94, column: 35, scope: !115)
!157 = !DILocation(line: 94, column: 49, scope: !115)
!158 = !DILocation(line: 94, column: 30, scope: !115)
!159 = !DILocation(line: 94, column: 28, scope: !115)
!160 = !DILocation(line: 95, column: 21, scope: !161)
!161 = distinct !DILexicalBlock(scope: !115, file: !74, line: 95, column: 21)
!162 = !DILocation(line: 95, column: 32, scope: !161)
!163 = !DILocation(line: 95, column: 48, scope: !161)
!164 = !DILocation(line: 95, column: 51, scope: !161)
!165 = !DILocation(line: 95, column: 62, scope: !161)
!166 = !DILocation(line: 95, column: 21, scope: !115)
!167 = !DILocation(line: 97, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !74, line: 96, column: 17)
!169 = !DILocation(line: 100, column: 29, scope: !115)
!170 = !DILocation(line: 100, column: 17, scope: !115)
!171 = !DILocation(line: 100, column: 41, scope: !115)
!172 = !DILocation(line: 102, column: 29, scope: !115)
!173 = !DILocation(line: 102, column: 24, scope: !115)
!174 = !DILocation(line: 102, column: 22, scope: !115)
!175 = !DILocation(line: 103, column: 13, scope: !115)
!176 = !DILocation(line: 105, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !86, file: !74, line: 105, column: 17)
!178 = !DILocation(line: 105, column: 30, scope: !177)
!179 = !DILocation(line: 105, column: 17, scope: !86)
!180 = !DILocation(line: 107, column: 30, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !74, line: 106, column: 13)
!182 = !DILocation(line: 107, column: 17, scope: !181)
!183 = !DILocation(line: 108, column: 13, scope: !181)
!184 = !DILocation(line: 109, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !86, file: !74, line: 109, column: 17)
!186 = !DILocation(line: 109, column: 30, scope: !185)
!187 = !DILocation(line: 109, column: 17, scope: !86)
!188 = !DILocation(line: 111, column: 30, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !74, line: 110, column: 13)
!190 = !DILocation(line: 111, column: 17, scope: !189)
!191 = !DILocation(line: 112, column: 13, scope: !189)
!192 = !DILocation(line: 120, column: 5, scope: !87)
!193 = !DILocation(line: 121, column: 8, scope: !194)
!194 = distinct !DILexicalBlock(scope: !73, file: !74, line: 121, column: 8)
!195 = !DILocation(line: 121, column: 18, scope: !194)
!196 = !DILocation(line: 121, column: 8, scope: !73)
!197 = !DILocalVariable(name: "i", scope: !198, file: !74, line: 124, type: !65)
!198 = distinct !DILexicalBlock(scope: !199, file: !74, line: 123, column: 9)
!199 = distinct !DILexicalBlock(scope: !194, file: !74, line: 122, column: 5)
!200 = !DILocation(line: 124, column: 17, scope: !198)
!201 = !DILocalVariable(name: "buffer", scope: !198, file: !74, line: 125, type: !64)
!202 = !DILocation(line: 125, column: 19, scope: !198)
!203 = !DILocation(line: 125, column: 35, scope: !198)
!204 = !DILocation(line: 125, column: 28, scope: !198)
!205 = !DILocation(line: 126, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !198, file: !74, line: 126, column: 17)
!207 = !DILocation(line: 126, column: 24, scope: !206)
!208 = !DILocation(line: 126, column: 17, scope: !198)
!209 = !DILocation(line: 126, column: 34, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !74, line: 126, column: 33)
!211 = !DILocation(line: 128, column: 20, scope: !212)
!212 = distinct !DILexicalBlock(scope: !198, file: !74, line: 128, column: 13)
!213 = !DILocation(line: 128, column: 18, scope: !212)
!214 = !DILocation(line: 128, column: 25, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !74, line: 128, column: 13)
!216 = !DILocation(line: 128, column: 27, scope: !215)
!217 = !DILocation(line: 128, column: 13, scope: !212)
!218 = !DILocation(line: 130, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !74, line: 129, column: 13)
!220 = !DILocation(line: 130, column: 24, scope: !219)
!221 = !DILocation(line: 130, column: 27, scope: !219)
!222 = !DILocation(line: 131, column: 13, scope: !219)
!223 = !DILocation(line: 128, column: 34, scope: !215)
!224 = !DILocation(line: 128, column: 13, scope: !215)
!225 = distinct !{!225, !217, !226, !227}
!226 = !DILocation(line: 131, column: 13, scope: !212)
!227 = !{!"llvm.loop.mustprogress"}
!228 = !DILocation(line: 134, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !198, file: !74, line: 134, column: 17)
!230 = !DILocation(line: 134, column: 22, scope: !229)
!231 = !DILocation(line: 134, column: 17, scope: !198)
!232 = !DILocation(line: 136, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !74, line: 135, column: 13)
!234 = !DILocation(line: 136, column: 24, scope: !233)
!235 = !DILocation(line: 136, column: 30, scope: !233)
!236 = !DILocation(line: 138, column: 23, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !74, line: 138, column: 17)
!238 = !DILocation(line: 138, column: 21, scope: !237)
!239 = !DILocation(line: 138, column: 28, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !74, line: 138, column: 17)
!241 = !DILocation(line: 138, column: 30, scope: !240)
!242 = !DILocation(line: 138, column: 17, scope: !237)
!243 = !DILocation(line: 140, column: 34, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !74, line: 139, column: 17)
!245 = !DILocation(line: 140, column: 41, scope: !244)
!246 = !DILocation(line: 140, column: 21, scope: !244)
!247 = !DILocation(line: 141, column: 17, scope: !244)
!248 = !DILocation(line: 138, column: 37, scope: !240)
!249 = !DILocation(line: 138, column: 17, scope: !240)
!250 = distinct !{!250, !242, !251, !227}
!251 = !DILocation(line: 141, column: 17, scope: !237)
!252 = !DILocation(line: 142, column: 13, scope: !233)
!253 = !DILocation(line: 145, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !229, file: !74, line: 144, column: 13)
!255 = !DILocation(line: 147, column: 18, scope: !198)
!256 = !DILocation(line: 147, column: 13, scope: !198)
!257 = !DILocation(line: 149, column: 5, scope: !199)
!258 = !DILocation(line: 150, column: 1, scope: !73)
!259 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_14_good", scope: !74, file: !74, line: 468, type: !75, scopeLine: 469, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!260 = !DILocation(line: 470, column: 5, scope: !259)
!261 = !DILocation(line: 471, column: 5, scope: !259)
!262 = !DILocation(line: 472, column: 5, scope: !259)
!263 = !DILocation(line: 473, column: 5, scope: !259)
!264 = !DILocation(line: 474, column: 1, scope: !259)
!265 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 485, type: !266, scopeLine: 486, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!266 = !DISubroutineType(types: !267)
!267 = !{!65, !65, !268}
!268 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64)
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!270 = !DILocalVariable(name: "argc", arg: 1, scope: !265, file: !74, line: 485, type: !65)
!271 = !DILocation(line: 485, column: 14, scope: !265)
!272 = !DILocalVariable(name: "argv", arg: 2, scope: !265, file: !74, line: 485, type: !268)
!273 = !DILocation(line: 485, column: 27, scope: !265)
!274 = !DILocation(line: 488, column: 22, scope: !265)
!275 = !DILocation(line: 488, column: 12, scope: !265)
!276 = !DILocation(line: 488, column: 5, scope: !265)
!277 = !DILocation(line: 490, column: 5, scope: !265)
!278 = !DILocation(line: 491, column: 5, scope: !265)
!279 = !DILocation(line: 492, column: 5, scope: !265)
!280 = !DILocation(line: 495, column: 5, scope: !265)
!281 = !DILocation(line: 496, column: 5, scope: !265)
!282 = !DILocation(line: 497, column: 5, scope: !265)
!283 = !DILocation(line: 499, column: 5, scope: !265)
!284 = distinct !DISubprogram(name: "goodB2G1", scope: !74, file: !74, line: 157, type: !75, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!285 = !DILocalVariable(name: "data", scope: !284, file: !74, line: 159, type: !65)
!286 = !DILocation(line: 159, column: 9, scope: !284)
!287 = !DILocation(line: 161, column: 10, scope: !284)
!288 = !DILocation(line: 162, column: 8, scope: !289)
!289 = distinct !DILexicalBlock(scope: !284, file: !74, line: 162, column: 8)
!290 = !DILocation(line: 162, column: 18, scope: !289)
!291 = !DILocation(line: 162, column: 8, scope: !284)
!292 = !DILocalVariable(name: "recvResult", scope: !293, file: !74, line: 169, type: !65)
!293 = distinct !DILexicalBlock(scope: !294, file: !74, line: 164, column: 9)
!294 = distinct !DILexicalBlock(scope: !289, file: !74, line: 163, column: 5)
!295 = !DILocation(line: 169, column: 17, scope: !293)
!296 = !DILocalVariable(name: "service", scope: !293, file: !74, line: 170, type: !90)
!297 = !DILocation(line: 170, column: 32, scope: !293)
!298 = !DILocalVariable(name: "listenSocket", scope: !293, file: !74, line: 171, type: !65)
!299 = !DILocation(line: 171, column: 20, scope: !293)
!300 = !DILocalVariable(name: "acceptSocket", scope: !293, file: !74, line: 172, type: !65)
!301 = !DILocation(line: 172, column: 20, scope: !293)
!302 = !DILocalVariable(name: "inputBuffer", scope: !293, file: !74, line: 173, type: !60)
!303 = !DILocation(line: 173, column: 18, scope: !293)
!304 = !DILocation(line: 174, column: 13, scope: !293)
!305 = !DILocation(line: 184, column: 32, scope: !306)
!306 = distinct !DILexicalBlock(scope: !293, file: !74, line: 175, column: 13)
!307 = !DILocation(line: 184, column: 30, scope: !306)
!308 = !DILocation(line: 185, column: 21, scope: !309)
!309 = distinct !DILexicalBlock(scope: !306, file: !74, line: 185, column: 21)
!310 = !DILocation(line: 185, column: 34, scope: !309)
!311 = !DILocation(line: 185, column: 21, scope: !306)
!312 = !DILocation(line: 187, column: 21, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !74, line: 186, column: 17)
!314 = !DILocation(line: 189, column: 17, scope: !306)
!315 = !DILocation(line: 190, column: 25, scope: !306)
!316 = !DILocation(line: 190, column: 36, scope: !306)
!317 = !DILocation(line: 191, column: 25, scope: !306)
!318 = !DILocation(line: 191, column: 34, scope: !306)
!319 = !DILocation(line: 191, column: 41, scope: !306)
!320 = !DILocation(line: 192, column: 36, scope: !306)
!321 = !DILocation(line: 192, column: 25, scope: !306)
!322 = !DILocation(line: 192, column: 34, scope: !306)
!323 = !DILocation(line: 193, column: 26, scope: !324)
!324 = distinct !DILexicalBlock(scope: !306, file: !74, line: 193, column: 21)
!325 = !DILocation(line: 193, column: 40, scope: !324)
!326 = !DILocation(line: 193, column: 21, scope: !324)
!327 = !DILocation(line: 193, column: 85, scope: !324)
!328 = !DILocation(line: 193, column: 21, scope: !306)
!329 = !DILocation(line: 195, column: 21, scope: !330)
!330 = distinct !DILexicalBlock(scope: !324, file: !74, line: 194, column: 17)
!331 = !DILocation(line: 197, column: 28, scope: !332)
!332 = distinct !DILexicalBlock(scope: !306, file: !74, line: 197, column: 21)
!333 = !DILocation(line: 197, column: 21, scope: !332)
!334 = !DILocation(line: 197, column: 58, scope: !332)
!335 = !DILocation(line: 197, column: 21, scope: !306)
!336 = !DILocation(line: 199, column: 21, scope: !337)
!337 = distinct !DILexicalBlock(scope: !332, file: !74, line: 198, column: 17)
!338 = !DILocation(line: 201, column: 39, scope: !306)
!339 = !DILocation(line: 201, column: 32, scope: !306)
!340 = !DILocation(line: 201, column: 30, scope: !306)
!341 = !DILocation(line: 202, column: 21, scope: !342)
!342 = distinct !DILexicalBlock(scope: !306, file: !74, line: 202, column: 21)
!343 = !DILocation(line: 202, column: 34, scope: !342)
!344 = !DILocation(line: 202, column: 21, scope: !306)
!345 = !DILocation(line: 204, column: 21, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !74, line: 203, column: 17)
!347 = !DILocation(line: 207, column: 35, scope: !306)
!348 = !DILocation(line: 207, column: 49, scope: !306)
!349 = !DILocation(line: 207, column: 30, scope: !306)
!350 = !DILocation(line: 207, column: 28, scope: !306)
!351 = !DILocation(line: 208, column: 21, scope: !352)
!352 = distinct !DILexicalBlock(scope: !306, file: !74, line: 208, column: 21)
!353 = !DILocation(line: 208, column: 32, scope: !352)
!354 = !DILocation(line: 208, column: 48, scope: !352)
!355 = !DILocation(line: 208, column: 51, scope: !352)
!356 = !DILocation(line: 208, column: 62, scope: !352)
!357 = !DILocation(line: 208, column: 21, scope: !306)
!358 = !DILocation(line: 210, column: 21, scope: !359)
!359 = distinct !DILexicalBlock(scope: !352, file: !74, line: 209, column: 17)
!360 = !DILocation(line: 213, column: 29, scope: !306)
!361 = !DILocation(line: 213, column: 17, scope: !306)
!362 = !DILocation(line: 213, column: 41, scope: !306)
!363 = !DILocation(line: 215, column: 29, scope: !306)
!364 = !DILocation(line: 215, column: 24, scope: !306)
!365 = !DILocation(line: 215, column: 22, scope: !306)
!366 = !DILocation(line: 216, column: 13, scope: !306)
!367 = !DILocation(line: 218, column: 17, scope: !368)
!368 = distinct !DILexicalBlock(scope: !293, file: !74, line: 218, column: 17)
!369 = !DILocation(line: 218, column: 30, scope: !368)
!370 = !DILocation(line: 218, column: 17, scope: !293)
!371 = !DILocation(line: 220, column: 30, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !74, line: 219, column: 13)
!373 = !DILocation(line: 220, column: 17, scope: !372)
!374 = !DILocation(line: 221, column: 13, scope: !372)
!375 = !DILocation(line: 222, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !293, file: !74, line: 222, column: 17)
!377 = !DILocation(line: 222, column: 30, scope: !376)
!378 = !DILocation(line: 222, column: 17, scope: !293)
!379 = !DILocation(line: 224, column: 30, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !74, line: 223, column: 13)
!381 = !DILocation(line: 224, column: 17, scope: !380)
!382 = !DILocation(line: 225, column: 13, scope: !380)
!383 = !DILocation(line: 233, column: 5, scope: !294)
!384 = !DILocation(line: 234, column: 8, scope: !385)
!385 = distinct !DILexicalBlock(scope: !284, file: !74, line: 234, column: 8)
!386 = !DILocation(line: 234, column: 18, scope: !385)
!387 = !DILocation(line: 234, column: 8, scope: !284)
!388 = !DILocation(line: 237, column: 9, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !74, line: 235, column: 5)
!390 = !DILocation(line: 238, column: 5, scope: !389)
!391 = !DILocalVariable(name: "i", scope: !392, file: !74, line: 242, type: !65)
!392 = distinct !DILexicalBlock(scope: !393, file: !74, line: 241, column: 9)
!393 = distinct !DILexicalBlock(scope: !385, file: !74, line: 240, column: 5)
!394 = !DILocation(line: 242, column: 17, scope: !392)
!395 = !DILocalVariable(name: "buffer", scope: !392, file: !74, line: 243, type: !64)
!396 = !DILocation(line: 243, column: 19, scope: !392)
!397 = !DILocation(line: 243, column: 35, scope: !392)
!398 = !DILocation(line: 243, column: 28, scope: !392)
!399 = !DILocation(line: 244, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !392, file: !74, line: 244, column: 17)
!401 = !DILocation(line: 244, column: 24, scope: !400)
!402 = !DILocation(line: 244, column: 17, scope: !392)
!403 = !DILocation(line: 244, column: 34, scope: !404)
!404 = distinct !DILexicalBlock(scope: !400, file: !74, line: 244, column: 33)
!405 = !DILocation(line: 246, column: 20, scope: !406)
!406 = distinct !DILexicalBlock(scope: !392, file: !74, line: 246, column: 13)
!407 = !DILocation(line: 246, column: 18, scope: !406)
!408 = !DILocation(line: 246, column: 25, scope: !409)
!409 = distinct !DILexicalBlock(scope: !406, file: !74, line: 246, column: 13)
!410 = !DILocation(line: 246, column: 27, scope: !409)
!411 = !DILocation(line: 246, column: 13, scope: !406)
!412 = !DILocation(line: 248, column: 17, scope: !413)
!413 = distinct !DILexicalBlock(scope: !409, file: !74, line: 247, column: 13)
!414 = !DILocation(line: 248, column: 24, scope: !413)
!415 = !DILocation(line: 248, column: 27, scope: !413)
!416 = !DILocation(line: 249, column: 13, scope: !413)
!417 = !DILocation(line: 246, column: 34, scope: !409)
!418 = !DILocation(line: 246, column: 13, scope: !409)
!419 = distinct !{!419, !411, !420, !227}
!420 = !DILocation(line: 249, column: 13, scope: !406)
!421 = !DILocation(line: 251, column: 17, scope: !422)
!422 = distinct !DILexicalBlock(scope: !392, file: !74, line: 251, column: 17)
!423 = !DILocation(line: 251, column: 22, scope: !422)
!424 = !DILocation(line: 251, column: 27, scope: !422)
!425 = !DILocation(line: 251, column: 30, scope: !422)
!426 = !DILocation(line: 251, column: 35, scope: !422)
!427 = !DILocation(line: 251, column: 17, scope: !392)
!428 = !DILocation(line: 253, column: 17, scope: !429)
!429 = distinct !DILexicalBlock(scope: !422, file: !74, line: 252, column: 13)
!430 = !DILocation(line: 253, column: 24, scope: !429)
!431 = !DILocation(line: 253, column: 30, scope: !429)
!432 = !DILocation(line: 255, column: 23, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !74, line: 255, column: 17)
!434 = !DILocation(line: 255, column: 21, scope: !433)
!435 = !DILocation(line: 255, column: 28, scope: !436)
!436 = distinct !DILexicalBlock(scope: !433, file: !74, line: 255, column: 17)
!437 = !DILocation(line: 255, column: 30, scope: !436)
!438 = !DILocation(line: 255, column: 17, scope: !433)
!439 = !DILocation(line: 257, column: 34, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !74, line: 256, column: 17)
!441 = !DILocation(line: 257, column: 41, scope: !440)
!442 = !DILocation(line: 257, column: 21, scope: !440)
!443 = !DILocation(line: 258, column: 17, scope: !440)
!444 = !DILocation(line: 255, column: 37, scope: !436)
!445 = !DILocation(line: 255, column: 17, scope: !436)
!446 = distinct !{!446, !438, !447, !227}
!447 = !DILocation(line: 258, column: 17, scope: !433)
!448 = !DILocation(line: 259, column: 13, scope: !429)
!449 = !DILocation(line: 262, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !422, file: !74, line: 261, column: 13)
!451 = !DILocation(line: 264, column: 18, scope: !392)
!452 = !DILocation(line: 264, column: 13, scope: !392)
!453 = !DILocation(line: 267, column: 1, scope: !284)
!454 = distinct !DISubprogram(name: "goodB2G2", scope: !74, file: !74, line: 270, type: !75, scopeLine: 271, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!455 = !DILocalVariable(name: "data", scope: !454, file: !74, line: 272, type: !65)
!456 = !DILocation(line: 272, column: 9, scope: !454)
!457 = !DILocation(line: 274, column: 10, scope: !454)
!458 = !DILocation(line: 275, column: 8, scope: !459)
!459 = distinct !DILexicalBlock(scope: !454, file: !74, line: 275, column: 8)
!460 = !DILocation(line: 275, column: 18, scope: !459)
!461 = !DILocation(line: 275, column: 8, scope: !454)
!462 = !DILocalVariable(name: "recvResult", scope: !463, file: !74, line: 282, type: !65)
!463 = distinct !DILexicalBlock(scope: !464, file: !74, line: 277, column: 9)
!464 = distinct !DILexicalBlock(scope: !459, file: !74, line: 276, column: 5)
!465 = !DILocation(line: 282, column: 17, scope: !463)
!466 = !DILocalVariable(name: "service", scope: !463, file: !74, line: 283, type: !90)
!467 = !DILocation(line: 283, column: 32, scope: !463)
!468 = !DILocalVariable(name: "listenSocket", scope: !463, file: !74, line: 284, type: !65)
!469 = !DILocation(line: 284, column: 20, scope: !463)
!470 = !DILocalVariable(name: "acceptSocket", scope: !463, file: !74, line: 285, type: !65)
!471 = !DILocation(line: 285, column: 20, scope: !463)
!472 = !DILocalVariable(name: "inputBuffer", scope: !463, file: !74, line: 286, type: !60)
!473 = !DILocation(line: 286, column: 18, scope: !463)
!474 = !DILocation(line: 287, column: 13, scope: !463)
!475 = !DILocation(line: 297, column: 32, scope: !476)
!476 = distinct !DILexicalBlock(scope: !463, file: !74, line: 288, column: 13)
!477 = !DILocation(line: 297, column: 30, scope: !476)
!478 = !DILocation(line: 298, column: 21, scope: !479)
!479 = distinct !DILexicalBlock(scope: !476, file: !74, line: 298, column: 21)
!480 = !DILocation(line: 298, column: 34, scope: !479)
!481 = !DILocation(line: 298, column: 21, scope: !476)
!482 = !DILocation(line: 300, column: 21, scope: !483)
!483 = distinct !DILexicalBlock(scope: !479, file: !74, line: 299, column: 17)
!484 = !DILocation(line: 302, column: 17, scope: !476)
!485 = !DILocation(line: 303, column: 25, scope: !476)
!486 = !DILocation(line: 303, column: 36, scope: !476)
!487 = !DILocation(line: 304, column: 25, scope: !476)
!488 = !DILocation(line: 304, column: 34, scope: !476)
!489 = !DILocation(line: 304, column: 41, scope: !476)
!490 = !DILocation(line: 305, column: 36, scope: !476)
!491 = !DILocation(line: 305, column: 25, scope: !476)
!492 = !DILocation(line: 305, column: 34, scope: !476)
!493 = !DILocation(line: 306, column: 26, scope: !494)
!494 = distinct !DILexicalBlock(scope: !476, file: !74, line: 306, column: 21)
!495 = !DILocation(line: 306, column: 40, scope: !494)
!496 = !DILocation(line: 306, column: 21, scope: !494)
!497 = !DILocation(line: 306, column: 85, scope: !494)
!498 = !DILocation(line: 306, column: 21, scope: !476)
!499 = !DILocation(line: 308, column: 21, scope: !500)
!500 = distinct !DILexicalBlock(scope: !494, file: !74, line: 307, column: 17)
!501 = !DILocation(line: 310, column: 28, scope: !502)
!502 = distinct !DILexicalBlock(scope: !476, file: !74, line: 310, column: 21)
!503 = !DILocation(line: 310, column: 21, scope: !502)
!504 = !DILocation(line: 310, column: 58, scope: !502)
!505 = !DILocation(line: 310, column: 21, scope: !476)
!506 = !DILocation(line: 312, column: 21, scope: !507)
!507 = distinct !DILexicalBlock(scope: !502, file: !74, line: 311, column: 17)
!508 = !DILocation(line: 314, column: 39, scope: !476)
!509 = !DILocation(line: 314, column: 32, scope: !476)
!510 = !DILocation(line: 314, column: 30, scope: !476)
!511 = !DILocation(line: 315, column: 21, scope: !512)
!512 = distinct !DILexicalBlock(scope: !476, file: !74, line: 315, column: 21)
!513 = !DILocation(line: 315, column: 34, scope: !512)
!514 = !DILocation(line: 315, column: 21, scope: !476)
!515 = !DILocation(line: 317, column: 21, scope: !516)
!516 = distinct !DILexicalBlock(scope: !512, file: !74, line: 316, column: 17)
!517 = !DILocation(line: 320, column: 35, scope: !476)
!518 = !DILocation(line: 320, column: 49, scope: !476)
!519 = !DILocation(line: 320, column: 30, scope: !476)
!520 = !DILocation(line: 320, column: 28, scope: !476)
!521 = !DILocation(line: 321, column: 21, scope: !522)
!522 = distinct !DILexicalBlock(scope: !476, file: !74, line: 321, column: 21)
!523 = !DILocation(line: 321, column: 32, scope: !522)
!524 = !DILocation(line: 321, column: 48, scope: !522)
!525 = !DILocation(line: 321, column: 51, scope: !522)
!526 = !DILocation(line: 321, column: 62, scope: !522)
!527 = !DILocation(line: 321, column: 21, scope: !476)
!528 = !DILocation(line: 323, column: 21, scope: !529)
!529 = distinct !DILexicalBlock(scope: !522, file: !74, line: 322, column: 17)
!530 = !DILocation(line: 326, column: 29, scope: !476)
!531 = !DILocation(line: 326, column: 17, scope: !476)
!532 = !DILocation(line: 326, column: 41, scope: !476)
!533 = !DILocation(line: 328, column: 29, scope: !476)
!534 = !DILocation(line: 328, column: 24, scope: !476)
!535 = !DILocation(line: 328, column: 22, scope: !476)
!536 = !DILocation(line: 329, column: 13, scope: !476)
!537 = !DILocation(line: 331, column: 17, scope: !538)
!538 = distinct !DILexicalBlock(scope: !463, file: !74, line: 331, column: 17)
!539 = !DILocation(line: 331, column: 30, scope: !538)
!540 = !DILocation(line: 331, column: 17, scope: !463)
!541 = !DILocation(line: 333, column: 30, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !74, line: 332, column: 13)
!543 = !DILocation(line: 333, column: 17, scope: !542)
!544 = !DILocation(line: 334, column: 13, scope: !542)
!545 = !DILocation(line: 335, column: 17, scope: !546)
!546 = distinct !DILexicalBlock(scope: !463, file: !74, line: 335, column: 17)
!547 = !DILocation(line: 335, column: 30, scope: !546)
!548 = !DILocation(line: 335, column: 17, scope: !463)
!549 = !DILocation(line: 337, column: 30, scope: !550)
!550 = distinct !DILexicalBlock(scope: !546, file: !74, line: 336, column: 13)
!551 = !DILocation(line: 337, column: 17, scope: !550)
!552 = !DILocation(line: 338, column: 13, scope: !550)
!553 = !DILocation(line: 346, column: 5, scope: !464)
!554 = !DILocation(line: 347, column: 8, scope: !555)
!555 = distinct !DILexicalBlock(scope: !454, file: !74, line: 347, column: 8)
!556 = !DILocation(line: 347, column: 18, scope: !555)
!557 = !DILocation(line: 347, column: 8, scope: !454)
!558 = !DILocalVariable(name: "i", scope: !559, file: !74, line: 350, type: !65)
!559 = distinct !DILexicalBlock(scope: !560, file: !74, line: 349, column: 9)
!560 = distinct !DILexicalBlock(scope: !555, file: !74, line: 348, column: 5)
!561 = !DILocation(line: 350, column: 17, scope: !559)
!562 = !DILocalVariable(name: "buffer", scope: !559, file: !74, line: 351, type: !64)
!563 = !DILocation(line: 351, column: 19, scope: !559)
!564 = !DILocation(line: 351, column: 35, scope: !559)
!565 = !DILocation(line: 351, column: 28, scope: !559)
!566 = !DILocation(line: 352, column: 17, scope: !567)
!567 = distinct !DILexicalBlock(scope: !559, file: !74, line: 352, column: 17)
!568 = !DILocation(line: 352, column: 24, scope: !567)
!569 = !DILocation(line: 352, column: 17, scope: !559)
!570 = !DILocation(line: 352, column: 34, scope: !571)
!571 = distinct !DILexicalBlock(scope: !567, file: !74, line: 352, column: 33)
!572 = !DILocation(line: 354, column: 20, scope: !573)
!573 = distinct !DILexicalBlock(scope: !559, file: !74, line: 354, column: 13)
!574 = !DILocation(line: 354, column: 18, scope: !573)
!575 = !DILocation(line: 354, column: 25, scope: !576)
!576 = distinct !DILexicalBlock(scope: !573, file: !74, line: 354, column: 13)
!577 = !DILocation(line: 354, column: 27, scope: !576)
!578 = !DILocation(line: 354, column: 13, scope: !573)
!579 = !DILocation(line: 356, column: 17, scope: !580)
!580 = distinct !DILexicalBlock(scope: !576, file: !74, line: 355, column: 13)
!581 = !DILocation(line: 356, column: 24, scope: !580)
!582 = !DILocation(line: 356, column: 27, scope: !580)
!583 = !DILocation(line: 357, column: 13, scope: !580)
!584 = !DILocation(line: 354, column: 34, scope: !576)
!585 = !DILocation(line: 354, column: 13, scope: !576)
!586 = distinct !{!586, !578, !587, !227}
!587 = !DILocation(line: 357, column: 13, scope: !573)
!588 = !DILocation(line: 359, column: 17, scope: !589)
!589 = distinct !DILexicalBlock(scope: !559, file: !74, line: 359, column: 17)
!590 = !DILocation(line: 359, column: 22, scope: !589)
!591 = !DILocation(line: 359, column: 27, scope: !589)
!592 = !DILocation(line: 359, column: 30, scope: !589)
!593 = !DILocation(line: 359, column: 35, scope: !589)
!594 = !DILocation(line: 359, column: 17, scope: !559)
!595 = !DILocation(line: 361, column: 17, scope: !596)
!596 = distinct !DILexicalBlock(scope: !589, file: !74, line: 360, column: 13)
!597 = !DILocation(line: 361, column: 24, scope: !596)
!598 = !DILocation(line: 361, column: 30, scope: !596)
!599 = !DILocation(line: 363, column: 23, scope: !600)
!600 = distinct !DILexicalBlock(scope: !596, file: !74, line: 363, column: 17)
!601 = !DILocation(line: 363, column: 21, scope: !600)
!602 = !DILocation(line: 363, column: 28, scope: !603)
!603 = distinct !DILexicalBlock(scope: !600, file: !74, line: 363, column: 17)
!604 = !DILocation(line: 363, column: 30, scope: !603)
!605 = !DILocation(line: 363, column: 17, scope: !600)
!606 = !DILocation(line: 365, column: 34, scope: !607)
!607 = distinct !DILexicalBlock(scope: !603, file: !74, line: 364, column: 17)
!608 = !DILocation(line: 365, column: 41, scope: !607)
!609 = !DILocation(line: 365, column: 21, scope: !607)
!610 = !DILocation(line: 366, column: 17, scope: !607)
!611 = !DILocation(line: 363, column: 37, scope: !603)
!612 = !DILocation(line: 363, column: 17, scope: !603)
!613 = distinct !{!613, !605, !614, !227}
!614 = !DILocation(line: 366, column: 17, scope: !600)
!615 = !DILocation(line: 367, column: 13, scope: !596)
!616 = !DILocation(line: 370, column: 17, scope: !617)
!617 = distinct !DILexicalBlock(scope: !589, file: !74, line: 369, column: 13)
!618 = !DILocation(line: 372, column: 18, scope: !559)
!619 = !DILocation(line: 372, column: 13, scope: !559)
!620 = !DILocation(line: 374, column: 5, scope: !560)
!621 = !DILocation(line: 375, column: 1, scope: !454)
!622 = distinct !DISubprogram(name: "goodG2B1", scope: !74, file: !74, line: 378, type: !75, scopeLine: 379, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!623 = !DILocalVariable(name: "data", scope: !622, file: !74, line: 380, type: !65)
!624 = !DILocation(line: 380, column: 9, scope: !622)
!625 = !DILocation(line: 382, column: 10, scope: !622)
!626 = !DILocation(line: 383, column: 8, scope: !627)
!627 = distinct !DILexicalBlock(scope: !622, file: !74, line: 383, column: 8)
!628 = !DILocation(line: 383, column: 18, scope: !627)
!629 = !DILocation(line: 383, column: 8, scope: !622)
!630 = !DILocation(line: 386, column: 9, scope: !631)
!631 = distinct !DILexicalBlock(scope: !627, file: !74, line: 384, column: 5)
!632 = !DILocation(line: 387, column: 5, scope: !631)
!633 = !DILocation(line: 392, column: 14, scope: !634)
!634 = distinct !DILexicalBlock(scope: !627, file: !74, line: 389, column: 5)
!635 = !DILocation(line: 394, column: 8, scope: !636)
!636 = distinct !DILexicalBlock(scope: !622, file: !74, line: 394, column: 8)
!637 = !DILocation(line: 394, column: 18, scope: !636)
!638 = !DILocation(line: 394, column: 8, scope: !622)
!639 = !DILocalVariable(name: "i", scope: !640, file: !74, line: 397, type: !65)
!640 = distinct !DILexicalBlock(scope: !641, file: !74, line: 396, column: 9)
!641 = distinct !DILexicalBlock(scope: !636, file: !74, line: 395, column: 5)
!642 = !DILocation(line: 397, column: 17, scope: !640)
!643 = !DILocalVariable(name: "buffer", scope: !640, file: !74, line: 398, type: !64)
!644 = !DILocation(line: 398, column: 19, scope: !640)
!645 = !DILocation(line: 398, column: 35, scope: !640)
!646 = !DILocation(line: 398, column: 28, scope: !640)
!647 = !DILocation(line: 399, column: 17, scope: !648)
!648 = distinct !DILexicalBlock(scope: !640, file: !74, line: 399, column: 17)
!649 = !DILocation(line: 399, column: 24, scope: !648)
!650 = !DILocation(line: 399, column: 17, scope: !640)
!651 = !DILocation(line: 399, column: 34, scope: !652)
!652 = distinct !DILexicalBlock(scope: !648, file: !74, line: 399, column: 33)
!653 = !DILocation(line: 401, column: 20, scope: !654)
!654 = distinct !DILexicalBlock(scope: !640, file: !74, line: 401, column: 13)
!655 = !DILocation(line: 401, column: 18, scope: !654)
!656 = !DILocation(line: 401, column: 25, scope: !657)
!657 = distinct !DILexicalBlock(scope: !654, file: !74, line: 401, column: 13)
!658 = !DILocation(line: 401, column: 27, scope: !657)
!659 = !DILocation(line: 401, column: 13, scope: !654)
!660 = !DILocation(line: 403, column: 17, scope: !661)
!661 = distinct !DILexicalBlock(scope: !657, file: !74, line: 402, column: 13)
!662 = !DILocation(line: 403, column: 24, scope: !661)
!663 = !DILocation(line: 403, column: 27, scope: !661)
!664 = !DILocation(line: 404, column: 13, scope: !661)
!665 = !DILocation(line: 401, column: 34, scope: !657)
!666 = !DILocation(line: 401, column: 13, scope: !657)
!667 = distinct !{!667, !659, !668, !227}
!668 = !DILocation(line: 404, column: 13, scope: !654)
!669 = !DILocation(line: 407, column: 17, scope: !670)
!670 = distinct !DILexicalBlock(scope: !640, file: !74, line: 407, column: 17)
!671 = !DILocation(line: 407, column: 22, scope: !670)
!672 = !DILocation(line: 407, column: 17, scope: !640)
!673 = !DILocation(line: 409, column: 17, scope: !674)
!674 = distinct !DILexicalBlock(scope: !670, file: !74, line: 408, column: 13)
!675 = !DILocation(line: 409, column: 24, scope: !674)
!676 = !DILocation(line: 409, column: 30, scope: !674)
!677 = !DILocation(line: 411, column: 23, scope: !678)
!678 = distinct !DILexicalBlock(scope: !674, file: !74, line: 411, column: 17)
!679 = !DILocation(line: 411, column: 21, scope: !678)
!680 = !DILocation(line: 411, column: 28, scope: !681)
!681 = distinct !DILexicalBlock(scope: !678, file: !74, line: 411, column: 17)
!682 = !DILocation(line: 411, column: 30, scope: !681)
!683 = !DILocation(line: 411, column: 17, scope: !678)
!684 = !DILocation(line: 413, column: 34, scope: !685)
!685 = distinct !DILexicalBlock(scope: !681, file: !74, line: 412, column: 17)
!686 = !DILocation(line: 413, column: 41, scope: !685)
!687 = !DILocation(line: 413, column: 21, scope: !685)
!688 = !DILocation(line: 414, column: 17, scope: !685)
!689 = !DILocation(line: 411, column: 37, scope: !681)
!690 = !DILocation(line: 411, column: 17, scope: !681)
!691 = distinct !{!691, !683, !692, !227}
!692 = !DILocation(line: 414, column: 17, scope: !678)
!693 = !DILocation(line: 415, column: 13, scope: !674)
!694 = !DILocation(line: 418, column: 17, scope: !695)
!695 = distinct !DILexicalBlock(scope: !670, file: !74, line: 417, column: 13)
!696 = !DILocation(line: 420, column: 18, scope: !640)
!697 = !DILocation(line: 420, column: 13, scope: !640)
!698 = !DILocation(line: 422, column: 5, scope: !641)
!699 = !DILocation(line: 423, column: 1, scope: !622)
!700 = distinct !DISubprogram(name: "goodG2B2", scope: !74, file: !74, line: 426, type: !75, scopeLine: 427, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!701 = !DILocalVariable(name: "data", scope: !700, file: !74, line: 428, type: !65)
!702 = !DILocation(line: 428, column: 9, scope: !700)
!703 = !DILocation(line: 430, column: 10, scope: !700)
!704 = !DILocation(line: 431, column: 8, scope: !705)
!705 = distinct !DILexicalBlock(scope: !700, file: !74, line: 431, column: 8)
!706 = !DILocation(line: 431, column: 18, scope: !705)
!707 = !DILocation(line: 431, column: 8, scope: !700)
!708 = !DILocation(line: 435, column: 14, scope: !709)
!709 = distinct !DILexicalBlock(scope: !705, file: !74, line: 432, column: 5)
!710 = !DILocation(line: 436, column: 5, scope: !709)
!711 = !DILocation(line: 437, column: 8, scope: !712)
!712 = distinct !DILexicalBlock(scope: !700, file: !74, line: 437, column: 8)
!713 = !DILocation(line: 437, column: 18, scope: !712)
!714 = !DILocation(line: 437, column: 8, scope: !700)
!715 = !DILocalVariable(name: "i", scope: !716, file: !74, line: 440, type: !65)
!716 = distinct !DILexicalBlock(scope: !717, file: !74, line: 439, column: 9)
!717 = distinct !DILexicalBlock(scope: !712, file: !74, line: 438, column: 5)
!718 = !DILocation(line: 440, column: 17, scope: !716)
!719 = !DILocalVariable(name: "buffer", scope: !716, file: !74, line: 441, type: !64)
!720 = !DILocation(line: 441, column: 19, scope: !716)
!721 = !DILocation(line: 441, column: 35, scope: !716)
!722 = !DILocation(line: 441, column: 28, scope: !716)
!723 = !DILocation(line: 442, column: 17, scope: !724)
!724 = distinct !DILexicalBlock(scope: !716, file: !74, line: 442, column: 17)
!725 = !DILocation(line: 442, column: 24, scope: !724)
!726 = !DILocation(line: 442, column: 17, scope: !716)
!727 = !DILocation(line: 442, column: 34, scope: !728)
!728 = distinct !DILexicalBlock(scope: !724, file: !74, line: 442, column: 33)
!729 = !DILocation(line: 444, column: 20, scope: !730)
!730 = distinct !DILexicalBlock(scope: !716, file: !74, line: 444, column: 13)
!731 = !DILocation(line: 444, column: 18, scope: !730)
!732 = !DILocation(line: 444, column: 25, scope: !733)
!733 = distinct !DILexicalBlock(scope: !730, file: !74, line: 444, column: 13)
!734 = !DILocation(line: 444, column: 27, scope: !733)
!735 = !DILocation(line: 444, column: 13, scope: !730)
!736 = !DILocation(line: 446, column: 17, scope: !737)
!737 = distinct !DILexicalBlock(scope: !733, file: !74, line: 445, column: 13)
!738 = !DILocation(line: 446, column: 24, scope: !737)
!739 = !DILocation(line: 446, column: 27, scope: !737)
!740 = !DILocation(line: 447, column: 13, scope: !737)
!741 = !DILocation(line: 444, column: 34, scope: !733)
!742 = !DILocation(line: 444, column: 13, scope: !733)
!743 = distinct !{!743, !735, !744, !227}
!744 = !DILocation(line: 447, column: 13, scope: !730)
!745 = !DILocation(line: 450, column: 17, scope: !746)
!746 = distinct !DILexicalBlock(scope: !716, file: !74, line: 450, column: 17)
!747 = !DILocation(line: 450, column: 22, scope: !746)
!748 = !DILocation(line: 450, column: 17, scope: !716)
!749 = !DILocation(line: 452, column: 17, scope: !750)
!750 = distinct !DILexicalBlock(scope: !746, file: !74, line: 451, column: 13)
!751 = !DILocation(line: 452, column: 24, scope: !750)
!752 = !DILocation(line: 452, column: 30, scope: !750)
!753 = !DILocation(line: 454, column: 23, scope: !754)
!754 = distinct !DILexicalBlock(scope: !750, file: !74, line: 454, column: 17)
!755 = !DILocation(line: 454, column: 21, scope: !754)
!756 = !DILocation(line: 454, column: 28, scope: !757)
!757 = distinct !DILexicalBlock(scope: !754, file: !74, line: 454, column: 17)
!758 = !DILocation(line: 454, column: 30, scope: !757)
!759 = !DILocation(line: 454, column: 17, scope: !754)
!760 = !DILocation(line: 456, column: 34, scope: !761)
!761 = distinct !DILexicalBlock(scope: !757, file: !74, line: 455, column: 17)
!762 = !DILocation(line: 456, column: 41, scope: !761)
!763 = !DILocation(line: 456, column: 21, scope: !761)
!764 = !DILocation(line: 457, column: 17, scope: !761)
!765 = !DILocation(line: 454, column: 37, scope: !757)
!766 = !DILocation(line: 454, column: 17, scope: !757)
!767 = distinct !{!767, !759, !768, !227}
!768 = !DILocation(line: 457, column: 17, scope: !754)
!769 = !DILocation(line: 458, column: 13, scope: !750)
!770 = !DILocation(line: 461, column: 17, scope: !771)
!771 = distinct !DILexicalBlock(scope: !746, file: !74, line: 460, column: 13)
!772 = !DILocation(line: 463, column: 18, scope: !716)
!773 = !DILocation(line: 463, column: 13, scope: !716)
!774 = !DILocation(line: 465, column: 5, scope: !717)
!775 = !DILocation(line: 466, column: 1, scope: !700)
