; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_badData = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_goodG2BData = internal global i32 0, align 4, !dbg !67
@CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_goodB2GData = internal global i32 0, align 4, !dbg !71
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_bad() #0 !dbg !79 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !83, metadata !DIExpression()), !dbg !84
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
  store i32 %15, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_badData, align 4, !dbg !193
  call void @badSink(), !dbg !194
  ret void, !dbg !195
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_good() #0 !dbg !196 {
entry:
  call void @goodG2B(), !dbg !197
  call void @goodB2G(), !dbg !198
  ret void, !dbg !199
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !200 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !205, metadata !DIExpression()), !dbg !206
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !207, metadata !DIExpression()), !dbg !208
  %call = call i64 @time(i64* null) #7, !dbg !209
  %conv = trunc i64 %call to i32, !dbg !210
  call void @srand(i32 %conv) #7, !dbg !211
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !212
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_good(), !dbg !213
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !214
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !215
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_bad(), !dbg !216
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !217
  ret i32 0, !dbg !218
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !219 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !220, metadata !DIExpression()), !dbg !221
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_badData, align 4, !dbg !222
  store i32 %0, i32* %data, align 4, !dbg !221
  call void @llvm.dbg.declare(metadata i32* %i, metadata !223, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !226, metadata !DIExpression()), !dbg !230
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !230
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !230
  %2 = load i32, i32* %data, align 4, !dbg !231
  %cmp = icmp sge i32 %2, 0, !dbg !233
  br i1 %cmp, label %if.then, label %if.else, !dbg !234

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !235
  %idxprom = sext i32 %3 to i64, !dbg !237
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !237
  store i32 1, i32* %arrayidx, align 4, !dbg !238
  store i32 0, i32* %i, align 4, !dbg !239
  br label %for.cond, !dbg !241

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !242
  %cmp1 = icmp slt i32 %4, 10, !dbg !244
  br i1 %cmp1, label %for.body, label %for.end, !dbg !245

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !246
  %idxprom2 = sext i32 %5 to i64, !dbg !248
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !248
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !248
  call void @printIntLine(i32 %6), !dbg !249
  br label %for.inc, !dbg !250

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !251
  %inc = add nsw i32 %7, 1, !dbg !251
  store i32 %inc, i32* %i, align 4, !dbg !251
  br label %for.cond, !dbg !252, !llvm.loop !253

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !256

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !257
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !259
}

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !260 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !261, metadata !DIExpression()), !dbg !262
  store i32 -1, i32* %data, align 4, !dbg !263
  store i32 7, i32* %data, align 4, !dbg !264
  %0 = load i32, i32* %data, align 4, !dbg !265
  store i32 %0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_goodG2BData, align 4, !dbg !266
  call void @goodG2BSink(), !dbg !267
  ret void, !dbg !268
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !269 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !270, metadata !DIExpression()), !dbg !271
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_goodG2BData, align 4, !dbg !272
  store i32 %0, i32* %data, align 4, !dbg !271
  call void @llvm.dbg.declare(metadata i32* %i, metadata !273, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !276, metadata !DIExpression()), !dbg !277
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !277
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !277
  %2 = load i32, i32* %data, align 4, !dbg !278
  %cmp = icmp sge i32 %2, 0, !dbg !280
  br i1 %cmp, label %if.then, label %if.else, !dbg !281

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !282
  %idxprom = sext i32 %3 to i64, !dbg !284
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !284
  store i32 1, i32* %arrayidx, align 4, !dbg !285
  store i32 0, i32* %i, align 4, !dbg !286
  br label %for.cond, !dbg !288

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !289
  %cmp1 = icmp slt i32 %4, 10, !dbg !291
  br i1 %cmp1, label %for.body, label %for.end, !dbg !292

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !293
  %idxprom2 = sext i32 %5 to i64, !dbg !295
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !295
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !295
  call void @printIntLine(i32 %6), !dbg !296
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !298
  %inc = add nsw i32 %7, 1, !dbg !298
  store i32 %inc, i32* %i, align 4, !dbg !298
  br label %for.cond, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !302

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !303
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !305
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !306 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !307, metadata !DIExpression()), !dbg !308
  store i32 -1, i32* %data, align 4, !dbg !309
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !310, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !313, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !315, metadata !DIExpression()), !dbg !316
  store i32 -1, i32* %listenSocket, align 4, !dbg !316
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !317, metadata !DIExpression()), !dbg !318
  store i32 -1, i32* %acceptSocket, align 4, !dbg !318
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !319, metadata !DIExpression()), !dbg !320
  br label %do.body, !dbg !321

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !322
  store i32 %call, i32* %listenSocket, align 4, !dbg !324
  %0 = load i32, i32* %listenSocket, align 4, !dbg !325
  %cmp = icmp eq i32 %0, -1, !dbg !327
  br i1 %cmp, label %if.then, label %if.end, !dbg !328

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !329

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !331
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !331
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !332
  store i16 2, i16* %sin_family, align 4, !dbg !333
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !334
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !335
  store i32 0, i32* %s_addr, align 4, !dbg !336
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !337
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !338
  store i16 %call1, i16* %sin_port, align 2, !dbg !339
  %2 = load i32, i32* %listenSocket, align 4, !dbg !340
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !342
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !343
  %cmp3 = icmp eq i32 %call2, -1, !dbg !344
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !345

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !346

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !348
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !350
  %cmp7 = icmp eq i32 %call6, -1, !dbg !351
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !352

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !353

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !355
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !356
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !357
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !358
  %cmp11 = icmp eq i32 %6, -1, !dbg !360
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !361

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !362

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !364
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !365
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !366
  %conv = trunc i64 %call14 to i32, !dbg !366
  store i32 %conv, i32* %recvResult, align 4, !dbg !367
  %8 = load i32, i32* %recvResult, align 4, !dbg !368
  %cmp15 = icmp eq i32 %8, -1, !dbg !370
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !371

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !372
  %cmp17 = icmp eq i32 %9, 0, !dbg !373
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !374

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !375

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !377
  %idxprom = sext i32 %10 to i64, !dbg !378
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !378
  store i8 0, i8* %arrayidx, align 1, !dbg !379
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !380
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !381
  store i32 %call22, i32* %data, align 4, !dbg !382
  br label %do.end, !dbg !383

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !384
  %cmp23 = icmp ne i32 %11, -1, !dbg !386
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !387

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !388
  %call26 = call i32 @close(i32 %12), !dbg !390
  br label %if.end27, !dbg !391

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !392
  %cmp28 = icmp ne i32 %13, -1, !dbg !394
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !395

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !396
  %call31 = call i32 @close(i32 %14), !dbg !398
  br label %if.end32, !dbg !399

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !400
  store i32 %15, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_goodB2GData, align 4, !dbg !401
  call void @goodB2GSink(), !dbg !402
  ret void, !dbg !403
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !404 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !405, metadata !DIExpression()), !dbg !406
  %0 = load i32, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_goodB2GData, align 4, !dbg !407
  store i32 %0, i32* %data, align 4, !dbg !406
  call void @llvm.dbg.declare(metadata i32* %i, metadata !408, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !411, metadata !DIExpression()), !dbg !412
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !412
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !412
  %2 = load i32, i32* %data, align 4, !dbg !413
  %cmp = icmp sge i32 %2, 0, !dbg !415
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !416

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !417
  %cmp1 = icmp slt i32 %3, 10, !dbg !418
  br i1 %cmp1, label %if.then, label %if.else, !dbg !419

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !420
  %idxprom = sext i32 %4 to i64, !dbg !422
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !422
  store i32 1, i32* %arrayidx, align 4, !dbg !423
  store i32 0, i32* %i, align 4, !dbg !424
  br label %for.cond, !dbg !426

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !427
  %cmp2 = icmp slt i32 %5, 10, !dbg !429
  br i1 %cmp2, label %for.body, label %for.end, !dbg !430

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !431
  %idxprom3 = sext i32 %6 to i64, !dbg !433
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !433
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !433
  call void @printIntLine(i32 %7), !dbg !434
  br label %for.inc, !dbg !435

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !436
  %inc = add nsw i32 %8, 1, !dbg !436
  store i32 %inc, i32* %i, align 4, !dbg !436
  br label %for.cond, !dbg !437, !llvm.loop !438

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !440

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !441
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !443
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!73, !74, !75, !76, !77}
!llvm.ident = !{!78}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_badData", scope: !2, file: !69, line: 42, type: !70, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !66, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45.c", directory: "/root/SSE-Assessment")
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
!47 = !{!48, !53, !7}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !50, line: 26, baseType: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !52, line: 41, baseType: !7)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !55, line: 175, size: 128, elements: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!56 = !{!57, !61}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !54, file: !55, line: 177, baseType: !58, size: 16)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !59, line: 28, baseType: !60)
!59 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!60 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !54, file: !55, line: 178, baseType: !62, size: 112, offset: 16)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 112, elements: !64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !{!65}
!65 = !DISubrange(count: 14)
!66 = !{!0, !67, !71}
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_goodG2BData", scope: !2, file: !69, line: 43, type: !70, isLocal: true, isDefinition: true)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45.c", directory: "/root/SSE-Assessment")
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_goodB2GData", scope: !2, file: !69, line: 44, type: !70, isLocal: true, isDefinition: true)
!73 = !{i32 7, !"Dwarf Version", i32 4}
!74 = !{i32 2, !"Debug Info Version", i32 3}
!75 = !{i32 1, !"wchar_size", i32 4}
!76 = !{i32 7, !"uwtable", i32 1}
!77 = !{i32 7, !"frame-pointer", i32 2}
!78 = !{!"clang version 13.0.0"}
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_bad", scope: !69, file: !69, line: 72, type: !80, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!80 = !DISubroutineType(types: !81)
!81 = !{null}
!82 = !{}
!83 = !DILocalVariable(name: "data", scope: !79, file: !69, line: 74, type: !70)
!84 = !DILocation(line: 74, column: 9, scope: !79)
!85 = !DILocation(line: 76, column: 10, scope: !79)
!86 = !DILocalVariable(name: "recvResult", scope: !87, file: !69, line: 82, type: !70)
!87 = distinct !DILexicalBlock(scope: !79, file: !69, line: 77, column: 5)
!88 = !DILocation(line: 82, column: 13, scope: !87)
!89 = !DILocalVariable(name: "service", scope: !87, file: !69, line: 83, type: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 237, size: 128, elements: !91)
!91 = !{!92, !93, !97, !101}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !90, file: !19, line: 239, baseType: !58, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !90, file: !19, line: 240, baseType: !94, size: 16, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 39, baseType: !60)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !90, file: !19, line: 241, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !19, line: 33, baseType: !48, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !90, file: !19, line: 244, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 83, column: 28, scope: !87)
!107 = !DILocalVariable(name: "listenSocket", scope: !87, file: !69, line: 84, type: !70)
!108 = !DILocation(line: 84, column: 16, scope: !87)
!109 = !DILocalVariable(name: "acceptSocket", scope: !87, file: !69, line: 85, type: !70)
!110 = !DILocation(line: 85, column: 16, scope: !87)
!111 = !DILocalVariable(name: "inputBuffer", scope: !87, file: !69, line: 86, type: !62)
!112 = !DILocation(line: 86, column: 14, scope: !87)
!113 = !DILocation(line: 87, column: 9, scope: !87)
!114 = !DILocation(line: 97, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !87, file: !69, line: 88, column: 9)
!116 = !DILocation(line: 97, column: 26, scope: !115)
!117 = !DILocation(line: 98, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !69, line: 98, column: 17)
!119 = !DILocation(line: 98, column: 30, scope: !118)
!120 = !DILocation(line: 98, column: 17, scope: !115)
!121 = !DILocation(line: 100, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !69, line: 99, column: 13)
!123 = !DILocation(line: 102, column: 13, scope: !115)
!124 = !DILocation(line: 103, column: 21, scope: !115)
!125 = !DILocation(line: 103, column: 32, scope: !115)
!126 = !DILocation(line: 104, column: 21, scope: !115)
!127 = !DILocation(line: 104, column: 30, scope: !115)
!128 = !DILocation(line: 104, column: 37, scope: !115)
!129 = !DILocation(line: 105, column: 32, scope: !115)
!130 = !DILocation(line: 105, column: 21, scope: !115)
!131 = !DILocation(line: 105, column: 30, scope: !115)
!132 = !DILocation(line: 106, column: 22, scope: !133)
!133 = distinct !DILexicalBlock(scope: !115, file: !69, line: 106, column: 17)
!134 = !DILocation(line: 106, column: 36, scope: !133)
!135 = !DILocation(line: 106, column: 17, scope: !133)
!136 = !DILocation(line: 106, column: 81, scope: !133)
!137 = !DILocation(line: 106, column: 17, scope: !115)
!138 = !DILocation(line: 108, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !69, line: 107, column: 13)
!140 = !DILocation(line: 110, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !115, file: !69, line: 110, column: 17)
!142 = !DILocation(line: 110, column: 17, scope: !141)
!143 = !DILocation(line: 110, column: 54, scope: !141)
!144 = !DILocation(line: 110, column: 17, scope: !115)
!145 = !DILocation(line: 112, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !69, line: 111, column: 13)
!147 = !DILocation(line: 114, column: 35, scope: !115)
!148 = !DILocation(line: 114, column: 28, scope: !115)
!149 = !DILocation(line: 114, column: 26, scope: !115)
!150 = !DILocation(line: 115, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !115, file: !69, line: 115, column: 17)
!152 = !DILocation(line: 115, column: 30, scope: !151)
!153 = !DILocation(line: 115, column: 17, scope: !115)
!154 = !DILocation(line: 117, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !69, line: 116, column: 13)
!156 = !DILocation(line: 120, column: 31, scope: !115)
!157 = !DILocation(line: 120, column: 45, scope: !115)
!158 = !DILocation(line: 120, column: 26, scope: !115)
!159 = !DILocation(line: 120, column: 24, scope: !115)
!160 = !DILocation(line: 121, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !115, file: !69, line: 121, column: 17)
!162 = !DILocation(line: 121, column: 28, scope: !161)
!163 = !DILocation(line: 121, column: 44, scope: !161)
!164 = !DILocation(line: 121, column: 47, scope: !161)
!165 = !DILocation(line: 121, column: 58, scope: !161)
!166 = !DILocation(line: 121, column: 17, scope: !115)
!167 = !DILocation(line: 123, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !69, line: 122, column: 13)
!169 = !DILocation(line: 126, column: 25, scope: !115)
!170 = !DILocation(line: 126, column: 13, scope: !115)
!171 = !DILocation(line: 126, column: 37, scope: !115)
!172 = !DILocation(line: 128, column: 25, scope: !115)
!173 = !DILocation(line: 128, column: 20, scope: !115)
!174 = !DILocation(line: 128, column: 18, scope: !115)
!175 = !DILocation(line: 129, column: 9, scope: !115)
!176 = !DILocation(line: 131, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !87, file: !69, line: 131, column: 13)
!178 = !DILocation(line: 131, column: 26, scope: !177)
!179 = !DILocation(line: 131, column: 13, scope: !87)
!180 = !DILocation(line: 133, column: 26, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !69, line: 132, column: 9)
!182 = !DILocation(line: 133, column: 13, scope: !181)
!183 = !DILocation(line: 134, column: 9, scope: !181)
!184 = !DILocation(line: 135, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !87, file: !69, line: 135, column: 13)
!186 = !DILocation(line: 135, column: 26, scope: !185)
!187 = !DILocation(line: 135, column: 13, scope: !87)
!188 = !DILocation(line: 137, column: 26, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !69, line: 136, column: 9)
!190 = !DILocation(line: 137, column: 13, scope: !189)
!191 = !DILocation(line: 138, column: 9, scope: !189)
!192 = !DILocation(line: 146, column: 75, scope: !79)
!193 = !DILocation(line: 146, column: 73, scope: !79)
!194 = !DILocation(line: 147, column: 5, scope: !79)
!195 = !DILocation(line: 148, column: 1, scope: !79)
!196 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_45_good", scope: !69, file: !69, line: 293, type: !80, scopeLine: 294, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!197 = !DILocation(line: 295, column: 5, scope: !196)
!198 = !DILocation(line: 296, column: 5, scope: !196)
!199 = !DILocation(line: 297, column: 1, scope: !196)
!200 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 307, type: !201, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!201 = !DISubroutineType(types: !202)
!202 = !{!70, !70, !203}
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!205 = !DILocalVariable(name: "argc", arg: 1, scope: !200, file: !69, line: 307, type: !70)
!206 = !DILocation(line: 307, column: 14, scope: !200)
!207 = !DILocalVariable(name: "argv", arg: 2, scope: !200, file: !69, line: 307, type: !203)
!208 = !DILocation(line: 307, column: 27, scope: !200)
!209 = !DILocation(line: 310, column: 22, scope: !200)
!210 = !DILocation(line: 310, column: 12, scope: !200)
!211 = !DILocation(line: 310, column: 5, scope: !200)
!212 = !DILocation(line: 312, column: 5, scope: !200)
!213 = !DILocation(line: 313, column: 5, scope: !200)
!214 = !DILocation(line: 314, column: 5, scope: !200)
!215 = !DILocation(line: 317, column: 5, scope: !200)
!216 = !DILocation(line: 318, column: 5, scope: !200)
!217 = !DILocation(line: 319, column: 5, scope: !200)
!218 = !DILocation(line: 321, column: 5, scope: !200)
!219 = distinct !DISubprogram(name: "badSink", scope: !69, file: !69, line: 48, type: !80, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!220 = !DILocalVariable(name: "data", scope: !219, file: !69, line: 50, type: !70)
!221 = !DILocation(line: 50, column: 9, scope: !219)
!222 = !DILocation(line: 50, column: 16, scope: !219)
!223 = !DILocalVariable(name: "i", scope: !224, file: !69, line: 52, type: !70)
!224 = distinct !DILexicalBlock(scope: !219, file: !69, line: 51, column: 5)
!225 = !DILocation(line: 52, column: 13, scope: !224)
!226 = !DILocalVariable(name: "buffer", scope: !224, file: !69, line: 53, type: !227)
!227 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 320, elements: !228)
!228 = !{!229}
!229 = !DISubrange(count: 10)
!230 = !DILocation(line: 53, column: 13, scope: !224)
!231 = !DILocation(line: 56, column: 13, scope: !232)
!232 = distinct !DILexicalBlock(scope: !224, file: !69, line: 56, column: 13)
!233 = !DILocation(line: 56, column: 18, scope: !232)
!234 = !DILocation(line: 56, column: 13, scope: !224)
!235 = !DILocation(line: 58, column: 20, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !69, line: 57, column: 9)
!237 = !DILocation(line: 58, column: 13, scope: !236)
!238 = !DILocation(line: 58, column: 26, scope: !236)
!239 = !DILocation(line: 60, column: 19, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !69, line: 60, column: 13)
!241 = !DILocation(line: 60, column: 17, scope: !240)
!242 = !DILocation(line: 60, column: 24, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !69, line: 60, column: 13)
!244 = !DILocation(line: 60, column: 26, scope: !243)
!245 = !DILocation(line: 60, column: 13, scope: !240)
!246 = !DILocation(line: 62, column: 37, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !69, line: 61, column: 13)
!248 = !DILocation(line: 62, column: 30, scope: !247)
!249 = !DILocation(line: 62, column: 17, scope: !247)
!250 = !DILocation(line: 63, column: 13, scope: !247)
!251 = !DILocation(line: 60, column: 33, scope: !243)
!252 = !DILocation(line: 60, column: 13, scope: !243)
!253 = distinct !{!253, !245, !254, !255}
!254 = !DILocation(line: 63, column: 13, scope: !240)
!255 = !{!"llvm.loop.mustprogress"}
!256 = !DILocation(line: 64, column: 9, scope: !236)
!257 = !DILocation(line: 67, column: 13, scope: !258)
!258 = distinct !DILexicalBlock(scope: !232, file: !69, line: 66, column: 9)
!259 = !DILocation(line: 70, column: 1, scope: !219)
!260 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 179, type: !80, scopeLine: 180, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!261 = !DILocalVariable(name: "data", scope: !260, file: !69, line: 181, type: !70)
!262 = !DILocation(line: 181, column: 9, scope: !260)
!263 = !DILocation(line: 183, column: 10, scope: !260)
!264 = !DILocation(line: 186, column: 10, scope: !260)
!265 = !DILocation(line: 187, column: 79, scope: !260)
!266 = !DILocation(line: 187, column: 77, scope: !260)
!267 = !DILocation(line: 188, column: 5, scope: !260)
!268 = !DILocation(line: 189, column: 1, scope: !260)
!269 = distinct !DISubprogram(name: "goodG2BSink", scope: !69, file: !69, line: 155, type: !80, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!270 = !DILocalVariable(name: "data", scope: !269, file: !69, line: 157, type: !70)
!271 = !DILocation(line: 157, column: 9, scope: !269)
!272 = !DILocation(line: 157, column: 16, scope: !269)
!273 = !DILocalVariable(name: "i", scope: !274, file: !69, line: 159, type: !70)
!274 = distinct !DILexicalBlock(scope: !269, file: !69, line: 158, column: 5)
!275 = !DILocation(line: 159, column: 13, scope: !274)
!276 = !DILocalVariable(name: "buffer", scope: !274, file: !69, line: 160, type: !227)
!277 = !DILocation(line: 160, column: 13, scope: !274)
!278 = !DILocation(line: 163, column: 13, scope: !279)
!279 = distinct !DILexicalBlock(scope: !274, file: !69, line: 163, column: 13)
!280 = !DILocation(line: 163, column: 18, scope: !279)
!281 = !DILocation(line: 163, column: 13, scope: !274)
!282 = !DILocation(line: 165, column: 20, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !69, line: 164, column: 9)
!284 = !DILocation(line: 165, column: 13, scope: !283)
!285 = !DILocation(line: 165, column: 26, scope: !283)
!286 = !DILocation(line: 167, column: 19, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !69, line: 167, column: 13)
!288 = !DILocation(line: 167, column: 17, scope: !287)
!289 = !DILocation(line: 167, column: 24, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !69, line: 167, column: 13)
!291 = !DILocation(line: 167, column: 26, scope: !290)
!292 = !DILocation(line: 167, column: 13, scope: !287)
!293 = !DILocation(line: 169, column: 37, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !69, line: 168, column: 13)
!295 = !DILocation(line: 169, column: 30, scope: !294)
!296 = !DILocation(line: 169, column: 17, scope: !294)
!297 = !DILocation(line: 170, column: 13, scope: !294)
!298 = !DILocation(line: 167, column: 33, scope: !290)
!299 = !DILocation(line: 167, column: 13, scope: !290)
!300 = distinct !{!300, !292, !301, !255}
!301 = !DILocation(line: 170, column: 13, scope: !287)
!302 = !DILocation(line: 171, column: 9, scope: !283)
!303 = !DILocation(line: 174, column: 13, scope: !304)
!304 = distinct !DILexicalBlock(scope: !279, file: !69, line: 173, column: 9)
!305 = !DILocation(line: 177, column: 1, scope: !269)
!306 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 215, type: !80, scopeLine: 216, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!307 = !DILocalVariable(name: "data", scope: !306, file: !69, line: 217, type: !70)
!308 = !DILocation(line: 217, column: 9, scope: !306)
!309 = !DILocation(line: 219, column: 10, scope: !306)
!310 = !DILocalVariable(name: "recvResult", scope: !311, file: !69, line: 225, type: !70)
!311 = distinct !DILexicalBlock(scope: !306, file: !69, line: 220, column: 5)
!312 = !DILocation(line: 225, column: 13, scope: !311)
!313 = !DILocalVariable(name: "service", scope: !311, file: !69, line: 226, type: !90)
!314 = !DILocation(line: 226, column: 28, scope: !311)
!315 = !DILocalVariable(name: "listenSocket", scope: !311, file: !69, line: 227, type: !70)
!316 = !DILocation(line: 227, column: 16, scope: !311)
!317 = !DILocalVariable(name: "acceptSocket", scope: !311, file: !69, line: 228, type: !70)
!318 = !DILocation(line: 228, column: 16, scope: !311)
!319 = !DILocalVariable(name: "inputBuffer", scope: !311, file: !69, line: 229, type: !62)
!320 = !DILocation(line: 229, column: 14, scope: !311)
!321 = !DILocation(line: 230, column: 9, scope: !311)
!322 = !DILocation(line: 240, column: 28, scope: !323)
!323 = distinct !DILexicalBlock(scope: !311, file: !69, line: 231, column: 9)
!324 = !DILocation(line: 240, column: 26, scope: !323)
!325 = !DILocation(line: 241, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !323, file: !69, line: 241, column: 17)
!327 = !DILocation(line: 241, column: 30, scope: !326)
!328 = !DILocation(line: 241, column: 17, scope: !323)
!329 = !DILocation(line: 243, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !69, line: 242, column: 13)
!331 = !DILocation(line: 245, column: 13, scope: !323)
!332 = !DILocation(line: 246, column: 21, scope: !323)
!333 = !DILocation(line: 246, column: 32, scope: !323)
!334 = !DILocation(line: 247, column: 21, scope: !323)
!335 = !DILocation(line: 247, column: 30, scope: !323)
!336 = !DILocation(line: 247, column: 37, scope: !323)
!337 = !DILocation(line: 248, column: 32, scope: !323)
!338 = !DILocation(line: 248, column: 21, scope: !323)
!339 = !DILocation(line: 248, column: 30, scope: !323)
!340 = !DILocation(line: 249, column: 22, scope: !341)
!341 = distinct !DILexicalBlock(scope: !323, file: !69, line: 249, column: 17)
!342 = !DILocation(line: 249, column: 36, scope: !341)
!343 = !DILocation(line: 249, column: 17, scope: !341)
!344 = !DILocation(line: 249, column: 81, scope: !341)
!345 = !DILocation(line: 249, column: 17, scope: !323)
!346 = !DILocation(line: 251, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !341, file: !69, line: 250, column: 13)
!348 = !DILocation(line: 253, column: 24, scope: !349)
!349 = distinct !DILexicalBlock(scope: !323, file: !69, line: 253, column: 17)
!350 = !DILocation(line: 253, column: 17, scope: !349)
!351 = !DILocation(line: 253, column: 54, scope: !349)
!352 = !DILocation(line: 253, column: 17, scope: !323)
!353 = !DILocation(line: 255, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !349, file: !69, line: 254, column: 13)
!355 = !DILocation(line: 257, column: 35, scope: !323)
!356 = !DILocation(line: 257, column: 28, scope: !323)
!357 = !DILocation(line: 257, column: 26, scope: !323)
!358 = !DILocation(line: 258, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !323, file: !69, line: 258, column: 17)
!360 = !DILocation(line: 258, column: 30, scope: !359)
!361 = !DILocation(line: 258, column: 17, scope: !323)
!362 = !DILocation(line: 260, column: 17, scope: !363)
!363 = distinct !DILexicalBlock(scope: !359, file: !69, line: 259, column: 13)
!364 = !DILocation(line: 263, column: 31, scope: !323)
!365 = !DILocation(line: 263, column: 45, scope: !323)
!366 = !DILocation(line: 263, column: 26, scope: !323)
!367 = !DILocation(line: 263, column: 24, scope: !323)
!368 = !DILocation(line: 264, column: 17, scope: !369)
!369 = distinct !DILexicalBlock(scope: !323, file: !69, line: 264, column: 17)
!370 = !DILocation(line: 264, column: 28, scope: !369)
!371 = !DILocation(line: 264, column: 44, scope: !369)
!372 = !DILocation(line: 264, column: 47, scope: !369)
!373 = !DILocation(line: 264, column: 58, scope: !369)
!374 = !DILocation(line: 264, column: 17, scope: !323)
!375 = !DILocation(line: 266, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !369, file: !69, line: 265, column: 13)
!377 = !DILocation(line: 269, column: 25, scope: !323)
!378 = !DILocation(line: 269, column: 13, scope: !323)
!379 = !DILocation(line: 269, column: 37, scope: !323)
!380 = !DILocation(line: 271, column: 25, scope: !323)
!381 = !DILocation(line: 271, column: 20, scope: !323)
!382 = !DILocation(line: 271, column: 18, scope: !323)
!383 = !DILocation(line: 272, column: 9, scope: !323)
!384 = !DILocation(line: 274, column: 13, scope: !385)
!385 = distinct !DILexicalBlock(scope: !311, file: !69, line: 274, column: 13)
!386 = !DILocation(line: 274, column: 26, scope: !385)
!387 = !DILocation(line: 274, column: 13, scope: !311)
!388 = !DILocation(line: 276, column: 26, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !69, line: 275, column: 9)
!390 = !DILocation(line: 276, column: 13, scope: !389)
!391 = !DILocation(line: 277, column: 9, scope: !389)
!392 = !DILocation(line: 278, column: 13, scope: !393)
!393 = distinct !DILexicalBlock(scope: !311, file: !69, line: 278, column: 13)
!394 = !DILocation(line: 278, column: 26, scope: !393)
!395 = !DILocation(line: 278, column: 13, scope: !311)
!396 = !DILocation(line: 280, column: 26, scope: !397)
!397 = distinct !DILexicalBlock(scope: !393, file: !69, line: 279, column: 9)
!398 = !DILocation(line: 280, column: 13, scope: !397)
!399 = !DILocation(line: 281, column: 9, scope: !397)
!400 = !DILocation(line: 289, column: 79, scope: !306)
!401 = !DILocation(line: 289, column: 77, scope: !306)
!402 = !DILocation(line: 290, column: 5, scope: !306)
!403 = !DILocation(line: 291, column: 1, scope: !306)
!404 = distinct !DISubprogram(name: "goodB2GSink", scope: !69, file: !69, line: 192, type: !80, scopeLine: 193, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!405 = !DILocalVariable(name: "data", scope: !404, file: !69, line: 194, type: !70)
!406 = !DILocation(line: 194, column: 9, scope: !404)
!407 = !DILocation(line: 194, column: 16, scope: !404)
!408 = !DILocalVariable(name: "i", scope: !409, file: !69, line: 196, type: !70)
!409 = distinct !DILexicalBlock(scope: !404, file: !69, line: 195, column: 5)
!410 = !DILocation(line: 196, column: 13, scope: !409)
!411 = !DILocalVariable(name: "buffer", scope: !409, file: !69, line: 197, type: !227)
!412 = !DILocation(line: 197, column: 13, scope: !409)
!413 = !DILocation(line: 199, column: 13, scope: !414)
!414 = distinct !DILexicalBlock(scope: !409, file: !69, line: 199, column: 13)
!415 = !DILocation(line: 199, column: 18, scope: !414)
!416 = !DILocation(line: 199, column: 23, scope: !414)
!417 = !DILocation(line: 199, column: 26, scope: !414)
!418 = !DILocation(line: 199, column: 31, scope: !414)
!419 = !DILocation(line: 199, column: 13, scope: !409)
!420 = !DILocation(line: 201, column: 20, scope: !421)
!421 = distinct !DILexicalBlock(scope: !414, file: !69, line: 200, column: 9)
!422 = !DILocation(line: 201, column: 13, scope: !421)
!423 = !DILocation(line: 201, column: 26, scope: !421)
!424 = !DILocation(line: 203, column: 19, scope: !425)
!425 = distinct !DILexicalBlock(scope: !421, file: !69, line: 203, column: 13)
!426 = !DILocation(line: 203, column: 17, scope: !425)
!427 = !DILocation(line: 203, column: 24, scope: !428)
!428 = distinct !DILexicalBlock(scope: !425, file: !69, line: 203, column: 13)
!429 = !DILocation(line: 203, column: 26, scope: !428)
!430 = !DILocation(line: 203, column: 13, scope: !425)
!431 = !DILocation(line: 205, column: 37, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !69, line: 204, column: 13)
!433 = !DILocation(line: 205, column: 30, scope: !432)
!434 = !DILocation(line: 205, column: 17, scope: !432)
!435 = !DILocation(line: 206, column: 13, scope: !432)
!436 = !DILocation(line: 203, column: 33, scope: !428)
!437 = !DILocation(line: 203, column: 13, scope: !428)
!438 = distinct !{!438, !430, !439, !255}
!439 = !DILocation(line: 206, column: 13, scope: !425)
!440 = !DILocation(line: 207, column: 9, scope: !421)
!441 = !DILocation(line: 210, column: 13, scope: !442)
!442 = distinct !DILexicalBlock(scope: !414, file: !69, line: 209, column: 9)
!443 = !DILocation(line: 213, column: 1, scope: !404)
