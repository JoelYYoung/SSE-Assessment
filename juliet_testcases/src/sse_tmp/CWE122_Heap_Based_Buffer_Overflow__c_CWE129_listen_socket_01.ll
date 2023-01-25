; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_bad() #0 !dbg !73 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !81, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !84, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %listenSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %acceptSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %do.body, !dbg !108

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !109
  store i32 %call, i32* %listenSocket, align 4, !dbg !111
  %0 = load i32, i32* %listenSocket, align 4, !dbg !112
  %cmp = icmp eq i32 %0, -1, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !116

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !118
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !119
  store i16 2, i16* %sin_family, align 4, !dbg !120
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !121
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !122
  store i32 0, i32* %s_addr, align 4, !dbg !123
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !124
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !125
  store i16 %call1, i16* %sin_port, align 2, !dbg !126
  %2 = load i32, i32* %listenSocket, align 4, !dbg !127
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !129
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !130
  %cmp3 = icmp eq i32 %call2, -1, !dbg !131
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !132

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !133

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !135
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !137
  %cmp7 = icmp eq i32 %call6, -1, !dbg !138
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !139

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !140

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !142
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !143
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !144
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !145
  %cmp11 = icmp eq i32 %6, -1, !dbg !147
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !148

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !149

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !151
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !152
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !153
  %conv = trunc i64 %call14 to i32, !dbg !153
  store i32 %conv, i32* %recvResult, align 4, !dbg !154
  %8 = load i32, i32* %recvResult, align 4, !dbg !155
  %cmp15 = icmp eq i32 %8, -1, !dbg !157
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !158

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !159
  %cmp17 = icmp eq i32 %9, 0, !dbg !160
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !161

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !162

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !164
  %idxprom = sext i32 %10 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !167
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !168
  store i32 %call22, i32* %data, align 4, !dbg !169
  br label %do.end, !dbg !170

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !171
  %cmp23 = icmp ne i32 %11, -1, !dbg !173
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !174

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !175
  %call26 = call i32 @close(i32 %12), !dbg !177
  br label %if.end27, !dbg !178

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !179
  %cmp28 = icmp ne i32 %13, -1, !dbg !181
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !182

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !183
  %call31 = call i32 @close(i32 %14), !dbg !185
  br label %if.end32, !dbg !186

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !187, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !190, metadata !DIExpression()), !dbg !191
  %call33 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !192
  %15 = bitcast i8* %call33 to i32*, !dbg !193
  store i32* %15, i32** %buffer, align 8, !dbg !191
  %16 = load i32*, i32** %buffer, align 8, !dbg !194
  %cmp34 = icmp eq i32* %16, null, !dbg !196
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !197

if.then36:                                        ; preds = %if.end32
  call void @exit(i32 -1) #11, !dbg !198
  unreachable, !dbg !198

if.end37:                                         ; preds = %if.end32
  store i32 0, i32* %i, align 4, !dbg !200
  br label %for.cond, !dbg !202

for.cond:                                         ; preds = %for.inc, %if.end37
  %17 = load i32, i32* %i, align 4, !dbg !203
  %cmp38 = icmp slt i32 %17, 10, !dbg !205
  br i1 %cmp38, label %for.body, label %for.end, !dbg !206

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !207
  %19 = load i32, i32* %i, align 4, !dbg !209
  %idxprom40 = sext i32 %19 to i64, !dbg !207
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !207
  store i32 0, i32* %arrayidx41, align 4, !dbg !210
  br label %for.inc, !dbg !211

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !212
  %inc = add nsw i32 %20, 1, !dbg !212
  store i32 %inc, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !213, !llvm.loop !214

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !217
  %cmp42 = icmp sge i32 %21, 0, !dbg !219
  br i1 %cmp42, label %if.then44, label %if.else, !dbg !220

if.then44:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !221
  %23 = load i32, i32* %data, align 4, !dbg !223
  %idxprom45 = sext i32 %23 to i64, !dbg !221
  %arrayidx46 = getelementptr inbounds i32, i32* %22, i64 %idxprom45, !dbg !221
  store i32 1, i32* %arrayidx46, align 4, !dbg !224
  store i32 0, i32* %i, align 4, !dbg !225
  br label %for.cond47, !dbg !227

for.cond47:                                       ; preds = %for.inc53, %if.then44
  %24 = load i32, i32* %i, align 4, !dbg !228
  %cmp48 = icmp slt i32 %24, 10, !dbg !230
  br i1 %cmp48, label %for.body50, label %for.end55, !dbg !231

for.body50:                                       ; preds = %for.cond47
  %25 = load i32*, i32** %buffer, align 8, !dbg !232
  %26 = load i32, i32* %i, align 4, !dbg !234
  %idxprom51 = sext i32 %26 to i64, !dbg !232
  %arrayidx52 = getelementptr inbounds i32, i32* %25, i64 %idxprom51, !dbg !232
  %27 = load i32, i32* %arrayidx52, align 4, !dbg !232
  call void @printIntLine(i32 %27), !dbg !235
  br label %for.inc53, !dbg !236

for.inc53:                                        ; preds = %for.body50
  %28 = load i32, i32* %i, align 4, !dbg !237
  %inc54 = add nsw i32 %28, 1, !dbg !237
  store i32 %inc54, i32* %i, align 4, !dbg !237
  br label %for.cond47, !dbg !238, !llvm.loop !239

for.end55:                                        ; preds = %for.cond47
  br label %if.end56, !dbg !241

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !242
  br label %if.end56

if.end56:                                         ; preds = %if.else, %for.end55
  %29 = load i32*, i32** %buffer, align 8, !dbg !244
  %30 = bitcast i32* %29 to i8*, !dbg !244
  call void @free(i8* %30) #8, !dbg !245
  ret void, !dbg !246
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_good() #0 !dbg !247 {
entry:
  call void @goodG2B(), !dbg !248
  call void @goodB2G(), !dbg !249
  ret void, !dbg !250
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !251 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !256, metadata !DIExpression()), !dbg !257
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !258, metadata !DIExpression()), !dbg !259
  %call = call i64 @time(i64* null) #8, !dbg !260
  %conv = trunc i64 %call to i32, !dbg !261
  call void @srand(i32 %conv) #8, !dbg !262
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !263
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_good(), !dbg !264
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !265
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !266
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_bad(), !dbg !267
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !268
  ret i32 0, !dbg !269
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !270 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !271, metadata !DIExpression()), !dbg !272
  store i32 -1, i32* %data, align 4, !dbg !273
  store i32 7, i32* %data, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata i32* %i, metadata !275, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !278, metadata !DIExpression()), !dbg !279
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !280
  %0 = bitcast i8* %call to i32*, !dbg !281
  store i32* %0, i32** %buffer, align 8, !dbg !279
  %1 = load i32*, i32** %buffer, align 8, !dbg !282
  %cmp = icmp eq i32* %1, null, !dbg !284
  br i1 %cmp, label %if.then, label %if.end, !dbg !285

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !286
  unreachable, !dbg !286

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !288
  br label %for.cond, !dbg !290

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !291
  %cmp1 = icmp slt i32 %2, 10, !dbg !293
  br i1 %cmp1, label %for.body, label %for.end, !dbg !294

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !295
  %4 = load i32, i32* %i, align 4, !dbg !297
  %idxprom = sext i32 %4 to i64, !dbg !295
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !295
  store i32 0, i32* %arrayidx, align 4, !dbg !298
  br label %for.inc, !dbg !299

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !300
  %inc = add nsw i32 %5, 1, !dbg !300
  store i32 %inc, i32* %i, align 4, !dbg !300
  br label %for.cond, !dbg !301, !llvm.loop !302

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !304
  %cmp2 = icmp sge i32 %6, 0, !dbg !306
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !307

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !308
  %8 = load i32, i32* %data, align 4, !dbg !310
  %idxprom4 = sext i32 %8 to i64, !dbg !308
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !308
  store i32 1, i32* %arrayidx5, align 4, !dbg !311
  store i32 0, i32* %i, align 4, !dbg !312
  br label %for.cond6, !dbg !314

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !315
  %cmp7 = icmp slt i32 %9, 10, !dbg !317
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !318

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !319
  %11 = load i32, i32* %i, align 4, !dbg !321
  %idxprom9 = sext i32 %11 to i64, !dbg !319
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !319
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !319
  call void @printIntLine(i32 %12), !dbg !322
  br label %for.inc11, !dbg !323

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !324
  %inc12 = add nsw i32 %13, 1, !dbg !324
  store i32 %inc12, i32* %i, align 4, !dbg !324
  br label %for.cond6, !dbg !325, !llvm.loop !326

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !328

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !329
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !331
  %15 = bitcast i32* %14 to i8*, !dbg !331
  call void @free(i8* %15) #8, !dbg !332
  ret void, !dbg !333
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !334 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !335, metadata !DIExpression()), !dbg !336
  store i32 -1, i32* %data, align 4, !dbg !337
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !338, metadata !DIExpression()), !dbg !340
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !341, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !343, metadata !DIExpression()), !dbg !344
  store i32 -1, i32* %listenSocket, align 4, !dbg !344
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !345, metadata !DIExpression()), !dbg !346
  store i32 -1, i32* %acceptSocket, align 4, !dbg !346
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !347, metadata !DIExpression()), !dbg !348
  br label %do.body, !dbg !349

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !350
  store i32 %call, i32* %listenSocket, align 4, !dbg !352
  %0 = load i32, i32* %listenSocket, align 4, !dbg !353
  %cmp = icmp eq i32 %0, -1, !dbg !355
  br i1 %cmp, label %if.then, label %if.end, !dbg !356

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !357

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !359
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !359
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !360
  store i16 2, i16* %sin_family, align 4, !dbg !361
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !362
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !363
  store i32 0, i32* %s_addr, align 4, !dbg !364
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !365
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !366
  store i16 %call1, i16* %sin_port, align 2, !dbg !367
  %2 = load i32, i32* %listenSocket, align 4, !dbg !368
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !370
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !371
  %cmp3 = icmp eq i32 %call2, -1, !dbg !372
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !373

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !374

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !376
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !378
  %cmp7 = icmp eq i32 %call6, -1, !dbg !379
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !380

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !381

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !383
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !384
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !385
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !386
  %cmp11 = icmp eq i32 %6, -1, !dbg !388
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !389

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !390

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !392
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !393
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !394
  %conv = trunc i64 %call14 to i32, !dbg !394
  store i32 %conv, i32* %recvResult, align 4, !dbg !395
  %8 = load i32, i32* %recvResult, align 4, !dbg !396
  %cmp15 = icmp eq i32 %8, -1, !dbg !398
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !399

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !400
  %cmp17 = icmp eq i32 %9, 0, !dbg !401
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !402

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !403

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !405
  %idxprom = sext i32 %10 to i64, !dbg !406
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !406
  store i8 0, i8* %arrayidx, align 1, !dbg !407
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !408
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !409
  store i32 %call22, i32* %data, align 4, !dbg !410
  br label %do.end, !dbg !411

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !412
  %cmp23 = icmp ne i32 %11, -1, !dbg !414
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !415

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !416
  %call26 = call i32 @close(i32 %12), !dbg !418
  br label %if.end27, !dbg !419

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !420
  %cmp28 = icmp ne i32 %13, -1, !dbg !422
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !423

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !424
  %call31 = call i32 @close(i32 %14), !dbg !426
  br label %if.end32, !dbg !427

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !428, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !431, metadata !DIExpression()), !dbg !432
  %call33 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !433
  %15 = bitcast i8* %call33 to i32*, !dbg !434
  store i32* %15, i32** %buffer, align 8, !dbg !432
  %16 = load i32*, i32** %buffer, align 8, !dbg !435
  %cmp34 = icmp eq i32* %16, null, !dbg !437
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !438

if.then36:                                        ; preds = %if.end32
  call void @exit(i32 -1) #11, !dbg !439
  unreachable, !dbg !439

if.end37:                                         ; preds = %if.end32
  store i32 0, i32* %i, align 4, !dbg !441
  br label %for.cond, !dbg !443

for.cond:                                         ; preds = %for.inc, %if.end37
  %17 = load i32, i32* %i, align 4, !dbg !444
  %cmp38 = icmp slt i32 %17, 10, !dbg !446
  br i1 %cmp38, label %for.body, label %for.end, !dbg !447

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !448
  %19 = load i32, i32* %i, align 4, !dbg !450
  %idxprom40 = sext i32 %19 to i64, !dbg !448
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !448
  store i32 0, i32* %arrayidx41, align 4, !dbg !451
  br label %for.inc, !dbg !452

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !453
  %inc = add nsw i32 %20, 1, !dbg !453
  store i32 %inc, i32* %i, align 4, !dbg !453
  br label %for.cond, !dbg !454, !llvm.loop !455

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !457
  %cmp42 = icmp sge i32 %21, 0, !dbg !459
  br i1 %cmp42, label %land.lhs.true, label %if.else, !dbg !460

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !461
  %cmp44 = icmp slt i32 %22, 10, !dbg !462
  br i1 %cmp44, label %if.then46, label %if.else, !dbg !463

if.then46:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !464
  %24 = load i32, i32* %data, align 4, !dbg !466
  %idxprom47 = sext i32 %24 to i64, !dbg !464
  %arrayidx48 = getelementptr inbounds i32, i32* %23, i64 %idxprom47, !dbg !464
  store i32 1, i32* %arrayidx48, align 4, !dbg !467
  store i32 0, i32* %i, align 4, !dbg !468
  br label %for.cond49, !dbg !470

for.cond49:                                       ; preds = %for.inc55, %if.then46
  %25 = load i32, i32* %i, align 4, !dbg !471
  %cmp50 = icmp slt i32 %25, 10, !dbg !473
  br i1 %cmp50, label %for.body52, label %for.end57, !dbg !474

for.body52:                                       ; preds = %for.cond49
  %26 = load i32*, i32** %buffer, align 8, !dbg !475
  %27 = load i32, i32* %i, align 4, !dbg !477
  %idxprom53 = sext i32 %27 to i64, !dbg !475
  %arrayidx54 = getelementptr inbounds i32, i32* %26, i64 %idxprom53, !dbg !475
  %28 = load i32, i32* %arrayidx54, align 4, !dbg !475
  call void @printIntLine(i32 %28), !dbg !478
  br label %for.inc55, !dbg !479

for.inc55:                                        ; preds = %for.body52
  %29 = load i32, i32* %i, align 4, !dbg !480
  %inc56 = add nsw i32 %29, 1, !dbg !480
  store i32 %inc56, i32* %i, align 4, !dbg !480
  br label %for.cond49, !dbg !481, !llvm.loop !482

for.end57:                                        ; preds = %for.cond49
  br label %if.end58, !dbg !484

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !485
  br label %if.end58

if.end58:                                         ; preds = %if.else, %for.end57
  %30 = load i32*, i32** %buffer, align 8, !dbg !487
  %31 = bitcast i32* %30 to i8*, !dbg !487
  call void @free(i8* %31) #8, !dbg !488
  ret void, !dbg !489
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_bad", scope: !74, file: !74, line: 44, type: !75, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01.c", directory: "/home/joelyang/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 46, type: !65)
!79 = !DILocation(line: 46, column: 9, scope: !73)
!80 = !DILocation(line: 48, column: 10, scope: !73)
!81 = !DILocalVariable(name: "recvResult", scope: !82, file: !74, line: 54, type: !65)
!82 = distinct !DILexicalBlock(scope: !73, file: !74, line: 49, column: 5)
!83 = !DILocation(line: 54, column: 13, scope: !82)
!84 = !DILocalVariable(name: "service", scope: !82, file: !74, line: 55, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !86)
!86 = !{!87, !88, !92, !96}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !85, file: !17, line: 240, baseType: !56, size: 16)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !85, file: !17, line: 241, baseType: !89, size: 16, offset: 16)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !85, file: !17, line: 242, baseType: !93, size: 32, offset: 32)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !94)
!94 = !{!95}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !93, file: !17, line: 33, baseType: !46, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !85, file: !17, line: 245, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 55, column: 28, scope: !82)
!102 = !DILocalVariable(name: "listenSocket", scope: !82, file: !74, line: 56, type: !65)
!103 = !DILocation(line: 56, column: 16, scope: !82)
!104 = !DILocalVariable(name: "acceptSocket", scope: !82, file: !74, line: 57, type: !65)
!105 = !DILocation(line: 57, column: 16, scope: !82)
!106 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !74, line: 58, type: !60)
!107 = !DILocation(line: 58, column: 14, scope: !82)
!108 = !DILocation(line: 59, column: 9, scope: !82)
!109 = !DILocation(line: 69, column: 28, scope: !110)
!110 = distinct !DILexicalBlock(scope: !82, file: !74, line: 60, column: 9)
!111 = !DILocation(line: 69, column: 26, scope: !110)
!112 = !DILocation(line: 70, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !74, line: 70, column: 17)
!114 = !DILocation(line: 70, column: 30, scope: !113)
!115 = !DILocation(line: 70, column: 17, scope: !110)
!116 = !DILocation(line: 72, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !74, line: 71, column: 13)
!118 = !DILocation(line: 74, column: 13, scope: !110)
!119 = !DILocation(line: 75, column: 21, scope: !110)
!120 = !DILocation(line: 75, column: 32, scope: !110)
!121 = !DILocation(line: 76, column: 21, scope: !110)
!122 = !DILocation(line: 76, column: 30, scope: !110)
!123 = !DILocation(line: 76, column: 37, scope: !110)
!124 = !DILocation(line: 77, column: 32, scope: !110)
!125 = !DILocation(line: 77, column: 21, scope: !110)
!126 = !DILocation(line: 77, column: 30, scope: !110)
!127 = !DILocation(line: 78, column: 22, scope: !128)
!128 = distinct !DILexicalBlock(scope: !110, file: !74, line: 78, column: 17)
!129 = !DILocation(line: 78, column: 36, scope: !128)
!130 = !DILocation(line: 78, column: 17, scope: !128)
!131 = !DILocation(line: 78, column: 81, scope: !128)
!132 = !DILocation(line: 78, column: 17, scope: !110)
!133 = !DILocation(line: 80, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !74, line: 79, column: 13)
!135 = !DILocation(line: 82, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !110, file: !74, line: 82, column: 17)
!137 = !DILocation(line: 82, column: 17, scope: !136)
!138 = !DILocation(line: 82, column: 54, scope: !136)
!139 = !DILocation(line: 82, column: 17, scope: !110)
!140 = !DILocation(line: 84, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !74, line: 83, column: 13)
!142 = !DILocation(line: 86, column: 35, scope: !110)
!143 = !DILocation(line: 86, column: 28, scope: !110)
!144 = !DILocation(line: 86, column: 26, scope: !110)
!145 = !DILocation(line: 87, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !110, file: !74, line: 87, column: 17)
!147 = !DILocation(line: 87, column: 30, scope: !146)
!148 = !DILocation(line: 87, column: 17, scope: !110)
!149 = !DILocation(line: 89, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !74, line: 88, column: 13)
!151 = !DILocation(line: 92, column: 31, scope: !110)
!152 = !DILocation(line: 92, column: 45, scope: !110)
!153 = !DILocation(line: 92, column: 26, scope: !110)
!154 = !DILocation(line: 92, column: 24, scope: !110)
!155 = !DILocation(line: 93, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !110, file: !74, line: 93, column: 17)
!157 = !DILocation(line: 93, column: 28, scope: !156)
!158 = !DILocation(line: 93, column: 44, scope: !156)
!159 = !DILocation(line: 93, column: 47, scope: !156)
!160 = !DILocation(line: 93, column: 58, scope: !156)
!161 = !DILocation(line: 93, column: 17, scope: !110)
!162 = !DILocation(line: 95, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !74, line: 94, column: 13)
!164 = !DILocation(line: 98, column: 25, scope: !110)
!165 = !DILocation(line: 98, column: 13, scope: !110)
!166 = !DILocation(line: 98, column: 37, scope: !110)
!167 = !DILocation(line: 100, column: 25, scope: !110)
!168 = !DILocation(line: 100, column: 20, scope: !110)
!169 = !DILocation(line: 100, column: 18, scope: !110)
!170 = !DILocation(line: 101, column: 9, scope: !110)
!171 = !DILocation(line: 103, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !82, file: !74, line: 103, column: 13)
!173 = !DILocation(line: 103, column: 26, scope: !172)
!174 = !DILocation(line: 103, column: 13, scope: !82)
!175 = !DILocation(line: 105, column: 26, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !74, line: 104, column: 9)
!177 = !DILocation(line: 105, column: 13, scope: !176)
!178 = !DILocation(line: 106, column: 9, scope: !176)
!179 = !DILocation(line: 107, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !82, file: !74, line: 107, column: 13)
!181 = !DILocation(line: 107, column: 26, scope: !180)
!182 = !DILocation(line: 107, column: 13, scope: !82)
!183 = !DILocation(line: 109, column: 26, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !74, line: 108, column: 9)
!185 = !DILocation(line: 109, column: 13, scope: !184)
!186 = !DILocation(line: 110, column: 9, scope: !184)
!187 = !DILocalVariable(name: "i", scope: !188, file: !74, line: 119, type: !65)
!188 = distinct !DILexicalBlock(scope: !73, file: !74, line: 118, column: 5)
!189 = !DILocation(line: 119, column: 13, scope: !188)
!190 = !DILocalVariable(name: "buffer", scope: !188, file: !74, line: 120, type: !64)
!191 = !DILocation(line: 120, column: 15, scope: !188)
!192 = !DILocation(line: 120, column: 31, scope: !188)
!193 = !DILocation(line: 120, column: 24, scope: !188)
!194 = !DILocation(line: 121, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !188, file: !74, line: 121, column: 13)
!196 = !DILocation(line: 121, column: 20, scope: !195)
!197 = !DILocation(line: 121, column: 13, scope: !188)
!198 = !DILocation(line: 121, column: 30, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !74, line: 121, column: 29)
!200 = !DILocation(line: 123, column: 16, scope: !201)
!201 = distinct !DILexicalBlock(scope: !188, file: !74, line: 123, column: 9)
!202 = !DILocation(line: 123, column: 14, scope: !201)
!203 = !DILocation(line: 123, column: 21, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !74, line: 123, column: 9)
!205 = !DILocation(line: 123, column: 23, scope: !204)
!206 = !DILocation(line: 123, column: 9, scope: !201)
!207 = !DILocation(line: 125, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !74, line: 124, column: 9)
!209 = !DILocation(line: 125, column: 20, scope: !208)
!210 = !DILocation(line: 125, column: 23, scope: !208)
!211 = !DILocation(line: 126, column: 9, scope: !208)
!212 = !DILocation(line: 123, column: 30, scope: !204)
!213 = !DILocation(line: 123, column: 9, scope: !204)
!214 = distinct !{!214, !206, !215, !216}
!215 = !DILocation(line: 126, column: 9, scope: !201)
!216 = !{!"llvm.loop.mustprogress"}
!217 = !DILocation(line: 129, column: 13, scope: !218)
!218 = distinct !DILexicalBlock(scope: !188, file: !74, line: 129, column: 13)
!219 = !DILocation(line: 129, column: 18, scope: !218)
!220 = !DILocation(line: 129, column: 13, scope: !188)
!221 = !DILocation(line: 131, column: 13, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !74, line: 130, column: 9)
!223 = !DILocation(line: 131, column: 20, scope: !222)
!224 = !DILocation(line: 131, column: 26, scope: !222)
!225 = !DILocation(line: 133, column: 19, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !74, line: 133, column: 13)
!227 = !DILocation(line: 133, column: 17, scope: !226)
!228 = !DILocation(line: 133, column: 24, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !74, line: 133, column: 13)
!230 = !DILocation(line: 133, column: 26, scope: !229)
!231 = !DILocation(line: 133, column: 13, scope: !226)
!232 = !DILocation(line: 135, column: 30, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !74, line: 134, column: 13)
!234 = !DILocation(line: 135, column: 37, scope: !233)
!235 = !DILocation(line: 135, column: 17, scope: !233)
!236 = !DILocation(line: 136, column: 13, scope: !233)
!237 = !DILocation(line: 133, column: 33, scope: !229)
!238 = !DILocation(line: 133, column: 13, scope: !229)
!239 = distinct !{!239, !231, !240, !216}
!240 = !DILocation(line: 136, column: 13, scope: !226)
!241 = !DILocation(line: 137, column: 9, scope: !222)
!242 = !DILocation(line: 140, column: 13, scope: !243)
!243 = distinct !DILexicalBlock(scope: !218, file: !74, line: 139, column: 9)
!244 = !DILocation(line: 142, column: 14, scope: !188)
!245 = !DILocation(line: 142, column: 9, scope: !188)
!246 = !DILocation(line: 144, column: 1, scope: !73)
!247 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_good", scope: !74, file: !74, line: 289, type: !75, scopeLine: 290, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!248 = !DILocation(line: 291, column: 5, scope: !247)
!249 = !DILocation(line: 292, column: 5, scope: !247)
!250 = !DILocation(line: 293, column: 1, scope: !247)
!251 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 304, type: !252, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!252 = !DISubroutineType(types: !253)
!253 = !{!65, !65, !254}
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !255, size: 64)
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!256 = !DILocalVariable(name: "argc", arg: 1, scope: !251, file: !74, line: 304, type: !65)
!257 = !DILocation(line: 304, column: 14, scope: !251)
!258 = !DILocalVariable(name: "argv", arg: 2, scope: !251, file: !74, line: 304, type: !254)
!259 = !DILocation(line: 304, column: 27, scope: !251)
!260 = !DILocation(line: 307, column: 22, scope: !251)
!261 = !DILocation(line: 307, column: 12, scope: !251)
!262 = !DILocation(line: 307, column: 5, scope: !251)
!263 = !DILocation(line: 309, column: 5, scope: !251)
!264 = !DILocation(line: 310, column: 5, scope: !251)
!265 = !DILocation(line: 311, column: 5, scope: !251)
!266 = !DILocation(line: 314, column: 5, scope: !251)
!267 = !DILocation(line: 315, column: 5, scope: !251)
!268 = !DILocation(line: 316, column: 5, scope: !251)
!269 = !DILocation(line: 318, column: 5, scope: !251)
!270 = distinct !DISubprogram(name: "goodG2B", scope: !74, file: !74, line: 151, type: !75, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!271 = !DILocalVariable(name: "data", scope: !270, file: !74, line: 153, type: !65)
!272 = !DILocation(line: 153, column: 9, scope: !270)
!273 = !DILocation(line: 155, column: 10, scope: !270)
!274 = !DILocation(line: 158, column: 10, scope: !270)
!275 = !DILocalVariable(name: "i", scope: !276, file: !74, line: 160, type: !65)
!276 = distinct !DILexicalBlock(scope: !270, file: !74, line: 159, column: 5)
!277 = !DILocation(line: 160, column: 13, scope: !276)
!278 = !DILocalVariable(name: "buffer", scope: !276, file: !74, line: 161, type: !64)
!279 = !DILocation(line: 161, column: 15, scope: !276)
!280 = !DILocation(line: 161, column: 31, scope: !276)
!281 = !DILocation(line: 161, column: 24, scope: !276)
!282 = !DILocation(line: 162, column: 13, scope: !283)
!283 = distinct !DILexicalBlock(scope: !276, file: !74, line: 162, column: 13)
!284 = !DILocation(line: 162, column: 20, scope: !283)
!285 = !DILocation(line: 162, column: 13, scope: !276)
!286 = !DILocation(line: 162, column: 30, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !74, line: 162, column: 29)
!288 = !DILocation(line: 164, column: 16, scope: !289)
!289 = distinct !DILexicalBlock(scope: !276, file: !74, line: 164, column: 9)
!290 = !DILocation(line: 164, column: 14, scope: !289)
!291 = !DILocation(line: 164, column: 21, scope: !292)
!292 = distinct !DILexicalBlock(scope: !289, file: !74, line: 164, column: 9)
!293 = !DILocation(line: 164, column: 23, scope: !292)
!294 = !DILocation(line: 164, column: 9, scope: !289)
!295 = !DILocation(line: 166, column: 13, scope: !296)
!296 = distinct !DILexicalBlock(scope: !292, file: !74, line: 165, column: 9)
!297 = !DILocation(line: 166, column: 20, scope: !296)
!298 = !DILocation(line: 166, column: 23, scope: !296)
!299 = !DILocation(line: 167, column: 9, scope: !296)
!300 = !DILocation(line: 164, column: 30, scope: !292)
!301 = !DILocation(line: 164, column: 9, scope: !292)
!302 = distinct !{!302, !294, !303, !216}
!303 = !DILocation(line: 167, column: 9, scope: !289)
!304 = !DILocation(line: 170, column: 13, scope: !305)
!305 = distinct !DILexicalBlock(scope: !276, file: !74, line: 170, column: 13)
!306 = !DILocation(line: 170, column: 18, scope: !305)
!307 = !DILocation(line: 170, column: 13, scope: !276)
!308 = !DILocation(line: 172, column: 13, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !74, line: 171, column: 9)
!310 = !DILocation(line: 172, column: 20, scope: !309)
!311 = !DILocation(line: 172, column: 26, scope: !309)
!312 = !DILocation(line: 174, column: 19, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !74, line: 174, column: 13)
!314 = !DILocation(line: 174, column: 17, scope: !313)
!315 = !DILocation(line: 174, column: 24, scope: !316)
!316 = distinct !DILexicalBlock(scope: !313, file: !74, line: 174, column: 13)
!317 = !DILocation(line: 174, column: 26, scope: !316)
!318 = !DILocation(line: 174, column: 13, scope: !313)
!319 = !DILocation(line: 176, column: 30, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !74, line: 175, column: 13)
!321 = !DILocation(line: 176, column: 37, scope: !320)
!322 = !DILocation(line: 176, column: 17, scope: !320)
!323 = !DILocation(line: 177, column: 13, scope: !320)
!324 = !DILocation(line: 174, column: 33, scope: !316)
!325 = !DILocation(line: 174, column: 13, scope: !316)
!326 = distinct !{!326, !318, !327, !216}
!327 = !DILocation(line: 177, column: 13, scope: !313)
!328 = !DILocation(line: 178, column: 9, scope: !309)
!329 = !DILocation(line: 181, column: 13, scope: !330)
!330 = distinct !DILexicalBlock(scope: !305, file: !74, line: 180, column: 9)
!331 = !DILocation(line: 183, column: 14, scope: !276)
!332 = !DILocation(line: 183, column: 9, scope: !276)
!333 = !DILocation(line: 185, column: 1, scope: !270)
!334 = distinct !DISubprogram(name: "goodB2G", scope: !74, file: !74, line: 188, type: !75, scopeLine: 189, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!335 = !DILocalVariable(name: "data", scope: !334, file: !74, line: 190, type: !65)
!336 = !DILocation(line: 190, column: 9, scope: !334)
!337 = !DILocation(line: 192, column: 10, scope: !334)
!338 = !DILocalVariable(name: "recvResult", scope: !339, file: !74, line: 198, type: !65)
!339 = distinct !DILexicalBlock(scope: !334, file: !74, line: 193, column: 5)
!340 = !DILocation(line: 198, column: 13, scope: !339)
!341 = !DILocalVariable(name: "service", scope: !339, file: !74, line: 199, type: !85)
!342 = !DILocation(line: 199, column: 28, scope: !339)
!343 = !DILocalVariable(name: "listenSocket", scope: !339, file: !74, line: 200, type: !65)
!344 = !DILocation(line: 200, column: 16, scope: !339)
!345 = !DILocalVariable(name: "acceptSocket", scope: !339, file: !74, line: 201, type: !65)
!346 = !DILocation(line: 201, column: 16, scope: !339)
!347 = !DILocalVariable(name: "inputBuffer", scope: !339, file: !74, line: 202, type: !60)
!348 = !DILocation(line: 202, column: 14, scope: !339)
!349 = !DILocation(line: 203, column: 9, scope: !339)
!350 = !DILocation(line: 213, column: 28, scope: !351)
!351 = distinct !DILexicalBlock(scope: !339, file: !74, line: 204, column: 9)
!352 = !DILocation(line: 213, column: 26, scope: !351)
!353 = !DILocation(line: 214, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !351, file: !74, line: 214, column: 17)
!355 = !DILocation(line: 214, column: 30, scope: !354)
!356 = !DILocation(line: 214, column: 17, scope: !351)
!357 = !DILocation(line: 216, column: 17, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !74, line: 215, column: 13)
!359 = !DILocation(line: 218, column: 13, scope: !351)
!360 = !DILocation(line: 219, column: 21, scope: !351)
!361 = !DILocation(line: 219, column: 32, scope: !351)
!362 = !DILocation(line: 220, column: 21, scope: !351)
!363 = !DILocation(line: 220, column: 30, scope: !351)
!364 = !DILocation(line: 220, column: 37, scope: !351)
!365 = !DILocation(line: 221, column: 32, scope: !351)
!366 = !DILocation(line: 221, column: 21, scope: !351)
!367 = !DILocation(line: 221, column: 30, scope: !351)
!368 = !DILocation(line: 222, column: 22, scope: !369)
!369 = distinct !DILexicalBlock(scope: !351, file: !74, line: 222, column: 17)
!370 = !DILocation(line: 222, column: 36, scope: !369)
!371 = !DILocation(line: 222, column: 17, scope: !369)
!372 = !DILocation(line: 222, column: 81, scope: !369)
!373 = !DILocation(line: 222, column: 17, scope: !351)
!374 = !DILocation(line: 224, column: 17, scope: !375)
!375 = distinct !DILexicalBlock(scope: !369, file: !74, line: 223, column: 13)
!376 = !DILocation(line: 226, column: 24, scope: !377)
!377 = distinct !DILexicalBlock(scope: !351, file: !74, line: 226, column: 17)
!378 = !DILocation(line: 226, column: 17, scope: !377)
!379 = !DILocation(line: 226, column: 54, scope: !377)
!380 = !DILocation(line: 226, column: 17, scope: !351)
!381 = !DILocation(line: 228, column: 17, scope: !382)
!382 = distinct !DILexicalBlock(scope: !377, file: !74, line: 227, column: 13)
!383 = !DILocation(line: 230, column: 35, scope: !351)
!384 = !DILocation(line: 230, column: 28, scope: !351)
!385 = !DILocation(line: 230, column: 26, scope: !351)
!386 = !DILocation(line: 231, column: 17, scope: !387)
!387 = distinct !DILexicalBlock(scope: !351, file: !74, line: 231, column: 17)
!388 = !DILocation(line: 231, column: 30, scope: !387)
!389 = !DILocation(line: 231, column: 17, scope: !351)
!390 = !DILocation(line: 233, column: 17, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !74, line: 232, column: 13)
!392 = !DILocation(line: 236, column: 31, scope: !351)
!393 = !DILocation(line: 236, column: 45, scope: !351)
!394 = !DILocation(line: 236, column: 26, scope: !351)
!395 = !DILocation(line: 236, column: 24, scope: !351)
!396 = !DILocation(line: 237, column: 17, scope: !397)
!397 = distinct !DILexicalBlock(scope: !351, file: !74, line: 237, column: 17)
!398 = !DILocation(line: 237, column: 28, scope: !397)
!399 = !DILocation(line: 237, column: 44, scope: !397)
!400 = !DILocation(line: 237, column: 47, scope: !397)
!401 = !DILocation(line: 237, column: 58, scope: !397)
!402 = !DILocation(line: 237, column: 17, scope: !351)
!403 = !DILocation(line: 239, column: 17, scope: !404)
!404 = distinct !DILexicalBlock(scope: !397, file: !74, line: 238, column: 13)
!405 = !DILocation(line: 242, column: 25, scope: !351)
!406 = !DILocation(line: 242, column: 13, scope: !351)
!407 = !DILocation(line: 242, column: 37, scope: !351)
!408 = !DILocation(line: 244, column: 25, scope: !351)
!409 = !DILocation(line: 244, column: 20, scope: !351)
!410 = !DILocation(line: 244, column: 18, scope: !351)
!411 = !DILocation(line: 245, column: 9, scope: !351)
!412 = !DILocation(line: 247, column: 13, scope: !413)
!413 = distinct !DILexicalBlock(scope: !339, file: !74, line: 247, column: 13)
!414 = !DILocation(line: 247, column: 26, scope: !413)
!415 = !DILocation(line: 247, column: 13, scope: !339)
!416 = !DILocation(line: 249, column: 26, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !74, line: 248, column: 9)
!418 = !DILocation(line: 249, column: 13, scope: !417)
!419 = !DILocation(line: 250, column: 9, scope: !417)
!420 = !DILocation(line: 251, column: 13, scope: !421)
!421 = distinct !DILexicalBlock(scope: !339, file: !74, line: 251, column: 13)
!422 = !DILocation(line: 251, column: 26, scope: !421)
!423 = !DILocation(line: 251, column: 13, scope: !339)
!424 = !DILocation(line: 253, column: 26, scope: !425)
!425 = distinct !DILexicalBlock(scope: !421, file: !74, line: 252, column: 9)
!426 = !DILocation(line: 253, column: 13, scope: !425)
!427 = !DILocation(line: 254, column: 9, scope: !425)
!428 = !DILocalVariable(name: "i", scope: !429, file: !74, line: 263, type: !65)
!429 = distinct !DILexicalBlock(scope: !334, file: !74, line: 262, column: 5)
!430 = !DILocation(line: 263, column: 13, scope: !429)
!431 = !DILocalVariable(name: "buffer", scope: !429, file: !74, line: 264, type: !64)
!432 = !DILocation(line: 264, column: 15, scope: !429)
!433 = !DILocation(line: 264, column: 31, scope: !429)
!434 = !DILocation(line: 264, column: 24, scope: !429)
!435 = !DILocation(line: 265, column: 13, scope: !436)
!436 = distinct !DILexicalBlock(scope: !429, file: !74, line: 265, column: 13)
!437 = !DILocation(line: 265, column: 20, scope: !436)
!438 = !DILocation(line: 265, column: 13, scope: !429)
!439 = !DILocation(line: 265, column: 30, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !74, line: 265, column: 29)
!441 = !DILocation(line: 267, column: 16, scope: !442)
!442 = distinct !DILexicalBlock(scope: !429, file: !74, line: 267, column: 9)
!443 = !DILocation(line: 267, column: 14, scope: !442)
!444 = !DILocation(line: 267, column: 21, scope: !445)
!445 = distinct !DILexicalBlock(scope: !442, file: !74, line: 267, column: 9)
!446 = !DILocation(line: 267, column: 23, scope: !445)
!447 = !DILocation(line: 267, column: 9, scope: !442)
!448 = !DILocation(line: 269, column: 13, scope: !449)
!449 = distinct !DILexicalBlock(scope: !445, file: !74, line: 268, column: 9)
!450 = !DILocation(line: 269, column: 20, scope: !449)
!451 = !DILocation(line: 269, column: 23, scope: !449)
!452 = !DILocation(line: 270, column: 9, scope: !449)
!453 = !DILocation(line: 267, column: 30, scope: !445)
!454 = !DILocation(line: 267, column: 9, scope: !445)
!455 = distinct !{!455, !447, !456, !216}
!456 = !DILocation(line: 270, column: 9, scope: !442)
!457 = !DILocation(line: 272, column: 13, scope: !458)
!458 = distinct !DILexicalBlock(scope: !429, file: !74, line: 272, column: 13)
!459 = !DILocation(line: 272, column: 18, scope: !458)
!460 = !DILocation(line: 272, column: 23, scope: !458)
!461 = !DILocation(line: 272, column: 26, scope: !458)
!462 = !DILocation(line: 272, column: 31, scope: !458)
!463 = !DILocation(line: 272, column: 13, scope: !429)
!464 = !DILocation(line: 274, column: 13, scope: !465)
!465 = distinct !DILexicalBlock(scope: !458, file: !74, line: 273, column: 9)
!466 = !DILocation(line: 274, column: 20, scope: !465)
!467 = !DILocation(line: 274, column: 26, scope: !465)
!468 = !DILocation(line: 276, column: 19, scope: !469)
!469 = distinct !DILexicalBlock(scope: !465, file: !74, line: 276, column: 13)
!470 = !DILocation(line: 276, column: 17, scope: !469)
!471 = !DILocation(line: 276, column: 24, scope: !472)
!472 = distinct !DILexicalBlock(scope: !469, file: !74, line: 276, column: 13)
!473 = !DILocation(line: 276, column: 26, scope: !472)
!474 = !DILocation(line: 276, column: 13, scope: !469)
!475 = !DILocation(line: 278, column: 30, scope: !476)
!476 = distinct !DILexicalBlock(scope: !472, file: !74, line: 277, column: 13)
!477 = !DILocation(line: 278, column: 37, scope: !476)
!478 = !DILocation(line: 278, column: 17, scope: !476)
!479 = !DILocation(line: 279, column: 13, scope: !476)
!480 = !DILocation(line: 276, column: 33, scope: !472)
!481 = !DILocation(line: 276, column: 13, scope: !472)
!482 = distinct !{!482, !474, !483, !216}
!483 = !DILocation(line: 279, column: 13, scope: !469)
!484 = !DILocation(line: 280, column: 9, scope: !465)
!485 = !DILocation(line: 283, column: 13, scope: !486)
!486 = distinct !DILexicalBlock(scope: !458, file: !74, line: 282, column: 9)
!487 = !DILocation(line: 285, column: 14, scope: !429)
!488 = !DILocation(line: 285, column: 9, scope: !429)
!489 = !DILocation(line: 287, column: 1, scope: !334)
