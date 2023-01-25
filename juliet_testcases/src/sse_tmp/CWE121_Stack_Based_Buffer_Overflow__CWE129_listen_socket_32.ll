; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32.c"
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
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data34 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !78, metadata !DIExpression()), !dbg !80
  store i32* %data, i32** %dataPtr1, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !81, metadata !DIExpression()), !dbg !82
  store i32* %data, i32** %dataPtr2, align 8, !dbg !82
  store i32 -1, i32* %data, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !84, metadata !DIExpression()), !dbg !86
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !87
  %1 = load i32, i32* %0, align 4, !dbg !88
  store i32 %1, i32* %data1, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !89, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !92, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 -1, i32* %listenSocket, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 -1, i32* %acceptSocket, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  br label %do.body, !dbg !116

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !117
  store i32 %call, i32* %listenSocket, align 4, !dbg !119
  %2 = load i32, i32* %listenSocket, align 4, !dbg !120
  %cmp = icmp eq i32 %2, -1, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !124

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !126
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !127
  store i16 2, i16* %sin_family, align 4, !dbg !128
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !129
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !130
  store i32 0, i32* %s_addr, align 4, !dbg !131
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !132
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !133
  store i16 %call2, i16* %sin_port, align 2, !dbg !134
  %4 = load i32, i32* %listenSocket, align 4, !dbg !135
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !137
  %call3 = call i32 @bind(i32 %4, %struct.sockaddr* %5, i32 16) #7, !dbg !138
  %cmp4 = icmp eq i32 %call3, -1, !dbg !139
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !140

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !141

if.end6:                                          ; preds = %if.end
  %6 = load i32, i32* %listenSocket, align 4, !dbg !143
  %call7 = call i32 @listen(i32 %6, i32 5) #7, !dbg !145
  %cmp8 = icmp eq i32 %call7, -1, !dbg !146
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !147

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !148

if.end10:                                         ; preds = %if.end6
  %7 = load i32, i32* %listenSocket, align 4, !dbg !150
  %call11 = call i32 @accept(i32 %7, %struct.sockaddr* null, i32* null), !dbg !151
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !152
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !153
  %cmp12 = icmp eq i32 %8, -1, !dbg !155
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !156

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !157

if.end14:                                         ; preds = %if.end10
  %9 = load i32, i32* %acceptSocket, align 4, !dbg !159
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !160
  %call15 = call i64 @recv(i32 %9, i8* %arraydecay, i64 13, i32 0), !dbg !161
  %conv = trunc i64 %call15 to i32, !dbg !161
  store i32 %conv, i32* %recvResult, align 4, !dbg !162
  %10 = load i32, i32* %recvResult, align 4, !dbg !163
  %cmp16 = icmp eq i32 %10, -1, !dbg !165
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !166

lor.lhs.false:                                    ; preds = %if.end14
  %11 = load i32, i32* %recvResult, align 4, !dbg !167
  %cmp18 = icmp eq i32 %11, 0, !dbg !168
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !169

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !170

if.end21:                                         ; preds = %lor.lhs.false
  %12 = load i32, i32* %recvResult, align 4, !dbg !172
  %idxprom = sext i32 %12 to i64, !dbg !173
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !173
  store i8 0, i8* %arrayidx, align 1, !dbg !174
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !175
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !176
  store i32 %call23, i32* %data1, align 4, !dbg !177
  br label %do.end, !dbg !178

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %13 = load i32, i32* %listenSocket, align 4, !dbg !179
  %cmp24 = icmp ne i32 %13, -1, !dbg !181
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !182

if.then26:                                        ; preds = %do.end
  %14 = load i32, i32* %listenSocket, align 4, !dbg !183
  %call27 = call i32 @close(i32 %14), !dbg !185
  br label %if.end28, !dbg !186

if.end28:                                         ; preds = %if.then26, %do.end
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !187
  %cmp29 = icmp ne i32 %15, -1, !dbg !189
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !190

if.then31:                                        ; preds = %if.end28
  %16 = load i32, i32* %acceptSocket, align 4, !dbg !191
  %call32 = call i32 @close(i32 %16), !dbg !193
  br label %if.end33, !dbg !194

if.end33:                                         ; preds = %if.then31, %if.end28
  %17 = load i32, i32* %data1, align 4, !dbg !195
  %18 = load i32*, i32** %dataPtr1, align 8, !dbg !196
  store i32 %17, i32* %18, align 4, !dbg !197
  call void @llvm.dbg.declare(metadata i32* %data34, metadata !198, metadata !DIExpression()), !dbg !200
  %19 = load i32*, i32** %dataPtr2, align 8, !dbg !201
  %20 = load i32, i32* %19, align 4, !dbg !202
  store i32 %20, i32* %data34, align 4, !dbg !200
  call void @llvm.dbg.declare(metadata i32* %i, metadata !203, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !206, metadata !DIExpression()), !dbg !210
  %21 = bitcast [10 x i32]* %buffer to i8*, !dbg !210
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 40, i1 false), !dbg !210
  %22 = load i32, i32* %data34, align 4, !dbg !211
  %cmp35 = icmp sge i32 %22, 0, !dbg !213
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !214

if.then37:                                        ; preds = %if.end33
  %23 = load i32, i32* %data34, align 4, !dbg !215
  %idxprom38 = sext i32 %23 to i64, !dbg !217
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !217
  store i32 1, i32* %arrayidx39, align 4, !dbg !218
  store i32 0, i32* %i, align 4, !dbg !219
  br label %for.cond, !dbg !221

for.cond:                                         ; preds = %for.inc, %if.then37
  %24 = load i32, i32* %i, align 4, !dbg !222
  %cmp40 = icmp slt i32 %24, 10, !dbg !224
  br i1 %cmp40, label %for.body, label %for.end, !dbg !225

for.body:                                         ; preds = %for.cond
  %25 = load i32, i32* %i, align 4, !dbg !226
  %idxprom42 = sext i32 %25 to i64, !dbg !228
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !228
  %26 = load i32, i32* %arrayidx43, align 4, !dbg !228
  call void @printIntLine(i32 %26), !dbg !229
  br label %for.inc, !dbg !230

for.inc:                                          ; preds = %for.body
  %27 = load i32, i32* %i, align 4, !dbg !231
  %inc = add nsw i32 %27, 1, !dbg !231
  store i32 %inc, i32* %i, align 4, !dbg !231
  br label %for.cond, !dbg !232, !llvm.loop !233

for.end:                                          ; preds = %for.cond
  br label %if.end44, !dbg !236

if.else:                                          ; preds = %if.end33
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !237
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end
  ret void, !dbg !239
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_good() #0 !dbg !240 {
entry:
  call void @goodG2B(), !dbg !241
  call void @goodB2G(), !dbg !242
  ret void, !dbg !243
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !244 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !249, metadata !DIExpression()), !dbg !250
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !251, metadata !DIExpression()), !dbg !252
  %call = call i64 @time(i64* null) #7, !dbg !253
  %conv = trunc i64 %call to i32, !dbg !254
  call void @srand(i32 %conv) #7, !dbg !255
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !256
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_good(), !dbg !257
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !258
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !259
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_bad(), !dbg !260
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !261
  ret i32 0, !dbg !262
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !263 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !264, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !266, metadata !DIExpression()), !dbg !267
  store i32* %data, i32** %dataPtr1, align 8, !dbg !267
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !268, metadata !DIExpression()), !dbg !269
  store i32* %data, i32** %dataPtr2, align 8, !dbg !269
  store i32 -1, i32* %data, align 4, !dbg !270
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !271, metadata !DIExpression()), !dbg !273
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !274
  %1 = load i32, i32* %0, align 4, !dbg !275
  store i32 %1, i32* %data1, align 4, !dbg !273
  store i32 7, i32* %data1, align 4, !dbg !276
  %2 = load i32, i32* %data1, align 4, !dbg !277
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !278
  store i32 %2, i32* %3, align 4, !dbg !279
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !280, metadata !DIExpression()), !dbg !282
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !283
  %5 = load i32, i32* %4, align 4, !dbg !284
  store i32 %5, i32* %data2, align 4, !dbg !282
  call void @llvm.dbg.declare(metadata i32* %i, metadata !285, metadata !DIExpression()), !dbg !287
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !288, metadata !DIExpression()), !dbg !289
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !289
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !289
  %7 = load i32, i32* %data2, align 4, !dbg !290
  %cmp = icmp sge i32 %7, 0, !dbg !292
  br i1 %cmp, label %if.then, label %if.else, !dbg !293

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !294
  %idxprom = sext i32 %8 to i64, !dbg !296
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !296
  store i32 1, i32* %arrayidx, align 4, !dbg !297
  store i32 0, i32* %i, align 4, !dbg !298
  br label %for.cond, !dbg !300

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !301
  %cmp3 = icmp slt i32 %9, 10, !dbg !303
  br i1 %cmp3, label %for.body, label %for.end, !dbg !304

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !305
  %idxprom4 = sext i32 %10 to i64, !dbg !307
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !307
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !307
  call void @printIntLine(i32 %11), !dbg !308
  br label %for.inc, !dbg !309

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !310
  %inc = add nsw i32 %12, 1, !dbg !310
  store i32 %inc, i32* %i, align 4, !dbg !310
  br label %for.cond, !dbg !311, !llvm.loop !312

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !314

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !315
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !317
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !318 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data34 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !319, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !321, metadata !DIExpression()), !dbg !322
  store i32* %data, i32** %dataPtr1, align 8, !dbg !322
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !323, metadata !DIExpression()), !dbg !324
  store i32* %data, i32** %dataPtr2, align 8, !dbg !324
  store i32 -1, i32* %data, align 4, !dbg !325
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !326, metadata !DIExpression()), !dbg !328
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !329
  %1 = load i32, i32* %0, align 4, !dbg !330
  store i32 %1, i32* %data1, align 4, !dbg !328
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !331, metadata !DIExpression()), !dbg !333
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !334, metadata !DIExpression()), !dbg !335
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !336, metadata !DIExpression()), !dbg !337
  store i32 -1, i32* %listenSocket, align 4, !dbg !337
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !338, metadata !DIExpression()), !dbg !339
  store i32 -1, i32* %acceptSocket, align 4, !dbg !339
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !340, metadata !DIExpression()), !dbg !341
  br label %do.body, !dbg !342

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !343
  store i32 %call, i32* %listenSocket, align 4, !dbg !345
  %2 = load i32, i32* %listenSocket, align 4, !dbg !346
  %cmp = icmp eq i32 %2, -1, !dbg !348
  br i1 %cmp, label %if.then, label %if.end, !dbg !349

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !350

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !352
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !352
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !353
  store i16 2, i16* %sin_family, align 4, !dbg !354
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !355
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !356
  store i32 0, i32* %s_addr, align 4, !dbg !357
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !358
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !359
  store i16 %call2, i16* %sin_port, align 2, !dbg !360
  %4 = load i32, i32* %listenSocket, align 4, !dbg !361
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !363
  %call3 = call i32 @bind(i32 %4, %struct.sockaddr* %5, i32 16) #7, !dbg !364
  %cmp4 = icmp eq i32 %call3, -1, !dbg !365
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !366

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !367

if.end6:                                          ; preds = %if.end
  %6 = load i32, i32* %listenSocket, align 4, !dbg !369
  %call7 = call i32 @listen(i32 %6, i32 5) #7, !dbg !371
  %cmp8 = icmp eq i32 %call7, -1, !dbg !372
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !373

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !374

if.end10:                                         ; preds = %if.end6
  %7 = load i32, i32* %listenSocket, align 4, !dbg !376
  %call11 = call i32 @accept(i32 %7, %struct.sockaddr* null, i32* null), !dbg !377
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !378
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !379
  %cmp12 = icmp eq i32 %8, -1, !dbg !381
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !382

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !383

if.end14:                                         ; preds = %if.end10
  %9 = load i32, i32* %acceptSocket, align 4, !dbg !385
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !386
  %call15 = call i64 @recv(i32 %9, i8* %arraydecay, i64 13, i32 0), !dbg !387
  %conv = trunc i64 %call15 to i32, !dbg !387
  store i32 %conv, i32* %recvResult, align 4, !dbg !388
  %10 = load i32, i32* %recvResult, align 4, !dbg !389
  %cmp16 = icmp eq i32 %10, -1, !dbg !391
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !392

lor.lhs.false:                                    ; preds = %if.end14
  %11 = load i32, i32* %recvResult, align 4, !dbg !393
  %cmp18 = icmp eq i32 %11, 0, !dbg !394
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !395

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !396

if.end21:                                         ; preds = %lor.lhs.false
  %12 = load i32, i32* %recvResult, align 4, !dbg !398
  %idxprom = sext i32 %12 to i64, !dbg !399
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !399
  store i8 0, i8* %arrayidx, align 1, !dbg !400
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !401
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !402
  store i32 %call23, i32* %data1, align 4, !dbg !403
  br label %do.end, !dbg !404

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %13 = load i32, i32* %listenSocket, align 4, !dbg !405
  %cmp24 = icmp ne i32 %13, -1, !dbg !407
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !408

if.then26:                                        ; preds = %do.end
  %14 = load i32, i32* %listenSocket, align 4, !dbg !409
  %call27 = call i32 @close(i32 %14), !dbg !411
  br label %if.end28, !dbg !412

if.end28:                                         ; preds = %if.then26, %do.end
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !413
  %cmp29 = icmp ne i32 %15, -1, !dbg !415
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !416

if.then31:                                        ; preds = %if.end28
  %16 = load i32, i32* %acceptSocket, align 4, !dbg !417
  %call32 = call i32 @close(i32 %16), !dbg !419
  br label %if.end33, !dbg !420

if.end33:                                         ; preds = %if.then31, %if.end28
  %17 = load i32, i32* %data1, align 4, !dbg !421
  %18 = load i32*, i32** %dataPtr1, align 8, !dbg !422
  store i32 %17, i32* %18, align 4, !dbg !423
  call void @llvm.dbg.declare(metadata i32* %data34, metadata !424, metadata !DIExpression()), !dbg !426
  %19 = load i32*, i32** %dataPtr2, align 8, !dbg !427
  %20 = load i32, i32* %19, align 4, !dbg !428
  store i32 %20, i32* %data34, align 4, !dbg !426
  call void @llvm.dbg.declare(metadata i32* %i, metadata !429, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !432, metadata !DIExpression()), !dbg !433
  %21 = bitcast [10 x i32]* %buffer to i8*, !dbg !433
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 40, i1 false), !dbg !433
  %22 = load i32, i32* %data34, align 4, !dbg !434
  %cmp35 = icmp sge i32 %22, 0, !dbg !436
  br i1 %cmp35, label %land.lhs.true, label %if.else, !dbg !437

land.lhs.true:                                    ; preds = %if.end33
  %23 = load i32, i32* %data34, align 4, !dbg !438
  %cmp37 = icmp slt i32 %23, 10, !dbg !439
  br i1 %cmp37, label %if.then39, label %if.else, !dbg !440

if.then39:                                        ; preds = %land.lhs.true
  %24 = load i32, i32* %data34, align 4, !dbg !441
  %idxprom40 = sext i32 %24 to i64, !dbg !443
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom40, !dbg !443
  store i32 1, i32* %arrayidx41, align 4, !dbg !444
  store i32 0, i32* %i, align 4, !dbg !445
  br label %for.cond, !dbg !447

for.cond:                                         ; preds = %for.inc, %if.then39
  %25 = load i32, i32* %i, align 4, !dbg !448
  %cmp42 = icmp slt i32 %25, 10, !dbg !450
  br i1 %cmp42, label %for.body, label %for.end, !dbg !451

for.body:                                         ; preds = %for.cond
  %26 = load i32, i32* %i, align 4, !dbg !452
  %idxprom44 = sext i32 %26 to i64, !dbg !454
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !454
  %27 = load i32, i32* %arrayidx45, align 4, !dbg !454
  call void @printIntLine(i32 %27), !dbg !455
  br label %for.inc, !dbg !456

for.inc:                                          ; preds = %for.body
  %28 = load i32, i32* %i, align 4, !dbg !457
  %inc = add nsw i32 %28, 1, !dbg !457
  store i32 %inc, i32* %i, align 4, !dbg !457
  br label %for.cond, !dbg !458, !llvm.loop !459

for.end:                                          ; preds = %for.cond
  br label %if.end46, !dbg !461

if.else:                                          ; preds = %land.lhs.true, %if.end33
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !462
  br label %if.end46

if.end46:                                         ; preds = %if.else, %for.end
  ret void, !dbg !464
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocalVariable(name: "dataPtr1", scope: !70, file: !71, line: 47, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!80 = !DILocation(line: 47, column: 10, scope: !70)
!81 = !DILocalVariable(name: "dataPtr2", scope: !70, file: !71, line: 48, type: !79)
!82 = !DILocation(line: 48, column: 10, scope: !70)
!83 = !DILocation(line: 50, column: 10, scope: !70)
!84 = !DILocalVariable(name: "data", scope: !85, file: !71, line: 52, type: !76)
!85 = distinct !DILexicalBlock(scope: !70, file: !71, line: 51, column: 5)
!86 = !DILocation(line: 52, column: 13, scope: !85)
!87 = !DILocation(line: 52, column: 21, scope: !85)
!88 = !DILocation(line: 52, column: 20, scope: !85)
!89 = !DILocalVariable(name: "recvResult", scope: !90, file: !71, line: 58, type: !76)
!90 = distinct !DILexicalBlock(scope: !85, file: !71, line: 53, column: 9)
!91 = !DILocation(line: 58, column: 17, scope: !90)
!92 = !DILocalVariable(name: "service", scope: !90, file: !71, line: 59, type: !93)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !94)
!94 = !{!95, !96, !100, !104}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !93, file: !17, line: 240, baseType: !56, size: 16)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !93, file: !17, line: 241, baseType: !97, size: 16, offset: 16)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !93, file: !17, line: 242, baseType: !101, size: 32, offset: 32)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !102)
!102 = !{!103}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !101, file: !17, line: 33, baseType: !46, size: 32)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !93, file: !17, line: 245, baseType: !105, size: 64, offset: 64)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 64, elements: !107)
!106 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!107 = !{!108}
!108 = !DISubrange(count: 8)
!109 = !DILocation(line: 59, column: 32, scope: !90)
!110 = !DILocalVariable(name: "listenSocket", scope: !90, file: !71, line: 60, type: !76)
!111 = !DILocation(line: 60, column: 20, scope: !90)
!112 = !DILocalVariable(name: "acceptSocket", scope: !90, file: !71, line: 61, type: !76)
!113 = !DILocation(line: 61, column: 20, scope: !90)
!114 = !DILocalVariable(name: "inputBuffer", scope: !90, file: !71, line: 62, type: !60)
!115 = !DILocation(line: 62, column: 18, scope: !90)
!116 = !DILocation(line: 63, column: 13, scope: !90)
!117 = !DILocation(line: 73, column: 32, scope: !118)
!118 = distinct !DILexicalBlock(scope: !90, file: !71, line: 64, column: 13)
!119 = !DILocation(line: 73, column: 30, scope: !118)
!120 = !DILocation(line: 74, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !71, line: 74, column: 21)
!122 = !DILocation(line: 74, column: 34, scope: !121)
!123 = !DILocation(line: 74, column: 21, scope: !118)
!124 = !DILocation(line: 76, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !71, line: 75, column: 17)
!126 = !DILocation(line: 78, column: 17, scope: !118)
!127 = !DILocation(line: 79, column: 25, scope: !118)
!128 = !DILocation(line: 79, column: 36, scope: !118)
!129 = !DILocation(line: 80, column: 25, scope: !118)
!130 = !DILocation(line: 80, column: 34, scope: !118)
!131 = !DILocation(line: 80, column: 41, scope: !118)
!132 = !DILocation(line: 81, column: 36, scope: !118)
!133 = !DILocation(line: 81, column: 25, scope: !118)
!134 = !DILocation(line: 81, column: 34, scope: !118)
!135 = !DILocation(line: 82, column: 26, scope: !136)
!136 = distinct !DILexicalBlock(scope: !118, file: !71, line: 82, column: 21)
!137 = !DILocation(line: 82, column: 40, scope: !136)
!138 = !DILocation(line: 82, column: 21, scope: !136)
!139 = !DILocation(line: 82, column: 85, scope: !136)
!140 = !DILocation(line: 82, column: 21, scope: !118)
!141 = !DILocation(line: 84, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !71, line: 83, column: 17)
!143 = !DILocation(line: 86, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !118, file: !71, line: 86, column: 21)
!145 = !DILocation(line: 86, column: 21, scope: !144)
!146 = !DILocation(line: 86, column: 58, scope: !144)
!147 = !DILocation(line: 86, column: 21, scope: !118)
!148 = !DILocation(line: 88, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !71, line: 87, column: 17)
!150 = !DILocation(line: 90, column: 39, scope: !118)
!151 = !DILocation(line: 90, column: 32, scope: !118)
!152 = !DILocation(line: 90, column: 30, scope: !118)
!153 = !DILocation(line: 91, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !118, file: !71, line: 91, column: 21)
!155 = !DILocation(line: 91, column: 34, scope: !154)
!156 = !DILocation(line: 91, column: 21, scope: !118)
!157 = !DILocation(line: 93, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !71, line: 92, column: 17)
!159 = !DILocation(line: 96, column: 35, scope: !118)
!160 = !DILocation(line: 96, column: 49, scope: !118)
!161 = !DILocation(line: 96, column: 30, scope: !118)
!162 = !DILocation(line: 96, column: 28, scope: !118)
!163 = !DILocation(line: 97, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !118, file: !71, line: 97, column: 21)
!165 = !DILocation(line: 97, column: 32, scope: !164)
!166 = !DILocation(line: 97, column: 48, scope: !164)
!167 = !DILocation(line: 97, column: 51, scope: !164)
!168 = !DILocation(line: 97, column: 62, scope: !164)
!169 = !DILocation(line: 97, column: 21, scope: !118)
!170 = !DILocation(line: 99, column: 21, scope: !171)
!171 = distinct !DILexicalBlock(scope: !164, file: !71, line: 98, column: 17)
!172 = !DILocation(line: 102, column: 29, scope: !118)
!173 = !DILocation(line: 102, column: 17, scope: !118)
!174 = !DILocation(line: 102, column: 41, scope: !118)
!175 = !DILocation(line: 104, column: 29, scope: !118)
!176 = !DILocation(line: 104, column: 24, scope: !118)
!177 = !DILocation(line: 104, column: 22, scope: !118)
!178 = !DILocation(line: 105, column: 13, scope: !118)
!179 = !DILocation(line: 107, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !90, file: !71, line: 107, column: 17)
!181 = !DILocation(line: 107, column: 30, scope: !180)
!182 = !DILocation(line: 107, column: 17, scope: !90)
!183 = !DILocation(line: 109, column: 30, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !71, line: 108, column: 13)
!185 = !DILocation(line: 109, column: 17, scope: !184)
!186 = !DILocation(line: 110, column: 13, scope: !184)
!187 = !DILocation(line: 111, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !90, file: !71, line: 111, column: 17)
!189 = !DILocation(line: 111, column: 30, scope: !188)
!190 = !DILocation(line: 111, column: 17, scope: !90)
!191 = !DILocation(line: 113, column: 30, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !71, line: 112, column: 13)
!193 = !DILocation(line: 113, column: 17, scope: !192)
!194 = !DILocation(line: 114, column: 13, scope: !192)
!195 = !DILocation(line: 122, column: 21, scope: !85)
!196 = !DILocation(line: 122, column: 10, scope: !85)
!197 = !DILocation(line: 122, column: 19, scope: !85)
!198 = !DILocalVariable(name: "data", scope: !199, file: !71, line: 125, type: !76)
!199 = distinct !DILexicalBlock(scope: !70, file: !71, line: 124, column: 5)
!200 = !DILocation(line: 125, column: 13, scope: !199)
!201 = !DILocation(line: 125, column: 21, scope: !199)
!202 = !DILocation(line: 125, column: 20, scope: !199)
!203 = !DILocalVariable(name: "i", scope: !204, file: !71, line: 127, type: !76)
!204 = distinct !DILexicalBlock(scope: !199, file: !71, line: 126, column: 9)
!205 = !DILocation(line: 127, column: 17, scope: !204)
!206 = !DILocalVariable(name: "buffer", scope: !204, file: !71, line: 128, type: !207)
!207 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !208)
!208 = !{!209}
!209 = !DISubrange(count: 10)
!210 = !DILocation(line: 128, column: 17, scope: !204)
!211 = !DILocation(line: 131, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !204, file: !71, line: 131, column: 17)
!213 = !DILocation(line: 131, column: 22, scope: !212)
!214 = !DILocation(line: 131, column: 17, scope: !204)
!215 = !DILocation(line: 133, column: 24, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !71, line: 132, column: 13)
!217 = !DILocation(line: 133, column: 17, scope: !216)
!218 = !DILocation(line: 133, column: 30, scope: !216)
!219 = !DILocation(line: 135, column: 23, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !71, line: 135, column: 17)
!221 = !DILocation(line: 135, column: 21, scope: !220)
!222 = !DILocation(line: 135, column: 28, scope: !223)
!223 = distinct !DILexicalBlock(scope: !220, file: !71, line: 135, column: 17)
!224 = !DILocation(line: 135, column: 30, scope: !223)
!225 = !DILocation(line: 135, column: 17, scope: !220)
!226 = !DILocation(line: 137, column: 41, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !71, line: 136, column: 17)
!228 = !DILocation(line: 137, column: 34, scope: !227)
!229 = !DILocation(line: 137, column: 21, scope: !227)
!230 = !DILocation(line: 138, column: 17, scope: !227)
!231 = !DILocation(line: 135, column: 37, scope: !223)
!232 = !DILocation(line: 135, column: 17, scope: !223)
!233 = distinct !{!233, !225, !234, !235}
!234 = !DILocation(line: 138, column: 17, scope: !220)
!235 = !{!"llvm.loop.mustprogress"}
!236 = !DILocation(line: 139, column: 13, scope: !216)
!237 = !DILocation(line: 142, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !212, file: !71, line: 141, column: 13)
!239 = !DILocation(line: 146, column: 1, scope: !70)
!240 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_good", scope: !71, file: !71, line: 295, type: !72, scopeLine: 296, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!241 = !DILocation(line: 297, column: 5, scope: !240)
!242 = !DILocation(line: 298, column: 5, scope: !240)
!243 = !DILocation(line: 299, column: 1, scope: !240)
!244 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 309, type: !245, scopeLine: 310, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!245 = !DISubroutineType(types: !246)
!246 = !{!76, !76, !247}
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !248, size: 64)
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!249 = !DILocalVariable(name: "argc", arg: 1, scope: !244, file: !71, line: 309, type: !76)
!250 = !DILocation(line: 309, column: 14, scope: !244)
!251 = !DILocalVariable(name: "argv", arg: 2, scope: !244, file: !71, line: 309, type: !247)
!252 = !DILocation(line: 309, column: 27, scope: !244)
!253 = !DILocation(line: 312, column: 22, scope: !244)
!254 = !DILocation(line: 312, column: 12, scope: !244)
!255 = !DILocation(line: 312, column: 5, scope: !244)
!256 = !DILocation(line: 314, column: 5, scope: !244)
!257 = !DILocation(line: 315, column: 5, scope: !244)
!258 = !DILocation(line: 316, column: 5, scope: !244)
!259 = !DILocation(line: 319, column: 5, scope: !244)
!260 = !DILocation(line: 320, column: 5, scope: !244)
!261 = !DILocation(line: 321, column: 5, scope: !244)
!262 = !DILocation(line: 323, column: 5, scope: !244)
!263 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 153, type: !72, scopeLine: 154, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!264 = !DILocalVariable(name: "data", scope: !263, file: !71, line: 155, type: !76)
!265 = !DILocation(line: 155, column: 9, scope: !263)
!266 = !DILocalVariable(name: "dataPtr1", scope: !263, file: !71, line: 156, type: !79)
!267 = !DILocation(line: 156, column: 10, scope: !263)
!268 = !DILocalVariable(name: "dataPtr2", scope: !263, file: !71, line: 157, type: !79)
!269 = !DILocation(line: 157, column: 10, scope: !263)
!270 = !DILocation(line: 159, column: 10, scope: !263)
!271 = !DILocalVariable(name: "data", scope: !272, file: !71, line: 161, type: !76)
!272 = distinct !DILexicalBlock(scope: !263, file: !71, line: 160, column: 5)
!273 = !DILocation(line: 161, column: 13, scope: !272)
!274 = !DILocation(line: 161, column: 21, scope: !272)
!275 = !DILocation(line: 161, column: 20, scope: !272)
!276 = !DILocation(line: 164, column: 14, scope: !272)
!277 = !DILocation(line: 165, column: 21, scope: !272)
!278 = !DILocation(line: 165, column: 10, scope: !272)
!279 = !DILocation(line: 165, column: 19, scope: !272)
!280 = !DILocalVariable(name: "data", scope: !281, file: !71, line: 168, type: !76)
!281 = distinct !DILexicalBlock(scope: !263, file: !71, line: 167, column: 5)
!282 = !DILocation(line: 168, column: 13, scope: !281)
!283 = !DILocation(line: 168, column: 21, scope: !281)
!284 = !DILocation(line: 168, column: 20, scope: !281)
!285 = !DILocalVariable(name: "i", scope: !286, file: !71, line: 170, type: !76)
!286 = distinct !DILexicalBlock(scope: !281, file: !71, line: 169, column: 9)
!287 = !DILocation(line: 170, column: 17, scope: !286)
!288 = !DILocalVariable(name: "buffer", scope: !286, file: !71, line: 171, type: !207)
!289 = !DILocation(line: 171, column: 17, scope: !286)
!290 = !DILocation(line: 174, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !286, file: !71, line: 174, column: 17)
!292 = !DILocation(line: 174, column: 22, scope: !291)
!293 = !DILocation(line: 174, column: 17, scope: !286)
!294 = !DILocation(line: 176, column: 24, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !71, line: 175, column: 13)
!296 = !DILocation(line: 176, column: 17, scope: !295)
!297 = !DILocation(line: 176, column: 30, scope: !295)
!298 = !DILocation(line: 178, column: 23, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !71, line: 178, column: 17)
!300 = !DILocation(line: 178, column: 21, scope: !299)
!301 = !DILocation(line: 178, column: 28, scope: !302)
!302 = distinct !DILexicalBlock(scope: !299, file: !71, line: 178, column: 17)
!303 = !DILocation(line: 178, column: 30, scope: !302)
!304 = !DILocation(line: 178, column: 17, scope: !299)
!305 = !DILocation(line: 180, column: 41, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !71, line: 179, column: 17)
!307 = !DILocation(line: 180, column: 34, scope: !306)
!308 = !DILocation(line: 180, column: 21, scope: !306)
!309 = !DILocation(line: 181, column: 17, scope: !306)
!310 = !DILocation(line: 178, column: 37, scope: !302)
!311 = !DILocation(line: 178, column: 17, scope: !302)
!312 = distinct !{!312, !304, !313, !235}
!313 = !DILocation(line: 181, column: 17, scope: !299)
!314 = !DILocation(line: 182, column: 13, scope: !295)
!315 = !DILocation(line: 185, column: 17, scope: !316)
!316 = distinct !DILexicalBlock(scope: !291, file: !71, line: 184, column: 13)
!317 = !DILocation(line: 189, column: 1, scope: !263)
!318 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 192, type: !72, scopeLine: 193, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!319 = !DILocalVariable(name: "data", scope: !318, file: !71, line: 194, type: !76)
!320 = !DILocation(line: 194, column: 9, scope: !318)
!321 = !DILocalVariable(name: "dataPtr1", scope: !318, file: !71, line: 195, type: !79)
!322 = !DILocation(line: 195, column: 10, scope: !318)
!323 = !DILocalVariable(name: "dataPtr2", scope: !318, file: !71, line: 196, type: !79)
!324 = !DILocation(line: 196, column: 10, scope: !318)
!325 = !DILocation(line: 198, column: 10, scope: !318)
!326 = !DILocalVariable(name: "data", scope: !327, file: !71, line: 200, type: !76)
!327 = distinct !DILexicalBlock(scope: !318, file: !71, line: 199, column: 5)
!328 = !DILocation(line: 200, column: 13, scope: !327)
!329 = !DILocation(line: 200, column: 21, scope: !327)
!330 = !DILocation(line: 200, column: 20, scope: !327)
!331 = !DILocalVariable(name: "recvResult", scope: !332, file: !71, line: 206, type: !76)
!332 = distinct !DILexicalBlock(scope: !327, file: !71, line: 201, column: 9)
!333 = !DILocation(line: 206, column: 17, scope: !332)
!334 = !DILocalVariable(name: "service", scope: !332, file: !71, line: 207, type: !93)
!335 = !DILocation(line: 207, column: 32, scope: !332)
!336 = !DILocalVariable(name: "listenSocket", scope: !332, file: !71, line: 208, type: !76)
!337 = !DILocation(line: 208, column: 20, scope: !332)
!338 = !DILocalVariable(name: "acceptSocket", scope: !332, file: !71, line: 209, type: !76)
!339 = !DILocation(line: 209, column: 20, scope: !332)
!340 = !DILocalVariable(name: "inputBuffer", scope: !332, file: !71, line: 210, type: !60)
!341 = !DILocation(line: 210, column: 18, scope: !332)
!342 = !DILocation(line: 211, column: 13, scope: !332)
!343 = !DILocation(line: 221, column: 32, scope: !344)
!344 = distinct !DILexicalBlock(scope: !332, file: !71, line: 212, column: 13)
!345 = !DILocation(line: 221, column: 30, scope: !344)
!346 = !DILocation(line: 222, column: 21, scope: !347)
!347 = distinct !DILexicalBlock(scope: !344, file: !71, line: 222, column: 21)
!348 = !DILocation(line: 222, column: 34, scope: !347)
!349 = !DILocation(line: 222, column: 21, scope: !344)
!350 = !DILocation(line: 224, column: 21, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !71, line: 223, column: 17)
!352 = !DILocation(line: 226, column: 17, scope: !344)
!353 = !DILocation(line: 227, column: 25, scope: !344)
!354 = !DILocation(line: 227, column: 36, scope: !344)
!355 = !DILocation(line: 228, column: 25, scope: !344)
!356 = !DILocation(line: 228, column: 34, scope: !344)
!357 = !DILocation(line: 228, column: 41, scope: !344)
!358 = !DILocation(line: 229, column: 36, scope: !344)
!359 = !DILocation(line: 229, column: 25, scope: !344)
!360 = !DILocation(line: 229, column: 34, scope: !344)
!361 = !DILocation(line: 230, column: 26, scope: !362)
!362 = distinct !DILexicalBlock(scope: !344, file: !71, line: 230, column: 21)
!363 = !DILocation(line: 230, column: 40, scope: !362)
!364 = !DILocation(line: 230, column: 21, scope: !362)
!365 = !DILocation(line: 230, column: 85, scope: !362)
!366 = !DILocation(line: 230, column: 21, scope: !344)
!367 = !DILocation(line: 232, column: 21, scope: !368)
!368 = distinct !DILexicalBlock(scope: !362, file: !71, line: 231, column: 17)
!369 = !DILocation(line: 234, column: 28, scope: !370)
!370 = distinct !DILexicalBlock(scope: !344, file: !71, line: 234, column: 21)
!371 = !DILocation(line: 234, column: 21, scope: !370)
!372 = !DILocation(line: 234, column: 58, scope: !370)
!373 = !DILocation(line: 234, column: 21, scope: !344)
!374 = !DILocation(line: 236, column: 21, scope: !375)
!375 = distinct !DILexicalBlock(scope: !370, file: !71, line: 235, column: 17)
!376 = !DILocation(line: 238, column: 39, scope: !344)
!377 = !DILocation(line: 238, column: 32, scope: !344)
!378 = !DILocation(line: 238, column: 30, scope: !344)
!379 = !DILocation(line: 239, column: 21, scope: !380)
!380 = distinct !DILexicalBlock(scope: !344, file: !71, line: 239, column: 21)
!381 = !DILocation(line: 239, column: 34, scope: !380)
!382 = !DILocation(line: 239, column: 21, scope: !344)
!383 = !DILocation(line: 241, column: 21, scope: !384)
!384 = distinct !DILexicalBlock(scope: !380, file: !71, line: 240, column: 17)
!385 = !DILocation(line: 244, column: 35, scope: !344)
!386 = !DILocation(line: 244, column: 49, scope: !344)
!387 = !DILocation(line: 244, column: 30, scope: !344)
!388 = !DILocation(line: 244, column: 28, scope: !344)
!389 = !DILocation(line: 245, column: 21, scope: !390)
!390 = distinct !DILexicalBlock(scope: !344, file: !71, line: 245, column: 21)
!391 = !DILocation(line: 245, column: 32, scope: !390)
!392 = !DILocation(line: 245, column: 48, scope: !390)
!393 = !DILocation(line: 245, column: 51, scope: !390)
!394 = !DILocation(line: 245, column: 62, scope: !390)
!395 = !DILocation(line: 245, column: 21, scope: !344)
!396 = !DILocation(line: 247, column: 21, scope: !397)
!397 = distinct !DILexicalBlock(scope: !390, file: !71, line: 246, column: 17)
!398 = !DILocation(line: 250, column: 29, scope: !344)
!399 = !DILocation(line: 250, column: 17, scope: !344)
!400 = !DILocation(line: 250, column: 41, scope: !344)
!401 = !DILocation(line: 252, column: 29, scope: !344)
!402 = !DILocation(line: 252, column: 24, scope: !344)
!403 = !DILocation(line: 252, column: 22, scope: !344)
!404 = !DILocation(line: 253, column: 13, scope: !344)
!405 = !DILocation(line: 255, column: 17, scope: !406)
!406 = distinct !DILexicalBlock(scope: !332, file: !71, line: 255, column: 17)
!407 = !DILocation(line: 255, column: 30, scope: !406)
!408 = !DILocation(line: 255, column: 17, scope: !332)
!409 = !DILocation(line: 257, column: 30, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !71, line: 256, column: 13)
!411 = !DILocation(line: 257, column: 17, scope: !410)
!412 = !DILocation(line: 258, column: 13, scope: !410)
!413 = !DILocation(line: 259, column: 17, scope: !414)
!414 = distinct !DILexicalBlock(scope: !332, file: !71, line: 259, column: 17)
!415 = !DILocation(line: 259, column: 30, scope: !414)
!416 = !DILocation(line: 259, column: 17, scope: !332)
!417 = !DILocation(line: 261, column: 30, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !71, line: 260, column: 13)
!419 = !DILocation(line: 261, column: 17, scope: !418)
!420 = !DILocation(line: 262, column: 13, scope: !418)
!421 = !DILocation(line: 270, column: 21, scope: !327)
!422 = !DILocation(line: 270, column: 10, scope: !327)
!423 = !DILocation(line: 270, column: 19, scope: !327)
!424 = !DILocalVariable(name: "data", scope: !425, file: !71, line: 273, type: !76)
!425 = distinct !DILexicalBlock(scope: !318, file: !71, line: 272, column: 5)
!426 = !DILocation(line: 273, column: 13, scope: !425)
!427 = !DILocation(line: 273, column: 21, scope: !425)
!428 = !DILocation(line: 273, column: 20, scope: !425)
!429 = !DILocalVariable(name: "i", scope: !430, file: !71, line: 275, type: !76)
!430 = distinct !DILexicalBlock(scope: !425, file: !71, line: 274, column: 9)
!431 = !DILocation(line: 275, column: 17, scope: !430)
!432 = !DILocalVariable(name: "buffer", scope: !430, file: !71, line: 276, type: !207)
!433 = !DILocation(line: 276, column: 17, scope: !430)
!434 = !DILocation(line: 278, column: 17, scope: !435)
!435 = distinct !DILexicalBlock(scope: !430, file: !71, line: 278, column: 17)
!436 = !DILocation(line: 278, column: 22, scope: !435)
!437 = !DILocation(line: 278, column: 27, scope: !435)
!438 = !DILocation(line: 278, column: 30, scope: !435)
!439 = !DILocation(line: 278, column: 35, scope: !435)
!440 = !DILocation(line: 278, column: 17, scope: !430)
!441 = !DILocation(line: 280, column: 24, scope: !442)
!442 = distinct !DILexicalBlock(scope: !435, file: !71, line: 279, column: 13)
!443 = !DILocation(line: 280, column: 17, scope: !442)
!444 = !DILocation(line: 280, column: 30, scope: !442)
!445 = !DILocation(line: 282, column: 23, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !71, line: 282, column: 17)
!447 = !DILocation(line: 282, column: 21, scope: !446)
!448 = !DILocation(line: 282, column: 28, scope: !449)
!449 = distinct !DILexicalBlock(scope: !446, file: !71, line: 282, column: 17)
!450 = !DILocation(line: 282, column: 30, scope: !449)
!451 = !DILocation(line: 282, column: 17, scope: !446)
!452 = !DILocation(line: 284, column: 41, scope: !453)
!453 = distinct !DILexicalBlock(scope: !449, file: !71, line: 283, column: 17)
!454 = !DILocation(line: 284, column: 34, scope: !453)
!455 = !DILocation(line: 284, column: 21, scope: !453)
!456 = !DILocation(line: 285, column: 17, scope: !453)
!457 = !DILocation(line: 282, column: 37, scope: !449)
!458 = !DILocation(line: 282, column: 17, scope: !449)
!459 = distinct !{!459, !451, !460, !235}
!460 = !DILocation(line: 285, column: 17, scope: !446)
!461 = !DILocation(line: 286, column: 13, scope: !442)
!462 = !DILocation(line: 289, column: 17, scope: !463)
!463 = distinct !DILexicalBlock(scope: !435, file: !71, line: 288, column: 13)
!464 = !DILocation(line: 293, column: 1, scope: !318)
