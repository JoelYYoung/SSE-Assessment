; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_09.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_09_bad() #0 !dbg !68 {
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
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !76
  %tobool = icmp ne i32 %0, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.end22, !dbg !78

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !79, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !83, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %connectSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  br label %do.body, !dbg !110

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !111
  store i32 %call, i32* %connectSocket, align 4, !dbg !113
  %1 = load i32, i32* %connectSocket, align 4, !dbg !114
  %cmp = icmp eq i32 %1, -1, !dbg !116
  br i1 %cmp, label %if.then1, label %if.end, !dbg !117

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !118

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !120
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !121
  store i16 2, i16* %sin_family, align 4, !dbg !122
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !123
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !124
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !125
  store i32 %call2, i32* %s_addr, align 4, !dbg !126
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !127
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !128
  store i16 %call3, i16* %sin_port, align 2, !dbg !129
  %3 = load i32, i32* %connectSocket, align 4, !dbg !130
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !132
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !133
  %cmp5 = icmp eq i32 %call4, -1, !dbg !134
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !135

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !136

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !138
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !139
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !140
  %conv = trunc i64 %call8 to i32, !dbg !140
  store i32 %conv, i32* %recvResult, align 4, !dbg !141
  %6 = load i32, i32* %recvResult, align 4, !dbg !142
  %cmp9 = icmp eq i32 %6, -1, !dbg !144
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !145

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !146
  %cmp11 = icmp eq i32 %7, 0, !dbg !147
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !148

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !149

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !151
  %idxprom = sext i32 %8 to i64, !dbg !152
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !153
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !154
  %call16 = call i32 @atoi(i8* %arraydecay15) #10, !dbg !155
  store i32 %call16, i32* %data, align 4, !dbg !156
  br label %do.end, !dbg !157

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !158
  %cmp17 = icmp ne i32 %9, -1, !dbg !160
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !161

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !162
  %call20 = call i32 @close(i32 %10), !dbg !164
  br label %if.end21, !dbg !165

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !166

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !167
  %tobool23 = icmp ne i32 %11, 0, !dbg !167
  br i1 %tobool23, label %if.then24, label %if.end49, !dbg !169

if.then24:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !170, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !174, metadata !DIExpression()), !dbg !175
  %call25 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !176
  %12 = bitcast i8* %call25 to i32*, !dbg !177
  store i32* %12, i32** %buffer, align 8, !dbg !175
  %13 = load i32*, i32** %buffer, align 8, !dbg !178
  %cmp26 = icmp eq i32* %13, null, !dbg !180
  br i1 %cmp26, label %if.then28, label %if.end29, !dbg !181

if.then28:                                        ; preds = %if.then24
  call void @exit(i32 -1) #11, !dbg !182
  unreachable, !dbg !182

if.end29:                                         ; preds = %if.then24
  store i32 0, i32* %i, align 4, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end29
  %14 = load i32, i32* %i, align 4, !dbg !187
  %cmp30 = icmp slt i32 %14, 10, !dbg !189
  br i1 %cmp30, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !191
  %16 = load i32, i32* %i, align 4, !dbg !193
  %idxprom32 = sext i32 %16 to i64, !dbg !191
  %arrayidx33 = getelementptr inbounds i32, i32* %15, i64 %idxprom32, !dbg !191
  store i32 0, i32* %arrayidx33, align 4, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !196
  %inc = add nsw i32 %17, 1, !dbg !196
  store i32 %inc, i32* %i, align 4, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !201
  %cmp34 = icmp sge i32 %18, 0, !dbg !203
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !204

if.then36:                                        ; preds = %for.end
  %19 = load i32*, i32** %buffer, align 8, !dbg !205
  %20 = load i32, i32* %data, align 4, !dbg !207
  %idxprom37 = sext i32 %20 to i64, !dbg !205
  %arrayidx38 = getelementptr inbounds i32, i32* %19, i64 %idxprom37, !dbg !205
  store i32 1, i32* %arrayidx38, align 4, !dbg !208
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond39, !dbg !211

for.cond39:                                       ; preds = %for.inc45, %if.then36
  %21 = load i32, i32* %i, align 4, !dbg !212
  %cmp40 = icmp slt i32 %21, 10, !dbg !214
  br i1 %cmp40, label %for.body42, label %for.end47, !dbg !215

for.body42:                                       ; preds = %for.cond39
  %22 = load i32*, i32** %buffer, align 8, !dbg !216
  %23 = load i32, i32* %i, align 4, !dbg !218
  %idxprom43 = sext i32 %23 to i64, !dbg !216
  %arrayidx44 = getelementptr inbounds i32, i32* %22, i64 %idxprom43, !dbg !216
  %24 = load i32, i32* %arrayidx44, align 4, !dbg !216
  call void @printIntLine(i32 %24), !dbg !219
  br label %for.inc45, !dbg !220

for.inc45:                                        ; preds = %for.body42
  %25 = load i32, i32* %i, align 4, !dbg !221
  %inc46 = add nsw i32 %25, 1, !dbg !221
  store i32 %inc46, i32* %i, align 4, !dbg !221
  br label %for.cond39, !dbg !222, !llvm.loop !223

for.end47:                                        ; preds = %for.cond39
  br label %if.end48, !dbg !225

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !226
  br label %if.end48

if.end48:                                         ; preds = %if.else, %for.end47
  %26 = load i32*, i32** %buffer, align 8, !dbg !228
  %27 = bitcast i32* %26 to i8*, !dbg !228
  call void @free(i8* %27) #8, !dbg !229
  br label %if.end49, !dbg !230

if.end49:                                         ; preds = %if.end48, %if.end22
  ret void, !dbg !231
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_09_good() #0 !dbg !232 {
entry:
  call void @goodB2G1(), !dbg !233
  call void @goodB2G2(), !dbg !234
  call void @goodG2B1(), !dbg !235
  call void @goodG2B2(), !dbg !236
  ret void, !dbg !237
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !238 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !243, metadata !DIExpression()), !dbg !244
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !245, metadata !DIExpression()), !dbg !246
  %call = call i64 @time(i64* null) #8, !dbg !247
  %conv = trunc i64 %call to i32, !dbg !248
  call void @srand(i32 %conv) #8, !dbg !249
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !250
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_09_good(), !dbg !251
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !252
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !253
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_09_bad(), !dbg !254
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !255
  ret i32 0, !dbg !256
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !257 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !258, metadata !DIExpression()), !dbg !259
  store i32 -1, i32* %data, align 4, !dbg !260
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !261
  %tobool = icmp ne i32 %0, 0, !dbg !261
  br i1 %tobool, label %if.then, label %if.end22, !dbg !263

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !264, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !268, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !270, metadata !DIExpression()), !dbg !271
  store i32 -1, i32* %connectSocket, align 4, !dbg !271
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !272, metadata !DIExpression()), !dbg !273
  br label %do.body, !dbg !274

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !275
  store i32 %call, i32* %connectSocket, align 4, !dbg !277
  %1 = load i32, i32* %connectSocket, align 4, !dbg !278
  %cmp = icmp eq i32 %1, -1, !dbg !280
  br i1 %cmp, label %if.then1, label %if.end, !dbg !281

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !282

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !284
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !284
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !285
  store i16 2, i16* %sin_family, align 4, !dbg !286
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !287
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !288
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !289
  store i32 %call2, i32* %s_addr, align 4, !dbg !290
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !291
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !292
  store i16 %call3, i16* %sin_port, align 2, !dbg !293
  %3 = load i32, i32* %connectSocket, align 4, !dbg !294
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !296
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !297
  %cmp5 = icmp eq i32 %call4, -1, !dbg !298
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !299

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !300

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !302
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !303
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !304
  %conv = trunc i64 %call8 to i32, !dbg !304
  store i32 %conv, i32* %recvResult, align 4, !dbg !305
  %6 = load i32, i32* %recvResult, align 4, !dbg !306
  %cmp9 = icmp eq i32 %6, -1, !dbg !308
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !309

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !310
  %cmp11 = icmp eq i32 %7, 0, !dbg !311
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !312

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !313

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !315
  %idxprom = sext i32 %8 to i64, !dbg !316
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !316
  store i8 0, i8* %arrayidx, align 1, !dbg !317
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !318
  %call16 = call i32 @atoi(i8* %arraydecay15) #10, !dbg !319
  store i32 %call16, i32* %data, align 4, !dbg !320
  br label %do.end, !dbg !321

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !322
  %cmp17 = icmp ne i32 %9, -1, !dbg !324
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !325

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !326
  %call20 = call i32 @close(i32 %10), !dbg !328
  br label %if.end21, !dbg !329

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !330

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !331
  %tobool23 = icmp ne i32 %11, 0, !dbg !331
  br i1 %tobool23, label %if.then24, label %if.else, !dbg !333

if.then24:                                        ; preds = %if.end22
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !334
  br label %if.end52, !dbg !336

if.else:                                          ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !337, metadata !DIExpression()), !dbg !340
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !341, metadata !DIExpression()), !dbg !342
  %call25 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !343
  %12 = bitcast i8* %call25 to i32*, !dbg !344
  store i32* %12, i32** %buffer, align 8, !dbg !342
  %13 = load i32*, i32** %buffer, align 8, !dbg !345
  %cmp26 = icmp eq i32* %13, null, !dbg !347
  br i1 %cmp26, label %if.then28, label %if.end29, !dbg !348

if.then28:                                        ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !349
  unreachable, !dbg !349

if.end29:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !351
  br label %for.cond, !dbg !353

for.cond:                                         ; preds = %for.inc, %if.end29
  %14 = load i32, i32* %i, align 4, !dbg !354
  %cmp30 = icmp slt i32 %14, 10, !dbg !356
  br i1 %cmp30, label %for.body, label %for.end, !dbg !357

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !358
  %16 = load i32, i32* %i, align 4, !dbg !360
  %idxprom32 = sext i32 %16 to i64, !dbg !358
  %arrayidx33 = getelementptr inbounds i32, i32* %15, i64 %idxprom32, !dbg !358
  store i32 0, i32* %arrayidx33, align 4, !dbg !361
  br label %for.inc, !dbg !362

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !363
  %inc = add nsw i32 %17, 1, !dbg !363
  store i32 %inc, i32* %i, align 4, !dbg !363
  br label %for.cond, !dbg !364, !llvm.loop !365

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !367
  %cmp34 = icmp sge i32 %18, 0, !dbg !369
  br i1 %cmp34, label %land.lhs.true, label %if.else50, !dbg !370

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* %data, align 4, !dbg !371
  %cmp36 = icmp slt i32 %19, 10, !dbg !372
  br i1 %cmp36, label %if.then38, label %if.else50, !dbg !373

if.then38:                                        ; preds = %land.lhs.true
  %20 = load i32*, i32** %buffer, align 8, !dbg !374
  %21 = load i32, i32* %data, align 4, !dbg !376
  %idxprom39 = sext i32 %21 to i64, !dbg !374
  %arrayidx40 = getelementptr inbounds i32, i32* %20, i64 %idxprom39, !dbg !374
  store i32 1, i32* %arrayidx40, align 4, !dbg !377
  store i32 0, i32* %i, align 4, !dbg !378
  br label %for.cond41, !dbg !380

for.cond41:                                       ; preds = %for.inc47, %if.then38
  %22 = load i32, i32* %i, align 4, !dbg !381
  %cmp42 = icmp slt i32 %22, 10, !dbg !383
  br i1 %cmp42, label %for.body44, label %for.end49, !dbg !384

for.body44:                                       ; preds = %for.cond41
  %23 = load i32*, i32** %buffer, align 8, !dbg !385
  %24 = load i32, i32* %i, align 4, !dbg !387
  %idxprom45 = sext i32 %24 to i64, !dbg !385
  %arrayidx46 = getelementptr inbounds i32, i32* %23, i64 %idxprom45, !dbg !385
  %25 = load i32, i32* %arrayidx46, align 4, !dbg !385
  call void @printIntLine(i32 %25), !dbg !388
  br label %for.inc47, !dbg !389

for.inc47:                                        ; preds = %for.body44
  %26 = load i32, i32* %i, align 4, !dbg !390
  %inc48 = add nsw i32 %26, 1, !dbg !390
  store i32 %inc48, i32* %i, align 4, !dbg !390
  br label %for.cond41, !dbg !391, !llvm.loop !392

for.end49:                                        ; preds = %for.cond41
  br label %if.end51, !dbg !394

if.else50:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !395
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %for.end49
  %27 = load i32*, i32** %buffer, align 8, !dbg !397
  %28 = bitcast i32* %27 to i8*, !dbg !397
  call void @free(i8* %28) #8, !dbg !398
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then24
  ret void, !dbg !399
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !400 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !401, metadata !DIExpression()), !dbg !402
  store i32 -1, i32* %data, align 4, !dbg !403
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !404
  %tobool = icmp ne i32 %0, 0, !dbg !404
  br i1 %tobool, label %if.then, label %if.end22, !dbg !406

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !407, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !411, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !413, metadata !DIExpression()), !dbg !414
  store i32 -1, i32* %connectSocket, align 4, !dbg !414
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !415, metadata !DIExpression()), !dbg !416
  br label %do.body, !dbg !417

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !418
  store i32 %call, i32* %connectSocket, align 4, !dbg !420
  %1 = load i32, i32* %connectSocket, align 4, !dbg !421
  %cmp = icmp eq i32 %1, -1, !dbg !423
  br i1 %cmp, label %if.then1, label %if.end, !dbg !424

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !425

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !427
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !427
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !428
  store i16 2, i16* %sin_family, align 4, !dbg !429
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !430
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !431
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !432
  store i32 %call2, i32* %s_addr, align 4, !dbg !433
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !434
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !435
  store i16 %call3, i16* %sin_port, align 2, !dbg !436
  %3 = load i32, i32* %connectSocket, align 4, !dbg !437
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !439
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !440
  %cmp5 = icmp eq i32 %call4, -1, !dbg !441
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !442

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !443

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !445
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !446
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !447
  %conv = trunc i64 %call8 to i32, !dbg !447
  store i32 %conv, i32* %recvResult, align 4, !dbg !448
  %6 = load i32, i32* %recvResult, align 4, !dbg !449
  %cmp9 = icmp eq i32 %6, -1, !dbg !451
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !452

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !453
  %cmp11 = icmp eq i32 %7, 0, !dbg !454
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !455

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !456

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !458
  %idxprom = sext i32 %8 to i64, !dbg !459
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !459
  store i8 0, i8* %arrayidx, align 1, !dbg !460
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !461
  %call16 = call i32 @atoi(i8* %arraydecay15) #10, !dbg !462
  store i32 %call16, i32* %data, align 4, !dbg !463
  br label %do.end, !dbg !464

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !465
  %cmp17 = icmp ne i32 %9, -1, !dbg !467
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !468

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !469
  %call20 = call i32 @close(i32 %10), !dbg !471
  br label %if.end21, !dbg !472

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !473

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !474
  %tobool23 = icmp ne i32 %11, 0, !dbg !474
  br i1 %tobool23, label %if.then24, label %if.end51, !dbg !476

if.then24:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !477, metadata !DIExpression()), !dbg !480
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !481, metadata !DIExpression()), !dbg !482
  %call25 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !483
  %12 = bitcast i8* %call25 to i32*, !dbg !484
  store i32* %12, i32** %buffer, align 8, !dbg !482
  %13 = load i32*, i32** %buffer, align 8, !dbg !485
  %cmp26 = icmp eq i32* %13, null, !dbg !487
  br i1 %cmp26, label %if.then28, label %if.end29, !dbg !488

if.then28:                                        ; preds = %if.then24
  call void @exit(i32 -1) #11, !dbg !489
  unreachable, !dbg !489

if.end29:                                         ; preds = %if.then24
  store i32 0, i32* %i, align 4, !dbg !491
  br label %for.cond, !dbg !493

for.cond:                                         ; preds = %for.inc, %if.end29
  %14 = load i32, i32* %i, align 4, !dbg !494
  %cmp30 = icmp slt i32 %14, 10, !dbg !496
  br i1 %cmp30, label %for.body, label %for.end, !dbg !497

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !498
  %16 = load i32, i32* %i, align 4, !dbg !500
  %idxprom32 = sext i32 %16 to i64, !dbg !498
  %arrayidx33 = getelementptr inbounds i32, i32* %15, i64 %idxprom32, !dbg !498
  store i32 0, i32* %arrayidx33, align 4, !dbg !501
  br label %for.inc, !dbg !502

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !503
  %inc = add nsw i32 %17, 1, !dbg !503
  store i32 %inc, i32* %i, align 4, !dbg !503
  br label %for.cond, !dbg !504, !llvm.loop !505

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !507
  %cmp34 = icmp sge i32 %18, 0, !dbg !509
  br i1 %cmp34, label %land.lhs.true, label %if.else, !dbg !510

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* %data, align 4, !dbg !511
  %cmp36 = icmp slt i32 %19, 10, !dbg !512
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !513

if.then38:                                        ; preds = %land.lhs.true
  %20 = load i32*, i32** %buffer, align 8, !dbg !514
  %21 = load i32, i32* %data, align 4, !dbg !516
  %idxprom39 = sext i32 %21 to i64, !dbg !514
  %arrayidx40 = getelementptr inbounds i32, i32* %20, i64 %idxprom39, !dbg !514
  store i32 1, i32* %arrayidx40, align 4, !dbg !517
  store i32 0, i32* %i, align 4, !dbg !518
  br label %for.cond41, !dbg !520

for.cond41:                                       ; preds = %for.inc47, %if.then38
  %22 = load i32, i32* %i, align 4, !dbg !521
  %cmp42 = icmp slt i32 %22, 10, !dbg !523
  br i1 %cmp42, label %for.body44, label %for.end49, !dbg !524

for.body44:                                       ; preds = %for.cond41
  %23 = load i32*, i32** %buffer, align 8, !dbg !525
  %24 = load i32, i32* %i, align 4, !dbg !527
  %idxprom45 = sext i32 %24 to i64, !dbg !525
  %arrayidx46 = getelementptr inbounds i32, i32* %23, i64 %idxprom45, !dbg !525
  %25 = load i32, i32* %arrayidx46, align 4, !dbg !525
  call void @printIntLine(i32 %25), !dbg !528
  br label %for.inc47, !dbg !529

for.inc47:                                        ; preds = %for.body44
  %26 = load i32, i32* %i, align 4, !dbg !530
  %inc48 = add nsw i32 %26, 1, !dbg !530
  store i32 %inc48, i32* %i, align 4, !dbg !530
  br label %for.cond41, !dbg !531, !llvm.loop !532

for.end49:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !534

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !535
  br label %if.end50

if.end50:                                         ; preds = %if.else, %for.end49
  %27 = load i32*, i32** %buffer, align 8, !dbg !537
  %28 = bitcast i32* %27 to i8*, !dbg !537
  call void @free(i8* %28) #8, !dbg !538
  br label %if.end51, !dbg !539

if.end51:                                         ; preds = %if.end50, %if.end22
  ret void, !dbg !540
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !541 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !542, metadata !DIExpression()), !dbg !543
  store i32 -1, i32* %data, align 4, !dbg !544
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !545
  %tobool = icmp ne i32 %0, 0, !dbg !545
  br i1 %tobool, label %if.then, label %if.else, !dbg !547

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !548
  br label %if.end, !dbg !550

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !551
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !553
  %tobool1 = icmp ne i32 %1, 0, !dbg !553
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !555

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !556, metadata !DIExpression()), !dbg !559
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !560, metadata !DIExpression()), !dbg !561
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !562
  %2 = bitcast i8* %call to i32*, !dbg !563
  store i32* %2, i32** %buffer, align 8, !dbg !561
  %3 = load i32*, i32** %buffer, align 8, !dbg !564
  %cmp = icmp eq i32* %3, null, !dbg !566
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !567

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !568
  unreachable, !dbg !568

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !570
  br label %for.cond, !dbg !572

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !573
  %cmp5 = icmp slt i32 %4, 10, !dbg !575
  br i1 %cmp5, label %for.body, label %for.end, !dbg !576

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !577
  %6 = load i32, i32* %i, align 4, !dbg !579
  %idxprom = sext i32 %6 to i64, !dbg !577
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !577
  store i32 0, i32* %arrayidx, align 4, !dbg !580
  br label %for.inc, !dbg !581

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !582
  %inc = add nsw i32 %7, 1, !dbg !582
  store i32 %inc, i32* %i, align 4, !dbg !582
  br label %for.cond, !dbg !583, !llvm.loop !584

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !586
  %cmp6 = icmp sge i32 %8, 0, !dbg !588
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !589

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !590
  %10 = load i32, i32* %data, align 4, !dbg !592
  %idxprom8 = sext i32 %10 to i64, !dbg !590
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !590
  store i32 1, i32* %arrayidx9, align 4, !dbg !593
  store i32 0, i32* %i, align 4, !dbg !594
  br label %for.cond10, !dbg !596

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !597
  %cmp11 = icmp slt i32 %11, 10, !dbg !599
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !600

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !601
  %13 = load i32, i32* %i, align 4, !dbg !603
  %idxprom13 = sext i32 %13 to i64, !dbg !601
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !601
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !601
  call void @printIntLine(i32 %14), !dbg !604
  br label %for.inc15, !dbg !605

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !606
  %inc16 = add nsw i32 %15, 1, !dbg !606
  store i32 %inc16, i32* %i, align 4, !dbg !606
  br label %for.cond10, !dbg !607, !llvm.loop !608

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !610

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !611
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !613
  %17 = bitcast i32* %16 to i8*, !dbg !613
  call void @free(i8* %17) #8, !dbg !614
  br label %if.end20, !dbg !615

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !616
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !617 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !618, metadata !DIExpression()), !dbg !619
  store i32 -1, i32* %data, align 4, !dbg !620
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !621
  %tobool = icmp ne i32 %0, 0, !dbg !621
  br i1 %tobool, label %if.then, label %if.end, !dbg !623

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !624
  br label %if.end, !dbg !626

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !627
  %tobool1 = icmp ne i32 %1, 0, !dbg !627
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !629

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !630, metadata !DIExpression()), !dbg !633
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !634, metadata !DIExpression()), !dbg !635
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !636
  %2 = bitcast i8* %call to i32*, !dbg !637
  store i32* %2, i32** %buffer, align 8, !dbg !635
  %3 = load i32*, i32** %buffer, align 8, !dbg !638
  %cmp = icmp eq i32* %3, null, !dbg !640
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !641

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !642
  unreachable, !dbg !642

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !644
  br label %for.cond, !dbg !646

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !647
  %cmp5 = icmp slt i32 %4, 10, !dbg !649
  br i1 %cmp5, label %for.body, label %for.end, !dbg !650

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !651
  %6 = load i32, i32* %i, align 4, !dbg !653
  %idxprom = sext i32 %6 to i64, !dbg !651
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !651
  store i32 0, i32* %arrayidx, align 4, !dbg !654
  br label %for.inc, !dbg !655

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !656
  %inc = add nsw i32 %7, 1, !dbg !656
  store i32 %inc, i32* %i, align 4, !dbg !656
  br label %for.cond, !dbg !657, !llvm.loop !658

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !660
  %cmp6 = icmp sge i32 %8, 0, !dbg !662
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !663

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !664
  %10 = load i32, i32* %data, align 4, !dbg !666
  %idxprom8 = sext i32 %10 to i64, !dbg !664
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !664
  store i32 1, i32* %arrayidx9, align 4, !dbg !667
  store i32 0, i32* %i, align 4, !dbg !668
  br label %for.cond10, !dbg !670

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !671
  %cmp11 = icmp slt i32 %11, 10, !dbg !673
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !674

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !675
  %13 = load i32, i32* %i, align 4, !dbg !677
  %idxprom13 = sext i32 %13 to i64, !dbg !675
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !675
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !675
  call void @printIntLine(i32 %14), !dbg !678
  br label %for.inc15, !dbg !679

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !680
  %inc16 = add nsw i32 %15, 1, !dbg !680
  store i32 %inc16, i32* %i, align 4, !dbg !680
  br label %for.cond10, !dbg !681, !llvm.loop !682

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !684

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !685
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !687
  %17 = bitcast i32* %16 to i8*, !dbg !687
  call void @free(i8* %17) #8, !dbg !688
  br label %if.end19, !dbg !689

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !690
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_09.c", directory: "/root/SSE-Assessment")
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_09_bad", scope: !69, file: !69, line: 44, type: !70, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_09.c", directory: "/root/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 46, type: !60)
!74 = !DILocation(line: 46, column: 9, scope: !68)
!75 = !DILocation(line: 48, column: 10, scope: !68)
!76 = !DILocation(line: 49, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !68, file: !69, line: 49, column: 8)
!78 = !DILocation(line: 49, column: 8, scope: !68)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !69, line: 56, type: !60)
!80 = distinct !DILexicalBlock(scope: !81, file: !69, line: 51, column: 9)
!81 = distinct !DILexicalBlock(scope: !77, file: !69, line: 50, column: 5)
!82 = !DILocation(line: 56, column: 17, scope: !80)
!83 = !DILocalVariable(name: "service", scope: !80, file: !69, line: 57, type: !84)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !85)
!85 = !{!86, !87, !93, !100}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !84, file: !17, line: 239, baseType: !51, size: 16)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !84, file: !17, line: 240, baseType: !88, size: 16, offset: 16)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !90, line: 25, baseType: !91)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !92, line: 39, baseType: !53)
!92 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !84, file: !17, line: 241, baseType: !94, size: 32, offset: 32)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !95)
!95 = !{!96}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !94, file: !17, line: 33, baseType: !97, size: 32)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !90, line: 26, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !92, line: 41, baseType: !5)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !84, file: !17, line: 244, baseType: !101, size: 64, offset: 64)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 64, elements: !103)
!102 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!103 = !{!104}
!104 = !DISubrange(count: 8)
!105 = !DILocation(line: 57, column: 32, scope: !80)
!106 = !DILocalVariable(name: "connectSocket", scope: !80, file: !69, line: 58, type: !60)
!107 = !DILocation(line: 58, column: 20, scope: !80)
!108 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !69, line: 59, type: !55)
!109 = !DILocation(line: 59, column: 18, scope: !80)
!110 = !DILocation(line: 60, column: 13, scope: !80)
!111 = !DILocation(line: 70, column: 33, scope: !112)
!112 = distinct !DILexicalBlock(scope: !80, file: !69, line: 61, column: 13)
!113 = !DILocation(line: 70, column: 31, scope: !112)
!114 = !DILocation(line: 71, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !69, line: 71, column: 21)
!116 = !DILocation(line: 71, column: 35, scope: !115)
!117 = !DILocation(line: 71, column: 21, scope: !112)
!118 = !DILocation(line: 73, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !69, line: 72, column: 17)
!120 = !DILocation(line: 75, column: 17, scope: !112)
!121 = !DILocation(line: 76, column: 25, scope: !112)
!122 = !DILocation(line: 76, column: 36, scope: !112)
!123 = !DILocation(line: 77, column: 43, scope: !112)
!124 = !DILocation(line: 77, column: 25, scope: !112)
!125 = !DILocation(line: 77, column: 34, scope: !112)
!126 = !DILocation(line: 77, column: 41, scope: !112)
!127 = !DILocation(line: 78, column: 36, scope: !112)
!128 = !DILocation(line: 78, column: 25, scope: !112)
!129 = !DILocation(line: 78, column: 34, scope: !112)
!130 = !DILocation(line: 79, column: 29, scope: !131)
!131 = distinct !DILexicalBlock(scope: !112, file: !69, line: 79, column: 21)
!132 = !DILocation(line: 79, column: 44, scope: !131)
!133 = !DILocation(line: 79, column: 21, scope: !131)
!134 = !DILocation(line: 79, column: 89, scope: !131)
!135 = !DILocation(line: 79, column: 21, scope: !112)
!136 = !DILocation(line: 81, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !69, line: 80, column: 17)
!138 = !DILocation(line: 85, column: 35, scope: !112)
!139 = !DILocation(line: 85, column: 50, scope: !112)
!140 = !DILocation(line: 85, column: 30, scope: !112)
!141 = !DILocation(line: 85, column: 28, scope: !112)
!142 = !DILocation(line: 86, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !112, file: !69, line: 86, column: 21)
!144 = !DILocation(line: 86, column: 32, scope: !143)
!145 = !DILocation(line: 86, column: 48, scope: !143)
!146 = !DILocation(line: 86, column: 51, scope: !143)
!147 = !DILocation(line: 86, column: 62, scope: !143)
!148 = !DILocation(line: 86, column: 21, scope: !112)
!149 = !DILocation(line: 88, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !69, line: 87, column: 17)
!151 = !DILocation(line: 91, column: 29, scope: !112)
!152 = !DILocation(line: 91, column: 17, scope: !112)
!153 = !DILocation(line: 91, column: 41, scope: !112)
!154 = !DILocation(line: 93, column: 29, scope: !112)
!155 = !DILocation(line: 93, column: 24, scope: !112)
!156 = !DILocation(line: 93, column: 22, scope: !112)
!157 = !DILocation(line: 94, column: 13, scope: !112)
!158 = !DILocation(line: 96, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !80, file: !69, line: 96, column: 17)
!160 = !DILocation(line: 96, column: 31, scope: !159)
!161 = !DILocation(line: 96, column: 17, scope: !80)
!162 = !DILocation(line: 98, column: 30, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !69, line: 97, column: 13)
!164 = !DILocation(line: 98, column: 17, scope: !163)
!165 = !DILocation(line: 99, column: 13, scope: !163)
!166 = !DILocation(line: 107, column: 5, scope: !81)
!167 = !DILocation(line: 108, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !68, file: !69, line: 108, column: 8)
!169 = !DILocation(line: 108, column: 8, scope: !68)
!170 = !DILocalVariable(name: "i", scope: !171, file: !69, line: 111, type: !60)
!171 = distinct !DILexicalBlock(scope: !172, file: !69, line: 110, column: 9)
!172 = distinct !DILexicalBlock(scope: !168, file: !69, line: 109, column: 5)
!173 = !DILocation(line: 111, column: 17, scope: !171)
!174 = !DILocalVariable(name: "buffer", scope: !171, file: !69, line: 112, type: !59)
!175 = !DILocation(line: 112, column: 19, scope: !171)
!176 = !DILocation(line: 112, column: 35, scope: !171)
!177 = !DILocation(line: 112, column: 28, scope: !171)
!178 = !DILocation(line: 113, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !171, file: !69, line: 113, column: 17)
!180 = !DILocation(line: 113, column: 24, scope: !179)
!181 = !DILocation(line: 113, column: 17, scope: !171)
!182 = !DILocation(line: 113, column: 34, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !69, line: 113, column: 33)
!184 = !DILocation(line: 115, column: 20, scope: !185)
!185 = distinct !DILexicalBlock(scope: !171, file: !69, line: 115, column: 13)
!186 = !DILocation(line: 115, column: 18, scope: !185)
!187 = !DILocation(line: 115, column: 25, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !69, line: 115, column: 13)
!189 = !DILocation(line: 115, column: 27, scope: !188)
!190 = !DILocation(line: 115, column: 13, scope: !185)
!191 = !DILocation(line: 117, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !69, line: 116, column: 13)
!193 = !DILocation(line: 117, column: 24, scope: !192)
!194 = !DILocation(line: 117, column: 27, scope: !192)
!195 = !DILocation(line: 118, column: 13, scope: !192)
!196 = !DILocation(line: 115, column: 34, scope: !188)
!197 = !DILocation(line: 115, column: 13, scope: !188)
!198 = distinct !{!198, !190, !199, !200}
!199 = !DILocation(line: 118, column: 13, scope: !185)
!200 = !{!"llvm.loop.mustprogress"}
!201 = !DILocation(line: 121, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !171, file: !69, line: 121, column: 17)
!203 = !DILocation(line: 121, column: 22, scope: !202)
!204 = !DILocation(line: 121, column: 17, scope: !171)
!205 = !DILocation(line: 123, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !69, line: 122, column: 13)
!207 = !DILocation(line: 123, column: 24, scope: !206)
!208 = !DILocation(line: 123, column: 30, scope: !206)
!209 = !DILocation(line: 125, column: 23, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !69, line: 125, column: 17)
!211 = !DILocation(line: 125, column: 21, scope: !210)
!212 = !DILocation(line: 125, column: 28, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !69, line: 125, column: 17)
!214 = !DILocation(line: 125, column: 30, scope: !213)
!215 = !DILocation(line: 125, column: 17, scope: !210)
!216 = !DILocation(line: 127, column: 34, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !69, line: 126, column: 17)
!218 = !DILocation(line: 127, column: 41, scope: !217)
!219 = !DILocation(line: 127, column: 21, scope: !217)
!220 = !DILocation(line: 128, column: 17, scope: !217)
!221 = !DILocation(line: 125, column: 37, scope: !213)
!222 = !DILocation(line: 125, column: 17, scope: !213)
!223 = distinct !{!223, !215, !224, !200}
!224 = !DILocation(line: 128, column: 17, scope: !210)
!225 = !DILocation(line: 129, column: 13, scope: !206)
!226 = !DILocation(line: 132, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !202, file: !69, line: 131, column: 13)
!228 = !DILocation(line: 134, column: 18, scope: !171)
!229 = !DILocation(line: 134, column: 13, scope: !171)
!230 = !DILocation(line: 136, column: 5, scope: !172)
!231 = !DILocation(line: 137, column: 1, scope: !68)
!232 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_09_good", scope: !69, file: !69, line: 429, type: !70, scopeLine: 430, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!233 = !DILocation(line: 431, column: 5, scope: !232)
!234 = !DILocation(line: 432, column: 5, scope: !232)
!235 = !DILocation(line: 433, column: 5, scope: !232)
!236 = !DILocation(line: 434, column: 5, scope: !232)
!237 = !DILocation(line: 435, column: 1, scope: !232)
!238 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 446, type: !239, scopeLine: 447, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!239 = !DISubroutineType(types: !240)
!240 = !{!60, !60, !241}
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!243 = !DILocalVariable(name: "argc", arg: 1, scope: !238, file: !69, line: 446, type: !60)
!244 = !DILocation(line: 446, column: 14, scope: !238)
!245 = !DILocalVariable(name: "argv", arg: 2, scope: !238, file: !69, line: 446, type: !241)
!246 = !DILocation(line: 446, column: 27, scope: !238)
!247 = !DILocation(line: 449, column: 22, scope: !238)
!248 = !DILocation(line: 449, column: 12, scope: !238)
!249 = !DILocation(line: 449, column: 5, scope: !238)
!250 = !DILocation(line: 451, column: 5, scope: !238)
!251 = !DILocation(line: 452, column: 5, scope: !238)
!252 = !DILocation(line: 453, column: 5, scope: !238)
!253 = !DILocation(line: 456, column: 5, scope: !238)
!254 = !DILocation(line: 457, column: 5, scope: !238)
!255 = !DILocation(line: 458, column: 5, scope: !238)
!256 = !DILocation(line: 460, column: 5, scope: !238)
!257 = distinct !DISubprogram(name: "goodB2G1", scope: !69, file: !69, line: 144, type: !70, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!258 = !DILocalVariable(name: "data", scope: !257, file: !69, line: 146, type: !60)
!259 = !DILocation(line: 146, column: 9, scope: !257)
!260 = !DILocation(line: 148, column: 10, scope: !257)
!261 = !DILocation(line: 149, column: 8, scope: !262)
!262 = distinct !DILexicalBlock(scope: !257, file: !69, line: 149, column: 8)
!263 = !DILocation(line: 149, column: 8, scope: !257)
!264 = !DILocalVariable(name: "recvResult", scope: !265, file: !69, line: 156, type: !60)
!265 = distinct !DILexicalBlock(scope: !266, file: !69, line: 151, column: 9)
!266 = distinct !DILexicalBlock(scope: !262, file: !69, line: 150, column: 5)
!267 = !DILocation(line: 156, column: 17, scope: !265)
!268 = !DILocalVariable(name: "service", scope: !265, file: !69, line: 157, type: !84)
!269 = !DILocation(line: 157, column: 32, scope: !265)
!270 = !DILocalVariable(name: "connectSocket", scope: !265, file: !69, line: 158, type: !60)
!271 = !DILocation(line: 158, column: 20, scope: !265)
!272 = !DILocalVariable(name: "inputBuffer", scope: !265, file: !69, line: 159, type: !55)
!273 = !DILocation(line: 159, column: 18, scope: !265)
!274 = !DILocation(line: 160, column: 13, scope: !265)
!275 = !DILocation(line: 170, column: 33, scope: !276)
!276 = distinct !DILexicalBlock(scope: !265, file: !69, line: 161, column: 13)
!277 = !DILocation(line: 170, column: 31, scope: !276)
!278 = !DILocation(line: 171, column: 21, scope: !279)
!279 = distinct !DILexicalBlock(scope: !276, file: !69, line: 171, column: 21)
!280 = !DILocation(line: 171, column: 35, scope: !279)
!281 = !DILocation(line: 171, column: 21, scope: !276)
!282 = !DILocation(line: 173, column: 21, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !69, line: 172, column: 17)
!284 = !DILocation(line: 175, column: 17, scope: !276)
!285 = !DILocation(line: 176, column: 25, scope: !276)
!286 = !DILocation(line: 176, column: 36, scope: !276)
!287 = !DILocation(line: 177, column: 43, scope: !276)
!288 = !DILocation(line: 177, column: 25, scope: !276)
!289 = !DILocation(line: 177, column: 34, scope: !276)
!290 = !DILocation(line: 177, column: 41, scope: !276)
!291 = !DILocation(line: 178, column: 36, scope: !276)
!292 = !DILocation(line: 178, column: 25, scope: !276)
!293 = !DILocation(line: 178, column: 34, scope: !276)
!294 = !DILocation(line: 179, column: 29, scope: !295)
!295 = distinct !DILexicalBlock(scope: !276, file: !69, line: 179, column: 21)
!296 = !DILocation(line: 179, column: 44, scope: !295)
!297 = !DILocation(line: 179, column: 21, scope: !295)
!298 = !DILocation(line: 179, column: 89, scope: !295)
!299 = !DILocation(line: 179, column: 21, scope: !276)
!300 = !DILocation(line: 181, column: 21, scope: !301)
!301 = distinct !DILexicalBlock(scope: !295, file: !69, line: 180, column: 17)
!302 = !DILocation(line: 185, column: 35, scope: !276)
!303 = !DILocation(line: 185, column: 50, scope: !276)
!304 = !DILocation(line: 185, column: 30, scope: !276)
!305 = !DILocation(line: 185, column: 28, scope: !276)
!306 = !DILocation(line: 186, column: 21, scope: !307)
!307 = distinct !DILexicalBlock(scope: !276, file: !69, line: 186, column: 21)
!308 = !DILocation(line: 186, column: 32, scope: !307)
!309 = !DILocation(line: 186, column: 48, scope: !307)
!310 = !DILocation(line: 186, column: 51, scope: !307)
!311 = !DILocation(line: 186, column: 62, scope: !307)
!312 = !DILocation(line: 186, column: 21, scope: !276)
!313 = !DILocation(line: 188, column: 21, scope: !314)
!314 = distinct !DILexicalBlock(scope: !307, file: !69, line: 187, column: 17)
!315 = !DILocation(line: 191, column: 29, scope: !276)
!316 = !DILocation(line: 191, column: 17, scope: !276)
!317 = !DILocation(line: 191, column: 41, scope: !276)
!318 = !DILocation(line: 193, column: 29, scope: !276)
!319 = !DILocation(line: 193, column: 24, scope: !276)
!320 = !DILocation(line: 193, column: 22, scope: !276)
!321 = !DILocation(line: 194, column: 13, scope: !276)
!322 = !DILocation(line: 196, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !265, file: !69, line: 196, column: 17)
!324 = !DILocation(line: 196, column: 31, scope: !323)
!325 = !DILocation(line: 196, column: 17, scope: !265)
!326 = !DILocation(line: 198, column: 30, scope: !327)
!327 = distinct !DILexicalBlock(scope: !323, file: !69, line: 197, column: 13)
!328 = !DILocation(line: 198, column: 17, scope: !327)
!329 = !DILocation(line: 199, column: 13, scope: !327)
!330 = !DILocation(line: 207, column: 5, scope: !266)
!331 = !DILocation(line: 208, column: 8, scope: !332)
!332 = distinct !DILexicalBlock(scope: !257, file: !69, line: 208, column: 8)
!333 = !DILocation(line: 208, column: 8, scope: !257)
!334 = !DILocation(line: 211, column: 9, scope: !335)
!335 = distinct !DILexicalBlock(scope: !332, file: !69, line: 209, column: 5)
!336 = !DILocation(line: 212, column: 5, scope: !335)
!337 = !DILocalVariable(name: "i", scope: !338, file: !69, line: 216, type: !60)
!338 = distinct !DILexicalBlock(scope: !339, file: !69, line: 215, column: 9)
!339 = distinct !DILexicalBlock(scope: !332, file: !69, line: 214, column: 5)
!340 = !DILocation(line: 216, column: 17, scope: !338)
!341 = !DILocalVariable(name: "buffer", scope: !338, file: !69, line: 217, type: !59)
!342 = !DILocation(line: 217, column: 19, scope: !338)
!343 = !DILocation(line: 217, column: 35, scope: !338)
!344 = !DILocation(line: 217, column: 28, scope: !338)
!345 = !DILocation(line: 218, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !338, file: !69, line: 218, column: 17)
!347 = !DILocation(line: 218, column: 24, scope: !346)
!348 = !DILocation(line: 218, column: 17, scope: !338)
!349 = !DILocation(line: 218, column: 34, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !69, line: 218, column: 33)
!351 = !DILocation(line: 220, column: 20, scope: !352)
!352 = distinct !DILexicalBlock(scope: !338, file: !69, line: 220, column: 13)
!353 = !DILocation(line: 220, column: 18, scope: !352)
!354 = !DILocation(line: 220, column: 25, scope: !355)
!355 = distinct !DILexicalBlock(scope: !352, file: !69, line: 220, column: 13)
!356 = !DILocation(line: 220, column: 27, scope: !355)
!357 = !DILocation(line: 220, column: 13, scope: !352)
!358 = !DILocation(line: 222, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !355, file: !69, line: 221, column: 13)
!360 = !DILocation(line: 222, column: 24, scope: !359)
!361 = !DILocation(line: 222, column: 27, scope: !359)
!362 = !DILocation(line: 223, column: 13, scope: !359)
!363 = !DILocation(line: 220, column: 34, scope: !355)
!364 = !DILocation(line: 220, column: 13, scope: !355)
!365 = distinct !{!365, !357, !366, !200}
!366 = !DILocation(line: 223, column: 13, scope: !352)
!367 = !DILocation(line: 225, column: 17, scope: !368)
!368 = distinct !DILexicalBlock(scope: !338, file: !69, line: 225, column: 17)
!369 = !DILocation(line: 225, column: 22, scope: !368)
!370 = !DILocation(line: 225, column: 27, scope: !368)
!371 = !DILocation(line: 225, column: 30, scope: !368)
!372 = !DILocation(line: 225, column: 35, scope: !368)
!373 = !DILocation(line: 225, column: 17, scope: !338)
!374 = !DILocation(line: 227, column: 17, scope: !375)
!375 = distinct !DILexicalBlock(scope: !368, file: !69, line: 226, column: 13)
!376 = !DILocation(line: 227, column: 24, scope: !375)
!377 = !DILocation(line: 227, column: 30, scope: !375)
!378 = !DILocation(line: 229, column: 23, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !69, line: 229, column: 17)
!380 = !DILocation(line: 229, column: 21, scope: !379)
!381 = !DILocation(line: 229, column: 28, scope: !382)
!382 = distinct !DILexicalBlock(scope: !379, file: !69, line: 229, column: 17)
!383 = !DILocation(line: 229, column: 30, scope: !382)
!384 = !DILocation(line: 229, column: 17, scope: !379)
!385 = !DILocation(line: 231, column: 34, scope: !386)
!386 = distinct !DILexicalBlock(scope: !382, file: !69, line: 230, column: 17)
!387 = !DILocation(line: 231, column: 41, scope: !386)
!388 = !DILocation(line: 231, column: 21, scope: !386)
!389 = !DILocation(line: 232, column: 17, scope: !386)
!390 = !DILocation(line: 229, column: 37, scope: !382)
!391 = !DILocation(line: 229, column: 17, scope: !382)
!392 = distinct !{!392, !384, !393, !200}
!393 = !DILocation(line: 232, column: 17, scope: !379)
!394 = !DILocation(line: 233, column: 13, scope: !375)
!395 = !DILocation(line: 236, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !368, file: !69, line: 235, column: 13)
!397 = !DILocation(line: 238, column: 18, scope: !338)
!398 = !DILocation(line: 238, column: 13, scope: !338)
!399 = !DILocation(line: 241, column: 1, scope: !257)
!400 = distinct !DISubprogram(name: "goodB2G2", scope: !69, file: !69, line: 244, type: !70, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!401 = !DILocalVariable(name: "data", scope: !400, file: !69, line: 246, type: !60)
!402 = !DILocation(line: 246, column: 9, scope: !400)
!403 = !DILocation(line: 248, column: 10, scope: !400)
!404 = !DILocation(line: 249, column: 8, scope: !405)
!405 = distinct !DILexicalBlock(scope: !400, file: !69, line: 249, column: 8)
!406 = !DILocation(line: 249, column: 8, scope: !400)
!407 = !DILocalVariable(name: "recvResult", scope: !408, file: !69, line: 256, type: !60)
!408 = distinct !DILexicalBlock(scope: !409, file: !69, line: 251, column: 9)
!409 = distinct !DILexicalBlock(scope: !405, file: !69, line: 250, column: 5)
!410 = !DILocation(line: 256, column: 17, scope: !408)
!411 = !DILocalVariable(name: "service", scope: !408, file: !69, line: 257, type: !84)
!412 = !DILocation(line: 257, column: 32, scope: !408)
!413 = !DILocalVariable(name: "connectSocket", scope: !408, file: !69, line: 258, type: !60)
!414 = !DILocation(line: 258, column: 20, scope: !408)
!415 = !DILocalVariable(name: "inputBuffer", scope: !408, file: !69, line: 259, type: !55)
!416 = !DILocation(line: 259, column: 18, scope: !408)
!417 = !DILocation(line: 260, column: 13, scope: !408)
!418 = !DILocation(line: 270, column: 33, scope: !419)
!419 = distinct !DILexicalBlock(scope: !408, file: !69, line: 261, column: 13)
!420 = !DILocation(line: 270, column: 31, scope: !419)
!421 = !DILocation(line: 271, column: 21, scope: !422)
!422 = distinct !DILexicalBlock(scope: !419, file: !69, line: 271, column: 21)
!423 = !DILocation(line: 271, column: 35, scope: !422)
!424 = !DILocation(line: 271, column: 21, scope: !419)
!425 = !DILocation(line: 273, column: 21, scope: !426)
!426 = distinct !DILexicalBlock(scope: !422, file: !69, line: 272, column: 17)
!427 = !DILocation(line: 275, column: 17, scope: !419)
!428 = !DILocation(line: 276, column: 25, scope: !419)
!429 = !DILocation(line: 276, column: 36, scope: !419)
!430 = !DILocation(line: 277, column: 43, scope: !419)
!431 = !DILocation(line: 277, column: 25, scope: !419)
!432 = !DILocation(line: 277, column: 34, scope: !419)
!433 = !DILocation(line: 277, column: 41, scope: !419)
!434 = !DILocation(line: 278, column: 36, scope: !419)
!435 = !DILocation(line: 278, column: 25, scope: !419)
!436 = !DILocation(line: 278, column: 34, scope: !419)
!437 = !DILocation(line: 279, column: 29, scope: !438)
!438 = distinct !DILexicalBlock(scope: !419, file: !69, line: 279, column: 21)
!439 = !DILocation(line: 279, column: 44, scope: !438)
!440 = !DILocation(line: 279, column: 21, scope: !438)
!441 = !DILocation(line: 279, column: 89, scope: !438)
!442 = !DILocation(line: 279, column: 21, scope: !419)
!443 = !DILocation(line: 281, column: 21, scope: !444)
!444 = distinct !DILexicalBlock(scope: !438, file: !69, line: 280, column: 17)
!445 = !DILocation(line: 285, column: 35, scope: !419)
!446 = !DILocation(line: 285, column: 50, scope: !419)
!447 = !DILocation(line: 285, column: 30, scope: !419)
!448 = !DILocation(line: 285, column: 28, scope: !419)
!449 = !DILocation(line: 286, column: 21, scope: !450)
!450 = distinct !DILexicalBlock(scope: !419, file: !69, line: 286, column: 21)
!451 = !DILocation(line: 286, column: 32, scope: !450)
!452 = !DILocation(line: 286, column: 48, scope: !450)
!453 = !DILocation(line: 286, column: 51, scope: !450)
!454 = !DILocation(line: 286, column: 62, scope: !450)
!455 = !DILocation(line: 286, column: 21, scope: !419)
!456 = !DILocation(line: 288, column: 21, scope: !457)
!457 = distinct !DILexicalBlock(scope: !450, file: !69, line: 287, column: 17)
!458 = !DILocation(line: 291, column: 29, scope: !419)
!459 = !DILocation(line: 291, column: 17, scope: !419)
!460 = !DILocation(line: 291, column: 41, scope: !419)
!461 = !DILocation(line: 293, column: 29, scope: !419)
!462 = !DILocation(line: 293, column: 24, scope: !419)
!463 = !DILocation(line: 293, column: 22, scope: !419)
!464 = !DILocation(line: 294, column: 13, scope: !419)
!465 = !DILocation(line: 296, column: 17, scope: !466)
!466 = distinct !DILexicalBlock(scope: !408, file: !69, line: 296, column: 17)
!467 = !DILocation(line: 296, column: 31, scope: !466)
!468 = !DILocation(line: 296, column: 17, scope: !408)
!469 = !DILocation(line: 298, column: 30, scope: !470)
!470 = distinct !DILexicalBlock(scope: !466, file: !69, line: 297, column: 13)
!471 = !DILocation(line: 298, column: 17, scope: !470)
!472 = !DILocation(line: 299, column: 13, scope: !470)
!473 = !DILocation(line: 307, column: 5, scope: !409)
!474 = !DILocation(line: 308, column: 8, scope: !475)
!475 = distinct !DILexicalBlock(scope: !400, file: !69, line: 308, column: 8)
!476 = !DILocation(line: 308, column: 8, scope: !400)
!477 = !DILocalVariable(name: "i", scope: !478, file: !69, line: 311, type: !60)
!478 = distinct !DILexicalBlock(scope: !479, file: !69, line: 310, column: 9)
!479 = distinct !DILexicalBlock(scope: !475, file: !69, line: 309, column: 5)
!480 = !DILocation(line: 311, column: 17, scope: !478)
!481 = !DILocalVariable(name: "buffer", scope: !478, file: !69, line: 312, type: !59)
!482 = !DILocation(line: 312, column: 19, scope: !478)
!483 = !DILocation(line: 312, column: 35, scope: !478)
!484 = !DILocation(line: 312, column: 28, scope: !478)
!485 = !DILocation(line: 313, column: 17, scope: !486)
!486 = distinct !DILexicalBlock(scope: !478, file: !69, line: 313, column: 17)
!487 = !DILocation(line: 313, column: 24, scope: !486)
!488 = !DILocation(line: 313, column: 17, scope: !478)
!489 = !DILocation(line: 313, column: 34, scope: !490)
!490 = distinct !DILexicalBlock(scope: !486, file: !69, line: 313, column: 33)
!491 = !DILocation(line: 315, column: 20, scope: !492)
!492 = distinct !DILexicalBlock(scope: !478, file: !69, line: 315, column: 13)
!493 = !DILocation(line: 315, column: 18, scope: !492)
!494 = !DILocation(line: 315, column: 25, scope: !495)
!495 = distinct !DILexicalBlock(scope: !492, file: !69, line: 315, column: 13)
!496 = !DILocation(line: 315, column: 27, scope: !495)
!497 = !DILocation(line: 315, column: 13, scope: !492)
!498 = !DILocation(line: 317, column: 17, scope: !499)
!499 = distinct !DILexicalBlock(scope: !495, file: !69, line: 316, column: 13)
!500 = !DILocation(line: 317, column: 24, scope: !499)
!501 = !DILocation(line: 317, column: 27, scope: !499)
!502 = !DILocation(line: 318, column: 13, scope: !499)
!503 = !DILocation(line: 315, column: 34, scope: !495)
!504 = !DILocation(line: 315, column: 13, scope: !495)
!505 = distinct !{!505, !497, !506, !200}
!506 = !DILocation(line: 318, column: 13, scope: !492)
!507 = !DILocation(line: 320, column: 17, scope: !508)
!508 = distinct !DILexicalBlock(scope: !478, file: !69, line: 320, column: 17)
!509 = !DILocation(line: 320, column: 22, scope: !508)
!510 = !DILocation(line: 320, column: 27, scope: !508)
!511 = !DILocation(line: 320, column: 30, scope: !508)
!512 = !DILocation(line: 320, column: 35, scope: !508)
!513 = !DILocation(line: 320, column: 17, scope: !478)
!514 = !DILocation(line: 322, column: 17, scope: !515)
!515 = distinct !DILexicalBlock(scope: !508, file: !69, line: 321, column: 13)
!516 = !DILocation(line: 322, column: 24, scope: !515)
!517 = !DILocation(line: 322, column: 30, scope: !515)
!518 = !DILocation(line: 324, column: 23, scope: !519)
!519 = distinct !DILexicalBlock(scope: !515, file: !69, line: 324, column: 17)
!520 = !DILocation(line: 324, column: 21, scope: !519)
!521 = !DILocation(line: 324, column: 28, scope: !522)
!522 = distinct !DILexicalBlock(scope: !519, file: !69, line: 324, column: 17)
!523 = !DILocation(line: 324, column: 30, scope: !522)
!524 = !DILocation(line: 324, column: 17, scope: !519)
!525 = !DILocation(line: 326, column: 34, scope: !526)
!526 = distinct !DILexicalBlock(scope: !522, file: !69, line: 325, column: 17)
!527 = !DILocation(line: 326, column: 41, scope: !526)
!528 = !DILocation(line: 326, column: 21, scope: !526)
!529 = !DILocation(line: 327, column: 17, scope: !526)
!530 = !DILocation(line: 324, column: 37, scope: !522)
!531 = !DILocation(line: 324, column: 17, scope: !522)
!532 = distinct !{!532, !524, !533, !200}
!533 = !DILocation(line: 327, column: 17, scope: !519)
!534 = !DILocation(line: 328, column: 13, scope: !515)
!535 = !DILocation(line: 331, column: 17, scope: !536)
!536 = distinct !DILexicalBlock(scope: !508, file: !69, line: 330, column: 13)
!537 = !DILocation(line: 333, column: 18, scope: !478)
!538 = !DILocation(line: 333, column: 13, scope: !478)
!539 = !DILocation(line: 335, column: 5, scope: !479)
!540 = !DILocation(line: 336, column: 1, scope: !400)
!541 = distinct !DISubprogram(name: "goodG2B1", scope: !69, file: !69, line: 339, type: !70, scopeLine: 340, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!542 = !DILocalVariable(name: "data", scope: !541, file: !69, line: 341, type: !60)
!543 = !DILocation(line: 341, column: 9, scope: !541)
!544 = !DILocation(line: 343, column: 10, scope: !541)
!545 = !DILocation(line: 344, column: 8, scope: !546)
!546 = distinct !DILexicalBlock(scope: !541, file: !69, line: 344, column: 8)
!547 = !DILocation(line: 344, column: 8, scope: !541)
!548 = !DILocation(line: 347, column: 9, scope: !549)
!549 = distinct !DILexicalBlock(scope: !546, file: !69, line: 345, column: 5)
!550 = !DILocation(line: 348, column: 5, scope: !549)
!551 = !DILocation(line: 353, column: 14, scope: !552)
!552 = distinct !DILexicalBlock(scope: !546, file: !69, line: 350, column: 5)
!553 = !DILocation(line: 355, column: 8, scope: !554)
!554 = distinct !DILexicalBlock(scope: !541, file: !69, line: 355, column: 8)
!555 = !DILocation(line: 355, column: 8, scope: !541)
!556 = !DILocalVariable(name: "i", scope: !557, file: !69, line: 358, type: !60)
!557 = distinct !DILexicalBlock(scope: !558, file: !69, line: 357, column: 9)
!558 = distinct !DILexicalBlock(scope: !554, file: !69, line: 356, column: 5)
!559 = !DILocation(line: 358, column: 17, scope: !557)
!560 = !DILocalVariable(name: "buffer", scope: !557, file: !69, line: 359, type: !59)
!561 = !DILocation(line: 359, column: 19, scope: !557)
!562 = !DILocation(line: 359, column: 35, scope: !557)
!563 = !DILocation(line: 359, column: 28, scope: !557)
!564 = !DILocation(line: 360, column: 17, scope: !565)
!565 = distinct !DILexicalBlock(scope: !557, file: !69, line: 360, column: 17)
!566 = !DILocation(line: 360, column: 24, scope: !565)
!567 = !DILocation(line: 360, column: 17, scope: !557)
!568 = !DILocation(line: 360, column: 34, scope: !569)
!569 = distinct !DILexicalBlock(scope: !565, file: !69, line: 360, column: 33)
!570 = !DILocation(line: 362, column: 20, scope: !571)
!571 = distinct !DILexicalBlock(scope: !557, file: !69, line: 362, column: 13)
!572 = !DILocation(line: 362, column: 18, scope: !571)
!573 = !DILocation(line: 362, column: 25, scope: !574)
!574 = distinct !DILexicalBlock(scope: !571, file: !69, line: 362, column: 13)
!575 = !DILocation(line: 362, column: 27, scope: !574)
!576 = !DILocation(line: 362, column: 13, scope: !571)
!577 = !DILocation(line: 364, column: 17, scope: !578)
!578 = distinct !DILexicalBlock(scope: !574, file: !69, line: 363, column: 13)
!579 = !DILocation(line: 364, column: 24, scope: !578)
!580 = !DILocation(line: 364, column: 27, scope: !578)
!581 = !DILocation(line: 365, column: 13, scope: !578)
!582 = !DILocation(line: 362, column: 34, scope: !574)
!583 = !DILocation(line: 362, column: 13, scope: !574)
!584 = distinct !{!584, !576, !585, !200}
!585 = !DILocation(line: 365, column: 13, scope: !571)
!586 = !DILocation(line: 368, column: 17, scope: !587)
!587 = distinct !DILexicalBlock(scope: !557, file: !69, line: 368, column: 17)
!588 = !DILocation(line: 368, column: 22, scope: !587)
!589 = !DILocation(line: 368, column: 17, scope: !557)
!590 = !DILocation(line: 370, column: 17, scope: !591)
!591 = distinct !DILexicalBlock(scope: !587, file: !69, line: 369, column: 13)
!592 = !DILocation(line: 370, column: 24, scope: !591)
!593 = !DILocation(line: 370, column: 30, scope: !591)
!594 = !DILocation(line: 372, column: 23, scope: !595)
!595 = distinct !DILexicalBlock(scope: !591, file: !69, line: 372, column: 17)
!596 = !DILocation(line: 372, column: 21, scope: !595)
!597 = !DILocation(line: 372, column: 28, scope: !598)
!598 = distinct !DILexicalBlock(scope: !595, file: !69, line: 372, column: 17)
!599 = !DILocation(line: 372, column: 30, scope: !598)
!600 = !DILocation(line: 372, column: 17, scope: !595)
!601 = !DILocation(line: 374, column: 34, scope: !602)
!602 = distinct !DILexicalBlock(scope: !598, file: !69, line: 373, column: 17)
!603 = !DILocation(line: 374, column: 41, scope: !602)
!604 = !DILocation(line: 374, column: 21, scope: !602)
!605 = !DILocation(line: 375, column: 17, scope: !602)
!606 = !DILocation(line: 372, column: 37, scope: !598)
!607 = !DILocation(line: 372, column: 17, scope: !598)
!608 = distinct !{!608, !600, !609, !200}
!609 = !DILocation(line: 375, column: 17, scope: !595)
!610 = !DILocation(line: 376, column: 13, scope: !591)
!611 = !DILocation(line: 379, column: 17, scope: !612)
!612 = distinct !DILexicalBlock(scope: !587, file: !69, line: 378, column: 13)
!613 = !DILocation(line: 381, column: 18, scope: !557)
!614 = !DILocation(line: 381, column: 13, scope: !557)
!615 = !DILocation(line: 383, column: 5, scope: !558)
!616 = !DILocation(line: 384, column: 1, scope: !541)
!617 = distinct !DISubprogram(name: "goodG2B2", scope: !69, file: !69, line: 387, type: !70, scopeLine: 388, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!618 = !DILocalVariable(name: "data", scope: !617, file: !69, line: 389, type: !60)
!619 = !DILocation(line: 389, column: 9, scope: !617)
!620 = !DILocation(line: 391, column: 10, scope: !617)
!621 = !DILocation(line: 392, column: 8, scope: !622)
!622 = distinct !DILexicalBlock(scope: !617, file: !69, line: 392, column: 8)
!623 = !DILocation(line: 392, column: 8, scope: !617)
!624 = !DILocation(line: 396, column: 14, scope: !625)
!625 = distinct !DILexicalBlock(scope: !622, file: !69, line: 393, column: 5)
!626 = !DILocation(line: 397, column: 5, scope: !625)
!627 = !DILocation(line: 398, column: 8, scope: !628)
!628 = distinct !DILexicalBlock(scope: !617, file: !69, line: 398, column: 8)
!629 = !DILocation(line: 398, column: 8, scope: !617)
!630 = !DILocalVariable(name: "i", scope: !631, file: !69, line: 401, type: !60)
!631 = distinct !DILexicalBlock(scope: !632, file: !69, line: 400, column: 9)
!632 = distinct !DILexicalBlock(scope: !628, file: !69, line: 399, column: 5)
!633 = !DILocation(line: 401, column: 17, scope: !631)
!634 = !DILocalVariable(name: "buffer", scope: !631, file: !69, line: 402, type: !59)
!635 = !DILocation(line: 402, column: 19, scope: !631)
!636 = !DILocation(line: 402, column: 35, scope: !631)
!637 = !DILocation(line: 402, column: 28, scope: !631)
!638 = !DILocation(line: 403, column: 17, scope: !639)
!639 = distinct !DILexicalBlock(scope: !631, file: !69, line: 403, column: 17)
!640 = !DILocation(line: 403, column: 24, scope: !639)
!641 = !DILocation(line: 403, column: 17, scope: !631)
!642 = !DILocation(line: 403, column: 34, scope: !643)
!643 = distinct !DILexicalBlock(scope: !639, file: !69, line: 403, column: 33)
!644 = !DILocation(line: 405, column: 20, scope: !645)
!645 = distinct !DILexicalBlock(scope: !631, file: !69, line: 405, column: 13)
!646 = !DILocation(line: 405, column: 18, scope: !645)
!647 = !DILocation(line: 405, column: 25, scope: !648)
!648 = distinct !DILexicalBlock(scope: !645, file: !69, line: 405, column: 13)
!649 = !DILocation(line: 405, column: 27, scope: !648)
!650 = !DILocation(line: 405, column: 13, scope: !645)
!651 = !DILocation(line: 407, column: 17, scope: !652)
!652 = distinct !DILexicalBlock(scope: !648, file: !69, line: 406, column: 13)
!653 = !DILocation(line: 407, column: 24, scope: !652)
!654 = !DILocation(line: 407, column: 27, scope: !652)
!655 = !DILocation(line: 408, column: 13, scope: !652)
!656 = !DILocation(line: 405, column: 34, scope: !648)
!657 = !DILocation(line: 405, column: 13, scope: !648)
!658 = distinct !{!658, !650, !659, !200}
!659 = !DILocation(line: 408, column: 13, scope: !645)
!660 = !DILocation(line: 411, column: 17, scope: !661)
!661 = distinct !DILexicalBlock(scope: !631, file: !69, line: 411, column: 17)
!662 = !DILocation(line: 411, column: 22, scope: !661)
!663 = !DILocation(line: 411, column: 17, scope: !631)
!664 = !DILocation(line: 413, column: 17, scope: !665)
!665 = distinct !DILexicalBlock(scope: !661, file: !69, line: 412, column: 13)
!666 = !DILocation(line: 413, column: 24, scope: !665)
!667 = !DILocation(line: 413, column: 30, scope: !665)
!668 = !DILocation(line: 415, column: 23, scope: !669)
!669 = distinct !DILexicalBlock(scope: !665, file: !69, line: 415, column: 17)
!670 = !DILocation(line: 415, column: 21, scope: !669)
!671 = !DILocation(line: 415, column: 28, scope: !672)
!672 = distinct !DILexicalBlock(scope: !669, file: !69, line: 415, column: 17)
!673 = !DILocation(line: 415, column: 30, scope: !672)
!674 = !DILocation(line: 415, column: 17, scope: !669)
!675 = !DILocation(line: 417, column: 34, scope: !676)
!676 = distinct !DILexicalBlock(scope: !672, file: !69, line: 416, column: 17)
!677 = !DILocation(line: 417, column: 41, scope: !676)
!678 = !DILocation(line: 417, column: 21, scope: !676)
!679 = !DILocation(line: 418, column: 17, scope: !676)
!680 = !DILocation(line: 415, column: 37, scope: !672)
!681 = !DILocation(line: 415, column: 17, scope: !672)
!682 = distinct !{!682, !674, !683, !200}
!683 = !DILocation(line: 418, column: 17, scope: !669)
!684 = !DILocation(line: 419, column: 13, scope: !665)
!685 = !DILocation(line: 422, column: 17, scope: !686)
!686 = distinct !DILexicalBlock(scope: !661, file: !69, line: 421, column: 13)
!687 = !DILocation(line: 424, column: 18, scope: !631)
!688 = !DILocation(line: 424, column: 13, scope: !631)
!689 = !DILocation(line: 426, column: 5, scope: !632)
!690 = !DILocation(line: 427, column: 1, scope: !617)
