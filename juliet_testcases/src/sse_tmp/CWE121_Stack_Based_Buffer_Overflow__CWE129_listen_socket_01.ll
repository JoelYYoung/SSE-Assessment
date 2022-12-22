; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !82, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %listenSocket, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %acceptSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  br label %do.body, !dbg !106

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !107
  store i32 %call, i32* %listenSocket, align 4, !dbg !109
  %0 = load i32, i32* %listenSocket, align 4, !dbg !110
  %cmp = icmp eq i32 %0, -1, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !114

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !116
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !117
  store i16 2, i16* %sin_family, align 4, !dbg !118
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !119
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !120
  store i32 0, i32* %s_addr, align 4, !dbg !121
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !122
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !123
  store i16 %call1, i16* %sin_port, align 2, !dbg !124
  %2 = load i32, i32* %listenSocket, align 4, !dbg !125
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !127
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !128
  %cmp3 = icmp eq i32 %call2, -1, !dbg !129
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !130

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !131

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !133
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !135
  %cmp7 = icmp eq i32 %call6, -1, !dbg !136
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !137

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !138

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !141
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !142
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !143
  %cmp11 = icmp eq i32 %6, -1, !dbg !145
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !146

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !147

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !149
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !150
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !151
  %conv = trunc i64 %call14 to i32, !dbg !151
  store i32 %conv, i32* %recvResult, align 4, !dbg !152
  %8 = load i32, i32* %recvResult, align 4, !dbg !153
  %cmp15 = icmp eq i32 %8, -1, !dbg !155
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !156

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !157
  %cmp17 = icmp eq i32 %9, 0, !dbg !158
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !159

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !160

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !162
  %idxprom = sext i32 %10 to i64, !dbg !163
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !163
  store i8 0, i8* %arrayidx, align 1, !dbg !164
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !165
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !166
  store i32 %call22, i32* %data, align 4, !dbg !167
  br label %do.end, !dbg !168

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !169
  %cmp23 = icmp ne i32 %11, -1, !dbg !171
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !172

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !173
  %call26 = call i32 @close(i32 %12), !dbg !175
  br label %if.end27, !dbg !176

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !177
  %cmp28 = icmp ne i32 %13, -1, !dbg !179
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !180

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !181
  %call31 = call i32 @close(i32 %14), !dbg !183
  br label %if.end32, !dbg !184

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !185, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !188, metadata !DIExpression()), !dbg !192
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !192
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !192
  %16 = load i32, i32* %data, align 4, !dbg !193
  %cmp33 = icmp sge i32 %16, 0, !dbg !195
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !196

if.then35:                                        ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !197
  %idxprom36 = sext i32 %17 to i64, !dbg !199
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !199
  store i32 1, i32* %arrayidx37, align 4, !dbg !200
  store i32 0, i32* %i, align 4, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %if.then35
  %18 = load i32, i32* %i, align 4, !dbg !204
  %cmp38 = icmp slt i32 %18, 10, !dbg !206
  br i1 %cmp38, label %for.body, label %for.end, !dbg !207

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !208
  %idxprom40 = sext i32 %19 to i64, !dbg !210
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom40, !dbg !210
  %20 = load i32, i32* %arrayidx41, align 4, !dbg !210
  call void @printIntLine(i32 %20), !dbg !211
  br label %for.inc, !dbg !212

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !213
  %inc = add nsw i32 %21, 1, !dbg !213
  store i32 %inc, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !214, !llvm.loop !215

for.end:                                          ; preds = %for.cond
  br label %if.end42, !dbg !218

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !219
  br label %if.end42

if.end42:                                         ; preds = %if.else, %for.end
  ret void, !dbg !221
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_good() #0 !dbg !222 {
entry:
  call void @goodG2B(), !dbg !223
  call void @goodB2G(), !dbg !224
  ret void, !dbg !225
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !226 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !231, metadata !DIExpression()), !dbg !232
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !233, metadata !DIExpression()), !dbg !234
  %call = call i64 @time(i64* null) #7, !dbg !235
  %conv = trunc i64 %call to i32, !dbg !236
  call void @srand(i32 %conv) #7, !dbg !237
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !238
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_good(), !dbg !239
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !240
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !241
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_bad(), !dbg !242
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !243
  ret i32 0, !dbg !244
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !245 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !246, metadata !DIExpression()), !dbg !247
  store i32 -1, i32* %data, align 4, !dbg !248
  store i32 7, i32* %data, align 4, !dbg !249
  call void @llvm.dbg.declare(metadata i32* %i, metadata !250, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !253, metadata !DIExpression()), !dbg !254
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !254
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !254
  %1 = load i32, i32* %data, align 4, !dbg !255
  %cmp = icmp sge i32 %1, 0, !dbg !257
  br i1 %cmp, label %if.then, label %if.else, !dbg !258

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !259
  %idxprom = sext i32 %2 to i64, !dbg !261
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !261
  store i32 1, i32* %arrayidx, align 4, !dbg !262
  store i32 0, i32* %i, align 4, !dbg !263
  br label %for.cond, !dbg !265

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !266
  %cmp1 = icmp slt i32 %3, 10, !dbg !268
  br i1 %cmp1, label %for.body, label %for.end, !dbg !269

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !270
  %idxprom2 = sext i32 %4 to i64, !dbg !272
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !272
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !272
  call void @printIntLine(i32 %5), !dbg !273
  br label %for.inc, !dbg !274

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !275
  %inc = add nsw i32 %6, 1, !dbg !275
  store i32 %inc, i32* %i, align 4, !dbg !275
  br label %for.cond, !dbg !276, !llvm.loop !277

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !279

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !280
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !282
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !283 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !284, metadata !DIExpression()), !dbg !285
  store i32 -1, i32* %data, align 4, !dbg !286
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !287, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !290, metadata !DIExpression()), !dbg !291
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !292, metadata !DIExpression()), !dbg !293
  store i32 -1, i32* %listenSocket, align 4, !dbg !293
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !294, metadata !DIExpression()), !dbg !295
  store i32 -1, i32* %acceptSocket, align 4, !dbg !295
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !296, metadata !DIExpression()), !dbg !297
  br label %do.body, !dbg !298

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !299
  store i32 %call, i32* %listenSocket, align 4, !dbg !301
  %0 = load i32, i32* %listenSocket, align 4, !dbg !302
  %cmp = icmp eq i32 %0, -1, !dbg !304
  br i1 %cmp, label %if.then, label %if.end, !dbg !305

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !306

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !308
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !308
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !309
  store i16 2, i16* %sin_family, align 4, !dbg !310
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !311
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !312
  store i32 0, i32* %s_addr, align 4, !dbg !313
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !314
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !315
  store i16 %call1, i16* %sin_port, align 2, !dbg !316
  %2 = load i32, i32* %listenSocket, align 4, !dbg !317
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !319
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !320
  %cmp3 = icmp eq i32 %call2, -1, !dbg !321
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !322

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !323

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !325
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !327
  %cmp7 = icmp eq i32 %call6, -1, !dbg !328
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !329

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !330

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !332
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !333
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !334
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !335
  %cmp11 = icmp eq i32 %6, -1, !dbg !337
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !338

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !339

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !341
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !342
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !343
  %conv = trunc i64 %call14 to i32, !dbg !343
  store i32 %conv, i32* %recvResult, align 4, !dbg !344
  %8 = load i32, i32* %recvResult, align 4, !dbg !345
  %cmp15 = icmp eq i32 %8, -1, !dbg !347
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !348

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !349
  %cmp17 = icmp eq i32 %9, 0, !dbg !350
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !351

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !352

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !354
  %idxprom = sext i32 %10 to i64, !dbg !355
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !355
  store i8 0, i8* %arrayidx, align 1, !dbg !356
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !357
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !358
  store i32 %call22, i32* %data, align 4, !dbg !359
  br label %do.end, !dbg !360

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !361
  %cmp23 = icmp ne i32 %11, -1, !dbg !363
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !364

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !365
  %call26 = call i32 @close(i32 %12), !dbg !367
  br label %if.end27, !dbg !368

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !369
  %cmp28 = icmp ne i32 %13, -1, !dbg !371
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !372

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !373
  %call31 = call i32 @close(i32 %14), !dbg !375
  br label %if.end32, !dbg !376

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !377, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !380, metadata !DIExpression()), !dbg !381
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !381
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !381
  %16 = load i32, i32* %data, align 4, !dbg !382
  %cmp33 = icmp sge i32 %16, 0, !dbg !384
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !385

land.lhs.true:                                    ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !386
  %cmp35 = icmp slt i32 %17, 10, !dbg !387
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !388

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !389
  %idxprom38 = sext i32 %18 to i64, !dbg !391
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !391
  store i32 1, i32* %arrayidx39, align 4, !dbg !392
  store i32 0, i32* %i, align 4, !dbg !393
  br label %for.cond, !dbg !395

for.cond:                                         ; preds = %for.inc, %if.then37
  %19 = load i32, i32* %i, align 4, !dbg !396
  %cmp40 = icmp slt i32 %19, 10, !dbg !398
  br i1 %cmp40, label %for.body, label %for.end, !dbg !399

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !400
  %idxprom42 = sext i32 %20 to i64, !dbg !402
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !402
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !402
  call void @printIntLine(i32 %21), !dbg !403
  br label %for.inc, !dbg !404

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !405
  %inc = add nsw i32 %22, 1, !dbg !405
  store i32 %inc, i32* %i, align 4, !dbg !405
  br label %for.cond, !dbg !406, !llvm.loop !407

for.end:                                          ; preds = %for.cond
  br label %if.end44, !dbg !409

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !410
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end
  ret void, !dbg !412
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01.c", directory: "/root/SSE-Assessment")
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
!64 = !{i32 7, !"Dwarf Version", i32 4}
!65 = !{i32 2, !"Debug Info Version", i32 3}
!66 = !{i32 1, !"wchar_size", i32 4}
!67 = !{i32 7, !"uwtable", i32 1}
!68 = !{i32 7, !"frame-pointer", i32 2}
!69 = !{!"clang version 13.0.0"}
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01.c", directory: "/root/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !71, line: 54, type: !76)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 49, column: 5)
!81 = !DILocation(line: 54, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !71, line: 55, type: !83)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !84)
!84 = !{!85, !86, !90, !94}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !83, file: !17, line: 239, baseType: !56, size: 16)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !83, file: !17, line: 240, baseType: !87, size: 16, offset: 16)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !83, file: !17, line: 241, baseType: !91, size: 32, offset: 32)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !92)
!92 = !{!93}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !91, file: !17, line: 33, baseType: !46, size: 32)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !83, file: !17, line: 244, baseType: !95, size: 64, offset: 64)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 64, elements: !97)
!96 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!97 = !{!98}
!98 = !DISubrange(count: 8)
!99 = !DILocation(line: 55, column: 28, scope: !80)
!100 = !DILocalVariable(name: "listenSocket", scope: !80, file: !71, line: 56, type: !76)
!101 = !DILocation(line: 56, column: 16, scope: !80)
!102 = !DILocalVariable(name: "acceptSocket", scope: !80, file: !71, line: 57, type: !76)
!103 = !DILocation(line: 57, column: 16, scope: !80)
!104 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !71, line: 58, type: !60)
!105 = !DILocation(line: 58, column: 14, scope: !80)
!106 = !DILocation(line: 59, column: 9, scope: !80)
!107 = !DILocation(line: 69, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !80, file: !71, line: 60, column: 9)
!109 = !DILocation(line: 69, column: 26, scope: !108)
!110 = !DILocation(line: 70, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !71, line: 70, column: 17)
!112 = !DILocation(line: 70, column: 30, scope: !111)
!113 = !DILocation(line: 70, column: 17, scope: !108)
!114 = !DILocation(line: 72, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !71, line: 71, column: 13)
!116 = !DILocation(line: 74, column: 13, scope: !108)
!117 = !DILocation(line: 75, column: 21, scope: !108)
!118 = !DILocation(line: 75, column: 32, scope: !108)
!119 = !DILocation(line: 76, column: 21, scope: !108)
!120 = !DILocation(line: 76, column: 30, scope: !108)
!121 = !DILocation(line: 76, column: 37, scope: !108)
!122 = !DILocation(line: 77, column: 32, scope: !108)
!123 = !DILocation(line: 77, column: 21, scope: !108)
!124 = !DILocation(line: 77, column: 30, scope: !108)
!125 = !DILocation(line: 78, column: 22, scope: !126)
!126 = distinct !DILexicalBlock(scope: !108, file: !71, line: 78, column: 17)
!127 = !DILocation(line: 78, column: 36, scope: !126)
!128 = !DILocation(line: 78, column: 17, scope: !126)
!129 = !DILocation(line: 78, column: 81, scope: !126)
!130 = !DILocation(line: 78, column: 17, scope: !108)
!131 = !DILocation(line: 80, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !71, line: 79, column: 13)
!133 = !DILocation(line: 82, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !108, file: !71, line: 82, column: 17)
!135 = !DILocation(line: 82, column: 17, scope: !134)
!136 = !DILocation(line: 82, column: 54, scope: !134)
!137 = !DILocation(line: 82, column: 17, scope: !108)
!138 = !DILocation(line: 84, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !71, line: 83, column: 13)
!140 = !DILocation(line: 86, column: 35, scope: !108)
!141 = !DILocation(line: 86, column: 28, scope: !108)
!142 = !DILocation(line: 86, column: 26, scope: !108)
!143 = !DILocation(line: 87, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !108, file: !71, line: 87, column: 17)
!145 = !DILocation(line: 87, column: 30, scope: !144)
!146 = !DILocation(line: 87, column: 17, scope: !108)
!147 = !DILocation(line: 89, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !71, line: 88, column: 13)
!149 = !DILocation(line: 92, column: 31, scope: !108)
!150 = !DILocation(line: 92, column: 45, scope: !108)
!151 = !DILocation(line: 92, column: 26, scope: !108)
!152 = !DILocation(line: 92, column: 24, scope: !108)
!153 = !DILocation(line: 93, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !108, file: !71, line: 93, column: 17)
!155 = !DILocation(line: 93, column: 28, scope: !154)
!156 = !DILocation(line: 93, column: 44, scope: !154)
!157 = !DILocation(line: 93, column: 47, scope: !154)
!158 = !DILocation(line: 93, column: 58, scope: !154)
!159 = !DILocation(line: 93, column: 17, scope: !108)
!160 = !DILocation(line: 95, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !71, line: 94, column: 13)
!162 = !DILocation(line: 98, column: 25, scope: !108)
!163 = !DILocation(line: 98, column: 13, scope: !108)
!164 = !DILocation(line: 98, column: 37, scope: !108)
!165 = !DILocation(line: 100, column: 25, scope: !108)
!166 = !DILocation(line: 100, column: 20, scope: !108)
!167 = !DILocation(line: 100, column: 18, scope: !108)
!168 = !DILocation(line: 101, column: 9, scope: !108)
!169 = !DILocation(line: 103, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !80, file: !71, line: 103, column: 13)
!171 = !DILocation(line: 103, column: 26, scope: !170)
!172 = !DILocation(line: 103, column: 13, scope: !80)
!173 = !DILocation(line: 105, column: 26, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !71, line: 104, column: 9)
!175 = !DILocation(line: 105, column: 13, scope: !174)
!176 = !DILocation(line: 106, column: 9, scope: !174)
!177 = !DILocation(line: 107, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !80, file: !71, line: 107, column: 13)
!179 = !DILocation(line: 107, column: 26, scope: !178)
!180 = !DILocation(line: 107, column: 13, scope: !80)
!181 = !DILocation(line: 109, column: 26, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !71, line: 108, column: 9)
!183 = !DILocation(line: 109, column: 13, scope: !182)
!184 = !DILocation(line: 110, column: 9, scope: !182)
!185 = !DILocalVariable(name: "i", scope: !186, file: !71, line: 119, type: !76)
!186 = distinct !DILexicalBlock(scope: !70, file: !71, line: 118, column: 5)
!187 = !DILocation(line: 119, column: 13, scope: !186)
!188 = !DILocalVariable(name: "buffer", scope: !186, file: !71, line: 120, type: !189)
!189 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !190)
!190 = !{!191}
!191 = !DISubrange(count: 10)
!192 = !DILocation(line: 120, column: 13, scope: !186)
!193 = !DILocation(line: 123, column: 13, scope: !194)
!194 = distinct !DILexicalBlock(scope: !186, file: !71, line: 123, column: 13)
!195 = !DILocation(line: 123, column: 18, scope: !194)
!196 = !DILocation(line: 123, column: 13, scope: !186)
!197 = !DILocation(line: 125, column: 20, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !71, line: 124, column: 9)
!199 = !DILocation(line: 125, column: 13, scope: !198)
!200 = !DILocation(line: 125, column: 26, scope: !198)
!201 = !DILocation(line: 127, column: 19, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !71, line: 127, column: 13)
!203 = !DILocation(line: 127, column: 17, scope: !202)
!204 = !DILocation(line: 127, column: 24, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !71, line: 127, column: 13)
!206 = !DILocation(line: 127, column: 26, scope: !205)
!207 = !DILocation(line: 127, column: 13, scope: !202)
!208 = !DILocation(line: 129, column: 37, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !71, line: 128, column: 13)
!210 = !DILocation(line: 129, column: 30, scope: !209)
!211 = !DILocation(line: 129, column: 17, scope: !209)
!212 = !DILocation(line: 130, column: 13, scope: !209)
!213 = !DILocation(line: 127, column: 33, scope: !205)
!214 = !DILocation(line: 127, column: 13, scope: !205)
!215 = distinct !{!215, !207, !216, !217}
!216 = !DILocation(line: 130, column: 13, scope: !202)
!217 = !{!"llvm.loop.mustprogress"}
!218 = !DILocation(line: 131, column: 9, scope: !198)
!219 = !DILocation(line: 134, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !194, file: !71, line: 133, column: 9)
!221 = !DILocation(line: 137, column: 1, scope: !70)
!222 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_good", scope: !71, file: !71, line: 268, type: !72, scopeLine: 269, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!223 = !DILocation(line: 270, column: 5, scope: !222)
!224 = !DILocation(line: 271, column: 5, scope: !222)
!225 = !DILocation(line: 272, column: 1, scope: !222)
!226 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 283, type: !227, scopeLine: 284, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!227 = !DISubroutineType(types: !228)
!228 = !{!76, !76, !229}
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!231 = !DILocalVariable(name: "argc", arg: 1, scope: !226, file: !71, line: 283, type: !76)
!232 = !DILocation(line: 283, column: 14, scope: !226)
!233 = !DILocalVariable(name: "argv", arg: 2, scope: !226, file: !71, line: 283, type: !229)
!234 = !DILocation(line: 283, column: 27, scope: !226)
!235 = !DILocation(line: 286, column: 22, scope: !226)
!236 = !DILocation(line: 286, column: 12, scope: !226)
!237 = !DILocation(line: 286, column: 5, scope: !226)
!238 = !DILocation(line: 288, column: 5, scope: !226)
!239 = !DILocation(line: 289, column: 5, scope: !226)
!240 = !DILocation(line: 290, column: 5, scope: !226)
!241 = !DILocation(line: 293, column: 5, scope: !226)
!242 = !DILocation(line: 294, column: 5, scope: !226)
!243 = !DILocation(line: 295, column: 5, scope: !226)
!244 = !DILocation(line: 297, column: 5, scope: !226)
!245 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 144, type: !72, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!246 = !DILocalVariable(name: "data", scope: !245, file: !71, line: 146, type: !76)
!247 = !DILocation(line: 146, column: 9, scope: !245)
!248 = !DILocation(line: 148, column: 10, scope: !245)
!249 = !DILocation(line: 151, column: 10, scope: !245)
!250 = !DILocalVariable(name: "i", scope: !251, file: !71, line: 153, type: !76)
!251 = distinct !DILexicalBlock(scope: !245, file: !71, line: 152, column: 5)
!252 = !DILocation(line: 153, column: 13, scope: !251)
!253 = !DILocalVariable(name: "buffer", scope: !251, file: !71, line: 154, type: !189)
!254 = !DILocation(line: 154, column: 13, scope: !251)
!255 = !DILocation(line: 157, column: 13, scope: !256)
!256 = distinct !DILexicalBlock(scope: !251, file: !71, line: 157, column: 13)
!257 = !DILocation(line: 157, column: 18, scope: !256)
!258 = !DILocation(line: 157, column: 13, scope: !251)
!259 = !DILocation(line: 159, column: 20, scope: !260)
!260 = distinct !DILexicalBlock(scope: !256, file: !71, line: 158, column: 9)
!261 = !DILocation(line: 159, column: 13, scope: !260)
!262 = !DILocation(line: 159, column: 26, scope: !260)
!263 = !DILocation(line: 161, column: 19, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !71, line: 161, column: 13)
!265 = !DILocation(line: 161, column: 17, scope: !264)
!266 = !DILocation(line: 161, column: 24, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !71, line: 161, column: 13)
!268 = !DILocation(line: 161, column: 26, scope: !267)
!269 = !DILocation(line: 161, column: 13, scope: !264)
!270 = !DILocation(line: 163, column: 37, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !71, line: 162, column: 13)
!272 = !DILocation(line: 163, column: 30, scope: !271)
!273 = !DILocation(line: 163, column: 17, scope: !271)
!274 = !DILocation(line: 164, column: 13, scope: !271)
!275 = !DILocation(line: 161, column: 33, scope: !267)
!276 = !DILocation(line: 161, column: 13, scope: !267)
!277 = distinct !{!277, !269, !278, !217}
!278 = !DILocation(line: 164, column: 13, scope: !264)
!279 = !DILocation(line: 165, column: 9, scope: !260)
!280 = !DILocation(line: 168, column: 13, scope: !281)
!281 = distinct !DILexicalBlock(scope: !256, file: !71, line: 167, column: 9)
!282 = !DILocation(line: 171, column: 1, scope: !245)
!283 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 174, type: !72, scopeLine: 175, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!284 = !DILocalVariable(name: "data", scope: !283, file: !71, line: 176, type: !76)
!285 = !DILocation(line: 176, column: 9, scope: !283)
!286 = !DILocation(line: 178, column: 10, scope: !283)
!287 = !DILocalVariable(name: "recvResult", scope: !288, file: !71, line: 184, type: !76)
!288 = distinct !DILexicalBlock(scope: !283, file: !71, line: 179, column: 5)
!289 = !DILocation(line: 184, column: 13, scope: !288)
!290 = !DILocalVariable(name: "service", scope: !288, file: !71, line: 185, type: !83)
!291 = !DILocation(line: 185, column: 28, scope: !288)
!292 = !DILocalVariable(name: "listenSocket", scope: !288, file: !71, line: 186, type: !76)
!293 = !DILocation(line: 186, column: 16, scope: !288)
!294 = !DILocalVariable(name: "acceptSocket", scope: !288, file: !71, line: 187, type: !76)
!295 = !DILocation(line: 187, column: 16, scope: !288)
!296 = !DILocalVariable(name: "inputBuffer", scope: !288, file: !71, line: 188, type: !60)
!297 = !DILocation(line: 188, column: 14, scope: !288)
!298 = !DILocation(line: 189, column: 9, scope: !288)
!299 = !DILocation(line: 199, column: 28, scope: !300)
!300 = distinct !DILexicalBlock(scope: !288, file: !71, line: 190, column: 9)
!301 = !DILocation(line: 199, column: 26, scope: !300)
!302 = !DILocation(line: 200, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !300, file: !71, line: 200, column: 17)
!304 = !DILocation(line: 200, column: 30, scope: !303)
!305 = !DILocation(line: 200, column: 17, scope: !300)
!306 = !DILocation(line: 202, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !71, line: 201, column: 13)
!308 = !DILocation(line: 204, column: 13, scope: !300)
!309 = !DILocation(line: 205, column: 21, scope: !300)
!310 = !DILocation(line: 205, column: 32, scope: !300)
!311 = !DILocation(line: 206, column: 21, scope: !300)
!312 = !DILocation(line: 206, column: 30, scope: !300)
!313 = !DILocation(line: 206, column: 37, scope: !300)
!314 = !DILocation(line: 207, column: 32, scope: !300)
!315 = !DILocation(line: 207, column: 21, scope: !300)
!316 = !DILocation(line: 207, column: 30, scope: !300)
!317 = !DILocation(line: 208, column: 22, scope: !318)
!318 = distinct !DILexicalBlock(scope: !300, file: !71, line: 208, column: 17)
!319 = !DILocation(line: 208, column: 36, scope: !318)
!320 = !DILocation(line: 208, column: 17, scope: !318)
!321 = !DILocation(line: 208, column: 81, scope: !318)
!322 = !DILocation(line: 208, column: 17, scope: !300)
!323 = !DILocation(line: 210, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !318, file: !71, line: 209, column: 13)
!325 = !DILocation(line: 212, column: 24, scope: !326)
!326 = distinct !DILexicalBlock(scope: !300, file: !71, line: 212, column: 17)
!327 = !DILocation(line: 212, column: 17, scope: !326)
!328 = !DILocation(line: 212, column: 54, scope: !326)
!329 = !DILocation(line: 212, column: 17, scope: !300)
!330 = !DILocation(line: 214, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !326, file: !71, line: 213, column: 13)
!332 = !DILocation(line: 216, column: 35, scope: !300)
!333 = !DILocation(line: 216, column: 28, scope: !300)
!334 = !DILocation(line: 216, column: 26, scope: !300)
!335 = !DILocation(line: 217, column: 17, scope: !336)
!336 = distinct !DILexicalBlock(scope: !300, file: !71, line: 217, column: 17)
!337 = !DILocation(line: 217, column: 30, scope: !336)
!338 = !DILocation(line: 217, column: 17, scope: !300)
!339 = !DILocation(line: 219, column: 17, scope: !340)
!340 = distinct !DILexicalBlock(scope: !336, file: !71, line: 218, column: 13)
!341 = !DILocation(line: 222, column: 31, scope: !300)
!342 = !DILocation(line: 222, column: 45, scope: !300)
!343 = !DILocation(line: 222, column: 26, scope: !300)
!344 = !DILocation(line: 222, column: 24, scope: !300)
!345 = !DILocation(line: 223, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !300, file: !71, line: 223, column: 17)
!347 = !DILocation(line: 223, column: 28, scope: !346)
!348 = !DILocation(line: 223, column: 44, scope: !346)
!349 = !DILocation(line: 223, column: 47, scope: !346)
!350 = !DILocation(line: 223, column: 58, scope: !346)
!351 = !DILocation(line: 223, column: 17, scope: !300)
!352 = !DILocation(line: 225, column: 17, scope: !353)
!353 = distinct !DILexicalBlock(scope: !346, file: !71, line: 224, column: 13)
!354 = !DILocation(line: 228, column: 25, scope: !300)
!355 = !DILocation(line: 228, column: 13, scope: !300)
!356 = !DILocation(line: 228, column: 37, scope: !300)
!357 = !DILocation(line: 230, column: 25, scope: !300)
!358 = !DILocation(line: 230, column: 20, scope: !300)
!359 = !DILocation(line: 230, column: 18, scope: !300)
!360 = !DILocation(line: 231, column: 9, scope: !300)
!361 = !DILocation(line: 233, column: 13, scope: !362)
!362 = distinct !DILexicalBlock(scope: !288, file: !71, line: 233, column: 13)
!363 = !DILocation(line: 233, column: 26, scope: !362)
!364 = !DILocation(line: 233, column: 13, scope: !288)
!365 = !DILocation(line: 235, column: 26, scope: !366)
!366 = distinct !DILexicalBlock(scope: !362, file: !71, line: 234, column: 9)
!367 = !DILocation(line: 235, column: 13, scope: !366)
!368 = !DILocation(line: 236, column: 9, scope: !366)
!369 = !DILocation(line: 237, column: 13, scope: !370)
!370 = distinct !DILexicalBlock(scope: !288, file: !71, line: 237, column: 13)
!371 = !DILocation(line: 237, column: 26, scope: !370)
!372 = !DILocation(line: 237, column: 13, scope: !288)
!373 = !DILocation(line: 239, column: 26, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !71, line: 238, column: 9)
!375 = !DILocation(line: 239, column: 13, scope: !374)
!376 = !DILocation(line: 240, column: 9, scope: !374)
!377 = !DILocalVariable(name: "i", scope: !378, file: !71, line: 249, type: !76)
!378 = distinct !DILexicalBlock(scope: !283, file: !71, line: 248, column: 5)
!379 = !DILocation(line: 249, column: 13, scope: !378)
!380 = !DILocalVariable(name: "buffer", scope: !378, file: !71, line: 250, type: !189)
!381 = !DILocation(line: 250, column: 13, scope: !378)
!382 = !DILocation(line: 252, column: 13, scope: !383)
!383 = distinct !DILexicalBlock(scope: !378, file: !71, line: 252, column: 13)
!384 = !DILocation(line: 252, column: 18, scope: !383)
!385 = !DILocation(line: 252, column: 23, scope: !383)
!386 = !DILocation(line: 252, column: 26, scope: !383)
!387 = !DILocation(line: 252, column: 31, scope: !383)
!388 = !DILocation(line: 252, column: 13, scope: !378)
!389 = !DILocation(line: 254, column: 20, scope: !390)
!390 = distinct !DILexicalBlock(scope: !383, file: !71, line: 253, column: 9)
!391 = !DILocation(line: 254, column: 13, scope: !390)
!392 = !DILocation(line: 254, column: 26, scope: !390)
!393 = !DILocation(line: 256, column: 19, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !71, line: 256, column: 13)
!395 = !DILocation(line: 256, column: 17, scope: !394)
!396 = !DILocation(line: 256, column: 24, scope: !397)
!397 = distinct !DILexicalBlock(scope: !394, file: !71, line: 256, column: 13)
!398 = !DILocation(line: 256, column: 26, scope: !397)
!399 = !DILocation(line: 256, column: 13, scope: !394)
!400 = !DILocation(line: 258, column: 37, scope: !401)
!401 = distinct !DILexicalBlock(scope: !397, file: !71, line: 257, column: 13)
!402 = !DILocation(line: 258, column: 30, scope: !401)
!403 = !DILocation(line: 258, column: 17, scope: !401)
!404 = !DILocation(line: 259, column: 13, scope: !401)
!405 = !DILocation(line: 256, column: 33, scope: !397)
!406 = !DILocation(line: 256, column: 13, scope: !397)
!407 = distinct !{!407, !399, !408, !217}
!408 = !DILocation(line: 259, column: 13, scope: !394)
!409 = !DILocation(line: 260, column: 9, scope: !390)
!410 = !DILocation(line: 263, column: 13, scope: !411)
!411 = distinct !DILexicalBlock(scope: !383, file: !71, line: 262, column: 9)
!412 = !DILocation(line: 266, column: 1, scope: !283)
