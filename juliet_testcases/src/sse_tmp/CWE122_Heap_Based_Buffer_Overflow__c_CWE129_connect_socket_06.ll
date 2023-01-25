; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_06.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_06.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_06_bad() #0 !dbg !68 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !76, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !81, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %connectSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %do.body, !dbg !108

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !109
  store i32 %call, i32* %connectSocket, align 4, !dbg !111
  %0 = load i32, i32* %connectSocket, align 4, !dbg !112
  %cmp = icmp eq i32 %0, -1, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !116

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !118
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !119
  store i16 2, i16* %sin_family, align 4, !dbg !120
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !121
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !122
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !123
  store i32 %call1, i32* %s_addr, align 4, !dbg !124
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !125
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !126
  store i16 %call2, i16* %sin_port, align 2, !dbg !127
  %2 = load i32, i32* %connectSocket, align 4, !dbg !128
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !130
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !131
  %cmp4 = icmp eq i32 %call3, -1, !dbg !132
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !133

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !134

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !136
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !137
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !138
  %conv = trunc i64 %call7 to i32, !dbg !138
  store i32 %conv, i32* %recvResult, align 4, !dbg !139
  %5 = load i32, i32* %recvResult, align 4, !dbg !140
  %cmp8 = icmp eq i32 %5, -1, !dbg !142
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !143

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !144
  %cmp10 = icmp eq i32 %6, 0, !dbg !145
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !146

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !147

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !149
  %idxprom = sext i32 %7 to i64, !dbg !150
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !150
  store i8 0, i8* %arrayidx, align 1, !dbg !151
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !152
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !153
  store i32 %call15, i32* %data, align 4, !dbg !154
  br label %do.end, !dbg !155

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !156
  %cmp16 = icmp ne i32 %8, -1, !dbg !158
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !159

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !160
  %call19 = call i32 @close(i32 %9), !dbg !162
  br label %if.end20, !dbg !163

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !164, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !169, metadata !DIExpression()), !dbg !170
  %call21 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !171
  %10 = bitcast i8* %call21 to i32*, !dbg !172
  store i32* %10, i32** %buffer, align 8, !dbg !170
  %11 = load i32*, i32** %buffer, align 8, !dbg !173
  %cmp22 = icmp eq i32* %11, null, !dbg !175
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !176

if.then24:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !177
  unreachable, !dbg !177

if.end25:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !179
  br label %for.cond, !dbg !181

for.cond:                                         ; preds = %for.inc, %if.end25
  %12 = load i32, i32* %i, align 4, !dbg !182
  %cmp26 = icmp slt i32 %12, 10, !dbg !184
  br i1 %cmp26, label %for.body, label %for.end, !dbg !185

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !186
  %14 = load i32, i32* %i, align 4, !dbg !188
  %idxprom28 = sext i32 %14 to i64, !dbg !186
  %arrayidx29 = getelementptr inbounds i32, i32* %13, i64 %idxprom28, !dbg !186
  store i32 0, i32* %arrayidx29, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !191
  %inc = add nsw i32 %15, 1, !dbg !191
  store i32 %inc, i32* %i, align 4, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !196
  %cmp30 = icmp sge i32 %16, 0, !dbg !198
  br i1 %cmp30, label %if.then32, label %if.else, !dbg !199

if.then32:                                        ; preds = %for.end
  %17 = load i32*, i32** %buffer, align 8, !dbg !200
  %18 = load i32, i32* %data, align 4, !dbg !202
  %idxprom33 = sext i32 %18 to i64, !dbg !200
  %arrayidx34 = getelementptr inbounds i32, i32* %17, i64 %idxprom33, !dbg !200
  store i32 1, i32* %arrayidx34, align 4, !dbg !203
  store i32 0, i32* %i, align 4, !dbg !204
  br label %for.cond35, !dbg !206

for.cond35:                                       ; preds = %for.inc41, %if.then32
  %19 = load i32, i32* %i, align 4, !dbg !207
  %cmp36 = icmp slt i32 %19, 10, !dbg !209
  br i1 %cmp36, label %for.body38, label %for.end43, !dbg !210

for.body38:                                       ; preds = %for.cond35
  %20 = load i32*, i32** %buffer, align 8, !dbg !211
  %21 = load i32, i32* %i, align 4, !dbg !213
  %idxprom39 = sext i32 %21 to i64, !dbg !211
  %arrayidx40 = getelementptr inbounds i32, i32* %20, i64 %idxprom39, !dbg !211
  %22 = load i32, i32* %arrayidx40, align 4, !dbg !211
  call void @printIntLine(i32 %22), !dbg !214
  br label %for.inc41, !dbg !215

for.inc41:                                        ; preds = %for.body38
  %23 = load i32, i32* %i, align 4, !dbg !216
  %inc42 = add nsw i32 %23, 1, !dbg !216
  store i32 %inc42, i32* %i, align 4, !dbg !216
  br label %for.cond35, !dbg !217, !llvm.loop !218

for.end43:                                        ; preds = %for.cond35
  br label %if.end44, !dbg !220

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !221
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end43
  %24 = load i32*, i32** %buffer, align 8, !dbg !223
  %25 = bitcast i32* %24 to i8*, !dbg !223
  call void @free(i8* %25) #8, !dbg !224
  ret void, !dbg !225
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_06_good() #0 !dbg !226 {
entry:
  call void @goodB2G1(), !dbg !227
  call void @goodB2G2(), !dbg !228
  call void @goodG2B1(), !dbg !229
  call void @goodG2B2(), !dbg !230
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_06_good(), !dbg !245
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !246
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !247
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_06_bad(), !dbg !248
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !249
  ret i32 0, !dbg !250
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !251 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !255, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %connectSocket, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !264, metadata !DIExpression()), !dbg !265
  br label %do.body, !dbg !266

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !267
  store i32 %call, i32* %connectSocket, align 4, !dbg !269
  %0 = load i32, i32* %connectSocket, align 4, !dbg !270
  %cmp = icmp eq i32 %0, -1, !dbg !272
  br i1 %cmp, label %if.then, label %if.end, !dbg !273

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !274

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !276
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !276
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !277
  store i16 2, i16* %sin_family, align 4, !dbg !278
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !279
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !280
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !281
  store i32 %call1, i32* %s_addr, align 4, !dbg !282
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !283
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !284
  store i16 %call2, i16* %sin_port, align 2, !dbg !285
  %2 = load i32, i32* %connectSocket, align 4, !dbg !286
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !288
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !289
  %cmp4 = icmp eq i32 %call3, -1, !dbg !290
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !291

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !292

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !294
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !295
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !296
  %conv = trunc i64 %call7 to i32, !dbg !296
  store i32 %conv, i32* %recvResult, align 4, !dbg !297
  %5 = load i32, i32* %recvResult, align 4, !dbg !298
  %cmp8 = icmp eq i32 %5, -1, !dbg !300
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !301

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !302
  %cmp10 = icmp eq i32 %6, 0, !dbg !303
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !304

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !305

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !307
  %idxprom = sext i32 %7 to i64, !dbg !308
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !308
  store i8 0, i8* %arrayidx, align 1, !dbg !309
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !310
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !311
  store i32 %call15, i32* %data, align 4, !dbg !312
  br label %do.end, !dbg !313

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !314
  %cmp16 = icmp ne i32 %8, -1, !dbg !316
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !317

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !318
  %call19 = call i32 @close(i32 %9), !dbg !320
  br label %if.end20, !dbg !321

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !322, metadata !DIExpression()), !dbg !326
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !327, metadata !DIExpression()), !dbg !328
  %call21 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !329
  %10 = bitcast i8* %call21 to i32*, !dbg !330
  store i32* %10, i32** %buffer, align 8, !dbg !328
  %11 = load i32*, i32** %buffer, align 8, !dbg !331
  %cmp22 = icmp eq i32* %11, null, !dbg !333
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !334

if.then24:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !335
  unreachable, !dbg !335

if.end25:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !337
  br label %for.cond, !dbg !339

for.cond:                                         ; preds = %for.inc, %if.end25
  %12 = load i32, i32* %i, align 4, !dbg !340
  %cmp26 = icmp slt i32 %12, 10, !dbg !342
  br i1 %cmp26, label %for.body, label %for.end, !dbg !343

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !344
  %14 = load i32, i32* %i, align 4, !dbg !346
  %idxprom28 = sext i32 %14 to i64, !dbg !344
  %arrayidx29 = getelementptr inbounds i32, i32* %13, i64 %idxprom28, !dbg !344
  store i32 0, i32* %arrayidx29, align 4, !dbg !347
  br label %for.inc, !dbg !348

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !349
  %inc = add nsw i32 %15, 1, !dbg !349
  store i32 %inc, i32* %i, align 4, !dbg !349
  br label %for.cond, !dbg !350, !llvm.loop !351

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !353
  %cmp30 = icmp sge i32 %16, 0, !dbg !355
  br i1 %cmp30, label %land.lhs.true, label %if.else, !dbg !356

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !357
  %cmp32 = icmp slt i32 %17, 10, !dbg !358
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !359

if.then34:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !360
  %19 = load i32, i32* %data, align 4, !dbg !362
  %idxprom35 = sext i32 %19 to i64, !dbg !360
  %arrayidx36 = getelementptr inbounds i32, i32* %18, i64 %idxprom35, !dbg !360
  store i32 1, i32* %arrayidx36, align 4, !dbg !363
  store i32 0, i32* %i, align 4, !dbg !364
  br label %for.cond37, !dbg !366

for.cond37:                                       ; preds = %for.inc43, %if.then34
  %20 = load i32, i32* %i, align 4, !dbg !367
  %cmp38 = icmp slt i32 %20, 10, !dbg !369
  br i1 %cmp38, label %for.body40, label %for.end45, !dbg !370

for.body40:                                       ; preds = %for.cond37
  %21 = load i32*, i32** %buffer, align 8, !dbg !371
  %22 = load i32, i32* %i, align 4, !dbg !373
  %idxprom41 = sext i32 %22 to i64, !dbg !371
  %arrayidx42 = getelementptr inbounds i32, i32* %21, i64 %idxprom41, !dbg !371
  %23 = load i32, i32* %arrayidx42, align 4, !dbg !371
  call void @printIntLine(i32 %23), !dbg !374
  br label %for.inc43, !dbg !375

for.inc43:                                        ; preds = %for.body40
  %24 = load i32, i32* %i, align 4, !dbg !376
  %inc44 = add nsw i32 %24, 1, !dbg !376
  store i32 %inc44, i32* %i, align 4, !dbg !376
  br label %for.cond37, !dbg !377, !llvm.loop !378

for.end45:                                        ; preds = %for.cond37
  br label %if.end46, !dbg !380

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !381
  br label %if.end46

if.end46:                                         ; preds = %if.else, %for.end45
  %25 = load i32*, i32** %buffer, align 8, !dbg !383
  %26 = bitcast i32* %25 to i8*, !dbg !383
  call void @free(i8* %26) #8, !dbg !384
  ret void, !dbg !385
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !386 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !387, metadata !DIExpression()), !dbg !388
  store i32 -1, i32* %data, align 4, !dbg !389
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !390, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !395, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !397, metadata !DIExpression()), !dbg !398
  store i32 -1, i32* %connectSocket, align 4, !dbg !398
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !399, metadata !DIExpression()), !dbg !400
  br label %do.body, !dbg !401

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !402
  store i32 %call, i32* %connectSocket, align 4, !dbg !404
  %0 = load i32, i32* %connectSocket, align 4, !dbg !405
  %cmp = icmp eq i32 %0, -1, !dbg !407
  br i1 %cmp, label %if.then, label %if.end, !dbg !408

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !409

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !411
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !411
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !412
  store i16 2, i16* %sin_family, align 4, !dbg !413
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !414
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !415
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !416
  store i32 %call1, i32* %s_addr, align 4, !dbg !417
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !418
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !419
  store i16 %call2, i16* %sin_port, align 2, !dbg !420
  %2 = load i32, i32* %connectSocket, align 4, !dbg !421
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !423
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !424
  %cmp4 = icmp eq i32 %call3, -1, !dbg !425
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !426

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !427

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !429
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !430
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !431
  %conv = trunc i64 %call7 to i32, !dbg !431
  store i32 %conv, i32* %recvResult, align 4, !dbg !432
  %5 = load i32, i32* %recvResult, align 4, !dbg !433
  %cmp8 = icmp eq i32 %5, -1, !dbg !435
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !436

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !437
  %cmp10 = icmp eq i32 %6, 0, !dbg !438
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !439

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !440

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !442
  %idxprom = sext i32 %7 to i64, !dbg !443
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !443
  store i8 0, i8* %arrayidx, align 1, !dbg !444
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !445
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !446
  store i32 %call15, i32* %data, align 4, !dbg !447
  br label %do.end, !dbg !448

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !449
  %cmp16 = icmp ne i32 %8, -1, !dbg !451
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !452

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !453
  %call19 = call i32 @close(i32 %9), !dbg !455
  br label %if.end20, !dbg !456

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !457, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !462, metadata !DIExpression()), !dbg !463
  %call21 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !464
  %10 = bitcast i8* %call21 to i32*, !dbg !465
  store i32* %10, i32** %buffer, align 8, !dbg !463
  %11 = load i32*, i32** %buffer, align 8, !dbg !466
  %cmp22 = icmp eq i32* %11, null, !dbg !468
  br i1 %cmp22, label %if.then24, label %if.end25, !dbg !469

if.then24:                                        ; preds = %if.end20
  call void @exit(i32 -1) #11, !dbg !470
  unreachable, !dbg !470

if.end25:                                         ; preds = %if.end20
  store i32 0, i32* %i, align 4, !dbg !472
  br label %for.cond, !dbg !474

for.cond:                                         ; preds = %for.inc, %if.end25
  %12 = load i32, i32* %i, align 4, !dbg !475
  %cmp26 = icmp slt i32 %12, 10, !dbg !477
  br i1 %cmp26, label %for.body, label %for.end, !dbg !478

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !479
  %14 = load i32, i32* %i, align 4, !dbg !481
  %idxprom28 = sext i32 %14 to i64, !dbg !479
  %arrayidx29 = getelementptr inbounds i32, i32* %13, i64 %idxprom28, !dbg !479
  store i32 0, i32* %arrayidx29, align 4, !dbg !482
  br label %for.inc, !dbg !483

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !484
  %inc = add nsw i32 %15, 1, !dbg !484
  store i32 %inc, i32* %i, align 4, !dbg !484
  br label %for.cond, !dbg !485, !llvm.loop !486

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !488
  %cmp30 = icmp sge i32 %16, 0, !dbg !490
  br i1 %cmp30, label %land.lhs.true, label %if.else, !dbg !491

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !492
  %cmp32 = icmp slt i32 %17, 10, !dbg !493
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !494

if.then34:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !495
  %19 = load i32, i32* %data, align 4, !dbg !497
  %idxprom35 = sext i32 %19 to i64, !dbg !495
  %arrayidx36 = getelementptr inbounds i32, i32* %18, i64 %idxprom35, !dbg !495
  store i32 1, i32* %arrayidx36, align 4, !dbg !498
  store i32 0, i32* %i, align 4, !dbg !499
  br label %for.cond37, !dbg !501

for.cond37:                                       ; preds = %for.inc43, %if.then34
  %20 = load i32, i32* %i, align 4, !dbg !502
  %cmp38 = icmp slt i32 %20, 10, !dbg !504
  br i1 %cmp38, label %for.body40, label %for.end45, !dbg !505

for.body40:                                       ; preds = %for.cond37
  %21 = load i32*, i32** %buffer, align 8, !dbg !506
  %22 = load i32, i32* %i, align 4, !dbg !508
  %idxprom41 = sext i32 %22 to i64, !dbg !506
  %arrayidx42 = getelementptr inbounds i32, i32* %21, i64 %idxprom41, !dbg !506
  %23 = load i32, i32* %arrayidx42, align 4, !dbg !506
  call void @printIntLine(i32 %23), !dbg !509
  br label %for.inc43, !dbg !510

for.inc43:                                        ; preds = %for.body40
  %24 = load i32, i32* %i, align 4, !dbg !511
  %inc44 = add nsw i32 %24, 1, !dbg !511
  store i32 %inc44, i32* %i, align 4, !dbg !511
  br label %for.cond37, !dbg !512, !llvm.loop !513

for.end45:                                        ; preds = %for.cond37
  br label %if.end46, !dbg !515

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !516
  br label %if.end46

if.end46:                                         ; preds = %if.else, %for.end45
  %25 = load i32*, i32** %buffer, align 8, !dbg !518
  %26 = bitcast i32* %25 to i8*, !dbg !518
  call void @free(i8* %26) #8, !dbg !519
  ret void, !dbg !520
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !521 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !522, metadata !DIExpression()), !dbg !523
  store i32 -1, i32* %data, align 4, !dbg !524
  store i32 7, i32* %data, align 4, !dbg !525
  call void @llvm.dbg.declare(metadata i32* %i, metadata !528, metadata !DIExpression()), !dbg !532
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !533, metadata !DIExpression()), !dbg !534
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !535
  %0 = bitcast i8* %call to i32*, !dbg !536
  store i32* %0, i32** %buffer, align 8, !dbg !534
  %1 = load i32*, i32** %buffer, align 8, !dbg !537
  %cmp = icmp eq i32* %1, null, !dbg !539
  br i1 %cmp, label %if.then, label %if.end, !dbg !540

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !541
  unreachable, !dbg !541

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !543
  br label %for.cond, !dbg !545

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !546
  %cmp1 = icmp slt i32 %2, 10, !dbg !548
  br i1 %cmp1, label %for.body, label %for.end, !dbg !549

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !550
  %4 = load i32, i32* %i, align 4, !dbg !552
  %idxprom = sext i32 %4 to i64, !dbg !550
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !550
  store i32 0, i32* %arrayidx, align 4, !dbg !553
  br label %for.inc, !dbg !554

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !555
  %inc = add nsw i32 %5, 1, !dbg !555
  store i32 %inc, i32* %i, align 4, !dbg !555
  br label %for.cond, !dbg !556, !llvm.loop !557

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !559
  %cmp2 = icmp sge i32 %6, 0, !dbg !561
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !562

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !563
  %8 = load i32, i32* %data, align 4, !dbg !565
  %idxprom4 = sext i32 %8 to i64, !dbg !563
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !563
  store i32 1, i32* %arrayidx5, align 4, !dbg !566
  store i32 0, i32* %i, align 4, !dbg !567
  br label %for.cond6, !dbg !569

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !570
  %cmp7 = icmp slt i32 %9, 10, !dbg !572
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !573

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !574
  %11 = load i32, i32* %i, align 4, !dbg !576
  %idxprom9 = sext i32 %11 to i64, !dbg !574
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !574
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !574
  call void @printIntLine(i32 %12), !dbg !577
  br label %for.inc11, !dbg !578

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !579
  %inc12 = add nsw i32 %13, 1, !dbg !579
  store i32 %inc12, i32* %i, align 4, !dbg !579
  br label %for.cond6, !dbg !580, !llvm.loop !581

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !583

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !584
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !586
  %15 = bitcast i32* %14 to i8*, !dbg !586
  call void @free(i8* %15) #8, !dbg !587
  ret void, !dbg !588
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !589 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !590, metadata !DIExpression()), !dbg !591
  store i32 -1, i32* %data, align 4, !dbg !592
  store i32 7, i32* %data, align 4, !dbg !593
  call void @llvm.dbg.declare(metadata i32* %i, metadata !596, metadata !DIExpression()), !dbg !600
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !601, metadata !DIExpression()), !dbg !602
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !603
  %0 = bitcast i8* %call to i32*, !dbg !604
  store i32* %0, i32** %buffer, align 8, !dbg !602
  %1 = load i32*, i32** %buffer, align 8, !dbg !605
  %cmp = icmp eq i32* %1, null, !dbg !607
  br i1 %cmp, label %if.then, label %if.end, !dbg !608

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !609
  unreachable, !dbg !609

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !611
  br label %for.cond, !dbg !613

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !614
  %cmp1 = icmp slt i32 %2, 10, !dbg !616
  br i1 %cmp1, label %for.body, label %for.end, !dbg !617

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !618
  %4 = load i32, i32* %i, align 4, !dbg !620
  %idxprom = sext i32 %4 to i64, !dbg !618
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !618
  store i32 0, i32* %arrayidx, align 4, !dbg !621
  br label %for.inc, !dbg !622

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !623
  %inc = add nsw i32 %5, 1, !dbg !623
  store i32 %inc, i32* %i, align 4, !dbg !623
  br label %for.cond, !dbg !624, !llvm.loop !625

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !627
  %cmp2 = icmp sge i32 %6, 0, !dbg !629
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !630

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !631
  %8 = load i32, i32* %data, align 4, !dbg !633
  %idxprom4 = sext i32 %8 to i64, !dbg !631
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !631
  store i32 1, i32* %arrayidx5, align 4, !dbg !634
  store i32 0, i32* %i, align 4, !dbg !635
  br label %for.cond6, !dbg !637

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !638
  %cmp7 = icmp slt i32 %9, 10, !dbg !640
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !641

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !642
  %11 = load i32, i32* %i, align 4, !dbg !644
  %idxprom9 = sext i32 %11 to i64, !dbg !642
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !642
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !642
  call void @printIntLine(i32 %12), !dbg !645
  br label %for.inc11, !dbg !646

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !647
  %inc12 = add nsw i32 %13, 1, !dbg !647
  store i32 %inc12, i32* %i, align 4, !dbg !647
  br label %for.cond6, !dbg !648, !llvm.loop !649

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !651

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !652
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !654
  %15 = bitcast i32* %14 to i8*, !dbg !654
  call void @free(i8* %15) #8, !dbg !655
  ret void, !dbg !656
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_06_bad", scope: !69, file: !69, line: 49, type: !70, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_06.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 51, type: !60)
!74 = !DILocation(line: 51, column: 9, scope: !68)
!75 = !DILocation(line: 53, column: 10, scope: !68)
!76 = !DILocalVariable(name: "recvResult", scope: !77, file: !69, line: 61, type: !60)
!77 = distinct !DILexicalBlock(scope: !78, file: !69, line: 56, column: 9)
!78 = distinct !DILexicalBlock(scope: !79, file: !69, line: 55, column: 5)
!79 = distinct !DILexicalBlock(scope: !68, file: !69, line: 54, column: 8)
!80 = !DILocation(line: 61, column: 17, scope: !77)
!81 = !DILocalVariable(name: "service", scope: !77, file: !69, line: 62, type: !82)
!82 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !83)
!83 = !{!84, !85, !91, !98}
!84 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !82, file: !17, line: 240, baseType: !51, size: 16)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !82, file: !17, line: 241, baseType: !86, size: 16, offset: 16)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !88, line: 25, baseType: !89)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !90, line: 40, baseType: !53)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !82, file: !17, line: 242, baseType: !92, size: 32, offset: 32)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !93)
!93 = !{!94}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !92, file: !17, line: 33, baseType: !95, size: 32)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !88, line: 26, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !90, line: 42, baseType: !5)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !82, file: !17, line: 245, baseType: !99, size: 64, offset: 64)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 64, elements: !101)
!100 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!101 = !{!102}
!102 = !DISubrange(count: 8)
!103 = !DILocation(line: 62, column: 32, scope: !77)
!104 = !DILocalVariable(name: "connectSocket", scope: !77, file: !69, line: 63, type: !60)
!105 = !DILocation(line: 63, column: 20, scope: !77)
!106 = !DILocalVariable(name: "inputBuffer", scope: !77, file: !69, line: 64, type: !55)
!107 = !DILocation(line: 64, column: 18, scope: !77)
!108 = !DILocation(line: 65, column: 13, scope: !77)
!109 = !DILocation(line: 75, column: 33, scope: !110)
!110 = distinct !DILexicalBlock(scope: !77, file: !69, line: 66, column: 13)
!111 = !DILocation(line: 75, column: 31, scope: !110)
!112 = !DILocation(line: 76, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !69, line: 76, column: 21)
!114 = !DILocation(line: 76, column: 35, scope: !113)
!115 = !DILocation(line: 76, column: 21, scope: !110)
!116 = !DILocation(line: 78, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !69, line: 77, column: 17)
!118 = !DILocation(line: 80, column: 17, scope: !110)
!119 = !DILocation(line: 81, column: 25, scope: !110)
!120 = !DILocation(line: 81, column: 36, scope: !110)
!121 = !DILocation(line: 82, column: 43, scope: !110)
!122 = !DILocation(line: 82, column: 25, scope: !110)
!123 = !DILocation(line: 82, column: 34, scope: !110)
!124 = !DILocation(line: 82, column: 41, scope: !110)
!125 = !DILocation(line: 83, column: 36, scope: !110)
!126 = !DILocation(line: 83, column: 25, scope: !110)
!127 = !DILocation(line: 83, column: 34, scope: !110)
!128 = !DILocation(line: 84, column: 29, scope: !129)
!129 = distinct !DILexicalBlock(scope: !110, file: !69, line: 84, column: 21)
!130 = !DILocation(line: 84, column: 44, scope: !129)
!131 = !DILocation(line: 84, column: 21, scope: !129)
!132 = !DILocation(line: 84, column: 89, scope: !129)
!133 = !DILocation(line: 84, column: 21, scope: !110)
!134 = !DILocation(line: 86, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !69, line: 85, column: 17)
!136 = !DILocation(line: 90, column: 35, scope: !110)
!137 = !DILocation(line: 90, column: 50, scope: !110)
!138 = !DILocation(line: 90, column: 30, scope: !110)
!139 = !DILocation(line: 90, column: 28, scope: !110)
!140 = !DILocation(line: 91, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !110, file: !69, line: 91, column: 21)
!142 = !DILocation(line: 91, column: 32, scope: !141)
!143 = !DILocation(line: 91, column: 48, scope: !141)
!144 = !DILocation(line: 91, column: 51, scope: !141)
!145 = !DILocation(line: 91, column: 62, scope: !141)
!146 = !DILocation(line: 91, column: 21, scope: !110)
!147 = !DILocation(line: 93, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !141, file: !69, line: 92, column: 17)
!149 = !DILocation(line: 96, column: 29, scope: !110)
!150 = !DILocation(line: 96, column: 17, scope: !110)
!151 = !DILocation(line: 96, column: 41, scope: !110)
!152 = !DILocation(line: 98, column: 29, scope: !110)
!153 = !DILocation(line: 98, column: 24, scope: !110)
!154 = !DILocation(line: 98, column: 22, scope: !110)
!155 = !DILocation(line: 99, column: 13, scope: !110)
!156 = !DILocation(line: 101, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !77, file: !69, line: 101, column: 17)
!158 = !DILocation(line: 101, column: 31, scope: !157)
!159 = !DILocation(line: 101, column: 17, scope: !77)
!160 = !DILocation(line: 103, column: 30, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !69, line: 102, column: 13)
!162 = !DILocation(line: 103, column: 17, scope: !161)
!163 = !DILocation(line: 104, column: 13, scope: !161)
!164 = !DILocalVariable(name: "i", scope: !165, file: !69, line: 116, type: !60)
!165 = distinct !DILexicalBlock(scope: !166, file: !69, line: 115, column: 9)
!166 = distinct !DILexicalBlock(scope: !167, file: !69, line: 114, column: 5)
!167 = distinct !DILexicalBlock(scope: !68, file: !69, line: 113, column: 8)
!168 = !DILocation(line: 116, column: 17, scope: !165)
!169 = !DILocalVariable(name: "buffer", scope: !165, file: !69, line: 117, type: !59)
!170 = !DILocation(line: 117, column: 19, scope: !165)
!171 = !DILocation(line: 117, column: 35, scope: !165)
!172 = !DILocation(line: 117, column: 28, scope: !165)
!173 = !DILocation(line: 118, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !165, file: !69, line: 118, column: 17)
!175 = !DILocation(line: 118, column: 24, scope: !174)
!176 = !DILocation(line: 118, column: 17, scope: !165)
!177 = !DILocation(line: 118, column: 34, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !69, line: 118, column: 33)
!179 = !DILocation(line: 120, column: 20, scope: !180)
!180 = distinct !DILexicalBlock(scope: !165, file: !69, line: 120, column: 13)
!181 = !DILocation(line: 120, column: 18, scope: !180)
!182 = !DILocation(line: 120, column: 25, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !69, line: 120, column: 13)
!184 = !DILocation(line: 120, column: 27, scope: !183)
!185 = !DILocation(line: 120, column: 13, scope: !180)
!186 = !DILocation(line: 122, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !69, line: 121, column: 13)
!188 = !DILocation(line: 122, column: 24, scope: !187)
!189 = !DILocation(line: 122, column: 27, scope: !187)
!190 = !DILocation(line: 123, column: 13, scope: !187)
!191 = !DILocation(line: 120, column: 34, scope: !183)
!192 = !DILocation(line: 120, column: 13, scope: !183)
!193 = distinct !{!193, !185, !194, !195}
!194 = !DILocation(line: 123, column: 13, scope: !180)
!195 = !{!"llvm.loop.mustprogress"}
!196 = !DILocation(line: 126, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !165, file: !69, line: 126, column: 17)
!198 = !DILocation(line: 126, column: 22, scope: !197)
!199 = !DILocation(line: 126, column: 17, scope: !165)
!200 = !DILocation(line: 128, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !197, file: !69, line: 127, column: 13)
!202 = !DILocation(line: 128, column: 24, scope: !201)
!203 = !DILocation(line: 128, column: 30, scope: !201)
!204 = !DILocation(line: 130, column: 23, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !69, line: 130, column: 17)
!206 = !DILocation(line: 130, column: 21, scope: !205)
!207 = !DILocation(line: 130, column: 28, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !69, line: 130, column: 17)
!209 = !DILocation(line: 130, column: 30, scope: !208)
!210 = !DILocation(line: 130, column: 17, scope: !205)
!211 = !DILocation(line: 132, column: 34, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !69, line: 131, column: 17)
!213 = !DILocation(line: 132, column: 41, scope: !212)
!214 = !DILocation(line: 132, column: 21, scope: !212)
!215 = !DILocation(line: 133, column: 17, scope: !212)
!216 = !DILocation(line: 130, column: 37, scope: !208)
!217 = !DILocation(line: 130, column: 17, scope: !208)
!218 = distinct !{!218, !210, !219, !195}
!219 = !DILocation(line: 133, column: 17, scope: !205)
!220 = !DILocation(line: 134, column: 13, scope: !201)
!221 = !DILocation(line: 137, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !197, file: !69, line: 136, column: 13)
!223 = !DILocation(line: 139, column: 18, scope: !165)
!224 = !DILocation(line: 139, column: 13, scope: !165)
!225 = !DILocation(line: 142, column: 1, scope: !68)
!226 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_06_good", scope: !69, file: !69, line: 434, type: !70, scopeLine: 435, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!227 = !DILocation(line: 436, column: 5, scope: !226)
!228 = !DILocation(line: 437, column: 5, scope: !226)
!229 = !DILocation(line: 438, column: 5, scope: !226)
!230 = !DILocation(line: 439, column: 5, scope: !226)
!231 = !DILocation(line: 440, column: 1, scope: !226)
!232 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 451, type: !233, scopeLine: 452, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!233 = !DISubroutineType(types: !234)
!234 = !{!60, !60, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!237 = !DILocalVariable(name: "argc", arg: 1, scope: !232, file: !69, line: 451, type: !60)
!238 = !DILocation(line: 451, column: 14, scope: !232)
!239 = !DILocalVariable(name: "argv", arg: 2, scope: !232, file: !69, line: 451, type: !235)
!240 = !DILocation(line: 451, column: 27, scope: !232)
!241 = !DILocation(line: 454, column: 22, scope: !232)
!242 = !DILocation(line: 454, column: 12, scope: !232)
!243 = !DILocation(line: 454, column: 5, scope: !232)
!244 = !DILocation(line: 456, column: 5, scope: !232)
!245 = !DILocation(line: 457, column: 5, scope: !232)
!246 = !DILocation(line: 458, column: 5, scope: !232)
!247 = !DILocation(line: 461, column: 5, scope: !232)
!248 = !DILocation(line: 462, column: 5, scope: !232)
!249 = !DILocation(line: 463, column: 5, scope: !232)
!250 = !DILocation(line: 465, column: 5, scope: !232)
!251 = distinct !DISubprogram(name: "goodB2G1", scope: !69, file: !69, line: 149, type: !70, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!252 = !DILocalVariable(name: "data", scope: !251, file: !69, line: 151, type: !60)
!253 = !DILocation(line: 151, column: 9, scope: !251)
!254 = !DILocation(line: 153, column: 10, scope: !251)
!255 = !DILocalVariable(name: "recvResult", scope: !256, file: !69, line: 161, type: !60)
!256 = distinct !DILexicalBlock(scope: !257, file: !69, line: 156, column: 9)
!257 = distinct !DILexicalBlock(scope: !258, file: !69, line: 155, column: 5)
!258 = distinct !DILexicalBlock(scope: !251, file: !69, line: 154, column: 8)
!259 = !DILocation(line: 161, column: 17, scope: !256)
!260 = !DILocalVariable(name: "service", scope: !256, file: !69, line: 162, type: !82)
!261 = !DILocation(line: 162, column: 32, scope: !256)
!262 = !DILocalVariable(name: "connectSocket", scope: !256, file: !69, line: 163, type: !60)
!263 = !DILocation(line: 163, column: 20, scope: !256)
!264 = !DILocalVariable(name: "inputBuffer", scope: !256, file: !69, line: 164, type: !55)
!265 = !DILocation(line: 164, column: 18, scope: !256)
!266 = !DILocation(line: 165, column: 13, scope: !256)
!267 = !DILocation(line: 175, column: 33, scope: !268)
!268 = distinct !DILexicalBlock(scope: !256, file: !69, line: 166, column: 13)
!269 = !DILocation(line: 175, column: 31, scope: !268)
!270 = !DILocation(line: 176, column: 21, scope: !271)
!271 = distinct !DILexicalBlock(scope: !268, file: !69, line: 176, column: 21)
!272 = !DILocation(line: 176, column: 35, scope: !271)
!273 = !DILocation(line: 176, column: 21, scope: !268)
!274 = !DILocation(line: 178, column: 21, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !69, line: 177, column: 17)
!276 = !DILocation(line: 180, column: 17, scope: !268)
!277 = !DILocation(line: 181, column: 25, scope: !268)
!278 = !DILocation(line: 181, column: 36, scope: !268)
!279 = !DILocation(line: 182, column: 43, scope: !268)
!280 = !DILocation(line: 182, column: 25, scope: !268)
!281 = !DILocation(line: 182, column: 34, scope: !268)
!282 = !DILocation(line: 182, column: 41, scope: !268)
!283 = !DILocation(line: 183, column: 36, scope: !268)
!284 = !DILocation(line: 183, column: 25, scope: !268)
!285 = !DILocation(line: 183, column: 34, scope: !268)
!286 = !DILocation(line: 184, column: 29, scope: !287)
!287 = distinct !DILexicalBlock(scope: !268, file: !69, line: 184, column: 21)
!288 = !DILocation(line: 184, column: 44, scope: !287)
!289 = !DILocation(line: 184, column: 21, scope: !287)
!290 = !DILocation(line: 184, column: 89, scope: !287)
!291 = !DILocation(line: 184, column: 21, scope: !268)
!292 = !DILocation(line: 186, column: 21, scope: !293)
!293 = distinct !DILexicalBlock(scope: !287, file: !69, line: 185, column: 17)
!294 = !DILocation(line: 190, column: 35, scope: !268)
!295 = !DILocation(line: 190, column: 50, scope: !268)
!296 = !DILocation(line: 190, column: 30, scope: !268)
!297 = !DILocation(line: 190, column: 28, scope: !268)
!298 = !DILocation(line: 191, column: 21, scope: !299)
!299 = distinct !DILexicalBlock(scope: !268, file: !69, line: 191, column: 21)
!300 = !DILocation(line: 191, column: 32, scope: !299)
!301 = !DILocation(line: 191, column: 48, scope: !299)
!302 = !DILocation(line: 191, column: 51, scope: !299)
!303 = !DILocation(line: 191, column: 62, scope: !299)
!304 = !DILocation(line: 191, column: 21, scope: !268)
!305 = !DILocation(line: 193, column: 21, scope: !306)
!306 = distinct !DILexicalBlock(scope: !299, file: !69, line: 192, column: 17)
!307 = !DILocation(line: 196, column: 29, scope: !268)
!308 = !DILocation(line: 196, column: 17, scope: !268)
!309 = !DILocation(line: 196, column: 41, scope: !268)
!310 = !DILocation(line: 198, column: 29, scope: !268)
!311 = !DILocation(line: 198, column: 24, scope: !268)
!312 = !DILocation(line: 198, column: 22, scope: !268)
!313 = !DILocation(line: 199, column: 13, scope: !268)
!314 = !DILocation(line: 201, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !256, file: !69, line: 201, column: 17)
!316 = !DILocation(line: 201, column: 31, scope: !315)
!317 = !DILocation(line: 201, column: 17, scope: !256)
!318 = !DILocation(line: 203, column: 30, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !69, line: 202, column: 13)
!320 = !DILocation(line: 203, column: 17, scope: !319)
!321 = !DILocation(line: 204, column: 13, scope: !319)
!322 = !DILocalVariable(name: "i", scope: !323, file: !69, line: 221, type: !60)
!323 = distinct !DILexicalBlock(scope: !324, file: !69, line: 220, column: 9)
!324 = distinct !DILexicalBlock(scope: !325, file: !69, line: 219, column: 5)
!325 = distinct !DILexicalBlock(scope: !251, file: !69, line: 213, column: 8)
!326 = !DILocation(line: 221, column: 17, scope: !323)
!327 = !DILocalVariable(name: "buffer", scope: !323, file: !69, line: 222, type: !59)
!328 = !DILocation(line: 222, column: 19, scope: !323)
!329 = !DILocation(line: 222, column: 35, scope: !323)
!330 = !DILocation(line: 222, column: 28, scope: !323)
!331 = !DILocation(line: 223, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !323, file: !69, line: 223, column: 17)
!333 = !DILocation(line: 223, column: 24, scope: !332)
!334 = !DILocation(line: 223, column: 17, scope: !323)
!335 = !DILocation(line: 223, column: 34, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !69, line: 223, column: 33)
!337 = !DILocation(line: 225, column: 20, scope: !338)
!338 = distinct !DILexicalBlock(scope: !323, file: !69, line: 225, column: 13)
!339 = !DILocation(line: 225, column: 18, scope: !338)
!340 = !DILocation(line: 225, column: 25, scope: !341)
!341 = distinct !DILexicalBlock(scope: !338, file: !69, line: 225, column: 13)
!342 = !DILocation(line: 225, column: 27, scope: !341)
!343 = !DILocation(line: 225, column: 13, scope: !338)
!344 = !DILocation(line: 227, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !69, line: 226, column: 13)
!346 = !DILocation(line: 227, column: 24, scope: !345)
!347 = !DILocation(line: 227, column: 27, scope: !345)
!348 = !DILocation(line: 228, column: 13, scope: !345)
!349 = !DILocation(line: 225, column: 34, scope: !341)
!350 = !DILocation(line: 225, column: 13, scope: !341)
!351 = distinct !{!351, !343, !352, !195}
!352 = !DILocation(line: 228, column: 13, scope: !338)
!353 = !DILocation(line: 230, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !323, file: !69, line: 230, column: 17)
!355 = !DILocation(line: 230, column: 22, scope: !354)
!356 = !DILocation(line: 230, column: 27, scope: !354)
!357 = !DILocation(line: 230, column: 30, scope: !354)
!358 = !DILocation(line: 230, column: 35, scope: !354)
!359 = !DILocation(line: 230, column: 17, scope: !323)
!360 = !DILocation(line: 232, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !354, file: !69, line: 231, column: 13)
!362 = !DILocation(line: 232, column: 24, scope: !361)
!363 = !DILocation(line: 232, column: 30, scope: !361)
!364 = !DILocation(line: 234, column: 23, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !69, line: 234, column: 17)
!366 = !DILocation(line: 234, column: 21, scope: !365)
!367 = !DILocation(line: 234, column: 28, scope: !368)
!368 = distinct !DILexicalBlock(scope: !365, file: !69, line: 234, column: 17)
!369 = !DILocation(line: 234, column: 30, scope: !368)
!370 = !DILocation(line: 234, column: 17, scope: !365)
!371 = !DILocation(line: 236, column: 34, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !69, line: 235, column: 17)
!373 = !DILocation(line: 236, column: 41, scope: !372)
!374 = !DILocation(line: 236, column: 21, scope: !372)
!375 = !DILocation(line: 237, column: 17, scope: !372)
!376 = !DILocation(line: 234, column: 37, scope: !368)
!377 = !DILocation(line: 234, column: 17, scope: !368)
!378 = distinct !{!378, !370, !379, !195}
!379 = !DILocation(line: 237, column: 17, scope: !365)
!380 = !DILocation(line: 238, column: 13, scope: !361)
!381 = !DILocation(line: 241, column: 17, scope: !382)
!382 = distinct !DILexicalBlock(scope: !354, file: !69, line: 240, column: 13)
!383 = !DILocation(line: 243, column: 18, scope: !323)
!384 = !DILocation(line: 243, column: 13, scope: !323)
!385 = !DILocation(line: 246, column: 1, scope: !251)
!386 = distinct !DISubprogram(name: "goodB2G2", scope: !69, file: !69, line: 249, type: !70, scopeLine: 250, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!387 = !DILocalVariable(name: "data", scope: !386, file: !69, line: 251, type: !60)
!388 = !DILocation(line: 251, column: 9, scope: !386)
!389 = !DILocation(line: 253, column: 10, scope: !386)
!390 = !DILocalVariable(name: "recvResult", scope: !391, file: !69, line: 261, type: !60)
!391 = distinct !DILexicalBlock(scope: !392, file: !69, line: 256, column: 9)
!392 = distinct !DILexicalBlock(scope: !393, file: !69, line: 255, column: 5)
!393 = distinct !DILexicalBlock(scope: !386, file: !69, line: 254, column: 8)
!394 = !DILocation(line: 261, column: 17, scope: !391)
!395 = !DILocalVariable(name: "service", scope: !391, file: !69, line: 262, type: !82)
!396 = !DILocation(line: 262, column: 32, scope: !391)
!397 = !DILocalVariable(name: "connectSocket", scope: !391, file: !69, line: 263, type: !60)
!398 = !DILocation(line: 263, column: 20, scope: !391)
!399 = !DILocalVariable(name: "inputBuffer", scope: !391, file: !69, line: 264, type: !55)
!400 = !DILocation(line: 264, column: 18, scope: !391)
!401 = !DILocation(line: 265, column: 13, scope: !391)
!402 = !DILocation(line: 275, column: 33, scope: !403)
!403 = distinct !DILexicalBlock(scope: !391, file: !69, line: 266, column: 13)
!404 = !DILocation(line: 275, column: 31, scope: !403)
!405 = !DILocation(line: 276, column: 21, scope: !406)
!406 = distinct !DILexicalBlock(scope: !403, file: !69, line: 276, column: 21)
!407 = !DILocation(line: 276, column: 35, scope: !406)
!408 = !DILocation(line: 276, column: 21, scope: !403)
!409 = !DILocation(line: 278, column: 21, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !69, line: 277, column: 17)
!411 = !DILocation(line: 280, column: 17, scope: !403)
!412 = !DILocation(line: 281, column: 25, scope: !403)
!413 = !DILocation(line: 281, column: 36, scope: !403)
!414 = !DILocation(line: 282, column: 43, scope: !403)
!415 = !DILocation(line: 282, column: 25, scope: !403)
!416 = !DILocation(line: 282, column: 34, scope: !403)
!417 = !DILocation(line: 282, column: 41, scope: !403)
!418 = !DILocation(line: 283, column: 36, scope: !403)
!419 = !DILocation(line: 283, column: 25, scope: !403)
!420 = !DILocation(line: 283, column: 34, scope: !403)
!421 = !DILocation(line: 284, column: 29, scope: !422)
!422 = distinct !DILexicalBlock(scope: !403, file: !69, line: 284, column: 21)
!423 = !DILocation(line: 284, column: 44, scope: !422)
!424 = !DILocation(line: 284, column: 21, scope: !422)
!425 = !DILocation(line: 284, column: 89, scope: !422)
!426 = !DILocation(line: 284, column: 21, scope: !403)
!427 = !DILocation(line: 286, column: 21, scope: !428)
!428 = distinct !DILexicalBlock(scope: !422, file: !69, line: 285, column: 17)
!429 = !DILocation(line: 290, column: 35, scope: !403)
!430 = !DILocation(line: 290, column: 50, scope: !403)
!431 = !DILocation(line: 290, column: 30, scope: !403)
!432 = !DILocation(line: 290, column: 28, scope: !403)
!433 = !DILocation(line: 291, column: 21, scope: !434)
!434 = distinct !DILexicalBlock(scope: !403, file: !69, line: 291, column: 21)
!435 = !DILocation(line: 291, column: 32, scope: !434)
!436 = !DILocation(line: 291, column: 48, scope: !434)
!437 = !DILocation(line: 291, column: 51, scope: !434)
!438 = !DILocation(line: 291, column: 62, scope: !434)
!439 = !DILocation(line: 291, column: 21, scope: !403)
!440 = !DILocation(line: 293, column: 21, scope: !441)
!441 = distinct !DILexicalBlock(scope: !434, file: !69, line: 292, column: 17)
!442 = !DILocation(line: 296, column: 29, scope: !403)
!443 = !DILocation(line: 296, column: 17, scope: !403)
!444 = !DILocation(line: 296, column: 41, scope: !403)
!445 = !DILocation(line: 298, column: 29, scope: !403)
!446 = !DILocation(line: 298, column: 24, scope: !403)
!447 = !DILocation(line: 298, column: 22, scope: !403)
!448 = !DILocation(line: 299, column: 13, scope: !403)
!449 = !DILocation(line: 301, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !391, file: !69, line: 301, column: 17)
!451 = !DILocation(line: 301, column: 31, scope: !450)
!452 = !DILocation(line: 301, column: 17, scope: !391)
!453 = !DILocation(line: 303, column: 30, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !69, line: 302, column: 13)
!455 = !DILocation(line: 303, column: 17, scope: !454)
!456 = !DILocation(line: 304, column: 13, scope: !454)
!457 = !DILocalVariable(name: "i", scope: !458, file: !69, line: 316, type: !60)
!458 = distinct !DILexicalBlock(scope: !459, file: !69, line: 315, column: 9)
!459 = distinct !DILexicalBlock(scope: !460, file: !69, line: 314, column: 5)
!460 = distinct !DILexicalBlock(scope: !386, file: !69, line: 313, column: 8)
!461 = !DILocation(line: 316, column: 17, scope: !458)
!462 = !DILocalVariable(name: "buffer", scope: !458, file: !69, line: 317, type: !59)
!463 = !DILocation(line: 317, column: 19, scope: !458)
!464 = !DILocation(line: 317, column: 35, scope: !458)
!465 = !DILocation(line: 317, column: 28, scope: !458)
!466 = !DILocation(line: 318, column: 17, scope: !467)
!467 = distinct !DILexicalBlock(scope: !458, file: !69, line: 318, column: 17)
!468 = !DILocation(line: 318, column: 24, scope: !467)
!469 = !DILocation(line: 318, column: 17, scope: !458)
!470 = !DILocation(line: 318, column: 34, scope: !471)
!471 = distinct !DILexicalBlock(scope: !467, file: !69, line: 318, column: 33)
!472 = !DILocation(line: 320, column: 20, scope: !473)
!473 = distinct !DILexicalBlock(scope: !458, file: !69, line: 320, column: 13)
!474 = !DILocation(line: 320, column: 18, scope: !473)
!475 = !DILocation(line: 320, column: 25, scope: !476)
!476 = distinct !DILexicalBlock(scope: !473, file: !69, line: 320, column: 13)
!477 = !DILocation(line: 320, column: 27, scope: !476)
!478 = !DILocation(line: 320, column: 13, scope: !473)
!479 = !DILocation(line: 322, column: 17, scope: !480)
!480 = distinct !DILexicalBlock(scope: !476, file: !69, line: 321, column: 13)
!481 = !DILocation(line: 322, column: 24, scope: !480)
!482 = !DILocation(line: 322, column: 27, scope: !480)
!483 = !DILocation(line: 323, column: 13, scope: !480)
!484 = !DILocation(line: 320, column: 34, scope: !476)
!485 = !DILocation(line: 320, column: 13, scope: !476)
!486 = distinct !{!486, !478, !487, !195}
!487 = !DILocation(line: 323, column: 13, scope: !473)
!488 = !DILocation(line: 325, column: 17, scope: !489)
!489 = distinct !DILexicalBlock(scope: !458, file: !69, line: 325, column: 17)
!490 = !DILocation(line: 325, column: 22, scope: !489)
!491 = !DILocation(line: 325, column: 27, scope: !489)
!492 = !DILocation(line: 325, column: 30, scope: !489)
!493 = !DILocation(line: 325, column: 35, scope: !489)
!494 = !DILocation(line: 325, column: 17, scope: !458)
!495 = !DILocation(line: 327, column: 17, scope: !496)
!496 = distinct !DILexicalBlock(scope: !489, file: !69, line: 326, column: 13)
!497 = !DILocation(line: 327, column: 24, scope: !496)
!498 = !DILocation(line: 327, column: 30, scope: !496)
!499 = !DILocation(line: 329, column: 23, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !69, line: 329, column: 17)
!501 = !DILocation(line: 329, column: 21, scope: !500)
!502 = !DILocation(line: 329, column: 28, scope: !503)
!503 = distinct !DILexicalBlock(scope: !500, file: !69, line: 329, column: 17)
!504 = !DILocation(line: 329, column: 30, scope: !503)
!505 = !DILocation(line: 329, column: 17, scope: !500)
!506 = !DILocation(line: 331, column: 34, scope: !507)
!507 = distinct !DILexicalBlock(scope: !503, file: !69, line: 330, column: 17)
!508 = !DILocation(line: 331, column: 41, scope: !507)
!509 = !DILocation(line: 331, column: 21, scope: !507)
!510 = !DILocation(line: 332, column: 17, scope: !507)
!511 = !DILocation(line: 329, column: 37, scope: !503)
!512 = !DILocation(line: 329, column: 17, scope: !503)
!513 = distinct !{!513, !505, !514, !195}
!514 = !DILocation(line: 332, column: 17, scope: !500)
!515 = !DILocation(line: 333, column: 13, scope: !496)
!516 = !DILocation(line: 336, column: 17, scope: !517)
!517 = distinct !DILexicalBlock(scope: !489, file: !69, line: 335, column: 13)
!518 = !DILocation(line: 338, column: 18, scope: !458)
!519 = !DILocation(line: 338, column: 13, scope: !458)
!520 = !DILocation(line: 341, column: 1, scope: !386)
!521 = distinct !DISubprogram(name: "goodG2B1", scope: !69, file: !69, line: 344, type: !70, scopeLine: 345, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!522 = !DILocalVariable(name: "data", scope: !521, file: !69, line: 346, type: !60)
!523 = !DILocation(line: 346, column: 9, scope: !521)
!524 = !DILocation(line: 348, column: 10, scope: !521)
!525 = !DILocation(line: 358, column: 14, scope: !526)
!526 = distinct !DILexicalBlock(scope: !527, file: !69, line: 355, column: 5)
!527 = distinct !DILexicalBlock(scope: !521, file: !69, line: 349, column: 8)
!528 = !DILocalVariable(name: "i", scope: !529, file: !69, line: 363, type: !60)
!529 = distinct !DILexicalBlock(scope: !530, file: !69, line: 362, column: 9)
!530 = distinct !DILexicalBlock(scope: !531, file: !69, line: 361, column: 5)
!531 = distinct !DILexicalBlock(scope: !521, file: !69, line: 360, column: 8)
!532 = !DILocation(line: 363, column: 17, scope: !529)
!533 = !DILocalVariable(name: "buffer", scope: !529, file: !69, line: 364, type: !59)
!534 = !DILocation(line: 364, column: 19, scope: !529)
!535 = !DILocation(line: 364, column: 35, scope: !529)
!536 = !DILocation(line: 364, column: 28, scope: !529)
!537 = !DILocation(line: 365, column: 17, scope: !538)
!538 = distinct !DILexicalBlock(scope: !529, file: !69, line: 365, column: 17)
!539 = !DILocation(line: 365, column: 24, scope: !538)
!540 = !DILocation(line: 365, column: 17, scope: !529)
!541 = !DILocation(line: 365, column: 34, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !69, line: 365, column: 33)
!543 = !DILocation(line: 367, column: 20, scope: !544)
!544 = distinct !DILexicalBlock(scope: !529, file: !69, line: 367, column: 13)
!545 = !DILocation(line: 367, column: 18, scope: !544)
!546 = !DILocation(line: 367, column: 25, scope: !547)
!547 = distinct !DILexicalBlock(scope: !544, file: !69, line: 367, column: 13)
!548 = !DILocation(line: 367, column: 27, scope: !547)
!549 = !DILocation(line: 367, column: 13, scope: !544)
!550 = !DILocation(line: 369, column: 17, scope: !551)
!551 = distinct !DILexicalBlock(scope: !547, file: !69, line: 368, column: 13)
!552 = !DILocation(line: 369, column: 24, scope: !551)
!553 = !DILocation(line: 369, column: 27, scope: !551)
!554 = !DILocation(line: 370, column: 13, scope: !551)
!555 = !DILocation(line: 367, column: 34, scope: !547)
!556 = !DILocation(line: 367, column: 13, scope: !547)
!557 = distinct !{!557, !549, !558, !195}
!558 = !DILocation(line: 370, column: 13, scope: !544)
!559 = !DILocation(line: 373, column: 17, scope: !560)
!560 = distinct !DILexicalBlock(scope: !529, file: !69, line: 373, column: 17)
!561 = !DILocation(line: 373, column: 22, scope: !560)
!562 = !DILocation(line: 373, column: 17, scope: !529)
!563 = !DILocation(line: 375, column: 17, scope: !564)
!564 = distinct !DILexicalBlock(scope: !560, file: !69, line: 374, column: 13)
!565 = !DILocation(line: 375, column: 24, scope: !564)
!566 = !DILocation(line: 375, column: 30, scope: !564)
!567 = !DILocation(line: 377, column: 23, scope: !568)
!568 = distinct !DILexicalBlock(scope: !564, file: !69, line: 377, column: 17)
!569 = !DILocation(line: 377, column: 21, scope: !568)
!570 = !DILocation(line: 377, column: 28, scope: !571)
!571 = distinct !DILexicalBlock(scope: !568, file: !69, line: 377, column: 17)
!572 = !DILocation(line: 377, column: 30, scope: !571)
!573 = !DILocation(line: 377, column: 17, scope: !568)
!574 = !DILocation(line: 379, column: 34, scope: !575)
!575 = distinct !DILexicalBlock(scope: !571, file: !69, line: 378, column: 17)
!576 = !DILocation(line: 379, column: 41, scope: !575)
!577 = !DILocation(line: 379, column: 21, scope: !575)
!578 = !DILocation(line: 380, column: 17, scope: !575)
!579 = !DILocation(line: 377, column: 37, scope: !571)
!580 = !DILocation(line: 377, column: 17, scope: !571)
!581 = distinct !{!581, !573, !582, !195}
!582 = !DILocation(line: 380, column: 17, scope: !568)
!583 = !DILocation(line: 381, column: 13, scope: !564)
!584 = !DILocation(line: 384, column: 17, scope: !585)
!585 = distinct !DILexicalBlock(scope: !560, file: !69, line: 383, column: 13)
!586 = !DILocation(line: 386, column: 18, scope: !529)
!587 = !DILocation(line: 386, column: 13, scope: !529)
!588 = !DILocation(line: 389, column: 1, scope: !521)
!589 = distinct !DISubprogram(name: "goodG2B2", scope: !69, file: !69, line: 392, type: !70, scopeLine: 393, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!590 = !DILocalVariable(name: "data", scope: !589, file: !69, line: 394, type: !60)
!591 = !DILocation(line: 394, column: 9, scope: !589)
!592 = !DILocation(line: 396, column: 10, scope: !589)
!593 = !DILocation(line: 401, column: 14, scope: !594)
!594 = distinct !DILexicalBlock(scope: !595, file: !69, line: 398, column: 5)
!595 = distinct !DILexicalBlock(scope: !589, file: !69, line: 397, column: 8)
!596 = !DILocalVariable(name: "i", scope: !597, file: !69, line: 406, type: !60)
!597 = distinct !DILexicalBlock(scope: !598, file: !69, line: 405, column: 9)
!598 = distinct !DILexicalBlock(scope: !599, file: !69, line: 404, column: 5)
!599 = distinct !DILexicalBlock(scope: !589, file: !69, line: 403, column: 8)
!600 = !DILocation(line: 406, column: 17, scope: !597)
!601 = !DILocalVariable(name: "buffer", scope: !597, file: !69, line: 407, type: !59)
!602 = !DILocation(line: 407, column: 19, scope: !597)
!603 = !DILocation(line: 407, column: 35, scope: !597)
!604 = !DILocation(line: 407, column: 28, scope: !597)
!605 = !DILocation(line: 408, column: 17, scope: !606)
!606 = distinct !DILexicalBlock(scope: !597, file: !69, line: 408, column: 17)
!607 = !DILocation(line: 408, column: 24, scope: !606)
!608 = !DILocation(line: 408, column: 17, scope: !597)
!609 = !DILocation(line: 408, column: 34, scope: !610)
!610 = distinct !DILexicalBlock(scope: !606, file: !69, line: 408, column: 33)
!611 = !DILocation(line: 410, column: 20, scope: !612)
!612 = distinct !DILexicalBlock(scope: !597, file: !69, line: 410, column: 13)
!613 = !DILocation(line: 410, column: 18, scope: !612)
!614 = !DILocation(line: 410, column: 25, scope: !615)
!615 = distinct !DILexicalBlock(scope: !612, file: !69, line: 410, column: 13)
!616 = !DILocation(line: 410, column: 27, scope: !615)
!617 = !DILocation(line: 410, column: 13, scope: !612)
!618 = !DILocation(line: 412, column: 17, scope: !619)
!619 = distinct !DILexicalBlock(scope: !615, file: !69, line: 411, column: 13)
!620 = !DILocation(line: 412, column: 24, scope: !619)
!621 = !DILocation(line: 412, column: 27, scope: !619)
!622 = !DILocation(line: 413, column: 13, scope: !619)
!623 = !DILocation(line: 410, column: 34, scope: !615)
!624 = !DILocation(line: 410, column: 13, scope: !615)
!625 = distinct !{!625, !617, !626, !195}
!626 = !DILocation(line: 413, column: 13, scope: !612)
!627 = !DILocation(line: 416, column: 17, scope: !628)
!628 = distinct !DILexicalBlock(scope: !597, file: !69, line: 416, column: 17)
!629 = !DILocation(line: 416, column: 22, scope: !628)
!630 = !DILocation(line: 416, column: 17, scope: !597)
!631 = !DILocation(line: 418, column: 17, scope: !632)
!632 = distinct !DILexicalBlock(scope: !628, file: !69, line: 417, column: 13)
!633 = !DILocation(line: 418, column: 24, scope: !632)
!634 = !DILocation(line: 418, column: 30, scope: !632)
!635 = !DILocation(line: 420, column: 23, scope: !636)
!636 = distinct !DILexicalBlock(scope: !632, file: !69, line: 420, column: 17)
!637 = !DILocation(line: 420, column: 21, scope: !636)
!638 = !DILocation(line: 420, column: 28, scope: !639)
!639 = distinct !DILexicalBlock(scope: !636, file: !69, line: 420, column: 17)
!640 = !DILocation(line: 420, column: 30, scope: !639)
!641 = !DILocation(line: 420, column: 17, scope: !636)
!642 = !DILocation(line: 422, column: 34, scope: !643)
!643 = distinct !DILexicalBlock(scope: !639, file: !69, line: 421, column: 17)
!644 = !DILocation(line: 422, column: 41, scope: !643)
!645 = !DILocation(line: 422, column: 21, scope: !643)
!646 = !DILocation(line: 423, column: 17, scope: !643)
!647 = !DILocation(line: 420, column: 37, scope: !639)
!648 = !DILocation(line: 420, column: 17, scope: !639)
!649 = distinct !{!649, !641, !650, !195}
!650 = !DILocation(line: 423, column: 17, scope: !636)
!651 = !DILocation(line: 424, column: 13, scope: !632)
!652 = !DILocation(line: 427, column: 17, scope: !653)
!653 = distinct !DILexicalBlock(scope: !628, file: !69, line: 426, column: 13)
!654 = !DILocation(line: 429, column: 18, scope: !597)
!655 = !DILocation(line: 429, column: 13, scope: !597)
!656 = !DILocation(line: 432, column: 1, scope: !589)
