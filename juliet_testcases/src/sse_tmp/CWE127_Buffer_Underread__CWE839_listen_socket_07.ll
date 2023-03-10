; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_07.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_07_bad() #0 !dbg !75 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 -1, i32* %data, align 4, !dbg !81
  %0 = load i32, i32* @staticFive, align 4, !dbg !82
  %cmp = icmp eq i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.end35, !dbg !85

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !86, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !90, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 -1, i32* %listenSocket, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 -1, i32* %acceptSocket, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  br label %do.body, !dbg !114

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !115
  store i32 %call, i32* %listenSocket, align 4, !dbg !117
  %1 = load i32, i32* %listenSocket, align 4, !dbg !118
  %cmp1 = icmp eq i32 %1, -1, !dbg !120
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !121

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !122

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !124
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !125
  store i16 2, i16* %sin_family, align 4, !dbg !126
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !127
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !128
  store i32 0, i32* %s_addr, align 4, !dbg !129
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !130
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !131
  store i16 %call3, i16* %sin_port, align 2, !dbg !132
  %3 = load i32, i32* %listenSocket, align 4, !dbg !133
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !135
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !136
  %cmp5 = icmp eq i32 %call4, -1, !dbg !137
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !138

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !139

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !141
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !143
  %cmp9 = icmp eq i32 %call8, -1, !dbg !144
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !145

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !146

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !148
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !149
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !150
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !151
  %cmp13 = icmp eq i32 %7, -1, !dbg !153
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !154

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !155

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !157
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !158
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !159
  %conv = trunc i64 %call16 to i32, !dbg !159
  store i32 %conv, i32* %recvResult, align 4, !dbg !160
  %9 = load i32, i32* %recvResult, align 4, !dbg !161
  %cmp17 = icmp eq i32 %9, -1, !dbg !163
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !164

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !165
  %cmp19 = icmp eq i32 %10, 0, !dbg !166
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !167

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !168

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !170
  %idxprom = sext i32 %11 to i64, !dbg !171
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !171
  store i8 0, i8* %arrayidx, align 1, !dbg !172
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !173
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !174
  store i32 %call24, i32* %data, align 4, !dbg !175
  br label %do.end, !dbg !176

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !177
  %cmp25 = icmp ne i32 %12, -1, !dbg !179
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !180

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !181
  %call28 = call i32 @close(i32 %13), !dbg !183
  br label %if.end29, !dbg !184

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !185
  %cmp30 = icmp ne i32 %14, -1, !dbg !187
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !188

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !189
  %call33 = call i32 @close(i32 %15), !dbg !191
  br label %if.end34, !dbg !192

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !193

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !194
  %cmp36 = icmp eq i32 %16, 5, !dbg !196
  br i1 %cmp36, label %if.then38, label %if.end45, !dbg !197

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !198, metadata !DIExpression()), !dbg !204
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !204
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !204
  %18 = load i32, i32* %data, align 4, !dbg !205
  %cmp39 = icmp slt i32 %18, 10, !dbg !207
  br i1 %cmp39, label %if.then41, label %if.else, !dbg !208

if.then41:                                        ; preds = %if.then38
  %19 = load i32, i32* %data, align 4, !dbg !209
  %idxprom42 = sext i32 %19 to i64, !dbg !211
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !211
  %20 = load i32, i32* %arrayidx43, align 4, !dbg !211
  call void @printIntLine(i32 %20), !dbg !212
  br label %if.end44, !dbg !213

if.else:                                          ; preds = %if.then38
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !214
  br label %if.end44

if.end44:                                         ; preds = %if.else, %if.then41
  br label %if.end45, !dbg !216

if.end45:                                         ; preds = %if.end44, %if.end35
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
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_07_good() #0 !dbg !218 {
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
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_07_good(), !dbg !237
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !238
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !239
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_07_bad(), !dbg !240
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
  %0 = load i32, i32* @staticFive, align 4, !dbg !247
  %cmp = icmp eq i32 %0, 5, !dbg !249
  br i1 %cmp, label %if.then, label %if.end35, !dbg !250

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !251, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !255, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !257, metadata !DIExpression()), !dbg !258
  store i32 -1, i32* %listenSocket, align 4, !dbg !258
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !259, metadata !DIExpression()), !dbg !260
  store i32 -1, i32* %acceptSocket, align 4, !dbg !260
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !261, metadata !DIExpression()), !dbg !262
  br label %do.body, !dbg !263

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !264
  store i32 %call, i32* %listenSocket, align 4, !dbg !266
  %1 = load i32, i32* %listenSocket, align 4, !dbg !267
  %cmp1 = icmp eq i32 %1, -1, !dbg !269
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !270

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !271

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !273
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !273
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !274
  store i16 2, i16* %sin_family, align 4, !dbg !275
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !276
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !277
  store i32 0, i32* %s_addr, align 4, !dbg !278
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !279
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !280
  store i16 %call3, i16* %sin_port, align 2, !dbg !281
  %3 = load i32, i32* %listenSocket, align 4, !dbg !282
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !284
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !285
  %cmp5 = icmp eq i32 %call4, -1, !dbg !286
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !287

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !288

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !290
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !292
  %cmp9 = icmp eq i32 %call8, -1, !dbg !293
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !294

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !295

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !297
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !298
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !299
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !300
  %cmp13 = icmp eq i32 %7, -1, !dbg !302
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !303

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !304

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !306
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !307
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !308
  %conv = trunc i64 %call16 to i32, !dbg !308
  store i32 %conv, i32* %recvResult, align 4, !dbg !309
  %9 = load i32, i32* %recvResult, align 4, !dbg !310
  %cmp17 = icmp eq i32 %9, -1, !dbg !312
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !313

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !314
  %cmp19 = icmp eq i32 %10, 0, !dbg !315
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !316

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !317

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !319
  %idxprom = sext i32 %11 to i64, !dbg !320
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !320
  store i8 0, i8* %arrayidx, align 1, !dbg !321
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !322
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !323
  store i32 %call24, i32* %data, align 4, !dbg !324
  br label %do.end, !dbg !325

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !326
  %cmp25 = icmp ne i32 %12, -1, !dbg !328
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !329

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !330
  %call28 = call i32 @close(i32 %13), !dbg !332
  br label %if.end29, !dbg !333

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !334
  %cmp30 = icmp ne i32 %14, -1, !dbg !336
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !337

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !338
  %call33 = call i32 @close(i32 %15), !dbg !340
  br label %if.end34, !dbg !341

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !342

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !343
  %cmp36 = icmp ne i32 %16, 5, !dbg !345
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !346

if.then38:                                        ; preds = %if.end35
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !347
  br label %if.end48, !dbg !349

if.else:                                          ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !350, metadata !DIExpression()), !dbg !353
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !353
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !353
  %18 = load i32, i32* %data, align 4, !dbg !354
  %cmp39 = icmp sge i32 %18, 0, !dbg !356
  br i1 %cmp39, label %land.lhs.true, label %if.else46, !dbg !357

land.lhs.true:                                    ; preds = %if.else
  %19 = load i32, i32* %data, align 4, !dbg !358
  %cmp41 = icmp slt i32 %19, 10, !dbg !359
  br i1 %cmp41, label %if.then43, label %if.else46, !dbg !360

if.then43:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !361
  %idxprom44 = sext i32 %20 to i64, !dbg !363
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !363
  %21 = load i32, i32* %arrayidx45, align 4, !dbg !363
  call void @printIntLine(i32 %21), !dbg !364
  br label %if.end47, !dbg !365

if.else46:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !366
  br label %if.end47

if.end47:                                         ; preds = %if.else46, %if.then43
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.then38
  ret void, !dbg !368
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !369 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !370, metadata !DIExpression()), !dbg !371
  store i32 -1, i32* %data, align 4, !dbg !372
  %0 = load i32, i32* @staticFive, align 4, !dbg !373
  %cmp = icmp eq i32 %0, 5, !dbg !375
  br i1 %cmp, label %if.then, label %if.end35, !dbg !376

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !377, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !381, metadata !DIExpression()), !dbg !382
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !383, metadata !DIExpression()), !dbg !384
  store i32 -1, i32* %listenSocket, align 4, !dbg !384
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !385, metadata !DIExpression()), !dbg !386
  store i32 -1, i32* %acceptSocket, align 4, !dbg !386
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !387, metadata !DIExpression()), !dbg !388
  br label %do.body, !dbg !389

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !390
  store i32 %call, i32* %listenSocket, align 4, !dbg !392
  %1 = load i32, i32* %listenSocket, align 4, !dbg !393
  %cmp1 = icmp eq i32 %1, -1, !dbg !395
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !396

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !397

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !399
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !399
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !400
  store i16 2, i16* %sin_family, align 4, !dbg !401
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !402
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !403
  store i32 0, i32* %s_addr, align 4, !dbg !404
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !405
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !406
  store i16 %call3, i16* %sin_port, align 2, !dbg !407
  %3 = load i32, i32* %listenSocket, align 4, !dbg !408
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !410
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !411
  %cmp5 = icmp eq i32 %call4, -1, !dbg !412
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !413

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !414

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !416
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !418
  %cmp9 = icmp eq i32 %call8, -1, !dbg !419
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !420

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !421

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !423
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !424
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !425
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !426
  %cmp13 = icmp eq i32 %7, -1, !dbg !428
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !429

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !430

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !432
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !433
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !434
  %conv = trunc i64 %call16 to i32, !dbg !434
  store i32 %conv, i32* %recvResult, align 4, !dbg !435
  %9 = load i32, i32* %recvResult, align 4, !dbg !436
  %cmp17 = icmp eq i32 %9, -1, !dbg !438
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !439

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !440
  %cmp19 = icmp eq i32 %10, 0, !dbg !441
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !442

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !443

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !445
  %idxprom = sext i32 %11 to i64, !dbg !446
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !446
  store i8 0, i8* %arrayidx, align 1, !dbg !447
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !448
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !449
  store i32 %call24, i32* %data, align 4, !dbg !450
  br label %do.end, !dbg !451

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !452
  %cmp25 = icmp ne i32 %12, -1, !dbg !454
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !455

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !456
  %call28 = call i32 @close(i32 %13), !dbg !458
  br label %if.end29, !dbg !459

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !460
  %cmp30 = icmp ne i32 %14, -1, !dbg !462
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !463

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !464
  %call33 = call i32 @close(i32 %15), !dbg !466
  br label %if.end34, !dbg !467

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !468

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !469
  %cmp36 = icmp eq i32 %16, 5, !dbg !471
  br i1 %cmp36, label %if.then38, label %if.end47, !dbg !472

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !473, metadata !DIExpression()), !dbg !476
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !476
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !476
  %18 = load i32, i32* %data, align 4, !dbg !477
  %cmp39 = icmp sge i32 %18, 0, !dbg !479
  br i1 %cmp39, label %land.lhs.true, label %if.else, !dbg !480

land.lhs.true:                                    ; preds = %if.then38
  %19 = load i32, i32* %data, align 4, !dbg !481
  %cmp41 = icmp slt i32 %19, 10, !dbg !482
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !483

if.then43:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !484
  %idxprom44 = sext i32 %20 to i64, !dbg !486
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !486
  %21 = load i32, i32* %arrayidx45, align 4, !dbg !486
  call void @printIntLine(i32 %21), !dbg !487
  br label %if.end46, !dbg !488

if.else:                                          ; preds = %land.lhs.true, %if.then38
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !489
  br label %if.end46

if.end46:                                         ; preds = %if.else, %if.then43
  br label %if.end47, !dbg !491

if.end47:                                         ; preds = %if.end46, %if.end35
  ret void, !dbg !492
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !493 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !494, metadata !DIExpression()), !dbg !495
  store i32 -1, i32* %data, align 4, !dbg !496
  %0 = load i32, i32* @staticFive, align 4, !dbg !497
  %cmp = icmp ne i32 %0, 5, !dbg !499
  br i1 %cmp, label %if.then, label %if.else, !dbg !500

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !501
  br label %if.end, !dbg !503

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !504
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !506
  %cmp1 = icmp eq i32 %1, 5, !dbg !508
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !509

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !510, metadata !DIExpression()), !dbg !513
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !513
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !513
  %3 = load i32, i32* %data, align 4, !dbg !514
  %cmp3 = icmp slt i32 %3, 10, !dbg !516
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !517

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !518
  %idxprom = sext i32 %4 to i64, !dbg !520
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !520
  %5 = load i32, i32* %arrayidx, align 4, !dbg !520
  call void @printIntLine(i32 %5), !dbg !521
  br label %if.end6, !dbg !522

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !523
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !525

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !526
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !527 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !528, metadata !DIExpression()), !dbg !529
  store i32 -1, i32* %data, align 4, !dbg !530
  %0 = load i32, i32* @staticFive, align 4, !dbg !531
  %cmp = icmp eq i32 %0, 5, !dbg !533
  br i1 %cmp, label %if.then, label %if.end, !dbg !534

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !535
  br label %if.end, !dbg !537

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !538
  %cmp1 = icmp eq i32 %1, 5, !dbg !540
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !541

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !542, metadata !DIExpression()), !dbg !545
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !545
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !545
  %3 = load i32, i32* %data, align 4, !dbg !546
  %cmp3 = icmp slt i32 %3, 10, !dbg !548
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !549

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !550
  %idxprom = sext i32 %4 to i64, !dbg !552
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !552
  %5 = load i32, i32* %arrayidx, align 4, !dbg !552
  call void @printIntLine(i32 %5), !dbg !553
  br label %if.end5, !dbg !554

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !555
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !557

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !558
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
!llvm.module.flags = !{!69, !70, !71, !72, !73}
!llvm.ident = !{!74}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !67, line: 45, type: !68, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !66, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_07.c", directory: "/home/joelyang/SSE-Assessment")
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
!66 = !{!0}
!67 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_07.c", directory: "/home/joelyang/SSE-Assessment")
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !{i32 7, !"Dwarf Version", i32 4}
!70 = !{i32 2, !"Debug Info Version", i32 3}
!71 = !{i32 1, !"wchar_size", i32 4}
!72 = !{i32 7, !"uwtable", i32 1}
!73 = !{i32 7, !"frame-pointer", i32 2}
!74 = !{!"clang version 13.0.0"}
!75 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_07_bad", scope: !67, file: !67, line: 49, type: !76, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!76 = !DISubroutineType(types: !77)
!77 = !{null}
!78 = !{}
!79 = !DILocalVariable(name: "data", scope: !75, file: !67, line: 51, type: !68)
!80 = !DILocation(line: 51, column: 9, scope: !75)
!81 = !DILocation(line: 53, column: 10, scope: !75)
!82 = !DILocation(line: 54, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !75, file: !67, line: 54, column: 8)
!84 = !DILocation(line: 54, column: 18, scope: !83)
!85 = !DILocation(line: 54, column: 8, scope: !75)
!86 = !DILocalVariable(name: "recvResult", scope: !87, file: !67, line: 61, type: !68)
!87 = distinct !DILexicalBlock(scope: !88, file: !67, line: 56, column: 9)
!88 = distinct !DILexicalBlock(scope: !83, file: !67, line: 55, column: 5)
!89 = !DILocation(line: 61, column: 17, scope: !87)
!90 = !DILocalVariable(name: "service", scope: !87, file: !67, line: 62, type: !91)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !92)
!92 = !{!93, !94, !98, !102}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !91, file: !19, line: 240, baseType: !58, size: 16)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !91, file: !19, line: 241, baseType: !95, size: 16, offset: 16)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 40, baseType: !60)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !91, file: !19, line: 242, baseType: !99, size: 32, offset: 32)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !100)
!100 = !{!101}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !99, file: !19, line: 33, baseType: !48, size: 32)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !91, file: !19, line: 245, baseType: !103, size: 64, offset: 64)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 64, elements: !105)
!104 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!105 = !{!106}
!106 = !DISubrange(count: 8)
!107 = !DILocation(line: 62, column: 32, scope: !87)
!108 = !DILocalVariable(name: "listenSocket", scope: !87, file: !67, line: 63, type: !68)
!109 = !DILocation(line: 63, column: 20, scope: !87)
!110 = !DILocalVariable(name: "acceptSocket", scope: !87, file: !67, line: 64, type: !68)
!111 = !DILocation(line: 64, column: 20, scope: !87)
!112 = !DILocalVariable(name: "inputBuffer", scope: !87, file: !67, line: 65, type: !62)
!113 = !DILocation(line: 65, column: 18, scope: !87)
!114 = !DILocation(line: 66, column: 13, scope: !87)
!115 = !DILocation(line: 76, column: 32, scope: !116)
!116 = distinct !DILexicalBlock(scope: !87, file: !67, line: 67, column: 13)
!117 = !DILocation(line: 76, column: 30, scope: !116)
!118 = !DILocation(line: 77, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !67, line: 77, column: 21)
!120 = !DILocation(line: 77, column: 34, scope: !119)
!121 = !DILocation(line: 77, column: 21, scope: !116)
!122 = !DILocation(line: 79, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !67, line: 78, column: 17)
!124 = !DILocation(line: 81, column: 17, scope: !116)
!125 = !DILocation(line: 82, column: 25, scope: !116)
!126 = !DILocation(line: 82, column: 36, scope: !116)
!127 = !DILocation(line: 83, column: 25, scope: !116)
!128 = !DILocation(line: 83, column: 34, scope: !116)
!129 = !DILocation(line: 83, column: 41, scope: !116)
!130 = !DILocation(line: 84, column: 36, scope: !116)
!131 = !DILocation(line: 84, column: 25, scope: !116)
!132 = !DILocation(line: 84, column: 34, scope: !116)
!133 = !DILocation(line: 85, column: 26, scope: !134)
!134 = distinct !DILexicalBlock(scope: !116, file: !67, line: 85, column: 21)
!135 = !DILocation(line: 85, column: 40, scope: !134)
!136 = !DILocation(line: 85, column: 21, scope: !134)
!137 = !DILocation(line: 85, column: 85, scope: !134)
!138 = !DILocation(line: 85, column: 21, scope: !116)
!139 = !DILocation(line: 87, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !67, line: 86, column: 17)
!141 = !DILocation(line: 89, column: 28, scope: !142)
!142 = distinct !DILexicalBlock(scope: !116, file: !67, line: 89, column: 21)
!143 = !DILocation(line: 89, column: 21, scope: !142)
!144 = !DILocation(line: 89, column: 58, scope: !142)
!145 = !DILocation(line: 89, column: 21, scope: !116)
!146 = !DILocation(line: 91, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !67, line: 90, column: 17)
!148 = !DILocation(line: 93, column: 39, scope: !116)
!149 = !DILocation(line: 93, column: 32, scope: !116)
!150 = !DILocation(line: 93, column: 30, scope: !116)
!151 = !DILocation(line: 94, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !116, file: !67, line: 94, column: 21)
!153 = !DILocation(line: 94, column: 34, scope: !152)
!154 = !DILocation(line: 94, column: 21, scope: !116)
!155 = !DILocation(line: 96, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !67, line: 95, column: 17)
!157 = !DILocation(line: 99, column: 35, scope: !116)
!158 = !DILocation(line: 99, column: 49, scope: !116)
!159 = !DILocation(line: 99, column: 30, scope: !116)
!160 = !DILocation(line: 99, column: 28, scope: !116)
!161 = !DILocation(line: 100, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !116, file: !67, line: 100, column: 21)
!163 = !DILocation(line: 100, column: 32, scope: !162)
!164 = !DILocation(line: 100, column: 48, scope: !162)
!165 = !DILocation(line: 100, column: 51, scope: !162)
!166 = !DILocation(line: 100, column: 62, scope: !162)
!167 = !DILocation(line: 100, column: 21, scope: !116)
!168 = !DILocation(line: 102, column: 21, scope: !169)
!169 = distinct !DILexicalBlock(scope: !162, file: !67, line: 101, column: 17)
!170 = !DILocation(line: 105, column: 29, scope: !116)
!171 = !DILocation(line: 105, column: 17, scope: !116)
!172 = !DILocation(line: 105, column: 41, scope: !116)
!173 = !DILocation(line: 107, column: 29, scope: !116)
!174 = !DILocation(line: 107, column: 24, scope: !116)
!175 = !DILocation(line: 107, column: 22, scope: !116)
!176 = !DILocation(line: 108, column: 13, scope: !116)
!177 = !DILocation(line: 110, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !87, file: !67, line: 110, column: 17)
!179 = !DILocation(line: 110, column: 30, scope: !178)
!180 = !DILocation(line: 110, column: 17, scope: !87)
!181 = !DILocation(line: 112, column: 30, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !67, line: 111, column: 13)
!183 = !DILocation(line: 112, column: 17, scope: !182)
!184 = !DILocation(line: 113, column: 13, scope: !182)
!185 = !DILocation(line: 114, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !87, file: !67, line: 114, column: 17)
!187 = !DILocation(line: 114, column: 30, scope: !186)
!188 = !DILocation(line: 114, column: 17, scope: !87)
!189 = !DILocation(line: 116, column: 30, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !67, line: 115, column: 13)
!191 = !DILocation(line: 116, column: 17, scope: !190)
!192 = !DILocation(line: 117, column: 13, scope: !190)
!193 = !DILocation(line: 125, column: 5, scope: !88)
!194 = !DILocation(line: 126, column: 8, scope: !195)
!195 = distinct !DILexicalBlock(scope: !75, file: !67, line: 126, column: 8)
!196 = !DILocation(line: 126, column: 18, scope: !195)
!197 = !DILocation(line: 126, column: 8, scope: !75)
!198 = !DILocalVariable(name: "buffer", scope: !199, file: !67, line: 129, type: !201)
!199 = distinct !DILexicalBlock(scope: !200, file: !67, line: 128, column: 9)
!200 = distinct !DILexicalBlock(scope: !195, file: !67, line: 127, column: 5)
!201 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 320, elements: !202)
!202 = !{!203}
!203 = !DISubrange(count: 10)
!204 = !DILocation(line: 129, column: 17, scope: !199)
!205 = !DILocation(line: 132, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !67, line: 132, column: 17)
!207 = !DILocation(line: 132, column: 22, scope: !206)
!208 = !DILocation(line: 132, column: 17, scope: !199)
!209 = !DILocation(line: 134, column: 37, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !67, line: 133, column: 13)
!211 = !DILocation(line: 134, column: 30, scope: !210)
!212 = !DILocation(line: 134, column: 17, scope: !210)
!213 = !DILocation(line: 135, column: 13, scope: !210)
!214 = !DILocation(line: 138, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !206, file: !67, line: 137, column: 13)
!216 = !DILocation(line: 141, column: 5, scope: !200)
!217 = !DILocation(line: 142, column: 1, scope: !75)
!218 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_07_good", scope: !67, file: !67, line: 408, type: !76, scopeLine: 409, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!219 = !DILocation(line: 410, column: 5, scope: !218)
!220 = !DILocation(line: 411, column: 5, scope: !218)
!221 = !DILocation(line: 412, column: 5, scope: !218)
!222 = !DILocation(line: 413, column: 5, scope: !218)
!223 = !DILocation(line: 414, column: 1, scope: !218)
!224 = distinct !DISubprogram(name: "main", scope: !67, file: !67, line: 425, type: !225, scopeLine: 426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!225 = !DISubroutineType(types: !226)
!226 = !{!68, !68, !227}
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64)
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!229 = !DILocalVariable(name: "argc", arg: 1, scope: !224, file: !67, line: 425, type: !68)
!230 = !DILocation(line: 425, column: 14, scope: !224)
!231 = !DILocalVariable(name: "argv", arg: 2, scope: !224, file: !67, line: 425, type: !227)
!232 = !DILocation(line: 425, column: 27, scope: !224)
!233 = !DILocation(line: 428, column: 22, scope: !224)
!234 = !DILocation(line: 428, column: 12, scope: !224)
!235 = !DILocation(line: 428, column: 5, scope: !224)
!236 = !DILocation(line: 430, column: 5, scope: !224)
!237 = !DILocation(line: 431, column: 5, scope: !224)
!238 = !DILocation(line: 432, column: 5, scope: !224)
!239 = !DILocation(line: 435, column: 5, scope: !224)
!240 = !DILocation(line: 436, column: 5, scope: !224)
!241 = !DILocation(line: 437, column: 5, scope: !224)
!242 = !DILocation(line: 439, column: 5, scope: !224)
!243 = distinct !DISubprogram(name: "goodB2G1", scope: !67, file: !67, line: 149, type: !76, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!244 = !DILocalVariable(name: "data", scope: !243, file: !67, line: 151, type: !68)
!245 = !DILocation(line: 151, column: 9, scope: !243)
!246 = !DILocation(line: 153, column: 10, scope: !243)
!247 = !DILocation(line: 154, column: 8, scope: !248)
!248 = distinct !DILexicalBlock(scope: !243, file: !67, line: 154, column: 8)
!249 = !DILocation(line: 154, column: 18, scope: !248)
!250 = !DILocation(line: 154, column: 8, scope: !243)
!251 = !DILocalVariable(name: "recvResult", scope: !252, file: !67, line: 161, type: !68)
!252 = distinct !DILexicalBlock(scope: !253, file: !67, line: 156, column: 9)
!253 = distinct !DILexicalBlock(scope: !248, file: !67, line: 155, column: 5)
!254 = !DILocation(line: 161, column: 17, scope: !252)
!255 = !DILocalVariable(name: "service", scope: !252, file: !67, line: 162, type: !91)
!256 = !DILocation(line: 162, column: 32, scope: !252)
!257 = !DILocalVariable(name: "listenSocket", scope: !252, file: !67, line: 163, type: !68)
!258 = !DILocation(line: 163, column: 20, scope: !252)
!259 = !DILocalVariable(name: "acceptSocket", scope: !252, file: !67, line: 164, type: !68)
!260 = !DILocation(line: 164, column: 20, scope: !252)
!261 = !DILocalVariable(name: "inputBuffer", scope: !252, file: !67, line: 165, type: !62)
!262 = !DILocation(line: 165, column: 18, scope: !252)
!263 = !DILocation(line: 166, column: 13, scope: !252)
!264 = !DILocation(line: 176, column: 32, scope: !265)
!265 = distinct !DILexicalBlock(scope: !252, file: !67, line: 167, column: 13)
!266 = !DILocation(line: 176, column: 30, scope: !265)
!267 = !DILocation(line: 177, column: 21, scope: !268)
!268 = distinct !DILexicalBlock(scope: !265, file: !67, line: 177, column: 21)
!269 = !DILocation(line: 177, column: 34, scope: !268)
!270 = !DILocation(line: 177, column: 21, scope: !265)
!271 = !DILocation(line: 179, column: 21, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !67, line: 178, column: 17)
!273 = !DILocation(line: 181, column: 17, scope: !265)
!274 = !DILocation(line: 182, column: 25, scope: !265)
!275 = !DILocation(line: 182, column: 36, scope: !265)
!276 = !DILocation(line: 183, column: 25, scope: !265)
!277 = !DILocation(line: 183, column: 34, scope: !265)
!278 = !DILocation(line: 183, column: 41, scope: !265)
!279 = !DILocation(line: 184, column: 36, scope: !265)
!280 = !DILocation(line: 184, column: 25, scope: !265)
!281 = !DILocation(line: 184, column: 34, scope: !265)
!282 = !DILocation(line: 185, column: 26, scope: !283)
!283 = distinct !DILexicalBlock(scope: !265, file: !67, line: 185, column: 21)
!284 = !DILocation(line: 185, column: 40, scope: !283)
!285 = !DILocation(line: 185, column: 21, scope: !283)
!286 = !DILocation(line: 185, column: 85, scope: !283)
!287 = !DILocation(line: 185, column: 21, scope: !265)
!288 = !DILocation(line: 187, column: 21, scope: !289)
!289 = distinct !DILexicalBlock(scope: !283, file: !67, line: 186, column: 17)
!290 = !DILocation(line: 189, column: 28, scope: !291)
!291 = distinct !DILexicalBlock(scope: !265, file: !67, line: 189, column: 21)
!292 = !DILocation(line: 189, column: 21, scope: !291)
!293 = !DILocation(line: 189, column: 58, scope: !291)
!294 = !DILocation(line: 189, column: 21, scope: !265)
!295 = !DILocation(line: 191, column: 21, scope: !296)
!296 = distinct !DILexicalBlock(scope: !291, file: !67, line: 190, column: 17)
!297 = !DILocation(line: 193, column: 39, scope: !265)
!298 = !DILocation(line: 193, column: 32, scope: !265)
!299 = !DILocation(line: 193, column: 30, scope: !265)
!300 = !DILocation(line: 194, column: 21, scope: !301)
!301 = distinct !DILexicalBlock(scope: !265, file: !67, line: 194, column: 21)
!302 = !DILocation(line: 194, column: 34, scope: !301)
!303 = !DILocation(line: 194, column: 21, scope: !265)
!304 = !DILocation(line: 196, column: 21, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !67, line: 195, column: 17)
!306 = !DILocation(line: 199, column: 35, scope: !265)
!307 = !DILocation(line: 199, column: 49, scope: !265)
!308 = !DILocation(line: 199, column: 30, scope: !265)
!309 = !DILocation(line: 199, column: 28, scope: !265)
!310 = !DILocation(line: 200, column: 21, scope: !311)
!311 = distinct !DILexicalBlock(scope: !265, file: !67, line: 200, column: 21)
!312 = !DILocation(line: 200, column: 32, scope: !311)
!313 = !DILocation(line: 200, column: 48, scope: !311)
!314 = !DILocation(line: 200, column: 51, scope: !311)
!315 = !DILocation(line: 200, column: 62, scope: !311)
!316 = !DILocation(line: 200, column: 21, scope: !265)
!317 = !DILocation(line: 202, column: 21, scope: !318)
!318 = distinct !DILexicalBlock(scope: !311, file: !67, line: 201, column: 17)
!319 = !DILocation(line: 205, column: 29, scope: !265)
!320 = !DILocation(line: 205, column: 17, scope: !265)
!321 = !DILocation(line: 205, column: 41, scope: !265)
!322 = !DILocation(line: 207, column: 29, scope: !265)
!323 = !DILocation(line: 207, column: 24, scope: !265)
!324 = !DILocation(line: 207, column: 22, scope: !265)
!325 = !DILocation(line: 208, column: 13, scope: !265)
!326 = !DILocation(line: 210, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !252, file: !67, line: 210, column: 17)
!328 = !DILocation(line: 210, column: 30, scope: !327)
!329 = !DILocation(line: 210, column: 17, scope: !252)
!330 = !DILocation(line: 212, column: 30, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !67, line: 211, column: 13)
!332 = !DILocation(line: 212, column: 17, scope: !331)
!333 = !DILocation(line: 213, column: 13, scope: !331)
!334 = !DILocation(line: 214, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !252, file: !67, line: 214, column: 17)
!336 = !DILocation(line: 214, column: 30, scope: !335)
!337 = !DILocation(line: 214, column: 17, scope: !252)
!338 = !DILocation(line: 216, column: 30, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !67, line: 215, column: 13)
!340 = !DILocation(line: 216, column: 17, scope: !339)
!341 = !DILocation(line: 217, column: 13, scope: !339)
!342 = !DILocation(line: 225, column: 5, scope: !253)
!343 = !DILocation(line: 226, column: 8, scope: !344)
!344 = distinct !DILexicalBlock(scope: !243, file: !67, line: 226, column: 8)
!345 = !DILocation(line: 226, column: 18, scope: !344)
!346 = !DILocation(line: 226, column: 8, scope: !243)
!347 = !DILocation(line: 229, column: 9, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !67, line: 227, column: 5)
!349 = !DILocation(line: 230, column: 5, scope: !348)
!350 = !DILocalVariable(name: "buffer", scope: !351, file: !67, line: 234, type: !201)
!351 = distinct !DILexicalBlock(scope: !352, file: !67, line: 233, column: 9)
!352 = distinct !DILexicalBlock(scope: !344, file: !67, line: 232, column: 5)
!353 = !DILocation(line: 234, column: 17, scope: !351)
!354 = !DILocation(line: 236, column: 17, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !67, line: 236, column: 17)
!356 = !DILocation(line: 236, column: 22, scope: !355)
!357 = !DILocation(line: 236, column: 27, scope: !355)
!358 = !DILocation(line: 236, column: 30, scope: !355)
!359 = !DILocation(line: 236, column: 35, scope: !355)
!360 = !DILocation(line: 236, column: 17, scope: !351)
!361 = !DILocation(line: 238, column: 37, scope: !362)
!362 = distinct !DILexicalBlock(scope: !355, file: !67, line: 237, column: 13)
!363 = !DILocation(line: 238, column: 30, scope: !362)
!364 = !DILocation(line: 238, column: 17, scope: !362)
!365 = !DILocation(line: 239, column: 13, scope: !362)
!366 = !DILocation(line: 242, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !355, file: !67, line: 241, column: 13)
!368 = !DILocation(line: 246, column: 1, scope: !243)
!369 = distinct !DISubprogram(name: "goodB2G2", scope: !67, file: !67, line: 249, type: !76, scopeLine: 250, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!370 = !DILocalVariable(name: "data", scope: !369, file: !67, line: 251, type: !68)
!371 = !DILocation(line: 251, column: 9, scope: !369)
!372 = !DILocation(line: 253, column: 10, scope: !369)
!373 = !DILocation(line: 254, column: 8, scope: !374)
!374 = distinct !DILexicalBlock(scope: !369, file: !67, line: 254, column: 8)
!375 = !DILocation(line: 254, column: 18, scope: !374)
!376 = !DILocation(line: 254, column: 8, scope: !369)
!377 = !DILocalVariable(name: "recvResult", scope: !378, file: !67, line: 261, type: !68)
!378 = distinct !DILexicalBlock(scope: !379, file: !67, line: 256, column: 9)
!379 = distinct !DILexicalBlock(scope: !374, file: !67, line: 255, column: 5)
!380 = !DILocation(line: 261, column: 17, scope: !378)
!381 = !DILocalVariable(name: "service", scope: !378, file: !67, line: 262, type: !91)
!382 = !DILocation(line: 262, column: 32, scope: !378)
!383 = !DILocalVariable(name: "listenSocket", scope: !378, file: !67, line: 263, type: !68)
!384 = !DILocation(line: 263, column: 20, scope: !378)
!385 = !DILocalVariable(name: "acceptSocket", scope: !378, file: !67, line: 264, type: !68)
!386 = !DILocation(line: 264, column: 20, scope: !378)
!387 = !DILocalVariable(name: "inputBuffer", scope: !378, file: !67, line: 265, type: !62)
!388 = !DILocation(line: 265, column: 18, scope: !378)
!389 = !DILocation(line: 266, column: 13, scope: !378)
!390 = !DILocation(line: 276, column: 32, scope: !391)
!391 = distinct !DILexicalBlock(scope: !378, file: !67, line: 267, column: 13)
!392 = !DILocation(line: 276, column: 30, scope: !391)
!393 = !DILocation(line: 277, column: 21, scope: !394)
!394 = distinct !DILexicalBlock(scope: !391, file: !67, line: 277, column: 21)
!395 = !DILocation(line: 277, column: 34, scope: !394)
!396 = !DILocation(line: 277, column: 21, scope: !391)
!397 = !DILocation(line: 279, column: 21, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !67, line: 278, column: 17)
!399 = !DILocation(line: 281, column: 17, scope: !391)
!400 = !DILocation(line: 282, column: 25, scope: !391)
!401 = !DILocation(line: 282, column: 36, scope: !391)
!402 = !DILocation(line: 283, column: 25, scope: !391)
!403 = !DILocation(line: 283, column: 34, scope: !391)
!404 = !DILocation(line: 283, column: 41, scope: !391)
!405 = !DILocation(line: 284, column: 36, scope: !391)
!406 = !DILocation(line: 284, column: 25, scope: !391)
!407 = !DILocation(line: 284, column: 34, scope: !391)
!408 = !DILocation(line: 285, column: 26, scope: !409)
!409 = distinct !DILexicalBlock(scope: !391, file: !67, line: 285, column: 21)
!410 = !DILocation(line: 285, column: 40, scope: !409)
!411 = !DILocation(line: 285, column: 21, scope: !409)
!412 = !DILocation(line: 285, column: 85, scope: !409)
!413 = !DILocation(line: 285, column: 21, scope: !391)
!414 = !DILocation(line: 287, column: 21, scope: !415)
!415 = distinct !DILexicalBlock(scope: !409, file: !67, line: 286, column: 17)
!416 = !DILocation(line: 289, column: 28, scope: !417)
!417 = distinct !DILexicalBlock(scope: !391, file: !67, line: 289, column: 21)
!418 = !DILocation(line: 289, column: 21, scope: !417)
!419 = !DILocation(line: 289, column: 58, scope: !417)
!420 = !DILocation(line: 289, column: 21, scope: !391)
!421 = !DILocation(line: 291, column: 21, scope: !422)
!422 = distinct !DILexicalBlock(scope: !417, file: !67, line: 290, column: 17)
!423 = !DILocation(line: 293, column: 39, scope: !391)
!424 = !DILocation(line: 293, column: 32, scope: !391)
!425 = !DILocation(line: 293, column: 30, scope: !391)
!426 = !DILocation(line: 294, column: 21, scope: !427)
!427 = distinct !DILexicalBlock(scope: !391, file: !67, line: 294, column: 21)
!428 = !DILocation(line: 294, column: 34, scope: !427)
!429 = !DILocation(line: 294, column: 21, scope: !391)
!430 = !DILocation(line: 296, column: 21, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !67, line: 295, column: 17)
!432 = !DILocation(line: 299, column: 35, scope: !391)
!433 = !DILocation(line: 299, column: 49, scope: !391)
!434 = !DILocation(line: 299, column: 30, scope: !391)
!435 = !DILocation(line: 299, column: 28, scope: !391)
!436 = !DILocation(line: 300, column: 21, scope: !437)
!437 = distinct !DILexicalBlock(scope: !391, file: !67, line: 300, column: 21)
!438 = !DILocation(line: 300, column: 32, scope: !437)
!439 = !DILocation(line: 300, column: 48, scope: !437)
!440 = !DILocation(line: 300, column: 51, scope: !437)
!441 = !DILocation(line: 300, column: 62, scope: !437)
!442 = !DILocation(line: 300, column: 21, scope: !391)
!443 = !DILocation(line: 302, column: 21, scope: !444)
!444 = distinct !DILexicalBlock(scope: !437, file: !67, line: 301, column: 17)
!445 = !DILocation(line: 305, column: 29, scope: !391)
!446 = !DILocation(line: 305, column: 17, scope: !391)
!447 = !DILocation(line: 305, column: 41, scope: !391)
!448 = !DILocation(line: 307, column: 29, scope: !391)
!449 = !DILocation(line: 307, column: 24, scope: !391)
!450 = !DILocation(line: 307, column: 22, scope: !391)
!451 = !DILocation(line: 308, column: 13, scope: !391)
!452 = !DILocation(line: 310, column: 17, scope: !453)
!453 = distinct !DILexicalBlock(scope: !378, file: !67, line: 310, column: 17)
!454 = !DILocation(line: 310, column: 30, scope: !453)
!455 = !DILocation(line: 310, column: 17, scope: !378)
!456 = !DILocation(line: 312, column: 30, scope: !457)
!457 = distinct !DILexicalBlock(scope: !453, file: !67, line: 311, column: 13)
!458 = !DILocation(line: 312, column: 17, scope: !457)
!459 = !DILocation(line: 313, column: 13, scope: !457)
!460 = !DILocation(line: 314, column: 17, scope: !461)
!461 = distinct !DILexicalBlock(scope: !378, file: !67, line: 314, column: 17)
!462 = !DILocation(line: 314, column: 30, scope: !461)
!463 = !DILocation(line: 314, column: 17, scope: !378)
!464 = !DILocation(line: 316, column: 30, scope: !465)
!465 = distinct !DILexicalBlock(scope: !461, file: !67, line: 315, column: 13)
!466 = !DILocation(line: 316, column: 17, scope: !465)
!467 = !DILocation(line: 317, column: 13, scope: !465)
!468 = !DILocation(line: 325, column: 5, scope: !379)
!469 = !DILocation(line: 326, column: 8, scope: !470)
!470 = distinct !DILexicalBlock(scope: !369, file: !67, line: 326, column: 8)
!471 = !DILocation(line: 326, column: 18, scope: !470)
!472 = !DILocation(line: 326, column: 8, scope: !369)
!473 = !DILocalVariable(name: "buffer", scope: !474, file: !67, line: 329, type: !201)
!474 = distinct !DILexicalBlock(scope: !475, file: !67, line: 328, column: 9)
!475 = distinct !DILexicalBlock(scope: !470, file: !67, line: 327, column: 5)
!476 = !DILocation(line: 329, column: 17, scope: !474)
!477 = !DILocation(line: 331, column: 17, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !67, line: 331, column: 17)
!479 = !DILocation(line: 331, column: 22, scope: !478)
!480 = !DILocation(line: 331, column: 27, scope: !478)
!481 = !DILocation(line: 331, column: 30, scope: !478)
!482 = !DILocation(line: 331, column: 35, scope: !478)
!483 = !DILocation(line: 331, column: 17, scope: !474)
!484 = !DILocation(line: 333, column: 37, scope: !485)
!485 = distinct !DILexicalBlock(scope: !478, file: !67, line: 332, column: 13)
!486 = !DILocation(line: 333, column: 30, scope: !485)
!487 = !DILocation(line: 333, column: 17, scope: !485)
!488 = !DILocation(line: 334, column: 13, scope: !485)
!489 = !DILocation(line: 337, column: 17, scope: !490)
!490 = distinct !DILexicalBlock(scope: !478, file: !67, line: 336, column: 13)
!491 = !DILocation(line: 340, column: 5, scope: !475)
!492 = !DILocation(line: 341, column: 1, scope: !369)
!493 = distinct !DISubprogram(name: "goodG2B1", scope: !67, file: !67, line: 344, type: !76, scopeLine: 345, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!494 = !DILocalVariable(name: "data", scope: !493, file: !67, line: 346, type: !68)
!495 = !DILocation(line: 346, column: 9, scope: !493)
!496 = !DILocation(line: 348, column: 10, scope: !493)
!497 = !DILocation(line: 349, column: 8, scope: !498)
!498 = distinct !DILexicalBlock(scope: !493, file: !67, line: 349, column: 8)
!499 = !DILocation(line: 349, column: 18, scope: !498)
!500 = !DILocation(line: 349, column: 8, scope: !493)
!501 = !DILocation(line: 352, column: 9, scope: !502)
!502 = distinct !DILexicalBlock(scope: !498, file: !67, line: 350, column: 5)
!503 = !DILocation(line: 353, column: 5, scope: !502)
!504 = !DILocation(line: 358, column: 14, scope: !505)
!505 = distinct !DILexicalBlock(scope: !498, file: !67, line: 355, column: 5)
!506 = !DILocation(line: 360, column: 8, scope: !507)
!507 = distinct !DILexicalBlock(scope: !493, file: !67, line: 360, column: 8)
!508 = !DILocation(line: 360, column: 18, scope: !507)
!509 = !DILocation(line: 360, column: 8, scope: !493)
!510 = !DILocalVariable(name: "buffer", scope: !511, file: !67, line: 363, type: !201)
!511 = distinct !DILexicalBlock(scope: !512, file: !67, line: 362, column: 9)
!512 = distinct !DILexicalBlock(scope: !507, file: !67, line: 361, column: 5)
!513 = !DILocation(line: 363, column: 17, scope: !511)
!514 = !DILocation(line: 366, column: 17, scope: !515)
!515 = distinct !DILexicalBlock(scope: !511, file: !67, line: 366, column: 17)
!516 = !DILocation(line: 366, column: 22, scope: !515)
!517 = !DILocation(line: 366, column: 17, scope: !511)
!518 = !DILocation(line: 368, column: 37, scope: !519)
!519 = distinct !DILexicalBlock(scope: !515, file: !67, line: 367, column: 13)
!520 = !DILocation(line: 368, column: 30, scope: !519)
!521 = !DILocation(line: 368, column: 17, scope: !519)
!522 = !DILocation(line: 369, column: 13, scope: !519)
!523 = !DILocation(line: 372, column: 17, scope: !524)
!524 = distinct !DILexicalBlock(scope: !515, file: !67, line: 371, column: 13)
!525 = !DILocation(line: 375, column: 5, scope: !512)
!526 = !DILocation(line: 376, column: 1, scope: !493)
!527 = distinct !DISubprogram(name: "goodG2B2", scope: !67, file: !67, line: 379, type: !76, scopeLine: 380, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!528 = !DILocalVariable(name: "data", scope: !527, file: !67, line: 381, type: !68)
!529 = !DILocation(line: 381, column: 9, scope: !527)
!530 = !DILocation(line: 383, column: 10, scope: !527)
!531 = !DILocation(line: 384, column: 8, scope: !532)
!532 = distinct !DILexicalBlock(scope: !527, file: !67, line: 384, column: 8)
!533 = !DILocation(line: 384, column: 18, scope: !532)
!534 = !DILocation(line: 384, column: 8, scope: !527)
!535 = !DILocation(line: 388, column: 14, scope: !536)
!536 = distinct !DILexicalBlock(scope: !532, file: !67, line: 385, column: 5)
!537 = !DILocation(line: 389, column: 5, scope: !536)
!538 = !DILocation(line: 390, column: 8, scope: !539)
!539 = distinct !DILexicalBlock(scope: !527, file: !67, line: 390, column: 8)
!540 = !DILocation(line: 390, column: 18, scope: !539)
!541 = !DILocation(line: 390, column: 8, scope: !527)
!542 = !DILocalVariable(name: "buffer", scope: !543, file: !67, line: 393, type: !201)
!543 = distinct !DILexicalBlock(scope: !544, file: !67, line: 392, column: 9)
!544 = distinct !DILexicalBlock(scope: !539, file: !67, line: 391, column: 5)
!545 = !DILocation(line: 393, column: 17, scope: !543)
!546 = !DILocation(line: 396, column: 17, scope: !547)
!547 = distinct !DILexicalBlock(scope: !543, file: !67, line: 396, column: 17)
!548 = !DILocation(line: 396, column: 22, scope: !547)
!549 = !DILocation(line: 396, column: 17, scope: !543)
!550 = !DILocation(line: 398, column: 37, scope: !551)
!551 = distinct !DILexicalBlock(scope: !547, file: !67, line: 397, column: 13)
!552 = !DILocation(line: 398, column: 30, scope: !551)
!553 = !DILocation(line: 398, column: 17, scope: !551)
!554 = !DILocation(line: 399, column: 13, scope: !551)
!555 = !DILocation(line: 402, column: 17, scope: !556)
!556 = distinct !DILexicalBlock(scope: !547, file: !67, line: 401, column: 13)
!557 = !DILocation(line: 405, column: 5, scope: !544)
!558 = !DILocation(line: 406, column: 1, scope: !527)
