; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_44.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_44_bad() #0 !dbg !73 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !80, metadata !DIExpression()), !dbg !84
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !84
  store i32 -1, i32* %data, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !86, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !89, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %listenSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %acceptSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  br label %do.body, !dbg !113

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !114
  store i32 %call, i32* %listenSocket, align 4, !dbg !116
  %0 = load i32, i32* %listenSocket, align 4, !dbg !117
  %cmp = icmp eq i32 %0, -1, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !121

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !123
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !124
  store i16 2, i16* %sin_family, align 4, !dbg !125
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !126
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !127
  store i32 0, i32* %s_addr, align 4, !dbg !128
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !129
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !130
  store i16 %call1, i16* %sin_port, align 2, !dbg !131
  %2 = load i32, i32* %listenSocket, align 4, !dbg !132
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !134
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !135
  %cmp3 = icmp eq i32 %call2, -1, !dbg !136
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !137

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !138

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !142
  %cmp7 = icmp eq i32 %call6, -1, !dbg !143
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !144

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !145

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !147
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !148
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !149
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !150
  %cmp11 = icmp eq i32 %6, -1, !dbg !152
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !153

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !154

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !156
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !157
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !158
  %conv = trunc i64 %call14 to i32, !dbg !158
  store i32 %conv, i32* %recvResult, align 4, !dbg !159
  %8 = load i32, i32* %recvResult, align 4, !dbg !160
  %cmp15 = icmp eq i32 %8, -1, !dbg !162
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !163

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !164
  %cmp17 = icmp eq i32 %9, 0, !dbg !165
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !166

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !167

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !169
  %idxprom = sext i32 %10 to i64, !dbg !170
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !172
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !173
  store i32 %call22, i32* %data, align 4, !dbg !174
  br label %do.end, !dbg !175

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !176
  %cmp23 = icmp ne i32 %11, -1, !dbg !178
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !179

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !180
  %call26 = call i32 @close(i32 %12), !dbg !182
  br label %if.end27, !dbg !183

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !184
  %cmp28 = icmp ne i32 %13, -1, !dbg !186
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !187

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !188
  %call31 = call i32 @close(i32 %14), !dbg !190
  br label %if.end32, !dbg !191

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !192
  %16 = load i32, i32* %data, align 4, !dbg !193
  call void %15(i32 %16), !dbg !192
  ret void, !dbg !194
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !195 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !196, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i32* %i, metadata !198, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !201, metadata !DIExpression()), !dbg !202
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !203
  %0 = bitcast i8* %call to i32*, !dbg !204
  store i32* %0, i32** %buffer, align 8, !dbg !202
  %1 = load i32*, i32** %buffer, align 8, !dbg !205
  %cmp = icmp eq i32* %1, null, !dbg !207
  br i1 %cmp, label %if.then, label %if.end, !dbg !208

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !209
  unreachable, !dbg !209

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !214
  %cmp1 = icmp slt i32 %2, 10, !dbg !216
  br i1 %cmp1, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !218
  %4 = load i32, i32* %i, align 4, !dbg !220
  %idxprom = sext i32 %4 to i64, !dbg !218
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !218
  store i32 0, i32* %arrayidx, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !223
  %inc = add nsw i32 %5, 1, !dbg !223
  store i32 %inc, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !228
  %cmp2 = icmp sge i32 %6, 0, !dbg !230
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !231

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !232
  %8 = load i32, i32* %data.addr, align 4, !dbg !234
  %idxprom4 = sext i32 %8 to i64, !dbg !232
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !232
  store i32 1, i32* %arrayidx5, align 4, !dbg !235
  store i32 0, i32* %i, align 4, !dbg !236
  br label %for.cond6, !dbg !238

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !239
  %cmp7 = icmp slt i32 %9, 10, !dbg !241
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !242

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !243
  %11 = load i32, i32* %i, align 4, !dbg !245
  %idxprom9 = sext i32 %11 to i64, !dbg !243
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !243
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !243
  call void @printIntLine(i32 %12), !dbg !246
  br label %for.inc11, !dbg !247

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !248
  %inc12 = add nsw i32 %13, 1, !dbg !248
  store i32 %inc12, i32* %i, align 4, !dbg !248
  br label %for.cond6, !dbg !249, !llvm.loop !250

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !252

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !253
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !255
  %15 = bitcast i32* %14 to i8*, !dbg !255
  call void @free(i8* %15) #8, !dbg !256
  ret void, !dbg !257
}

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_44_good() #0 !dbg !258 {
entry:
  call void @goodG2B(), !dbg !259
  call void @goodB2G(), !dbg !260
  ret void, !dbg !261
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !262 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !267, metadata !DIExpression()), !dbg !268
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !269, metadata !DIExpression()), !dbg !270
  %call = call i64 @time(i64* null) #8, !dbg !271
  %conv = trunc i64 %call to i32, !dbg !272
  call void @srand(i32 %conv) #8, !dbg !273
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !274
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_44_good(), !dbg !275
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !276
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !277
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_44_bad(), !dbg !278
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !279
  ret i32 0, !dbg !280
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
define internal void @goodG2B() #0 !dbg !281 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !282, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !284, metadata !DIExpression()), !dbg !285
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !285
  store i32 -1, i32* %data, align 4, !dbg !286
  store i32 7, i32* %data, align 4, !dbg !287
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !288
  %1 = load i32, i32* %data, align 4, !dbg !289
  call void %0(i32 %1), !dbg !288
  ret void, !dbg !290
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !291 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !292, metadata !DIExpression()), !dbg !293
  call void @llvm.dbg.declare(metadata i32* %i, metadata !294, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !297, metadata !DIExpression()), !dbg !298
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !299
  %0 = bitcast i8* %call to i32*, !dbg !300
  store i32* %0, i32** %buffer, align 8, !dbg !298
  %1 = load i32*, i32** %buffer, align 8, !dbg !301
  %cmp = icmp eq i32* %1, null, !dbg !303
  br i1 %cmp, label %if.then, label %if.end, !dbg !304

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !305
  unreachable, !dbg !305

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !307
  br label %for.cond, !dbg !309

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !310
  %cmp1 = icmp slt i32 %2, 10, !dbg !312
  br i1 %cmp1, label %for.body, label %for.end, !dbg !313

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !314
  %4 = load i32, i32* %i, align 4, !dbg !316
  %idxprom = sext i32 %4 to i64, !dbg !314
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !314
  store i32 0, i32* %arrayidx, align 4, !dbg !317
  br label %for.inc, !dbg !318

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !319
  %inc = add nsw i32 %5, 1, !dbg !319
  store i32 %inc, i32* %i, align 4, !dbg !319
  br label %for.cond, !dbg !320, !llvm.loop !321

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !323
  %cmp2 = icmp sge i32 %6, 0, !dbg !325
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !326

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !327
  %8 = load i32, i32* %data.addr, align 4, !dbg !329
  %idxprom4 = sext i32 %8 to i64, !dbg !327
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !327
  store i32 1, i32* %arrayidx5, align 4, !dbg !330
  store i32 0, i32* %i, align 4, !dbg !331
  br label %for.cond6, !dbg !333

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !334
  %cmp7 = icmp slt i32 %9, 10, !dbg !336
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !337

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !338
  %11 = load i32, i32* %i, align 4, !dbg !340
  %idxprom9 = sext i32 %11 to i64, !dbg !338
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !338
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !338
  call void @printIntLine(i32 %12), !dbg !341
  br label %for.inc11, !dbg !342

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !343
  %inc12 = add nsw i32 %13, 1, !dbg !343
  store i32 %inc12, i32* %i, align 4, !dbg !343
  br label %for.cond6, !dbg !344, !llvm.loop !345

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !347

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !348
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !350
  %15 = bitcast i32* %14 to i8*, !dbg !350
  call void @free(i8* %15) #8, !dbg !351
  ret void, !dbg !352
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !353 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !354, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !356, metadata !DIExpression()), !dbg !357
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !357
  store i32 -1, i32* %data, align 4, !dbg !358
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !359, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !362, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !364, metadata !DIExpression()), !dbg !365
  store i32 -1, i32* %listenSocket, align 4, !dbg !365
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !366, metadata !DIExpression()), !dbg !367
  store i32 -1, i32* %acceptSocket, align 4, !dbg !367
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !368, metadata !DIExpression()), !dbg !369
  br label %do.body, !dbg !370

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !371
  store i32 %call, i32* %listenSocket, align 4, !dbg !373
  %0 = load i32, i32* %listenSocket, align 4, !dbg !374
  %cmp = icmp eq i32 %0, -1, !dbg !376
  br i1 %cmp, label %if.then, label %if.end, !dbg !377

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !378

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !380
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !380
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !381
  store i16 2, i16* %sin_family, align 4, !dbg !382
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !383
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !384
  store i32 0, i32* %s_addr, align 4, !dbg !385
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !386
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !387
  store i16 %call1, i16* %sin_port, align 2, !dbg !388
  %2 = load i32, i32* %listenSocket, align 4, !dbg !389
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !391
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !392
  %cmp3 = icmp eq i32 %call2, -1, !dbg !393
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !394

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !395

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !397
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !399
  %cmp7 = icmp eq i32 %call6, -1, !dbg !400
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !401

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !402

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !404
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !405
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !406
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !407
  %cmp11 = icmp eq i32 %6, -1, !dbg !409
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !410

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !411

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !413
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !414
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !415
  %conv = trunc i64 %call14 to i32, !dbg !415
  store i32 %conv, i32* %recvResult, align 4, !dbg !416
  %8 = load i32, i32* %recvResult, align 4, !dbg !417
  %cmp15 = icmp eq i32 %8, -1, !dbg !419
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !420

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !421
  %cmp17 = icmp eq i32 %9, 0, !dbg !422
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !423

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !424

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !426
  %idxprom = sext i32 %10 to i64, !dbg !427
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !427
  store i8 0, i8* %arrayidx, align 1, !dbg !428
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !429
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !430
  store i32 %call22, i32* %data, align 4, !dbg !431
  br label %do.end, !dbg !432

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !433
  %cmp23 = icmp ne i32 %11, -1, !dbg !435
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !436

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !437
  %call26 = call i32 @close(i32 %12), !dbg !439
  br label %if.end27, !dbg !440

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !441
  %cmp28 = icmp ne i32 %13, -1, !dbg !443
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !444

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !445
  %call31 = call i32 @close(i32 %14), !dbg !447
  br label %if.end32, !dbg !448

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !449
  %16 = load i32, i32* %data, align 4, !dbg !450
  call void %15(i32 %16), !dbg !449
  ret void, !dbg !451
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !452 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !453, metadata !DIExpression()), !dbg !454
  call void @llvm.dbg.declare(metadata i32* %i, metadata !455, metadata !DIExpression()), !dbg !457
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !458, metadata !DIExpression()), !dbg !459
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !460
  %0 = bitcast i8* %call to i32*, !dbg !461
  store i32* %0, i32** %buffer, align 8, !dbg !459
  %1 = load i32*, i32** %buffer, align 8, !dbg !462
  %cmp = icmp eq i32* %1, null, !dbg !464
  br i1 %cmp, label %if.then, label %if.end, !dbg !465

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !466
  unreachable, !dbg !466

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !468
  br label %for.cond, !dbg !470

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !471
  %cmp1 = icmp slt i32 %2, 10, !dbg !473
  br i1 %cmp1, label %for.body, label %for.end, !dbg !474

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !475
  %4 = load i32, i32* %i, align 4, !dbg !477
  %idxprom = sext i32 %4 to i64, !dbg !475
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !475
  store i32 0, i32* %arrayidx, align 4, !dbg !478
  br label %for.inc, !dbg !479

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !480
  %inc = add nsw i32 %5, 1, !dbg !480
  store i32 %inc, i32* %i, align 4, !dbg !480
  br label %for.cond, !dbg !481, !llvm.loop !482

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !484
  %cmp2 = icmp sge i32 %6, 0, !dbg !486
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !487

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !488
  %cmp3 = icmp slt i32 %7, 10, !dbg !489
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !490

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !491
  %9 = load i32, i32* %data.addr, align 4, !dbg !493
  %idxprom5 = sext i32 %9 to i64, !dbg !491
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !491
  store i32 1, i32* %arrayidx6, align 4, !dbg !494
  store i32 0, i32* %i, align 4, !dbg !495
  br label %for.cond7, !dbg !497

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !498
  %cmp8 = icmp slt i32 %10, 10, !dbg !500
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !501

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !502
  %12 = load i32, i32* %i, align 4, !dbg !504
  %idxprom10 = sext i32 %12 to i64, !dbg !502
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !502
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !502
  call void @printIntLine(i32 %13), !dbg !505
  br label %for.inc12, !dbg !506

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !507
  %inc13 = add nsw i32 %14, 1, !dbg !507
  store i32 %inc13, i32* %i, align 4, !dbg !507
  br label %for.cond7, !dbg !508, !llvm.loop !509

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !511

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !512
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !514
  %16 = bitcast i32* %15 to i8*, !dbg !514
  call void @free(i8* %16) #8, !dbg !515
  ret void, !dbg !516
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_44.c", directory: "/root/SSE-Assessment")
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
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !50, line: 41, baseType: !5)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !53, line: 175, size: 128, elements: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!54 = !{!55, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !52, file: !53, line: 177, baseType: !56, size: 16)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !57, line: 28, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!58 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !52, file: !53, line: 178, baseType: !60, size: 112, offset: 16)
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
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_44_bad", scope: !74, file: !74, line: 74, type: !75, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_44.c", directory: "/root/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 76, type: !65)
!79 = !DILocation(line: 76, column: 9, scope: !73)
!80 = !DILocalVariable(name: "funcPtr", scope: !73, file: !74, line: 78, type: !81)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DISubroutineType(types: !83)
!83 = !{null, !65}
!84 = !DILocation(line: 78, column: 12, scope: !73)
!85 = !DILocation(line: 80, column: 10, scope: !73)
!86 = !DILocalVariable(name: "recvResult", scope: !87, file: !74, line: 86, type: !65)
!87 = distinct !DILexicalBlock(scope: !73, file: !74, line: 81, column: 5)
!88 = !DILocation(line: 86, column: 13, scope: !87)
!89 = !DILocalVariable(name: "service", scope: !87, file: !74, line: 87, type: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !91)
!91 = !{!92, !93, !97, !101}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !90, file: !17, line: 239, baseType: !56, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !90, file: !17, line: 240, baseType: !94, size: 16, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !90, file: !17, line: 241, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !17, line: 33, baseType: !46, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !90, file: !17, line: 244, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 87, column: 28, scope: !87)
!107 = !DILocalVariable(name: "listenSocket", scope: !87, file: !74, line: 88, type: !65)
!108 = !DILocation(line: 88, column: 16, scope: !87)
!109 = !DILocalVariable(name: "acceptSocket", scope: !87, file: !74, line: 89, type: !65)
!110 = !DILocation(line: 89, column: 16, scope: !87)
!111 = !DILocalVariable(name: "inputBuffer", scope: !87, file: !74, line: 90, type: !60)
!112 = !DILocation(line: 90, column: 14, scope: !87)
!113 = !DILocation(line: 91, column: 9, scope: !87)
!114 = !DILocation(line: 101, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !87, file: !74, line: 92, column: 9)
!116 = !DILocation(line: 101, column: 26, scope: !115)
!117 = !DILocation(line: 102, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !74, line: 102, column: 17)
!119 = !DILocation(line: 102, column: 30, scope: !118)
!120 = !DILocation(line: 102, column: 17, scope: !115)
!121 = !DILocation(line: 104, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !74, line: 103, column: 13)
!123 = !DILocation(line: 106, column: 13, scope: !115)
!124 = !DILocation(line: 107, column: 21, scope: !115)
!125 = !DILocation(line: 107, column: 32, scope: !115)
!126 = !DILocation(line: 108, column: 21, scope: !115)
!127 = !DILocation(line: 108, column: 30, scope: !115)
!128 = !DILocation(line: 108, column: 37, scope: !115)
!129 = !DILocation(line: 109, column: 32, scope: !115)
!130 = !DILocation(line: 109, column: 21, scope: !115)
!131 = !DILocation(line: 109, column: 30, scope: !115)
!132 = !DILocation(line: 110, column: 22, scope: !133)
!133 = distinct !DILexicalBlock(scope: !115, file: !74, line: 110, column: 17)
!134 = !DILocation(line: 110, column: 36, scope: !133)
!135 = !DILocation(line: 110, column: 17, scope: !133)
!136 = !DILocation(line: 110, column: 81, scope: !133)
!137 = !DILocation(line: 110, column: 17, scope: !115)
!138 = !DILocation(line: 112, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !74, line: 111, column: 13)
!140 = !DILocation(line: 114, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !115, file: !74, line: 114, column: 17)
!142 = !DILocation(line: 114, column: 17, scope: !141)
!143 = !DILocation(line: 114, column: 54, scope: !141)
!144 = !DILocation(line: 114, column: 17, scope: !115)
!145 = !DILocation(line: 116, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !74, line: 115, column: 13)
!147 = !DILocation(line: 118, column: 35, scope: !115)
!148 = !DILocation(line: 118, column: 28, scope: !115)
!149 = !DILocation(line: 118, column: 26, scope: !115)
!150 = !DILocation(line: 119, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !115, file: !74, line: 119, column: 17)
!152 = !DILocation(line: 119, column: 30, scope: !151)
!153 = !DILocation(line: 119, column: 17, scope: !115)
!154 = !DILocation(line: 121, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !74, line: 120, column: 13)
!156 = !DILocation(line: 124, column: 31, scope: !115)
!157 = !DILocation(line: 124, column: 45, scope: !115)
!158 = !DILocation(line: 124, column: 26, scope: !115)
!159 = !DILocation(line: 124, column: 24, scope: !115)
!160 = !DILocation(line: 125, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !115, file: !74, line: 125, column: 17)
!162 = !DILocation(line: 125, column: 28, scope: !161)
!163 = !DILocation(line: 125, column: 44, scope: !161)
!164 = !DILocation(line: 125, column: 47, scope: !161)
!165 = !DILocation(line: 125, column: 58, scope: !161)
!166 = !DILocation(line: 125, column: 17, scope: !115)
!167 = !DILocation(line: 127, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !74, line: 126, column: 13)
!169 = !DILocation(line: 130, column: 25, scope: !115)
!170 = !DILocation(line: 130, column: 13, scope: !115)
!171 = !DILocation(line: 130, column: 37, scope: !115)
!172 = !DILocation(line: 132, column: 25, scope: !115)
!173 = !DILocation(line: 132, column: 20, scope: !115)
!174 = !DILocation(line: 132, column: 18, scope: !115)
!175 = !DILocation(line: 133, column: 9, scope: !115)
!176 = !DILocation(line: 135, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !87, file: !74, line: 135, column: 13)
!178 = !DILocation(line: 135, column: 26, scope: !177)
!179 = !DILocation(line: 135, column: 13, scope: !87)
!180 = !DILocation(line: 137, column: 26, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !74, line: 136, column: 9)
!182 = !DILocation(line: 137, column: 13, scope: !181)
!183 = !DILocation(line: 138, column: 9, scope: !181)
!184 = !DILocation(line: 139, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !87, file: !74, line: 139, column: 13)
!186 = !DILocation(line: 139, column: 26, scope: !185)
!187 = !DILocation(line: 139, column: 13, scope: !87)
!188 = !DILocation(line: 141, column: 26, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !74, line: 140, column: 9)
!190 = !DILocation(line: 141, column: 13, scope: !189)
!191 = !DILocation(line: 142, column: 9, scope: !189)
!192 = !DILocation(line: 151, column: 5, scope: !73)
!193 = !DILocation(line: 151, column: 13, scope: !73)
!194 = !DILocation(line: 152, column: 1, scope: !73)
!195 = distinct !DISubprogram(name: "badSink", scope: !74, file: !74, line: 44, type: !82, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!196 = !DILocalVariable(name: "data", arg: 1, scope: !195, file: !74, line: 44, type: !65)
!197 = !DILocation(line: 44, column: 25, scope: !195)
!198 = !DILocalVariable(name: "i", scope: !199, file: !74, line: 47, type: !65)
!199 = distinct !DILexicalBlock(scope: !195, file: !74, line: 46, column: 5)
!200 = !DILocation(line: 47, column: 13, scope: !199)
!201 = !DILocalVariable(name: "buffer", scope: !199, file: !74, line: 48, type: !64)
!202 = !DILocation(line: 48, column: 15, scope: !199)
!203 = !DILocation(line: 48, column: 31, scope: !199)
!204 = !DILocation(line: 48, column: 24, scope: !199)
!205 = !DILocation(line: 49, column: 13, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !74, line: 49, column: 13)
!207 = !DILocation(line: 49, column: 20, scope: !206)
!208 = !DILocation(line: 49, column: 13, scope: !199)
!209 = !DILocation(line: 49, column: 30, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !74, line: 49, column: 29)
!211 = !DILocation(line: 51, column: 16, scope: !212)
!212 = distinct !DILexicalBlock(scope: !199, file: !74, line: 51, column: 9)
!213 = !DILocation(line: 51, column: 14, scope: !212)
!214 = !DILocation(line: 51, column: 21, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !74, line: 51, column: 9)
!216 = !DILocation(line: 51, column: 23, scope: !215)
!217 = !DILocation(line: 51, column: 9, scope: !212)
!218 = !DILocation(line: 53, column: 13, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !74, line: 52, column: 9)
!220 = !DILocation(line: 53, column: 20, scope: !219)
!221 = !DILocation(line: 53, column: 23, scope: !219)
!222 = !DILocation(line: 54, column: 9, scope: !219)
!223 = !DILocation(line: 51, column: 30, scope: !215)
!224 = !DILocation(line: 51, column: 9, scope: !215)
!225 = distinct !{!225, !217, !226, !227}
!226 = !DILocation(line: 54, column: 9, scope: !212)
!227 = !{!"llvm.loop.mustprogress"}
!228 = !DILocation(line: 57, column: 13, scope: !229)
!229 = distinct !DILexicalBlock(scope: !199, file: !74, line: 57, column: 13)
!230 = !DILocation(line: 57, column: 18, scope: !229)
!231 = !DILocation(line: 57, column: 13, scope: !199)
!232 = !DILocation(line: 59, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !74, line: 58, column: 9)
!234 = !DILocation(line: 59, column: 20, scope: !233)
!235 = !DILocation(line: 59, column: 26, scope: !233)
!236 = !DILocation(line: 61, column: 19, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !74, line: 61, column: 13)
!238 = !DILocation(line: 61, column: 17, scope: !237)
!239 = !DILocation(line: 61, column: 24, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !74, line: 61, column: 13)
!241 = !DILocation(line: 61, column: 26, scope: !240)
!242 = !DILocation(line: 61, column: 13, scope: !237)
!243 = !DILocation(line: 63, column: 30, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !74, line: 62, column: 13)
!245 = !DILocation(line: 63, column: 37, scope: !244)
!246 = !DILocation(line: 63, column: 17, scope: !244)
!247 = !DILocation(line: 64, column: 13, scope: !244)
!248 = !DILocation(line: 61, column: 33, scope: !240)
!249 = !DILocation(line: 61, column: 13, scope: !240)
!250 = distinct !{!250, !242, !251, !227}
!251 = !DILocation(line: 64, column: 13, scope: !237)
!252 = !DILocation(line: 65, column: 9, scope: !233)
!253 = !DILocation(line: 68, column: 13, scope: !254)
!254 = distinct !DILexicalBlock(scope: !229, file: !74, line: 67, column: 9)
!255 = !DILocation(line: 70, column: 14, scope: !199)
!256 = !DILocation(line: 70, column: 9, scope: !199)
!257 = !DILocation(line: 72, column: 1, scope: !195)
!258 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_44_good", scope: !74, file: !74, line: 309, type: !75, scopeLine: 310, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!259 = !DILocation(line: 311, column: 5, scope: !258)
!260 = !DILocation(line: 312, column: 5, scope: !258)
!261 = !DILocation(line: 313, column: 1, scope: !258)
!262 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 323, type: !263, scopeLine: 324, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!263 = !DISubroutineType(types: !264)
!264 = !{!65, !65, !265}
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !266, size: 64)
!266 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!267 = !DILocalVariable(name: "argc", arg: 1, scope: !262, file: !74, line: 323, type: !65)
!268 = !DILocation(line: 323, column: 14, scope: !262)
!269 = !DILocalVariable(name: "argv", arg: 2, scope: !262, file: !74, line: 323, type: !265)
!270 = !DILocation(line: 323, column: 27, scope: !262)
!271 = !DILocation(line: 326, column: 22, scope: !262)
!272 = !DILocation(line: 326, column: 12, scope: !262)
!273 = !DILocation(line: 326, column: 5, scope: !262)
!274 = !DILocation(line: 328, column: 5, scope: !262)
!275 = !DILocation(line: 329, column: 5, scope: !262)
!276 = !DILocation(line: 330, column: 5, scope: !262)
!277 = !DILocation(line: 333, column: 5, scope: !262)
!278 = !DILocation(line: 334, column: 5, scope: !262)
!279 = !DILocation(line: 335, column: 5, scope: !262)
!280 = !DILocation(line: 337, column: 5, scope: !262)
!281 = distinct !DISubprogram(name: "goodG2B", scope: !74, file: !74, line: 189, type: !75, scopeLine: 190, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!282 = !DILocalVariable(name: "data", scope: !281, file: !74, line: 191, type: !65)
!283 = !DILocation(line: 191, column: 9, scope: !281)
!284 = !DILocalVariable(name: "funcPtr", scope: !281, file: !74, line: 192, type: !81)
!285 = !DILocation(line: 192, column: 12, scope: !281)
!286 = !DILocation(line: 194, column: 10, scope: !281)
!287 = !DILocation(line: 197, column: 10, scope: !281)
!288 = !DILocation(line: 198, column: 5, scope: !281)
!289 = !DILocation(line: 198, column: 13, scope: !281)
!290 = !DILocation(line: 199, column: 1, scope: !281)
!291 = distinct !DISubprogram(name: "goodG2BSink", scope: !74, file: !74, line: 159, type: !82, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!292 = !DILocalVariable(name: "data", arg: 1, scope: !291, file: !74, line: 159, type: !65)
!293 = !DILocation(line: 159, column: 29, scope: !291)
!294 = !DILocalVariable(name: "i", scope: !295, file: !74, line: 162, type: !65)
!295 = distinct !DILexicalBlock(scope: !291, file: !74, line: 161, column: 5)
!296 = !DILocation(line: 162, column: 13, scope: !295)
!297 = !DILocalVariable(name: "buffer", scope: !295, file: !74, line: 163, type: !64)
!298 = !DILocation(line: 163, column: 15, scope: !295)
!299 = !DILocation(line: 163, column: 31, scope: !295)
!300 = !DILocation(line: 163, column: 24, scope: !295)
!301 = !DILocation(line: 164, column: 13, scope: !302)
!302 = distinct !DILexicalBlock(scope: !295, file: !74, line: 164, column: 13)
!303 = !DILocation(line: 164, column: 20, scope: !302)
!304 = !DILocation(line: 164, column: 13, scope: !295)
!305 = !DILocation(line: 164, column: 30, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !74, line: 164, column: 29)
!307 = !DILocation(line: 166, column: 16, scope: !308)
!308 = distinct !DILexicalBlock(scope: !295, file: !74, line: 166, column: 9)
!309 = !DILocation(line: 166, column: 14, scope: !308)
!310 = !DILocation(line: 166, column: 21, scope: !311)
!311 = distinct !DILexicalBlock(scope: !308, file: !74, line: 166, column: 9)
!312 = !DILocation(line: 166, column: 23, scope: !311)
!313 = !DILocation(line: 166, column: 9, scope: !308)
!314 = !DILocation(line: 168, column: 13, scope: !315)
!315 = distinct !DILexicalBlock(scope: !311, file: !74, line: 167, column: 9)
!316 = !DILocation(line: 168, column: 20, scope: !315)
!317 = !DILocation(line: 168, column: 23, scope: !315)
!318 = !DILocation(line: 169, column: 9, scope: !315)
!319 = !DILocation(line: 166, column: 30, scope: !311)
!320 = !DILocation(line: 166, column: 9, scope: !311)
!321 = distinct !{!321, !313, !322, !227}
!322 = !DILocation(line: 169, column: 9, scope: !308)
!323 = !DILocation(line: 172, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !295, file: !74, line: 172, column: 13)
!325 = !DILocation(line: 172, column: 18, scope: !324)
!326 = !DILocation(line: 172, column: 13, scope: !295)
!327 = !DILocation(line: 174, column: 13, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !74, line: 173, column: 9)
!329 = !DILocation(line: 174, column: 20, scope: !328)
!330 = !DILocation(line: 174, column: 26, scope: !328)
!331 = !DILocation(line: 176, column: 19, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !74, line: 176, column: 13)
!333 = !DILocation(line: 176, column: 17, scope: !332)
!334 = !DILocation(line: 176, column: 24, scope: !335)
!335 = distinct !DILexicalBlock(scope: !332, file: !74, line: 176, column: 13)
!336 = !DILocation(line: 176, column: 26, scope: !335)
!337 = !DILocation(line: 176, column: 13, scope: !332)
!338 = !DILocation(line: 178, column: 30, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !74, line: 177, column: 13)
!340 = !DILocation(line: 178, column: 37, scope: !339)
!341 = !DILocation(line: 178, column: 17, scope: !339)
!342 = !DILocation(line: 179, column: 13, scope: !339)
!343 = !DILocation(line: 176, column: 33, scope: !335)
!344 = !DILocation(line: 176, column: 13, scope: !335)
!345 = distinct !{!345, !337, !346, !227}
!346 = !DILocation(line: 179, column: 13, scope: !332)
!347 = !DILocation(line: 180, column: 9, scope: !328)
!348 = !DILocation(line: 183, column: 13, scope: !349)
!349 = distinct !DILexicalBlock(scope: !324, file: !74, line: 182, column: 9)
!350 = !DILocation(line: 185, column: 14, scope: !295)
!351 = !DILocation(line: 185, column: 9, scope: !295)
!352 = !DILocation(line: 187, column: 1, scope: !291)
!353 = distinct !DISubprogram(name: "goodB2G", scope: !74, file: !74, line: 231, type: !75, scopeLine: 232, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!354 = !DILocalVariable(name: "data", scope: !353, file: !74, line: 233, type: !65)
!355 = !DILocation(line: 233, column: 9, scope: !353)
!356 = !DILocalVariable(name: "funcPtr", scope: !353, file: !74, line: 234, type: !81)
!357 = !DILocation(line: 234, column: 12, scope: !353)
!358 = !DILocation(line: 236, column: 10, scope: !353)
!359 = !DILocalVariable(name: "recvResult", scope: !360, file: !74, line: 242, type: !65)
!360 = distinct !DILexicalBlock(scope: !353, file: !74, line: 237, column: 5)
!361 = !DILocation(line: 242, column: 13, scope: !360)
!362 = !DILocalVariable(name: "service", scope: !360, file: !74, line: 243, type: !90)
!363 = !DILocation(line: 243, column: 28, scope: !360)
!364 = !DILocalVariable(name: "listenSocket", scope: !360, file: !74, line: 244, type: !65)
!365 = !DILocation(line: 244, column: 16, scope: !360)
!366 = !DILocalVariable(name: "acceptSocket", scope: !360, file: !74, line: 245, type: !65)
!367 = !DILocation(line: 245, column: 16, scope: !360)
!368 = !DILocalVariable(name: "inputBuffer", scope: !360, file: !74, line: 246, type: !60)
!369 = !DILocation(line: 246, column: 14, scope: !360)
!370 = !DILocation(line: 247, column: 9, scope: !360)
!371 = !DILocation(line: 257, column: 28, scope: !372)
!372 = distinct !DILexicalBlock(scope: !360, file: !74, line: 248, column: 9)
!373 = !DILocation(line: 257, column: 26, scope: !372)
!374 = !DILocation(line: 258, column: 17, scope: !375)
!375 = distinct !DILexicalBlock(scope: !372, file: !74, line: 258, column: 17)
!376 = !DILocation(line: 258, column: 30, scope: !375)
!377 = !DILocation(line: 258, column: 17, scope: !372)
!378 = !DILocation(line: 260, column: 17, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !74, line: 259, column: 13)
!380 = !DILocation(line: 262, column: 13, scope: !372)
!381 = !DILocation(line: 263, column: 21, scope: !372)
!382 = !DILocation(line: 263, column: 32, scope: !372)
!383 = !DILocation(line: 264, column: 21, scope: !372)
!384 = !DILocation(line: 264, column: 30, scope: !372)
!385 = !DILocation(line: 264, column: 37, scope: !372)
!386 = !DILocation(line: 265, column: 32, scope: !372)
!387 = !DILocation(line: 265, column: 21, scope: !372)
!388 = !DILocation(line: 265, column: 30, scope: !372)
!389 = !DILocation(line: 266, column: 22, scope: !390)
!390 = distinct !DILexicalBlock(scope: !372, file: !74, line: 266, column: 17)
!391 = !DILocation(line: 266, column: 36, scope: !390)
!392 = !DILocation(line: 266, column: 17, scope: !390)
!393 = !DILocation(line: 266, column: 81, scope: !390)
!394 = !DILocation(line: 266, column: 17, scope: !372)
!395 = !DILocation(line: 268, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !390, file: !74, line: 267, column: 13)
!397 = !DILocation(line: 270, column: 24, scope: !398)
!398 = distinct !DILexicalBlock(scope: !372, file: !74, line: 270, column: 17)
!399 = !DILocation(line: 270, column: 17, scope: !398)
!400 = !DILocation(line: 270, column: 54, scope: !398)
!401 = !DILocation(line: 270, column: 17, scope: !372)
!402 = !DILocation(line: 272, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !398, file: !74, line: 271, column: 13)
!404 = !DILocation(line: 274, column: 35, scope: !372)
!405 = !DILocation(line: 274, column: 28, scope: !372)
!406 = !DILocation(line: 274, column: 26, scope: !372)
!407 = !DILocation(line: 275, column: 17, scope: !408)
!408 = distinct !DILexicalBlock(scope: !372, file: !74, line: 275, column: 17)
!409 = !DILocation(line: 275, column: 30, scope: !408)
!410 = !DILocation(line: 275, column: 17, scope: !372)
!411 = !DILocation(line: 277, column: 17, scope: !412)
!412 = distinct !DILexicalBlock(scope: !408, file: !74, line: 276, column: 13)
!413 = !DILocation(line: 280, column: 31, scope: !372)
!414 = !DILocation(line: 280, column: 45, scope: !372)
!415 = !DILocation(line: 280, column: 26, scope: !372)
!416 = !DILocation(line: 280, column: 24, scope: !372)
!417 = !DILocation(line: 281, column: 17, scope: !418)
!418 = distinct !DILexicalBlock(scope: !372, file: !74, line: 281, column: 17)
!419 = !DILocation(line: 281, column: 28, scope: !418)
!420 = !DILocation(line: 281, column: 44, scope: !418)
!421 = !DILocation(line: 281, column: 47, scope: !418)
!422 = !DILocation(line: 281, column: 58, scope: !418)
!423 = !DILocation(line: 281, column: 17, scope: !372)
!424 = !DILocation(line: 283, column: 17, scope: !425)
!425 = distinct !DILexicalBlock(scope: !418, file: !74, line: 282, column: 13)
!426 = !DILocation(line: 286, column: 25, scope: !372)
!427 = !DILocation(line: 286, column: 13, scope: !372)
!428 = !DILocation(line: 286, column: 37, scope: !372)
!429 = !DILocation(line: 288, column: 25, scope: !372)
!430 = !DILocation(line: 288, column: 20, scope: !372)
!431 = !DILocation(line: 288, column: 18, scope: !372)
!432 = !DILocation(line: 289, column: 9, scope: !372)
!433 = !DILocation(line: 291, column: 13, scope: !434)
!434 = distinct !DILexicalBlock(scope: !360, file: !74, line: 291, column: 13)
!435 = !DILocation(line: 291, column: 26, scope: !434)
!436 = !DILocation(line: 291, column: 13, scope: !360)
!437 = !DILocation(line: 293, column: 26, scope: !438)
!438 = distinct !DILexicalBlock(scope: !434, file: !74, line: 292, column: 9)
!439 = !DILocation(line: 293, column: 13, scope: !438)
!440 = !DILocation(line: 294, column: 9, scope: !438)
!441 = !DILocation(line: 295, column: 13, scope: !442)
!442 = distinct !DILexicalBlock(scope: !360, file: !74, line: 295, column: 13)
!443 = !DILocation(line: 295, column: 26, scope: !442)
!444 = !DILocation(line: 295, column: 13, scope: !360)
!445 = !DILocation(line: 297, column: 26, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !74, line: 296, column: 9)
!447 = !DILocation(line: 297, column: 13, scope: !446)
!448 = !DILocation(line: 298, column: 9, scope: !446)
!449 = !DILocation(line: 306, column: 5, scope: !353)
!450 = !DILocation(line: 306, column: 13, scope: !353)
!451 = !DILocation(line: 307, column: 1, scope: !353)
!452 = distinct !DISubprogram(name: "goodB2GSink", scope: !74, file: !74, line: 202, type: !82, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!453 = !DILocalVariable(name: "data", arg: 1, scope: !452, file: !74, line: 202, type: !65)
!454 = !DILocation(line: 202, column: 29, scope: !452)
!455 = !DILocalVariable(name: "i", scope: !456, file: !74, line: 205, type: !65)
!456 = distinct !DILexicalBlock(scope: !452, file: !74, line: 204, column: 5)
!457 = !DILocation(line: 205, column: 13, scope: !456)
!458 = !DILocalVariable(name: "buffer", scope: !456, file: !74, line: 206, type: !64)
!459 = !DILocation(line: 206, column: 15, scope: !456)
!460 = !DILocation(line: 206, column: 31, scope: !456)
!461 = !DILocation(line: 206, column: 24, scope: !456)
!462 = !DILocation(line: 207, column: 13, scope: !463)
!463 = distinct !DILexicalBlock(scope: !456, file: !74, line: 207, column: 13)
!464 = !DILocation(line: 207, column: 20, scope: !463)
!465 = !DILocation(line: 207, column: 13, scope: !456)
!466 = !DILocation(line: 207, column: 30, scope: !467)
!467 = distinct !DILexicalBlock(scope: !463, file: !74, line: 207, column: 29)
!468 = !DILocation(line: 209, column: 16, scope: !469)
!469 = distinct !DILexicalBlock(scope: !456, file: !74, line: 209, column: 9)
!470 = !DILocation(line: 209, column: 14, scope: !469)
!471 = !DILocation(line: 209, column: 21, scope: !472)
!472 = distinct !DILexicalBlock(scope: !469, file: !74, line: 209, column: 9)
!473 = !DILocation(line: 209, column: 23, scope: !472)
!474 = !DILocation(line: 209, column: 9, scope: !469)
!475 = !DILocation(line: 211, column: 13, scope: !476)
!476 = distinct !DILexicalBlock(scope: !472, file: !74, line: 210, column: 9)
!477 = !DILocation(line: 211, column: 20, scope: !476)
!478 = !DILocation(line: 211, column: 23, scope: !476)
!479 = !DILocation(line: 212, column: 9, scope: !476)
!480 = !DILocation(line: 209, column: 30, scope: !472)
!481 = !DILocation(line: 209, column: 9, scope: !472)
!482 = distinct !{!482, !474, !483, !227}
!483 = !DILocation(line: 212, column: 9, scope: !469)
!484 = !DILocation(line: 214, column: 13, scope: !485)
!485 = distinct !DILexicalBlock(scope: !456, file: !74, line: 214, column: 13)
!486 = !DILocation(line: 214, column: 18, scope: !485)
!487 = !DILocation(line: 214, column: 23, scope: !485)
!488 = !DILocation(line: 214, column: 26, scope: !485)
!489 = !DILocation(line: 214, column: 31, scope: !485)
!490 = !DILocation(line: 214, column: 13, scope: !456)
!491 = !DILocation(line: 216, column: 13, scope: !492)
!492 = distinct !DILexicalBlock(scope: !485, file: !74, line: 215, column: 9)
!493 = !DILocation(line: 216, column: 20, scope: !492)
!494 = !DILocation(line: 216, column: 26, scope: !492)
!495 = !DILocation(line: 218, column: 19, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !74, line: 218, column: 13)
!497 = !DILocation(line: 218, column: 17, scope: !496)
!498 = !DILocation(line: 218, column: 24, scope: !499)
!499 = distinct !DILexicalBlock(scope: !496, file: !74, line: 218, column: 13)
!500 = !DILocation(line: 218, column: 26, scope: !499)
!501 = !DILocation(line: 218, column: 13, scope: !496)
!502 = !DILocation(line: 220, column: 30, scope: !503)
!503 = distinct !DILexicalBlock(scope: !499, file: !74, line: 219, column: 13)
!504 = !DILocation(line: 220, column: 37, scope: !503)
!505 = !DILocation(line: 220, column: 17, scope: !503)
!506 = !DILocation(line: 221, column: 13, scope: !503)
!507 = !DILocation(line: 218, column: 33, scope: !499)
!508 = !DILocation(line: 218, column: 13, scope: !499)
!509 = distinct !{!509, !501, !510, !227}
!510 = !DILocation(line: 221, column: 13, scope: !496)
!511 = !DILocation(line: 222, column: 9, scope: !492)
!512 = !DILocation(line: 225, column: 13, scope: !513)
!513 = distinct !DILexicalBlock(scope: !485, file: !74, line: 224, column: 9)
!514 = !DILocation(line: 227, column: 14, scope: !456)
!515 = !DILocation(line: 227, column: 9, scope: !456)
!516 = !DILocation(line: 229, column: 1, scope: !452)
