; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08.c"
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
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_bad() #0 !dbg !68 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !76
  %tobool = icmp ne i32 %call, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.end23, !dbg !78

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !79, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !83, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %connectSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  br label %do.body, !dbg !110

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !111
  store i32 %call1, i32* %connectSocket, align 4, !dbg !113
  %0 = load i32, i32* %connectSocket, align 4, !dbg !114
  %cmp = icmp eq i32 %0, -1, !dbg !116
  br i1 %cmp, label %if.then2, label %if.end, !dbg !117

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !118

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !120
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !121
  store i16 2, i16* %sin_family, align 4, !dbg !122
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !123
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !124
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !125
  store i32 %call3, i32* %s_addr, align 4, !dbg !126
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !127
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !128
  store i16 %call4, i16* %sin_port, align 2, !dbg !129
  %2 = load i32, i32* %connectSocket, align 4, !dbg !130
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !132
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !133
  %cmp6 = icmp eq i32 %call5, -1, !dbg !134
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !135

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !136

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !138
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !139
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !140
  %conv = trunc i64 %call9 to i32, !dbg !140
  store i32 %conv, i32* %recvResult, align 4, !dbg !141
  %5 = load i32, i32* %recvResult, align 4, !dbg !142
  %cmp10 = icmp eq i32 %5, -1, !dbg !144
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !145

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !146
  %cmp12 = icmp eq i32 %6, 0, !dbg !147
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !148

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !149

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !151
  %idxprom = sext i32 %7 to i64, !dbg !152
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !153
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !154
  %call17 = call i32 @atoi(i8* %arraydecay16) #10, !dbg !155
  store i32 %call17, i32* %data, align 4, !dbg !156
  br label %do.end, !dbg !157

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !158
  %cmp18 = icmp ne i32 %8, -1, !dbg !160
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !161

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !162
  %call21 = call i32 @close(i32 %9), !dbg !164
  br label %if.end22, !dbg !165

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !166

if.end23:                                         ; preds = %if.end22, %entry
  %call24 = call i32 @staticReturnsTrue(), !dbg !167
  %tobool25 = icmp ne i32 %call24, 0, !dbg !167
  br i1 %tobool25, label %if.then26, label %if.end51, !dbg !169

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !170, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !174, metadata !DIExpression()), !dbg !175
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !176
  %10 = bitcast i8* %call27 to i32*, !dbg !177
  store i32* %10, i32** %buffer, align 8, !dbg !175
  %11 = load i32*, i32** %buffer, align 8, !dbg !178
  %cmp28 = icmp eq i32* %11, null, !dbg !180
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !181

if.then30:                                        ; preds = %if.then26
  call void @exit(i32 -1) #11, !dbg !182
  unreachable, !dbg !182

if.end31:                                         ; preds = %if.then26
  store i32 0, i32* %i, align 4, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end31
  %12 = load i32, i32* %i, align 4, !dbg !187
  %cmp32 = icmp slt i32 %12, 10, !dbg !189
  br i1 %cmp32, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !191
  %14 = load i32, i32* %i, align 4, !dbg !193
  %idxprom34 = sext i32 %14 to i64, !dbg !191
  %arrayidx35 = getelementptr inbounds i32, i32* %13, i64 %idxprom34, !dbg !191
  store i32 0, i32* %arrayidx35, align 4, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !196
  %inc = add nsw i32 %15, 1, !dbg !196
  store i32 %inc, i32* %i, align 4, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !201
  %cmp36 = icmp sge i32 %16, 0, !dbg !203
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !204

if.then38:                                        ; preds = %for.end
  %17 = load i32*, i32** %buffer, align 8, !dbg !205
  %18 = load i32, i32* %data, align 4, !dbg !207
  %idxprom39 = sext i32 %18 to i64, !dbg !205
  %arrayidx40 = getelementptr inbounds i32, i32* %17, i64 %idxprom39, !dbg !205
  store i32 1, i32* %arrayidx40, align 4, !dbg !208
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond41, !dbg !211

for.cond41:                                       ; preds = %for.inc47, %if.then38
  %19 = load i32, i32* %i, align 4, !dbg !212
  %cmp42 = icmp slt i32 %19, 10, !dbg !214
  br i1 %cmp42, label %for.body44, label %for.end49, !dbg !215

for.body44:                                       ; preds = %for.cond41
  %20 = load i32*, i32** %buffer, align 8, !dbg !216
  %21 = load i32, i32* %i, align 4, !dbg !218
  %idxprom45 = sext i32 %21 to i64, !dbg !216
  %arrayidx46 = getelementptr inbounds i32, i32* %20, i64 %idxprom45, !dbg !216
  %22 = load i32, i32* %arrayidx46, align 4, !dbg !216
  call void @printIntLine(i32 %22), !dbg !219
  br label %for.inc47, !dbg !220

for.inc47:                                        ; preds = %for.body44
  %23 = load i32, i32* %i, align 4, !dbg !221
  %inc48 = add nsw i32 %23, 1, !dbg !221
  store i32 %inc48, i32* %i, align 4, !dbg !221
  br label %for.cond41, !dbg !222, !llvm.loop !223

for.end49:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !225

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !226
  br label %if.end50

if.end50:                                         ; preds = %if.else, %for.end49
  %24 = load i32*, i32** %buffer, align 8, !dbg !228
  %25 = bitcast i32* %24 to i8*, !dbg !228
  call void @free(i8* %25) #8, !dbg !229
  br label %if.end51, !dbg !230

if.end51:                                         ; preds = %if.end50, %if.end23
  ret void, !dbg !231
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_good() #0 !dbg !232 {
entry:
  call void @goodB2G1(), !dbg !233
  call void @goodB2G2(), !dbg !234
  call void @goodG2B1(), !dbg !235
  call void @goodG2B2(), !dbg !236
  ret void, !dbg !237
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !238 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !243, metadata !DIExpression()), !dbg !244
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !245, metadata !DIExpression()), !dbg !246
  %call = call i64 @time(i64* null) #8, !dbg !247
  %conv = trunc i64 %call to i32, !dbg !248
  call void @srand(i32 %conv) #8, !dbg !249
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !250
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_good(), !dbg !251
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !252
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !253
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_bad(), !dbg !254
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !255
  ret i32 0, !dbg !256
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !257 {
entry:
  ret i32 1, !dbg !260
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !261 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %data, align 4, !dbg !264
  %call = call i32 @staticReturnsTrue(), !dbg !265
  %tobool = icmp ne i32 %call, 0, !dbg !265
  br i1 %tobool, label %if.then, label %if.end23, !dbg !267

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !268, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !272, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !274, metadata !DIExpression()), !dbg !275
  store i32 -1, i32* %connectSocket, align 4, !dbg !275
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !276, metadata !DIExpression()), !dbg !277
  br label %do.body, !dbg !278

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !279
  store i32 %call1, i32* %connectSocket, align 4, !dbg !281
  %0 = load i32, i32* %connectSocket, align 4, !dbg !282
  %cmp = icmp eq i32 %0, -1, !dbg !284
  br i1 %cmp, label %if.then2, label %if.end, !dbg !285

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !286

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !288
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !288
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !289
  store i16 2, i16* %sin_family, align 4, !dbg !290
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !291
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !292
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !293
  store i32 %call3, i32* %s_addr, align 4, !dbg !294
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !295
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !296
  store i16 %call4, i16* %sin_port, align 2, !dbg !297
  %2 = load i32, i32* %connectSocket, align 4, !dbg !298
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !300
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !301
  %cmp6 = icmp eq i32 %call5, -1, !dbg !302
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !303

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !304

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !306
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !307
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !308
  %conv = trunc i64 %call9 to i32, !dbg !308
  store i32 %conv, i32* %recvResult, align 4, !dbg !309
  %5 = load i32, i32* %recvResult, align 4, !dbg !310
  %cmp10 = icmp eq i32 %5, -1, !dbg !312
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !313

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !314
  %cmp12 = icmp eq i32 %6, 0, !dbg !315
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !316

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !317

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !319
  %idxprom = sext i32 %7 to i64, !dbg !320
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !320
  store i8 0, i8* %arrayidx, align 1, !dbg !321
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !322
  %call17 = call i32 @atoi(i8* %arraydecay16) #10, !dbg !323
  store i32 %call17, i32* %data, align 4, !dbg !324
  br label %do.end, !dbg !325

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !326
  %cmp18 = icmp ne i32 %8, -1, !dbg !328
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !329

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !330
  %call21 = call i32 @close(i32 %9), !dbg !332
  br label %if.end22, !dbg !333

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !334

if.end23:                                         ; preds = %if.end22, %entry
  %call24 = call i32 @staticReturnsFalse(), !dbg !335
  %tobool25 = icmp ne i32 %call24, 0, !dbg !335
  br i1 %tobool25, label %if.then26, label %if.else, !dbg !337

if.then26:                                        ; preds = %if.end23
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !338
  br label %if.end54, !dbg !340

if.else:                                          ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !341, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !345, metadata !DIExpression()), !dbg !346
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !347
  %10 = bitcast i8* %call27 to i32*, !dbg !348
  store i32* %10, i32** %buffer, align 8, !dbg !346
  %11 = load i32*, i32** %buffer, align 8, !dbg !349
  %cmp28 = icmp eq i32* %11, null, !dbg !351
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !352

if.then30:                                        ; preds = %if.else
  call void @exit(i32 -1) #11, !dbg !353
  unreachable, !dbg !353

if.end31:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !355
  br label %for.cond, !dbg !357

for.cond:                                         ; preds = %for.inc, %if.end31
  %12 = load i32, i32* %i, align 4, !dbg !358
  %cmp32 = icmp slt i32 %12, 10, !dbg !360
  br i1 %cmp32, label %for.body, label %for.end, !dbg !361

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !362
  %14 = load i32, i32* %i, align 4, !dbg !364
  %idxprom34 = sext i32 %14 to i64, !dbg !362
  %arrayidx35 = getelementptr inbounds i32, i32* %13, i64 %idxprom34, !dbg !362
  store i32 0, i32* %arrayidx35, align 4, !dbg !365
  br label %for.inc, !dbg !366

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !367
  %inc = add nsw i32 %15, 1, !dbg !367
  store i32 %inc, i32* %i, align 4, !dbg !367
  br label %for.cond, !dbg !368, !llvm.loop !369

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !371
  %cmp36 = icmp sge i32 %16, 0, !dbg !373
  br i1 %cmp36, label %land.lhs.true, label %if.else52, !dbg !374

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !375
  %cmp38 = icmp slt i32 %17, 10, !dbg !376
  br i1 %cmp38, label %if.then40, label %if.else52, !dbg !377

if.then40:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !378
  %19 = load i32, i32* %data, align 4, !dbg !380
  %idxprom41 = sext i32 %19 to i64, !dbg !378
  %arrayidx42 = getelementptr inbounds i32, i32* %18, i64 %idxprom41, !dbg !378
  store i32 1, i32* %arrayidx42, align 4, !dbg !381
  store i32 0, i32* %i, align 4, !dbg !382
  br label %for.cond43, !dbg !384

for.cond43:                                       ; preds = %for.inc49, %if.then40
  %20 = load i32, i32* %i, align 4, !dbg !385
  %cmp44 = icmp slt i32 %20, 10, !dbg !387
  br i1 %cmp44, label %for.body46, label %for.end51, !dbg !388

for.body46:                                       ; preds = %for.cond43
  %21 = load i32*, i32** %buffer, align 8, !dbg !389
  %22 = load i32, i32* %i, align 4, !dbg !391
  %idxprom47 = sext i32 %22 to i64, !dbg !389
  %arrayidx48 = getelementptr inbounds i32, i32* %21, i64 %idxprom47, !dbg !389
  %23 = load i32, i32* %arrayidx48, align 4, !dbg !389
  call void @printIntLine(i32 %23), !dbg !392
  br label %for.inc49, !dbg !393

for.inc49:                                        ; preds = %for.body46
  %24 = load i32, i32* %i, align 4, !dbg !394
  %inc50 = add nsw i32 %24, 1, !dbg !394
  store i32 %inc50, i32* %i, align 4, !dbg !394
  br label %for.cond43, !dbg !395, !llvm.loop !396

for.end51:                                        ; preds = %for.cond43
  br label %if.end53, !dbg !398

if.else52:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !399
  br label %if.end53

if.end53:                                         ; preds = %if.else52, %for.end51
  %25 = load i32*, i32** %buffer, align 8, !dbg !401
  %26 = bitcast i32* %25 to i8*, !dbg !401
  call void @free(i8* %26) #8, !dbg !402
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.then26
  ret void, !dbg !403
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !404 {
entry:
  ret i32 0, !dbg !405
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !406 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !407, metadata !DIExpression()), !dbg !408
  store i32 -1, i32* %data, align 4, !dbg !409
  %call = call i32 @staticReturnsTrue(), !dbg !410
  %tobool = icmp ne i32 %call, 0, !dbg !410
  br i1 %tobool, label %if.then, label %if.end23, !dbg !412

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !413, metadata !DIExpression()), !dbg !416
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !417, metadata !DIExpression()), !dbg !418
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !419, metadata !DIExpression()), !dbg !420
  store i32 -1, i32* %connectSocket, align 4, !dbg !420
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !421, metadata !DIExpression()), !dbg !422
  br label %do.body, !dbg !423

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !424
  store i32 %call1, i32* %connectSocket, align 4, !dbg !426
  %0 = load i32, i32* %connectSocket, align 4, !dbg !427
  %cmp = icmp eq i32 %0, -1, !dbg !429
  br i1 %cmp, label %if.then2, label %if.end, !dbg !430

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !431

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !433
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !433
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !434
  store i16 2, i16* %sin_family, align 4, !dbg !435
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !436
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !437
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !438
  store i32 %call3, i32* %s_addr, align 4, !dbg !439
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !440
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !441
  store i16 %call4, i16* %sin_port, align 2, !dbg !442
  %2 = load i32, i32* %connectSocket, align 4, !dbg !443
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !445
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !446
  %cmp6 = icmp eq i32 %call5, -1, !dbg !447
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !448

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !449

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !451
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !452
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !453
  %conv = trunc i64 %call9 to i32, !dbg !453
  store i32 %conv, i32* %recvResult, align 4, !dbg !454
  %5 = load i32, i32* %recvResult, align 4, !dbg !455
  %cmp10 = icmp eq i32 %5, -1, !dbg !457
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !458

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !459
  %cmp12 = icmp eq i32 %6, 0, !dbg !460
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !461

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !462

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !464
  %idxprom = sext i32 %7 to i64, !dbg !465
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !465
  store i8 0, i8* %arrayidx, align 1, !dbg !466
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !467
  %call17 = call i32 @atoi(i8* %arraydecay16) #10, !dbg !468
  store i32 %call17, i32* %data, align 4, !dbg !469
  br label %do.end, !dbg !470

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !471
  %cmp18 = icmp ne i32 %8, -1, !dbg !473
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !474

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !475
  %call21 = call i32 @close(i32 %9), !dbg !477
  br label %if.end22, !dbg !478

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end23, !dbg !479

if.end23:                                         ; preds = %if.end22, %entry
  %call24 = call i32 @staticReturnsTrue(), !dbg !480
  %tobool25 = icmp ne i32 %call24, 0, !dbg !480
  br i1 %tobool25, label %if.then26, label %if.end53, !dbg !482

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !483, metadata !DIExpression()), !dbg !486
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !487, metadata !DIExpression()), !dbg !488
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !489
  %10 = bitcast i8* %call27 to i32*, !dbg !490
  store i32* %10, i32** %buffer, align 8, !dbg !488
  %11 = load i32*, i32** %buffer, align 8, !dbg !491
  %cmp28 = icmp eq i32* %11, null, !dbg !493
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !494

if.then30:                                        ; preds = %if.then26
  call void @exit(i32 -1) #11, !dbg !495
  unreachable, !dbg !495

if.end31:                                         ; preds = %if.then26
  store i32 0, i32* %i, align 4, !dbg !497
  br label %for.cond, !dbg !499

for.cond:                                         ; preds = %for.inc, %if.end31
  %12 = load i32, i32* %i, align 4, !dbg !500
  %cmp32 = icmp slt i32 %12, 10, !dbg !502
  br i1 %cmp32, label %for.body, label %for.end, !dbg !503

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !504
  %14 = load i32, i32* %i, align 4, !dbg !506
  %idxprom34 = sext i32 %14 to i64, !dbg !504
  %arrayidx35 = getelementptr inbounds i32, i32* %13, i64 %idxprom34, !dbg !504
  store i32 0, i32* %arrayidx35, align 4, !dbg !507
  br label %for.inc, !dbg !508

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !509
  %inc = add nsw i32 %15, 1, !dbg !509
  store i32 %inc, i32* %i, align 4, !dbg !509
  br label %for.cond, !dbg !510, !llvm.loop !511

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !513
  %cmp36 = icmp sge i32 %16, 0, !dbg !515
  br i1 %cmp36, label %land.lhs.true, label %if.else, !dbg !516

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !517
  %cmp38 = icmp slt i32 %17, 10, !dbg !518
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !519

if.then40:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !520
  %19 = load i32, i32* %data, align 4, !dbg !522
  %idxprom41 = sext i32 %19 to i64, !dbg !520
  %arrayidx42 = getelementptr inbounds i32, i32* %18, i64 %idxprom41, !dbg !520
  store i32 1, i32* %arrayidx42, align 4, !dbg !523
  store i32 0, i32* %i, align 4, !dbg !524
  br label %for.cond43, !dbg !526

for.cond43:                                       ; preds = %for.inc49, %if.then40
  %20 = load i32, i32* %i, align 4, !dbg !527
  %cmp44 = icmp slt i32 %20, 10, !dbg !529
  br i1 %cmp44, label %for.body46, label %for.end51, !dbg !530

for.body46:                                       ; preds = %for.cond43
  %21 = load i32*, i32** %buffer, align 8, !dbg !531
  %22 = load i32, i32* %i, align 4, !dbg !533
  %idxprom47 = sext i32 %22 to i64, !dbg !531
  %arrayidx48 = getelementptr inbounds i32, i32* %21, i64 %idxprom47, !dbg !531
  %23 = load i32, i32* %arrayidx48, align 4, !dbg !531
  call void @printIntLine(i32 %23), !dbg !534
  br label %for.inc49, !dbg !535

for.inc49:                                        ; preds = %for.body46
  %24 = load i32, i32* %i, align 4, !dbg !536
  %inc50 = add nsw i32 %24, 1, !dbg !536
  store i32 %inc50, i32* %i, align 4, !dbg !536
  br label %for.cond43, !dbg !537, !llvm.loop !538

for.end51:                                        ; preds = %for.cond43
  br label %if.end52, !dbg !540

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !541
  br label %if.end52

if.end52:                                         ; preds = %if.else, %for.end51
  %25 = load i32*, i32** %buffer, align 8, !dbg !543
  %26 = bitcast i32* %25 to i8*, !dbg !543
  call void @free(i8* %26) #8, !dbg !544
  br label %if.end53, !dbg !545

if.end53:                                         ; preds = %if.end52, %if.end23
  ret void, !dbg !546
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !547 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !548, metadata !DIExpression()), !dbg !549
  store i32 -1, i32* %data, align 4, !dbg !550
  %call = call i32 @staticReturnsFalse(), !dbg !551
  %tobool = icmp ne i32 %call, 0, !dbg !551
  br i1 %tobool, label %if.then, label %if.else, !dbg !553

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !554
  br label %if.end, !dbg !556

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !557
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !559
  %tobool2 = icmp ne i32 %call1, 0, !dbg !559
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !561

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !562, metadata !DIExpression()), !dbg !565
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !566, metadata !DIExpression()), !dbg !567
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !568
  %0 = bitcast i8* %call4 to i32*, !dbg !569
  store i32* %0, i32** %buffer, align 8, !dbg !567
  %1 = load i32*, i32** %buffer, align 8, !dbg !570
  %cmp = icmp eq i32* %1, null, !dbg !572
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !573

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #11, !dbg !574
  unreachable, !dbg !574

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !576
  br label %for.cond, !dbg !578

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !579
  %cmp7 = icmp slt i32 %2, 10, !dbg !581
  br i1 %cmp7, label %for.body, label %for.end, !dbg !582

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !583
  %4 = load i32, i32* %i, align 4, !dbg !585
  %idxprom = sext i32 %4 to i64, !dbg !583
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !583
  store i32 0, i32* %arrayidx, align 4, !dbg !586
  br label %for.inc, !dbg !587

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !588
  %inc = add nsw i32 %5, 1, !dbg !588
  store i32 %inc, i32* %i, align 4, !dbg !588
  br label %for.cond, !dbg !589, !llvm.loop !590

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !592
  %cmp8 = icmp sge i32 %6, 0, !dbg !594
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !595

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !596
  %8 = load i32, i32* %data, align 4, !dbg !598
  %idxprom10 = sext i32 %8 to i64, !dbg !596
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !596
  store i32 1, i32* %arrayidx11, align 4, !dbg !599
  store i32 0, i32* %i, align 4, !dbg !600
  br label %for.cond12, !dbg !602

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !603
  %cmp13 = icmp slt i32 %9, 10, !dbg !605
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !606

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !607
  %11 = load i32, i32* %i, align 4, !dbg !609
  %idxprom15 = sext i32 %11 to i64, !dbg !607
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !607
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !607
  call void @printIntLine(i32 %12), !dbg !610
  br label %for.inc17, !dbg !611

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !612
  %inc18 = add nsw i32 %13, 1, !dbg !612
  store i32 %inc18, i32* %i, align 4, !dbg !612
  br label %for.cond12, !dbg !613, !llvm.loop !614

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !616

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !617
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !619
  %15 = bitcast i32* %14 to i8*, !dbg !619
  call void @free(i8* %15) #8, !dbg !620
  br label %if.end22, !dbg !621

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !622
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !623 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !624, metadata !DIExpression()), !dbg !625
  store i32 -1, i32* %data, align 4, !dbg !626
  %call = call i32 @staticReturnsTrue(), !dbg !627
  %tobool = icmp ne i32 %call, 0, !dbg !627
  br i1 %tobool, label %if.then, label %if.end, !dbg !629

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !630
  br label %if.end, !dbg !632

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !633
  %tobool2 = icmp ne i32 %call1, 0, !dbg !633
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !635

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !636, metadata !DIExpression()), !dbg !639
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !640, metadata !DIExpression()), !dbg !641
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !642
  %0 = bitcast i8* %call4 to i32*, !dbg !643
  store i32* %0, i32** %buffer, align 8, !dbg !641
  %1 = load i32*, i32** %buffer, align 8, !dbg !644
  %cmp = icmp eq i32* %1, null, !dbg !646
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !647

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #11, !dbg !648
  unreachable, !dbg !648

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !650
  br label %for.cond, !dbg !652

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !653
  %cmp7 = icmp slt i32 %2, 10, !dbg !655
  br i1 %cmp7, label %for.body, label %for.end, !dbg !656

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !657
  %4 = load i32, i32* %i, align 4, !dbg !659
  %idxprom = sext i32 %4 to i64, !dbg !657
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !657
  store i32 0, i32* %arrayidx, align 4, !dbg !660
  br label %for.inc, !dbg !661

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !662
  %inc = add nsw i32 %5, 1, !dbg !662
  store i32 %inc, i32* %i, align 4, !dbg !662
  br label %for.cond, !dbg !663, !llvm.loop !664

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !666
  %cmp8 = icmp sge i32 %6, 0, !dbg !668
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !669

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !670
  %8 = load i32, i32* %data, align 4, !dbg !672
  %idxprom10 = sext i32 %8 to i64, !dbg !670
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !670
  store i32 1, i32* %arrayidx11, align 4, !dbg !673
  store i32 0, i32* %i, align 4, !dbg !674
  br label %for.cond12, !dbg !676

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !677
  %cmp13 = icmp slt i32 %9, 10, !dbg !679
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !680

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !681
  %11 = load i32, i32* %i, align 4, !dbg !683
  %idxprom15 = sext i32 %11 to i64, !dbg !681
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !681
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !681
  call void @printIntLine(i32 %12), !dbg !684
  br label %for.inc17, !dbg !685

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !686
  %inc18 = add nsw i32 %13, 1, !dbg !686
  store i32 %inc18, i32* %i, align 4, !dbg !686
  br label %for.cond12, !dbg !687, !llvm.loop !688

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !690

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !691
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !693
  %15 = bitcast i32* %14 to i8*, !dbg !693
  call void @free(i8* %15) #8, !dbg !694
  br label %if.end21, !dbg !695

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !696
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08.c", directory: "/root/SSE-Assessment")
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_bad", scope: !69, file: !69, line: 57, type: !70, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08.c", directory: "/root/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 59, type: !60)
!74 = !DILocation(line: 59, column: 9, scope: !68)
!75 = !DILocation(line: 61, column: 10, scope: !68)
!76 = !DILocation(line: 62, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !68, file: !69, line: 62, column: 8)
!78 = !DILocation(line: 62, column: 8, scope: !68)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !69, line: 69, type: !60)
!80 = distinct !DILexicalBlock(scope: !81, file: !69, line: 64, column: 9)
!81 = distinct !DILexicalBlock(scope: !77, file: !69, line: 63, column: 5)
!82 = !DILocation(line: 69, column: 17, scope: !80)
!83 = !DILocalVariable(name: "service", scope: !80, file: !69, line: 70, type: !84)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !85)
!85 = !{!86, !87, !93, !100}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !84, file: !17, line: 239, baseType: !51, size: 16)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !84, file: !17, line: 240, baseType: !88, size: 16, offset: 16)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !90, line: 25, baseType: !91)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !92, line: 39, baseType: !53)
!92 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !84, file: !17, line: 241, baseType: !94, size: 32, offset: 32)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !95)
!95 = !{!96}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !94, file: !17, line: 33, baseType: !97, size: 32)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !90, line: 26, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !92, line: 41, baseType: !5)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !84, file: !17, line: 244, baseType: !101, size: 64, offset: 64)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 64, elements: !103)
!102 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!103 = !{!104}
!104 = !DISubrange(count: 8)
!105 = !DILocation(line: 70, column: 32, scope: !80)
!106 = !DILocalVariable(name: "connectSocket", scope: !80, file: !69, line: 71, type: !60)
!107 = !DILocation(line: 71, column: 20, scope: !80)
!108 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !69, line: 72, type: !55)
!109 = !DILocation(line: 72, column: 18, scope: !80)
!110 = !DILocation(line: 73, column: 13, scope: !80)
!111 = !DILocation(line: 83, column: 33, scope: !112)
!112 = distinct !DILexicalBlock(scope: !80, file: !69, line: 74, column: 13)
!113 = !DILocation(line: 83, column: 31, scope: !112)
!114 = !DILocation(line: 84, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !69, line: 84, column: 21)
!116 = !DILocation(line: 84, column: 35, scope: !115)
!117 = !DILocation(line: 84, column: 21, scope: !112)
!118 = !DILocation(line: 86, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !69, line: 85, column: 17)
!120 = !DILocation(line: 88, column: 17, scope: !112)
!121 = !DILocation(line: 89, column: 25, scope: !112)
!122 = !DILocation(line: 89, column: 36, scope: !112)
!123 = !DILocation(line: 90, column: 43, scope: !112)
!124 = !DILocation(line: 90, column: 25, scope: !112)
!125 = !DILocation(line: 90, column: 34, scope: !112)
!126 = !DILocation(line: 90, column: 41, scope: !112)
!127 = !DILocation(line: 91, column: 36, scope: !112)
!128 = !DILocation(line: 91, column: 25, scope: !112)
!129 = !DILocation(line: 91, column: 34, scope: !112)
!130 = !DILocation(line: 92, column: 29, scope: !131)
!131 = distinct !DILexicalBlock(scope: !112, file: !69, line: 92, column: 21)
!132 = !DILocation(line: 92, column: 44, scope: !131)
!133 = !DILocation(line: 92, column: 21, scope: !131)
!134 = !DILocation(line: 92, column: 89, scope: !131)
!135 = !DILocation(line: 92, column: 21, scope: !112)
!136 = !DILocation(line: 94, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !69, line: 93, column: 17)
!138 = !DILocation(line: 98, column: 35, scope: !112)
!139 = !DILocation(line: 98, column: 50, scope: !112)
!140 = !DILocation(line: 98, column: 30, scope: !112)
!141 = !DILocation(line: 98, column: 28, scope: !112)
!142 = !DILocation(line: 99, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !112, file: !69, line: 99, column: 21)
!144 = !DILocation(line: 99, column: 32, scope: !143)
!145 = !DILocation(line: 99, column: 48, scope: !143)
!146 = !DILocation(line: 99, column: 51, scope: !143)
!147 = !DILocation(line: 99, column: 62, scope: !143)
!148 = !DILocation(line: 99, column: 21, scope: !112)
!149 = !DILocation(line: 101, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !69, line: 100, column: 17)
!151 = !DILocation(line: 104, column: 29, scope: !112)
!152 = !DILocation(line: 104, column: 17, scope: !112)
!153 = !DILocation(line: 104, column: 41, scope: !112)
!154 = !DILocation(line: 106, column: 29, scope: !112)
!155 = !DILocation(line: 106, column: 24, scope: !112)
!156 = !DILocation(line: 106, column: 22, scope: !112)
!157 = !DILocation(line: 107, column: 13, scope: !112)
!158 = !DILocation(line: 109, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !80, file: !69, line: 109, column: 17)
!160 = !DILocation(line: 109, column: 31, scope: !159)
!161 = !DILocation(line: 109, column: 17, scope: !80)
!162 = !DILocation(line: 111, column: 30, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !69, line: 110, column: 13)
!164 = !DILocation(line: 111, column: 17, scope: !163)
!165 = !DILocation(line: 112, column: 13, scope: !163)
!166 = !DILocation(line: 120, column: 5, scope: !81)
!167 = !DILocation(line: 121, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !68, file: !69, line: 121, column: 8)
!169 = !DILocation(line: 121, column: 8, scope: !68)
!170 = !DILocalVariable(name: "i", scope: !171, file: !69, line: 124, type: !60)
!171 = distinct !DILexicalBlock(scope: !172, file: !69, line: 123, column: 9)
!172 = distinct !DILexicalBlock(scope: !168, file: !69, line: 122, column: 5)
!173 = !DILocation(line: 124, column: 17, scope: !171)
!174 = !DILocalVariable(name: "buffer", scope: !171, file: !69, line: 125, type: !59)
!175 = !DILocation(line: 125, column: 19, scope: !171)
!176 = !DILocation(line: 125, column: 35, scope: !171)
!177 = !DILocation(line: 125, column: 28, scope: !171)
!178 = !DILocation(line: 126, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !171, file: !69, line: 126, column: 17)
!180 = !DILocation(line: 126, column: 24, scope: !179)
!181 = !DILocation(line: 126, column: 17, scope: !171)
!182 = !DILocation(line: 126, column: 34, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !69, line: 126, column: 33)
!184 = !DILocation(line: 128, column: 20, scope: !185)
!185 = distinct !DILexicalBlock(scope: !171, file: !69, line: 128, column: 13)
!186 = !DILocation(line: 128, column: 18, scope: !185)
!187 = !DILocation(line: 128, column: 25, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !69, line: 128, column: 13)
!189 = !DILocation(line: 128, column: 27, scope: !188)
!190 = !DILocation(line: 128, column: 13, scope: !185)
!191 = !DILocation(line: 130, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !69, line: 129, column: 13)
!193 = !DILocation(line: 130, column: 24, scope: !192)
!194 = !DILocation(line: 130, column: 27, scope: !192)
!195 = !DILocation(line: 131, column: 13, scope: !192)
!196 = !DILocation(line: 128, column: 34, scope: !188)
!197 = !DILocation(line: 128, column: 13, scope: !188)
!198 = distinct !{!198, !190, !199, !200}
!199 = !DILocation(line: 131, column: 13, scope: !185)
!200 = !{!"llvm.loop.mustprogress"}
!201 = !DILocation(line: 134, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !171, file: !69, line: 134, column: 17)
!203 = !DILocation(line: 134, column: 22, scope: !202)
!204 = !DILocation(line: 134, column: 17, scope: !171)
!205 = !DILocation(line: 136, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !69, line: 135, column: 13)
!207 = !DILocation(line: 136, column: 24, scope: !206)
!208 = !DILocation(line: 136, column: 30, scope: !206)
!209 = !DILocation(line: 138, column: 23, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !69, line: 138, column: 17)
!211 = !DILocation(line: 138, column: 21, scope: !210)
!212 = !DILocation(line: 138, column: 28, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !69, line: 138, column: 17)
!214 = !DILocation(line: 138, column: 30, scope: !213)
!215 = !DILocation(line: 138, column: 17, scope: !210)
!216 = !DILocation(line: 140, column: 34, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !69, line: 139, column: 17)
!218 = !DILocation(line: 140, column: 41, scope: !217)
!219 = !DILocation(line: 140, column: 21, scope: !217)
!220 = !DILocation(line: 141, column: 17, scope: !217)
!221 = !DILocation(line: 138, column: 37, scope: !213)
!222 = !DILocation(line: 138, column: 17, scope: !213)
!223 = distinct !{!223, !215, !224, !200}
!224 = !DILocation(line: 141, column: 17, scope: !210)
!225 = !DILocation(line: 142, column: 13, scope: !206)
!226 = !DILocation(line: 145, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !202, file: !69, line: 144, column: 13)
!228 = !DILocation(line: 147, column: 18, scope: !171)
!229 = !DILocation(line: 147, column: 13, scope: !171)
!230 = !DILocation(line: 149, column: 5, scope: !172)
!231 = !DILocation(line: 150, column: 1, scope: !68)
!232 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_good", scope: !69, file: !69, line: 442, type: !70, scopeLine: 443, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!233 = !DILocation(line: 444, column: 5, scope: !232)
!234 = !DILocation(line: 445, column: 5, scope: !232)
!235 = !DILocation(line: 446, column: 5, scope: !232)
!236 = !DILocation(line: 447, column: 5, scope: !232)
!237 = !DILocation(line: 448, column: 1, scope: !232)
!238 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 459, type: !239, scopeLine: 460, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!239 = !DISubroutineType(types: !240)
!240 = !{!60, !60, !241}
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!243 = !DILocalVariable(name: "argc", arg: 1, scope: !238, file: !69, line: 459, type: !60)
!244 = !DILocation(line: 459, column: 14, scope: !238)
!245 = !DILocalVariable(name: "argv", arg: 2, scope: !238, file: !69, line: 459, type: !241)
!246 = !DILocation(line: 459, column: 27, scope: !238)
!247 = !DILocation(line: 462, column: 22, scope: !238)
!248 = !DILocation(line: 462, column: 12, scope: !238)
!249 = !DILocation(line: 462, column: 5, scope: !238)
!250 = !DILocation(line: 464, column: 5, scope: !238)
!251 = !DILocation(line: 465, column: 5, scope: !238)
!252 = !DILocation(line: 466, column: 5, scope: !238)
!253 = !DILocation(line: 469, column: 5, scope: !238)
!254 = !DILocation(line: 470, column: 5, scope: !238)
!255 = !DILocation(line: 471, column: 5, scope: !238)
!256 = !DILocation(line: 473, column: 5, scope: !238)
!257 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !69, file: !69, line: 45, type: !258, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!258 = !DISubroutineType(types: !259)
!259 = !{!60}
!260 = !DILocation(line: 47, column: 5, scope: !257)
!261 = distinct !DISubprogram(name: "goodB2G1", scope: !69, file: !69, line: 157, type: !70, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!262 = !DILocalVariable(name: "data", scope: !261, file: !69, line: 159, type: !60)
!263 = !DILocation(line: 159, column: 9, scope: !261)
!264 = !DILocation(line: 161, column: 10, scope: !261)
!265 = !DILocation(line: 162, column: 8, scope: !266)
!266 = distinct !DILexicalBlock(scope: !261, file: !69, line: 162, column: 8)
!267 = !DILocation(line: 162, column: 8, scope: !261)
!268 = !DILocalVariable(name: "recvResult", scope: !269, file: !69, line: 169, type: !60)
!269 = distinct !DILexicalBlock(scope: !270, file: !69, line: 164, column: 9)
!270 = distinct !DILexicalBlock(scope: !266, file: !69, line: 163, column: 5)
!271 = !DILocation(line: 169, column: 17, scope: !269)
!272 = !DILocalVariable(name: "service", scope: !269, file: !69, line: 170, type: !84)
!273 = !DILocation(line: 170, column: 32, scope: !269)
!274 = !DILocalVariable(name: "connectSocket", scope: !269, file: !69, line: 171, type: !60)
!275 = !DILocation(line: 171, column: 20, scope: !269)
!276 = !DILocalVariable(name: "inputBuffer", scope: !269, file: !69, line: 172, type: !55)
!277 = !DILocation(line: 172, column: 18, scope: !269)
!278 = !DILocation(line: 173, column: 13, scope: !269)
!279 = !DILocation(line: 183, column: 33, scope: !280)
!280 = distinct !DILexicalBlock(scope: !269, file: !69, line: 174, column: 13)
!281 = !DILocation(line: 183, column: 31, scope: !280)
!282 = !DILocation(line: 184, column: 21, scope: !283)
!283 = distinct !DILexicalBlock(scope: !280, file: !69, line: 184, column: 21)
!284 = !DILocation(line: 184, column: 35, scope: !283)
!285 = !DILocation(line: 184, column: 21, scope: !280)
!286 = !DILocation(line: 186, column: 21, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !69, line: 185, column: 17)
!288 = !DILocation(line: 188, column: 17, scope: !280)
!289 = !DILocation(line: 189, column: 25, scope: !280)
!290 = !DILocation(line: 189, column: 36, scope: !280)
!291 = !DILocation(line: 190, column: 43, scope: !280)
!292 = !DILocation(line: 190, column: 25, scope: !280)
!293 = !DILocation(line: 190, column: 34, scope: !280)
!294 = !DILocation(line: 190, column: 41, scope: !280)
!295 = !DILocation(line: 191, column: 36, scope: !280)
!296 = !DILocation(line: 191, column: 25, scope: !280)
!297 = !DILocation(line: 191, column: 34, scope: !280)
!298 = !DILocation(line: 192, column: 29, scope: !299)
!299 = distinct !DILexicalBlock(scope: !280, file: !69, line: 192, column: 21)
!300 = !DILocation(line: 192, column: 44, scope: !299)
!301 = !DILocation(line: 192, column: 21, scope: !299)
!302 = !DILocation(line: 192, column: 89, scope: !299)
!303 = !DILocation(line: 192, column: 21, scope: !280)
!304 = !DILocation(line: 194, column: 21, scope: !305)
!305 = distinct !DILexicalBlock(scope: !299, file: !69, line: 193, column: 17)
!306 = !DILocation(line: 198, column: 35, scope: !280)
!307 = !DILocation(line: 198, column: 50, scope: !280)
!308 = !DILocation(line: 198, column: 30, scope: !280)
!309 = !DILocation(line: 198, column: 28, scope: !280)
!310 = !DILocation(line: 199, column: 21, scope: !311)
!311 = distinct !DILexicalBlock(scope: !280, file: !69, line: 199, column: 21)
!312 = !DILocation(line: 199, column: 32, scope: !311)
!313 = !DILocation(line: 199, column: 48, scope: !311)
!314 = !DILocation(line: 199, column: 51, scope: !311)
!315 = !DILocation(line: 199, column: 62, scope: !311)
!316 = !DILocation(line: 199, column: 21, scope: !280)
!317 = !DILocation(line: 201, column: 21, scope: !318)
!318 = distinct !DILexicalBlock(scope: !311, file: !69, line: 200, column: 17)
!319 = !DILocation(line: 204, column: 29, scope: !280)
!320 = !DILocation(line: 204, column: 17, scope: !280)
!321 = !DILocation(line: 204, column: 41, scope: !280)
!322 = !DILocation(line: 206, column: 29, scope: !280)
!323 = !DILocation(line: 206, column: 24, scope: !280)
!324 = !DILocation(line: 206, column: 22, scope: !280)
!325 = !DILocation(line: 207, column: 13, scope: !280)
!326 = !DILocation(line: 209, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !269, file: !69, line: 209, column: 17)
!328 = !DILocation(line: 209, column: 31, scope: !327)
!329 = !DILocation(line: 209, column: 17, scope: !269)
!330 = !DILocation(line: 211, column: 30, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !69, line: 210, column: 13)
!332 = !DILocation(line: 211, column: 17, scope: !331)
!333 = !DILocation(line: 212, column: 13, scope: !331)
!334 = !DILocation(line: 220, column: 5, scope: !270)
!335 = !DILocation(line: 221, column: 8, scope: !336)
!336 = distinct !DILexicalBlock(scope: !261, file: !69, line: 221, column: 8)
!337 = !DILocation(line: 221, column: 8, scope: !261)
!338 = !DILocation(line: 224, column: 9, scope: !339)
!339 = distinct !DILexicalBlock(scope: !336, file: !69, line: 222, column: 5)
!340 = !DILocation(line: 225, column: 5, scope: !339)
!341 = !DILocalVariable(name: "i", scope: !342, file: !69, line: 229, type: !60)
!342 = distinct !DILexicalBlock(scope: !343, file: !69, line: 228, column: 9)
!343 = distinct !DILexicalBlock(scope: !336, file: !69, line: 227, column: 5)
!344 = !DILocation(line: 229, column: 17, scope: !342)
!345 = !DILocalVariable(name: "buffer", scope: !342, file: !69, line: 230, type: !59)
!346 = !DILocation(line: 230, column: 19, scope: !342)
!347 = !DILocation(line: 230, column: 35, scope: !342)
!348 = !DILocation(line: 230, column: 28, scope: !342)
!349 = !DILocation(line: 231, column: 17, scope: !350)
!350 = distinct !DILexicalBlock(scope: !342, file: !69, line: 231, column: 17)
!351 = !DILocation(line: 231, column: 24, scope: !350)
!352 = !DILocation(line: 231, column: 17, scope: !342)
!353 = !DILocation(line: 231, column: 34, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !69, line: 231, column: 33)
!355 = !DILocation(line: 233, column: 20, scope: !356)
!356 = distinct !DILexicalBlock(scope: !342, file: !69, line: 233, column: 13)
!357 = !DILocation(line: 233, column: 18, scope: !356)
!358 = !DILocation(line: 233, column: 25, scope: !359)
!359 = distinct !DILexicalBlock(scope: !356, file: !69, line: 233, column: 13)
!360 = !DILocation(line: 233, column: 27, scope: !359)
!361 = !DILocation(line: 233, column: 13, scope: !356)
!362 = !DILocation(line: 235, column: 17, scope: !363)
!363 = distinct !DILexicalBlock(scope: !359, file: !69, line: 234, column: 13)
!364 = !DILocation(line: 235, column: 24, scope: !363)
!365 = !DILocation(line: 235, column: 27, scope: !363)
!366 = !DILocation(line: 236, column: 13, scope: !363)
!367 = !DILocation(line: 233, column: 34, scope: !359)
!368 = !DILocation(line: 233, column: 13, scope: !359)
!369 = distinct !{!369, !361, !370, !200}
!370 = !DILocation(line: 236, column: 13, scope: !356)
!371 = !DILocation(line: 238, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !342, file: !69, line: 238, column: 17)
!373 = !DILocation(line: 238, column: 22, scope: !372)
!374 = !DILocation(line: 238, column: 27, scope: !372)
!375 = !DILocation(line: 238, column: 30, scope: !372)
!376 = !DILocation(line: 238, column: 35, scope: !372)
!377 = !DILocation(line: 238, column: 17, scope: !342)
!378 = !DILocation(line: 240, column: 17, scope: !379)
!379 = distinct !DILexicalBlock(scope: !372, file: !69, line: 239, column: 13)
!380 = !DILocation(line: 240, column: 24, scope: !379)
!381 = !DILocation(line: 240, column: 30, scope: !379)
!382 = !DILocation(line: 242, column: 23, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !69, line: 242, column: 17)
!384 = !DILocation(line: 242, column: 21, scope: !383)
!385 = !DILocation(line: 242, column: 28, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !69, line: 242, column: 17)
!387 = !DILocation(line: 242, column: 30, scope: !386)
!388 = !DILocation(line: 242, column: 17, scope: !383)
!389 = !DILocation(line: 244, column: 34, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !69, line: 243, column: 17)
!391 = !DILocation(line: 244, column: 41, scope: !390)
!392 = !DILocation(line: 244, column: 21, scope: !390)
!393 = !DILocation(line: 245, column: 17, scope: !390)
!394 = !DILocation(line: 242, column: 37, scope: !386)
!395 = !DILocation(line: 242, column: 17, scope: !386)
!396 = distinct !{!396, !388, !397, !200}
!397 = !DILocation(line: 245, column: 17, scope: !383)
!398 = !DILocation(line: 246, column: 13, scope: !379)
!399 = !DILocation(line: 249, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !372, file: !69, line: 248, column: 13)
!401 = !DILocation(line: 251, column: 18, scope: !342)
!402 = !DILocation(line: 251, column: 13, scope: !342)
!403 = !DILocation(line: 254, column: 1, scope: !261)
!404 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !69, file: !69, line: 50, type: !258, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!405 = !DILocation(line: 52, column: 5, scope: !404)
!406 = distinct !DISubprogram(name: "goodB2G2", scope: !69, file: !69, line: 257, type: !70, scopeLine: 258, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!407 = !DILocalVariable(name: "data", scope: !406, file: !69, line: 259, type: !60)
!408 = !DILocation(line: 259, column: 9, scope: !406)
!409 = !DILocation(line: 261, column: 10, scope: !406)
!410 = !DILocation(line: 262, column: 8, scope: !411)
!411 = distinct !DILexicalBlock(scope: !406, file: !69, line: 262, column: 8)
!412 = !DILocation(line: 262, column: 8, scope: !406)
!413 = !DILocalVariable(name: "recvResult", scope: !414, file: !69, line: 269, type: !60)
!414 = distinct !DILexicalBlock(scope: !415, file: !69, line: 264, column: 9)
!415 = distinct !DILexicalBlock(scope: !411, file: !69, line: 263, column: 5)
!416 = !DILocation(line: 269, column: 17, scope: !414)
!417 = !DILocalVariable(name: "service", scope: !414, file: !69, line: 270, type: !84)
!418 = !DILocation(line: 270, column: 32, scope: !414)
!419 = !DILocalVariable(name: "connectSocket", scope: !414, file: !69, line: 271, type: !60)
!420 = !DILocation(line: 271, column: 20, scope: !414)
!421 = !DILocalVariable(name: "inputBuffer", scope: !414, file: !69, line: 272, type: !55)
!422 = !DILocation(line: 272, column: 18, scope: !414)
!423 = !DILocation(line: 273, column: 13, scope: !414)
!424 = !DILocation(line: 283, column: 33, scope: !425)
!425 = distinct !DILexicalBlock(scope: !414, file: !69, line: 274, column: 13)
!426 = !DILocation(line: 283, column: 31, scope: !425)
!427 = !DILocation(line: 284, column: 21, scope: !428)
!428 = distinct !DILexicalBlock(scope: !425, file: !69, line: 284, column: 21)
!429 = !DILocation(line: 284, column: 35, scope: !428)
!430 = !DILocation(line: 284, column: 21, scope: !425)
!431 = !DILocation(line: 286, column: 21, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !69, line: 285, column: 17)
!433 = !DILocation(line: 288, column: 17, scope: !425)
!434 = !DILocation(line: 289, column: 25, scope: !425)
!435 = !DILocation(line: 289, column: 36, scope: !425)
!436 = !DILocation(line: 290, column: 43, scope: !425)
!437 = !DILocation(line: 290, column: 25, scope: !425)
!438 = !DILocation(line: 290, column: 34, scope: !425)
!439 = !DILocation(line: 290, column: 41, scope: !425)
!440 = !DILocation(line: 291, column: 36, scope: !425)
!441 = !DILocation(line: 291, column: 25, scope: !425)
!442 = !DILocation(line: 291, column: 34, scope: !425)
!443 = !DILocation(line: 292, column: 29, scope: !444)
!444 = distinct !DILexicalBlock(scope: !425, file: !69, line: 292, column: 21)
!445 = !DILocation(line: 292, column: 44, scope: !444)
!446 = !DILocation(line: 292, column: 21, scope: !444)
!447 = !DILocation(line: 292, column: 89, scope: !444)
!448 = !DILocation(line: 292, column: 21, scope: !425)
!449 = !DILocation(line: 294, column: 21, scope: !450)
!450 = distinct !DILexicalBlock(scope: !444, file: !69, line: 293, column: 17)
!451 = !DILocation(line: 298, column: 35, scope: !425)
!452 = !DILocation(line: 298, column: 50, scope: !425)
!453 = !DILocation(line: 298, column: 30, scope: !425)
!454 = !DILocation(line: 298, column: 28, scope: !425)
!455 = !DILocation(line: 299, column: 21, scope: !456)
!456 = distinct !DILexicalBlock(scope: !425, file: !69, line: 299, column: 21)
!457 = !DILocation(line: 299, column: 32, scope: !456)
!458 = !DILocation(line: 299, column: 48, scope: !456)
!459 = !DILocation(line: 299, column: 51, scope: !456)
!460 = !DILocation(line: 299, column: 62, scope: !456)
!461 = !DILocation(line: 299, column: 21, scope: !425)
!462 = !DILocation(line: 301, column: 21, scope: !463)
!463 = distinct !DILexicalBlock(scope: !456, file: !69, line: 300, column: 17)
!464 = !DILocation(line: 304, column: 29, scope: !425)
!465 = !DILocation(line: 304, column: 17, scope: !425)
!466 = !DILocation(line: 304, column: 41, scope: !425)
!467 = !DILocation(line: 306, column: 29, scope: !425)
!468 = !DILocation(line: 306, column: 24, scope: !425)
!469 = !DILocation(line: 306, column: 22, scope: !425)
!470 = !DILocation(line: 307, column: 13, scope: !425)
!471 = !DILocation(line: 309, column: 17, scope: !472)
!472 = distinct !DILexicalBlock(scope: !414, file: !69, line: 309, column: 17)
!473 = !DILocation(line: 309, column: 31, scope: !472)
!474 = !DILocation(line: 309, column: 17, scope: !414)
!475 = !DILocation(line: 311, column: 30, scope: !476)
!476 = distinct !DILexicalBlock(scope: !472, file: !69, line: 310, column: 13)
!477 = !DILocation(line: 311, column: 17, scope: !476)
!478 = !DILocation(line: 312, column: 13, scope: !476)
!479 = !DILocation(line: 320, column: 5, scope: !415)
!480 = !DILocation(line: 321, column: 8, scope: !481)
!481 = distinct !DILexicalBlock(scope: !406, file: !69, line: 321, column: 8)
!482 = !DILocation(line: 321, column: 8, scope: !406)
!483 = !DILocalVariable(name: "i", scope: !484, file: !69, line: 324, type: !60)
!484 = distinct !DILexicalBlock(scope: !485, file: !69, line: 323, column: 9)
!485 = distinct !DILexicalBlock(scope: !481, file: !69, line: 322, column: 5)
!486 = !DILocation(line: 324, column: 17, scope: !484)
!487 = !DILocalVariable(name: "buffer", scope: !484, file: !69, line: 325, type: !59)
!488 = !DILocation(line: 325, column: 19, scope: !484)
!489 = !DILocation(line: 325, column: 35, scope: !484)
!490 = !DILocation(line: 325, column: 28, scope: !484)
!491 = !DILocation(line: 326, column: 17, scope: !492)
!492 = distinct !DILexicalBlock(scope: !484, file: !69, line: 326, column: 17)
!493 = !DILocation(line: 326, column: 24, scope: !492)
!494 = !DILocation(line: 326, column: 17, scope: !484)
!495 = !DILocation(line: 326, column: 34, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !69, line: 326, column: 33)
!497 = !DILocation(line: 328, column: 20, scope: !498)
!498 = distinct !DILexicalBlock(scope: !484, file: !69, line: 328, column: 13)
!499 = !DILocation(line: 328, column: 18, scope: !498)
!500 = !DILocation(line: 328, column: 25, scope: !501)
!501 = distinct !DILexicalBlock(scope: !498, file: !69, line: 328, column: 13)
!502 = !DILocation(line: 328, column: 27, scope: !501)
!503 = !DILocation(line: 328, column: 13, scope: !498)
!504 = !DILocation(line: 330, column: 17, scope: !505)
!505 = distinct !DILexicalBlock(scope: !501, file: !69, line: 329, column: 13)
!506 = !DILocation(line: 330, column: 24, scope: !505)
!507 = !DILocation(line: 330, column: 27, scope: !505)
!508 = !DILocation(line: 331, column: 13, scope: !505)
!509 = !DILocation(line: 328, column: 34, scope: !501)
!510 = !DILocation(line: 328, column: 13, scope: !501)
!511 = distinct !{!511, !503, !512, !200}
!512 = !DILocation(line: 331, column: 13, scope: !498)
!513 = !DILocation(line: 333, column: 17, scope: !514)
!514 = distinct !DILexicalBlock(scope: !484, file: !69, line: 333, column: 17)
!515 = !DILocation(line: 333, column: 22, scope: !514)
!516 = !DILocation(line: 333, column: 27, scope: !514)
!517 = !DILocation(line: 333, column: 30, scope: !514)
!518 = !DILocation(line: 333, column: 35, scope: !514)
!519 = !DILocation(line: 333, column: 17, scope: !484)
!520 = !DILocation(line: 335, column: 17, scope: !521)
!521 = distinct !DILexicalBlock(scope: !514, file: !69, line: 334, column: 13)
!522 = !DILocation(line: 335, column: 24, scope: !521)
!523 = !DILocation(line: 335, column: 30, scope: !521)
!524 = !DILocation(line: 337, column: 23, scope: !525)
!525 = distinct !DILexicalBlock(scope: !521, file: !69, line: 337, column: 17)
!526 = !DILocation(line: 337, column: 21, scope: !525)
!527 = !DILocation(line: 337, column: 28, scope: !528)
!528 = distinct !DILexicalBlock(scope: !525, file: !69, line: 337, column: 17)
!529 = !DILocation(line: 337, column: 30, scope: !528)
!530 = !DILocation(line: 337, column: 17, scope: !525)
!531 = !DILocation(line: 339, column: 34, scope: !532)
!532 = distinct !DILexicalBlock(scope: !528, file: !69, line: 338, column: 17)
!533 = !DILocation(line: 339, column: 41, scope: !532)
!534 = !DILocation(line: 339, column: 21, scope: !532)
!535 = !DILocation(line: 340, column: 17, scope: !532)
!536 = !DILocation(line: 337, column: 37, scope: !528)
!537 = !DILocation(line: 337, column: 17, scope: !528)
!538 = distinct !{!538, !530, !539, !200}
!539 = !DILocation(line: 340, column: 17, scope: !525)
!540 = !DILocation(line: 341, column: 13, scope: !521)
!541 = !DILocation(line: 344, column: 17, scope: !542)
!542 = distinct !DILexicalBlock(scope: !514, file: !69, line: 343, column: 13)
!543 = !DILocation(line: 346, column: 18, scope: !484)
!544 = !DILocation(line: 346, column: 13, scope: !484)
!545 = !DILocation(line: 348, column: 5, scope: !485)
!546 = !DILocation(line: 349, column: 1, scope: !406)
!547 = distinct !DISubprogram(name: "goodG2B1", scope: !69, file: !69, line: 352, type: !70, scopeLine: 353, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!548 = !DILocalVariable(name: "data", scope: !547, file: !69, line: 354, type: !60)
!549 = !DILocation(line: 354, column: 9, scope: !547)
!550 = !DILocation(line: 356, column: 10, scope: !547)
!551 = !DILocation(line: 357, column: 8, scope: !552)
!552 = distinct !DILexicalBlock(scope: !547, file: !69, line: 357, column: 8)
!553 = !DILocation(line: 357, column: 8, scope: !547)
!554 = !DILocation(line: 360, column: 9, scope: !555)
!555 = distinct !DILexicalBlock(scope: !552, file: !69, line: 358, column: 5)
!556 = !DILocation(line: 361, column: 5, scope: !555)
!557 = !DILocation(line: 366, column: 14, scope: !558)
!558 = distinct !DILexicalBlock(scope: !552, file: !69, line: 363, column: 5)
!559 = !DILocation(line: 368, column: 8, scope: !560)
!560 = distinct !DILexicalBlock(scope: !547, file: !69, line: 368, column: 8)
!561 = !DILocation(line: 368, column: 8, scope: !547)
!562 = !DILocalVariable(name: "i", scope: !563, file: !69, line: 371, type: !60)
!563 = distinct !DILexicalBlock(scope: !564, file: !69, line: 370, column: 9)
!564 = distinct !DILexicalBlock(scope: !560, file: !69, line: 369, column: 5)
!565 = !DILocation(line: 371, column: 17, scope: !563)
!566 = !DILocalVariable(name: "buffer", scope: !563, file: !69, line: 372, type: !59)
!567 = !DILocation(line: 372, column: 19, scope: !563)
!568 = !DILocation(line: 372, column: 35, scope: !563)
!569 = !DILocation(line: 372, column: 28, scope: !563)
!570 = !DILocation(line: 373, column: 17, scope: !571)
!571 = distinct !DILexicalBlock(scope: !563, file: !69, line: 373, column: 17)
!572 = !DILocation(line: 373, column: 24, scope: !571)
!573 = !DILocation(line: 373, column: 17, scope: !563)
!574 = !DILocation(line: 373, column: 34, scope: !575)
!575 = distinct !DILexicalBlock(scope: !571, file: !69, line: 373, column: 33)
!576 = !DILocation(line: 375, column: 20, scope: !577)
!577 = distinct !DILexicalBlock(scope: !563, file: !69, line: 375, column: 13)
!578 = !DILocation(line: 375, column: 18, scope: !577)
!579 = !DILocation(line: 375, column: 25, scope: !580)
!580 = distinct !DILexicalBlock(scope: !577, file: !69, line: 375, column: 13)
!581 = !DILocation(line: 375, column: 27, scope: !580)
!582 = !DILocation(line: 375, column: 13, scope: !577)
!583 = !DILocation(line: 377, column: 17, scope: !584)
!584 = distinct !DILexicalBlock(scope: !580, file: !69, line: 376, column: 13)
!585 = !DILocation(line: 377, column: 24, scope: !584)
!586 = !DILocation(line: 377, column: 27, scope: !584)
!587 = !DILocation(line: 378, column: 13, scope: !584)
!588 = !DILocation(line: 375, column: 34, scope: !580)
!589 = !DILocation(line: 375, column: 13, scope: !580)
!590 = distinct !{!590, !582, !591, !200}
!591 = !DILocation(line: 378, column: 13, scope: !577)
!592 = !DILocation(line: 381, column: 17, scope: !593)
!593 = distinct !DILexicalBlock(scope: !563, file: !69, line: 381, column: 17)
!594 = !DILocation(line: 381, column: 22, scope: !593)
!595 = !DILocation(line: 381, column: 17, scope: !563)
!596 = !DILocation(line: 383, column: 17, scope: !597)
!597 = distinct !DILexicalBlock(scope: !593, file: !69, line: 382, column: 13)
!598 = !DILocation(line: 383, column: 24, scope: !597)
!599 = !DILocation(line: 383, column: 30, scope: !597)
!600 = !DILocation(line: 385, column: 23, scope: !601)
!601 = distinct !DILexicalBlock(scope: !597, file: !69, line: 385, column: 17)
!602 = !DILocation(line: 385, column: 21, scope: !601)
!603 = !DILocation(line: 385, column: 28, scope: !604)
!604 = distinct !DILexicalBlock(scope: !601, file: !69, line: 385, column: 17)
!605 = !DILocation(line: 385, column: 30, scope: !604)
!606 = !DILocation(line: 385, column: 17, scope: !601)
!607 = !DILocation(line: 387, column: 34, scope: !608)
!608 = distinct !DILexicalBlock(scope: !604, file: !69, line: 386, column: 17)
!609 = !DILocation(line: 387, column: 41, scope: !608)
!610 = !DILocation(line: 387, column: 21, scope: !608)
!611 = !DILocation(line: 388, column: 17, scope: !608)
!612 = !DILocation(line: 385, column: 37, scope: !604)
!613 = !DILocation(line: 385, column: 17, scope: !604)
!614 = distinct !{!614, !606, !615, !200}
!615 = !DILocation(line: 388, column: 17, scope: !601)
!616 = !DILocation(line: 389, column: 13, scope: !597)
!617 = !DILocation(line: 392, column: 17, scope: !618)
!618 = distinct !DILexicalBlock(scope: !593, file: !69, line: 391, column: 13)
!619 = !DILocation(line: 394, column: 18, scope: !563)
!620 = !DILocation(line: 394, column: 13, scope: !563)
!621 = !DILocation(line: 396, column: 5, scope: !564)
!622 = !DILocation(line: 397, column: 1, scope: !547)
!623 = distinct !DISubprogram(name: "goodG2B2", scope: !69, file: !69, line: 400, type: !70, scopeLine: 401, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!624 = !DILocalVariable(name: "data", scope: !623, file: !69, line: 402, type: !60)
!625 = !DILocation(line: 402, column: 9, scope: !623)
!626 = !DILocation(line: 404, column: 10, scope: !623)
!627 = !DILocation(line: 405, column: 8, scope: !628)
!628 = distinct !DILexicalBlock(scope: !623, file: !69, line: 405, column: 8)
!629 = !DILocation(line: 405, column: 8, scope: !623)
!630 = !DILocation(line: 409, column: 14, scope: !631)
!631 = distinct !DILexicalBlock(scope: !628, file: !69, line: 406, column: 5)
!632 = !DILocation(line: 410, column: 5, scope: !631)
!633 = !DILocation(line: 411, column: 8, scope: !634)
!634 = distinct !DILexicalBlock(scope: !623, file: !69, line: 411, column: 8)
!635 = !DILocation(line: 411, column: 8, scope: !623)
!636 = !DILocalVariable(name: "i", scope: !637, file: !69, line: 414, type: !60)
!637 = distinct !DILexicalBlock(scope: !638, file: !69, line: 413, column: 9)
!638 = distinct !DILexicalBlock(scope: !634, file: !69, line: 412, column: 5)
!639 = !DILocation(line: 414, column: 17, scope: !637)
!640 = !DILocalVariable(name: "buffer", scope: !637, file: !69, line: 415, type: !59)
!641 = !DILocation(line: 415, column: 19, scope: !637)
!642 = !DILocation(line: 415, column: 35, scope: !637)
!643 = !DILocation(line: 415, column: 28, scope: !637)
!644 = !DILocation(line: 416, column: 17, scope: !645)
!645 = distinct !DILexicalBlock(scope: !637, file: !69, line: 416, column: 17)
!646 = !DILocation(line: 416, column: 24, scope: !645)
!647 = !DILocation(line: 416, column: 17, scope: !637)
!648 = !DILocation(line: 416, column: 34, scope: !649)
!649 = distinct !DILexicalBlock(scope: !645, file: !69, line: 416, column: 33)
!650 = !DILocation(line: 418, column: 20, scope: !651)
!651 = distinct !DILexicalBlock(scope: !637, file: !69, line: 418, column: 13)
!652 = !DILocation(line: 418, column: 18, scope: !651)
!653 = !DILocation(line: 418, column: 25, scope: !654)
!654 = distinct !DILexicalBlock(scope: !651, file: !69, line: 418, column: 13)
!655 = !DILocation(line: 418, column: 27, scope: !654)
!656 = !DILocation(line: 418, column: 13, scope: !651)
!657 = !DILocation(line: 420, column: 17, scope: !658)
!658 = distinct !DILexicalBlock(scope: !654, file: !69, line: 419, column: 13)
!659 = !DILocation(line: 420, column: 24, scope: !658)
!660 = !DILocation(line: 420, column: 27, scope: !658)
!661 = !DILocation(line: 421, column: 13, scope: !658)
!662 = !DILocation(line: 418, column: 34, scope: !654)
!663 = !DILocation(line: 418, column: 13, scope: !654)
!664 = distinct !{!664, !656, !665, !200}
!665 = !DILocation(line: 421, column: 13, scope: !651)
!666 = !DILocation(line: 424, column: 17, scope: !667)
!667 = distinct !DILexicalBlock(scope: !637, file: !69, line: 424, column: 17)
!668 = !DILocation(line: 424, column: 22, scope: !667)
!669 = !DILocation(line: 424, column: 17, scope: !637)
!670 = !DILocation(line: 426, column: 17, scope: !671)
!671 = distinct !DILexicalBlock(scope: !667, file: !69, line: 425, column: 13)
!672 = !DILocation(line: 426, column: 24, scope: !671)
!673 = !DILocation(line: 426, column: 30, scope: !671)
!674 = !DILocation(line: 428, column: 23, scope: !675)
!675 = distinct !DILexicalBlock(scope: !671, file: !69, line: 428, column: 17)
!676 = !DILocation(line: 428, column: 21, scope: !675)
!677 = !DILocation(line: 428, column: 28, scope: !678)
!678 = distinct !DILexicalBlock(scope: !675, file: !69, line: 428, column: 17)
!679 = !DILocation(line: 428, column: 30, scope: !678)
!680 = !DILocation(line: 428, column: 17, scope: !675)
!681 = !DILocation(line: 430, column: 34, scope: !682)
!682 = distinct !DILexicalBlock(scope: !678, file: !69, line: 429, column: 17)
!683 = !DILocation(line: 430, column: 41, scope: !682)
!684 = !DILocation(line: 430, column: 21, scope: !682)
!685 = !DILocation(line: 431, column: 17, scope: !682)
!686 = !DILocation(line: 428, column: 37, scope: !678)
!687 = !DILocation(line: 428, column: 17, scope: !678)
!688 = distinct !{!688, !680, !689, !200}
!689 = !DILocation(line: 431, column: 17, scope: !675)
!690 = !DILocation(line: 432, column: 13, scope: !671)
!691 = !DILocation(line: 435, column: 17, scope: !692)
!692 = distinct !DILexicalBlock(scope: !667, file: !69, line: 434, column: 13)
!693 = !DILocation(line: 437, column: 18, scope: !637)
!694 = !DILocation(line: 437, column: 13, scope: !637)
!695 = !DILocation(line: 439, column: 5, scope: !638)
!696 = !DILocation(line: 440, column: 1, scope: !623)
