; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType = type { i32 }
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data33 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType* %myUnion, metadata !78, metadata !DIExpression()), !dbg !84
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
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !114
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
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !129
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !130
  store i16 %call1, i16* %sin_port, align 2, !dbg !131
  %2 = load i32, i32* %listenSocket, align 4, !dbg !132
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !134
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !135
  %cmp3 = icmp eq i32 %call2, -1, !dbg !136
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !137

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !138

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !142
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
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !173
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
  %15 = load i32, i32* %data, align 4, !dbg !192
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !193
  store i32 %15, i32* %unionFirst, align 4, !dbg !194
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !195, metadata !DIExpression()), !dbg !197
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !198
  %16 = load i32, i32* %unionSecond, align 4, !dbg !198
  store i32 %16, i32* %data33, align 4, !dbg !197
  call void @llvm.dbg.declare(metadata i32* %i, metadata !199, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !202, metadata !DIExpression()), !dbg !206
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !206
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !206
  %18 = load i32, i32* %data33, align 4, !dbg !207
  %cmp34 = icmp sge i32 %18, 0, !dbg !209
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !210

if.then36:                                        ; preds = %if.end32
  %19 = load i32, i32* %data33, align 4, !dbg !211
  %idxprom37 = sext i32 %19 to i64, !dbg !213
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !213
  store i32 1, i32* %arrayidx38, align 4, !dbg !214
  store i32 0, i32* %i, align 4, !dbg !215
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc, %if.then36
  %20 = load i32, i32* %i, align 4, !dbg !218
  %cmp39 = icmp slt i32 %20, 10, !dbg !220
  br i1 %cmp39, label %for.body, label %for.end, !dbg !221

for.body:                                         ; preds = %for.cond
  %21 = load i32, i32* %i, align 4, !dbg !222
  %idxprom41 = sext i32 %21 to i64, !dbg !224
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !224
  %22 = load i32, i32* %arrayidx42, align 4, !dbg !224
  call void @printIntLine(i32 %22), !dbg !225
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %i, align 4, !dbg !227
  %inc = add nsw i32 %23, 1, !dbg !227
  store i32 %inc, i32* %i, align 4, !dbg !227
  br label %for.cond, !dbg !228, !llvm.loop !229

for.end:                                          ; preds = %for.cond
  br label %if.end43, !dbg !232

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !233
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end
  ret void, !dbg !235
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_good() #0 !dbg !236 {
entry:
  call void @goodG2B(), !dbg !237
  call void @goodB2G(), !dbg !238
  ret void, !dbg !239
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !240 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !245, metadata !DIExpression()), !dbg !246
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !247, metadata !DIExpression()), !dbg !248
  %call = call i64 @time(i64* null) #7, !dbg !249
  %conv = trunc i64 %call to i32, !dbg !250
  call void @srand(i32 %conv) #7, !dbg !251
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !252
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_good(), !dbg !253
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !254
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !255
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_bad(), !dbg !256
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !257
  ret i32 0, !dbg !258
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !259 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType* %myUnion, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %data, align 4, !dbg !264
  store i32 7, i32* %data, align 4, !dbg !265
  %0 = load i32, i32* %data, align 4, !dbg !266
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !267
  store i32 %0, i32* %unionFirst, align 4, !dbg !268
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !269, metadata !DIExpression()), !dbg !271
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !272
  %1 = load i32, i32* %unionSecond, align 4, !dbg !272
  store i32 %1, i32* %data1, align 4, !dbg !271
  call void @llvm.dbg.declare(metadata i32* %i, metadata !273, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !276, metadata !DIExpression()), !dbg !277
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !277
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !277
  %3 = load i32, i32* %data1, align 4, !dbg !278
  %cmp = icmp sge i32 %3, 0, !dbg !280
  br i1 %cmp, label %if.then, label %if.else, !dbg !281

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !282
  %idxprom = sext i32 %4 to i64, !dbg !284
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !284
  store i32 1, i32* %arrayidx, align 4, !dbg !285
  store i32 0, i32* %i, align 4, !dbg !286
  br label %for.cond, !dbg !288

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !289
  %cmp2 = icmp slt i32 %5, 10, !dbg !291
  br i1 %cmp2, label %for.body, label %for.end, !dbg !292

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !293
  %idxprom3 = sext i32 %6 to i64, !dbg !295
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !295
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !295
  call void @printIntLine(i32 %7), !dbg !296
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !298
  %inc = add nsw i32 %8, 1, !dbg !298
  store i32 %inc, i32* %i, align 4, !dbg !298
  br label %for.cond, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !302

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !303
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !305
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !306 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data33 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !307, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType* %myUnion, metadata !309, metadata !DIExpression()), !dbg !310
  store i32 -1, i32* %data, align 4, !dbg !311
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !312, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !315, metadata !DIExpression()), !dbg !316
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !317, metadata !DIExpression()), !dbg !318
  store i32 -1, i32* %listenSocket, align 4, !dbg !318
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !319, metadata !DIExpression()), !dbg !320
  store i32 -1, i32* %acceptSocket, align 4, !dbg !320
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !321, metadata !DIExpression()), !dbg !322
  br label %do.body, !dbg !323

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !324
  store i32 %call, i32* %listenSocket, align 4, !dbg !326
  %0 = load i32, i32* %listenSocket, align 4, !dbg !327
  %cmp = icmp eq i32 %0, -1, !dbg !329
  br i1 %cmp, label %if.then, label %if.end, !dbg !330

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !331

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !333
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !333
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !334
  store i16 2, i16* %sin_family, align 4, !dbg !335
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !336
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !337
  store i32 0, i32* %s_addr, align 4, !dbg !338
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !339
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !340
  store i16 %call1, i16* %sin_port, align 2, !dbg !341
  %2 = load i32, i32* %listenSocket, align 4, !dbg !342
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !344
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !345
  %cmp3 = icmp eq i32 %call2, -1, !dbg !346
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !347

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !348

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !350
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !352
  %cmp7 = icmp eq i32 %call6, -1, !dbg !353
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !354

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !355

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !357
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !358
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !359
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !360
  %cmp11 = icmp eq i32 %6, -1, !dbg !362
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !363

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !364

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !366
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !367
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !368
  %conv = trunc i64 %call14 to i32, !dbg !368
  store i32 %conv, i32* %recvResult, align 4, !dbg !369
  %8 = load i32, i32* %recvResult, align 4, !dbg !370
  %cmp15 = icmp eq i32 %8, -1, !dbg !372
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !373

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !374
  %cmp17 = icmp eq i32 %9, 0, !dbg !375
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !376

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !377

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !379
  %idxprom = sext i32 %10 to i64, !dbg !380
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !380
  store i8 0, i8* %arrayidx, align 1, !dbg !381
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !382
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !383
  store i32 %call22, i32* %data, align 4, !dbg !384
  br label %do.end, !dbg !385

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !386
  %cmp23 = icmp ne i32 %11, -1, !dbg !388
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !389

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !390
  %call26 = call i32 @close(i32 %12), !dbg !392
  br label %if.end27, !dbg !393

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !394
  %cmp28 = icmp ne i32 %13, -1, !dbg !396
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !397

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !398
  %call31 = call i32 @close(i32 %14), !dbg !400
  br label %if.end32, !dbg !401

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !402
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !403
  store i32 %15, i32* %unionFirst, align 4, !dbg !404
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !405, metadata !DIExpression()), !dbg !407
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !408
  %16 = load i32, i32* %unionSecond, align 4, !dbg !408
  store i32 %16, i32* %data33, align 4, !dbg !407
  call void @llvm.dbg.declare(metadata i32* %i, metadata !409, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !412, metadata !DIExpression()), !dbg !413
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !413
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !413
  %18 = load i32, i32* %data33, align 4, !dbg !414
  %cmp34 = icmp sge i32 %18, 0, !dbg !416
  br i1 %cmp34, label %land.lhs.true, label %if.else, !dbg !417

land.lhs.true:                                    ; preds = %if.end32
  %19 = load i32, i32* %data33, align 4, !dbg !418
  %cmp36 = icmp slt i32 %19, 10, !dbg !419
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !420

if.then38:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data33, align 4, !dbg !421
  %idxprom39 = sext i32 %20 to i64, !dbg !423
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !423
  store i32 1, i32* %arrayidx40, align 4, !dbg !424
  store i32 0, i32* %i, align 4, !dbg !425
  br label %for.cond, !dbg !427

for.cond:                                         ; preds = %for.inc, %if.then38
  %21 = load i32, i32* %i, align 4, !dbg !428
  %cmp41 = icmp slt i32 %21, 10, !dbg !430
  br i1 %cmp41, label %for.body, label %for.end, !dbg !431

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !432
  %idxprom43 = sext i32 %22 to i64, !dbg !434
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !434
  %23 = load i32, i32* %arrayidx44, align 4, !dbg !434
  call void @printIntLine(i32 %23), !dbg !435
  br label %for.inc, !dbg !436

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !437
  %inc = add nsw i32 %24, 1, !dbg !437
  store i32 %inc, i32* %i, align 4, !dbg !437
  br label %for.cond, !dbg !438, !llvm.loop !439

for.end:                                          ; preds = %for.cond
  br label %if.end45, !dbg !441

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !442
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end
  ret void, !dbg !444
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_bad", scope: !71, file: !71, line: 50, type: !72, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 52, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 52, column: 9, scope: !70)
!78 = !DILocalVariable(name: "myUnion", scope: !70, file: !71, line: 53, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_unionType", file: !71, line: 46, baseType: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !71, line: 42, size: 32, elements: !81)
!81 = !{!82, !83}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !80, file: !71, line: 44, baseType: !76, size: 32)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !80, file: !71, line: 45, baseType: !76, size: 32)
!84 = !DILocation(line: 53, column: 75, scope: !70)
!85 = !DILocation(line: 55, column: 10, scope: !70)
!86 = !DILocalVariable(name: "recvResult", scope: !87, file: !71, line: 61, type: !76)
!87 = distinct !DILexicalBlock(scope: !70, file: !71, line: 56, column: 5)
!88 = !DILocation(line: 61, column: 13, scope: !87)
!89 = !DILocalVariable(name: "service", scope: !87, file: !71, line: 62, type: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !91)
!91 = !{!92, !93, !97, !101}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !90, file: !17, line: 240, baseType: !56, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !90, file: !17, line: 241, baseType: !94, size: 16, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !90, file: !17, line: 242, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !17, line: 33, baseType: !46, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !90, file: !17, line: 245, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 62, column: 28, scope: !87)
!107 = !DILocalVariable(name: "listenSocket", scope: !87, file: !71, line: 63, type: !76)
!108 = !DILocation(line: 63, column: 16, scope: !87)
!109 = !DILocalVariable(name: "acceptSocket", scope: !87, file: !71, line: 64, type: !76)
!110 = !DILocation(line: 64, column: 16, scope: !87)
!111 = !DILocalVariable(name: "inputBuffer", scope: !87, file: !71, line: 65, type: !60)
!112 = !DILocation(line: 65, column: 14, scope: !87)
!113 = !DILocation(line: 66, column: 9, scope: !87)
!114 = !DILocation(line: 76, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !87, file: !71, line: 67, column: 9)
!116 = !DILocation(line: 76, column: 26, scope: !115)
!117 = !DILocation(line: 77, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !71, line: 77, column: 17)
!119 = !DILocation(line: 77, column: 30, scope: !118)
!120 = !DILocation(line: 77, column: 17, scope: !115)
!121 = !DILocation(line: 79, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !71, line: 78, column: 13)
!123 = !DILocation(line: 81, column: 13, scope: !115)
!124 = !DILocation(line: 82, column: 21, scope: !115)
!125 = !DILocation(line: 82, column: 32, scope: !115)
!126 = !DILocation(line: 83, column: 21, scope: !115)
!127 = !DILocation(line: 83, column: 30, scope: !115)
!128 = !DILocation(line: 83, column: 37, scope: !115)
!129 = !DILocation(line: 84, column: 32, scope: !115)
!130 = !DILocation(line: 84, column: 21, scope: !115)
!131 = !DILocation(line: 84, column: 30, scope: !115)
!132 = !DILocation(line: 85, column: 22, scope: !133)
!133 = distinct !DILexicalBlock(scope: !115, file: !71, line: 85, column: 17)
!134 = !DILocation(line: 85, column: 36, scope: !133)
!135 = !DILocation(line: 85, column: 17, scope: !133)
!136 = !DILocation(line: 85, column: 81, scope: !133)
!137 = !DILocation(line: 85, column: 17, scope: !115)
!138 = !DILocation(line: 87, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !71, line: 86, column: 13)
!140 = !DILocation(line: 89, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !115, file: !71, line: 89, column: 17)
!142 = !DILocation(line: 89, column: 17, scope: !141)
!143 = !DILocation(line: 89, column: 54, scope: !141)
!144 = !DILocation(line: 89, column: 17, scope: !115)
!145 = !DILocation(line: 91, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !71, line: 90, column: 13)
!147 = !DILocation(line: 93, column: 35, scope: !115)
!148 = !DILocation(line: 93, column: 28, scope: !115)
!149 = !DILocation(line: 93, column: 26, scope: !115)
!150 = !DILocation(line: 94, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !115, file: !71, line: 94, column: 17)
!152 = !DILocation(line: 94, column: 30, scope: !151)
!153 = !DILocation(line: 94, column: 17, scope: !115)
!154 = !DILocation(line: 96, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !71, line: 95, column: 13)
!156 = !DILocation(line: 99, column: 31, scope: !115)
!157 = !DILocation(line: 99, column: 45, scope: !115)
!158 = !DILocation(line: 99, column: 26, scope: !115)
!159 = !DILocation(line: 99, column: 24, scope: !115)
!160 = !DILocation(line: 100, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !115, file: !71, line: 100, column: 17)
!162 = !DILocation(line: 100, column: 28, scope: !161)
!163 = !DILocation(line: 100, column: 44, scope: !161)
!164 = !DILocation(line: 100, column: 47, scope: !161)
!165 = !DILocation(line: 100, column: 58, scope: !161)
!166 = !DILocation(line: 100, column: 17, scope: !115)
!167 = !DILocation(line: 102, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !71, line: 101, column: 13)
!169 = !DILocation(line: 105, column: 25, scope: !115)
!170 = !DILocation(line: 105, column: 13, scope: !115)
!171 = !DILocation(line: 105, column: 37, scope: !115)
!172 = !DILocation(line: 107, column: 25, scope: !115)
!173 = !DILocation(line: 107, column: 20, scope: !115)
!174 = !DILocation(line: 107, column: 18, scope: !115)
!175 = !DILocation(line: 108, column: 9, scope: !115)
!176 = !DILocation(line: 110, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !87, file: !71, line: 110, column: 13)
!178 = !DILocation(line: 110, column: 26, scope: !177)
!179 = !DILocation(line: 110, column: 13, scope: !87)
!180 = !DILocation(line: 112, column: 26, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !71, line: 111, column: 9)
!182 = !DILocation(line: 112, column: 13, scope: !181)
!183 = !DILocation(line: 113, column: 9, scope: !181)
!184 = !DILocation(line: 114, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !87, file: !71, line: 114, column: 13)
!186 = !DILocation(line: 114, column: 26, scope: !185)
!187 = !DILocation(line: 114, column: 13, scope: !87)
!188 = !DILocation(line: 116, column: 26, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !71, line: 115, column: 9)
!190 = !DILocation(line: 116, column: 13, scope: !189)
!191 = !DILocation(line: 117, column: 9, scope: !189)
!192 = !DILocation(line: 125, column: 26, scope: !70)
!193 = !DILocation(line: 125, column: 13, scope: !70)
!194 = !DILocation(line: 125, column: 24, scope: !70)
!195 = !DILocalVariable(name: "data", scope: !196, file: !71, line: 127, type: !76)
!196 = distinct !DILexicalBlock(scope: !70, file: !71, line: 126, column: 5)
!197 = !DILocation(line: 127, column: 13, scope: !196)
!198 = !DILocation(line: 127, column: 28, scope: !196)
!199 = !DILocalVariable(name: "i", scope: !200, file: !71, line: 129, type: !76)
!200 = distinct !DILexicalBlock(scope: !196, file: !71, line: 128, column: 9)
!201 = !DILocation(line: 129, column: 17, scope: !200)
!202 = !DILocalVariable(name: "buffer", scope: !200, file: !71, line: 130, type: !203)
!203 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !204)
!204 = !{!205}
!205 = !DISubrange(count: 10)
!206 = !DILocation(line: 130, column: 17, scope: !200)
!207 = !DILocation(line: 133, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !200, file: !71, line: 133, column: 17)
!209 = !DILocation(line: 133, column: 22, scope: !208)
!210 = !DILocation(line: 133, column: 17, scope: !200)
!211 = !DILocation(line: 135, column: 24, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !71, line: 134, column: 13)
!213 = !DILocation(line: 135, column: 17, scope: !212)
!214 = !DILocation(line: 135, column: 30, scope: !212)
!215 = !DILocation(line: 137, column: 23, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !71, line: 137, column: 17)
!217 = !DILocation(line: 137, column: 21, scope: !216)
!218 = !DILocation(line: 137, column: 28, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !71, line: 137, column: 17)
!220 = !DILocation(line: 137, column: 30, scope: !219)
!221 = !DILocation(line: 137, column: 17, scope: !216)
!222 = !DILocation(line: 139, column: 41, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !71, line: 138, column: 17)
!224 = !DILocation(line: 139, column: 34, scope: !223)
!225 = !DILocation(line: 139, column: 21, scope: !223)
!226 = !DILocation(line: 140, column: 17, scope: !223)
!227 = !DILocation(line: 137, column: 37, scope: !219)
!228 = !DILocation(line: 137, column: 17, scope: !219)
!229 = distinct !{!229, !221, !230, !231}
!230 = !DILocation(line: 140, column: 17, scope: !216)
!231 = !{!"llvm.loop.mustprogress"}
!232 = !DILocation(line: 141, column: 13, scope: !212)
!233 = !DILocation(line: 144, column: 17, scope: !234)
!234 = distinct !DILexicalBlock(scope: !208, file: !71, line: 143, column: 13)
!235 = !DILocation(line: 148, column: 1, scope: !70)
!236 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_34_good", scope: !71, file: !71, line: 289, type: !72, scopeLine: 290, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!237 = !DILocation(line: 291, column: 5, scope: !236)
!238 = !DILocation(line: 292, column: 5, scope: !236)
!239 = !DILocation(line: 293, column: 1, scope: !236)
!240 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 303, type: !241, scopeLine: 304, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!241 = !DISubroutineType(types: !242)
!242 = !{!76, !76, !243}
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !244, size: 64)
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!245 = !DILocalVariable(name: "argc", arg: 1, scope: !240, file: !71, line: 303, type: !76)
!246 = !DILocation(line: 303, column: 14, scope: !240)
!247 = !DILocalVariable(name: "argv", arg: 2, scope: !240, file: !71, line: 303, type: !243)
!248 = !DILocation(line: 303, column: 27, scope: !240)
!249 = !DILocation(line: 306, column: 22, scope: !240)
!250 = !DILocation(line: 306, column: 12, scope: !240)
!251 = !DILocation(line: 306, column: 5, scope: !240)
!252 = !DILocation(line: 308, column: 5, scope: !240)
!253 = !DILocation(line: 309, column: 5, scope: !240)
!254 = !DILocation(line: 310, column: 5, scope: !240)
!255 = !DILocation(line: 313, column: 5, scope: !240)
!256 = !DILocation(line: 314, column: 5, scope: !240)
!257 = !DILocation(line: 315, column: 5, scope: !240)
!258 = !DILocation(line: 317, column: 5, scope: !240)
!259 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 155, type: !72, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!260 = !DILocalVariable(name: "data", scope: !259, file: !71, line: 157, type: !76)
!261 = !DILocation(line: 157, column: 9, scope: !259)
!262 = !DILocalVariable(name: "myUnion", scope: !259, file: !71, line: 158, type: !79)
!263 = !DILocation(line: 158, column: 75, scope: !259)
!264 = !DILocation(line: 160, column: 10, scope: !259)
!265 = !DILocation(line: 163, column: 10, scope: !259)
!266 = !DILocation(line: 164, column: 26, scope: !259)
!267 = !DILocation(line: 164, column: 13, scope: !259)
!268 = !DILocation(line: 164, column: 24, scope: !259)
!269 = !DILocalVariable(name: "data", scope: !270, file: !71, line: 166, type: !76)
!270 = distinct !DILexicalBlock(scope: !259, file: !71, line: 165, column: 5)
!271 = !DILocation(line: 166, column: 13, scope: !270)
!272 = !DILocation(line: 166, column: 28, scope: !270)
!273 = !DILocalVariable(name: "i", scope: !274, file: !71, line: 168, type: !76)
!274 = distinct !DILexicalBlock(scope: !270, file: !71, line: 167, column: 9)
!275 = !DILocation(line: 168, column: 17, scope: !274)
!276 = !DILocalVariable(name: "buffer", scope: !274, file: !71, line: 169, type: !203)
!277 = !DILocation(line: 169, column: 17, scope: !274)
!278 = !DILocation(line: 172, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !274, file: !71, line: 172, column: 17)
!280 = !DILocation(line: 172, column: 22, scope: !279)
!281 = !DILocation(line: 172, column: 17, scope: !274)
!282 = !DILocation(line: 174, column: 24, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !71, line: 173, column: 13)
!284 = !DILocation(line: 174, column: 17, scope: !283)
!285 = !DILocation(line: 174, column: 30, scope: !283)
!286 = !DILocation(line: 176, column: 23, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !71, line: 176, column: 17)
!288 = !DILocation(line: 176, column: 21, scope: !287)
!289 = !DILocation(line: 176, column: 28, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !71, line: 176, column: 17)
!291 = !DILocation(line: 176, column: 30, scope: !290)
!292 = !DILocation(line: 176, column: 17, scope: !287)
!293 = !DILocation(line: 178, column: 41, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !71, line: 177, column: 17)
!295 = !DILocation(line: 178, column: 34, scope: !294)
!296 = !DILocation(line: 178, column: 21, scope: !294)
!297 = !DILocation(line: 179, column: 17, scope: !294)
!298 = !DILocation(line: 176, column: 37, scope: !290)
!299 = !DILocation(line: 176, column: 17, scope: !290)
!300 = distinct !{!300, !292, !301, !231}
!301 = !DILocation(line: 179, column: 17, scope: !287)
!302 = !DILocation(line: 180, column: 13, scope: !283)
!303 = !DILocation(line: 183, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !279, file: !71, line: 182, column: 13)
!305 = !DILocation(line: 187, column: 1, scope: !259)
!306 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 190, type: !72, scopeLine: 191, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!307 = !DILocalVariable(name: "data", scope: !306, file: !71, line: 192, type: !76)
!308 = !DILocation(line: 192, column: 9, scope: !306)
!309 = !DILocalVariable(name: "myUnion", scope: !306, file: !71, line: 193, type: !79)
!310 = !DILocation(line: 193, column: 75, scope: !306)
!311 = !DILocation(line: 195, column: 10, scope: !306)
!312 = !DILocalVariable(name: "recvResult", scope: !313, file: !71, line: 201, type: !76)
!313 = distinct !DILexicalBlock(scope: !306, file: !71, line: 196, column: 5)
!314 = !DILocation(line: 201, column: 13, scope: !313)
!315 = !DILocalVariable(name: "service", scope: !313, file: !71, line: 202, type: !90)
!316 = !DILocation(line: 202, column: 28, scope: !313)
!317 = !DILocalVariable(name: "listenSocket", scope: !313, file: !71, line: 203, type: !76)
!318 = !DILocation(line: 203, column: 16, scope: !313)
!319 = !DILocalVariable(name: "acceptSocket", scope: !313, file: !71, line: 204, type: !76)
!320 = !DILocation(line: 204, column: 16, scope: !313)
!321 = !DILocalVariable(name: "inputBuffer", scope: !313, file: !71, line: 205, type: !60)
!322 = !DILocation(line: 205, column: 14, scope: !313)
!323 = !DILocation(line: 206, column: 9, scope: !313)
!324 = !DILocation(line: 216, column: 28, scope: !325)
!325 = distinct !DILexicalBlock(scope: !313, file: !71, line: 207, column: 9)
!326 = !DILocation(line: 216, column: 26, scope: !325)
!327 = !DILocation(line: 217, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !325, file: !71, line: 217, column: 17)
!329 = !DILocation(line: 217, column: 30, scope: !328)
!330 = !DILocation(line: 217, column: 17, scope: !325)
!331 = !DILocation(line: 219, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !71, line: 218, column: 13)
!333 = !DILocation(line: 221, column: 13, scope: !325)
!334 = !DILocation(line: 222, column: 21, scope: !325)
!335 = !DILocation(line: 222, column: 32, scope: !325)
!336 = !DILocation(line: 223, column: 21, scope: !325)
!337 = !DILocation(line: 223, column: 30, scope: !325)
!338 = !DILocation(line: 223, column: 37, scope: !325)
!339 = !DILocation(line: 224, column: 32, scope: !325)
!340 = !DILocation(line: 224, column: 21, scope: !325)
!341 = !DILocation(line: 224, column: 30, scope: !325)
!342 = !DILocation(line: 225, column: 22, scope: !343)
!343 = distinct !DILexicalBlock(scope: !325, file: !71, line: 225, column: 17)
!344 = !DILocation(line: 225, column: 36, scope: !343)
!345 = !DILocation(line: 225, column: 17, scope: !343)
!346 = !DILocation(line: 225, column: 81, scope: !343)
!347 = !DILocation(line: 225, column: 17, scope: !325)
!348 = !DILocation(line: 227, column: 17, scope: !349)
!349 = distinct !DILexicalBlock(scope: !343, file: !71, line: 226, column: 13)
!350 = !DILocation(line: 229, column: 24, scope: !351)
!351 = distinct !DILexicalBlock(scope: !325, file: !71, line: 229, column: 17)
!352 = !DILocation(line: 229, column: 17, scope: !351)
!353 = !DILocation(line: 229, column: 54, scope: !351)
!354 = !DILocation(line: 229, column: 17, scope: !325)
!355 = !DILocation(line: 231, column: 17, scope: !356)
!356 = distinct !DILexicalBlock(scope: !351, file: !71, line: 230, column: 13)
!357 = !DILocation(line: 233, column: 35, scope: !325)
!358 = !DILocation(line: 233, column: 28, scope: !325)
!359 = !DILocation(line: 233, column: 26, scope: !325)
!360 = !DILocation(line: 234, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !325, file: !71, line: 234, column: 17)
!362 = !DILocation(line: 234, column: 30, scope: !361)
!363 = !DILocation(line: 234, column: 17, scope: !325)
!364 = !DILocation(line: 236, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !71, line: 235, column: 13)
!366 = !DILocation(line: 239, column: 31, scope: !325)
!367 = !DILocation(line: 239, column: 45, scope: !325)
!368 = !DILocation(line: 239, column: 26, scope: !325)
!369 = !DILocation(line: 239, column: 24, scope: !325)
!370 = !DILocation(line: 240, column: 17, scope: !371)
!371 = distinct !DILexicalBlock(scope: !325, file: !71, line: 240, column: 17)
!372 = !DILocation(line: 240, column: 28, scope: !371)
!373 = !DILocation(line: 240, column: 44, scope: !371)
!374 = !DILocation(line: 240, column: 47, scope: !371)
!375 = !DILocation(line: 240, column: 58, scope: !371)
!376 = !DILocation(line: 240, column: 17, scope: !325)
!377 = !DILocation(line: 242, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !371, file: !71, line: 241, column: 13)
!379 = !DILocation(line: 245, column: 25, scope: !325)
!380 = !DILocation(line: 245, column: 13, scope: !325)
!381 = !DILocation(line: 245, column: 37, scope: !325)
!382 = !DILocation(line: 247, column: 25, scope: !325)
!383 = !DILocation(line: 247, column: 20, scope: !325)
!384 = !DILocation(line: 247, column: 18, scope: !325)
!385 = !DILocation(line: 248, column: 9, scope: !325)
!386 = !DILocation(line: 250, column: 13, scope: !387)
!387 = distinct !DILexicalBlock(scope: !313, file: !71, line: 250, column: 13)
!388 = !DILocation(line: 250, column: 26, scope: !387)
!389 = !DILocation(line: 250, column: 13, scope: !313)
!390 = !DILocation(line: 252, column: 26, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !71, line: 251, column: 9)
!392 = !DILocation(line: 252, column: 13, scope: !391)
!393 = !DILocation(line: 253, column: 9, scope: !391)
!394 = !DILocation(line: 254, column: 13, scope: !395)
!395 = distinct !DILexicalBlock(scope: !313, file: !71, line: 254, column: 13)
!396 = !DILocation(line: 254, column: 26, scope: !395)
!397 = !DILocation(line: 254, column: 13, scope: !313)
!398 = !DILocation(line: 256, column: 26, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !71, line: 255, column: 9)
!400 = !DILocation(line: 256, column: 13, scope: !399)
!401 = !DILocation(line: 257, column: 9, scope: !399)
!402 = !DILocation(line: 265, column: 26, scope: !306)
!403 = !DILocation(line: 265, column: 13, scope: !306)
!404 = !DILocation(line: 265, column: 24, scope: !306)
!405 = !DILocalVariable(name: "data", scope: !406, file: !71, line: 267, type: !76)
!406 = distinct !DILexicalBlock(scope: !306, file: !71, line: 266, column: 5)
!407 = !DILocation(line: 267, column: 13, scope: !406)
!408 = !DILocation(line: 267, column: 28, scope: !406)
!409 = !DILocalVariable(name: "i", scope: !410, file: !71, line: 269, type: !76)
!410 = distinct !DILexicalBlock(scope: !406, file: !71, line: 268, column: 9)
!411 = !DILocation(line: 269, column: 17, scope: !410)
!412 = !DILocalVariable(name: "buffer", scope: !410, file: !71, line: 270, type: !203)
!413 = !DILocation(line: 270, column: 17, scope: !410)
!414 = !DILocation(line: 272, column: 17, scope: !415)
!415 = distinct !DILexicalBlock(scope: !410, file: !71, line: 272, column: 17)
!416 = !DILocation(line: 272, column: 22, scope: !415)
!417 = !DILocation(line: 272, column: 27, scope: !415)
!418 = !DILocation(line: 272, column: 30, scope: !415)
!419 = !DILocation(line: 272, column: 35, scope: !415)
!420 = !DILocation(line: 272, column: 17, scope: !410)
!421 = !DILocation(line: 274, column: 24, scope: !422)
!422 = distinct !DILexicalBlock(scope: !415, file: !71, line: 273, column: 13)
!423 = !DILocation(line: 274, column: 17, scope: !422)
!424 = !DILocation(line: 274, column: 30, scope: !422)
!425 = !DILocation(line: 276, column: 23, scope: !426)
!426 = distinct !DILexicalBlock(scope: !422, file: !71, line: 276, column: 17)
!427 = !DILocation(line: 276, column: 21, scope: !426)
!428 = !DILocation(line: 276, column: 28, scope: !429)
!429 = distinct !DILexicalBlock(scope: !426, file: !71, line: 276, column: 17)
!430 = !DILocation(line: 276, column: 30, scope: !429)
!431 = !DILocation(line: 276, column: 17, scope: !426)
!432 = !DILocation(line: 278, column: 41, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !71, line: 277, column: 17)
!434 = !DILocation(line: 278, column: 34, scope: !433)
!435 = !DILocation(line: 278, column: 21, scope: !433)
!436 = !DILocation(line: 279, column: 17, scope: !433)
!437 = !DILocation(line: 276, column: 37, scope: !429)
!438 = !DILocation(line: 276, column: 17, scope: !429)
!439 = distinct !{!439, !431, !440, !231}
!440 = !DILocation(line: 279, column: 17, scope: !426)
!441 = !DILocation(line: 280, column: 13, scope: !422)
!442 = !DILocation(line: 283, column: 17, scope: !443)
!443 = distinct !DILexicalBlock(scope: !415, file: !71, line: 282, column: 13)
!444 = !DILocation(line: 287, column: 1, scope: !306)
