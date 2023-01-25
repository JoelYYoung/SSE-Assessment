; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_bad() #0 !dbg !70 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !79
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
  %call36 = call i32 @staticReturnsTrue(), !dbg !190
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_good() #0 !dbg !232 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_good(), !dbg !251
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !252
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !253
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_bad(), !dbg !254
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !255
  ret i32 0, !dbg !256
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !257 {
entry:
  ret i32 1, !dbg !260
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !261 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %data, align 4, !dbg !264
  %call = call i32 @staticReturnsTrue(), !dbg !265
  %tobool = icmp ne i32 %call, 0, !dbg !265
  br i1 %tobool, label %if.then, label %if.end35, !dbg !267

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !268, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !272, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !274, metadata !DIExpression()), !dbg !275
  store i32 -1, i32* %listenSocket, align 4, !dbg !275
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !276, metadata !DIExpression()), !dbg !277
  store i32 -1, i32* %acceptSocket, align 4, !dbg !277
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !278, metadata !DIExpression()), !dbg !279
  br label %do.body, !dbg !280

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !281
  store i32 %call1, i32* %listenSocket, align 4, !dbg !283
  %0 = load i32, i32* %listenSocket, align 4, !dbg !284
  %cmp = icmp eq i32 %0, -1, !dbg !286
  br i1 %cmp, label %if.then2, label %if.end, !dbg !287

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !288

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !290
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !290
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !291
  store i16 2, i16* %sin_family, align 4, !dbg !292
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !293
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !294
  store i32 0, i32* %s_addr, align 4, !dbg !295
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !296
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !297
  store i16 %call3, i16* %sin_port, align 2, !dbg !298
  %2 = load i32, i32* %listenSocket, align 4, !dbg !299
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !301
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !302
  %cmp5 = icmp eq i32 %call4, -1, !dbg !303
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !304

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !305

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !307
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !309
  %cmp9 = icmp eq i32 %call8, -1, !dbg !310
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !311

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !312

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !314
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !315
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !316
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !317
  %cmp13 = icmp eq i32 %6, -1, !dbg !319
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !320

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !321

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !323
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !324
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !325
  %conv = trunc i64 %call16 to i32, !dbg !325
  store i32 %conv, i32* %recvResult, align 4, !dbg !326
  %8 = load i32, i32* %recvResult, align 4, !dbg !327
  %cmp17 = icmp eq i32 %8, -1, !dbg !329
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !330

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !331
  %cmp19 = icmp eq i32 %9, 0, !dbg !332
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !333

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !334

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !336
  %idxprom = sext i32 %10 to i64, !dbg !337
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !337
  store i8 0, i8* %arrayidx, align 1, !dbg !338
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !339
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !340
  store i32 %call24, i32* %data, align 4, !dbg !341
  br label %do.end, !dbg !342

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !343
  %cmp25 = icmp ne i32 %11, -1, !dbg !345
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !346

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !347
  %call28 = call i32 @close(i32 %12), !dbg !349
  br label %if.end29, !dbg !350

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !351
  %cmp30 = icmp ne i32 %13, -1, !dbg !353
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !354

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !355
  %call33 = call i32 @close(i32 %14), !dbg !357
  br label %if.end34, !dbg !358

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !359

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 @staticReturnsFalse(), !dbg !360
  %tobool37 = icmp ne i32 %call36, 0, !dbg !360
  br i1 %tobool37, label %if.then38, label %if.else, !dbg !362

if.then38:                                        ; preds = %if.end35
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !363
  br label %if.end52, !dbg !365

if.else:                                          ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !366, metadata !DIExpression()), !dbg !369
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !370, metadata !DIExpression()), !dbg !371
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !371
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !371
  %16 = load i32, i32* %data, align 4, !dbg !372
  %cmp39 = icmp sge i32 %16, 0, !dbg !374
  br i1 %cmp39, label %land.lhs.true, label %if.else50, !dbg !375

land.lhs.true:                                    ; preds = %if.else
  %17 = load i32, i32* %data, align 4, !dbg !376
  %cmp41 = icmp slt i32 %17, 10, !dbg !377
  br i1 %cmp41, label %if.then43, label %if.else50, !dbg !378

if.then43:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !379
  %idxprom44 = sext i32 %18 to i64, !dbg !381
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !381
  store i32 1, i32* %arrayidx45, align 4, !dbg !382
  store i32 0, i32* %i, align 4, !dbg !383
  br label %for.cond, !dbg !385

for.cond:                                         ; preds = %for.inc, %if.then43
  %19 = load i32, i32* %i, align 4, !dbg !386
  %cmp46 = icmp slt i32 %19, 10, !dbg !388
  br i1 %cmp46, label %for.body, label %for.end, !dbg !389

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !390
  %idxprom48 = sext i32 %20 to i64, !dbg !392
  %arrayidx49 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom48, !dbg !392
  %21 = load i32, i32* %arrayidx49, align 4, !dbg !392
  call void @printIntLine(i32 %21), !dbg !393
  br label %for.inc, !dbg !394

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !395
  %inc = add nsw i32 %22, 1, !dbg !395
  store i32 %inc, i32* %i, align 4, !dbg !395
  br label %for.cond, !dbg !396, !llvm.loop !397

for.end:                                          ; preds = %for.cond
  br label %if.end51, !dbg !399

if.else50:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !400
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %for.end
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then38
  ret void, !dbg !402
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !403 {
entry:
  ret i32 0, !dbg !404
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !405 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !406, metadata !DIExpression()), !dbg !407
  store i32 -1, i32* %data, align 4, !dbg !408
  %call = call i32 @staticReturnsTrue(), !dbg !409
  %tobool = icmp ne i32 %call, 0, !dbg !409
  br i1 %tobool, label %if.then, label %if.end35, !dbg !411

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !412, metadata !DIExpression()), !dbg !415
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !416, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !418, metadata !DIExpression()), !dbg !419
  store i32 -1, i32* %listenSocket, align 4, !dbg !419
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !420, metadata !DIExpression()), !dbg !421
  store i32 -1, i32* %acceptSocket, align 4, !dbg !421
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !422, metadata !DIExpression()), !dbg !423
  br label %do.body, !dbg !424

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !425
  store i32 %call1, i32* %listenSocket, align 4, !dbg !427
  %0 = load i32, i32* %listenSocket, align 4, !dbg !428
  %cmp = icmp eq i32 %0, -1, !dbg !430
  br i1 %cmp, label %if.then2, label %if.end, !dbg !431

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !432

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !434
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !434
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !435
  store i16 2, i16* %sin_family, align 4, !dbg !436
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !437
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !438
  store i32 0, i32* %s_addr, align 4, !dbg !439
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !440
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !441
  store i16 %call3, i16* %sin_port, align 2, !dbg !442
  %2 = load i32, i32* %listenSocket, align 4, !dbg !443
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !445
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !446
  %cmp5 = icmp eq i32 %call4, -1, !dbg !447
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !448

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !449

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !451
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !453
  %cmp9 = icmp eq i32 %call8, -1, !dbg !454
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !455

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !456

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !458
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !459
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !460
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !461
  %cmp13 = icmp eq i32 %6, -1, !dbg !463
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !464

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !465

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !467
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !468
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !469
  %conv = trunc i64 %call16 to i32, !dbg !469
  store i32 %conv, i32* %recvResult, align 4, !dbg !470
  %8 = load i32, i32* %recvResult, align 4, !dbg !471
  %cmp17 = icmp eq i32 %8, -1, !dbg !473
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !474

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !475
  %cmp19 = icmp eq i32 %9, 0, !dbg !476
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !477

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !478

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !480
  %idxprom = sext i32 %10 to i64, !dbg !481
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !481
  store i8 0, i8* %arrayidx, align 1, !dbg !482
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !483
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !484
  store i32 %call24, i32* %data, align 4, !dbg !485
  br label %do.end, !dbg !486

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !487
  %cmp25 = icmp ne i32 %11, -1, !dbg !489
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !490

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !491
  %call28 = call i32 @close(i32 %12), !dbg !493
  br label %if.end29, !dbg !494

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !495
  %cmp30 = icmp ne i32 %13, -1, !dbg !497
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !498

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !499
  %call33 = call i32 @close(i32 %14), !dbg !501
  br label %if.end34, !dbg !502

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !503

if.end35:                                         ; preds = %if.end34, %entry
  %call36 = call i32 @staticReturnsTrue(), !dbg !504
  %tobool37 = icmp ne i32 %call36, 0, !dbg !504
  br i1 %tobool37, label %if.then38, label %if.end51, !dbg !506

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !507, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !511, metadata !DIExpression()), !dbg !512
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !512
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !512
  %16 = load i32, i32* %data, align 4, !dbg !513
  %cmp39 = icmp sge i32 %16, 0, !dbg !515
  br i1 %cmp39, label %land.lhs.true, label %if.else, !dbg !516

land.lhs.true:                                    ; preds = %if.then38
  %17 = load i32, i32* %data, align 4, !dbg !517
  %cmp41 = icmp slt i32 %17, 10, !dbg !518
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !519

if.then43:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !520
  %idxprom44 = sext i32 %18 to i64, !dbg !522
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !522
  store i32 1, i32* %arrayidx45, align 4, !dbg !523
  store i32 0, i32* %i, align 4, !dbg !524
  br label %for.cond, !dbg !526

for.cond:                                         ; preds = %for.inc, %if.then43
  %19 = load i32, i32* %i, align 4, !dbg !527
  %cmp46 = icmp slt i32 %19, 10, !dbg !529
  br i1 %cmp46, label %for.body, label %for.end, !dbg !530

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !531
  %idxprom48 = sext i32 %20 to i64, !dbg !533
  %arrayidx49 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom48, !dbg !533
  %21 = load i32, i32* %arrayidx49, align 4, !dbg !533
  call void @printIntLine(i32 %21), !dbg !534
  br label %for.inc, !dbg !535

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !536
  %inc = add nsw i32 %22, 1, !dbg !536
  store i32 %inc, i32* %i, align 4, !dbg !536
  br label %for.cond, !dbg !537, !llvm.loop !538

for.end:                                          ; preds = %for.cond
  br label %if.end50, !dbg !540

if.else:                                          ; preds = %land.lhs.true, %if.then38
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !541
  br label %if.end50

if.end50:                                         ; preds = %if.else, %for.end
  br label %if.end51, !dbg !543

if.end51:                                         ; preds = %if.end50, %if.end35
  ret void, !dbg !544
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !545 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !546, metadata !DIExpression()), !dbg !547
  store i32 -1, i32* %data, align 4, !dbg !548
  %call = call i32 @staticReturnsFalse(), !dbg !549
  %tobool = icmp ne i32 %call, 0, !dbg !549
  br i1 %tobool, label %if.then, label %if.else, !dbg !551

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !552
  br label %if.end, !dbg !554

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !555
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !557
  %tobool2 = icmp ne i32 %call1, 0, !dbg !557
  br i1 %tobool2, label %if.then3, label %if.end10, !dbg !559

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !560, metadata !DIExpression()), !dbg !563
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !564, metadata !DIExpression()), !dbg !565
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !565
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !565
  %1 = load i32, i32* %data, align 4, !dbg !566
  %cmp = icmp sge i32 %1, 0, !dbg !568
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !569

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !570
  %idxprom = sext i32 %2 to i64, !dbg !572
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !572
  store i32 1, i32* %arrayidx, align 4, !dbg !573
  store i32 0, i32* %i, align 4, !dbg !574
  br label %for.cond, !dbg !576

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !577
  %cmp5 = icmp slt i32 %3, 10, !dbg !579
  br i1 %cmp5, label %for.body, label %for.end, !dbg !580

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !581
  %idxprom6 = sext i32 %4 to i64, !dbg !583
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !583
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !583
  call void @printIntLine(i32 %5), !dbg !584
  br label %for.inc, !dbg !585

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !586
  %inc = add nsw i32 %6, 1, !dbg !586
  store i32 %inc, i32* %i, align 4, !dbg !586
  br label %for.cond, !dbg !587, !llvm.loop !588

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !590

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !591
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !593

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !594
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !595 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !596, metadata !DIExpression()), !dbg !597
  store i32 -1, i32* %data, align 4, !dbg !598
  %call = call i32 @staticReturnsTrue(), !dbg !599
  %tobool = icmp ne i32 %call, 0, !dbg !599
  br i1 %tobool, label %if.then, label %if.end, !dbg !601

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !602
  br label %if.end, !dbg !604

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !605
  %tobool2 = icmp ne i32 %call1, 0, !dbg !605
  br i1 %tobool2, label %if.then3, label %if.end9, !dbg !607

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !608, metadata !DIExpression()), !dbg !611
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !612, metadata !DIExpression()), !dbg !613
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !613
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !613
  %1 = load i32, i32* %data, align 4, !dbg !614
  %cmp = icmp sge i32 %1, 0, !dbg !616
  br i1 %cmp, label %if.then4, label %if.else, !dbg !617

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !618
  %idxprom = sext i32 %2 to i64, !dbg !620
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !620
  store i32 1, i32* %arrayidx, align 4, !dbg !621
  store i32 0, i32* %i, align 4, !dbg !622
  br label %for.cond, !dbg !624

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !625
  %cmp5 = icmp slt i32 %3, 10, !dbg !627
  br i1 %cmp5, label %for.body, label %for.end, !dbg !628

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !629
  %idxprom6 = sext i32 %4 to i64, !dbg !631
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !631
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !631
  call void @printIntLine(i32 %5), !dbg !632
  br label %for.inc, !dbg !633

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !634
  %inc = add nsw i32 %6, 1, !dbg !634
  store i32 %inc, i32* %i, align 4, !dbg !634
  br label %for.cond, !dbg !635, !llvm.loop !636

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !638

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !639
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !641

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !642
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_bad", scope: !71, file: !71, line: 57, type: !72, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 59, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 59, column: 9, scope: !70)
!78 = !DILocation(line: 61, column: 10, scope: !70)
!79 = !DILocation(line: 62, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 62, column: 8)
!81 = !DILocation(line: 62, column: 8, scope: !70)
!82 = !DILocalVariable(name: "recvResult", scope: !83, file: !71, line: 69, type: !76)
!83 = distinct !DILexicalBlock(scope: !84, file: !71, line: 64, column: 9)
!84 = distinct !DILexicalBlock(scope: !80, file: !71, line: 63, column: 5)
!85 = !DILocation(line: 69, column: 17, scope: !83)
!86 = !DILocalVariable(name: "service", scope: !83, file: !71, line: 70, type: !87)
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
!103 = !DILocation(line: 70, column: 32, scope: !83)
!104 = !DILocalVariable(name: "listenSocket", scope: !83, file: !71, line: 71, type: !76)
!105 = !DILocation(line: 71, column: 20, scope: !83)
!106 = !DILocalVariable(name: "acceptSocket", scope: !83, file: !71, line: 72, type: !76)
!107 = !DILocation(line: 72, column: 20, scope: !83)
!108 = !DILocalVariable(name: "inputBuffer", scope: !83, file: !71, line: 73, type: !60)
!109 = !DILocation(line: 73, column: 18, scope: !83)
!110 = !DILocation(line: 74, column: 13, scope: !83)
!111 = !DILocation(line: 84, column: 32, scope: !112)
!112 = distinct !DILexicalBlock(scope: !83, file: !71, line: 75, column: 13)
!113 = !DILocation(line: 84, column: 30, scope: !112)
!114 = !DILocation(line: 85, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !71, line: 85, column: 21)
!116 = !DILocation(line: 85, column: 34, scope: !115)
!117 = !DILocation(line: 85, column: 21, scope: !112)
!118 = !DILocation(line: 87, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !71, line: 86, column: 17)
!120 = !DILocation(line: 89, column: 17, scope: !112)
!121 = !DILocation(line: 90, column: 25, scope: !112)
!122 = !DILocation(line: 90, column: 36, scope: !112)
!123 = !DILocation(line: 91, column: 25, scope: !112)
!124 = !DILocation(line: 91, column: 34, scope: !112)
!125 = !DILocation(line: 91, column: 41, scope: !112)
!126 = !DILocation(line: 92, column: 36, scope: !112)
!127 = !DILocation(line: 92, column: 25, scope: !112)
!128 = !DILocation(line: 92, column: 34, scope: !112)
!129 = !DILocation(line: 93, column: 26, scope: !130)
!130 = distinct !DILexicalBlock(scope: !112, file: !71, line: 93, column: 21)
!131 = !DILocation(line: 93, column: 40, scope: !130)
!132 = !DILocation(line: 93, column: 21, scope: !130)
!133 = !DILocation(line: 93, column: 85, scope: !130)
!134 = !DILocation(line: 93, column: 21, scope: !112)
!135 = !DILocation(line: 95, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !71, line: 94, column: 17)
!137 = !DILocation(line: 97, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !112, file: !71, line: 97, column: 21)
!139 = !DILocation(line: 97, column: 21, scope: !138)
!140 = !DILocation(line: 97, column: 58, scope: !138)
!141 = !DILocation(line: 97, column: 21, scope: !112)
!142 = !DILocation(line: 99, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !71, line: 98, column: 17)
!144 = !DILocation(line: 101, column: 39, scope: !112)
!145 = !DILocation(line: 101, column: 32, scope: !112)
!146 = !DILocation(line: 101, column: 30, scope: !112)
!147 = !DILocation(line: 102, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !112, file: !71, line: 102, column: 21)
!149 = !DILocation(line: 102, column: 34, scope: !148)
!150 = !DILocation(line: 102, column: 21, scope: !112)
!151 = !DILocation(line: 104, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !71, line: 103, column: 17)
!153 = !DILocation(line: 107, column: 35, scope: !112)
!154 = !DILocation(line: 107, column: 49, scope: !112)
!155 = !DILocation(line: 107, column: 30, scope: !112)
!156 = !DILocation(line: 107, column: 28, scope: !112)
!157 = !DILocation(line: 108, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !112, file: !71, line: 108, column: 21)
!159 = !DILocation(line: 108, column: 32, scope: !158)
!160 = !DILocation(line: 108, column: 48, scope: !158)
!161 = !DILocation(line: 108, column: 51, scope: !158)
!162 = !DILocation(line: 108, column: 62, scope: !158)
!163 = !DILocation(line: 108, column: 21, scope: !112)
!164 = !DILocation(line: 110, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !71, line: 109, column: 17)
!166 = !DILocation(line: 113, column: 29, scope: !112)
!167 = !DILocation(line: 113, column: 17, scope: !112)
!168 = !DILocation(line: 113, column: 41, scope: !112)
!169 = !DILocation(line: 115, column: 29, scope: !112)
!170 = !DILocation(line: 115, column: 24, scope: !112)
!171 = !DILocation(line: 115, column: 22, scope: !112)
!172 = !DILocation(line: 116, column: 13, scope: !112)
!173 = !DILocation(line: 118, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !83, file: !71, line: 118, column: 17)
!175 = !DILocation(line: 118, column: 30, scope: !174)
!176 = !DILocation(line: 118, column: 17, scope: !83)
!177 = !DILocation(line: 120, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !71, line: 119, column: 13)
!179 = !DILocation(line: 120, column: 17, scope: !178)
!180 = !DILocation(line: 121, column: 13, scope: !178)
!181 = !DILocation(line: 122, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !83, file: !71, line: 122, column: 17)
!183 = !DILocation(line: 122, column: 30, scope: !182)
!184 = !DILocation(line: 122, column: 17, scope: !83)
!185 = !DILocation(line: 124, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !71, line: 123, column: 13)
!187 = !DILocation(line: 124, column: 17, scope: !186)
!188 = !DILocation(line: 125, column: 13, scope: !186)
!189 = !DILocation(line: 133, column: 5, scope: !84)
!190 = !DILocation(line: 134, column: 8, scope: !191)
!191 = distinct !DILexicalBlock(scope: !70, file: !71, line: 134, column: 8)
!192 = !DILocation(line: 134, column: 8, scope: !70)
!193 = !DILocalVariable(name: "i", scope: !194, file: !71, line: 137, type: !76)
!194 = distinct !DILexicalBlock(scope: !195, file: !71, line: 136, column: 9)
!195 = distinct !DILexicalBlock(scope: !191, file: !71, line: 135, column: 5)
!196 = !DILocation(line: 137, column: 17, scope: !194)
!197 = !DILocalVariable(name: "buffer", scope: !194, file: !71, line: 138, type: !198)
!198 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !199)
!199 = !{!200}
!200 = !DISubrange(count: 10)
!201 = !DILocation(line: 138, column: 17, scope: !194)
!202 = !DILocation(line: 141, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !194, file: !71, line: 141, column: 17)
!204 = !DILocation(line: 141, column: 22, scope: !203)
!205 = !DILocation(line: 141, column: 17, scope: !194)
!206 = !DILocation(line: 143, column: 24, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !71, line: 142, column: 13)
!208 = !DILocation(line: 143, column: 17, scope: !207)
!209 = !DILocation(line: 143, column: 30, scope: !207)
!210 = !DILocation(line: 145, column: 23, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !71, line: 145, column: 17)
!212 = !DILocation(line: 145, column: 21, scope: !211)
!213 = !DILocation(line: 145, column: 28, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !71, line: 145, column: 17)
!215 = !DILocation(line: 145, column: 30, scope: !214)
!216 = !DILocation(line: 145, column: 17, scope: !211)
!217 = !DILocation(line: 147, column: 41, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !71, line: 146, column: 17)
!219 = !DILocation(line: 147, column: 34, scope: !218)
!220 = !DILocation(line: 147, column: 21, scope: !218)
!221 = !DILocation(line: 148, column: 17, scope: !218)
!222 = !DILocation(line: 145, column: 37, scope: !214)
!223 = !DILocation(line: 145, column: 17, scope: !214)
!224 = distinct !{!224, !216, !225, !226}
!225 = !DILocation(line: 148, column: 17, scope: !211)
!226 = !{!"llvm.loop.mustprogress"}
!227 = !DILocation(line: 149, column: 13, scope: !207)
!228 = !DILocation(line: 152, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !203, file: !71, line: 151, column: 13)
!230 = !DILocation(line: 155, column: 5, scope: !195)
!231 = !DILocation(line: 156, column: 1, scope: !70)
!232 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_good", scope: !71, file: !71, line: 446, type: !72, scopeLine: 447, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!233 = !DILocation(line: 448, column: 5, scope: !232)
!234 = !DILocation(line: 449, column: 5, scope: !232)
!235 = !DILocation(line: 450, column: 5, scope: !232)
!236 = !DILocation(line: 451, column: 5, scope: !232)
!237 = !DILocation(line: 452, column: 1, scope: !232)
!238 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 463, type: !239, scopeLine: 464, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!239 = !DISubroutineType(types: !240)
!240 = !{!76, !76, !241}
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!243 = !DILocalVariable(name: "argc", arg: 1, scope: !238, file: !71, line: 463, type: !76)
!244 = !DILocation(line: 463, column: 14, scope: !238)
!245 = !DILocalVariable(name: "argv", arg: 2, scope: !238, file: !71, line: 463, type: !241)
!246 = !DILocation(line: 463, column: 27, scope: !238)
!247 = !DILocation(line: 466, column: 22, scope: !238)
!248 = !DILocation(line: 466, column: 12, scope: !238)
!249 = !DILocation(line: 466, column: 5, scope: !238)
!250 = !DILocation(line: 468, column: 5, scope: !238)
!251 = !DILocation(line: 469, column: 5, scope: !238)
!252 = !DILocation(line: 470, column: 5, scope: !238)
!253 = !DILocation(line: 473, column: 5, scope: !238)
!254 = !DILocation(line: 474, column: 5, scope: !238)
!255 = !DILocation(line: 475, column: 5, scope: !238)
!256 = !DILocation(line: 477, column: 5, scope: !238)
!257 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !71, file: !71, line: 45, type: !258, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!258 = !DISubroutineType(types: !259)
!259 = !{!76}
!260 = !DILocation(line: 47, column: 5, scope: !257)
!261 = distinct !DISubprogram(name: "goodB2G1", scope: !71, file: !71, line: 163, type: !72, scopeLine: 164, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!262 = !DILocalVariable(name: "data", scope: !261, file: !71, line: 165, type: !76)
!263 = !DILocation(line: 165, column: 9, scope: !261)
!264 = !DILocation(line: 167, column: 10, scope: !261)
!265 = !DILocation(line: 168, column: 8, scope: !266)
!266 = distinct !DILexicalBlock(scope: !261, file: !71, line: 168, column: 8)
!267 = !DILocation(line: 168, column: 8, scope: !261)
!268 = !DILocalVariable(name: "recvResult", scope: !269, file: !71, line: 175, type: !76)
!269 = distinct !DILexicalBlock(scope: !270, file: !71, line: 170, column: 9)
!270 = distinct !DILexicalBlock(scope: !266, file: !71, line: 169, column: 5)
!271 = !DILocation(line: 175, column: 17, scope: !269)
!272 = !DILocalVariable(name: "service", scope: !269, file: !71, line: 176, type: !87)
!273 = !DILocation(line: 176, column: 32, scope: !269)
!274 = !DILocalVariable(name: "listenSocket", scope: !269, file: !71, line: 177, type: !76)
!275 = !DILocation(line: 177, column: 20, scope: !269)
!276 = !DILocalVariable(name: "acceptSocket", scope: !269, file: !71, line: 178, type: !76)
!277 = !DILocation(line: 178, column: 20, scope: !269)
!278 = !DILocalVariable(name: "inputBuffer", scope: !269, file: !71, line: 179, type: !60)
!279 = !DILocation(line: 179, column: 18, scope: !269)
!280 = !DILocation(line: 180, column: 13, scope: !269)
!281 = !DILocation(line: 190, column: 32, scope: !282)
!282 = distinct !DILexicalBlock(scope: !269, file: !71, line: 181, column: 13)
!283 = !DILocation(line: 190, column: 30, scope: !282)
!284 = !DILocation(line: 191, column: 21, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !71, line: 191, column: 21)
!286 = !DILocation(line: 191, column: 34, scope: !285)
!287 = !DILocation(line: 191, column: 21, scope: !282)
!288 = !DILocation(line: 193, column: 21, scope: !289)
!289 = distinct !DILexicalBlock(scope: !285, file: !71, line: 192, column: 17)
!290 = !DILocation(line: 195, column: 17, scope: !282)
!291 = !DILocation(line: 196, column: 25, scope: !282)
!292 = !DILocation(line: 196, column: 36, scope: !282)
!293 = !DILocation(line: 197, column: 25, scope: !282)
!294 = !DILocation(line: 197, column: 34, scope: !282)
!295 = !DILocation(line: 197, column: 41, scope: !282)
!296 = !DILocation(line: 198, column: 36, scope: !282)
!297 = !DILocation(line: 198, column: 25, scope: !282)
!298 = !DILocation(line: 198, column: 34, scope: !282)
!299 = !DILocation(line: 199, column: 26, scope: !300)
!300 = distinct !DILexicalBlock(scope: !282, file: !71, line: 199, column: 21)
!301 = !DILocation(line: 199, column: 40, scope: !300)
!302 = !DILocation(line: 199, column: 21, scope: !300)
!303 = !DILocation(line: 199, column: 85, scope: !300)
!304 = !DILocation(line: 199, column: 21, scope: !282)
!305 = !DILocation(line: 201, column: 21, scope: !306)
!306 = distinct !DILexicalBlock(scope: !300, file: !71, line: 200, column: 17)
!307 = !DILocation(line: 203, column: 28, scope: !308)
!308 = distinct !DILexicalBlock(scope: !282, file: !71, line: 203, column: 21)
!309 = !DILocation(line: 203, column: 21, scope: !308)
!310 = !DILocation(line: 203, column: 58, scope: !308)
!311 = !DILocation(line: 203, column: 21, scope: !282)
!312 = !DILocation(line: 205, column: 21, scope: !313)
!313 = distinct !DILexicalBlock(scope: !308, file: !71, line: 204, column: 17)
!314 = !DILocation(line: 207, column: 39, scope: !282)
!315 = !DILocation(line: 207, column: 32, scope: !282)
!316 = !DILocation(line: 207, column: 30, scope: !282)
!317 = !DILocation(line: 208, column: 21, scope: !318)
!318 = distinct !DILexicalBlock(scope: !282, file: !71, line: 208, column: 21)
!319 = !DILocation(line: 208, column: 34, scope: !318)
!320 = !DILocation(line: 208, column: 21, scope: !282)
!321 = !DILocation(line: 210, column: 21, scope: !322)
!322 = distinct !DILexicalBlock(scope: !318, file: !71, line: 209, column: 17)
!323 = !DILocation(line: 213, column: 35, scope: !282)
!324 = !DILocation(line: 213, column: 49, scope: !282)
!325 = !DILocation(line: 213, column: 30, scope: !282)
!326 = !DILocation(line: 213, column: 28, scope: !282)
!327 = !DILocation(line: 214, column: 21, scope: !328)
!328 = distinct !DILexicalBlock(scope: !282, file: !71, line: 214, column: 21)
!329 = !DILocation(line: 214, column: 32, scope: !328)
!330 = !DILocation(line: 214, column: 48, scope: !328)
!331 = !DILocation(line: 214, column: 51, scope: !328)
!332 = !DILocation(line: 214, column: 62, scope: !328)
!333 = !DILocation(line: 214, column: 21, scope: !282)
!334 = !DILocation(line: 216, column: 21, scope: !335)
!335 = distinct !DILexicalBlock(scope: !328, file: !71, line: 215, column: 17)
!336 = !DILocation(line: 219, column: 29, scope: !282)
!337 = !DILocation(line: 219, column: 17, scope: !282)
!338 = !DILocation(line: 219, column: 41, scope: !282)
!339 = !DILocation(line: 221, column: 29, scope: !282)
!340 = !DILocation(line: 221, column: 24, scope: !282)
!341 = !DILocation(line: 221, column: 22, scope: !282)
!342 = !DILocation(line: 222, column: 13, scope: !282)
!343 = !DILocation(line: 224, column: 17, scope: !344)
!344 = distinct !DILexicalBlock(scope: !269, file: !71, line: 224, column: 17)
!345 = !DILocation(line: 224, column: 30, scope: !344)
!346 = !DILocation(line: 224, column: 17, scope: !269)
!347 = !DILocation(line: 226, column: 30, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !71, line: 225, column: 13)
!349 = !DILocation(line: 226, column: 17, scope: !348)
!350 = !DILocation(line: 227, column: 13, scope: !348)
!351 = !DILocation(line: 228, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !269, file: !71, line: 228, column: 17)
!353 = !DILocation(line: 228, column: 30, scope: !352)
!354 = !DILocation(line: 228, column: 17, scope: !269)
!355 = !DILocation(line: 230, column: 30, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !71, line: 229, column: 13)
!357 = !DILocation(line: 230, column: 17, scope: !356)
!358 = !DILocation(line: 231, column: 13, scope: !356)
!359 = !DILocation(line: 239, column: 5, scope: !270)
!360 = !DILocation(line: 240, column: 8, scope: !361)
!361 = distinct !DILexicalBlock(scope: !261, file: !71, line: 240, column: 8)
!362 = !DILocation(line: 240, column: 8, scope: !261)
!363 = !DILocation(line: 243, column: 9, scope: !364)
!364 = distinct !DILexicalBlock(scope: !361, file: !71, line: 241, column: 5)
!365 = !DILocation(line: 244, column: 5, scope: !364)
!366 = !DILocalVariable(name: "i", scope: !367, file: !71, line: 248, type: !76)
!367 = distinct !DILexicalBlock(scope: !368, file: !71, line: 247, column: 9)
!368 = distinct !DILexicalBlock(scope: !361, file: !71, line: 246, column: 5)
!369 = !DILocation(line: 248, column: 17, scope: !367)
!370 = !DILocalVariable(name: "buffer", scope: !367, file: !71, line: 249, type: !198)
!371 = !DILocation(line: 249, column: 17, scope: !367)
!372 = !DILocation(line: 251, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !367, file: !71, line: 251, column: 17)
!374 = !DILocation(line: 251, column: 22, scope: !373)
!375 = !DILocation(line: 251, column: 27, scope: !373)
!376 = !DILocation(line: 251, column: 30, scope: !373)
!377 = !DILocation(line: 251, column: 35, scope: !373)
!378 = !DILocation(line: 251, column: 17, scope: !367)
!379 = !DILocation(line: 253, column: 24, scope: !380)
!380 = distinct !DILexicalBlock(scope: !373, file: !71, line: 252, column: 13)
!381 = !DILocation(line: 253, column: 17, scope: !380)
!382 = !DILocation(line: 253, column: 30, scope: !380)
!383 = !DILocation(line: 255, column: 23, scope: !384)
!384 = distinct !DILexicalBlock(scope: !380, file: !71, line: 255, column: 17)
!385 = !DILocation(line: 255, column: 21, scope: !384)
!386 = !DILocation(line: 255, column: 28, scope: !387)
!387 = distinct !DILexicalBlock(scope: !384, file: !71, line: 255, column: 17)
!388 = !DILocation(line: 255, column: 30, scope: !387)
!389 = !DILocation(line: 255, column: 17, scope: !384)
!390 = !DILocation(line: 257, column: 41, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !71, line: 256, column: 17)
!392 = !DILocation(line: 257, column: 34, scope: !391)
!393 = !DILocation(line: 257, column: 21, scope: !391)
!394 = !DILocation(line: 258, column: 17, scope: !391)
!395 = !DILocation(line: 255, column: 37, scope: !387)
!396 = !DILocation(line: 255, column: 17, scope: !387)
!397 = distinct !{!397, !389, !398, !226}
!398 = !DILocation(line: 258, column: 17, scope: !384)
!399 = !DILocation(line: 259, column: 13, scope: !380)
!400 = !DILocation(line: 262, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !373, file: !71, line: 261, column: 13)
!402 = !DILocation(line: 266, column: 1, scope: !261)
!403 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !71, file: !71, line: 50, type: !258, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!404 = !DILocation(line: 52, column: 5, scope: !403)
!405 = distinct !DISubprogram(name: "goodB2G2", scope: !71, file: !71, line: 269, type: !72, scopeLine: 270, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!406 = !DILocalVariable(name: "data", scope: !405, file: !71, line: 271, type: !76)
!407 = !DILocation(line: 271, column: 9, scope: !405)
!408 = !DILocation(line: 273, column: 10, scope: !405)
!409 = !DILocation(line: 274, column: 8, scope: !410)
!410 = distinct !DILexicalBlock(scope: !405, file: !71, line: 274, column: 8)
!411 = !DILocation(line: 274, column: 8, scope: !405)
!412 = !DILocalVariable(name: "recvResult", scope: !413, file: !71, line: 281, type: !76)
!413 = distinct !DILexicalBlock(scope: !414, file: !71, line: 276, column: 9)
!414 = distinct !DILexicalBlock(scope: !410, file: !71, line: 275, column: 5)
!415 = !DILocation(line: 281, column: 17, scope: !413)
!416 = !DILocalVariable(name: "service", scope: !413, file: !71, line: 282, type: !87)
!417 = !DILocation(line: 282, column: 32, scope: !413)
!418 = !DILocalVariable(name: "listenSocket", scope: !413, file: !71, line: 283, type: !76)
!419 = !DILocation(line: 283, column: 20, scope: !413)
!420 = !DILocalVariable(name: "acceptSocket", scope: !413, file: !71, line: 284, type: !76)
!421 = !DILocation(line: 284, column: 20, scope: !413)
!422 = !DILocalVariable(name: "inputBuffer", scope: !413, file: !71, line: 285, type: !60)
!423 = !DILocation(line: 285, column: 18, scope: !413)
!424 = !DILocation(line: 286, column: 13, scope: !413)
!425 = !DILocation(line: 296, column: 32, scope: !426)
!426 = distinct !DILexicalBlock(scope: !413, file: !71, line: 287, column: 13)
!427 = !DILocation(line: 296, column: 30, scope: !426)
!428 = !DILocation(line: 297, column: 21, scope: !429)
!429 = distinct !DILexicalBlock(scope: !426, file: !71, line: 297, column: 21)
!430 = !DILocation(line: 297, column: 34, scope: !429)
!431 = !DILocation(line: 297, column: 21, scope: !426)
!432 = !DILocation(line: 299, column: 21, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !71, line: 298, column: 17)
!434 = !DILocation(line: 301, column: 17, scope: !426)
!435 = !DILocation(line: 302, column: 25, scope: !426)
!436 = !DILocation(line: 302, column: 36, scope: !426)
!437 = !DILocation(line: 303, column: 25, scope: !426)
!438 = !DILocation(line: 303, column: 34, scope: !426)
!439 = !DILocation(line: 303, column: 41, scope: !426)
!440 = !DILocation(line: 304, column: 36, scope: !426)
!441 = !DILocation(line: 304, column: 25, scope: !426)
!442 = !DILocation(line: 304, column: 34, scope: !426)
!443 = !DILocation(line: 305, column: 26, scope: !444)
!444 = distinct !DILexicalBlock(scope: !426, file: !71, line: 305, column: 21)
!445 = !DILocation(line: 305, column: 40, scope: !444)
!446 = !DILocation(line: 305, column: 21, scope: !444)
!447 = !DILocation(line: 305, column: 85, scope: !444)
!448 = !DILocation(line: 305, column: 21, scope: !426)
!449 = !DILocation(line: 307, column: 21, scope: !450)
!450 = distinct !DILexicalBlock(scope: !444, file: !71, line: 306, column: 17)
!451 = !DILocation(line: 309, column: 28, scope: !452)
!452 = distinct !DILexicalBlock(scope: !426, file: !71, line: 309, column: 21)
!453 = !DILocation(line: 309, column: 21, scope: !452)
!454 = !DILocation(line: 309, column: 58, scope: !452)
!455 = !DILocation(line: 309, column: 21, scope: !426)
!456 = !DILocation(line: 311, column: 21, scope: !457)
!457 = distinct !DILexicalBlock(scope: !452, file: !71, line: 310, column: 17)
!458 = !DILocation(line: 313, column: 39, scope: !426)
!459 = !DILocation(line: 313, column: 32, scope: !426)
!460 = !DILocation(line: 313, column: 30, scope: !426)
!461 = !DILocation(line: 314, column: 21, scope: !462)
!462 = distinct !DILexicalBlock(scope: !426, file: !71, line: 314, column: 21)
!463 = !DILocation(line: 314, column: 34, scope: !462)
!464 = !DILocation(line: 314, column: 21, scope: !426)
!465 = !DILocation(line: 316, column: 21, scope: !466)
!466 = distinct !DILexicalBlock(scope: !462, file: !71, line: 315, column: 17)
!467 = !DILocation(line: 319, column: 35, scope: !426)
!468 = !DILocation(line: 319, column: 49, scope: !426)
!469 = !DILocation(line: 319, column: 30, scope: !426)
!470 = !DILocation(line: 319, column: 28, scope: !426)
!471 = !DILocation(line: 320, column: 21, scope: !472)
!472 = distinct !DILexicalBlock(scope: !426, file: !71, line: 320, column: 21)
!473 = !DILocation(line: 320, column: 32, scope: !472)
!474 = !DILocation(line: 320, column: 48, scope: !472)
!475 = !DILocation(line: 320, column: 51, scope: !472)
!476 = !DILocation(line: 320, column: 62, scope: !472)
!477 = !DILocation(line: 320, column: 21, scope: !426)
!478 = !DILocation(line: 322, column: 21, scope: !479)
!479 = distinct !DILexicalBlock(scope: !472, file: !71, line: 321, column: 17)
!480 = !DILocation(line: 325, column: 29, scope: !426)
!481 = !DILocation(line: 325, column: 17, scope: !426)
!482 = !DILocation(line: 325, column: 41, scope: !426)
!483 = !DILocation(line: 327, column: 29, scope: !426)
!484 = !DILocation(line: 327, column: 24, scope: !426)
!485 = !DILocation(line: 327, column: 22, scope: !426)
!486 = !DILocation(line: 328, column: 13, scope: !426)
!487 = !DILocation(line: 330, column: 17, scope: !488)
!488 = distinct !DILexicalBlock(scope: !413, file: !71, line: 330, column: 17)
!489 = !DILocation(line: 330, column: 30, scope: !488)
!490 = !DILocation(line: 330, column: 17, scope: !413)
!491 = !DILocation(line: 332, column: 30, scope: !492)
!492 = distinct !DILexicalBlock(scope: !488, file: !71, line: 331, column: 13)
!493 = !DILocation(line: 332, column: 17, scope: !492)
!494 = !DILocation(line: 333, column: 13, scope: !492)
!495 = !DILocation(line: 334, column: 17, scope: !496)
!496 = distinct !DILexicalBlock(scope: !413, file: !71, line: 334, column: 17)
!497 = !DILocation(line: 334, column: 30, scope: !496)
!498 = !DILocation(line: 334, column: 17, scope: !413)
!499 = !DILocation(line: 336, column: 30, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !71, line: 335, column: 13)
!501 = !DILocation(line: 336, column: 17, scope: !500)
!502 = !DILocation(line: 337, column: 13, scope: !500)
!503 = !DILocation(line: 345, column: 5, scope: !414)
!504 = !DILocation(line: 346, column: 8, scope: !505)
!505 = distinct !DILexicalBlock(scope: !405, file: !71, line: 346, column: 8)
!506 = !DILocation(line: 346, column: 8, scope: !405)
!507 = !DILocalVariable(name: "i", scope: !508, file: !71, line: 349, type: !76)
!508 = distinct !DILexicalBlock(scope: !509, file: !71, line: 348, column: 9)
!509 = distinct !DILexicalBlock(scope: !505, file: !71, line: 347, column: 5)
!510 = !DILocation(line: 349, column: 17, scope: !508)
!511 = !DILocalVariable(name: "buffer", scope: !508, file: !71, line: 350, type: !198)
!512 = !DILocation(line: 350, column: 17, scope: !508)
!513 = !DILocation(line: 352, column: 17, scope: !514)
!514 = distinct !DILexicalBlock(scope: !508, file: !71, line: 352, column: 17)
!515 = !DILocation(line: 352, column: 22, scope: !514)
!516 = !DILocation(line: 352, column: 27, scope: !514)
!517 = !DILocation(line: 352, column: 30, scope: !514)
!518 = !DILocation(line: 352, column: 35, scope: !514)
!519 = !DILocation(line: 352, column: 17, scope: !508)
!520 = !DILocation(line: 354, column: 24, scope: !521)
!521 = distinct !DILexicalBlock(scope: !514, file: !71, line: 353, column: 13)
!522 = !DILocation(line: 354, column: 17, scope: !521)
!523 = !DILocation(line: 354, column: 30, scope: !521)
!524 = !DILocation(line: 356, column: 23, scope: !525)
!525 = distinct !DILexicalBlock(scope: !521, file: !71, line: 356, column: 17)
!526 = !DILocation(line: 356, column: 21, scope: !525)
!527 = !DILocation(line: 356, column: 28, scope: !528)
!528 = distinct !DILexicalBlock(scope: !525, file: !71, line: 356, column: 17)
!529 = !DILocation(line: 356, column: 30, scope: !528)
!530 = !DILocation(line: 356, column: 17, scope: !525)
!531 = !DILocation(line: 358, column: 41, scope: !532)
!532 = distinct !DILexicalBlock(scope: !528, file: !71, line: 357, column: 17)
!533 = !DILocation(line: 358, column: 34, scope: !532)
!534 = !DILocation(line: 358, column: 21, scope: !532)
!535 = !DILocation(line: 359, column: 17, scope: !532)
!536 = !DILocation(line: 356, column: 37, scope: !528)
!537 = !DILocation(line: 356, column: 17, scope: !528)
!538 = distinct !{!538, !530, !539, !226}
!539 = !DILocation(line: 359, column: 17, scope: !525)
!540 = !DILocation(line: 360, column: 13, scope: !521)
!541 = !DILocation(line: 363, column: 17, scope: !542)
!542 = distinct !DILexicalBlock(scope: !514, file: !71, line: 362, column: 13)
!543 = !DILocation(line: 366, column: 5, scope: !509)
!544 = !DILocation(line: 367, column: 1, scope: !405)
!545 = distinct !DISubprogram(name: "goodG2B1", scope: !71, file: !71, line: 370, type: !72, scopeLine: 371, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!546 = !DILocalVariable(name: "data", scope: !545, file: !71, line: 372, type: !76)
!547 = !DILocation(line: 372, column: 9, scope: !545)
!548 = !DILocation(line: 374, column: 10, scope: !545)
!549 = !DILocation(line: 375, column: 8, scope: !550)
!550 = distinct !DILexicalBlock(scope: !545, file: !71, line: 375, column: 8)
!551 = !DILocation(line: 375, column: 8, scope: !545)
!552 = !DILocation(line: 378, column: 9, scope: !553)
!553 = distinct !DILexicalBlock(scope: !550, file: !71, line: 376, column: 5)
!554 = !DILocation(line: 379, column: 5, scope: !553)
!555 = !DILocation(line: 384, column: 14, scope: !556)
!556 = distinct !DILexicalBlock(scope: !550, file: !71, line: 381, column: 5)
!557 = !DILocation(line: 386, column: 8, scope: !558)
!558 = distinct !DILexicalBlock(scope: !545, file: !71, line: 386, column: 8)
!559 = !DILocation(line: 386, column: 8, scope: !545)
!560 = !DILocalVariable(name: "i", scope: !561, file: !71, line: 389, type: !76)
!561 = distinct !DILexicalBlock(scope: !562, file: !71, line: 388, column: 9)
!562 = distinct !DILexicalBlock(scope: !558, file: !71, line: 387, column: 5)
!563 = !DILocation(line: 389, column: 17, scope: !561)
!564 = !DILocalVariable(name: "buffer", scope: !561, file: !71, line: 390, type: !198)
!565 = !DILocation(line: 390, column: 17, scope: !561)
!566 = !DILocation(line: 393, column: 17, scope: !567)
!567 = distinct !DILexicalBlock(scope: !561, file: !71, line: 393, column: 17)
!568 = !DILocation(line: 393, column: 22, scope: !567)
!569 = !DILocation(line: 393, column: 17, scope: !561)
!570 = !DILocation(line: 395, column: 24, scope: !571)
!571 = distinct !DILexicalBlock(scope: !567, file: !71, line: 394, column: 13)
!572 = !DILocation(line: 395, column: 17, scope: !571)
!573 = !DILocation(line: 395, column: 30, scope: !571)
!574 = !DILocation(line: 397, column: 23, scope: !575)
!575 = distinct !DILexicalBlock(scope: !571, file: !71, line: 397, column: 17)
!576 = !DILocation(line: 397, column: 21, scope: !575)
!577 = !DILocation(line: 397, column: 28, scope: !578)
!578 = distinct !DILexicalBlock(scope: !575, file: !71, line: 397, column: 17)
!579 = !DILocation(line: 397, column: 30, scope: !578)
!580 = !DILocation(line: 397, column: 17, scope: !575)
!581 = !DILocation(line: 399, column: 41, scope: !582)
!582 = distinct !DILexicalBlock(scope: !578, file: !71, line: 398, column: 17)
!583 = !DILocation(line: 399, column: 34, scope: !582)
!584 = !DILocation(line: 399, column: 21, scope: !582)
!585 = !DILocation(line: 400, column: 17, scope: !582)
!586 = !DILocation(line: 397, column: 37, scope: !578)
!587 = !DILocation(line: 397, column: 17, scope: !578)
!588 = distinct !{!588, !580, !589, !226}
!589 = !DILocation(line: 400, column: 17, scope: !575)
!590 = !DILocation(line: 401, column: 13, scope: !571)
!591 = !DILocation(line: 404, column: 17, scope: !592)
!592 = distinct !DILexicalBlock(scope: !567, file: !71, line: 403, column: 13)
!593 = !DILocation(line: 407, column: 5, scope: !562)
!594 = !DILocation(line: 408, column: 1, scope: !545)
!595 = distinct !DISubprogram(name: "goodG2B2", scope: !71, file: !71, line: 411, type: !72, scopeLine: 412, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!596 = !DILocalVariable(name: "data", scope: !595, file: !71, line: 413, type: !76)
!597 = !DILocation(line: 413, column: 9, scope: !595)
!598 = !DILocation(line: 415, column: 10, scope: !595)
!599 = !DILocation(line: 416, column: 8, scope: !600)
!600 = distinct !DILexicalBlock(scope: !595, file: !71, line: 416, column: 8)
!601 = !DILocation(line: 416, column: 8, scope: !595)
!602 = !DILocation(line: 420, column: 14, scope: !603)
!603 = distinct !DILexicalBlock(scope: !600, file: !71, line: 417, column: 5)
!604 = !DILocation(line: 421, column: 5, scope: !603)
!605 = !DILocation(line: 422, column: 8, scope: !606)
!606 = distinct !DILexicalBlock(scope: !595, file: !71, line: 422, column: 8)
!607 = !DILocation(line: 422, column: 8, scope: !595)
!608 = !DILocalVariable(name: "i", scope: !609, file: !71, line: 425, type: !76)
!609 = distinct !DILexicalBlock(scope: !610, file: !71, line: 424, column: 9)
!610 = distinct !DILexicalBlock(scope: !606, file: !71, line: 423, column: 5)
!611 = !DILocation(line: 425, column: 17, scope: !609)
!612 = !DILocalVariable(name: "buffer", scope: !609, file: !71, line: 426, type: !198)
!613 = !DILocation(line: 426, column: 17, scope: !609)
!614 = !DILocation(line: 429, column: 17, scope: !615)
!615 = distinct !DILexicalBlock(scope: !609, file: !71, line: 429, column: 17)
!616 = !DILocation(line: 429, column: 22, scope: !615)
!617 = !DILocation(line: 429, column: 17, scope: !609)
!618 = !DILocation(line: 431, column: 24, scope: !619)
!619 = distinct !DILexicalBlock(scope: !615, file: !71, line: 430, column: 13)
!620 = !DILocation(line: 431, column: 17, scope: !619)
!621 = !DILocation(line: 431, column: 30, scope: !619)
!622 = !DILocation(line: 433, column: 23, scope: !623)
!623 = distinct !DILexicalBlock(scope: !619, file: !71, line: 433, column: 17)
!624 = !DILocation(line: 433, column: 21, scope: !623)
!625 = !DILocation(line: 433, column: 28, scope: !626)
!626 = distinct !DILexicalBlock(scope: !623, file: !71, line: 433, column: 17)
!627 = !DILocation(line: 433, column: 30, scope: !626)
!628 = !DILocation(line: 433, column: 17, scope: !623)
!629 = !DILocation(line: 435, column: 41, scope: !630)
!630 = distinct !DILexicalBlock(scope: !626, file: !71, line: 434, column: 17)
!631 = !DILocation(line: 435, column: 34, scope: !630)
!632 = !DILocation(line: 435, column: 21, scope: !630)
!633 = !DILocation(line: 436, column: 17, scope: !630)
!634 = !DILocation(line: 433, column: 37, scope: !626)
!635 = !DILocation(line: 433, column: 17, scope: !626)
!636 = distinct !{!636, !628, !637, !226}
!637 = !DILocation(line: 436, column: 17, scope: !623)
!638 = !DILocation(line: 437, column: 13, scope: !619)
!639 = !DILocation(line: 440, column: 17, scope: !640)
!640 = distinct !DILexicalBlock(scope: !615, file: !71, line: 439, column: 13)
!641 = !DILocation(line: 443, column: 5, scope: !610)
!642 = !DILocation(line: 444, column: 1, scope: !595)
