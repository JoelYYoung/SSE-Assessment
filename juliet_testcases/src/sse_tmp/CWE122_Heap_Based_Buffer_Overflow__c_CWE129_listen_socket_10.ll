; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_10_bad() #0 !dbg !73 {
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
  %0 = load i32, i32* @globalTrue, align 4, !dbg !81
  %tobool = icmp ne i32 %0, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.end34, !dbg !83

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
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !113
  store i32 %call, i32* %listenSocket, align 4, !dbg !115
  %1 = load i32, i32* %listenSocket, align 4, !dbg !116
  %cmp = icmp eq i32 %1, -1, !dbg !118
  br i1 %cmp, label %if.then1, label %if.end, !dbg !119

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !120

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !122
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !123
  store i16 2, i16* %sin_family, align 4, !dbg !124
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !125
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !126
  store i32 0, i32* %s_addr, align 4, !dbg !127
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !128
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !129
  store i16 %call2, i16* %sin_port, align 2, !dbg !130
  %3 = load i32, i32* %listenSocket, align 4, !dbg !131
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !133
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !134
  %cmp4 = icmp eq i32 %call3, -1, !dbg !135
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !136

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !137

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !139
  %call7 = call i32 @listen(i32 %5, i32 5) #8, !dbg !141
  %cmp8 = icmp eq i32 %call7, -1, !dbg !142
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !143

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !144

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !146
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !147
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !148
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !149
  %cmp12 = icmp eq i32 %7, -1, !dbg !151
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !152

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !153

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !155
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !156
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !157
  %conv = trunc i64 %call15 to i32, !dbg !157
  store i32 %conv, i32* %recvResult, align 4, !dbg !158
  %9 = load i32, i32* %recvResult, align 4, !dbg !159
  %cmp16 = icmp eq i32 %9, -1, !dbg !161
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !162

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !163
  %cmp18 = icmp eq i32 %10, 0, !dbg !164
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !165

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !166

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !168
  %idxprom = sext i32 %11 to i64, !dbg !169
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !171
  %call23 = call i32 @atoi(i8* %arraydecay22) #10, !dbg !172
  store i32 %call23, i32* %data, align 4, !dbg !173
  br label %do.end, !dbg !174

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !175
  %cmp24 = icmp ne i32 %12, -1, !dbg !177
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !178

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !179
  %call27 = call i32 @close(i32 %13), !dbg !181
  br label %if.end28, !dbg !182

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !183
  %cmp29 = icmp ne i32 %14, -1, !dbg !185
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !186

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !187
  %call32 = call i32 @close(i32 %15), !dbg !189
  br label %if.end33, !dbg !190

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !191

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @globalTrue, align 4, !dbg !192
  %tobool35 = icmp ne i32 %16, 0, !dbg !192
  br i1 %tobool35, label %if.then36, label %if.end61, !dbg !194

if.then36:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !195, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !199, metadata !DIExpression()), !dbg !200
  %call37 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !201
  %17 = bitcast i8* %call37 to i32*, !dbg !202
  store i32* %17, i32** %buffer, align 8, !dbg !200
  %18 = load i32*, i32** %buffer, align 8, !dbg !203
  %cmp38 = icmp eq i32* %18, null, !dbg !205
  br i1 %cmp38, label %if.then40, label %if.end41, !dbg !206

if.then40:                                        ; preds = %if.then36
  call void @exit(i32 -1) #11, !dbg !207
  unreachable, !dbg !207

if.end41:                                         ; preds = %if.then36
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end41
  %19 = load i32, i32* %i, align 4, !dbg !212
  %cmp42 = icmp slt i32 %19, 10, !dbg !214
  br i1 %cmp42, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !216
  %21 = load i32, i32* %i, align 4, !dbg !218
  %idxprom44 = sext i32 %21 to i64, !dbg !216
  %arrayidx45 = getelementptr inbounds i32, i32* %20, i64 %idxprom44, !dbg !216
  store i32 0, i32* %arrayidx45, align 4, !dbg !219
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !221
  %inc = add nsw i32 %22, 1, !dbg !221
  store i32 %inc, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !222, !llvm.loop !223

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !226
  %cmp46 = icmp sge i32 %23, 0, !dbg !228
  br i1 %cmp46, label %if.then48, label %if.else, !dbg !229

if.then48:                                        ; preds = %for.end
  %24 = load i32*, i32** %buffer, align 8, !dbg !230
  %25 = load i32, i32* %data, align 4, !dbg !232
  %idxprom49 = sext i32 %25 to i64, !dbg !230
  %arrayidx50 = getelementptr inbounds i32, i32* %24, i64 %idxprom49, !dbg !230
  store i32 1, i32* %arrayidx50, align 4, !dbg !233
  store i32 0, i32* %i, align 4, !dbg !234
  br label %for.cond51, !dbg !236

for.cond51:                                       ; preds = %for.inc57, %if.then48
  %26 = load i32, i32* %i, align 4, !dbg !237
  %cmp52 = icmp slt i32 %26, 10, !dbg !239
  br i1 %cmp52, label %for.body54, label %for.end59, !dbg !240

for.body54:                                       ; preds = %for.cond51
  %27 = load i32*, i32** %buffer, align 8, !dbg !241
  %28 = load i32, i32* %i, align 4, !dbg !243
  %idxprom55 = sext i32 %28 to i64, !dbg !241
  %arrayidx56 = getelementptr inbounds i32, i32* %27, i64 %idxprom55, !dbg !241
  %29 = load i32, i32* %arrayidx56, align 4, !dbg !241
  call void @printIntLine(i32 %29), !dbg !244
  br label %for.inc57, !dbg !245

for.inc57:                                        ; preds = %for.body54
  %30 = load i32, i32* %i, align 4, !dbg !246
  %inc58 = add nsw i32 %30, 1, !dbg !246
  store i32 %inc58, i32* %i, align 4, !dbg !246
  br label %for.cond51, !dbg !247, !llvm.loop !248

for.end59:                                        ; preds = %for.cond51
  br label %if.end60, !dbg !250

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !251
  br label %if.end60

if.end60:                                         ; preds = %if.else, %for.end59
  %31 = load i32*, i32** %buffer, align 8, !dbg !253
  %32 = bitcast i32* %31 to i8*, !dbg !253
  call void @free(i8* %32) #8, !dbg !254
  br label %if.end61, !dbg !255

if.end61:                                         ; preds = %if.end60, %if.end34
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_10_good() #0 !dbg !257 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_10_good(), !dbg !276
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !277
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !278
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_10_bad(), !dbg !279
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !280
  ret i32 0, !dbg !281
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !282 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !283, metadata !DIExpression()), !dbg !284
  store i32 -1, i32* %data, align 4, !dbg !285
  %0 = load i32, i32* @globalTrue, align 4, !dbg !286
  %tobool = icmp ne i32 %0, 0, !dbg !286
  br i1 %tobool, label %if.then, label %if.end34, !dbg !288

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !289, metadata !DIExpression()), !dbg !292
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !293, metadata !DIExpression()), !dbg !294
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !295, metadata !DIExpression()), !dbg !296
  store i32 -1, i32* %listenSocket, align 4, !dbg !296
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !297, metadata !DIExpression()), !dbg !298
  store i32 -1, i32* %acceptSocket, align 4, !dbg !298
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !299, metadata !DIExpression()), !dbg !300
  br label %do.body, !dbg !301

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !302
  store i32 %call, i32* %listenSocket, align 4, !dbg !304
  %1 = load i32, i32* %listenSocket, align 4, !dbg !305
  %cmp = icmp eq i32 %1, -1, !dbg !307
  br i1 %cmp, label %if.then1, label %if.end, !dbg !308

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !309

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !311
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !311
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !312
  store i16 2, i16* %sin_family, align 4, !dbg !313
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !314
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !315
  store i32 0, i32* %s_addr, align 4, !dbg !316
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !317
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !318
  store i16 %call2, i16* %sin_port, align 2, !dbg !319
  %3 = load i32, i32* %listenSocket, align 4, !dbg !320
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !322
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !323
  %cmp4 = icmp eq i32 %call3, -1, !dbg !324
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !325

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !326

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !328
  %call7 = call i32 @listen(i32 %5, i32 5) #8, !dbg !330
  %cmp8 = icmp eq i32 %call7, -1, !dbg !331
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !332

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !333

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !335
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !336
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !337
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !338
  %cmp12 = icmp eq i32 %7, -1, !dbg !340
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !341

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !342

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !344
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !345
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !346
  %conv = trunc i64 %call15 to i32, !dbg !346
  store i32 %conv, i32* %recvResult, align 4, !dbg !347
  %9 = load i32, i32* %recvResult, align 4, !dbg !348
  %cmp16 = icmp eq i32 %9, -1, !dbg !350
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !351

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !352
  %cmp18 = icmp eq i32 %10, 0, !dbg !353
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !354

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !355

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !357
  %idxprom = sext i32 %11 to i64, !dbg !358
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !358
  store i8 0, i8* %arrayidx, align 1, !dbg !359
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !360
  %call23 = call i32 @atoi(i8* %arraydecay22) #10, !dbg !361
  store i32 %call23, i32* %data, align 4, !dbg !362
  br label %do.end, !dbg !363

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !364
  %cmp24 = icmp ne i32 %12, -1, !dbg !366
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !367

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !368
  %call27 = call i32 @close(i32 %13), !dbg !370
  br label %if.end28, !dbg !371

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !372
  %cmp29 = icmp ne i32 %14, -1, !dbg !374
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !375

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !376
  %call32 = call i32 @close(i32 %15), !dbg !378
  br label %if.end33, !dbg !379

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !380

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @globalFalse, align 4, !dbg !381
  %tobool35 = icmp ne i32 %16, 0, !dbg !381
  br i1 %tobool35, label %if.then36, label %if.else, !dbg !383

if.then36:                                        ; preds = %if.end34
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !384
  br label %if.end64, !dbg !386

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !387, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !391, metadata !DIExpression()), !dbg !392
  %call37 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !393
  %17 = bitcast i8* %call37 to i32*, !dbg !394
  store i32* %17, i32** %buffer, align 8, !dbg !392
  %18 = load i32*, i32** %buffer, align 8, !dbg !395
  %cmp38 = icmp eq i32* %18, null, !dbg !397
  br i1 %cmp38, label %if.then40, label %if.end41, !dbg !398

if.then40:                                        ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !399
  unreachable, !dbg !399

if.end41:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !401
  br label %for.cond, !dbg !403

for.cond:                                         ; preds = %for.inc, %if.end41
  %19 = load i32, i32* %i, align 4, !dbg !404
  %cmp42 = icmp slt i32 %19, 10, !dbg !406
  br i1 %cmp42, label %for.body, label %for.end, !dbg !407

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !408
  %21 = load i32, i32* %i, align 4, !dbg !410
  %idxprom44 = sext i32 %21 to i64, !dbg !408
  %arrayidx45 = getelementptr inbounds i32, i32* %20, i64 %idxprom44, !dbg !408
  store i32 0, i32* %arrayidx45, align 4, !dbg !411
  br label %for.inc, !dbg !412

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !413
  %inc = add nsw i32 %22, 1, !dbg !413
  store i32 %inc, i32* %i, align 4, !dbg !413
  br label %for.cond, !dbg !414, !llvm.loop !415

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !417
  %cmp46 = icmp sge i32 %23, 0, !dbg !419
  br i1 %cmp46, label %land.lhs.true, label %if.else62, !dbg !420

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data, align 4, !dbg !421
  %cmp48 = icmp slt i32 %24, 10, !dbg !422
  br i1 %cmp48, label %if.then50, label %if.else62, !dbg !423

if.then50:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !424
  %26 = load i32, i32* %data, align 4, !dbg !426
  %idxprom51 = sext i32 %26 to i64, !dbg !424
  %arrayidx52 = getelementptr inbounds i32, i32* %25, i64 %idxprom51, !dbg !424
  store i32 1, i32* %arrayidx52, align 4, !dbg !427
  store i32 0, i32* %i, align 4, !dbg !428
  br label %for.cond53, !dbg !430

for.cond53:                                       ; preds = %for.inc59, %if.then50
  %27 = load i32, i32* %i, align 4, !dbg !431
  %cmp54 = icmp slt i32 %27, 10, !dbg !433
  br i1 %cmp54, label %for.body56, label %for.end61, !dbg !434

for.body56:                                       ; preds = %for.cond53
  %28 = load i32*, i32** %buffer, align 8, !dbg !435
  %29 = load i32, i32* %i, align 4, !dbg !437
  %idxprom57 = sext i32 %29 to i64, !dbg !435
  %arrayidx58 = getelementptr inbounds i32, i32* %28, i64 %idxprom57, !dbg !435
  %30 = load i32, i32* %arrayidx58, align 4, !dbg !435
  call void @printIntLine(i32 %30), !dbg !438
  br label %for.inc59, !dbg !439

for.inc59:                                        ; preds = %for.body56
  %31 = load i32, i32* %i, align 4, !dbg !440
  %inc60 = add nsw i32 %31, 1, !dbg !440
  store i32 %inc60, i32* %i, align 4, !dbg !440
  br label %for.cond53, !dbg !441, !llvm.loop !442

for.end61:                                        ; preds = %for.cond53
  br label %if.end63, !dbg !444

if.else62:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !445
  br label %if.end63

if.end63:                                         ; preds = %if.else62, %for.end61
  %32 = load i32*, i32** %buffer, align 8, !dbg !447
  %33 = bitcast i32* %32 to i8*, !dbg !447
  call void @free(i8* %33) #8, !dbg !448
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.then36
  ret void, !dbg !449
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !450 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !451, metadata !DIExpression()), !dbg !452
  store i32 -1, i32* %data, align 4, !dbg !453
  %0 = load i32, i32* @globalTrue, align 4, !dbg !454
  %tobool = icmp ne i32 %0, 0, !dbg !454
  br i1 %tobool, label %if.then, label %if.end34, !dbg !456

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !457, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !461, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !463, metadata !DIExpression()), !dbg !464
  store i32 -1, i32* %listenSocket, align 4, !dbg !464
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !465, metadata !DIExpression()), !dbg !466
  store i32 -1, i32* %acceptSocket, align 4, !dbg !466
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !467, metadata !DIExpression()), !dbg !468
  br label %do.body, !dbg !469

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !470
  store i32 %call, i32* %listenSocket, align 4, !dbg !472
  %1 = load i32, i32* %listenSocket, align 4, !dbg !473
  %cmp = icmp eq i32 %1, -1, !dbg !475
  br i1 %cmp, label %if.then1, label %if.end, !dbg !476

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !477

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !479
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !479
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !480
  store i16 2, i16* %sin_family, align 4, !dbg !481
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !482
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !483
  store i32 0, i32* %s_addr, align 4, !dbg !484
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !485
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !486
  store i16 %call2, i16* %sin_port, align 2, !dbg !487
  %3 = load i32, i32* %listenSocket, align 4, !dbg !488
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !490
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !491
  %cmp4 = icmp eq i32 %call3, -1, !dbg !492
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !493

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !494

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !496
  %call7 = call i32 @listen(i32 %5, i32 5) #8, !dbg !498
  %cmp8 = icmp eq i32 %call7, -1, !dbg !499
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !500

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !501

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !503
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !504
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !505
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !506
  %cmp12 = icmp eq i32 %7, -1, !dbg !508
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !509

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !510

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !512
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !513
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !514
  %conv = trunc i64 %call15 to i32, !dbg !514
  store i32 %conv, i32* %recvResult, align 4, !dbg !515
  %9 = load i32, i32* %recvResult, align 4, !dbg !516
  %cmp16 = icmp eq i32 %9, -1, !dbg !518
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !519

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !520
  %cmp18 = icmp eq i32 %10, 0, !dbg !521
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !522

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !523

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !525
  %idxprom = sext i32 %11 to i64, !dbg !526
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !526
  store i8 0, i8* %arrayidx, align 1, !dbg !527
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !528
  %call23 = call i32 @atoi(i8* %arraydecay22) #10, !dbg !529
  store i32 %call23, i32* %data, align 4, !dbg !530
  br label %do.end, !dbg !531

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !532
  %cmp24 = icmp ne i32 %12, -1, !dbg !534
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !535

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !536
  %call27 = call i32 @close(i32 %13), !dbg !538
  br label %if.end28, !dbg !539

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !540
  %cmp29 = icmp ne i32 %14, -1, !dbg !542
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !543

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !544
  %call32 = call i32 @close(i32 %15), !dbg !546
  br label %if.end33, !dbg !547

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !548

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @globalTrue, align 4, !dbg !549
  %tobool35 = icmp ne i32 %16, 0, !dbg !549
  br i1 %tobool35, label %if.then36, label %if.end63, !dbg !551

if.then36:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !552, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !556, metadata !DIExpression()), !dbg !557
  %call37 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !558
  %17 = bitcast i8* %call37 to i32*, !dbg !559
  store i32* %17, i32** %buffer, align 8, !dbg !557
  %18 = load i32*, i32** %buffer, align 8, !dbg !560
  %cmp38 = icmp eq i32* %18, null, !dbg !562
  br i1 %cmp38, label %if.then40, label %if.end41, !dbg !563

if.then40:                                        ; preds = %if.then36
  call void @exit(i32 -1) #11, !dbg !564
  unreachable, !dbg !564

if.end41:                                         ; preds = %if.then36
  store i32 0, i32* %i, align 4, !dbg !566
  br label %for.cond, !dbg !568

for.cond:                                         ; preds = %for.inc, %if.end41
  %19 = load i32, i32* %i, align 4, !dbg !569
  %cmp42 = icmp slt i32 %19, 10, !dbg !571
  br i1 %cmp42, label %for.body, label %for.end, !dbg !572

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !573
  %21 = load i32, i32* %i, align 4, !dbg !575
  %idxprom44 = sext i32 %21 to i64, !dbg !573
  %arrayidx45 = getelementptr inbounds i32, i32* %20, i64 %idxprom44, !dbg !573
  store i32 0, i32* %arrayidx45, align 4, !dbg !576
  br label %for.inc, !dbg !577

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !578
  %inc = add nsw i32 %22, 1, !dbg !578
  store i32 %inc, i32* %i, align 4, !dbg !578
  br label %for.cond, !dbg !579, !llvm.loop !580

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !582
  %cmp46 = icmp sge i32 %23, 0, !dbg !584
  br i1 %cmp46, label %land.lhs.true, label %if.else, !dbg !585

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data, align 4, !dbg !586
  %cmp48 = icmp slt i32 %24, 10, !dbg !587
  br i1 %cmp48, label %if.then50, label %if.else, !dbg !588

if.then50:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !589
  %26 = load i32, i32* %data, align 4, !dbg !591
  %idxprom51 = sext i32 %26 to i64, !dbg !589
  %arrayidx52 = getelementptr inbounds i32, i32* %25, i64 %idxprom51, !dbg !589
  store i32 1, i32* %arrayidx52, align 4, !dbg !592
  store i32 0, i32* %i, align 4, !dbg !593
  br label %for.cond53, !dbg !595

for.cond53:                                       ; preds = %for.inc59, %if.then50
  %27 = load i32, i32* %i, align 4, !dbg !596
  %cmp54 = icmp slt i32 %27, 10, !dbg !598
  br i1 %cmp54, label %for.body56, label %for.end61, !dbg !599

for.body56:                                       ; preds = %for.cond53
  %28 = load i32*, i32** %buffer, align 8, !dbg !600
  %29 = load i32, i32* %i, align 4, !dbg !602
  %idxprom57 = sext i32 %29 to i64, !dbg !600
  %arrayidx58 = getelementptr inbounds i32, i32* %28, i64 %idxprom57, !dbg !600
  %30 = load i32, i32* %arrayidx58, align 4, !dbg !600
  call void @printIntLine(i32 %30), !dbg !603
  br label %for.inc59, !dbg !604

for.inc59:                                        ; preds = %for.body56
  %31 = load i32, i32* %i, align 4, !dbg !605
  %inc60 = add nsw i32 %31, 1, !dbg !605
  store i32 %inc60, i32* %i, align 4, !dbg !605
  br label %for.cond53, !dbg !606, !llvm.loop !607

for.end61:                                        ; preds = %for.cond53
  br label %if.end62, !dbg !609

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !610
  br label %if.end62

if.end62:                                         ; preds = %if.else, %for.end61
  %32 = load i32*, i32** %buffer, align 8, !dbg !612
  %33 = bitcast i32* %32 to i8*, !dbg !612
  call void @free(i8* %33) #8, !dbg !613
  br label %if.end63, !dbg !614

if.end63:                                         ; preds = %if.end62, %if.end34
  ret void, !dbg !615
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !616 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !617, metadata !DIExpression()), !dbg !618
  store i32 -1, i32* %data, align 4, !dbg !619
  %0 = load i32, i32* @globalFalse, align 4, !dbg !620
  %tobool = icmp ne i32 %0, 0, !dbg !620
  br i1 %tobool, label %if.then, label %if.else, !dbg !622

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !623
  br label %if.end, !dbg !625

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !626
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalTrue, align 4, !dbg !628
  %tobool1 = icmp ne i32 %1, 0, !dbg !628
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !630

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !631, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !635, metadata !DIExpression()), !dbg !636
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !637
  %2 = bitcast i8* %call to i32*, !dbg !638
  store i32* %2, i32** %buffer, align 8, !dbg !636
  %3 = load i32*, i32** %buffer, align 8, !dbg !639
  %cmp = icmp eq i32* %3, null, !dbg !641
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !642

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !643
  unreachable, !dbg !643

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !645
  br label %for.cond, !dbg !647

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !648
  %cmp5 = icmp slt i32 %4, 10, !dbg !650
  br i1 %cmp5, label %for.body, label %for.end, !dbg !651

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !652
  %6 = load i32, i32* %i, align 4, !dbg !654
  %idxprom = sext i32 %6 to i64, !dbg !652
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !652
  store i32 0, i32* %arrayidx, align 4, !dbg !655
  br label %for.inc, !dbg !656

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !657
  %inc = add nsw i32 %7, 1, !dbg !657
  store i32 %inc, i32* %i, align 4, !dbg !657
  br label %for.cond, !dbg !658, !llvm.loop !659

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !661
  %cmp6 = icmp sge i32 %8, 0, !dbg !663
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !664

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !665
  %10 = load i32, i32* %data, align 4, !dbg !667
  %idxprom8 = sext i32 %10 to i64, !dbg !665
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !665
  store i32 1, i32* %arrayidx9, align 4, !dbg !668
  store i32 0, i32* %i, align 4, !dbg !669
  br label %for.cond10, !dbg !671

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !672
  %cmp11 = icmp slt i32 %11, 10, !dbg !674
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !675

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !676
  %13 = load i32, i32* %i, align 4, !dbg !678
  %idxprom13 = sext i32 %13 to i64, !dbg !676
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !676
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !676
  call void @printIntLine(i32 %14), !dbg !679
  br label %for.inc15, !dbg !680

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !681
  %inc16 = add nsw i32 %15, 1, !dbg !681
  store i32 %inc16, i32* %i, align 4, !dbg !681
  br label %for.cond10, !dbg !682, !llvm.loop !683

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !685

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !686
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !688
  %17 = bitcast i32* %16 to i8*, !dbg !688
  call void @free(i8* %17) #8, !dbg !689
  br label %if.end20, !dbg !690

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !691
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !692 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !693, metadata !DIExpression()), !dbg !694
  store i32 -1, i32* %data, align 4, !dbg !695
  %0 = load i32, i32* @globalTrue, align 4, !dbg !696
  %tobool = icmp ne i32 %0, 0, !dbg !696
  br i1 %tobool, label %if.then, label %if.end, !dbg !698

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !699
  br label %if.end, !dbg !701

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !702
  %tobool1 = icmp ne i32 %1, 0, !dbg !702
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !704

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !705, metadata !DIExpression()), !dbg !708
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !709, metadata !DIExpression()), !dbg !710
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !711
  %2 = bitcast i8* %call to i32*, !dbg !712
  store i32* %2, i32** %buffer, align 8, !dbg !710
  %3 = load i32*, i32** %buffer, align 8, !dbg !713
  %cmp = icmp eq i32* %3, null, !dbg !715
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !716

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !717
  unreachable, !dbg !717

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !719
  br label %for.cond, !dbg !721

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !722
  %cmp5 = icmp slt i32 %4, 10, !dbg !724
  br i1 %cmp5, label %for.body, label %for.end, !dbg !725

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !726
  %6 = load i32, i32* %i, align 4, !dbg !728
  %idxprom = sext i32 %6 to i64, !dbg !726
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !726
  store i32 0, i32* %arrayidx, align 4, !dbg !729
  br label %for.inc, !dbg !730

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !731
  %inc = add nsw i32 %7, 1, !dbg !731
  store i32 %inc, i32* %i, align 4, !dbg !731
  br label %for.cond, !dbg !732, !llvm.loop !733

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !735
  %cmp6 = icmp sge i32 %8, 0, !dbg !737
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !738

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !739
  %10 = load i32, i32* %data, align 4, !dbg !741
  %idxprom8 = sext i32 %10 to i64, !dbg !739
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !739
  store i32 1, i32* %arrayidx9, align 4, !dbg !742
  store i32 0, i32* %i, align 4, !dbg !743
  br label %for.cond10, !dbg !745

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !746
  %cmp11 = icmp slt i32 %11, 10, !dbg !748
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !749

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !750
  %13 = load i32, i32* %i, align 4, !dbg !752
  %idxprom13 = sext i32 %13 to i64, !dbg !750
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !750
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !750
  call void @printIntLine(i32 %14), !dbg !753
  br label %for.inc15, !dbg !754

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !755
  %inc16 = add nsw i32 %15, 1, !dbg !755
  store i32 %inc16, i32* %i, align 4, !dbg !755
  br label %for.cond10, !dbg !756, !llvm.loop !757

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !759

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !760
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !762
  %17 = bitcast i32* %16 to i8*, !dbg !762
  call void @free(i8* %17) #8, !dbg !763
  br label %if.end19, !dbg !764

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !765
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!67 = !{i32 7, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 3}
!69 = !{i32 1, !"wchar_size", i32 4}
!70 = !{i32 7, !"uwtable", i32 1}
!71 = !{i32 7, !"frame-pointer", i32 2}
!72 = !{!"clang version 13.0.0"}
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_10_bad", scope: !74, file: !74, line: 44, type: !75, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_10.c", directory: "/home/joelyang/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 46, type: !65)
!79 = !DILocation(line: 46, column: 9, scope: !73)
!80 = !DILocation(line: 48, column: 10, scope: !73)
!81 = !DILocation(line: 49, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !74, line: 49, column: 8)
!83 = !DILocation(line: 49, column: 8, scope: !73)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !74, line: 56, type: !65)
!85 = distinct !DILexicalBlock(scope: !86, file: !74, line: 51, column: 9)
!86 = distinct !DILexicalBlock(scope: !82, file: !74, line: 50, column: 5)
!87 = !DILocation(line: 56, column: 17, scope: !85)
!88 = !DILocalVariable(name: "service", scope: !85, file: !74, line: 57, type: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !90)
!90 = !{!91, !92, !96, !100}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !89, file: !17, line: 240, baseType: !56, size: 16)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !89, file: !17, line: 241, baseType: !93, size: 16, offset: 16)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !89, file: !17, line: 242, baseType: !97, size: 32, offset: 32)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !98)
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !97, file: !17, line: 33, baseType: !46, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !89, file: !17, line: 245, baseType: !101, size: 64, offset: 64)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 64, elements: !103)
!102 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!103 = !{!104}
!104 = !DISubrange(count: 8)
!105 = !DILocation(line: 57, column: 32, scope: !85)
!106 = !DILocalVariable(name: "listenSocket", scope: !85, file: !74, line: 58, type: !65)
!107 = !DILocation(line: 58, column: 20, scope: !85)
!108 = !DILocalVariable(name: "acceptSocket", scope: !85, file: !74, line: 59, type: !65)
!109 = !DILocation(line: 59, column: 20, scope: !85)
!110 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !74, line: 60, type: !60)
!111 = !DILocation(line: 60, column: 18, scope: !85)
!112 = !DILocation(line: 61, column: 13, scope: !85)
!113 = !DILocation(line: 71, column: 32, scope: !114)
!114 = distinct !DILexicalBlock(scope: !85, file: !74, line: 62, column: 13)
!115 = !DILocation(line: 71, column: 30, scope: !114)
!116 = !DILocation(line: 72, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !74, line: 72, column: 21)
!118 = !DILocation(line: 72, column: 34, scope: !117)
!119 = !DILocation(line: 72, column: 21, scope: !114)
!120 = !DILocation(line: 74, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !74, line: 73, column: 17)
!122 = !DILocation(line: 76, column: 17, scope: !114)
!123 = !DILocation(line: 77, column: 25, scope: !114)
!124 = !DILocation(line: 77, column: 36, scope: !114)
!125 = !DILocation(line: 78, column: 25, scope: !114)
!126 = !DILocation(line: 78, column: 34, scope: !114)
!127 = !DILocation(line: 78, column: 41, scope: !114)
!128 = !DILocation(line: 79, column: 36, scope: !114)
!129 = !DILocation(line: 79, column: 25, scope: !114)
!130 = !DILocation(line: 79, column: 34, scope: !114)
!131 = !DILocation(line: 80, column: 26, scope: !132)
!132 = distinct !DILexicalBlock(scope: !114, file: !74, line: 80, column: 21)
!133 = !DILocation(line: 80, column: 40, scope: !132)
!134 = !DILocation(line: 80, column: 21, scope: !132)
!135 = !DILocation(line: 80, column: 85, scope: !132)
!136 = !DILocation(line: 80, column: 21, scope: !114)
!137 = !DILocation(line: 82, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !74, line: 81, column: 17)
!139 = !DILocation(line: 84, column: 28, scope: !140)
!140 = distinct !DILexicalBlock(scope: !114, file: !74, line: 84, column: 21)
!141 = !DILocation(line: 84, column: 21, scope: !140)
!142 = !DILocation(line: 84, column: 58, scope: !140)
!143 = !DILocation(line: 84, column: 21, scope: !114)
!144 = !DILocation(line: 86, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !74, line: 85, column: 17)
!146 = !DILocation(line: 88, column: 39, scope: !114)
!147 = !DILocation(line: 88, column: 32, scope: !114)
!148 = !DILocation(line: 88, column: 30, scope: !114)
!149 = !DILocation(line: 89, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !114, file: !74, line: 89, column: 21)
!151 = !DILocation(line: 89, column: 34, scope: !150)
!152 = !DILocation(line: 89, column: 21, scope: !114)
!153 = !DILocation(line: 91, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !74, line: 90, column: 17)
!155 = !DILocation(line: 94, column: 35, scope: !114)
!156 = !DILocation(line: 94, column: 49, scope: !114)
!157 = !DILocation(line: 94, column: 30, scope: !114)
!158 = !DILocation(line: 94, column: 28, scope: !114)
!159 = !DILocation(line: 95, column: 21, scope: !160)
!160 = distinct !DILexicalBlock(scope: !114, file: !74, line: 95, column: 21)
!161 = !DILocation(line: 95, column: 32, scope: !160)
!162 = !DILocation(line: 95, column: 48, scope: !160)
!163 = !DILocation(line: 95, column: 51, scope: !160)
!164 = !DILocation(line: 95, column: 62, scope: !160)
!165 = !DILocation(line: 95, column: 21, scope: !114)
!166 = !DILocation(line: 97, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !160, file: !74, line: 96, column: 17)
!168 = !DILocation(line: 100, column: 29, scope: !114)
!169 = !DILocation(line: 100, column: 17, scope: !114)
!170 = !DILocation(line: 100, column: 41, scope: !114)
!171 = !DILocation(line: 102, column: 29, scope: !114)
!172 = !DILocation(line: 102, column: 24, scope: !114)
!173 = !DILocation(line: 102, column: 22, scope: !114)
!174 = !DILocation(line: 103, column: 13, scope: !114)
!175 = !DILocation(line: 105, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !85, file: !74, line: 105, column: 17)
!177 = !DILocation(line: 105, column: 30, scope: !176)
!178 = !DILocation(line: 105, column: 17, scope: !85)
!179 = !DILocation(line: 107, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !74, line: 106, column: 13)
!181 = !DILocation(line: 107, column: 17, scope: !180)
!182 = !DILocation(line: 108, column: 13, scope: !180)
!183 = !DILocation(line: 109, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !85, file: !74, line: 109, column: 17)
!185 = !DILocation(line: 109, column: 30, scope: !184)
!186 = !DILocation(line: 109, column: 17, scope: !85)
!187 = !DILocation(line: 111, column: 30, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !74, line: 110, column: 13)
!189 = !DILocation(line: 111, column: 17, scope: !188)
!190 = !DILocation(line: 112, column: 13, scope: !188)
!191 = !DILocation(line: 120, column: 5, scope: !86)
!192 = !DILocation(line: 121, column: 8, scope: !193)
!193 = distinct !DILexicalBlock(scope: !73, file: !74, line: 121, column: 8)
!194 = !DILocation(line: 121, column: 8, scope: !73)
!195 = !DILocalVariable(name: "i", scope: !196, file: !74, line: 124, type: !65)
!196 = distinct !DILexicalBlock(scope: !197, file: !74, line: 123, column: 9)
!197 = distinct !DILexicalBlock(scope: !193, file: !74, line: 122, column: 5)
!198 = !DILocation(line: 124, column: 17, scope: !196)
!199 = !DILocalVariable(name: "buffer", scope: !196, file: !74, line: 125, type: !64)
!200 = !DILocation(line: 125, column: 19, scope: !196)
!201 = !DILocation(line: 125, column: 35, scope: !196)
!202 = !DILocation(line: 125, column: 28, scope: !196)
!203 = !DILocation(line: 126, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !196, file: !74, line: 126, column: 17)
!205 = !DILocation(line: 126, column: 24, scope: !204)
!206 = !DILocation(line: 126, column: 17, scope: !196)
!207 = !DILocation(line: 126, column: 34, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !74, line: 126, column: 33)
!209 = !DILocation(line: 128, column: 20, scope: !210)
!210 = distinct !DILexicalBlock(scope: !196, file: !74, line: 128, column: 13)
!211 = !DILocation(line: 128, column: 18, scope: !210)
!212 = !DILocation(line: 128, column: 25, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !74, line: 128, column: 13)
!214 = !DILocation(line: 128, column: 27, scope: !213)
!215 = !DILocation(line: 128, column: 13, scope: !210)
!216 = !DILocation(line: 130, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !74, line: 129, column: 13)
!218 = !DILocation(line: 130, column: 24, scope: !217)
!219 = !DILocation(line: 130, column: 27, scope: !217)
!220 = !DILocation(line: 131, column: 13, scope: !217)
!221 = !DILocation(line: 128, column: 34, scope: !213)
!222 = !DILocation(line: 128, column: 13, scope: !213)
!223 = distinct !{!223, !215, !224, !225}
!224 = !DILocation(line: 131, column: 13, scope: !210)
!225 = !{!"llvm.loop.mustprogress"}
!226 = !DILocation(line: 134, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !196, file: !74, line: 134, column: 17)
!228 = !DILocation(line: 134, column: 22, scope: !227)
!229 = !DILocation(line: 134, column: 17, scope: !196)
!230 = !DILocation(line: 136, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !74, line: 135, column: 13)
!232 = !DILocation(line: 136, column: 24, scope: !231)
!233 = !DILocation(line: 136, column: 30, scope: !231)
!234 = !DILocation(line: 138, column: 23, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !74, line: 138, column: 17)
!236 = !DILocation(line: 138, column: 21, scope: !235)
!237 = !DILocation(line: 138, column: 28, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !74, line: 138, column: 17)
!239 = !DILocation(line: 138, column: 30, scope: !238)
!240 = !DILocation(line: 138, column: 17, scope: !235)
!241 = !DILocation(line: 140, column: 34, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !74, line: 139, column: 17)
!243 = !DILocation(line: 140, column: 41, scope: !242)
!244 = !DILocation(line: 140, column: 21, scope: !242)
!245 = !DILocation(line: 141, column: 17, scope: !242)
!246 = !DILocation(line: 138, column: 37, scope: !238)
!247 = !DILocation(line: 138, column: 17, scope: !238)
!248 = distinct !{!248, !240, !249, !225}
!249 = !DILocation(line: 141, column: 17, scope: !235)
!250 = !DILocation(line: 142, column: 13, scope: !231)
!251 = !DILocation(line: 145, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !227, file: !74, line: 144, column: 13)
!253 = !DILocation(line: 147, column: 18, scope: !196)
!254 = !DILocation(line: 147, column: 13, scope: !196)
!255 = !DILocation(line: 149, column: 5, scope: !197)
!256 = !DILocation(line: 150, column: 1, scope: !73)
!257 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_10_good", scope: !74, file: !74, line: 468, type: !75, scopeLine: 469, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!258 = !DILocation(line: 470, column: 5, scope: !257)
!259 = !DILocation(line: 471, column: 5, scope: !257)
!260 = !DILocation(line: 472, column: 5, scope: !257)
!261 = !DILocation(line: 473, column: 5, scope: !257)
!262 = !DILocation(line: 474, column: 1, scope: !257)
!263 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 485, type: !264, scopeLine: 486, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!264 = !DISubroutineType(types: !265)
!265 = !{!65, !65, !266}
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !267, size: 64)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!268 = !DILocalVariable(name: "argc", arg: 1, scope: !263, file: !74, line: 485, type: !65)
!269 = !DILocation(line: 485, column: 14, scope: !263)
!270 = !DILocalVariable(name: "argv", arg: 2, scope: !263, file: !74, line: 485, type: !266)
!271 = !DILocation(line: 485, column: 27, scope: !263)
!272 = !DILocation(line: 488, column: 22, scope: !263)
!273 = !DILocation(line: 488, column: 12, scope: !263)
!274 = !DILocation(line: 488, column: 5, scope: !263)
!275 = !DILocation(line: 490, column: 5, scope: !263)
!276 = !DILocation(line: 491, column: 5, scope: !263)
!277 = !DILocation(line: 492, column: 5, scope: !263)
!278 = !DILocation(line: 495, column: 5, scope: !263)
!279 = !DILocation(line: 496, column: 5, scope: !263)
!280 = !DILocation(line: 497, column: 5, scope: !263)
!281 = !DILocation(line: 499, column: 5, scope: !263)
!282 = distinct !DISubprogram(name: "goodB2G1", scope: !74, file: !74, line: 157, type: !75, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!283 = !DILocalVariable(name: "data", scope: !282, file: !74, line: 159, type: !65)
!284 = !DILocation(line: 159, column: 9, scope: !282)
!285 = !DILocation(line: 161, column: 10, scope: !282)
!286 = !DILocation(line: 162, column: 8, scope: !287)
!287 = distinct !DILexicalBlock(scope: !282, file: !74, line: 162, column: 8)
!288 = !DILocation(line: 162, column: 8, scope: !282)
!289 = !DILocalVariable(name: "recvResult", scope: !290, file: !74, line: 169, type: !65)
!290 = distinct !DILexicalBlock(scope: !291, file: !74, line: 164, column: 9)
!291 = distinct !DILexicalBlock(scope: !287, file: !74, line: 163, column: 5)
!292 = !DILocation(line: 169, column: 17, scope: !290)
!293 = !DILocalVariable(name: "service", scope: !290, file: !74, line: 170, type: !89)
!294 = !DILocation(line: 170, column: 32, scope: !290)
!295 = !DILocalVariable(name: "listenSocket", scope: !290, file: !74, line: 171, type: !65)
!296 = !DILocation(line: 171, column: 20, scope: !290)
!297 = !DILocalVariable(name: "acceptSocket", scope: !290, file: !74, line: 172, type: !65)
!298 = !DILocation(line: 172, column: 20, scope: !290)
!299 = !DILocalVariable(name: "inputBuffer", scope: !290, file: !74, line: 173, type: !60)
!300 = !DILocation(line: 173, column: 18, scope: !290)
!301 = !DILocation(line: 174, column: 13, scope: !290)
!302 = !DILocation(line: 184, column: 32, scope: !303)
!303 = distinct !DILexicalBlock(scope: !290, file: !74, line: 175, column: 13)
!304 = !DILocation(line: 184, column: 30, scope: !303)
!305 = !DILocation(line: 185, column: 21, scope: !306)
!306 = distinct !DILexicalBlock(scope: !303, file: !74, line: 185, column: 21)
!307 = !DILocation(line: 185, column: 34, scope: !306)
!308 = !DILocation(line: 185, column: 21, scope: !303)
!309 = !DILocation(line: 187, column: 21, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !74, line: 186, column: 17)
!311 = !DILocation(line: 189, column: 17, scope: !303)
!312 = !DILocation(line: 190, column: 25, scope: !303)
!313 = !DILocation(line: 190, column: 36, scope: !303)
!314 = !DILocation(line: 191, column: 25, scope: !303)
!315 = !DILocation(line: 191, column: 34, scope: !303)
!316 = !DILocation(line: 191, column: 41, scope: !303)
!317 = !DILocation(line: 192, column: 36, scope: !303)
!318 = !DILocation(line: 192, column: 25, scope: !303)
!319 = !DILocation(line: 192, column: 34, scope: !303)
!320 = !DILocation(line: 193, column: 26, scope: !321)
!321 = distinct !DILexicalBlock(scope: !303, file: !74, line: 193, column: 21)
!322 = !DILocation(line: 193, column: 40, scope: !321)
!323 = !DILocation(line: 193, column: 21, scope: !321)
!324 = !DILocation(line: 193, column: 85, scope: !321)
!325 = !DILocation(line: 193, column: 21, scope: !303)
!326 = !DILocation(line: 195, column: 21, scope: !327)
!327 = distinct !DILexicalBlock(scope: !321, file: !74, line: 194, column: 17)
!328 = !DILocation(line: 197, column: 28, scope: !329)
!329 = distinct !DILexicalBlock(scope: !303, file: !74, line: 197, column: 21)
!330 = !DILocation(line: 197, column: 21, scope: !329)
!331 = !DILocation(line: 197, column: 58, scope: !329)
!332 = !DILocation(line: 197, column: 21, scope: !303)
!333 = !DILocation(line: 199, column: 21, scope: !334)
!334 = distinct !DILexicalBlock(scope: !329, file: !74, line: 198, column: 17)
!335 = !DILocation(line: 201, column: 39, scope: !303)
!336 = !DILocation(line: 201, column: 32, scope: !303)
!337 = !DILocation(line: 201, column: 30, scope: !303)
!338 = !DILocation(line: 202, column: 21, scope: !339)
!339 = distinct !DILexicalBlock(scope: !303, file: !74, line: 202, column: 21)
!340 = !DILocation(line: 202, column: 34, scope: !339)
!341 = !DILocation(line: 202, column: 21, scope: !303)
!342 = !DILocation(line: 204, column: 21, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !74, line: 203, column: 17)
!344 = !DILocation(line: 207, column: 35, scope: !303)
!345 = !DILocation(line: 207, column: 49, scope: !303)
!346 = !DILocation(line: 207, column: 30, scope: !303)
!347 = !DILocation(line: 207, column: 28, scope: !303)
!348 = !DILocation(line: 208, column: 21, scope: !349)
!349 = distinct !DILexicalBlock(scope: !303, file: !74, line: 208, column: 21)
!350 = !DILocation(line: 208, column: 32, scope: !349)
!351 = !DILocation(line: 208, column: 48, scope: !349)
!352 = !DILocation(line: 208, column: 51, scope: !349)
!353 = !DILocation(line: 208, column: 62, scope: !349)
!354 = !DILocation(line: 208, column: 21, scope: !303)
!355 = !DILocation(line: 210, column: 21, scope: !356)
!356 = distinct !DILexicalBlock(scope: !349, file: !74, line: 209, column: 17)
!357 = !DILocation(line: 213, column: 29, scope: !303)
!358 = !DILocation(line: 213, column: 17, scope: !303)
!359 = !DILocation(line: 213, column: 41, scope: !303)
!360 = !DILocation(line: 215, column: 29, scope: !303)
!361 = !DILocation(line: 215, column: 24, scope: !303)
!362 = !DILocation(line: 215, column: 22, scope: !303)
!363 = !DILocation(line: 216, column: 13, scope: !303)
!364 = !DILocation(line: 218, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !290, file: !74, line: 218, column: 17)
!366 = !DILocation(line: 218, column: 30, scope: !365)
!367 = !DILocation(line: 218, column: 17, scope: !290)
!368 = !DILocation(line: 220, column: 30, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !74, line: 219, column: 13)
!370 = !DILocation(line: 220, column: 17, scope: !369)
!371 = !DILocation(line: 221, column: 13, scope: !369)
!372 = !DILocation(line: 222, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !290, file: !74, line: 222, column: 17)
!374 = !DILocation(line: 222, column: 30, scope: !373)
!375 = !DILocation(line: 222, column: 17, scope: !290)
!376 = !DILocation(line: 224, column: 30, scope: !377)
!377 = distinct !DILexicalBlock(scope: !373, file: !74, line: 223, column: 13)
!378 = !DILocation(line: 224, column: 17, scope: !377)
!379 = !DILocation(line: 225, column: 13, scope: !377)
!380 = !DILocation(line: 233, column: 5, scope: !291)
!381 = !DILocation(line: 234, column: 8, scope: !382)
!382 = distinct !DILexicalBlock(scope: !282, file: !74, line: 234, column: 8)
!383 = !DILocation(line: 234, column: 8, scope: !282)
!384 = !DILocation(line: 237, column: 9, scope: !385)
!385 = distinct !DILexicalBlock(scope: !382, file: !74, line: 235, column: 5)
!386 = !DILocation(line: 238, column: 5, scope: !385)
!387 = !DILocalVariable(name: "i", scope: !388, file: !74, line: 242, type: !65)
!388 = distinct !DILexicalBlock(scope: !389, file: !74, line: 241, column: 9)
!389 = distinct !DILexicalBlock(scope: !382, file: !74, line: 240, column: 5)
!390 = !DILocation(line: 242, column: 17, scope: !388)
!391 = !DILocalVariable(name: "buffer", scope: !388, file: !74, line: 243, type: !64)
!392 = !DILocation(line: 243, column: 19, scope: !388)
!393 = !DILocation(line: 243, column: 35, scope: !388)
!394 = !DILocation(line: 243, column: 28, scope: !388)
!395 = !DILocation(line: 244, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !388, file: !74, line: 244, column: 17)
!397 = !DILocation(line: 244, column: 24, scope: !396)
!398 = !DILocation(line: 244, column: 17, scope: !388)
!399 = !DILocation(line: 244, column: 34, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !74, line: 244, column: 33)
!401 = !DILocation(line: 246, column: 20, scope: !402)
!402 = distinct !DILexicalBlock(scope: !388, file: !74, line: 246, column: 13)
!403 = !DILocation(line: 246, column: 18, scope: !402)
!404 = !DILocation(line: 246, column: 25, scope: !405)
!405 = distinct !DILexicalBlock(scope: !402, file: !74, line: 246, column: 13)
!406 = !DILocation(line: 246, column: 27, scope: !405)
!407 = !DILocation(line: 246, column: 13, scope: !402)
!408 = !DILocation(line: 248, column: 17, scope: !409)
!409 = distinct !DILexicalBlock(scope: !405, file: !74, line: 247, column: 13)
!410 = !DILocation(line: 248, column: 24, scope: !409)
!411 = !DILocation(line: 248, column: 27, scope: !409)
!412 = !DILocation(line: 249, column: 13, scope: !409)
!413 = !DILocation(line: 246, column: 34, scope: !405)
!414 = !DILocation(line: 246, column: 13, scope: !405)
!415 = distinct !{!415, !407, !416, !225}
!416 = !DILocation(line: 249, column: 13, scope: !402)
!417 = !DILocation(line: 251, column: 17, scope: !418)
!418 = distinct !DILexicalBlock(scope: !388, file: !74, line: 251, column: 17)
!419 = !DILocation(line: 251, column: 22, scope: !418)
!420 = !DILocation(line: 251, column: 27, scope: !418)
!421 = !DILocation(line: 251, column: 30, scope: !418)
!422 = !DILocation(line: 251, column: 35, scope: !418)
!423 = !DILocation(line: 251, column: 17, scope: !388)
!424 = !DILocation(line: 253, column: 17, scope: !425)
!425 = distinct !DILexicalBlock(scope: !418, file: !74, line: 252, column: 13)
!426 = !DILocation(line: 253, column: 24, scope: !425)
!427 = !DILocation(line: 253, column: 30, scope: !425)
!428 = !DILocation(line: 255, column: 23, scope: !429)
!429 = distinct !DILexicalBlock(scope: !425, file: !74, line: 255, column: 17)
!430 = !DILocation(line: 255, column: 21, scope: !429)
!431 = !DILocation(line: 255, column: 28, scope: !432)
!432 = distinct !DILexicalBlock(scope: !429, file: !74, line: 255, column: 17)
!433 = !DILocation(line: 255, column: 30, scope: !432)
!434 = !DILocation(line: 255, column: 17, scope: !429)
!435 = !DILocation(line: 257, column: 34, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !74, line: 256, column: 17)
!437 = !DILocation(line: 257, column: 41, scope: !436)
!438 = !DILocation(line: 257, column: 21, scope: !436)
!439 = !DILocation(line: 258, column: 17, scope: !436)
!440 = !DILocation(line: 255, column: 37, scope: !432)
!441 = !DILocation(line: 255, column: 17, scope: !432)
!442 = distinct !{!442, !434, !443, !225}
!443 = !DILocation(line: 258, column: 17, scope: !429)
!444 = !DILocation(line: 259, column: 13, scope: !425)
!445 = !DILocation(line: 262, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !418, file: !74, line: 261, column: 13)
!447 = !DILocation(line: 264, column: 18, scope: !388)
!448 = !DILocation(line: 264, column: 13, scope: !388)
!449 = !DILocation(line: 267, column: 1, scope: !282)
!450 = distinct !DISubprogram(name: "goodB2G2", scope: !74, file: !74, line: 270, type: !75, scopeLine: 271, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!451 = !DILocalVariable(name: "data", scope: !450, file: !74, line: 272, type: !65)
!452 = !DILocation(line: 272, column: 9, scope: !450)
!453 = !DILocation(line: 274, column: 10, scope: !450)
!454 = !DILocation(line: 275, column: 8, scope: !455)
!455 = distinct !DILexicalBlock(scope: !450, file: !74, line: 275, column: 8)
!456 = !DILocation(line: 275, column: 8, scope: !450)
!457 = !DILocalVariable(name: "recvResult", scope: !458, file: !74, line: 282, type: !65)
!458 = distinct !DILexicalBlock(scope: !459, file: !74, line: 277, column: 9)
!459 = distinct !DILexicalBlock(scope: !455, file: !74, line: 276, column: 5)
!460 = !DILocation(line: 282, column: 17, scope: !458)
!461 = !DILocalVariable(name: "service", scope: !458, file: !74, line: 283, type: !89)
!462 = !DILocation(line: 283, column: 32, scope: !458)
!463 = !DILocalVariable(name: "listenSocket", scope: !458, file: !74, line: 284, type: !65)
!464 = !DILocation(line: 284, column: 20, scope: !458)
!465 = !DILocalVariable(name: "acceptSocket", scope: !458, file: !74, line: 285, type: !65)
!466 = !DILocation(line: 285, column: 20, scope: !458)
!467 = !DILocalVariable(name: "inputBuffer", scope: !458, file: !74, line: 286, type: !60)
!468 = !DILocation(line: 286, column: 18, scope: !458)
!469 = !DILocation(line: 287, column: 13, scope: !458)
!470 = !DILocation(line: 297, column: 32, scope: !471)
!471 = distinct !DILexicalBlock(scope: !458, file: !74, line: 288, column: 13)
!472 = !DILocation(line: 297, column: 30, scope: !471)
!473 = !DILocation(line: 298, column: 21, scope: !474)
!474 = distinct !DILexicalBlock(scope: !471, file: !74, line: 298, column: 21)
!475 = !DILocation(line: 298, column: 34, scope: !474)
!476 = !DILocation(line: 298, column: 21, scope: !471)
!477 = !DILocation(line: 300, column: 21, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !74, line: 299, column: 17)
!479 = !DILocation(line: 302, column: 17, scope: !471)
!480 = !DILocation(line: 303, column: 25, scope: !471)
!481 = !DILocation(line: 303, column: 36, scope: !471)
!482 = !DILocation(line: 304, column: 25, scope: !471)
!483 = !DILocation(line: 304, column: 34, scope: !471)
!484 = !DILocation(line: 304, column: 41, scope: !471)
!485 = !DILocation(line: 305, column: 36, scope: !471)
!486 = !DILocation(line: 305, column: 25, scope: !471)
!487 = !DILocation(line: 305, column: 34, scope: !471)
!488 = !DILocation(line: 306, column: 26, scope: !489)
!489 = distinct !DILexicalBlock(scope: !471, file: !74, line: 306, column: 21)
!490 = !DILocation(line: 306, column: 40, scope: !489)
!491 = !DILocation(line: 306, column: 21, scope: !489)
!492 = !DILocation(line: 306, column: 85, scope: !489)
!493 = !DILocation(line: 306, column: 21, scope: !471)
!494 = !DILocation(line: 308, column: 21, scope: !495)
!495 = distinct !DILexicalBlock(scope: !489, file: !74, line: 307, column: 17)
!496 = !DILocation(line: 310, column: 28, scope: !497)
!497 = distinct !DILexicalBlock(scope: !471, file: !74, line: 310, column: 21)
!498 = !DILocation(line: 310, column: 21, scope: !497)
!499 = !DILocation(line: 310, column: 58, scope: !497)
!500 = !DILocation(line: 310, column: 21, scope: !471)
!501 = !DILocation(line: 312, column: 21, scope: !502)
!502 = distinct !DILexicalBlock(scope: !497, file: !74, line: 311, column: 17)
!503 = !DILocation(line: 314, column: 39, scope: !471)
!504 = !DILocation(line: 314, column: 32, scope: !471)
!505 = !DILocation(line: 314, column: 30, scope: !471)
!506 = !DILocation(line: 315, column: 21, scope: !507)
!507 = distinct !DILexicalBlock(scope: !471, file: !74, line: 315, column: 21)
!508 = !DILocation(line: 315, column: 34, scope: !507)
!509 = !DILocation(line: 315, column: 21, scope: !471)
!510 = !DILocation(line: 317, column: 21, scope: !511)
!511 = distinct !DILexicalBlock(scope: !507, file: !74, line: 316, column: 17)
!512 = !DILocation(line: 320, column: 35, scope: !471)
!513 = !DILocation(line: 320, column: 49, scope: !471)
!514 = !DILocation(line: 320, column: 30, scope: !471)
!515 = !DILocation(line: 320, column: 28, scope: !471)
!516 = !DILocation(line: 321, column: 21, scope: !517)
!517 = distinct !DILexicalBlock(scope: !471, file: !74, line: 321, column: 21)
!518 = !DILocation(line: 321, column: 32, scope: !517)
!519 = !DILocation(line: 321, column: 48, scope: !517)
!520 = !DILocation(line: 321, column: 51, scope: !517)
!521 = !DILocation(line: 321, column: 62, scope: !517)
!522 = !DILocation(line: 321, column: 21, scope: !471)
!523 = !DILocation(line: 323, column: 21, scope: !524)
!524 = distinct !DILexicalBlock(scope: !517, file: !74, line: 322, column: 17)
!525 = !DILocation(line: 326, column: 29, scope: !471)
!526 = !DILocation(line: 326, column: 17, scope: !471)
!527 = !DILocation(line: 326, column: 41, scope: !471)
!528 = !DILocation(line: 328, column: 29, scope: !471)
!529 = !DILocation(line: 328, column: 24, scope: !471)
!530 = !DILocation(line: 328, column: 22, scope: !471)
!531 = !DILocation(line: 329, column: 13, scope: !471)
!532 = !DILocation(line: 331, column: 17, scope: !533)
!533 = distinct !DILexicalBlock(scope: !458, file: !74, line: 331, column: 17)
!534 = !DILocation(line: 331, column: 30, scope: !533)
!535 = !DILocation(line: 331, column: 17, scope: !458)
!536 = !DILocation(line: 333, column: 30, scope: !537)
!537 = distinct !DILexicalBlock(scope: !533, file: !74, line: 332, column: 13)
!538 = !DILocation(line: 333, column: 17, scope: !537)
!539 = !DILocation(line: 334, column: 13, scope: !537)
!540 = !DILocation(line: 335, column: 17, scope: !541)
!541 = distinct !DILexicalBlock(scope: !458, file: !74, line: 335, column: 17)
!542 = !DILocation(line: 335, column: 30, scope: !541)
!543 = !DILocation(line: 335, column: 17, scope: !458)
!544 = !DILocation(line: 337, column: 30, scope: !545)
!545 = distinct !DILexicalBlock(scope: !541, file: !74, line: 336, column: 13)
!546 = !DILocation(line: 337, column: 17, scope: !545)
!547 = !DILocation(line: 338, column: 13, scope: !545)
!548 = !DILocation(line: 346, column: 5, scope: !459)
!549 = !DILocation(line: 347, column: 8, scope: !550)
!550 = distinct !DILexicalBlock(scope: !450, file: !74, line: 347, column: 8)
!551 = !DILocation(line: 347, column: 8, scope: !450)
!552 = !DILocalVariable(name: "i", scope: !553, file: !74, line: 350, type: !65)
!553 = distinct !DILexicalBlock(scope: !554, file: !74, line: 349, column: 9)
!554 = distinct !DILexicalBlock(scope: !550, file: !74, line: 348, column: 5)
!555 = !DILocation(line: 350, column: 17, scope: !553)
!556 = !DILocalVariable(name: "buffer", scope: !553, file: !74, line: 351, type: !64)
!557 = !DILocation(line: 351, column: 19, scope: !553)
!558 = !DILocation(line: 351, column: 35, scope: !553)
!559 = !DILocation(line: 351, column: 28, scope: !553)
!560 = !DILocation(line: 352, column: 17, scope: !561)
!561 = distinct !DILexicalBlock(scope: !553, file: !74, line: 352, column: 17)
!562 = !DILocation(line: 352, column: 24, scope: !561)
!563 = !DILocation(line: 352, column: 17, scope: !553)
!564 = !DILocation(line: 352, column: 34, scope: !565)
!565 = distinct !DILexicalBlock(scope: !561, file: !74, line: 352, column: 33)
!566 = !DILocation(line: 354, column: 20, scope: !567)
!567 = distinct !DILexicalBlock(scope: !553, file: !74, line: 354, column: 13)
!568 = !DILocation(line: 354, column: 18, scope: !567)
!569 = !DILocation(line: 354, column: 25, scope: !570)
!570 = distinct !DILexicalBlock(scope: !567, file: !74, line: 354, column: 13)
!571 = !DILocation(line: 354, column: 27, scope: !570)
!572 = !DILocation(line: 354, column: 13, scope: !567)
!573 = !DILocation(line: 356, column: 17, scope: !574)
!574 = distinct !DILexicalBlock(scope: !570, file: !74, line: 355, column: 13)
!575 = !DILocation(line: 356, column: 24, scope: !574)
!576 = !DILocation(line: 356, column: 27, scope: !574)
!577 = !DILocation(line: 357, column: 13, scope: !574)
!578 = !DILocation(line: 354, column: 34, scope: !570)
!579 = !DILocation(line: 354, column: 13, scope: !570)
!580 = distinct !{!580, !572, !581, !225}
!581 = !DILocation(line: 357, column: 13, scope: !567)
!582 = !DILocation(line: 359, column: 17, scope: !583)
!583 = distinct !DILexicalBlock(scope: !553, file: !74, line: 359, column: 17)
!584 = !DILocation(line: 359, column: 22, scope: !583)
!585 = !DILocation(line: 359, column: 27, scope: !583)
!586 = !DILocation(line: 359, column: 30, scope: !583)
!587 = !DILocation(line: 359, column: 35, scope: !583)
!588 = !DILocation(line: 359, column: 17, scope: !553)
!589 = !DILocation(line: 361, column: 17, scope: !590)
!590 = distinct !DILexicalBlock(scope: !583, file: !74, line: 360, column: 13)
!591 = !DILocation(line: 361, column: 24, scope: !590)
!592 = !DILocation(line: 361, column: 30, scope: !590)
!593 = !DILocation(line: 363, column: 23, scope: !594)
!594 = distinct !DILexicalBlock(scope: !590, file: !74, line: 363, column: 17)
!595 = !DILocation(line: 363, column: 21, scope: !594)
!596 = !DILocation(line: 363, column: 28, scope: !597)
!597 = distinct !DILexicalBlock(scope: !594, file: !74, line: 363, column: 17)
!598 = !DILocation(line: 363, column: 30, scope: !597)
!599 = !DILocation(line: 363, column: 17, scope: !594)
!600 = !DILocation(line: 365, column: 34, scope: !601)
!601 = distinct !DILexicalBlock(scope: !597, file: !74, line: 364, column: 17)
!602 = !DILocation(line: 365, column: 41, scope: !601)
!603 = !DILocation(line: 365, column: 21, scope: !601)
!604 = !DILocation(line: 366, column: 17, scope: !601)
!605 = !DILocation(line: 363, column: 37, scope: !597)
!606 = !DILocation(line: 363, column: 17, scope: !597)
!607 = distinct !{!607, !599, !608, !225}
!608 = !DILocation(line: 366, column: 17, scope: !594)
!609 = !DILocation(line: 367, column: 13, scope: !590)
!610 = !DILocation(line: 370, column: 17, scope: !611)
!611 = distinct !DILexicalBlock(scope: !583, file: !74, line: 369, column: 13)
!612 = !DILocation(line: 372, column: 18, scope: !553)
!613 = !DILocation(line: 372, column: 13, scope: !553)
!614 = !DILocation(line: 374, column: 5, scope: !554)
!615 = !DILocation(line: 375, column: 1, scope: !450)
!616 = distinct !DISubprogram(name: "goodG2B1", scope: !74, file: !74, line: 378, type: !75, scopeLine: 379, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!617 = !DILocalVariable(name: "data", scope: !616, file: !74, line: 380, type: !65)
!618 = !DILocation(line: 380, column: 9, scope: !616)
!619 = !DILocation(line: 382, column: 10, scope: !616)
!620 = !DILocation(line: 383, column: 8, scope: !621)
!621 = distinct !DILexicalBlock(scope: !616, file: !74, line: 383, column: 8)
!622 = !DILocation(line: 383, column: 8, scope: !616)
!623 = !DILocation(line: 386, column: 9, scope: !624)
!624 = distinct !DILexicalBlock(scope: !621, file: !74, line: 384, column: 5)
!625 = !DILocation(line: 387, column: 5, scope: !624)
!626 = !DILocation(line: 392, column: 14, scope: !627)
!627 = distinct !DILexicalBlock(scope: !621, file: !74, line: 389, column: 5)
!628 = !DILocation(line: 394, column: 8, scope: !629)
!629 = distinct !DILexicalBlock(scope: !616, file: !74, line: 394, column: 8)
!630 = !DILocation(line: 394, column: 8, scope: !616)
!631 = !DILocalVariable(name: "i", scope: !632, file: !74, line: 397, type: !65)
!632 = distinct !DILexicalBlock(scope: !633, file: !74, line: 396, column: 9)
!633 = distinct !DILexicalBlock(scope: !629, file: !74, line: 395, column: 5)
!634 = !DILocation(line: 397, column: 17, scope: !632)
!635 = !DILocalVariable(name: "buffer", scope: !632, file: !74, line: 398, type: !64)
!636 = !DILocation(line: 398, column: 19, scope: !632)
!637 = !DILocation(line: 398, column: 35, scope: !632)
!638 = !DILocation(line: 398, column: 28, scope: !632)
!639 = !DILocation(line: 399, column: 17, scope: !640)
!640 = distinct !DILexicalBlock(scope: !632, file: !74, line: 399, column: 17)
!641 = !DILocation(line: 399, column: 24, scope: !640)
!642 = !DILocation(line: 399, column: 17, scope: !632)
!643 = !DILocation(line: 399, column: 34, scope: !644)
!644 = distinct !DILexicalBlock(scope: !640, file: !74, line: 399, column: 33)
!645 = !DILocation(line: 401, column: 20, scope: !646)
!646 = distinct !DILexicalBlock(scope: !632, file: !74, line: 401, column: 13)
!647 = !DILocation(line: 401, column: 18, scope: !646)
!648 = !DILocation(line: 401, column: 25, scope: !649)
!649 = distinct !DILexicalBlock(scope: !646, file: !74, line: 401, column: 13)
!650 = !DILocation(line: 401, column: 27, scope: !649)
!651 = !DILocation(line: 401, column: 13, scope: !646)
!652 = !DILocation(line: 403, column: 17, scope: !653)
!653 = distinct !DILexicalBlock(scope: !649, file: !74, line: 402, column: 13)
!654 = !DILocation(line: 403, column: 24, scope: !653)
!655 = !DILocation(line: 403, column: 27, scope: !653)
!656 = !DILocation(line: 404, column: 13, scope: !653)
!657 = !DILocation(line: 401, column: 34, scope: !649)
!658 = !DILocation(line: 401, column: 13, scope: !649)
!659 = distinct !{!659, !651, !660, !225}
!660 = !DILocation(line: 404, column: 13, scope: !646)
!661 = !DILocation(line: 407, column: 17, scope: !662)
!662 = distinct !DILexicalBlock(scope: !632, file: !74, line: 407, column: 17)
!663 = !DILocation(line: 407, column: 22, scope: !662)
!664 = !DILocation(line: 407, column: 17, scope: !632)
!665 = !DILocation(line: 409, column: 17, scope: !666)
!666 = distinct !DILexicalBlock(scope: !662, file: !74, line: 408, column: 13)
!667 = !DILocation(line: 409, column: 24, scope: !666)
!668 = !DILocation(line: 409, column: 30, scope: !666)
!669 = !DILocation(line: 411, column: 23, scope: !670)
!670 = distinct !DILexicalBlock(scope: !666, file: !74, line: 411, column: 17)
!671 = !DILocation(line: 411, column: 21, scope: !670)
!672 = !DILocation(line: 411, column: 28, scope: !673)
!673 = distinct !DILexicalBlock(scope: !670, file: !74, line: 411, column: 17)
!674 = !DILocation(line: 411, column: 30, scope: !673)
!675 = !DILocation(line: 411, column: 17, scope: !670)
!676 = !DILocation(line: 413, column: 34, scope: !677)
!677 = distinct !DILexicalBlock(scope: !673, file: !74, line: 412, column: 17)
!678 = !DILocation(line: 413, column: 41, scope: !677)
!679 = !DILocation(line: 413, column: 21, scope: !677)
!680 = !DILocation(line: 414, column: 17, scope: !677)
!681 = !DILocation(line: 411, column: 37, scope: !673)
!682 = !DILocation(line: 411, column: 17, scope: !673)
!683 = distinct !{!683, !675, !684, !225}
!684 = !DILocation(line: 414, column: 17, scope: !670)
!685 = !DILocation(line: 415, column: 13, scope: !666)
!686 = !DILocation(line: 418, column: 17, scope: !687)
!687 = distinct !DILexicalBlock(scope: !662, file: !74, line: 417, column: 13)
!688 = !DILocation(line: 420, column: 18, scope: !632)
!689 = !DILocation(line: 420, column: 13, scope: !632)
!690 = !DILocation(line: 422, column: 5, scope: !633)
!691 = !DILocation(line: 423, column: 1, scope: !616)
!692 = distinct !DISubprogram(name: "goodG2B2", scope: !74, file: !74, line: 426, type: !75, scopeLine: 427, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!693 = !DILocalVariable(name: "data", scope: !692, file: !74, line: 428, type: !65)
!694 = !DILocation(line: 428, column: 9, scope: !692)
!695 = !DILocation(line: 430, column: 10, scope: !692)
!696 = !DILocation(line: 431, column: 8, scope: !697)
!697 = distinct !DILexicalBlock(scope: !692, file: !74, line: 431, column: 8)
!698 = !DILocation(line: 431, column: 8, scope: !692)
!699 = !DILocation(line: 435, column: 14, scope: !700)
!700 = distinct !DILexicalBlock(scope: !697, file: !74, line: 432, column: 5)
!701 = !DILocation(line: 436, column: 5, scope: !700)
!702 = !DILocation(line: 437, column: 8, scope: !703)
!703 = distinct !DILexicalBlock(scope: !692, file: !74, line: 437, column: 8)
!704 = !DILocation(line: 437, column: 8, scope: !692)
!705 = !DILocalVariable(name: "i", scope: !706, file: !74, line: 440, type: !65)
!706 = distinct !DILexicalBlock(scope: !707, file: !74, line: 439, column: 9)
!707 = distinct !DILexicalBlock(scope: !703, file: !74, line: 438, column: 5)
!708 = !DILocation(line: 440, column: 17, scope: !706)
!709 = !DILocalVariable(name: "buffer", scope: !706, file: !74, line: 441, type: !64)
!710 = !DILocation(line: 441, column: 19, scope: !706)
!711 = !DILocation(line: 441, column: 35, scope: !706)
!712 = !DILocation(line: 441, column: 28, scope: !706)
!713 = !DILocation(line: 442, column: 17, scope: !714)
!714 = distinct !DILexicalBlock(scope: !706, file: !74, line: 442, column: 17)
!715 = !DILocation(line: 442, column: 24, scope: !714)
!716 = !DILocation(line: 442, column: 17, scope: !706)
!717 = !DILocation(line: 442, column: 34, scope: !718)
!718 = distinct !DILexicalBlock(scope: !714, file: !74, line: 442, column: 33)
!719 = !DILocation(line: 444, column: 20, scope: !720)
!720 = distinct !DILexicalBlock(scope: !706, file: !74, line: 444, column: 13)
!721 = !DILocation(line: 444, column: 18, scope: !720)
!722 = !DILocation(line: 444, column: 25, scope: !723)
!723 = distinct !DILexicalBlock(scope: !720, file: !74, line: 444, column: 13)
!724 = !DILocation(line: 444, column: 27, scope: !723)
!725 = !DILocation(line: 444, column: 13, scope: !720)
!726 = !DILocation(line: 446, column: 17, scope: !727)
!727 = distinct !DILexicalBlock(scope: !723, file: !74, line: 445, column: 13)
!728 = !DILocation(line: 446, column: 24, scope: !727)
!729 = !DILocation(line: 446, column: 27, scope: !727)
!730 = !DILocation(line: 447, column: 13, scope: !727)
!731 = !DILocation(line: 444, column: 34, scope: !723)
!732 = !DILocation(line: 444, column: 13, scope: !723)
!733 = distinct !{!733, !725, !734, !225}
!734 = !DILocation(line: 447, column: 13, scope: !720)
!735 = !DILocation(line: 450, column: 17, scope: !736)
!736 = distinct !DILexicalBlock(scope: !706, file: !74, line: 450, column: 17)
!737 = !DILocation(line: 450, column: 22, scope: !736)
!738 = !DILocation(line: 450, column: 17, scope: !706)
!739 = !DILocation(line: 452, column: 17, scope: !740)
!740 = distinct !DILexicalBlock(scope: !736, file: !74, line: 451, column: 13)
!741 = !DILocation(line: 452, column: 24, scope: !740)
!742 = !DILocation(line: 452, column: 30, scope: !740)
!743 = !DILocation(line: 454, column: 23, scope: !744)
!744 = distinct !DILexicalBlock(scope: !740, file: !74, line: 454, column: 17)
!745 = !DILocation(line: 454, column: 21, scope: !744)
!746 = !DILocation(line: 454, column: 28, scope: !747)
!747 = distinct !DILexicalBlock(scope: !744, file: !74, line: 454, column: 17)
!748 = !DILocation(line: 454, column: 30, scope: !747)
!749 = !DILocation(line: 454, column: 17, scope: !744)
!750 = !DILocation(line: 456, column: 34, scope: !751)
!751 = distinct !DILexicalBlock(scope: !747, file: !74, line: 455, column: 17)
!752 = !DILocation(line: 456, column: 41, scope: !751)
!753 = !DILocation(line: 456, column: 21, scope: !751)
!754 = !DILocation(line: 457, column: 17, scope: !751)
!755 = !DILocation(line: 454, column: 37, scope: !747)
!756 = !DILocation(line: 454, column: 17, scope: !747)
!757 = distinct !{!757, !749, !758, !225}
!758 = !DILocation(line: 457, column: 17, scope: !744)
!759 = !DILocation(line: 458, column: 13, scope: !740)
!760 = !DILocation(line: 461, column: 17, scope: !761)
!761 = distinct !DILexicalBlock(scope: !736, file: !74, line: 460, column: 13)
!762 = !DILocation(line: 463, column: 18, scope: !706)
!763 = !DILocation(line: 463, column: 13, scope: !706)
!764 = !DILocation(line: 465, column: 5, scope: !707)
!765 = !DILocation(line: 466, column: 1, scope: !692)
