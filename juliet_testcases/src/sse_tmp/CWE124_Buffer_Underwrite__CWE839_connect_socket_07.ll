; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_07_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 -1, i32* %data, align 4, !dbg !76
  %0 = load i32, i32* @staticFive, align 4, !dbg !77
  %cmp = icmp eq i32 %0, 5, !dbg !79
  br i1 %cmp, label %if.then, label %if.end23, !dbg !80

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !81, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !85, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 -1, i32* %connectSocket, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  br label %do.body, !dbg !112

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !113
  store i32 %call, i32* %connectSocket, align 4, !dbg !115
  %1 = load i32, i32* %connectSocket, align 4, !dbg !116
  %cmp1 = icmp eq i32 %1, -1, !dbg !118
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !119

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !120

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !122
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !123
  store i16 2, i16* %sin_family, align 4, !dbg !124
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !125
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !126
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !127
  store i32 %call3, i32* %s_addr, align 4, !dbg !128
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !129
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !130
  store i16 %call4, i16* %sin_port, align 2, !dbg !131
  %3 = load i32, i32* %connectSocket, align 4, !dbg !132
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !134
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !135
  %cmp6 = icmp eq i32 %call5, -1, !dbg !136
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !137

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !138

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !140
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !141
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !142
  %conv = trunc i64 %call9 to i32, !dbg !142
  store i32 %conv, i32* %recvResult, align 4, !dbg !143
  %6 = load i32, i32* %recvResult, align 4, !dbg !144
  %cmp10 = icmp eq i32 %6, -1, !dbg !146
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !147

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !148
  %cmp12 = icmp eq i32 %7, 0, !dbg !149
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !150

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !151

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !153
  %idxprom = sext i32 %8 to i64, !dbg !154
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !154
  store i8 0, i8* %arrayidx, align 1, !dbg !155
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !156
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !157
  store i32 %call17, i32* %data, align 4, !dbg !158
  br label %do.end, !dbg !159

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !160
  %cmp18 = icmp ne i32 %9, -1, !dbg !162
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !163

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !164
  %call21 = call i32 @close(i32 %10), !dbg !166
  br label %if.end22, !dbg !167

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !168

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @staticFive, align 4, !dbg !169
  %cmp24 = icmp eq i32 %11, 5, !dbg !171
  br i1 %cmp24, label %if.then26, label %if.end37, !dbg !172

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !173, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !177, metadata !DIExpression()), !dbg !181
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !181
  %13 = load i32, i32* %data, align 4, !dbg !182
  %cmp27 = icmp slt i32 %13, 10, !dbg !184
  br i1 %cmp27, label %if.then29, label %if.else, !dbg !185

if.then29:                                        ; preds = %if.then26
  %14 = load i32, i32* %data, align 4, !dbg !186
  %idxprom30 = sext i32 %14 to i64, !dbg !188
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !188
  store i32 1, i32* %arrayidx31, align 4, !dbg !189
  store i32 0, i32* %i, align 4, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %if.then29
  %15 = load i32, i32* %i, align 4, !dbg !193
  %cmp32 = icmp slt i32 %15, 10, !dbg !195
  br i1 %cmp32, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  %16 = load i32, i32* %i, align 4, !dbg !197
  %idxprom34 = sext i32 %16 to i64, !dbg !199
  %arrayidx35 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom34, !dbg !199
  %17 = load i32, i32* %arrayidx35, align 4, !dbg !199
  call void @printIntLine(i32 %17), !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4, !dbg !202
  %inc = add nsw i32 %18, 1, !dbg !202
  store i32 %inc, i32* %i, align 4, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  br label %if.end36, !dbg !207

if.else:                                          ; preds = %if.then26
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !208
  br label %if.end36

if.end36:                                         ; preds = %if.else, %for.end
  br label %if.end37, !dbg !210

if.end37:                                         ; preds = %if.end36, %if.end23
  ret void, !dbg !211
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_07_good() #0 !dbg !212 {
entry:
  call void @goodB2G1(), !dbg !213
  call void @goodB2G2(), !dbg !214
  call void @goodG2B1(), !dbg !215
  call void @goodG2B2(), !dbg !216
  ret void, !dbg !217
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !218 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !223, metadata !DIExpression()), !dbg !224
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !225, metadata !DIExpression()), !dbg !226
  %call = call i64 @time(i64* null) #7, !dbg !227
  %conv = trunc i64 %call to i32, !dbg !228
  call void @srand(i32 %conv) #7, !dbg !229
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !230
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_07_good(), !dbg !231
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !232
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !233
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_07_bad(), !dbg !234
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !235
  ret i32 0, !dbg !236
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !237 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !238, metadata !DIExpression()), !dbg !239
  store i32 -1, i32* %data, align 4, !dbg !240
  %0 = load i32, i32* @staticFive, align 4, !dbg !241
  %cmp = icmp eq i32 %0, 5, !dbg !243
  br i1 %cmp, label %if.then, label %if.end23, !dbg !244

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !245, metadata !DIExpression()), !dbg !248
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !249, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !251, metadata !DIExpression()), !dbg !252
  store i32 -1, i32* %connectSocket, align 4, !dbg !252
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !253, metadata !DIExpression()), !dbg !254
  br label %do.body, !dbg !255

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !256
  store i32 %call, i32* %connectSocket, align 4, !dbg !258
  %1 = load i32, i32* %connectSocket, align 4, !dbg !259
  %cmp1 = icmp eq i32 %1, -1, !dbg !261
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !262

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !263

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !265
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !265
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !266
  store i16 2, i16* %sin_family, align 4, !dbg !267
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !268
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !269
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !270
  store i32 %call3, i32* %s_addr, align 4, !dbg !271
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !272
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !273
  store i16 %call4, i16* %sin_port, align 2, !dbg !274
  %3 = load i32, i32* %connectSocket, align 4, !dbg !275
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !277
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !278
  %cmp6 = icmp eq i32 %call5, -1, !dbg !279
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !280

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !281

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !283
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !284
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !285
  %conv = trunc i64 %call9 to i32, !dbg !285
  store i32 %conv, i32* %recvResult, align 4, !dbg !286
  %6 = load i32, i32* %recvResult, align 4, !dbg !287
  %cmp10 = icmp eq i32 %6, -1, !dbg !289
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !290

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !291
  %cmp12 = icmp eq i32 %7, 0, !dbg !292
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !293

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !294

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !296
  %idxprom = sext i32 %8 to i64, !dbg !297
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !297
  store i8 0, i8* %arrayidx, align 1, !dbg !298
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !299
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !300
  store i32 %call17, i32* %data, align 4, !dbg !301
  br label %do.end, !dbg !302

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !303
  %cmp18 = icmp ne i32 %9, -1, !dbg !305
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !306

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !307
  %call21 = call i32 @close(i32 %10), !dbg !309
  br label %if.end22, !dbg !310

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !311

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @staticFive, align 4, !dbg !312
  %cmp24 = icmp ne i32 %11, 5, !dbg !314
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !315

if.then26:                                        ; preds = %if.end23
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !316
  br label %if.end40, !dbg !318

if.else:                                          ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !319, metadata !DIExpression()), !dbg !322
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !323, metadata !DIExpression()), !dbg !324
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !324
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !324
  %13 = load i32, i32* %data, align 4, !dbg !325
  %cmp27 = icmp sge i32 %13, 0, !dbg !327
  br i1 %cmp27, label %land.lhs.true, label %if.else38, !dbg !328

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32, i32* %data, align 4, !dbg !329
  %cmp29 = icmp slt i32 %14, 10, !dbg !330
  br i1 %cmp29, label %if.then31, label %if.else38, !dbg !331

if.then31:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !332
  %idxprom32 = sext i32 %15 to i64, !dbg !334
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !334
  store i32 1, i32* %arrayidx33, align 4, !dbg !335
  store i32 0, i32* %i, align 4, !dbg !336
  br label %for.cond, !dbg !338

for.cond:                                         ; preds = %for.inc, %if.then31
  %16 = load i32, i32* %i, align 4, !dbg !339
  %cmp34 = icmp slt i32 %16, 10, !dbg !341
  br i1 %cmp34, label %for.body, label %for.end, !dbg !342

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !343
  %idxprom36 = sext i32 %17 to i64, !dbg !345
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !345
  %18 = load i32, i32* %arrayidx37, align 4, !dbg !345
  call void @printIntLine(i32 %18), !dbg !346
  br label %for.inc, !dbg !347

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !348
  %inc = add nsw i32 %19, 1, !dbg !348
  store i32 %inc, i32* %i, align 4, !dbg !348
  br label %for.cond, !dbg !349, !llvm.loop !350

for.end:                                          ; preds = %for.cond
  br label %if.end39, !dbg !352

if.else38:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !353
  br label %if.end39

if.end39:                                         ; preds = %if.else38, %for.end
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.then26
  ret void, !dbg !355
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !356 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !357, metadata !DIExpression()), !dbg !358
  store i32 -1, i32* %data, align 4, !dbg !359
  %0 = load i32, i32* @staticFive, align 4, !dbg !360
  %cmp = icmp eq i32 %0, 5, !dbg !362
  br i1 %cmp, label %if.then, label %if.end23, !dbg !363

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !364, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !368, metadata !DIExpression()), !dbg !369
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !370, metadata !DIExpression()), !dbg !371
  store i32 -1, i32* %connectSocket, align 4, !dbg !371
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !372, metadata !DIExpression()), !dbg !373
  br label %do.body, !dbg !374

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !375
  store i32 %call, i32* %connectSocket, align 4, !dbg !377
  %1 = load i32, i32* %connectSocket, align 4, !dbg !378
  %cmp1 = icmp eq i32 %1, -1, !dbg !380
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !381

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !382

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !384
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !384
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !385
  store i16 2, i16* %sin_family, align 4, !dbg !386
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !387
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !388
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !389
  store i32 %call3, i32* %s_addr, align 4, !dbg !390
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !391
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !392
  store i16 %call4, i16* %sin_port, align 2, !dbg !393
  %3 = load i32, i32* %connectSocket, align 4, !dbg !394
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !396
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !397
  %cmp6 = icmp eq i32 %call5, -1, !dbg !398
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !399

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !400

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !402
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !403
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !404
  %conv = trunc i64 %call9 to i32, !dbg !404
  store i32 %conv, i32* %recvResult, align 4, !dbg !405
  %6 = load i32, i32* %recvResult, align 4, !dbg !406
  %cmp10 = icmp eq i32 %6, -1, !dbg !408
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !409

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !410
  %cmp12 = icmp eq i32 %7, 0, !dbg !411
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !412

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !413

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !415
  %idxprom = sext i32 %8 to i64, !dbg !416
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !416
  store i8 0, i8* %arrayidx, align 1, !dbg !417
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !418
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !419
  store i32 %call17, i32* %data, align 4, !dbg !420
  br label %do.end, !dbg !421

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !422
  %cmp18 = icmp ne i32 %9, -1, !dbg !424
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !425

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !426
  %call21 = call i32 @close(i32 %10), !dbg !428
  br label %if.end22, !dbg !429

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !430

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @staticFive, align 4, !dbg !431
  %cmp24 = icmp eq i32 %11, 5, !dbg !433
  br i1 %cmp24, label %if.then26, label %if.end39, !dbg !434

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !435, metadata !DIExpression()), !dbg !438
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !439, metadata !DIExpression()), !dbg !440
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !440
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !440
  %13 = load i32, i32* %data, align 4, !dbg !441
  %cmp27 = icmp sge i32 %13, 0, !dbg !443
  br i1 %cmp27, label %land.lhs.true, label %if.else, !dbg !444

land.lhs.true:                                    ; preds = %if.then26
  %14 = load i32, i32* %data, align 4, !dbg !445
  %cmp29 = icmp slt i32 %14, 10, !dbg !446
  br i1 %cmp29, label %if.then31, label %if.else, !dbg !447

if.then31:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !448
  %idxprom32 = sext i32 %15 to i64, !dbg !450
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !450
  store i32 1, i32* %arrayidx33, align 4, !dbg !451
  store i32 0, i32* %i, align 4, !dbg !452
  br label %for.cond, !dbg !454

for.cond:                                         ; preds = %for.inc, %if.then31
  %16 = load i32, i32* %i, align 4, !dbg !455
  %cmp34 = icmp slt i32 %16, 10, !dbg !457
  br i1 %cmp34, label %for.body, label %for.end, !dbg !458

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !459
  %idxprom36 = sext i32 %17 to i64, !dbg !461
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !461
  %18 = load i32, i32* %arrayidx37, align 4, !dbg !461
  call void @printIntLine(i32 %18), !dbg !462
  br label %for.inc, !dbg !463

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !464
  %inc = add nsw i32 %19, 1, !dbg !464
  store i32 %inc, i32* %i, align 4, !dbg !464
  br label %for.cond, !dbg !465, !llvm.loop !466

for.end:                                          ; preds = %for.cond
  br label %if.end38, !dbg !468

if.else:                                          ; preds = %land.lhs.true, %if.then26
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !469
  br label %if.end38

if.end38:                                         ; preds = %if.else, %for.end
  br label %if.end39, !dbg !471

if.end39:                                         ; preds = %if.end38, %if.end23
  ret void, !dbg !472
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !473 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !474, metadata !DIExpression()), !dbg !475
  store i32 -1, i32* %data, align 4, !dbg !476
  %0 = load i32, i32* @staticFive, align 4, !dbg !477
  %cmp = icmp ne i32 %0, 5, !dbg !479
  br i1 %cmp, label %if.then, label %if.else, !dbg !480

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !481
  br label %if.end, !dbg !483

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !484
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !486
  %cmp1 = icmp eq i32 %1, 5, !dbg !488
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !489

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !490, metadata !DIExpression()), !dbg !493
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !494, metadata !DIExpression()), !dbg !495
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !495
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !495
  %3 = load i32, i32* %data, align 4, !dbg !496
  %cmp3 = icmp slt i32 %3, 10, !dbg !498
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !499

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !500
  %idxprom = sext i32 %4 to i64, !dbg !502
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !502
  store i32 1, i32* %arrayidx, align 4, !dbg !503
  store i32 0, i32* %i, align 4, !dbg !504
  br label %for.cond, !dbg !506

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !507
  %cmp5 = icmp slt i32 %5, 10, !dbg !509
  br i1 %cmp5, label %for.body, label %for.end, !dbg !510

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !511
  %idxprom6 = sext i32 %6 to i64, !dbg !513
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !513
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !513
  call void @printIntLine(i32 %7), !dbg !514
  br label %for.inc, !dbg !515

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !516
  %inc = add nsw i32 %8, 1, !dbg !516
  store i32 %inc, i32* %i, align 4, !dbg !516
  br label %for.cond, !dbg !517, !llvm.loop !518

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !520

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !521
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !523

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !524
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !525 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !526, metadata !DIExpression()), !dbg !527
  store i32 -1, i32* %data, align 4, !dbg !528
  %0 = load i32, i32* @staticFive, align 4, !dbg !529
  %cmp = icmp eq i32 %0, 5, !dbg !531
  br i1 %cmp, label %if.then, label %if.end, !dbg !532

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !533
  br label %if.end, !dbg !535

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !536
  %cmp1 = icmp eq i32 %1, 5, !dbg !538
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !539

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !540, metadata !DIExpression()), !dbg !543
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !544, metadata !DIExpression()), !dbg !545
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !545
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !545
  %3 = load i32, i32* %data, align 4, !dbg !546
  %cmp3 = icmp slt i32 %3, 10, !dbg !548
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !549

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !550
  %idxprom = sext i32 %4 to i64, !dbg !552
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !552
  store i32 1, i32* %arrayidx, align 4, !dbg !553
  store i32 0, i32* %i, align 4, !dbg !554
  br label %for.cond, !dbg !556

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !557
  %cmp5 = icmp slt i32 %5, 10, !dbg !559
  br i1 %cmp5, label %for.body, label %for.end, !dbg !560

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !561
  %idxprom6 = sext i32 %6 to i64, !dbg !563
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !563
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !563
  call void @printIntLine(i32 %7), !dbg !564
  br label %for.inc, !dbg !565

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !566
  %inc = add nsw i32 %8, 1, !dbg !566
  store i32 %inc, i32* %i, align 4, !dbg !566
  br label %for.cond, !dbg !567, !llvm.loop !568

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !570

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !571
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !573

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !574
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
!llvm.module.flags = !{!64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !62, line: 45, type: !63, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !61, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_07.c", directory: "/home/joelyang/SSE-Assessment")
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
!47 = !{!48, !7}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !50, line: 178, size: 128, elements: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!51 = !{!52, !56}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !49, file: !50, line: 180, baseType: !53, size: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !54, line: 28, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!55 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !49, file: !50, line: 181, baseType: !57, size: 112, offset: 16)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 112, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 14)
!61 = !{!0}
!62 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_07.c", directory: "/home/joelyang/SSE-Assessment")
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !{i32 7, !"Dwarf Version", i32 4}
!65 = !{i32 2, !"Debug Info Version", i32 3}
!66 = !{i32 1, !"wchar_size", i32 4}
!67 = !{i32 7, !"uwtable", i32 1}
!68 = !{i32 7, !"frame-pointer", i32 2}
!69 = !{!"clang version 13.0.0"}
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_07_bad", scope: !62, file: !62, line: 49, type: !71, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !73)
!71 = !DISubroutineType(types: !72)
!72 = !{null}
!73 = !{}
!74 = !DILocalVariable(name: "data", scope: !70, file: !62, line: 51, type: !63)
!75 = !DILocation(line: 51, column: 9, scope: !70)
!76 = !DILocation(line: 53, column: 10, scope: !70)
!77 = !DILocation(line: 54, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !62, line: 54, column: 8)
!79 = !DILocation(line: 54, column: 18, scope: !78)
!80 = !DILocation(line: 54, column: 8, scope: !70)
!81 = !DILocalVariable(name: "recvResult", scope: !82, file: !62, line: 61, type: !63)
!82 = distinct !DILexicalBlock(scope: !83, file: !62, line: 56, column: 9)
!83 = distinct !DILexicalBlock(scope: !78, file: !62, line: 55, column: 5)
!84 = !DILocation(line: 61, column: 17, scope: !82)
!85 = !DILocalVariable(name: "service", scope: !82, file: !62, line: 62, type: !86)
!86 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !87)
!87 = !{!88, !89, !95, !102}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !86, file: !19, line: 240, baseType: !53, size: 16)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !86, file: !19, line: 241, baseType: !90, size: 16, offset: 16)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !92, line: 25, baseType: !93)
!92 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !94, line: 40, baseType: !55)
!94 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !86, file: !19, line: 242, baseType: !96, size: 32, offset: 32)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !97)
!97 = !{!98}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !96, file: !19, line: 33, baseType: !99, size: 32)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !92, line: 26, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !94, line: 42, baseType: !7)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !86, file: !19, line: 245, baseType: !103, size: 64, offset: 64)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 64, elements: !105)
!104 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!105 = !{!106}
!106 = !DISubrange(count: 8)
!107 = !DILocation(line: 62, column: 32, scope: !82)
!108 = !DILocalVariable(name: "connectSocket", scope: !82, file: !62, line: 63, type: !63)
!109 = !DILocation(line: 63, column: 20, scope: !82)
!110 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !62, line: 64, type: !57)
!111 = !DILocation(line: 64, column: 18, scope: !82)
!112 = !DILocation(line: 65, column: 13, scope: !82)
!113 = !DILocation(line: 75, column: 33, scope: !114)
!114 = distinct !DILexicalBlock(scope: !82, file: !62, line: 66, column: 13)
!115 = !DILocation(line: 75, column: 31, scope: !114)
!116 = !DILocation(line: 76, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !62, line: 76, column: 21)
!118 = !DILocation(line: 76, column: 35, scope: !117)
!119 = !DILocation(line: 76, column: 21, scope: !114)
!120 = !DILocation(line: 78, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !62, line: 77, column: 17)
!122 = !DILocation(line: 80, column: 17, scope: !114)
!123 = !DILocation(line: 81, column: 25, scope: !114)
!124 = !DILocation(line: 81, column: 36, scope: !114)
!125 = !DILocation(line: 82, column: 43, scope: !114)
!126 = !DILocation(line: 82, column: 25, scope: !114)
!127 = !DILocation(line: 82, column: 34, scope: !114)
!128 = !DILocation(line: 82, column: 41, scope: !114)
!129 = !DILocation(line: 83, column: 36, scope: !114)
!130 = !DILocation(line: 83, column: 25, scope: !114)
!131 = !DILocation(line: 83, column: 34, scope: !114)
!132 = !DILocation(line: 84, column: 29, scope: !133)
!133 = distinct !DILexicalBlock(scope: !114, file: !62, line: 84, column: 21)
!134 = !DILocation(line: 84, column: 44, scope: !133)
!135 = !DILocation(line: 84, column: 21, scope: !133)
!136 = !DILocation(line: 84, column: 89, scope: !133)
!137 = !DILocation(line: 84, column: 21, scope: !114)
!138 = !DILocation(line: 86, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !62, line: 85, column: 17)
!140 = !DILocation(line: 90, column: 35, scope: !114)
!141 = !DILocation(line: 90, column: 50, scope: !114)
!142 = !DILocation(line: 90, column: 30, scope: !114)
!143 = !DILocation(line: 90, column: 28, scope: !114)
!144 = !DILocation(line: 91, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !114, file: !62, line: 91, column: 21)
!146 = !DILocation(line: 91, column: 32, scope: !145)
!147 = !DILocation(line: 91, column: 48, scope: !145)
!148 = !DILocation(line: 91, column: 51, scope: !145)
!149 = !DILocation(line: 91, column: 62, scope: !145)
!150 = !DILocation(line: 91, column: 21, scope: !114)
!151 = !DILocation(line: 93, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !145, file: !62, line: 92, column: 17)
!153 = !DILocation(line: 96, column: 29, scope: !114)
!154 = !DILocation(line: 96, column: 17, scope: !114)
!155 = !DILocation(line: 96, column: 41, scope: !114)
!156 = !DILocation(line: 98, column: 29, scope: !114)
!157 = !DILocation(line: 98, column: 24, scope: !114)
!158 = !DILocation(line: 98, column: 22, scope: !114)
!159 = !DILocation(line: 99, column: 13, scope: !114)
!160 = !DILocation(line: 101, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !82, file: !62, line: 101, column: 17)
!162 = !DILocation(line: 101, column: 31, scope: !161)
!163 = !DILocation(line: 101, column: 17, scope: !82)
!164 = !DILocation(line: 103, column: 30, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !62, line: 102, column: 13)
!166 = !DILocation(line: 103, column: 17, scope: !165)
!167 = !DILocation(line: 104, column: 13, scope: !165)
!168 = !DILocation(line: 112, column: 5, scope: !83)
!169 = !DILocation(line: 113, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !70, file: !62, line: 113, column: 8)
!171 = !DILocation(line: 113, column: 18, scope: !170)
!172 = !DILocation(line: 113, column: 8, scope: !70)
!173 = !DILocalVariable(name: "i", scope: !174, file: !62, line: 116, type: !63)
!174 = distinct !DILexicalBlock(scope: !175, file: !62, line: 115, column: 9)
!175 = distinct !DILexicalBlock(scope: !170, file: !62, line: 114, column: 5)
!176 = !DILocation(line: 116, column: 17, scope: !174)
!177 = !DILocalVariable(name: "buffer", scope: !174, file: !62, line: 117, type: !178)
!178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 320, elements: !179)
!179 = !{!180}
!180 = !DISubrange(count: 10)
!181 = !DILocation(line: 117, column: 17, scope: !174)
!182 = !DILocation(line: 120, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !174, file: !62, line: 120, column: 17)
!184 = !DILocation(line: 120, column: 22, scope: !183)
!185 = !DILocation(line: 120, column: 17, scope: !174)
!186 = !DILocation(line: 122, column: 24, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !62, line: 121, column: 13)
!188 = !DILocation(line: 122, column: 17, scope: !187)
!189 = !DILocation(line: 122, column: 30, scope: !187)
!190 = !DILocation(line: 124, column: 23, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !62, line: 124, column: 17)
!192 = !DILocation(line: 124, column: 21, scope: !191)
!193 = !DILocation(line: 124, column: 28, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !62, line: 124, column: 17)
!195 = !DILocation(line: 124, column: 30, scope: !194)
!196 = !DILocation(line: 124, column: 17, scope: !191)
!197 = !DILocation(line: 126, column: 41, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !62, line: 125, column: 17)
!199 = !DILocation(line: 126, column: 34, scope: !198)
!200 = !DILocation(line: 126, column: 21, scope: !198)
!201 = !DILocation(line: 127, column: 17, scope: !198)
!202 = !DILocation(line: 124, column: 37, scope: !194)
!203 = !DILocation(line: 124, column: 17, scope: !194)
!204 = distinct !{!204, !196, !205, !206}
!205 = !DILocation(line: 127, column: 17, scope: !191)
!206 = !{!"llvm.loop.mustprogress"}
!207 = !DILocation(line: 128, column: 13, scope: !187)
!208 = !DILocation(line: 131, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !183, file: !62, line: 130, column: 13)
!210 = !DILocation(line: 134, column: 5, scope: !175)
!211 = !DILocation(line: 135, column: 1, scope: !70)
!212 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_07_good", scope: !62, file: !62, line: 399, type: !71, scopeLine: 400, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !73)
!213 = !DILocation(line: 401, column: 5, scope: !212)
!214 = !DILocation(line: 402, column: 5, scope: !212)
!215 = !DILocation(line: 403, column: 5, scope: !212)
!216 = !DILocation(line: 404, column: 5, scope: !212)
!217 = !DILocation(line: 405, column: 1, scope: !212)
!218 = distinct !DISubprogram(name: "main", scope: !62, file: !62, line: 416, type: !219, scopeLine: 417, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !73)
!219 = !DISubroutineType(types: !220)
!220 = !{!63, !63, !221}
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!223 = !DILocalVariable(name: "argc", arg: 1, scope: !218, file: !62, line: 416, type: !63)
!224 = !DILocation(line: 416, column: 14, scope: !218)
!225 = !DILocalVariable(name: "argv", arg: 2, scope: !218, file: !62, line: 416, type: !221)
!226 = !DILocation(line: 416, column: 27, scope: !218)
!227 = !DILocation(line: 419, column: 22, scope: !218)
!228 = !DILocation(line: 419, column: 12, scope: !218)
!229 = !DILocation(line: 419, column: 5, scope: !218)
!230 = !DILocation(line: 421, column: 5, scope: !218)
!231 = !DILocation(line: 422, column: 5, scope: !218)
!232 = !DILocation(line: 423, column: 5, scope: !218)
!233 = !DILocation(line: 426, column: 5, scope: !218)
!234 = !DILocation(line: 427, column: 5, scope: !218)
!235 = !DILocation(line: 428, column: 5, scope: !218)
!236 = !DILocation(line: 430, column: 5, scope: !218)
!237 = distinct !DISubprogram(name: "goodB2G1", scope: !62, file: !62, line: 142, type: !71, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !73)
!238 = !DILocalVariable(name: "data", scope: !237, file: !62, line: 144, type: !63)
!239 = !DILocation(line: 144, column: 9, scope: !237)
!240 = !DILocation(line: 146, column: 10, scope: !237)
!241 = !DILocation(line: 147, column: 8, scope: !242)
!242 = distinct !DILexicalBlock(scope: !237, file: !62, line: 147, column: 8)
!243 = !DILocation(line: 147, column: 18, scope: !242)
!244 = !DILocation(line: 147, column: 8, scope: !237)
!245 = !DILocalVariable(name: "recvResult", scope: !246, file: !62, line: 154, type: !63)
!246 = distinct !DILexicalBlock(scope: !247, file: !62, line: 149, column: 9)
!247 = distinct !DILexicalBlock(scope: !242, file: !62, line: 148, column: 5)
!248 = !DILocation(line: 154, column: 17, scope: !246)
!249 = !DILocalVariable(name: "service", scope: !246, file: !62, line: 155, type: !86)
!250 = !DILocation(line: 155, column: 32, scope: !246)
!251 = !DILocalVariable(name: "connectSocket", scope: !246, file: !62, line: 156, type: !63)
!252 = !DILocation(line: 156, column: 20, scope: !246)
!253 = !DILocalVariable(name: "inputBuffer", scope: !246, file: !62, line: 157, type: !57)
!254 = !DILocation(line: 157, column: 18, scope: !246)
!255 = !DILocation(line: 158, column: 13, scope: !246)
!256 = !DILocation(line: 168, column: 33, scope: !257)
!257 = distinct !DILexicalBlock(scope: !246, file: !62, line: 159, column: 13)
!258 = !DILocation(line: 168, column: 31, scope: !257)
!259 = !DILocation(line: 169, column: 21, scope: !260)
!260 = distinct !DILexicalBlock(scope: !257, file: !62, line: 169, column: 21)
!261 = !DILocation(line: 169, column: 35, scope: !260)
!262 = !DILocation(line: 169, column: 21, scope: !257)
!263 = !DILocation(line: 171, column: 21, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !62, line: 170, column: 17)
!265 = !DILocation(line: 173, column: 17, scope: !257)
!266 = !DILocation(line: 174, column: 25, scope: !257)
!267 = !DILocation(line: 174, column: 36, scope: !257)
!268 = !DILocation(line: 175, column: 43, scope: !257)
!269 = !DILocation(line: 175, column: 25, scope: !257)
!270 = !DILocation(line: 175, column: 34, scope: !257)
!271 = !DILocation(line: 175, column: 41, scope: !257)
!272 = !DILocation(line: 176, column: 36, scope: !257)
!273 = !DILocation(line: 176, column: 25, scope: !257)
!274 = !DILocation(line: 176, column: 34, scope: !257)
!275 = !DILocation(line: 177, column: 29, scope: !276)
!276 = distinct !DILexicalBlock(scope: !257, file: !62, line: 177, column: 21)
!277 = !DILocation(line: 177, column: 44, scope: !276)
!278 = !DILocation(line: 177, column: 21, scope: !276)
!279 = !DILocation(line: 177, column: 89, scope: !276)
!280 = !DILocation(line: 177, column: 21, scope: !257)
!281 = !DILocation(line: 179, column: 21, scope: !282)
!282 = distinct !DILexicalBlock(scope: !276, file: !62, line: 178, column: 17)
!283 = !DILocation(line: 183, column: 35, scope: !257)
!284 = !DILocation(line: 183, column: 50, scope: !257)
!285 = !DILocation(line: 183, column: 30, scope: !257)
!286 = !DILocation(line: 183, column: 28, scope: !257)
!287 = !DILocation(line: 184, column: 21, scope: !288)
!288 = distinct !DILexicalBlock(scope: !257, file: !62, line: 184, column: 21)
!289 = !DILocation(line: 184, column: 32, scope: !288)
!290 = !DILocation(line: 184, column: 48, scope: !288)
!291 = !DILocation(line: 184, column: 51, scope: !288)
!292 = !DILocation(line: 184, column: 62, scope: !288)
!293 = !DILocation(line: 184, column: 21, scope: !257)
!294 = !DILocation(line: 186, column: 21, scope: !295)
!295 = distinct !DILexicalBlock(scope: !288, file: !62, line: 185, column: 17)
!296 = !DILocation(line: 189, column: 29, scope: !257)
!297 = !DILocation(line: 189, column: 17, scope: !257)
!298 = !DILocation(line: 189, column: 41, scope: !257)
!299 = !DILocation(line: 191, column: 29, scope: !257)
!300 = !DILocation(line: 191, column: 24, scope: !257)
!301 = !DILocation(line: 191, column: 22, scope: !257)
!302 = !DILocation(line: 192, column: 13, scope: !257)
!303 = !DILocation(line: 194, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !246, file: !62, line: 194, column: 17)
!305 = !DILocation(line: 194, column: 31, scope: !304)
!306 = !DILocation(line: 194, column: 17, scope: !246)
!307 = !DILocation(line: 196, column: 30, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !62, line: 195, column: 13)
!309 = !DILocation(line: 196, column: 17, scope: !308)
!310 = !DILocation(line: 197, column: 13, scope: !308)
!311 = !DILocation(line: 205, column: 5, scope: !247)
!312 = !DILocation(line: 206, column: 8, scope: !313)
!313 = distinct !DILexicalBlock(scope: !237, file: !62, line: 206, column: 8)
!314 = !DILocation(line: 206, column: 18, scope: !313)
!315 = !DILocation(line: 206, column: 8, scope: !237)
!316 = !DILocation(line: 209, column: 9, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !62, line: 207, column: 5)
!318 = !DILocation(line: 210, column: 5, scope: !317)
!319 = !DILocalVariable(name: "i", scope: !320, file: !62, line: 214, type: !63)
!320 = distinct !DILexicalBlock(scope: !321, file: !62, line: 213, column: 9)
!321 = distinct !DILexicalBlock(scope: !313, file: !62, line: 212, column: 5)
!322 = !DILocation(line: 214, column: 17, scope: !320)
!323 = !DILocalVariable(name: "buffer", scope: !320, file: !62, line: 215, type: !178)
!324 = !DILocation(line: 215, column: 17, scope: !320)
!325 = !DILocation(line: 217, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !320, file: !62, line: 217, column: 17)
!327 = !DILocation(line: 217, column: 22, scope: !326)
!328 = !DILocation(line: 217, column: 27, scope: !326)
!329 = !DILocation(line: 217, column: 30, scope: !326)
!330 = !DILocation(line: 217, column: 35, scope: !326)
!331 = !DILocation(line: 217, column: 17, scope: !320)
!332 = !DILocation(line: 219, column: 24, scope: !333)
!333 = distinct !DILexicalBlock(scope: !326, file: !62, line: 218, column: 13)
!334 = !DILocation(line: 219, column: 17, scope: !333)
!335 = !DILocation(line: 219, column: 30, scope: !333)
!336 = !DILocation(line: 221, column: 23, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !62, line: 221, column: 17)
!338 = !DILocation(line: 221, column: 21, scope: !337)
!339 = !DILocation(line: 221, column: 28, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !62, line: 221, column: 17)
!341 = !DILocation(line: 221, column: 30, scope: !340)
!342 = !DILocation(line: 221, column: 17, scope: !337)
!343 = !DILocation(line: 223, column: 41, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !62, line: 222, column: 17)
!345 = !DILocation(line: 223, column: 34, scope: !344)
!346 = !DILocation(line: 223, column: 21, scope: !344)
!347 = !DILocation(line: 224, column: 17, scope: !344)
!348 = !DILocation(line: 221, column: 37, scope: !340)
!349 = !DILocation(line: 221, column: 17, scope: !340)
!350 = distinct !{!350, !342, !351, !206}
!351 = !DILocation(line: 224, column: 17, scope: !337)
!352 = !DILocation(line: 225, column: 13, scope: !333)
!353 = !DILocation(line: 228, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !326, file: !62, line: 227, column: 13)
!355 = !DILocation(line: 232, column: 1, scope: !237)
!356 = distinct !DISubprogram(name: "goodB2G2", scope: !62, file: !62, line: 235, type: !71, scopeLine: 236, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !73)
!357 = !DILocalVariable(name: "data", scope: !356, file: !62, line: 237, type: !63)
!358 = !DILocation(line: 237, column: 9, scope: !356)
!359 = !DILocation(line: 239, column: 10, scope: !356)
!360 = !DILocation(line: 240, column: 8, scope: !361)
!361 = distinct !DILexicalBlock(scope: !356, file: !62, line: 240, column: 8)
!362 = !DILocation(line: 240, column: 18, scope: !361)
!363 = !DILocation(line: 240, column: 8, scope: !356)
!364 = !DILocalVariable(name: "recvResult", scope: !365, file: !62, line: 247, type: !63)
!365 = distinct !DILexicalBlock(scope: !366, file: !62, line: 242, column: 9)
!366 = distinct !DILexicalBlock(scope: !361, file: !62, line: 241, column: 5)
!367 = !DILocation(line: 247, column: 17, scope: !365)
!368 = !DILocalVariable(name: "service", scope: !365, file: !62, line: 248, type: !86)
!369 = !DILocation(line: 248, column: 32, scope: !365)
!370 = !DILocalVariable(name: "connectSocket", scope: !365, file: !62, line: 249, type: !63)
!371 = !DILocation(line: 249, column: 20, scope: !365)
!372 = !DILocalVariable(name: "inputBuffer", scope: !365, file: !62, line: 250, type: !57)
!373 = !DILocation(line: 250, column: 18, scope: !365)
!374 = !DILocation(line: 251, column: 13, scope: !365)
!375 = !DILocation(line: 261, column: 33, scope: !376)
!376 = distinct !DILexicalBlock(scope: !365, file: !62, line: 252, column: 13)
!377 = !DILocation(line: 261, column: 31, scope: !376)
!378 = !DILocation(line: 262, column: 21, scope: !379)
!379 = distinct !DILexicalBlock(scope: !376, file: !62, line: 262, column: 21)
!380 = !DILocation(line: 262, column: 35, scope: !379)
!381 = !DILocation(line: 262, column: 21, scope: !376)
!382 = !DILocation(line: 264, column: 21, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !62, line: 263, column: 17)
!384 = !DILocation(line: 266, column: 17, scope: !376)
!385 = !DILocation(line: 267, column: 25, scope: !376)
!386 = !DILocation(line: 267, column: 36, scope: !376)
!387 = !DILocation(line: 268, column: 43, scope: !376)
!388 = !DILocation(line: 268, column: 25, scope: !376)
!389 = !DILocation(line: 268, column: 34, scope: !376)
!390 = !DILocation(line: 268, column: 41, scope: !376)
!391 = !DILocation(line: 269, column: 36, scope: !376)
!392 = !DILocation(line: 269, column: 25, scope: !376)
!393 = !DILocation(line: 269, column: 34, scope: !376)
!394 = !DILocation(line: 270, column: 29, scope: !395)
!395 = distinct !DILexicalBlock(scope: !376, file: !62, line: 270, column: 21)
!396 = !DILocation(line: 270, column: 44, scope: !395)
!397 = !DILocation(line: 270, column: 21, scope: !395)
!398 = !DILocation(line: 270, column: 89, scope: !395)
!399 = !DILocation(line: 270, column: 21, scope: !376)
!400 = !DILocation(line: 272, column: 21, scope: !401)
!401 = distinct !DILexicalBlock(scope: !395, file: !62, line: 271, column: 17)
!402 = !DILocation(line: 276, column: 35, scope: !376)
!403 = !DILocation(line: 276, column: 50, scope: !376)
!404 = !DILocation(line: 276, column: 30, scope: !376)
!405 = !DILocation(line: 276, column: 28, scope: !376)
!406 = !DILocation(line: 277, column: 21, scope: !407)
!407 = distinct !DILexicalBlock(scope: !376, file: !62, line: 277, column: 21)
!408 = !DILocation(line: 277, column: 32, scope: !407)
!409 = !DILocation(line: 277, column: 48, scope: !407)
!410 = !DILocation(line: 277, column: 51, scope: !407)
!411 = !DILocation(line: 277, column: 62, scope: !407)
!412 = !DILocation(line: 277, column: 21, scope: !376)
!413 = !DILocation(line: 279, column: 21, scope: !414)
!414 = distinct !DILexicalBlock(scope: !407, file: !62, line: 278, column: 17)
!415 = !DILocation(line: 282, column: 29, scope: !376)
!416 = !DILocation(line: 282, column: 17, scope: !376)
!417 = !DILocation(line: 282, column: 41, scope: !376)
!418 = !DILocation(line: 284, column: 29, scope: !376)
!419 = !DILocation(line: 284, column: 24, scope: !376)
!420 = !DILocation(line: 284, column: 22, scope: !376)
!421 = !DILocation(line: 285, column: 13, scope: !376)
!422 = !DILocation(line: 287, column: 17, scope: !423)
!423 = distinct !DILexicalBlock(scope: !365, file: !62, line: 287, column: 17)
!424 = !DILocation(line: 287, column: 31, scope: !423)
!425 = !DILocation(line: 287, column: 17, scope: !365)
!426 = !DILocation(line: 289, column: 30, scope: !427)
!427 = distinct !DILexicalBlock(scope: !423, file: !62, line: 288, column: 13)
!428 = !DILocation(line: 289, column: 17, scope: !427)
!429 = !DILocation(line: 290, column: 13, scope: !427)
!430 = !DILocation(line: 298, column: 5, scope: !366)
!431 = !DILocation(line: 299, column: 8, scope: !432)
!432 = distinct !DILexicalBlock(scope: !356, file: !62, line: 299, column: 8)
!433 = !DILocation(line: 299, column: 18, scope: !432)
!434 = !DILocation(line: 299, column: 8, scope: !356)
!435 = !DILocalVariable(name: "i", scope: !436, file: !62, line: 302, type: !63)
!436 = distinct !DILexicalBlock(scope: !437, file: !62, line: 301, column: 9)
!437 = distinct !DILexicalBlock(scope: !432, file: !62, line: 300, column: 5)
!438 = !DILocation(line: 302, column: 17, scope: !436)
!439 = !DILocalVariable(name: "buffer", scope: !436, file: !62, line: 303, type: !178)
!440 = !DILocation(line: 303, column: 17, scope: !436)
!441 = !DILocation(line: 305, column: 17, scope: !442)
!442 = distinct !DILexicalBlock(scope: !436, file: !62, line: 305, column: 17)
!443 = !DILocation(line: 305, column: 22, scope: !442)
!444 = !DILocation(line: 305, column: 27, scope: !442)
!445 = !DILocation(line: 305, column: 30, scope: !442)
!446 = !DILocation(line: 305, column: 35, scope: !442)
!447 = !DILocation(line: 305, column: 17, scope: !436)
!448 = !DILocation(line: 307, column: 24, scope: !449)
!449 = distinct !DILexicalBlock(scope: !442, file: !62, line: 306, column: 13)
!450 = !DILocation(line: 307, column: 17, scope: !449)
!451 = !DILocation(line: 307, column: 30, scope: !449)
!452 = !DILocation(line: 309, column: 23, scope: !453)
!453 = distinct !DILexicalBlock(scope: !449, file: !62, line: 309, column: 17)
!454 = !DILocation(line: 309, column: 21, scope: !453)
!455 = !DILocation(line: 309, column: 28, scope: !456)
!456 = distinct !DILexicalBlock(scope: !453, file: !62, line: 309, column: 17)
!457 = !DILocation(line: 309, column: 30, scope: !456)
!458 = !DILocation(line: 309, column: 17, scope: !453)
!459 = !DILocation(line: 311, column: 41, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !62, line: 310, column: 17)
!461 = !DILocation(line: 311, column: 34, scope: !460)
!462 = !DILocation(line: 311, column: 21, scope: !460)
!463 = !DILocation(line: 312, column: 17, scope: !460)
!464 = !DILocation(line: 309, column: 37, scope: !456)
!465 = !DILocation(line: 309, column: 17, scope: !456)
!466 = distinct !{!466, !458, !467, !206}
!467 = !DILocation(line: 312, column: 17, scope: !453)
!468 = !DILocation(line: 313, column: 13, scope: !449)
!469 = !DILocation(line: 316, column: 17, scope: !470)
!470 = distinct !DILexicalBlock(scope: !442, file: !62, line: 315, column: 13)
!471 = !DILocation(line: 319, column: 5, scope: !437)
!472 = !DILocation(line: 320, column: 1, scope: !356)
!473 = distinct !DISubprogram(name: "goodG2B1", scope: !62, file: !62, line: 323, type: !71, scopeLine: 324, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !73)
!474 = !DILocalVariable(name: "data", scope: !473, file: !62, line: 325, type: !63)
!475 = !DILocation(line: 325, column: 9, scope: !473)
!476 = !DILocation(line: 327, column: 10, scope: !473)
!477 = !DILocation(line: 328, column: 8, scope: !478)
!478 = distinct !DILexicalBlock(scope: !473, file: !62, line: 328, column: 8)
!479 = !DILocation(line: 328, column: 18, scope: !478)
!480 = !DILocation(line: 328, column: 8, scope: !473)
!481 = !DILocation(line: 331, column: 9, scope: !482)
!482 = distinct !DILexicalBlock(scope: !478, file: !62, line: 329, column: 5)
!483 = !DILocation(line: 332, column: 5, scope: !482)
!484 = !DILocation(line: 337, column: 14, scope: !485)
!485 = distinct !DILexicalBlock(scope: !478, file: !62, line: 334, column: 5)
!486 = !DILocation(line: 339, column: 8, scope: !487)
!487 = distinct !DILexicalBlock(scope: !473, file: !62, line: 339, column: 8)
!488 = !DILocation(line: 339, column: 18, scope: !487)
!489 = !DILocation(line: 339, column: 8, scope: !473)
!490 = !DILocalVariable(name: "i", scope: !491, file: !62, line: 342, type: !63)
!491 = distinct !DILexicalBlock(scope: !492, file: !62, line: 341, column: 9)
!492 = distinct !DILexicalBlock(scope: !487, file: !62, line: 340, column: 5)
!493 = !DILocation(line: 342, column: 17, scope: !491)
!494 = !DILocalVariable(name: "buffer", scope: !491, file: !62, line: 343, type: !178)
!495 = !DILocation(line: 343, column: 17, scope: !491)
!496 = !DILocation(line: 346, column: 17, scope: !497)
!497 = distinct !DILexicalBlock(scope: !491, file: !62, line: 346, column: 17)
!498 = !DILocation(line: 346, column: 22, scope: !497)
!499 = !DILocation(line: 346, column: 17, scope: !491)
!500 = !DILocation(line: 348, column: 24, scope: !501)
!501 = distinct !DILexicalBlock(scope: !497, file: !62, line: 347, column: 13)
!502 = !DILocation(line: 348, column: 17, scope: !501)
!503 = !DILocation(line: 348, column: 30, scope: !501)
!504 = !DILocation(line: 350, column: 23, scope: !505)
!505 = distinct !DILexicalBlock(scope: !501, file: !62, line: 350, column: 17)
!506 = !DILocation(line: 350, column: 21, scope: !505)
!507 = !DILocation(line: 350, column: 28, scope: !508)
!508 = distinct !DILexicalBlock(scope: !505, file: !62, line: 350, column: 17)
!509 = !DILocation(line: 350, column: 30, scope: !508)
!510 = !DILocation(line: 350, column: 17, scope: !505)
!511 = !DILocation(line: 352, column: 41, scope: !512)
!512 = distinct !DILexicalBlock(scope: !508, file: !62, line: 351, column: 17)
!513 = !DILocation(line: 352, column: 34, scope: !512)
!514 = !DILocation(line: 352, column: 21, scope: !512)
!515 = !DILocation(line: 353, column: 17, scope: !512)
!516 = !DILocation(line: 350, column: 37, scope: !508)
!517 = !DILocation(line: 350, column: 17, scope: !508)
!518 = distinct !{!518, !510, !519, !206}
!519 = !DILocation(line: 353, column: 17, scope: !505)
!520 = !DILocation(line: 354, column: 13, scope: !501)
!521 = !DILocation(line: 357, column: 17, scope: !522)
!522 = distinct !DILexicalBlock(scope: !497, file: !62, line: 356, column: 13)
!523 = !DILocation(line: 360, column: 5, scope: !492)
!524 = !DILocation(line: 361, column: 1, scope: !473)
!525 = distinct !DISubprogram(name: "goodG2B2", scope: !62, file: !62, line: 364, type: !71, scopeLine: 365, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !73)
!526 = !DILocalVariable(name: "data", scope: !525, file: !62, line: 366, type: !63)
!527 = !DILocation(line: 366, column: 9, scope: !525)
!528 = !DILocation(line: 368, column: 10, scope: !525)
!529 = !DILocation(line: 369, column: 8, scope: !530)
!530 = distinct !DILexicalBlock(scope: !525, file: !62, line: 369, column: 8)
!531 = !DILocation(line: 369, column: 18, scope: !530)
!532 = !DILocation(line: 369, column: 8, scope: !525)
!533 = !DILocation(line: 373, column: 14, scope: !534)
!534 = distinct !DILexicalBlock(scope: !530, file: !62, line: 370, column: 5)
!535 = !DILocation(line: 374, column: 5, scope: !534)
!536 = !DILocation(line: 375, column: 8, scope: !537)
!537 = distinct !DILexicalBlock(scope: !525, file: !62, line: 375, column: 8)
!538 = !DILocation(line: 375, column: 18, scope: !537)
!539 = !DILocation(line: 375, column: 8, scope: !525)
!540 = !DILocalVariable(name: "i", scope: !541, file: !62, line: 378, type: !63)
!541 = distinct !DILexicalBlock(scope: !542, file: !62, line: 377, column: 9)
!542 = distinct !DILexicalBlock(scope: !537, file: !62, line: 376, column: 5)
!543 = !DILocation(line: 378, column: 17, scope: !541)
!544 = !DILocalVariable(name: "buffer", scope: !541, file: !62, line: 379, type: !178)
!545 = !DILocation(line: 379, column: 17, scope: !541)
!546 = !DILocation(line: 382, column: 17, scope: !547)
!547 = distinct !DILexicalBlock(scope: !541, file: !62, line: 382, column: 17)
!548 = !DILocation(line: 382, column: 22, scope: !547)
!549 = !DILocation(line: 382, column: 17, scope: !541)
!550 = !DILocation(line: 384, column: 24, scope: !551)
!551 = distinct !DILexicalBlock(scope: !547, file: !62, line: 383, column: 13)
!552 = !DILocation(line: 384, column: 17, scope: !551)
!553 = !DILocation(line: 384, column: 30, scope: !551)
!554 = !DILocation(line: 386, column: 23, scope: !555)
!555 = distinct !DILexicalBlock(scope: !551, file: !62, line: 386, column: 17)
!556 = !DILocation(line: 386, column: 21, scope: !555)
!557 = !DILocation(line: 386, column: 28, scope: !558)
!558 = distinct !DILexicalBlock(scope: !555, file: !62, line: 386, column: 17)
!559 = !DILocation(line: 386, column: 30, scope: !558)
!560 = !DILocation(line: 386, column: 17, scope: !555)
!561 = !DILocation(line: 388, column: 41, scope: !562)
!562 = distinct !DILexicalBlock(scope: !558, file: !62, line: 387, column: 17)
!563 = !DILocation(line: 388, column: 34, scope: !562)
!564 = !DILocation(line: 388, column: 21, scope: !562)
!565 = !DILocation(line: 389, column: 17, scope: !562)
!566 = !DILocation(line: 386, column: 37, scope: !558)
!567 = !DILocation(line: 386, column: 17, scope: !558)
!568 = distinct !{!568, !560, !569, !206}
!569 = !DILocation(line: 389, column: 17, scope: !555)
!570 = !DILocation(line: 390, column: 13, scope: !551)
!571 = !DILocation(line: 393, column: 17, scope: !572)
!572 = distinct !DILexicalBlock(scope: !547, file: !62, line: 392, column: 13)
!573 = !DILocation(line: 396, column: 5, scope: !542)
!574 = !DILocation(line: 397, column: 1, scope: !525)
