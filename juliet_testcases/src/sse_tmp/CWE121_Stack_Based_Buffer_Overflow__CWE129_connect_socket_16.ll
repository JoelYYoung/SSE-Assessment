; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_16.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_16_bad() #0 !dbg !65 {
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
  br label %while.body, !dbg !74

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !75, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !79, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %connectSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  br label %do.body, !dbg !106

do.body:                                          ; preds = %while.body
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
  br label %while.end, !dbg !162

while.end:                                        ; preds = %if.end20
  br label %while.body21, !dbg !163

while.body21:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !164, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !168, metadata !DIExpression()), !dbg !172
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !172
  %11 = load i32, i32* %data, align 4, !dbg !173
  %cmp22 = icmp sge i32 %11, 0, !dbg !175
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !176

if.then24:                                        ; preds = %while.body21
  %12 = load i32, i32* %data, align 4, !dbg !177
  %idxprom25 = sext i32 %12 to i64, !dbg !179
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !179
  store i32 1, i32* %arrayidx26, align 4, !dbg !180
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.then24
  %13 = load i32, i32* %i, align 4, !dbg !184
  %cmp27 = icmp slt i32 %13, 10, !dbg !186
  br i1 %cmp27, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %14 = load i32, i32* %i, align 4, !dbg !188
  %idxprom29 = sext i32 %14 to i64, !dbg !190
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !190
  %15 = load i32, i32* %arrayidx30, align 4, !dbg !190
  call void @printIntLine(i32 %15), !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !193
  %inc = add nsw i32 %16, 1, !dbg !193
  store i32 %inc, i32* %i, align 4, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  br label %if.end31, !dbg !198

if.else:                                          ; preds = %while.body21
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !199
  br label %if.end31

if.end31:                                         ; preds = %if.else, %for.end
  br label %while.end32, !dbg !201

while.end32:                                      ; preds = %if.end31
  ret void, !dbg !202
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_16_good() #0 !dbg !203 {
entry:
  call void @goodB2G(), !dbg !204
  call void @goodG2B(), !dbg !205
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_16_good(), !dbg !220
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !221
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !222
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_16_bad(), !dbg !223
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !224
  ret i32 0, !dbg !225
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !226 {
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
  br label %while.body, !dbg !230

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !231, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 -1, i32* %connectSocket, align 4, !dbg !238
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !239, metadata !DIExpression()), !dbg !240
  br label %do.body, !dbg !241

do.body:                                          ; preds = %while.body
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
  br label %while.end, !dbg !297

while.end:                                        ; preds = %if.end20
  br label %while.body21, !dbg !298

while.body21:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !299, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !303, metadata !DIExpression()), !dbg !304
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !304
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !304
  %11 = load i32, i32* %data, align 4, !dbg !305
  %cmp22 = icmp sge i32 %11, 0, !dbg !307
  br i1 %cmp22, label %land.lhs.true, label %if.else, !dbg !308

land.lhs.true:                                    ; preds = %while.body21
  %12 = load i32, i32* %data, align 4, !dbg !309
  %cmp24 = icmp slt i32 %12, 10, !dbg !310
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !311

if.then26:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !312
  %idxprom27 = sext i32 %13 to i64, !dbg !314
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !314
  store i32 1, i32* %arrayidx28, align 4, !dbg !315
  store i32 0, i32* %i, align 4, !dbg !316
  br label %for.cond, !dbg !318

for.cond:                                         ; preds = %for.inc, %if.then26
  %14 = load i32, i32* %i, align 4, !dbg !319
  %cmp29 = icmp slt i32 %14, 10, !dbg !321
  br i1 %cmp29, label %for.body, label %for.end, !dbg !322

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !323
  %idxprom31 = sext i32 %15 to i64, !dbg !325
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom31, !dbg !325
  %16 = load i32, i32* %arrayidx32, align 4, !dbg !325
  call void @printIntLine(i32 %16), !dbg !326
  br label %for.inc, !dbg !327

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !328
  %inc = add nsw i32 %17, 1, !dbg !328
  store i32 %inc, i32* %i, align 4, !dbg !328
  br label %for.cond, !dbg !329, !llvm.loop !330

for.end:                                          ; preds = %for.cond
  br label %if.end33, !dbg !332

if.else:                                          ; preds = %land.lhs.true, %while.body21
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !333
  br label %if.end33

if.end33:                                         ; preds = %if.else, %for.end
  br label %while.end34, !dbg !335

while.end34:                                      ; preds = %if.end33
  ret void, !dbg !336
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !337 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !338, metadata !DIExpression()), !dbg !339
  store i32 -1, i32* %data, align 4, !dbg !340
  br label %while.body, !dbg !341

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !342
  br label %while.end, !dbg !344

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !345

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !346, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !350, metadata !DIExpression()), !dbg !351
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !351
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !351
  %1 = load i32, i32* %data, align 4, !dbg !352
  %cmp = icmp sge i32 %1, 0, !dbg !354
  br i1 %cmp, label %if.then, label %if.else, !dbg !355

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !356
  %idxprom = sext i32 %2 to i64, !dbg !358
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !358
  store i32 1, i32* %arrayidx, align 4, !dbg !359
  store i32 0, i32* %i, align 4, !dbg !360
  br label %for.cond, !dbg !362

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !363
  %cmp2 = icmp slt i32 %3, 10, !dbg !365
  br i1 %cmp2, label %for.body, label %for.end, !dbg !366

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !367
  %idxprom3 = sext i32 %4 to i64, !dbg !369
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !369
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !369
  call void @printIntLine(i32 %5), !dbg !370
  br label %for.inc, !dbg !371

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !372
  %inc = add nsw i32 %6, 1, !dbg !372
  store i32 %inc, i32* %i, align 4, !dbg !372
  br label %for.cond, !dbg !373, !llvm.loop !374

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !376

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !377
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end5, !dbg !379

while.end5:                                       ; preds = %if.end
  ret void, !dbg !380
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 178, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 180, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 181, baseType: !55, size: 112, offset: 16)
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
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_16_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_16.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocation(line: 49, column: 5, scope: !65)
!75 = !DILocalVariable(name: "recvResult", scope: !76, file: !66, line: 56, type: !71)
!76 = distinct !DILexicalBlock(scope: !77, file: !66, line: 51, column: 9)
!77 = distinct !DILexicalBlock(scope: !65, file: !66, line: 50, column: 5)
!78 = !DILocation(line: 56, column: 17, scope: !76)
!79 = !DILocalVariable(name: "service", scope: !76, file: !66, line: 57, type: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !81)
!81 = !{!82, !83, !89, !96}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !80, file: !17, line: 240, baseType: !51, size: 16)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !80, file: !17, line: 241, baseType: !84, size: 16, offset: 16)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !86, line: 25, baseType: !87)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !88, line: 40, baseType: !53)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !80, file: !17, line: 242, baseType: !90, size: 32, offset: 32)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !91)
!91 = !{!92}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !90, file: !17, line: 33, baseType: !93, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !86, line: 26, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !88, line: 42, baseType: !5)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !80, file: !17, line: 245, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 57, column: 32, scope: !76)
!102 = !DILocalVariable(name: "connectSocket", scope: !76, file: !66, line: 58, type: !71)
!103 = !DILocation(line: 58, column: 20, scope: !76)
!104 = !DILocalVariable(name: "inputBuffer", scope: !76, file: !66, line: 59, type: !55)
!105 = !DILocation(line: 59, column: 18, scope: !76)
!106 = !DILocation(line: 60, column: 13, scope: !76)
!107 = !DILocation(line: 70, column: 33, scope: !108)
!108 = distinct !DILexicalBlock(scope: !76, file: !66, line: 61, column: 13)
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
!155 = distinct !DILexicalBlock(scope: !76, file: !66, line: 96, column: 17)
!156 = !DILocation(line: 96, column: 31, scope: !155)
!157 = !DILocation(line: 96, column: 17, scope: !76)
!158 = !DILocation(line: 98, column: 30, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !66, line: 97, column: 13)
!160 = !DILocation(line: 98, column: 17, scope: !159)
!161 = !DILocation(line: 99, column: 13, scope: !159)
!162 = !DILocation(line: 107, column: 9, scope: !77)
!163 = !DILocation(line: 109, column: 5, scope: !65)
!164 = !DILocalVariable(name: "i", scope: !165, file: !66, line: 112, type: !71)
!165 = distinct !DILexicalBlock(scope: !166, file: !66, line: 111, column: 9)
!166 = distinct !DILexicalBlock(scope: !65, file: !66, line: 110, column: 5)
!167 = !DILocation(line: 112, column: 17, scope: !165)
!168 = !DILocalVariable(name: "buffer", scope: !165, file: !66, line: 113, type: !169)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 10)
!172 = !DILocation(line: 113, column: 17, scope: !165)
!173 = !DILocation(line: 116, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !165, file: !66, line: 116, column: 17)
!175 = !DILocation(line: 116, column: 22, scope: !174)
!176 = !DILocation(line: 116, column: 17, scope: !165)
!177 = !DILocation(line: 118, column: 24, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !66, line: 117, column: 13)
!179 = !DILocation(line: 118, column: 17, scope: !178)
!180 = !DILocation(line: 118, column: 30, scope: !178)
!181 = !DILocation(line: 120, column: 23, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !66, line: 120, column: 17)
!183 = !DILocation(line: 120, column: 21, scope: !182)
!184 = !DILocation(line: 120, column: 28, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !66, line: 120, column: 17)
!186 = !DILocation(line: 120, column: 30, scope: !185)
!187 = !DILocation(line: 120, column: 17, scope: !182)
!188 = !DILocation(line: 122, column: 41, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !66, line: 121, column: 17)
!190 = !DILocation(line: 122, column: 34, scope: !189)
!191 = !DILocation(line: 122, column: 21, scope: !189)
!192 = !DILocation(line: 123, column: 17, scope: !189)
!193 = !DILocation(line: 120, column: 37, scope: !185)
!194 = !DILocation(line: 120, column: 17, scope: !185)
!195 = distinct !{!195, !187, !196, !197}
!196 = !DILocation(line: 123, column: 17, scope: !182)
!197 = !{!"llvm.loop.mustprogress"}
!198 = !DILocation(line: 124, column: 13, scope: !178)
!199 = !DILocation(line: 127, column: 17, scope: !200)
!200 = distinct !DILexicalBlock(scope: !174, file: !66, line: 126, column: 13)
!201 = !DILocation(line: 130, column: 9, scope: !166)
!202 = !DILocation(line: 132, column: 1, scope: !65)
!203 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_16_good", scope: !66, file: !66, line: 266, type: !67, scopeLine: 267, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!204 = !DILocation(line: 268, column: 5, scope: !203)
!205 = !DILocation(line: 269, column: 5, scope: !203)
!206 = !DILocation(line: 270, column: 1, scope: !203)
!207 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 281, type: !208, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!208 = !DISubroutineType(types: !209)
!209 = !{!71, !71, !210}
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!212 = !DILocalVariable(name: "argc", arg: 1, scope: !207, file: !66, line: 281, type: !71)
!213 = !DILocation(line: 281, column: 14, scope: !207)
!214 = !DILocalVariable(name: "argv", arg: 2, scope: !207, file: !66, line: 281, type: !210)
!215 = !DILocation(line: 281, column: 27, scope: !207)
!216 = !DILocation(line: 284, column: 22, scope: !207)
!217 = !DILocation(line: 284, column: 12, scope: !207)
!218 = !DILocation(line: 284, column: 5, scope: !207)
!219 = !DILocation(line: 286, column: 5, scope: !207)
!220 = !DILocation(line: 287, column: 5, scope: !207)
!221 = !DILocation(line: 288, column: 5, scope: !207)
!222 = !DILocation(line: 291, column: 5, scope: !207)
!223 = !DILocation(line: 292, column: 5, scope: !207)
!224 = !DILocation(line: 293, column: 5, scope: !207)
!225 = !DILocation(line: 295, column: 5, scope: !207)
!226 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 139, type: !67, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!227 = !DILocalVariable(name: "data", scope: !226, file: !66, line: 141, type: !71)
!228 = !DILocation(line: 141, column: 9, scope: !226)
!229 = !DILocation(line: 143, column: 10, scope: !226)
!230 = !DILocation(line: 144, column: 5, scope: !226)
!231 = !DILocalVariable(name: "recvResult", scope: !232, file: !66, line: 151, type: !71)
!232 = distinct !DILexicalBlock(scope: !233, file: !66, line: 146, column: 9)
!233 = distinct !DILexicalBlock(scope: !226, file: !66, line: 145, column: 5)
!234 = !DILocation(line: 151, column: 17, scope: !232)
!235 = !DILocalVariable(name: "service", scope: !232, file: !66, line: 152, type: !80)
!236 = !DILocation(line: 152, column: 32, scope: !232)
!237 = !DILocalVariable(name: "connectSocket", scope: !232, file: !66, line: 153, type: !71)
!238 = !DILocation(line: 153, column: 20, scope: !232)
!239 = !DILocalVariable(name: "inputBuffer", scope: !232, file: !66, line: 154, type: !55)
!240 = !DILocation(line: 154, column: 18, scope: !232)
!241 = !DILocation(line: 155, column: 13, scope: !232)
!242 = !DILocation(line: 165, column: 33, scope: !243)
!243 = distinct !DILexicalBlock(scope: !232, file: !66, line: 156, column: 13)
!244 = !DILocation(line: 165, column: 31, scope: !243)
!245 = !DILocation(line: 166, column: 21, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !66, line: 166, column: 21)
!247 = !DILocation(line: 166, column: 35, scope: !246)
!248 = !DILocation(line: 166, column: 21, scope: !243)
!249 = !DILocation(line: 168, column: 21, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !66, line: 167, column: 17)
!251 = !DILocation(line: 170, column: 17, scope: !243)
!252 = !DILocation(line: 171, column: 25, scope: !243)
!253 = !DILocation(line: 171, column: 36, scope: !243)
!254 = !DILocation(line: 172, column: 43, scope: !243)
!255 = !DILocation(line: 172, column: 25, scope: !243)
!256 = !DILocation(line: 172, column: 34, scope: !243)
!257 = !DILocation(line: 172, column: 41, scope: !243)
!258 = !DILocation(line: 173, column: 36, scope: !243)
!259 = !DILocation(line: 173, column: 25, scope: !243)
!260 = !DILocation(line: 173, column: 34, scope: !243)
!261 = !DILocation(line: 174, column: 29, scope: !262)
!262 = distinct !DILexicalBlock(scope: !243, file: !66, line: 174, column: 21)
!263 = !DILocation(line: 174, column: 44, scope: !262)
!264 = !DILocation(line: 174, column: 21, scope: !262)
!265 = !DILocation(line: 174, column: 89, scope: !262)
!266 = !DILocation(line: 174, column: 21, scope: !243)
!267 = !DILocation(line: 176, column: 21, scope: !268)
!268 = distinct !DILexicalBlock(scope: !262, file: !66, line: 175, column: 17)
!269 = !DILocation(line: 180, column: 35, scope: !243)
!270 = !DILocation(line: 180, column: 50, scope: !243)
!271 = !DILocation(line: 180, column: 30, scope: !243)
!272 = !DILocation(line: 180, column: 28, scope: !243)
!273 = !DILocation(line: 181, column: 21, scope: !274)
!274 = distinct !DILexicalBlock(scope: !243, file: !66, line: 181, column: 21)
!275 = !DILocation(line: 181, column: 32, scope: !274)
!276 = !DILocation(line: 181, column: 48, scope: !274)
!277 = !DILocation(line: 181, column: 51, scope: !274)
!278 = !DILocation(line: 181, column: 62, scope: !274)
!279 = !DILocation(line: 181, column: 21, scope: !243)
!280 = !DILocation(line: 183, column: 21, scope: !281)
!281 = distinct !DILexicalBlock(scope: !274, file: !66, line: 182, column: 17)
!282 = !DILocation(line: 186, column: 29, scope: !243)
!283 = !DILocation(line: 186, column: 17, scope: !243)
!284 = !DILocation(line: 186, column: 41, scope: !243)
!285 = !DILocation(line: 188, column: 29, scope: !243)
!286 = !DILocation(line: 188, column: 24, scope: !243)
!287 = !DILocation(line: 188, column: 22, scope: !243)
!288 = !DILocation(line: 189, column: 13, scope: !243)
!289 = !DILocation(line: 191, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !232, file: !66, line: 191, column: 17)
!291 = !DILocation(line: 191, column: 31, scope: !290)
!292 = !DILocation(line: 191, column: 17, scope: !232)
!293 = !DILocation(line: 193, column: 30, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !66, line: 192, column: 13)
!295 = !DILocation(line: 193, column: 17, scope: !294)
!296 = !DILocation(line: 194, column: 13, scope: !294)
!297 = !DILocation(line: 202, column: 9, scope: !233)
!298 = !DILocation(line: 204, column: 5, scope: !226)
!299 = !DILocalVariable(name: "i", scope: !300, file: !66, line: 207, type: !71)
!300 = distinct !DILexicalBlock(scope: !301, file: !66, line: 206, column: 9)
!301 = distinct !DILexicalBlock(scope: !226, file: !66, line: 205, column: 5)
!302 = !DILocation(line: 207, column: 17, scope: !300)
!303 = !DILocalVariable(name: "buffer", scope: !300, file: !66, line: 208, type: !169)
!304 = !DILocation(line: 208, column: 17, scope: !300)
!305 = !DILocation(line: 210, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !300, file: !66, line: 210, column: 17)
!307 = !DILocation(line: 210, column: 22, scope: !306)
!308 = !DILocation(line: 210, column: 27, scope: !306)
!309 = !DILocation(line: 210, column: 30, scope: !306)
!310 = !DILocation(line: 210, column: 35, scope: !306)
!311 = !DILocation(line: 210, column: 17, scope: !300)
!312 = !DILocation(line: 212, column: 24, scope: !313)
!313 = distinct !DILexicalBlock(scope: !306, file: !66, line: 211, column: 13)
!314 = !DILocation(line: 212, column: 17, scope: !313)
!315 = !DILocation(line: 212, column: 30, scope: !313)
!316 = !DILocation(line: 214, column: 23, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !66, line: 214, column: 17)
!318 = !DILocation(line: 214, column: 21, scope: !317)
!319 = !DILocation(line: 214, column: 28, scope: !320)
!320 = distinct !DILexicalBlock(scope: !317, file: !66, line: 214, column: 17)
!321 = !DILocation(line: 214, column: 30, scope: !320)
!322 = !DILocation(line: 214, column: 17, scope: !317)
!323 = !DILocation(line: 216, column: 41, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !66, line: 215, column: 17)
!325 = !DILocation(line: 216, column: 34, scope: !324)
!326 = !DILocation(line: 216, column: 21, scope: !324)
!327 = !DILocation(line: 217, column: 17, scope: !324)
!328 = !DILocation(line: 214, column: 37, scope: !320)
!329 = !DILocation(line: 214, column: 17, scope: !320)
!330 = distinct !{!330, !322, !331, !197}
!331 = !DILocation(line: 217, column: 17, scope: !317)
!332 = !DILocation(line: 218, column: 13, scope: !313)
!333 = !DILocation(line: 221, column: 17, scope: !334)
!334 = distinct !DILexicalBlock(scope: !306, file: !66, line: 220, column: 13)
!335 = !DILocation(line: 224, column: 9, scope: !301)
!336 = !DILocation(line: 226, column: 1, scope: !226)
!337 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 229, type: !67, scopeLine: 230, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!338 = !DILocalVariable(name: "data", scope: !337, file: !66, line: 231, type: !71)
!339 = !DILocation(line: 231, column: 9, scope: !337)
!340 = !DILocation(line: 233, column: 10, scope: !337)
!341 = !DILocation(line: 234, column: 5, scope: !337)
!342 = !DILocation(line: 238, column: 14, scope: !343)
!343 = distinct !DILexicalBlock(scope: !337, file: !66, line: 235, column: 5)
!344 = !DILocation(line: 239, column: 9, scope: !343)
!345 = !DILocation(line: 241, column: 5, scope: !337)
!346 = !DILocalVariable(name: "i", scope: !347, file: !66, line: 244, type: !71)
!347 = distinct !DILexicalBlock(scope: !348, file: !66, line: 243, column: 9)
!348 = distinct !DILexicalBlock(scope: !337, file: !66, line: 242, column: 5)
!349 = !DILocation(line: 244, column: 17, scope: !347)
!350 = !DILocalVariable(name: "buffer", scope: !347, file: !66, line: 245, type: !169)
!351 = !DILocation(line: 245, column: 17, scope: !347)
!352 = !DILocation(line: 248, column: 17, scope: !353)
!353 = distinct !DILexicalBlock(scope: !347, file: !66, line: 248, column: 17)
!354 = !DILocation(line: 248, column: 22, scope: !353)
!355 = !DILocation(line: 248, column: 17, scope: !347)
!356 = !DILocation(line: 250, column: 24, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !66, line: 249, column: 13)
!358 = !DILocation(line: 250, column: 17, scope: !357)
!359 = !DILocation(line: 250, column: 30, scope: !357)
!360 = !DILocation(line: 252, column: 23, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !66, line: 252, column: 17)
!362 = !DILocation(line: 252, column: 21, scope: !361)
!363 = !DILocation(line: 252, column: 28, scope: !364)
!364 = distinct !DILexicalBlock(scope: !361, file: !66, line: 252, column: 17)
!365 = !DILocation(line: 252, column: 30, scope: !364)
!366 = !DILocation(line: 252, column: 17, scope: !361)
!367 = !DILocation(line: 254, column: 41, scope: !368)
!368 = distinct !DILexicalBlock(scope: !364, file: !66, line: 253, column: 17)
!369 = !DILocation(line: 254, column: 34, scope: !368)
!370 = !DILocation(line: 254, column: 21, scope: !368)
!371 = !DILocation(line: 255, column: 17, scope: !368)
!372 = !DILocation(line: 252, column: 37, scope: !364)
!373 = !DILocation(line: 252, column: 17, scope: !364)
!374 = distinct !{!374, !366, !375, !197}
!375 = !DILocation(line: 255, column: 17, scope: !361)
!376 = !DILocation(line: 256, column: 13, scope: !357)
!377 = !DILocation(line: 259, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !353, file: !66, line: 258, column: 13)
!379 = !DILocation(line: 262, column: 9, scope: !348)
!380 = !DILocation(line: 264, column: 1, scope: !337)
