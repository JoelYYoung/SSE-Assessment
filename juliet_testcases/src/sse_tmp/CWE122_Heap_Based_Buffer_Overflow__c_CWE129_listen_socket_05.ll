; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !70
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_05_bad() #0 !dbg !79 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32 -1, i32* %data, align 4, !dbg !85
  %0 = load i32, i32* @staticTrue, align 4, !dbg !86
  %tobool = icmp ne i32 %0, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.end34, !dbg !88

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !89, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !93, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %listenSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 -1, i32* %acceptSocket, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  br label %do.body, !dbg !117

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !118
  store i32 %call, i32* %listenSocket, align 4, !dbg !120
  %1 = load i32, i32* %listenSocket, align 4, !dbg !121
  %cmp = icmp eq i32 %1, -1, !dbg !123
  br i1 %cmp, label %if.then1, label %if.end, !dbg !124

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !125

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !127
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !128
  store i16 2, i16* %sin_family, align 4, !dbg !129
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !130
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !131
  store i32 0, i32* %s_addr, align 4, !dbg !132
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !133
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !134
  store i16 %call2, i16* %sin_port, align 2, !dbg !135
  %3 = load i32, i32* %listenSocket, align 4, !dbg !136
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !138
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !139
  %cmp4 = icmp eq i32 %call3, -1, !dbg !140
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !141

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !142

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !144
  %call7 = call i32 @listen(i32 %5, i32 5) #8, !dbg !146
  %cmp8 = icmp eq i32 %call7, -1, !dbg !147
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !148

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !149

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !151
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !152
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !153
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !154
  %cmp12 = icmp eq i32 %7, -1, !dbg !156
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !157

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !158

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !160
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !161
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !162
  %conv = trunc i64 %call15 to i32, !dbg !162
  store i32 %conv, i32* %recvResult, align 4, !dbg !163
  %9 = load i32, i32* %recvResult, align 4, !dbg !164
  %cmp16 = icmp eq i32 %9, -1, !dbg !166
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !167

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !168
  %cmp18 = icmp eq i32 %10, 0, !dbg !169
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !170

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !171

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !173
  %idxprom = sext i32 %11 to i64, !dbg !174
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !174
  store i8 0, i8* %arrayidx, align 1, !dbg !175
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !176
  %call23 = call i32 @atoi(i8* %arraydecay22) #10, !dbg !177
  store i32 %call23, i32* %data, align 4, !dbg !178
  br label %do.end, !dbg !179

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !180
  %cmp24 = icmp ne i32 %12, -1, !dbg !182
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !183

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !184
  %call27 = call i32 @close(i32 %13), !dbg !186
  br label %if.end28, !dbg !187

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !188
  %cmp29 = icmp ne i32 %14, -1, !dbg !190
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !191

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !192
  %call32 = call i32 @close(i32 %15), !dbg !194
  br label %if.end33, !dbg !195

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !196

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticTrue, align 4, !dbg !197
  %tobool35 = icmp ne i32 %16, 0, !dbg !197
  br i1 %tobool35, label %if.then36, label %if.end61, !dbg !199

if.then36:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !200, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !204, metadata !DIExpression()), !dbg !205
  %call37 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !206
  %17 = bitcast i8* %call37 to i32*, !dbg !207
  store i32* %17, i32** %buffer, align 8, !dbg !205
  %18 = load i32*, i32** %buffer, align 8, !dbg !208
  %cmp38 = icmp eq i32* %18, null, !dbg !210
  br i1 %cmp38, label %if.then40, label %if.end41, !dbg !211

if.then40:                                        ; preds = %if.then36
  call void @exit(i32 -1) #11, !dbg !212
  unreachable, !dbg !212

if.end41:                                         ; preds = %if.then36
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.inc, %if.end41
  %19 = load i32, i32* %i, align 4, !dbg !217
  %cmp42 = icmp slt i32 %19, 10, !dbg !219
  br i1 %cmp42, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !221
  %21 = load i32, i32* %i, align 4, !dbg !223
  %idxprom44 = sext i32 %21 to i64, !dbg !221
  %arrayidx45 = getelementptr inbounds i32, i32* %20, i64 %idxprom44, !dbg !221
  store i32 0, i32* %arrayidx45, align 4, !dbg !224
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !226
  %inc = add nsw i32 %22, 1, !dbg !226
  store i32 %inc, i32* %i, align 4, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !231
  %cmp46 = icmp sge i32 %23, 0, !dbg !233
  br i1 %cmp46, label %if.then48, label %if.else, !dbg !234

if.then48:                                        ; preds = %for.end
  %24 = load i32*, i32** %buffer, align 8, !dbg !235
  %25 = load i32, i32* %data, align 4, !dbg !237
  %idxprom49 = sext i32 %25 to i64, !dbg !235
  %arrayidx50 = getelementptr inbounds i32, i32* %24, i64 %idxprom49, !dbg !235
  store i32 1, i32* %arrayidx50, align 4, !dbg !238
  store i32 0, i32* %i, align 4, !dbg !239
  br label %for.cond51, !dbg !241

for.cond51:                                       ; preds = %for.inc57, %if.then48
  %26 = load i32, i32* %i, align 4, !dbg !242
  %cmp52 = icmp slt i32 %26, 10, !dbg !244
  br i1 %cmp52, label %for.body54, label %for.end59, !dbg !245

for.body54:                                       ; preds = %for.cond51
  %27 = load i32*, i32** %buffer, align 8, !dbg !246
  %28 = load i32, i32* %i, align 4, !dbg !248
  %idxprom55 = sext i32 %28 to i64, !dbg !246
  %arrayidx56 = getelementptr inbounds i32, i32* %27, i64 %idxprom55, !dbg !246
  %29 = load i32, i32* %arrayidx56, align 4, !dbg !246
  call void @printIntLine(i32 %29), !dbg !249
  br label %for.inc57, !dbg !250

for.inc57:                                        ; preds = %for.body54
  %30 = load i32, i32* %i, align 4, !dbg !251
  %inc58 = add nsw i32 %30, 1, !dbg !251
  store i32 %inc58, i32* %i, align 4, !dbg !251
  br label %for.cond51, !dbg !252, !llvm.loop !253

for.end59:                                        ; preds = %for.cond51
  br label %if.end60, !dbg !255

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !256
  br label %if.end60

if.end60:                                         ; preds = %if.else, %for.end59
  %31 = load i32*, i32** %buffer, align 8, !dbg !258
  %32 = bitcast i32* %31 to i8*, !dbg !258
  call void @free(i8* %32) #8, !dbg !259
  br label %if.end61, !dbg !260

if.end61:                                         ; preds = %if.end60, %if.end34
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_05_good() #0 !dbg !262 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_05_good(), !dbg !281
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !282
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !283
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_05_bad(), !dbg !284
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !291
  %tobool = icmp ne i32 %0, 0, !dbg !291
  br i1 %tobool, label %if.then, label %if.end34, !dbg !293

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !294, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !298, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !300, metadata !DIExpression()), !dbg !301
  store i32 -1, i32* %listenSocket, align 4, !dbg !301
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !302, metadata !DIExpression()), !dbg !303
  store i32 -1, i32* %acceptSocket, align 4, !dbg !303
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !304, metadata !DIExpression()), !dbg !305
  br label %do.body, !dbg !306

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !307
  store i32 %call, i32* %listenSocket, align 4, !dbg !309
  %1 = load i32, i32* %listenSocket, align 4, !dbg !310
  %cmp = icmp eq i32 %1, -1, !dbg !312
  br i1 %cmp, label %if.then1, label %if.end, !dbg !313

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !314

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !316
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !316
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !317
  store i16 2, i16* %sin_family, align 4, !dbg !318
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !319
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !320
  store i32 0, i32* %s_addr, align 4, !dbg !321
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !322
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !323
  store i16 %call2, i16* %sin_port, align 2, !dbg !324
  %3 = load i32, i32* %listenSocket, align 4, !dbg !325
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !327
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !328
  %cmp4 = icmp eq i32 %call3, -1, !dbg !329
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !330

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !331

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !333
  %call7 = call i32 @listen(i32 %5, i32 5) #8, !dbg !335
  %cmp8 = icmp eq i32 %call7, -1, !dbg !336
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !337

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !338

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !340
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !341
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !342
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !343
  %cmp12 = icmp eq i32 %7, -1, !dbg !345
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !346

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !347

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !349
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !350
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !351
  %conv = trunc i64 %call15 to i32, !dbg !351
  store i32 %conv, i32* %recvResult, align 4, !dbg !352
  %9 = load i32, i32* %recvResult, align 4, !dbg !353
  %cmp16 = icmp eq i32 %9, -1, !dbg !355
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !356

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !357
  %cmp18 = icmp eq i32 %10, 0, !dbg !358
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !359

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !360

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !362
  %idxprom = sext i32 %11 to i64, !dbg !363
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !363
  store i8 0, i8* %arrayidx, align 1, !dbg !364
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !365
  %call23 = call i32 @atoi(i8* %arraydecay22) #10, !dbg !366
  store i32 %call23, i32* %data, align 4, !dbg !367
  br label %do.end, !dbg !368

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !369
  %cmp24 = icmp ne i32 %12, -1, !dbg !371
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !372

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !373
  %call27 = call i32 @close(i32 %13), !dbg !375
  br label %if.end28, !dbg !376

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !377
  %cmp29 = icmp ne i32 %14, -1, !dbg !379
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !380

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !381
  %call32 = call i32 @close(i32 %15), !dbg !383
  br label %if.end33, !dbg !384

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !385

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticFalse, align 4, !dbg !386
  %tobool35 = icmp ne i32 %16, 0, !dbg !386
  br i1 %tobool35, label %if.then36, label %if.else, !dbg !388

if.then36:                                        ; preds = %if.end34
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !389
  br label %if.end64, !dbg !391

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !392, metadata !DIExpression()), !dbg !395
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !396, metadata !DIExpression()), !dbg !397
  %call37 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !398
  %17 = bitcast i8* %call37 to i32*, !dbg !399
  store i32* %17, i32** %buffer, align 8, !dbg !397
  %18 = load i32*, i32** %buffer, align 8, !dbg !400
  %cmp38 = icmp eq i32* %18, null, !dbg !402
  br i1 %cmp38, label %if.then40, label %if.end41, !dbg !403

if.then40:                                        ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !404
  unreachable, !dbg !404

if.end41:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !406
  br label %for.cond, !dbg !408

for.cond:                                         ; preds = %for.inc, %if.end41
  %19 = load i32, i32* %i, align 4, !dbg !409
  %cmp42 = icmp slt i32 %19, 10, !dbg !411
  br i1 %cmp42, label %for.body, label %for.end, !dbg !412

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !413
  %21 = load i32, i32* %i, align 4, !dbg !415
  %idxprom44 = sext i32 %21 to i64, !dbg !413
  %arrayidx45 = getelementptr inbounds i32, i32* %20, i64 %idxprom44, !dbg !413
  store i32 0, i32* %arrayidx45, align 4, !dbg !416
  br label %for.inc, !dbg !417

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !418
  %inc = add nsw i32 %22, 1, !dbg !418
  store i32 %inc, i32* %i, align 4, !dbg !418
  br label %for.cond, !dbg !419, !llvm.loop !420

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !422
  %cmp46 = icmp sge i32 %23, 0, !dbg !424
  br i1 %cmp46, label %land.lhs.true, label %if.else62, !dbg !425

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data, align 4, !dbg !426
  %cmp48 = icmp slt i32 %24, 10, !dbg !427
  br i1 %cmp48, label %if.then50, label %if.else62, !dbg !428

if.then50:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !429
  %26 = load i32, i32* %data, align 4, !dbg !431
  %idxprom51 = sext i32 %26 to i64, !dbg !429
  %arrayidx52 = getelementptr inbounds i32, i32* %25, i64 %idxprom51, !dbg !429
  store i32 1, i32* %arrayidx52, align 4, !dbg !432
  store i32 0, i32* %i, align 4, !dbg !433
  br label %for.cond53, !dbg !435

for.cond53:                                       ; preds = %for.inc59, %if.then50
  %27 = load i32, i32* %i, align 4, !dbg !436
  %cmp54 = icmp slt i32 %27, 10, !dbg !438
  br i1 %cmp54, label %for.body56, label %for.end61, !dbg !439

for.body56:                                       ; preds = %for.cond53
  %28 = load i32*, i32** %buffer, align 8, !dbg !440
  %29 = load i32, i32* %i, align 4, !dbg !442
  %idxprom57 = sext i32 %29 to i64, !dbg !440
  %arrayidx58 = getelementptr inbounds i32, i32* %28, i64 %idxprom57, !dbg !440
  %30 = load i32, i32* %arrayidx58, align 4, !dbg !440
  call void @printIntLine(i32 %30), !dbg !443
  br label %for.inc59, !dbg !444

for.inc59:                                        ; preds = %for.body56
  %31 = load i32, i32* %i, align 4, !dbg !445
  %inc60 = add nsw i32 %31, 1, !dbg !445
  store i32 %inc60, i32* %i, align 4, !dbg !445
  br label %for.cond53, !dbg !446, !llvm.loop !447

for.end61:                                        ; preds = %for.cond53
  br label %if.end63, !dbg !449

if.else62:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !450
  br label %if.end63

if.end63:                                         ; preds = %if.else62, %for.end61
  %32 = load i32*, i32** %buffer, align 8, !dbg !452
  %33 = bitcast i32* %32 to i8*, !dbg !452
  call void @free(i8* %33) #8, !dbg !453
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.then36
  ret void, !dbg !454
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !455 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !456, metadata !DIExpression()), !dbg !457
  store i32 -1, i32* %data, align 4, !dbg !458
  %0 = load i32, i32* @staticTrue, align 4, !dbg !459
  %tobool = icmp ne i32 %0, 0, !dbg !459
  br i1 %tobool, label %if.then, label %if.end34, !dbg !461

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
  %cmp = icmp eq i32 %1, -1, !dbg !480
  br i1 %cmp, label %if.then1, label %if.end, !dbg !481

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !482

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !484
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !484
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !485
  store i16 2, i16* %sin_family, align 4, !dbg !486
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !487
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !488
  store i32 0, i32* %s_addr, align 4, !dbg !489
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !490
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !491
  store i16 %call2, i16* %sin_port, align 2, !dbg !492
  %3 = load i32, i32* %listenSocket, align 4, !dbg !493
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !495
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !496
  %cmp4 = icmp eq i32 %call3, -1, !dbg !497
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !498

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !499

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !501
  %call7 = call i32 @listen(i32 %5, i32 5) #8, !dbg !503
  %cmp8 = icmp eq i32 %call7, -1, !dbg !504
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !505

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !506

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !508
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !509
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !510
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !511
  %cmp12 = icmp eq i32 %7, -1, !dbg !513
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !514

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !515

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !517
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !518
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !519
  %conv = trunc i64 %call15 to i32, !dbg !519
  store i32 %conv, i32* %recvResult, align 4, !dbg !520
  %9 = load i32, i32* %recvResult, align 4, !dbg !521
  %cmp16 = icmp eq i32 %9, -1, !dbg !523
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !524

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !525
  %cmp18 = icmp eq i32 %10, 0, !dbg !526
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !527

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !528

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !530
  %idxprom = sext i32 %11 to i64, !dbg !531
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !531
  store i8 0, i8* %arrayidx, align 1, !dbg !532
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !533
  %call23 = call i32 @atoi(i8* %arraydecay22) #10, !dbg !534
  store i32 %call23, i32* %data, align 4, !dbg !535
  br label %do.end, !dbg !536

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !537
  %cmp24 = icmp ne i32 %12, -1, !dbg !539
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !540

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !541
  %call27 = call i32 @close(i32 %13), !dbg !543
  br label %if.end28, !dbg !544

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !545
  %cmp29 = icmp ne i32 %14, -1, !dbg !547
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !548

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !549
  %call32 = call i32 @close(i32 %15), !dbg !551
  br label %if.end33, !dbg !552

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !553

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticTrue, align 4, !dbg !554
  %tobool35 = icmp ne i32 %16, 0, !dbg !554
  br i1 %tobool35, label %if.then36, label %if.end63, !dbg !556

if.then36:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !557, metadata !DIExpression()), !dbg !560
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !561, metadata !DIExpression()), !dbg !562
  %call37 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !563
  %17 = bitcast i8* %call37 to i32*, !dbg !564
  store i32* %17, i32** %buffer, align 8, !dbg !562
  %18 = load i32*, i32** %buffer, align 8, !dbg !565
  %cmp38 = icmp eq i32* %18, null, !dbg !567
  br i1 %cmp38, label %if.then40, label %if.end41, !dbg !568

if.then40:                                        ; preds = %if.then36
  call void @exit(i32 -1) #11, !dbg !569
  unreachable, !dbg !569

if.end41:                                         ; preds = %if.then36
  store i32 0, i32* %i, align 4, !dbg !571
  br label %for.cond, !dbg !573

for.cond:                                         ; preds = %for.inc, %if.end41
  %19 = load i32, i32* %i, align 4, !dbg !574
  %cmp42 = icmp slt i32 %19, 10, !dbg !576
  br i1 %cmp42, label %for.body, label %for.end, !dbg !577

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !578
  %21 = load i32, i32* %i, align 4, !dbg !580
  %idxprom44 = sext i32 %21 to i64, !dbg !578
  %arrayidx45 = getelementptr inbounds i32, i32* %20, i64 %idxprom44, !dbg !578
  store i32 0, i32* %arrayidx45, align 4, !dbg !581
  br label %for.inc, !dbg !582

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !583
  %inc = add nsw i32 %22, 1, !dbg !583
  store i32 %inc, i32* %i, align 4, !dbg !583
  br label %for.cond, !dbg !584, !llvm.loop !585

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !587
  %cmp46 = icmp sge i32 %23, 0, !dbg !589
  br i1 %cmp46, label %land.lhs.true, label %if.else, !dbg !590

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data, align 4, !dbg !591
  %cmp48 = icmp slt i32 %24, 10, !dbg !592
  br i1 %cmp48, label %if.then50, label %if.else, !dbg !593

if.then50:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !594
  %26 = load i32, i32* %data, align 4, !dbg !596
  %idxprom51 = sext i32 %26 to i64, !dbg !594
  %arrayidx52 = getelementptr inbounds i32, i32* %25, i64 %idxprom51, !dbg !594
  store i32 1, i32* %arrayidx52, align 4, !dbg !597
  store i32 0, i32* %i, align 4, !dbg !598
  br label %for.cond53, !dbg !600

for.cond53:                                       ; preds = %for.inc59, %if.then50
  %27 = load i32, i32* %i, align 4, !dbg !601
  %cmp54 = icmp slt i32 %27, 10, !dbg !603
  br i1 %cmp54, label %for.body56, label %for.end61, !dbg !604

for.body56:                                       ; preds = %for.cond53
  %28 = load i32*, i32** %buffer, align 8, !dbg !605
  %29 = load i32, i32* %i, align 4, !dbg !607
  %idxprom57 = sext i32 %29 to i64, !dbg !605
  %arrayidx58 = getelementptr inbounds i32, i32* %28, i64 %idxprom57, !dbg !605
  %30 = load i32, i32* %arrayidx58, align 4, !dbg !605
  call void @printIntLine(i32 %30), !dbg !608
  br label %for.inc59, !dbg !609

for.inc59:                                        ; preds = %for.body56
  %31 = load i32, i32* %i, align 4, !dbg !610
  %inc60 = add nsw i32 %31, 1, !dbg !610
  store i32 %inc60, i32* %i, align 4, !dbg !610
  br label %for.cond53, !dbg !611, !llvm.loop !612

for.end61:                                        ; preds = %for.cond53
  br label %if.end62, !dbg !614

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !615
  br label %if.end62

if.end62:                                         ; preds = %if.else, %for.end61
  %32 = load i32*, i32** %buffer, align 8, !dbg !617
  %33 = bitcast i32* %32 to i8*, !dbg !617
  call void @free(i8* %33) #8, !dbg !618
  br label %if.end63, !dbg !619

if.end63:                                         ; preds = %if.end62, %if.end34
  ret void, !dbg !620
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !621 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !622, metadata !DIExpression()), !dbg !623
  store i32 -1, i32* %data, align 4, !dbg !624
  %0 = load i32, i32* @staticFalse, align 4, !dbg !625
  %tobool = icmp ne i32 %0, 0, !dbg !625
  br i1 %tobool, label %if.then, label %if.else, !dbg !627

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !628
  br label %if.end, !dbg !630

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !631
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !633
  %tobool1 = icmp ne i32 %1, 0, !dbg !633
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !635

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !636, metadata !DIExpression()), !dbg !639
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !640, metadata !DIExpression()), !dbg !641
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !642
  %2 = bitcast i8* %call to i32*, !dbg !643
  store i32* %2, i32** %buffer, align 8, !dbg !641
  %3 = load i32*, i32** %buffer, align 8, !dbg !644
  %cmp = icmp eq i32* %3, null, !dbg !646
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !647

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !648
  unreachable, !dbg !648

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !650
  br label %for.cond, !dbg !652

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !653
  %cmp5 = icmp slt i32 %4, 10, !dbg !655
  br i1 %cmp5, label %for.body, label %for.end, !dbg !656

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !657
  %6 = load i32, i32* %i, align 4, !dbg !659
  %idxprom = sext i32 %6 to i64, !dbg !657
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !657
  store i32 0, i32* %arrayidx, align 4, !dbg !660
  br label %for.inc, !dbg !661

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !662
  %inc = add nsw i32 %7, 1, !dbg !662
  store i32 %inc, i32* %i, align 4, !dbg !662
  br label %for.cond, !dbg !663, !llvm.loop !664

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !666
  %cmp6 = icmp sge i32 %8, 0, !dbg !668
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !669

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !670
  %10 = load i32, i32* %data, align 4, !dbg !672
  %idxprom8 = sext i32 %10 to i64, !dbg !670
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !670
  store i32 1, i32* %arrayidx9, align 4, !dbg !673
  store i32 0, i32* %i, align 4, !dbg !674
  br label %for.cond10, !dbg !676

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !677
  %cmp11 = icmp slt i32 %11, 10, !dbg !679
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !680

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !681
  %13 = load i32, i32* %i, align 4, !dbg !683
  %idxprom13 = sext i32 %13 to i64, !dbg !681
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !681
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !681
  call void @printIntLine(i32 %14), !dbg !684
  br label %for.inc15, !dbg !685

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !686
  %inc16 = add nsw i32 %15, 1, !dbg !686
  store i32 %inc16, i32* %i, align 4, !dbg !686
  br label %for.cond10, !dbg !687, !llvm.loop !688

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !690

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !691
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !693
  %17 = bitcast i32* %16 to i8*, !dbg !693
  call void @free(i8* %17) #8, !dbg !694
  br label %if.end20, !dbg !695

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !696
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !697 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !698, metadata !DIExpression()), !dbg !699
  store i32 -1, i32* %data, align 4, !dbg !700
  %0 = load i32, i32* @staticTrue, align 4, !dbg !701
  %tobool = icmp ne i32 %0, 0, !dbg !701
  br i1 %tobool, label %if.then, label %if.end, !dbg !703

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !704
  br label %if.end, !dbg !706

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !707
  %tobool1 = icmp ne i32 %1, 0, !dbg !707
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !709

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !710, metadata !DIExpression()), !dbg !713
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !714, metadata !DIExpression()), !dbg !715
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !716
  %2 = bitcast i8* %call to i32*, !dbg !717
  store i32* %2, i32** %buffer, align 8, !dbg !715
  %3 = load i32*, i32** %buffer, align 8, !dbg !718
  %cmp = icmp eq i32* %3, null, !dbg !720
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !721

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !722
  unreachable, !dbg !722

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !724
  br label %for.cond, !dbg !726

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !727
  %cmp5 = icmp slt i32 %4, 10, !dbg !729
  br i1 %cmp5, label %for.body, label %for.end, !dbg !730

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !731
  %6 = load i32, i32* %i, align 4, !dbg !733
  %idxprom = sext i32 %6 to i64, !dbg !731
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !731
  store i32 0, i32* %arrayidx, align 4, !dbg !734
  br label %for.inc, !dbg !735

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !736
  %inc = add nsw i32 %7, 1, !dbg !736
  store i32 %inc, i32* %i, align 4, !dbg !736
  br label %for.cond, !dbg !737, !llvm.loop !738

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !740
  %cmp6 = icmp sge i32 %8, 0, !dbg !742
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !743

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !744
  %10 = load i32, i32* %data, align 4, !dbg !746
  %idxprom8 = sext i32 %10 to i64, !dbg !744
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !744
  store i32 1, i32* %arrayidx9, align 4, !dbg !747
  store i32 0, i32* %i, align 4, !dbg !748
  br label %for.cond10, !dbg !750

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !751
  %cmp11 = icmp slt i32 %11, 10, !dbg !753
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !754

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !755
  %13 = load i32, i32* %i, align 4, !dbg !757
  %idxprom13 = sext i32 %13 to i64, !dbg !755
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !755
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !755
  call void @printIntLine(i32 %14), !dbg !758
  br label %for.inc15, !dbg !759

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !760
  %inc16 = add nsw i32 %15, 1, !dbg !760
  store i32 %inc16, i32* %i, align 4, !dbg !760
  br label %for.cond10, !dbg !761, !llvm.loop !762

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !764

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !765
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !767
  %17 = bitcast i32* %16 to i8*, !dbg !767
  call void @free(i8* %17) #8, !dbg !768
  br label %if.end19, !dbg !769

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !770
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
!llvm.module.flags = !{!73, !74, !75, !76, !77}
!llvm.ident = !{!78}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !72, line: 45, type: !67, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !69, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_05.c", directory: "/home/joelyang/SSE-Assessment")
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
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !52, line: 42, baseType: !7)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !55, line: 178, size: 128, elements: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!56 = !{!57, !61}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !54, file: !55, line: 180, baseType: !58, size: 16)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !59, line: 28, baseType: !60)
!59 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!60 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !54, file: !55, line: 181, baseType: !62, size: 112, offset: 16)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 112, elements: !64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !{!65}
!65 = !DISubrange(count: 14)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!69 = !{!0, !70}
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !72, line: 46, type: !67, isLocal: true, isDefinition: true)
!72 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_05.c", directory: "/home/joelyang/SSE-Assessment")
!73 = !{i32 7, !"Dwarf Version", i32 4}
!74 = !{i32 2, !"Debug Info Version", i32 3}
!75 = !{i32 1, !"wchar_size", i32 4}
!76 = !{i32 7, !"uwtable", i32 1}
!77 = !{i32 7, !"frame-pointer", i32 2}
!78 = !{!"clang version 13.0.0"}
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_05_bad", scope: !72, file: !72, line: 50, type: !80, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!80 = !DISubroutineType(types: !81)
!81 = !{null}
!82 = !{}
!83 = !DILocalVariable(name: "data", scope: !79, file: !72, line: 52, type: !67)
!84 = !DILocation(line: 52, column: 9, scope: !79)
!85 = !DILocation(line: 54, column: 10, scope: !79)
!86 = !DILocation(line: 55, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !72, line: 55, column: 8)
!88 = !DILocation(line: 55, column: 8, scope: !79)
!89 = !DILocalVariable(name: "recvResult", scope: !90, file: !72, line: 62, type: !67)
!90 = distinct !DILexicalBlock(scope: !91, file: !72, line: 57, column: 9)
!91 = distinct !DILexicalBlock(scope: !87, file: !72, line: 56, column: 5)
!92 = !DILocation(line: 62, column: 17, scope: !90)
!93 = !DILocalVariable(name: "service", scope: !90, file: !72, line: 63, type: !94)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !95)
!95 = !{!96, !97, !101, !105}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !94, file: !19, line: 240, baseType: !58, size: 16)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !94, file: !19, line: 241, baseType: !98, size: 16, offset: 16)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 40, baseType: !60)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !94, file: !19, line: 242, baseType: !102, size: 32, offset: 32)
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !103)
!103 = !{!104}
!104 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !102, file: !19, line: 33, baseType: !48, size: 32)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !94, file: !19, line: 245, baseType: !106, size: 64, offset: 64)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 64, elements: !108)
!107 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!108 = !{!109}
!109 = !DISubrange(count: 8)
!110 = !DILocation(line: 63, column: 32, scope: !90)
!111 = !DILocalVariable(name: "listenSocket", scope: !90, file: !72, line: 64, type: !67)
!112 = !DILocation(line: 64, column: 20, scope: !90)
!113 = !DILocalVariable(name: "acceptSocket", scope: !90, file: !72, line: 65, type: !67)
!114 = !DILocation(line: 65, column: 20, scope: !90)
!115 = !DILocalVariable(name: "inputBuffer", scope: !90, file: !72, line: 66, type: !62)
!116 = !DILocation(line: 66, column: 18, scope: !90)
!117 = !DILocation(line: 67, column: 13, scope: !90)
!118 = !DILocation(line: 77, column: 32, scope: !119)
!119 = distinct !DILexicalBlock(scope: !90, file: !72, line: 68, column: 13)
!120 = !DILocation(line: 77, column: 30, scope: !119)
!121 = !DILocation(line: 78, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !72, line: 78, column: 21)
!123 = !DILocation(line: 78, column: 34, scope: !122)
!124 = !DILocation(line: 78, column: 21, scope: !119)
!125 = !DILocation(line: 80, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !72, line: 79, column: 17)
!127 = !DILocation(line: 82, column: 17, scope: !119)
!128 = !DILocation(line: 83, column: 25, scope: !119)
!129 = !DILocation(line: 83, column: 36, scope: !119)
!130 = !DILocation(line: 84, column: 25, scope: !119)
!131 = !DILocation(line: 84, column: 34, scope: !119)
!132 = !DILocation(line: 84, column: 41, scope: !119)
!133 = !DILocation(line: 85, column: 36, scope: !119)
!134 = !DILocation(line: 85, column: 25, scope: !119)
!135 = !DILocation(line: 85, column: 34, scope: !119)
!136 = !DILocation(line: 86, column: 26, scope: !137)
!137 = distinct !DILexicalBlock(scope: !119, file: !72, line: 86, column: 21)
!138 = !DILocation(line: 86, column: 40, scope: !137)
!139 = !DILocation(line: 86, column: 21, scope: !137)
!140 = !DILocation(line: 86, column: 85, scope: !137)
!141 = !DILocation(line: 86, column: 21, scope: !119)
!142 = !DILocation(line: 88, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !72, line: 87, column: 17)
!144 = !DILocation(line: 90, column: 28, scope: !145)
!145 = distinct !DILexicalBlock(scope: !119, file: !72, line: 90, column: 21)
!146 = !DILocation(line: 90, column: 21, scope: !145)
!147 = !DILocation(line: 90, column: 58, scope: !145)
!148 = !DILocation(line: 90, column: 21, scope: !119)
!149 = !DILocation(line: 92, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !72, line: 91, column: 17)
!151 = !DILocation(line: 94, column: 39, scope: !119)
!152 = !DILocation(line: 94, column: 32, scope: !119)
!153 = !DILocation(line: 94, column: 30, scope: !119)
!154 = !DILocation(line: 95, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !119, file: !72, line: 95, column: 21)
!156 = !DILocation(line: 95, column: 34, scope: !155)
!157 = !DILocation(line: 95, column: 21, scope: !119)
!158 = !DILocation(line: 97, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !72, line: 96, column: 17)
!160 = !DILocation(line: 100, column: 35, scope: !119)
!161 = !DILocation(line: 100, column: 49, scope: !119)
!162 = !DILocation(line: 100, column: 30, scope: !119)
!163 = !DILocation(line: 100, column: 28, scope: !119)
!164 = !DILocation(line: 101, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !119, file: !72, line: 101, column: 21)
!166 = !DILocation(line: 101, column: 32, scope: !165)
!167 = !DILocation(line: 101, column: 48, scope: !165)
!168 = !DILocation(line: 101, column: 51, scope: !165)
!169 = !DILocation(line: 101, column: 62, scope: !165)
!170 = !DILocation(line: 101, column: 21, scope: !119)
!171 = !DILocation(line: 103, column: 21, scope: !172)
!172 = distinct !DILexicalBlock(scope: !165, file: !72, line: 102, column: 17)
!173 = !DILocation(line: 106, column: 29, scope: !119)
!174 = !DILocation(line: 106, column: 17, scope: !119)
!175 = !DILocation(line: 106, column: 41, scope: !119)
!176 = !DILocation(line: 108, column: 29, scope: !119)
!177 = !DILocation(line: 108, column: 24, scope: !119)
!178 = !DILocation(line: 108, column: 22, scope: !119)
!179 = !DILocation(line: 109, column: 13, scope: !119)
!180 = !DILocation(line: 111, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !90, file: !72, line: 111, column: 17)
!182 = !DILocation(line: 111, column: 30, scope: !181)
!183 = !DILocation(line: 111, column: 17, scope: !90)
!184 = !DILocation(line: 113, column: 30, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !72, line: 112, column: 13)
!186 = !DILocation(line: 113, column: 17, scope: !185)
!187 = !DILocation(line: 114, column: 13, scope: !185)
!188 = !DILocation(line: 115, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !90, file: !72, line: 115, column: 17)
!190 = !DILocation(line: 115, column: 30, scope: !189)
!191 = !DILocation(line: 115, column: 17, scope: !90)
!192 = !DILocation(line: 117, column: 30, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !72, line: 116, column: 13)
!194 = !DILocation(line: 117, column: 17, scope: !193)
!195 = !DILocation(line: 118, column: 13, scope: !193)
!196 = !DILocation(line: 126, column: 5, scope: !91)
!197 = !DILocation(line: 127, column: 8, scope: !198)
!198 = distinct !DILexicalBlock(scope: !79, file: !72, line: 127, column: 8)
!199 = !DILocation(line: 127, column: 8, scope: !79)
!200 = !DILocalVariable(name: "i", scope: !201, file: !72, line: 130, type: !67)
!201 = distinct !DILexicalBlock(scope: !202, file: !72, line: 129, column: 9)
!202 = distinct !DILexicalBlock(scope: !198, file: !72, line: 128, column: 5)
!203 = !DILocation(line: 130, column: 17, scope: !201)
!204 = !DILocalVariable(name: "buffer", scope: !201, file: !72, line: 131, type: !66)
!205 = !DILocation(line: 131, column: 19, scope: !201)
!206 = !DILocation(line: 131, column: 35, scope: !201)
!207 = !DILocation(line: 131, column: 28, scope: !201)
!208 = !DILocation(line: 132, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !201, file: !72, line: 132, column: 17)
!210 = !DILocation(line: 132, column: 24, scope: !209)
!211 = !DILocation(line: 132, column: 17, scope: !201)
!212 = !DILocation(line: 132, column: 34, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !72, line: 132, column: 33)
!214 = !DILocation(line: 134, column: 20, scope: !215)
!215 = distinct !DILexicalBlock(scope: !201, file: !72, line: 134, column: 13)
!216 = !DILocation(line: 134, column: 18, scope: !215)
!217 = !DILocation(line: 134, column: 25, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !72, line: 134, column: 13)
!219 = !DILocation(line: 134, column: 27, scope: !218)
!220 = !DILocation(line: 134, column: 13, scope: !215)
!221 = !DILocation(line: 136, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !72, line: 135, column: 13)
!223 = !DILocation(line: 136, column: 24, scope: !222)
!224 = !DILocation(line: 136, column: 27, scope: !222)
!225 = !DILocation(line: 137, column: 13, scope: !222)
!226 = !DILocation(line: 134, column: 34, scope: !218)
!227 = !DILocation(line: 134, column: 13, scope: !218)
!228 = distinct !{!228, !220, !229, !230}
!229 = !DILocation(line: 137, column: 13, scope: !215)
!230 = !{!"llvm.loop.mustprogress"}
!231 = !DILocation(line: 140, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !201, file: !72, line: 140, column: 17)
!233 = !DILocation(line: 140, column: 22, scope: !232)
!234 = !DILocation(line: 140, column: 17, scope: !201)
!235 = !DILocation(line: 142, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !72, line: 141, column: 13)
!237 = !DILocation(line: 142, column: 24, scope: !236)
!238 = !DILocation(line: 142, column: 30, scope: !236)
!239 = !DILocation(line: 144, column: 23, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !72, line: 144, column: 17)
!241 = !DILocation(line: 144, column: 21, scope: !240)
!242 = !DILocation(line: 144, column: 28, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !72, line: 144, column: 17)
!244 = !DILocation(line: 144, column: 30, scope: !243)
!245 = !DILocation(line: 144, column: 17, scope: !240)
!246 = !DILocation(line: 146, column: 34, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !72, line: 145, column: 17)
!248 = !DILocation(line: 146, column: 41, scope: !247)
!249 = !DILocation(line: 146, column: 21, scope: !247)
!250 = !DILocation(line: 147, column: 17, scope: !247)
!251 = !DILocation(line: 144, column: 37, scope: !243)
!252 = !DILocation(line: 144, column: 17, scope: !243)
!253 = distinct !{!253, !245, !254, !230}
!254 = !DILocation(line: 147, column: 17, scope: !240)
!255 = !DILocation(line: 148, column: 13, scope: !236)
!256 = !DILocation(line: 151, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !232, file: !72, line: 150, column: 13)
!258 = !DILocation(line: 153, column: 18, scope: !201)
!259 = !DILocation(line: 153, column: 13, scope: !201)
!260 = !DILocation(line: 155, column: 5, scope: !202)
!261 = !DILocation(line: 156, column: 1, scope: !79)
!262 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_05_good", scope: !72, file: !72, line: 474, type: !80, scopeLine: 475, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!263 = !DILocation(line: 476, column: 5, scope: !262)
!264 = !DILocation(line: 477, column: 5, scope: !262)
!265 = !DILocation(line: 478, column: 5, scope: !262)
!266 = !DILocation(line: 479, column: 5, scope: !262)
!267 = !DILocation(line: 480, column: 1, scope: !262)
!268 = distinct !DISubprogram(name: "main", scope: !72, file: !72, line: 491, type: !269, scopeLine: 492, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!269 = !DISubroutineType(types: !270)
!270 = !{!67, !67, !271}
!271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!273 = !DILocalVariable(name: "argc", arg: 1, scope: !268, file: !72, line: 491, type: !67)
!274 = !DILocation(line: 491, column: 14, scope: !268)
!275 = !DILocalVariable(name: "argv", arg: 2, scope: !268, file: !72, line: 491, type: !271)
!276 = !DILocation(line: 491, column: 27, scope: !268)
!277 = !DILocation(line: 494, column: 22, scope: !268)
!278 = !DILocation(line: 494, column: 12, scope: !268)
!279 = !DILocation(line: 494, column: 5, scope: !268)
!280 = !DILocation(line: 496, column: 5, scope: !268)
!281 = !DILocation(line: 497, column: 5, scope: !268)
!282 = !DILocation(line: 498, column: 5, scope: !268)
!283 = !DILocation(line: 501, column: 5, scope: !268)
!284 = !DILocation(line: 502, column: 5, scope: !268)
!285 = !DILocation(line: 503, column: 5, scope: !268)
!286 = !DILocation(line: 505, column: 5, scope: !268)
!287 = distinct !DISubprogram(name: "goodB2G1", scope: !72, file: !72, line: 163, type: !80, scopeLine: 164, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!288 = !DILocalVariable(name: "data", scope: !287, file: !72, line: 165, type: !67)
!289 = !DILocation(line: 165, column: 9, scope: !287)
!290 = !DILocation(line: 167, column: 10, scope: !287)
!291 = !DILocation(line: 168, column: 8, scope: !292)
!292 = distinct !DILexicalBlock(scope: !287, file: !72, line: 168, column: 8)
!293 = !DILocation(line: 168, column: 8, scope: !287)
!294 = !DILocalVariable(name: "recvResult", scope: !295, file: !72, line: 175, type: !67)
!295 = distinct !DILexicalBlock(scope: !296, file: !72, line: 170, column: 9)
!296 = distinct !DILexicalBlock(scope: !292, file: !72, line: 169, column: 5)
!297 = !DILocation(line: 175, column: 17, scope: !295)
!298 = !DILocalVariable(name: "service", scope: !295, file: !72, line: 176, type: !94)
!299 = !DILocation(line: 176, column: 32, scope: !295)
!300 = !DILocalVariable(name: "listenSocket", scope: !295, file: !72, line: 177, type: !67)
!301 = !DILocation(line: 177, column: 20, scope: !295)
!302 = !DILocalVariable(name: "acceptSocket", scope: !295, file: !72, line: 178, type: !67)
!303 = !DILocation(line: 178, column: 20, scope: !295)
!304 = !DILocalVariable(name: "inputBuffer", scope: !295, file: !72, line: 179, type: !62)
!305 = !DILocation(line: 179, column: 18, scope: !295)
!306 = !DILocation(line: 180, column: 13, scope: !295)
!307 = !DILocation(line: 190, column: 32, scope: !308)
!308 = distinct !DILexicalBlock(scope: !295, file: !72, line: 181, column: 13)
!309 = !DILocation(line: 190, column: 30, scope: !308)
!310 = !DILocation(line: 191, column: 21, scope: !311)
!311 = distinct !DILexicalBlock(scope: !308, file: !72, line: 191, column: 21)
!312 = !DILocation(line: 191, column: 34, scope: !311)
!313 = !DILocation(line: 191, column: 21, scope: !308)
!314 = !DILocation(line: 193, column: 21, scope: !315)
!315 = distinct !DILexicalBlock(scope: !311, file: !72, line: 192, column: 17)
!316 = !DILocation(line: 195, column: 17, scope: !308)
!317 = !DILocation(line: 196, column: 25, scope: !308)
!318 = !DILocation(line: 196, column: 36, scope: !308)
!319 = !DILocation(line: 197, column: 25, scope: !308)
!320 = !DILocation(line: 197, column: 34, scope: !308)
!321 = !DILocation(line: 197, column: 41, scope: !308)
!322 = !DILocation(line: 198, column: 36, scope: !308)
!323 = !DILocation(line: 198, column: 25, scope: !308)
!324 = !DILocation(line: 198, column: 34, scope: !308)
!325 = !DILocation(line: 199, column: 26, scope: !326)
!326 = distinct !DILexicalBlock(scope: !308, file: !72, line: 199, column: 21)
!327 = !DILocation(line: 199, column: 40, scope: !326)
!328 = !DILocation(line: 199, column: 21, scope: !326)
!329 = !DILocation(line: 199, column: 85, scope: !326)
!330 = !DILocation(line: 199, column: 21, scope: !308)
!331 = !DILocation(line: 201, column: 21, scope: !332)
!332 = distinct !DILexicalBlock(scope: !326, file: !72, line: 200, column: 17)
!333 = !DILocation(line: 203, column: 28, scope: !334)
!334 = distinct !DILexicalBlock(scope: !308, file: !72, line: 203, column: 21)
!335 = !DILocation(line: 203, column: 21, scope: !334)
!336 = !DILocation(line: 203, column: 58, scope: !334)
!337 = !DILocation(line: 203, column: 21, scope: !308)
!338 = !DILocation(line: 205, column: 21, scope: !339)
!339 = distinct !DILexicalBlock(scope: !334, file: !72, line: 204, column: 17)
!340 = !DILocation(line: 207, column: 39, scope: !308)
!341 = !DILocation(line: 207, column: 32, scope: !308)
!342 = !DILocation(line: 207, column: 30, scope: !308)
!343 = !DILocation(line: 208, column: 21, scope: !344)
!344 = distinct !DILexicalBlock(scope: !308, file: !72, line: 208, column: 21)
!345 = !DILocation(line: 208, column: 34, scope: !344)
!346 = !DILocation(line: 208, column: 21, scope: !308)
!347 = !DILocation(line: 210, column: 21, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !72, line: 209, column: 17)
!349 = !DILocation(line: 213, column: 35, scope: !308)
!350 = !DILocation(line: 213, column: 49, scope: !308)
!351 = !DILocation(line: 213, column: 30, scope: !308)
!352 = !DILocation(line: 213, column: 28, scope: !308)
!353 = !DILocation(line: 214, column: 21, scope: !354)
!354 = distinct !DILexicalBlock(scope: !308, file: !72, line: 214, column: 21)
!355 = !DILocation(line: 214, column: 32, scope: !354)
!356 = !DILocation(line: 214, column: 48, scope: !354)
!357 = !DILocation(line: 214, column: 51, scope: !354)
!358 = !DILocation(line: 214, column: 62, scope: !354)
!359 = !DILocation(line: 214, column: 21, scope: !308)
!360 = !DILocation(line: 216, column: 21, scope: !361)
!361 = distinct !DILexicalBlock(scope: !354, file: !72, line: 215, column: 17)
!362 = !DILocation(line: 219, column: 29, scope: !308)
!363 = !DILocation(line: 219, column: 17, scope: !308)
!364 = !DILocation(line: 219, column: 41, scope: !308)
!365 = !DILocation(line: 221, column: 29, scope: !308)
!366 = !DILocation(line: 221, column: 24, scope: !308)
!367 = !DILocation(line: 221, column: 22, scope: !308)
!368 = !DILocation(line: 222, column: 13, scope: !308)
!369 = !DILocation(line: 224, column: 17, scope: !370)
!370 = distinct !DILexicalBlock(scope: !295, file: !72, line: 224, column: 17)
!371 = !DILocation(line: 224, column: 30, scope: !370)
!372 = !DILocation(line: 224, column: 17, scope: !295)
!373 = !DILocation(line: 226, column: 30, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !72, line: 225, column: 13)
!375 = !DILocation(line: 226, column: 17, scope: !374)
!376 = !DILocation(line: 227, column: 13, scope: !374)
!377 = !DILocation(line: 228, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !295, file: !72, line: 228, column: 17)
!379 = !DILocation(line: 228, column: 30, scope: !378)
!380 = !DILocation(line: 228, column: 17, scope: !295)
!381 = !DILocation(line: 230, column: 30, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !72, line: 229, column: 13)
!383 = !DILocation(line: 230, column: 17, scope: !382)
!384 = !DILocation(line: 231, column: 13, scope: !382)
!385 = !DILocation(line: 239, column: 5, scope: !296)
!386 = !DILocation(line: 240, column: 8, scope: !387)
!387 = distinct !DILexicalBlock(scope: !287, file: !72, line: 240, column: 8)
!388 = !DILocation(line: 240, column: 8, scope: !287)
!389 = !DILocation(line: 243, column: 9, scope: !390)
!390 = distinct !DILexicalBlock(scope: !387, file: !72, line: 241, column: 5)
!391 = !DILocation(line: 244, column: 5, scope: !390)
!392 = !DILocalVariable(name: "i", scope: !393, file: !72, line: 248, type: !67)
!393 = distinct !DILexicalBlock(scope: !394, file: !72, line: 247, column: 9)
!394 = distinct !DILexicalBlock(scope: !387, file: !72, line: 246, column: 5)
!395 = !DILocation(line: 248, column: 17, scope: !393)
!396 = !DILocalVariable(name: "buffer", scope: !393, file: !72, line: 249, type: !66)
!397 = !DILocation(line: 249, column: 19, scope: !393)
!398 = !DILocation(line: 249, column: 35, scope: !393)
!399 = !DILocation(line: 249, column: 28, scope: !393)
!400 = !DILocation(line: 250, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !393, file: !72, line: 250, column: 17)
!402 = !DILocation(line: 250, column: 24, scope: !401)
!403 = !DILocation(line: 250, column: 17, scope: !393)
!404 = !DILocation(line: 250, column: 34, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !72, line: 250, column: 33)
!406 = !DILocation(line: 252, column: 20, scope: !407)
!407 = distinct !DILexicalBlock(scope: !393, file: !72, line: 252, column: 13)
!408 = !DILocation(line: 252, column: 18, scope: !407)
!409 = !DILocation(line: 252, column: 25, scope: !410)
!410 = distinct !DILexicalBlock(scope: !407, file: !72, line: 252, column: 13)
!411 = !DILocation(line: 252, column: 27, scope: !410)
!412 = !DILocation(line: 252, column: 13, scope: !407)
!413 = !DILocation(line: 254, column: 17, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !72, line: 253, column: 13)
!415 = !DILocation(line: 254, column: 24, scope: !414)
!416 = !DILocation(line: 254, column: 27, scope: !414)
!417 = !DILocation(line: 255, column: 13, scope: !414)
!418 = !DILocation(line: 252, column: 34, scope: !410)
!419 = !DILocation(line: 252, column: 13, scope: !410)
!420 = distinct !{!420, !412, !421, !230}
!421 = !DILocation(line: 255, column: 13, scope: !407)
!422 = !DILocation(line: 257, column: 17, scope: !423)
!423 = distinct !DILexicalBlock(scope: !393, file: !72, line: 257, column: 17)
!424 = !DILocation(line: 257, column: 22, scope: !423)
!425 = !DILocation(line: 257, column: 27, scope: !423)
!426 = !DILocation(line: 257, column: 30, scope: !423)
!427 = !DILocation(line: 257, column: 35, scope: !423)
!428 = !DILocation(line: 257, column: 17, scope: !393)
!429 = !DILocation(line: 259, column: 17, scope: !430)
!430 = distinct !DILexicalBlock(scope: !423, file: !72, line: 258, column: 13)
!431 = !DILocation(line: 259, column: 24, scope: !430)
!432 = !DILocation(line: 259, column: 30, scope: !430)
!433 = !DILocation(line: 261, column: 23, scope: !434)
!434 = distinct !DILexicalBlock(scope: !430, file: !72, line: 261, column: 17)
!435 = !DILocation(line: 261, column: 21, scope: !434)
!436 = !DILocation(line: 261, column: 28, scope: !437)
!437 = distinct !DILexicalBlock(scope: !434, file: !72, line: 261, column: 17)
!438 = !DILocation(line: 261, column: 30, scope: !437)
!439 = !DILocation(line: 261, column: 17, scope: !434)
!440 = !DILocation(line: 263, column: 34, scope: !441)
!441 = distinct !DILexicalBlock(scope: !437, file: !72, line: 262, column: 17)
!442 = !DILocation(line: 263, column: 41, scope: !441)
!443 = !DILocation(line: 263, column: 21, scope: !441)
!444 = !DILocation(line: 264, column: 17, scope: !441)
!445 = !DILocation(line: 261, column: 37, scope: !437)
!446 = !DILocation(line: 261, column: 17, scope: !437)
!447 = distinct !{!447, !439, !448, !230}
!448 = !DILocation(line: 264, column: 17, scope: !434)
!449 = !DILocation(line: 265, column: 13, scope: !430)
!450 = !DILocation(line: 268, column: 17, scope: !451)
!451 = distinct !DILexicalBlock(scope: !423, file: !72, line: 267, column: 13)
!452 = !DILocation(line: 270, column: 18, scope: !393)
!453 = !DILocation(line: 270, column: 13, scope: !393)
!454 = !DILocation(line: 273, column: 1, scope: !287)
!455 = distinct !DISubprogram(name: "goodB2G2", scope: !72, file: !72, line: 276, type: !80, scopeLine: 277, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!456 = !DILocalVariable(name: "data", scope: !455, file: !72, line: 278, type: !67)
!457 = !DILocation(line: 278, column: 9, scope: !455)
!458 = !DILocation(line: 280, column: 10, scope: !455)
!459 = !DILocation(line: 281, column: 8, scope: !460)
!460 = distinct !DILexicalBlock(scope: !455, file: !72, line: 281, column: 8)
!461 = !DILocation(line: 281, column: 8, scope: !455)
!462 = !DILocalVariable(name: "recvResult", scope: !463, file: !72, line: 288, type: !67)
!463 = distinct !DILexicalBlock(scope: !464, file: !72, line: 283, column: 9)
!464 = distinct !DILexicalBlock(scope: !460, file: !72, line: 282, column: 5)
!465 = !DILocation(line: 288, column: 17, scope: !463)
!466 = !DILocalVariable(name: "service", scope: !463, file: !72, line: 289, type: !94)
!467 = !DILocation(line: 289, column: 32, scope: !463)
!468 = !DILocalVariable(name: "listenSocket", scope: !463, file: !72, line: 290, type: !67)
!469 = !DILocation(line: 290, column: 20, scope: !463)
!470 = !DILocalVariable(name: "acceptSocket", scope: !463, file: !72, line: 291, type: !67)
!471 = !DILocation(line: 291, column: 20, scope: !463)
!472 = !DILocalVariable(name: "inputBuffer", scope: !463, file: !72, line: 292, type: !62)
!473 = !DILocation(line: 292, column: 18, scope: !463)
!474 = !DILocation(line: 293, column: 13, scope: !463)
!475 = !DILocation(line: 303, column: 32, scope: !476)
!476 = distinct !DILexicalBlock(scope: !463, file: !72, line: 294, column: 13)
!477 = !DILocation(line: 303, column: 30, scope: !476)
!478 = !DILocation(line: 304, column: 21, scope: !479)
!479 = distinct !DILexicalBlock(scope: !476, file: !72, line: 304, column: 21)
!480 = !DILocation(line: 304, column: 34, scope: !479)
!481 = !DILocation(line: 304, column: 21, scope: !476)
!482 = !DILocation(line: 306, column: 21, scope: !483)
!483 = distinct !DILexicalBlock(scope: !479, file: !72, line: 305, column: 17)
!484 = !DILocation(line: 308, column: 17, scope: !476)
!485 = !DILocation(line: 309, column: 25, scope: !476)
!486 = !DILocation(line: 309, column: 36, scope: !476)
!487 = !DILocation(line: 310, column: 25, scope: !476)
!488 = !DILocation(line: 310, column: 34, scope: !476)
!489 = !DILocation(line: 310, column: 41, scope: !476)
!490 = !DILocation(line: 311, column: 36, scope: !476)
!491 = !DILocation(line: 311, column: 25, scope: !476)
!492 = !DILocation(line: 311, column: 34, scope: !476)
!493 = !DILocation(line: 312, column: 26, scope: !494)
!494 = distinct !DILexicalBlock(scope: !476, file: !72, line: 312, column: 21)
!495 = !DILocation(line: 312, column: 40, scope: !494)
!496 = !DILocation(line: 312, column: 21, scope: !494)
!497 = !DILocation(line: 312, column: 85, scope: !494)
!498 = !DILocation(line: 312, column: 21, scope: !476)
!499 = !DILocation(line: 314, column: 21, scope: !500)
!500 = distinct !DILexicalBlock(scope: !494, file: !72, line: 313, column: 17)
!501 = !DILocation(line: 316, column: 28, scope: !502)
!502 = distinct !DILexicalBlock(scope: !476, file: !72, line: 316, column: 21)
!503 = !DILocation(line: 316, column: 21, scope: !502)
!504 = !DILocation(line: 316, column: 58, scope: !502)
!505 = !DILocation(line: 316, column: 21, scope: !476)
!506 = !DILocation(line: 318, column: 21, scope: !507)
!507 = distinct !DILexicalBlock(scope: !502, file: !72, line: 317, column: 17)
!508 = !DILocation(line: 320, column: 39, scope: !476)
!509 = !DILocation(line: 320, column: 32, scope: !476)
!510 = !DILocation(line: 320, column: 30, scope: !476)
!511 = !DILocation(line: 321, column: 21, scope: !512)
!512 = distinct !DILexicalBlock(scope: !476, file: !72, line: 321, column: 21)
!513 = !DILocation(line: 321, column: 34, scope: !512)
!514 = !DILocation(line: 321, column: 21, scope: !476)
!515 = !DILocation(line: 323, column: 21, scope: !516)
!516 = distinct !DILexicalBlock(scope: !512, file: !72, line: 322, column: 17)
!517 = !DILocation(line: 326, column: 35, scope: !476)
!518 = !DILocation(line: 326, column: 49, scope: !476)
!519 = !DILocation(line: 326, column: 30, scope: !476)
!520 = !DILocation(line: 326, column: 28, scope: !476)
!521 = !DILocation(line: 327, column: 21, scope: !522)
!522 = distinct !DILexicalBlock(scope: !476, file: !72, line: 327, column: 21)
!523 = !DILocation(line: 327, column: 32, scope: !522)
!524 = !DILocation(line: 327, column: 48, scope: !522)
!525 = !DILocation(line: 327, column: 51, scope: !522)
!526 = !DILocation(line: 327, column: 62, scope: !522)
!527 = !DILocation(line: 327, column: 21, scope: !476)
!528 = !DILocation(line: 329, column: 21, scope: !529)
!529 = distinct !DILexicalBlock(scope: !522, file: !72, line: 328, column: 17)
!530 = !DILocation(line: 332, column: 29, scope: !476)
!531 = !DILocation(line: 332, column: 17, scope: !476)
!532 = !DILocation(line: 332, column: 41, scope: !476)
!533 = !DILocation(line: 334, column: 29, scope: !476)
!534 = !DILocation(line: 334, column: 24, scope: !476)
!535 = !DILocation(line: 334, column: 22, scope: !476)
!536 = !DILocation(line: 335, column: 13, scope: !476)
!537 = !DILocation(line: 337, column: 17, scope: !538)
!538 = distinct !DILexicalBlock(scope: !463, file: !72, line: 337, column: 17)
!539 = !DILocation(line: 337, column: 30, scope: !538)
!540 = !DILocation(line: 337, column: 17, scope: !463)
!541 = !DILocation(line: 339, column: 30, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !72, line: 338, column: 13)
!543 = !DILocation(line: 339, column: 17, scope: !542)
!544 = !DILocation(line: 340, column: 13, scope: !542)
!545 = !DILocation(line: 341, column: 17, scope: !546)
!546 = distinct !DILexicalBlock(scope: !463, file: !72, line: 341, column: 17)
!547 = !DILocation(line: 341, column: 30, scope: !546)
!548 = !DILocation(line: 341, column: 17, scope: !463)
!549 = !DILocation(line: 343, column: 30, scope: !550)
!550 = distinct !DILexicalBlock(scope: !546, file: !72, line: 342, column: 13)
!551 = !DILocation(line: 343, column: 17, scope: !550)
!552 = !DILocation(line: 344, column: 13, scope: !550)
!553 = !DILocation(line: 352, column: 5, scope: !464)
!554 = !DILocation(line: 353, column: 8, scope: !555)
!555 = distinct !DILexicalBlock(scope: !455, file: !72, line: 353, column: 8)
!556 = !DILocation(line: 353, column: 8, scope: !455)
!557 = !DILocalVariable(name: "i", scope: !558, file: !72, line: 356, type: !67)
!558 = distinct !DILexicalBlock(scope: !559, file: !72, line: 355, column: 9)
!559 = distinct !DILexicalBlock(scope: !555, file: !72, line: 354, column: 5)
!560 = !DILocation(line: 356, column: 17, scope: !558)
!561 = !DILocalVariable(name: "buffer", scope: !558, file: !72, line: 357, type: !66)
!562 = !DILocation(line: 357, column: 19, scope: !558)
!563 = !DILocation(line: 357, column: 35, scope: !558)
!564 = !DILocation(line: 357, column: 28, scope: !558)
!565 = !DILocation(line: 358, column: 17, scope: !566)
!566 = distinct !DILexicalBlock(scope: !558, file: !72, line: 358, column: 17)
!567 = !DILocation(line: 358, column: 24, scope: !566)
!568 = !DILocation(line: 358, column: 17, scope: !558)
!569 = !DILocation(line: 358, column: 34, scope: !570)
!570 = distinct !DILexicalBlock(scope: !566, file: !72, line: 358, column: 33)
!571 = !DILocation(line: 360, column: 20, scope: !572)
!572 = distinct !DILexicalBlock(scope: !558, file: !72, line: 360, column: 13)
!573 = !DILocation(line: 360, column: 18, scope: !572)
!574 = !DILocation(line: 360, column: 25, scope: !575)
!575 = distinct !DILexicalBlock(scope: !572, file: !72, line: 360, column: 13)
!576 = !DILocation(line: 360, column: 27, scope: !575)
!577 = !DILocation(line: 360, column: 13, scope: !572)
!578 = !DILocation(line: 362, column: 17, scope: !579)
!579 = distinct !DILexicalBlock(scope: !575, file: !72, line: 361, column: 13)
!580 = !DILocation(line: 362, column: 24, scope: !579)
!581 = !DILocation(line: 362, column: 27, scope: !579)
!582 = !DILocation(line: 363, column: 13, scope: !579)
!583 = !DILocation(line: 360, column: 34, scope: !575)
!584 = !DILocation(line: 360, column: 13, scope: !575)
!585 = distinct !{!585, !577, !586, !230}
!586 = !DILocation(line: 363, column: 13, scope: !572)
!587 = !DILocation(line: 365, column: 17, scope: !588)
!588 = distinct !DILexicalBlock(scope: !558, file: !72, line: 365, column: 17)
!589 = !DILocation(line: 365, column: 22, scope: !588)
!590 = !DILocation(line: 365, column: 27, scope: !588)
!591 = !DILocation(line: 365, column: 30, scope: !588)
!592 = !DILocation(line: 365, column: 35, scope: !588)
!593 = !DILocation(line: 365, column: 17, scope: !558)
!594 = !DILocation(line: 367, column: 17, scope: !595)
!595 = distinct !DILexicalBlock(scope: !588, file: !72, line: 366, column: 13)
!596 = !DILocation(line: 367, column: 24, scope: !595)
!597 = !DILocation(line: 367, column: 30, scope: !595)
!598 = !DILocation(line: 369, column: 23, scope: !599)
!599 = distinct !DILexicalBlock(scope: !595, file: !72, line: 369, column: 17)
!600 = !DILocation(line: 369, column: 21, scope: !599)
!601 = !DILocation(line: 369, column: 28, scope: !602)
!602 = distinct !DILexicalBlock(scope: !599, file: !72, line: 369, column: 17)
!603 = !DILocation(line: 369, column: 30, scope: !602)
!604 = !DILocation(line: 369, column: 17, scope: !599)
!605 = !DILocation(line: 371, column: 34, scope: !606)
!606 = distinct !DILexicalBlock(scope: !602, file: !72, line: 370, column: 17)
!607 = !DILocation(line: 371, column: 41, scope: !606)
!608 = !DILocation(line: 371, column: 21, scope: !606)
!609 = !DILocation(line: 372, column: 17, scope: !606)
!610 = !DILocation(line: 369, column: 37, scope: !602)
!611 = !DILocation(line: 369, column: 17, scope: !602)
!612 = distinct !{!612, !604, !613, !230}
!613 = !DILocation(line: 372, column: 17, scope: !599)
!614 = !DILocation(line: 373, column: 13, scope: !595)
!615 = !DILocation(line: 376, column: 17, scope: !616)
!616 = distinct !DILexicalBlock(scope: !588, file: !72, line: 375, column: 13)
!617 = !DILocation(line: 378, column: 18, scope: !558)
!618 = !DILocation(line: 378, column: 13, scope: !558)
!619 = !DILocation(line: 380, column: 5, scope: !559)
!620 = !DILocation(line: 381, column: 1, scope: !455)
!621 = distinct !DISubprogram(name: "goodG2B1", scope: !72, file: !72, line: 384, type: !80, scopeLine: 385, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!622 = !DILocalVariable(name: "data", scope: !621, file: !72, line: 386, type: !67)
!623 = !DILocation(line: 386, column: 9, scope: !621)
!624 = !DILocation(line: 388, column: 10, scope: !621)
!625 = !DILocation(line: 389, column: 8, scope: !626)
!626 = distinct !DILexicalBlock(scope: !621, file: !72, line: 389, column: 8)
!627 = !DILocation(line: 389, column: 8, scope: !621)
!628 = !DILocation(line: 392, column: 9, scope: !629)
!629 = distinct !DILexicalBlock(scope: !626, file: !72, line: 390, column: 5)
!630 = !DILocation(line: 393, column: 5, scope: !629)
!631 = !DILocation(line: 398, column: 14, scope: !632)
!632 = distinct !DILexicalBlock(scope: !626, file: !72, line: 395, column: 5)
!633 = !DILocation(line: 400, column: 8, scope: !634)
!634 = distinct !DILexicalBlock(scope: !621, file: !72, line: 400, column: 8)
!635 = !DILocation(line: 400, column: 8, scope: !621)
!636 = !DILocalVariable(name: "i", scope: !637, file: !72, line: 403, type: !67)
!637 = distinct !DILexicalBlock(scope: !638, file: !72, line: 402, column: 9)
!638 = distinct !DILexicalBlock(scope: !634, file: !72, line: 401, column: 5)
!639 = !DILocation(line: 403, column: 17, scope: !637)
!640 = !DILocalVariable(name: "buffer", scope: !637, file: !72, line: 404, type: !66)
!641 = !DILocation(line: 404, column: 19, scope: !637)
!642 = !DILocation(line: 404, column: 35, scope: !637)
!643 = !DILocation(line: 404, column: 28, scope: !637)
!644 = !DILocation(line: 405, column: 17, scope: !645)
!645 = distinct !DILexicalBlock(scope: !637, file: !72, line: 405, column: 17)
!646 = !DILocation(line: 405, column: 24, scope: !645)
!647 = !DILocation(line: 405, column: 17, scope: !637)
!648 = !DILocation(line: 405, column: 34, scope: !649)
!649 = distinct !DILexicalBlock(scope: !645, file: !72, line: 405, column: 33)
!650 = !DILocation(line: 407, column: 20, scope: !651)
!651 = distinct !DILexicalBlock(scope: !637, file: !72, line: 407, column: 13)
!652 = !DILocation(line: 407, column: 18, scope: !651)
!653 = !DILocation(line: 407, column: 25, scope: !654)
!654 = distinct !DILexicalBlock(scope: !651, file: !72, line: 407, column: 13)
!655 = !DILocation(line: 407, column: 27, scope: !654)
!656 = !DILocation(line: 407, column: 13, scope: !651)
!657 = !DILocation(line: 409, column: 17, scope: !658)
!658 = distinct !DILexicalBlock(scope: !654, file: !72, line: 408, column: 13)
!659 = !DILocation(line: 409, column: 24, scope: !658)
!660 = !DILocation(line: 409, column: 27, scope: !658)
!661 = !DILocation(line: 410, column: 13, scope: !658)
!662 = !DILocation(line: 407, column: 34, scope: !654)
!663 = !DILocation(line: 407, column: 13, scope: !654)
!664 = distinct !{!664, !656, !665, !230}
!665 = !DILocation(line: 410, column: 13, scope: !651)
!666 = !DILocation(line: 413, column: 17, scope: !667)
!667 = distinct !DILexicalBlock(scope: !637, file: !72, line: 413, column: 17)
!668 = !DILocation(line: 413, column: 22, scope: !667)
!669 = !DILocation(line: 413, column: 17, scope: !637)
!670 = !DILocation(line: 415, column: 17, scope: !671)
!671 = distinct !DILexicalBlock(scope: !667, file: !72, line: 414, column: 13)
!672 = !DILocation(line: 415, column: 24, scope: !671)
!673 = !DILocation(line: 415, column: 30, scope: !671)
!674 = !DILocation(line: 417, column: 23, scope: !675)
!675 = distinct !DILexicalBlock(scope: !671, file: !72, line: 417, column: 17)
!676 = !DILocation(line: 417, column: 21, scope: !675)
!677 = !DILocation(line: 417, column: 28, scope: !678)
!678 = distinct !DILexicalBlock(scope: !675, file: !72, line: 417, column: 17)
!679 = !DILocation(line: 417, column: 30, scope: !678)
!680 = !DILocation(line: 417, column: 17, scope: !675)
!681 = !DILocation(line: 419, column: 34, scope: !682)
!682 = distinct !DILexicalBlock(scope: !678, file: !72, line: 418, column: 17)
!683 = !DILocation(line: 419, column: 41, scope: !682)
!684 = !DILocation(line: 419, column: 21, scope: !682)
!685 = !DILocation(line: 420, column: 17, scope: !682)
!686 = !DILocation(line: 417, column: 37, scope: !678)
!687 = !DILocation(line: 417, column: 17, scope: !678)
!688 = distinct !{!688, !680, !689, !230}
!689 = !DILocation(line: 420, column: 17, scope: !675)
!690 = !DILocation(line: 421, column: 13, scope: !671)
!691 = !DILocation(line: 424, column: 17, scope: !692)
!692 = distinct !DILexicalBlock(scope: !667, file: !72, line: 423, column: 13)
!693 = !DILocation(line: 426, column: 18, scope: !637)
!694 = !DILocation(line: 426, column: 13, scope: !637)
!695 = !DILocation(line: 428, column: 5, scope: !638)
!696 = !DILocation(line: 429, column: 1, scope: !621)
!697 = distinct !DISubprogram(name: "goodG2B2", scope: !72, file: !72, line: 432, type: !80, scopeLine: 433, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!698 = !DILocalVariable(name: "data", scope: !697, file: !72, line: 434, type: !67)
!699 = !DILocation(line: 434, column: 9, scope: !697)
!700 = !DILocation(line: 436, column: 10, scope: !697)
!701 = !DILocation(line: 437, column: 8, scope: !702)
!702 = distinct !DILexicalBlock(scope: !697, file: !72, line: 437, column: 8)
!703 = !DILocation(line: 437, column: 8, scope: !697)
!704 = !DILocation(line: 441, column: 14, scope: !705)
!705 = distinct !DILexicalBlock(scope: !702, file: !72, line: 438, column: 5)
!706 = !DILocation(line: 442, column: 5, scope: !705)
!707 = !DILocation(line: 443, column: 8, scope: !708)
!708 = distinct !DILexicalBlock(scope: !697, file: !72, line: 443, column: 8)
!709 = !DILocation(line: 443, column: 8, scope: !697)
!710 = !DILocalVariable(name: "i", scope: !711, file: !72, line: 446, type: !67)
!711 = distinct !DILexicalBlock(scope: !712, file: !72, line: 445, column: 9)
!712 = distinct !DILexicalBlock(scope: !708, file: !72, line: 444, column: 5)
!713 = !DILocation(line: 446, column: 17, scope: !711)
!714 = !DILocalVariable(name: "buffer", scope: !711, file: !72, line: 447, type: !66)
!715 = !DILocation(line: 447, column: 19, scope: !711)
!716 = !DILocation(line: 447, column: 35, scope: !711)
!717 = !DILocation(line: 447, column: 28, scope: !711)
!718 = !DILocation(line: 448, column: 17, scope: !719)
!719 = distinct !DILexicalBlock(scope: !711, file: !72, line: 448, column: 17)
!720 = !DILocation(line: 448, column: 24, scope: !719)
!721 = !DILocation(line: 448, column: 17, scope: !711)
!722 = !DILocation(line: 448, column: 34, scope: !723)
!723 = distinct !DILexicalBlock(scope: !719, file: !72, line: 448, column: 33)
!724 = !DILocation(line: 450, column: 20, scope: !725)
!725 = distinct !DILexicalBlock(scope: !711, file: !72, line: 450, column: 13)
!726 = !DILocation(line: 450, column: 18, scope: !725)
!727 = !DILocation(line: 450, column: 25, scope: !728)
!728 = distinct !DILexicalBlock(scope: !725, file: !72, line: 450, column: 13)
!729 = !DILocation(line: 450, column: 27, scope: !728)
!730 = !DILocation(line: 450, column: 13, scope: !725)
!731 = !DILocation(line: 452, column: 17, scope: !732)
!732 = distinct !DILexicalBlock(scope: !728, file: !72, line: 451, column: 13)
!733 = !DILocation(line: 452, column: 24, scope: !732)
!734 = !DILocation(line: 452, column: 27, scope: !732)
!735 = !DILocation(line: 453, column: 13, scope: !732)
!736 = !DILocation(line: 450, column: 34, scope: !728)
!737 = !DILocation(line: 450, column: 13, scope: !728)
!738 = distinct !{!738, !730, !739, !230}
!739 = !DILocation(line: 453, column: 13, scope: !725)
!740 = !DILocation(line: 456, column: 17, scope: !741)
!741 = distinct !DILexicalBlock(scope: !711, file: !72, line: 456, column: 17)
!742 = !DILocation(line: 456, column: 22, scope: !741)
!743 = !DILocation(line: 456, column: 17, scope: !711)
!744 = !DILocation(line: 458, column: 17, scope: !745)
!745 = distinct !DILexicalBlock(scope: !741, file: !72, line: 457, column: 13)
!746 = !DILocation(line: 458, column: 24, scope: !745)
!747 = !DILocation(line: 458, column: 30, scope: !745)
!748 = !DILocation(line: 460, column: 23, scope: !749)
!749 = distinct !DILexicalBlock(scope: !745, file: !72, line: 460, column: 17)
!750 = !DILocation(line: 460, column: 21, scope: !749)
!751 = !DILocation(line: 460, column: 28, scope: !752)
!752 = distinct !DILexicalBlock(scope: !749, file: !72, line: 460, column: 17)
!753 = !DILocation(line: 460, column: 30, scope: !752)
!754 = !DILocation(line: 460, column: 17, scope: !749)
!755 = !DILocation(line: 462, column: 34, scope: !756)
!756 = distinct !DILexicalBlock(scope: !752, file: !72, line: 461, column: 17)
!757 = !DILocation(line: 462, column: 41, scope: !756)
!758 = !DILocation(line: 462, column: 21, scope: !756)
!759 = !DILocation(line: 463, column: 17, scope: !756)
!760 = !DILocation(line: 460, column: 37, scope: !752)
!761 = !DILocation(line: 460, column: 17, scope: !752)
!762 = distinct !{!762, !754, !763, !230}
!763 = !DILocation(line: 463, column: 17, scope: !749)
!764 = !DILocation(line: 464, column: 13, scope: !745)
!765 = !DILocation(line: 467, column: 17, scope: !766)
!766 = distinct !DILexicalBlock(scope: !741, file: !72, line: 466, column: 13)
!767 = !DILocation(line: 469, column: 18, scope: !711)
!768 = !DILocation(line: 469, column: 13, scope: !711)
!769 = !DILocation(line: 471, column: 5, scope: !712)
!770 = !DILocation(line: 472, column: 1, scope: !697)
