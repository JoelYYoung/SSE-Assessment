; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_16.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_16_bad() #0 !dbg !68 {
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
  br label %while.body, !dbg !76

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !77, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !81, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %connectSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %do.body, !dbg !108

do.body:                                          ; preds = %while.body
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
  br label %while.end, !dbg !164

while.end:                                        ; preds = %if.end20
  br label %while.body21, !dbg !165

while.body21:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !166, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !170, metadata !DIExpression()), !dbg !171
  %call22 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !172
  %10 = bitcast i8* %call22 to i32*, !dbg !173
  store i32* %10, i32** %buffer, align 8, !dbg !171
  %11 = load i32*, i32** %buffer, align 8, !dbg !174
  %cmp23 = icmp eq i32* %11, null, !dbg !176
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !177

if.then25:                                        ; preds = %while.body21
  call void @exit(i32 -1) #11, !dbg !178
  unreachable, !dbg !178

if.end26:                                         ; preds = %while.body21
  store i32 0, i32* %i, align 4, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end26
  %12 = load i32, i32* %i, align 4, !dbg !183
  %cmp27 = icmp slt i32 %12, 10, !dbg !185
  br i1 %cmp27, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !187
  %14 = load i32, i32* %i, align 4, !dbg !189
  %idxprom29 = sext i32 %14 to i64, !dbg !187
  %arrayidx30 = getelementptr inbounds i32, i32* %13, i64 %idxprom29, !dbg !187
  store i32 0, i32* %arrayidx30, align 4, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !192
  %inc = add nsw i32 %15, 1, !dbg !192
  store i32 %inc, i32* %i, align 4, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !197
  %cmp31 = icmp sge i32 %16, 0, !dbg !199
  br i1 %cmp31, label %if.then33, label %if.else, !dbg !200

if.then33:                                        ; preds = %for.end
  %17 = load i32*, i32** %buffer, align 8, !dbg !201
  %18 = load i32, i32* %data, align 4, !dbg !203
  %idxprom34 = sext i32 %18 to i64, !dbg !201
  %arrayidx35 = getelementptr inbounds i32, i32* %17, i64 %idxprom34, !dbg !201
  store i32 1, i32* %arrayidx35, align 4, !dbg !204
  store i32 0, i32* %i, align 4, !dbg !205
  br label %for.cond36, !dbg !207

for.cond36:                                       ; preds = %for.inc42, %if.then33
  %19 = load i32, i32* %i, align 4, !dbg !208
  %cmp37 = icmp slt i32 %19, 10, !dbg !210
  br i1 %cmp37, label %for.body39, label %for.end44, !dbg !211

for.body39:                                       ; preds = %for.cond36
  %20 = load i32*, i32** %buffer, align 8, !dbg !212
  %21 = load i32, i32* %i, align 4, !dbg !214
  %idxprom40 = sext i32 %21 to i64, !dbg !212
  %arrayidx41 = getelementptr inbounds i32, i32* %20, i64 %idxprom40, !dbg !212
  %22 = load i32, i32* %arrayidx41, align 4, !dbg !212
  call void @printIntLine(i32 %22), !dbg !215
  br label %for.inc42, !dbg !216

for.inc42:                                        ; preds = %for.body39
  %23 = load i32, i32* %i, align 4, !dbg !217
  %inc43 = add nsw i32 %23, 1, !dbg !217
  store i32 %inc43, i32* %i, align 4, !dbg !217
  br label %for.cond36, !dbg !218, !llvm.loop !219

for.end44:                                        ; preds = %for.cond36
  br label %if.end45, !dbg !221

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !222
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end44
  %24 = load i32*, i32** %buffer, align 8, !dbg !224
  %25 = bitcast i32* %24 to i8*, !dbg !224
  call void @free(i8* %25) #8, !dbg !225
  br label %while.end46, !dbg !226

while.end46:                                      ; preds = %if.end45
  ret void, !dbg !227
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_16_good() #0 !dbg !228 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_16_good(), !dbg !245
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !246
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !247
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_16_bad(), !dbg !248
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
  br label %while.body, !dbg !255

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !256, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %connectSocket, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !264, metadata !DIExpression()), !dbg !265
  br label %do.body, !dbg !266

do.body:                                          ; preds = %while.body
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
  br label %while.end, !dbg !322

while.end:                                        ; preds = %if.end20
  br label %while.body21, !dbg !323

while.body21:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !324, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !328, metadata !DIExpression()), !dbg !329
  %call22 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !330
  %10 = bitcast i8* %call22 to i32*, !dbg !331
  store i32* %10, i32** %buffer, align 8, !dbg !329
  %11 = load i32*, i32** %buffer, align 8, !dbg !332
  %cmp23 = icmp eq i32* %11, null, !dbg !334
  br i1 %cmp23, label %if.then25, label %if.end26, !dbg !335

if.then25:                                        ; preds = %while.body21
  call void @exit(i32 -1) #11, !dbg !336
  unreachable, !dbg !336

if.end26:                                         ; preds = %while.body21
  store i32 0, i32* %i, align 4, !dbg !338
  br label %for.cond, !dbg !340

for.cond:                                         ; preds = %for.inc, %if.end26
  %12 = load i32, i32* %i, align 4, !dbg !341
  %cmp27 = icmp slt i32 %12, 10, !dbg !343
  br i1 %cmp27, label %for.body, label %for.end, !dbg !344

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !345
  %14 = load i32, i32* %i, align 4, !dbg !347
  %idxprom29 = sext i32 %14 to i64, !dbg !345
  %arrayidx30 = getelementptr inbounds i32, i32* %13, i64 %idxprom29, !dbg !345
  store i32 0, i32* %arrayidx30, align 4, !dbg !348
  br label %for.inc, !dbg !349

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !350
  %inc = add nsw i32 %15, 1, !dbg !350
  store i32 %inc, i32* %i, align 4, !dbg !350
  br label %for.cond, !dbg !351, !llvm.loop !352

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !354
  %cmp31 = icmp sge i32 %16, 0, !dbg !356
  br i1 %cmp31, label %land.lhs.true, label %if.else, !dbg !357

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !358
  %cmp33 = icmp slt i32 %17, 10, !dbg !359
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !360

if.then35:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !361
  %19 = load i32, i32* %data, align 4, !dbg !363
  %idxprom36 = sext i32 %19 to i64, !dbg !361
  %arrayidx37 = getelementptr inbounds i32, i32* %18, i64 %idxprom36, !dbg !361
  store i32 1, i32* %arrayidx37, align 4, !dbg !364
  store i32 0, i32* %i, align 4, !dbg !365
  br label %for.cond38, !dbg !367

for.cond38:                                       ; preds = %for.inc44, %if.then35
  %20 = load i32, i32* %i, align 4, !dbg !368
  %cmp39 = icmp slt i32 %20, 10, !dbg !370
  br i1 %cmp39, label %for.body41, label %for.end46, !dbg !371

for.body41:                                       ; preds = %for.cond38
  %21 = load i32*, i32** %buffer, align 8, !dbg !372
  %22 = load i32, i32* %i, align 4, !dbg !374
  %idxprom42 = sext i32 %22 to i64, !dbg !372
  %arrayidx43 = getelementptr inbounds i32, i32* %21, i64 %idxprom42, !dbg !372
  %23 = load i32, i32* %arrayidx43, align 4, !dbg !372
  call void @printIntLine(i32 %23), !dbg !375
  br label %for.inc44, !dbg !376

for.inc44:                                        ; preds = %for.body41
  %24 = load i32, i32* %i, align 4, !dbg !377
  %inc45 = add nsw i32 %24, 1, !dbg !377
  store i32 %inc45, i32* %i, align 4, !dbg !377
  br label %for.cond38, !dbg !378, !llvm.loop !379

for.end46:                                        ; preds = %for.cond38
  br label %if.end47, !dbg !381

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !382
  br label %if.end47

if.end47:                                         ; preds = %if.else, %for.end46
  %25 = load i32*, i32** %buffer, align 8, !dbg !384
  %26 = bitcast i32* %25 to i8*, !dbg !384
  call void @free(i8* %26) #8, !dbg !385
  br label %while.end48, !dbg !386

while.end48:                                      ; preds = %if.end47
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
  br label %while.body, !dbg !392

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !393
  br label %while.end, !dbg !395

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !396

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !397, metadata !DIExpression()), !dbg !400
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !401, metadata !DIExpression()), !dbg !402
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !403
  %0 = bitcast i8* %call to i32*, !dbg !404
  store i32* %0, i32** %buffer, align 8, !dbg !402
  %1 = load i32*, i32** %buffer, align 8, !dbg !405
  %cmp = icmp eq i32* %1, null, !dbg !407
  br i1 %cmp, label %if.then, label %if.end, !dbg !408

if.then:                                          ; preds = %while.body1
  call void @exit(i32 -1) #11, !dbg !409
  unreachable, !dbg !409

if.end:                                           ; preds = %while.body1
  store i32 0, i32* %i, align 4, !dbg !411
  br label %for.cond, !dbg !413

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !414
  %cmp2 = icmp slt i32 %2, 10, !dbg !416
  br i1 %cmp2, label %for.body, label %for.end, !dbg !417

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !418
  %4 = load i32, i32* %i, align 4, !dbg !420
  %idxprom = sext i32 %4 to i64, !dbg !418
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !418
  store i32 0, i32* %arrayidx, align 4, !dbg !421
  br label %for.inc, !dbg !422

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !423
  %inc = add nsw i32 %5, 1, !dbg !423
  store i32 %inc, i32* %i, align 4, !dbg !423
  br label %for.cond, !dbg !424, !llvm.loop !425

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !427
  %cmp3 = icmp sge i32 %6, 0, !dbg !429
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !430

if.then4:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !431
  %8 = load i32, i32* %data, align 4, !dbg !433
  %idxprom5 = sext i32 %8 to i64, !dbg !431
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 %idxprom5, !dbg !431
  store i32 1, i32* %arrayidx6, align 4, !dbg !434
  store i32 0, i32* %i, align 4, !dbg !435
  br label %for.cond7, !dbg !437

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %9 = load i32, i32* %i, align 4, !dbg !438
  %cmp8 = icmp slt i32 %9, 10, !dbg !440
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !441

for.body9:                                        ; preds = %for.cond7
  %10 = load i32*, i32** %buffer, align 8, !dbg !442
  %11 = load i32, i32* %i, align 4, !dbg !444
  %idxprom10 = sext i32 %11 to i64, !dbg !442
  %arrayidx11 = getelementptr inbounds i32, i32* %10, i64 %idxprom10, !dbg !442
  %12 = load i32, i32* %arrayidx11, align 4, !dbg !442
  call void @printIntLine(i32 %12), !dbg !445
  br label %for.inc12, !dbg !446

for.inc12:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !dbg !447
  %inc13 = add nsw i32 %13, 1, !dbg !447
  store i32 %inc13, i32* %i, align 4, !dbg !447
  br label %for.cond7, !dbg !448, !llvm.loop !449

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !451

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !452
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %14 = load i32*, i32** %buffer, align 8, !dbg !454
  %15 = bitcast i32* %14 to i8*, !dbg !454
  call void @free(i8* %15) #8, !dbg !455
  br label %while.end16, !dbg !456

while.end16:                                      ; preds = %if.end15
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_16_bad", scope: !69, file: !69, line: 44, type: !70, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_16.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 46, type: !60)
!74 = !DILocation(line: 46, column: 9, scope: !68)
!75 = !DILocation(line: 48, column: 10, scope: !68)
!76 = !DILocation(line: 49, column: 5, scope: !68)
!77 = !DILocalVariable(name: "recvResult", scope: !78, file: !69, line: 56, type: !60)
!78 = distinct !DILexicalBlock(scope: !79, file: !69, line: 51, column: 9)
!79 = distinct !DILexicalBlock(scope: !68, file: !69, line: 50, column: 5)
!80 = !DILocation(line: 56, column: 17, scope: !78)
!81 = !DILocalVariable(name: "service", scope: !78, file: !69, line: 57, type: !82)
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
!103 = !DILocation(line: 57, column: 32, scope: !78)
!104 = !DILocalVariable(name: "connectSocket", scope: !78, file: !69, line: 58, type: !60)
!105 = !DILocation(line: 58, column: 20, scope: !78)
!106 = !DILocalVariable(name: "inputBuffer", scope: !78, file: !69, line: 59, type: !55)
!107 = !DILocation(line: 59, column: 18, scope: !78)
!108 = !DILocation(line: 60, column: 13, scope: !78)
!109 = !DILocation(line: 70, column: 33, scope: !110)
!110 = distinct !DILexicalBlock(scope: !78, file: !69, line: 61, column: 13)
!111 = !DILocation(line: 70, column: 31, scope: !110)
!112 = !DILocation(line: 71, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !69, line: 71, column: 21)
!114 = !DILocation(line: 71, column: 35, scope: !113)
!115 = !DILocation(line: 71, column: 21, scope: !110)
!116 = !DILocation(line: 73, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !69, line: 72, column: 17)
!118 = !DILocation(line: 75, column: 17, scope: !110)
!119 = !DILocation(line: 76, column: 25, scope: !110)
!120 = !DILocation(line: 76, column: 36, scope: !110)
!121 = !DILocation(line: 77, column: 43, scope: !110)
!122 = !DILocation(line: 77, column: 25, scope: !110)
!123 = !DILocation(line: 77, column: 34, scope: !110)
!124 = !DILocation(line: 77, column: 41, scope: !110)
!125 = !DILocation(line: 78, column: 36, scope: !110)
!126 = !DILocation(line: 78, column: 25, scope: !110)
!127 = !DILocation(line: 78, column: 34, scope: !110)
!128 = !DILocation(line: 79, column: 29, scope: !129)
!129 = distinct !DILexicalBlock(scope: !110, file: !69, line: 79, column: 21)
!130 = !DILocation(line: 79, column: 44, scope: !129)
!131 = !DILocation(line: 79, column: 21, scope: !129)
!132 = !DILocation(line: 79, column: 89, scope: !129)
!133 = !DILocation(line: 79, column: 21, scope: !110)
!134 = !DILocation(line: 81, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !69, line: 80, column: 17)
!136 = !DILocation(line: 85, column: 35, scope: !110)
!137 = !DILocation(line: 85, column: 50, scope: !110)
!138 = !DILocation(line: 85, column: 30, scope: !110)
!139 = !DILocation(line: 85, column: 28, scope: !110)
!140 = !DILocation(line: 86, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !110, file: !69, line: 86, column: 21)
!142 = !DILocation(line: 86, column: 32, scope: !141)
!143 = !DILocation(line: 86, column: 48, scope: !141)
!144 = !DILocation(line: 86, column: 51, scope: !141)
!145 = !DILocation(line: 86, column: 62, scope: !141)
!146 = !DILocation(line: 86, column: 21, scope: !110)
!147 = !DILocation(line: 88, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !141, file: !69, line: 87, column: 17)
!149 = !DILocation(line: 91, column: 29, scope: !110)
!150 = !DILocation(line: 91, column: 17, scope: !110)
!151 = !DILocation(line: 91, column: 41, scope: !110)
!152 = !DILocation(line: 93, column: 29, scope: !110)
!153 = !DILocation(line: 93, column: 24, scope: !110)
!154 = !DILocation(line: 93, column: 22, scope: !110)
!155 = !DILocation(line: 94, column: 13, scope: !110)
!156 = !DILocation(line: 96, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !78, file: !69, line: 96, column: 17)
!158 = !DILocation(line: 96, column: 31, scope: !157)
!159 = !DILocation(line: 96, column: 17, scope: !78)
!160 = !DILocation(line: 98, column: 30, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !69, line: 97, column: 13)
!162 = !DILocation(line: 98, column: 17, scope: !161)
!163 = !DILocation(line: 99, column: 13, scope: !161)
!164 = !DILocation(line: 107, column: 9, scope: !79)
!165 = !DILocation(line: 109, column: 5, scope: !68)
!166 = !DILocalVariable(name: "i", scope: !167, file: !69, line: 112, type: !60)
!167 = distinct !DILexicalBlock(scope: !168, file: !69, line: 111, column: 9)
!168 = distinct !DILexicalBlock(scope: !68, file: !69, line: 110, column: 5)
!169 = !DILocation(line: 112, column: 17, scope: !167)
!170 = !DILocalVariable(name: "buffer", scope: !167, file: !69, line: 113, type: !59)
!171 = !DILocation(line: 113, column: 19, scope: !167)
!172 = !DILocation(line: 113, column: 35, scope: !167)
!173 = !DILocation(line: 113, column: 28, scope: !167)
!174 = !DILocation(line: 114, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !167, file: !69, line: 114, column: 17)
!176 = !DILocation(line: 114, column: 24, scope: !175)
!177 = !DILocation(line: 114, column: 17, scope: !167)
!178 = !DILocation(line: 114, column: 34, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !69, line: 114, column: 33)
!180 = !DILocation(line: 116, column: 20, scope: !181)
!181 = distinct !DILexicalBlock(scope: !167, file: !69, line: 116, column: 13)
!182 = !DILocation(line: 116, column: 18, scope: !181)
!183 = !DILocation(line: 116, column: 25, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !69, line: 116, column: 13)
!185 = !DILocation(line: 116, column: 27, scope: !184)
!186 = !DILocation(line: 116, column: 13, scope: !181)
!187 = !DILocation(line: 118, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !69, line: 117, column: 13)
!189 = !DILocation(line: 118, column: 24, scope: !188)
!190 = !DILocation(line: 118, column: 27, scope: !188)
!191 = !DILocation(line: 119, column: 13, scope: !188)
!192 = !DILocation(line: 116, column: 34, scope: !184)
!193 = !DILocation(line: 116, column: 13, scope: !184)
!194 = distinct !{!194, !186, !195, !196}
!195 = !DILocation(line: 119, column: 13, scope: !181)
!196 = !{!"llvm.loop.mustprogress"}
!197 = !DILocation(line: 122, column: 17, scope: !198)
!198 = distinct !DILexicalBlock(scope: !167, file: !69, line: 122, column: 17)
!199 = !DILocation(line: 122, column: 22, scope: !198)
!200 = !DILocation(line: 122, column: 17, scope: !167)
!201 = !DILocation(line: 124, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !69, line: 123, column: 13)
!203 = !DILocation(line: 124, column: 24, scope: !202)
!204 = !DILocation(line: 124, column: 30, scope: !202)
!205 = !DILocation(line: 126, column: 23, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !69, line: 126, column: 17)
!207 = !DILocation(line: 126, column: 21, scope: !206)
!208 = !DILocation(line: 126, column: 28, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !69, line: 126, column: 17)
!210 = !DILocation(line: 126, column: 30, scope: !209)
!211 = !DILocation(line: 126, column: 17, scope: !206)
!212 = !DILocation(line: 128, column: 34, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !69, line: 127, column: 17)
!214 = !DILocation(line: 128, column: 41, scope: !213)
!215 = !DILocation(line: 128, column: 21, scope: !213)
!216 = !DILocation(line: 129, column: 17, scope: !213)
!217 = !DILocation(line: 126, column: 37, scope: !209)
!218 = !DILocation(line: 126, column: 17, scope: !209)
!219 = distinct !{!219, !211, !220, !196}
!220 = !DILocation(line: 129, column: 17, scope: !206)
!221 = !DILocation(line: 130, column: 13, scope: !202)
!222 = !DILocation(line: 133, column: 17, scope: !223)
!223 = distinct !DILexicalBlock(scope: !198, file: !69, line: 132, column: 13)
!224 = !DILocation(line: 135, column: 18, scope: !167)
!225 = !DILocation(line: 135, column: 13, scope: !167)
!226 = !DILocation(line: 137, column: 9, scope: !168)
!227 = !DILocation(line: 139, column: 1, scope: !68)
!228 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_16_good", scope: !69, file: !69, line: 287, type: !70, scopeLine: 288, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!229 = !DILocation(line: 289, column: 5, scope: !228)
!230 = !DILocation(line: 290, column: 5, scope: !228)
!231 = !DILocation(line: 291, column: 1, scope: !228)
!232 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 302, type: !233, scopeLine: 303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!233 = !DISubroutineType(types: !234)
!234 = !{!60, !60, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!237 = !DILocalVariable(name: "argc", arg: 1, scope: !232, file: !69, line: 302, type: !60)
!238 = !DILocation(line: 302, column: 14, scope: !232)
!239 = !DILocalVariable(name: "argv", arg: 2, scope: !232, file: !69, line: 302, type: !235)
!240 = !DILocation(line: 302, column: 27, scope: !232)
!241 = !DILocation(line: 305, column: 22, scope: !232)
!242 = !DILocation(line: 305, column: 12, scope: !232)
!243 = !DILocation(line: 305, column: 5, scope: !232)
!244 = !DILocation(line: 307, column: 5, scope: !232)
!245 = !DILocation(line: 308, column: 5, scope: !232)
!246 = !DILocation(line: 309, column: 5, scope: !232)
!247 = !DILocation(line: 312, column: 5, scope: !232)
!248 = !DILocation(line: 313, column: 5, scope: !232)
!249 = !DILocation(line: 314, column: 5, scope: !232)
!250 = !DILocation(line: 316, column: 5, scope: !232)
!251 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 146, type: !70, scopeLine: 147, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!252 = !DILocalVariable(name: "data", scope: !251, file: !69, line: 148, type: !60)
!253 = !DILocation(line: 148, column: 9, scope: !251)
!254 = !DILocation(line: 150, column: 10, scope: !251)
!255 = !DILocation(line: 151, column: 5, scope: !251)
!256 = !DILocalVariable(name: "recvResult", scope: !257, file: !69, line: 158, type: !60)
!257 = distinct !DILexicalBlock(scope: !258, file: !69, line: 153, column: 9)
!258 = distinct !DILexicalBlock(scope: !251, file: !69, line: 152, column: 5)
!259 = !DILocation(line: 158, column: 17, scope: !257)
!260 = !DILocalVariable(name: "service", scope: !257, file: !69, line: 159, type: !82)
!261 = !DILocation(line: 159, column: 32, scope: !257)
!262 = !DILocalVariable(name: "connectSocket", scope: !257, file: !69, line: 160, type: !60)
!263 = !DILocation(line: 160, column: 20, scope: !257)
!264 = !DILocalVariable(name: "inputBuffer", scope: !257, file: !69, line: 161, type: !55)
!265 = !DILocation(line: 161, column: 18, scope: !257)
!266 = !DILocation(line: 162, column: 13, scope: !257)
!267 = !DILocation(line: 172, column: 33, scope: !268)
!268 = distinct !DILexicalBlock(scope: !257, file: !69, line: 163, column: 13)
!269 = !DILocation(line: 172, column: 31, scope: !268)
!270 = !DILocation(line: 173, column: 21, scope: !271)
!271 = distinct !DILexicalBlock(scope: !268, file: !69, line: 173, column: 21)
!272 = !DILocation(line: 173, column: 35, scope: !271)
!273 = !DILocation(line: 173, column: 21, scope: !268)
!274 = !DILocation(line: 175, column: 21, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !69, line: 174, column: 17)
!276 = !DILocation(line: 177, column: 17, scope: !268)
!277 = !DILocation(line: 178, column: 25, scope: !268)
!278 = !DILocation(line: 178, column: 36, scope: !268)
!279 = !DILocation(line: 179, column: 43, scope: !268)
!280 = !DILocation(line: 179, column: 25, scope: !268)
!281 = !DILocation(line: 179, column: 34, scope: !268)
!282 = !DILocation(line: 179, column: 41, scope: !268)
!283 = !DILocation(line: 180, column: 36, scope: !268)
!284 = !DILocation(line: 180, column: 25, scope: !268)
!285 = !DILocation(line: 180, column: 34, scope: !268)
!286 = !DILocation(line: 181, column: 29, scope: !287)
!287 = distinct !DILexicalBlock(scope: !268, file: !69, line: 181, column: 21)
!288 = !DILocation(line: 181, column: 44, scope: !287)
!289 = !DILocation(line: 181, column: 21, scope: !287)
!290 = !DILocation(line: 181, column: 89, scope: !287)
!291 = !DILocation(line: 181, column: 21, scope: !268)
!292 = !DILocation(line: 183, column: 21, scope: !293)
!293 = distinct !DILexicalBlock(scope: !287, file: !69, line: 182, column: 17)
!294 = !DILocation(line: 187, column: 35, scope: !268)
!295 = !DILocation(line: 187, column: 50, scope: !268)
!296 = !DILocation(line: 187, column: 30, scope: !268)
!297 = !DILocation(line: 187, column: 28, scope: !268)
!298 = !DILocation(line: 188, column: 21, scope: !299)
!299 = distinct !DILexicalBlock(scope: !268, file: !69, line: 188, column: 21)
!300 = !DILocation(line: 188, column: 32, scope: !299)
!301 = !DILocation(line: 188, column: 48, scope: !299)
!302 = !DILocation(line: 188, column: 51, scope: !299)
!303 = !DILocation(line: 188, column: 62, scope: !299)
!304 = !DILocation(line: 188, column: 21, scope: !268)
!305 = !DILocation(line: 190, column: 21, scope: !306)
!306 = distinct !DILexicalBlock(scope: !299, file: !69, line: 189, column: 17)
!307 = !DILocation(line: 193, column: 29, scope: !268)
!308 = !DILocation(line: 193, column: 17, scope: !268)
!309 = !DILocation(line: 193, column: 41, scope: !268)
!310 = !DILocation(line: 195, column: 29, scope: !268)
!311 = !DILocation(line: 195, column: 24, scope: !268)
!312 = !DILocation(line: 195, column: 22, scope: !268)
!313 = !DILocation(line: 196, column: 13, scope: !268)
!314 = !DILocation(line: 198, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !257, file: !69, line: 198, column: 17)
!316 = !DILocation(line: 198, column: 31, scope: !315)
!317 = !DILocation(line: 198, column: 17, scope: !257)
!318 = !DILocation(line: 200, column: 30, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !69, line: 199, column: 13)
!320 = !DILocation(line: 200, column: 17, scope: !319)
!321 = !DILocation(line: 201, column: 13, scope: !319)
!322 = !DILocation(line: 209, column: 9, scope: !258)
!323 = !DILocation(line: 211, column: 5, scope: !251)
!324 = !DILocalVariable(name: "i", scope: !325, file: !69, line: 214, type: !60)
!325 = distinct !DILexicalBlock(scope: !326, file: !69, line: 213, column: 9)
!326 = distinct !DILexicalBlock(scope: !251, file: !69, line: 212, column: 5)
!327 = !DILocation(line: 214, column: 17, scope: !325)
!328 = !DILocalVariable(name: "buffer", scope: !325, file: !69, line: 215, type: !59)
!329 = !DILocation(line: 215, column: 19, scope: !325)
!330 = !DILocation(line: 215, column: 35, scope: !325)
!331 = !DILocation(line: 215, column: 28, scope: !325)
!332 = !DILocation(line: 216, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !325, file: !69, line: 216, column: 17)
!334 = !DILocation(line: 216, column: 24, scope: !333)
!335 = !DILocation(line: 216, column: 17, scope: !325)
!336 = !DILocation(line: 216, column: 34, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !69, line: 216, column: 33)
!338 = !DILocation(line: 218, column: 20, scope: !339)
!339 = distinct !DILexicalBlock(scope: !325, file: !69, line: 218, column: 13)
!340 = !DILocation(line: 218, column: 18, scope: !339)
!341 = !DILocation(line: 218, column: 25, scope: !342)
!342 = distinct !DILexicalBlock(scope: !339, file: !69, line: 218, column: 13)
!343 = !DILocation(line: 218, column: 27, scope: !342)
!344 = !DILocation(line: 218, column: 13, scope: !339)
!345 = !DILocation(line: 220, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !69, line: 219, column: 13)
!347 = !DILocation(line: 220, column: 24, scope: !346)
!348 = !DILocation(line: 220, column: 27, scope: !346)
!349 = !DILocation(line: 221, column: 13, scope: !346)
!350 = !DILocation(line: 218, column: 34, scope: !342)
!351 = !DILocation(line: 218, column: 13, scope: !342)
!352 = distinct !{!352, !344, !353, !196}
!353 = !DILocation(line: 221, column: 13, scope: !339)
!354 = !DILocation(line: 223, column: 17, scope: !355)
!355 = distinct !DILexicalBlock(scope: !325, file: !69, line: 223, column: 17)
!356 = !DILocation(line: 223, column: 22, scope: !355)
!357 = !DILocation(line: 223, column: 27, scope: !355)
!358 = !DILocation(line: 223, column: 30, scope: !355)
!359 = !DILocation(line: 223, column: 35, scope: !355)
!360 = !DILocation(line: 223, column: 17, scope: !325)
!361 = !DILocation(line: 225, column: 17, scope: !362)
!362 = distinct !DILexicalBlock(scope: !355, file: !69, line: 224, column: 13)
!363 = !DILocation(line: 225, column: 24, scope: !362)
!364 = !DILocation(line: 225, column: 30, scope: !362)
!365 = !DILocation(line: 227, column: 23, scope: !366)
!366 = distinct !DILexicalBlock(scope: !362, file: !69, line: 227, column: 17)
!367 = !DILocation(line: 227, column: 21, scope: !366)
!368 = !DILocation(line: 227, column: 28, scope: !369)
!369 = distinct !DILexicalBlock(scope: !366, file: !69, line: 227, column: 17)
!370 = !DILocation(line: 227, column: 30, scope: !369)
!371 = !DILocation(line: 227, column: 17, scope: !366)
!372 = !DILocation(line: 229, column: 34, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !69, line: 228, column: 17)
!374 = !DILocation(line: 229, column: 41, scope: !373)
!375 = !DILocation(line: 229, column: 21, scope: !373)
!376 = !DILocation(line: 230, column: 17, scope: !373)
!377 = !DILocation(line: 227, column: 37, scope: !369)
!378 = !DILocation(line: 227, column: 17, scope: !369)
!379 = distinct !{!379, !371, !380, !196}
!380 = !DILocation(line: 230, column: 17, scope: !366)
!381 = !DILocation(line: 231, column: 13, scope: !362)
!382 = !DILocation(line: 234, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !355, file: !69, line: 233, column: 13)
!384 = !DILocation(line: 236, column: 18, scope: !325)
!385 = !DILocation(line: 236, column: 13, scope: !325)
!386 = !DILocation(line: 238, column: 9, scope: !326)
!387 = !DILocation(line: 240, column: 1, scope: !251)
!388 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 243, type: !70, scopeLine: 244, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!389 = !DILocalVariable(name: "data", scope: !388, file: !69, line: 245, type: !60)
!390 = !DILocation(line: 245, column: 9, scope: !388)
!391 = !DILocation(line: 247, column: 10, scope: !388)
!392 = !DILocation(line: 248, column: 5, scope: !388)
!393 = !DILocation(line: 252, column: 14, scope: !394)
!394 = distinct !DILexicalBlock(scope: !388, file: !69, line: 249, column: 5)
!395 = !DILocation(line: 253, column: 9, scope: !394)
!396 = !DILocation(line: 255, column: 5, scope: !388)
!397 = !DILocalVariable(name: "i", scope: !398, file: !69, line: 258, type: !60)
!398 = distinct !DILexicalBlock(scope: !399, file: !69, line: 257, column: 9)
!399 = distinct !DILexicalBlock(scope: !388, file: !69, line: 256, column: 5)
!400 = !DILocation(line: 258, column: 17, scope: !398)
!401 = !DILocalVariable(name: "buffer", scope: !398, file: !69, line: 259, type: !59)
!402 = !DILocation(line: 259, column: 19, scope: !398)
!403 = !DILocation(line: 259, column: 35, scope: !398)
!404 = !DILocation(line: 259, column: 28, scope: !398)
!405 = !DILocation(line: 260, column: 17, scope: !406)
!406 = distinct !DILexicalBlock(scope: !398, file: !69, line: 260, column: 17)
!407 = !DILocation(line: 260, column: 24, scope: !406)
!408 = !DILocation(line: 260, column: 17, scope: !398)
!409 = !DILocation(line: 260, column: 34, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !69, line: 260, column: 33)
!411 = !DILocation(line: 262, column: 20, scope: !412)
!412 = distinct !DILexicalBlock(scope: !398, file: !69, line: 262, column: 13)
!413 = !DILocation(line: 262, column: 18, scope: !412)
!414 = !DILocation(line: 262, column: 25, scope: !415)
!415 = distinct !DILexicalBlock(scope: !412, file: !69, line: 262, column: 13)
!416 = !DILocation(line: 262, column: 27, scope: !415)
!417 = !DILocation(line: 262, column: 13, scope: !412)
!418 = !DILocation(line: 264, column: 17, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !69, line: 263, column: 13)
!420 = !DILocation(line: 264, column: 24, scope: !419)
!421 = !DILocation(line: 264, column: 27, scope: !419)
!422 = !DILocation(line: 265, column: 13, scope: !419)
!423 = !DILocation(line: 262, column: 34, scope: !415)
!424 = !DILocation(line: 262, column: 13, scope: !415)
!425 = distinct !{!425, !417, !426, !196}
!426 = !DILocation(line: 265, column: 13, scope: !412)
!427 = !DILocation(line: 268, column: 17, scope: !428)
!428 = distinct !DILexicalBlock(scope: !398, file: !69, line: 268, column: 17)
!429 = !DILocation(line: 268, column: 22, scope: !428)
!430 = !DILocation(line: 268, column: 17, scope: !398)
!431 = !DILocation(line: 270, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !69, line: 269, column: 13)
!433 = !DILocation(line: 270, column: 24, scope: !432)
!434 = !DILocation(line: 270, column: 30, scope: !432)
!435 = !DILocation(line: 272, column: 23, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !69, line: 272, column: 17)
!437 = !DILocation(line: 272, column: 21, scope: !436)
!438 = !DILocation(line: 272, column: 28, scope: !439)
!439 = distinct !DILexicalBlock(scope: !436, file: !69, line: 272, column: 17)
!440 = !DILocation(line: 272, column: 30, scope: !439)
!441 = !DILocation(line: 272, column: 17, scope: !436)
!442 = !DILocation(line: 274, column: 34, scope: !443)
!443 = distinct !DILexicalBlock(scope: !439, file: !69, line: 273, column: 17)
!444 = !DILocation(line: 274, column: 41, scope: !443)
!445 = !DILocation(line: 274, column: 21, scope: !443)
!446 = !DILocation(line: 275, column: 17, scope: !443)
!447 = !DILocation(line: 272, column: 37, scope: !439)
!448 = !DILocation(line: 272, column: 17, scope: !439)
!449 = distinct !{!449, !441, !450, !196}
!450 = !DILocation(line: 275, column: 17, scope: !436)
!451 = !DILocation(line: 276, column: 13, scope: !432)
!452 = !DILocation(line: 279, column: 17, scope: !453)
!453 = distinct !DILexicalBlock(scope: !428, file: !69, line: 278, column: 13)
!454 = !DILocation(line: 281, column: 18, scope: !398)
!455 = !DILocation(line: 281, column: 13, scope: !398)
!456 = !DILocation(line: 283, column: 9, scope: !399)
!457 = !DILocation(line: 285, column: 1, scope: !388)
