; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_02_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !74, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !79, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %connectSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  br label %do.body, !dbg !106

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !107
  store i32 %call, i32* %connectSocket, align 4, !dbg !109
  %0 = load i32, i32* %connectSocket, align 4, !dbg !110
  %cmp = icmp eq i32 %0, -1, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !114

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !116
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !117
  store i16 2, i16* %sin_family, align 4, !dbg !118
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !119
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !120
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !121
  store i32 %call1, i32* %s_addr, align 4, !dbg !122
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !123
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !124
  store i16 %call2, i16* %sin_port, align 2, !dbg !125
  %2 = load i32, i32* %connectSocket, align 4, !dbg !126
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !128
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !129
  %cmp4 = icmp eq i32 %call3, -1, !dbg !130
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !131

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !132

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !134
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !135
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !136
  %conv = trunc i64 %call7 to i32, !dbg !136
  store i32 %conv, i32* %recvResult, align 4, !dbg !137
  %5 = load i32, i32* %recvResult, align 4, !dbg !138
  %cmp8 = icmp eq i32 %5, -1, !dbg !140
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !141

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !142
  %cmp10 = icmp eq i32 %6, 0, !dbg !143
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !144

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !145

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !147
  %idxprom = sext i32 %7 to i64, !dbg !148
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !150
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !151
  store i32 %call15, i32* %data, align 4, !dbg !152
  br label %do.end, !dbg !153

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !154
  %cmp16 = icmp ne i32 %8, -1, !dbg !156
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !157

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !158
  %call19 = call i32 @close(i32 %9), !dbg !160
  br label %if.end20, !dbg !161

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !162, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !167, metadata !DIExpression()), !dbg !171
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !171
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !171
  %11 = load i32, i32* %data, align 4, !dbg !172
  %cmp21 = icmp sge i32 %11, 0, !dbg !174
  br i1 %cmp21, label %if.then23, label %if.else, !dbg !175

if.then23:                                        ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !176
  %idxprom24 = sext i32 %12 to i64, !dbg !178
  %arrayidx25 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom24, !dbg !178
  store i32 1, i32* %arrayidx25, align 4, !dbg !179
  store i32 0, i32* %i, align 4, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.then23
  %13 = load i32, i32* %i, align 4, !dbg !183
  %cmp26 = icmp slt i32 %13, 10, !dbg !185
  br i1 %cmp26, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %14 = load i32, i32* %i, align 4, !dbg !187
  %idxprom28 = sext i32 %14 to i64, !dbg !189
  %arrayidx29 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom28, !dbg !189
  %15 = load i32, i32* %arrayidx29, align 4, !dbg !189
  call void @printIntLine(i32 %15), !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !192
  %inc = add nsw i32 %16, 1, !dbg !192
  store i32 %inc, i32* %i, align 4, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  br label %if.end30, !dbg !197

if.else:                                          ; preds = %if.end20
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !198
  br label %if.end30

if.end30:                                         ; preds = %if.else, %for.end
  ret void, !dbg !200
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #2

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_02_good() #0 !dbg !201 {
entry:
  call void @goodB2G1(), !dbg !202
  call void @goodB2G2(), !dbg !203
  call void @goodG2B1(), !dbg !204
  call void @goodG2B2(), !dbg !205
  ret void, !dbg !206
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !207 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !212, metadata !DIExpression()), !dbg !213
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !214, metadata !DIExpression()), !dbg !215
  %call = call i64 @time(i64* null) #7, !dbg !216
  %conv = trunc i64 %call to i32, !dbg !217
  call void @srand(i32 %conv) #7, !dbg !218
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !219
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_02_good(), !dbg !220
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !221
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !222
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_02_bad(), !dbg !223
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !224
  ret i32 0, !dbg !225
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !226 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !227, metadata !DIExpression()), !dbg !228
  store i32 -1, i32* %data, align 4, !dbg !229
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !230, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 -1, i32* %connectSocket, align 4, !dbg !238
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !239, metadata !DIExpression()), !dbg !240
  br label %do.body, !dbg !241

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !242
  store i32 %call, i32* %connectSocket, align 4, !dbg !244
  %0 = load i32, i32* %connectSocket, align 4, !dbg !245
  %cmp = icmp eq i32 %0, -1, !dbg !247
  br i1 %cmp, label %if.then, label %if.end, !dbg !248

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !249

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !251
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !251
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !252
  store i16 2, i16* %sin_family, align 4, !dbg !253
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !254
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !255
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !256
  store i32 %call1, i32* %s_addr, align 4, !dbg !257
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !258
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !259
  store i16 %call2, i16* %sin_port, align 2, !dbg !260
  %2 = load i32, i32* %connectSocket, align 4, !dbg !261
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !263
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !264
  %cmp4 = icmp eq i32 %call3, -1, !dbg !265
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !266

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !267

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !269
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !270
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !271
  %conv = trunc i64 %call7 to i32, !dbg !271
  store i32 %conv, i32* %recvResult, align 4, !dbg !272
  %5 = load i32, i32* %recvResult, align 4, !dbg !273
  %cmp8 = icmp eq i32 %5, -1, !dbg !275
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !276

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !277
  %cmp10 = icmp eq i32 %6, 0, !dbg !278
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !279

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !280

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !282
  %idxprom = sext i32 %7 to i64, !dbg !283
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !283
  store i8 0, i8* %arrayidx, align 1, !dbg !284
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !285
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !286
  store i32 %call15, i32* %data, align 4, !dbg !287
  br label %do.end, !dbg !288

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !289
  %cmp16 = icmp ne i32 %8, -1, !dbg !291
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !292

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !293
  %call19 = call i32 @close(i32 %9), !dbg !295
  br label %if.end20, !dbg !296

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !297, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !302, metadata !DIExpression()), !dbg !303
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !303
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !303
  %11 = load i32, i32* %data, align 4, !dbg !304
  %cmp21 = icmp sge i32 %11, 0, !dbg !306
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !307

land.lhs.true:                                    ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !308
  %cmp23 = icmp slt i32 %12, 10, !dbg !309
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !310

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !311
  %idxprom26 = sext i32 %13 to i64, !dbg !313
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !313
  store i32 1, i32* %arrayidx27, align 4, !dbg !314
  store i32 0, i32* %i, align 4, !dbg !315
  br label %for.cond, !dbg !317

for.cond:                                         ; preds = %for.inc, %if.then25
  %14 = load i32, i32* %i, align 4, !dbg !318
  %cmp28 = icmp slt i32 %14, 10, !dbg !320
  br i1 %cmp28, label %for.body, label %for.end, !dbg !321

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !322
  %idxprom30 = sext i32 %15 to i64, !dbg !324
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !324
  %16 = load i32, i32* %arrayidx31, align 4, !dbg !324
  call void @printIntLine(i32 %16), !dbg !325
  br label %for.inc, !dbg !326

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !327
  %inc = add nsw i32 %17, 1, !dbg !327
  store i32 %inc, i32* %i, align 4, !dbg !327
  br label %for.cond, !dbg !328, !llvm.loop !329

for.end:                                          ; preds = %for.cond
  br label %if.end32, !dbg !331

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !332
  br label %if.end32

if.end32:                                         ; preds = %if.else, %for.end
  ret void, !dbg !334
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !335 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !336, metadata !DIExpression()), !dbg !337
  store i32 -1, i32* %data, align 4, !dbg !338
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !339, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !344, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !346, metadata !DIExpression()), !dbg !347
  store i32 -1, i32* %connectSocket, align 4, !dbg !347
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !348, metadata !DIExpression()), !dbg !349
  br label %do.body, !dbg !350

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !351
  store i32 %call, i32* %connectSocket, align 4, !dbg !353
  %0 = load i32, i32* %connectSocket, align 4, !dbg !354
  %cmp = icmp eq i32 %0, -1, !dbg !356
  br i1 %cmp, label %if.then, label %if.end, !dbg !357

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !358

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !360
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !360
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !361
  store i16 2, i16* %sin_family, align 4, !dbg !362
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !363
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !364
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !365
  store i32 %call1, i32* %s_addr, align 4, !dbg !366
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !367
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !368
  store i16 %call2, i16* %sin_port, align 2, !dbg !369
  %2 = load i32, i32* %connectSocket, align 4, !dbg !370
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !372
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !373
  %cmp4 = icmp eq i32 %call3, -1, !dbg !374
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !375

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !376

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !378
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !379
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !380
  %conv = trunc i64 %call7 to i32, !dbg !380
  store i32 %conv, i32* %recvResult, align 4, !dbg !381
  %5 = load i32, i32* %recvResult, align 4, !dbg !382
  %cmp8 = icmp eq i32 %5, -1, !dbg !384
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !385

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !386
  %cmp10 = icmp eq i32 %6, 0, !dbg !387
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !388

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !389

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !391
  %idxprom = sext i32 %7 to i64, !dbg !392
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !392
  store i8 0, i8* %arrayidx, align 1, !dbg !393
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !394
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !395
  store i32 %call15, i32* %data, align 4, !dbg !396
  br label %do.end, !dbg !397

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !398
  %cmp16 = icmp ne i32 %8, -1, !dbg !400
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !401

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !402
  %call19 = call i32 @close(i32 %9), !dbg !404
  br label %if.end20, !dbg !405

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !406, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !411, metadata !DIExpression()), !dbg !412
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !412
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !412
  %11 = load i32, i32* %data, align 4, !dbg !413
  %cmp21 = icmp sge i32 %11, 0, !dbg !415
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !416

land.lhs.true:                                    ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !417
  %cmp23 = icmp slt i32 %12, 10, !dbg !418
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !419

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !420
  %idxprom26 = sext i32 %13 to i64, !dbg !422
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !422
  store i32 1, i32* %arrayidx27, align 4, !dbg !423
  store i32 0, i32* %i, align 4, !dbg !424
  br label %for.cond, !dbg !426

for.cond:                                         ; preds = %for.inc, %if.then25
  %14 = load i32, i32* %i, align 4, !dbg !427
  %cmp28 = icmp slt i32 %14, 10, !dbg !429
  br i1 %cmp28, label %for.body, label %for.end, !dbg !430

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !431
  %idxprom30 = sext i32 %15 to i64, !dbg !433
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !433
  %16 = load i32, i32* %arrayidx31, align 4, !dbg !433
  call void @printIntLine(i32 %16), !dbg !434
  br label %for.inc, !dbg !435

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !436
  %inc = add nsw i32 %17, 1, !dbg !436
  store i32 %inc, i32* %i, align 4, !dbg !436
  br label %for.cond, !dbg !437, !llvm.loop !438

for.end:                                          ; preds = %for.cond
  br label %if.end32, !dbg !440

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !441
  br label %if.end32

if.end32:                                         ; preds = %if.else, %for.end
  ret void, !dbg !443
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !444 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !445, metadata !DIExpression()), !dbg !446
  store i32 -1, i32* %data, align 4, !dbg !447
  store i32 7, i32* %data, align 4, !dbg !448
  call void @llvm.dbg.declare(metadata i32* %i, metadata !451, metadata !DIExpression()), !dbg !455
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !456, metadata !DIExpression()), !dbg !457
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !457
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !457
  %1 = load i32, i32* %data, align 4, !dbg !458
  %cmp = icmp sge i32 %1, 0, !dbg !460
  br i1 %cmp, label %if.then, label %if.else, !dbg !461

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !462
  %idxprom = sext i32 %2 to i64, !dbg !464
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !464
  store i32 1, i32* %arrayidx, align 4, !dbg !465
  store i32 0, i32* %i, align 4, !dbg !466
  br label %for.cond, !dbg !468

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !469
  %cmp1 = icmp slt i32 %3, 10, !dbg !471
  br i1 %cmp1, label %for.body, label %for.end, !dbg !472

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !473
  %idxprom2 = sext i32 %4 to i64, !dbg !475
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !475
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !475
  call void @printIntLine(i32 %5), !dbg !476
  br label %for.inc, !dbg !477

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !478
  %inc = add nsw i32 %6, 1, !dbg !478
  store i32 %inc, i32* %i, align 4, !dbg !478
  br label %for.cond, !dbg !479, !llvm.loop !480

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !482

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !483
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !485
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !486 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !487, metadata !DIExpression()), !dbg !488
  store i32 -1, i32* %data, align 4, !dbg !489
  store i32 7, i32* %data, align 4, !dbg !490
  call void @llvm.dbg.declare(metadata i32* %i, metadata !493, metadata !DIExpression()), !dbg !497
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !498, metadata !DIExpression()), !dbg !499
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !499
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !499
  %1 = load i32, i32* %data, align 4, !dbg !500
  %cmp = icmp sge i32 %1, 0, !dbg !502
  br i1 %cmp, label %if.then, label %if.else, !dbg !503

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !504
  %idxprom = sext i32 %2 to i64, !dbg !506
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !506
  store i32 1, i32* %arrayidx, align 4, !dbg !507
  store i32 0, i32* %i, align 4, !dbg !508
  br label %for.cond, !dbg !510

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !511
  %cmp1 = icmp slt i32 %3, 10, !dbg !513
  br i1 %cmp1, label %for.body, label %for.end, !dbg !514

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !515
  %idxprom2 = sext i32 %4 to i64, !dbg !517
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !517
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !517
  call void @printIntLine(i32 %5), !dbg !518
  br label %for.inc, !dbg !519

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !520
  %inc = add nsw i32 %6, 1, !dbg !520
  store i32 %inc, i32* %i, align 4, !dbg !520
  br label %for.cond, !dbg !521, !llvm.loop !522

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !524

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !525
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !527
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
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_02.c", directory: "/root/SSE-Assessment")
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
!45 = !{!46, !5}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 175, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 177, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 178, baseType: !55, size: 112, offset: 16)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 112, elements: !57)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !{!58}
!58 = !DISubrange(count: 14)
!59 = !{i32 7, !"Dwarf Version", i32 4}
!60 = !{i32 2, !"Debug Info Version", i32 3}
!61 = !{i32 1, !"wchar_size", i32 4}
!62 = !{i32 7, !"uwtable", i32 1}
!63 = !{i32 7, !"frame-pointer", i32 2}
!64 = !{!"clang version 13.0.0"}
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_02_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_02.c", directory: "/root/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocalVariable(name: "recvResult", scope: !75, file: !66, line: 56, type: !71)
!75 = distinct !DILexicalBlock(scope: !76, file: !66, line: 51, column: 9)
!76 = distinct !DILexicalBlock(scope: !77, file: !66, line: 50, column: 5)
!77 = distinct !DILexicalBlock(scope: !65, file: !66, line: 49, column: 8)
!78 = !DILocation(line: 56, column: 17, scope: !75)
!79 = !DILocalVariable(name: "service", scope: !75, file: !66, line: 57, type: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !81)
!81 = !{!82, !83, !89, !96}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !80, file: !17, line: 239, baseType: !51, size: 16)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !80, file: !17, line: 240, baseType: !84, size: 16, offset: 16)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !86, line: 25, baseType: !87)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !88, line: 39, baseType: !53)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !80, file: !17, line: 241, baseType: !90, size: 32, offset: 32)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !91)
!91 = !{!92}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !90, file: !17, line: 33, baseType: !93, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !86, line: 26, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !88, line: 41, baseType: !5)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !80, file: !17, line: 244, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 57, column: 32, scope: !75)
!102 = !DILocalVariable(name: "connectSocket", scope: !75, file: !66, line: 58, type: !71)
!103 = !DILocation(line: 58, column: 20, scope: !75)
!104 = !DILocalVariable(name: "inputBuffer", scope: !75, file: !66, line: 59, type: !55)
!105 = !DILocation(line: 59, column: 18, scope: !75)
!106 = !DILocation(line: 60, column: 13, scope: !75)
!107 = !DILocation(line: 70, column: 33, scope: !108)
!108 = distinct !DILexicalBlock(scope: !75, file: !66, line: 61, column: 13)
!109 = !DILocation(line: 70, column: 31, scope: !108)
!110 = !DILocation(line: 71, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !66, line: 71, column: 21)
!112 = !DILocation(line: 71, column: 35, scope: !111)
!113 = !DILocation(line: 71, column: 21, scope: !108)
!114 = !DILocation(line: 73, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !66, line: 72, column: 17)
!116 = !DILocation(line: 75, column: 17, scope: !108)
!117 = !DILocation(line: 76, column: 25, scope: !108)
!118 = !DILocation(line: 76, column: 36, scope: !108)
!119 = !DILocation(line: 77, column: 43, scope: !108)
!120 = !DILocation(line: 77, column: 25, scope: !108)
!121 = !DILocation(line: 77, column: 34, scope: !108)
!122 = !DILocation(line: 77, column: 41, scope: !108)
!123 = !DILocation(line: 78, column: 36, scope: !108)
!124 = !DILocation(line: 78, column: 25, scope: !108)
!125 = !DILocation(line: 78, column: 34, scope: !108)
!126 = !DILocation(line: 79, column: 29, scope: !127)
!127 = distinct !DILexicalBlock(scope: !108, file: !66, line: 79, column: 21)
!128 = !DILocation(line: 79, column: 44, scope: !127)
!129 = !DILocation(line: 79, column: 21, scope: !127)
!130 = !DILocation(line: 79, column: 89, scope: !127)
!131 = !DILocation(line: 79, column: 21, scope: !108)
!132 = !DILocation(line: 81, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !66, line: 80, column: 17)
!134 = !DILocation(line: 85, column: 35, scope: !108)
!135 = !DILocation(line: 85, column: 50, scope: !108)
!136 = !DILocation(line: 85, column: 30, scope: !108)
!137 = !DILocation(line: 85, column: 28, scope: !108)
!138 = !DILocation(line: 86, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !108, file: !66, line: 86, column: 21)
!140 = !DILocation(line: 86, column: 32, scope: !139)
!141 = !DILocation(line: 86, column: 48, scope: !139)
!142 = !DILocation(line: 86, column: 51, scope: !139)
!143 = !DILocation(line: 86, column: 62, scope: !139)
!144 = !DILocation(line: 86, column: 21, scope: !108)
!145 = !DILocation(line: 88, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !139, file: !66, line: 87, column: 17)
!147 = !DILocation(line: 91, column: 29, scope: !108)
!148 = !DILocation(line: 91, column: 17, scope: !108)
!149 = !DILocation(line: 91, column: 41, scope: !108)
!150 = !DILocation(line: 93, column: 29, scope: !108)
!151 = !DILocation(line: 93, column: 24, scope: !108)
!152 = !DILocation(line: 93, column: 22, scope: !108)
!153 = !DILocation(line: 94, column: 13, scope: !108)
!154 = !DILocation(line: 96, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !75, file: !66, line: 96, column: 17)
!156 = !DILocation(line: 96, column: 31, scope: !155)
!157 = !DILocation(line: 96, column: 17, scope: !75)
!158 = !DILocation(line: 98, column: 30, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !66, line: 97, column: 13)
!160 = !DILocation(line: 98, column: 17, scope: !159)
!161 = !DILocation(line: 99, column: 13, scope: !159)
!162 = !DILocalVariable(name: "i", scope: !163, file: !66, line: 111, type: !71)
!163 = distinct !DILexicalBlock(scope: !164, file: !66, line: 110, column: 9)
!164 = distinct !DILexicalBlock(scope: !165, file: !66, line: 109, column: 5)
!165 = distinct !DILexicalBlock(scope: !65, file: !66, line: 108, column: 8)
!166 = !DILocation(line: 111, column: 17, scope: !163)
!167 = !DILocalVariable(name: "buffer", scope: !163, file: !66, line: 112, type: !168)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !169)
!169 = !{!170}
!170 = !DISubrange(count: 10)
!171 = !DILocation(line: 112, column: 17, scope: !163)
!172 = !DILocation(line: 115, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !163, file: !66, line: 115, column: 17)
!174 = !DILocation(line: 115, column: 22, scope: !173)
!175 = !DILocation(line: 115, column: 17, scope: !163)
!176 = !DILocation(line: 117, column: 24, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !66, line: 116, column: 13)
!178 = !DILocation(line: 117, column: 17, scope: !177)
!179 = !DILocation(line: 117, column: 30, scope: !177)
!180 = !DILocation(line: 119, column: 23, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !66, line: 119, column: 17)
!182 = !DILocation(line: 119, column: 21, scope: !181)
!183 = !DILocation(line: 119, column: 28, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !66, line: 119, column: 17)
!185 = !DILocation(line: 119, column: 30, scope: !184)
!186 = !DILocation(line: 119, column: 17, scope: !181)
!187 = !DILocation(line: 121, column: 41, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !66, line: 120, column: 17)
!189 = !DILocation(line: 121, column: 34, scope: !188)
!190 = !DILocation(line: 121, column: 21, scope: !188)
!191 = !DILocation(line: 122, column: 17, scope: !188)
!192 = !DILocation(line: 119, column: 37, scope: !184)
!193 = !DILocation(line: 119, column: 17, scope: !184)
!194 = distinct !{!194, !186, !195, !196}
!195 = !DILocation(line: 122, column: 17, scope: !181)
!196 = !{!"llvm.loop.mustprogress"}
!197 = !DILocation(line: 123, column: 13, scope: !177)
!198 = !DILocation(line: 126, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !173, file: !66, line: 125, column: 13)
!200 = !DILocation(line: 130, column: 1, scope: !65)
!201 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_02_good", scope: !66, file: !66, line: 394, type: !67, scopeLine: 395, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!202 = !DILocation(line: 396, column: 5, scope: !201)
!203 = !DILocation(line: 397, column: 5, scope: !201)
!204 = !DILocation(line: 398, column: 5, scope: !201)
!205 = !DILocation(line: 399, column: 5, scope: !201)
!206 = !DILocation(line: 400, column: 1, scope: !201)
!207 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 411, type: !208, scopeLine: 412, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!208 = !DISubroutineType(types: !209)
!209 = !{!71, !71, !210}
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!212 = !DILocalVariable(name: "argc", arg: 1, scope: !207, file: !66, line: 411, type: !71)
!213 = !DILocation(line: 411, column: 14, scope: !207)
!214 = !DILocalVariable(name: "argv", arg: 2, scope: !207, file: !66, line: 411, type: !210)
!215 = !DILocation(line: 411, column: 27, scope: !207)
!216 = !DILocation(line: 414, column: 22, scope: !207)
!217 = !DILocation(line: 414, column: 12, scope: !207)
!218 = !DILocation(line: 414, column: 5, scope: !207)
!219 = !DILocation(line: 416, column: 5, scope: !207)
!220 = !DILocation(line: 417, column: 5, scope: !207)
!221 = !DILocation(line: 418, column: 5, scope: !207)
!222 = !DILocation(line: 421, column: 5, scope: !207)
!223 = !DILocation(line: 422, column: 5, scope: !207)
!224 = !DILocation(line: 423, column: 5, scope: !207)
!225 = !DILocation(line: 425, column: 5, scope: !207)
!226 = distinct !DISubprogram(name: "goodB2G1", scope: !66, file: !66, line: 137, type: !67, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!227 = !DILocalVariable(name: "data", scope: !226, file: !66, line: 139, type: !71)
!228 = !DILocation(line: 139, column: 9, scope: !226)
!229 = !DILocation(line: 141, column: 10, scope: !226)
!230 = !DILocalVariable(name: "recvResult", scope: !231, file: !66, line: 149, type: !71)
!231 = distinct !DILexicalBlock(scope: !232, file: !66, line: 144, column: 9)
!232 = distinct !DILexicalBlock(scope: !233, file: !66, line: 143, column: 5)
!233 = distinct !DILexicalBlock(scope: !226, file: !66, line: 142, column: 8)
!234 = !DILocation(line: 149, column: 17, scope: !231)
!235 = !DILocalVariable(name: "service", scope: !231, file: !66, line: 150, type: !80)
!236 = !DILocation(line: 150, column: 32, scope: !231)
!237 = !DILocalVariable(name: "connectSocket", scope: !231, file: !66, line: 151, type: !71)
!238 = !DILocation(line: 151, column: 20, scope: !231)
!239 = !DILocalVariable(name: "inputBuffer", scope: !231, file: !66, line: 152, type: !55)
!240 = !DILocation(line: 152, column: 18, scope: !231)
!241 = !DILocation(line: 153, column: 13, scope: !231)
!242 = !DILocation(line: 163, column: 33, scope: !243)
!243 = distinct !DILexicalBlock(scope: !231, file: !66, line: 154, column: 13)
!244 = !DILocation(line: 163, column: 31, scope: !243)
!245 = !DILocation(line: 164, column: 21, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !66, line: 164, column: 21)
!247 = !DILocation(line: 164, column: 35, scope: !246)
!248 = !DILocation(line: 164, column: 21, scope: !243)
!249 = !DILocation(line: 166, column: 21, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !66, line: 165, column: 17)
!251 = !DILocation(line: 168, column: 17, scope: !243)
!252 = !DILocation(line: 169, column: 25, scope: !243)
!253 = !DILocation(line: 169, column: 36, scope: !243)
!254 = !DILocation(line: 170, column: 43, scope: !243)
!255 = !DILocation(line: 170, column: 25, scope: !243)
!256 = !DILocation(line: 170, column: 34, scope: !243)
!257 = !DILocation(line: 170, column: 41, scope: !243)
!258 = !DILocation(line: 171, column: 36, scope: !243)
!259 = !DILocation(line: 171, column: 25, scope: !243)
!260 = !DILocation(line: 171, column: 34, scope: !243)
!261 = !DILocation(line: 172, column: 29, scope: !262)
!262 = distinct !DILexicalBlock(scope: !243, file: !66, line: 172, column: 21)
!263 = !DILocation(line: 172, column: 44, scope: !262)
!264 = !DILocation(line: 172, column: 21, scope: !262)
!265 = !DILocation(line: 172, column: 89, scope: !262)
!266 = !DILocation(line: 172, column: 21, scope: !243)
!267 = !DILocation(line: 174, column: 21, scope: !268)
!268 = distinct !DILexicalBlock(scope: !262, file: !66, line: 173, column: 17)
!269 = !DILocation(line: 178, column: 35, scope: !243)
!270 = !DILocation(line: 178, column: 50, scope: !243)
!271 = !DILocation(line: 178, column: 30, scope: !243)
!272 = !DILocation(line: 178, column: 28, scope: !243)
!273 = !DILocation(line: 179, column: 21, scope: !274)
!274 = distinct !DILexicalBlock(scope: !243, file: !66, line: 179, column: 21)
!275 = !DILocation(line: 179, column: 32, scope: !274)
!276 = !DILocation(line: 179, column: 48, scope: !274)
!277 = !DILocation(line: 179, column: 51, scope: !274)
!278 = !DILocation(line: 179, column: 62, scope: !274)
!279 = !DILocation(line: 179, column: 21, scope: !243)
!280 = !DILocation(line: 181, column: 21, scope: !281)
!281 = distinct !DILexicalBlock(scope: !274, file: !66, line: 180, column: 17)
!282 = !DILocation(line: 184, column: 29, scope: !243)
!283 = !DILocation(line: 184, column: 17, scope: !243)
!284 = !DILocation(line: 184, column: 41, scope: !243)
!285 = !DILocation(line: 186, column: 29, scope: !243)
!286 = !DILocation(line: 186, column: 24, scope: !243)
!287 = !DILocation(line: 186, column: 22, scope: !243)
!288 = !DILocation(line: 187, column: 13, scope: !243)
!289 = !DILocation(line: 189, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !231, file: !66, line: 189, column: 17)
!291 = !DILocation(line: 189, column: 31, scope: !290)
!292 = !DILocation(line: 189, column: 17, scope: !231)
!293 = !DILocation(line: 191, column: 30, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !66, line: 190, column: 13)
!295 = !DILocation(line: 191, column: 17, scope: !294)
!296 = !DILocation(line: 192, column: 13, scope: !294)
!297 = !DILocalVariable(name: "i", scope: !298, file: !66, line: 209, type: !71)
!298 = distinct !DILexicalBlock(scope: !299, file: !66, line: 208, column: 9)
!299 = distinct !DILexicalBlock(scope: !300, file: !66, line: 207, column: 5)
!300 = distinct !DILexicalBlock(scope: !226, file: !66, line: 201, column: 8)
!301 = !DILocation(line: 209, column: 17, scope: !298)
!302 = !DILocalVariable(name: "buffer", scope: !298, file: !66, line: 210, type: !168)
!303 = !DILocation(line: 210, column: 17, scope: !298)
!304 = !DILocation(line: 212, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !298, file: !66, line: 212, column: 17)
!306 = !DILocation(line: 212, column: 22, scope: !305)
!307 = !DILocation(line: 212, column: 27, scope: !305)
!308 = !DILocation(line: 212, column: 30, scope: !305)
!309 = !DILocation(line: 212, column: 35, scope: !305)
!310 = !DILocation(line: 212, column: 17, scope: !298)
!311 = !DILocation(line: 214, column: 24, scope: !312)
!312 = distinct !DILexicalBlock(scope: !305, file: !66, line: 213, column: 13)
!313 = !DILocation(line: 214, column: 17, scope: !312)
!314 = !DILocation(line: 214, column: 30, scope: !312)
!315 = !DILocation(line: 216, column: 23, scope: !316)
!316 = distinct !DILexicalBlock(scope: !312, file: !66, line: 216, column: 17)
!317 = !DILocation(line: 216, column: 21, scope: !316)
!318 = !DILocation(line: 216, column: 28, scope: !319)
!319 = distinct !DILexicalBlock(scope: !316, file: !66, line: 216, column: 17)
!320 = !DILocation(line: 216, column: 30, scope: !319)
!321 = !DILocation(line: 216, column: 17, scope: !316)
!322 = !DILocation(line: 218, column: 41, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !66, line: 217, column: 17)
!324 = !DILocation(line: 218, column: 34, scope: !323)
!325 = !DILocation(line: 218, column: 21, scope: !323)
!326 = !DILocation(line: 219, column: 17, scope: !323)
!327 = !DILocation(line: 216, column: 37, scope: !319)
!328 = !DILocation(line: 216, column: 17, scope: !319)
!329 = distinct !{!329, !321, !330, !196}
!330 = !DILocation(line: 219, column: 17, scope: !316)
!331 = !DILocation(line: 220, column: 13, scope: !312)
!332 = !DILocation(line: 223, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !305, file: !66, line: 222, column: 13)
!334 = !DILocation(line: 227, column: 1, scope: !226)
!335 = distinct !DISubprogram(name: "goodB2G2", scope: !66, file: !66, line: 230, type: !67, scopeLine: 231, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!336 = !DILocalVariable(name: "data", scope: !335, file: !66, line: 232, type: !71)
!337 = !DILocation(line: 232, column: 9, scope: !335)
!338 = !DILocation(line: 234, column: 10, scope: !335)
!339 = !DILocalVariable(name: "recvResult", scope: !340, file: !66, line: 242, type: !71)
!340 = distinct !DILexicalBlock(scope: !341, file: !66, line: 237, column: 9)
!341 = distinct !DILexicalBlock(scope: !342, file: !66, line: 236, column: 5)
!342 = distinct !DILexicalBlock(scope: !335, file: !66, line: 235, column: 8)
!343 = !DILocation(line: 242, column: 17, scope: !340)
!344 = !DILocalVariable(name: "service", scope: !340, file: !66, line: 243, type: !80)
!345 = !DILocation(line: 243, column: 32, scope: !340)
!346 = !DILocalVariable(name: "connectSocket", scope: !340, file: !66, line: 244, type: !71)
!347 = !DILocation(line: 244, column: 20, scope: !340)
!348 = !DILocalVariable(name: "inputBuffer", scope: !340, file: !66, line: 245, type: !55)
!349 = !DILocation(line: 245, column: 18, scope: !340)
!350 = !DILocation(line: 246, column: 13, scope: !340)
!351 = !DILocation(line: 256, column: 33, scope: !352)
!352 = distinct !DILexicalBlock(scope: !340, file: !66, line: 247, column: 13)
!353 = !DILocation(line: 256, column: 31, scope: !352)
!354 = !DILocation(line: 257, column: 21, scope: !355)
!355 = distinct !DILexicalBlock(scope: !352, file: !66, line: 257, column: 21)
!356 = !DILocation(line: 257, column: 35, scope: !355)
!357 = !DILocation(line: 257, column: 21, scope: !352)
!358 = !DILocation(line: 259, column: 21, scope: !359)
!359 = distinct !DILexicalBlock(scope: !355, file: !66, line: 258, column: 17)
!360 = !DILocation(line: 261, column: 17, scope: !352)
!361 = !DILocation(line: 262, column: 25, scope: !352)
!362 = !DILocation(line: 262, column: 36, scope: !352)
!363 = !DILocation(line: 263, column: 43, scope: !352)
!364 = !DILocation(line: 263, column: 25, scope: !352)
!365 = !DILocation(line: 263, column: 34, scope: !352)
!366 = !DILocation(line: 263, column: 41, scope: !352)
!367 = !DILocation(line: 264, column: 36, scope: !352)
!368 = !DILocation(line: 264, column: 25, scope: !352)
!369 = !DILocation(line: 264, column: 34, scope: !352)
!370 = !DILocation(line: 265, column: 29, scope: !371)
!371 = distinct !DILexicalBlock(scope: !352, file: !66, line: 265, column: 21)
!372 = !DILocation(line: 265, column: 44, scope: !371)
!373 = !DILocation(line: 265, column: 21, scope: !371)
!374 = !DILocation(line: 265, column: 89, scope: !371)
!375 = !DILocation(line: 265, column: 21, scope: !352)
!376 = !DILocation(line: 267, column: 21, scope: !377)
!377 = distinct !DILexicalBlock(scope: !371, file: !66, line: 266, column: 17)
!378 = !DILocation(line: 271, column: 35, scope: !352)
!379 = !DILocation(line: 271, column: 50, scope: !352)
!380 = !DILocation(line: 271, column: 30, scope: !352)
!381 = !DILocation(line: 271, column: 28, scope: !352)
!382 = !DILocation(line: 272, column: 21, scope: !383)
!383 = distinct !DILexicalBlock(scope: !352, file: !66, line: 272, column: 21)
!384 = !DILocation(line: 272, column: 32, scope: !383)
!385 = !DILocation(line: 272, column: 48, scope: !383)
!386 = !DILocation(line: 272, column: 51, scope: !383)
!387 = !DILocation(line: 272, column: 62, scope: !383)
!388 = !DILocation(line: 272, column: 21, scope: !352)
!389 = !DILocation(line: 274, column: 21, scope: !390)
!390 = distinct !DILexicalBlock(scope: !383, file: !66, line: 273, column: 17)
!391 = !DILocation(line: 277, column: 29, scope: !352)
!392 = !DILocation(line: 277, column: 17, scope: !352)
!393 = !DILocation(line: 277, column: 41, scope: !352)
!394 = !DILocation(line: 279, column: 29, scope: !352)
!395 = !DILocation(line: 279, column: 24, scope: !352)
!396 = !DILocation(line: 279, column: 22, scope: !352)
!397 = !DILocation(line: 280, column: 13, scope: !352)
!398 = !DILocation(line: 282, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !340, file: !66, line: 282, column: 17)
!400 = !DILocation(line: 282, column: 31, scope: !399)
!401 = !DILocation(line: 282, column: 17, scope: !340)
!402 = !DILocation(line: 284, column: 30, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !66, line: 283, column: 13)
!404 = !DILocation(line: 284, column: 17, scope: !403)
!405 = !DILocation(line: 285, column: 13, scope: !403)
!406 = !DILocalVariable(name: "i", scope: !407, file: !66, line: 297, type: !71)
!407 = distinct !DILexicalBlock(scope: !408, file: !66, line: 296, column: 9)
!408 = distinct !DILexicalBlock(scope: !409, file: !66, line: 295, column: 5)
!409 = distinct !DILexicalBlock(scope: !335, file: !66, line: 294, column: 8)
!410 = !DILocation(line: 297, column: 17, scope: !407)
!411 = !DILocalVariable(name: "buffer", scope: !407, file: !66, line: 298, type: !168)
!412 = !DILocation(line: 298, column: 17, scope: !407)
!413 = !DILocation(line: 300, column: 17, scope: !414)
!414 = distinct !DILexicalBlock(scope: !407, file: !66, line: 300, column: 17)
!415 = !DILocation(line: 300, column: 22, scope: !414)
!416 = !DILocation(line: 300, column: 27, scope: !414)
!417 = !DILocation(line: 300, column: 30, scope: !414)
!418 = !DILocation(line: 300, column: 35, scope: !414)
!419 = !DILocation(line: 300, column: 17, scope: !407)
!420 = !DILocation(line: 302, column: 24, scope: !421)
!421 = distinct !DILexicalBlock(scope: !414, file: !66, line: 301, column: 13)
!422 = !DILocation(line: 302, column: 17, scope: !421)
!423 = !DILocation(line: 302, column: 30, scope: !421)
!424 = !DILocation(line: 304, column: 23, scope: !425)
!425 = distinct !DILexicalBlock(scope: !421, file: !66, line: 304, column: 17)
!426 = !DILocation(line: 304, column: 21, scope: !425)
!427 = !DILocation(line: 304, column: 28, scope: !428)
!428 = distinct !DILexicalBlock(scope: !425, file: !66, line: 304, column: 17)
!429 = !DILocation(line: 304, column: 30, scope: !428)
!430 = !DILocation(line: 304, column: 17, scope: !425)
!431 = !DILocation(line: 306, column: 41, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !66, line: 305, column: 17)
!433 = !DILocation(line: 306, column: 34, scope: !432)
!434 = !DILocation(line: 306, column: 21, scope: !432)
!435 = !DILocation(line: 307, column: 17, scope: !432)
!436 = !DILocation(line: 304, column: 37, scope: !428)
!437 = !DILocation(line: 304, column: 17, scope: !428)
!438 = distinct !{!438, !430, !439, !196}
!439 = !DILocation(line: 307, column: 17, scope: !425)
!440 = !DILocation(line: 308, column: 13, scope: !421)
!441 = !DILocation(line: 311, column: 17, scope: !442)
!442 = distinct !DILexicalBlock(scope: !414, file: !66, line: 310, column: 13)
!443 = !DILocation(line: 315, column: 1, scope: !335)
!444 = distinct !DISubprogram(name: "goodG2B1", scope: !66, file: !66, line: 318, type: !67, scopeLine: 319, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!445 = !DILocalVariable(name: "data", scope: !444, file: !66, line: 320, type: !71)
!446 = !DILocation(line: 320, column: 9, scope: !444)
!447 = !DILocation(line: 322, column: 10, scope: !444)
!448 = !DILocation(line: 332, column: 14, scope: !449)
!449 = distinct !DILexicalBlock(scope: !450, file: !66, line: 329, column: 5)
!450 = distinct !DILexicalBlock(scope: !444, file: !66, line: 323, column: 8)
!451 = !DILocalVariable(name: "i", scope: !452, file: !66, line: 337, type: !71)
!452 = distinct !DILexicalBlock(scope: !453, file: !66, line: 336, column: 9)
!453 = distinct !DILexicalBlock(scope: !454, file: !66, line: 335, column: 5)
!454 = distinct !DILexicalBlock(scope: !444, file: !66, line: 334, column: 8)
!455 = !DILocation(line: 337, column: 17, scope: !452)
!456 = !DILocalVariable(name: "buffer", scope: !452, file: !66, line: 338, type: !168)
!457 = !DILocation(line: 338, column: 17, scope: !452)
!458 = !DILocation(line: 341, column: 17, scope: !459)
!459 = distinct !DILexicalBlock(scope: !452, file: !66, line: 341, column: 17)
!460 = !DILocation(line: 341, column: 22, scope: !459)
!461 = !DILocation(line: 341, column: 17, scope: !452)
!462 = !DILocation(line: 343, column: 24, scope: !463)
!463 = distinct !DILexicalBlock(scope: !459, file: !66, line: 342, column: 13)
!464 = !DILocation(line: 343, column: 17, scope: !463)
!465 = !DILocation(line: 343, column: 30, scope: !463)
!466 = !DILocation(line: 345, column: 23, scope: !467)
!467 = distinct !DILexicalBlock(scope: !463, file: !66, line: 345, column: 17)
!468 = !DILocation(line: 345, column: 21, scope: !467)
!469 = !DILocation(line: 345, column: 28, scope: !470)
!470 = distinct !DILexicalBlock(scope: !467, file: !66, line: 345, column: 17)
!471 = !DILocation(line: 345, column: 30, scope: !470)
!472 = !DILocation(line: 345, column: 17, scope: !467)
!473 = !DILocation(line: 347, column: 41, scope: !474)
!474 = distinct !DILexicalBlock(scope: !470, file: !66, line: 346, column: 17)
!475 = !DILocation(line: 347, column: 34, scope: !474)
!476 = !DILocation(line: 347, column: 21, scope: !474)
!477 = !DILocation(line: 348, column: 17, scope: !474)
!478 = !DILocation(line: 345, column: 37, scope: !470)
!479 = !DILocation(line: 345, column: 17, scope: !470)
!480 = distinct !{!480, !472, !481, !196}
!481 = !DILocation(line: 348, column: 17, scope: !467)
!482 = !DILocation(line: 349, column: 13, scope: !463)
!483 = !DILocation(line: 352, column: 17, scope: !484)
!484 = distinct !DILexicalBlock(scope: !459, file: !66, line: 351, column: 13)
!485 = !DILocation(line: 356, column: 1, scope: !444)
!486 = distinct !DISubprogram(name: "goodG2B2", scope: !66, file: !66, line: 359, type: !67, scopeLine: 360, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!487 = !DILocalVariable(name: "data", scope: !486, file: !66, line: 361, type: !71)
!488 = !DILocation(line: 361, column: 9, scope: !486)
!489 = !DILocation(line: 363, column: 10, scope: !486)
!490 = !DILocation(line: 368, column: 14, scope: !491)
!491 = distinct !DILexicalBlock(scope: !492, file: !66, line: 365, column: 5)
!492 = distinct !DILexicalBlock(scope: !486, file: !66, line: 364, column: 8)
!493 = !DILocalVariable(name: "i", scope: !494, file: !66, line: 373, type: !71)
!494 = distinct !DILexicalBlock(scope: !495, file: !66, line: 372, column: 9)
!495 = distinct !DILexicalBlock(scope: !496, file: !66, line: 371, column: 5)
!496 = distinct !DILexicalBlock(scope: !486, file: !66, line: 370, column: 8)
!497 = !DILocation(line: 373, column: 17, scope: !494)
!498 = !DILocalVariable(name: "buffer", scope: !494, file: !66, line: 374, type: !168)
!499 = !DILocation(line: 374, column: 17, scope: !494)
!500 = !DILocation(line: 377, column: 17, scope: !501)
!501 = distinct !DILexicalBlock(scope: !494, file: !66, line: 377, column: 17)
!502 = !DILocation(line: 377, column: 22, scope: !501)
!503 = !DILocation(line: 377, column: 17, scope: !494)
!504 = !DILocation(line: 379, column: 24, scope: !505)
!505 = distinct !DILexicalBlock(scope: !501, file: !66, line: 378, column: 13)
!506 = !DILocation(line: 379, column: 17, scope: !505)
!507 = !DILocation(line: 379, column: 30, scope: !505)
!508 = !DILocation(line: 381, column: 23, scope: !509)
!509 = distinct !DILexicalBlock(scope: !505, file: !66, line: 381, column: 17)
!510 = !DILocation(line: 381, column: 21, scope: !509)
!511 = !DILocation(line: 381, column: 28, scope: !512)
!512 = distinct !DILexicalBlock(scope: !509, file: !66, line: 381, column: 17)
!513 = !DILocation(line: 381, column: 30, scope: !512)
!514 = !DILocation(line: 381, column: 17, scope: !509)
!515 = !DILocation(line: 383, column: 41, scope: !516)
!516 = distinct !DILexicalBlock(scope: !512, file: !66, line: 382, column: 17)
!517 = !DILocation(line: 383, column: 34, scope: !516)
!518 = !DILocation(line: 383, column: 21, scope: !516)
!519 = !DILocation(line: 384, column: 17, scope: !516)
!520 = !DILocation(line: 381, column: 37, scope: !512)
!521 = !DILocation(line: 381, column: 17, scope: !512)
!522 = distinct !{!522, !514, !523, !196}
!523 = !DILocation(line: 384, column: 17, scope: !509)
!524 = !DILocation(line: 385, column: 13, scope: !505)
!525 = !DILocation(line: 388, column: 17, scope: !526)
!526 = distinct !DILexicalBlock(scope: !501, file: !66, line: 387, column: 13)
!527 = !DILocation(line: 392, column: 1, scope: !486)
