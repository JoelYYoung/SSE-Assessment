; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_07_bad() #0 !dbg !75 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
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
  br i1 %cmp36, label %if.then38, label %if.end49, !dbg !197

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !198, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !202, metadata !DIExpression()), !dbg !206
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !206
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !206
  %18 = load i32, i32* %data, align 4, !dbg !207
  %cmp39 = icmp sge i32 %18, 0, !dbg !209
  br i1 %cmp39, label %if.then41, label %if.else, !dbg !210

if.then41:                                        ; preds = %if.then38
  %19 = load i32, i32* %data, align 4, !dbg !211
  %idxprom42 = sext i32 %19 to i64, !dbg !213
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !213
  store i32 1, i32* %arrayidx43, align 4, !dbg !214
  store i32 0, i32* %i, align 4, !dbg !215
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc, %if.then41
  %20 = load i32, i32* %i, align 4, !dbg !218
  %cmp44 = icmp slt i32 %20, 10, !dbg !220
  br i1 %cmp44, label %for.body, label %for.end, !dbg !221

for.body:                                         ; preds = %for.cond
  %21 = load i32, i32* %i, align 4, !dbg !222
  %idxprom46 = sext i32 %21 to i64, !dbg !224
  %arrayidx47 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom46, !dbg !224
  %22 = load i32, i32* %arrayidx47, align 4, !dbg !224
  call void @printIntLine(i32 %22), !dbg !225
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %i, align 4, !dbg !227
  %inc = add nsw i32 %23, 1, !dbg !227
  store i32 %inc, i32* %i, align 4, !dbg !227
  br label %for.cond, !dbg !228, !llvm.loop !229

for.end:                                          ; preds = %for.cond
  br label %if.end48, !dbg !232

if.else:                                          ; preds = %if.then38
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !233
  br label %if.end48

if.end48:                                         ; preds = %if.else, %for.end
  br label %if.end49, !dbg !235

if.end49:                                         ; preds = %if.end48, %if.end35
  ret void, !dbg !236
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_07_good() #0 !dbg !237 {
entry:
  call void @goodB2G1(), !dbg !238
  call void @goodB2G2(), !dbg !239
  call void @goodG2B1(), !dbg !240
  call void @goodG2B2(), !dbg !241
  ret void, !dbg !242
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !243 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !248, metadata !DIExpression()), !dbg !249
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !250, metadata !DIExpression()), !dbg !251
  %call = call i64 @time(i64* null) #7, !dbg !252
  %conv = trunc i64 %call to i32, !dbg !253
  call void @srand(i32 %conv) #7, !dbg !254
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !255
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_07_good(), !dbg !256
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !257
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !258
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_07_bad(), !dbg !259
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !260
  ret i32 0, !dbg !261
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !262 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 -1, i32* %data, align 4, !dbg !265
  %0 = load i32, i32* @staticFive, align 4, !dbg !266
  %cmp = icmp eq i32 %0, 5, !dbg !268
  br i1 %cmp, label %if.then, label %if.end35, !dbg !269

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !270, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !274, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !276, metadata !DIExpression()), !dbg !277
  store i32 -1, i32* %listenSocket, align 4, !dbg !277
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !278, metadata !DIExpression()), !dbg !279
  store i32 -1, i32* %acceptSocket, align 4, !dbg !279
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !280, metadata !DIExpression()), !dbg !281
  br label %do.body, !dbg !282

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !283
  store i32 %call, i32* %listenSocket, align 4, !dbg !285
  %1 = load i32, i32* %listenSocket, align 4, !dbg !286
  %cmp1 = icmp eq i32 %1, -1, !dbg !288
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !289

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !290

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !292
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !292
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !293
  store i16 2, i16* %sin_family, align 4, !dbg !294
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !295
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !296
  store i32 0, i32* %s_addr, align 4, !dbg !297
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !298
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !299
  store i16 %call3, i16* %sin_port, align 2, !dbg !300
  %3 = load i32, i32* %listenSocket, align 4, !dbg !301
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !303
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !304
  %cmp5 = icmp eq i32 %call4, -1, !dbg !305
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !306

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !307

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !309
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !311
  %cmp9 = icmp eq i32 %call8, -1, !dbg !312
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !313

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !314

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !316
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !317
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !318
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !319
  %cmp13 = icmp eq i32 %7, -1, !dbg !321
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !322

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !323

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !325
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !326
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !327
  %conv = trunc i64 %call16 to i32, !dbg !327
  store i32 %conv, i32* %recvResult, align 4, !dbg !328
  %9 = load i32, i32* %recvResult, align 4, !dbg !329
  %cmp17 = icmp eq i32 %9, -1, !dbg !331
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !332

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !333
  %cmp19 = icmp eq i32 %10, 0, !dbg !334
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !335

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !336

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !338
  %idxprom = sext i32 %11 to i64, !dbg !339
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !339
  store i8 0, i8* %arrayidx, align 1, !dbg !340
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !341
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !342
  store i32 %call24, i32* %data, align 4, !dbg !343
  br label %do.end, !dbg !344

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !345
  %cmp25 = icmp ne i32 %12, -1, !dbg !347
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !348

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !349
  %call28 = call i32 @close(i32 %13), !dbg !351
  br label %if.end29, !dbg !352

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !353
  %cmp30 = icmp ne i32 %14, -1, !dbg !355
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !356

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !357
  %call33 = call i32 @close(i32 %15), !dbg !359
  br label %if.end34, !dbg !360

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !361

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !362
  %cmp36 = icmp ne i32 %16, 5, !dbg !364
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !365

if.then38:                                        ; preds = %if.end35
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !366
  br label %if.end52, !dbg !368

if.else:                                          ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !369, metadata !DIExpression()), !dbg !372
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !373, metadata !DIExpression()), !dbg !374
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !374
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !374
  %18 = load i32, i32* %data, align 4, !dbg !375
  %cmp39 = icmp sge i32 %18, 0, !dbg !377
  br i1 %cmp39, label %land.lhs.true, label %if.else50, !dbg !378

land.lhs.true:                                    ; preds = %if.else
  %19 = load i32, i32* %data, align 4, !dbg !379
  %cmp41 = icmp slt i32 %19, 10, !dbg !380
  br i1 %cmp41, label %if.then43, label %if.else50, !dbg !381

if.then43:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !382
  %idxprom44 = sext i32 %20 to i64, !dbg !384
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !384
  store i32 1, i32* %arrayidx45, align 4, !dbg !385
  store i32 0, i32* %i, align 4, !dbg !386
  br label %for.cond, !dbg !388

for.cond:                                         ; preds = %for.inc, %if.then43
  %21 = load i32, i32* %i, align 4, !dbg !389
  %cmp46 = icmp slt i32 %21, 10, !dbg !391
  br i1 %cmp46, label %for.body, label %for.end, !dbg !392

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !393
  %idxprom48 = sext i32 %22 to i64, !dbg !395
  %arrayidx49 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom48, !dbg !395
  %23 = load i32, i32* %arrayidx49, align 4, !dbg !395
  call void @printIntLine(i32 %23), !dbg !396
  br label %for.inc, !dbg !397

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !398
  %inc = add nsw i32 %24, 1, !dbg !398
  store i32 %inc, i32* %i, align 4, !dbg !398
  br label %for.cond, !dbg !399, !llvm.loop !400

for.end:                                          ; preds = %for.cond
  br label %if.end51, !dbg !402

if.else50:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !403
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %for.end
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then38
  ret void, !dbg !405
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !406 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !407, metadata !DIExpression()), !dbg !408
  store i32 -1, i32* %data, align 4, !dbg !409
  %0 = load i32, i32* @staticFive, align 4, !dbg !410
  %cmp = icmp eq i32 %0, 5, !dbg !412
  br i1 %cmp, label %if.then, label %if.end35, !dbg !413

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !414, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !418, metadata !DIExpression()), !dbg !419
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !420, metadata !DIExpression()), !dbg !421
  store i32 -1, i32* %listenSocket, align 4, !dbg !421
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !422, metadata !DIExpression()), !dbg !423
  store i32 -1, i32* %acceptSocket, align 4, !dbg !423
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !424, metadata !DIExpression()), !dbg !425
  br label %do.body, !dbg !426

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !427
  store i32 %call, i32* %listenSocket, align 4, !dbg !429
  %1 = load i32, i32* %listenSocket, align 4, !dbg !430
  %cmp1 = icmp eq i32 %1, -1, !dbg !432
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !433

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !434

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !436
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !436
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !437
  store i16 2, i16* %sin_family, align 4, !dbg !438
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !439
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !440
  store i32 0, i32* %s_addr, align 4, !dbg !441
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !442
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !443
  store i16 %call3, i16* %sin_port, align 2, !dbg !444
  %3 = load i32, i32* %listenSocket, align 4, !dbg !445
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !447
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !448
  %cmp5 = icmp eq i32 %call4, -1, !dbg !449
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !450

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !451

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !453
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !455
  %cmp9 = icmp eq i32 %call8, -1, !dbg !456
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !457

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !458

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !460
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !461
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !462
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !463
  %cmp13 = icmp eq i32 %7, -1, !dbg !465
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !466

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !467

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !469
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !470
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !471
  %conv = trunc i64 %call16 to i32, !dbg !471
  store i32 %conv, i32* %recvResult, align 4, !dbg !472
  %9 = load i32, i32* %recvResult, align 4, !dbg !473
  %cmp17 = icmp eq i32 %9, -1, !dbg !475
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !476

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !477
  %cmp19 = icmp eq i32 %10, 0, !dbg !478
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !479

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !480

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !482
  %idxprom = sext i32 %11 to i64, !dbg !483
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !483
  store i8 0, i8* %arrayidx, align 1, !dbg !484
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !485
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !486
  store i32 %call24, i32* %data, align 4, !dbg !487
  br label %do.end, !dbg !488

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !489
  %cmp25 = icmp ne i32 %12, -1, !dbg !491
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !492

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !493
  %call28 = call i32 @close(i32 %13), !dbg !495
  br label %if.end29, !dbg !496

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !497
  %cmp30 = icmp ne i32 %14, -1, !dbg !499
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !500

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !501
  %call33 = call i32 @close(i32 %15), !dbg !503
  br label %if.end34, !dbg !504

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !505

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !506
  %cmp36 = icmp eq i32 %16, 5, !dbg !508
  br i1 %cmp36, label %if.then38, label %if.end51, !dbg !509

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !510, metadata !DIExpression()), !dbg !513
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !514, metadata !DIExpression()), !dbg !515
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !515
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !515
  %18 = load i32, i32* %data, align 4, !dbg !516
  %cmp39 = icmp sge i32 %18, 0, !dbg !518
  br i1 %cmp39, label %land.lhs.true, label %if.else, !dbg !519

land.lhs.true:                                    ; preds = %if.then38
  %19 = load i32, i32* %data, align 4, !dbg !520
  %cmp41 = icmp slt i32 %19, 10, !dbg !521
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !522

if.then43:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !523
  %idxprom44 = sext i32 %20 to i64, !dbg !525
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !525
  store i32 1, i32* %arrayidx45, align 4, !dbg !526
  store i32 0, i32* %i, align 4, !dbg !527
  br label %for.cond, !dbg !529

for.cond:                                         ; preds = %for.inc, %if.then43
  %21 = load i32, i32* %i, align 4, !dbg !530
  %cmp46 = icmp slt i32 %21, 10, !dbg !532
  br i1 %cmp46, label %for.body, label %for.end, !dbg !533

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !534
  %idxprom48 = sext i32 %22 to i64, !dbg !536
  %arrayidx49 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom48, !dbg !536
  %23 = load i32, i32* %arrayidx49, align 4, !dbg !536
  call void @printIntLine(i32 %23), !dbg !537
  br label %for.inc, !dbg !538

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !539
  %inc = add nsw i32 %24, 1, !dbg !539
  store i32 %inc, i32* %i, align 4, !dbg !539
  br label %for.cond, !dbg !540, !llvm.loop !541

for.end:                                          ; preds = %for.cond
  br label %if.end50, !dbg !543

if.else:                                          ; preds = %land.lhs.true, %if.then38
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !544
  br label %if.end50

if.end50:                                         ; preds = %if.else, %for.end
  br label %if.end51, !dbg !546

if.end51:                                         ; preds = %if.end50, %if.end35
  ret void, !dbg !547
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !548 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !549, metadata !DIExpression()), !dbg !550
  store i32 -1, i32* %data, align 4, !dbg !551
  %0 = load i32, i32* @staticFive, align 4, !dbg !552
  %cmp = icmp ne i32 %0, 5, !dbg !554
  br i1 %cmp, label %if.then, label %if.else, !dbg !555

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !556
  br label %if.end, !dbg !558

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !559
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !561
  %cmp1 = icmp eq i32 %1, 5, !dbg !563
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !564

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !565, metadata !DIExpression()), !dbg !568
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !569, metadata !DIExpression()), !dbg !570
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !570
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !570
  %3 = load i32, i32* %data, align 4, !dbg !571
  %cmp3 = icmp sge i32 %3, 0, !dbg !573
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !574

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !575
  %idxprom = sext i32 %4 to i64, !dbg !577
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !577
  store i32 1, i32* %arrayidx, align 4, !dbg !578
  store i32 0, i32* %i, align 4, !dbg !579
  br label %for.cond, !dbg !581

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !582
  %cmp5 = icmp slt i32 %5, 10, !dbg !584
  br i1 %cmp5, label %for.body, label %for.end, !dbg !585

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !586
  %idxprom6 = sext i32 %6 to i64, !dbg !588
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !588
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !588
  call void @printIntLine(i32 %7), !dbg !589
  br label %for.inc, !dbg !590

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !591
  %inc = add nsw i32 %8, 1, !dbg !591
  store i32 %inc, i32* %i, align 4, !dbg !591
  br label %for.cond, !dbg !592, !llvm.loop !593

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !595

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !596
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !598

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !599
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !600 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !601, metadata !DIExpression()), !dbg !602
  store i32 -1, i32* %data, align 4, !dbg !603
  %0 = load i32, i32* @staticFive, align 4, !dbg !604
  %cmp = icmp eq i32 %0, 5, !dbg !606
  br i1 %cmp, label %if.then, label %if.end, !dbg !607

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !608
  br label %if.end, !dbg !610

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !611
  %cmp1 = icmp eq i32 %1, 5, !dbg !613
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !614

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !615, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !619, metadata !DIExpression()), !dbg !620
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !620
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !620
  %3 = load i32, i32* %data, align 4, !dbg !621
  %cmp3 = icmp sge i32 %3, 0, !dbg !623
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !624

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !625
  %idxprom = sext i32 %4 to i64, !dbg !627
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !627
  store i32 1, i32* %arrayidx, align 4, !dbg !628
  store i32 0, i32* %i, align 4, !dbg !629
  br label %for.cond, !dbg !631

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !632
  %cmp5 = icmp slt i32 %5, 10, !dbg !634
  br i1 %cmp5, label %for.body, label %for.end, !dbg !635

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !636
  %idxprom6 = sext i32 %6 to i64, !dbg !638
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !638
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !638
  call void @printIntLine(i32 %7), !dbg !639
  br label %for.inc, !dbg !640

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !641
  %inc = add nsw i32 %8, 1, !dbg !641
  store i32 %inc, i32* %i, align 4, !dbg !641
  br label %for.cond, !dbg !642, !llvm.loop !643

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !645

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !646
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !648

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !649
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_07.c", directory: "/home/joelyang/SSE-Assessment")
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
!67 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_07.c", directory: "/home/joelyang/SSE-Assessment")
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !{i32 7, !"Dwarf Version", i32 4}
!70 = !{i32 2, !"Debug Info Version", i32 3}
!71 = !{i32 1, !"wchar_size", i32 4}
!72 = !{i32 7, !"uwtable", i32 1}
!73 = !{i32 7, !"frame-pointer", i32 2}
!74 = !{!"clang version 13.0.0"}
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_07_bad", scope: !67, file: !67, line: 49, type: !76, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
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
!198 = !DILocalVariable(name: "i", scope: !199, file: !67, line: 129, type: !68)
!199 = distinct !DILexicalBlock(scope: !200, file: !67, line: 128, column: 9)
!200 = distinct !DILexicalBlock(scope: !195, file: !67, line: 127, column: 5)
!201 = !DILocation(line: 129, column: 17, scope: !199)
!202 = !DILocalVariable(name: "buffer", scope: !199, file: !67, line: 130, type: !203)
!203 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 320, elements: !204)
!204 = !{!205}
!205 = !DISubrange(count: 10)
!206 = !DILocation(line: 130, column: 17, scope: !199)
!207 = !DILocation(line: 133, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !199, file: !67, line: 133, column: 17)
!209 = !DILocation(line: 133, column: 22, scope: !208)
!210 = !DILocation(line: 133, column: 17, scope: !199)
!211 = !DILocation(line: 135, column: 24, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !67, line: 134, column: 13)
!213 = !DILocation(line: 135, column: 17, scope: !212)
!214 = !DILocation(line: 135, column: 30, scope: !212)
!215 = !DILocation(line: 137, column: 23, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !67, line: 137, column: 17)
!217 = !DILocation(line: 137, column: 21, scope: !216)
!218 = !DILocation(line: 137, column: 28, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !67, line: 137, column: 17)
!220 = !DILocation(line: 137, column: 30, scope: !219)
!221 = !DILocation(line: 137, column: 17, scope: !216)
!222 = !DILocation(line: 139, column: 41, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !67, line: 138, column: 17)
!224 = !DILocation(line: 139, column: 34, scope: !223)
!225 = !DILocation(line: 139, column: 21, scope: !223)
!226 = !DILocation(line: 140, column: 17, scope: !223)
!227 = !DILocation(line: 137, column: 37, scope: !219)
!228 = !DILocation(line: 137, column: 17, scope: !219)
!229 = distinct !{!229, !221, !230, !231}
!230 = !DILocation(line: 140, column: 17, scope: !216)
!231 = !{!"llvm.loop.mustprogress"}
!232 = !DILocation(line: 141, column: 13, scope: !212)
!233 = !DILocation(line: 144, column: 17, scope: !234)
!234 = distinct !DILexicalBlock(scope: !208, file: !67, line: 143, column: 13)
!235 = !DILocation(line: 147, column: 5, scope: !200)
!236 = !DILocation(line: 148, column: 1, scope: !75)
!237 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_07_good", scope: !67, file: !67, line: 438, type: !76, scopeLine: 439, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!238 = !DILocation(line: 440, column: 5, scope: !237)
!239 = !DILocation(line: 441, column: 5, scope: !237)
!240 = !DILocation(line: 442, column: 5, scope: !237)
!241 = !DILocation(line: 443, column: 5, scope: !237)
!242 = !DILocation(line: 444, column: 1, scope: !237)
!243 = distinct !DISubprogram(name: "main", scope: !67, file: !67, line: 455, type: !244, scopeLine: 456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !78)
!244 = !DISubroutineType(types: !245)
!245 = !{!68, !68, !246}
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!248 = !DILocalVariable(name: "argc", arg: 1, scope: !243, file: !67, line: 455, type: !68)
!249 = !DILocation(line: 455, column: 14, scope: !243)
!250 = !DILocalVariable(name: "argv", arg: 2, scope: !243, file: !67, line: 455, type: !246)
!251 = !DILocation(line: 455, column: 27, scope: !243)
!252 = !DILocation(line: 458, column: 22, scope: !243)
!253 = !DILocation(line: 458, column: 12, scope: !243)
!254 = !DILocation(line: 458, column: 5, scope: !243)
!255 = !DILocation(line: 460, column: 5, scope: !243)
!256 = !DILocation(line: 461, column: 5, scope: !243)
!257 = !DILocation(line: 462, column: 5, scope: !243)
!258 = !DILocation(line: 465, column: 5, scope: !243)
!259 = !DILocation(line: 466, column: 5, scope: !243)
!260 = !DILocation(line: 467, column: 5, scope: !243)
!261 = !DILocation(line: 469, column: 5, scope: !243)
!262 = distinct !DISubprogram(name: "goodB2G1", scope: !67, file: !67, line: 155, type: !76, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!263 = !DILocalVariable(name: "data", scope: !262, file: !67, line: 157, type: !68)
!264 = !DILocation(line: 157, column: 9, scope: !262)
!265 = !DILocation(line: 159, column: 10, scope: !262)
!266 = !DILocation(line: 160, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !262, file: !67, line: 160, column: 8)
!268 = !DILocation(line: 160, column: 18, scope: !267)
!269 = !DILocation(line: 160, column: 8, scope: !262)
!270 = !DILocalVariable(name: "recvResult", scope: !271, file: !67, line: 167, type: !68)
!271 = distinct !DILexicalBlock(scope: !272, file: !67, line: 162, column: 9)
!272 = distinct !DILexicalBlock(scope: !267, file: !67, line: 161, column: 5)
!273 = !DILocation(line: 167, column: 17, scope: !271)
!274 = !DILocalVariable(name: "service", scope: !271, file: !67, line: 168, type: !91)
!275 = !DILocation(line: 168, column: 32, scope: !271)
!276 = !DILocalVariable(name: "listenSocket", scope: !271, file: !67, line: 169, type: !68)
!277 = !DILocation(line: 169, column: 20, scope: !271)
!278 = !DILocalVariable(name: "acceptSocket", scope: !271, file: !67, line: 170, type: !68)
!279 = !DILocation(line: 170, column: 20, scope: !271)
!280 = !DILocalVariable(name: "inputBuffer", scope: !271, file: !67, line: 171, type: !62)
!281 = !DILocation(line: 171, column: 18, scope: !271)
!282 = !DILocation(line: 172, column: 13, scope: !271)
!283 = !DILocation(line: 182, column: 32, scope: !284)
!284 = distinct !DILexicalBlock(scope: !271, file: !67, line: 173, column: 13)
!285 = !DILocation(line: 182, column: 30, scope: !284)
!286 = !DILocation(line: 183, column: 21, scope: !287)
!287 = distinct !DILexicalBlock(scope: !284, file: !67, line: 183, column: 21)
!288 = !DILocation(line: 183, column: 34, scope: !287)
!289 = !DILocation(line: 183, column: 21, scope: !284)
!290 = !DILocation(line: 185, column: 21, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !67, line: 184, column: 17)
!292 = !DILocation(line: 187, column: 17, scope: !284)
!293 = !DILocation(line: 188, column: 25, scope: !284)
!294 = !DILocation(line: 188, column: 36, scope: !284)
!295 = !DILocation(line: 189, column: 25, scope: !284)
!296 = !DILocation(line: 189, column: 34, scope: !284)
!297 = !DILocation(line: 189, column: 41, scope: !284)
!298 = !DILocation(line: 190, column: 36, scope: !284)
!299 = !DILocation(line: 190, column: 25, scope: !284)
!300 = !DILocation(line: 190, column: 34, scope: !284)
!301 = !DILocation(line: 191, column: 26, scope: !302)
!302 = distinct !DILexicalBlock(scope: !284, file: !67, line: 191, column: 21)
!303 = !DILocation(line: 191, column: 40, scope: !302)
!304 = !DILocation(line: 191, column: 21, scope: !302)
!305 = !DILocation(line: 191, column: 85, scope: !302)
!306 = !DILocation(line: 191, column: 21, scope: !284)
!307 = !DILocation(line: 193, column: 21, scope: !308)
!308 = distinct !DILexicalBlock(scope: !302, file: !67, line: 192, column: 17)
!309 = !DILocation(line: 195, column: 28, scope: !310)
!310 = distinct !DILexicalBlock(scope: !284, file: !67, line: 195, column: 21)
!311 = !DILocation(line: 195, column: 21, scope: !310)
!312 = !DILocation(line: 195, column: 58, scope: !310)
!313 = !DILocation(line: 195, column: 21, scope: !284)
!314 = !DILocation(line: 197, column: 21, scope: !315)
!315 = distinct !DILexicalBlock(scope: !310, file: !67, line: 196, column: 17)
!316 = !DILocation(line: 199, column: 39, scope: !284)
!317 = !DILocation(line: 199, column: 32, scope: !284)
!318 = !DILocation(line: 199, column: 30, scope: !284)
!319 = !DILocation(line: 200, column: 21, scope: !320)
!320 = distinct !DILexicalBlock(scope: !284, file: !67, line: 200, column: 21)
!321 = !DILocation(line: 200, column: 34, scope: !320)
!322 = !DILocation(line: 200, column: 21, scope: !284)
!323 = !DILocation(line: 202, column: 21, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !67, line: 201, column: 17)
!325 = !DILocation(line: 205, column: 35, scope: !284)
!326 = !DILocation(line: 205, column: 49, scope: !284)
!327 = !DILocation(line: 205, column: 30, scope: !284)
!328 = !DILocation(line: 205, column: 28, scope: !284)
!329 = !DILocation(line: 206, column: 21, scope: !330)
!330 = distinct !DILexicalBlock(scope: !284, file: !67, line: 206, column: 21)
!331 = !DILocation(line: 206, column: 32, scope: !330)
!332 = !DILocation(line: 206, column: 48, scope: !330)
!333 = !DILocation(line: 206, column: 51, scope: !330)
!334 = !DILocation(line: 206, column: 62, scope: !330)
!335 = !DILocation(line: 206, column: 21, scope: !284)
!336 = !DILocation(line: 208, column: 21, scope: !337)
!337 = distinct !DILexicalBlock(scope: !330, file: !67, line: 207, column: 17)
!338 = !DILocation(line: 211, column: 29, scope: !284)
!339 = !DILocation(line: 211, column: 17, scope: !284)
!340 = !DILocation(line: 211, column: 41, scope: !284)
!341 = !DILocation(line: 213, column: 29, scope: !284)
!342 = !DILocation(line: 213, column: 24, scope: !284)
!343 = !DILocation(line: 213, column: 22, scope: !284)
!344 = !DILocation(line: 214, column: 13, scope: !284)
!345 = !DILocation(line: 216, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !271, file: !67, line: 216, column: 17)
!347 = !DILocation(line: 216, column: 30, scope: !346)
!348 = !DILocation(line: 216, column: 17, scope: !271)
!349 = !DILocation(line: 218, column: 30, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !67, line: 217, column: 13)
!351 = !DILocation(line: 218, column: 17, scope: !350)
!352 = !DILocation(line: 219, column: 13, scope: !350)
!353 = !DILocation(line: 220, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !271, file: !67, line: 220, column: 17)
!355 = !DILocation(line: 220, column: 30, scope: !354)
!356 = !DILocation(line: 220, column: 17, scope: !271)
!357 = !DILocation(line: 222, column: 30, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !67, line: 221, column: 13)
!359 = !DILocation(line: 222, column: 17, scope: !358)
!360 = !DILocation(line: 223, column: 13, scope: !358)
!361 = !DILocation(line: 231, column: 5, scope: !272)
!362 = !DILocation(line: 232, column: 8, scope: !363)
!363 = distinct !DILexicalBlock(scope: !262, file: !67, line: 232, column: 8)
!364 = !DILocation(line: 232, column: 18, scope: !363)
!365 = !DILocation(line: 232, column: 8, scope: !262)
!366 = !DILocation(line: 235, column: 9, scope: !367)
!367 = distinct !DILexicalBlock(scope: !363, file: !67, line: 233, column: 5)
!368 = !DILocation(line: 236, column: 5, scope: !367)
!369 = !DILocalVariable(name: "i", scope: !370, file: !67, line: 240, type: !68)
!370 = distinct !DILexicalBlock(scope: !371, file: !67, line: 239, column: 9)
!371 = distinct !DILexicalBlock(scope: !363, file: !67, line: 238, column: 5)
!372 = !DILocation(line: 240, column: 17, scope: !370)
!373 = !DILocalVariable(name: "buffer", scope: !370, file: !67, line: 241, type: !203)
!374 = !DILocation(line: 241, column: 17, scope: !370)
!375 = !DILocation(line: 243, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !370, file: !67, line: 243, column: 17)
!377 = !DILocation(line: 243, column: 22, scope: !376)
!378 = !DILocation(line: 243, column: 27, scope: !376)
!379 = !DILocation(line: 243, column: 30, scope: !376)
!380 = !DILocation(line: 243, column: 35, scope: !376)
!381 = !DILocation(line: 243, column: 17, scope: !370)
!382 = !DILocation(line: 245, column: 24, scope: !383)
!383 = distinct !DILexicalBlock(scope: !376, file: !67, line: 244, column: 13)
!384 = !DILocation(line: 245, column: 17, scope: !383)
!385 = !DILocation(line: 245, column: 30, scope: !383)
!386 = !DILocation(line: 247, column: 23, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !67, line: 247, column: 17)
!388 = !DILocation(line: 247, column: 21, scope: !387)
!389 = !DILocation(line: 247, column: 28, scope: !390)
!390 = distinct !DILexicalBlock(scope: !387, file: !67, line: 247, column: 17)
!391 = !DILocation(line: 247, column: 30, scope: !390)
!392 = !DILocation(line: 247, column: 17, scope: !387)
!393 = !DILocation(line: 249, column: 41, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !67, line: 248, column: 17)
!395 = !DILocation(line: 249, column: 34, scope: !394)
!396 = !DILocation(line: 249, column: 21, scope: !394)
!397 = !DILocation(line: 250, column: 17, scope: !394)
!398 = !DILocation(line: 247, column: 37, scope: !390)
!399 = !DILocation(line: 247, column: 17, scope: !390)
!400 = distinct !{!400, !392, !401, !231}
!401 = !DILocation(line: 250, column: 17, scope: !387)
!402 = !DILocation(line: 251, column: 13, scope: !383)
!403 = !DILocation(line: 254, column: 17, scope: !404)
!404 = distinct !DILexicalBlock(scope: !376, file: !67, line: 253, column: 13)
!405 = !DILocation(line: 258, column: 1, scope: !262)
!406 = distinct !DISubprogram(name: "goodB2G2", scope: !67, file: !67, line: 261, type: !76, scopeLine: 262, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!407 = !DILocalVariable(name: "data", scope: !406, file: !67, line: 263, type: !68)
!408 = !DILocation(line: 263, column: 9, scope: !406)
!409 = !DILocation(line: 265, column: 10, scope: !406)
!410 = !DILocation(line: 266, column: 8, scope: !411)
!411 = distinct !DILexicalBlock(scope: !406, file: !67, line: 266, column: 8)
!412 = !DILocation(line: 266, column: 18, scope: !411)
!413 = !DILocation(line: 266, column: 8, scope: !406)
!414 = !DILocalVariable(name: "recvResult", scope: !415, file: !67, line: 273, type: !68)
!415 = distinct !DILexicalBlock(scope: !416, file: !67, line: 268, column: 9)
!416 = distinct !DILexicalBlock(scope: !411, file: !67, line: 267, column: 5)
!417 = !DILocation(line: 273, column: 17, scope: !415)
!418 = !DILocalVariable(name: "service", scope: !415, file: !67, line: 274, type: !91)
!419 = !DILocation(line: 274, column: 32, scope: !415)
!420 = !DILocalVariable(name: "listenSocket", scope: !415, file: !67, line: 275, type: !68)
!421 = !DILocation(line: 275, column: 20, scope: !415)
!422 = !DILocalVariable(name: "acceptSocket", scope: !415, file: !67, line: 276, type: !68)
!423 = !DILocation(line: 276, column: 20, scope: !415)
!424 = !DILocalVariable(name: "inputBuffer", scope: !415, file: !67, line: 277, type: !62)
!425 = !DILocation(line: 277, column: 18, scope: !415)
!426 = !DILocation(line: 278, column: 13, scope: !415)
!427 = !DILocation(line: 288, column: 32, scope: !428)
!428 = distinct !DILexicalBlock(scope: !415, file: !67, line: 279, column: 13)
!429 = !DILocation(line: 288, column: 30, scope: !428)
!430 = !DILocation(line: 289, column: 21, scope: !431)
!431 = distinct !DILexicalBlock(scope: !428, file: !67, line: 289, column: 21)
!432 = !DILocation(line: 289, column: 34, scope: !431)
!433 = !DILocation(line: 289, column: 21, scope: !428)
!434 = !DILocation(line: 291, column: 21, scope: !435)
!435 = distinct !DILexicalBlock(scope: !431, file: !67, line: 290, column: 17)
!436 = !DILocation(line: 293, column: 17, scope: !428)
!437 = !DILocation(line: 294, column: 25, scope: !428)
!438 = !DILocation(line: 294, column: 36, scope: !428)
!439 = !DILocation(line: 295, column: 25, scope: !428)
!440 = !DILocation(line: 295, column: 34, scope: !428)
!441 = !DILocation(line: 295, column: 41, scope: !428)
!442 = !DILocation(line: 296, column: 36, scope: !428)
!443 = !DILocation(line: 296, column: 25, scope: !428)
!444 = !DILocation(line: 296, column: 34, scope: !428)
!445 = !DILocation(line: 297, column: 26, scope: !446)
!446 = distinct !DILexicalBlock(scope: !428, file: !67, line: 297, column: 21)
!447 = !DILocation(line: 297, column: 40, scope: !446)
!448 = !DILocation(line: 297, column: 21, scope: !446)
!449 = !DILocation(line: 297, column: 85, scope: !446)
!450 = !DILocation(line: 297, column: 21, scope: !428)
!451 = !DILocation(line: 299, column: 21, scope: !452)
!452 = distinct !DILexicalBlock(scope: !446, file: !67, line: 298, column: 17)
!453 = !DILocation(line: 301, column: 28, scope: !454)
!454 = distinct !DILexicalBlock(scope: !428, file: !67, line: 301, column: 21)
!455 = !DILocation(line: 301, column: 21, scope: !454)
!456 = !DILocation(line: 301, column: 58, scope: !454)
!457 = !DILocation(line: 301, column: 21, scope: !428)
!458 = !DILocation(line: 303, column: 21, scope: !459)
!459 = distinct !DILexicalBlock(scope: !454, file: !67, line: 302, column: 17)
!460 = !DILocation(line: 305, column: 39, scope: !428)
!461 = !DILocation(line: 305, column: 32, scope: !428)
!462 = !DILocation(line: 305, column: 30, scope: !428)
!463 = !DILocation(line: 306, column: 21, scope: !464)
!464 = distinct !DILexicalBlock(scope: !428, file: !67, line: 306, column: 21)
!465 = !DILocation(line: 306, column: 34, scope: !464)
!466 = !DILocation(line: 306, column: 21, scope: !428)
!467 = !DILocation(line: 308, column: 21, scope: !468)
!468 = distinct !DILexicalBlock(scope: !464, file: !67, line: 307, column: 17)
!469 = !DILocation(line: 311, column: 35, scope: !428)
!470 = !DILocation(line: 311, column: 49, scope: !428)
!471 = !DILocation(line: 311, column: 30, scope: !428)
!472 = !DILocation(line: 311, column: 28, scope: !428)
!473 = !DILocation(line: 312, column: 21, scope: !474)
!474 = distinct !DILexicalBlock(scope: !428, file: !67, line: 312, column: 21)
!475 = !DILocation(line: 312, column: 32, scope: !474)
!476 = !DILocation(line: 312, column: 48, scope: !474)
!477 = !DILocation(line: 312, column: 51, scope: !474)
!478 = !DILocation(line: 312, column: 62, scope: !474)
!479 = !DILocation(line: 312, column: 21, scope: !428)
!480 = !DILocation(line: 314, column: 21, scope: !481)
!481 = distinct !DILexicalBlock(scope: !474, file: !67, line: 313, column: 17)
!482 = !DILocation(line: 317, column: 29, scope: !428)
!483 = !DILocation(line: 317, column: 17, scope: !428)
!484 = !DILocation(line: 317, column: 41, scope: !428)
!485 = !DILocation(line: 319, column: 29, scope: !428)
!486 = !DILocation(line: 319, column: 24, scope: !428)
!487 = !DILocation(line: 319, column: 22, scope: !428)
!488 = !DILocation(line: 320, column: 13, scope: !428)
!489 = !DILocation(line: 322, column: 17, scope: !490)
!490 = distinct !DILexicalBlock(scope: !415, file: !67, line: 322, column: 17)
!491 = !DILocation(line: 322, column: 30, scope: !490)
!492 = !DILocation(line: 322, column: 17, scope: !415)
!493 = !DILocation(line: 324, column: 30, scope: !494)
!494 = distinct !DILexicalBlock(scope: !490, file: !67, line: 323, column: 13)
!495 = !DILocation(line: 324, column: 17, scope: !494)
!496 = !DILocation(line: 325, column: 13, scope: !494)
!497 = !DILocation(line: 326, column: 17, scope: !498)
!498 = distinct !DILexicalBlock(scope: !415, file: !67, line: 326, column: 17)
!499 = !DILocation(line: 326, column: 30, scope: !498)
!500 = !DILocation(line: 326, column: 17, scope: !415)
!501 = !DILocation(line: 328, column: 30, scope: !502)
!502 = distinct !DILexicalBlock(scope: !498, file: !67, line: 327, column: 13)
!503 = !DILocation(line: 328, column: 17, scope: !502)
!504 = !DILocation(line: 329, column: 13, scope: !502)
!505 = !DILocation(line: 337, column: 5, scope: !416)
!506 = !DILocation(line: 338, column: 8, scope: !507)
!507 = distinct !DILexicalBlock(scope: !406, file: !67, line: 338, column: 8)
!508 = !DILocation(line: 338, column: 18, scope: !507)
!509 = !DILocation(line: 338, column: 8, scope: !406)
!510 = !DILocalVariable(name: "i", scope: !511, file: !67, line: 341, type: !68)
!511 = distinct !DILexicalBlock(scope: !512, file: !67, line: 340, column: 9)
!512 = distinct !DILexicalBlock(scope: !507, file: !67, line: 339, column: 5)
!513 = !DILocation(line: 341, column: 17, scope: !511)
!514 = !DILocalVariable(name: "buffer", scope: !511, file: !67, line: 342, type: !203)
!515 = !DILocation(line: 342, column: 17, scope: !511)
!516 = !DILocation(line: 344, column: 17, scope: !517)
!517 = distinct !DILexicalBlock(scope: !511, file: !67, line: 344, column: 17)
!518 = !DILocation(line: 344, column: 22, scope: !517)
!519 = !DILocation(line: 344, column: 27, scope: !517)
!520 = !DILocation(line: 344, column: 30, scope: !517)
!521 = !DILocation(line: 344, column: 35, scope: !517)
!522 = !DILocation(line: 344, column: 17, scope: !511)
!523 = !DILocation(line: 346, column: 24, scope: !524)
!524 = distinct !DILexicalBlock(scope: !517, file: !67, line: 345, column: 13)
!525 = !DILocation(line: 346, column: 17, scope: !524)
!526 = !DILocation(line: 346, column: 30, scope: !524)
!527 = !DILocation(line: 348, column: 23, scope: !528)
!528 = distinct !DILexicalBlock(scope: !524, file: !67, line: 348, column: 17)
!529 = !DILocation(line: 348, column: 21, scope: !528)
!530 = !DILocation(line: 348, column: 28, scope: !531)
!531 = distinct !DILexicalBlock(scope: !528, file: !67, line: 348, column: 17)
!532 = !DILocation(line: 348, column: 30, scope: !531)
!533 = !DILocation(line: 348, column: 17, scope: !528)
!534 = !DILocation(line: 350, column: 41, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !67, line: 349, column: 17)
!536 = !DILocation(line: 350, column: 34, scope: !535)
!537 = !DILocation(line: 350, column: 21, scope: !535)
!538 = !DILocation(line: 351, column: 17, scope: !535)
!539 = !DILocation(line: 348, column: 37, scope: !531)
!540 = !DILocation(line: 348, column: 17, scope: !531)
!541 = distinct !{!541, !533, !542, !231}
!542 = !DILocation(line: 351, column: 17, scope: !528)
!543 = !DILocation(line: 352, column: 13, scope: !524)
!544 = !DILocation(line: 355, column: 17, scope: !545)
!545 = distinct !DILexicalBlock(scope: !517, file: !67, line: 354, column: 13)
!546 = !DILocation(line: 358, column: 5, scope: !512)
!547 = !DILocation(line: 359, column: 1, scope: !406)
!548 = distinct !DISubprogram(name: "goodG2B1", scope: !67, file: !67, line: 362, type: !76, scopeLine: 363, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!549 = !DILocalVariable(name: "data", scope: !548, file: !67, line: 364, type: !68)
!550 = !DILocation(line: 364, column: 9, scope: !548)
!551 = !DILocation(line: 366, column: 10, scope: !548)
!552 = !DILocation(line: 367, column: 8, scope: !553)
!553 = distinct !DILexicalBlock(scope: !548, file: !67, line: 367, column: 8)
!554 = !DILocation(line: 367, column: 18, scope: !553)
!555 = !DILocation(line: 367, column: 8, scope: !548)
!556 = !DILocation(line: 370, column: 9, scope: !557)
!557 = distinct !DILexicalBlock(scope: !553, file: !67, line: 368, column: 5)
!558 = !DILocation(line: 371, column: 5, scope: !557)
!559 = !DILocation(line: 376, column: 14, scope: !560)
!560 = distinct !DILexicalBlock(scope: !553, file: !67, line: 373, column: 5)
!561 = !DILocation(line: 378, column: 8, scope: !562)
!562 = distinct !DILexicalBlock(scope: !548, file: !67, line: 378, column: 8)
!563 = !DILocation(line: 378, column: 18, scope: !562)
!564 = !DILocation(line: 378, column: 8, scope: !548)
!565 = !DILocalVariable(name: "i", scope: !566, file: !67, line: 381, type: !68)
!566 = distinct !DILexicalBlock(scope: !567, file: !67, line: 380, column: 9)
!567 = distinct !DILexicalBlock(scope: !562, file: !67, line: 379, column: 5)
!568 = !DILocation(line: 381, column: 17, scope: !566)
!569 = !DILocalVariable(name: "buffer", scope: !566, file: !67, line: 382, type: !203)
!570 = !DILocation(line: 382, column: 17, scope: !566)
!571 = !DILocation(line: 385, column: 17, scope: !572)
!572 = distinct !DILexicalBlock(scope: !566, file: !67, line: 385, column: 17)
!573 = !DILocation(line: 385, column: 22, scope: !572)
!574 = !DILocation(line: 385, column: 17, scope: !566)
!575 = !DILocation(line: 387, column: 24, scope: !576)
!576 = distinct !DILexicalBlock(scope: !572, file: !67, line: 386, column: 13)
!577 = !DILocation(line: 387, column: 17, scope: !576)
!578 = !DILocation(line: 387, column: 30, scope: !576)
!579 = !DILocation(line: 389, column: 23, scope: !580)
!580 = distinct !DILexicalBlock(scope: !576, file: !67, line: 389, column: 17)
!581 = !DILocation(line: 389, column: 21, scope: !580)
!582 = !DILocation(line: 389, column: 28, scope: !583)
!583 = distinct !DILexicalBlock(scope: !580, file: !67, line: 389, column: 17)
!584 = !DILocation(line: 389, column: 30, scope: !583)
!585 = !DILocation(line: 389, column: 17, scope: !580)
!586 = !DILocation(line: 391, column: 41, scope: !587)
!587 = distinct !DILexicalBlock(scope: !583, file: !67, line: 390, column: 17)
!588 = !DILocation(line: 391, column: 34, scope: !587)
!589 = !DILocation(line: 391, column: 21, scope: !587)
!590 = !DILocation(line: 392, column: 17, scope: !587)
!591 = !DILocation(line: 389, column: 37, scope: !583)
!592 = !DILocation(line: 389, column: 17, scope: !583)
!593 = distinct !{!593, !585, !594, !231}
!594 = !DILocation(line: 392, column: 17, scope: !580)
!595 = !DILocation(line: 393, column: 13, scope: !576)
!596 = !DILocation(line: 396, column: 17, scope: !597)
!597 = distinct !DILexicalBlock(scope: !572, file: !67, line: 395, column: 13)
!598 = !DILocation(line: 399, column: 5, scope: !567)
!599 = !DILocation(line: 400, column: 1, scope: !548)
!600 = distinct !DISubprogram(name: "goodG2B2", scope: !67, file: !67, line: 403, type: !76, scopeLine: 404, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !78)
!601 = !DILocalVariable(name: "data", scope: !600, file: !67, line: 405, type: !68)
!602 = !DILocation(line: 405, column: 9, scope: !600)
!603 = !DILocation(line: 407, column: 10, scope: !600)
!604 = !DILocation(line: 408, column: 8, scope: !605)
!605 = distinct !DILexicalBlock(scope: !600, file: !67, line: 408, column: 8)
!606 = !DILocation(line: 408, column: 18, scope: !605)
!607 = !DILocation(line: 408, column: 8, scope: !600)
!608 = !DILocation(line: 412, column: 14, scope: !609)
!609 = distinct !DILexicalBlock(scope: !605, file: !67, line: 409, column: 5)
!610 = !DILocation(line: 413, column: 5, scope: !609)
!611 = !DILocation(line: 414, column: 8, scope: !612)
!612 = distinct !DILexicalBlock(scope: !600, file: !67, line: 414, column: 8)
!613 = !DILocation(line: 414, column: 18, scope: !612)
!614 = !DILocation(line: 414, column: 8, scope: !600)
!615 = !DILocalVariable(name: "i", scope: !616, file: !67, line: 417, type: !68)
!616 = distinct !DILexicalBlock(scope: !617, file: !67, line: 416, column: 9)
!617 = distinct !DILexicalBlock(scope: !612, file: !67, line: 415, column: 5)
!618 = !DILocation(line: 417, column: 17, scope: !616)
!619 = !DILocalVariable(name: "buffer", scope: !616, file: !67, line: 418, type: !203)
!620 = !DILocation(line: 418, column: 17, scope: !616)
!621 = !DILocation(line: 421, column: 17, scope: !622)
!622 = distinct !DILexicalBlock(scope: !616, file: !67, line: 421, column: 17)
!623 = !DILocation(line: 421, column: 22, scope: !622)
!624 = !DILocation(line: 421, column: 17, scope: !616)
!625 = !DILocation(line: 423, column: 24, scope: !626)
!626 = distinct !DILexicalBlock(scope: !622, file: !67, line: 422, column: 13)
!627 = !DILocation(line: 423, column: 17, scope: !626)
!628 = !DILocation(line: 423, column: 30, scope: !626)
!629 = !DILocation(line: 425, column: 23, scope: !630)
!630 = distinct !DILexicalBlock(scope: !626, file: !67, line: 425, column: 17)
!631 = !DILocation(line: 425, column: 21, scope: !630)
!632 = !DILocation(line: 425, column: 28, scope: !633)
!633 = distinct !DILexicalBlock(scope: !630, file: !67, line: 425, column: 17)
!634 = !DILocation(line: 425, column: 30, scope: !633)
!635 = !DILocation(line: 425, column: 17, scope: !630)
!636 = !DILocation(line: 427, column: 41, scope: !637)
!637 = distinct !DILexicalBlock(scope: !633, file: !67, line: 426, column: 17)
!638 = !DILocation(line: 427, column: 34, scope: !637)
!639 = !DILocation(line: 427, column: 21, scope: !637)
!640 = !DILocation(line: 428, column: 17, scope: !637)
!641 = !DILocation(line: 425, column: 37, scope: !633)
!642 = !DILocation(line: 425, column: 17, scope: !633)
!643 = distinct !{!643, !635, !644, !231}
!644 = !DILocation(line: 428, column: 17, scope: !630)
!645 = !DILocation(line: 429, column: 13, scope: !626)
!646 = !DILocation(line: 432, column: 17, scope: !647)
!647 = distinct !DILexicalBlock(scope: !622, file: !67, line: 431, column: 13)
!648 = !DILocation(line: 435, column: 5, scope: !617)
!649 = !DILocation(line: 436, column: 1, scope: !600)
