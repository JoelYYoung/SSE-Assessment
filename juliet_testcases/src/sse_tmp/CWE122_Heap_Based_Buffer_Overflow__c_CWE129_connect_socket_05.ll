; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !65
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_05_bad() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  %0 = load i32, i32* @staticTrue, align 4, !dbg !81
  %tobool = icmp ne i32 %0, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.end22, !dbg !83

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !84, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !88, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %connectSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  br label %do.body, !dbg !115

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !116
  store i32 %call, i32* %connectSocket, align 4, !dbg !118
  %1 = load i32, i32* %connectSocket, align 4, !dbg !119
  %cmp = icmp eq i32 %1, -1, !dbg !121
  br i1 %cmp, label %if.then1, label %if.end, !dbg !122

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !123

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !125
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !126
  store i16 2, i16* %sin_family, align 4, !dbg !127
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !128
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !129
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !130
  store i32 %call2, i32* %s_addr, align 4, !dbg !131
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !132
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !133
  store i16 %call3, i16* %sin_port, align 2, !dbg !134
  %3 = load i32, i32* %connectSocket, align 4, !dbg !135
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !137
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !138
  %cmp5 = icmp eq i32 %call4, -1, !dbg !139
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !140

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !141

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !143
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !144
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !145
  %conv = trunc i64 %call8 to i32, !dbg !145
  store i32 %conv, i32* %recvResult, align 4, !dbg !146
  %6 = load i32, i32* %recvResult, align 4, !dbg !147
  %cmp9 = icmp eq i32 %6, -1, !dbg !149
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !150

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !151
  %cmp11 = icmp eq i32 %7, 0, !dbg !152
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !153

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !154

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !156
  %idxprom = sext i32 %8 to i64, !dbg !157
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !157
  store i8 0, i8* %arrayidx, align 1, !dbg !158
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %call16 = call i32 @atoi(i8* %arraydecay15) #10, !dbg !160
  store i32 %call16, i32* %data, align 4, !dbg !161
  br label %do.end, !dbg !162

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !163
  %cmp17 = icmp ne i32 %9, -1, !dbg !165
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !166

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !167
  %call20 = call i32 @close(i32 %10), !dbg !169
  br label %if.end21, !dbg !170

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !171

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @staticTrue, align 4, !dbg !172
  %tobool23 = icmp ne i32 %11, 0, !dbg !172
  br i1 %tobool23, label %if.then24, label %if.end49, !dbg !174

if.then24:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !175, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !179, metadata !DIExpression()), !dbg !180
  %call25 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !181
  %12 = bitcast i8* %call25 to i32*, !dbg !182
  store i32* %12, i32** %buffer, align 8, !dbg !180
  %13 = load i32*, i32** %buffer, align 8, !dbg !183
  %cmp26 = icmp eq i32* %13, null, !dbg !185
  br i1 %cmp26, label %if.then28, label %if.end29, !dbg !186

if.then28:                                        ; preds = %if.then24
  call void @exit(i32 -1) #11, !dbg !187
  unreachable, !dbg !187

if.end29:                                         ; preds = %if.then24
  store i32 0, i32* %i, align 4, !dbg !189
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc, %if.end29
  %14 = load i32, i32* %i, align 4, !dbg !192
  %cmp30 = icmp slt i32 %14, 10, !dbg !194
  br i1 %cmp30, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !196
  %16 = load i32, i32* %i, align 4, !dbg !198
  %idxprom32 = sext i32 %16 to i64, !dbg !196
  %arrayidx33 = getelementptr inbounds i32, i32* %15, i64 %idxprom32, !dbg !196
  store i32 0, i32* %arrayidx33, align 4, !dbg !199
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !201
  %inc = add nsw i32 %17, 1, !dbg !201
  store i32 %inc, i32* %i, align 4, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !206
  %cmp34 = icmp sge i32 %18, 0, !dbg !208
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !209

if.then36:                                        ; preds = %for.end
  %19 = load i32*, i32** %buffer, align 8, !dbg !210
  %20 = load i32, i32* %data, align 4, !dbg !212
  %idxprom37 = sext i32 %20 to i64, !dbg !210
  %arrayidx38 = getelementptr inbounds i32, i32* %19, i64 %idxprom37, !dbg !210
  store i32 1, i32* %arrayidx38, align 4, !dbg !213
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond39, !dbg !216

for.cond39:                                       ; preds = %for.inc45, %if.then36
  %21 = load i32, i32* %i, align 4, !dbg !217
  %cmp40 = icmp slt i32 %21, 10, !dbg !219
  br i1 %cmp40, label %for.body42, label %for.end47, !dbg !220

for.body42:                                       ; preds = %for.cond39
  %22 = load i32*, i32** %buffer, align 8, !dbg !221
  %23 = load i32, i32* %i, align 4, !dbg !223
  %idxprom43 = sext i32 %23 to i64, !dbg !221
  %arrayidx44 = getelementptr inbounds i32, i32* %22, i64 %idxprom43, !dbg !221
  %24 = load i32, i32* %arrayidx44, align 4, !dbg !221
  call void @printIntLine(i32 %24), !dbg !224
  br label %for.inc45, !dbg !225

for.inc45:                                        ; preds = %for.body42
  %25 = load i32, i32* %i, align 4, !dbg !226
  %inc46 = add nsw i32 %25, 1, !dbg !226
  store i32 %inc46, i32* %i, align 4, !dbg !226
  br label %for.cond39, !dbg !227, !llvm.loop !228

for.end47:                                        ; preds = %for.cond39
  br label %if.end48, !dbg !230

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !231
  br label %if.end48

if.end48:                                         ; preds = %if.else, %for.end47
  %26 = load i32*, i32** %buffer, align 8, !dbg !233
  %27 = bitcast i32* %26 to i8*, !dbg !233
  call void @free(i8* %27) #8, !dbg !234
  br label %if.end49, !dbg !235

if.end49:                                         ; preds = %if.end48, %if.end22
  ret void, !dbg !236
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_05_good() #0 !dbg !237 {
entry:
  call void @goodB2G1(), !dbg !238
  call void @goodB2G2(), !dbg !239
  call void @goodG2B1(), !dbg !240
  call void @goodG2B2(), !dbg !241
  ret void, !dbg !242
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !243 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !248, metadata !DIExpression()), !dbg !249
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !250, metadata !DIExpression()), !dbg !251
  %call = call i64 @time(i64* null) #8, !dbg !252
  %conv = trunc i64 %call to i32, !dbg !253
  call void @srand(i32 %conv) #8, !dbg !254
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !255
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_05_good(), !dbg !256
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !257
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !258
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_05_bad(), !dbg !259
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !260
  ret i32 0, !dbg !261
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !262 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !263, metadata !DIExpression()), !dbg !264
  store i32 -1, i32* %data, align 4, !dbg !265
  %0 = load i32, i32* @staticTrue, align 4, !dbg !266
  %tobool = icmp ne i32 %0, 0, !dbg !266
  br i1 %tobool, label %if.then, label %if.end22, !dbg !268

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !269, metadata !DIExpression()), !dbg !272
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !273, metadata !DIExpression()), !dbg !274
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !275, metadata !DIExpression()), !dbg !276
  store i32 -1, i32* %connectSocket, align 4, !dbg !276
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !277, metadata !DIExpression()), !dbg !278
  br label %do.body, !dbg !279

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !280
  store i32 %call, i32* %connectSocket, align 4, !dbg !282
  %1 = load i32, i32* %connectSocket, align 4, !dbg !283
  %cmp = icmp eq i32 %1, -1, !dbg !285
  br i1 %cmp, label %if.then1, label %if.end, !dbg !286

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !287

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !289
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !289
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !290
  store i16 2, i16* %sin_family, align 4, !dbg !291
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !292
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !293
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !294
  store i32 %call2, i32* %s_addr, align 4, !dbg !295
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !296
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !297
  store i16 %call3, i16* %sin_port, align 2, !dbg !298
  %3 = load i32, i32* %connectSocket, align 4, !dbg !299
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !301
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !302
  %cmp5 = icmp eq i32 %call4, -1, !dbg !303
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !304

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !305

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !307
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !308
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !309
  %conv = trunc i64 %call8 to i32, !dbg !309
  store i32 %conv, i32* %recvResult, align 4, !dbg !310
  %6 = load i32, i32* %recvResult, align 4, !dbg !311
  %cmp9 = icmp eq i32 %6, -1, !dbg !313
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !314

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !315
  %cmp11 = icmp eq i32 %7, 0, !dbg !316
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !317

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !318

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !320
  %idxprom = sext i32 %8 to i64, !dbg !321
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !321
  store i8 0, i8* %arrayidx, align 1, !dbg !322
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !323
  %call16 = call i32 @atoi(i8* %arraydecay15) #10, !dbg !324
  store i32 %call16, i32* %data, align 4, !dbg !325
  br label %do.end, !dbg !326

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !327
  %cmp17 = icmp ne i32 %9, -1, !dbg !329
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !330

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !331
  %call20 = call i32 @close(i32 %10), !dbg !333
  br label %if.end21, !dbg !334

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !335

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @staticFalse, align 4, !dbg !336
  %tobool23 = icmp ne i32 %11, 0, !dbg !336
  br i1 %tobool23, label %if.then24, label %if.else, !dbg !338

if.then24:                                        ; preds = %if.end22
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !339
  br label %if.end52, !dbg !341

if.else:                                          ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !342, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !346, metadata !DIExpression()), !dbg !347
  %call25 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !348
  %12 = bitcast i8* %call25 to i32*, !dbg !349
  store i32* %12, i32** %buffer, align 8, !dbg !347
  %13 = load i32*, i32** %buffer, align 8, !dbg !350
  %cmp26 = icmp eq i32* %13, null, !dbg !352
  br i1 %cmp26, label %if.then28, label %if.end29, !dbg !353

if.then28:                                        ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !354
  unreachable, !dbg !354

if.end29:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !356
  br label %for.cond, !dbg !358

for.cond:                                         ; preds = %for.inc, %if.end29
  %14 = load i32, i32* %i, align 4, !dbg !359
  %cmp30 = icmp slt i32 %14, 10, !dbg !361
  br i1 %cmp30, label %for.body, label %for.end, !dbg !362

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !363
  %16 = load i32, i32* %i, align 4, !dbg !365
  %idxprom32 = sext i32 %16 to i64, !dbg !363
  %arrayidx33 = getelementptr inbounds i32, i32* %15, i64 %idxprom32, !dbg !363
  store i32 0, i32* %arrayidx33, align 4, !dbg !366
  br label %for.inc, !dbg !367

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !368
  %inc = add nsw i32 %17, 1, !dbg !368
  store i32 %inc, i32* %i, align 4, !dbg !368
  br label %for.cond, !dbg !369, !llvm.loop !370

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !372
  %cmp34 = icmp sge i32 %18, 0, !dbg !374
  br i1 %cmp34, label %land.lhs.true, label %if.else50, !dbg !375

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* %data, align 4, !dbg !376
  %cmp36 = icmp slt i32 %19, 10, !dbg !377
  br i1 %cmp36, label %if.then38, label %if.else50, !dbg !378

if.then38:                                        ; preds = %land.lhs.true
  %20 = load i32*, i32** %buffer, align 8, !dbg !379
  %21 = load i32, i32* %data, align 4, !dbg !381
  %idxprom39 = sext i32 %21 to i64, !dbg !379
  %arrayidx40 = getelementptr inbounds i32, i32* %20, i64 %idxprom39, !dbg !379
  store i32 1, i32* %arrayidx40, align 4, !dbg !382
  store i32 0, i32* %i, align 4, !dbg !383
  br label %for.cond41, !dbg !385

for.cond41:                                       ; preds = %for.inc47, %if.then38
  %22 = load i32, i32* %i, align 4, !dbg !386
  %cmp42 = icmp slt i32 %22, 10, !dbg !388
  br i1 %cmp42, label %for.body44, label %for.end49, !dbg !389

for.body44:                                       ; preds = %for.cond41
  %23 = load i32*, i32** %buffer, align 8, !dbg !390
  %24 = load i32, i32* %i, align 4, !dbg !392
  %idxprom45 = sext i32 %24 to i64, !dbg !390
  %arrayidx46 = getelementptr inbounds i32, i32* %23, i64 %idxprom45, !dbg !390
  %25 = load i32, i32* %arrayidx46, align 4, !dbg !390
  call void @printIntLine(i32 %25), !dbg !393
  br label %for.inc47, !dbg !394

for.inc47:                                        ; preds = %for.body44
  %26 = load i32, i32* %i, align 4, !dbg !395
  %inc48 = add nsw i32 %26, 1, !dbg !395
  store i32 %inc48, i32* %i, align 4, !dbg !395
  br label %for.cond41, !dbg !396, !llvm.loop !397

for.end49:                                        ; preds = %for.cond41
  br label %if.end51, !dbg !399

if.else50:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !400
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %for.end49
  %27 = load i32*, i32** %buffer, align 8, !dbg !402
  %28 = bitcast i32* %27 to i8*, !dbg !402
  call void @free(i8* %28) #8, !dbg !403
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.then24
  ret void, !dbg !404
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !405 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !406, metadata !DIExpression()), !dbg !407
  store i32 -1, i32* %data, align 4, !dbg !408
  %0 = load i32, i32* @staticTrue, align 4, !dbg !409
  %tobool = icmp ne i32 %0, 0, !dbg !409
  br i1 %tobool, label %if.then, label %if.end22, !dbg !411

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !412, metadata !DIExpression()), !dbg !415
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !416, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !418, metadata !DIExpression()), !dbg !419
  store i32 -1, i32* %connectSocket, align 4, !dbg !419
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !420, metadata !DIExpression()), !dbg !421
  br label %do.body, !dbg !422

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !423
  store i32 %call, i32* %connectSocket, align 4, !dbg !425
  %1 = load i32, i32* %connectSocket, align 4, !dbg !426
  %cmp = icmp eq i32 %1, -1, !dbg !428
  br i1 %cmp, label %if.then1, label %if.end, !dbg !429

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !430

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !432
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !432
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !433
  store i16 2, i16* %sin_family, align 4, !dbg !434
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !435
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !436
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !437
  store i32 %call2, i32* %s_addr, align 4, !dbg !438
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !439
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !440
  store i16 %call3, i16* %sin_port, align 2, !dbg !441
  %3 = load i32, i32* %connectSocket, align 4, !dbg !442
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !444
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !445
  %cmp5 = icmp eq i32 %call4, -1, !dbg !446
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !447

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !448

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !450
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !451
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !452
  %conv = trunc i64 %call8 to i32, !dbg !452
  store i32 %conv, i32* %recvResult, align 4, !dbg !453
  %6 = load i32, i32* %recvResult, align 4, !dbg !454
  %cmp9 = icmp eq i32 %6, -1, !dbg !456
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !457

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !458
  %cmp11 = icmp eq i32 %7, 0, !dbg !459
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !460

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !461

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !463
  %idxprom = sext i32 %8 to i64, !dbg !464
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !464
  store i8 0, i8* %arrayidx, align 1, !dbg !465
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !466
  %call16 = call i32 @atoi(i8* %arraydecay15) #10, !dbg !467
  store i32 %call16, i32* %data, align 4, !dbg !468
  br label %do.end, !dbg !469

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !470
  %cmp17 = icmp ne i32 %9, -1, !dbg !472
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !473

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !474
  %call20 = call i32 @close(i32 %10), !dbg !476
  br label %if.end21, !dbg !477

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !478

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @staticTrue, align 4, !dbg !479
  %tobool23 = icmp ne i32 %11, 0, !dbg !479
  br i1 %tobool23, label %if.then24, label %if.end51, !dbg !481

if.then24:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !482, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !486, metadata !DIExpression()), !dbg !487
  %call25 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !488
  %12 = bitcast i8* %call25 to i32*, !dbg !489
  store i32* %12, i32** %buffer, align 8, !dbg !487
  %13 = load i32*, i32** %buffer, align 8, !dbg !490
  %cmp26 = icmp eq i32* %13, null, !dbg !492
  br i1 %cmp26, label %if.then28, label %if.end29, !dbg !493

if.then28:                                        ; preds = %if.then24
  call void @exit(i32 -1) #11, !dbg !494
  unreachable, !dbg !494

if.end29:                                         ; preds = %if.then24
  store i32 0, i32* %i, align 4, !dbg !496
  br label %for.cond, !dbg !498

for.cond:                                         ; preds = %for.inc, %if.end29
  %14 = load i32, i32* %i, align 4, !dbg !499
  %cmp30 = icmp slt i32 %14, 10, !dbg !501
  br i1 %cmp30, label %for.body, label %for.end, !dbg !502

for.body:                                         ; preds = %for.cond
  %15 = load i32*, i32** %buffer, align 8, !dbg !503
  %16 = load i32, i32* %i, align 4, !dbg !505
  %idxprom32 = sext i32 %16 to i64, !dbg !503
  %arrayidx33 = getelementptr inbounds i32, i32* %15, i64 %idxprom32, !dbg !503
  store i32 0, i32* %arrayidx33, align 4, !dbg !506
  br label %for.inc, !dbg !507

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !508
  %inc = add nsw i32 %17, 1, !dbg !508
  store i32 %inc, i32* %i, align 4, !dbg !508
  br label %for.cond, !dbg !509, !llvm.loop !510

for.end:                                          ; preds = %for.cond
  %18 = load i32, i32* %data, align 4, !dbg !512
  %cmp34 = icmp sge i32 %18, 0, !dbg !514
  br i1 %cmp34, label %land.lhs.true, label %if.else, !dbg !515

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* %data, align 4, !dbg !516
  %cmp36 = icmp slt i32 %19, 10, !dbg !517
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !518

if.then38:                                        ; preds = %land.lhs.true
  %20 = load i32*, i32** %buffer, align 8, !dbg !519
  %21 = load i32, i32* %data, align 4, !dbg !521
  %idxprom39 = sext i32 %21 to i64, !dbg !519
  %arrayidx40 = getelementptr inbounds i32, i32* %20, i64 %idxprom39, !dbg !519
  store i32 1, i32* %arrayidx40, align 4, !dbg !522
  store i32 0, i32* %i, align 4, !dbg !523
  br label %for.cond41, !dbg !525

for.cond41:                                       ; preds = %for.inc47, %if.then38
  %22 = load i32, i32* %i, align 4, !dbg !526
  %cmp42 = icmp slt i32 %22, 10, !dbg !528
  br i1 %cmp42, label %for.body44, label %for.end49, !dbg !529

for.body44:                                       ; preds = %for.cond41
  %23 = load i32*, i32** %buffer, align 8, !dbg !530
  %24 = load i32, i32* %i, align 4, !dbg !532
  %idxprom45 = sext i32 %24 to i64, !dbg !530
  %arrayidx46 = getelementptr inbounds i32, i32* %23, i64 %idxprom45, !dbg !530
  %25 = load i32, i32* %arrayidx46, align 4, !dbg !530
  call void @printIntLine(i32 %25), !dbg !533
  br label %for.inc47, !dbg !534

for.inc47:                                        ; preds = %for.body44
  %26 = load i32, i32* %i, align 4, !dbg !535
  %inc48 = add nsw i32 %26, 1, !dbg !535
  store i32 %inc48, i32* %i, align 4, !dbg !535
  br label %for.cond41, !dbg !536, !llvm.loop !537

for.end49:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !539

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !540
  br label %if.end50

if.end50:                                         ; preds = %if.else, %for.end49
  %27 = load i32*, i32** %buffer, align 8, !dbg !542
  %28 = bitcast i32* %27 to i8*, !dbg !542
  call void @free(i8* %28) #8, !dbg !543
  br label %if.end51, !dbg !544

if.end51:                                         ; preds = %if.end50, %if.end22
  ret void, !dbg !545
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !546 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !547, metadata !DIExpression()), !dbg !548
  store i32 -1, i32* %data, align 4, !dbg !549
  %0 = load i32, i32* @staticFalse, align 4, !dbg !550
  %tobool = icmp ne i32 %0, 0, !dbg !550
  br i1 %tobool, label %if.then, label %if.else, !dbg !552

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !553
  br label %if.end, !dbg !555

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !556
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !558
  %tobool1 = icmp ne i32 %1, 0, !dbg !558
  br i1 %tobool1, label %if.then2, label %if.end20, !dbg !560

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !561, metadata !DIExpression()), !dbg !564
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !565, metadata !DIExpression()), !dbg !566
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !567
  %2 = bitcast i8* %call to i32*, !dbg !568
  store i32* %2, i32** %buffer, align 8, !dbg !566
  %3 = load i32*, i32** %buffer, align 8, !dbg !569
  %cmp = icmp eq i32* %3, null, !dbg !571
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !572

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !573
  unreachable, !dbg !573

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !575
  br label %for.cond, !dbg !577

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !578
  %cmp5 = icmp slt i32 %4, 10, !dbg !580
  br i1 %cmp5, label %for.body, label %for.end, !dbg !581

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !582
  %6 = load i32, i32* %i, align 4, !dbg !584
  %idxprom = sext i32 %6 to i64, !dbg !582
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !582
  store i32 0, i32* %arrayidx, align 4, !dbg !585
  br label %for.inc, !dbg !586

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !587
  %inc = add nsw i32 %7, 1, !dbg !587
  store i32 %inc, i32* %i, align 4, !dbg !587
  br label %for.cond, !dbg !588, !llvm.loop !589

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !591
  %cmp6 = icmp sge i32 %8, 0, !dbg !593
  br i1 %cmp6, label %if.then7, label %if.else18, !dbg !594

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !595
  %10 = load i32, i32* %data, align 4, !dbg !597
  %idxprom8 = sext i32 %10 to i64, !dbg !595
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !595
  store i32 1, i32* %arrayidx9, align 4, !dbg !598
  store i32 0, i32* %i, align 4, !dbg !599
  br label %for.cond10, !dbg !601

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !602
  %cmp11 = icmp slt i32 %11, 10, !dbg !604
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !605

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !606
  %13 = load i32, i32* %i, align 4, !dbg !608
  %idxprom13 = sext i32 %13 to i64, !dbg !606
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !606
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !606
  call void @printIntLine(i32 %14), !dbg !609
  br label %for.inc15, !dbg !610

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !611
  %inc16 = add nsw i32 %15, 1, !dbg !611
  store i32 %inc16, i32* %i, align 4, !dbg !611
  br label %for.cond10, !dbg !612, !llvm.loop !613

for.end17:                                        ; preds = %for.cond10
  br label %if.end19, !dbg !615

if.else18:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !616
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !618
  %17 = bitcast i32* %16 to i8*, !dbg !618
  call void @free(i8* %17) #8, !dbg !619
  br label %if.end20, !dbg !620

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !621
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !622 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !623, metadata !DIExpression()), !dbg !624
  store i32 -1, i32* %data, align 4, !dbg !625
  %0 = load i32, i32* @staticTrue, align 4, !dbg !626
  %tobool = icmp ne i32 %0, 0, !dbg !626
  br i1 %tobool, label %if.then, label %if.end, !dbg !628

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !629
  br label %if.end, !dbg !631

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !632
  %tobool1 = icmp ne i32 %1, 0, !dbg !632
  br i1 %tobool1, label %if.then2, label %if.end19, !dbg !634

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !635, metadata !DIExpression()), !dbg !638
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !639, metadata !DIExpression()), !dbg !640
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !641
  %2 = bitcast i8* %call to i32*, !dbg !642
  store i32* %2, i32** %buffer, align 8, !dbg !640
  %3 = load i32*, i32** %buffer, align 8, !dbg !643
  %cmp = icmp eq i32* %3, null, !dbg !645
  br i1 %cmp, label %if.then3, label %if.end4, !dbg !646

if.then3:                                         ; preds = %if.then2
  call void @exit(i32 -1) #11, !dbg !647
  unreachable, !dbg !647

if.end4:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !649
  br label %for.cond, !dbg !651

for.cond:                                         ; preds = %for.inc, %if.end4
  %4 = load i32, i32* %i, align 4, !dbg !652
  %cmp5 = icmp slt i32 %4, 10, !dbg !654
  br i1 %cmp5, label %for.body, label %for.end, !dbg !655

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !656
  %6 = load i32, i32* %i, align 4, !dbg !658
  %idxprom = sext i32 %6 to i64, !dbg !656
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !656
  store i32 0, i32* %arrayidx, align 4, !dbg !659
  br label %for.inc, !dbg !660

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !661
  %inc = add nsw i32 %7, 1, !dbg !661
  store i32 %inc, i32* %i, align 4, !dbg !661
  br label %for.cond, !dbg !662, !llvm.loop !663

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !665
  %cmp6 = icmp sge i32 %8, 0, !dbg !667
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !668

if.then7:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !669
  %10 = load i32, i32* %data, align 4, !dbg !671
  %idxprom8 = sext i32 %10 to i64, !dbg !669
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i64 %idxprom8, !dbg !669
  store i32 1, i32* %arrayidx9, align 4, !dbg !672
  store i32 0, i32* %i, align 4, !dbg !673
  br label %for.cond10, !dbg !675

for.cond10:                                       ; preds = %for.inc15, %if.then7
  %11 = load i32, i32* %i, align 4, !dbg !676
  %cmp11 = icmp slt i32 %11, 10, !dbg !678
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !679

for.body12:                                       ; preds = %for.cond10
  %12 = load i32*, i32** %buffer, align 8, !dbg !680
  %13 = load i32, i32* %i, align 4, !dbg !682
  %idxprom13 = sext i32 %13 to i64, !dbg !680
  %arrayidx14 = getelementptr inbounds i32, i32* %12, i64 %idxprom13, !dbg !680
  %14 = load i32, i32* %arrayidx14, align 4, !dbg !680
  call void @printIntLine(i32 %14), !dbg !683
  br label %for.inc15, !dbg !684

for.inc15:                                        ; preds = %for.body12
  %15 = load i32, i32* %i, align 4, !dbg !685
  %inc16 = add nsw i32 %15, 1, !dbg !685
  store i32 %inc16, i32* %i, align 4, !dbg !685
  br label %for.cond10, !dbg !686, !llvm.loop !687

for.end17:                                        ; preds = %for.cond10
  br label %if.end18, !dbg !689

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !690
  br label %if.end18

if.end18:                                         ; preds = %if.else, %for.end17
  %16 = load i32*, i32** %buffer, align 8, !dbg !692
  %17 = bitcast i32* %16 to i8*, !dbg !692
  call void @free(i8* %17) #8, !dbg !693
  br label %if.end19, !dbg !694

if.end19:                                         ; preds = %if.end18, %if.end
  ret void, !dbg !695
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
!llvm.module.flags = !{!68, !69, !70, !71, !72}
!llvm.ident = !{!73}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !67, line: 45, type: !62, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !64, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_05.c", directory: "/home/joelyang/SSE-Assessment")
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
!47 = !{!48, !61, !63, !7}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !50, line: 178, size: 128, elements: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!51 = !{!52, !56}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !49, file: !50, line: 180, baseType: !53, size: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !54, line: 28, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!55 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !49, file: !50, line: 181, baseType: !57, size: 112, offset: 16)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 112, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 14)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!64 = !{!0, !65}
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !67, line: 46, type: !62, isLocal: true, isDefinition: true)
!67 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_05.c", directory: "/home/joelyang/SSE-Assessment")
!68 = !{i32 7, !"Dwarf Version", i32 4}
!69 = !{i32 2, !"Debug Info Version", i32 3}
!70 = !{i32 1, !"wchar_size", i32 4}
!71 = !{i32 7, !"uwtable", i32 1}
!72 = !{i32 7, !"frame-pointer", i32 2}
!73 = !{!"clang version 13.0.0"}
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_05_bad", scope: !67, file: !67, line: 50, type: !75, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !74, file: !67, line: 52, type: !62)
!79 = !DILocation(line: 52, column: 9, scope: !74)
!80 = !DILocation(line: 54, column: 10, scope: !74)
!81 = !DILocation(line: 55, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !67, line: 55, column: 8)
!83 = !DILocation(line: 55, column: 8, scope: !74)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !67, line: 62, type: !62)
!85 = distinct !DILexicalBlock(scope: !86, file: !67, line: 57, column: 9)
!86 = distinct !DILexicalBlock(scope: !82, file: !67, line: 56, column: 5)
!87 = !DILocation(line: 62, column: 17, scope: !85)
!88 = !DILocalVariable(name: "service", scope: !85, file: !67, line: 63, type: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !90)
!90 = !{!91, !92, !98, !105}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !89, file: !19, line: 240, baseType: !53, size: 16)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !89, file: !19, line: 241, baseType: !93, size: 16, offset: 16)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !95, line: 25, baseType: !96)
!95 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !97, line: 40, baseType: !55)
!97 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !89, file: !19, line: 242, baseType: !99, size: 32, offset: 32)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !100)
!100 = !{!101}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !99, file: !19, line: 33, baseType: !102, size: 32)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !95, line: 26, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !97, line: 42, baseType: !7)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !89, file: !19, line: 245, baseType: !106, size: 64, offset: 64)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 64, elements: !108)
!107 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!108 = !{!109}
!109 = !DISubrange(count: 8)
!110 = !DILocation(line: 63, column: 32, scope: !85)
!111 = !DILocalVariable(name: "connectSocket", scope: !85, file: !67, line: 64, type: !62)
!112 = !DILocation(line: 64, column: 20, scope: !85)
!113 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !67, line: 65, type: !57)
!114 = !DILocation(line: 65, column: 18, scope: !85)
!115 = !DILocation(line: 66, column: 13, scope: !85)
!116 = !DILocation(line: 76, column: 33, scope: !117)
!117 = distinct !DILexicalBlock(scope: !85, file: !67, line: 67, column: 13)
!118 = !DILocation(line: 76, column: 31, scope: !117)
!119 = !DILocation(line: 77, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !67, line: 77, column: 21)
!121 = !DILocation(line: 77, column: 35, scope: !120)
!122 = !DILocation(line: 77, column: 21, scope: !117)
!123 = !DILocation(line: 79, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !67, line: 78, column: 17)
!125 = !DILocation(line: 81, column: 17, scope: !117)
!126 = !DILocation(line: 82, column: 25, scope: !117)
!127 = !DILocation(line: 82, column: 36, scope: !117)
!128 = !DILocation(line: 83, column: 43, scope: !117)
!129 = !DILocation(line: 83, column: 25, scope: !117)
!130 = !DILocation(line: 83, column: 34, scope: !117)
!131 = !DILocation(line: 83, column: 41, scope: !117)
!132 = !DILocation(line: 84, column: 36, scope: !117)
!133 = !DILocation(line: 84, column: 25, scope: !117)
!134 = !DILocation(line: 84, column: 34, scope: !117)
!135 = !DILocation(line: 85, column: 29, scope: !136)
!136 = distinct !DILexicalBlock(scope: !117, file: !67, line: 85, column: 21)
!137 = !DILocation(line: 85, column: 44, scope: !136)
!138 = !DILocation(line: 85, column: 21, scope: !136)
!139 = !DILocation(line: 85, column: 89, scope: !136)
!140 = !DILocation(line: 85, column: 21, scope: !117)
!141 = !DILocation(line: 87, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !67, line: 86, column: 17)
!143 = !DILocation(line: 91, column: 35, scope: !117)
!144 = !DILocation(line: 91, column: 50, scope: !117)
!145 = !DILocation(line: 91, column: 30, scope: !117)
!146 = !DILocation(line: 91, column: 28, scope: !117)
!147 = !DILocation(line: 92, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !117, file: !67, line: 92, column: 21)
!149 = !DILocation(line: 92, column: 32, scope: !148)
!150 = !DILocation(line: 92, column: 48, scope: !148)
!151 = !DILocation(line: 92, column: 51, scope: !148)
!152 = !DILocation(line: 92, column: 62, scope: !148)
!153 = !DILocation(line: 92, column: 21, scope: !117)
!154 = !DILocation(line: 94, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !148, file: !67, line: 93, column: 17)
!156 = !DILocation(line: 97, column: 29, scope: !117)
!157 = !DILocation(line: 97, column: 17, scope: !117)
!158 = !DILocation(line: 97, column: 41, scope: !117)
!159 = !DILocation(line: 99, column: 29, scope: !117)
!160 = !DILocation(line: 99, column: 24, scope: !117)
!161 = !DILocation(line: 99, column: 22, scope: !117)
!162 = !DILocation(line: 100, column: 13, scope: !117)
!163 = !DILocation(line: 102, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !85, file: !67, line: 102, column: 17)
!165 = !DILocation(line: 102, column: 31, scope: !164)
!166 = !DILocation(line: 102, column: 17, scope: !85)
!167 = !DILocation(line: 104, column: 30, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !67, line: 103, column: 13)
!169 = !DILocation(line: 104, column: 17, scope: !168)
!170 = !DILocation(line: 105, column: 13, scope: !168)
!171 = !DILocation(line: 113, column: 5, scope: !86)
!172 = !DILocation(line: 114, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !74, file: !67, line: 114, column: 8)
!174 = !DILocation(line: 114, column: 8, scope: !74)
!175 = !DILocalVariable(name: "i", scope: !176, file: !67, line: 117, type: !62)
!176 = distinct !DILexicalBlock(scope: !177, file: !67, line: 116, column: 9)
!177 = distinct !DILexicalBlock(scope: !173, file: !67, line: 115, column: 5)
!178 = !DILocation(line: 117, column: 17, scope: !176)
!179 = !DILocalVariable(name: "buffer", scope: !176, file: !67, line: 118, type: !61)
!180 = !DILocation(line: 118, column: 19, scope: !176)
!181 = !DILocation(line: 118, column: 35, scope: !176)
!182 = !DILocation(line: 118, column: 28, scope: !176)
!183 = !DILocation(line: 119, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !176, file: !67, line: 119, column: 17)
!185 = !DILocation(line: 119, column: 24, scope: !184)
!186 = !DILocation(line: 119, column: 17, scope: !176)
!187 = !DILocation(line: 119, column: 34, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !67, line: 119, column: 33)
!189 = !DILocation(line: 121, column: 20, scope: !190)
!190 = distinct !DILexicalBlock(scope: !176, file: !67, line: 121, column: 13)
!191 = !DILocation(line: 121, column: 18, scope: !190)
!192 = !DILocation(line: 121, column: 25, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !67, line: 121, column: 13)
!194 = !DILocation(line: 121, column: 27, scope: !193)
!195 = !DILocation(line: 121, column: 13, scope: !190)
!196 = !DILocation(line: 123, column: 17, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !67, line: 122, column: 13)
!198 = !DILocation(line: 123, column: 24, scope: !197)
!199 = !DILocation(line: 123, column: 27, scope: !197)
!200 = !DILocation(line: 124, column: 13, scope: !197)
!201 = !DILocation(line: 121, column: 34, scope: !193)
!202 = !DILocation(line: 121, column: 13, scope: !193)
!203 = distinct !{!203, !195, !204, !205}
!204 = !DILocation(line: 124, column: 13, scope: !190)
!205 = !{!"llvm.loop.mustprogress"}
!206 = !DILocation(line: 127, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !176, file: !67, line: 127, column: 17)
!208 = !DILocation(line: 127, column: 22, scope: !207)
!209 = !DILocation(line: 127, column: 17, scope: !176)
!210 = !DILocation(line: 129, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !67, line: 128, column: 13)
!212 = !DILocation(line: 129, column: 24, scope: !211)
!213 = !DILocation(line: 129, column: 30, scope: !211)
!214 = !DILocation(line: 131, column: 23, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !67, line: 131, column: 17)
!216 = !DILocation(line: 131, column: 21, scope: !215)
!217 = !DILocation(line: 131, column: 28, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !67, line: 131, column: 17)
!219 = !DILocation(line: 131, column: 30, scope: !218)
!220 = !DILocation(line: 131, column: 17, scope: !215)
!221 = !DILocation(line: 133, column: 34, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !67, line: 132, column: 17)
!223 = !DILocation(line: 133, column: 41, scope: !222)
!224 = !DILocation(line: 133, column: 21, scope: !222)
!225 = !DILocation(line: 134, column: 17, scope: !222)
!226 = !DILocation(line: 131, column: 37, scope: !218)
!227 = !DILocation(line: 131, column: 17, scope: !218)
!228 = distinct !{!228, !220, !229, !205}
!229 = !DILocation(line: 134, column: 17, scope: !215)
!230 = !DILocation(line: 135, column: 13, scope: !211)
!231 = !DILocation(line: 138, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !207, file: !67, line: 137, column: 13)
!233 = !DILocation(line: 140, column: 18, scope: !176)
!234 = !DILocation(line: 140, column: 13, scope: !176)
!235 = !DILocation(line: 142, column: 5, scope: !177)
!236 = !DILocation(line: 143, column: 1, scope: !74)
!237 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_05_good", scope: !67, file: !67, line: 435, type: !75, scopeLine: 436, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!238 = !DILocation(line: 437, column: 5, scope: !237)
!239 = !DILocation(line: 438, column: 5, scope: !237)
!240 = !DILocation(line: 439, column: 5, scope: !237)
!241 = !DILocation(line: 440, column: 5, scope: !237)
!242 = !DILocation(line: 441, column: 1, scope: !237)
!243 = distinct !DISubprogram(name: "main", scope: !67, file: !67, line: 452, type: !244, scopeLine: 453, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!244 = !DISubroutineType(types: !245)
!245 = !{!62, !62, !246}
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!248 = !DILocalVariable(name: "argc", arg: 1, scope: !243, file: !67, line: 452, type: !62)
!249 = !DILocation(line: 452, column: 14, scope: !243)
!250 = !DILocalVariable(name: "argv", arg: 2, scope: !243, file: !67, line: 452, type: !246)
!251 = !DILocation(line: 452, column: 27, scope: !243)
!252 = !DILocation(line: 455, column: 22, scope: !243)
!253 = !DILocation(line: 455, column: 12, scope: !243)
!254 = !DILocation(line: 455, column: 5, scope: !243)
!255 = !DILocation(line: 457, column: 5, scope: !243)
!256 = !DILocation(line: 458, column: 5, scope: !243)
!257 = !DILocation(line: 459, column: 5, scope: !243)
!258 = !DILocation(line: 462, column: 5, scope: !243)
!259 = !DILocation(line: 463, column: 5, scope: !243)
!260 = !DILocation(line: 464, column: 5, scope: !243)
!261 = !DILocation(line: 466, column: 5, scope: !243)
!262 = distinct !DISubprogram(name: "goodB2G1", scope: !67, file: !67, line: 150, type: !75, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!263 = !DILocalVariable(name: "data", scope: !262, file: !67, line: 152, type: !62)
!264 = !DILocation(line: 152, column: 9, scope: !262)
!265 = !DILocation(line: 154, column: 10, scope: !262)
!266 = !DILocation(line: 155, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !262, file: !67, line: 155, column: 8)
!268 = !DILocation(line: 155, column: 8, scope: !262)
!269 = !DILocalVariable(name: "recvResult", scope: !270, file: !67, line: 162, type: !62)
!270 = distinct !DILexicalBlock(scope: !271, file: !67, line: 157, column: 9)
!271 = distinct !DILexicalBlock(scope: !267, file: !67, line: 156, column: 5)
!272 = !DILocation(line: 162, column: 17, scope: !270)
!273 = !DILocalVariable(name: "service", scope: !270, file: !67, line: 163, type: !89)
!274 = !DILocation(line: 163, column: 32, scope: !270)
!275 = !DILocalVariable(name: "connectSocket", scope: !270, file: !67, line: 164, type: !62)
!276 = !DILocation(line: 164, column: 20, scope: !270)
!277 = !DILocalVariable(name: "inputBuffer", scope: !270, file: !67, line: 165, type: !57)
!278 = !DILocation(line: 165, column: 18, scope: !270)
!279 = !DILocation(line: 166, column: 13, scope: !270)
!280 = !DILocation(line: 176, column: 33, scope: !281)
!281 = distinct !DILexicalBlock(scope: !270, file: !67, line: 167, column: 13)
!282 = !DILocation(line: 176, column: 31, scope: !281)
!283 = !DILocation(line: 177, column: 21, scope: !284)
!284 = distinct !DILexicalBlock(scope: !281, file: !67, line: 177, column: 21)
!285 = !DILocation(line: 177, column: 35, scope: !284)
!286 = !DILocation(line: 177, column: 21, scope: !281)
!287 = !DILocation(line: 179, column: 21, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !67, line: 178, column: 17)
!289 = !DILocation(line: 181, column: 17, scope: !281)
!290 = !DILocation(line: 182, column: 25, scope: !281)
!291 = !DILocation(line: 182, column: 36, scope: !281)
!292 = !DILocation(line: 183, column: 43, scope: !281)
!293 = !DILocation(line: 183, column: 25, scope: !281)
!294 = !DILocation(line: 183, column: 34, scope: !281)
!295 = !DILocation(line: 183, column: 41, scope: !281)
!296 = !DILocation(line: 184, column: 36, scope: !281)
!297 = !DILocation(line: 184, column: 25, scope: !281)
!298 = !DILocation(line: 184, column: 34, scope: !281)
!299 = !DILocation(line: 185, column: 29, scope: !300)
!300 = distinct !DILexicalBlock(scope: !281, file: !67, line: 185, column: 21)
!301 = !DILocation(line: 185, column: 44, scope: !300)
!302 = !DILocation(line: 185, column: 21, scope: !300)
!303 = !DILocation(line: 185, column: 89, scope: !300)
!304 = !DILocation(line: 185, column: 21, scope: !281)
!305 = !DILocation(line: 187, column: 21, scope: !306)
!306 = distinct !DILexicalBlock(scope: !300, file: !67, line: 186, column: 17)
!307 = !DILocation(line: 191, column: 35, scope: !281)
!308 = !DILocation(line: 191, column: 50, scope: !281)
!309 = !DILocation(line: 191, column: 30, scope: !281)
!310 = !DILocation(line: 191, column: 28, scope: !281)
!311 = !DILocation(line: 192, column: 21, scope: !312)
!312 = distinct !DILexicalBlock(scope: !281, file: !67, line: 192, column: 21)
!313 = !DILocation(line: 192, column: 32, scope: !312)
!314 = !DILocation(line: 192, column: 48, scope: !312)
!315 = !DILocation(line: 192, column: 51, scope: !312)
!316 = !DILocation(line: 192, column: 62, scope: !312)
!317 = !DILocation(line: 192, column: 21, scope: !281)
!318 = !DILocation(line: 194, column: 21, scope: !319)
!319 = distinct !DILexicalBlock(scope: !312, file: !67, line: 193, column: 17)
!320 = !DILocation(line: 197, column: 29, scope: !281)
!321 = !DILocation(line: 197, column: 17, scope: !281)
!322 = !DILocation(line: 197, column: 41, scope: !281)
!323 = !DILocation(line: 199, column: 29, scope: !281)
!324 = !DILocation(line: 199, column: 24, scope: !281)
!325 = !DILocation(line: 199, column: 22, scope: !281)
!326 = !DILocation(line: 200, column: 13, scope: !281)
!327 = !DILocation(line: 202, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !270, file: !67, line: 202, column: 17)
!329 = !DILocation(line: 202, column: 31, scope: !328)
!330 = !DILocation(line: 202, column: 17, scope: !270)
!331 = !DILocation(line: 204, column: 30, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !67, line: 203, column: 13)
!333 = !DILocation(line: 204, column: 17, scope: !332)
!334 = !DILocation(line: 205, column: 13, scope: !332)
!335 = !DILocation(line: 213, column: 5, scope: !271)
!336 = !DILocation(line: 214, column: 8, scope: !337)
!337 = distinct !DILexicalBlock(scope: !262, file: !67, line: 214, column: 8)
!338 = !DILocation(line: 214, column: 8, scope: !262)
!339 = !DILocation(line: 217, column: 9, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !67, line: 215, column: 5)
!341 = !DILocation(line: 218, column: 5, scope: !340)
!342 = !DILocalVariable(name: "i", scope: !343, file: !67, line: 222, type: !62)
!343 = distinct !DILexicalBlock(scope: !344, file: !67, line: 221, column: 9)
!344 = distinct !DILexicalBlock(scope: !337, file: !67, line: 220, column: 5)
!345 = !DILocation(line: 222, column: 17, scope: !343)
!346 = !DILocalVariable(name: "buffer", scope: !343, file: !67, line: 223, type: !61)
!347 = !DILocation(line: 223, column: 19, scope: !343)
!348 = !DILocation(line: 223, column: 35, scope: !343)
!349 = !DILocation(line: 223, column: 28, scope: !343)
!350 = !DILocation(line: 224, column: 17, scope: !351)
!351 = distinct !DILexicalBlock(scope: !343, file: !67, line: 224, column: 17)
!352 = !DILocation(line: 224, column: 24, scope: !351)
!353 = !DILocation(line: 224, column: 17, scope: !343)
!354 = !DILocation(line: 224, column: 34, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !67, line: 224, column: 33)
!356 = !DILocation(line: 226, column: 20, scope: !357)
!357 = distinct !DILexicalBlock(scope: !343, file: !67, line: 226, column: 13)
!358 = !DILocation(line: 226, column: 18, scope: !357)
!359 = !DILocation(line: 226, column: 25, scope: !360)
!360 = distinct !DILexicalBlock(scope: !357, file: !67, line: 226, column: 13)
!361 = !DILocation(line: 226, column: 27, scope: !360)
!362 = !DILocation(line: 226, column: 13, scope: !357)
!363 = !DILocation(line: 228, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !360, file: !67, line: 227, column: 13)
!365 = !DILocation(line: 228, column: 24, scope: !364)
!366 = !DILocation(line: 228, column: 27, scope: !364)
!367 = !DILocation(line: 229, column: 13, scope: !364)
!368 = !DILocation(line: 226, column: 34, scope: !360)
!369 = !DILocation(line: 226, column: 13, scope: !360)
!370 = distinct !{!370, !362, !371, !205}
!371 = !DILocation(line: 229, column: 13, scope: !357)
!372 = !DILocation(line: 231, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !343, file: !67, line: 231, column: 17)
!374 = !DILocation(line: 231, column: 22, scope: !373)
!375 = !DILocation(line: 231, column: 27, scope: !373)
!376 = !DILocation(line: 231, column: 30, scope: !373)
!377 = !DILocation(line: 231, column: 35, scope: !373)
!378 = !DILocation(line: 231, column: 17, scope: !343)
!379 = !DILocation(line: 233, column: 17, scope: !380)
!380 = distinct !DILexicalBlock(scope: !373, file: !67, line: 232, column: 13)
!381 = !DILocation(line: 233, column: 24, scope: !380)
!382 = !DILocation(line: 233, column: 30, scope: !380)
!383 = !DILocation(line: 235, column: 23, scope: !384)
!384 = distinct !DILexicalBlock(scope: !380, file: !67, line: 235, column: 17)
!385 = !DILocation(line: 235, column: 21, scope: !384)
!386 = !DILocation(line: 235, column: 28, scope: !387)
!387 = distinct !DILexicalBlock(scope: !384, file: !67, line: 235, column: 17)
!388 = !DILocation(line: 235, column: 30, scope: !387)
!389 = !DILocation(line: 235, column: 17, scope: !384)
!390 = !DILocation(line: 237, column: 34, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !67, line: 236, column: 17)
!392 = !DILocation(line: 237, column: 41, scope: !391)
!393 = !DILocation(line: 237, column: 21, scope: !391)
!394 = !DILocation(line: 238, column: 17, scope: !391)
!395 = !DILocation(line: 235, column: 37, scope: !387)
!396 = !DILocation(line: 235, column: 17, scope: !387)
!397 = distinct !{!397, !389, !398, !205}
!398 = !DILocation(line: 238, column: 17, scope: !384)
!399 = !DILocation(line: 239, column: 13, scope: !380)
!400 = !DILocation(line: 242, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !373, file: !67, line: 241, column: 13)
!402 = !DILocation(line: 244, column: 18, scope: !343)
!403 = !DILocation(line: 244, column: 13, scope: !343)
!404 = !DILocation(line: 247, column: 1, scope: !262)
!405 = distinct !DISubprogram(name: "goodB2G2", scope: !67, file: !67, line: 250, type: !75, scopeLine: 251, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!406 = !DILocalVariable(name: "data", scope: !405, file: !67, line: 252, type: !62)
!407 = !DILocation(line: 252, column: 9, scope: !405)
!408 = !DILocation(line: 254, column: 10, scope: !405)
!409 = !DILocation(line: 255, column: 8, scope: !410)
!410 = distinct !DILexicalBlock(scope: !405, file: !67, line: 255, column: 8)
!411 = !DILocation(line: 255, column: 8, scope: !405)
!412 = !DILocalVariable(name: "recvResult", scope: !413, file: !67, line: 262, type: !62)
!413 = distinct !DILexicalBlock(scope: !414, file: !67, line: 257, column: 9)
!414 = distinct !DILexicalBlock(scope: !410, file: !67, line: 256, column: 5)
!415 = !DILocation(line: 262, column: 17, scope: !413)
!416 = !DILocalVariable(name: "service", scope: !413, file: !67, line: 263, type: !89)
!417 = !DILocation(line: 263, column: 32, scope: !413)
!418 = !DILocalVariable(name: "connectSocket", scope: !413, file: !67, line: 264, type: !62)
!419 = !DILocation(line: 264, column: 20, scope: !413)
!420 = !DILocalVariable(name: "inputBuffer", scope: !413, file: !67, line: 265, type: !57)
!421 = !DILocation(line: 265, column: 18, scope: !413)
!422 = !DILocation(line: 266, column: 13, scope: !413)
!423 = !DILocation(line: 276, column: 33, scope: !424)
!424 = distinct !DILexicalBlock(scope: !413, file: !67, line: 267, column: 13)
!425 = !DILocation(line: 276, column: 31, scope: !424)
!426 = !DILocation(line: 277, column: 21, scope: !427)
!427 = distinct !DILexicalBlock(scope: !424, file: !67, line: 277, column: 21)
!428 = !DILocation(line: 277, column: 35, scope: !427)
!429 = !DILocation(line: 277, column: 21, scope: !424)
!430 = !DILocation(line: 279, column: 21, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !67, line: 278, column: 17)
!432 = !DILocation(line: 281, column: 17, scope: !424)
!433 = !DILocation(line: 282, column: 25, scope: !424)
!434 = !DILocation(line: 282, column: 36, scope: !424)
!435 = !DILocation(line: 283, column: 43, scope: !424)
!436 = !DILocation(line: 283, column: 25, scope: !424)
!437 = !DILocation(line: 283, column: 34, scope: !424)
!438 = !DILocation(line: 283, column: 41, scope: !424)
!439 = !DILocation(line: 284, column: 36, scope: !424)
!440 = !DILocation(line: 284, column: 25, scope: !424)
!441 = !DILocation(line: 284, column: 34, scope: !424)
!442 = !DILocation(line: 285, column: 29, scope: !443)
!443 = distinct !DILexicalBlock(scope: !424, file: !67, line: 285, column: 21)
!444 = !DILocation(line: 285, column: 44, scope: !443)
!445 = !DILocation(line: 285, column: 21, scope: !443)
!446 = !DILocation(line: 285, column: 89, scope: !443)
!447 = !DILocation(line: 285, column: 21, scope: !424)
!448 = !DILocation(line: 287, column: 21, scope: !449)
!449 = distinct !DILexicalBlock(scope: !443, file: !67, line: 286, column: 17)
!450 = !DILocation(line: 291, column: 35, scope: !424)
!451 = !DILocation(line: 291, column: 50, scope: !424)
!452 = !DILocation(line: 291, column: 30, scope: !424)
!453 = !DILocation(line: 291, column: 28, scope: !424)
!454 = !DILocation(line: 292, column: 21, scope: !455)
!455 = distinct !DILexicalBlock(scope: !424, file: !67, line: 292, column: 21)
!456 = !DILocation(line: 292, column: 32, scope: !455)
!457 = !DILocation(line: 292, column: 48, scope: !455)
!458 = !DILocation(line: 292, column: 51, scope: !455)
!459 = !DILocation(line: 292, column: 62, scope: !455)
!460 = !DILocation(line: 292, column: 21, scope: !424)
!461 = !DILocation(line: 294, column: 21, scope: !462)
!462 = distinct !DILexicalBlock(scope: !455, file: !67, line: 293, column: 17)
!463 = !DILocation(line: 297, column: 29, scope: !424)
!464 = !DILocation(line: 297, column: 17, scope: !424)
!465 = !DILocation(line: 297, column: 41, scope: !424)
!466 = !DILocation(line: 299, column: 29, scope: !424)
!467 = !DILocation(line: 299, column: 24, scope: !424)
!468 = !DILocation(line: 299, column: 22, scope: !424)
!469 = !DILocation(line: 300, column: 13, scope: !424)
!470 = !DILocation(line: 302, column: 17, scope: !471)
!471 = distinct !DILexicalBlock(scope: !413, file: !67, line: 302, column: 17)
!472 = !DILocation(line: 302, column: 31, scope: !471)
!473 = !DILocation(line: 302, column: 17, scope: !413)
!474 = !DILocation(line: 304, column: 30, scope: !475)
!475 = distinct !DILexicalBlock(scope: !471, file: !67, line: 303, column: 13)
!476 = !DILocation(line: 304, column: 17, scope: !475)
!477 = !DILocation(line: 305, column: 13, scope: !475)
!478 = !DILocation(line: 313, column: 5, scope: !414)
!479 = !DILocation(line: 314, column: 8, scope: !480)
!480 = distinct !DILexicalBlock(scope: !405, file: !67, line: 314, column: 8)
!481 = !DILocation(line: 314, column: 8, scope: !405)
!482 = !DILocalVariable(name: "i", scope: !483, file: !67, line: 317, type: !62)
!483 = distinct !DILexicalBlock(scope: !484, file: !67, line: 316, column: 9)
!484 = distinct !DILexicalBlock(scope: !480, file: !67, line: 315, column: 5)
!485 = !DILocation(line: 317, column: 17, scope: !483)
!486 = !DILocalVariable(name: "buffer", scope: !483, file: !67, line: 318, type: !61)
!487 = !DILocation(line: 318, column: 19, scope: !483)
!488 = !DILocation(line: 318, column: 35, scope: !483)
!489 = !DILocation(line: 318, column: 28, scope: !483)
!490 = !DILocation(line: 319, column: 17, scope: !491)
!491 = distinct !DILexicalBlock(scope: !483, file: !67, line: 319, column: 17)
!492 = !DILocation(line: 319, column: 24, scope: !491)
!493 = !DILocation(line: 319, column: 17, scope: !483)
!494 = !DILocation(line: 319, column: 34, scope: !495)
!495 = distinct !DILexicalBlock(scope: !491, file: !67, line: 319, column: 33)
!496 = !DILocation(line: 321, column: 20, scope: !497)
!497 = distinct !DILexicalBlock(scope: !483, file: !67, line: 321, column: 13)
!498 = !DILocation(line: 321, column: 18, scope: !497)
!499 = !DILocation(line: 321, column: 25, scope: !500)
!500 = distinct !DILexicalBlock(scope: !497, file: !67, line: 321, column: 13)
!501 = !DILocation(line: 321, column: 27, scope: !500)
!502 = !DILocation(line: 321, column: 13, scope: !497)
!503 = !DILocation(line: 323, column: 17, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !67, line: 322, column: 13)
!505 = !DILocation(line: 323, column: 24, scope: !504)
!506 = !DILocation(line: 323, column: 27, scope: !504)
!507 = !DILocation(line: 324, column: 13, scope: !504)
!508 = !DILocation(line: 321, column: 34, scope: !500)
!509 = !DILocation(line: 321, column: 13, scope: !500)
!510 = distinct !{!510, !502, !511, !205}
!511 = !DILocation(line: 324, column: 13, scope: !497)
!512 = !DILocation(line: 326, column: 17, scope: !513)
!513 = distinct !DILexicalBlock(scope: !483, file: !67, line: 326, column: 17)
!514 = !DILocation(line: 326, column: 22, scope: !513)
!515 = !DILocation(line: 326, column: 27, scope: !513)
!516 = !DILocation(line: 326, column: 30, scope: !513)
!517 = !DILocation(line: 326, column: 35, scope: !513)
!518 = !DILocation(line: 326, column: 17, scope: !483)
!519 = !DILocation(line: 328, column: 17, scope: !520)
!520 = distinct !DILexicalBlock(scope: !513, file: !67, line: 327, column: 13)
!521 = !DILocation(line: 328, column: 24, scope: !520)
!522 = !DILocation(line: 328, column: 30, scope: !520)
!523 = !DILocation(line: 330, column: 23, scope: !524)
!524 = distinct !DILexicalBlock(scope: !520, file: !67, line: 330, column: 17)
!525 = !DILocation(line: 330, column: 21, scope: !524)
!526 = !DILocation(line: 330, column: 28, scope: !527)
!527 = distinct !DILexicalBlock(scope: !524, file: !67, line: 330, column: 17)
!528 = !DILocation(line: 330, column: 30, scope: !527)
!529 = !DILocation(line: 330, column: 17, scope: !524)
!530 = !DILocation(line: 332, column: 34, scope: !531)
!531 = distinct !DILexicalBlock(scope: !527, file: !67, line: 331, column: 17)
!532 = !DILocation(line: 332, column: 41, scope: !531)
!533 = !DILocation(line: 332, column: 21, scope: !531)
!534 = !DILocation(line: 333, column: 17, scope: !531)
!535 = !DILocation(line: 330, column: 37, scope: !527)
!536 = !DILocation(line: 330, column: 17, scope: !527)
!537 = distinct !{!537, !529, !538, !205}
!538 = !DILocation(line: 333, column: 17, scope: !524)
!539 = !DILocation(line: 334, column: 13, scope: !520)
!540 = !DILocation(line: 337, column: 17, scope: !541)
!541 = distinct !DILexicalBlock(scope: !513, file: !67, line: 336, column: 13)
!542 = !DILocation(line: 339, column: 18, scope: !483)
!543 = !DILocation(line: 339, column: 13, scope: !483)
!544 = !DILocation(line: 341, column: 5, scope: !484)
!545 = !DILocation(line: 342, column: 1, scope: !405)
!546 = distinct !DISubprogram(name: "goodG2B1", scope: !67, file: !67, line: 345, type: !75, scopeLine: 346, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!547 = !DILocalVariable(name: "data", scope: !546, file: !67, line: 347, type: !62)
!548 = !DILocation(line: 347, column: 9, scope: !546)
!549 = !DILocation(line: 349, column: 10, scope: !546)
!550 = !DILocation(line: 350, column: 8, scope: !551)
!551 = distinct !DILexicalBlock(scope: !546, file: !67, line: 350, column: 8)
!552 = !DILocation(line: 350, column: 8, scope: !546)
!553 = !DILocation(line: 353, column: 9, scope: !554)
!554 = distinct !DILexicalBlock(scope: !551, file: !67, line: 351, column: 5)
!555 = !DILocation(line: 354, column: 5, scope: !554)
!556 = !DILocation(line: 359, column: 14, scope: !557)
!557 = distinct !DILexicalBlock(scope: !551, file: !67, line: 356, column: 5)
!558 = !DILocation(line: 361, column: 8, scope: !559)
!559 = distinct !DILexicalBlock(scope: !546, file: !67, line: 361, column: 8)
!560 = !DILocation(line: 361, column: 8, scope: !546)
!561 = !DILocalVariable(name: "i", scope: !562, file: !67, line: 364, type: !62)
!562 = distinct !DILexicalBlock(scope: !563, file: !67, line: 363, column: 9)
!563 = distinct !DILexicalBlock(scope: !559, file: !67, line: 362, column: 5)
!564 = !DILocation(line: 364, column: 17, scope: !562)
!565 = !DILocalVariable(name: "buffer", scope: !562, file: !67, line: 365, type: !61)
!566 = !DILocation(line: 365, column: 19, scope: !562)
!567 = !DILocation(line: 365, column: 35, scope: !562)
!568 = !DILocation(line: 365, column: 28, scope: !562)
!569 = !DILocation(line: 366, column: 17, scope: !570)
!570 = distinct !DILexicalBlock(scope: !562, file: !67, line: 366, column: 17)
!571 = !DILocation(line: 366, column: 24, scope: !570)
!572 = !DILocation(line: 366, column: 17, scope: !562)
!573 = !DILocation(line: 366, column: 34, scope: !574)
!574 = distinct !DILexicalBlock(scope: !570, file: !67, line: 366, column: 33)
!575 = !DILocation(line: 368, column: 20, scope: !576)
!576 = distinct !DILexicalBlock(scope: !562, file: !67, line: 368, column: 13)
!577 = !DILocation(line: 368, column: 18, scope: !576)
!578 = !DILocation(line: 368, column: 25, scope: !579)
!579 = distinct !DILexicalBlock(scope: !576, file: !67, line: 368, column: 13)
!580 = !DILocation(line: 368, column: 27, scope: !579)
!581 = !DILocation(line: 368, column: 13, scope: !576)
!582 = !DILocation(line: 370, column: 17, scope: !583)
!583 = distinct !DILexicalBlock(scope: !579, file: !67, line: 369, column: 13)
!584 = !DILocation(line: 370, column: 24, scope: !583)
!585 = !DILocation(line: 370, column: 27, scope: !583)
!586 = !DILocation(line: 371, column: 13, scope: !583)
!587 = !DILocation(line: 368, column: 34, scope: !579)
!588 = !DILocation(line: 368, column: 13, scope: !579)
!589 = distinct !{!589, !581, !590, !205}
!590 = !DILocation(line: 371, column: 13, scope: !576)
!591 = !DILocation(line: 374, column: 17, scope: !592)
!592 = distinct !DILexicalBlock(scope: !562, file: !67, line: 374, column: 17)
!593 = !DILocation(line: 374, column: 22, scope: !592)
!594 = !DILocation(line: 374, column: 17, scope: !562)
!595 = !DILocation(line: 376, column: 17, scope: !596)
!596 = distinct !DILexicalBlock(scope: !592, file: !67, line: 375, column: 13)
!597 = !DILocation(line: 376, column: 24, scope: !596)
!598 = !DILocation(line: 376, column: 30, scope: !596)
!599 = !DILocation(line: 378, column: 23, scope: !600)
!600 = distinct !DILexicalBlock(scope: !596, file: !67, line: 378, column: 17)
!601 = !DILocation(line: 378, column: 21, scope: !600)
!602 = !DILocation(line: 378, column: 28, scope: !603)
!603 = distinct !DILexicalBlock(scope: !600, file: !67, line: 378, column: 17)
!604 = !DILocation(line: 378, column: 30, scope: !603)
!605 = !DILocation(line: 378, column: 17, scope: !600)
!606 = !DILocation(line: 380, column: 34, scope: !607)
!607 = distinct !DILexicalBlock(scope: !603, file: !67, line: 379, column: 17)
!608 = !DILocation(line: 380, column: 41, scope: !607)
!609 = !DILocation(line: 380, column: 21, scope: !607)
!610 = !DILocation(line: 381, column: 17, scope: !607)
!611 = !DILocation(line: 378, column: 37, scope: !603)
!612 = !DILocation(line: 378, column: 17, scope: !603)
!613 = distinct !{!613, !605, !614, !205}
!614 = !DILocation(line: 381, column: 17, scope: !600)
!615 = !DILocation(line: 382, column: 13, scope: !596)
!616 = !DILocation(line: 385, column: 17, scope: !617)
!617 = distinct !DILexicalBlock(scope: !592, file: !67, line: 384, column: 13)
!618 = !DILocation(line: 387, column: 18, scope: !562)
!619 = !DILocation(line: 387, column: 13, scope: !562)
!620 = !DILocation(line: 389, column: 5, scope: !563)
!621 = !DILocation(line: 390, column: 1, scope: !546)
!622 = distinct !DISubprogram(name: "goodG2B2", scope: !67, file: !67, line: 393, type: !75, scopeLine: 394, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!623 = !DILocalVariable(name: "data", scope: !622, file: !67, line: 395, type: !62)
!624 = !DILocation(line: 395, column: 9, scope: !622)
!625 = !DILocation(line: 397, column: 10, scope: !622)
!626 = !DILocation(line: 398, column: 8, scope: !627)
!627 = distinct !DILexicalBlock(scope: !622, file: !67, line: 398, column: 8)
!628 = !DILocation(line: 398, column: 8, scope: !622)
!629 = !DILocation(line: 402, column: 14, scope: !630)
!630 = distinct !DILexicalBlock(scope: !627, file: !67, line: 399, column: 5)
!631 = !DILocation(line: 403, column: 5, scope: !630)
!632 = !DILocation(line: 404, column: 8, scope: !633)
!633 = distinct !DILexicalBlock(scope: !622, file: !67, line: 404, column: 8)
!634 = !DILocation(line: 404, column: 8, scope: !622)
!635 = !DILocalVariable(name: "i", scope: !636, file: !67, line: 407, type: !62)
!636 = distinct !DILexicalBlock(scope: !637, file: !67, line: 406, column: 9)
!637 = distinct !DILexicalBlock(scope: !633, file: !67, line: 405, column: 5)
!638 = !DILocation(line: 407, column: 17, scope: !636)
!639 = !DILocalVariable(name: "buffer", scope: !636, file: !67, line: 408, type: !61)
!640 = !DILocation(line: 408, column: 19, scope: !636)
!641 = !DILocation(line: 408, column: 35, scope: !636)
!642 = !DILocation(line: 408, column: 28, scope: !636)
!643 = !DILocation(line: 409, column: 17, scope: !644)
!644 = distinct !DILexicalBlock(scope: !636, file: !67, line: 409, column: 17)
!645 = !DILocation(line: 409, column: 24, scope: !644)
!646 = !DILocation(line: 409, column: 17, scope: !636)
!647 = !DILocation(line: 409, column: 34, scope: !648)
!648 = distinct !DILexicalBlock(scope: !644, file: !67, line: 409, column: 33)
!649 = !DILocation(line: 411, column: 20, scope: !650)
!650 = distinct !DILexicalBlock(scope: !636, file: !67, line: 411, column: 13)
!651 = !DILocation(line: 411, column: 18, scope: !650)
!652 = !DILocation(line: 411, column: 25, scope: !653)
!653 = distinct !DILexicalBlock(scope: !650, file: !67, line: 411, column: 13)
!654 = !DILocation(line: 411, column: 27, scope: !653)
!655 = !DILocation(line: 411, column: 13, scope: !650)
!656 = !DILocation(line: 413, column: 17, scope: !657)
!657 = distinct !DILexicalBlock(scope: !653, file: !67, line: 412, column: 13)
!658 = !DILocation(line: 413, column: 24, scope: !657)
!659 = !DILocation(line: 413, column: 27, scope: !657)
!660 = !DILocation(line: 414, column: 13, scope: !657)
!661 = !DILocation(line: 411, column: 34, scope: !653)
!662 = !DILocation(line: 411, column: 13, scope: !653)
!663 = distinct !{!663, !655, !664, !205}
!664 = !DILocation(line: 414, column: 13, scope: !650)
!665 = !DILocation(line: 417, column: 17, scope: !666)
!666 = distinct !DILexicalBlock(scope: !636, file: !67, line: 417, column: 17)
!667 = !DILocation(line: 417, column: 22, scope: !666)
!668 = !DILocation(line: 417, column: 17, scope: !636)
!669 = !DILocation(line: 419, column: 17, scope: !670)
!670 = distinct !DILexicalBlock(scope: !666, file: !67, line: 418, column: 13)
!671 = !DILocation(line: 419, column: 24, scope: !670)
!672 = !DILocation(line: 419, column: 30, scope: !670)
!673 = !DILocation(line: 421, column: 23, scope: !674)
!674 = distinct !DILexicalBlock(scope: !670, file: !67, line: 421, column: 17)
!675 = !DILocation(line: 421, column: 21, scope: !674)
!676 = !DILocation(line: 421, column: 28, scope: !677)
!677 = distinct !DILexicalBlock(scope: !674, file: !67, line: 421, column: 17)
!678 = !DILocation(line: 421, column: 30, scope: !677)
!679 = !DILocation(line: 421, column: 17, scope: !674)
!680 = !DILocation(line: 423, column: 34, scope: !681)
!681 = distinct !DILexicalBlock(scope: !677, file: !67, line: 422, column: 17)
!682 = !DILocation(line: 423, column: 41, scope: !681)
!683 = !DILocation(line: 423, column: 21, scope: !681)
!684 = !DILocation(line: 424, column: 17, scope: !681)
!685 = !DILocation(line: 421, column: 37, scope: !677)
!686 = !DILocation(line: 421, column: 17, scope: !677)
!687 = distinct !{!687, !679, !688, !205}
!688 = !DILocation(line: 424, column: 17, scope: !674)
!689 = !DILocation(line: 425, column: 13, scope: !670)
!690 = !DILocation(line: 428, column: 17, scope: !691)
!691 = distinct !DILexicalBlock(scope: !666, file: !67, line: 427, column: 13)
!692 = !DILocation(line: 430, column: 18, scope: !636)
!693 = !DILocation(line: 430, column: 13, scope: !636)
!694 = !DILocation(line: 432, column: 5, scope: !637)
!695 = !DILocation(line: 433, column: 1, scope: !622)
