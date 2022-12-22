; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_18.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_18_bad() #0 !dbg !73 {
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
  br label %source, !dbg !81

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !82), !dbg !83
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !84, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !87, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %listenSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %acceptSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  br label %do.body, !dbg !111

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !112
  store i32 %call, i32* %listenSocket, align 4, !dbg !114
  %0 = load i32, i32* %listenSocket, align 4, !dbg !115
  %cmp = icmp eq i32 %0, -1, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !119

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !121
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !122
  store i16 2, i16* %sin_family, align 4, !dbg !123
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !124
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !125
  store i32 0, i32* %s_addr, align 4, !dbg !126
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !127
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !128
  store i16 %call1, i16* %sin_port, align 2, !dbg !129
  %2 = load i32, i32* %listenSocket, align 4, !dbg !130
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !132
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !133
  %cmp3 = icmp eq i32 %call2, -1, !dbg !134
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !135

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !136

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !138
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !140
  %cmp7 = icmp eq i32 %call6, -1, !dbg !141
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !142

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !143

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !145
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !146
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !147
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !148
  %cmp11 = icmp eq i32 %6, -1, !dbg !150
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !151

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !152

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !154
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !156
  %conv = trunc i64 %call14 to i32, !dbg !156
  store i32 %conv, i32* %recvResult, align 4, !dbg !157
  %8 = load i32, i32* %recvResult, align 4, !dbg !158
  %cmp15 = icmp eq i32 %8, -1, !dbg !160
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !161

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !162
  %cmp17 = icmp eq i32 %9, 0, !dbg !163
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !164

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !165

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !167
  %idxprom = sext i32 %10 to i64, !dbg !168
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !170
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !171
  store i32 %call22, i32* %data, align 4, !dbg !172
  br label %do.end, !dbg !173

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !174
  %cmp23 = icmp ne i32 %11, -1, !dbg !176
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !177

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !178
  %call26 = call i32 @close(i32 %12), !dbg !180
  br label %if.end27, !dbg !181

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !182
  %cmp28 = icmp ne i32 %13, -1, !dbg !184
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !185

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !186
  %call31 = call i32 @close(i32 %14), !dbg !188
  br label %if.end32, !dbg !189

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %sink, !dbg !190

sink:                                             ; preds = %if.end32
  call void @llvm.dbg.label(metadata !191), !dbg !192
  call void @llvm.dbg.declare(metadata i32* %i, metadata !193, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !196, metadata !DIExpression()), !dbg !197
  %call33 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !198
  %15 = bitcast i8* %call33 to i32*, !dbg !199
  store i32* %15, i32** %buffer, align 8, !dbg !197
  %16 = load i32*, i32** %buffer, align 8, !dbg !200
  %cmp34 = icmp eq i32* %16, null, !dbg !202
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !203

if.then36:                                        ; preds = %sink
  call void @exit(i32 -1) #11, !dbg !204
  unreachable, !dbg !204

if.end37:                                         ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !208

for.cond:                                         ; preds = %for.inc, %if.end37
  %17 = load i32, i32* %i, align 4, !dbg !209
  %cmp38 = icmp slt i32 %17, 10, !dbg !211
  br i1 %cmp38, label %for.body, label %for.end, !dbg !212

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !213
  %19 = load i32, i32* %i, align 4, !dbg !215
  %idxprom40 = sext i32 %19 to i64, !dbg !213
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !213
  store i32 0, i32* %arrayidx41, align 4, !dbg !216
  br label %for.inc, !dbg !217

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !218
  %inc = add nsw i32 %20, 1, !dbg !218
  store i32 %inc, i32* %i, align 4, !dbg !218
  br label %for.cond, !dbg !219, !llvm.loop !220

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !223
  %cmp42 = icmp sge i32 %21, 0, !dbg !225
  br i1 %cmp42, label %if.then44, label %if.else, !dbg !226

if.then44:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !227
  %23 = load i32, i32* %data, align 4, !dbg !229
  %idxprom45 = sext i32 %23 to i64, !dbg !227
  %arrayidx46 = getelementptr inbounds i32, i32* %22, i64 %idxprom45, !dbg !227
  store i32 1, i32* %arrayidx46, align 4, !dbg !230
  store i32 0, i32* %i, align 4, !dbg !231
  br label %for.cond47, !dbg !233

for.cond47:                                       ; preds = %for.inc53, %if.then44
  %24 = load i32, i32* %i, align 4, !dbg !234
  %cmp48 = icmp slt i32 %24, 10, !dbg !236
  br i1 %cmp48, label %for.body50, label %for.end55, !dbg !237

for.body50:                                       ; preds = %for.cond47
  %25 = load i32*, i32** %buffer, align 8, !dbg !238
  %26 = load i32, i32* %i, align 4, !dbg !240
  %idxprom51 = sext i32 %26 to i64, !dbg !238
  %arrayidx52 = getelementptr inbounds i32, i32* %25, i64 %idxprom51, !dbg !238
  %27 = load i32, i32* %arrayidx52, align 4, !dbg !238
  call void @printIntLine(i32 %27), !dbg !241
  br label %for.inc53, !dbg !242

for.inc53:                                        ; preds = %for.body50
  %28 = load i32, i32* %i, align 4, !dbg !243
  %inc54 = add nsw i32 %28, 1, !dbg !243
  store i32 %inc54, i32* %i, align 4, !dbg !243
  br label %for.cond47, !dbg !244, !llvm.loop !245

for.end55:                                        ; preds = %for.cond47
  br label %if.end56, !dbg !247

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !248
  br label %if.end56

if.end56:                                         ; preds = %if.else, %for.end55
  %29 = load i32*, i32** %buffer, align 8, !dbg !250
  %30 = bitcast i32* %29 to i8*, !dbg !250
  call void @free(i8* %30) #8, !dbg !251
  ret void, !dbg !252
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_18_good() #0 !dbg !253 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_18_good(), !dbg !270
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !271
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !272
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_18_bad(), !dbg !273
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
  br label %source, !dbg !280

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !281), !dbg !282
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !283, metadata !DIExpression()), !dbg !285
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !286, metadata !DIExpression()), !dbg !287
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !288, metadata !DIExpression()), !dbg !289
  store i32 -1, i32* %listenSocket, align 4, !dbg !289
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !290, metadata !DIExpression()), !dbg !291
  store i32 -1, i32* %acceptSocket, align 4, !dbg !291
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !292, metadata !DIExpression()), !dbg !293
  br label %do.body, !dbg !294

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !295
  store i32 %call, i32* %listenSocket, align 4, !dbg !297
  %0 = load i32, i32* %listenSocket, align 4, !dbg !298
  %cmp = icmp eq i32 %0, -1, !dbg !300
  br i1 %cmp, label %if.then, label %if.end, !dbg !301

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !302

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !304
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !304
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !305
  store i16 2, i16* %sin_family, align 4, !dbg !306
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !307
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !308
  store i32 0, i32* %s_addr, align 4, !dbg !309
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !310
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !311
  store i16 %call1, i16* %sin_port, align 2, !dbg !312
  %2 = load i32, i32* %listenSocket, align 4, !dbg !313
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !315
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !316
  %cmp3 = icmp eq i32 %call2, -1, !dbg !317
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !318

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !319

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !321
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !323
  %cmp7 = icmp eq i32 %call6, -1, !dbg !324
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !325

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !326

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !328
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !329
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !330
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !331
  %cmp11 = icmp eq i32 %6, -1, !dbg !333
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !334

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !335

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !337
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !338
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !339
  %conv = trunc i64 %call14 to i32, !dbg !339
  store i32 %conv, i32* %recvResult, align 4, !dbg !340
  %8 = load i32, i32* %recvResult, align 4, !dbg !341
  %cmp15 = icmp eq i32 %8, -1, !dbg !343
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !344

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !345
  %cmp17 = icmp eq i32 %9, 0, !dbg !346
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !347

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !348

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !350
  %idxprom = sext i32 %10 to i64, !dbg !351
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !351
  store i8 0, i8* %arrayidx, align 1, !dbg !352
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !353
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !354
  store i32 %call22, i32* %data, align 4, !dbg !355
  br label %do.end, !dbg !356

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !357
  %cmp23 = icmp ne i32 %11, -1, !dbg !359
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !360

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !361
  %call26 = call i32 @close(i32 %12), !dbg !363
  br label %if.end27, !dbg !364

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !365
  %cmp28 = icmp ne i32 %13, -1, !dbg !367
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !368

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !369
  %call31 = call i32 @close(i32 %14), !dbg !371
  br label %if.end32, !dbg !372

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %sink, !dbg !373

sink:                                             ; preds = %if.end32
  call void @llvm.dbg.label(metadata !374), !dbg !375
  call void @llvm.dbg.declare(metadata i32* %i, metadata !376, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !379, metadata !DIExpression()), !dbg !380
  %call33 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !381
  %15 = bitcast i8* %call33 to i32*, !dbg !382
  store i32* %15, i32** %buffer, align 8, !dbg !380
  %16 = load i32*, i32** %buffer, align 8, !dbg !383
  %cmp34 = icmp eq i32* %16, null, !dbg !385
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !386

if.then36:                                        ; preds = %sink
  call void @exit(i32 -1) #11, !dbg !387
  unreachable, !dbg !387

if.end37:                                         ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !389
  br label %for.cond, !dbg !391

for.cond:                                         ; preds = %for.inc, %if.end37
  %17 = load i32, i32* %i, align 4, !dbg !392
  %cmp38 = icmp slt i32 %17, 10, !dbg !394
  br i1 %cmp38, label %for.body, label %for.end, !dbg !395

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !396
  %19 = load i32, i32* %i, align 4, !dbg !398
  %idxprom40 = sext i32 %19 to i64, !dbg !396
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !396
  store i32 0, i32* %arrayidx41, align 4, !dbg !399
  br label %for.inc, !dbg !400

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !401
  %inc = add nsw i32 %20, 1, !dbg !401
  store i32 %inc, i32* %i, align 4, !dbg !401
  br label %for.cond, !dbg !402, !llvm.loop !403

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !405
  %cmp42 = icmp sge i32 %21, 0, !dbg !407
  br i1 %cmp42, label %land.lhs.true, label %if.else, !dbg !408

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !409
  %cmp44 = icmp slt i32 %22, 10, !dbg !410
  br i1 %cmp44, label %if.then46, label %if.else, !dbg !411

if.then46:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !412
  %24 = load i32, i32* %data, align 4, !dbg !414
  %idxprom47 = sext i32 %24 to i64, !dbg !412
  %arrayidx48 = getelementptr inbounds i32, i32* %23, i64 %idxprom47, !dbg !412
  store i32 1, i32* %arrayidx48, align 4, !dbg !415
  store i32 0, i32* %i, align 4, !dbg !416
  br label %for.cond49, !dbg !418

for.cond49:                                       ; preds = %for.inc55, %if.then46
  %25 = load i32, i32* %i, align 4, !dbg !419
  %cmp50 = icmp slt i32 %25, 10, !dbg !421
  br i1 %cmp50, label %for.body52, label %for.end57, !dbg !422

for.body52:                                       ; preds = %for.cond49
  %26 = load i32*, i32** %buffer, align 8, !dbg !423
  %27 = load i32, i32* %i, align 4, !dbg !425
  %idxprom53 = sext i32 %27 to i64, !dbg !423
  %arrayidx54 = getelementptr inbounds i32, i32* %26, i64 %idxprom53, !dbg !423
  %28 = load i32, i32* %arrayidx54, align 4, !dbg !423
  call void @printIntLine(i32 %28), !dbg !426
  br label %for.inc55, !dbg !427

for.inc55:                                        ; preds = %for.body52
  %29 = load i32, i32* %i, align 4, !dbg !428
  %inc56 = add nsw i32 %29, 1, !dbg !428
  store i32 %inc56, i32* %i, align 4, !dbg !428
  br label %for.cond49, !dbg !429, !llvm.loop !430

for.end57:                                        ; preds = %for.cond49
  br label %if.end58, !dbg !432

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !433
  br label %if.end58

if.end58:                                         ; preds = %if.else, %for.end57
  %30 = load i32*, i32** %buffer, align 8, !dbg !435
  %31 = bitcast i32* %30 to i8*, !dbg !435
  call void @free(i8* %31) #8, !dbg !436
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
  br label %source, !dbg !442

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !443), !dbg !444
  store i32 7, i32* %data, align 4, !dbg !445
  br label %sink, !dbg !446

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !447), !dbg !448
  call void @llvm.dbg.declare(metadata i32* %i, metadata !449, metadata !DIExpression()), !dbg !451
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !452, metadata !DIExpression()), !dbg !453
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !454
  %0 = bitcast i8* %call to i32*, !dbg !455
  store i32* %0, i32** %buffer, align 8, !dbg !453
  %1 = load i32*, i32** %buffer, align 8, !dbg !456
  %cmp = icmp eq i32* %1, null, !dbg !458
  br i1 %cmp, label %if.then, label %if.end, !dbg !459

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #11, !dbg !460
  unreachable, !dbg !460

if.end:                                           ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !462
  br label %for.cond, !dbg !464

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !465
  %cmp1 = icmp slt i32 %2, 10, !dbg !467
  br i1 %cmp1, label %for.body, label %for.end, !dbg !468

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !469
  %4 = load i32, i32* %i, align 4, !dbg !471
  %idxprom = sext i32 %4 to i64, !dbg !469
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !469
  store i32 0, i32* %arrayidx, align 4, !dbg !472
  br label %for.inc, !dbg !473

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !474
  %inc = add nsw i32 %5, 1, !dbg !474
  store i32 %inc, i32* %i, align 4, !dbg !474
  br label %for.cond, !dbg !475, !llvm.loop !476

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !478
  %cmp2 = icmp sge i32 %6, 0, !dbg !480
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !481

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !482
  %8 = load i32, i32* %data, align 4, !dbg !484
  %idxprom4 = sext i32 %8 to i64, !dbg !482
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !482
  store i32 1, i32* %arrayidx5, align 4, !dbg !485
  store i32 0, i32* %i, align 4, !dbg !486
  br label %for.cond6, !dbg !488

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !489
  %cmp7 = icmp slt i32 %9, 10, !dbg !491
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !492

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !493
  %11 = load i32, i32* %i, align 4, !dbg !495
  %idxprom9 = sext i32 %11 to i64, !dbg !493
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !493
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !493
  call void @printIntLine(i32 %12), !dbg !496
  br label %for.inc11, !dbg !497

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !498
  %inc12 = add nsw i32 %13, 1, !dbg !498
  store i32 %inc12, i32* %i, align 4, !dbg !498
  br label %for.cond6, !dbg !499, !llvm.loop !500

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !502

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !503
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !505
  %15 = bitcast i32* %14 to i8*, !dbg !505
  call void @free(i8* %15) #8, !dbg !506
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_18.c", directory: "/root/SSE-Assessment")
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
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_18_bad", scope: !74, file: !74, line: 44, type: !75, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_18.c", directory: "/root/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 46, type: !65)
!79 = !DILocation(line: 46, column: 9, scope: !73)
!80 = !DILocation(line: 48, column: 10, scope: !73)
!81 = !DILocation(line: 49, column: 5, scope: !73)
!82 = !DILabel(scope: !73, name: "source", file: !74, line: 50)
!83 = !DILocation(line: 50, column: 1, scope: !73)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !74, line: 56, type: !65)
!85 = distinct !DILexicalBlock(scope: !73, file: !74, line: 51, column: 5)
!86 = !DILocation(line: 56, column: 13, scope: !85)
!87 = !DILocalVariable(name: "service", scope: !85, file: !74, line: 57, type: !88)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !89)
!89 = !{!90, !91, !95, !99}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !88, file: !17, line: 239, baseType: !56, size: 16)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !88, file: !17, line: 240, baseType: !92, size: 16, offset: 16)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !88, file: !17, line: 241, baseType: !96, size: 32, offset: 32)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !97)
!97 = !{!98}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !96, file: !17, line: 33, baseType: !46, size: 32)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !88, file: !17, line: 244, baseType: !100, size: 64, offset: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 64, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 8)
!104 = !DILocation(line: 57, column: 28, scope: !85)
!105 = !DILocalVariable(name: "listenSocket", scope: !85, file: !74, line: 58, type: !65)
!106 = !DILocation(line: 58, column: 16, scope: !85)
!107 = !DILocalVariable(name: "acceptSocket", scope: !85, file: !74, line: 59, type: !65)
!108 = !DILocation(line: 59, column: 16, scope: !85)
!109 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !74, line: 60, type: !60)
!110 = !DILocation(line: 60, column: 14, scope: !85)
!111 = !DILocation(line: 61, column: 9, scope: !85)
!112 = !DILocation(line: 71, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !85, file: !74, line: 62, column: 9)
!114 = !DILocation(line: 71, column: 26, scope: !113)
!115 = !DILocation(line: 72, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !74, line: 72, column: 17)
!117 = !DILocation(line: 72, column: 30, scope: !116)
!118 = !DILocation(line: 72, column: 17, scope: !113)
!119 = !DILocation(line: 74, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !74, line: 73, column: 13)
!121 = !DILocation(line: 76, column: 13, scope: !113)
!122 = !DILocation(line: 77, column: 21, scope: !113)
!123 = !DILocation(line: 77, column: 32, scope: !113)
!124 = !DILocation(line: 78, column: 21, scope: !113)
!125 = !DILocation(line: 78, column: 30, scope: !113)
!126 = !DILocation(line: 78, column: 37, scope: !113)
!127 = !DILocation(line: 79, column: 32, scope: !113)
!128 = !DILocation(line: 79, column: 21, scope: !113)
!129 = !DILocation(line: 79, column: 30, scope: !113)
!130 = !DILocation(line: 80, column: 22, scope: !131)
!131 = distinct !DILexicalBlock(scope: !113, file: !74, line: 80, column: 17)
!132 = !DILocation(line: 80, column: 36, scope: !131)
!133 = !DILocation(line: 80, column: 17, scope: !131)
!134 = !DILocation(line: 80, column: 81, scope: !131)
!135 = !DILocation(line: 80, column: 17, scope: !113)
!136 = !DILocation(line: 82, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !74, line: 81, column: 13)
!138 = !DILocation(line: 84, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !113, file: !74, line: 84, column: 17)
!140 = !DILocation(line: 84, column: 17, scope: !139)
!141 = !DILocation(line: 84, column: 54, scope: !139)
!142 = !DILocation(line: 84, column: 17, scope: !113)
!143 = !DILocation(line: 86, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !74, line: 85, column: 13)
!145 = !DILocation(line: 88, column: 35, scope: !113)
!146 = !DILocation(line: 88, column: 28, scope: !113)
!147 = !DILocation(line: 88, column: 26, scope: !113)
!148 = !DILocation(line: 89, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !113, file: !74, line: 89, column: 17)
!150 = !DILocation(line: 89, column: 30, scope: !149)
!151 = !DILocation(line: 89, column: 17, scope: !113)
!152 = !DILocation(line: 91, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !74, line: 90, column: 13)
!154 = !DILocation(line: 94, column: 31, scope: !113)
!155 = !DILocation(line: 94, column: 45, scope: !113)
!156 = !DILocation(line: 94, column: 26, scope: !113)
!157 = !DILocation(line: 94, column: 24, scope: !113)
!158 = !DILocation(line: 95, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !113, file: !74, line: 95, column: 17)
!160 = !DILocation(line: 95, column: 28, scope: !159)
!161 = !DILocation(line: 95, column: 44, scope: !159)
!162 = !DILocation(line: 95, column: 47, scope: !159)
!163 = !DILocation(line: 95, column: 58, scope: !159)
!164 = !DILocation(line: 95, column: 17, scope: !113)
!165 = !DILocation(line: 97, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !74, line: 96, column: 13)
!167 = !DILocation(line: 100, column: 25, scope: !113)
!168 = !DILocation(line: 100, column: 13, scope: !113)
!169 = !DILocation(line: 100, column: 37, scope: !113)
!170 = !DILocation(line: 102, column: 25, scope: !113)
!171 = !DILocation(line: 102, column: 20, scope: !113)
!172 = !DILocation(line: 102, column: 18, scope: !113)
!173 = !DILocation(line: 103, column: 9, scope: !113)
!174 = !DILocation(line: 105, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !85, file: !74, line: 105, column: 13)
!176 = !DILocation(line: 105, column: 26, scope: !175)
!177 = !DILocation(line: 105, column: 13, scope: !85)
!178 = !DILocation(line: 107, column: 26, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !74, line: 106, column: 9)
!180 = !DILocation(line: 107, column: 13, scope: !179)
!181 = !DILocation(line: 108, column: 9, scope: !179)
!182 = !DILocation(line: 109, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !85, file: !74, line: 109, column: 13)
!184 = !DILocation(line: 109, column: 26, scope: !183)
!185 = !DILocation(line: 109, column: 13, scope: !85)
!186 = !DILocation(line: 111, column: 26, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !74, line: 110, column: 9)
!188 = !DILocation(line: 111, column: 13, scope: !187)
!189 = !DILocation(line: 112, column: 9, scope: !187)
!190 = !DILocation(line: 120, column: 5, scope: !73)
!191 = !DILabel(scope: !73, name: "sink", file: !74, line: 121)
!192 = !DILocation(line: 121, column: 1, scope: !73)
!193 = !DILocalVariable(name: "i", scope: !194, file: !74, line: 123, type: !65)
!194 = distinct !DILexicalBlock(scope: !73, file: !74, line: 122, column: 5)
!195 = !DILocation(line: 123, column: 13, scope: !194)
!196 = !DILocalVariable(name: "buffer", scope: !194, file: !74, line: 124, type: !64)
!197 = !DILocation(line: 124, column: 15, scope: !194)
!198 = !DILocation(line: 124, column: 31, scope: !194)
!199 = !DILocation(line: 124, column: 24, scope: !194)
!200 = !DILocation(line: 125, column: 13, scope: !201)
!201 = distinct !DILexicalBlock(scope: !194, file: !74, line: 125, column: 13)
!202 = !DILocation(line: 125, column: 20, scope: !201)
!203 = !DILocation(line: 125, column: 13, scope: !194)
!204 = !DILocation(line: 125, column: 30, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !74, line: 125, column: 29)
!206 = !DILocation(line: 127, column: 16, scope: !207)
!207 = distinct !DILexicalBlock(scope: !194, file: !74, line: 127, column: 9)
!208 = !DILocation(line: 127, column: 14, scope: !207)
!209 = !DILocation(line: 127, column: 21, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !74, line: 127, column: 9)
!211 = !DILocation(line: 127, column: 23, scope: !210)
!212 = !DILocation(line: 127, column: 9, scope: !207)
!213 = !DILocation(line: 129, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !74, line: 128, column: 9)
!215 = !DILocation(line: 129, column: 20, scope: !214)
!216 = !DILocation(line: 129, column: 23, scope: !214)
!217 = !DILocation(line: 130, column: 9, scope: !214)
!218 = !DILocation(line: 127, column: 30, scope: !210)
!219 = !DILocation(line: 127, column: 9, scope: !210)
!220 = distinct !{!220, !212, !221, !222}
!221 = !DILocation(line: 130, column: 9, scope: !207)
!222 = !{!"llvm.loop.mustprogress"}
!223 = !DILocation(line: 133, column: 13, scope: !224)
!224 = distinct !DILexicalBlock(scope: !194, file: !74, line: 133, column: 13)
!225 = !DILocation(line: 133, column: 18, scope: !224)
!226 = !DILocation(line: 133, column: 13, scope: !194)
!227 = !DILocation(line: 135, column: 13, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !74, line: 134, column: 9)
!229 = !DILocation(line: 135, column: 20, scope: !228)
!230 = !DILocation(line: 135, column: 26, scope: !228)
!231 = !DILocation(line: 137, column: 19, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !74, line: 137, column: 13)
!233 = !DILocation(line: 137, column: 17, scope: !232)
!234 = !DILocation(line: 137, column: 24, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !74, line: 137, column: 13)
!236 = !DILocation(line: 137, column: 26, scope: !235)
!237 = !DILocation(line: 137, column: 13, scope: !232)
!238 = !DILocation(line: 139, column: 30, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !74, line: 138, column: 13)
!240 = !DILocation(line: 139, column: 37, scope: !239)
!241 = !DILocation(line: 139, column: 17, scope: !239)
!242 = !DILocation(line: 140, column: 13, scope: !239)
!243 = !DILocation(line: 137, column: 33, scope: !235)
!244 = !DILocation(line: 137, column: 13, scope: !235)
!245 = distinct !{!245, !237, !246, !222}
!246 = !DILocation(line: 140, column: 13, scope: !232)
!247 = !DILocation(line: 141, column: 9, scope: !228)
!248 = !DILocation(line: 144, column: 13, scope: !249)
!249 = distinct !DILexicalBlock(scope: !224, file: !74, line: 143, column: 9)
!250 = !DILocation(line: 146, column: 14, scope: !194)
!251 = !DILocation(line: 146, column: 9, scope: !194)
!252 = !DILocation(line: 148, column: 1, scope: !73)
!253 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_18_good", scope: !74, file: !74, line: 301, type: !75, scopeLine: 302, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!254 = !DILocation(line: 303, column: 5, scope: !253)
!255 = !DILocation(line: 304, column: 5, scope: !253)
!256 = !DILocation(line: 305, column: 1, scope: !253)
!257 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 316, type: !258, scopeLine: 317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!258 = !DISubroutineType(types: !259)
!259 = !{!65, !65, !260}
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !261, size: 64)
!261 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!262 = !DILocalVariable(name: "argc", arg: 1, scope: !257, file: !74, line: 316, type: !65)
!263 = !DILocation(line: 316, column: 14, scope: !257)
!264 = !DILocalVariable(name: "argv", arg: 2, scope: !257, file: !74, line: 316, type: !260)
!265 = !DILocation(line: 316, column: 27, scope: !257)
!266 = !DILocation(line: 319, column: 22, scope: !257)
!267 = !DILocation(line: 319, column: 12, scope: !257)
!268 = !DILocation(line: 319, column: 5, scope: !257)
!269 = !DILocation(line: 321, column: 5, scope: !257)
!270 = !DILocation(line: 322, column: 5, scope: !257)
!271 = !DILocation(line: 323, column: 5, scope: !257)
!272 = !DILocation(line: 326, column: 5, scope: !257)
!273 = !DILocation(line: 327, column: 5, scope: !257)
!274 = !DILocation(line: 328, column: 5, scope: !257)
!275 = !DILocation(line: 330, column: 5, scope: !257)
!276 = distinct !DISubprogram(name: "goodB2G", scope: !74, file: !74, line: 155, type: !75, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!277 = !DILocalVariable(name: "data", scope: !276, file: !74, line: 157, type: !65)
!278 = !DILocation(line: 157, column: 9, scope: !276)
!279 = !DILocation(line: 159, column: 10, scope: !276)
!280 = !DILocation(line: 160, column: 5, scope: !276)
!281 = !DILabel(scope: !276, name: "source", file: !74, line: 161)
!282 = !DILocation(line: 161, column: 1, scope: !276)
!283 = !DILocalVariable(name: "recvResult", scope: !284, file: !74, line: 167, type: !65)
!284 = distinct !DILexicalBlock(scope: !276, file: !74, line: 162, column: 5)
!285 = !DILocation(line: 167, column: 13, scope: !284)
!286 = !DILocalVariable(name: "service", scope: !284, file: !74, line: 168, type: !88)
!287 = !DILocation(line: 168, column: 28, scope: !284)
!288 = !DILocalVariable(name: "listenSocket", scope: !284, file: !74, line: 169, type: !65)
!289 = !DILocation(line: 169, column: 16, scope: !284)
!290 = !DILocalVariable(name: "acceptSocket", scope: !284, file: !74, line: 170, type: !65)
!291 = !DILocation(line: 170, column: 16, scope: !284)
!292 = !DILocalVariable(name: "inputBuffer", scope: !284, file: !74, line: 171, type: !60)
!293 = !DILocation(line: 171, column: 14, scope: !284)
!294 = !DILocation(line: 172, column: 9, scope: !284)
!295 = !DILocation(line: 182, column: 28, scope: !296)
!296 = distinct !DILexicalBlock(scope: !284, file: !74, line: 173, column: 9)
!297 = !DILocation(line: 182, column: 26, scope: !296)
!298 = !DILocation(line: 183, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !296, file: !74, line: 183, column: 17)
!300 = !DILocation(line: 183, column: 30, scope: !299)
!301 = !DILocation(line: 183, column: 17, scope: !296)
!302 = !DILocation(line: 185, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !74, line: 184, column: 13)
!304 = !DILocation(line: 187, column: 13, scope: !296)
!305 = !DILocation(line: 188, column: 21, scope: !296)
!306 = !DILocation(line: 188, column: 32, scope: !296)
!307 = !DILocation(line: 189, column: 21, scope: !296)
!308 = !DILocation(line: 189, column: 30, scope: !296)
!309 = !DILocation(line: 189, column: 37, scope: !296)
!310 = !DILocation(line: 190, column: 32, scope: !296)
!311 = !DILocation(line: 190, column: 21, scope: !296)
!312 = !DILocation(line: 190, column: 30, scope: !296)
!313 = !DILocation(line: 191, column: 22, scope: !314)
!314 = distinct !DILexicalBlock(scope: !296, file: !74, line: 191, column: 17)
!315 = !DILocation(line: 191, column: 36, scope: !314)
!316 = !DILocation(line: 191, column: 17, scope: !314)
!317 = !DILocation(line: 191, column: 81, scope: !314)
!318 = !DILocation(line: 191, column: 17, scope: !296)
!319 = !DILocation(line: 193, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !314, file: !74, line: 192, column: 13)
!321 = !DILocation(line: 195, column: 24, scope: !322)
!322 = distinct !DILexicalBlock(scope: !296, file: !74, line: 195, column: 17)
!323 = !DILocation(line: 195, column: 17, scope: !322)
!324 = !DILocation(line: 195, column: 54, scope: !322)
!325 = !DILocation(line: 195, column: 17, scope: !296)
!326 = !DILocation(line: 197, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !322, file: !74, line: 196, column: 13)
!328 = !DILocation(line: 199, column: 35, scope: !296)
!329 = !DILocation(line: 199, column: 28, scope: !296)
!330 = !DILocation(line: 199, column: 26, scope: !296)
!331 = !DILocation(line: 200, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !296, file: !74, line: 200, column: 17)
!333 = !DILocation(line: 200, column: 30, scope: !332)
!334 = !DILocation(line: 200, column: 17, scope: !296)
!335 = !DILocation(line: 202, column: 17, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !74, line: 201, column: 13)
!337 = !DILocation(line: 205, column: 31, scope: !296)
!338 = !DILocation(line: 205, column: 45, scope: !296)
!339 = !DILocation(line: 205, column: 26, scope: !296)
!340 = !DILocation(line: 205, column: 24, scope: !296)
!341 = !DILocation(line: 206, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !296, file: !74, line: 206, column: 17)
!343 = !DILocation(line: 206, column: 28, scope: !342)
!344 = !DILocation(line: 206, column: 44, scope: !342)
!345 = !DILocation(line: 206, column: 47, scope: !342)
!346 = !DILocation(line: 206, column: 58, scope: !342)
!347 = !DILocation(line: 206, column: 17, scope: !296)
!348 = !DILocation(line: 208, column: 17, scope: !349)
!349 = distinct !DILexicalBlock(scope: !342, file: !74, line: 207, column: 13)
!350 = !DILocation(line: 211, column: 25, scope: !296)
!351 = !DILocation(line: 211, column: 13, scope: !296)
!352 = !DILocation(line: 211, column: 37, scope: !296)
!353 = !DILocation(line: 213, column: 25, scope: !296)
!354 = !DILocation(line: 213, column: 20, scope: !296)
!355 = !DILocation(line: 213, column: 18, scope: !296)
!356 = !DILocation(line: 214, column: 9, scope: !296)
!357 = !DILocation(line: 216, column: 13, scope: !358)
!358 = distinct !DILexicalBlock(scope: !284, file: !74, line: 216, column: 13)
!359 = !DILocation(line: 216, column: 26, scope: !358)
!360 = !DILocation(line: 216, column: 13, scope: !284)
!361 = !DILocation(line: 218, column: 26, scope: !362)
!362 = distinct !DILexicalBlock(scope: !358, file: !74, line: 217, column: 9)
!363 = !DILocation(line: 218, column: 13, scope: !362)
!364 = !DILocation(line: 219, column: 9, scope: !362)
!365 = !DILocation(line: 220, column: 13, scope: !366)
!366 = distinct !DILexicalBlock(scope: !284, file: !74, line: 220, column: 13)
!367 = !DILocation(line: 220, column: 26, scope: !366)
!368 = !DILocation(line: 220, column: 13, scope: !284)
!369 = !DILocation(line: 222, column: 26, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !74, line: 221, column: 9)
!371 = !DILocation(line: 222, column: 13, scope: !370)
!372 = !DILocation(line: 223, column: 9, scope: !370)
!373 = !DILocation(line: 231, column: 5, scope: !276)
!374 = !DILabel(scope: !276, name: "sink", file: !74, line: 232)
!375 = !DILocation(line: 232, column: 1, scope: !276)
!376 = !DILocalVariable(name: "i", scope: !377, file: !74, line: 234, type: !65)
!377 = distinct !DILexicalBlock(scope: !276, file: !74, line: 233, column: 5)
!378 = !DILocation(line: 234, column: 13, scope: !377)
!379 = !DILocalVariable(name: "buffer", scope: !377, file: !74, line: 235, type: !64)
!380 = !DILocation(line: 235, column: 15, scope: !377)
!381 = !DILocation(line: 235, column: 31, scope: !377)
!382 = !DILocation(line: 235, column: 24, scope: !377)
!383 = !DILocation(line: 236, column: 13, scope: !384)
!384 = distinct !DILexicalBlock(scope: !377, file: !74, line: 236, column: 13)
!385 = !DILocation(line: 236, column: 20, scope: !384)
!386 = !DILocation(line: 236, column: 13, scope: !377)
!387 = !DILocation(line: 236, column: 30, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !74, line: 236, column: 29)
!389 = !DILocation(line: 238, column: 16, scope: !390)
!390 = distinct !DILexicalBlock(scope: !377, file: !74, line: 238, column: 9)
!391 = !DILocation(line: 238, column: 14, scope: !390)
!392 = !DILocation(line: 238, column: 21, scope: !393)
!393 = distinct !DILexicalBlock(scope: !390, file: !74, line: 238, column: 9)
!394 = !DILocation(line: 238, column: 23, scope: !393)
!395 = !DILocation(line: 238, column: 9, scope: !390)
!396 = !DILocation(line: 240, column: 13, scope: !397)
!397 = distinct !DILexicalBlock(scope: !393, file: !74, line: 239, column: 9)
!398 = !DILocation(line: 240, column: 20, scope: !397)
!399 = !DILocation(line: 240, column: 23, scope: !397)
!400 = !DILocation(line: 241, column: 9, scope: !397)
!401 = !DILocation(line: 238, column: 30, scope: !393)
!402 = !DILocation(line: 238, column: 9, scope: !393)
!403 = distinct !{!403, !395, !404, !222}
!404 = !DILocation(line: 241, column: 9, scope: !390)
!405 = !DILocation(line: 243, column: 13, scope: !406)
!406 = distinct !DILexicalBlock(scope: !377, file: !74, line: 243, column: 13)
!407 = !DILocation(line: 243, column: 18, scope: !406)
!408 = !DILocation(line: 243, column: 23, scope: !406)
!409 = !DILocation(line: 243, column: 26, scope: !406)
!410 = !DILocation(line: 243, column: 31, scope: !406)
!411 = !DILocation(line: 243, column: 13, scope: !377)
!412 = !DILocation(line: 245, column: 13, scope: !413)
!413 = distinct !DILexicalBlock(scope: !406, file: !74, line: 244, column: 9)
!414 = !DILocation(line: 245, column: 20, scope: !413)
!415 = !DILocation(line: 245, column: 26, scope: !413)
!416 = !DILocation(line: 247, column: 19, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !74, line: 247, column: 13)
!418 = !DILocation(line: 247, column: 17, scope: !417)
!419 = !DILocation(line: 247, column: 24, scope: !420)
!420 = distinct !DILexicalBlock(scope: !417, file: !74, line: 247, column: 13)
!421 = !DILocation(line: 247, column: 26, scope: !420)
!422 = !DILocation(line: 247, column: 13, scope: !417)
!423 = !DILocation(line: 249, column: 30, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !74, line: 248, column: 13)
!425 = !DILocation(line: 249, column: 37, scope: !424)
!426 = !DILocation(line: 249, column: 17, scope: !424)
!427 = !DILocation(line: 250, column: 13, scope: !424)
!428 = !DILocation(line: 247, column: 33, scope: !420)
!429 = !DILocation(line: 247, column: 13, scope: !420)
!430 = distinct !{!430, !422, !431, !222}
!431 = !DILocation(line: 250, column: 13, scope: !417)
!432 = !DILocation(line: 251, column: 9, scope: !413)
!433 = !DILocation(line: 254, column: 13, scope: !434)
!434 = distinct !DILexicalBlock(scope: !406, file: !74, line: 253, column: 9)
!435 = !DILocation(line: 256, column: 14, scope: !377)
!436 = !DILocation(line: 256, column: 9, scope: !377)
!437 = !DILocation(line: 258, column: 1, scope: !276)
!438 = distinct !DISubprogram(name: "goodG2B", scope: !74, file: !74, line: 261, type: !75, scopeLine: 262, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!439 = !DILocalVariable(name: "data", scope: !438, file: !74, line: 263, type: !65)
!440 = !DILocation(line: 263, column: 9, scope: !438)
!441 = !DILocation(line: 265, column: 10, scope: !438)
!442 = !DILocation(line: 266, column: 5, scope: !438)
!443 = !DILabel(scope: !438, name: "source", file: !74, line: 267)
!444 = !DILocation(line: 267, column: 1, scope: !438)
!445 = !DILocation(line: 270, column: 10, scope: !438)
!446 = !DILocation(line: 271, column: 5, scope: !438)
!447 = !DILabel(scope: !438, name: "sink", file: !74, line: 272)
!448 = !DILocation(line: 272, column: 1, scope: !438)
!449 = !DILocalVariable(name: "i", scope: !450, file: !74, line: 274, type: !65)
!450 = distinct !DILexicalBlock(scope: !438, file: !74, line: 273, column: 5)
!451 = !DILocation(line: 274, column: 13, scope: !450)
!452 = !DILocalVariable(name: "buffer", scope: !450, file: !74, line: 275, type: !64)
!453 = !DILocation(line: 275, column: 15, scope: !450)
!454 = !DILocation(line: 275, column: 31, scope: !450)
!455 = !DILocation(line: 275, column: 24, scope: !450)
!456 = !DILocation(line: 276, column: 13, scope: !457)
!457 = distinct !DILexicalBlock(scope: !450, file: !74, line: 276, column: 13)
!458 = !DILocation(line: 276, column: 20, scope: !457)
!459 = !DILocation(line: 276, column: 13, scope: !450)
!460 = !DILocation(line: 276, column: 30, scope: !461)
!461 = distinct !DILexicalBlock(scope: !457, file: !74, line: 276, column: 29)
!462 = !DILocation(line: 278, column: 16, scope: !463)
!463 = distinct !DILexicalBlock(scope: !450, file: !74, line: 278, column: 9)
!464 = !DILocation(line: 278, column: 14, scope: !463)
!465 = !DILocation(line: 278, column: 21, scope: !466)
!466 = distinct !DILexicalBlock(scope: !463, file: !74, line: 278, column: 9)
!467 = !DILocation(line: 278, column: 23, scope: !466)
!468 = !DILocation(line: 278, column: 9, scope: !463)
!469 = !DILocation(line: 280, column: 13, scope: !470)
!470 = distinct !DILexicalBlock(scope: !466, file: !74, line: 279, column: 9)
!471 = !DILocation(line: 280, column: 20, scope: !470)
!472 = !DILocation(line: 280, column: 23, scope: !470)
!473 = !DILocation(line: 281, column: 9, scope: !470)
!474 = !DILocation(line: 278, column: 30, scope: !466)
!475 = !DILocation(line: 278, column: 9, scope: !466)
!476 = distinct !{!476, !468, !477, !222}
!477 = !DILocation(line: 281, column: 9, scope: !463)
!478 = !DILocation(line: 284, column: 13, scope: !479)
!479 = distinct !DILexicalBlock(scope: !450, file: !74, line: 284, column: 13)
!480 = !DILocation(line: 284, column: 18, scope: !479)
!481 = !DILocation(line: 284, column: 13, scope: !450)
!482 = !DILocation(line: 286, column: 13, scope: !483)
!483 = distinct !DILexicalBlock(scope: !479, file: !74, line: 285, column: 9)
!484 = !DILocation(line: 286, column: 20, scope: !483)
!485 = !DILocation(line: 286, column: 26, scope: !483)
!486 = !DILocation(line: 288, column: 19, scope: !487)
!487 = distinct !DILexicalBlock(scope: !483, file: !74, line: 288, column: 13)
!488 = !DILocation(line: 288, column: 17, scope: !487)
!489 = !DILocation(line: 288, column: 24, scope: !490)
!490 = distinct !DILexicalBlock(scope: !487, file: !74, line: 288, column: 13)
!491 = !DILocation(line: 288, column: 26, scope: !490)
!492 = !DILocation(line: 288, column: 13, scope: !487)
!493 = !DILocation(line: 290, column: 30, scope: !494)
!494 = distinct !DILexicalBlock(scope: !490, file: !74, line: 289, column: 13)
!495 = !DILocation(line: 290, column: 37, scope: !494)
!496 = !DILocation(line: 290, column: 17, scope: !494)
!497 = !DILocation(line: 291, column: 13, scope: !494)
!498 = !DILocation(line: 288, column: 33, scope: !490)
!499 = !DILocation(line: 288, column: 13, scope: !490)
!500 = distinct !{!500, !492, !501, !222}
!501 = !DILocation(line: 291, column: 13, scope: !487)
!502 = !DILocation(line: 292, column: 9, scope: !483)
!503 = !DILocation(line: 295, column: 13, scope: !504)
!504 = distinct !DILexicalBlock(scope: !479, file: !74, line: 294, column: 9)
!505 = !DILocation(line: 297, column: 14, scope: !450)
!506 = !DILocation(line: 297, column: 9, scope: !450)
!507 = !DILocation(line: 299, column: 1, scope: !438)
