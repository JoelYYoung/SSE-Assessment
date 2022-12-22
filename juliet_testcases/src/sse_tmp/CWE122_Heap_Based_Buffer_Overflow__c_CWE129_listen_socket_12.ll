; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_12_bad() #0 !dbg !73 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i65 = alloca i32, align 4
  %buffer66 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !84, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !88, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %listenSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 -1, i32* %acceptSocket, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  br label %do.body, !dbg !112

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !113
  store i32 %call1, i32* %listenSocket, align 4, !dbg !115
  %0 = load i32, i32* %listenSocket, align 4, !dbg !116
  %cmp = icmp eq i32 %0, -1, !dbg !118
  br i1 %cmp, label %if.then2, label %if.end, !dbg !119

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !120

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !122
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !123
  store i16 2, i16* %sin_family, align 4, !dbg !124
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !125
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !126
  store i32 0, i32* %s_addr, align 4, !dbg !127
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !128
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !129
  store i16 %call3, i16* %sin_port, align 2, !dbg !130
  %2 = load i32, i32* %listenSocket, align 4, !dbg !131
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !133
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !134
  %cmp5 = icmp eq i32 %call4, -1, !dbg !135
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !136

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !137

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !139
  %call8 = call i32 @listen(i32 %4, i32 5) #8, !dbg !141
  %cmp9 = icmp eq i32 %call8, -1, !dbg !142
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !143

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !144

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !146
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !147
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !148
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !149
  %cmp13 = icmp eq i32 %6, -1, !dbg !151
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !152

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !153

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !155
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !156
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !157
  %conv = trunc i64 %call16 to i32, !dbg !157
  store i32 %conv, i32* %recvResult, align 4, !dbg !158
  %8 = load i32, i32* %recvResult, align 4, !dbg !159
  %cmp17 = icmp eq i32 %8, -1, !dbg !161
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !162

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !163
  %cmp19 = icmp eq i32 %9, 0, !dbg !164
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !165

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !166

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !168
  %idxprom = sext i32 %10 to i64, !dbg !169
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !171
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !172
  store i32 %call24, i32* %data, align 4, !dbg !173
  br label %do.end, !dbg !174

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !175
  %cmp25 = icmp ne i32 %11, -1, !dbg !177
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !178

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !179
  %call28 = call i32 @close(i32 %12), !dbg !181
  br label %if.end29, !dbg !182

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !183
  %cmp30 = icmp ne i32 %13, -1, !dbg !185
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !186

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !187
  %call33 = call i32 @close(i32 %14), !dbg !189
  br label %if.end34, !dbg !190

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !191

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !192
  br label %if.end35

if.end35:                                         ; preds = %if.else, %if.end34
  %call36 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !194
  %tobool37 = icmp ne i32 %call36, 0, !dbg !194
  br i1 %tobool37, label %if.then38, label %if.else64, !dbg !196

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !197, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !201, metadata !DIExpression()), !dbg !202
  %call39 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !203
  %15 = bitcast i8* %call39 to i32*, !dbg !204
  store i32* %15, i32** %buffer, align 8, !dbg !202
  %16 = load i32*, i32** %buffer, align 8, !dbg !205
  %cmp40 = icmp eq i32* %16, null, !dbg !207
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !208

if.then42:                                        ; preds = %if.then38
  call void @exit(i32 -1) #11, !dbg !209
  unreachable, !dbg !209

if.end43:                                         ; preds = %if.then38
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !213

for.cond:                                         ; preds = %for.inc, %if.end43
  %17 = load i32, i32* %i, align 4, !dbg !214
  %cmp44 = icmp slt i32 %17, 10, !dbg !216
  br i1 %cmp44, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !218
  %19 = load i32, i32* %i, align 4, !dbg !220
  %idxprom46 = sext i32 %19 to i64, !dbg !218
  %arrayidx47 = getelementptr inbounds i32, i32* %18, i64 %idxprom46, !dbg !218
  store i32 0, i32* %arrayidx47, align 4, !dbg !221
  br label %for.inc, !dbg !222

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !223
  %inc = add nsw i32 %20, 1, !dbg !223
  store i32 %inc, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !224, !llvm.loop !225

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !228
  %cmp48 = icmp sge i32 %21, 0, !dbg !230
  br i1 %cmp48, label %if.then50, label %if.else62, !dbg !231

if.then50:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !232
  %23 = load i32, i32* %data, align 4, !dbg !234
  %idxprom51 = sext i32 %23 to i64, !dbg !232
  %arrayidx52 = getelementptr inbounds i32, i32* %22, i64 %idxprom51, !dbg !232
  store i32 1, i32* %arrayidx52, align 4, !dbg !235
  store i32 0, i32* %i, align 4, !dbg !236
  br label %for.cond53, !dbg !238

for.cond53:                                       ; preds = %for.inc59, %if.then50
  %24 = load i32, i32* %i, align 4, !dbg !239
  %cmp54 = icmp slt i32 %24, 10, !dbg !241
  br i1 %cmp54, label %for.body56, label %for.end61, !dbg !242

for.body56:                                       ; preds = %for.cond53
  %25 = load i32*, i32** %buffer, align 8, !dbg !243
  %26 = load i32, i32* %i, align 4, !dbg !245
  %idxprom57 = sext i32 %26 to i64, !dbg !243
  %arrayidx58 = getelementptr inbounds i32, i32* %25, i64 %idxprom57, !dbg !243
  %27 = load i32, i32* %arrayidx58, align 4, !dbg !243
  call void @printIntLine(i32 %27), !dbg !246
  br label %for.inc59, !dbg !247

for.inc59:                                        ; preds = %for.body56
  %28 = load i32, i32* %i, align 4, !dbg !248
  %inc60 = add nsw i32 %28, 1, !dbg !248
  store i32 %inc60, i32* %i, align 4, !dbg !248
  br label %for.cond53, !dbg !249, !llvm.loop !250

for.end61:                                        ; preds = %for.cond53
  br label %if.end63, !dbg !252

if.else62:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !253
  br label %if.end63

if.end63:                                         ; preds = %if.else62, %for.end61
  %29 = load i32*, i32** %buffer, align 8, !dbg !255
  %30 = bitcast i32* %29 to i8*, !dbg !255
  call void @free(i8* %30) #8, !dbg !256
  br label %if.end99, !dbg !257

if.else64:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i65, metadata !258, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32** %buffer66, metadata !262, metadata !DIExpression()), !dbg !263
  %call67 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !264
  %31 = bitcast i8* %call67 to i32*, !dbg !265
  store i32* %31, i32** %buffer66, align 8, !dbg !263
  %32 = load i32*, i32** %buffer66, align 8, !dbg !266
  %cmp68 = icmp eq i32* %32, null, !dbg !268
  br i1 %cmp68, label %if.then70, label %if.end71, !dbg !269

if.then70:                                        ; preds = %if.else64
  call void @exit(i32 -1) #11, !dbg !270
  unreachable, !dbg !270

if.end71:                                         ; preds = %if.else64
  store i32 0, i32* %i65, align 4, !dbg !272
  br label %for.cond72, !dbg !274

for.cond72:                                       ; preds = %for.inc78, %if.end71
  %33 = load i32, i32* %i65, align 4, !dbg !275
  %cmp73 = icmp slt i32 %33, 10, !dbg !277
  br i1 %cmp73, label %for.body75, label %for.end80, !dbg !278

for.body75:                                       ; preds = %for.cond72
  %34 = load i32*, i32** %buffer66, align 8, !dbg !279
  %35 = load i32, i32* %i65, align 4, !dbg !281
  %idxprom76 = sext i32 %35 to i64, !dbg !279
  %arrayidx77 = getelementptr inbounds i32, i32* %34, i64 %idxprom76, !dbg !279
  store i32 0, i32* %arrayidx77, align 4, !dbg !282
  br label %for.inc78, !dbg !283

for.inc78:                                        ; preds = %for.body75
  %36 = load i32, i32* %i65, align 4, !dbg !284
  %inc79 = add nsw i32 %36, 1, !dbg !284
  store i32 %inc79, i32* %i65, align 4, !dbg !284
  br label %for.cond72, !dbg !285, !llvm.loop !286

for.end80:                                        ; preds = %for.cond72
  %37 = load i32, i32* %data, align 4, !dbg !288
  %cmp81 = icmp sge i32 %37, 0, !dbg !290
  br i1 %cmp81, label %land.lhs.true, label %if.else97, !dbg !291

land.lhs.true:                                    ; preds = %for.end80
  %38 = load i32, i32* %data, align 4, !dbg !292
  %cmp83 = icmp slt i32 %38, 10, !dbg !293
  br i1 %cmp83, label %if.then85, label %if.else97, !dbg !294

if.then85:                                        ; preds = %land.lhs.true
  %39 = load i32*, i32** %buffer66, align 8, !dbg !295
  %40 = load i32, i32* %data, align 4, !dbg !297
  %idxprom86 = sext i32 %40 to i64, !dbg !295
  %arrayidx87 = getelementptr inbounds i32, i32* %39, i64 %idxprom86, !dbg !295
  store i32 1, i32* %arrayidx87, align 4, !dbg !298
  store i32 0, i32* %i65, align 4, !dbg !299
  br label %for.cond88, !dbg !301

for.cond88:                                       ; preds = %for.inc94, %if.then85
  %41 = load i32, i32* %i65, align 4, !dbg !302
  %cmp89 = icmp slt i32 %41, 10, !dbg !304
  br i1 %cmp89, label %for.body91, label %for.end96, !dbg !305

for.body91:                                       ; preds = %for.cond88
  %42 = load i32*, i32** %buffer66, align 8, !dbg !306
  %43 = load i32, i32* %i65, align 4, !dbg !308
  %idxprom92 = sext i32 %43 to i64, !dbg !306
  %arrayidx93 = getelementptr inbounds i32, i32* %42, i64 %idxprom92, !dbg !306
  %44 = load i32, i32* %arrayidx93, align 4, !dbg !306
  call void @printIntLine(i32 %44), !dbg !309
  br label %for.inc94, !dbg !310

for.inc94:                                        ; preds = %for.body91
  %45 = load i32, i32* %i65, align 4, !dbg !311
  %inc95 = add nsw i32 %45, 1, !dbg !311
  store i32 %inc95, i32* %i65, align 4, !dbg !311
  br label %for.cond88, !dbg !312, !llvm.loop !313

for.end96:                                        ; preds = %for.cond88
  br label %if.end98, !dbg !315

if.else97:                                        ; preds = %land.lhs.true, %for.end80
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !316
  br label %if.end98

if.end98:                                         ; preds = %if.else97, %for.end96
  %46 = load i32*, i32** %buffer66, align 8, !dbg !318
  %47 = bitcast i32* %46 to i8*, !dbg !318
  call void @free(i8* %47) #8, !dbg !319
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.end63
  ret void, !dbg !320
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

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_12_good() #0 !dbg !321 {
entry:
  call void @goodB2G(), !dbg !322
  call void @goodG2B(), !dbg !323
  ret void, !dbg !324
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !325 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !330, metadata !DIExpression()), !dbg !331
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !332, metadata !DIExpression()), !dbg !333
  %call = call i64 @time(i64* null) #8, !dbg !334
  %conv = trunc i64 %call to i32, !dbg !335
  call void @srand(i32 %conv) #8, !dbg !336
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !337
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_12_good(), !dbg !338
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !339
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !340
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_12_bad(), !dbg !341
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !342
  ret i32 0, !dbg !343
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !344 {
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
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i123 = alloca i32, align 4
  %buffer124 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !345, metadata !DIExpression()), !dbg !346
  store i32 -1, i32* %data, align 4, !dbg !347
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !348
  %tobool = icmp ne i32 %call, 0, !dbg !348
  br i1 %tobool, label %if.then, label %if.else, !dbg !350

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !351, metadata !DIExpression()), !dbg !354
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !355, metadata !DIExpression()), !dbg !356
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !357, metadata !DIExpression()), !dbg !358
  store i32 -1, i32* %listenSocket, align 4, !dbg !358
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !359, metadata !DIExpression()), !dbg !360
  store i32 -1, i32* %acceptSocket, align 4, !dbg !360
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !361, metadata !DIExpression()), !dbg !362
  br label %do.body, !dbg !363

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !364
  store i32 %call1, i32* %listenSocket, align 4, !dbg !366
  %0 = load i32, i32* %listenSocket, align 4, !dbg !367
  %cmp = icmp eq i32 %0, -1, !dbg !369
  br i1 %cmp, label %if.then2, label %if.end, !dbg !370

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !371

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !373
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !373
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !374
  store i16 2, i16* %sin_family, align 4, !dbg !375
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !376
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !377
  store i32 0, i32* %s_addr, align 4, !dbg !378
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !379
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !380
  store i16 %call3, i16* %sin_port, align 2, !dbg !381
  %2 = load i32, i32* %listenSocket, align 4, !dbg !382
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !384
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !385
  %cmp5 = icmp eq i32 %call4, -1, !dbg !386
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !387

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !388

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !390
  %call8 = call i32 @listen(i32 %4, i32 5) #8, !dbg !392
  %cmp9 = icmp eq i32 %call8, -1, !dbg !393
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !394

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !395

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !397
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !398
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !399
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !400
  %cmp13 = icmp eq i32 %6, -1, !dbg !402
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !403

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !404

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !406
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !407
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !408
  %conv = trunc i64 %call16 to i32, !dbg !408
  store i32 %conv, i32* %recvResult, align 4, !dbg !409
  %8 = load i32, i32* %recvResult, align 4, !dbg !410
  %cmp17 = icmp eq i32 %8, -1, !dbg !412
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !413

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !414
  %cmp19 = icmp eq i32 %9, 0, !dbg !415
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !416

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !417

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !419
  %idxprom = sext i32 %10 to i64, !dbg !420
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !420
  store i8 0, i8* %arrayidx, align 1, !dbg !421
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !422
  %call24 = call i32 @atoi(i8* %arraydecay23) #10, !dbg !423
  store i32 %call24, i32* %data, align 4, !dbg !424
  br label %do.end, !dbg !425

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !426
  %cmp25 = icmp ne i32 %11, -1, !dbg !428
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !429

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !430
  %call28 = call i32 @close(i32 %12), !dbg !432
  br label %if.end29, !dbg !433

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !434
  %cmp30 = icmp ne i32 %13, -1, !dbg !436
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !437

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !438
  %call33 = call i32 @close(i32 %14), !dbg !440
  br label %if.end34, !dbg !441

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end91, !dbg !442

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult35, metadata !443, metadata !DIExpression()), !dbg !446
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service36, metadata !447, metadata !DIExpression()), !dbg !448
  call void @llvm.dbg.declare(metadata i32* %listenSocket37, metadata !449, metadata !DIExpression()), !dbg !450
  store i32 -1, i32* %listenSocket37, align 4, !dbg !450
  call void @llvm.dbg.declare(metadata i32* %acceptSocket38, metadata !451, metadata !DIExpression()), !dbg !452
  store i32 -1, i32* %acceptSocket38, align 4, !dbg !452
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer39, metadata !453, metadata !DIExpression()), !dbg !454
  br label %do.body40, !dbg !455

do.body40:                                        ; preds = %if.else
  %call41 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !456
  store i32 %call41, i32* %listenSocket37, align 4, !dbg !458
  %15 = load i32, i32* %listenSocket37, align 4, !dbg !459
  %cmp42 = icmp eq i32 %15, -1, !dbg !461
  br i1 %cmp42, label %if.then44, label %if.end45, !dbg !462

if.then44:                                        ; preds = %do.body40
  br label %do.end80, !dbg !463

if.end45:                                         ; preds = %do.body40
  %16 = bitcast %struct.sockaddr_in* %service36 to i8*, !dbg !465
  call void @llvm.memset.p0i8.i64(i8* align 4 %16, i8 0, i64 16, i1 false), !dbg !465
  %sin_family46 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service36, i32 0, i32 0, !dbg !466
  store i16 2, i16* %sin_family46, align 4, !dbg !467
  %sin_addr47 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service36, i32 0, i32 2, !dbg !468
  %s_addr48 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr47, i32 0, i32 0, !dbg !469
  store i32 0, i32* %s_addr48, align 4, !dbg !470
  %call49 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !471
  %sin_port50 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service36, i32 0, i32 1, !dbg !472
  store i16 %call49, i16* %sin_port50, align 2, !dbg !473
  %17 = load i32, i32* %listenSocket37, align 4, !dbg !474
  %18 = bitcast %struct.sockaddr_in* %service36 to %struct.sockaddr*, !dbg !476
  %call51 = call i32 @bind(i32 %17, %struct.sockaddr* %18, i32 16) #8, !dbg !477
  %cmp52 = icmp eq i32 %call51, -1, !dbg !478
  br i1 %cmp52, label %if.then54, label %if.end55, !dbg !479

if.then54:                                        ; preds = %if.end45
  br label %do.end80, !dbg !480

if.end55:                                         ; preds = %if.end45
  %19 = load i32, i32* %listenSocket37, align 4, !dbg !482
  %call56 = call i32 @listen(i32 %19, i32 5) #8, !dbg !484
  %cmp57 = icmp eq i32 %call56, -1, !dbg !485
  br i1 %cmp57, label %if.then59, label %if.end60, !dbg !486

if.then59:                                        ; preds = %if.end55
  br label %do.end80, !dbg !487

if.end60:                                         ; preds = %if.end55
  %20 = load i32, i32* %listenSocket37, align 4, !dbg !489
  %call61 = call i32 @accept(i32 %20, %struct.sockaddr* null, i32* null), !dbg !490
  store i32 %call61, i32* %acceptSocket38, align 4, !dbg !491
  %21 = load i32, i32* %acceptSocket38, align 4, !dbg !492
  %cmp62 = icmp eq i32 %21, -1, !dbg !494
  br i1 %cmp62, label %if.then64, label %if.end65, !dbg !495

if.then64:                                        ; preds = %if.end60
  br label %do.end80, !dbg !496

if.end65:                                         ; preds = %if.end60
  %22 = load i32, i32* %acceptSocket38, align 4, !dbg !498
  %arraydecay66 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer39, i64 0, i64 0, !dbg !499
  %call67 = call i64 @recv(i32 %22, i8* %arraydecay66, i64 13, i32 0), !dbg !500
  %conv68 = trunc i64 %call67 to i32, !dbg !500
  store i32 %conv68, i32* %recvResult35, align 4, !dbg !501
  %23 = load i32, i32* %recvResult35, align 4, !dbg !502
  %cmp69 = icmp eq i32 %23, -1, !dbg !504
  br i1 %cmp69, label %if.then74, label %lor.lhs.false71, !dbg !505

lor.lhs.false71:                                  ; preds = %if.end65
  %24 = load i32, i32* %recvResult35, align 4, !dbg !506
  %cmp72 = icmp eq i32 %24, 0, !dbg !507
  br i1 %cmp72, label %if.then74, label %if.end75, !dbg !508

if.then74:                                        ; preds = %lor.lhs.false71, %if.end65
  br label %do.end80, !dbg !509

if.end75:                                         ; preds = %lor.lhs.false71
  %25 = load i32, i32* %recvResult35, align 4, !dbg !511
  %idxprom76 = sext i32 %25 to i64, !dbg !512
  %arrayidx77 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer39, i64 0, i64 %idxprom76, !dbg !512
  store i8 0, i8* %arrayidx77, align 1, !dbg !513
  %arraydecay78 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer39, i64 0, i64 0, !dbg !514
  %call79 = call i32 @atoi(i8* %arraydecay78) #10, !dbg !515
  store i32 %call79, i32* %data, align 4, !dbg !516
  br label %do.end80, !dbg !517

do.end80:                                         ; preds = %if.end75, %if.then74, %if.then64, %if.then59, %if.then54, %if.then44
  %26 = load i32, i32* %listenSocket37, align 4, !dbg !518
  %cmp81 = icmp ne i32 %26, -1, !dbg !520
  br i1 %cmp81, label %if.then83, label %if.end85, !dbg !521

if.then83:                                        ; preds = %do.end80
  %27 = load i32, i32* %listenSocket37, align 4, !dbg !522
  %call84 = call i32 @close(i32 %27), !dbg !524
  br label %if.end85, !dbg !525

if.end85:                                         ; preds = %if.then83, %do.end80
  %28 = load i32, i32* %acceptSocket38, align 4, !dbg !526
  %cmp86 = icmp ne i32 %28, -1, !dbg !528
  br i1 %cmp86, label %if.then88, label %if.end90, !dbg !529

if.then88:                                        ; preds = %if.end85
  %29 = load i32, i32* %acceptSocket38, align 4, !dbg !530
  %call89 = call i32 @close(i32 %29), !dbg !532
  br label %if.end90, !dbg !533

if.end90:                                         ; preds = %if.then88, %if.end85
  br label %if.end91

if.end91:                                         ; preds = %if.end90, %if.end34
  %call92 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !534
  %tobool93 = icmp ne i32 %call92, 0, !dbg !534
  br i1 %tobool93, label %if.then94, label %if.else122, !dbg !536

if.then94:                                        ; preds = %if.end91
  call void @llvm.dbg.declare(metadata i32* %i, metadata !537, metadata !DIExpression()), !dbg !540
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !541, metadata !DIExpression()), !dbg !542
  %call95 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !543
  %30 = bitcast i8* %call95 to i32*, !dbg !544
  store i32* %30, i32** %buffer, align 8, !dbg !542
  %31 = load i32*, i32** %buffer, align 8, !dbg !545
  %cmp96 = icmp eq i32* %31, null, !dbg !547
  br i1 %cmp96, label %if.then98, label %if.end99, !dbg !548

if.then98:                                        ; preds = %if.then94
  call void @exit(i32 -1) #11, !dbg !549
  unreachable, !dbg !549

if.end99:                                         ; preds = %if.then94
  store i32 0, i32* %i, align 4, !dbg !551
  br label %for.cond, !dbg !553

for.cond:                                         ; preds = %for.inc, %if.end99
  %32 = load i32, i32* %i, align 4, !dbg !554
  %cmp100 = icmp slt i32 %32, 10, !dbg !556
  br i1 %cmp100, label %for.body, label %for.end, !dbg !557

for.body:                                         ; preds = %for.cond
  %33 = load i32*, i32** %buffer, align 8, !dbg !558
  %34 = load i32, i32* %i, align 4, !dbg !560
  %idxprom102 = sext i32 %34 to i64, !dbg !558
  %arrayidx103 = getelementptr inbounds i32, i32* %33, i64 %idxprom102, !dbg !558
  store i32 0, i32* %arrayidx103, align 4, !dbg !561
  br label %for.inc, !dbg !562

for.inc:                                          ; preds = %for.body
  %35 = load i32, i32* %i, align 4, !dbg !563
  %inc = add nsw i32 %35, 1, !dbg !563
  store i32 %inc, i32* %i, align 4, !dbg !563
  br label %for.cond, !dbg !564, !llvm.loop !565

for.end:                                          ; preds = %for.cond
  %36 = load i32, i32* %data, align 4, !dbg !567
  %cmp104 = icmp sge i32 %36, 0, !dbg !569
  br i1 %cmp104, label %land.lhs.true, label %if.else120, !dbg !570

land.lhs.true:                                    ; preds = %for.end
  %37 = load i32, i32* %data, align 4, !dbg !571
  %cmp106 = icmp slt i32 %37, 10, !dbg !572
  br i1 %cmp106, label %if.then108, label %if.else120, !dbg !573

if.then108:                                       ; preds = %land.lhs.true
  %38 = load i32*, i32** %buffer, align 8, !dbg !574
  %39 = load i32, i32* %data, align 4, !dbg !576
  %idxprom109 = sext i32 %39 to i64, !dbg !574
  %arrayidx110 = getelementptr inbounds i32, i32* %38, i64 %idxprom109, !dbg !574
  store i32 1, i32* %arrayidx110, align 4, !dbg !577
  store i32 0, i32* %i, align 4, !dbg !578
  br label %for.cond111, !dbg !580

for.cond111:                                      ; preds = %for.inc117, %if.then108
  %40 = load i32, i32* %i, align 4, !dbg !581
  %cmp112 = icmp slt i32 %40, 10, !dbg !583
  br i1 %cmp112, label %for.body114, label %for.end119, !dbg !584

for.body114:                                      ; preds = %for.cond111
  %41 = load i32*, i32** %buffer, align 8, !dbg !585
  %42 = load i32, i32* %i, align 4, !dbg !587
  %idxprom115 = sext i32 %42 to i64, !dbg !585
  %arrayidx116 = getelementptr inbounds i32, i32* %41, i64 %idxprom115, !dbg !585
  %43 = load i32, i32* %arrayidx116, align 4, !dbg !585
  call void @printIntLine(i32 %43), !dbg !588
  br label %for.inc117, !dbg !589

for.inc117:                                       ; preds = %for.body114
  %44 = load i32, i32* %i, align 4, !dbg !590
  %inc118 = add nsw i32 %44, 1, !dbg !590
  store i32 %inc118, i32* %i, align 4, !dbg !590
  br label %for.cond111, !dbg !591, !llvm.loop !592

for.end119:                                       ; preds = %for.cond111
  br label %if.end121, !dbg !594

if.else120:                                       ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !595
  br label %if.end121

if.end121:                                        ; preds = %if.else120, %for.end119
  %45 = load i32*, i32** %buffer, align 8, !dbg !597
  %46 = bitcast i32* %45 to i8*, !dbg !597
  call void @free(i8* %46) #8, !dbg !598
  br label %if.end158, !dbg !599

if.else122:                                       ; preds = %if.end91
  call void @llvm.dbg.declare(metadata i32* %i123, metadata !600, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.declare(metadata i32** %buffer124, metadata !604, metadata !DIExpression()), !dbg !605
  %call125 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !606
  %47 = bitcast i8* %call125 to i32*, !dbg !607
  store i32* %47, i32** %buffer124, align 8, !dbg !605
  %48 = load i32*, i32** %buffer124, align 8, !dbg !608
  %cmp126 = icmp eq i32* %48, null, !dbg !610
  br i1 %cmp126, label %if.then128, label %if.end129, !dbg !611

if.then128:                                       ; preds = %if.else122
  call void @exit(i32 -1) #11, !dbg !612
  unreachable, !dbg !612

if.end129:                                        ; preds = %if.else122
  store i32 0, i32* %i123, align 4, !dbg !614
  br label %for.cond130, !dbg !616

for.cond130:                                      ; preds = %for.inc136, %if.end129
  %49 = load i32, i32* %i123, align 4, !dbg !617
  %cmp131 = icmp slt i32 %49, 10, !dbg !619
  br i1 %cmp131, label %for.body133, label %for.end138, !dbg !620

for.body133:                                      ; preds = %for.cond130
  %50 = load i32*, i32** %buffer124, align 8, !dbg !621
  %51 = load i32, i32* %i123, align 4, !dbg !623
  %idxprom134 = sext i32 %51 to i64, !dbg !621
  %arrayidx135 = getelementptr inbounds i32, i32* %50, i64 %idxprom134, !dbg !621
  store i32 0, i32* %arrayidx135, align 4, !dbg !624
  br label %for.inc136, !dbg !625

for.inc136:                                       ; preds = %for.body133
  %52 = load i32, i32* %i123, align 4, !dbg !626
  %inc137 = add nsw i32 %52, 1, !dbg !626
  store i32 %inc137, i32* %i123, align 4, !dbg !626
  br label %for.cond130, !dbg !627, !llvm.loop !628

for.end138:                                       ; preds = %for.cond130
  %53 = load i32, i32* %data, align 4, !dbg !630
  %cmp139 = icmp sge i32 %53, 0, !dbg !632
  br i1 %cmp139, label %land.lhs.true141, label %if.else156, !dbg !633

land.lhs.true141:                                 ; preds = %for.end138
  %54 = load i32, i32* %data, align 4, !dbg !634
  %cmp142 = icmp slt i32 %54, 10, !dbg !635
  br i1 %cmp142, label %if.then144, label %if.else156, !dbg !636

if.then144:                                       ; preds = %land.lhs.true141
  %55 = load i32*, i32** %buffer124, align 8, !dbg !637
  %56 = load i32, i32* %data, align 4, !dbg !639
  %idxprom145 = sext i32 %56 to i64, !dbg !637
  %arrayidx146 = getelementptr inbounds i32, i32* %55, i64 %idxprom145, !dbg !637
  store i32 1, i32* %arrayidx146, align 4, !dbg !640
  store i32 0, i32* %i123, align 4, !dbg !641
  br label %for.cond147, !dbg !643

for.cond147:                                      ; preds = %for.inc153, %if.then144
  %57 = load i32, i32* %i123, align 4, !dbg !644
  %cmp148 = icmp slt i32 %57, 10, !dbg !646
  br i1 %cmp148, label %for.body150, label %for.end155, !dbg !647

for.body150:                                      ; preds = %for.cond147
  %58 = load i32*, i32** %buffer124, align 8, !dbg !648
  %59 = load i32, i32* %i123, align 4, !dbg !650
  %idxprom151 = sext i32 %59 to i64, !dbg !648
  %arrayidx152 = getelementptr inbounds i32, i32* %58, i64 %idxprom151, !dbg !648
  %60 = load i32, i32* %arrayidx152, align 4, !dbg !648
  call void @printIntLine(i32 %60), !dbg !651
  br label %for.inc153, !dbg !652

for.inc153:                                       ; preds = %for.body150
  %61 = load i32, i32* %i123, align 4, !dbg !653
  %inc154 = add nsw i32 %61, 1, !dbg !653
  store i32 %inc154, i32* %i123, align 4, !dbg !653
  br label %for.cond147, !dbg !654, !llvm.loop !655

for.end155:                                       ; preds = %for.cond147
  br label %if.end157, !dbg !657

if.else156:                                       ; preds = %land.lhs.true141, %for.end138
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !658
  br label %if.end157

if.end157:                                        ; preds = %if.else156, %for.end155
  %62 = load i32*, i32** %buffer124, align 8, !dbg !660
  %63 = bitcast i32* %62 to i8*, !dbg !660
  call void @free(i8* %63) #8, !dbg !661
  br label %if.end158

if.end158:                                        ; preds = %if.end157, %if.end121
  ret void, !dbg !662
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !663 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i23 = alloca i32, align 4
  %buffer24 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !664, metadata !DIExpression()), !dbg !665
  store i32 -1, i32* %data, align 4, !dbg !666
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !667
  %tobool = icmp ne i32 %call, 0, !dbg !667
  br i1 %tobool, label %if.then, label %if.else, !dbg !669

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !670
  br label %if.end, !dbg !672

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !673
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !675
  %tobool2 = icmp ne i32 %call1, 0, !dbg !675
  br i1 %tobool2, label %if.then3, label %if.else22, !dbg !677

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !678, metadata !DIExpression()), !dbg !681
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !682, metadata !DIExpression()), !dbg !683
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !684
  %0 = bitcast i8* %call4 to i32*, !dbg !685
  store i32* %0, i32** %buffer, align 8, !dbg !683
  %1 = load i32*, i32** %buffer, align 8, !dbg !686
  %cmp = icmp eq i32* %1, null, !dbg !688
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !689

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #11, !dbg !690
  unreachable, !dbg !690

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !692
  br label %for.cond, !dbg !694

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !695
  %cmp7 = icmp slt i32 %2, 10, !dbg !697
  br i1 %cmp7, label %for.body, label %for.end, !dbg !698

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !699
  %4 = load i32, i32* %i, align 4, !dbg !701
  %idxprom = sext i32 %4 to i64, !dbg !699
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !699
  store i32 0, i32* %arrayidx, align 4, !dbg !702
  br label %for.inc, !dbg !703

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !704
  %inc = add nsw i32 %5, 1, !dbg !704
  store i32 %inc, i32* %i, align 4, !dbg !704
  br label %for.cond, !dbg !705, !llvm.loop !706

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !708
  %cmp8 = icmp sge i32 %6, 0, !dbg !710
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !711

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !712
  %8 = load i32, i32* %data, align 4, !dbg !714
  %idxprom10 = sext i32 %8 to i64, !dbg !712
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !712
  store i32 1, i32* %arrayidx11, align 4, !dbg !715
  store i32 0, i32* %i, align 4, !dbg !716
  br label %for.cond12, !dbg !718

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !719
  %cmp13 = icmp slt i32 %9, 10, !dbg !721
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !722

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !723
  %11 = load i32, i32* %i, align 4, !dbg !725
  %idxprom15 = sext i32 %11 to i64, !dbg !723
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !723
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !723
  call void @printIntLine(i32 %12), !dbg !726
  br label %for.inc17, !dbg !727

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !728
  %inc18 = add nsw i32 %13, 1, !dbg !728
  store i32 %inc18, i32* %i, align 4, !dbg !728
  br label %for.cond12, !dbg !729, !llvm.loop !730

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !732

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !733
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !735
  %15 = bitcast i32* %14 to i8*, !dbg !735
  call void @free(i8* %15) #8, !dbg !736
  br label %if.end51, !dbg !737

if.else22:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !738, metadata !DIExpression()), !dbg !741
  call void @llvm.dbg.declare(metadata i32** %buffer24, metadata !742, metadata !DIExpression()), !dbg !743
  %call25 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !744
  %16 = bitcast i8* %call25 to i32*, !dbg !745
  store i32* %16, i32** %buffer24, align 8, !dbg !743
  %17 = load i32*, i32** %buffer24, align 8, !dbg !746
  %cmp26 = icmp eq i32* %17, null, !dbg !748
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !749

if.then27:                                        ; preds = %if.else22
  call void @exit(i32 -1) #11, !dbg !750
  unreachable, !dbg !750

if.end28:                                         ; preds = %if.else22
  store i32 0, i32* %i23, align 4, !dbg !752
  br label %for.cond29, !dbg !754

for.cond29:                                       ; preds = %for.inc34, %if.end28
  %18 = load i32, i32* %i23, align 4, !dbg !755
  %cmp30 = icmp slt i32 %18, 10, !dbg !757
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !758

for.body31:                                       ; preds = %for.cond29
  %19 = load i32*, i32** %buffer24, align 8, !dbg !759
  %20 = load i32, i32* %i23, align 4, !dbg !761
  %idxprom32 = sext i32 %20 to i64, !dbg !759
  %arrayidx33 = getelementptr inbounds i32, i32* %19, i64 %idxprom32, !dbg !759
  store i32 0, i32* %arrayidx33, align 4, !dbg !762
  br label %for.inc34, !dbg !763

for.inc34:                                        ; preds = %for.body31
  %21 = load i32, i32* %i23, align 4, !dbg !764
  %inc35 = add nsw i32 %21, 1, !dbg !764
  store i32 %inc35, i32* %i23, align 4, !dbg !764
  br label %for.cond29, !dbg !765, !llvm.loop !766

for.end36:                                        ; preds = %for.cond29
  %22 = load i32, i32* %data, align 4, !dbg !768
  %cmp37 = icmp sge i32 %22, 0, !dbg !770
  br i1 %cmp37, label %if.then38, label %if.else49, !dbg !771

if.then38:                                        ; preds = %for.end36
  %23 = load i32*, i32** %buffer24, align 8, !dbg !772
  %24 = load i32, i32* %data, align 4, !dbg !774
  %idxprom39 = sext i32 %24 to i64, !dbg !772
  %arrayidx40 = getelementptr inbounds i32, i32* %23, i64 %idxprom39, !dbg !772
  store i32 1, i32* %arrayidx40, align 4, !dbg !775
  store i32 0, i32* %i23, align 4, !dbg !776
  br label %for.cond41, !dbg !778

for.cond41:                                       ; preds = %for.inc46, %if.then38
  %25 = load i32, i32* %i23, align 4, !dbg !779
  %cmp42 = icmp slt i32 %25, 10, !dbg !781
  br i1 %cmp42, label %for.body43, label %for.end48, !dbg !782

for.body43:                                       ; preds = %for.cond41
  %26 = load i32*, i32** %buffer24, align 8, !dbg !783
  %27 = load i32, i32* %i23, align 4, !dbg !785
  %idxprom44 = sext i32 %27 to i64, !dbg !783
  %arrayidx45 = getelementptr inbounds i32, i32* %26, i64 %idxprom44, !dbg !783
  %28 = load i32, i32* %arrayidx45, align 4, !dbg !783
  call void @printIntLine(i32 %28), !dbg !786
  br label %for.inc46, !dbg !787

for.inc46:                                        ; preds = %for.body43
  %29 = load i32, i32* %i23, align 4, !dbg !788
  %inc47 = add nsw i32 %29, 1, !dbg !788
  store i32 %inc47, i32* %i23, align 4, !dbg !788
  br label %for.cond41, !dbg !789, !llvm.loop !790

for.end48:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !792

if.else49:                                        ; preds = %for.end36
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !793
  br label %if.end50

if.end50:                                         ; preds = %if.else49, %for.end48
  %30 = load i32*, i32** %buffer24, align 8, !dbg !795
  %31 = bitcast i32* %30 to i8*, !dbg !795
  call void @free(i8* %31) #8, !dbg !796
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end21
  ret void, !dbg !797
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { nounwind readnone willreturn }
attributes #10 = { nounwind readonly willreturn }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!67, !68, !69, !70, !71}
!llvm.ident = !{!72}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_12.c", directory: "/root/SSE-Assessment")
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
!45 = !{!46, !51, !64, !66, !5}
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
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!67 = !{i32 7, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 3}
!69 = !{i32 1, !"wchar_size", i32 4}
!70 = !{i32 7, !"uwtable", i32 1}
!71 = !{i32 7, !"frame-pointer", i32 2}
!72 = !{!"clang version 13.0.0"}
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_12_bad", scope: !74, file: !74, line: 44, type: !75, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_12.c", directory: "/root/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 46, type: !65)
!79 = !DILocation(line: 46, column: 9, scope: !73)
!80 = !DILocation(line: 48, column: 10, scope: !73)
!81 = !DILocation(line: 49, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !73, file: !74, line: 49, column: 8)
!83 = !DILocation(line: 49, column: 8, scope: !73)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !74, line: 56, type: !65)
!85 = distinct !DILexicalBlock(scope: !86, file: !74, line: 51, column: 9)
!86 = distinct !DILexicalBlock(scope: !82, file: !74, line: 50, column: 5)
!87 = !DILocation(line: 56, column: 17, scope: !85)
!88 = !DILocalVariable(name: "service", scope: !85, file: !74, line: 57, type: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !90)
!90 = !{!91, !92, !96, !100}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !89, file: !17, line: 239, baseType: !56, size: 16)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !89, file: !17, line: 240, baseType: !93, size: 16, offset: 16)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !89, file: !17, line: 241, baseType: !97, size: 32, offset: 32)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !98)
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !97, file: !17, line: 33, baseType: !46, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !89, file: !17, line: 244, baseType: !101, size: 64, offset: 64)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 64, elements: !103)
!102 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!103 = !{!104}
!104 = !DISubrange(count: 8)
!105 = !DILocation(line: 57, column: 32, scope: !85)
!106 = !DILocalVariable(name: "listenSocket", scope: !85, file: !74, line: 58, type: !65)
!107 = !DILocation(line: 58, column: 20, scope: !85)
!108 = !DILocalVariable(name: "acceptSocket", scope: !85, file: !74, line: 59, type: !65)
!109 = !DILocation(line: 59, column: 20, scope: !85)
!110 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !74, line: 60, type: !60)
!111 = !DILocation(line: 60, column: 18, scope: !85)
!112 = !DILocation(line: 61, column: 13, scope: !85)
!113 = !DILocation(line: 71, column: 32, scope: !114)
!114 = distinct !DILexicalBlock(scope: !85, file: !74, line: 62, column: 13)
!115 = !DILocation(line: 71, column: 30, scope: !114)
!116 = !DILocation(line: 72, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !74, line: 72, column: 21)
!118 = !DILocation(line: 72, column: 34, scope: !117)
!119 = !DILocation(line: 72, column: 21, scope: !114)
!120 = !DILocation(line: 74, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !74, line: 73, column: 17)
!122 = !DILocation(line: 76, column: 17, scope: !114)
!123 = !DILocation(line: 77, column: 25, scope: !114)
!124 = !DILocation(line: 77, column: 36, scope: !114)
!125 = !DILocation(line: 78, column: 25, scope: !114)
!126 = !DILocation(line: 78, column: 34, scope: !114)
!127 = !DILocation(line: 78, column: 41, scope: !114)
!128 = !DILocation(line: 79, column: 36, scope: !114)
!129 = !DILocation(line: 79, column: 25, scope: !114)
!130 = !DILocation(line: 79, column: 34, scope: !114)
!131 = !DILocation(line: 80, column: 26, scope: !132)
!132 = distinct !DILexicalBlock(scope: !114, file: !74, line: 80, column: 21)
!133 = !DILocation(line: 80, column: 40, scope: !132)
!134 = !DILocation(line: 80, column: 21, scope: !132)
!135 = !DILocation(line: 80, column: 85, scope: !132)
!136 = !DILocation(line: 80, column: 21, scope: !114)
!137 = !DILocation(line: 82, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !74, line: 81, column: 17)
!139 = !DILocation(line: 84, column: 28, scope: !140)
!140 = distinct !DILexicalBlock(scope: !114, file: !74, line: 84, column: 21)
!141 = !DILocation(line: 84, column: 21, scope: !140)
!142 = !DILocation(line: 84, column: 58, scope: !140)
!143 = !DILocation(line: 84, column: 21, scope: !114)
!144 = !DILocation(line: 86, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !74, line: 85, column: 17)
!146 = !DILocation(line: 88, column: 39, scope: !114)
!147 = !DILocation(line: 88, column: 32, scope: !114)
!148 = !DILocation(line: 88, column: 30, scope: !114)
!149 = !DILocation(line: 89, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !114, file: !74, line: 89, column: 21)
!151 = !DILocation(line: 89, column: 34, scope: !150)
!152 = !DILocation(line: 89, column: 21, scope: !114)
!153 = !DILocation(line: 91, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !74, line: 90, column: 17)
!155 = !DILocation(line: 94, column: 35, scope: !114)
!156 = !DILocation(line: 94, column: 49, scope: !114)
!157 = !DILocation(line: 94, column: 30, scope: !114)
!158 = !DILocation(line: 94, column: 28, scope: !114)
!159 = !DILocation(line: 95, column: 21, scope: !160)
!160 = distinct !DILexicalBlock(scope: !114, file: !74, line: 95, column: 21)
!161 = !DILocation(line: 95, column: 32, scope: !160)
!162 = !DILocation(line: 95, column: 48, scope: !160)
!163 = !DILocation(line: 95, column: 51, scope: !160)
!164 = !DILocation(line: 95, column: 62, scope: !160)
!165 = !DILocation(line: 95, column: 21, scope: !114)
!166 = !DILocation(line: 97, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !160, file: !74, line: 96, column: 17)
!168 = !DILocation(line: 100, column: 29, scope: !114)
!169 = !DILocation(line: 100, column: 17, scope: !114)
!170 = !DILocation(line: 100, column: 41, scope: !114)
!171 = !DILocation(line: 102, column: 29, scope: !114)
!172 = !DILocation(line: 102, column: 24, scope: !114)
!173 = !DILocation(line: 102, column: 22, scope: !114)
!174 = !DILocation(line: 103, column: 13, scope: !114)
!175 = !DILocation(line: 105, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !85, file: !74, line: 105, column: 17)
!177 = !DILocation(line: 105, column: 30, scope: !176)
!178 = !DILocation(line: 105, column: 17, scope: !85)
!179 = !DILocation(line: 107, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !74, line: 106, column: 13)
!181 = !DILocation(line: 107, column: 17, scope: !180)
!182 = !DILocation(line: 108, column: 13, scope: !180)
!183 = !DILocation(line: 109, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !85, file: !74, line: 109, column: 17)
!185 = !DILocation(line: 109, column: 30, scope: !184)
!186 = !DILocation(line: 109, column: 17, scope: !85)
!187 = !DILocation(line: 111, column: 30, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !74, line: 110, column: 13)
!189 = !DILocation(line: 111, column: 17, scope: !188)
!190 = !DILocation(line: 112, column: 13, scope: !188)
!191 = !DILocation(line: 120, column: 5, scope: !86)
!192 = !DILocation(line: 125, column: 14, scope: !193)
!193 = distinct !DILexicalBlock(scope: !82, file: !74, line: 122, column: 5)
!194 = !DILocation(line: 127, column: 8, scope: !195)
!195 = distinct !DILexicalBlock(scope: !73, file: !74, line: 127, column: 8)
!196 = !DILocation(line: 127, column: 8, scope: !73)
!197 = !DILocalVariable(name: "i", scope: !198, file: !74, line: 130, type: !65)
!198 = distinct !DILexicalBlock(scope: !199, file: !74, line: 129, column: 9)
!199 = distinct !DILexicalBlock(scope: !195, file: !74, line: 128, column: 5)
!200 = !DILocation(line: 130, column: 17, scope: !198)
!201 = !DILocalVariable(name: "buffer", scope: !198, file: !74, line: 131, type: !64)
!202 = !DILocation(line: 131, column: 19, scope: !198)
!203 = !DILocation(line: 131, column: 35, scope: !198)
!204 = !DILocation(line: 131, column: 28, scope: !198)
!205 = !DILocation(line: 132, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !198, file: !74, line: 132, column: 17)
!207 = !DILocation(line: 132, column: 24, scope: !206)
!208 = !DILocation(line: 132, column: 17, scope: !198)
!209 = !DILocation(line: 132, column: 34, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !74, line: 132, column: 33)
!211 = !DILocation(line: 134, column: 20, scope: !212)
!212 = distinct !DILexicalBlock(scope: !198, file: !74, line: 134, column: 13)
!213 = !DILocation(line: 134, column: 18, scope: !212)
!214 = !DILocation(line: 134, column: 25, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !74, line: 134, column: 13)
!216 = !DILocation(line: 134, column: 27, scope: !215)
!217 = !DILocation(line: 134, column: 13, scope: !212)
!218 = !DILocation(line: 136, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !74, line: 135, column: 13)
!220 = !DILocation(line: 136, column: 24, scope: !219)
!221 = !DILocation(line: 136, column: 27, scope: !219)
!222 = !DILocation(line: 137, column: 13, scope: !219)
!223 = !DILocation(line: 134, column: 34, scope: !215)
!224 = !DILocation(line: 134, column: 13, scope: !215)
!225 = distinct !{!225, !217, !226, !227}
!226 = !DILocation(line: 137, column: 13, scope: !212)
!227 = !{!"llvm.loop.mustprogress"}
!228 = !DILocation(line: 140, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !198, file: !74, line: 140, column: 17)
!230 = !DILocation(line: 140, column: 22, scope: !229)
!231 = !DILocation(line: 140, column: 17, scope: !198)
!232 = !DILocation(line: 142, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !74, line: 141, column: 13)
!234 = !DILocation(line: 142, column: 24, scope: !233)
!235 = !DILocation(line: 142, column: 30, scope: !233)
!236 = !DILocation(line: 144, column: 23, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !74, line: 144, column: 17)
!238 = !DILocation(line: 144, column: 21, scope: !237)
!239 = !DILocation(line: 144, column: 28, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !74, line: 144, column: 17)
!241 = !DILocation(line: 144, column: 30, scope: !240)
!242 = !DILocation(line: 144, column: 17, scope: !237)
!243 = !DILocation(line: 146, column: 34, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !74, line: 145, column: 17)
!245 = !DILocation(line: 146, column: 41, scope: !244)
!246 = !DILocation(line: 146, column: 21, scope: !244)
!247 = !DILocation(line: 147, column: 17, scope: !244)
!248 = !DILocation(line: 144, column: 37, scope: !240)
!249 = !DILocation(line: 144, column: 17, scope: !240)
!250 = distinct !{!250, !242, !251, !227}
!251 = !DILocation(line: 147, column: 17, scope: !237)
!252 = !DILocation(line: 148, column: 13, scope: !233)
!253 = !DILocation(line: 151, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !229, file: !74, line: 150, column: 13)
!255 = !DILocation(line: 153, column: 18, scope: !198)
!256 = !DILocation(line: 153, column: 13, scope: !198)
!257 = !DILocation(line: 155, column: 5, scope: !199)
!258 = !DILocalVariable(name: "i", scope: !259, file: !74, line: 159, type: !65)
!259 = distinct !DILexicalBlock(scope: !260, file: !74, line: 158, column: 9)
!260 = distinct !DILexicalBlock(scope: !195, file: !74, line: 157, column: 5)
!261 = !DILocation(line: 159, column: 17, scope: !259)
!262 = !DILocalVariable(name: "buffer", scope: !259, file: !74, line: 160, type: !64)
!263 = !DILocation(line: 160, column: 19, scope: !259)
!264 = !DILocation(line: 160, column: 35, scope: !259)
!265 = !DILocation(line: 160, column: 28, scope: !259)
!266 = !DILocation(line: 161, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !259, file: !74, line: 161, column: 17)
!268 = !DILocation(line: 161, column: 24, scope: !267)
!269 = !DILocation(line: 161, column: 17, scope: !259)
!270 = !DILocation(line: 161, column: 34, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !74, line: 161, column: 33)
!272 = !DILocation(line: 163, column: 20, scope: !273)
!273 = distinct !DILexicalBlock(scope: !259, file: !74, line: 163, column: 13)
!274 = !DILocation(line: 163, column: 18, scope: !273)
!275 = !DILocation(line: 163, column: 25, scope: !276)
!276 = distinct !DILexicalBlock(scope: !273, file: !74, line: 163, column: 13)
!277 = !DILocation(line: 163, column: 27, scope: !276)
!278 = !DILocation(line: 163, column: 13, scope: !273)
!279 = !DILocation(line: 165, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !74, line: 164, column: 13)
!281 = !DILocation(line: 165, column: 24, scope: !280)
!282 = !DILocation(line: 165, column: 27, scope: !280)
!283 = !DILocation(line: 166, column: 13, scope: !280)
!284 = !DILocation(line: 163, column: 34, scope: !276)
!285 = !DILocation(line: 163, column: 13, scope: !276)
!286 = distinct !{!286, !278, !287, !227}
!287 = !DILocation(line: 166, column: 13, scope: !273)
!288 = !DILocation(line: 168, column: 17, scope: !289)
!289 = distinct !DILexicalBlock(scope: !259, file: !74, line: 168, column: 17)
!290 = !DILocation(line: 168, column: 22, scope: !289)
!291 = !DILocation(line: 168, column: 27, scope: !289)
!292 = !DILocation(line: 168, column: 30, scope: !289)
!293 = !DILocation(line: 168, column: 35, scope: !289)
!294 = !DILocation(line: 168, column: 17, scope: !259)
!295 = !DILocation(line: 170, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !289, file: !74, line: 169, column: 13)
!297 = !DILocation(line: 170, column: 24, scope: !296)
!298 = !DILocation(line: 170, column: 30, scope: !296)
!299 = !DILocation(line: 172, column: 23, scope: !300)
!300 = distinct !DILexicalBlock(scope: !296, file: !74, line: 172, column: 17)
!301 = !DILocation(line: 172, column: 21, scope: !300)
!302 = !DILocation(line: 172, column: 28, scope: !303)
!303 = distinct !DILexicalBlock(scope: !300, file: !74, line: 172, column: 17)
!304 = !DILocation(line: 172, column: 30, scope: !303)
!305 = !DILocation(line: 172, column: 17, scope: !300)
!306 = !DILocation(line: 174, column: 34, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !74, line: 173, column: 17)
!308 = !DILocation(line: 174, column: 41, scope: !307)
!309 = !DILocation(line: 174, column: 21, scope: !307)
!310 = !DILocation(line: 175, column: 17, scope: !307)
!311 = !DILocation(line: 172, column: 37, scope: !303)
!312 = !DILocation(line: 172, column: 17, scope: !303)
!313 = distinct !{!313, !305, !314, !227}
!314 = !DILocation(line: 175, column: 17, scope: !300)
!315 = !DILocation(line: 176, column: 13, scope: !296)
!316 = !DILocation(line: 179, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !289, file: !74, line: 178, column: 13)
!318 = !DILocation(line: 181, column: 18, scope: !259)
!319 = !DILocation(line: 181, column: 13, scope: !259)
!320 = !DILocation(line: 184, column: 1, scope: !73)
!321 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_12_good", scope: !74, file: !74, line: 480, type: !75, scopeLine: 481, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!322 = !DILocation(line: 482, column: 5, scope: !321)
!323 = !DILocation(line: 483, column: 5, scope: !321)
!324 = !DILocation(line: 484, column: 1, scope: !321)
!325 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 495, type: !326, scopeLine: 496, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!326 = !DISubroutineType(types: !327)
!327 = !{!65, !65, !328}
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !329, size: 64)
!329 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!330 = !DILocalVariable(name: "argc", arg: 1, scope: !325, file: !74, line: 495, type: !65)
!331 = !DILocation(line: 495, column: 14, scope: !325)
!332 = !DILocalVariable(name: "argv", arg: 2, scope: !325, file: !74, line: 495, type: !328)
!333 = !DILocation(line: 495, column: 27, scope: !325)
!334 = !DILocation(line: 498, column: 22, scope: !325)
!335 = !DILocation(line: 498, column: 12, scope: !325)
!336 = !DILocation(line: 498, column: 5, scope: !325)
!337 = !DILocation(line: 500, column: 5, scope: !325)
!338 = !DILocation(line: 501, column: 5, scope: !325)
!339 = !DILocation(line: 502, column: 5, scope: !325)
!340 = !DILocation(line: 505, column: 5, scope: !325)
!341 = !DILocation(line: 506, column: 5, scope: !325)
!342 = !DILocation(line: 507, column: 5, scope: !325)
!343 = !DILocation(line: 509, column: 5, scope: !325)
!344 = distinct !DISubprogram(name: "goodB2G", scope: !74, file: !74, line: 193, type: !75, scopeLine: 194, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!345 = !DILocalVariable(name: "data", scope: !344, file: !74, line: 195, type: !65)
!346 = !DILocation(line: 195, column: 9, scope: !344)
!347 = !DILocation(line: 197, column: 10, scope: !344)
!348 = !DILocation(line: 198, column: 8, scope: !349)
!349 = distinct !DILexicalBlock(scope: !344, file: !74, line: 198, column: 8)
!350 = !DILocation(line: 198, column: 8, scope: !344)
!351 = !DILocalVariable(name: "recvResult", scope: !352, file: !74, line: 205, type: !65)
!352 = distinct !DILexicalBlock(scope: !353, file: !74, line: 200, column: 9)
!353 = distinct !DILexicalBlock(scope: !349, file: !74, line: 199, column: 5)
!354 = !DILocation(line: 205, column: 17, scope: !352)
!355 = !DILocalVariable(name: "service", scope: !352, file: !74, line: 206, type: !89)
!356 = !DILocation(line: 206, column: 32, scope: !352)
!357 = !DILocalVariable(name: "listenSocket", scope: !352, file: !74, line: 207, type: !65)
!358 = !DILocation(line: 207, column: 20, scope: !352)
!359 = !DILocalVariable(name: "acceptSocket", scope: !352, file: !74, line: 208, type: !65)
!360 = !DILocation(line: 208, column: 20, scope: !352)
!361 = !DILocalVariable(name: "inputBuffer", scope: !352, file: !74, line: 209, type: !60)
!362 = !DILocation(line: 209, column: 18, scope: !352)
!363 = !DILocation(line: 210, column: 13, scope: !352)
!364 = !DILocation(line: 220, column: 32, scope: !365)
!365 = distinct !DILexicalBlock(scope: !352, file: !74, line: 211, column: 13)
!366 = !DILocation(line: 220, column: 30, scope: !365)
!367 = !DILocation(line: 221, column: 21, scope: !368)
!368 = distinct !DILexicalBlock(scope: !365, file: !74, line: 221, column: 21)
!369 = !DILocation(line: 221, column: 34, scope: !368)
!370 = !DILocation(line: 221, column: 21, scope: !365)
!371 = !DILocation(line: 223, column: 21, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !74, line: 222, column: 17)
!373 = !DILocation(line: 225, column: 17, scope: !365)
!374 = !DILocation(line: 226, column: 25, scope: !365)
!375 = !DILocation(line: 226, column: 36, scope: !365)
!376 = !DILocation(line: 227, column: 25, scope: !365)
!377 = !DILocation(line: 227, column: 34, scope: !365)
!378 = !DILocation(line: 227, column: 41, scope: !365)
!379 = !DILocation(line: 228, column: 36, scope: !365)
!380 = !DILocation(line: 228, column: 25, scope: !365)
!381 = !DILocation(line: 228, column: 34, scope: !365)
!382 = !DILocation(line: 229, column: 26, scope: !383)
!383 = distinct !DILexicalBlock(scope: !365, file: !74, line: 229, column: 21)
!384 = !DILocation(line: 229, column: 40, scope: !383)
!385 = !DILocation(line: 229, column: 21, scope: !383)
!386 = !DILocation(line: 229, column: 85, scope: !383)
!387 = !DILocation(line: 229, column: 21, scope: !365)
!388 = !DILocation(line: 231, column: 21, scope: !389)
!389 = distinct !DILexicalBlock(scope: !383, file: !74, line: 230, column: 17)
!390 = !DILocation(line: 233, column: 28, scope: !391)
!391 = distinct !DILexicalBlock(scope: !365, file: !74, line: 233, column: 21)
!392 = !DILocation(line: 233, column: 21, scope: !391)
!393 = !DILocation(line: 233, column: 58, scope: !391)
!394 = !DILocation(line: 233, column: 21, scope: !365)
!395 = !DILocation(line: 235, column: 21, scope: !396)
!396 = distinct !DILexicalBlock(scope: !391, file: !74, line: 234, column: 17)
!397 = !DILocation(line: 237, column: 39, scope: !365)
!398 = !DILocation(line: 237, column: 32, scope: !365)
!399 = !DILocation(line: 237, column: 30, scope: !365)
!400 = !DILocation(line: 238, column: 21, scope: !401)
!401 = distinct !DILexicalBlock(scope: !365, file: !74, line: 238, column: 21)
!402 = !DILocation(line: 238, column: 34, scope: !401)
!403 = !DILocation(line: 238, column: 21, scope: !365)
!404 = !DILocation(line: 240, column: 21, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !74, line: 239, column: 17)
!406 = !DILocation(line: 243, column: 35, scope: !365)
!407 = !DILocation(line: 243, column: 49, scope: !365)
!408 = !DILocation(line: 243, column: 30, scope: !365)
!409 = !DILocation(line: 243, column: 28, scope: !365)
!410 = !DILocation(line: 244, column: 21, scope: !411)
!411 = distinct !DILexicalBlock(scope: !365, file: !74, line: 244, column: 21)
!412 = !DILocation(line: 244, column: 32, scope: !411)
!413 = !DILocation(line: 244, column: 48, scope: !411)
!414 = !DILocation(line: 244, column: 51, scope: !411)
!415 = !DILocation(line: 244, column: 62, scope: !411)
!416 = !DILocation(line: 244, column: 21, scope: !365)
!417 = !DILocation(line: 246, column: 21, scope: !418)
!418 = distinct !DILexicalBlock(scope: !411, file: !74, line: 245, column: 17)
!419 = !DILocation(line: 249, column: 29, scope: !365)
!420 = !DILocation(line: 249, column: 17, scope: !365)
!421 = !DILocation(line: 249, column: 41, scope: !365)
!422 = !DILocation(line: 251, column: 29, scope: !365)
!423 = !DILocation(line: 251, column: 24, scope: !365)
!424 = !DILocation(line: 251, column: 22, scope: !365)
!425 = !DILocation(line: 252, column: 13, scope: !365)
!426 = !DILocation(line: 254, column: 17, scope: !427)
!427 = distinct !DILexicalBlock(scope: !352, file: !74, line: 254, column: 17)
!428 = !DILocation(line: 254, column: 30, scope: !427)
!429 = !DILocation(line: 254, column: 17, scope: !352)
!430 = !DILocation(line: 256, column: 30, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !74, line: 255, column: 13)
!432 = !DILocation(line: 256, column: 17, scope: !431)
!433 = !DILocation(line: 257, column: 13, scope: !431)
!434 = !DILocation(line: 258, column: 17, scope: !435)
!435 = distinct !DILexicalBlock(scope: !352, file: !74, line: 258, column: 17)
!436 = !DILocation(line: 258, column: 30, scope: !435)
!437 = !DILocation(line: 258, column: 17, scope: !352)
!438 = !DILocation(line: 260, column: 30, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !74, line: 259, column: 13)
!440 = !DILocation(line: 260, column: 17, scope: !439)
!441 = !DILocation(line: 261, column: 13, scope: !439)
!442 = !DILocation(line: 269, column: 5, scope: !353)
!443 = !DILocalVariable(name: "recvResult", scope: !444, file: !74, line: 277, type: !65)
!444 = distinct !DILexicalBlock(scope: !445, file: !74, line: 272, column: 9)
!445 = distinct !DILexicalBlock(scope: !349, file: !74, line: 271, column: 5)
!446 = !DILocation(line: 277, column: 17, scope: !444)
!447 = !DILocalVariable(name: "service", scope: !444, file: !74, line: 278, type: !89)
!448 = !DILocation(line: 278, column: 32, scope: !444)
!449 = !DILocalVariable(name: "listenSocket", scope: !444, file: !74, line: 279, type: !65)
!450 = !DILocation(line: 279, column: 20, scope: !444)
!451 = !DILocalVariable(name: "acceptSocket", scope: !444, file: !74, line: 280, type: !65)
!452 = !DILocation(line: 280, column: 20, scope: !444)
!453 = !DILocalVariable(name: "inputBuffer", scope: !444, file: !74, line: 281, type: !60)
!454 = !DILocation(line: 281, column: 18, scope: !444)
!455 = !DILocation(line: 282, column: 13, scope: !444)
!456 = !DILocation(line: 292, column: 32, scope: !457)
!457 = distinct !DILexicalBlock(scope: !444, file: !74, line: 283, column: 13)
!458 = !DILocation(line: 292, column: 30, scope: !457)
!459 = !DILocation(line: 293, column: 21, scope: !460)
!460 = distinct !DILexicalBlock(scope: !457, file: !74, line: 293, column: 21)
!461 = !DILocation(line: 293, column: 34, scope: !460)
!462 = !DILocation(line: 293, column: 21, scope: !457)
!463 = !DILocation(line: 295, column: 21, scope: !464)
!464 = distinct !DILexicalBlock(scope: !460, file: !74, line: 294, column: 17)
!465 = !DILocation(line: 297, column: 17, scope: !457)
!466 = !DILocation(line: 298, column: 25, scope: !457)
!467 = !DILocation(line: 298, column: 36, scope: !457)
!468 = !DILocation(line: 299, column: 25, scope: !457)
!469 = !DILocation(line: 299, column: 34, scope: !457)
!470 = !DILocation(line: 299, column: 41, scope: !457)
!471 = !DILocation(line: 300, column: 36, scope: !457)
!472 = !DILocation(line: 300, column: 25, scope: !457)
!473 = !DILocation(line: 300, column: 34, scope: !457)
!474 = !DILocation(line: 301, column: 26, scope: !475)
!475 = distinct !DILexicalBlock(scope: !457, file: !74, line: 301, column: 21)
!476 = !DILocation(line: 301, column: 40, scope: !475)
!477 = !DILocation(line: 301, column: 21, scope: !475)
!478 = !DILocation(line: 301, column: 85, scope: !475)
!479 = !DILocation(line: 301, column: 21, scope: !457)
!480 = !DILocation(line: 303, column: 21, scope: !481)
!481 = distinct !DILexicalBlock(scope: !475, file: !74, line: 302, column: 17)
!482 = !DILocation(line: 305, column: 28, scope: !483)
!483 = distinct !DILexicalBlock(scope: !457, file: !74, line: 305, column: 21)
!484 = !DILocation(line: 305, column: 21, scope: !483)
!485 = !DILocation(line: 305, column: 58, scope: !483)
!486 = !DILocation(line: 305, column: 21, scope: !457)
!487 = !DILocation(line: 307, column: 21, scope: !488)
!488 = distinct !DILexicalBlock(scope: !483, file: !74, line: 306, column: 17)
!489 = !DILocation(line: 309, column: 39, scope: !457)
!490 = !DILocation(line: 309, column: 32, scope: !457)
!491 = !DILocation(line: 309, column: 30, scope: !457)
!492 = !DILocation(line: 310, column: 21, scope: !493)
!493 = distinct !DILexicalBlock(scope: !457, file: !74, line: 310, column: 21)
!494 = !DILocation(line: 310, column: 34, scope: !493)
!495 = !DILocation(line: 310, column: 21, scope: !457)
!496 = !DILocation(line: 312, column: 21, scope: !497)
!497 = distinct !DILexicalBlock(scope: !493, file: !74, line: 311, column: 17)
!498 = !DILocation(line: 315, column: 35, scope: !457)
!499 = !DILocation(line: 315, column: 49, scope: !457)
!500 = !DILocation(line: 315, column: 30, scope: !457)
!501 = !DILocation(line: 315, column: 28, scope: !457)
!502 = !DILocation(line: 316, column: 21, scope: !503)
!503 = distinct !DILexicalBlock(scope: !457, file: !74, line: 316, column: 21)
!504 = !DILocation(line: 316, column: 32, scope: !503)
!505 = !DILocation(line: 316, column: 48, scope: !503)
!506 = !DILocation(line: 316, column: 51, scope: !503)
!507 = !DILocation(line: 316, column: 62, scope: !503)
!508 = !DILocation(line: 316, column: 21, scope: !457)
!509 = !DILocation(line: 318, column: 21, scope: !510)
!510 = distinct !DILexicalBlock(scope: !503, file: !74, line: 317, column: 17)
!511 = !DILocation(line: 321, column: 29, scope: !457)
!512 = !DILocation(line: 321, column: 17, scope: !457)
!513 = !DILocation(line: 321, column: 41, scope: !457)
!514 = !DILocation(line: 323, column: 29, scope: !457)
!515 = !DILocation(line: 323, column: 24, scope: !457)
!516 = !DILocation(line: 323, column: 22, scope: !457)
!517 = !DILocation(line: 324, column: 13, scope: !457)
!518 = !DILocation(line: 326, column: 17, scope: !519)
!519 = distinct !DILexicalBlock(scope: !444, file: !74, line: 326, column: 17)
!520 = !DILocation(line: 326, column: 30, scope: !519)
!521 = !DILocation(line: 326, column: 17, scope: !444)
!522 = !DILocation(line: 328, column: 30, scope: !523)
!523 = distinct !DILexicalBlock(scope: !519, file: !74, line: 327, column: 13)
!524 = !DILocation(line: 328, column: 17, scope: !523)
!525 = !DILocation(line: 329, column: 13, scope: !523)
!526 = !DILocation(line: 330, column: 17, scope: !527)
!527 = distinct !DILexicalBlock(scope: !444, file: !74, line: 330, column: 17)
!528 = !DILocation(line: 330, column: 30, scope: !527)
!529 = !DILocation(line: 330, column: 17, scope: !444)
!530 = !DILocation(line: 332, column: 30, scope: !531)
!531 = distinct !DILexicalBlock(scope: !527, file: !74, line: 331, column: 13)
!532 = !DILocation(line: 332, column: 17, scope: !531)
!533 = !DILocation(line: 333, column: 13, scope: !531)
!534 = !DILocation(line: 342, column: 8, scope: !535)
!535 = distinct !DILexicalBlock(scope: !344, file: !74, line: 342, column: 8)
!536 = !DILocation(line: 342, column: 8, scope: !344)
!537 = !DILocalVariable(name: "i", scope: !538, file: !74, line: 345, type: !65)
!538 = distinct !DILexicalBlock(scope: !539, file: !74, line: 344, column: 9)
!539 = distinct !DILexicalBlock(scope: !535, file: !74, line: 343, column: 5)
!540 = !DILocation(line: 345, column: 17, scope: !538)
!541 = !DILocalVariable(name: "buffer", scope: !538, file: !74, line: 346, type: !64)
!542 = !DILocation(line: 346, column: 19, scope: !538)
!543 = !DILocation(line: 346, column: 35, scope: !538)
!544 = !DILocation(line: 346, column: 28, scope: !538)
!545 = !DILocation(line: 347, column: 17, scope: !546)
!546 = distinct !DILexicalBlock(scope: !538, file: !74, line: 347, column: 17)
!547 = !DILocation(line: 347, column: 24, scope: !546)
!548 = !DILocation(line: 347, column: 17, scope: !538)
!549 = !DILocation(line: 347, column: 34, scope: !550)
!550 = distinct !DILexicalBlock(scope: !546, file: !74, line: 347, column: 33)
!551 = !DILocation(line: 349, column: 20, scope: !552)
!552 = distinct !DILexicalBlock(scope: !538, file: !74, line: 349, column: 13)
!553 = !DILocation(line: 349, column: 18, scope: !552)
!554 = !DILocation(line: 349, column: 25, scope: !555)
!555 = distinct !DILexicalBlock(scope: !552, file: !74, line: 349, column: 13)
!556 = !DILocation(line: 349, column: 27, scope: !555)
!557 = !DILocation(line: 349, column: 13, scope: !552)
!558 = !DILocation(line: 351, column: 17, scope: !559)
!559 = distinct !DILexicalBlock(scope: !555, file: !74, line: 350, column: 13)
!560 = !DILocation(line: 351, column: 24, scope: !559)
!561 = !DILocation(line: 351, column: 27, scope: !559)
!562 = !DILocation(line: 352, column: 13, scope: !559)
!563 = !DILocation(line: 349, column: 34, scope: !555)
!564 = !DILocation(line: 349, column: 13, scope: !555)
!565 = distinct !{!565, !557, !566, !227}
!566 = !DILocation(line: 352, column: 13, scope: !552)
!567 = !DILocation(line: 354, column: 17, scope: !568)
!568 = distinct !DILexicalBlock(scope: !538, file: !74, line: 354, column: 17)
!569 = !DILocation(line: 354, column: 22, scope: !568)
!570 = !DILocation(line: 354, column: 27, scope: !568)
!571 = !DILocation(line: 354, column: 30, scope: !568)
!572 = !DILocation(line: 354, column: 35, scope: !568)
!573 = !DILocation(line: 354, column: 17, scope: !538)
!574 = !DILocation(line: 356, column: 17, scope: !575)
!575 = distinct !DILexicalBlock(scope: !568, file: !74, line: 355, column: 13)
!576 = !DILocation(line: 356, column: 24, scope: !575)
!577 = !DILocation(line: 356, column: 30, scope: !575)
!578 = !DILocation(line: 358, column: 23, scope: !579)
!579 = distinct !DILexicalBlock(scope: !575, file: !74, line: 358, column: 17)
!580 = !DILocation(line: 358, column: 21, scope: !579)
!581 = !DILocation(line: 358, column: 28, scope: !582)
!582 = distinct !DILexicalBlock(scope: !579, file: !74, line: 358, column: 17)
!583 = !DILocation(line: 358, column: 30, scope: !582)
!584 = !DILocation(line: 358, column: 17, scope: !579)
!585 = !DILocation(line: 360, column: 34, scope: !586)
!586 = distinct !DILexicalBlock(scope: !582, file: !74, line: 359, column: 17)
!587 = !DILocation(line: 360, column: 41, scope: !586)
!588 = !DILocation(line: 360, column: 21, scope: !586)
!589 = !DILocation(line: 361, column: 17, scope: !586)
!590 = !DILocation(line: 358, column: 37, scope: !582)
!591 = !DILocation(line: 358, column: 17, scope: !582)
!592 = distinct !{!592, !584, !593, !227}
!593 = !DILocation(line: 361, column: 17, scope: !579)
!594 = !DILocation(line: 362, column: 13, scope: !575)
!595 = !DILocation(line: 365, column: 17, scope: !596)
!596 = distinct !DILexicalBlock(scope: !568, file: !74, line: 364, column: 13)
!597 = !DILocation(line: 367, column: 18, scope: !538)
!598 = !DILocation(line: 367, column: 13, scope: !538)
!599 = !DILocation(line: 369, column: 5, scope: !539)
!600 = !DILocalVariable(name: "i", scope: !601, file: !74, line: 373, type: !65)
!601 = distinct !DILexicalBlock(scope: !602, file: !74, line: 372, column: 9)
!602 = distinct !DILexicalBlock(scope: !535, file: !74, line: 371, column: 5)
!603 = !DILocation(line: 373, column: 17, scope: !601)
!604 = !DILocalVariable(name: "buffer", scope: !601, file: !74, line: 374, type: !64)
!605 = !DILocation(line: 374, column: 19, scope: !601)
!606 = !DILocation(line: 374, column: 35, scope: !601)
!607 = !DILocation(line: 374, column: 28, scope: !601)
!608 = !DILocation(line: 375, column: 17, scope: !609)
!609 = distinct !DILexicalBlock(scope: !601, file: !74, line: 375, column: 17)
!610 = !DILocation(line: 375, column: 24, scope: !609)
!611 = !DILocation(line: 375, column: 17, scope: !601)
!612 = !DILocation(line: 375, column: 34, scope: !613)
!613 = distinct !DILexicalBlock(scope: !609, file: !74, line: 375, column: 33)
!614 = !DILocation(line: 377, column: 20, scope: !615)
!615 = distinct !DILexicalBlock(scope: !601, file: !74, line: 377, column: 13)
!616 = !DILocation(line: 377, column: 18, scope: !615)
!617 = !DILocation(line: 377, column: 25, scope: !618)
!618 = distinct !DILexicalBlock(scope: !615, file: !74, line: 377, column: 13)
!619 = !DILocation(line: 377, column: 27, scope: !618)
!620 = !DILocation(line: 377, column: 13, scope: !615)
!621 = !DILocation(line: 379, column: 17, scope: !622)
!622 = distinct !DILexicalBlock(scope: !618, file: !74, line: 378, column: 13)
!623 = !DILocation(line: 379, column: 24, scope: !622)
!624 = !DILocation(line: 379, column: 27, scope: !622)
!625 = !DILocation(line: 380, column: 13, scope: !622)
!626 = !DILocation(line: 377, column: 34, scope: !618)
!627 = !DILocation(line: 377, column: 13, scope: !618)
!628 = distinct !{!628, !620, !629, !227}
!629 = !DILocation(line: 380, column: 13, scope: !615)
!630 = !DILocation(line: 382, column: 17, scope: !631)
!631 = distinct !DILexicalBlock(scope: !601, file: !74, line: 382, column: 17)
!632 = !DILocation(line: 382, column: 22, scope: !631)
!633 = !DILocation(line: 382, column: 27, scope: !631)
!634 = !DILocation(line: 382, column: 30, scope: !631)
!635 = !DILocation(line: 382, column: 35, scope: !631)
!636 = !DILocation(line: 382, column: 17, scope: !601)
!637 = !DILocation(line: 384, column: 17, scope: !638)
!638 = distinct !DILexicalBlock(scope: !631, file: !74, line: 383, column: 13)
!639 = !DILocation(line: 384, column: 24, scope: !638)
!640 = !DILocation(line: 384, column: 30, scope: !638)
!641 = !DILocation(line: 386, column: 23, scope: !642)
!642 = distinct !DILexicalBlock(scope: !638, file: !74, line: 386, column: 17)
!643 = !DILocation(line: 386, column: 21, scope: !642)
!644 = !DILocation(line: 386, column: 28, scope: !645)
!645 = distinct !DILexicalBlock(scope: !642, file: !74, line: 386, column: 17)
!646 = !DILocation(line: 386, column: 30, scope: !645)
!647 = !DILocation(line: 386, column: 17, scope: !642)
!648 = !DILocation(line: 388, column: 34, scope: !649)
!649 = distinct !DILexicalBlock(scope: !645, file: !74, line: 387, column: 17)
!650 = !DILocation(line: 388, column: 41, scope: !649)
!651 = !DILocation(line: 388, column: 21, scope: !649)
!652 = !DILocation(line: 389, column: 17, scope: !649)
!653 = !DILocation(line: 386, column: 37, scope: !645)
!654 = !DILocation(line: 386, column: 17, scope: !645)
!655 = distinct !{!655, !647, !656, !227}
!656 = !DILocation(line: 389, column: 17, scope: !642)
!657 = !DILocation(line: 390, column: 13, scope: !638)
!658 = !DILocation(line: 393, column: 17, scope: !659)
!659 = distinct !DILexicalBlock(scope: !631, file: !74, line: 392, column: 13)
!660 = !DILocation(line: 395, column: 18, scope: !601)
!661 = !DILocation(line: 395, column: 13, scope: !601)
!662 = !DILocation(line: 398, column: 1, scope: !344)
!663 = distinct !DISubprogram(name: "goodG2B", scope: !74, file: !74, line: 403, type: !75, scopeLine: 404, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!664 = !DILocalVariable(name: "data", scope: !663, file: !74, line: 405, type: !65)
!665 = !DILocation(line: 405, column: 9, scope: !663)
!666 = !DILocation(line: 407, column: 10, scope: !663)
!667 = !DILocation(line: 408, column: 8, scope: !668)
!668 = distinct !DILexicalBlock(scope: !663, file: !74, line: 408, column: 8)
!669 = !DILocation(line: 408, column: 8, scope: !663)
!670 = !DILocation(line: 412, column: 14, scope: !671)
!671 = distinct !DILexicalBlock(scope: !668, file: !74, line: 409, column: 5)
!672 = !DILocation(line: 413, column: 5, scope: !671)
!673 = !DILocation(line: 418, column: 14, scope: !674)
!674 = distinct !DILexicalBlock(scope: !668, file: !74, line: 415, column: 5)
!675 = !DILocation(line: 420, column: 8, scope: !676)
!676 = distinct !DILexicalBlock(scope: !663, file: !74, line: 420, column: 8)
!677 = !DILocation(line: 420, column: 8, scope: !663)
!678 = !DILocalVariable(name: "i", scope: !679, file: !74, line: 423, type: !65)
!679 = distinct !DILexicalBlock(scope: !680, file: !74, line: 422, column: 9)
!680 = distinct !DILexicalBlock(scope: !676, file: !74, line: 421, column: 5)
!681 = !DILocation(line: 423, column: 17, scope: !679)
!682 = !DILocalVariable(name: "buffer", scope: !679, file: !74, line: 424, type: !64)
!683 = !DILocation(line: 424, column: 19, scope: !679)
!684 = !DILocation(line: 424, column: 35, scope: !679)
!685 = !DILocation(line: 424, column: 28, scope: !679)
!686 = !DILocation(line: 425, column: 17, scope: !687)
!687 = distinct !DILexicalBlock(scope: !679, file: !74, line: 425, column: 17)
!688 = !DILocation(line: 425, column: 24, scope: !687)
!689 = !DILocation(line: 425, column: 17, scope: !679)
!690 = !DILocation(line: 425, column: 34, scope: !691)
!691 = distinct !DILexicalBlock(scope: !687, file: !74, line: 425, column: 33)
!692 = !DILocation(line: 427, column: 20, scope: !693)
!693 = distinct !DILexicalBlock(scope: !679, file: !74, line: 427, column: 13)
!694 = !DILocation(line: 427, column: 18, scope: !693)
!695 = !DILocation(line: 427, column: 25, scope: !696)
!696 = distinct !DILexicalBlock(scope: !693, file: !74, line: 427, column: 13)
!697 = !DILocation(line: 427, column: 27, scope: !696)
!698 = !DILocation(line: 427, column: 13, scope: !693)
!699 = !DILocation(line: 429, column: 17, scope: !700)
!700 = distinct !DILexicalBlock(scope: !696, file: !74, line: 428, column: 13)
!701 = !DILocation(line: 429, column: 24, scope: !700)
!702 = !DILocation(line: 429, column: 27, scope: !700)
!703 = !DILocation(line: 430, column: 13, scope: !700)
!704 = !DILocation(line: 427, column: 34, scope: !696)
!705 = !DILocation(line: 427, column: 13, scope: !696)
!706 = distinct !{!706, !698, !707, !227}
!707 = !DILocation(line: 430, column: 13, scope: !693)
!708 = !DILocation(line: 433, column: 17, scope: !709)
!709 = distinct !DILexicalBlock(scope: !679, file: !74, line: 433, column: 17)
!710 = !DILocation(line: 433, column: 22, scope: !709)
!711 = !DILocation(line: 433, column: 17, scope: !679)
!712 = !DILocation(line: 435, column: 17, scope: !713)
!713 = distinct !DILexicalBlock(scope: !709, file: !74, line: 434, column: 13)
!714 = !DILocation(line: 435, column: 24, scope: !713)
!715 = !DILocation(line: 435, column: 30, scope: !713)
!716 = !DILocation(line: 437, column: 23, scope: !717)
!717 = distinct !DILexicalBlock(scope: !713, file: !74, line: 437, column: 17)
!718 = !DILocation(line: 437, column: 21, scope: !717)
!719 = !DILocation(line: 437, column: 28, scope: !720)
!720 = distinct !DILexicalBlock(scope: !717, file: !74, line: 437, column: 17)
!721 = !DILocation(line: 437, column: 30, scope: !720)
!722 = !DILocation(line: 437, column: 17, scope: !717)
!723 = !DILocation(line: 439, column: 34, scope: !724)
!724 = distinct !DILexicalBlock(scope: !720, file: !74, line: 438, column: 17)
!725 = !DILocation(line: 439, column: 41, scope: !724)
!726 = !DILocation(line: 439, column: 21, scope: !724)
!727 = !DILocation(line: 440, column: 17, scope: !724)
!728 = !DILocation(line: 437, column: 37, scope: !720)
!729 = !DILocation(line: 437, column: 17, scope: !720)
!730 = distinct !{!730, !722, !731, !227}
!731 = !DILocation(line: 440, column: 17, scope: !717)
!732 = !DILocation(line: 441, column: 13, scope: !713)
!733 = !DILocation(line: 444, column: 17, scope: !734)
!734 = distinct !DILexicalBlock(scope: !709, file: !74, line: 443, column: 13)
!735 = !DILocation(line: 446, column: 18, scope: !679)
!736 = !DILocation(line: 446, column: 13, scope: !679)
!737 = !DILocation(line: 448, column: 5, scope: !680)
!738 = !DILocalVariable(name: "i", scope: !739, file: !74, line: 452, type: !65)
!739 = distinct !DILexicalBlock(scope: !740, file: !74, line: 451, column: 9)
!740 = distinct !DILexicalBlock(scope: !676, file: !74, line: 450, column: 5)
!741 = !DILocation(line: 452, column: 17, scope: !739)
!742 = !DILocalVariable(name: "buffer", scope: !739, file: !74, line: 453, type: !64)
!743 = !DILocation(line: 453, column: 19, scope: !739)
!744 = !DILocation(line: 453, column: 35, scope: !739)
!745 = !DILocation(line: 453, column: 28, scope: !739)
!746 = !DILocation(line: 454, column: 17, scope: !747)
!747 = distinct !DILexicalBlock(scope: !739, file: !74, line: 454, column: 17)
!748 = !DILocation(line: 454, column: 24, scope: !747)
!749 = !DILocation(line: 454, column: 17, scope: !739)
!750 = !DILocation(line: 454, column: 34, scope: !751)
!751 = distinct !DILexicalBlock(scope: !747, file: !74, line: 454, column: 33)
!752 = !DILocation(line: 456, column: 20, scope: !753)
!753 = distinct !DILexicalBlock(scope: !739, file: !74, line: 456, column: 13)
!754 = !DILocation(line: 456, column: 18, scope: !753)
!755 = !DILocation(line: 456, column: 25, scope: !756)
!756 = distinct !DILexicalBlock(scope: !753, file: !74, line: 456, column: 13)
!757 = !DILocation(line: 456, column: 27, scope: !756)
!758 = !DILocation(line: 456, column: 13, scope: !753)
!759 = !DILocation(line: 458, column: 17, scope: !760)
!760 = distinct !DILexicalBlock(scope: !756, file: !74, line: 457, column: 13)
!761 = !DILocation(line: 458, column: 24, scope: !760)
!762 = !DILocation(line: 458, column: 27, scope: !760)
!763 = !DILocation(line: 459, column: 13, scope: !760)
!764 = !DILocation(line: 456, column: 34, scope: !756)
!765 = !DILocation(line: 456, column: 13, scope: !756)
!766 = distinct !{!766, !758, !767, !227}
!767 = !DILocation(line: 459, column: 13, scope: !753)
!768 = !DILocation(line: 462, column: 17, scope: !769)
!769 = distinct !DILexicalBlock(scope: !739, file: !74, line: 462, column: 17)
!770 = !DILocation(line: 462, column: 22, scope: !769)
!771 = !DILocation(line: 462, column: 17, scope: !739)
!772 = !DILocation(line: 464, column: 17, scope: !773)
!773 = distinct !DILexicalBlock(scope: !769, file: !74, line: 463, column: 13)
!774 = !DILocation(line: 464, column: 24, scope: !773)
!775 = !DILocation(line: 464, column: 30, scope: !773)
!776 = !DILocation(line: 466, column: 23, scope: !777)
!777 = distinct !DILexicalBlock(scope: !773, file: !74, line: 466, column: 17)
!778 = !DILocation(line: 466, column: 21, scope: !777)
!779 = !DILocation(line: 466, column: 28, scope: !780)
!780 = distinct !DILexicalBlock(scope: !777, file: !74, line: 466, column: 17)
!781 = !DILocation(line: 466, column: 30, scope: !780)
!782 = !DILocation(line: 466, column: 17, scope: !777)
!783 = !DILocation(line: 468, column: 34, scope: !784)
!784 = distinct !DILexicalBlock(scope: !780, file: !74, line: 467, column: 17)
!785 = !DILocation(line: 468, column: 41, scope: !784)
!786 = !DILocation(line: 468, column: 21, scope: !784)
!787 = !DILocation(line: 469, column: 17, scope: !784)
!788 = !DILocation(line: 466, column: 37, scope: !780)
!789 = !DILocation(line: 466, column: 17, scope: !780)
!790 = distinct !{!790, !782, !791, !227}
!791 = !DILocation(line: 469, column: 17, scope: !777)
!792 = !DILocation(line: 470, column: 13, scope: !773)
!793 = !DILocation(line: 473, column: 17, scope: !794)
!794 = distinct !DILexicalBlock(scope: !769, file: !74, line: 472, column: 13)
!795 = !DILocation(line: 475, column: 18, scope: !739)
!796 = !DILocation(line: 475, column: 13, scope: !739)
!797 = !DILocation(line: 478, column: 1, scope: !663)
