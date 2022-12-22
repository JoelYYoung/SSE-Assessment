; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_42_bad() #0 !dbg !68 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 -1, i32* %data, align 4, !dbg !75
  %0 = load i32, i32* %data, align 4, !dbg !76
  %call = call i32 @badSource(i32 %0), !dbg !77
  store i32 %call, i32* %data, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %i, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !82, metadata !DIExpression()), !dbg !83
  %call1 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !84
  %1 = bitcast i8* %call1 to i32*, !dbg !85
  store i32* %1, i32** %buffer, align 8, !dbg !83
  %2 = load i32*, i32** %buffer, align 8, !dbg !86
  %cmp = icmp eq i32* %2, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !95
  %cmp2 = icmp slt i32 %3, 10, !dbg !97
  br i1 %cmp2, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !99
  %5 = load i32, i32* %i, align 4, !dbg !101
  %idxprom = sext i32 %5 to i64, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !104
  %inc = add nsw i32 %6, 1, !dbg !104
  store i32 %inc, i32* %i, align 4, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !109
  %cmp3 = icmp sge i32 %7, 0, !dbg !111
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !112

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !113
  %9 = load i32, i32* %data, align 4, !dbg !115
  %idxprom5 = sext i32 %9 to i64, !dbg !113
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !113
  store i32 1, i32* %arrayidx6, align 4, !dbg !116
  store i32 0, i32* %i, align 4, !dbg !117
  br label %for.cond7, !dbg !119

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !120
  %cmp8 = icmp slt i32 %10, 10, !dbg !122
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !123

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !124
  %12 = load i32, i32* %i, align 4, !dbg !126
  %idxprom10 = sext i32 %12 to i64, !dbg !124
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !124
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !124
  call void @printIntLine(i32 %13), !dbg !127
  br label %for.inc12, !dbg !128

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !129
  %inc13 = add nsw i32 %14, 1, !dbg !129
  store i32 %inc13, i32* %i, align 4, !dbg !129
  br label %for.cond7, !dbg !130, !llvm.loop !131

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !133

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !134
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !136
  %16 = bitcast i32* %15 to i8*, !dbg !136
  call void @free(i8* %16) #8, !dbg !137
  ret void, !dbg !138
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !139 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !147, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !170, metadata !DIExpression()), !dbg !171
  store i32 -1, i32* %connectSocket, align 4, !dbg !171
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !172, metadata !DIExpression()), !dbg !173
  br label %do.body, !dbg !174

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !175
  store i32 %call, i32* %connectSocket, align 4, !dbg !177
  %0 = load i32, i32* %connectSocket, align 4, !dbg !178
  %cmp = icmp eq i32 %0, -1, !dbg !180
  br i1 %cmp, label %if.then, label %if.end, !dbg !181

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !182

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !184
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !184
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !185
  store i16 2, i16* %sin_family, align 4, !dbg !186
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0)) #8, !dbg !187
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !188
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !189
  store i32 %call1, i32* %s_addr, align 4, !dbg !190
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #10, !dbg !191
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !192
  store i16 %call2, i16* %sin_port, align 2, !dbg !193
  %2 = load i32, i32* %connectSocket, align 4, !dbg !194
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !196
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !197
  %cmp4 = icmp eq i32 %call3, -1, !dbg !198
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !199

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !200

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !202
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !203
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !204
  %conv = trunc i64 %call7 to i32, !dbg !204
  store i32 %conv, i32* %recvResult, align 4, !dbg !205
  %5 = load i32, i32* %recvResult, align 4, !dbg !206
  %cmp8 = icmp eq i32 %5, -1, !dbg !208
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !209

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !210
  %cmp10 = icmp eq i32 %6, 0, !dbg !211
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !212

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !213

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !215
  %idxprom = sext i32 %7 to i64, !dbg !216
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !216
  store i8 0, i8* %arrayidx, align 1, !dbg !217
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !218
  %call15 = call i32 @atoi(i8* %arraydecay14) #11, !dbg !219
  store i32 %call15, i32* %data.addr, align 4, !dbg !220
  br label %do.end, !dbg !221

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !222
  %cmp16 = icmp ne i32 %8, -1, !dbg !224
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !225

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !226
  %call19 = call i32 @close(i32 %9), !dbg !228
  br label %if.end20, !dbg !229

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data.addr, align 4, !dbg !230
  ret i32 %10, !dbg !231
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printIntLine(i32) #4

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_42_good() #0 !dbg !232 {
entry:
  call void @goodB2G(), !dbg !233
  call void @goodG2B(), !dbg !234
  ret void, !dbg !235
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !236 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !241, metadata !DIExpression()), !dbg !242
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !243, metadata !DIExpression()), !dbg !244
  %call = call i64 @time(i64* null) #8, !dbg !245
  %conv = trunc i64 %call to i32, !dbg !246
  call void @srand(i32 %conv) #8, !dbg !247
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !248
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_42_good(), !dbg !249
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !250
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !251
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_42_bad(), !dbg !252
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !253
  ret i32 0, !dbg !254
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #2

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #6

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #4

declare dso_local i64 @recv(i32, i8*, i64, i32) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #7

declare dso_local i32 @close(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !255 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !256, metadata !DIExpression()), !dbg !257
  store i32 -1, i32* %data, align 4, !dbg !258
  %0 = load i32, i32* %data, align 4, !dbg !259
  %call = call i32 @goodB2GSource(i32 %0), !dbg !260
  store i32 %call, i32* %data, align 4, !dbg !261
  call void @llvm.dbg.declare(metadata i32* %i, metadata !262, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !265, metadata !DIExpression()), !dbg !266
  %call1 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !267
  %1 = bitcast i8* %call1 to i32*, !dbg !268
  store i32* %1, i32** %buffer, align 8, !dbg !266
  %2 = load i32*, i32** %buffer, align 8, !dbg !269
  %cmp = icmp eq i32* %2, null, !dbg !271
  br i1 %cmp, label %if.then, label %if.end, !dbg !272

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !273
  unreachable, !dbg !273

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !275
  br label %for.cond, !dbg !277

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !278
  %cmp2 = icmp slt i32 %3, 10, !dbg !280
  br i1 %cmp2, label %for.body, label %for.end, !dbg !281

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !282
  %5 = load i32, i32* %i, align 4, !dbg !284
  %idxprom = sext i32 %5 to i64, !dbg !282
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !282
  store i32 0, i32* %arrayidx, align 4, !dbg !285
  br label %for.inc, !dbg !286

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !287
  %inc = add nsw i32 %6, 1, !dbg !287
  store i32 %inc, i32* %i, align 4, !dbg !287
  br label %for.cond, !dbg !288, !llvm.loop !289

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !291
  %cmp3 = icmp sge i32 %7, 0, !dbg !293
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !294

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !295
  %cmp4 = icmp slt i32 %8, 10, !dbg !296
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !297

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !298
  %10 = load i32, i32* %data, align 4, !dbg !300
  %idxprom6 = sext i32 %10 to i64, !dbg !298
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !298
  store i32 1, i32* %arrayidx7, align 4, !dbg !301
  store i32 0, i32* %i, align 4, !dbg !302
  br label %for.cond8, !dbg !304

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !305
  %cmp9 = icmp slt i32 %11, 10, !dbg !307
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !308

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !309
  %13 = load i32, i32* %i, align 4, !dbg !311
  %idxprom11 = sext i32 %13 to i64, !dbg !309
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !309
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !309
  call void @printIntLine(i32 %14), !dbg !312
  br label %for.inc13, !dbg !313

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !314
  %inc14 = add nsw i32 %15, 1, !dbg !314
  store i32 %inc14, i32* %i, align 4, !dbg !314
  br label %for.cond8, !dbg !315, !llvm.loop !316

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !318

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !319
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !321
  %17 = bitcast i32* %16 to i8*, !dbg !321
  call void @free(i8* %17) #8, !dbg !322
  ret void, !dbg !323
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !324 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !325, metadata !DIExpression()), !dbg !326
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !327, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !330, metadata !DIExpression()), !dbg !331
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !332, metadata !DIExpression()), !dbg !333
  store i32 -1, i32* %connectSocket, align 4, !dbg !333
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !334, metadata !DIExpression()), !dbg !335
  br label %do.body, !dbg !336

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !337
  store i32 %call, i32* %connectSocket, align 4, !dbg !339
  %0 = load i32, i32* %connectSocket, align 4, !dbg !340
  %cmp = icmp eq i32 %0, -1, !dbg !342
  br i1 %cmp, label %if.then, label %if.end, !dbg !343

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !344

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !346
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !346
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !347
  store i16 2, i16* %sin_family, align 4, !dbg !348
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0)) #8, !dbg !349
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !350
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !351
  store i32 %call1, i32* %s_addr, align 4, !dbg !352
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #10, !dbg !353
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !354
  store i16 %call2, i16* %sin_port, align 2, !dbg !355
  %2 = load i32, i32* %connectSocket, align 4, !dbg !356
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !358
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !359
  %cmp4 = icmp eq i32 %call3, -1, !dbg !360
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !361

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !362

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !364
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !365
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !366
  %conv = trunc i64 %call7 to i32, !dbg !366
  store i32 %conv, i32* %recvResult, align 4, !dbg !367
  %5 = load i32, i32* %recvResult, align 4, !dbg !368
  %cmp8 = icmp eq i32 %5, -1, !dbg !370
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !371

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !372
  %cmp10 = icmp eq i32 %6, 0, !dbg !373
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !374

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !375

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !377
  %idxprom = sext i32 %7 to i64, !dbg !378
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !378
  store i8 0, i8* %arrayidx, align 1, !dbg !379
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !380
  %call15 = call i32 @atoi(i8* %arraydecay14) #11, !dbg !381
  store i32 %call15, i32* %data.addr, align 4, !dbg !382
  br label %do.end, !dbg !383

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !384
  %cmp16 = icmp ne i32 %8, -1, !dbg !386
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !387

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !388
  %call19 = call i32 @close(i32 %9), !dbg !390
  br label %if.end20, !dbg !391

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data.addr, align 4, !dbg !392
  ret i32 %10, !dbg !393
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !394 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !395, metadata !DIExpression()), !dbg !396
  store i32 -1, i32* %data, align 4, !dbg !397
  %0 = load i32, i32* %data, align 4, !dbg !398
  %call = call i32 @goodG2BSource(i32 %0), !dbg !399
  store i32 %call, i32* %data, align 4, !dbg !400
  call void @llvm.dbg.declare(metadata i32* %i, metadata !401, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !404, metadata !DIExpression()), !dbg !405
  %call1 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !406
  %1 = bitcast i8* %call1 to i32*, !dbg !407
  store i32* %1, i32** %buffer, align 8, !dbg !405
  %2 = load i32*, i32** %buffer, align 8, !dbg !408
  %cmp = icmp eq i32* %2, null, !dbg !410
  br i1 %cmp, label %if.then, label %if.end, !dbg !411

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !412
  unreachable, !dbg !412

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !414
  br label %for.cond, !dbg !416

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !417
  %cmp2 = icmp slt i32 %3, 10, !dbg !419
  br i1 %cmp2, label %for.body, label %for.end, !dbg !420

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !421
  %5 = load i32, i32* %i, align 4, !dbg !423
  %idxprom = sext i32 %5 to i64, !dbg !421
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !421
  store i32 0, i32* %arrayidx, align 4, !dbg !424
  br label %for.inc, !dbg !425

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !426
  %inc = add nsw i32 %6, 1, !dbg !426
  store i32 %inc, i32* %i, align 4, !dbg !426
  br label %for.cond, !dbg !427, !llvm.loop !428

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !430
  %cmp3 = icmp sge i32 %7, 0, !dbg !432
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !433

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !434
  %9 = load i32, i32* %data, align 4, !dbg !436
  %idxprom5 = sext i32 %9 to i64, !dbg !434
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !434
  store i32 1, i32* %arrayidx6, align 4, !dbg !437
  store i32 0, i32* %i, align 4, !dbg !438
  br label %for.cond7, !dbg !440

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !441
  %cmp8 = icmp slt i32 %10, 10, !dbg !443
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !444

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !445
  %12 = load i32, i32* %i, align 4, !dbg !447
  %idxprom10 = sext i32 %12 to i64, !dbg !445
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !445
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !445
  call void @printIntLine(i32 %13), !dbg !448
  br label %for.inc12, !dbg !449

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !450
  %inc13 = add nsw i32 %14, 1, !dbg !450
  store i32 %inc13, i32* %i, align 4, !dbg !450
  br label %for.cond7, !dbg !451, !llvm.loop !452

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !454

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !455
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !457
  %16 = bitcast i32* %15 to i8*, !dbg !457
  call void @free(i8* %16) #8, !dbg !458
  ret void, !dbg !459
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !460 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !461, metadata !DIExpression()), !dbg !462
  store i32 7, i32* %data.addr, align 4, !dbg !463
  %0 = load i32, i32* %data.addr, align 4, !dbg !464
  ret i32 %0, !dbg !465
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readnone willreturn }
attributes #11 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!62, !63, !64, !65, !66}
!llvm.ident = !{!67}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_42.c", directory: "/root/SSE-Assessment")
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
!45 = !{!46, !48, !5, !49}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !51, line: 175, size: 128, elements: !52)
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!52 = !{!53, !57}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !50, file: !51, line: 177, baseType: !54, size: 16)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !55, line: 28, baseType: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!56 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !50, file: !51, line: 178, baseType: !58, size: 112, offset: 16)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 112, elements: !60)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !{!61}
!61 = !DISubrange(count: 14)
!62 = !{i32 7, !"Dwarf Version", i32 4}
!63 = !{i32 2, !"Debug Info Version", i32 3}
!64 = !{i32 1, !"wchar_size", i32 4}
!65 = !{i32 7, !"uwtable", i32 1}
!66 = !{i32 7, !"frame-pointer", i32 2}
!67 = !{!"clang version 13.0.0"}
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_42_bad", scope: !69, file: !69, line: 105, type: !70, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_42.c", directory: "/root/SSE-Assessment")
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !{}
!73 = !DILocalVariable(name: "data", scope: !68, file: !69, line: 107, type: !47)
!74 = !DILocation(line: 107, column: 9, scope: !68)
!75 = !DILocation(line: 109, column: 10, scope: !68)
!76 = !DILocation(line: 110, column: 22, scope: !68)
!77 = !DILocation(line: 110, column: 12, scope: !68)
!78 = !DILocation(line: 110, column: 10, scope: !68)
!79 = !DILocalVariable(name: "i", scope: !80, file: !69, line: 112, type: !47)
!80 = distinct !DILexicalBlock(scope: !68, file: !69, line: 111, column: 5)
!81 = !DILocation(line: 112, column: 13, scope: !80)
!82 = !DILocalVariable(name: "buffer", scope: !80, file: !69, line: 113, type: !46)
!83 = !DILocation(line: 113, column: 15, scope: !80)
!84 = !DILocation(line: 113, column: 31, scope: !80)
!85 = !DILocation(line: 113, column: 24, scope: !80)
!86 = !DILocation(line: 114, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !69, line: 114, column: 13)
!88 = !DILocation(line: 114, column: 20, scope: !87)
!89 = !DILocation(line: 114, column: 13, scope: !80)
!90 = !DILocation(line: 114, column: 30, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !69, line: 114, column: 29)
!92 = !DILocation(line: 116, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !80, file: !69, line: 116, column: 9)
!94 = !DILocation(line: 116, column: 14, scope: !93)
!95 = !DILocation(line: 116, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !69, line: 116, column: 9)
!97 = !DILocation(line: 116, column: 23, scope: !96)
!98 = !DILocation(line: 116, column: 9, scope: !93)
!99 = !DILocation(line: 118, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !69, line: 117, column: 9)
!101 = !DILocation(line: 118, column: 20, scope: !100)
!102 = !DILocation(line: 118, column: 23, scope: !100)
!103 = !DILocation(line: 119, column: 9, scope: !100)
!104 = !DILocation(line: 116, column: 30, scope: !96)
!105 = !DILocation(line: 116, column: 9, scope: !96)
!106 = distinct !{!106, !98, !107, !108}
!107 = !DILocation(line: 119, column: 9, scope: !93)
!108 = !{!"llvm.loop.mustprogress"}
!109 = !DILocation(line: 122, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !80, file: !69, line: 122, column: 13)
!111 = !DILocation(line: 122, column: 18, scope: !110)
!112 = !DILocation(line: 122, column: 13, scope: !80)
!113 = !DILocation(line: 124, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !69, line: 123, column: 9)
!115 = !DILocation(line: 124, column: 20, scope: !114)
!116 = !DILocation(line: 124, column: 26, scope: !114)
!117 = !DILocation(line: 126, column: 19, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !69, line: 126, column: 13)
!119 = !DILocation(line: 126, column: 17, scope: !118)
!120 = !DILocation(line: 126, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !69, line: 126, column: 13)
!122 = !DILocation(line: 126, column: 26, scope: !121)
!123 = !DILocation(line: 126, column: 13, scope: !118)
!124 = !DILocation(line: 128, column: 30, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !69, line: 127, column: 13)
!126 = !DILocation(line: 128, column: 37, scope: !125)
!127 = !DILocation(line: 128, column: 17, scope: !125)
!128 = !DILocation(line: 129, column: 13, scope: !125)
!129 = !DILocation(line: 126, column: 33, scope: !121)
!130 = !DILocation(line: 126, column: 13, scope: !121)
!131 = distinct !{!131, !123, !132, !108}
!132 = !DILocation(line: 129, column: 13, scope: !118)
!133 = !DILocation(line: 130, column: 9, scope: !114)
!134 = !DILocation(line: 133, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !110, file: !69, line: 132, column: 9)
!136 = !DILocation(line: 135, column: 14, scope: !80)
!137 = !DILocation(line: 135, column: 9, scope: !80)
!138 = !DILocation(line: 137, column: 1, scope: !68)
!139 = distinct !DISubprogram(name: "badSource", scope: !69, file: !69, line: 44, type: !140, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!140 = !DISubroutineType(types: !141)
!141 = !{!47, !47}
!142 = !DILocalVariable(name: "data", arg: 1, scope: !139, file: !69, line: 44, type: !47)
!143 = !DILocation(line: 44, column: 26, scope: !139)
!144 = !DILocalVariable(name: "recvResult", scope: !145, file: !69, line: 51, type: !47)
!145 = distinct !DILexicalBlock(scope: !139, file: !69, line: 46, column: 5)
!146 = !DILocation(line: 51, column: 13, scope: !145)
!147 = !DILocalVariable(name: "service", scope: !145, file: !69, line: 52, type: !148)
!148 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !149)
!149 = !{!150, !151, !157, !164}
!150 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !148, file: !17, line: 239, baseType: !54, size: 16)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !148, file: !17, line: 240, baseType: !152, size: 16, offset: 16)
!152 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !153)
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !154, line: 25, baseType: !155)
!154 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !156, line: 39, baseType: !56)
!156 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!157 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !148, file: !17, line: 241, baseType: !158, size: 32, offset: 32)
!158 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !159)
!159 = !{!160}
!160 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !158, file: !17, line: 33, baseType: !161, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !162)
!162 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !154, line: 26, baseType: !163)
!163 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !156, line: 41, baseType: !5)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !148, file: !17, line: 244, baseType: !165, size: 64, offset: 64)
!165 = !DICompositeType(tag: DW_TAG_array_type, baseType: !166, size: 64, elements: !167)
!166 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!167 = !{!168}
!168 = !DISubrange(count: 8)
!169 = !DILocation(line: 52, column: 28, scope: !145)
!170 = !DILocalVariable(name: "connectSocket", scope: !145, file: !69, line: 53, type: !47)
!171 = !DILocation(line: 53, column: 16, scope: !145)
!172 = !DILocalVariable(name: "inputBuffer", scope: !145, file: !69, line: 54, type: !58)
!173 = !DILocation(line: 54, column: 14, scope: !145)
!174 = !DILocation(line: 55, column: 9, scope: !145)
!175 = !DILocation(line: 65, column: 29, scope: !176)
!176 = distinct !DILexicalBlock(scope: !145, file: !69, line: 56, column: 9)
!177 = !DILocation(line: 65, column: 27, scope: !176)
!178 = !DILocation(line: 66, column: 17, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !69, line: 66, column: 17)
!180 = !DILocation(line: 66, column: 31, scope: !179)
!181 = !DILocation(line: 66, column: 17, scope: !176)
!182 = !DILocation(line: 68, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !69, line: 67, column: 13)
!184 = !DILocation(line: 70, column: 13, scope: !176)
!185 = !DILocation(line: 71, column: 21, scope: !176)
!186 = !DILocation(line: 71, column: 32, scope: !176)
!187 = !DILocation(line: 72, column: 39, scope: !176)
!188 = !DILocation(line: 72, column: 21, scope: !176)
!189 = !DILocation(line: 72, column: 30, scope: !176)
!190 = !DILocation(line: 72, column: 37, scope: !176)
!191 = !DILocation(line: 73, column: 32, scope: !176)
!192 = !DILocation(line: 73, column: 21, scope: !176)
!193 = !DILocation(line: 73, column: 30, scope: !176)
!194 = !DILocation(line: 74, column: 25, scope: !195)
!195 = distinct !DILexicalBlock(scope: !176, file: !69, line: 74, column: 17)
!196 = !DILocation(line: 74, column: 40, scope: !195)
!197 = !DILocation(line: 74, column: 17, scope: !195)
!198 = !DILocation(line: 74, column: 85, scope: !195)
!199 = !DILocation(line: 74, column: 17, scope: !176)
!200 = !DILocation(line: 76, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !195, file: !69, line: 75, column: 13)
!202 = !DILocation(line: 80, column: 31, scope: !176)
!203 = !DILocation(line: 80, column: 46, scope: !176)
!204 = !DILocation(line: 80, column: 26, scope: !176)
!205 = !DILocation(line: 80, column: 24, scope: !176)
!206 = !DILocation(line: 81, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !176, file: !69, line: 81, column: 17)
!208 = !DILocation(line: 81, column: 28, scope: !207)
!209 = !DILocation(line: 81, column: 44, scope: !207)
!210 = !DILocation(line: 81, column: 47, scope: !207)
!211 = !DILocation(line: 81, column: 58, scope: !207)
!212 = !DILocation(line: 81, column: 17, scope: !176)
!213 = !DILocation(line: 83, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !207, file: !69, line: 82, column: 13)
!215 = !DILocation(line: 86, column: 25, scope: !176)
!216 = !DILocation(line: 86, column: 13, scope: !176)
!217 = !DILocation(line: 86, column: 37, scope: !176)
!218 = !DILocation(line: 88, column: 25, scope: !176)
!219 = !DILocation(line: 88, column: 20, scope: !176)
!220 = !DILocation(line: 88, column: 18, scope: !176)
!221 = !DILocation(line: 89, column: 9, scope: !176)
!222 = !DILocation(line: 91, column: 13, scope: !223)
!223 = distinct !DILexicalBlock(scope: !145, file: !69, line: 91, column: 13)
!224 = !DILocation(line: 91, column: 27, scope: !223)
!225 = !DILocation(line: 91, column: 13, scope: !145)
!226 = !DILocation(line: 93, column: 26, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !69, line: 92, column: 9)
!228 = !DILocation(line: 93, column: 13, scope: !227)
!229 = !DILocation(line: 94, column: 9, scope: !227)
!230 = !DILocation(line: 102, column: 12, scope: !139)
!231 = !DILocation(line: 102, column: 5, scope: !139)
!232 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_42_good", scope: !69, file: !69, line: 281, type: !70, scopeLine: 282, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!233 = !DILocation(line: 283, column: 5, scope: !232)
!234 = !DILocation(line: 284, column: 5, scope: !232)
!235 = !DILocation(line: 285, column: 1, scope: !232)
!236 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 296, type: !237, scopeLine: 297, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !72)
!237 = !DISubroutineType(types: !238)
!238 = !{!47, !47, !239}
!239 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!241 = !DILocalVariable(name: "argc", arg: 1, scope: !236, file: !69, line: 296, type: !47)
!242 = !DILocation(line: 296, column: 14, scope: !236)
!243 = !DILocalVariable(name: "argv", arg: 2, scope: !236, file: !69, line: 296, type: !239)
!244 = !DILocation(line: 296, column: 27, scope: !236)
!245 = !DILocation(line: 299, column: 22, scope: !236)
!246 = !DILocation(line: 299, column: 12, scope: !236)
!247 = !DILocation(line: 299, column: 5, scope: !236)
!248 = !DILocation(line: 301, column: 5, scope: !236)
!249 = !DILocation(line: 302, column: 5, scope: !236)
!250 = !DILocation(line: 303, column: 5, scope: !236)
!251 = !DILocation(line: 306, column: 5, scope: !236)
!252 = !DILocation(line: 307, column: 5, scope: !236)
!253 = !DILocation(line: 308, column: 5, scope: !236)
!254 = !DILocation(line: 310, column: 5, scope: !236)
!255 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 248, type: !70, scopeLine: 249, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!256 = !DILocalVariable(name: "data", scope: !255, file: !69, line: 250, type: !47)
!257 = !DILocation(line: 250, column: 9, scope: !255)
!258 = !DILocation(line: 252, column: 10, scope: !255)
!259 = !DILocation(line: 253, column: 26, scope: !255)
!260 = !DILocation(line: 253, column: 12, scope: !255)
!261 = !DILocation(line: 253, column: 10, scope: !255)
!262 = !DILocalVariable(name: "i", scope: !263, file: !69, line: 255, type: !47)
!263 = distinct !DILexicalBlock(scope: !255, file: !69, line: 254, column: 5)
!264 = !DILocation(line: 255, column: 13, scope: !263)
!265 = !DILocalVariable(name: "buffer", scope: !263, file: !69, line: 256, type: !46)
!266 = !DILocation(line: 256, column: 15, scope: !263)
!267 = !DILocation(line: 256, column: 31, scope: !263)
!268 = !DILocation(line: 256, column: 24, scope: !263)
!269 = !DILocation(line: 257, column: 13, scope: !270)
!270 = distinct !DILexicalBlock(scope: !263, file: !69, line: 257, column: 13)
!271 = !DILocation(line: 257, column: 20, scope: !270)
!272 = !DILocation(line: 257, column: 13, scope: !263)
!273 = !DILocation(line: 257, column: 30, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !69, line: 257, column: 29)
!275 = !DILocation(line: 259, column: 16, scope: !276)
!276 = distinct !DILexicalBlock(scope: !263, file: !69, line: 259, column: 9)
!277 = !DILocation(line: 259, column: 14, scope: !276)
!278 = !DILocation(line: 259, column: 21, scope: !279)
!279 = distinct !DILexicalBlock(scope: !276, file: !69, line: 259, column: 9)
!280 = !DILocation(line: 259, column: 23, scope: !279)
!281 = !DILocation(line: 259, column: 9, scope: !276)
!282 = !DILocation(line: 261, column: 13, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !69, line: 260, column: 9)
!284 = !DILocation(line: 261, column: 20, scope: !283)
!285 = !DILocation(line: 261, column: 23, scope: !283)
!286 = !DILocation(line: 262, column: 9, scope: !283)
!287 = !DILocation(line: 259, column: 30, scope: !279)
!288 = !DILocation(line: 259, column: 9, scope: !279)
!289 = distinct !{!289, !281, !290, !108}
!290 = !DILocation(line: 262, column: 9, scope: !276)
!291 = !DILocation(line: 264, column: 13, scope: !292)
!292 = distinct !DILexicalBlock(scope: !263, file: !69, line: 264, column: 13)
!293 = !DILocation(line: 264, column: 18, scope: !292)
!294 = !DILocation(line: 264, column: 23, scope: !292)
!295 = !DILocation(line: 264, column: 26, scope: !292)
!296 = !DILocation(line: 264, column: 31, scope: !292)
!297 = !DILocation(line: 264, column: 13, scope: !263)
!298 = !DILocation(line: 266, column: 13, scope: !299)
!299 = distinct !DILexicalBlock(scope: !292, file: !69, line: 265, column: 9)
!300 = !DILocation(line: 266, column: 20, scope: !299)
!301 = !DILocation(line: 266, column: 26, scope: !299)
!302 = !DILocation(line: 268, column: 19, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !69, line: 268, column: 13)
!304 = !DILocation(line: 268, column: 17, scope: !303)
!305 = !DILocation(line: 268, column: 24, scope: !306)
!306 = distinct !DILexicalBlock(scope: !303, file: !69, line: 268, column: 13)
!307 = !DILocation(line: 268, column: 26, scope: !306)
!308 = !DILocation(line: 268, column: 13, scope: !303)
!309 = !DILocation(line: 270, column: 30, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !69, line: 269, column: 13)
!311 = !DILocation(line: 270, column: 37, scope: !310)
!312 = !DILocation(line: 270, column: 17, scope: !310)
!313 = !DILocation(line: 271, column: 13, scope: !310)
!314 = !DILocation(line: 268, column: 33, scope: !306)
!315 = !DILocation(line: 268, column: 13, scope: !306)
!316 = distinct !{!316, !308, !317, !108}
!317 = !DILocation(line: 271, column: 13, scope: !303)
!318 = !DILocation(line: 272, column: 9, scope: !299)
!319 = !DILocation(line: 275, column: 13, scope: !320)
!320 = distinct !DILexicalBlock(scope: !292, file: !69, line: 274, column: 9)
!321 = !DILocation(line: 277, column: 14, scope: !263)
!322 = !DILocation(line: 277, column: 9, scope: !263)
!323 = !DILocation(line: 279, column: 1, scope: !255)
!324 = distinct !DISubprogram(name: "goodB2GSource", scope: !69, file: !69, line: 187, type: !140, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!325 = !DILocalVariable(name: "data", arg: 1, scope: !324, file: !69, line: 187, type: !47)
!326 = !DILocation(line: 187, column: 30, scope: !324)
!327 = !DILocalVariable(name: "recvResult", scope: !328, file: !69, line: 194, type: !47)
!328 = distinct !DILexicalBlock(scope: !324, file: !69, line: 189, column: 5)
!329 = !DILocation(line: 194, column: 13, scope: !328)
!330 = !DILocalVariable(name: "service", scope: !328, file: !69, line: 195, type: !148)
!331 = !DILocation(line: 195, column: 28, scope: !328)
!332 = !DILocalVariable(name: "connectSocket", scope: !328, file: !69, line: 196, type: !47)
!333 = !DILocation(line: 196, column: 16, scope: !328)
!334 = !DILocalVariable(name: "inputBuffer", scope: !328, file: !69, line: 197, type: !58)
!335 = !DILocation(line: 197, column: 14, scope: !328)
!336 = !DILocation(line: 198, column: 9, scope: !328)
!337 = !DILocation(line: 208, column: 29, scope: !338)
!338 = distinct !DILexicalBlock(scope: !328, file: !69, line: 199, column: 9)
!339 = !DILocation(line: 208, column: 27, scope: !338)
!340 = !DILocation(line: 209, column: 17, scope: !341)
!341 = distinct !DILexicalBlock(scope: !338, file: !69, line: 209, column: 17)
!342 = !DILocation(line: 209, column: 31, scope: !341)
!343 = !DILocation(line: 209, column: 17, scope: !338)
!344 = !DILocation(line: 211, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !69, line: 210, column: 13)
!346 = !DILocation(line: 213, column: 13, scope: !338)
!347 = !DILocation(line: 214, column: 21, scope: !338)
!348 = !DILocation(line: 214, column: 32, scope: !338)
!349 = !DILocation(line: 215, column: 39, scope: !338)
!350 = !DILocation(line: 215, column: 21, scope: !338)
!351 = !DILocation(line: 215, column: 30, scope: !338)
!352 = !DILocation(line: 215, column: 37, scope: !338)
!353 = !DILocation(line: 216, column: 32, scope: !338)
!354 = !DILocation(line: 216, column: 21, scope: !338)
!355 = !DILocation(line: 216, column: 30, scope: !338)
!356 = !DILocation(line: 217, column: 25, scope: !357)
!357 = distinct !DILexicalBlock(scope: !338, file: !69, line: 217, column: 17)
!358 = !DILocation(line: 217, column: 40, scope: !357)
!359 = !DILocation(line: 217, column: 17, scope: !357)
!360 = !DILocation(line: 217, column: 85, scope: !357)
!361 = !DILocation(line: 217, column: 17, scope: !338)
!362 = !DILocation(line: 219, column: 17, scope: !363)
!363 = distinct !DILexicalBlock(scope: !357, file: !69, line: 218, column: 13)
!364 = !DILocation(line: 223, column: 31, scope: !338)
!365 = !DILocation(line: 223, column: 46, scope: !338)
!366 = !DILocation(line: 223, column: 26, scope: !338)
!367 = !DILocation(line: 223, column: 24, scope: !338)
!368 = !DILocation(line: 224, column: 17, scope: !369)
!369 = distinct !DILexicalBlock(scope: !338, file: !69, line: 224, column: 17)
!370 = !DILocation(line: 224, column: 28, scope: !369)
!371 = !DILocation(line: 224, column: 44, scope: !369)
!372 = !DILocation(line: 224, column: 47, scope: !369)
!373 = !DILocation(line: 224, column: 58, scope: !369)
!374 = !DILocation(line: 224, column: 17, scope: !338)
!375 = !DILocation(line: 226, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !369, file: !69, line: 225, column: 13)
!377 = !DILocation(line: 229, column: 25, scope: !338)
!378 = !DILocation(line: 229, column: 13, scope: !338)
!379 = !DILocation(line: 229, column: 37, scope: !338)
!380 = !DILocation(line: 231, column: 25, scope: !338)
!381 = !DILocation(line: 231, column: 20, scope: !338)
!382 = !DILocation(line: 231, column: 18, scope: !338)
!383 = !DILocation(line: 232, column: 9, scope: !338)
!384 = !DILocation(line: 234, column: 13, scope: !385)
!385 = distinct !DILexicalBlock(scope: !328, file: !69, line: 234, column: 13)
!386 = !DILocation(line: 234, column: 27, scope: !385)
!387 = !DILocation(line: 234, column: 13, scope: !328)
!388 = !DILocation(line: 236, column: 26, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !69, line: 235, column: 9)
!390 = !DILocation(line: 236, column: 13, scope: !389)
!391 = !DILocation(line: 237, column: 9, scope: !389)
!392 = !DILocation(line: 245, column: 12, scope: !324)
!393 = !DILocation(line: 245, column: 5, scope: !324)
!394 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 152, type: !70, scopeLine: 153, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!395 = !DILocalVariable(name: "data", scope: !394, file: !69, line: 154, type: !47)
!396 = !DILocation(line: 154, column: 9, scope: !394)
!397 = !DILocation(line: 156, column: 10, scope: !394)
!398 = !DILocation(line: 157, column: 26, scope: !394)
!399 = !DILocation(line: 157, column: 12, scope: !394)
!400 = !DILocation(line: 157, column: 10, scope: !394)
!401 = !DILocalVariable(name: "i", scope: !402, file: !69, line: 159, type: !47)
!402 = distinct !DILexicalBlock(scope: !394, file: !69, line: 158, column: 5)
!403 = !DILocation(line: 159, column: 13, scope: !402)
!404 = !DILocalVariable(name: "buffer", scope: !402, file: !69, line: 160, type: !46)
!405 = !DILocation(line: 160, column: 15, scope: !402)
!406 = !DILocation(line: 160, column: 31, scope: !402)
!407 = !DILocation(line: 160, column: 24, scope: !402)
!408 = !DILocation(line: 161, column: 13, scope: !409)
!409 = distinct !DILexicalBlock(scope: !402, file: !69, line: 161, column: 13)
!410 = !DILocation(line: 161, column: 20, scope: !409)
!411 = !DILocation(line: 161, column: 13, scope: !402)
!412 = !DILocation(line: 161, column: 30, scope: !413)
!413 = distinct !DILexicalBlock(scope: !409, file: !69, line: 161, column: 29)
!414 = !DILocation(line: 163, column: 16, scope: !415)
!415 = distinct !DILexicalBlock(scope: !402, file: !69, line: 163, column: 9)
!416 = !DILocation(line: 163, column: 14, scope: !415)
!417 = !DILocation(line: 163, column: 21, scope: !418)
!418 = distinct !DILexicalBlock(scope: !415, file: !69, line: 163, column: 9)
!419 = !DILocation(line: 163, column: 23, scope: !418)
!420 = !DILocation(line: 163, column: 9, scope: !415)
!421 = !DILocation(line: 165, column: 13, scope: !422)
!422 = distinct !DILexicalBlock(scope: !418, file: !69, line: 164, column: 9)
!423 = !DILocation(line: 165, column: 20, scope: !422)
!424 = !DILocation(line: 165, column: 23, scope: !422)
!425 = !DILocation(line: 166, column: 9, scope: !422)
!426 = !DILocation(line: 163, column: 30, scope: !418)
!427 = !DILocation(line: 163, column: 9, scope: !418)
!428 = distinct !{!428, !420, !429, !108}
!429 = !DILocation(line: 166, column: 9, scope: !415)
!430 = !DILocation(line: 169, column: 13, scope: !431)
!431 = distinct !DILexicalBlock(scope: !402, file: !69, line: 169, column: 13)
!432 = !DILocation(line: 169, column: 18, scope: !431)
!433 = !DILocation(line: 169, column: 13, scope: !402)
!434 = !DILocation(line: 171, column: 13, scope: !435)
!435 = distinct !DILexicalBlock(scope: !431, file: !69, line: 170, column: 9)
!436 = !DILocation(line: 171, column: 20, scope: !435)
!437 = !DILocation(line: 171, column: 26, scope: !435)
!438 = !DILocation(line: 173, column: 19, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !69, line: 173, column: 13)
!440 = !DILocation(line: 173, column: 17, scope: !439)
!441 = !DILocation(line: 173, column: 24, scope: !442)
!442 = distinct !DILexicalBlock(scope: !439, file: !69, line: 173, column: 13)
!443 = !DILocation(line: 173, column: 26, scope: !442)
!444 = !DILocation(line: 173, column: 13, scope: !439)
!445 = !DILocation(line: 175, column: 30, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !69, line: 174, column: 13)
!447 = !DILocation(line: 175, column: 37, scope: !446)
!448 = !DILocation(line: 175, column: 17, scope: !446)
!449 = !DILocation(line: 176, column: 13, scope: !446)
!450 = !DILocation(line: 173, column: 33, scope: !442)
!451 = !DILocation(line: 173, column: 13, scope: !442)
!452 = distinct !{!452, !444, !453, !108}
!453 = !DILocation(line: 176, column: 13, scope: !439)
!454 = !DILocation(line: 177, column: 9, scope: !435)
!455 = !DILocation(line: 180, column: 13, scope: !456)
!456 = distinct !DILexicalBlock(scope: !431, file: !69, line: 179, column: 9)
!457 = !DILocation(line: 182, column: 14, scope: !402)
!458 = !DILocation(line: 182, column: 9, scope: !402)
!459 = !DILocation(line: 184, column: 1, scope: !394)
!460 = distinct !DISubprogram(name: "goodG2BSource", scope: !69, file: !69, line: 144, type: !140, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !72)
!461 = !DILocalVariable(name: "data", arg: 1, scope: !460, file: !69, line: 144, type: !47)
!462 = !DILocation(line: 144, column: 30, scope: !460)
!463 = !DILocation(line: 148, column: 10, scope: !460)
!464 = !DILocation(line: 149, column: 12, scope: !460)
!465 = !DILocation(line: 149, column: 5, scope: !460)
