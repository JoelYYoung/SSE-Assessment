; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType = type { i32 }
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_bad() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data21 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType* %myUnion, metadata !75, metadata !DIExpression()), !dbg !81
  store i32 -1, i32* %data, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !83, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !86, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %connectSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  br label %do.body, !dbg !113

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !114
  store i32 %call, i32* %connectSocket, align 4, !dbg !116
  %0 = load i32, i32* %connectSocket, align 4, !dbg !117
  %cmp = icmp eq i32 %0, -1, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !121

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !123
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !124
  store i16 2, i16* %sin_family, align 4, !dbg !125
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !126
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !127
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !128
  store i32 %call1, i32* %s_addr, align 4, !dbg !129
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !130
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !131
  store i16 %call2, i16* %sin_port, align 2, !dbg !132
  %2 = load i32, i32* %connectSocket, align 4, !dbg !133
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !135
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !136
  %cmp4 = icmp eq i32 %call3, -1, !dbg !137
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !138

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !139

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !141
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !142
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !143
  %conv = trunc i64 %call7 to i32, !dbg !143
  store i32 %conv, i32* %recvResult, align 4, !dbg !144
  %5 = load i32, i32* %recvResult, align 4, !dbg !145
  %cmp8 = icmp eq i32 %5, -1, !dbg !147
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !148

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !149
  %cmp10 = icmp eq i32 %6, 0, !dbg !150
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !151

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !152

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !154
  %idxprom = sext i32 %7 to i64, !dbg !155
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !155
  store i8 0, i8* %arrayidx, align 1, !dbg !156
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !157
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !158
  store i32 %call15, i32* %data, align 4, !dbg !159
  br label %do.end, !dbg !160

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !161
  %cmp16 = icmp ne i32 %8, -1, !dbg !163
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !164

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !165
  %call19 = call i32 @close(i32 %9), !dbg !167
  br label %if.end20, !dbg !168

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !169
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType* %myUnion to i32*, !dbg !170
  store i32 %10, i32* %unionFirst, align 4, !dbg !171
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !172, metadata !DIExpression()), !dbg !174
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType* %myUnion to i32*, !dbg !175
  %11 = load i32, i32* %unionSecond, align 4, !dbg !175
  store i32 %11, i32* %data21, align 4, !dbg !174
  call void @llvm.dbg.declare(metadata i32* %i, metadata !176, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !179, metadata !DIExpression()), !dbg !180
  %call22 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !181
  %12 = bitcast i8* %call22 to i32*, !dbg !182
  store i32* %12, i32** %buffer, align 8, !dbg !180
  %13 = load i32*, i32** %buffer, align 8, !dbg !183
  %cmp23 = icmp eq i32* %13, null, !dbg !185
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !186

if.then25:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !187
  unreachable, !dbg !187

if.end26:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !189
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc, %if.end26
  %14 = load i32, i32* %i, align 4, !dbg !192
  %cmp27 = icmp slt i32 %14, 10, !dbg !194
  br i1 %cmp27, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !196
  %16 = load i32, i32* %i, align 4, !dbg !198
  %idxprom29 = sext i32 %16 to i64, !dbg !196
  %arrayidx30 = getelementptr inbounds i32, i32* %15, i64 %idxprom29, !dbg !196
  store i32 0, i32* %arrayidx30, align 4, !dbg !199
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !201
  %inc = add nsw i32 %17, 1, !dbg !201
  store i32 %inc, i32* %i, align 4, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data21, align 4, !dbg !206
  %cmp31 = icmp sge i32 %18, 0, !dbg !208
  br i1 %cmp31, label %if.then33, label %if.else, !dbg !209

if.then33:                                        ; preds = %for.end
  %19 = load i32*, i32** %buffer, align 8, !dbg !210
  %20 = load i32, i32* %data21, align 4, !dbg !212
  %idxprom34 = sext i32 %20 to i64, !dbg !210
  %arrayidx35 = getelementptr inbounds i32, i32* %19, i64 %idxprom34, !dbg !210
  store i32 1, i32* %arrayidx35, align 4, !dbg !213
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond36, !dbg !216

for.cond36:                                       ; preds = %for.inc42, %if.then33
  %21 = load i32, i32* %i, align 4, !dbg !217
  %cmp37 = icmp slt i32 %21, 10, !dbg !219
  br i1 %cmp37, label %for.body39, label %for.end44, !dbg !220

for.body39:                                       ; preds = %for.cond36
  %22 = load i32*, i32** %buffer, align 8, !dbg !221
  %23 = load i32, i32* %i, align 4, !dbg !223
  %idxprom40 = sext i32 %23 to i64, !dbg !221
  %arrayidx41 = getelementptr inbounds i32, i32* %22, i64 %idxprom40, !dbg !221
  %24 = load i32, i32* %arrayidx41, align 4, !dbg !221
  call void @printIntLine(i32 %24), !dbg !224
  br label %for.inc42, !dbg !225

for.inc42:                                        ; preds = %for.body39
  %25 = load i32, i32* %i, align 4, !dbg !226
  %inc43 = add nsw i32 %25, 1, !dbg !226
  store i32 %inc43, i32* %i, align 4, !dbg !226
  br label %for.cond36, !dbg !227, !llvm.loop !228

for.end44:                                        ; preds = %for.cond36
  br label %if.end45, !dbg !230

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !231
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end44
  %26 = load i32*, i32** %buffer, align 8, !dbg !233
  %27 = bitcast i32* %26 to i8*, !dbg !233
  call void @free(i8* %27) #8, !dbg !234
  ret void, !dbg !235
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

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_good() #0 !dbg !236 {
entry:
  call void @goodG2B(), !dbg !237
  call void @goodB2G(), !dbg !238
  ret void, !dbg !239
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !240 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !245, metadata !DIExpression()), !dbg !246
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !247, metadata !DIExpression()), !dbg !248
  %call = call i64 @time(i64* null) #8, !dbg !249
  %conv = trunc i64 %call to i32, !dbg !250
  call void @srand(i32 %conv) #8, !dbg !251
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !252
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_good(), !dbg !253
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !254
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !255
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_bad(), !dbg !256
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !257
  ret i32 0, !dbg !258
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !259 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType* %myUnion, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %data, align 4, !dbg !264
  store i32 7, i32* %data, align 4, !dbg !265
  %0 = load i32, i32* %data, align 4, !dbg !266
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType* %myUnion to i32*, !dbg !267
  store i32 %0, i32* %unionFirst, align 4, !dbg !268
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !269, metadata !DIExpression()), !dbg !271
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType* %myUnion to i32*, !dbg !272
  %1 = load i32, i32* %unionSecond, align 4, !dbg !272
  store i32 %1, i32* %data1, align 4, !dbg !271
  call void @llvm.dbg.declare(metadata i32* %i, metadata !273, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !276, metadata !DIExpression()), !dbg !277
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !278
  %2 = bitcast i8* %call to i32*, !dbg !279
  store i32* %2, i32** %buffer, align 8, !dbg !277
  %3 = load i32*, i32** %buffer, align 8, !dbg !280
  %cmp = icmp eq i32* %3, null, !dbg !282
  br i1 %cmp, label %if.then, label %if.end, !dbg !283

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !284
  unreachable, !dbg !284

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !286
  br label %for.cond, !dbg !288

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !289
  %cmp2 = icmp slt i32 %4, 10, !dbg !291
  br i1 %cmp2, label %for.body, label %for.end, !dbg !292

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !293
  %6 = load i32, i32* %i, align 4, !dbg !295
  %idxprom = sext i32 %6 to i64, !dbg !293
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !293
  store i32 0, i32* %arrayidx, align 4, !dbg !296
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !298
  %inc = add nsw i32 %7, 1, !dbg !298
  store i32 %inc, i32* %i, align 4, !dbg !298
  br label %for.cond, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !302
  %cmp3 = icmp sge i32 %8, 0, !dbg !304
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !305

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !306
  %10 = load i32, i32* %data1, align 4, !dbg !308
  %idxprom5 = sext i32 %10 to i64, !dbg !306
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !306
  store i32 1, i32* %arrayidx6, align 4, !dbg !309
  store i32 0, i32* %i, align 4, !dbg !310
  br label %for.cond7, !dbg !312

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !313
  %cmp8 = icmp slt i32 %11, 10, !dbg !315
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !316

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !317
  %13 = load i32, i32* %i, align 4, !dbg !319
  %idxprom10 = sext i32 %13 to i64, !dbg !317
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !317
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !317
  call void @printIntLine(i32 %14), !dbg !320
  br label %for.inc12, !dbg !321

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !322
  %inc13 = add nsw i32 %15, 1, !dbg !322
  store i32 %inc13, i32* %i, align 4, !dbg !322
  br label %for.cond7, !dbg !323, !llvm.loop !324

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !326

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !327
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !329
  %17 = bitcast i32* %16 to i8*, !dbg !329
  call void @free(i8* %17) #8, !dbg !330
  ret void, !dbg !331
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !332 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data21 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !333, metadata !DIExpression()), !dbg !334
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType* %myUnion, metadata !335, metadata !DIExpression()), !dbg !336
  store i32 -1, i32* %data, align 4, !dbg !337
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !338, metadata !DIExpression()), !dbg !340
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !341, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !343, metadata !DIExpression()), !dbg !344
  store i32 -1, i32* %connectSocket, align 4, !dbg !344
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !345, metadata !DIExpression()), !dbg !346
  br label %do.body, !dbg !347

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !348
  store i32 %call, i32* %connectSocket, align 4, !dbg !350
  %0 = load i32, i32* %connectSocket, align 4, !dbg !351
  %cmp = icmp eq i32 %0, -1, !dbg !353
  br i1 %cmp, label %if.then, label %if.end, !dbg !354

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !355

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !357
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !357
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !358
  store i16 2, i16* %sin_family, align 4, !dbg !359
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !360
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !361
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !362
  store i32 %call1, i32* %s_addr, align 4, !dbg !363
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !364
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !365
  store i16 %call2, i16* %sin_port, align 2, !dbg !366
  %2 = load i32, i32* %connectSocket, align 4, !dbg !367
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !369
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !370
  %cmp4 = icmp eq i32 %call3, -1, !dbg !371
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !372

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !373

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !375
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !376
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !377
  %conv = trunc i64 %call7 to i32, !dbg !377
  store i32 %conv, i32* %recvResult, align 4, !dbg !378
  %5 = load i32, i32* %recvResult, align 4, !dbg !379
  %cmp8 = icmp eq i32 %5, -1, !dbg !381
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !382

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !383
  %cmp10 = icmp eq i32 %6, 0, !dbg !384
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !385

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !386

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !388
  %idxprom = sext i32 %7 to i64, !dbg !389
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !389
  store i8 0, i8* %arrayidx, align 1, !dbg !390
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !391
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !392
  store i32 %call15, i32* %data, align 4, !dbg !393
  br label %do.end, !dbg !394

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !395
  %cmp16 = icmp ne i32 %8, -1, !dbg !397
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !398

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !399
  %call19 = call i32 @close(i32 %9), !dbg !401
  br label %if.end20, !dbg !402

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !403
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType* %myUnion to i32*, !dbg !404
  store i32 %10, i32* %unionFirst, align 4, !dbg !405
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !406, metadata !DIExpression()), !dbg !408
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType* %myUnion to i32*, !dbg !409
  %11 = load i32, i32* %unionSecond, align 4, !dbg !409
  store i32 %11, i32* %data21, align 4, !dbg !408
  call void @llvm.dbg.declare(metadata i32* %i, metadata !410, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !413, metadata !DIExpression()), !dbg !414
  %call22 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !415
  %12 = bitcast i8* %call22 to i32*, !dbg !416
  store i32* %12, i32** %buffer, align 8, !dbg !414
  %13 = load i32*, i32** %buffer, align 8, !dbg !417
  %cmp23 = icmp eq i32* %13, null, !dbg !419
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !420

if.then25:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !421
  unreachable, !dbg !421

if.end26:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !423
  br label %for.cond, !dbg !425

for.cond:                                         ; preds = %for.inc, %if.end26
  %14 = load i32, i32* %i, align 4, !dbg !426
  %cmp27 = icmp slt i32 %14, 10, !dbg !428
  br i1 %cmp27, label %for.body, label %for.end, !dbg !429

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !430
  %16 = load i32, i32* %i, align 4, !dbg !432
  %idxprom29 = sext i32 %16 to i64, !dbg !430
  %arrayidx30 = getelementptr inbounds i32, i32* %15, i64 %idxprom29, !dbg !430
  store i32 0, i32* %arrayidx30, align 4, !dbg !433
  br label %for.inc, !dbg !434

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !435
  %inc = add nsw i32 %17, 1, !dbg !435
  store i32 %inc, i32* %i, align 4, !dbg !435
  br label %for.cond, !dbg !436, !llvm.loop !437

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data21, align 4, !dbg !439
  %cmp31 = icmp sge i32 %18, 0, !dbg !441
  br i1 %cmp31, label %land.lhs.true, label %if.else, !dbg !442

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* %data21, align 4, !dbg !443
  %cmp33 = icmp slt i32 %19, 10, !dbg !444
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !445

if.then35:                                        ; preds = %land.lhs.true
  %20 = load i32*, i32** %buffer, align 8, !dbg !446
  %21 = load i32, i32* %data21, align 4, !dbg !448
  %idxprom36 = sext i32 %21 to i64, !dbg !446
  %arrayidx37 = getelementptr inbounds i32, i32* %20, i64 %idxprom36, !dbg !446
  store i32 1, i32* %arrayidx37, align 4, !dbg !449
  store i32 0, i32* %i, align 4, !dbg !450
  br label %for.cond38, !dbg !452

for.cond38:                                       ; preds = %for.inc44, %if.then35
  %22 = load i32, i32* %i, align 4, !dbg !453
  %cmp39 = icmp slt i32 %22, 10, !dbg !455
  br i1 %cmp39, label %for.body41, label %for.end46, !dbg !456

for.body41:                                       ; preds = %for.cond38
  %23 = load i32*, i32** %buffer, align 8, !dbg !457
  %24 = load i32, i32* %i, align 4, !dbg !459
  %idxprom42 = sext i32 %24 to i64, !dbg !457
  %arrayidx43 = getelementptr inbounds i32, i32* %23, i64 %idxprom42, !dbg !457
  %25 = load i32, i32* %arrayidx43, align 4, !dbg !457
  call void @printIntLine(i32 %25), !dbg !460
  br label %for.inc44, !dbg !461

for.inc44:                                        ; preds = %for.body41
  %26 = load i32, i32* %i, align 4, !dbg !462
  %inc45 = add nsw i32 %26, 1, !dbg !462
  store i32 %inc45, i32* %i, align 4, !dbg !462
  br label %for.cond38, !dbg !463, !llvm.loop !464

for.end46:                                        ; preds = %for.cond38
  br label %if.end47, !dbg !466

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !467
  br label %if.end47

if.end47:                                         ; preds = %if.else, %for.end46
  %27 = load i32*, i32** %buffer, align 8, !dbg !469
  %28 = bitcast i32* %27 to i8*, !dbg !469
  call void @free(i8* %28) #8, !dbg !470
  ret void, !dbg !471
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { nounwind readnone willreturn }
attributes #10 = { nounwind readonly willreturn }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!62, !63, !64, !65, !66}
!llvm.ident = !{!67}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !59, !61, !5}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 178, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 180, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 181, baseType: !55, size: 112, offset: 16)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 112, elements: !57)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !{!58}
!58 = !DISubrange(count: 14)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!62 = !{i32 7, !"Dwarf Version", i32 4}
!63 = !{i32 2, !"Debug Info Version", i32 3}
!64 = !{i32 1, !"wchar_size", i32 4}
!65 = !{i32 7, !"uwtable", i32 1}
!66 = !{i32 7, !"frame-pointer", i32 2}
!67 = !{!"clang version 13.0.0"}
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_bad", scope: !69, file: !69, line: 50, type: !70, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 52, type: !60)
!74 = !DILocation(line: 52, column: 9, scope: !68)
!75 = !DILocalVariable(name: "myUnion", scope: !68, file: !69, line: 53, type: !76)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_unionType", file: !69, line: 46, baseType: !77)
!77 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !69, line: 42, size: 32, elements: !78)
!78 = !{!79, !80}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !77, file: !69, line: 44, baseType: !60, size: 32)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !77, file: !69, line: 45, baseType: !60, size: 32)
!81 = !DILocation(line: 53, column: 77, scope: !68)
!82 = !DILocation(line: 55, column: 10, scope: !68)
!83 = !DILocalVariable(name: "recvResult", scope: !84, file: !69, line: 61, type: !60)
!84 = distinct !DILexicalBlock(scope: !68, file: !69, line: 56, column: 5)
!85 = !DILocation(line: 61, column: 13, scope: !84)
!86 = !DILocalVariable(name: "service", scope: !84, file: !69, line: 62, type: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !88)
!88 = !{!89, !90, !96, !103}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !17, line: 240, baseType: !51, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !17, line: 241, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !93, line: 25, baseType: !94)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !95, line: 40, baseType: !53)
!95 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !17, line: 242, baseType: !97, size: 32, offset: 32)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !98)
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !97, file: !17, line: 33, baseType: !100, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !93, line: 26, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !95, line: 42, baseType: !5)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !17, line: 245, baseType: !104, size: 64, offset: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 64, elements: !106)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 62, column: 28, scope: !84)
!109 = !DILocalVariable(name: "connectSocket", scope: !84, file: !69, line: 63, type: !60)
!110 = !DILocation(line: 63, column: 16, scope: !84)
!111 = !DILocalVariable(name: "inputBuffer", scope: !84, file: !69, line: 64, type: !55)
!112 = !DILocation(line: 64, column: 14, scope: !84)
!113 = !DILocation(line: 65, column: 9, scope: !84)
!114 = !DILocation(line: 75, column: 29, scope: !115)
!115 = distinct !DILexicalBlock(scope: !84, file: !69, line: 66, column: 9)
!116 = !DILocation(line: 75, column: 27, scope: !115)
!117 = !DILocation(line: 76, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !69, line: 76, column: 17)
!119 = !DILocation(line: 76, column: 31, scope: !118)
!120 = !DILocation(line: 76, column: 17, scope: !115)
!121 = !DILocation(line: 78, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !69, line: 77, column: 13)
!123 = !DILocation(line: 80, column: 13, scope: !115)
!124 = !DILocation(line: 81, column: 21, scope: !115)
!125 = !DILocation(line: 81, column: 32, scope: !115)
!126 = !DILocation(line: 82, column: 39, scope: !115)
!127 = !DILocation(line: 82, column: 21, scope: !115)
!128 = !DILocation(line: 82, column: 30, scope: !115)
!129 = !DILocation(line: 82, column: 37, scope: !115)
!130 = !DILocation(line: 83, column: 32, scope: !115)
!131 = !DILocation(line: 83, column: 21, scope: !115)
!132 = !DILocation(line: 83, column: 30, scope: !115)
!133 = !DILocation(line: 84, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !115, file: !69, line: 84, column: 17)
!135 = !DILocation(line: 84, column: 40, scope: !134)
!136 = !DILocation(line: 84, column: 17, scope: !134)
!137 = !DILocation(line: 84, column: 85, scope: !134)
!138 = !DILocation(line: 84, column: 17, scope: !115)
!139 = !DILocation(line: 86, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !69, line: 85, column: 13)
!141 = !DILocation(line: 90, column: 31, scope: !115)
!142 = !DILocation(line: 90, column: 46, scope: !115)
!143 = !DILocation(line: 90, column: 26, scope: !115)
!144 = !DILocation(line: 90, column: 24, scope: !115)
!145 = !DILocation(line: 91, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !115, file: !69, line: 91, column: 17)
!147 = !DILocation(line: 91, column: 28, scope: !146)
!148 = !DILocation(line: 91, column: 44, scope: !146)
!149 = !DILocation(line: 91, column: 47, scope: !146)
!150 = !DILocation(line: 91, column: 58, scope: !146)
!151 = !DILocation(line: 91, column: 17, scope: !115)
!152 = !DILocation(line: 93, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !146, file: !69, line: 92, column: 13)
!154 = !DILocation(line: 96, column: 25, scope: !115)
!155 = !DILocation(line: 96, column: 13, scope: !115)
!156 = !DILocation(line: 96, column: 37, scope: !115)
!157 = !DILocation(line: 98, column: 25, scope: !115)
!158 = !DILocation(line: 98, column: 20, scope: !115)
!159 = !DILocation(line: 98, column: 18, scope: !115)
!160 = !DILocation(line: 99, column: 9, scope: !115)
!161 = !DILocation(line: 101, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !84, file: !69, line: 101, column: 13)
!163 = !DILocation(line: 101, column: 27, scope: !162)
!164 = !DILocation(line: 101, column: 13, scope: !84)
!165 = !DILocation(line: 103, column: 26, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !69, line: 102, column: 9)
!167 = !DILocation(line: 103, column: 13, scope: !166)
!168 = !DILocation(line: 104, column: 9, scope: !166)
!169 = !DILocation(line: 112, column: 26, scope: !68)
!170 = !DILocation(line: 112, column: 13, scope: !68)
!171 = !DILocation(line: 112, column: 24, scope: !68)
!172 = !DILocalVariable(name: "data", scope: !173, file: !69, line: 114, type: !60)
!173 = distinct !DILexicalBlock(scope: !68, file: !69, line: 113, column: 5)
!174 = !DILocation(line: 114, column: 13, scope: !173)
!175 = !DILocation(line: 114, column: 28, scope: !173)
!176 = !DILocalVariable(name: "i", scope: !177, file: !69, line: 116, type: !60)
!177 = distinct !DILexicalBlock(scope: !173, file: !69, line: 115, column: 9)
!178 = !DILocation(line: 116, column: 17, scope: !177)
!179 = !DILocalVariable(name: "buffer", scope: !177, file: !69, line: 117, type: !59)
!180 = !DILocation(line: 117, column: 19, scope: !177)
!181 = !DILocation(line: 117, column: 35, scope: !177)
!182 = !DILocation(line: 117, column: 28, scope: !177)
!183 = !DILocation(line: 118, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !177, file: !69, line: 118, column: 17)
!185 = !DILocation(line: 118, column: 24, scope: !184)
!186 = !DILocation(line: 118, column: 17, scope: !177)
!187 = !DILocation(line: 118, column: 34, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !69, line: 118, column: 33)
!189 = !DILocation(line: 120, column: 20, scope: !190)
!190 = distinct !DILexicalBlock(scope: !177, file: !69, line: 120, column: 13)
!191 = !DILocation(line: 120, column: 18, scope: !190)
!192 = !DILocation(line: 120, column: 25, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !69, line: 120, column: 13)
!194 = !DILocation(line: 120, column: 27, scope: !193)
!195 = !DILocation(line: 120, column: 13, scope: !190)
!196 = !DILocation(line: 122, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !69, line: 121, column: 13)
!198 = !DILocation(line: 122, column: 24, scope: !197)
!199 = !DILocation(line: 122, column: 27, scope: !197)
!200 = !DILocation(line: 123, column: 13, scope: !197)
!201 = !DILocation(line: 120, column: 34, scope: !193)
!202 = !DILocation(line: 120, column: 13, scope: !193)
!203 = distinct !{!203, !195, !204, !205}
!204 = !DILocation(line: 123, column: 13, scope: !190)
!205 = !{!"llvm.loop.mustprogress"}
!206 = !DILocation(line: 126, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !177, file: !69, line: 126, column: 17)
!208 = !DILocation(line: 126, column: 22, scope: !207)
!209 = !DILocation(line: 126, column: 17, scope: !177)
!210 = !DILocation(line: 128, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !69, line: 127, column: 13)
!212 = !DILocation(line: 128, column: 24, scope: !211)
!213 = !DILocation(line: 128, column: 30, scope: !211)
!214 = !DILocation(line: 130, column: 23, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !69, line: 130, column: 17)
!216 = !DILocation(line: 130, column: 21, scope: !215)
!217 = !DILocation(line: 130, column: 28, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !69, line: 130, column: 17)
!219 = !DILocation(line: 130, column: 30, scope: !218)
!220 = !DILocation(line: 130, column: 17, scope: !215)
!221 = !DILocation(line: 132, column: 34, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !69, line: 131, column: 17)
!223 = !DILocation(line: 132, column: 41, scope: !222)
!224 = !DILocation(line: 132, column: 21, scope: !222)
!225 = !DILocation(line: 133, column: 17, scope: !222)
!226 = !DILocation(line: 130, column: 37, scope: !218)
!227 = !DILocation(line: 130, column: 17, scope: !218)
!228 = distinct !{!228, !220, !229, !205}
!229 = !DILocation(line: 133, column: 17, scope: !215)
!230 = !DILocation(line: 134, column: 13, scope: !211)
!231 = !DILocation(line: 137, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !207, file: !69, line: 136, column: 13)
!233 = !DILocation(line: 139, column: 18, scope: !177)
!234 = !DILocation(line: 139, column: 13, scope: !177)
!235 = !DILocation(line: 142, column: 1, scope: !68)
!236 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_34_good", scope: !69, file: !69, line: 284, type: !70, scopeLine: 285, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!237 = !DILocation(line: 286, column: 5, scope: !236)
!238 = !DILocation(line: 287, column: 5, scope: !236)
!239 = !DILocation(line: 288, column: 1, scope: !236)
!240 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 298, type: !241, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!241 = !DISubroutineType(types: !242)
!242 = !{!60, !60, !243}
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !244, size: 64)
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!245 = !DILocalVariable(name: "argc", arg: 1, scope: !240, file: !69, line: 298, type: !60)
!246 = !DILocation(line: 298, column: 14, scope: !240)
!247 = !DILocalVariable(name: "argv", arg: 2, scope: !240, file: !69, line: 298, type: !243)
!248 = !DILocation(line: 298, column: 27, scope: !240)
!249 = !DILocation(line: 301, column: 22, scope: !240)
!250 = !DILocation(line: 301, column: 12, scope: !240)
!251 = !DILocation(line: 301, column: 5, scope: !240)
!252 = !DILocation(line: 303, column: 5, scope: !240)
!253 = !DILocation(line: 304, column: 5, scope: !240)
!254 = !DILocation(line: 305, column: 5, scope: !240)
!255 = !DILocation(line: 308, column: 5, scope: !240)
!256 = !DILocation(line: 309, column: 5, scope: !240)
!257 = !DILocation(line: 310, column: 5, scope: !240)
!258 = !DILocation(line: 312, column: 5, scope: !240)
!259 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 149, type: !70, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!260 = !DILocalVariable(name: "data", scope: !259, file: !69, line: 151, type: !60)
!261 = !DILocation(line: 151, column: 9, scope: !259)
!262 = !DILocalVariable(name: "myUnion", scope: !259, file: !69, line: 152, type: !76)
!263 = !DILocation(line: 152, column: 77, scope: !259)
!264 = !DILocation(line: 154, column: 10, scope: !259)
!265 = !DILocation(line: 157, column: 10, scope: !259)
!266 = !DILocation(line: 158, column: 26, scope: !259)
!267 = !DILocation(line: 158, column: 13, scope: !259)
!268 = !DILocation(line: 158, column: 24, scope: !259)
!269 = !DILocalVariable(name: "data", scope: !270, file: !69, line: 160, type: !60)
!270 = distinct !DILexicalBlock(scope: !259, file: !69, line: 159, column: 5)
!271 = !DILocation(line: 160, column: 13, scope: !270)
!272 = !DILocation(line: 160, column: 28, scope: !270)
!273 = !DILocalVariable(name: "i", scope: !274, file: !69, line: 162, type: !60)
!274 = distinct !DILexicalBlock(scope: !270, file: !69, line: 161, column: 9)
!275 = !DILocation(line: 162, column: 17, scope: !274)
!276 = !DILocalVariable(name: "buffer", scope: !274, file: !69, line: 163, type: !59)
!277 = !DILocation(line: 163, column: 19, scope: !274)
!278 = !DILocation(line: 163, column: 35, scope: !274)
!279 = !DILocation(line: 163, column: 28, scope: !274)
!280 = !DILocation(line: 164, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !274, file: !69, line: 164, column: 17)
!282 = !DILocation(line: 164, column: 24, scope: !281)
!283 = !DILocation(line: 164, column: 17, scope: !274)
!284 = !DILocation(line: 164, column: 34, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !69, line: 164, column: 33)
!286 = !DILocation(line: 166, column: 20, scope: !287)
!287 = distinct !DILexicalBlock(scope: !274, file: !69, line: 166, column: 13)
!288 = !DILocation(line: 166, column: 18, scope: !287)
!289 = !DILocation(line: 166, column: 25, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !69, line: 166, column: 13)
!291 = !DILocation(line: 166, column: 27, scope: !290)
!292 = !DILocation(line: 166, column: 13, scope: !287)
!293 = !DILocation(line: 168, column: 17, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !69, line: 167, column: 13)
!295 = !DILocation(line: 168, column: 24, scope: !294)
!296 = !DILocation(line: 168, column: 27, scope: !294)
!297 = !DILocation(line: 169, column: 13, scope: !294)
!298 = !DILocation(line: 166, column: 34, scope: !290)
!299 = !DILocation(line: 166, column: 13, scope: !290)
!300 = distinct !{!300, !292, !301, !205}
!301 = !DILocation(line: 169, column: 13, scope: !287)
!302 = !DILocation(line: 172, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !274, file: !69, line: 172, column: 17)
!304 = !DILocation(line: 172, column: 22, scope: !303)
!305 = !DILocation(line: 172, column: 17, scope: !274)
!306 = !DILocation(line: 174, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !69, line: 173, column: 13)
!308 = !DILocation(line: 174, column: 24, scope: !307)
!309 = !DILocation(line: 174, column: 30, scope: !307)
!310 = !DILocation(line: 176, column: 23, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !69, line: 176, column: 17)
!312 = !DILocation(line: 176, column: 21, scope: !311)
!313 = !DILocation(line: 176, column: 28, scope: !314)
!314 = distinct !DILexicalBlock(scope: !311, file: !69, line: 176, column: 17)
!315 = !DILocation(line: 176, column: 30, scope: !314)
!316 = !DILocation(line: 176, column: 17, scope: !311)
!317 = !DILocation(line: 178, column: 34, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !69, line: 177, column: 17)
!319 = !DILocation(line: 178, column: 41, scope: !318)
!320 = !DILocation(line: 178, column: 21, scope: !318)
!321 = !DILocation(line: 179, column: 17, scope: !318)
!322 = !DILocation(line: 176, column: 37, scope: !314)
!323 = !DILocation(line: 176, column: 17, scope: !314)
!324 = distinct !{!324, !316, !325, !205}
!325 = !DILocation(line: 179, column: 17, scope: !311)
!326 = !DILocation(line: 180, column: 13, scope: !307)
!327 = !DILocation(line: 183, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !303, file: !69, line: 182, column: 13)
!329 = !DILocation(line: 185, column: 18, scope: !274)
!330 = !DILocation(line: 185, column: 13, scope: !274)
!331 = !DILocation(line: 188, column: 1, scope: !259)
!332 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 191, type: !70, scopeLine: 192, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!333 = !DILocalVariable(name: "data", scope: !332, file: !69, line: 193, type: !60)
!334 = !DILocation(line: 193, column: 9, scope: !332)
!335 = !DILocalVariable(name: "myUnion", scope: !332, file: !69, line: 194, type: !76)
!336 = !DILocation(line: 194, column: 77, scope: !332)
!337 = !DILocation(line: 196, column: 10, scope: !332)
!338 = !DILocalVariable(name: "recvResult", scope: !339, file: !69, line: 202, type: !60)
!339 = distinct !DILexicalBlock(scope: !332, file: !69, line: 197, column: 5)
!340 = !DILocation(line: 202, column: 13, scope: !339)
!341 = !DILocalVariable(name: "service", scope: !339, file: !69, line: 203, type: !87)
!342 = !DILocation(line: 203, column: 28, scope: !339)
!343 = !DILocalVariable(name: "connectSocket", scope: !339, file: !69, line: 204, type: !60)
!344 = !DILocation(line: 204, column: 16, scope: !339)
!345 = !DILocalVariable(name: "inputBuffer", scope: !339, file: !69, line: 205, type: !55)
!346 = !DILocation(line: 205, column: 14, scope: !339)
!347 = !DILocation(line: 206, column: 9, scope: !339)
!348 = !DILocation(line: 216, column: 29, scope: !349)
!349 = distinct !DILexicalBlock(scope: !339, file: !69, line: 207, column: 9)
!350 = !DILocation(line: 216, column: 27, scope: !349)
!351 = !DILocation(line: 217, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !349, file: !69, line: 217, column: 17)
!353 = !DILocation(line: 217, column: 31, scope: !352)
!354 = !DILocation(line: 217, column: 17, scope: !349)
!355 = !DILocation(line: 219, column: 17, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !69, line: 218, column: 13)
!357 = !DILocation(line: 221, column: 13, scope: !349)
!358 = !DILocation(line: 222, column: 21, scope: !349)
!359 = !DILocation(line: 222, column: 32, scope: !349)
!360 = !DILocation(line: 223, column: 39, scope: !349)
!361 = !DILocation(line: 223, column: 21, scope: !349)
!362 = !DILocation(line: 223, column: 30, scope: !349)
!363 = !DILocation(line: 223, column: 37, scope: !349)
!364 = !DILocation(line: 224, column: 32, scope: !349)
!365 = !DILocation(line: 224, column: 21, scope: !349)
!366 = !DILocation(line: 224, column: 30, scope: !349)
!367 = !DILocation(line: 225, column: 25, scope: !368)
!368 = distinct !DILexicalBlock(scope: !349, file: !69, line: 225, column: 17)
!369 = !DILocation(line: 225, column: 40, scope: !368)
!370 = !DILocation(line: 225, column: 17, scope: !368)
!371 = !DILocation(line: 225, column: 85, scope: !368)
!372 = !DILocation(line: 225, column: 17, scope: !349)
!373 = !DILocation(line: 227, column: 17, scope: !374)
!374 = distinct !DILexicalBlock(scope: !368, file: !69, line: 226, column: 13)
!375 = !DILocation(line: 231, column: 31, scope: !349)
!376 = !DILocation(line: 231, column: 46, scope: !349)
!377 = !DILocation(line: 231, column: 26, scope: !349)
!378 = !DILocation(line: 231, column: 24, scope: !349)
!379 = !DILocation(line: 232, column: 17, scope: !380)
!380 = distinct !DILexicalBlock(scope: !349, file: !69, line: 232, column: 17)
!381 = !DILocation(line: 232, column: 28, scope: !380)
!382 = !DILocation(line: 232, column: 44, scope: !380)
!383 = !DILocation(line: 232, column: 47, scope: !380)
!384 = !DILocation(line: 232, column: 58, scope: !380)
!385 = !DILocation(line: 232, column: 17, scope: !349)
!386 = !DILocation(line: 234, column: 17, scope: !387)
!387 = distinct !DILexicalBlock(scope: !380, file: !69, line: 233, column: 13)
!388 = !DILocation(line: 237, column: 25, scope: !349)
!389 = !DILocation(line: 237, column: 13, scope: !349)
!390 = !DILocation(line: 237, column: 37, scope: !349)
!391 = !DILocation(line: 239, column: 25, scope: !349)
!392 = !DILocation(line: 239, column: 20, scope: !349)
!393 = !DILocation(line: 239, column: 18, scope: !349)
!394 = !DILocation(line: 240, column: 9, scope: !349)
!395 = !DILocation(line: 242, column: 13, scope: !396)
!396 = distinct !DILexicalBlock(scope: !339, file: !69, line: 242, column: 13)
!397 = !DILocation(line: 242, column: 27, scope: !396)
!398 = !DILocation(line: 242, column: 13, scope: !339)
!399 = !DILocation(line: 244, column: 26, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !69, line: 243, column: 9)
!401 = !DILocation(line: 244, column: 13, scope: !400)
!402 = !DILocation(line: 245, column: 9, scope: !400)
!403 = !DILocation(line: 253, column: 26, scope: !332)
!404 = !DILocation(line: 253, column: 13, scope: !332)
!405 = !DILocation(line: 253, column: 24, scope: !332)
!406 = !DILocalVariable(name: "data", scope: !407, file: !69, line: 255, type: !60)
!407 = distinct !DILexicalBlock(scope: !332, file: !69, line: 254, column: 5)
!408 = !DILocation(line: 255, column: 13, scope: !407)
!409 = !DILocation(line: 255, column: 28, scope: !407)
!410 = !DILocalVariable(name: "i", scope: !411, file: !69, line: 257, type: !60)
!411 = distinct !DILexicalBlock(scope: !407, file: !69, line: 256, column: 9)
!412 = !DILocation(line: 257, column: 17, scope: !411)
!413 = !DILocalVariable(name: "buffer", scope: !411, file: !69, line: 258, type: !59)
!414 = !DILocation(line: 258, column: 19, scope: !411)
!415 = !DILocation(line: 258, column: 35, scope: !411)
!416 = !DILocation(line: 258, column: 28, scope: !411)
!417 = !DILocation(line: 259, column: 17, scope: !418)
!418 = distinct !DILexicalBlock(scope: !411, file: !69, line: 259, column: 17)
!419 = !DILocation(line: 259, column: 24, scope: !418)
!420 = !DILocation(line: 259, column: 17, scope: !411)
!421 = !DILocation(line: 259, column: 34, scope: !422)
!422 = distinct !DILexicalBlock(scope: !418, file: !69, line: 259, column: 33)
!423 = !DILocation(line: 261, column: 20, scope: !424)
!424 = distinct !DILexicalBlock(scope: !411, file: !69, line: 261, column: 13)
!425 = !DILocation(line: 261, column: 18, scope: !424)
!426 = !DILocation(line: 261, column: 25, scope: !427)
!427 = distinct !DILexicalBlock(scope: !424, file: !69, line: 261, column: 13)
!428 = !DILocation(line: 261, column: 27, scope: !427)
!429 = !DILocation(line: 261, column: 13, scope: !424)
!430 = !DILocation(line: 263, column: 17, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !69, line: 262, column: 13)
!432 = !DILocation(line: 263, column: 24, scope: !431)
!433 = !DILocation(line: 263, column: 27, scope: !431)
!434 = !DILocation(line: 264, column: 13, scope: !431)
!435 = !DILocation(line: 261, column: 34, scope: !427)
!436 = !DILocation(line: 261, column: 13, scope: !427)
!437 = distinct !{!437, !429, !438, !205}
!438 = !DILocation(line: 264, column: 13, scope: !424)
!439 = !DILocation(line: 266, column: 17, scope: !440)
!440 = distinct !DILexicalBlock(scope: !411, file: !69, line: 266, column: 17)
!441 = !DILocation(line: 266, column: 22, scope: !440)
!442 = !DILocation(line: 266, column: 27, scope: !440)
!443 = !DILocation(line: 266, column: 30, scope: !440)
!444 = !DILocation(line: 266, column: 35, scope: !440)
!445 = !DILocation(line: 266, column: 17, scope: !411)
!446 = !DILocation(line: 268, column: 17, scope: !447)
!447 = distinct !DILexicalBlock(scope: !440, file: !69, line: 267, column: 13)
!448 = !DILocation(line: 268, column: 24, scope: !447)
!449 = !DILocation(line: 268, column: 30, scope: !447)
!450 = !DILocation(line: 270, column: 23, scope: !451)
!451 = distinct !DILexicalBlock(scope: !447, file: !69, line: 270, column: 17)
!452 = !DILocation(line: 270, column: 21, scope: !451)
!453 = !DILocation(line: 270, column: 28, scope: !454)
!454 = distinct !DILexicalBlock(scope: !451, file: !69, line: 270, column: 17)
!455 = !DILocation(line: 270, column: 30, scope: !454)
!456 = !DILocation(line: 270, column: 17, scope: !451)
!457 = !DILocation(line: 272, column: 34, scope: !458)
!458 = distinct !DILexicalBlock(scope: !454, file: !69, line: 271, column: 17)
!459 = !DILocation(line: 272, column: 41, scope: !458)
!460 = !DILocation(line: 272, column: 21, scope: !458)
!461 = !DILocation(line: 273, column: 17, scope: !458)
!462 = !DILocation(line: 270, column: 37, scope: !454)
!463 = !DILocation(line: 270, column: 17, scope: !454)
!464 = distinct !{!464, !456, !465, !205}
!465 = !DILocation(line: 273, column: 17, scope: !451)
!466 = !DILocation(line: 274, column: 13, scope: !447)
!467 = !DILocation(line: 277, column: 17, scope: !468)
!468 = distinct !DILexicalBlock(scope: !440, file: !69, line: 276, column: 13)
!469 = !DILocation(line: 279, column: 18, scope: !411)
!470 = !DILocation(line: 279, column: 13, scope: !411)
!471 = !DILocation(line: 282, column: 1, scope: !332)
