; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_12_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  %buffer47 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

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
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !111
  store i32 %call1, i32* %listenSocket, align 4, !dbg !113
  %0 = load i32, i32* %listenSocket, align 4, !dbg !114
  %cmp = icmp eq i32 %0, -1, !dbg !116
  br i1 %cmp, label %if.then2, label %if.end, !dbg !117

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !118

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !120
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !121
  store i16 2, i16* %sin_family, align 4, !dbg !122
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !123
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !124
  store i32 0, i32* %s_addr, align 4, !dbg !125
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !126
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !127
  store i16 %call3, i16* %sin_port, align 2, !dbg !128
  %2 = load i32, i32* %listenSocket, align 4, !dbg !129
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !131
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !132
  %cmp5 = icmp eq i32 %call4, -1, !dbg !133
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !134

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !135

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !137
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !139
  %cmp9 = icmp eq i32 %call8, -1, !dbg !140
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !141

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !142

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !144
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !145
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !146
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !147
  %cmp13 = icmp eq i32 %6, -1, !dbg !149
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !150

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !151

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !153
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !154
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !155
  %conv = trunc i64 %call16 to i32, !dbg !155
  store i32 %conv, i32* %recvResult, align 4, !dbg !156
  %8 = load i32, i32* %recvResult, align 4, !dbg !157
  %cmp17 = icmp eq i32 %8, -1, !dbg !159
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !160

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !161
  %cmp19 = icmp eq i32 %9, 0, !dbg !162
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !163

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !164

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !166
  %idxprom = sext i32 %10 to i64, !dbg !167
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !169
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !170
  store i32 %call24, i32* %data, align 4, !dbg !171
  br label %do.end, !dbg !172

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !173
  %cmp25 = icmp ne i32 %11, -1, !dbg !175
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !176

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !177
  %call28 = call i32 @close(i32 %12), !dbg !179
  br label %if.end29, !dbg !180

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !181
  %cmp30 = icmp ne i32 %13, -1, !dbg !183
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !184

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !185
  %call33 = call i32 @close(i32 %14), !dbg !187
  br label %if.end34, !dbg !188

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !189

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !190
  br label %if.end35

if.end35:                                         ; preds = %if.else, %if.end34
  %call36 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !192
  %tobool37 = icmp ne i32 %call36, 0, !dbg !192
  br i1 %tobool37, label %if.then38, label %if.else46, !dbg !194

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !195, metadata !DIExpression()), !dbg !201
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !201
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !201
  %16 = load i32, i32* %data, align 4, !dbg !202
  %cmp39 = icmp sge i32 %16, 0, !dbg !204
  br i1 %cmp39, label %if.then41, label %if.else44, !dbg !205

if.then41:                                        ; preds = %if.then38
  %17 = load i32, i32* %data, align 4, !dbg !206
  %idxprom42 = sext i32 %17 to i64, !dbg !208
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !208
  %18 = load i32, i32* %arrayidx43, align 4, !dbg !208
  call void @printIntLine(i32 %18), !dbg !209
  br label %if.end45, !dbg !210

if.else44:                                        ; preds = %if.then38
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !211
  br label %if.end45

if.end45:                                         ; preds = %if.else44, %if.then41
  br label %if.end57, !dbg !213

if.else46:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer47, metadata !214, metadata !DIExpression()), !dbg !217
  %19 = bitcast [10 x i32]* %buffer47 to i8*, !dbg !217
  call void @llvm.memset.p0i8.i64(i8* align 16 %19, i8 0, i64 40, i1 false), !dbg !217
  %20 = load i32, i32* %data, align 4, !dbg !218
  %cmp48 = icmp sge i32 %20, 0, !dbg !220
  br i1 %cmp48, label %land.lhs.true, label %if.else55, !dbg !221

land.lhs.true:                                    ; preds = %if.else46
  %21 = load i32, i32* %data, align 4, !dbg !222
  %cmp50 = icmp slt i32 %21, 10, !dbg !223
  br i1 %cmp50, label %if.then52, label %if.else55, !dbg !224

if.then52:                                        ; preds = %land.lhs.true
  %22 = load i32, i32* %data, align 4, !dbg !225
  %idxprom53 = sext i32 %22 to i64, !dbg !227
  %arrayidx54 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer47, i64 0, i64 %idxprom53, !dbg !227
  %23 = load i32, i32* %arrayidx54, align 4, !dbg !227
  call void @printIntLine(i32 %23), !dbg !228
  br label %if.end56, !dbg !229

if.else55:                                        ; preds = %land.lhs.true, %if.else46
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !230
  br label %if.end56

if.end56:                                         ; preds = %if.else55, %if.then52
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.end45
  ret void, !dbg !232
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #5

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #3

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #3

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #2

declare dso_local i64 @recv(i32, i8*, i64, i32) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #2

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_12_good() #0 !dbg !233 {
entry:
  call void @goodB2G(), !dbg !234
  call void @goodG2B(), !dbg !235
  ret void, !dbg !236
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !237 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !242, metadata !DIExpression()), !dbg !243
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !244, metadata !DIExpression()), !dbg !245
  %call = call i64 @time(i64* null) #7, !dbg !246
  %conv = trunc i64 %call to i32, !dbg !247
  call void @srand(i32 %conv) #7, !dbg !248
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !249
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_12_good(), !dbg !250
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !251
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !252
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_12_bad(), !dbg !253
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !254
  ret i32 0, !dbg !255
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !256 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %recvResult35 = alloca i32, align 4
  %service36 = alloca %struct.sockaddr_in, align 4
  %listenSocket37 = alloca i32, align 4
  %acceptSocket38 = alloca i32, align 4
  %inputBuffer39 = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  %buffer105 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !257, metadata !DIExpression()), !dbg !258
  store i32 -1, i32* %data, align 4, !dbg !259
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !260
  %tobool = icmp ne i32 %call, 0, !dbg !260
  br i1 %tobool, label %if.then, label %if.else, !dbg !262

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !263, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !267, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !269, metadata !DIExpression()), !dbg !270
  store i32 -1, i32* %listenSocket, align 4, !dbg !270
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !271, metadata !DIExpression()), !dbg !272
  store i32 -1, i32* %acceptSocket, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !273, metadata !DIExpression()), !dbg !274
  br label %do.body, !dbg !275

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !276
  store i32 %call1, i32* %listenSocket, align 4, !dbg !278
  %0 = load i32, i32* %listenSocket, align 4, !dbg !279
  %cmp = icmp eq i32 %0, -1, !dbg !281
  br i1 %cmp, label %if.then2, label %if.end, !dbg !282

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !283

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !285
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !285
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !286
  store i16 2, i16* %sin_family, align 4, !dbg !287
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !288
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !289
  store i32 0, i32* %s_addr, align 4, !dbg !290
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !291
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !292
  store i16 %call3, i16* %sin_port, align 2, !dbg !293
  %2 = load i32, i32* %listenSocket, align 4, !dbg !294
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !296
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !297
  %cmp5 = icmp eq i32 %call4, -1, !dbg !298
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !299

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !300

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !302
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !304
  %cmp9 = icmp eq i32 %call8, -1, !dbg !305
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !306

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !307

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !309
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !310
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !311
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !312
  %cmp13 = icmp eq i32 %6, -1, !dbg !314
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !315

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !316

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !318
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !319
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !320
  %conv = trunc i64 %call16 to i32, !dbg !320
  store i32 %conv, i32* %recvResult, align 4, !dbg !321
  %8 = load i32, i32* %recvResult, align 4, !dbg !322
  %cmp17 = icmp eq i32 %8, -1, !dbg !324
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !325

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !326
  %cmp19 = icmp eq i32 %9, 0, !dbg !327
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !328

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !329

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !331
  %idxprom = sext i32 %10 to i64, !dbg !332
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !332
  store i8 0, i8* %arrayidx, align 1, !dbg !333
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !334
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !335
  store i32 %call24, i32* %data, align 4, !dbg !336
  br label %do.end, !dbg !337

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !338
  %cmp25 = icmp ne i32 %11, -1, !dbg !340
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !341

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !342
  %call28 = call i32 @close(i32 %12), !dbg !344
  br label %if.end29, !dbg !345

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !346
  %cmp30 = icmp ne i32 %13, -1, !dbg !348
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !349

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !350
  %call33 = call i32 @close(i32 %14), !dbg !352
  br label %if.end34, !dbg !353

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end91, !dbg !354

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult35, metadata !355, metadata !DIExpression()), !dbg !358
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service36, metadata !359, metadata !DIExpression()), !dbg !360
  call void @llvm.dbg.declare(metadata i32* %listenSocket37, metadata !361, metadata !DIExpression()), !dbg !362
  store i32 -1, i32* %listenSocket37, align 4, !dbg !362
  call void @llvm.dbg.declare(metadata i32* %acceptSocket38, metadata !363, metadata !DIExpression()), !dbg !364
  store i32 -1, i32* %acceptSocket38, align 4, !dbg !364
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer39, metadata !365, metadata !DIExpression()), !dbg !366
  br label %do.body40, !dbg !367

do.body40:                                        ; preds = %if.else
  %call41 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !368
  store i32 %call41, i32* %listenSocket37, align 4, !dbg !370
  %15 = load i32, i32* %listenSocket37, align 4, !dbg !371
  %cmp42 = icmp eq i32 %15, -1, !dbg !373
  br i1 %cmp42, label %if.then44, label %if.end45, !dbg !374

if.then44:                                        ; preds = %do.body40
  br label %do.end80, !dbg !375

if.end45:                                         ; preds = %do.body40
  %16 = bitcast %struct.sockaddr_in* %service36 to i8*, !dbg !377
  call void @llvm.memset.p0i8.i64(i8* align 4 %16, i8 0, i64 16, i1 false), !dbg !377
  %sin_family46 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service36, i32 0, i32 0, !dbg !378
  store i16 2, i16* %sin_family46, align 4, !dbg !379
  %sin_addr47 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service36, i32 0, i32 2, !dbg !380
  %s_addr48 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr47, i32 0, i32 0, !dbg !381
  store i32 0, i32* %s_addr48, align 4, !dbg !382
  %call49 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !383
  %sin_port50 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service36, i32 0, i32 1, !dbg !384
  store i16 %call49, i16* %sin_port50, align 2, !dbg !385
  %17 = load i32, i32* %listenSocket37, align 4, !dbg !386
  %18 = bitcast %struct.sockaddr_in* %service36 to %struct.sockaddr*, !dbg !388
  %call51 = call i32 @bind(i32 %17, %struct.sockaddr* %18, i32 16) #7, !dbg !389
  %cmp52 = icmp eq i32 %call51, -1, !dbg !390
  br i1 %cmp52, label %if.then54, label %if.end55, !dbg !391

if.then54:                                        ; preds = %if.end45
  br label %do.end80, !dbg !392

if.end55:                                         ; preds = %if.end45
  %19 = load i32, i32* %listenSocket37, align 4, !dbg !394
  %call56 = call i32 @listen(i32 %19, i32 5) #7, !dbg !396
  %cmp57 = icmp eq i32 %call56, -1, !dbg !397
  br i1 %cmp57, label %if.then59, label %if.end60, !dbg !398

if.then59:                                        ; preds = %if.end55
  br label %do.end80, !dbg !399

if.end60:                                         ; preds = %if.end55
  %20 = load i32, i32* %listenSocket37, align 4, !dbg !401
  %call61 = call i32 @accept(i32 %20, %struct.sockaddr* null, i32* null), !dbg !402
  store i32 %call61, i32* %acceptSocket38, align 4, !dbg !403
  %21 = load i32, i32* %acceptSocket38, align 4, !dbg !404
  %cmp62 = icmp eq i32 %21, -1, !dbg !406
  br i1 %cmp62, label %if.then64, label %if.end65, !dbg !407

if.then64:                                        ; preds = %if.end60
  br label %do.end80, !dbg !408

if.end65:                                         ; preds = %if.end60
  %22 = load i32, i32* %acceptSocket38, align 4, !dbg !410
  %arraydecay66 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer39, i64 0, i64 0, !dbg !411
  %call67 = call i64 @recv(i32 %22, i8* %arraydecay66, i64 13, i32 0), !dbg !412
  %conv68 = trunc i64 %call67 to i32, !dbg !412
  store i32 %conv68, i32* %recvResult35, align 4, !dbg !413
  %23 = load i32, i32* %recvResult35, align 4, !dbg !414
  %cmp69 = icmp eq i32 %23, -1, !dbg !416
  br i1 %cmp69, label %if.then74, label %lor.lhs.false71, !dbg !417

lor.lhs.false71:                                  ; preds = %if.end65
  %24 = load i32, i32* %recvResult35, align 4, !dbg !418
  %cmp72 = icmp eq i32 %24, 0, !dbg !419
  br i1 %cmp72, label %if.then74, label %if.end75, !dbg !420

if.then74:                                        ; preds = %lor.lhs.false71, %if.end65
  br label %do.end80, !dbg !421

if.end75:                                         ; preds = %lor.lhs.false71
  %25 = load i32, i32* %recvResult35, align 4, !dbg !423
  %idxprom76 = sext i32 %25 to i64, !dbg !424
  %arrayidx77 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer39, i64 0, i64 %idxprom76, !dbg !424
  store i8 0, i8* %arrayidx77, align 1, !dbg !425
  %arraydecay78 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer39, i64 0, i64 0, !dbg !426
  %call79 = call i32 @atoi(i8* %arraydecay78) #9, !dbg !427
  store i32 %call79, i32* %data, align 4, !dbg !428
  br label %do.end80, !dbg !429

do.end80:                                         ; preds = %if.end75, %if.then74, %if.then64, %if.then59, %if.then54, %if.then44
  %26 = load i32, i32* %listenSocket37, align 4, !dbg !430
  %cmp81 = icmp ne i32 %26, -1, !dbg !432
  br i1 %cmp81, label %if.then83, label %if.end85, !dbg !433

if.then83:                                        ; preds = %do.end80
  %27 = load i32, i32* %listenSocket37, align 4, !dbg !434
  %call84 = call i32 @close(i32 %27), !dbg !436
  br label %if.end85, !dbg !437

if.end85:                                         ; preds = %if.then83, %do.end80
  %28 = load i32, i32* %acceptSocket38, align 4, !dbg !438
  %cmp86 = icmp ne i32 %28, -1, !dbg !440
  br i1 %cmp86, label %if.then88, label %if.end90, !dbg !441

if.then88:                                        ; preds = %if.end85
  %29 = load i32, i32* %acceptSocket38, align 4, !dbg !442
  %call89 = call i32 @close(i32 %29), !dbg !444
  br label %if.end90, !dbg !445

if.end90:                                         ; preds = %if.then88, %if.end85
  br label %if.end91

if.end91:                                         ; preds = %if.end90, %if.end34
  %call92 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !446
  %tobool93 = icmp ne i32 %call92, 0, !dbg !446
  br i1 %tobool93, label %if.then94, label %if.else104, !dbg !448

if.then94:                                        ; preds = %if.end91
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !449, metadata !DIExpression()), !dbg !452
  %30 = bitcast [10 x i32]* %buffer to i8*, !dbg !452
  call void @llvm.memset.p0i8.i64(i8* align 16 %30, i8 0, i64 40, i1 false), !dbg !452
  %31 = load i32, i32* %data, align 4, !dbg !453
  %cmp95 = icmp sge i32 %31, 0, !dbg !455
  br i1 %cmp95, label %land.lhs.true, label %if.else102, !dbg !456

land.lhs.true:                                    ; preds = %if.then94
  %32 = load i32, i32* %data, align 4, !dbg !457
  %cmp97 = icmp slt i32 %32, 10, !dbg !458
  br i1 %cmp97, label %if.then99, label %if.else102, !dbg !459

if.then99:                                        ; preds = %land.lhs.true
  %33 = load i32, i32* %data, align 4, !dbg !460
  %idxprom100 = sext i32 %33 to i64, !dbg !462
  %arrayidx101 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom100, !dbg !462
  %34 = load i32, i32* %arrayidx101, align 4, !dbg !462
  call void @printIntLine(i32 %34), !dbg !463
  br label %if.end103, !dbg !464

if.else102:                                       ; preds = %land.lhs.true, %if.then94
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !465
  br label %if.end103

if.end103:                                        ; preds = %if.else102, %if.then99
  br label %if.end116, !dbg !467

if.else104:                                       ; preds = %if.end91
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer105, metadata !468, metadata !DIExpression()), !dbg !471
  %35 = bitcast [10 x i32]* %buffer105 to i8*, !dbg !471
  call void @llvm.memset.p0i8.i64(i8* align 16 %35, i8 0, i64 40, i1 false), !dbg !471
  %36 = load i32, i32* %data, align 4, !dbg !472
  %cmp106 = icmp sge i32 %36, 0, !dbg !474
  br i1 %cmp106, label %land.lhs.true108, label %if.else114, !dbg !475

land.lhs.true108:                                 ; preds = %if.else104
  %37 = load i32, i32* %data, align 4, !dbg !476
  %cmp109 = icmp slt i32 %37, 10, !dbg !477
  br i1 %cmp109, label %if.then111, label %if.else114, !dbg !478

if.then111:                                       ; preds = %land.lhs.true108
  %38 = load i32, i32* %data, align 4, !dbg !479
  %idxprom112 = sext i32 %38 to i64, !dbg !481
  %arrayidx113 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer105, i64 0, i64 %idxprom112, !dbg !481
  %39 = load i32, i32* %arrayidx113, align 4, !dbg !481
  call void @printIntLine(i32 %39), !dbg !482
  br label %if.end115, !dbg !483

if.else114:                                       ; preds = %land.lhs.true108, %if.else104
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !484
  br label %if.end115

if.end115:                                        ; preds = %if.else114, %if.then111
  br label %if.end116

if.end116:                                        ; preds = %if.end115, %if.end103
  ret void, !dbg !486
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !487 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer8 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !488, metadata !DIExpression()), !dbg !489
  store i32 -1, i32* %data, align 4, !dbg !490
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !491
  %tobool = icmp ne i32 %call, 0, !dbg !491
  br i1 %tobool, label %if.then, label %if.else, !dbg !493

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !494
  br label %if.end, !dbg !496

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !497
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !499
  %tobool2 = icmp ne i32 %call1, 0, !dbg !499
  br i1 %tobool2, label %if.then3, label %if.else7, !dbg !501

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !502, metadata !DIExpression()), !dbg !505
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !505
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !505
  %1 = load i32, i32* %data, align 4, !dbg !506
  %cmp = icmp sge i32 %1, 0, !dbg !508
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !509

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !510
  %idxprom = sext i32 %2 to i64, !dbg !512
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !512
  %3 = load i32, i32* %arrayidx, align 4, !dbg !512
  call void @printIntLine(i32 %3), !dbg !513
  br label %if.end6, !dbg !514

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !515
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end15, !dbg !517

if.else7:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer8, metadata !518, metadata !DIExpression()), !dbg !521
  %4 = bitcast [10 x i32]* %buffer8 to i8*, !dbg !521
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !521
  %5 = load i32, i32* %data, align 4, !dbg !522
  %cmp9 = icmp sge i32 %5, 0, !dbg !524
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !525

if.then10:                                        ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !526
  %idxprom11 = sext i32 %6 to i64, !dbg !528
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer8, i64 0, i64 %idxprom11, !dbg !528
  %7 = load i32, i32* %arrayidx12, align 4, !dbg !528
  call void @printIntLine(i32 %7), !dbg !529
  br label %if.end14, !dbg !530

if.else13:                                        ; preds = %if.else7
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !531
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end6
  ret void, !dbg !533
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
!llvm.module.flags = !{!64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_12_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!190 = !DILocation(line: 125, column: 14, scope: !191)
!191 = distinct !DILexicalBlock(scope: !80, file: !71, line: 122, column: 5)
!192 = !DILocation(line: 127, column: 8, scope: !193)
!193 = distinct !DILexicalBlock(scope: !70, file: !71, line: 127, column: 8)
!194 = !DILocation(line: 127, column: 8, scope: !70)
!195 = !DILocalVariable(name: "buffer", scope: !196, file: !71, line: 130, type: !198)
!196 = distinct !DILexicalBlock(scope: !197, file: !71, line: 129, column: 9)
!197 = distinct !DILexicalBlock(scope: !193, file: !71, line: 128, column: 5)
!198 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !199)
!199 = !{!200}
!200 = !DISubrange(count: 10)
!201 = !DILocation(line: 130, column: 17, scope: !196)
!202 = !DILocation(line: 133, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !196, file: !71, line: 133, column: 17)
!204 = !DILocation(line: 133, column: 22, scope: !203)
!205 = !DILocation(line: 133, column: 17, scope: !196)
!206 = !DILocation(line: 135, column: 37, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !71, line: 134, column: 13)
!208 = !DILocation(line: 135, column: 30, scope: !207)
!209 = !DILocation(line: 135, column: 17, scope: !207)
!210 = !DILocation(line: 136, column: 13, scope: !207)
!211 = !DILocation(line: 139, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !203, file: !71, line: 138, column: 13)
!213 = !DILocation(line: 142, column: 5, scope: !197)
!214 = !DILocalVariable(name: "buffer", scope: !215, file: !71, line: 146, type: !198)
!215 = distinct !DILexicalBlock(scope: !216, file: !71, line: 145, column: 9)
!216 = distinct !DILexicalBlock(scope: !193, file: !71, line: 144, column: 5)
!217 = !DILocation(line: 146, column: 17, scope: !215)
!218 = !DILocation(line: 148, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !71, line: 148, column: 17)
!220 = !DILocation(line: 148, column: 22, scope: !219)
!221 = !DILocation(line: 148, column: 27, scope: !219)
!222 = !DILocation(line: 148, column: 30, scope: !219)
!223 = !DILocation(line: 148, column: 35, scope: !219)
!224 = !DILocation(line: 148, column: 17, scope: !215)
!225 = !DILocation(line: 150, column: 37, scope: !226)
!226 = distinct !DILexicalBlock(scope: !219, file: !71, line: 149, column: 13)
!227 = !DILocation(line: 150, column: 30, scope: !226)
!228 = !DILocation(line: 150, column: 17, scope: !226)
!229 = !DILocation(line: 151, column: 13, scope: !226)
!230 = !DILocation(line: 154, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !219, file: !71, line: 153, column: 13)
!232 = !DILocation(line: 158, column: 1, scope: !70)
!233 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_12_good", scope: !71, file: !71, line: 402, type: !72, scopeLine: 403, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!234 = !DILocation(line: 404, column: 5, scope: !233)
!235 = !DILocation(line: 405, column: 5, scope: !233)
!236 = !DILocation(line: 406, column: 1, scope: !233)
!237 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 417, type: !238, scopeLine: 418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!238 = !DISubroutineType(types: !239)
!239 = !{!76, !76, !240}
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !241, size: 64)
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!242 = !DILocalVariable(name: "argc", arg: 1, scope: !237, file: !71, line: 417, type: !76)
!243 = !DILocation(line: 417, column: 14, scope: !237)
!244 = !DILocalVariable(name: "argv", arg: 2, scope: !237, file: !71, line: 417, type: !240)
!245 = !DILocation(line: 417, column: 27, scope: !237)
!246 = !DILocation(line: 420, column: 22, scope: !237)
!247 = !DILocation(line: 420, column: 12, scope: !237)
!248 = !DILocation(line: 420, column: 5, scope: !237)
!249 = !DILocation(line: 422, column: 5, scope: !237)
!250 = !DILocation(line: 423, column: 5, scope: !237)
!251 = !DILocation(line: 424, column: 5, scope: !237)
!252 = !DILocation(line: 427, column: 5, scope: !237)
!253 = !DILocation(line: 428, column: 5, scope: !237)
!254 = !DILocation(line: 429, column: 5, scope: !237)
!255 = !DILocation(line: 431, column: 5, scope: !237)
!256 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 167, type: !72, scopeLine: 168, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!257 = !DILocalVariable(name: "data", scope: !256, file: !71, line: 169, type: !76)
!258 = !DILocation(line: 169, column: 9, scope: !256)
!259 = !DILocation(line: 171, column: 10, scope: !256)
!260 = !DILocation(line: 172, column: 8, scope: !261)
!261 = distinct !DILexicalBlock(scope: !256, file: !71, line: 172, column: 8)
!262 = !DILocation(line: 172, column: 8, scope: !256)
!263 = !DILocalVariable(name: "recvResult", scope: !264, file: !71, line: 179, type: !76)
!264 = distinct !DILexicalBlock(scope: !265, file: !71, line: 174, column: 9)
!265 = distinct !DILexicalBlock(scope: !261, file: !71, line: 173, column: 5)
!266 = !DILocation(line: 179, column: 17, scope: !264)
!267 = !DILocalVariable(name: "service", scope: !264, file: !71, line: 180, type: !87)
!268 = !DILocation(line: 180, column: 32, scope: !264)
!269 = !DILocalVariable(name: "listenSocket", scope: !264, file: !71, line: 181, type: !76)
!270 = !DILocation(line: 181, column: 20, scope: !264)
!271 = !DILocalVariable(name: "acceptSocket", scope: !264, file: !71, line: 182, type: !76)
!272 = !DILocation(line: 182, column: 20, scope: !264)
!273 = !DILocalVariable(name: "inputBuffer", scope: !264, file: !71, line: 183, type: !60)
!274 = !DILocation(line: 183, column: 18, scope: !264)
!275 = !DILocation(line: 184, column: 13, scope: !264)
!276 = !DILocation(line: 194, column: 32, scope: !277)
!277 = distinct !DILexicalBlock(scope: !264, file: !71, line: 185, column: 13)
!278 = !DILocation(line: 194, column: 30, scope: !277)
!279 = !DILocation(line: 195, column: 21, scope: !280)
!280 = distinct !DILexicalBlock(scope: !277, file: !71, line: 195, column: 21)
!281 = !DILocation(line: 195, column: 34, scope: !280)
!282 = !DILocation(line: 195, column: 21, scope: !277)
!283 = !DILocation(line: 197, column: 21, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !71, line: 196, column: 17)
!285 = !DILocation(line: 199, column: 17, scope: !277)
!286 = !DILocation(line: 200, column: 25, scope: !277)
!287 = !DILocation(line: 200, column: 36, scope: !277)
!288 = !DILocation(line: 201, column: 25, scope: !277)
!289 = !DILocation(line: 201, column: 34, scope: !277)
!290 = !DILocation(line: 201, column: 41, scope: !277)
!291 = !DILocation(line: 202, column: 36, scope: !277)
!292 = !DILocation(line: 202, column: 25, scope: !277)
!293 = !DILocation(line: 202, column: 34, scope: !277)
!294 = !DILocation(line: 203, column: 26, scope: !295)
!295 = distinct !DILexicalBlock(scope: !277, file: !71, line: 203, column: 21)
!296 = !DILocation(line: 203, column: 40, scope: !295)
!297 = !DILocation(line: 203, column: 21, scope: !295)
!298 = !DILocation(line: 203, column: 85, scope: !295)
!299 = !DILocation(line: 203, column: 21, scope: !277)
!300 = !DILocation(line: 205, column: 21, scope: !301)
!301 = distinct !DILexicalBlock(scope: !295, file: !71, line: 204, column: 17)
!302 = !DILocation(line: 207, column: 28, scope: !303)
!303 = distinct !DILexicalBlock(scope: !277, file: !71, line: 207, column: 21)
!304 = !DILocation(line: 207, column: 21, scope: !303)
!305 = !DILocation(line: 207, column: 58, scope: !303)
!306 = !DILocation(line: 207, column: 21, scope: !277)
!307 = !DILocation(line: 209, column: 21, scope: !308)
!308 = distinct !DILexicalBlock(scope: !303, file: !71, line: 208, column: 17)
!309 = !DILocation(line: 211, column: 39, scope: !277)
!310 = !DILocation(line: 211, column: 32, scope: !277)
!311 = !DILocation(line: 211, column: 30, scope: !277)
!312 = !DILocation(line: 212, column: 21, scope: !313)
!313 = distinct !DILexicalBlock(scope: !277, file: !71, line: 212, column: 21)
!314 = !DILocation(line: 212, column: 34, scope: !313)
!315 = !DILocation(line: 212, column: 21, scope: !277)
!316 = !DILocation(line: 214, column: 21, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !71, line: 213, column: 17)
!318 = !DILocation(line: 217, column: 35, scope: !277)
!319 = !DILocation(line: 217, column: 49, scope: !277)
!320 = !DILocation(line: 217, column: 30, scope: !277)
!321 = !DILocation(line: 217, column: 28, scope: !277)
!322 = !DILocation(line: 218, column: 21, scope: !323)
!323 = distinct !DILexicalBlock(scope: !277, file: !71, line: 218, column: 21)
!324 = !DILocation(line: 218, column: 32, scope: !323)
!325 = !DILocation(line: 218, column: 48, scope: !323)
!326 = !DILocation(line: 218, column: 51, scope: !323)
!327 = !DILocation(line: 218, column: 62, scope: !323)
!328 = !DILocation(line: 218, column: 21, scope: !277)
!329 = !DILocation(line: 220, column: 21, scope: !330)
!330 = distinct !DILexicalBlock(scope: !323, file: !71, line: 219, column: 17)
!331 = !DILocation(line: 223, column: 29, scope: !277)
!332 = !DILocation(line: 223, column: 17, scope: !277)
!333 = !DILocation(line: 223, column: 41, scope: !277)
!334 = !DILocation(line: 225, column: 29, scope: !277)
!335 = !DILocation(line: 225, column: 24, scope: !277)
!336 = !DILocation(line: 225, column: 22, scope: !277)
!337 = !DILocation(line: 226, column: 13, scope: !277)
!338 = !DILocation(line: 228, column: 17, scope: !339)
!339 = distinct !DILexicalBlock(scope: !264, file: !71, line: 228, column: 17)
!340 = !DILocation(line: 228, column: 30, scope: !339)
!341 = !DILocation(line: 228, column: 17, scope: !264)
!342 = !DILocation(line: 230, column: 30, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !71, line: 229, column: 13)
!344 = !DILocation(line: 230, column: 17, scope: !343)
!345 = !DILocation(line: 231, column: 13, scope: !343)
!346 = !DILocation(line: 232, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !264, file: !71, line: 232, column: 17)
!348 = !DILocation(line: 232, column: 30, scope: !347)
!349 = !DILocation(line: 232, column: 17, scope: !264)
!350 = !DILocation(line: 234, column: 30, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !71, line: 233, column: 13)
!352 = !DILocation(line: 234, column: 17, scope: !351)
!353 = !DILocation(line: 235, column: 13, scope: !351)
!354 = !DILocation(line: 243, column: 5, scope: !265)
!355 = !DILocalVariable(name: "recvResult", scope: !356, file: !71, line: 251, type: !76)
!356 = distinct !DILexicalBlock(scope: !357, file: !71, line: 246, column: 9)
!357 = distinct !DILexicalBlock(scope: !261, file: !71, line: 245, column: 5)
!358 = !DILocation(line: 251, column: 17, scope: !356)
!359 = !DILocalVariable(name: "service", scope: !356, file: !71, line: 252, type: !87)
!360 = !DILocation(line: 252, column: 32, scope: !356)
!361 = !DILocalVariable(name: "listenSocket", scope: !356, file: !71, line: 253, type: !76)
!362 = !DILocation(line: 253, column: 20, scope: !356)
!363 = !DILocalVariable(name: "acceptSocket", scope: !356, file: !71, line: 254, type: !76)
!364 = !DILocation(line: 254, column: 20, scope: !356)
!365 = !DILocalVariable(name: "inputBuffer", scope: !356, file: !71, line: 255, type: !60)
!366 = !DILocation(line: 255, column: 18, scope: !356)
!367 = !DILocation(line: 256, column: 13, scope: !356)
!368 = !DILocation(line: 266, column: 32, scope: !369)
!369 = distinct !DILexicalBlock(scope: !356, file: !71, line: 257, column: 13)
!370 = !DILocation(line: 266, column: 30, scope: !369)
!371 = !DILocation(line: 267, column: 21, scope: !372)
!372 = distinct !DILexicalBlock(scope: !369, file: !71, line: 267, column: 21)
!373 = !DILocation(line: 267, column: 34, scope: !372)
!374 = !DILocation(line: 267, column: 21, scope: !369)
!375 = !DILocation(line: 269, column: 21, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !71, line: 268, column: 17)
!377 = !DILocation(line: 271, column: 17, scope: !369)
!378 = !DILocation(line: 272, column: 25, scope: !369)
!379 = !DILocation(line: 272, column: 36, scope: !369)
!380 = !DILocation(line: 273, column: 25, scope: !369)
!381 = !DILocation(line: 273, column: 34, scope: !369)
!382 = !DILocation(line: 273, column: 41, scope: !369)
!383 = !DILocation(line: 274, column: 36, scope: !369)
!384 = !DILocation(line: 274, column: 25, scope: !369)
!385 = !DILocation(line: 274, column: 34, scope: !369)
!386 = !DILocation(line: 275, column: 26, scope: !387)
!387 = distinct !DILexicalBlock(scope: !369, file: !71, line: 275, column: 21)
!388 = !DILocation(line: 275, column: 40, scope: !387)
!389 = !DILocation(line: 275, column: 21, scope: !387)
!390 = !DILocation(line: 275, column: 85, scope: !387)
!391 = !DILocation(line: 275, column: 21, scope: !369)
!392 = !DILocation(line: 277, column: 21, scope: !393)
!393 = distinct !DILexicalBlock(scope: !387, file: !71, line: 276, column: 17)
!394 = !DILocation(line: 279, column: 28, scope: !395)
!395 = distinct !DILexicalBlock(scope: !369, file: !71, line: 279, column: 21)
!396 = !DILocation(line: 279, column: 21, scope: !395)
!397 = !DILocation(line: 279, column: 58, scope: !395)
!398 = !DILocation(line: 279, column: 21, scope: !369)
!399 = !DILocation(line: 281, column: 21, scope: !400)
!400 = distinct !DILexicalBlock(scope: !395, file: !71, line: 280, column: 17)
!401 = !DILocation(line: 283, column: 39, scope: !369)
!402 = !DILocation(line: 283, column: 32, scope: !369)
!403 = !DILocation(line: 283, column: 30, scope: !369)
!404 = !DILocation(line: 284, column: 21, scope: !405)
!405 = distinct !DILexicalBlock(scope: !369, file: !71, line: 284, column: 21)
!406 = !DILocation(line: 284, column: 34, scope: !405)
!407 = !DILocation(line: 284, column: 21, scope: !369)
!408 = !DILocation(line: 286, column: 21, scope: !409)
!409 = distinct !DILexicalBlock(scope: !405, file: !71, line: 285, column: 17)
!410 = !DILocation(line: 289, column: 35, scope: !369)
!411 = !DILocation(line: 289, column: 49, scope: !369)
!412 = !DILocation(line: 289, column: 30, scope: !369)
!413 = !DILocation(line: 289, column: 28, scope: !369)
!414 = !DILocation(line: 290, column: 21, scope: !415)
!415 = distinct !DILexicalBlock(scope: !369, file: !71, line: 290, column: 21)
!416 = !DILocation(line: 290, column: 32, scope: !415)
!417 = !DILocation(line: 290, column: 48, scope: !415)
!418 = !DILocation(line: 290, column: 51, scope: !415)
!419 = !DILocation(line: 290, column: 62, scope: !415)
!420 = !DILocation(line: 290, column: 21, scope: !369)
!421 = !DILocation(line: 292, column: 21, scope: !422)
!422 = distinct !DILexicalBlock(scope: !415, file: !71, line: 291, column: 17)
!423 = !DILocation(line: 295, column: 29, scope: !369)
!424 = !DILocation(line: 295, column: 17, scope: !369)
!425 = !DILocation(line: 295, column: 41, scope: !369)
!426 = !DILocation(line: 297, column: 29, scope: !369)
!427 = !DILocation(line: 297, column: 24, scope: !369)
!428 = !DILocation(line: 297, column: 22, scope: !369)
!429 = !DILocation(line: 298, column: 13, scope: !369)
!430 = !DILocation(line: 300, column: 17, scope: !431)
!431 = distinct !DILexicalBlock(scope: !356, file: !71, line: 300, column: 17)
!432 = !DILocation(line: 300, column: 30, scope: !431)
!433 = !DILocation(line: 300, column: 17, scope: !356)
!434 = !DILocation(line: 302, column: 30, scope: !435)
!435 = distinct !DILexicalBlock(scope: !431, file: !71, line: 301, column: 13)
!436 = !DILocation(line: 302, column: 17, scope: !435)
!437 = !DILocation(line: 303, column: 13, scope: !435)
!438 = !DILocation(line: 304, column: 17, scope: !439)
!439 = distinct !DILexicalBlock(scope: !356, file: !71, line: 304, column: 17)
!440 = !DILocation(line: 304, column: 30, scope: !439)
!441 = !DILocation(line: 304, column: 17, scope: !356)
!442 = !DILocation(line: 306, column: 30, scope: !443)
!443 = distinct !DILexicalBlock(scope: !439, file: !71, line: 305, column: 13)
!444 = !DILocation(line: 306, column: 17, scope: !443)
!445 = !DILocation(line: 307, column: 13, scope: !443)
!446 = !DILocation(line: 316, column: 8, scope: !447)
!447 = distinct !DILexicalBlock(scope: !256, file: !71, line: 316, column: 8)
!448 = !DILocation(line: 316, column: 8, scope: !256)
!449 = !DILocalVariable(name: "buffer", scope: !450, file: !71, line: 319, type: !198)
!450 = distinct !DILexicalBlock(scope: !451, file: !71, line: 318, column: 9)
!451 = distinct !DILexicalBlock(scope: !447, file: !71, line: 317, column: 5)
!452 = !DILocation(line: 319, column: 17, scope: !450)
!453 = !DILocation(line: 321, column: 17, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !71, line: 321, column: 17)
!455 = !DILocation(line: 321, column: 22, scope: !454)
!456 = !DILocation(line: 321, column: 27, scope: !454)
!457 = !DILocation(line: 321, column: 30, scope: !454)
!458 = !DILocation(line: 321, column: 35, scope: !454)
!459 = !DILocation(line: 321, column: 17, scope: !450)
!460 = !DILocation(line: 323, column: 37, scope: !461)
!461 = distinct !DILexicalBlock(scope: !454, file: !71, line: 322, column: 13)
!462 = !DILocation(line: 323, column: 30, scope: !461)
!463 = !DILocation(line: 323, column: 17, scope: !461)
!464 = !DILocation(line: 324, column: 13, scope: !461)
!465 = !DILocation(line: 327, column: 17, scope: !466)
!466 = distinct !DILexicalBlock(scope: !454, file: !71, line: 326, column: 13)
!467 = !DILocation(line: 330, column: 5, scope: !451)
!468 = !DILocalVariable(name: "buffer", scope: !469, file: !71, line: 334, type: !198)
!469 = distinct !DILexicalBlock(scope: !470, file: !71, line: 333, column: 9)
!470 = distinct !DILexicalBlock(scope: !447, file: !71, line: 332, column: 5)
!471 = !DILocation(line: 334, column: 17, scope: !469)
!472 = !DILocation(line: 336, column: 17, scope: !473)
!473 = distinct !DILexicalBlock(scope: !469, file: !71, line: 336, column: 17)
!474 = !DILocation(line: 336, column: 22, scope: !473)
!475 = !DILocation(line: 336, column: 27, scope: !473)
!476 = !DILocation(line: 336, column: 30, scope: !473)
!477 = !DILocation(line: 336, column: 35, scope: !473)
!478 = !DILocation(line: 336, column: 17, scope: !469)
!479 = !DILocation(line: 338, column: 37, scope: !480)
!480 = distinct !DILexicalBlock(scope: !473, file: !71, line: 337, column: 13)
!481 = !DILocation(line: 338, column: 30, scope: !480)
!482 = !DILocation(line: 338, column: 17, scope: !480)
!483 = !DILocation(line: 339, column: 13, scope: !480)
!484 = !DILocation(line: 342, column: 17, scope: !485)
!485 = distinct !DILexicalBlock(scope: !473, file: !71, line: 341, column: 13)
!486 = !DILocation(line: 346, column: 1, scope: !256)
!487 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 351, type: !72, scopeLine: 352, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!488 = !DILocalVariable(name: "data", scope: !487, file: !71, line: 353, type: !76)
!489 = !DILocation(line: 353, column: 9, scope: !487)
!490 = !DILocation(line: 355, column: 10, scope: !487)
!491 = !DILocation(line: 356, column: 8, scope: !492)
!492 = distinct !DILexicalBlock(scope: !487, file: !71, line: 356, column: 8)
!493 = !DILocation(line: 356, column: 8, scope: !487)
!494 = !DILocation(line: 360, column: 14, scope: !495)
!495 = distinct !DILexicalBlock(scope: !492, file: !71, line: 357, column: 5)
!496 = !DILocation(line: 361, column: 5, scope: !495)
!497 = !DILocation(line: 366, column: 14, scope: !498)
!498 = distinct !DILexicalBlock(scope: !492, file: !71, line: 363, column: 5)
!499 = !DILocation(line: 368, column: 8, scope: !500)
!500 = distinct !DILexicalBlock(scope: !487, file: !71, line: 368, column: 8)
!501 = !DILocation(line: 368, column: 8, scope: !487)
!502 = !DILocalVariable(name: "buffer", scope: !503, file: !71, line: 371, type: !198)
!503 = distinct !DILexicalBlock(scope: !504, file: !71, line: 370, column: 9)
!504 = distinct !DILexicalBlock(scope: !500, file: !71, line: 369, column: 5)
!505 = !DILocation(line: 371, column: 17, scope: !503)
!506 = !DILocation(line: 374, column: 17, scope: !507)
!507 = distinct !DILexicalBlock(scope: !503, file: !71, line: 374, column: 17)
!508 = !DILocation(line: 374, column: 22, scope: !507)
!509 = !DILocation(line: 374, column: 17, scope: !503)
!510 = !DILocation(line: 376, column: 37, scope: !511)
!511 = distinct !DILexicalBlock(scope: !507, file: !71, line: 375, column: 13)
!512 = !DILocation(line: 376, column: 30, scope: !511)
!513 = !DILocation(line: 376, column: 17, scope: !511)
!514 = !DILocation(line: 377, column: 13, scope: !511)
!515 = !DILocation(line: 380, column: 17, scope: !516)
!516 = distinct !DILexicalBlock(scope: !507, file: !71, line: 379, column: 13)
!517 = !DILocation(line: 383, column: 5, scope: !504)
!518 = !DILocalVariable(name: "buffer", scope: !519, file: !71, line: 387, type: !198)
!519 = distinct !DILexicalBlock(scope: !520, file: !71, line: 386, column: 9)
!520 = distinct !DILexicalBlock(scope: !500, file: !71, line: 385, column: 5)
!521 = !DILocation(line: 387, column: 17, scope: !519)
!522 = !DILocation(line: 390, column: 17, scope: !523)
!523 = distinct !DILexicalBlock(scope: !519, file: !71, line: 390, column: 17)
!524 = !DILocation(line: 390, column: 22, scope: !523)
!525 = !DILocation(line: 390, column: 17, scope: !519)
!526 = !DILocation(line: 392, column: 37, scope: !527)
!527 = distinct !DILexicalBlock(scope: !523, file: !71, line: 391, column: 13)
!528 = !DILocation(line: 392, column: 30, scope: !527)
!529 = !DILocation(line: 392, column: 17, scope: !527)
!530 = !DILocation(line: 393, column: 13, scope: !527)
!531 = !DILocation(line: 396, column: 17, scope: !532)
!532 = distinct !DILexicalBlock(scope: !523, file: !71, line: 395, column: 13)
!533 = !DILocation(line: 400, column: 1, scope: !487)
