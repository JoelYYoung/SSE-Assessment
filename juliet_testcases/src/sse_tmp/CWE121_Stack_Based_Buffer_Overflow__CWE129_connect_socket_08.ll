; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_08.c"
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
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_08_bad() #0 !dbg !65 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !74
  %tobool = icmp ne i32 %call, 0, !dbg !74
  br i1 %tobool, label %if.then, label %if.end23, !dbg !76

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

if.end23:                                         ; preds = %if.end22, %entry
  %call24 = call i32 @staticReturnsTrue(), !dbg !165
  %tobool25 = icmp ne i32 %call24, 0, !dbg !165
  br i1 %tobool25, label %if.then26, label %if.end37, !dbg !167

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !172, metadata !DIExpression()), !dbg !176
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !176
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !176
  %11 = load i32, i32* %data, align 4, !dbg !177
  %cmp27 = icmp sge i32 %11, 0, !dbg !179
  br i1 %cmp27, label %if.then29, label %if.else, !dbg !180

if.then29:                                        ; preds = %if.then26
  %12 = load i32, i32* %data, align 4, !dbg !181
  %idxprom30 = sext i32 %12 to i64, !dbg !183
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !183
  store i32 1, i32* %arrayidx31, align 4, !dbg !184
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.then29
  %13 = load i32, i32* %i, align 4, !dbg !188
  %cmp32 = icmp slt i32 %13, 10, !dbg !190
  br i1 %cmp32, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %14 = load i32, i32* %i, align 4, !dbg !192
  %idxprom34 = sext i32 %14 to i64, !dbg !194
  %arrayidx35 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom34, !dbg !194
  %15 = load i32, i32* %arrayidx35, align 4, !dbg !194
  call void @printIntLine(i32 %15), !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !197
  %inc = add nsw i32 %16, 1, !dbg !197
  store i32 %inc, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  br label %if.end36, !dbg !202

if.else:                                          ; preds = %if.then26
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !203
  br label %if.end36

if.end36:                                         ; preds = %if.else, %for.end
  br label %if.end37, !dbg !205

if.end37:                                         ; preds = %if.end36, %if.end23
  ret void, !dbg !206
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_08_good() #0 !dbg !207 {
entry:
  call void @goodB2G1(), !dbg !208
  call void @goodB2G2(), !dbg !209
  call void @goodG2B1(), !dbg !210
  call void @goodG2B2(), !dbg !211
  ret void, !dbg !212
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !213 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !218, metadata !DIExpression()), !dbg !219
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !220, metadata !DIExpression()), !dbg !221
  %call = call i64 @time(i64* null) #7, !dbg !222
  %conv = trunc i64 %call to i32, !dbg !223
  call void @srand(i32 %conv) #7, !dbg !224
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !225
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_08_good(), !dbg !226
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !227
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !228
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_08_bad(), !dbg !229
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !230
  ret i32 0, !dbg !231
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !232 {
entry:
  ret i32 1, !dbg !235
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !236 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 -1, i32* %data, align 4, !dbg !239
  %call = call i32 @staticReturnsTrue(), !dbg !240
  %tobool = icmp ne i32 %call, 0, !dbg !240
  br i1 %tobool, label %if.then, label %if.end23, !dbg !242

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !243, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !247, metadata !DIExpression()), !dbg !248
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !249, metadata !DIExpression()), !dbg !250
  store i32 -1, i32* %connectSocket, align 4, !dbg !250
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !251, metadata !DIExpression()), !dbg !252
  br label %do.body, !dbg !253

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !254
  store i32 %call1, i32* %connectSocket, align 4, !dbg !256
  %0 = load i32, i32* %connectSocket, align 4, !dbg !257
  %cmp = icmp eq i32 %0, -1, !dbg !259
  br i1 %cmp, label %if.then2, label %if.end, !dbg !260

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !261

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !263
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !263
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !264
  store i16 2, i16* %sin_family, align 4, !dbg !265
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !266
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !267
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !268
  store i32 %call3, i32* %s_addr, align 4, !dbg !269
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !270
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !271
  store i16 %call4, i16* %sin_port, align 2, !dbg !272
  %2 = load i32, i32* %connectSocket, align 4, !dbg !273
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !275
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !276
  %cmp6 = icmp eq i32 %call5, -1, !dbg !277
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !278

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !279

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !281
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !282
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !283
  %conv = trunc i64 %call9 to i32, !dbg !283
  store i32 %conv, i32* %recvResult, align 4, !dbg !284
  %5 = load i32, i32* %recvResult, align 4, !dbg !285
  %cmp10 = icmp eq i32 %5, -1, !dbg !287
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !288

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !289
  %cmp12 = icmp eq i32 %6, 0, !dbg !290
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !291

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !292

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !294
  %idxprom = sext i32 %7 to i64, !dbg !295
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !295
  store i8 0, i8* %arrayidx, align 1, !dbg !296
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !297
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !298
  store i32 %call17, i32* %data, align 4, !dbg !299
  br label %do.end, !dbg !300

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !301
  %cmp18 = icmp ne i32 %8, -1, !dbg !303
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !304

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !305
  %call21 = call i32 @close(i32 %9), !dbg !307
  br label %if.end22, !dbg !308

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !309

if.end23:                                         ; preds = %if.end22, %entry
  %call24 = call i32 @staticReturnsFalse(), !dbg !310
  %tobool25 = icmp ne i32 %call24, 0, !dbg !310
  br i1 %tobool25, label %if.then26, label %if.else, !dbg !312

if.then26:                                        ; preds = %if.end23
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !313
  br label %if.end40, !dbg !315

if.else:                                          ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !316, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !320, metadata !DIExpression()), !dbg !321
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !321
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !321
  %11 = load i32, i32* %data, align 4, !dbg !322
  %cmp27 = icmp sge i32 %11, 0, !dbg !324
  br i1 %cmp27, label %land.lhs.true, label %if.else38, !dbg !325

land.lhs.true:                                    ; preds = %if.else
  %12 = load i32, i32* %data, align 4, !dbg !326
  %cmp29 = icmp slt i32 %12, 10, !dbg !327
  br i1 %cmp29, label %if.then31, label %if.else38, !dbg !328

if.then31:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !329
  %idxprom32 = sext i32 %13 to i64, !dbg !331
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !331
  store i32 1, i32* %arrayidx33, align 4, !dbg !332
  store i32 0, i32* %i, align 4, !dbg !333
  br label %for.cond, !dbg !335

for.cond:                                         ; preds = %for.inc, %if.then31
  %14 = load i32, i32* %i, align 4, !dbg !336
  %cmp34 = icmp slt i32 %14, 10, !dbg !338
  br i1 %cmp34, label %for.body, label %for.end, !dbg !339

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !340
  %idxprom36 = sext i32 %15 to i64, !dbg !342
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !342
  %16 = load i32, i32* %arrayidx37, align 4, !dbg !342
  call void @printIntLine(i32 %16), !dbg !343
  br label %for.inc, !dbg !344

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !345
  %inc = add nsw i32 %17, 1, !dbg !345
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
define internal i32 @staticReturnsFalse() #0 !dbg !353 {
entry:
  ret i32 0, !dbg !354
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !355 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !356, metadata !DIExpression()), !dbg !357
  store i32 -1, i32* %data, align 4, !dbg !358
  %call = call i32 @staticReturnsTrue(), !dbg !359
  %tobool = icmp ne i32 %call, 0, !dbg !359
  br i1 %tobool, label %if.then, label %if.end23, !dbg !361

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !362, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !366, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !368, metadata !DIExpression()), !dbg !369
  store i32 -1, i32* %connectSocket, align 4, !dbg !369
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !370, metadata !DIExpression()), !dbg !371
  br label %do.body, !dbg !372

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !373
  store i32 %call1, i32* %connectSocket, align 4, !dbg !375
  %0 = load i32, i32* %connectSocket, align 4, !dbg !376
  %cmp = icmp eq i32 %0, -1, !dbg !378
  br i1 %cmp, label %if.then2, label %if.end, !dbg !379

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !380

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !382
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !382
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !383
  store i16 2, i16* %sin_family, align 4, !dbg !384
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !385
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !386
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !387
  store i32 %call3, i32* %s_addr, align 4, !dbg !388
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !389
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !390
  store i16 %call4, i16* %sin_port, align 2, !dbg !391
  %2 = load i32, i32* %connectSocket, align 4, !dbg !392
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !394
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !395
  %cmp6 = icmp eq i32 %call5, -1, !dbg !396
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !397

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !398

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !400
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !401
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !402
  %conv = trunc i64 %call9 to i32, !dbg !402
  store i32 %conv, i32* %recvResult, align 4, !dbg !403
  %5 = load i32, i32* %recvResult, align 4, !dbg !404
  %cmp10 = icmp eq i32 %5, -1, !dbg !406
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !407

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !408
  %cmp12 = icmp eq i32 %6, 0, !dbg !409
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !410

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !411

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !413
  %idxprom = sext i32 %7 to i64, !dbg !414
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !414
  store i8 0, i8* %arrayidx, align 1, !dbg !415
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !416
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !417
  store i32 %call17, i32* %data, align 4, !dbg !418
  br label %do.end, !dbg !419

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !420
  %cmp18 = icmp ne i32 %8, -1, !dbg !422
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !423

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !424
  %call21 = call i32 @close(i32 %9), !dbg !426
  br label %if.end22, !dbg !427

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !428

if.end23:                                         ; preds = %if.end22, %entry
  %call24 = call i32 @staticReturnsTrue(), !dbg !429
  %tobool25 = icmp ne i32 %call24, 0, !dbg !429
  br i1 %tobool25, label %if.then26, label %if.end39, !dbg !431

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !432, metadata !DIExpression()), !dbg !435
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !436, metadata !DIExpression()), !dbg !437
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !437
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !437
  %11 = load i32, i32* %data, align 4, !dbg !438
  %cmp27 = icmp sge i32 %11, 0, !dbg !440
  br i1 %cmp27, label %land.lhs.true, label %if.else, !dbg !441

land.lhs.true:                                    ; preds = %if.then26
  %12 = load i32, i32* %data, align 4, !dbg !442
  %cmp29 = icmp slt i32 %12, 10, !dbg !443
  br i1 %cmp29, label %if.then31, label %if.else, !dbg !444

if.then31:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !445
  %idxprom32 = sext i32 %13 to i64, !dbg !447
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !447
  store i32 1, i32* %arrayidx33, align 4, !dbg !448
  store i32 0, i32* %i, align 4, !dbg !449
  br label %for.cond, !dbg !451

for.cond:                                         ; preds = %for.inc, %if.then31
  %14 = load i32, i32* %i, align 4, !dbg !452
  %cmp34 = icmp slt i32 %14, 10, !dbg !454
  br i1 %cmp34, label %for.body, label %for.end, !dbg !455

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !456
  %idxprom36 = sext i32 %15 to i64, !dbg !458
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !458
  %16 = load i32, i32* %arrayidx37, align 4, !dbg !458
  call void @printIntLine(i32 %16), !dbg !459
  br label %for.inc, !dbg !460

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !461
  %inc = add nsw i32 %17, 1, !dbg !461
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
  %call = call i32 @staticReturnsFalse(), !dbg !474
  %tobool = icmp ne i32 %call, 0, !dbg !474
  br i1 %tobool, label %if.then, label %if.else, !dbg !476

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !477
  br label %if.end, !dbg !479

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !480
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !482
  %tobool2 = icmp ne i32 %call1, 0, !dbg !482
  br i1 %tobool2, label %if.then3, label %if.end10, !dbg !484

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !485, metadata !DIExpression()), !dbg !488
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !489, metadata !DIExpression()), !dbg !490
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !490
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !490
  %1 = load i32, i32* %data, align 4, !dbg !491
  %cmp = icmp sge i32 %1, 0, !dbg !493
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !494

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !495
  %idxprom = sext i32 %2 to i64, !dbg !497
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !497
  store i32 1, i32* %arrayidx, align 4, !dbg !498
  store i32 0, i32* %i, align 4, !dbg !499
  br label %for.cond, !dbg !501

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !502
  %cmp5 = icmp slt i32 %3, 10, !dbg !504
  br i1 %cmp5, label %for.body, label %for.end, !dbg !505

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !506
  %idxprom6 = sext i32 %4 to i64, !dbg !508
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !508
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !508
  call void @printIntLine(i32 %5), !dbg !509
  br label %for.inc, !dbg !510

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !511
  %inc = add nsw i32 %6, 1, !dbg !511
  store i32 %inc, i32* %i, align 4, !dbg !511
  br label %for.cond, !dbg !512, !llvm.loop !513

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !515

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !516
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !518

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !519
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !520 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !521, metadata !DIExpression()), !dbg !522
  store i32 -1, i32* %data, align 4, !dbg !523
  %call = call i32 @staticReturnsTrue(), !dbg !524
  %tobool = icmp ne i32 %call, 0, !dbg !524
  br i1 %tobool, label %if.then, label %if.end, !dbg !526

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !527
  br label %if.end, !dbg !529

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !530
  %tobool2 = icmp ne i32 %call1, 0, !dbg !530
  br i1 %tobool2, label %if.then3, label %if.end9, !dbg !532

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !533, metadata !DIExpression()), !dbg !536
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !537, metadata !DIExpression()), !dbg !538
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !538
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !538
  %1 = load i32, i32* %data, align 4, !dbg !539
  %cmp = icmp sge i32 %1, 0, !dbg !541
  br i1 %cmp, label %if.then4, label %if.else, !dbg !542

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !543
  %idxprom = sext i32 %2 to i64, !dbg !545
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !545
  store i32 1, i32* %arrayidx, align 4, !dbg !546
  store i32 0, i32* %i, align 4, !dbg !547
  br label %for.cond, !dbg !549

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !550
  %cmp5 = icmp slt i32 %3, 10, !dbg !552
  br i1 %cmp5, label %for.body, label %for.end, !dbg !553

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !554
  %idxprom6 = sext i32 %4 to i64, !dbg !556
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !556
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !556
  call void @printIntLine(i32 %5), !dbg !557
  br label %for.inc, !dbg !558

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !559
  %inc = add nsw i32 %6, 1, !dbg !559
  store i32 %inc, i32* %i, align 4, !dbg !559
  br label %for.cond, !dbg !560, !llvm.loop !561

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !563

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !564
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !566

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !567
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_08_bad", scope: !66, file: !66, line: 57, type: !67, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_08.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 59, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 59, column: 9, scope: !65)
!73 = !DILocation(line: 61, column: 10, scope: !65)
!74 = !DILocation(line: 62, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 62, column: 8)
!76 = !DILocation(line: 62, column: 8, scope: !65)
!77 = !DILocalVariable(name: "recvResult", scope: !78, file: !66, line: 69, type: !71)
!78 = distinct !DILexicalBlock(scope: !79, file: !66, line: 64, column: 9)
!79 = distinct !DILexicalBlock(scope: !75, file: !66, line: 63, column: 5)
!80 = !DILocation(line: 69, column: 17, scope: !78)
!81 = !DILocalVariable(name: "service", scope: !78, file: !66, line: 70, type: !82)
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
!103 = !DILocation(line: 70, column: 32, scope: !78)
!104 = !DILocalVariable(name: "connectSocket", scope: !78, file: !66, line: 71, type: !71)
!105 = !DILocation(line: 71, column: 20, scope: !78)
!106 = !DILocalVariable(name: "inputBuffer", scope: !78, file: !66, line: 72, type: !55)
!107 = !DILocation(line: 72, column: 18, scope: !78)
!108 = !DILocation(line: 73, column: 13, scope: !78)
!109 = !DILocation(line: 83, column: 33, scope: !110)
!110 = distinct !DILexicalBlock(scope: !78, file: !66, line: 74, column: 13)
!111 = !DILocation(line: 83, column: 31, scope: !110)
!112 = !DILocation(line: 84, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !66, line: 84, column: 21)
!114 = !DILocation(line: 84, column: 35, scope: !113)
!115 = !DILocation(line: 84, column: 21, scope: !110)
!116 = !DILocation(line: 86, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !66, line: 85, column: 17)
!118 = !DILocation(line: 88, column: 17, scope: !110)
!119 = !DILocation(line: 89, column: 25, scope: !110)
!120 = !DILocation(line: 89, column: 36, scope: !110)
!121 = !DILocation(line: 90, column: 43, scope: !110)
!122 = !DILocation(line: 90, column: 25, scope: !110)
!123 = !DILocation(line: 90, column: 34, scope: !110)
!124 = !DILocation(line: 90, column: 41, scope: !110)
!125 = !DILocation(line: 91, column: 36, scope: !110)
!126 = !DILocation(line: 91, column: 25, scope: !110)
!127 = !DILocation(line: 91, column: 34, scope: !110)
!128 = !DILocation(line: 92, column: 29, scope: !129)
!129 = distinct !DILexicalBlock(scope: !110, file: !66, line: 92, column: 21)
!130 = !DILocation(line: 92, column: 44, scope: !129)
!131 = !DILocation(line: 92, column: 21, scope: !129)
!132 = !DILocation(line: 92, column: 89, scope: !129)
!133 = !DILocation(line: 92, column: 21, scope: !110)
!134 = !DILocation(line: 94, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !66, line: 93, column: 17)
!136 = !DILocation(line: 98, column: 35, scope: !110)
!137 = !DILocation(line: 98, column: 50, scope: !110)
!138 = !DILocation(line: 98, column: 30, scope: !110)
!139 = !DILocation(line: 98, column: 28, scope: !110)
!140 = !DILocation(line: 99, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !110, file: !66, line: 99, column: 21)
!142 = !DILocation(line: 99, column: 32, scope: !141)
!143 = !DILocation(line: 99, column: 48, scope: !141)
!144 = !DILocation(line: 99, column: 51, scope: !141)
!145 = !DILocation(line: 99, column: 62, scope: !141)
!146 = !DILocation(line: 99, column: 21, scope: !110)
!147 = !DILocation(line: 101, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !141, file: !66, line: 100, column: 17)
!149 = !DILocation(line: 104, column: 29, scope: !110)
!150 = !DILocation(line: 104, column: 17, scope: !110)
!151 = !DILocation(line: 104, column: 41, scope: !110)
!152 = !DILocation(line: 106, column: 29, scope: !110)
!153 = !DILocation(line: 106, column: 24, scope: !110)
!154 = !DILocation(line: 106, column: 22, scope: !110)
!155 = !DILocation(line: 107, column: 13, scope: !110)
!156 = !DILocation(line: 109, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !78, file: !66, line: 109, column: 17)
!158 = !DILocation(line: 109, column: 31, scope: !157)
!159 = !DILocation(line: 109, column: 17, scope: !78)
!160 = !DILocation(line: 111, column: 30, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !66, line: 110, column: 13)
!162 = !DILocation(line: 111, column: 17, scope: !161)
!163 = !DILocation(line: 112, column: 13, scope: !161)
!164 = !DILocation(line: 120, column: 5, scope: !79)
!165 = !DILocation(line: 121, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !65, file: !66, line: 121, column: 8)
!167 = !DILocation(line: 121, column: 8, scope: !65)
!168 = !DILocalVariable(name: "i", scope: !169, file: !66, line: 124, type: !71)
!169 = distinct !DILexicalBlock(scope: !170, file: !66, line: 123, column: 9)
!170 = distinct !DILexicalBlock(scope: !166, file: !66, line: 122, column: 5)
!171 = !DILocation(line: 124, column: 17, scope: !169)
!172 = !DILocalVariable(name: "buffer", scope: !169, file: !66, line: 125, type: !173)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !174)
!174 = !{!175}
!175 = !DISubrange(count: 10)
!176 = !DILocation(line: 125, column: 17, scope: !169)
!177 = !DILocation(line: 128, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !66, line: 128, column: 17)
!179 = !DILocation(line: 128, column: 22, scope: !178)
!180 = !DILocation(line: 128, column: 17, scope: !169)
!181 = !DILocation(line: 130, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !66, line: 129, column: 13)
!183 = !DILocation(line: 130, column: 17, scope: !182)
!184 = !DILocation(line: 130, column: 30, scope: !182)
!185 = !DILocation(line: 132, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !66, line: 132, column: 17)
!187 = !DILocation(line: 132, column: 21, scope: !186)
!188 = !DILocation(line: 132, column: 28, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !66, line: 132, column: 17)
!190 = !DILocation(line: 132, column: 30, scope: !189)
!191 = !DILocation(line: 132, column: 17, scope: !186)
!192 = !DILocation(line: 134, column: 41, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !66, line: 133, column: 17)
!194 = !DILocation(line: 134, column: 34, scope: !193)
!195 = !DILocation(line: 134, column: 21, scope: !193)
!196 = !DILocation(line: 135, column: 17, scope: !193)
!197 = !DILocation(line: 132, column: 37, scope: !189)
!198 = !DILocation(line: 132, column: 17, scope: !189)
!199 = distinct !{!199, !191, !200, !201}
!200 = !DILocation(line: 135, column: 17, scope: !186)
!201 = !{!"llvm.loop.mustprogress"}
!202 = !DILocation(line: 136, column: 13, scope: !182)
!203 = !DILocation(line: 139, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !178, file: !66, line: 138, column: 13)
!205 = !DILocation(line: 142, column: 5, scope: !170)
!206 = !DILocation(line: 143, column: 1, scope: !65)
!207 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_08_good", scope: !66, file: !66, line: 407, type: !67, scopeLine: 408, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!208 = !DILocation(line: 409, column: 5, scope: !207)
!209 = !DILocation(line: 410, column: 5, scope: !207)
!210 = !DILocation(line: 411, column: 5, scope: !207)
!211 = !DILocation(line: 412, column: 5, scope: !207)
!212 = !DILocation(line: 413, column: 1, scope: !207)
!213 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 424, type: !214, scopeLine: 425, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!214 = !DISubroutineType(types: !215)
!215 = !{!71, !71, !216}
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64)
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!218 = !DILocalVariable(name: "argc", arg: 1, scope: !213, file: !66, line: 424, type: !71)
!219 = !DILocation(line: 424, column: 14, scope: !213)
!220 = !DILocalVariable(name: "argv", arg: 2, scope: !213, file: !66, line: 424, type: !216)
!221 = !DILocation(line: 424, column: 27, scope: !213)
!222 = !DILocation(line: 427, column: 22, scope: !213)
!223 = !DILocation(line: 427, column: 12, scope: !213)
!224 = !DILocation(line: 427, column: 5, scope: !213)
!225 = !DILocation(line: 429, column: 5, scope: !213)
!226 = !DILocation(line: 430, column: 5, scope: !213)
!227 = !DILocation(line: 431, column: 5, scope: !213)
!228 = !DILocation(line: 434, column: 5, scope: !213)
!229 = !DILocation(line: 435, column: 5, scope: !213)
!230 = !DILocation(line: 436, column: 5, scope: !213)
!231 = !DILocation(line: 438, column: 5, scope: !213)
!232 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !66, file: !66, line: 45, type: !233, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!233 = !DISubroutineType(types: !234)
!234 = !{!71}
!235 = !DILocation(line: 47, column: 5, scope: !232)
!236 = distinct !DISubprogram(name: "goodB2G1", scope: !66, file: !66, line: 150, type: !67, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!237 = !DILocalVariable(name: "data", scope: !236, file: !66, line: 152, type: !71)
!238 = !DILocation(line: 152, column: 9, scope: !236)
!239 = !DILocation(line: 154, column: 10, scope: !236)
!240 = !DILocation(line: 155, column: 8, scope: !241)
!241 = distinct !DILexicalBlock(scope: !236, file: !66, line: 155, column: 8)
!242 = !DILocation(line: 155, column: 8, scope: !236)
!243 = !DILocalVariable(name: "recvResult", scope: !244, file: !66, line: 162, type: !71)
!244 = distinct !DILexicalBlock(scope: !245, file: !66, line: 157, column: 9)
!245 = distinct !DILexicalBlock(scope: !241, file: !66, line: 156, column: 5)
!246 = !DILocation(line: 162, column: 17, scope: !244)
!247 = !DILocalVariable(name: "service", scope: !244, file: !66, line: 163, type: !82)
!248 = !DILocation(line: 163, column: 32, scope: !244)
!249 = !DILocalVariable(name: "connectSocket", scope: !244, file: !66, line: 164, type: !71)
!250 = !DILocation(line: 164, column: 20, scope: !244)
!251 = !DILocalVariable(name: "inputBuffer", scope: !244, file: !66, line: 165, type: !55)
!252 = !DILocation(line: 165, column: 18, scope: !244)
!253 = !DILocation(line: 166, column: 13, scope: !244)
!254 = !DILocation(line: 176, column: 33, scope: !255)
!255 = distinct !DILexicalBlock(scope: !244, file: !66, line: 167, column: 13)
!256 = !DILocation(line: 176, column: 31, scope: !255)
!257 = !DILocation(line: 177, column: 21, scope: !258)
!258 = distinct !DILexicalBlock(scope: !255, file: !66, line: 177, column: 21)
!259 = !DILocation(line: 177, column: 35, scope: !258)
!260 = !DILocation(line: 177, column: 21, scope: !255)
!261 = !DILocation(line: 179, column: 21, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !66, line: 178, column: 17)
!263 = !DILocation(line: 181, column: 17, scope: !255)
!264 = !DILocation(line: 182, column: 25, scope: !255)
!265 = !DILocation(line: 182, column: 36, scope: !255)
!266 = !DILocation(line: 183, column: 43, scope: !255)
!267 = !DILocation(line: 183, column: 25, scope: !255)
!268 = !DILocation(line: 183, column: 34, scope: !255)
!269 = !DILocation(line: 183, column: 41, scope: !255)
!270 = !DILocation(line: 184, column: 36, scope: !255)
!271 = !DILocation(line: 184, column: 25, scope: !255)
!272 = !DILocation(line: 184, column: 34, scope: !255)
!273 = !DILocation(line: 185, column: 29, scope: !274)
!274 = distinct !DILexicalBlock(scope: !255, file: !66, line: 185, column: 21)
!275 = !DILocation(line: 185, column: 44, scope: !274)
!276 = !DILocation(line: 185, column: 21, scope: !274)
!277 = !DILocation(line: 185, column: 89, scope: !274)
!278 = !DILocation(line: 185, column: 21, scope: !255)
!279 = !DILocation(line: 187, column: 21, scope: !280)
!280 = distinct !DILexicalBlock(scope: !274, file: !66, line: 186, column: 17)
!281 = !DILocation(line: 191, column: 35, scope: !255)
!282 = !DILocation(line: 191, column: 50, scope: !255)
!283 = !DILocation(line: 191, column: 30, scope: !255)
!284 = !DILocation(line: 191, column: 28, scope: !255)
!285 = !DILocation(line: 192, column: 21, scope: !286)
!286 = distinct !DILexicalBlock(scope: !255, file: !66, line: 192, column: 21)
!287 = !DILocation(line: 192, column: 32, scope: !286)
!288 = !DILocation(line: 192, column: 48, scope: !286)
!289 = !DILocation(line: 192, column: 51, scope: !286)
!290 = !DILocation(line: 192, column: 62, scope: !286)
!291 = !DILocation(line: 192, column: 21, scope: !255)
!292 = !DILocation(line: 194, column: 21, scope: !293)
!293 = distinct !DILexicalBlock(scope: !286, file: !66, line: 193, column: 17)
!294 = !DILocation(line: 197, column: 29, scope: !255)
!295 = !DILocation(line: 197, column: 17, scope: !255)
!296 = !DILocation(line: 197, column: 41, scope: !255)
!297 = !DILocation(line: 199, column: 29, scope: !255)
!298 = !DILocation(line: 199, column: 24, scope: !255)
!299 = !DILocation(line: 199, column: 22, scope: !255)
!300 = !DILocation(line: 200, column: 13, scope: !255)
!301 = !DILocation(line: 202, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !244, file: !66, line: 202, column: 17)
!303 = !DILocation(line: 202, column: 31, scope: !302)
!304 = !DILocation(line: 202, column: 17, scope: !244)
!305 = !DILocation(line: 204, column: 30, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !66, line: 203, column: 13)
!307 = !DILocation(line: 204, column: 17, scope: !306)
!308 = !DILocation(line: 205, column: 13, scope: !306)
!309 = !DILocation(line: 213, column: 5, scope: !245)
!310 = !DILocation(line: 214, column: 8, scope: !311)
!311 = distinct !DILexicalBlock(scope: !236, file: !66, line: 214, column: 8)
!312 = !DILocation(line: 214, column: 8, scope: !236)
!313 = !DILocation(line: 217, column: 9, scope: !314)
!314 = distinct !DILexicalBlock(scope: !311, file: !66, line: 215, column: 5)
!315 = !DILocation(line: 218, column: 5, scope: !314)
!316 = !DILocalVariable(name: "i", scope: !317, file: !66, line: 222, type: !71)
!317 = distinct !DILexicalBlock(scope: !318, file: !66, line: 221, column: 9)
!318 = distinct !DILexicalBlock(scope: !311, file: !66, line: 220, column: 5)
!319 = !DILocation(line: 222, column: 17, scope: !317)
!320 = !DILocalVariable(name: "buffer", scope: !317, file: !66, line: 223, type: !173)
!321 = !DILocation(line: 223, column: 17, scope: !317)
!322 = !DILocation(line: 225, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !317, file: !66, line: 225, column: 17)
!324 = !DILocation(line: 225, column: 22, scope: !323)
!325 = !DILocation(line: 225, column: 27, scope: !323)
!326 = !DILocation(line: 225, column: 30, scope: !323)
!327 = !DILocation(line: 225, column: 35, scope: !323)
!328 = !DILocation(line: 225, column: 17, scope: !317)
!329 = !DILocation(line: 227, column: 24, scope: !330)
!330 = distinct !DILexicalBlock(scope: !323, file: !66, line: 226, column: 13)
!331 = !DILocation(line: 227, column: 17, scope: !330)
!332 = !DILocation(line: 227, column: 30, scope: !330)
!333 = !DILocation(line: 229, column: 23, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !66, line: 229, column: 17)
!335 = !DILocation(line: 229, column: 21, scope: !334)
!336 = !DILocation(line: 229, column: 28, scope: !337)
!337 = distinct !DILexicalBlock(scope: !334, file: !66, line: 229, column: 17)
!338 = !DILocation(line: 229, column: 30, scope: !337)
!339 = !DILocation(line: 229, column: 17, scope: !334)
!340 = !DILocation(line: 231, column: 41, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !66, line: 230, column: 17)
!342 = !DILocation(line: 231, column: 34, scope: !341)
!343 = !DILocation(line: 231, column: 21, scope: !341)
!344 = !DILocation(line: 232, column: 17, scope: !341)
!345 = !DILocation(line: 229, column: 37, scope: !337)
!346 = !DILocation(line: 229, column: 17, scope: !337)
!347 = distinct !{!347, !339, !348, !201}
!348 = !DILocation(line: 232, column: 17, scope: !334)
!349 = !DILocation(line: 233, column: 13, scope: !330)
!350 = !DILocation(line: 236, column: 17, scope: !351)
!351 = distinct !DILexicalBlock(scope: !323, file: !66, line: 235, column: 13)
!352 = !DILocation(line: 240, column: 1, scope: !236)
!353 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !66, file: !66, line: 50, type: !233, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!354 = !DILocation(line: 52, column: 5, scope: !353)
!355 = distinct !DISubprogram(name: "goodB2G2", scope: !66, file: !66, line: 243, type: !67, scopeLine: 244, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!356 = !DILocalVariable(name: "data", scope: !355, file: !66, line: 245, type: !71)
!357 = !DILocation(line: 245, column: 9, scope: !355)
!358 = !DILocation(line: 247, column: 10, scope: !355)
!359 = !DILocation(line: 248, column: 8, scope: !360)
!360 = distinct !DILexicalBlock(scope: !355, file: !66, line: 248, column: 8)
!361 = !DILocation(line: 248, column: 8, scope: !355)
!362 = !DILocalVariable(name: "recvResult", scope: !363, file: !66, line: 255, type: !71)
!363 = distinct !DILexicalBlock(scope: !364, file: !66, line: 250, column: 9)
!364 = distinct !DILexicalBlock(scope: !360, file: !66, line: 249, column: 5)
!365 = !DILocation(line: 255, column: 17, scope: !363)
!366 = !DILocalVariable(name: "service", scope: !363, file: !66, line: 256, type: !82)
!367 = !DILocation(line: 256, column: 32, scope: !363)
!368 = !DILocalVariable(name: "connectSocket", scope: !363, file: !66, line: 257, type: !71)
!369 = !DILocation(line: 257, column: 20, scope: !363)
!370 = !DILocalVariable(name: "inputBuffer", scope: !363, file: !66, line: 258, type: !55)
!371 = !DILocation(line: 258, column: 18, scope: !363)
!372 = !DILocation(line: 259, column: 13, scope: !363)
!373 = !DILocation(line: 269, column: 33, scope: !374)
!374 = distinct !DILexicalBlock(scope: !363, file: !66, line: 260, column: 13)
!375 = !DILocation(line: 269, column: 31, scope: !374)
!376 = !DILocation(line: 270, column: 21, scope: !377)
!377 = distinct !DILexicalBlock(scope: !374, file: !66, line: 270, column: 21)
!378 = !DILocation(line: 270, column: 35, scope: !377)
!379 = !DILocation(line: 270, column: 21, scope: !374)
!380 = !DILocation(line: 272, column: 21, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !66, line: 271, column: 17)
!382 = !DILocation(line: 274, column: 17, scope: !374)
!383 = !DILocation(line: 275, column: 25, scope: !374)
!384 = !DILocation(line: 275, column: 36, scope: !374)
!385 = !DILocation(line: 276, column: 43, scope: !374)
!386 = !DILocation(line: 276, column: 25, scope: !374)
!387 = !DILocation(line: 276, column: 34, scope: !374)
!388 = !DILocation(line: 276, column: 41, scope: !374)
!389 = !DILocation(line: 277, column: 36, scope: !374)
!390 = !DILocation(line: 277, column: 25, scope: !374)
!391 = !DILocation(line: 277, column: 34, scope: !374)
!392 = !DILocation(line: 278, column: 29, scope: !393)
!393 = distinct !DILexicalBlock(scope: !374, file: !66, line: 278, column: 21)
!394 = !DILocation(line: 278, column: 44, scope: !393)
!395 = !DILocation(line: 278, column: 21, scope: !393)
!396 = !DILocation(line: 278, column: 89, scope: !393)
!397 = !DILocation(line: 278, column: 21, scope: !374)
!398 = !DILocation(line: 280, column: 21, scope: !399)
!399 = distinct !DILexicalBlock(scope: !393, file: !66, line: 279, column: 17)
!400 = !DILocation(line: 284, column: 35, scope: !374)
!401 = !DILocation(line: 284, column: 50, scope: !374)
!402 = !DILocation(line: 284, column: 30, scope: !374)
!403 = !DILocation(line: 284, column: 28, scope: !374)
!404 = !DILocation(line: 285, column: 21, scope: !405)
!405 = distinct !DILexicalBlock(scope: !374, file: !66, line: 285, column: 21)
!406 = !DILocation(line: 285, column: 32, scope: !405)
!407 = !DILocation(line: 285, column: 48, scope: !405)
!408 = !DILocation(line: 285, column: 51, scope: !405)
!409 = !DILocation(line: 285, column: 62, scope: !405)
!410 = !DILocation(line: 285, column: 21, scope: !374)
!411 = !DILocation(line: 287, column: 21, scope: !412)
!412 = distinct !DILexicalBlock(scope: !405, file: !66, line: 286, column: 17)
!413 = !DILocation(line: 290, column: 29, scope: !374)
!414 = !DILocation(line: 290, column: 17, scope: !374)
!415 = !DILocation(line: 290, column: 41, scope: !374)
!416 = !DILocation(line: 292, column: 29, scope: !374)
!417 = !DILocation(line: 292, column: 24, scope: !374)
!418 = !DILocation(line: 292, column: 22, scope: !374)
!419 = !DILocation(line: 293, column: 13, scope: !374)
!420 = !DILocation(line: 295, column: 17, scope: !421)
!421 = distinct !DILexicalBlock(scope: !363, file: !66, line: 295, column: 17)
!422 = !DILocation(line: 295, column: 31, scope: !421)
!423 = !DILocation(line: 295, column: 17, scope: !363)
!424 = !DILocation(line: 297, column: 30, scope: !425)
!425 = distinct !DILexicalBlock(scope: !421, file: !66, line: 296, column: 13)
!426 = !DILocation(line: 297, column: 17, scope: !425)
!427 = !DILocation(line: 298, column: 13, scope: !425)
!428 = !DILocation(line: 306, column: 5, scope: !364)
!429 = !DILocation(line: 307, column: 8, scope: !430)
!430 = distinct !DILexicalBlock(scope: !355, file: !66, line: 307, column: 8)
!431 = !DILocation(line: 307, column: 8, scope: !355)
!432 = !DILocalVariable(name: "i", scope: !433, file: !66, line: 310, type: !71)
!433 = distinct !DILexicalBlock(scope: !434, file: !66, line: 309, column: 9)
!434 = distinct !DILexicalBlock(scope: !430, file: !66, line: 308, column: 5)
!435 = !DILocation(line: 310, column: 17, scope: !433)
!436 = !DILocalVariable(name: "buffer", scope: !433, file: !66, line: 311, type: !173)
!437 = !DILocation(line: 311, column: 17, scope: !433)
!438 = !DILocation(line: 313, column: 17, scope: !439)
!439 = distinct !DILexicalBlock(scope: !433, file: !66, line: 313, column: 17)
!440 = !DILocation(line: 313, column: 22, scope: !439)
!441 = !DILocation(line: 313, column: 27, scope: !439)
!442 = !DILocation(line: 313, column: 30, scope: !439)
!443 = !DILocation(line: 313, column: 35, scope: !439)
!444 = !DILocation(line: 313, column: 17, scope: !433)
!445 = !DILocation(line: 315, column: 24, scope: !446)
!446 = distinct !DILexicalBlock(scope: !439, file: !66, line: 314, column: 13)
!447 = !DILocation(line: 315, column: 17, scope: !446)
!448 = !DILocation(line: 315, column: 30, scope: !446)
!449 = !DILocation(line: 317, column: 23, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !66, line: 317, column: 17)
!451 = !DILocation(line: 317, column: 21, scope: !450)
!452 = !DILocation(line: 317, column: 28, scope: !453)
!453 = distinct !DILexicalBlock(scope: !450, file: !66, line: 317, column: 17)
!454 = !DILocation(line: 317, column: 30, scope: !453)
!455 = !DILocation(line: 317, column: 17, scope: !450)
!456 = !DILocation(line: 319, column: 41, scope: !457)
!457 = distinct !DILexicalBlock(scope: !453, file: !66, line: 318, column: 17)
!458 = !DILocation(line: 319, column: 34, scope: !457)
!459 = !DILocation(line: 319, column: 21, scope: !457)
!460 = !DILocation(line: 320, column: 17, scope: !457)
!461 = !DILocation(line: 317, column: 37, scope: !453)
!462 = !DILocation(line: 317, column: 17, scope: !453)
!463 = distinct !{!463, !455, !464, !201}
!464 = !DILocation(line: 320, column: 17, scope: !450)
!465 = !DILocation(line: 321, column: 13, scope: !446)
!466 = !DILocation(line: 324, column: 17, scope: !467)
!467 = distinct !DILexicalBlock(scope: !439, file: !66, line: 323, column: 13)
!468 = !DILocation(line: 327, column: 5, scope: !434)
!469 = !DILocation(line: 328, column: 1, scope: !355)
!470 = distinct !DISubprogram(name: "goodG2B1", scope: !66, file: !66, line: 331, type: !67, scopeLine: 332, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!471 = !DILocalVariable(name: "data", scope: !470, file: !66, line: 333, type: !71)
!472 = !DILocation(line: 333, column: 9, scope: !470)
!473 = !DILocation(line: 335, column: 10, scope: !470)
!474 = !DILocation(line: 336, column: 8, scope: !475)
!475 = distinct !DILexicalBlock(scope: !470, file: !66, line: 336, column: 8)
!476 = !DILocation(line: 336, column: 8, scope: !470)
!477 = !DILocation(line: 339, column: 9, scope: !478)
!478 = distinct !DILexicalBlock(scope: !475, file: !66, line: 337, column: 5)
!479 = !DILocation(line: 340, column: 5, scope: !478)
!480 = !DILocation(line: 345, column: 14, scope: !481)
!481 = distinct !DILexicalBlock(scope: !475, file: !66, line: 342, column: 5)
!482 = !DILocation(line: 347, column: 8, scope: !483)
!483 = distinct !DILexicalBlock(scope: !470, file: !66, line: 347, column: 8)
!484 = !DILocation(line: 347, column: 8, scope: !470)
!485 = !DILocalVariable(name: "i", scope: !486, file: !66, line: 350, type: !71)
!486 = distinct !DILexicalBlock(scope: !487, file: !66, line: 349, column: 9)
!487 = distinct !DILexicalBlock(scope: !483, file: !66, line: 348, column: 5)
!488 = !DILocation(line: 350, column: 17, scope: !486)
!489 = !DILocalVariable(name: "buffer", scope: !486, file: !66, line: 351, type: !173)
!490 = !DILocation(line: 351, column: 17, scope: !486)
!491 = !DILocation(line: 354, column: 17, scope: !492)
!492 = distinct !DILexicalBlock(scope: !486, file: !66, line: 354, column: 17)
!493 = !DILocation(line: 354, column: 22, scope: !492)
!494 = !DILocation(line: 354, column: 17, scope: !486)
!495 = !DILocation(line: 356, column: 24, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !66, line: 355, column: 13)
!497 = !DILocation(line: 356, column: 17, scope: !496)
!498 = !DILocation(line: 356, column: 30, scope: !496)
!499 = !DILocation(line: 358, column: 23, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !66, line: 358, column: 17)
!501 = !DILocation(line: 358, column: 21, scope: !500)
!502 = !DILocation(line: 358, column: 28, scope: !503)
!503 = distinct !DILexicalBlock(scope: !500, file: !66, line: 358, column: 17)
!504 = !DILocation(line: 358, column: 30, scope: !503)
!505 = !DILocation(line: 358, column: 17, scope: !500)
!506 = !DILocation(line: 360, column: 41, scope: !507)
!507 = distinct !DILexicalBlock(scope: !503, file: !66, line: 359, column: 17)
!508 = !DILocation(line: 360, column: 34, scope: !507)
!509 = !DILocation(line: 360, column: 21, scope: !507)
!510 = !DILocation(line: 361, column: 17, scope: !507)
!511 = !DILocation(line: 358, column: 37, scope: !503)
!512 = !DILocation(line: 358, column: 17, scope: !503)
!513 = distinct !{!513, !505, !514, !201}
!514 = !DILocation(line: 361, column: 17, scope: !500)
!515 = !DILocation(line: 362, column: 13, scope: !496)
!516 = !DILocation(line: 365, column: 17, scope: !517)
!517 = distinct !DILexicalBlock(scope: !492, file: !66, line: 364, column: 13)
!518 = !DILocation(line: 368, column: 5, scope: !487)
!519 = !DILocation(line: 369, column: 1, scope: !470)
!520 = distinct !DISubprogram(name: "goodG2B2", scope: !66, file: !66, line: 372, type: !67, scopeLine: 373, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!521 = !DILocalVariable(name: "data", scope: !520, file: !66, line: 374, type: !71)
!522 = !DILocation(line: 374, column: 9, scope: !520)
!523 = !DILocation(line: 376, column: 10, scope: !520)
!524 = !DILocation(line: 377, column: 8, scope: !525)
!525 = distinct !DILexicalBlock(scope: !520, file: !66, line: 377, column: 8)
!526 = !DILocation(line: 377, column: 8, scope: !520)
!527 = !DILocation(line: 381, column: 14, scope: !528)
!528 = distinct !DILexicalBlock(scope: !525, file: !66, line: 378, column: 5)
!529 = !DILocation(line: 382, column: 5, scope: !528)
!530 = !DILocation(line: 383, column: 8, scope: !531)
!531 = distinct !DILexicalBlock(scope: !520, file: !66, line: 383, column: 8)
!532 = !DILocation(line: 383, column: 8, scope: !520)
!533 = !DILocalVariable(name: "i", scope: !534, file: !66, line: 386, type: !71)
!534 = distinct !DILexicalBlock(scope: !535, file: !66, line: 385, column: 9)
!535 = distinct !DILexicalBlock(scope: !531, file: !66, line: 384, column: 5)
!536 = !DILocation(line: 386, column: 17, scope: !534)
!537 = !DILocalVariable(name: "buffer", scope: !534, file: !66, line: 387, type: !173)
!538 = !DILocation(line: 387, column: 17, scope: !534)
!539 = !DILocation(line: 390, column: 17, scope: !540)
!540 = distinct !DILexicalBlock(scope: !534, file: !66, line: 390, column: 17)
!541 = !DILocation(line: 390, column: 22, scope: !540)
!542 = !DILocation(line: 390, column: 17, scope: !534)
!543 = !DILocation(line: 392, column: 24, scope: !544)
!544 = distinct !DILexicalBlock(scope: !540, file: !66, line: 391, column: 13)
!545 = !DILocation(line: 392, column: 17, scope: !544)
!546 = !DILocation(line: 392, column: 30, scope: !544)
!547 = !DILocation(line: 394, column: 23, scope: !548)
!548 = distinct !DILexicalBlock(scope: !544, file: !66, line: 394, column: 17)
!549 = !DILocation(line: 394, column: 21, scope: !548)
!550 = !DILocation(line: 394, column: 28, scope: !551)
!551 = distinct !DILexicalBlock(scope: !548, file: !66, line: 394, column: 17)
!552 = !DILocation(line: 394, column: 30, scope: !551)
!553 = !DILocation(line: 394, column: 17, scope: !548)
!554 = !DILocation(line: 396, column: 41, scope: !555)
!555 = distinct !DILexicalBlock(scope: !551, file: !66, line: 395, column: 17)
!556 = !DILocation(line: 396, column: 34, scope: !555)
!557 = !DILocation(line: 396, column: 21, scope: !555)
!558 = !DILocation(line: 397, column: 17, scope: !555)
!559 = !DILocation(line: 394, column: 37, scope: !551)
!560 = !DILocation(line: 394, column: 17, scope: !551)
!561 = distinct !{!561, !553, !562, !201}
!562 = !DILocation(line: 397, column: 17, scope: !548)
!563 = !DILocation(line: 398, column: 13, scope: !544)
!564 = !DILocation(line: 401, column: 17, scope: !565)
!565 = distinct !DILexicalBlock(scope: !540, file: !66, line: 400, column: 13)
!566 = !DILocation(line: 404, column: 5, scope: !535)
!567 = !DILocation(line: 405, column: 1, scope: !520)
