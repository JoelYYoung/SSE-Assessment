; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_17.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_17.c"
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_17_bad() #0 !dbg !70 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i38 = alloca i32, align 4
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

for.cond34:                                       ; preds = %for.inc54, %for.end
  %17 = load i32, i32* %j, align 4, !dbg !206
  %cmp35 = icmp slt i32 %17, 1, !dbg !208
  br i1 %cmp35, label %for.body37, label %for.end56, !dbg !209

for.body37:                                       ; preds = %for.cond34
  call void @llvm.dbg.declare(metadata i32* %i38, metadata !210, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !214, metadata !DIExpression()), !dbg !218
  %18 = bitcast [10 x i32]* %buffer to i8*, !dbg !218
  call void @llvm.memset.p0i8.i64(i8* align 16 %18, i8 0, i64 40, i1 false), !dbg !218
  %19 = load i32, i32* %data, align 4, !dbg !219
  %cmp39 = icmp slt i32 %19, 10, !dbg !221
  br i1 %cmp39, label %if.then41, label %if.else, !dbg !222

if.then41:                                        ; preds = %for.body37
  %20 = load i32, i32* %data, align 4, !dbg !223
  %idxprom42 = sext i32 %20 to i64, !dbg !225
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !225
  store i32 1, i32* %arrayidx43, align 4, !dbg !226
  store i32 0, i32* %i38, align 4, !dbg !227
  br label %for.cond44, !dbg !229

for.cond44:                                       ; preds = %for.inc50, %if.then41
  %21 = load i32, i32* %i38, align 4, !dbg !230
  %cmp45 = icmp slt i32 %21, 10, !dbg !232
  br i1 %cmp45, label %for.body47, label %for.end52, !dbg !233

for.body47:                                       ; preds = %for.cond44
  %22 = load i32, i32* %i38, align 4, !dbg !234
  %idxprom48 = sext i32 %22 to i64, !dbg !236
  %arrayidx49 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom48, !dbg !236
  %23 = load i32, i32* %arrayidx49, align 4, !dbg !236
  call void @printIntLine(i32 %23), !dbg !237
  br label %for.inc50, !dbg !238

for.inc50:                                        ; preds = %for.body47
  %24 = load i32, i32* %i38, align 4, !dbg !239
  %inc51 = add nsw i32 %24, 1, !dbg !239
  store i32 %inc51, i32* %i38, align 4, !dbg !239
  br label %for.cond44, !dbg !240, !llvm.loop !241

for.end52:                                        ; preds = %for.cond44
  br label %if.end53, !dbg !243

if.else:                                          ; preds = %for.body37
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !244
  br label %if.end53

if.end53:                                         ; preds = %if.else, %for.end52
  br label %for.inc54, !dbg !246

for.inc54:                                        ; preds = %if.end53
  %25 = load i32, i32* %j, align 4, !dbg !247
  %inc55 = add nsw i32 %25, 1, !dbg !247
  store i32 %inc55, i32* %j, align 4, !dbg !247
  br label %for.cond34, !dbg !248, !llvm.loop !249

for.end56:                                        ; preds = %for.cond34
  ret void, !dbg !251
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_17_good() #0 !dbg !252 {
entry:
  call void @goodB2G(), !dbg !253
  call void @goodG2B(), !dbg !254
  ret void, !dbg !255
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !256 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !261, metadata !DIExpression()), !dbg !262
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !263, metadata !DIExpression()), !dbg !264
  %call = call i64 @time(i64* null) #7, !dbg !265
  %conv = trunc i64 %call to i32, !dbg !266
  call void @srand(i32 %conv) #7, !dbg !267
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !268
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_17_good(), !dbg !269
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !270
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !271
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_17_bad(), !dbg !272
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !273
  ret i32 0, !dbg !274
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !275 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i38 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !276, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata i32* %k, metadata !278, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.declare(metadata i32* %data, metadata !280, metadata !DIExpression()), !dbg !281
  store i32 -1, i32* %data, align 4, !dbg !282
  store i32 0, i32* %i, align 4, !dbg !283
  br label %for.cond, !dbg !285

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !286
  %cmp = icmp slt i32 %0, 1, !dbg !288
  br i1 %cmp, label %for.body, label %for.end, !dbg !289

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !290, metadata !DIExpression()), !dbg !293
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !294, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !296, metadata !DIExpression()), !dbg !297
  store i32 -1, i32* %listenSocket, align 4, !dbg !297
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !298, metadata !DIExpression()), !dbg !299
  store i32 -1, i32* %acceptSocket, align 4, !dbg !299
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !300, metadata !DIExpression()), !dbg !301
  br label %do.body, !dbg !302

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !303
  store i32 %call, i32* %listenSocket, align 4, !dbg !305
  %1 = load i32, i32* %listenSocket, align 4, !dbg !306
  %cmp1 = icmp eq i32 %1, -1, !dbg !308
  br i1 %cmp1, label %if.then, label %if.end, !dbg !309

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !310

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !312
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !312
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !313
  store i16 2, i16* %sin_family, align 4, !dbg !314
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !315
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !316
  store i32 0, i32* %s_addr, align 4, !dbg !317
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !318
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !319
  store i16 %call2, i16* %sin_port, align 2, !dbg !320
  %3 = load i32, i32* %listenSocket, align 4, !dbg !321
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !323
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !324
  %cmp4 = icmp eq i32 %call3, -1, !dbg !325
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !326

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !327

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !329
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !331
  %cmp8 = icmp eq i32 %call7, -1, !dbg !332
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !333

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !334

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !336
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !337
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !338
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !339
  %cmp12 = icmp eq i32 %7, -1, !dbg !341
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !342

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !343

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !345
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !346
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !347
  %conv = trunc i64 %call15 to i32, !dbg !347
  store i32 %conv, i32* %recvResult, align 4, !dbg !348
  %9 = load i32, i32* %recvResult, align 4, !dbg !349
  %cmp16 = icmp eq i32 %9, -1, !dbg !351
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !352

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !353
  %cmp18 = icmp eq i32 %10, 0, !dbg !354
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !355

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !356

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !358
  %idxprom = sext i32 %11 to i64, !dbg !359
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !359
  store i8 0, i8* %arrayidx, align 1, !dbg !360
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !361
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !362
  store i32 %call23, i32* %data, align 4, !dbg !363
  br label %do.end, !dbg !364

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %12 = load i32, i32* %listenSocket, align 4, !dbg !365
  %cmp24 = icmp ne i32 %12, -1, !dbg !367
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !368

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !369
  %call27 = call i32 @close(i32 %13), !dbg !371
  br label %if.end28, !dbg !372

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !373
  %cmp29 = icmp ne i32 %14, -1, !dbg !375
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !376

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !377
  %call32 = call i32 @close(i32 %15), !dbg !379
  br label %if.end33, !dbg !380

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %for.inc, !dbg !381

for.inc:                                          ; preds = %if.end33
  %16 = load i32, i32* %i, align 4, !dbg !382
  %inc = add nsw i32 %16, 1, !dbg !382
  store i32 %inc, i32* %i, align 4, !dbg !382
  br label %for.cond, !dbg !383, !llvm.loop !384

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !386
  br label %for.cond34, !dbg !388

for.cond34:                                       ; preds = %for.inc56, %for.end
  %17 = load i32, i32* %k, align 4, !dbg !389
  %cmp35 = icmp slt i32 %17, 1, !dbg !391
  br i1 %cmp35, label %for.body37, label %for.end58, !dbg !392

for.body37:                                       ; preds = %for.cond34
  call void @llvm.dbg.declare(metadata i32* %i38, metadata !393, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !397, metadata !DIExpression()), !dbg !398
  %18 = bitcast [10 x i32]* %buffer to i8*, !dbg !398
  call void @llvm.memset.p0i8.i64(i8* align 16 %18, i8 0, i64 40, i1 false), !dbg !398
  %19 = load i32, i32* %data, align 4, !dbg !399
  %cmp39 = icmp sge i32 %19, 0, !dbg !401
  br i1 %cmp39, label %land.lhs.true, label %if.else, !dbg !402

land.lhs.true:                                    ; preds = %for.body37
  %20 = load i32, i32* %data, align 4, !dbg !403
  %cmp41 = icmp slt i32 %20, 10, !dbg !404
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !405

if.then43:                                        ; preds = %land.lhs.true
  %21 = load i32, i32* %data, align 4, !dbg !406
  %idxprom44 = sext i32 %21 to i64, !dbg !408
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !408
  store i32 1, i32* %arrayidx45, align 4, !dbg !409
  store i32 0, i32* %i38, align 4, !dbg !410
  br label %for.cond46, !dbg !412

for.cond46:                                       ; preds = %for.inc52, %if.then43
  %22 = load i32, i32* %i38, align 4, !dbg !413
  %cmp47 = icmp slt i32 %22, 10, !dbg !415
  br i1 %cmp47, label %for.body49, label %for.end54, !dbg !416

for.body49:                                       ; preds = %for.cond46
  %23 = load i32, i32* %i38, align 4, !dbg !417
  %idxprom50 = sext i32 %23 to i64, !dbg !419
  %arrayidx51 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom50, !dbg !419
  %24 = load i32, i32* %arrayidx51, align 4, !dbg !419
  call void @printIntLine(i32 %24), !dbg !420
  br label %for.inc52, !dbg !421

for.inc52:                                        ; preds = %for.body49
  %25 = load i32, i32* %i38, align 4, !dbg !422
  %inc53 = add nsw i32 %25, 1, !dbg !422
  store i32 %inc53, i32* %i38, align 4, !dbg !422
  br label %for.cond46, !dbg !423, !llvm.loop !424

for.end54:                                        ; preds = %for.cond46
  br label %if.end55, !dbg !426

if.else:                                          ; preds = %land.lhs.true, %for.body37
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !427
  br label %if.end55

if.end55:                                         ; preds = %if.else, %for.end54
  br label %for.inc56, !dbg !429

for.inc56:                                        ; preds = %if.end55
  %26 = load i32, i32* %k, align 4, !dbg !430
  %inc57 = add nsw i32 %26, 1, !dbg !430
  store i32 %inc57, i32* %k, align 4, !dbg !430
  br label %for.cond34, !dbg !431, !llvm.loop !432

for.end58:                                        ; preds = %for.cond34
  ret void, !dbg !434
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !435 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !436, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.declare(metadata i32* %j, metadata !438, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.declare(metadata i32* %data, metadata !440, metadata !DIExpression()), !dbg !441
  store i32 -1, i32* %data, align 4, !dbg !442
  store i32 0, i32* %h, align 4, !dbg !443
  br label %for.cond, !dbg !445

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !446
  %cmp = icmp slt i32 %0, 1, !dbg !448
  br i1 %cmp, label %for.body, label %for.end, !dbg !449

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !450
  br label %for.inc, !dbg !452

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !453
  %inc = add nsw i32 %1, 1, !dbg !453
  store i32 %inc, i32* %h, align 4, !dbg !453
  br label %for.cond, !dbg !454, !llvm.loop !455

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !457
  br label %for.cond1, !dbg !459

for.cond1:                                        ; preds = %for.inc13, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !460
  %cmp2 = icmp slt i32 %2, 1, !dbg !462
  br i1 %cmp2, label %for.body3, label %for.end15, !dbg !463

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !464, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !468, metadata !DIExpression()), !dbg !469
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !469
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !469
  %4 = load i32, i32* %data, align 4, !dbg !470
  %cmp4 = icmp slt i32 %4, 10, !dbg !472
  br i1 %cmp4, label %if.then, label %if.else, !dbg !473

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !474
  %idxprom = sext i32 %5 to i64, !dbg !476
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !476
  store i32 1, i32* %arrayidx, align 4, !dbg !477
  store i32 0, i32* %i, align 4, !dbg !478
  br label %for.cond5, !dbg !480

for.cond5:                                        ; preds = %for.inc10, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !481
  %cmp6 = icmp slt i32 %6, 10, !dbg !483
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !484

for.body7:                                        ; preds = %for.cond5
  %7 = load i32, i32* %i, align 4, !dbg !485
  %idxprom8 = sext i32 %7 to i64, !dbg !487
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !487
  %8 = load i32, i32* %arrayidx9, align 4, !dbg !487
  call void @printIntLine(i32 %8), !dbg !488
  br label %for.inc10, !dbg !489

for.inc10:                                        ; preds = %for.body7
  %9 = load i32, i32* %i, align 4, !dbg !490
  %inc11 = add nsw i32 %9, 1, !dbg !490
  store i32 %inc11, i32* %i, align 4, !dbg !490
  br label %for.cond5, !dbg !491, !llvm.loop !492

for.end12:                                        ; preds = %for.cond5
  br label %if.end, !dbg !494

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !495
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end12
  br label %for.inc13, !dbg !497

for.inc13:                                        ; preds = %if.end
  %10 = load i32, i32* %j, align 4, !dbg !498
  %inc14 = add nsw i32 %10, 1, !dbg !498
  store i32 %inc14, i32* %j, align 4, !dbg !498
  br label %for.cond1, !dbg !499, !llvm.loop !500

for.end15:                                        ; preds = %for.cond1
  ret void, !dbg !502
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_17_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!210 = !DILocalVariable(name: "i", scope: !211, file: !71, line: 125, type: !76)
!211 = distinct !DILexicalBlock(scope: !212, file: !71, line: 124, column: 9)
!212 = distinct !DILexicalBlock(scope: !207, file: !71, line: 123, column: 5)
!213 = !DILocation(line: 125, column: 17, scope: !211)
!214 = !DILocalVariable(name: "buffer", scope: !211, file: !71, line: 126, type: !215)
!215 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !216)
!216 = !{!217}
!217 = !DISubrange(count: 10)
!218 = !DILocation(line: 126, column: 17, scope: !211)
!219 = !DILocation(line: 129, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !211, file: !71, line: 129, column: 17)
!221 = !DILocation(line: 129, column: 22, scope: !220)
!222 = !DILocation(line: 129, column: 17, scope: !211)
!223 = !DILocation(line: 131, column: 24, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !71, line: 130, column: 13)
!225 = !DILocation(line: 131, column: 17, scope: !224)
!226 = !DILocation(line: 131, column: 30, scope: !224)
!227 = !DILocation(line: 133, column: 23, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !71, line: 133, column: 17)
!229 = !DILocation(line: 133, column: 21, scope: !228)
!230 = !DILocation(line: 133, column: 28, scope: !231)
!231 = distinct !DILexicalBlock(scope: !228, file: !71, line: 133, column: 17)
!232 = !DILocation(line: 133, column: 30, scope: !231)
!233 = !DILocation(line: 133, column: 17, scope: !228)
!234 = !DILocation(line: 135, column: 41, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !71, line: 134, column: 17)
!236 = !DILocation(line: 135, column: 34, scope: !235)
!237 = !DILocation(line: 135, column: 21, scope: !235)
!238 = !DILocation(line: 136, column: 17, scope: !235)
!239 = !DILocation(line: 133, column: 37, scope: !231)
!240 = !DILocation(line: 133, column: 17, scope: !231)
!241 = distinct !{!241, !233, !242, !202}
!242 = !DILocation(line: 136, column: 17, scope: !228)
!243 = !DILocation(line: 137, column: 13, scope: !224)
!244 = !DILocation(line: 140, column: 17, scope: !245)
!245 = distinct !DILexicalBlock(scope: !220, file: !71, line: 139, column: 13)
!246 = !DILocation(line: 143, column: 5, scope: !212)
!247 = !DILocation(line: 122, column: 24, scope: !207)
!248 = !DILocation(line: 122, column: 5, scope: !207)
!249 = distinct !{!249, !209, !250, !202}
!250 = !DILocation(line: 143, column: 5, scope: !204)
!251 = !DILocation(line: 144, column: 1, scope: !70)
!252 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_17_good", scope: !71, file: !71, line: 289, type: !72, scopeLine: 290, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!253 = !DILocation(line: 291, column: 5, scope: !252)
!254 = !DILocation(line: 292, column: 5, scope: !252)
!255 = !DILocation(line: 293, column: 1, scope: !252)
!256 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 304, type: !257, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!257 = !DISubroutineType(types: !258)
!258 = !{!76, !76, !259}
!259 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !260, size: 64)
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!261 = !DILocalVariable(name: "argc", arg: 1, scope: !256, file: !71, line: 304, type: !76)
!262 = !DILocation(line: 304, column: 14, scope: !256)
!263 = !DILocalVariable(name: "argv", arg: 2, scope: !256, file: !71, line: 304, type: !259)
!264 = !DILocation(line: 304, column: 27, scope: !256)
!265 = !DILocation(line: 307, column: 22, scope: !256)
!266 = !DILocation(line: 307, column: 12, scope: !256)
!267 = !DILocation(line: 307, column: 5, scope: !256)
!268 = !DILocation(line: 309, column: 5, scope: !256)
!269 = !DILocation(line: 310, column: 5, scope: !256)
!270 = !DILocation(line: 311, column: 5, scope: !256)
!271 = !DILocation(line: 314, column: 5, scope: !256)
!272 = !DILocation(line: 315, column: 5, scope: !256)
!273 = !DILocation(line: 316, column: 5, scope: !256)
!274 = !DILocation(line: 318, column: 5, scope: !256)
!275 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 151, type: !72, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!276 = !DILocalVariable(name: "i", scope: !275, file: !71, line: 153, type: !76)
!277 = !DILocation(line: 153, column: 9, scope: !275)
!278 = !DILocalVariable(name: "k", scope: !275, file: !71, line: 153, type: !76)
!279 = !DILocation(line: 153, column: 11, scope: !275)
!280 = !DILocalVariable(name: "data", scope: !275, file: !71, line: 154, type: !76)
!281 = !DILocation(line: 154, column: 9, scope: !275)
!282 = !DILocation(line: 156, column: 10, scope: !275)
!283 = !DILocation(line: 157, column: 11, scope: !284)
!284 = distinct !DILexicalBlock(scope: !275, file: !71, line: 157, column: 5)
!285 = !DILocation(line: 157, column: 9, scope: !284)
!286 = !DILocation(line: 157, column: 16, scope: !287)
!287 = distinct !DILexicalBlock(scope: !284, file: !71, line: 157, column: 5)
!288 = !DILocation(line: 157, column: 18, scope: !287)
!289 = !DILocation(line: 157, column: 5, scope: !284)
!290 = !DILocalVariable(name: "recvResult", scope: !291, file: !71, line: 164, type: !76)
!291 = distinct !DILexicalBlock(scope: !292, file: !71, line: 159, column: 9)
!292 = distinct !DILexicalBlock(scope: !287, file: !71, line: 158, column: 5)
!293 = !DILocation(line: 164, column: 17, scope: !291)
!294 = !DILocalVariable(name: "service", scope: !291, file: !71, line: 165, type: !95)
!295 = !DILocation(line: 165, column: 32, scope: !291)
!296 = !DILocalVariable(name: "listenSocket", scope: !291, file: !71, line: 166, type: !76)
!297 = !DILocation(line: 166, column: 20, scope: !291)
!298 = !DILocalVariable(name: "acceptSocket", scope: !291, file: !71, line: 167, type: !76)
!299 = !DILocation(line: 167, column: 20, scope: !291)
!300 = !DILocalVariable(name: "inputBuffer", scope: !291, file: !71, line: 168, type: !60)
!301 = !DILocation(line: 168, column: 18, scope: !291)
!302 = !DILocation(line: 169, column: 13, scope: !291)
!303 = !DILocation(line: 179, column: 32, scope: !304)
!304 = distinct !DILexicalBlock(scope: !291, file: !71, line: 170, column: 13)
!305 = !DILocation(line: 179, column: 30, scope: !304)
!306 = !DILocation(line: 180, column: 21, scope: !307)
!307 = distinct !DILexicalBlock(scope: !304, file: !71, line: 180, column: 21)
!308 = !DILocation(line: 180, column: 34, scope: !307)
!309 = !DILocation(line: 180, column: 21, scope: !304)
!310 = !DILocation(line: 182, column: 21, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !71, line: 181, column: 17)
!312 = !DILocation(line: 184, column: 17, scope: !304)
!313 = !DILocation(line: 185, column: 25, scope: !304)
!314 = !DILocation(line: 185, column: 36, scope: !304)
!315 = !DILocation(line: 186, column: 25, scope: !304)
!316 = !DILocation(line: 186, column: 34, scope: !304)
!317 = !DILocation(line: 186, column: 41, scope: !304)
!318 = !DILocation(line: 187, column: 36, scope: !304)
!319 = !DILocation(line: 187, column: 25, scope: !304)
!320 = !DILocation(line: 187, column: 34, scope: !304)
!321 = !DILocation(line: 188, column: 26, scope: !322)
!322 = distinct !DILexicalBlock(scope: !304, file: !71, line: 188, column: 21)
!323 = !DILocation(line: 188, column: 40, scope: !322)
!324 = !DILocation(line: 188, column: 21, scope: !322)
!325 = !DILocation(line: 188, column: 85, scope: !322)
!326 = !DILocation(line: 188, column: 21, scope: !304)
!327 = !DILocation(line: 190, column: 21, scope: !328)
!328 = distinct !DILexicalBlock(scope: !322, file: !71, line: 189, column: 17)
!329 = !DILocation(line: 192, column: 28, scope: !330)
!330 = distinct !DILexicalBlock(scope: !304, file: !71, line: 192, column: 21)
!331 = !DILocation(line: 192, column: 21, scope: !330)
!332 = !DILocation(line: 192, column: 58, scope: !330)
!333 = !DILocation(line: 192, column: 21, scope: !304)
!334 = !DILocation(line: 194, column: 21, scope: !335)
!335 = distinct !DILexicalBlock(scope: !330, file: !71, line: 193, column: 17)
!336 = !DILocation(line: 196, column: 39, scope: !304)
!337 = !DILocation(line: 196, column: 32, scope: !304)
!338 = !DILocation(line: 196, column: 30, scope: !304)
!339 = !DILocation(line: 197, column: 21, scope: !340)
!340 = distinct !DILexicalBlock(scope: !304, file: !71, line: 197, column: 21)
!341 = !DILocation(line: 197, column: 34, scope: !340)
!342 = !DILocation(line: 197, column: 21, scope: !304)
!343 = !DILocation(line: 199, column: 21, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !71, line: 198, column: 17)
!345 = !DILocation(line: 202, column: 35, scope: !304)
!346 = !DILocation(line: 202, column: 49, scope: !304)
!347 = !DILocation(line: 202, column: 30, scope: !304)
!348 = !DILocation(line: 202, column: 28, scope: !304)
!349 = !DILocation(line: 203, column: 21, scope: !350)
!350 = distinct !DILexicalBlock(scope: !304, file: !71, line: 203, column: 21)
!351 = !DILocation(line: 203, column: 32, scope: !350)
!352 = !DILocation(line: 203, column: 48, scope: !350)
!353 = !DILocation(line: 203, column: 51, scope: !350)
!354 = !DILocation(line: 203, column: 62, scope: !350)
!355 = !DILocation(line: 203, column: 21, scope: !304)
!356 = !DILocation(line: 205, column: 21, scope: !357)
!357 = distinct !DILexicalBlock(scope: !350, file: !71, line: 204, column: 17)
!358 = !DILocation(line: 208, column: 29, scope: !304)
!359 = !DILocation(line: 208, column: 17, scope: !304)
!360 = !DILocation(line: 208, column: 41, scope: !304)
!361 = !DILocation(line: 210, column: 29, scope: !304)
!362 = !DILocation(line: 210, column: 24, scope: !304)
!363 = !DILocation(line: 210, column: 22, scope: !304)
!364 = !DILocation(line: 211, column: 13, scope: !304)
!365 = !DILocation(line: 213, column: 17, scope: !366)
!366 = distinct !DILexicalBlock(scope: !291, file: !71, line: 213, column: 17)
!367 = !DILocation(line: 213, column: 30, scope: !366)
!368 = !DILocation(line: 213, column: 17, scope: !291)
!369 = !DILocation(line: 215, column: 30, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !71, line: 214, column: 13)
!371 = !DILocation(line: 215, column: 17, scope: !370)
!372 = !DILocation(line: 216, column: 13, scope: !370)
!373 = !DILocation(line: 217, column: 17, scope: !374)
!374 = distinct !DILexicalBlock(scope: !291, file: !71, line: 217, column: 17)
!375 = !DILocation(line: 217, column: 30, scope: !374)
!376 = !DILocation(line: 217, column: 17, scope: !291)
!377 = !DILocation(line: 219, column: 30, scope: !378)
!378 = distinct !DILexicalBlock(scope: !374, file: !71, line: 218, column: 13)
!379 = !DILocation(line: 219, column: 17, scope: !378)
!380 = !DILocation(line: 220, column: 13, scope: !378)
!381 = !DILocation(line: 228, column: 5, scope: !292)
!382 = !DILocation(line: 157, column: 24, scope: !287)
!383 = !DILocation(line: 157, column: 5, scope: !287)
!384 = distinct !{!384, !289, !385, !202}
!385 = !DILocation(line: 228, column: 5, scope: !284)
!386 = !DILocation(line: 229, column: 11, scope: !387)
!387 = distinct !DILexicalBlock(scope: !275, file: !71, line: 229, column: 5)
!388 = !DILocation(line: 229, column: 9, scope: !387)
!389 = !DILocation(line: 229, column: 16, scope: !390)
!390 = distinct !DILexicalBlock(scope: !387, file: !71, line: 229, column: 5)
!391 = !DILocation(line: 229, column: 18, scope: !390)
!392 = !DILocation(line: 229, column: 5, scope: !387)
!393 = !DILocalVariable(name: "i", scope: !394, file: !71, line: 232, type: !76)
!394 = distinct !DILexicalBlock(scope: !395, file: !71, line: 231, column: 9)
!395 = distinct !DILexicalBlock(scope: !390, file: !71, line: 230, column: 5)
!396 = !DILocation(line: 232, column: 17, scope: !394)
!397 = !DILocalVariable(name: "buffer", scope: !394, file: !71, line: 233, type: !215)
!398 = !DILocation(line: 233, column: 17, scope: !394)
!399 = !DILocation(line: 235, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !394, file: !71, line: 235, column: 17)
!401 = !DILocation(line: 235, column: 22, scope: !400)
!402 = !DILocation(line: 235, column: 27, scope: !400)
!403 = !DILocation(line: 235, column: 30, scope: !400)
!404 = !DILocation(line: 235, column: 35, scope: !400)
!405 = !DILocation(line: 235, column: 17, scope: !394)
!406 = !DILocation(line: 237, column: 24, scope: !407)
!407 = distinct !DILexicalBlock(scope: !400, file: !71, line: 236, column: 13)
!408 = !DILocation(line: 237, column: 17, scope: !407)
!409 = !DILocation(line: 237, column: 30, scope: !407)
!410 = !DILocation(line: 239, column: 23, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !71, line: 239, column: 17)
!412 = !DILocation(line: 239, column: 21, scope: !411)
!413 = !DILocation(line: 239, column: 28, scope: !414)
!414 = distinct !DILexicalBlock(scope: !411, file: !71, line: 239, column: 17)
!415 = !DILocation(line: 239, column: 30, scope: !414)
!416 = !DILocation(line: 239, column: 17, scope: !411)
!417 = !DILocation(line: 241, column: 41, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !71, line: 240, column: 17)
!419 = !DILocation(line: 241, column: 34, scope: !418)
!420 = !DILocation(line: 241, column: 21, scope: !418)
!421 = !DILocation(line: 242, column: 17, scope: !418)
!422 = !DILocation(line: 239, column: 37, scope: !414)
!423 = !DILocation(line: 239, column: 17, scope: !414)
!424 = distinct !{!424, !416, !425, !202}
!425 = !DILocation(line: 242, column: 17, scope: !411)
!426 = !DILocation(line: 243, column: 13, scope: !407)
!427 = !DILocation(line: 246, column: 17, scope: !428)
!428 = distinct !DILexicalBlock(scope: !400, file: !71, line: 245, column: 13)
!429 = !DILocation(line: 249, column: 5, scope: !395)
!430 = !DILocation(line: 229, column: 24, scope: !390)
!431 = !DILocation(line: 229, column: 5, scope: !390)
!432 = distinct !{!432, !392, !433, !202}
!433 = !DILocation(line: 249, column: 5, scope: !387)
!434 = !DILocation(line: 250, column: 1, scope: !275)
!435 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 253, type: !72, scopeLine: 254, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!436 = !DILocalVariable(name: "h", scope: !435, file: !71, line: 255, type: !76)
!437 = !DILocation(line: 255, column: 9, scope: !435)
!438 = !DILocalVariable(name: "j", scope: !435, file: !71, line: 255, type: !76)
!439 = !DILocation(line: 255, column: 11, scope: !435)
!440 = !DILocalVariable(name: "data", scope: !435, file: !71, line: 256, type: !76)
!441 = !DILocation(line: 256, column: 9, scope: !435)
!442 = !DILocation(line: 258, column: 10, scope: !435)
!443 = !DILocation(line: 259, column: 11, scope: !444)
!444 = distinct !DILexicalBlock(scope: !435, file: !71, line: 259, column: 5)
!445 = !DILocation(line: 259, column: 9, scope: !444)
!446 = !DILocation(line: 259, column: 16, scope: !447)
!447 = distinct !DILexicalBlock(scope: !444, file: !71, line: 259, column: 5)
!448 = !DILocation(line: 259, column: 18, scope: !447)
!449 = !DILocation(line: 259, column: 5, scope: !444)
!450 = !DILocation(line: 263, column: 14, scope: !451)
!451 = distinct !DILexicalBlock(scope: !447, file: !71, line: 260, column: 5)
!452 = !DILocation(line: 264, column: 5, scope: !451)
!453 = !DILocation(line: 259, column: 24, scope: !447)
!454 = !DILocation(line: 259, column: 5, scope: !447)
!455 = distinct !{!455, !449, !456, !202}
!456 = !DILocation(line: 264, column: 5, scope: !444)
!457 = !DILocation(line: 265, column: 11, scope: !458)
!458 = distinct !DILexicalBlock(scope: !435, file: !71, line: 265, column: 5)
!459 = !DILocation(line: 265, column: 9, scope: !458)
!460 = !DILocation(line: 265, column: 16, scope: !461)
!461 = distinct !DILexicalBlock(scope: !458, file: !71, line: 265, column: 5)
!462 = !DILocation(line: 265, column: 18, scope: !461)
!463 = !DILocation(line: 265, column: 5, scope: !458)
!464 = !DILocalVariable(name: "i", scope: !465, file: !71, line: 268, type: !76)
!465 = distinct !DILexicalBlock(scope: !466, file: !71, line: 267, column: 9)
!466 = distinct !DILexicalBlock(scope: !461, file: !71, line: 266, column: 5)
!467 = !DILocation(line: 268, column: 17, scope: !465)
!468 = !DILocalVariable(name: "buffer", scope: !465, file: !71, line: 269, type: !215)
!469 = !DILocation(line: 269, column: 17, scope: !465)
!470 = !DILocation(line: 272, column: 17, scope: !471)
!471 = distinct !DILexicalBlock(scope: !465, file: !71, line: 272, column: 17)
!472 = !DILocation(line: 272, column: 22, scope: !471)
!473 = !DILocation(line: 272, column: 17, scope: !465)
!474 = !DILocation(line: 274, column: 24, scope: !475)
!475 = distinct !DILexicalBlock(scope: !471, file: !71, line: 273, column: 13)
!476 = !DILocation(line: 274, column: 17, scope: !475)
!477 = !DILocation(line: 274, column: 30, scope: !475)
!478 = !DILocation(line: 276, column: 23, scope: !479)
!479 = distinct !DILexicalBlock(scope: !475, file: !71, line: 276, column: 17)
!480 = !DILocation(line: 276, column: 21, scope: !479)
!481 = !DILocation(line: 276, column: 28, scope: !482)
!482 = distinct !DILexicalBlock(scope: !479, file: !71, line: 276, column: 17)
!483 = !DILocation(line: 276, column: 30, scope: !482)
!484 = !DILocation(line: 276, column: 17, scope: !479)
!485 = !DILocation(line: 278, column: 41, scope: !486)
!486 = distinct !DILexicalBlock(scope: !482, file: !71, line: 277, column: 17)
!487 = !DILocation(line: 278, column: 34, scope: !486)
!488 = !DILocation(line: 278, column: 21, scope: !486)
!489 = !DILocation(line: 279, column: 17, scope: !486)
!490 = !DILocation(line: 276, column: 37, scope: !482)
!491 = !DILocation(line: 276, column: 17, scope: !482)
!492 = distinct !{!492, !484, !493, !202}
!493 = !DILocation(line: 279, column: 17, scope: !479)
!494 = !DILocation(line: 280, column: 13, scope: !475)
!495 = !DILocation(line: 283, column: 17, scope: !496)
!496 = distinct !DILexicalBlock(scope: !471, file: !71, line: 282, column: 13)
!497 = !DILocation(line: 286, column: 5, scope: !466)
!498 = !DILocation(line: 265, column: 24, scope: !461)
!499 = !DILocation(line: 265, column: 5, scope: !461)
!500 = distinct !{!500, !463, !501, !202}
!501 = !DILocation(line: 286, column: 5, scope: !458)
!502 = !DILocation(line: 287, column: 1, scope: !435)
