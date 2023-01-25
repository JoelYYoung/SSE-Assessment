; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_08_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  br i1 %tobool25, label %if.then26, label %if.end33, !dbg !167

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !168, metadata !DIExpression()), !dbg !174
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !174
  %11 = load i32, i32* %data, align 4, !dbg !175
  %cmp27 = icmp sge i32 %11, 0, !dbg !177
  br i1 %cmp27, label %if.then29, label %if.else, !dbg !178

if.then29:                                        ; preds = %if.then26
  %12 = load i32, i32* %data, align 4, !dbg !179
  %idxprom30 = sext i32 %12 to i64, !dbg !181
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !181
  %13 = load i32, i32* %arrayidx31, align 4, !dbg !181
  call void @printIntLine(i32 %13), !dbg !182
  br label %if.end32, !dbg !183

if.else:                                          ; preds = %if.then26
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !184
  br label %if.end32

if.end32:                                         ; preds = %if.else, %if.then29
  br label %if.end33, !dbg !186

if.end33:                                         ; preds = %if.end32, %if.end23
  ret void, !dbg !187
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_08_good() #0 !dbg !188 {
entry:
  call void @goodB2G1(), !dbg !189
  call void @goodB2G2(), !dbg !190
  call void @goodG2B1(), !dbg !191
  call void @goodG2B2(), !dbg !192
  ret void, !dbg !193
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !194 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !199, metadata !DIExpression()), !dbg !200
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !201, metadata !DIExpression()), !dbg !202
  %call = call i64 @time(i64* null) #7, !dbg !203
  %conv = trunc i64 %call to i32, !dbg !204
  call void @srand(i32 %conv) #7, !dbg !205
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !206
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_08_good(), !dbg !207
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !208
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !209
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_08_bad(), !dbg !210
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !211
  ret i32 0, !dbg !212
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !213 {
entry:
  ret i32 1, !dbg !216
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !217 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 -1, i32* %data, align 4, !dbg !220
  %call = call i32 @staticReturnsTrue(), !dbg !221
  %tobool = icmp ne i32 %call, 0, !dbg !221
  br i1 %tobool, label %if.then, label %if.end23, !dbg !223

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !224, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !228, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !230, metadata !DIExpression()), !dbg !231
  store i32 -1, i32* %connectSocket, align 4, !dbg !231
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !232, metadata !DIExpression()), !dbg !233
  br label %do.body, !dbg !234

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !235
  store i32 %call1, i32* %connectSocket, align 4, !dbg !237
  %0 = load i32, i32* %connectSocket, align 4, !dbg !238
  %cmp = icmp eq i32 %0, -1, !dbg !240
  br i1 %cmp, label %if.then2, label %if.end, !dbg !241

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !242

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !244
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !244
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !245
  store i16 2, i16* %sin_family, align 4, !dbg !246
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !247
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !248
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !249
  store i32 %call3, i32* %s_addr, align 4, !dbg !250
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !251
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !252
  store i16 %call4, i16* %sin_port, align 2, !dbg !253
  %2 = load i32, i32* %connectSocket, align 4, !dbg !254
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !256
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !257
  %cmp6 = icmp eq i32 %call5, -1, !dbg !258
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !259

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !260

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !262
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !263
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !264
  %conv = trunc i64 %call9 to i32, !dbg !264
  store i32 %conv, i32* %recvResult, align 4, !dbg !265
  %5 = load i32, i32* %recvResult, align 4, !dbg !266
  %cmp10 = icmp eq i32 %5, -1, !dbg !268
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !269

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !270
  %cmp12 = icmp eq i32 %6, 0, !dbg !271
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !272

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !273

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !275
  %idxprom = sext i32 %7 to i64, !dbg !276
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !276
  store i8 0, i8* %arrayidx, align 1, !dbg !277
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !278
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !279
  store i32 %call17, i32* %data, align 4, !dbg !280
  br label %do.end, !dbg !281

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !282
  %cmp18 = icmp ne i32 %8, -1, !dbg !284
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !285

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !286
  %call21 = call i32 @close(i32 %9), !dbg !288
  br label %if.end22, !dbg !289

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !290

if.end23:                                         ; preds = %if.end22, %entry
  %call24 = call i32 @staticReturnsFalse(), !dbg !291
  %tobool25 = icmp ne i32 %call24, 0, !dbg !291
  br i1 %tobool25, label %if.then26, label %if.else, !dbg !293

if.then26:                                        ; preds = %if.end23
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !294
  br label %if.end36, !dbg !296

if.else:                                          ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !297, metadata !DIExpression()), !dbg !300
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !300
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !300
  %11 = load i32, i32* %data, align 4, !dbg !301
  %cmp27 = icmp sge i32 %11, 0, !dbg !303
  br i1 %cmp27, label %land.lhs.true, label %if.else34, !dbg !304

land.lhs.true:                                    ; preds = %if.else
  %12 = load i32, i32* %data, align 4, !dbg !305
  %cmp29 = icmp slt i32 %12, 10, !dbg !306
  br i1 %cmp29, label %if.then31, label %if.else34, !dbg !307

if.then31:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !308
  %idxprom32 = sext i32 %13 to i64, !dbg !310
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !310
  %14 = load i32, i32* %arrayidx33, align 4, !dbg !310
  call void @printIntLine(i32 %14), !dbg !311
  br label %if.end35, !dbg !312

if.else34:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !313
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %if.then31
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then26
  ret void, !dbg !315
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !316 {
entry:
  ret i32 0, !dbg !317
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !318 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !319, metadata !DIExpression()), !dbg !320
  store i32 -1, i32* %data, align 4, !dbg !321
  %call = call i32 @staticReturnsTrue(), !dbg !322
  %tobool = icmp ne i32 %call, 0, !dbg !322
  br i1 %tobool, label %if.then, label %if.end23, !dbg !324

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !325, metadata !DIExpression()), !dbg !328
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !329, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !331, metadata !DIExpression()), !dbg !332
  store i32 -1, i32* %connectSocket, align 4, !dbg !332
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !333, metadata !DIExpression()), !dbg !334
  br label %do.body, !dbg !335

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !336
  store i32 %call1, i32* %connectSocket, align 4, !dbg !338
  %0 = load i32, i32* %connectSocket, align 4, !dbg !339
  %cmp = icmp eq i32 %0, -1, !dbg !341
  br i1 %cmp, label %if.then2, label %if.end, !dbg !342

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !343

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !345
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !345
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !346
  store i16 2, i16* %sin_family, align 4, !dbg !347
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !348
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !349
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !350
  store i32 %call3, i32* %s_addr, align 4, !dbg !351
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !352
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !353
  store i16 %call4, i16* %sin_port, align 2, !dbg !354
  %2 = load i32, i32* %connectSocket, align 4, !dbg !355
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !357
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !358
  %cmp6 = icmp eq i32 %call5, -1, !dbg !359
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !360

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !361

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !363
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !364
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !365
  %conv = trunc i64 %call9 to i32, !dbg !365
  store i32 %conv, i32* %recvResult, align 4, !dbg !366
  %5 = load i32, i32* %recvResult, align 4, !dbg !367
  %cmp10 = icmp eq i32 %5, -1, !dbg !369
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !370

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !371
  %cmp12 = icmp eq i32 %6, 0, !dbg !372
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !373

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !374

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !376
  %idxprom = sext i32 %7 to i64, !dbg !377
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !377
  store i8 0, i8* %arrayidx, align 1, !dbg !378
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !379
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !380
  store i32 %call17, i32* %data, align 4, !dbg !381
  br label %do.end, !dbg !382

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !383
  %cmp18 = icmp ne i32 %8, -1, !dbg !385
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !386

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !387
  %call21 = call i32 @close(i32 %9), !dbg !389
  br label %if.end22, !dbg !390

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !391

if.end23:                                         ; preds = %if.end22, %entry
  %call24 = call i32 @staticReturnsTrue(), !dbg !392
  %tobool25 = icmp ne i32 %call24, 0, !dbg !392
  br i1 %tobool25, label %if.then26, label %if.end35, !dbg !394

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !395, metadata !DIExpression()), !dbg !398
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !398
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !398
  %11 = load i32, i32* %data, align 4, !dbg !399
  %cmp27 = icmp sge i32 %11, 0, !dbg !401
  br i1 %cmp27, label %land.lhs.true, label %if.else, !dbg !402

land.lhs.true:                                    ; preds = %if.then26
  %12 = load i32, i32* %data, align 4, !dbg !403
  %cmp29 = icmp slt i32 %12, 10, !dbg !404
  br i1 %cmp29, label %if.then31, label %if.else, !dbg !405

if.then31:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !406
  %idxprom32 = sext i32 %13 to i64, !dbg !408
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !408
  %14 = load i32, i32* %arrayidx33, align 4, !dbg !408
  call void @printIntLine(i32 %14), !dbg !409
  br label %if.end34, !dbg !410

if.else:                                          ; preds = %land.lhs.true, %if.then26
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !411
  br label %if.end34

if.end34:                                         ; preds = %if.else, %if.then31
  br label %if.end35, !dbg !413

if.end35:                                         ; preds = %if.end34, %if.end23
  ret void, !dbg !414
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !415 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !416, metadata !DIExpression()), !dbg !417
  store i32 -1, i32* %data, align 4, !dbg !418
  %call = call i32 @staticReturnsFalse(), !dbg !419
  %tobool = icmp ne i32 %call, 0, !dbg !419
  br i1 %tobool, label %if.then, label %if.else, !dbg !421

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !422
  br label %if.end, !dbg !424

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !425
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !427
  %tobool2 = icmp ne i32 %call1, 0, !dbg !427
  br i1 %tobool2, label %if.then3, label %if.end7, !dbg !429

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !430, metadata !DIExpression()), !dbg !433
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !433
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !433
  %1 = load i32, i32* %data, align 4, !dbg !434
  %cmp = icmp sge i32 %1, 0, !dbg !436
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !437

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !438
  %idxprom = sext i32 %2 to i64, !dbg !440
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !440
  %3 = load i32, i32* %arrayidx, align 4, !dbg !440
  call void @printIntLine(i32 %3), !dbg !441
  br label %if.end6, !dbg !442

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !443
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !445

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !446
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !447 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !448, metadata !DIExpression()), !dbg !449
  store i32 -1, i32* %data, align 4, !dbg !450
  %call = call i32 @staticReturnsTrue(), !dbg !451
  %tobool = icmp ne i32 %call, 0, !dbg !451
  br i1 %tobool, label %if.then, label %if.end, !dbg !453

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !454
  br label %if.end, !dbg !456

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !457
  %tobool2 = icmp ne i32 %call1, 0, !dbg !457
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !459

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !460, metadata !DIExpression()), !dbg !463
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !463
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !463
  %1 = load i32, i32* %data, align 4, !dbg !464
  %cmp = icmp sge i32 %1, 0, !dbg !466
  br i1 %cmp, label %if.then4, label %if.else, !dbg !467

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !468
  %idxprom = sext i32 %2 to i64, !dbg !470
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !470
  %3 = load i32, i32* %arrayidx, align 4, !dbg !470
  call void @printIntLine(i32 %3), !dbg !471
  br label %if.end5, !dbg !472

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !473
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !475

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !476
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_08_bad", scope: !66, file: !66, line: 57, type: !67, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!168 = !DILocalVariable(name: "buffer", scope: !169, file: !66, line: 124, type: !171)
!169 = distinct !DILexicalBlock(scope: !170, file: !66, line: 123, column: 9)
!170 = distinct !DILexicalBlock(scope: !166, file: !66, line: 122, column: 5)
!171 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !172)
!172 = !{!173}
!173 = !DISubrange(count: 10)
!174 = !DILocation(line: 124, column: 17, scope: !169)
!175 = !DILocation(line: 127, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !169, file: !66, line: 127, column: 17)
!177 = !DILocation(line: 127, column: 22, scope: !176)
!178 = !DILocation(line: 127, column: 17, scope: !169)
!179 = !DILocation(line: 129, column: 37, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !66, line: 128, column: 13)
!181 = !DILocation(line: 129, column: 30, scope: !180)
!182 = !DILocation(line: 129, column: 17, scope: !180)
!183 = !DILocation(line: 130, column: 13, scope: !180)
!184 = !DILocation(line: 133, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !176, file: !66, line: 132, column: 13)
!186 = !DILocation(line: 136, column: 5, scope: !170)
!187 = !DILocation(line: 137, column: 1, scope: !65)
!188 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_08_good", scope: !66, file: !66, line: 377, type: !67, scopeLine: 378, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!189 = !DILocation(line: 379, column: 5, scope: !188)
!190 = !DILocation(line: 380, column: 5, scope: !188)
!191 = !DILocation(line: 381, column: 5, scope: !188)
!192 = !DILocation(line: 382, column: 5, scope: !188)
!193 = !DILocation(line: 383, column: 1, scope: !188)
!194 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 394, type: !195, scopeLine: 395, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!195 = !DISubroutineType(types: !196)
!196 = !{!71, !71, !197}
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!199 = !DILocalVariable(name: "argc", arg: 1, scope: !194, file: !66, line: 394, type: !71)
!200 = !DILocation(line: 394, column: 14, scope: !194)
!201 = !DILocalVariable(name: "argv", arg: 2, scope: !194, file: !66, line: 394, type: !197)
!202 = !DILocation(line: 394, column: 27, scope: !194)
!203 = !DILocation(line: 397, column: 22, scope: !194)
!204 = !DILocation(line: 397, column: 12, scope: !194)
!205 = !DILocation(line: 397, column: 5, scope: !194)
!206 = !DILocation(line: 399, column: 5, scope: !194)
!207 = !DILocation(line: 400, column: 5, scope: !194)
!208 = !DILocation(line: 401, column: 5, scope: !194)
!209 = !DILocation(line: 404, column: 5, scope: !194)
!210 = !DILocation(line: 405, column: 5, scope: !194)
!211 = !DILocation(line: 406, column: 5, scope: !194)
!212 = !DILocation(line: 408, column: 5, scope: !194)
!213 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !66, file: !66, line: 45, type: !214, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!214 = !DISubroutineType(types: !215)
!215 = !{!71}
!216 = !DILocation(line: 47, column: 5, scope: !213)
!217 = distinct !DISubprogram(name: "goodB2G1", scope: !66, file: !66, line: 144, type: !67, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!218 = !DILocalVariable(name: "data", scope: !217, file: !66, line: 146, type: !71)
!219 = !DILocation(line: 146, column: 9, scope: !217)
!220 = !DILocation(line: 148, column: 10, scope: !217)
!221 = !DILocation(line: 149, column: 8, scope: !222)
!222 = distinct !DILexicalBlock(scope: !217, file: !66, line: 149, column: 8)
!223 = !DILocation(line: 149, column: 8, scope: !217)
!224 = !DILocalVariable(name: "recvResult", scope: !225, file: !66, line: 156, type: !71)
!225 = distinct !DILexicalBlock(scope: !226, file: !66, line: 151, column: 9)
!226 = distinct !DILexicalBlock(scope: !222, file: !66, line: 150, column: 5)
!227 = !DILocation(line: 156, column: 17, scope: !225)
!228 = !DILocalVariable(name: "service", scope: !225, file: !66, line: 157, type: !82)
!229 = !DILocation(line: 157, column: 32, scope: !225)
!230 = !DILocalVariable(name: "connectSocket", scope: !225, file: !66, line: 158, type: !71)
!231 = !DILocation(line: 158, column: 20, scope: !225)
!232 = !DILocalVariable(name: "inputBuffer", scope: !225, file: !66, line: 159, type: !55)
!233 = !DILocation(line: 159, column: 18, scope: !225)
!234 = !DILocation(line: 160, column: 13, scope: !225)
!235 = !DILocation(line: 170, column: 33, scope: !236)
!236 = distinct !DILexicalBlock(scope: !225, file: !66, line: 161, column: 13)
!237 = !DILocation(line: 170, column: 31, scope: !236)
!238 = !DILocation(line: 171, column: 21, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !66, line: 171, column: 21)
!240 = !DILocation(line: 171, column: 35, scope: !239)
!241 = !DILocation(line: 171, column: 21, scope: !236)
!242 = !DILocation(line: 173, column: 21, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !66, line: 172, column: 17)
!244 = !DILocation(line: 175, column: 17, scope: !236)
!245 = !DILocation(line: 176, column: 25, scope: !236)
!246 = !DILocation(line: 176, column: 36, scope: !236)
!247 = !DILocation(line: 177, column: 43, scope: !236)
!248 = !DILocation(line: 177, column: 25, scope: !236)
!249 = !DILocation(line: 177, column: 34, scope: !236)
!250 = !DILocation(line: 177, column: 41, scope: !236)
!251 = !DILocation(line: 178, column: 36, scope: !236)
!252 = !DILocation(line: 178, column: 25, scope: !236)
!253 = !DILocation(line: 178, column: 34, scope: !236)
!254 = !DILocation(line: 179, column: 29, scope: !255)
!255 = distinct !DILexicalBlock(scope: !236, file: !66, line: 179, column: 21)
!256 = !DILocation(line: 179, column: 44, scope: !255)
!257 = !DILocation(line: 179, column: 21, scope: !255)
!258 = !DILocation(line: 179, column: 89, scope: !255)
!259 = !DILocation(line: 179, column: 21, scope: !236)
!260 = !DILocation(line: 181, column: 21, scope: !261)
!261 = distinct !DILexicalBlock(scope: !255, file: !66, line: 180, column: 17)
!262 = !DILocation(line: 185, column: 35, scope: !236)
!263 = !DILocation(line: 185, column: 50, scope: !236)
!264 = !DILocation(line: 185, column: 30, scope: !236)
!265 = !DILocation(line: 185, column: 28, scope: !236)
!266 = !DILocation(line: 186, column: 21, scope: !267)
!267 = distinct !DILexicalBlock(scope: !236, file: !66, line: 186, column: 21)
!268 = !DILocation(line: 186, column: 32, scope: !267)
!269 = !DILocation(line: 186, column: 48, scope: !267)
!270 = !DILocation(line: 186, column: 51, scope: !267)
!271 = !DILocation(line: 186, column: 62, scope: !267)
!272 = !DILocation(line: 186, column: 21, scope: !236)
!273 = !DILocation(line: 188, column: 21, scope: !274)
!274 = distinct !DILexicalBlock(scope: !267, file: !66, line: 187, column: 17)
!275 = !DILocation(line: 191, column: 29, scope: !236)
!276 = !DILocation(line: 191, column: 17, scope: !236)
!277 = !DILocation(line: 191, column: 41, scope: !236)
!278 = !DILocation(line: 193, column: 29, scope: !236)
!279 = !DILocation(line: 193, column: 24, scope: !236)
!280 = !DILocation(line: 193, column: 22, scope: !236)
!281 = !DILocation(line: 194, column: 13, scope: !236)
!282 = !DILocation(line: 196, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !225, file: !66, line: 196, column: 17)
!284 = !DILocation(line: 196, column: 31, scope: !283)
!285 = !DILocation(line: 196, column: 17, scope: !225)
!286 = !DILocation(line: 198, column: 30, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !66, line: 197, column: 13)
!288 = !DILocation(line: 198, column: 17, scope: !287)
!289 = !DILocation(line: 199, column: 13, scope: !287)
!290 = !DILocation(line: 207, column: 5, scope: !226)
!291 = !DILocation(line: 208, column: 8, scope: !292)
!292 = distinct !DILexicalBlock(scope: !217, file: !66, line: 208, column: 8)
!293 = !DILocation(line: 208, column: 8, scope: !217)
!294 = !DILocation(line: 211, column: 9, scope: !295)
!295 = distinct !DILexicalBlock(scope: !292, file: !66, line: 209, column: 5)
!296 = !DILocation(line: 212, column: 5, scope: !295)
!297 = !DILocalVariable(name: "buffer", scope: !298, file: !66, line: 216, type: !171)
!298 = distinct !DILexicalBlock(scope: !299, file: !66, line: 215, column: 9)
!299 = distinct !DILexicalBlock(scope: !292, file: !66, line: 214, column: 5)
!300 = !DILocation(line: 216, column: 17, scope: !298)
!301 = !DILocation(line: 218, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !66, line: 218, column: 17)
!303 = !DILocation(line: 218, column: 22, scope: !302)
!304 = !DILocation(line: 218, column: 27, scope: !302)
!305 = !DILocation(line: 218, column: 30, scope: !302)
!306 = !DILocation(line: 218, column: 35, scope: !302)
!307 = !DILocation(line: 218, column: 17, scope: !298)
!308 = !DILocation(line: 220, column: 37, scope: !309)
!309 = distinct !DILexicalBlock(scope: !302, file: !66, line: 219, column: 13)
!310 = !DILocation(line: 220, column: 30, scope: !309)
!311 = !DILocation(line: 220, column: 17, scope: !309)
!312 = !DILocation(line: 221, column: 13, scope: !309)
!313 = !DILocation(line: 224, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !302, file: !66, line: 223, column: 13)
!315 = !DILocation(line: 228, column: 1, scope: !217)
!316 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !66, file: !66, line: 50, type: !214, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!317 = !DILocation(line: 52, column: 5, scope: !316)
!318 = distinct !DISubprogram(name: "goodB2G2", scope: !66, file: !66, line: 231, type: !67, scopeLine: 232, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!319 = !DILocalVariable(name: "data", scope: !318, file: !66, line: 233, type: !71)
!320 = !DILocation(line: 233, column: 9, scope: !318)
!321 = !DILocation(line: 235, column: 10, scope: !318)
!322 = !DILocation(line: 236, column: 8, scope: !323)
!323 = distinct !DILexicalBlock(scope: !318, file: !66, line: 236, column: 8)
!324 = !DILocation(line: 236, column: 8, scope: !318)
!325 = !DILocalVariable(name: "recvResult", scope: !326, file: !66, line: 243, type: !71)
!326 = distinct !DILexicalBlock(scope: !327, file: !66, line: 238, column: 9)
!327 = distinct !DILexicalBlock(scope: !323, file: !66, line: 237, column: 5)
!328 = !DILocation(line: 243, column: 17, scope: !326)
!329 = !DILocalVariable(name: "service", scope: !326, file: !66, line: 244, type: !82)
!330 = !DILocation(line: 244, column: 32, scope: !326)
!331 = !DILocalVariable(name: "connectSocket", scope: !326, file: !66, line: 245, type: !71)
!332 = !DILocation(line: 245, column: 20, scope: !326)
!333 = !DILocalVariable(name: "inputBuffer", scope: !326, file: !66, line: 246, type: !55)
!334 = !DILocation(line: 246, column: 18, scope: !326)
!335 = !DILocation(line: 247, column: 13, scope: !326)
!336 = !DILocation(line: 257, column: 33, scope: !337)
!337 = distinct !DILexicalBlock(scope: !326, file: !66, line: 248, column: 13)
!338 = !DILocation(line: 257, column: 31, scope: !337)
!339 = !DILocation(line: 258, column: 21, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !66, line: 258, column: 21)
!341 = !DILocation(line: 258, column: 35, scope: !340)
!342 = !DILocation(line: 258, column: 21, scope: !337)
!343 = !DILocation(line: 260, column: 21, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !66, line: 259, column: 17)
!345 = !DILocation(line: 262, column: 17, scope: !337)
!346 = !DILocation(line: 263, column: 25, scope: !337)
!347 = !DILocation(line: 263, column: 36, scope: !337)
!348 = !DILocation(line: 264, column: 43, scope: !337)
!349 = !DILocation(line: 264, column: 25, scope: !337)
!350 = !DILocation(line: 264, column: 34, scope: !337)
!351 = !DILocation(line: 264, column: 41, scope: !337)
!352 = !DILocation(line: 265, column: 36, scope: !337)
!353 = !DILocation(line: 265, column: 25, scope: !337)
!354 = !DILocation(line: 265, column: 34, scope: !337)
!355 = !DILocation(line: 266, column: 29, scope: !356)
!356 = distinct !DILexicalBlock(scope: !337, file: !66, line: 266, column: 21)
!357 = !DILocation(line: 266, column: 44, scope: !356)
!358 = !DILocation(line: 266, column: 21, scope: !356)
!359 = !DILocation(line: 266, column: 89, scope: !356)
!360 = !DILocation(line: 266, column: 21, scope: !337)
!361 = !DILocation(line: 268, column: 21, scope: !362)
!362 = distinct !DILexicalBlock(scope: !356, file: !66, line: 267, column: 17)
!363 = !DILocation(line: 272, column: 35, scope: !337)
!364 = !DILocation(line: 272, column: 50, scope: !337)
!365 = !DILocation(line: 272, column: 30, scope: !337)
!366 = !DILocation(line: 272, column: 28, scope: !337)
!367 = !DILocation(line: 273, column: 21, scope: !368)
!368 = distinct !DILexicalBlock(scope: !337, file: !66, line: 273, column: 21)
!369 = !DILocation(line: 273, column: 32, scope: !368)
!370 = !DILocation(line: 273, column: 48, scope: !368)
!371 = !DILocation(line: 273, column: 51, scope: !368)
!372 = !DILocation(line: 273, column: 62, scope: !368)
!373 = !DILocation(line: 273, column: 21, scope: !337)
!374 = !DILocation(line: 275, column: 21, scope: !375)
!375 = distinct !DILexicalBlock(scope: !368, file: !66, line: 274, column: 17)
!376 = !DILocation(line: 278, column: 29, scope: !337)
!377 = !DILocation(line: 278, column: 17, scope: !337)
!378 = !DILocation(line: 278, column: 41, scope: !337)
!379 = !DILocation(line: 280, column: 29, scope: !337)
!380 = !DILocation(line: 280, column: 24, scope: !337)
!381 = !DILocation(line: 280, column: 22, scope: !337)
!382 = !DILocation(line: 281, column: 13, scope: !337)
!383 = !DILocation(line: 283, column: 17, scope: !384)
!384 = distinct !DILexicalBlock(scope: !326, file: !66, line: 283, column: 17)
!385 = !DILocation(line: 283, column: 31, scope: !384)
!386 = !DILocation(line: 283, column: 17, scope: !326)
!387 = !DILocation(line: 285, column: 30, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !66, line: 284, column: 13)
!389 = !DILocation(line: 285, column: 17, scope: !388)
!390 = !DILocation(line: 286, column: 13, scope: !388)
!391 = !DILocation(line: 294, column: 5, scope: !327)
!392 = !DILocation(line: 295, column: 8, scope: !393)
!393 = distinct !DILexicalBlock(scope: !318, file: !66, line: 295, column: 8)
!394 = !DILocation(line: 295, column: 8, scope: !318)
!395 = !DILocalVariable(name: "buffer", scope: !396, file: !66, line: 298, type: !171)
!396 = distinct !DILexicalBlock(scope: !397, file: !66, line: 297, column: 9)
!397 = distinct !DILexicalBlock(scope: !393, file: !66, line: 296, column: 5)
!398 = !DILocation(line: 298, column: 17, scope: !396)
!399 = !DILocation(line: 300, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !66, line: 300, column: 17)
!401 = !DILocation(line: 300, column: 22, scope: !400)
!402 = !DILocation(line: 300, column: 27, scope: !400)
!403 = !DILocation(line: 300, column: 30, scope: !400)
!404 = !DILocation(line: 300, column: 35, scope: !400)
!405 = !DILocation(line: 300, column: 17, scope: !396)
!406 = !DILocation(line: 302, column: 37, scope: !407)
!407 = distinct !DILexicalBlock(scope: !400, file: !66, line: 301, column: 13)
!408 = !DILocation(line: 302, column: 30, scope: !407)
!409 = !DILocation(line: 302, column: 17, scope: !407)
!410 = !DILocation(line: 303, column: 13, scope: !407)
!411 = !DILocation(line: 306, column: 17, scope: !412)
!412 = distinct !DILexicalBlock(scope: !400, file: !66, line: 305, column: 13)
!413 = !DILocation(line: 309, column: 5, scope: !397)
!414 = !DILocation(line: 310, column: 1, scope: !318)
!415 = distinct !DISubprogram(name: "goodG2B1", scope: !66, file: !66, line: 313, type: !67, scopeLine: 314, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!416 = !DILocalVariable(name: "data", scope: !415, file: !66, line: 315, type: !71)
!417 = !DILocation(line: 315, column: 9, scope: !415)
!418 = !DILocation(line: 317, column: 10, scope: !415)
!419 = !DILocation(line: 318, column: 8, scope: !420)
!420 = distinct !DILexicalBlock(scope: !415, file: !66, line: 318, column: 8)
!421 = !DILocation(line: 318, column: 8, scope: !415)
!422 = !DILocation(line: 321, column: 9, scope: !423)
!423 = distinct !DILexicalBlock(scope: !420, file: !66, line: 319, column: 5)
!424 = !DILocation(line: 322, column: 5, scope: !423)
!425 = !DILocation(line: 327, column: 14, scope: !426)
!426 = distinct !DILexicalBlock(scope: !420, file: !66, line: 324, column: 5)
!427 = !DILocation(line: 329, column: 8, scope: !428)
!428 = distinct !DILexicalBlock(scope: !415, file: !66, line: 329, column: 8)
!429 = !DILocation(line: 329, column: 8, scope: !415)
!430 = !DILocalVariable(name: "buffer", scope: !431, file: !66, line: 332, type: !171)
!431 = distinct !DILexicalBlock(scope: !432, file: !66, line: 331, column: 9)
!432 = distinct !DILexicalBlock(scope: !428, file: !66, line: 330, column: 5)
!433 = !DILocation(line: 332, column: 17, scope: !431)
!434 = !DILocation(line: 335, column: 17, scope: !435)
!435 = distinct !DILexicalBlock(scope: !431, file: !66, line: 335, column: 17)
!436 = !DILocation(line: 335, column: 22, scope: !435)
!437 = !DILocation(line: 335, column: 17, scope: !431)
!438 = !DILocation(line: 337, column: 37, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !66, line: 336, column: 13)
!440 = !DILocation(line: 337, column: 30, scope: !439)
!441 = !DILocation(line: 337, column: 17, scope: !439)
!442 = !DILocation(line: 338, column: 13, scope: !439)
!443 = !DILocation(line: 341, column: 17, scope: !444)
!444 = distinct !DILexicalBlock(scope: !435, file: !66, line: 340, column: 13)
!445 = !DILocation(line: 344, column: 5, scope: !432)
!446 = !DILocation(line: 345, column: 1, scope: !415)
!447 = distinct !DISubprogram(name: "goodG2B2", scope: !66, file: !66, line: 348, type: !67, scopeLine: 349, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!448 = !DILocalVariable(name: "data", scope: !447, file: !66, line: 350, type: !71)
!449 = !DILocation(line: 350, column: 9, scope: !447)
!450 = !DILocation(line: 352, column: 10, scope: !447)
!451 = !DILocation(line: 353, column: 8, scope: !452)
!452 = distinct !DILexicalBlock(scope: !447, file: !66, line: 353, column: 8)
!453 = !DILocation(line: 353, column: 8, scope: !447)
!454 = !DILocation(line: 357, column: 14, scope: !455)
!455 = distinct !DILexicalBlock(scope: !452, file: !66, line: 354, column: 5)
!456 = !DILocation(line: 358, column: 5, scope: !455)
!457 = !DILocation(line: 359, column: 8, scope: !458)
!458 = distinct !DILexicalBlock(scope: !447, file: !66, line: 359, column: 8)
!459 = !DILocation(line: 359, column: 8, scope: !447)
!460 = !DILocalVariable(name: "buffer", scope: !461, file: !66, line: 362, type: !171)
!461 = distinct !DILexicalBlock(scope: !462, file: !66, line: 361, column: 9)
!462 = distinct !DILexicalBlock(scope: !458, file: !66, line: 360, column: 5)
!463 = !DILocation(line: 362, column: 17, scope: !461)
!464 = !DILocation(line: 365, column: 17, scope: !465)
!465 = distinct !DILexicalBlock(scope: !461, file: !66, line: 365, column: 17)
!466 = !DILocation(line: 365, column: 22, scope: !465)
!467 = !DILocation(line: 365, column: 17, scope: !461)
!468 = !DILocation(line: 367, column: 37, scope: !469)
!469 = distinct !DILexicalBlock(scope: !465, file: !66, line: 366, column: 13)
!470 = !DILocation(line: 367, column: 30, scope: !469)
!471 = !DILocation(line: 367, column: 17, scope: !469)
!472 = !DILocation(line: 368, column: 13, scope: !469)
!473 = !DILocation(line: 371, column: 17, scope: !474)
!474 = distinct !DILexicalBlock(scope: !465, file: !66, line: 370, column: 13)
!475 = !DILocation(line: 374, column: 5, scope: !462)
!476 = !DILocation(line: 375, column: 1, scope: !447)
