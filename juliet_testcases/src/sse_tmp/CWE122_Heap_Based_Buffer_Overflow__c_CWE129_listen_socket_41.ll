; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_bad() #0 !dbg !73 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  %15 = load i32, i32* %data, align 4, !dbg !187
  call void @badSink(i32 %15), !dbg !188
  ret void, !dbg !189
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

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !190 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !193, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata i32* %i, metadata !195, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !198, metadata !DIExpression()), !dbg !199
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !200
  %0 = bitcast i8* %call to i32*, !dbg !201
  store i32* %0, i32** %buffer, align 8, !dbg !199
  %1 = load i32*, i32** %buffer, align 8, !dbg !202
  %cmp = icmp eq i32* %1, null, !dbg !204
  br i1 %cmp, label %if.then, label %if.end, !dbg !205

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !206
  unreachable, !dbg !206

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !208
  br label %for.cond, !dbg !210

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !211
  %cmp1 = icmp slt i32 %2, 10, !dbg !213
  br i1 %cmp1, label %for.body, label %for.end, !dbg !214

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !215
  %4 = load i32, i32* %i, align 4, !dbg !217
  %idxprom = sext i32 %4 to i64, !dbg !215
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !215
  store i32 0, i32* %arrayidx, align 4, !dbg !218
  br label %for.inc, !dbg !219

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !220
  %inc = add nsw i32 %5, 1, !dbg !220
  store i32 %inc, i32* %i, align 4, !dbg !220
  br label %for.cond, !dbg !221, !llvm.loop !222

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !225
  %cmp2 = icmp sge i32 %6, 0, !dbg !227
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !228

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !229
  %8 = load i32, i32* %data.addr, align 4, !dbg !231
  %idxprom4 = sext i32 %8 to i64, !dbg !229
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !229
  store i32 1, i32* %arrayidx5, align 4, !dbg !232
  store i32 0, i32* %i, align 4, !dbg !233
  br label %for.cond6, !dbg !235

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !236
  %cmp7 = icmp slt i32 %9, 10, !dbg !238
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !239

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !240
  %11 = load i32, i32* %i, align 4, !dbg !242
  %idxprom9 = sext i32 %11 to i64, !dbg !240
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !240
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !240
  call void @printIntLine(i32 %12), !dbg !243
  br label %for.inc11, !dbg !244

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !245
  %inc12 = add nsw i32 %13, 1, !dbg !245
  store i32 %inc12, i32* %i, align 4, !dbg !245
  br label %for.cond6, !dbg !246, !llvm.loop !247

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !249

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !250
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !252
  %15 = bitcast i32* %14 to i8*, !dbg !252
  call void @free(i8* %15) #8, !dbg !253
  ret void, !dbg !254
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_good() #0 !dbg !255 {
entry:
  call void @goodB2G(), !dbg !256
  call void @goodG2B(), !dbg !257
  ret void, !dbg !258
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !259 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !264, metadata !DIExpression()), !dbg !265
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !266, metadata !DIExpression()), !dbg !267
  %call = call i64 @time(i64* null) #8, !dbg !268
  %conv = trunc i64 %call to i32, !dbg !269
  call void @srand(i32 %conv) #8, !dbg !270
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !271
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_good(), !dbg !272
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !273
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !274
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_bad(), !dbg !275
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !276
  ret i32 0, !dbg !277
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !278 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !279, metadata !DIExpression()), !dbg !280
  store i32 -1, i32* %data, align 4, !dbg !281
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !282, metadata !DIExpression()), !dbg !284
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
  %15 = load i32, i32* %data, align 4, !dbg !372
  call void @goodB2GSink(i32 %15), !dbg !373
  ret void, !dbg !374
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !375 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.declare(metadata i32* %i, metadata !378, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !381, metadata !DIExpression()), !dbg !382
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !383
  %0 = bitcast i8* %call to i32*, !dbg !384
  store i32* %0, i32** %buffer, align 8, !dbg !382
  %1 = load i32*, i32** %buffer, align 8, !dbg !385
  %cmp = icmp eq i32* %1, null, !dbg !387
  br i1 %cmp, label %if.then, label %if.end, !dbg !388

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !389
  unreachable, !dbg !389

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !391
  br label %for.cond, !dbg !393

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !394
  %cmp1 = icmp slt i32 %2, 10, !dbg !396
  br i1 %cmp1, label %for.body, label %for.end, !dbg !397

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !398
  %4 = load i32, i32* %i, align 4, !dbg !400
  %idxprom = sext i32 %4 to i64, !dbg !398
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !398
  store i32 0, i32* %arrayidx, align 4, !dbg !401
  br label %for.inc, !dbg !402

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !403
  %inc = add nsw i32 %5, 1, !dbg !403
  store i32 %inc, i32* %i, align 4, !dbg !403
  br label %for.cond, !dbg !404, !llvm.loop !405

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !407
  %cmp2 = icmp sge i32 %6, 0, !dbg !409
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !410

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !411
  %cmp3 = icmp slt i32 %7, 10, !dbg !412
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !413

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !414
  %9 = load i32, i32* %data.addr, align 4, !dbg !416
  %idxprom5 = sext i32 %9 to i64, !dbg !414
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !414
  store i32 1, i32* %arrayidx6, align 4, !dbg !417
  store i32 0, i32* %i, align 4, !dbg !418
  br label %for.cond7, !dbg !420

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !421
  %cmp8 = icmp slt i32 %10, 10, !dbg !423
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !424

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !425
  %12 = load i32, i32* %i, align 4, !dbg !427
  %idxprom10 = sext i32 %12 to i64, !dbg !425
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !425
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !425
  call void @printIntLine(i32 %13), !dbg !428
  br label %for.inc12, !dbg !429

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !430
  %inc13 = add nsw i32 %14, 1, !dbg !430
  store i32 %inc13, i32* %i, align 4, !dbg !430
  br label %for.cond7, !dbg !431, !llvm.loop !432

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !434

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !435
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !437
  %16 = bitcast i32* %15 to i8*, !dbg !437
  call void @free(i8* %16) #8, !dbg !438
  ret void, !dbg !439
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !440 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !441, metadata !DIExpression()), !dbg !442
  store i32 -1, i32* %data, align 4, !dbg !443
  store i32 7, i32* %data, align 4, !dbg !444
  %0 = load i32, i32* %data, align 4, !dbg !445
  call void @goodG2BSink(i32 %0), !dbg !446
  ret void, !dbg !447
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !448 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !449, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.declare(metadata i32* %i, metadata !451, metadata !DIExpression()), !dbg !453
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !454, metadata !DIExpression()), !dbg !455
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !456
  %0 = bitcast i8* %call to i32*, !dbg !457
  store i32* %0, i32** %buffer, align 8, !dbg !455
  %1 = load i32*, i32** %buffer, align 8, !dbg !458
  %cmp = icmp eq i32* %1, null, !dbg !460
  br i1 %cmp, label %if.then, label %if.end, !dbg !461

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !462
  unreachable, !dbg !462

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !464
  br label %for.cond, !dbg !466

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !467
  %cmp1 = icmp slt i32 %2, 10, !dbg !469
  br i1 %cmp1, label %for.body, label %for.end, !dbg !470

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !471
  %4 = load i32, i32* %i, align 4, !dbg !473
  %idxprom = sext i32 %4 to i64, !dbg !471
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !471
  store i32 0, i32* %arrayidx, align 4, !dbg !474
  br label %for.inc, !dbg !475

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !476
  %inc = add nsw i32 %5, 1, !dbg !476
  store i32 %inc, i32* %i, align 4, !dbg !476
  br label %for.cond, !dbg !477, !llvm.loop !478

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !480
  %cmp2 = icmp sge i32 %6, 0, !dbg !482
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !483

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !484
  %8 = load i32, i32* %data.addr, align 4, !dbg !486
  %idxprom4 = sext i32 %8 to i64, !dbg !484
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !484
  store i32 1, i32* %arrayidx5, align 4, !dbg !487
  store i32 0, i32* %i, align 4, !dbg !488
  br label %for.cond6, !dbg !490

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !491
  %cmp7 = icmp slt i32 %9, 10, !dbg !493
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !494

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !495
  %11 = load i32, i32* %i, align 4, !dbg !497
  %idxprom9 = sext i32 %11 to i64, !dbg !495
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !495
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !495
  call void @printIntLine(i32 %12), !dbg !498
  br label %for.inc11, !dbg !499

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !500
  %inc12 = add nsw i32 %13, 1, !dbg !500
  store i32 %inc12, i32* %i, align 4, !dbg !500
  br label %for.cond6, !dbg !501, !llvm.loop !502

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !504

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !505
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !507
  %15 = bitcast i32* %14 to i8*, !dbg !507
  call void @free(i8* %15) #8, !dbg !508
  ret void, !dbg !509
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !51, !5, !64, !66}
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
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_bad", scope: !74, file: !74, line: 74, type: !75, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41.c", directory: "/home/joelyang/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 76, type: !65)
!79 = !DILocation(line: 76, column: 9, scope: !73)
!80 = !DILocation(line: 78, column: 10, scope: !73)
!81 = !DILocalVariable(name: "recvResult", scope: !82, file: !74, line: 84, type: !65)
!82 = distinct !DILexicalBlock(scope: !73, file: !74, line: 79, column: 5)
!83 = !DILocation(line: 84, column: 13, scope: !82)
!84 = !DILocalVariable(name: "service", scope: !82, file: !74, line: 85, type: !85)
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
!101 = !DILocation(line: 85, column: 28, scope: !82)
!102 = !DILocalVariable(name: "listenSocket", scope: !82, file: !74, line: 86, type: !65)
!103 = !DILocation(line: 86, column: 16, scope: !82)
!104 = !DILocalVariable(name: "acceptSocket", scope: !82, file: !74, line: 87, type: !65)
!105 = !DILocation(line: 87, column: 16, scope: !82)
!106 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !74, line: 88, type: !60)
!107 = !DILocation(line: 88, column: 14, scope: !82)
!108 = !DILocation(line: 89, column: 9, scope: !82)
!109 = !DILocation(line: 99, column: 28, scope: !110)
!110 = distinct !DILexicalBlock(scope: !82, file: !74, line: 90, column: 9)
!111 = !DILocation(line: 99, column: 26, scope: !110)
!112 = !DILocation(line: 100, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !74, line: 100, column: 17)
!114 = !DILocation(line: 100, column: 30, scope: !113)
!115 = !DILocation(line: 100, column: 17, scope: !110)
!116 = !DILocation(line: 102, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !74, line: 101, column: 13)
!118 = !DILocation(line: 104, column: 13, scope: !110)
!119 = !DILocation(line: 105, column: 21, scope: !110)
!120 = !DILocation(line: 105, column: 32, scope: !110)
!121 = !DILocation(line: 106, column: 21, scope: !110)
!122 = !DILocation(line: 106, column: 30, scope: !110)
!123 = !DILocation(line: 106, column: 37, scope: !110)
!124 = !DILocation(line: 107, column: 32, scope: !110)
!125 = !DILocation(line: 107, column: 21, scope: !110)
!126 = !DILocation(line: 107, column: 30, scope: !110)
!127 = !DILocation(line: 108, column: 22, scope: !128)
!128 = distinct !DILexicalBlock(scope: !110, file: !74, line: 108, column: 17)
!129 = !DILocation(line: 108, column: 36, scope: !128)
!130 = !DILocation(line: 108, column: 17, scope: !128)
!131 = !DILocation(line: 108, column: 81, scope: !128)
!132 = !DILocation(line: 108, column: 17, scope: !110)
!133 = !DILocation(line: 110, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !74, line: 109, column: 13)
!135 = !DILocation(line: 112, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !110, file: !74, line: 112, column: 17)
!137 = !DILocation(line: 112, column: 17, scope: !136)
!138 = !DILocation(line: 112, column: 54, scope: !136)
!139 = !DILocation(line: 112, column: 17, scope: !110)
!140 = !DILocation(line: 114, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !74, line: 113, column: 13)
!142 = !DILocation(line: 116, column: 35, scope: !110)
!143 = !DILocation(line: 116, column: 28, scope: !110)
!144 = !DILocation(line: 116, column: 26, scope: !110)
!145 = !DILocation(line: 117, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !110, file: !74, line: 117, column: 17)
!147 = !DILocation(line: 117, column: 30, scope: !146)
!148 = !DILocation(line: 117, column: 17, scope: !110)
!149 = !DILocation(line: 119, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !74, line: 118, column: 13)
!151 = !DILocation(line: 122, column: 31, scope: !110)
!152 = !DILocation(line: 122, column: 45, scope: !110)
!153 = !DILocation(line: 122, column: 26, scope: !110)
!154 = !DILocation(line: 122, column: 24, scope: !110)
!155 = !DILocation(line: 123, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !110, file: !74, line: 123, column: 17)
!157 = !DILocation(line: 123, column: 28, scope: !156)
!158 = !DILocation(line: 123, column: 44, scope: !156)
!159 = !DILocation(line: 123, column: 47, scope: !156)
!160 = !DILocation(line: 123, column: 58, scope: !156)
!161 = !DILocation(line: 123, column: 17, scope: !110)
!162 = !DILocation(line: 125, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !74, line: 124, column: 13)
!164 = !DILocation(line: 128, column: 25, scope: !110)
!165 = !DILocation(line: 128, column: 13, scope: !110)
!166 = !DILocation(line: 128, column: 37, scope: !110)
!167 = !DILocation(line: 130, column: 25, scope: !110)
!168 = !DILocation(line: 130, column: 20, scope: !110)
!169 = !DILocation(line: 130, column: 18, scope: !110)
!170 = !DILocation(line: 131, column: 9, scope: !110)
!171 = !DILocation(line: 133, column: 13, scope: !172)
!172 = distinct !DILexicalBlock(scope: !82, file: !74, line: 133, column: 13)
!173 = !DILocation(line: 133, column: 26, scope: !172)
!174 = !DILocation(line: 133, column: 13, scope: !82)
!175 = !DILocation(line: 135, column: 26, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !74, line: 134, column: 9)
!177 = !DILocation(line: 135, column: 13, scope: !176)
!178 = !DILocation(line: 136, column: 9, scope: !176)
!179 = !DILocation(line: 137, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !82, file: !74, line: 137, column: 13)
!181 = !DILocation(line: 137, column: 26, scope: !180)
!182 = !DILocation(line: 137, column: 13, scope: !82)
!183 = !DILocation(line: 139, column: 26, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !74, line: 138, column: 9)
!185 = !DILocation(line: 139, column: 13, scope: !184)
!186 = !DILocation(line: 140, column: 9, scope: !184)
!187 = !DILocation(line: 148, column: 13, scope: !73)
!188 = !DILocation(line: 148, column: 5, scope: !73)
!189 = !DILocation(line: 149, column: 1, scope: !73)
!190 = distinct !DISubprogram(name: "badSink", scope: !74, file: !74, line: 44, type: !191, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!191 = !DISubroutineType(types: !192)
!192 = !{null, !65}
!193 = !DILocalVariable(name: "data", arg: 1, scope: !190, file: !74, line: 44, type: !65)
!194 = !DILocation(line: 44, column: 25, scope: !190)
!195 = !DILocalVariable(name: "i", scope: !196, file: !74, line: 47, type: !65)
!196 = distinct !DILexicalBlock(scope: !190, file: !74, line: 46, column: 5)
!197 = !DILocation(line: 47, column: 13, scope: !196)
!198 = !DILocalVariable(name: "buffer", scope: !196, file: !74, line: 48, type: !64)
!199 = !DILocation(line: 48, column: 15, scope: !196)
!200 = !DILocation(line: 48, column: 31, scope: !196)
!201 = !DILocation(line: 48, column: 24, scope: !196)
!202 = !DILocation(line: 49, column: 13, scope: !203)
!203 = distinct !DILexicalBlock(scope: !196, file: !74, line: 49, column: 13)
!204 = !DILocation(line: 49, column: 20, scope: !203)
!205 = !DILocation(line: 49, column: 13, scope: !196)
!206 = !DILocation(line: 49, column: 30, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !74, line: 49, column: 29)
!208 = !DILocation(line: 51, column: 16, scope: !209)
!209 = distinct !DILexicalBlock(scope: !196, file: !74, line: 51, column: 9)
!210 = !DILocation(line: 51, column: 14, scope: !209)
!211 = !DILocation(line: 51, column: 21, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !74, line: 51, column: 9)
!213 = !DILocation(line: 51, column: 23, scope: !212)
!214 = !DILocation(line: 51, column: 9, scope: !209)
!215 = !DILocation(line: 53, column: 13, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !74, line: 52, column: 9)
!217 = !DILocation(line: 53, column: 20, scope: !216)
!218 = !DILocation(line: 53, column: 23, scope: !216)
!219 = !DILocation(line: 54, column: 9, scope: !216)
!220 = !DILocation(line: 51, column: 30, scope: !212)
!221 = !DILocation(line: 51, column: 9, scope: !212)
!222 = distinct !{!222, !214, !223, !224}
!223 = !DILocation(line: 54, column: 9, scope: !209)
!224 = !{!"llvm.loop.mustprogress"}
!225 = !DILocation(line: 57, column: 13, scope: !226)
!226 = distinct !DILexicalBlock(scope: !196, file: !74, line: 57, column: 13)
!227 = !DILocation(line: 57, column: 18, scope: !226)
!228 = !DILocation(line: 57, column: 13, scope: !196)
!229 = !DILocation(line: 59, column: 13, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !74, line: 58, column: 9)
!231 = !DILocation(line: 59, column: 20, scope: !230)
!232 = !DILocation(line: 59, column: 26, scope: !230)
!233 = !DILocation(line: 61, column: 19, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !74, line: 61, column: 13)
!235 = !DILocation(line: 61, column: 17, scope: !234)
!236 = !DILocation(line: 61, column: 24, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !74, line: 61, column: 13)
!238 = !DILocation(line: 61, column: 26, scope: !237)
!239 = !DILocation(line: 61, column: 13, scope: !234)
!240 = !DILocation(line: 63, column: 30, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !74, line: 62, column: 13)
!242 = !DILocation(line: 63, column: 37, scope: !241)
!243 = !DILocation(line: 63, column: 17, scope: !241)
!244 = !DILocation(line: 64, column: 13, scope: !241)
!245 = !DILocation(line: 61, column: 33, scope: !237)
!246 = !DILocation(line: 61, column: 13, scope: !237)
!247 = distinct !{!247, !239, !248, !224}
!248 = !DILocation(line: 64, column: 13, scope: !234)
!249 = !DILocation(line: 65, column: 9, scope: !230)
!250 = !DILocation(line: 68, column: 13, scope: !251)
!251 = distinct !DILexicalBlock(scope: !226, file: !74, line: 67, column: 9)
!252 = !DILocation(line: 70, column: 14, scope: !196)
!253 = !DILocation(line: 70, column: 9, scope: !196)
!254 = !DILocation(line: 72, column: 1, scope: !190)
!255 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_good", scope: !74, file: !74, line: 304, type: !75, scopeLine: 305, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!256 = !DILocation(line: 306, column: 5, scope: !255)
!257 = !DILocation(line: 307, column: 5, scope: !255)
!258 = !DILocation(line: 308, column: 1, scope: !255)
!259 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 319, type: !260, scopeLine: 320, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!260 = !DISubroutineType(types: !261)
!261 = !{!65, !65, !262}
!262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !263, size: 64)
!263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!264 = !DILocalVariable(name: "argc", arg: 1, scope: !259, file: !74, line: 319, type: !65)
!265 = !DILocation(line: 319, column: 14, scope: !259)
!266 = !DILocalVariable(name: "argv", arg: 2, scope: !259, file: !74, line: 319, type: !262)
!267 = !DILocation(line: 319, column: 27, scope: !259)
!268 = !DILocation(line: 322, column: 22, scope: !259)
!269 = !DILocation(line: 322, column: 12, scope: !259)
!270 = !DILocation(line: 322, column: 5, scope: !259)
!271 = !DILocation(line: 324, column: 5, scope: !259)
!272 = !DILocation(line: 325, column: 5, scope: !259)
!273 = !DILocation(line: 326, column: 5, scope: !259)
!274 = !DILocation(line: 329, column: 5, scope: !259)
!275 = !DILocation(line: 330, column: 5, scope: !259)
!276 = !DILocation(line: 331, column: 5, scope: !259)
!277 = !DILocation(line: 333, column: 5, scope: !259)
!278 = distinct !DISubprogram(name: "goodB2G", scope: !74, file: !74, line: 227, type: !75, scopeLine: 228, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!279 = !DILocalVariable(name: "data", scope: !278, file: !74, line: 229, type: !65)
!280 = !DILocation(line: 229, column: 9, scope: !278)
!281 = !DILocation(line: 231, column: 10, scope: !278)
!282 = !DILocalVariable(name: "recvResult", scope: !283, file: !74, line: 237, type: !65)
!283 = distinct !DILexicalBlock(scope: !278, file: !74, line: 232, column: 5)
!284 = !DILocation(line: 237, column: 13, scope: !283)
!285 = !DILocalVariable(name: "service", scope: !283, file: !74, line: 238, type: !85)
!286 = !DILocation(line: 238, column: 28, scope: !283)
!287 = !DILocalVariable(name: "listenSocket", scope: !283, file: !74, line: 239, type: !65)
!288 = !DILocation(line: 239, column: 16, scope: !283)
!289 = !DILocalVariable(name: "acceptSocket", scope: !283, file: !74, line: 240, type: !65)
!290 = !DILocation(line: 240, column: 16, scope: !283)
!291 = !DILocalVariable(name: "inputBuffer", scope: !283, file: !74, line: 241, type: !60)
!292 = !DILocation(line: 241, column: 14, scope: !283)
!293 = !DILocation(line: 242, column: 9, scope: !283)
!294 = !DILocation(line: 252, column: 28, scope: !295)
!295 = distinct !DILexicalBlock(scope: !283, file: !74, line: 243, column: 9)
!296 = !DILocation(line: 252, column: 26, scope: !295)
!297 = !DILocation(line: 253, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !295, file: !74, line: 253, column: 17)
!299 = !DILocation(line: 253, column: 30, scope: !298)
!300 = !DILocation(line: 253, column: 17, scope: !295)
!301 = !DILocation(line: 255, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !74, line: 254, column: 13)
!303 = !DILocation(line: 257, column: 13, scope: !295)
!304 = !DILocation(line: 258, column: 21, scope: !295)
!305 = !DILocation(line: 258, column: 32, scope: !295)
!306 = !DILocation(line: 259, column: 21, scope: !295)
!307 = !DILocation(line: 259, column: 30, scope: !295)
!308 = !DILocation(line: 259, column: 37, scope: !295)
!309 = !DILocation(line: 260, column: 32, scope: !295)
!310 = !DILocation(line: 260, column: 21, scope: !295)
!311 = !DILocation(line: 260, column: 30, scope: !295)
!312 = !DILocation(line: 261, column: 22, scope: !313)
!313 = distinct !DILexicalBlock(scope: !295, file: !74, line: 261, column: 17)
!314 = !DILocation(line: 261, column: 36, scope: !313)
!315 = !DILocation(line: 261, column: 17, scope: !313)
!316 = !DILocation(line: 261, column: 81, scope: !313)
!317 = !DILocation(line: 261, column: 17, scope: !295)
!318 = !DILocation(line: 263, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !313, file: !74, line: 262, column: 13)
!320 = !DILocation(line: 265, column: 24, scope: !321)
!321 = distinct !DILexicalBlock(scope: !295, file: !74, line: 265, column: 17)
!322 = !DILocation(line: 265, column: 17, scope: !321)
!323 = !DILocation(line: 265, column: 54, scope: !321)
!324 = !DILocation(line: 265, column: 17, scope: !295)
!325 = !DILocation(line: 267, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !321, file: !74, line: 266, column: 13)
!327 = !DILocation(line: 269, column: 35, scope: !295)
!328 = !DILocation(line: 269, column: 28, scope: !295)
!329 = !DILocation(line: 269, column: 26, scope: !295)
!330 = !DILocation(line: 270, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !295, file: !74, line: 270, column: 17)
!332 = !DILocation(line: 270, column: 30, scope: !331)
!333 = !DILocation(line: 270, column: 17, scope: !295)
!334 = !DILocation(line: 272, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !74, line: 271, column: 13)
!336 = !DILocation(line: 275, column: 31, scope: !295)
!337 = !DILocation(line: 275, column: 45, scope: !295)
!338 = !DILocation(line: 275, column: 26, scope: !295)
!339 = !DILocation(line: 275, column: 24, scope: !295)
!340 = !DILocation(line: 276, column: 17, scope: !341)
!341 = distinct !DILexicalBlock(scope: !295, file: !74, line: 276, column: 17)
!342 = !DILocation(line: 276, column: 28, scope: !341)
!343 = !DILocation(line: 276, column: 44, scope: !341)
!344 = !DILocation(line: 276, column: 47, scope: !341)
!345 = !DILocation(line: 276, column: 58, scope: !341)
!346 = !DILocation(line: 276, column: 17, scope: !295)
!347 = !DILocation(line: 278, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !341, file: !74, line: 277, column: 13)
!349 = !DILocation(line: 281, column: 25, scope: !295)
!350 = !DILocation(line: 281, column: 13, scope: !295)
!351 = !DILocation(line: 281, column: 37, scope: !295)
!352 = !DILocation(line: 283, column: 25, scope: !295)
!353 = !DILocation(line: 283, column: 20, scope: !295)
!354 = !DILocation(line: 283, column: 18, scope: !295)
!355 = !DILocation(line: 284, column: 9, scope: !295)
!356 = !DILocation(line: 286, column: 13, scope: !357)
!357 = distinct !DILexicalBlock(scope: !283, file: !74, line: 286, column: 13)
!358 = !DILocation(line: 286, column: 26, scope: !357)
!359 = !DILocation(line: 286, column: 13, scope: !283)
!360 = !DILocation(line: 288, column: 26, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !74, line: 287, column: 9)
!362 = !DILocation(line: 288, column: 13, scope: !361)
!363 = !DILocation(line: 289, column: 9, scope: !361)
!364 = !DILocation(line: 290, column: 13, scope: !365)
!365 = distinct !DILexicalBlock(scope: !283, file: !74, line: 290, column: 13)
!366 = !DILocation(line: 290, column: 26, scope: !365)
!367 = !DILocation(line: 290, column: 13, scope: !283)
!368 = !DILocation(line: 292, column: 26, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !74, line: 291, column: 9)
!370 = !DILocation(line: 292, column: 13, scope: !369)
!371 = !DILocation(line: 293, column: 9, scope: !369)
!372 = !DILocation(line: 301, column: 17, scope: !278)
!373 = !DILocation(line: 301, column: 5, scope: !278)
!374 = !DILocation(line: 302, column: 1, scope: !278)
!375 = distinct !DISubprogram(name: "goodB2GSink", scope: !74, file: !74, line: 198, type: !191, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!376 = !DILocalVariable(name: "data", arg: 1, scope: !375, file: !74, line: 198, type: !65)
!377 = !DILocation(line: 198, column: 29, scope: !375)
!378 = !DILocalVariable(name: "i", scope: !379, file: !74, line: 201, type: !65)
!379 = distinct !DILexicalBlock(scope: !375, file: !74, line: 200, column: 5)
!380 = !DILocation(line: 201, column: 13, scope: !379)
!381 = !DILocalVariable(name: "buffer", scope: !379, file: !74, line: 202, type: !64)
!382 = !DILocation(line: 202, column: 15, scope: !379)
!383 = !DILocation(line: 202, column: 31, scope: !379)
!384 = !DILocation(line: 202, column: 24, scope: !379)
!385 = !DILocation(line: 203, column: 13, scope: !386)
!386 = distinct !DILexicalBlock(scope: !379, file: !74, line: 203, column: 13)
!387 = !DILocation(line: 203, column: 20, scope: !386)
!388 = !DILocation(line: 203, column: 13, scope: !379)
!389 = !DILocation(line: 203, column: 30, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !74, line: 203, column: 29)
!391 = !DILocation(line: 205, column: 16, scope: !392)
!392 = distinct !DILexicalBlock(scope: !379, file: !74, line: 205, column: 9)
!393 = !DILocation(line: 205, column: 14, scope: !392)
!394 = !DILocation(line: 205, column: 21, scope: !395)
!395 = distinct !DILexicalBlock(scope: !392, file: !74, line: 205, column: 9)
!396 = !DILocation(line: 205, column: 23, scope: !395)
!397 = !DILocation(line: 205, column: 9, scope: !392)
!398 = !DILocation(line: 207, column: 13, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !74, line: 206, column: 9)
!400 = !DILocation(line: 207, column: 20, scope: !399)
!401 = !DILocation(line: 207, column: 23, scope: !399)
!402 = !DILocation(line: 208, column: 9, scope: !399)
!403 = !DILocation(line: 205, column: 30, scope: !395)
!404 = !DILocation(line: 205, column: 9, scope: !395)
!405 = distinct !{!405, !397, !406, !224}
!406 = !DILocation(line: 208, column: 9, scope: !392)
!407 = !DILocation(line: 210, column: 13, scope: !408)
!408 = distinct !DILexicalBlock(scope: !379, file: !74, line: 210, column: 13)
!409 = !DILocation(line: 210, column: 18, scope: !408)
!410 = !DILocation(line: 210, column: 23, scope: !408)
!411 = !DILocation(line: 210, column: 26, scope: !408)
!412 = !DILocation(line: 210, column: 31, scope: !408)
!413 = !DILocation(line: 210, column: 13, scope: !379)
!414 = !DILocation(line: 212, column: 13, scope: !415)
!415 = distinct !DILexicalBlock(scope: !408, file: !74, line: 211, column: 9)
!416 = !DILocation(line: 212, column: 20, scope: !415)
!417 = !DILocation(line: 212, column: 26, scope: !415)
!418 = !DILocation(line: 214, column: 19, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !74, line: 214, column: 13)
!420 = !DILocation(line: 214, column: 17, scope: !419)
!421 = !DILocation(line: 214, column: 24, scope: !422)
!422 = distinct !DILexicalBlock(scope: !419, file: !74, line: 214, column: 13)
!423 = !DILocation(line: 214, column: 26, scope: !422)
!424 = !DILocation(line: 214, column: 13, scope: !419)
!425 = !DILocation(line: 216, column: 30, scope: !426)
!426 = distinct !DILexicalBlock(scope: !422, file: !74, line: 215, column: 13)
!427 = !DILocation(line: 216, column: 37, scope: !426)
!428 = !DILocation(line: 216, column: 17, scope: !426)
!429 = !DILocation(line: 217, column: 13, scope: !426)
!430 = !DILocation(line: 214, column: 33, scope: !422)
!431 = !DILocation(line: 214, column: 13, scope: !422)
!432 = distinct !{!432, !424, !433, !224}
!433 = !DILocation(line: 217, column: 13, scope: !419)
!434 = !DILocation(line: 218, column: 9, scope: !415)
!435 = !DILocation(line: 221, column: 13, scope: !436)
!436 = distinct !DILexicalBlock(scope: !408, file: !74, line: 220, column: 9)
!437 = !DILocation(line: 223, column: 14, scope: !379)
!438 = !DILocation(line: 223, column: 9, scope: !379)
!439 = !DILocation(line: 225, column: 1, scope: !375)
!440 = distinct !DISubprogram(name: "goodG2B", scope: !74, file: !74, line: 186, type: !75, scopeLine: 187, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!441 = !DILocalVariable(name: "data", scope: !440, file: !74, line: 188, type: !65)
!442 = !DILocation(line: 188, column: 9, scope: !440)
!443 = !DILocation(line: 190, column: 10, scope: !440)
!444 = !DILocation(line: 193, column: 10, scope: !440)
!445 = !DILocation(line: 194, column: 17, scope: !440)
!446 = !DILocation(line: 194, column: 5, scope: !440)
!447 = !DILocation(line: 195, column: 1, scope: !440)
!448 = distinct !DISubprogram(name: "goodG2BSink", scope: !74, file: !74, line: 156, type: !191, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!449 = !DILocalVariable(name: "data", arg: 1, scope: !448, file: !74, line: 156, type: !65)
!450 = !DILocation(line: 156, column: 29, scope: !448)
!451 = !DILocalVariable(name: "i", scope: !452, file: !74, line: 159, type: !65)
!452 = distinct !DILexicalBlock(scope: !448, file: !74, line: 158, column: 5)
!453 = !DILocation(line: 159, column: 13, scope: !452)
!454 = !DILocalVariable(name: "buffer", scope: !452, file: !74, line: 160, type: !64)
!455 = !DILocation(line: 160, column: 15, scope: !452)
!456 = !DILocation(line: 160, column: 31, scope: !452)
!457 = !DILocation(line: 160, column: 24, scope: !452)
!458 = !DILocation(line: 161, column: 13, scope: !459)
!459 = distinct !DILexicalBlock(scope: !452, file: !74, line: 161, column: 13)
!460 = !DILocation(line: 161, column: 20, scope: !459)
!461 = !DILocation(line: 161, column: 13, scope: !452)
!462 = !DILocation(line: 161, column: 30, scope: !463)
!463 = distinct !DILexicalBlock(scope: !459, file: !74, line: 161, column: 29)
!464 = !DILocation(line: 163, column: 16, scope: !465)
!465 = distinct !DILexicalBlock(scope: !452, file: !74, line: 163, column: 9)
!466 = !DILocation(line: 163, column: 14, scope: !465)
!467 = !DILocation(line: 163, column: 21, scope: !468)
!468 = distinct !DILexicalBlock(scope: !465, file: !74, line: 163, column: 9)
!469 = !DILocation(line: 163, column: 23, scope: !468)
!470 = !DILocation(line: 163, column: 9, scope: !465)
!471 = !DILocation(line: 165, column: 13, scope: !472)
!472 = distinct !DILexicalBlock(scope: !468, file: !74, line: 164, column: 9)
!473 = !DILocation(line: 165, column: 20, scope: !472)
!474 = !DILocation(line: 165, column: 23, scope: !472)
!475 = !DILocation(line: 166, column: 9, scope: !472)
!476 = !DILocation(line: 163, column: 30, scope: !468)
!477 = !DILocation(line: 163, column: 9, scope: !468)
!478 = distinct !{!478, !470, !479, !224}
!479 = !DILocation(line: 166, column: 9, scope: !465)
!480 = !DILocation(line: 169, column: 13, scope: !481)
!481 = distinct !DILexicalBlock(scope: !452, file: !74, line: 169, column: 13)
!482 = !DILocation(line: 169, column: 18, scope: !481)
!483 = !DILocation(line: 169, column: 13, scope: !452)
!484 = !DILocation(line: 171, column: 13, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !74, line: 170, column: 9)
!486 = !DILocation(line: 171, column: 20, scope: !485)
!487 = !DILocation(line: 171, column: 26, scope: !485)
!488 = !DILocation(line: 173, column: 19, scope: !489)
!489 = distinct !DILexicalBlock(scope: !485, file: !74, line: 173, column: 13)
!490 = !DILocation(line: 173, column: 17, scope: !489)
!491 = !DILocation(line: 173, column: 24, scope: !492)
!492 = distinct !DILexicalBlock(scope: !489, file: !74, line: 173, column: 13)
!493 = !DILocation(line: 173, column: 26, scope: !492)
!494 = !DILocation(line: 173, column: 13, scope: !489)
!495 = !DILocation(line: 175, column: 30, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !74, line: 174, column: 13)
!497 = !DILocation(line: 175, column: 37, scope: !496)
!498 = !DILocation(line: 175, column: 17, scope: !496)
!499 = !DILocation(line: 176, column: 13, scope: !496)
!500 = !DILocation(line: 173, column: 33, scope: !492)
!501 = !DILocation(line: 173, column: 13, scope: !492)
!502 = distinct !{!502, !494, !503, !224}
!503 = !DILocation(line: 176, column: 13, scope: !489)
!504 = !DILocation(line: 177, column: 9, scope: !485)
!505 = !DILocation(line: 180, column: 13, scope: !506)
!506 = distinct !DILexicalBlock(scope: !481, file: !74, line: 179, column: 9)
!507 = !DILocation(line: 182, column: 14, scope: !452)
!508 = !DILocation(line: 182, column: 9, scope: !452)
!509 = !DILocation(line: 184, column: 1, scope: !448)
