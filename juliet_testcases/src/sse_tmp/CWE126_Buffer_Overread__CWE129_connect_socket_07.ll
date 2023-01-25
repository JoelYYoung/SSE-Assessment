; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_07_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  br i1 %cmp24, label %if.then26, label %if.end33, !dbg !172

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !173, metadata !DIExpression()), !dbg !179
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !179
  %13 = load i32, i32* %data, align 4, !dbg !180
  %cmp27 = icmp sge i32 %13, 0, !dbg !182
  br i1 %cmp27, label %if.then29, label %if.else, !dbg !183

if.then29:                                        ; preds = %if.then26
  %14 = load i32, i32* %data, align 4, !dbg !184
  %idxprom30 = sext i32 %14 to i64, !dbg !186
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !186
  %15 = load i32, i32* %arrayidx31, align 4, !dbg !186
  call void @printIntLine(i32 %15), !dbg !187
  br label %if.end32, !dbg !188

if.else:                                          ; preds = %if.then26
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !189
  br label %if.end32

if.end32:                                         ; preds = %if.else, %if.then29
  br label %if.end33, !dbg !191

if.end33:                                         ; preds = %if.end32, %if.end23
  ret void, !dbg !192
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_07_good() #0 !dbg !193 {
entry:
  call void @goodB2G1(), !dbg !194
  call void @goodB2G2(), !dbg !195
  call void @goodG2B1(), !dbg !196
  call void @goodG2B2(), !dbg !197
  ret void, !dbg !198
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !199 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !204, metadata !DIExpression()), !dbg !205
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !206, metadata !DIExpression()), !dbg !207
  %call = call i64 @time(i64* null) #7, !dbg !208
  %conv = trunc i64 %call to i32, !dbg !209
  call void @srand(i32 %conv) #7, !dbg !210
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !211
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_07_good(), !dbg !212
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !213
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !214
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_07_bad(), !dbg !215
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !216
  ret i32 0, !dbg !217
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !218 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 -1, i32* %data, align 4, !dbg !221
  %0 = load i32, i32* @staticFive, align 4, !dbg !222
  %cmp = icmp eq i32 %0, 5, !dbg !224
  br i1 %cmp, label %if.then, label %if.end23, !dbg !225

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !226, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !230, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !232, metadata !DIExpression()), !dbg !233
  store i32 -1, i32* %connectSocket, align 4, !dbg !233
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !234, metadata !DIExpression()), !dbg !235
  br label %do.body, !dbg !236

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !237
  store i32 %call, i32* %connectSocket, align 4, !dbg !239
  %1 = load i32, i32* %connectSocket, align 4, !dbg !240
  %cmp1 = icmp eq i32 %1, -1, !dbg !242
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !243

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !244

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !246
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !246
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !247
  store i16 2, i16* %sin_family, align 4, !dbg !248
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !249
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !250
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !251
  store i32 %call3, i32* %s_addr, align 4, !dbg !252
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !253
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !254
  store i16 %call4, i16* %sin_port, align 2, !dbg !255
  %3 = load i32, i32* %connectSocket, align 4, !dbg !256
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !258
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !259
  %cmp6 = icmp eq i32 %call5, -1, !dbg !260
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !261

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !262

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !264
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !265
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !266
  %conv = trunc i64 %call9 to i32, !dbg !266
  store i32 %conv, i32* %recvResult, align 4, !dbg !267
  %6 = load i32, i32* %recvResult, align 4, !dbg !268
  %cmp10 = icmp eq i32 %6, -1, !dbg !270
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !271

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !272
  %cmp12 = icmp eq i32 %7, 0, !dbg !273
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !274

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !275

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !277
  %idxprom = sext i32 %8 to i64, !dbg !278
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !278
  store i8 0, i8* %arrayidx, align 1, !dbg !279
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !280
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !281
  store i32 %call17, i32* %data, align 4, !dbg !282
  br label %do.end, !dbg !283

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !284
  %cmp18 = icmp ne i32 %9, -1, !dbg !286
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !287

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !288
  %call21 = call i32 @close(i32 %10), !dbg !290
  br label %if.end22, !dbg !291

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !292

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @staticFive, align 4, !dbg !293
  %cmp24 = icmp ne i32 %11, 5, !dbg !295
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !296

if.then26:                                        ; preds = %if.end23
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !297
  br label %if.end36, !dbg !299

if.else:                                          ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !300, metadata !DIExpression()), !dbg !303
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !303
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !303
  %13 = load i32, i32* %data, align 4, !dbg !304
  %cmp27 = icmp sge i32 %13, 0, !dbg !306
  br i1 %cmp27, label %land.lhs.true, label %if.else34, !dbg !307

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32, i32* %data, align 4, !dbg !308
  %cmp29 = icmp slt i32 %14, 10, !dbg !309
  br i1 %cmp29, label %if.then31, label %if.else34, !dbg !310

if.then31:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !311
  %idxprom32 = sext i32 %15 to i64, !dbg !313
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !313
  %16 = load i32, i32* %arrayidx33, align 4, !dbg !313
  call void @printIntLine(i32 %16), !dbg !314
  br label %if.end35, !dbg !315

if.else34:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !316
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %if.then31
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then26
  ret void, !dbg !318
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !319 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !320, metadata !DIExpression()), !dbg !321
  store i32 -1, i32* %data, align 4, !dbg !322
  %0 = load i32, i32* @staticFive, align 4, !dbg !323
  %cmp = icmp eq i32 %0, 5, !dbg !325
  br i1 %cmp, label %if.then, label %if.end23, !dbg !326

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !327, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !331, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !333, metadata !DIExpression()), !dbg !334
  store i32 -1, i32* %connectSocket, align 4, !dbg !334
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !335, metadata !DIExpression()), !dbg !336
  br label %do.body, !dbg !337

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !338
  store i32 %call, i32* %connectSocket, align 4, !dbg !340
  %1 = load i32, i32* %connectSocket, align 4, !dbg !341
  %cmp1 = icmp eq i32 %1, -1, !dbg !343
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !344

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !345

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !347
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !347
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !348
  store i16 2, i16* %sin_family, align 4, !dbg !349
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !350
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !351
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !352
  store i32 %call3, i32* %s_addr, align 4, !dbg !353
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !354
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !355
  store i16 %call4, i16* %sin_port, align 2, !dbg !356
  %3 = load i32, i32* %connectSocket, align 4, !dbg !357
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !359
  %call5 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !360
  %cmp6 = icmp eq i32 %call5, -1, !dbg !361
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !362

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !363

if.end8:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !365
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !366
  %call9 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !367
  %conv = trunc i64 %call9 to i32, !dbg !367
  store i32 %conv, i32* %recvResult, align 4, !dbg !368
  %6 = load i32, i32* %recvResult, align 4, !dbg !369
  %cmp10 = icmp eq i32 %6, -1, !dbg !371
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !372

lor.lhs.false:                                    ; preds = %if.end8
  %7 = load i32, i32* %recvResult, align 4, !dbg !373
  %cmp12 = icmp eq i32 %7, 0, !dbg !374
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !375

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !376

if.end15:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !378
  %idxprom = sext i32 %8 to i64, !dbg !379
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !379
  store i8 0, i8* %arrayidx, align 1, !dbg !380
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !381
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !382
  store i32 %call17, i32* %data, align 4, !dbg !383
  br label %do.end, !dbg !384

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !385
  %cmp18 = icmp ne i32 %9, -1, !dbg !387
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !388

if.then20:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !389
  %call21 = call i32 @close(i32 %10), !dbg !391
  br label %if.end22, !dbg !392

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !393

if.end23:                                         ; preds = %if.end22, %entry
  %11 = load i32, i32* @staticFive, align 4, !dbg !394
  %cmp24 = icmp eq i32 %11, 5, !dbg !396
  br i1 %cmp24, label %if.then26, label %if.end35, !dbg !397

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !398, metadata !DIExpression()), !dbg !401
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !401
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !401
  %13 = load i32, i32* %data, align 4, !dbg !402
  %cmp27 = icmp sge i32 %13, 0, !dbg !404
  br i1 %cmp27, label %land.lhs.true, label %if.else, !dbg !405

land.lhs.true:                                    ; preds = %if.then26
  %14 = load i32, i32* %data, align 4, !dbg !406
  %cmp29 = icmp slt i32 %14, 10, !dbg !407
  br i1 %cmp29, label %if.then31, label %if.else, !dbg !408

if.then31:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !409
  %idxprom32 = sext i32 %15 to i64, !dbg !411
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !411
  %16 = load i32, i32* %arrayidx33, align 4, !dbg !411
  call void @printIntLine(i32 %16), !dbg !412
  br label %if.end34, !dbg !413

if.else:                                          ; preds = %land.lhs.true, %if.then26
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !414
  br label %if.end34

if.end34:                                         ; preds = %if.else, %if.then31
  br label %if.end35, !dbg !416

if.end35:                                         ; preds = %if.end34, %if.end23
  ret void, !dbg !417
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !418 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !419, metadata !DIExpression()), !dbg !420
  store i32 -1, i32* %data, align 4, !dbg !421
  %0 = load i32, i32* @staticFive, align 4, !dbg !422
  %cmp = icmp ne i32 %0, 5, !dbg !424
  br i1 %cmp, label %if.then, label %if.else, !dbg !425

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !426
  br label %if.end, !dbg !428

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !429
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !431
  %cmp1 = icmp eq i32 %1, 5, !dbg !433
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !434

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !435, metadata !DIExpression()), !dbg !438
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !438
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !438
  %3 = load i32, i32* %data, align 4, !dbg !439
  %cmp3 = icmp sge i32 %3, 0, !dbg !441
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !442

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !443
  %idxprom = sext i32 %4 to i64, !dbg !445
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !445
  %5 = load i32, i32* %arrayidx, align 4, !dbg !445
  call void @printIntLine(i32 %5), !dbg !446
  br label %if.end6, !dbg !447

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !448
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !450

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !451
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !452 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !453, metadata !DIExpression()), !dbg !454
  store i32 -1, i32* %data, align 4, !dbg !455
  %0 = load i32, i32* @staticFive, align 4, !dbg !456
  %cmp = icmp eq i32 %0, 5, !dbg !458
  br i1 %cmp, label %if.then, label %if.end, !dbg !459

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !460
  br label %if.end, !dbg !462

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !463
  %cmp1 = icmp eq i32 %1, 5, !dbg !465
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !466

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !467, metadata !DIExpression()), !dbg !470
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !470
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !470
  %3 = load i32, i32* %data, align 4, !dbg !471
  %cmp3 = icmp sge i32 %3, 0, !dbg !473
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !474

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !475
  %idxprom = sext i32 %4 to i64, !dbg !477
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !477
  %5 = load i32, i32* %arrayidx, align 4, !dbg !477
  call void @printIntLine(i32 %5), !dbg !478
  br label %if.end5, !dbg !479

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !480
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !482

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !483
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_07.c", directory: "/home/joelyang/SSE-Assessment")
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
!62 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_07.c", directory: "/home/joelyang/SSE-Assessment")
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !{i32 7, !"Dwarf Version", i32 4}
!65 = !{i32 2, !"Debug Info Version", i32 3}
!66 = !{i32 1, !"wchar_size", i32 4}
!67 = !{i32 7, !"uwtable", i32 1}
!68 = !{i32 7, !"frame-pointer", i32 2}
!69 = !{!"clang version 13.0.0"}
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_07_bad", scope: !62, file: !62, line: 49, type: !71, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !73)
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
!173 = !DILocalVariable(name: "buffer", scope: !174, file: !62, line: 116, type: !176)
!174 = distinct !DILexicalBlock(scope: !175, file: !62, line: 115, column: 9)
!175 = distinct !DILexicalBlock(scope: !170, file: !62, line: 114, column: 5)
!176 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 320, elements: !177)
!177 = !{!178}
!178 = !DISubrange(count: 10)
!179 = !DILocation(line: 116, column: 17, scope: !174)
!180 = !DILocation(line: 119, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !174, file: !62, line: 119, column: 17)
!182 = !DILocation(line: 119, column: 22, scope: !181)
!183 = !DILocation(line: 119, column: 17, scope: !174)
!184 = !DILocation(line: 121, column: 37, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !62, line: 120, column: 13)
!186 = !DILocation(line: 121, column: 30, scope: !185)
!187 = !DILocation(line: 121, column: 17, scope: !185)
!188 = !DILocation(line: 122, column: 13, scope: !185)
!189 = !DILocation(line: 125, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !181, file: !62, line: 124, column: 13)
!191 = !DILocation(line: 128, column: 5, scope: !175)
!192 = !DILocation(line: 129, column: 1, scope: !70)
!193 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_07_good", scope: !62, file: !62, line: 369, type: !71, scopeLine: 370, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !73)
!194 = !DILocation(line: 371, column: 5, scope: !193)
!195 = !DILocation(line: 372, column: 5, scope: !193)
!196 = !DILocation(line: 373, column: 5, scope: !193)
!197 = !DILocation(line: 374, column: 5, scope: !193)
!198 = !DILocation(line: 375, column: 1, scope: !193)
!199 = distinct !DISubprogram(name: "main", scope: !62, file: !62, line: 386, type: !200, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !73)
!200 = !DISubroutineType(types: !201)
!201 = !{!63, !63, !202}
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!204 = !DILocalVariable(name: "argc", arg: 1, scope: !199, file: !62, line: 386, type: !63)
!205 = !DILocation(line: 386, column: 14, scope: !199)
!206 = !DILocalVariable(name: "argv", arg: 2, scope: !199, file: !62, line: 386, type: !202)
!207 = !DILocation(line: 386, column: 27, scope: !199)
!208 = !DILocation(line: 389, column: 22, scope: !199)
!209 = !DILocation(line: 389, column: 12, scope: !199)
!210 = !DILocation(line: 389, column: 5, scope: !199)
!211 = !DILocation(line: 391, column: 5, scope: !199)
!212 = !DILocation(line: 392, column: 5, scope: !199)
!213 = !DILocation(line: 393, column: 5, scope: !199)
!214 = !DILocation(line: 396, column: 5, scope: !199)
!215 = !DILocation(line: 397, column: 5, scope: !199)
!216 = !DILocation(line: 398, column: 5, scope: !199)
!217 = !DILocation(line: 400, column: 5, scope: !199)
!218 = distinct !DISubprogram(name: "goodB2G1", scope: !62, file: !62, line: 136, type: !71, scopeLine: 137, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !73)
!219 = !DILocalVariable(name: "data", scope: !218, file: !62, line: 138, type: !63)
!220 = !DILocation(line: 138, column: 9, scope: !218)
!221 = !DILocation(line: 140, column: 10, scope: !218)
!222 = !DILocation(line: 141, column: 8, scope: !223)
!223 = distinct !DILexicalBlock(scope: !218, file: !62, line: 141, column: 8)
!224 = !DILocation(line: 141, column: 18, scope: !223)
!225 = !DILocation(line: 141, column: 8, scope: !218)
!226 = !DILocalVariable(name: "recvResult", scope: !227, file: !62, line: 148, type: !63)
!227 = distinct !DILexicalBlock(scope: !228, file: !62, line: 143, column: 9)
!228 = distinct !DILexicalBlock(scope: !223, file: !62, line: 142, column: 5)
!229 = !DILocation(line: 148, column: 17, scope: !227)
!230 = !DILocalVariable(name: "service", scope: !227, file: !62, line: 149, type: !86)
!231 = !DILocation(line: 149, column: 32, scope: !227)
!232 = !DILocalVariable(name: "connectSocket", scope: !227, file: !62, line: 150, type: !63)
!233 = !DILocation(line: 150, column: 20, scope: !227)
!234 = !DILocalVariable(name: "inputBuffer", scope: !227, file: !62, line: 151, type: !57)
!235 = !DILocation(line: 151, column: 18, scope: !227)
!236 = !DILocation(line: 152, column: 13, scope: !227)
!237 = !DILocation(line: 162, column: 33, scope: !238)
!238 = distinct !DILexicalBlock(scope: !227, file: !62, line: 153, column: 13)
!239 = !DILocation(line: 162, column: 31, scope: !238)
!240 = !DILocation(line: 163, column: 21, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !62, line: 163, column: 21)
!242 = !DILocation(line: 163, column: 35, scope: !241)
!243 = !DILocation(line: 163, column: 21, scope: !238)
!244 = !DILocation(line: 165, column: 21, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !62, line: 164, column: 17)
!246 = !DILocation(line: 167, column: 17, scope: !238)
!247 = !DILocation(line: 168, column: 25, scope: !238)
!248 = !DILocation(line: 168, column: 36, scope: !238)
!249 = !DILocation(line: 169, column: 43, scope: !238)
!250 = !DILocation(line: 169, column: 25, scope: !238)
!251 = !DILocation(line: 169, column: 34, scope: !238)
!252 = !DILocation(line: 169, column: 41, scope: !238)
!253 = !DILocation(line: 170, column: 36, scope: !238)
!254 = !DILocation(line: 170, column: 25, scope: !238)
!255 = !DILocation(line: 170, column: 34, scope: !238)
!256 = !DILocation(line: 171, column: 29, scope: !257)
!257 = distinct !DILexicalBlock(scope: !238, file: !62, line: 171, column: 21)
!258 = !DILocation(line: 171, column: 44, scope: !257)
!259 = !DILocation(line: 171, column: 21, scope: !257)
!260 = !DILocation(line: 171, column: 89, scope: !257)
!261 = !DILocation(line: 171, column: 21, scope: !238)
!262 = !DILocation(line: 173, column: 21, scope: !263)
!263 = distinct !DILexicalBlock(scope: !257, file: !62, line: 172, column: 17)
!264 = !DILocation(line: 177, column: 35, scope: !238)
!265 = !DILocation(line: 177, column: 50, scope: !238)
!266 = !DILocation(line: 177, column: 30, scope: !238)
!267 = !DILocation(line: 177, column: 28, scope: !238)
!268 = !DILocation(line: 178, column: 21, scope: !269)
!269 = distinct !DILexicalBlock(scope: !238, file: !62, line: 178, column: 21)
!270 = !DILocation(line: 178, column: 32, scope: !269)
!271 = !DILocation(line: 178, column: 48, scope: !269)
!272 = !DILocation(line: 178, column: 51, scope: !269)
!273 = !DILocation(line: 178, column: 62, scope: !269)
!274 = !DILocation(line: 178, column: 21, scope: !238)
!275 = !DILocation(line: 180, column: 21, scope: !276)
!276 = distinct !DILexicalBlock(scope: !269, file: !62, line: 179, column: 17)
!277 = !DILocation(line: 183, column: 29, scope: !238)
!278 = !DILocation(line: 183, column: 17, scope: !238)
!279 = !DILocation(line: 183, column: 41, scope: !238)
!280 = !DILocation(line: 185, column: 29, scope: !238)
!281 = !DILocation(line: 185, column: 24, scope: !238)
!282 = !DILocation(line: 185, column: 22, scope: !238)
!283 = !DILocation(line: 186, column: 13, scope: !238)
!284 = !DILocation(line: 188, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !227, file: !62, line: 188, column: 17)
!286 = !DILocation(line: 188, column: 31, scope: !285)
!287 = !DILocation(line: 188, column: 17, scope: !227)
!288 = !DILocation(line: 190, column: 30, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !62, line: 189, column: 13)
!290 = !DILocation(line: 190, column: 17, scope: !289)
!291 = !DILocation(line: 191, column: 13, scope: !289)
!292 = !DILocation(line: 199, column: 5, scope: !228)
!293 = !DILocation(line: 200, column: 8, scope: !294)
!294 = distinct !DILexicalBlock(scope: !218, file: !62, line: 200, column: 8)
!295 = !DILocation(line: 200, column: 18, scope: !294)
!296 = !DILocation(line: 200, column: 8, scope: !218)
!297 = !DILocation(line: 203, column: 9, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !62, line: 201, column: 5)
!299 = !DILocation(line: 204, column: 5, scope: !298)
!300 = !DILocalVariable(name: "buffer", scope: !301, file: !62, line: 208, type: !176)
!301 = distinct !DILexicalBlock(scope: !302, file: !62, line: 207, column: 9)
!302 = distinct !DILexicalBlock(scope: !294, file: !62, line: 206, column: 5)
!303 = !DILocation(line: 208, column: 17, scope: !301)
!304 = !DILocation(line: 210, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !62, line: 210, column: 17)
!306 = !DILocation(line: 210, column: 22, scope: !305)
!307 = !DILocation(line: 210, column: 27, scope: !305)
!308 = !DILocation(line: 210, column: 30, scope: !305)
!309 = !DILocation(line: 210, column: 35, scope: !305)
!310 = !DILocation(line: 210, column: 17, scope: !301)
!311 = !DILocation(line: 212, column: 37, scope: !312)
!312 = distinct !DILexicalBlock(scope: !305, file: !62, line: 211, column: 13)
!313 = !DILocation(line: 212, column: 30, scope: !312)
!314 = !DILocation(line: 212, column: 17, scope: !312)
!315 = !DILocation(line: 213, column: 13, scope: !312)
!316 = !DILocation(line: 216, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !305, file: !62, line: 215, column: 13)
!318 = !DILocation(line: 220, column: 1, scope: !218)
!319 = distinct !DISubprogram(name: "goodB2G2", scope: !62, file: !62, line: 223, type: !71, scopeLine: 224, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !73)
!320 = !DILocalVariable(name: "data", scope: !319, file: !62, line: 225, type: !63)
!321 = !DILocation(line: 225, column: 9, scope: !319)
!322 = !DILocation(line: 227, column: 10, scope: !319)
!323 = !DILocation(line: 228, column: 8, scope: !324)
!324 = distinct !DILexicalBlock(scope: !319, file: !62, line: 228, column: 8)
!325 = !DILocation(line: 228, column: 18, scope: !324)
!326 = !DILocation(line: 228, column: 8, scope: !319)
!327 = !DILocalVariable(name: "recvResult", scope: !328, file: !62, line: 235, type: !63)
!328 = distinct !DILexicalBlock(scope: !329, file: !62, line: 230, column: 9)
!329 = distinct !DILexicalBlock(scope: !324, file: !62, line: 229, column: 5)
!330 = !DILocation(line: 235, column: 17, scope: !328)
!331 = !DILocalVariable(name: "service", scope: !328, file: !62, line: 236, type: !86)
!332 = !DILocation(line: 236, column: 32, scope: !328)
!333 = !DILocalVariable(name: "connectSocket", scope: !328, file: !62, line: 237, type: !63)
!334 = !DILocation(line: 237, column: 20, scope: !328)
!335 = !DILocalVariable(name: "inputBuffer", scope: !328, file: !62, line: 238, type: !57)
!336 = !DILocation(line: 238, column: 18, scope: !328)
!337 = !DILocation(line: 239, column: 13, scope: !328)
!338 = !DILocation(line: 249, column: 33, scope: !339)
!339 = distinct !DILexicalBlock(scope: !328, file: !62, line: 240, column: 13)
!340 = !DILocation(line: 249, column: 31, scope: !339)
!341 = !DILocation(line: 250, column: 21, scope: !342)
!342 = distinct !DILexicalBlock(scope: !339, file: !62, line: 250, column: 21)
!343 = !DILocation(line: 250, column: 35, scope: !342)
!344 = !DILocation(line: 250, column: 21, scope: !339)
!345 = !DILocation(line: 252, column: 21, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !62, line: 251, column: 17)
!347 = !DILocation(line: 254, column: 17, scope: !339)
!348 = !DILocation(line: 255, column: 25, scope: !339)
!349 = !DILocation(line: 255, column: 36, scope: !339)
!350 = !DILocation(line: 256, column: 43, scope: !339)
!351 = !DILocation(line: 256, column: 25, scope: !339)
!352 = !DILocation(line: 256, column: 34, scope: !339)
!353 = !DILocation(line: 256, column: 41, scope: !339)
!354 = !DILocation(line: 257, column: 36, scope: !339)
!355 = !DILocation(line: 257, column: 25, scope: !339)
!356 = !DILocation(line: 257, column: 34, scope: !339)
!357 = !DILocation(line: 258, column: 29, scope: !358)
!358 = distinct !DILexicalBlock(scope: !339, file: !62, line: 258, column: 21)
!359 = !DILocation(line: 258, column: 44, scope: !358)
!360 = !DILocation(line: 258, column: 21, scope: !358)
!361 = !DILocation(line: 258, column: 89, scope: !358)
!362 = !DILocation(line: 258, column: 21, scope: !339)
!363 = !DILocation(line: 260, column: 21, scope: !364)
!364 = distinct !DILexicalBlock(scope: !358, file: !62, line: 259, column: 17)
!365 = !DILocation(line: 264, column: 35, scope: !339)
!366 = !DILocation(line: 264, column: 50, scope: !339)
!367 = !DILocation(line: 264, column: 30, scope: !339)
!368 = !DILocation(line: 264, column: 28, scope: !339)
!369 = !DILocation(line: 265, column: 21, scope: !370)
!370 = distinct !DILexicalBlock(scope: !339, file: !62, line: 265, column: 21)
!371 = !DILocation(line: 265, column: 32, scope: !370)
!372 = !DILocation(line: 265, column: 48, scope: !370)
!373 = !DILocation(line: 265, column: 51, scope: !370)
!374 = !DILocation(line: 265, column: 62, scope: !370)
!375 = !DILocation(line: 265, column: 21, scope: !339)
!376 = !DILocation(line: 267, column: 21, scope: !377)
!377 = distinct !DILexicalBlock(scope: !370, file: !62, line: 266, column: 17)
!378 = !DILocation(line: 270, column: 29, scope: !339)
!379 = !DILocation(line: 270, column: 17, scope: !339)
!380 = !DILocation(line: 270, column: 41, scope: !339)
!381 = !DILocation(line: 272, column: 29, scope: !339)
!382 = !DILocation(line: 272, column: 24, scope: !339)
!383 = !DILocation(line: 272, column: 22, scope: !339)
!384 = !DILocation(line: 273, column: 13, scope: !339)
!385 = !DILocation(line: 275, column: 17, scope: !386)
!386 = distinct !DILexicalBlock(scope: !328, file: !62, line: 275, column: 17)
!387 = !DILocation(line: 275, column: 31, scope: !386)
!388 = !DILocation(line: 275, column: 17, scope: !328)
!389 = !DILocation(line: 277, column: 30, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !62, line: 276, column: 13)
!391 = !DILocation(line: 277, column: 17, scope: !390)
!392 = !DILocation(line: 278, column: 13, scope: !390)
!393 = !DILocation(line: 286, column: 5, scope: !329)
!394 = !DILocation(line: 287, column: 8, scope: !395)
!395 = distinct !DILexicalBlock(scope: !319, file: !62, line: 287, column: 8)
!396 = !DILocation(line: 287, column: 18, scope: !395)
!397 = !DILocation(line: 287, column: 8, scope: !319)
!398 = !DILocalVariable(name: "buffer", scope: !399, file: !62, line: 290, type: !176)
!399 = distinct !DILexicalBlock(scope: !400, file: !62, line: 289, column: 9)
!400 = distinct !DILexicalBlock(scope: !395, file: !62, line: 288, column: 5)
!401 = !DILocation(line: 290, column: 17, scope: !399)
!402 = !DILocation(line: 292, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !62, line: 292, column: 17)
!404 = !DILocation(line: 292, column: 22, scope: !403)
!405 = !DILocation(line: 292, column: 27, scope: !403)
!406 = !DILocation(line: 292, column: 30, scope: !403)
!407 = !DILocation(line: 292, column: 35, scope: !403)
!408 = !DILocation(line: 292, column: 17, scope: !399)
!409 = !DILocation(line: 294, column: 37, scope: !410)
!410 = distinct !DILexicalBlock(scope: !403, file: !62, line: 293, column: 13)
!411 = !DILocation(line: 294, column: 30, scope: !410)
!412 = !DILocation(line: 294, column: 17, scope: !410)
!413 = !DILocation(line: 295, column: 13, scope: !410)
!414 = !DILocation(line: 298, column: 17, scope: !415)
!415 = distinct !DILexicalBlock(scope: !403, file: !62, line: 297, column: 13)
!416 = !DILocation(line: 301, column: 5, scope: !400)
!417 = !DILocation(line: 302, column: 1, scope: !319)
!418 = distinct !DISubprogram(name: "goodG2B1", scope: !62, file: !62, line: 305, type: !71, scopeLine: 306, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !73)
!419 = !DILocalVariable(name: "data", scope: !418, file: !62, line: 307, type: !63)
!420 = !DILocation(line: 307, column: 9, scope: !418)
!421 = !DILocation(line: 309, column: 10, scope: !418)
!422 = !DILocation(line: 310, column: 8, scope: !423)
!423 = distinct !DILexicalBlock(scope: !418, file: !62, line: 310, column: 8)
!424 = !DILocation(line: 310, column: 18, scope: !423)
!425 = !DILocation(line: 310, column: 8, scope: !418)
!426 = !DILocation(line: 313, column: 9, scope: !427)
!427 = distinct !DILexicalBlock(scope: !423, file: !62, line: 311, column: 5)
!428 = !DILocation(line: 314, column: 5, scope: !427)
!429 = !DILocation(line: 319, column: 14, scope: !430)
!430 = distinct !DILexicalBlock(scope: !423, file: !62, line: 316, column: 5)
!431 = !DILocation(line: 321, column: 8, scope: !432)
!432 = distinct !DILexicalBlock(scope: !418, file: !62, line: 321, column: 8)
!433 = !DILocation(line: 321, column: 18, scope: !432)
!434 = !DILocation(line: 321, column: 8, scope: !418)
!435 = !DILocalVariable(name: "buffer", scope: !436, file: !62, line: 324, type: !176)
!436 = distinct !DILexicalBlock(scope: !437, file: !62, line: 323, column: 9)
!437 = distinct !DILexicalBlock(scope: !432, file: !62, line: 322, column: 5)
!438 = !DILocation(line: 324, column: 17, scope: !436)
!439 = !DILocation(line: 327, column: 17, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !62, line: 327, column: 17)
!441 = !DILocation(line: 327, column: 22, scope: !440)
!442 = !DILocation(line: 327, column: 17, scope: !436)
!443 = !DILocation(line: 329, column: 37, scope: !444)
!444 = distinct !DILexicalBlock(scope: !440, file: !62, line: 328, column: 13)
!445 = !DILocation(line: 329, column: 30, scope: !444)
!446 = !DILocation(line: 329, column: 17, scope: !444)
!447 = !DILocation(line: 330, column: 13, scope: !444)
!448 = !DILocation(line: 333, column: 17, scope: !449)
!449 = distinct !DILexicalBlock(scope: !440, file: !62, line: 332, column: 13)
!450 = !DILocation(line: 336, column: 5, scope: !437)
!451 = !DILocation(line: 337, column: 1, scope: !418)
!452 = distinct !DISubprogram(name: "goodG2B2", scope: !62, file: !62, line: 340, type: !71, scopeLine: 341, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !73)
!453 = !DILocalVariable(name: "data", scope: !452, file: !62, line: 342, type: !63)
!454 = !DILocation(line: 342, column: 9, scope: !452)
!455 = !DILocation(line: 344, column: 10, scope: !452)
!456 = !DILocation(line: 345, column: 8, scope: !457)
!457 = distinct !DILexicalBlock(scope: !452, file: !62, line: 345, column: 8)
!458 = !DILocation(line: 345, column: 18, scope: !457)
!459 = !DILocation(line: 345, column: 8, scope: !452)
!460 = !DILocation(line: 349, column: 14, scope: !461)
!461 = distinct !DILexicalBlock(scope: !457, file: !62, line: 346, column: 5)
!462 = !DILocation(line: 350, column: 5, scope: !461)
!463 = !DILocation(line: 351, column: 8, scope: !464)
!464 = distinct !DILexicalBlock(scope: !452, file: !62, line: 351, column: 8)
!465 = !DILocation(line: 351, column: 18, scope: !464)
!466 = !DILocation(line: 351, column: 8, scope: !452)
!467 = !DILocalVariable(name: "buffer", scope: !468, file: !62, line: 354, type: !176)
!468 = distinct !DILexicalBlock(scope: !469, file: !62, line: 353, column: 9)
!469 = distinct !DILexicalBlock(scope: !464, file: !62, line: 352, column: 5)
!470 = !DILocation(line: 354, column: 17, scope: !468)
!471 = !DILocation(line: 357, column: 17, scope: !472)
!472 = distinct !DILexicalBlock(scope: !468, file: !62, line: 357, column: 17)
!473 = !DILocation(line: 357, column: 22, scope: !472)
!474 = !DILocation(line: 357, column: 17, scope: !468)
!475 = !DILocation(line: 359, column: 37, scope: !476)
!476 = distinct !DILexicalBlock(scope: !472, file: !62, line: 358, column: 13)
!477 = !DILocation(line: 359, column: 30, scope: !476)
!478 = !DILocation(line: 359, column: 17, scope: !476)
!479 = !DILocation(line: 360, column: 13, scope: !476)
!480 = !DILocation(line: 363, column: 17, scope: !481)
!481 = distinct !DILexicalBlock(scope: !472, file: !62, line: 362, column: 13)
!482 = !DILocation(line: 366, column: 5, scope: !469)
!483 = !DILocation(line: 367, column: 1, scope: !452)
