; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_11_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  %call = call i32 (...) @globalReturnsTrue(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.end35, !dbg !81

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

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 (...) @globalReturnsTrue(), !dbg !190
  %tobool37 = icmp ne i32 %call36, 0, !dbg !190
  br i1 %tobool37, label %if.then38, label %if.end49, !dbg !192

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !193, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !197, metadata !DIExpression()), !dbg !201
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !201
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !201
  %16 = load i32, i32* %data, align 4, !dbg !202
  %cmp39 = icmp sge i32 %16, 0, !dbg !204
  br i1 %cmp39, label %if.then41, label %if.else, !dbg !205

if.then41:                                        ; preds = %if.then38
  %17 = load i32, i32* %data, align 4, !dbg !206
  %idxprom42 = sext i32 %17 to i64, !dbg !208
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !208
  store i32 1, i32* %arrayidx43, align 4, !dbg !209
  store i32 0, i32* %i, align 4, !dbg !210
  br label %for.cond, !dbg !212

for.cond:                                         ; preds = %for.inc, %if.then41
  %18 = load i32, i32* %i, align 4, !dbg !213
  %cmp44 = icmp slt i32 %18, 10, !dbg !215
  br i1 %cmp44, label %for.body, label %for.end, !dbg !216

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !217
  %idxprom46 = sext i32 %19 to i64, !dbg !219
  %arrayidx47 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom46, !dbg !219
  %20 = load i32, i32* %arrayidx47, align 4, !dbg !219
  call void @printIntLine(i32 %20), !dbg !220
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !222
  %inc = add nsw i32 %21, 1, !dbg !222
  store i32 %inc, i32* %i, align 4, !dbg !222
  br label %for.cond, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond
  br label %if.end48, !dbg !227

if.else:                                          ; preds = %if.then38
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !228
  br label %if.end48

if.end48:                                         ; preds = %if.else, %for.end
  br label %if.end49, !dbg !230

if.end49:                                         ; preds = %if.end48, %if.end35
  ret void, !dbg !231
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_11_good() #0 !dbg !232 {
entry:
  call void @goodB2G1(), !dbg !233
  call void @goodB2G2(), !dbg !234
  call void @goodG2B1(), !dbg !235
  call void @goodG2B2(), !dbg !236
  ret void, !dbg !237
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !238 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !243, metadata !DIExpression()), !dbg !244
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !245, metadata !DIExpression()), !dbg !246
  %call = call i64 @time(i64* null) #7, !dbg !247
  %conv = trunc i64 %call to i32, !dbg !248
  call void @srand(i32 %conv) #7, !dbg !249
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !250
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_11_good(), !dbg !251
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !252
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !253
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_11_bad(), !dbg !254
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !255
  ret i32 0, !dbg !256
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !257 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !258, metadata !DIExpression()), !dbg !259
  store i32 -1, i32* %data, align 4, !dbg !260
  %call = call i32 (...) @globalReturnsTrue(), !dbg !261
  %tobool = icmp ne i32 %call, 0, !dbg !261
  br i1 %tobool, label %if.then, label %if.end35, !dbg !263

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !264, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !268, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !270, metadata !DIExpression()), !dbg !271
  store i32 -1, i32* %listenSocket, align 4, !dbg !271
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !272, metadata !DIExpression()), !dbg !273
  store i32 -1, i32* %acceptSocket, align 4, !dbg !273
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !274, metadata !DIExpression()), !dbg !275
  br label %do.body, !dbg !276

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !277
  store i32 %call1, i32* %listenSocket, align 4, !dbg !279
  %0 = load i32, i32* %listenSocket, align 4, !dbg !280
  %cmp = icmp eq i32 %0, -1, !dbg !282
  br i1 %cmp, label %if.then2, label %if.end, !dbg !283

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !284

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !286
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !286
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !287
  store i16 2, i16* %sin_family, align 4, !dbg !288
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !289
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !290
  store i32 0, i32* %s_addr, align 4, !dbg !291
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !292
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !293
  store i16 %call3, i16* %sin_port, align 2, !dbg !294
  %2 = load i32, i32* %listenSocket, align 4, !dbg !295
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !297
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !298
  %cmp5 = icmp eq i32 %call4, -1, !dbg !299
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !300

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !301

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !303
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !305
  %cmp9 = icmp eq i32 %call8, -1, !dbg !306
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !307

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !308

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !310
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !311
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !312
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !313
  %cmp13 = icmp eq i32 %6, -1, !dbg !315
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !316

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !317

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !319
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !320
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !321
  %conv = trunc i64 %call16 to i32, !dbg !321
  store i32 %conv, i32* %recvResult, align 4, !dbg !322
  %8 = load i32, i32* %recvResult, align 4, !dbg !323
  %cmp17 = icmp eq i32 %8, -1, !dbg !325
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !326

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !327
  %cmp19 = icmp eq i32 %9, 0, !dbg !328
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !329

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !330

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !332
  %idxprom = sext i32 %10 to i64, !dbg !333
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !333
  store i8 0, i8* %arrayidx, align 1, !dbg !334
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !335
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !336
  store i32 %call24, i32* %data, align 4, !dbg !337
  br label %do.end, !dbg !338

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !339
  %cmp25 = icmp ne i32 %11, -1, !dbg !341
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !342

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !343
  %call28 = call i32 @close(i32 %12), !dbg !345
  br label %if.end29, !dbg !346

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !347
  %cmp30 = icmp ne i32 %13, -1, !dbg !349
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !350

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !351
  %call33 = call i32 @close(i32 %14), !dbg !353
  br label %if.end34, !dbg !354

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !355

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 (...) @globalReturnsFalse(), !dbg !356
  %tobool37 = icmp ne i32 %call36, 0, !dbg !356
  br i1 %tobool37, label %if.then38, label %if.else, !dbg !358

if.then38:                                        ; preds = %if.end35
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !359
  br label %if.end52, !dbg !361

if.else:                                          ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !362, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !366, metadata !DIExpression()), !dbg !367
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !367
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !367
  %16 = load i32, i32* %data, align 4, !dbg !368
  %cmp39 = icmp sge i32 %16, 0, !dbg !370
  br i1 %cmp39, label %land.lhs.true, label %if.else50, !dbg !371

land.lhs.true:                                    ; preds = %if.else
  %17 = load i32, i32* %data, align 4, !dbg !372
  %cmp41 = icmp slt i32 %17, 10, !dbg !373
  br i1 %cmp41, label %if.then43, label %if.else50, !dbg !374

if.then43:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !375
  %idxprom44 = sext i32 %18 to i64, !dbg !377
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !377
  store i32 1, i32* %arrayidx45, align 4, !dbg !378
  store i32 0, i32* %i, align 4, !dbg !379
  br label %for.cond, !dbg !381

for.cond:                                         ; preds = %for.inc, %if.then43
  %19 = load i32, i32* %i, align 4, !dbg !382
  %cmp46 = icmp slt i32 %19, 10, !dbg !384
  br i1 %cmp46, label %for.body, label %for.end, !dbg !385

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !386
  %idxprom48 = sext i32 %20 to i64, !dbg !388
  %arrayidx49 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom48, !dbg !388
  %21 = load i32, i32* %arrayidx49, align 4, !dbg !388
  call void @printIntLine(i32 %21), !dbg !389
  br label %for.inc, !dbg !390

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !391
  %inc = add nsw i32 %22, 1, !dbg !391
  store i32 %inc, i32* %i, align 4, !dbg !391
  br label %for.cond, !dbg !392, !llvm.loop !393

for.end:                                          ; preds = %for.cond
  br label %if.end51, !dbg !395

if.else50:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !396
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %for.end
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then38
  ret void, !dbg !398
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !399 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !400, metadata !DIExpression()), !dbg !401
  store i32 -1, i32* %data, align 4, !dbg !402
  %call = call i32 (...) @globalReturnsTrue(), !dbg !403
  %tobool = icmp ne i32 %call, 0, !dbg !403
  br i1 %tobool, label %if.then, label %if.end35, !dbg !405

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !406, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !410, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !412, metadata !DIExpression()), !dbg !413
  store i32 -1, i32* %listenSocket, align 4, !dbg !413
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !414, metadata !DIExpression()), !dbg !415
  store i32 -1, i32* %acceptSocket, align 4, !dbg !415
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !416, metadata !DIExpression()), !dbg !417
  br label %do.body, !dbg !418

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !419
  store i32 %call1, i32* %listenSocket, align 4, !dbg !421
  %0 = load i32, i32* %listenSocket, align 4, !dbg !422
  %cmp = icmp eq i32 %0, -1, !dbg !424
  br i1 %cmp, label %if.then2, label %if.end, !dbg !425

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !426

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !428
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !428
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !429
  store i16 2, i16* %sin_family, align 4, !dbg !430
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !431
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !432
  store i32 0, i32* %s_addr, align 4, !dbg !433
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !434
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !435
  store i16 %call3, i16* %sin_port, align 2, !dbg !436
  %2 = load i32, i32* %listenSocket, align 4, !dbg !437
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !439
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !440
  %cmp5 = icmp eq i32 %call4, -1, !dbg !441
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !442

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !443

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !445
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !447
  %cmp9 = icmp eq i32 %call8, -1, !dbg !448
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !449

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !450

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !452
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !453
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !454
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !455
  %cmp13 = icmp eq i32 %6, -1, !dbg !457
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !458

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !459

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !461
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !462
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !463
  %conv = trunc i64 %call16 to i32, !dbg !463
  store i32 %conv, i32* %recvResult, align 4, !dbg !464
  %8 = load i32, i32* %recvResult, align 4, !dbg !465
  %cmp17 = icmp eq i32 %8, -1, !dbg !467
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !468

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !469
  %cmp19 = icmp eq i32 %9, 0, !dbg !470
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !471

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !472

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !474
  %idxprom = sext i32 %10 to i64, !dbg !475
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !475
  store i8 0, i8* %arrayidx, align 1, !dbg !476
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !477
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !478
  store i32 %call24, i32* %data, align 4, !dbg !479
  br label %do.end, !dbg !480

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !481
  %cmp25 = icmp ne i32 %11, -1, !dbg !483
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !484

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !485
  %call28 = call i32 @close(i32 %12), !dbg !487
  br label %if.end29, !dbg !488

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !489
  %cmp30 = icmp ne i32 %13, -1, !dbg !491
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !492

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !493
  %call33 = call i32 @close(i32 %14), !dbg !495
  br label %if.end34, !dbg !496

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !497

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 (...) @globalReturnsTrue(), !dbg !498
  %tobool37 = icmp ne i32 %call36, 0, !dbg !498
  br i1 %tobool37, label %if.then38, label %if.end51, !dbg !500

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !501, metadata !DIExpression()), !dbg !504
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !505, metadata !DIExpression()), !dbg !506
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !506
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !506
  %16 = load i32, i32* %data, align 4, !dbg !507
  %cmp39 = icmp sge i32 %16, 0, !dbg !509
  br i1 %cmp39, label %land.lhs.true, label %if.else, !dbg !510

land.lhs.true:                                    ; preds = %if.then38
  %17 = load i32, i32* %data, align 4, !dbg !511
  %cmp41 = icmp slt i32 %17, 10, !dbg !512
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !513

if.then43:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !514
  %idxprom44 = sext i32 %18 to i64, !dbg !516
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !516
  store i32 1, i32* %arrayidx45, align 4, !dbg !517
  store i32 0, i32* %i, align 4, !dbg !518
  br label %for.cond, !dbg !520

for.cond:                                         ; preds = %for.inc, %if.then43
  %19 = load i32, i32* %i, align 4, !dbg !521
  %cmp46 = icmp slt i32 %19, 10, !dbg !523
  br i1 %cmp46, label %for.body, label %for.end, !dbg !524

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !525
  %idxprom48 = sext i32 %20 to i64, !dbg !527
  %arrayidx49 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom48, !dbg !527
  %21 = load i32, i32* %arrayidx49, align 4, !dbg !527
  call void @printIntLine(i32 %21), !dbg !528
  br label %for.inc, !dbg !529

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !530
  %inc = add nsw i32 %22, 1, !dbg !530
  store i32 %inc, i32* %i, align 4, !dbg !530
  br label %for.cond, !dbg !531, !llvm.loop !532

for.end:                                          ; preds = %for.cond
  br label %if.end50, !dbg !534

if.else:                                          ; preds = %land.lhs.true, %if.then38
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !535
  br label %if.end50

if.end50:                                         ; preds = %if.else, %for.end
  br label %if.end51, !dbg !537

if.end51:                                         ; preds = %if.end50, %if.end35
  ret void, !dbg !538
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !539 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !540, metadata !DIExpression()), !dbg !541
  store i32 -1, i32* %data, align 4, !dbg !542
  %call = call i32 (...) @globalReturnsFalse(), !dbg !543
  %tobool = icmp ne i32 %call, 0, !dbg !543
  br i1 %tobool, label %if.then, label %if.else, !dbg !545

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !546
  br label %if.end, !dbg !548

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !549
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !551
  %tobool2 = icmp ne i32 %call1, 0, !dbg !551
  br i1 %tobool2, label %if.then3, label %if.end10, !dbg !553

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !554, metadata !DIExpression()), !dbg !557
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !558, metadata !DIExpression()), !dbg !559
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !559
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !559
  %1 = load i32, i32* %data, align 4, !dbg !560
  %cmp = icmp sge i32 %1, 0, !dbg !562
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !563

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !564
  %idxprom = sext i32 %2 to i64, !dbg !566
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !566
  store i32 1, i32* %arrayidx, align 4, !dbg !567
  store i32 0, i32* %i, align 4, !dbg !568
  br label %for.cond, !dbg !570

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !571
  %cmp5 = icmp slt i32 %3, 10, !dbg !573
  br i1 %cmp5, label %for.body, label %for.end, !dbg !574

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !575
  %idxprom6 = sext i32 %4 to i64, !dbg !577
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !577
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !577
  call void @printIntLine(i32 %5), !dbg !578
  br label %for.inc, !dbg !579

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !580
  %inc = add nsw i32 %6, 1, !dbg !580
  store i32 %inc, i32* %i, align 4, !dbg !580
  br label %for.cond, !dbg !581, !llvm.loop !582

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !584

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !585
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !587

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !588
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !589 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !590, metadata !DIExpression()), !dbg !591
  store i32 -1, i32* %data, align 4, !dbg !592
  %call = call i32 (...) @globalReturnsTrue(), !dbg !593
  %tobool = icmp ne i32 %call, 0, !dbg !593
  br i1 %tobool, label %if.then, label %if.end, !dbg !595

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !596
  br label %if.end, !dbg !598

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !599
  %tobool2 = icmp ne i32 %call1, 0, !dbg !599
  br i1 %tobool2, label %if.then3, label %if.end9, !dbg !601

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !602, metadata !DIExpression()), !dbg !605
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !606, metadata !DIExpression()), !dbg !607
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !607
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !607
  %1 = load i32, i32* %data, align 4, !dbg !608
  %cmp = icmp sge i32 %1, 0, !dbg !610
  br i1 %cmp, label %if.then4, label %if.else, !dbg !611

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !612
  %idxprom = sext i32 %2 to i64, !dbg !614
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !614
  store i32 1, i32* %arrayidx, align 4, !dbg !615
  store i32 0, i32* %i, align 4, !dbg !616
  br label %for.cond, !dbg !618

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !619
  %cmp5 = icmp slt i32 %3, 10, !dbg !621
  br i1 %cmp5, label %for.body, label %for.end, !dbg !622

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !623
  %idxprom6 = sext i32 %4 to i64, !dbg !625
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !625
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !625
  call void @printIntLine(i32 %5), !dbg !626
  br label %for.inc, !dbg !627

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !628
  %inc = add nsw i32 %6, 1, !dbg !628
  store i32 %inc, i32* %i, align 4, !dbg !628
  br label %for.cond, !dbg !629, !llvm.loop !630

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !632

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !633
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !635

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !636
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_11.c", directory: "/root/SSE-Assessment")
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
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !50, line: 41, baseType: !5)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !53, line: 175, size: 128, elements: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!54 = !{!55, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !52, file: !53, line: 177, baseType: !56, size: 16)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !57, line: 28, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!58 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !52, file: !53, line: 178, baseType: !60, size: 112, offset: 16)
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
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_11_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_11.c", directory: "/root/SSE-Assessment")
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
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !88)
!88 = !{!89, !90, !94, !98}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !17, line: 239, baseType: !56, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !17, line: 240, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !17, line: 241, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !17, line: 33, baseType: !46, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !17, line: 244, baseType: !99, size: 64, offset: 64)
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
!193 = !DILocalVariable(name: "i", scope: !194, file: !71, line: 124, type: !76)
!194 = distinct !DILexicalBlock(scope: !195, file: !71, line: 123, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !71, line: 122, column: 5)
!196 = !DILocation(line: 124, column: 17, scope: !194)
!197 = !DILocalVariable(name: "buffer", scope: !194, file: !71, line: 125, type: !198)
!198 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !199)
!199 = !{!200}
!200 = !DISubrange(count: 10)
!201 = !DILocation(line: 125, column: 17, scope: !194)
!202 = !DILocation(line: 128, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !194, file: !71, line: 128, column: 17)
!204 = !DILocation(line: 128, column: 22, scope: !203)
!205 = !DILocation(line: 128, column: 17, scope: !194)
!206 = !DILocation(line: 130, column: 24, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !71, line: 129, column: 13)
!208 = !DILocation(line: 130, column: 17, scope: !207)
!209 = !DILocation(line: 130, column: 30, scope: !207)
!210 = !DILocation(line: 132, column: 23, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !71, line: 132, column: 17)
!212 = !DILocation(line: 132, column: 21, scope: !211)
!213 = !DILocation(line: 132, column: 28, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !71, line: 132, column: 17)
!215 = !DILocation(line: 132, column: 30, scope: !214)
!216 = !DILocation(line: 132, column: 17, scope: !211)
!217 = !DILocation(line: 134, column: 41, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !71, line: 133, column: 17)
!219 = !DILocation(line: 134, column: 34, scope: !218)
!220 = !DILocation(line: 134, column: 21, scope: !218)
!221 = !DILocation(line: 135, column: 17, scope: !218)
!222 = !DILocation(line: 132, column: 37, scope: !214)
!223 = !DILocation(line: 132, column: 17, scope: !214)
!224 = distinct !{!224, !216, !225, !226}
!225 = !DILocation(line: 135, column: 17, scope: !211)
!226 = !{!"llvm.loop.mustprogress"}
!227 = !DILocation(line: 136, column: 13, scope: !207)
!228 = !DILocation(line: 139, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !203, file: !71, line: 138, column: 13)
!230 = !DILocation(line: 142, column: 5, scope: !195)
!231 = !DILocation(line: 143, column: 1, scope: !70)
!232 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_11_good", scope: !71, file: !71, line: 433, type: !72, scopeLine: 434, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!233 = !DILocation(line: 435, column: 5, scope: !232)
!234 = !DILocation(line: 436, column: 5, scope: !232)
!235 = !DILocation(line: 437, column: 5, scope: !232)
!236 = !DILocation(line: 438, column: 5, scope: !232)
!237 = !DILocation(line: 439, column: 1, scope: !232)
!238 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 450, type: !239, scopeLine: 451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!239 = !DISubroutineType(types: !240)
!240 = !{!76, !76, !241}
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!243 = !DILocalVariable(name: "argc", arg: 1, scope: !238, file: !71, line: 450, type: !76)
!244 = !DILocation(line: 450, column: 14, scope: !238)
!245 = !DILocalVariable(name: "argv", arg: 2, scope: !238, file: !71, line: 450, type: !241)
!246 = !DILocation(line: 450, column: 27, scope: !238)
!247 = !DILocation(line: 453, column: 22, scope: !238)
!248 = !DILocation(line: 453, column: 12, scope: !238)
!249 = !DILocation(line: 453, column: 5, scope: !238)
!250 = !DILocation(line: 455, column: 5, scope: !238)
!251 = !DILocation(line: 456, column: 5, scope: !238)
!252 = !DILocation(line: 457, column: 5, scope: !238)
!253 = !DILocation(line: 460, column: 5, scope: !238)
!254 = !DILocation(line: 461, column: 5, scope: !238)
!255 = !DILocation(line: 462, column: 5, scope: !238)
!256 = !DILocation(line: 464, column: 5, scope: !238)
!257 = distinct !DISubprogram(name: "goodB2G1", scope: !71, file: !71, line: 150, type: !72, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!258 = !DILocalVariable(name: "data", scope: !257, file: !71, line: 152, type: !76)
!259 = !DILocation(line: 152, column: 9, scope: !257)
!260 = !DILocation(line: 154, column: 10, scope: !257)
!261 = !DILocation(line: 155, column: 8, scope: !262)
!262 = distinct !DILexicalBlock(scope: !257, file: !71, line: 155, column: 8)
!263 = !DILocation(line: 155, column: 8, scope: !257)
!264 = !DILocalVariable(name: "recvResult", scope: !265, file: !71, line: 162, type: !76)
!265 = distinct !DILexicalBlock(scope: !266, file: !71, line: 157, column: 9)
!266 = distinct !DILexicalBlock(scope: !262, file: !71, line: 156, column: 5)
!267 = !DILocation(line: 162, column: 17, scope: !265)
!268 = !DILocalVariable(name: "service", scope: !265, file: !71, line: 163, type: !87)
!269 = !DILocation(line: 163, column: 32, scope: !265)
!270 = !DILocalVariable(name: "listenSocket", scope: !265, file: !71, line: 164, type: !76)
!271 = !DILocation(line: 164, column: 20, scope: !265)
!272 = !DILocalVariable(name: "acceptSocket", scope: !265, file: !71, line: 165, type: !76)
!273 = !DILocation(line: 165, column: 20, scope: !265)
!274 = !DILocalVariable(name: "inputBuffer", scope: !265, file: !71, line: 166, type: !60)
!275 = !DILocation(line: 166, column: 18, scope: !265)
!276 = !DILocation(line: 167, column: 13, scope: !265)
!277 = !DILocation(line: 177, column: 32, scope: !278)
!278 = distinct !DILexicalBlock(scope: !265, file: !71, line: 168, column: 13)
!279 = !DILocation(line: 177, column: 30, scope: !278)
!280 = !DILocation(line: 178, column: 21, scope: !281)
!281 = distinct !DILexicalBlock(scope: !278, file: !71, line: 178, column: 21)
!282 = !DILocation(line: 178, column: 34, scope: !281)
!283 = !DILocation(line: 178, column: 21, scope: !278)
!284 = !DILocation(line: 180, column: 21, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !71, line: 179, column: 17)
!286 = !DILocation(line: 182, column: 17, scope: !278)
!287 = !DILocation(line: 183, column: 25, scope: !278)
!288 = !DILocation(line: 183, column: 36, scope: !278)
!289 = !DILocation(line: 184, column: 25, scope: !278)
!290 = !DILocation(line: 184, column: 34, scope: !278)
!291 = !DILocation(line: 184, column: 41, scope: !278)
!292 = !DILocation(line: 185, column: 36, scope: !278)
!293 = !DILocation(line: 185, column: 25, scope: !278)
!294 = !DILocation(line: 185, column: 34, scope: !278)
!295 = !DILocation(line: 186, column: 26, scope: !296)
!296 = distinct !DILexicalBlock(scope: !278, file: !71, line: 186, column: 21)
!297 = !DILocation(line: 186, column: 40, scope: !296)
!298 = !DILocation(line: 186, column: 21, scope: !296)
!299 = !DILocation(line: 186, column: 85, scope: !296)
!300 = !DILocation(line: 186, column: 21, scope: !278)
!301 = !DILocation(line: 188, column: 21, scope: !302)
!302 = distinct !DILexicalBlock(scope: !296, file: !71, line: 187, column: 17)
!303 = !DILocation(line: 190, column: 28, scope: !304)
!304 = distinct !DILexicalBlock(scope: !278, file: !71, line: 190, column: 21)
!305 = !DILocation(line: 190, column: 21, scope: !304)
!306 = !DILocation(line: 190, column: 58, scope: !304)
!307 = !DILocation(line: 190, column: 21, scope: !278)
!308 = !DILocation(line: 192, column: 21, scope: !309)
!309 = distinct !DILexicalBlock(scope: !304, file: !71, line: 191, column: 17)
!310 = !DILocation(line: 194, column: 39, scope: !278)
!311 = !DILocation(line: 194, column: 32, scope: !278)
!312 = !DILocation(line: 194, column: 30, scope: !278)
!313 = !DILocation(line: 195, column: 21, scope: !314)
!314 = distinct !DILexicalBlock(scope: !278, file: !71, line: 195, column: 21)
!315 = !DILocation(line: 195, column: 34, scope: !314)
!316 = !DILocation(line: 195, column: 21, scope: !278)
!317 = !DILocation(line: 197, column: 21, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !71, line: 196, column: 17)
!319 = !DILocation(line: 200, column: 35, scope: !278)
!320 = !DILocation(line: 200, column: 49, scope: !278)
!321 = !DILocation(line: 200, column: 30, scope: !278)
!322 = !DILocation(line: 200, column: 28, scope: !278)
!323 = !DILocation(line: 201, column: 21, scope: !324)
!324 = distinct !DILexicalBlock(scope: !278, file: !71, line: 201, column: 21)
!325 = !DILocation(line: 201, column: 32, scope: !324)
!326 = !DILocation(line: 201, column: 48, scope: !324)
!327 = !DILocation(line: 201, column: 51, scope: !324)
!328 = !DILocation(line: 201, column: 62, scope: !324)
!329 = !DILocation(line: 201, column: 21, scope: !278)
!330 = !DILocation(line: 203, column: 21, scope: !331)
!331 = distinct !DILexicalBlock(scope: !324, file: !71, line: 202, column: 17)
!332 = !DILocation(line: 206, column: 29, scope: !278)
!333 = !DILocation(line: 206, column: 17, scope: !278)
!334 = !DILocation(line: 206, column: 41, scope: !278)
!335 = !DILocation(line: 208, column: 29, scope: !278)
!336 = !DILocation(line: 208, column: 24, scope: !278)
!337 = !DILocation(line: 208, column: 22, scope: !278)
!338 = !DILocation(line: 209, column: 13, scope: !278)
!339 = !DILocation(line: 211, column: 17, scope: !340)
!340 = distinct !DILexicalBlock(scope: !265, file: !71, line: 211, column: 17)
!341 = !DILocation(line: 211, column: 30, scope: !340)
!342 = !DILocation(line: 211, column: 17, scope: !265)
!343 = !DILocation(line: 213, column: 30, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !71, line: 212, column: 13)
!345 = !DILocation(line: 213, column: 17, scope: !344)
!346 = !DILocation(line: 214, column: 13, scope: !344)
!347 = !DILocation(line: 215, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !265, file: !71, line: 215, column: 17)
!349 = !DILocation(line: 215, column: 30, scope: !348)
!350 = !DILocation(line: 215, column: 17, scope: !265)
!351 = !DILocation(line: 217, column: 30, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !71, line: 216, column: 13)
!353 = !DILocation(line: 217, column: 17, scope: !352)
!354 = !DILocation(line: 218, column: 13, scope: !352)
!355 = !DILocation(line: 226, column: 5, scope: !266)
!356 = !DILocation(line: 227, column: 8, scope: !357)
!357 = distinct !DILexicalBlock(scope: !257, file: !71, line: 227, column: 8)
!358 = !DILocation(line: 227, column: 8, scope: !257)
!359 = !DILocation(line: 230, column: 9, scope: !360)
!360 = distinct !DILexicalBlock(scope: !357, file: !71, line: 228, column: 5)
!361 = !DILocation(line: 231, column: 5, scope: !360)
!362 = !DILocalVariable(name: "i", scope: !363, file: !71, line: 235, type: !76)
!363 = distinct !DILexicalBlock(scope: !364, file: !71, line: 234, column: 9)
!364 = distinct !DILexicalBlock(scope: !357, file: !71, line: 233, column: 5)
!365 = !DILocation(line: 235, column: 17, scope: !363)
!366 = !DILocalVariable(name: "buffer", scope: !363, file: !71, line: 236, type: !198)
!367 = !DILocation(line: 236, column: 17, scope: !363)
!368 = !DILocation(line: 238, column: 17, scope: !369)
!369 = distinct !DILexicalBlock(scope: !363, file: !71, line: 238, column: 17)
!370 = !DILocation(line: 238, column: 22, scope: !369)
!371 = !DILocation(line: 238, column: 27, scope: !369)
!372 = !DILocation(line: 238, column: 30, scope: !369)
!373 = !DILocation(line: 238, column: 35, scope: !369)
!374 = !DILocation(line: 238, column: 17, scope: !363)
!375 = !DILocation(line: 240, column: 24, scope: !376)
!376 = distinct !DILexicalBlock(scope: !369, file: !71, line: 239, column: 13)
!377 = !DILocation(line: 240, column: 17, scope: !376)
!378 = !DILocation(line: 240, column: 30, scope: !376)
!379 = !DILocation(line: 242, column: 23, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !71, line: 242, column: 17)
!381 = !DILocation(line: 242, column: 21, scope: !380)
!382 = !DILocation(line: 242, column: 28, scope: !383)
!383 = distinct !DILexicalBlock(scope: !380, file: !71, line: 242, column: 17)
!384 = !DILocation(line: 242, column: 30, scope: !383)
!385 = !DILocation(line: 242, column: 17, scope: !380)
!386 = !DILocation(line: 244, column: 41, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !71, line: 243, column: 17)
!388 = !DILocation(line: 244, column: 34, scope: !387)
!389 = !DILocation(line: 244, column: 21, scope: !387)
!390 = !DILocation(line: 245, column: 17, scope: !387)
!391 = !DILocation(line: 242, column: 37, scope: !383)
!392 = !DILocation(line: 242, column: 17, scope: !383)
!393 = distinct !{!393, !385, !394, !226}
!394 = !DILocation(line: 245, column: 17, scope: !380)
!395 = !DILocation(line: 246, column: 13, scope: !376)
!396 = !DILocation(line: 249, column: 17, scope: !397)
!397 = distinct !DILexicalBlock(scope: !369, file: !71, line: 248, column: 13)
!398 = !DILocation(line: 253, column: 1, scope: !257)
!399 = distinct !DISubprogram(name: "goodB2G2", scope: !71, file: !71, line: 256, type: !72, scopeLine: 257, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!400 = !DILocalVariable(name: "data", scope: !399, file: !71, line: 258, type: !76)
!401 = !DILocation(line: 258, column: 9, scope: !399)
!402 = !DILocation(line: 260, column: 10, scope: !399)
!403 = !DILocation(line: 261, column: 8, scope: !404)
!404 = distinct !DILexicalBlock(scope: !399, file: !71, line: 261, column: 8)
!405 = !DILocation(line: 261, column: 8, scope: !399)
!406 = !DILocalVariable(name: "recvResult", scope: !407, file: !71, line: 268, type: !76)
!407 = distinct !DILexicalBlock(scope: !408, file: !71, line: 263, column: 9)
!408 = distinct !DILexicalBlock(scope: !404, file: !71, line: 262, column: 5)
!409 = !DILocation(line: 268, column: 17, scope: !407)
!410 = !DILocalVariable(name: "service", scope: !407, file: !71, line: 269, type: !87)
!411 = !DILocation(line: 269, column: 32, scope: !407)
!412 = !DILocalVariable(name: "listenSocket", scope: !407, file: !71, line: 270, type: !76)
!413 = !DILocation(line: 270, column: 20, scope: !407)
!414 = !DILocalVariable(name: "acceptSocket", scope: !407, file: !71, line: 271, type: !76)
!415 = !DILocation(line: 271, column: 20, scope: !407)
!416 = !DILocalVariable(name: "inputBuffer", scope: !407, file: !71, line: 272, type: !60)
!417 = !DILocation(line: 272, column: 18, scope: !407)
!418 = !DILocation(line: 273, column: 13, scope: !407)
!419 = !DILocation(line: 283, column: 32, scope: !420)
!420 = distinct !DILexicalBlock(scope: !407, file: !71, line: 274, column: 13)
!421 = !DILocation(line: 283, column: 30, scope: !420)
!422 = !DILocation(line: 284, column: 21, scope: !423)
!423 = distinct !DILexicalBlock(scope: !420, file: !71, line: 284, column: 21)
!424 = !DILocation(line: 284, column: 34, scope: !423)
!425 = !DILocation(line: 284, column: 21, scope: !420)
!426 = !DILocation(line: 286, column: 21, scope: !427)
!427 = distinct !DILexicalBlock(scope: !423, file: !71, line: 285, column: 17)
!428 = !DILocation(line: 288, column: 17, scope: !420)
!429 = !DILocation(line: 289, column: 25, scope: !420)
!430 = !DILocation(line: 289, column: 36, scope: !420)
!431 = !DILocation(line: 290, column: 25, scope: !420)
!432 = !DILocation(line: 290, column: 34, scope: !420)
!433 = !DILocation(line: 290, column: 41, scope: !420)
!434 = !DILocation(line: 291, column: 36, scope: !420)
!435 = !DILocation(line: 291, column: 25, scope: !420)
!436 = !DILocation(line: 291, column: 34, scope: !420)
!437 = !DILocation(line: 292, column: 26, scope: !438)
!438 = distinct !DILexicalBlock(scope: !420, file: !71, line: 292, column: 21)
!439 = !DILocation(line: 292, column: 40, scope: !438)
!440 = !DILocation(line: 292, column: 21, scope: !438)
!441 = !DILocation(line: 292, column: 85, scope: !438)
!442 = !DILocation(line: 292, column: 21, scope: !420)
!443 = !DILocation(line: 294, column: 21, scope: !444)
!444 = distinct !DILexicalBlock(scope: !438, file: !71, line: 293, column: 17)
!445 = !DILocation(line: 296, column: 28, scope: !446)
!446 = distinct !DILexicalBlock(scope: !420, file: !71, line: 296, column: 21)
!447 = !DILocation(line: 296, column: 21, scope: !446)
!448 = !DILocation(line: 296, column: 58, scope: !446)
!449 = !DILocation(line: 296, column: 21, scope: !420)
!450 = !DILocation(line: 298, column: 21, scope: !451)
!451 = distinct !DILexicalBlock(scope: !446, file: !71, line: 297, column: 17)
!452 = !DILocation(line: 300, column: 39, scope: !420)
!453 = !DILocation(line: 300, column: 32, scope: !420)
!454 = !DILocation(line: 300, column: 30, scope: !420)
!455 = !DILocation(line: 301, column: 21, scope: !456)
!456 = distinct !DILexicalBlock(scope: !420, file: !71, line: 301, column: 21)
!457 = !DILocation(line: 301, column: 34, scope: !456)
!458 = !DILocation(line: 301, column: 21, scope: !420)
!459 = !DILocation(line: 303, column: 21, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !71, line: 302, column: 17)
!461 = !DILocation(line: 306, column: 35, scope: !420)
!462 = !DILocation(line: 306, column: 49, scope: !420)
!463 = !DILocation(line: 306, column: 30, scope: !420)
!464 = !DILocation(line: 306, column: 28, scope: !420)
!465 = !DILocation(line: 307, column: 21, scope: !466)
!466 = distinct !DILexicalBlock(scope: !420, file: !71, line: 307, column: 21)
!467 = !DILocation(line: 307, column: 32, scope: !466)
!468 = !DILocation(line: 307, column: 48, scope: !466)
!469 = !DILocation(line: 307, column: 51, scope: !466)
!470 = !DILocation(line: 307, column: 62, scope: !466)
!471 = !DILocation(line: 307, column: 21, scope: !420)
!472 = !DILocation(line: 309, column: 21, scope: !473)
!473 = distinct !DILexicalBlock(scope: !466, file: !71, line: 308, column: 17)
!474 = !DILocation(line: 312, column: 29, scope: !420)
!475 = !DILocation(line: 312, column: 17, scope: !420)
!476 = !DILocation(line: 312, column: 41, scope: !420)
!477 = !DILocation(line: 314, column: 29, scope: !420)
!478 = !DILocation(line: 314, column: 24, scope: !420)
!479 = !DILocation(line: 314, column: 22, scope: !420)
!480 = !DILocation(line: 315, column: 13, scope: !420)
!481 = !DILocation(line: 317, column: 17, scope: !482)
!482 = distinct !DILexicalBlock(scope: !407, file: !71, line: 317, column: 17)
!483 = !DILocation(line: 317, column: 30, scope: !482)
!484 = !DILocation(line: 317, column: 17, scope: !407)
!485 = !DILocation(line: 319, column: 30, scope: !486)
!486 = distinct !DILexicalBlock(scope: !482, file: !71, line: 318, column: 13)
!487 = !DILocation(line: 319, column: 17, scope: !486)
!488 = !DILocation(line: 320, column: 13, scope: !486)
!489 = !DILocation(line: 321, column: 17, scope: !490)
!490 = distinct !DILexicalBlock(scope: !407, file: !71, line: 321, column: 17)
!491 = !DILocation(line: 321, column: 30, scope: !490)
!492 = !DILocation(line: 321, column: 17, scope: !407)
!493 = !DILocation(line: 323, column: 30, scope: !494)
!494 = distinct !DILexicalBlock(scope: !490, file: !71, line: 322, column: 13)
!495 = !DILocation(line: 323, column: 17, scope: !494)
!496 = !DILocation(line: 324, column: 13, scope: !494)
!497 = !DILocation(line: 332, column: 5, scope: !408)
!498 = !DILocation(line: 333, column: 8, scope: !499)
!499 = distinct !DILexicalBlock(scope: !399, file: !71, line: 333, column: 8)
!500 = !DILocation(line: 333, column: 8, scope: !399)
!501 = !DILocalVariable(name: "i", scope: !502, file: !71, line: 336, type: !76)
!502 = distinct !DILexicalBlock(scope: !503, file: !71, line: 335, column: 9)
!503 = distinct !DILexicalBlock(scope: !499, file: !71, line: 334, column: 5)
!504 = !DILocation(line: 336, column: 17, scope: !502)
!505 = !DILocalVariable(name: "buffer", scope: !502, file: !71, line: 337, type: !198)
!506 = !DILocation(line: 337, column: 17, scope: !502)
!507 = !DILocation(line: 339, column: 17, scope: !508)
!508 = distinct !DILexicalBlock(scope: !502, file: !71, line: 339, column: 17)
!509 = !DILocation(line: 339, column: 22, scope: !508)
!510 = !DILocation(line: 339, column: 27, scope: !508)
!511 = !DILocation(line: 339, column: 30, scope: !508)
!512 = !DILocation(line: 339, column: 35, scope: !508)
!513 = !DILocation(line: 339, column: 17, scope: !502)
!514 = !DILocation(line: 341, column: 24, scope: !515)
!515 = distinct !DILexicalBlock(scope: !508, file: !71, line: 340, column: 13)
!516 = !DILocation(line: 341, column: 17, scope: !515)
!517 = !DILocation(line: 341, column: 30, scope: !515)
!518 = !DILocation(line: 343, column: 23, scope: !519)
!519 = distinct !DILexicalBlock(scope: !515, file: !71, line: 343, column: 17)
!520 = !DILocation(line: 343, column: 21, scope: !519)
!521 = !DILocation(line: 343, column: 28, scope: !522)
!522 = distinct !DILexicalBlock(scope: !519, file: !71, line: 343, column: 17)
!523 = !DILocation(line: 343, column: 30, scope: !522)
!524 = !DILocation(line: 343, column: 17, scope: !519)
!525 = !DILocation(line: 345, column: 41, scope: !526)
!526 = distinct !DILexicalBlock(scope: !522, file: !71, line: 344, column: 17)
!527 = !DILocation(line: 345, column: 34, scope: !526)
!528 = !DILocation(line: 345, column: 21, scope: !526)
!529 = !DILocation(line: 346, column: 17, scope: !526)
!530 = !DILocation(line: 343, column: 37, scope: !522)
!531 = !DILocation(line: 343, column: 17, scope: !522)
!532 = distinct !{!532, !524, !533, !226}
!533 = !DILocation(line: 346, column: 17, scope: !519)
!534 = !DILocation(line: 347, column: 13, scope: !515)
!535 = !DILocation(line: 350, column: 17, scope: !536)
!536 = distinct !DILexicalBlock(scope: !508, file: !71, line: 349, column: 13)
!537 = !DILocation(line: 353, column: 5, scope: !503)
!538 = !DILocation(line: 354, column: 1, scope: !399)
!539 = distinct !DISubprogram(name: "goodG2B1", scope: !71, file: !71, line: 357, type: !72, scopeLine: 358, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!540 = !DILocalVariable(name: "data", scope: !539, file: !71, line: 359, type: !76)
!541 = !DILocation(line: 359, column: 9, scope: !539)
!542 = !DILocation(line: 361, column: 10, scope: !539)
!543 = !DILocation(line: 362, column: 8, scope: !544)
!544 = distinct !DILexicalBlock(scope: !539, file: !71, line: 362, column: 8)
!545 = !DILocation(line: 362, column: 8, scope: !539)
!546 = !DILocation(line: 365, column: 9, scope: !547)
!547 = distinct !DILexicalBlock(scope: !544, file: !71, line: 363, column: 5)
!548 = !DILocation(line: 366, column: 5, scope: !547)
!549 = !DILocation(line: 371, column: 14, scope: !550)
!550 = distinct !DILexicalBlock(scope: !544, file: !71, line: 368, column: 5)
!551 = !DILocation(line: 373, column: 8, scope: !552)
!552 = distinct !DILexicalBlock(scope: !539, file: !71, line: 373, column: 8)
!553 = !DILocation(line: 373, column: 8, scope: !539)
!554 = !DILocalVariable(name: "i", scope: !555, file: !71, line: 376, type: !76)
!555 = distinct !DILexicalBlock(scope: !556, file: !71, line: 375, column: 9)
!556 = distinct !DILexicalBlock(scope: !552, file: !71, line: 374, column: 5)
!557 = !DILocation(line: 376, column: 17, scope: !555)
!558 = !DILocalVariable(name: "buffer", scope: !555, file: !71, line: 377, type: !198)
!559 = !DILocation(line: 377, column: 17, scope: !555)
!560 = !DILocation(line: 380, column: 17, scope: !561)
!561 = distinct !DILexicalBlock(scope: !555, file: !71, line: 380, column: 17)
!562 = !DILocation(line: 380, column: 22, scope: !561)
!563 = !DILocation(line: 380, column: 17, scope: !555)
!564 = !DILocation(line: 382, column: 24, scope: !565)
!565 = distinct !DILexicalBlock(scope: !561, file: !71, line: 381, column: 13)
!566 = !DILocation(line: 382, column: 17, scope: !565)
!567 = !DILocation(line: 382, column: 30, scope: !565)
!568 = !DILocation(line: 384, column: 23, scope: !569)
!569 = distinct !DILexicalBlock(scope: !565, file: !71, line: 384, column: 17)
!570 = !DILocation(line: 384, column: 21, scope: !569)
!571 = !DILocation(line: 384, column: 28, scope: !572)
!572 = distinct !DILexicalBlock(scope: !569, file: !71, line: 384, column: 17)
!573 = !DILocation(line: 384, column: 30, scope: !572)
!574 = !DILocation(line: 384, column: 17, scope: !569)
!575 = !DILocation(line: 386, column: 41, scope: !576)
!576 = distinct !DILexicalBlock(scope: !572, file: !71, line: 385, column: 17)
!577 = !DILocation(line: 386, column: 34, scope: !576)
!578 = !DILocation(line: 386, column: 21, scope: !576)
!579 = !DILocation(line: 387, column: 17, scope: !576)
!580 = !DILocation(line: 384, column: 37, scope: !572)
!581 = !DILocation(line: 384, column: 17, scope: !572)
!582 = distinct !{!582, !574, !583, !226}
!583 = !DILocation(line: 387, column: 17, scope: !569)
!584 = !DILocation(line: 388, column: 13, scope: !565)
!585 = !DILocation(line: 391, column: 17, scope: !586)
!586 = distinct !DILexicalBlock(scope: !561, file: !71, line: 390, column: 13)
!587 = !DILocation(line: 394, column: 5, scope: !556)
!588 = !DILocation(line: 395, column: 1, scope: !539)
!589 = distinct !DISubprogram(name: "goodG2B2", scope: !71, file: !71, line: 398, type: !72, scopeLine: 399, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!590 = !DILocalVariable(name: "data", scope: !589, file: !71, line: 400, type: !76)
!591 = !DILocation(line: 400, column: 9, scope: !589)
!592 = !DILocation(line: 402, column: 10, scope: !589)
!593 = !DILocation(line: 403, column: 8, scope: !594)
!594 = distinct !DILexicalBlock(scope: !589, file: !71, line: 403, column: 8)
!595 = !DILocation(line: 403, column: 8, scope: !589)
!596 = !DILocation(line: 407, column: 14, scope: !597)
!597 = distinct !DILexicalBlock(scope: !594, file: !71, line: 404, column: 5)
!598 = !DILocation(line: 408, column: 5, scope: !597)
!599 = !DILocation(line: 409, column: 8, scope: !600)
!600 = distinct !DILexicalBlock(scope: !589, file: !71, line: 409, column: 8)
!601 = !DILocation(line: 409, column: 8, scope: !589)
!602 = !DILocalVariable(name: "i", scope: !603, file: !71, line: 412, type: !76)
!603 = distinct !DILexicalBlock(scope: !604, file: !71, line: 411, column: 9)
!604 = distinct !DILexicalBlock(scope: !600, file: !71, line: 410, column: 5)
!605 = !DILocation(line: 412, column: 17, scope: !603)
!606 = !DILocalVariable(name: "buffer", scope: !603, file: !71, line: 413, type: !198)
!607 = !DILocation(line: 413, column: 17, scope: !603)
!608 = !DILocation(line: 416, column: 17, scope: !609)
!609 = distinct !DILexicalBlock(scope: !603, file: !71, line: 416, column: 17)
!610 = !DILocation(line: 416, column: 22, scope: !609)
!611 = !DILocation(line: 416, column: 17, scope: !603)
!612 = !DILocation(line: 418, column: 24, scope: !613)
!613 = distinct !DILexicalBlock(scope: !609, file: !71, line: 417, column: 13)
!614 = !DILocation(line: 418, column: 17, scope: !613)
!615 = !DILocation(line: 418, column: 30, scope: !613)
!616 = !DILocation(line: 420, column: 23, scope: !617)
!617 = distinct !DILexicalBlock(scope: !613, file: !71, line: 420, column: 17)
!618 = !DILocation(line: 420, column: 21, scope: !617)
!619 = !DILocation(line: 420, column: 28, scope: !620)
!620 = distinct !DILexicalBlock(scope: !617, file: !71, line: 420, column: 17)
!621 = !DILocation(line: 420, column: 30, scope: !620)
!622 = !DILocation(line: 420, column: 17, scope: !617)
!623 = !DILocation(line: 422, column: 41, scope: !624)
!624 = distinct !DILexicalBlock(scope: !620, file: !71, line: 421, column: 17)
!625 = !DILocation(line: 422, column: 34, scope: !624)
!626 = !DILocation(line: 422, column: 21, scope: !624)
!627 = !DILocation(line: 423, column: 17, scope: !624)
!628 = !DILocation(line: 420, column: 37, scope: !620)
!629 = !DILocation(line: 420, column: 17, scope: !620)
!630 = distinct !{!630, !622, !631, !226}
!631 = !DILocation(line: 423, column: 17, scope: !617)
!632 = !DILocation(line: 424, column: 13, scope: !613)
!633 = !DILocation(line: 427, column: 17, scope: !634)
!634 = distinct !DILexicalBlock(scope: !609, file: !71, line: 426, column: 13)
!635 = !DILocation(line: 430, column: 5, scope: !604)
!636 = !DILocation(line: 431, column: 1, scope: !589)
