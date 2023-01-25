; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_bad() #0 !dbg !73 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !81, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !86, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %listenSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %acceptSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  br label %do.body, !dbg !110

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !111
  store i32 %call, i32* %listenSocket, align 4, !dbg !113
  %0 = load i32, i32* %listenSocket, align 4, !dbg !114
  %cmp = icmp eq i32 %0, -1, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !118

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !120
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !121
  store i16 2, i16* %sin_family, align 4, !dbg !122
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !123
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !124
  store i32 0, i32* %s_addr, align 4, !dbg !125
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !126
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !127
  store i16 %call1, i16* %sin_port, align 2, !dbg !128
  %2 = load i32, i32* %listenSocket, align 4, !dbg !129
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !131
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !132
  %cmp3 = icmp eq i32 %call2, -1, !dbg !133
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !134

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !135

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !137
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !139
  %cmp7 = icmp eq i32 %call6, -1, !dbg !140
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !141

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !142

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !144
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !145
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !146
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !147
  %cmp11 = icmp eq i32 %6, -1, !dbg !149
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !150

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !151

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !153
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !154
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !155
  %conv = trunc i64 %call14 to i32, !dbg !155
  store i32 %conv, i32* %recvResult, align 4, !dbg !156
  %8 = load i32, i32* %recvResult, align 4, !dbg !157
  %cmp15 = icmp eq i32 %8, -1, !dbg !159
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !160

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !161
  %cmp17 = icmp eq i32 %9, 0, !dbg !162
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !163

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !164

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !166
  %idxprom = sext i32 %10 to i64, !dbg !167
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !169
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !170
  store i32 %call22, i32* %data, align 4, !dbg !171
  br label %do.end, !dbg !172

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !173
  %cmp23 = icmp ne i32 %11, -1, !dbg !175
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !176

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !177
  %call26 = call i32 @close(i32 %12), !dbg !179
  br label %if.end27, !dbg !180

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !181
  %cmp28 = icmp ne i32 %13, -1, !dbg !183
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !184

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !185
  %call31 = call i32 @close(i32 %14), !dbg !187
  br label %if.end32, !dbg !188

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !189, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !194, metadata !DIExpression()), !dbg !195
  %call33 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !196
  %15 = bitcast i8* %call33 to i32*, !dbg !197
  store i32* %15, i32** %buffer, align 8, !dbg !195
  %16 = load i32*, i32** %buffer, align 8, !dbg !198
  %cmp34 = icmp eq i32* %16, null, !dbg !200
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !201

if.then36:                                        ; preds = %if.end32
  call void @exit(i32 -1) #11, !dbg !202
  unreachable, !dbg !202

if.end37:                                         ; preds = %if.end32
  store i32 0, i32* %i, align 4, !dbg !204
  br label %for.cond, !dbg !206

for.cond:                                         ; preds = %for.inc, %if.end37
  %17 = load i32, i32* %i, align 4, !dbg !207
  %cmp38 = icmp slt i32 %17, 10, !dbg !209
  br i1 %cmp38, label %for.body, label %for.end, !dbg !210

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !211
  %19 = load i32, i32* %i, align 4, !dbg !213
  %idxprom40 = sext i32 %19 to i64, !dbg !211
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !211
  store i32 0, i32* %arrayidx41, align 4, !dbg !214
  br label %for.inc, !dbg !215

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !216
  %inc = add nsw i32 %20, 1, !dbg !216
  store i32 %inc, i32* %i, align 4, !dbg !216
  br label %for.cond, !dbg !217, !llvm.loop !218

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !221
  %cmp42 = icmp sge i32 %21, 0, !dbg !223
  br i1 %cmp42, label %if.then44, label %if.else, !dbg !224

if.then44:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !225
  %23 = load i32, i32* %data, align 4, !dbg !227
  %idxprom45 = sext i32 %23 to i64, !dbg !225
  %arrayidx46 = getelementptr inbounds i32, i32* %22, i64 %idxprom45, !dbg !225
  store i32 1, i32* %arrayidx46, align 4, !dbg !228
  store i32 0, i32* %i, align 4, !dbg !229
  br label %for.cond47, !dbg !231

for.cond47:                                       ; preds = %for.inc53, %if.then44
  %24 = load i32, i32* %i, align 4, !dbg !232
  %cmp48 = icmp slt i32 %24, 10, !dbg !234
  br i1 %cmp48, label %for.body50, label %for.end55, !dbg !235

for.body50:                                       ; preds = %for.cond47
  %25 = load i32*, i32** %buffer, align 8, !dbg !236
  %26 = load i32, i32* %i, align 4, !dbg !238
  %idxprom51 = sext i32 %26 to i64, !dbg !236
  %arrayidx52 = getelementptr inbounds i32, i32* %25, i64 %idxprom51, !dbg !236
  %27 = load i32, i32* %arrayidx52, align 4, !dbg !236
  call void @printIntLine(i32 %27), !dbg !239
  br label %for.inc53, !dbg !240

for.inc53:                                        ; preds = %for.body50
  %28 = load i32, i32* %i, align 4, !dbg !241
  %inc54 = add nsw i32 %28, 1, !dbg !241
  store i32 %inc54, i32* %i, align 4, !dbg !241
  br label %for.cond47, !dbg !242, !llvm.loop !243

for.end55:                                        ; preds = %for.cond47
  br label %if.end56, !dbg !245

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !246
  br label %if.end56

if.end56:                                         ; preds = %if.else, %for.end55
  %29 = load i32*, i32** %buffer, align 8, !dbg !248
  %30 = bitcast i32* %29 to i8*, !dbg !248
  call void @free(i8* %30) #8, !dbg !249
  ret void, !dbg !250
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_good() #0 !dbg !251 {
entry:
  call void @goodB2G1(), !dbg !252
  call void @goodB2G2(), !dbg !253
  call void @goodG2B1(), !dbg !254
  call void @goodG2B2(), !dbg !255
  ret void, !dbg !256
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !257 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !262, metadata !DIExpression()), !dbg !263
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !264, metadata !DIExpression()), !dbg !265
  %call = call i64 @time(i64* null) #8, !dbg !266
  %conv = trunc i64 %call to i32, !dbg !267
  call void @srand(i32 %conv) #8, !dbg !268
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !269
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_good(), !dbg !270
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !271
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !272
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_bad(), !dbg !273
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !274
  ret i32 0, !dbg !275
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !276 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !277, metadata !DIExpression()), !dbg !278
  store i32 -1, i32* %data, align 4, !dbg !279
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !280, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !285, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !287, metadata !DIExpression()), !dbg !288
  store i32 -1, i32* %listenSocket, align 4, !dbg !288
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !289, metadata !DIExpression()), !dbg !290
  store i32 -1, i32* %acceptSocket, align 4, !dbg !290
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !291, metadata !DIExpression()), !dbg !292
  br label %do.body, !dbg !293

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !294
  store i32 %call, i32* %listenSocket, align 4, !dbg !296
  %0 = load i32, i32* %listenSocket, align 4, !dbg !297
  %cmp = icmp eq i32 %0, -1, !dbg !299
  br i1 %cmp, label %if.then, label %if.end, !dbg !300

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !301

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !303
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !303
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !304
  store i16 2, i16* %sin_family, align 4, !dbg !305
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !306
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !307
  store i32 0, i32* %s_addr, align 4, !dbg !308
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !309
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !310
  store i16 %call1, i16* %sin_port, align 2, !dbg !311
  %2 = load i32, i32* %listenSocket, align 4, !dbg !312
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !314
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !315
  %cmp3 = icmp eq i32 %call2, -1, !dbg !316
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !317

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !318

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !320
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !322
  %cmp7 = icmp eq i32 %call6, -1, !dbg !323
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !324

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !325

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !327
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !328
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !329
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !330
  %cmp11 = icmp eq i32 %6, -1, !dbg !332
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !333

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !334

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !336
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !337
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !338
  %conv = trunc i64 %call14 to i32, !dbg !338
  store i32 %conv, i32* %recvResult, align 4, !dbg !339
  %8 = load i32, i32* %recvResult, align 4, !dbg !340
  %cmp15 = icmp eq i32 %8, -1, !dbg !342
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !343

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !344
  %cmp17 = icmp eq i32 %9, 0, !dbg !345
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !346

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !347

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !349
  %idxprom = sext i32 %10 to i64, !dbg !350
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !350
  store i8 0, i8* %arrayidx, align 1, !dbg !351
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !352
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !353
  store i32 %call22, i32* %data, align 4, !dbg !354
  br label %do.end, !dbg !355

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !356
  %cmp23 = icmp ne i32 %11, -1, !dbg !358
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !359

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !360
  %call26 = call i32 @close(i32 %12), !dbg !362
  br label %if.end27, !dbg !363

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !364
  %cmp28 = icmp ne i32 %13, -1, !dbg !366
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !367

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !368
  %call31 = call i32 @close(i32 %14), !dbg !370
  br label %if.end32, !dbg !371

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !372, metadata !DIExpression()), !dbg !376
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !377, metadata !DIExpression()), !dbg !378
  %call33 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !379
  %15 = bitcast i8* %call33 to i32*, !dbg !380
  store i32* %15, i32** %buffer, align 8, !dbg !378
  %16 = load i32*, i32** %buffer, align 8, !dbg !381
  %cmp34 = icmp eq i32* %16, null, !dbg !383
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !384

if.then36:                                        ; preds = %if.end32
  call void @exit(i32 -1) #11, !dbg !385
  unreachable, !dbg !385

if.end37:                                         ; preds = %if.end32
  store i32 0, i32* %i, align 4, !dbg !387
  br label %for.cond, !dbg !389

for.cond:                                         ; preds = %for.inc, %if.end37
  %17 = load i32, i32* %i, align 4, !dbg !390
  %cmp38 = icmp slt i32 %17, 10, !dbg !392
  br i1 %cmp38, label %for.body, label %for.end, !dbg !393

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !394
  %19 = load i32, i32* %i, align 4, !dbg !396
  %idxprom40 = sext i32 %19 to i64, !dbg !394
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !394
  store i32 0, i32* %arrayidx41, align 4, !dbg !397
  br label %for.inc, !dbg !398

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !399
  %inc = add nsw i32 %20, 1, !dbg !399
  store i32 %inc, i32* %i, align 4, !dbg !399
  br label %for.cond, !dbg !400, !llvm.loop !401

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !403
  %cmp42 = icmp sge i32 %21, 0, !dbg !405
  br i1 %cmp42, label %land.lhs.true, label %if.else, !dbg !406

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !407
  %cmp44 = icmp slt i32 %22, 10, !dbg !408
  br i1 %cmp44, label %if.then46, label %if.else, !dbg !409

if.then46:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !410
  %24 = load i32, i32* %data, align 4, !dbg !412
  %idxprom47 = sext i32 %24 to i64, !dbg !410
  %arrayidx48 = getelementptr inbounds i32, i32* %23, i64 %idxprom47, !dbg !410
  store i32 1, i32* %arrayidx48, align 4, !dbg !413
  store i32 0, i32* %i, align 4, !dbg !414
  br label %for.cond49, !dbg !416

for.cond49:                                       ; preds = %for.inc55, %if.then46
  %25 = load i32, i32* %i, align 4, !dbg !417
  %cmp50 = icmp slt i32 %25, 10, !dbg !419
  br i1 %cmp50, label %for.body52, label %for.end57, !dbg !420

for.body52:                                       ; preds = %for.cond49
  %26 = load i32*, i32** %buffer, align 8, !dbg !421
  %27 = load i32, i32* %i, align 4, !dbg !423
  %idxprom53 = sext i32 %27 to i64, !dbg !421
  %arrayidx54 = getelementptr inbounds i32, i32* %26, i64 %idxprom53, !dbg !421
  %28 = load i32, i32* %arrayidx54, align 4, !dbg !421
  call void @printIntLine(i32 %28), !dbg !424
  br label %for.inc55, !dbg !425

for.inc55:                                        ; preds = %for.body52
  %29 = load i32, i32* %i, align 4, !dbg !426
  %inc56 = add nsw i32 %29, 1, !dbg !426
  store i32 %inc56, i32* %i, align 4, !dbg !426
  br label %for.cond49, !dbg !427, !llvm.loop !428

for.end57:                                        ; preds = %for.cond49
  br label %if.end58, !dbg !430

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !431
  br label %if.end58

if.end58:                                         ; preds = %if.else, %for.end57
  %30 = load i32*, i32** %buffer, align 8, !dbg !433
  %31 = bitcast i32* %30 to i8*, !dbg !433
  call void @free(i8* %31) #8, !dbg !434
  ret void, !dbg !435
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !436 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !437, metadata !DIExpression()), !dbg !438
  store i32 -1, i32* %data, align 4, !dbg !439
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !440, metadata !DIExpression()), !dbg !444
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !445, metadata !DIExpression()), !dbg !446
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !447, metadata !DIExpression()), !dbg !448
  store i32 -1, i32* %listenSocket, align 4, !dbg !448
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !449, metadata !DIExpression()), !dbg !450
  store i32 -1, i32* %acceptSocket, align 4, !dbg !450
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !451, metadata !DIExpression()), !dbg !452
  br label %do.body, !dbg !453

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !454
  store i32 %call, i32* %listenSocket, align 4, !dbg !456
  %0 = load i32, i32* %listenSocket, align 4, !dbg !457
  %cmp = icmp eq i32 %0, -1, !dbg !459
  br i1 %cmp, label %if.then, label %if.end, !dbg !460

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !461

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !463
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !463
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !464
  store i16 2, i16* %sin_family, align 4, !dbg !465
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !466
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !467
  store i32 0, i32* %s_addr, align 4, !dbg !468
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !469
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !470
  store i16 %call1, i16* %sin_port, align 2, !dbg !471
  %2 = load i32, i32* %listenSocket, align 4, !dbg !472
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !474
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !475
  %cmp3 = icmp eq i32 %call2, -1, !dbg !476
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !477

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !478

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !480
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !482
  %cmp7 = icmp eq i32 %call6, -1, !dbg !483
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !484

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !485

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !487
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !488
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !489
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !490
  %cmp11 = icmp eq i32 %6, -1, !dbg !492
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !493

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !494

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !496
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !497
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !498
  %conv = trunc i64 %call14 to i32, !dbg !498
  store i32 %conv, i32* %recvResult, align 4, !dbg !499
  %8 = load i32, i32* %recvResult, align 4, !dbg !500
  %cmp15 = icmp eq i32 %8, -1, !dbg !502
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !503

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !504
  %cmp17 = icmp eq i32 %9, 0, !dbg !505
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !506

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !507

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !509
  %idxprom = sext i32 %10 to i64, !dbg !510
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !510
  store i8 0, i8* %arrayidx, align 1, !dbg !511
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !512
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !513
  store i32 %call22, i32* %data, align 4, !dbg !514
  br label %do.end, !dbg !515

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !516
  %cmp23 = icmp ne i32 %11, -1, !dbg !518
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !519

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !520
  %call26 = call i32 @close(i32 %12), !dbg !522
  br label %if.end27, !dbg !523

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !524
  %cmp28 = icmp ne i32 %13, -1, !dbg !526
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !527

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !528
  %call31 = call i32 @close(i32 %14), !dbg !530
  br label %if.end32, !dbg !531

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !532, metadata !DIExpression()), !dbg !536
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !537, metadata !DIExpression()), !dbg !538
  %call33 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !539
  %15 = bitcast i8* %call33 to i32*, !dbg !540
  store i32* %15, i32** %buffer, align 8, !dbg !538
  %16 = load i32*, i32** %buffer, align 8, !dbg !541
  %cmp34 = icmp eq i32* %16, null, !dbg !543
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !544

if.then36:                                        ; preds = %if.end32
  call void @exit(i32 -1) #11, !dbg !545
  unreachable, !dbg !545

if.end37:                                         ; preds = %if.end32
  store i32 0, i32* %i, align 4, !dbg !547
  br label %for.cond, !dbg !549

for.cond:                                         ; preds = %for.inc, %if.end37
  %17 = load i32, i32* %i, align 4, !dbg !550
  %cmp38 = icmp slt i32 %17, 10, !dbg !552
  br i1 %cmp38, label %for.body, label %for.end, !dbg !553

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !554
  %19 = load i32, i32* %i, align 4, !dbg !556
  %idxprom40 = sext i32 %19 to i64, !dbg !554
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !554
  store i32 0, i32* %arrayidx41, align 4, !dbg !557
  br label %for.inc, !dbg !558

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !559
  %inc = add nsw i32 %20, 1, !dbg !559
  store i32 %inc, i32* %i, align 4, !dbg !559
  br label %for.cond, !dbg !560, !llvm.loop !561

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !563
  %cmp42 = icmp sge i32 %21, 0, !dbg !565
  br i1 %cmp42, label %land.lhs.true, label %if.else, !dbg !566

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !567
  %cmp44 = icmp slt i32 %22, 10, !dbg !568
  br i1 %cmp44, label %if.then46, label %if.else, !dbg !569

if.then46:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !570
  %24 = load i32, i32* %data, align 4, !dbg !572
  %idxprom47 = sext i32 %24 to i64, !dbg !570
  %arrayidx48 = getelementptr inbounds i32, i32* %23, i64 %idxprom47, !dbg !570
  store i32 1, i32* %arrayidx48, align 4, !dbg !573
  store i32 0, i32* %i, align 4, !dbg !574
  br label %for.cond49, !dbg !576

for.cond49:                                       ; preds = %for.inc55, %if.then46
  %25 = load i32, i32* %i, align 4, !dbg !577
  %cmp50 = icmp slt i32 %25, 10, !dbg !579
  br i1 %cmp50, label %for.body52, label %for.end57, !dbg !580

for.body52:                                       ; preds = %for.cond49
  %26 = load i32*, i32** %buffer, align 8, !dbg !581
  %27 = load i32, i32* %i, align 4, !dbg !583
  %idxprom53 = sext i32 %27 to i64, !dbg !581
  %arrayidx54 = getelementptr inbounds i32, i32* %26, i64 %idxprom53, !dbg !581
  %28 = load i32, i32* %arrayidx54, align 4, !dbg !581
  call void @printIntLine(i32 %28), !dbg !584
  br label %for.inc55, !dbg !585

for.inc55:                                        ; preds = %for.body52
  %29 = load i32, i32* %i, align 4, !dbg !586
  %inc56 = add nsw i32 %29, 1, !dbg !586
  store i32 %inc56, i32* %i, align 4, !dbg !586
  br label %for.cond49, !dbg !587, !llvm.loop !588

for.end57:                                        ; preds = %for.cond49
  br label %if.end58, !dbg !590

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !591
  br label %if.end58

if.end58:                                         ; preds = %if.else, %for.end57
  %30 = load i32*, i32** %buffer, align 8, !dbg !593
  %31 = bitcast i32* %30 to i8*, !dbg !593
  call void @free(i8* %31) #8, !dbg !594
  ret void, !dbg !595
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !596 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !597, metadata !DIExpression()), !dbg !598
  store i32 -1, i32* %data, align 4, !dbg !599
  store i32 7, i32* %data, align 4, !dbg !600
  call void @llvm.dbg.declare(metadata i32* %i, metadata !603, metadata !DIExpression()), !dbg !607
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !608, metadata !DIExpression()), !dbg !609
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !610
  %0 = bitcast i8* %call to i32*, !dbg !611
  store i32* %0, i32** %buffer, align 8, !dbg !609
  %1 = load i32*, i32** %buffer, align 8, !dbg !612
  %cmp = icmp eq i32* %1, null, !dbg !614
  br i1 %cmp, label %if.then, label %if.end, !dbg !615

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !616
  unreachable, !dbg !616

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !618
  br label %for.cond, !dbg !620

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !621
  %cmp1 = icmp slt i32 %2, 10, !dbg !623
  br i1 %cmp1, label %for.body, label %for.end, !dbg !624

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !625
  %4 = load i32, i32* %i, align 4, !dbg !627
  %idxprom = sext i32 %4 to i64, !dbg !625
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !625
  store i32 0, i32* %arrayidx, align 4, !dbg !628
  br label %for.inc, !dbg !629

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !630
  %inc = add nsw i32 %5, 1, !dbg !630
  store i32 %inc, i32* %i, align 4, !dbg !630
  br label %for.cond, !dbg !631, !llvm.loop !632

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !634
  %cmp2 = icmp sge i32 %6, 0, !dbg !636
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !637

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !638
  %8 = load i32, i32* %data, align 4, !dbg !640
  %idxprom4 = sext i32 %8 to i64, !dbg !638
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !638
  store i32 1, i32* %arrayidx5, align 4, !dbg !641
  store i32 0, i32* %i, align 4, !dbg !642
  br label %for.cond6, !dbg !644

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !645
  %cmp7 = icmp slt i32 %9, 10, !dbg !647
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !648

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !649
  %11 = load i32, i32* %i, align 4, !dbg !651
  %idxprom9 = sext i32 %11 to i64, !dbg !649
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !649
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !649
  call void @printIntLine(i32 %12), !dbg !652
  br label %for.inc11, !dbg !653

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !654
  %inc12 = add nsw i32 %13, 1, !dbg !654
  store i32 %inc12, i32* %i, align 4, !dbg !654
  br label %for.cond6, !dbg !655, !llvm.loop !656

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !658

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !659
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !661
  %15 = bitcast i32* %14 to i8*, !dbg !661
  call void @free(i8* %15) #8, !dbg !662
  ret void, !dbg !663
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !664 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !665, metadata !DIExpression()), !dbg !666
  store i32 -1, i32* %data, align 4, !dbg !667
  store i32 7, i32* %data, align 4, !dbg !668
  call void @llvm.dbg.declare(metadata i32* %i, metadata !671, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !676, metadata !DIExpression()), !dbg !677
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !678
  %0 = bitcast i8* %call to i32*, !dbg !679
  store i32* %0, i32** %buffer, align 8, !dbg !677
  %1 = load i32*, i32** %buffer, align 8, !dbg !680
  %cmp = icmp eq i32* %1, null, !dbg !682
  br i1 %cmp, label %if.then, label %if.end, !dbg !683

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !684
  unreachable, !dbg !684

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !686
  br label %for.cond, !dbg !688

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !689
  %cmp1 = icmp slt i32 %2, 10, !dbg !691
  br i1 %cmp1, label %for.body, label %for.end, !dbg !692

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !693
  %4 = load i32, i32* %i, align 4, !dbg !695
  %idxprom = sext i32 %4 to i64, !dbg !693
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !693
  store i32 0, i32* %arrayidx, align 4, !dbg !696
  br label %for.inc, !dbg !697

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !698
  %inc = add nsw i32 %5, 1, !dbg !698
  store i32 %inc, i32* %i, align 4, !dbg !698
  br label %for.cond, !dbg !699, !llvm.loop !700

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !702
  %cmp2 = icmp sge i32 %6, 0, !dbg !704
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !705

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !706
  %8 = load i32, i32* %data, align 4, !dbg !708
  %idxprom4 = sext i32 %8 to i64, !dbg !706
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !706
  store i32 1, i32* %arrayidx5, align 4, !dbg !709
  store i32 0, i32* %i, align 4, !dbg !710
  br label %for.cond6, !dbg !712

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !713
  %cmp7 = icmp slt i32 %9, 10, !dbg !715
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !716

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !717
  %11 = load i32, i32* %i, align 4, !dbg !719
  %idxprom9 = sext i32 %11 to i64, !dbg !717
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !717
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !717
  call void @printIntLine(i32 %12), !dbg !720
  br label %for.inc11, !dbg !721

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !722
  %inc12 = add nsw i32 %13, 1, !dbg !722
  store i32 %inc12, i32* %i, align 4, !dbg !722
  br label %for.cond6, !dbg !723, !llvm.loop !724

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !726

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !727
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !729
  %15 = bitcast i32* %14 to i8*, !dbg !729
  call void @free(i8* %15) #8, !dbg !730
  ret void, !dbg !731
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_bad", scope: !74, file: !74, line: 49, type: !75, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06.c", directory: "/home/joelyang/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 51, type: !65)
!79 = !DILocation(line: 51, column: 9, scope: !73)
!80 = !DILocation(line: 53, column: 10, scope: !73)
!81 = !DILocalVariable(name: "recvResult", scope: !82, file: !74, line: 61, type: !65)
!82 = distinct !DILexicalBlock(scope: !83, file: !74, line: 56, column: 9)
!83 = distinct !DILexicalBlock(scope: !84, file: !74, line: 55, column: 5)
!84 = distinct !DILexicalBlock(scope: !73, file: !74, line: 54, column: 8)
!85 = !DILocation(line: 61, column: 17, scope: !82)
!86 = !DILocalVariable(name: "service", scope: !82, file: !74, line: 62, type: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !88)
!88 = !{!89, !90, !94, !98}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !17, line: 240, baseType: !56, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !17, line: 241, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !17, line: 242, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !17, line: 33, baseType: !46, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !17, line: 245, baseType: !99, size: 64, offset: 64)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 64, elements: !101)
!100 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!101 = !{!102}
!102 = !DISubrange(count: 8)
!103 = !DILocation(line: 62, column: 32, scope: !82)
!104 = !DILocalVariable(name: "listenSocket", scope: !82, file: !74, line: 63, type: !65)
!105 = !DILocation(line: 63, column: 20, scope: !82)
!106 = !DILocalVariable(name: "acceptSocket", scope: !82, file: !74, line: 64, type: !65)
!107 = !DILocation(line: 64, column: 20, scope: !82)
!108 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !74, line: 65, type: !60)
!109 = !DILocation(line: 65, column: 18, scope: !82)
!110 = !DILocation(line: 66, column: 13, scope: !82)
!111 = !DILocation(line: 76, column: 32, scope: !112)
!112 = distinct !DILexicalBlock(scope: !82, file: !74, line: 67, column: 13)
!113 = !DILocation(line: 76, column: 30, scope: !112)
!114 = !DILocation(line: 77, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !74, line: 77, column: 21)
!116 = !DILocation(line: 77, column: 34, scope: !115)
!117 = !DILocation(line: 77, column: 21, scope: !112)
!118 = !DILocation(line: 79, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !74, line: 78, column: 17)
!120 = !DILocation(line: 81, column: 17, scope: !112)
!121 = !DILocation(line: 82, column: 25, scope: !112)
!122 = !DILocation(line: 82, column: 36, scope: !112)
!123 = !DILocation(line: 83, column: 25, scope: !112)
!124 = !DILocation(line: 83, column: 34, scope: !112)
!125 = !DILocation(line: 83, column: 41, scope: !112)
!126 = !DILocation(line: 84, column: 36, scope: !112)
!127 = !DILocation(line: 84, column: 25, scope: !112)
!128 = !DILocation(line: 84, column: 34, scope: !112)
!129 = !DILocation(line: 85, column: 26, scope: !130)
!130 = distinct !DILexicalBlock(scope: !112, file: !74, line: 85, column: 21)
!131 = !DILocation(line: 85, column: 40, scope: !130)
!132 = !DILocation(line: 85, column: 21, scope: !130)
!133 = !DILocation(line: 85, column: 85, scope: !130)
!134 = !DILocation(line: 85, column: 21, scope: !112)
!135 = !DILocation(line: 87, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !74, line: 86, column: 17)
!137 = !DILocation(line: 89, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !112, file: !74, line: 89, column: 21)
!139 = !DILocation(line: 89, column: 21, scope: !138)
!140 = !DILocation(line: 89, column: 58, scope: !138)
!141 = !DILocation(line: 89, column: 21, scope: !112)
!142 = !DILocation(line: 91, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !74, line: 90, column: 17)
!144 = !DILocation(line: 93, column: 39, scope: !112)
!145 = !DILocation(line: 93, column: 32, scope: !112)
!146 = !DILocation(line: 93, column: 30, scope: !112)
!147 = !DILocation(line: 94, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !112, file: !74, line: 94, column: 21)
!149 = !DILocation(line: 94, column: 34, scope: !148)
!150 = !DILocation(line: 94, column: 21, scope: !112)
!151 = !DILocation(line: 96, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !74, line: 95, column: 17)
!153 = !DILocation(line: 99, column: 35, scope: !112)
!154 = !DILocation(line: 99, column: 49, scope: !112)
!155 = !DILocation(line: 99, column: 30, scope: !112)
!156 = !DILocation(line: 99, column: 28, scope: !112)
!157 = !DILocation(line: 100, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !112, file: !74, line: 100, column: 21)
!159 = !DILocation(line: 100, column: 32, scope: !158)
!160 = !DILocation(line: 100, column: 48, scope: !158)
!161 = !DILocation(line: 100, column: 51, scope: !158)
!162 = !DILocation(line: 100, column: 62, scope: !158)
!163 = !DILocation(line: 100, column: 21, scope: !112)
!164 = !DILocation(line: 102, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !74, line: 101, column: 17)
!166 = !DILocation(line: 105, column: 29, scope: !112)
!167 = !DILocation(line: 105, column: 17, scope: !112)
!168 = !DILocation(line: 105, column: 41, scope: !112)
!169 = !DILocation(line: 107, column: 29, scope: !112)
!170 = !DILocation(line: 107, column: 24, scope: !112)
!171 = !DILocation(line: 107, column: 22, scope: !112)
!172 = !DILocation(line: 108, column: 13, scope: !112)
!173 = !DILocation(line: 110, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !82, file: !74, line: 110, column: 17)
!175 = !DILocation(line: 110, column: 30, scope: !174)
!176 = !DILocation(line: 110, column: 17, scope: !82)
!177 = !DILocation(line: 112, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !74, line: 111, column: 13)
!179 = !DILocation(line: 112, column: 17, scope: !178)
!180 = !DILocation(line: 113, column: 13, scope: !178)
!181 = !DILocation(line: 114, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !82, file: !74, line: 114, column: 17)
!183 = !DILocation(line: 114, column: 30, scope: !182)
!184 = !DILocation(line: 114, column: 17, scope: !82)
!185 = !DILocation(line: 116, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !74, line: 115, column: 13)
!187 = !DILocation(line: 116, column: 17, scope: !186)
!188 = !DILocation(line: 117, column: 13, scope: !186)
!189 = !DILocalVariable(name: "i", scope: !190, file: !74, line: 129, type: !65)
!190 = distinct !DILexicalBlock(scope: !191, file: !74, line: 128, column: 9)
!191 = distinct !DILexicalBlock(scope: !192, file: !74, line: 127, column: 5)
!192 = distinct !DILexicalBlock(scope: !73, file: !74, line: 126, column: 8)
!193 = !DILocation(line: 129, column: 17, scope: !190)
!194 = !DILocalVariable(name: "buffer", scope: !190, file: !74, line: 130, type: !64)
!195 = !DILocation(line: 130, column: 19, scope: !190)
!196 = !DILocation(line: 130, column: 35, scope: !190)
!197 = !DILocation(line: 130, column: 28, scope: !190)
!198 = !DILocation(line: 131, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !190, file: !74, line: 131, column: 17)
!200 = !DILocation(line: 131, column: 24, scope: !199)
!201 = !DILocation(line: 131, column: 17, scope: !190)
!202 = !DILocation(line: 131, column: 34, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !74, line: 131, column: 33)
!204 = !DILocation(line: 133, column: 20, scope: !205)
!205 = distinct !DILexicalBlock(scope: !190, file: !74, line: 133, column: 13)
!206 = !DILocation(line: 133, column: 18, scope: !205)
!207 = !DILocation(line: 133, column: 25, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !74, line: 133, column: 13)
!209 = !DILocation(line: 133, column: 27, scope: !208)
!210 = !DILocation(line: 133, column: 13, scope: !205)
!211 = !DILocation(line: 135, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !74, line: 134, column: 13)
!213 = !DILocation(line: 135, column: 24, scope: !212)
!214 = !DILocation(line: 135, column: 27, scope: !212)
!215 = !DILocation(line: 136, column: 13, scope: !212)
!216 = !DILocation(line: 133, column: 34, scope: !208)
!217 = !DILocation(line: 133, column: 13, scope: !208)
!218 = distinct !{!218, !210, !219, !220}
!219 = !DILocation(line: 136, column: 13, scope: !205)
!220 = !{!"llvm.loop.mustprogress"}
!221 = !DILocation(line: 139, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !190, file: !74, line: 139, column: 17)
!223 = !DILocation(line: 139, column: 22, scope: !222)
!224 = !DILocation(line: 139, column: 17, scope: !190)
!225 = !DILocation(line: 141, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !74, line: 140, column: 13)
!227 = !DILocation(line: 141, column: 24, scope: !226)
!228 = !DILocation(line: 141, column: 30, scope: !226)
!229 = !DILocation(line: 143, column: 23, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !74, line: 143, column: 17)
!231 = !DILocation(line: 143, column: 21, scope: !230)
!232 = !DILocation(line: 143, column: 28, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !74, line: 143, column: 17)
!234 = !DILocation(line: 143, column: 30, scope: !233)
!235 = !DILocation(line: 143, column: 17, scope: !230)
!236 = !DILocation(line: 145, column: 34, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !74, line: 144, column: 17)
!238 = !DILocation(line: 145, column: 41, scope: !237)
!239 = !DILocation(line: 145, column: 21, scope: !237)
!240 = !DILocation(line: 146, column: 17, scope: !237)
!241 = !DILocation(line: 143, column: 37, scope: !233)
!242 = !DILocation(line: 143, column: 17, scope: !233)
!243 = distinct !{!243, !235, !244, !220}
!244 = !DILocation(line: 146, column: 17, scope: !230)
!245 = !DILocation(line: 147, column: 13, scope: !226)
!246 = !DILocation(line: 150, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !222, file: !74, line: 149, column: 13)
!248 = !DILocation(line: 152, column: 18, scope: !190)
!249 = !DILocation(line: 152, column: 13, scope: !190)
!250 = !DILocation(line: 155, column: 1, scope: !73)
!251 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_good", scope: !74, file: !74, line: 473, type: !75, scopeLine: 474, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!252 = !DILocation(line: 475, column: 5, scope: !251)
!253 = !DILocation(line: 476, column: 5, scope: !251)
!254 = !DILocation(line: 477, column: 5, scope: !251)
!255 = !DILocation(line: 478, column: 5, scope: !251)
!256 = !DILocation(line: 479, column: 1, scope: !251)
!257 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 490, type: !258, scopeLine: 491, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!258 = !DISubroutineType(types: !259)
!259 = !{!65, !65, !260}
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !261, size: 64)
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!262 = !DILocalVariable(name: "argc", arg: 1, scope: !257, file: !74, line: 490, type: !65)
!263 = !DILocation(line: 490, column: 14, scope: !257)
!264 = !DILocalVariable(name: "argv", arg: 2, scope: !257, file: !74, line: 490, type: !260)
!265 = !DILocation(line: 490, column: 27, scope: !257)
!266 = !DILocation(line: 493, column: 22, scope: !257)
!267 = !DILocation(line: 493, column: 12, scope: !257)
!268 = !DILocation(line: 493, column: 5, scope: !257)
!269 = !DILocation(line: 495, column: 5, scope: !257)
!270 = !DILocation(line: 496, column: 5, scope: !257)
!271 = !DILocation(line: 497, column: 5, scope: !257)
!272 = !DILocation(line: 500, column: 5, scope: !257)
!273 = !DILocation(line: 501, column: 5, scope: !257)
!274 = !DILocation(line: 502, column: 5, scope: !257)
!275 = !DILocation(line: 504, column: 5, scope: !257)
!276 = distinct !DISubprogram(name: "goodB2G1", scope: !74, file: !74, line: 162, type: !75, scopeLine: 163, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!277 = !DILocalVariable(name: "data", scope: !276, file: !74, line: 164, type: !65)
!278 = !DILocation(line: 164, column: 9, scope: !276)
!279 = !DILocation(line: 166, column: 10, scope: !276)
!280 = !DILocalVariable(name: "recvResult", scope: !281, file: !74, line: 174, type: !65)
!281 = distinct !DILexicalBlock(scope: !282, file: !74, line: 169, column: 9)
!282 = distinct !DILexicalBlock(scope: !283, file: !74, line: 168, column: 5)
!283 = distinct !DILexicalBlock(scope: !276, file: !74, line: 167, column: 8)
!284 = !DILocation(line: 174, column: 17, scope: !281)
!285 = !DILocalVariable(name: "service", scope: !281, file: !74, line: 175, type: !87)
!286 = !DILocation(line: 175, column: 32, scope: !281)
!287 = !DILocalVariable(name: "listenSocket", scope: !281, file: !74, line: 176, type: !65)
!288 = !DILocation(line: 176, column: 20, scope: !281)
!289 = !DILocalVariable(name: "acceptSocket", scope: !281, file: !74, line: 177, type: !65)
!290 = !DILocation(line: 177, column: 20, scope: !281)
!291 = !DILocalVariable(name: "inputBuffer", scope: !281, file: !74, line: 178, type: !60)
!292 = !DILocation(line: 178, column: 18, scope: !281)
!293 = !DILocation(line: 179, column: 13, scope: !281)
!294 = !DILocation(line: 189, column: 32, scope: !295)
!295 = distinct !DILexicalBlock(scope: !281, file: !74, line: 180, column: 13)
!296 = !DILocation(line: 189, column: 30, scope: !295)
!297 = !DILocation(line: 190, column: 21, scope: !298)
!298 = distinct !DILexicalBlock(scope: !295, file: !74, line: 190, column: 21)
!299 = !DILocation(line: 190, column: 34, scope: !298)
!300 = !DILocation(line: 190, column: 21, scope: !295)
!301 = !DILocation(line: 192, column: 21, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !74, line: 191, column: 17)
!303 = !DILocation(line: 194, column: 17, scope: !295)
!304 = !DILocation(line: 195, column: 25, scope: !295)
!305 = !DILocation(line: 195, column: 36, scope: !295)
!306 = !DILocation(line: 196, column: 25, scope: !295)
!307 = !DILocation(line: 196, column: 34, scope: !295)
!308 = !DILocation(line: 196, column: 41, scope: !295)
!309 = !DILocation(line: 197, column: 36, scope: !295)
!310 = !DILocation(line: 197, column: 25, scope: !295)
!311 = !DILocation(line: 197, column: 34, scope: !295)
!312 = !DILocation(line: 198, column: 26, scope: !313)
!313 = distinct !DILexicalBlock(scope: !295, file: !74, line: 198, column: 21)
!314 = !DILocation(line: 198, column: 40, scope: !313)
!315 = !DILocation(line: 198, column: 21, scope: !313)
!316 = !DILocation(line: 198, column: 85, scope: !313)
!317 = !DILocation(line: 198, column: 21, scope: !295)
!318 = !DILocation(line: 200, column: 21, scope: !319)
!319 = distinct !DILexicalBlock(scope: !313, file: !74, line: 199, column: 17)
!320 = !DILocation(line: 202, column: 28, scope: !321)
!321 = distinct !DILexicalBlock(scope: !295, file: !74, line: 202, column: 21)
!322 = !DILocation(line: 202, column: 21, scope: !321)
!323 = !DILocation(line: 202, column: 58, scope: !321)
!324 = !DILocation(line: 202, column: 21, scope: !295)
!325 = !DILocation(line: 204, column: 21, scope: !326)
!326 = distinct !DILexicalBlock(scope: !321, file: !74, line: 203, column: 17)
!327 = !DILocation(line: 206, column: 39, scope: !295)
!328 = !DILocation(line: 206, column: 32, scope: !295)
!329 = !DILocation(line: 206, column: 30, scope: !295)
!330 = !DILocation(line: 207, column: 21, scope: !331)
!331 = distinct !DILexicalBlock(scope: !295, file: !74, line: 207, column: 21)
!332 = !DILocation(line: 207, column: 34, scope: !331)
!333 = !DILocation(line: 207, column: 21, scope: !295)
!334 = !DILocation(line: 209, column: 21, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !74, line: 208, column: 17)
!336 = !DILocation(line: 212, column: 35, scope: !295)
!337 = !DILocation(line: 212, column: 49, scope: !295)
!338 = !DILocation(line: 212, column: 30, scope: !295)
!339 = !DILocation(line: 212, column: 28, scope: !295)
!340 = !DILocation(line: 213, column: 21, scope: !341)
!341 = distinct !DILexicalBlock(scope: !295, file: !74, line: 213, column: 21)
!342 = !DILocation(line: 213, column: 32, scope: !341)
!343 = !DILocation(line: 213, column: 48, scope: !341)
!344 = !DILocation(line: 213, column: 51, scope: !341)
!345 = !DILocation(line: 213, column: 62, scope: !341)
!346 = !DILocation(line: 213, column: 21, scope: !295)
!347 = !DILocation(line: 215, column: 21, scope: !348)
!348 = distinct !DILexicalBlock(scope: !341, file: !74, line: 214, column: 17)
!349 = !DILocation(line: 218, column: 29, scope: !295)
!350 = !DILocation(line: 218, column: 17, scope: !295)
!351 = !DILocation(line: 218, column: 41, scope: !295)
!352 = !DILocation(line: 220, column: 29, scope: !295)
!353 = !DILocation(line: 220, column: 24, scope: !295)
!354 = !DILocation(line: 220, column: 22, scope: !295)
!355 = !DILocation(line: 221, column: 13, scope: !295)
!356 = !DILocation(line: 223, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !281, file: !74, line: 223, column: 17)
!358 = !DILocation(line: 223, column: 30, scope: !357)
!359 = !DILocation(line: 223, column: 17, scope: !281)
!360 = !DILocation(line: 225, column: 30, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !74, line: 224, column: 13)
!362 = !DILocation(line: 225, column: 17, scope: !361)
!363 = !DILocation(line: 226, column: 13, scope: !361)
!364 = !DILocation(line: 227, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !281, file: !74, line: 227, column: 17)
!366 = !DILocation(line: 227, column: 30, scope: !365)
!367 = !DILocation(line: 227, column: 17, scope: !281)
!368 = !DILocation(line: 229, column: 30, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !74, line: 228, column: 13)
!370 = !DILocation(line: 229, column: 17, scope: !369)
!371 = !DILocation(line: 230, column: 13, scope: !369)
!372 = !DILocalVariable(name: "i", scope: !373, file: !74, line: 247, type: !65)
!373 = distinct !DILexicalBlock(scope: !374, file: !74, line: 246, column: 9)
!374 = distinct !DILexicalBlock(scope: !375, file: !74, line: 245, column: 5)
!375 = distinct !DILexicalBlock(scope: !276, file: !74, line: 239, column: 8)
!376 = !DILocation(line: 247, column: 17, scope: !373)
!377 = !DILocalVariable(name: "buffer", scope: !373, file: !74, line: 248, type: !64)
!378 = !DILocation(line: 248, column: 19, scope: !373)
!379 = !DILocation(line: 248, column: 35, scope: !373)
!380 = !DILocation(line: 248, column: 28, scope: !373)
!381 = !DILocation(line: 249, column: 17, scope: !382)
!382 = distinct !DILexicalBlock(scope: !373, file: !74, line: 249, column: 17)
!383 = !DILocation(line: 249, column: 24, scope: !382)
!384 = !DILocation(line: 249, column: 17, scope: !373)
!385 = !DILocation(line: 249, column: 34, scope: !386)
!386 = distinct !DILexicalBlock(scope: !382, file: !74, line: 249, column: 33)
!387 = !DILocation(line: 251, column: 20, scope: !388)
!388 = distinct !DILexicalBlock(scope: !373, file: !74, line: 251, column: 13)
!389 = !DILocation(line: 251, column: 18, scope: !388)
!390 = !DILocation(line: 251, column: 25, scope: !391)
!391 = distinct !DILexicalBlock(scope: !388, file: !74, line: 251, column: 13)
!392 = !DILocation(line: 251, column: 27, scope: !391)
!393 = !DILocation(line: 251, column: 13, scope: !388)
!394 = !DILocation(line: 253, column: 17, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !74, line: 252, column: 13)
!396 = !DILocation(line: 253, column: 24, scope: !395)
!397 = !DILocation(line: 253, column: 27, scope: !395)
!398 = !DILocation(line: 254, column: 13, scope: !395)
!399 = !DILocation(line: 251, column: 34, scope: !391)
!400 = !DILocation(line: 251, column: 13, scope: !391)
!401 = distinct !{!401, !393, !402, !220}
!402 = !DILocation(line: 254, column: 13, scope: !388)
!403 = !DILocation(line: 256, column: 17, scope: !404)
!404 = distinct !DILexicalBlock(scope: !373, file: !74, line: 256, column: 17)
!405 = !DILocation(line: 256, column: 22, scope: !404)
!406 = !DILocation(line: 256, column: 27, scope: !404)
!407 = !DILocation(line: 256, column: 30, scope: !404)
!408 = !DILocation(line: 256, column: 35, scope: !404)
!409 = !DILocation(line: 256, column: 17, scope: !373)
!410 = !DILocation(line: 258, column: 17, scope: !411)
!411 = distinct !DILexicalBlock(scope: !404, file: !74, line: 257, column: 13)
!412 = !DILocation(line: 258, column: 24, scope: !411)
!413 = !DILocation(line: 258, column: 30, scope: !411)
!414 = !DILocation(line: 260, column: 23, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !74, line: 260, column: 17)
!416 = !DILocation(line: 260, column: 21, scope: !415)
!417 = !DILocation(line: 260, column: 28, scope: !418)
!418 = distinct !DILexicalBlock(scope: !415, file: !74, line: 260, column: 17)
!419 = !DILocation(line: 260, column: 30, scope: !418)
!420 = !DILocation(line: 260, column: 17, scope: !415)
!421 = !DILocation(line: 262, column: 34, scope: !422)
!422 = distinct !DILexicalBlock(scope: !418, file: !74, line: 261, column: 17)
!423 = !DILocation(line: 262, column: 41, scope: !422)
!424 = !DILocation(line: 262, column: 21, scope: !422)
!425 = !DILocation(line: 263, column: 17, scope: !422)
!426 = !DILocation(line: 260, column: 37, scope: !418)
!427 = !DILocation(line: 260, column: 17, scope: !418)
!428 = distinct !{!428, !420, !429, !220}
!429 = !DILocation(line: 263, column: 17, scope: !415)
!430 = !DILocation(line: 264, column: 13, scope: !411)
!431 = !DILocation(line: 267, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !404, file: !74, line: 266, column: 13)
!433 = !DILocation(line: 269, column: 18, scope: !373)
!434 = !DILocation(line: 269, column: 13, scope: !373)
!435 = !DILocation(line: 272, column: 1, scope: !276)
!436 = distinct !DISubprogram(name: "goodB2G2", scope: !74, file: !74, line: 275, type: !75, scopeLine: 276, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!437 = !DILocalVariable(name: "data", scope: !436, file: !74, line: 277, type: !65)
!438 = !DILocation(line: 277, column: 9, scope: !436)
!439 = !DILocation(line: 279, column: 10, scope: !436)
!440 = !DILocalVariable(name: "recvResult", scope: !441, file: !74, line: 287, type: !65)
!441 = distinct !DILexicalBlock(scope: !442, file: !74, line: 282, column: 9)
!442 = distinct !DILexicalBlock(scope: !443, file: !74, line: 281, column: 5)
!443 = distinct !DILexicalBlock(scope: !436, file: !74, line: 280, column: 8)
!444 = !DILocation(line: 287, column: 17, scope: !441)
!445 = !DILocalVariable(name: "service", scope: !441, file: !74, line: 288, type: !87)
!446 = !DILocation(line: 288, column: 32, scope: !441)
!447 = !DILocalVariable(name: "listenSocket", scope: !441, file: !74, line: 289, type: !65)
!448 = !DILocation(line: 289, column: 20, scope: !441)
!449 = !DILocalVariable(name: "acceptSocket", scope: !441, file: !74, line: 290, type: !65)
!450 = !DILocation(line: 290, column: 20, scope: !441)
!451 = !DILocalVariable(name: "inputBuffer", scope: !441, file: !74, line: 291, type: !60)
!452 = !DILocation(line: 291, column: 18, scope: !441)
!453 = !DILocation(line: 292, column: 13, scope: !441)
!454 = !DILocation(line: 302, column: 32, scope: !455)
!455 = distinct !DILexicalBlock(scope: !441, file: !74, line: 293, column: 13)
!456 = !DILocation(line: 302, column: 30, scope: !455)
!457 = !DILocation(line: 303, column: 21, scope: !458)
!458 = distinct !DILexicalBlock(scope: !455, file: !74, line: 303, column: 21)
!459 = !DILocation(line: 303, column: 34, scope: !458)
!460 = !DILocation(line: 303, column: 21, scope: !455)
!461 = !DILocation(line: 305, column: 21, scope: !462)
!462 = distinct !DILexicalBlock(scope: !458, file: !74, line: 304, column: 17)
!463 = !DILocation(line: 307, column: 17, scope: !455)
!464 = !DILocation(line: 308, column: 25, scope: !455)
!465 = !DILocation(line: 308, column: 36, scope: !455)
!466 = !DILocation(line: 309, column: 25, scope: !455)
!467 = !DILocation(line: 309, column: 34, scope: !455)
!468 = !DILocation(line: 309, column: 41, scope: !455)
!469 = !DILocation(line: 310, column: 36, scope: !455)
!470 = !DILocation(line: 310, column: 25, scope: !455)
!471 = !DILocation(line: 310, column: 34, scope: !455)
!472 = !DILocation(line: 311, column: 26, scope: !473)
!473 = distinct !DILexicalBlock(scope: !455, file: !74, line: 311, column: 21)
!474 = !DILocation(line: 311, column: 40, scope: !473)
!475 = !DILocation(line: 311, column: 21, scope: !473)
!476 = !DILocation(line: 311, column: 85, scope: !473)
!477 = !DILocation(line: 311, column: 21, scope: !455)
!478 = !DILocation(line: 313, column: 21, scope: !479)
!479 = distinct !DILexicalBlock(scope: !473, file: !74, line: 312, column: 17)
!480 = !DILocation(line: 315, column: 28, scope: !481)
!481 = distinct !DILexicalBlock(scope: !455, file: !74, line: 315, column: 21)
!482 = !DILocation(line: 315, column: 21, scope: !481)
!483 = !DILocation(line: 315, column: 58, scope: !481)
!484 = !DILocation(line: 315, column: 21, scope: !455)
!485 = !DILocation(line: 317, column: 21, scope: !486)
!486 = distinct !DILexicalBlock(scope: !481, file: !74, line: 316, column: 17)
!487 = !DILocation(line: 319, column: 39, scope: !455)
!488 = !DILocation(line: 319, column: 32, scope: !455)
!489 = !DILocation(line: 319, column: 30, scope: !455)
!490 = !DILocation(line: 320, column: 21, scope: !491)
!491 = distinct !DILexicalBlock(scope: !455, file: !74, line: 320, column: 21)
!492 = !DILocation(line: 320, column: 34, scope: !491)
!493 = !DILocation(line: 320, column: 21, scope: !455)
!494 = !DILocation(line: 322, column: 21, scope: !495)
!495 = distinct !DILexicalBlock(scope: !491, file: !74, line: 321, column: 17)
!496 = !DILocation(line: 325, column: 35, scope: !455)
!497 = !DILocation(line: 325, column: 49, scope: !455)
!498 = !DILocation(line: 325, column: 30, scope: !455)
!499 = !DILocation(line: 325, column: 28, scope: !455)
!500 = !DILocation(line: 326, column: 21, scope: !501)
!501 = distinct !DILexicalBlock(scope: !455, file: !74, line: 326, column: 21)
!502 = !DILocation(line: 326, column: 32, scope: !501)
!503 = !DILocation(line: 326, column: 48, scope: !501)
!504 = !DILocation(line: 326, column: 51, scope: !501)
!505 = !DILocation(line: 326, column: 62, scope: !501)
!506 = !DILocation(line: 326, column: 21, scope: !455)
!507 = !DILocation(line: 328, column: 21, scope: !508)
!508 = distinct !DILexicalBlock(scope: !501, file: !74, line: 327, column: 17)
!509 = !DILocation(line: 331, column: 29, scope: !455)
!510 = !DILocation(line: 331, column: 17, scope: !455)
!511 = !DILocation(line: 331, column: 41, scope: !455)
!512 = !DILocation(line: 333, column: 29, scope: !455)
!513 = !DILocation(line: 333, column: 24, scope: !455)
!514 = !DILocation(line: 333, column: 22, scope: !455)
!515 = !DILocation(line: 334, column: 13, scope: !455)
!516 = !DILocation(line: 336, column: 17, scope: !517)
!517 = distinct !DILexicalBlock(scope: !441, file: !74, line: 336, column: 17)
!518 = !DILocation(line: 336, column: 30, scope: !517)
!519 = !DILocation(line: 336, column: 17, scope: !441)
!520 = !DILocation(line: 338, column: 30, scope: !521)
!521 = distinct !DILexicalBlock(scope: !517, file: !74, line: 337, column: 13)
!522 = !DILocation(line: 338, column: 17, scope: !521)
!523 = !DILocation(line: 339, column: 13, scope: !521)
!524 = !DILocation(line: 340, column: 17, scope: !525)
!525 = distinct !DILexicalBlock(scope: !441, file: !74, line: 340, column: 17)
!526 = !DILocation(line: 340, column: 30, scope: !525)
!527 = !DILocation(line: 340, column: 17, scope: !441)
!528 = !DILocation(line: 342, column: 30, scope: !529)
!529 = distinct !DILexicalBlock(scope: !525, file: !74, line: 341, column: 13)
!530 = !DILocation(line: 342, column: 17, scope: !529)
!531 = !DILocation(line: 343, column: 13, scope: !529)
!532 = !DILocalVariable(name: "i", scope: !533, file: !74, line: 355, type: !65)
!533 = distinct !DILexicalBlock(scope: !534, file: !74, line: 354, column: 9)
!534 = distinct !DILexicalBlock(scope: !535, file: !74, line: 353, column: 5)
!535 = distinct !DILexicalBlock(scope: !436, file: !74, line: 352, column: 8)
!536 = !DILocation(line: 355, column: 17, scope: !533)
!537 = !DILocalVariable(name: "buffer", scope: !533, file: !74, line: 356, type: !64)
!538 = !DILocation(line: 356, column: 19, scope: !533)
!539 = !DILocation(line: 356, column: 35, scope: !533)
!540 = !DILocation(line: 356, column: 28, scope: !533)
!541 = !DILocation(line: 357, column: 17, scope: !542)
!542 = distinct !DILexicalBlock(scope: !533, file: !74, line: 357, column: 17)
!543 = !DILocation(line: 357, column: 24, scope: !542)
!544 = !DILocation(line: 357, column: 17, scope: !533)
!545 = !DILocation(line: 357, column: 34, scope: !546)
!546 = distinct !DILexicalBlock(scope: !542, file: !74, line: 357, column: 33)
!547 = !DILocation(line: 359, column: 20, scope: !548)
!548 = distinct !DILexicalBlock(scope: !533, file: !74, line: 359, column: 13)
!549 = !DILocation(line: 359, column: 18, scope: !548)
!550 = !DILocation(line: 359, column: 25, scope: !551)
!551 = distinct !DILexicalBlock(scope: !548, file: !74, line: 359, column: 13)
!552 = !DILocation(line: 359, column: 27, scope: !551)
!553 = !DILocation(line: 359, column: 13, scope: !548)
!554 = !DILocation(line: 361, column: 17, scope: !555)
!555 = distinct !DILexicalBlock(scope: !551, file: !74, line: 360, column: 13)
!556 = !DILocation(line: 361, column: 24, scope: !555)
!557 = !DILocation(line: 361, column: 27, scope: !555)
!558 = !DILocation(line: 362, column: 13, scope: !555)
!559 = !DILocation(line: 359, column: 34, scope: !551)
!560 = !DILocation(line: 359, column: 13, scope: !551)
!561 = distinct !{!561, !553, !562, !220}
!562 = !DILocation(line: 362, column: 13, scope: !548)
!563 = !DILocation(line: 364, column: 17, scope: !564)
!564 = distinct !DILexicalBlock(scope: !533, file: !74, line: 364, column: 17)
!565 = !DILocation(line: 364, column: 22, scope: !564)
!566 = !DILocation(line: 364, column: 27, scope: !564)
!567 = !DILocation(line: 364, column: 30, scope: !564)
!568 = !DILocation(line: 364, column: 35, scope: !564)
!569 = !DILocation(line: 364, column: 17, scope: !533)
!570 = !DILocation(line: 366, column: 17, scope: !571)
!571 = distinct !DILexicalBlock(scope: !564, file: !74, line: 365, column: 13)
!572 = !DILocation(line: 366, column: 24, scope: !571)
!573 = !DILocation(line: 366, column: 30, scope: !571)
!574 = !DILocation(line: 368, column: 23, scope: !575)
!575 = distinct !DILexicalBlock(scope: !571, file: !74, line: 368, column: 17)
!576 = !DILocation(line: 368, column: 21, scope: !575)
!577 = !DILocation(line: 368, column: 28, scope: !578)
!578 = distinct !DILexicalBlock(scope: !575, file: !74, line: 368, column: 17)
!579 = !DILocation(line: 368, column: 30, scope: !578)
!580 = !DILocation(line: 368, column: 17, scope: !575)
!581 = !DILocation(line: 370, column: 34, scope: !582)
!582 = distinct !DILexicalBlock(scope: !578, file: !74, line: 369, column: 17)
!583 = !DILocation(line: 370, column: 41, scope: !582)
!584 = !DILocation(line: 370, column: 21, scope: !582)
!585 = !DILocation(line: 371, column: 17, scope: !582)
!586 = !DILocation(line: 368, column: 37, scope: !578)
!587 = !DILocation(line: 368, column: 17, scope: !578)
!588 = distinct !{!588, !580, !589, !220}
!589 = !DILocation(line: 371, column: 17, scope: !575)
!590 = !DILocation(line: 372, column: 13, scope: !571)
!591 = !DILocation(line: 375, column: 17, scope: !592)
!592 = distinct !DILexicalBlock(scope: !564, file: !74, line: 374, column: 13)
!593 = !DILocation(line: 377, column: 18, scope: !533)
!594 = !DILocation(line: 377, column: 13, scope: !533)
!595 = !DILocation(line: 380, column: 1, scope: !436)
!596 = distinct !DISubprogram(name: "goodG2B1", scope: !74, file: !74, line: 383, type: !75, scopeLine: 384, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!597 = !DILocalVariable(name: "data", scope: !596, file: !74, line: 385, type: !65)
!598 = !DILocation(line: 385, column: 9, scope: !596)
!599 = !DILocation(line: 387, column: 10, scope: !596)
!600 = !DILocation(line: 397, column: 14, scope: !601)
!601 = distinct !DILexicalBlock(scope: !602, file: !74, line: 394, column: 5)
!602 = distinct !DILexicalBlock(scope: !596, file: !74, line: 388, column: 8)
!603 = !DILocalVariable(name: "i", scope: !604, file: !74, line: 402, type: !65)
!604 = distinct !DILexicalBlock(scope: !605, file: !74, line: 401, column: 9)
!605 = distinct !DILexicalBlock(scope: !606, file: !74, line: 400, column: 5)
!606 = distinct !DILexicalBlock(scope: !596, file: !74, line: 399, column: 8)
!607 = !DILocation(line: 402, column: 17, scope: !604)
!608 = !DILocalVariable(name: "buffer", scope: !604, file: !74, line: 403, type: !64)
!609 = !DILocation(line: 403, column: 19, scope: !604)
!610 = !DILocation(line: 403, column: 35, scope: !604)
!611 = !DILocation(line: 403, column: 28, scope: !604)
!612 = !DILocation(line: 404, column: 17, scope: !613)
!613 = distinct !DILexicalBlock(scope: !604, file: !74, line: 404, column: 17)
!614 = !DILocation(line: 404, column: 24, scope: !613)
!615 = !DILocation(line: 404, column: 17, scope: !604)
!616 = !DILocation(line: 404, column: 34, scope: !617)
!617 = distinct !DILexicalBlock(scope: !613, file: !74, line: 404, column: 33)
!618 = !DILocation(line: 406, column: 20, scope: !619)
!619 = distinct !DILexicalBlock(scope: !604, file: !74, line: 406, column: 13)
!620 = !DILocation(line: 406, column: 18, scope: !619)
!621 = !DILocation(line: 406, column: 25, scope: !622)
!622 = distinct !DILexicalBlock(scope: !619, file: !74, line: 406, column: 13)
!623 = !DILocation(line: 406, column: 27, scope: !622)
!624 = !DILocation(line: 406, column: 13, scope: !619)
!625 = !DILocation(line: 408, column: 17, scope: !626)
!626 = distinct !DILexicalBlock(scope: !622, file: !74, line: 407, column: 13)
!627 = !DILocation(line: 408, column: 24, scope: !626)
!628 = !DILocation(line: 408, column: 27, scope: !626)
!629 = !DILocation(line: 409, column: 13, scope: !626)
!630 = !DILocation(line: 406, column: 34, scope: !622)
!631 = !DILocation(line: 406, column: 13, scope: !622)
!632 = distinct !{!632, !624, !633, !220}
!633 = !DILocation(line: 409, column: 13, scope: !619)
!634 = !DILocation(line: 412, column: 17, scope: !635)
!635 = distinct !DILexicalBlock(scope: !604, file: !74, line: 412, column: 17)
!636 = !DILocation(line: 412, column: 22, scope: !635)
!637 = !DILocation(line: 412, column: 17, scope: !604)
!638 = !DILocation(line: 414, column: 17, scope: !639)
!639 = distinct !DILexicalBlock(scope: !635, file: !74, line: 413, column: 13)
!640 = !DILocation(line: 414, column: 24, scope: !639)
!641 = !DILocation(line: 414, column: 30, scope: !639)
!642 = !DILocation(line: 416, column: 23, scope: !643)
!643 = distinct !DILexicalBlock(scope: !639, file: !74, line: 416, column: 17)
!644 = !DILocation(line: 416, column: 21, scope: !643)
!645 = !DILocation(line: 416, column: 28, scope: !646)
!646 = distinct !DILexicalBlock(scope: !643, file: !74, line: 416, column: 17)
!647 = !DILocation(line: 416, column: 30, scope: !646)
!648 = !DILocation(line: 416, column: 17, scope: !643)
!649 = !DILocation(line: 418, column: 34, scope: !650)
!650 = distinct !DILexicalBlock(scope: !646, file: !74, line: 417, column: 17)
!651 = !DILocation(line: 418, column: 41, scope: !650)
!652 = !DILocation(line: 418, column: 21, scope: !650)
!653 = !DILocation(line: 419, column: 17, scope: !650)
!654 = !DILocation(line: 416, column: 37, scope: !646)
!655 = !DILocation(line: 416, column: 17, scope: !646)
!656 = distinct !{!656, !648, !657, !220}
!657 = !DILocation(line: 419, column: 17, scope: !643)
!658 = !DILocation(line: 420, column: 13, scope: !639)
!659 = !DILocation(line: 423, column: 17, scope: !660)
!660 = distinct !DILexicalBlock(scope: !635, file: !74, line: 422, column: 13)
!661 = !DILocation(line: 425, column: 18, scope: !604)
!662 = !DILocation(line: 425, column: 13, scope: !604)
!663 = !DILocation(line: 428, column: 1, scope: !596)
!664 = distinct !DISubprogram(name: "goodG2B2", scope: !74, file: !74, line: 431, type: !75, scopeLine: 432, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!665 = !DILocalVariable(name: "data", scope: !664, file: !74, line: 433, type: !65)
!666 = !DILocation(line: 433, column: 9, scope: !664)
!667 = !DILocation(line: 435, column: 10, scope: !664)
!668 = !DILocation(line: 440, column: 14, scope: !669)
!669 = distinct !DILexicalBlock(scope: !670, file: !74, line: 437, column: 5)
!670 = distinct !DILexicalBlock(scope: !664, file: !74, line: 436, column: 8)
!671 = !DILocalVariable(name: "i", scope: !672, file: !74, line: 445, type: !65)
!672 = distinct !DILexicalBlock(scope: !673, file: !74, line: 444, column: 9)
!673 = distinct !DILexicalBlock(scope: !674, file: !74, line: 443, column: 5)
!674 = distinct !DILexicalBlock(scope: !664, file: !74, line: 442, column: 8)
!675 = !DILocation(line: 445, column: 17, scope: !672)
!676 = !DILocalVariable(name: "buffer", scope: !672, file: !74, line: 446, type: !64)
!677 = !DILocation(line: 446, column: 19, scope: !672)
!678 = !DILocation(line: 446, column: 35, scope: !672)
!679 = !DILocation(line: 446, column: 28, scope: !672)
!680 = !DILocation(line: 447, column: 17, scope: !681)
!681 = distinct !DILexicalBlock(scope: !672, file: !74, line: 447, column: 17)
!682 = !DILocation(line: 447, column: 24, scope: !681)
!683 = !DILocation(line: 447, column: 17, scope: !672)
!684 = !DILocation(line: 447, column: 34, scope: !685)
!685 = distinct !DILexicalBlock(scope: !681, file: !74, line: 447, column: 33)
!686 = !DILocation(line: 449, column: 20, scope: !687)
!687 = distinct !DILexicalBlock(scope: !672, file: !74, line: 449, column: 13)
!688 = !DILocation(line: 449, column: 18, scope: !687)
!689 = !DILocation(line: 449, column: 25, scope: !690)
!690 = distinct !DILexicalBlock(scope: !687, file: !74, line: 449, column: 13)
!691 = !DILocation(line: 449, column: 27, scope: !690)
!692 = !DILocation(line: 449, column: 13, scope: !687)
!693 = !DILocation(line: 451, column: 17, scope: !694)
!694 = distinct !DILexicalBlock(scope: !690, file: !74, line: 450, column: 13)
!695 = !DILocation(line: 451, column: 24, scope: !694)
!696 = !DILocation(line: 451, column: 27, scope: !694)
!697 = !DILocation(line: 452, column: 13, scope: !694)
!698 = !DILocation(line: 449, column: 34, scope: !690)
!699 = !DILocation(line: 449, column: 13, scope: !690)
!700 = distinct !{!700, !692, !701, !220}
!701 = !DILocation(line: 452, column: 13, scope: !687)
!702 = !DILocation(line: 455, column: 17, scope: !703)
!703 = distinct !DILexicalBlock(scope: !672, file: !74, line: 455, column: 17)
!704 = !DILocation(line: 455, column: 22, scope: !703)
!705 = !DILocation(line: 455, column: 17, scope: !672)
!706 = !DILocation(line: 457, column: 17, scope: !707)
!707 = distinct !DILexicalBlock(scope: !703, file: !74, line: 456, column: 13)
!708 = !DILocation(line: 457, column: 24, scope: !707)
!709 = !DILocation(line: 457, column: 30, scope: !707)
!710 = !DILocation(line: 459, column: 23, scope: !711)
!711 = distinct !DILexicalBlock(scope: !707, file: !74, line: 459, column: 17)
!712 = !DILocation(line: 459, column: 21, scope: !711)
!713 = !DILocation(line: 459, column: 28, scope: !714)
!714 = distinct !DILexicalBlock(scope: !711, file: !74, line: 459, column: 17)
!715 = !DILocation(line: 459, column: 30, scope: !714)
!716 = !DILocation(line: 459, column: 17, scope: !711)
!717 = !DILocation(line: 461, column: 34, scope: !718)
!718 = distinct !DILexicalBlock(scope: !714, file: !74, line: 460, column: 17)
!719 = !DILocation(line: 461, column: 41, scope: !718)
!720 = !DILocation(line: 461, column: 21, scope: !718)
!721 = !DILocation(line: 462, column: 17, scope: !718)
!722 = !DILocation(line: 459, column: 37, scope: !714)
!723 = !DILocation(line: 459, column: 17, scope: !714)
!724 = distinct !{!724, !716, !725, !220}
!725 = !DILocation(line: 462, column: 17, scope: !711)
!726 = !DILocation(line: 463, column: 13, scope: !707)
!727 = !DILocation(line: 466, column: 17, scope: !728)
!728 = distinct !DILexicalBlock(scope: !703, file: !74, line: 465, column: 13)
!729 = !DILocation(line: 468, column: 18, scope: !672)
!730 = !DILocation(line: 468, column: 13, scope: !672)
!731 = !DILocation(line: 471, column: 1, scope: !664)
