; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_bad() #0 !dbg !77 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i32 -1, i32* %data, align 4, !dbg !83
  %0 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp eq i32 %0, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.end35, !dbg !87

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !88, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !92, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 -1, i32* %listenSocket, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 -1, i32* %acceptSocket, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  br label %do.body, !dbg !116

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !117
  store i32 %call, i32* %listenSocket, align 4, !dbg !119
  %1 = load i32, i32* %listenSocket, align 4, !dbg !120
  %cmp1 = icmp eq i32 %1, -1, !dbg !122
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !123

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !124

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !126
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !127
  store i16 2, i16* %sin_family, align 4, !dbg !128
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !129
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !130
  store i32 0, i32* %s_addr, align 4, !dbg !131
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !132
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !133
  store i16 %call3, i16* %sin_port, align 2, !dbg !134
  %3 = load i32, i32* %listenSocket, align 4, !dbg !135
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !137
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !138
  %cmp5 = icmp eq i32 %call4, -1, !dbg !139
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !140

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !141

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !143
  %call8 = call i32 @listen(i32 %5, i32 5) #8, !dbg !145
  %cmp9 = icmp eq i32 %call8, -1, !dbg !146
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !147

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !148

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !150
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !151
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !152
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !153
  %cmp13 = icmp eq i32 %7, -1, !dbg !155
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !156

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !157

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !159
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !160
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !161
  %conv = trunc i64 %call16 to i32, !dbg !161
  store i32 %conv, i32* %recvResult, align 4, !dbg !162
  %9 = load i32, i32* %recvResult, align 4, !dbg !163
  %cmp17 = icmp eq i32 %9, -1, !dbg !165
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !166

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !167
  %cmp19 = icmp eq i32 %10, 0, !dbg !168
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !169

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !170

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !172
  %idxprom = sext i32 %11 to i64, !dbg !173
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !173
  store i8 0, i8* %arrayidx, align 1, !dbg !174
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !175
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !176
  store i32 %call24, i32* %data, align 4, !dbg !177
  br label %do.end, !dbg !178

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !179
  %cmp25 = icmp ne i32 %12, -1, !dbg !181
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !182

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !183
  %call28 = call i32 @close(i32 %13), !dbg !185
  br label %if.end29, !dbg !186

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !187
  %cmp30 = icmp ne i32 %14, -1, !dbg !189
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !190

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !191
  %call33 = call i32 @close(i32 %15), !dbg !193
  br label %if.end34, !dbg !194

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !195

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !196
  %cmp36 = icmp eq i32 %16, 5, !dbg !198
  br i1 %cmp36, label %if.then38, label %if.end63, !dbg !199

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !200, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !204, metadata !DIExpression()), !dbg !205
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !206
  %17 = bitcast i8* %call39 to i32*, !dbg !207
  store i32* %17, i32** %buffer, align 8, !dbg !205
  %18 = load i32*, i32** %buffer, align 8, !dbg !208
  %cmp40 = icmp eq i32* %18, null, !dbg !210
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !211

if.then42:                                        ; preds = %if.then38
  call void @exit(i32 -1) #11, !dbg !212
  unreachable, !dbg !212

if.end43:                                         ; preds = %if.then38
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.inc, %if.end43
  %19 = load i32, i32* %i, align 4, !dbg !217
  %cmp44 = icmp slt i32 %19, 10, !dbg !219
  br i1 %cmp44, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !221
  %21 = load i32, i32* %i, align 4, !dbg !223
  %idxprom46 = sext i32 %21 to i64, !dbg !221
  %arrayidx47 = getelementptr inbounds i32, i32* %20, i64 %idxprom46, !dbg !221
  store i32 0, i32* %arrayidx47, align 4, !dbg !224
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !226
  %inc = add nsw i32 %22, 1, !dbg !226
  store i32 %inc, i32* %i, align 4, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !231
  %cmp48 = icmp sge i32 %23, 0, !dbg !233
  br i1 %cmp48, label %if.then50, label %if.else, !dbg !234

if.then50:                                        ; preds = %for.end
  %24 = load i32*, i32** %buffer, align 8, !dbg !235
  %25 = load i32, i32* %data, align 4, !dbg !237
  %idxprom51 = sext i32 %25 to i64, !dbg !235
  %arrayidx52 = getelementptr inbounds i32, i32* %24, i64 %idxprom51, !dbg !235
  store i32 1, i32* %arrayidx52, align 4, !dbg !238
  store i32 0, i32* %i, align 4, !dbg !239
  br label %for.cond53, !dbg !241

for.cond53:                                       ; preds = %for.inc59, %if.then50
  %26 = load i32, i32* %i, align 4, !dbg !242
  %cmp54 = icmp slt i32 %26, 10, !dbg !244
  br i1 %cmp54, label %for.body56, label %for.end61, !dbg !245

for.body56:                                       ; preds = %for.cond53
  %27 = load i32*, i32** %buffer, align 8, !dbg !246
  %28 = load i32, i32* %i, align 4, !dbg !248
  %idxprom57 = sext i32 %28 to i64, !dbg !246
  %arrayidx58 = getelementptr inbounds i32, i32* %27, i64 %idxprom57, !dbg !246
  %29 = load i32, i32* %arrayidx58, align 4, !dbg !246
  call void @printIntLine(i32 %29), !dbg !249
  br label %for.inc59, !dbg !250

for.inc59:                                        ; preds = %for.body56
  %30 = load i32, i32* %i, align 4, !dbg !251
  %inc60 = add nsw i32 %30, 1, !dbg !251
  store i32 %inc60, i32* %i, align 4, !dbg !251
  br label %for.cond53, !dbg !252, !llvm.loop !253

for.end61:                                        ; preds = %for.cond53
  br label %if.end62, !dbg !255

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !256
  br label %if.end62

if.end62:                                         ; preds = %if.else, %for.end61
  %31 = load i32*, i32** %buffer, align 8, !dbg !258
  %32 = bitcast i32* %31 to i8*, !dbg !258
  call void @free(i8* %32) #8, !dbg !259
  br label %if.end63, !dbg !260

if.end63:                                         ; preds = %if.end62, %if.end35
  ret void, !dbg !261
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_good() #0 !dbg !262 {
entry:
  call void @goodB2G1(), !dbg !263
  call void @goodB2G2(), !dbg !264
  call void @goodG2B1(), !dbg !265
  call void @goodG2B2(), !dbg !266
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_good(), !dbg !281
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !282
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !283
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_bad(), !dbg !284
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !285
  ret i32 0, !dbg !286
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !287 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !288, metadata !DIExpression()), !dbg !289
  store i32 -1, i32* %data, align 4, !dbg !290
  %0 = load i32, i32* @staticFive, align 4, !dbg !291
  %cmp = icmp eq i32 %0, 5, !dbg !293
  br i1 %cmp, label %if.then, label %if.end35, !dbg !294

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !295, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !299, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !301, metadata !DIExpression()), !dbg !302
  store i32 -1, i32* %listenSocket, align 4, !dbg !302
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !303, metadata !DIExpression()), !dbg !304
  store i32 -1, i32* %acceptSocket, align 4, !dbg !304
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !305, metadata !DIExpression()), !dbg !306
  br label %do.body, !dbg !307

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !308
  store i32 %call, i32* %listenSocket, align 4, !dbg !310
  %1 = load i32, i32* %listenSocket, align 4, !dbg !311
  %cmp1 = icmp eq i32 %1, -1, !dbg !313
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !314

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !315

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !317
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !317
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !318
  store i16 2, i16* %sin_family, align 4, !dbg !319
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !320
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !321
  store i32 0, i32* %s_addr, align 4, !dbg !322
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !323
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !324
  store i16 %call3, i16* %sin_port, align 2, !dbg !325
  %3 = load i32, i32* %listenSocket, align 4, !dbg !326
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !328
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !329
  %cmp5 = icmp eq i32 %call4, -1, !dbg !330
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !331

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !332

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !334
  %call8 = call i32 @listen(i32 %5, i32 5) #8, !dbg !336
  %cmp9 = icmp eq i32 %call8, -1, !dbg !337
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !338

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !339

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !341
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !342
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !343
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !344
  %cmp13 = icmp eq i32 %7, -1, !dbg !346
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !347

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !348

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !350
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !351
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !352
  %conv = trunc i64 %call16 to i32, !dbg !352
  store i32 %conv, i32* %recvResult, align 4, !dbg !353
  %9 = load i32, i32* %recvResult, align 4, !dbg !354
  %cmp17 = icmp eq i32 %9, -1, !dbg !356
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !357

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !358
  %cmp19 = icmp eq i32 %10, 0, !dbg !359
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !360

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !361

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !363
  %idxprom = sext i32 %11 to i64, !dbg !364
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !364
  store i8 0, i8* %arrayidx, align 1, !dbg !365
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !366
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !367
  store i32 %call24, i32* %data, align 4, !dbg !368
  br label %do.end, !dbg !369

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !370
  %cmp25 = icmp ne i32 %12, -1, !dbg !372
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !373

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !374
  %call28 = call i32 @close(i32 %13), !dbg !376
  br label %if.end29, !dbg !377

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !378
  %cmp30 = icmp ne i32 %14, -1, !dbg !380
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !381

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !382
  %call33 = call i32 @close(i32 %15), !dbg !384
  br label %if.end34, !dbg !385

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !386

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !387
  %cmp36 = icmp ne i32 %16, 5, !dbg !389
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !390

if.then38:                                        ; preds = %if.end35
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !391
  br label %if.end66, !dbg !393

if.else:                                          ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !394, metadata !DIExpression()), !dbg !397
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !398, metadata !DIExpression()), !dbg !399
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !400
  %17 = bitcast i8* %call39 to i32*, !dbg !401
  store i32* %17, i32** %buffer, align 8, !dbg !399
  %18 = load i32*, i32** %buffer, align 8, !dbg !402
  %cmp40 = icmp eq i32* %18, null, !dbg !404
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !405

if.then42:                                        ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !406
  unreachable, !dbg !406

if.end43:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !408
  br label %for.cond, !dbg !410

for.cond:                                         ; preds = %for.inc, %if.end43
  %19 = load i32, i32* %i, align 4, !dbg !411
  %cmp44 = icmp slt i32 %19, 10, !dbg !413
  br i1 %cmp44, label %for.body, label %for.end, !dbg !414

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !415
  %21 = load i32, i32* %i, align 4, !dbg !417
  %idxprom46 = sext i32 %21 to i64, !dbg !415
  %arrayidx47 = getelementptr inbounds i32, i32* %20, i64 %idxprom46, !dbg !415
  store i32 0, i32* %arrayidx47, align 4, !dbg !418
  br label %for.inc, !dbg !419

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !420
  %inc = add nsw i32 %22, 1, !dbg !420
  store i32 %inc, i32* %i, align 4, !dbg !420
  br label %for.cond, !dbg !421, !llvm.loop !422

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !424
  %cmp48 = icmp sge i32 %23, 0, !dbg !426
  br i1 %cmp48, label %land.lhs.true, label %if.else64, !dbg !427

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data, align 4, !dbg !428
  %cmp50 = icmp slt i32 %24, 10, !dbg !429
  br i1 %cmp50, label %if.then52, label %if.else64, !dbg !430

if.then52:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !431
  %26 = load i32, i32* %data, align 4, !dbg !433
  %idxprom53 = sext i32 %26 to i64, !dbg !431
  %arrayidx54 = getelementptr inbounds i32, i32* %25, i64 %idxprom53, !dbg !431
  store i32 1, i32* %arrayidx54, align 4, !dbg !434
  store i32 0, i32* %i, align 4, !dbg !435
  br label %for.cond55, !dbg !437

for.cond55:                                       ; preds = %for.inc61, %if.then52
  %27 = load i32, i32* %i, align 4, !dbg !438
  %cmp56 = icmp slt i32 %27, 10, !dbg !440
  br i1 %cmp56, label %for.body58, label %for.end63, !dbg !441

for.body58:                                       ; preds = %for.cond55
  %28 = load i32*, i32** %buffer, align 8, !dbg !442
  %29 = load i32, i32* %i, align 4, !dbg !444
  %idxprom59 = sext i32 %29 to i64, !dbg !442
  %arrayidx60 = getelementptr inbounds i32, i32* %28, i64 %idxprom59, !dbg !442
  %30 = load i32, i32* %arrayidx60, align 4, !dbg !442
  call void @printIntLine(i32 %30), !dbg !445
  br label %for.inc61, !dbg !446

for.inc61:                                        ; preds = %for.body58
  %31 = load i32, i32* %i, align 4, !dbg !447
  %inc62 = add nsw i32 %31, 1, !dbg !447
  store i32 %inc62, i32* %i, align 4, !dbg !447
  br label %for.cond55, !dbg !448, !llvm.loop !449

for.end63:                                        ; preds = %for.cond55
  br label %if.end65, !dbg !451

if.else64:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !452
  br label %if.end65

if.end65:                                         ; preds = %if.else64, %for.end63
  %32 = load i32*, i32** %buffer, align 8, !dbg !454
  %33 = bitcast i32* %32 to i8*, !dbg !454
  call void @free(i8* %33) #8, !dbg !455
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %if.then38
  ret void, !dbg !456
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !457 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !458, metadata !DIExpression()), !dbg !459
  store i32 -1, i32* %data, align 4, !dbg !460
  %0 = load i32, i32* @staticFive, align 4, !dbg !461
  %cmp = icmp eq i32 %0, 5, !dbg !463
  br i1 %cmp, label %if.then, label %if.end35, !dbg !464

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !465, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !469, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !471, metadata !DIExpression()), !dbg !472
  store i32 -1, i32* %listenSocket, align 4, !dbg !472
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !473, metadata !DIExpression()), !dbg !474
  store i32 -1, i32* %acceptSocket, align 4, !dbg !474
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !475, metadata !DIExpression()), !dbg !476
  br label %do.body, !dbg !477

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !478
  store i32 %call, i32* %listenSocket, align 4, !dbg !480
  %1 = load i32, i32* %listenSocket, align 4, !dbg !481
  %cmp1 = icmp eq i32 %1, -1, !dbg !483
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !484

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !485

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !487
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !487
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !488
  store i16 2, i16* %sin_family, align 4, !dbg !489
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !490
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !491
  store i32 0, i32* %s_addr, align 4, !dbg !492
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !493
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !494
  store i16 %call3, i16* %sin_port, align 2, !dbg !495
  %3 = load i32, i32* %listenSocket, align 4, !dbg !496
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !498
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !499
  %cmp5 = icmp eq i32 %call4, -1, !dbg !500
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !501

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !502

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !504
  %call8 = call i32 @listen(i32 %5, i32 5) #8, !dbg !506
  %cmp9 = icmp eq i32 %call8, -1, !dbg !507
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !508

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !509

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !511
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !512
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !513
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !514
  %cmp13 = icmp eq i32 %7, -1, !dbg !516
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !517

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !518

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !520
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !521
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !522
  %conv = trunc i64 %call16 to i32, !dbg !522
  store i32 %conv, i32* %recvResult, align 4, !dbg !523
  %9 = load i32, i32* %recvResult, align 4, !dbg !524
  %cmp17 = icmp eq i32 %9, -1, !dbg !526
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !527

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !528
  %cmp19 = icmp eq i32 %10, 0, !dbg !529
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !530

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !531

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !533
  %idxprom = sext i32 %11 to i64, !dbg !534
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !534
  store i8 0, i8* %arrayidx, align 1, !dbg !535
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !536
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !537
  store i32 %call24, i32* %data, align 4, !dbg !538
  br label %do.end, !dbg !539

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !540
  %cmp25 = icmp ne i32 %12, -1, !dbg !542
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !543

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !544
  %call28 = call i32 @close(i32 %13), !dbg !546
  br label %if.end29, !dbg !547

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !548
  %cmp30 = icmp ne i32 %14, -1, !dbg !550
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !551

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !552
  %call33 = call i32 @close(i32 %15), !dbg !554
  br label %if.end34, !dbg !555

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !556

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !557
  %cmp36 = icmp eq i32 %16, 5, !dbg !559
  br i1 %cmp36, label %if.then38, label %if.end65, !dbg !560

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !561, metadata !DIExpression()), !dbg !564
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !565, metadata !DIExpression()), !dbg !566
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !567
  %17 = bitcast i8* %call39 to i32*, !dbg !568
  store i32* %17, i32** %buffer, align 8, !dbg !566
  %18 = load i32*, i32** %buffer, align 8, !dbg !569
  %cmp40 = icmp eq i32* %18, null, !dbg !571
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !572

if.then42:                                        ; preds = %if.then38
  call void @exit(i32 -1) #11, !dbg !573
  unreachable, !dbg !573

if.end43:                                         ; preds = %if.then38
  store i32 0, i32* %i, align 4, !dbg !575
  br label %for.cond, !dbg !577

for.cond:                                         ; preds = %for.inc, %if.end43
  %19 = load i32, i32* %i, align 4, !dbg !578
  %cmp44 = icmp slt i32 %19, 10, !dbg !580
  br i1 %cmp44, label %for.body, label %for.end, !dbg !581

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !582
  %21 = load i32, i32* %i, align 4, !dbg !584
  %idxprom46 = sext i32 %21 to i64, !dbg !582
  %arrayidx47 = getelementptr inbounds i32, i32* %20, i64 %idxprom46, !dbg !582
  store i32 0, i32* %arrayidx47, align 4, !dbg !585
  br label %for.inc, !dbg !586

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !587
  %inc = add nsw i32 %22, 1, !dbg !587
  store i32 %inc, i32* %i, align 4, !dbg !587
  br label %for.cond, !dbg !588, !llvm.loop !589

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !591
  %cmp48 = icmp sge i32 %23, 0, !dbg !593
  br i1 %cmp48, label %land.lhs.true, label %if.else, !dbg !594

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data, align 4, !dbg !595
  %cmp50 = icmp slt i32 %24, 10, !dbg !596
  br i1 %cmp50, label %if.then52, label %if.else, !dbg !597

if.then52:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !598
  %26 = load i32, i32* %data, align 4, !dbg !600
  %idxprom53 = sext i32 %26 to i64, !dbg !598
  %arrayidx54 = getelementptr inbounds i32, i32* %25, i64 %idxprom53, !dbg !598
  store i32 1, i32* %arrayidx54, align 4, !dbg !601
  store i32 0, i32* %i, align 4, !dbg !602
  br label %for.cond55, !dbg !604

for.cond55:                                       ; preds = %for.inc61, %if.then52
  %27 = load i32, i32* %i, align 4, !dbg !605
  %cmp56 = icmp slt i32 %27, 10, !dbg !607
  br i1 %cmp56, label %for.body58, label %for.end63, !dbg !608

for.body58:                                       ; preds = %for.cond55
  %28 = load i32*, i32** %buffer, align 8, !dbg !609
  %29 = load i32, i32* %i, align 4, !dbg !611
  %idxprom59 = sext i32 %29 to i64, !dbg !609
  %arrayidx60 = getelementptr inbounds i32, i32* %28, i64 %idxprom59, !dbg !609
  %30 = load i32, i32* %arrayidx60, align 4, !dbg !609
  call void @printIntLine(i32 %30), !dbg !612
  br label %for.inc61, !dbg !613

for.inc61:                                        ; preds = %for.body58
  %31 = load i32, i32* %i, align 4, !dbg !614
  %inc62 = add nsw i32 %31, 1, !dbg !614
  store i32 %inc62, i32* %i, align 4, !dbg !614
  br label %for.cond55, !dbg !615, !llvm.loop !616

for.end63:                                        ; preds = %for.cond55
  br label %if.end64, !dbg !618

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !619
  br label %if.end64

if.end64:                                         ; preds = %if.else, %for.end63
  %32 = load i32*, i32** %buffer, align 8, !dbg !621
  %33 = bitcast i32* %32 to i8*, !dbg !621
  call void @free(i8* %33) #8, !dbg !622
  br label %if.end65, !dbg !623

if.end65:                                         ; preds = %if.end64, %if.end35
  ret void, !dbg !624
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !625 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !626, metadata !DIExpression()), !dbg !627
  store i32 -1, i32* %data, align 4, !dbg !628
  %0 = load i32, i32* @staticFive, align 4, !dbg !629
  %cmp = icmp ne i32 %0, 5, !dbg !631
  br i1 %cmp, label %if.then, label %if.else, !dbg !632

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !633
  br label %if.end, !dbg !635

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !636
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !638
  %cmp1 = icmp eq i32 %1, 5, !dbg !640
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !641

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !642, metadata !DIExpression()), !dbg !645
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !646, metadata !DIExpression()), !dbg !647
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !648
  %2 = bitcast i8* %call to i32*, !dbg !649
  store i32* %2, i32** %buffer, align 8, !dbg !647
  %3 = load i32*, i32** %buffer, align 8, !dbg !650
  %cmp3 = icmp eq i32* %3, null, !dbg !652
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !653

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !654
  unreachable, !dbg !654

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !656
  br label %for.cond, !dbg !658

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !659
  %cmp6 = icmp slt i32 %4, 10, !dbg !661
  br i1 %cmp6, label %for.body, label %for.end, !dbg !662

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !663
  %6 = load i32, i32* %i, align 4, !dbg !665
  %idxprom = sext i32 %6 to i64, !dbg !663
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !663
  store i32 0, i32* %arrayidx, align 4, !dbg !666
  br label %for.inc, !dbg !667

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !668
  %inc = add nsw i32 %7, 1, !dbg !668
  store i32 %inc, i32* %i, align 4, !dbg !668
  br label %for.cond, !dbg !669, !llvm.loop !670

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !672
  %cmp7 = icmp sge i32 %8, 0, !dbg !674
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !675

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !676
  %10 = load i32, i32* %data, align 4, !dbg !678
  %idxprom9 = sext i32 %10 to i64, !dbg !676
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !676
  store i32 1, i32* %arrayidx10, align 4, !dbg !679
  store i32 0, i32* %i, align 4, !dbg !680
  br label %for.cond11, !dbg !682

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !683
  %cmp12 = icmp slt i32 %11, 10, !dbg !685
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !686

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !687
  %13 = load i32, i32* %i, align 4, !dbg !689
  %idxprom14 = sext i32 %13 to i64, !dbg !687
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !687
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !687
  call void @printIntLine(i32 %14), !dbg !690
  br label %for.inc16, !dbg !691

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !692
  %inc17 = add nsw i32 %15, 1, !dbg !692
  store i32 %inc17, i32* %i, align 4, !dbg !692
  br label %for.cond11, !dbg !693, !llvm.loop !694

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !696

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !697
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !699
  %17 = bitcast i32* %16 to i8*, !dbg !699
  call void @free(i8* %17) #8, !dbg !700
  br label %if.end21, !dbg !701

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !702
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !703 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !704, metadata !DIExpression()), !dbg !705
  store i32 -1, i32* %data, align 4, !dbg !706
  %0 = load i32, i32* @staticFive, align 4, !dbg !707
  %cmp = icmp eq i32 %0, 5, !dbg !709
  br i1 %cmp, label %if.then, label %if.end, !dbg !710

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !711
  br label %if.end, !dbg !713

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !714
  %cmp1 = icmp eq i32 %1, 5, !dbg !716
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !717

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !718, metadata !DIExpression()), !dbg !721
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !722, metadata !DIExpression()), !dbg !723
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !724
  %2 = bitcast i8* %call to i32*, !dbg !725
  store i32* %2, i32** %buffer, align 8, !dbg !723
  %3 = load i32*, i32** %buffer, align 8, !dbg !726
  %cmp3 = icmp eq i32* %3, null, !dbg !728
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !729

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !730
  unreachable, !dbg !730

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !732
  br label %for.cond, !dbg !734

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !735
  %cmp6 = icmp slt i32 %4, 10, !dbg !737
  br i1 %cmp6, label %for.body, label %for.end, !dbg !738

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !739
  %6 = load i32, i32* %i, align 4, !dbg !741
  %idxprom = sext i32 %6 to i64, !dbg !739
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !739
  store i32 0, i32* %arrayidx, align 4, !dbg !742
  br label %for.inc, !dbg !743

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !744
  %inc = add nsw i32 %7, 1, !dbg !744
  store i32 %inc, i32* %i, align 4, !dbg !744
  br label %for.cond, !dbg !745, !llvm.loop !746

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !748
  %cmp7 = icmp sge i32 %8, 0, !dbg !750
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !751

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !752
  %10 = load i32, i32* %data, align 4, !dbg !754
  %idxprom9 = sext i32 %10 to i64, !dbg !752
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !752
  store i32 1, i32* %arrayidx10, align 4, !dbg !755
  store i32 0, i32* %i, align 4, !dbg !756
  br label %for.cond11, !dbg !758

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !759
  %cmp12 = icmp slt i32 %11, 10, !dbg !761
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !762

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !763
  %13 = load i32, i32* %i, align 4, !dbg !765
  %idxprom14 = sext i32 %13 to i64, !dbg !763
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !763
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !763
  call void @printIntLine(i32 %14), !dbg !766
  br label %for.inc16, !dbg !767

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !768
  %inc17 = add nsw i32 %15, 1, !dbg !768
  store i32 %inc17, i32* %i, align 4, !dbg !768
  br label %for.cond11, !dbg !769, !llvm.loop !770

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !772

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !773
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !775
  %17 = bitcast i32* %16 to i8*, !dbg !775
  call void @free(i8* %17) #8, !dbg !776
  br label %if.end20, !dbg !777

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !778
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
!llvm.module.flags = !{!71, !72, !73, !74, !75}
!llvm.ident = !{!76}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !70, line: 45, type: !67, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !69, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07.c", directory: "/root/SSE-Assessment")
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
!47 = !{!48, !53, !66, !68, !7}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !50, line: 26, baseType: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !52, line: 41, baseType: !7)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !55, line: 175, size: 128, elements: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!56 = !{!57, !61}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !54, file: !55, line: 177, baseType: !58, size: 16)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !59, line: 28, baseType: !60)
!59 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!60 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !54, file: !55, line: 178, baseType: !62, size: 112, offset: 16)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 112, elements: !64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !{!65}
!65 = !DISubrange(count: 14)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!69 = !{!0}
!70 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07.c", directory: "/root/SSE-Assessment")
!71 = !{i32 7, !"Dwarf Version", i32 4}
!72 = !{i32 2, !"Debug Info Version", i32 3}
!73 = !{i32 1, !"wchar_size", i32 4}
!74 = !{i32 7, !"uwtable", i32 1}
!75 = !{i32 7, !"frame-pointer", i32 2}
!76 = !{!"clang version 13.0.0"}
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_bad", scope: !70, file: !70, line: 49, type: !78, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !80)
!78 = !DISubroutineType(types: !79)
!79 = !{null}
!80 = !{}
!81 = !DILocalVariable(name: "data", scope: !77, file: !70, line: 51, type: !67)
!82 = !DILocation(line: 51, column: 9, scope: !77)
!83 = !DILocation(line: 53, column: 10, scope: !77)
!84 = !DILocation(line: 54, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !70, line: 54, column: 8)
!86 = !DILocation(line: 54, column: 18, scope: !85)
!87 = !DILocation(line: 54, column: 8, scope: !77)
!88 = !DILocalVariable(name: "recvResult", scope: !89, file: !70, line: 61, type: !67)
!89 = distinct !DILexicalBlock(scope: !90, file: !70, line: 56, column: 9)
!90 = distinct !DILexicalBlock(scope: !85, file: !70, line: 55, column: 5)
!91 = !DILocation(line: 61, column: 17, scope: !89)
!92 = !DILocalVariable(name: "service", scope: !89, file: !70, line: 62, type: !93)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 237, size: 128, elements: !94)
!94 = !{!95, !96, !100, !104}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !93, file: !19, line: 239, baseType: !58, size: 16)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !93, file: !19, line: 240, baseType: !97, size: 16, offset: 16)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 39, baseType: !60)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !93, file: !19, line: 241, baseType: !101, size: 32, offset: 32)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !102)
!102 = !{!103}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !101, file: !19, line: 33, baseType: !48, size: 32)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !93, file: !19, line: 244, baseType: !105, size: 64, offset: 64)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 64, elements: !107)
!106 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!107 = !{!108}
!108 = !DISubrange(count: 8)
!109 = !DILocation(line: 62, column: 32, scope: !89)
!110 = !DILocalVariable(name: "listenSocket", scope: !89, file: !70, line: 63, type: !67)
!111 = !DILocation(line: 63, column: 20, scope: !89)
!112 = !DILocalVariable(name: "acceptSocket", scope: !89, file: !70, line: 64, type: !67)
!113 = !DILocation(line: 64, column: 20, scope: !89)
!114 = !DILocalVariable(name: "inputBuffer", scope: !89, file: !70, line: 65, type: !62)
!115 = !DILocation(line: 65, column: 18, scope: !89)
!116 = !DILocation(line: 66, column: 13, scope: !89)
!117 = !DILocation(line: 76, column: 32, scope: !118)
!118 = distinct !DILexicalBlock(scope: !89, file: !70, line: 67, column: 13)
!119 = !DILocation(line: 76, column: 30, scope: !118)
!120 = !DILocation(line: 77, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !70, line: 77, column: 21)
!122 = !DILocation(line: 77, column: 34, scope: !121)
!123 = !DILocation(line: 77, column: 21, scope: !118)
!124 = !DILocation(line: 79, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !70, line: 78, column: 17)
!126 = !DILocation(line: 81, column: 17, scope: !118)
!127 = !DILocation(line: 82, column: 25, scope: !118)
!128 = !DILocation(line: 82, column: 36, scope: !118)
!129 = !DILocation(line: 83, column: 25, scope: !118)
!130 = !DILocation(line: 83, column: 34, scope: !118)
!131 = !DILocation(line: 83, column: 41, scope: !118)
!132 = !DILocation(line: 84, column: 36, scope: !118)
!133 = !DILocation(line: 84, column: 25, scope: !118)
!134 = !DILocation(line: 84, column: 34, scope: !118)
!135 = !DILocation(line: 85, column: 26, scope: !136)
!136 = distinct !DILexicalBlock(scope: !118, file: !70, line: 85, column: 21)
!137 = !DILocation(line: 85, column: 40, scope: !136)
!138 = !DILocation(line: 85, column: 21, scope: !136)
!139 = !DILocation(line: 85, column: 85, scope: !136)
!140 = !DILocation(line: 85, column: 21, scope: !118)
!141 = !DILocation(line: 87, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !70, line: 86, column: 17)
!143 = !DILocation(line: 89, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !118, file: !70, line: 89, column: 21)
!145 = !DILocation(line: 89, column: 21, scope: !144)
!146 = !DILocation(line: 89, column: 58, scope: !144)
!147 = !DILocation(line: 89, column: 21, scope: !118)
!148 = !DILocation(line: 91, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !70, line: 90, column: 17)
!150 = !DILocation(line: 93, column: 39, scope: !118)
!151 = !DILocation(line: 93, column: 32, scope: !118)
!152 = !DILocation(line: 93, column: 30, scope: !118)
!153 = !DILocation(line: 94, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !118, file: !70, line: 94, column: 21)
!155 = !DILocation(line: 94, column: 34, scope: !154)
!156 = !DILocation(line: 94, column: 21, scope: !118)
!157 = !DILocation(line: 96, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !70, line: 95, column: 17)
!159 = !DILocation(line: 99, column: 35, scope: !118)
!160 = !DILocation(line: 99, column: 49, scope: !118)
!161 = !DILocation(line: 99, column: 30, scope: !118)
!162 = !DILocation(line: 99, column: 28, scope: !118)
!163 = !DILocation(line: 100, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !118, file: !70, line: 100, column: 21)
!165 = !DILocation(line: 100, column: 32, scope: !164)
!166 = !DILocation(line: 100, column: 48, scope: !164)
!167 = !DILocation(line: 100, column: 51, scope: !164)
!168 = !DILocation(line: 100, column: 62, scope: !164)
!169 = !DILocation(line: 100, column: 21, scope: !118)
!170 = !DILocation(line: 102, column: 21, scope: !171)
!171 = distinct !DILexicalBlock(scope: !164, file: !70, line: 101, column: 17)
!172 = !DILocation(line: 105, column: 29, scope: !118)
!173 = !DILocation(line: 105, column: 17, scope: !118)
!174 = !DILocation(line: 105, column: 41, scope: !118)
!175 = !DILocation(line: 107, column: 29, scope: !118)
!176 = !DILocation(line: 107, column: 24, scope: !118)
!177 = !DILocation(line: 107, column: 22, scope: !118)
!178 = !DILocation(line: 108, column: 13, scope: !118)
!179 = !DILocation(line: 110, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !89, file: !70, line: 110, column: 17)
!181 = !DILocation(line: 110, column: 30, scope: !180)
!182 = !DILocation(line: 110, column: 17, scope: !89)
!183 = !DILocation(line: 112, column: 30, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !70, line: 111, column: 13)
!185 = !DILocation(line: 112, column: 17, scope: !184)
!186 = !DILocation(line: 113, column: 13, scope: !184)
!187 = !DILocation(line: 114, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !89, file: !70, line: 114, column: 17)
!189 = !DILocation(line: 114, column: 30, scope: !188)
!190 = !DILocation(line: 114, column: 17, scope: !89)
!191 = !DILocation(line: 116, column: 30, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !70, line: 115, column: 13)
!193 = !DILocation(line: 116, column: 17, scope: !192)
!194 = !DILocation(line: 117, column: 13, scope: !192)
!195 = !DILocation(line: 125, column: 5, scope: !90)
!196 = !DILocation(line: 126, column: 8, scope: !197)
!197 = distinct !DILexicalBlock(scope: !77, file: !70, line: 126, column: 8)
!198 = !DILocation(line: 126, column: 18, scope: !197)
!199 = !DILocation(line: 126, column: 8, scope: !77)
!200 = !DILocalVariable(name: "i", scope: !201, file: !70, line: 129, type: !67)
!201 = distinct !DILexicalBlock(scope: !202, file: !70, line: 128, column: 9)
!202 = distinct !DILexicalBlock(scope: !197, file: !70, line: 127, column: 5)
!203 = !DILocation(line: 129, column: 17, scope: !201)
!204 = !DILocalVariable(name: "buffer", scope: !201, file: !70, line: 130, type: !66)
!205 = !DILocation(line: 130, column: 19, scope: !201)
!206 = !DILocation(line: 130, column: 35, scope: !201)
!207 = !DILocation(line: 130, column: 28, scope: !201)
!208 = !DILocation(line: 131, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !201, file: !70, line: 131, column: 17)
!210 = !DILocation(line: 131, column: 24, scope: !209)
!211 = !DILocation(line: 131, column: 17, scope: !201)
!212 = !DILocation(line: 131, column: 34, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !70, line: 131, column: 33)
!214 = !DILocation(line: 133, column: 20, scope: !215)
!215 = distinct !DILexicalBlock(scope: !201, file: !70, line: 133, column: 13)
!216 = !DILocation(line: 133, column: 18, scope: !215)
!217 = !DILocation(line: 133, column: 25, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !70, line: 133, column: 13)
!219 = !DILocation(line: 133, column: 27, scope: !218)
!220 = !DILocation(line: 133, column: 13, scope: !215)
!221 = !DILocation(line: 135, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !70, line: 134, column: 13)
!223 = !DILocation(line: 135, column: 24, scope: !222)
!224 = !DILocation(line: 135, column: 27, scope: !222)
!225 = !DILocation(line: 136, column: 13, scope: !222)
!226 = !DILocation(line: 133, column: 34, scope: !218)
!227 = !DILocation(line: 133, column: 13, scope: !218)
!228 = distinct !{!228, !220, !229, !230}
!229 = !DILocation(line: 136, column: 13, scope: !215)
!230 = !{!"llvm.loop.mustprogress"}
!231 = !DILocation(line: 139, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !201, file: !70, line: 139, column: 17)
!233 = !DILocation(line: 139, column: 22, scope: !232)
!234 = !DILocation(line: 139, column: 17, scope: !201)
!235 = !DILocation(line: 141, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !70, line: 140, column: 13)
!237 = !DILocation(line: 141, column: 24, scope: !236)
!238 = !DILocation(line: 141, column: 30, scope: !236)
!239 = !DILocation(line: 143, column: 23, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !70, line: 143, column: 17)
!241 = !DILocation(line: 143, column: 21, scope: !240)
!242 = !DILocation(line: 143, column: 28, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !70, line: 143, column: 17)
!244 = !DILocation(line: 143, column: 30, scope: !243)
!245 = !DILocation(line: 143, column: 17, scope: !240)
!246 = !DILocation(line: 145, column: 34, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !70, line: 144, column: 17)
!248 = !DILocation(line: 145, column: 41, scope: !247)
!249 = !DILocation(line: 145, column: 21, scope: !247)
!250 = !DILocation(line: 146, column: 17, scope: !247)
!251 = !DILocation(line: 143, column: 37, scope: !243)
!252 = !DILocation(line: 143, column: 17, scope: !243)
!253 = distinct !{!253, !245, !254, !230}
!254 = !DILocation(line: 146, column: 17, scope: !240)
!255 = !DILocation(line: 147, column: 13, scope: !236)
!256 = !DILocation(line: 150, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !232, file: !70, line: 149, column: 13)
!258 = !DILocation(line: 152, column: 18, scope: !201)
!259 = !DILocation(line: 152, column: 13, scope: !201)
!260 = !DILocation(line: 154, column: 5, scope: !202)
!261 = !DILocation(line: 155, column: 1, scope: !77)
!262 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_good", scope: !70, file: !70, line: 473, type: !78, scopeLine: 474, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !80)
!263 = !DILocation(line: 475, column: 5, scope: !262)
!264 = !DILocation(line: 476, column: 5, scope: !262)
!265 = !DILocation(line: 477, column: 5, scope: !262)
!266 = !DILocation(line: 478, column: 5, scope: !262)
!267 = !DILocation(line: 479, column: 1, scope: !262)
!268 = distinct !DISubprogram(name: "main", scope: !70, file: !70, line: 490, type: !269, scopeLine: 491, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !80)
!269 = !DISubroutineType(types: !270)
!270 = !{!67, !67, !271}
!271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!273 = !DILocalVariable(name: "argc", arg: 1, scope: !268, file: !70, line: 490, type: !67)
!274 = !DILocation(line: 490, column: 14, scope: !268)
!275 = !DILocalVariable(name: "argv", arg: 2, scope: !268, file: !70, line: 490, type: !271)
!276 = !DILocation(line: 490, column: 27, scope: !268)
!277 = !DILocation(line: 493, column: 22, scope: !268)
!278 = !DILocation(line: 493, column: 12, scope: !268)
!279 = !DILocation(line: 493, column: 5, scope: !268)
!280 = !DILocation(line: 495, column: 5, scope: !268)
!281 = !DILocation(line: 496, column: 5, scope: !268)
!282 = !DILocation(line: 497, column: 5, scope: !268)
!283 = !DILocation(line: 500, column: 5, scope: !268)
!284 = !DILocation(line: 501, column: 5, scope: !268)
!285 = !DILocation(line: 502, column: 5, scope: !268)
!286 = !DILocation(line: 504, column: 5, scope: !268)
!287 = distinct !DISubprogram(name: "goodB2G1", scope: !70, file: !70, line: 162, type: !78, scopeLine: 163, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!288 = !DILocalVariable(name: "data", scope: !287, file: !70, line: 164, type: !67)
!289 = !DILocation(line: 164, column: 9, scope: !287)
!290 = !DILocation(line: 166, column: 10, scope: !287)
!291 = !DILocation(line: 167, column: 8, scope: !292)
!292 = distinct !DILexicalBlock(scope: !287, file: !70, line: 167, column: 8)
!293 = !DILocation(line: 167, column: 18, scope: !292)
!294 = !DILocation(line: 167, column: 8, scope: !287)
!295 = !DILocalVariable(name: "recvResult", scope: !296, file: !70, line: 174, type: !67)
!296 = distinct !DILexicalBlock(scope: !297, file: !70, line: 169, column: 9)
!297 = distinct !DILexicalBlock(scope: !292, file: !70, line: 168, column: 5)
!298 = !DILocation(line: 174, column: 17, scope: !296)
!299 = !DILocalVariable(name: "service", scope: !296, file: !70, line: 175, type: !93)
!300 = !DILocation(line: 175, column: 32, scope: !296)
!301 = !DILocalVariable(name: "listenSocket", scope: !296, file: !70, line: 176, type: !67)
!302 = !DILocation(line: 176, column: 20, scope: !296)
!303 = !DILocalVariable(name: "acceptSocket", scope: !296, file: !70, line: 177, type: !67)
!304 = !DILocation(line: 177, column: 20, scope: !296)
!305 = !DILocalVariable(name: "inputBuffer", scope: !296, file: !70, line: 178, type: !62)
!306 = !DILocation(line: 178, column: 18, scope: !296)
!307 = !DILocation(line: 179, column: 13, scope: !296)
!308 = !DILocation(line: 189, column: 32, scope: !309)
!309 = distinct !DILexicalBlock(scope: !296, file: !70, line: 180, column: 13)
!310 = !DILocation(line: 189, column: 30, scope: !309)
!311 = !DILocation(line: 190, column: 21, scope: !312)
!312 = distinct !DILexicalBlock(scope: !309, file: !70, line: 190, column: 21)
!313 = !DILocation(line: 190, column: 34, scope: !312)
!314 = !DILocation(line: 190, column: 21, scope: !309)
!315 = !DILocation(line: 192, column: 21, scope: !316)
!316 = distinct !DILexicalBlock(scope: !312, file: !70, line: 191, column: 17)
!317 = !DILocation(line: 194, column: 17, scope: !309)
!318 = !DILocation(line: 195, column: 25, scope: !309)
!319 = !DILocation(line: 195, column: 36, scope: !309)
!320 = !DILocation(line: 196, column: 25, scope: !309)
!321 = !DILocation(line: 196, column: 34, scope: !309)
!322 = !DILocation(line: 196, column: 41, scope: !309)
!323 = !DILocation(line: 197, column: 36, scope: !309)
!324 = !DILocation(line: 197, column: 25, scope: !309)
!325 = !DILocation(line: 197, column: 34, scope: !309)
!326 = !DILocation(line: 198, column: 26, scope: !327)
!327 = distinct !DILexicalBlock(scope: !309, file: !70, line: 198, column: 21)
!328 = !DILocation(line: 198, column: 40, scope: !327)
!329 = !DILocation(line: 198, column: 21, scope: !327)
!330 = !DILocation(line: 198, column: 85, scope: !327)
!331 = !DILocation(line: 198, column: 21, scope: !309)
!332 = !DILocation(line: 200, column: 21, scope: !333)
!333 = distinct !DILexicalBlock(scope: !327, file: !70, line: 199, column: 17)
!334 = !DILocation(line: 202, column: 28, scope: !335)
!335 = distinct !DILexicalBlock(scope: !309, file: !70, line: 202, column: 21)
!336 = !DILocation(line: 202, column: 21, scope: !335)
!337 = !DILocation(line: 202, column: 58, scope: !335)
!338 = !DILocation(line: 202, column: 21, scope: !309)
!339 = !DILocation(line: 204, column: 21, scope: !340)
!340 = distinct !DILexicalBlock(scope: !335, file: !70, line: 203, column: 17)
!341 = !DILocation(line: 206, column: 39, scope: !309)
!342 = !DILocation(line: 206, column: 32, scope: !309)
!343 = !DILocation(line: 206, column: 30, scope: !309)
!344 = !DILocation(line: 207, column: 21, scope: !345)
!345 = distinct !DILexicalBlock(scope: !309, file: !70, line: 207, column: 21)
!346 = !DILocation(line: 207, column: 34, scope: !345)
!347 = !DILocation(line: 207, column: 21, scope: !309)
!348 = !DILocation(line: 209, column: 21, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !70, line: 208, column: 17)
!350 = !DILocation(line: 212, column: 35, scope: !309)
!351 = !DILocation(line: 212, column: 49, scope: !309)
!352 = !DILocation(line: 212, column: 30, scope: !309)
!353 = !DILocation(line: 212, column: 28, scope: !309)
!354 = !DILocation(line: 213, column: 21, scope: !355)
!355 = distinct !DILexicalBlock(scope: !309, file: !70, line: 213, column: 21)
!356 = !DILocation(line: 213, column: 32, scope: !355)
!357 = !DILocation(line: 213, column: 48, scope: !355)
!358 = !DILocation(line: 213, column: 51, scope: !355)
!359 = !DILocation(line: 213, column: 62, scope: !355)
!360 = !DILocation(line: 213, column: 21, scope: !309)
!361 = !DILocation(line: 215, column: 21, scope: !362)
!362 = distinct !DILexicalBlock(scope: !355, file: !70, line: 214, column: 17)
!363 = !DILocation(line: 218, column: 29, scope: !309)
!364 = !DILocation(line: 218, column: 17, scope: !309)
!365 = !DILocation(line: 218, column: 41, scope: !309)
!366 = !DILocation(line: 220, column: 29, scope: !309)
!367 = !DILocation(line: 220, column: 24, scope: !309)
!368 = !DILocation(line: 220, column: 22, scope: !309)
!369 = !DILocation(line: 221, column: 13, scope: !309)
!370 = !DILocation(line: 223, column: 17, scope: !371)
!371 = distinct !DILexicalBlock(scope: !296, file: !70, line: 223, column: 17)
!372 = !DILocation(line: 223, column: 30, scope: !371)
!373 = !DILocation(line: 223, column: 17, scope: !296)
!374 = !DILocation(line: 225, column: 30, scope: !375)
!375 = distinct !DILexicalBlock(scope: !371, file: !70, line: 224, column: 13)
!376 = !DILocation(line: 225, column: 17, scope: !375)
!377 = !DILocation(line: 226, column: 13, scope: !375)
!378 = !DILocation(line: 227, column: 17, scope: !379)
!379 = distinct !DILexicalBlock(scope: !296, file: !70, line: 227, column: 17)
!380 = !DILocation(line: 227, column: 30, scope: !379)
!381 = !DILocation(line: 227, column: 17, scope: !296)
!382 = !DILocation(line: 229, column: 30, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !70, line: 228, column: 13)
!384 = !DILocation(line: 229, column: 17, scope: !383)
!385 = !DILocation(line: 230, column: 13, scope: !383)
!386 = !DILocation(line: 238, column: 5, scope: !297)
!387 = !DILocation(line: 239, column: 8, scope: !388)
!388 = distinct !DILexicalBlock(scope: !287, file: !70, line: 239, column: 8)
!389 = !DILocation(line: 239, column: 18, scope: !388)
!390 = !DILocation(line: 239, column: 8, scope: !287)
!391 = !DILocation(line: 242, column: 9, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !70, line: 240, column: 5)
!393 = !DILocation(line: 243, column: 5, scope: !392)
!394 = !DILocalVariable(name: "i", scope: !395, file: !70, line: 247, type: !67)
!395 = distinct !DILexicalBlock(scope: !396, file: !70, line: 246, column: 9)
!396 = distinct !DILexicalBlock(scope: !388, file: !70, line: 245, column: 5)
!397 = !DILocation(line: 247, column: 17, scope: !395)
!398 = !DILocalVariable(name: "buffer", scope: !395, file: !70, line: 248, type: !66)
!399 = !DILocation(line: 248, column: 19, scope: !395)
!400 = !DILocation(line: 248, column: 35, scope: !395)
!401 = !DILocation(line: 248, column: 28, scope: !395)
!402 = !DILocation(line: 249, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !395, file: !70, line: 249, column: 17)
!404 = !DILocation(line: 249, column: 24, scope: !403)
!405 = !DILocation(line: 249, column: 17, scope: !395)
!406 = !DILocation(line: 249, column: 34, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !70, line: 249, column: 33)
!408 = !DILocation(line: 251, column: 20, scope: !409)
!409 = distinct !DILexicalBlock(scope: !395, file: !70, line: 251, column: 13)
!410 = !DILocation(line: 251, column: 18, scope: !409)
!411 = !DILocation(line: 251, column: 25, scope: !412)
!412 = distinct !DILexicalBlock(scope: !409, file: !70, line: 251, column: 13)
!413 = !DILocation(line: 251, column: 27, scope: !412)
!414 = !DILocation(line: 251, column: 13, scope: !409)
!415 = !DILocation(line: 253, column: 17, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !70, line: 252, column: 13)
!417 = !DILocation(line: 253, column: 24, scope: !416)
!418 = !DILocation(line: 253, column: 27, scope: !416)
!419 = !DILocation(line: 254, column: 13, scope: !416)
!420 = !DILocation(line: 251, column: 34, scope: !412)
!421 = !DILocation(line: 251, column: 13, scope: !412)
!422 = distinct !{!422, !414, !423, !230}
!423 = !DILocation(line: 254, column: 13, scope: !409)
!424 = !DILocation(line: 256, column: 17, scope: !425)
!425 = distinct !DILexicalBlock(scope: !395, file: !70, line: 256, column: 17)
!426 = !DILocation(line: 256, column: 22, scope: !425)
!427 = !DILocation(line: 256, column: 27, scope: !425)
!428 = !DILocation(line: 256, column: 30, scope: !425)
!429 = !DILocation(line: 256, column: 35, scope: !425)
!430 = !DILocation(line: 256, column: 17, scope: !395)
!431 = !DILocation(line: 258, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !425, file: !70, line: 257, column: 13)
!433 = !DILocation(line: 258, column: 24, scope: !432)
!434 = !DILocation(line: 258, column: 30, scope: !432)
!435 = !DILocation(line: 260, column: 23, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !70, line: 260, column: 17)
!437 = !DILocation(line: 260, column: 21, scope: !436)
!438 = !DILocation(line: 260, column: 28, scope: !439)
!439 = distinct !DILexicalBlock(scope: !436, file: !70, line: 260, column: 17)
!440 = !DILocation(line: 260, column: 30, scope: !439)
!441 = !DILocation(line: 260, column: 17, scope: !436)
!442 = !DILocation(line: 262, column: 34, scope: !443)
!443 = distinct !DILexicalBlock(scope: !439, file: !70, line: 261, column: 17)
!444 = !DILocation(line: 262, column: 41, scope: !443)
!445 = !DILocation(line: 262, column: 21, scope: !443)
!446 = !DILocation(line: 263, column: 17, scope: !443)
!447 = !DILocation(line: 260, column: 37, scope: !439)
!448 = !DILocation(line: 260, column: 17, scope: !439)
!449 = distinct !{!449, !441, !450, !230}
!450 = !DILocation(line: 263, column: 17, scope: !436)
!451 = !DILocation(line: 264, column: 13, scope: !432)
!452 = !DILocation(line: 267, column: 17, scope: !453)
!453 = distinct !DILexicalBlock(scope: !425, file: !70, line: 266, column: 13)
!454 = !DILocation(line: 269, column: 18, scope: !395)
!455 = !DILocation(line: 269, column: 13, scope: !395)
!456 = !DILocation(line: 272, column: 1, scope: !287)
!457 = distinct !DISubprogram(name: "goodB2G2", scope: !70, file: !70, line: 275, type: !78, scopeLine: 276, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!458 = !DILocalVariable(name: "data", scope: !457, file: !70, line: 277, type: !67)
!459 = !DILocation(line: 277, column: 9, scope: !457)
!460 = !DILocation(line: 279, column: 10, scope: !457)
!461 = !DILocation(line: 280, column: 8, scope: !462)
!462 = distinct !DILexicalBlock(scope: !457, file: !70, line: 280, column: 8)
!463 = !DILocation(line: 280, column: 18, scope: !462)
!464 = !DILocation(line: 280, column: 8, scope: !457)
!465 = !DILocalVariable(name: "recvResult", scope: !466, file: !70, line: 287, type: !67)
!466 = distinct !DILexicalBlock(scope: !467, file: !70, line: 282, column: 9)
!467 = distinct !DILexicalBlock(scope: !462, file: !70, line: 281, column: 5)
!468 = !DILocation(line: 287, column: 17, scope: !466)
!469 = !DILocalVariable(name: "service", scope: !466, file: !70, line: 288, type: !93)
!470 = !DILocation(line: 288, column: 32, scope: !466)
!471 = !DILocalVariable(name: "listenSocket", scope: !466, file: !70, line: 289, type: !67)
!472 = !DILocation(line: 289, column: 20, scope: !466)
!473 = !DILocalVariable(name: "acceptSocket", scope: !466, file: !70, line: 290, type: !67)
!474 = !DILocation(line: 290, column: 20, scope: !466)
!475 = !DILocalVariable(name: "inputBuffer", scope: !466, file: !70, line: 291, type: !62)
!476 = !DILocation(line: 291, column: 18, scope: !466)
!477 = !DILocation(line: 292, column: 13, scope: !466)
!478 = !DILocation(line: 302, column: 32, scope: !479)
!479 = distinct !DILexicalBlock(scope: !466, file: !70, line: 293, column: 13)
!480 = !DILocation(line: 302, column: 30, scope: !479)
!481 = !DILocation(line: 303, column: 21, scope: !482)
!482 = distinct !DILexicalBlock(scope: !479, file: !70, line: 303, column: 21)
!483 = !DILocation(line: 303, column: 34, scope: !482)
!484 = !DILocation(line: 303, column: 21, scope: !479)
!485 = !DILocation(line: 305, column: 21, scope: !486)
!486 = distinct !DILexicalBlock(scope: !482, file: !70, line: 304, column: 17)
!487 = !DILocation(line: 307, column: 17, scope: !479)
!488 = !DILocation(line: 308, column: 25, scope: !479)
!489 = !DILocation(line: 308, column: 36, scope: !479)
!490 = !DILocation(line: 309, column: 25, scope: !479)
!491 = !DILocation(line: 309, column: 34, scope: !479)
!492 = !DILocation(line: 309, column: 41, scope: !479)
!493 = !DILocation(line: 310, column: 36, scope: !479)
!494 = !DILocation(line: 310, column: 25, scope: !479)
!495 = !DILocation(line: 310, column: 34, scope: !479)
!496 = !DILocation(line: 311, column: 26, scope: !497)
!497 = distinct !DILexicalBlock(scope: !479, file: !70, line: 311, column: 21)
!498 = !DILocation(line: 311, column: 40, scope: !497)
!499 = !DILocation(line: 311, column: 21, scope: !497)
!500 = !DILocation(line: 311, column: 85, scope: !497)
!501 = !DILocation(line: 311, column: 21, scope: !479)
!502 = !DILocation(line: 313, column: 21, scope: !503)
!503 = distinct !DILexicalBlock(scope: !497, file: !70, line: 312, column: 17)
!504 = !DILocation(line: 315, column: 28, scope: !505)
!505 = distinct !DILexicalBlock(scope: !479, file: !70, line: 315, column: 21)
!506 = !DILocation(line: 315, column: 21, scope: !505)
!507 = !DILocation(line: 315, column: 58, scope: !505)
!508 = !DILocation(line: 315, column: 21, scope: !479)
!509 = !DILocation(line: 317, column: 21, scope: !510)
!510 = distinct !DILexicalBlock(scope: !505, file: !70, line: 316, column: 17)
!511 = !DILocation(line: 319, column: 39, scope: !479)
!512 = !DILocation(line: 319, column: 32, scope: !479)
!513 = !DILocation(line: 319, column: 30, scope: !479)
!514 = !DILocation(line: 320, column: 21, scope: !515)
!515 = distinct !DILexicalBlock(scope: !479, file: !70, line: 320, column: 21)
!516 = !DILocation(line: 320, column: 34, scope: !515)
!517 = !DILocation(line: 320, column: 21, scope: !479)
!518 = !DILocation(line: 322, column: 21, scope: !519)
!519 = distinct !DILexicalBlock(scope: !515, file: !70, line: 321, column: 17)
!520 = !DILocation(line: 325, column: 35, scope: !479)
!521 = !DILocation(line: 325, column: 49, scope: !479)
!522 = !DILocation(line: 325, column: 30, scope: !479)
!523 = !DILocation(line: 325, column: 28, scope: !479)
!524 = !DILocation(line: 326, column: 21, scope: !525)
!525 = distinct !DILexicalBlock(scope: !479, file: !70, line: 326, column: 21)
!526 = !DILocation(line: 326, column: 32, scope: !525)
!527 = !DILocation(line: 326, column: 48, scope: !525)
!528 = !DILocation(line: 326, column: 51, scope: !525)
!529 = !DILocation(line: 326, column: 62, scope: !525)
!530 = !DILocation(line: 326, column: 21, scope: !479)
!531 = !DILocation(line: 328, column: 21, scope: !532)
!532 = distinct !DILexicalBlock(scope: !525, file: !70, line: 327, column: 17)
!533 = !DILocation(line: 331, column: 29, scope: !479)
!534 = !DILocation(line: 331, column: 17, scope: !479)
!535 = !DILocation(line: 331, column: 41, scope: !479)
!536 = !DILocation(line: 333, column: 29, scope: !479)
!537 = !DILocation(line: 333, column: 24, scope: !479)
!538 = !DILocation(line: 333, column: 22, scope: !479)
!539 = !DILocation(line: 334, column: 13, scope: !479)
!540 = !DILocation(line: 336, column: 17, scope: !541)
!541 = distinct !DILexicalBlock(scope: !466, file: !70, line: 336, column: 17)
!542 = !DILocation(line: 336, column: 30, scope: !541)
!543 = !DILocation(line: 336, column: 17, scope: !466)
!544 = !DILocation(line: 338, column: 30, scope: !545)
!545 = distinct !DILexicalBlock(scope: !541, file: !70, line: 337, column: 13)
!546 = !DILocation(line: 338, column: 17, scope: !545)
!547 = !DILocation(line: 339, column: 13, scope: !545)
!548 = !DILocation(line: 340, column: 17, scope: !549)
!549 = distinct !DILexicalBlock(scope: !466, file: !70, line: 340, column: 17)
!550 = !DILocation(line: 340, column: 30, scope: !549)
!551 = !DILocation(line: 340, column: 17, scope: !466)
!552 = !DILocation(line: 342, column: 30, scope: !553)
!553 = distinct !DILexicalBlock(scope: !549, file: !70, line: 341, column: 13)
!554 = !DILocation(line: 342, column: 17, scope: !553)
!555 = !DILocation(line: 343, column: 13, scope: !553)
!556 = !DILocation(line: 351, column: 5, scope: !467)
!557 = !DILocation(line: 352, column: 8, scope: !558)
!558 = distinct !DILexicalBlock(scope: !457, file: !70, line: 352, column: 8)
!559 = !DILocation(line: 352, column: 18, scope: !558)
!560 = !DILocation(line: 352, column: 8, scope: !457)
!561 = !DILocalVariable(name: "i", scope: !562, file: !70, line: 355, type: !67)
!562 = distinct !DILexicalBlock(scope: !563, file: !70, line: 354, column: 9)
!563 = distinct !DILexicalBlock(scope: !558, file: !70, line: 353, column: 5)
!564 = !DILocation(line: 355, column: 17, scope: !562)
!565 = !DILocalVariable(name: "buffer", scope: !562, file: !70, line: 356, type: !66)
!566 = !DILocation(line: 356, column: 19, scope: !562)
!567 = !DILocation(line: 356, column: 35, scope: !562)
!568 = !DILocation(line: 356, column: 28, scope: !562)
!569 = !DILocation(line: 357, column: 17, scope: !570)
!570 = distinct !DILexicalBlock(scope: !562, file: !70, line: 357, column: 17)
!571 = !DILocation(line: 357, column: 24, scope: !570)
!572 = !DILocation(line: 357, column: 17, scope: !562)
!573 = !DILocation(line: 357, column: 34, scope: !574)
!574 = distinct !DILexicalBlock(scope: !570, file: !70, line: 357, column: 33)
!575 = !DILocation(line: 359, column: 20, scope: !576)
!576 = distinct !DILexicalBlock(scope: !562, file: !70, line: 359, column: 13)
!577 = !DILocation(line: 359, column: 18, scope: !576)
!578 = !DILocation(line: 359, column: 25, scope: !579)
!579 = distinct !DILexicalBlock(scope: !576, file: !70, line: 359, column: 13)
!580 = !DILocation(line: 359, column: 27, scope: !579)
!581 = !DILocation(line: 359, column: 13, scope: !576)
!582 = !DILocation(line: 361, column: 17, scope: !583)
!583 = distinct !DILexicalBlock(scope: !579, file: !70, line: 360, column: 13)
!584 = !DILocation(line: 361, column: 24, scope: !583)
!585 = !DILocation(line: 361, column: 27, scope: !583)
!586 = !DILocation(line: 362, column: 13, scope: !583)
!587 = !DILocation(line: 359, column: 34, scope: !579)
!588 = !DILocation(line: 359, column: 13, scope: !579)
!589 = distinct !{!589, !581, !590, !230}
!590 = !DILocation(line: 362, column: 13, scope: !576)
!591 = !DILocation(line: 364, column: 17, scope: !592)
!592 = distinct !DILexicalBlock(scope: !562, file: !70, line: 364, column: 17)
!593 = !DILocation(line: 364, column: 22, scope: !592)
!594 = !DILocation(line: 364, column: 27, scope: !592)
!595 = !DILocation(line: 364, column: 30, scope: !592)
!596 = !DILocation(line: 364, column: 35, scope: !592)
!597 = !DILocation(line: 364, column: 17, scope: !562)
!598 = !DILocation(line: 366, column: 17, scope: !599)
!599 = distinct !DILexicalBlock(scope: !592, file: !70, line: 365, column: 13)
!600 = !DILocation(line: 366, column: 24, scope: !599)
!601 = !DILocation(line: 366, column: 30, scope: !599)
!602 = !DILocation(line: 368, column: 23, scope: !603)
!603 = distinct !DILexicalBlock(scope: !599, file: !70, line: 368, column: 17)
!604 = !DILocation(line: 368, column: 21, scope: !603)
!605 = !DILocation(line: 368, column: 28, scope: !606)
!606 = distinct !DILexicalBlock(scope: !603, file: !70, line: 368, column: 17)
!607 = !DILocation(line: 368, column: 30, scope: !606)
!608 = !DILocation(line: 368, column: 17, scope: !603)
!609 = !DILocation(line: 370, column: 34, scope: !610)
!610 = distinct !DILexicalBlock(scope: !606, file: !70, line: 369, column: 17)
!611 = !DILocation(line: 370, column: 41, scope: !610)
!612 = !DILocation(line: 370, column: 21, scope: !610)
!613 = !DILocation(line: 371, column: 17, scope: !610)
!614 = !DILocation(line: 368, column: 37, scope: !606)
!615 = !DILocation(line: 368, column: 17, scope: !606)
!616 = distinct !{!616, !608, !617, !230}
!617 = !DILocation(line: 371, column: 17, scope: !603)
!618 = !DILocation(line: 372, column: 13, scope: !599)
!619 = !DILocation(line: 375, column: 17, scope: !620)
!620 = distinct !DILexicalBlock(scope: !592, file: !70, line: 374, column: 13)
!621 = !DILocation(line: 377, column: 18, scope: !562)
!622 = !DILocation(line: 377, column: 13, scope: !562)
!623 = !DILocation(line: 379, column: 5, scope: !563)
!624 = !DILocation(line: 380, column: 1, scope: !457)
!625 = distinct !DISubprogram(name: "goodG2B1", scope: !70, file: !70, line: 383, type: !78, scopeLine: 384, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!626 = !DILocalVariable(name: "data", scope: !625, file: !70, line: 385, type: !67)
!627 = !DILocation(line: 385, column: 9, scope: !625)
!628 = !DILocation(line: 387, column: 10, scope: !625)
!629 = !DILocation(line: 388, column: 8, scope: !630)
!630 = distinct !DILexicalBlock(scope: !625, file: !70, line: 388, column: 8)
!631 = !DILocation(line: 388, column: 18, scope: !630)
!632 = !DILocation(line: 388, column: 8, scope: !625)
!633 = !DILocation(line: 391, column: 9, scope: !634)
!634 = distinct !DILexicalBlock(scope: !630, file: !70, line: 389, column: 5)
!635 = !DILocation(line: 392, column: 5, scope: !634)
!636 = !DILocation(line: 397, column: 14, scope: !637)
!637 = distinct !DILexicalBlock(scope: !630, file: !70, line: 394, column: 5)
!638 = !DILocation(line: 399, column: 8, scope: !639)
!639 = distinct !DILexicalBlock(scope: !625, file: !70, line: 399, column: 8)
!640 = !DILocation(line: 399, column: 18, scope: !639)
!641 = !DILocation(line: 399, column: 8, scope: !625)
!642 = !DILocalVariable(name: "i", scope: !643, file: !70, line: 402, type: !67)
!643 = distinct !DILexicalBlock(scope: !644, file: !70, line: 401, column: 9)
!644 = distinct !DILexicalBlock(scope: !639, file: !70, line: 400, column: 5)
!645 = !DILocation(line: 402, column: 17, scope: !643)
!646 = !DILocalVariable(name: "buffer", scope: !643, file: !70, line: 403, type: !66)
!647 = !DILocation(line: 403, column: 19, scope: !643)
!648 = !DILocation(line: 403, column: 35, scope: !643)
!649 = !DILocation(line: 403, column: 28, scope: !643)
!650 = !DILocation(line: 404, column: 17, scope: !651)
!651 = distinct !DILexicalBlock(scope: !643, file: !70, line: 404, column: 17)
!652 = !DILocation(line: 404, column: 24, scope: !651)
!653 = !DILocation(line: 404, column: 17, scope: !643)
!654 = !DILocation(line: 404, column: 34, scope: !655)
!655 = distinct !DILexicalBlock(scope: !651, file: !70, line: 404, column: 33)
!656 = !DILocation(line: 406, column: 20, scope: !657)
!657 = distinct !DILexicalBlock(scope: !643, file: !70, line: 406, column: 13)
!658 = !DILocation(line: 406, column: 18, scope: !657)
!659 = !DILocation(line: 406, column: 25, scope: !660)
!660 = distinct !DILexicalBlock(scope: !657, file: !70, line: 406, column: 13)
!661 = !DILocation(line: 406, column: 27, scope: !660)
!662 = !DILocation(line: 406, column: 13, scope: !657)
!663 = !DILocation(line: 408, column: 17, scope: !664)
!664 = distinct !DILexicalBlock(scope: !660, file: !70, line: 407, column: 13)
!665 = !DILocation(line: 408, column: 24, scope: !664)
!666 = !DILocation(line: 408, column: 27, scope: !664)
!667 = !DILocation(line: 409, column: 13, scope: !664)
!668 = !DILocation(line: 406, column: 34, scope: !660)
!669 = !DILocation(line: 406, column: 13, scope: !660)
!670 = distinct !{!670, !662, !671, !230}
!671 = !DILocation(line: 409, column: 13, scope: !657)
!672 = !DILocation(line: 412, column: 17, scope: !673)
!673 = distinct !DILexicalBlock(scope: !643, file: !70, line: 412, column: 17)
!674 = !DILocation(line: 412, column: 22, scope: !673)
!675 = !DILocation(line: 412, column: 17, scope: !643)
!676 = !DILocation(line: 414, column: 17, scope: !677)
!677 = distinct !DILexicalBlock(scope: !673, file: !70, line: 413, column: 13)
!678 = !DILocation(line: 414, column: 24, scope: !677)
!679 = !DILocation(line: 414, column: 30, scope: !677)
!680 = !DILocation(line: 416, column: 23, scope: !681)
!681 = distinct !DILexicalBlock(scope: !677, file: !70, line: 416, column: 17)
!682 = !DILocation(line: 416, column: 21, scope: !681)
!683 = !DILocation(line: 416, column: 28, scope: !684)
!684 = distinct !DILexicalBlock(scope: !681, file: !70, line: 416, column: 17)
!685 = !DILocation(line: 416, column: 30, scope: !684)
!686 = !DILocation(line: 416, column: 17, scope: !681)
!687 = !DILocation(line: 418, column: 34, scope: !688)
!688 = distinct !DILexicalBlock(scope: !684, file: !70, line: 417, column: 17)
!689 = !DILocation(line: 418, column: 41, scope: !688)
!690 = !DILocation(line: 418, column: 21, scope: !688)
!691 = !DILocation(line: 419, column: 17, scope: !688)
!692 = !DILocation(line: 416, column: 37, scope: !684)
!693 = !DILocation(line: 416, column: 17, scope: !684)
!694 = distinct !{!694, !686, !695, !230}
!695 = !DILocation(line: 419, column: 17, scope: !681)
!696 = !DILocation(line: 420, column: 13, scope: !677)
!697 = !DILocation(line: 423, column: 17, scope: !698)
!698 = distinct !DILexicalBlock(scope: !673, file: !70, line: 422, column: 13)
!699 = !DILocation(line: 425, column: 18, scope: !643)
!700 = !DILocation(line: 425, column: 13, scope: !643)
!701 = !DILocation(line: 427, column: 5, scope: !644)
!702 = !DILocation(line: 428, column: 1, scope: !625)
!703 = distinct !DISubprogram(name: "goodG2B2", scope: !70, file: !70, line: 431, type: !78, scopeLine: 432, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!704 = !DILocalVariable(name: "data", scope: !703, file: !70, line: 433, type: !67)
!705 = !DILocation(line: 433, column: 9, scope: !703)
!706 = !DILocation(line: 435, column: 10, scope: !703)
!707 = !DILocation(line: 436, column: 8, scope: !708)
!708 = distinct !DILexicalBlock(scope: !703, file: !70, line: 436, column: 8)
!709 = !DILocation(line: 436, column: 18, scope: !708)
!710 = !DILocation(line: 436, column: 8, scope: !703)
!711 = !DILocation(line: 440, column: 14, scope: !712)
!712 = distinct !DILexicalBlock(scope: !708, file: !70, line: 437, column: 5)
!713 = !DILocation(line: 441, column: 5, scope: !712)
!714 = !DILocation(line: 442, column: 8, scope: !715)
!715 = distinct !DILexicalBlock(scope: !703, file: !70, line: 442, column: 8)
!716 = !DILocation(line: 442, column: 18, scope: !715)
!717 = !DILocation(line: 442, column: 8, scope: !703)
!718 = !DILocalVariable(name: "i", scope: !719, file: !70, line: 445, type: !67)
!719 = distinct !DILexicalBlock(scope: !720, file: !70, line: 444, column: 9)
!720 = distinct !DILexicalBlock(scope: !715, file: !70, line: 443, column: 5)
!721 = !DILocation(line: 445, column: 17, scope: !719)
!722 = !DILocalVariable(name: "buffer", scope: !719, file: !70, line: 446, type: !66)
!723 = !DILocation(line: 446, column: 19, scope: !719)
!724 = !DILocation(line: 446, column: 35, scope: !719)
!725 = !DILocation(line: 446, column: 28, scope: !719)
!726 = !DILocation(line: 447, column: 17, scope: !727)
!727 = distinct !DILexicalBlock(scope: !719, file: !70, line: 447, column: 17)
!728 = !DILocation(line: 447, column: 24, scope: !727)
!729 = !DILocation(line: 447, column: 17, scope: !719)
!730 = !DILocation(line: 447, column: 34, scope: !731)
!731 = distinct !DILexicalBlock(scope: !727, file: !70, line: 447, column: 33)
!732 = !DILocation(line: 449, column: 20, scope: !733)
!733 = distinct !DILexicalBlock(scope: !719, file: !70, line: 449, column: 13)
!734 = !DILocation(line: 449, column: 18, scope: !733)
!735 = !DILocation(line: 449, column: 25, scope: !736)
!736 = distinct !DILexicalBlock(scope: !733, file: !70, line: 449, column: 13)
!737 = !DILocation(line: 449, column: 27, scope: !736)
!738 = !DILocation(line: 449, column: 13, scope: !733)
!739 = !DILocation(line: 451, column: 17, scope: !740)
!740 = distinct !DILexicalBlock(scope: !736, file: !70, line: 450, column: 13)
!741 = !DILocation(line: 451, column: 24, scope: !740)
!742 = !DILocation(line: 451, column: 27, scope: !740)
!743 = !DILocation(line: 452, column: 13, scope: !740)
!744 = !DILocation(line: 449, column: 34, scope: !736)
!745 = !DILocation(line: 449, column: 13, scope: !736)
!746 = distinct !{!746, !738, !747, !230}
!747 = !DILocation(line: 452, column: 13, scope: !733)
!748 = !DILocation(line: 455, column: 17, scope: !749)
!749 = distinct !DILexicalBlock(scope: !719, file: !70, line: 455, column: 17)
!750 = !DILocation(line: 455, column: 22, scope: !749)
!751 = !DILocation(line: 455, column: 17, scope: !719)
!752 = !DILocation(line: 457, column: 17, scope: !753)
!753 = distinct !DILexicalBlock(scope: !749, file: !70, line: 456, column: 13)
!754 = !DILocation(line: 457, column: 24, scope: !753)
!755 = !DILocation(line: 457, column: 30, scope: !753)
!756 = !DILocation(line: 459, column: 23, scope: !757)
!757 = distinct !DILexicalBlock(scope: !753, file: !70, line: 459, column: 17)
!758 = !DILocation(line: 459, column: 21, scope: !757)
!759 = !DILocation(line: 459, column: 28, scope: !760)
!760 = distinct !DILexicalBlock(scope: !757, file: !70, line: 459, column: 17)
!761 = !DILocation(line: 459, column: 30, scope: !760)
!762 = !DILocation(line: 459, column: 17, scope: !757)
!763 = !DILocation(line: 461, column: 34, scope: !764)
!764 = distinct !DILexicalBlock(scope: !760, file: !70, line: 460, column: 17)
!765 = !DILocation(line: 461, column: 41, scope: !764)
!766 = !DILocation(line: 461, column: 21, scope: !764)
!767 = !DILocation(line: 462, column: 17, scope: !764)
!768 = !DILocation(line: 459, column: 37, scope: !760)
!769 = !DILocation(line: 459, column: 17, scope: !760)
!770 = distinct !{!770, !762, !771, !230}
!771 = !DILocation(line: 462, column: 17, scope: !757)
!772 = !DILocation(line: 463, column: 13, scope: !753)
!773 = !DILocation(line: 466, column: 17, scope: !774)
!774 = distinct !DILexicalBlock(scope: !749, file: !70, line: 465, column: 13)
!775 = !DILocation(line: 468, column: 18, scope: !719)
!776 = !DILocation(line: 468, column: 13, scope: !719)
!777 = !DILocation(line: 470, column: 5, scope: !720)
!778 = !DILocation(line: 471, column: 1, scope: !703)
