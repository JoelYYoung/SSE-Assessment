; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08.c"
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
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_bad() #0 !dbg !73 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.end35, !dbg !83

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !84, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !88, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %listenSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 -1, i32* %acceptSocket, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  br label %do.body, !dbg !112

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !113
  store i32 %call1, i32* %listenSocket, align 4, !dbg !115
  %0 = load i32, i32* %listenSocket, align 4, !dbg !116
  %cmp = icmp eq i32 %0, -1, !dbg !118
  br i1 %cmp, label %if.then2, label %if.end, !dbg !119

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !120

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !122
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !123
  store i16 2, i16* %sin_family, align 4, !dbg !124
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !125
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !126
  store i32 0, i32* %s_addr, align 4, !dbg !127
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !128
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !129
  store i16 %call3, i16* %sin_port, align 2, !dbg !130
  %2 = load i32, i32* %listenSocket, align 4, !dbg !131
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !133
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !134
  %cmp5 = icmp eq i32 %call4, -1, !dbg !135
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !136

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !137

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !139
  %call8 = call i32 @listen(i32 %4, i32 5) #8, !dbg !141
  %cmp9 = icmp eq i32 %call8, -1, !dbg !142
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !143

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !144

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !146
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !147
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !148
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !149
  %cmp13 = icmp eq i32 %6, -1, !dbg !151
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !152

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !153

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !155
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !156
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !157
  %conv = trunc i64 %call16 to i32, !dbg !157
  store i32 %conv, i32* %recvResult, align 4, !dbg !158
  %8 = load i32, i32* %recvResult, align 4, !dbg !159
  %cmp17 = icmp eq i32 %8, -1, !dbg !161
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !162

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !163
  %cmp19 = icmp eq i32 %9, 0, !dbg !164
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !165

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !166

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !168
  %idxprom = sext i32 %10 to i64, !dbg !169
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !171
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !172
  store i32 %call24, i32* %data, align 4, !dbg !173
  br label %do.end, !dbg !174

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !175
  %cmp25 = icmp ne i32 %11, -1, !dbg !177
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !178

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !179
  %call28 = call i32 @close(i32 %12), !dbg !181
  br label %if.end29, !dbg !182

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !183
  %cmp30 = icmp ne i32 %13, -1, !dbg !185
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !186

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !187
  %call33 = call i32 @close(i32 %14), !dbg !189
  br label %if.end34, !dbg !190

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !191

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 @staticReturnsTrue(), !dbg !192
  %tobool37 = icmp ne i32 %call36, 0, !dbg !192
  br i1 %tobool37, label %if.then38, label %if.end63, !dbg !194

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !195, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !199, metadata !DIExpression()), !dbg !200
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !201
  %15 = bitcast i8* %call39 to i32*, !dbg !202
  store i32* %15, i32** %buffer, align 8, !dbg !200
  %16 = load i32*, i32** %buffer, align 8, !dbg !203
  %cmp40 = icmp eq i32* %16, null, !dbg !205
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !206

if.then42:                                        ; preds = %if.then38
  call void @exit(i32 -1) #11, !dbg !207
  unreachable, !dbg !207

if.end43:                                         ; preds = %if.then38
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end43
  %17 = load i32, i32* %i, align 4, !dbg !212
  %cmp44 = icmp slt i32 %17, 10, !dbg !214
  br i1 %cmp44, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !216
  %19 = load i32, i32* %i, align 4, !dbg !218
  %idxprom46 = sext i32 %19 to i64, !dbg !216
  %arrayidx47 = getelementptr inbounds i32, i32* %18, i64 %idxprom46, !dbg !216
  store i32 0, i32* %arrayidx47, align 4, !dbg !219
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !221
  %inc = add nsw i32 %20, 1, !dbg !221
  store i32 %inc, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !222, !llvm.loop !223

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !226
  %cmp48 = icmp sge i32 %21, 0, !dbg !228
  br i1 %cmp48, label %if.then50, label %if.else, !dbg !229

if.then50:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !230
  %23 = load i32, i32* %data, align 4, !dbg !232
  %idxprom51 = sext i32 %23 to i64, !dbg !230
  %arrayidx52 = getelementptr inbounds i32, i32* %22, i64 %idxprom51, !dbg !230
  store i32 1, i32* %arrayidx52, align 4, !dbg !233
  store i32 0, i32* %i, align 4, !dbg !234
  br label %for.cond53, !dbg !236

for.cond53:                                       ; preds = %for.inc59, %if.then50
  %24 = load i32, i32* %i, align 4, !dbg !237
  %cmp54 = icmp slt i32 %24, 10, !dbg !239
  br i1 %cmp54, label %for.body56, label %for.end61, !dbg !240

for.body56:                                       ; preds = %for.cond53
  %25 = load i32*, i32** %buffer, align 8, !dbg !241
  %26 = load i32, i32* %i, align 4, !dbg !243
  %idxprom57 = sext i32 %26 to i64, !dbg !241
  %arrayidx58 = getelementptr inbounds i32, i32* %25, i64 %idxprom57, !dbg !241
  %27 = load i32, i32* %arrayidx58, align 4, !dbg !241
  call void @printIntLine(i32 %27), !dbg !244
  br label %for.inc59, !dbg !245

for.inc59:                                        ; preds = %for.body56
  %28 = load i32, i32* %i, align 4, !dbg !246
  %inc60 = add nsw i32 %28, 1, !dbg !246
  store i32 %inc60, i32* %i, align 4, !dbg !246
  br label %for.cond53, !dbg !247, !llvm.loop !248

for.end61:                                        ; preds = %for.cond53
  br label %if.end62, !dbg !250

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !251
  br label %if.end62

if.end62:                                         ; preds = %if.else, %for.end61
  %29 = load i32*, i32** %buffer, align 8, !dbg !253
  %30 = bitcast i32* %29 to i8*, !dbg !253
  call void @free(i8* %30) #8, !dbg !254
  br label %if.end63, !dbg !255

if.end63:                                         ; preds = %if.end62, %if.end35
  ret void, !dbg !256
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_good() #0 !dbg !257 {
entry:
  call void @goodB2G1(), !dbg !258
  call void @goodB2G2(), !dbg !259
  call void @goodG2B1(), !dbg !260
  call void @goodG2B2(), !dbg !261
  ret void, !dbg !262
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !263 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !268, metadata !DIExpression()), !dbg !269
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !270, metadata !DIExpression()), !dbg !271
  %call = call i64 @time(i64* null) #8, !dbg !272
  %conv = trunc i64 %call to i32, !dbg !273
  call void @srand(i32 %conv) #8, !dbg !274
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !275
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_good(), !dbg !276
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !277
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !278
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_bad(), !dbg !279
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !280
  ret i32 0, !dbg !281
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !282 {
entry:
  ret i32 1, !dbg !285
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !286 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !287, metadata !DIExpression()), !dbg !288
  store i32 -1, i32* %data, align 4, !dbg !289
  %call = call i32 @staticReturnsTrue(), !dbg !290
  %tobool = icmp ne i32 %call, 0, !dbg !290
  br i1 %tobool, label %if.then, label %if.end35, !dbg !292

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !293, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !297, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !299, metadata !DIExpression()), !dbg !300
  store i32 -1, i32* %listenSocket, align 4, !dbg !300
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !301, metadata !DIExpression()), !dbg !302
  store i32 -1, i32* %acceptSocket, align 4, !dbg !302
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !303, metadata !DIExpression()), !dbg !304
  br label %do.body, !dbg !305

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !306
  store i32 %call1, i32* %listenSocket, align 4, !dbg !308
  %0 = load i32, i32* %listenSocket, align 4, !dbg !309
  %cmp = icmp eq i32 %0, -1, !dbg !311
  br i1 %cmp, label %if.then2, label %if.end, !dbg !312

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !313

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !315
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !315
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !316
  store i16 2, i16* %sin_family, align 4, !dbg !317
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !318
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !319
  store i32 0, i32* %s_addr, align 4, !dbg !320
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !321
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !322
  store i16 %call3, i16* %sin_port, align 2, !dbg !323
  %2 = load i32, i32* %listenSocket, align 4, !dbg !324
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !326
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !327
  %cmp5 = icmp eq i32 %call4, -1, !dbg !328
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !329

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !330

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !332
  %call8 = call i32 @listen(i32 %4, i32 5) #8, !dbg !334
  %cmp9 = icmp eq i32 %call8, -1, !dbg !335
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !336

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !337

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !339
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !340
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !341
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !342
  %cmp13 = icmp eq i32 %6, -1, !dbg !344
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !345

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !346

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !348
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !349
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !350
  %conv = trunc i64 %call16 to i32, !dbg !350
  store i32 %conv, i32* %recvResult, align 4, !dbg !351
  %8 = load i32, i32* %recvResult, align 4, !dbg !352
  %cmp17 = icmp eq i32 %8, -1, !dbg !354
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !355

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !356
  %cmp19 = icmp eq i32 %9, 0, !dbg !357
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !358

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !359

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !361
  %idxprom = sext i32 %10 to i64, !dbg !362
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !362
  store i8 0, i8* %arrayidx, align 1, !dbg !363
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !364
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !365
  store i32 %call24, i32* %data, align 4, !dbg !366
  br label %do.end, !dbg !367

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !368
  %cmp25 = icmp ne i32 %11, -1, !dbg !370
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !371

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !372
  %call28 = call i32 @close(i32 %12), !dbg !374
  br label %if.end29, !dbg !375

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !376
  %cmp30 = icmp ne i32 %13, -1, !dbg !378
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !379

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !380
  %call33 = call i32 @close(i32 %14), !dbg !382
  br label %if.end34, !dbg !383

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !384

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 @staticReturnsFalse(), !dbg !385
  %tobool37 = icmp ne i32 %call36, 0, !dbg !385
  br i1 %tobool37, label %if.then38, label %if.else, !dbg !387

if.then38:                                        ; preds = %if.end35
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !388
  br label %if.end66, !dbg !390

if.else:                                          ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !391, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !395, metadata !DIExpression()), !dbg !396
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !397
  %15 = bitcast i8* %call39 to i32*, !dbg !398
  store i32* %15, i32** %buffer, align 8, !dbg !396
  %16 = load i32*, i32** %buffer, align 8, !dbg !399
  %cmp40 = icmp eq i32* %16, null, !dbg !401
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !402

if.then42:                                        ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !403
  unreachable, !dbg !403

if.end43:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !405
  br label %for.cond, !dbg !407

for.cond:                                         ; preds = %for.inc, %if.end43
  %17 = load i32, i32* %i, align 4, !dbg !408
  %cmp44 = icmp slt i32 %17, 10, !dbg !410
  br i1 %cmp44, label %for.body, label %for.end, !dbg !411

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !412
  %19 = load i32, i32* %i, align 4, !dbg !414
  %idxprom46 = sext i32 %19 to i64, !dbg !412
  %arrayidx47 = getelementptr inbounds i32, i32* %18, i64 %idxprom46, !dbg !412
  store i32 0, i32* %arrayidx47, align 4, !dbg !415
  br label %for.inc, !dbg !416

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !417
  %inc = add nsw i32 %20, 1, !dbg !417
  store i32 %inc, i32* %i, align 4, !dbg !417
  br label %for.cond, !dbg !418, !llvm.loop !419

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !421
  %cmp48 = icmp sge i32 %21, 0, !dbg !423
  br i1 %cmp48, label %land.lhs.true, label %if.else64, !dbg !424

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !425
  %cmp50 = icmp slt i32 %22, 10, !dbg !426
  br i1 %cmp50, label %if.then52, label %if.else64, !dbg !427

if.then52:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !428
  %24 = load i32, i32* %data, align 4, !dbg !430
  %idxprom53 = sext i32 %24 to i64, !dbg !428
  %arrayidx54 = getelementptr inbounds i32, i32* %23, i64 %idxprom53, !dbg !428
  store i32 1, i32* %arrayidx54, align 4, !dbg !431
  store i32 0, i32* %i, align 4, !dbg !432
  br label %for.cond55, !dbg !434

for.cond55:                                       ; preds = %for.inc61, %if.then52
  %25 = load i32, i32* %i, align 4, !dbg !435
  %cmp56 = icmp slt i32 %25, 10, !dbg !437
  br i1 %cmp56, label %for.body58, label %for.end63, !dbg !438

for.body58:                                       ; preds = %for.cond55
  %26 = load i32*, i32** %buffer, align 8, !dbg !439
  %27 = load i32, i32* %i, align 4, !dbg !441
  %idxprom59 = sext i32 %27 to i64, !dbg !439
  %arrayidx60 = getelementptr inbounds i32, i32* %26, i64 %idxprom59, !dbg !439
  %28 = load i32, i32* %arrayidx60, align 4, !dbg !439
  call void @printIntLine(i32 %28), !dbg !442
  br label %for.inc61, !dbg !443

for.inc61:                                        ; preds = %for.body58
  %29 = load i32, i32* %i, align 4, !dbg !444
  %inc62 = add nsw i32 %29, 1, !dbg !444
  store i32 %inc62, i32* %i, align 4, !dbg !444
  br label %for.cond55, !dbg !445, !llvm.loop !446

for.end63:                                        ; preds = %for.cond55
  br label %if.end65, !dbg !448

if.else64:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !449
  br label %if.end65

if.end65:                                         ; preds = %if.else64, %for.end63
  %30 = load i32*, i32** %buffer, align 8, !dbg !451
  %31 = bitcast i32* %30 to i8*, !dbg !451
  call void @free(i8* %31) #8, !dbg !452
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %if.then38
  ret void, !dbg !453
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !454 {
entry:
  ret i32 0, !dbg !455
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !456 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !457, metadata !DIExpression()), !dbg !458
  store i32 -1, i32* %data, align 4, !dbg !459
  %call = call i32 @staticReturnsTrue(), !dbg !460
  %tobool = icmp ne i32 %call, 0, !dbg !460
  br i1 %tobool, label %if.then, label %if.end35, !dbg !462

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !463, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !467, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !469, metadata !DIExpression()), !dbg !470
  store i32 -1, i32* %listenSocket, align 4, !dbg !470
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !471, metadata !DIExpression()), !dbg !472
  store i32 -1, i32* %acceptSocket, align 4, !dbg !472
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !473, metadata !DIExpression()), !dbg !474
  br label %do.body, !dbg !475

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !476
  store i32 %call1, i32* %listenSocket, align 4, !dbg !478
  %0 = load i32, i32* %listenSocket, align 4, !dbg !479
  %cmp = icmp eq i32 %0, -1, !dbg !481
  br i1 %cmp, label %if.then2, label %if.end, !dbg !482

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !483

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !485
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !485
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !486
  store i16 2, i16* %sin_family, align 4, !dbg !487
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !488
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !489
  store i32 0, i32* %s_addr, align 4, !dbg !490
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !491
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !492
  store i16 %call3, i16* %sin_port, align 2, !dbg !493
  %2 = load i32, i32* %listenSocket, align 4, !dbg !494
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !496
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !497
  %cmp5 = icmp eq i32 %call4, -1, !dbg !498
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !499

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !500

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !502
  %call8 = call i32 @listen(i32 %4, i32 5) #8, !dbg !504
  %cmp9 = icmp eq i32 %call8, -1, !dbg !505
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !506

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !507

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !509
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !510
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !511
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !512
  %cmp13 = icmp eq i32 %6, -1, !dbg !514
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !515

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !516

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !518
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !519
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !520
  %conv = trunc i64 %call16 to i32, !dbg !520
  store i32 %conv, i32* %recvResult, align 4, !dbg !521
  %8 = load i32, i32* %recvResult, align 4, !dbg !522
  %cmp17 = icmp eq i32 %8, -1, !dbg !524
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !525

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !526
  %cmp19 = icmp eq i32 %9, 0, !dbg !527
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !528

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !529

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !531
  %idxprom = sext i32 %10 to i64, !dbg !532
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !532
  store i8 0, i8* %arrayidx, align 1, !dbg !533
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !534
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !535
  store i32 %call24, i32* %data, align 4, !dbg !536
  br label %do.end, !dbg !537

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !538
  %cmp25 = icmp ne i32 %11, -1, !dbg !540
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !541

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !542
  %call28 = call i32 @close(i32 %12), !dbg !544
  br label %if.end29, !dbg !545

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !546
  %cmp30 = icmp ne i32 %13, -1, !dbg !548
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !549

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !550
  %call33 = call i32 @close(i32 %14), !dbg !552
  br label %if.end34, !dbg !553

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !554

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 @staticReturnsTrue(), !dbg !555
  %tobool37 = icmp ne i32 %call36, 0, !dbg !555
  br i1 %tobool37, label %if.then38, label %if.end65, !dbg !557

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !558, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !562, metadata !DIExpression()), !dbg !563
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !564
  %15 = bitcast i8* %call39 to i32*, !dbg !565
  store i32* %15, i32** %buffer, align 8, !dbg !563
  %16 = load i32*, i32** %buffer, align 8, !dbg !566
  %cmp40 = icmp eq i32* %16, null, !dbg !568
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !569

if.then42:                                        ; preds = %if.then38
  call void @exit(i32 -1) #11, !dbg !570
  unreachable, !dbg !570

if.end43:                                         ; preds = %if.then38
  store i32 0, i32* %i, align 4, !dbg !572
  br label %for.cond, !dbg !574

for.cond:                                         ; preds = %for.inc, %if.end43
  %17 = load i32, i32* %i, align 4, !dbg !575
  %cmp44 = icmp slt i32 %17, 10, !dbg !577
  br i1 %cmp44, label %for.body, label %for.end, !dbg !578

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !579
  %19 = load i32, i32* %i, align 4, !dbg !581
  %idxprom46 = sext i32 %19 to i64, !dbg !579
  %arrayidx47 = getelementptr inbounds i32, i32* %18, i64 %idxprom46, !dbg !579
  store i32 0, i32* %arrayidx47, align 4, !dbg !582
  br label %for.inc, !dbg !583

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !584
  %inc = add nsw i32 %20, 1, !dbg !584
  store i32 %inc, i32* %i, align 4, !dbg !584
  br label %for.cond, !dbg !585, !llvm.loop !586

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !588
  %cmp48 = icmp sge i32 %21, 0, !dbg !590
  br i1 %cmp48, label %land.lhs.true, label %if.else, !dbg !591

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !592
  %cmp50 = icmp slt i32 %22, 10, !dbg !593
  br i1 %cmp50, label %if.then52, label %if.else, !dbg !594

if.then52:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !595
  %24 = load i32, i32* %data, align 4, !dbg !597
  %idxprom53 = sext i32 %24 to i64, !dbg !595
  %arrayidx54 = getelementptr inbounds i32, i32* %23, i64 %idxprom53, !dbg !595
  store i32 1, i32* %arrayidx54, align 4, !dbg !598
  store i32 0, i32* %i, align 4, !dbg !599
  br label %for.cond55, !dbg !601

for.cond55:                                       ; preds = %for.inc61, %if.then52
  %25 = load i32, i32* %i, align 4, !dbg !602
  %cmp56 = icmp slt i32 %25, 10, !dbg !604
  br i1 %cmp56, label %for.body58, label %for.end63, !dbg !605

for.body58:                                       ; preds = %for.cond55
  %26 = load i32*, i32** %buffer, align 8, !dbg !606
  %27 = load i32, i32* %i, align 4, !dbg !608
  %idxprom59 = sext i32 %27 to i64, !dbg !606
  %arrayidx60 = getelementptr inbounds i32, i32* %26, i64 %idxprom59, !dbg !606
  %28 = load i32, i32* %arrayidx60, align 4, !dbg !606
  call void @printIntLine(i32 %28), !dbg !609
  br label %for.inc61, !dbg !610

for.inc61:                                        ; preds = %for.body58
  %29 = load i32, i32* %i, align 4, !dbg !611
  %inc62 = add nsw i32 %29, 1, !dbg !611
  store i32 %inc62, i32* %i, align 4, !dbg !611
  br label %for.cond55, !dbg !612, !llvm.loop !613

for.end63:                                        ; preds = %for.cond55
  br label %if.end64, !dbg !615

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !616
  br label %if.end64

if.end64:                                         ; preds = %if.else, %for.end63
  %30 = load i32*, i32** %buffer, align 8, !dbg !618
  %31 = bitcast i32* %30 to i8*, !dbg !618
  call void @free(i8* %31) #8, !dbg !619
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
  %call = call i32 @staticReturnsFalse(), !dbg !626
  %tobool = icmp ne i32 %call, 0, !dbg !626
  br i1 %tobool, label %if.then, label %if.else, !dbg !628

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !629
  br label %if.end, !dbg !631

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !632
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !634
  %tobool2 = icmp ne i32 %call1, 0, !dbg !634
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !636

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !637, metadata !DIExpression()), !dbg !640
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !641, metadata !DIExpression()), !dbg !642
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !643
  %0 = bitcast i8* %call4 to i32*, !dbg !644
  store i32* %0, i32** %buffer, align 8, !dbg !642
  %1 = load i32*, i32** %buffer, align 8, !dbg !645
  %cmp = icmp eq i32* %1, null, !dbg !647
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !648

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #11, !dbg !649
  unreachable, !dbg !649

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !651
  br label %for.cond, !dbg !653

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !654
  %cmp7 = icmp slt i32 %2, 10, !dbg !656
  br i1 %cmp7, label %for.body, label %for.end, !dbg !657

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !658
  %4 = load i32, i32* %i, align 4, !dbg !660
  %idxprom = sext i32 %4 to i64, !dbg !658
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !658
  store i32 0, i32* %arrayidx, align 4, !dbg !661
  br label %for.inc, !dbg !662

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !663
  %inc = add nsw i32 %5, 1, !dbg !663
  store i32 %inc, i32* %i, align 4, !dbg !663
  br label %for.cond, !dbg !664, !llvm.loop !665

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !667
  %cmp8 = icmp sge i32 %6, 0, !dbg !669
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !670

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !671
  %8 = load i32, i32* %data, align 4, !dbg !673
  %idxprom10 = sext i32 %8 to i64, !dbg !671
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !671
  store i32 1, i32* %arrayidx11, align 4, !dbg !674
  store i32 0, i32* %i, align 4, !dbg !675
  br label %for.cond12, !dbg !677

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !678
  %cmp13 = icmp slt i32 %9, 10, !dbg !680
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !681

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !682
  %11 = load i32, i32* %i, align 4, !dbg !684
  %idxprom15 = sext i32 %11 to i64, !dbg !682
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !682
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !682
  call void @printIntLine(i32 %12), !dbg !685
  br label %for.inc17, !dbg !686

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !687
  %inc18 = add nsw i32 %13, 1, !dbg !687
  store i32 %inc18, i32* %i, align 4, !dbg !687
  br label %for.cond12, !dbg !688, !llvm.loop !689

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !691

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !692
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !694
  %15 = bitcast i32* %14 to i8*, !dbg !694
  call void @free(i8* %15) #8, !dbg !695
  br label %if.end22, !dbg !696

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !697
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !698 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !699, metadata !DIExpression()), !dbg !700
  store i32 -1, i32* %data, align 4, !dbg !701
  %call = call i32 @staticReturnsTrue(), !dbg !702
  %tobool = icmp ne i32 %call, 0, !dbg !702
  br i1 %tobool, label %if.then, label %if.end, !dbg !704

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !705
  br label %if.end, !dbg !707

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !708
  %tobool2 = icmp ne i32 %call1, 0, !dbg !708
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !710

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !711, metadata !DIExpression()), !dbg !714
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !715, metadata !DIExpression()), !dbg !716
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !717
  %0 = bitcast i8* %call4 to i32*, !dbg !718
  store i32* %0, i32** %buffer, align 8, !dbg !716
  %1 = load i32*, i32** %buffer, align 8, !dbg !719
  %cmp = icmp eq i32* %1, null, !dbg !721
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !722

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #11, !dbg !723
  unreachable, !dbg !723

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !725
  br label %for.cond, !dbg !727

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !728
  %cmp7 = icmp slt i32 %2, 10, !dbg !730
  br i1 %cmp7, label %for.body, label %for.end, !dbg !731

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !732
  %4 = load i32, i32* %i, align 4, !dbg !734
  %idxprom = sext i32 %4 to i64, !dbg !732
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !732
  store i32 0, i32* %arrayidx, align 4, !dbg !735
  br label %for.inc, !dbg !736

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !737
  %inc = add nsw i32 %5, 1, !dbg !737
  store i32 %inc, i32* %i, align 4, !dbg !737
  br label %for.cond, !dbg !738, !llvm.loop !739

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !741
  %cmp8 = icmp sge i32 %6, 0, !dbg !743
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !744

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !745
  %8 = load i32, i32* %data, align 4, !dbg !747
  %idxprom10 = sext i32 %8 to i64, !dbg !745
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !745
  store i32 1, i32* %arrayidx11, align 4, !dbg !748
  store i32 0, i32* %i, align 4, !dbg !749
  br label %for.cond12, !dbg !751

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !752
  %cmp13 = icmp slt i32 %9, 10, !dbg !754
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !755

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !756
  %11 = load i32, i32* %i, align 4, !dbg !758
  %idxprom15 = sext i32 %11 to i64, !dbg !756
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !756
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !756
  call void @printIntLine(i32 %12), !dbg !759
  br label %for.inc17, !dbg !760

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !761
  %inc18 = add nsw i32 %13, 1, !dbg !761
  store i32 %inc18, i32* %i, align 4, !dbg !761
  br label %for.cond12, !dbg !762, !llvm.loop !763

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !765

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !766
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !768
  %15 = bitcast i32* %14 to i8*, !dbg !768
  call void @free(i8* %15) #8, !dbg !769
  br label %if.end21, !dbg !770

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !771
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08.c", directory: "/root/SSE-Assessment")
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
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_bad", scope: !74, file: !74, line: 57, type: !75, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08.c", directory: "/root/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 59, type: !65)
!79 = !DILocation(line: 59, column: 9, scope: !73)
!80 = !DILocation(line: 61, column: 10, scope: !73)
!81 = !DILocation(line: 62, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !74, line: 62, column: 8)
!83 = !DILocation(line: 62, column: 8, scope: !73)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !74, line: 69, type: !65)
!85 = distinct !DILexicalBlock(scope: !86, file: !74, line: 64, column: 9)
!86 = distinct !DILexicalBlock(scope: !82, file: !74, line: 63, column: 5)
!87 = !DILocation(line: 69, column: 17, scope: !85)
!88 = !DILocalVariable(name: "service", scope: !85, file: !74, line: 70, type: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !90)
!90 = !{!91, !92, !96, !100}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !89, file: !17, line: 239, baseType: !56, size: 16)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !89, file: !17, line: 240, baseType: !93, size: 16, offset: 16)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !89, file: !17, line: 241, baseType: !97, size: 32, offset: 32)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !98)
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !97, file: !17, line: 33, baseType: !46, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !89, file: !17, line: 244, baseType: !101, size: 64, offset: 64)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 64, elements: !103)
!102 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!103 = !{!104}
!104 = !DISubrange(count: 8)
!105 = !DILocation(line: 70, column: 32, scope: !85)
!106 = !DILocalVariable(name: "listenSocket", scope: !85, file: !74, line: 71, type: !65)
!107 = !DILocation(line: 71, column: 20, scope: !85)
!108 = !DILocalVariable(name: "acceptSocket", scope: !85, file: !74, line: 72, type: !65)
!109 = !DILocation(line: 72, column: 20, scope: !85)
!110 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !74, line: 73, type: !60)
!111 = !DILocation(line: 73, column: 18, scope: !85)
!112 = !DILocation(line: 74, column: 13, scope: !85)
!113 = !DILocation(line: 84, column: 32, scope: !114)
!114 = distinct !DILexicalBlock(scope: !85, file: !74, line: 75, column: 13)
!115 = !DILocation(line: 84, column: 30, scope: !114)
!116 = !DILocation(line: 85, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !74, line: 85, column: 21)
!118 = !DILocation(line: 85, column: 34, scope: !117)
!119 = !DILocation(line: 85, column: 21, scope: !114)
!120 = !DILocation(line: 87, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !74, line: 86, column: 17)
!122 = !DILocation(line: 89, column: 17, scope: !114)
!123 = !DILocation(line: 90, column: 25, scope: !114)
!124 = !DILocation(line: 90, column: 36, scope: !114)
!125 = !DILocation(line: 91, column: 25, scope: !114)
!126 = !DILocation(line: 91, column: 34, scope: !114)
!127 = !DILocation(line: 91, column: 41, scope: !114)
!128 = !DILocation(line: 92, column: 36, scope: !114)
!129 = !DILocation(line: 92, column: 25, scope: !114)
!130 = !DILocation(line: 92, column: 34, scope: !114)
!131 = !DILocation(line: 93, column: 26, scope: !132)
!132 = distinct !DILexicalBlock(scope: !114, file: !74, line: 93, column: 21)
!133 = !DILocation(line: 93, column: 40, scope: !132)
!134 = !DILocation(line: 93, column: 21, scope: !132)
!135 = !DILocation(line: 93, column: 85, scope: !132)
!136 = !DILocation(line: 93, column: 21, scope: !114)
!137 = !DILocation(line: 95, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !74, line: 94, column: 17)
!139 = !DILocation(line: 97, column: 28, scope: !140)
!140 = distinct !DILexicalBlock(scope: !114, file: !74, line: 97, column: 21)
!141 = !DILocation(line: 97, column: 21, scope: !140)
!142 = !DILocation(line: 97, column: 58, scope: !140)
!143 = !DILocation(line: 97, column: 21, scope: !114)
!144 = !DILocation(line: 99, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !74, line: 98, column: 17)
!146 = !DILocation(line: 101, column: 39, scope: !114)
!147 = !DILocation(line: 101, column: 32, scope: !114)
!148 = !DILocation(line: 101, column: 30, scope: !114)
!149 = !DILocation(line: 102, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !114, file: !74, line: 102, column: 21)
!151 = !DILocation(line: 102, column: 34, scope: !150)
!152 = !DILocation(line: 102, column: 21, scope: !114)
!153 = !DILocation(line: 104, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !74, line: 103, column: 17)
!155 = !DILocation(line: 107, column: 35, scope: !114)
!156 = !DILocation(line: 107, column: 49, scope: !114)
!157 = !DILocation(line: 107, column: 30, scope: !114)
!158 = !DILocation(line: 107, column: 28, scope: !114)
!159 = !DILocation(line: 108, column: 21, scope: !160)
!160 = distinct !DILexicalBlock(scope: !114, file: !74, line: 108, column: 21)
!161 = !DILocation(line: 108, column: 32, scope: !160)
!162 = !DILocation(line: 108, column: 48, scope: !160)
!163 = !DILocation(line: 108, column: 51, scope: !160)
!164 = !DILocation(line: 108, column: 62, scope: !160)
!165 = !DILocation(line: 108, column: 21, scope: !114)
!166 = !DILocation(line: 110, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !160, file: !74, line: 109, column: 17)
!168 = !DILocation(line: 113, column: 29, scope: !114)
!169 = !DILocation(line: 113, column: 17, scope: !114)
!170 = !DILocation(line: 113, column: 41, scope: !114)
!171 = !DILocation(line: 115, column: 29, scope: !114)
!172 = !DILocation(line: 115, column: 24, scope: !114)
!173 = !DILocation(line: 115, column: 22, scope: !114)
!174 = !DILocation(line: 116, column: 13, scope: !114)
!175 = !DILocation(line: 118, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !85, file: !74, line: 118, column: 17)
!177 = !DILocation(line: 118, column: 30, scope: !176)
!178 = !DILocation(line: 118, column: 17, scope: !85)
!179 = !DILocation(line: 120, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !74, line: 119, column: 13)
!181 = !DILocation(line: 120, column: 17, scope: !180)
!182 = !DILocation(line: 121, column: 13, scope: !180)
!183 = !DILocation(line: 122, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !85, file: !74, line: 122, column: 17)
!185 = !DILocation(line: 122, column: 30, scope: !184)
!186 = !DILocation(line: 122, column: 17, scope: !85)
!187 = !DILocation(line: 124, column: 30, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !74, line: 123, column: 13)
!189 = !DILocation(line: 124, column: 17, scope: !188)
!190 = !DILocation(line: 125, column: 13, scope: !188)
!191 = !DILocation(line: 133, column: 5, scope: !86)
!192 = !DILocation(line: 134, column: 8, scope: !193)
!193 = distinct !DILexicalBlock(scope: !73, file: !74, line: 134, column: 8)
!194 = !DILocation(line: 134, column: 8, scope: !73)
!195 = !DILocalVariable(name: "i", scope: !196, file: !74, line: 137, type: !65)
!196 = distinct !DILexicalBlock(scope: !197, file: !74, line: 136, column: 9)
!197 = distinct !DILexicalBlock(scope: !193, file: !74, line: 135, column: 5)
!198 = !DILocation(line: 137, column: 17, scope: !196)
!199 = !DILocalVariable(name: "buffer", scope: !196, file: !74, line: 138, type: !64)
!200 = !DILocation(line: 138, column: 19, scope: !196)
!201 = !DILocation(line: 138, column: 35, scope: !196)
!202 = !DILocation(line: 138, column: 28, scope: !196)
!203 = !DILocation(line: 139, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !196, file: !74, line: 139, column: 17)
!205 = !DILocation(line: 139, column: 24, scope: !204)
!206 = !DILocation(line: 139, column: 17, scope: !196)
!207 = !DILocation(line: 139, column: 34, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !74, line: 139, column: 33)
!209 = !DILocation(line: 141, column: 20, scope: !210)
!210 = distinct !DILexicalBlock(scope: !196, file: !74, line: 141, column: 13)
!211 = !DILocation(line: 141, column: 18, scope: !210)
!212 = !DILocation(line: 141, column: 25, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !74, line: 141, column: 13)
!214 = !DILocation(line: 141, column: 27, scope: !213)
!215 = !DILocation(line: 141, column: 13, scope: !210)
!216 = !DILocation(line: 143, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !74, line: 142, column: 13)
!218 = !DILocation(line: 143, column: 24, scope: !217)
!219 = !DILocation(line: 143, column: 27, scope: !217)
!220 = !DILocation(line: 144, column: 13, scope: !217)
!221 = !DILocation(line: 141, column: 34, scope: !213)
!222 = !DILocation(line: 141, column: 13, scope: !213)
!223 = distinct !{!223, !215, !224, !225}
!224 = !DILocation(line: 144, column: 13, scope: !210)
!225 = !{!"llvm.loop.mustprogress"}
!226 = !DILocation(line: 147, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !196, file: !74, line: 147, column: 17)
!228 = !DILocation(line: 147, column: 22, scope: !227)
!229 = !DILocation(line: 147, column: 17, scope: !196)
!230 = !DILocation(line: 149, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !74, line: 148, column: 13)
!232 = !DILocation(line: 149, column: 24, scope: !231)
!233 = !DILocation(line: 149, column: 30, scope: !231)
!234 = !DILocation(line: 151, column: 23, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !74, line: 151, column: 17)
!236 = !DILocation(line: 151, column: 21, scope: !235)
!237 = !DILocation(line: 151, column: 28, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !74, line: 151, column: 17)
!239 = !DILocation(line: 151, column: 30, scope: !238)
!240 = !DILocation(line: 151, column: 17, scope: !235)
!241 = !DILocation(line: 153, column: 34, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !74, line: 152, column: 17)
!243 = !DILocation(line: 153, column: 41, scope: !242)
!244 = !DILocation(line: 153, column: 21, scope: !242)
!245 = !DILocation(line: 154, column: 17, scope: !242)
!246 = !DILocation(line: 151, column: 37, scope: !238)
!247 = !DILocation(line: 151, column: 17, scope: !238)
!248 = distinct !{!248, !240, !249, !225}
!249 = !DILocation(line: 154, column: 17, scope: !235)
!250 = !DILocation(line: 155, column: 13, scope: !231)
!251 = !DILocation(line: 158, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !227, file: !74, line: 157, column: 13)
!253 = !DILocation(line: 160, column: 18, scope: !196)
!254 = !DILocation(line: 160, column: 13, scope: !196)
!255 = !DILocation(line: 162, column: 5, scope: !197)
!256 = !DILocation(line: 163, column: 1, scope: !73)
!257 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_good", scope: !74, file: !74, line: 481, type: !75, scopeLine: 482, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!258 = !DILocation(line: 483, column: 5, scope: !257)
!259 = !DILocation(line: 484, column: 5, scope: !257)
!260 = !DILocation(line: 485, column: 5, scope: !257)
!261 = !DILocation(line: 486, column: 5, scope: !257)
!262 = !DILocation(line: 487, column: 1, scope: !257)
!263 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 498, type: !264, scopeLine: 499, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!264 = !DISubroutineType(types: !265)
!265 = !{!65, !65, !266}
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !267, size: 64)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!268 = !DILocalVariable(name: "argc", arg: 1, scope: !263, file: !74, line: 498, type: !65)
!269 = !DILocation(line: 498, column: 14, scope: !263)
!270 = !DILocalVariable(name: "argv", arg: 2, scope: !263, file: !74, line: 498, type: !266)
!271 = !DILocation(line: 498, column: 27, scope: !263)
!272 = !DILocation(line: 501, column: 22, scope: !263)
!273 = !DILocation(line: 501, column: 12, scope: !263)
!274 = !DILocation(line: 501, column: 5, scope: !263)
!275 = !DILocation(line: 503, column: 5, scope: !263)
!276 = !DILocation(line: 504, column: 5, scope: !263)
!277 = !DILocation(line: 505, column: 5, scope: !263)
!278 = !DILocation(line: 508, column: 5, scope: !263)
!279 = !DILocation(line: 509, column: 5, scope: !263)
!280 = !DILocation(line: 510, column: 5, scope: !263)
!281 = !DILocation(line: 512, column: 5, scope: !263)
!282 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !74, file: !74, line: 45, type: !283, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!283 = !DISubroutineType(types: !284)
!284 = !{!65}
!285 = !DILocation(line: 47, column: 5, scope: !282)
!286 = distinct !DISubprogram(name: "goodB2G1", scope: !74, file: !74, line: 170, type: !75, scopeLine: 171, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!287 = !DILocalVariable(name: "data", scope: !286, file: !74, line: 172, type: !65)
!288 = !DILocation(line: 172, column: 9, scope: !286)
!289 = !DILocation(line: 174, column: 10, scope: !286)
!290 = !DILocation(line: 175, column: 8, scope: !291)
!291 = distinct !DILexicalBlock(scope: !286, file: !74, line: 175, column: 8)
!292 = !DILocation(line: 175, column: 8, scope: !286)
!293 = !DILocalVariable(name: "recvResult", scope: !294, file: !74, line: 182, type: !65)
!294 = distinct !DILexicalBlock(scope: !295, file: !74, line: 177, column: 9)
!295 = distinct !DILexicalBlock(scope: !291, file: !74, line: 176, column: 5)
!296 = !DILocation(line: 182, column: 17, scope: !294)
!297 = !DILocalVariable(name: "service", scope: !294, file: !74, line: 183, type: !89)
!298 = !DILocation(line: 183, column: 32, scope: !294)
!299 = !DILocalVariable(name: "listenSocket", scope: !294, file: !74, line: 184, type: !65)
!300 = !DILocation(line: 184, column: 20, scope: !294)
!301 = !DILocalVariable(name: "acceptSocket", scope: !294, file: !74, line: 185, type: !65)
!302 = !DILocation(line: 185, column: 20, scope: !294)
!303 = !DILocalVariable(name: "inputBuffer", scope: !294, file: !74, line: 186, type: !60)
!304 = !DILocation(line: 186, column: 18, scope: !294)
!305 = !DILocation(line: 187, column: 13, scope: !294)
!306 = !DILocation(line: 197, column: 32, scope: !307)
!307 = distinct !DILexicalBlock(scope: !294, file: !74, line: 188, column: 13)
!308 = !DILocation(line: 197, column: 30, scope: !307)
!309 = !DILocation(line: 198, column: 21, scope: !310)
!310 = distinct !DILexicalBlock(scope: !307, file: !74, line: 198, column: 21)
!311 = !DILocation(line: 198, column: 34, scope: !310)
!312 = !DILocation(line: 198, column: 21, scope: !307)
!313 = !DILocation(line: 200, column: 21, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !74, line: 199, column: 17)
!315 = !DILocation(line: 202, column: 17, scope: !307)
!316 = !DILocation(line: 203, column: 25, scope: !307)
!317 = !DILocation(line: 203, column: 36, scope: !307)
!318 = !DILocation(line: 204, column: 25, scope: !307)
!319 = !DILocation(line: 204, column: 34, scope: !307)
!320 = !DILocation(line: 204, column: 41, scope: !307)
!321 = !DILocation(line: 205, column: 36, scope: !307)
!322 = !DILocation(line: 205, column: 25, scope: !307)
!323 = !DILocation(line: 205, column: 34, scope: !307)
!324 = !DILocation(line: 206, column: 26, scope: !325)
!325 = distinct !DILexicalBlock(scope: !307, file: !74, line: 206, column: 21)
!326 = !DILocation(line: 206, column: 40, scope: !325)
!327 = !DILocation(line: 206, column: 21, scope: !325)
!328 = !DILocation(line: 206, column: 85, scope: !325)
!329 = !DILocation(line: 206, column: 21, scope: !307)
!330 = !DILocation(line: 208, column: 21, scope: !331)
!331 = distinct !DILexicalBlock(scope: !325, file: !74, line: 207, column: 17)
!332 = !DILocation(line: 210, column: 28, scope: !333)
!333 = distinct !DILexicalBlock(scope: !307, file: !74, line: 210, column: 21)
!334 = !DILocation(line: 210, column: 21, scope: !333)
!335 = !DILocation(line: 210, column: 58, scope: !333)
!336 = !DILocation(line: 210, column: 21, scope: !307)
!337 = !DILocation(line: 212, column: 21, scope: !338)
!338 = distinct !DILexicalBlock(scope: !333, file: !74, line: 211, column: 17)
!339 = !DILocation(line: 214, column: 39, scope: !307)
!340 = !DILocation(line: 214, column: 32, scope: !307)
!341 = !DILocation(line: 214, column: 30, scope: !307)
!342 = !DILocation(line: 215, column: 21, scope: !343)
!343 = distinct !DILexicalBlock(scope: !307, file: !74, line: 215, column: 21)
!344 = !DILocation(line: 215, column: 34, scope: !343)
!345 = !DILocation(line: 215, column: 21, scope: !307)
!346 = !DILocation(line: 217, column: 21, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !74, line: 216, column: 17)
!348 = !DILocation(line: 220, column: 35, scope: !307)
!349 = !DILocation(line: 220, column: 49, scope: !307)
!350 = !DILocation(line: 220, column: 30, scope: !307)
!351 = !DILocation(line: 220, column: 28, scope: !307)
!352 = !DILocation(line: 221, column: 21, scope: !353)
!353 = distinct !DILexicalBlock(scope: !307, file: !74, line: 221, column: 21)
!354 = !DILocation(line: 221, column: 32, scope: !353)
!355 = !DILocation(line: 221, column: 48, scope: !353)
!356 = !DILocation(line: 221, column: 51, scope: !353)
!357 = !DILocation(line: 221, column: 62, scope: !353)
!358 = !DILocation(line: 221, column: 21, scope: !307)
!359 = !DILocation(line: 223, column: 21, scope: !360)
!360 = distinct !DILexicalBlock(scope: !353, file: !74, line: 222, column: 17)
!361 = !DILocation(line: 226, column: 29, scope: !307)
!362 = !DILocation(line: 226, column: 17, scope: !307)
!363 = !DILocation(line: 226, column: 41, scope: !307)
!364 = !DILocation(line: 228, column: 29, scope: !307)
!365 = !DILocation(line: 228, column: 24, scope: !307)
!366 = !DILocation(line: 228, column: 22, scope: !307)
!367 = !DILocation(line: 229, column: 13, scope: !307)
!368 = !DILocation(line: 231, column: 17, scope: !369)
!369 = distinct !DILexicalBlock(scope: !294, file: !74, line: 231, column: 17)
!370 = !DILocation(line: 231, column: 30, scope: !369)
!371 = !DILocation(line: 231, column: 17, scope: !294)
!372 = !DILocation(line: 233, column: 30, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !74, line: 232, column: 13)
!374 = !DILocation(line: 233, column: 17, scope: !373)
!375 = !DILocation(line: 234, column: 13, scope: !373)
!376 = !DILocation(line: 235, column: 17, scope: !377)
!377 = distinct !DILexicalBlock(scope: !294, file: !74, line: 235, column: 17)
!378 = !DILocation(line: 235, column: 30, scope: !377)
!379 = !DILocation(line: 235, column: 17, scope: !294)
!380 = !DILocation(line: 237, column: 30, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !74, line: 236, column: 13)
!382 = !DILocation(line: 237, column: 17, scope: !381)
!383 = !DILocation(line: 238, column: 13, scope: !381)
!384 = !DILocation(line: 246, column: 5, scope: !295)
!385 = !DILocation(line: 247, column: 8, scope: !386)
!386 = distinct !DILexicalBlock(scope: !286, file: !74, line: 247, column: 8)
!387 = !DILocation(line: 247, column: 8, scope: !286)
!388 = !DILocation(line: 250, column: 9, scope: !389)
!389 = distinct !DILexicalBlock(scope: !386, file: !74, line: 248, column: 5)
!390 = !DILocation(line: 251, column: 5, scope: !389)
!391 = !DILocalVariable(name: "i", scope: !392, file: !74, line: 255, type: !65)
!392 = distinct !DILexicalBlock(scope: !393, file: !74, line: 254, column: 9)
!393 = distinct !DILexicalBlock(scope: !386, file: !74, line: 253, column: 5)
!394 = !DILocation(line: 255, column: 17, scope: !392)
!395 = !DILocalVariable(name: "buffer", scope: !392, file: !74, line: 256, type: !64)
!396 = !DILocation(line: 256, column: 19, scope: !392)
!397 = !DILocation(line: 256, column: 35, scope: !392)
!398 = !DILocation(line: 256, column: 28, scope: !392)
!399 = !DILocation(line: 257, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !392, file: !74, line: 257, column: 17)
!401 = !DILocation(line: 257, column: 24, scope: !400)
!402 = !DILocation(line: 257, column: 17, scope: !392)
!403 = !DILocation(line: 257, column: 34, scope: !404)
!404 = distinct !DILexicalBlock(scope: !400, file: !74, line: 257, column: 33)
!405 = !DILocation(line: 259, column: 20, scope: !406)
!406 = distinct !DILexicalBlock(scope: !392, file: !74, line: 259, column: 13)
!407 = !DILocation(line: 259, column: 18, scope: !406)
!408 = !DILocation(line: 259, column: 25, scope: !409)
!409 = distinct !DILexicalBlock(scope: !406, file: !74, line: 259, column: 13)
!410 = !DILocation(line: 259, column: 27, scope: !409)
!411 = !DILocation(line: 259, column: 13, scope: !406)
!412 = !DILocation(line: 261, column: 17, scope: !413)
!413 = distinct !DILexicalBlock(scope: !409, file: !74, line: 260, column: 13)
!414 = !DILocation(line: 261, column: 24, scope: !413)
!415 = !DILocation(line: 261, column: 27, scope: !413)
!416 = !DILocation(line: 262, column: 13, scope: !413)
!417 = !DILocation(line: 259, column: 34, scope: !409)
!418 = !DILocation(line: 259, column: 13, scope: !409)
!419 = distinct !{!419, !411, !420, !225}
!420 = !DILocation(line: 262, column: 13, scope: !406)
!421 = !DILocation(line: 264, column: 17, scope: !422)
!422 = distinct !DILexicalBlock(scope: !392, file: !74, line: 264, column: 17)
!423 = !DILocation(line: 264, column: 22, scope: !422)
!424 = !DILocation(line: 264, column: 27, scope: !422)
!425 = !DILocation(line: 264, column: 30, scope: !422)
!426 = !DILocation(line: 264, column: 35, scope: !422)
!427 = !DILocation(line: 264, column: 17, scope: !392)
!428 = !DILocation(line: 266, column: 17, scope: !429)
!429 = distinct !DILexicalBlock(scope: !422, file: !74, line: 265, column: 13)
!430 = !DILocation(line: 266, column: 24, scope: !429)
!431 = !DILocation(line: 266, column: 30, scope: !429)
!432 = !DILocation(line: 268, column: 23, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !74, line: 268, column: 17)
!434 = !DILocation(line: 268, column: 21, scope: !433)
!435 = !DILocation(line: 268, column: 28, scope: !436)
!436 = distinct !DILexicalBlock(scope: !433, file: !74, line: 268, column: 17)
!437 = !DILocation(line: 268, column: 30, scope: !436)
!438 = !DILocation(line: 268, column: 17, scope: !433)
!439 = !DILocation(line: 270, column: 34, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !74, line: 269, column: 17)
!441 = !DILocation(line: 270, column: 41, scope: !440)
!442 = !DILocation(line: 270, column: 21, scope: !440)
!443 = !DILocation(line: 271, column: 17, scope: !440)
!444 = !DILocation(line: 268, column: 37, scope: !436)
!445 = !DILocation(line: 268, column: 17, scope: !436)
!446 = distinct !{!446, !438, !447, !225}
!447 = !DILocation(line: 271, column: 17, scope: !433)
!448 = !DILocation(line: 272, column: 13, scope: !429)
!449 = !DILocation(line: 275, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !422, file: !74, line: 274, column: 13)
!451 = !DILocation(line: 277, column: 18, scope: !392)
!452 = !DILocation(line: 277, column: 13, scope: !392)
!453 = !DILocation(line: 280, column: 1, scope: !286)
!454 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !74, file: !74, line: 50, type: !283, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!455 = !DILocation(line: 52, column: 5, scope: !454)
!456 = distinct !DISubprogram(name: "goodB2G2", scope: !74, file: !74, line: 283, type: !75, scopeLine: 284, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!457 = !DILocalVariable(name: "data", scope: !456, file: !74, line: 285, type: !65)
!458 = !DILocation(line: 285, column: 9, scope: !456)
!459 = !DILocation(line: 287, column: 10, scope: !456)
!460 = !DILocation(line: 288, column: 8, scope: !461)
!461 = distinct !DILexicalBlock(scope: !456, file: !74, line: 288, column: 8)
!462 = !DILocation(line: 288, column: 8, scope: !456)
!463 = !DILocalVariable(name: "recvResult", scope: !464, file: !74, line: 295, type: !65)
!464 = distinct !DILexicalBlock(scope: !465, file: !74, line: 290, column: 9)
!465 = distinct !DILexicalBlock(scope: !461, file: !74, line: 289, column: 5)
!466 = !DILocation(line: 295, column: 17, scope: !464)
!467 = !DILocalVariable(name: "service", scope: !464, file: !74, line: 296, type: !89)
!468 = !DILocation(line: 296, column: 32, scope: !464)
!469 = !DILocalVariable(name: "listenSocket", scope: !464, file: !74, line: 297, type: !65)
!470 = !DILocation(line: 297, column: 20, scope: !464)
!471 = !DILocalVariable(name: "acceptSocket", scope: !464, file: !74, line: 298, type: !65)
!472 = !DILocation(line: 298, column: 20, scope: !464)
!473 = !DILocalVariable(name: "inputBuffer", scope: !464, file: !74, line: 299, type: !60)
!474 = !DILocation(line: 299, column: 18, scope: !464)
!475 = !DILocation(line: 300, column: 13, scope: !464)
!476 = !DILocation(line: 310, column: 32, scope: !477)
!477 = distinct !DILexicalBlock(scope: !464, file: !74, line: 301, column: 13)
!478 = !DILocation(line: 310, column: 30, scope: !477)
!479 = !DILocation(line: 311, column: 21, scope: !480)
!480 = distinct !DILexicalBlock(scope: !477, file: !74, line: 311, column: 21)
!481 = !DILocation(line: 311, column: 34, scope: !480)
!482 = !DILocation(line: 311, column: 21, scope: !477)
!483 = !DILocation(line: 313, column: 21, scope: !484)
!484 = distinct !DILexicalBlock(scope: !480, file: !74, line: 312, column: 17)
!485 = !DILocation(line: 315, column: 17, scope: !477)
!486 = !DILocation(line: 316, column: 25, scope: !477)
!487 = !DILocation(line: 316, column: 36, scope: !477)
!488 = !DILocation(line: 317, column: 25, scope: !477)
!489 = !DILocation(line: 317, column: 34, scope: !477)
!490 = !DILocation(line: 317, column: 41, scope: !477)
!491 = !DILocation(line: 318, column: 36, scope: !477)
!492 = !DILocation(line: 318, column: 25, scope: !477)
!493 = !DILocation(line: 318, column: 34, scope: !477)
!494 = !DILocation(line: 319, column: 26, scope: !495)
!495 = distinct !DILexicalBlock(scope: !477, file: !74, line: 319, column: 21)
!496 = !DILocation(line: 319, column: 40, scope: !495)
!497 = !DILocation(line: 319, column: 21, scope: !495)
!498 = !DILocation(line: 319, column: 85, scope: !495)
!499 = !DILocation(line: 319, column: 21, scope: !477)
!500 = !DILocation(line: 321, column: 21, scope: !501)
!501 = distinct !DILexicalBlock(scope: !495, file: !74, line: 320, column: 17)
!502 = !DILocation(line: 323, column: 28, scope: !503)
!503 = distinct !DILexicalBlock(scope: !477, file: !74, line: 323, column: 21)
!504 = !DILocation(line: 323, column: 21, scope: !503)
!505 = !DILocation(line: 323, column: 58, scope: !503)
!506 = !DILocation(line: 323, column: 21, scope: !477)
!507 = !DILocation(line: 325, column: 21, scope: !508)
!508 = distinct !DILexicalBlock(scope: !503, file: !74, line: 324, column: 17)
!509 = !DILocation(line: 327, column: 39, scope: !477)
!510 = !DILocation(line: 327, column: 32, scope: !477)
!511 = !DILocation(line: 327, column: 30, scope: !477)
!512 = !DILocation(line: 328, column: 21, scope: !513)
!513 = distinct !DILexicalBlock(scope: !477, file: !74, line: 328, column: 21)
!514 = !DILocation(line: 328, column: 34, scope: !513)
!515 = !DILocation(line: 328, column: 21, scope: !477)
!516 = !DILocation(line: 330, column: 21, scope: !517)
!517 = distinct !DILexicalBlock(scope: !513, file: !74, line: 329, column: 17)
!518 = !DILocation(line: 333, column: 35, scope: !477)
!519 = !DILocation(line: 333, column: 49, scope: !477)
!520 = !DILocation(line: 333, column: 30, scope: !477)
!521 = !DILocation(line: 333, column: 28, scope: !477)
!522 = !DILocation(line: 334, column: 21, scope: !523)
!523 = distinct !DILexicalBlock(scope: !477, file: !74, line: 334, column: 21)
!524 = !DILocation(line: 334, column: 32, scope: !523)
!525 = !DILocation(line: 334, column: 48, scope: !523)
!526 = !DILocation(line: 334, column: 51, scope: !523)
!527 = !DILocation(line: 334, column: 62, scope: !523)
!528 = !DILocation(line: 334, column: 21, scope: !477)
!529 = !DILocation(line: 336, column: 21, scope: !530)
!530 = distinct !DILexicalBlock(scope: !523, file: !74, line: 335, column: 17)
!531 = !DILocation(line: 339, column: 29, scope: !477)
!532 = !DILocation(line: 339, column: 17, scope: !477)
!533 = !DILocation(line: 339, column: 41, scope: !477)
!534 = !DILocation(line: 341, column: 29, scope: !477)
!535 = !DILocation(line: 341, column: 24, scope: !477)
!536 = !DILocation(line: 341, column: 22, scope: !477)
!537 = !DILocation(line: 342, column: 13, scope: !477)
!538 = !DILocation(line: 344, column: 17, scope: !539)
!539 = distinct !DILexicalBlock(scope: !464, file: !74, line: 344, column: 17)
!540 = !DILocation(line: 344, column: 30, scope: !539)
!541 = !DILocation(line: 344, column: 17, scope: !464)
!542 = !DILocation(line: 346, column: 30, scope: !543)
!543 = distinct !DILexicalBlock(scope: !539, file: !74, line: 345, column: 13)
!544 = !DILocation(line: 346, column: 17, scope: !543)
!545 = !DILocation(line: 347, column: 13, scope: !543)
!546 = !DILocation(line: 348, column: 17, scope: !547)
!547 = distinct !DILexicalBlock(scope: !464, file: !74, line: 348, column: 17)
!548 = !DILocation(line: 348, column: 30, scope: !547)
!549 = !DILocation(line: 348, column: 17, scope: !464)
!550 = !DILocation(line: 350, column: 30, scope: !551)
!551 = distinct !DILexicalBlock(scope: !547, file: !74, line: 349, column: 13)
!552 = !DILocation(line: 350, column: 17, scope: !551)
!553 = !DILocation(line: 351, column: 13, scope: !551)
!554 = !DILocation(line: 359, column: 5, scope: !465)
!555 = !DILocation(line: 360, column: 8, scope: !556)
!556 = distinct !DILexicalBlock(scope: !456, file: !74, line: 360, column: 8)
!557 = !DILocation(line: 360, column: 8, scope: !456)
!558 = !DILocalVariable(name: "i", scope: !559, file: !74, line: 363, type: !65)
!559 = distinct !DILexicalBlock(scope: !560, file: !74, line: 362, column: 9)
!560 = distinct !DILexicalBlock(scope: !556, file: !74, line: 361, column: 5)
!561 = !DILocation(line: 363, column: 17, scope: !559)
!562 = !DILocalVariable(name: "buffer", scope: !559, file: !74, line: 364, type: !64)
!563 = !DILocation(line: 364, column: 19, scope: !559)
!564 = !DILocation(line: 364, column: 35, scope: !559)
!565 = !DILocation(line: 364, column: 28, scope: !559)
!566 = !DILocation(line: 365, column: 17, scope: !567)
!567 = distinct !DILexicalBlock(scope: !559, file: !74, line: 365, column: 17)
!568 = !DILocation(line: 365, column: 24, scope: !567)
!569 = !DILocation(line: 365, column: 17, scope: !559)
!570 = !DILocation(line: 365, column: 34, scope: !571)
!571 = distinct !DILexicalBlock(scope: !567, file: !74, line: 365, column: 33)
!572 = !DILocation(line: 367, column: 20, scope: !573)
!573 = distinct !DILexicalBlock(scope: !559, file: !74, line: 367, column: 13)
!574 = !DILocation(line: 367, column: 18, scope: !573)
!575 = !DILocation(line: 367, column: 25, scope: !576)
!576 = distinct !DILexicalBlock(scope: !573, file: !74, line: 367, column: 13)
!577 = !DILocation(line: 367, column: 27, scope: !576)
!578 = !DILocation(line: 367, column: 13, scope: !573)
!579 = !DILocation(line: 369, column: 17, scope: !580)
!580 = distinct !DILexicalBlock(scope: !576, file: !74, line: 368, column: 13)
!581 = !DILocation(line: 369, column: 24, scope: !580)
!582 = !DILocation(line: 369, column: 27, scope: !580)
!583 = !DILocation(line: 370, column: 13, scope: !580)
!584 = !DILocation(line: 367, column: 34, scope: !576)
!585 = !DILocation(line: 367, column: 13, scope: !576)
!586 = distinct !{!586, !578, !587, !225}
!587 = !DILocation(line: 370, column: 13, scope: !573)
!588 = !DILocation(line: 372, column: 17, scope: !589)
!589 = distinct !DILexicalBlock(scope: !559, file: !74, line: 372, column: 17)
!590 = !DILocation(line: 372, column: 22, scope: !589)
!591 = !DILocation(line: 372, column: 27, scope: !589)
!592 = !DILocation(line: 372, column: 30, scope: !589)
!593 = !DILocation(line: 372, column: 35, scope: !589)
!594 = !DILocation(line: 372, column: 17, scope: !559)
!595 = !DILocation(line: 374, column: 17, scope: !596)
!596 = distinct !DILexicalBlock(scope: !589, file: !74, line: 373, column: 13)
!597 = !DILocation(line: 374, column: 24, scope: !596)
!598 = !DILocation(line: 374, column: 30, scope: !596)
!599 = !DILocation(line: 376, column: 23, scope: !600)
!600 = distinct !DILexicalBlock(scope: !596, file: !74, line: 376, column: 17)
!601 = !DILocation(line: 376, column: 21, scope: !600)
!602 = !DILocation(line: 376, column: 28, scope: !603)
!603 = distinct !DILexicalBlock(scope: !600, file: !74, line: 376, column: 17)
!604 = !DILocation(line: 376, column: 30, scope: !603)
!605 = !DILocation(line: 376, column: 17, scope: !600)
!606 = !DILocation(line: 378, column: 34, scope: !607)
!607 = distinct !DILexicalBlock(scope: !603, file: !74, line: 377, column: 17)
!608 = !DILocation(line: 378, column: 41, scope: !607)
!609 = !DILocation(line: 378, column: 21, scope: !607)
!610 = !DILocation(line: 379, column: 17, scope: !607)
!611 = !DILocation(line: 376, column: 37, scope: !603)
!612 = !DILocation(line: 376, column: 17, scope: !603)
!613 = distinct !{!613, !605, !614, !225}
!614 = !DILocation(line: 379, column: 17, scope: !600)
!615 = !DILocation(line: 380, column: 13, scope: !596)
!616 = !DILocation(line: 383, column: 17, scope: !617)
!617 = distinct !DILexicalBlock(scope: !589, file: !74, line: 382, column: 13)
!618 = !DILocation(line: 385, column: 18, scope: !559)
!619 = !DILocation(line: 385, column: 13, scope: !559)
!620 = !DILocation(line: 387, column: 5, scope: !560)
!621 = !DILocation(line: 388, column: 1, scope: !456)
!622 = distinct !DISubprogram(name: "goodG2B1", scope: !74, file: !74, line: 391, type: !75, scopeLine: 392, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!623 = !DILocalVariable(name: "data", scope: !622, file: !74, line: 393, type: !65)
!624 = !DILocation(line: 393, column: 9, scope: !622)
!625 = !DILocation(line: 395, column: 10, scope: !622)
!626 = !DILocation(line: 396, column: 8, scope: !627)
!627 = distinct !DILexicalBlock(scope: !622, file: !74, line: 396, column: 8)
!628 = !DILocation(line: 396, column: 8, scope: !622)
!629 = !DILocation(line: 399, column: 9, scope: !630)
!630 = distinct !DILexicalBlock(scope: !627, file: !74, line: 397, column: 5)
!631 = !DILocation(line: 400, column: 5, scope: !630)
!632 = !DILocation(line: 405, column: 14, scope: !633)
!633 = distinct !DILexicalBlock(scope: !627, file: !74, line: 402, column: 5)
!634 = !DILocation(line: 407, column: 8, scope: !635)
!635 = distinct !DILexicalBlock(scope: !622, file: !74, line: 407, column: 8)
!636 = !DILocation(line: 407, column: 8, scope: !622)
!637 = !DILocalVariable(name: "i", scope: !638, file: !74, line: 410, type: !65)
!638 = distinct !DILexicalBlock(scope: !639, file: !74, line: 409, column: 9)
!639 = distinct !DILexicalBlock(scope: !635, file: !74, line: 408, column: 5)
!640 = !DILocation(line: 410, column: 17, scope: !638)
!641 = !DILocalVariable(name: "buffer", scope: !638, file: !74, line: 411, type: !64)
!642 = !DILocation(line: 411, column: 19, scope: !638)
!643 = !DILocation(line: 411, column: 35, scope: !638)
!644 = !DILocation(line: 411, column: 28, scope: !638)
!645 = !DILocation(line: 412, column: 17, scope: !646)
!646 = distinct !DILexicalBlock(scope: !638, file: !74, line: 412, column: 17)
!647 = !DILocation(line: 412, column: 24, scope: !646)
!648 = !DILocation(line: 412, column: 17, scope: !638)
!649 = !DILocation(line: 412, column: 34, scope: !650)
!650 = distinct !DILexicalBlock(scope: !646, file: !74, line: 412, column: 33)
!651 = !DILocation(line: 414, column: 20, scope: !652)
!652 = distinct !DILexicalBlock(scope: !638, file: !74, line: 414, column: 13)
!653 = !DILocation(line: 414, column: 18, scope: !652)
!654 = !DILocation(line: 414, column: 25, scope: !655)
!655 = distinct !DILexicalBlock(scope: !652, file: !74, line: 414, column: 13)
!656 = !DILocation(line: 414, column: 27, scope: !655)
!657 = !DILocation(line: 414, column: 13, scope: !652)
!658 = !DILocation(line: 416, column: 17, scope: !659)
!659 = distinct !DILexicalBlock(scope: !655, file: !74, line: 415, column: 13)
!660 = !DILocation(line: 416, column: 24, scope: !659)
!661 = !DILocation(line: 416, column: 27, scope: !659)
!662 = !DILocation(line: 417, column: 13, scope: !659)
!663 = !DILocation(line: 414, column: 34, scope: !655)
!664 = !DILocation(line: 414, column: 13, scope: !655)
!665 = distinct !{!665, !657, !666, !225}
!666 = !DILocation(line: 417, column: 13, scope: !652)
!667 = !DILocation(line: 420, column: 17, scope: !668)
!668 = distinct !DILexicalBlock(scope: !638, file: !74, line: 420, column: 17)
!669 = !DILocation(line: 420, column: 22, scope: !668)
!670 = !DILocation(line: 420, column: 17, scope: !638)
!671 = !DILocation(line: 422, column: 17, scope: !672)
!672 = distinct !DILexicalBlock(scope: !668, file: !74, line: 421, column: 13)
!673 = !DILocation(line: 422, column: 24, scope: !672)
!674 = !DILocation(line: 422, column: 30, scope: !672)
!675 = !DILocation(line: 424, column: 23, scope: !676)
!676 = distinct !DILexicalBlock(scope: !672, file: !74, line: 424, column: 17)
!677 = !DILocation(line: 424, column: 21, scope: !676)
!678 = !DILocation(line: 424, column: 28, scope: !679)
!679 = distinct !DILexicalBlock(scope: !676, file: !74, line: 424, column: 17)
!680 = !DILocation(line: 424, column: 30, scope: !679)
!681 = !DILocation(line: 424, column: 17, scope: !676)
!682 = !DILocation(line: 426, column: 34, scope: !683)
!683 = distinct !DILexicalBlock(scope: !679, file: !74, line: 425, column: 17)
!684 = !DILocation(line: 426, column: 41, scope: !683)
!685 = !DILocation(line: 426, column: 21, scope: !683)
!686 = !DILocation(line: 427, column: 17, scope: !683)
!687 = !DILocation(line: 424, column: 37, scope: !679)
!688 = !DILocation(line: 424, column: 17, scope: !679)
!689 = distinct !{!689, !681, !690, !225}
!690 = !DILocation(line: 427, column: 17, scope: !676)
!691 = !DILocation(line: 428, column: 13, scope: !672)
!692 = !DILocation(line: 431, column: 17, scope: !693)
!693 = distinct !DILexicalBlock(scope: !668, file: !74, line: 430, column: 13)
!694 = !DILocation(line: 433, column: 18, scope: !638)
!695 = !DILocation(line: 433, column: 13, scope: !638)
!696 = !DILocation(line: 435, column: 5, scope: !639)
!697 = !DILocation(line: 436, column: 1, scope: !622)
!698 = distinct !DISubprogram(name: "goodG2B2", scope: !74, file: !74, line: 439, type: !75, scopeLine: 440, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!699 = !DILocalVariable(name: "data", scope: !698, file: !74, line: 441, type: !65)
!700 = !DILocation(line: 441, column: 9, scope: !698)
!701 = !DILocation(line: 443, column: 10, scope: !698)
!702 = !DILocation(line: 444, column: 8, scope: !703)
!703 = distinct !DILexicalBlock(scope: !698, file: !74, line: 444, column: 8)
!704 = !DILocation(line: 444, column: 8, scope: !698)
!705 = !DILocation(line: 448, column: 14, scope: !706)
!706 = distinct !DILexicalBlock(scope: !703, file: !74, line: 445, column: 5)
!707 = !DILocation(line: 449, column: 5, scope: !706)
!708 = !DILocation(line: 450, column: 8, scope: !709)
!709 = distinct !DILexicalBlock(scope: !698, file: !74, line: 450, column: 8)
!710 = !DILocation(line: 450, column: 8, scope: !698)
!711 = !DILocalVariable(name: "i", scope: !712, file: !74, line: 453, type: !65)
!712 = distinct !DILexicalBlock(scope: !713, file: !74, line: 452, column: 9)
!713 = distinct !DILexicalBlock(scope: !709, file: !74, line: 451, column: 5)
!714 = !DILocation(line: 453, column: 17, scope: !712)
!715 = !DILocalVariable(name: "buffer", scope: !712, file: !74, line: 454, type: !64)
!716 = !DILocation(line: 454, column: 19, scope: !712)
!717 = !DILocation(line: 454, column: 35, scope: !712)
!718 = !DILocation(line: 454, column: 28, scope: !712)
!719 = !DILocation(line: 455, column: 17, scope: !720)
!720 = distinct !DILexicalBlock(scope: !712, file: !74, line: 455, column: 17)
!721 = !DILocation(line: 455, column: 24, scope: !720)
!722 = !DILocation(line: 455, column: 17, scope: !712)
!723 = !DILocation(line: 455, column: 34, scope: !724)
!724 = distinct !DILexicalBlock(scope: !720, file: !74, line: 455, column: 33)
!725 = !DILocation(line: 457, column: 20, scope: !726)
!726 = distinct !DILexicalBlock(scope: !712, file: !74, line: 457, column: 13)
!727 = !DILocation(line: 457, column: 18, scope: !726)
!728 = !DILocation(line: 457, column: 25, scope: !729)
!729 = distinct !DILexicalBlock(scope: !726, file: !74, line: 457, column: 13)
!730 = !DILocation(line: 457, column: 27, scope: !729)
!731 = !DILocation(line: 457, column: 13, scope: !726)
!732 = !DILocation(line: 459, column: 17, scope: !733)
!733 = distinct !DILexicalBlock(scope: !729, file: !74, line: 458, column: 13)
!734 = !DILocation(line: 459, column: 24, scope: !733)
!735 = !DILocation(line: 459, column: 27, scope: !733)
!736 = !DILocation(line: 460, column: 13, scope: !733)
!737 = !DILocation(line: 457, column: 34, scope: !729)
!738 = !DILocation(line: 457, column: 13, scope: !729)
!739 = distinct !{!739, !731, !740, !225}
!740 = !DILocation(line: 460, column: 13, scope: !726)
!741 = !DILocation(line: 463, column: 17, scope: !742)
!742 = distinct !DILexicalBlock(scope: !712, file: !74, line: 463, column: 17)
!743 = !DILocation(line: 463, column: 22, scope: !742)
!744 = !DILocation(line: 463, column: 17, scope: !712)
!745 = !DILocation(line: 465, column: 17, scope: !746)
!746 = distinct !DILexicalBlock(scope: !742, file: !74, line: 464, column: 13)
!747 = !DILocation(line: 465, column: 24, scope: !746)
!748 = !DILocation(line: 465, column: 30, scope: !746)
!749 = !DILocation(line: 467, column: 23, scope: !750)
!750 = distinct !DILexicalBlock(scope: !746, file: !74, line: 467, column: 17)
!751 = !DILocation(line: 467, column: 21, scope: !750)
!752 = !DILocation(line: 467, column: 28, scope: !753)
!753 = distinct !DILexicalBlock(scope: !750, file: !74, line: 467, column: 17)
!754 = !DILocation(line: 467, column: 30, scope: !753)
!755 = !DILocation(line: 467, column: 17, scope: !750)
!756 = !DILocation(line: 469, column: 34, scope: !757)
!757 = distinct !DILexicalBlock(scope: !753, file: !74, line: 468, column: 17)
!758 = !DILocation(line: 469, column: 41, scope: !757)
!759 = !DILocation(line: 469, column: 21, scope: !757)
!760 = !DILocation(line: 470, column: 17, scope: !757)
!761 = !DILocation(line: 467, column: 37, scope: !753)
!762 = !DILocation(line: 467, column: 17, scope: !753)
!763 = distinct !{!763, !755, !764, !225}
!764 = !DILocation(line: 470, column: 17, scope: !750)
!765 = !DILocation(line: 471, column: 13, scope: !746)
!766 = !DILocation(line: 474, column: 17, scope: !767)
!767 = distinct !DILexicalBlock(scope: !742, file: !74, line: 473, column: 13)
!768 = !DILocation(line: 476, column: 18, scope: !712)
!769 = !DILocation(line: 476, column: 13, scope: !712)
!770 = !DILocation(line: 478, column: 5, scope: !713)
!771 = !DILocation(line: 479, column: 1, scope: !698)
