; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_16.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_16_bad() #0 !dbg !73 {
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
  br label %while.body, !dbg !81

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !82, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !86, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %listenSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %acceptSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  br label %do.body, !dbg !110

do.body:                                          ; preds = %while.body
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
  br label %while.end, !dbg !189

while.end:                                        ; preds = %if.end32
  br label %while.body33, !dbg !190

while.body33:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !191, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !195, metadata !DIExpression()), !dbg !196
  %call34 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !197
  %15 = bitcast i8* %call34 to i32*, !dbg !198
  store i32* %15, i32** %buffer, align 8, !dbg !196
  %16 = load i32*, i32** %buffer, align 8, !dbg !199
  %cmp35 = icmp eq i32* %16, null, !dbg !201
  br i1 %cmp35, label %if.then37, label %if.end38, !dbg !202

if.then37:                                        ; preds = %while.body33
  call void @exit(i32 -1) #11, !dbg !203
  unreachable, !dbg !203

if.end38:                                         ; preds = %while.body33
  store i32 0, i32* %i, align 4, !dbg !205
  br label %for.cond, !dbg !207

for.cond:                                         ; preds = %for.inc, %if.end38
  %17 = load i32, i32* %i, align 4, !dbg !208
  %cmp39 = icmp slt i32 %17, 10, !dbg !210
  br i1 %cmp39, label %for.body, label %for.end, !dbg !211

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !212
  %19 = load i32, i32* %i, align 4, !dbg !214
  %idxprom41 = sext i32 %19 to i64, !dbg !212
  %arrayidx42 = getelementptr inbounds i32, i32* %18, i64 %idxprom41, !dbg !212
  store i32 0, i32* %arrayidx42, align 4, !dbg !215
  br label %for.inc, !dbg !216

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !217
  %inc = add nsw i32 %20, 1, !dbg !217
  store i32 %inc, i32* %i, align 4, !dbg !217
  br label %for.cond, !dbg !218, !llvm.loop !219

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !222
  %cmp43 = icmp sge i32 %21, 0, !dbg !224
  br i1 %cmp43, label %if.then45, label %if.else, !dbg !225

if.then45:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !226
  %23 = load i32, i32* %data, align 4, !dbg !228
  %idxprom46 = sext i32 %23 to i64, !dbg !226
  %arrayidx47 = getelementptr inbounds i32, i32* %22, i64 %idxprom46, !dbg !226
  store i32 1, i32* %arrayidx47, align 4, !dbg !229
  store i32 0, i32* %i, align 4, !dbg !230
  br label %for.cond48, !dbg !232

for.cond48:                                       ; preds = %for.inc54, %if.then45
  %24 = load i32, i32* %i, align 4, !dbg !233
  %cmp49 = icmp slt i32 %24, 10, !dbg !235
  br i1 %cmp49, label %for.body51, label %for.end56, !dbg !236

for.body51:                                       ; preds = %for.cond48
  %25 = load i32*, i32** %buffer, align 8, !dbg !237
  %26 = load i32, i32* %i, align 4, !dbg !239
  %idxprom52 = sext i32 %26 to i64, !dbg !237
  %arrayidx53 = getelementptr inbounds i32, i32* %25, i64 %idxprom52, !dbg !237
  %27 = load i32, i32* %arrayidx53, align 4, !dbg !237
  call void @printIntLine(i32 %27), !dbg !240
  br label %for.inc54, !dbg !241

for.inc54:                                        ; preds = %for.body51
  %28 = load i32, i32* %i, align 4, !dbg !242
  %inc55 = add nsw i32 %28, 1, !dbg !242
  store i32 %inc55, i32* %i, align 4, !dbg !242
  br label %for.cond48, !dbg !243, !llvm.loop !244

for.end56:                                        ; preds = %for.cond48
  br label %if.end57, !dbg !246

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !247
  br label %if.end57

if.end57:                                         ; preds = %if.else, %for.end56
  %29 = load i32*, i32** %buffer, align 8, !dbg !249
  %30 = bitcast i32* %29 to i8*, !dbg !249
  call void @free(i8* %30) #8, !dbg !250
  br label %while.end58, !dbg !251

while.end58:                                      ; preds = %if.end57
  ret void, !dbg !252
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_16_good() #0 !dbg !253 {
entry:
  call void @goodB2G(), !dbg !254
  call void @goodG2B(), !dbg !255
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_16_good(), !dbg !270
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !271
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !272
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_16_bad(), !dbg !273
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !274
  ret i32 0, !dbg !275
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !276 {
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
  br label %while.body, !dbg !280

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !281, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !285, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !287, metadata !DIExpression()), !dbg !288
  store i32 -1, i32* %listenSocket, align 4, !dbg !288
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !289, metadata !DIExpression()), !dbg !290
  store i32 -1, i32* %acceptSocket, align 4, !dbg !290
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !291, metadata !DIExpression()), !dbg !292
  br label %do.body, !dbg !293

do.body:                                          ; preds = %while.body
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
  br label %while.end, !dbg !372

while.end:                                        ; preds = %if.end32
  br label %while.body33, !dbg !373

while.body33:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !374, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !378, metadata !DIExpression()), !dbg !379
  %call34 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !380
  %15 = bitcast i8* %call34 to i32*, !dbg !381
  store i32* %15, i32** %buffer, align 8, !dbg !379
  %16 = load i32*, i32** %buffer, align 8, !dbg !382
  %cmp35 = icmp eq i32* %16, null, !dbg !384
  br i1 %cmp35, label %if.then37, label %if.end38, !dbg !385

if.then37:                                        ; preds = %while.body33
  call void @exit(i32 -1) #11, !dbg !386
  unreachable, !dbg !386

if.end38:                                         ; preds = %while.body33
  store i32 0, i32* %i, align 4, !dbg !388
  br label %for.cond, !dbg !390

for.cond:                                         ; preds = %for.inc, %if.end38
  %17 = load i32, i32* %i, align 4, !dbg !391
  %cmp39 = icmp slt i32 %17, 10, !dbg !393
  br i1 %cmp39, label %for.body, label %for.end, !dbg !394

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !395
  %19 = load i32, i32* %i, align 4, !dbg !397
  %idxprom41 = sext i32 %19 to i64, !dbg !395
  %arrayidx42 = getelementptr inbounds i32, i32* %18, i64 %idxprom41, !dbg !395
  store i32 0, i32* %arrayidx42, align 4, !dbg !398
  br label %for.inc, !dbg !399

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !400
  %inc = add nsw i32 %20, 1, !dbg !400
  store i32 %inc, i32* %i, align 4, !dbg !400
  br label %for.cond, !dbg !401, !llvm.loop !402

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !404
  %cmp43 = icmp sge i32 %21, 0, !dbg !406
  br i1 %cmp43, label %land.lhs.true, label %if.else, !dbg !407

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !408
  %cmp45 = icmp slt i32 %22, 10, !dbg !409
  br i1 %cmp45, label %if.then47, label %if.else, !dbg !410

if.then47:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !411
  %24 = load i32, i32* %data, align 4, !dbg !413
  %idxprom48 = sext i32 %24 to i64, !dbg !411
  %arrayidx49 = getelementptr inbounds i32, i32* %23, i64 %idxprom48, !dbg !411
  store i32 1, i32* %arrayidx49, align 4, !dbg !414
  store i32 0, i32* %i, align 4, !dbg !415
  br label %for.cond50, !dbg !417

for.cond50:                                       ; preds = %for.inc56, %if.then47
  %25 = load i32, i32* %i, align 4, !dbg !418
  %cmp51 = icmp slt i32 %25, 10, !dbg !420
  br i1 %cmp51, label %for.body53, label %for.end58, !dbg !421

for.body53:                                       ; preds = %for.cond50
  %26 = load i32*, i32** %buffer, align 8, !dbg !422
  %27 = load i32, i32* %i, align 4, !dbg !424
  %idxprom54 = sext i32 %27 to i64, !dbg !422
  %arrayidx55 = getelementptr inbounds i32, i32* %26, i64 %idxprom54, !dbg !422
  %28 = load i32, i32* %arrayidx55, align 4, !dbg !422
  call void @printIntLine(i32 %28), !dbg !425
  br label %for.inc56, !dbg !426

for.inc56:                                        ; preds = %for.body53
  %29 = load i32, i32* %i, align 4, !dbg !427
  %inc57 = add nsw i32 %29, 1, !dbg !427
  store i32 %inc57, i32* %i, align 4, !dbg !427
  br label %for.cond50, !dbg !428, !llvm.loop !429

for.end58:                                        ; preds = %for.cond50
  br label %if.end59, !dbg !431

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !432
  br label %if.end59

if.end59:                                         ; preds = %if.else, %for.end58
  %30 = load i32*, i32** %buffer, align 8, !dbg !434
  %31 = bitcast i32* %30 to i8*, !dbg !434
  call void @free(i8* %31) #8, !dbg !435
  br label %while.end60, !dbg !436

while.end60:                                      ; preds = %if.end59
  ret void, !dbg !437
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !438 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !439, metadata !DIExpression()), !dbg !440
  store i32 -1, i32* %data, align 4, !dbg !441
  br label %while.body, !dbg !442

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !443
  br label %while.end, !dbg !445

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !446

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !447, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !451, metadata !DIExpression()), !dbg !452
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !453
  %0 = bitcast i8* %call to i32*, !dbg !454
  store i32* %0, i32** %buffer, align 8, !dbg !452
  %1 = load i32*, i32** %buffer, align 8, !dbg !455
  %cmp = icmp eq i32* %1, null, !dbg !457
  br i1 %cmp, label %if.then, label %if.end, !dbg !458

if.then:                                          ; preds = %while.body1
  call void @exit(i32 -1) #11, !dbg !459
  unreachable, !dbg !459

if.end:                                           ; preds = %while.body1
  store i32 0, i32* %i, align 4, !dbg !461
  br label %for.cond, !dbg !463

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !464
  %cmp2 = icmp slt i32 %2, 10, !dbg !466
  br i1 %cmp2, label %for.body, label %for.end, !dbg !467

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !468
  %4 = load i32, i32* %i, align 4, !dbg !470
  %idxprom = sext i32 %4 to i64, !dbg !468
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !468
  store i32 0, i32* %arrayidx, align 4, !dbg !471
  br label %for.inc, !dbg !472

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !473
  %inc = add nsw i32 %5, 1, !dbg !473
  store i32 %inc, i32* %i, align 4, !dbg !473
  br label %for.cond, !dbg !474, !llvm.loop !475

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !477
  %cmp3 = icmp sge i32 %6, 0, !dbg !479
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !480

if.then4:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !481
  %8 = load i32, i32* %data, align 4, !dbg !483
  %idxprom5 = sext i32 %8 to i64, !dbg !481
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %idxprom5, !dbg !481
  store i32 1, i32* %arrayidx6, align 4, !dbg !484
  store i32 0, i32* %i, align 4, !dbg !485
  br label %for.cond7, !dbg !487

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %9 = load i32, i32* %i, align 4, !dbg !488
  %cmp8 = icmp slt i32 %9, 10, !dbg !490
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !491

for.body9:                                        ; preds = %for.cond7
  %10 = load i32*, i32** %buffer, align 8, !dbg !492
  %11 = load i32, i32* %i, align 4, !dbg !494
  %idxprom10 = sext i32 %11 to i64, !dbg !492
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !492
  %12 = load i32, i32* %arrayidx11, align 4, !dbg !492
  call void @printIntLine(i32 %12), !dbg !495
  br label %for.inc12, !dbg !496

for.inc12:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !dbg !497
  %inc13 = add nsw i32 %13, 1, !dbg !497
  store i32 %inc13, i32* %i, align 4, !dbg !497
  br label %for.cond7, !dbg !498, !llvm.loop !499

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !501

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !502
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %14 = load i32*, i32** %buffer, align 8, !dbg !504
  %15 = bitcast i32* %14 to i8*, !dbg !504
  call void @free(i8* %15) #8, !dbg !505
  br label %while.end16, !dbg !506

while.end16:                                      ; preds = %if.end15
  ret void, !dbg !507
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_16_bad", scope: !74, file: !74, line: 44, type: !75, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_16.c", directory: "/home/joelyang/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 46, type: !65)
!79 = !DILocation(line: 46, column: 9, scope: !73)
!80 = !DILocation(line: 48, column: 10, scope: !73)
!81 = !DILocation(line: 49, column: 5, scope: !73)
!82 = !DILocalVariable(name: "recvResult", scope: !83, file: !74, line: 56, type: !65)
!83 = distinct !DILexicalBlock(scope: !84, file: !74, line: 51, column: 9)
!84 = distinct !DILexicalBlock(scope: !73, file: !74, line: 50, column: 5)
!85 = !DILocation(line: 56, column: 17, scope: !83)
!86 = !DILocalVariable(name: "service", scope: !83, file: !74, line: 57, type: !87)
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
!103 = !DILocation(line: 57, column: 32, scope: !83)
!104 = !DILocalVariable(name: "listenSocket", scope: !83, file: !74, line: 58, type: !65)
!105 = !DILocation(line: 58, column: 20, scope: !83)
!106 = !DILocalVariable(name: "acceptSocket", scope: !83, file: !74, line: 59, type: !65)
!107 = !DILocation(line: 59, column: 20, scope: !83)
!108 = !DILocalVariable(name: "inputBuffer", scope: !83, file: !74, line: 60, type: !60)
!109 = !DILocation(line: 60, column: 18, scope: !83)
!110 = !DILocation(line: 61, column: 13, scope: !83)
!111 = !DILocation(line: 71, column: 32, scope: !112)
!112 = distinct !DILexicalBlock(scope: !83, file: !74, line: 62, column: 13)
!113 = !DILocation(line: 71, column: 30, scope: !112)
!114 = !DILocation(line: 72, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !74, line: 72, column: 21)
!116 = !DILocation(line: 72, column: 34, scope: !115)
!117 = !DILocation(line: 72, column: 21, scope: !112)
!118 = !DILocation(line: 74, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !74, line: 73, column: 17)
!120 = !DILocation(line: 76, column: 17, scope: !112)
!121 = !DILocation(line: 77, column: 25, scope: !112)
!122 = !DILocation(line: 77, column: 36, scope: !112)
!123 = !DILocation(line: 78, column: 25, scope: !112)
!124 = !DILocation(line: 78, column: 34, scope: !112)
!125 = !DILocation(line: 78, column: 41, scope: !112)
!126 = !DILocation(line: 79, column: 36, scope: !112)
!127 = !DILocation(line: 79, column: 25, scope: !112)
!128 = !DILocation(line: 79, column: 34, scope: !112)
!129 = !DILocation(line: 80, column: 26, scope: !130)
!130 = distinct !DILexicalBlock(scope: !112, file: !74, line: 80, column: 21)
!131 = !DILocation(line: 80, column: 40, scope: !130)
!132 = !DILocation(line: 80, column: 21, scope: !130)
!133 = !DILocation(line: 80, column: 85, scope: !130)
!134 = !DILocation(line: 80, column: 21, scope: !112)
!135 = !DILocation(line: 82, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !74, line: 81, column: 17)
!137 = !DILocation(line: 84, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !112, file: !74, line: 84, column: 21)
!139 = !DILocation(line: 84, column: 21, scope: !138)
!140 = !DILocation(line: 84, column: 58, scope: !138)
!141 = !DILocation(line: 84, column: 21, scope: !112)
!142 = !DILocation(line: 86, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !74, line: 85, column: 17)
!144 = !DILocation(line: 88, column: 39, scope: !112)
!145 = !DILocation(line: 88, column: 32, scope: !112)
!146 = !DILocation(line: 88, column: 30, scope: !112)
!147 = !DILocation(line: 89, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !112, file: !74, line: 89, column: 21)
!149 = !DILocation(line: 89, column: 34, scope: !148)
!150 = !DILocation(line: 89, column: 21, scope: !112)
!151 = !DILocation(line: 91, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !74, line: 90, column: 17)
!153 = !DILocation(line: 94, column: 35, scope: !112)
!154 = !DILocation(line: 94, column: 49, scope: !112)
!155 = !DILocation(line: 94, column: 30, scope: !112)
!156 = !DILocation(line: 94, column: 28, scope: !112)
!157 = !DILocation(line: 95, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !112, file: !74, line: 95, column: 21)
!159 = !DILocation(line: 95, column: 32, scope: !158)
!160 = !DILocation(line: 95, column: 48, scope: !158)
!161 = !DILocation(line: 95, column: 51, scope: !158)
!162 = !DILocation(line: 95, column: 62, scope: !158)
!163 = !DILocation(line: 95, column: 21, scope: !112)
!164 = !DILocation(line: 97, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !74, line: 96, column: 17)
!166 = !DILocation(line: 100, column: 29, scope: !112)
!167 = !DILocation(line: 100, column: 17, scope: !112)
!168 = !DILocation(line: 100, column: 41, scope: !112)
!169 = !DILocation(line: 102, column: 29, scope: !112)
!170 = !DILocation(line: 102, column: 24, scope: !112)
!171 = !DILocation(line: 102, column: 22, scope: !112)
!172 = !DILocation(line: 103, column: 13, scope: !112)
!173 = !DILocation(line: 105, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !83, file: !74, line: 105, column: 17)
!175 = !DILocation(line: 105, column: 30, scope: !174)
!176 = !DILocation(line: 105, column: 17, scope: !83)
!177 = !DILocation(line: 107, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !74, line: 106, column: 13)
!179 = !DILocation(line: 107, column: 17, scope: !178)
!180 = !DILocation(line: 108, column: 13, scope: !178)
!181 = !DILocation(line: 109, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !83, file: !74, line: 109, column: 17)
!183 = !DILocation(line: 109, column: 30, scope: !182)
!184 = !DILocation(line: 109, column: 17, scope: !83)
!185 = !DILocation(line: 111, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !74, line: 110, column: 13)
!187 = !DILocation(line: 111, column: 17, scope: !186)
!188 = !DILocation(line: 112, column: 13, scope: !186)
!189 = !DILocation(line: 120, column: 9, scope: !84)
!190 = !DILocation(line: 122, column: 5, scope: !73)
!191 = !DILocalVariable(name: "i", scope: !192, file: !74, line: 125, type: !65)
!192 = distinct !DILexicalBlock(scope: !193, file: !74, line: 124, column: 9)
!193 = distinct !DILexicalBlock(scope: !73, file: !74, line: 123, column: 5)
!194 = !DILocation(line: 125, column: 17, scope: !192)
!195 = !DILocalVariable(name: "buffer", scope: !192, file: !74, line: 126, type: !64)
!196 = !DILocation(line: 126, column: 19, scope: !192)
!197 = !DILocation(line: 126, column: 35, scope: !192)
!198 = !DILocation(line: 126, column: 28, scope: !192)
!199 = !DILocation(line: 127, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !192, file: !74, line: 127, column: 17)
!201 = !DILocation(line: 127, column: 24, scope: !200)
!202 = !DILocation(line: 127, column: 17, scope: !192)
!203 = !DILocation(line: 127, column: 34, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !74, line: 127, column: 33)
!205 = !DILocation(line: 129, column: 20, scope: !206)
!206 = distinct !DILexicalBlock(scope: !192, file: !74, line: 129, column: 13)
!207 = !DILocation(line: 129, column: 18, scope: !206)
!208 = !DILocation(line: 129, column: 25, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !74, line: 129, column: 13)
!210 = !DILocation(line: 129, column: 27, scope: !209)
!211 = !DILocation(line: 129, column: 13, scope: !206)
!212 = !DILocation(line: 131, column: 17, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !74, line: 130, column: 13)
!214 = !DILocation(line: 131, column: 24, scope: !213)
!215 = !DILocation(line: 131, column: 27, scope: !213)
!216 = !DILocation(line: 132, column: 13, scope: !213)
!217 = !DILocation(line: 129, column: 34, scope: !209)
!218 = !DILocation(line: 129, column: 13, scope: !209)
!219 = distinct !{!219, !211, !220, !221}
!220 = !DILocation(line: 132, column: 13, scope: !206)
!221 = !{!"llvm.loop.mustprogress"}
!222 = !DILocation(line: 135, column: 17, scope: !223)
!223 = distinct !DILexicalBlock(scope: !192, file: !74, line: 135, column: 17)
!224 = !DILocation(line: 135, column: 22, scope: !223)
!225 = !DILocation(line: 135, column: 17, scope: !192)
!226 = !DILocation(line: 137, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !74, line: 136, column: 13)
!228 = !DILocation(line: 137, column: 24, scope: !227)
!229 = !DILocation(line: 137, column: 30, scope: !227)
!230 = !DILocation(line: 139, column: 23, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !74, line: 139, column: 17)
!232 = !DILocation(line: 139, column: 21, scope: !231)
!233 = !DILocation(line: 139, column: 28, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !74, line: 139, column: 17)
!235 = !DILocation(line: 139, column: 30, scope: !234)
!236 = !DILocation(line: 139, column: 17, scope: !231)
!237 = !DILocation(line: 141, column: 34, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !74, line: 140, column: 17)
!239 = !DILocation(line: 141, column: 41, scope: !238)
!240 = !DILocation(line: 141, column: 21, scope: !238)
!241 = !DILocation(line: 142, column: 17, scope: !238)
!242 = !DILocation(line: 139, column: 37, scope: !234)
!243 = !DILocation(line: 139, column: 17, scope: !234)
!244 = distinct !{!244, !236, !245, !221}
!245 = !DILocation(line: 142, column: 17, scope: !231)
!246 = !DILocation(line: 143, column: 13, scope: !227)
!247 = !DILocation(line: 146, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !223, file: !74, line: 145, column: 13)
!249 = !DILocation(line: 148, column: 18, scope: !192)
!250 = !DILocation(line: 148, column: 13, scope: !192)
!251 = !DILocation(line: 150, column: 9, scope: !193)
!252 = !DILocation(line: 152, column: 1, scope: !73)
!253 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_16_good", scope: !74, file: !74, line: 313, type: !75, scopeLine: 314, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!254 = !DILocation(line: 315, column: 5, scope: !253)
!255 = !DILocation(line: 316, column: 5, scope: !253)
!256 = !DILocation(line: 317, column: 1, scope: !253)
!257 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 328, type: !258, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!258 = !DISubroutineType(types: !259)
!259 = !{!65, !65, !260}
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !261, size: 64)
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!262 = !DILocalVariable(name: "argc", arg: 1, scope: !257, file: !74, line: 328, type: !65)
!263 = !DILocation(line: 328, column: 14, scope: !257)
!264 = !DILocalVariable(name: "argv", arg: 2, scope: !257, file: !74, line: 328, type: !260)
!265 = !DILocation(line: 328, column: 27, scope: !257)
!266 = !DILocation(line: 331, column: 22, scope: !257)
!267 = !DILocation(line: 331, column: 12, scope: !257)
!268 = !DILocation(line: 331, column: 5, scope: !257)
!269 = !DILocation(line: 333, column: 5, scope: !257)
!270 = !DILocation(line: 334, column: 5, scope: !257)
!271 = !DILocation(line: 335, column: 5, scope: !257)
!272 = !DILocation(line: 338, column: 5, scope: !257)
!273 = !DILocation(line: 339, column: 5, scope: !257)
!274 = !DILocation(line: 340, column: 5, scope: !257)
!275 = !DILocation(line: 342, column: 5, scope: !257)
!276 = distinct !DISubprogram(name: "goodB2G", scope: !74, file: !74, line: 159, type: !75, scopeLine: 160, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!277 = !DILocalVariable(name: "data", scope: !276, file: !74, line: 161, type: !65)
!278 = !DILocation(line: 161, column: 9, scope: !276)
!279 = !DILocation(line: 163, column: 10, scope: !276)
!280 = !DILocation(line: 164, column: 5, scope: !276)
!281 = !DILocalVariable(name: "recvResult", scope: !282, file: !74, line: 171, type: !65)
!282 = distinct !DILexicalBlock(scope: !283, file: !74, line: 166, column: 9)
!283 = distinct !DILexicalBlock(scope: !276, file: !74, line: 165, column: 5)
!284 = !DILocation(line: 171, column: 17, scope: !282)
!285 = !DILocalVariable(name: "service", scope: !282, file: !74, line: 172, type: !87)
!286 = !DILocation(line: 172, column: 32, scope: !282)
!287 = !DILocalVariable(name: "listenSocket", scope: !282, file: !74, line: 173, type: !65)
!288 = !DILocation(line: 173, column: 20, scope: !282)
!289 = !DILocalVariable(name: "acceptSocket", scope: !282, file: !74, line: 174, type: !65)
!290 = !DILocation(line: 174, column: 20, scope: !282)
!291 = !DILocalVariable(name: "inputBuffer", scope: !282, file: !74, line: 175, type: !60)
!292 = !DILocation(line: 175, column: 18, scope: !282)
!293 = !DILocation(line: 176, column: 13, scope: !282)
!294 = !DILocation(line: 186, column: 32, scope: !295)
!295 = distinct !DILexicalBlock(scope: !282, file: !74, line: 177, column: 13)
!296 = !DILocation(line: 186, column: 30, scope: !295)
!297 = !DILocation(line: 187, column: 21, scope: !298)
!298 = distinct !DILexicalBlock(scope: !295, file: !74, line: 187, column: 21)
!299 = !DILocation(line: 187, column: 34, scope: !298)
!300 = !DILocation(line: 187, column: 21, scope: !295)
!301 = !DILocation(line: 189, column: 21, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !74, line: 188, column: 17)
!303 = !DILocation(line: 191, column: 17, scope: !295)
!304 = !DILocation(line: 192, column: 25, scope: !295)
!305 = !DILocation(line: 192, column: 36, scope: !295)
!306 = !DILocation(line: 193, column: 25, scope: !295)
!307 = !DILocation(line: 193, column: 34, scope: !295)
!308 = !DILocation(line: 193, column: 41, scope: !295)
!309 = !DILocation(line: 194, column: 36, scope: !295)
!310 = !DILocation(line: 194, column: 25, scope: !295)
!311 = !DILocation(line: 194, column: 34, scope: !295)
!312 = !DILocation(line: 195, column: 26, scope: !313)
!313 = distinct !DILexicalBlock(scope: !295, file: !74, line: 195, column: 21)
!314 = !DILocation(line: 195, column: 40, scope: !313)
!315 = !DILocation(line: 195, column: 21, scope: !313)
!316 = !DILocation(line: 195, column: 85, scope: !313)
!317 = !DILocation(line: 195, column: 21, scope: !295)
!318 = !DILocation(line: 197, column: 21, scope: !319)
!319 = distinct !DILexicalBlock(scope: !313, file: !74, line: 196, column: 17)
!320 = !DILocation(line: 199, column: 28, scope: !321)
!321 = distinct !DILexicalBlock(scope: !295, file: !74, line: 199, column: 21)
!322 = !DILocation(line: 199, column: 21, scope: !321)
!323 = !DILocation(line: 199, column: 58, scope: !321)
!324 = !DILocation(line: 199, column: 21, scope: !295)
!325 = !DILocation(line: 201, column: 21, scope: !326)
!326 = distinct !DILexicalBlock(scope: !321, file: !74, line: 200, column: 17)
!327 = !DILocation(line: 203, column: 39, scope: !295)
!328 = !DILocation(line: 203, column: 32, scope: !295)
!329 = !DILocation(line: 203, column: 30, scope: !295)
!330 = !DILocation(line: 204, column: 21, scope: !331)
!331 = distinct !DILexicalBlock(scope: !295, file: !74, line: 204, column: 21)
!332 = !DILocation(line: 204, column: 34, scope: !331)
!333 = !DILocation(line: 204, column: 21, scope: !295)
!334 = !DILocation(line: 206, column: 21, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !74, line: 205, column: 17)
!336 = !DILocation(line: 209, column: 35, scope: !295)
!337 = !DILocation(line: 209, column: 49, scope: !295)
!338 = !DILocation(line: 209, column: 30, scope: !295)
!339 = !DILocation(line: 209, column: 28, scope: !295)
!340 = !DILocation(line: 210, column: 21, scope: !341)
!341 = distinct !DILexicalBlock(scope: !295, file: !74, line: 210, column: 21)
!342 = !DILocation(line: 210, column: 32, scope: !341)
!343 = !DILocation(line: 210, column: 48, scope: !341)
!344 = !DILocation(line: 210, column: 51, scope: !341)
!345 = !DILocation(line: 210, column: 62, scope: !341)
!346 = !DILocation(line: 210, column: 21, scope: !295)
!347 = !DILocation(line: 212, column: 21, scope: !348)
!348 = distinct !DILexicalBlock(scope: !341, file: !74, line: 211, column: 17)
!349 = !DILocation(line: 215, column: 29, scope: !295)
!350 = !DILocation(line: 215, column: 17, scope: !295)
!351 = !DILocation(line: 215, column: 41, scope: !295)
!352 = !DILocation(line: 217, column: 29, scope: !295)
!353 = !DILocation(line: 217, column: 24, scope: !295)
!354 = !DILocation(line: 217, column: 22, scope: !295)
!355 = !DILocation(line: 218, column: 13, scope: !295)
!356 = !DILocation(line: 220, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !282, file: !74, line: 220, column: 17)
!358 = !DILocation(line: 220, column: 30, scope: !357)
!359 = !DILocation(line: 220, column: 17, scope: !282)
!360 = !DILocation(line: 222, column: 30, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !74, line: 221, column: 13)
!362 = !DILocation(line: 222, column: 17, scope: !361)
!363 = !DILocation(line: 223, column: 13, scope: !361)
!364 = !DILocation(line: 224, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !282, file: !74, line: 224, column: 17)
!366 = !DILocation(line: 224, column: 30, scope: !365)
!367 = !DILocation(line: 224, column: 17, scope: !282)
!368 = !DILocation(line: 226, column: 30, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !74, line: 225, column: 13)
!370 = !DILocation(line: 226, column: 17, scope: !369)
!371 = !DILocation(line: 227, column: 13, scope: !369)
!372 = !DILocation(line: 235, column: 9, scope: !283)
!373 = !DILocation(line: 237, column: 5, scope: !276)
!374 = !DILocalVariable(name: "i", scope: !375, file: !74, line: 240, type: !65)
!375 = distinct !DILexicalBlock(scope: !376, file: !74, line: 239, column: 9)
!376 = distinct !DILexicalBlock(scope: !276, file: !74, line: 238, column: 5)
!377 = !DILocation(line: 240, column: 17, scope: !375)
!378 = !DILocalVariable(name: "buffer", scope: !375, file: !74, line: 241, type: !64)
!379 = !DILocation(line: 241, column: 19, scope: !375)
!380 = !DILocation(line: 241, column: 35, scope: !375)
!381 = !DILocation(line: 241, column: 28, scope: !375)
!382 = !DILocation(line: 242, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !375, file: !74, line: 242, column: 17)
!384 = !DILocation(line: 242, column: 24, scope: !383)
!385 = !DILocation(line: 242, column: 17, scope: !375)
!386 = !DILocation(line: 242, column: 34, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !74, line: 242, column: 33)
!388 = !DILocation(line: 244, column: 20, scope: !389)
!389 = distinct !DILexicalBlock(scope: !375, file: !74, line: 244, column: 13)
!390 = !DILocation(line: 244, column: 18, scope: !389)
!391 = !DILocation(line: 244, column: 25, scope: !392)
!392 = distinct !DILexicalBlock(scope: !389, file: !74, line: 244, column: 13)
!393 = !DILocation(line: 244, column: 27, scope: !392)
!394 = !DILocation(line: 244, column: 13, scope: !389)
!395 = !DILocation(line: 246, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !74, line: 245, column: 13)
!397 = !DILocation(line: 246, column: 24, scope: !396)
!398 = !DILocation(line: 246, column: 27, scope: !396)
!399 = !DILocation(line: 247, column: 13, scope: !396)
!400 = !DILocation(line: 244, column: 34, scope: !392)
!401 = !DILocation(line: 244, column: 13, scope: !392)
!402 = distinct !{!402, !394, !403, !221}
!403 = !DILocation(line: 247, column: 13, scope: !389)
!404 = !DILocation(line: 249, column: 17, scope: !405)
!405 = distinct !DILexicalBlock(scope: !375, file: !74, line: 249, column: 17)
!406 = !DILocation(line: 249, column: 22, scope: !405)
!407 = !DILocation(line: 249, column: 27, scope: !405)
!408 = !DILocation(line: 249, column: 30, scope: !405)
!409 = !DILocation(line: 249, column: 35, scope: !405)
!410 = !DILocation(line: 249, column: 17, scope: !375)
!411 = !DILocation(line: 251, column: 17, scope: !412)
!412 = distinct !DILexicalBlock(scope: !405, file: !74, line: 250, column: 13)
!413 = !DILocation(line: 251, column: 24, scope: !412)
!414 = !DILocation(line: 251, column: 30, scope: !412)
!415 = !DILocation(line: 253, column: 23, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !74, line: 253, column: 17)
!417 = !DILocation(line: 253, column: 21, scope: !416)
!418 = !DILocation(line: 253, column: 28, scope: !419)
!419 = distinct !DILexicalBlock(scope: !416, file: !74, line: 253, column: 17)
!420 = !DILocation(line: 253, column: 30, scope: !419)
!421 = !DILocation(line: 253, column: 17, scope: !416)
!422 = !DILocation(line: 255, column: 34, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !74, line: 254, column: 17)
!424 = !DILocation(line: 255, column: 41, scope: !423)
!425 = !DILocation(line: 255, column: 21, scope: !423)
!426 = !DILocation(line: 256, column: 17, scope: !423)
!427 = !DILocation(line: 253, column: 37, scope: !419)
!428 = !DILocation(line: 253, column: 17, scope: !419)
!429 = distinct !{!429, !421, !430, !221}
!430 = !DILocation(line: 256, column: 17, scope: !416)
!431 = !DILocation(line: 257, column: 13, scope: !412)
!432 = !DILocation(line: 260, column: 17, scope: !433)
!433 = distinct !DILexicalBlock(scope: !405, file: !74, line: 259, column: 13)
!434 = !DILocation(line: 262, column: 18, scope: !375)
!435 = !DILocation(line: 262, column: 13, scope: !375)
!436 = !DILocation(line: 264, column: 9, scope: !376)
!437 = !DILocation(line: 266, column: 1, scope: !276)
!438 = distinct !DISubprogram(name: "goodG2B", scope: !74, file: !74, line: 269, type: !75, scopeLine: 270, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!439 = !DILocalVariable(name: "data", scope: !438, file: !74, line: 271, type: !65)
!440 = !DILocation(line: 271, column: 9, scope: !438)
!441 = !DILocation(line: 273, column: 10, scope: !438)
!442 = !DILocation(line: 274, column: 5, scope: !438)
!443 = !DILocation(line: 278, column: 14, scope: !444)
!444 = distinct !DILexicalBlock(scope: !438, file: !74, line: 275, column: 5)
!445 = !DILocation(line: 279, column: 9, scope: !444)
!446 = !DILocation(line: 281, column: 5, scope: !438)
!447 = !DILocalVariable(name: "i", scope: !448, file: !74, line: 284, type: !65)
!448 = distinct !DILexicalBlock(scope: !449, file: !74, line: 283, column: 9)
!449 = distinct !DILexicalBlock(scope: !438, file: !74, line: 282, column: 5)
!450 = !DILocation(line: 284, column: 17, scope: !448)
!451 = !DILocalVariable(name: "buffer", scope: !448, file: !74, line: 285, type: !64)
!452 = !DILocation(line: 285, column: 19, scope: !448)
!453 = !DILocation(line: 285, column: 35, scope: !448)
!454 = !DILocation(line: 285, column: 28, scope: !448)
!455 = !DILocation(line: 286, column: 17, scope: !456)
!456 = distinct !DILexicalBlock(scope: !448, file: !74, line: 286, column: 17)
!457 = !DILocation(line: 286, column: 24, scope: !456)
!458 = !DILocation(line: 286, column: 17, scope: !448)
!459 = !DILocation(line: 286, column: 34, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !74, line: 286, column: 33)
!461 = !DILocation(line: 288, column: 20, scope: !462)
!462 = distinct !DILexicalBlock(scope: !448, file: !74, line: 288, column: 13)
!463 = !DILocation(line: 288, column: 18, scope: !462)
!464 = !DILocation(line: 288, column: 25, scope: !465)
!465 = distinct !DILexicalBlock(scope: !462, file: !74, line: 288, column: 13)
!466 = !DILocation(line: 288, column: 27, scope: !465)
!467 = !DILocation(line: 288, column: 13, scope: !462)
!468 = !DILocation(line: 290, column: 17, scope: !469)
!469 = distinct !DILexicalBlock(scope: !465, file: !74, line: 289, column: 13)
!470 = !DILocation(line: 290, column: 24, scope: !469)
!471 = !DILocation(line: 290, column: 27, scope: !469)
!472 = !DILocation(line: 291, column: 13, scope: !469)
!473 = !DILocation(line: 288, column: 34, scope: !465)
!474 = !DILocation(line: 288, column: 13, scope: !465)
!475 = distinct !{!475, !467, !476, !221}
!476 = !DILocation(line: 291, column: 13, scope: !462)
!477 = !DILocation(line: 294, column: 17, scope: !478)
!478 = distinct !DILexicalBlock(scope: !448, file: !74, line: 294, column: 17)
!479 = !DILocation(line: 294, column: 22, scope: !478)
!480 = !DILocation(line: 294, column: 17, scope: !448)
!481 = !DILocation(line: 296, column: 17, scope: !482)
!482 = distinct !DILexicalBlock(scope: !478, file: !74, line: 295, column: 13)
!483 = !DILocation(line: 296, column: 24, scope: !482)
!484 = !DILocation(line: 296, column: 30, scope: !482)
!485 = !DILocation(line: 298, column: 23, scope: !486)
!486 = distinct !DILexicalBlock(scope: !482, file: !74, line: 298, column: 17)
!487 = !DILocation(line: 298, column: 21, scope: !486)
!488 = !DILocation(line: 298, column: 28, scope: !489)
!489 = distinct !DILexicalBlock(scope: !486, file: !74, line: 298, column: 17)
!490 = !DILocation(line: 298, column: 30, scope: !489)
!491 = !DILocation(line: 298, column: 17, scope: !486)
!492 = !DILocation(line: 300, column: 34, scope: !493)
!493 = distinct !DILexicalBlock(scope: !489, file: !74, line: 299, column: 17)
!494 = !DILocation(line: 300, column: 41, scope: !493)
!495 = !DILocation(line: 300, column: 21, scope: !493)
!496 = !DILocation(line: 301, column: 17, scope: !493)
!497 = !DILocation(line: 298, column: 37, scope: !489)
!498 = !DILocation(line: 298, column: 17, scope: !489)
!499 = distinct !{!499, !491, !500, !221}
!500 = !DILocation(line: 301, column: 17, scope: !486)
!501 = !DILocation(line: 302, column: 13, scope: !482)
!502 = !DILocation(line: 305, column: 17, scope: !503)
!503 = distinct !DILexicalBlock(scope: !478, file: !74, line: 304, column: 13)
!504 = !DILocation(line: 307, column: 18, scope: !448)
!505 = !DILocation(line: 307, column: 13, scope: !448)
!506 = !DILocation(line: 309, column: 9, scope: !449)
!507 = !DILocation(line: 311, column: 1, scope: !438)
