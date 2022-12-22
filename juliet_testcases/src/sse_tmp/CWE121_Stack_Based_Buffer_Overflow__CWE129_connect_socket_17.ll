; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_17_bad() #0 !dbg !65 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i26 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %j, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 -1, i32* %data, align 4, !dbg !77
  store i32 0, i32* %i, align 4, !dbg !78
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !81
  %cmp = icmp slt i32 %0, 1, !dbg !83
  br i1 %cmp, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !85, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !89, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 -1, i32* %connectSocket, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  br label %do.body, !dbg !116

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !117
  store i32 %call, i32* %connectSocket, align 4, !dbg !119
  %1 = load i32, i32* %connectSocket, align 4, !dbg !120
  %cmp1 = icmp eq i32 %1, -1, !dbg !122
  br i1 %cmp1, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !124

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !126
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !127
  store i16 2, i16* %sin_family, align 4, !dbg !128
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !129
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !130
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !131
  store i32 %call2, i32* %s_addr, align 4, !dbg !132
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !133
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !134
  store i16 %call3, i16* %sin_port, align 2, !dbg !135
  %3 = load i32, i32* %connectSocket, align 4, !dbg !136
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !138
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !139
  %cmp5 = icmp eq i32 %call4, -1, !dbg !140
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !141

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !142

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !144
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !145
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !146
  %conv = trunc i64 %call8 to i32, !dbg !146
  store i32 %conv, i32* %recvResult, align 4, !dbg !147
  %6 = load i32, i32* %recvResult, align 4, !dbg !148
  %cmp9 = icmp eq i32 %6, -1, !dbg !150
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !151

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !152
  %cmp11 = icmp eq i32 %7, 0, !dbg !153
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !154

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !155

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !157
  %idxprom = sext i32 %8 to i64, !dbg !158
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !158
  store i8 0, i8* %arrayidx, align 1, !dbg !159
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !160
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !161
  store i32 %call16, i32* %data, align 4, !dbg !162
  br label %do.end, !dbg !163

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %9 = load i32, i32* %connectSocket, align 4, !dbg !164
  %cmp17 = icmp ne i32 %9, -1, !dbg !166
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !167

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !168
  %call20 = call i32 @close(i32 %10), !dbg !170
  br label %if.end21, !dbg !171

if.end21:                                         ; preds = %if.then19, %do.end
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %if.end21
  %11 = load i32, i32* %i, align 4, !dbg !173
  %inc = add nsw i32 %11, 1, !dbg !173
  store i32 %inc, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !178
  br label %for.cond22, !dbg !180

for.cond22:                                       ; preds = %for.inc42, %for.end
  %12 = load i32, i32* %j, align 4, !dbg !181
  %cmp23 = icmp slt i32 %12, 1, !dbg !183
  br i1 %cmp23, label %for.body25, label %for.end44, !dbg !184

for.body25:                                       ; preds = %for.cond22
  call void @llvm.dbg.declare(metadata i32* %i26, metadata !185, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !189, metadata !DIExpression()), !dbg !193
  %13 = bitcast [10 x i32]* %buffer to i8*, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* align 16 %13, i8 0, i64 40, i1 false), !dbg !193
  %14 = load i32, i32* %data, align 4, !dbg !194
  %cmp27 = icmp sge i32 %14, 0, !dbg !196
  br i1 %cmp27, label %if.then29, label %if.else, !dbg !197

if.then29:                                        ; preds = %for.body25
  %15 = load i32, i32* %data, align 4, !dbg !198
  %idxprom30 = sext i32 %15 to i64, !dbg !200
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !200
  store i32 1, i32* %arrayidx31, align 4, !dbg !201
  store i32 0, i32* %i26, align 4, !dbg !202
  br label %for.cond32, !dbg !204

for.cond32:                                       ; preds = %for.inc38, %if.then29
  %16 = load i32, i32* %i26, align 4, !dbg !205
  %cmp33 = icmp slt i32 %16, 10, !dbg !207
  br i1 %cmp33, label %for.body35, label %for.end40, !dbg !208

for.body35:                                       ; preds = %for.cond32
  %17 = load i32, i32* %i26, align 4, !dbg !209
  %idxprom36 = sext i32 %17 to i64, !dbg !211
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !211
  %18 = load i32, i32* %arrayidx37, align 4, !dbg !211
  call void @printIntLine(i32 %18), !dbg !212
  br label %for.inc38, !dbg !213

for.inc38:                                        ; preds = %for.body35
  %19 = load i32, i32* %i26, align 4, !dbg !214
  %inc39 = add nsw i32 %19, 1, !dbg !214
  store i32 %inc39, i32* %i26, align 4, !dbg !214
  br label %for.cond32, !dbg !215, !llvm.loop !216

for.end40:                                        ; preds = %for.cond32
  br label %if.end41, !dbg !218

if.else:                                          ; preds = %for.body25
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !219
  br label %if.end41

if.end41:                                         ; preds = %if.else, %for.end40
  br label %for.inc42, !dbg !221

for.inc42:                                        ; preds = %if.end41
  %20 = load i32, i32* %j, align 4, !dbg !222
  %inc43 = add nsw i32 %20, 1, !dbg !222
  store i32 %inc43, i32* %j, align 4, !dbg !222
  br label %for.cond22, !dbg !223, !llvm.loop !224

for.end44:                                        ; preds = %for.cond22
  ret void, !dbg !226
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_17_good() #0 !dbg !227 {
entry:
  call void @goodB2G(), !dbg !228
  call void @goodG2B(), !dbg !229
  ret void, !dbg !230
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !231 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !236, metadata !DIExpression()), !dbg !237
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !238, metadata !DIExpression()), !dbg !239
  %call = call i64 @time(i64* null) #7, !dbg !240
  %conv = trunc i64 %call to i32, !dbg !241
  call void @srand(i32 %conv) #7, !dbg !242
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !243
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_17_good(), !dbg !244
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !245
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !246
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_17_bad(), !dbg !247
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !248
  ret i32 0, !dbg !249
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !250 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i26 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !251, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata i32* %k, metadata !253, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata i32* %data, metadata !255, metadata !DIExpression()), !dbg !256
  store i32 -1, i32* %data, align 4, !dbg !257
  store i32 0, i32* %i, align 4, !dbg !258
  br label %for.cond, !dbg !260

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !261
  %cmp = icmp slt i32 %0, 1, !dbg !263
  br i1 %cmp, label %for.body, label %for.end, !dbg !264

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !265, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !269, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !271, metadata !DIExpression()), !dbg !272
  store i32 -1, i32* %connectSocket, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !273, metadata !DIExpression()), !dbg !274
  br label %do.body, !dbg !275

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !276
  store i32 %call, i32* %connectSocket, align 4, !dbg !278
  %1 = load i32, i32* %connectSocket, align 4, !dbg !279
  %cmp1 = icmp eq i32 %1, -1, !dbg !281
  br i1 %cmp1, label %if.then, label %if.end, !dbg !282

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !283

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !285
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !285
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !286
  store i16 2, i16* %sin_family, align 4, !dbg !287
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !288
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !289
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !290
  store i32 %call2, i32* %s_addr, align 4, !dbg !291
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !292
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !293
  store i16 %call3, i16* %sin_port, align 2, !dbg !294
  %3 = load i32, i32* %connectSocket, align 4, !dbg !295
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !297
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !298
  %cmp5 = icmp eq i32 %call4, -1, !dbg !299
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !300

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !301

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !303
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !304
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !305
  %conv = trunc i64 %call8 to i32, !dbg !305
  store i32 %conv, i32* %recvResult, align 4, !dbg !306
  %6 = load i32, i32* %recvResult, align 4, !dbg !307
  %cmp9 = icmp eq i32 %6, -1, !dbg !309
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !310

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !311
  %cmp11 = icmp eq i32 %7, 0, !dbg !312
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !313

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !314

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !316
  %idxprom = sext i32 %8 to i64, !dbg !317
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !317
  store i8 0, i8* %arrayidx, align 1, !dbg !318
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !319
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !320
  store i32 %call16, i32* %data, align 4, !dbg !321
  br label %do.end, !dbg !322

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %9 = load i32, i32* %connectSocket, align 4, !dbg !323
  %cmp17 = icmp ne i32 %9, -1, !dbg !325
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !326

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !327
  %call20 = call i32 @close(i32 %10), !dbg !329
  br label %if.end21, !dbg !330

if.end21:                                         ; preds = %if.then19, %do.end
  br label %for.inc, !dbg !331

for.inc:                                          ; preds = %if.end21
  %11 = load i32, i32* %i, align 4, !dbg !332
  %inc = add nsw i32 %11, 1, !dbg !332
  store i32 %inc, i32* %i, align 4, !dbg !332
  br label %for.cond, !dbg !333, !llvm.loop !334

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !336
  br label %for.cond22, !dbg !338

for.cond22:                                       ; preds = %for.inc44, %for.end
  %12 = load i32, i32* %k, align 4, !dbg !339
  %cmp23 = icmp slt i32 %12, 1, !dbg !341
  br i1 %cmp23, label %for.body25, label %for.end46, !dbg !342

for.body25:                                       ; preds = %for.cond22
  call void @llvm.dbg.declare(metadata i32* %i26, metadata !343, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !347, metadata !DIExpression()), !dbg !348
  %13 = bitcast [10 x i32]* %buffer to i8*, !dbg !348
  call void @llvm.memset.p0i8.i64(i8* align 16 %13, i8 0, i64 40, i1 false), !dbg !348
  %14 = load i32, i32* %data, align 4, !dbg !349
  %cmp27 = icmp sge i32 %14, 0, !dbg !351
  br i1 %cmp27, label %land.lhs.true, label %if.else, !dbg !352

land.lhs.true:                                    ; preds = %for.body25
  %15 = load i32, i32* %data, align 4, !dbg !353
  %cmp29 = icmp slt i32 %15, 10, !dbg !354
  br i1 %cmp29, label %if.then31, label %if.else, !dbg !355

if.then31:                                        ; preds = %land.lhs.true
  %16 = load i32, i32* %data, align 4, !dbg !356
  %idxprom32 = sext i32 %16 to i64, !dbg !358
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !358
  store i32 1, i32* %arrayidx33, align 4, !dbg !359
  store i32 0, i32* %i26, align 4, !dbg !360
  br label %for.cond34, !dbg !362

for.cond34:                                       ; preds = %for.inc40, %if.then31
  %17 = load i32, i32* %i26, align 4, !dbg !363
  %cmp35 = icmp slt i32 %17, 10, !dbg !365
  br i1 %cmp35, label %for.body37, label %for.end42, !dbg !366

for.body37:                                       ; preds = %for.cond34
  %18 = load i32, i32* %i26, align 4, !dbg !367
  %idxprom38 = sext i32 %18 to i64, !dbg !369
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !369
  %19 = load i32, i32* %arrayidx39, align 4, !dbg !369
  call void @printIntLine(i32 %19), !dbg !370
  br label %for.inc40, !dbg !371

for.inc40:                                        ; preds = %for.body37
  %20 = load i32, i32* %i26, align 4, !dbg !372
  %inc41 = add nsw i32 %20, 1, !dbg !372
  store i32 %inc41, i32* %i26, align 4, !dbg !372
  br label %for.cond34, !dbg !373, !llvm.loop !374

for.end42:                                        ; preds = %for.cond34
  br label %if.end43, !dbg !376

if.else:                                          ; preds = %land.lhs.true, %for.body25
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !377
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end42
  br label %for.inc44, !dbg !379

for.inc44:                                        ; preds = %if.end43
  %21 = load i32, i32* %k, align 4, !dbg !380
  %inc45 = add nsw i32 %21, 1, !dbg !380
  store i32 %inc45, i32* %k, align 4, !dbg !380
  br label %for.cond22, !dbg !381, !llvm.loop !382

for.end46:                                        ; preds = %for.cond22
  ret void, !dbg !384
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !385 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !386, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.declare(metadata i32* %j, metadata !388, metadata !DIExpression()), !dbg !389
  call void @llvm.dbg.declare(metadata i32* %data, metadata !390, metadata !DIExpression()), !dbg !391
  store i32 -1, i32* %data, align 4, !dbg !392
  store i32 0, i32* %h, align 4, !dbg !393
  br label %for.cond, !dbg !395

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !396
  %cmp = icmp slt i32 %0, 1, !dbg !398
  br i1 %cmp, label %for.body, label %for.end, !dbg !399

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !400
  br label %for.inc, !dbg !402

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !403
  %inc = add nsw i32 %1, 1, !dbg !403
  store i32 %inc, i32* %h, align 4, !dbg !403
  br label %for.cond, !dbg !404, !llvm.loop !405

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !407
  br label %for.cond1, !dbg !409

for.cond1:                                        ; preds = %for.inc13, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !410
  %cmp2 = icmp slt i32 %2, 1, !dbg !412
  br i1 %cmp2, label %for.body3, label %for.end15, !dbg !413

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !414, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !418, metadata !DIExpression()), !dbg !419
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !419
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !419
  %4 = load i32, i32* %data, align 4, !dbg !420
  %cmp4 = icmp sge i32 %4, 0, !dbg !422
  br i1 %cmp4, label %if.then, label %if.else, !dbg !423

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !424
  %idxprom = sext i32 %5 to i64, !dbg !426
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !426
  store i32 1, i32* %arrayidx, align 4, !dbg !427
  store i32 0, i32* %i, align 4, !dbg !428
  br label %for.cond5, !dbg !430

for.cond5:                                        ; preds = %for.inc10, %if.then
  %6 = load i32, i32* %i, align 4, !dbg !431
  %cmp6 = icmp slt i32 %6, 10, !dbg !433
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !434

for.body7:                                        ; preds = %for.cond5
  %7 = load i32, i32* %i, align 4, !dbg !435
  %idxprom8 = sext i32 %7 to i64, !dbg !437
  %arrayidx9 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !437
  %8 = load i32, i32* %arrayidx9, align 4, !dbg !437
  call void @printIntLine(i32 %8), !dbg !438
  br label %for.inc10, !dbg !439

for.inc10:                                        ; preds = %for.body7
  %9 = load i32, i32* %i, align 4, !dbg !440
  %inc11 = add nsw i32 %9, 1, !dbg !440
  store i32 %inc11, i32* %i, align 4, !dbg !440
  br label %for.cond5, !dbg !441, !llvm.loop !442

for.end12:                                        ; preds = %for.cond5
  br label %if.end, !dbg !444

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !445
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end12
  br label %for.inc13, !dbg !447

for.inc13:                                        ; preds = %if.end
  %10 = load i32, i32* %j, align 4, !dbg !448
  %inc14 = add nsw i32 %10, 1, !dbg !448
  store i32 %inc14, i32* %j, align 4, !dbg !448
  br label %for.cond1, !dbg !449, !llvm.loop !450

for.end15:                                        ; preds = %for.cond1
  ret void, !dbg !452
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_17.c", directory: "/root/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_17_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_17.c", directory: "/root/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "i", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocalVariable(name: "j", scope: !65, file: !66, line: 46, type: !71)
!74 = !DILocation(line: 46, column: 11, scope: !65)
!75 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 47, type: !71)
!76 = !DILocation(line: 47, column: 9, scope: !65)
!77 = !DILocation(line: 49, column: 10, scope: !65)
!78 = !DILocation(line: 50, column: 11, scope: !79)
!79 = distinct !DILexicalBlock(scope: !65, file: !66, line: 50, column: 5)
!80 = !DILocation(line: 50, column: 9, scope: !79)
!81 = !DILocation(line: 50, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !66, line: 50, column: 5)
!83 = !DILocation(line: 50, column: 18, scope: !82)
!84 = !DILocation(line: 50, column: 5, scope: !79)
!85 = !DILocalVariable(name: "recvResult", scope: !86, file: !66, line: 57, type: !71)
!86 = distinct !DILexicalBlock(scope: !87, file: !66, line: 52, column: 9)
!87 = distinct !DILexicalBlock(scope: !82, file: !66, line: 51, column: 5)
!88 = !DILocation(line: 57, column: 17, scope: !86)
!89 = !DILocalVariable(name: "service", scope: !86, file: !66, line: 58, type: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !91)
!91 = !{!92, !93, !99, !106}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !90, file: !17, line: 239, baseType: !51, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !90, file: !17, line: 240, baseType: !94, size: 16, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !96, line: 25, baseType: !97)
!96 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !98, line: 39, baseType: !53)
!98 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !90, file: !17, line: 241, baseType: !100, size: 32, offset: 32)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !101)
!101 = !{!102}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !100, file: !17, line: 33, baseType: !103, size: 32)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !96, line: 26, baseType: !105)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !98, line: 41, baseType: !5)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !90, file: !17, line: 244, baseType: !107, size: 64, offset: 64)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !108, size: 64, elements: !109)
!108 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!109 = !{!110}
!110 = !DISubrange(count: 8)
!111 = !DILocation(line: 58, column: 32, scope: !86)
!112 = !DILocalVariable(name: "connectSocket", scope: !86, file: !66, line: 59, type: !71)
!113 = !DILocation(line: 59, column: 20, scope: !86)
!114 = !DILocalVariable(name: "inputBuffer", scope: !86, file: !66, line: 60, type: !55)
!115 = !DILocation(line: 60, column: 18, scope: !86)
!116 = !DILocation(line: 61, column: 13, scope: !86)
!117 = !DILocation(line: 71, column: 33, scope: !118)
!118 = distinct !DILexicalBlock(scope: !86, file: !66, line: 62, column: 13)
!119 = !DILocation(line: 71, column: 31, scope: !118)
!120 = !DILocation(line: 72, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !66, line: 72, column: 21)
!122 = !DILocation(line: 72, column: 35, scope: !121)
!123 = !DILocation(line: 72, column: 21, scope: !118)
!124 = !DILocation(line: 74, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !66, line: 73, column: 17)
!126 = !DILocation(line: 76, column: 17, scope: !118)
!127 = !DILocation(line: 77, column: 25, scope: !118)
!128 = !DILocation(line: 77, column: 36, scope: !118)
!129 = !DILocation(line: 78, column: 43, scope: !118)
!130 = !DILocation(line: 78, column: 25, scope: !118)
!131 = !DILocation(line: 78, column: 34, scope: !118)
!132 = !DILocation(line: 78, column: 41, scope: !118)
!133 = !DILocation(line: 79, column: 36, scope: !118)
!134 = !DILocation(line: 79, column: 25, scope: !118)
!135 = !DILocation(line: 79, column: 34, scope: !118)
!136 = !DILocation(line: 80, column: 29, scope: !137)
!137 = distinct !DILexicalBlock(scope: !118, file: !66, line: 80, column: 21)
!138 = !DILocation(line: 80, column: 44, scope: !137)
!139 = !DILocation(line: 80, column: 21, scope: !137)
!140 = !DILocation(line: 80, column: 89, scope: !137)
!141 = !DILocation(line: 80, column: 21, scope: !118)
!142 = !DILocation(line: 82, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !66, line: 81, column: 17)
!144 = !DILocation(line: 86, column: 35, scope: !118)
!145 = !DILocation(line: 86, column: 50, scope: !118)
!146 = !DILocation(line: 86, column: 30, scope: !118)
!147 = !DILocation(line: 86, column: 28, scope: !118)
!148 = !DILocation(line: 87, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !118, file: !66, line: 87, column: 21)
!150 = !DILocation(line: 87, column: 32, scope: !149)
!151 = !DILocation(line: 87, column: 48, scope: !149)
!152 = !DILocation(line: 87, column: 51, scope: !149)
!153 = !DILocation(line: 87, column: 62, scope: !149)
!154 = !DILocation(line: 87, column: 21, scope: !118)
!155 = !DILocation(line: 89, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !149, file: !66, line: 88, column: 17)
!157 = !DILocation(line: 92, column: 29, scope: !118)
!158 = !DILocation(line: 92, column: 17, scope: !118)
!159 = !DILocation(line: 92, column: 41, scope: !118)
!160 = !DILocation(line: 94, column: 29, scope: !118)
!161 = !DILocation(line: 94, column: 24, scope: !118)
!162 = !DILocation(line: 94, column: 22, scope: !118)
!163 = !DILocation(line: 95, column: 13, scope: !118)
!164 = !DILocation(line: 97, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !86, file: !66, line: 97, column: 17)
!166 = !DILocation(line: 97, column: 31, scope: !165)
!167 = !DILocation(line: 97, column: 17, scope: !86)
!168 = !DILocation(line: 99, column: 30, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !66, line: 98, column: 13)
!170 = !DILocation(line: 99, column: 17, scope: !169)
!171 = !DILocation(line: 100, column: 13, scope: !169)
!172 = !DILocation(line: 108, column: 5, scope: !87)
!173 = !DILocation(line: 50, column: 24, scope: !82)
!174 = !DILocation(line: 50, column: 5, scope: !82)
!175 = distinct !{!175, !84, !176, !177}
!176 = !DILocation(line: 108, column: 5, scope: !79)
!177 = !{!"llvm.loop.mustprogress"}
!178 = !DILocation(line: 109, column: 11, scope: !179)
!179 = distinct !DILexicalBlock(scope: !65, file: !66, line: 109, column: 5)
!180 = !DILocation(line: 109, column: 9, scope: !179)
!181 = !DILocation(line: 109, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !66, line: 109, column: 5)
!183 = !DILocation(line: 109, column: 18, scope: !182)
!184 = !DILocation(line: 109, column: 5, scope: !179)
!185 = !DILocalVariable(name: "i", scope: !186, file: !66, line: 112, type: !71)
!186 = distinct !DILexicalBlock(scope: !187, file: !66, line: 111, column: 9)
!187 = distinct !DILexicalBlock(scope: !182, file: !66, line: 110, column: 5)
!188 = !DILocation(line: 112, column: 17, scope: !186)
!189 = !DILocalVariable(name: "buffer", scope: !186, file: !66, line: 113, type: !190)
!190 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !191)
!191 = !{!192}
!192 = !DISubrange(count: 10)
!193 = !DILocation(line: 113, column: 17, scope: !186)
!194 = !DILocation(line: 116, column: 17, scope: !195)
!195 = distinct !DILexicalBlock(scope: !186, file: !66, line: 116, column: 17)
!196 = !DILocation(line: 116, column: 22, scope: !195)
!197 = !DILocation(line: 116, column: 17, scope: !186)
!198 = !DILocation(line: 118, column: 24, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !66, line: 117, column: 13)
!200 = !DILocation(line: 118, column: 17, scope: !199)
!201 = !DILocation(line: 118, column: 30, scope: !199)
!202 = !DILocation(line: 120, column: 23, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !66, line: 120, column: 17)
!204 = !DILocation(line: 120, column: 21, scope: !203)
!205 = !DILocation(line: 120, column: 28, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !66, line: 120, column: 17)
!207 = !DILocation(line: 120, column: 30, scope: !206)
!208 = !DILocation(line: 120, column: 17, scope: !203)
!209 = !DILocation(line: 122, column: 41, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !66, line: 121, column: 17)
!211 = !DILocation(line: 122, column: 34, scope: !210)
!212 = !DILocation(line: 122, column: 21, scope: !210)
!213 = !DILocation(line: 123, column: 17, scope: !210)
!214 = !DILocation(line: 120, column: 37, scope: !206)
!215 = !DILocation(line: 120, column: 17, scope: !206)
!216 = distinct !{!216, !208, !217, !177}
!217 = !DILocation(line: 123, column: 17, scope: !203)
!218 = !DILocation(line: 124, column: 13, scope: !199)
!219 = !DILocation(line: 127, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !195, file: !66, line: 126, column: 13)
!221 = !DILocation(line: 130, column: 5, scope: !187)
!222 = !DILocation(line: 109, column: 24, scope: !182)
!223 = !DILocation(line: 109, column: 5, scope: !182)
!224 = distinct !{!224, !184, !225, !177}
!225 = !DILocation(line: 130, column: 5, scope: !179)
!226 = !DILocation(line: 131, column: 1, scope: !65)
!227 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_17_good", scope: !66, file: !66, line: 263, type: !67, scopeLine: 264, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!228 = !DILocation(line: 265, column: 5, scope: !227)
!229 = !DILocation(line: 266, column: 5, scope: !227)
!230 = !DILocation(line: 267, column: 1, scope: !227)
!231 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 278, type: !232, scopeLine: 279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!232 = !DISubroutineType(types: !233)
!233 = !{!71, !71, !234}
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!236 = !DILocalVariable(name: "argc", arg: 1, scope: !231, file: !66, line: 278, type: !71)
!237 = !DILocation(line: 278, column: 14, scope: !231)
!238 = !DILocalVariable(name: "argv", arg: 2, scope: !231, file: !66, line: 278, type: !234)
!239 = !DILocation(line: 278, column: 27, scope: !231)
!240 = !DILocation(line: 281, column: 22, scope: !231)
!241 = !DILocation(line: 281, column: 12, scope: !231)
!242 = !DILocation(line: 281, column: 5, scope: !231)
!243 = !DILocation(line: 283, column: 5, scope: !231)
!244 = !DILocation(line: 284, column: 5, scope: !231)
!245 = !DILocation(line: 285, column: 5, scope: !231)
!246 = !DILocation(line: 288, column: 5, scope: !231)
!247 = !DILocation(line: 289, column: 5, scope: !231)
!248 = !DILocation(line: 290, column: 5, scope: !231)
!249 = !DILocation(line: 292, column: 5, scope: !231)
!250 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 138, type: !67, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!251 = !DILocalVariable(name: "i", scope: !250, file: !66, line: 140, type: !71)
!252 = !DILocation(line: 140, column: 9, scope: !250)
!253 = !DILocalVariable(name: "k", scope: !250, file: !66, line: 140, type: !71)
!254 = !DILocation(line: 140, column: 11, scope: !250)
!255 = !DILocalVariable(name: "data", scope: !250, file: !66, line: 141, type: !71)
!256 = !DILocation(line: 141, column: 9, scope: !250)
!257 = !DILocation(line: 143, column: 10, scope: !250)
!258 = !DILocation(line: 144, column: 11, scope: !259)
!259 = distinct !DILexicalBlock(scope: !250, file: !66, line: 144, column: 5)
!260 = !DILocation(line: 144, column: 9, scope: !259)
!261 = !DILocation(line: 144, column: 16, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !66, line: 144, column: 5)
!263 = !DILocation(line: 144, column: 18, scope: !262)
!264 = !DILocation(line: 144, column: 5, scope: !259)
!265 = !DILocalVariable(name: "recvResult", scope: !266, file: !66, line: 151, type: !71)
!266 = distinct !DILexicalBlock(scope: !267, file: !66, line: 146, column: 9)
!267 = distinct !DILexicalBlock(scope: !262, file: !66, line: 145, column: 5)
!268 = !DILocation(line: 151, column: 17, scope: !266)
!269 = !DILocalVariable(name: "service", scope: !266, file: !66, line: 152, type: !90)
!270 = !DILocation(line: 152, column: 32, scope: !266)
!271 = !DILocalVariable(name: "connectSocket", scope: !266, file: !66, line: 153, type: !71)
!272 = !DILocation(line: 153, column: 20, scope: !266)
!273 = !DILocalVariable(name: "inputBuffer", scope: !266, file: !66, line: 154, type: !55)
!274 = !DILocation(line: 154, column: 18, scope: !266)
!275 = !DILocation(line: 155, column: 13, scope: !266)
!276 = !DILocation(line: 165, column: 33, scope: !277)
!277 = distinct !DILexicalBlock(scope: !266, file: !66, line: 156, column: 13)
!278 = !DILocation(line: 165, column: 31, scope: !277)
!279 = !DILocation(line: 166, column: 21, scope: !280)
!280 = distinct !DILexicalBlock(scope: !277, file: !66, line: 166, column: 21)
!281 = !DILocation(line: 166, column: 35, scope: !280)
!282 = !DILocation(line: 166, column: 21, scope: !277)
!283 = !DILocation(line: 168, column: 21, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !66, line: 167, column: 17)
!285 = !DILocation(line: 170, column: 17, scope: !277)
!286 = !DILocation(line: 171, column: 25, scope: !277)
!287 = !DILocation(line: 171, column: 36, scope: !277)
!288 = !DILocation(line: 172, column: 43, scope: !277)
!289 = !DILocation(line: 172, column: 25, scope: !277)
!290 = !DILocation(line: 172, column: 34, scope: !277)
!291 = !DILocation(line: 172, column: 41, scope: !277)
!292 = !DILocation(line: 173, column: 36, scope: !277)
!293 = !DILocation(line: 173, column: 25, scope: !277)
!294 = !DILocation(line: 173, column: 34, scope: !277)
!295 = !DILocation(line: 174, column: 29, scope: !296)
!296 = distinct !DILexicalBlock(scope: !277, file: !66, line: 174, column: 21)
!297 = !DILocation(line: 174, column: 44, scope: !296)
!298 = !DILocation(line: 174, column: 21, scope: !296)
!299 = !DILocation(line: 174, column: 89, scope: !296)
!300 = !DILocation(line: 174, column: 21, scope: !277)
!301 = !DILocation(line: 176, column: 21, scope: !302)
!302 = distinct !DILexicalBlock(scope: !296, file: !66, line: 175, column: 17)
!303 = !DILocation(line: 180, column: 35, scope: !277)
!304 = !DILocation(line: 180, column: 50, scope: !277)
!305 = !DILocation(line: 180, column: 30, scope: !277)
!306 = !DILocation(line: 180, column: 28, scope: !277)
!307 = !DILocation(line: 181, column: 21, scope: !308)
!308 = distinct !DILexicalBlock(scope: !277, file: !66, line: 181, column: 21)
!309 = !DILocation(line: 181, column: 32, scope: !308)
!310 = !DILocation(line: 181, column: 48, scope: !308)
!311 = !DILocation(line: 181, column: 51, scope: !308)
!312 = !DILocation(line: 181, column: 62, scope: !308)
!313 = !DILocation(line: 181, column: 21, scope: !277)
!314 = !DILocation(line: 183, column: 21, scope: !315)
!315 = distinct !DILexicalBlock(scope: !308, file: !66, line: 182, column: 17)
!316 = !DILocation(line: 186, column: 29, scope: !277)
!317 = !DILocation(line: 186, column: 17, scope: !277)
!318 = !DILocation(line: 186, column: 41, scope: !277)
!319 = !DILocation(line: 188, column: 29, scope: !277)
!320 = !DILocation(line: 188, column: 24, scope: !277)
!321 = !DILocation(line: 188, column: 22, scope: !277)
!322 = !DILocation(line: 189, column: 13, scope: !277)
!323 = !DILocation(line: 191, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !266, file: !66, line: 191, column: 17)
!325 = !DILocation(line: 191, column: 31, scope: !324)
!326 = !DILocation(line: 191, column: 17, scope: !266)
!327 = !DILocation(line: 193, column: 30, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !66, line: 192, column: 13)
!329 = !DILocation(line: 193, column: 17, scope: !328)
!330 = !DILocation(line: 194, column: 13, scope: !328)
!331 = !DILocation(line: 202, column: 5, scope: !267)
!332 = !DILocation(line: 144, column: 24, scope: !262)
!333 = !DILocation(line: 144, column: 5, scope: !262)
!334 = distinct !{!334, !264, !335, !177}
!335 = !DILocation(line: 202, column: 5, scope: !259)
!336 = !DILocation(line: 203, column: 11, scope: !337)
!337 = distinct !DILexicalBlock(scope: !250, file: !66, line: 203, column: 5)
!338 = !DILocation(line: 203, column: 9, scope: !337)
!339 = !DILocation(line: 203, column: 16, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !66, line: 203, column: 5)
!341 = !DILocation(line: 203, column: 18, scope: !340)
!342 = !DILocation(line: 203, column: 5, scope: !337)
!343 = !DILocalVariable(name: "i", scope: !344, file: !66, line: 206, type: !71)
!344 = distinct !DILexicalBlock(scope: !345, file: !66, line: 205, column: 9)
!345 = distinct !DILexicalBlock(scope: !340, file: !66, line: 204, column: 5)
!346 = !DILocation(line: 206, column: 17, scope: !344)
!347 = !DILocalVariable(name: "buffer", scope: !344, file: !66, line: 207, type: !190)
!348 = !DILocation(line: 207, column: 17, scope: !344)
!349 = !DILocation(line: 209, column: 17, scope: !350)
!350 = distinct !DILexicalBlock(scope: !344, file: !66, line: 209, column: 17)
!351 = !DILocation(line: 209, column: 22, scope: !350)
!352 = !DILocation(line: 209, column: 27, scope: !350)
!353 = !DILocation(line: 209, column: 30, scope: !350)
!354 = !DILocation(line: 209, column: 35, scope: !350)
!355 = !DILocation(line: 209, column: 17, scope: !344)
!356 = !DILocation(line: 211, column: 24, scope: !357)
!357 = distinct !DILexicalBlock(scope: !350, file: !66, line: 210, column: 13)
!358 = !DILocation(line: 211, column: 17, scope: !357)
!359 = !DILocation(line: 211, column: 30, scope: !357)
!360 = !DILocation(line: 213, column: 23, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !66, line: 213, column: 17)
!362 = !DILocation(line: 213, column: 21, scope: !361)
!363 = !DILocation(line: 213, column: 28, scope: !364)
!364 = distinct !DILexicalBlock(scope: !361, file: !66, line: 213, column: 17)
!365 = !DILocation(line: 213, column: 30, scope: !364)
!366 = !DILocation(line: 213, column: 17, scope: !361)
!367 = !DILocation(line: 215, column: 41, scope: !368)
!368 = distinct !DILexicalBlock(scope: !364, file: !66, line: 214, column: 17)
!369 = !DILocation(line: 215, column: 34, scope: !368)
!370 = !DILocation(line: 215, column: 21, scope: !368)
!371 = !DILocation(line: 216, column: 17, scope: !368)
!372 = !DILocation(line: 213, column: 37, scope: !364)
!373 = !DILocation(line: 213, column: 17, scope: !364)
!374 = distinct !{!374, !366, !375, !177}
!375 = !DILocation(line: 216, column: 17, scope: !361)
!376 = !DILocation(line: 217, column: 13, scope: !357)
!377 = !DILocation(line: 220, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !350, file: !66, line: 219, column: 13)
!379 = !DILocation(line: 223, column: 5, scope: !345)
!380 = !DILocation(line: 203, column: 24, scope: !340)
!381 = !DILocation(line: 203, column: 5, scope: !340)
!382 = distinct !{!382, !342, !383, !177}
!383 = !DILocation(line: 223, column: 5, scope: !337)
!384 = !DILocation(line: 224, column: 1, scope: !250)
!385 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 227, type: !67, scopeLine: 228, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!386 = !DILocalVariable(name: "h", scope: !385, file: !66, line: 229, type: !71)
!387 = !DILocation(line: 229, column: 9, scope: !385)
!388 = !DILocalVariable(name: "j", scope: !385, file: !66, line: 229, type: !71)
!389 = !DILocation(line: 229, column: 11, scope: !385)
!390 = !DILocalVariable(name: "data", scope: !385, file: !66, line: 230, type: !71)
!391 = !DILocation(line: 230, column: 9, scope: !385)
!392 = !DILocation(line: 232, column: 10, scope: !385)
!393 = !DILocation(line: 233, column: 11, scope: !394)
!394 = distinct !DILexicalBlock(scope: !385, file: !66, line: 233, column: 5)
!395 = !DILocation(line: 233, column: 9, scope: !394)
!396 = !DILocation(line: 233, column: 16, scope: !397)
!397 = distinct !DILexicalBlock(scope: !394, file: !66, line: 233, column: 5)
!398 = !DILocation(line: 233, column: 18, scope: !397)
!399 = !DILocation(line: 233, column: 5, scope: !394)
!400 = !DILocation(line: 237, column: 14, scope: !401)
!401 = distinct !DILexicalBlock(scope: !397, file: !66, line: 234, column: 5)
!402 = !DILocation(line: 238, column: 5, scope: !401)
!403 = !DILocation(line: 233, column: 24, scope: !397)
!404 = !DILocation(line: 233, column: 5, scope: !397)
!405 = distinct !{!405, !399, !406, !177}
!406 = !DILocation(line: 238, column: 5, scope: !394)
!407 = !DILocation(line: 239, column: 11, scope: !408)
!408 = distinct !DILexicalBlock(scope: !385, file: !66, line: 239, column: 5)
!409 = !DILocation(line: 239, column: 9, scope: !408)
!410 = !DILocation(line: 239, column: 16, scope: !411)
!411 = distinct !DILexicalBlock(scope: !408, file: !66, line: 239, column: 5)
!412 = !DILocation(line: 239, column: 18, scope: !411)
!413 = !DILocation(line: 239, column: 5, scope: !408)
!414 = !DILocalVariable(name: "i", scope: !415, file: !66, line: 242, type: !71)
!415 = distinct !DILexicalBlock(scope: !416, file: !66, line: 241, column: 9)
!416 = distinct !DILexicalBlock(scope: !411, file: !66, line: 240, column: 5)
!417 = !DILocation(line: 242, column: 17, scope: !415)
!418 = !DILocalVariable(name: "buffer", scope: !415, file: !66, line: 243, type: !190)
!419 = !DILocation(line: 243, column: 17, scope: !415)
!420 = !DILocation(line: 246, column: 17, scope: !421)
!421 = distinct !DILexicalBlock(scope: !415, file: !66, line: 246, column: 17)
!422 = !DILocation(line: 246, column: 22, scope: !421)
!423 = !DILocation(line: 246, column: 17, scope: !415)
!424 = !DILocation(line: 248, column: 24, scope: !425)
!425 = distinct !DILexicalBlock(scope: !421, file: !66, line: 247, column: 13)
!426 = !DILocation(line: 248, column: 17, scope: !425)
!427 = !DILocation(line: 248, column: 30, scope: !425)
!428 = !DILocation(line: 250, column: 23, scope: !429)
!429 = distinct !DILexicalBlock(scope: !425, file: !66, line: 250, column: 17)
!430 = !DILocation(line: 250, column: 21, scope: !429)
!431 = !DILocation(line: 250, column: 28, scope: !432)
!432 = distinct !DILexicalBlock(scope: !429, file: !66, line: 250, column: 17)
!433 = !DILocation(line: 250, column: 30, scope: !432)
!434 = !DILocation(line: 250, column: 17, scope: !429)
!435 = !DILocation(line: 252, column: 41, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !66, line: 251, column: 17)
!437 = !DILocation(line: 252, column: 34, scope: !436)
!438 = !DILocation(line: 252, column: 21, scope: !436)
!439 = !DILocation(line: 253, column: 17, scope: !436)
!440 = !DILocation(line: 250, column: 37, scope: !432)
!441 = !DILocation(line: 250, column: 17, scope: !432)
!442 = distinct !{!442, !434, !443, !177}
!443 = !DILocation(line: 253, column: 17, scope: !429)
!444 = !DILocation(line: 254, column: 13, scope: !425)
!445 = !DILocation(line: 257, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !421, file: !66, line: 256, column: 13)
!447 = !DILocation(line: 260, column: 5, scope: !416)
!448 = !DILocation(line: 239, column: 24, scope: !411)
!449 = !DILocation(line: 239, column: 5, scope: !411)
!450 = distinct !{!450, !413, !451, !177}
!451 = !DILocation(line: 260, column: 5, scope: !408)
!452 = !DILocation(line: 261, column: 1, scope: !385)
