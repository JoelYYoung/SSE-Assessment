; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_11.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_11_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  %call = call i32 (...) @globalReturnsTrue(), !dbg !74
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
  %call24 = call i32 (...) @globalReturnsTrue(), !dbg !165
  %tobool25 = icmp ne i32 %call24, 0, !dbg !165
  br i1 %tobool25, label %if.then26, label %if.end33, !dbg !167

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !168, metadata !DIExpression()), !dbg !174
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !174
  %11 = load i32, i32* %data, align 4, !dbg !175
  %cmp27 = icmp slt i32 %11, 10, !dbg !177
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

declare dso_local i32 @globalReturnsTrue(...) #2

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
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_11_good() #0 !dbg !188 {
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
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_11_good(), !dbg !207
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !208
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !209
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_11_bad(), !dbg !210
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !211
  ret i32 0, !dbg !212
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !213 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !214, metadata !DIExpression()), !dbg !215
  store i32 -1, i32* %data, align 4, !dbg !216
  %call = call i32 (...) @globalReturnsTrue(), !dbg !217
  %tobool = icmp ne i32 %call, 0, !dbg !217
  br i1 %tobool, label %if.then, label %if.end23, !dbg !219

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !220, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !224, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !226, metadata !DIExpression()), !dbg !227
  store i32 -1, i32* %connectSocket, align 4, !dbg !227
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !228, metadata !DIExpression()), !dbg !229
  br label %do.body, !dbg !230

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !231
  store i32 %call1, i32* %connectSocket, align 4, !dbg !233
  %0 = load i32, i32* %connectSocket, align 4, !dbg !234
  %cmp = icmp eq i32 %0, -1, !dbg !236
  br i1 %cmp, label %if.then2, label %if.end, !dbg !237

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !238

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !240
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !240
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !241
  store i16 2, i16* %sin_family, align 4, !dbg !242
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !243
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !244
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !245
  store i32 %call3, i32* %s_addr, align 4, !dbg !246
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !247
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !248
  store i16 %call4, i16* %sin_port, align 2, !dbg !249
  %2 = load i32, i32* %connectSocket, align 4, !dbg !250
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !252
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !253
  %cmp6 = icmp eq i32 %call5, -1, !dbg !254
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !255

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !256

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !258
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !259
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !260
  %conv = trunc i64 %call9 to i32, !dbg !260
  store i32 %conv, i32* %recvResult, align 4, !dbg !261
  %5 = load i32, i32* %recvResult, align 4, !dbg !262
  %cmp10 = icmp eq i32 %5, -1, !dbg !264
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !265

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !266
  %cmp12 = icmp eq i32 %6, 0, !dbg !267
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !268

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !269

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !271
  %idxprom = sext i32 %7 to i64, !dbg !272
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !272
  store i8 0, i8* %arrayidx, align 1, !dbg !273
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !274
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !275
  store i32 %call17, i32* %data, align 4, !dbg !276
  br label %do.end, !dbg !277

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !278
  %cmp18 = icmp ne i32 %8, -1, !dbg !280
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !281

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !282
  %call21 = call i32 @close(i32 %9), !dbg !284
  br label %if.end22, !dbg !285

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !286

if.end23:                                         ; preds = %if.end22, %entry
  %call24 = call i32 (...) @globalReturnsFalse(), !dbg !287
  %tobool25 = icmp ne i32 %call24, 0, !dbg !287
  br i1 %tobool25, label %if.then26, label %if.else, !dbg !289

if.then26:                                        ; preds = %if.end23
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !290
  br label %if.end36, !dbg !292

if.else:                                          ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !293, metadata !DIExpression()), !dbg !296
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !296
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !296
  %11 = load i32, i32* %data, align 4, !dbg !297
  %cmp27 = icmp sge i32 %11, 0, !dbg !299
  br i1 %cmp27, label %land.lhs.true, label %if.else34, !dbg !300

land.lhs.true:                                    ; preds = %if.else
  %12 = load i32, i32* %data, align 4, !dbg !301
  %cmp29 = icmp slt i32 %12, 10, !dbg !302
  br i1 %cmp29, label %if.then31, label %if.else34, !dbg !303

if.then31:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !304
  %idxprom32 = sext i32 %13 to i64, !dbg !306
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !306
  %14 = load i32, i32* %arrayidx33, align 4, !dbg !306
  call void @printIntLine(i32 %14), !dbg !307
  br label %if.end35, !dbg !308

if.else34:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !309
  br label %if.end35

if.end35:                                         ; preds = %if.else34, %if.then31
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then26
  ret void, !dbg !311
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !312 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !313, metadata !DIExpression()), !dbg !314
  store i32 -1, i32* %data, align 4, !dbg !315
  %call = call i32 (...) @globalReturnsTrue(), !dbg !316
  %tobool = icmp ne i32 %call, 0, !dbg !316
  br i1 %tobool, label %if.then, label %if.end23, !dbg !318

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !319, metadata !DIExpression()), !dbg !322
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !323, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !325, metadata !DIExpression()), !dbg !326
  store i32 -1, i32* %connectSocket, align 4, !dbg !326
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !327, metadata !DIExpression()), !dbg !328
  br label %do.body, !dbg !329

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !330
  store i32 %call1, i32* %connectSocket, align 4, !dbg !332
  %0 = load i32, i32* %connectSocket, align 4, !dbg !333
  %cmp = icmp eq i32 %0, -1, !dbg !335
  br i1 %cmp, label %if.then2, label %if.end, !dbg !336

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !337

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !339
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !339
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !340
  store i16 2, i16* %sin_family, align 4, !dbg !341
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !342
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !343
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !344
  store i32 %call3, i32* %s_addr, align 4, !dbg !345
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !346
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !347
  store i16 %call4, i16* %sin_port, align 2, !dbg !348
  %2 = load i32, i32* %connectSocket, align 4, !dbg !349
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !351
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !352
  %cmp6 = icmp eq i32 %call5, -1, !dbg !353
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !354

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !355

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !357
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !358
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !359
  %conv = trunc i64 %call9 to i32, !dbg !359
  store i32 %conv, i32* %recvResult, align 4, !dbg !360
  %5 = load i32, i32* %recvResult, align 4, !dbg !361
  %cmp10 = icmp eq i32 %5, -1, !dbg !363
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !364

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !365
  %cmp12 = icmp eq i32 %6, 0, !dbg !366
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !367

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !368

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !370
  %idxprom = sext i32 %7 to i64, !dbg !371
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !371
  store i8 0, i8* %arrayidx, align 1, !dbg !372
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !373
  %call17 = call i32 @atoi(i8* %arraydecay16) #9, !dbg !374
  store i32 %call17, i32* %data, align 4, !dbg !375
  br label %do.end, !dbg !376

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !377
  %cmp18 = icmp ne i32 %8, -1, !dbg !379
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !380

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !381
  %call21 = call i32 @close(i32 %9), !dbg !383
  br label %if.end22, !dbg !384

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !385

if.end23:                                         ; preds = %if.end22, %entry
  %call24 = call i32 (...) @globalReturnsTrue(), !dbg !386
  %tobool25 = icmp ne i32 %call24, 0, !dbg !386
  br i1 %tobool25, label %if.then26, label %if.end35, !dbg !388

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !389, metadata !DIExpression()), !dbg !392
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !392
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !392
  %11 = load i32, i32* %data, align 4, !dbg !393
  %cmp27 = icmp sge i32 %11, 0, !dbg !395
  br i1 %cmp27, label %land.lhs.true, label %if.else, !dbg !396

land.lhs.true:                                    ; preds = %if.then26
  %12 = load i32, i32* %data, align 4, !dbg !397
  %cmp29 = icmp slt i32 %12, 10, !dbg !398
  br i1 %cmp29, label %if.then31, label %if.else, !dbg !399

if.then31:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !400
  %idxprom32 = sext i32 %13 to i64, !dbg !402
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !402
  %14 = load i32, i32* %arrayidx33, align 4, !dbg !402
  call void @printIntLine(i32 %14), !dbg !403
  br label %if.end34, !dbg !404

if.else:                                          ; preds = %land.lhs.true, %if.then26
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !405
  br label %if.end34

if.end34:                                         ; preds = %if.else, %if.then31
  br label %if.end35, !dbg !407

if.end35:                                         ; preds = %if.end34, %if.end23
  ret void, !dbg !408
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !409 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !410, metadata !DIExpression()), !dbg !411
  store i32 -1, i32* %data, align 4, !dbg !412
  %call = call i32 (...) @globalReturnsFalse(), !dbg !413
  %tobool = icmp ne i32 %call, 0, !dbg !413
  br i1 %tobool, label %if.then, label %if.else, !dbg !415

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !416
  br label %if.end, !dbg !418

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !419
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !421
  %tobool2 = icmp ne i32 %call1, 0, !dbg !421
  br i1 %tobool2, label %if.then3, label %if.end7, !dbg !423

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !424, metadata !DIExpression()), !dbg !427
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !427
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !427
  %1 = load i32, i32* %data, align 4, !dbg !428
  %cmp = icmp slt i32 %1, 10, !dbg !430
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !431

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !432
  %idxprom = sext i32 %2 to i64, !dbg !434
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !434
  %3 = load i32, i32* %arrayidx, align 4, !dbg !434
  call void @printIntLine(i32 %3), !dbg !435
  br label %if.end6, !dbg !436

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !437
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !439

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !440
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !441 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !442, metadata !DIExpression()), !dbg !443
  store i32 -1, i32* %data, align 4, !dbg !444
  %call = call i32 (...) @globalReturnsTrue(), !dbg !445
  %tobool = icmp ne i32 %call, 0, !dbg !445
  br i1 %tobool, label %if.then, label %if.end, !dbg !447

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !448
  br label %if.end, !dbg !450

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !451
  %tobool2 = icmp ne i32 %call1, 0, !dbg !451
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !453

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !454, metadata !DIExpression()), !dbg !457
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !457
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !457
  %1 = load i32, i32* %data, align 4, !dbg !458
  %cmp = icmp slt i32 %1, 10, !dbg !460
  br i1 %cmp, label %if.then4, label %if.else, !dbg !461

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !462
  %idxprom = sext i32 %2 to i64, !dbg !464
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !464
  %3 = load i32, i32* %arrayidx, align 4, !dbg !464
  call void @printIntLine(i32 %3), !dbg !465
  br label %if.end5, !dbg !466

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !467
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !469

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !470
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_11_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!165 = !DILocation(line: 108, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !65, file: !66, line: 108, column: 8)
!167 = !DILocation(line: 108, column: 8, scope: !65)
!168 = !DILocalVariable(name: "buffer", scope: !169, file: !66, line: 111, type: !171)
!169 = distinct !DILexicalBlock(scope: !170, file: !66, line: 110, column: 9)
!170 = distinct !DILexicalBlock(scope: !166, file: !66, line: 109, column: 5)
!171 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !172)
!172 = !{!173}
!173 = !DISubrange(count: 10)
!174 = !DILocation(line: 111, column: 17, scope: !169)
!175 = !DILocation(line: 114, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !169, file: !66, line: 114, column: 17)
!177 = !DILocation(line: 114, column: 22, scope: !176)
!178 = !DILocation(line: 114, column: 17, scope: !169)
!179 = !DILocation(line: 116, column: 37, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !66, line: 115, column: 13)
!181 = !DILocation(line: 116, column: 30, scope: !180)
!182 = !DILocation(line: 116, column: 17, scope: !180)
!183 = !DILocation(line: 117, column: 13, scope: !180)
!184 = !DILocation(line: 120, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !176, file: !66, line: 119, column: 13)
!186 = !DILocation(line: 123, column: 5, scope: !170)
!187 = !DILocation(line: 124, column: 1, scope: !65)
!188 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_11_good", scope: !66, file: !66, line: 364, type: !67, scopeLine: 365, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!189 = !DILocation(line: 366, column: 5, scope: !188)
!190 = !DILocation(line: 367, column: 5, scope: !188)
!191 = !DILocation(line: 368, column: 5, scope: !188)
!192 = !DILocation(line: 369, column: 5, scope: !188)
!193 = !DILocation(line: 370, column: 1, scope: !188)
!194 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 381, type: !195, scopeLine: 382, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!195 = !DISubroutineType(types: !196)
!196 = !{!71, !71, !197}
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!199 = !DILocalVariable(name: "argc", arg: 1, scope: !194, file: !66, line: 381, type: !71)
!200 = !DILocation(line: 381, column: 14, scope: !194)
!201 = !DILocalVariable(name: "argv", arg: 2, scope: !194, file: !66, line: 381, type: !197)
!202 = !DILocation(line: 381, column: 27, scope: !194)
!203 = !DILocation(line: 384, column: 22, scope: !194)
!204 = !DILocation(line: 384, column: 12, scope: !194)
!205 = !DILocation(line: 384, column: 5, scope: !194)
!206 = !DILocation(line: 386, column: 5, scope: !194)
!207 = !DILocation(line: 387, column: 5, scope: !194)
!208 = !DILocation(line: 388, column: 5, scope: !194)
!209 = !DILocation(line: 391, column: 5, scope: !194)
!210 = !DILocation(line: 392, column: 5, scope: !194)
!211 = !DILocation(line: 393, column: 5, scope: !194)
!212 = !DILocation(line: 395, column: 5, scope: !194)
!213 = distinct !DISubprogram(name: "goodB2G1", scope: !66, file: !66, line: 131, type: !67, scopeLine: 132, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!214 = !DILocalVariable(name: "data", scope: !213, file: !66, line: 133, type: !71)
!215 = !DILocation(line: 133, column: 9, scope: !213)
!216 = !DILocation(line: 135, column: 10, scope: !213)
!217 = !DILocation(line: 136, column: 8, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !66, line: 136, column: 8)
!219 = !DILocation(line: 136, column: 8, scope: !213)
!220 = !DILocalVariable(name: "recvResult", scope: !221, file: !66, line: 143, type: !71)
!221 = distinct !DILexicalBlock(scope: !222, file: !66, line: 138, column: 9)
!222 = distinct !DILexicalBlock(scope: !218, file: !66, line: 137, column: 5)
!223 = !DILocation(line: 143, column: 17, scope: !221)
!224 = !DILocalVariable(name: "service", scope: !221, file: !66, line: 144, type: !82)
!225 = !DILocation(line: 144, column: 32, scope: !221)
!226 = !DILocalVariable(name: "connectSocket", scope: !221, file: !66, line: 145, type: !71)
!227 = !DILocation(line: 145, column: 20, scope: !221)
!228 = !DILocalVariable(name: "inputBuffer", scope: !221, file: !66, line: 146, type: !55)
!229 = !DILocation(line: 146, column: 18, scope: !221)
!230 = !DILocation(line: 147, column: 13, scope: !221)
!231 = !DILocation(line: 157, column: 33, scope: !232)
!232 = distinct !DILexicalBlock(scope: !221, file: !66, line: 148, column: 13)
!233 = !DILocation(line: 157, column: 31, scope: !232)
!234 = !DILocation(line: 158, column: 21, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !66, line: 158, column: 21)
!236 = !DILocation(line: 158, column: 35, scope: !235)
!237 = !DILocation(line: 158, column: 21, scope: !232)
!238 = !DILocation(line: 160, column: 21, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !66, line: 159, column: 17)
!240 = !DILocation(line: 162, column: 17, scope: !232)
!241 = !DILocation(line: 163, column: 25, scope: !232)
!242 = !DILocation(line: 163, column: 36, scope: !232)
!243 = !DILocation(line: 164, column: 43, scope: !232)
!244 = !DILocation(line: 164, column: 25, scope: !232)
!245 = !DILocation(line: 164, column: 34, scope: !232)
!246 = !DILocation(line: 164, column: 41, scope: !232)
!247 = !DILocation(line: 165, column: 36, scope: !232)
!248 = !DILocation(line: 165, column: 25, scope: !232)
!249 = !DILocation(line: 165, column: 34, scope: !232)
!250 = !DILocation(line: 166, column: 29, scope: !251)
!251 = distinct !DILexicalBlock(scope: !232, file: !66, line: 166, column: 21)
!252 = !DILocation(line: 166, column: 44, scope: !251)
!253 = !DILocation(line: 166, column: 21, scope: !251)
!254 = !DILocation(line: 166, column: 89, scope: !251)
!255 = !DILocation(line: 166, column: 21, scope: !232)
!256 = !DILocation(line: 168, column: 21, scope: !257)
!257 = distinct !DILexicalBlock(scope: !251, file: !66, line: 167, column: 17)
!258 = !DILocation(line: 172, column: 35, scope: !232)
!259 = !DILocation(line: 172, column: 50, scope: !232)
!260 = !DILocation(line: 172, column: 30, scope: !232)
!261 = !DILocation(line: 172, column: 28, scope: !232)
!262 = !DILocation(line: 173, column: 21, scope: !263)
!263 = distinct !DILexicalBlock(scope: !232, file: !66, line: 173, column: 21)
!264 = !DILocation(line: 173, column: 32, scope: !263)
!265 = !DILocation(line: 173, column: 48, scope: !263)
!266 = !DILocation(line: 173, column: 51, scope: !263)
!267 = !DILocation(line: 173, column: 62, scope: !263)
!268 = !DILocation(line: 173, column: 21, scope: !232)
!269 = !DILocation(line: 175, column: 21, scope: !270)
!270 = distinct !DILexicalBlock(scope: !263, file: !66, line: 174, column: 17)
!271 = !DILocation(line: 178, column: 29, scope: !232)
!272 = !DILocation(line: 178, column: 17, scope: !232)
!273 = !DILocation(line: 178, column: 41, scope: !232)
!274 = !DILocation(line: 180, column: 29, scope: !232)
!275 = !DILocation(line: 180, column: 24, scope: !232)
!276 = !DILocation(line: 180, column: 22, scope: !232)
!277 = !DILocation(line: 181, column: 13, scope: !232)
!278 = !DILocation(line: 183, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !221, file: !66, line: 183, column: 17)
!280 = !DILocation(line: 183, column: 31, scope: !279)
!281 = !DILocation(line: 183, column: 17, scope: !221)
!282 = !DILocation(line: 185, column: 30, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !66, line: 184, column: 13)
!284 = !DILocation(line: 185, column: 17, scope: !283)
!285 = !DILocation(line: 186, column: 13, scope: !283)
!286 = !DILocation(line: 194, column: 5, scope: !222)
!287 = !DILocation(line: 195, column: 8, scope: !288)
!288 = distinct !DILexicalBlock(scope: !213, file: !66, line: 195, column: 8)
!289 = !DILocation(line: 195, column: 8, scope: !213)
!290 = !DILocation(line: 198, column: 9, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !66, line: 196, column: 5)
!292 = !DILocation(line: 199, column: 5, scope: !291)
!293 = !DILocalVariable(name: "buffer", scope: !294, file: !66, line: 203, type: !171)
!294 = distinct !DILexicalBlock(scope: !295, file: !66, line: 202, column: 9)
!295 = distinct !DILexicalBlock(scope: !288, file: !66, line: 201, column: 5)
!296 = !DILocation(line: 203, column: 17, scope: !294)
!297 = !DILocation(line: 205, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !66, line: 205, column: 17)
!299 = !DILocation(line: 205, column: 22, scope: !298)
!300 = !DILocation(line: 205, column: 27, scope: !298)
!301 = !DILocation(line: 205, column: 30, scope: !298)
!302 = !DILocation(line: 205, column: 35, scope: !298)
!303 = !DILocation(line: 205, column: 17, scope: !294)
!304 = !DILocation(line: 207, column: 37, scope: !305)
!305 = distinct !DILexicalBlock(scope: !298, file: !66, line: 206, column: 13)
!306 = !DILocation(line: 207, column: 30, scope: !305)
!307 = !DILocation(line: 207, column: 17, scope: !305)
!308 = !DILocation(line: 208, column: 13, scope: !305)
!309 = !DILocation(line: 211, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !298, file: !66, line: 210, column: 13)
!311 = !DILocation(line: 215, column: 1, scope: !213)
!312 = distinct !DISubprogram(name: "goodB2G2", scope: !66, file: !66, line: 218, type: !67, scopeLine: 219, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!313 = !DILocalVariable(name: "data", scope: !312, file: !66, line: 220, type: !71)
!314 = !DILocation(line: 220, column: 9, scope: !312)
!315 = !DILocation(line: 222, column: 10, scope: !312)
!316 = !DILocation(line: 223, column: 8, scope: !317)
!317 = distinct !DILexicalBlock(scope: !312, file: !66, line: 223, column: 8)
!318 = !DILocation(line: 223, column: 8, scope: !312)
!319 = !DILocalVariable(name: "recvResult", scope: !320, file: !66, line: 230, type: !71)
!320 = distinct !DILexicalBlock(scope: !321, file: !66, line: 225, column: 9)
!321 = distinct !DILexicalBlock(scope: !317, file: !66, line: 224, column: 5)
!322 = !DILocation(line: 230, column: 17, scope: !320)
!323 = !DILocalVariable(name: "service", scope: !320, file: !66, line: 231, type: !82)
!324 = !DILocation(line: 231, column: 32, scope: !320)
!325 = !DILocalVariable(name: "connectSocket", scope: !320, file: !66, line: 232, type: !71)
!326 = !DILocation(line: 232, column: 20, scope: !320)
!327 = !DILocalVariable(name: "inputBuffer", scope: !320, file: !66, line: 233, type: !55)
!328 = !DILocation(line: 233, column: 18, scope: !320)
!329 = !DILocation(line: 234, column: 13, scope: !320)
!330 = !DILocation(line: 244, column: 33, scope: !331)
!331 = distinct !DILexicalBlock(scope: !320, file: !66, line: 235, column: 13)
!332 = !DILocation(line: 244, column: 31, scope: !331)
!333 = !DILocation(line: 245, column: 21, scope: !334)
!334 = distinct !DILexicalBlock(scope: !331, file: !66, line: 245, column: 21)
!335 = !DILocation(line: 245, column: 35, scope: !334)
!336 = !DILocation(line: 245, column: 21, scope: !331)
!337 = !DILocation(line: 247, column: 21, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !66, line: 246, column: 17)
!339 = !DILocation(line: 249, column: 17, scope: !331)
!340 = !DILocation(line: 250, column: 25, scope: !331)
!341 = !DILocation(line: 250, column: 36, scope: !331)
!342 = !DILocation(line: 251, column: 43, scope: !331)
!343 = !DILocation(line: 251, column: 25, scope: !331)
!344 = !DILocation(line: 251, column: 34, scope: !331)
!345 = !DILocation(line: 251, column: 41, scope: !331)
!346 = !DILocation(line: 252, column: 36, scope: !331)
!347 = !DILocation(line: 252, column: 25, scope: !331)
!348 = !DILocation(line: 252, column: 34, scope: !331)
!349 = !DILocation(line: 253, column: 29, scope: !350)
!350 = distinct !DILexicalBlock(scope: !331, file: !66, line: 253, column: 21)
!351 = !DILocation(line: 253, column: 44, scope: !350)
!352 = !DILocation(line: 253, column: 21, scope: !350)
!353 = !DILocation(line: 253, column: 89, scope: !350)
!354 = !DILocation(line: 253, column: 21, scope: !331)
!355 = !DILocation(line: 255, column: 21, scope: !356)
!356 = distinct !DILexicalBlock(scope: !350, file: !66, line: 254, column: 17)
!357 = !DILocation(line: 259, column: 35, scope: !331)
!358 = !DILocation(line: 259, column: 50, scope: !331)
!359 = !DILocation(line: 259, column: 30, scope: !331)
!360 = !DILocation(line: 259, column: 28, scope: !331)
!361 = !DILocation(line: 260, column: 21, scope: !362)
!362 = distinct !DILexicalBlock(scope: !331, file: !66, line: 260, column: 21)
!363 = !DILocation(line: 260, column: 32, scope: !362)
!364 = !DILocation(line: 260, column: 48, scope: !362)
!365 = !DILocation(line: 260, column: 51, scope: !362)
!366 = !DILocation(line: 260, column: 62, scope: !362)
!367 = !DILocation(line: 260, column: 21, scope: !331)
!368 = !DILocation(line: 262, column: 21, scope: !369)
!369 = distinct !DILexicalBlock(scope: !362, file: !66, line: 261, column: 17)
!370 = !DILocation(line: 265, column: 29, scope: !331)
!371 = !DILocation(line: 265, column: 17, scope: !331)
!372 = !DILocation(line: 265, column: 41, scope: !331)
!373 = !DILocation(line: 267, column: 29, scope: !331)
!374 = !DILocation(line: 267, column: 24, scope: !331)
!375 = !DILocation(line: 267, column: 22, scope: !331)
!376 = !DILocation(line: 268, column: 13, scope: !331)
!377 = !DILocation(line: 270, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !320, file: !66, line: 270, column: 17)
!379 = !DILocation(line: 270, column: 31, scope: !378)
!380 = !DILocation(line: 270, column: 17, scope: !320)
!381 = !DILocation(line: 272, column: 30, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !66, line: 271, column: 13)
!383 = !DILocation(line: 272, column: 17, scope: !382)
!384 = !DILocation(line: 273, column: 13, scope: !382)
!385 = !DILocation(line: 281, column: 5, scope: !321)
!386 = !DILocation(line: 282, column: 8, scope: !387)
!387 = distinct !DILexicalBlock(scope: !312, file: !66, line: 282, column: 8)
!388 = !DILocation(line: 282, column: 8, scope: !312)
!389 = !DILocalVariable(name: "buffer", scope: !390, file: !66, line: 285, type: !171)
!390 = distinct !DILexicalBlock(scope: !391, file: !66, line: 284, column: 9)
!391 = distinct !DILexicalBlock(scope: !387, file: !66, line: 283, column: 5)
!392 = !DILocation(line: 285, column: 17, scope: !390)
!393 = !DILocation(line: 287, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !66, line: 287, column: 17)
!395 = !DILocation(line: 287, column: 22, scope: !394)
!396 = !DILocation(line: 287, column: 27, scope: !394)
!397 = !DILocation(line: 287, column: 30, scope: !394)
!398 = !DILocation(line: 287, column: 35, scope: !394)
!399 = !DILocation(line: 287, column: 17, scope: !390)
!400 = !DILocation(line: 289, column: 37, scope: !401)
!401 = distinct !DILexicalBlock(scope: !394, file: !66, line: 288, column: 13)
!402 = !DILocation(line: 289, column: 30, scope: !401)
!403 = !DILocation(line: 289, column: 17, scope: !401)
!404 = !DILocation(line: 290, column: 13, scope: !401)
!405 = !DILocation(line: 293, column: 17, scope: !406)
!406 = distinct !DILexicalBlock(scope: !394, file: !66, line: 292, column: 13)
!407 = !DILocation(line: 296, column: 5, scope: !391)
!408 = !DILocation(line: 297, column: 1, scope: !312)
!409 = distinct !DISubprogram(name: "goodG2B1", scope: !66, file: !66, line: 300, type: !67, scopeLine: 301, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!410 = !DILocalVariable(name: "data", scope: !409, file: !66, line: 302, type: !71)
!411 = !DILocation(line: 302, column: 9, scope: !409)
!412 = !DILocation(line: 304, column: 10, scope: !409)
!413 = !DILocation(line: 305, column: 8, scope: !414)
!414 = distinct !DILexicalBlock(scope: !409, file: !66, line: 305, column: 8)
!415 = !DILocation(line: 305, column: 8, scope: !409)
!416 = !DILocation(line: 308, column: 9, scope: !417)
!417 = distinct !DILexicalBlock(scope: !414, file: !66, line: 306, column: 5)
!418 = !DILocation(line: 309, column: 5, scope: !417)
!419 = !DILocation(line: 314, column: 14, scope: !420)
!420 = distinct !DILexicalBlock(scope: !414, file: !66, line: 311, column: 5)
!421 = !DILocation(line: 316, column: 8, scope: !422)
!422 = distinct !DILexicalBlock(scope: !409, file: !66, line: 316, column: 8)
!423 = !DILocation(line: 316, column: 8, scope: !409)
!424 = !DILocalVariable(name: "buffer", scope: !425, file: !66, line: 319, type: !171)
!425 = distinct !DILexicalBlock(scope: !426, file: !66, line: 318, column: 9)
!426 = distinct !DILexicalBlock(scope: !422, file: !66, line: 317, column: 5)
!427 = !DILocation(line: 319, column: 17, scope: !425)
!428 = !DILocation(line: 322, column: 17, scope: !429)
!429 = distinct !DILexicalBlock(scope: !425, file: !66, line: 322, column: 17)
!430 = !DILocation(line: 322, column: 22, scope: !429)
!431 = !DILocation(line: 322, column: 17, scope: !425)
!432 = !DILocation(line: 324, column: 37, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !66, line: 323, column: 13)
!434 = !DILocation(line: 324, column: 30, scope: !433)
!435 = !DILocation(line: 324, column: 17, scope: !433)
!436 = !DILocation(line: 325, column: 13, scope: !433)
!437 = !DILocation(line: 328, column: 17, scope: !438)
!438 = distinct !DILexicalBlock(scope: !429, file: !66, line: 327, column: 13)
!439 = !DILocation(line: 331, column: 5, scope: !426)
!440 = !DILocation(line: 332, column: 1, scope: !409)
!441 = distinct !DISubprogram(name: "goodG2B2", scope: !66, file: !66, line: 335, type: !67, scopeLine: 336, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!442 = !DILocalVariable(name: "data", scope: !441, file: !66, line: 337, type: !71)
!443 = !DILocation(line: 337, column: 9, scope: !441)
!444 = !DILocation(line: 339, column: 10, scope: !441)
!445 = !DILocation(line: 340, column: 8, scope: !446)
!446 = distinct !DILexicalBlock(scope: !441, file: !66, line: 340, column: 8)
!447 = !DILocation(line: 340, column: 8, scope: !441)
!448 = !DILocation(line: 344, column: 14, scope: !449)
!449 = distinct !DILexicalBlock(scope: !446, file: !66, line: 341, column: 5)
!450 = !DILocation(line: 345, column: 5, scope: !449)
!451 = !DILocation(line: 346, column: 8, scope: !452)
!452 = distinct !DILexicalBlock(scope: !441, file: !66, line: 346, column: 8)
!453 = !DILocation(line: 346, column: 8, scope: !441)
!454 = !DILocalVariable(name: "buffer", scope: !455, file: !66, line: 349, type: !171)
!455 = distinct !DILexicalBlock(scope: !456, file: !66, line: 348, column: 9)
!456 = distinct !DILexicalBlock(scope: !452, file: !66, line: 347, column: 5)
!457 = !DILocation(line: 349, column: 17, scope: !455)
!458 = !DILocation(line: 352, column: 17, scope: !459)
!459 = distinct !DILexicalBlock(scope: !455, file: !66, line: 352, column: 17)
!460 = !DILocation(line: 352, column: 22, scope: !459)
!461 = !DILocation(line: 352, column: 17, scope: !455)
!462 = !DILocation(line: 354, column: 37, scope: !463)
!463 = distinct !DILexicalBlock(scope: !459, file: !66, line: 353, column: 13)
!464 = !DILocation(line: 354, column: 30, scope: !463)
!465 = !DILocation(line: 354, column: 17, scope: !463)
!466 = !DILocation(line: 355, column: 13, scope: !463)
!467 = !DILocation(line: 358, column: 17, scope: !468)
!468 = distinct !DILexicalBlock(scope: !459, file: !66, line: 357, column: 13)
!469 = !DILocation(line: 361, column: 5, scope: !456)
!470 = !DILocation(line: 362, column: 1, scope: !441)
