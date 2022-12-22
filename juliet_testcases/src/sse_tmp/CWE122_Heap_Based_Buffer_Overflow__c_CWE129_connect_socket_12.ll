; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_12_bad() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i53 = alloca i32, align 4
  %buffer54 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 -1, i32* %data, align 4, !dbg !75
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !76
  %tobool = icmp ne i32 %call, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.else, !dbg !78

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

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !167
  br label %if.end23

if.end23:                                         ; preds = %if.else, %if.end22
  %call24 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !169
  %tobool25 = icmp ne i32 %call24, 0, !dbg !169
  br i1 %tobool25, label %if.then26, label %if.else52, !dbg !171

if.then26:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !172, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !176, metadata !DIExpression()), !dbg !177
  %call27 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !178
  %10 = bitcast i8* %call27 to i32*, !dbg !179
  store i32* %10, i32** %buffer, align 8, !dbg !177
  %11 = load i32*, i32** %buffer, align 8, !dbg !180
  %cmp28 = icmp eq i32* %11, null, !dbg !182
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !183

if.then30:                                        ; preds = %if.then26
  call void @exit(i32 -1) #11, !dbg !184
  unreachable, !dbg !184

if.end31:                                         ; preds = %if.then26
  store i32 0, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end31
  %12 = load i32, i32* %i, align 4, !dbg !189
  %cmp32 = icmp slt i32 %12, 10, !dbg !191
  br i1 %cmp32, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !193
  %14 = load i32, i32* %i, align 4, !dbg !195
  %idxprom34 = sext i32 %14 to i64, !dbg !193
  %arrayidx35 = getelementptr inbounds i32, i32* %13, i64 %idxprom34, !dbg !193
  store i32 0, i32* %arrayidx35, align 4, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !198
  %inc = add nsw i32 %15, 1, !dbg !198
  store i32 %inc, i32* %i, align 4, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !203
  %cmp36 = icmp sge i32 %16, 0, !dbg !205
  br i1 %cmp36, label %if.then38, label %if.else50, !dbg !206

if.then38:                                        ; preds = %for.end
  %17 = load i32*, i32** %buffer, align 8, !dbg !207
  %18 = load i32, i32* %data, align 4, !dbg !209
  %idxprom39 = sext i32 %18 to i64, !dbg !207
  %arrayidx40 = getelementptr inbounds i32, i32* %17, i64 %idxprom39, !dbg !207
  store i32 1, i32* %arrayidx40, align 4, !dbg !210
  store i32 0, i32* %i, align 4, !dbg !211
  br label %for.cond41, !dbg !213

for.cond41:                                       ; preds = %for.inc47, %if.then38
  %19 = load i32, i32* %i, align 4, !dbg !214
  %cmp42 = icmp slt i32 %19, 10, !dbg !216
  br i1 %cmp42, label %for.body44, label %for.end49, !dbg !217

for.body44:                                       ; preds = %for.cond41
  %20 = load i32*, i32** %buffer, align 8, !dbg !218
  %21 = load i32, i32* %i, align 4, !dbg !220
  %idxprom45 = sext i32 %21 to i64, !dbg !218
  %arrayidx46 = getelementptr inbounds i32, i32* %20, i64 %idxprom45, !dbg !218
  %22 = load i32, i32* %arrayidx46, align 4, !dbg !218
  call void @printIntLine(i32 %22), !dbg !221
  br label %for.inc47, !dbg !222

for.inc47:                                        ; preds = %for.body44
  %23 = load i32, i32* %i, align 4, !dbg !223
  %inc48 = add nsw i32 %23, 1, !dbg !223
  store i32 %inc48, i32* %i, align 4, !dbg !223
  br label %for.cond41, !dbg !224, !llvm.loop !225

for.end49:                                        ; preds = %for.cond41
  br label %if.end51, !dbg !227

if.else50:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !228
  br label %if.end51

if.end51:                                         ; preds = %if.else50, %for.end49
  %24 = load i32*, i32** %buffer, align 8, !dbg !230
  %25 = bitcast i32* %24 to i8*, !dbg !230
  call void @free(i8* %25) #8, !dbg !231
  br label %if.end87, !dbg !232

if.else52:                                        ; preds = %if.end23
  call void @llvm.dbg.declare(metadata i32* %i53, metadata !233, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata i32** %buffer54, metadata !237, metadata !DIExpression()), !dbg !238
  %call55 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !239
  %26 = bitcast i8* %call55 to i32*, !dbg !240
  store i32* %26, i32** %buffer54, align 8, !dbg !238
  %27 = load i32*, i32** %buffer54, align 8, !dbg !241
  %cmp56 = icmp eq i32* %27, null, !dbg !243
  br i1 %cmp56, label %if.then58, label %if.end59, !dbg !244

if.then58:                                        ; preds = %if.else52
  call void @exit(i32 -1) #11, !dbg !245
  unreachable, !dbg !245

if.end59:                                         ; preds = %if.else52
  store i32 0, i32* %i53, align 4, !dbg !247
  br label %for.cond60, !dbg !249

for.cond60:                                       ; preds = %for.inc66, %if.end59
  %28 = load i32, i32* %i53, align 4, !dbg !250
  %cmp61 = icmp slt i32 %28, 10, !dbg !252
  br i1 %cmp61, label %for.body63, label %for.end68, !dbg !253

for.body63:                                       ; preds = %for.cond60
  %29 = load i32*, i32** %buffer54, align 8, !dbg !254
  %30 = load i32, i32* %i53, align 4, !dbg !256
  %idxprom64 = sext i32 %30 to i64, !dbg !254
  %arrayidx65 = getelementptr inbounds i32, i32* %29, i64 %idxprom64, !dbg !254
  store i32 0, i32* %arrayidx65, align 4, !dbg !257
  br label %for.inc66, !dbg !258

for.inc66:                                        ; preds = %for.body63
  %31 = load i32, i32* %i53, align 4, !dbg !259
  %inc67 = add nsw i32 %31, 1, !dbg !259
  store i32 %inc67, i32* %i53, align 4, !dbg !259
  br label %for.cond60, !dbg !260, !llvm.loop !261

for.end68:                                        ; preds = %for.cond60
  %32 = load i32, i32* %data, align 4, !dbg !263
  %cmp69 = icmp sge i32 %32, 0, !dbg !265
  br i1 %cmp69, label %land.lhs.true, label %if.else85, !dbg !266

land.lhs.true:                                    ; preds = %for.end68
  %33 = load i32, i32* %data, align 4, !dbg !267
  %cmp71 = icmp slt i32 %33, 10, !dbg !268
  br i1 %cmp71, label %if.then73, label %if.else85, !dbg !269

if.then73:                                        ; preds = %land.lhs.true
  %34 = load i32*, i32** %buffer54, align 8, !dbg !270
  %35 = load i32, i32* %data, align 4, !dbg !272
  %idxprom74 = sext i32 %35 to i64, !dbg !270
  %arrayidx75 = getelementptr inbounds i32, i32* %34, i64 %idxprom74, !dbg !270
  store i32 1, i32* %arrayidx75, align 4, !dbg !273
  store i32 0, i32* %i53, align 4, !dbg !274
  br label %for.cond76, !dbg !276

for.cond76:                                       ; preds = %for.inc82, %if.then73
  %36 = load i32, i32* %i53, align 4, !dbg !277
  %cmp77 = icmp slt i32 %36, 10, !dbg !279
  br i1 %cmp77, label %for.body79, label %for.end84, !dbg !280

for.body79:                                       ; preds = %for.cond76
  %37 = load i32*, i32** %buffer54, align 8, !dbg !281
  %38 = load i32, i32* %i53, align 4, !dbg !283
  %idxprom80 = sext i32 %38 to i64, !dbg !281
  %arrayidx81 = getelementptr inbounds i32, i32* %37, i64 %idxprom80, !dbg !281
  %39 = load i32, i32* %arrayidx81, align 4, !dbg !281
  call void @printIntLine(i32 %39), !dbg !284
  br label %for.inc82, !dbg !285

for.inc82:                                        ; preds = %for.body79
  %40 = load i32, i32* %i53, align 4, !dbg !286
  %inc83 = add nsw i32 %40, 1, !dbg !286
  store i32 %inc83, i32* %i53, align 4, !dbg !286
  br label %for.cond76, !dbg !287, !llvm.loop !288

for.end84:                                        ; preds = %for.cond76
  br label %if.end86, !dbg !290

if.else85:                                        ; preds = %land.lhs.true, %for.end68
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !291
  br label %if.end86

if.end86:                                         ; preds = %if.else85, %for.end84
  %41 = load i32*, i32** %buffer54, align 8, !dbg !293
  %42 = bitcast i32* %41 to i8*, !dbg !293
  call void @free(i8* %42) #8, !dbg !294
  br label %if.end87

if.end87:                                         ; preds = %if.end86, %if.end51
  ret void, !dbg !295
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #3

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #5

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #2

declare dso_local i64 @recv(i32, i8*, i64, i32) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_12_good() #0 !dbg !296 {
entry:
  call void @goodB2G(), !dbg !297
  call void @goodG2B(), !dbg !298
  ret void, !dbg !299
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !300 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !305, metadata !DIExpression()), !dbg !306
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !307, metadata !DIExpression()), !dbg !308
  %call = call i64 @time(i64* null) #8, !dbg !309
  %conv = trunc i64 %call to i32, !dbg !310
  call void @srand(i32 %conv) #8, !dbg !311
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !312
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_12_good(), !dbg !313
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !314
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !315
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_12_bad(), !dbg !316
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !317
  ret i32 0, !dbg !318
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !319 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %recvResult23 = alloca i32, align 4
  %service24 = alloca %struct.sockaddr_in, align 4
  %connectSocket25 = alloca i32, align 4
  %inputBuffer26 = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i96 = alloca i32, align 4
  %buffer97 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !320, metadata !DIExpression()), !dbg !321
  store i32 -1, i32* %data, align 4, !dbg !322
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !323
  %tobool = icmp ne i32 %call, 0, !dbg !323
  br i1 %tobool, label %if.then, label %if.else, !dbg !325

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !326, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !330, metadata !DIExpression()), !dbg !331
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !332, metadata !DIExpression()), !dbg !333
  store i32 -1, i32* %connectSocket, align 4, !dbg !333
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !334, metadata !DIExpression()), !dbg !335
  br label %do.body, !dbg !336

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !337
  store i32 %call1, i32* %connectSocket, align 4, !dbg !339
  %0 = load i32, i32* %connectSocket, align 4, !dbg !340
  %cmp = icmp eq i32 %0, -1, !dbg !342
  br i1 %cmp, label %if.then2, label %if.end, !dbg !343

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !344

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !346
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !346
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !347
  store i16 2, i16* %sin_family, align 4, !dbg !348
  %call3 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !349
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !350
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !351
  store i32 %call3, i32* %s_addr, align 4, !dbg !352
  %call4 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !353
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !354
  store i16 %call4, i16* %sin_port, align 2, !dbg !355
  %2 = load i32, i32* %connectSocket, align 4, !dbg !356
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !358
  %call5 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !359
  %cmp6 = icmp eq i32 %call5, -1, !dbg !360
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !361

if.then7:                                         ; preds = %if.end
  br label %do.end, !dbg !362

if.end8:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !364
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !365
  %call9 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !366
  %conv = trunc i64 %call9 to i32, !dbg !366
  store i32 %conv, i32* %recvResult, align 4, !dbg !367
  %5 = load i32, i32* %recvResult, align 4, !dbg !368
  %cmp10 = icmp eq i32 %5, -1, !dbg !370
  br i1 %cmp10, label %if.then14, label %lor.lhs.false, !dbg !371

lor.lhs.false:                                    ; preds = %if.end8
  %6 = load i32, i32* %recvResult, align 4, !dbg !372
  %cmp12 = icmp eq i32 %6, 0, !dbg !373
  br i1 %cmp12, label %if.then14, label %if.end15, !dbg !374

if.then14:                                        ; preds = %lor.lhs.false, %if.end8
  br label %do.end, !dbg !375

if.end15:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !377
  %idxprom = sext i32 %7 to i64, !dbg !378
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !378
  store i8 0, i8* %arrayidx, align 1, !dbg !379
  %arraydecay16 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !380
  %call17 = call i32 @atoi(i8* %arraydecay16) #10, !dbg !381
  store i32 %call17, i32* %data, align 4, !dbg !382
  br label %do.end, !dbg !383

do.end:                                           ; preds = %if.end15, %if.then14, %if.then7, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !384
  %cmp18 = icmp ne i32 %8, -1, !dbg !386
  br i1 %cmp18, label %if.then20, label %if.end22, !dbg !387

if.then20:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !388
  %call21 = call i32 @close(i32 %9), !dbg !390
  br label %if.end22, !dbg !391

if.end22:                                         ; preds = %if.then20, %do.end
  br label %if.end64, !dbg !392

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult23, metadata !393, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service24, metadata !397, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.declare(metadata i32* %connectSocket25, metadata !399, metadata !DIExpression()), !dbg !400
  store i32 -1, i32* %connectSocket25, align 4, !dbg !400
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer26, metadata !401, metadata !DIExpression()), !dbg !402
  br label %do.body27, !dbg !403

do.body27:                                        ; preds = %if.else
  %call28 = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !404
  store i32 %call28, i32* %connectSocket25, align 4, !dbg !406
  %10 = load i32, i32* %connectSocket25, align 4, !dbg !407
  %cmp29 = icmp eq i32 %10, -1, !dbg !409
  br i1 %cmp29, label %if.then31, label %if.end32, !dbg !410

if.then31:                                        ; preds = %do.body27
  br label %do.end58, !dbg !411

if.end32:                                         ; preds = %do.body27
  %11 = bitcast %struct.sockaddr_in* %service24 to i8*, !dbg !413
  call void @llvm.memset.p0i8.i64(i8* align 4 %11, i8 0, i64 16, i1 false), !dbg !413
  %sin_family33 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service24, i32 0, i32 0, !dbg !414
  store i16 2, i16* %sin_family33, align 4, !dbg !415
  %call34 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !416
  %sin_addr35 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service24, i32 0, i32 2, !dbg !417
  %s_addr36 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr35, i32 0, i32 0, !dbg !418
  store i32 %call34, i32* %s_addr36, align 4, !dbg !419
  %call37 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !420
  %sin_port38 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service24, i32 0, i32 1, !dbg !421
  store i16 %call37, i16* %sin_port38, align 2, !dbg !422
  %12 = load i32, i32* %connectSocket25, align 4, !dbg !423
  %13 = bitcast %struct.sockaddr_in* %service24 to %struct.sockaddr*, !dbg !425
  %call39 = call i32 @connect(i32 %12, %struct.sockaddr* %13, i32 16), !dbg !426
  %cmp40 = icmp eq i32 %call39, -1, !dbg !427
  br i1 %cmp40, label %if.then42, label %if.end43, !dbg !428

if.then42:                                        ; preds = %if.end32
  br label %do.end58, !dbg !429

if.end43:                                         ; preds = %if.end32
  %14 = load i32, i32* %connectSocket25, align 4, !dbg !431
  %arraydecay44 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer26, i64 0, i64 0, !dbg !432
  %call45 = call i64 @recv(i32 %14, i8* %arraydecay44, i64 13, i32 0), !dbg !433
  %conv46 = trunc i64 %call45 to i32, !dbg !433
  store i32 %conv46, i32* %recvResult23, align 4, !dbg !434
  %15 = load i32, i32* %recvResult23, align 4, !dbg !435
  %cmp47 = icmp eq i32 %15, -1, !dbg !437
  br i1 %cmp47, label %if.then52, label %lor.lhs.false49, !dbg !438

lor.lhs.false49:                                  ; preds = %if.end43
  %16 = load i32, i32* %recvResult23, align 4, !dbg !439
  %cmp50 = icmp eq i32 %16, 0, !dbg !440
  br i1 %cmp50, label %if.then52, label %if.end53, !dbg !441

if.then52:                                        ; preds = %lor.lhs.false49, %if.end43
  br label %do.end58, !dbg !442

if.end53:                                         ; preds = %lor.lhs.false49
  %17 = load i32, i32* %recvResult23, align 4, !dbg !444
  %idxprom54 = sext i32 %17 to i64, !dbg !445
  %arrayidx55 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer26, i64 0, i64 %idxprom54, !dbg !445
  store i8 0, i8* %arrayidx55, align 1, !dbg !446
  %arraydecay56 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer26, i64 0, i64 0, !dbg !447
  %call57 = call i32 @atoi(i8* %arraydecay56) #10, !dbg !448
  store i32 %call57, i32* %data, align 4, !dbg !449
  br label %do.end58, !dbg !450

do.end58:                                         ; preds = %if.end53, %if.then52, %if.then42, %if.then31
  %18 = load i32, i32* %connectSocket25, align 4, !dbg !451
  %cmp59 = icmp ne i32 %18, -1, !dbg !453
  br i1 %cmp59, label %if.then61, label %if.end63, !dbg !454

if.then61:                                        ; preds = %do.end58
  %19 = load i32, i32* %connectSocket25, align 4, !dbg !455
  %call62 = call i32 @close(i32 %19), !dbg !457
  br label %if.end63, !dbg !458

if.end63:                                         ; preds = %if.then61, %do.end58
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.end22
  %call65 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !459
  %tobool66 = icmp ne i32 %call65, 0, !dbg !459
  br i1 %tobool66, label %if.then67, label %if.else95, !dbg !461

if.then67:                                        ; preds = %if.end64
  call void @llvm.dbg.declare(metadata i32* %i, metadata !462, metadata !DIExpression()), !dbg !465
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !466, metadata !DIExpression()), !dbg !467
  %call68 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !468
  %20 = bitcast i8* %call68 to i32*, !dbg !469
  store i32* %20, i32** %buffer, align 8, !dbg !467
  %21 = load i32*, i32** %buffer, align 8, !dbg !470
  %cmp69 = icmp eq i32* %21, null, !dbg !472
  br i1 %cmp69, label %if.then71, label %if.end72, !dbg !473

if.then71:                                        ; preds = %if.then67
  call void @exit(i32 -1) #11, !dbg !474
  unreachable, !dbg !474

if.end72:                                         ; preds = %if.then67
  store i32 0, i32* %i, align 4, !dbg !476
  br label %for.cond, !dbg !478

for.cond:                                         ; preds = %for.inc, %if.end72
  %22 = load i32, i32* %i, align 4, !dbg !479
  %cmp73 = icmp slt i32 %22, 10, !dbg !481
  br i1 %cmp73, label %for.body, label %for.end, !dbg !482

for.body:                                         ; preds = %for.cond
  %23 = load i32*, i32** %buffer, align 8, !dbg !483
  %24 = load i32, i32* %i, align 4, !dbg !485
  %idxprom75 = sext i32 %24 to i64, !dbg !483
  %arrayidx76 = getelementptr inbounds i32, i32* %23, i64 %idxprom75, !dbg !483
  store i32 0, i32* %arrayidx76, align 4, !dbg !486
  br label %for.inc, !dbg !487

for.inc:                                          ; preds = %for.body
  %25 = load i32, i32* %i, align 4, !dbg !488
  %inc = add nsw i32 %25, 1, !dbg !488
  store i32 %inc, i32* %i, align 4, !dbg !488
  br label %for.cond, !dbg !489, !llvm.loop !490

for.end:                                          ; preds = %for.cond
  %26 = load i32, i32* %data, align 4, !dbg !492
  %cmp77 = icmp sge i32 %26, 0, !dbg !494
  br i1 %cmp77, label %land.lhs.true, label %if.else93, !dbg !495

land.lhs.true:                                    ; preds = %for.end
  %27 = load i32, i32* %data, align 4, !dbg !496
  %cmp79 = icmp slt i32 %27, 10, !dbg !497
  br i1 %cmp79, label %if.then81, label %if.else93, !dbg !498

if.then81:                                        ; preds = %land.lhs.true
  %28 = load i32*, i32** %buffer, align 8, !dbg !499
  %29 = load i32, i32* %data, align 4, !dbg !501
  %idxprom82 = sext i32 %29 to i64, !dbg !499
  %arrayidx83 = getelementptr inbounds i32, i32* %28, i64 %idxprom82, !dbg !499
  store i32 1, i32* %arrayidx83, align 4, !dbg !502
  store i32 0, i32* %i, align 4, !dbg !503
  br label %for.cond84, !dbg !505

for.cond84:                                       ; preds = %for.inc90, %if.then81
  %30 = load i32, i32* %i, align 4, !dbg !506
  %cmp85 = icmp slt i32 %30, 10, !dbg !508
  br i1 %cmp85, label %for.body87, label %for.end92, !dbg !509

for.body87:                                       ; preds = %for.cond84
  %31 = load i32*, i32** %buffer, align 8, !dbg !510
  %32 = load i32, i32* %i, align 4, !dbg !512
  %idxprom88 = sext i32 %32 to i64, !dbg !510
  %arrayidx89 = getelementptr inbounds i32, i32* %31, i64 %idxprom88, !dbg !510
  %33 = load i32, i32* %arrayidx89, align 4, !dbg !510
  call void @printIntLine(i32 %33), !dbg !513
  br label %for.inc90, !dbg !514

for.inc90:                                        ; preds = %for.body87
  %34 = load i32, i32* %i, align 4, !dbg !515
  %inc91 = add nsw i32 %34, 1, !dbg !515
  store i32 %inc91, i32* %i, align 4, !dbg !515
  br label %for.cond84, !dbg !516, !llvm.loop !517

for.end92:                                        ; preds = %for.cond84
  br label %if.end94, !dbg !519

if.else93:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !520
  br label %if.end94

if.end94:                                         ; preds = %if.else93, %for.end92
  %35 = load i32*, i32** %buffer, align 8, !dbg !522
  %36 = bitcast i32* %35 to i8*, !dbg !522
  call void @free(i8* %36) #8, !dbg !523
  br label %if.end131, !dbg !524

if.else95:                                        ; preds = %if.end64
  call void @llvm.dbg.declare(metadata i32* %i96, metadata !525, metadata !DIExpression()), !dbg !528
  call void @llvm.dbg.declare(metadata i32** %buffer97, metadata !529, metadata !DIExpression()), !dbg !530
  %call98 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !531
  %37 = bitcast i8* %call98 to i32*, !dbg !532
  store i32* %37, i32** %buffer97, align 8, !dbg !530
  %38 = load i32*, i32** %buffer97, align 8, !dbg !533
  %cmp99 = icmp eq i32* %38, null, !dbg !535
  br i1 %cmp99, label %if.then101, label %if.end102, !dbg !536

if.then101:                                       ; preds = %if.else95
  call void @exit(i32 -1) #11, !dbg !537
  unreachable, !dbg !537

if.end102:                                        ; preds = %if.else95
  store i32 0, i32* %i96, align 4, !dbg !539
  br label %for.cond103, !dbg !541

for.cond103:                                      ; preds = %for.inc109, %if.end102
  %39 = load i32, i32* %i96, align 4, !dbg !542
  %cmp104 = icmp slt i32 %39, 10, !dbg !544
  br i1 %cmp104, label %for.body106, label %for.end111, !dbg !545

for.body106:                                      ; preds = %for.cond103
  %40 = load i32*, i32** %buffer97, align 8, !dbg !546
  %41 = load i32, i32* %i96, align 4, !dbg !548
  %idxprom107 = sext i32 %41 to i64, !dbg !546
  %arrayidx108 = getelementptr inbounds i32, i32* %40, i64 %idxprom107, !dbg !546
  store i32 0, i32* %arrayidx108, align 4, !dbg !549
  br label %for.inc109, !dbg !550

for.inc109:                                       ; preds = %for.body106
  %42 = load i32, i32* %i96, align 4, !dbg !551
  %inc110 = add nsw i32 %42, 1, !dbg !551
  store i32 %inc110, i32* %i96, align 4, !dbg !551
  br label %for.cond103, !dbg !552, !llvm.loop !553

for.end111:                                       ; preds = %for.cond103
  %43 = load i32, i32* %data, align 4, !dbg !555
  %cmp112 = icmp sge i32 %43, 0, !dbg !557
  br i1 %cmp112, label %land.lhs.true114, label %if.else129, !dbg !558

land.lhs.true114:                                 ; preds = %for.end111
  %44 = load i32, i32* %data, align 4, !dbg !559
  %cmp115 = icmp slt i32 %44, 10, !dbg !560
  br i1 %cmp115, label %if.then117, label %if.else129, !dbg !561

if.then117:                                       ; preds = %land.lhs.true114
  %45 = load i32*, i32** %buffer97, align 8, !dbg !562
  %46 = load i32, i32* %data, align 4, !dbg !564
  %idxprom118 = sext i32 %46 to i64, !dbg !562
  %arrayidx119 = getelementptr inbounds i32, i32* %45, i64 %idxprom118, !dbg !562
  store i32 1, i32* %arrayidx119, align 4, !dbg !565
  store i32 0, i32* %i96, align 4, !dbg !566
  br label %for.cond120, !dbg !568

for.cond120:                                      ; preds = %for.inc126, %if.then117
  %47 = load i32, i32* %i96, align 4, !dbg !569
  %cmp121 = icmp slt i32 %47, 10, !dbg !571
  br i1 %cmp121, label %for.body123, label %for.end128, !dbg !572

for.body123:                                      ; preds = %for.cond120
  %48 = load i32*, i32** %buffer97, align 8, !dbg !573
  %49 = load i32, i32* %i96, align 4, !dbg !575
  %idxprom124 = sext i32 %49 to i64, !dbg !573
  %arrayidx125 = getelementptr inbounds i32, i32* %48, i64 %idxprom124, !dbg !573
  %50 = load i32, i32* %arrayidx125, align 4, !dbg !573
  call void @printIntLine(i32 %50), !dbg !576
  br label %for.inc126, !dbg !577

for.inc126:                                       ; preds = %for.body123
  %51 = load i32, i32* %i96, align 4, !dbg !578
  %inc127 = add nsw i32 %51, 1, !dbg !578
  store i32 %inc127, i32* %i96, align 4, !dbg !578
  br label %for.cond120, !dbg !579, !llvm.loop !580

for.end128:                                       ; preds = %for.cond120
  br label %if.end130, !dbg !582

if.else129:                                       ; preds = %land.lhs.true114, %for.end111
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !583
  br label %if.end130

if.end130:                                        ; preds = %if.else129, %for.end128
  %52 = load i32*, i32** %buffer97, align 8, !dbg !585
  %53 = bitcast i32* %52 to i8*, !dbg !585
  call void @free(i8* %53) #8, !dbg !586
  br label %if.end131

if.end131:                                        ; preds = %if.end130, %if.end94
  ret void, !dbg !587
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !588 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %i23 = alloca i32, align 4
  %buffer24 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !589, metadata !DIExpression()), !dbg !590
  store i32 -1, i32* %data, align 4, !dbg !591
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !592
  %tobool = icmp ne i32 %call, 0, !dbg !592
  br i1 %tobool, label %if.then, label %if.else, !dbg !594

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !595
  br label %if.end, !dbg !597

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !598
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !600
  %tobool2 = icmp ne i32 %call1, 0, !dbg !600
  br i1 %tobool2, label %if.then3, label %if.else22, !dbg !602

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !603, metadata !DIExpression()), !dbg !606
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !607, metadata !DIExpression()), !dbg !608
  %call4 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !609
  %0 = bitcast i8* %call4 to i32*, !dbg !610
  store i32* %0, i32** %buffer, align 8, !dbg !608
  %1 = load i32*, i32** %buffer, align 8, !dbg !611
  %cmp = icmp eq i32* %1, null, !dbg !613
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !614

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 -1) #11, !dbg !615
  unreachable, !dbg !615

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !617
  br label %for.cond, !dbg !619

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !620
  %cmp7 = icmp slt i32 %2, 10, !dbg !622
  br i1 %cmp7, label %for.body, label %for.end, !dbg !623

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !624
  %4 = load i32, i32* %i, align 4, !dbg !626
  %idxprom = sext i32 %4 to i64, !dbg !624
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !624
  store i32 0, i32* %arrayidx, align 4, !dbg !627
  br label %for.inc, !dbg !628

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !629
  %inc = add nsw i32 %5, 1, !dbg !629
  store i32 %inc, i32* %i, align 4, !dbg !629
  br label %for.cond, !dbg !630, !llvm.loop !631

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !633
  %cmp8 = icmp sge i32 %6, 0, !dbg !635
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !636

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !637
  %8 = load i32, i32* %data, align 4, !dbg !639
  %idxprom10 = sext i32 %8 to i64, !dbg !637
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !637
  store i32 1, i32* %arrayidx11, align 4, !dbg !640
  store i32 0, i32* %i, align 4, !dbg !641
  br label %for.cond12, !dbg !643

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !644
  %cmp13 = icmp slt i32 %9, 10, !dbg !646
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !647

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !648
  %11 = load i32, i32* %i, align 4, !dbg !650
  %idxprom15 = sext i32 %11 to i64, !dbg !648
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !648
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !648
  call void @printIntLine(i32 %12), !dbg !651
  br label %for.inc17, !dbg !652

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !653
  %inc18 = add nsw i32 %13, 1, !dbg !653
  store i32 %inc18, i32* %i, align 4, !dbg !653
  br label %for.cond12, !dbg !654, !llvm.loop !655

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !657

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !658
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !660
  %15 = bitcast i32* %14 to i8*, !dbg !660
  call void @free(i8* %15) #8, !dbg !661
  br label %if.end51, !dbg !662

if.else22:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i23, metadata !663, metadata !DIExpression()), !dbg !666
  call void @llvm.dbg.declare(metadata i32** %buffer24, metadata !667, metadata !DIExpression()), !dbg !668
  %call25 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !669
  %16 = bitcast i8* %call25 to i32*, !dbg !670
  store i32* %16, i32** %buffer24, align 8, !dbg !668
  %17 = load i32*, i32** %buffer24, align 8, !dbg !671
  %cmp26 = icmp eq i32* %17, null, !dbg !673
  br i1 %cmp26, label %if.then27, label %if.end28, !dbg !674

if.then27:                                        ; preds = %if.else22
  call void @exit(i32 -1) #11, !dbg !675
  unreachable, !dbg !675

if.end28:                                         ; preds = %if.else22
  store i32 0, i32* %i23, align 4, !dbg !677
  br label %for.cond29, !dbg !679

for.cond29:                                       ; preds = %for.inc34, %if.end28
  %18 = load i32, i32* %i23, align 4, !dbg !680
  %cmp30 = icmp slt i32 %18, 10, !dbg !682
  br i1 %cmp30, label %for.body31, label %for.end36, !dbg !683

for.body31:                                       ; preds = %for.cond29
  %19 = load i32*, i32** %buffer24, align 8, !dbg !684
  %20 = load i32, i32* %i23, align 4, !dbg !686
  %idxprom32 = sext i32 %20 to i64, !dbg !684
  %arrayidx33 = getelementptr inbounds i32, i32* %19, i64 %idxprom32, !dbg !684
  store i32 0, i32* %arrayidx33, align 4, !dbg !687
  br label %for.inc34, !dbg !688

for.inc34:                                        ; preds = %for.body31
  %21 = load i32, i32* %i23, align 4, !dbg !689
  %inc35 = add nsw i32 %21, 1, !dbg !689
  store i32 %inc35, i32* %i23, align 4, !dbg !689
  br label %for.cond29, !dbg !690, !llvm.loop !691

for.end36:                                        ; preds = %for.cond29
  %22 = load i32, i32* %data, align 4, !dbg !693
  %cmp37 = icmp sge i32 %22, 0, !dbg !695
  br i1 %cmp37, label %if.then38, label %if.else49, !dbg !696

if.then38:                                        ; preds = %for.end36
  %23 = load i32*, i32** %buffer24, align 8, !dbg !697
  %24 = load i32, i32* %data, align 4, !dbg !699
  %idxprom39 = sext i32 %24 to i64, !dbg !697
  %arrayidx40 = getelementptr inbounds i32, i32* %23, i64 %idxprom39, !dbg !697
  store i32 1, i32* %arrayidx40, align 4, !dbg !700
  store i32 0, i32* %i23, align 4, !dbg !701
  br label %for.cond41, !dbg !703

for.cond41:                                       ; preds = %for.inc46, %if.then38
  %25 = load i32, i32* %i23, align 4, !dbg !704
  %cmp42 = icmp slt i32 %25, 10, !dbg !706
  br i1 %cmp42, label %for.body43, label %for.end48, !dbg !707

for.body43:                                       ; preds = %for.cond41
  %26 = load i32*, i32** %buffer24, align 8, !dbg !708
  %27 = load i32, i32* %i23, align 4, !dbg !710
  %idxprom44 = sext i32 %27 to i64, !dbg !708
  %arrayidx45 = getelementptr inbounds i32, i32* %26, i64 %idxprom44, !dbg !708
  %28 = load i32, i32* %arrayidx45, align 4, !dbg !708
  call void @printIntLine(i32 %28), !dbg !711
  br label %for.inc46, !dbg !712

for.inc46:                                        ; preds = %for.body43
  %29 = load i32, i32* %i23, align 4, !dbg !713
  %inc47 = add nsw i32 %29, 1, !dbg !713
  store i32 %inc47, i32* %i23, align 4, !dbg !713
  br label %for.cond41, !dbg !714, !llvm.loop !715

for.end48:                                        ; preds = %for.cond41
  br label %if.end50, !dbg !717

if.else49:                                        ; preds = %for.end36
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !718
  br label %if.end50

if.end50:                                         ; preds = %if.else49, %for.end48
  %30 = load i32*, i32** %buffer24, align 8, !dbg !720
  %31 = bitcast i32* %30 to i8*, !dbg !720
  call void @free(i8* %31) #8, !dbg !721
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.end21
  ret void, !dbg !722
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_12.c", directory: "/root/SSE-Assessment")
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
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_12_bad", scope: !69, file: !69, line: 44, type: !70, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_12.c", directory: "/root/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 46, type: !60)
!74 = !DILocation(line: 46, column: 9, scope: !68)
!75 = !DILocation(line: 48, column: 10, scope: !68)
!76 = !DILocation(line: 49, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !68, file: !69, line: 49, column: 8)
!78 = !DILocation(line: 49, column: 8, scope: !68)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !69, line: 56, type: !60)
!80 = distinct !DILexicalBlock(scope: !81, file: !69, line: 51, column: 9)
!81 = distinct !DILexicalBlock(scope: !77, file: !69, line: 50, column: 5)
!82 = !DILocation(line: 56, column: 17, scope: !80)
!83 = !DILocalVariable(name: "service", scope: !80, file: !69, line: 57, type: !84)
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
!105 = !DILocation(line: 57, column: 32, scope: !80)
!106 = !DILocalVariable(name: "connectSocket", scope: !80, file: !69, line: 58, type: !60)
!107 = !DILocation(line: 58, column: 20, scope: !80)
!108 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !69, line: 59, type: !55)
!109 = !DILocation(line: 59, column: 18, scope: !80)
!110 = !DILocation(line: 60, column: 13, scope: !80)
!111 = !DILocation(line: 70, column: 33, scope: !112)
!112 = distinct !DILexicalBlock(scope: !80, file: !69, line: 61, column: 13)
!113 = !DILocation(line: 70, column: 31, scope: !112)
!114 = !DILocation(line: 71, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !69, line: 71, column: 21)
!116 = !DILocation(line: 71, column: 35, scope: !115)
!117 = !DILocation(line: 71, column: 21, scope: !112)
!118 = !DILocation(line: 73, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !69, line: 72, column: 17)
!120 = !DILocation(line: 75, column: 17, scope: !112)
!121 = !DILocation(line: 76, column: 25, scope: !112)
!122 = !DILocation(line: 76, column: 36, scope: !112)
!123 = !DILocation(line: 77, column: 43, scope: !112)
!124 = !DILocation(line: 77, column: 25, scope: !112)
!125 = !DILocation(line: 77, column: 34, scope: !112)
!126 = !DILocation(line: 77, column: 41, scope: !112)
!127 = !DILocation(line: 78, column: 36, scope: !112)
!128 = !DILocation(line: 78, column: 25, scope: !112)
!129 = !DILocation(line: 78, column: 34, scope: !112)
!130 = !DILocation(line: 79, column: 29, scope: !131)
!131 = distinct !DILexicalBlock(scope: !112, file: !69, line: 79, column: 21)
!132 = !DILocation(line: 79, column: 44, scope: !131)
!133 = !DILocation(line: 79, column: 21, scope: !131)
!134 = !DILocation(line: 79, column: 89, scope: !131)
!135 = !DILocation(line: 79, column: 21, scope: !112)
!136 = !DILocation(line: 81, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !69, line: 80, column: 17)
!138 = !DILocation(line: 85, column: 35, scope: !112)
!139 = !DILocation(line: 85, column: 50, scope: !112)
!140 = !DILocation(line: 85, column: 30, scope: !112)
!141 = !DILocation(line: 85, column: 28, scope: !112)
!142 = !DILocation(line: 86, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !112, file: !69, line: 86, column: 21)
!144 = !DILocation(line: 86, column: 32, scope: !143)
!145 = !DILocation(line: 86, column: 48, scope: !143)
!146 = !DILocation(line: 86, column: 51, scope: !143)
!147 = !DILocation(line: 86, column: 62, scope: !143)
!148 = !DILocation(line: 86, column: 21, scope: !112)
!149 = !DILocation(line: 88, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !69, line: 87, column: 17)
!151 = !DILocation(line: 91, column: 29, scope: !112)
!152 = !DILocation(line: 91, column: 17, scope: !112)
!153 = !DILocation(line: 91, column: 41, scope: !112)
!154 = !DILocation(line: 93, column: 29, scope: !112)
!155 = !DILocation(line: 93, column: 24, scope: !112)
!156 = !DILocation(line: 93, column: 22, scope: !112)
!157 = !DILocation(line: 94, column: 13, scope: !112)
!158 = !DILocation(line: 96, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !80, file: !69, line: 96, column: 17)
!160 = !DILocation(line: 96, column: 31, scope: !159)
!161 = !DILocation(line: 96, column: 17, scope: !80)
!162 = !DILocation(line: 98, column: 30, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !69, line: 97, column: 13)
!164 = !DILocation(line: 98, column: 17, scope: !163)
!165 = !DILocation(line: 99, column: 13, scope: !163)
!166 = !DILocation(line: 107, column: 5, scope: !81)
!167 = !DILocation(line: 112, column: 14, scope: !168)
!168 = distinct !DILexicalBlock(scope: !77, file: !69, line: 109, column: 5)
!169 = !DILocation(line: 114, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !68, file: !69, line: 114, column: 8)
!171 = !DILocation(line: 114, column: 8, scope: !68)
!172 = !DILocalVariable(name: "i", scope: !173, file: !69, line: 117, type: !60)
!173 = distinct !DILexicalBlock(scope: !174, file: !69, line: 116, column: 9)
!174 = distinct !DILexicalBlock(scope: !170, file: !69, line: 115, column: 5)
!175 = !DILocation(line: 117, column: 17, scope: !173)
!176 = !DILocalVariable(name: "buffer", scope: !173, file: !69, line: 118, type: !59)
!177 = !DILocation(line: 118, column: 19, scope: !173)
!178 = !DILocation(line: 118, column: 35, scope: !173)
!179 = !DILocation(line: 118, column: 28, scope: !173)
!180 = !DILocation(line: 119, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !173, file: !69, line: 119, column: 17)
!182 = !DILocation(line: 119, column: 24, scope: !181)
!183 = !DILocation(line: 119, column: 17, scope: !173)
!184 = !DILocation(line: 119, column: 34, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !69, line: 119, column: 33)
!186 = !DILocation(line: 121, column: 20, scope: !187)
!187 = distinct !DILexicalBlock(scope: !173, file: !69, line: 121, column: 13)
!188 = !DILocation(line: 121, column: 18, scope: !187)
!189 = !DILocation(line: 121, column: 25, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !69, line: 121, column: 13)
!191 = !DILocation(line: 121, column: 27, scope: !190)
!192 = !DILocation(line: 121, column: 13, scope: !187)
!193 = !DILocation(line: 123, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !69, line: 122, column: 13)
!195 = !DILocation(line: 123, column: 24, scope: !194)
!196 = !DILocation(line: 123, column: 27, scope: !194)
!197 = !DILocation(line: 124, column: 13, scope: !194)
!198 = !DILocation(line: 121, column: 34, scope: !190)
!199 = !DILocation(line: 121, column: 13, scope: !190)
!200 = distinct !{!200, !192, !201, !202}
!201 = !DILocation(line: 124, column: 13, scope: !187)
!202 = !{!"llvm.loop.mustprogress"}
!203 = !DILocation(line: 127, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !173, file: !69, line: 127, column: 17)
!205 = !DILocation(line: 127, column: 22, scope: !204)
!206 = !DILocation(line: 127, column: 17, scope: !173)
!207 = !DILocation(line: 129, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !69, line: 128, column: 13)
!209 = !DILocation(line: 129, column: 24, scope: !208)
!210 = !DILocation(line: 129, column: 30, scope: !208)
!211 = !DILocation(line: 131, column: 23, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !69, line: 131, column: 17)
!213 = !DILocation(line: 131, column: 21, scope: !212)
!214 = !DILocation(line: 131, column: 28, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !69, line: 131, column: 17)
!216 = !DILocation(line: 131, column: 30, scope: !215)
!217 = !DILocation(line: 131, column: 17, scope: !212)
!218 = !DILocation(line: 133, column: 34, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !69, line: 132, column: 17)
!220 = !DILocation(line: 133, column: 41, scope: !219)
!221 = !DILocation(line: 133, column: 21, scope: !219)
!222 = !DILocation(line: 134, column: 17, scope: !219)
!223 = !DILocation(line: 131, column: 37, scope: !215)
!224 = !DILocation(line: 131, column: 17, scope: !215)
!225 = distinct !{!225, !217, !226, !202}
!226 = !DILocation(line: 134, column: 17, scope: !212)
!227 = !DILocation(line: 135, column: 13, scope: !208)
!228 = !DILocation(line: 138, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !204, file: !69, line: 137, column: 13)
!230 = !DILocation(line: 140, column: 18, scope: !173)
!231 = !DILocation(line: 140, column: 13, scope: !173)
!232 = !DILocation(line: 142, column: 5, scope: !174)
!233 = !DILocalVariable(name: "i", scope: !234, file: !69, line: 146, type: !60)
!234 = distinct !DILexicalBlock(scope: !235, file: !69, line: 145, column: 9)
!235 = distinct !DILexicalBlock(scope: !170, file: !69, line: 144, column: 5)
!236 = !DILocation(line: 146, column: 17, scope: !234)
!237 = !DILocalVariable(name: "buffer", scope: !234, file: !69, line: 147, type: !59)
!238 = !DILocation(line: 147, column: 19, scope: !234)
!239 = !DILocation(line: 147, column: 35, scope: !234)
!240 = !DILocation(line: 147, column: 28, scope: !234)
!241 = !DILocation(line: 148, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !234, file: !69, line: 148, column: 17)
!243 = !DILocation(line: 148, column: 24, scope: !242)
!244 = !DILocation(line: 148, column: 17, scope: !234)
!245 = !DILocation(line: 148, column: 34, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !69, line: 148, column: 33)
!247 = !DILocation(line: 150, column: 20, scope: !248)
!248 = distinct !DILexicalBlock(scope: !234, file: !69, line: 150, column: 13)
!249 = !DILocation(line: 150, column: 18, scope: !248)
!250 = !DILocation(line: 150, column: 25, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !69, line: 150, column: 13)
!252 = !DILocation(line: 150, column: 27, scope: !251)
!253 = !DILocation(line: 150, column: 13, scope: !248)
!254 = !DILocation(line: 152, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !69, line: 151, column: 13)
!256 = !DILocation(line: 152, column: 24, scope: !255)
!257 = !DILocation(line: 152, column: 27, scope: !255)
!258 = !DILocation(line: 153, column: 13, scope: !255)
!259 = !DILocation(line: 150, column: 34, scope: !251)
!260 = !DILocation(line: 150, column: 13, scope: !251)
!261 = distinct !{!261, !253, !262, !202}
!262 = !DILocation(line: 153, column: 13, scope: !248)
!263 = !DILocation(line: 155, column: 17, scope: !264)
!264 = distinct !DILexicalBlock(scope: !234, file: !69, line: 155, column: 17)
!265 = !DILocation(line: 155, column: 22, scope: !264)
!266 = !DILocation(line: 155, column: 27, scope: !264)
!267 = !DILocation(line: 155, column: 30, scope: !264)
!268 = !DILocation(line: 155, column: 35, scope: !264)
!269 = !DILocation(line: 155, column: 17, scope: !234)
!270 = !DILocation(line: 157, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !264, file: !69, line: 156, column: 13)
!272 = !DILocation(line: 157, column: 24, scope: !271)
!273 = !DILocation(line: 157, column: 30, scope: !271)
!274 = !DILocation(line: 159, column: 23, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !69, line: 159, column: 17)
!276 = !DILocation(line: 159, column: 21, scope: !275)
!277 = !DILocation(line: 159, column: 28, scope: !278)
!278 = distinct !DILexicalBlock(scope: !275, file: !69, line: 159, column: 17)
!279 = !DILocation(line: 159, column: 30, scope: !278)
!280 = !DILocation(line: 159, column: 17, scope: !275)
!281 = !DILocation(line: 161, column: 34, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !69, line: 160, column: 17)
!283 = !DILocation(line: 161, column: 41, scope: !282)
!284 = !DILocation(line: 161, column: 21, scope: !282)
!285 = !DILocation(line: 162, column: 17, scope: !282)
!286 = !DILocation(line: 159, column: 37, scope: !278)
!287 = !DILocation(line: 159, column: 17, scope: !278)
!288 = distinct !{!288, !280, !289, !202}
!289 = !DILocation(line: 162, column: 17, scope: !275)
!290 = !DILocation(line: 163, column: 13, scope: !271)
!291 = !DILocation(line: 166, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !264, file: !69, line: 165, column: 13)
!293 = !DILocation(line: 168, column: 18, scope: !234)
!294 = !DILocation(line: 168, column: 13, scope: !234)
!295 = !DILocation(line: 171, column: 1, scope: !68)
!296 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_12_good", scope: !69, file: !69, line: 441, type: !70, scopeLine: 442, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!297 = !DILocation(line: 443, column: 5, scope: !296)
!298 = !DILocation(line: 444, column: 5, scope: !296)
!299 = !DILocation(line: 445, column: 1, scope: !296)
!300 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 456, type: !301, scopeLine: 457, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!301 = !DISubroutineType(types: !302)
!302 = !{!60, !60, !303}
!303 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !304, size: 64)
!304 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!305 = !DILocalVariable(name: "argc", arg: 1, scope: !300, file: !69, line: 456, type: !60)
!306 = !DILocation(line: 456, column: 14, scope: !300)
!307 = !DILocalVariable(name: "argv", arg: 2, scope: !300, file: !69, line: 456, type: !303)
!308 = !DILocation(line: 456, column: 27, scope: !300)
!309 = !DILocation(line: 459, column: 22, scope: !300)
!310 = !DILocation(line: 459, column: 12, scope: !300)
!311 = !DILocation(line: 459, column: 5, scope: !300)
!312 = !DILocation(line: 461, column: 5, scope: !300)
!313 = !DILocation(line: 462, column: 5, scope: !300)
!314 = !DILocation(line: 463, column: 5, scope: !300)
!315 = !DILocation(line: 466, column: 5, scope: !300)
!316 = !DILocation(line: 467, column: 5, scope: !300)
!317 = !DILocation(line: 468, column: 5, scope: !300)
!318 = !DILocation(line: 470, column: 5, scope: !300)
!319 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 180, type: !70, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!320 = !DILocalVariable(name: "data", scope: !319, file: !69, line: 182, type: !60)
!321 = !DILocation(line: 182, column: 9, scope: !319)
!322 = !DILocation(line: 184, column: 10, scope: !319)
!323 = !DILocation(line: 185, column: 8, scope: !324)
!324 = distinct !DILexicalBlock(scope: !319, file: !69, line: 185, column: 8)
!325 = !DILocation(line: 185, column: 8, scope: !319)
!326 = !DILocalVariable(name: "recvResult", scope: !327, file: !69, line: 192, type: !60)
!327 = distinct !DILexicalBlock(scope: !328, file: !69, line: 187, column: 9)
!328 = distinct !DILexicalBlock(scope: !324, file: !69, line: 186, column: 5)
!329 = !DILocation(line: 192, column: 17, scope: !327)
!330 = !DILocalVariable(name: "service", scope: !327, file: !69, line: 193, type: !84)
!331 = !DILocation(line: 193, column: 32, scope: !327)
!332 = !DILocalVariable(name: "connectSocket", scope: !327, file: !69, line: 194, type: !60)
!333 = !DILocation(line: 194, column: 20, scope: !327)
!334 = !DILocalVariable(name: "inputBuffer", scope: !327, file: !69, line: 195, type: !55)
!335 = !DILocation(line: 195, column: 18, scope: !327)
!336 = !DILocation(line: 196, column: 13, scope: !327)
!337 = !DILocation(line: 206, column: 33, scope: !338)
!338 = distinct !DILexicalBlock(scope: !327, file: !69, line: 197, column: 13)
!339 = !DILocation(line: 206, column: 31, scope: !338)
!340 = !DILocation(line: 207, column: 21, scope: !341)
!341 = distinct !DILexicalBlock(scope: !338, file: !69, line: 207, column: 21)
!342 = !DILocation(line: 207, column: 35, scope: !341)
!343 = !DILocation(line: 207, column: 21, scope: !338)
!344 = !DILocation(line: 209, column: 21, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !69, line: 208, column: 17)
!346 = !DILocation(line: 211, column: 17, scope: !338)
!347 = !DILocation(line: 212, column: 25, scope: !338)
!348 = !DILocation(line: 212, column: 36, scope: !338)
!349 = !DILocation(line: 213, column: 43, scope: !338)
!350 = !DILocation(line: 213, column: 25, scope: !338)
!351 = !DILocation(line: 213, column: 34, scope: !338)
!352 = !DILocation(line: 213, column: 41, scope: !338)
!353 = !DILocation(line: 214, column: 36, scope: !338)
!354 = !DILocation(line: 214, column: 25, scope: !338)
!355 = !DILocation(line: 214, column: 34, scope: !338)
!356 = !DILocation(line: 215, column: 29, scope: !357)
!357 = distinct !DILexicalBlock(scope: !338, file: !69, line: 215, column: 21)
!358 = !DILocation(line: 215, column: 44, scope: !357)
!359 = !DILocation(line: 215, column: 21, scope: !357)
!360 = !DILocation(line: 215, column: 89, scope: !357)
!361 = !DILocation(line: 215, column: 21, scope: !338)
!362 = !DILocation(line: 217, column: 21, scope: !363)
!363 = distinct !DILexicalBlock(scope: !357, file: !69, line: 216, column: 17)
!364 = !DILocation(line: 221, column: 35, scope: !338)
!365 = !DILocation(line: 221, column: 50, scope: !338)
!366 = !DILocation(line: 221, column: 30, scope: !338)
!367 = !DILocation(line: 221, column: 28, scope: !338)
!368 = !DILocation(line: 222, column: 21, scope: !369)
!369 = distinct !DILexicalBlock(scope: !338, file: !69, line: 222, column: 21)
!370 = !DILocation(line: 222, column: 32, scope: !369)
!371 = !DILocation(line: 222, column: 48, scope: !369)
!372 = !DILocation(line: 222, column: 51, scope: !369)
!373 = !DILocation(line: 222, column: 62, scope: !369)
!374 = !DILocation(line: 222, column: 21, scope: !338)
!375 = !DILocation(line: 224, column: 21, scope: !376)
!376 = distinct !DILexicalBlock(scope: !369, file: !69, line: 223, column: 17)
!377 = !DILocation(line: 227, column: 29, scope: !338)
!378 = !DILocation(line: 227, column: 17, scope: !338)
!379 = !DILocation(line: 227, column: 41, scope: !338)
!380 = !DILocation(line: 229, column: 29, scope: !338)
!381 = !DILocation(line: 229, column: 24, scope: !338)
!382 = !DILocation(line: 229, column: 22, scope: !338)
!383 = !DILocation(line: 230, column: 13, scope: !338)
!384 = !DILocation(line: 232, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !327, file: !69, line: 232, column: 17)
!386 = !DILocation(line: 232, column: 31, scope: !385)
!387 = !DILocation(line: 232, column: 17, scope: !327)
!388 = !DILocation(line: 234, column: 30, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !69, line: 233, column: 13)
!390 = !DILocation(line: 234, column: 17, scope: !389)
!391 = !DILocation(line: 235, column: 13, scope: !389)
!392 = !DILocation(line: 243, column: 5, scope: !328)
!393 = !DILocalVariable(name: "recvResult", scope: !394, file: !69, line: 251, type: !60)
!394 = distinct !DILexicalBlock(scope: !395, file: !69, line: 246, column: 9)
!395 = distinct !DILexicalBlock(scope: !324, file: !69, line: 245, column: 5)
!396 = !DILocation(line: 251, column: 17, scope: !394)
!397 = !DILocalVariable(name: "service", scope: !394, file: !69, line: 252, type: !84)
!398 = !DILocation(line: 252, column: 32, scope: !394)
!399 = !DILocalVariable(name: "connectSocket", scope: !394, file: !69, line: 253, type: !60)
!400 = !DILocation(line: 253, column: 20, scope: !394)
!401 = !DILocalVariable(name: "inputBuffer", scope: !394, file: !69, line: 254, type: !55)
!402 = !DILocation(line: 254, column: 18, scope: !394)
!403 = !DILocation(line: 255, column: 13, scope: !394)
!404 = !DILocation(line: 265, column: 33, scope: !405)
!405 = distinct !DILexicalBlock(scope: !394, file: !69, line: 256, column: 13)
!406 = !DILocation(line: 265, column: 31, scope: !405)
!407 = !DILocation(line: 266, column: 21, scope: !408)
!408 = distinct !DILexicalBlock(scope: !405, file: !69, line: 266, column: 21)
!409 = !DILocation(line: 266, column: 35, scope: !408)
!410 = !DILocation(line: 266, column: 21, scope: !405)
!411 = !DILocation(line: 268, column: 21, scope: !412)
!412 = distinct !DILexicalBlock(scope: !408, file: !69, line: 267, column: 17)
!413 = !DILocation(line: 270, column: 17, scope: !405)
!414 = !DILocation(line: 271, column: 25, scope: !405)
!415 = !DILocation(line: 271, column: 36, scope: !405)
!416 = !DILocation(line: 272, column: 43, scope: !405)
!417 = !DILocation(line: 272, column: 25, scope: !405)
!418 = !DILocation(line: 272, column: 34, scope: !405)
!419 = !DILocation(line: 272, column: 41, scope: !405)
!420 = !DILocation(line: 273, column: 36, scope: !405)
!421 = !DILocation(line: 273, column: 25, scope: !405)
!422 = !DILocation(line: 273, column: 34, scope: !405)
!423 = !DILocation(line: 274, column: 29, scope: !424)
!424 = distinct !DILexicalBlock(scope: !405, file: !69, line: 274, column: 21)
!425 = !DILocation(line: 274, column: 44, scope: !424)
!426 = !DILocation(line: 274, column: 21, scope: !424)
!427 = !DILocation(line: 274, column: 89, scope: !424)
!428 = !DILocation(line: 274, column: 21, scope: !405)
!429 = !DILocation(line: 276, column: 21, scope: !430)
!430 = distinct !DILexicalBlock(scope: !424, file: !69, line: 275, column: 17)
!431 = !DILocation(line: 280, column: 35, scope: !405)
!432 = !DILocation(line: 280, column: 50, scope: !405)
!433 = !DILocation(line: 280, column: 30, scope: !405)
!434 = !DILocation(line: 280, column: 28, scope: !405)
!435 = !DILocation(line: 281, column: 21, scope: !436)
!436 = distinct !DILexicalBlock(scope: !405, file: !69, line: 281, column: 21)
!437 = !DILocation(line: 281, column: 32, scope: !436)
!438 = !DILocation(line: 281, column: 48, scope: !436)
!439 = !DILocation(line: 281, column: 51, scope: !436)
!440 = !DILocation(line: 281, column: 62, scope: !436)
!441 = !DILocation(line: 281, column: 21, scope: !405)
!442 = !DILocation(line: 283, column: 21, scope: !443)
!443 = distinct !DILexicalBlock(scope: !436, file: !69, line: 282, column: 17)
!444 = !DILocation(line: 286, column: 29, scope: !405)
!445 = !DILocation(line: 286, column: 17, scope: !405)
!446 = !DILocation(line: 286, column: 41, scope: !405)
!447 = !DILocation(line: 288, column: 29, scope: !405)
!448 = !DILocation(line: 288, column: 24, scope: !405)
!449 = !DILocation(line: 288, column: 22, scope: !405)
!450 = !DILocation(line: 289, column: 13, scope: !405)
!451 = !DILocation(line: 291, column: 17, scope: !452)
!452 = distinct !DILexicalBlock(scope: !394, file: !69, line: 291, column: 17)
!453 = !DILocation(line: 291, column: 31, scope: !452)
!454 = !DILocation(line: 291, column: 17, scope: !394)
!455 = !DILocation(line: 293, column: 30, scope: !456)
!456 = distinct !DILexicalBlock(scope: !452, file: !69, line: 292, column: 13)
!457 = !DILocation(line: 293, column: 17, scope: !456)
!458 = !DILocation(line: 294, column: 13, scope: !456)
!459 = !DILocation(line: 303, column: 8, scope: !460)
!460 = distinct !DILexicalBlock(scope: !319, file: !69, line: 303, column: 8)
!461 = !DILocation(line: 303, column: 8, scope: !319)
!462 = !DILocalVariable(name: "i", scope: !463, file: !69, line: 306, type: !60)
!463 = distinct !DILexicalBlock(scope: !464, file: !69, line: 305, column: 9)
!464 = distinct !DILexicalBlock(scope: !460, file: !69, line: 304, column: 5)
!465 = !DILocation(line: 306, column: 17, scope: !463)
!466 = !DILocalVariable(name: "buffer", scope: !463, file: !69, line: 307, type: !59)
!467 = !DILocation(line: 307, column: 19, scope: !463)
!468 = !DILocation(line: 307, column: 35, scope: !463)
!469 = !DILocation(line: 307, column: 28, scope: !463)
!470 = !DILocation(line: 308, column: 17, scope: !471)
!471 = distinct !DILexicalBlock(scope: !463, file: !69, line: 308, column: 17)
!472 = !DILocation(line: 308, column: 24, scope: !471)
!473 = !DILocation(line: 308, column: 17, scope: !463)
!474 = !DILocation(line: 308, column: 34, scope: !475)
!475 = distinct !DILexicalBlock(scope: !471, file: !69, line: 308, column: 33)
!476 = !DILocation(line: 310, column: 20, scope: !477)
!477 = distinct !DILexicalBlock(scope: !463, file: !69, line: 310, column: 13)
!478 = !DILocation(line: 310, column: 18, scope: !477)
!479 = !DILocation(line: 310, column: 25, scope: !480)
!480 = distinct !DILexicalBlock(scope: !477, file: !69, line: 310, column: 13)
!481 = !DILocation(line: 310, column: 27, scope: !480)
!482 = !DILocation(line: 310, column: 13, scope: !477)
!483 = !DILocation(line: 312, column: 17, scope: !484)
!484 = distinct !DILexicalBlock(scope: !480, file: !69, line: 311, column: 13)
!485 = !DILocation(line: 312, column: 24, scope: !484)
!486 = !DILocation(line: 312, column: 27, scope: !484)
!487 = !DILocation(line: 313, column: 13, scope: !484)
!488 = !DILocation(line: 310, column: 34, scope: !480)
!489 = !DILocation(line: 310, column: 13, scope: !480)
!490 = distinct !{!490, !482, !491, !202}
!491 = !DILocation(line: 313, column: 13, scope: !477)
!492 = !DILocation(line: 315, column: 17, scope: !493)
!493 = distinct !DILexicalBlock(scope: !463, file: !69, line: 315, column: 17)
!494 = !DILocation(line: 315, column: 22, scope: !493)
!495 = !DILocation(line: 315, column: 27, scope: !493)
!496 = !DILocation(line: 315, column: 30, scope: !493)
!497 = !DILocation(line: 315, column: 35, scope: !493)
!498 = !DILocation(line: 315, column: 17, scope: !463)
!499 = !DILocation(line: 317, column: 17, scope: !500)
!500 = distinct !DILexicalBlock(scope: !493, file: !69, line: 316, column: 13)
!501 = !DILocation(line: 317, column: 24, scope: !500)
!502 = !DILocation(line: 317, column: 30, scope: !500)
!503 = !DILocation(line: 319, column: 23, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !69, line: 319, column: 17)
!505 = !DILocation(line: 319, column: 21, scope: !504)
!506 = !DILocation(line: 319, column: 28, scope: !507)
!507 = distinct !DILexicalBlock(scope: !504, file: !69, line: 319, column: 17)
!508 = !DILocation(line: 319, column: 30, scope: !507)
!509 = !DILocation(line: 319, column: 17, scope: !504)
!510 = !DILocation(line: 321, column: 34, scope: !511)
!511 = distinct !DILexicalBlock(scope: !507, file: !69, line: 320, column: 17)
!512 = !DILocation(line: 321, column: 41, scope: !511)
!513 = !DILocation(line: 321, column: 21, scope: !511)
!514 = !DILocation(line: 322, column: 17, scope: !511)
!515 = !DILocation(line: 319, column: 37, scope: !507)
!516 = !DILocation(line: 319, column: 17, scope: !507)
!517 = distinct !{!517, !509, !518, !202}
!518 = !DILocation(line: 322, column: 17, scope: !504)
!519 = !DILocation(line: 323, column: 13, scope: !500)
!520 = !DILocation(line: 326, column: 17, scope: !521)
!521 = distinct !DILexicalBlock(scope: !493, file: !69, line: 325, column: 13)
!522 = !DILocation(line: 328, column: 18, scope: !463)
!523 = !DILocation(line: 328, column: 13, scope: !463)
!524 = !DILocation(line: 330, column: 5, scope: !464)
!525 = !DILocalVariable(name: "i", scope: !526, file: !69, line: 334, type: !60)
!526 = distinct !DILexicalBlock(scope: !527, file: !69, line: 333, column: 9)
!527 = distinct !DILexicalBlock(scope: !460, file: !69, line: 332, column: 5)
!528 = !DILocation(line: 334, column: 17, scope: !526)
!529 = !DILocalVariable(name: "buffer", scope: !526, file: !69, line: 335, type: !59)
!530 = !DILocation(line: 335, column: 19, scope: !526)
!531 = !DILocation(line: 335, column: 35, scope: !526)
!532 = !DILocation(line: 335, column: 28, scope: !526)
!533 = !DILocation(line: 336, column: 17, scope: !534)
!534 = distinct !DILexicalBlock(scope: !526, file: !69, line: 336, column: 17)
!535 = !DILocation(line: 336, column: 24, scope: !534)
!536 = !DILocation(line: 336, column: 17, scope: !526)
!537 = !DILocation(line: 336, column: 34, scope: !538)
!538 = distinct !DILexicalBlock(scope: !534, file: !69, line: 336, column: 33)
!539 = !DILocation(line: 338, column: 20, scope: !540)
!540 = distinct !DILexicalBlock(scope: !526, file: !69, line: 338, column: 13)
!541 = !DILocation(line: 338, column: 18, scope: !540)
!542 = !DILocation(line: 338, column: 25, scope: !543)
!543 = distinct !DILexicalBlock(scope: !540, file: !69, line: 338, column: 13)
!544 = !DILocation(line: 338, column: 27, scope: !543)
!545 = !DILocation(line: 338, column: 13, scope: !540)
!546 = !DILocation(line: 340, column: 17, scope: !547)
!547 = distinct !DILexicalBlock(scope: !543, file: !69, line: 339, column: 13)
!548 = !DILocation(line: 340, column: 24, scope: !547)
!549 = !DILocation(line: 340, column: 27, scope: !547)
!550 = !DILocation(line: 341, column: 13, scope: !547)
!551 = !DILocation(line: 338, column: 34, scope: !543)
!552 = !DILocation(line: 338, column: 13, scope: !543)
!553 = distinct !{!553, !545, !554, !202}
!554 = !DILocation(line: 341, column: 13, scope: !540)
!555 = !DILocation(line: 343, column: 17, scope: !556)
!556 = distinct !DILexicalBlock(scope: !526, file: !69, line: 343, column: 17)
!557 = !DILocation(line: 343, column: 22, scope: !556)
!558 = !DILocation(line: 343, column: 27, scope: !556)
!559 = !DILocation(line: 343, column: 30, scope: !556)
!560 = !DILocation(line: 343, column: 35, scope: !556)
!561 = !DILocation(line: 343, column: 17, scope: !526)
!562 = !DILocation(line: 345, column: 17, scope: !563)
!563 = distinct !DILexicalBlock(scope: !556, file: !69, line: 344, column: 13)
!564 = !DILocation(line: 345, column: 24, scope: !563)
!565 = !DILocation(line: 345, column: 30, scope: !563)
!566 = !DILocation(line: 347, column: 23, scope: !567)
!567 = distinct !DILexicalBlock(scope: !563, file: !69, line: 347, column: 17)
!568 = !DILocation(line: 347, column: 21, scope: !567)
!569 = !DILocation(line: 347, column: 28, scope: !570)
!570 = distinct !DILexicalBlock(scope: !567, file: !69, line: 347, column: 17)
!571 = !DILocation(line: 347, column: 30, scope: !570)
!572 = !DILocation(line: 347, column: 17, scope: !567)
!573 = !DILocation(line: 349, column: 34, scope: !574)
!574 = distinct !DILexicalBlock(scope: !570, file: !69, line: 348, column: 17)
!575 = !DILocation(line: 349, column: 41, scope: !574)
!576 = !DILocation(line: 349, column: 21, scope: !574)
!577 = !DILocation(line: 350, column: 17, scope: !574)
!578 = !DILocation(line: 347, column: 37, scope: !570)
!579 = !DILocation(line: 347, column: 17, scope: !570)
!580 = distinct !{!580, !572, !581, !202}
!581 = !DILocation(line: 350, column: 17, scope: !567)
!582 = !DILocation(line: 351, column: 13, scope: !563)
!583 = !DILocation(line: 354, column: 17, scope: !584)
!584 = distinct !DILexicalBlock(scope: !556, file: !69, line: 353, column: 13)
!585 = !DILocation(line: 356, column: 18, scope: !526)
!586 = !DILocation(line: 356, column: 13, scope: !526)
!587 = !DILocation(line: 359, column: 1, scope: !319)
!588 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 364, type: !70, scopeLine: 365, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!589 = !DILocalVariable(name: "data", scope: !588, file: !69, line: 366, type: !60)
!590 = !DILocation(line: 366, column: 9, scope: !588)
!591 = !DILocation(line: 368, column: 10, scope: !588)
!592 = !DILocation(line: 369, column: 8, scope: !593)
!593 = distinct !DILexicalBlock(scope: !588, file: !69, line: 369, column: 8)
!594 = !DILocation(line: 369, column: 8, scope: !588)
!595 = !DILocation(line: 373, column: 14, scope: !596)
!596 = distinct !DILexicalBlock(scope: !593, file: !69, line: 370, column: 5)
!597 = !DILocation(line: 374, column: 5, scope: !596)
!598 = !DILocation(line: 379, column: 14, scope: !599)
!599 = distinct !DILexicalBlock(scope: !593, file: !69, line: 376, column: 5)
!600 = !DILocation(line: 381, column: 8, scope: !601)
!601 = distinct !DILexicalBlock(scope: !588, file: !69, line: 381, column: 8)
!602 = !DILocation(line: 381, column: 8, scope: !588)
!603 = !DILocalVariable(name: "i", scope: !604, file: !69, line: 384, type: !60)
!604 = distinct !DILexicalBlock(scope: !605, file: !69, line: 383, column: 9)
!605 = distinct !DILexicalBlock(scope: !601, file: !69, line: 382, column: 5)
!606 = !DILocation(line: 384, column: 17, scope: !604)
!607 = !DILocalVariable(name: "buffer", scope: !604, file: !69, line: 385, type: !59)
!608 = !DILocation(line: 385, column: 19, scope: !604)
!609 = !DILocation(line: 385, column: 35, scope: !604)
!610 = !DILocation(line: 385, column: 28, scope: !604)
!611 = !DILocation(line: 386, column: 17, scope: !612)
!612 = distinct !DILexicalBlock(scope: !604, file: !69, line: 386, column: 17)
!613 = !DILocation(line: 386, column: 24, scope: !612)
!614 = !DILocation(line: 386, column: 17, scope: !604)
!615 = !DILocation(line: 386, column: 34, scope: !616)
!616 = distinct !DILexicalBlock(scope: !612, file: !69, line: 386, column: 33)
!617 = !DILocation(line: 388, column: 20, scope: !618)
!618 = distinct !DILexicalBlock(scope: !604, file: !69, line: 388, column: 13)
!619 = !DILocation(line: 388, column: 18, scope: !618)
!620 = !DILocation(line: 388, column: 25, scope: !621)
!621 = distinct !DILexicalBlock(scope: !618, file: !69, line: 388, column: 13)
!622 = !DILocation(line: 388, column: 27, scope: !621)
!623 = !DILocation(line: 388, column: 13, scope: !618)
!624 = !DILocation(line: 390, column: 17, scope: !625)
!625 = distinct !DILexicalBlock(scope: !621, file: !69, line: 389, column: 13)
!626 = !DILocation(line: 390, column: 24, scope: !625)
!627 = !DILocation(line: 390, column: 27, scope: !625)
!628 = !DILocation(line: 391, column: 13, scope: !625)
!629 = !DILocation(line: 388, column: 34, scope: !621)
!630 = !DILocation(line: 388, column: 13, scope: !621)
!631 = distinct !{!631, !623, !632, !202}
!632 = !DILocation(line: 391, column: 13, scope: !618)
!633 = !DILocation(line: 394, column: 17, scope: !634)
!634 = distinct !DILexicalBlock(scope: !604, file: !69, line: 394, column: 17)
!635 = !DILocation(line: 394, column: 22, scope: !634)
!636 = !DILocation(line: 394, column: 17, scope: !604)
!637 = !DILocation(line: 396, column: 17, scope: !638)
!638 = distinct !DILexicalBlock(scope: !634, file: !69, line: 395, column: 13)
!639 = !DILocation(line: 396, column: 24, scope: !638)
!640 = !DILocation(line: 396, column: 30, scope: !638)
!641 = !DILocation(line: 398, column: 23, scope: !642)
!642 = distinct !DILexicalBlock(scope: !638, file: !69, line: 398, column: 17)
!643 = !DILocation(line: 398, column: 21, scope: !642)
!644 = !DILocation(line: 398, column: 28, scope: !645)
!645 = distinct !DILexicalBlock(scope: !642, file: !69, line: 398, column: 17)
!646 = !DILocation(line: 398, column: 30, scope: !645)
!647 = !DILocation(line: 398, column: 17, scope: !642)
!648 = !DILocation(line: 400, column: 34, scope: !649)
!649 = distinct !DILexicalBlock(scope: !645, file: !69, line: 399, column: 17)
!650 = !DILocation(line: 400, column: 41, scope: !649)
!651 = !DILocation(line: 400, column: 21, scope: !649)
!652 = !DILocation(line: 401, column: 17, scope: !649)
!653 = !DILocation(line: 398, column: 37, scope: !645)
!654 = !DILocation(line: 398, column: 17, scope: !645)
!655 = distinct !{!655, !647, !656, !202}
!656 = !DILocation(line: 401, column: 17, scope: !642)
!657 = !DILocation(line: 402, column: 13, scope: !638)
!658 = !DILocation(line: 405, column: 17, scope: !659)
!659 = distinct !DILexicalBlock(scope: !634, file: !69, line: 404, column: 13)
!660 = !DILocation(line: 407, column: 18, scope: !604)
!661 = !DILocation(line: 407, column: 13, scope: !604)
!662 = !DILocation(line: 409, column: 5, scope: !605)
!663 = !DILocalVariable(name: "i", scope: !664, file: !69, line: 413, type: !60)
!664 = distinct !DILexicalBlock(scope: !665, file: !69, line: 412, column: 9)
!665 = distinct !DILexicalBlock(scope: !601, file: !69, line: 411, column: 5)
!666 = !DILocation(line: 413, column: 17, scope: !664)
!667 = !DILocalVariable(name: "buffer", scope: !664, file: !69, line: 414, type: !59)
!668 = !DILocation(line: 414, column: 19, scope: !664)
!669 = !DILocation(line: 414, column: 35, scope: !664)
!670 = !DILocation(line: 414, column: 28, scope: !664)
!671 = !DILocation(line: 415, column: 17, scope: !672)
!672 = distinct !DILexicalBlock(scope: !664, file: !69, line: 415, column: 17)
!673 = !DILocation(line: 415, column: 24, scope: !672)
!674 = !DILocation(line: 415, column: 17, scope: !664)
!675 = !DILocation(line: 415, column: 34, scope: !676)
!676 = distinct !DILexicalBlock(scope: !672, file: !69, line: 415, column: 33)
!677 = !DILocation(line: 417, column: 20, scope: !678)
!678 = distinct !DILexicalBlock(scope: !664, file: !69, line: 417, column: 13)
!679 = !DILocation(line: 417, column: 18, scope: !678)
!680 = !DILocation(line: 417, column: 25, scope: !681)
!681 = distinct !DILexicalBlock(scope: !678, file: !69, line: 417, column: 13)
!682 = !DILocation(line: 417, column: 27, scope: !681)
!683 = !DILocation(line: 417, column: 13, scope: !678)
!684 = !DILocation(line: 419, column: 17, scope: !685)
!685 = distinct !DILexicalBlock(scope: !681, file: !69, line: 418, column: 13)
!686 = !DILocation(line: 419, column: 24, scope: !685)
!687 = !DILocation(line: 419, column: 27, scope: !685)
!688 = !DILocation(line: 420, column: 13, scope: !685)
!689 = !DILocation(line: 417, column: 34, scope: !681)
!690 = !DILocation(line: 417, column: 13, scope: !681)
!691 = distinct !{!691, !683, !692, !202}
!692 = !DILocation(line: 420, column: 13, scope: !678)
!693 = !DILocation(line: 423, column: 17, scope: !694)
!694 = distinct !DILexicalBlock(scope: !664, file: !69, line: 423, column: 17)
!695 = !DILocation(line: 423, column: 22, scope: !694)
!696 = !DILocation(line: 423, column: 17, scope: !664)
!697 = !DILocation(line: 425, column: 17, scope: !698)
!698 = distinct !DILexicalBlock(scope: !694, file: !69, line: 424, column: 13)
!699 = !DILocation(line: 425, column: 24, scope: !698)
!700 = !DILocation(line: 425, column: 30, scope: !698)
!701 = !DILocation(line: 427, column: 23, scope: !702)
!702 = distinct !DILexicalBlock(scope: !698, file: !69, line: 427, column: 17)
!703 = !DILocation(line: 427, column: 21, scope: !702)
!704 = !DILocation(line: 427, column: 28, scope: !705)
!705 = distinct !DILexicalBlock(scope: !702, file: !69, line: 427, column: 17)
!706 = !DILocation(line: 427, column: 30, scope: !705)
!707 = !DILocation(line: 427, column: 17, scope: !702)
!708 = !DILocation(line: 429, column: 34, scope: !709)
!709 = distinct !DILexicalBlock(scope: !705, file: !69, line: 428, column: 17)
!710 = !DILocation(line: 429, column: 41, scope: !709)
!711 = !DILocation(line: 429, column: 21, scope: !709)
!712 = !DILocation(line: 430, column: 17, scope: !709)
!713 = !DILocation(line: 427, column: 37, scope: !705)
!714 = !DILocation(line: 427, column: 17, scope: !705)
!715 = distinct !{!715, !707, !716, !202}
!716 = !DILocation(line: 430, column: 17, scope: !702)
!717 = !DILocation(line: 431, column: 13, scope: !698)
!718 = !DILocation(line: 434, column: 17, scope: !719)
!719 = distinct !DILexicalBlock(scope: !694, file: !69, line: 433, column: 13)
!720 = !DILocation(line: 436, column: 18, scope: !664)
!721 = !DILocation(line: 436, column: 13, scope: !664)
!722 = !DILocation(line: 439, column: 1, scope: !588)
