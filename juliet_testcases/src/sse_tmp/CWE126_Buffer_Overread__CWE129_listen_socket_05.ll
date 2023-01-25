; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !67
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_05_bad() #0 !dbg !77 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !81, metadata !DIExpression()), !dbg !82
  store i32 -1, i32* %data, align 4, !dbg !83
  %0 = load i32, i32* @staticTrue, align 4, !dbg !84
  %tobool = icmp ne i32 %0, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.end34, !dbg !86

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !87, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !91, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %listenSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %acceptSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  br label %do.body, !dbg !115

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !116
  store i32 %call, i32* %listenSocket, align 4, !dbg !118
  %1 = load i32, i32* %listenSocket, align 4, !dbg !119
  %cmp = icmp eq i32 %1, -1, !dbg !121
  br i1 %cmp, label %if.then1, label %if.end, !dbg !122

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !123

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !125
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !126
  store i16 2, i16* %sin_family, align 4, !dbg !127
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !128
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !129
  store i32 0, i32* %s_addr, align 4, !dbg !130
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !131
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !132
  store i16 %call2, i16* %sin_port, align 2, !dbg !133
  %3 = load i32, i32* %listenSocket, align 4, !dbg !134
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !136
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !137
  %cmp4 = icmp eq i32 %call3, -1, !dbg !138
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !139

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !140

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !142
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !144
  %cmp8 = icmp eq i32 %call7, -1, !dbg !145
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !146

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !147

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !149
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !150
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !151
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !152
  %cmp12 = icmp eq i32 %7, -1, !dbg !154
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !155

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !156

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !158
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !160
  %conv = trunc i64 %call15 to i32, !dbg !160
  store i32 %conv, i32* %recvResult, align 4, !dbg !161
  %9 = load i32, i32* %recvResult, align 4, !dbg !162
  %cmp16 = icmp eq i32 %9, -1, !dbg !164
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !165

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !166
  %cmp18 = icmp eq i32 %10, 0, !dbg !167
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !168

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !169

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !171
  %idxprom = sext i32 %11 to i64, !dbg !172
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !172
  store i8 0, i8* %arrayidx, align 1, !dbg !173
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !174
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !175
  store i32 %call23, i32* %data, align 4, !dbg !176
  br label %do.end, !dbg !177

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !178
  %cmp24 = icmp ne i32 %12, -1, !dbg !180
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !181

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !182
  %call27 = call i32 @close(i32 %13), !dbg !184
  br label %if.end28, !dbg !185

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !186
  %cmp29 = icmp ne i32 %14, -1, !dbg !188
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !189

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !190
  %call32 = call i32 @close(i32 %15), !dbg !192
  br label %if.end33, !dbg !193

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !194

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticTrue, align 4, !dbg !195
  %tobool35 = icmp ne i32 %16, 0, !dbg !195
  br i1 %tobool35, label %if.then36, label %if.end43, !dbg !197

if.then36:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !198, metadata !DIExpression()), !dbg !204
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !204
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !204
  %18 = load i32, i32* %data, align 4, !dbg !205
  %cmp37 = icmp sge i32 %18, 0, !dbg !207
  br i1 %cmp37, label %if.then39, label %if.else, !dbg !208

if.then39:                                        ; preds = %if.then36
  %19 = load i32, i32* %data, align 4, !dbg !209
  %idxprom40 = sext i32 %19 to i64, !dbg !211
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom40, !dbg !211
  %20 = load i32, i32* %arrayidx41, align 4, !dbg !211
  call void @printIntLine(i32 %20), !dbg !212
  br label %if.end42, !dbg !213

if.else:                                          ; preds = %if.then36
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !214
  br label %if.end42

if.end42:                                         ; preds = %if.else, %if.then39
  br label %if.end43, !dbg !216

if.end43:                                         ; preds = %if.end42, %if.end34
  ret void, !dbg !217
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #2

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #2

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_05_good() #0 !dbg !218 {
entry:
  call void @goodB2G1(), !dbg !219
  call void @goodB2G2(), !dbg !220
  call void @goodG2B1(), !dbg !221
  call void @goodG2B2(), !dbg !222
  ret void, !dbg !223
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !224 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !229, metadata !DIExpression()), !dbg !230
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !231, metadata !DIExpression()), !dbg !232
  %call = call i64 @time(i64* null) #7, !dbg !233
  %conv = trunc i64 %call to i32, !dbg !234
  call void @srand(i32 %conv) #7, !dbg !235
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !236
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_05_good(), !dbg !237
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !238
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !239
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_05_bad(), !dbg !240
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !241
  ret i32 0, !dbg !242
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !243 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !244, metadata !DIExpression()), !dbg !245
  store i32 -1, i32* %data, align 4, !dbg !246
  %0 = load i32, i32* @staticTrue, align 4, !dbg !247
  %tobool = icmp ne i32 %0, 0, !dbg !247
  br i1 %tobool, label %if.then, label %if.end34, !dbg !249

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !250, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !254, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !256, metadata !DIExpression()), !dbg !257
  store i32 -1, i32* %listenSocket, align 4, !dbg !257
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !258, metadata !DIExpression()), !dbg !259
  store i32 -1, i32* %acceptSocket, align 4, !dbg !259
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !260, metadata !DIExpression()), !dbg !261
  br label %do.body, !dbg !262

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !263
  store i32 %call, i32* %listenSocket, align 4, !dbg !265
  %1 = load i32, i32* %listenSocket, align 4, !dbg !266
  %cmp = icmp eq i32 %1, -1, !dbg !268
  br i1 %cmp, label %if.then1, label %if.end, !dbg !269

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !270

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !272
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !272
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !273
  store i16 2, i16* %sin_family, align 4, !dbg !274
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !275
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !276
  store i32 0, i32* %s_addr, align 4, !dbg !277
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !278
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !279
  store i16 %call2, i16* %sin_port, align 2, !dbg !280
  %3 = load i32, i32* %listenSocket, align 4, !dbg !281
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !283
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !284
  %cmp4 = icmp eq i32 %call3, -1, !dbg !285
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !286

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !287

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !289
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !291
  %cmp8 = icmp eq i32 %call7, -1, !dbg !292
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !293

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !294

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !296
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !297
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !298
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !299
  %cmp12 = icmp eq i32 %7, -1, !dbg !301
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !302

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !303

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !305
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !306
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !307
  %conv = trunc i64 %call15 to i32, !dbg !307
  store i32 %conv, i32* %recvResult, align 4, !dbg !308
  %9 = load i32, i32* %recvResult, align 4, !dbg !309
  %cmp16 = icmp eq i32 %9, -1, !dbg !311
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !312

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !313
  %cmp18 = icmp eq i32 %10, 0, !dbg !314
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !315

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !316

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !318
  %idxprom = sext i32 %11 to i64, !dbg !319
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !319
  store i8 0, i8* %arrayidx, align 1, !dbg !320
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !321
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !322
  store i32 %call23, i32* %data, align 4, !dbg !323
  br label %do.end, !dbg !324

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !325
  %cmp24 = icmp ne i32 %12, -1, !dbg !327
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !328

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !329
  %call27 = call i32 @close(i32 %13), !dbg !331
  br label %if.end28, !dbg !332

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !333
  %cmp29 = icmp ne i32 %14, -1, !dbg !335
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !336

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !337
  %call32 = call i32 @close(i32 %15), !dbg !339
  br label %if.end33, !dbg !340

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !341

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticFalse, align 4, !dbg !342
  %tobool35 = icmp ne i32 %16, 0, !dbg !342
  br i1 %tobool35, label %if.then36, label %if.else, !dbg !344

if.then36:                                        ; preds = %if.end34
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !345
  br label %if.end46, !dbg !347

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !348, metadata !DIExpression()), !dbg !351
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !351
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !351
  %18 = load i32, i32* %data, align 4, !dbg !352
  %cmp37 = icmp sge i32 %18, 0, !dbg !354
  br i1 %cmp37, label %land.lhs.true, label %if.else44, !dbg !355

land.lhs.true:                                    ; preds = %if.else
  %19 = load i32, i32* %data, align 4, !dbg !356
  %cmp39 = icmp slt i32 %19, 10, !dbg !357
  br i1 %cmp39, label %if.then41, label %if.else44, !dbg !358

if.then41:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !359
  %idxprom42 = sext i32 %20 to i64, !dbg !361
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !361
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !361
  call void @printIntLine(i32 %21), !dbg !362
  br label %if.end45, !dbg !363

if.else44:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !364
  br label %if.end45

if.end45:                                         ; preds = %if.else44, %if.then41
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then36
  ret void, !dbg !366
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !367 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !368, metadata !DIExpression()), !dbg !369
  store i32 -1, i32* %data, align 4, !dbg !370
  %0 = load i32, i32* @staticTrue, align 4, !dbg !371
  %tobool = icmp ne i32 %0, 0, !dbg !371
  br i1 %tobool, label %if.then, label %if.end34, !dbg !373

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !374, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !378, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !380, metadata !DIExpression()), !dbg !381
  store i32 -1, i32* %listenSocket, align 4, !dbg !381
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !382, metadata !DIExpression()), !dbg !383
  store i32 -1, i32* %acceptSocket, align 4, !dbg !383
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !384, metadata !DIExpression()), !dbg !385
  br label %do.body, !dbg !386

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !387
  store i32 %call, i32* %listenSocket, align 4, !dbg !389
  %1 = load i32, i32* %listenSocket, align 4, !dbg !390
  %cmp = icmp eq i32 %1, -1, !dbg !392
  br i1 %cmp, label %if.then1, label %if.end, !dbg !393

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !394

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !396
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !396
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !397
  store i16 2, i16* %sin_family, align 4, !dbg !398
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !399
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !400
  store i32 0, i32* %s_addr, align 4, !dbg !401
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !402
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !403
  store i16 %call2, i16* %sin_port, align 2, !dbg !404
  %3 = load i32, i32* %listenSocket, align 4, !dbg !405
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !407
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !408
  %cmp4 = icmp eq i32 %call3, -1, !dbg !409
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !410

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !411

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !413
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !415
  %cmp8 = icmp eq i32 %call7, -1, !dbg !416
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !417

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !418

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !420
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !421
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !422
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !423
  %cmp12 = icmp eq i32 %7, -1, !dbg !425
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !426

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !427

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !429
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !430
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !431
  %conv = trunc i64 %call15 to i32, !dbg !431
  store i32 %conv, i32* %recvResult, align 4, !dbg !432
  %9 = load i32, i32* %recvResult, align 4, !dbg !433
  %cmp16 = icmp eq i32 %9, -1, !dbg !435
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !436

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !437
  %cmp18 = icmp eq i32 %10, 0, !dbg !438
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !439

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !440

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !442
  %idxprom = sext i32 %11 to i64, !dbg !443
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !443
  store i8 0, i8* %arrayidx, align 1, !dbg !444
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !445
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !446
  store i32 %call23, i32* %data, align 4, !dbg !447
  br label %do.end, !dbg !448

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !449
  %cmp24 = icmp ne i32 %12, -1, !dbg !451
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !452

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !453
  %call27 = call i32 @close(i32 %13), !dbg !455
  br label %if.end28, !dbg !456

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !457
  %cmp29 = icmp ne i32 %14, -1, !dbg !459
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !460

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !461
  %call32 = call i32 @close(i32 %15), !dbg !463
  br label %if.end33, !dbg !464

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !465

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticTrue, align 4, !dbg !466
  %tobool35 = icmp ne i32 %16, 0, !dbg !466
  br i1 %tobool35, label %if.then36, label %if.end45, !dbg !468

if.then36:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !469, metadata !DIExpression()), !dbg !472
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !472
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !472
  %18 = load i32, i32* %data, align 4, !dbg !473
  %cmp37 = icmp sge i32 %18, 0, !dbg !475
  br i1 %cmp37, label %land.lhs.true, label %if.else, !dbg !476

land.lhs.true:                                    ; preds = %if.then36
  %19 = load i32, i32* %data, align 4, !dbg !477
  %cmp39 = icmp slt i32 %19, 10, !dbg !478
  br i1 %cmp39, label %if.then41, label %if.else, !dbg !479

if.then41:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !480
  %idxprom42 = sext i32 %20 to i64, !dbg !482
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !482
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !482
  call void @printIntLine(i32 %21), !dbg !483
  br label %if.end44, !dbg !484

if.else:                                          ; preds = %land.lhs.true, %if.then36
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !485
  br label %if.end44

if.end44:                                         ; preds = %if.else, %if.then41
  br label %if.end45, !dbg !487

if.end45:                                         ; preds = %if.end44, %if.end34
  ret void, !dbg !488
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !489 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !490, metadata !DIExpression()), !dbg !491
  store i32 -1, i32* %data, align 4, !dbg !492
  %0 = load i32, i32* @staticFalse, align 4, !dbg !493
  %tobool = icmp ne i32 %0, 0, !dbg !493
  br i1 %tobool, label %if.then, label %if.else, !dbg !495

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !496
  br label %if.end, !dbg !498

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !499
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !501
  %tobool1 = icmp ne i32 %1, 0, !dbg !501
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !503

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !504, metadata !DIExpression()), !dbg !507
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !507
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !507
  %3 = load i32, i32* %data, align 4, !dbg !508
  %cmp = icmp sge i32 %3, 0, !dbg !510
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !511

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !512
  %idxprom = sext i32 %4 to i64, !dbg !514
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !514
  %5 = load i32, i32* %arrayidx, align 4, !dbg !514
  call void @printIntLine(i32 %5), !dbg !515
  br label %if.end5, !dbg !516

if.else4:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !517
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6, !dbg !519

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !520
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !521 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !522, metadata !DIExpression()), !dbg !523
  store i32 -1, i32* %data, align 4, !dbg !524
  %0 = load i32, i32* @staticTrue, align 4, !dbg !525
  %tobool = icmp ne i32 %0, 0, !dbg !525
  br i1 %tobool, label %if.then, label %if.end, !dbg !527

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !528
  br label %if.end, !dbg !530

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !531
  %tobool1 = icmp ne i32 %1, 0, !dbg !531
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !533

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !534, metadata !DIExpression()), !dbg !537
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !537
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !537
  %3 = load i32, i32* %data, align 4, !dbg !538
  %cmp = icmp sge i32 %3, 0, !dbg !540
  br i1 %cmp, label %if.then3, label %if.else, !dbg !541

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !542
  %idxprom = sext i32 %4 to i64, !dbg !544
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !544
  %5 = load i32, i32* %arrayidx, align 4, !dbg !544
  call void @printIntLine(i32 %5), !dbg !545
  br label %if.end4, !dbg !546

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !547
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !549

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !550
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
!llvm.module.flags = !{!71, !72, !73, !74, !75}
!llvm.ident = !{!76}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !69, line: 45, type: !70, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !66, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_05.c", directory: "/home/joelyang/SSE-Assessment")
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
!47 = !{!48, !53, !7}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !50, line: 26, baseType: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !52, line: 42, baseType: !7)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !55, line: 178, size: 128, elements: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!56 = !{!57, !61}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !54, file: !55, line: 180, baseType: !58, size: 16)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !59, line: 28, baseType: !60)
!59 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!60 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !54, file: !55, line: 181, baseType: !62, size: 112, offset: 16)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 112, elements: !64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !{!65}
!65 = !DISubrange(count: 14)
!66 = !{!0, !67}
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !69, line: 46, type: !70, isLocal: true, isDefinition: true)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_05.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !{i32 7, !"Dwarf Version", i32 4}
!72 = !{i32 2, !"Debug Info Version", i32 3}
!73 = !{i32 1, !"wchar_size", i32 4}
!74 = !{i32 7, !"uwtable", i32 1}
!75 = !{i32 7, !"frame-pointer", i32 2}
!76 = !{!"clang version 13.0.0"}
!77 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_05_bad", scope: !69, file: !69, line: 50, type: !78, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !80)
!78 = !DISubroutineType(types: !79)
!79 = !{null}
!80 = !{}
!81 = !DILocalVariable(name: "data", scope: !77, file: !69, line: 52, type: !70)
!82 = !DILocation(line: 52, column: 9, scope: !77)
!83 = !DILocation(line: 54, column: 10, scope: !77)
!84 = !DILocation(line: 55, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !69, line: 55, column: 8)
!86 = !DILocation(line: 55, column: 8, scope: !77)
!87 = !DILocalVariable(name: "recvResult", scope: !88, file: !69, line: 62, type: !70)
!88 = distinct !DILexicalBlock(scope: !89, file: !69, line: 57, column: 9)
!89 = distinct !DILexicalBlock(scope: !85, file: !69, line: 56, column: 5)
!90 = !DILocation(line: 62, column: 17, scope: !88)
!91 = !DILocalVariable(name: "service", scope: !88, file: !69, line: 63, type: !92)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !93)
!93 = !{!94, !95, !99, !103}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !92, file: !19, line: 240, baseType: !58, size: 16)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !92, file: !19, line: 241, baseType: !96, size: 16, offset: 16)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 40, baseType: !60)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !92, file: !19, line: 242, baseType: !100, size: 32, offset: 32)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !101)
!101 = !{!102}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !100, file: !19, line: 33, baseType: !48, size: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !92, file: !19, line: 245, baseType: !104, size: 64, offset: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 64, elements: !106)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 63, column: 32, scope: !88)
!109 = !DILocalVariable(name: "listenSocket", scope: !88, file: !69, line: 64, type: !70)
!110 = !DILocation(line: 64, column: 20, scope: !88)
!111 = !DILocalVariable(name: "acceptSocket", scope: !88, file: !69, line: 65, type: !70)
!112 = !DILocation(line: 65, column: 20, scope: !88)
!113 = !DILocalVariable(name: "inputBuffer", scope: !88, file: !69, line: 66, type: !62)
!114 = !DILocation(line: 66, column: 18, scope: !88)
!115 = !DILocation(line: 67, column: 13, scope: !88)
!116 = !DILocation(line: 77, column: 32, scope: !117)
!117 = distinct !DILexicalBlock(scope: !88, file: !69, line: 68, column: 13)
!118 = !DILocation(line: 77, column: 30, scope: !117)
!119 = !DILocation(line: 78, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !69, line: 78, column: 21)
!121 = !DILocation(line: 78, column: 34, scope: !120)
!122 = !DILocation(line: 78, column: 21, scope: !117)
!123 = !DILocation(line: 80, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !69, line: 79, column: 17)
!125 = !DILocation(line: 82, column: 17, scope: !117)
!126 = !DILocation(line: 83, column: 25, scope: !117)
!127 = !DILocation(line: 83, column: 36, scope: !117)
!128 = !DILocation(line: 84, column: 25, scope: !117)
!129 = !DILocation(line: 84, column: 34, scope: !117)
!130 = !DILocation(line: 84, column: 41, scope: !117)
!131 = !DILocation(line: 85, column: 36, scope: !117)
!132 = !DILocation(line: 85, column: 25, scope: !117)
!133 = !DILocation(line: 85, column: 34, scope: !117)
!134 = !DILocation(line: 86, column: 26, scope: !135)
!135 = distinct !DILexicalBlock(scope: !117, file: !69, line: 86, column: 21)
!136 = !DILocation(line: 86, column: 40, scope: !135)
!137 = !DILocation(line: 86, column: 21, scope: !135)
!138 = !DILocation(line: 86, column: 85, scope: !135)
!139 = !DILocation(line: 86, column: 21, scope: !117)
!140 = !DILocation(line: 88, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !69, line: 87, column: 17)
!142 = !DILocation(line: 90, column: 28, scope: !143)
!143 = distinct !DILexicalBlock(scope: !117, file: !69, line: 90, column: 21)
!144 = !DILocation(line: 90, column: 21, scope: !143)
!145 = !DILocation(line: 90, column: 58, scope: !143)
!146 = !DILocation(line: 90, column: 21, scope: !117)
!147 = !DILocation(line: 92, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !69, line: 91, column: 17)
!149 = !DILocation(line: 94, column: 39, scope: !117)
!150 = !DILocation(line: 94, column: 32, scope: !117)
!151 = !DILocation(line: 94, column: 30, scope: !117)
!152 = !DILocation(line: 95, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !117, file: !69, line: 95, column: 21)
!154 = !DILocation(line: 95, column: 34, scope: !153)
!155 = !DILocation(line: 95, column: 21, scope: !117)
!156 = !DILocation(line: 97, column: 21, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !69, line: 96, column: 17)
!158 = !DILocation(line: 100, column: 35, scope: !117)
!159 = !DILocation(line: 100, column: 49, scope: !117)
!160 = !DILocation(line: 100, column: 30, scope: !117)
!161 = !DILocation(line: 100, column: 28, scope: !117)
!162 = !DILocation(line: 101, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !117, file: !69, line: 101, column: 21)
!164 = !DILocation(line: 101, column: 32, scope: !163)
!165 = !DILocation(line: 101, column: 48, scope: !163)
!166 = !DILocation(line: 101, column: 51, scope: !163)
!167 = !DILocation(line: 101, column: 62, scope: !163)
!168 = !DILocation(line: 101, column: 21, scope: !117)
!169 = !DILocation(line: 103, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !69, line: 102, column: 17)
!171 = !DILocation(line: 106, column: 29, scope: !117)
!172 = !DILocation(line: 106, column: 17, scope: !117)
!173 = !DILocation(line: 106, column: 41, scope: !117)
!174 = !DILocation(line: 108, column: 29, scope: !117)
!175 = !DILocation(line: 108, column: 24, scope: !117)
!176 = !DILocation(line: 108, column: 22, scope: !117)
!177 = !DILocation(line: 109, column: 13, scope: !117)
!178 = !DILocation(line: 111, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !88, file: !69, line: 111, column: 17)
!180 = !DILocation(line: 111, column: 30, scope: !179)
!181 = !DILocation(line: 111, column: 17, scope: !88)
!182 = !DILocation(line: 113, column: 30, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !69, line: 112, column: 13)
!184 = !DILocation(line: 113, column: 17, scope: !183)
!185 = !DILocation(line: 114, column: 13, scope: !183)
!186 = !DILocation(line: 115, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !88, file: !69, line: 115, column: 17)
!188 = !DILocation(line: 115, column: 30, scope: !187)
!189 = !DILocation(line: 115, column: 17, scope: !88)
!190 = !DILocation(line: 117, column: 30, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !69, line: 116, column: 13)
!192 = !DILocation(line: 117, column: 17, scope: !191)
!193 = !DILocation(line: 118, column: 13, scope: !191)
!194 = !DILocation(line: 126, column: 5, scope: !89)
!195 = !DILocation(line: 127, column: 8, scope: !196)
!196 = distinct !DILexicalBlock(scope: !77, file: !69, line: 127, column: 8)
!197 = !DILocation(line: 127, column: 8, scope: !77)
!198 = !DILocalVariable(name: "buffer", scope: !199, file: !69, line: 130, type: !201)
!199 = distinct !DILexicalBlock(scope: !200, file: !69, line: 129, column: 9)
!200 = distinct !DILexicalBlock(scope: !196, file: !69, line: 128, column: 5)
!201 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 320, elements: !202)
!202 = !{!203}
!203 = !DISubrange(count: 10)
!204 = !DILocation(line: 130, column: 17, scope: !199)
!205 = !DILocation(line: 133, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !69, line: 133, column: 17)
!207 = !DILocation(line: 133, column: 22, scope: !206)
!208 = !DILocation(line: 133, column: 17, scope: !199)
!209 = !DILocation(line: 135, column: 37, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !69, line: 134, column: 13)
!211 = !DILocation(line: 135, column: 30, scope: !210)
!212 = !DILocation(line: 135, column: 17, scope: !210)
!213 = !DILocation(line: 136, column: 13, scope: !210)
!214 = !DILocation(line: 139, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !206, file: !69, line: 138, column: 13)
!216 = !DILocation(line: 142, column: 5, scope: !200)
!217 = !DILocation(line: 143, column: 1, scope: !77)
!218 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_05_good", scope: !69, file: !69, line: 409, type: !78, scopeLine: 410, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !80)
!219 = !DILocation(line: 411, column: 5, scope: !218)
!220 = !DILocation(line: 412, column: 5, scope: !218)
!221 = !DILocation(line: 413, column: 5, scope: !218)
!222 = !DILocation(line: 414, column: 5, scope: !218)
!223 = !DILocation(line: 415, column: 1, scope: !218)
!224 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 426, type: !225, scopeLine: 427, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !80)
!225 = !DISubroutineType(types: !226)
!226 = !{!70, !70, !227}
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64)
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!229 = !DILocalVariable(name: "argc", arg: 1, scope: !224, file: !69, line: 426, type: !70)
!230 = !DILocation(line: 426, column: 14, scope: !224)
!231 = !DILocalVariable(name: "argv", arg: 2, scope: !224, file: !69, line: 426, type: !227)
!232 = !DILocation(line: 426, column: 27, scope: !224)
!233 = !DILocation(line: 429, column: 22, scope: !224)
!234 = !DILocation(line: 429, column: 12, scope: !224)
!235 = !DILocation(line: 429, column: 5, scope: !224)
!236 = !DILocation(line: 431, column: 5, scope: !224)
!237 = !DILocation(line: 432, column: 5, scope: !224)
!238 = !DILocation(line: 433, column: 5, scope: !224)
!239 = !DILocation(line: 436, column: 5, scope: !224)
!240 = !DILocation(line: 437, column: 5, scope: !224)
!241 = !DILocation(line: 438, column: 5, scope: !224)
!242 = !DILocation(line: 440, column: 5, scope: !224)
!243 = distinct !DISubprogram(name: "goodB2G1", scope: !69, file: !69, line: 150, type: !78, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!244 = !DILocalVariable(name: "data", scope: !243, file: !69, line: 152, type: !70)
!245 = !DILocation(line: 152, column: 9, scope: !243)
!246 = !DILocation(line: 154, column: 10, scope: !243)
!247 = !DILocation(line: 155, column: 8, scope: !248)
!248 = distinct !DILexicalBlock(scope: !243, file: !69, line: 155, column: 8)
!249 = !DILocation(line: 155, column: 8, scope: !243)
!250 = !DILocalVariable(name: "recvResult", scope: !251, file: !69, line: 162, type: !70)
!251 = distinct !DILexicalBlock(scope: !252, file: !69, line: 157, column: 9)
!252 = distinct !DILexicalBlock(scope: !248, file: !69, line: 156, column: 5)
!253 = !DILocation(line: 162, column: 17, scope: !251)
!254 = !DILocalVariable(name: "service", scope: !251, file: !69, line: 163, type: !92)
!255 = !DILocation(line: 163, column: 32, scope: !251)
!256 = !DILocalVariable(name: "listenSocket", scope: !251, file: !69, line: 164, type: !70)
!257 = !DILocation(line: 164, column: 20, scope: !251)
!258 = !DILocalVariable(name: "acceptSocket", scope: !251, file: !69, line: 165, type: !70)
!259 = !DILocation(line: 165, column: 20, scope: !251)
!260 = !DILocalVariable(name: "inputBuffer", scope: !251, file: !69, line: 166, type: !62)
!261 = !DILocation(line: 166, column: 18, scope: !251)
!262 = !DILocation(line: 167, column: 13, scope: !251)
!263 = !DILocation(line: 177, column: 32, scope: !264)
!264 = distinct !DILexicalBlock(scope: !251, file: !69, line: 168, column: 13)
!265 = !DILocation(line: 177, column: 30, scope: !264)
!266 = !DILocation(line: 178, column: 21, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !69, line: 178, column: 21)
!268 = !DILocation(line: 178, column: 34, scope: !267)
!269 = !DILocation(line: 178, column: 21, scope: !264)
!270 = !DILocation(line: 180, column: 21, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !69, line: 179, column: 17)
!272 = !DILocation(line: 182, column: 17, scope: !264)
!273 = !DILocation(line: 183, column: 25, scope: !264)
!274 = !DILocation(line: 183, column: 36, scope: !264)
!275 = !DILocation(line: 184, column: 25, scope: !264)
!276 = !DILocation(line: 184, column: 34, scope: !264)
!277 = !DILocation(line: 184, column: 41, scope: !264)
!278 = !DILocation(line: 185, column: 36, scope: !264)
!279 = !DILocation(line: 185, column: 25, scope: !264)
!280 = !DILocation(line: 185, column: 34, scope: !264)
!281 = !DILocation(line: 186, column: 26, scope: !282)
!282 = distinct !DILexicalBlock(scope: !264, file: !69, line: 186, column: 21)
!283 = !DILocation(line: 186, column: 40, scope: !282)
!284 = !DILocation(line: 186, column: 21, scope: !282)
!285 = !DILocation(line: 186, column: 85, scope: !282)
!286 = !DILocation(line: 186, column: 21, scope: !264)
!287 = !DILocation(line: 188, column: 21, scope: !288)
!288 = distinct !DILexicalBlock(scope: !282, file: !69, line: 187, column: 17)
!289 = !DILocation(line: 190, column: 28, scope: !290)
!290 = distinct !DILexicalBlock(scope: !264, file: !69, line: 190, column: 21)
!291 = !DILocation(line: 190, column: 21, scope: !290)
!292 = !DILocation(line: 190, column: 58, scope: !290)
!293 = !DILocation(line: 190, column: 21, scope: !264)
!294 = !DILocation(line: 192, column: 21, scope: !295)
!295 = distinct !DILexicalBlock(scope: !290, file: !69, line: 191, column: 17)
!296 = !DILocation(line: 194, column: 39, scope: !264)
!297 = !DILocation(line: 194, column: 32, scope: !264)
!298 = !DILocation(line: 194, column: 30, scope: !264)
!299 = !DILocation(line: 195, column: 21, scope: !300)
!300 = distinct !DILexicalBlock(scope: !264, file: !69, line: 195, column: 21)
!301 = !DILocation(line: 195, column: 34, scope: !300)
!302 = !DILocation(line: 195, column: 21, scope: !264)
!303 = !DILocation(line: 197, column: 21, scope: !304)
!304 = distinct !DILexicalBlock(scope: !300, file: !69, line: 196, column: 17)
!305 = !DILocation(line: 200, column: 35, scope: !264)
!306 = !DILocation(line: 200, column: 49, scope: !264)
!307 = !DILocation(line: 200, column: 30, scope: !264)
!308 = !DILocation(line: 200, column: 28, scope: !264)
!309 = !DILocation(line: 201, column: 21, scope: !310)
!310 = distinct !DILexicalBlock(scope: !264, file: !69, line: 201, column: 21)
!311 = !DILocation(line: 201, column: 32, scope: !310)
!312 = !DILocation(line: 201, column: 48, scope: !310)
!313 = !DILocation(line: 201, column: 51, scope: !310)
!314 = !DILocation(line: 201, column: 62, scope: !310)
!315 = !DILocation(line: 201, column: 21, scope: !264)
!316 = !DILocation(line: 203, column: 21, scope: !317)
!317 = distinct !DILexicalBlock(scope: !310, file: !69, line: 202, column: 17)
!318 = !DILocation(line: 206, column: 29, scope: !264)
!319 = !DILocation(line: 206, column: 17, scope: !264)
!320 = !DILocation(line: 206, column: 41, scope: !264)
!321 = !DILocation(line: 208, column: 29, scope: !264)
!322 = !DILocation(line: 208, column: 24, scope: !264)
!323 = !DILocation(line: 208, column: 22, scope: !264)
!324 = !DILocation(line: 209, column: 13, scope: !264)
!325 = !DILocation(line: 211, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !251, file: !69, line: 211, column: 17)
!327 = !DILocation(line: 211, column: 30, scope: !326)
!328 = !DILocation(line: 211, column: 17, scope: !251)
!329 = !DILocation(line: 213, column: 30, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !69, line: 212, column: 13)
!331 = !DILocation(line: 213, column: 17, scope: !330)
!332 = !DILocation(line: 214, column: 13, scope: !330)
!333 = !DILocation(line: 215, column: 17, scope: !334)
!334 = distinct !DILexicalBlock(scope: !251, file: !69, line: 215, column: 17)
!335 = !DILocation(line: 215, column: 30, scope: !334)
!336 = !DILocation(line: 215, column: 17, scope: !251)
!337 = !DILocation(line: 217, column: 30, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !69, line: 216, column: 13)
!339 = !DILocation(line: 217, column: 17, scope: !338)
!340 = !DILocation(line: 218, column: 13, scope: !338)
!341 = !DILocation(line: 226, column: 5, scope: !252)
!342 = !DILocation(line: 227, column: 8, scope: !343)
!343 = distinct !DILexicalBlock(scope: !243, file: !69, line: 227, column: 8)
!344 = !DILocation(line: 227, column: 8, scope: !243)
!345 = !DILocation(line: 230, column: 9, scope: !346)
!346 = distinct !DILexicalBlock(scope: !343, file: !69, line: 228, column: 5)
!347 = !DILocation(line: 231, column: 5, scope: !346)
!348 = !DILocalVariable(name: "buffer", scope: !349, file: !69, line: 235, type: !201)
!349 = distinct !DILexicalBlock(scope: !350, file: !69, line: 234, column: 9)
!350 = distinct !DILexicalBlock(scope: !343, file: !69, line: 233, column: 5)
!351 = !DILocation(line: 235, column: 17, scope: !349)
!352 = !DILocation(line: 237, column: 17, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !69, line: 237, column: 17)
!354 = !DILocation(line: 237, column: 22, scope: !353)
!355 = !DILocation(line: 237, column: 27, scope: !353)
!356 = !DILocation(line: 237, column: 30, scope: !353)
!357 = !DILocation(line: 237, column: 35, scope: !353)
!358 = !DILocation(line: 237, column: 17, scope: !349)
!359 = !DILocation(line: 239, column: 37, scope: !360)
!360 = distinct !DILexicalBlock(scope: !353, file: !69, line: 238, column: 13)
!361 = !DILocation(line: 239, column: 30, scope: !360)
!362 = !DILocation(line: 239, column: 17, scope: !360)
!363 = !DILocation(line: 240, column: 13, scope: !360)
!364 = !DILocation(line: 243, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !353, file: !69, line: 242, column: 13)
!366 = !DILocation(line: 247, column: 1, scope: !243)
!367 = distinct !DISubprogram(name: "goodB2G2", scope: !69, file: !69, line: 250, type: !78, scopeLine: 251, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!368 = !DILocalVariable(name: "data", scope: !367, file: !69, line: 252, type: !70)
!369 = !DILocation(line: 252, column: 9, scope: !367)
!370 = !DILocation(line: 254, column: 10, scope: !367)
!371 = !DILocation(line: 255, column: 8, scope: !372)
!372 = distinct !DILexicalBlock(scope: !367, file: !69, line: 255, column: 8)
!373 = !DILocation(line: 255, column: 8, scope: !367)
!374 = !DILocalVariable(name: "recvResult", scope: !375, file: !69, line: 262, type: !70)
!375 = distinct !DILexicalBlock(scope: !376, file: !69, line: 257, column: 9)
!376 = distinct !DILexicalBlock(scope: !372, file: !69, line: 256, column: 5)
!377 = !DILocation(line: 262, column: 17, scope: !375)
!378 = !DILocalVariable(name: "service", scope: !375, file: !69, line: 263, type: !92)
!379 = !DILocation(line: 263, column: 32, scope: !375)
!380 = !DILocalVariable(name: "listenSocket", scope: !375, file: !69, line: 264, type: !70)
!381 = !DILocation(line: 264, column: 20, scope: !375)
!382 = !DILocalVariable(name: "acceptSocket", scope: !375, file: !69, line: 265, type: !70)
!383 = !DILocation(line: 265, column: 20, scope: !375)
!384 = !DILocalVariable(name: "inputBuffer", scope: !375, file: !69, line: 266, type: !62)
!385 = !DILocation(line: 266, column: 18, scope: !375)
!386 = !DILocation(line: 267, column: 13, scope: !375)
!387 = !DILocation(line: 277, column: 32, scope: !388)
!388 = distinct !DILexicalBlock(scope: !375, file: !69, line: 268, column: 13)
!389 = !DILocation(line: 277, column: 30, scope: !388)
!390 = !DILocation(line: 278, column: 21, scope: !391)
!391 = distinct !DILexicalBlock(scope: !388, file: !69, line: 278, column: 21)
!392 = !DILocation(line: 278, column: 34, scope: !391)
!393 = !DILocation(line: 278, column: 21, scope: !388)
!394 = !DILocation(line: 280, column: 21, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !69, line: 279, column: 17)
!396 = !DILocation(line: 282, column: 17, scope: !388)
!397 = !DILocation(line: 283, column: 25, scope: !388)
!398 = !DILocation(line: 283, column: 36, scope: !388)
!399 = !DILocation(line: 284, column: 25, scope: !388)
!400 = !DILocation(line: 284, column: 34, scope: !388)
!401 = !DILocation(line: 284, column: 41, scope: !388)
!402 = !DILocation(line: 285, column: 36, scope: !388)
!403 = !DILocation(line: 285, column: 25, scope: !388)
!404 = !DILocation(line: 285, column: 34, scope: !388)
!405 = !DILocation(line: 286, column: 26, scope: !406)
!406 = distinct !DILexicalBlock(scope: !388, file: !69, line: 286, column: 21)
!407 = !DILocation(line: 286, column: 40, scope: !406)
!408 = !DILocation(line: 286, column: 21, scope: !406)
!409 = !DILocation(line: 286, column: 85, scope: !406)
!410 = !DILocation(line: 286, column: 21, scope: !388)
!411 = !DILocation(line: 288, column: 21, scope: !412)
!412 = distinct !DILexicalBlock(scope: !406, file: !69, line: 287, column: 17)
!413 = !DILocation(line: 290, column: 28, scope: !414)
!414 = distinct !DILexicalBlock(scope: !388, file: !69, line: 290, column: 21)
!415 = !DILocation(line: 290, column: 21, scope: !414)
!416 = !DILocation(line: 290, column: 58, scope: !414)
!417 = !DILocation(line: 290, column: 21, scope: !388)
!418 = !DILocation(line: 292, column: 21, scope: !419)
!419 = distinct !DILexicalBlock(scope: !414, file: !69, line: 291, column: 17)
!420 = !DILocation(line: 294, column: 39, scope: !388)
!421 = !DILocation(line: 294, column: 32, scope: !388)
!422 = !DILocation(line: 294, column: 30, scope: !388)
!423 = !DILocation(line: 295, column: 21, scope: !424)
!424 = distinct !DILexicalBlock(scope: !388, file: !69, line: 295, column: 21)
!425 = !DILocation(line: 295, column: 34, scope: !424)
!426 = !DILocation(line: 295, column: 21, scope: !388)
!427 = !DILocation(line: 297, column: 21, scope: !428)
!428 = distinct !DILexicalBlock(scope: !424, file: !69, line: 296, column: 17)
!429 = !DILocation(line: 300, column: 35, scope: !388)
!430 = !DILocation(line: 300, column: 49, scope: !388)
!431 = !DILocation(line: 300, column: 30, scope: !388)
!432 = !DILocation(line: 300, column: 28, scope: !388)
!433 = !DILocation(line: 301, column: 21, scope: !434)
!434 = distinct !DILexicalBlock(scope: !388, file: !69, line: 301, column: 21)
!435 = !DILocation(line: 301, column: 32, scope: !434)
!436 = !DILocation(line: 301, column: 48, scope: !434)
!437 = !DILocation(line: 301, column: 51, scope: !434)
!438 = !DILocation(line: 301, column: 62, scope: !434)
!439 = !DILocation(line: 301, column: 21, scope: !388)
!440 = !DILocation(line: 303, column: 21, scope: !441)
!441 = distinct !DILexicalBlock(scope: !434, file: !69, line: 302, column: 17)
!442 = !DILocation(line: 306, column: 29, scope: !388)
!443 = !DILocation(line: 306, column: 17, scope: !388)
!444 = !DILocation(line: 306, column: 41, scope: !388)
!445 = !DILocation(line: 308, column: 29, scope: !388)
!446 = !DILocation(line: 308, column: 24, scope: !388)
!447 = !DILocation(line: 308, column: 22, scope: !388)
!448 = !DILocation(line: 309, column: 13, scope: !388)
!449 = !DILocation(line: 311, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !375, file: !69, line: 311, column: 17)
!451 = !DILocation(line: 311, column: 30, scope: !450)
!452 = !DILocation(line: 311, column: 17, scope: !375)
!453 = !DILocation(line: 313, column: 30, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !69, line: 312, column: 13)
!455 = !DILocation(line: 313, column: 17, scope: !454)
!456 = !DILocation(line: 314, column: 13, scope: !454)
!457 = !DILocation(line: 315, column: 17, scope: !458)
!458 = distinct !DILexicalBlock(scope: !375, file: !69, line: 315, column: 17)
!459 = !DILocation(line: 315, column: 30, scope: !458)
!460 = !DILocation(line: 315, column: 17, scope: !375)
!461 = !DILocation(line: 317, column: 30, scope: !462)
!462 = distinct !DILexicalBlock(scope: !458, file: !69, line: 316, column: 13)
!463 = !DILocation(line: 317, column: 17, scope: !462)
!464 = !DILocation(line: 318, column: 13, scope: !462)
!465 = !DILocation(line: 326, column: 5, scope: !376)
!466 = !DILocation(line: 327, column: 8, scope: !467)
!467 = distinct !DILexicalBlock(scope: !367, file: !69, line: 327, column: 8)
!468 = !DILocation(line: 327, column: 8, scope: !367)
!469 = !DILocalVariable(name: "buffer", scope: !470, file: !69, line: 330, type: !201)
!470 = distinct !DILexicalBlock(scope: !471, file: !69, line: 329, column: 9)
!471 = distinct !DILexicalBlock(scope: !467, file: !69, line: 328, column: 5)
!472 = !DILocation(line: 330, column: 17, scope: !470)
!473 = !DILocation(line: 332, column: 17, scope: !474)
!474 = distinct !DILexicalBlock(scope: !470, file: !69, line: 332, column: 17)
!475 = !DILocation(line: 332, column: 22, scope: !474)
!476 = !DILocation(line: 332, column: 27, scope: !474)
!477 = !DILocation(line: 332, column: 30, scope: !474)
!478 = !DILocation(line: 332, column: 35, scope: !474)
!479 = !DILocation(line: 332, column: 17, scope: !470)
!480 = !DILocation(line: 334, column: 37, scope: !481)
!481 = distinct !DILexicalBlock(scope: !474, file: !69, line: 333, column: 13)
!482 = !DILocation(line: 334, column: 30, scope: !481)
!483 = !DILocation(line: 334, column: 17, scope: !481)
!484 = !DILocation(line: 335, column: 13, scope: !481)
!485 = !DILocation(line: 338, column: 17, scope: !486)
!486 = distinct !DILexicalBlock(scope: !474, file: !69, line: 337, column: 13)
!487 = !DILocation(line: 341, column: 5, scope: !471)
!488 = !DILocation(line: 342, column: 1, scope: !367)
!489 = distinct !DISubprogram(name: "goodG2B1", scope: !69, file: !69, line: 345, type: !78, scopeLine: 346, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!490 = !DILocalVariable(name: "data", scope: !489, file: !69, line: 347, type: !70)
!491 = !DILocation(line: 347, column: 9, scope: !489)
!492 = !DILocation(line: 349, column: 10, scope: !489)
!493 = !DILocation(line: 350, column: 8, scope: !494)
!494 = distinct !DILexicalBlock(scope: !489, file: !69, line: 350, column: 8)
!495 = !DILocation(line: 350, column: 8, scope: !489)
!496 = !DILocation(line: 353, column: 9, scope: !497)
!497 = distinct !DILexicalBlock(scope: !494, file: !69, line: 351, column: 5)
!498 = !DILocation(line: 354, column: 5, scope: !497)
!499 = !DILocation(line: 359, column: 14, scope: !500)
!500 = distinct !DILexicalBlock(scope: !494, file: !69, line: 356, column: 5)
!501 = !DILocation(line: 361, column: 8, scope: !502)
!502 = distinct !DILexicalBlock(scope: !489, file: !69, line: 361, column: 8)
!503 = !DILocation(line: 361, column: 8, scope: !489)
!504 = !DILocalVariable(name: "buffer", scope: !505, file: !69, line: 364, type: !201)
!505 = distinct !DILexicalBlock(scope: !506, file: !69, line: 363, column: 9)
!506 = distinct !DILexicalBlock(scope: !502, file: !69, line: 362, column: 5)
!507 = !DILocation(line: 364, column: 17, scope: !505)
!508 = !DILocation(line: 367, column: 17, scope: !509)
!509 = distinct !DILexicalBlock(scope: !505, file: !69, line: 367, column: 17)
!510 = !DILocation(line: 367, column: 22, scope: !509)
!511 = !DILocation(line: 367, column: 17, scope: !505)
!512 = !DILocation(line: 369, column: 37, scope: !513)
!513 = distinct !DILexicalBlock(scope: !509, file: !69, line: 368, column: 13)
!514 = !DILocation(line: 369, column: 30, scope: !513)
!515 = !DILocation(line: 369, column: 17, scope: !513)
!516 = !DILocation(line: 370, column: 13, scope: !513)
!517 = !DILocation(line: 373, column: 17, scope: !518)
!518 = distinct !DILexicalBlock(scope: !509, file: !69, line: 372, column: 13)
!519 = !DILocation(line: 376, column: 5, scope: !506)
!520 = !DILocation(line: 377, column: 1, scope: !489)
!521 = distinct !DISubprogram(name: "goodG2B2", scope: !69, file: !69, line: 380, type: !78, scopeLine: 381, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !80)
!522 = !DILocalVariable(name: "data", scope: !521, file: !69, line: 382, type: !70)
!523 = !DILocation(line: 382, column: 9, scope: !521)
!524 = !DILocation(line: 384, column: 10, scope: !521)
!525 = !DILocation(line: 385, column: 8, scope: !526)
!526 = distinct !DILexicalBlock(scope: !521, file: !69, line: 385, column: 8)
!527 = !DILocation(line: 385, column: 8, scope: !521)
!528 = !DILocation(line: 389, column: 14, scope: !529)
!529 = distinct !DILexicalBlock(scope: !526, file: !69, line: 386, column: 5)
!530 = !DILocation(line: 390, column: 5, scope: !529)
!531 = !DILocation(line: 391, column: 8, scope: !532)
!532 = distinct !DILexicalBlock(scope: !521, file: !69, line: 391, column: 8)
!533 = !DILocation(line: 391, column: 8, scope: !521)
!534 = !DILocalVariable(name: "buffer", scope: !535, file: !69, line: 394, type: !201)
!535 = distinct !DILexicalBlock(scope: !536, file: !69, line: 393, column: 9)
!536 = distinct !DILexicalBlock(scope: !532, file: !69, line: 392, column: 5)
!537 = !DILocation(line: 394, column: 17, scope: !535)
!538 = !DILocation(line: 397, column: 17, scope: !539)
!539 = distinct !DILexicalBlock(scope: !535, file: !69, line: 397, column: 17)
!540 = !DILocation(line: 397, column: 22, scope: !539)
!541 = !DILocation(line: 397, column: 17, scope: !535)
!542 = !DILocation(line: 399, column: 37, scope: !543)
!543 = distinct !DILexicalBlock(scope: !539, file: !69, line: 398, column: 13)
!544 = !DILocation(line: 399, column: 30, scope: !543)
!545 = !DILocation(line: 399, column: 17, scope: !543)
!546 = !DILocation(line: 400, column: 13, scope: !543)
!547 = !DILocation(line: 403, column: 17, scope: !548)
!548 = distinct !DILexicalBlock(scope: !539, file: !69, line: 402, column: 13)
!549 = !DILocation(line: 406, column: 5, scope: !536)
!550 = !DILocation(line: 407, column: 1, scope: !521)
