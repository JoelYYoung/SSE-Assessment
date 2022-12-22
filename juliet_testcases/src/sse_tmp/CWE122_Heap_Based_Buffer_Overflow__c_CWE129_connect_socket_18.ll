; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_18.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_18_bad() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 -1, i32* %data, align 4, !dbg !75
  br label %source, !dbg !76

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !77), !dbg !78
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !82, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %connectSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  br label %do.body, !dbg !109

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !110
  store i32 %call, i32* %connectSocket, align 4, !dbg !112
  %0 = load i32, i32* %connectSocket, align 4, !dbg !113
  %cmp = icmp eq i32 %0, -1, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !117

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !119
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !120
  store i16 2, i16* %sin_family, align 4, !dbg !121
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !122
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !123
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !124
  store i32 %call1, i32* %s_addr, align 4, !dbg !125
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !126
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !127
  store i16 %call2, i16* %sin_port, align 2, !dbg !128
  %2 = load i32, i32* %connectSocket, align 4, !dbg !129
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !131
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !132
  %cmp4 = icmp eq i32 %call3, -1, !dbg !133
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !134

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !135

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !137
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !138
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !139
  %conv = trunc i64 %call7 to i32, !dbg !139
  store i32 %conv, i32* %recvResult, align 4, !dbg !140
  %5 = load i32, i32* %recvResult, align 4, !dbg !141
  %cmp8 = icmp eq i32 %5, -1, !dbg !143
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !144

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !145
  %cmp10 = icmp eq i32 %6, 0, !dbg !146
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !147

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !148

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !150
  %idxprom = sext i32 %7 to i64, !dbg !151
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !151
  store i8 0, i8* %arrayidx, align 1, !dbg !152
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !153
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !154
  store i32 %call15, i32* %data, align 4, !dbg !155
  br label %do.end, !dbg !156

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !157
  %cmp16 = icmp ne i32 %8, -1, !dbg !159
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !160

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !161
  %call19 = call i32 @close(i32 %9), !dbg !163
  br label %if.end20, !dbg !164

if.end20:                                         ; preds = %if.then18, %do.end
  br label %sink, !dbg !165

sink:                                             ; preds = %if.end20
  call void @llvm.dbg.label(metadata !166), !dbg !167
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !171, metadata !DIExpression()), !dbg !172
  %call21 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !173
  %10 = bitcast i8* %call21 to i32*, !dbg !174
  store i32* %10, i32** %buffer, align 8, !dbg !172
  %11 = load i32*, i32** %buffer, align 8, !dbg !175
  %cmp22 = icmp eq i32* %11, null, !dbg !177
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !178

if.then24:                                        ; preds = %sink
  call void @exit(i32 -1) #11, !dbg !179
  unreachable, !dbg !179

if.end25:                                         ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.end25
  %12 = load i32, i32* %i, align 4, !dbg !184
  %cmp26 = icmp slt i32 %12, 10, !dbg !186
  br i1 %cmp26, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !188
  %14 = load i32, i32* %i, align 4, !dbg !190
  %idxprom28 = sext i32 %14 to i64, !dbg !188
  %arrayidx29 = getelementptr inbounds i32, i32* %13, i64 %idxprom28, !dbg !188
  store i32 0, i32* %arrayidx29, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !193
  %inc = add nsw i32 %15, 1, !dbg !193
  store i32 %inc, i32* %i, align 4, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !198
  %cmp30 = icmp sge i32 %16, 0, !dbg !200
  br i1 %cmp30, label %if.then32, label %if.else, !dbg !201

if.then32:                                        ; preds = %for.end
  %17 = load i32*, i32** %buffer, align 8, !dbg !202
  %18 = load i32, i32* %data, align 4, !dbg !204
  %idxprom33 = sext i32 %18 to i64, !dbg !202
  %arrayidx34 = getelementptr inbounds i32, i32* %17, i64 %idxprom33, !dbg !202
  store i32 1, i32* %arrayidx34, align 4, !dbg !205
  store i32 0, i32* %i, align 4, !dbg !206
  br label %for.cond35, !dbg !208

for.cond35:                                       ; preds = %for.inc41, %if.then32
  %19 = load i32, i32* %i, align 4, !dbg !209
  %cmp36 = icmp slt i32 %19, 10, !dbg !211
  br i1 %cmp36, label %for.body38, label %for.end43, !dbg !212

for.body38:                                       ; preds = %for.cond35
  %20 = load i32*, i32** %buffer, align 8, !dbg !213
  %21 = load i32, i32* %i, align 4, !dbg !215
  %idxprom39 = sext i32 %21 to i64, !dbg !213
  %arrayidx40 = getelementptr inbounds i32, i32* %20, i64 %idxprom39, !dbg !213
  %22 = load i32, i32* %arrayidx40, align 4, !dbg !213
  call void @printIntLine(i32 %22), !dbg !216
  br label %for.inc41, !dbg !217

for.inc41:                                        ; preds = %for.body38
  %23 = load i32, i32* %i, align 4, !dbg !218
  %inc42 = add nsw i32 %23, 1, !dbg !218
  store i32 %inc42, i32* %i, align 4, !dbg !218
  br label %for.cond35, !dbg !219, !llvm.loop !220

for.end43:                                        ; preds = %for.cond35
  br label %if.end44, !dbg !222

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !223
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end43
  %24 = load i32*, i32** %buffer, align 8, !dbg !225
  %25 = bitcast i32* %24 to i8*, !dbg !225
  call void @free(i8* %25) #8, !dbg !226
  ret void, !dbg !227
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_18_good() #0 !dbg !228 {
entry:
  call void @goodB2G(), !dbg !229
  call void @goodG2B(), !dbg !230
  ret void, !dbg !231
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !232 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !237, metadata !DIExpression()), !dbg !238
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !239, metadata !DIExpression()), !dbg !240
  %call = call i64 @time(i64* null) #8, !dbg !241
  %conv = trunc i64 %call to i32, !dbg !242
  call void @srand(i32 %conv) #8, !dbg !243
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !244
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_18_good(), !dbg !245
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !246
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !247
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_18_bad(), !dbg !248
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !249
  ret i32 0, !dbg !250
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !251 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 -1, i32* %data, align 4, !dbg !254
  br label %source, !dbg !255

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !256), !dbg !257
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !258, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !261, metadata !DIExpression()), !dbg !262
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 -1, i32* %connectSocket, align 4, !dbg !264
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !265, metadata !DIExpression()), !dbg !266
  br label %do.body, !dbg !267

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !268
  store i32 %call, i32* %connectSocket, align 4, !dbg !270
  %0 = load i32, i32* %connectSocket, align 4, !dbg !271
  %cmp = icmp eq i32 %0, -1, !dbg !273
  br i1 %cmp, label %if.then, label %if.end, !dbg !274

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !275

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !277
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !277
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !278
  store i16 2, i16* %sin_family, align 4, !dbg !279
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !280
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !281
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !282
  store i32 %call1, i32* %s_addr, align 4, !dbg !283
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !284
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !285
  store i16 %call2, i16* %sin_port, align 2, !dbg !286
  %2 = load i32, i32* %connectSocket, align 4, !dbg !287
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !289
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !290
  %cmp4 = icmp eq i32 %call3, -1, !dbg !291
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !292

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !293

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !295
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !296
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !297
  %conv = trunc i64 %call7 to i32, !dbg !297
  store i32 %conv, i32* %recvResult, align 4, !dbg !298
  %5 = load i32, i32* %recvResult, align 4, !dbg !299
  %cmp8 = icmp eq i32 %5, -1, !dbg !301
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !302

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !303
  %cmp10 = icmp eq i32 %6, 0, !dbg !304
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !305

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !306

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !308
  %idxprom = sext i32 %7 to i64, !dbg !309
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !309
  store i8 0, i8* %arrayidx, align 1, !dbg !310
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !311
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !312
  store i32 %call15, i32* %data, align 4, !dbg !313
  br label %do.end, !dbg !314

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !315
  %cmp16 = icmp ne i32 %8, -1, !dbg !317
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !318

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !319
  %call19 = call i32 @close(i32 %9), !dbg !321
  br label %if.end20, !dbg !322

if.end20:                                         ; preds = %if.then18, %do.end
  br label %sink, !dbg !323

sink:                                             ; preds = %if.end20
  call void @llvm.dbg.label(metadata !324), !dbg !325
  call void @llvm.dbg.declare(metadata i32* %i, metadata !326, metadata !DIExpression()), !dbg !328
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !329, metadata !DIExpression()), !dbg !330
  %call21 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !331
  %10 = bitcast i8* %call21 to i32*, !dbg !332
  store i32* %10, i32** %buffer, align 8, !dbg !330
  %11 = load i32*, i32** %buffer, align 8, !dbg !333
  %cmp22 = icmp eq i32* %11, null, !dbg !335
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !336

if.then24:                                        ; preds = %sink
  call void @exit(i32 -1) #11, !dbg !337
  unreachable, !dbg !337

if.end25:                                         ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !339
  br label %for.cond, !dbg !341

for.cond:                                         ; preds = %for.inc, %if.end25
  %12 = load i32, i32* %i, align 4, !dbg !342
  %cmp26 = icmp slt i32 %12, 10, !dbg !344
  br i1 %cmp26, label %for.body, label %for.end, !dbg !345

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !346
  %14 = load i32, i32* %i, align 4, !dbg !348
  %idxprom28 = sext i32 %14 to i64, !dbg !346
  %arrayidx29 = getelementptr inbounds i32, i32* %13, i64 %idxprom28, !dbg !346
  store i32 0, i32* %arrayidx29, align 4, !dbg !349
  br label %for.inc, !dbg !350

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !351
  %inc = add nsw i32 %15, 1, !dbg !351
  store i32 %inc, i32* %i, align 4, !dbg !351
  br label %for.cond, !dbg !352, !llvm.loop !353

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !355
  %cmp30 = icmp sge i32 %16, 0, !dbg !357
  br i1 %cmp30, label %land.lhs.true, label %if.else, !dbg !358

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !359
  %cmp32 = icmp slt i32 %17, 10, !dbg !360
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !361

if.then34:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !362
  %19 = load i32, i32* %data, align 4, !dbg !364
  %idxprom35 = sext i32 %19 to i64, !dbg !362
  %arrayidx36 = getelementptr inbounds i32, i32* %18, i64 %idxprom35, !dbg !362
  store i32 1, i32* %arrayidx36, align 4, !dbg !365
  store i32 0, i32* %i, align 4, !dbg !366
  br label %for.cond37, !dbg !368

for.cond37:                                       ; preds = %for.inc43, %if.then34
  %20 = load i32, i32* %i, align 4, !dbg !369
  %cmp38 = icmp slt i32 %20, 10, !dbg !371
  br i1 %cmp38, label %for.body40, label %for.end45, !dbg !372

for.body40:                                       ; preds = %for.cond37
  %21 = load i32*, i32** %buffer, align 8, !dbg !373
  %22 = load i32, i32* %i, align 4, !dbg !375
  %idxprom41 = sext i32 %22 to i64, !dbg !373
  %arrayidx42 = getelementptr inbounds i32, i32* %21, i64 %idxprom41, !dbg !373
  %23 = load i32, i32* %arrayidx42, align 4, !dbg !373
  call void @printIntLine(i32 %23), !dbg !376
  br label %for.inc43, !dbg !377

for.inc43:                                        ; preds = %for.body40
  %24 = load i32, i32* %i, align 4, !dbg !378
  %inc44 = add nsw i32 %24, 1, !dbg !378
  store i32 %inc44, i32* %i, align 4, !dbg !378
  br label %for.cond37, !dbg !379, !llvm.loop !380

for.end45:                                        ; preds = %for.cond37
  br label %if.end46, !dbg !382

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !383
  br label %if.end46

if.end46:                                         ; preds = %if.else, %for.end45
  %25 = load i32*, i32** %buffer, align 8, !dbg !385
  %26 = bitcast i32* %25 to i8*, !dbg !385
  call void @free(i8* %26) #8, !dbg !386
  ret void, !dbg !387
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !388 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !389, metadata !DIExpression()), !dbg !390
  store i32 -1, i32* %data, align 4, !dbg !391
  br label %source, !dbg !392

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !393), !dbg !394
  store i32 7, i32* %data, align 4, !dbg !395
  br label %sink, !dbg !396

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !397), !dbg !398
  call void @llvm.dbg.declare(metadata i32* %i, metadata !399, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !402, metadata !DIExpression()), !dbg !403
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !404
  %0 = bitcast i8* %call to i32*, !dbg !405
  store i32* %0, i32** %buffer, align 8, !dbg !403
  %1 = load i32*, i32** %buffer, align 8, !dbg !406
  %cmp = icmp eq i32* %1, null, !dbg !408
  br i1 %cmp, label %if.then, label %if.end, !dbg !409

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #11, !dbg !410
  unreachable, !dbg !410

if.end:                                           ; preds = %sink
  store i32 0, i32* %i, align 4, !dbg !412
  br label %for.cond, !dbg !414

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !415
  %cmp1 = icmp slt i32 %2, 10, !dbg !417
  br i1 %cmp1, label %for.body, label %for.end, !dbg !418

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !419
  %4 = load i32, i32* %i, align 4, !dbg !421
  %idxprom = sext i32 %4 to i64, !dbg !419
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !419
  store i32 0, i32* %arrayidx, align 4, !dbg !422
  br label %for.inc, !dbg !423

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !424
  %inc = add nsw i32 %5, 1, !dbg !424
  store i32 %inc, i32* %i, align 4, !dbg !424
  br label %for.cond, !dbg !425, !llvm.loop !426

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !428
  %cmp2 = icmp sge i32 %6, 0, !dbg !430
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !431

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !432
  %8 = load i32, i32* %data, align 4, !dbg !434
  %idxprom4 = sext i32 %8 to i64, !dbg !432
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !432
  store i32 1, i32* %arrayidx5, align 4, !dbg !435
  store i32 0, i32* %i, align 4, !dbg !436
  br label %for.cond6, !dbg !438

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !439
  %cmp7 = icmp slt i32 %9, 10, !dbg !441
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !442

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !443
  %11 = load i32, i32* %i, align 4, !dbg !445
  %idxprom9 = sext i32 %11 to i64, !dbg !443
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !443
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !443
  call void @printIntLine(i32 %12), !dbg !446
  br label %for.inc11, !dbg !447

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !448
  %inc12 = add nsw i32 %13, 1, !dbg !448
  store i32 %inc12, i32* %i, align 4, !dbg !448
  br label %for.cond6, !dbg !449, !llvm.loop !450

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !452

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !453
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !455
  %15 = bitcast i32* %14 to i8*, !dbg !455
  call void @free(i8* %15) #8, !dbg !456
  ret void, !dbg !457
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_18.c", directory: "/root/SSE-Assessment")
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
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!62 = !{i32 7, !"Dwarf Version", i32 4}
!63 = !{i32 2, !"Debug Info Version", i32 3}
!64 = !{i32 1, !"wchar_size", i32 4}
!65 = !{i32 7, !"uwtable", i32 1}
!66 = !{i32 7, !"frame-pointer", i32 2}
!67 = !{!"clang version 13.0.0"}
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_18_bad", scope: !69, file: !69, line: 44, type: !70, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_18.c", directory: "/root/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 46, type: !60)
!74 = !DILocation(line: 46, column: 9, scope: !68)
!75 = !DILocation(line: 48, column: 10, scope: !68)
!76 = !DILocation(line: 49, column: 5, scope: !68)
!77 = !DILabel(scope: !68, name: "source", file: !69, line: 50)
!78 = !DILocation(line: 50, column: 1, scope: !68)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !69, line: 56, type: !60)
!80 = distinct !DILexicalBlock(scope: !68, file: !69, line: 51, column: 5)
!81 = !DILocation(line: 56, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !69, line: 57, type: !83)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !84)
!84 = !{!85, !86, !92, !99}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !83, file: !17, line: 239, baseType: !51, size: 16)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !83, file: !17, line: 240, baseType: !87, size: 16, offset: 16)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !89, line: 25, baseType: !90)
!89 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !91, line: 39, baseType: !53)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !83, file: !17, line: 241, baseType: !93, size: 32, offset: 32)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !94)
!94 = !{!95}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !93, file: !17, line: 33, baseType: !96, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !89, line: 26, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !91, line: 41, baseType: !5)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !83, file: !17, line: 244, baseType: !100, size: 64, offset: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 64, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 8)
!104 = !DILocation(line: 57, column: 28, scope: !80)
!105 = !DILocalVariable(name: "connectSocket", scope: !80, file: !69, line: 58, type: !60)
!106 = !DILocation(line: 58, column: 16, scope: !80)
!107 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !69, line: 59, type: !55)
!108 = !DILocation(line: 59, column: 14, scope: !80)
!109 = !DILocation(line: 60, column: 9, scope: !80)
!110 = !DILocation(line: 70, column: 29, scope: !111)
!111 = distinct !DILexicalBlock(scope: !80, file: !69, line: 61, column: 9)
!112 = !DILocation(line: 70, column: 27, scope: !111)
!113 = !DILocation(line: 71, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !69, line: 71, column: 17)
!115 = !DILocation(line: 71, column: 31, scope: !114)
!116 = !DILocation(line: 71, column: 17, scope: !111)
!117 = !DILocation(line: 73, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !69, line: 72, column: 13)
!119 = !DILocation(line: 75, column: 13, scope: !111)
!120 = !DILocation(line: 76, column: 21, scope: !111)
!121 = !DILocation(line: 76, column: 32, scope: !111)
!122 = !DILocation(line: 77, column: 39, scope: !111)
!123 = !DILocation(line: 77, column: 21, scope: !111)
!124 = !DILocation(line: 77, column: 30, scope: !111)
!125 = !DILocation(line: 77, column: 37, scope: !111)
!126 = !DILocation(line: 78, column: 32, scope: !111)
!127 = !DILocation(line: 78, column: 21, scope: !111)
!128 = !DILocation(line: 78, column: 30, scope: !111)
!129 = !DILocation(line: 79, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !111, file: !69, line: 79, column: 17)
!131 = !DILocation(line: 79, column: 40, scope: !130)
!132 = !DILocation(line: 79, column: 17, scope: !130)
!133 = !DILocation(line: 79, column: 85, scope: !130)
!134 = !DILocation(line: 79, column: 17, scope: !111)
!135 = !DILocation(line: 81, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !69, line: 80, column: 13)
!137 = !DILocation(line: 85, column: 31, scope: !111)
!138 = !DILocation(line: 85, column: 46, scope: !111)
!139 = !DILocation(line: 85, column: 26, scope: !111)
!140 = !DILocation(line: 85, column: 24, scope: !111)
!141 = !DILocation(line: 86, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !111, file: !69, line: 86, column: 17)
!143 = !DILocation(line: 86, column: 28, scope: !142)
!144 = !DILocation(line: 86, column: 44, scope: !142)
!145 = !DILocation(line: 86, column: 47, scope: !142)
!146 = !DILocation(line: 86, column: 58, scope: !142)
!147 = !DILocation(line: 86, column: 17, scope: !111)
!148 = !DILocation(line: 88, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !142, file: !69, line: 87, column: 13)
!150 = !DILocation(line: 91, column: 25, scope: !111)
!151 = !DILocation(line: 91, column: 13, scope: !111)
!152 = !DILocation(line: 91, column: 37, scope: !111)
!153 = !DILocation(line: 93, column: 25, scope: !111)
!154 = !DILocation(line: 93, column: 20, scope: !111)
!155 = !DILocation(line: 93, column: 18, scope: !111)
!156 = !DILocation(line: 94, column: 9, scope: !111)
!157 = !DILocation(line: 96, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !80, file: !69, line: 96, column: 13)
!159 = !DILocation(line: 96, column: 27, scope: !158)
!160 = !DILocation(line: 96, column: 13, scope: !80)
!161 = !DILocation(line: 98, column: 26, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !69, line: 97, column: 9)
!163 = !DILocation(line: 98, column: 13, scope: !162)
!164 = !DILocation(line: 99, column: 9, scope: !162)
!165 = !DILocation(line: 107, column: 5, scope: !68)
!166 = !DILabel(scope: !68, name: "sink", file: !69, line: 108)
!167 = !DILocation(line: 108, column: 1, scope: !68)
!168 = !DILocalVariable(name: "i", scope: !169, file: !69, line: 110, type: !60)
!169 = distinct !DILexicalBlock(scope: !68, file: !69, line: 109, column: 5)
!170 = !DILocation(line: 110, column: 13, scope: !169)
!171 = !DILocalVariable(name: "buffer", scope: !169, file: !69, line: 111, type: !59)
!172 = !DILocation(line: 111, column: 15, scope: !169)
!173 = !DILocation(line: 111, column: 31, scope: !169)
!174 = !DILocation(line: 111, column: 24, scope: !169)
!175 = !DILocation(line: 112, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !169, file: !69, line: 112, column: 13)
!177 = !DILocation(line: 112, column: 20, scope: !176)
!178 = !DILocation(line: 112, column: 13, scope: !169)
!179 = !DILocation(line: 112, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !69, line: 112, column: 29)
!181 = !DILocation(line: 114, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !169, file: !69, line: 114, column: 9)
!183 = !DILocation(line: 114, column: 14, scope: !182)
!184 = !DILocation(line: 114, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !69, line: 114, column: 9)
!186 = !DILocation(line: 114, column: 23, scope: !185)
!187 = !DILocation(line: 114, column: 9, scope: !182)
!188 = !DILocation(line: 116, column: 13, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !69, line: 115, column: 9)
!190 = !DILocation(line: 116, column: 20, scope: !189)
!191 = !DILocation(line: 116, column: 23, scope: !189)
!192 = !DILocation(line: 117, column: 9, scope: !189)
!193 = !DILocation(line: 114, column: 30, scope: !185)
!194 = !DILocation(line: 114, column: 9, scope: !185)
!195 = distinct !{!195, !187, !196, !197}
!196 = !DILocation(line: 117, column: 9, scope: !182)
!197 = !{!"llvm.loop.mustprogress"}
!198 = !DILocation(line: 120, column: 13, scope: !199)
!199 = distinct !DILexicalBlock(scope: !169, file: !69, line: 120, column: 13)
!200 = !DILocation(line: 120, column: 18, scope: !199)
!201 = !DILocation(line: 120, column: 13, scope: !169)
!202 = !DILocation(line: 122, column: 13, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !69, line: 121, column: 9)
!204 = !DILocation(line: 122, column: 20, scope: !203)
!205 = !DILocation(line: 122, column: 26, scope: !203)
!206 = !DILocation(line: 124, column: 19, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !69, line: 124, column: 13)
!208 = !DILocation(line: 124, column: 17, scope: !207)
!209 = !DILocation(line: 124, column: 24, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !69, line: 124, column: 13)
!211 = !DILocation(line: 124, column: 26, scope: !210)
!212 = !DILocation(line: 124, column: 13, scope: !207)
!213 = !DILocation(line: 126, column: 30, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !69, line: 125, column: 13)
!215 = !DILocation(line: 126, column: 37, scope: !214)
!216 = !DILocation(line: 126, column: 17, scope: !214)
!217 = !DILocation(line: 127, column: 13, scope: !214)
!218 = !DILocation(line: 124, column: 33, scope: !210)
!219 = !DILocation(line: 124, column: 13, scope: !210)
!220 = distinct !{!220, !212, !221, !197}
!221 = !DILocation(line: 127, column: 13, scope: !207)
!222 = !DILocation(line: 128, column: 9, scope: !203)
!223 = !DILocation(line: 131, column: 13, scope: !224)
!224 = distinct !DILexicalBlock(scope: !199, file: !69, line: 130, column: 9)
!225 = !DILocation(line: 133, column: 14, scope: !169)
!226 = !DILocation(line: 133, column: 9, scope: !169)
!227 = !DILocation(line: 135, column: 1, scope: !68)
!228 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_18_good", scope: !69, file: !69, line: 275, type: !70, scopeLine: 276, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!229 = !DILocation(line: 277, column: 5, scope: !228)
!230 = !DILocation(line: 278, column: 5, scope: !228)
!231 = !DILocation(line: 279, column: 1, scope: !228)
!232 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 290, type: !233, scopeLine: 291, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!233 = !DISubroutineType(types: !234)
!234 = !{!60, !60, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!237 = !DILocalVariable(name: "argc", arg: 1, scope: !232, file: !69, line: 290, type: !60)
!238 = !DILocation(line: 290, column: 14, scope: !232)
!239 = !DILocalVariable(name: "argv", arg: 2, scope: !232, file: !69, line: 290, type: !235)
!240 = !DILocation(line: 290, column: 27, scope: !232)
!241 = !DILocation(line: 293, column: 22, scope: !232)
!242 = !DILocation(line: 293, column: 12, scope: !232)
!243 = !DILocation(line: 293, column: 5, scope: !232)
!244 = !DILocation(line: 295, column: 5, scope: !232)
!245 = !DILocation(line: 296, column: 5, scope: !232)
!246 = !DILocation(line: 297, column: 5, scope: !232)
!247 = !DILocation(line: 300, column: 5, scope: !232)
!248 = !DILocation(line: 301, column: 5, scope: !232)
!249 = !DILocation(line: 302, column: 5, scope: !232)
!250 = !DILocation(line: 304, column: 5, scope: !232)
!251 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 142, type: !70, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!252 = !DILocalVariable(name: "data", scope: !251, file: !69, line: 144, type: !60)
!253 = !DILocation(line: 144, column: 9, scope: !251)
!254 = !DILocation(line: 146, column: 10, scope: !251)
!255 = !DILocation(line: 147, column: 5, scope: !251)
!256 = !DILabel(scope: !251, name: "source", file: !69, line: 148)
!257 = !DILocation(line: 148, column: 1, scope: !251)
!258 = !DILocalVariable(name: "recvResult", scope: !259, file: !69, line: 154, type: !60)
!259 = distinct !DILexicalBlock(scope: !251, file: !69, line: 149, column: 5)
!260 = !DILocation(line: 154, column: 13, scope: !259)
!261 = !DILocalVariable(name: "service", scope: !259, file: !69, line: 155, type: !83)
!262 = !DILocation(line: 155, column: 28, scope: !259)
!263 = !DILocalVariable(name: "connectSocket", scope: !259, file: !69, line: 156, type: !60)
!264 = !DILocation(line: 156, column: 16, scope: !259)
!265 = !DILocalVariable(name: "inputBuffer", scope: !259, file: !69, line: 157, type: !55)
!266 = !DILocation(line: 157, column: 14, scope: !259)
!267 = !DILocation(line: 158, column: 9, scope: !259)
!268 = !DILocation(line: 168, column: 29, scope: !269)
!269 = distinct !DILexicalBlock(scope: !259, file: !69, line: 159, column: 9)
!270 = !DILocation(line: 168, column: 27, scope: !269)
!271 = !DILocation(line: 169, column: 17, scope: !272)
!272 = distinct !DILexicalBlock(scope: !269, file: !69, line: 169, column: 17)
!273 = !DILocation(line: 169, column: 31, scope: !272)
!274 = !DILocation(line: 169, column: 17, scope: !269)
!275 = !DILocation(line: 171, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !69, line: 170, column: 13)
!277 = !DILocation(line: 173, column: 13, scope: !269)
!278 = !DILocation(line: 174, column: 21, scope: !269)
!279 = !DILocation(line: 174, column: 32, scope: !269)
!280 = !DILocation(line: 175, column: 39, scope: !269)
!281 = !DILocation(line: 175, column: 21, scope: !269)
!282 = !DILocation(line: 175, column: 30, scope: !269)
!283 = !DILocation(line: 175, column: 37, scope: !269)
!284 = !DILocation(line: 176, column: 32, scope: !269)
!285 = !DILocation(line: 176, column: 21, scope: !269)
!286 = !DILocation(line: 176, column: 30, scope: !269)
!287 = !DILocation(line: 177, column: 25, scope: !288)
!288 = distinct !DILexicalBlock(scope: !269, file: !69, line: 177, column: 17)
!289 = !DILocation(line: 177, column: 40, scope: !288)
!290 = !DILocation(line: 177, column: 17, scope: !288)
!291 = !DILocation(line: 177, column: 85, scope: !288)
!292 = !DILocation(line: 177, column: 17, scope: !269)
!293 = !DILocation(line: 179, column: 17, scope: !294)
!294 = distinct !DILexicalBlock(scope: !288, file: !69, line: 178, column: 13)
!295 = !DILocation(line: 183, column: 31, scope: !269)
!296 = !DILocation(line: 183, column: 46, scope: !269)
!297 = !DILocation(line: 183, column: 26, scope: !269)
!298 = !DILocation(line: 183, column: 24, scope: !269)
!299 = !DILocation(line: 184, column: 17, scope: !300)
!300 = distinct !DILexicalBlock(scope: !269, file: !69, line: 184, column: 17)
!301 = !DILocation(line: 184, column: 28, scope: !300)
!302 = !DILocation(line: 184, column: 44, scope: !300)
!303 = !DILocation(line: 184, column: 47, scope: !300)
!304 = !DILocation(line: 184, column: 58, scope: !300)
!305 = !DILocation(line: 184, column: 17, scope: !269)
!306 = !DILocation(line: 186, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !300, file: !69, line: 185, column: 13)
!308 = !DILocation(line: 189, column: 25, scope: !269)
!309 = !DILocation(line: 189, column: 13, scope: !269)
!310 = !DILocation(line: 189, column: 37, scope: !269)
!311 = !DILocation(line: 191, column: 25, scope: !269)
!312 = !DILocation(line: 191, column: 20, scope: !269)
!313 = !DILocation(line: 191, column: 18, scope: !269)
!314 = !DILocation(line: 192, column: 9, scope: !269)
!315 = !DILocation(line: 194, column: 13, scope: !316)
!316 = distinct !DILexicalBlock(scope: !259, file: !69, line: 194, column: 13)
!317 = !DILocation(line: 194, column: 27, scope: !316)
!318 = !DILocation(line: 194, column: 13, scope: !259)
!319 = !DILocation(line: 196, column: 26, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !69, line: 195, column: 9)
!321 = !DILocation(line: 196, column: 13, scope: !320)
!322 = !DILocation(line: 197, column: 9, scope: !320)
!323 = !DILocation(line: 205, column: 5, scope: !251)
!324 = !DILabel(scope: !251, name: "sink", file: !69, line: 206)
!325 = !DILocation(line: 206, column: 1, scope: !251)
!326 = !DILocalVariable(name: "i", scope: !327, file: !69, line: 208, type: !60)
!327 = distinct !DILexicalBlock(scope: !251, file: !69, line: 207, column: 5)
!328 = !DILocation(line: 208, column: 13, scope: !327)
!329 = !DILocalVariable(name: "buffer", scope: !327, file: !69, line: 209, type: !59)
!330 = !DILocation(line: 209, column: 15, scope: !327)
!331 = !DILocation(line: 209, column: 31, scope: !327)
!332 = !DILocation(line: 209, column: 24, scope: !327)
!333 = !DILocation(line: 210, column: 13, scope: !334)
!334 = distinct !DILexicalBlock(scope: !327, file: !69, line: 210, column: 13)
!335 = !DILocation(line: 210, column: 20, scope: !334)
!336 = !DILocation(line: 210, column: 13, scope: !327)
!337 = !DILocation(line: 210, column: 30, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !69, line: 210, column: 29)
!339 = !DILocation(line: 212, column: 16, scope: !340)
!340 = distinct !DILexicalBlock(scope: !327, file: !69, line: 212, column: 9)
!341 = !DILocation(line: 212, column: 14, scope: !340)
!342 = !DILocation(line: 212, column: 21, scope: !343)
!343 = distinct !DILexicalBlock(scope: !340, file: !69, line: 212, column: 9)
!344 = !DILocation(line: 212, column: 23, scope: !343)
!345 = !DILocation(line: 212, column: 9, scope: !340)
!346 = !DILocation(line: 214, column: 13, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !69, line: 213, column: 9)
!348 = !DILocation(line: 214, column: 20, scope: !347)
!349 = !DILocation(line: 214, column: 23, scope: !347)
!350 = !DILocation(line: 215, column: 9, scope: !347)
!351 = !DILocation(line: 212, column: 30, scope: !343)
!352 = !DILocation(line: 212, column: 9, scope: !343)
!353 = distinct !{!353, !345, !354, !197}
!354 = !DILocation(line: 215, column: 9, scope: !340)
!355 = !DILocation(line: 217, column: 13, scope: !356)
!356 = distinct !DILexicalBlock(scope: !327, file: !69, line: 217, column: 13)
!357 = !DILocation(line: 217, column: 18, scope: !356)
!358 = !DILocation(line: 217, column: 23, scope: !356)
!359 = !DILocation(line: 217, column: 26, scope: !356)
!360 = !DILocation(line: 217, column: 31, scope: !356)
!361 = !DILocation(line: 217, column: 13, scope: !327)
!362 = !DILocation(line: 219, column: 13, scope: !363)
!363 = distinct !DILexicalBlock(scope: !356, file: !69, line: 218, column: 9)
!364 = !DILocation(line: 219, column: 20, scope: !363)
!365 = !DILocation(line: 219, column: 26, scope: !363)
!366 = !DILocation(line: 221, column: 19, scope: !367)
!367 = distinct !DILexicalBlock(scope: !363, file: !69, line: 221, column: 13)
!368 = !DILocation(line: 221, column: 17, scope: !367)
!369 = !DILocation(line: 221, column: 24, scope: !370)
!370 = distinct !DILexicalBlock(scope: !367, file: !69, line: 221, column: 13)
!371 = !DILocation(line: 221, column: 26, scope: !370)
!372 = !DILocation(line: 221, column: 13, scope: !367)
!373 = !DILocation(line: 223, column: 30, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !69, line: 222, column: 13)
!375 = !DILocation(line: 223, column: 37, scope: !374)
!376 = !DILocation(line: 223, column: 17, scope: !374)
!377 = !DILocation(line: 224, column: 13, scope: !374)
!378 = !DILocation(line: 221, column: 33, scope: !370)
!379 = !DILocation(line: 221, column: 13, scope: !370)
!380 = distinct !{!380, !372, !381, !197}
!381 = !DILocation(line: 224, column: 13, scope: !367)
!382 = !DILocation(line: 225, column: 9, scope: !363)
!383 = !DILocation(line: 228, column: 13, scope: !384)
!384 = distinct !DILexicalBlock(scope: !356, file: !69, line: 227, column: 9)
!385 = !DILocation(line: 230, column: 14, scope: !327)
!386 = !DILocation(line: 230, column: 9, scope: !327)
!387 = !DILocation(line: 232, column: 1, scope: !251)
!388 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 235, type: !70, scopeLine: 236, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!389 = !DILocalVariable(name: "data", scope: !388, file: !69, line: 237, type: !60)
!390 = !DILocation(line: 237, column: 9, scope: !388)
!391 = !DILocation(line: 239, column: 10, scope: !388)
!392 = !DILocation(line: 240, column: 5, scope: !388)
!393 = !DILabel(scope: !388, name: "source", file: !69, line: 241)
!394 = !DILocation(line: 241, column: 1, scope: !388)
!395 = !DILocation(line: 244, column: 10, scope: !388)
!396 = !DILocation(line: 245, column: 5, scope: !388)
!397 = !DILabel(scope: !388, name: "sink", file: !69, line: 246)
!398 = !DILocation(line: 246, column: 1, scope: !388)
!399 = !DILocalVariable(name: "i", scope: !400, file: !69, line: 248, type: !60)
!400 = distinct !DILexicalBlock(scope: !388, file: !69, line: 247, column: 5)
!401 = !DILocation(line: 248, column: 13, scope: !400)
!402 = !DILocalVariable(name: "buffer", scope: !400, file: !69, line: 249, type: !59)
!403 = !DILocation(line: 249, column: 15, scope: !400)
!404 = !DILocation(line: 249, column: 31, scope: !400)
!405 = !DILocation(line: 249, column: 24, scope: !400)
!406 = !DILocation(line: 250, column: 13, scope: !407)
!407 = distinct !DILexicalBlock(scope: !400, file: !69, line: 250, column: 13)
!408 = !DILocation(line: 250, column: 20, scope: !407)
!409 = !DILocation(line: 250, column: 13, scope: !400)
!410 = !DILocation(line: 250, column: 30, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !69, line: 250, column: 29)
!412 = !DILocation(line: 252, column: 16, scope: !413)
!413 = distinct !DILexicalBlock(scope: !400, file: !69, line: 252, column: 9)
!414 = !DILocation(line: 252, column: 14, scope: !413)
!415 = !DILocation(line: 252, column: 21, scope: !416)
!416 = distinct !DILexicalBlock(scope: !413, file: !69, line: 252, column: 9)
!417 = !DILocation(line: 252, column: 23, scope: !416)
!418 = !DILocation(line: 252, column: 9, scope: !413)
!419 = !DILocation(line: 254, column: 13, scope: !420)
!420 = distinct !DILexicalBlock(scope: !416, file: !69, line: 253, column: 9)
!421 = !DILocation(line: 254, column: 20, scope: !420)
!422 = !DILocation(line: 254, column: 23, scope: !420)
!423 = !DILocation(line: 255, column: 9, scope: !420)
!424 = !DILocation(line: 252, column: 30, scope: !416)
!425 = !DILocation(line: 252, column: 9, scope: !416)
!426 = distinct !{!426, !418, !427, !197}
!427 = !DILocation(line: 255, column: 9, scope: !413)
!428 = !DILocation(line: 258, column: 13, scope: !429)
!429 = distinct !DILexicalBlock(scope: !400, file: !69, line: 258, column: 13)
!430 = !DILocation(line: 258, column: 18, scope: !429)
!431 = !DILocation(line: 258, column: 13, scope: !400)
!432 = !DILocation(line: 260, column: 13, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !69, line: 259, column: 9)
!434 = !DILocation(line: 260, column: 20, scope: !433)
!435 = !DILocation(line: 260, column: 26, scope: !433)
!436 = !DILocation(line: 262, column: 19, scope: !437)
!437 = distinct !DILexicalBlock(scope: !433, file: !69, line: 262, column: 13)
!438 = !DILocation(line: 262, column: 17, scope: !437)
!439 = !DILocation(line: 262, column: 24, scope: !440)
!440 = distinct !DILexicalBlock(scope: !437, file: !69, line: 262, column: 13)
!441 = !DILocation(line: 262, column: 26, scope: !440)
!442 = !DILocation(line: 262, column: 13, scope: !437)
!443 = !DILocation(line: 264, column: 30, scope: !444)
!444 = distinct !DILexicalBlock(scope: !440, file: !69, line: 263, column: 13)
!445 = !DILocation(line: 264, column: 37, scope: !444)
!446 = !DILocation(line: 264, column: 17, scope: !444)
!447 = !DILocation(line: 265, column: 13, scope: !444)
!448 = !DILocation(line: 262, column: 33, scope: !440)
!449 = !DILocation(line: 262, column: 13, scope: !440)
!450 = distinct !{!450, !442, !451, !197}
!451 = !DILocation(line: 265, column: 13, scope: !437)
!452 = !DILocation(line: 266, column: 9, scope: !433)
!453 = !DILocation(line: 269, column: 13, scope: !454)
!454 = distinct !DILexicalBlock(scope: !429, file: !69, line: 268, column: 9)
!455 = !DILocation(line: 271, column: 14, scope: !400)
!456 = !DILocation(line: 271, column: 9, scope: !400)
!457 = !DILocation(line: 273, column: 1, scope: !388)
