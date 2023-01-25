; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_17.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_17_bad() #0 !dbg !73 {
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
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32* %j, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32* %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 -1, i32* %data, align 4, !dbg !84
  store i32 0, i32* %i, align 4, !dbg !85
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !88
  %cmp = icmp slt i32 %0, 1, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !92, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !96, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 -1, i32* %listenSocket, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 -1, i32* %acceptSocket, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  br label %do.body, !dbg !120

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !121
  store i32 %call, i32* %listenSocket, align 4, !dbg !123
  %1 = load i32, i32* %listenSocket, align 4, !dbg !124
  %cmp1 = icmp eq i32 %1, -1, !dbg !126
  br i1 %cmp1, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !128

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !130
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !131
  store i16 2, i16* %sin_family, align 4, !dbg !132
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !133
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !134
  store i32 0, i32* %s_addr, align 4, !dbg !135
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !136
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !137
  store i16 %call2, i16* %sin_port, align 2, !dbg !138
  %3 = load i32, i32* %listenSocket, align 4, !dbg !139
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !141
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !142
  %cmp4 = icmp eq i32 %call3, -1, !dbg !143
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !144

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !145

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !147
  %call7 = call i32 @listen(i32 %5, i32 5) #8, !dbg !149
  %cmp8 = icmp eq i32 %call7, -1, !dbg !150
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !151

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !152

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !154
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !155
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !156
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !157
  %cmp12 = icmp eq i32 %7, -1, !dbg !159
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !160

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !161

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !163
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !164
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !165
  %conv = trunc i64 %call15 to i32, !dbg !165
  store i32 %conv, i32* %recvResult, align 4, !dbg !166
  %9 = load i32, i32* %recvResult, align 4, !dbg !167
  %cmp16 = icmp eq i32 %9, -1, !dbg !169
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !170

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !171
  %cmp18 = icmp eq i32 %10, 0, !dbg !172
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !173

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !174

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !176
  %idxprom = sext i32 %11 to i64, !dbg !177
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !177
  store i8 0, i8* %arrayidx, align 1, !dbg !178
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !179
  %call23 = call i32 @atoi(i8* %arraydecay22) #10, !dbg !180
  store i32 %call23, i32* %data, align 4, !dbg !181
  br label %do.end, !dbg !182

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %12 = load i32, i32* %listenSocket, align 4, !dbg !183
  %cmp24 = icmp ne i32 %12, -1, !dbg !185
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !186

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !187
  %call27 = call i32 @close(i32 %13), !dbg !189
  br label %if.end28, !dbg !190

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !191
  %cmp29 = icmp ne i32 %14, -1, !dbg !193
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !194

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !195
  %call32 = call i32 @close(i32 %15), !dbg !197
  br label %if.end33, !dbg !198

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %if.end33
  %16 = load i32, i32* %i, align 4, !dbg !200
  %inc = add nsw i32 %16, 1, !dbg !200
  store i32 %inc, i32* %i, align 4, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !205
  br label %for.cond34, !dbg !207

for.cond34:                                       ; preds = %for.inc68, %for.end
  %17 = load i32, i32* %j, align 4, !dbg !208
  %cmp35 = icmp slt i32 %17, 1, !dbg !210
  br i1 %cmp35, label %for.body37, label %for.end70, !dbg !211

for.body37:                                       ; preds = %for.cond34
  call void @llvm.dbg.declare(metadata i32* %i38, metadata !212, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !216, metadata !DIExpression()), !dbg !217
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !218
  %18 = bitcast i8* %call39 to i32*, !dbg !219
  store i32* %18, i32** %buffer, align 8, !dbg !217
  %19 = load i32*, i32** %buffer, align 8, !dbg !220
  %cmp40 = icmp eq i32* %19, null, !dbg !222
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !223

if.then42:                                        ; preds = %for.body37
  call void @exit(i32 -1) #11, !dbg !224
  unreachable, !dbg !224

if.end43:                                         ; preds = %for.body37
  store i32 0, i32* %i38, align 4, !dbg !226
  br label %for.cond44, !dbg !228

for.cond44:                                       ; preds = %for.inc50, %if.end43
  %20 = load i32, i32* %i38, align 4, !dbg !229
  %cmp45 = icmp slt i32 %20, 10, !dbg !231
  br i1 %cmp45, label %for.body47, label %for.end52, !dbg !232

for.body47:                                       ; preds = %for.cond44
  %21 = load i32*, i32** %buffer, align 8, !dbg !233
  %22 = load i32, i32* %i38, align 4, !dbg !235
  %idxprom48 = sext i32 %22 to i64, !dbg !233
  %arrayidx49 = getelementptr inbounds i32, i32* %21, i64 %idxprom48, !dbg !233
  store i32 0, i32* %arrayidx49, align 4, !dbg !236
  br label %for.inc50, !dbg !237

for.inc50:                                        ; preds = %for.body47
  %23 = load i32, i32* %i38, align 4, !dbg !238
  %inc51 = add nsw i32 %23, 1, !dbg !238
  store i32 %inc51, i32* %i38, align 4, !dbg !238
  br label %for.cond44, !dbg !239, !llvm.loop !240

for.end52:                                        ; preds = %for.cond44
  %24 = load i32, i32* %data, align 4, !dbg !242
  %cmp53 = icmp sge i32 %24, 0, !dbg !244
  br i1 %cmp53, label %if.then55, label %if.else, !dbg !245

if.then55:                                        ; preds = %for.end52
  %25 = load i32*, i32** %buffer, align 8, !dbg !246
  %26 = load i32, i32* %data, align 4, !dbg !248
  %idxprom56 = sext i32 %26 to i64, !dbg !246
  %arrayidx57 = getelementptr inbounds i32, i32* %25, i64 %idxprom56, !dbg !246
  store i32 1, i32* %arrayidx57, align 4, !dbg !249
  store i32 0, i32* %i38, align 4, !dbg !250
  br label %for.cond58, !dbg !252

for.cond58:                                       ; preds = %for.inc64, %if.then55
  %27 = load i32, i32* %i38, align 4, !dbg !253
  %cmp59 = icmp slt i32 %27, 10, !dbg !255
  br i1 %cmp59, label %for.body61, label %for.end66, !dbg !256

for.body61:                                       ; preds = %for.cond58
  %28 = load i32*, i32** %buffer, align 8, !dbg !257
  %29 = load i32, i32* %i38, align 4, !dbg !259
  %idxprom62 = sext i32 %29 to i64, !dbg !257
  %arrayidx63 = getelementptr inbounds i32, i32* %28, i64 %idxprom62, !dbg !257
  %30 = load i32, i32* %arrayidx63, align 4, !dbg !257
  call void @printIntLine(i32 %30), !dbg !260
  br label %for.inc64, !dbg !261

for.inc64:                                        ; preds = %for.body61
  %31 = load i32, i32* %i38, align 4, !dbg !262
  %inc65 = add nsw i32 %31, 1, !dbg !262
  store i32 %inc65, i32* %i38, align 4, !dbg !262
  br label %for.cond58, !dbg !263, !llvm.loop !264

for.end66:                                        ; preds = %for.cond58
  br label %if.end67, !dbg !266

if.else:                                          ; preds = %for.end52
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !267
  br label %if.end67

if.end67:                                         ; preds = %if.else, %for.end66
  %32 = load i32*, i32** %buffer, align 8, !dbg !269
  %33 = bitcast i32* %32 to i8*, !dbg !269
  call void @free(i8* %33) #8, !dbg !270
  br label %for.inc68, !dbg !271

for.inc68:                                        ; preds = %if.end67
  %34 = load i32, i32* %j, align 4, !dbg !272
  %inc69 = add nsw i32 %34, 1, !dbg !272
  store i32 %inc69, i32* %j, align 4, !dbg !272
  br label %for.cond34, !dbg !273, !llvm.loop !274

for.end70:                                        ; preds = %for.cond34
  ret void, !dbg !276
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_17_good() #0 !dbg !277 {
entry:
  call void @goodB2G(), !dbg !278
  call void @goodG2B(), !dbg !279
  ret void, !dbg !280
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !281 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !286, metadata !DIExpression()), !dbg !287
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !288, metadata !DIExpression()), !dbg !289
  %call = call i64 @time(i64* null) #8, !dbg !290
  %conv = trunc i64 %call to i32, !dbg !291
  call void @srand(i32 %conv) #8, !dbg !292
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !293
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_17_good(), !dbg !294
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !295
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !296
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_17_bad(), !dbg !297
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !298
  ret i32 0, !dbg !299
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !300 {
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
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !301, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.declare(metadata i32* %k, metadata !303, metadata !DIExpression()), !dbg !304
  call void @llvm.dbg.declare(metadata i32* %data, metadata !305, metadata !DIExpression()), !dbg !306
  store i32 -1, i32* %data, align 4, !dbg !307
  store i32 0, i32* %i, align 4, !dbg !308
  br label %for.cond, !dbg !310

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !311
  %cmp = icmp slt i32 %0, 1, !dbg !313
  br i1 %cmp, label %for.body, label %for.end, !dbg !314

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !315, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !319, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !321, metadata !DIExpression()), !dbg !322
  store i32 -1, i32* %listenSocket, align 4, !dbg !322
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !323, metadata !DIExpression()), !dbg !324
  store i32 -1, i32* %acceptSocket, align 4, !dbg !324
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !325, metadata !DIExpression()), !dbg !326
  br label %do.body, !dbg !327

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !328
  store i32 %call, i32* %listenSocket, align 4, !dbg !330
  %1 = load i32, i32* %listenSocket, align 4, !dbg !331
  %cmp1 = icmp eq i32 %1, -1, !dbg !333
  br i1 %cmp1, label %if.then, label %if.end, !dbg !334

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !335

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !337
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !337
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !338
  store i16 2, i16* %sin_family, align 4, !dbg !339
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !340
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !341
  store i32 0, i32* %s_addr, align 4, !dbg !342
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !343
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !344
  store i16 %call2, i16* %sin_port, align 2, !dbg !345
  %3 = load i32, i32* %listenSocket, align 4, !dbg !346
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !348
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #8, !dbg !349
  %cmp4 = icmp eq i32 %call3, -1, !dbg !350
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !351

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !352

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !354
  %call7 = call i32 @listen(i32 %5, i32 5) #8, !dbg !356
  %cmp8 = icmp eq i32 %call7, -1, !dbg !357
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !358

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !359

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !361
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !362
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !363
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !364
  %cmp12 = icmp eq i32 %7, -1, !dbg !366
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !367

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !368

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !370
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !371
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !372
  %conv = trunc i64 %call15 to i32, !dbg !372
  store i32 %conv, i32* %recvResult, align 4, !dbg !373
  %9 = load i32, i32* %recvResult, align 4, !dbg !374
  %cmp16 = icmp eq i32 %9, -1, !dbg !376
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !377

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !378
  %cmp18 = icmp eq i32 %10, 0, !dbg !379
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !380

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !381

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !383
  %idxprom = sext i32 %11 to i64, !dbg !384
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !384
  store i8 0, i8* %arrayidx, align 1, !dbg !385
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !386
  %call23 = call i32 @atoi(i8* %arraydecay22) #10, !dbg !387
  store i32 %call23, i32* %data, align 4, !dbg !388
  br label %do.end, !dbg !389

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %12 = load i32, i32* %listenSocket, align 4, !dbg !390
  %cmp24 = icmp ne i32 %12, -1, !dbg !392
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !393

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !394
  %call27 = call i32 @close(i32 %13), !dbg !396
  br label %if.end28, !dbg !397

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !398
  %cmp29 = icmp ne i32 %14, -1, !dbg !400
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !401

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !402
  %call32 = call i32 @close(i32 %15), !dbg !404
  br label %if.end33, !dbg !405

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %for.inc, !dbg !406

for.inc:                                          ; preds = %if.end33
  %16 = load i32, i32* %i, align 4, !dbg !407
  %inc = add nsw i32 %16, 1, !dbg !407
  store i32 %inc, i32* %i, align 4, !dbg !407
  br label %for.cond, !dbg !408, !llvm.loop !409

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !411
  br label %for.cond34, !dbg !413

for.cond34:                                       ; preds = %for.inc70, %for.end
  %17 = load i32, i32* %k, align 4, !dbg !414
  %cmp35 = icmp slt i32 %17, 1, !dbg !416
  br i1 %cmp35, label %for.body37, label %for.end72, !dbg !417

for.body37:                                       ; preds = %for.cond34
  call void @llvm.dbg.declare(metadata i32* %i38, metadata !418, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !422, metadata !DIExpression()), !dbg !423
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !424
  %18 = bitcast i8* %call39 to i32*, !dbg !425
  store i32* %18, i32** %buffer, align 8, !dbg !423
  %19 = load i32*, i32** %buffer, align 8, !dbg !426
  %cmp40 = icmp eq i32* %19, null, !dbg !428
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !429

if.then42:                                        ; preds = %for.body37
  call void @exit(i32 -1) #11, !dbg !430
  unreachable, !dbg !430

if.end43:                                         ; preds = %for.body37
  store i32 0, i32* %i38, align 4, !dbg !432
  br label %for.cond44, !dbg !434

for.cond44:                                       ; preds = %for.inc50, %if.end43
  %20 = load i32, i32* %i38, align 4, !dbg !435
  %cmp45 = icmp slt i32 %20, 10, !dbg !437
  br i1 %cmp45, label %for.body47, label %for.end52, !dbg !438

for.body47:                                       ; preds = %for.cond44
  %21 = load i32*, i32** %buffer, align 8, !dbg !439
  %22 = load i32, i32* %i38, align 4, !dbg !441
  %idxprom48 = sext i32 %22 to i64, !dbg !439
  %arrayidx49 = getelementptr inbounds i32, i32* %21, i64 %idxprom48, !dbg !439
  store i32 0, i32* %arrayidx49, align 4, !dbg !442
  br label %for.inc50, !dbg !443

for.inc50:                                        ; preds = %for.body47
  %23 = load i32, i32* %i38, align 4, !dbg !444
  %inc51 = add nsw i32 %23, 1, !dbg !444
  store i32 %inc51, i32* %i38, align 4, !dbg !444
  br label %for.cond44, !dbg !445, !llvm.loop !446

for.end52:                                        ; preds = %for.cond44
  %24 = load i32, i32* %data, align 4, !dbg !448
  %cmp53 = icmp sge i32 %24, 0, !dbg !450
  br i1 %cmp53, label %land.lhs.true, label %if.else, !dbg !451

land.lhs.true:                                    ; preds = %for.end52
  %25 = load i32, i32* %data, align 4, !dbg !452
  %cmp55 = icmp slt i32 %25, 10, !dbg !453
  br i1 %cmp55, label %if.then57, label %if.else, !dbg !454

if.then57:                                        ; preds = %land.lhs.true
  %26 = load i32*, i32** %buffer, align 8, !dbg !455
  %27 = load i32, i32* %data, align 4, !dbg !457
  %idxprom58 = sext i32 %27 to i64, !dbg !455
  %arrayidx59 = getelementptr inbounds i32, i32* %26, i64 %idxprom58, !dbg !455
  store i32 1, i32* %arrayidx59, align 4, !dbg !458
  store i32 0, i32* %i38, align 4, !dbg !459
  br label %for.cond60, !dbg !461

for.cond60:                                       ; preds = %for.inc66, %if.then57
  %28 = load i32, i32* %i38, align 4, !dbg !462
  %cmp61 = icmp slt i32 %28, 10, !dbg !464
  br i1 %cmp61, label %for.body63, label %for.end68, !dbg !465

for.body63:                                       ; preds = %for.cond60
  %29 = load i32*, i32** %buffer, align 8, !dbg !466
  %30 = load i32, i32* %i38, align 4, !dbg !468
  %idxprom64 = sext i32 %30 to i64, !dbg !466
  %arrayidx65 = getelementptr inbounds i32, i32* %29, i64 %idxprom64, !dbg !466
  %31 = load i32, i32* %arrayidx65, align 4, !dbg !466
  call void @printIntLine(i32 %31), !dbg !469
  br label %for.inc66, !dbg !470

for.inc66:                                        ; preds = %for.body63
  %32 = load i32, i32* %i38, align 4, !dbg !471
  %inc67 = add nsw i32 %32, 1, !dbg !471
  store i32 %inc67, i32* %i38, align 4, !dbg !471
  br label %for.cond60, !dbg !472, !llvm.loop !473

for.end68:                                        ; preds = %for.cond60
  br label %if.end69, !dbg !475

if.else:                                          ; preds = %land.lhs.true, %for.end52
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !476
  br label %if.end69

if.end69:                                         ; preds = %if.else, %for.end68
  %33 = load i32*, i32** %buffer, align 8, !dbg !478
  %34 = bitcast i32* %33 to i8*, !dbg !478
  call void @free(i8* %34) #8, !dbg !479
  br label %for.inc70, !dbg !480

for.inc70:                                        ; preds = %if.end69
  %35 = load i32, i32* %k, align 4, !dbg !481
  %inc71 = add nsw i32 %35, 1, !dbg !481
  store i32 %inc71, i32* %k, align 4, !dbg !481
  br label %for.cond34, !dbg !482, !llvm.loop !483

for.end72:                                        ; preds = %for.cond34
  ret void, !dbg !485
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !486 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !487, metadata !DIExpression()), !dbg !488
  call void @llvm.dbg.declare(metadata i32* %j, metadata !489, metadata !DIExpression()), !dbg !490
  call void @llvm.dbg.declare(metadata i32* %data, metadata !491, metadata !DIExpression()), !dbg !492
  store i32 -1, i32* %data, align 4, !dbg !493
  store i32 0, i32* %h, align 4, !dbg !494
  br label %for.cond, !dbg !496

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !497
  %cmp = icmp slt i32 %0, 1, !dbg !499
  br i1 %cmp, label %for.body, label %for.end, !dbg !500

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !501
  br label %for.inc, !dbg !503

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !504
  %inc = add nsw i32 %1, 1, !dbg !504
  store i32 %inc, i32* %h, align 4, !dbg !504
  br label %for.cond, !dbg !505, !llvm.loop !506

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !508
  br label %for.cond1, !dbg !510

for.cond1:                                        ; preds = %for.inc24, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !511
  %cmp2 = icmp slt i32 %2, 1, !dbg !513
  br i1 %cmp2, label %for.body3, label %for.end26, !dbg !514

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !515, metadata !DIExpression()), !dbg !518
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !519, metadata !DIExpression()), !dbg !520
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !521
  %3 = bitcast i8* %call to i32*, !dbg !522
  store i32* %3, i32** %buffer, align 8, !dbg !520
  %4 = load i32*, i32** %buffer, align 8, !dbg !523
  %cmp4 = icmp eq i32* %4, null, !dbg !525
  br i1 %cmp4, label %if.then, label %if.end, !dbg !526

if.then:                                          ; preds = %for.body3
  call void @exit(i32 -1) #11, !dbg !527
  unreachable, !dbg !527

if.end:                                           ; preds = %for.body3
  store i32 0, i32* %i, align 4, !dbg !529
  br label %for.cond5, !dbg !531

for.cond5:                                        ; preds = %for.inc8, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !532
  %cmp6 = icmp slt i32 %5, 10, !dbg !534
  br i1 %cmp6, label %for.body7, label %for.end10, !dbg !535

for.body7:                                        ; preds = %for.cond5
  %6 = load i32*, i32** %buffer, align 8, !dbg !536
  %7 = load i32, i32* %i, align 4, !dbg !538
  %idxprom = sext i32 %7 to i64, !dbg !536
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !536
  store i32 0, i32* %arrayidx, align 4, !dbg !539
  br label %for.inc8, !dbg !540

for.inc8:                                         ; preds = %for.body7
  %8 = load i32, i32* %i, align 4, !dbg !541
  %inc9 = add nsw i32 %8, 1, !dbg !541
  store i32 %inc9, i32* %i, align 4, !dbg !541
  br label %for.cond5, !dbg !542, !llvm.loop !543

for.end10:                                        ; preds = %for.cond5
  %9 = load i32, i32* %data, align 4, !dbg !545
  %cmp11 = icmp sge i32 %9, 0, !dbg !547
  br i1 %cmp11, label %if.then12, label %if.else, !dbg !548

if.then12:                                        ; preds = %for.end10
  %10 = load i32*, i32** %buffer, align 8, !dbg !549
  %11 = load i32, i32* %data, align 4, !dbg !551
  %idxprom13 = sext i32 %11 to i64, !dbg !549
  %arrayidx14 = getelementptr inbounds i32, i32* %10, i64 %idxprom13, !dbg !549
  store i32 1, i32* %arrayidx14, align 4, !dbg !552
  store i32 0, i32* %i, align 4, !dbg !553
  br label %for.cond15, !dbg !555

for.cond15:                                       ; preds = %for.inc20, %if.then12
  %12 = load i32, i32* %i, align 4, !dbg !556
  %cmp16 = icmp slt i32 %12, 10, !dbg !558
  br i1 %cmp16, label %for.body17, label %for.end22, !dbg !559

for.body17:                                       ; preds = %for.cond15
  %13 = load i32*, i32** %buffer, align 8, !dbg !560
  %14 = load i32, i32* %i, align 4, !dbg !562
  %idxprom18 = sext i32 %14 to i64, !dbg !560
  %arrayidx19 = getelementptr inbounds i32, i32* %13, i64 %idxprom18, !dbg !560
  %15 = load i32, i32* %arrayidx19, align 4, !dbg !560
  call void @printIntLine(i32 %15), !dbg !563
  br label %for.inc20, !dbg !564

for.inc20:                                        ; preds = %for.body17
  %16 = load i32, i32* %i, align 4, !dbg !565
  %inc21 = add nsw i32 %16, 1, !dbg !565
  store i32 %inc21, i32* %i, align 4, !dbg !565
  br label %for.cond15, !dbg !566, !llvm.loop !567

for.end22:                                        ; preds = %for.cond15
  br label %if.end23, !dbg !569

if.else:                                          ; preds = %for.end10
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !570
  br label %if.end23

if.end23:                                         ; preds = %if.else, %for.end22
  %17 = load i32*, i32** %buffer, align 8, !dbg !572
  %18 = bitcast i32* %17 to i8*, !dbg !572
  call void @free(i8* %18) #8, !dbg !573
  br label %for.inc24, !dbg !574

for.inc24:                                        ; preds = %if.end23
  %19 = load i32, i32* %j, align 4, !dbg !575
  %inc25 = add nsw i32 %19, 1, !dbg !575
  store i32 %inc25, i32* %j, align 4, !dbg !575
  br label %for.cond1, !dbg !576, !llvm.loop !577

for.end26:                                        ; preds = %for.cond1
  ret void, !dbg !579
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_17_bad", scope: !74, file: !74, line: 44, type: !75, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_17.c", directory: "/home/joelyang/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "i", scope: !73, file: !74, line: 46, type: !65)
!79 = !DILocation(line: 46, column: 9, scope: !73)
!80 = !DILocalVariable(name: "j", scope: !73, file: !74, line: 46, type: !65)
!81 = !DILocation(line: 46, column: 11, scope: !73)
!82 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 47, type: !65)
!83 = !DILocation(line: 47, column: 9, scope: !73)
!84 = !DILocation(line: 49, column: 10, scope: !73)
!85 = !DILocation(line: 50, column: 11, scope: !86)
!86 = distinct !DILexicalBlock(scope: !73, file: !74, line: 50, column: 5)
!87 = !DILocation(line: 50, column: 9, scope: !86)
!88 = !DILocation(line: 50, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !74, line: 50, column: 5)
!90 = !DILocation(line: 50, column: 18, scope: !89)
!91 = !DILocation(line: 50, column: 5, scope: !86)
!92 = !DILocalVariable(name: "recvResult", scope: !93, file: !74, line: 57, type: !65)
!93 = distinct !DILexicalBlock(scope: !94, file: !74, line: 52, column: 9)
!94 = distinct !DILexicalBlock(scope: !89, file: !74, line: 51, column: 5)
!95 = !DILocation(line: 57, column: 17, scope: !93)
!96 = !DILocalVariable(name: "service", scope: !93, file: !74, line: 58, type: !97)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !98)
!98 = !{!99, !100, !104, !108}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !97, file: !17, line: 240, baseType: !56, size: 16)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !97, file: !17, line: 241, baseType: !101, size: 16, offset: 16)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !97, file: !17, line: 242, baseType: !105, size: 32, offset: 32)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !106)
!106 = !{!107}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !105, file: !17, line: 33, baseType: !46, size: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !97, file: !17, line: 245, baseType: !109, size: 64, offset: 64)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !110, size: 64, elements: !111)
!110 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!111 = !{!112}
!112 = !DISubrange(count: 8)
!113 = !DILocation(line: 58, column: 32, scope: !93)
!114 = !DILocalVariable(name: "listenSocket", scope: !93, file: !74, line: 59, type: !65)
!115 = !DILocation(line: 59, column: 20, scope: !93)
!116 = !DILocalVariable(name: "acceptSocket", scope: !93, file: !74, line: 60, type: !65)
!117 = !DILocation(line: 60, column: 20, scope: !93)
!118 = !DILocalVariable(name: "inputBuffer", scope: !93, file: !74, line: 61, type: !60)
!119 = !DILocation(line: 61, column: 18, scope: !93)
!120 = !DILocation(line: 62, column: 13, scope: !93)
!121 = !DILocation(line: 72, column: 32, scope: !122)
!122 = distinct !DILexicalBlock(scope: !93, file: !74, line: 63, column: 13)
!123 = !DILocation(line: 72, column: 30, scope: !122)
!124 = !DILocation(line: 73, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !74, line: 73, column: 21)
!126 = !DILocation(line: 73, column: 34, scope: !125)
!127 = !DILocation(line: 73, column: 21, scope: !122)
!128 = !DILocation(line: 75, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !74, line: 74, column: 17)
!130 = !DILocation(line: 77, column: 17, scope: !122)
!131 = !DILocation(line: 78, column: 25, scope: !122)
!132 = !DILocation(line: 78, column: 36, scope: !122)
!133 = !DILocation(line: 79, column: 25, scope: !122)
!134 = !DILocation(line: 79, column: 34, scope: !122)
!135 = !DILocation(line: 79, column: 41, scope: !122)
!136 = !DILocation(line: 80, column: 36, scope: !122)
!137 = !DILocation(line: 80, column: 25, scope: !122)
!138 = !DILocation(line: 80, column: 34, scope: !122)
!139 = !DILocation(line: 81, column: 26, scope: !140)
!140 = distinct !DILexicalBlock(scope: !122, file: !74, line: 81, column: 21)
!141 = !DILocation(line: 81, column: 40, scope: !140)
!142 = !DILocation(line: 81, column: 21, scope: !140)
!143 = !DILocation(line: 81, column: 85, scope: !140)
!144 = !DILocation(line: 81, column: 21, scope: !122)
!145 = !DILocation(line: 83, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !74, line: 82, column: 17)
!147 = !DILocation(line: 85, column: 28, scope: !148)
!148 = distinct !DILexicalBlock(scope: !122, file: !74, line: 85, column: 21)
!149 = !DILocation(line: 85, column: 21, scope: !148)
!150 = !DILocation(line: 85, column: 58, scope: !148)
!151 = !DILocation(line: 85, column: 21, scope: !122)
!152 = !DILocation(line: 87, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !74, line: 86, column: 17)
!154 = !DILocation(line: 89, column: 39, scope: !122)
!155 = !DILocation(line: 89, column: 32, scope: !122)
!156 = !DILocation(line: 89, column: 30, scope: !122)
!157 = !DILocation(line: 90, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !122, file: !74, line: 90, column: 21)
!159 = !DILocation(line: 90, column: 34, scope: !158)
!160 = !DILocation(line: 90, column: 21, scope: !122)
!161 = !DILocation(line: 92, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !74, line: 91, column: 17)
!163 = !DILocation(line: 95, column: 35, scope: !122)
!164 = !DILocation(line: 95, column: 49, scope: !122)
!165 = !DILocation(line: 95, column: 30, scope: !122)
!166 = !DILocation(line: 95, column: 28, scope: !122)
!167 = !DILocation(line: 96, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !122, file: !74, line: 96, column: 21)
!169 = !DILocation(line: 96, column: 32, scope: !168)
!170 = !DILocation(line: 96, column: 48, scope: !168)
!171 = !DILocation(line: 96, column: 51, scope: !168)
!172 = !DILocation(line: 96, column: 62, scope: !168)
!173 = !DILocation(line: 96, column: 21, scope: !122)
!174 = !DILocation(line: 98, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !168, file: !74, line: 97, column: 17)
!176 = !DILocation(line: 101, column: 29, scope: !122)
!177 = !DILocation(line: 101, column: 17, scope: !122)
!178 = !DILocation(line: 101, column: 41, scope: !122)
!179 = !DILocation(line: 103, column: 29, scope: !122)
!180 = !DILocation(line: 103, column: 24, scope: !122)
!181 = !DILocation(line: 103, column: 22, scope: !122)
!182 = !DILocation(line: 104, column: 13, scope: !122)
!183 = !DILocation(line: 106, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !93, file: !74, line: 106, column: 17)
!185 = !DILocation(line: 106, column: 30, scope: !184)
!186 = !DILocation(line: 106, column: 17, scope: !93)
!187 = !DILocation(line: 108, column: 30, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !74, line: 107, column: 13)
!189 = !DILocation(line: 108, column: 17, scope: !188)
!190 = !DILocation(line: 109, column: 13, scope: !188)
!191 = !DILocation(line: 110, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !93, file: !74, line: 110, column: 17)
!193 = !DILocation(line: 110, column: 30, scope: !192)
!194 = !DILocation(line: 110, column: 17, scope: !93)
!195 = !DILocation(line: 112, column: 30, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !74, line: 111, column: 13)
!197 = !DILocation(line: 112, column: 17, scope: !196)
!198 = !DILocation(line: 113, column: 13, scope: !196)
!199 = !DILocation(line: 121, column: 5, scope: !94)
!200 = !DILocation(line: 50, column: 24, scope: !89)
!201 = !DILocation(line: 50, column: 5, scope: !89)
!202 = distinct !{!202, !91, !203, !204}
!203 = !DILocation(line: 121, column: 5, scope: !86)
!204 = !{!"llvm.loop.mustprogress"}
!205 = !DILocation(line: 122, column: 11, scope: !206)
!206 = distinct !DILexicalBlock(scope: !73, file: !74, line: 122, column: 5)
!207 = !DILocation(line: 122, column: 9, scope: !206)
!208 = !DILocation(line: 122, column: 16, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !74, line: 122, column: 5)
!210 = !DILocation(line: 122, column: 18, scope: !209)
!211 = !DILocation(line: 122, column: 5, scope: !206)
!212 = !DILocalVariable(name: "i", scope: !213, file: !74, line: 125, type: !65)
!213 = distinct !DILexicalBlock(scope: !214, file: !74, line: 124, column: 9)
!214 = distinct !DILexicalBlock(scope: !209, file: !74, line: 123, column: 5)
!215 = !DILocation(line: 125, column: 17, scope: !213)
!216 = !DILocalVariable(name: "buffer", scope: !213, file: !74, line: 126, type: !64)
!217 = !DILocation(line: 126, column: 19, scope: !213)
!218 = !DILocation(line: 126, column: 35, scope: !213)
!219 = !DILocation(line: 126, column: 28, scope: !213)
!220 = !DILocation(line: 127, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !213, file: !74, line: 127, column: 17)
!222 = !DILocation(line: 127, column: 24, scope: !221)
!223 = !DILocation(line: 127, column: 17, scope: !213)
!224 = !DILocation(line: 127, column: 34, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !74, line: 127, column: 33)
!226 = !DILocation(line: 129, column: 20, scope: !227)
!227 = distinct !DILexicalBlock(scope: !213, file: !74, line: 129, column: 13)
!228 = !DILocation(line: 129, column: 18, scope: !227)
!229 = !DILocation(line: 129, column: 25, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !74, line: 129, column: 13)
!231 = !DILocation(line: 129, column: 27, scope: !230)
!232 = !DILocation(line: 129, column: 13, scope: !227)
!233 = !DILocation(line: 131, column: 17, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !74, line: 130, column: 13)
!235 = !DILocation(line: 131, column: 24, scope: !234)
!236 = !DILocation(line: 131, column: 27, scope: !234)
!237 = !DILocation(line: 132, column: 13, scope: !234)
!238 = !DILocation(line: 129, column: 34, scope: !230)
!239 = !DILocation(line: 129, column: 13, scope: !230)
!240 = distinct !{!240, !232, !241, !204}
!241 = !DILocation(line: 132, column: 13, scope: !227)
!242 = !DILocation(line: 135, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !213, file: !74, line: 135, column: 17)
!244 = !DILocation(line: 135, column: 22, scope: !243)
!245 = !DILocation(line: 135, column: 17, scope: !213)
!246 = !DILocation(line: 137, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !74, line: 136, column: 13)
!248 = !DILocation(line: 137, column: 24, scope: !247)
!249 = !DILocation(line: 137, column: 30, scope: !247)
!250 = !DILocation(line: 139, column: 23, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !74, line: 139, column: 17)
!252 = !DILocation(line: 139, column: 21, scope: !251)
!253 = !DILocation(line: 139, column: 28, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !74, line: 139, column: 17)
!255 = !DILocation(line: 139, column: 30, scope: !254)
!256 = !DILocation(line: 139, column: 17, scope: !251)
!257 = !DILocation(line: 141, column: 34, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !74, line: 140, column: 17)
!259 = !DILocation(line: 141, column: 41, scope: !258)
!260 = !DILocation(line: 141, column: 21, scope: !258)
!261 = !DILocation(line: 142, column: 17, scope: !258)
!262 = !DILocation(line: 139, column: 37, scope: !254)
!263 = !DILocation(line: 139, column: 17, scope: !254)
!264 = distinct !{!264, !256, !265, !204}
!265 = !DILocation(line: 142, column: 17, scope: !251)
!266 = !DILocation(line: 143, column: 13, scope: !247)
!267 = !DILocation(line: 146, column: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !243, file: !74, line: 145, column: 13)
!269 = !DILocation(line: 148, column: 18, scope: !213)
!270 = !DILocation(line: 148, column: 13, scope: !213)
!271 = !DILocation(line: 150, column: 5, scope: !214)
!272 = !DILocation(line: 122, column: 24, scope: !209)
!273 = !DILocation(line: 122, column: 5, scope: !209)
!274 = distinct !{!274, !211, !275, !204}
!275 = !DILocation(line: 150, column: 5, scope: !206)
!276 = !DILocation(line: 151, column: 1, scope: !73)
!277 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_17_good", scope: !74, file: !74, line: 310, type: !75, scopeLine: 311, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!278 = !DILocation(line: 312, column: 5, scope: !277)
!279 = !DILocation(line: 313, column: 5, scope: !277)
!280 = !DILocation(line: 314, column: 1, scope: !277)
!281 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 325, type: !282, scopeLine: 326, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!282 = !DISubroutineType(types: !283)
!283 = !{!65, !65, !284}
!284 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !285, size: 64)
!285 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!286 = !DILocalVariable(name: "argc", arg: 1, scope: !281, file: !74, line: 325, type: !65)
!287 = !DILocation(line: 325, column: 14, scope: !281)
!288 = !DILocalVariable(name: "argv", arg: 2, scope: !281, file: !74, line: 325, type: !284)
!289 = !DILocation(line: 325, column: 27, scope: !281)
!290 = !DILocation(line: 328, column: 22, scope: !281)
!291 = !DILocation(line: 328, column: 12, scope: !281)
!292 = !DILocation(line: 328, column: 5, scope: !281)
!293 = !DILocation(line: 330, column: 5, scope: !281)
!294 = !DILocation(line: 331, column: 5, scope: !281)
!295 = !DILocation(line: 332, column: 5, scope: !281)
!296 = !DILocation(line: 335, column: 5, scope: !281)
!297 = !DILocation(line: 336, column: 5, scope: !281)
!298 = !DILocation(line: 337, column: 5, scope: !281)
!299 = !DILocation(line: 339, column: 5, scope: !281)
!300 = distinct !DISubprogram(name: "goodB2G", scope: !74, file: !74, line: 158, type: !75, scopeLine: 159, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!301 = !DILocalVariable(name: "i", scope: !300, file: !74, line: 160, type: !65)
!302 = !DILocation(line: 160, column: 9, scope: !300)
!303 = !DILocalVariable(name: "k", scope: !300, file: !74, line: 160, type: !65)
!304 = !DILocation(line: 160, column: 11, scope: !300)
!305 = !DILocalVariable(name: "data", scope: !300, file: !74, line: 161, type: !65)
!306 = !DILocation(line: 161, column: 9, scope: !300)
!307 = !DILocation(line: 163, column: 10, scope: !300)
!308 = !DILocation(line: 164, column: 11, scope: !309)
!309 = distinct !DILexicalBlock(scope: !300, file: !74, line: 164, column: 5)
!310 = !DILocation(line: 164, column: 9, scope: !309)
!311 = !DILocation(line: 164, column: 16, scope: !312)
!312 = distinct !DILexicalBlock(scope: !309, file: !74, line: 164, column: 5)
!313 = !DILocation(line: 164, column: 18, scope: !312)
!314 = !DILocation(line: 164, column: 5, scope: !309)
!315 = !DILocalVariable(name: "recvResult", scope: !316, file: !74, line: 171, type: !65)
!316 = distinct !DILexicalBlock(scope: !317, file: !74, line: 166, column: 9)
!317 = distinct !DILexicalBlock(scope: !312, file: !74, line: 165, column: 5)
!318 = !DILocation(line: 171, column: 17, scope: !316)
!319 = !DILocalVariable(name: "service", scope: !316, file: !74, line: 172, type: !97)
!320 = !DILocation(line: 172, column: 32, scope: !316)
!321 = !DILocalVariable(name: "listenSocket", scope: !316, file: !74, line: 173, type: !65)
!322 = !DILocation(line: 173, column: 20, scope: !316)
!323 = !DILocalVariable(name: "acceptSocket", scope: !316, file: !74, line: 174, type: !65)
!324 = !DILocation(line: 174, column: 20, scope: !316)
!325 = !DILocalVariable(name: "inputBuffer", scope: !316, file: !74, line: 175, type: !60)
!326 = !DILocation(line: 175, column: 18, scope: !316)
!327 = !DILocation(line: 176, column: 13, scope: !316)
!328 = !DILocation(line: 186, column: 32, scope: !329)
!329 = distinct !DILexicalBlock(scope: !316, file: !74, line: 177, column: 13)
!330 = !DILocation(line: 186, column: 30, scope: !329)
!331 = !DILocation(line: 187, column: 21, scope: !332)
!332 = distinct !DILexicalBlock(scope: !329, file: !74, line: 187, column: 21)
!333 = !DILocation(line: 187, column: 34, scope: !332)
!334 = !DILocation(line: 187, column: 21, scope: !329)
!335 = !DILocation(line: 189, column: 21, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !74, line: 188, column: 17)
!337 = !DILocation(line: 191, column: 17, scope: !329)
!338 = !DILocation(line: 192, column: 25, scope: !329)
!339 = !DILocation(line: 192, column: 36, scope: !329)
!340 = !DILocation(line: 193, column: 25, scope: !329)
!341 = !DILocation(line: 193, column: 34, scope: !329)
!342 = !DILocation(line: 193, column: 41, scope: !329)
!343 = !DILocation(line: 194, column: 36, scope: !329)
!344 = !DILocation(line: 194, column: 25, scope: !329)
!345 = !DILocation(line: 194, column: 34, scope: !329)
!346 = !DILocation(line: 195, column: 26, scope: !347)
!347 = distinct !DILexicalBlock(scope: !329, file: !74, line: 195, column: 21)
!348 = !DILocation(line: 195, column: 40, scope: !347)
!349 = !DILocation(line: 195, column: 21, scope: !347)
!350 = !DILocation(line: 195, column: 85, scope: !347)
!351 = !DILocation(line: 195, column: 21, scope: !329)
!352 = !DILocation(line: 197, column: 21, scope: !353)
!353 = distinct !DILexicalBlock(scope: !347, file: !74, line: 196, column: 17)
!354 = !DILocation(line: 199, column: 28, scope: !355)
!355 = distinct !DILexicalBlock(scope: !329, file: !74, line: 199, column: 21)
!356 = !DILocation(line: 199, column: 21, scope: !355)
!357 = !DILocation(line: 199, column: 58, scope: !355)
!358 = !DILocation(line: 199, column: 21, scope: !329)
!359 = !DILocation(line: 201, column: 21, scope: !360)
!360 = distinct !DILexicalBlock(scope: !355, file: !74, line: 200, column: 17)
!361 = !DILocation(line: 203, column: 39, scope: !329)
!362 = !DILocation(line: 203, column: 32, scope: !329)
!363 = !DILocation(line: 203, column: 30, scope: !329)
!364 = !DILocation(line: 204, column: 21, scope: !365)
!365 = distinct !DILexicalBlock(scope: !329, file: !74, line: 204, column: 21)
!366 = !DILocation(line: 204, column: 34, scope: !365)
!367 = !DILocation(line: 204, column: 21, scope: !329)
!368 = !DILocation(line: 206, column: 21, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !74, line: 205, column: 17)
!370 = !DILocation(line: 209, column: 35, scope: !329)
!371 = !DILocation(line: 209, column: 49, scope: !329)
!372 = !DILocation(line: 209, column: 30, scope: !329)
!373 = !DILocation(line: 209, column: 28, scope: !329)
!374 = !DILocation(line: 210, column: 21, scope: !375)
!375 = distinct !DILexicalBlock(scope: !329, file: !74, line: 210, column: 21)
!376 = !DILocation(line: 210, column: 32, scope: !375)
!377 = !DILocation(line: 210, column: 48, scope: !375)
!378 = !DILocation(line: 210, column: 51, scope: !375)
!379 = !DILocation(line: 210, column: 62, scope: !375)
!380 = !DILocation(line: 210, column: 21, scope: !329)
!381 = !DILocation(line: 212, column: 21, scope: !382)
!382 = distinct !DILexicalBlock(scope: !375, file: !74, line: 211, column: 17)
!383 = !DILocation(line: 215, column: 29, scope: !329)
!384 = !DILocation(line: 215, column: 17, scope: !329)
!385 = !DILocation(line: 215, column: 41, scope: !329)
!386 = !DILocation(line: 217, column: 29, scope: !329)
!387 = !DILocation(line: 217, column: 24, scope: !329)
!388 = !DILocation(line: 217, column: 22, scope: !329)
!389 = !DILocation(line: 218, column: 13, scope: !329)
!390 = !DILocation(line: 220, column: 17, scope: !391)
!391 = distinct !DILexicalBlock(scope: !316, file: !74, line: 220, column: 17)
!392 = !DILocation(line: 220, column: 30, scope: !391)
!393 = !DILocation(line: 220, column: 17, scope: !316)
!394 = !DILocation(line: 222, column: 30, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !74, line: 221, column: 13)
!396 = !DILocation(line: 222, column: 17, scope: !395)
!397 = !DILocation(line: 223, column: 13, scope: !395)
!398 = !DILocation(line: 224, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !316, file: !74, line: 224, column: 17)
!400 = !DILocation(line: 224, column: 30, scope: !399)
!401 = !DILocation(line: 224, column: 17, scope: !316)
!402 = !DILocation(line: 226, column: 30, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !74, line: 225, column: 13)
!404 = !DILocation(line: 226, column: 17, scope: !403)
!405 = !DILocation(line: 227, column: 13, scope: !403)
!406 = !DILocation(line: 235, column: 5, scope: !317)
!407 = !DILocation(line: 164, column: 24, scope: !312)
!408 = !DILocation(line: 164, column: 5, scope: !312)
!409 = distinct !{!409, !314, !410, !204}
!410 = !DILocation(line: 235, column: 5, scope: !309)
!411 = !DILocation(line: 236, column: 11, scope: !412)
!412 = distinct !DILexicalBlock(scope: !300, file: !74, line: 236, column: 5)
!413 = !DILocation(line: 236, column: 9, scope: !412)
!414 = !DILocation(line: 236, column: 16, scope: !415)
!415 = distinct !DILexicalBlock(scope: !412, file: !74, line: 236, column: 5)
!416 = !DILocation(line: 236, column: 18, scope: !415)
!417 = !DILocation(line: 236, column: 5, scope: !412)
!418 = !DILocalVariable(name: "i", scope: !419, file: !74, line: 239, type: !65)
!419 = distinct !DILexicalBlock(scope: !420, file: !74, line: 238, column: 9)
!420 = distinct !DILexicalBlock(scope: !415, file: !74, line: 237, column: 5)
!421 = !DILocation(line: 239, column: 17, scope: !419)
!422 = !DILocalVariable(name: "buffer", scope: !419, file: !74, line: 240, type: !64)
!423 = !DILocation(line: 240, column: 19, scope: !419)
!424 = !DILocation(line: 240, column: 35, scope: !419)
!425 = !DILocation(line: 240, column: 28, scope: !419)
!426 = !DILocation(line: 241, column: 17, scope: !427)
!427 = distinct !DILexicalBlock(scope: !419, file: !74, line: 241, column: 17)
!428 = !DILocation(line: 241, column: 24, scope: !427)
!429 = !DILocation(line: 241, column: 17, scope: !419)
!430 = !DILocation(line: 241, column: 34, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !74, line: 241, column: 33)
!432 = !DILocation(line: 243, column: 20, scope: !433)
!433 = distinct !DILexicalBlock(scope: !419, file: !74, line: 243, column: 13)
!434 = !DILocation(line: 243, column: 18, scope: !433)
!435 = !DILocation(line: 243, column: 25, scope: !436)
!436 = distinct !DILexicalBlock(scope: !433, file: !74, line: 243, column: 13)
!437 = !DILocation(line: 243, column: 27, scope: !436)
!438 = !DILocation(line: 243, column: 13, scope: !433)
!439 = !DILocation(line: 245, column: 17, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !74, line: 244, column: 13)
!441 = !DILocation(line: 245, column: 24, scope: !440)
!442 = !DILocation(line: 245, column: 27, scope: !440)
!443 = !DILocation(line: 246, column: 13, scope: !440)
!444 = !DILocation(line: 243, column: 34, scope: !436)
!445 = !DILocation(line: 243, column: 13, scope: !436)
!446 = distinct !{!446, !438, !447, !204}
!447 = !DILocation(line: 246, column: 13, scope: !433)
!448 = !DILocation(line: 248, column: 17, scope: !449)
!449 = distinct !DILexicalBlock(scope: !419, file: !74, line: 248, column: 17)
!450 = !DILocation(line: 248, column: 22, scope: !449)
!451 = !DILocation(line: 248, column: 27, scope: !449)
!452 = !DILocation(line: 248, column: 30, scope: !449)
!453 = !DILocation(line: 248, column: 35, scope: !449)
!454 = !DILocation(line: 248, column: 17, scope: !419)
!455 = !DILocation(line: 250, column: 17, scope: !456)
!456 = distinct !DILexicalBlock(scope: !449, file: !74, line: 249, column: 13)
!457 = !DILocation(line: 250, column: 24, scope: !456)
!458 = !DILocation(line: 250, column: 30, scope: !456)
!459 = !DILocation(line: 252, column: 23, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !74, line: 252, column: 17)
!461 = !DILocation(line: 252, column: 21, scope: !460)
!462 = !DILocation(line: 252, column: 28, scope: !463)
!463 = distinct !DILexicalBlock(scope: !460, file: !74, line: 252, column: 17)
!464 = !DILocation(line: 252, column: 30, scope: !463)
!465 = !DILocation(line: 252, column: 17, scope: !460)
!466 = !DILocation(line: 254, column: 34, scope: !467)
!467 = distinct !DILexicalBlock(scope: !463, file: !74, line: 253, column: 17)
!468 = !DILocation(line: 254, column: 41, scope: !467)
!469 = !DILocation(line: 254, column: 21, scope: !467)
!470 = !DILocation(line: 255, column: 17, scope: !467)
!471 = !DILocation(line: 252, column: 37, scope: !463)
!472 = !DILocation(line: 252, column: 17, scope: !463)
!473 = distinct !{!473, !465, !474, !204}
!474 = !DILocation(line: 255, column: 17, scope: !460)
!475 = !DILocation(line: 256, column: 13, scope: !456)
!476 = !DILocation(line: 259, column: 17, scope: !477)
!477 = distinct !DILexicalBlock(scope: !449, file: !74, line: 258, column: 13)
!478 = !DILocation(line: 261, column: 18, scope: !419)
!479 = !DILocation(line: 261, column: 13, scope: !419)
!480 = !DILocation(line: 263, column: 5, scope: !420)
!481 = !DILocation(line: 236, column: 24, scope: !415)
!482 = !DILocation(line: 236, column: 5, scope: !415)
!483 = distinct !{!483, !417, !484, !204}
!484 = !DILocation(line: 263, column: 5, scope: !412)
!485 = !DILocation(line: 264, column: 1, scope: !300)
!486 = distinct !DISubprogram(name: "goodG2B", scope: !74, file: !74, line: 267, type: !75, scopeLine: 268, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!487 = !DILocalVariable(name: "h", scope: !486, file: !74, line: 269, type: !65)
!488 = !DILocation(line: 269, column: 9, scope: !486)
!489 = !DILocalVariable(name: "j", scope: !486, file: !74, line: 269, type: !65)
!490 = !DILocation(line: 269, column: 11, scope: !486)
!491 = !DILocalVariable(name: "data", scope: !486, file: !74, line: 270, type: !65)
!492 = !DILocation(line: 270, column: 9, scope: !486)
!493 = !DILocation(line: 272, column: 10, scope: !486)
!494 = !DILocation(line: 273, column: 11, scope: !495)
!495 = distinct !DILexicalBlock(scope: !486, file: !74, line: 273, column: 5)
!496 = !DILocation(line: 273, column: 9, scope: !495)
!497 = !DILocation(line: 273, column: 16, scope: !498)
!498 = distinct !DILexicalBlock(scope: !495, file: !74, line: 273, column: 5)
!499 = !DILocation(line: 273, column: 18, scope: !498)
!500 = !DILocation(line: 273, column: 5, scope: !495)
!501 = !DILocation(line: 277, column: 14, scope: !502)
!502 = distinct !DILexicalBlock(scope: !498, file: !74, line: 274, column: 5)
!503 = !DILocation(line: 278, column: 5, scope: !502)
!504 = !DILocation(line: 273, column: 24, scope: !498)
!505 = !DILocation(line: 273, column: 5, scope: !498)
!506 = distinct !{!506, !500, !507, !204}
!507 = !DILocation(line: 278, column: 5, scope: !495)
!508 = !DILocation(line: 279, column: 11, scope: !509)
!509 = distinct !DILexicalBlock(scope: !486, file: !74, line: 279, column: 5)
!510 = !DILocation(line: 279, column: 9, scope: !509)
!511 = !DILocation(line: 279, column: 16, scope: !512)
!512 = distinct !DILexicalBlock(scope: !509, file: !74, line: 279, column: 5)
!513 = !DILocation(line: 279, column: 18, scope: !512)
!514 = !DILocation(line: 279, column: 5, scope: !509)
!515 = !DILocalVariable(name: "i", scope: !516, file: !74, line: 282, type: !65)
!516 = distinct !DILexicalBlock(scope: !517, file: !74, line: 281, column: 9)
!517 = distinct !DILexicalBlock(scope: !512, file: !74, line: 280, column: 5)
!518 = !DILocation(line: 282, column: 17, scope: !516)
!519 = !DILocalVariable(name: "buffer", scope: !516, file: !74, line: 283, type: !64)
!520 = !DILocation(line: 283, column: 19, scope: !516)
!521 = !DILocation(line: 283, column: 35, scope: !516)
!522 = !DILocation(line: 283, column: 28, scope: !516)
!523 = !DILocation(line: 284, column: 17, scope: !524)
!524 = distinct !DILexicalBlock(scope: !516, file: !74, line: 284, column: 17)
!525 = !DILocation(line: 284, column: 24, scope: !524)
!526 = !DILocation(line: 284, column: 17, scope: !516)
!527 = !DILocation(line: 284, column: 34, scope: !528)
!528 = distinct !DILexicalBlock(scope: !524, file: !74, line: 284, column: 33)
!529 = !DILocation(line: 286, column: 20, scope: !530)
!530 = distinct !DILexicalBlock(scope: !516, file: !74, line: 286, column: 13)
!531 = !DILocation(line: 286, column: 18, scope: !530)
!532 = !DILocation(line: 286, column: 25, scope: !533)
!533 = distinct !DILexicalBlock(scope: !530, file: !74, line: 286, column: 13)
!534 = !DILocation(line: 286, column: 27, scope: !533)
!535 = !DILocation(line: 286, column: 13, scope: !530)
!536 = !DILocation(line: 288, column: 17, scope: !537)
!537 = distinct !DILexicalBlock(scope: !533, file: !74, line: 287, column: 13)
!538 = !DILocation(line: 288, column: 24, scope: !537)
!539 = !DILocation(line: 288, column: 27, scope: !537)
!540 = !DILocation(line: 289, column: 13, scope: !537)
!541 = !DILocation(line: 286, column: 34, scope: !533)
!542 = !DILocation(line: 286, column: 13, scope: !533)
!543 = distinct !{!543, !535, !544, !204}
!544 = !DILocation(line: 289, column: 13, scope: !530)
!545 = !DILocation(line: 292, column: 17, scope: !546)
!546 = distinct !DILexicalBlock(scope: !516, file: !74, line: 292, column: 17)
!547 = !DILocation(line: 292, column: 22, scope: !546)
!548 = !DILocation(line: 292, column: 17, scope: !516)
!549 = !DILocation(line: 294, column: 17, scope: !550)
!550 = distinct !DILexicalBlock(scope: !546, file: !74, line: 293, column: 13)
!551 = !DILocation(line: 294, column: 24, scope: !550)
!552 = !DILocation(line: 294, column: 30, scope: !550)
!553 = !DILocation(line: 296, column: 23, scope: !554)
!554 = distinct !DILexicalBlock(scope: !550, file: !74, line: 296, column: 17)
!555 = !DILocation(line: 296, column: 21, scope: !554)
!556 = !DILocation(line: 296, column: 28, scope: !557)
!557 = distinct !DILexicalBlock(scope: !554, file: !74, line: 296, column: 17)
!558 = !DILocation(line: 296, column: 30, scope: !557)
!559 = !DILocation(line: 296, column: 17, scope: !554)
!560 = !DILocation(line: 298, column: 34, scope: !561)
!561 = distinct !DILexicalBlock(scope: !557, file: !74, line: 297, column: 17)
!562 = !DILocation(line: 298, column: 41, scope: !561)
!563 = !DILocation(line: 298, column: 21, scope: !561)
!564 = !DILocation(line: 299, column: 17, scope: !561)
!565 = !DILocation(line: 296, column: 37, scope: !557)
!566 = !DILocation(line: 296, column: 17, scope: !557)
!567 = distinct !{!567, !559, !568, !204}
!568 = !DILocation(line: 299, column: 17, scope: !554)
!569 = !DILocation(line: 300, column: 13, scope: !550)
!570 = !DILocation(line: 303, column: 17, scope: !571)
!571 = distinct !DILexicalBlock(scope: !546, file: !74, line: 302, column: 13)
!572 = !DILocation(line: 305, column: 18, scope: !516)
!573 = !DILocation(line: 305, column: 13, scope: !516)
!574 = !DILocation(line: 307, column: 5, scope: !517)
!575 = !DILocation(line: 279, column: 24, scope: !512)
!576 = !DILocation(line: 279, column: 5, scope: !512)
!577 = distinct !{!577, !514, !578, !204}
!578 = !DILocation(line: 307, column: 5, scope: !509)
!579 = !DILocation(line: 308, column: 1, scope: !486)
