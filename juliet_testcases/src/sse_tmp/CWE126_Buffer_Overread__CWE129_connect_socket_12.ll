; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_12_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  %buffer35 = alloca [10 x i32], align 16
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
  br i1 %tobool25, label %if.then26, label %if.else34, !dbg !169

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !170, metadata !DIExpression()), !dbg !176
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !176
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !176
  %11 = load i32, i32* %data, align 4, !dbg !177
  %cmp27 = icmp sge i32 %11, 0, !dbg !179
  br i1 %cmp27, label %if.then29, label %if.else32, !dbg !180

if.then29:                                        ; preds = %if.then26
  %12 = load i32, i32* %data, align 4, !dbg !181
  %idxprom30 = sext i32 %12 to i64, !dbg !183
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !183
  %13 = load i32, i32* %arrayidx31, align 4, !dbg !183
  call void @printIntLine(i32 %13), !dbg !184
  br label %if.end33, !dbg !185

if.else32:                                        ; preds = %if.then26
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !186
  br label %if.end33

if.end33:                                         ; preds = %if.else32, %if.then29
  br label %if.end45, !dbg !188

if.else34:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer35, metadata !189, metadata !DIExpression()), !dbg !192
  %14 = bitcast [10 x i32]* %buffer35 to i8*, !dbg !192
  call void @llvm.memset.p0i8.i64(i8* align 16 %14, i8 0, i64 40, i1 false), !dbg !192
  %15 = load i32, i32* %data, align 4, !dbg !193
  %cmp36 = icmp sge i32 %15, 0, !dbg !195
  br i1 %cmp36, label %land.lhs.true, label %if.else43, !dbg !196

land.lhs.true:                                    ; preds = %if.else34
  %16 = load i32, i32* %data, align 4, !dbg !197
  %cmp38 = icmp slt i32 %16, 10, !dbg !198
  br i1 %cmp38, label %if.then40, label %if.else43, !dbg !199

if.then40:                                        ; preds = %land.lhs.true
  %17 = load i32, i32* %data, align 4, !dbg !200
  %idxprom41 = sext i32 %17 to i64, !dbg !202
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer35, i64 0, i64 %idxprom41, !dbg !202
  %18 = load i32, i32* %arrayidx42, align 4, !dbg !202
  call void @printIntLine(i32 %18), !dbg !203
  br label %if.end44, !dbg !204

if.else43:                                        ; preds = %land.lhs.true, %if.else34
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !205
  br label %if.end44

if.end44:                                         ; preds = %if.else43, %if.then40
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end33
  ret void, !dbg !207
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_12_good() #0 !dbg !208 {
entry:
  call void @goodB2G(), !dbg !209
  call void @goodG2B(), !dbg !210
  ret void, !dbg !211
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !212 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !217, metadata !DIExpression()), !dbg !218
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !219, metadata !DIExpression()), !dbg !220
  %call = call i64 @time(i64* null) #7, !dbg !221
  %conv = trunc i64 %call to i32, !dbg !222
  call void @srand(i32 %conv) #7, !dbg !223
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !224
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_12_good(), !dbg !225
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !226
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !227
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_12_bad(), !dbg !228
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !229
  ret i32 0, !dbg !230
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !231 {
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
  %buffer = alloca [10 x i32], align 16
  %buffer78 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !232, metadata !DIExpression()), !dbg !233
  store i32 -1, i32* %data, align 4, !dbg !234
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !235
  %tobool = icmp ne i32 %call, 0, !dbg !235
  br i1 %tobool, label %if.then, label %if.else, !dbg !237

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !238, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !242, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !244, metadata !DIExpression()), !dbg !245
  store i32 -1, i32* %connectSocket, align 4, !dbg !245
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !246, metadata !DIExpression()), !dbg !247
  br label %do.body, !dbg !248

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !249
  store i32 %call1, i32* %connectSocket, align 4, !dbg !251
  %0 = load i32, i32* %connectSocket, align 4, !dbg !252
  %cmp = icmp eq i32 %0, -1, !dbg !254
  br i1 %cmp, label %if.then2, label %if.end, !dbg !255

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !256

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !258
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !258
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !259
  store i16 2, i16* %sin_family, align 4, !dbg !260
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !261
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !262
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !263
  store i32 %call3, i32* %s_addr, align 4, !dbg !264
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !265
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !266
  store i16 %call4, i16* %sin_port, align 2, !dbg !267
  %2 = load i32, i32* %connectSocket, align 4, !dbg !268
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !270
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !271
  %cmp6 = icmp eq i32 %call5, -1, !dbg !272
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !273

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !274

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !276
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !277
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !278
  %conv = trunc i64 %call9 to i32, !dbg !278
  store i32 %conv, i32* %recvResult, align 4, !dbg !279
  %5 = load i32, i32* %recvResult, align 4, !dbg !280
  %cmp10 = icmp eq i32 %5, -1, !dbg !282
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !283

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !284
  %cmp12 = icmp eq i32 %6, 0, !dbg !285
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !286

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !287

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !289
  %idxprom = sext i32 %7 to i64, !dbg !290
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !290
  store i8 0, i8* %arrayidx, align 1, !dbg !291
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !292
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !293
  store i32 %call17, i32* %data, align 4, !dbg !294
  br label %do.end, !dbg !295

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !296
  %cmp18 = icmp ne i32 %8, -1, !dbg !298
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !299

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !300
  %call21 = call i32 @close(i32 %9), !dbg !302
  br label %if.end22, !dbg !303

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end64, !dbg !304

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult23, metadata !305, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service24, metadata !309, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.declare(metadata i32* %connectSocket25, metadata !311, metadata !DIExpression()), !dbg !312
  store i32 -1, i32* %connectSocket25, align 4, !dbg !312
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer26, metadata !313, metadata !DIExpression()), !dbg !314
  br label %do.body27, !dbg !315

do.body27:                                        ; preds = %if.else
  %call28 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !316
  store i32 %call28, i32* %connectSocket25, align 4, !dbg !318
  %10 = load i32, i32* %connectSocket25, align 4, !dbg !319
  %cmp29 = icmp eq i32 %10, -1, !dbg !321
  br i1 %cmp29, label %if.then31, label %if.end32, !dbg !322

if.then31:                                        ; preds = %do.body27
  br label %do.end58, !dbg !323

if.end32:                                         ; preds = %do.body27
  %11 = bitcast %struct.sockaddr_in* %service24 to i8*, !dbg !325
  call void @llvm.memset.p0i8.i64(i8* align 4 %11, i8 0, i64 16, i1 false), !dbg !325
  %sin_family33 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service24, i32 0, i32 0, !dbg !326
  store i16 2, i16* %sin_family33, align 4, !dbg !327
  %call34 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !328
  %sin_addr35 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service24, i32 0, i32 2, !dbg !329
  %s_addr36 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr35, i32 0, i32 0, !dbg !330
  store i32 %call34, i32* %s_addr36, align 4, !dbg !331
  %call37 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !332
  %sin_port38 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service24, i32 0, i32 1, !dbg !333
  store i16 %call37, i16* %sin_port38, align 2, !dbg !334
  %12 = load i32, i32* %connectSocket25, align 4, !dbg !335
  %13 = bitcast %struct.sockaddr_in* %service24 to %struct.sockaddr*, !dbg !337
  %call39 = call i32 @connect(i32 %12, %struct.sockaddr* %13, i32 16), !dbg !338
  %cmp40 = icmp eq i32 %call39, -1, !dbg !339
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !340

if.then42:                                        ; preds = %if.end32
  br label %do.end58, !dbg !341

if.end43:                                         ; preds = %if.end32
  %14 = load i32, i32* %connectSocket25, align 4, !dbg !343
  %arraydecay44 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer26, i64 0, i64 0, !dbg !344
  %call45 = call i64 @recv(i32 %14, i8* %arraydecay44, i64 13, i32 0), !dbg !345
  %conv46 = trunc i64 %call45 to i32, !dbg !345
  store i32 %conv46, i32* %recvResult23, align 4, !dbg !346
  %15 = load i32, i32* %recvResult23, align 4, !dbg !347
  %cmp47 = icmp eq i32 %15, -1, !dbg !349
  br i1 %cmp47, label %if.then52, label %lor.lhs.false49, !dbg !350

lor.lhs.false49:                                  ; preds = %if.end43
  %16 = load i32, i32* %recvResult23, align 4, !dbg !351
  %cmp50 = icmp eq i32 %16, 0, !dbg !352
  br i1 %cmp50, label %if.then52, label %if.end53, !dbg !353

if.then52:                                        ; preds = %lor.lhs.false49, %if.end43
  br label %do.end58, !dbg !354

if.end53:                                         ; preds = %lor.lhs.false49
  %17 = load i32, i32* %recvResult23, align 4, !dbg !356
  %idxprom54 = sext i32 %17 to i64, !dbg !357
  %arrayidx55 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer26, i64 0, i64 %idxprom54, !dbg !357
  store i8 0, i8* %arrayidx55, align 1, !dbg !358
  %arraydecay56 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer26, i64 0, i64 0, !dbg !359
  %call57 = call i32 @atoi(i8* %arraydecay56) #9, !dbg !360
  store i32 %call57, i32* %data, align 4, !dbg !361
  br label %do.end58, !dbg !362

do.end58:                                         ; preds = %if.end53, %if.then52, %if.then42, %if.then31
  %18 = load i32, i32* %connectSocket25, align 4, !dbg !363
  %cmp59 = icmp ne i32 %18, -1, !dbg !365
  br i1 %cmp59, label %if.then61, label %if.end63, !dbg !366

if.then61:                                        ; preds = %do.end58
  %19 = load i32, i32* %connectSocket25, align 4, !dbg !367
  %call62 = call i32 @close(i32 %19), !dbg !369
  br label %if.end63, !dbg !370

if.end63:                                         ; preds = %if.then61, %do.end58
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.end22
  %call65 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !371
  %tobool66 = icmp ne i32 %call65, 0, !dbg !371
  br i1 %tobool66, label %if.then67, label %if.else77, !dbg !373

if.then67:                                        ; preds = %if.end64
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !374, metadata !DIExpression()), !dbg !377
  %20 = bitcast [10 x i32]* %buffer to i8*, !dbg !377
  call void @llvm.memset.p0i8.i64(i8* align 16 %20, i8 0, i64 40, i1 false), !dbg !377
  %21 = load i32, i32* %data, align 4, !dbg !378
  %cmp68 = icmp sge i32 %21, 0, !dbg !380
  br i1 %cmp68, label %land.lhs.true, label %if.else75, !dbg !381

land.lhs.true:                                    ; preds = %if.then67
  %22 = load i32, i32* %data, align 4, !dbg !382
  %cmp70 = icmp slt i32 %22, 10, !dbg !383
  br i1 %cmp70, label %if.then72, label %if.else75, !dbg !384

if.then72:                                        ; preds = %land.lhs.true
  %23 = load i32, i32* %data, align 4, !dbg !385
  %idxprom73 = sext i32 %23 to i64, !dbg !387
  %arrayidx74 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom73, !dbg !387
  %24 = load i32, i32* %arrayidx74, align 4, !dbg !387
  call void @printIntLine(i32 %24), !dbg !388
  br label %if.end76, !dbg !389

if.else75:                                        ; preds = %land.lhs.true, %if.then67
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !390
  br label %if.end76

if.end76:                                         ; preds = %if.else75, %if.then72
  br label %if.end89, !dbg !392

if.else77:                                        ; preds = %if.end64
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer78, metadata !393, metadata !DIExpression()), !dbg !396
  %25 = bitcast [10 x i32]* %buffer78 to i8*, !dbg !396
  call void @llvm.memset.p0i8.i64(i8* align 16 %25, i8 0, i64 40, i1 false), !dbg !396
  %26 = load i32, i32* %data, align 4, !dbg !397
  %cmp79 = icmp sge i32 %26, 0, !dbg !399
  br i1 %cmp79, label %land.lhs.true81, label %if.else87, !dbg !400

land.lhs.true81:                                  ; preds = %if.else77
  %27 = load i32, i32* %data, align 4, !dbg !401
  %cmp82 = icmp slt i32 %27, 10, !dbg !402
  br i1 %cmp82, label %if.then84, label %if.else87, !dbg !403

if.then84:                                        ; preds = %land.lhs.true81
  %28 = load i32, i32* %data, align 4, !dbg !404
  %idxprom85 = sext i32 %28 to i64, !dbg !406
  %arrayidx86 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer78, i64 0, i64 %idxprom85, !dbg !406
  %29 = load i32, i32* %arrayidx86, align 4, !dbg !406
  call void @printIntLine(i32 %29), !dbg !407
  br label %if.end88, !dbg !408

if.else87:                                        ; preds = %land.lhs.true81, %if.else77
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !409
  br label %if.end88

if.end88:                                         ; preds = %if.else87, %if.then84
  br label %if.end89

if.end89:                                         ; preds = %if.end88, %if.end76
  ret void, !dbg !411
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !412 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer8 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !413, metadata !DIExpression()), !dbg !414
  store i32 -1, i32* %data, align 4, !dbg !415
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !416
  %tobool = icmp ne i32 %call, 0, !dbg !416
  br i1 %tobool, label %if.then, label %if.else, !dbg !418

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !419
  br label %if.end, !dbg !421

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !422
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !424
  %tobool2 = icmp ne i32 %call1, 0, !dbg !424
  br i1 %tobool2, label %if.then3, label %if.else7, !dbg !426

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !427, metadata !DIExpression()), !dbg !430
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !430
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !430
  %1 = load i32, i32* %data, align 4, !dbg !431
  %cmp = icmp sge i32 %1, 0, !dbg !433
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !434

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !435
  %idxprom = sext i32 %2 to i64, !dbg !437
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !437
  %3 = load i32, i32* %arrayidx, align 4, !dbg !437
  call void @printIntLine(i32 %3), !dbg !438
  br label %if.end6, !dbg !439

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !440
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end15, !dbg !442

if.else7:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer8, metadata !443, metadata !DIExpression()), !dbg !446
  %4 = bitcast [10 x i32]* %buffer8 to i8*, !dbg !446
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !446
  %5 = load i32, i32* %data, align 4, !dbg !447
  %cmp9 = icmp sge i32 %5, 0, !dbg !449
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !450

if.then10:                                        ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !451
  %idxprom11 = sext i32 %6 to i64, !dbg !453
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer8, i64 0, i64 %idxprom11, !dbg !453
  %7 = load i32, i32* %arrayidx12, align 4, !dbg !453
  call void @printIntLine(i32 %7), !dbg !454
  br label %if.end14, !dbg !455

if.else13:                                        ; preds = %if.else7
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !456
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end6
  ret void, !dbg !458
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_12.c", directory: "/root/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_12_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_12.c", directory: "/root/SSE-Assessment")
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
!82 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !83)
!83 = !{!84, !85, !91, !98}
!84 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !82, file: !17, line: 239, baseType: !51, size: 16)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !82, file: !17, line: 240, baseType: !86, size: 16, offset: 16)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !88, line: 25, baseType: !89)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !90, line: 39, baseType: !53)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !82, file: !17, line: 241, baseType: !92, size: 32, offset: 32)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !93)
!93 = !{!94}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !92, file: !17, line: 33, baseType: !95, size: 32)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !88, line: 26, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !90, line: 41, baseType: !5)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !82, file: !17, line: 244, baseType: !99, size: 64, offset: 64)
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
!170 = !DILocalVariable(name: "buffer", scope: !171, file: !66, line: 117, type: !173)
!171 = distinct !DILexicalBlock(scope: !172, file: !66, line: 116, column: 9)
!172 = distinct !DILexicalBlock(scope: !168, file: !66, line: 115, column: 5)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !174)
!174 = !{!175}
!175 = !DISubrange(count: 10)
!176 = !DILocation(line: 117, column: 17, scope: !171)
!177 = !DILocation(line: 120, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !66, line: 120, column: 17)
!179 = !DILocation(line: 120, column: 22, scope: !178)
!180 = !DILocation(line: 120, column: 17, scope: !171)
!181 = !DILocation(line: 122, column: 37, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !66, line: 121, column: 13)
!183 = !DILocation(line: 122, column: 30, scope: !182)
!184 = !DILocation(line: 122, column: 17, scope: !182)
!185 = !DILocation(line: 123, column: 13, scope: !182)
!186 = !DILocation(line: 126, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !178, file: !66, line: 125, column: 13)
!188 = !DILocation(line: 129, column: 5, scope: !172)
!189 = !DILocalVariable(name: "buffer", scope: !190, file: !66, line: 133, type: !173)
!190 = distinct !DILexicalBlock(scope: !191, file: !66, line: 132, column: 9)
!191 = distinct !DILexicalBlock(scope: !168, file: !66, line: 131, column: 5)
!192 = !DILocation(line: 133, column: 17, scope: !190)
!193 = !DILocation(line: 135, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !66, line: 135, column: 17)
!195 = !DILocation(line: 135, column: 22, scope: !194)
!196 = !DILocation(line: 135, column: 27, scope: !194)
!197 = !DILocation(line: 135, column: 30, scope: !194)
!198 = !DILocation(line: 135, column: 35, scope: !194)
!199 = !DILocation(line: 135, column: 17, scope: !190)
!200 = !DILocation(line: 137, column: 37, scope: !201)
!201 = distinct !DILexicalBlock(scope: !194, file: !66, line: 136, column: 13)
!202 = !DILocation(line: 137, column: 30, scope: !201)
!203 = !DILocation(line: 137, column: 17, scope: !201)
!204 = !DILocation(line: 138, column: 13, scope: !201)
!205 = !DILocation(line: 141, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !194, file: !66, line: 140, column: 13)
!207 = !DILocation(line: 145, column: 1, scope: !65)
!208 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_12_good", scope: !66, file: !66, line: 363, type: !67, scopeLine: 364, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!209 = !DILocation(line: 365, column: 5, scope: !208)
!210 = !DILocation(line: 366, column: 5, scope: !208)
!211 = !DILocation(line: 367, column: 1, scope: !208)
!212 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 378, type: !213, scopeLine: 379, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!213 = !DISubroutineType(types: !214)
!214 = !{!71, !71, !215}
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64)
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!217 = !DILocalVariable(name: "argc", arg: 1, scope: !212, file: !66, line: 378, type: !71)
!218 = !DILocation(line: 378, column: 14, scope: !212)
!219 = !DILocalVariable(name: "argv", arg: 2, scope: !212, file: !66, line: 378, type: !215)
!220 = !DILocation(line: 378, column: 27, scope: !212)
!221 = !DILocation(line: 381, column: 22, scope: !212)
!222 = !DILocation(line: 381, column: 12, scope: !212)
!223 = !DILocation(line: 381, column: 5, scope: !212)
!224 = !DILocation(line: 383, column: 5, scope: !212)
!225 = !DILocation(line: 384, column: 5, scope: !212)
!226 = !DILocation(line: 385, column: 5, scope: !212)
!227 = !DILocation(line: 388, column: 5, scope: !212)
!228 = !DILocation(line: 389, column: 5, scope: !212)
!229 = !DILocation(line: 390, column: 5, scope: !212)
!230 = !DILocation(line: 392, column: 5, scope: !212)
!231 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 154, type: !67, scopeLine: 155, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!232 = !DILocalVariable(name: "data", scope: !231, file: !66, line: 156, type: !71)
!233 = !DILocation(line: 156, column: 9, scope: !231)
!234 = !DILocation(line: 158, column: 10, scope: !231)
!235 = !DILocation(line: 159, column: 8, scope: !236)
!236 = distinct !DILexicalBlock(scope: !231, file: !66, line: 159, column: 8)
!237 = !DILocation(line: 159, column: 8, scope: !231)
!238 = !DILocalVariable(name: "recvResult", scope: !239, file: !66, line: 166, type: !71)
!239 = distinct !DILexicalBlock(scope: !240, file: !66, line: 161, column: 9)
!240 = distinct !DILexicalBlock(scope: !236, file: !66, line: 160, column: 5)
!241 = !DILocation(line: 166, column: 17, scope: !239)
!242 = !DILocalVariable(name: "service", scope: !239, file: !66, line: 167, type: !82)
!243 = !DILocation(line: 167, column: 32, scope: !239)
!244 = !DILocalVariable(name: "connectSocket", scope: !239, file: !66, line: 168, type: !71)
!245 = !DILocation(line: 168, column: 20, scope: !239)
!246 = !DILocalVariable(name: "inputBuffer", scope: !239, file: !66, line: 169, type: !55)
!247 = !DILocation(line: 169, column: 18, scope: !239)
!248 = !DILocation(line: 170, column: 13, scope: !239)
!249 = !DILocation(line: 180, column: 33, scope: !250)
!250 = distinct !DILexicalBlock(scope: !239, file: !66, line: 171, column: 13)
!251 = !DILocation(line: 180, column: 31, scope: !250)
!252 = !DILocation(line: 181, column: 21, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !66, line: 181, column: 21)
!254 = !DILocation(line: 181, column: 35, scope: !253)
!255 = !DILocation(line: 181, column: 21, scope: !250)
!256 = !DILocation(line: 183, column: 21, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !66, line: 182, column: 17)
!258 = !DILocation(line: 185, column: 17, scope: !250)
!259 = !DILocation(line: 186, column: 25, scope: !250)
!260 = !DILocation(line: 186, column: 36, scope: !250)
!261 = !DILocation(line: 187, column: 43, scope: !250)
!262 = !DILocation(line: 187, column: 25, scope: !250)
!263 = !DILocation(line: 187, column: 34, scope: !250)
!264 = !DILocation(line: 187, column: 41, scope: !250)
!265 = !DILocation(line: 188, column: 36, scope: !250)
!266 = !DILocation(line: 188, column: 25, scope: !250)
!267 = !DILocation(line: 188, column: 34, scope: !250)
!268 = !DILocation(line: 189, column: 29, scope: !269)
!269 = distinct !DILexicalBlock(scope: !250, file: !66, line: 189, column: 21)
!270 = !DILocation(line: 189, column: 44, scope: !269)
!271 = !DILocation(line: 189, column: 21, scope: !269)
!272 = !DILocation(line: 189, column: 89, scope: !269)
!273 = !DILocation(line: 189, column: 21, scope: !250)
!274 = !DILocation(line: 191, column: 21, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !66, line: 190, column: 17)
!276 = !DILocation(line: 195, column: 35, scope: !250)
!277 = !DILocation(line: 195, column: 50, scope: !250)
!278 = !DILocation(line: 195, column: 30, scope: !250)
!279 = !DILocation(line: 195, column: 28, scope: !250)
!280 = !DILocation(line: 196, column: 21, scope: !281)
!281 = distinct !DILexicalBlock(scope: !250, file: !66, line: 196, column: 21)
!282 = !DILocation(line: 196, column: 32, scope: !281)
!283 = !DILocation(line: 196, column: 48, scope: !281)
!284 = !DILocation(line: 196, column: 51, scope: !281)
!285 = !DILocation(line: 196, column: 62, scope: !281)
!286 = !DILocation(line: 196, column: 21, scope: !250)
!287 = !DILocation(line: 198, column: 21, scope: !288)
!288 = distinct !DILexicalBlock(scope: !281, file: !66, line: 197, column: 17)
!289 = !DILocation(line: 201, column: 29, scope: !250)
!290 = !DILocation(line: 201, column: 17, scope: !250)
!291 = !DILocation(line: 201, column: 41, scope: !250)
!292 = !DILocation(line: 203, column: 29, scope: !250)
!293 = !DILocation(line: 203, column: 24, scope: !250)
!294 = !DILocation(line: 203, column: 22, scope: !250)
!295 = !DILocation(line: 204, column: 13, scope: !250)
!296 = !DILocation(line: 206, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !239, file: !66, line: 206, column: 17)
!298 = !DILocation(line: 206, column: 31, scope: !297)
!299 = !DILocation(line: 206, column: 17, scope: !239)
!300 = !DILocation(line: 208, column: 30, scope: !301)
!301 = distinct !DILexicalBlock(scope: !297, file: !66, line: 207, column: 13)
!302 = !DILocation(line: 208, column: 17, scope: !301)
!303 = !DILocation(line: 209, column: 13, scope: !301)
!304 = !DILocation(line: 217, column: 5, scope: !240)
!305 = !DILocalVariable(name: "recvResult", scope: !306, file: !66, line: 225, type: !71)
!306 = distinct !DILexicalBlock(scope: !307, file: !66, line: 220, column: 9)
!307 = distinct !DILexicalBlock(scope: !236, file: !66, line: 219, column: 5)
!308 = !DILocation(line: 225, column: 17, scope: !306)
!309 = !DILocalVariable(name: "service", scope: !306, file: !66, line: 226, type: !82)
!310 = !DILocation(line: 226, column: 32, scope: !306)
!311 = !DILocalVariable(name: "connectSocket", scope: !306, file: !66, line: 227, type: !71)
!312 = !DILocation(line: 227, column: 20, scope: !306)
!313 = !DILocalVariable(name: "inputBuffer", scope: !306, file: !66, line: 228, type: !55)
!314 = !DILocation(line: 228, column: 18, scope: !306)
!315 = !DILocation(line: 229, column: 13, scope: !306)
!316 = !DILocation(line: 239, column: 33, scope: !317)
!317 = distinct !DILexicalBlock(scope: !306, file: !66, line: 230, column: 13)
!318 = !DILocation(line: 239, column: 31, scope: !317)
!319 = !DILocation(line: 240, column: 21, scope: !320)
!320 = distinct !DILexicalBlock(scope: !317, file: !66, line: 240, column: 21)
!321 = !DILocation(line: 240, column: 35, scope: !320)
!322 = !DILocation(line: 240, column: 21, scope: !317)
!323 = !DILocation(line: 242, column: 21, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !66, line: 241, column: 17)
!325 = !DILocation(line: 244, column: 17, scope: !317)
!326 = !DILocation(line: 245, column: 25, scope: !317)
!327 = !DILocation(line: 245, column: 36, scope: !317)
!328 = !DILocation(line: 246, column: 43, scope: !317)
!329 = !DILocation(line: 246, column: 25, scope: !317)
!330 = !DILocation(line: 246, column: 34, scope: !317)
!331 = !DILocation(line: 246, column: 41, scope: !317)
!332 = !DILocation(line: 247, column: 36, scope: !317)
!333 = !DILocation(line: 247, column: 25, scope: !317)
!334 = !DILocation(line: 247, column: 34, scope: !317)
!335 = !DILocation(line: 248, column: 29, scope: !336)
!336 = distinct !DILexicalBlock(scope: !317, file: !66, line: 248, column: 21)
!337 = !DILocation(line: 248, column: 44, scope: !336)
!338 = !DILocation(line: 248, column: 21, scope: !336)
!339 = !DILocation(line: 248, column: 89, scope: !336)
!340 = !DILocation(line: 248, column: 21, scope: !317)
!341 = !DILocation(line: 250, column: 21, scope: !342)
!342 = distinct !DILexicalBlock(scope: !336, file: !66, line: 249, column: 17)
!343 = !DILocation(line: 254, column: 35, scope: !317)
!344 = !DILocation(line: 254, column: 50, scope: !317)
!345 = !DILocation(line: 254, column: 30, scope: !317)
!346 = !DILocation(line: 254, column: 28, scope: !317)
!347 = !DILocation(line: 255, column: 21, scope: !348)
!348 = distinct !DILexicalBlock(scope: !317, file: !66, line: 255, column: 21)
!349 = !DILocation(line: 255, column: 32, scope: !348)
!350 = !DILocation(line: 255, column: 48, scope: !348)
!351 = !DILocation(line: 255, column: 51, scope: !348)
!352 = !DILocation(line: 255, column: 62, scope: !348)
!353 = !DILocation(line: 255, column: 21, scope: !317)
!354 = !DILocation(line: 257, column: 21, scope: !355)
!355 = distinct !DILexicalBlock(scope: !348, file: !66, line: 256, column: 17)
!356 = !DILocation(line: 260, column: 29, scope: !317)
!357 = !DILocation(line: 260, column: 17, scope: !317)
!358 = !DILocation(line: 260, column: 41, scope: !317)
!359 = !DILocation(line: 262, column: 29, scope: !317)
!360 = !DILocation(line: 262, column: 24, scope: !317)
!361 = !DILocation(line: 262, column: 22, scope: !317)
!362 = !DILocation(line: 263, column: 13, scope: !317)
!363 = !DILocation(line: 265, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !306, file: !66, line: 265, column: 17)
!365 = !DILocation(line: 265, column: 31, scope: !364)
!366 = !DILocation(line: 265, column: 17, scope: !306)
!367 = !DILocation(line: 267, column: 30, scope: !368)
!368 = distinct !DILexicalBlock(scope: !364, file: !66, line: 266, column: 13)
!369 = !DILocation(line: 267, column: 17, scope: !368)
!370 = !DILocation(line: 268, column: 13, scope: !368)
!371 = !DILocation(line: 277, column: 8, scope: !372)
!372 = distinct !DILexicalBlock(scope: !231, file: !66, line: 277, column: 8)
!373 = !DILocation(line: 277, column: 8, scope: !231)
!374 = !DILocalVariable(name: "buffer", scope: !375, file: !66, line: 280, type: !173)
!375 = distinct !DILexicalBlock(scope: !376, file: !66, line: 279, column: 9)
!376 = distinct !DILexicalBlock(scope: !372, file: !66, line: 278, column: 5)
!377 = !DILocation(line: 280, column: 17, scope: !375)
!378 = !DILocation(line: 282, column: 17, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !66, line: 282, column: 17)
!380 = !DILocation(line: 282, column: 22, scope: !379)
!381 = !DILocation(line: 282, column: 27, scope: !379)
!382 = !DILocation(line: 282, column: 30, scope: !379)
!383 = !DILocation(line: 282, column: 35, scope: !379)
!384 = !DILocation(line: 282, column: 17, scope: !375)
!385 = !DILocation(line: 284, column: 37, scope: !386)
!386 = distinct !DILexicalBlock(scope: !379, file: !66, line: 283, column: 13)
!387 = !DILocation(line: 284, column: 30, scope: !386)
!388 = !DILocation(line: 284, column: 17, scope: !386)
!389 = !DILocation(line: 285, column: 13, scope: !386)
!390 = !DILocation(line: 288, column: 17, scope: !391)
!391 = distinct !DILexicalBlock(scope: !379, file: !66, line: 287, column: 13)
!392 = !DILocation(line: 291, column: 5, scope: !376)
!393 = !DILocalVariable(name: "buffer", scope: !394, file: !66, line: 295, type: !173)
!394 = distinct !DILexicalBlock(scope: !395, file: !66, line: 294, column: 9)
!395 = distinct !DILexicalBlock(scope: !372, file: !66, line: 293, column: 5)
!396 = !DILocation(line: 295, column: 17, scope: !394)
!397 = !DILocation(line: 297, column: 17, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !66, line: 297, column: 17)
!399 = !DILocation(line: 297, column: 22, scope: !398)
!400 = !DILocation(line: 297, column: 27, scope: !398)
!401 = !DILocation(line: 297, column: 30, scope: !398)
!402 = !DILocation(line: 297, column: 35, scope: !398)
!403 = !DILocation(line: 297, column: 17, scope: !394)
!404 = !DILocation(line: 299, column: 37, scope: !405)
!405 = distinct !DILexicalBlock(scope: !398, file: !66, line: 298, column: 13)
!406 = !DILocation(line: 299, column: 30, scope: !405)
!407 = !DILocation(line: 299, column: 17, scope: !405)
!408 = !DILocation(line: 300, column: 13, scope: !405)
!409 = !DILocation(line: 303, column: 17, scope: !410)
!410 = distinct !DILexicalBlock(scope: !398, file: !66, line: 302, column: 13)
!411 = !DILocation(line: 307, column: 1, scope: !231)
!412 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 312, type: !67, scopeLine: 313, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!413 = !DILocalVariable(name: "data", scope: !412, file: !66, line: 314, type: !71)
!414 = !DILocation(line: 314, column: 9, scope: !412)
!415 = !DILocation(line: 316, column: 10, scope: !412)
!416 = !DILocation(line: 317, column: 8, scope: !417)
!417 = distinct !DILexicalBlock(scope: !412, file: !66, line: 317, column: 8)
!418 = !DILocation(line: 317, column: 8, scope: !412)
!419 = !DILocation(line: 321, column: 14, scope: !420)
!420 = distinct !DILexicalBlock(scope: !417, file: !66, line: 318, column: 5)
!421 = !DILocation(line: 322, column: 5, scope: !420)
!422 = !DILocation(line: 327, column: 14, scope: !423)
!423 = distinct !DILexicalBlock(scope: !417, file: !66, line: 324, column: 5)
!424 = !DILocation(line: 329, column: 8, scope: !425)
!425 = distinct !DILexicalBlock(scope: !412, file: !66, line: 329, column: 8)
!426 = !DILocation(line: 329, column: 8, scope: !412)
!427 = !DILocalVariable(name: "buffer", scope: !428, file: !66, line: 332, type: !173)
!428 = distinct !DILexicalBlock(scope: !429, file: !66, line: 331, column: 9)
!429 = distinct !DILexicalBlock(scope: !425, file: !66, line: 330, column: 5)
!430 = !DILocation(line: 332, column: 17, scope: !428)
!431 = !DILocation(line: 335, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !66, line: 335, column: 17)
!433 = !DILocation(line: 335, column: 22, scope: !432)
!434 = !DILocation(line: 335, column: 17, scope: !428)
!435 = !DILocation(line: 337, column: 37, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !66, line: 336, column: 13)
!437 = !DILocation(line: 337, column: 30, scope: !436)
!438 = !DILocation(line: 337, column: 17, scope: !436)
!439 = !DILocation(line: 338, column: 13, scope: !436)
!440 = !DILocation(line: 341, column: 17, scope: !441)
!441 = distinct !DILexicalBlock(scope: !432, file: !66, line: 340, column: 13)
!442 = !DILocation(line: 344, column: 5, scope: !429)
!443 = !DILocalVariable(name: "buffer", scope: !444, file: !66, line: 348, type: !173)
!444 = distinct !DILexicalBlock(scope: !445, file: !66, line: 347, column: 9)
!445 = distinct !DILexicalBlock(scope: !425, file: !66, line: 346, column: 5)
!446 = !DILocation(line: 348, column: 17, scope: !444)
!447 = !DILocation(line: 351, column: 17, scope: !448)
!448 = distinct !DILexicalBlock(scope: !444, file: !66, line: 351, column: 17)
!449 = !DILocation(line: 351, column: 22, scope: !448)
!450 = !DILocation(line: 351, column: 17, scope: !444)
!451 = !DILocation(line: 353, column: 37, scope: !452)
!452 = distinct !DILexicalBlock(scope: !448, file: !66, line: 352, column: 13)
!453 = !DILocation(line: 353, column: 30, scope: !452)
!454 = !DILocation(line: 353, column: 17, scope: !452)
!455 = !DILocation(line: 354, column: 13, scope: !452)
!456 = !DILocation(line: 357, column: 17, scope: !457)
!457 = distinct !DILexicalBlock(scope: !448, file: !66, line: 356, column: 13)
!458 = !DILocation(line: 361, column: 1, scope: !412)
