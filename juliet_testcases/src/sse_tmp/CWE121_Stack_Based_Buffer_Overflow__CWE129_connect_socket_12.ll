; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_12_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i39 = alloca i32, align 4
  %buffer40 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !74
  %tobool = icmp ne i32 %call, 0, !dbg !74
  br i1 %tobool, label %if.then, label %if.else, !dbg !76

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !77, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !81, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %connectSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %do.body, !dbg !108

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !109
  store i32 %call1, i32* %connectSocket, align 4, !dbg !111
  %0 = load i32, i32* %connectSocket, align 4, !dbg !112
  %cmp = icmp eq i32 %0, -1, !dbg !114
  br i1 %cmp, label %if.then2, label %if.end, !dbg !115

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !116

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !118
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !119
  store i16 2, i16* %sin_family, align 4, !dbg !120
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !121
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !122
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !123
  store i32 %call3, i32* %s_addr, align 4, !dbg !124
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !125
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !126
  store i16 %call4, i16* %sin_port, align 2, !dbg !127
  %2 = load i32, i32* %connectSocket, align 4, !dbg !128
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !130
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !131
  %cmp6 = icmp eq i32 %call5, -1, !dbg !132
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !133

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !134

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !136
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !137
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !138
  %conv = trunc i64 %call9 to i32, !dbg !138
  store i32 %conv, i32* %recvResult, align 4, !dbg !139
  %5 = load i32, i32* %recvResult, align 4, !dbg !140
  %cmp10 = icmp eq i32 %5, -1, !dbg !142
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !143

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !144
  %cmp12 = icmp eq i32 %6, 0, !dbg !145
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !146

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !147

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !149
  %idxprom = sext i32 %7 to i64, !dbg !150
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !150
  store i8 0, i8* %arrayidx, align 1, !dbg !151
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !152
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !153
  store i32 %call17, i32* %data, align 4, !dbg !154
  br label %do.end, !dbg !155

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !156
  %cmp18 = icmp ne i32 %8, -1, !dbg !158
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !159

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !160
  %call21 = call i32 @close(i32 %9), !dbg !162
  br label %if.end22, !dbg !163

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !164

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !165
  br label %if.end23

if.end23:                                         ; preds = %if.else, %if.end22
  %call24 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !167
  %tobool25 = icmp ne i32 %call24, 0, !dbg !167
  br i1 %tobool25, label %if.then26, label %if.else38, !dbg !169

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !170, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !174, metadata !DIExpression()), !dbg !178
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !178
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !178
  %11 = load i32, i32* %data, align 4, !dbg !179
  %cmp27 = icmp sge i32 %11, 0, !dbg !181
  br i1 %cmp27, label %if.then29, label %if.else36, !dbg !182

if.then29:                                        ; preds = %if.then26
  %12 = load i32, i32* %data, align 4, !dbg !183
  %idxprom30 = sext i32 %12 to i64, !dbg !185
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !185
  store i32 1, i32* %arrayidx31, align 4, !dbg !186
  store i32 0, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %if.then29
  %13 = load i32, i32* %i, align 4, !dbg !190
  %cmp32 = icmp slt i32 %13, 10, !dbg !192
  br i1 %cmp32, label %for.body, label %for.end, !dbg !193

for.body:                                         ; preds = %for.cond
  %14 = load i32, i32* %i, align 4, !dbg !194
  %idxprom34 = sext i32 %14 to i64, !dbg !196
  %arrayidx35 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom34, !dbg !196
  %15 = load i32, i32* %arrayidx35, align 4, !dbg !196
  call void @printIntLine(i32 %15), !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !199
  %inc = add nsw i32 %16, 1, !dbg !199
  store i32 %inc, i32* %i, align 4, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  br label %if.end37, !dbg !204

if.else36:                                        ; preds = %if.then26
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !205
  br label %if.end37

if.end37:                                         ; preds = %if.else36, %for.end
  br label %if.end59, !dbg !207

if.else38:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i39, metadata !208, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer40, metadata !212, metadata !DIExpression()), !dbg !213
  %17 = bitcast [10 x i32]* %buffer40 to i8*, !dbg !213
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !213
  %18 = load i32, i32* %data, align 4, !dbg !214
  %cmp41 = icmp sge i32 %18, 0, !dbg !216
  br i1 %cmp41, label %land.lhs.true, label %if.else57, !dbg !217

land.lhs.true:                                    ; preds = %if.else38
  %19 = load i32, i32* %data, align 4, !dbg !218
  %cmp43 = icmp slt i32 %19, 10, !dbg !219
  br i1 %cmp43, label %if.then45, label %if.else57, !dbg !220

if.then45:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !221
  %idxprom46 = sext i32 %20 to i64, !dbg !223
  %arrayidx47 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer40, i64 0, i64 %idxprom46, !dbg !223
  store i32 1, i32* %arrayidx47, align 4, !dbg !224
  store i32 0, i32* %i39, align 4, !dbg !225
  br label %for.cond48, !dbg !227

for.cond48:                                       ; preds = %for.inc54, %if.then45
  %21 = load i32, i32* %i39, align 4, !dbg !228
  %cmp49 = icmp slt i32 %21, 10, !dbg !230
  br i1 %cmp49, label %for.body51, label %for.end56, !dbg !231

for.body51:                                       ; preds = %for.cond48
  %22 = load i32, i32* %i39, align 4, !dbg !232
  %idxprom52 = sext i32 %22 to i64, !dbg !234
  %arrayidx53 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer40, i64 0, i64 %idxprom52, !dbg !234
  %23 = load i32, i32* %arrayidx53, align 4, !dbg !234
  call void @printIntLine(i32 %23), !dbg !235
  br label %for.inc54, !dbg !236

for.inc54:                                        ; preds = %for.body51
  %24 = load i32, i32* %i39, align 4, !dbg !237
  %inc55 = add nsw i32 %24, 1, !dbg !237
  store i32 %inc55, i32* %i39, align 4, !dbg !237
  br label %for.cond48, !dbg !238, !llvm.loop !239

for.end56:                                        ; preds = %for.cond48
  br label %if.end58, !dbg !241

if.else57:                                        ; preds = %land.lhs.true, %if.else38
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !242
  br label %if.end58

if.end58:                                         ; preds = %if.else57, %for.end56
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %if.end37
  ret void, !dbg !244
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #3

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #5

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #2

declare dso_local i64 @recv(i32, i8*, i64, i32) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #2

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_12_good() #0 !dbg !245 {
entry:
  call void @goodB2G(), !dbg !246
  call void @goodG2B(), !dbg !247
  ret void, !dbg !248
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !249 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !254, metadata !DIExpression()), !dbg !255
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !256, metadata !DIExpression()), !dbg !257
  %call = call i64 @time(i64* null) #7, !dbg !258
  %conv = trunc i64 %call to i32, !dbg !259
  call void @srand(i32 %conv) #7, !dbg !260
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !261
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_12_good(), !dbg !262
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !263
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !264
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_12_bad(), !dbg !265
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !266
  ret i32 0, !dbg !267
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !268 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %recvResult23 = alloca i32, align 4
  %service24 = alloca %struct.sockaddr_in, align 4
  %connectSocket25 = alloca i32, align 4
  %inputBuffer26 = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i82 = alloca i32, align 4
  %buffer83 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !269, metadata !DIExpression()), !dbg !270
  store i32 -1, i32* %data, align 4, !dbg !271
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !272
  %tobool = icmp ne i32 %call, 0, !dbg !272
  br i1 %tobool, label %if.then, label %if.else, !dbg !274

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !275, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !279, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !281, metadata !DIExpression()), !dbg !282
  store i32 -1, i32* %connectSocket, align 4, !dbg !282
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !283, metadata !DIExpression()), !dbg !284
  br label %do.body, !dbg !285

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !286
  store i32 %call1, i32* %connectSocket, align 4, !dbg !288
  %0 = load i32, i32* %connectSocket, align 4, !dbg !289
  %cmp = icmp eq i32 %0, -1, !dbg !291
  br i1 %cmp, label %if.then2, label %if.end, !dbg !292

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !293

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !295
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !295
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !296
  store i16 2, i16* %sin_family, align 4, !dbg !297
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !298
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !299
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !300
  store i32 %call3, i32* %s_addr, align 4, !dbg !301
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !302
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !303
  store i16 %call4, i16* %sin_port, align 2, !dbg !304
  %2 = load i32, i32* %connectSocket, align 4, !dbg !305
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !307
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !308
  %cmp6 = icmp eq i32 %call5, -1, !dbg !309
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !310

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !311

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !313
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !314
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !315
  %conv = trunc i64 %call9 to i32, !dbg !315
  store i32 %conv, i32* %recvResult, align 4, !dbg !316
  %5 = load i32, i32* %recvResult, align 4, !dbg !317
  %cmp10 = icmp eq i32 %5, -1, !dbg !319
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !320

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !321
  %cmp12 = icmp eq i32 %6, 0, !dbg !322
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !323

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !324

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !326
  %idxprom = sext i32 %7 to i64, !dbg !327
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !327
  store i8 0, i8* %arrayidx, align 1, !dbg !328
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !329
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !330
  store i32 %call17, i32* %data, align 4, !dbg !331
  br label %do.end, !dbg !332

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !333
  %cmp18 = icmp ne i32 %8, -1, !dbg !335
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !336

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !337
  %call21 = call i32 @close(i32 %9), !dbg !339
  br label %if.end22, !dbg !340

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end64, !dbg !341

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult23, metadata !342, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service24, metadata !346, metadata !DIExpression()), !dbg !347
  call void @llvm.dbg.declare(metadata i32* %connectSocket25, metadata !348, metadata !DIExpression()), !dbg !349
  store i32 -1, i32* %connectSocket25, align 4, !dbg !349
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer26, metadata !350, metadata !DIExpression()), !dbg !351
  br label %do.body27, !dbg !352

do.body27:                                        ; preds = %if.else
  %call28 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !353
  store i32 %call28, i32* %connectSocket25, align 4, !dbg !355
  %10 = load i32, i32* %connectSocket25, align 4, !dbg !356
  %cmp29 = icmp eq i32 %10, -1, !dbg !358
  br i1 %cmp29, label %if.then31, label %if.end32, !dbg !359

if.then31:                                        ; preds = %do.body27
  br label %do.end58, !dbg !360

if.end32:                                         ; preds = %do.body27
  %11 = bitcast %struct.sockaddr_in* %service24 to i8*, !dbg !362
  call void @llvm.memset.p0i8.i64(i8* align 4 %11, i8 0, i64 16, i1 false), !dbg !362
  %sin_family33 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service24, i32 0, i32 0, !dbg !363
  store i16 2, i16* %sin_family33, align 4, !dbg !364
  %call34 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !365
  %sin_addr35 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service24, i32 0, i32 2, !dbg !366
  %s_addr36 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr35, i32 0, i32 0, !dbg !367
  store i32 %call34, i32* %s_addr36, align 4, !dbg !368
  %call37 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !369
  %sin_port38 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service24, i32 0, i32 1, !dbg !370
  store i16 %call37, i16* %sin_port38, align 2, !dbg !371
  %12 = load i32, i32* %connectSocket25, align 4, !dbg !372
  %13 = bitcast %struct.sockaddr_in* %service24 to %struct.sockaddr*, !dbg !374
  %call39 = call i32 @connect(i32 %12, %struct.sockaddr* %13, i32 16), !dbg !375
  %cmp40 = icmp eq i32 %call39, -1, !dbg !376
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !377

if.then42:                                        ; preds = %if.end32
  br label %do.end58, !dbg !378

if.end43:                                         ; preds = %if.end32
  %14 = load i32, i32* %connectSocket25, align 4, !dbg !380
  %arraydecay44 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer26, i64 0, i64 0, !dbg !381
  %call45 = call i64 @recv(i32 %14, i8* %arraydecay44, i64 13, i32 0), !dbg !382
  %conv46 = trunc i64 %call45 to i32, !dbg !382
  store i32 %conv46, i32* %recvResult23, align 4, !dbg !383
  %15 = load i32, i32* %recvResult23, align 4, !dbg !384
  %cmp47 = icmp eq i32 %15, -1, !dbg !386
  br i1 %cmp47, label %if.then52, label %lor.lhs.false49, !dbg !387

lor.lhs.false49:                                  ; preds = %if.end43
  %16 = load i32, i32* %recvResult23, align 4, !dbg !388
  %cmp50 = icmp eq i32 %16, 0, !dbg !389
  br i1 %cmp50, label %if.then52, label %if.end53, !dbg !390

if.then52:                                        ; preds = %lor.lhs.false49, %if.end43
  br label %do.end58, !dbg !391

if.end53:                                         ; preds = %lor.lhs.false49
  %17 = load i32, i32* %recvResult23, align 4, !dbg !393
  %idxprom54 = sext i32 %17 to i64, !dbg !394
  %arrayidx55 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer26, i64 0, i64 %idxprom54, !dbg !394
  store i8 0, i8* %arrayidx55, align 1, !dbg !395
  %arraydecay56 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer26, i64 0, i64 0, !dbg !396
  %call57 = call i32 @atoi(i8* %arraydecay56) #9, !dbg !397
  store i32 %call57, i32* %data, align 4, !dbg !398
  br label %do.end58, !dbg !399

do.end58:                                         ; preds = %if.end53, %if.then52, %if.then42, %if.then31
  %18 = load i32, i32* %connectSocket25, align 4, !dbg !400
  %cmp59 = icmp ne i32 %18, -1, !dbg !402
  br i1 %cmp59, label %if.then61, label %if.end63, !dbg !403

if.then61:                                        ; preds = %do.end58
  %19 = load i32, i32* %connectSocket25, align 4, !dbg !404
  %call62 = call i32 @close(i32 %19), !dbg !406
  br label %if.end63, !dbg !407

if.end63:                                         ; preds = %if.then61, %do.end58
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.end22
  %call65 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !408
  %tobool66 = icmp ne i32 %call65, 0, !dbg !408
  br i1 %tobool66, label %if.then67, label %if.else81, !dbg !410

if.then67:                                        ; preds = %if.end64
  call void @llvm.dbg.declare(metadata i32* %i, metadata !411, metadata !DIExpression()), !dbg !414
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !415, metadata !DIExpression()), !dbg !416
  %20 = bitcast [10 x i32]* %buffer to i8*, !dbg !416
  call void @llvm.memset.p0i8.i64(i8* align 16 %20, i8 0, i64 40, i1 false), !dbg !416
  %21 = load i32, i32* %data, align 4, !dbg !417
  %cmp68 = icmp sge i32 %21, 0, !dbg !419
  br i1 %cmp68, label %land.lhs.true, label %if.else79, !dbg !420

land.lhs.true:                                    ; preds = %if.then67
  %22 = load i32, i32* %data, align 4, !dbg !421
  %cmp70 = icmp slt i32 %22, 10, !dbg !422
  br i1 %cmp70, label %if.then72, label %if.else79, !dbg !423

if.then72:                                        ; preds = %land.lhs.true
  %23 = load i32, i32* %data, align 4, !dbg !424
  %idxprom73 = sext i32 %23 to i64, !dbg !426
  %arrayidx74 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom73, !dbg !426
  store i32 1, i32* %arrayidx74, align 4, !dbg !427
  store i32 0, i32* %i, align 4, !dbg !428
  br label %for.cond, !dbg !430

for.cond:                                         ; preds = %for.inc, %if.then72
  %24 = load i32, i32* %i, align 4, !dbg !431
  %cmp75 = icmp slt i32 %24, 10, !dbg !433
  br i1 %cmp75, label %for.body, label %for.end, !dbg !434

for.body:                                         ; preds = %for.cond
  %25 = load i32, i32* %i, align 4, !dbg !435
  %idxprom77 = sext i32 %25 to i64, !dbg !437
  %arrayidx78 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom77, !dbg !437
  %26 = load i32, i32* %arrayidx78, align 4, !dbg !437
  call void @printIntLine(i32 %26), !dbg !438
  br label %for.inc, !dbg !439

for.inc:                                          ; preds = %for.body
  %27 = load i32, i32* %i, align 4, !dbg !440
  %inc = add nsw i32 %27, 1, !dbg !440
  store i32 %inc, i32* %i, align 4, !dbg !440
  br label %for.cond, !dbg !441, !llvm.loop !442

for.end:                                          ; preds = %for.cond
  br label %if.end80, !dbg !444

if.else79:                                        ; preds = %land.lhs.true, %if.then67
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !445
  br label %if.end80

if.end80:                                         ; preds = %if.else79, %for.end
  br label %if.end103, !dbg !447

if.else81:                                        ; preds = %if.end64
  call void @llvm.dbg.declare(metadata i32* %i82, metadata !448, metadata !DIExpression()), !dbg !451
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer83, metadata !452, metadata !DIExpression()), !dbg !453
  %28 = bitcast [10 x i32]* %buffer83 to i8*, !dbg !453
  call void @llvm.memset.p0i8.i64(i8* align 16 %28, i8 0, i64 40, i1 false), !dbg !453
  %29 = load i32, i32* %data, align 4, !dbg !454
  %cmp84 = icmp sge i32 %29, 0, !dbg !456
  br i1 %cmp84, label %land.lhs.true86, label %if.else101, !dbg !457

land.lhs.true86:                                  ; preds = %if.else81
  %30 = load i32, i32* %data, align 4, !dbg !458
  %cmp87 = icmp slt i32 %30, 10, !dbg !459
  br i1 %cmp87, label %if.then89, label %if.else101, !dbg !460

if.then89:                                        ; preds = %land.lhs.true86
  %31 = load i32, i32* %data, align 4, !dbg !461
  %idxprom90 = sext i32 %31 to i64, !dbg !463
  %arrayidx91 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer83, i64 0, i64 %idxprom90, !dbg !463
  store i32 1, i32* %arrayidx91, align 4, !dbg !464
  store i32 0, i32* %i82, align 4, !dbg !465
  br label %for.cond92, !dbg !467

for.cond92:                                       ; preds = %for.inc98, %if.then89
  %32 = load i32, i32* %i82, align 4, !dbg !468
  %cmp93 = icmp slt i32 %32, 10, !dbg !470
  br i1 %cmp93, label %for.body95, label %for.end100, !dbg !471

for.body95:                                       ; preds = %for.cond92
  %33 = load i32, i32* %i82, align 4, !dbg !472
  %idxprom96 = sext i32 %33 to i64, !dbg !474
  %arrayidx97 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer83, i64 0, i64 %idxprom96, !dbg !474
  %34 = load i32, i32* %arrayidx97, align 4, !dbg !474
  call void @printIntLine(i32 %34), !dbg !475
  br label %for.inc98, !dbg !476

for.inc98:                                        ; preds = %for.body95
  %35 = load i32, i32* %i82, align 4, !dbg !477
  %inc99 = add nsw i32 %35, 1, !dbg !477
  store i32 %inc99, i32* %i82, align 4, !dbg !477
  br label %for.cond92, !dbg !478, !llvm.loop !479

for.end100:                                       ; preds = %for.cond92
  br label %if.end102, !dbg !481

if.else101:                                       ; preds = %land.lhs.true86, %if.else81
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !482
  br label %if.end102

if.end102:                                        ; preds = %if.else101, %for.end100
  br label %if.end103

if.end103:                                        ; preds = %if.end102, %if.end80
  ret void, !dbg !484
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !485 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i11 = alloca i32, align 4
  %buffer12 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !486, metadata !DIExpression()), !dbg !487
  store i32 -1, i32* %data, align 4, !dbg !488
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !489
  %tobool = icmp ne i32 %call, 0, !dbg !489
  br i1 %tobool, label %if.then, label %if.else, !dbg !491

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !492
  br label %if.end, !dbg !494

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !495
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !497
  %tobool2 = icmp ne i32 %call1, 0, !dbg !497
  br i1 %tobool2, label %if.then3, label %if.else10, !dbg !499

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !500, metadata !DIExpression()), !dbg !503
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !504, metadata !DIExpression()), !dbg !505
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !505
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !505
  %1 = load i32, i32* %data, align 4, !dbg !506
  %cmp = icmp sge i32 %1, 0, !dbg !508
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !509

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !510
  %idxprom = sext i32 %2 to i64, !dbg !512
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !512
  store i32 1, i32* %arrayidx, align 4, !dbg !513
  store i32 0, i32* %i, align 4, !dbg !514
  br label %for.cond, !dbg !516

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !517
  %cmp5 = icmp slt i32 %3, 10, !dbg !519
  br i1 %cmp5, label %for.body, label %for.end, !dbg !520

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !521
  %idxprom6 = sext i32 %4 to i64, !dbg !523
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !523
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !523
  call void @printIntLine(i32 %5), !dbg !524
  br label %for.inc, !dbg !525

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !526
  %inc = add nsw i32 %6, 1, !dbg !526
  store i32 %inc, i32* %i, align 4, !dbg !526
  br label %for.cond, !dbg !527, !llvm.loop !528

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !530

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !531
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end27, !dbg !533

if.else10:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !534, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer12, metadata !538, metadata !DIExpression()), !dbg !539
  %7 = bitcast [10 x i32]* %buffer12 to i8*, !dbg !539
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !539
  %8 = load i32, i32* %data, align 4, !dbg !540
  %cmp13 = icmp sge i32 %8, 0, !dbg !542
  br i1 %cmp13, label %if.then14, label %if.else25, !dbg !543

if.then14:                                        ; preds = %if.else10
  %9 = load i32, i32* %data, align 4, !dbg !544
  %idxprom15 = sext i32 %9 to i64, !dbg !546
  %arrayidx16 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom15, !dbg !546
  store i32 1, i32* %arrayidx16, align 4, !dbg !547
  store i32 0, i32* %i11, align 4, !dbg !548
  br label %for.cond17, !dbg !550

for.cond17:                                       ; preds = %for.inc22, %if.then14
  %10 = load i32, i32* %i11, align 4, !dbg !551
  %cmp18 = icmp slt i32 %10, 10, !dbg !553
  br i1 %cmp18, label %for.body19, label %for.end24, !dbg !554

for.body19:                                       ; preds = %for.cond17
  %11 = load i32, i32* %i11, align 4, !dbg !555
  %idxprom20 = sext i32 %11 to i64, !dbg !557
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom20, !dbg !557
  %12 = load i32, i32* %arrayidx21, align 4, !dbg !557
  call void @printIntLine(i32 %12), !dbg !558
  br label %for.inc22, !dbg !559

for.inc22:                                        ; preds = %for.body19
  %13 = load i32, i32* %i11, align 4, !dbg !560
  %inc23 = add nsw i32 %13, 1, !dbg !560
  store i32 %inc23, i32* %i11, align 4, !dbg !560
  br label %for.cond17, !dbg !561, !llvm.loop !562

for.end24:                                        ; preds = %for.cond17
  br label %if.end26, !dbg !564

if.else25:                                        ; preds = %if.else10
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !565
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %for.end24
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end9
  ret void, !dbg !567
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_12_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_12.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocation(line: 49, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 49, column: 8)
!76 = !DILocation(line: 49, column: 8, scope: !65)
!77 = !DILocalVariable(name: "recvResult", scope: !78, file: !66, line: 56, type: !71)
!78 = distinct !DILexicalBlock(scope: !79, file: !66, line: 51, column: 9)
!79 = distinct !DILexicalBlock(scope: !75, file: !66, line: 50, column: 5)
!80 = !DILocation(line: 56, column: 17, scope: !78)
!81 = !DILocalVariable(name: "service", scope: !78, file: !66, line: 57, type: !82)
!82 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !83)
!83 = !{!84, !85, !91, !98}
!84 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !82, file: !17, line: 240, baseType: !51, size: 16)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !82, file: !17, line: 241, baseType: !86, size: 16, offset: 16)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !88, line: 25, baseType: !89)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !90, line: 40, baseType: !53)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !82, file: !17, line: 242, baseType: !92, size: 32, offset: 32)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !93)
!93 = !{!94}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !92, file: !17, line: 33, baseType: !95, size: 32)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !88, line: 26, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !90, line: 42, baseType: !5)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !82, file: !17, line: 245, baseType: !99, size: 64, offset: 64)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 64, elements: !101)
!100 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!101 = !{!102}
!102 = !DISubrange(count: 8)
!103 = !DILocation(line: 57, column: 32, scope: !78)
!104 = !DILocalVariable(name: "connectSocket", scope: !78, file: !66, line: 58, type: !71)
!105 = !DILocation(line: 58, column: 20, scope: !78)
!106 = !DILocalVariable(name: "inputBuffer", scope: !78, file: !66, line: 59, type: !55)
!107 = !DILocation(line: 59, column: 18, scope: !78)
!108 = !DILocation(line: 60, column: 13, scope: !78)
!109 = !DILocation(line: 70, column: 33, scope: !110)
!110 = distinct !DILexicalBlock(scope: !78, file: !66, line: 61, column: 13)
!111 = !DILocation(line: 70, column: 31, scope: !110)
!112 = !DILocation(line: 71, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !66, line: 71, column: 21)
!114 = !DILocation(line: 71, column: 35, scope: !113)
!115 = !DILocation(line: 71, column: 21, scope: !110)
!116 = !DILocation(line: 73, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !66, line: 72, column: 17)
!118 = !DILocation(line: 75, column: 17, scope: !110)
!119 = !DILocation(line: 76, column: 25, scope: !110)
!120 = !DILocation(line: 76, column: 36, scope: !110)
!121 = !DILocation(line: 77, column: 43, scope: !110)
!122 = !DILocation(line: 77, column: 25, scope: !110)
!123 = !DILocation(line: 77, column: 34, scope: !110)
!124 = !DILocation(line: 77, column: 41, scope: !110)
!125 = !DILocation(line: 78, column: 36, scope: !110)
!126 = !DILocation(line: 78, column: 25, scope: !110)
!127 = !DILocation(line: 78, column: 34, scope: !110)
!128 = !DILocation(line: 79, column: 29, scope: !129)
!129 = distinct !DILexicalBlock(scope: !110, file: !66, line: 79, column: 21)
!130 = !DILocation(line: 79, column: 44, scope: !129)
!131 = !DILocation(line: 79, column: 21, scope: !129)
!132 = !DILocation(line: 79, column: 89, scope: !129)
!133 = !DILocation(line: 79, column: 21, scope: !110)
!134 = !DILocation(line: 81, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !66, line: 80, column: 17)
!136 = !DILocation(line: 85, column: 35, scope: !110)
!137 = !DILocation(line: 85, column: 50, scope: !110)
!138 = !DILocation(line: 85, column: 30, scope: !110)
!139 = !DILocation(line: 85, column: 28, scope: !110)
!140 = !DILocation(line: 86, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !110, file: !66, line: 86, column: 21)
!142 = !DILocation(line: 86, column: 32, scope: !141)
!143 = !DILocation(line: 86, column: 48, scope: !141)
!144 = !DILocation(line: 86, column: 51, scope: !141)
!145 = !DILocation(line: 86, column: 62, scope: !141)
!146 = !DILocation(line: 86, column: 21, scope: !110)
!147 = !DILocation(line: 88, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !141, file: !66, line: 87, column: 17)
!149 = !DILocation(line: 91, column: 29, scope: !110)
!150 = !DILocation(line: 91, column: 17, scope: !110)
!151 = !DILocation(line: 91, column: 41, scope: !110)
!152 = !DILocation(line: 93, column: 29, scope: !110)
!153 = !DILocation(line: 93, column: 24, scope: !110)
!154 = !DILocation(line: 93, column: 22, scope: !110)
!155 = !DILocation(line: 94, column: 13, scope: !110)
!156 = !DILocation(line: 96, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !78, file: !66, line: 96, column: 17)
!158 = !DILocation(line: 96, column: 31, scope: !157)
!159 = !DILocation(line: 96, column: 17, scope: !78)
!160 = !DILocation(line: 98, column: 30, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !66, line: 97, column: 13)
!162 = !DILocation(line: 98, column: 17, scope: !161)
!163 = !DILocation(line: 99, column: 13, scope: !161)
!164 = !DILocation(line: 107, column: 5, scope: !79)
!165 = !DILocation(line: 112, column: 14, scope: !166)
!166 = distinct !DILexicalBlock(scope: !75, file: !66, line: 109, column: 5)
!167 = !DILocation(line: 114, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !65, file: !66, line: 114, column: 8)
!169 = !DILocation(line: 114, column: 8, scope: !65)
!170 = !DILocalVariable(name: "i", scope: !171, file: !66, line: 117, type: !71)
!171 = distinct !DILexicalBlock(scope: !172, file: !66, line: 116, column: 9)
!172 = distinct !DILexicalBlock(scope: !168, file: !66, line: 115, column: 5)
!173 = !DILocation(line: 117, column: 17, scope: !171)
!174 = !DILocalVariable(name: "buffer", scope: !171, file: !66, line: 118, type: !175)
!175 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !176)
!176 = !{!177}
!177 = !DISubrange(count: 10)
!178 = !DILocation(line: 118, column: 17, scope: !171)
!179 = !DILocation(line: 121, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !171, file: !66, line: 121, column: 17)
!181 = !DILocation(line: 121, column: 22, scope: !180)
!182 = !DILocation(line: 121, column: 17, scope: !171)
!183 = !DILocation(line: 123, column: 24, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !66, line: 122, column: 13)
!185 = !DILocation(line: 123, column: 17, scope: !184)
!186 = !DILocation(line: 123, column: 30, scope: !184)
!187 = !DILocation(line: 125, column: 23, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !66, line: 125, column: 17)
!189 = !DILocation(line: 125, column: 21, scope: !188)
!190 = !DILocation(line: 125, column: 28, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !66, line: 125, column: 17)
!192 = !DILocation(line: 125, column: 30, scope: !191)
!193 = !DILocation(line: 125, column: 17, scope: !188)
!194 = !DILocation(line: 127, column: 41, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !66, line: 126, column: 17)
!196 = !DILocation(line: 127, column: 34, scope: !195)
!197 = !DILocation(line: 127, column: 21, scope: !195)
!198 = !DILocation(line: 128, column: 17, scope: !195)
!199 = !DILocation(line: 125, column: 37, scope: !191)
!200 = !DILocation(line: 125, column: 17, scope: !191)
!201 = distinct !{!201, !193, !202, !203}
!202 = !DILocation(line: 128, column: 17, scope: !188)
!203 = !{!"llvm.loop.mustprogress"}
!204 = !DILocation(line: 129, column: 13, scope: !184)
!205 = !DILocation(line: 132, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !180, file: !66, line: 131, column: 13)
!207 = !DILocation(line: 135, column: 5, scope: !172)
!208 = !DILocalVariable(name: "i", scope: !209, file: !66, line: 139, type: !71)
!209 = distinct !DILexicalBlock(scope: !210, file: !66, line: 138, column: 9)
!210 = distinct !DILexicalBlock(scope: !168, file: !66, line: 137, column: 5)
!211 = !DILocation(line: 139, column: 17, scope: !209)
!212 = !DILocalVariable(name: "buffer", scope: !209, file: !66, line: 140, type: !175)
!213 = !DILocation(line: 140, column: 17, scope: !209)
!214 = !DILocation(line: 142, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !209, file: !66, line: 142, column: 17)
!216 = !DILocation(line: 142, column: 22, scope: !215)
!217 = !DILocation(line: 142, column: 27, scope: !215)
!218 = !DILocation(line: 142, column: 30, scope: !215)
!219 = !DILocation(line: 142, column: 35, scope: !215)
!220 = !DILocation(line: 142, column: 17, scope: !209)
!221 = !DILocation(line: 144, column: 24, scope: !222)
!222 = distinct !DILexicalBlock(scope: !215, file: !66, line: 143, column: 13)
!223 = !DILocation(line: 144, column: 17, scope: !222)
!224 = !DILocation(line: 144, column: 30, scope: !222)
!225 = !DILocation(line: 146, column: 23, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !66, line: 146, column: 17)
!227 = !DILocation(line: 146, column: 21, scope: !226)
!228 = !DILocation(line: 146, column: 28, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !66, line: 146, column: 17)
!230 = !DILocation(line: 146, column: 30, scope: !229)
!231 = !DILocation(line: 146, column: 17, scope: !226)
!232 = !DILocation(line: 148, column: 41, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !66, line: 147, column: 17)
!234 = !DILocation(line: 148, column: 34, scope: !233)
!235 = !DILocation(line: 148, column: 21, scope: !233)
!236 = !DILocation(line: 149, column: 17, scope: !233)
!237 = !DILocation(line: 146, column: 37, scope: !229)
!238 = !DILocation(line: 146, column: 17, scope: !229)
!239 = distinct !{!239, !231, !240, !203}
!240 = !DILocation(line: 149, column: 17, scope: !226)
!241 = !DILocation(line: 150, column: 13, scope: !222)
!242 = !DILocation(line: 153, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !215, file: !66, line: 152, column: 13)
!244 = !DILocation(line: 157, column: 1, scope: !65)
!245 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_12_good", scope: !66, file: !66, line: 399, type: !67, scopeLine: 400, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!246 = !DILocation(line: 401, column: 5, scope: !245)
!247 = !DILocation(line: 402, column: 5, scope: !245)
!248 = !DILocation(line: 403, column: 1, scope: !245)
!249 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 414, type: !250, scopeLine: 415, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!250 = !DISubroutineType(types: !251)
!251 = !{!71, !71, !252}
!252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !253, size: 64)
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!254 = !DILocalVariable(name: "argc", arg: 1, scope: !249, file: !66, line: 414, type: !71)
!255 = !DILocation(line: 414, column: 14, scope: !249)
!256 = !DILocalVariable(name: "argv", arg: 2, scope: !249, file: !66, line: 414, type: !252)
!257 = !DILocation(line: 414, column: 27, scope: !249)
!258 = !DILocation(line: 417, column: 22, scope: !249)
!259 = !DILocation(line: 417, column: 12, scope: !249)
!260 = !DILocation(line: 417, column: 5, scope: !249)
!261 = !DILocation(line: 419, column: 5, scope: !249)
!262 = !DILocation(line: 420, column: 5, scope: !249)
!263 = !DILocation(line: 421, column: 5, scope: !249)
!264 = !DILocation(line: 424, column: 5, scope: !249)
!265 = !DILocation(line: 425, column: 5, scope: !249)
!266 = !DILocation(line: 426, column: 5, scope: !249)
!267 = !DILocation(line: 428, column: 5, scope: !249)
!268 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 166, type: !67, scopeLine: 167, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!269 = !DILocalVariable(name: "data", scope: !268, file: !66, line: 168, type: !71)
!270 = !DILocation(line: 168, column: 9, scope: !268)
!271 = !DILocation(line: 170, column: 10, scope: !268)
!272 = !DILocation(line: 171, column: 8, scope: !273)
!273 = distinct !DILexicalBlock(scope: !268, file: !66, line: 171, column: 8)
!274 = !DILocation(line: 171, column: 8, scope: !268)
!275 = !DILocalVariable(name: "recvResult", scope: !276, file: !66, line: 178, type: !71)
!276 = distinct !DILexicalBlock(scope: !277, file: !66, line: 173, column: 9)
!277 = distinct !DILexicalBlock(scope: !273, file: !66, line: 172, column: 5)
!278 = !DILocation(line: 178, column: 17, scope: !276)
!279 = !DILocalVariable(name: "service", scope: !276, file: !66, line: 179, type: !82)
!280 = !DILocation(line: 179, column: 32, scope: !276)
!281 = !DILocalVariable(name: "connectSocket", scope: !276, file: !66, line: 180, type: !71)
!282 = !DILocation(line: 180, column: 20, scope: !276)
!283 = !DILocalVariable(name: "inputBuffer", scope: !276, file: !66, line: 181, type: !55)
!284 = !DILocation(line: 181, column: 18, scope: !276)
!285 = !DILocation(line: 182, column: 13, scope: !276)
!286 = !DILocation(line: 192, column: 33, scope: !287)
!287 = distinct !DILexicalBlock(scope: !276, file: !66, line: 183, column: 13)
!288 = !DILocation(line: 192, column: 31, scope: !287)
!289 = !DILocation(line: 193, column: 21, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !66, line: 193, column: 21)
!291 = !DILocation(line: 193, column: 35, scope: !290)
!292 = !DILocation(line: 193, column: 21, scope: !287)
!293 = !DILocation(line: 195, column: 21, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !66, line: 194, column: 17)
!295 = !DILocation(line: 197, column: 17, scope: !287)
!296 = !DILocation(line: 198, column: 25, scope: !287)
!297 = !DILocation(line: 198, column: 36, scope: !287)
!298 = !DILocation(line: 199, column: 43, scope: !287)
!299 = !DILocation(line: 199, column: 25, scope: !287)
!300 = !DILocation(line: 199, column: 34, scope: !287)
!301 = !DILocation(line: 199, column: 41, scope: !287)
!302 = !DILocation(line: 200, column: 36, scope: !287)
!303 = !DILocation(line: 200, column: 25, scope: !287)
!304 = !DILocation(line: 200, column: 34, scope: !287)
!305 = !DILocation(line: 201, column: 29, scope: !306)
!306 = distinct !DILexicalBlock(scope: !287, file: !66, line: 201, column: 21)
!307 = !DILocation(line: 201, column: 44, scope: !306)
!308 = !DILocation(line: 201, column: 21, scope: !306)
!309 = !DILocation(line: 201, column: 89, scope: !306)
!310 = !DILocation(line: 201, column: 21, scope: !287)
!311 = !DILocation(line: 203, column: 21, scope: !312)
!312 = distinct !DILexicalBlock(scope: !306, file: !66, line: 202, column: 17)
!313 = !DILocation(line: 207, column: 35, scope: !287)
!314 = !DILocation(line: 207, column: 50, scope: !287)
!315 = !DILocation(line: 207, column: 30, scope: !287)
!316 = !DILocation(line: 207, column: 28, scope: !287)
!317 = !DILocation(line: 208, column: 21, scope: !318)
!318 = distinct !DILexicalBlock(scope: !287, file: !66, line: 208, column: 21)
!319 = !DILocation(line: 208, column: 32, scope: !318)
!320 = !DILocation(line: 208, column: 48, scope: !318)
!321 = !DILocation(line: 208, column: 51, scope: !318)
!322 = !DILocation(line: 208, column: 62, scope: !318)
!323 = !DILocation(line: 208, column: 21, scope: !287)
!324 = !DILocation(line: 210, column: 21, scope: !325)
!325 = distinct !DILexicalBlock(scope: !318, file: !66, line: 209, column: 17)
!326 = !DILocation(line: 213, column: 29, scope: !287)
!327 = !DILocation(line: 213, column: 17, scope: !287)
!328 = !DILocation(line: 213, column: 41, scope: !287)
!329 = !DILocation(line: 215, column: 29, scope: !287)
!330 = !DILocation(line: 215, column: 24, scope: !287)
!331 = !DILocation(line: 215, column: 22, scope: !287)
!332 = !DILocation(line: 216, column: 13, scope: !287)
!333 = !DILocation(line: 218, column: 17, scope: !334)
!334 = distinct !DILexicalBlock(scope: !276, file: !66, line: 218, column: 17)
!335 = !DILocation(line: 218, column: 31, scope: !334)
!336 = !DILocation(line: 218, column: 17, scope: !276)
!337 = !DILocation(line: 220, column: 30, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !66, line: 219, column: 13)
!339 = !DILocation(line: 220, column: 17, scope: !338)
!340 = !DILocation(line: 221, column: 13, scope: !338)
!341 = !DILocation(line: 229, column: 5, scope: !277)
!342 = !DILocalVariable(name: "recvResult", scope: !343, file: !66, line: 237, type: !71)
!343 = distinct !DILexicalBlock(scope: !344, file: !66, line: 232, column: 9)
!344 = distinct !DILexicalBlock(scope: !273, file: !66, line: 231, column: 5)
!345 = !DILocation(line: 237, column: 17, scope: !343)
!346 = !DILocalVariable(name: "service", scope: !343, file: !66, line: 238, type: !82)
!347 = !DILocation(line: 238, column: 32, scope: !343)
!348 = !DILocalVariable(name: "connectSocket", scope: !343, file: !66, line: 239, type: !71)
!349 = !DILocation(line: 239, column: 20, scope: !343)
!350 = !DILocalVariable(name: "inputBuffer", scope: !343, file: !66, line: 240, type: !55)
!351 = !DILocation(line: 240, column: 18, scope: !343)
!352 = !DILocation(line: 241, column: 13, scope: !343)
!353 = !DILocation(line: 251, column: 33, scope: !354)
!354 = distinct !DILexicalBlock(scope: !343, file: !66, line: 242, column: 13)
!355 = !DILocation(line: 251, column: 31, scope: !354)
!356 = !DILocation(line: 252, column: 21, scope: !357)
!357 = distinct !DILexicalBlock(scope: !354, file: !66, line: 252, column: 21)
!358 = !DILocation(line: 252, column: 35, scope: !357)
!359 = !DILocation(line: 252, column: 21, scope: !354)
!360 = !DILocation(line: 254, column: 21, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !66, line: 253, column: 17)
!362 = !DILocation(line: 256, column: 17, scope: !354)
!363 = !DILocation(line: 257, column: 25, scope: !354)
!364 = !DILocation(line: 257, column: 36, scope: !354)
!365 = !DILocation(line: 258, column: 43, scope: !354)
!366 = !DILocation(line: 258, column: 25, scope: !354)
!367 = !DILocation(line: 258, column: 34, scope: !354)
!368 = !DILocation(line: 258, column: 41, scope: !354)
!369 = !DILocation(line: 259, column: 36, scope: !354)
!370 = !DILocation(line: 259, column: 25, scope: !354)
!371 = !DILocation(line: 259, column: 34, scope: !354)
!372 = !DILocation(line: 260, column: 29, scope: !373)
!373 = distinct !DILexicalBlock(scope: !354, file: !66, line: 260, column: 21)
!374 = !DILocation(line: 260, column: 44, scope: !373)
!375 = !DILocation(line: 260, column: 21, scope: !373)
!376 = !DILocation(line: 260, column: 89, scope: !373)
!377 = !DILocation(line: 260, column: 21, scope: !354)
!378 = !DILocation(line: 262, column: 21, scope: !379)
!379 = distinct !DILexicalBlock(scope: !373, file: !66, line: 261, column: 17)
!380 = !DILocation(line: 266, column: 35, scope: !354)
!381 = !DILocation(line: 266, column: 50, scope: !354)
!382 = !DILocation(line: 266, column: 30, scope: !354)
!383 = !DILocation(line: 266, column: 28, scope: !354)
!384 = !DILocation(line: 267, column: 21, scope: !385)
!385 = distinct !DILexicalBlock(scope: !354, file: !66, line: 267, column: 21)
!386 = !DILocation(line: 267, column: 32, scope: !385)
!387 = !DILocation(line: 267, column: 48, scope: !385)
!388 = !DILocation(line: 267, column: 51, scope: !385)
!389 = !DILocation(line: 267, column: 62, scope: !385)
!390 = !DILocation(line: 267, column: 21, scope: !354)
!391 = !DILocation(line: 269, column: 21, scope: !392)
!392 = distinct !DILexicalBlock(scope: !385, file: !66, line: 268, column: 17)
!393 = !DILocation(line: 272, column: 29, scope: !354)
!394 = !DILocation(line: 272, column: 17, scope: !354)
!395 = !DILocation(line: 272, column: 41, scope: !354)
!396 = !DILocation(line: 274, column: 29, scope: !354)
!397 = !DILocation(line: 274, column: 24, scope: !354)
!398 = !DILocation(line: 274, column: 22, scope: !354)
!399 = !DILocation(line: 275, column: 13, scope: !354)
!400 = !DILocation(line: 277, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !343, file: !66, line: 277, column: 17)
!402 = !DILocation(line: 277, column: 31, scope: !401)
!403 = !DILocation(line: 277, column: 17, scope: !343)
!404 = !DILocation(line: 279, column: 30, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !66, line: 278, column: 13)
!406 = !DILocation(line: 279, column: 17, scope: !405)
!407 = !DILocation(line: 280, column: 13, scope: !405)
!408 = !DILocation(line: 289, column: 8, scope: !409)
!409 = distinct !DILexicalBlock(scope: !268, file: !66, line: 289, column: 8)
!410 = !DILocation(line: 289, column: 8, scope: !268)
!411 = !DILocalVariable(name: "i", scope: !412, file: !66, line: 292, type: !71)
!412 = distinct !DILexicalBlock(scope: !413, file: !66, line: 291, column: 9)
!413 = distinct !DILexicalBlock(scope: !409, file: !66, line: 290, column: 5)
!414 = !DILocation(line: 292, column: 17, scope: !412)
!415 = !DILocalVariable(name: "buffer", scope: !412, file: !66, line: 293, type: !175)
!416 = !DILocation(line: 293, column: 17, scope: !412)
!417 = !DILocation(line: 295, column: 17, scope: !418)
!418 = distinct !DILexicalBlock(scope: !412, file: !66, line: 295, column: 17)
!419 = !DILocation(line: 295, column: 22, scope: !418)
!420 = !DILocation(line: 295, column: 27, scope: !418)
!421 = !DILocation(line: 295, column: 30, scope: !418)
!422 = !DILocation(line: 295, column: 35, scope: !418)
!423 = !DILocation(line: 295, column: 17, scope: !412)
!424 = !DILocation(line: 297, column: 24, scope: !425)
!425 = distinct !DILexicalBlock(scope: !418, file: !66, line: 296, column: 13)
!426 = !DILocation(line: 297, column: 17, scope: !425)
!427 = !DILocation(line: 297, column: 30, scope: !425)
!428 = !DILocation(line: 299, column: 23, scope: !429)
!429 = distinct !DILexicalBlock(scope: !425, file: !66, line: 299, column: 17)
!430 = !DILocation(line: 299, column: 21, scope: !429)
!431 = !DILocation(line: 299, column: 28, scope: !432)
!432 = distinct !DILexicalBlock(scope: !429, file: !66, line: 299, column: 17)
!433 = !DILocation(line: 299, column: 30, scope: !432)
!434 = !DILocation(line: 299, column: 17, scope: !429)
!435 = !DILocation(line: 301, column: 41, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !66, line: 300, column: 17)
!437 = !DILocation(line: 301, column: 34, scope: !436)
!438 = !DILocation(line: 301, column: 21, scope: !436)
!439 = !DILocation(line: 302, column: 17, scope: !436)
!440 = !DILocation(line: 299, column: 37, scope: !432)
!441 = !DILocation(line: 299, column: 17, scope: !432)
!442 = distinct !{!442, !434, !443, !203}
!443 = !DILocation(line: 302, column: 17, scope: !429)
!444 = !DILocation(line: 303, column: 13, scope: !425)
!445 = !DILocation(line: 306, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !418, file: !66, line: 305, column: 13)
!447 = !DILocation(line: 309, column: 5, scope: !413)
!448 = !DILocalVariable(name: "i", scope: !449, file: !66, line: 313, type: !71)
!449 = distinct !DILexicalBlock(scope: !450, file: !66, line: 312, column: 9)
!450 = distinct !DILexicalBlock(scope: !409, file: !66, line: 311, column: 5)
!451 = !DILocation(line: 313, column: 17, scope: !449)
!452 = !DILocalVariable(name: "buffer", scope: !449, file: !66, line: 314, type: !175)
!453 = !DILocation(line: 314, column: 17, scope: !449)
!454 = !DILocation(line: 316, column: 17, scope: !455)
!455 = distinct !DILexicalBlock(scope: !449, file: !66, line: 316, column: 17)
!456 = !DILocation(line: 316, column: 22, scope: !455)
!457 = !DILocation(line: 316, column: 27, scope: !455)
!458 = !DILocation(line: 316, column: 30, scope: !455)
!459 = !DILocation(line: 316, column: 35, scope: !455)
!460 = !DILocation(line: 316, column: 17, scope: !449)
!461 = !DILocation(line: 318, column: 24, scope: !462)
!462 = distinct !DILexicalBlock(scope: !455, file: !66, line: 317, column: 13)
!463 = !DILocation(line: 318, column: 17, scope: !462)
!464 = !DILocation(line: 318, column: 30, scope: !462)
!465 = !DILocation(line: 320, column: 23, scope: !466)
!466 = distinct !DILexicalBlock(scope: !462, file: !66, line: 320, column: 17)
!467 = !DILocation(line: 320, column: 21, scope: !466)
!468 = !DILocation(line: 320, column: 28, scope: !469)
!469 = distinct !DILexicalBlock(scope: !466, file: !66, line: 320, column: 17)
!470 = !DILocation(line: 320, column: 30, scope: !469)
!471 = !DILocation(line: 320, column: 17, scope: !466)
!472 = !DILocation(line: 322, column: 41, scope: !473)
!473 = distinct !DILexicalBlock(scope: !469, file: !66, line: 321, column: 17)
!474 = !DILocation(line: 322, column: 34, scope: !473)
!475 = !DILocation(line: 322, column: 21, scope: !473)
!476 = !DILocation(line: 323, column: 17, scope: !473)
!477 = !DILocation(line: 320, column: 37, scope: !469)
!478 = !DILocation(line: 320, column: 17, scope: !469)
!479 = distinct !{!479, !471, !480, !203}
!480 = !DILocation(line: 323, column: 17, scope: !466)
!481 = !DILocation(line: 324, column: 13, scope: !462)
!482 = !DILocation(line: 327, column: 17, scope: !483)
!483 = distinct !DILexicalBlock(scope: !455, file: !66, line: 326, column: 13)
!484 = !DILocation(line: 331, column: 1, scope: !268)
!485 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 336, type: !67, scopeLine: 337, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!486 = !DILocalVariable(name: "data", scope: !485, file: !66, line: 338, type: !71)
!487 = !DILocation(line: 338, column: 9, scope: !485)
!488 = !DILocation(line: 340, column: 10, scope: !485)
!489 = !DILocation(line: 341, column: 8, scope: !490)
!490 = distinct !DILexicalBlock(scope: !485, file: !66, line: 341, column: 8)
!491 = !DILocation(line: 341, column: 8, scope: !485)
!492 = !DILocation(line: 345, column: 14, scope: !493)
!493 = distinct !DILexicalBlock(scope: !490, file: !66, line: 342, column: 5)
!494 = !DILocation(line: 346, column: 5, scope: !493)
!495 = !DILocation(line: 351, column: 14, scope: !496)
!496 = distinct !DILexicalBlock(scope: !490, file: !66, line: 348, column: 5)
!497 = !DILocation(line: 353, column: 8, scope: !498)
!498 = distinct !DILexicalBlock(scope: !485, file: !66, line: 353, column: 8)
!499 = !DILocation(line: 353, column: 8, scope: !485)
!500 = !DILocalVariable(name: "i", scope: !501, file: !66, line: 356, type: !71)
!501 = distinct !DILexicalBlock(scope: !502, file: !66, line: 355, column: 9)
!502 = distinct !DILexicalBlock(scope: !498, file: !66, line: 354, column: 5)
!503 = !DILocation(line: 356, column: 17, scope: !501)
!504 = !DILocalVariable(name: "buffer", scope: !501, file: !66, line: 357, type: !175)
!505 = !DILocation(line: 357, column: 17, scope: !501)
!506 = !DILocation(line: 360, column: 17, scope: !507)
!507 = distinct !DILexicalBlock(scope: !501, file: !66, line: 360, column: 17)
!508 = !DILocation(line: 360, column: 22, scope: !507)
!509 = !DILocation(line: 360, column: 17, scope: !501)
!510 = !DILocation(line: 362, column: 24, scope: !511)
!511 = distinct !DILexicalBlock(scope: !507, file: !66, line: 361, column: 13)
!512 = !DILocation(line: 362, column: 17, scope: !511)
!513 = !DILocation(line: 362, column: 30, scope: !511)
!514 = !DILocation(line: 364, column: 23, scope: !515)
!515 = distinct !DILexicalBlock(scope: !511, file: !66, line: 364, column: 17)
!516 = !DILocation(line: 364, column: 21, scope: !515)
!517 = !DILocation(line: 364, column: 28, scope: !518)
!518 = distinct !DILexicalBlock(scope: !515, file: !66, line: 364, column: 17)
!519 = !DILocation(line: 364, column: 30, scope: !518)
!520 = !DILocation(line: 364, column: 17, scope: !515)
!521 = !DILocation(line: 366, column: 41, scope: !522)
!522 = distinct !DILexicalBlock(scope: !518, file: !66, line: 365, column: 17)
!523 = !DILocation(line: 366, column: 34, scope: !522)
!524 = !DILocation(line: 366, column: 21, scope: !522)
!525 = !DILocation(line: 367, column: 17, scope: !522)
!526 = !DILocation(line: 364, column: 37, scope: !518)
!527 = !DILocation(line: 364, column: 17, scope: !518)
!528 = distinct !{!528, !520, !529, !203}
!529 = !DILocation(line: 367, column: 17, scope: !515)
!530 = !DILocation(line: 368, column: 13, scope: !511)
!531 = !DILocation(line: 371, column: 17, scope: !532)
!532 = distinct !DILexicalBlock(scope: !507, file: !66, line: 370, column: 13)
!533 = !DILocation(line: 374, column: 5, scope: !502)
!534 = !DILocalVariable(name: "i", scope: !535, file: !66, line: 378, type: !71)
!535 = distinct !DILexicalBlock(scope: !536, file: !66, line: 377, column: 9)
!536 = distinct !DILexicalBlock(scope: !498, file: !66, line: 376, column: 5)
!537 = !DILocation(line: 378, column: 17, scope: !535)
!538 = !DILocalVariable(name: "buffer", scope: !535, file: !66, line: 379, type: !175)
!539 = !DILocation(line: 379, column: 17, scope: !535)
!540 = !DILocation(line: 382, column: 17, scope: !541)
!541 = distinct !DILexicalBlock(scope: !535, file: !66, line: 382, column: 17)
!542 = !DILocation(line: 382, column: 22, scope: !541)
!543 = !DILocation(line: 382, column: 17, scope: !535)
!544 = !DILocation(line: 384, column: 24, scope: !545)
!545 = distinct !DILexicalBlock(scope: !541, file: !66, line: 383, column: 13)
!546 = !DILocation(line: 384, column: 17, scope: !545)
!547 = !DILocation(line: 384, column: 30, scope: !545)
!548 = !DILocation(line: 386, column: 23, scope: !549)
!549 = distinct !DILexicalBlock(scope: !545, file: !66, line: 386, column: 17)
!550 = !DILocation(line: 386, column: 21, scope: !549)
!551 = !DILocation(line: 386, column: 28, scope: !552)
!552 = distinct !DILexicalBlock(scope: !549, file: !66, line: 386, column: 17)
!553 = !DILocation(line: 386, column: 30, scope: !552)
!554 = !DILocation(line: 386, column: 17, scope: !549)
!555 = !DILocation(line: 388, column: 41, scope: !556)
!556 = distinct !DILexicalBlock(scope: !552, file: !66, line: 387, column: 17)
!557 = !DILocation(line: 388, column: 34, scope: !556)
!558 = !DILocation(line: 388, column: 21, scope: !556)
!559 = !DILocation(line: 389, column: 17, scope: !556)
!560 = !DILocation(line: 386, column: 37, scope: !552)
!561 = !DILocation(line: 386, column: 17, scope: !552)
!562 = distinct !{!562, !554, !563, !203}
!563 = !DILocation(line: 389, column: 17, scope: !549)
!564 = !DILocation(line: 390, column: 13, scope: !545)
!565 = !DILocation(line: 393, column: 17, scope: !566)
!566 = distinct !DILexicalBlock(scope: !541, file: !66, line: 392, column: 13)
!567 = !DILocation(line: 397, column: 1, scope: !485)
