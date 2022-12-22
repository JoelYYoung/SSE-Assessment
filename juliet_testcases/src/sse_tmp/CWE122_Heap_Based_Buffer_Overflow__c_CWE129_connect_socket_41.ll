; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_bad() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 -1, i32* %data, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !76, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !79, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %connectSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  br label %do.body, !dbg !106

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !107
  store i32 %call, i32* %connectSocket, align 4, !dbg !109
  %0 = load i32, i32* %connectSocket, align 4, !dbg !110
  %cmp = icmp eq i32 %0, -1, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !114

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !116
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !117
  store i16 2, i16* %sin_family, align 4, !dbg !118
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !119
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !120
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !121
  store i32 %call1, i32* %s_addr, align 4, !dbg !122
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !123
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !124
  store i16 %call2, i16* %sin_port, align 2, !dbg !125
  %2 = load i32, i32* %connectSocket, align 4, !dbg !126
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !128
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !129
  %cmp4 = icmp eq i32 %call3, -1, !dbg !130
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !131

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !132

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !134
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !135
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !136
  %conv = trunc i64 %call7 to i32, !dbg !136
  store i32 %conv, i32* %recvResult, align 4, !dbg !137
  %5 = load i32, i32* %recvResult, align 4, !dbg !138
  %cmp8 = icmp eq i32 %5, -1, !dbg !140
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !141

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !142
  %cmp10 = icmp eq i32 %6, 0, !dbg !143
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !144

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !145

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !147
  %idxprom = sext i32 %7 to i64, !dbg !148
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !150
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !151
  store i32 %call15, i32* %data, align 4, !dbg !152
  br label %do.end, !dbg !153

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !154
  %cmp16 = icmp ne i32 %8, -1, !dbg !156
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !157

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !158
  %call19 = call i32 @close(i32 %9), !dbg !160
  br label %if.end20, !dbg !161

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !162
  call void @badSink(i32 %10), !dbg !163
  ret void, !dbg !164
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
define internal void @badSink(i32 %data) #0 !dbg !165 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i32* %i, metadata !170, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !173, metadata !DIExpression()), !dbg !174
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !175
  %0 = bitcast i8* %call to i32*, !dbg !176
  store i32* %0, i32** %buffer, align 8, !dbg !174
  %1 = load i32*, i32** %buffer, align 8, !dbg !177
  %cmp = icmp eq i32* %1, null, !dbg !179
  br i1 %cmp, label %if.then, label %if.end, !dbg !180

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !181
  unreachable, !dbg !181

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !186
  %cmp1 = icmp slt i32 %2, 10, !dbg !188
  br i1 %cmp1, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !190
  %4 = load i32, i32* %i, align 4, !dbg !192
  %idxprom = sext i32 %4 to i64, !dbg !190
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !190
  store i32 0, i32* %arrayidx, align 4, !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !195
  %inc = add nsw i32 %5, 1, !dbg !195
  store i32 %inc, i32* %i, align 4, !dbg !195
  br label %for.cond, !dbg !196, !llvm.loop !197

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !200
  %cmp2 = icmp sge i32 %6, 0, !dbg !202
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !203

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !204
  %8 = load i32, i32* %data.addr, align 4, !dbg !206
  %idxprom4 = sext i32 %8 to i64, !dbg !204
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !204
  store i32 1, i32* %arrayidx5, align 4, !dbg !207
  store i32 0, i32* %i, align 4, !dbg !208
  br label %for.cond6, !dbg !210

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !211
  %cmp7 = icmp slt i32 %9, 10, !dbg !213
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !214

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !215
  %11 = load i32, i32* %i, align 4, !dbg !217
  %idxprom9 = sext i32 %11 to i64, !dbg !215
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !215
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !215
  call void @printIntLine(i32 %12), !dbg !218
  br label %for.inc11, !dbg !219

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !220
  %inc12 = add nsw i32 %13, 1, !dbg !220
  store i32 %inc12, i32* %i, align 4, !dbg !220
  br label %for.cond6, !dbg !221, !llvm.loop !222

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !224

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !225
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !227
  %15 = bitcast i32* %14 to i8*, !dbg !227
  call void @free(i8* %15) #8, !dbg !228
  ret void, !dbg !229
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_good() #0 !dbg !230 {
entry:
  call void @goodB2G(), !dbg !231
  call void @goodG2B(), !dbg !232
  ret void, !dbg !233
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !234 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !239, metadata !DIExpression()), !dbg !240
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !241, metadata !DIExpression()), !dbg !242
  %call = call i64 @time(i64* null) #8, !dbg !243
  %conv = trunc i64 %call to i32, !dbg !244
  call void @srand(i32 %conv) #8, !dbg !245
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !246
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_good(), !dbg !247
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !248
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !249
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_bad(), !dbg !250
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !251
  ret i32 0, !dbg !252
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
define internal void @goodB2G() #0 !dbg !253 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !254, metadata !DIExpression()), !dbg !255
  store i32 -1, i32* %data, align 4, !dbg !256
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !257, metadata !DIExpression()), !dbg !259
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
  %10 = load i32, i32* %data, align 4, !dbg !322
  call void @goodB2GSink(i32 %10), !dbg !323
  ret void, !dbg !324
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !325 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !326, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.declare(metadata i32* %i, metadata !328, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !331, metadata !DIExpression()), !dbg !332
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !333
  %0 = bitcast i8* %call to i32*, !dbg !334
  store i32* %0, i32** %buffer, align 8, !dbg !332
  %1 = load i32*, i32** %buffer, align 8, !dbg !335
  %cmp = icmp eq i32* %1, null, !dbg !337
  br i1 %cmp, label %if.then, label %if.end, !dbg !338

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !339
  unreachable, !dbg !339

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !341
  br label %for.cond, !dbg !343

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !344
  %cmp1 = icmp slt i32 %2, 10, !dbg !346
  br i1 %cmp1, label %for.body, label %for.end, !dbg !347

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !348
  %4 = load i32, i32* %i, align 4, !dbg !350
  %idxprom = sext i32 %4 to i64, !dbg !348
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !348
  store i32 0, i32* %arrayidx, align 4, !dbg !351
  br label %for.inc, !dbg !352

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !353
  %inc = add nsw i32 %5, 1, !dbg !353
  store i32 %inc, i32* %i, align 4, !dbg !353
  br label %for.cond, !dbg !354, !llvm.loop !355

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !357
  %cmp2 = icmp sge i32 %6, 0, !dbg !359
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !360

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !361
  %cmp3 = icmp slt i32 %7, 10, !dbg !362
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !363

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !364
  %9 = load i32, i32* %data.addr, align 4, !dbg !366
  %idxprom5 = sext i32 %9 to i64, !dbg !364
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !364
  store i32 1, i32* %arrayidx6, align 4, !dbg !367
  store i32 0, i32* %i, align 4, !dbg !368
  br label %for.cond7, !dbg !370

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !371
  %cmp8 = icmp slt i32 %10, 10, !dbg !373
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !374

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !375
  %12 = load i32, i32* %i, align 4, !dbg !377
  %idxprom10 = sext i32 %12 to i64, !dbg !375
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !375
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !375
  call void @printIntLine(i32 %13), !dbg !378
  br label %for.inc12, !dbg !379

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !380
  %inc13 = add nsw i32 %14, 1, !dbg !380
  store i32 %inc13, i32* %i, align 4, !dbg !380
  br label %for.cond7, !dbg !381, !llvm.loop !382

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !384

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !385
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !387
  %16 = bitcast i32* %15 to i8*, !dbg !387
  call void @free(i8* %16) #8, !dbg !388
  ret void, !dbg !389
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !390 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !391, metadata !DIExpression()), !dbg !392
  store i32 -1, i32* %data, align 4, !dbg !393
  store i32 7, i32* %data, align 4, !dbg !394
  %0 = load i32, i32* %data, align 4, !dbg !395
  call void @goodG2BSink(i32 %0), !dbg !396
  ret void, !dbg !397
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !398 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !399, metadata !DIExpression()), !dbg !400
  call void @llvm.dbg.declare(metadata i32* %i, metadata !401, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !404, metadata !DIExpression()), !dbg !405
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !406
  %0 = bitcast i8* %call to i32*, !dbg !407
  store i32* %0, i32** %buffer, align 8, !dbg !405
  %1 = load i32*, i32** %buffer, align 8, !dbg !408
  %cmp = icmp eq i32* %1, null, !dbg !410
  br i1 %cmp, label %if.then, label %if.end, !dbg !411

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !412
  unreachable, !dbg !412

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !414
  br label %for.cond, !dbg !416

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !417
  %cmp1 = icmp slt i32 %2, 10, !dbg !419
  br i1 %cmp1, label %for.body, label %for.end, !dbg !420

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !421
  %4 = load i32, i32* %i, align 4, !dbg !423
  %idxprom = sext i32 %4 to i64, !dbg !421
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !421
  store i32 0, i32* %arrayidx, align 4, !dbg !424
  br label %for.inc, !dbg !425

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !426
  %inc = add nsw i32 %5, 1, !dbg !426
  store i32 %inc, i32* %i, align 4, !dbg !426
  br label %for.cond, !dbg !427, !llvm.loop !428

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !430
  %cmp2 = icmp sge i32 %6, 0, !dbg !432
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !433

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !434
  %8 = load i32, i32* %data.addr, align 4, !dbg !436
  %idxprom4 = sext i32 %8 to i64, !dbg !434
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !434
  store i32 1, i32* %arrayidx5, align 4, !dbg !437
  store i32 0, i32* %i, align 4, !dbg !438
  br label %for.cond6, !dbg !440

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !441
  %cmp7 = icmp slt i32 %9, 10, !dbg !443
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !444

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !445
  %11 = load i32, i32* %i, align 4, !dbg !447
  %idxprom9 = sext i32 %11 to i64, !dbg !445
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !445
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !445
  call void @printIntLine(i32 %12), !dbg !448
  br label %for.inc11, !dbg !449

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !450
  %inc12 = add nsw i32 %13, 1, !dbg !450
  store i32 %inc12, i32* %i, align 4, !dbg !450
  br label %for.cond6, !dbg !451, !llvm.loop !452

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !454

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !455
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !457
  %15 = bitcast i32* %14 to i8*, !dbg !457
  call void @free(i8* %15) #8, !dbg !458
  ret void, !dbg !459
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41.c", directory: "/root/SSE-Assessment")
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_bad", scope: !69, file: !69, line: 74, type: !70, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41.c", directory: "/root/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 76, type: !60)
!74 = !DILocation(line: 76, column: 9, scope: !68)
!75 = !DILocation(line: 78, column: 10, scope: !68)
!76 = !DILocalVariable(name: "recvResult", scope: !77, file: !69, line: 84, type: !60)
!77 = distinct !DILexicalBlock(scope: !68, file: !69, line: 79, column: 5)
!78 = !DILocation(line: 84, column: 13, scope: !77)
!79 = !DILocalVariable(name: "service", scope: !77, file: !69, line: 85, type: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !81)
!81 = !{!82, !83, !89, !96}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !80, file: !17, line: 239, baseType: !51, size: 16)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !80, file: !17, line: 240, baseType: !84, size: 16, offset: 16)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !86, line: 25, baseType: !87)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !88, line: 39, baseType: !53)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !80, file: !17, line: 241, baseType: !90, size: 32, offset: 32)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !91)
!91 = !{!92}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !90, file: !17, line: 33, baseType: !93, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !86, line: 26, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !88, line: 41, baseType: !5)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !80, file: !17, line: 244, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 85, column: 28, scope: !77)
!102 = !DILocalVariable(name: "connectSocket", scope: !77, file: !69, line: 86, type: !60)
!103 = !DILocation(line: 86, column: 16, scope: !77)
!104 = !DILocalVariable(name: "inputBuffer", scope: !77, file: !69, line: 87, type: !55)
!105 = !DILocation(line: 87, column: 14, scope: !77)
!106 = !DILocation(line: 88, column: 9, scope: !77)
!107 = !DILocation(line: 98, column: 29, scope: !108)
!108 = distinct !DILexicalBlock(scope: !77, file: !69, line: 89, column: 9)
!109 = !DILocation(line: 98, column: 27, scope: !108)
!110 = !DILocation(line: 99, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !69, line: 99, column: 17)
!112 = !DILocation(line: 99, column: 31, scope: !111)
!113 = !DILocation(line: 99, column: 17, scope: !108)
!114 = !DILocation(line: 101, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !69, line: 100, column: 13)
!116 = !DILocation(line: 103, column: 13, scope: !108)
!117 = !DILocation(line: 104, column: 21, scope: !108)
!118 = !DILocation(line: 104, column: 32, scope: !108)
!119 = !DILocation(line: 105, column: 39, scope: !108)
!120 = !DILocation(line: 105, column: 21, scope: !108)
!121 = !DILocation(line: 105, column: 30, scope: !108)
!122 = !DILocation(line: 105, column: 37, scope: !108)
!123 = !DILocation(line: 106, column: 32, scope: !108)
!124 = !DILocation(line: 106, column: 21, scope: !108)
!125 = !DILocation(line: 106, column: 30, scope: !108)
!126 = !DILocation(line: 107, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !108, file: !69, line: 107, column: 17)
!128 = !DILocation(line: 107, column: 40, scope: !127)
!129 = !DILocation(line: 107, column: 17, scope: !127)
!130 = !DILocation(line: 107, column: 85, scope: !127)
!131 = !DILocation(line: 107, column: 17, scope: !108)
!132 = !DILocation(line: 109, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !69, line: 108, column: 13)
!134 = !DILocation(line: 113, column: 31, scope: !108)
!135 = !DILocation(line: 113, column: 46, scope: !108)
!136 = !DILocation(line: 113, column: 26, scope: !108)
!137 = !DILocation(line: 113, column: 24, scope: !108)
!138 = !DILocation(line: 114, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !108, file: !69, line: 114, column: 17)
!140 = !DILocation(line: 114, column: 28, scope: !139)
!141 = !DILocation(line: 114, column: 44, scope: !139)
!142 = !DILocation(line: 114, column: 47, scope: !139)
!143 = !DILocation(line: 114, column: 58, scope: !139)
!144 = !DILocation(line: 114, column: 17, scope: !108)
!145 = !DILocation(line: 116, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !139, file: !69, line: 115, column: 13)
!147 = !DILocation(line: 119, column: 25, scope: !108)
!148 = !DILocation(line: 119, column: 13, scope: !108)
!149 = !DILocation(line: 119, column: 37, scope: !108)
!150 = !DILocation(line: 121, column: 25, scope: !108)
!151 = !DILocation(line: 121, column: 20, scope: !108)
!152 = !DILocation(line: 121, column: 18, scope: !108)
!153 = !DILocation(line: 122, column: 9, scope: !108)
!154 = !DILocation(line: 124, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !77, file: !69, line: 124, column: 13)
!156 = !DILocation(line: 124, column: 27, scope: !155)
!157 = !DILocation(line: 124, column: 13, scope: !77)
!158 = !DILocation(line: 126, column: 26, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !69, line: 125, column: 9)
!160 = !DILocation(line: 126, column: 13, scope: !159)
!161 = !DILocation(line: 127, column: 9, scope: !159)
!162 = !DILocation(line: 135, column: 13, scope: !68)
!163 = !DILocation(line: 135, column: 5, scope: !68)
!164 = !DILocation(line: 136, column: 1, scope: !68)
!165 = distinct !DISubprogram(name: "badSink", scope: !69, file: !69, line: 44, type: !166, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!166 = !DISubroutineType(types: !167)
!167 = !{null, !60}
!168 = !DILocalVariable(name: "data", arg: 1, scope: !165, file: !69, line: 44, type: !60)
!169 = !DILocation(line: 44, column: 25, scope: !165)
!170 = !DILocalVariable(name: "i", scope: !171, file: !69, line: 47, type: !60)
!171 = distinct !DILexicalBlock(scope: !165, file: !69, line: 46, column: 5)
!172 = !DILocation(line: 47, column: 13, scope: !171)
!173 = !DILocalVariable(name: "buffer", scope: !171, file: !69, line: 48, type: !59)
!174 = !DILocation(line: 48, column: 15, scope: !171)
!175 = !DILocation(line: 48, column: 31, scope: !171)
!176 = !DILocation(line: 48, column: 24, scope: !171)
!177 = !DILocation(line: 49, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !69, line: 49, column: 13)
!179 = !DILocation(line: 49, column: 20, scope: !178)
!180 = !DILocation(line: 49, column: 13, scope: !171)
!181 = !DILocation(line: 49, column: 30, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !69, line: 49, column: 29)
!183 = !DILocation(line: 51, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !171, file: !69, line: 51, column: 9)
!185 = !DILocation(line: 51, column: 14, scope: !184)
!186 = !DILocation(line: 51, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !69, line: 51, column: 9)
!188 = !DILocation(line: 51, column: 23, scope: !187)
!189 = !DILocation(line: 51, column: 9, scope: !184)
!190 = !DILocation(line: 53, column: 13, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !69, line: 52, column: 9)
!192 = !DILocation(line: 53, column: 20, scope: !191)
!193 = !DILocation(line: 53, column: 23, scope: !191)
!194 = !DILocation(line: 54, column: 9, scope: !191)
!195 = !DILocation(line: 51, column: 30, scope: !187)
!196 = !DILocation(line: 51, column: 9, scope: !187)
!197 = distinct !{!197, !189, !198, !199}
!198 = !DILocation(line: 54, column: 9, scope: !184)
!199 = !{!"llvm.loop.mustprogress"}
!200 = !DILocation(line: 57, column: 13, scope: !201)
!201 = distinct !DILexicalBlock(scope: !171, file: !69, line: 57, column: 13)
!202 = !DILocation(line: 57, column: 18, scope: !201)
!203 = !DILocation(line: 57, column: 13, scope: !171)
!204 = !DILocation(line: 59, column: 13, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !69, line: 58, column: 9)
!206 = !DILocation(line: 59, column: 20, scope: !205)
!207 = !DILocation(line: 59, column: 26, scope: !205)
!208 = !DILocation(line: 61, column: 19, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !69, line: 61, column: 13)
!210 = !DILocation(line: 61, column: 17, scope: !209)
!211 = !DILocation(line: 61, column: 24, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !69, line: 61, column: 13)
!213 = !DILocation(line: 61, column: 26, scope: !212)
!214 = !DILocation(line: 61, column: 13, scope: !209)
!215 = !DILocation(line: 63, column: 30, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !69, line: 62, column: 13)
!217 = !DILocation(line: 63, column: 37, scope: !216)
!218 = !DILocation(line: 63, column: 17, scope: !216)
!219 = !DILocation(line: 64, column: 13, scope: !216)
!220 = !DILocation(line: 61, column: 33, scope: !212)
!221 = !DILocation(line: 61, column: 13, scope: !212)
!222 = distinct !{!222, !214, !223, !199}
!223 = !DILocation(line: 64, column: 13, scope: !209)
!224 = !DILocation(line: 65, column: 9, scope: !205)
!225 = !DILocation(line: 68, column: 13, scope: !226)
!226 = distinct !DILexicalBlock(scope: !201, file: !69, line: 67, column: 9)
!227 = !DILocation(line: 70, column: 14, scope: !171)
!228 = !DILocation(line: 70, column: 9, scope: !171)
!229 = !DILocation(line: 72, column: 1, scope: !165)
!230 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_good", scope: !69, file: !69, line: 278, type: !70, scopeLine: 279, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!231 = !DILocation(line: 280, column: 5, scope: !230)
!232 = !DILocation(line: 281, column: 5, scope: !230)
!233 = !DILocation(line: 282, column: 1, scope: !230)
!234 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 293, type: !235, scopeLine: 294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!235 = !DISubroutineType(types: !236)
!236 = !{!60, !60, !237}
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64)
!238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!239 = !DILocalVariable(name: "argc", arg: 1, scope: !234, file: !69, line: 293, type: !60)
!240 = !DILocation(line: 293, column: 14, scope: !234)
!241 = !DILocalVariable(name: "argv", arg: 2, scope: !234, file: !69, line: 293, type: !237)
!242 = !DILocation(line: 293, column: 27, scope: !234)
!243 = !DILocation(line: 296, column: 22, scope: !234)
!244 = !DILocation(line: 296, column: 12, scope: !234)
!245 = !DILocation(line: 296, column: 5, scope: !234)
!246 = !DILocation(line: 298, column: 5, scope: !234)
!247 = !DILocation(line: 299, column: 5, scope: !234)
!248 = !DILocation(line: 300, column: 5, scope: !234)
!249 = !DILocation(line: 303, column: 5, scope: !234)
!250 = !DILocation(line: 304, column: 5, scope: !234)
!251 = !DILocation(line: 305, column: 5, scope: !234)
!252 = !DILocation(line: 307, column: 5, scope: !234)
!253 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 214, type: !70, scopeLine: 215, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!254 = !DILocalVariable(name: "data", scope: !253, file: !69, line: 216, type: !60)
!255 = !DILocation(line: 216, column: 9, scope: !253)
!256 = !DILocation(line: 218, column: 10, scope: !253)
!257 = !DILocalVariable(name: "recvResult", scope: !258, file: !69, line: 224, type: !60)
!258 = distinct !DILexicalBlock(scope: !253, file: !69, line: 219, column: 5)
!259 = !DILocation(line: 224, column: 13, scope: !258)
!260 = !DILocalVariable(name: "service", scope: !258, file: !69, line: 225, type: !80)
!261 = !DILocation(line: 225, column: 28, scope: !258)
!262 = !DILocalVariable(name: "connectSocket", scope: !258, file: !69, line: 226, type: !60)
!263 = !DILocation(line: 226, column: 16, scope: !258)
!264 = !DILocalVariable(name: "inputBuffer", scope: !258, file: !69, line: 227, type: !55)
!265 = !DILocation(line: 227, column: 14, scope: !258)
!266 = !DILocation(line: 228, column: 9, scope: !258)
!267 = !DILocation(line: 238, column: 29, scope: !268)
!268 = distinct !DILexicalBlock(scope: !258, file: !69, line: 229, column: 9)
!269 = !DILocation(line: 238, column: 27, scope: !268)
!270 = !DILocation(line: 239, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !268, file: !69, line: 239, column: 17)
!272 = !DILocation(line: 239, column: 31, scope: !271)
!273 = !DILocation(line: 239, column: 17, scope: !268)
!274 = !DILocation(line: 241, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !69, line: 240, column: 13)
!276 = !DILocation(line: 243, column: 13, scope: !268)
!277 = !DILocation(line: 244, column: 21, scope: !268)
!278 = !DILocation(line: 244, column: 32, scope: !268)
!279 = !DILocation(line: 245, column: 39, scope: !268)
!280 = !DILocation(line: 245, column: 21, scope: !268)
!281 = !DILocation(line: 245, column: 30, scope: !268)
!282 = !DILocation(line: 245, column: 37, scope: !268)
!283 = !DILocation(line: 246, column: 32, scope: !268)
!284 = !DILocation(line: 246, column: 21, scope: !268)
!285 = !DILocation(line: 246, column: 30, scope: !268)
!286 = !DILocation(line: 247, column: 25, scope: !287)
!287 = distinct !DILexicalBlock(scope: !268, file: !69, line: 247, column: 17)
!288 = !DILocation(line: 247, column: 40, scope: !287)
!289 = !DILocation(line: 247, column: 17, scope: !287)
!290 = !DILocation(line: 247, column: 85, scope: !287)
!291 = !DILocation(line: 247, column: 17, scope: !268)
!292 = !DILocation(line: 249, column: 17, scope: !293)
!293 = distinct !DILexicalBlock(scope: !287, file: !69, line: 248, column: 13)
!294 = !DILocation(line: 253, column: 31, scope: !268)
!295 = !DILocation(line: 253, column: 46, scope: !268)
!296 = !DILocation(line: 253, column: 26, scope: !268)
!297 = !DILocation(line: 253, column: 24, scope: !268)
!298 = !DILocation(line: 254, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !268, file: !69, line: 254, column: 17)
!300 = !DILocation(line: 254, column: 28, scope: !299)
!301 = !DILocation(line: 254, column: 44, scope: !299)
!302 = !DILocation(line: 254, column: 47, scope: !299)
!303 = !DILocation(line: 254, column: 58, scope: !299)
!304 = !DILocation(line: 254, column: 17, scope: !268)
!305 = !DILocation(line: 256, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !299, file: !69, line: 255, column: 13)
!307 = !DILocation(line: 259, column: 25, scope: !268)
!308 = !DILocation(line: 259, column: 13, scope: !268)
!309 = !DILocation(line: 259, column: 37, scope: !268)
!310 = !DILocation(line: 261, column: 25, scope: !268)
!311 = !DILocation(line: 261, column: 20, scope: !268)
!312 = !DILocation(line: 261, column: 18, scope: !268)
!313 = !DILocation(line: 262, column: 9, scope: !268)
!314 = !DILocation(line: 264, column: 13, scope: !315)
!315 = distinct !DILexicalBlock(scope: !258, file: !69, line: 264, column: 13)
!316 = !DILocation(line: 264, column: 27, scope: !315)
!317 = !DILocation(line: 264, column: 13, scope: !258)
!318 = !DILocation(line: 266, column: 26, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !69, line: 265, column: 9)
!320 = !DILocation(line: 266, column: 13, scope: !319)
!321 = !DILocation(line: 267, column: 9, scope: !319)
!322 = !DILocation(line: 275, column: 17, scope: !253)
!323 = !DILocation(line: 275, column: 5, scope: !253)
!324 = !DILocation(line: 276, column: 1, scope: !253)
!325 = distinct !DISubprogram(name: "goodB2GSink", scope: !69, file: !69, line: 185, type: !166, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!326 = !DILocalVariable(name: "data", arg: 1, scope: !325, file: !69, line: 185, type: !60)
!327 = !DILocation(line: 185, column: 29, scope: !325)
!328 = !DILocalVariable(name: "i", scope: !329, file: !69, line: 188, type: !60)
!329 = distinct !DILexicalBlock(scope: !325, file: !69, line: 187, column: 5)
!330 = !DILocation(line: 188, column: 13, scope: !329)
!331 = !DILocalVariable(name: "buffer", scope: !329, file: !69, line: 189, type: !59)
!332 = !DILocation(line: 189, column: 15, scope: !329)
!333 = !DILocation(line: 189, column: 31, scope: !329)
!334 = !DILocation(line: 189, column: 24, scope: !329)
!335 = !DILocation(line: 190, column: 13, scope: !336)
!336 = distinct !DILexicalBlock(scope: !329, file: !69, line: 190, column: 13)
!337 = !DILocation(line: 190, column: 20, scope: !336)
!338 = !DILocation(line: 190, column: 13, scope: !329)
!339 = !DILocation(line: 190, column: 30, scope: !340)
!340 = distinct !DILexicalBlock(scope: !336, file: !69, line: 190, column: 29)
!341 = !DILocation(line: 192, column: 16, scope: !342)
!342 = distinct !DILexicalBlock(scope: !329, file: !69, line: 192, column: 9)
!343 = !DILocation(line: 192, column: 14, scope: !342)
!344 = !DILocation(line: 192, column: 21, scope: !345)
!345 = distinct !DILexicalBlock(scope: !342, file: !69, line: 192, column: 9)
!346 = !DILocation(line: 192, column: 23, scope: !345)
!347 = !DILocation(line: 192, column: 9, scope: !342)
!348 = !DILocation(line: 194, column: 13, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !69, line: 193, column: 9)
!350 = !DILocation(line: 194, column: 20, scope: !349)
!351 = !DILocation(line: 194, column: 23, scope: !349)
!352 = !DILocation(line: 195, column: 9, scope: !349)
!353 = !DILocation(line: 192, column: 30, scope: !345)
!354 = !DILocation(line: 192, column: 9, scope: !345)
!355 = distinct !{!355, !347, !356, !199}
!356 = !DILocation(line: 195, column: 9, scope: !342)
!357 = !DILocation(line: 197, column: 13, scope: !358)
!358 = distinct !DILexicalBlock(scope: !329, file: !69, line: 197, column: 13)
!359 = !DILocation(line: 197, column: 18, scope: !358)
!360 = !DILocation(line: 197, column: 23, scope: !358)
!361 = !DILocation(line: 197, column: 26, scope: !358)
!362 = !DILocation(line: 197, column: 31, scope: !358)
!363 = !DILocation(line: 197, column: 13, scope: !329)
!364 = !DILocation(line: 199, column: 13, scope: !365)
!365 = distinct !DILexicalBlock(scope: !358, file: !69, line: 198, column: 9)
!366 = !DILocation(line: 199, column: 20, scope: !365)
!367 = !DILocation(line: 199, column: 26, scope: !365)
!368 = !DILocation(line: 201, column: 19, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !69, line: 201, column: 13)
!370 = !DILocation(line: 201, column: 17, scope: !369)
!371 = !DILocation(line: 201, column: 24, scope: !372)
!372 = distinct !DILexicalBlock(scope: !369, file: !69, line: 201, column: 13)
!373 = !DILocation(line: 201, column: 26, scope: !372)
!374 = !DILocation(line: 201, column: 13, scope: !369)
!375 = !DILocation(line: 203, column: 30, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !69, line: 202, column: 13)
!377 = !DILocation(line: 203, column: 37, scope: !376)
!378 = !DILocation(line: 203, column: 17, scope: !376)
!379 = !DILocation(line: 204, column: 13, scope: !376)
!380 = !DILocation(line: 201, column: 33, scope: !372)
!381 = !DILocation(line: 201, column: 13, scope: !372)
!382 = distinct !{!382, !374, !383, !199}
!383 = !DILocation(line: 204, column: 13, scope: !369)
!384 = !DILocation(line: 205, column: 9, scope: !365)
!385 = !DILocation(line: 208, column: 13, scope: !386)
!386 = distinct !DILexicalBlock(scope: !358, file: !69, line: 207, column: 9)
!387 = !DILocation(line: 210, column: 14, scope: !329)
!388 = !DILocation(line: 210, column: 9, scope: !329)
!389 = !DILocation(line: 212, column: 1, scope: !325)
!390 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 173, type: !70, scopeLine: 174, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!391 = !DILocalVariable(name: "data", scope: !390, file: !69, line: 175, type: !60)
!392 = !DILocation(line: 175, column: 9, scope: !390)
!393 = !DILocation(line: 177, column: 10, scope: !390)
!394 = !DILocation(line: 180, column: 10, scope: !390)
!395 = !DILocation(line: 181, column: 17, scope: !390)
!396 = !DILocation(line: 181, column: 5, scope: !390)
!397 = !DILocation(line: 182, column: 1, scope: !390)
!398 = distinct !DISubprogram(name: "goodG2BSink", scope: !69, file: !69, line: 143, type: !166, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!399 = !DILocalVariable(name: "data", arg: 1, scope: !398, file: !69, line: 143, type: !60)
!400 = !DILocation(line: 143, column: 29, scope: !398)
!401 = !DILocalVariable(name: "i", scope: !402, file: !69, line: 146, type: !60)
!402 = distinct !DILexicalBlock(scope: !398, file: !69, line: 145, column: 5)
!403 = !DILocation(line: 146, column: 13, scope: !402)
!404 = !DILocalVariable(name: "buffer", scope: !402, file: !69, line: 147, type: !59)
!405 = !DILocation(line: 147, column: 15, scope: !402)
!406 = !DILocation(line: 147, column: 31, scope: !402)
!407 = !DILocation(line: 147, column: 24, scope: !402)
!408 = !DILocation(line: 148, column: 13, scope: !409)
!409 = distinct !DILexicalBlock(scope: !402, file: !69, line: 148, column: 13)
!410 = !DILocation(line: 148, column: 20, scope: !409)
!411 = !DILocation(line: 148, column: 13, scope: !402)
!412 = !DILocation(line: 148, column: 30, scope: !413)
!413 = distinct !DILexicalBlock(scope: !409, file: !69, line: 148, column: 29)
!414 = !DILocation(line: 150, column: 16, scope: !415)
!415 = distinct !DILexicalBlock(scope: !402, file: !69, line: 150, column: 9)
!416 = !DILocation(line: 150, column: 14, scope: !415)
!417 = !DILocation(line: 150, column: 21, scope: !418)
!418 = distinct !DILexicalBlock(scope: !415, file: !69, line: 150, column: 9)
!419 = !DILocation(line: 150, column: 23, scope: !418)
!420 = !DILocation(line: 150, column: 9, scope: !415)
!421 = !DILocation(line: 152, column: 13, scope: !422)
!422 = distinct !DILexicalBlock(scope: !418, file: !69, line: 151, column: 9)
!423 = !DILocation(line: 152, column: 20, scope: !422)
!424 = !DILocation(line: 152, column: 23, scope: !422)
!425 = !DILocation(line: 153, column: 9, scope: !422)
!426 = !DILocation(line: 150, column: 30, scope: !418)
!427 = !DILocation(line: 150, column: 9, scope: !418)
!428 = distinct !{!428, !420, !429, !199}
!429 = !DILocation(line: 153, column: 9, scope: !415)
!430 = !DILocation(line: 156, column: 13, scope: !431)
!431 = distinct !DILexicalBlock(scope: !402, file: !69, line: 156, column: 13)
!432 = !DILocation(line: 156, column: 18, scope: !431)
!433 = !DILocation(line: 156, column: 13, scope: !402)
!434 = !DILocation(line: 158, column: 13, scope: !435)
!435 = distinct !DILexicalBlock(scope: !431, file: !69, line: 157, column: 9)
!436 = !DILocation(line: 158, column: 20, scope: !435)
!437 = !DILocation(line: 158, column: 26, scope: !435)
!438 = !DILocation(line: 160, column: 19, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !69, line: 160, column: 13)
!440 = !DILocation(line: 160, column: 17, scope: !439)
!441 = !DILocation(line: 160, column: 24, scope: !442)
!442 = distinct !DILexicalBlock(scope: !439, file: !69, line: 160, column: 13)
!443 = !DILocation(line: 160, column: 26, scope: !442)
!444 = !DILocation(line: 160, column: 13, scope: !439)
!445 = !DILocation(line: 162, column: 30, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !69, line: 161, column: 13)
!447 = !DILocation(line: 162, column: 37, scope: !446)
!448 = !DILocation(line: 162, column: 17, scope: !446)
!449 = !DILocation(line: 163, column: 13, scope: !446)
!450 = !DILocation(line: 160, column: 33, scope: !442)
!451 = !DILocation(line: 160, column: 13, scope: !442)
!452 = distinct !{!452, !444, !453, !199}
!453 = !DILocation(line: 163, column: 13, scope: !439)
!454 = !DILocation(line: 164, column: 9, scope: !435)
!455 = !DILocation(line: 167, column: 13, scope: !456)
!456 = distinct !DILexicalBlock(scope: !431, file: !69, line: 166, column: 9)
!457 = !DILocation(line: 169, column: 14, scope: !402)
!458 = !DILocation(line: 169, column: 9, scope: !402)
!459 = !DILocation(line: 171, column: 1, scope: !398)
