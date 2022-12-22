; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_17.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_17_bad() #0 !dbg !68 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i26 = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %j, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 -1, i32* %data, align 4, !dbg !79
  store i32 0, i32* %i, align 4, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !83
  %cmp = icmp slt i32 %0, 1, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !87, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !91, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !114, metadata !DIExpression()), !dbg !115
  store i32 -1, i32* %connectSocket, align 4, !dbg !115
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  br label %do.body, !dbg !118

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !119
  store i32 %call, i32* %connectSocket, align 4, !dbg !121
  %1 = load i32, i32* %connectSocket, align 4, !dbg !122
  %cmp1 = icmp eq i32 %1, -1, !dbg !124
  br i1 %cmp1, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !126

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !128
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !129
  store i16 2, i16* %sin_family, align 4, !dbg !130
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !131
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !132
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !133
  store i32 %call2, i32* %s_addr, align 4, !dbg !134
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !135
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !136
  store i16 %call3, i16* %sin_port, align 2, !dbg !137
  %3 = load i32, i32* %connectSocket, align 4, !dbg !138
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !140
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !141
  %cmp5 = icmp eq i32 %call4, -1, !dbg !142
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !143

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !144

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !146
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !147
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !148
  %conv = trunc i64 %call8 to i32, !dbg !148
  store i32 %conv, i32* %recvResult, align 4, !dbg !149
  %6 = load i32, i32* %recvResult, align 4, !dbg !150
  %cmp9 = icmp eq i32 %6, -1, !dbg !152
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !153

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !154
  %cmp11 = icmp eq i32 %7, 0, !dbg !155
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !156

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !157

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !159
  %idxprom = sext i32 %8 to i64, !dbg !160
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !160
  store i8 0, i8* %arrayidx, align 1, !dbg !161
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !162
  %call16 = call i32 @atoi(i8* %arraydecay15) #10, !dbg !163
  store i32 %call16, i32* %data, align 4, !dbg !164
  br label %do.end, !dbg !165

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %9 = load i32, i32* %connectSocket, align 4, !dbg !166
  %cmp17 = icmp ne i32 %9, -1, !dbg !168
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !169

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !170
  %call20 = call i32 @close(i32 %10), !dbg !172
  br label %if.end21, !dbg !173

if.end21:                                         ; preds = %if.then19, %do.end
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %if.end21
  %11 = load i32, i32* %i, align 4, !dbg !175
  %inc = add nsw i32 %11, 1, !dbg !175
  store i32 %inc, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !180
  br label %for.cond22, !dbg !182

for.cond22:                                       ; preds = %for.inc56, %for.end
  %12 = load i32, i32* %j, align 4, !dbg !183
  %cmp23 = icmp slt i32 %12, 1, !dbg !185
  br i1 %cmp23, label %for.body25, label %for.end58, !dbg !186

for.body25:                                       ; preds = %for.cond22
  call void @llvm.dbg.declare(metadata i32* %i26, metadata !187, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !191, metadata !DIExpression()), !dbg !192
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !193
  %13 = bitcast i8* %call27 to i32*, !dbg !194
  store i32* %13, i32** %buffer, align 8, !dbg !192
  %14 = load i32*, i32** %buffer, align 8, !dbg !195
  %cmp28 = icmp eq i32* %14, null, !dbg !197
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !198

if.then30:                                        ; preds = %for.body25
  call void @exit(i32 -1) #11, !dbg !199
  unreachable, !dbg !199

if.end31:                                         ; preds = %for.body25
  store i32 0, i32* %i26, align 4, !dbg !201
  br label %for.cond32, !dbg !203

for.cond32:                                       ; preds = %for.inc38, %if.end31
  %15 = load i32, i32* %i26, align 4, !dbg !204
  %cmp33 = icmp slt i32 %15, 10, !dbg !206
  br i1 %cmp33, label %for.body35, label %for.end40, !dbg !207

for.body35:                                       ; preds = %for.cond32
  %16 = load i32*, i32** %buffer, align 8, !dbg !208
  %17 = load i32, i32* %i26, align 4, !dbg !210
  %idxprom36 = sext i32 %17 to i64, !dbg !208
  %arrayidx37 = getelementptr inbounds i32, i32* %16, i64 %idxprom36, !dbg !208
  store i32 0, i32* %arrayidx37, align 4, !dbg !211
  br label %for.inc38, !dbg !212

for.inc38:                                        ; preds = %for.body35
  %18 = load i32, i32* %i26, align 4, !dbg !213
  %inc39 = add nsw i32 %18, 1, !dbg !213
  store i32 %inc39, i32* %i26, align 4, !dbg !213
  br label %for.cond32, !dbg !214, !llvm.loop !215

for.end40:                                        ; preds = %for.cond32
  %19 = load i32, i32* %data, align 4, !dbg !217
  %cmp41 = icmp sge i32 %19, 0, !dbg !219
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !220

if.then43:                                        ; preds = %for.end40
  %20 = load i32*, i32** %buffer, align 8, !dbg !221
  %21 = load i32, i32* %data, align 4, !dbg !223
  %idxprom44 = sext i32 %21 to i64, !dbg !221
  %arrayidx45 = getelementptr inbounds i32, i32* %20, i64 %idxprom44, !dbg !221
  store i32 1, i32* %arrayidx45, align 4, !dbg !224
  store i32 0, i32* %i26, align 4, !dbg !225
  br label %for.cond46, !dbg !227

for.cond46:                                       ; preds = %for.inc52, %if.then43
  %22 = load i32, i32* %i26, align 4, !dbg !228
  %cmp47 = icmp slt i32 %22, 10, !dbg !230
  br i1 %cmp47, label %for.body49, label %for.end54, !dbg !231

for.body49:                                       ; preds = %for.cond46
  %23 = load i32*, i32** %buffer, align 8, !dbg !232
  %24 = load i32, i32* %i26, align 4, !dbg !234
  %idxprom50 = sext i32 %24 to i64, !dbg !232
  %arrayidx51 = getelementptr inbounds i32, i32* %23, i64 %idxprom50, !dbg !232
  %25 = load i32, i32* %arrayidx51, align 4, !dbg !232
  call void @printIntLine(i32 %25), !dbg !235
  br label %for.inc52, !dbg !236

for.inc52:                                        ; preds = %for.body49
  %26 = load i32, i32* %i26, align 4, !dbg !237
  %inc53 = add nsw i32 %26, 1, !dbg !237
  store i32 %inc53, i32* %i26, align 4, !dbg !237
  br label %for.cond46, !dbg !238, !llvm.loop !239

for.end54:                                        ; preds = %for.cond46
  br label %if.end55, !dbg !241

if.else:                                          ; preds = %for.end40
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !242
  br label %if.end55

if.end55:                                         ; preds = %if.else, %for.end54
  %27 = load i32*, i32** %buffer, align 8, !dbg !244
  %28 = bitcast i32* %27 to i8*, !dbg !244
  call void @free(i8* %28) #8, !dbg !245
  br label %for.inc56, !dbg !246

for.inc56:                                        ; preds = %if.end55
  %29 = load i32, i32* %j, align 4, !dbg !247
  %inc57 = add nsw i32 %29, 1, !dbg !247
  store i32 %inc57, i32* %j, align 4, !dbg !247
  br label %for.cond22, !dbg !248, !llvm.loop !249

for.end58:                                        ; preds = %for.cond22
  ret void, !dbg !251
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_17_good() #0 !dbg !252 {
entry:
  call void @goodB2G(), !dbg !253
  call void @goodG2B(), !dbg !254
  ret void, !dbg !255
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !256 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !261, metadata !DIExpression()), !dbg !262
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !263, metadata !DIExpression()), !dbg !264
  %call = call i64 @time(i64* null) #8, !dbg !265
  %conv = trunc i64 %call to i32, !dbg !266
  call void @srand(i32 %conv) #8, !dbg !267
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !268
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_17_good(), !dbg !269
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !270
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !271
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_17_bad(), !dbg !272
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !273
  ret i32 0, !dbg !274
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !275 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i26 = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !276, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata i32* %k, metadata !278, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.declare(metadata i32* %data, metadata !280, metadata !DIExpression()), !dbg !281
  store i32 -1, i32* %data, align 4, !dbg !282
  store i32 0, i32* %i, align 4, !dbg !283
  br label %for.cond, !dbg !285

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !286
  %cmp = icmp slt i32 %0, 1, !dbg !288
  br i1 %cmp, label %for.body, label %for.end, !dbg !289

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !290, metadata !DIExpression()), !dbg !293
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !294, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !296, metadata !DIExpression()), !dbg !297
  store i32 -1, i32* %connectSocket, align 4, !dbg !297
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !298, metadata !DIExpression()), !dbg !299
  br label %do.body, !dbg !300

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !301
  store i32 %call, i32* %connectSocket, align 4, !dbg !303
  %1 = load i32, i32* %connectSocket, align 4, !dbg !304
  %cmp1 = icmp eq i32 %1, -1, !dbg !306
  br i1 %cmp1, label %if.then, label %if.end, !dbg !307

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !308

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !310
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !310
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !311
  store i16 2, i16* %sin_family, align 4, !dbg !312
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !313
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !314
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !315
  store i32 %call2, i32* %s_addr, align 4, !dbg !316
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !317
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !318
  store i16 %call3, i16* %sin_port, align 2, !dbg !319
  %3 = load i32, i32* %connectSocket, align 4, !dbg !320
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !322
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !323
  %cmp5 = icmp eq i32 %call4, -1, !dbg !324
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !325

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !326

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !328
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !329
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !330
  %conv = trunc i64 %call8 to i32, !dbg !330
  store i32 %conv, i32* %recvResult, align 4, !dbg !331
  %6 = load i32, i32* %recvResult, align 4, !dbg !332
  %cmp9 = icmp eq i32 %6, -1, !dbg !334
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !335

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !336
  %cmp11 = icmp eq i32 %7, 0, !dbg !337
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !338

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !339

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !341
  %idxprom = sext i32 %8 to i64, !dbg !342
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !342
  store i8 0, i8* %arrayidx, align 1, !dbg !343
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !344
  %call16 = call i32 @atoi(i8* %arraydecay15) #10, !dbg !345
  store i32 %call16, i32* %data, align 4, !dbg !346
  br label %do.end, !dbg !347

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %9 = load i32, i32* %connectSocket, align 4, !dbg !348
  %cmp17 = icmp ne i32 %9, -1, !dbg !350
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !351

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !352
  %call20 = call i32 @close(i32 %10), !dbg !354
  br label %if.end21, !dbg !355

if.end21:                                         ; preds = %if.then19, %do.end
  br label %for.inc, !dbg !356

for.inc:                                          ; preds = %if.end21
  %11 = load i32, i32* %i, align 4, !dbg !357
  %inc = add nsw i32 %11, 1, !dbg !357
  store i32 %inc, i32* %i, align 4, !dbg !357
  br label %for.cond, !dbg !358, !llvm.loop !359

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !361
  br label %for.cond22, !dbg !363

for.cond22:                                       ; preds = %for.inc58, %for.end
  %12 = load i32, i32* %k, align 4, !dbg !364
  %cmp23 = icmp slt i32 %12, 1, !dbg !366
  br i1 %cmp23, label %for.body25, label %for.end60, !dbg !367

for.body25:                                       ; preds = %for.cond22
  call void @llvm.dbg.declare(metadata i32* %i26, metadata !368, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !372, metadata !DIExpression()), !dbg !373
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !374
  %13 = bitcast i8* %call27 to i32*, !dbg !375
  store i32* %13, i32** %buffer, align 8, !dbg !373
  %14 = load i32*, i32** %buffer, align 8, !dbg !376
  %cmp28 = icmp eq i32* %14, null, !dbg !378
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !379

if.then30:                                        ; preds = %for.body25
  call void @exit(i32 -1) #11, !dbg !380
  unreachable, !dbg !380

if.end31:                                         ; preds = %for.body25
  store i32 0, i32* %i26, align 4, !dbg !382
  br label %for.cond32, !dbg !384

for.cond32:                                       ; preds = %for.inc38, %if.end31
  %15 = load i32, i32* %i26, align 4, !dbg !385
  %cmp33 = icmp slt i32 %15, 10, !dbg !387
  br i1 %cmp33, label %for.body35, label %for.end40, !dbg !388

for.body35:                                       ; preds = %for.cond32
  %16 = load i32*, i32** %buffer, align 8, !dbg !389
  %17 = load i32, i32* %i26, align 4, !dbg !391
  %idxprom36 = sext i32 %17 to i64, !dbg !389
  %arrayidx37 = getelementptr inbounds i32, i32* %16, i64 %idxprom36, !dbg !389
  store i32 0, i32* %arrayidx37, align 4, !dbg !392
  br label %for.inc38, !dbg !393

for.inc38:                                        ; preds = %for.body35
  %18 = load i32, i32* %i26, align 4, !dbg !394
  %inc39 = add nsw i32 %18, 1, !dbg !394
  store i32 %inc39, i32* %i26, align 4, !dbg !394
  br label %for.cond32, !dbg !395, !llvm.loop !396

for.end40:                                        ; preds = %for.cond32
  %19 = load i32, i32* %data, align 4, !dbg !398
  %cmp41 = icmp sge i32 %19, 0, !dbg !400
  br i1 %cmp41, label %land.lhs.true, label %if.else, !dbg !401

land.lhs.true:                                    ; preds = %for.end40
  %20 = load i32, i32* %data, align 4, !dbg !402
  %cmp43 = icmp slt i32 %20, 10, !dbg !403
  br i1 %cmp43, label %if.then45, label %if.else, !dbg !404

if.then45:                                        ; preds = %land.lhs.true
  %21 = load i32*, i32** %buffer, align 8, !dbg !405
  %22 = load i32, i32* %data, align 4, !dbg !407
  %idxprom46 = sext i32 %22 to i64, !dbg !405
  %arrayidx47 = getelementptr inbounds i32, i32* %21, i64 %idxprom46, !dbg !405
  store i32 1, i32* %arrayidx47, align 4, !dbg !408
  store i32 0, i32* %i26, align 4, !dbg !409
  br label %for.cond48, !dbg !411

for.cond48:                                       ; preds = %for.inc54, %if.then45
  %23 = load i32, i32* %i26, align 4, !dbg !412
  %cmp49 = icmp slt i32 %23, 10, !dbg !414
  br i1 %cmp49, label %for.body51, label %for.end56, !dbg !415

for.body51:                                       ; preds = %for.cond48
  %24 = load i32*, i32** %buffer, align 8, !dbg !416
  %25 = load i32, i32* %i26, align 4, !dbg !418
  %idxprom52 = sext i32 %25 to i64, !dbg !416
  %arrayidx53 = getelementptr inbounds i32, i32* %24, i64 %idxprom52, !dbg !416
  %26 = load i32, i32* %arrayidx53, align 4, !dbg !416
  call void @printIntLine(i32 %26), !dbg !419
  br label %for.inc54, !dbg !420

for.inc54:                                        ; preds = %for.body51
  %27 = load i32, i32* %i26, align 4, !dbg !421
  %inc55 = add nsw i32 %27, 1, !dbg !421
  store i32 %inc55, i32* %i26, align 4, !dbg !421
  br label %for.cond48, !dbg !422, !llvm.loop !423

for.end56:                                        ; preds = %for.cond48
  br label %if.end57, !dbg !425

if.else:                                          ; preds = %land.lhs.true, %for.end40
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !426
  br label %if.end57

if.end57:                                         ; preds = %if.else, %for.end56
  %28 = load i32*, i32** %buffer, align 8, !dbg !428
  %29 = bitcast i32* %28 to i8*, !dbg !428
  call void @free(i8* %29) #8, !dbg !429
  br label %for.inc58, !dbg !430

for.inc58:                                        ; preds = %if.end57
  %30 = load i32, i32* %k, align 4, !dbg !431
  %inc59 = add nsw i32 %30, 1, !dbg !431
  store i32 %inc59, i32* %k, align 4, !dbg !431
  br label %for.cond22, !dbg !432, !llvm.loop !433

for.end60:                                        ; preds = %for.cond22
  ret void, !dbg !435
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !436 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !437, metadata !DIExpression()), !dbg !438
  call void @llvm.dbg.declare(metadata i32* %j, metadata !439, metadata !DIExpression()), !dbg !440
  call void @llvm.dbg.declare(metadata i32* %data, metadata !441, metadata !DIExpression()), !dbg !442
  store i32 -1, i32* %data, align 4, !dbg !443
  store i32 0, i32* %h, align 4, !dbg !444
  br label %for.cond, !dbg !446

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !447
  %cmp = icmp slt i32 %0, 1, !dbg !449
  br i1 %cmp, label %for.body, label %for.end, !dbg !450

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !451
  br label %for.inc, !dbg !453

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !454
  %inc = add nsw i32 %1, 1, !dbg !454
  store i32 %inc, i32* %h, align 4, !dbg !454
  br label %for.cond, !dbg !455, !llvm.loop !456

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !458
  br label %for.cond1, !dbg !460

for.cond1:                                        ; preds = %for.inc24, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !461
  %cmp2 = icmp slt i32 %2, 1, !dbg !463
  br i1 %cmp2, label %for.body3, label %for.end26, !dbg !464

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !465, metadata !DIExpression()), !dbg !468
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !469, metadata !DIExpression()), !dbg !470
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !471
  %3 = bitcast i8* %call to i32*, !dbg !472
  store i32* %3, i32** %buffer, align 8, !dbg !470
  %4 = load i32*, i32** %buffer, align 8, !dbg !473
  %cmp4 = icmp eq i32* %4, null, !dbg !475
  br i1 %cmp4, label %if.then, label %if.end, !dbg !476

if.then:                                          ; preds = %for.body3
  call void @exit(i32 -1) #11, !dbg !477
  unreachable, !dbg !477

if.end:                                           ; preds = %for.body3
  store i32 0, i32* %i, align 4, !dbg !479
  br label %for.cond5, !dbg !481

for.cond5:                                        ; preds = %for.inc8, %if.end
  %5 = load i32, i32* %i, align 4, !dbg !482
  %cmp6 = icmp slt i32 %5, 10, !dbg !484
  br i1 %cmp6, label %for.body7, label %for.end10, !dbg !485

for.body7:                                        ; preds = %for.cond5
  %6 = load i32*, i32** %buffer, align 8, !dbg !486
  %7 = load i32, i32* %i, align 4, !dbg !488
  %idxprom = sext i32 %7 to i64, !dbg !486
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom, !dbg !486
  store i32 0, i32* %arrayidx, align 4, !dbg !489
  br label %for.inc8, !dbg !490

for.inc8:                                         ; preds = %for.body7
  %8 = load i32, i32* %i, align 4, !dbg !491
  %inc9 = add nsw i32 %8, 1, !dbg !491
  store i32 %inc9, i32* %i, align 4, !dbg !491
  br label %for.cond5, !dbg !492, !llvm.loop !493

for.end10:                                        ; preds = %for.cond5
  %9 = load i32, i32* %data, align 4, !dbg !495
  %cmp11 = icmp sge i32 %9, 0, !dbg !497
  br i1 %cmp11, label %if.then12, label %if.else, !dbg !498

if.then12:                                        ; preds = %for.end10
  %10 = load i32*, i32** %buffer, align 8, !dbg !499
  %11 = load i32, i32* %data, align 4, !dbg !501
  %idxprom13 = sext i32 %11 to i64, !dbg !499
  %arrayidx14 = getelementptr inbounds i32, i32* %10, i64 %idxprom13, !dbg !499
  store i32 1, i32* %arrayidx14, align 4, !dbg !502
  store i32 0, i32* %i, align 4, !dbg !503
  br label %for.cond15, !dbg !505

for.cond15:                                       ; preds = %for.inc20, %if.then12
  %12 = load i32, i32* %i, align 4, !dbg !506
  %cmp16 = icmp slt i32 %12, 10, !dbg !508
  br i1 %cmp16, label %for.body17, label %for.end22, !dbg !509

for.body17:                                       ; preds = %for.cond15
  %13 = load i32*, i32** %buffer, align 8, !dbg !510
  %14 = load i32, i32* %i, align 4, !dbg !512
  %idxprom18 = sext i32 %14 to i64, !dbg !510
  %arrayidx19 = getelementptr inbounds i32, i32* %13, i64 %idxprom18, !dbg !510
  %15 = load i32, i32* %arrayidx19, align 4, !dbg !510
  call void @printIntLine(i32 %15), !dbg !513
  br label %for.inc20, !dbg !514

for.inc20:                                        ; preds = %for.body17
  %16 = load i32, i32* %i, align 4, !dbg !515
  %inc21 = add nsw i32 %16, 1, !dbg !515
  store i32 %inc21, i32* %i, align 4, !dbg !515
  br label %for.cond15, !dbg !516, !llvm.loop !517

for.end22:                                        ; preds = %for.cond15
  br label %if.end23, !dbg !519

if.else:                                          ; preds = %for.end10
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !520
  br label %if.end23

if.end23:                                         ; preds = %if.else, %for.end22
  %17 = load i32*, i32** %buffer, align 8, !dbg !522
  %18 = bitcast i32* %17 to i8*, !dbg !522
  call void @free(i8* %18) #8, !dbg !523
  br label %for.inc24, !dbg !524

for.inc24:                                        ; preds = %if.end23
  %19 = load i32, i32* %j, align 4, !dbg !525
  %inc25 = add nsw i32 %19, 1, !dbg !525
  store i32 %inc25, i32* %j, align 4, !dbg !525
  br label %for.cond1, !dbg !526, !llvm.loop !527

for.end26:                                        ; preds = %for.cond1
  ret void, !dbg !529
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_17.c", directory: "/root/SSE-Assessment")
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_17_bad", scope: !69, file: !69, line: 44, type: !70, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_17.c", directory: "/root/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "i", scope: !68, file: !69, line: 46, type: !60)
!74 = !DILocation(line: 46, column: 9, scope: !68)
!75 = !DILocalVariable(name: "j", scope: !68, file: !69, line: 46, type: !60)
!76 = !DILocation(line: 46, column: 11, scope: !68)
!77 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 47, type: !60)
!78 = !DILocation(line: 47, column: 9, scope: !68)
!79 = !DILocation(line: 49, column: 10, scope: !68)
!80 = !DILocation(line: 50, column: 11, scope: !81)
!81 = distinct !DILexicalBlock(scope: !68, file: !69, line: 50, column: 5)
!82 = !DILocation(line: 50, column: 9, scope: !81)
!83 = !DILocation(line: 50, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !69, line: 50, column: 5)
!85 = !DILocation(line: 50, column: 18, scope: !84)
!86 = !DILocation(line: 50, column: 5, scope: !81)
!87 = !DILocalVariable(name: "recvResult", scope: !88, file: !69, line: 57, type: !60)
!88 = distinct !DILexicalBlock(scope: !89, file: !69, line: 52, column: 9)
!89 = distinct !DILexicalBlock(scope: !84, file: !69, line: 51, column: 5)
!90 = !DILocation(line: 57, column: 17, scope: !88)
!91 = !DILocalVariable(name: "service", scope: !88, file: !69, line: 58, type: !92)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !93)
!93 = !{!94, !95, !101, !108}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !92, file: !17, line: 239, baseType: !51, size: 16)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !92, file: !17, line: 240, baseType: !96, size: 16, offset: 16)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !98, line: 25, baseType: !99)
!98 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !100, line: 39, baseType: !53)
!100 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !92, file: !17, line: 241, baseType: !102, size: 32, offset: 32)
!102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !103)
!103 = !{!104}
!104 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !102, file: !17, line: 33, baseType: !105, size: 32)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !106)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !98, line: 26, baseType: !107)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !100, line: 41, baseType: !5)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !92, file: !17, line: 244, baseType: !109, size: 64, offset: 64)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !110, size: 64, elements: !111)
!110 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!111 = !{!112}
!112 = !DISubrange(count: 8)
!113 = !DILocation(line: 58, column: 32, scope: !88)
!114 = !DILocalVariable(name: "connectSocket", scope: !88, file: !69, line: 59, type: !60)
!115 = !DILocation(line: 59, column: 20, scope: !88)
!116 = !DILocalVariable(name: "inputBuffer", scope: !88, file: !69, line: 60, type: !55)
!117 = !DILocation(line: 60, column: 18, scope: !88)
!118 = !DILocation(line: 61, column: 13, scope: !88)
!119 = !DILocation(line: 71, column: 33, scope: !120)
!120 = distinct !DILexicalBlock(scope: !88, file: !69, line: 62, column: 13)
!121 = !DILocation(line: 71, column: 31, scope: !120)
!122 = !DILocation(line: 72, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !69, line: 72, column: 21)
!124 = !DILocation(line: 72, column: 35, scope: !123)
!125 = !DILocation(line: 72, column: 21, scope: !120)
!126 = !DILocation(line: 74, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !69, line: 73, column: 17)
!128 = !DILocation(line: 76, column: 17, scope: !120)
!129 = !DILocation(line: 77, column: 25, scope: !120)
!130 = !DILocation(line: 77, column: 36, scope: !120)
!131 = !DILocation(line: 78, column: 43, scope: !120)
!132 = !DILocation(line: 78, column: 25, scope: !120)
!133 = !DILocation(line: 78, column: 34, scope: !120)
!134 = !DILocation(line: 78, column: 41, scope: !120)
!135 = !DILocation(line: 79, column: 36, scope: !120)
!136 = !DILocation(line: 79, column: 25, scope: !120)
!137 = !DILocation(line: 79, column: 34, scope: !120)
!138 = !DILocation(line: 80, column: 29, scope: !139)
!139 = distinct !DILexicalBlock(scope: !120, file: !69, line: 80, column: 21)
!140 = !DILocation(line: 80, column: 44, scope: !139)
!141 = !DILocation(line: 80, column: 21, scope: !139)
!142 = !DILocation(line: 80, column: 89, scope: !139)
!143 = !DILocation(line: 80, column: 21, scope: !120)
!144 = !DILocation(line: 82, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !69, line: 81, column: 17)
!146 = !DILocation(line: 86, column: 35, scope: !120)
!147 = !DILocation(line: 86, column: 50, scope: !120)
!148 = !DILocation(line: 86, column: 30, scope: !120)
!149 = !DILocation(line: 86, column: 28, scope: !120)
!150 = !DILocation(line: 87, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !120, file: !69, line: 87, column: 21)
!152 = !DILocation(line: 87, column: 32, scope: !151)
!153 = !DILocation(line: 87, column: 48, scope: !151)
!154 = !DILocation(line: 87, column: 51, scope: !151)
!155 = !DILocation(line: 87, column: 62, scope: !151)
!156 = !DILocation(line: 87, column: 21, scope: !120)
!157 = !DILocation(line: 89, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !69, line: 88, column: 17)
!159 = !DILocation(line: 92, column: 29, scope: !120)
!160 = !DILocation(line: 92, column: 17, scope: !120)
!161 = !DILocation(line: 92, column: 41, scope: !120)
!162 = !DILocation(line: 94, column: 29, scope: !120)
!163 = !DILocation(line: 94, column: 24, scope: !120)
!164 = !DILocation(line: 94, column: 22, scope: !120)
!165 = !DILocation(line: 95, column: 13, scope: !120)
!166 = !DILocation(line: 97, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !88, file: !69, line: 97, column: 17)
!168 = !DILocation(line: 97, column: 31, scope: !167)
!169 = !DILocation(line: 97, column: 17, scope: !88)
!170 = !DILocation(line: 99, column: 30, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !69, line: 98, column: 13)
!172 = !DILocation(line: 99, column: 17, scope: !171)
!173 = !DILocation(line: 100, column: 13, scope: !171)
!174 = !DILocation(line: 108, column: 5, scope: !89)
!175 = !DILocation(line: 50, column: 24, scope: !84)
!176 = !DILocation(line: 50, column: 5, scope: !84)
!177 = distinct !{!177, !86, !178, !179}
!178 = !DILocation(line: 108, column: 5, scope: !81)
!179 = !{!"llvm.loop.mustprogress"}
!180 = !DILocation(line: 109, column: 11, scope: !181)
!181 = distinct !DILexicalBlock(scope: !68, file: !69, line: 109, column: 5)
!182 = !DILocation(line: 109, column: 9, scope: !181)
!183 = !DILocation(line: 109, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !69, line: 109, column: 5)
!185 = !DILocation(line: 109, column: 18, scope: !184)
!186 = !DILocation(line: 109, column: 5, scope: !181)
!187 = !DILocalVariable(name: "i", scope: !188, file: !69, line: 112, type: !60)
!188 = distinct !DILexicalBlock(scope: !189, file: !69, line: 111, column: 9)
!189 = distinct !DILexicalBlock(scope: !184, file: !69, line: 110, column: 5)
!190 = !DILocation(line: 112, column: 17, scope: !188)
!191 = !DILocalVariable(name: "buffer", scope: !188, file: !69, line: 113, type: !59)
!192 = !DILocation(line: 113, column: 19, scope: !188)
!193 = !DILocation(line: 113, column: 35, scope: !188)
!194 = !DILocation(line: 113, column: 28, scope: !188)
!195 = !DILocation(line: 114, column: 17, scope: !196)
!196 = distinct !DILexicalBlock(scope: !188, file: !69, line: 114, column: 17)
!197 = !DILocation(line: 114, column: 24, scope: !196)
!198 = !DILocation(line: 114, column: 17, scope: !188)
!199 = !DILocation(line: 114, column: 34, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !69, line: 114, column: 33)
!201 = !DILocation(line: 116, column: 20, scope: !202)
!202 = distinct !DILexicalBlock(scope: !188, file: !69, line: 116, column: 13)
!203 = !DILocation(line: 116, column: 18, scope: !202)
!204 = !DILocation(line: 116, column: 25, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !69, line: 116, column: 13)
!206 = !DILocation(line: 116, column: 27, scope: !205)
!207 = !DILocation(line: 116, column: 13, scope: !202)
!208 = !DILocation(line: 118, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !69, line: 117, column: 13)
!210 = !DILocation(line: 118, column: 24, scope: !209)
!211 = !DILocation(line: 118, column: 27, scope: !209)
!212 = !DILocation(line: 119, column: 13, scope: !209)
!213 = !DILocation(line: 116, column: 34, scope: !205)
!214 = !DILocation(line: 116, column: 13, scope: !205)
!215 = distinct !{!215, !207, !216, !179}
!216 = !DILocation(line: 119, column: 13, scope: !202)
!217 = !DILocation(line: 122, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !188, file: !69, line: 122, column: 17)
!219 = !DILocation(line: 122, column: 22, scope: !218)
!220 = !DILocation(line: 122, column: 17, scope: !188)
!221 = !DILocation(line: 124, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !69, line: 123, column: 13)
!223 = !DILocation(line: 124, column: 24, scope: !222)
!224 = !DILocation(line: 124, column: 30, scope: !222)
!225 = !DILocation(line: 126, column: 23, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !69, line: 126, column: 17)
!227 = !DILocation(line: 126, column: 21, scope: !226)
!228 = !DILocation(line: 126, column: 28, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !69, line: 126, column: 17)
!230 = !DILocation(line: 126, column: 30, scope: !229)
!231 = !DILocation(line: 126, column: 17, scope: !226)
!232 = !DILocation(line: 128, column: 34, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !69, line: 127, column: 17)
!234 = !DILocation(line: 128, column: 41, scope: !233)
!235 = !DILocation(line: 128, column: 21, scope: !233)
!236 = !DILocation(line: 129, column: 17, scope: !233)
!237 = !DILocation(line: 126, column: 37, scope: !229)
!238 = !DILocation(line: 126, column: 17, scope: !229)
!239 = distinct !{!239, !231, !240, !179}
!240 = !DILocation(line: 129, column: 17, scope: !226)
!241 = !DILocation(line: 130, column: 13, scope: !222)
!242 = !DILocation(line: 133, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !218, file: !69, line: 132, column: 13)
!244 = !DILocation(line: 135, column: 18, scope: !188)
!245 = !DILocation(line: 135, column: 13, scope: !188)
!246 = !DILocation(line: 137, column: 5, scope: !189)
!247 = !DILocation(line: 109, column: 24, scope: !184)
!248 = !DILocation(line: 109, column: 5, scope: !184)
!249 = distinct !{!249, !186, !250, !179}
!250 = !DILocation(line: 137, column: 5, scope: !181)
!251 = !DILocation(line: 138, column: 1, scope: !68)
!252 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_17_good", scope: !69, file: !69, line: 284, type: !70, scopeLine: 285, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!253 = !DILocation(line: 286, column: 5, scope: !252)
!254 = !DILocation(line: 287, column: 5, scope: !252)
!255 = !DILocation(line: 288, column: 1, scope: !252)
!256 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 299, type: !257, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!257 = !DISubroutineType(types: !258)
!258 = !{!60, !60, !259}
!259 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !260, size: 64)
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!261 = !DILocalVariable(name: "argc", arg: 1, scope: !256, file: !69, line: 299, type: !60)
!262 = !DILocation(line: 299, column: 14, scope: !256)
!263 = !DILocalVariable(name: "argv", arg: 2, scope: !256, file: !69, line: 299, type: !259)
!264 = !DILocation(line: 299, column: 27, scope: !256)
!265 = !DILocation(line: 302, column: 22, scope: !256)
!266 = !DILocation(line: 302, column: 12, scope: !256)
!267 = !DILocation(line: 302, column: 5, scope: !256)
!268 = !DILocation(line: 304, column: 5, scope: !256)
!269 = !DILocation(line: 305, column: 5, scope: !256)
!270 = !DILocation(line: 306, column: 5, scope: !256)
!271 = !DILocation(line: 309, column: 5, scope: !256)
!272 = !DILocation(line: 310, column: 5, scope: !256)
!273 = !DILocation(line: 311, column: 5, scope: !256)
!274 = !DILocation(line: 313, column: 5, scope: !256)
!275 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 145, type: !70, scopeLine: 146, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!276 = !DILocalVariable(name: "i", scope: !275, file: !69, line: 147, type: !60)
!277 = !DILocation(line: 147, column: 9, scope: !275)
!278 = !DILocalVariable(name: "k", scope: !275, file: !69, line: 147, type: !60)
!279 = !DILocation(line: 147, column: 11, scope: !275)
!280 = !DILocalVariable(name: "data", scope: !275, file: !69, line: 148, type: !60)
!281 = !DILocation(line: 148, column: 9, scope: !275)
!282 = !DILocation(line: 150, column: 10, scope: !275)
!283 = !DILocation(line: 151, column: 11, scope: !284)
!284 = distinct !DILexicalBlock(scope: !275, file: !69, line: 151, column: 5)
!285 = !DILocation(line: 151, column: 9, scope: !284)
!286 = !DILocation(line: 151, column: 16, scope: !287)
!287 = distinct !DILexicalBlock(scope: !284, file: !69, line: 151, column: 5)
!288 = !DILocation(line: 151, column: 18, scope: !287)
!289 = !DILocation(line: 151, column: 5, scope: !284)
!290 = !DILocalVariable(name: "recvResult", scope: !291, file: !69, line: 158, type: !60)
!291 = distinct !DILexicalBlock(scope: !292, file: !69, line: 153, column: 9)
!292 = distinct !DILexicalBlock(scope: !287, file: !69, line: 152, column: 5)
!293 = !DILocation(line: 158, column: 17, scope: !291)
!294 = !DILocalVariable(name: "service", scope: !291, file: !69, line: 159, type: !92)
!295 = !DILocation(line: 159, column: 32, scope: !291)
!296 = !DILocalVariable(name: "connectSocket", scope: !291, file: !69, line: 160, type: !60)
!297 = !DILocation(line: 160, column: 20, scope: !291)
!298 = !DILocalVariable(name: "inputBuffer", scope: !291, file: !69, line: 161, type: !55)
!299 = !DILocation(line: 161, column: 18, scope: !291)
!300 = !DILocation(line: 162, column: 13, scope: !291)
!301 = !DILocation(line: 172, column: 33, scope: !302)
!302 = distinct !DILexicalBlock(scope: !291, file: !69, line: 163, column: 13)
!303 = !DILocation(line: 172, column: 31, scope: !302)
!304 = !DILocation(line: 173, column: 21, scope: !305)
!305 = distinct !DILexicalBlock(scope: !302, file: !69, line: 173, column: 21)
!306 = !DILocation(line: 173, column: 35, scope: !305)
!307 = !DILocation(line: 173, column: 21, scope: !302)
!308 = !DILocation(line: 175, column: 21, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !69, line: 174, column: 17)
!310 = !DILocation(line: 177, column: 17, scope: !302)
!311 = !DILocation(line: 178, column: 25, scope: !302)
!312 = !DILocation(line: 178, column: 36, scope: !302)
!313 = !DILocation(line: 179, column: 43, scope: !302)
!314 = !DILocation(line: 179, column: 25, scope: !302)
!315 = !DILocation(line: 179, column: 34, scope: !302)
!316 = !DILocation(line: 179, column: 41, scope: !302)
!317 = !DILocation(line: 180, column: 36, scope: !302)
!318 = !DILocation(line: 180, column: 25, scope: !302)
!319 = !DILocation(line: 180, column: 34, scope: !302)
!320 = !DILocation(line: 181, column: 29, scope: !321)
!321 = distinct !DILexicalBlock(scope: !302, file: !69, line: 181, column: 21)
!322 = !DILocation(line: 181, column: 44, scope: !321)
!323 = !DILocation(line: 181, column: 21, scope: !321)
!324 = !DILocation(line: 181, column: 89, scope: !321)
!325 = !DILocation(line: 181, column: 21, scope: !302)
!326 = !DILocation(line: 183, column: 21, scope: !327)
!327 = distinct !DILexicalBlock(scope: !321, file: !69, line: 182, column: 17)
!328 = !DILocation(line: 187, column: 35, scope: !302)
!329 = !DILocation(line: 187, column: 50, scope: !302)
!330 = !DILocation(line: 187, column: 30, scope: !302)
!331 = !DILocation(line: 187, column: 28, scope: !302)
!332 = !DILocation(line: 188, column: 21, scope: !333)
!333 = distinct !DILexicalBlock(scope: !302, file: !69, line: 188, column: 21)
!334 = !DILocation(line: 188, column: 32, scope: !333)
!335 = !DILocation(line: 188, column: 48, scope: !333)
!336 = !DILocation(line: 188, column: 51, scope: !333)
!337 = !DILocation(line: 188, column: 62, scope: !333)
!338 = !DILocation(line: 188, column: 21, scope: !302)
!339 = !DILocation(line: 190, column: 21, scope: !340)
!340 = distinct !DILexicalBlock(scope: !333, file: !69, line: 189, column: 17)
!341 = !DILocation(line: 193, column: 29, scope: !302)
!342 = !DILocation(line: 193, column: 17, scope: !302)
!343 = !DILocation(line: 193, column: 41, scope: !302)
!344 = !DILocation(line: 195, column: 29, scope: !302)
!345 = !DILocation(line: 195, column: 24, scope: !302)
!346 = !DILocation(line: 195, column: 22, scope: !302)
!347 = !DILocation(line: 196, column: 13, scope: !302)
!348 = !DILocation(line: 198, column: 17, scope: !349)
!349 = distinct !DILexicalBlock(scope: !291, file: !69, line: 198, column: 17)
!350 = !DILocation(line: 198, column: 31, scope: !349)
!351 = !DILocation(line: 198, column: 17, scope: !291)
!352 = !DILocation(line: 200, column: 30, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !69, line: 199, column: 13)
!354 = !DILocation(line: 200, column: 17, scope: !353)
!355 = !DILocation(line: 201, column: 13, scope: !353)
!356 = !DILocation(line: 209, column: 5, scope: !292)
!357 = !DILocation(line: 151, column: 24, scope: !287)
!358 = !DILocation(line: 151, column: 5, scope: !287)
!359 = distinct !{!359, !289, !360, !179}
!360 = !DILocation(line: 209, column: 5, scope: !284)
!361 = !DILocation(line: 210, column: 11, scope: !362)
!362 = distinct !DILexicalBlock(scope: !275, file: !69, line: 210, column: 5)
!363 = !DILocation(line: 210, column: 9, scope: !362)
!364 = !DILocation(line: 210, column: 16, scope: !365)
!365 = distinct !DILexicalBlock(scope: !362, file: !69, line: 210, column: 5)
!366 = !DILocation(line: 210, column: 18, scope: !365)
!367 = !DILocation(line: 210, column: 5, scope: !362)
!368 = !DILocalVariable(name: "i", scope: !369, file: !69, line: 213, type: !60)
!369 = distinct !DILexicalBlock(scope: !370, file: !69, line: 212, column: 9)
!370 = distinct !DILexicalBlock(scope: !365, file: !69, line: 211, column: 5)
!371 = !DILocation(line: 213, column: 17, scope: !369)
!372 = !DILocalVariable(name: "buffer", scope: !369, file: !69, line: 214, type: !59)
!373 = !DILocation(line: 214, column: 19, scope: !369)
!374 = !DILocation(line: 214, column: 35, scope: !369)
!375 = !DILocation(line: 214, column: 28, scope: !369)
!376 = !DILocation(line: 215, column: 17, scope: !377)
!377 = distinct !DILexicalBlock(scope: !369, file: !69, line: 215, column: 17)
!378 = !DILocation(line: 215, column: 24, scope: !377)
!379 = !DILocation(line: 215, column: 17, scope: !369)
!380 = !DILocation(line: 215, column: 34, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !69, line: 215, column: 33)
!382 = !DILocation(line: 217, column: 20, scope: !383)
!383 = distinct !DILexicalBlock(scope: !369, file: !69, line: 217, column: 13)
!384 = !DILocation(line: 217, column: 18, scope: !383)
!385 = !DILocation(line: 217, column: 25, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !69, line: 217, column: 13)
!387 = !DILocation(line: 217, column: 27, scope: !386)
!388 = !DILocation(line: 217, column: 13, scope: !383)
!389 = !DILocation(line: 219, column: 17, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !69, line: 218, column: 13)
!391 = !DILocation(line: 219, column: 24, scope: !390)
!392 = !DILocation(line: 219, column: 27, scope: !390)
!393 = !DILocation(line: 220, column: 13, scope: !390)
!394 = !DILocation(line: 217, column: 34, scope: !386)
!395 = !DILocation(line: 217, column: 13, scope: !386)
!396 = distinct !{!396, !388, !397, !179}
!397 = !DILocation(line: 220, column: 13, scope: !383)
!398 = !DILocation(line: 222, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !369, file: !69, line: 222, column: 17)
!400 = !DILocation(line: 222, column: 22, scope: !399)
!401 = !DILocation(line: 222, column: 27, scope: !399)
!402 = !DILocation(line: 222, column: 30, scope: !399)
!403 = !DILocation(line: 222, column: 35, scope: !399)
!404 = !DILocation(line: 222, column: 17, scope: !369)
!405 = !DILocation(line: 224, column: 17, scope: !406)
!406 = distinct !DILexicalBlock(scope: !399, file: !69, line: 223, column: 13)
!407 = !DILocation(line: 224, column: 24, scope: !406)
!408 = !DILocation(line: 224, column: 30, scope: !406)
!409 = !DILocation(line: 226, column: 23, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !69, line: 226, column: 17)
!411 = !DILocation(line: 226, column: 21, scope: !410)
!412 = !DILocation(line: 226, column: 28, scope: !413)
!413 = distinct !DILexicalBlock(scope: !410, file: !69, line: 226, column: 17)
!414 = !DILocation(line: 226, column: 30, scope: !413)
!415 = !DILocation(line: 226, column: 17, scope: !410)
!416 = !DILocation(line: 228, column: 34, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !69, line: 227, column: 17)
!418 = !DILocation(line: 228, column: 41, scope: !417)
!419 = !DILocation(line: 228, column: 21, scope: !417)
!420 = !DILocation(line: 229, column: 17, scope: !417)
!421 = !DILocation(line: 226, column: 37, scope: !413)
!422 = !DILocation(line: 226, column: 17, scope: !413)
!423 = distinct !{!423, !415, !424, !179}
!424 = !DILocation(line: 229, column: 17, scope: !410)
!425 = !DILocation(line: 230, column: 13, scope: !406)
!426 = !DILocation(line: 233, column: 17, scope: !427)
!427 = distinct !DILexicalBlock(scope: !399, file: !69, line: 232, column: 13)
!428 = !DILocation(line: 235, column: 18, scope: !369)
!429 = !DILocation(line: 235, column: 13, scope: !369)
!430 = !DILocation(line: 237, column: 5, scope: !370)
!431 = !DILocation(line: 210, column: 24, scope: !365)
!432 = !DILocation(line: 210, column: 5, scope: !365)
!433 = distinct !{!433, !367, !434, !179}
!434 = !DILocation(line: 237, column: 5, scope: !362)
!435 = !DILocation(line: 238, column: 1, scope: !275)
!436 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 241, type: !70, scopeLine: 242, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!437 = !DILocalVariable(name: "h", scope: !436, file: !69, line: 243, type: !60)
!438 = !DILocation(line: 243, column: 9, scope: !436)
!439 = !DILocalVariable(name: "j", scope: !436, file: !69, line: 243, type: !60)
!440 = !DILocation(line: 243, column: 11, scope: !436)
!441 = !DILocalVariable(name: "data", scope: !436, file: !69, line: 244, type: !60)
!442 = !DILocation(line: 244, column: 9, scope: !436)
!443 = !DILocation(line: 246, column: 10, scope: !436)
!444 = !DILocation(line: 247, column: 11, scope: !445)
!445 = distinct !DILexicalBlock(scope: !436, file: !69, line: 247, column: 5)
!446 = !DILocation(line: 247, column: 9, scope: !445)
!447 = !DILocation(line: 247, column: 16, scope: !448)
!448 = distinct !DILexicalBlock(scope: !445, file: !69, line: 247, column: 5)
!449 = !DILocation(line: 247, column: 18, scope: !448)
!450 = !DILocation(line: 247, column: 5, scope: !445)
!451 = !DILocation(line: 251, column: 14, scope: !452)
!452 = distinct !DILexicalBlock(scope: !448, file: !69, line: 248, column: 5)
!453 = !DILocation(line: 252, column: 5, scope: !452)
!454 = !DILocation(line: 247, column: 24, scope: !448)
!455 = !DILocation(line: 247, column: 5, scope: !448)
!456 = distinct !{!456, !450, !457, !179}
!457 = !DILocation(line: 252, column: 5, scope: !445)
!458 = !DILocation(line: 253, column: 11, scope: !459)
!459 = distinct !DILexicalBlock(scope: !436, file: !69, line: 253, column: 5)
!460 = !DILocation(line: 253, column: 9, scope: !459)
!461 = !DILocation(line: 253, column: 16, scope: !462)
!462 = distinct !DILexicalBlock(scope: !459, file: !69, line: 253, column: 5)
!463 = !DILocation(line: 253, column: 18, scope: !462)
!464 = !DILocation(line: 253, column: 5, scope: !459)
!465 = !DILocalVariable(name: "i", scope: !466, file: !69, line: 256, type: !60)
!466 = distinct !DILexicalBlock(scope: !467, file: !69, line: 255, column: 9)
!467 = distinct !DILexicalBlock(scope: !462, file: !69, line: 254, column: 5)
!468 = !DILocation(line: 256, column: 17, scope: !466)
!469 = !DILocalVariable(name: "buffer", scope: !466, file: !69, line: 257, type: !59)
!470 = !DILocation(line: 257, column: 19, scope: !466)
!471 = !DILocation(line: 257, column: 35, scope: !466)
!472 = !DILocation(line: 257, column: 28, scope: !466)
!473 = !DILocation(line: 258, column: 17, scope: !474)
!474 = distinct !DILexicalBlock(scope: !466, file: !69, line: 258, column: 17)
!475 = !DILocation(line: 258, column: 24, scope: !474)
!476 = !DILocation(line: 258, column: 17, scope: !466)
!477 = !DILocation(line: 258, column: 34, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !69, line: 258, column: 33)
!479 = !DILocation(line: 260, column: 20, scope: !480)
!480 = distinct !DILexicalBlock(scope: !466, file: !69, line: 260, column: 13)
!481 = !DILocation(line: 260, column: 18, scope: !480)
!482 = !DILocation(line: 260, column: 25, scope: !483)
!483 = distinct !DILexicalBlock(scope: !480, file: !69, line: 260, column: 13)
!484 = !DILocation(line: 260, column: 27, scope: !483)
!485 = !DILocation(line: 260, column: 13, scope: !480)
!486 = !DILocation(line: 262, column: 17, scope: !487)
!487 = distinct !DILexicalBlock(scope: !483, file: !69, line: 261, column: 13)
!488 = !DILocation(line: 262, column: 24, scope: !487)
!489 = !DILocation(line: 262, column: 27, scope: !487)
!490 = !DILocation(line: 263, column: 13, scope: !487)
!491 = !DILocation(line: 260, column: 34, scope: !483)
!492 = !DILocation(line: 260, column: 13, scope: !483)
!493 = distinct !{!493, !485, !494, !179}
!494 = !DILocation(line: 263, column: 13, scope: !480)
!495 = !DILocation(line: 266, column: 17, scope: !496)
!496 = distinct !DILexicalBlock(scope: !466, file: !69, line: 266, column: 17)
!497 = !DILocation(line: 266, column: 22, scope: !496)
!498 = !DILocation(line: 266, column: 17, scope: !466)
!499 = !DILocation(line: 268, column: 17, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !69, line: 267, column: 13)
!501 = !DILocation(line: 268, column: 24, scope: !500)
!502 = !DILocation(line: 268, column: 30, scope: !500)
!503 = !DILocation(line: 270, column: 23, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !69, line: 270, column: 17)
!505 = !DILocation(line: 270, column: 21, scope: !504)
!506 = !DILocation(line: 270, column: 28, scope: !507)
!507 = distinct !DILexicalBlock(scope: !504, file: !69, line: 270, column: 17)
!508 = !DILocation(line: 270, column: 30, scope: !507)
!509 = !DILocation(line: 270, column: 17, scope: !504)
!510 = !DILocation(line: 272, column: 34, scope: !511)
!511 = distinct !DILexicalBlock(scope: !507, file: !69, line: 271, column: 17)
!512 = !DILocation(line: 272, column: 41, scope: !511)
!513 = !DILocation(line: 272, column: 21, scope: !511)
!514 = !DILocation(line: 273, column: 17, scope: !511)
!515 = !DILocation(line: 270, column: 37, scope: !507)
!516 = !DILocation(line: 270, column: 17, scope: !507)
!517 = distinct !{!517, !509, !518, !179}
!518 = !DILocation(line: 273, column: 17, scope: !504)
!519 = !DILocation(line: 274, column: 13, scope: !500)
!520 = !DILocation(line: 277, column: 17, scope: !521)
!521 = distinct !DILexicalBlock(scope: !496, file: !69, line: 276, column: 13)
!522 = !DILocation(line: 279, column: 18, scope: !466)
!523 = !DILocation(line: 279, column: 13, scope: !466)
!524 = !DILocation(line: 281, column: 5, scope: !467)
!525 = !DILocation(line: 253, column: 24, scope: !462)
!526 = !DILocation(line: 253, column: 5, scope: !462)
!527 = distinct !{!527, !464, !528, !179}
!528 = !DILocation(line: 281, column: 5, scope: !459)
!529 = !DILocation(line: 282, column: 1, scope: !436)
