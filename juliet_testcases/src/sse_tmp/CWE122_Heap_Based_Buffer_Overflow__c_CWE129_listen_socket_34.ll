; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType = type { i32 }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_bad() #0 !dbg !73 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data33 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType* %myUnion, metadata !80, metadata !DIExpression()), !dbg !86
  store i32 -1, i32* %data, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !88, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !91, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %listenSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %acceptSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  br label %do.body, !dbg !115

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !116
  store i32 %call, i32* %listenSocket, align 4, !dbg !118
  %0 = load i32, i32* %listenSocket, align 4, !dbg !119
  %cmp = icmp eq i32 %0, -1, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !123

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !125
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !126
  store i16 2, i16* %sin_family, align 4, !dbg !127
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !128
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !129
  store i32 0, i32* %s_addr, align 4, !dbg !130
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !131
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !132
  store i16 %call1, i16* %sin_port, align 2, !dbg !133
  %2 = load i32, i32* %listenSocket, align 4, !dbg !134
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !136
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !137
  %cmp3 = icmp eq i32 %call2, -1, !dbg !138
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !139

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !140

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !142
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !144
  %cmp7 = icmp eq i32 %call6, -1, !dbg !145
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !146

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !147

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !149
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !150
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !151
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !152
  %cmp11 = icmp eq i32 %6, -1, !dbg !154
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !155

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !156

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !158
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !160
  %conv = trunc i64 %call14 to i32, !dbg !160
  store i32 %conv, i32* %recvResult, align 4, !dbg !161
  %8 = load i32, i32* %recvResult, align 4, !dbg !162
  %cmp15 = icmp eq i32 %8, -1, !dbg !164
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !165

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !166
  %cmp17 = icmp eq i32 %9, 0, !dbg !167
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !168

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !169

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !171
  %idxprom = sext i32 %10 to i64, !dbg !172
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !172
  store i8 0, i8* %arrayidx, align 1, !dbg !173
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !174
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !175
  store i32 %call22, i32* %data, align 4, !dbg !176
  br label %do.end, !dbg !177

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !178
  %cmp23 = icmp ne i32 %11, -1, !dbg !180
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !181

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !182
  %call26 = call i32 @close(i32 %12), !dbg !184
  br label %if.end27, !dbg !185

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !186
  %cmp28 = icmp ne i32 %13, -1, !dbg !188
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !189

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !190
  %call31 = call i32 @close(i32 %14), !dbg !192
  br label %if.end32, !dbg !193

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !194
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !195
  store i32 %15, i32* %unionFirst, align 4, !dbg !196
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !197, metadata !DIExpression()), !dbg !199
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !200
  %16 = load i32, i32* %unionSecond, align 4, !dbg !200
  store i32 %16, i32* %data33, align 4, !dbg !199
  call void @llvm.dbg.declare(metadata i32* %i, metadata !201, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !204, metadata !DIExpression()), !dbg !205
  %call34 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !206
  %17 = bitcast i8* %call34 to i32*, !dbg !207
  store i32* %17, i32** %buffer, align 8, !dbg !205
  %18 = load i32*, i32** %buffer, align 8, !dbg !208
  %cmp35 = icmp eq i32* %18, null, !dbg !210
  br i1 %cmp35, label %if.then37, label %if.end38, !dbg !211

if.then37:                                        ; preds = %if.end32
  call void @exit(i32 -1) #11, !dbg !212
  unreachable, !dbg !212

if.end38:                                         ; preds = %if.end32
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.inc, %if.end38
  %19 = load i32, i32* %i, align 4, !dbg !217
  %cmp39 = icmp slt i32 %19, 10, !dbg !219
  br i1 %cmp39, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !221
  %21 = load i32, i32* %i, align 4, !dbg !223
  %idxprom41 = sext i32 %21 to i64, !dbg !221
  %arrayidx42 = getelementptr inbounds i32, i32* %20, i64 %idxprom41, !dbg !221
  store i32 0, i32* %arrayidx42, align 4, !dbg !224
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !226
  %inc = add nsw i32 %22, 1, !dbg !226
  store i32 %inc, i32* %i, align 4, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data33, align 4, !dbg !231
  %cmp43 = icmp sge i32 %23, 0, !dbg !233
  br i1 %cmp43, label %if.then45, label %if.else, !dbg !234

if.then45:                                        ; preds = %for.end
  %24 = load i32*, i32** %buffer, align 8, !dbg !235
  %25 = load i32, i32* %data33, align 4, !dbg !237
  %idxprom46 = sext i32 %25 to i64, !dbg !235
  %arrayidx47 = getelementptr inbounds i32, i32* %24, i64 %idxprom46, !dbg !235
  store i32 1, i32* %arrayidx47, align 4, !dbg !238
  store i32 0, i32* %i, align 4, !dbg !239
  br label %for.cond48, !dbg !241

for.cond48:                                       ; preds = %for.inc54, %if.then45
  %26 = load i32, i32* %i, align 4, !dbg !242
  %cmp49 = icmp slt i32 %26, 10, !dbg !244
  br i1 %cmp49, label %for.body51, label %for.end56, !dbg !245

for.body51:                                       ; preds = %for.cond48
  %27 = load i32*, i32** %buffer, align 8, !dbg !246
  %28 = load i32, i32* %i, align 4, !dbg !248
  %idxprom52 = sext i32 %28 to i64, !dbg !246
  %arrayidx53 = getelementptr inbounds i32, i32* %27, i64 %idxprom52, !dbg !246
  %29 = load i32, i32* %arrayidx53, align 4, !dbg !246
  call void @printIntLine(i32 %29), !dbg !249
  br label %for.inc54, !dbg !250

for.inc54:                                        ; preds = %for.body51
  %30 = load i32, i32* %i, align 4, !dbg !251
  %inc55 = add nsw i32 %30, 1, !dbg !251
  store i32 %inc55, i32* %i, align 4, !dbg !251
  br label %for.cond48, !dbg !252, !llvm.loop !253

for.end56:                                        ; preds = %for.cond48
  br label %if.end57, !dbg !255

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !256
  br label %if.end57

if.end57:                                         ; preds = %if.else, %for.end56
  %31 = load i32*, i32** %buffer, align 8, !dbg !258
  %32 = bitcast i32* %31 to i8*, !dbg !258
  call void @free(i8* %32) #8, !dbg !259
  ret void, !dbg !260
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #2

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #2

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #5

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_good() #0 !dbg !261 {
entry:
  call void @goodG2B(), !dbg !262
  call void @goodB2G(), !dbg !263
  ret void, !dbg !264
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !265 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !270, metadata !DIExpression()), !dbg !271
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !272, metadata !DIExpression()), !dbg !273
  %call = call i64 @time(i64* null) #8, !dbg !274
  %conv = trunc i64 %call to i32, !dbg !275
  call void @srand(i32 %conv) #8, !dbg !276
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !277
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_good(), !dbg !278
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !279
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !280
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_bad(), !dbg !281
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !282
  ret i32 0, !dbg !283
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !284 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !285, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType* %myUnion, metadata !287, metadata !DIExpression()), !dbg !288
  store i32 -1, i32* %data, align 4, !dbg !289
  store i32 7, i32* %data, align 4, !dbg !290
  %0 = load i32, i32* %data, align 4, !dbg !291
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !292
  store i32 %0, i32* %unionFirst, align 4, !dbg !293
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !294, metadata !DIExpression()), !dbg !296
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !297
  %1 = load i32, i32* %unionSecond, align 4, !dbg !297
  store i32 %1, i32* %data1, align 4, !dbg !296
  call void @llvm.dbg.declare(metadata i32* %i, metadata !298, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !301, metadata !DIExpression()), !dbg !302
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !303
  %2 = bitcast i8* %call to i32*, !dbg !304
  store i32* %2, i32** %buffer, align 8, !dbg !302
  %3 = load i32*, i32** %buffer, align 8, !dbg !305
  %cmp = icmp eq i32* %3, null, !dbg !307
  br i1 %cmp, label %if.then, label %if.end, !dbg !308

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !309
  unreachable, !dbg !309

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !311
  br label %for.cond, !dbg !313

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !314
  %cmp2 = icmp slt i32 %4, 10, !dbg !316
  br i1 %cmp2, label %for.body, label %for.end, !dbg !317

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !318
  %6 = load i32, i32* %i, align 4, !dbg !320
  %idxprom = sext i32 %6 to i64, !dbg !318
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !318
  store i32 0, i32* %arrayidx, align 4, !dbg !321
  br label %for.inc, !dbg !322

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !323
  %inc = add nsw i32 %7, 1, !dbg !323
  store i32 %inc, i32* %i, align 4, !dbg !323
  br label %for.cond, !dbg !324, !llvm.loop !325

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !327
  %cmp3 = icmp sge i32 %8, 0, !dbg !329
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !330

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !331
  %10 = load i32, i32* %data1, align 4, !dbg !333
  %idxprom5 = sext i32 %10 to i64, !dbg !331
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !331
  store i32 1, i32* %arrayidx6, align 4, !dbg !334
  store i32 0, i32* %i, align 4, !dbg !335
  br label %for.cond7, !dbg !337

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !338
  %cmp8 = icmp slt i32 %11, 10, !dbg !340
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !341

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !342
  %13 = load i32, i32* %i, align 4, !dbg !344
  %idxprom10 = sext i32 %13 to i64, !dbg !342
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !342
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !342
  call void @printIntLine(i32 %14), !dbg !345
  br label %for.inc12, !dbg !346

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !347
  %inc13 = add nsw i32 %15, 1, !dbg !347
  store i32 %inc13, i32* %i, align 4, !dbg !347
  br label %for.cond7, !dbg !348, !llvm.loop !349

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !351

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !352
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !354
  %17 = bitcast i32* %16 to i8*, !dbg !354
  call void @free(i8* %17) #8, !dbg !355
  ret void, !dbg !356
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !357 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data33 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !358, metadata !DIExpression()), !dbg !359
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType* %myUnion, metadata !360, metadata !DIExpression()), !dbg !361
  store i32 -1, i32* %data, align 4, !dbg !362
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !363, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !366, metadata !DIExpression()), !dbg !367
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !368, metadata !DIExpression()), !dbg !369
  store i32 -1, i32* %listenSocket, align 4, !dbg !369
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !370, metadata !DIExpression()), !dbg !371
  store i32 -1, i32* %acceptSocket, align 4, !dbg !371
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !372, metadata !DIExpression()), !dbg !373
  br label %do.body, !dbg !374

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !375
  store i32 %call, i32* %listenSocket, align 4, !dbg !377
  %0 = load i32, i32* %listenSocket, align 4, !dbg !378
  %cmp = icmp eq i32 %0, -1, !dbg !380
  br i1 %cmp, label %if.then, label %if.end, !dbg !381

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !382

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !384
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !384
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !385
  store i16 2, i16* %sin_family, align 4, !dbg !386
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !387
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !388
  store i32 0, i32* %s_addr, align 4, !dbg !389
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !390
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !391
  store i16 %call1, i16* %sin_port, align 2, !dbg !392
  %2 = load i32, i32* %listenSocket, align 4, !dbg !393
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !395
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !396
  %cmp3 = icmp eq i32 %call2, -1, !dbg !397
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !398

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !399

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !401
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !403
  %cmp7 = icmp eq i32 %call6, -1, !dbg !404
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !405

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !406

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !408
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !409
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !410
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !411
  %cmp11 = icmp eq i32 %6, -1, !dbg !413
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !414

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !415

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !417
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !418
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !419
  %conv = trunc i64 %call14 to i32, !dbg !419
  store i32 %conv, i32* %recvResult, align 4, !dbg !420
  %8 = load i32, i32* %recvResult, align 4, !dbg !421
  %cmp15 = icmp eq i32 %8, -1, !dbg !423
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !424

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !425
  %cmp17 = icmp eq i32 %9, 0, !dbg !426
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !427

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !428

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !430
  %idxprom = sext i32 %10 to i64, !dbg !431
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !431
  store i8 0, i8* %arrayidx, align 1, !dbg !432
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !433
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !434
  store i32 %call22, i32* %data, align 4, !dbg !435
  br label %do.end, !dbg !436

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !437
  %cmp23 = icmp ne i32 %11, -1, !dbg !439
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !440

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !441
  %call26 = call i32 @close(i32 %12), !dbg !443
  br label %if.end27, !dbg !444

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !445
  %cmp28 = icmp ne i32 %13, -1, !dbg !447
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !448

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !449
  %call31 = call i32 @close(i32 %14), !dbg !451
  br label %if.end32, !dbg !452

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !453
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !454
  store i32 %15, i32* %unionFirst, align 4, !dbg !455
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !456, metadata !DIExpression()), !dbg !458
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !459
  %16 = load i32, i32* %unionSecond, align 4, !dbg !459
  store i32 %16, i32* %data33, align 4, !dbg !458
  call void @llvm.dbg.declare(metadata i32* %i, metadata !460, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !463, metadata !DIExpression()), !dbg !464
  %call34 = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !465
  %17 = bitcast i8* %call34 to i32*, !dbg !466
  store i32* %17, i32** %buffer, align 8, !dbg !464
  %18 = load i32*, i32** %buffer, align 8, !dbg !467
  %cmp35 = icmp eq i32* %18, null, !dbg !469
  br i1 %cmp35, label %if.then37, label %if.end38, !dbg !470

if.then37:                                        ; preds = %if.end32
  call void @exit(i32 -1) #11, !dbg !471
  unreachable, !dbg !471

if.end38:                                         ; preds = %if.end32
  store i32 0, i32* %i, align 4, !dbg !473
  br label %for.cond, !dbg !475

for.cond:                                         ; preds = %for.inc, %if.end38
  %19 = load i32, i32* %i, align 4, !dbg !476
  %cmp39 = icmp slt i32 %19, 10, !dbg !478
  br i1 %cmp39, label %for.body, label %for.end, !dbg !479

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !480
  %21 = load i32, i32* %i, align 4, !dbg !482
  %idxprom41 = sext i32 %21 to i64, !dbg !480
  %arrayidx42 = getelementptr inbounds i32, i32* %20, i64 %idxprom41, !dbg !480
  store i32 0, i32* %arrayidx42, align 4, !dbg !483
  br label %for.inc, !dbg !484

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !485
  %inc = add nsw i32 %22, 1, !dbg !485
  store i32 %inc, i32* %i, align 4, !dbg !485
  br label %for.cond, !dbg !486, !llvm.loop !487

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data33, align 4, !dbg !489
  %cmp43 = icmp sge i32 %23, 0, !dbg !491
  br i1 %cmp43, label %land.lhs.true, label %if.else, !dbg !492

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data33, align 4, !dbg !493
  %cmp45 = icmp slt i32 %24, 10, !dbg !494
  br i1 %cmp45, label %if.then47, label %if.else, !dbg !495

if.then47:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !496
  %26 = load i32, i32* %data33, align 4, !dbg !498
  %idxprom48 = sext i32 %26 to i64, !dbg !496
  %arrayidx49 = getelementptr inbounds i32, i32* %25, i64 %idxprom48, !dbg !496
  store i32 1, i32* %arrayidx49, align 4, !dbg !499
  store i32 0, i32* %i, align 4, !dbg !500
  br label %for.cond50, !dbg !502

for.cond50:                                       ; preds = %for.inc56, %if.then47
  %27 = load i32, i32* %i, align 4, !dbg !503
  %cmp51 = icmp slt i32 %27, 10, !dbg !505
  br i1 %cmp51, label %for.body53, label %for.end58, !dbg !506

for.body53:                                       ; preds = %for.cond50
  %28 = load i32*, i32** %buffer, align 8, !dbg !507
  %29 = load i32, i32* %i, align 4, !dbg !509
  %idxprom54 = sext i32 %29 to i64, !dbg !507
  %arrayidx55 = getelementptr inbounds i32, i32* %28, i64 %idxprom54, !dbg !507
  %30 = load i32, i32* %arrayidx55, align 4, !dbg !507
  call void @printIntLine(i32 %30), !dbg !510
  br label %for.inc56, !dbg !511

for.inc56:                                        ; preds = %for.body53
  %31 = load i32, i32* %i, align 4, !dbg !512
  %inc57 = add nsw i32 %31, 1, !dbg !512
  store i32 %inc57, i32* %i, align 4, !dbg !512
  br label %for.cond50, !dbg !513, !llvm.loop !514

for.end58:                                        ; preds = %for.cond50
  br label %if.end59, !dbg !516

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !517
  br label %if.end59

if.end59:                                         ; preds = %if.else, %for.end58
  %32 = load i32*, i32** %buffer, align 8, !dbg !519
  %33 = bitcast i32* %32 to i8*, !dbg !519
  call void @free(i8* %33) #8, !dbg !520
  ret void, !dbg !521
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
!llvm.module.flags = !{!67, !68, !69, !70, !71}
!llvm.ident = !{!72}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !51, !64, !66, !5}
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !48, line: 26, baseType: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !50, line: 42, baseType: !5)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !53, line: 178, size: 128, elements: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!54 = !{!55, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !52, file: !53, line: 180, baseType: !56, size: 16)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !57, line: 28, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!58 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !52, file: !53, line: 181, baseType: !60, size: 112, offset: 16)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 112, elements: !62)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !{!63}
!63 = !DISubrange(count: 14)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!67 = !{i32 7, !"Dwarf Version", i32 4}
!68 = !{i32 2, !"Debug Info Version", i32 3}
!69 = !{i32 1, !"wchar_size", i32 4}
!70 = !{i32 7, !"uwtable", i32 1}
!71 = !{i32 7, !"frame-pointer", i32 2}
!72 = !{!"clang version 13.0.0"}
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_bad", scope: !74, file: !74, line: 50, type: !75, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!74 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !73, file: !74, line: 52, type: !65)
!79 = !DILocation(line: 52, column: 9, scope: !73)
!80 = !DILocalVariable(name: "myUnion", scope: !73, file: !74, line: 53, type: !81)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_unionType", file: !74, line: 46, baseType: !82)
!82 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !74, line: 42, size: 32, elements: !83)
!83 = !{!84, !85}
!84 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !82, file: !74, line: 44, baseType: !65, size: 32)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !82, file: !74, line: 45, baseType: !65, size: 32)
!86 = !DILocation(line: 53, column: 76, scope: !73)
!87 = !DILocation(line: 55, column: 10, scope: !73)
!88 = !DILocalVariable(name: "recvResult", scope: !89, file: !74, line: 61, type: !65)
!89 = distinct !DILexicalBlock(scope: !73, file: !74, line: 56, column: 5)
!90 = !DILocation(line: 61, column: 13, scope: !89)
!91 = !DILocalVariable(name: "service", scope: !89, file: !74, line: 62, type: !92)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !93)
!93 = !{!94, !95, !99, !103}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !92, file: !17, line: 240, baseType: !56, size: 16)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !92, file: !17, line: 241, baseType: !96, size: 16, offset: 16)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !92, file: !17, line: 242, baseType: !100, size: 32, offset: 32)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !101)
!101 = !{!102}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !100, file: !17, line: 33, baseType: !46, size: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !92, file: !17, line: 245, baseType: !104, size: 64, offset: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 64, elements: !106)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 62, column: 28, scope: !89)
!109 = !DILocalVariable(name: "listenSocket", scope: !89, file: !74, line: 63, type: !65)
!110 = !DILocation(line: 63, column: 16, scope: !89)
!111 = !DILocalVariable(name: "acceptSocket", scope: !89, file: !74, line: 64, type: !65)
!112 = !DILocation(line: 64, column: 16, scope: !89)
!113 = !DILocalVariable(name: "inputBuffer", scope: !89, file: !74, line: 65, type: !60)
!114 = !DILocation(line: 65, column: 14, scope: !89)
!115 = !DILocation(line: 66, column: 9, scope: !89)
!116 = !DILocation(line: 76, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !89, file: !74, line: 67, column: 9)
!118 = !DILocation(line: 76, column: 26, scope: !117)
!119 = !DILocation(line: 77, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !74, line: 77, column: 17)
!121 = !DILocation(line: 77, column: 30, scope: !120)
!122 = !DILocation(line: 77, column: 17, scope: !117)
!123 = !DILocation(line: 79, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !74, line: 78, column: 13)
!125 = !DILocation(line: 81, column: 13, scope: !117)
!126 = !DILocation(line: 82, column: 21, scope: !117)
!127 = !DILocation(line: 82, column: 32, scope: !117)
!128 = !DILocation(line: 83, column: 21, scope: !117)
!129 = !DILocation(line: 83, column: 30, scope: !117)
!130 = !DILocation(line: 83, column: 37, scope: !117)
!131 = !DILocation(line: 84, column: 32, scope: !117)
!132 = !DILocation(line: 84, column: 21, scope: !117)
!133 = !DILocation(line: 84, column: 30, scope: !117)
!134 = !DILocation(line: 85, column: 22, scope: !135)
!135 = distinct !DILexicalBlock(scope: !117, file: !74, line: 85, column: 17)
!136 = !DILocation(line: 85, column: 36, scope: !135)
!137 = !DILocation(line: 85, column: 17, scope: !135)
!138 = !DILocation(line: 85, column: 81, scope: !135)
!139 = !DILocation(line: 85, column: 17, scope: !117)
!140 = !DILocation(line: 87, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !74, line: 86, column: 13)
!142 = !DILocation(line: 89, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !117, file: !74, line: 89, column: 17)
!144 = !DILocation(line: 89, column: 17, scope: !143)
!145 = !DILocation(line: 89, column: 54, scope: !143)
!146 = !DILocation(line: 89, column: 17, scope: !117)
!147 = !DILocation(line: 91, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !74, line: 90, column: 13)
!149 = !DILocation(line: 93, column: 35, scope: !117)
!150 = !DILocation(line: 93, column: 28, scope: !117)
!151 = !DILocation(line: 93, column: 26, scope: !117)
!152 = !DILocation(line: 94, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !117, file: !74, line: 94, column: 17)
!154 = !DILocation(line: 94, column: 30, scope: !153)
!155 = !DILocation(line: 94, column: 17, scope: !117)
!156 = !DILocation(line: 96, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !74, line: 95, column: 13)
!158 = !DILocation(line: 99, column: 31, scope: !117)
!159 = !DILocation(line: 99, column: 45, scope: !117)
!160 = !DILocation(line: 99, column: 26, scope: !117)
!161 = !DILocation(line: 99, column: 24, scope: !117)
!162 = !DILocation(line: 100, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !117, file: !74, line: 100, column: 17)
!164 = !DILocation(line: 100, column: 28, scope: !163)
!165 = !DILocation(line: 100, column: 44, scope: !163)
!166 = !DILocation(line: 100, column: 47, scope: !163)
!167 = !DILocation(line: 100, column: 58, scope: !163)
!168 = !DILocation(line: 100, column: 17, scope: !117)
!169 = !DILocation(line: 102, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !74, line: 101, column: 13)
!171 = !DILocation(line: 105, column: 25, scope: !117)
!172 = !DILocation(line: 105, column: 13, scope: !117)
!173 = !DILocation(line: 105, column: 37, scope: !117)
!174 = !DILocation(line: 107, column: 25, scope: !117)
!175 = !DILocation(line: 107, column: 20, scope: !117)
!176 = !DILocation(line: 107, column: 18, scope: !117)
!177 = !DILocation(line: 108, column: 9, scope: !117)
!178 = !DILocation(line: 110, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !89, file: !74, line: 110, column: 13)
!180 = !DILocation(line: 110, column: 26, scope: !179)
!181 = !DILocation(line: 110, column: 13, scope: !89)
!182 = !DILocation(line: 112, column: 26, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !74, line: 111, column: 9)
!184 = !DILocation(line: 112, column: 13, scope: !183)
!185 = !DILocation(line: 113, column: 9, scope: !183)
!186 = !DILocation(line: 114, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !89, file: !74, line: 114, column: 13)
!188 = !DILocation(line: 114, column: 26, scope: !187)
!189 = !DILocation(line: 114, column: 13, scope: !89)
!190 = !DILocation(line: 116, column: 26, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !74, line: 115, column: 9)
!192 = !DILocation(line: 116, column: 13, scope: !191)
!193 = !DILocation(line: 117, column: 9, scope: !191)
!194 = !DILocation(line: 125, column: 26, scope: !73)
!195 = !DILocation(line: 125, column: 13, scope: !73)
!196 = !DILocation(line: 125, column: 24, scope: !73)
!197 = !DILocalVariable(name: "data", scope: !198, file: !74, line: 127, type: !65)
!198 = distinct !DILexicalBlock(scope: !73, file: !74, line: 126, column: 5)
!199 = !DILocation(line: 127, column: 13, scope: !198)
!200 = !DILocation(line: 127, column: 28, scope: !198)
!201 = !DILocalVariable(name: "i", scope: !202, file: !74, line: 129, type: !65)
!202 = distinct !DILexicalBlock(scope: !198, file: !74, line: 128, column: 9)
!203 = !DILocation(line: 129, column: 17, scope: !202)
!204 = !DILocalVariable(name: "buffer", scope: !202, file: !74, line: 130, type: !64)
!205 = !DILocation(line: 130, column: 19, scope: !202)
!206 = !DILocation(line: 130, column: 35, scope: !202)
!207 = !DILocation(line: 130, column: 28, scope: !202)
!208 = !DILocation(line: 131, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !202, file: !74, line: 131, column: 17)
!210 = !DILocation(line: 131, column: 24, scope: !209)
!211 = !DILocation(line: 131, column: 17, scope: !202)
!212 = !DILocation(line: 131, column: 34, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !74, line: 131, column: 33)
!214 = !DILocation(line: 133, column: 20, scope: !215)
!215 = distinct !DILexicalBlock(scope: !202, file: !74, line: 133, column: 13)
!216 = !DILocation(line: 133, column: 18, scope: !215)
!217 = !DILocation(line: 133, column: 25, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !74, line: 133, column: 13)
!219 = !DILocation(line: 133, column: 27, scope: !218)
!220 = !DILocation(line: 133, column: 13, scope: !215)
!221 = !DILocation(line: 135, column: 17, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !74, line: 134, column: 13)
!223 = !DILocation(line: 135, column: 24, scope: !222)
!224 = !DILocation(line: 135, column: 27, scope: !222)
!225 = !DILocation(line: 136, column: 13, scope: !222)
!226 = !DILocation(line: 133, column: 34, scope: !218)
!227 = !DILocation(line: 133, column: 13, scope: !218)
!228 = distinct !{!228, !220, !229, !230}
!229 = !DILocation(line: 136, column: 13, scope: !215)
!230 = !{!"llvm.loop.mustprogress"}
!231 = !DILocation(line: 139, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !202, file: !74, line: 139, column: 17)
!233 = !DILocation(line: 139, column: 22, scope: !232)
!234 = !DILocation(line: 139, column: 17, scope: !202)
!235 = !DILocation(line: 141, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !74, line: 140, column: 13)
!237 = !DILocation(line: 141, column: 24, scope: !236)
!238 = !DILocation(line: 141, column: 30, scope: !236)
!239 = !DILocation(line: 143, column: 23, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !74, line: 143, column: 17)
!241 = !DILocation(line: 143, column: 21, scope: !240)
!242 = !DILocation(line: 143, column: 28, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !74, line: 143, column: 17)
!244 = !DILocation(line: 143, column: 30, scope: !243)
!245 = !DILocation(line: 143, column: 17, scope: !240)
!246 = !DILocation(line: 145, column: 34, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !74, line: 144, column: 17)
!248 = !DILocation(line: 145, column: 41, scope: !247)
!249 = !DILocation(line: 145, column: 21, scope: !247)
!250 = !DILocation(line: 146, column: 17, scope: !247)
!251 = !DILocation(line: 143, column: 37, scope: !243)
!252 = !DILocation(line: 143, column: 17, scope: !243)
!253 = distinct !{!253, !245, !254, !230}
!254 = !DILocation(line: 146, column: 17, scope: !240)
!255 = !DILocation(line: 147, column: 13, scope: !236)
!256 = !DILocation(line: 150, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !232, file: !74, line: 149, column: 13)
!258 = !DILocation(line: 152, column: 18, scope: !202)
!259 = !DILocation(line: 152, column: 13, scope: !202)
!260 = !DILocation(line: 155, column: 1, scope: !73)
!261 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_34_good", scope: !74, file: !74, line: 310, type: !75, scopeLine: 311, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!262 = !DILocation(line: 312, column: 5, scope: !261)
!263 = !DILocation(line: 313, column: 5, scope: !261)
!264 = !DILocation(line: 314, column: 1, scope: !261)
!265 = distinct !DISubprogram(name: "main", scope: !74, file: !74, line: 324, type: !266, scopeLine: 325, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !77)
!266 = !DISubroutineType(types: !267)
!267 = !{!65, !65, !268}
!268 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64)
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!270 = !DILocalVariable(name: "argc", arg: 1, scope: !265, file: !74, line: 324, type: !65)
!271 = !DILocation(line: 324, column: 14, scope: !265)
!272 = !DILocalVariable(name: "argv", arg: 2, scope: !265, file: !74, line: 324, type: !268)
!273 = !DILocation(line: 324, column: 27, scope: !265)
!274 = !DILocation(line: 327, column: 22, scope: !265)
!275 = !DILocation(line: 327, column: 12, scope: !265)
!276 = !DILocation(line: 327, column: 5, scope: !265)
!277 = !DILocation(line: 329, column: 5, scope: !265)
!278 = !DILocation(line: 330, column: 5, scope: !265)
!279 = !DILocation(line: 331, column: 5, scope: !265)
!280 = !DILocation(line: 334, column: 5, scope: !265)
!281 = !DILocation(line: 335, column: 5, scope: !265)
!282 = !DILocation(line: 336, column: 5, scope: !265)
!283 = !DILocation(line: 338, column: 5, scope: !265)
!284 = distinct !DISubprogram(name: "goodG2B", scope: !74, file: !74, line: 162, type: !75, scopeLine: 163, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!285 = !DILocalVariable(name: "data", scope: !284, file: !74, line: 164, type: !65)
!286 = !DILocation(line: 164, column: 9, scope: !284)
!287 = !DILocalVariable(name: "myUnion", scope: !284, file: !74, line: 165, type: !81)
!288 = !DILocation(line: 165, column: 76, scope: !284)
!289 = !DILocation(line: 167, column: 10, scope: !284)
!290 = !DILocation(line: 170, column: 10, scope: !284)
!291 = !DILocation(line: 171, column: 26, scope: !284)
!292 = !DILocation(line: 171, column: 13, scope: !284)
!293 = !DILocation(line: 171, column: 24, scope: !284)
!294 = !DILocalVariable(name: "data", scope: !295, file: !74, line: 173, type: !65)
!295 = distinct !DILexicalBlock(scope: !284, file: !74, line: 172, column: 5)
!296 = !DILocation(line: 173, column: 13, scope: !295)
!297 = !DILocation(line: 173, column: 28, scope: !295)
!298 = !DILocalVariable(name: "i", scope: !299, file: !74, line: 175, type: !65)
!299 = distinct !DILexicalBlock(scope: !295, file: !74, line: 174, column: 9)
!300 = !DILocation(line: 175, column: 17, scope: !299)
!301 = !DILocalVariable(name: "buffer", scope: !299, file: !74, line: 176, type: !64)
!302 = !DILocation(line: 176, column: 19, scope: !299)
!303 = !DILocation(line: 176, column: 35, scope: !299)
!304 = !DILocation(line: 176, column: 28, scope: !299)
!305 = !DILocation(line: 177, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !299, file: !74, line: 177, column: 17)
!307 = !DILocation(line: 177, column: 24, scope: !306)
!308 = !DILocation(line: 177, column: 17, scope: !299)
!309 = !DILocation(line: 177, column: 34, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !74, line: 177, column: 33)
!311 = !DILocation(line: 179, column: 20, scope: !312)
!312 = distinct !DILexicalBlock(scope: !299, file: !74, line: 179, column: 13)
!313 = !DILocation(line: 179, column: 18, scope: !312)
!314 = !DILocation(line: 179, column: 25, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !74, line: 179, column: 13)
!316 = !DILocation(line: 179, column: 27, scope: !315)
!317 = !DILocation(line: 179, column: 13, scope: !312)
!318 = !DILocation(line: 181, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !74, line: 180, column: 13)
!320 = !DILocation(line: 181, column: 24, scope: !319)
!321 = !DILocation(line: 181, column: 27, scope: !319)
!322 = !DILocation(line: 182, column: 13, scope: !319)
!323 = !DILocation(line: 179, column: 34, scope: !315)
!324 = !DILocation(line: 179, column: 13, scope: !315)
!325 = distinct !{!325, !317, !326, !230}
!326 = !DILocation(line: 182, column: 13, scope: !312)
!327 = !DILocation(line: 185, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !299, file: !74, line: 185, column: 17)
!329 = !DILocation(line: 185, column: 22, scope: !328)
!330 = !DILocation(line: 185, column: 17, scope: !299)
!331 = !DILocation(line: 187, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !74, line: 186, column: 13)
!333 = !DILocation(line: 187, column: 24, scope: !332)
!334 = !DILocation(line: 187, column: 30, scope: !332)
!335 = !DILocation(line: 189, column: 23, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !74, line: 189, column: 17)
!337 = !DILocation(line: 189, column: 21, scope: !336)
!338 = !DILocation(line: 189, column: 28, scope: !339)
!339 = distinct !DILexicalBlock(scope: !336, file: !74, line: 189, column: 17)
!340 = !DILocation(line: 189, column: 30, scope: !339)
!341 = !DILocation(line: 189, column: 17, scope: !336)
!342 = !DILocation(line: 191, column: 34, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !74, line: 190, column: 17)
!344 = !DILocation(line: 191, column: 41, scope: !343)
!345 = !DILocation(line: 191, column: 21, scope: !343)
!346 = !DILocation(line: 192, column: 17, scope: !343)
!347 = !DILocation(line: 189, column: 37, scope: !339)
!348 = !DILocation(line: 189, column: 17, scope: !339)
!349 = distinct !{!349, !341, !350, !230}
!350 = !DILocation(line: 192, column: 17, scope: !336)
!351 = !DILocation(line: 193, column: 13, scope: !332)
!352 = !DILocation(line: 196, column: 17, scope: !353)
!353 = distinct !DILexicalBlock(scope: !328, file: !74, line: 195, column: 13)
!354 = !DILocation(line: 198, column: 18, scope: !299)
!355 = !DILocation(line: 198, column: 13, scope: !299)
!356 = !DILocation(line: 201, column: 1, scope: !284)
!357 = distinct !DISubprogram(name: "goodB2G", scope: !74, file: !74, line: 204, type: !75, scopeLine: 205, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !77)
!358 = !DILocalVariable(name: "data", scope: !357, file: !74, line: 206, type: !65)
!359 = !DILocation(line: 206, column: 9, scope: !357)
!360 = !DILocalVariable(name: "myUnion", scope: !357, file: !74, line: 207, type: !81)
!361 = !DILocation(line: 207, column: 76, scope: !357)
!362 = !DILocation(line: 209, column: 10, scope: !357)
!363 = !DILocalVariable(name: "recvResult", scope: !364, file: !74, line: 215, type: !65)
!364 = distinct !DILexicalBlock(scope: !357, file: !74, line: 210, column: 5)
!365 = !DILocation(line: 215, column: 13, scope: !364)
!366 = !DILocalVariable(name: "service", scope: !364, file: !74, line: 216, type: !92)
!367 = !DILocation(line: 216, column: 28, scope: !364)
!368 = !DILocalVariable(name: "listenSocket", scope: !364, file: !74, line: 217, type: !65)
!369 = !DILocation(line: 217, column: 16, scope: !364)
!370 = !DILocalVariable(name: "acceptSocket", scope: !364, file: !74, line: 218, type: !65)
!371 = !DILocation(line: 218, column: 16, scope: !364)
!372 = !DILocalVariable(name: "inputBuffer", scope: !364, file: !74, line: 219, type: !60)
!373 = !DILocation(line: 219, column: 14, scope: !364)
!374 = !DILocation(line: 220, column: 9, scope: !364)
!375 = !DILocation(line: 230, column: 28, scope: !376)
!376 = distinct !DILexicalBlock(scope: !364, file: !74, line: 221, column: 9)
!377 = !DILocation(line: 230, column: 26, scope: !376)
!378 = !DILocation(line: 231, column: 17, scope: !379)
!379 = distinct !DILexicalBlock(scope: !376, file: !74, line: 231, column: 17)
!380 = !DILocation(line: 231, column: 30, scope: !379)
!381 = !DILocation(line: 231, column: 17, scope: !376)
!382 = !DILocation(line: 233, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !74, line: 232, column: 13)
!384 = !DILocation(line: 235, column: 13, scope: !376)
!385 = !DILocation(line: 236, column: 21, scope: !376)
!386 = !DILocation(line: 236, column: 32, scope: !376)
!387 = !DILocation(line: 237, column: 21, scope: !376)
!388 = !DILocation(line: 237, column: 30, scope: !376)
!389 = !DILocation(line: 237, column: 37, scope: !376)
!390 = !DILocation(line: 238, column: 32, scope: !376)
!391 = !DILocation(line: 238, column: 21, scope: !376)
!392 = !DILocation(line: 238, column: 30, scope: !376)
!393 = !DILocation(line: 239, column: 22, scope: !394)
!394 = distinct !DILexicalBlock(scope: !376, file: !74, line: 239, column: 17)
!395 = !DILocation(line: 239, column: 36, scope: !394)
!396 = !DILocation(line: 239, column: 17, scope: !394)
!397 = !DILocation(line: 239, column: 81, scope: !394)
!398 = !DILocation(line: 239, column: 17, scope: !376)
!399 = !DILocation(line: 241, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !394, file: !74, line: 240, column: 13)
!401 = !DILocation(line: 243, column: 24, scope: !402)
!402 = distinct !DILexicalBlock(scope: !376, file: !74, line: 243, column: 17)
!403 = !DILocation(line: 243, column: 17, scope: !402)
!404 = !DILocation(line: 243, column: 54, scope: !402)
!405 = !DILocation(line: 243, column: 17, scope: !376)
!406 = !DILocation(line: 245, column: 17, scope: !407)
!407 = distinct !DILexicalBlock(scope: !402, file: !74, line: 244, column: 13)
!408 = !DILocation(line: 247, column: 35, scope: !376)
!409 = !DILocation(line: 247, column: 28, scope: !376)
!410 = !DILocation(line: 247, column: 26, scope: !376)
!411 = !DILocation(line: 248, column: 17, scope: !412)
!412 = distinct !DILexicalBlock(scope: !376, file: !74, line: 248, column: 17)
!413 = !DILocation(line: 248, column: 30, scope: !412)
!414 = !DILocation(line: 248, column: 17, scope: !376)
!415 = !DILocation(line: 250, column: 17, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !74, line: 249, column: 13)
!417 = !DILocation(line: 253, column: 31, scope: !376)
!418 = !DILocation(line: 253, column: 45, scope: !376)
!419 = !DILocation(line: 253, column: 26, scope: !376)
!420 = !DILocation(line: 253, column: 24, scope: !376)
!421 = !DILocation(line: 254, column: 17, scope: !422)
!422 = distinct !DILexicalBlock(scope: !376, file: !74, line: 254, column: 17)
!423 = !DILocation(line: 254, column: 28, scope: !422)
!424 = !DILocation(line: 254, column: 44, scope: !422)
!425 = !DILocation(line: 254, column: 47, scope: !422)
!426 = !DILocation(line: 254, column: 58, scope: !422)
!427 = !DILocation(line: 254, column: 17, scope: !376)
!428 = !DILocation(line: 256, column: 17, scope: !429)
!429 = distinct !DILexicalBlock(scope: !422, file: !74, line: 255, column: 13)
!430 = !DILocation(line: 259, column: 25, scope: !376)
!431 = !DILocation(line: 259, column: 13, scope: !376)
!432 = !DILocation(line: 259, column: 37, scope: !376)
!433 = !DILocation(line: 261, column: 25, scope: !376)
!434 = !DILocation(line: 261, column: 20, scope: !376)
!435 = !DILocation(line: 261, column: 18, scope: !376)
!436 = !DILocation(line: 262, column: 9, scope: !376)
!437 = !DILocation(line: 264, column: 13, scope: !438)
!438 = distinct !DILexicalBlock(scope: !364, file: !74, line: 264, column: 13)
!439 = !DILocation(line: 264, column: 26, scope: !438)
!440 = !DILocation(line: 264, column: 13, scope: !364)
!441 = !DILocation(line: 266, column: 26, scope: !442)
!442 = distinct !DILexicalBlock(scope: !438, file: !74, line: 265, column: 9)
!443 = !DILocation(line: 266, column: 13, scope: !442)
!444 = !DILocation(line: 267, column: 9, scope: !442)
!445 = !DILocation(line: 268, column: 13, scope: !446)
!446 = distinct !DILexicalBlock(scope: !364, file: !74, line: 268, column: 13)
!447 = !DILocation(line: 268, column: 26, scope: !446)
!448 = !DILocation(line: 268, column: 13, scope: !364)
!449 = !DILocation(line: 270, column: 26, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !74, line: 269, column: 9)
!451 = !DILocation(line: 270, column: 13, scope: !450)
!452 = !DILocation(line: 271, column: 9, scope: !450)
!453 = !DILocation(line: 279, column: 26, scope: !357)
!454 = !DILocation(line: 279, column: 13, scope: !357)
!455 = !DILocation(line: 279, column: 24, scope: !357)
!456 = !DILocalVariable(name: "data", scope: !457, file: !74, line: 281, type: !65)
!457 = distinct !DILexicalBlock(scope: !357, file: !74, line: 280, column: 5)
!458 = !DILocation(line: 281, column: 13, scope: !457)
!459 = !DILocation(line: 281, column: 28, scope: !457)
!460 = !DILocalVariable(name: "i", scope: !461, file: !74, line: 283, type: !65)
!461 = distinct !DILexicalBlock(scope: !457, file: !74, line: 282, column: 9)
!462 = !DILocation(line: 283, column: 17, scope: !461)
!463 = !DILocalVariable(name: "buffer", scope: !461, file: !74, line: 284, type: !64)
!464 = !DILocation(line: 284, column: 19, scope: !461)
!465 = !DILocation(line: 284, column: 35, scope: !461)
!466 = !DILocation(line: 284, column: 28, scope: !461)
!467 = !DILocation(line: 285, column: 17, scope: !468)
!468 = distinct !DILexicalBlock(scope: !461, file: !74, line: 285, column: 17)
!469 = !DILocation(line: 285, column: 24, scope: !468)
!470 = !DILocation(line: 285, column: 17, scope: !461)
!471 = !DILocation(line: 285, column: 34, scope: !472)
!472 = distinct !DILexicalBlock(scope: !468, file: !74, line: 285, column: 33)
!473 = !DILocation(line: 287, column: 20, scope: !474)
!474 = distinct !DILexicalBlock(scope: !461, file: !74, line: 287, column: 13)
!475 = !DILocation(line: 287, column: 18, scope: !474)
!476 = !DILocation(line: 287, column: 25, scope: !477)
!477 = distinct !DILexicalBlock(scope: !474, file: !74, line: 287, column: 13)
!478 = !DILocation(line: 287, column: 27, scope: !477)
!479 = !DILocation(line: 287, column: 13, scope: !474)
!480 = !DILocation(line: 289, column: 17, scope: !481)
!481 = distinct !DILexicalBlock(scope: !477, file: !74, line: 288, column: 13)
!482 = !DILocation(line: 289, column: 24, scope: !481)
!483 = !DILocation(line: 289, column: 27, scope: !481)
!484 = !DILocation(line: 290, column: 13, scope: !481)
!485 = !DILocation(line: 287, column: 34, scope: !477)
!486 = !DILocation(line: 287, column: 13, scope: !477)
!487 = distinct !{!487, !479, !488, !230}
!488 = !DILocation(line: 290, column: 13, scope: !474)
!489 = !DILocation(line: 292, column: 17, scope: !490)
!490 = distinct !DILexicalBlock(scope: !461, file: !74, line: 292, column: 17)
!491 = !DILocation(line: 292, column: 22, scope: !490)
!492 = !DILocation(line: 292, column: 27, scope: !490)
!493 = !DILocation(line: 292, column: 30, scope: !490)
!494 = !DILocation(line: 292, column: 35, scope: !490)
!495 = !DILocation(line: 292, column: 17, scope: !461)
!496 = !DILocation(line: 294, column: 17, scope: !497)
!497 = distinct !DILexicalBlock(scope: !490, file: !74, line: 293, column: 13)
!498 = !DILocation(line: 294, column: 24, scope: !497)
!499 = !DILocation(line: 294, column: 30, scope: !497)
!500 = !DILocation(line: 296, column: 23, scope: !501)
!501 = distinct !DILexicalBlock(scope: !497, file: !74, line: 296, column: 17)
!502 = !DILocation(line: 296, column: 21, scope: !501)
!503 = !DILocation(line: 296, column: 28, scope: !504)
!504 = distinct !DILexicalBlock(scope: !501, file: !74, line: 296, column: 17)
!505 = !DILocation(line: 296, column: 30, scope: !504)
!506 = !DILocation(line: 296, column: 17, scope: !501)
!507 = !DILocation(line: 298, column: 34, scope: !508)
!508 = distinct !DILexicalBlock(scope: !504, file: !74, line: 297, column: 17)
!509 = !DILocation(line: 298, column: 41, scope: !508)
!510 = !DILocation(line: 298, column: 21, scope: !508)
!511 = !DILocation(line: 299, column: 17, scope: !508)
!512 = !DILocation(line: 296, column: 37, scope: !504)
!513 = !DILocation(line: 296, column: 17, scope: !504)
!514 = distinct !{!514, !506, !515, !230}
!515 = !DILocation(line: 299, column: 17, scope: !501)
!516 = !DILocation(line: 300, column: 13, scope: !497)
!517 = !DILocation(line: 303, column: 17, scope: !518)
!518 = distinct !DILexicalBlock(scope: !490, file: !74, line: 302, column: 13)
!519 = !DILocation(line: 305, column: 18, scope: !461)
!520 = !DILocation(line: 305, column: 13, scope: !461)
!521 = !DILocation(line: 308, column: 1, scope: !357)
