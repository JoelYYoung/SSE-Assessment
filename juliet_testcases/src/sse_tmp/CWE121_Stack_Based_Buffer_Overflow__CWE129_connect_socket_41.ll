; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_41_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !74, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !77, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %connectSocket, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  br label %do.body, !dbg !104

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !105
  store i32 %call, i32* %connectSocket, align 4, !dbg !107
  %0 = load i32, i32* %connectSocket, align 4, !dbg !108
  %cmp = icmp eq i32 %0, -1, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !112

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !114
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !115
  store i16 2, i16* %sin_family, align 4, !dbg !116
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !117
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !118
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !119
  store i32 %call1, i32* %s_addr, align 4, !dbg !120
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !121
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !122
  store i16 %call2, i16* %sin_port, align 2, !dbg !123
  %2 = load i32, i32* %connectSocket, align 4, !dbg !124
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !126
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !127
  %cmp4 = icmp eq i32 %call3, -1, !dbg !128
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !129

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !130

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !132
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !133
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !134
  %conv = trunc i64 %call7 to i32, !dbg !134
  store i32 %conv, i32* %recvResult, align 4, !dbg !135
  %5 = load i32, i32* %recvResult, align 4, !dbg !136
  %cmp8 = icmp eq i32 %5, -1, !dbg !138
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !139

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !140
  %cmp10 = icmp eq i32 %6, 0, !dbg !141
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !142

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !143

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !145
  %idxprom = sext i32 %7 to i64, !dbg !146
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !148
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !149
  store i32 %call15, i32* %data, align 4, !dbg !150
  br label %do.end, !dbg !151

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !152
  %cmp16 = icmp ne i32 %8, -1, !dbg !154
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !155

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !156
  %call19 = call i32 @close(i32 %9), !dbg !158
  br label %if.end20, !dbg !159

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !160
  call void @badSink(i32 %10), !dbg !161
  ret void, !dbg !162
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

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !163 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !171, metadata !DIExpression()), !dbg !175
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !175
  %1 = load i32, i32* %data.addr, align 4, !dbg !176
  %cmp = icmp sge i32 %1, 0, !dbg !178
  br i1 %cmp, label %if.then, label %if.else, !dbg !179

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !180
  %idxprom = sext i32 %2 to i64, !dbg !182
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !182
  store i32 1, i32* %arrayidx, align 4, !dbg !183
  store i32 0, i32* %i, align 4, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !187
  %cmp1 = icmp slt i32 %3, 10, !dbg !189
  br i1 %cmp1, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !191
  %idxprom2 = sext i32 %4 to i64, !dbg !193
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !193
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !193
  call void @printIntLine(i32 %5), !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !196
  %inc = add nsw i32 %6, 1, !dbg !196
  store i32 %inc, i32* %i, align 4, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !201

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !202
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !204
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_41_good() #0 !dbg !205 {
entry:
  call void @goodB2G(), !dbg !206
  call void @goodG2B(), !dbg !207
  ret void, !dbg !208
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !209 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !214, metadata !DIExpression()), !dbg !215
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !216, metadata !DIExpression()), !dbg !217
  %call = call i64 @time(i64* null) #7, !dbg !218
  %conv = trunc i64 %call to i32, !dbg !219
  call void @srand(i32 %conv) #7, !dbg !220
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !221
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_41_good(), !dbg !222
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !223
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !224
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_41_bad(), !dbg !225
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !226
  ret i32 0, !dbg !227
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !228 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !229, metadata !DIExpression()), !dbg !230
  store i32 -1, i32* %data, align 4, !dbg !231
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !232, metadata !DIExpression()), !dbg !234
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
  %10 = load i32, i32* %data, align 4, !dbg !297
  call void @goodB2GSink(i32 %10), !dbg !298
  ret void, !dbg !299
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !300 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !301, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.declare(metadata i32* %i, metadata !303, metadata !DIExpression()), !dbg !305
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !306, metadata !DIExpression()), !dbg !307
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !307
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !307
  %1 = load i32, i32* %data.addr, align 4, !dbg !308
  %cmp = icmp sge i32 %1, 0, !dbg !310
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !311

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !312
  %cmp1 = icmp slt i32 %2, 10, !dbg !313
  br i1 %cmp1, label %if.then, label %if.else, !dbg !314

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !315
  %idxprom = sext i32 %3 to i64, !dbg !317
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !317
  store i32 1, i32* %arrayidx, align 4, !dbg !318
  store i32 0, i32* %i, align 4, !dbg !319
  br label %for.cond, !dbg !321

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !322
  %cmp2 = icmp slt i32 %4, 10, !dbg !324
  br i1 %cmp2, label %for.body, label %for.end, !dbg !325

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !326
  %idxprom3 = sext i32 %5 to i64, !dbg !328
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !328
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !328
  call void @printIntLine(i32 %6), !dbg !329
  br label %for.inc, !dbg !330

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !331
  %inc = add nsw i32 %7, 1, !dbg !331
  store i32 %inc, i32* %i, align 4, !dbg !331
  br label %for.cond, !dbg !332, !llvm.loop !333

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !335

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !336
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !338
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !339 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !340, metadata !DIExpression()), !dbg !341
  store i32 -1, i32* %data, align 4, !dbg !342
  store i32 7, i32* %data, align 4, !dbg !343
  %0 = load i32, i32* %data, align 4, !dbg !344
  call void @goodG2BSink(i32 %0), !dbg !345
  ret void, !dbg !346
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !347 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.declare(metadata i32* %i, metadata !350, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !353, metadata !DIExpression()), !dbg !354
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !354
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !354
  %1 = load i32, i32* %data.addr, align 4, !dbg !355
  %cmp = icmp sge i32 %1, 0, !dbg !357
  br i1 %cmp, label %if.then, label %if.else, !dbg !358

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !359
  %idxprom = sext i32 %2 to i64, !dbg !361
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !361
  store i32 1, i32* %arrayidx, align 4, !dbg !362
  store i32 0, i32* %i, align 4, !dbg !363
  br label %for.cond, !dbg !365

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !366
  %cmp1 = icmp slt i32 %3, 10, !dbg !368
  br i1 %cmp1, label %for.body, label %for.end, !dbg !369

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !370
  %idxprom2 = sext i32 %4 to i64, !dbg !372
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !372
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !372
  call void @printIntLine(i32 %5), !dbg !373
  br label %for.inc, !dbg !374

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !375
  %inc = add nsw i32 %6, 1, !dbg !375
  store i32 %inc, i32* %i, align 4, !dbg !375
  br label %for.cond, !dbg !376, !llvm.loop !377

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !379

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !380
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !382
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_41_bad", scope: !66, file: !66, line: 67, type: !67, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_41.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 69, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 69, column: 9, scope: !65)
!73 = !DILocation(line: 71, column: 10, scope: !65)
!74 = !DILocalVariable(name: "recvResult", scope: !75, file: !66, line: 77, type: !71)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 72, column: 5)
!76 = !DILocation(line: 77, column: 13, scope: !75)
!77 = !DILocalVariable(name: "service", scope: !75, file: !66, line: 78, type: !78)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !79)
!79 = !{!80, !81, !87, !94}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !78, file: !17, line: 240, baseType: !51, size: 16)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !78, file: !17, line: 241, baseType: !82, size: 16, offset: 16)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !84, line: 25, baseType: !85)
!84 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !86, line: 40, baseType: !53)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !78, file: !17, line: 242, baseType: !88, size: 32, offset: 32)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !89)
!89 = !{!90}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !88, file: !17, line: 33, baseType: !91, size: 32)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !84, line: 26, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !86, line: 42, baseType: !5)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !78, file: !17, line: 245, baseType: !95, size: 64, offset: 64)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 64, elements: !97)
!96 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!97 = !{!98}
!98 = !DISubrange(count: 8)
!99 = !DILocation(line: 78, column: 28, scope: !75)
!100 = !DILocalVariable(name: "connectSocket", scope: !75, file: !66, line: 79, type: !71)
!101 = !DILocation(line: 79, column: 16, scope: !75)
!102 = !DILocalVariable(name: "inputBuffer", scope: !75, file: !66, line: 80, type: !55)
!103 = !DILocation(line: 80, column: 14, scope: !75)
!104 = !DILocation(line: 81, column: 9, scope: !75)
!105 = !DILocation(line: 91, column: 29, scope: !106)
!106 = distinct !DILexicalBlock(scope: !75, file: !66, line: 82, column: 9)
!107 = !DILocation(line: 91, column: 27, scope: !106)
!108 = !DILocation(line: 92, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !66, line: 92, column: 17)
!110 = !DILocation(line: 92, column: 31, scope: !109)
!111 = !DILocation(line: 92, column: 17, scope: !106)
!112 = !DILocation(line: 94, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !66, line: 93, column: 13)
!114 = !DILocation(line: 96, column: 13, scope: !106)
!115 = !DILocation(line: 97, column: 21, scope: !106)
!116 = !DILocation(line: 97, column: 32, scope: !106)
!117 = !DILocation(line: 98, column: 39, scope: !106)
!118 = !DILocation(line: 98, column: 21, scope: !106)
!119 = !DILocation(line: 98, column: 30, scope: !106)
!120 = !DILocation(line: 98, column: 37, scope: !106)
!121 = !DILocation(line: 99, column: 32, scope: !106)
!122 = !DILocation(line: 99, column: 21, scope: !106)
!123 = !DILocation(line: 99, column: 30, scope: !106)
!124 = !DILocation(line: 100, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !106, file: !66, line: 100, column: 17)
!126 = !DILocation(line: 100, column: 40, scope: !125)
!127 = !DILocation(line: 100, column: 17, scope: !125)
!128 = !DILocation(line: 100, column: 85, scope: !125)
!129 = !DILocation(line: 100, column: 17, scope: !106)
!130 = !DILocation(line: 102, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !66, line: 101, column: 13)
!132 = !DILocation(line: 106, column: 31, scope: !106)
!133 = !DILocation(line: 106, column: 46, scope: !106)
!134 = !DILocation(line: 106, column: 26, scope: !106)
!135 = !DILocation(line: 106, column: 24, scope: !106)
!136 = !DILocation(line: 107, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !106, file: !66, line: 107, column: 17)
!138 = !DILocation(line: 107, column: 28, scope: !137)
!139 = !DILocation(line: 107, column: 44, scope: !137)
!140 = !DILocation(line: 107, column: 47, scope: !137)
!141 = !DILocation(line: 107, column: 58, scope: !137)
!142 = !DILocation(line: 107, column: 17, scope: !106)
!143 = !DILocation(line: 109, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !66, line: 108, column: 13)
!145 = !DILocation(line: 112, column: 25, scope: !106)
!146 = !DILocation(line: 112, column: 13, scope: !106)
!147 = !DILocation(line: 112, column: 37, scope: !106)
!148 = !DILocation(line: 114, column: 25, scope: !106)
!149 = !DILocation(line: 114, column: 20, scope: !106)
!150 = !DILocation(line: 114, column: 18, scope: !106)
!151 = !DILocation(line: 115, column: 9, scope: !106)
!152 = !DILocation(line: 117, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !75, file: !66, line: 117, column: 13)
!154 = !DILocation(line: 117, column: 27, scope: !153)
!155 = !DILocation(line: 117, column: 13, scope: !75)
!156 = !DILocation(line: 119, column: 26, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !66, line: 118, column: 9)
!158 = !DILocation(line: 119, column: 13, scope: !157)
!159 = !DILocation(line: 120, column: 9, scope: !157)
!160 = !DILocation(line: 128, column: 13, scope: !65)
!161 = !DILocation(line: 128, column: 5, scope: !65)
!162 = !DILocation(line: 129, column: 1, scope: !65)
!163 = distinct !DISubprogram(name: "badSink", scope: !66, file: !66, line: 44, type: !164, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!164 = !DISubroutineType(types: !165)
!165 = !{null, !71}
!166 = !DILocalVariable(name: "data", arg: 1, scope: !163, file: !66, line: 44, type: !71)
!167 = !DILocation(line: 44, column: 25, scope: !163)
!168 = !DILocalVariable(name: "i", scope: !169, file: !66, line: 47, type: !71)
!169 = distinct !DILexicalBlock(scope: !163, file: !66, line: 46, column: 5)
!170 = !DILocation(line: 47, column: 13, scope: !169)
!171 = !DILocalVariable(name: "buffer", scope: !169, file: !66, line: 48, type: !172)
!172 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !173)
!173 = !{!174}
!174 = !DISubrange(count: 10)
!175 = !DILocation(line: 48, column: 13, scope: !169)
!176 = !DILocation(line: 51, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !169, file: !66, line: 51, column: 13)
!178 = !DILocation(line: 51, column: 18, scope: !177)
!179 = !DILocation(line: 51, column: 13, scope: !169)
!180 = !DILocation(line: 53, column: 20, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !66, line: 52, column: 9)
!182 = !DILocation(line: 53, column: 13, scope: !181)
!183 = !DILocation(line: 53, column: 26, scope: !181)
!184 = !DILocation(line: 55, column: 19, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !66, line: 55, column: 13)
!186 = !DILocation(line: 55, column: 17, scope: !185)
!187 = !DILocation(line: 55, column: 24, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !66, line: 55, column: 13)
!189 = !DILocation(line: 55, column: 26, scope: !188)
!190 = !DILocation(line: 55, column: 13, scope: !185)
!191 = !DILocation(line: 57, column: 37, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !66, line: 56, column: 13)
!193 = !DILocation(line: 57, column: 30, scope: !192)
!194 = !DILocation(line: 57, column: 17, scope: !192)
!195 = !DILocation(line: 58, column: 13, scope: !192)
!196 = !DILocation(line: 55, column: 33, scope: !188)
!197 = !DILocation(line: 55, column: 13, scope: !188)
!198 = distinct !{!198, !190, !199, !200}
!199 = !DILocation(line: 58, column: 13, scope: !185)
!200 = !{!"llvm.loop.mustprogress"}
!201 = !DILocation(line: 59, column: 9, scope: !181)
!202 = !DILocation(line: 62, column: 13, scope: !203)
!203 = distinct !DILexicalBlock(scope: !177, file: !66, line: 61, column: 9)
!204 = !DILocation(line: 65, column: 1, scope: !163)
!205 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_41_good", scope: !66, file: !66, line: 257, type: !67, scopeLine: 258, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!206 = !DILocation(line: 259, column: 5, scope: !205)
!207 = !DILocation(line: 260, column: 5, scope: !205)
!208 = !DILocation(line: 261, column: 1, scope: !205)
!209 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 272, type: !210, scopeLine: 273, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!210 = !DISubroutineType(types: !211)
!211 = !{!71, !71, !212}
!212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !213, size: 64)
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!214 = !DILocalVariable(name: "argc", arg: 1, scope: !209, file: !66, line: 272, type: !71)
!215 = !DILocation(line: 272, column: 14, scope: !209)
!216 = !DILocalVariable(name: "argv", arg: 2, scope: !209, file: !66, line: 272, type: !212)
!217 = !DILocation(line: 272, column: 27, scope: !209)
!218 = !DILocation(line: 275, column: 22, scope: !209)
!219 = !DILocation(line: 275, column: 12, scope: !209)
!220 = !DILocation(line: 275, column: 5, scope: !209)
!221 = !DILocation(line: 277, column: 5, scope: !209)
!222 = !DILocation(line: 278, column: 5, scope: !209)
!223 = !DILocation(line: 279, column: 5, scope: !209)
!224 = !DILocation(line: 282, column: 5, scope: !209)
!225 = !DILocation(line: 283, column: 5, scope: !209)
!226 = !DILocation(line: 284, column: 5, scope: !209)
!227 = !DILocation(line: 286, column: 5, scope: !209)
!228 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 193, type: !67, scopeLine: 194, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!229 = !DILocalVariable(name: "data", scope: !228, file: !66, line: 195, type: !71)
!230 = !DILocation(line: 195, column: 9, scope: !228)
!231 = !DILocation(line: 197, column: 10, scope: !228)
!232 = !DILocalVariable(name: "recvResult", scope: !233, file: !66, line: 203, type: !71)
!233 = distinct !DILexicalBlock(scope: !228, file: !66, line: 198, column: 5)
!234 = !DILocation(line: 203, column: 13, scope: !233)
!235 = !DILocalVariable(name: "service", scope: !233, file: !66, line: 204, type: !78)
!236 = !DILocation(line: 204, column: 28, scope: !233)
!237 = !DILocalVariable(name: "connectSocket", scope: !233, file: !66, line: 205, type: !71)
!238 = !DILocation(line: 205, column: 16, scope: !233)
!239 = !DILocalVariable(name: "inputBuffer", scope: !233, file: !66, line: 206, type: !55)
!240 = !DILocation(line: 206, column: 14, scope: !233)
!241 = !DILocation(line: 207, column: 9, scope: !233)
!242 = !DILocation(line: 217, column: 29, scope: !243)
!243 = distinct !DILexicalBlock(scope: !233, file: !66, line: 208, column: 9)
!244 = !DILocation(line: 217, column: 27, scope: !243)
!245 = !DILocation(line: 218, column: 17, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !66, line: 218, column: 17)
!247 = !DILocation(line: 218, column: 31, scope: !246)
!248 = !DILocation(line: 218, column: 17, scope: !243)
!249 = !DILocation(line: 220, column: 17, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !66, line: 219, column: 13)
!251 = !DILocation(line: 222, column: 13, scope: !243)
!252 = !DILocation(line: 223, column: 21, scope: !243)
!253 = !DILocation(line: 223, column: 32, scope: !243)
!254 = !DILocation(line: 224, column: 39, scope: !243)
!255 = !DILocation(line: 224, column: 21, scope: !243)
!256 = !DILocation(line: 224, column: 30, scope: !243)
!257 = !DILocation(line: 224, column: 37, scope: !243)
!258 = !DILocation(line: 225, column: 32, scope: !243)
!259 = !DILocation(line: 225, column: 21, scope: !243)
!260 = !DILocation(line: 225, column: 30, scope: !243)
!261 = !DILocation(line: 226, column: 25, scope: !262)
!262 = distinct !DILexicalBlock(scope: !243, file: !66, line: 226, column: 17)
!263 = !DILocation(line: 226, column: 40, scope: !262)
!264 = !DILocation(line: 226, column: 17, scope: !262)
!265 = !DILocation(line: 226, column: 85, scope: !262)
!266 = !DILocation(line: 226, column: 17, scope: !243)
!267 = !DILocation(line: 228, column: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !262, file: !66, line: 227, column: 13)
!269 = !DILocation(line: 232, column: 31, scope: !243)
!270 = !DILocation(line: 232, column: 46, scope: !243)
!271 = !DILocation(line: 232, column: 26, scope: !243)
!272 = !DILocation(line: 232, column: 24, scope: !243)
!273 = !DILocation(line: 233, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !243, file: !66, line: 233, column: 17)
!275 = !DILocation(line: 233, column: 28, scope: !274)
!276 = !DILocation(line: 233, column: 44, scope: !274)
!277 = !DILocation(line: 233, column: 47, scope: !274)
!278 = !DILocation(line: 233, column: 58, scope: !274)
!279 = !DILocation(line: 233, column: 17, scope: !243)
!280 = !DILocation(line: 235, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !274, file: !66, line: 234, column: 13)
!282 = !DILocation(line: 238, column: 25, scope: !243)
!283 = !DILocation(line: 238, column: 13, scope: !243)
!284 = !DILocation(line: 238, column: 37, scope: !243)
!285 = !DILocation(line: 240, column: 25, scope: !243)
!286 = !DILocation(line: 240, column: 20, scope: !243)
!287 = !DILocation(line: 240, column: 18, scope: !243)
!288 = !DILocation(line: 241, column: 9, scope: !243)
!289 = !DILocation(line: 243, column: 13, scope: !290)
!290 = distinct !DILexicalBlock(scope: !233, file: !66, line: 243, column: 13)
!291 = !DILocation(line: 243, column: 27, scope: !290)
!292 = !DILocation(line: 243, column: 13, scope: !233)
!293 = !DILocation(line: 245, column: 26, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !66, line: 244, column: 9)
!295 = !DILocation(line: 245, column: 13, scope: !294)
!296 = !DILocation(line: 246, column: 9, scope: !294)
!297 = !DILocation(line: 254, column: 17, scope: !228)
!298 = !DILocation(line: 254, column: 5, scope: !228)
!299 = !DILocation(line: 255, column: 1, scope: !228)
!300 = distinct !DISubprogram(name: "goodB2GSink", scope: !66, file: !66, line: 171, type: !164, scopeLine: 172, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!301 = !DILocalVariable(name: "data", arg: 1, scope: !300, file: !66, line: 171, type: !71)
!302 = !DILocation(line: 171, column: 29, scope: !300)
!303 = !DILocalVariable(name: "i", scope: !304, file: !66, line: 174, type: !71)
!304 = distinct !DILexicalBlock(scope: !300, file: !66, line: 173, column: 5)
!305 = !DILocation(line: 174, column: 13, scope: !304)
!306 = !DILocalVariable(name: "buffer", scope: !304, file: !66, line: 175, type: !172)
!307 = !DILocation(line: 175, column: 13, scope: !304)
!308 = !DILocation(line: 177, column: 13, scope: !309)
!309 = distinct !DILexicalBlock(scope: !304, file: !66, line: 177, column: 13)
!310 = !DILocation(line: 177, column: 18, scope: !309)
!311 = !DILocation(line: 177, column: 23, scope: !309)
!312 = !DILocation(line: 177, column: 26, scope: !309)
!313 = !DILocation(line: 177, column: 31, scope: !309)
!314 = !DILocation(line: 177, column: 13, scope: !304)
!315 = !DILocation(line: 179, column: 20, scope: !316)
!316 = distinct !DILexicalBlock(scope: !309, file: !66, line: 178, column: 9)
!317 = !DILocation(line: 179, column: 13, scope: !316)
!318 = !DILocation(line: 179, column: 26, scope: !316)
!319 = !DILocation(line: 181, column: 19, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !66, line: 181, column: 13)
!321 = !DILocation(line: 181, column: 17, scope: !320)
!322 = !DILocation(line: 181, column: 24, scope: !323)
!323 = distinct !DILexicalBlock(scope: !320, file: !66, line: 181, column: 13)
!324 = !DILocation(line: 181, column: 26, scope: !323)
!325 = !DILocation(line: 181, column: 13, scope: !320)
!326 = !DILocation(line: 183, column: 37, scope: !327)
!327 = distinct !DILexicalBlock(scope: !323, file: !66, line: 182, column: 13)
!328 = !DILocation(line: 183, column: 30, scope: !327)
!329 = !DILocation(line: 183, column: 17, scope: !327)
!330 = !DILocation(line: 184, column: 13, scope: !327)
!331 = !DILocation(line: 181, column: 33, scope: !323)
!332 = !DILocation(line: 181, column: 13, scope: !323)
!333 = distinct !{!333, !325, !334, !200}
!334 = !DILocation(line: 184, column: 13, scope: !320)
!335 = !DILocation(line: 185, column: 9, scope: !316)
!336 = !DILocation(line: 188, column: 13, scope: !337)
!337 = distinct !DILexicalBlock(scope: !309, file: !66, line: 187, column: 9)
!338 = !DILocation(line: 191, column: 1, scope: !300)
!339 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 159, type: !67, scopeLine: 160, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!340 = !DILocalVariable(name: "data", scope: !339, file: !66, line: 161, type: !71)
!341 = !DILocation(line: 161, column: 9, scope: !339)
!342 = !DILocation(line: 163, column: 10, scope: !339)
!343 = !DILocation(line: 166, column: 10, scope: !339)
!344 = !DILocation(line: 167, column: 17, scope: !339)
!345 = !DILocation(line: 167, column: 5, scope: !339)
!346 = !DILocation(line: 168, column: 1, scope: !339)
!347 = distinct !DISubprogram(name: "goodG2BSink", scope: !66, file: !66, line: 136, type: !164, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!348 = !DILocalVariable(name: "data", arg: 1, scope: !347, file: !66, line: 136, type: !71)
!349 = !DILocation(line: 136, column: 29, scope: !347)
!350 = !DILocalVariable(name: "i", scope: !351, file: !66, line: 139, type: !71)
!351 = distinct !DILexicalBlock(scope: !347, file: !66, line: 138, column: 5)
!352 = !DILocation(line: 139, column: 13, scope: !351)
!353 = !DILocalVariable(name: "buffer", scope: !351, file: !66, line: 140, type: !172)
!354 = !DILocation(line: 140, column: 13, scope: !351)
!355 = !DILocation(line: 143, column: 13, scope: !356)
!356 = distinct !DILexicalBlock(scope: !351, file: !66, line: 143, column: 13)
!357 = !DILocation(line: 143, column: 18, scope: !356)
!358 = !DILocation(line: 143, column: 13, scope: !351)
!359 = !DILocation(line: 145, column: 20, scope: !360)
!360 = distinct !DILexicalBlock(scope: !356, file: !66, line: 144, column: 9)
!361 = !DILocation(line: 145, column: 13, scope: !360)
!362 = !DILocation(line: 145, column: 26, scope: !360)
!363 = !DILocation(line: 147, column: 19, scope: !364)
!364 = distinct !DILexicalBlock(scope: !360, file: !66, line: 147, column: 13)
!365 = !DILocation(line: 147, column: 17, scope: !364)
!366 = !DILocation(line: 147, column: 24, scope: !367)
!367 = distinct !DILexicalBlock(scope: !364, file: !66, line: 147, column: 13)
!368 = !DILocation(line: 147, column: 26, scope: !367)
!369 = !DILocation(line: 147, column: 13, scope: !364)
!370 = !DILocation(line: 149, column: 37, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !66, line: 148, column: 13)
!372 = !DILocation(line: 149, column: 30, scope: !371)
!373 = !DILocation(line: 149, column: 17, scope: !371)
!374 = !DILocation(line: 150, column: 13, scope: !371)
!375 = !DILocation(line: 147, column: 33, scope: !367)
!376 = !DILocation(line: 147, column: 13, scope: !367)
!377 = distinct !{!377, !369, !378, !200}
!378 = !DILocation(line: 150, column: 13, scope: !364)
!379 = !DILocation(line: 151, column: 9, scope: !360)
!380 = !DILocation(line: 154, column: 13, scope: !381)
!381 = distinct !DILexicalBlock(scope: !356, file: !66, line: 153, column: 9)
!382 = !DILocation(line: 157, column: 1, scope: !347)
