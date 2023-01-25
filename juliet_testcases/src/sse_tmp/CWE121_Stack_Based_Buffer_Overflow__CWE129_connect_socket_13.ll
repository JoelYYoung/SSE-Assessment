; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_13_bad() #0 !dbg !65 {
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
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !74
  %cmp = icmp eq i32 %0, 5, !dbg !76
  br i1 %cmp, label %if.then, label %if.end23, !dbg !77

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !78, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !82, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %connectSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  br label %do.body, !dbg !109

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !110
  store i32 %call, i32* %connectSocket, align 4, !dbg !112
  %1 = load i32, i32* %connectSocket, align 4, !dbg !113
  %cmp1 = icmp eq i32 %1, -1, !dbg !115
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !116

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !117

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !119
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !120
  store i16 2, i16* %sin_family, align 4, !dbg !121
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !122
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !123
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !124
  store i32 %call3, i32* %s_addr, align 4, !dbg !125
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !126
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !127
  store i16 %call4, i16* %sin_port, align 2, !dbg !128
  %3 = load i32, i32* %connectSocket, align 4, !dbg !129
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !131
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !132
  %cmp6 = icmp eq i32 %call5, -1, !dbg !133
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !134

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !135

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !137
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !138
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !139
  %conv = trunc i64 %call9 to i32, !dbg !139
  store i32 %conv, i32* %recvResult, align 4, !dbg !140
  %6 = load i32, i32* %recvResult, align 4, !dbg !141
  %cmp10 = icmp eq i32 %6, -1, !dbg !143
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !144

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !145
  %cmp12 = icmp eq i32 %7, 0, !dbg !146
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !147

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !148

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !150
  %idxprom = sext i32 %8 to i64, !dbg !151
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !151
  store i8 0, i8* %arrayidx, align 1, !dbg !152
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !153
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !154
  store i32 %call17, i32* %data, align 4, !dbg !155
  br label %do.end, !dbg !156

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !157
  %cmp18 = icmp ne i32 %9, -1, !dbg !159
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !160

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !161
  %call21 = call i32 @close(i32 %10), !dbg !163
  br label %if.end22, !dbg !164

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !165

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !166
  %cmp24 = icmp eq i32 %11, 5, !dbg !168
  br i1 %cmp24, label %if.then26, label %if.end37, !dbg !169

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !170, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !174, metadata !DIExpression()), !dbg !178
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !178
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !178
  %13 = load i32, i32* %data, align 4, !dbg !179
  %cmp27 = icmp sge i32 %13, 0, !dbg !181
  br i1 %cmp27, label %if.then29, label %if.else, !dbg !182

if.then29:                                        ; preds = %if.then26
  %14 = load i32, i32* %data, align 4, !dbg !183
  %idxprom30 = sext i32 %14 to i64, !dbg !185
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !185
  store i32 1, i32* %arrayidx31, align 4, !dbg !186
  store i32 0, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %if.then29
  %15 = load i32, i32* %i, align 4, !dbg !190
  %cmp32 = icmp slt i32 %15, 10, !dbg !192
  br i1 %cmp32, label %for.body, label %for.end, !dbg !193

for.body:                                         ; preds = %for.cond
  %16 = load i32, i32* %i, align 4, !dbg !194
  %idxprom34 = sext i32 %16 to i64, !dbg !196
  %arrayidx35 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom34, !dbg !196
  %17 = load i32, i32* %arrayidx35, align 4, !dbg !196
  call void @printIntLine(i32 %17), !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4, !dbg !199
  %inc = add nsw i32 %18, 1, !dbg !199
  store i32 %inc, i32* %i, align 4, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  br label %if.end36, !dbg !204

if.else:                                          ; preds = %if.then26
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !205
  br label %if.end36

if.end36:                                         ; preds = %if.else, %for.end
  br label %if.end37, !dbg !207

if.end37:                                         ; preds = %if.end36, %if.end23
  ret void, !dbg !208
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_13_good() #0 !dbg !209 {
entry:
  call void @goodB2G1(), !dbg !210
  call void @goodB2G2(), !dbg !211
  call void @goodG2B1(), !dbg !212
  call void @goodG2B2(), !dbg !213
  ret void, !dbg !214
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !215 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !220, metadata !DIExpression()), !dbg !221
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !222, metadata !DIExpression()), !dbg !223
  %call = call i64 @time(i64* null) #7, !dbg !224
  %conv = trunc i64 %call to i32, !dbg !225
  call void @srand(i32 %conv) #7, !dbg !226
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !227
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_13_good(), !dbg !228
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !229
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !230
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_13_bad(), !dbg !231
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !232
  ret i32 0, !dbg !233
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !234 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !235, metadata !DIExpression()), !dbg !236
  store i32 -1, i32* %data, align 4, !dbg !237
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !238
  %cmp = icmp eq i32 %0, 5, !dbg !240
  br i1 %cmp, label %if.then, label %if.end23, !dbg !241

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !242, metadata !DIExpression()), !dbg !245
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !246, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !248, metadata !DIExpression()), !dbg !249
  store i32 -1, i32* %connectSocket, align 4, !dbg !249
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !250, metadata !DIExpression()), !dbg !251
  br label %do.body, !dbg !252

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !253
  store i32 %call, i32* %connectSocket, align 4, !dbg !255
  %1 = load i32, i32* %connectSocket, align 4, !dbg !256
  %cmp1 = icmp eq i32 %1, -1, !dbg !258
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !259

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !260

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !262
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !262
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !263
  store i16 2, i16* %sin_family, align 4, !dbg !264
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !265
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !266
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !267
  store i32 %call3, i32* %s_addr, align 4, !dbg !268
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !269
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !270
  store i16 %call4, i16* %sin_port, align 2, !dbg !271
  %3 = load i32, i32* %connectSocket, align 4, !dbg !272
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !274
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !275
  %cmp6 = icmp eq i32 %call5, -1, !dbg !276
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !277

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !278

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !280
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !281
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !282
  %conv = trunc i64 %call9 to i32, !dbg !282
  store i32 %conv, i32* %recvResult, align 4, !dbg !283
  %6 = load i32, i32* %recvResult, align 4, !dbg !284
  %cmp10 = icmp eq i32 %6, -1, !dbg !286
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !287

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !288
  %cmp12 = icmp eq i32 %7, 0, !dbg !289
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !290

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !291

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !293
  %idxprom = sext i32 %8 to i64, !dbg !294
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !294
  store i8 0, i8* %arrayidx, align 1, !dbg !295
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !296
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !297
  store i32 %call17, i32* %data, align 4, !dbg !298
  br label %do.end, !dbg !299

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !300
  %cmp18 = icmp ne i32 %9, -1, !dbg !302
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !303

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !304
  %call21 = call i32 @close(i32 %10), !dbg !306
  br label %if.end22, !dbg !307

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !308

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !309
  %cmp24 = icmp ne i32 %11, 5, !dbg !311
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !312

if.then26:                                        ; preds = %if.end23
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !313
  br label %if.end40, !dbg !315

if.else:                                          ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !316, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !320, metadata !DIExpression()), !dbg !321
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !321
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !321
  %13 = load i32, i32* %data, align 4, !dbg !322
  %cmp27 = icmp sge i32 %13, 0, !dbg !324
  br i1 %cmp27, label %land.lhs.true, label %if.else38, !dbg !325

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32, i32* %data, align 4, !dbg !326
  %cmp29 = icmp slt i32 %14, 10, !dbg !327
  br i1 %cmp29, label %if.then31, label %if.else38, !dbg !328

if.then31:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !329
  %idxprom32 = sext i32 %15 to i64, !dbg !331
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !331
  store i32 1, i32* %arrayidx33, align 4, !dbg !332
  store i32 0, i32* %i, align 4, !dbg !333
  br label %for.cond, !dbg !335

for.cond:                                         ; preds = %for.inc, %if.then31
  %16 = load i32, i32* %i, align 4, !dbg !336
  %cmp34 = icmp slt i32 %16, 10, !dbg !338
  br i1 %cmp34, label %for.body, label %for.end, !dbg !339

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !340
  %idxprom36 = sext i32 %17 to i64, !dbg !342
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !342
  %18 = load i32, i32* %arrayidx37, align 4, !dbg !342
  call void @printIntLine(i32 %18), !dbg !343
  br label %for.inc, !dbg !344

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !345
  %inc = add nsw i32 %19, 1, !dbg !345
  store i32 %inc, i32* %i, align 4, !dbg !345
  br label %for.cond, !dbg !346, !llvm.loop !347

for.end:                                          ; preds = %for.cond
  br label %if.end39, !dbg !349

if.else38:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !350
  br label %if.end39

if.end39:                                         ; preds = %if.else38, %for.end
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.then26
  ret void, !dbg !352
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !353 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !354, metadata !DIExpression()), !dbg !355
  store i32 -1, i32* %data, align 4, !dbg !356
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !357
  %cmp = icmp eq i32 %0, 5, !dbg !359
  br i1 %cmp, label %if.then, label %if.end23, !dbg !360

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !361, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !365, metadata !DIExpression()), !dbg !366
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !367, metadata !DIExpression()), !dbg !368
  store i32 -1, i32* %connectSocket, align 4, !dbg !368
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !369, metadata !DIExpression()), !dbg !370
  br label %do.body, !dbg !371

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !372
  store i32 %call, i32* %connectSocket, align 4, !dbg !374
  %1 = load i32, i32* %connectSocket, align 4, !dbg !375
  %cmp1 = icmp eq i32 %1, -1, !dbg !377
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !378

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !379

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !381
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !381
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !382
  store i16 2, i16* %sin_family, align 4, !dbg !383
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !384
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !385
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !386
  store i32 %call3, i32* %s_addr, align 4, !dbg !387
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !388
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !389
  store i16 %call4, i16* %sin_port, align 2, !dbg !390
  %3 = load i32, i32* %connectSocket, align 4, !dbg !391
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !393
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !394
  %cmp6 = icmp eq i32 %call5, -1, !dbg !395
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !396

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !397

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !399
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !400
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !401
  %conv = trunc i64 %call9 to i32, !dbg !401
  store i32 %conv, i32* %recvResult, align 4, !dbg !402
  %6 = load i32, i32* %recvResult, align 4, !dbg !403
  %cmp10 = icmp eq i32 %6, -1, !dbg !405
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !406

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !407
  %cmp12 = icmp eq i32 %7, 0, !dbg !408
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !409

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !410

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !412
  %idxprom = sext i32 %8 to i64, !dbg !413
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !413
  store i8 0, i8* %arrayidx, align 1, !dbg !414
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !415
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !416
  store i32 %call17, i32* %data, align 4, !dbg !417
  br label %do.end, !dbg !418

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !419
  %cmp18 = icmp ne i32 %9, -1, !dbg !421
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !422

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !423
  %call21 = call i32 @close(i32 %10), !dbg !425
  br label %if.end22, !dbg !426

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !427

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !428
  %cmp24 = icmp eq i32 %11, 5, !dbg !430
  br i1 %cmp24, label %if.then26, label %if.end39, !dbg !431

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !432, metadata !DIExpression()), !dbg !435
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !436, metadata !DIExpression()), !dbg !437
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !437
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !437
  %13 = load i32, i32* %data, align 4, !dbg !438
  %cmp27 = icmp sge i32 %13, 0, !dbg !440
  br i1 %cmp27, label %land.lhs.true, label %if.else, !dbg !441

land.lhs.true:                                    ; preds = %if.then26
  %14 = load i32, i32* %data, align 4, !dbg !442
  %cmp29 = icmp slt i32 %14, 10, !dbg !443
  br i1 %cmp29, label %if.then31, label %if.else, !dbg !444

if.then31:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !445
  %idxprom32 = sext i32 %15 to i64, !dbg !447
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !447
  store i32 1, i32* %arrayidx33, align 4, !dbg !448
  store i32 0, i32* %i, align 4, !dbg !449
  br label %for.cond, !dbg !451

for.cond:                                         ; preds = %for.inc, %if.then31
  %16 = load i32, i32* %i, align 4, !dbg !452
  %cmp34 = icmp slt i32 %16, 10, !dbg !454
  br i1 %cmp34, label %for.body, label %for.end, !dbg !455

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !456
  %idxprom36 = sext i32 %17 to i64, !dbg !458
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !458
  %18 = load i32, i32* %arrayidx37, align 4, !dbg !458
  call void @printIntLine(i32 %18), !dbg !459
  br label %for.inc, !dbg !460

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !461
  %inc = add nsw i32 %19, 1, !dbg !461
  store i32 %inc, i32* %i, align 4, !dbg !461
  br label %for.cond, !dbg !462, !llvm.loop !463

for.end:                                          ; preds = %for.cond
  br label %if.end38, !dbg !465

if.else:                                          ; preds = %land.lhs.true, %if.then26
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !466
  br label %if.end38

if.end38:                                         ; preds = %if.else, %for.end
  br label %if.end39, !dbg !468

if.end39:                                         ; preds = %if.end38, %if.end23
  ret void, !dbg !469
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !470 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !471, metadata !DIExpression()), !dbg !472
  store i32 -1, i32* %data, align 4, !dbg !473
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !474
  %cmp = icmp ne i32 %0, 5, !dbg !476
  br i1 %cmp, label %if.then, label %if.else, !dbg !477

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !478
  br label %if.end, !dbg !480

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !481
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !483
  %cmp1 = icmp eq i32 %1, 5, !dbg !485
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !486

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !487, metadata !DIExpression()), !dbg !490
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !491, metadata !DIExpression()), !dbg !492
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !492
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !492
  %3 = load i32, i32* %data, align 4, !dbg !493
  %cmp3 = icmp sge i32 %3, 0, !dbg !495
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !496

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !497
  %idxprom = sext i32 %4 to i64, !dbg !499
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !499
  store i32 1, i32* %arrayidx, align 4, !dbg !500
  store i32 0, i32* %i, align 4, !dbg !501
  br label %for.cond, !dbg !503

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !504
  %cmp5 = icmp slt i32 %5, 10, !dbg !506
  br i1 %cmp5, label %for.body, label %for.end, !dbg !507

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !508
  %idxprom6 = sext i32 %6 to i64, !dbg !510
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !510
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !510
  call void @printIntLine(i32 %7), !dbg !511
  br label %for.inc, !dbg !512

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !513
  %inc = add nsw i32 %8, 1, !dbg !513
  store i32 %inc, i32* %i, align 4, !dbg !513
  br label %for.cond, !dbg !514, !llvm.loop !515

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !517

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !518
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !520

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !521
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !522 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !523, metadata !DIExpression()), !dbg !524
  store i32 -1, i32* %data, align 4, !dbg !525
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !526
  %cmp = icmp eq i32 %0, 5, !dbg !528
  br i1 %cmp, label %if.then, label %if.end, !dbg !529

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !530
  br label %if.end, !dbg !532

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !533
  %cmp1 = icmp eq i32 %1, 5, !dbg !535
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !536

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !537, metadata !DIExpression()), !dbg !540
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !541, metadata !DIExpression()), !dbg !542
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !542
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !542
  %3 = load i32, i32* %data, align 4, !dbg !543
  %cmp3 = icmp sge i32 %3, 0, !dbg !545
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !546

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !547
  %idxprom = sext i32 %4 to i64, !dbg !549
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !549
  store i32 1, i32* %arrayidx, align 4, !dbg !550
  store i32 0, i32* %i, align 4, !dbg !551
  br label %for.cond, !dbg !553

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !554
  %cmp5 = icmp slt i32 %5, 10, !dbg !556
  br i1 %cmp5, label %for.body, label %for.end, !dbg !557

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !558
  %idxprom6 = sext i32 %6 to i64, !dbg !560
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !560
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !560
  call void @printIntLine(i32 %7), !dbg !561
  br label %for.inc, !dbg !562

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !563
  %inc = add nsw i32 %8, 1, !dbg !563
  store i32 %inc, i32* %i, align 4, !dbg !563
  br label %for.cond, !dbg !564, !llvm.loop !565

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !567

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !568
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !570

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !571
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_13_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_13.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocation(line: 49, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 49, column: 8)
!76 = !DILocation(line: 49, column: 25, scope: !75)
!77 = !DILocation(line: 49, column: 8, scope: !65)
!78 = !DILocalVariable(name: "recvResult", scope: !79, file: !66, line: 56, type: !71)
!79 = distinct !DILexicalBlock(scope: !80, file: !66, line: 51, column: 9)
!80 = distinct !DILexicalBlock(scope: !75, file: !66, line: 50, column: 5)
!81 = !DILocation(line: 56, column: 17, scope: !79)
!82 = !DILocalVariable(name: "service", scope: !79, file: !66, line: 57, type: !83)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !84)
!84 = !{!85, !86, !92, !99}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !83, file: !17, line: 240, baseType: !51, size: 16)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !83, file: !17, line: 241, baseType: !87, size: 16, offset: 16)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !89, line: 25, baseType: !90)
!89 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !91, line: 40, baseType: !53)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !83, file: !17, line: 242, baseType: !93, size: 32, offset: 32)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !94)
!94 = !{!95}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !93, file: !17, line: 33, baseType: !96, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !89, line: 26, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !91, line: 42, baseType: !5)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !83, file: !17, line: 245, baseType: !100, size: 64, offset: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 64, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 8)
!104 = !DILocation(line: 57, column: 32, scope: !79)
!105 = !DILocalVariable(name: "connectSocket", scope: !79, file: !66, line: 58, type: !71)
!106 = !DILocation(line: 58, column: 20, scope: !79)
!107 = !DILocalVariable(name: "inputBuffer", scope: !79, file: !66, line: 59, type: !55)
!108 = !DILocation(line: 59, column: 18, scope: !79)
!109 = !DILocation(line: 60, column: 13, scope: !79)
!110 = !DILocation(line: 70, column: 33, scope: !111)
!111 = distinct !DILexicalBlock(scope: !79, file: !66, line: 61, column: 13)
!112 = !DILocation(line: 70, column: 31, scope: !111)
!113 = !DILocation(line: 71, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !66, line: 71, column: 21)
!115 = !DILocation(line: 71, column: 35, scope: !114)
!116 = !DILocation(line: 71, column: 21, scope: !111)
!117 = !DILocation(line: 73, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !66, line: 72, column: 17)
!119 = !DILocation(line: 75, column: 17, scope: !111)
!120 = !DILocation(line: 76, column: 25, scope: !111)
!121 = !DILocation(line: 76, column: 36, scope: !111)
!122 = !DILocation(line: 77, column: 43, scope: !111)
!123 = !DILocation(line: 77, column: 25, scope: !111)
!124 = !DILocation(line: 77, column: 34, scope: !111)
!125 = !DILocation(line: 77, column: 41, scope: !111)
!126 = !DILocation(line: 78, column: 36, scope: !111)
!127 = !DILocation(line: 78, column: 25, scope: !111)
!128 = !DILocation(line: 78, column: 34, scope: !111)
!129 = !DILocation(line: 79, column: 29, scope: !130)
!130 = distinct !DILexicalBlock(scope: !111, file: !66, line: 79, column: 21)
!131 = !DILocation(line: 79, column: 44, scope: !130)
!132 = !DILocation(line: 79, column: 21, scope: !130)
!133 = !DILocation(line: 79, column: 89, scope: !130)
!134 = !DILocation(line: 79, column: 21, scope: !111)
!135 = !DILocation(line: 81, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !66, line: 80, column: 17)
!137 = !DILocation(line: 85, column: 35, scope: !111)
!138 = !DILocation(line: 85, column: 50, scope: !111)
!139 = !DILocation(line: 85, column: 30, scope: !111)
!140 = !DILocation(line: 85, column: 28, scope: !111)
!141 = !DILocation(line: 86, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !111, file: !66, line: 86, column: 21)
!143 = !DILocation(line: 86, column: 32, scope: !142)
!144 = !DILocation(line: 86, column: 48, scope: !142)
!145 = !DILocation(line: 86, column: 51, scope: !142)
!146 = !DILocation(line: 86, column: 62, scope: !142)
!147 = !DILocation(line: 86, column: 21, scope: !111)
!148 = !DILocation(line: 88, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !142, file: !66, line: 87, column: 17)
!150 = !DILocation(line: 91, column: 29, scope: !111)
!151 = !DILocation(line: 91, column: 17, scope: !111)
!152 = !DILocation(line: 91, column: 41, scope: !111)
!153 = !DILocation(line: 93, column: 29, scope: !111)
!154 = !DILocation(line: 93, column: 24, scope: !111)
!155 = !DILocation(line: 93, column: 22, scope: !111)
!156 = !DILocation(line: 94, column: 13, scope: !111)
!157 = !DILocation(line: 96, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !79, file: !66, line: 96, column: 17)
!159 = !DILocation(line: 96, column: 31, scope: !158)
!160 = !DILocation(line: 96, column: 17, scope: !79)
!161 = !DILocation(line: 98, column: 30, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !66, line: 97, column: 13)
!163 = !DILocation(line: 98, column: 17, scope: !162)
!164 = !DILocation(line: 99, column: 13, scope: !162)
!165 = !DILocation(line: 107, column: 5, scope: !80)
!166 = !DILocation(line: 108, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !65, file: !66, line: 108, column: 8)
!168 = !DILocation(line: 108, column: 25, scope: !167)
!169 = !DILocation(line: 108, column: 8, scope: !65)
!170 = !DILocalVariable(name: "i", scope: !171, file: !66, line: 111, type: !71)
!171 = distinct !DILexicalBlock(scope: !172, file: !66, line: 110, column: 9)
!172 = distinct !DILexicalBlock(scope: !167, file: !66, line: 109, column: 5)
!173 = !DILocation(line: 111, column: 17, scope: !171)
!174 = !DILocalVariable(name: "buffer", scope: !171, file: !66, line: 112, type: !175)
!175 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !176)
!176 = !{!177}
!177 = !DISubrange(count: 10)
!178 = !DILocation(line: 112, column: 17, scope: !171)
!179 = !DILocation(line: 115, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !171, file: !66, line: 115, column: 17)
!181 = !DILocation(line: 115, column: 22, scope: !180)
!182 = !DILocation(line: 115, column: 17, scope: !171)
!183 = !DILocation(line: 117, column: 24, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !66, line: 116, column: 13)
!185 = !DILocation(line: 117, column: 17, scope: !184)
!186 = !DILocation(line: 117, column: 30, scope: !184)
!187 = !DILocation(line: 119, column: 23, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !66, line: 119, column: 17)
!189 = !DILocation(line: 119, column: 21, scope: !188)
!190 = !DILocation(line: 119, column: 28, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !66, line: 119, column: 17)
!192 = !DILocation(line: 119, column: 30, scope: !191)
!193 = !DILocation(line: 119, column: 17, scope: !188)
!194 = !DILocation(line: 121, column: 41, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !66, line: 120, column: 17)
!196 = !DILocation(line: 121, column: 34, scope: !195)
!197 = !DILocation(line: 121, column: 21, scope: !195)
!198 = !DILocation(line: 122, column: 17, scope: !195)
!199 = !DILocation(line: 119, column: 37, scope: !191)
!200 = !DILocation(line: 119, column: 17, scope: !191)
!201 = distinct !{!201, !193, !202, !203}
!202 = !DILocation(line: 122, column: 17, scope: !188)
!203 = !{!"llvm.loop.mustprogress"}
!204 = !DILocation(line: 123, column: 13, scope: !184)
!205 = !DILocation(line: 126, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !180, file: !66, line: 125, column: 13)
!207 = !DILocation(line: 129, column: 5, scope: !172)
!208 = !DILocation(line: 130, column: 1, scope: !65)
!209 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_13_good", scope: !66, file: !66, line: 394, type: !67, scopeLine: 395, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!210 = !DILocation(line: 396, column: 5, scope: !209)
!211 = !DILocation(line: 397, column: 5, scope: !209)
!212 = !DILocation(line: 398, column: 5, scope: !209)
!213 = !DILocation(line: 399, column: 5, scope: !209)
!214 = !DILocation(line: 400, column: 1, scope: !209)
!215 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 411, type: !216, scopeLine: 412, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!216 = !DISubroutineType(types: !217)
!217 = !{!71, !71, !218}
!218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !219, size: 64)
!219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!220 = !DILocalVariable(name: "argc", arg: 1, scope: !215, file: !66, line: 411, type: !71)
!221 = !DILocation(line: 411, column: 14, scope: !215)
!222 = !DILocalVariable(name: "argv", arg: 2, scope: !215, file: !66, line: 411, type: !218)
!223 = !DILocation(line: 411, column: 27, scope: !215)
!224 = !DILocation(line: 414, column: 22, scope: !215)
!225 = !DILocation(line: 414, column: 12, scope: !215)
!226 = !DILocation(line: 414, column: 5, scope: !215)
!227 = !DILocation(line: 416, column: 5, scope: !215)
!228 = !DILocation(line: 417, column: 5, scope: !215)
!229 = !DILocation(line: 418, column: 5, scope: !215)
!230 = !DILocation(line: 421, column: 5, scope: !215)
!231 = !DILocation(line: 422, column: 5, scope: !215)
!232 = !DILocation(line: 423, column: 5, scope: !215)
!233 = !DILocation(line: 425, column: 5, scope: !215)
!234 = distinct !DISubprogram(name: "goodB2G1", scope: !66, file: !66, line: 137, type: !67, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!235 = !DILocalVariable(name: "data", scope: !234, file: !66, line: 139, type: !71)
!236 = !DILocation(line: 139, column: 9, scope: !234)
!237 = !DILocation(line: 141, column: 10, scope: !234)
!238 = !DILocation(line: 142, column: 8, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !66, line: 142, column: 8)
!240 = !DILocation(line: 142, column: 25, scope: !239)
!241 = !DILocation(line: 142, column: 8, scope: !234)
!242 = !DILocalVariable(name: "recvResult", scope: !243, file: !66, line: 149, type: !71)
!243 = distinct !DILexicalBlock(scope: !244, file: !66, line: 144, column: 9)
!244 = distinct !DILexicalBlock(scope: !239, file: !66, line: 143, column: 5)
!245 = !DILocation(line: 149, column: 17, scope: !243)
!246 = !DILocalVariable(name: "service", scope: !243, file: !66, line: 150, type: !83)
!247 = !DILocation(line: 150, column: 32, scope: !243)
!248 = !DILocalVariable(name: "connectSocket", scope: !243, file: !66, line: 151, type: !71)
!249 = !DILocation(line: 151, column: 20, scope: !243)
!250 = !DILocalVariable(name: "inputBuffer", scope: !243, file: !66, line: 152, type: !55)
!251 = !DILocation(line: 152, column: 18, scope: !243)
!252 = !DILocation(line: 153, column: 13, scope: !243)
!253 = !DILocation(line: 163, column: 33, scope: !254)
!254 = distinct !DILexicalBlock(scope: !243, file: !66, line: 154, column: 13)
!255 = !DILocation(line: 163, column: 31, scope: !254)
!256 = !DILocation(line: 164, column: 21, scope: !257)
!257 = distinct !DILexicalBlock(scope: !254, file: !66, line: 164, column: 21)
!258 = !DILocation(line: 164, column: 35, scope: !257)
!259 = !DILocation(line: 164, column: 21, scope: !254)
!260 = !DILocation(line: 166, column: 21, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !66, line: 165, column: 17)
!262 = !DILocation(line: 168, column: 17, scope: !254)
!263 = !DILocation(line: 169, column: 25, scope: !254)
!264 = !DILocation(line: 169, column: 36, scope: !254)
!265 = !DILocation(line: 170, column: 43, scope: !254)
!266 = !DILocation(line: 170, column: 25, scope: !254)
!267 = !DILocation(line: 170, column: 34, scope: !254)
!268 = !DILocation(line: 170, column: 41, scope: !254)
!269 = !DILocation(line: 171, column: 36, scope: !254)
!270 = !DILocation(line: 171, column: 25, scope: !254)
!271 = !DILocation(line: 171, column: 34, scope: !254)
!272 = !DILocation(line: 172, column: 29, scope: !273)
!273 = distinct !DILexicalBlock(scope: !254, file: !66, line: 172, column: 21)
!274 = !DILocation(line: 172, column: 44, scope: !273)
!275 = !DILocation(line: 172, column: 21, scope: !273)
!276 = !DILocation(line: 172, column: 89, scope: !273)
!277 = !DILocation(line: 172, column: 21, scope: !254)
!278 = !DILocation(line: 174, column: 21, scope: !279)
!279 = distinct !DILexicalBlock(scope: !273, file: !66, line: 173, column: 17)
!280 = !DILocation(line: 178, column: 35, scope: !254)
!281 = !DILocation(line: 178, column: 50, scope: !254)
!282 = !DILocation(line: 178, column: 30, scope: !254)
!283 = !DILocation(line: 178, column: 28, scope: !254)
!284 = !DILocation(line: 179, column: 21, scope: !285)
!285 = distinct !DILexicalBlock(scope: !254, file: !66, line: 179, column: 21)
!286 = !DILocation(line: 179, column: 32, scope: !285)
!287 = !DILocation(line: 179, column: 48, scope: !285)
!288 = !DILocation(line: 179, column: 51, scope: !285)
!289 = !DILocation(line: 179, column: 62, scope: !285)
!290 = !DILocation(line: 179, column: 21, scope: !254)
!291 = !DILocation(line: 181, column: 21, scope: !292)
!292 = distinct !DILexicalBlock(scope: !285, file: !66, line: 180, column: 17)
!293 = !DILocation(line: 184, column: 29, scope: !254)
!294 = !DILocation(line: 184, column: 17, scope: !254)
!295 = !DILocation(line: 184, column: 41, scope: !254)
!296 = !DILocation(line: 186, column: 29, scope: !254)
!297 = !DILocation(line: 186, column: 24, scope: !254)
!298 = !DILocation(line: 186, column: 22, scope: !254)
!299 = !DILocation(line: 187, column: 13, scope: !254)
!300 = !DILocation(line: 189, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !243, file: !66, line: 189, column: 17)
!302 = !DILocation(line: 189, column: 31, scope: !301)
!303 = !DILocation(line: 189, column: 17, scope: !243)
!304 = !DILocation(line: 191, column: 30, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !66, line: 190, column: 13)
!306 = !DILocation(line: 191, column: 17, scope: !305)
!307 = !DILocation(line: 192, column: 13, scope: !305)
!308 = !DILocation(line: 200, column: 5, scope: !244)
!309 = !DILocation(line: 201, column: 8, scope: !310)
!310 = distinct !DILexicalBlock(scope: !234, file: !66, line: 201, column: 8)
!311 = !DILocation(line: 201, column: 25, scope: !310)
!312 = !DILocation(line: 201, column: 8, scope: !234)
!313 = !DILocation(line: 204, column: 9, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !66, line: 202, column: 5)
!315 = !DILocation(line: 205, column: 5, scope: !314)
!316 = !DILocalVariable(name: "i", scope: !317, file: !66, line: 209, type: !71)
!317 = distinct !DILexicalBlock(scope: !318, file: !66, line: 208, column: 9)
!318 = distinct !DILexicalBlock(scope: !310, file: !66, line: 207, column: 5)
!319 = !DILocation(line: 209, column: 17, scope: !317)
!320 = !DILocalVariable(name: "buffer", scope: !317, file: !66, line: 210, type: !175)
!321 = !DILocation(line: 210, column: 17, scope: !317)
!322 = !DILocation(line: 212, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !317, file: !66, line: 212, column: 17)
!324 = !DILocation(line: 212, column: 22, scope: !323)
!325 = !DILocation(line: 212, column: 27, scope: !323)
!326 = !DILocation(line: 212, column: 30, scope: !323)
!327 = !DILocation(line: 212, column: 35, scope: !323)
!328 = !DILocation(line: 212, column: 17, scope: !317)
!329 = !DILocation(line: 214, column: 24, scope: !330)
!330 = distinct !DILexicalBlock(scope: !323, file: !66, line: 213, column: 13)
!331 = !DILocation(line: 214, column: 17, scope: !330)
!332 = !DILocation(line: 214, column: 30, scope: !330)
!333 = !DILocation(line: 216, column: 23, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !66, line: 216, column: 17)
!335 = !DILocation(line: 216, column: 21, scope: !334)
!336 = !DILocation(line: 216, column: 28, scope: !337)
!337 = distinct !DILexicalBlock(scope: !334, file: !66, line: 216, column: 17)
!338 = !DILocation(line: 216, column: 30, scope: !337)
!339 = !DILocation(line: 216, column: 17, scope: !334)
!340 = !DILocation(line: 218, column: 41, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !66, line: 217, column: 17)
!342 = !DILocation(line: 218, column: 34, scope: !341)
!343 = !DILocation(line: 218, column: 21, scope: !341)
!344 = !DILocation(line: 219, column: 17, scope: !341)
!345 = !DILocation(line: 216, column: 37, scope: !337)
!346 = !DILocation(line: 216, column: 17, scope: !337)
!347 = distinct !{!347, !339, !348, !203}
!348 = !DILocation(line: 219, column: 17, scope: !334)
!349 = !DILocation(line: 220, column: 13, scope: !330)
!350 = !DILocation(line: 223, column: 17, scope: !351)
!351 = distinct !DILexicalBlock(scope: !323, file: !66, line: 222, column: 13)
!352 = !DILocation(line: 227, column: 1, scope: !234)
!353 = distinct !DISubprogram(name: "goodB2G2", scope: !66, file: !66, line: 230, type: !67, scopeLine: 231, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!354 = !DILocalVariable(name: "data", scope: !353, file: !66, line: 232, type: !71)
!355 = !DILocation(line: 232, column: 9, scope: !353)
!356 = !DILocation(line: 234, column: 10, scope: !353)
!357 = !DILocation(line: 235, column: 8, scope: !358)
!358 = distinct !DILexicalBlock(scope: !353, file: !66, line: 235, column: 8)
!359 = !DILocation(line: 235, column: 25, scope: !358)
!360 = !DILocation(line: 235, column: 8, scope: !353)
!361 = !DILocalVariable(name: "recvResult", scope: !362, file: !66, line: 242, type: !71)
!362 = distinct !DILexicalBlock(scope: !363, file: !66, line: 237, column: 9)
!363 = distinct !DILexicalBlock(scope: !358, file: !66, line: 236, column: 5)
!364 = !DILocation(line: 242, column: 17, scope: !362)
!365 = !DILocalVariable(name: "service", scope: !362, file: !66, line: 243, type: !83)
!366 = !DILocation(line: 243, column: 32, scope: !362)
!367 = !DILocalVariable(name: "connectSocket", scope: !362, file: !66, line: 244, type: !71)
!368 = !DILocation(line: 244, column: 20, scope: !362)
!369 = !DILocalVariable(name: "inputBuffer", scope: !362, file: !66, line: 245, type: !55)
!370 = !DILocation(line: 245, column: 18, scope: !362)
!371 = !DILocation(line: 246, column: 13, scope: !362)
!372 = !DILocation(line: 256, column: 33, scope: !373)
!373 = distinct !DILexicalBlock(scope: !362, file: !66, line: 247, column: 13)
!374 = !DILocation(line: 256, column: 31, scope: !373)
!375 = !DILocation(line: 257, column: 21, scope: !376)
!376 = distinct !DILexicalBlock(scope: !373, file: !66, line: 257, column: 21)
!377 = !DILocation(line: 257, column: 35, scope: !376)
!378 = !DILocation(line: 257, column: 21, scope: !373)
!379 = !DILocation(line: 259, column: 21, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !66, line: 258, column: 17)
!381 = !DILocation(line: 261, column: 17, scope: !373)
!382 = !DILocation(line: 262, column: 25, scope: !373)
!383 = !DILocation(line: 262, column: 36, scope: !373)
!384 = !DILocation(line: 263, column: 43, scope: !373)
!385 = !DILocation(line: 263, column: 25, scope: !373)
!386 = !DILocation(line: 263, column: 34, scope: !373)
!387 = !DILocation(line: 263, column: 41, scope: !373)
!388 = !DILocation(line: 264, column: 36, scope: !373)
!389 = !DILocation(line: 264, column: 25, scope: !373)
!390 = !DILocation(line: 264, column: 34, scope: !373)
!391 = !DILocation(line: 265, column: 29, scope: !392)
!392 = distinct !DILexicalBlock(scope: !373, file: !66, line: 265, column: 21)
!393 = !DILocation(line: 265, column: 44, scope: !392)
!394 = !DILocation(line: 265, column: 21, scope: !392)
!395 = !DILocation(line: 265, column: 89, scope: !392)
!396 = !DILocation(line: 265, column: 21, scope: !373)
!397 = !DILocation(line: 267, column: 21, scope: !398)
!398 = distinct !DILexicalBlock(scope: !392, file: !66, line: 266, column: 17)
!399 = !DILocation(line: 271, column: 35, scope: !373)
!400 = !DILocation(line: 271, column: 50, scope: !373)
!401 = !DILocation(line: 271, column: 30, scope: !373)
!402 = !DILocation(line: 271, column: 28, scope: !373)
!403 = !DILocation(line: 272, column: 21, scope: !404)
!404 = distinct !DILexicalBlock(scope: !373, file: !66, line: 272, column: 21)
!405 = !DILocation(line: 272, column: 32, scope: !404)
!406 = !DILocation(line: 272, column: 48, scope: !404)
!407 = !DILocation(line: 272, column: 51, scope: !404)
!408 = !DILocation(line: 272, column: 62, scope: !404)
!409 = !DILocation(line: 272, column: 21, scope: !373)
!410 = !DILocation(line: 274, column: 21, scope: !411)
!411 = distinct !DILexicalBlock(scope: !404, file: !66, line: 273, column: 17)
!412 = !DILocation(line: 277, column: 29, scope: !373)
!413 = !DILocation(line: 277, column: 17, scope: !373)
!414 = !DILocation(line: 277, column: 41, scope: !373)
!415 = !DILocation(line: 279, column: 29, scope: !373)
!416 = !DILocation(line: 279, column: 24, scope: !373)
!417 = !DILocation(line: 279, column: 22, scope: !373)
!418 = !DILocation(line: 280, column: 13, scope: !373)
!419 = !DILocation(line: 282, column: 17, scope: !420)
!420 = distinct !DILexicalBlock(scope: !362, file: !66, line: 282, column: 17)
!421 = !DILocation(line: 282, column: 31, scope: !420)
!422 = !DILocation(line: 282, column: 17, scope: !362)
!423 = !DILocation(line: 284, column: 30, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !66, line: 283, column: 13)
!425 = !DILocation(line: 284, column: 17, scope: !424)
!426 = !DILocation(line: 285, column: 13, scope: !424)
!427 = !DILocation(line: 293, column: 5, scope: !363)
!428 = !DILocation(line: 294, column: 8, scope: !429)
!429 = distinct !DILexicalBlock(scope: !353, file: !66, line: 294, column: 8)
!430 = !DILocation(line: 294, column: 25, scope: !429)
!431 = !DILocation(line: 294, column: 8, scope: !353)
!432 = !DILocalVariable(name: "i", scope: !433, file: !66, line: 297, type: !71)
!433 = distinct !DILexicalBlock(scope: !434, file: !66, line: 296, column: 9)
!434 = distinct !DILexicalBlock(scope: !429, file: !66, line: 295, column: 5)
!435 = !DILocation(line: 297, column: 17, scope: !433)
!436 = !DILocalVariable(name: "buffer", scope: !433, file: !66, line: 298, type: !175)
!437 = !DILocation(line: 298, column: 17, scope: !433)
!438 = !DILocation(line: 300, column: 17, scope: !439)
!439 = distinct !DILexicalBlock(scope: !433, file: !66, line: 300, column: 17)
!440 = !DILocation(line: 300, column: 22, scope: !439)
!441 = !DILocation(line: 300, column: 27, scope: !439)
!442 = !DILocation(line: 300, column: 30, scope: !439)
!443 = !DILocation(line: 300, column: 35, scope: !439)
!444 = !DILocation(line: 300, column: 17, scope: !433)
!445 = !DILocation(line: 302, column: 24, scope: !446)
!446 = distinct !DILexicalBlock(scope: !439, file: !66, line: 301, column: 13)
!447 = !DILocation(line: 302, column: 17, scope: !446)
!448 = !DILocation(line: 302, column: 30, scope: !446)
!449 = !DILocation(line: 304, column: 23, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !66, line: 304, column: 17)
!451 = !DILocation(line: 304, column: 21, scope: !450)
!452 = !DILocation(line: 304, column: 28, scope: !453)
!453 = distinct !DILexicalBlock(scope: !450, file: !66, line: 304, column: 17)
!454 = !DILocation(line: 304, column: 30, scope: !453)
!455 = !DILocation(line: 304, column: 17, scope: !450)
!456 = !DILocation(line: 306, column: 41, scope: !457)
!457 = distinct !DILexicalBlock(scope: !453, file: !66, line: 305, column: 17)
!458 = !DILocation(line: 306, column: 34, scope: !457)
!459 = !DILocation(line: 306, column: 21, scope: !457)
!460 = !DILocation(line: 307, column: 17, scope: !457)
!461 = !DILocation(line: 304, column: 37, scope: !453)
!462 = !DILocation(line: 304, column: 17, scope: !453)
!463 = distinct !{!463, !455, !464, !203}
!464 = !DILocation(line: 307, column: 17, scope: !450)
!465 = !DILocation(line: 308, column: 13, scope: !446)
!466 = !DILocation(line: 311, column: 17, scope: !467)
!467 = distinct !DILexicalBlock(scope: !439, file: !66, line: 310, column: 13)
!468 = !DILocation(line: 314, column: 5, scope: !434)
!469 = !DILocation(line: 315, column: 1, scope: !353)
!470 = distinct !DISubprogram(name: "goodG2B1", scope: !66, file: !66, line: 318, type: !67, scopeLine: 319, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!471 = !DILocalVariable(name: "data", scope: !470, file: !66, line: 320, type: !71)
!472 = !DILocation(line: 320, column: 9, scope: !470)
!473 = !DILocation(line: 322, column: 10, scope: !470)
!474 = !DILocation(line: 323, column: 8, scope: !475)
!475 = distinct !DILexicalBlock(scope: !470, file: !66, line: 323, column: 8)
!476 = !DILocation(line: 323, column: 25, scope: !475)
!477 = !DILocation(line: 323, column: 8, scope: !470)
!478 = !DILocation(line: 326, column: 9, scope: !479)
!479 = distinct !DILexicalBlock(scope: !475, file: !66, line: 324, column: 5)
!480 = !DILocation(line: 327, column: 5, scope: !479)
!481 = !DILocation(line: 332, column: 14, scope: !482)
!482 = distinct !DILexicalBlock(scope: !475, file: !66, line: 329, column: 5)
!483 = !DILocation(line: 334, column: 8, scope: !484)
!484 = distinct !DILexicalBlock(scope: !470, file: !66, line: 334, column: 8)
!485 = !DILocation(line: 334, column: 25, scope: !484)
!486 = !DILocation(line: 334, column: 8, scope: !470)
!487 = !DILocalVariable(name: "i", scope: !488, file: !66, line: 337, type: !71)
!488 = distinct !DILexicalBlock(scope: !489, file: !66, line: 336, column: 9)
!489 = distinct !DILexicalBlock(scope: !484, file: !66, line: 335, column: 5)
!490 = !DILocation(line: 337, column: 17, scope: !488)
!491 = !DILocalVariable(name: "buffer", scope: !488, file: !66, line: 338, type: !175)
!492 = !DILocation(line: 338, column: 17, scope: !488)
!493 = !DILocation(line: 341, column: 17, scope: !494)
!494 = distinct !DILexicalBlock(scope: !488, file: !66, line: 341, column: 17)
!495 = !DILocation(line: 341, column: 22, scope: !494)
!496 = !DILocation(line: 341, column: 17, scope: !488)
!497 = !DILocation(line: 343, column: 24, scope: !498)
!498 = distinct !DILexicalBlock(scope: !494, file: !66, line: 342, column: 13)
!499 = !DILocation(line: 343, column: 17, scope: !498)
!500 = !DILocation(line: 343, column: 30, scope: !498)
!501 = !DILocation(line: 345, column: 23, scope: !502)
!502 = distinct !DILexicalBlock(scope: !498, file: !66, line: 345, column: 17)
!503 = !DILocation(line: 345, column: 21, scope: !502)
!504 = !DILocation(line: 345, column: 28, scope: !505)
!505 = distinct !DILexicalBlock(scope: !502, file: !66, line: 345, column: 17)
!506 = !DILocation(line: 345, column: 30, scope: !505)
!507 = !DILocation(line: 345, column: 17, scope: !502)
!508 = !DILocation(line: 347, column: 41, scope: !509)
!509 = distinct !DILexicalBlock(scope: !505, file: !66, line: 346, column: 17)
!510 = !DILocation(line: 347, column: 34, scope: !509)
!511 = !DILocation(line: 347, column: 21, scope: !509)
!512 = !DILocation(line: 348, column: 17, scope: !509)
!513 = !DILocation(line: 345, column: 37, scope: !505)
!514 = !DILocation(line: 345, column: 17, scope: !505)
!515 = distinct !{!515, !507, !516, !203}
!516 = !DILocation(line: 348, column: 17, scope: !502)
!517 = !DILocation(line: 349, column: 13, scope: !498)
!518 = !DILocation(line: 352, column: 17, scope: !519)
!519 = distinct !DILexicalBlock(scope: !494, file: !66, line: 351, column: 13)
!520 = !DILocation(line: 355, column: 5, scope: !489)
!521 = !DILocation(line: 356, column: 1, scope: !470)
!522 = distinct !DISubprogram(name: "goodG2B2", scope: !66, file: !66, line: 359, type: !67, scopeLine: 360, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!523 = !DILocalVariable(name: "data", scope: !522, file: !66, line: 361, type: !71)
!524 = !DILocation(line: 361, column: 9, scope: !522)
!525 = !DILocation(line: 363, column: 10, scope: !522)
!526 = !DILocation(line: 364, column: 8, scope: !527)
!527 = distinct !DILexicalBlock(scope: !522, file: !66, line: 364, column: 8)
!528 = !DILocation(line: 364, column: 25, scope: !527)
!529 = !DILocation(line: 364, column: 8, scope: !522)
!530 = !DILocation(line: 368, column: 14, scope: !531)
!531 = distinct !DILexicalBlock(scope: !527, file: !66, line: 365, column: 5)
!532 = !DILocation(line: 369, column: 5, scope: !531)
!533 = !DILocation(line: 370, column: 8, scope: !534)
!534 = distinct !DILexicalBlock(scope: !522, file: !66, line: 370, column: 8)
!535 = !DILocation(line: 370, column: 25, scope: !534)
!536 = !DILocation(line: 370, column: 8, scope: !522)
!537 = !DILocalVariable(name: "i", scope: !538, file: !66, line: 373, type: !71)
!538 = distinct !DILexicalBlock(scope: !539, file: !66, line: 372, column: 9)
!539 = distinct !DILexicalBlock(scope: !534, file: !66, line: 371, column: 5)
!540 = !DILocation(line: 373, column: 17, scope: !538)
!541 = !DILocalVariable(name: "buffer", scope: !538, file: !66, line: 374, type: !175)
!542 = !DILocation(line: 374, column: 17, scope: !538)
!543 = !DILocation(line: 377, column: 17, scope: !544)
!544 = distinct !DILexicalBlock(scope: !538, file: !66, line: 377, column: 17)
!545 = !DILocation(line: 377, column: 22, scope: !544)
!546 = !DILocation(line: 377, column: 17, scope: !538)
!547 = !DILocation(line: 379, column: 24, scope: !548)
!548 = distinct !DILexicalBlock(scope: !544, file: !66, line: 378, column: 13)
!549 = !DILocation(line: 379, column: 17, scope: !548)
!550 = !DILocation(line: 379, column: 30, scope: !548)
!551 = !DILocation(line: 381, column: 23, scope: !552)
!552 = distinct !DILexicalBlock(scope: !548, file: !66, line: 381, column: 17)
!553 = !DILocation(line: 381, column: 21, scope: !552)
!554 = !DILocation(line: 381, column: 28, scope: !555)
!555 = distinct !DILexicalBlock(scope: !552, file: !66, line: 381, column: 17)
!556 = !DILocation(line: 381, column: 30, scope: !555)
!557 = !DILocation(line: 381, column: 17, scope: !552)
!558 = !DILocation(line: 383, column: 41, scope: !559)
!559 = distinct !DILexicalBlock(scope: !555, file: !66, line: 382, column: 17)
!560 = !DILocation(line: 383, column: 34, scope: !559)
!561 = !DILocation(line: 383, column: 21, scope: !559)
!562 = !DILocation(line: 384, column: 17, scope: !559)
!563 = !DILocation(line: 381, column: 37, scope: !555)
!564 = !DILocation(line: 381, column: 17, scope: !555)
!565 = distinct !{!565, !557, !566, !203}
!566 = !DILocation(line: 384, column: 17, scope: !552)
!567 = !DILocation(line: 385, column: 13, scope: !548)
!568 = !DILocation(line: 388, column: 17, scope: !569)
!569 = distinct !DILexicalBlock(scope: !544, file: !66, line: 387, column: 13)
!570 = !DILocation(line: 391, column: 5, scope: !539)
!571 = !DILocation(line: 392, column: 1, scope: !522)
