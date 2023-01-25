; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_14.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_14_bad() #0 !dbg !70 {
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !79
  %cmp = icmp eq i32 %0, 5, !dbg !81
  br i1 %cmp, label %if.then, label %if.end35, !dbg !82

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !83, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !87, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %listenSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %acceptSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  br label %do.body, !dbg !111

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !112
  store i32 %call, i32* %listenSocket, align 4, !dbg !114
  %1 = load i32, i32* %listenSocket, align 4, !dbg !115
  %cmp1 = icmp eq i32 %1, -1, !dbg !117
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !118

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !119

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !121
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !122
  store i16 2, i16* %sin_family, align 4, !dbg !123
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !124
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !125
  store i32 0, i32* %s_addr, align 4, !dbg !126
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !127
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !128
  store i16 %call3, i16* %sin_port, align 2, !dbg !129
  %3 = load i32, i32* %listenSocket, align 4, !dbg !130
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !132
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !133
  %cmp5 = icmp eq i32 %call4, -1, !dbg !134
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !135

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !136

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !138
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !140
  %cmp9 = icmp eq i32 %call8, -1, !dbg !141
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !142

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !143

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !145
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !146
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !147
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !148
  %cmp13 = icmp eq i32 %7, -1, !dbg !150
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !151

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !152

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !154
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !156
  %conv = trunc i64 %call16 to i32, !dbg !156
  store i32 %conv, i32* %recvResult, align 4, !dbg !157
  %9 = load i32, i32* %recvResult, align 4, !dbg !158
  %cmp17 = icmp eq i32 %9, -1, !dbg !160
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !161

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !162
  %cmp19 = icmp eq i32 %10, 0, !dbg !163
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !164

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !165

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !167
  %idxprom = sext i32 %11 to i64, !dbg !168
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !170
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !171
  store i32 %call24, i32* %data, align 4, !dbg !172
  br label %do.end, !dbg !173

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !174
  %cmp25 = icmp ne i32 %12, -1, !dbg !176
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !177

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !178
  %call28 = call i32 @close(i32 %13), !dbg !180
  br label %if.end29, !dbg !181

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !182
  %cmp30 = icmp ne i32 %14, -1, !dbg !184
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !185

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !186
  %call33 = call i32 @close(i32 %15), !dbg !188
  br label %if.end34, !dbg !189

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !190

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !191
  %cmp36 = icmp eq i32 %16, 5, !dbg !193
  br i1 %cmp36, label %if.then38, label %if.end45, !dbg !194

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !195, metadata !DIExpression()), !dbg !201
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !201
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !201
  %18 = load i32, i32* %data, align 4, !dbg !202
  %cmp39 = icmp sge i32 %18, 0, !dbg !204
  br i1 %cmp39, label %if.then41, label %if.else, !dbg !205

if.then41:                                        ; preds = %if.then38
  %19 = load i32, i32* %data, align 4, !dbg !206
  %idxprom42 = sext i32 %19 to i64, !dbg !208
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !208
  %20 = load i32, i32* %arrayidx43, align 4, !dbg !208
  call void @printIntLine(i32 %20), !dbg !209
  br label %if.end44, !dbg !210

if.else:                                          ; preds = %if.then38
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !211
  br label %if.end44

if.end44:                                         ; preds = %if.else, %if.then41
  br label %if.end45, !dbg !213

if.end45:                                         ; preds = %if.end44, %if.end35
  ret void, !dbg !214
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_14_good() #0 !dbg !215 {
entry:
  call void @goodB2G1(), !dbg !216
  call void @goodB2G2(), !dbg !217
  call void @goodG2B1(), !dbg !218
  call void @goodG2B2(), !dbg !219
  ret void, !dbg !220
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !221 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !226, metadata !DIExpression()), !dbg !227
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !228, metadata !DIExpression()), !dbg !229
  %call = call i64 @time(i64* null) #7, !dbg !230
  %conv = trunc i64 %call to i32, !dbg !231
  call void @srand(i32 %conv) #7, !dbg !232
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !233
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_14_good(), !dbg !234
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !235
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !236
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_14_bad(), !dbg !237
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !238
  ret i32 0, !dbg !239
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !240 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !241, metadata !DIExpression()), !dbg !242
  store i32 -1, i32* %data, align 4, !dbg !243
  %0 = load i32, i32* @globalFive, align 4, !dbg !244
  %cmp = icmp eq i32 %0, 5, !dbg !246
  br i1 %cmp, label %if.then, label %if.end35, !dbg !247

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !248, metadata !DIExpression()), !dbg !251
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !252, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !254, metadata !DIExpression()), !dbg !255
  store i32 -1, i32* %listenSocket, align 4, !dbg !255
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !256, metadata !DIExpression()), !dbg !257
  store i32 -1, i32* %acceptSocket, align 4, !dbg !257
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !258, metadata !DIExpression()), !dbg !259
  br label %do.body, !dbg !260

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !261
  store i32 %call, i32* %listenSocket, align 4, !dbg !263
  %1 = load i32, i32* %listenSocket, align 4, !dbg !264
  %cmp1 = icmp eq i32 %1, -1, !dbg !266
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !267

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !268

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !270
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !270
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !271
  store i16 2, i16* %sin_family, align 4, !dbg !272
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !273
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !274
  store i32 0, i32* %s_addr, align 4, !dbg !275
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !276
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !277
  store i16 %call3, i16* %sin_port, align 2, !dbg !278
  %3 = load i32, i32* %listenSocket, align 4, !dbg !279
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !281
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !282
  %cmp5 = icmp eq i32 %call4, -1, !dbg !283
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !284

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !285

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !287
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !289
  %cmp9 = icmp eq i32 %call8, -1, !dbg !290
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !291

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !292

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !294
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !295
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !296
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !297
  %cmp13 = icmp eq i32 %7, -1, !dbg !299
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !300

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !301

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !303
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !304
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !305
  %conv = trunc i64 %call16 to i32, !dbg !305
  store i32 %conv, i32* %recvResult, align 4, !dbg !306
  %9 = load i32, i32* %recvResult, align 4, !dbg !307
  %cmp17 = icmp eq i32 %9, -1, !dbg !309
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !310

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !311
  %cmp19 = icmp eq i32 %10, 0, !dbg !312
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !313

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !314

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !316
  %idxprom = sext i32 %11 to i64, !dbg !317
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !317
  store i8 0, i8* %arrayidx, align 1, !dbg !318
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !319
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !320
  store i32 %call24, i32* %data, align 4, !dbg !321
  br label %do.end, !dbg !322

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !323
  %cmp25 = icmp ne i32 %12, -1, !dbg !325
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !326

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !327
  %call28 = call i32 @close(i32 %13), !dbg !329
  br label %if.end29, !dbg !330

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !331
  %cmp30 = icmp ne i32 %14, -1, !dbg !333
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !334

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !335
  %call33 = call i32 @close(i32 %15), !dbg !337
  br label %if.end34, !dbg !338

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !339

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !340
  %cmp36 = icmp ne i32 %16, 5, !dbg !342
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !343

if.then38:                                        ; preds = %if.end35
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !344
  br label %if.end48, !dbg !346

if.else:                                          ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !347, metadata !DIExpression()), !dbg !350
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !350
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !350
  %18 = load i32, i32* %data, align 4, !dbg !351
  %cmp39 = icmp sge i32 %18, 0, !dbg !353
  br i1 %cmp39, label %land.lhs.true, label %if.else46, !dbg !354

land.lhs.true:                                    ; preds = %if.else
  %19 = load i32, i32* %data, align 4, !dbg !355
  %cmp41 = icmp slt i32 %19, 10, !dbg !356
  br i1 %cmp41, label %if.then43, label %if.else46, !dbg !357

if.then43:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !358
  %idxprom44 = sext i32 %20 to i64, !dbg !360
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !360
  %21 = load i32, i32* %arrayidx45, align 4, !dbg !360
  call void @printIntLine(i32 %21), !dbg !361
  br label %if.end47, !dbg !362

if.else46:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !363
  br label %if.end47

if.end47:                                         ; preds = %if.else46, %if.then43
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.then38
  ret void, !dbg !365
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !366 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !367, metadata !DIExpression()), !dbg !368
  store i32 -1, i32* %data, align 4, !dbg !369
  %0 = load i32, i32* @globalFive, align 4, !dbg !370
  %cmp = icmp eq i32 %0, 5, !dbg !372
  br i1 %cmp, label %if.then, label %if.end35, !dbg !373

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
  %cmp1 = icmp eq i32 %1, -1, !dbg !392
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !393

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !394

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !396
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !396
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !397
  store i16 2, i16* %sin_family, align 4, !dbg !398
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !399
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !400
  store i32 0, i32* %s_addr, align 4, !dbg !401
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !402
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !403
  store i16 %call3, i16* %sin_port, align 2, !dbg !404
  %3 = load i32, i32* %listenSocket, align 4, !dbg !405
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !407
  %call4 = call i32 @bind(i32 %3, %struct.sockaddr* %4, i32 16) #7, !dbg !408
  %cmp5 = icmp eq i32 %call4, -1, !dbg !409
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !410

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !411

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !413
  %call8 = call i32 @listen(i32 %5, i32 5) #7, !dbg !415
  %cmp9 = icmp eq i32 %call8, -1, !dbg !416
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !417

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !418

if.end11:                                         ; preds = %if.end7
  %6 = load i32, i32* %listenSocket, align 4, !dbg !420
  %call12 = call i32 @accept(i32 %6, %struct.sockaddr* null, i32* null), !dbg !421
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !422
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !423
  %cmp13 = icmp eq i32 %7, -1, !dbg !425
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !426

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !427

if.end15:                                         ; preds = %if.end11
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !429
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !430
  %call16 = call i64 @recv(i32 %8, i8* %arraydecay, i64 13, i32 0), !dbg !431
  %conv = trunc i64 %call16 to i32, !dbg !431
  store i32 %conv, i32* %recvResult, align 4, !dbg !432
  %9 = load i32, i32* %recvResult, align 4, !dbg !433
  %cmp17 = icmp eq i32 %9, -1, !dbg !435
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !436

lor.lhs.false:                                    ; preds = %if.end15
  %10 = load i32, i32* %recvResult, align 4, !dbg !437
  %cmp19 = icmp eq i32 %10, 0, !dbg !438
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !439

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !440

if.end22:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !442
  %idxprom = sext i32 %11 to i64, !dbg !443
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !443
  store i8 0, i8* %arrayidx, align 1, !dbg !444
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !445
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !446
  store i32 %call24, i32* %data, align 4, !dbg !447
  br label %do.end, !dbg !448

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !449
  %cmp25 = icmp ne i32 %12, -1, !dbg !451
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !452

if.then27:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !453
  %call28 = call i32 @close(i32 %13), !dbg !455
  br label %if.end29, !dbg !456

if.end29:                                         ; preds = %if.then27, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !457
  %cmp30 = icmp ne i32 %14, -1, !dbg !459
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !460

if.then32:                                        ; preds = %if.end29
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !461
  %call33 = call i32 @close(i32 %15), !dbg !463
  br label %if.end34, !dbg !464

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !465

if.end35:                                         ; preds = %if.end34, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !466
  %cmp36 = icmp eq i32 %16, 5, !dbg !468
  br i1 %cmp36, label %if.then38, label %if.end47, !dbg !469

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !470, metadata !DIExpression()), !dbg !473
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !473
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !473
  %18 = load i32, i32* %data, align 4, !dbg !474
  %cmp39 = icmp sge i32 %18, 0, !dbg !476
  br i1 %cmp39, label %land.lhs.true, label %if.else, !dbg !477

land.lhs.true:                                    ; preds = %if.then38
  %19 = load i32, i32* %data, align 4, !dbg !478
  %cmp41 = icmp slt i32 %19, 10, !dbg !479
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !480

if.then43:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !481
  %idxprom44 = sext i32 %20 to i64, !dbg !483
  %arrayidx45 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom44, !dbg !483
  %21 = load i32, i32* %arrayidx45, align 4, !dbg !483
  call void @printIntLine(i32 %21), !dbg !484
  br label %if.end46, !dbg !485

if.else:                                          ; preds = %land.lhs.true, %if.then38
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !486
  br label %if.end46

if.end46:                                         ; preds = %if.else, %if.then43
  br label %if.end47, !dbg !488

if.end47:                                         ; preds = %if.end46, %if.end35
  ret void, !dbg !489
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !490 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !491, metadata !DIExpression()), !dbg !492
  store i32 -1, i32* %data, align 4, !dbg !493
  %0 = load i32, i32* @globalFive, align 4, !dbg !494
  %cmp = icmp ne i32 %0, 5, !dbg !496
  br i1 %cmp, label %if.then, label %if.else, !dbg !497

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !498
  br label %if.end, !dbg !500

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !501
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !503
  %cmp1 = icmp eq i32 %1, 5, !dbg !505
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !506

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !507, metadata !DIExpression()), !dbg !510
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !510
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !510
  %3 = load i32, i32* %data, align 4, !dbg !511
  %cmp3 = icmp sge i32 %3, 0, !dbg !513
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !514

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !515
  %idxprom = sext i32 %4 to i64, !dbg !517
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !517
  %5 = load i32, i32* %arrayidx, align 4, !dbg !517
  call void @printIntLine(i32 %5), !dbg !518
  br label %if.end6, !dbg !519

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !520
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !522

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !523
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !524 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !525, metadata !DIExpression()), !dbg !526
  store i32 -1, i32* %data, align 4, !dbg !527
  %0 = load i32, i32* @globalFive, align 4, !dbg !528
  %cmp = icmp eq i32 %0, 5, !dbg !530
  br i1 %cmp, label %if.then, label %if.end, !dbg !531

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !532
  br label %if.end, !dbg !534

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !535
  %cmp1 = icmp eq i32 %1, 5, !dbg !537
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !538

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !539, metadata !DIExpression()), !dbg !542
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !542
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !542
  %3 = load i32, i32* %data, align 4, !dbg !543
  %cmp3 = icmp sge i32 %3, 0, !dbg !545
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !546

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !547
  %idxprom = sext i32 %4 to i64, !dbg !549
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !549
  %5 = load i32, i32* %arrayidx, align 4, !dbg !549
  call void @printIntLine(i32 %5), !dbg !550
  br label %if.end5, !dbg !551

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !552
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !554

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !555
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_14_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_14.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocation(line: 49, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 49, column: 8)
!81 = !DILocation(line: 49, column: 18, scope: !80)
!82 = !DILocation(line: 49, column: 8, scope: !70)
!83 = !DILocalVariable(name: "recvResult", scope: !84, file: !71, line: 56, type: !76)
!84 = distinct !DILexicalBlock(scope: !85, file: !71, line: 51, column: 9)
!85 = distinct !DILexicalBlock(scope: !80, file: !71, line: 50, column: 5)
!86 = !DILocation(line: 56, column: 17, scope: !84)
!87 = !DILocalVariable(name: "service", scope: !84, file: !71, line: 57, type: !88)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !89)
!89 = !{!90, !91, !95, !99}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !88, file: !17, line: 240, baseType: !56, size: 16)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !88, file: !17, line: 241, baseType: !92, size: 16, offset: 16)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !88, file: !17, line: 242, baseType: !96, size: 32, offset: 32)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !97)
!97 = !{!98}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !96, file: !17, line: 33, baseType: !46, size: 32)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !88, file: !17, line: 245, baseType: !100, size: 64, offset: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 64, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 8)
!104 = !DILocation(line: 57, column: 32, scope: !84)
!105 = !DILocalVariable(name: "listenSocket", scope: !84, file: !71, line: 58, type: !76)
!106 = !DILocation(line: 58, column: 20, scope: !84)
!107 = !DILocalVariable(name: "acceptSocket", scope: !84, file: !71, line: 59, type: !76)
!108 = !DILocation(line: 59, column: 20, scope: !84)
!109 = !DILocalVariable(name: "inputBuffer", scope: !84, file: !71, line: 60, type: !60)
!110 = !DILocation(line: 60, column: 18, scope: !84)
!111 = !DILocation(line: 61, column: 13, scope: !84)
!112 = !DILocation(line: 71, column: 32, scope: !113)
!113 = distinct !DILexicalBlock(scope: !84, file: !71, line: 62, column: 13)
!114 = !DILocation(line: 71, column: 30, scope: !113)
!115 = !DILocation(line: 72, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !71, line: 72, column: 21)
!117 = !DILocation(line: 72, column: 34, scope: !116)
!118 = !DILocation(line: 72, column: 21, scope: !113)
!119 = !DILocation(line: 74, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !71, line: 73, column: 17)
!121 = !DILocation(line: 76, column: 17, scope: !113)
!122 = !DILocation(line: 77, column: 25, scope: !113)
!123 = !DILocation(line: 77, column: 36, scope: !113)
!124 = !DILocation(line: 78, column: 25, scope: !113)
!125 = !DILocation(line: 78, column: 34, scope: !113)
!126 = !DILocation(line: 78, column: 41, scope: !113)
!127 = !DILocation(line: 79, column: 36, scope: !113)
!128 = !DILocation(line: 79, column: 25, scope: !113)
!129 = !DILocation(line: 79, column: 34, scope: !113)
!130 = !DILocation(line: 80, column: 26, scope: !131)
!131 = distinct !DILexicalBlock(scope: !113, file: !71, line: 80, column: 21)
!132 = !DILocation(line: 80, column: 40, scope: !131)
!133 = !DILocation(line: 80, column: 21, scope: !131)
!134 = !DILocation(line: 80, column: 85, scope: !131)
!135 = !DILocation(line: 80, column: 21, scope: !113)
!136 = !DILocation(line: 82, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !71, line: 81, column: 17)
!138 = !DILocation(line: 84, column: 28, scope: !139)
!139 = distinct !DILexicalBlock(scope: !113, file: !71, line: 84, column: 21)
!140 = !DILocation(line: 84, column: 21, scope: !139)
!141 = !DILocation(line: 84, column: 58, scope: !139)
!142 = !DILocation(line: 84, column: 21, scope: !113)
!143 = !DILocation(line: 86, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !71, line: 85, column: 17)
!145 = !DILocation(line: 88, column: 39, scope: !113)
!146 = !DILocation(line: 88, column: 32, scope: !113)
!147 = !DILocation(line: 88, column: 30, scope: !113)
!148 = !DILocation(line: 89, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !113, file: !71, line: 89, column: 21)
!150 = !DILocation(line: 89, column: 34, scope: !149)
!151 = !DILocation(line: 89, column: 21, scope: !113)
!152 = !DILocation(line: 91, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !71, line: 90, column: 17)
!154 = !DILocation(line: 94, column: 35, scope: !113)
!155 = !DILocation(line: 94, column: 49, scope: !113)
!156 = !DILocation(line: 94, column: 30, scope: !113)
!157 = !DILocation(line: 94, column: 28, scope: !113)
!158 = !DILocation(line: 95, column: 21, scope: !159)
!159 = distinct !DILexicalBlock(scope: !113, file: !71, line: 95, column: 21)
!160 = !DILocation(line: 95, column: 32, scope: !159)
!161 = !DILocation(line: 95, column: 48, scope: !159)
!162 = !DILocation(line: 95, column: 51, scope: !159)
!163 = !DILocation(line: 95, column: 62, scope: !159)
!164 = !DILocation(line: 95, column: 21, scope: !113)
!165 = !DILocation(line: 97, column: 21, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !71, line: 96, column: 17)
!167 = !DILocation(line: 100, column: 29, scope: !113)
!168 = !DILocation(line: 100, column: 17, scope: !113)
!169 = !DILocation(line: 100, column: 41, scope: !113)
!170 = !DILocation(line: 102, column: 29, scope: !113)
!171 = !DILocation(line: 102, column: 24, scope: !113)
!172 = !DILocation(line: 102, column: 22, scope: !113)
!173 = !DILocation(line: 103, column: 13, scope: !113)
!174 = !DILocation(line: 105, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !84, file: !71, line: 105, column: 17)
!176 = !DILocation(line: 105, column: 30, scope: !175)
!177 = !DILocation(line: 105, column: 17, scope: !84)
!178 = !DILocation(line: 107, column: 30, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !71, line: 106, column: 13)
!180 = !DILocation(line: 107, column: 17, scope: !179)
!181 = !DILocation(line: 108, column: 13, scope: !179)
!182 = !DILocation(line: 109, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !84, file: !71, line: 109, column: 17)
!184 = !DILocation(line: 109, column: 30, scope: !183)
!185 = !DILocation(line: 109, column: 17, scope: !84)
!186 = !DILocation(line: 111, column: 30, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !71, line: 110, column: 13)
!188 = !DILocation(line: 111, column: 17, scope: !187)
!189 = !DILocation(line: 112, column: 13, scope: !187)
!190 = !DILocation(line: 120, column: 5, scope: !85)
!191 = !DILocation(line: 121, column: 8, scope: !192)
!192 = distinct !DILexicalBlock(scope: !70, file: !71, line: 121, column: 8)
!193 = !DILocation(line: 121, column: 18, scope: !192)
!194 = !DILocation(line: 121, column: 8, scope: !70)
!195 = !DILocalVariable(name: "buffer", scope: !196, file: !71, line: 124, type: !198)
!196 = distinct !DILexicalBlock(scope: !197, file: !71, line: 123, column: 9)
!197 = distinct !DILexicalBlock(scope: !192, file: !71, line: 122, column: 5)
!198 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !199)
!199 = !{!200}
!200 = !DISubrange(count: 10)
!201 = !DILocation(line: 124, column: 17, scope: !196)
!202 = !DILocation(line: 127, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !196, file: !71, line: 127, column: 17)
!204 = !DILocation(line: 127, column: 22, scope: !203)
!205 = !DILocation(line: 127, column: 17, scope: !196)
!206 = !DILocation(line: 129, column: 37, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !71, line: 128, column: 13)
!208 = !DILocation(line: 129, column: 30, scope: !207)
!209 = !DILocation(line: 129, column: 17, scope: !207)
!210 = !DILocation(line: 130, column: 13, scope: !207)
!211 = !DILocation(line: 133, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !203, file: !71, line: 132, column: 13)
!213 = !DILocation(line: 136, column: 5, scope: !197)
!214 = !DILocation(line: 137, column: 1, scope: !70)
!215 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_14_good", scope: !71, file: !71, line: 403, type: !72, scopeLine: 404, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!216 = !DILocation(line: 405, column: 5, scope: !215)
!217 = !DILocation(line: 406, column: 5, scope: !215)
!218 = !DILocation(line: 407, column: 5, scope: !215)
!219 = !DILocation(line: 408, column: 5, scope: !215)
!220 = !DILocation(line: 409, column: 1, scope: !215)
!221 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 420, type: !222, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!222 = !DISubroutineType(types: !223)
!223 = !{!76, !76, !224}
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!226 = !DILocalVariable(name: "argc", arg: 1, scope: !221, file: !71, line: 420, type: !76)
!227 = !DILocation(line: 420, column: 14, scope: !221)
!228 = !DILocalVariable(name: "argv", arg: 2, scope: !221, file: !71, line: 420, type: !224)
!229 = !DILocation(line: 420, column: 27, scope: !221)
!230 = !DILocation(line: 423, column: 22, scope: !221)
!231 = !DILocation(line: 423, column: 12, scope: !221)
!232 = !DILocation(line: 423, column: 5, scope: !221)
!233 = !DILocation(line: 425, column: 5, scope: !221)
!234 = !DILocation(line: 426, column: 5, scope: !221)
!235 = !DILocation(line: 427, column: 5, scope: !221)
!236 = !DILocation(line: 430, column: 5, scope: !221)
!237 = !DILocation(line: 431, column: 5, scope: !221)
!238 = !DILocation(line: 432, column: 5, scope: !221)
!239 = !DILocation(line: 434, column: 5, scope: !221)
!240 = distinct !DISubprogram(name: "goodB2G1", scope: !71, file: !71, line: 144, type: !72, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!241 = !DILocalVariable(name: "data", scope: !240, file: !71, line: 146, type: !76)
!242 = !DILocation(line: 146, column: 9, scope: !240)
!243 = !DILocation(line: 148, column: 10, scope: !240)
!244 = !DILocation(line: 149, column: 8, scope: !245)
!245 = distinct !DILexicalBlock(scope: !240, file: !71, line: 149, column: 8)
!246 = !DILocation(line: 149, column: 18, scope: !245)
!247 = !DILocation(line: 149, column: 8, scope: !240)
!248 = !DILocalVariable(name: "recvResult", scope: !249, file: !71, line: 156, type: !76)
!249 = distinct !DILexicalBlock(scope: !250, file: !71, line: 151, column: 9)
!250 = distinct !DILexicalBlock(scope: !245, file: !71, line: 150, column: 5)
!251 = !DILocation(line: 156, column: 17, scope: !249)
!252 = !DILocalVariable(name: "service", scope: !249, file: !71, line: 157, type: !88)
!253 = !DILocation(line: 157, column: 32, scope: !249)
!254 = !DILocalVariable(name: "listenSocket", scope: !249, file: !71, line: 158, type: !76)
!255 = !DILocation(line: 158, column: 20, scope: !249)
!256 = !DILocalVariable(name: "acceptSocket", scope: !249, file: !71, line: 159, type: !76)
!257 = !DILocation(line: 159, column: 20, scope: !249)
!258 = !DILocalVariable(name: "inputBuffer", scope: !249, file: !71, line: 160, type: !60)
!259 = !DILocation(line: 160, column: 18, scope: !249)
!260 = !DILocation(line: 161, column: 13, scope: !249)
!261 = !DILocation(line: 171, column: 32, scope: !262)
!262 = distinct !DILexicalBlock(scope: !249, file: !71, line: 162, column: 13)
!263 = !DILocation(line: 171, column: 30, scope: !262)
!264 = !DILocation(line: 172, column: 21, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !71, line: 172, column: 21)
!266 = !DILocation(line: 172, column: 34, scope: !265)
!267 = !DILocation(line: 172, column: 21, scope: !262)
!268 = !DILocation(line: 174, column: 21, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !71, line: 173, column: 17)
!270 = !DILocation(line: 176, column: 17, scope: !262)
!271 = !DILocation(line: 177, column: 25, scope: !262)
!272 = !DILocation(line: 177, column: 36, scope: !262)
!273 = !DILocation(line: 178, column: 25, scope: !262)
!274 = !DILocation(line: 178, column: 34, scope: !262)
!275 = !DILocation(line: 178, column: 41, scope: !262)
!276 = !DILocation(line: 179, column: 36, scope: !262)
!277 = !DILocation(line: 179, column: 25, scope: !262)
!278 = !DILocation(line: 179, column: 34, scope: !262)
!279 = !DILocation(line: 180, column: 26, scope: !280)
!280 = distinct !DILexicalBlock(scope: !262, file: !71, line: 180, column: 21)
!281 = !DILocation(line: 180, column: 40, scope: !280)
!282 = !DILocation(line: 180, column: 21, scope: !280)
!283 = !DILocation(line: 180, column: 85, scope: !280)
!284 = !DILocation(line: 180, column: 21, scope: !262)
!285 = !DILocation(line: 182, column: 21, scope: !286)
!286 = distinct !DILexicalBlock(scope: !280, file: !71, line: 181, column: 17)
!287 = !DILocation(line: 184, column: 28, scope: !288)
!288 = distinct !DILexicalBlock(scope: !262, file: !71, line: 184, column: 21)
!289 = !DILocation(line: 184, column: 21, scope: !288)
!290 = !DILocation(line: 184, column: 58, scope: !288)
!291 = !DILocation(line: 184, column: 21, scope: !262)
!292 = !DILocation(line: 186, column: 21, scope: !293)
!293 = distinct !DILexicalBlock(scope: !288, file: !71, line: 185, column: 17)
!294 = !DILocation(line: 188, column: 39, scope: !262)
!295 = !DILocation(line: 188, column: 32, scope: !262)
!296 = !DILocation(line: 188, column: 30, scope: !262)
!297 = !DILocation(line: 189, column: 21, scope: !298)
!298 = distinct !DILexicalBlock(scope: !262, file: !71, line: 189, column: 21)
!299 = !DILocation(line: 189, column: 34, scope: !298)
!300 = !DILocation(line: 189, column: 21, scope: !262)
!301 = !DILocation(line: 191, column: 21, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !71, line: 190, column: 17)
!303 = !DILocation(line: 194, column: 35, scope: !262)
!304 = !DILocation(line: 194, column: 49, scope: !262)
!305 = !DILocation(line: 194, column: 30, scope: !262)
!306 = !DILocation(line: 194, column: 28, scope: !262)
!307 = !DILocation(line: 195, column: 21, scope: !308)
!308 = distinct !DILexicalBlock(scope: !262, file: !71, line: 195, column: 21)
!309 = !DILocation(line: 195, column: 32, scope: !308)
!310 = !DILocation(line: 195, column: 48, scope: !308)
!311 = !DILocation(line: 195, column: 51, scope: !308)
!312 = !DILocation(line: 195, column: 62, scope: !308)
!313 = !DILocation(line: 195, column: 21, scope: !262)
!314 = !DILocation(line: 197, column: 21, scope: !315)
!315 = distinct !DILexicalBlock(scope: !308, file: !71, line: 196, column: 17)
!316 = !DILocation(line: 200, column: 29, scope: !262)
!317 = !DILocation(line: 200, column: 17, scope: !262)
!318 = !DILocation(line: 200, column: 41, scope: !262)
!319 = !DILocation(line: 202, column: 29, scope: !262)
!320 = !DILocation(line: 202, column: 24, scope: !262)
!321 = !DILocation(line: 202, column: 22, scope: !262)
!322 = !DILocation(line: 203, column: 13, scope: !262)
!323 = !DILocation(line: 205, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !249, file: !71, line: 205, column: 17)
!325 = !DILocation(line: 205, column: 30, scope: !324)
!326 = !DILocation(line: 205, column: 17, scope: !249)
!327 = !DILocation(line: 207, column: 30, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !71, line: 206, column: 13)
!329 = !DILocation(line: 207, column: 17, scope: !328)
!330 = !DILocation(line: 208, column: 13, scope: !328)
!331 = !DILocation(line: 209, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !249, file: !71, line: 209, column: 17)
!333 = !DILocation(line: 209, column: 30, scope: !332)
!334 = !DILocation(line: 209, column: 17, scope: !249)
!335 = !DILocation(line: 211, column: 30, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !71, line: 210, column: 13)
!337 = !DILocation(line: 211, column: 17, scope: !336)
!338 = !DILocation(line: 212, column: 13, scope: !336)
!339 = !DILocation(line: 220, column: 5, scope: !250)
!340 = !DILocation(line: 221, column: 8, scope: !341)
!341 = distinct !DILexicalBlock(scope: !240, file: !71, line: 221, column: 8)
!342 = !DILocation(line: 221, column: 18, scope: !341)
!343 = !DILocation(line: 221, column: 8, scope: !240)
!344 = !DILocation(line: 224, column: 9, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !71, line: 222, column: 5)
!346 = !DILocation(line: 225, column: 5, scope: !345)
!347 = !DILocalVariable(name: "buffer", scope: !348, file: !71, line: 229, type: !198)
!348 = distinct !DILexicalBlock(scope: !349, file: !71, line: 228, column: 9)
!349 = distinct !DILexicalBlock(scope: !341, file: !71, line: 227, column: 5)
!350 = !DILocation(line: 229, column: 17, scope: !348)
!351 = !DILocation(line: 231, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !71, line: 231, column: 17)
!353 = !DILocation(line: 231, column: 22, scope: !352)
!354 = !DILocation(line: 231, column: 27, scope: !352)
!355 = !DILocation(line: 231, column: 30, scope: !352)
!356 = !DILocation(line: 231, column: 35, scope: !352)
!357 = !DILocation(line: 231, column: 17, scope: !348)
!358 = !DILocation(line: 233, column: 37, scope: !359)
!359 = distinct !DILexicalBlock(scope: !352, file: !71, line: 232, column: 13)
!360 = !DILocation(line: 233, column: 30, scope: !359)
!361 = !DILocation(line: 233, column: 17, scope: !359)
!362 = !DILocation(line: 234, column: 13, scope: !359)
!363 = !DILocation(line: 237, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !352, file: !71, line: 236, column: 13)
!365 = !DILocation(line: 241, column: 1, scope: !240)
!366 = distinct !DISubprogram(name: "goodB2G2", scope: !71, file: !71, line: 244, type: !72, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!367 = !DILocalVariable(name: "data", scope: !366, file: !71, line: 246, type: !76)
!368 = !DILocation(line: 246, column: 9, scope: !366)
!369 = !DILocation(line: 248, column: 10, scope: !366)
!370 = !DILocation(line: 249, column: 8, scope: !371)
!371 = distinct !DILexicalBlock(scope: !366, file: !71, line: 249, column: 8)
!372 = !DILocation(line: 249, column: 18, scope: !371)
!373 = !DILocation(line: 249, column: 8, scope: !366)
!374 = !DILocalVariable(name: "recvResult", scope: !375, file: !71, line: 256, type: !76)
!375 = distinct !DILexicalBlock(scope: !376, file: !71, line: 251, column: 9)
!376 = distinct !DILexicalBlock(scope: !371, file: !71, line: 250, column: 5)
!377 = !DILocation(line: 256, column: 17, scope: !375)
!378 = !DILocalVariable(name: "service", scope: !375, file: !71, line: 257, type: !88)
!379 = !DILocation(line: 257, column: 32, scope: !375)
!380 = !DILocalVariable(name: "listenSocket", scope: !375, file: !71, line: 258, type: !76)
!381 = !DILocation(line: 258, column: 20, scope: !375)
!382 = !DILocalVariable(name: "acceptSocket", scope: !375, file: !71, line: 259, type: !76)
!383 = !DILocation(line: 259, column: 20, scope: !375)
!384 = !DILocalVariable(name: "inputBuffer", scope: !375, file: !71, line: 260, type: !60)
!385 = !DILocation(line: 260, column: 18, scope: !375)
!386 = !DILocation(line: 261, column: 13, scope: !375)
!387 = !DILocation(line: 271, column: 32, scope: !388)
!388 = distinct !DILexicalBlock(scope: !375, file: !71, line: 262, column: 13)
!389 = !DILocation(line: 271, column: 30, scope: !388)
!390 = !DILocation(line: 272, column: 21, scope: !391)
!391 = distinct !DILexicalBlock(scope: !388, file: !71, line: 272, column: 21)
!392 = !DILocation(line: 272, column: 34, scope: !391)
!393 = !DILocation(line: 272, column: 21, scope: !388)
!394 = !DILocation(line: 274, column: 21, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !71, line: 273, column: 17)
!396 = !DILocation(line: 276, column: 17, scope: !388)
!397 = !DILocation(line: 277, column: 25, scope: !388)
!398 = !DILocation(line: 277, column: 36, scope: !388)
!399 = !DILocation(line: 278, column: 25, scope: !388)
!400 = !DILocation(line: 278, column: 34, scope: !388)
!401 = !DILocation(line: 278, column: 41, scope: !388)
!402 = !DILocation(line: 279, column: 36, scope: !388)
!403 = !DILocation(line: 279, column: 25, scope: !388)
!404 = !DILocation(line: 279, column: 34, scope: !388)
!405 = !DILocation(line: 280, column: 26, scope: !406)
!406 = distinct !DILexicalBlock(scope: !388, file: !71, line: 280, column: 21)
!407 = !DILocation(line: 280, column: 40, scope: !406)
!408 = !DILocation(line: 280, column: 21, scope: !406)
!409 = !DILocation(line: 280, column: 85, scope: !406)
!410 = !DILocation(line: 280, column: 21, scope: !388)
!411 = !DILocation(line: 282, column: 21, scope: !412)
!412 = distinct !DILexicalBlock(scope: !406, file: !71, line: 281, column: 17)
!413 = !DILocation(line: 284, column: 28, scope: !414)
!414 = distinct !DILexicalBlock(scope: !388, file: !71, line: 284, column: 21)
!415 = !DILocation(line: 284, column: 21, scope: !414)
!416 = !DILocation(line: 284, column: 58, scope: !414)
!417 = !DILocation(line: 284, column: 21, scope: !388)
!418 = !DILocation(line: 286, column: 21, scope: !419)
!419 = distinct !DILexicalBlock(scope: !414, file: !71, line: 285, column: 17)
!420 = !DILocation(line: 288, column: 39, scope: !388)
!421 = !DILocation(line: 288, column: 32, scope: !388)
!422 = !DILocation(line: 288, column: 30, scope: !388)
!423 = !DILocation(line: 289, column: 21, scope: !424)
!424 = distinct !DILexicalBlock(scope: !388, file: !71, line: 289, column: 21)
!425 = !DILocation(line: 289, column: 34, scope: !424)
!426 = !DILocation(line: 289, column: 21, scope: !388)
!427 = !DILocation(line: 291, column: 21, scope: !428)
!428 = distinct !DILexicalBlock(scope: !424, file: !71, line: 290, column: 17)
!429 = !DILocation(line: 294, column: 35, scope: !388)
!430 = !DILocation(line: 294, column: 49, scope: !388)
!431 = !DILocation(line: 294, column: 30, scope: !388)
!432 = !DILocation(line: 294, column: 28, scope: !388)
!433 = !DILocation(line: 295, column: 21, scope: !434)
!434 = distinct !DILexicalBlock(scope: !388, file: !71, line: 295, column: 21)
!435 = !DILocation(line: 295, column: 32, scope: !434)
!436 = !DILocation(line: 295, column: 48, scope: !434)
!437 = !DILocation(line: 295, column: 51, scope: !434)
!438 = !DILocation(line: 295, column: 62, scope: !434)
!439 = !DILocation(line: 295, column: 21, scope: !388)
!440 = !DILocation(line: 297, column: 21, scope: !441)
!441 = distinct !DILexicalBlock(scope: !434, file: !71, line: 296, column: 17)
!442 = !DILocation(line: 300, column: 29, scope: !388)
!443 = !DILocation(line: 300, column: 17, scope: !388)
!444 = !DILocation(line: 300, column: 41, scope: !388)
!445 = !DILocation(line: 302, column: 29, scope: !388)
!446 = !DILocation(line: 302, column: 24, scope: !388)
!447 = !DILocation(line: 302, column: 22, scope: !388)
!448 = !DILocation(line: 303, column: 13, scope: !388)
!449 = !DILocation(line: 305, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !375, file: !71, line: 305, column: 17)
!451 = !DILocation(line: 305, column: 30, scope: !450)
!452 = !DILocation(line: 305, column: 17, scope: !375)
!453 = !DILocation(line: 307, column: 30, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !71, line: 306, column: 13)
!455 = !DILocation(line: 307, column: 17, scope: !454)
!456 = !DILocation(line: 308, column: 13, scope: !454)
!457 = !DILocation(line: 309, column: 17, scope: !458)
!458 = distinct !DILexicalBlock(scope: !375, file: !71, line: 309, column: 17)
!459 = !DILocation(line: 309, column: 30, scope: !458)
!460 = !DILocation(line: 309, column: 17, scope: !375)
!461 = !DILocation(line: 311, column: 30, scope: !462)
!462 = distinct !DILexicalBlock(scope: !458, file: !71, line: 310, column: 13)
!463 = !DILocation(line: 311, column: 17, scope: !462)
!464 = !DILocation(line: 312, column: 13, scope: !462)
!465 = !DILocation(line: 320, column: 5, scope: !376)
!466 = !DILocation(line: 321, column: 8, scope: !467)
!467 = distinct !DILexicalBlock(scope: !366, file: !71, line: 321, column: 8)
!468 = !DILocation(line: 321, column: 18, scope: !467)
!469 = !DILocation(line: 321, column: 8, scope: !366)
!470 = !DILocalVariable(name: "buffer", scope: !471, file: !71, line: 324, type: !198)
!471 = distinct !DILexicalBlock(scope: !472, file: !71, line: 323, column: 9)
!472 = distinct !DILexicalBlock(scope: !467, file: !71, line: 322, column: 5)
!473 = !DILocation(line: 324, column: 17, scope: !471)
!474 = !DILocation(line: 326, column: 17, scope: !475)
!475 = distinct !DILexicalBlock(scope: !471, file: !71, line: 326, column: 17)
!476 = !DILocation(line: 326, column: 22, scope: !475)
!477 = !DILocation(line: 326, column: 27, scope: !475)
!478 = !DILocation(line: 326, column: 30, scope: !475)
!479 = !DILocation(line: 326, column: 35, scope: !475)
!480 = !DILocation(line: 326, column: 17, scope: !471)
!481 = !DILocation(line: 328, column: 37, scope: !482)
!482 = distinct !DILexicalBlock(scope: !475, file: !71, line: 327, column: 13)
!483 = !DILocation(line: 328, column: 30, scope: !482)
!484 = !DILocation(line: 328, column: 17, scope: !482)
!485 = !DILocation(line: 329, column: 13, scope: !482)
!486 = !DILocation(line: 332, column: 17, scope: !487)
!487 = distinct !DILexicalBlock(scope: !475, file: !71, line: 331, column: 13)
!488 = !DILocation(line: 335, column: 5, scope: !472)
!489 = !DILocation(line: 336, column: 1, scope: !366)
!490 = distinct !DISubprogram(name: "goodG2B1", scope: !71, file: !71, line: 339, type: !72, scopeLine: 340, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!491 = !DILocalVariable(name: "data", scope: !490, file: !71, line: 341, type: !76)
!492 = !DILocation(line: 341, column: 9, scope: !490)
!493 = !DILocation(line: 343, column: 10, scope: !490)
!494 = !DILocation(line: 344, column: 8, scope: !495)
!495 = distinct !DILexicalBlock(scope: !490, file: !71, line: 344, column: 8)
!496 = !DILocation(line: 344, column: 18, scope: !495)
!497 = !DILocation(line: 344, column: 8, scope: !490)
!498 = !DILocation(line: 347, column: 9, scope: !499)
!499 = distinct !DILexicalBlock(scope: !495, file: !71, line: 345, column: 5)
!500 = !DILocation(line: 348, column: 5, scope: !499)
!501 = !DILocation(line: 353, column: 14, scope: !502)
!502 = distinct !DILexicalBlock(scope: !495, file: !71, line: 350, column: 5)
!503 = !DILocation(line: 355, column: 8, scope: !504)
!504 = distinct !DILexicalBlock(scope: !490, file: !71, line: 355, column: 8)
!505 = !DILocation(line: 355, column: 18, scope: !504)
!506 = !DILocation(line: 355, column: 8, scope: !490)
!507 = !DILocalVariable(name: "buffer", scope: !508, file: !71, line: 358, type: !198)
!508 = distinct !DILexicalBlock(scope: !509, file: !71, line: 357, column: 9)
!509 = distinct !DILexicalBlock(scope: !504, file: !71, line: 356, column: 5)
!510 = !DILocation(line: 358, column: 17, scope: !508)
!511 = !DILocation(line: 361, column: 17, scope: !512)
!512 = distinct !DILexicalBlock(scope: !508, file: !71, line: 361, column: 17)
!513 = !DILocation(line: 361, column: 22, scope: !512)
!514 = !DILocation(line: 361, column: 17, scope: !508)
!515 = !DILocation(line: 363, column: 37, scope: !516)
!516 = distinct !DILexicalBlock(scope: !512, file: !71, line: 362, column: 13)
!517 = !DILocation(line: 363, column: 30, scope: !516)
!518 = !DILocation(line: 363, column: 17, scope: !516)
!519 = !DILocation(line: 364, column: 13, scope: !516)
!520 = !DILocation(line: 367, column: 17, scope: !521)
!521 = distinct !DILexicalBlock(scope: !512, file: !71, line: 366, column: 13)
!522 = !DILocation(line: 370, column: 5, scope: !509)
!523 = !DILocation(line: 371, column: 1, scope: !490)
!524 = distinct !DISubprogram(name: "goodG2B2", scope: !71, file: !71, line: 374, type: !72, scopeLine: 375, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!525 = !DILocalVariable(name: "data", scope: !524, file: !71, line: 376, type: !76)
!526 = !DILocation(line: 376, column: 9, scope: !524)
!527 = !DILocation(line: 378, column: 10, scope: !524)
!528 = !DILocation(line: 379, column: 8, scope: !529)
!529 = distinct !DILexicalBlock(scope: !524, file: !71, line: 379, column: 8)
!530 = !DILocation(line: 379, column: 18, scope: !529)
!531 = !DILocation(line: 379, column: 8, scope: !524)
!532 = !DILocation(line: 383, column: 14, scope: !533)
!533 = distinct !DILexicalBlock(scope: !529, file: !71, line: 380, column: 5)
!534 = !DILocation(line: 384, column: 5, scope: !533)
!535 = !DILocation(line: 385, column: 8, scope: !536)
!536 = distinct !DILexicalBlock(scope: !524, file: !71, line: 385, column: 8)
!537 = !DILocation(line: 385, column: 18, scope: !536)
!538 = !DILocation(line: 385, column: 8, scope: !524)
!539 = !DILocalVariable(name: "buffer", scope: !540, file: !71, line: 388, type: !198)
!540 = distinct !DILexicalBlock(scope: !541, file: !71, line: 387, column: 9)
!541 = distinct !DILexicalBlock(scope: !536, file: !71, line: 386, column: 5)
!542 = !DILocation(line: 388, column: 17, scope: !540)
!543 = !DILocation(line: 391, column: 17, scope: !544)
!544 = distinct !DILexicalBlock(scope: !540, file: !71, line: 391, column: 17)
!545 = !DILocation(line: 391, column: 22, scope: !544)
!546 = !DILocation(line: 391, column: 17, scope: !540)
!547 = !DILocation(line: 393, column: 37, scope: !548)
!548 = distinct !DILexicalBlock(scope: !544, file: !71, line: 392, column: 13)
!549 = !DILocation(line: 393, column: 30, scope: !548)
!550 = !DILocation(line: 393, column: 17, scope: !548)
!551 = !DILocation(line: 394, column: 13, scope: !548)
!552 = !DILocation(line: 397, column: 17, scope: !553)
!553 = distinct !DILexicalBlock(scope: !544, file: !71, line: 396, column: 13)
!554 = !DILocation(line: 400, column: 5, scope: !541)
!555 = !DILocation(line: 401, column: 1, scope: !524)
