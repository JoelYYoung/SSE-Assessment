; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_17_bad() #0 !dbg !70 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %j, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32* %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 -1, i32* %data, align 4, !dbg !82
  store i32 0, i32* %i, align 4, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !86
  %cmp = icmp slt i32 %0, 1, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !90, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !94, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 -1, i32* %listenSocket, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 -1, i32* %acceptSocket, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  br label %do.body, !dbg !118

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !119
  store i32 %call, i32* %listenSocket, align 4, !dbg !121
  %1 = load i32, i32* %listenSocket, align 4, !dbg !122
  %cmp1 = icmp eq i32 %1, -1, !dbg !124
  br i1 %cmp1, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !126

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !128
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !129
  store i16 2, i16* %sin_family, align 4, !dbg !130
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !131
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !132
  store i32 0, i32* %s_addr, align 4, !dbg !133
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !134
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !135
  store i16 %call2, i16* %sin_port, align 2, !dbg !136
  %3 = load i32, i32* %listenSocket, align 4, !dbg !137
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !139
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !140
  %cmp4 = icmp eq i32 %call3, -1, !dbg !141
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !142

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !143

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !145
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !147
  %cmp8 = icmp eq i32 %call7, -1, !dbg !148
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !149

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !150

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !152
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !153
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !154
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !155
  %cmp12 = icmp eq i32 %7, -1, !dbg !157
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !158

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !159

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !161
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !162
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !163
  %conv = trunc i64 %call15 to i32, !dbg !163
  store i32 %conv, i32* %recvResult, align 4, !dbg !164
  %9 = load i32, i32* %recvResult, align 4, !dbg !165
  %cmp16 = icmp eq i32 %9, -1, !dbg !167
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !168

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !169
  %cmp18 = icmp eq i32 %10, 0, !dbg !170
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !171

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !172

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !174
  %idxprom = sext i32 %11 to i64, !dbg !175
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !175
  store i8 0, i8* %arrayidx, align 1, !dbg !176
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !177
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !178
  store i32 %call23, i32* %data, align 4, !dbg !179
  br label %do.end, !dbg !180

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %12 = load i32, i32* %listenSocket, align 4, !dbg !181
  %cmp24 = icmp ne i32 %12, -1, !dbg !183
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !184

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !185
  %call27 = call i32 @close(i32 %13), !dbg !187
  br label %if.end28, !dbg !188

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !189
  %cmp29 = icmp ne i32 %14, -1, !dbg !191
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !192

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !193
  %call32 = call i32 @close(i32 %15), !dbg !195
  br label %if.end33, !dbg !196

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %if.end33
  %16 = load i32, i32* %i, align 4, !dbg !198
  %inc = add nsw i32 %16, 1, !dbg !198
  store i32 %inc, i32* %i, align 4, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !203
  br label %for.cond34, !dbg !205

for.cond34:                                       ; preds = %for.inc44, %for.end
  %17 = load i32, i32* %j, align 4, !dbg !206
  %cmp35 = icmp slt i32 %17, 1, !dbg !208
  br i1 %cmp35, label %for.body37, label %for.end46, !dbg !209

for.body37:                                       ; preds = %for.cond34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !210, metadata !DIExpression()), !dbg !216
  %18 = bitcast [10 x i32]* %buffer to i8*, !dbg !216
  call void @llvm.memset.p0i8.i64(i8* align 16 %18, i8 0, i64 40, i1 false), !dbg !216
  %19 = load i32, i32* %data, align 4, !dbg !217
  %cmp38 = icmp sge i32 %19, 0, !dbg !219
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !220

if.then40:                                        ; preds = %for.body37
  %20 = load i32, i32* %data, align 4, !dbg !221
  %idxprom41 = sext i32 %20 to i64, !dbg !223
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !223
  %21 = load i32, i32* %arrayidx42, align 4, !dbg !223
  call void @printIntLine(i32 %21), !dbg !224
  br label %if.end43, !dbg !225

if.else:                                          ; preds = %for.body37
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !226
  br label %if.end43

if.end43:                                         ; preds = %if.else, %if.then40
  br label %for.inc44, !dbg !228

for.inc44:                                        ; preds = %if.end43
  %22 = load i32, i32* %j, align 4, !dbg !229
  %inc45 = add nsw i32 %22, 1, !dbg !229
  store i32 %inc45, i32* %j, align 4, !dbg !229
  br label %for.cond34, !dbg !230, !llvm.loop !231

for.end46:                                        ; preds = %for.cond34
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_17_good() #0 !dbg !234 {
entry:
  call void @goodB2G(), !dbg !235
  call void @goodG2B(), !dbg !236
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
  %call = call i64 @time(i64* null) #7, !dbg !247
  %conv = trunc i64 %call to i32, !dbg !248
  call void @srand(i32 %conv) #7, !dbg !249
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !250
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_17_good(), !dbg !251
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !252
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !253
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_17_bad(), !dbg !254
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !255
  ret i32 0, !dbg !256
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !257 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !258, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata i32* %k, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32* %data, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %data, align 4, !dbg !264
  store i32 0, i32* %i, align 4, !dbg !265
  br label %for.cond, !dbg !267

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !268
  %cmp = icmp slt i32 %0, 1, !dbg !270
  br i1 %cmp, label %for.body, label %for.end, !dbg !271

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !272, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !276, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !278, metadata !DIExpression()), !dbg !279
  store i32 -1, i32* %listenSocket, align 4, !dbg !279
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !280, metadata !DIExpression()), !dbg !281
  store i32 -1, i32* %acceptSocket, align 4, !dbg !281
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !282, metadata !DIExpression()), !dbg !283
  br label %do.body, !dbg !284

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !285
  store i32 %call, i32* %listenSocket, align 4, !dbg !287
  %1 = load i32, i32* %listenSocket, align 4, !dbg !288
  %cmp1 = icmp eq i32 %1, -1, !dbg !290
  br i1 %cmp1, label %if.then, label %if.end, !dbg !291

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !292

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !294
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !294
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !295
  store i16 2, i16* %sin_family, align 4, !dbg !296
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !297
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !298
  store i32 0, i32* %s_addr, align 4, !dbg !299
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !300
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !301
  store i16 %call2, i16* %sin_port, align 2, !dbg !302
  %3 = load i32, i32* %listenSocket, align 4, !dbg !303
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !305
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !306
  %cmp4 = icmp eq i32 %call3, -1, !dbg !307
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !308

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !309

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !311
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !313
  %cmp8 = icmp eq i32 %call7, -1, !dbg !314
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !315

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !316

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !318
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !319
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !320
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !321
  %cmp12 = icmp eq i32 %7, -1, !dbg !323
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !324

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !325

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !327
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !328
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !329
  %conv = trunc i64 %call15 to i32, !dbg !329
  store i32 %conv, i32* %recvResult, align 4, !dbg !330
  %9 = load i32, i32* %recvResult, align 4, !dbg !331
  %cmp16 = icmp eq i32 %9, -1, !dbg !333
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !334

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !335
  %cmp18 = icmp eq i32 %10, 0, !dbg !336
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !337

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !338

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !340
  %idxprom = sext i32 %11 to i64, !dbg !341
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !341
  store i8 0, i8* %arrayidx, align 1, !dbg !342
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !343
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !344
  store i32 %call23, i32* %data, align 4, !dbg !345
  br label %do.end, !dbg !346

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %12 = load i32, i32* %listenSocket, align 4, !dbg !347
  %cmp24 = icmp ne i32 %12, -1, !dbg !349
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !350

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !351
  %call27 = call i32 @close(i32 %13), !dbg !353
  br label %if.end28, !dbg !354

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !355
  %cmp29 = icmp ne i32 %14, -1, !dbg !357
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !358

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !359
  %call32 = call i32 @close(i32 %15), !dbg !361
  br label %if.end33, !dbg !362

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %for.inc, !dbg !363

for.inc:                                          ; preds = %if.end33
  %16 = load i32, i32* %i, align 4, !dbg !364
  %inc = add nsw i32 %16, 1, !dbg !364
  store i32 %inc, i32* %i, align 4, !dbg !364
  br label %for.cond, !dbg !365, !llvm.loop !366

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !368
  br label %for.cond34, !dbg !370

for.cond34:                                       ; preds = %for.inc46, %for.end
  %17 = load i32, i32* %k, align 4, !dbg !371
  %cmp35 = icmp slt i32 %17, 1, !dbg !373
  br i1 %cmp35, label %for.body37, label %for.end48, !dbg !374

for.body37:                                       ; preds = %for.cond34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !375, metadata !DIExpression()), !dbg !378
  %18 = bitcast [10 x i32]* %buffer to i8*, !dbg !378
  call void @llvm.memset.p0i8.i64(i8* align 16 %18, i8 0, i64 40, i1 false), !dbg !378
  %19 = load i32, i32* %data, align 4, !dbg !379
  %cmp38 = icmp sge i32 %19, 0, !dbg !381
  br i1 %cmp38, label %land.lhs.true, label %if.else, !dbg !382

land.lhs.true:                                    ; preds = %for.body37
  %20 = load i32, i32* %data, align 4, !dbg !383
  %cmp40 = icmp slt i32 %20, 10, !dbg !384
  br i1 %cmp40, label %if.then42, label %if.else, !dbg !385

if.then42:                                        ; preds = %land.lhs.true
  %21 = load i32, i32* %data, align 4, !dbg !386
  %idxprom43 = sext i32 %21 to i64, !dbg !388
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !388
  %22 = load i32, i32* %arrayidx44, align 4, !dbg !388
  call void @printIntLine(i32 %22), !dbg !389
  br label %if.end45, !dbg !390

if.else:                                          ; preds = %land.lhs.true, %for.body37
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !391
  br label %if.end45

if.end45:                                         ; preds = %if.else, %if.then42
  br label %for.inc46, !dbg !393

for.inc46:                                        ; preds = %if.end45
  %23 = load i32, i32* %k, align 4, !dbg !394
  %inc47 = add nsw i32 %23, 1, !dbg !394
  store i32 %inc47, i32* %k, align 4, !dbg !394
  br label %for.cond34, !dbg !395, !llvm.loop !396

for.end48:                                        ; preds = %for.cond34
  ret void, !dbg !398
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !399 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !400, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.declare(metadata i32* %j, metadata !402, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.declare(metadata i32* %data, metadata !404, metadata !DIExpression()), !dbg !405
  store i32 -1, i32* %data, align 4, !dbg !406
  store i32 0, i32* %h, align 4, !dbg !407
  br label %for.cond, !dbg !409

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !410
  %cmp = icmp slt i32 %0, 1, !dbg !412
  br i1 %cmp, label %for.body, label %for.end, !dbg !413

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !414
  br label %for.inc, !dbg !416

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !417
  %inc = add nsw i32 %1, 1, !dbg !417
  store i32 %inc, i32* %h, align 4, !dbg !417
  br label %for.cond, !dbg !418, !llvm.loop !419

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !421
  br label %for.cond1, !dbg !423

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !424
  %cmp2 = icmp slt i32 %2, 1, !dbg !426
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !427

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !428, metadata !DIExpression()), !dbg !431
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !431
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !431
  %4 = load i32, i32* %data, align 4, !dbg !432
  %cmp4 = icmp sge i32 %4, 0, !dbg !434
  br i1 %cmp4, label %if.then, label %if.else, !dbg !435

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !436
  %idxprom = sext i32 %5 to i64, !dbg !438
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !438
  %6 = load i32, i32* %arrayidx, align 4, !dbg !438
  call void @printIntLine(i32 %6), !dbg !439
  br label %if.end, !dbg !440

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !441
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc5, !dbg !443

for.inc5:                                         ; preds = %if.end
  %7 = load i32, i32* %j, align 4, !dbg !444
  %inc6 = add nsw i32 %7, 1, !dbg !444
  store i32 %inc6, i32* %j, align 4, !dbg !444
  br label %for.cond1, !dbg !445, !llvm.loop !446

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !448
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_17_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_17.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "i", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocalVariable(name: "j", scope: !70, file: !71, line: 46, type: !76)
!79 = !DILocation(line: 46, column: 11, scope: !70)
!80 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 47, type: !76)
!81 = !DILocation(line: 47, column: 9, scope: !70)
!82 = !DILocation(line: 49, column: 10, scope: !70)
!83 = !DILocation(line: 50, column: 11, scope: !84)
!84 = distinct !DILexicalBlock(scope: !70, file: !71, line: 50, column: 5)
!85 = !DILocation(line: 50, column: 9, scope: !84)
!86 = !DILocation(line: 50, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !71, line: 50, column: 5)
!88 = !DILocation(line: 50, column: 18, scope: !87)
!89 = !DILocation(line: 50, column: 5, scope: !84)
!90 = !DILocalVariable(name: "recvResult", scope: !91, file: !71, line: 57, type: !76)
!91 = distinct !DILexicalBlock(scope: !92, file: !71, line: 52, column: 9)
!92 = distinct !DILexicalBlock(scope: !87, file: !71, line: 51, column: 5)
!93 = !DILocation(line: 57, column: 17, scope: !91)
!94 = !DILocalVariable(name: "service", scope: !91, file: !71, line: 58, type: !95)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !96)
!96 = !{!97, !98, !102, !106}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !95, file: !17, line: 240, baseType: !56, size: 16)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !95, file: !17, line: 241, baseType: !99, size: 16, offset: 16)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !95, file: !17, line: 242, baseType: !103, size: 32, offset: 32)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !104)
!104 = !{!105}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !103, file: !17, line: 33, baseType: !46, size: 32)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !95, file: !17, line: 245, baseType: !107, size: 64, offset: 64)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !108, size: 64, elements: !109)
!108 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!109 = !{!110}
!110 = !DISubrange(count: 8)
!111 = !DILocation(line: 58, column: 32, scope: !91)
!112 = !DILocalVariable(name: "listenSocket", scope: !91, file: !71, line: 59, type: !76)
!113 = !DILocation(line: 59, column: 20, scope: !91)
!114 = !DILocalVariable(name: "acceptSocket", scope: !91, file: !71, line: 60, type: !76)
!115 = !DILocation(line: 60, column: 20, scope: !91)
!116 = !DILocalVariable(name: "inputBuffer", scope: !91, file: !71, line: 61, type: !60)
!117 = !DILocation(line: 61, column: 18, scope: !91)
!118 = !DILocation(line: 62, column: 13, scope: !91)
!119 = !DILocation(line: 72, column: 32, scope: !120)
!120 = distinct !DILexicalBlock(scope: !91, file: !71, line: 63, column: 13)
!121 = !DILocation(line: 72, column: 30, scope: !120)
!122 = !DILocation(line: 73, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !71, line: 73, column: 21)
!124 = !DILocation(line: 73, column: 34, scope: !123)
!125 = !DILocation(line: 73, column: 21, scope: !120)
!126 = !DILocation(line: 75, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !71, line: 74, column: 17)
!128 = !DILocation(line: 77, column: 17, scope: !120)
!129 = !DILocation(line: 78, column: 25, scope: !120)
!130 = !DILocation(line: 78, column: 36, scope: !120)
!131 = !DILocation(line: 79, column: 25, scope: !120)
!132 = !DILocation(line: 79, column: 34, scope: !120)
!133 = !DILocation(line: 79, column: 41, scope: !120)
!134 = !DILocation(line: 80, column: 36, scope: !120)
!135 = !DILocation(line: 80, column: 25, scope: !120)
!136 = !DILocation(line: 80, column: 34, scope: !120)
!137 = !DILocation(line: 81, column: 26, scope: !138)
!138 = distinct !DILexicalBlock(scope: !120, file: !71, line: 81, column: 21)
!139 = !DILocation(line: 81, column: 40, scope: !138)
!140 = !DILocation(line: 81, column: 21, scope: !138)
!141 = !DILocation(line: 81, column: 85, scope: !138)
!142 = !DILocation(line: 81, column: 21, scope: !120)
!143 = !DILocation(line: 83, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !71, line: 82, column: 17)
!145 = !DILocation(line: 85, column: 28, scope: !146)
!146 = distinct !DILexicalBlock(scope: !120, file: !71, line: 85, column: 21)
!147 = !DILocation(line: 85, column: 21, scope: !146)
!148 = !DILocation(line: 85, column: 58, scope: !146)
!149 = !DILocation(line: 85, column: 21, scope: !120)
!150 = !DILocation(line: 87, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !71, line: 86, column: 17)
!152 = !DILocation(line: 89, column: 39, scope: !120)
!153 = !DILocation(line: 89, column: 32, scope: !120)
!154 = !DILocation(line: 89, column: 30, scope: !120)
!155 = !DILocation(line: 90, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !120, file: !71, line: 90, column: 21)
!157 = !DILocation(line: 90, column: 34, scope: !156)
!158 = !DILocation(line: 90, column: 21, scope: !120)
!159 = !DILocation(line: 92, column: 21, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !71, line: 91, column: 17)
!161 = !DILocation(line: 95, column: 35, scope: !120)
!162 = !DILocation(line: 95, column: 49, scope: !120)
!163 = !DILocation(line: 95, column: 30, scope: !120)
!164 = !DILocation(line: 95, column: 28, scope: !120)
!165 = !DILocation(line: 96, column: 21, scope: !166)
!166 = distinct !DILexicalBlock(scope: !120, file: !71, line: 96, column: 21)
!167 = !DILocation(line: 96, column: 32, scope: !166)
!168 = !DILocation(line: 96, column: 48, scope: !166)
!169 = !DILocation(line: 96, column: 51, scope: !166)
!170 = !DILocation(line: 96, column: 62, scope: !166)
!171 = !DILocation(line: 96, column: 21, scope: !120)
!172 = !DILocation(line: 98, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !166, file: !71, line: 97, column: 17)
!174 = !DILocation(line: 101, column: 29, scope: !120)
!175 = !DILocation(line: 101, column: 17, scope: !120)
!176 = !DILocation(line: 101, column: 41, scope: !120)
!177 = !DILocation(line: 103, column: 29, scope: !120)
!178 = !DILocation(line: 103, column: 24, scope: !120)
!179 = !DILocation(line: 103, column: 22, scope: !120)
!180 = !DILocation(line: 104, column: 13, scope: !120)
!181 = !DILocation(line: 106, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !91, file: !71, line: 106, column: 17)
!183 = !DILocation(line: 106, column: 30, scope: !182)
!184 = !DILocation(line: 106, column: 17, scope: !91)
!185 = !DILocation(line: 108, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !71, line: 107, column: 13)
!187 = !DILocation(line: 108, column: 17, scope: !186)
!188 = !DILocation(line: 109, column: 13, scope: !186)
!189 = !DILocation(line: 110, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !91, file: !71, line: 110, column: 17)
!191 = !DILocation(line: 110, column: 30, scope: !190)
!192 = !DILocation(line: 110, column: 17, scope: !91)
!193 = !DILocation(line: 112, column: 30, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !71, line: 111, column: 13)
!195 = !DILocation(line: 112, column: 17, scope: !194)
!196 = !DILocation(line: 113, column: 13, scope: !194)
!197 = !DILocation(line: 121, column: 5, scope: !92)
!198 = !DILocation(line: 50, column: 24, scope: !87)
!199 = !DILocation(line: 50, column: 5, scope: !87)
!200 = distinct !{!200, !89, !201, !202}
!201 = !DILocation(line: 121, column: 5, scope: !84)
!202 = !{!"llvm.loop.mustprogress"}
!203 = !DILocation(line: 122, column: 11, scope: !204)
!204 = distinct !DILexicalBlock(scope: !70, file: !71, line: 122, column: 5)
!205 = !DILocation(line: 122, column: 9, scope: !204)
!206 = !DILocation(line: 122, column: 16, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !71, line: 122, column: 5)
!208 = !DILocation(line: 122, column: 18, scope: !207)
!209 = !DILocation(line: 122, column: 5, scope: !204)
!210 = !DILocalVariable(name: "buffer", scope: !211, file: !71, line: 125, type: !213)
!211 = distinct !DILexicalBlock(scope: !212, file: !71, line: 124, column: 9)
!212 = distinct !DILexicalBlock(scope: !207, file: !71, line: 123, column: 5)
!213 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !214)
!214 = !{!215}
!215 = !DISubrange(count: 10)
!216 = !DILocation(line: 125, column: 17, scope: !211)
!217 = !DILocation(line: 128, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !211, file: !71, line: 128, column: 17)
!219 = !DILocation(line: 128, column: 22, scope: !218)
!220 = !DILocation(line: 128, column: 17, scope: !211)
!221 = !DILocation(line: 130, column: 37, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !71, line: 129, column: 13)
!223 = !DILocation(line: 130, column: 30, scope: !222)
!224 = !DILocation(line: 130, column: 17, scope: !222)
!225 = !DILocation(line: 131, column: 13, scope: !222)
!226 = !DILocation(line: 134, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !218, file: !71, line: 133, column: 13)
!228 = !DILocation(line: 137, column: 5, scope: !212)
!229 = !DILocation(line: 122, column: 24, scope: !207)
!230 = !DILocation(line: 122, column: 5, scope: !207)
!231 = distinct !{!231, !209, !232, !202}
!232 = !DILocation(line: 137, column: 5, scope: !204)
!233 = !DILocation(line: 138, column: 1, scope: !70)
!234 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_17_good", scope: !71, file: !71, line: 271, type: !72, scopeLine: 272, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!235 = !DILocation(line: 273, column: 5, scope: !234)
!236 = !DILocation(line: 274, column: 5, scope: !234)
!237 = !DILocation(line: 275, column: 1, scope: !234)
!238 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 286, type: !239, scopeLine: 287, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!239 = !DISubroutineType(types: !240)
!240 = !{!76, !76, !241}
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!243 = !DILocalVariable(name: "argc", arg: 1, scope: !238, file: !71, line: 286, type: !76)
!244 = !DILocation(line: 286, column: 14, scope: !238)
!245 = !DILocalVariable(name: "argv", arg: 2, scope: !238, file: !71, line: 286, type: !241)
!246 = !DILocation(line: 286, column: 27, scope: !238)
!247 = !DILocation(line: 289, column: 22, scope: !238)
!248 = !DILocation(line: 289, column: 12, scope: !238)
!249 = !DILocation(line: 289, column: 5, scope: !238)
!250 = !DILocation(line: 291, column: 5, scope: !238)
!251 = !DILocation(line: 292, column: 5, scope: !238)
!252 = !DILocation(line: 293, column: 5, scope: !238)
!253 = !DILocation(line: 296, column: 5, scope: !238)
!254 = !DILocation(line: 297, column: 5, scope: !238)
!255 = !DILocation(line: 298, column: 5, scope: !238)
!256 = !DILocation(line: 300, column: 5, scope: !238)
!257 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 145, type: !72, scopeLine: 146, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!258 = !DILocalVariable(name: "i", scope: !257, file: !71, line: 147, type: !76)
!259 = !DILocation(line: 147, column: 9, scope: !257)
!260 = !DILocalVariable(name: "k", scope: !257, file: !71, line: 147, type: !76)
!261 = !DILocation(line: 147, column: 11, scope: !257)
!262 = !DILocalVariable(name: "data", scope: !257, file: !71, line: 148, type: !76)
!263 = !DILocation(line: 148, column: 9, scope: !257)
!264 = !DILocation(line: 150, column: 10, scope: !257)
!265 = !DILocation(line: 151, column: 11, scope: !266)
!266 = distinct !DILexicalBlock(scope: !257, file: !71, line: 151, column: 5)
!267 = !DILocation(line: 151, column: 9, scope: !266)
!268 = !DILocation(line: 151, column: 16, scope: !269)
!269 = distinct !DILexicalBlock(scope: !266, file: !71, line: 151, column: 5)
!270 = !DILocation(line: 151, column: 18, scope: !269)
!271 = !DILocation(line: 151, column: 5, scope: !266)
!272 = !DILocalVariable(name: "recvResult", scope: !273, file: !71, line: 158, type: !76)
!273 = distinct !DILexicalBlock(scope: !274, file: !71, line: 153, column: 9)
!274 = distinct !DILexicalBlock(scope: !269, file: !71, line: 152, column: 5)
!275 = !DILocation(line: 158, column: 17, scope: !273)
!276 = !DILocalVariable(name: "service", scope: !273, file: !71, line: 159, type: !95)
!277 = !DILocation(line: 159, column: 32, scope: !273)
!278 = !DILocalVariable(name: "listenSocket", scope: !273, file: !71, line: 160, type: !76)
!279 = !DILocation(line: 160, column: 20, scope: !273)
!280 = !DILocalVariable(name: "acceptSocket", scope: !273, file: !71, line: 161, type: !76)
!281 = !DILocation(line: 161, column: 20, scope: !273)
!282 = !DILocalVariable(name: "inputBuffer", scope: !273, file: !71, line: 162, type: !60)
!283 = !DILocation(line: 162, column: 18, scope: !273)
!284 = !DILocation(line: 163, column: 13, scope: !273)
!285 = !DILocation(line: 173, column: 32, scope: !286)
!286 = distinct !DILexicalBlock(scope: !273, file: !71, line: 164, column: 13)
!287 = !DILocation(line: 173, column: 30, scope: !286)
!288 = !DILocation(line: 174, column: 21, scope: !289)
!289 = distinct !DILexicalBlock(scope: !286, file: !71, line: 174, column: 21)
!290 = !DILocation(line: 174, column: 34, scope: !289)
!291 = !DILocation(line: 174, column: 21, scope: !286)
!292 = !DILocation(line: 176, column: 21, scope: !293)
!293 = distinct !DILexicalBlock(scope: !289, file: !71, line: 175, column: 17)
!294 = !DILocation(line: 178, column: 17, scope: !286)
!295 = !DILocation(line: 179, column: 25, scope: !286)
!296 = !DILocation(line: 179, column: 36, scope: !286)
!297 = !DILocation(line: 180, column: 25, scope: !286)
!298 = !DILocation(line: 180, column: 34, scope: !286)
!299 = !DILocation(line: 180, column: 41, scope: !286)
!300 = !DILocation(line: 181, column: 36, scope: !286)
!301 = !DILocation(line: 181, column: 25, scope: !286)
!302 = !DILocation(line: 181, column: 34, scope: !286)
!303 = !DILocation(line: 182, column: 26, scope: !304)
!304 = distinct !DILexicalBlock(scope: !286, file: !71, line: 182, column: 21)
!305 = !DILocation(line: 182, column: 40, scope: !304)
!306 = !DILocation(line: 182, column: 21, scope: !304)
!307 = !DILocation(line: 182, column: 85, scope: !304)
!308 = !DILocation(line: 182, column: 21, scope: !286)
!309 = !DILocation(line: 184, column: 21, scope: !310)
!310 = distinct !DILexicalBlock(scope: !304, file: !71, line: 183, column: 17)
!311 = !DILocation(line: 186, column: 28, scope: !312)
!312 = distinct !DILexicalBlock(scope: !286, file: !71, line: 186, column: 21)
!313 = !DILocation(line: 186, column: 21, scope: !312)
!314 = !DILocation(line: 186, column: 58, scope: !312)
!315 = !DILocation(line: 186, column: 21, scope: !286)
!316 = !DILocation(line: 188, column: 21, scope: !317)
!317 = distinct !DILexicalBlock(scope: !312, file: !71, line: 187, column: 17)
!318 = !DILocation(line: 190, column: 39, scope: !286)
!319 = !DILocation(line: 190, column: 32, scope: !286)
!320 = !DILocation(line: 190, column: 30, scope: !286)
!321 = !DILocation(line: 191, column: 21, scope: !322)
!322 = distinct !DILexicalBlock(scope: !286, file: !71, line: 191, column: 21)
!323 = !DILocation(line: 191, column: 34, scope: !322)
!324 = !DILocation(line: 191, column: 21, scope: !286)
!325 = !DILocation(line: 193, column: 21, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !71, line: 192, column: 17)
!327 = !DILocation(line: 196, column: 35, scope: !286)
!328 = !DILocation(line: 196, column: 49, scope: !286)
!329 = !DILocation(line: 196, column: 30, scope: !286)
!330 = !DILocation(line: 196, column: 28, scope: !286)
!331 = !DILocation(line: 197, column: 21, scope: !332)
!332 = distinct !DILexicalBlock(scope: !286, file: !71, line: 197, column: 21)
!333 = !DILocation(line: 197, column: 32, scope: !332)
!334 = !DILocation(line: 197, column: 48, scope: !332)
!335 = !DILocation(line: 197, column: 51, scope: !332)
!336 = !DILocation(line: 197, column: 62, scope: !332)
!337 = !DILocation(line: 197, column: 21, scope: !286)
!338 = !DILocation(line: 199, column: 21, scope: !339)
!339 = distinct !DILexicalBlock(scope: !332, file: !71, line: 198, column: 17)
!340 = !DILocation(line: 202, column: 29, scope: !286)
!341 = !DILocation(line: 202, column: 17, scope: !286)
!342 = !DILocation(line: 202, column: 41, scope: !286)
!343 = !DILocation(line: 204, column: 29, scope: !286)
!344 = !DILocation(line: 204, column: 24, scope: !286)
!345 = !DILocation(line: 204, column: 22, scope: !286)
!346 = !DILocation(line: 205, column: 13, scope: !286)
!347 = !DILocation(line: 207, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !273, file: !71, line: 207, column: 17)
!349 = !DILocation(line: 207, column: 30, scope: !348)
!350 = !DILocation(line: 207, column: 17, scope: !273)
!351 = !DILocation(line: 209, column: 30, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !71, line: 208, column: 13)
!353 = !DILocation(line: 209, column: 17, scope: !352)
!354 = !DILocation(line: 210, column: 13, scope: !352)
!355 = !DILocation(line: 211, column: 17, scope: !356)
!356 = distinct !DILexicalBlock(scope: !273, file: !71, line: 211, column: 17)
!357 = !DILocation(line: 211, column: 30, scope: !356)
!358 = !DILocation(line: 211, column: 17, scope: !273)
!359 = !DILocation(line: 213, column: 30, scope: !360)
!360 = distinct !DILexicalBlock(scope: !356, file: !71, line: 212, column: 13)
!361 = !DILocation(line: 213, column: 17, scope: !360)
!362 = !DILocation(line: 214, column: 13, scope: !360)
!363 = !DILocation(line: 222, column: 5, scope: !274)
!364 = !DILocation(line: 151, column: 24, scope: !269)
!365 = !DILocation(line: 151, column: 5, scope: !269)
!366 = distinct !{!366, !271, !367, !202}
!367 = !DILocation(line: 222, column: 5, scope: !266)
!368 = !DILocation(line: 223, column: 11, scope: !369)
!369 = distinct !DILexicalBlock(scope: !257, file: !71, line: 223, column: 5)
!370 = !DILocation(line: 223, column: 9, scope: !369)
!371 = !DILocation(line: 223, column: 16, scope: !372)
!372 = distinct !DILexicalBlock(scope: !369, file: !71, line: 223, column: 5)
!373 = !DILocation(line: 223, column: 18, scope: !372)
!374 = !DILocation(line: 223, column: 5, scope: !369)
!375 = !DILocalVariable(name: "buffer", scope: !376, file: !71, line: 226, type: !213)
!376 = distinct !DILexicalBlock(scope: !377, file: !71, line: 225, column: 9)
!377 = distinct !DILexicalBlock(scope: !372, file: !71, line: 224, column: 5)
!378 = !DILocation(line: 226, column: 17, scope: !376)
!379 = !DILocation(line: 228, column: 17, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !71, line: 228, column: 17)
!381 = !DILocation(line: 228, column: 22, scope: !380)
!382 = !DILocation(line: 228, column: 27, scope: !380)
!383 = !DILocation(line: 228, column: 30, scope: !380)
!384 = !DILocation(line: 228, column: 35, scope: !380)
!385 = !DILocation(line: 228, column: 17, scope: !376)
!386 = !DILocation(line: 230, column: 37, scope: !387)
!387 = distinct !DILexicalBlock(scope: !380, file: !71, line: 229, column: 13)
!388 = !DILocation(line: 230, column: 30, scope: !387)
!389 = !DILocation(line: 230, column: 17, scope: !387)
!390 = !DILocation(line: 231, column: 13, scope: !387)
!391 = !DILocation(line: 234, column: 17, scope: !392)
!392 = distinct !DILexicalBlock(scope: !380, file: !71, line: 233, column: 13)
!393 = !DILocation(line: 237, column: 5, scope: !377)
!394 = !DILocation(line: 223, column: 24, scope: !372)
!395 = !DILocation(line: 223, column: 5, scope: !372)
!396 = distinct !{!396, !374, !397, !202}
!397 = !DILocation(line: 237, column: 5, scope: !369)
!398 = !DILocation(line: 238, column: 1, scope: !257)
!399 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 241, type: !72, scopeLine: 242, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!400 = !DILocalVariable(name: "h", scope: !399, file: !71, line: 243, type: !76)
!401 = !DILocation(line: 243, column: 9, scope: !399)
!402 = !DILocalVariable(name: "j", scope: !399, file: !71, line: 243, type: !76)
!403 = !DILocation(line: 243, column: 11, scope: !399)
!404 = !DILocalVariable(name: "data", scope: !399, file: !71, line: 244, type: !76)
!405 = !DILocation(line: 244, column: 9, scope: !399)
!406 = !DILocation(line: 246, column: 10, scope: !399)
!407 = !DILocation(line: 247, column: 11, scope: !408)
!408 = distinct !DILexicalBlock(scope: !399, file: !71, line: 247, column: 5)
!409 = !DILocation(line: 247, column: 9, scope: !408)
!410 = !DILocation(line: 247, column: 16, scope: !411)
!411 = distinct !DILexicalBlock(scope: !408, file: !71, line: 247, column: 5)
!412 = !DILocation(line: 247, column: 18, scope: !411)
!413 = !DILocation(line: 247, column: 5, scope: !408)
!414 = !DILocation(line: 251, column: 14, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !71, line: 248, column: 5)
!416 = !DILocation(line: 252, column: 5, scope: !415)
!417 = !DILocation(line: 247, column: 24, scope: !411)
!418 = !DILocation(line: 247, column: 5, scope: !411)
!419 = distinct !{!419, !413, !420, !202}
!420 = !DILocation(line: 252, column: 5, scope: !408)
!421 = !DILocation(line: 253, column: 11, scope: !422)
!422 = distinct !DILexicalBlock(scope: !399, file: !71, line: 253, column: 5)
!423 = !DILocation(line: 253, column: 9, scope: !422)
!424 = !DILocation(line: 253, column: 16, scope: !425)
!425 = distinct !DILexicalBlock(scope: !422, file: !71, line: 253, column: 5)
!426 = !DILocation(line: 253, column: 18, scope: !425)
!427 = !DILocation(line: 253, column: 5, scope: !422)
!428 = !DILocalVariable(name: "buffer", scope: !429, file: !71, line: 256, type: !213)
!429 = distinct !DILexicalBlock(scope: !430, file: !71, line: 255, column: 9)
!430 = distinct !DILexicalBlock(scope: !425, file: !71, line: 254, column: 5)
!431 = !DILocation(line: 256, column: 17, scope: !429)
!432 = !DILocation(line: 259, column: 17, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !71, line: 259, column: 17)
!434 = !DILocation(line: 259, column: 22, scope: !433)
!435 = !DILocation(line: 259, column: 17, scope: !429)
!436 = !DILocation(line: 261, column: 37, scope: !437)
!437 = distinct !DILexicalBlock(scope: !433, file: !71, line: 260, column: 13)
!438 = !DILocation(line: 261, column: 30, scope: !437)
!439 = !DILocation(line: 261, column: 17, scope: !437)
!440 = !DILocation(line: 262, column: 13, scope: !437)
!441 = !DILocation(line: 265, column: 17, scope: !442)
!442 = distinct !DILexicalBlock(scope: !433, file: !71, line: 264, column: 13)
!443 = !DILocation(line: 268, column: 5, scope: !430)
!444 = !DILocation(line: 253, column: 24, scope: !425)
!445 = !DILocation(line: 253, column: 5, scope: !425)
!446 = distinct !{!446, !427, !447, !202}
!447 = !DILocation(line: 268, column: 5, scope: !422)
!448 = !DILocation(line: 269, column: 1, scope: !399)
