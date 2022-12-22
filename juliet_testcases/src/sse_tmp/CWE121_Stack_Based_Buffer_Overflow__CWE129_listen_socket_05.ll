; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_05.c"
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
@staticFalse = internal global i32 0, align 4, !dbg !67
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_05_bad() #0 !dbg !77 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i32 -1, i32* %data, align 4, !dbg !83
  %0 = load i32, i32* @staticTrue, align 4, !dbg !84
  %tobool = icmp ne i32 %0, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.end34, !dbg !86

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !87, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !91, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %listenSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %acceptSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  br label %do.body, !dbg !115

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !116
  store i32 %call, i32* %listenSocket, align 4, !dbg !118
  %1 = load i32, i32* %listenSocket, align 4, !dbg !119
  %cmp = icmp eq i32 %1, -1, !dbg !121
  br i1 %cmp, label %if.then1, label %if.end, !dbg !122

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !123

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !125
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !126
  store i16 2, i16* %sin_family, align 4, !dbg !127
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !128
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !129
  store i32 0, i32* %s_addr, align 4, !dbg !130
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !131
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !132
  store i16 %call2, i16* %sin_port, align 2, !dbg !133
  %3 = load i32, i32* %listenSocket, align 4, !dbg !134
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !136
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !137
  %cmp4 = icmp eq i32 %call3, -1, !dbg !138
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !139

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !140

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !142
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !144
  %cmp8 = icmp eq i32 %call7, -1, !dbg !145
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !146

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !147

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !149
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !150
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !151
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !152
  %cmp12 = icmp eq i32 %7, -1, !dbg !154
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !155

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !156

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !158
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !160
  %conv = trunc i64 %call15 to i32, !dbg !160
  store i32 %conv, i32* %recvResult, align 4, !dbg !161
  %9 = load i32, i32* %recvResult, align 4, !dbg !162
  %cmp16 = icmp eq i32 %9, -1, !dbg !164
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !165

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !166
  %cmp18 = icmp eq i32 %10, 0, !dbg !167
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !168

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !169

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !171
  %idxprom = sext i32 %11 to i64, !dbg !172
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !172
  store i8 0, i8* %arrayidx, align 1, !dbg !173
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !174
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !175
  store i32 %call23, i32* %data, align 4, !dbg !176
  br label %do.end, !dbg !177

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !178
  %cmp24 = icmp ne i32 %12, -1, !dbg !180
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !181

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !182
  %call27 = call i32 @close(i32 %13), !dbg !184
  br label %if.end28, !dbg !185

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !186
  %cmp29 = icmp ne i32 %14, -1, !dbg !188
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !189

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !190
  %call32 = call i32 @close(i32 %15), !dbg !192
  br label %if.end33, !dbg !193

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !194

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticTrue, align 4, !dbg !195
  %tobool35 = icmp ne i32 %16, 0, !dbg !195
  br i1 %tobool35, label %if.then36, label %if.end47, !dbg !197

if.then36:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !198, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !202, metadata !DIExpression()), !dbg !206
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !206
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !206
  %18 = load i32, i32* %data, align 4, !dbg !207
  %cmp37 = icmp sge i32 %18, 0, !dbg !209
  br i1 %cmp37, label %if.then39, label %if.else, !dbg !210

if.then39:                                        ; preds = %if.then36
  %19 = load i32, i32* %data, align 4, !dbg !211
  %idxprom40 = sext i32 %19 to i64, !dbg !213
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom40, !dbg !213
  store i32 1, i32* %arrayidx41, align 4, !dbg !214
  store i32 0, i32* %i, align 4, !dbg !215
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc, %if.then39
  %20 = load i32, i32* %i, align 4, !dbg !218
  %cmp42 = icmp slt i32 %20, 10, !dbg !220
  br i1 %cmp42, label %for.body, label %for.end, !dbg !221

for.body:                                         ; preds = %for.cond
  %21 = load i32, i32* %i, align 4, !dbg !222
  %idxprom44 = sext i32 %21 to i64, !dbg !224
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !224
  %22 = load i32, i32* %arrayidx45, align 4, !dbg !224
  call void @printIntLine(i32 %22), !dbg !225
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %i, align 4, !dbg !227
  %inc = add nsw i32 %23, 1, !dbg !227
  store i32 %inc, i32* %i, align 4, !dbg !227
  br label %for.cond, !dbg !228, !llvm.loop !229

for.end:                                          ; preds = %for.cond
  br label %if.end46, !dbg !232

if.else:                                          ; preds = %if.then36
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !233
  br label %if.end46

if.end46:                                         ; preds = %if.else, %for.end
  br label %if.end47, !dbg !235

if.end47:                                         ; preds = %if.end46, %if.end34
  ret void, !dbg !236
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_05_good() #0 !dbg !237 {
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
  %call = call i64 @time(i64* null) #7, !dbg !252
  %conv = trunc i64 %call to i32, !dbg !253
  call void @srand(i32 %conv) #7, !dbg !254
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !255
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_05_good(), !dbg !256
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !257
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !258
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_05_bad(), !dbg !259
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !260
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
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 -1, i32* %data, align 4, !dbg !265
  %0 = load i32, i32* @staticTrue, align 4, !dbg !266
  %tobool = icmp ne i32 %0, 0, !dbg !266
  br i1 %tobool, label %if.then, label %if.end34, !dbg !268

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !269, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !273, metadata !DIExpression()), !dbg !274
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !275, metadata !DIExpression()), !dbg !276
  store i32 -1, i32* %listenSocket, align 4, !dbg !276
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !277, metadata !DIExpression()), !dbg !278
  store i32 -1, i32* %acceptSocket, align 4, !dbg !278
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !279, metadata !DIExpression()), !dbg !280
  br label %do.body, !dbg !281

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !282
  store i32 %call, i32* %listenSocket, align 4, !dbg !284
  %1 = load i32, i32* %listenSocket, align 4, !dbg !285
  %cmp = icmp eq i32 %1, -1, !dbg !287
  br i1 %cmp, label %if.then1, label %if.end, !dbg !288

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !289

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !291
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !291
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !292
  store i16 2, i16* %sin_family, align 4, !dbg !293
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !294
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !295
  store i32 0, i32* %s_addr, align 4, !dbg !296
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !297
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !298
  store i16 %call2, i16* %sin_port, align 2, !dbg !299
  %3 = load i32, i32* %listenSocket, align 4, !dbg !300
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !302
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !303
  %cmp4 = icmp eq i32 %call3, -1, !dbg !304
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !305

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !306

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !308
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !310
  %cmp8 = icmp eq i32 %call7, -1, !dbg !311
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !312

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !313

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !315
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !316
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !317
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !318
  %cmp12 = icmp eq i32 %7, -1, !dbg !320
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !321

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !322

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !324
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !325
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !326
  %conv = trunc i64 %call15 to i32, !dbg !326
  store i32 %conv, i32* %recvResult, align 4, !dbg !327
  %9 = load i32, i32* %recvResult, align 4, !dbg !328
  %cmp16 = icmp eq i32 %9, -1, !dbg !330
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !331

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !332
  %cmp18 = icmp eq i32 %10, 0, !dbg !333
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !334

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !335

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !337
  %idxprom = sext i32 %11 to i64, !dbg !338
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !338
  store i8 0, i8* %arrayidx, align 1, !dbg !339
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !340
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !341
  store i32 %call23, i32* %data, align 4, !dbg !342
  br label %do.end, !dbg !343

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !344
  %cmp24 = icmp ne i32 %12, -1, !dbg !346
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !347

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !348
  %call27 = call i32 @close(i32 %13), !dbg !350
  br label %if.end28, !dbg !351

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !352
  %cmp29 = icmp ne i32 %14, -1, !dbg !354
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !355

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !356
  %call32 = call i32 @close(i32 %15), !dbg !358
  br label %if.end33, !dbg !359

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !360

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticFalse, align 4, !dbg !361
  %tobool35 = icmp ne i32 %16, 0, !dbg !361
  br i1 %tobool35, label %if.then36, label %if.else, !dbg !363

if.then36:                                        ; preds = %if.end34
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !364
  br label %if.end50, !dbg !366

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !367, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !371, metadata !DIExpression()), !dbg !372
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !372
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !372
  %18 = load i32, i32* %data, align 4, !dbg !373
  %cmp37 = icmp sge i32 %18, 0, !dbg !375
  br i1 %cmp37, label %land.lhs.true, label %if.else48, !dbg !376

land.lhs.true:                                    ; preds = %if.else
  %19 = load i32, i32* %data, align 4, !dbg !377
  %cmp39 = icmp slt i32 %19, 10, !dbg !378
  br i1 %cmp39, label %if.then41, label %if.else48, !dbg !379

if.then41:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !380
  %idxprom42 = sext i32 %20 to i64, !dbg !382
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !382
  store i32 1, i32* %arrayidx43, align 4, !dbg !383
  store i32 0, i32* %i, align 4, !dbg !384
  br label %for.cond, !dbg !386

for.cond:                                         ; preds = %for.inc, %if.then41
  %21 = load i32, i32* %i, align 4, !dbg !387
  %cmp44 = icmp slt i32 %21, 10, !dbg !389
  br i1 %cmp44, label %for.body, label %for.end, !dbg !390

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !391
  %idxprom46 = sext i32 %22 to i64, !dbg !393
  %arrayidx47 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom46, !dbg !393
  %23 = load i32, i32* %arrayidx47, align 4, !dbg !393
  call void @printIntLine(i32 %23), !dbg !394
  br label %for.inc, !dbg !395

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !396
  %inc = add nsw i32 %24, 1, !dbg !396
  store i32 %inc, i32* %i, align 4, !dbg !396
  br label %for.cond, !dbg !397, !llvm.loop !398

for.end:                                          ; preds = %for.cond
  br label %if.end49, !dbg !400

if.else48:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !401
  br label %if.end49

if.end49:                                         ; preds = %if.else48, %for.end
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %if.then36
  ret void, !dbg !403
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !404 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !405, metadata !DIExpression()), !dbg !406
  store i32 -1, i32* %data, align 4, !dbg !407
  %0 = load i32, i32* @staticTrue, align 4, !dbg !408
  %tobool = icmp ne i32 %0, 0, !dbg !408
  br i1 %tobool, label %if.then, label %if.end34, !dbg !410

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
  %cmp = icmp eq i32 %1, -1, !dbg !429
  br i1 %cmp, label %if.then1, label %if.end, !dbg !430

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !431

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !433
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !433
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !434
  store i16 2, i16* %sin_family, align 4, !dbg !435
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !436
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !437
  store i32 0, i32* %s_addr, align 4, !dbg !438
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !439
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !440
  store i16 %call2, i16* %sin_port, align 2, !dbg !441
  %3 = load i32, i32* %listenSocket, align 4, !dbg !442
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !444
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !445
  %cmp4 = icmp eq i32 %call3, -1, !dbg !446
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !447

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !448

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !450
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !452
  %cmp8 = icmp eq i32 %call7, -1, !dbg !453
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !454

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !455

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !457
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !458
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !459
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !460
  %cmp12 = icmp eq i32 %7, -1, !dbg !462
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !463

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !464

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !466
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !467
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !468
  %conv = trunc i64 %call15 to i32, !dbg !468
  store i32 %conv, i32* %recvResult, align 4, !dbg !469
  %9 = load i32, i32* %recvResult, align 4, !dbg !470
  %cmp16 = icmp eq i32 %9, -1, !dbg !472
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !473

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !474
  %cmp18 = icmp eq i32 %10, 0, !dbg !475
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !476

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !477

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !479
  %idxprom = sext i32 %11 to i64, !dbg !480
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !480
  store i8 0, i8* %arrayidx, align 1, !dbg !481
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !482
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !483
  store i32 %call23, i32* %data, align 4, !dbg !484
  br label %do.end, !dbg !485

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !486
  %cmp24 = icmp ne i32 %12, -1, !dbg !488
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !489

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !490
  %call27 = call i32 @close(i32 %13), !dbg !492
  br label %if.end28, !dbg !493

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !494
  %cmp29 = icmp ne i32 %14, -1, !dbg !496
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !497

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !498
  %call32 = call i32 @close(i32 %15), !dbg !500
  br label %if.end33, !dbg !501

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !502

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticTrue, align 4, !dbg !503
  %tobool35 = icmp ne i32 %16, 0, !dbg !503
  br i1 %tobool35, label %if.then36, label %if.end49, !dbg !505

if.then36:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !506, metadata !DIExpression()), !dbg !509
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !510, metadata !DIExpression()), !dbg !511
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !511
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !511
  %18 = load i32, i32* %data, align 4, !dbg !512
  %cmp37 = icmp sge i32 %18, 0, !dbg !514
  br i1 %cmp37, label %land.lhs.true, label %if.else, !dbg !515

land.lhs.true:                                    ; preds = %if.then36
  %19 = load i32, i32* %data, align 4, !dbg !516
  %cmp39 = icmp slt i32 %19, 10, !dbg !517
  br i1 %cmp39, label %if.then41, label %if.else, !dbg !518

if.then41:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !519
  %idxprom42 = sext i32 %20 to i64, !dbg !521
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !521
  store i32 1, i32* %arrayidx43, align 4, !dbg !522
  store i32 0, i32* %i, align 4, !dbg !523
  br label %for.cond, !dbg !525

for.cond:                                         ; preds = %for.inc, %if.then41
  %21 = load i32, i32* %i, align 4, !dbg !526
  %cmp44 = icmp slt i32 %21, 10, !dbg !528
  br i1 %cmp44, label %for.body, label %for.end, !dbg !529

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !530
  %idxprom46 = sext i32 %22 to i64, !dbg !532
  %arrayidx47 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom46, !dbg !532
  %23 = load i32, i32* %arrayidx47, align 4, !dbg !532
  call void @printIntLine(i32 %23), !dbg !533
  br label %for.inc, !dbg !534

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !535
  %inc = add nsw i32 %24, 1, !dbg !535
  store i32 %inc, i32* %i, align 4, !dbg !535
  br label %for.cond, !dbg !536, !llvm.loop !537

for.end:                                          ; preds = %for.cond
  br label %if.end48, !dbg !539

if.else:                                          ; preds = %land.lhs.true, %if.then36
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !540
  br label %if.end48

if.end48:                                         ; preds = %if.else, %for.end
  br label %if.end49, !dbg !542

if.end49:                                         ; preds = %if.end48, %if.end34
  ret void, !dbg !543
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !544 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !545, metadata !DIExpression()), !dbg !546
  store i32 -1, i32* %data, align 4, !dbg !547
  %0 = load i32, i32* @staticFalse, align 4, !dbg !548
  %tobool = icmp ne i32 %0, 0, !dbg !548
  br i1 %tobool, label %if.then, label %if.else, !dbg !550

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !551
  br label %if.end, !dbg !553

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !554
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !556
  %tobool1 = icmp ne i32 %1, 0, !dbg !556
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !558

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !559, metadata !DIExpression()), !dbg !562
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !563, metadata !DIExpression()), !dbg !564
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !564
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !564
  %3 = load i32, i32* %data, align 4, !dbg !565
  %cmp = icmp sge i32 %3, 0, !dbg !567
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !568

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !569
  %idxprom = sext i32 %4 to i64, !dbg !571
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !571
  store i32 1, i32* %arrayidx, align 4, !dbg !572
  store i32 0, i32* %i, align 4, !dbg !573
  br label %for.cond, !dbg !575

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !576
  %cmp4 = icmp slt i32 %5, 10, !dbg !578
  br i1 %cmp4, label %for.body, label %for.end, !dbg !579

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !580
  %idxprom5 = sext i32 %6 to i64, !dbg !582
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !582
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !582
  call void @printIntLine(i32 %7), !dbg !583
  br label %for.inc, !dbg !584

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !585
  %inc = add nsw i32 %8, 1, !dbg !585
  store i32 %inc, i32* %i, align 4, !dbg !585
  br label %for.cond, !dbg !586, !llvm.loop !587

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !589

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !590
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !592

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !593
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !594 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !595, metadata !DIExpression()), !dbg !596
  store i32 -1, i32* %data, align 4, !dbg !597
  %0 = load i32, i32* @staticTrue, align 4, !dbg !598
  %tobool = icmp ne i32 %0, 0, !dbg !598
  br i1 %tobool, label %if.then, label %if.end, !dbg !600

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !601
  br label %if.end, !dbg !603

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !604
  %tobool1 = icmp ne i32 %1, 0, !dbg !604
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !606

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !607, metadata !DIExpression()), !dbg !610
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !611, metadata !DIExpression()), !dbg !612
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !612
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !612
  %3 = load i32, i32* %data, align 4, !dbg !613
  %cmp = icmp sge i32 %3, 0, !dbg !615
  br i1 %cmp, label %if.then3, label %if.else, !dbg !616

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !617
  %idxprom = sext i32 %4 to i64, !dbg !619
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !619
  store i32 1, i32* %arrayidx, align 4, !dbg !620
  store i32 0, i32* %i, align 4, !dbg !621
  br label %for.cond, !dbg !623

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !624
  %cmp4 = icmp slt i32 %5, 10, !dbg !626
  br i1 %cmp4, label %for.body, label %for.end, !dbg !627

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !628
  %idxprom5 = sext i32 %6 to i64, !dbg !630
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !630
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !630
  call void @printIntLine(i32 %7), !dbg !631
  br label %for.inc, !dbg !632

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !633
  %inc = add nsw i32 %8, 1, !dbg !633
  store i32 %inc, i32* %i, align 4, !dbg !633
  br label %for.cond, !dbg !634, !llvm.loop !635

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !637

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !638
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !640

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !641
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!71, !72, !73, !74, !75}
!llvm.ident = !{!76}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !69, line: 45, type: !70, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !66, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_05.c", directory: "/root/SSE-Assessment")
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
!47 = !{!48, !53, !7}
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
!66 = !{!0, !67}
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !69, line: 46, type: !70, isLocal: true, isDefinition: true)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_05.c", directory: "/root/SSE-Assessment")
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !{i32 7, !"Dwarf Version", i32 4}
!72 = !{i32 2, !"Debug Info Version", i32 3}
!73 = !{i32 1, !"wchar_size", i32 4}
!74 = !{i32 7, !"uwtable", i32 1}
!75 = !{i32 7, !"frame-pointer", i32 2}
!76 = !{!"clang version 13.0.0"}
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_05_bad", scope: !69, file: !69, line: 50, type: !78, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !80)
!78 = !DISubroutineType(types: !79)
!79 = !{null}
!80 = !{}
!81 = !DILocalVariable(name: "data", scope: !77, file: !69, line: 52, type: !70)
!82 = !DILocation(line: 52, column: 9, scope: !77)
!83 = !DILocation(line: 54, column: 10, scope: !77)
!84 = !DILocation(line: 55, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !69, line: 55, column: 8)
!86 = !DILocation(line: 55, column: 8, scope: !77)
!87 = !DILocalVariable(name: "recvResult", scope: !88, file: !69, line: 62, type: !70)
!88 = distinct !DILexicalBlock(scope: !89, file: !69, line: 57, column: 9)
!89 = distinct !DILexicalBlock(scope: !85, file: !69, line: 56, column: 5)
!90 = !DILocation(line: 62, column: 17, scope: !88)
!91 = !DILocalVariable(name: "service", scope: !88, file: !69, line: 63, type: !92)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 237, size: 128, elements: !93)
!93 = !{!94, !95, !99, !103}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !92, file: !19, line: 239, baseType: !58, size: 16)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !92, file: !19, line: 240, baseType: !96, size: 16, offset: 16)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 39, baseType: !60)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !92, file: !19, line: 241, baseType: !100, size: 32, offset: 32)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !101)
!101 = !{!102}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !100, file: !19, line: 33, baseType: !48, size: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !92, file: !19, line: 244, baseType: !104, size: 64, offset: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 64, elements: !106)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 63, column: 32, scope: !88)
!109 = !DILocalVariable(name: "listenSocket", scope: !88, file: !69, line: 64, type: !70)
!110 = !DILocation(line: 64, column: 20, scope: !88)
!111 = !DILocalVariable(name: "acceptSocket", scope: !88, file: !69, line: 65, type: !70)
!112 = !DILocation(line: 65, column: 20, scope: !88)
!113 = !DILocalVariable(name: "inputBuffer", scope: !88, file: !69, line: 66, type: !62)
!114 = !DILocation(line: 66, column: 18, scope: !88)
!115 = !DILocation(line: 67, column: 13, scope: !88)
!116 = !DILocation(line: 77, column: 32, scope: !117)
!117 = distinct !DILexicalBlock(scope: !88, file: !69, line: 68, column: 13)
!118 = !DILocation(line: 77, column: 30, scope: !117)
!119 = !DILocation(line: 78, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !69, line: 78, column: 21)
!121 = !DILocation(line: 78, column: 34, scope: !120)
!122 = !DILocation(line: 78, column: 21, scope: !117)
!123 = !DILocation(line: 80, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !69, line: 79, column: 17)
!125 = !DILocation(line: 82, column: 17, scope: !117)
!126 = !DILocation(line: 83, column: 25, scope: !117)
!127 = !DILocation(line: 83, column: 36, scope: !117)
!128 = !DILocation(line: 84, column: 25, scope: !117)
!129 = !DILocation(line: 84, column: 34, scope: !117)
!130 = !DILocation(line: 84, column: 41, scope: !117)
!131 = !DILocation(line: 85, column: 36, scope: !117)
!132 = !DILocation(line: 85, column: 25, scope: !117)
!133 = !DILocation(line: 85, column: 34, scope: !117)
!134 = !DILocation(line: 86, column: 26, scope: !135)
!135 = distinct !DILexicalBlock(scope: !117, file: !69, line: 86, column: 21)
!136 = !DILocation(line: 86, column: 40, scope: !135)
!137 = !DILocation(line: 86, column: 21, scope: !135)
!138 = !DILocation(line: 86, column: 85, scope: !135)
!139 = !DILocation(line: 86, column: 21, scope: !117)
!140 = !DILocation(line: 88, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !69, line: 87, column: 17)
!142 = !DILocation(line: 90, column: 28, scope: !143)
!143 = distinct !DILexicalBlock(scope: !117, file: !69, line: 90, column: 21)
!144 = !DILocation(line: 90, column: 21, scope: !143)
!145 = !DILocation(line: 90, column: 58, scope: !143)
!146 = !DILocation(line: 90, column: 21, scope: !117)
!147 = !DILocation(line: 92, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !69, line: 91, column: 17)
!149 = !DILocation(line: 94, column: 39, scope: !117)
!150 = !DILocation(line: 94, column: 32, scope: !117)
!151 = !DILocation(line: 94, column: 30, scope: !117)
!152 = !DILocation(line: 95, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !117, file: !69, line: 95, column: 21)
!154 = !DILocation(line: 95, column: 34, scope: !153)
!155 = !DILocation(line: 95, column: 21, scope: !117)
!156 = !DILocation(line: 97, column: 21, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !69, line: 96, column: 17)
!158 = !DILocation(line: 100, column: 35, scope: !117)
!159 = !DILocation(line: 100, column: 49, scope: !117)
!160 = !DILocation(line: 100, column: 30, scope: !117)
!161 = !DILocation(line: 100, column: 28, scope: !117)
!162 = !DILocation(line: 101, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !117, file: !69, line: 101, column: 21)
!164 = !DILocation(line: 101, column: 32, scope: !163)
!165 = !DILocation(line: 101, column: 48, scope: !163)
!166 = !DILocation(line: 101, column: 51, scope: !163)
!167 = !DILocation(line: 101, column: 62, scope: !163)
!168 = !DILocation(line: 101, column: 21, scope: !117)
!169 = !DILocation(line: 103, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !69, line: 102, column: 17)
!171 = !DILocation(line: 106, column: 29, scope: !117)
!172 = !DILocation(line: 106, column: 17, scope: !117)
!173 = !DILocation(line: 106, column: 41, scope: !117)
!174 = !DILocation(line: 108, column: 29, scope: !117)
!175 = !DILocation(line: 108, column: 24, scope: !117)
!176 = !DILocation(line: 108, column: 22, scope: !117)
!177 = !DILocation(line: 109, column: 13, scope: !117)
!178 = !DILocation(line: 111, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !88, file: !69, line: 111, column: 17)
!180 = !DILocation(line: 111, column: 30, scope: !179)
!181 = !DILocation(line: 111, column: 17, scope: !88)
!182 = !DILocation(line: 113, column: 30, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !69, line: 112, column: 13)
!184 = !DILocation(line: 113, column: 17, scope: !183)
!185 = !DILocation(line: 114, column: 13, scope: !183)
!186 = !DILocation(line: 115, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !88, file: !69, line: 115, column: 17)
!188 = !DILocation(line: 115, column: 30, scope: !187)
!189 = !DILocation(line: 115, column: 17, scope: !88)
!190 = !DILocation(line: 117, column: 30, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !69, line: 116, column: 13)
!192 = !DILocation(line: 117, column: 17, scope: !191)
!193 = !DILocation(line: 118, column: 13, scope: !191)
!194 = !DILocation(line: 126, column: 5, scope: !89)
!195 = !DILocation(line: 127, column: 8, scope: !196)
!196 = distinct !DILexicalBlock(scope: !77, file: !69, line: 127, column: 8)
!197 = !DILocation(line: 127, column: 8, scope: !77)
!198 = !DILocalVariable(name: "i", scope: !199, file: !69, line: 130, type: !70)
!199 = distinct !DILexicalBlock(scope: !200, file: !69, line: 129, column: 9)
!200 = distinct !DILexicalBlock(scope: !196, file: !69, line: 128, column: 5)
!201 = !DILocation(line: 130, column: 17, scope: !199)
!202 = !DILocalVariable(name: "buffer", scope: !199, file: !69, line: 131, type: !203)
!203 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 320, elements: !204)
!204 = !{!205}
!205 = !DISubrange(count: 10)
!206 = !DILocation(line: 131, column: 17, scope: !199)
!207 = !DILocation(line: 134, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !199, file: !69, line: 134, column: 17)
!209 = !DILocation(line: 134, column: 22, scope: !208)
!210 = !DILocation(line: 134, column: 17, scope: !199)
!211 = !DILocation(line: 136, column: 24, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !69, line: 135, column: 13)
!213 = !DILocation(line: 136, column: 17, scope: !212)
!214 = !DILocation(line: 136, column: 30, scope: !212)
!215 = !DILocation(line: 138, column: 23, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !69, line: 138, column: 17)
!217 = !DILocation(line: 138, column: 21, scope: !216)
!218 = !DILocation(line: 138, column: 28, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !69, line: 138, column: 17)
!220 = !DILocation(line: 138, column: 30, scope: !219)
!221 = !DILocation(line: 138, column: 17, scope: !216)
!222 = !DILocation(line: 140, column: 41, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !69, line: 139, column: 17)
!224 = !DILocation(line: 140, column: 34, scope: !223)
!225 = !DILocation(line: 140, column: 21, scope: !223)
!226 = !DILocation(line: 141, column: 17, scope: !223)
!227 = !DILocation(line: 138, column: 37, scope: !219)
!228 = !DILocation(line: 138, column: 17, scope: !219)
!229 = distinct !{!229, !221, !230, !231}
!230 = !DILocation(line: 141, column: 17, scope: !216)
!231 = !{!"llvm.loop.mustprogress"}
!232 = !DILocation(line: 142, column: 13, scope: !212)
!233 = !DILocation(line: 145, column: 17, scope: !234)
!234 = distinct !DILexicalBlock(scope: !208, file: !69, line: 144, column: 13)
!235 = !DILocation(line: 148, column: 5, scope: !200)
!236 = !DILocation(line: 149, column: 1, scope: !77)
!237 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_05_good", scope: !69, file: !69, line: 439, type: !78, scopeLine: 440, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !80)
!238 = !DILocation(line: 441, column: 5, scope: !237)
!239 = !DILocation(line: 442, column: 5, scope: !237)
!240 = !DILocation(line: 443, column: 5, scope: !237)
!241 = !DILocation(line: 444, column: 5, scope: !237)
!242 = !DILocation(line: 445, column: 1, scope: !237)
!243 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 456, type: !244, scopeLine: 457, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !80)
!244 = !DISubroutineType(types: !245)
!245 = !{!70, !70, !246}
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!248 = !DILocalVariable(name: "argc", arg: 1, scope: !243, file: !69, line: 456, type: !70)
!249 = !DILocation(line: 456, column: 14, scope: !243)
!250 = !DILocalVariable(name: "argv", arg: 2, scope: !243, file: !69, line: 456, type: !246)
!251 = !DILocation(line: 456, column: 27, scope: !243)
!252 = !DILocation(line: 459, column: 22, scope: !243)
!253 = !DILocation(line: 459, column: 12, scope: !243)
!254 = !DILocation(line: 459, column: 5, scope: !243)
!255 = !DILocation(line: 461, column: 5, scope: !243)
!256 = !DILocation(line: 462, column: 5, scope: !243)
!257 = !DILocation(line: 463, column: 5, scope: !243)
!258 = !DILocation(line: 466, column: 5, scope: !243)
!259 = !DILocation(line: 467, column: 5, scope: !243)
!260 = !DILocation(line: 468, column: 5, scope: !243)
!261 = !DILocation(line: 470, column: 5, scope: !243)
!262 = distinct !DISubprogram(name: "goodB2G1", scope: !69, file: !69, line: 156, type: !78, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!263 = !DILocalVariable(name: "data", scope: !262, file: !69, line: 158, type: !70)
!264 = !DILocation(line: 158, column: 9, scope: !262)
!265 = !DILocation(line: 160, column: 10, scope: !262)
!266 = !DILocation(line: 161, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !262, file: !69, line: 161, column: 8)
!268 = !DILocation(line: 161, column: 8, scope: !262)
!269 = !DILocalVariable(name: "recvResult", scope: !270, file: !69, line: 168, type: !70)
!270 = distinct !DILexicalBlock(scope: !271, file: !69, line: 163, column: 9)
!271 = distinct !DILexicalBlock(scope: !267, file: !69, line: 162, column: 5)
!272 = !DILocation(line: 168, column: 17, scope: !270)
!273 = !DILocalVariable(name: "service", scope: !270, file: !69, line: 169, type: !92)
!274 = !DILocation(line: 169, column: 32, scope: !270)
!275 = !DILocalVariable(name: "listenSocket", scope: !270, file: !69, line: 170, type: !70)
!276 = !DILocation(line: 170, column: 20, scope: !270)
!277 = !DILocalVariable(name: "acceptSocket", scope: !270, file: !69, line: 171, type: !70)
!278 = !DILocation(line: 171, column: 20, scope: !270)
!279 = !DILocalVariable(name: "inputBuffer", scope: !270, file: !69, line: 172, type: !62)
!280 = !DILocation(line: 172, column: 18, scope: !270)
!281 = !DILocation(line: 173, column: 13, scope: !270)
!282 = !DILocation(line: 183, column: 32, scope: !283)
!283 = distinct !DILexicalBlock(scope: !270, file: !69, line: 174, column: 13)
!284 = !DILocation(line: 183, column: 30, scope: !283)
!285 = !DILocation(line: 184, column: 21, scope: !286)
!286 = distinct !DILexicalBlock(scope: !283, file: !69, line: 184, column: 21)
!287 = !DILocation(line: 184, column: 34, scope: !286)
!288 = !DILocation(line: 184, column: 21, scope: !283)
!289 = !DILocation(line: 186, column: 21, scope: !290)
!290 = distinct !DILexicalBlock(scope: !286, file: !69, line: 185, column: 17)
!291 = !DILocation(line: 188, column: 17, scope: !283)
!292 = !DILocation(line: 189, column: 25, scope: !283)
!293 = !DILocation(line: 189, column: 36, scope: !283)
!294 = !DILocation(line: 190, column: 25, scope: !283)
!295 = !DILocation(line: 190, column: 34, scope: !283)
!296 = !DILocation(line: 190, column: 41, scope: !283)
!297 = !DILocation(line: 191, column: 36, scope: !283)
!298 = !DILocation(line: 191, column: 25, scope: !283)
!299 = !DILocation(line: 191, column: 34, scope: !283)
!300 = !DILocation(line: 192, column: 26, scope: !301)
!301 = distinct !DILexicalBlock(scope: !283, file: !69, line: 192, column: 21)
!302 = !DILocation(line: 192, column: 40, scope: !301)
!303 = !DILocation(line: 192, column: 21, scope: !301)
!304 = !DILocation(line: 192, column: 85, scope: !301)
!305 = !DILocation(line: 192, column: 21, scope: !283)
!306 = !DILocation(line: 194, column: 21, scope: !307)
!307 = distinct !DILexicalBlock(scope: !301, file: !69, line: 193, column: 17)
!308 = !DILocation(line: 196, column: 28, scope: !309)
!309 = distinct !DILexicalBlock(scope: !283, file: !69, line: 196, column: 21)
!310 = !DILocation(line: 196, column: 21, scope: !309)
!311 = !DILocation(line: 196, column: 58, scope: !309)
!312 = !DILocation(line: 196, column: 21, scope: !283)
!313 = !DILocation(line: 198, column: 21, scope: !314)
!314 = distinct !DILexicalBlock(scope: !309, file: !69, line: 197, column: 17)
!315 = !DILocation(line: 200, column: 39, scope: !283)
!316 = !DILocation(line: 200, column: 32, scope: !283)
!317 = !DILocation(line: 200, column: 30, scope: !283)
!318 = !DILocation(line: 201, column: 21, scope: !319)
!319 = distinct !DILexicalBlock(scope: !283, file: !69, line: 201, column: 21)
!320 = !DILocation(line: 201, column: 34, scope: !319)
!321 = !DILocation(line: 201, column: 21, scope: !283)
!322 = !DILocation(line: 203, column: 21, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !69, line: 202, column: 17)
!324 = !DILocation(line: 206, column: 35, scope: !283)
!325 = !DILocation(line: 206, column: 49, scope: !283)
!326 = !DILocation(line: 206, column: 30, scope: !283)
!327 = !DILocation(line: 206, column: 28, scope: !283)
!328 = !DILocation(line: 207, column: 21, scope: !329)
!329 = distinct !DILexicalBlock(scope: !283, file: !69, line: 207, column: 21)
!330 = !DILocation(line: 207, column: 32, scope: !329)
!331 = !DILocation(line: 207, column: 48, scope: !329)
!332 = !DILocation(line: 207, column: 51, scope: !329)
!333 = !DILocation(line: 207, column: 62, scope: !329)
!334 = !DILocation(line: 207, column: 21, scope: !283)
!335 = !DILocation(line: 209, column: 21, scope: !336)
!336 = distinct !DILexicalBlock(scope: !329, file: !69, line: 208, column: 17)
!337 = !DILocation(line: 212, column: 29, scope: !283)
!338 = !DILocation(line: 212, column: 17, scope: !283)
!339 = !DILocation(line: 212, column: 41, scope: !283)
!340 = !DILocation(line: 214, column: 29, scope: !283)
!341 = !DILocation(line: 214, column: 24, scope: !283)
!342 = !DILocation(line: 214, column: 22, scope: !283)
!343 = !DILocation(line: 215, column: 13, scope: !283)
!344 = !DILocation(line: 217, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !270, file: !69, line: 217, column: 17)
!346 = !DILocation(line: 217, column: 30, scope: !345)
!347 = !DILocation(line: 217, column: 17, scope: !270)
!348 = !DILocation(line: 219, column: 30, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !69, line: 218, column: 13)
!350 = !DILocation(line: 219, column: 17, scope: !349)
!351 = !DILocation(line: 220, column: 13, scope: !349)
!352 = !DILocation(line: 221, column: 17, scope: !353)
!353 = distinct !DILexicalBlock(scope: !270, file: !69, line: 221, column: 17)
!354 = !DILocation(line: 221, column: 30, scope: !353)
!355 = !DILocation(line: 221, column: 17, scope: !270)
!356 = !DILocation(line: 223, column: 30, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !69, line: 222, column: 13)
!358 = !DILocation(line: 223, column: 17, scope: !357)
!359 = !DILocation(line: 224, column: 13, scope: !357)
!360 = !DILocation(line: 232, column: 5, scope: !271)
!361 = !DILocation(line: 233, column: 8, scope: !362)
!362 = distinct !DILexicalBlock(scope: !262, file: !69, line: 233, column: 8)
!363 = !DILocation(line: 233, column: 8, scope: !262)
!364 = !DILocation(line: 236, column: 9, scope: !365)
!365 = distinct !DILexicalBlock(scope: !362, file: !69, line: 234, column: 5)
!366 = !DILocation(line: 237, column: 5, scope: !365)
!367 = !DILocalVariable(name: "i", scope: !368, file: !69, line: 241, type: !70)
!368 = distinct !DILexicalBlock(scope: !369, file: !69, line: 240, column: 9)
!369 = distinct !DILexicalBlock(scope: !362, file: !69, line: 239, column: 5)
!370 = !DILocation(line: 241, column: 17, scope: !368)
!371 = !DILocalVariable(name: "buffer", scope: !368, file: !69, line: 242, type: !203)
!372 = !DILocation(line: 242, column: 17, scope: !368)
!373 = !DILocation(line: 244, column: 17, scope: !374)
!374 = distinct !DILexicalBlock(scope: !368, file: !69, line: 244, column: 17)
!375 = !DILocation(line: 244, column: 22, scope: !374)
!376 = !DILocation(line: 244, column: 27, scope: !374)
!377 = !DILocation(line: 244, column: 30, scope: !374)
!378 = !DILocation(line: 244, column: 35, scope: !374)
!379 = !DILocation(line: 244, column: 17, scope: !368)
!380 = !DILocation(line: 246, column: 24, scope: !381)
!381 = distinct !DILexicalBlock(scope: !374, file: !69, line: 245, column: 13)
!382 = !DILocation(line: 246, column: 17, scope: !381)
!383 = !DILocation(line: 246, column: 30, scope: !381)
!384 = !DILocation(line: 248, column: 23, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !69, line: 248, column: 17)
!386 = !DILocation(line: 248, column: 21, scope: !385)
!387 = !DILocation(line: 248, column: 28, scope: !388)
!388 = distinct !DILexicalBlock(scope: !385, file: !69, line: 248, column: 17)
!389 = !DILocation(line: 248, column: 30, scope: !388)
!390 = !DILocation(line: 248, column: 17, scope: !385)
!391 = !DILocation(line: 250, column: 41, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !69, line: 249, column: 17)
!393 = !DILocation(line: 250, column: 34, scope: !392)
!394 = !DILocation(line: 250, column: 21, scope: !392)
!395 = !DILocation(line: 251, column: 17, scope: !392)
!396 = !DILocation(line: 248, column: 37, scope: !388)
!397 = !DILocation(line: 248, column: 17, scope: !388)
!398 = distinct !{!398, !390, !399, !231}
!399 = !DILocation(line: 251, column: 17, scope: !385)
!400 = !DILocation(line: 252, column: 13, scope: !381)
!401 = !DILocation(line: 255, column: 17, scope: !402)
!402 = distinct !DILexicalBlock(scope: !374, file: !69, line: 254, column: 13)
!403 = !DILocation(line: 259, column: 1, scope: !262)
!404 = distinct !DISubprogram(name: "goodB2G2", scope: !69, file: !69, line: 262, type: !78, scopeLine: 263, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!405 = !DILocalVariable(name: "data", scope: !404, file: !69, line: 264, type: !70)
!406 = !DILocation(line: 264, column: 9, scope: !404)
!407 = !DILocation(line: 266, column: 10, scope: !404)
!408 = !DILocation(line: 267, column: 8, scope: !409)
!409 = distinct !DILexicalBlock(scope: !404, file: !69, line: 267, column: 8)
!410 = !DILocation(line: 267, column: 8, scope: !404)
!411 = !DILocalVariable(name: "recvResult", scope: !412, file: !69, line: 274, type: !70)
!412 = distinct !DILexicalBlock(scope: !413, file: !69, line: 269, column: 9)
!413 = distinct !DILexicalBlock(scope: !409, file: !69, line: 268, column: 5)
!414 = !DILocation(line: 274, column: 17, scope: !412)
!415 = !DILocalVariable(name: "service", scope: !412, file: !69, line: 275, type: !92)
!416 = !DILocation(line: 275, column: 32, scope: !412)
!417 = !DILocalVariable(name: "listenSocket", scope: !412, file: !69, line: 276, type: !70)
!418 = !DILocation(line: 276, column: 20, scope: !412)
!419 = !DILocalVariable(name: "acceptSocket", scope: !412, file: !69, line: 277, type: !70)
!420 = !DILocation(line: 277, column: 20, scope: !412)
!421 = !DILocalVariable(name: "inputBuffer", scope: !412, file: !69, line: 278, type: !62)
!422 = !DILocation(line: 278, column: 18, scope: !412)
!423 = !DILocation(line: 279, column: 13, scope: !412)
!424 = !DILocation(line: 289, column: 32, scope: !425)
!425 = distinct !DILexicalBlock(scope: !412, file: !69, line: 280, column: 13)
!426 = !DILocation(line: 289, column: 30, scope: !425)
!427 = !DILocation(line: 290, column: 21, scope: !428)
!428 = distinct !DILexicalBlock(scope: !425, file: !69, line: 290, column: 21)
!429 = !DILocation(line: 290, column: 34, scope: !428)
!430 = !DILocation(line: 290, column: 21, scope: !425)
!431 = !DILocation(line: 292, column: 21, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !69, line: 291, column: 17)
!433 = !DILocation(line: 294, column: 17, scope: !425)
!434 = !DILocation(line: 295, column: 25, scope: !425)
!435 = !DILocation(line: 295, column: 36, scope: !425)
!436 = !DILocation(line: 296, column: 25, scope: !425)
!437 = !DILocation(line: 296, column: 34, scope: !425)
!438 = !DILocation(line: 296, column: 41, scope: !425)
!439 = !DILocation(line: 297, column: 36, scope: !425)
!440 = !DILocation(line: 297, column: 25, scope: !425)
!441 = !DILocation(line: 297, column: 34, scope: !425)
!442 = !DILocation(line: 298, column: 26, scope: !443)
!443 = distinct !DILexicalBlock(scope: !425, file: !69, line: 298, column: 21)
!444 = !DILocation(line: 298, column: 40, scope: !443)
!445 = !DILocation(line: 298, column: 21, scope: !443)
!446 = !DILocation(line: 298, column: 85, scope: !443)
!447 = !DILocation(line: 298, column: 21, scope: !425)
!448 = !DILocation(line: 300, column: 21, scope: !449)
!449 = distinct !DILexicalBlock(scope: !443, file: !69, line: 299, column: 17)
!450 = !DILocation(line: 302, column: 28, scope: !451)
!451 = distinct !DILexicalBlock(scope: !425, file: !69, line: 302, column: 21)
!452 = !DILocation(line: 302, column: 21, scope: !451)
!453 = !DILocation(line: 302, column: 58, scope: !451)
!454 = !DILocation(line: 302, column: 21, scope: !425)
!455 = !DILocation(line: 304, column: 21, scope: !456)
!456 = distinct !DILexicalBlock(scope: !451, file: !69, line: 303, column: 17)
!457 = !DILocation(line: 306, column: 39, scope: !425)
!458 = !DILocation(line: 306, column: 32, scope: !425)
!459 = !DILocation(line: 306, column: 30, scope: !425)
!460 = !DILocation(line: 307, column: 21, scope: !461)
!461 = distinct !DILexicalBlock(scope: !425, file: !69, line: 307, column: 21)
!462 = !DILocation(line: 307, column: 34, scope: !461)
!463 = !DILocation(line: 307, column: 21, scope: !425)
!464 = !DILocation(line: 309, column: 21, scope: !465)
!465 = distinct !DILexicalBlock(scope: !461, file: !69, line: 308, column: 17)
!466 = !DILocation(line: 312, column: 35, scope: !425)
!467 = !DILocation(line: 312, column: 49, scope: !425)
!468 = !DILocation(line: 312, column: 30, scope: !425)
!469 = !DILocation(line: 312, column: 28, scope: !425)
!470 = !DILocation(line: 313, column: 21, scope: !471)
!471 = distinct !DILexicalBlock(scope: !425, file: !69, line: 313, column: 21)
!472 = !DILocation(line: 313, column: 32, scope: !471)
!473 = !DILocation(line: 313, column: 48, scope: !471)
!474 = !DILocation(line: 313, column: 51, scope: !471)
!475 = !DILocation(line: 313, column: 62, scope: !471)
!476 = !DILocation(line: 313, column: 21, scope: !425)
!477 = !DILocation(line: 315, column: 21, scope: !478)
!478 = distinct !DILexicalBlock(scope: !471, file: !69, line: 314, column: 17)
!479 = !DILocation(line: 318, column: 29, scope: !425)
!480 = !DILocation(line: 318, column: 17, scope: !425)
!481 = !DILocation(line: 318, column: 41, scope: !425)
!482 = !DILocation(line: 320, column: 29, scope: !425)
!483 = !DILocation(line: 320, column: 24, scope: !425)
!484 = !DILocation(line: 320, column: 22, scope: !425)
!485 = !DILocation(line: 321, column: 13, scope: !425)
!486 = !DILocation(line: 323, column: 17, scope: !487)
!487 = distinct !DILexicalBlock(scope: !412, file: !69, line: 323, column: 17)
!488 = !DILocation(line: 323, column: 30, scope: !487)
!489 = !DILocation(line: 323, column: 17, scope: !412)
!490 = !DILocation(line: 325, column: 30, scope: !491)
!491 = distinct !DILexicalBlock(scope: !487, file: !69, line: 324, column: 13)
!492 = !DILocation(line: 325, column: 17, scope: !491)
!493 = !DILocation(line: 326, column: 13, scope: !491)
!494 = !DILocation(line: 327, column: 17, scope: !495)
!495 = distinct !DILexicalBlock(scope: !412, file: !69, line: 327, column: 17)
!496 = !DILocation(line: 327, column: 30, scope: !495)
!497 = !DILocation(line: 327, column: 17, scope: !412)
!498 = !DILocation(line: 329, column: 30, scope: !499)
!499 = distinct !DILexicalBlock(scope: !495, file: !69, line: 328, column: 13)
!500 = !DILocation(line: 329, column: 17, scope: !499)
!501 = !DILocation(line: 330, column: 13, scope: !499)
!502 = !DILocation(line: 338, column: 5, scope: !413)
!503 = !DILocation(line: 339, column: 8, scope: !504)
!504 = distinct !DILexicalBlock(scope: !404, file: !69, line: 339, column: 8)
!505 = !DILocation(line: 339, column: 8, scope: !404)
!506 = !DILocalVariable(name: "i", scope: !507, file: !69, line: 342, type: !70)
!507 = distinct !DILexicalBlock(scope: !508, file: !69, line: 341, column: 9)
!508 = distinct !DILexicalBlock(scope: !504, file: !69, line: 340, column: 5)
!509 = !DILocation(line: 342, column: 17, scope: !507)
!510 = !DILocalVariable(name: "buffer", scope: !507, file: !69, line: 343, type: !203)
!511 = !DILocation(line: 343, column: 17, scope: !507)
!512 = !DILocation(line: 345, column: 17, scope: !513)
!513 = distinct !DILexicalBlock(scope: !507, file: !69, line: 345, column: 17)
!514 = !DILocation(line: 345, column: 22, scope: !513)
!515 = !DILocation(line: 345, column: 27, scope: !513)
!516 = !DILocation(line: 345, column: 30, scope: !513)
!517 = !DILocation(line: 345, column: 35, scope: !513)
!518 = !DILocation(line: 345, column: 17, scope: !507)
!519 = !DILocation(line: 347, column: 24, scope: !520)
!520 = distinct !DILexicalBlock(scope: !513, file: !69, line: 346, column: 13)
!521 = !DILocation(line: 347, column: 17, scope: !520)
!522 = !DILocation(line: 347, column: 30, scope: !520)
!523 = !DILocation(line: 349, column: 23, scope: !524)
!524 = distinct !DILexicalBlock(scope: !520, file: !69, line: 349, column: 17)
!525 = !DILocation(line: 349, column: 21, scope: !524)
!526 = !DILocation(line: 349, column: 28, scope: !527)
!527 = distinct !DILexicalBlock(scope: !524, file: !69, line: 349, column: 17)
!528 = !DILocation(line: 349, column: 30, scope: !527)
!529 = !DILocation(line: 349, column: 17, scope: !524)
!530 = !DILocation(line: 351, column: 41, scope: !531)
!531 = distinct !DILexicalBlock(scope: !527, file: !69, line: 350, column: 17)
!532 = !DILocation(line: 351, column: 34, scope: !531)
!533 = !DILocation(line: 351, column: 21, scope: !531)
!534 = !DILocation(line: 352, column: 17, scope: !531)
!535 = !DILocation(line: 349, column: 37, scope: !527)
!536 = !DILocation(line: 349, column: 17, scope: !527)
!537 = distinct !{!537, !529, !538, !231}
!538 = !DILocation(line: 352, column: 17, scope: !524)
!539 = !DILocation(line: 353, column: 13, scope: !520)
!540 = !DILocation(line: 356, column: 17, scope: !541)
!541 = distinct !DILexicalBlock(scope: !513, file: !69, line: 355, column: 13)
!542 = !DILocation(line: 359, column: 5, scope: !508)
!543 = !DILocation(line: 360, column: 1, scope: !404)
!544 = distinct !DISubprogram(name: "goodG2B1", scope: !69, file: !69, line: 363, type: !78, scopeLine: 364, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!545 = !DILocalVariable(name: "data", scope: !544, file: !69, line: 365, type: !70)
!546 = !DILocation(line: 365, column: 9, scope: !544)
!547 = !DILocation(line: 367, column: 10, scope: !544)
!548 = !DILocation(line: 368, column: 8, scope: !549)
!549 = distinct !DILexicalBlock(scope: !544, file: !69, line: 368, column: 8)
!550 = !DILocation(line: 368, column: 8, scope: !544)
!551 = !DILocation(line: 371, column: 9, scope: !552)
!552 = distinct !DILexicalBlock(scope: !549, file: !69, line: 369, column: 5)
!553 = !DILocation(line: 372, column: 5, scope: !552)
!554 = !DILocation(line: 377, column: 14, scope: !555)
!555 = distinct !DILexicalBlock(scope: !549, file: !69, line: 374, column: 5)
!556 = !DILocation(line: 379, column: 8, scope: !557)
!557 = distinct !DILexicalBlock(scope: !544, file: !69, line: 379, column: 8)
!558 = !DILocation(line: 379, column: 8, scope: !544)
!559 = !DILocalVariable(name: "i", scope: !560, file: !69, line: 382, type: !70)
!560 = distinct !DILexicalBlock(scope: !561, file: !69, line: 381, column: 9)
!561 = distinct !DILexicalBlock(scope: !557, file: !69, line: 380, column: 5)
!562 = !DILocation(line: 382, column: 17, scope: !560)
!563 = !DILocalVariable(name: "buffer", scope: !560, file: !69, line: 383, type: !203)
!564 = !DILocation(line: 383, column: 17, scope: !560)
!565 = !DILocation(line: 386, column: 17, scope: !566)
!566 = distinct !DILexicalBlock(scope: !560, file: !69, line: 386, column: 17)
!567 = !DILocation(line: 386, column: 22, scope: !566)
!568 = !DILocation(line: 386, column: 17, scope: !560)
!569 = !DILocation(line: 388, column: 24, scope: !570)
!570 = distinct !DILexicalBlock(scope: !566, file: !69, line: 387, column: 13)
!571 = !DILocation(line: 388, column: 17, scope: !570)
!572 = !DILocation(line: 388, column: 30, scope: !570)
!573 = !DILocation(line: 390, column: 23, scope: !574)
!574 = distinct !DILexicalBlock(scope: !570, file: !69, line: 390, column: 17)
!575 = !DILocation(line: 390, column: 21, scope: !574)
!576 = !DILocation(line: 390, column: 28, scope: !577)
!577 = distinct !DILexicalBlock(scope: !574, file: !69, line: 390, column: 17)
!578 = !DILocation(line: 390, column: 30, scope: !577)
!579 = !DILocation(line: 390, column: 17, scope: !574)
!580 = !DILocation(line: 392, column: 41, scope: !581)
!581 = distinct !DILexicalBlock(scope: !577, file: !69, line: 391, column: 17)
!582 = !DILocation(line: 392, column: 34, scope: !581)
!583 = !DILocation(line: 392, column: 21, scope: !581)
!584 = !DILocation(line: 393, column: 17, scope: !581)
!585 = !DILocation(line: 390, column: 37, scope: !577)
!586 = !DILocation(line: 390, column: 17, scope: !577)
!587 = distinct !{!587, !579, !588, !231}
!588 = !DILocation(line: 393, column: 17, scope: !574)
!589 = !DILocation(line: 394, column: 13, scope: !570)
!590 = !DILocation(line: 397, column: 17, scope: !591)
!591 = distinct !DILexicalBlock(scope: !566, file: !69, line: 396, column: 13)
!592 = !DILocation(line: 400, column: 5, scope: !561)
!593 = !DILocation(line: 401, column: 1, scope: !544)
!594 = distinct !DISubprogram(name: "goodG2B2", scope: !69, file: !69, line: 404, type: !78, scopeLine: 405, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!595 = !DILocalVariable(name: "data", scope: !594, file: !69, line: 406, type: !70)
!596 = !DILocation(line: 406, column: 9, scope: !594)
!597 = !DILocation(line: 408, column: 10, scope: !594)
!598 = !DILocation(line: 409, column: 8, scope: !599)
!599 = distinct !DILexicalBlock(scope: !594, file: !69, line: 409, column: 8)
!600 = !DILocation(line: 409, column: 8, scope: !594)
!601 = !DILocation(line: 413, column: 14, scope: !602)
!602 = distinct !DILexicalBlock(scope: !599, file: !69, line: 410, column: 5)
!603 = !DILocation(line: 414, column: 5, scope: !602)
!604 = !DILocation(line: 415, column: 8, scope: !605)
!605 = distinct !DILexicalBlock(scope: !594, file: !69, line: 415, column: 8)
!606 = !DILocation(line: 415, column: 8, scope: !594)
!607 = !DILocalVariable(name: "i", scope: !608, file: !69, line: 418, type: !70)
!608 = distinct !DILexicalBlock(scope: !609, file: !69, line: 417, column: 9)
!609 = distinct !DILexicalBlock(scope: !605, file: !69, line: 416, column: 5)
!610 = !DILocation(line: 418, column: 17, scope: !608)
!611 = !DILocalVariable(name: "buffer", scope: !608, file: !69, line: 419, type: !203)
!612 = !DILocation(line: 419, column: 17, scope: !608)
!613 = !DILocation(line: 422, column: 17, scope: !614)
!614 = distinct !DILexicalBlock(scope: !608, file: !69, line: 422, column: 17)
!615 = !DILocation(line: 422, column: 22, scope: !614)
!616 = !DILocation(line: 422, column: 17, scope: !608)
!617 = !DILocation(line: 424, column: 24, scope: !618)
!618 = distinct !DILexicalBlock(scope: !614, file: !69, line: 423, column: 13)
!619 = !DILocation(line: 424, column: 17, scope: !618)
!620 = !DILocation(line: 424, column: 30, scope: !618)
!621 = !DILocation(line: 426, column: 23, scope: !622)
!622 = distinct !DILexicalBlock(scope: !618, file: !69, line: 426, column: 17)
!623 = !DILocation(line: 426, column: 21, scope: !622)
!624 = !DILocation(line: 426, column: 28, scope: !625)
!625 = distinct !DILexicalBlock(scope: !622, file: !69, line: 426, column: 17)
!626 = !DILocation(line: 426, column: 30, scope: !625)
!627 = !DILocation(line: 426, column: 17, scope: !622)
!628 = !DILocation(line: 428, column: 41, scope: !629)
!629 = distinct !DILexicalBlock(scope: !625, file: !69, line: 427, column: 17)
!630 = !DILocation(line: 428, column: 34, scope: !629)
!631 = !DILocation(line: 428, column: 21, scope: !629)
!632 = !DILocation(line: 429, column: 17, scope: !629)
!633 = !DILocation(line: 426, column: 37, scope: !625)
!634 = !DILocation(line: 426, column: 17, scope: !625)
!635 = distinct !{!635, !627, !636, !231}
!636 = !DILocation(line: 429, column: 17, scope: !622)
!637 = !DILocation(line: 430, column: 13, scope: !618)
!638 = !DILocation(line: 433, column: 17, scope: !639)
!639 = distinct !DILexicalBlock(scope: !614, file: !69, line: 432, column: 13)
!640 = !DILocation(line: 436, column: 5, scope: !609)
!641 = !DILocation(line: 437, column: 1, scope: !594)
