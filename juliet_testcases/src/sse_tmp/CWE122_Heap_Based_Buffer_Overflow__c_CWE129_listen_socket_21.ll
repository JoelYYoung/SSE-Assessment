; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !70
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !73
@goodG2BStatic = internal global i32 0, align 4, !dbg !75

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_bad() #0 !dbg !83 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i32 -1, i32* %data, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !93, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %listenSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 -1, i32* %acceptSocket, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  br label %do.body, !dbg !117

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !118
  store i32 %call, i32* %listenSocket, align 4, !dbg !120
  %0 = load i32, i32* %listenSocket, align 4, !dbg !121
  %cmp = icmp eq i32 %0, -1, !dbg !123
  br i1 %cmp, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !125

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !127
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !128
  store i16 2, i16* %sin_family, align 4, !dbg !129
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !130
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !131
  store i32 0, i32* %s_addr, align 4, !dbg !132
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !133
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !134
  store i16 %call1, i16* %sin_port, align 2, !dbg !135
  %2 = load i32, i32* %listenSocket, align 4, !dbg !136
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !138
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !139
  %cmp3 = icmp eq i32 %call2, -1, !dbg !140
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !141

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !142

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !144
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !146
  %cmp7 = icmp eq i32 %call6, -1, !dbg !147
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !148

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !149

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !151
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !152
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !153
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !154
  %cmp11 = icmp eq i32 %6, -1, !dbg !156
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !157

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !158

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !160
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !161
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !162
  %conv = trunc i64 %call14 to i32, !dbg !162
  store i32 %conv, i32* %recvResult, align 4, !dbg !163
  %8 = load i32, i32* %recvResult, align 4, !dbg !164
  %cmp15 = icmp eq i32 %8, -1, !dbg !166
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !167

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !168
  %cmp17 = icmp eq i32 %9, 0, !dbg !169
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !170

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !171

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !173
  %idxprom = sext i32 %10 to i64, !dbg !174
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !174
  store i8 0, i8* %arrayidx, align 1, !dbg !175
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !176
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !177
  store i32 %call22, i32* %data, align 4, !dbg !178
  br label %do.end, !dbg !179

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !180
  %cmp23 = icmp ne i32 %11, -1, !dbg !182
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !183

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !184
  %call26 = call i32 @close(i32 %12), !dbg !186
  br label %if.end27, !dbg !187

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !188
  %cmp28 = icmp ne i32 %13, -1, !dbg !190
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !191

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !192
  %call31 = call i32 @close(i32 %14), !dbg !194
  br label %if.end32, !dbg !195

if.end32:                                         ; preds = %if.then30, %if.end27
  store i32 1, i32* @badStatic, align 4, !dbg !196
  %15 = load i32, i32* %data, align 4, !dbg !197
  call void @badSink(i32 %15), !dbg !198
  ret void, !dbg !199
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
define internal void @badSink(i32 %data) #0 !dbg !200 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !203, metadata !DIExpression()), !dbg !204
  %0 = load i32, i32* @badStatic, align 4, !dbg !205
  %tobool = icmp ne i32 %0, 0, !dbg !205
  br i1 %tobool, label %if.then, label %if.end16, !dbg !207

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !208, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !212, metadata !DIExpression()), !dbg !213
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !214
  %1 = bitcast i8* %call to i32*, !dbg !215
  store i32* %1, i32** %buffer, align 8, !dbg !213
  %2 = load i32*, i32** %buffer, align 8, !dbg !216
  %cmp = icmp eq i32* %2, null, !dbg !218
  br i1 %cmp, label %if.then1, label %if.end, !dbg !219

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #11, !dbg !220
  unreachable, !dbg !220

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !222
  br label %for.cond, !dbg !224

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !225
  %cmp2 = icmp slt i32 %3, 10, !dbg !227
  br i1 %cmp2, label %for.body, label %for.end, !dbg !228

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !229
  %5 = load i32, i32* %i, align 4, !dbg !231
  %idxprom = sext i32 %5 to i64, !dbg !229
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !229
  store i32 0, i32* %arrayidx, align 4, !dbg !232
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !234
  %inc = add nsw i32 %6, 1, !dbg !234
  store i32 %inc, i32* %i, align 4, !dbg !234
  br label %for.cond, !dbg !235, !llvm.loop !236

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !239
  %cmp3 = icmp sge i32 %7, 0, !dbg !241
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !242

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !243
  %9 = load i32, i32* %data.addr, align 4, !dbg !245
  %idxprom5 = sext i32 %9 to i64, !dbg !243
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !243
  store i32 1, i32* %arrayidx6, align 4, !dbg !246
  store i32 0, i32* %i, align 4, !dbg !247
  br label %for.cond7, !dbg !249

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !250
  %cmp8 = icmp slt i32 %10, 10, !dbg !252
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !253

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !254
  %12 = load i32, i32* %i, align 4, !dbg !256
  %idxprom10 = sext i32 %12 to i64, !dbg !254
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !254
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !254
  call void @printIntLine(i32 %13), !dbg !257
  br label %for.inc12, !dbg !258

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !259
  %inc13 = add nsw i32 %14, 1, !dbg !259
  store i32 %inc13, i32* %i, align 4, !dbg !259
  br label %for.cond7, !dbg !260, !llvm.loop !261

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !263

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !264
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !266
  %16 = bitcast i32* %15 to i8*, !dbg !266
  call void @free(i8* %16) #8, !dbg !267
  br label %if.end16, !dbg !268

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !269
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_good() #0 !dbg !270 {
entry:
  call void @goodB2G1(), !dbg !271
  call void @goodB2G2(), !dbg !272
  call void @goodG2B(), !dbg !273
  ret void, !dbg !274
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !275 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !280, metadata !DIExpression()), !dbg !281
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !282, metadata !DIExpression()), !dbg !283
  %call = call i64 @time(i64* null) #8, !dbg !284
  %conv = trunc i64 %call to i32, !dbg !285
  call void @srand(i32 %conv) #8, !dbg !286
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !287
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_good(), !dbg !288
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !289
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !290
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_bad(), !dbg !291
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !292
  ret i32 0, !dbg !293
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
define internal void @goodB2G1() #0 !dbg !294 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !295, metadata !DIExpression()), !dbg !296
  store i32 -1, i32* %data, align 4, !dbg !297
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !298, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !301, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !303, metadata !DIExpression()), !dbg !304
  store i32 -1, i32* %listenSocket, align 4, !dbg !304
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !305, metadata !DIExpression()), !dbg !306
  store i32 -1, i32* %acceptSocket, align 4, !dbg !306
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !307, metadata !DIExpression()), !dbg !308
  br label %do.body, !dbg !309

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !310
  store i32 %call, i32* %listenSocket, align 4, !dbg !312
  %0 = load i32, i32* %listenSocket, align 4, !dbg !313
  %cmp = icmp eq i32 %0, -1, !dbg !315
  br i1 %cmp, label %if.then, label %if.end, !dbg !316

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !317

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !319
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !319
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !320
  store i16 2, i16* %sin_family, align 4, !dbg !321
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !322
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !323
  store i32 0, i32* %s_addr, align 4, !dbg !324
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !325
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !326
  store i16 %call1, i16* %sin_port, align 2, !dbg !327
  %2 = load i32, i32* %listenSocket, align 4, !dbg !328
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !330
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !331
  %cmp3 = icmp eq i32 %call2, -1, !dbg !332
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !333

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !334

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !336
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !338
  %cmp7 = icmp eq i32 %call6, -1, !dbg !339
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !340

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !341

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !343
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !344
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !345
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !346
  %cmp11 = icmp eq i32 %6, -1, !dbg !348
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !349

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !350

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !352
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !353
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !354
  %conv = trunc i64 %call14 to i32, !dbg !354
  store i32 %conv, i32* %recvResult, align 4, !dbg !355
  %8 = load i32, i32* %recvResult, align 4, !dbg !356
  %cmp15 = icmp eq i32 %8, -1, !dbg !358
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !359

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !360
  %cmp17 = icmp eq i32 %9, 0, !dbg !361
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !362

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !363

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !365
  %idxprom = sext i32 %10 to i64, !dbg !366
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !366
  store i8 0, i8* %arrayidx, align 1, !dbg !367
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !368
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !369
  store i32 %call22, i32* %data, align 4, !dbg !370
  br label %do.end, !dbg !371

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !372
  %cmp23 = icmp ne i32 %11, -1, !dbg !374
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !375

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !376
  %call26 = call i32 @close(i32 %12), !dbg !378
  br label %if.end27, !dbg !379

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !380
  %cmp28 = icmp ne i32 %13, -1, !dbg !382
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !383

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !384
  %call31 = call i32 @close(i32 %14), !dbg !386
  br label %if.end32, !dbg !387

if.end32:                                         ; preds = %if.then30, %if.end27
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !388
  %15 = load i32, i32* %data, align 4, !dbg !389
  call void @goodB2G1Sink(i32 %15), !dbg !390
  ret void, !dbg !391
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !392 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !393, metadata !DIExpression()), !dbg !394
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !395
  %tobool = icmp ne i32 %0, 0, !dbg !395
  br i1 %tobool, label %if.then, label %if.else, !dbg !397

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !398
  br label %if.end18, !dbg !400

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !401, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !405, metadata !DIExpression()), !dbg !406
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !407
  %1 = bitcast i8* %call to i32*, !dbg !408
  store i32* %1, i32** %buffer, align 8, !dbg !406
  %2 = load i32*, i32** %buffer, align 8, !dbg !409
  %cmp = icmp eq i32* %2, null, !dbg !411
  br i1 %cmp, label %if.then1, label %if.end, !dbg !412

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !413
  unreachable, !dbg !413

if.end:                                           ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !415
  br label %for.cond, !dbg !417

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !418
  %cmp2 = icmp slt i32 %3, 10, !dbg !420
  br i1 %cmp2, label %for.body, label %for.end, !dbg !421

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !422
  %5 = load i32, i32* %i, align 4, !dbg !424
  %idxprom = sext i32 %5 to i64, !dbg !422
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !422
  store i32 0, i32* %arrayidx, align 4, !dbg !425
  br label %for.inc, !dbg !426

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !427
  %inc = add nsw i32 %6, 1, !dbg !427
  store i32 %inc, i32* %i, align 4, !dbg !427
  br label %for.cond, !dbg !428, !llvm.loop !429

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !431
  %cmp3 = icmp sge i32 %7, 0, !dbg !433
  br i1 %cmp3, label %land.lhs.true, label %if.else16, !dbg !434

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !435
  %cmp4 = icmp slt i32 %8, 10, !dbg !436
  br i1 %cmp4, label %if.then5, label %if.else16, !dbg !437

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !438
  %10 = load i32, i32* %data.addr, align 4, !dbg !440
  %idxprom6 = sext i32 %10 to i64, !dbg !438
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !438
  store i32 1, i32* %arrayidx7, align 4, !dbg !441
  store i32 0, i32* %i, align 4, !dbg !442
  br label %for.cond8, !dbg !444

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !445
  %cmp9 = icmp slt i32 %11, 10, !dbg !447
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !448

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !449
  %13 = load i32, i32* %i, align 4, !dbg !451
  %idxprom11 = sext i32 %13 to i64, !dbg !449
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !449
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !449
  call void @printIntLine(i32 %14), !dbg !452
  br label %for.inc13, !dbg !453

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !454
  %inc14 = add nsw i32 %15, 1, !dbg !454
  store i32 %inc14, i32* %i, align 4, !dbg !454
  br label %for.cond8, !dbg !455, !llvm.loop !456

for.end15:                                        ; preds = %for.cond8
  br label %if.end17, !dbg !458

if.else16:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !459
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !461
  %17 = bitcast i32* %16 to i8*, !dbg !461
  call void @free(i8* %17) #8, !dbg !462
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then
  ret void, !dbg !463
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !464 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !465, metadata !DIExpression()), !dbg !466
  store i32 -1, i32* %data, align 4, !dbg !467
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !468, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !471, metadata !DIExpression()), !dbg !472
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !473, metadata !DIExpression()), !dbg !474
  store i32 -1, i32* %listenSocket, align 4, !dbg !474
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !475, metadata !DIExpression()), !dbg !476
  store i32 -1, i32* %acceptSocket, align 4, !dbg !476
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !477, metadata !DIExpression()), !dbg !478
  br label %do.body, !dbg !479

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !480
  store i32 %call, i32* %listenSocket, align 4, !dbg !482
  %0 = load i32, i32* %listenSocket, align 4, !dbg !483
  %cmp = icmp eq i32 %0, -1, !dbg !485
  br i1 %cmp, label %if.then, label %if.end, !dbg !486

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !487

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !489
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !489
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !490
  store i16 2, i16* %sin_family, align 4, !dbg !491
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !492
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !493
  store i32 0, i32* %s_addr, align 4, !dbg !494
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !495
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !496
  store i16 %call1, i16* %sin_port, align 2, !dbg !497
  %2 = load i32, i32* %listenSocket, align 4, !dbg !498
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !500
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !501
  %cmp3 = icmp eq i32 %call2, -1, !dbg !502
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !503

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !504

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !506
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !508
  %cmp7 = icmp eq i32 %call6, -1, !dbg !509
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !510

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !511

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !513
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !514
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !515
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !516
  %cmp11 = icmp eq i32 %6, -1, !dbg !518
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !519

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !520

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !522
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !523
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !524
  %conv = trunc i64 %call14 to i32, !dbg !524
  store i32 %conv, i32* %recvResult, align 4, !dbg !525
  %8 = load i32, i32* %recvResult, align 4, !dbg !526
  %cmp15 = icmp eq i32 %8, -1, !dbg !528
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !529

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !530
  %cmp17 = icmp eq i32 %9, 0, !dbg !531
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !532

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !533

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !535
  %idxprom = sext i32 %10 to i64, !dbg !536
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !536
  store i8 0, i8* %arrayidx, align 1, !dbg !537
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !538
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !539
  store i32 %call22, i32* %data, align 4, !dbg !540
  br label %do.end, !dbg !541

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !542
  %cmp23 = icmp ne i32 %11, -1, !dbg !544
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !545

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !546
  %call26 = call i32 @close(i32 %12), !dbg !548
  br label %if.end27, !dbg !549

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !550
  %cmp28 = icmp ne i32 %13, -1, !dbg !552
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !553

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !554
  %call31 = call i32 @close(i32 %14), !dbg !556
  br label %if.end32, !dbg !557

if.end32:                                         ; preds = %if.then30, %if.end27
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !558
  %15 = load i32, i32* %data, align 4, !dbg !559
  call void @goodB2G2Sink(i32 %15), !dbg !560
  ret void, !dbg !561
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !562 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !563, metadata !DIExpression()), !dbg !564
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !565
  %tobool = icmp ne i32 %0, 0, !dbg !565
  br i1 %tobool, label %if.then, label %if.end17, !dbg !567

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !568, metadata !DIExpression()), !dbg !571
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !572, metadata !DIExpression()), !dbg !573
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !574
  %1 = bitcast i8* %call to i32*, !dbg !575
  store i32* %1, i32** %buffer, align 8, !dbg !573
  %2 = load i32*, i32** %buffer, align 8, !dbg !576
  %cmp = icmp eq i32* %2, null, !dbg !578
  br i1 %cmp, label %if.then1, label %if.end, !dbg !579

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #11, !dbg !580
  unreachable, !dbg !580

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !582
  br label %for.cond, !dbg !584

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !585
  %cmp2 = icmp slt i32 %3, 10, !dbg !587
  br i1 %cmp2, label %for.body, label %for.end, !dbg !588

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !589
  %5 = load i32, i32* %i, align 4, !dbg !591
  %idxprom = sext i32 %5 to i64, !dbg !589
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !589
  store i32 0, i32* %arrayidx, align 4, !dbg !592
  br label %for.inc, !dbg !593

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !594
  %inc = add nsw i32 %6, 1, !dbg !594
  store i32 %inc, i32* %i, align 4, !dbg !594
  br label %for.cond, !dbg !595, !llvm.loop !596

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !598
  %cmp3 = icmp sge i32 %7, 0, !dbg !600
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !601

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !602
  %cmp4 = icmp slt i32 %8, 10, !dbg !603
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !604

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !605
  %10 = load i32, i32* %data.addr, align 4, !dbg !607
  %idxprom6 = sext i32 %10 to i64, !dbg !605
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !605
  store i32 1, i32* %arrayidx7, align 4, !dbg !608
  store i32 0, i32* %i, align 4, !dbg !609
  br label %for.cond8, !dbg !611

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !612
  %cmp9 = icmp slt i32 %11, 10, !dbg !614
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !615

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !616
  %13 = load i32, i32* %i, align 4, !dbg !618
  %idxprom11 = sext i32 %13 to i64, !dbg !616
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !616
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !616
  call void @printIntLine(i32 %14), !dbg !619
  br label %for.inc13, !dbg !620

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !621
  %inc14 = add nsw i32 %15, 1, !dbg !621
  store i32 %inc14, i32* %i, align 4, !dbg !621
  br label %for.cond8, !dbg !622, !llvm.loop !623

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !625

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !626
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !628
  %17 = bitcast i32* %16 to i8*, !dbg !628
  call void @free(i8* %17) #8, !dbg !629
  br label %if.end17, !dbg !630

if.end17:                                         ; preds = %if.end16, %entry
  ret void, !dbg !631
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !632 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !633, metadata !DIExpression()), !dbg !634
  store i32 -1, i32* %data, align 4, !dbg !635
  store i32 7, i32* %data, align 4, !dbg !636
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !637
  %0 = load i32, i32* %data, align 4, !dbg !638
  call void @goodG2BSink(i32 %0), !dbg !639
  ret void, !dbg !640
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !641 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !642, metadata !DIExpression()), !dbg !643
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !644
  %tobool = icmp ne i32 %0, 0, !dbg !644
  br i1 %tobool, label %if.then, label %if.end16, !dbg !646

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !647, metadata !DIExpression()), !dbg !650
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !651, metadata !DIExpression()), !dbg !652
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !653
  %1 = bitcast i8* %call to i32*, !dbg !654
  store i32* %1, i32** %buffer, align 8, !dbg !652
  %2 = load i32*, i32** %buffer, align 8, !dbg !655
  %cmp = icmp eq i32* %2, null, !dbg !657
  br i1 %cmp, label %if.then1, label %if.end, !dbg !658

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #11, !dbg !659
  unreachable, !dbg !659

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !661
  br label %for.cond, !dbg !663

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !664
  %cmp2 = icmp slt i32 %3, 10, !dbg !666
  br i1 %cmp2, label %for.body, label %for.end, !dbg !667

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !668
  %5 = load i32, i32* %i, align 4, !dbg !670
  %idxprom = sext i32 %5 to i64, !dbg !668
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !668
  store i32 0, i32* %arrayidx, align 4, !dbg !671
  br label %for.inc, !dbg !672

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !673
  %inc = add nsw i32 %6, 1, !dbg !673
  store i32 %inc, i32* %i, align 4, !dbg !673
  br label %for.cond, !dbg !674, !llvm.loop !675

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !677
  %cmp3 = icmp sge i32 %7, 0, !dbg !679
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !680

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !681
  %9 = load i32, i32* %data.addr, align 4, !dbg !683
  %idxprom5 = sext i32 %9 to i64, !dbg !681
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !681
  store i32 1, i32* %arrayidx6, align 4, !dbg !684
  store i32 0, i32* %i, align 4, !dbg !685
  br label %for.cond7, !dbg !687

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !688
  %cmp8 = icmp slt i32 %10, 10, !dbg !690
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !691

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !692
  %12 = load i32, i32* %i, align 4, !dbg !694
  %idxprom10 = sext i32 %12 to i64, !dbg !692
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !692
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !692
  call void @printIntLine(i32 %13), !dbg !695
  br label %for.inc12, !dbg !696

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !697
  %inc13 = add nsw i32 %14, 1, !dbg !697
  store i32 %inc13, i32* %i, align 4, !dbg !697
  br label %for.cond7, !dbg !698, !llvm.loop !699

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !701

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !702
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !704
  %16 = bitcast i32* %15 to i8*, !dbg !704
  call void @free(i8* %16) #8, !dbg !705
  br label %if.end16, !dbg !706

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !707
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!77, !78, !79, !80, !81}
!llvm.ident = !{!82}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !72, line: 45, type: !67, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !69, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{!5, !18}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !6, line: 24, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17}
!9 = !DIEnumerator(name: "SOCK_STREAM", value: 1)
!10 = !DIEnumerator(name: "SOCK_DGRAM", value: 2)
!11 = !DIEnumerator(name: "SOCK_RAW", value: 3)
!12 = !DIEnumerator(name: "SOCK_RDM", value: 4)
!13 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5)
!14 = !DIEnumerator(name: "SOCK_DCCP", value: 6)
!15 = !DIEnumerator(name: "SOCK_PACKET", value: 10)
!16 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288)
!17 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048)
!18 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !19, line: 40, baseType: !7, size: 32, elements: !20)
!19 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!20 = !{!21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46}
!21 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!22 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!23 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!24 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!25 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!26 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!27 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!28 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!29 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!30 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!31 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!32 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!33 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!34 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!35 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!36 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!37 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!38 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!39 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!40 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!41 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!42 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!43 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!44 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!45 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!46 = !DIEnumerator(name: "IPPROTO_MAX", value: 256)
!47 = !{!48, !53, !7, !66, !68}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !50, line: 26, baseType: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !52, line: 42, baseType: !7)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !55, line: 178, size: 128, elements: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!56 = !{!57, !61}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !54, file: !55, line: 180, baseType: !58, size: 16)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !59, line: 28, baseType: !60)
!59 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!60 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !54, file: !55, line: 181, baseType: !62, size: 112, offset: 16)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 112, elements: !64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !{!65}
!65 = !DISubrange(count: 14)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!69 = !{!0, !70, !73, !75}
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !72, line: 163, type: !67, isLocal: true, isDefinition: true)
!72 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21.c", directory: "/home/joelyang/SSE-Assessment")
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !72, line: 164, type: !67, isLocal: true, isDefinition: true)
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !72, line: 165, type: !67, isLocal: true, isDefinition: true)
!77 = !{i32 7, !"Dwarf Version", i32 4}
!78 = !{i32 2, !"Debug Info Version", i32 3}
!79 = !{i32 1, !"wchar_size", i32 4}
!80 = !{i32 7, !"uwtable", i32 1}
!81 = !{i32 7, !"frame-pointer", i32 2}
!82 = !{!"clang version 13.0.0"}
!83 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_bad", scope: !72, file: !72, line: 80, type: !84, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !86)
!84 = !DISubroutineType(types: !85)
!85 = !{null}
!86 = !{}
!87 = !DILocalVariable(name: "data", scope: !83, file: !72, line: 82, type: !67)
!88 = !DILocation(line: 82, column: 9, scope: !83)
!89 = !DILocation(line: 84, column: 10, scope: !83)
!90 = !DILocalVariable(name: "recvResult", scope: !91, file: !72, line: 90, type: !67)
!91 = distinct !DILexicalBlock(scope: !83, file: !72, line: 85, column: 5)
!92 = !DILocation(line: 90, column: 13, scope: !91)
!93 = !DILocalVariable(name: "service", scope: !91, file: !72, line: 91, type: !94)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !95)
!95 = !{!96, !97, !101, !105}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !94, file: !19, line: 240, baseType: !58, size: 16)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !94, file: !19, line: 241, baseType: !98, size: 16, offset: 16)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 40, baseType: !60)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !94, file: !19, line: 242, baseType: !102, size: 32, offset: 32)
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !103)
!103 = !{!104}
!104 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !102, file: !19, line: 33, baseType: !48, size: 32)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !94, file: !19, line: 245, baseType: !106, size: 64, offset: 64)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 64, elements: !108)
!107 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!108 = !{!109}
!109 = !DISubrange(count: 8)
!110 = !DILocation(line: 91, column: 28, scope: !91)
!111 = !DILocalVariable(name: "listenSocket", scope: !91, file: !72, line: 92, type: !67)
!112 = !DILocation(line: 92, column: 16, scope: !91)
!113 = !DILocalVariable(name: "acceptSocket", scope: !91, file: !72, line: 93, type: !67)
!114 = !DILocation(line: 93, column: 16, scope: !91)
!115 = !DILocalVariable(name: "inputBuffer", scope: !91, file: !72, line: 94, type: !62)
!116 = !DILocation(line: 94, column: 14, scope: !91)
!117 = !DILocation(line: 95, column: 9, scope: !91)
!118 = !DILocation(line: 105, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !91, file: !72, line: 96, column: 9)
!120 = !DILocation(line: 105, column: 26, scope: !119)
!121 = !DILocation(line: 106, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !72, line: 106, column: 17)
!123 = !DILocation(line: 106, column: 30, scope: !122)
!124 = !DILocation(line: 106, column: 17, scope: !119)
!125 = !DILocation(line: 108, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !72, line: 107, column: 13)
!127 = !DILocation(line: 110, column: 13, scope: !119)
!128 = !DILocation(line: 111, column: 21, scope: !119)
!129 = !DILocation(line: 111, column: 32, scope: !119)
!130 = !DILocation(line: 112, column: 21, scope: !119)
!131 = !DILocation(line: 112, column: 30, scope: !119)
!132 = !DILocation(line: 112, column: 37, scope: !119)
!133 = !DILocation(line: 113, column: 32, scope: !119)
!134 = !DILocation(line: 113, column: 21, scope: !119)
!135 = !DILocation(line: 113, column: 30, scope: !119)
!136 = !DILocation(line: 114, column: 22, scope: !137)
!137 = distinct !DILexicalBlock(scope: !119, file: !72, line: 114, column: 17)
!138 = !DILocation(line: 114, column: 36, scope: !137)
!139 = !DILocation(line: 114, column: 17, scope: !137)
!140 = !DILocation(line: 114, column: 81, scope: !137)
!141 = !DILocation(line: 114, column: 17, scope: !119)
!142 = !DILocation(line: 116, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !72, line: 115, column: 13)
!144 = !DILocation(line: 118, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !119, file: !72, line: 118, column: 17)
!146 = !DILocation(line: 118, column: 17, scope: !145)
!147 = !DILocation(line: 118, column: 54, scope: !145)
!148 = !DILocation(line: 118, column: 17, scope: !119)
!149 = !DILocation(line: 120, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !72, line: 119, column: 13)
!151 = !DILocation(line: 122, column: 35, scope: !119)
!152 = !DILocation(line: 122, column: 28, scope: !119)
!153 = !DILocation(line: 122, column: 26, scope: !119)
!154 = !DILocation(line: 123, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !119, file: !72, line: 123, column: 17)
!156 = !DILocation(line: 123, column: 30, scope: !155)
!157 = !DILocation(line: 123, column: 17, scope: !119)
!158 = !DILocation(line: 125, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !72, line: 124, column: 13)
!160 = !DILocation(line: 128, column: 31, scope: !119)
!161 = !DILocation(line: 128, column: 45, scope: !119)
!162 = !DILocation(line: 128, column: 26, scope: !119)
!163 = !DILocation(line: 128, column: 24, scope: !119)
!164 = !DILocation(line: 129, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !119, file: !72, line: 129, column: 17)
!166 = !DILocation(line: 129, column: 28, scope: !165)
!167 = !DILocation(line: 129, column: 44, scope: !165)
!168 = !DILocation(line: 129, column: 47, scope: !165)
!169 = !DILocation(line: 129, column: 58, scope: !165)
!170 = !DILocation(line: 129, column: 17, scope: !119)
!171 = !DILocation(line: 131, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !165, file: !72, line: 130, column: 13)
!173 = !DILocation(line: 134, column: 25, scope: !119)
!174 = !DILocation(line: 134, column: 13, scope: !119)
!175 = !DILocation(line: 134, column: 37, scope: !119)
!176 = !DILocation(line: 136, column: 25, scope: !119)
!177 = !DILocation(line: 136, column: 20, scope: !119)
!178 = !DILocation(line: 136, column: 18, scope: !119)
!179 = !DILocation(line: 137, column: 9, scope: !119)
!180 = !DILocation(line: 139, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !91, file: !72, line: 139, column: 13)
!182 = !DILocation(line: 139, column: 26, scope: !181)
!183 = !DILocation(line: 139, column: 13, scope: !91)
!184 = !DILocation(line: 141, column: 26, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !72, line: 140, column: 9)
!186 = !DILocation(line: 141, column: 13, scope: !185)
!187 = !DILocation(line: 142, column: 9, scope: !185)
!188 = !DILocation(line: 143, column: 13, scope: !189)
!189 = distinct !DILexicalBlock(scope: !91, file: !72, line: 143, column: 13)
!190 = !DILocation(line: 143, column: 26, scope: !189)
!191 = !DILocation(line: 143, column: 13, scope: !91)
!192 = !DILocation(line: 145, column: 26, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !72, line: 144, column: 9)
!194 = !DILocation(line: 145, column: 13, scope: !193)
!195 = !DILocation(line: 146, column: 9, scope: !193)
!196 = !DILocation(line: 154, column: 15, scope: !83)
!197 = !DILocation(line: 155, column: 13, scope: !83)
!198 = !DILocation(line: 155, column: 5, scope: !83)
!199 = !DILocation(line: 156, column: 1, scope: !83)
!200 = distinct !DISubprogram(name: "badSink", scope: !72, file: !72, line: 47, type: !201, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !86)
!201 = !DISubroutineType(types: !202)
!202 = !{null, !67}
!203 = !DILocalVariable(name: "data", arg: 1, scope: !200, file: !72, line: 47, type: !67)
!204 = !DILocation(line: 47, column: 25, scope: !200)
!205 = !DILocation(line: 49, column: 8, scope: !206)
!206 = distinct !DILexicalBlock(scope: !200, file: !72, line: 49, column: 8)
!207 = !DILocation(line: 49, column: 8, scope: !200)
!208 = !DILocalVariable(name: "i", scope: !209, file: !72, line: 52, type: !67)
!209 = distinct !DILexicalBlock(scope: !210, file: !72, line: 51, column: 9)
!210 = distinct !DILexicalBlock(scope: !206, file: !72, line: 50, column: 5)
!211 = !DILocation(line: 52, column: 17, scope: !209)
!212 = !DILocalVariable(name: "buffer", scope: !209, file: !72, line: 53, type: !66)
!213 = !DILocation(line: 53, column: 19, scope: !209)
!214 = !DILocation(line: 53, column: 35, scope: !209)
!215 = !DILocation(line: 53, column: 28, scope: !209)
!216 = !DILocation(line: 54, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !209, file: !72, line: 54, column: 17)
!218 = !DILocation(line: 54, column: 24, scope: !217)
!219 = !DILocation(line: 54, column: 17, scope: !209)
!220 = !DILocation(line: 54, column: 34, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !72, line: 54, column: 33)
!222 = !DILocation(line: 56, column: 20, scope: !223)
!223 = distinct !DILexicalBlock(scope: !209, file: !72, line: 56, column: 13)
!224 = !DILocation(line: 56, column: 18, scope: !223)
!225 = !DILocation(line: 56, column: 25, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !72, line: 56, column: 13)
!227 = !DILocation(line: 56, column: 27, scope: !226)
!228 = !DILocation(line: 56, column: 13, scope: !223)
!229 = !DILocation(line: 58, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !72, line: 57, column: 13)
!231 = !DILocation(line: 58, column: 24, scope: !230)
!232 = !DILocation(line: 58, column: 27, scope: !230)
!233 = !DILocation(line: 59, column: 13, scope: !230)
!234 = !DILocation(line: 56, column: 34, scope: !226)
!235 = !DILocation(line: 56, column: 13, scope: !226)
!236 = distinct !{!236, !228, !237, !238}
!237 = !DILocation(line: 59, column: 13, scope: !223)
!238 = !{!"llvm.loop.mustprogress"}
!239 = !DILocation(line: 62, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !209, file: !72, line: 62, column: 17)
!241 = !DILocation(line: 62, column: 22, scope: !240)
!242 = !DILocation(line: 62, column: 17, scope: !209)
!243 = !DILocation(line: 64, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !72, line: 63, column: 13)
!245 = !DILocation(line: 64, column: 24, scope: !244)
!246 = !DILocation(line: 64, column: 30, scope: !244)
!247 = !DILocation(line: 66, column: 23, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !72, line: 66, column: 17)
!249 = !DILocation(line: 66, column: 21, scope: !248)
!250 = !DILocation(line: 66, column: 28, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !72, line: 66, column: 17)
!252 = !DILocation(line: 66, column: 30, scope: !251)
!253 = !DILocation(line: 66, column: 17, scope: !248)
!254 = !DILocation(line: 68, column: 34, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !72, line: 67, column: 17)
!256 = !DILocation(line: 68, column: 41, scope: !255)
!257 = !DILocation(line: 68, column: 21, scope: !255)
!258 = !DILocation(line: 69, column: 17, scope: !255)
!259 = !DILocation(line: 66, column: 37, scope: !251)
!260 = !DILocation(line: 66, column: 17, scope: !251)
!261 = distinct !{!261, !253, !262, !238}
!262 = !DILocation(line: 69, column: 17, scope: !248)
!263 = !DILocation(line: 70, column: 13, scope: !244)
!264 = !DILocation(line: 73, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !240, file: !72, line: 72, column: 13)
!266 = !DILocation(line: 75, column: 18, scope: !209)
!267 = !DILocation(line: 75, column: 13, scope: !209)
!268 = !DILocation(line: 77, column: 5, scope: !210)
!269 = !DILocation(line: 78, column: 1, scope: !200)
!270 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_good", scope: !72, file: !72, line: 440, type: !84, scopeLine: 441, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !86)
!271 = !DILocation(line: 442, column: 5, scope: !270)
!272 = !DILocation(line: 443, column: 5, scope: !270)
!273 = !DILocation(line: 444, column: 5, scope: !270)
!274 = !DILocation(line: 445, column: 1, scope: !270)
!275 = distinct !DISubprogram(name: "main", scope: !72, file: !72, line: 456, type: !276, scopeLine: 457, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !86)
!276 = !DISubroutineType(types: !277)
!277 = !{!67, !67, !278}
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64)
!279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!280 = !DILocalVariable(name: "argc", arg: 1, scope: !275, file: !72, line: 456, type: !67)
!281 = !DILocation(line: 456, column: 14, scope: !275)
!282 = !DILocalVariable(name: "argv", arg: 2, scope: !275, file: !72, line: 456, type: !278)
!283 = !DILocation(line: 456, column: 27, scope: !275)
!284 = !DILocation(line: 459, column: 22, scope: !275)
!285 = !DILocation(line: 459, column: 12, scope: !275)
!286 = !DILocation(line: 459, column: 5, scope: !275)
!287 = !DILocation(line: 461, column: 5, scope: !275)
!288 = !DILocation(line: 462, column: 5, scope: !275)
!289 = !DILocation(line: 463, column: 5, scope: !275)
!290 = !DILocation(line: 466, column: 5, scope: !275)
!291 = !DILocation(line: 467, column: 5, scope: !275)
!292 = !DILocation(line: 468, column: 5, scope: !275)
!293 = !DILocation(line: 470, column: 5, scope: !275)
!294 = distinct !DISubprogram(name: "goodB2G1", scope: !72, file: !72, line: 205, type: !84, scopeLine: 206, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !86)
!295 = !DILocalVariable(name: "data", scope: !294, file: !72, line: 207, type: !67)
!296 = !DILocation(line: 207, column: 9, scope: !294)
!297 = !DILocation(line: 209, column: 10, scope: !294)
!298 = !DILocalVariable(name: "recvResult", scope: !299, file: !72, line: 215, type: !67)
!299 = distinct !DILexicalBlock(scope: !294, file: !72, line: 210, column: 5)
!300 = !DILocation(line: 215, column: 13, scope: !299)
!301 = !DILocalVariable(name: "service", scope: !299, file: !72, line: 216, type: !94)
!302 = !DILocation(line: 216, column: 28, scope: !299)
!303 = !DILocalVariable(name: "listenSocket", scope: !299, file: !72, line: 217, type: !67)
!304 = !DILocation(line: 217, column: 16, scope: !299)
!305 = !DILocalVariable(name: "acceptSocket", scope: !299, file: !72, line: 218, type: !67)
!306 = !DILocation(line: 218, column: 16, scope: !299)
!307 = !DILocalVariable(name: "inputBuffer", scope: !299, file: !72, line: 219, type: !62)
!308 = !DILocation(line: 219, column: 14, scope: !299)
!309 = !DILocation(line: 220, column: 9, scope: !299)
!310 = !DILocation(line: 230, column: 28, scope: !311)
!311 = distinct !DILexicalBlock(scope: !299, file: !72, line: 221, column: 9)
!312 = !DILocation(line: 230, column: 26, scope: !311)
!313 = !DILocation(line: 231, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !311, file: !72, line: 231, column: 17)
!315 = !DILocation(line: 231, column: 30, scope: !314)
!316 = !DILocation(line: 231, column: 17, scope: !311)
!317 = !DILocation(line: 233, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !72, line: 232, column: 13)
!319 = !DILocation(line: 235, column: 13, scope: !311)
!320 = !DILocation(line: 236, column: 21, scope: !311)
!321 = !DILocation(line: 236, column: 32, scope: !311)
!322 = !DILocation(line: 237, column: 21, scope: !311)
!323 = !DILocation(line: 237, column: 30, scope: !311)
!324 = !DILocation(line: 237, column: 37, scope: !311)
!325 = !DILocation(line: 238, column: 32, scope: !311)
!326 = !DILocation(line: 238, column: 21, scope: !311)
!327 = !DILocation(line: 238, column: 30, scope: !311)
!328 = !DILocation(line: 239, column: 22, scope: !329)
!329 = distinct !DILexicalBlock(scope: !311, file: !72, line: 239, column: 17)
!330 = !DILocation(line: 239, column: 36, scope: !329)
!331 = !DILocation(line: 239, column: 17, scope: !329)
!332 = !DILocation(line: 239, column: 81, scope: !329)
!333 = !DILocation(line: 239, column: 17, scope: !311)
!334 = !DILocation(line: 241, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !329, file: !72, line: 240, column: 13)
!336 = !DILocation(line: 243, column: 24, scope: !337)
!337 = distinct !DILexicalBlock(scope: !311, file: !72, line: 243, column: 17)
!338 = !DILocation(line: 243, column: 17, scope: !337)
!339 = !DILocation(line: 243, column: 54, scope: !337)
!340 = !DILocation(line: 243, column: 17, scope: !311)
!341 = !DILocation(line: 245, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !337, file: !72, line: 244, column: 13)
!343 = !DILocation(line: 247, column: 35, scope: !311)
!344 = !DILocation(line: 247, column: 28, scope: !311)
!345 = !DILocation(line: 247, column: 26, scope: !311)
!346 = !DILocation(line: 248, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !311, file: !72, line: 248, column: 17)
!348 = !DILocation(line: 248, column: 30, scope: !347)
!349 = !DILocation(line: 248, column: 17, scope: !311)
!350 = !DILocation(line: 250, column: 17, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !72, line: 249, column: 13)
!352 = !DILocation(line: 253, column: 31, scope: !311)
!353 = !DILocation(line: 253, column: 45, scope: !311)
!354 = !DILocation(line: 253, column: 26, scope: !311)
!355 = !DILocation(line: 253, column: 24, scope: !311)
!356 = !DILocation(line: 254, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !311, file: !72, line: 254, column: 17)
!358 = !DILocation(line: 254, column: 28, scope: !357)
!359 = !DILocation(line: 254, column: 44, scope: !357)
!360 = !DILocation(line: 254, column: 47, scope: !357)
!361 = !DILocation(line: 254, column: 58, scope: !357)
!362 = !DILocation(line: 254, column: 17, scope: !311)
!363 = !DILocation(line: 256, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !357, file: !72, line: 255, column: 13)
!365 = !DILocation(line: 259, column: 25, scope: !311)
!366 = !DILocation(line: 259, column: 13, scope: !311)
!367 = !DILocation(line: 259, column: 37, scope: !311)
!368 = !DILocation(line: 261, column: 25, scope: !311)
!369 = !DILocation(line: 261, column: 20, scope: !311)
!370 = !DILocation(line: 261, column: 18, scope: !311)
!371 = !DILocation(line: 262, column: 9, scope: !311)
!372 = !DILocation(line: 264, column: 13, scope: !373)
!373 = distinct !DILexicalBlock(scope: !299, file: !72, line: 264, column: 13)
!374 = !DILocation(line: 264, column: 26, scope: !373)
!375 = !DILocation(line: 264, column: 13, scope: !299)
!376 = !DILocation(line: 266, column: 26, scope: !377)
!377 = distinct !DILexicalBlock(scope: !373, file: !72, line: 265, column: 9)
!378 = !DILocation(line: 266, column: 13, scope: !377)
!379 = !DILocation(line: 267, column: 9, scope: !377)
!380 = !DILocation(line: 268, column: 13, scope: !381)
!381 = distinct !DILexicalBlock(scope: !299, file: !72, line: 268, column: 13)
!382 = !DILocation(line: 268, column: 26, scope: !381)
!383 = !DILocation(line: 268, column: 13, scope: !299)
!384 = !DILocation(line: 270, column: 26, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !72, line: 269, column: 9)
!386 = !DILocation(line: 270, column: 13, scope: !385)
!387 = !DILocation(line: 271, column: 9, scope: !385)
!388 = !DILocation(line: 279, column: 20, scope: !294)
!389 = !DILocation(line: 280, column: 18, scope: !294)
!390 = !DILocation(line: 280, column: 5, scope: !294)
!391 = !DILocation(line: 281, column: 1, scope: !294)
!392 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !72, file: !72, line: 168, type: !201, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !86)
!393 = !DILocalVariable(name: "data", arg: 1, scope: !392, file: !72, line: 168, type: !67)
!394 = !DILocation(line: 168, column: 30, scope: !392)
!395 = !DILocation(line: 170, column: 8, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !72, line: 170, column: 8)
!397 = !DILocation(line: 170, column: 8, scope: !392)
!398 = !DILocation(line: 173, column: 9, scope: !399)
!399 = distinct !DILexicalBlock(scope: !396, file: !72, line: 171, column: 5)
!400 = !DILocation(line: 174, column: 5, scope: !399)
!401 = !DILocalVariable(name: "i", scope: !402, file: !72, line: 178, type: !67)
!402 = distinct !DILexicalBlock(scope: !403, file: !72, line: 177, column: 9)
!403 = distinct !DILexicalBlock(scope: !396, file: !72, line: 176, column: 5)
!404 = !DILocation(line: 178, column: 17, scope: !402)
!405 = !DILocalVariable(name: "buffer", scope: !402, file: !72, line: 179, type: !66)
!406 = !DILocation(line: 179, column: 19, scope: !402)
!407 = !DILocation(line: 179, column: 35, scope: !402)
!408 = !DILocation(line: 179, column: 28, scope: !402)
!409 = !DILocation(line: 180, column: 17, scope: !410)
!410 = distinct !DILexicalBlock(scope: !402, file: !72, line: 180, column: 17)
!411 = !DILocation(line: 180, column: 24, scope: !410)
!412 = !DILocation(line: 180, column: 17, scope: !402)
!413 = !DILocation(line: 180, column: 34, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !72, line: 180, column: 33)
!415 = !DILocation(line: 182, column: 20, scope: !416)
!416 = distinct !DILexicalBlock(scope: !402, file: !72, line: 182, column: 13)
!417 = !DILocation(line: 182, column: 18, scope: !416)
!418 = !DILocation(line: 182, column: 25, scope: !419)
!419 = distinct !DILexicalBlock(scope: !416, file: !72, line: 182, column: 13)
!420 = !DILocation(line: 182, column: 27, scope: !419)
!421 = !DILocation(line: 182, column: 13, scope: !416)
!422 = !DILocation(line: 184, column: 17, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !72, line: 183, column: 13)
!424 = !DILocation(line: 184, column: 24, scope: !423)
!425 = !DILocation(line: 184, column: 27, scope: !423)
!426 = !DILocation(line: 185, column: 13, scope: !423)
!427 = !DILocation(line: 182, column: 34, scope: !419)
!428 = !DILocation(line: 182, column: 13, scope: !419)
!429 = distinct !{!429, !421, !430, !238}
!430 = !DILocation(line: 185, column: 13, scope: !416)
!431 = !DILocation(line: 187, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !402, file: !72, line: 187, column: 17)
!433 = !DILocation(line: 187, column: 22, scope: !432)
!434 = !DILocation(line: 187, column: 27, scope: !432)
!435 = !DILocation(line: 187, column: 30, scope: !432)
!436 = !DILocation(line: 187, column: 35, scope: !432)
!437 = !DILocation(line: 187, column: 17, scope: !402)
!438 = !DILocation(line: 189, column: 17, scope: !439)
!439 = distinct !DILexicalBlock(scope: !432, file: !72, line: 188, column: 13)
!440 = !DILocation(line: 189, column: 24, scope: !439)
!441 = !DILocation(line: 189, column: 30, scope: !439)
!442 = !DILocation(line: 191, column: 23, scope: !443)
!443 = distinct !DILexicalBlock(scope: !439, file: !72, line: 191, column: 17)
!444 = !DILocation(line: 191, column: 21, scope: !443)
!445 = !DILocation(line: 191, column: 28, scope: !446)
!446 = distinct !DILexicalBlock(scope: !443, file: !72, line: 191, column: 17)
!447 = !DILocation(line: 191, column: 30, scope: !446)
!448 = !DILocation(line: 191, column: 17, scope: !443)
!449 = !DILocation(line: 193, column: 34, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !72, line: 192, column: 17)
!451 = !DILocation(line: 193, column: 41, scope: !450)
!452 = !DILocation(line: 193, column: 21, scope: !450)
!453 = !DILocation(line: 194, column: 17, scope: !450)
!454 = !DILocation(line: 191, column: 37, scope: !446)
!455 = !DILocation(line: 191, column: 17, scope: !446)
!456 = distinct !{!456, !448, !457, !238}
!457 = !DILocation(line: 194, column: 17, scope: !443)
!458 = !DILocation(line: 195, column: 13, scope: !439)
!459 = !DILocation(line: 198, column: 17, scope: !460)
!460 = distinct !DILexicalBlock(scope: !432, file: !72, line: 197, column: 13)
!461 = !DILocation(line: 200, column: 18, scope: !402)
!462 = !DILocation(line: 200, column: 13, scope: !402)
!463 = !DILocation(line: 203, column: 1, scope: !392)
!464 = distinct !DISubprogram(name: "goodB2G2", scope: !72, file: !72, line: 316, type: !84, scopeLine: 317, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !86)
!465 = !DILocalVariable(name: "data", scope: !464, file: !72, line: 318, type: !67)
!466 = !DILocation(line: 318, column: 9, scope: !464)
!467 = !DILocation(line: 320, column: 10, scope: !464)
!468 = !DILocalVariable(name: "recvResult", scope: !469, file: !72, line: 326, type: !67)
!469 = distinct !DILexicalBlock(scope: !464, file: !72, line: 321, column: 5)
!470 = !DILocation(line: 326, column: 13, scope: !469)
!471 = !DILocalVariable(name: "service", scope: !469, file: !72, line: 327, type: !94)
!472 = !DILocation(line: 327, column: 28, scope: !469)
!473 = !DILocalVariable(name: "listenSocket", scope: !469, file: !72, line: 328, type: !67)
!474 = !DILocation(line: 328, column: 16, scope: !469)
!475 = !DILocalVariable(name: "acceptSocket", scope: !469, file: !72, line: 329, type: !67)
!476 = !DILocation(line: 329, column: 16, scope: !469)
!477 = !DILocalVariable(name: "inputBuffer", scope: !469, file: !72, line: 330, type: !62)
!478 = !DILocation(line: 330, column: 14, scope: !469)
!479 = !DILocation(line: 331, column: 9, scope: !469)
!480 = !DILocation(line: 341, column: 28, scope: !481)
!481 = distinct !DILexicalBlock(scope: !469, file: !72, line: 332, column: 9)
!482 = !DILocation(line: 341, column: 26, scope: !481)
!483 = !DILocation(line: 342, column: 17, scope: !484)
!484 = distinct !DILexicalBlock(scope: !481, file: !72, line: 342, column: 17)
!485 = !DILocation(line: 342, column: 30, scope: !484)
!486 = !DILocation(line: 342, column: 17, scope: !481)
!487 = !DILocation(line: 344, column: 17, scope: !488)
!488 = distinct !DILexicalBlock(scope: !484, file: !72, line: 343, column: 13)
!489 = !DILocation(line: 346, column: 13, scope: !481)
!490 = !DILocation(line: 347, column: 21, scope: !481)
!491 = !DILocation(line: 347, column: 32, scope: !481)
!492 = !DILocation(line: 348, column: 21, scope: !481)
!493 = !DILocation(line: 348, column: 30, scope: !481)
!494 = !DILocation(line: 348, column: 37, scope: !481)
!495 = !DILocation(line: 349, column: 32, scope: !481)
!496 = !DILocation(line: 349, column: 21, scope: !481)
!497 = !DILocation(line: 349, column: 30, scope: !481)
!498 = !DILocation(line: 350, column: 22, scope: !499)
!499 = distinct !DILexicalBlock(scope: !481, file: !72, line: 350, column: 17)
!500 = !DILocation(line: 350, column: 36, scope: !499)
!501 = !DILocation(line: 350, column: 17, scope: !499)
!502 = !DILocation(line: 350, column: 81, scope: !499)
!503 = !DILocation(line: 350, column: 17, scope: !481)
!504 = !DILocation(line: 352, column: 17, scope: !505)
!505 = distinct !DILexicalBlock(scope: !499, file: !72, line: 351, column: 13)
!506 = !DILocation(line: 354, column: 24, scope: !507)
!507 = distinct !DILexicalBlock(scope: !481, file: !72, line: 354, column: 17)
!508 = !DILocation(line: 354, column: 17, scope: !507)
!509 = !DILocation(line: 354, column: 54, scope: !507)
!510 = !DILocation(line: 354, column: 17, scope: !481)
!511 = !DILocation(line: 356, column: 17, scope: !512)
!512 = distinct !DILexicalBlock(scope: !507, file: !72, line: 355, column: 13)
!513 = !DILocation(line: 358, column: 35, scope: !481)
!514 = !DILocation(line: 358, column: 28, scope: !481)
!515 = !DILocation(line: 358, column: 26, scope: !481)
!516 = !DILocation(line: 359, column: 17, scope: !517)
!517 = distinct !DILexicalBlock(scope: !481, file: !72, line: 359, column: 17)
!518 = !DILocation(line: 359, column: 30, scope: !517)
!519 = !DILocation(line: 359, column: 17, scope: !481)
!520 = !DILocation(line: 361, column: 17, scope: !521)
!521 = distinct !DILexicalBlock(scope: !517, file: !72, line: 360, column: 13)
!522 = !DILocation(line: 364, column: 31, scope: !481)
!523 = !DILocation(line: 364, column: 45, scope: !481)
!524 = !DILocation(line: 364, column: 26, scope: !481)
!525 = !DILocation(line: 364, column: 24, scope: !481)
!526 = !DILocation(line: 365, column: 17, scope: !527)
!527 = distinct !DILexicalBlock(scope: !481, file: !72, line: 365, column: 17)
!528 = !DILocation(line: 365, column: 28, scope: !527)
!529 = !DILocation(line: 365, column: 44, scope: !527)
!530 = !DILocation(line: 365, column: 47, scope: !527)
!531 = !DILocation(line: 365, column: 58, scope: !527)
!532 = !DILocation(line: 365, column: 17, scope: !481)
!533 = !DILocation(line: 367, column: 17, scope: !534)
!534 = distinct !DILexicalBlock(scope: !527, file: !72, line: 366, column: 13)
!535 = !DILocation(line: 370, column: 25, scope: !481)
!536 = !DILocation(line: 370, column: 13, scope: !481)
!537 = !DILocation(line: 370, column: 37, scope: !481)
!538 = !DILocation(line: 372, column: 25, scope: !481)
!539 = !DILocation(line: 372, column: 20, scope: !481)
!540 = !DILocation(line: 372, column: 18, scope: !481)
!541 = !DILocation(line: 373, column: 9, scope: !481)
!542 = !DILocation(line: 375, column: 13, scope: !543)
!543 = distinct !DILexicalBlock(scope: !469, file: !72, line: 375, column: 13)
!544 = !DILocation(line: 375, column: 26, scope: !543)
!545 = !DILocation(line: 375, column: 13, scope: !469)
!546 = !DILocation(line: 377, column: 26, scope: !547)
!547 = distinct !DILexicalBlock(scope: !543, file: !72, line: 376, column: 9)
!548 = !DILocation(line: 377, column: 13, scope: !547)
!549 = !DILocation(line: 378, column: 9, scope: !547)
!550 = !DILocation(line: 379, column: 13, scope: !551)
!551 = distinct !DILexicalBlock(scope: !469, file: !72, line: 379, column: 13)
!552 = !DILocation(line: 379, column: 26, scope: !551)
!553 = !DILocation(line: 379, column: 13, scope: !469)
!554 = !DILocation(line: 381, column: 26, scope: !555)
!555 = distinct !DILexicalBlock(scope: !551, file: !72, line: 380, column: 9)
!556 = !DILocation(line: 381, column: 13, scope: !555)
!557 = !DILocation(line: 382, column: 9, scope: !555)
!558 = !DILocation(line: 390, column: 20, scope: !464)
!559 = !DILocation(line: 391, column: 18, scope: !464)
!560 = !DILocation(line: 391, column: 5, scope: !464)
!561 = !DILocation(line: 392, column: 1, scope: !464)
!562 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !72, file: !72, line: 284, type: !201, scopeLine: 285, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !86)
!563 = !DILocalVariable(name: "data", arg: 1, scope: !562, file: !72, line: 284, type: !67)
!564 = !DILocation(line: 284, column: 30, scope: !562)
!565 = !DILocation(line: 286, column: 8, scope: !566)
!566 = distinct !DILexicalBlock(scope: !562, file: !72, line: 286, column: 8)
!567 = !DILocation(line: 286, column: 8, scope: !562)
!568 = !DILocalVariable(name: "i", scope: !569, file: !72, line: 289, type: !67)
!569 = distinct !DILexicalBlock(scope: !570, file: !72, line: 288, column: 9)
!570 = distinct !DILexicalBlock(scope: !566, file: !72, line: 287, column: 5)
!571 = !DILocation(line: 289, column: 17, scope: !569)
!572 = !DILocalVariable(name: "buffer", scope: !569, file: !72, line: 290, type: !66)
!573 = !DILocation(line: 290, column: 19, scope: !569)
!574 = !DILocation(line: 290, column: 35, scope: !569)
!575 = !DILocation(line: 290, column: 28, scope: !569)
!576 = !DILocation(line: 291, column: 17, scope: !577)
!577 = distinct !DILexicalBlock(scope: !569, file: !72, line: 291, column: 17)
!578 = !DILocation(line: 291, column: 24, scope: !577)
!579 = !DILocation(line: 291, column: 17, scope: !569)
!580 = !DILocation(line: 291, column: 34, scope: !581)
!581 = distinct !DILexicalBlock(scope: !577, file: !72, line: 291, column: 33)
!582 = !DILocation(line: 293, column: 20, scope: !583)
!583 = distinct !DILexicalBlock(scope: !569, file: !72, line: 293, column: 13)
!584 = !DILocation(line: 293, column: 18, scope: !583)
!585 = !DILocation(line: 293, column: 25, scope: !586)
!586 = distinct !DILexicalBlock(scope: !583, file: !72, line: 293, column: 13)
!587 = !DILocation(line: 293, column: 27, scope: !586)
!588 = !DILocation(line: 293, column: 13, scope: !583)
!589 = !DILocation(line: 295, column: 17, scope: !590)
!590 = distinct !DILexicalBlock(scope: !586, file: !72, line: 294, column: 13)
!591 = !DILocation(line: 295, column: 24, scope: !590)
!592 = !DILocation(line: 295, column: 27, scope: !590)
!593 = !DILocation(line: 296, column: 13, scope: !590)
!594 = !DILocation(line: 293, column: 34, scope: !586)
!595 = !DILocation(line: 293, column: 13, scope: !586)
!596 = distinct !{!596, !588, !597, !238}
!597 = !DILocation(line: 296, column: 13, scope: !583)
!598 = !DILocation(line: 298, column: 17, scope: !599)
!599 = distinct !DILexicalBlock(scope: !569, file: !72, line: 298, column: 17)
!600 = !DILocation(line: 298, column: 22, scope: !599)
!601 = !DILocation(line: 298, column: 27, scope: !599)
!602 = !DILocation(line: 298, column: 30, scope: !599)
!603 = !DILocation(line: 298, column: 35, scope: !599)
!604 = !DILocation(line: 298, column: 17, scope: !569)
!605 = !DILocation(line: 300, column: 17, scope: !606)
!606 = distinct !DILexicalBlock(scope: !599, file: !72, line: 299, column: 13)
!607 = !DILocation(line: 300, column: 24, scope: !606)
!608 = !DILocation(line: 300, column: 30, scope: !606)
!609 = !DILocation(line: 302, column: 23, scope: !610)
!610 = distinct !DILexicalBlock(scope: !606, file: !72, line: 302, column: 17)
!611 = !DILocation(line: 302, column: 21, scope: !610)
!612 = !DILocation(line: 302, column: 28, scope: !613)
!613 = distinct !DILexicalBlock(scope: !610, file: !72, line: 302, column: 17)
!614 = !DILocation(line: 302, column: 30, scope: !613)
!615 = !DILocation(line: 302, column: 17, scope: !610)
!616 = !DILocation(line: 304, column: 34, scope: !617)
!617 = distinct !DILexicalBlock(scope: !613, file: !72, line: 303, column: 17)
!618 = !DILocation(line: 304, column: 41, scope: !617)
!619 = !DILocation(line: 304, column: 21, scope: !617)
!620 = !DILocation(line: 305, column: 17, scope: !617)
!621 = !DILocation(line: 302, column: 37, scope: !613)
!622 = !DILocation(line: 302, column: 17, scope: !613)
!623 = distinct !{!623, !615, !624, !238}
!624 = !DILocation(line: 305, column: 17, scope: !610)
!625 = !DILocation(line: 306, column: 13, scope: !606)
!626 = !DILocation(line: 309, column: 17, scope: !627)
!627 = distinct !DILexicalBlock(scope: !599, file: !72, line: 308, column: 13)
!628 = !DILocation(line: 311, column: 18, scope: !569)
!629 = !DILocation(line: 311, column: 13, scope: !569)
!630 = !DILocation(line: 313, column: 5, scope: !570)
!631 = !DILocation(line: 314, column: 1, scope: !562)
!632 = distinct !DISubprogram(name: "goodG2B", scope: !72, file: !72, line: 428, type: !84, scopeLine: 429, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !86)
!633 = !DILocalVariable(name: "data", scope: !632, file: !72, line: 430, type: !67)
!634 = !DILocation(line: 430, column: 9, scope: !632)
!635 = !DILocation(line: 432, column: 10, scope: !632)
!636 = !DILocation(line: 435, column: 10, scope: !632)
!637 = !DILocation(line: 436, column: 19, scope: !632)
!638 = !DILocation(line: 437, column: 17, scope: !632)
!639 = !DILocation(line: 437, column: 5, scope: !632)
!640 = !DILocation(line: 438, column: 1, scope: !632)
!641 = distinct !DISubprogram(name: "goodG2BSink", scope: !72, file: !72, line: 395, type: !201, scopeLine: 396, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !86)
!642 = !DILocalVariable(name: "data", arg: 1, scope: !641, file: !72, line: 395, type: !67)
!643 = !DILocation(line: 395, column: 29, scope: !641)
!644 = !DILocation(line: 397, column: 8, scope: !645)
!645 = distinct !DILexicalBlock(scope: !641, file: !72, line: 397, column: 8)
!646 = !DILocation(line: 397, column: 8, scope: !641)
!647 = !DILocalVariable(name: "i", scope: !648, file: !72, line: 400, type: !67)
!648 = distinct !DILexicalBlock(scope: !649, file: !72, line: 399, column: 9)
!649 = distinct !DILexicalBlock(scope: !645, file: !72, line: 398, column: 5)
!650 = !DILocation(line: 400, column: 17, scope: !648)
!651 = !DILocalVariable(name: "buffer", scope: !648, file: !72, line: 401, type: !66)
!652 = !DILocation(line: 401, column: 19, scope: !648)
!653 = !DILocation(line: 401, column: 35, scope: !648)
!654 = !DILocation(line: 401, column: 28, scope: !648)
!655 = !DILocation(line: 402, column: 17, scope: !656)
!656 = distinct !DILexicalBlock(scope: !648, file: !72, line: 402, column: 17)
!657 = !DILocation(line: 402, column: 24, scope: !656)
!658 = !DILocation(line: 402, column: 17, scope: !648)
!659 = !DILocation(line: 402, column: 34, scope: !660)
!660 = distinct !DILexicalBlock(scope: !656, file: !72, line: 402, column: 33)
!661 = !DILocation(line: 404, column: 20, scope: !662)
!662 = distinct !DILexicalBlock(scope: !648, file: !72, line: 404, column: 13)
!663 = !DILocation(line: 404, column: 18, scope: !662)
!664 = !DILocation(line: 404, column: 25, scope: !665)
!665 = distinct !DILexicalBlock(scope: !662, file: !72, line: 404, column: 13)
!666 = !DILocation(line: 404, column: 27, scope: !665)
!667 = !DILocation(line: 404, column: 13, scope: !662)
!668 = !DILocation(line: 406, column: 17, scope: !669)
!669 = distinct !DILexicalBlock(scope: !665, file: !72, line: 405, column: 13)
!670 = !DILocation(line: 406, column: 24, scope: !669)
!671 = !DILocation(line: 406, column: 27, scope: !669)
!672 = !DILocation(line: 407, column: 13, scope: !669)
!673 = !DILocation(line: 404, column: 34, scope: !665)
!674 = !DILocation(line: 404, column: 13, scope: !665)
!675 = distinct !{!675, !667, !676, !238}
!676 = !DILocation(line: 407, column: 13, scope: !662)
!677 = !DILocation(line: 410, column: 17, scope: !678)
!678 = distinct !DILexicalBlock(scope: !648, file: !72, line: 410, column: 17)
!679 = !DILocation(line: 410, column: 22, scope: !678)
!680 = !DILocation(line: 410, column: 17, scope: !648)
!681 = !DILocation(line: 412, column: 17, scope: !682)
!682 = distinct !DILexicalBlock(scope: !678, file: !72, line: 411, column: 13)
!683 = !DILocation(line: 412, column: 24, scope: !682)
!684 = !DILocation(line: 412, column: 30, scope: !682)
!685 = !DILocation(line: 414, column: 23, scope: !686)
!686 = distinct !DILexicalBlock(scope: !682, file: !72, line: 414, column: 17)
!687 = !DILocation(line: 414, column: 21, scope: !686)
!688 = !DILocation(line: 414, column: 28, scope: !689)
!689 = distinct !DILexicalBlock(scope: !686, file: !72, line: 414, column: 17)
!690 = !DILocation(line: 414, column: 30, scope: !689)
!691 = !DILocation(line: 414, column: 17, scope: !686)
!692 = !DILocation(line: 416, column: 34, scope: !693)
!693 = distinct !DILexicalBlock(scope: !689, file: !72, line: 415, column: 17)
!694 = !DILocation(line: 416, column: 41, scope: !693)
!695 = !DILocation(line: 416, column: 21, scope: !693)
!696 = !DILocation(line: 417, column: 17, scope: !693)
!697 = !DILocation(line: 414, column: 37, scope: !689)
!698 = !DILocation(line: 414, column: 17, scope: !689)
!699 = distinct !{!699, !691, !700, !238}
!700 = !DILocation(line: 417, column: 17, scope: !686)
!701 = !DILocation(line: 418, column: 13, scope: !682)
!702 = !DILocation(line: 421, column: 17, scope: !703)
!703 = distinct !DILexicalBlock(scope: !678, file: !72, line: 420, column: 13)
!704 = !DILocation(line: 423, column: 18, scope: !648)
!705 = !DILocation(line: 423, column: 13, scope: !648)
!706 = !DILocation(line: 425, column: 5, scope: !649)
!707 = !DILocation(line: 426, column: 1, scope: !641)
