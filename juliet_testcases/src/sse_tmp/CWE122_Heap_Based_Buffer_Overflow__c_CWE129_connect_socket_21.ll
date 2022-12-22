; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@badStatic = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !65
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !68
@goodG2BStatic = internal global i32 0, align 4, !dbg !70

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_21_bad() #0 !dbg !78 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 -1, i32* %data, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !88, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %connectSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  br label %do.body, !dbg !115

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !116
  store i32 %call, i32* %connectSocket, align 4, !dbg !118
  %0 = load i32, i32* %connectSocket, align 4, !dbg !119
  %cmp = icmp eq i32 %0, -1, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !123

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !125
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !126
  store i16 2, i16* %sin_family, align 4, !dbg !127
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !128
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !129
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !130
  store i32 %call1, i32* %s_addr, align 4, !dbg !131
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !132
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !133
  store i16 %call2, i16* %sin_port, align 2, !dbg !134
  %2 = load i32, i32* %connectSocket, align 4, !dbg !135
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !137
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !138
  %cmp4 = icmp eq i32 %call3, -1, !dbg !139
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !140

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !141

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !143
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !144
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !145
  %conv = trunc i64 %call7 to i32, !dbg !145
  store i32 %conv, i32* %recvResult, align 4, !dbg !146
  %5 = load i32, i32* %recvResult, align 4, !dbg !147
  %cmp8 = icmp eq i32 %5, -1, !dbg !149
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !150

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !151
  %cmp10 = icmp eq i32 %6, 0, !dbg !152
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !153

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !154

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !156
  %idxprom = sext i32 %7 to i64, !dbg !157
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !157
  store i8 0, i8* %arrayidx, align 1, !dbg !158
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !160
  store i32 %call15, i32* %data, align 4, !dbg !161
  br label %do.end, !dbg !162

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !163
  %cmp16 = icmp ne i32 %8, -1, !dbg !165
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !166

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !167
  %call19 = call i32 @close(i32 %9), !dbg !169
  br label %if.end20, !dbg !170

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 1, i32* @badStatic, align 4, !dbg !171
  %10 = load i32, i32* %data, align 4, !dbg !172
  call void @badSink(i32 %10), !dbg !173
  ret void, !dbg !174
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

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !175 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !178, metadata !DIExpression()), !dbg !179
  %0 = load i32, i32* @badStatic, align 4, !dbg !180
  %tobool = icmp ne i32 %0, 0, !dbg !180
  br i1 %tobool, label %if.then, label %if.end16, !dbg !182

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !183, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !187, metadata !DIExpression()), !dbg !188
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !189
  %1 = bitcast i8* %call to i32*, !dbg !190
  store i32* %1, i32** %buffer, align 8, !dbg !188
  %2 = load i32*, i32** %buffer, align 8, !dbg !191
  %cmp = icmp eq i32* %2, null, !dbg !193
  br i1 %cmp, label %if.then1, label %if.end, !dbg !194

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #11, !dbg !195
  unreachable, !dbg !195

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !199

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !200
  %cmp2 = icmp slt i32 %3, 10, !dbg !202
  br i1 %cmp2, label %for.body, label %for.end, !dbg !203

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !204
  %5 = load i32, i32* %i, align 4, !dbg !206
  %idxprom = sext i32 %5 to i64, !dbg !204
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !204
  store i32 0, i32* %arrayidx, align 4, !dbg !207
  br label %for.inc, !dbg !208

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !209
  %inc = add nsw i32 %6, 1, !dbg !209
  store i32 %inc, i32* %i, align 4, !dbg !209
  br label %for.cond, !dbg !210, !llvm.loop !211

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !214
  %cmp3 = icmp sge i32 %7, 0, !dbg !216
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !217

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !218
  %9 = load i32, i32* %data.addr, align 4, !dbg !220
  %idxprom5 = sext i32 %9 to i64, !dbg !218
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !218
  store i32 1, i32* %arrayidx6, align 4, !dbg !221
  store i32 0, i32* %i, align 4, !dbg !222
  br label %for.cond7, !dbg !224

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !225
  %cmp8 = icmp slt i32 %10, 10, !dbg !227
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !228

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !229
  %12 = load i32, i32* %i, align 4, !dbg !231
  %idxprom10 = sext i32 %12 to i64, !dbg !229
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !229
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !229
  call void @printIntLine(i32 %13), !dbg !232
  br label %for.inc12, !dbg !233

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !234
  %inc13 = add nsw i32 %14, 1, !dbg !234
  store i32 %inc13, i32* %i, align 4, !dbg !234
  br label %for.cond7, !dbg !235, !llvm.loop !236

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !238

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !239
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !241
  %16 = bitcast i32* %15 to i8*, !dbg !241
  call void @free(i8* %16) #8, !dbg !242
  br label %if.end16, !dbg !243

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !244
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_21_good() #0 !dbg !245 {
entry:
  call void @goodB2G1(), !dbg !246
  call void @goodB2G2(), !dbg !247
  call void @goodG2B(), !dbg !248
  ret void, !dbg !249
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !250 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !255, metadata !DIExpression()), !dbg !256
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !257, metadata !DIExpression()), !dbg !258
  %call = call i64 @time(i64* null) #8, !dbg !259
  %conv = trunc i64 %call to i32, !dbg !260
  call void @srand(i32 %conv) #8, !dbg !261
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !262
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_21_good(), !dbg !263
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !264
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !265
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_21_bad(), !dbg !266
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !267
  ret i32 0, !dbg !268
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !269 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !270, metadata !DIExpression()), !dbg !271
  store i32 -1, i32* %data, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !273, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !276, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !278, metadata !DIExpression()), !dbg !279
  store i32 -1, i32* %connectSocket, align 4, !dbg !279
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !280, metadata !DIExpression()), !dbg !281
  br label %do.body, !dbg !282

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !283
  store i32 %call, i32* %connectSocket, align 4, !dbg !285
  %0 = load i32, i32* %connectSocket, align 4, !dbg !286
  %cmp = icmp eq i32 %0, -1, !dbg !288
  br i1 %cmp, label %if.then, label %if.end, !dbg !289

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !290

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !292
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !292
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !293
  store i16 2, i16* %sin_family, align 4, !dbg !294
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !295
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !296
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !297
  store i32 %call1, i32* %s_addr, align 4, !dbg !298
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !299
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !300
  store i16 %call2, i16* %sin_port, align 2, !dbg !301
  %2 = load i32, i32* %connectSocket, align 4, !dbg !302
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !304
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !305
  %cmp4 = icmp eq i32 %call3, -1, !dbg !306
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !307

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !308

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !310
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !311
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !312
  %conv = trunc i64 %call7 to i32, !dbg !312
  store i32 %conv, i32* %recvResult, align 4, !dbg !313
  %5 = load i32, i32* %recvResult, align 4, !dbg !314
  %cmp8 = icmp eq i32 %5, -1, !dbg !316
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !317

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !318
  %cmp10 = icmp eq i32 %6, 0, !dbg !319
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !320

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !321

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !323
  %idxprom = sext i32 %7 to i64, !dbg !324
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !324
  store i8 0, i8* %arrayidx, align 1, !dbg !325
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !326
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !327
  store i32 %call15, i32* %data, align 4, !dbg !328
  br label %do.end, !dbg !329

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !330
  %cmp16 = icmp ne i32 %8, -1, !dbg !332
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !333

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !334
  %call19 = call i32 @close(i32 %9), !dbg !336
  br label %if.end20, !dbg !337

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !338
  %10 = load i32, i32* %data, align 4, !dbg !339
  call void @goodB2G1Sink(i32 %10), !dbg !340
  ret void, !dbg !341
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !342 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !343, metadata !DIExpression()), !dbg !344
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !345
  %tobool = icmp ne i32 %0, 0, !dbg !345
  br i1 %tobool, label %if.then, label %if.else, !dbg !347

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !348
  br label %if.end18, !dbg !350

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !351, metadata !DIExpression()), !dbg !354
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !355, metadata !DIExpression()), !dbg !356
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !357
  %1 = bitcast i8* %call to i32*, !dbg !358
  store i32* %1, i32** %buffer, align 8, !dbg !356
  %2 = load i32*, i32** %buffer, align 8, !dbg !359
  %cmp = icmp eq i32* %2, null, !dbg !361
  br i1 %cmp, label %if.then1, label %if.end, !dbg !362

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !363
  unreachable, !dbg !363

if.end:                                           ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !365
  br label %for.cond, !dbg !367

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !368
  %cmp2 = icmp slt i32 %3, 10, !dbg !370
  br i1 %cmp2, label %for.body, label %for.end, !dbg !371

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !372
  %5 = load i32, i32* %i, align 4, !dbg !374
  %idxprom = sext i32 %5 to i64, !dbg !372
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !372
  store i32 0, i32* %arrayidx, align 4, !dbg !375
  br label %for.inc, !dbg !376

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !377
  %inc = add nsw i32 %6, 1, !dbg !377
  store i32 %inc, i32* %i, align 4, !dbg !377
  br label %for.cond, !dbg !378, !llvm.loop !379

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !381
  %cmp3 = icmp sge i32 %7, 0, !dbg !383
  br i1 %cmp3, label %land.lhs.true, label %if.else16, !dbg !384

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !385
  %cmp4 = icmp slt i32 %8, 10, !dbg !386
  br i1 %cmp4, label %if.then5, label %if.else16, !dbg !387

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !388
  %10 = load i32, i32* %data.addr, align 4, !dbg !390
  %idxprom6 = sext i32 %10 to i64, !dbg !388
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !388
  store i32 1, i32* %arrayidx7, align 4, !dbg !391
  store i32 0, i32* %i, align 4, !dbg !392
  br label %for.cond8, !dbg !394

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !395
  %cmp9 = icmp slt i32 %11, 10, !dbg !397
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !398

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !399
  %13 = load i32, i32* %i, align 4, !dbg !401
  %idxprom11 = sext i32 %13 to i64, !dbg !399
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !399
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !399
  call void @printIntLine(i32 %14), !dbg !402
  br label %for.inc13, !dbg !403

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !404
  %inc14 = add nsw i32 %15, 1, !dbg !404
  store i32 %inc14, i32* %i, align 4, !dbg !404
  br label %for.cond8, !dbg !405, !llvm.loop !406

for.end15:                                        ; preds = %for.cond8
  br label %if.end17, !dbg !408

if.else16:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !409
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !411
  %17 = bitcast i32* %16 to i8*, !dbg !411
  call void @free(i8* %17) #8, !dbg !412
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then
  ret void, !dbg !413
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !414 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !415, metadata !DIExpression()), !dbg !416
  store i32 -1, i32* %data, align 4, !dbg !417
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !418, metadata !DIExpression()), !dbg !420
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !421, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !423, metadata !DIExpression()), !dbg !424
  store i32 -1, i32* %connectSocket, align 4, !dbg !424
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !425, metadata !DIExpression()), !dbg !426
  br label %do.body, !dbg !427

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !428
  store i32 %call, i32* %connectSocket, align 4, !dbg !430
  %0 = load i32, i32* %connectSocket, align 4, !dbg !431
  %cmp = icmp eq i32 %0, -1, !dbg !433
  br i1 %cmp, label %if.then, label %if.end, !dbg !434

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !435

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !437
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !437
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !438
  store i16 2, i16* %sin_family, align 4, !dbg !439
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !440
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !441
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !442
  store i32 %call1, i32* %s_addr, align 4, !dbg !443
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !444
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !445
  store i16 %call2, i16* %sin_port, align 2, !dbg !446
  %2 = load i32, i32* %connectSocket, align 4, !dbg !447
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !449
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !450
  %cmp4 = icmp eq i32 %call3, -1, !dbg !451
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !452

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !453

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !455
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !456
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !457
  %conv = trunc i64 %call7 to i32, !dbg !457
  store i32 %conv, i32* %recvResult, align 4, !dbg !458
  %5 = load i32, i32* %recvResult, align 4, !dbg !459
  %cmp8 = icmp eq i32 %5, -1, !dbg !461
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !462

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !463
  %cmp10 = icmp eq i32 %6, 0, !dbg !464
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !465

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !466

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !468
  %idxprom = sext i32 %7 to i64, !dbg !469
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !469
  store i8 0, i8* %arrayidx, align 1, !dbg !470
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !471
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !472
  store i32 %call15, i32* %data, align 4, !dbg !473
  br label %do.end, !dbg !474

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !475
  %cmp16 = icmp ne i32 %8, -1, !dbg !477
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !478

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !479
  %call19 = call i32 @close(i32 %9), !dbg !481
  br label %if.end20, !dbg !482

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !483
  %10 = load i32, i32* %data, align 4, !dbg !484
  call void @goodB2G2Sink(i32 %10), !dbg !485
  ret void, !dbg !486
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !487 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !488, metadata !DIExpression()), !dbg !489
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !490
  %tobool = icmp ne i32 %0, 0, !dbg !490
  br i1 %tobool, label %if.then, label %if.end17, !dbg !492

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !493, metadata !DIExpression()), !dbg !496
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !497, metadata !DIExpression()), !dbg !498
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !499
  %1 = bitcast i8* %call to i32*, !dbg !500
  store i32* %1, i32** %buffer, align 8, !dbg !498
  %2 = load i32*, i32** %buffer, align 8, !dbg !501
  %cmp = icmp eq i32* %2, null, !dbg !503
  br i1 %cmp, label %if.then1, label %if.end, !dbg !504

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #11, !dbg !505
  unreachable, !dbg !505

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !507
  br label %for.cond, !dbg !509

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !510
  %cmp2 = icmp slt i32 %3, 10, !dbg !512
  br i1 %cmp2, label %for.body, label %for.end, !dbg !513

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !514
  %5 = load i32, i32* %i, align 4, !dbg !516
  %idxprom = sext i32 %5 to i64, !dbg !514
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !514
  store i32 0, i32* %arrayidx, align 4, !dbg !517
  br label %for.inc, !dbg !518

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !519
  %inc = add nsw i32 %6, 1, !dbg !519
  store i32 %inc, i32* %i, align 4, !dbg !519
  br label %for.cond, !dbg !520, !llvm.loop !521

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !523
  %cmp3 = icmp sge i32 %7, 0, !dbg !525
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !526

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !527
  %cmp4 = icmp slt i32 %8, 10, !dbg !528
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !529

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !530
  %10 = load i32, i32* %data.addr, align 4, !dbg !532
  %idxprom6 = sext i32 %10 to i64, !dbg !530
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !530
  store i32 1, i32* %arrayidx7, align 4, !dbg !533
  store i32 0, i32* %i, align 4, !dbg !534
  br label %for.cond8, !dbg !536

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !537
  %cmp9 = icmp slt i32 %11, 10, !dbg !539
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !540

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !541
  %13 = load i32, i32* %i, align 4, !dbg !543
  %idxprom11 = sext i32 %13 to i64, !dbg !541
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !541
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !541
  call void @printIntLine(i32 %14), !dbg !544
  br label %for.inc13, !dbg !545

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !546
  %inc14 = add nsw i32 %15, 1, !dbg !546
  store i32 %inc14, i32* %i, align 4, !dbg !546
  br label %for.cond8, !dbg !547, !llvm.loop !548

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !550

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !551
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !553
  %17 = bitcast i32* %16 to i8*, !dbg !553
  call void @free(i8* %17) #8, !dbg !554
  br label %if.end17, !dbg !555

if.end17:                                         ; preds = %if.end16, %entry
  ret void, !dbg !556
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !557 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !558, metadata !DIExpression()), !dbg !559
  store i32 -1, i32* %data, align 4, !dbg !560
  store i32 7, i32* %data, align 4, !dbg !561
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !562
  %0 = load i32, i32* %data, align 4, !dbg !563
  call void @goodG2BSink(i32 %0), !dbg !564
  ret void, !dbg !565
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !566 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !567, metadata !DIExpression()), !dbg !568
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !569
  %tobool = icmp ne i32 %0, 0, !dbg !569
  br i1 %tobool, label %if.then, label %if.end16, !dbg !571

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !572, metadata !DIExpression()), !dbg !575
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !576, metadata !DIExpression()), !dbg !577
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !578
  %1 = bitcast i8* %call to i32*, !dbg !579
  store i32* %1, i32** %buffer, align 8, !dbg !577
  %2 = load i32*, i32** %buffer, align 8, !dbg !580
  %cmp = icmp eq i32* %2, null, !dbg !582
  br i1 %cmp, label %if.then1, label %if.end, !dbg !583

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #11, !dbg !584
  unreachable, !dbg !584

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !586
  br label %for.cond, !dbg !588

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !589
  %cmp2 = icmp slt i32 %3, 10, !dbg !591
  br i1 %cmp2, label %for.body, label %for.end, !dbg !592

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !593
  %5 = load i32, i32* %i, align 4, !dbg !595
  %idxprom = sext i32 %5 to i64, !dbg !593
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !593
  store i32 0, i32* %arrayidx, align 4, !dbg !596
  br label %for.inc, !dbg !597

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !598
  %inc = add nsw i32 %6, 1, !dbg !598
  store i32 %inc, i32* %i, align 4, !dbg !598
  br label %for.cond, !dbg !599, !llvm.loop !600

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !602
  %cmp3 = icmp sge i32 %7, 0, !dbg !604
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !605

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !606
  %9 = load i32, i32* %data.addr, align 4, !dbg !608
  %idxprom5 = sext i32 %9 to i64, !dbg !606
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !606
  store i32 1, i32* %arrayidx6, align 4, !dbg !609
  store i32 0, i32* %i, align 4, !dbg !610
  br label %for.cond7, !dbg !612

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !613
  %cmp8 = icmp slt i32 %10, 10, !dbg !615
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !616

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !617
  %12 = load i32, i32* %i, align 4, !dbg !619
  %idxprom10 = sext i32 %12 to i64, !dbg !617
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !617
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !617
  call void @printIntLine(i32 %13), !dbg !620
  br label %for.inc12, !dbg !621

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !622
  %inc13 = add nsw i32 %14, 1, !dbg !622
  store i32 %inc13, i32* %i, align 4, !dbg !622
  br label %for.cond7, !dbg !623, !llvm.loop !624

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !626

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !627
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !629
  %16 = bitcast i32* %15 to i8*, !dbg !629
  call void @free(i8* %16) #8, !dbg !630
  br label %if.end16, !dbg !631

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !632
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!72, !73, !74, !75, !76}
!llvm.ident = !{!77}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !67, line: 45, type: !62, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !64, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_21.c", directory: "/root/SSE-Assessment")
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
!47 = !{!48, !7, !61, !63}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !50, line: 175, size: 128, elements: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!51 = !{!52, !56}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !49, file: !50, line: 177, baseType: !53, size: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !54, line: 28, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!55 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !49, file: !50, line: 178, baseType: !57, size: 112, offset: 16)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 112, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 14)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!64 = !{!0, !65, !68, !70}
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !67, line: 150, type: !62, isLocal: true, isDefinition: true)
!67 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_21.c", directory: "/root/SSE-Assessment")
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !67, line: 151, type: !62, isLocal: true, isDefinition: true)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !67, line: 152, type: !62, isLocal: true, isDefinition: true)
!72 = !{i32 7, !"Dwarf Version", i32 4}
!73 = !{i32 2, !"Debug Info Version", i32 3}
!74 = !{i32 1, !"wchar_size", i32 4}
!75 = !{i32 7, !"uwtable", i32 1}
!76 = !{i32 7, !"frame-pointer", i32 2}
!77 = !{!"clang version 13.0.0"}
!78 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_21_bad", scope: !67, file: !67, line: 80, type: !79, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !81)
!79 = !DISubroutineType(types: !80)
!80 = !{null}
!81 = !{}
!82 = !DILocalVariable(name: "data", scope: !78, file: !67, line: 82, type: !62)
!83 = !DILocation(line: 82, column: 9, scope: !78)
!84 = !DILocation(line: 84, column: 10, scope: !78)
!85 = !DILocalVariable(name: "recvResult", scope: !86, file: !67, line: 90, type: !62)
!86 = distinct !DILexicalBlock(scope: !78, file: !67, line: 85, column: 5)
!87 = !DILocation(line: 90, column: 13, scope: !86)
!88 = !DILocalVariable(name: "service", scope: !86, file: !67, line: 91, type: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 237, size: 128, elements: !90)
!90 = !{!91, !92, !98, !105}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !89, file: !19, line: 239, baseType: !53, size: 16)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !89, file: !19, line: 240, baseType: !93, size: 16, offset: 16)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !95, line: 25, baseType: !96)
!95 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !97, line: 39, baseType: !55)
!97 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !89, file: !19, line: 241, baseType: !99, size: 32, offset: 32)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !100)
!100 = !{!101}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !99, file: !19, line: 33, baseType: !102, size: 32)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !95, line: 26, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !97, line: 41, baseType: !7)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !89, file: !19, line: 244, baseType: !106, size: 64, offset: 64)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 64, elements: !108)
!107 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!108 = !{!109}
!109 = !DISubrange(count: 8)
!110 = !DILocation(line: 91, column: 28, scope: !86)
!111 = !DILocalVariable(name: "connectSocket", scope: !86, file: !67, line: 92, type: !62)
!112 = !DILocation(line: 92, column: 16, scope: !86)
!113 = !DILocalVariable(name: "inputBuffer", scope: !86, file: !67, line: 93, type: !57)
!114 = !DILocation(line: 93, column: 14, scope: !86)
!115 = !DILocation(line: 94, column: 9, scope: !86)
!116 = !DILocation(line: 104, column: 29, scope: !117)
!117 = distinct !DILexicalBlock(scope: !86, file: !67, line: 95, column: 9)
!118 = !DILocation(line: 104, column: 27, scope: !117)
!119 = !DILocation(line: 105, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !67, line: 105, column: 17)
!121 = !DILocation(line: 105, column: 31, scope: !120)
!122 = !DILocation(line: 105, column: 17, scope: !117)
!123 = !DILocation(line: 107, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !67, line: 106, column: 13)
!125 = !DILocation(line: 109, column: 13, scope: !117)
!126 = !DILocation(line: 110, column: 21, scope: !117)
!127 = !DILocation(line: 110, column: 32, scope: !117)
!128 = !DILocation(line: 111, column: 39, scope: !117)
!129 = !DILocation(line: 111, column: 21, scope: !117)
!130 = !DILocation(line: 111, column: 30, scope: !117)
!131 = !DILocation(line: 111, column: 37, scope: !117)
!132 = !DILocation(line: 112, column: 32, scope: !117)
!133 = !DILocation(line: 112, column: 21, scope: !117)
!134 = !DILocation(line: 112, column: 30, scope: !117)
!135 = !DILocation(line: 113, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !117, file: !67, line: 113, column: 17)
!137 = !DILocation(line: 113, column: 40, scope: !136)
!138 = !DILocation(line: 113, column: 17, scope: !136)
!139 = !DILocation(line: 113, column: 85, scope: !136)
!140 = !DILocation(line: 113, column: 17, scope: !117)
!141 = !DILocation(line: 115, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !67, line: 114, column: 13)
!143 = !DILocation(line: 119, column: 31, scope: !117)
!144 = !DILocation(line: 119, column: 46, scope: !117)
!145 = !DILocation(line: 119, column: 26, scope: !117)
!146 = !DILocation(line: 119, column: 24, scope: !117)
!147 = !DILocation(line: 120, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !117, file: !67, line: 120, column: 17)
!149 = !DILocation(line: 120, column: 28, scope: !148)
!150 = !DILocation(line: 120, column: 44, scope: !148)
!151 = !DILocation(line: 120, column: 47, scope: !148)
!152 = !DILocation(line: 120, column: 58, scope: !148)
!153 = !DILocation(line: 120, column: 17, scope: !117)
!154 = !DILocation(line: 122, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !148, file: !67, line: 121, column: 13)
!156 = !DILocation(line: 125, column: 25, scope: !117)
!157 = !DILocation(line: 125, column: 13, scope: !117)
!158 = !DILocation(line: 125, column: 37, scope: !117)
!159 = !DILocation(line: 127, column: 25, scope: !117)
!160 = !DILocation(line: 127, column: 20, scope: !117)
!161 = !DILocation(line: 127, column: 18, scope: !117)
!162 = !DILocation(line: 128, column: 9, scope: !117)
!163 = !DILocation(line: 130, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !86, file: !67, line: 130, column: 13)
!165 = !DILocation(line: 130, column: 27, scope: !164)
!166 = !DILocation(line: 130, column: 13, scope: !86)
!167 = !DILocation(line: 132, column: 26, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !67, line: 131, column: 9)
!169 = !DILocation(line: 132, column: 13, scope: !168)
!170 = !DILocation(line: 133, column: 9, scope: !168)
!171 = !DILocation(line: 141, column: 15, scope: !78)
!172 = !DILocation(line: 142, column: 13, scope: !78)
!173 = !DILocation(line: 142, column: 5, scope: !78)
!174 = !DILocation(line: 143, column: 1, scope: !78)
!175 = distinct !DISubprogram(name: "badSink", scope: !67, file: !67, line: 47, type: !176, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !81)
!176 = !DISubroutineType(types: !177)
!177 = !{null, !62}
!178 = !DILocalVariable(name: "data", arg: 1, scope: !175, file: !67, line: 47, type: !62)
!179 = !DILocation(line: 47, column: 25, scope: !175)
!180 = !DILocation(line: 49, column: 8, scope: !181)
!181 = distinct !DILexicalBlock(scope: !175, file: !67, line: 49, column: 8)
!182 = !DILocation(line: 49, column: 8, scope: !175)
!183 = !DILocalVariable(name: "i", scope: !184, file: !67, line: 52, type: !62)
!184 = distinct !DILexicalBlock(scope: !185, file: !67, line: 51, column: 9)
!185 = distinct !DILexicalBlock(scope: !181, file: !67, line: 50, column: 5)
!186 = !DILocation(line: 52, column: 17, scope: !184)
!187 = !DILocalVariable(name: "buffer", scope: !184, file: !67, line: 53, type: !61)
!188 = !DILocation(line: 53, column: 19, scope: !184)
!189 = !DILocation(line: 53, column: 35, scope: !184)
!190 = !DILocation(line: 53, column: 28, scope: !184)
!191 = !DILocation(line: 54, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !184, file: !67, line: 54, column: 17)
!193 = !DILocation(line: 54, column: 24, scope: !192)
!194 = !DILocation(line: 54, column: 17, scope: !184)
!195 = !DILocation(line: 54, column: 34, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !67, line: 54, column: 33)
!197 = !DILocation(line: 56, column: 20, scope: !198)
!198 = distinct !DILexicalBlock(scope: !184, file: !67, line: 56, column: 13)
!199 = !DILocation(line: 56, column: 18, scope: !198)
!200 = !DILocation(line: 56, column: 25, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !67, line: 56, column: 13)
!202 = !DILocation(line: 56, column: 27, scope: !201)
!203 = !DILocation(line: 56, column: 13, scope: !198)
!204 = !DILocation(line: 58, column: 17, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !67, line: 57, column: 13)
!206 = !DILocation(line: 58, column: 24, scope: !205)
!207 = !DILocation(line: 58, column: 27, scope: !205)
!208 = !DILocation(line: 59, column: 13, scope: !205)
!209 = !DILocation(line: 56, column: 34, scope: !201)
!210 = !DILocation(line: 56, column: 13, scope: !201)
!211 = distinct !{!211, !203, !212, !213}
!212 = !DILocation(line: 59, column: 13, scope: !198)
!213 = !{!"llvm.loop.mustprogress"}
!214 = !DILocation(line: 62, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !184, file: !67, line: 62, column: 17)
!216 = !DILocation(line: 62, column: 22, scope: !215)
!217 = !DILocation(line: 62, column: 17, scope: !184)
!218 = !DILocation(line: 64, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !67, line: 63, column: 13)
!220 = !DILocation(line: 64, column: 24, scope: !219)
!221 = !DILocation(line: 64, column: 30, scope: !219)
!222 = !DILocation(line: 66, column: 23, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !67, line: 66, column: 17)
!224 = !DILocation(line: 66, column: 21, scope: !223)
!225 = !DILocation(line: 66, column: 28, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !67, line: 66, column: 17)
!227 = !DILocation(line: 66, column: 30, scope: !226)
!228 = !DILocation(line: 66, column: 17, scope: !223)
!229 = !DILocation(line: 68, column: 34, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !67, line: 67, column: 17)
!231 = !DILocation(line: 68, column: 41, scope: !230)
!232 = !DILocation(line: 68, column: 21, scope: !230)
!233 = !DILocation(line: 69, column: 17, scope: !230)
!234 = !DILocation(line: 66, column: 37, scope: !226)
!235 = !DILocation(line: 66, column: 17, scope: !226)
!236 = distinct !{!236, !228, !237, !213}
!237 = !DILocation(line: 69, column: 17, scope: !223)
!238 = !DILocation(line: 70, column: 13, scope: !219)
!239 = !DILocation(line: 73, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !215, file: !67, line: 72, column: 13)
!241 = !DILocation(line: 75, column: 18, scope: !184)
!242 = !DILocation(line: 75, column: 13, scope: !184)
!243 = !DILocation(line: 77, column: 5, scope: !185)
!244 = !DILocation(line: 78, column: 1, scope: !175)
!245 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_21_good", scope: !67, file: !67, line: 401, type: !79, scopeLine: 402, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !81)
!246 = !DILocation(line: 403, column: 5, scope: !245)
!247 = !DILocation(line: 404, column: 5, scope: !245)
!248 = !DILocation(line: 405, column: 5, scope: !245)
!249 = !DILocation(line: 406, column: 1, scope: !245)
!250 = distinct !DISubprogram(name: "main", scope: !67, file: !67, line: 417, type: !251, scopeLine: 418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !81)
!251 = !DISubroutineType(types: !252)
!252 = !{!62, !62, !253}
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!255 = !DILocalVariable(name: "argc", arg: 1, scope: !250, file: !67, line: 417, type: !62)
!256 = !DILocation(line: 417, column: 14, scope: !250)
!257 = !DILocalVariable(name: "argv", arg: 2, scope: !250, file: !67, line: 417, type: !253)
!258 = !DILocation(line: 417, column: 27, scope: !250)
!259 = !DILocation(line: 420, column: 22, scope: !250)
!260 = !DILocation(line: 420, column: 12, scope: !250)
!261 = !DILocation(line: 420, column: 5, scope: !250)
!262 = !DILocation(line: 422, column: 5, scope: !250)
!263 = !DILocation(line: 423, column: 5, scope: !250)
!264 = !DILocation(line: 424, column: 5, scope: !250)
!265 = !DILocation(line: 427, column: 5, scope: !250)
!266 = !DILocation(line: 428, column: 5, scope: !250)
!267 = !DILocation(line: 429, column: 5, scope: !250)
!268 = !DILocation(line: 431, column: 5, scope: !250)
!269 = distinct !DISubprogram(name: "goodB2G1", scope: !67, file: !67, line: 192, type: !79, scopeLine: 193, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !81)
!270 = !DILocalVariable(name: "data", scope: !269, file: !67, line: 194, type: !62)
!271 = !DILocation(line: 194, column: 9, scope: !269)
!272 = !DILocation(line: 196, column: 10, scope: !269)
!273 = !DILocalVariable(name: "recvResult", scope: !274, file: !67, line: 202, type: !62)
!274 = distinct !DILexicalBlock(scope: !269, file: !67, line: 197, column: 5)
!275 = !DILocation(line: 202, column: 13, scope: !274)
!276 = !DILocalVariable(name: "service", scope: !274, file: !67, line: 203, type: !89)
!277 = !DILocation(line: 203, column: 28, scope: !274)
!278 = !DILocalVariable(name: "connectSocket", scope: !274, file: !67, line: 204, type: !62)
!279 = !DILocation(line: 204, column: 16, scope: !274)
!280 = !DILocalVariable(name: "inputBuffer", scope: !274, file: !67, line: 205, type: !57)
!281 = !DILocation(line: 205, column: 14, scope: !274)
!282 = !DILocation(line: 206, column: 9, scope: !274)
!283 = !DILocation(line: 216, column: 29, scope: !284)
!284 = distinct !DILexicalBlock(scope: !274, file: !67, line: 207, column: 9)
!285 = !DILocation(line: 216, column: 27, scope: !284)
!286 = !DILocation(line: 217, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !284, file: !67, line: 217, column: 17)
!288 = !DILocation(line: 217, column: 31, scope: !287)
!289 = !DILocation(line: 217, column: 17, scope: !284)
!290 = !DILocation(line: 219, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !67, line: 218, column: 13)
!292 = !DILocation(line: 221, column: 13, scope: !284)
!293 = !DILocation(line: 222, column: 21, scope: !284)
!294 = !DILocation(line: 222, column: 32, scope: !284)
!295 = !DILocation(line: 223, column: 39, scope: !284)
!296 = !DILocation(line: 223, column: 21, scope: !284)
!297 = !DILocation(line: 223, column: 30, scope: !284)
!298 = !DILocation(line: 223, column: 37, scope: !284)
!299 = !DILocation(line: 224, column: 32, scope: !284)
!300 = !DILocation(line: 224, column: 21, scope: !284)
!301 = !DILocation(line: 224, column: 30, scope: !284)
!302 = !DILocation(line: 225, column: 25, scope: !303)
!303 = distinct !DILexicalBlock(scope: !284, file: !67, line: 225, column: 17)
!304 = !DILocation(line: 225, column: 40, scope: !303)
!305 = !DILocation(line: 225, column: 17, scope: !303)
!306 = !DILocation(line: 225, column: 85, scope: !303)
!307 = !DILocation(line: 225, column: 17, scope: !284)
!308 = !DILocation(line: 227, column: 17, scope: !309)
!309 = distinct !DILexicalBlock(scope: !303, file: !67, line: 226, column: 13)
!310 = !DILocation(line: 231, column: 31, scope: !284)
!311 = !DILocation(line: 231, column: 46, scope: !284)
!312 = !DILocation(line: 231, column: 26, scope: !284)
!313 = !DILocation(line: 231, column: 24, scope: !284)
!314 = !DILocation(line: 232, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !284, file: !67, line: 232, column: 17)
!316 = !DILocation(line: 232, column: 28, scope: !315)
!317 = !DILocation(line: 232, column: 44, scope: !315)
!318 = !DILocation(line: 232, column: 47, scope: !315)
!319 = !DILocation(line: 232, column: 58, scope: !315)
!320 = !DILocation(line: 232, column: 17, scope: !284)
!321 = !DILocation(line: 234, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !315, file: !67, line: 233, column: 13)
!323 = !DILocation(line: 237, column: 25, scope: !284)
!324 = !DILocation(line: 237, column: 13, scope: !284)
!325 = !DILocation(line: 237, column: 37, scope: !284)
!326 = !DILocation(line: 239, column: 25, scope: !284)
!327 = !DILocation(line: 239, column: 20, scope: !284)
!328 = !DILocation(line: 239, column: 18, scope: !284)
!329 = !DILocation(line: 240, column: 9, scope: !284)
!330 = !DILocation(line: 242, column: 13, scope: !331)
!331 = distinct !DILexicalBlock(scope: !274, file: !67, line: 242, column: 13)
!332 = !DILocation(line: 242, column: 27, scope: !331)
!333 = !DILocation(line: 242, column: 13, scope: !274)
!334 = !DILocation(line: 244, column: 26, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !67, line: 243, column: 9)
!336 = !DILocation(line: 244, column: 13, scope: !335)
!337 = !DILocation(line: 245, column: 9, scope: !335)
!338 = !DILocation(line: 253, column: 20, scope: !269)
!339 = !DILocation(line: 254, column: 18, scope: !269)
!340 = !DILocation(line: 254, column: 5, scope: !269)
!341 = !DILocation(line: 255, column: 1, scope: !269)
!342 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !67, file: !67, line: 155, type: !176, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !81)
!343 = !DILocalVariable(name: "data", arg: 1, scope: !342, file: !67, line: 155, type: !62)
!344 = !DILocation(line: 155, column: 30, scope: !342)
!345 = !DILocation(line: 157, column: 8, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !67, line: 157, column: 8)
!347 = !DILocation(line: 157, column: 8, scope: !342)
!348 = !DILocation(line: 160, column: 9, scope: !349)
!349 = distinct !DILexicalBlock(scope: !346, file: !67, line: 158, column: 5)
!350 = !DILocation(line: 161, column: 5, scope: !349)
!351 = !DILocalVariable(name: "i", scope: !352, file: !67, line: 165, type: !62)
!352 = distinct !DILexicalBlock(scope: !353, file: !67, line: 164, column: 9)
!353 = distinct !DILexicalBlock(scope: !346, file: !67, line: 163, column: 5)
!354 = !DILocation(line: 165, column: 17, scope: !352)
!355 = !DILocalVariable(name: "buffer", scope: !352, file: !67, line: 166, type: !61)
!356 = !DILocation(line: 166, column: 19, scope: !352)
!357 = !DILocation(line: 166, column: 35, scope: !352)
!358 = !DILocation(line: 166, column: 28, scope: !352)
!359 = !DILocation(line: 167, column: 17, scope: !360)
!360 = distinct !DILexicalBlock(scope: !352, file: !67, line: 167, column: 17)
!361 = !DILocation(line: 167, column: 24, scope: !360)
!362 = !DILocation(line: 167, column: 17, scope: !352)
!363 = !DILocation(line: 167, column: 34, scope: !364)
!364 = distinct !DILexicalBlock(scope: !360, file: !67, line: 167, column: 33)
!365 = !DILocation(line: 169, column: 20, scope: !366)
!366 = distinct !DILexicalBlock(scope: !352, file: !67, line: 169, column: 13)
!367 = !DILocation(line: 169, column: 18, scope: !366)
!368 = !DILocation(line: 169, column: 25, scope: !369)
!369 = distinct !DILexicalBlock(scope: !366, file: !67, line: 169, column: 13)
!370 = !DILocation(line: 169, column: 27, scope: !369)
!371 = !DILocation(line: 169, column: 13, scope: !366)
!372 = !DILocation(line: 171, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !67, line: 170, column: 13)
!374 = !DILocation(line: 171, column: 24, scope: !373)
!375 = !DILocation(line: 171, column: 27, scope: !373)
!376 = !DILocation(line: 172, column: 13, scope: !373)
!377 = !DILocation(line: 169, column: 34, scope: !369)
!378 = !DILocation(line: 169, column: 13, scope: !369)
!379 = distinct !{!379, !371, !380, !213}
!380 = !DILocation(line: 172, column: 13, scope: !366)
!381 = !DILocation(line: 174, column: 17, scope: !382)
!382 = distinct !DILexicalBlock(scope: !352, file: !67, line: 174, column: 17)
!383 = !DILocation(line: 174, column: 22, scope: !382)
!384 = !DILocation(line: 174, column: 27, scope: !382)
!385 = !DILocation(line: 174, column: 30, scope: !382)
!386 = !DILocation(line: 174, column: 35, scope: !382)
!387 = !DILocation(line: 174, column: 17, scope: !352)
!388 = !DILocation(line: 176, column: 17, scope: !389)
!389 = distinct !DILexicalBlock(scope: !382, file: !67, line: 175, column: 13)
!390 = !DILocation(line: 176, column: 24, scope: !389)
!391 = !DILocation(line: 176, column: 30, scope: !389)
!392 = !DILocation(line: 178, column: 23, scope: !393)
!393 = distinct !DILexicalBlock(scope: !389, file: !67, line: 178, column: 17)
!394 = !DILocation(line: 178, column: 21, scope: !393)
!395 = !DILocation(line: 178, column: 28, scope: !396)
!396 = distinct !DILexicalBlock(scope: !393, file: !67, line: 178, column: 17)
!397 = !DILocation(line: 178, column: 30, scope: !396)
!398 = !DILocation(line: 178, column: 17, scope: !393)
!399 = !DILocation(line: 180, column: 34, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !67, line: 179, column: 17)
!401 = !DILocation(line: 180, column: 41, scope: !400)
!402 = !DILocation(line: 180, column: 21, scope: !400)
!403 = !DILocation(line: 181, column: 17, scope: !400)
!404 = !DILocation(line: 178, column: 37, scope: !396)
!405 = !DILocation(line: 178, column: 17, scope: !396)
!406 = distinct !{!406, !398, !407, !213}
!407 = !DILocation(line: 181, column: 17, scope: !393)
!408 = !DILocation(line: 182, column: 13, scope: !389)
!409 = !DILocation(line: 185, column: 17, scope: !410)
!410 = distinct !DILexicalBlock(scope: !382, file: !67, line: 184, column: 13)
!411 = !DILocation(line: 187, column: 18, scope: !352)
!412 = !DILocation(line: 187, column: 13, scope: !352)
!413 = !DILocation(line: 190, column: 1, scope: !342)
!414 = distinct !DISubprogram(name: "goodB2G2", scope: !67, file: !67, line: 290, type: !79, scopeLine: 291, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !81)
!415 = !DILocalVariable(name: "data", scope: !414, file: !67, line: 292, type: !62)
!416 = !DILocation(line: 292, column: 9, scope: !414)
!417 = !DILocation(line: 294, column: 10, scope: !414)
!418 = !DILocalVariable(name: "recvResult", scope: !419, file: !67, line: 300, type: !62)
!419 = distinct !DILexicalBlock(scope: !414, file: !67, line: 295, column: 5)
!420 = !DILocation(line: 300, column: 13, scope: !419)
!421 = !DILocalVariable(name: "service", scope: !419, file: !67, line: 301, type: !89)
!422 = !DILocation(line: 301, column: 28, scope: !419)
!423 = !DILocalVariable(name: "connectSocket", scope: !419, file: !67, line: 302, type: !62)
!424 = !DILocation(line: 302, column: 16, scope: !419)
!425 = !DILocalVariable(name: "inputBuffer", scope: !419, file: !67, line: 303, type: !57)
!426 = !DILocation(line: 303, column: 14, scope: !419)
!427 = !DILocation(line: 304, column: 9, scope: !419)
!428 = !DILocation(line: 314, column: 29, scope: !429)
!429 = distinct !DILexicalBlock(scope: !419, file: !67, line: 305, column: 9)
!430 = !DILocation(line: 314, column: 27, scope: !429)
!431 = !DILocation(line: 315, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !429, file: !67, line: 315, column: 17)
!433 = !DILocation(line: 315, column: 31, scope: !432)
!434 = !DILocation(line: 315, column: 17, scope: !429)
!435 = !DILocation(line: 317, column: 17, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !67, line: 316, column: 13)
!437 = !DILocation(line: 319, column: 13, scope: !429)
!438 = !DILocation(line: 320, column: 21, scope: !429)
!439 = !DILocation(line: 320, column: 32, scope: !429)
!440 = !DILocation(line: 321, column: 39, scope: !429)
!441 = !DILocation(line: 321, column: 21, scope: !429)
!442 = !DILocation(line: 321, column: 30, scope: !429)
!443 = !DILocation(line: 321, column: 37, scope: !429)
!444 = !DILocation(line: 322, column: 32, scope: !429)
!445 = !DILocation(line: 322, column: 21, scope: !429)
!446 = !DILocation(line: 322, column: 30, scope: !429)
!447 = !DILocation(line: 323, column: 25, scope: !448)
!448 = distinct !DILexicalBlock(scope: !429, file: !67, line: 323, column: 17)
!449 = !DILocation(line: 323, column: 40, scope: !448)
!450 = !DILocation(line: 323, column: 17, scope: !448)
!451 = !DILocation(line: 323, column: 85, scope: !448)
!452 = !DILocation(line: 323, column: 17, scope: !429)
!453 = !DILocation(line: 325, column: 17, scope: !454)
!454 = distinct !DILexicalBlock(scope: !448, file: !67, line: 324, column: 13)
!455 = !DILocation(line: 329, column: 31, scope: !429)
!456 = !DILocation(line: 329, column: 46, scope: !429)
!457 = !DILocation(line: 329, column: 26, scope: !429)
!458 = !DILocation(line: 329, column: 24, scope: !429)
!459 = !DILocation(line: 330, column: 17, scope: !460)
!460 = distinct !DILexicalBlock(scope: !429, file: !67, line: 330, column: 17)
!461 = !DILocation(line: 330, column: 28, scope: !460)
!462 = !DILocation(line: 330, column: 44, scope: !460)
!463 = !DILocation(line: 330, column: 47, scope: !460)
!464 = !DILocation(line: 330, column: 58, scope: !460)
!465 = !DILocation(line: 330, column: 17, scope: !429)
!466 = !DILocation(line: 332, column: 17, scope: !467)
!467 = distinct !DILexicalBlock(scope: !460, file: !67, line: 331, column: 13)
!468 = !DILocation(line: 335, column: 25, scope: !429)
!469 = !DILocation(line: 335, column: 13, scope: !429)
!470 = !DILocation(line: 335, column: 37, scope: !429)
!471 = !DILocation(line: 337, column: 25, scope: !429)
!472 = !DILocation(line: 337, column: 20, scope: !429)
!473 = !DILocation(line: 337, column: 18, scope: !429)
!474 = !DILocation(line: 338, column: 9, scope: !429)
!475 = !DILocation(line: 340, column: 13, scope: !476)
!476 = distinct !DILexicalBlock(scope: !419, file: !67, line: 340, column: 13)
!477 = !DILocation(line: 340, column: 27, scope: !476)
!478 = !DILocation(line: 340, column: 13, scope: !419)
!479 = !DILocation(line: 342, column: 26, scope: !480)
!480 = distinct !DILexicalBlock(scope: !476, file: !67, line: 341, column: 9)
!481 = !DILocation(line: 342, column: 13, scope: !480)
!482 = !DILocation(line: 343, column: 9, scope: !480)
!483 = !DILocation(line: 351, column: 20, scope: !414)
!484 = !DILocation(line: 352, column: 18, scope: !414)
!485 = !DILocation(line: 352, column: 5, scope: !414)
!486 = !DILocation(line: 353, column: 1, scope: !414)
!487 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !67, file: !67, line: 258, type: !176, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !81)
!488 = !DILocalVariable(name: "data", arg: 1, scope: !487, file: !67, line: 258, type: !62)
!489 = !DILocation(line: 258, column: 30, scope: !487)
!490 = !DILocation(line: 260, column: 8, scope: !491)
!491 = distinct !DILexicalBlock(scope: !487, file: !67, line: 260, column: 8)
!492 = !DILocation(line: 260, column: 8, scope: !487)
!493 = !DILocalVariable(name: "i", scope: !494, file: !67, line: 263, type: !62)
!494 = distinct !DILexicalBlock(scope: !495, file: !67, line: 262, column: 9)
!495 = distinct !DILexicalBlock(scope: !491, file: !67, line: 261, column: 5)
!496 = !DILocation(line: 263, column: 17, scope: !494)
!497 = !DILocalVariable(name: "buffer", scope: !494, file: !67, line: 264, type: !61)
!498 = !DILocation(line: 264, column: 19, scope: !494)
!499 = !DILocation(line: 264, column: 35, scope: !494)
!500 = !DILocation(line: 264, column: 28, scope: !494)
!501 = !DILocation(line: 265, column: 17, scope: !502)
!502 = distinct !DILexicalBlock(scope: !494, file: !67, line: 265, column: 17)
!503 = !DILocation(line: 265, column: 24, scope: !502)
!504 = !DILocation(line: 265, column: 17, scope: !494)
!505 = !DILocation(line: 265, column: 34, scope: !506)
!506 = distinct !DILexicalBlock(scope: !502, file: !67, line: 265, column: 33)
!507 = !DILocation(line: 267, column: 20, scope: !508)
!508 = distinct !DILexicalBlock(scope: !494, file: !67, line: 267, column: 13)
!509 = !DILocation(line: 267, column: 18, scope: !508)
!510 = !DILocation(line: 267, column: 25, scope: !511)
!511 = distinct !DILexicalBlock(scope: !508, file: !67, line: 267, column: 13)
!512 = !DILocation(line: 267, column: 27, scope: !511)
!513 = !DILocation(line: 267, column: 13, scope: !508)
!514 = !DILocation(line: 269, column: 17, scope: !515)
!515 = distinct !DILexicalBlock(scope: !511, file: !67, line: 268, column: 13)
!516 = !DILocation(line: 269, column: 24, scope: !515)
!517 = !DILocation(line: 269, column: 27, scope: !515)
!518 = !DILocation(line: 270, column: 13, scope: !515)
!519 = !DILocation(line: 267, column: 34, scope: !511)
!520 = !DILocation(line: 267, column: 13, scope: !511)
!521 = distinct !{!521, !513, !522, !213}
!522 = !DILocation(line: 270, column: 13, scope: !508)
!523 = !DILocation(line: 272, column: 17, scope: !524)
!524 = distinct !DILexicalBlock(scope: !494, file: !67, line: 272, column: 17)
!525 = !DILocation(line: 272, column: 22, scope: !524)
!526 = !DILocation(line: 272, column: 27, scope: !524)
!527 = !DILocation(line: 272, column: 30, scope: !524)
!528 = !DILocation(line: 272, column: 35, scope: !524)
!529 = !DILocation(line: 272, column: 17, scope: !494)
!530 = !DILocation(line: 274, column: 17, scope: !531)
!531 = distinct !DILexicalBlock(scope: !524, file: !67, line: 273, column: 13)
!532 = !DILocation(line: 274, column: 24, scope: !531)
!533 = !DILocation(line: 274, column: 30, scope: !531)
!534 = !DILocation(line: 276, column: 23, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !67, line: 276, column: 17)
!536 = !DILocation(line: 276, column: 21, scope: !535)
!537 = !DILocation(line: 276, column: 28, scope: !538)
!538 = distinct !DILexicalBlock(scope: !535, file: !67, line: 276, column: 17)
!539 = !DILocation(line: 276, column: 30, scope: !538)
!540 = !DILocation(line: 276, column: 17, scope: !535)
!541 = !DILocation(line: 278, column: 34, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !67, line: 277, column: 17)
!543 = !DILocation(line: 278, column: 41, scope: !542)
!544 = !DILocation(line: 278, column: 21, scope: !542)
!545 = !DILocation(line: 279, column: 17, scope: !542)
!546 = !DILocation(line: 276, column: 37, scope: !538)
!547 = !DILocation(line: 276, column: 17, scope: !538)
!548 = distinct !{!548, !540, !549, !213}
!549 = !DILocation(line: 279, column: 17, scope: !535)
!550 = !DILocation(line: 280, column: 13, scope: !531)
!551 = !DILocation(line: 283, column: 17, scope: !552)
!552 = distinct !DILexicalBlock(scope: !524, file: !67, line: 282, column: 13)
!553 = !DILocation(line: 285, column: 18, scope: !494)
!554 = !DILocation(line: 285, column: 13, scope: !494)
!555 = !DILocation(line: 287, column: 5, scope: !495)
!556 = !DILocation(line: 288, column: 1, scope: !487)
!557 = distinct !DISubprogram(name: "goodG2B", scope: !67, file: !67, line: 389, type: !79, scopeLine: 390, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !81)
!558 = !DILocalVariable(name: "data", scope: !557, file: !67, line: 391, type: !62)
!559 = !DILocation(line: 391, column: 9, scope: !557)
!560 = !DILocation(line: 393, column: 10, scope: !557)
!561 = !DILocation(line: 396, column: 10, scope: !557)
!562 = !DILocation(line: 397, column: 19, scope: !557)
!563 = !DILocation(line: 398, column: 17, scope: !557)
!564 = !DILocation(line: 398, column: 5, scope: !557)
!565 = !DILocation(line: 399, column: 1, scope: !557)
!566 = distinct !DISubprogram(name: "goodG2BSink", scope: !67, file: !67, line: 356, type: !176, scopeLine: 357, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !81)
!567 = !DILocalVariable(name: "data", arg: 1, scope: !566, file: !67, line: 356, type: !62)
!568 = !DILocation(line: 356, column: 29, scope: !566)
!569 = !DILocation(line: 358, column: 8, scope: !570)
!570 = distinct !DILexicalBlock(scope: !566, file: !67, line: 358, column: 8)
!571 = !DILocation(line: 358, column: 8, scope: !566)
!572 = !DILocalVariable(name: "i", scope: !573, file: !67, line: 361, type: !62)
!573 = distinct !DILexicalBlock(scope: !574, file: !67, line: 360, column: 9)
!574 = distinct !DILexicalBlock(scope: !570, file: !67, line: 359, column: 5)
!575 = !DILocation(line: 361, column: 17, scope: !573)
!576 = !DILocalVariable(name: "buffer", scope: !573, file: !67, line: 362, type: !61)
!577 = !DILocation(line: 362, column: 19, scope: !573)
!578 = !DILocation(line: 362, column: 35, scope: !573)
!579 = !DILocation(line: 362, column: 28, scope: !573)
!580 = !DILocation(line: 363, column: 17, scope: !581)
!581 = distinct !DILexicalBlock(scope: !573, file: !67, line: 363, column: 17)
!582 = !DILocation(line: 363, column: 24, scope: !581)
!583 = !DILocation(line: 363, column: 17, scope: !573)
!584 = !DILocation(line: 363, column: 34, scope: !585)
!585 = distinct !DILexicalBlock(scope: !581, file: !67, line: 363, column: 33)
!586 = !DILocation(line: 365, column: 20, scope: !587)
!587 = distinct !DILexicalBlock(scope: !573, file: !67, line: 365, column: 13)
!588 = !DILocation(line: 365, column: 18, scope: !587)
!589 = !DILocation(line: 365, column: 25, scope: !590)
!590 = distinct !DILexicalBlock(scope: !587, file: !67, line: 365, column: 13)
!591 = !DILocation(line: 365, column: 27, scope: !590)
!592 = !DILocation(line: 365, column: 13, scope: !587)
!593 = !DILocation(line: 367, column: 17, scope: !594)
!594 = distinct !DILexicalBlock(scope: !590, file: !67, line: 366, column: 13)
!595 = !DILocation(line: 367, column: 24, scope: !594)
!596 = !DILocation(line: 367, column: 27, scope: !594)
!597 = !DILocation(line: 368, column: 13, scope: !594)
!598 = !DILocation(line: 365, column: 34, scope: !590)
!599 = !DILocation(line: 365, column: 13, scope: !590)
!600 = distinct !{!600, !592, !601, !213}
!601 = !DILocation(line: 368, column: 13, scope: !587)
!602 = !DILocation(line: 371, column: 17, scope: !603)
!603 = distinct !DILexicalBlock(scope: !573, file: !67, line: 371, column: 17)
!604 = !DILocation(line: 371, column: 22, scope: !603)
!605 = !DILocation(line: 371, column: 17, scope: !573)
!606 = !DILocation(line: 373, column: 17, scope: !607)
!607 = distinct !DILexicalBlock(scope: !603, file: !67, line: 372, column: 13)
!608 = !DILocation(line: 373, column: 24, scope: !607)
!609 = !DILocation(line: 373, column: 30, scope: !607)
!610 = !DILocation(line: 375, column: 23, scope: !611)
!611 = distinct !DILexicalBlock(scope: !607, file: !67, line: 375, column: 17)
!612 = !DILocation(line: 375, column: 21, scope: !611)
!613 = !DILocation(line: 375, column: 28, scope: !614)
!614 = distinct !DILexicalBlock(scope: !611, file: !67, line: 375, column: 17)
!615 = !DILocation(line: 375, column: 30, scope: !614)
!616 = !DILocation(line: 375, column: 17, scope: !611)
!617 = !DILocation(line: 377, column: 34, scope: !618)
!618 = distinct !DILexicalBlock(scope: !614, file: !67, line: 376, column: 17)
!619 = !DILocation(line: 377, column: 41, scope: !618)
!620 = !DILocation(line: 377, column: 21, scope: !618)
!621 = !DILocation(line: 378, column: 17, scope: !618)
!622 = !DILocation(line: 375, column: 37, scope: !614)
!623 = !DILocation(line: 375, column: 17, scope: !614)
!624 = distinct !{!624, !616, !625, !213}
!625 = !DILocation(line: 378, column: 17, scope: !611)
!626 = !DILocation(line: 379, column: 13, scope: !607)
!627 = !DILocation(line: 382, column: 17, scope: !628)
!628 = distinct !DILexicalBlock(scope: !603, file: !67, line: 381, column: 13)
!629 = !DILocation(line: 384, column: 18, scope: !573)
!630 = !DILocation(line: 384, column: 13, scope: !573)
!631 = !DILocation(line: 386, column: 5, scope: !574)
!632 = !DILocation(line: 387, column: 1, scope: !566)
