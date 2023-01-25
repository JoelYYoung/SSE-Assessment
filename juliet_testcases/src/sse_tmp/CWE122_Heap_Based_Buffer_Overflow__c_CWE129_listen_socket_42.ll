; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_42.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_42_bad() #0 !dbg !73 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  %0 = load i32, i32* %data, align 4, !dbg !81
  %call = call i32 @badSource(i32 %0), !dbg !82
  store i32 %call, i32* %data, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata i32* %i, metadata !84, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !87, metadata !DIExpression()), !dbg !88
  %call1 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !89
  %1 = bitcast i8* %call1 to i32*, !dbg !90
  store i32* %1, i32** %buffer, align 8, !dbg !88
  %2 = load i32*, i32** %buffer, align 8, !dbg !91
  %cmp = icmp eq i32* %2, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !100
  %cmp2 = icmp slt i32 %3, 10, !dbg !102
  br i1 %cmp2, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !104
  %5 = load i32, i32* %i, align 4, !dbg !106
  %idxprom = sext i32 %5 to i64, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !109
  %inc = add nsw i32 %6, 1, !dbg !109
  store i32 %inc, i32* %i, align 4, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !114
  %cmp3 = icmp sge i32 %7, 0, !dbg !116
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !117

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !118
  %9 = load i32, i32* %data, align 4, !dbg !120
  %idxprom5 = sext i32 %9 to i64, !dbg !118
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !118
  store i32 1, i32* %arrayidx6, align 4, !dbg !121
  store i32 0, i32* %i, align 4, !dbg !122
  br label %for.cond7, !dbg !124

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !125
  %cmp8 = icmp slt i32 %10, 10, !dbg !127
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !128

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !129
  %12 = load i32, i32* %i, align 4, !dbg !131
  %idxprom10 = sext i32 %12 to i64, !dbg !129
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !129
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !129
  call void @printIntLine(i32 %13), !dbg !132
  br label %for.inc12, !dbg !133

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !134
  %inc13 = add nsw i32 %14, 1, !dbg !134
  store i32 %inc13, i32* %i, align 4, !dbg !134
  br label %for.cond7, !dbg !135, !llvm.loop !136

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !138

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !139
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !141
  %16 = bitcast i32* %15 to i8*, !dbg !141
  call void @free(i8* %16) #8, !dbg !142
  ret void, !dbg !143
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !144 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !149, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !152, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !170, metadata !DIExpression()), !dbg !171
  store i32 -1, i32* %listenSocket, align 4, !dbg !171
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !172, metadata !DIExpression()), !dbg !173
  store i32 -1, i32* %acceptSocket, align 4, !dbg !173
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !174, metadata !DIExpression()), !dbg !175
  br label %do.body, !dbg !176

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !177
  store i32 %call, i32* %listenSocket, align 4, !dbg !179
  %0 = load i32, i32* %listenSocket, align 4, !dbg !180
  %cmp = icmp eq i32 %0, -1, !dbg !182
  br i1 %cmp, label %if.then, label %if.end, !dbg !183

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !184

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !186
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !186
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !187
  store i16 2, i16* %sin_family, align 4, !dbg !188
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !189
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !190
  store i32 0, i32* %s_addr, align 4, !dbg !191
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #10, !dbg !192
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !193
  store i16 %call1, i16* %sin_port, align 2, !dbg !194
  %2 = load i32, i32* %listenSocket, align 4, !dbg !195
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !197
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !198
  %cmp3 = icmp eq i32 %call2, -1, !dbg !199
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !200

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !201

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !203
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !205
  %cmp7 = icmp eq i32 %call6, -1, !dbg !206
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !207

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !208

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !210
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !211
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !212
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !213
  %cmp11 = icmp eq i32 %6, -1, !dbg !215
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !216

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !217

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !219
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !220
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !221
  %conv = trunc i64 %call14 to i32, !dbg !221
  store i32 %conv, i32* %recvResult, align 4, !dbg !222
  %8 = load i32, i32* %recvResult, align 4, !dbg !223
  %cmp15 = icmp eq i32 %8, -1, !dbg !225
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !226

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !227
  %cmp17 = icmp eq i32 %9, 0, !dbg !228
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !229

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !230

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !232
  %idxprom = sext i32 %10 to i64, !dbg !233
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !233
  store i8 0, i8* %arrayidx, align 1, !dbg !234
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !235
  %call22 = call i32 @atoi(i8* %arraydecay21) #11, !dbg !236
  store i32 %call22, i32* %data.addr, align 4, !dbg !237
  br label %do.end, !dbg !238

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !239
  %cmp23 = icmp ne i32 %11, -1, !dbg !241
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !242

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !243
  %call26 = call i32 @close(i32 %12), !dbg !245
  br label %if.end27, !dbg !246

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !247
  %cmp28 = icmp ne i32 %13, -1, !dbg !249
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !250

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !251
  %call31 = call i32 @close(i32 %14), !dbg !253
  br label %if.end32, !dbg !254

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data.addr, align 4, !dbg !255
  ret i32 %15, !dbg !256
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_42_good() #0 !dbg !257 {
entry:
  call void @goodB2G(), !dbg !258
  call void @goodG2B(), !dbg !259
  ret void, !dbg !260
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !261 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !266, metadata !DIExpression()), !dbg !267
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !268, metadata !DIExpression()), !dbg !269
  %call = call i64 @time(i64* null) #8, !dbg !270
  %conv = trunc i64 %call to i32, !dbg !271
  call void @srand(i32 %conv) #8, !dbg !272
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !273
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_42_good(), !dbg !274
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !275
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !276
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_42_bad(), !dbg !277
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !278
  ret i32 0, !dbg !279
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #6

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #2

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #2

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #4

declare dso_local i64 @recv(i32, i8*, i64, i32) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #7

declare dso_local i32 @close(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !280 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !281, metadata !DIExpression()), !dbg !282
  store i32 -1, i32* %data, align 4, !dbg !283
  %0 = load i32, i32* %data, align 4, !dbg !284
  %call = call i32 @goodB2GSource(i32 %0), !dbg !285
  store i32 %call, i32* %data, align 4, !dbg !286
  call void @llvm.dbg.declare(metadata i32* %i, metadata !287, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !290, metadata !DIExpression()), !dbg !291
  %call1 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !292
  %1 = bitcast i8* %call1 to i32*, !dbg !293
  store i32* %1, i32** %buffer, align 8, !dbg !291
  %2 = load i32*, i32** %buffer, align 8, !dbg !294
  %cmp = icmp eq i32* %2, null, !dbg !296
  br i1 %cmp, label %if.then, label %if.end, !dbg !297

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !298
  unreachable, !dbg !298

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !300
  br label %for.cond, !dbg !302

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !303
  %cmp2 = icmp slt i32 %3, 10, !dbg !305
  br i1 %cmp2, label %for.body, label %for.end, !dbg !306

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !307
  %5 = load i32, i32* %i, align 4, !dbg !309
  %idxprom = sext i32 %5 to i64, !dbg !307
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !307
  store i32 0, i32* %arrayidx, align 4, !dbg !310
  br label %for.inc, !dbg !311

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !312
  %inc = add nsw i32 %6, 1, !dbg !312
  store i32 %inc, i32* %i, align 4, !dbg !312
  br label %for.cond, !dbg !313, !llvm.loop !314

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !316
  %cmp3 = icmp sge i32 %7, 0, !dbg !318
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !319

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !320
  %cmp4 = icmp slt i32 %8, 10, !dbg !321
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !322

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !323
  %10 = load i32, i32* %data, align 4, !dbg !325
  %idxprom6 = sext i32 %10 to i64, !dbg !323
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !323
  store i32 1, i32* %arrayidx7, align 4, !dbg !326
  store i32 0, i32* %i, align 4, !dbg !327
  br label %for.cond8, !dbg !329

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !330
  %cmp9 = icmp slt i32 %11, 10, !dbg !332
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !333

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !334
  %13 = load i32, i32* %i, align 4, !dbg !336
  %idxprom11 = sext i32 %13 to i64, !dbg !334
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !334
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !334
  call void @printIntLine(i32 %14), !dbg !337
  br label %for.inc13, !dbg !338

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !339
  %inc14 = add nsw i32 %15, 1, !dbg !339
  store i32 %inc14, i32* %i, align 4, !dbg !339
  br label %for.cond8, !dbg !340, !llvm.loop !341

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !343

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !344
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !346
  %17 = bitcast i32* %16 to i8*, !dbg !346
  call void @free(i8* %17) #8, !dbg !347
  ret void, !dbg !348
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !349 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !350, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !352, metadata !DIExpression()), !dbg !354
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !355, metadata !DIExpression()), !dbg !356
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !357, metadata !DIExpression()), !dbg !358
  store i32 -1, i32* %listenSocket, align 4, !dbg !358
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !359, metadata !DIExpression()), !dbg !360
  store i32 -1, i32* %acceptSocket, align 4, !dbg !360
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !361, metadata !DIExpression()), !dbg !362
  br label %do.body, !dbg !363

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !364
  store i32 %call, i32* %listenSocket, align 4, !dbg !366
  %0 = load i32, i32* %listenSocket, align 4, !dbg !367
  %cmp = icmp eq i32 %0, -1, !dbg !369
  br i1 %cmp, label %if.then, label %if.end, !dbg !370

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !371

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !373
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !373
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !374
  store i16 2, i16* %sin_family, align 4, !dbg !375
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !376
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !377
  store i32 0, i32* %s_addr, align 4, !dbg !378
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #10, !dbg !379
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !380
  store i16 %call1, i16* %sin_port, align 2, !dbg !381
  %2 = load i32, i32* %listenSocket, align 4, !dbg !382
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !384
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !385
  %cmp3 = icmp eq i32 %call2, -1, !dbg !386
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !387

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !388

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !390
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !392
  %cmp7 = icmp eq i32 %call6, -1, !dbg !393
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !394

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !395

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !397
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !398
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !399
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !400
  %cmp11 = icmp eq i32 %6, -1, !dbg !402
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !403

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !404

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !406
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !407
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !408
  %conv = trunc i64 %call14 to i32, !dbg !408
  store i32 %conv, i32* %recvResult, align 4, !dbg !409
  %8 = load i32, i32* %recvResult, align 4, !dbg !410
  %cmp15 = icmp eq i32 %8, -1, !dbg !412
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !413

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !414
  %cmp17 = icmp eq i32 %9, 0, !dbg !415
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !416

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !417

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !419
  %idxprom = sext i32 %10 to i64, !dbg !420
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !420
  store i8 0, i8* %arrayidx, align 1, !dbg !421
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !422
  %call22 = call i32 @atoi(i8* %arraydecay21) #11, !dbg !423
  store i32 %call22, i32* %data.addr, align 4, !dbg !424
  br label %do.end, !dbg !425

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !426
  %cmp23 = icmp ne i32 %11, -1, !dbg !428
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !429

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !430
  %call26 = call i32 @close(i32 %12), !dbg !432
  br label %if.end27, !dbg !433

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !434
  %cmp28 = icmp ne i32 %13, -1, !dbg !436
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !437

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !438
  %call31 = call i32 @close(i32 %14), !dbg !440
  br label %if.end32, !dbg !441

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data.addr, align 4, !dbg !442
  ret i32 %15, !dbg !443
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !444 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !445, metadata !DIExpression()), !dbg !446
  store i32 -1, i32* %data, align 4, !dbg !447
  %0 = load i32, i32* %data, align 4, !dbg !448
  %call = call i32 @goodG2BSource(i32 %0), !dbg !449
  store i32 %call, i32* %data, align 4, !dbg !450
  call void @llvm.dbg.declare(metadata i32* %i, metadata !451, metadata !DIExpression()), !dbg !453
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !454, metadata !DIExpression()), !dbg !455
  %call1 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !456
  %1 = bitcast i8* %call1 to i32*, !dbg !457
  store i32* %1, i32** %buffer, align 8, !dbg !455
  %2 = load i32*, i32** %buffer, align 8, !dbg !458
  %cmp = icmp eq i32* %2, null, !dbg !460
  br i1 %cmp, label %if.then, label %if.end, !dbg !461

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !462
  unreachable, !dbg !462

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !464
  br label %for.cond, !dbg !466

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !467
  %cmp2 = icmp slt i32 %3, 10, !dbg !469
  br i1 %cmp2, label %for.body, label %for.end, !dbg !470

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !471
  %5 = load i32, i32* %i, align 4, !dbg !473
  %idxprom = sext i32 %5 to i64, !dbg !471
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !471
  store i32 0, i32* %arrayidx, align 4, !dbg !474
  br label %for.inc, !dbg !475

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !476
  %inc = add nsw i32 %6, 1, !dbg !476
  store i32 %inc, i32* %i, align 4, !dbg !476
  br label %for.cond, !dbg !477, !llvm.loop !478

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !480
  %cmp3 = icmp sge i32 %7, 0, !dbg !482
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !483

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !484
  %9 = load i32, i32* %data, align 4, !dbg !486
  %idxprom5 = sext i32 %9 to i64, !dbg !484
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !484
  store i32 1, i32* %arrayidx6, align 4, !dbg !487
  store i32 0, i32* %i, align 4, !dbg !488
  br label %for.cond7, !dbg !490

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !491
  %cmp8 = icmp slt i32 %10, 10, !dbg !493
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !494

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !495
  %12 = load i32, i32* %i, align 4, !dbg !497
  %idxprom10 = sext i32 %12 to i64, !dbg !495
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !495
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !495
  call void @printIntLine(i32 %13), !dbg !498
  br label %for.inc12, !dbg !499

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !500
  %inc13 = add nsw i32 %14, 1, !dbg !500
  store i32 %inc13, i32* %i, align 4, !dbg !500
  br label %for.cond7, !dbg !501, !llvm.loop !502

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !504

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !505
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !507
  %16 = bitcast i32* %15 to i8*, !dbg !507
  call void @free(i8* %16) #8, !dbg !508
  ret void, !dbg !509
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !510 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !511, metadata !DIExpression()), !dbg !512
  store i32 7, i32* %data.addr, align 4, !dbg !513
  %0 = load i32, i32* %data.addr, align 4, !dbg !514
  ret i32 %0, !dbg !515
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readnone willreturn }
attributes #11 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!67, !68, !69, !70, !71}
!llvm.ident = !{!72}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !48, !5, !49, !54}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !51, line: 26, baseType: !52)
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !53, line: 42, baseType: !5)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !56, line: 178, size: 128, elements: !57)
!56 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!57 = !{!58, !62}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !55, file: !56, line: 180, baseType: !59, size: 16)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !60, line: 28, baseType: !61)
!60 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!61 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !55, file: !56, line: 181, baseType: !63, size: 112, offset: 16)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 112, elements: !65)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !{!66}
!66 = !DISubrange(count: 14)
!67 = !{i32 7, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 3}
!69 = !{i32 1, !"wchar_size", i32 4}
!70 = !{i32 7, !"uwtable", i32 1}
!71 = !{i32 7, !"frame-pointer", i32 2}
!72 = !{!"clang version 13.0.0"}
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_42_bad", scope: !74, file: !74, line: 118, type: !75, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_42.c", directory: "/home/joelyang/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 120, type: !47)
!79 = !DILocation(line: 120, column: 9, scope: !73)
!80 = !DILocation(line: 122, column: 10, scope: !73)
!81 = !DILocation(line: 123, column: 22, scope: !73)
!82 = !DILocation(line: 123, column: 12, scope: !73)
!83 = !DILocation(line: 123, column: 10, scope: !73)
!84 = !DILocalVariable(name: "i", scope: !85, file: !74, line: 125, type: !47)
!85 = distinct !DILexicalBlock(scope: !73, file: !74, line: 124, column: 5)
!86 = !DILocation(line: 125, column: 13, scope: !85)
!87 = !DILocalVariable(name: "buffer", scope: !85, file: !74, line: 126, type: !46)
!88 = !DILocation(line: 126, column: 15, scope: !85)
!89 = !DILocation(line: 126, column: 31, scope: !85)
!90 = !DILocation(line: 126, column: 24, scope: !85)
!91 = !DILocation(line: 127, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !74, line: 127, column: 13)
!93 = !DILocation(line: 127, column: 20, scope: !92)
!94 = !DILocation(line: 127, column: 13, scope: !85)
!95 = !DILocation(line: 127, column: 30, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !74, line: 127, column: 29)
!97 = !DILocation(line: 129, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !85, file: !74, line: 129, column: 9)
!99 = !DILocation(line: 129, column: 14, scope: !98)
!100 = !DILocation(line: 129, column: 21, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !74, line: 129, column: 9)
!102 = !DILocation(line: 129, column: 23, scope: !101)
!103 = !DILocation(line: 129, column: 9, scope: !98)
!104 = !DILocation(line: 131, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !74, line: 130, column: 9)
!106 = !DILocation(line: 131, column: 20, scope: !105)
!107 = !DILocation(line: 131, column: 23, scope: !105)
!108 = !DILocation(line: 132, column: 9, scope: !105)
!109 = !DILocation(line: 129, column: 30, scope: !101)
!110 = !DILocation(line: 129, column: 9, scope: !101)
!111 = distinct !{!111, !103, !112, !113}
!112 = !DILocation(line: 132, column: 9, scope: !98)
!113 = !{!"llvm.loop.mustprogress"}
!114 = !DILocation(line: 135, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !85, file: !74, line: 135, column: 13)
!116 = !DILocation(line: 135, column: 18, scope: !115)
!117 = !DILocation(line: 135, column: 13, scope: !85)
!118 = !DILocation(line: 137, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !74, line: 136, column: 9)
!120 = !DILocation(line: 137, column: 20, scope: !119)
!121 = !DILocation(line: 137, column: 26, scope: !119)
!122 = !DILocation(line: 139, column: 19, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !74, line: 139, column: 13)
!124 = !DILocation(line: 139, column: 17, scope: !123)
!125 = !DILocation(line: 139, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !74, line: 139, column: 13)
!127 = !DILocation(line: 139, column: 26, scope: !126)
!128 = !DILocation(line: 139, column: 13, scope: !123)
!129 = !DILocation(line: 141, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !74, line: 140, column: 13)
!131 = !DILocation(line: 141, column: 37, scope: !130)
!132 = !DILocation(line: 141, column: 17, scope: !130)
!133 = !DILocation(line: 142, column: 13, scope: !130)
!134 = !DILocation(line: 139, column: 33, scope: !126)
!135 = !DILocation(line: 139, column: 13, scope: !126)
!136 = distinct !{!136, !128, !137, !113}
!137 = !DILocation(line: 142, column: 13, scope: !123)
!138 = !DILocation(line: 143, column: 9, scope: !119)
!139 = !DILocation(line: 146, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !115, file: !74, line: 145, column: 9)
!141 = !DILocation(line: 148, column: 14, scope: !85)
!142 = !DILocation(line: 148, column: 9, scope: !85)
!143 = !DILocation(line: 150, column: 1, scope: !73)
!144 = distinct !DISubprogram(name: "badSource", scope: !74, file: !74, line: 44, type: !145, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!145 = !DISubroutineType(types: !146)
!146 = !{!47, !47}
!147 = !DILocalVariable(name: "data", arg: 1, scope: !144, file: !74, line: 44, type: !47)
!148 = !DILocation(line: 44, column: 26, scope: !144)
!149 = !DILocalVariable(name: "recvResult", scope: !150, file: !74, line: 51, type: !47)
!150 = distinct !DILexicalBlock(scope: !144, file: !74, line: 46, column: 5)
!151 = !DILocation(line: 51, column: 13, scope: !150)
!152 = !DILocalVariable(name: "service", scope: !150, file: !74, line: 52, type: !153)
!153 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !154)
!154 = !{!155, !156, !160, !164}
!155 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !153, file: !17, line: 240, baseType: !59, size: 16)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !153, file: !17, line: 241, baseType: !157, size: 16, offset: 16)
!157 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !158)
!158 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !51, line: 25, baseType: !159)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !53, line: 40, baseType: !61)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !153, file: !17, line: 242, baseType: !161, size: 32, offset: 32)
!161 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !162)
!162 = !{!163}
!163 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !161, file: !17, line: 33, baseType: !49, size: 32)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !153, file: !17, line: 245, baseType: !165, size: 64, offset: 64)
!165 = !DICompositeType(tag: DW_TAG_array_type, baseType: !166, size: 64, elements: !167)
!166 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!167 = !{!168}
!168 = !DISubrange(count: 8)
!169 = !DILocation(line: 52, column: 28, scope: !150)
!170 = !DILocalVariable(name: "listenSocket", scope: !150, file: !74, line: 53, type: !47)
!171 = !DILocation(line: 53, column: 16, scope: !150)
!172 = !DILocalVariable(name: "acceptSocket", scope: !150, file: !74, line: 54, type: !47)
!173 = !DILocation(line: 54, column: 16, scope: !150)
!174 = !DILocalVariable(name: "inputBuffer", scope: !150, file: !74, line: 55, type: !63)
!175 = !DILocation(line: 55, column: 14, scope: !150)
!176 = !DILocation(line: 56, column: 9, scope: !150)
!177 = !DILocation(line: 66, column: 28, scope: !178)
!178 = distinct !DILexicalBlock(scope: !150, file: !74, line: 57, column: 9)
!179 = !DILocation(line: 66, column: 26, scope: !178)
!180 = !DILocation(line: 67, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !74, line: 67, column: 17)
!182 = !DILocation(line: 67, column: 30, scope: !181)
!183 = !DILocation(line: 67, column: 17, scope: !178)
!184 = !DILocation(line: 69, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !74, line: 68, column: 13)
!186 = !DILocation(line: 71, column: 13, scope: !178)
!187 = !DILocation(line: 72, column: 21, scope: !178)
!188 = !DILocation(line: 72, column: 32, scope: !178)
!189 = !DILocation(line: 73, column: 21, scope: !178)
!190 = !DILocation(line: 73, column: 30, scope: !178)
!191 = !DILocation(line: 73, column: 37, scope: !178)
!192 = !DILocation(line: 74, column: 32, scope: !178)
!193 = !DILocation(line: 74, column: 21, scope: !178)
!194 = !DILocation(line: 74, column: 30, scope: !178)
!195 = !DILocation(line: 75, column: 22, scope: !196)
!196 = distinct !DILexicalBlock(scope: !178, file: !74, line: 75, column: 17)
!197 = !DILocation(line: 75, column: 36, scope: !196)
!198 = !DILocation(line: 75, column: 17, scope: !196)
!199 = !DILocation(line: 75, column: 81, scope: !196)
!200 = !DILocation(line: 75, column: 17, scope: !178)
!201 = !DILocation(line: 77, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !196, file: !74, line: 76, column: 13)
!203 = !DILocation(line: 79, column: 24, scope: !204)
!204 = distinct !DILexicalBlock(scope: !178, file: !74, line: 79, column: 17)
!205 = !DILocation(line: 79, column: 17, scope: !204)
!206 = !DILocation(line: 79, column: 54, scope: !204)
!207 = !DILocation(line: 79, column: 17, scope: !178)
!208 = !DILocation(line: 81, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !74, line: 80, column: 13)
!210 = !DILocation(line: 83, column: 35, scope: !178)
!211 = !DILocation(line: 83, column: 28, scope: !178)
!212 = !DILocation(line: 83, column: 26, scope: !178)
!213 = !DILocation(line: 84, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !178, file: !74, line: 84, column: 17)
!215 = !DILocation(line: 84, column: 30, scope: !214)
!216 = !DILocation(line: 84, column: 17, scope: !178)
!217 = !DILocation(line: 86, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !74, line: 85, column: 13)
!219 = !DILocation(line: 89, column: 31, scope: !178)
!220 = !DILocation(line: 89, column: 45, scope: !178)
!221 = !DILocation(line: 89, column: 26, scope: !178)
!222 = !DILocation(line: 89, column: 24, scope: !178)
!223 = !DILocation(line: 90, column: 17, scope: !224)
!224 = distinct !DILexicalBlock(scope: !178, file: !74, line: 90, column: 17)
!225 = !DILocation(line: 90, column: 28, scope: !224)
!226 = !DILocation(line: 90, column: 44, scope: !224)
!227 = !DILocation(line: 90, column: 47, scope: !224)
!228 = !DILocation(line: 90, column: 58, scope: !224)
!229 = !DILocation(line: 90, column: 17, scope: !178)
!230 = !DILocation(line: 92, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !224, file: !74, line: 91, column: 13)
!232 = !DILocation(line: 95, column: 25, scope: !178)
!233 = !DILocation(line: 95, column: 13, scope: !178)
!234 = !DILocation(line: 95, column: 37, scope: !178)
!235 = !DILocation(line: 97, column: 25, scope: !178)
!236 = !DILocation(line: 97, column: 20, scope: !178)
!237 = !DILocation(line: 97, column: 18, scope: !178)
!238 = !DILocation(line: 98, column: 9, scope: !178)
!239 = !DILocation(line: 100, column: 13, scope: !240)
!240 = distinct !DILexicalBlock(scope: !150, file: !74, line: 100, column: 13)
!241 = !DILocation(line: 100, column: 26, scope: !240)
!242 = !DILocation(line: 100, column: 13, scope: !150)
!243 = !DILocation(line: 102, column: 26, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !74, line: 101, column: 9)
!245 = !DILocation(line: 102, column: 13, scope: !244)
!246 = !DILocation(line: 103, column: 9, scope: !244)
!247 = !DILocation(line: 104, column: 13, scope: !248)
!248 = distinct !DILexicalBlock(scope: !150, file: !74, line: 104, column: 13)
!249 = !DILocation(line: 104, column: 26, scope: !248)
!250 = !DILocation(line: 104, column: 13, scope: !150)
!251 = !DILocation(line: 106, column: 26, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !74, line: 105, column: 9)
!253 = !DILocation(line: 106, column: 13, scope: !252)
!254 = !DILocation(line: 107, column: 9, scope: !252)
!255 = !DILocation(line: 115, column: 12, scope: !144)
!256 = !DILocation(line: 115, column: 5, scope: !144)
!257 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_42_good", scope: !74, file: !74, line: 307, type: !75, scopeLine: 308, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!258 = !DILocation(line: 309, column: 5, scope: !257)
!259 = !DILocation(line: 310, column: 5, scope: !257)
!260 = !DILocation(line: 311, column: 1, scope: !257)
!261 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 322, type: !262, scopeLine: 323, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!262 = !DISubroutineType(types: !263)
!263 = !{!47, !47, !264}
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !265, size: 64)
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!266 = !DILocalVariable(name: "argc", arg: 1, scope: !261, file: !74, line: 322, type: !47)
!267 = !DILocation(line: 322, column: 14, scope: !261)
!268 = !DILocalVariable(name: "argv", arg: 2, scope: !261, file: !74, line: 322, type: !264)
!269 = !DILocation(line: 322, column: 27, scope: !261)
!270 = !DILocation(line: 325, column: 22, scope: !261)
!271 = !DILocation(line: 325, column: 12, scope: !261)
!272 = !DILocation(line: 325, column: 5, scope: !261)
!273 = !DILocation(line: 327, column: 5, scope: !261)
!274 = !DILocation(line: 328, column: 5, scope: !261)
!275 = !DILocation(line: 329, column: 5, scope: !261)
!276 = !DILocation(line: 332, column: 5, scope: !261)
!277 = !DILocation(line: 333, column: 5, scope: !261)
!278 = !DILocation(line: 334, column: 5, scope: !261)
!279 = !DILocation(line: 336, column: 5, scope: !261)
!280 = distinct !DISubprogram(name: "goodB2G", scope: !74, file: !74, line: 274, type: !75, scopeLine: 275, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!281 = !DILocalVariable(name: "data", scope: !280, file: !74, line: 276, type: !47)
!282 = !DILocation(line: 276, column: 9, scope: !280)
!283 = !DILocation(line: 278, column: 10, scope: !280)
!284 = !DILocation(line: 279, column: 26, scope: !280)
!285 = !DILocation(line: 279, column: 12, scope: !280)
!286 = !DILocation(line: 279, column: 10, scope: !280)
!287 = !DILocalVariable(name: "i", scope: !288, file: !74, line: 281, type: !47)
!288 = distinct !DILexicalBlock(scope: !280, file: !74, line: 280, column: 5)
!289 = !DILocation(line: 281, column: 13, scope: !288)
!290 = !DILocalVariable(name: "buffer", scope: !288, file: !74, line: 282, type: !46)
!291 = !DILocation(line: 282, column: 15, scope: !288)
!292 = !DILocation(line: 282, column: 31, scope: !288)
!293 = !DILocation(line: 282, column: 24, scope: !288)
!294 = !DILocation(line: 283, column: 13, scope: !295)
!295 = distinct !DILexicalBlock(scope: !288, file: !74, line: 283, column: 13)
!296 = !DILocation(line: 283, column: 20, scope: !295)
!297 = !DILocation(line: 283, column: 13, scope: !288)
!298 = !DILocation(line: 283, column: 30, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !74, line: 283, column: 29)
!300 = !DILocation(line: 285, column: 16, scope: !301)
!301 = distinct !DILexicalBlock(scope: !288, file: !74, line: 285, column: 9)
!302 = !DILocation(line: 285, column: 14, scope: !301)
!303 = !DILocation(line: 285, column: 21, scope: !304)
!304 = distinct !DILexicalBlock(scope: !301, file: !74, line: 285, column: 9)
!305 = !DILocation(line: 285, column: 23, scope: !304)
!306 = !DILocation(line: 285, column: 9, scope: !301)
!307 = !DILocation(line: 287, column: 13, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !74, line: 286, column: 9)
!309 = !DILocation(line: 287, column: 20, scope: !308)
!310 = !DILocation(line: 287, column: 23, scope: !308)
!311 = !DILocation(line: 288, column: 9, scope: !308)
!312 = !DILocation(line: 285, column: 30, scope: !304)
!313 = !DILocation(line: 285, column: 9, scope: !304)
!314 = distinct !{!314, !306, !315, !113}
!315 = !DILocation(line: 288, column: 9, scope: !301)
!316 = !DILocation(line: 290, column: 13, scope: !317)
!317 = distinct !DILexicalBlock(scope: !288, file: !74, line: 290, column: 13)
!318 = !DILocation(line: 290, column: 18, scope: !317)
!319 = !DILocation(line: 290, column: 23, scope: !317)
!320 = !DILocation(line: 290, column: 26, scope: !317)
!321 = !DILocation(line: 290, column: 31, scope: !317)
!322 = !DILocation(line: 290, column: 13, scope: !288)
!323 = !DILocation(line: 292, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !317, file: !74, line: 291, column: 9)
!325 = !DILocation(line: 292, column: 20, scope: !324)
!326 = !DILocation(line: 292, column: 26, scope: !324)
!327 = !DILocation(line: 294, column: 19, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !74, line: 294, column: 13)
!329 = !DILocation(line: 294, column: 17, scope: !328)
!330 = !DILocation(line: 294, column: 24, scope: !331)
!331 = distinct !DILexicalBlock(scope: !328, file: !74, line: 294, column: 13)
!332 = !DILocation(line: 294, column: 26, scope: !331)
!333 = !DILocation(line: 294, column: 13, scope: !328)
!334 = !DILocation(line: 296, column: 30, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !74, line: 295, column: 13)
!336 = !DILocation(line: 296, column: 37, scope: !335)
!337 = !DILocation(line: 296, column: 17, scope: !335)
!338 = !DILocation(line: 297, column: 13, scope: !335)
!339 = !DILocation(line: 294, column: 33, scope: !331)
!340 = !DILocation(line: 294, column: 13, scope: !331)
!341 = distinct !{!341, !333, !342, !113}
!342 = !DILocation(line: 297, column: 13, scope: !328)
!343 = !DILocation(line: 298, column: 9, scope: !324)
!344 = !DILocation(line: 301, column: 13, scope: !345)
!345 = distinct !DILexicalBlock(scope: !317, file: !74, line: 300, column: 9)
!346 = !DILocation(line: 303, column: 14, scope: !288)
!347 = !DILocation(line: 303, column: 9, scope: !288)
!348 = !DILocation(line: 305, column: 1, scope: !280)
!349 = distinct !DISubprogram(name: "goodB2GSource", scope: !74, file: !74, line: 200, type: !145, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!350 = !DILocalVariable(name: "data", arg: 1, scope: !349, file: !74, line: 200, type: !47)
!351 = !DILocation(line: 200, column: 30, scope: !349)
!352 = !DILocalVariable(name: "recvResult", scope: !353, file: !74, line: 207, type: !47)
!353 = distinct !DILexicalBlock(scope: !349, file: !74, line: 202, column: 5)
!354 = !DILocation(line: 207, column: 13, scope: !353)
!355 = !DILocalVariable(name: "service", scope: !353, file: !74, line: 208, type: !153)
!356 = !DILocation(line: 208, column: 28, scope: !353)
!357 = !DILocalVariable(name: "listenSocket", scope: !353, file: !74, line: 209, type: !47)
!358 = !DILocation(line: 209, column: 16, scope: !353)
!359 = !DILocalVariable(name: "acceptSocket", scope: !353, file: !74, line: 210, type: !47)
!360 = !DILocation(line: 210, column: 16, scope: !353)
!361 = !DILocalVariable(name: "inputBuffer", scope: !353, file: !74, line: 211, type: !63)
!362 = !DILocation(line: 211, column: 14, scope: !353)
!363 = !DILocation(line: 212, column: 9, scope: !353)
!364 = !DILocation(line: 222, column: 28, scope: !365)
!365 = distinct !DILexicalBlock(scope: !353, file: !74, line: 213, column: 9)
!366 = !DILocation(line: 222, column: 26, scope: !365)
!367 = !DILocation(line: 223, column: 17, scope: !368)
!368 = distinct !DILexicalBlock(scope: !365, file: !74, line: 223, column: 17)
!369 = !DILocation(line: 223, column: 30, scope: !368)
!370 = !DILocation(line: 223, column: 17, scope: !365)
!371 = !DILocation(line: 225, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !74, line: 224, column: 13)
!373 = !DILocation(line: 227, column: 13, scope: !365)
!374 = !DILocation(line: 228, column: 21, scope: !365)
!375 = !DILocation(line: 228, column: 32, scope: !365)
!376 = !DILocation(line: 229, column: 21, scope: !365)
!377 = !DILocation(line: 229, column: 30, scope: !365)
!378 = !DILocation(line: 229, column: 37, scope: !365)
!379 = !DILocation(line: 230, column: 32, scope: !365)
!380 = !DILocation(line: 230, column: 21, scope: !365)
!381 = !DILocation(line: 230, column: 30, scope: !365)
!382 = !DILocation(line: 231, column: 22, scope: !383)
!383 = distinct !DILexicalBlock(scope: !365, file: !74, line: 231, column: 17)
!384 = !DILocation(line: 231, column: 36, scope: !383)
!385 = !DILocation(line: 231, column: 17, scope: !383)
!386 = !DILocation(line: 231, column: 81, scope: !383)
!387 = !DILocation(line: 231, column: 17, scope: !365)
!388 = !DILocation(line: 233, column: 17, scope: !389)
!389 = distinct !DILexicalBlock(scope: !383, file: !74, line: 232, column: 13)
!390 = !DILocation(line: 235, column: 24, scope: !391)
!391 = distinct !DILexicalBlock(scope: !365, file: !74, line: 235, column: 17)
!392 = !DILocation(line: 235, column: 17, scope: !391)
!393 = !DILocation(line: 235, column: 54, scope: !391)
!394 = !DILocation(line: 235, column: 17, scope: !365)
!395 = !DILocation(line: 237, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !391, file: !74, line: 236, column: 13)
!397 = !DILocation(line: 239, column: 35, scope: !365)
!398 = !DILocation(line: 239, column: 28, scope: !365)
!399 = !DILocation(line: 239, column: 26, scope: !365)
!400 = !DILocation(line: 240, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !365, file: !74, line: 240, column: 17)
!402 = !DILocation(line: 240, column: 30, scope: !401)
!403 = !DILocation(line: 240, column: 17, scope: !365)
!404 = !DILocation(line: 242, column: 17, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !74, line: 241, column: 13)
!406 = !DILocation(line: 245, column: 31, scope: !365)
!407 = !DILocation(line: 245, column: 45, scope: !365)
!408 = !DILocation(line: 245, column: 26, scope: !365)
!409 = !DILocation(line: 245, column: 24, scope: !365)
!410 = !DILocation(line: 246, column: 17, scope: !411)
!411 = distinct !DILexicalBlock(scope: !365, file: !74, line: 246, column: 17)
!412 = !DILocation(line: 246, column: 28, scope: !411)
!413 = !DILocation(line: 246, column: 44, scope: !411)
!414 = !DILocation(line: 246, column: 47, scope: !411)
!415 = !DILocation(line: 246, column: 58, scope: !411)
!416 = !DILocation(line: 246, column: 17, scope: !365)
!417 = !DILocation(line: 248, column: 17, scope: !418)
!418 = distinct !DILexicalBlock(scope: !411, file: !74, line: 247, column: 13)
!419 = !DILocation(line: 251, column: 25, scope: !365)
!420 = !DILocation(line: 251, column: 13, scope: !365)
!421 = !DILocation(line: 251, column: 37, scope: !365)
!422 = !DILocation(line: 253, column: 25, scope: !365)
!423 = !DILocation(line: 253, column: 20, scope: !365)
!424 = !DILocation(line: 253, column: 18, scope: !365)
!425 = !DILocation(line: 254, column: 9, scope: !365)
!426 = !DILocation(line: 256, column: 13, scope: !427)
!427 = distinct !DILexicalBlock(scope: !353, file: !74, line: 256, column: 13)
!428 = !DILocation(line: 256, column: 26, scope: !427)
!429 = !DILocation(line: 256, column: 13, scope: !353)
!430 = !DILocation(line: 258, column: 26, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !74, line: 257, column: 9)
!432 = !DILocation(line: 258, column: 13, scope: !431)
!433 = !DILocation(line: 259, column: 9, scope: !431)
!434 = !DILocation(line: 260, column: 13, scope: !435)
!435 = distinct !DILexicalBlock(scope: !353, file: !74, line: 260, column: 13)
!436 = !DILocation(line: 260, column: 26, scope: !435)
!437 = !DILocation(line: 260, column: 13, scope: !353)
!438 = !DILocation(line: 262, column: 26, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !74, line: 261, column: 9)
!440 = !DILocation(line: 262, column: 13, scope: !439)
!441 = !DILocation(line: 263, column: 9, scope: !439)
!442 = !DILocation(line: 271, column: 12, scope: !349)
!443 = !DILocation(line: 271, column: 5, scope: !349)
!444 = distinct !DISubprogram(name: "goodG2B", scope: !74, file: !74, line: 165, type: !75, scopeLine: 166, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!445 = !DILocalVariable(name: "data", scope: !444, file: !74, line: 167, type: !47)
!446 = !DILocation(line: 167, column: 9, scope: !444)
!447 = !DILocation(line: 169, column: 10, scope: !444)
!448 = !DILocation(line: 170, column: 26, scope: !444)
!449 = !DILocation(line: 170, column: 12, scope: !444)
!450 = !DILocation(line: 170, column: 10, scope: !444)
!451 = !DILocalVariable(name: "i", scope: !452, file: !74, line: 172, type: !47)
!452 = distinct !DILexicalBlock(scope: !444, file: !74, line: 171, column: 5)
!453 = !DILocation(line: 172, column: 13, scope: !452)
!454 = !DILocalVariable(name: "buffer", scope: !452, file: !74, line: 173, type: !46)
!455 = !DILocation(line: 173, column: 15, scope: !452)
!456 = !DILocation(line: 173, column: 31, scope: !452)
!457 = !DILocation(line: 173, column: 24, scope: !452)
!458 = !DILocation(line: 174, column: 13, scope: !459)
!459 = distinct !DILexicalBlock(scope: !452, file: !74, line: 174, column: 13)
!460 = !DILocation(line: 174, column: 20, scope: !459)
!461 = !DILocation(line: 174, column: 13, scope: !452)
!462 = !DILocation(line: 174, column: 30, scope: !463)
!463 = distinct !DILexicalBlock(scope: !459, file: !74, line: 174, column: 29)
!464 = !DILocation(line: 176, column: 16, scope: !465)
!465 = distinct !DILexicalBlock(scope: !452, file: !74, line: 176, column: 9)
!466 = !DILocation(line: 176, column: 14, scope: !465)
!467 = !DILocation(line: 176, column: 21, scope: !468)
!468 = distinct !DILexicalBlock(scope: !465, file: !74, line: 176, column: 9)
!469 = !DILocation(line: 176, column: 23, scope: !468)
!470 = !DILocation(line: 176, column: 9, scope: !465)
!471 = !DILocation(line: 178, column: 13, scope: !472)
!472 = distinct !DILexicalBlock(scope: !468, file: !74, line: 177, column: 9)
!473 = !DILocation(line: 178, column: 20, scope: !472)
!474 = !DILocation(line: 178, column: 23, scope: !472)
!475 = !DILocation(line: 179, column: 9, scope: !472)
!476 = !DILocation(line: 176, column: 30, scope: !468)
!477 = !DILocation(line: 176, column: 9, scope: !468)
!478 = distinct !{!478, !470, !479, !113}
!479 = !DILocation(line: 179, column: 9, scope: !465)
!480 = !DILocation(line: 182, column: 13, scope: !481)
!481 = distinct !DILexicalBlock(scope: !452, file: !74, line: 182, column: 13)
!482 = !DILocation(line: 182, column: 18, scope: !481)
!483 = !DILocation(line: 182, column: 13, scope: !452)
!484 = !DILocation(line: 184, column: 13, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !74, line: 183, column: 9)
!486 = !DILocation(line: 184, column: 20, scope: !485)
!487 = !DILocation(line: 184, column: 26, scope: !485)
!488 = !DILocation(line: 186, column: 19, scope: !489)
!489 = distinct !DILexicalBlock(scope: !485, file: !74, line: 186, column: 13)
!490 = !DILocation(line: 186, column: 17, scope: !489)
!491 = !DILocation(line: 186, column: 24, scope: !492)
!492 = distinct !DILexicalBlock(scope: !489, file: !74, line: 186, column: 13)
!493 = !DILocation(line: 186, column: 26, scope: !492)
!494 = !DILocation(line: 186, column: 13, scope: !489)
!495 = !DILocation(line: 188, column: 30, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !74, line: 187, column: 13)
!497 = !DILocation(line: 188, column: 37, scope: !496)
!498 = !DILocation(line: 188, column: 17, scope: !496)
!499 = !DILocation(line: 189, column: 13, scope: !496)
!500 = !DILocation(line: 186, column: 33, scope: !492)
!501 = !DILocation(line: 186, column: 13, scope: !492)
!502 = distinct !{!502, !494, !503, !113}
!503 = !DILocation(line: 189, column: 13, scope: !489)
!504 = !DILocation(line: 190, column: 9, scope: !485)
!505 = !DILocation(line: 193, column: 13, scope: !506)
!506 = distinct !DILexicalBlock(scope: !481, file: !74, line: 192, column: 9)
!507 = !DILocation(line: 195, column: 14, scope: !452)
!508 = !DILocation(line: 195, column: 9, scope: !452)
!509 = !DILocation(line: 197, column: 1, scope: !444)
!510 = distinct !DISubprogram(name: "goodG2BSource", scope: !74, file: !74, line: 157, type: !145, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!511 = !DILocalVariable(name: "data", arg: 1, scope: !510, file: !74, line: 157, type: !47)
!512 = !DILocation(line: 157, column: 30, scope: !510)
!513 = !DILocation(line: 161, column: 10, scope: !510)
!514 = !DILocation(line: 162, column: 12, scope: !510)
!515 = !DILocation(line: 162, column: 5, scope: !510)
