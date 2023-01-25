; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_44_bad() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !75, metadata !DIExpression()), !dbg !79
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !81, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !84, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %connectSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  br label %do.body, !dbg !111

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !112
  store i32 %call, i32* %connectSocket, align 4, !dbg !114
  %0 = load i32, i32* %connectSocket, align 4, !dbg !115
  %cmp = icmp eq i32 %0, -1, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !119

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !121
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !122
  store i16 2, i16* %sin_family, align 4, !dbg !123
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !124
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !125
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !126
  store i32 %call1, i32* %s_addr, align 4, !dbg !127
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !128
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !129
  store i16 %call2, i16* %sin_port, align 2, !dbg !130
  %2 = load i32, i32* %connectSocket, align 4, !dbg !131
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !133
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !134
  %cmp4 = icmp eq i32 %call3, -1, !dbg !135
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !136

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !137

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !139
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !140
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !141
  %conv = trunc i64 %call7 to i32, !dbg !141
  store i32 %conv, i32* %recvResult, align 4, !dbg !142
  %5 = load i32, i32* %recvResult, align 4, !dbg !143
  %cmp8 = icmp eq i32 %5, -1, !dbg !145
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !146

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !147
  %cmp10 = icmp eq i32 %6, 0, !dbg !148
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !149

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !150

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !152
  %idxprom = sext i32 %7 to i64, !dbg !153
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !156
  store i32 %call15, i32* %data, align 4, !dbg !157
  br label %do.end, !dbg !158

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !159
  %cmp16 = icmp ne i32 %8, -1, !dbg !161
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !162

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !163
  %call19 = call i32 @close(i32 %9), !dbg !165
  br label %if.end20, !dbg !166

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !167
  %11 = load i32, i32* %data, align 4, !dbg !168
  call void %10(i32 %11), !dbg !167
  ret void, !dbg !169
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !170 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata i32* %i, metadata !173, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !176, metadata !DIExpression()), !dbg !177
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !178
  %0 = bitcast i8* %call to i32*, !dbg !179
  store i32* %0, i32** %buffer, align 8, !dbg !177
  %1 = load i32*, i32** %buffer, align 8, !dbg !180
  %cmp = icmp eq i32* %1, null, !dbg !182
  br i1 %cmp, label %if.then, label %if.end, !dbg !183

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !184
  unreachable, !dbg !184

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !189
  %cmp1 = icmp slt i32 %2, 10, !dbg !191
  br i1 %cmp1, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !193
  %4 = load i32, i32* %i, align 4, !dbg !195
  %idxprom = sext i32 %4 to i64, !dbg !193
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !193
  store i32 0, i32* %arrayidx, align 4, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !198
  %inc = add nsw i32 %5, 1, !dbg !198
  store i32 %inc, i32* %i, align 4, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !203
  %cmp2 = icmp sge i32 %6, 0, !dbg !205
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !206

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !207
  %8 = load i32, i32* %data.addr, align 4, !dbg !209
  %idxprom4 = sext i32 %8 to i64, !dbg !207
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !207
  store i32 1, i32* %arrayidx5, align 4, !dbg !210
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond6, !dbg !213

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !214
  %cmp7 = icmp slt i32 %9, 10, !dbg !216
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !217

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !218
  %11 = load i32, i32* %i, align 4, !dbg !220
  %idxprom9 = sext i32 %11 to i64, !dbg !218
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !218
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !218
  call void @printIntLine(i32 %12), !dbg !221
  br label %for.inc11, !dbg !222

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !223
  %inc12 = add nsw i32 %13, 1, !dbg !223
  store i32 %inc12, i32* %i, align 4, !dbg !223
  br label %for.cond6, !dbg !224, !llvm.loop !225

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !227

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !228
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !230
  %15 = bitcast i32* %14 to i8*, !dbg !230
  call void @free(i8* %15) #8, !dbg !231
  ret void, !dbg !232
}

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_44_good() #0 !dbg !233 {
entry:
  call void @goodG2B(), !dbg !234
  call void @goodB2G(), !dbg !235
  ret void, !dbg !236
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !237 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !242, metadata !DIExpression()), !dbg !243
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !244, metadata !DIExpression()), !dbg !245
  %call = call i64 @time(i64* null) #8, !dbg !246
  %conv = trunc i64 %call to i32, !dbg !247
  call void @srand(i32 %conv) #8, !dbg !248
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !249
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_44_good(), !dbg !250
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !251
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !252
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_44_bad(), !dbg !253
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !254
  ret i32 0, !dbg !255
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
define internal void @goodG2B() #0 !dbg !256 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !257, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !259, metadata !DIExpression()), !dbg !260
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !260
  store i32 -1, i32* %data, align 4, !dbg !261
  store i32 7, i32* %data, align 4, !dbg !262
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !263
  %1 = load i32, i32* %data, align 4, !dbg !264
  call void %0(i32 %1), !dbg !263
  ret void, !dbg !265
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !266 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !267, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata i32* %i, metadata !269, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !272, metadata !DIExpression()), !dbg !273
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !274
  %0 = bitcast i8* %call to i32*, !dbg !275
  store i32* %0, i32** %buffer, align 8, !dbg !273
  %1 = load i32*, i32** %buffer, align 8, !dbg !276
  %cmp = icmp eq i32* %1, null, !dbg !278
  br i1 %cmp, label %if.then, label %if.end, !dbg !279

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !280
  unreachable, !dbg !280

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !282
  br label %for.cond, !dbg !284

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !285
  %cmp1 = icmp slt i32 %2, 10, !dbg !287
  br i1 %cmp1, label %for.body, label %for.end, !dbg !288

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !289
  %4 = load i32, i32* %i, align 4, !dbg !291
  %idxprom = sext i32 %4 to i64, !dbg !289
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !289
  store i32 0, i32* %arrayidx, align 4, !dbg !292
  br label %for.inc, !dbg !293

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !294
  %inc = add nsw i32 %5, 1, !dbg !294
  store i32 %inc, i32* %i, align 4, !dbg !294
  br label %for.cond, !dbg !295, !llvm.loop !296

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !298
  %cmp2 = icmp sge i32 %6, 0, !dbg !300
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !301

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !302
  %8 = load i32, i32* %data.addr, align 4, !dbg !304
  %idxprom4 = sext i32 %8 to i64, !dbg !302
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !302
  store i32 1, i32* %arrayidx5, align 4, !dbg !305
  store i32 0, i32* %i, align 4, !dbg !306
  br label %for.cond6, !dbg !308

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !309
  %cmp7 = icmp slt i32 %9, 10, !dbg !311
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !312

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !313
  %11 = load i32, i32* %i, align 4, !dbg !315
  %idxprom9 = sext i32 %11 to i64, !dbg !313
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !313
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !313
  call void @printIntLine(i32 %12), !dbg !316
  br label %for.inc11, !dbg !317

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !318
  %inc12 = add nsw i32 %13, 1, !dbg !318
  store i32 %inc12, i32* %i, align 4, !dbg !318
  br label %for.cond6, !dbg !319, !llvm.loop !320

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !322

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !323
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !325
  %15 = bitcast i32* %14 to i8*, !dbg !325
  call void @free(i8* %15) #8, !dbg !326
  ret void, !dbg !327
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !328 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !329, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !331, metadata !DIExpression()), !dbg !332
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !332
  store i32 -1, i32* %data, align 4, !dbg !333
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !334, metadata !DIExpression()), !dbg !336
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !337, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !339, metadata !DIExpression()), !dbg !340
  store i32 -1, i32* %connectSocket, align 4, !dbg !340
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !341, metadata !DIExpression()), !dbg !342
  br label %do.body, !dbg !343

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !344
  store i32 %call, i32* %connectSocket, align 4, !dbg !346
  %0 = load i32, i32* %connectSocket, align 4, !dbg !347
  %cmp = icmp eq i32 %0, -1, !dbg !349
  br i1 %cmp, label %if.then, label %if.end, !dbg !350

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !351

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !353
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !353
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !354
  store i16 2, i16* %sin_family, align 4, !dbg !355
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !356
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !357
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !358
  store i32 %call1, i32* %s_addr, align 4, !dbg !359
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !360
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !361
  store i16 %call2, i16* %sin_port, align 2, !dbg !362
  %2 = load i32, i32* %connectSocket, align 4, !dbg !363
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !365
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !366
  %cmp4 = icmp eq i32 %call3, -1, !dbg !367
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !368

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !369

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !371
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !372
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !373
  %conv = trunc i64 %call7 to i32, !dbg !373
  store i32 %conv, i32* %recvResult, align 4, !dbg !374
  %5 = load i32, i32* %recvResult, align 4, !dbg !375
  %cmp8 = icmp eq i32 %5, -1, !dbg !377
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !378

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !379
  %cmp10 = icmp eq i32 %6, 0, !dbg !380
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !381

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !382

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !384
  %idxprom = sext i32 %7 to i64, !dbg !385
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !385
  store i8 0, i8* %arrayidx, align 1, !dbg !386
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !387
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !388
  store i32 %call15, i32* %data, align 4, !dbg !389
  br label %do.end, !dbg !390

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !391
  %cmp16 = icmp ne i32 %8, -1, !dbg !393
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !394

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !395
  %call19 = call i32 @close(i32 %9), !dbg !397
  br label %if.end20, !dbg !398

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !399
  %11 = load i32, i32* %data, align 4, !dbg !400
  call void %10(i32 %11), !dbg !399
  ret void, !dbg !401
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !402 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !403, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.declare(metadata i32* %i, metadata !405, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !408, metadata !DIExpression()), !dbg !409
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !410
  %0 = bitcast i8* %call to i32*, !dbg !411
  store i32* %0, i32** %buffer, align 8, !dbg !409
  %1 = load i32*, i32** %buffer, align 8, !dbg !412
  %cmp = icmp eq i32* %1, null, !dbg !414
  br i1 %cmp, label %if.then, label %if.end, !dbg !415

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !416
  unreachable, !dbg !416

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !418
  br label %for.cond, !dbg !420

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !421
  %cmp1 = icmp slt i32 %2, 10, !dbg !423
  br i1 %cmp1, label %for.body, label %for.end, !dbg !424

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !425
  %4 = load i32, i32* %i, align 4, !dbg !427
  %idxprom = sext i32 %4 to i64, !dbg !425
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !425
  store i32 0, i32* %arrayidx, align 4, !dbg !428
  br label %for.inc, !dbg !429

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !430
  %inc = add nsw i32 %5, 1, !dbg !430
  store i32 %inc, i32* %i, align 4, !dbg !430
  br label %for.cond, !dbg !431, !llvm.loop !432

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !434
  %cmp2 = icmp sge i32 %6, 0, !dbg !436
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !437

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !438
  %cmp3 = icmp slt i32 %7, 10, !dbg !439
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !440

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !441
  %9 = load i32, i32* %data.addr, align 4, !dbg !443
  %idxprom5 = sext i32 %9 to i64, !dbg !441
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !441
  store i32 1, i32* %arrayidx6, align 4, !dbg !444
  store i32 0, i32* %i, align 4, !dbg !445
  br label %for.cond7, !dbg !447

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !448
  %cmp8 = icmp slt i32 %10, 10, !dbg !450
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !451

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !452
  %12 = load i32, i32* %i, align 4, !dbg !454
  %idxprom10 = sext i32 %12 to i64, !dbg !452
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !452
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !452
  call void @printIntLine(i32 %13), !dbg !455
  br label %for.inc12, !dbg !456

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !457
  %inc13 = add nsw i32 %14, 1, !dbg !457
  store i32 %inc13, i32* %i, align 4, !dbg !457
  br label %for.cond7, !dbg !458, !llvm.loop !459

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !461

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !462
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !464
  %16 = bitcast i32* %15 to i8*, !dbg !464
  call void @free(i8* %16) #8, !dbg !465
  ret void, !dbg !466
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !5, !59, !61}
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_44_bad", scope: !69, file: !69, line: 74, type: !70, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_44.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 76, type: !60)
!74 = !DILocation(line: 76, column: 9, scope: !68)
!75 = !DILocalVariable(name: "funcPtr", scope: !68, file: !69, line: 78, type: !76)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DISubroutineType(types: !78)
!78 = !{null, !60}
!79 = !DILocation(line: 78, column: 12, scope: !68)
!80 = !DILocation(line: 80, column: 10, scope: !68)
!81 = !DILocalVariable(name: "recvResult", scope: !82, file: !69, line: 86, type: !60)
!82 = distinct !DILexicalBlock(scope: !68, file: !69, line: 81, column: 5)
!83 = !DILocation(line: 86, column: 13, scope: !82)
!84 = !DILocalVariable(name: "service", scope: !82, file: !69, line: 87, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !86)
!86 = !{!87, !88, !94, !101}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !85, file: !17, line: 240, baseType: !51, size: 16)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !85, file: !17, line: 241, baseType: !89, size: 16, offset: 16)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !91, line: 25, baseType: !92)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !93, line: 40, baseType: !53)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !85, file: !17, line: 242, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !17, line: 33, baseType: !98, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !91, line: 26, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !93, line: 42, baseType: !5)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !85, file: !17, line: 245, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 87, column: 28, scope: !82)
!107 = !DILocalVariable(name: "connectSocket", scope: !82, file: !69, line: 88, type: !60)
!108 = !DILocation(line: 88, column: 16, scope: !82)
!109 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !69, line: 89, type: !55)
!110 = !DILocation(line: 89, column: 14, scope: !82)
!111 = !DILocation(line: 90, column: 9, scope: !82)
!112 = !DILocation(line: 100, column: 29, scope: !113)
!113 = distinct !DILexicalBlock(scope: !82, file: !69, line: 91, column: 9)
!114 = !DILocation(line: 100, column: 27, scope: !113)
!115 = !DILocation(line: 101, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !69, line: 101, column: 17)
!117 = !DILocation(line: 101, column: 31, scope: !116)
!118 = !DILocation(line: 101, column: 17, scope: !113)
!119 = !DILocation(line: 103, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !69, line: 102, column: 13)
!121 = !DILocation(line: 105, column: 13, scope: !113)
!122 = !DILocation(line: 106, column: 21, scope: !113)
!123 = !DILocation(line: 106, column: 32, scope: !113)
!124 = !DILocation(line: 107, column: 39, scope: !113)
!125 = !DILocation(line: 107, column: 21, scope: !113)
!126 = !DILocation(line: 107, column: 30, scope: !113)
!127 = !DILocation(line: 107, column: 37, scope: !113)
!128 = !DILocation(line: 108, column: 32, scope: !113)
!129 = !DILocation(line: 108, column: 21, scope: !113)
!130 = !DILocation(line: 108, column: 30, scope: !113)
!131 = !DILocation(line: 109, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !113, file: !69, line: 109, column: 17)
!133 = !DILocation(line: 109, column: 40, scope: !132)
!134 = !DILocation(line: 109, column: 17, scope: !132)
!135 = !DILocation(line: 109, column: 85, scope: !132)
!136 = !DILocation(line: 109, column: 17, scope: !113)
!137 = !DILocation(line: 111, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !69, line: 110, column: 13)
!139 = !DILocation(line: 115, column: 31, scope: !113)
!140 = !DILocation(line: 115, column: 46, scope: !113)
!141 = !DILocation(line: 115, column: 26, scope: !113)
!142 = !DILocation(line: 115, column: 24, scope: !113)
!143 = !DILocation(line: 116, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !113, file: !69, line: 116, column: 17)
!145 = !DILocation(line: 116, column: 28, scope: !144)
!146 = !DILocation(line: 116, column: 44, scope: !144)
!147 = !DILocation(line: 116, column: 47, scope: !144)
!148 = !DILocation(line: 116, column: 58, scope: !144)
!149 = !DILocation(line: 116, column: 17, scope: !113)
!150 = !DILocation(line: 118, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !144, file: !69, line: 117, column: 13)
!152 = !DILocation(line: 121, column: 25, scope: !113)
!153 = !DILocation(line: 121, column: 13, scope: !113)
!154 = !DILocation(line: 121, column: 37, scope: !113)
!155 = !DILocation(line: 123, column: 25, scope: !113)
!156 = !DILocation(line: 123, column: 20, scope: !113)
!157 = !DILocation(line: 123, column: 18, scope: !113)
!158 = !DILocation(line: 124, column: 9, scope: !113)
!159 = !DILocation(line: 126, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !82, file: !69, line: 126, column: 13)
!161 = !DILocation(line: 126, column: 27, scope: !160)
!162 = !DILocation(line: 126, column: 13, scope: !82)
!163 = !DILocation(line: 128, column: 26, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !69, line: 127, column: 9)
!165 = !DILocation(line: 128, column: 13, scope: !164)
!166 = !DILocation(line: 129, column: 9, scope: !164)
!167 = !DILocation(line: 138, column: 5, scope: !68)
!168 = !DILocation(line: 138, column: 13, scope: !68)
!169 = !DILocation(line: 139, column: 1, scope: !68)
!170 = distinct !DISubprogram(name: "badSink", scope: !69, file: !69, line: 44, type: !77, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!171 = !DILocalVariable(name: "data", arg: 1, scope: !170, file: !69, line: 44, type: !60)
!172 = !DILocation(line: 44, column: 25, scope: !170)
!173 = !DILocalVariable(name: "i", scope: !174, file: !69, line: 47, type: !60)
!174 = distinct !DILexicalBlock(scope: !170, file: !69, line: 46, column: 5)
!175 = !DILocation(line: 47, column: 13, scope: !174)
!176 = !DILocalVariable(name: "buffer", scope: !174, file: !69, line: 48, type: !59)
!177 = !DILocation(line: 48, column: 15, scope: !174)
!178 = !DILocation(line: 48, column: 31, scope: !174)
!179 = !DILocation(line: 48, column: 24, scope: !174)
!180 = !DILocation(line: 49, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !174, file: !69, line: 49, column: 13)
!182 = !DILocation(line: 49, column: 20, scope: !181)
!183 = !DILocation(line: 49, column: 13, scope: !174)
!184 = !DILocation(line: 49, column: 30, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !69, line: 49, column: 29)
!186 = !DILocation(line: 51, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !174, file: !69, line: 51, column: 9)
!188 = !DILocation(line: 51, column: 14, scope: !187)
!189 = !DILocation(line: 51, column: 21, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !69, line: 51, column: 9)
!191 = !DILocation(line: 51, column: 23, scope: !190)
!192 = !DILocation(line: 51, column: 9, scope: !187)
!193 = !DILocation(line: 53, column: 13, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !69, line: 52, column: 9)
!195 = !DILocation(line: 53, column: 20, scope: !194)
!196 = !DILocation(line: 53, column: 23, scope: !194)
!197 = !DILocation(line: 54, column: 9, scope: !194)
!198 = !DILocation(line: 51, column: 30, scope: !190)
!199 = !DILocation(line: 51, column: 9, scope: !190)
!200 = distinct !{!200, !192, !201, !202}
!201 = !DILocation(line: 54, column: 9, scope: !187)
!202 = !{!"llvm.loop.mustprogress"}
!203 = !DILocation(line: 57, column: 13, scope: !204)
!204 = distinct !DILexicalBlock(scope: !174, file: !69, line: 57, column: 13)
!205 = !DILocation(line: 57, column: 18, scope: !204)
!206 = !DILocation(line: 57, column: 13, scope: !174)
!207 = !DILocation(line: 59, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !69, line: 58, column: 9)
!209 = !DILocation(line: 59, column: 20, scope: !208)
!210 = !DILocation(line: 59, column: 26, scope: !208)
!211 = !DILocation(line: 61, column: 19, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !69, line: 61, column: 13)
!213 = !DILocation(line: 61, column: 17, scope: !212)
!214 = !DILocation(line: 61, column: 24, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !69, line: 61, column: 13)
!216 = !DILocation(line: 61, column: 26, scope: !215)
!217 = !DILocation(line: 61, column: 13, scope: !212)
!218 = !DILocation(line: 63, column: 30, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !69, line: 62, column: 13)
!220 = !DILocation(line: 63, column: 37, scope: !219)
!221 = !DILocation(line: 63, column: 17, scope: !219)
!222 = !DILocation(line: 64, column: 13, scope: !219)
!223 = !DILocation(line: 61, column: 33, scope: !215)
!224 = !DILocation(line: 61, column: 13, scope: !215)
!225 = distinct !{!225, !217, !226, !202}
!226 = !DILocation(line: 64, column: 13, scope: !212)
!227 = !DILocation(line: 65, column: 9, scope: !208)
!228 = !DILocation(line: 68, column: 13, scope: !229)
!229 = distinct !DILexicalBlock(scope: !204, file: !69, line: 67, column: 9)
!230 = !DILocation(line: 70, column: 14, scope: !174)
!231 = !DILocation(line: 70, column: 9, scope: !174)
!232 = !DILocation(line: 72, column: 1, scope: !170)
!233 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_44_good", scope: !69, file: !69, line: 283, type: !70, scopeLine: 284, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!234 = !DILocation(line: 285, column: 5, scope: !233)
!235 = !DILocation(line: 286, column: 5, scope: !233)
!236 = !DILocation(line: 287, column: 1, scope: !233)
!237 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 297, type: !238, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!238 = !DISubroutineType(types: !239)
!239 = !{!60, !60, !240}
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !241, size: 64)
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!242 = !DILocalVariable(name: "argc", arg: 1, scope: !237, file: !69, line: 297, type: !60)
!243 = !DILocation(line: 297, column: 14, scope: !237)
!244 = !DILocalVariable(name: "argv", arg: 2, scope: !237, file: !69, line: 297, type: !240)
!245 = !DILocation(line: 297, column: 27, scope: !237)
!246 = !DILocation(line: 300, column: 22, scope: !237)
!247 = !DILocation(line: 300, column: 12, scope: !237)
!248 = !DILocation(line: 300, column: 5, scope: !237)
!249 = !DILocation(line: 302, column: 5, scope: !237)
!250 = !DILocation(line: 303, column: 5, scope: !237)
!251 = !DILocation(line: 304, column: 5, scope: !237)
!252 = !DILocation(line: 307, column: 5, scope: !237)
!253 = !DILocation(line: 308, column: 5, scope: !237)
!254 = !DILocation(line: 309, column: 5, scope: !237)
!255 = !DILocation(line: 311, column: 5, scope: !237)
!256 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 176, type: !70, scopeLine: 177, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!257 = !DILocalVariable(name: "data", scope: !256, file: !69, line: 178, type: !60)
!258 = !DILocation(line: 178, column: 9, scope: !256)
!259 = !DILocalVariable(name: "funcPtr", scope: !256, file: !69, line: 179, type: !76)
!260 = !DILocation(line: 179, column: 12, scope: !256)
!261 = !DILocation(line: 181, column: 10, scope: !256)
!262 = !DILocation(line: 184, column: 10, scope: !256)
!263 = !DILocation(line: 185, column: 5, scope: !256)
!264 = !DILocation(line: 185, column: 13, scope: !256)
!265 = !DILocation(line: 186, column: 1, scope: !256)
!266 = distinct !DISubprogram(name: "goodG2BSink", scope: !69, file: !69, line: 146, type: !77, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!267 = !DILocalVariable(name: "data", arg: 1, scope: !266, file: !69, line: 146, type: !60)
!268 = !DILocation(line: 146, column: 29, scope: !266)
!269 = !DILocalVariable(name: "i", scope: !270, file: !69, line: 149, type: !60)
!270 = distinct !DILexicalBlock(scope: !266, file: !69, line: 148, column: 5)
!271 = !DILocation(line: 149, column: 13, scope: !270)
!272 = !DILocalVariable(name: "buffer", scope: !270, file: !69, line: 150, type: !59)
!273 = !DILocation(line: 150, column: 15, scope: !270)
!274 = !DILocation(line: 150, column: 31, scope: !270)
!275 = !DILocation(line: 150, column: 24, scope: !270)
!276 = !DILocation(line: 151, column: 13, scope: !277)
!277 = distinct !DILexicalBlock(scope: !270, file: !69, line: 151, column: 13)
!278 = !DILocation(line: 151, column: 20, scope: !277)
!279 = !DILocation(line: 151, column: 13, scope: !270)
!280 = !DILocation(line: 151, column: 30, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !69, line: 151, column: 29)
!282 = !DILocation(line: 153, column: 16, scope: !283)
!283 = distinct !DILexicalBlock(scope: !270, file: !69, line: 153, column: 9)
!284 = !DILocation(line: 153, column: 14, scope: !283)
!285 = !DILocation(line: 153, column: 21, scope: !286)
!286 = distinct !DILexicalBlock(scope: !283, file: !69, line: 153, column: 9)
!287 = !DILocation(line: 153, column: 23, scope: !286)
!288 = !DILocation(line: 153, column: 9, scope: !283)
!289 = !DILocation(line: 155, column: 13, scope: !290)
!290 = distinct !DILexicalBlock(scope: !286, file: !69, line: 154, column: 9)
!291 = !DILocation(line: 155, column: 20, scope: !290)
!292 = !DILocation(line: 155, column: 23, scope: !290)
!293 = !DILocation(line: 156, column: 9, scope: !290)
!294 = !DILocation(line: 153, column: 30, scope: !286)
!295 = !DILocation(line: 153, column: 9, scope: !286)
!296 = distinct !{!296, !288, !297, !202}
!297 = !DILocation(line: 156, column: 9, scope: !283)
!298 = !DILocation(line: 159, column: 13, scope: !299)
!299 = distinct !DILexicalBlock(scope: !270, file: !69, line: 159, column: 13)
!300 = !DILocation(line: 159, column: 18, scope: !299)
!301 = !DILocation(line: 159, column: 13, scope: !270)
!302 = !DILocation(line: 161, column: 13, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !69, line: 160, column: 9)
!304 = !DILocation(line: 161, column: 20, scope: !303)
!305 = !DILocation(line: 161, column: 26, scope: !303)
!306 = !DILocation(line: 163, column: 19, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !69, line: 163, column: 13)
!308 = !DILocation(line: 163, column: 17, scope: !307)
!309 = !DILocation(line: 163, column: 24, scope: !310)
!310 = distinct !DILexicalBlock(scope: !307, file: !69, line: 163, column: 13)
!311 = !DILocation(line: 163, column: 26, scope: !310)
!312 = !DILocation(line: 163, column: 13, scope: !307)
!313 = !DILocation(line: 165, column: 30, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !69, line: 164, column: 13)
!315 = !DILocation(line: 165, column: 37, scope: !314)
!316 = !DILocation(line: 165, column: 17, scope: !314)
!317 = !DILocation(line: 166, column: 13, scope: !314)
!318 = !DILocation(line: 163, column: 33, scope: !310)
!319 = !DILocation(line: 163, column: 13, scope: !310)
!320 = distinct !{!320, !312, !321, !202}
!321 = !DILocation(line: 166, column: 13, scope: !307)
!322 = !DILocation(line: 167, column: 9, scope: !303)
!323 = !DILocation(line: 170, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !299, file: !69, line: 169, column: 9)
!325 = !DILocation(line: 172, column: 14, scope: !270)
!326 = !DILocation(line: 172, column: 9, scope: !270)
!327 = !DILocation(line: 174, column: 1, scope: !266)
!328 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 218, type: !70, scopeLine: 219, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!329 = !DILocalVariable(name: "data", scope: !328, file: !69, line: 220, type: !60)
!330 = !DILocation(line: 220, column: 9, scope: !328)
!331 = !DILocalVariable(name: "funcPtr", scope: !328, file: !69, line: 221, type: !76)
!332 = !DILocation(line: 221, column: 12, scope: !328)
!333 = !DILocation(line: 223, column: 10, scope: !328)
!334 = !DILocalVariable(name: "recvResult", scope: !335, file: !69, line: 229, type: !60)
!335 = distinct !DILexicalBlock(scope: !328, file: !69, line: 224, column: 5)
!336 = !DILocation(line: 229, column: 13, scope: !335)
!337 = !DILocalVariable(name: "service", scope: !335, file: !69, line: 230, type: !85)
!338 = !DILocation(line: 230, column: 28, scope: !335)
!339 = !DILocalVariable(name: "connectSocket", scope: !335, file: !69, line: 231, type: !60)
!340 = !DILocation(line: 231, column: 16, scope: !335)
!341 = !DILocalVariable(name: "inputBuffer", scope: !335, file: !69, line: 232, type: !55)
!342 = !DILocation(line: 232, column: 14, scope: !335)
!343 = !DILocation(line: 233, column: 9, scope: !335)
!344 = !DILocation(line: 243, column: 29, scope: !345)
!345 = distinct !DILexicalBlock(scope: !335, file: !69, line: 234, column: 9)
!346 = !DILocation(line: 243, column: 27, scope: !345)
!347 = !DILocation(line: 244, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !345, file: !69, line: 244, column: 17)
!349 = !DILocation(line: 244, column: 31, scope: !348)
!350 = !DILocation(line: 244, column: 17, scope: !345)
!351 = !DILocation(line: 246, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !69, line: 245, column: 13)
!353 = !DILocation(line: 248, column: 13, scope: !345)
!354 = !DILocation(line: 249, column: 21, scope: !345)
!355 = !DILocation(line: 249, column: 32, scope: !345)
!356 = !DILocation(line: 250, column: 39, scope: !345)
!357 = !DILocation(line: 250, column: 21, scope: !345)
!358 = !DILocation(line: 250, column: 30, scope: !345)
!359 = !DILocation(line: 250, column: 37, scope: !345)
!360 = !DILocation(line: 251, column: 32, scope: !345)
!361 = !DILocation(line: 251, column: 21, scope: !345)
!362 = !DILocation(line: 251, column: 30, scope: !345)
!363 = !DILocation(line: 252, column: 25, scope: !364)
!364 = distinct !DILexicalBlock(scope: !345, file: !69, line: 252, column: 17)
!365 = !DILocation(line: 252, column: 40, scope: !364)
!366 = !DILocation(line: 252, column: 17, scope: !364)
!367 = !DILocation(line: 252, column: 85, scope: !364)
!368 = !DILocation(line: 252, column: 17, scope: !345)
!369 = !DILocation(line: 254, column: 17, scope: !370)
!370 = distinct !DILexicalBlock(scope: !364, file: !69, line: 253, column: 13)
!371 = !DILocation(line: 258, column: 31, scope: !345)
!372 = !DILocation(line: 258, column: 46, scope: !345)
!373 = !DILocation(line: 258, column: 26, scope: !345)
!374 = !DILocation(line: 258, column: 24, scope: !345)
!375 = !DILocation(line: 259, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !345, file: !69, line: 259, column: 17)
!377 = !DILocation(line: 259, column: 28, scope: !376)
!378 = !DILocation(line: 259, column: 44, scope: !376)
!379 = !DILocation(line: 259, column: 47, scope: !376)
!380 = !DILocation(line: 259, column: 58, scope: !376)
!381 = !DILocation(line: 259, column: 17, scope: !345)
!382 = !DILocation(line: 261, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !376, file: !69, line: 260, column: 13)
!384 = !DILocation(line: 264, column: 25, scope: !345)
!385 = !DILocation(line: 264, column: 13, scope: !345)
!386 = !DILocation(line: 264, column: 37, scope: !345)
!387 = !DILocation(line: 266, column: 25, scope: !345)
!388 = !DILocation(line: 266, column: 20, scope: !345)
!389 = !DILocation(line: 266, column: 18, scope: !345)
!390 = !DILocation(line: 267, column: 9, scope: !345)
!391 = !DILocation(line: 269, column: 13, scope: !392)
!392 = distinct !DILexicalBlock(scope: !335, file: !69, line: 269, column: 13)
!393 = !DILocation(line: 269, column: 27, scope: !392)
!394 = !DILocation(line: 269, column: 13, scope: !335)
!395 = !DILocation(line: 271, column: 26, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !69, line: 270, column: 9)
!397 = !DILocation(line: 271, column: 13, scope: !396)
!398 = !DILocation(line: 272, column: 9, scope: !396)
!399 = !DILocation(line: 280, column: 5, scope: !328)
!400 = !DILocation(line: 280, column: 13, scope: !328)
!401 = !DILocation(line: 281, column: 1, scope: !328)
!402 = distinct !DISubprogram(name: "goodB2GSink", scope: !69, file: !69, line: 189, type: !77, scopeLine: 190, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!403 = !DILocalVariable(name: "data", arg: 1, scope: !402, file: !69, line: 189, type: !60)
!404 = !DILocation(line: 189, column: 29, scope: !402)
!405 = !DILocalVariable(name: "i", scope: !406, file: !69, line: 192, type: !60)
!406 = distinct !DILexicalBlock(scope: !402, file: !69, line: 191, column: 5)
!407 = !DILocation(line: 192, column: 13, scope: !406)
!408 = !DILocalVariable(name: "buffer", scope: !406, file: !69, line: 193, type: !59)
!409 = !DILocation(line: 193, column: 15, scope: !406)
!410 = !DILocation(line: 193, column: 31, scope: !406)
!411 = !DILocation(line: 193, column: 24, scope: !406)
!412 = !DILocation(line: 194, column: 13, scope: !413)
!413 = distinct !DILexicalBlock(scope: !406, file: !69, line: 194, column: 13)
!414 = !DILocation(line: 194, column: 20, scope: !413)
!415 = !DILocation(line: 194, column: 13, scope: !406)
!416 = !DILocation(line: 194, column: 30, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !69, line: 194, column: 29)
!418 = !DILocation(line: 196, column: 16, scope: !419)
!419 = distinct !DILexicalBlock(scope: !406, file: !69, line: 196, column: 9)
!420 = !DILocation(line: 196, column: 14, scope: !419)
!421 = !DILocation(line: 196, column: 21, scope: !422)
!422 = distinct !DILexicalBlock(scope: !419, file: !69, line: 196, column: 9)
!423 = !DILocation(line: 196, column: 23, scope: !422)
!424 = !DILocation(line: 196, column: 9, scope: !419)
!425 = !DILocation(line: 198, column: 13, scope: !426)
!426 = distinct !DILexicalBlock(scope: !422, file: !69, line: 197, column: 9)
!427 = !DILocation(line: 198, column: 20, scope: !426)
!428 = !DILocation(line: 198, column: 23, scope: !426)
!429 = !DILocation(line: 199, column: 9, scope: !426)
!430 = !DILocation(line: 196, column: 30, scope: !422)
!431 = !DILocation(line: 196, column: 9, scope: !422)
!432 = distinct !{!432, !424, !433, !202}
!433 = !DILocation(line: 199, column: 9, scope: !419)
!434 = !DILocation(line: 201, column: 13, scope: !435)
!435 = distinct !DILexicalBlock(scope: !406, file: !69, line: 201, column: 13)
!436 = !DILocation(line: 201, column: 18, scope: !435)
!437 = !DILocation(line: 201, column: 23, scope: !435)
!438 = !DILocation(line: 201, column: 26, scope: !435)
!439 = !DILocation(line: 201, column: 31, scope: !435)
!440 = !DILocation(line: 201, column: 13, scope: !406)
!441 = !DILocation(line: 203, column: 13, scope: !442)
!442 = distinct !DILexicalBlock(scope: !435, file: !69, line: 202, column: 9)
!443 = !DILocation(line: 203, column: 20, scope: !442)
!444 = !DILocation(line: 203, column: 26, scope: !442)
!445 = !DILocation(line: 205, column: 19, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !69, line: 205, column: 13)
!447 = !DILocation(line: 205, column: 17, scope: !446)
!448 = !DILocation(line: 205, column: 24, scope: !449)
!449 = distinct !DILexicalBlock(scope: !446, file: !69, line: 205, column: 13)
!450 = !DILocation(line: 205, column: 26, scope: !449)
!451 = !DILocation(line: 205, column: 13, scope: !446)
!452 = !DILocation(line: 207, column: 30, scope: !453)
!453 = distinct !DILexicalBlock(scope: !449, file: !69, line: 206, column: 13)
!454 = !DILocation(line: 207, column: 37, scope: !453)
!455 = !DILocation(line: 207, column: 17, scope: !453)
!456 = !DILocation(line: 208, column: 13, scope: !453)
!457 = !DILocation(line: 205, column: 33, scope: !449)
!458 = !DILocation(line: 205, column: 13, scope: !449)
!459 = distinct !{!459, !451, !460, !202}
!460 = !DILocation(line: 208, column: 13, scope: !446)
!461 = !DILocation(line: 209, column: 9, scope: !442)
!462 = !DILocation(line: 212, column: 13, scope: !463)
!463 = distinct !DILexicalBlock(scope: !435, file: !69, line: 211, column: 9)
!464 = !DILocation(line: 214, column: 14, scope: !406)
!465 = !DILocation(line: 214, column: 9, scope: !406)
!466 = !DILocation(line: 216, column: 1, scope: !402)
