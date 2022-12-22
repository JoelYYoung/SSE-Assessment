; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_42.c"
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
@.str.5 = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_42_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  %0 = load i32, i32* %data, align 4, !dbg !74
  %call = call i32 @badSource(i32 %0), !dbg !75
  store i32 %call, i32* %data, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %i, metadata !77, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !80, metadata !DIExpression()), !dbg !84
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !84
  %2 = load i32, i32* %data, align 4, !dbg !85
  %cmp = icmp sge i32 %2, 0, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !89
  %idxprom = sext i32 %3 to i64, !dbg !91
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !91
  store i32 1, i32* %arrayidx, align 4, !dbg !92
  store i32 0, i32* %i, align 4, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !96
  %cmp1 = icmp slt i32 %4, 10, !dbg !98
  br i1 %cmp1, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !100
  %idxprom2 = sext i32 %5 to i64, !dbg !102
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !102
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !102
  call void @printIntLine(i32 %6), !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !105
  %inc = add nsw i32 %7, 1, !dbg !105
  store i32 %inc, i32* %i, align 4, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !110

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !111
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !113
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !114 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !122, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !145, metadata !DIExpression()), !dbg !146
  store i32 -1, i32* %connectSocket, align 4, !dbg !146
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  br label %do.body, !dbg !149

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !150
  store i32 %call, i32* %connectSocket, align 4, !dbg !152
  %0 = load i32, i32* %connectSocket, align 4, !dbg !153
  %cmp = icmp eq i32 %0, -1, !dbg !155
  br i1 %cmp, label %if.then, label %if.end, !dbg !156

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !157

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !159
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !160
  store i16 2, i16* %sin_family, align 4, !dbg !161
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0)) #7, !dbg !162
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !163
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !164
  store i32 %call1, i32* %s_addr, align 4, !dbg !165
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !166
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !167
  store i16 %call2, i16* %sin_port, align 2, !dbg !168
  %2 = load i32, i32* %connectSocket, align 4, !dbg !169
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !171
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !172
  %cmp4 = icmp eq i32 %call3, -1, !dbg !173
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !174

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !175

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !177
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !178
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !179
  %conv = trunc i64 %call7 to i32, !dbg !179
  store i32 %conv, i32* %recvResult, align 4, !dbg !180
  %5 = load i32, i32* %recvResult, align 4, !dbg !181
  %cmp8 = icmp eq i32 %5, -1, !dbg !183
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !184

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !185
  %cmp10 = icmp eq i32 %6, 0, !dbg !186
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !187

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !188

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !190
  %idxprom = sext i32 %7 to i64, !dbg !191
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !191
  store i8 0, i8* %arrayidx, align 1, !dbg !192
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !193
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !194
  store i32 %call15, i32* %data.addr, align 4, !dbg !195
  br label %do.end, !dbg !196

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !197
  %cmp16 = icmp ne i32 %8, -1, !dbg !199
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !200

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !201
  %call19 = call i32 @close(i32 %9), !dbg !203
  br label %if.end20, !dbg !204

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data.addr, align 4, !dbg !205
  ret i32 %10, !dbg !206
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_42_good() #0 !dbg !207 {
entry:
  call void @goodB2G(), !dbg !208
  call void @goodG2B(), !dbg !209
  ret void, !dbg !210
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !211 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !216, metadata !DIExpression()), !dbg !217
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !218, metadata !DIExpression()), !dbg !219
  %call = call i64 @time(i64* null) #7, !dbg !220
  %conv = trunc i64 %call to i32, !dbg !221
  call void @srand(i32 %conv) #7, !dbg !222
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !223
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_42_good(), !dbg !224
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !225
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !226
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_42_bad(), !dbg !227
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !228
  ret i32 0, !dbg !229
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #4

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #4

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #5

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #3

declare dso_local i64 @recv(i32, i8*, i64, i32) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !230 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !231, metadata !DIExpression()), !dbg !232
  store i32 -1, i32* %data, align 4, !dbg !233
  %0 = load i32, i32* %data, align 4, !dbg !234
  %call = call i32 @goodB2GSource(i32 %0), !dbg !235
  store i32 %call, i32* %data, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata i32* %i, metadata !237, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !240, metadata !DIExpression()), !dbg !241
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !241
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !241
  %2 = load i32, i32* %data, align 4, !dbg !242
  %cmp = icmp sge i32 %2, 0, !dbg !244
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !245

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !246
  %cmp1 = icmp slt i32 %3, 10, !dbg !247
  br i1 %cmp1, label %if.then, label %if.else, !dbg !248

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !249
  %idxprom = sext i32 %4 to i64, !dbg !251
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !251
  store i32 1, i32* %arrayidx, align 4, !dbg !252
  store i32 0, i32* %i, align 4, !dbg !253
  br label %for.cond, !dbg !255

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !256
  %cmp2 = icmp slt i32 %5, 10, !dbg !258
  br i1 %cmp2, label %for.body, label %for.end, !dbg !259

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !260
  %idxprom3 = sext i32 %6 to i64, !dbg !262
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !262
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !262
  call void @printIntLine(i32 %7), !dbg !263
  br label %for.inc, !dbg !264

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !265
  %inc = add nsw i32 %8, 1, !dbg !265
  store i32 %inc, i32* %i, align 4, !dbg !265
  br label %for.cond, !dbg !266, !llvm.loop !267

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !269

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !270
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !272
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !273 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !274, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !276, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !279, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !281, metadata !DIExpression()), !dbg !282
  store i32 -1, i32* %connectSocket, align 4, !dbg !282
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !283, metadata !DIExpression()), !dbg !284
  br label %do.body, !dbg !285

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !286
  store i32 %call, i32* %connectSocket, align 4, !dbg !288
  %0 = load i32, i32* %connectSocket, align 4, !dbg !289
  %cmp = icmp eq i32 %0, -1, !dbg !291
  br i1 %cmp, label %if.then, label %if.end, !dbg !292

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !293

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !295
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !295
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !296
  store i16 2, i16* %sin_family, align 4, !dbg !297
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0)) #7, !dbg !298
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !299
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !300
  store i32 %call1, i32* %s_addr, align 4, !dbg !301
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !302
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !303
  store i16 %call2, i16* %sin_port, align 2, !dbg !304
  %2 = load i32, i32* %connectSocket, align 4, !dbg !305
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !307
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !308
  %cmp4 = icmp eq i32 %call3, -1, !dbg !309
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !310

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !311

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !313
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !314
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !315
  %conv = trunc i64 %call7 to i32, !dbg !315
  store i32 %conv, i32* %recvResult, align 4, !dbg !316
  %5 = load i32, i32* %recvResult, align 4, !dbg !317
  %cmp8 = icmp eq i32 %5, -1, !dbg !319
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !320

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !321
  %cmp10 = icmp eq i32 %6, 0, !dbg !322
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !323

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !324

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !326
  %idxprom = sext i32 %7 to i64, !dbg !327
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !327
  store i8 0, i8* %arrayidx, align 1, !dbg !328
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !329
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !330
  store i32 %call15, i32* %data.addr, align 4, !dbg !331
  br label %do.end, !dbg !332

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !333
  %cmp16 = icmp ne i32 %8, -1, !dbg !335
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !336

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !337
  %call19 = call i32 @close(i32 %9), !dbg !339
  br label %if.end20, !dbg !340

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data.addr, align 4, !dbg !341
  ret i32 %10, !dbg !342
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !343 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !344, metadata !DIExpression()), !dbg !345
  store i32 -1, i32* %data, align 4, !dbg !346
  %0 = load i32, i32* %data, align 4, !dbg !347
  %call = call i32 @goodG2BSource(i32 %0), !dbg !348
  store i32 %call, i32* %data, align 4, !dbg !349
  call void @llvm.dbg.declare(metadata i32* %i, metadata !350, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !353, metadata !DIExpression()), !dbg !354
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !354
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !354
  %2 = load i32, i32* %data, align 4, !dbg !355
  %cmp = icmp sge i32 %2, 0, !dbg !357
  br i1 %cmp, label %if.then, label %if.else, !dbg !358

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !359
  %idxprom = sext i32 %3 to i64, !dbg !361
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !361
  store i32 1, i32* %arrayidx, align 4, !dbg !362
  store i32 0, i32* %i, align 4, !dbg !363
  br label %for.cond, !dbg !365

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !366
  %cmp1 = icmp slt i32 %4, 10, !dbg !368
  br i1 %cmp1, label %for.body, label %for.end, !dbg !369

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !370
  %idxprom2 = sext i32 %5 to i64, !dbg !372
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !372
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !372
  call void @printIntLine(i32 %6), !dbg !373
  br label %for.inc, !dbg !374

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !375
  %inc = add nsw i32 %7, 1, !dbg !375
  store i32 %inc, i32* %i, align 4, !dbg !375
  br label %for.cond, !dbg !376, !llvm.loop !377

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !379

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !380
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !382
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !383 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !384, metadata !DIExpression()), !dbg !385
  store i32 7, i32* %data.addr, align 4, !dbg !386
  %0 = load i32, i32* %data.addr, align 4, !dbg !387
  ret i32 %0, !dbg !388
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_42.c", directory: "/root/SSE-Assessment")
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
!45 = !{!5, !46}
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
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_42_bad", scope: !66, file: !66, line: 105, type: !67, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_42.c", directory: "/root/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 107, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 107, column: 9, scope: !65)
!73 = !DILocation(line: 109, column: 10, scope: !65)
!74 = !DILocation(line: 110, column: 22, scope: !65)
!75 = !DILocation(line: 110, column: 12, scope: !65)
!76 = !DILocation(line: 110, column: 10, scope: !65)
!77 = !DILocalVariable(name: "i", scope: !78, file: !66, line: 112, type: !71)
!78 = distinct !DILexicalBlock(scope: !65, file: !66, line: 111, column: 5)
!79 = !DILocation(line: 112, column: 13, scope: !78)
!80 = !DILocalVariable(name: "buffer", scope: !78, file: !66, line: 113, type: !81)
!81 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !82)
!82 = !{!83}
!83 = !DISubrange(count: 10)
!84 = !DILocation(line: 113, column: 13, scope: !78)
!85 = !DILocation(line: 116, column: 13, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !66, line: 116, column: 13)
!87 = !DILocation(line: 116, column: 18, scope: !86)
!88 = !DILocation(line: 116, column: 13, scope: !78)
!89 = !DILocation(line: 118, column: 20, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !66, line: 117, column: 9)
!91 = !DILocation(line: 118, column: 13, scope: !90)
!92 = !DILocation(line: 118, column: 26, scope: !90)
!93 = !DILocation(line: 120, column: 19, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !66, line: 120, column: 13)
!95 = !DILocation(line: 120, column: 17, scope: !94)
!96 = !DILocation(line: 120, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !66, line: 120, column: 13)
!98 = !DILocation(line: 120, column: 26, scope: !97)
!99 = !DILocation(line: 120, column: 13, scope: !94)
!100 = !DILocation(line: 122, column: 37, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !66, line: 121, column: 13)
!102 = !DILocation(line: 122, column: 30, scope: !101)
!103 = !DILocation(line: 122, column: 17, scope: !101)
!104 = !DILocation(line: 123, column: 13, scope: !101)
!105 = !DILocation(line: 120, column: 33, scope: !97)
!106 = !DILocation(line: 120, column: 13, scope: !97)
!107 = distinct !{!107, !99, !108, !109}
!108 = !DILocation(line: 123, column: 13, scope: !94)
!109 = !{!"llvm.loop.mustprogress"}
!110 = !DILocation(line: 124, column: 9, scope: !90)
!111 = !DILocation(line: 127, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !86, file: !66, line: 126, column: 9)
!113 = !DILocation(line: 130, column: 1, scope: !65)
!114 = distinct !DISubprogram(name: "badSource", scope: !66, file: !66, line: 44, type: !115, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!115 = !DISubroutineType(types: !116)
!116 = !{!71, !71}
!117 = !DILocalVariable(name: "data", arg: 1, scope: !114, file: !66, line: 44, type: !71)
!118 = !DILocation(line: 44, column: 26, scope: !114)
!119 = !DILocalVariable(name: "recvResult", scope: !120, file: !66, line: 51, type: !71)
!120 = distinct !DILexicalBlock(scope: !114, file: !66, line: 46, column: 5)
!121 = !DILocation(line: 51, column: 13, scope: !120)
!122 = !DILocalVariable(name: "service", scope: !120, file: !66, line: 52, type: !123)
!123 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !124)
!124 = !{!125, !126, !132, !139}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !123, file: !17, line: 239, baseType: !51, size: 16)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !123, file: !17, line: 240, baseType: !127, size: 16, offset: 16)
!127 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !128)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !129, line: 25, baseType: !130)
!129 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !131, line: 39, baseType: !53)
!131 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!132 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !123, file: !17, line: 241, baseType: !133, size: 32, offset: 32)
!133 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !134)
!134 = !{!135}
!135 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !133, file: !17, line: 33, baseType: !136, size: 32)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !137)
!137 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !129, line: 26, baseType: !138)
!138 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !131, line: 41, baseType: !5)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !123, file: !17, line: 244, baseType: !140, size: 64, offset: 64)
!140 = !DICompositeType(tag: DW_TAG_array_type, baseType: !141, size: 64, elements: !142)
!141 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!142 = !{!143}
!143 = !DISubrange(count: 8)
!144 = !DILocation(line: 52, column: 28, scope: !120)
!145 = !DILocalVariable(name: "connectSocket", scope: !120, file: !66, line: 53, type: !71)
!146 = !DILocation(line: 53, column: 16, scope: !120)
!147 = !DILocalVariable(name: "inputBuffer", scope: !120, file: !66, line: 54, type: !55)
!148 = !DILocation(line: 54, column: 14, scope: !120)
!149 = !DILocation(line: 55, column: 9, scope: !120)
!150 = !DILocation(line: 65, column: 29, scope: !151)
!151 = distinct !DILexicalBlock(scope: !120, file: !66, line: 56, column: 9)
!152 = !DILocation(line: 65, column: 27, scope: !151)
!153 = !DILocation(line: 66, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !66, line: 66, column: 17)
!155 = !DILocation(line: 66, column: 31, scope: !154)
!156 = !DILocation(line: 66, column: 17, scope: !151)
!157 = !DILocation(line: 68, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !66, line: 67, column: 13)
!159 = !DILocation(line: 70, column: 13, scope: !151)
!160 = !DILocation(line: 71, column: 21, scope: !151)
!161 = !DILocation(line: 71, column: 32, scope: !151)
!162 = !DILocation(line: 72, column: 39, scope: !151)
!163 = !DILocation(line: 72, column: 21, scope: !151)
!164 = !DILocation(line: 72, column: 30, scope: !151)
!165 = !DILocation(line: 72, column: 37, scope: !151)
!166 = !DILocation(line: 73, column: 32, scope: !151)
!167 = !DILocation(line: 73, column: 21, scope: !151)
!168 = !DILocation(line: 73, column: 30, scope: !151)
!169 = !DILocation(line: 74, column: 25, scope: !170)
!170 = distinct !DILexicalBlock(scope: !151, file: !66, line: 74, column: 17)
!171 = !DILocation(line: 74, column: 40, scope: !170)
!172 = !DILocation(line: 74, column: 17, scope: !170)
!173 = !DILocation(line: 74, column: 85, scope: !170)
!174 = !DILocation(line: 74, column: 17, scope: !151)
!175 = !DILocation(line: 76, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !170, file: !66, line: 75, column: 13)
!177 = !DILocation(line: 80, column: 31, scope: !151)
!178 = !DILocation(line: 80, column: 46, scope: !151)
!179 = !DILocation(line: 80, column: 26, scope: !151)
!180 = !DILocation(line: 80, column: 24, scope: !151)
!181 = !DILocation(line: 81, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !151, file: !66, line: 81, column: 17)
!183 = !DILocation(line: 81, column: 28, scope: !182)
!184 = !DILocation(line: 81, column: 44, scope: !182)
!185 = !DILocation(line: 81, column: 47, scope: !182)
!186 = !DILocation(line: 81, column: 58, scope: !182)
!187 = !DILocation(line: 81, column: 17, scope: !151)
!188 = !DILocation(line: 83, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !182, file: !66, line: 82, column: 13)
!190 = !DILocation(line: 86, column: 25, scope: !151)
!191 = !DILocation(line: 86, column: 13, scope: !151)
!192 = !DILocation(line: 86, column: 37, scope: !151)
!193 = !DILocation(line: 88, column: 25, scope: !151)
!194 = !DILocation(line: 88, column: 20, scope: !151)
!195 = !DILocation(line: 88, column: 18, scope: !151)
!196 = !DILocation(line: 89, column: 9, scope: !151)
!197 = !DILocation(line: 91, column: 13, scope: !198)
!198 = distinct !DILexicalBlock(scope: !120, file: !66, line: 91, column: 13)
!199 = !DILocation(line: 91, column: 27, scope: !198)
!200 = !DILocation(line: 91, column: 13, scope: !120)
!201 = !DILocation(line: 93, column: 26, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !66, line: 92, column: 9)
!203 = !DILocation(line: 93, column: 13, scope: !202)
!204 = !DILocation(line: 94, column: 9, scope: !202)
!205 = !DILocation(line: 102, column: 12, scope: !114)
!206 = !DILocation(line: 102, column: 5, scope: !114)
!207 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_42_good", scope: !66, file: !66, line: 260, type: !67, scopeLine: 261, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!208 = !DILocation(line: 262, column: 5, scope: !207)
!209 = !DILocation(line: 263, column: 5, scope: !207)
!210 = !DILocation(line: 264, column: 1, scope: !207)
!211 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 275, type: !212, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!212 = !DISubroutineType(types: !213)
!213 = !{!71, !71, !214}
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!216 = !DILocalVariable(name: "argc", arg: 1, scope: !211, file: !66, line: 275, type: !71)
!217 = !DILocation(line: 275, column: 14, scope: !211)
!218 = !DILocalVariable(name: "argv", arg: 2, scope: !211, file: !66, line: 275, type: !214)
!219 = !DILocation(line: 275, column: 27, scope: !211)
!220 = !DILocation(line: 278, column: 22, scope: !211)
!221 = !DILocation(line: 278, column: 12, scope: !211)
!222 = !DILocation(line: 278, column: 5, scope: !211)
!223 = !DILocation(line: 280, column: 5, scope: !211)
!224 = !DILocation(line: 281, column: 5, scope: !211)
!225 = !DILocation(line: 282, column: 5, scope: !211)
!226 = !DILocation(line: 285, column: 5, scope: !211)
!227 = !DILocation(line: 286, column: 5, scope: !211)
!228 = !DILocation(line: 287, column: 5, scope: !211)
!229 = !DILocation(line: 289, column: 5, scope: !211)
!230 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 234, type: !67, scopeLine: 235, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!231 = !DILocalVariable(name: "data", scope: !230, file: !66, line: 236, type: !71)
!232 = !DILocation(line: 236, column: 9, scope: !230)
!233 = !DILocation(line: 238, column: 10, scope: !230)
!234 = !DILocation(line: 239, column: 26, scope: !230)
!235 = !DILocation(line: 239, column: 12, scope: !230)
!236 = !DILocation(line: 239, column: 10, scope: !230)
!237 = !DILocalVariable(name: "i", scope: !238, file: !66, line: 241, type: !71)
!238 = distinct !DILexicalBlock(scope: !230, file: !66, line: 240, column: 5)
!239 = !DILocation(line: 241, column: 13, scope: !238)
!240 = !DILocalVariable(name: "buffer", scope: !238, file: !66, line: 242, type: !81)
!241 = !DILocation(line: 242, column: 13, scope: !238)
!242 = !DILocation(line: 244, column: 13, scope: !243)
!243 = distinct !DILexicalBlock(scope: !238, file: !66, line: 244, column: 13)
!244 = !DILocation(line: 244, column: 18, scope: !243)
!245 = !DILocation(line: 244, column: 23, scope: !243)
!246 = !DILocation(line: 244, column: 26, scope: !243)
!247 = !DILocation(line: 244, column: 31, scope: !243)
!248 = !DILocation(line: 244, column: 13, scope: !238)
!249 = !DILocation(line: 246, column: 20, scope: !250)
!250 = distinct !DILexicalBlock(scope: !243, file: !66, line: 245, column: 9)
!251 = !DILocation(line: 246, column: 13, scope: !250)
!252 = !DILocation(line: 246, column: 26, scope: !250)
!253 = !DILocation(line: 248, column: 19, scope: !254)
!254 = distinct !DILexicalBlock(scope: !250, file: !66, line: 248, column: 13)
!255 = !DILocation(line: 248, column: 17, scope: !254)
!256 = !DILocation(line: 248, column: 24, scope: !257)
!257 = distinct !DILexicalBlock(scope: !254, file: !66, line: 248, column: 13)
!258 = !DILocation(line: 248, column: 26, scope: !257)
!259 = !DILocation(line: 248, column: 13, scope: !254)
!260 = !DILocation(line: 250, column: 37, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !66, line: 249, column: 13)
!262 = !DILocation(line: 250, column: 30, scope: !261)
!263 = !DILocation(line: 250, column: 17, scope: !261)
!264 = !DILocation(line: 251, column: 13, scope: !261)
!265 = !DILocation(line: 248, column: 33, scope: !257)
!266 = !DILocation(line: 248, column: 13, scope: !257)
!267 = distinct !{!267, !259, !268, !109}
!268 = !DILocation(line: 251, column: 13, scope: !254)
!269 = !DILocation(line: 252, column: 9, scope: !250)
!270 = !DILocation(line: 255, column: 13, scope: !271)
!271 = distinct !DILexicalBlock(scope: !243, file: !66, line: 254, column: 9)
!272 = !DILocation(line: 258, column: 1, scope: !230)
!273 = distinct !DISubprogram(name: "goodB2GSource", scope: !66, file: !66, line: 173, type: !115, scopeLine: 174, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!274 = !DILocalVariable(name: "data", arg: 1, scope: !273, file: !66, line: 173, type: !71)
!275 = !DILocation(line: 173, column: 30, scope: !273)
!276 = !DILocalVariable(name: "recvResult", scope: !277, file: !66, line: 180, type: !71)
!277 = distinct !DILexicalBlock(scope: !273, file: !66, line: 175, column: 5)
!278 = !DILocation(line: 180, column: 13, scope: !277)
!279 = !DILocalVariable(name: "service", scope: !277, file: !66, line: 181, type: !123)
!280 = !DILocation(line: 181, column: 28, scope: !277)
!281 = !DILocalVariable(name: "connectSocket", scope: !277, file: !66, line: 182, type: !71)
!282 = !DILocation(line: 182, column: 16, scope: !277)
!283 = !DILocalVariable(name: "inputBuffer", scope: !277, file: !66, line: 183, type: !55)
!284 = !DILocation(line: 183, column: 14, scope: !277)
!285 = !DILocation(line: 184, column: 9, scope: !277)
!286 = !DILocation(line: 194, column: 29, scope: !287)
!287 = distinct !DILexicalBlock(scope: !277, file: !66, line: 185, column: 9)
!288 = !DILocation(line: 194, column: 27, scope: !287)
!289 = !DILocation(line: 195, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !66, line: 195, column: 17)
!291 = !DILocation(line: 195, column: 31, scope: !290)
!292 = !DILocation(line: 195, column: 17, scope: !287)
!293 = !DILocation(line: 197, column: 17, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !66, line: 196, column: 13)
!295 = !DILocation(line: 199, column: 13, scope: !287)
!296 = !DILocation(line: 200, column: 21, scope: !287)
!297 = !DILocation(line: 200, column: 32, scope: !287)
!298 = !DILocation(line: 201, column: 39, scope: !287)
!299 = !DILocation(line: 201, column: 21, scope: !287)
!300 = !DILocation(line: 201, column: 30, scope: !287)
!301 = !DILocation(line: 201, column: 37, scope: !287)
!302 = !DILocation(line: 202, column: 32, scope: !287)
!303 = !DILocation(line: 202, column: 21, scope: !287)
!304 = !DILocation(line: 202, column: 30, scope: !287)
!305 = !DILocation(line: 203, column: 25, scope: !306)
!306 = distinct !DILexicalBlock(scope: !287, file: !66, line: 203, column: 17)
!307 = !DILocation(line: 203, column: 40, scope: !306)
!308 = !DILocation(line: 203, column: 17, scope: !306)
!309 = !DILocation(line: 203, column: 85, scope: !306)
!310 = !DILocation(line: 203, column: 17, scope: !287)
!311 = !DILocation(line: 205, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !306, file: !66, line: 204, column: 13)
!313 = !DILocation(line: 209, column: 31, scope: !287)
!314 = !DILocation(line: 209, column: 46, scope: !287)
!315 = !DILocation(line: 209, column: 26, scope: !287)
!316 = !DILocation(line: 209, column: 24, scope: !287)
!317 = !DILocation(line: 210, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !287, file: !66, line: 210, column: 17)
!319 = !DILocation(line: 210, column: 28, scope: !318)
!320 = !DILocation(line: 210, column: 44, scope: !318)
!321 = !DILocation(line: 210, column: 47, scope: !318)
!322 = !DILocation(line: 210, column: 58, scope: !318)
!323 = !DILocation(line: 210, column: 17, scope: !287)
!324 = !DILocation(line: 212, column: 17, scope: !325)
!325 = distinct !DILexicalBlock(scope: !318, file: !66, line: 211, column: 13)
!326 = !DILocation(line: 215, column: 25, scope: !287)
!327 = !DILocation(line: 215, column: 13, scope: !287)
!328 = !DILocation(line: 215, column: 37, scope: !287)
!329 = !DILocation(line: 217, column: 25, scope: !287)
!330 = !DILocation(line: 217, column: 20, scope: !287)
!331 = !DILocation(line: 217, column: 18, scope: !287)
!332 = !DILocation(line: 218, column: 9, scope: !287)
!333 = !DILocation(line: 220, column: 13, scope: !334)
!334 = distinct !DILexicalBlock(scope: !277, file: !66, line: 220, column: 13)
!335 = !DILocation(line: 220, column: 27, scope: !334)
!336 = !DILocation(line: 220, column: 13, scope: !277)
!337 = !DILocation(line: 222, column: 26, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !66, line: 221, column: 9)
!339 = !DILocation(line: 222, column: 13, scope: !338)
!340 = !DILocation(line: 223, column: 9, scope: !338)
!341 = !DILocation(line: 231, column: 12, scope: !273)
!342 = !DILocation(line: 231, column: 5, scope: !273)
!343 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 145, type: !67, scopeLine: 146, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!344 = !DILocalVariable(name: "data", scope: !343, file: !66, line: 147, type: !71)
!345 = !DILocation(line: 147, column: 9, scope: !343)
!346 = !DILocation(line: 149, column: 10, scope: !343)
!347 = !DILocation(line: 150, column: 26, scope: !343)
!348 = !DILocation(line: 150, column: 12, scope: !343)
!349 = !DILocation(line: 150, column: 10, scope: !343)
!350 = !DILocalVariable(name: "i", scope: !351, file: !66, line: 152, type: !71)
!351 = distinct !DILexicalBlock(scope: !343, file: !66, line: 151, column: 5)
!352 = !DILocation(line: 152, column: 13, scope: !351)
!353 = !DILocalVariable(name: "buffer", scope: !351, file: !66, line: 153, type: !81)
!354 = !DILocation(line: 153, column: 13, scope: !351)
!355 = !DILocation(line: 156, column: 13, scope: !356)
!356 = distinct !DILexicalBlock(scope: !351, file: !66, line: 156, column: 13)
!357 = !DILocation(line: 156, column: 18, scope: !356)
!358 = !DILocation(line: 156, column: 13, scope: !351)
!359 = !DILocation(line: 158, column: 20, scope: !360)
!360 = distinct !DILexicalBlock(scope: !356, file: !66, line: 157, column: 9)
!361 = !DILocation(line: 158, column: 13, scope: !360)
!362 = !DILocation(line: 158, column: 26, scope: !360)
!363 = !DILocation(line: 160, column: 19, scope: !364)
!364 = distinct !DILexicalBlock(scope: !360, file: !66, line: 160, column: 13)
!365 = !DILocation(line: 160, column: 17, scope: !364)
!366 = !DILocation(line: 160, column: 24, scope: !367)
!367 = distinct !DILexicalBlock(scope: !364, file: !66, line: 160, column: 13)
!368 = !DILocation(line: 160, column: 26, scope: !367)
!369 = !DILocation(line: 160, column: 13, scope: !364)
!370 = !DILocation(line: 162, column: 37, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !66, line: 161, column: 13)
!372 = !DILocation(line: 162, column: 30, scope: !371)
!373 = !DILocation(line: 162, column: 17, scope: !371)
!374 = !DILocation(line: 163, column: 13, scope: !371)
!375 = !DILocation(line: 160, column: 33, scope: !367)
!376 = !DILocation(line: 160, column: 13, scope: !367)
!377 = distinct !{!377, !369, !378, !109}
!378 = !DILocation(line: 163, column: 13, scope: !364)
!379 = !DILocation(line: 164, column: 9, scope: !360)
!380 = !DILocation(line: 167, column: 13, scope: !381)
!381 = distinct !DILexicalBlock(scope: !356, file: !66, line: 166, column: 9)
!382 = !DILocation(line: 170, column: 1, scope: !343)
!383 = distinct !DISubprogram(name: "goodG2BSource", scope: !66, file: !66, line: 137, type: !115, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!384 = !DILocalVariable(name: "data", arg: 1, scope: !383, file: !66, line: 137, type: !71)
!385 = !DILocation(line: 137, column: 30, scope: !383)
!386 = !DILocation(line: 141, column: 10, scope: !383)
!387 = !DILocation(line: 142, column: 12, scope: !383)
!388 = !DILocation(line: 142, column: 5, scope: !383)
