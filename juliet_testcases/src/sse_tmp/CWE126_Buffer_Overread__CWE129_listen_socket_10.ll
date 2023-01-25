; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_10.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_10_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  %0 = load i32, i32* @globalTrue, align 4, !dbg !79
  %tobool = icmp ne i32 %0, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.end34, !dbg !81

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !82, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !86, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %listenSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %acceptSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  br label %do.body, !dbg !110

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !111
  store i32 %call, i32* %listenSocket, align 4, !dbg !113
  %1 = load i32, i32* %listenSocket, align 4, !dbg !114
  %cmp = icmp eq i32 %1, -1, !dbg !116
  br i1 %cmp, label %if.then1, label %if.end, !dbg !117

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !118

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !120
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !121
  store i16 2, i16* %sin_family, align 4, !dbg !122
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !123
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !124
  store i32 0, i32* %s_addr, align 4, !dbg !125
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !126
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !127
  store i16 %call2, i16* %sin_port, align 2, !dbg !128
  %3 = load i32, i32* %listenSocket, align 4, !dbg !129
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !131
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !132
  %cmp4 = icmp eq i32 %call3, -1, !dbg !133
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !134

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !135

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !137
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !139
  %cmp8 = icmp eq i32 %call7, -1, !dbg !140
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !141

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !142

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !144
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !145
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !146
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !147
  %cmp12 = icmp eq i32 %7, -1, !dbg !149
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !150

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !151

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !153
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !154
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !155
  %conv = trunc i64 %call15 to i32, !dbg !155
  store i32 %conv, i32* %recvResult, align 4, !dbg !156
  %9 = load i32, i32* %recvResult, align 4, !dbg !157
  %cmp16 = icmp eq i32 %9, -1, !dbg !159
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !160

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !161
  %cmp18 = icmp eq i32 %10, 0, !dbg !162
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !163

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !164

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !166
  %idxprom = sext i32 %11 to i64, !dbg !167
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !169
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !170
  store i32 %call23, i32* %data, align 4, !dbg !171
  br label %do.end, !dbg !172

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !173
  %cmp24 = icmp ne i32 %12, -1, !dbg !175
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !176

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !177
  %call27 = call i32 @close(i32 %13), !dbg !179
  br label %if.end28, !dbg !180

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !181
  %cmp29 = icmp ne i32 %14, -1, !dbg !183
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !184

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !185
  %call32 = call i32 @close(i32 %15), !dbg !187
  br label %if.end33, !dbg !188

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !189

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @globalTrue, align 4, !dbg !190
  %tobool35 = icmp ne i32 %16, 0, !dbg !190
  br i1 %tobool35, label %if.then36, label %if.end43, !dbg !192

if.then36:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !193, metadata !DIExpression()), !dbg !199
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !199
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !199
  %18 = load i32, i32* %data, align 4, !dbg !200
  %cmp37 = icmp sge i32 %18, 0, !dbg !202
  br i1 %cmp37, label %if.then39, label %if.else, !dbg !203

if.then39:                                        ; preds = %if.then36
  %19 = load i32, i32* %data, align 4, !dbg !204
  %idxprom40 = sext i32 %19 to i64, !dbg !206
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom40, !dbg !206
  %20 = load i32, i32* %arrayidx41, align 4, !dbg !206
  call void @printIntLine(i32 %20), !dbg !207
  br label %if.end42, !dbg !208

if.else:                                          ; preds = %if.then36
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !209
  br label %if.end42

if.end42:                                         ; preds = %if.else, %if.then39
  br label %if.end43, !dbg !211

if.end43:                                         ; preds = %if.end42, %if.end34
  ret void, !dbg !212
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_10_good() #0 !dbg !213 {
entry:
  call void @goodB2G1(), !dbg !214
  call void @goodB2G2(), !dbg !215
  call void @goodG2B1(), !dbg !216
  call void @goodG2B2(), !dbg !217
  ret void, !dbg !218
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !219 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !224, metadata !DIExpression()), !dbg !225
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !226, metadata !DIExpression()), !dbg !227
  %call = call i64 @time(i64* null) #7, !dbg !228
  %conv = trunc i64 %call to i32, !dbg !229
  call void @srand(i32 %conv) #7, !dbg !230
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !231
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_10_good(), !dbg !232
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !233
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !234
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_10_bad(), !dbg !235
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !236
  ret i32 0, !dbg !237
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !238 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !239, metadata !DIExpression()), !dbg !240
  store i32 -1, i32* %data, align 4, !dbg !241
  %0 = load i32, i32* @globalTrue, align 4, !dbg !242
  %tobool = icmp ne i32 %0, 0, !dbg !242
  br i1 %tobool, label %if.then, label %if.end34, !dbg !244

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !245, metadata !DIExpression()), !dbg !248
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !249, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !251, metadata !DIExpression()), !dbg !252
  store i32 -1, i32* %listenSocket, align 4, !dbg !252
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 -1, i32* %acceptSocket, align 4, !dbg !254
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !255, metadata !DIExpression()), !dbg !256
  br label %do.body, !dbg !257

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !258
  store i32 %call, i32* %listenSocket, align 4, !dbg !260
  %1 = load i32, i32* %listenSocket, align 4, !dbg !261
  %cmp = icmp eq i32 %1, -1, !dbg !263
  br i1 %cmp, label %if.then1, label %if.end, !dbg !264

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !265

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !267
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !267
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !268
  store i16 2, i16* %sin_family, align 4, !dbg !269
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !270
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !271
  store i32 0, i32* %s_addr, align 4, !dbg !272
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !273
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !274
  store i16 %call2, i16* %sin_port, align 2, !dbg !275
  %3 = load i32, i32* %listenSocket, align 4, !dbg !276
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !278
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !279
  %cmp4 = icmp eq i32 %call3, -1, !dbg !280
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !281

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !282

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !284
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !286
  %cmp8 = icmp eq i32 %call7, -1, !dbg !287
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !288

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !289

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !291
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !292
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !293
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !294
  %cmp12 = icmp eq i32 %7, -1, !dbg !296
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !297

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !298

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !300
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !301
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !302
  %conv = trunc i64 %call15 to i32, !dbg !302
  store i32 %conv, i32* %recvResult, align 4, !dbg !303
  %9 = load i32, i32* %recvResult, align 4, !dbg !304
  %cmp16 = icmp eq i32 %9, -1, !dbg !306
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !307

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !308
  %cmp18 = icmp eq i32 %10, 0, !dbg !309
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !310

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !311

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !313
  %idxprom = sext i32 %11 to i64, !dbg !314
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !314
  store i8 0, i8* %arrayidx, align 1, !dbg !315
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !316
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !317
  store i32 %call23, i32* %data, align 4, !dbg !318
  br label %do.end, !dbg !319

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !320
  %cmp24 = icmp ne i32 %12, -1, !dbg !322
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !323

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !324
  %call27 = call i32 @close(i32 %13), !dbg !326
  br label %if.end28, !dbg !327

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !328
  %cmp29 = icmp ne i32 %14, -1, !dbg !330
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !331

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !332
  %call32 = call i32 @close(i32 %15), !dbg !334
  br label %if.end33, !dbg !335

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !336

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @globalFalse, align 4, !dbg !337
  %tobool35 = icmp ne i32 %16, 0, !dbg !337
  br i1 %tobool35, label %if.then36, label %if.else, !dbg !339

if.then36:                                        ; preds = %if.end34
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !340
  br label %if.end46, !dbg !342

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !343, metadata !DIExpression()), !dbg !346
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !346
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !346
  %18 = load i32, i32* %data, align 4, !dbg !347
  %cmp37 = icmp sge i32 %18, 0, !dbg !349
  br i1 %cmp37, label %land.lhs.true, label %if.else44, !dbg !350

land.lhs.true:                                    ; preds = %if.else
  %19 = load i32, i32* %data, align 4, !dbg !351
  %cmp39 = icmp slt i32 %19, 10, !dbg !352
  br i1 %cmp39, label %if.then41, label %if.else44, !dbg !353

if.then41:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !354
  %idxprom42 = sext i32 %20 to i64, !dbg !356
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !356
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !356
  call void @printIntLine(i32 %21), !dbg !357
  br label %if.end45, !dbg !358

if.else44:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !359
  br label %if.end45

if.end45:                                         ; preds = %if.else44, %if.then41
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then36
  ret void, !dbg !361
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !362 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !363, metadata !DIExpression()), !dbg !364
  store i32 -1, i32* %data, align 4, !dbg !365
  %0 = load i32, i32* @globalTrue, align 4, !dbg !366
  %tobool = icmp ne i32 %0, 0, !dbg !366
  br i1 %tobool, label %if.then, label %if.end34, !dbg !368

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !369, metadata !DIExpression()), !dbg !372
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !373, metadata !DIExpression()), !dbg !374
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !375, metadata !DIExpression()), !dbg !376
  store i32 -1, i32* %listenSocket, align 4, !dbg !376
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !377, metadata !DIExpression()), !dbg !378
  store i32 -1, i32* %acceptSocket, align 4, !dbg !378
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !379, metadata !DIExpression()), !dbg !380
  br label %do.body, !dbg !381

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !382
  store i32 %call, i32* %listenSocket, align 4, !dbg !384
  %1 = load i32, i32* %listenSocket, align 4, !dbg !385
  %cmp = icmp eq i32 %1, -1, !dbg !387
  br i1 %cmp, label %if.then1, label %if.end, !dbg !388

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !389

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !391
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !391
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !392
  store i16 2, i16* %sin_family, align 4, !dbg !393
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !394
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !395
  store i32 0, i32* %s_addr, align 4, !dbg !396
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !397
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !398
  store i16 %call2, i16* %sin_port, align 2, !dbg !399
  %3 = load i32, i32* %listenSocket, align 4, !dbg !400
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !402
  %call3 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !403
  %cmp4 = icmp eq i32 %call3, -1, !dbg !404
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !405

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !406

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !408
  %call7 = call i32 @listen(i32 %5, i32 5) #7, !dbg !410
  %cmp8 = icmp eq i32 %call7, -1, !dbg !411
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !412

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !413

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !415
  %call11 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !416
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !417
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !418
  %cmp12 = icmp eq i32 %7, -1, !dbg !420
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !421

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !422

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !424
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !425
  %call15 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !426
  %conv = trunc i64 %call15 to i32, !dbg !426
  store i32 %conv, i32* %recvResult, align 4, !dbg !427
  %9 = load i32, i32* %recvResult, align 4, !dbg !428
  %cmp16 = icmp eq i32 %9, -1, !dbg !430
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !431

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !432
  %cmp18 = icmp eq i32 %10, 0, !dbg !433
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !434

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !435

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !437
  %idxprom = sext i32 %11 to i64, !dbg !438
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !438
  store i8 0, i8* %arrayidx, align 1, !dbg !439
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !440
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !441
  store i32 %call23, i32* %data, align 4, !dbg !442
  br label %do.end, !dbg !443

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !444
  %cmp24 = icmp ne i32 %12, -1, !dbg !446
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !447

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !448
  %call27 = call i32 @close(i32 %13), !dbg !450
  br label %if.end28, !dbg !451

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !452
  %cmp29 = icmp ne i32 %14, -1, !dbg !454
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !455

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !456
  %call32 = call i32 @close(i32 %15), !dbg !458
  br label %if.end33, !dbg !459

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !460

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @globalTrue, align 4, !dbg !461
  %tobool35 = icmp ne i32 %16, 0, !dbg !461
  br i1 %tobool35, label %if.then36, label %if.end45, !dbg !463

if.then36:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !464, metadata !DIExpression()), !dbg !467
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !467
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !467
  %18 = load i32, i32* %data, align 4, !dbg !468
  %cmp37 = icmp sge i32 %18, 0, !dbg !470
  br i1 %cmp37, label %land.lhs.true, label %if.else, !dbg !471

land.lhs.true:                                    ; preds = %if.then36
  %19 = load i32, i32* %data, align 4, !dbg !472
  %cmp39 = icmp slt i32 %19, 10, !dbg !473
  br i1 %cmp39, label %if.then41, label %if.else, !dbg !474

if.then41:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !475
  %idxprom42 = sext i32 %20 to i64, !dbg !477
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !477
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !477
  call void @printIntLine(i32 %21), !dbg !478
  br label %if.end44, !dbg !479

if.else:                                          ; preds = %land.lhs.true, %if.then36
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !480
  br label %if.end44

if.end44:                                         ; preds = %if.else, %if.then41
  br label %if.end45, !dbg !482

if.end45:                                         ; preds = %if.end44, %if.end34
  ret void, !dbg !483
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !484 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !485, metadata !DIExpression()), !dbg !486
  store i32 -1, i32* %data, align 4, !dbg !487
  %0 = load i32, i32* @globalFalse, align 4, !dbg !488
  %tobool = icmp ne i32 %0, 0, !dbg !488
  br i1 %tobool, label %if.then, label %if.else, !dbg !490

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !491
  br label %if.end, !dbg !493

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !494
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalTrue, align 4, !dbg !496
  %tobool1 = icmp ne i32 %1, 0, !dbg !496
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !498

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !499, metadata !DIExpression()), !dbg !502
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !502
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !502
  %3 = load i32, i32* %data, align 4, !dbg !503
  %cmp = icmp sge i32 %3, 0, !dbg !505
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !506

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !507
  %idxprom = sext i32 %4 to i64, !dbg !509
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !509
  %5 = load i32, i32* %arrayidx, align 4, !dbg !509
  call void @printIntLine(i32 %5), !dbg !510
  br label %if.end5, !dbg !511

if.else4:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !512
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6, !dbg !514

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !515
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !516 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !517, metadata !DIExpression()), !dbg !518
  store i32 -1, i32* %data, align 4, !dbg !519
  %0 = load i32, i32* @globalTrue, align 4, !dbg !520
  %tobool = icmp ne i32 %0, 0, !dbg !520
  br i1 %tobool, label %if.then, label %if.end, !dbg !522

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !523
  br label %if.end, !dbg !525

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !526
  %tobool1 = icmp ne i32 %1, 0, !dbg !526
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !528

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !529, metadata !DIExpression()), !dbg !532
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !532
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !532
  %3 = load i32, i32* %data, align 4, !dbg !533
  %cmp = icmp sge i32 %3, 0, !dbg !535
  br i1 %cmp, label %if.then3, label %if.else, !dbg !536

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !537
  %idxprom = sext i32 %4 to i64, !dbg !539
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !539
  %5 = load i32, i32* %arrayidx, align 4, !dbg !539
  call void @printIntLine(i32 %5), !dbg !540
  br label %if.end4, !dbg !541

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !542
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !544

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !545
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
!llvm.module.flags = !{!64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !51, !5}
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !48, line: 26, baseType: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !50, line: 42, baseType: !5)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !53, line: 178, size: 128, elements: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!54 = !{!55, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !52, file: !53, line: 180, baseType: !56, size: 16)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !57, line: 28, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!58 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !52, file: !53, line: 181, baseType: !60, size: 112, offset: 16)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 112, elements: !62)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !{!63}
!63 = !DISubrange(count: 14)
!64 = !{i32 7, !"Dwarf Version", i32 4}
!65 = !{i32 2, !"Debug Info Version", i32 3}
!66 = !{i32 1, !"wchar_size", i32 4}
!67 = !{i32 7, !"uwtable", i32 1}
!68 = !{i32 7, !"frame-pointer", i32 2}
!69 = !{!"clang version 13.0.0"}
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_10_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_10.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocation(line: 49, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 49, column: 8)
!81 = !DILocation(line: 49, column: 8, scope: !70)
!82 = !DILocalVariable(name: "recvResult", scope: !83, file: !71, line: 56, type: !76)
!83 = distinct !DILexicalBlock(scope: !84, file: !71, line: 51, column: 9)
!84 = distinct !DILexicalBlock(scope: !80, file: !71, line: 50, column: 5)
!85 = !DILocation(line: 56, column: 17, scope: !83)
!86 = !DILocalVariable(name: "service", scope: !83, file: !71, line: 57, type: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !88)
!88 = !{!89, !90, !94, !98}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !17, line: 240, baseType: !56, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !17, line: 241, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !17, line: 242, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !17, line: 33, baseType: !46, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !17, line: 245, baseType: !99, size: 64, offset: 64)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 64, elements: !101)
!100 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!101 = !{!102}
!102 = !DISubrange(count: 8)
!103 = !DILocation(line: 57, column: 32, scope: !83)
!104 = !DILocalVariable(name: "listenSocket", scope: !83, file: !71, line: 58, type: !76)
!105 = !DILocation(line: 58, column: 20, scope: !83)
!106 = !DILocalVariable(name: "acceptSocket", scope: !83, file: !71, line: 59, type: !76)
!107 = !DILocation(line: 59, column: 20, scope: !83)
!108 = !DILocalVariable(name: "inputBuffer", scope: !83, file: !71, line: 60, type: !60)
!109 = !DILocation(line: 60, column: 18, scope: !83)
!110 = !DILocation(line: 61, column: 13, scope: !83)
!111 = !DILocation(line: 71, column: 32, scope: !112)
!112 = distinct !DILexicalBlock(scope: !83, file: !71, line: 62, column: 13)
!113 = !DILocation(line: 71, column: 30, scope: !112)
!114 = !DILocation(line: 72, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !71, line: 72, column: 21)
!116 = !DILocation(line: 72, column: 34, scope: !115)
!117 = !DILocation(line: 72, column: 21, scope: !112)
!118 = !DILocation(line: 74, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !71, line: 73, column: 17)
!120 = !DILocation(line: 76, column: 17, scope: !112)
!121 = !DILocation(line: 77, column: 25, scope: !112)
!122 = !DILocation(line: 77, column: 36, scope: !112)
!123 = !DILocation(line: 78, column: 25, scope: !112)
!124 = !DILocation(line: 78, column: 34, scope: !112)
!125 = !DILocation(line: 78, column: 41, scope: !112)
!126 = !DILocation(line: 79, column: 36, scope: !112)
!127 = !DILocation(line: 79, column: 25, scope: !112)
!128 = !DILocation(line: 79, column: 34, scope: !112)
!129 = !DILocation(line: 80, column: 26, scope: !130)
!130 = distinct !DILexicalBlock(scope: !112, file: !71, line: 80, column: 21)
!131 = !DILocation(line: 80, column: 40, scope: !130)
!132 = !DILocation(line: 80, column: 21, scope: !130)
!133 = !DILocation(line: 80, column: 85, scope: !130)
!134 = !DILocation(line: 80, column: 21, scope: !112)
!135 = !DILocation(line: 82, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !71, line: 81, column: 17)
!137 = !DILocation(line: 84, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !112, file: !71, line: 84, column: 21)
!139 = !DILocation(line: 84, column: 21, scope: !138)
!140 = !DILocation(line: 84, column: 58, scope: !138)
!141 = !DILocation(line: 84, column: 21, scope: !112)
!142 = !DILocation(line: 86, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !71, line: 85, column: 17)
!144 = !DILocation(line: 88, column: 39, scope: !112)
!145 = !DILocation(line: 88, column: 32, scope: !112)
!146 = !DILocation(line: 88, column: 30, scope: !112)
!147 = !DILocation(line: 89, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !112, file: !71, line: 89, column: 21)
!149 = !DILocation(line: 89, column: 34, scope: !148)
!150 = !DILocation(line: 89, column: 21, scope: !112)
!151 = !DILocation(line: 91, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !71, line: 90, column: 17)
!153 = !DILocation(line: 94, column: 35, scope: !112)
!154 = !DILocation(line: 94, column: 49, scope: !112)
!155 = !DILocation(line: 94, column: 30, scope: !112)
!156 = !DILocation(line: 94, column: 28, scope: !112)
!157 = !DILocation(line: 95, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !112, file: !71, line: 95, column: 21)
!159 = !DILocation(line: 95, column: 32, scope: !158)
!160 = !DILocation(line: 95, column: 48, scope: !158)
!161 = !DILocation(line: 95, column: 51, scope: !158)
!162 = !DILocation(line: 95, column: 62, scope: !158)
!163 = !DILocation(line: 95, column: 21, scope: !112)
!164 = !DILocation(line: 97, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !71, line: 96, column: 17)
!166 = !DILocation(line: 100, column: 29, scope: !112)
!167 = !DILocation(line: 100, column: 17, scope: !112)
!168 = !DILocation(line: 100, column: 41, scope: !112)
!169 = !DILocation(line: 102, column: 29, scope: !112)
!170 = !DILocation(line: 102, column: 24, scope: !112)
!171 = !DILocation(line: 102, column: 22, scope: !112)
!172 = !DILocation(line: 103, column: 13, scope: !112)
!173 = !DILocation(line: 105, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !83, file: !71, line: 105, column: 17)
!175 = !DILocation(line: 105, column: 30, scope: !174)
!176 = !DILocation(line: 105, column: 17, scope: !83)
!177 = !DILocation(line: 107, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !71, line: 106, column: 13)
!179 = !DILocation(line: 107, column: 17, scope: !178)
!180 = !DILocation(line: 108, column: 13, scope: !178)
!181 = !DILocation(line: 109, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !83, file: !71, line: 109, column: 17)
!183 = !DILocation(line: 109, column: 30, scope: !182)
!184 = !DILocation(line: 109, column: 17, scope: !83)
!185 = !DILocation(line: 111, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !71, line: 110, column: 13)
!187 = !DILocation(line: 111, column: 17, scope: !186)
!188 = !DILocation(line: 112, column: 13, scope: !186)
!189 = !DILocation(line: 120, column: 5, scope: !84)
!190 = !DILocation(line: 121, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !70, file: !71, line: 121, column: 8)
!192 = !DILocation(line: 121, column: 8, scope: !70)
!193 = !DILocalVariable(name: "buffer", scope: !194, file: !71, line: 124, type: !196)
!194 = distinct !DILexicalBlock(scope: !195, file: !71, line: 123, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !71, line: 122, column: 5)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !197)
!197 = !{!198}
!198 = !DISubrange(count: 10)
!199 = !DILocation(line: 124, column: 17, scope: !194)
!200 = !DILocation(line: 127, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !194, file: !71, line: 127, column: 17)
!202 = !DILocation(line: 127, column: 22, scope: !201)
!203 = !DILocation(line: 127, column: 17, scope: !194)
!204 = !DILocation(line: 129, column: 37, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !71, line: 128, column: 13)
!206 = !DILocation(line: 129, column: 30, scope: !205)
!207 = !DILocation(line: 129, column: 17, scope: !205)
!208 = !DILocation(line: 130, column: 13, scope: !205)
!209 = !DILocation(line: 133, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !201, file: !71, line: 132, column: 13)
!211 = !DILocation(line: 136, column: 5, scope: !195)
!212 = !DILocation(line: 137, column: 1, scope: !70)
!213 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_10_good", scope: !71, file: !71, line: 403, type: !72, scopeLine: 404, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!214 = !DILocation(line: 405, column: 5, scope: !213)
!215 = !DILocation(line: 406, column: 5, scope: !213)
!216 = !DILocation(line: 407, column: 5, scope: !213)
!217 = !DILocation(line: 408, column: 5, scope: !213)
!218 = !DILocation(line: 409, column: 1, scope: !213)
!219 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 420, type: !220, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!220 = !DISubroutineType(types: !221)
!221 = !{!76, !76, !222}
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64)
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!224 = !DILocalVariable(name: "argc", arg: 1, scope: !219, file: !71, line: 420, type: !76)
!225 = !DILocation(line: 420, column: 14, scope: !219)
!226 = !DILocalVariable(name: "argv", arg: 2, scope: !219, file: !71, line: 420, type: !222)
!227 = !DILocation(line: 420, column: 27, scope: !219)
!228 = !DILocation(line: 423, column: 22, scope: !219)
!229 = !DILocation(line: 423, column: 12, scope: !219)
!230 = !DILocation(line: 423, column: 5, scope: !219)
!231 = !DILocation(line: 425, column: 5, scope: !219)
!232 = !DILocation(line: 426, column: 5, scope: !219)
!233 = !DILocation(line: 427, column: 5, scope: !219)
!234 = !DILocation(line: 430, column: 5, scope: !219)
!235 = !DILocation(line: 431, column: 5, scope: !219)
!236 = !DILocation(line: 432, column: 5, scope: !219)
!237 = !DILocation(line: 434, column: 5, scope: !219)
!238 = distinct !DISubprogram(name: "goodB2G1", scope: !71, file: !71, line: 144, type: !72, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!239 = !DILocalVariable(name: "data", scope: !238, file: !71, line: 146, type: !76)
!240 = !DILocation(line: 146, column: 9, scope: !238)
!241 = !DILocation(line: 148, column: 10, scope: !238)
!242 = !DILocation(line: 149, column: 8, scope: !243)
!243 = distinct !DILexicalBlock(scope: !238, file: !71, line: 149, column: 8)
!244 = !DILocation(line: 149, column: 8, scope: !238)
!245 = !DILocalVariable(name: "recvResult", scope: !246, file: !71, line: 156, type: !76)
!246 = distinct !DILexicalBlock(scope: !247, file: !71, line: 151, column: 9)
!247 = distinct !DILexicalBlock(scope: !243, file: !71, line: 150, column: 5)
!248 = !DILocation(line: 156, column: 17, scope: !246)
!249 = !DILocalVariable(name: "service", scope: !246, file: !71, line: 157, type: !87)
!250 = !DILocation(line: 157, column: 32, scope: !246)
!251 = !DILocalVariable(name: "listenSocket", scope: !246, file: !71, line: 158, type: !76)
!252 = !DILocation(line: 158, column: 20, scope: !246)
!253 = !DILocalVariable(name: "acceptSocket", scope: !246, file: !71, line: 159, type: !76)
!254 = !DILocation(line: 159, column: 20, scope: !246)
!255 = !DILocalVariable(name: "inputBuffer", scope: !246, file: !71, line: 160, type: !60)
!256 = !DILocation(line: 160, column: 18, scope: !246)
!257 = !DILocation(line: 161, column: 13, scope: !246)
!258 = !DILocation(line: 171, column: 32, scope: !259)
!259 = distinct !DILexicalBlock(scope: !246, file: !71, line: 162, column: 13)
!260 = !DILocation(line: 171, column: 30, scope: !259)
!261 = !DILocation(line: 172, column: 21, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !71, line: 172, column: 21)
!263 = !DILocation(line: 172, column: 34, scope: !262)
!264 = !DILocation(line: 172, column: 21, scope: !259)
!265 = !DILocation(line: 174, column: 21, scope: !266)
!266 = distinct !DILexicalBlock(scope: !262, file: !71, line: 173, column: 17)
!267 = !DILocation(line: 176, column: 17, scope: !259)
!268 = !DILocation(line: 177, column: 25, scope: !259)
!269 = !DILocation(line: 177, column: 36, scope: !259)
!270 = !DILocation(line: 178, column: 25, scope: !259)
!271 = !DILocation(line: 178, column: 34, scope: !259)
!272 = !DILocation(line: 178, column: 41, scope: !259)
!273 = !DILocation(line: 179, column: 36, scope: !259)
!274 = !DILocation(line: 179, column: 25, scope: !259)
!275 = !DILocation(line: 179, column: 34, scope: !259)
!276 = !DILocation(line: 180, column: 26, scope: !277)
!277 = distinct !DILexicalBlock(scope: !259, file: !71, line: 180, column: 21)
!278 = !DILocation(line: 180, column: 40, scope: !277)
!279 = !DILocation(line: 180, column: 21, scope: !277)
!280 = !DILocation(line: 180, column: 85, scope: !277)
!281 = !DILocation(line: 180, column: 21, scope: !259)
!282 = !DILocation(line: 182, column: 21, scope: !283)
!283 = distinct !DILexicalBlock(scope: !277, file: !71, line: 181, column: 17)
!284 = !DILocation(line: 184, column: 28, scope: !285)
!285 = distinct !DILexicalBlock(scope: !259, file: !71, line: 184, column: 21)
!286 = !DILocation(line: 184, column: 21, scope: !285)
!287 = !DILocation(line: 184, column: 58, scope: !285)
!288 = !DILocation(line: 184, column: 21, scope: !259)
!289 = !DILocation(line: 186, column: 21, scope: !290)
!290 = distinct !DILexicalBlock(scope: !285, file: !71, line: 185, column: 17)
!291 = !DILocation(line: 188, column: 39, scope: !259)
!292 = !DILocation(line: 188, column: 32, scope: !259)
!293 = !DILocation(line: 188, column: 30, scope: !259)
!294 = !DILocation(line: 189, column: 21, scope: !295)
!295 = distinct !DILexicalBlock(scope: !259, file: !71, line: 189, column: 21)
!296 = !DILocation(line: 189, column: 34, scope: !295)
!297 = !DILocation(line: 189, column: 21, scope: !259)
!298 = !DILocation(line: 191, column: 21, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !71, line: 190, column: 17)
!300 = !DILocation(line: 194, column: 35, scope: !259)
!301 = !DILocation(line: 194, column: 49, scope: !259)
!302 = !DILocation(line: 194, column: 30, scope: !259)
!303 = !DILocation(line: 194, column: 28, scope: !259)
!304 = !DILocation(line: 195, column: 21, scope: !305)
!305 = distinct !DILexicalBlock(scope: !259, file: !71, line: 195, column: 21)
!306 = !DILocation(line: 195, column: 32, scope: !305)
!307 = !DILocation(line: 195, column: 48, scope: !305)
!308 = !DILocation(line: 195, column: 51, scope: !305)
!309 = !DILocation(line: 195, column: 62, scope: !305)
!310 = !DILocation(line: 195, column: 21, scope: !259)
!311 = !DILocation(line: 197, column: 21, scope: !312)
!312 = distinct !DILexicalBlock(scope: !305, file: !71, line: 196, column: 17)
!313 = !DILocation(line: 200, column: 29, scope: !259)
!314 = !DILocation(line: 200, column: 17, scope: !259)
!315 = !DILocation(line: 200, column: 41, scope: !259)
!316 = !DILocation(line: 202, column: 29, scope: !259)
!317 = !DILocation(line: 202, column: 24, scope: !259)
!318 = !DILocation(line: 202, column: 22, scope: !259)
!319 = !DILocation(line: 203, column: 13, scope: !259)
!320 = !DILocation(line: 205, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !246, file: !71, line: 205, column: 17)
!322 = !DILocation(line: 205, column: 30, scope: !321)
!323 = !DILocation(line: 205, column: 17, scope: !246)
!324 = !DILocation(line: 207, column: 30, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !71, line: 206, column: 13)
!326 = !DILocation(line: 207, column: 17, scope: !325)
!327 = !DILocation(line: 208, column: 13, scope: !325)
!328 = !DILocation(line: 209, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !246, file: !71, line: 209, column: 17)
!330 = !DILocation(line: 209, column: 30, scope: !329)
!331 = !DILocation(line: 209, column: 17, scope: !246)
!332 = !DILocation(line: 211, column: 30, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !71, line: 210, column: 13)
!334 = !DILocation(line: 211, column: 17, scope: !333)
!335 = !DILocation(line: 212, column: 13, scope: !333)
!336 = !DILocation(line: 220, column: 5, scope: !247)
!337 = !DILocation(line: 221, column: 8, scope: !338)
!338 = distinct !DILexicalBlock(scope: !238, file: !71, line: 221, column: 8)
!339 = !DILocation(line: 221, column: 8, scope: !238)
!340 = !DILocation(line: 224, column: 9, scope: !341)
!341 = distinct !DILexicalBlock(scope: !338, file: !71, line: 222, column: 5)
!342 = !DILocation(line: 225, column: 5, scope: !341)
!343 = !DILocalVariable(name: "buffer", scope: !344, file: !71, line: 229, type: !196)
!344 = distinct !DILexicalBlock(scope: !345, file: !71, line: 228, column: 9)
!345 = distinct !DILexicalBlock(scope: !338, file: !71, line: 227, column: 5)
!346 = !DILocation(line: 229, column: 17, scope: !344)
!347 = !DILocation(line: 231, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !71, line: 231, column: 17)
!349 = !DILocation(line: 231, column: 22, scope: !348)
!350 = !DILocation(line: 231, column: 27, scope: !348)
!351 = !DILocation(line: 231, column: 30, scope: !348)
!352 = !DILocation(line: 231, column: 35, scope: !348)
!353 = !DILocation(line: 231, column: 17, scope: !344)
!354 = !DILocation(line: 233, column: 37, scope: !355)
!355 = distinct !DILexicalBlock(scope: !348, file: !71, line: 232, column: 13)
!356 = !DILocation(line: 233, column: 30, scope: !355)
!357 = !DILocation(line: 233, column: 17, scope: !355)
!358 = !DILocation(line: 234, column: 13, scope: !355)
!359 = !DILocation(line: 237, column: 17, scope: !360)
!360 = distinct !DILexicalBlock(scope: !348, file: !71, line: 236, column: 13)
!361 = !DILocation(line: 241, column: 1, scope: !238)
!362 = distinct !DISubprogram(name: "goodB2G2", scope: !71, file: !71, line: 244, type: !72, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!363 = !DILocalVariable(name: "data", scope: !362, file: !71, line: 246, type: !76)
!364 = !DILocation(line: 246, column: 9, scope: !362)
!365 = !DILocation(line: 248, column: 10, scope: !362)
!366 = !DILocation(line: 249, column: 8, scope: !367)
!367 = distinct !DILexicalBlock(scope: !362, file: !71, line: 249, column: 8)
!368 = !DILocation(line: 249, column: 8, scope: !362)
!369 = !DILocalVariable(name: "recvResult", scope: !370, file: !71, line: 256, type: !76)
!370 = distinct !DILexicalBlock(scope: !371, file: !71, line: 251, column: 9)
!371 = distinct !DILexicalBlock(scope: !367, file: !71, line: 250, column: 5)
!372 = !DILocation(line: 256, column: 17, scope: !370)
!373 = !DILocalVariable(name: "service", scope: !370, file: !71, line: 257, type: !87)
!374 = !DILocation(line: 257, column: 32, scope: !370)
!375 = !DILocalVariable(name: "listenSocket", scope: !370, file: !71, line: 258, type: !76)
!376 = !DILocation(line: 258, column: 20, scope: !370)
!377 = !DILocalVariable(name: "acceptSocket", scope: !370, file: !71, line: 259, type: !76)
!378 = !DILocation(line: 259, column: 20, scope: !370)
!379 = !DILocalVariable(name: "inputBuffer", scope: !370, file: !71, line: 260, type: !60)
!380 = !DILocation(line: 260, column: 18, scope: !370)
!381 = !DILocation(line: 261, column: 13, scope: !370)
!382 = !DILocation(line: 271, column: 32, scope: !383)
!383 = distinct !DILexicalBlock(scope: !370, file: !71, line: 262, column: 13)
!384 = !DILocation(line: 271, column: 30, scope: !383)
!385 = !DILocation(line: 272, column: 21, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !71, line: 272, column: 21)
!387 = !DILocation(line: 272, column: 34, scope: !386)
!388 = !DILocation(line: 272, column: 21, scope: !383)
!389 = !DILocation(line: 274, column: 21, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !71, line: 273, column: 17)
!391 = !DILocation(line: 276, column: 17, scope: !383)
!392 = !DILocation(line: 277, column: 25, scope: !383)
!393 = !DILocation(line: 277, column: 36, scope: !383)
!394 = !DILocation(line: 278, column: 25, scope: !383)
!395 = !DILocation(line: 278, column: 34, scope: !383)
!396 = !DILocation(line: 278, column: 41, scope: !383)
!397 = !DILocation(line: 279, column: 36, scope: !383)
!398 = !DILocation(line: 279, column: 25, scope: !383)
!399 = !DILocation(line: 279, column: 34, scope: !383)
!400 = !DILocation(line: 280, column: 26, scope: !401)
!401 = distinct !DILexicalBlock(scope: !383, file: !71, line: 280, column: 21)
!402 = !DILocation(line: 280, column: 40, scope: !401)
!403 = !DILocation(line: 280, column: 21, scope: !401)
!404 = !DILocation(line: 280, column: 85, scope: !401)
!405 = !DILocation(line: 280, column: 21, scope: !383)
!406 = !DILocation(line: 282, column: 21, scope: !407)
!407 = distinct !DILexicalBlock(scope: !401, file: !71, line: 281, column: 17)
!408 = !DILocation(line: 284, column: 28, scope: !409)
!409 = distinct !DILexicalBlock(scope: !383, file: !71, line: 284, column: 21)
!410 = !DILocation(line: 284, column: 21, scope: !409)
!411 = !DILocation(line: 284, column: 58, scope: !409)
!412 = !DILocation(line: 284, column: 21, scope: !383)
!413 = !DILocation(line: 286, column: 21, scope: !414)
!414 = distinct !DILexicalBlock(scope: !409, file: !71, line: 285, column: 17)
!415 = !DILocation(line: 288, column: 39, scope: !383)
!416 = !DILocation(line: 288, column: 32, scope: !383)
!417 = !DILocation(line: 288, column: 30, scope: !383)
!418 = !DILocation(line: 289, column: 21, scope: !419)
!419 = distinct !DILexicalBlock(scope: !383, file: !71, line: 289, column: 21)
!420 = !DILocation(line: 289, column: 34, scope: !419)
!421 = !DILocation(line: 289, column: 21, scope: !383)
!422 = !DILocation(line: 291, column: 21, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !71, line: 290, column: 17)
!424 = !DILocation(line: 294, column: 35, scope: !383)
!425 = !DILocation(line: 294, column: 49, scope: !383)
!426 = !DILocation(line: 294, column: 30, scope: !383)
!427 = !DILocation(line: 294, column: 28, scope: !383)
!428 = !DILocation(line: 295, column: 21, scope: !429)
!429 = distinct !DILexicalBlock(scope: !383, file: !71, line: 295, column: 21)
!430 = !DILocation(line: 295, column: 32, scope: !429)
!431 = !DILocation(line: 295, column: 48, scope: !429)
!432 = !DILocation(line: 295, column: 51, scope: !429)
!433 = !DILocation(line: 295, column: 62, scope: !429)
!434 = !DILocation(line: 295, column: 21, scope: !383)
!435 = !DILocation(line: 297, column: 21, scope: !436)
!436 = distinct !DILexicalBlock(scope: !429, file: !71, line: 296, column: 17)
!437 = !DILocation(line: 300, column: 29, scope: !383)
!438 = !DILocation(line: 300, column: 17, scope: !383)
!439 = !DILocation(line: 300, column: 41, scope: !383)
!440 = !DILocation(line: 302, column: 29, scope: !383)
!441 = !DILocation(line: 302, column: 24, scope: !383)
!442 = !DILocation(line: 302, column: 22, scope: !383)
!443 = !DILocation(line: 303, column: 13, scope: !383)
!444 = !DILocation(line: 305, column: 17, scope: !445)
!445 = distinct !DILexicalBlock(scope: !370, file: !71, line: 305, column: 17)
!446 = !DILocation(line: 305, column: 30, scope: !445)
!447 = !DILocation(line: 305, column: 17, scope: !370)
!448 = !DILocation(line: 307, column: 30, scope: !449)
!449 = distinct !DILexicalBlock(scope: !445, file: !71, line: 306, column: 13)
!450 = !DILocation(line: 307, column: 17, scope: !449)
!451 = !DILocation(line: 308, column: 13, scope: !449)
!452 = !DILocation(line: 309, column: 17, scope: !453)
!453 = distinct !DILexicalBlock(scope: !370, file: !71, line: 309, column: 17)
!454 = !DILocation(line: 309, column: 30, scope: !453)
!455 = !DILocation(line: 309, column: 17, scope: !370)
!456 = !DILocation(line: 311, column: 30, scope: !457)
!457 = distinct !DILexicalBlock(scope: !453, file: !71, line: 310, column: 13)
!458 = !DILocation(line: 311, column: 17, scope: !457)
!459 = !DILocation(line: 312, column: 13, scope: !457)
!460 = !DILocation(line: 320, column: 5, scope: !371)
!461 = !DILocation(line: 321, column: 8, scope: !462)
!462 = distinct !DILexicalBlock(scope: !362, file: !71, line: 321, column: 8)
!463 = !DILocation(line: 321, column: 8, scope: !362)
!464 = !DILocalVariable(name: "buffer", scope: !465, file: !71, line: 324, type: !196)
!465 = distinct !DILexicalBlock(scope: !466, file: !71, line: 323, column: 9)
!466 = distinct !DILexicalBlock(scope: !462, file: !71, line: 322, column: 5)
!467 = !DILocation(line: 324, column: 17, scope: !465)
!468 = !DILocation(line: 326, column: 17, scope: !469)
!469 = distinct !DILexicalBlock(scope: !465, file: !71, line: 326, column: 17)
!470 = !DILocation(line: 326, column: 22, scope: !469)
!471 = !DILocation(line: 326, column: 27, scope: !469)
!472 = !DILocation(line: 326, column: 30, scope: !469)
!473 = !DILocation(line: 326, column: 35, scope: !469)
!474 = !DILocation(line: 326, column: 17, scope: !465)
!475 = !DILocation(line: 328, column: 37, scope: !476)
!476 = distinct !DILexicalBlock(scope: !469, file: !71, line: 327, column: 13)
!477 = !DILocation(line: 328, column: 30, scope: !476)
!478 = !DILocation(line: 328, column: 17, scope: !476)
!479 = !DILocation(line: 329, column: 13, scope: !476)
!480 = !DILocation(line: 332, column: 17, scope: !481)
!481 = distinct !DILexicalBlock(scope: !469, file: !71, line: 331, column: 13)
!482 = !DILocation(line: 335, column: 5, scope: !466)
!483 = !DILocation(line: 336, column: 1, scope: !362)
!484 = distinct !DISubprogram(name: "goodG2B1", scope: !71, file: !71, line: 339, type: !72, scopeLine: 340, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!485 = !DILocalVariable(name: "data", scope: !484, file: !71, line: 341, type: !76)
!486 = !DILocation(line: 341, column: 9, scope: !484)
!487 = !DILocation(line: 343, column: 10, scope: !484)
!488 = !DILocation(line: 344, column: 8, scope: !489)
!489 = distinct !DILexicalBlock(scope: !484, file: !71, line: 344, column: 8)
!490 = !DILocation(line: 344, column: 8, scope: !484)
!491 = !DILocation(line: 347, column: 9, scope: !492)
!492 = distinct !DILexicalBlock(scope: !489, file: !71, line: 345, column: 5)
!493 = !DILocation(line: 348, column: 5, scope: !492)
!494 = !DILocation(line: 353, column: 14, scope: !495)
!495 = distinct !DILexicalBlock(scope: !489, file: !71, line: 350, column: 5)
!496 = !DILocation(line: 355, column: 8, scope: !497)
!497 = distinct !DILexicalBlock(scope: !484, file: !71, line: 355, column: 8)
!498 = !DILocation(line: 355, column: 8, scope: !484)
!499 = !DILocalVariable(name: "buffer", scope: !500, file: !71, line: 358, type: !196)
!500 = distinct !DILexicalBlock(scope: !501, file: !71, line: 357, column: 9)
!501 = distinct !DILexicalBlock(scope: !497, file: !71, line: 356, column: 5)
!502 = !DILocation(line: 358, column: 17, scope: !500)
!503 = !DILocation(line: 361, column: 17, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !71, line: 361, column: 17)
!505 = !DILocation(line: 361, column: 22, scope: !504)
!506 = !DILocation(line: 361, column: 17, scope: !500)
!507 = !DILocation(line: 363, column: 37, scope: !508)
!508 = distinct !DILexicalBlock(scope: !504, file: !71, line: 362, column: 13)
!509 = !DILocation(line: 363, column: 30, scope: !508)
!510 = !DILocation(line: 363, column: 17, scope: !508)
!511 = !DILocation(line: 364, column: 13, scope: !508)
!512 = !DILocation(line: 367, column: 17, scope: !513)
!513 = distinct !DILexicalBlock(scope: !504, file: !71, line: 366, column: 13)
!514 = !DILocation(line: 370, column: 5, scope: !501)
!515 = !DILocation(line: 371, column: 1, scope: !484)
!516 = distinct !DISubprogram(name: "goodG2B2", scope: !71, file: !71, line: 374, type: !72, scopeLine: 375, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!517 = !DILocalVariable(name: "data", scope: !516, file: !71, line: 376, type: !76)
!518 = !DILocation(line: 376, column: 9, scope: !516)
!519 = !DILocation(line: 378, column: 10, scope: !516)
!520 = !DILocation(line: 379, column: 8, scope: !521)
!521 = distinct !DILexicalBlock(scope: !516, file: !71, line: 379, column: 8)
!522 = !DILocation(line: 379, column: 8, scope: !516)
!523 = !DILocation(line: 383, column: 14, scope: !524)
!524 = distinct !DILexicalBlock(scope: !521, file: !71, line: 380, column: 5)
!525 = !DILocation(line: 384, column: 5, scope: !524)
!526 = !DILocation(line: 385, column: 8, scope: !527)
!527 = distinct !DILexicalBlock(scope: !516, file: !71, line: 385, column: 8)
!528 = !DILocation(line: 385, column: 8, scope: !516)
!529 = !DILocalVariable(name: "buffer", scope: !530, file: !71, line: 388, type: !196)
!530 = distinct !DILexicalBlock(scope: !531, file: !71, line: 387, column: 9)
!531 = distinct !DILexicalBlock(scope: !527, file: !71, line: 386, column: 5)
!532 = !DILocation(line: 388, column: 17, scope: !530)
!533 = !DILocation(line: 391, column: 17, scope: !534)
!534 = distinct !DILexicalBlock(scope: !530, file: !71, line: 391, column: 17)
!535 = !DILocation(line: 391, column: 22, scope: !534)
!536 = !DILocation(line: 391, column: 17, scope: !530)
!537 = !DILocation(line: 393, column: 37, scope: !538)
!538 = distinct !DILexicalBlock(scope: !534, file: !71, line: 392, column: 13)
!539 = !DILocation(line: 393, column: 30, scope: !538)
!540 = !DILocation(line: 393, column: 17, scope: !538)
!541 = !DILocation(line: 394, column: 13, scope: !538)
!542 = !DILocation(line: 397, column: 17, scope: !543)
!543 = distinct !DILexicalBlock(scope: !534, file: !71, line: 396, column: 13)
!544 = !DILocation(line: 400, column: 5, scope: !531)
!545 = !DILocation(line: 401, column: 1, scope: !516)
