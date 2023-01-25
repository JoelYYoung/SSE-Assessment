; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_badData = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_goodG2BData = internal global i32 0, align 4, !dbg !70
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_goodB2GData = internal global i32 0, align 4, !dbg !73
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_bad() #0 !dbg !81 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !85, metadata !DIExpression()), !dbg !86
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
  store i32 %15, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_badData, align 4, !dbg !195
  call void @badSink(), !dbg !196
  ret void, !dbg !197
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_good() #0 !dbg !198 {
entry:
  call void @goodG2B(), !dbg !199
  call void @goodB2G(), !dbg !200
  ret void, !dbg !201
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !202 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !207, metadata !DIExpression()), !dbg !208
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !209, metadata !DIExpression()), !dbg !210
  %call = call i64 @time(i64* null) #8, !dbg !211
  %conv = trunc i64 %call to i32, !dbg !212
  call void @srand(i32 %conv) #8, !dbg !213
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !214
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_good(), !dbg !215
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !216
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !217
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_bad(), !dbg !218
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !219
  ret i32 0, !dbg !220
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !221 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !222, metadata !DIExpression()), !dbg !223
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_badData, align 4, !dbg !224
  store i32 %0, i32* %data, align 4, !dbg !223
  call void @llvm.dbg.declare(metadata i32* %i, metadata !225, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !228, metadata !DIExpression()), !dbg !229
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !230
  %1 = bitcast i8* %call to i32*, !dbg !231
  store i32* %1, i32** %buffer, align 8, !dbg !229
  %2 = load i32*, i32** %buffer, align 8, !dbg !232
  %cmp = icmp eq i32* %2, null, !dbg !234
  br i1 %cmp, label %if.then, label %if.end, !dbg !235

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !236
  unreachable, !dbg !236

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond, !dbg !240

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !241
  %cmp1 = icmp slt i32 %3, 10, !dbg !243
  br i1 %cmp1, label %for.body, label %for.end, !dbg !244

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !245
  %5 = load i32, i32* %i, align 4, !dbg !247
  %idxprom = sext i32 %5 to i64, !dbg !245
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !245
  store i32 0, i32* %arrayidx, align 4, !dbg !248
  br label %for.inc, !dbg !249

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !250
  %inc = add nsw i32 %6, 1, !dbg !250
  store i32 %inc, i32* %i, align 4, !dbg !250
  br label %for.cond, !dbg !251, !llvm.loop !252

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !255
  %cmp2 = icmp sge i32 %7, 0, !dbg !257
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !258

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !259
  %9 = load i32, i32* %data, align 4, !dbg !261
  %idxprom4 = sext i32 %9 to i64, !dbg !259
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !259
  store i32 1, i32* %arrayidx5, align 4, !dbg !262
  store i32 0, i32* %i, align 4, !dbg !263
  br label %for.cond6, !dbg !265

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !266
  %cmp7 = icmp slt i32 %10, 10, !dbg !268
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !269

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !270
  %12 = load i32, i32* %i, align 4, !dbg !272
  %idxprom9 = sext i32 %12 to i64, !dbg !270
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !270
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !270
  call void @printIntLine(i32 %13), !dbg !273
  br label %for.inc11, !dbg !274

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !275
  %inc12 = add nsw i32 %14, 1, !dbg !275
  store i32 %inc12, i32* %i, align 4, !dbg !275
  br label %for.cond6, !dbg !276, !llvm.loop !277

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !279

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !280
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !282
  %16 = bitcast i32* %15 to i8*, !dbg !282
  call void @free(i8* %16) #8, !dbg !283
  ret void, !dbg !284
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !285 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !286, metadata !DIExpression()), !dbg !287
  store i32 -1, i32* %data, align 4, !dbg !288
  store i32 7, i32* %data, align 4, !dbg !289
  %0 = load i32, i32* %data, align 4, !dbg !290
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_goodG2BData, align 4, !dbg !291
  call void @goodG2BSink(), !dbg !292
  ret void, !dbg !293
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !294 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !295, metadata !DIExpression()), !dbg !296
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_goodG2BData, align 4, !dbg !297
  store i32 %0, i32* %data, align 4, !dbg !296
  call void @llvm.dbg.declare(metadata i32* %i, metadata !298, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !301, metadata !DIExpression()), !dbg !302
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !303
  %1 = bitcast i8* %call to i32*, !dbg !304
  store i32* %1, i32** %buffer, align 8, !dbg !302
  %2 = load i32*, i32** %buffer, align 8, !dbg !305
  %cmp = icmp eq i32* %2, null, !dbg !307
  br i1 %cmp, label %if.then, label %if.end, !dbg !308

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !309
  unreachable, !dbg !309

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !311
  br label %for.cond, !dbg !313

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !314
  %cmp1 = icmp slt i32 %3, 10, !dbg !316
  br i1 %cmp1, label %for.body, label %for.end, !dbg !317

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !318
  %5 = load i32, i32* %i, align 4, !dbg !320
  %idxprom = sext i32 %5 to i64, !dbg !318
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !318
  store i32 0, i32* %arrayidx, align 4, !dbg !321
  br label %for.inc, !dbg !322

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !323
  %inc = add nsw i32 %6, 1, !dbg !323
  store i32 %inc, i32* %i, align 4, !dbg !323
  br label %for.cond, !dbg !324, !llvm.loop !325

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !327
  %cmp2 = icmp sge i32 %7, 0, !dbg !329
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !330

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !331
  %9 = load i32, i32* %data, align 4, !dbg !333
  %idxprom4 = sext i32 %9 to i64, !dbg !331
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !331
  store i32 1, i32* %arrayidx5, align 4, !dbg !334
  store i32 0, i32* %i, align 4, !dbg !335
  br label %for.cond6, !dbg !337

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !338
  %cmp7 = icmp slt i32 %10, 10, !dbg !340
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !341

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !342
  %12 = load i32, i32* %i, align 4, !dbg !344
  %idxprom9 = sext i32 %12 to i64, !dbg !342
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !342
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !342
  call void @printIntLine(i32 %13), !dbg !345
  br label %for.inc11, !dbg !346

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !347
  %inc12 = add nsw i32 %14, 1, !dbg !347
  store i32 %inc12, i32* %i, align 4, !dbg !347
  br label %for.cond6, !dbg !348, !llvm.loop !349

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !351

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !352
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !354
  %16 = bitcast i32* %15 to i8*, !dbg !354
  call void @free(i8* %16) #8, !dbg !355
  ret void, !dbg !356
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !357 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !358, metadata !DIExpression()), !dbg !359
  store i32 -1, i32* %data, align 4, !dbg !360
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !361, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !364, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !366, metadata !DIExpression()), !dbg !367
  store i32 -1, i32* %listenSocket, align 4, !dbg !367
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !368, metadata !DIExpression()), !dbg !369
  store i32 -1, i32* %acceptSocket, align 4, !dbg !369
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !370, metadata !DIExpression()), !dbg !371
  br label %do.body, !dbg !372

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !373
  store i32 %call, i32* %listenSocket, align 4, !dbg !375
  %0 = load i32, i32* %listenSocket, align 4, !dbg !376
  %cmp = icmp eq i32 %0, -1, !dbg !378
  br i1 %cmp, label %if.then, label %if.end, !dbg !379

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !380

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !382
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !382
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !383
  store i16 2, i16* %sin_family, align 4, !dbg !384
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !385
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !386
  store i32 0, i32* %s_addr, align 4, !dbg !387
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !388
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !389
  store i16 %call1, i16* %sin_port, align 2, !dbg !390
  %2 = load i32, i32* %listenSocket, align 4, !dbg !391
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !393
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #8, !dbg !394
  %cmp3 = icmp eq i32 %call2, -1, !dbg !395
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !396

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !397

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !399
  %call6 = call i32 @listen(i32 %4, i32 5) #8, !dbg !401
  %cmp7 = icmp eq i32 %call6, -1, !dbg !402
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !403

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !404

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !406
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !407
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !408
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !409
  %cmp11 = icmp eq i32 %6, -1, !dbg !411
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !412

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !413

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !415
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !416
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !417
  %conv = trunc i64 %call14 to i32, !dbg !417
  store i32 %conv, i32* %recvResult, align 4, !dbg !418
  %8 = load i32, i32* %recvResult, align 4, !dbg !419
  %cmp15 = icmp eq i32 %8, -1, !dbg !421
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !422

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !423
  %cmp17 = icmp eq i32 %9, 0, !dbg !424
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !425

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !426

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !428
  %idxprom = sext i32 %10 to i64, !dbg !429
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !429
  store i8 0, i8* %arrayidx, align 1, !dbg !430
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !431
  %call22 = call i32 @atoi(i8* %arraydecay21) #10, !dbg !432
  store i32 %call22, i32* %data, align 4, !dbg !433
  br label %do.end, !dbg !434

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !435
  %cmp23 = icmp ne i32 %11, -1, !dbg !437
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !438

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !439
  %call26 = call i32 @close(i32 %12), !dbg !441
  br label %if.end27, !dbg !442

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !443
  %cmp28 = icmp ne i32 %13, -1, !dbg !445
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !446

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !447
  %call31 = call i32 @close(i32 %14), !dbg !449
  br label %if.end32, !dbg !450

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !451
  store i32 %15, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_goodB2GData, align 4, !dbg !452
  call void @goodB2GSink(), !dbg !453
  ret void, !dbg !454
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !455 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !456, metadata !DIExpression()), !dbg !457
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_goodB2GData, align 4, !dbg !458
  store i32 %0, i32* %data, align 4, !dbg !457
  call void @llvm.dbg.declare(metadata i32* %i, metadata !459, metadata !DIExpression()), !dbg !461
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !462, metadata !DIExpression()), !dbg !463
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !464
  %1 = bitcast i8* %call to i32*, !dbg !465
  store i32* %1, i32** %buffer, align 8, !dbg !463
  %2 = load i32*, i32** %buffer, align 8, !dbg !466
  %cmp = icmp eq i32* %2, null, !dbg !468
  br i1 %cmp, label %if.then, label %if.end, !dbg !469

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !470
  unreachable, !dbg !470

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !472
  br label %for.cond, !dbg !474

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !475
  %cmp1 = icmp slt i32 %3, 10, !dbg !477
  br i1 %cmp1, label %for.body, label %for.end, !dbg !478

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !479
  %5 = load i32, i32* %i, align 4, !dbg !481
  %idxprom = sext i32 %5 to i64, !dbg !479
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !479
  store i32 0, i32* %arrayidx, align 4, !dbg !482
  br label %for.inc, !dbg !483

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !484
  %inc = add nsw i32 %6, 1, !dbg !484
  store i32 %inc, i32* %i, align 4, !dbg !484
  br label %for.cond, !dbg !485, !llvm.loop !486

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !488
  %cmp2 = icmp sge i32 %7, 0, !dbg !490
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !491

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !492
  %cmp3 = icmp slt i32 %8, 10, !dbg !493
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !494

if.then4:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !495
  %10 = load i32, i32* %data, align 4, !dbg !497
  %idxprom5 = sext i32 %10 to i64, !dbg !495
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !495
  store i32 1, i32* %arrayidx6, align 4, !dbg !498
  store i32 0, i32* %i, align 4, !dbg !499
  br label %for.cond7, !dbg !501

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !502
  %cmp8 = icmp slt i32 %11, 10, !dbg !504
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !505

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !506
  %13 = load i32, i32* %i, align 4, !dbg !508
  %idxprom10 = sext i32 %13 to i64, !dbg !506
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !506
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !506
  call void @printIntLine(i32 %14), !dbg !509
  br label %for.inc12, !dbg !510

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !511
  %inc13 = add nsw i32 %15, 1, !dbg !511
  store i32 %inc13, i32* %i, align 4, !dbg !511
  br label %for.cond7, !dbg !512, !llvm.loop !513

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !515

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !516
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !518
  %17 = bitcast i32* %16 to i8*, !dbg !518
  call void @free(i8* %17) #8, !dbg !519
  ret void, !dbg !520
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
!llvm.module.flags = !{!75, !76, !77, !78, !79}
!llvm.ident = !{!80}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_badData", scope: !2, file: !72, line: 42, type: !67, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !69, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45.c", directory: "/home/joelyang/SSE-Assessment")
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
!47 = !{!48, !53, !7, !66, !68}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !50, line: 26, baseType: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !52, line: 42, baseType: !7)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !55, line: 178, size: 128, elements: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!56 = !{!57, !61}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !54, file: !55, line: 180, baseType: !58, size: 16)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !59, line: 28, baseType: !60)
!59 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!60 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !54, file: !55, line: 181, baseType: !62, size: 112, offset: 16)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 112, elements: !64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !{!65}
!65 = !DISubrange(count: 14)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!69 = !{!0, !70, !73}
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_goodG2BData", scope: !2, file: !72, line: 43, type: !67, isLocal: true, isDefinition: true)
!72 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45.c", directory: "/home/joelyang/SSE-Assessment")
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_goodB2GData", scope: !2, file: !72, line: 44, type: !67, isLocal: true, isDefinition: true)
!75 = !{i32 7, !"Dwarf Version", i32 4}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{i32 7, !"uwtable", i32 1}
!79 = !{i32 7, !"frame-pointer", i32 2}
!80 = !{!"clang version 13.0.0"}
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_bad", scope: !72, file: !72, line: 79, type: !82, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!82 = !DISubroutineType(types: !83)
!83 = !{null}
!84 = !{}
!85 = !DILocalVariable(name: "data", scope: !81, file: !72, line: 81, type: !67)
!86 = !DILocation(line: 81, column: 9, scope: !81)
!87 = !DILocation(line: 83, column: 10, scope: !81)
!88 = !DILocalVariable(name: "recvResult", scope: !89, file: !72, line: 89, type: !67)
!89 = distinct !DILexicalBlock(scope: !81, file: !72, line: 84, column: 5)
!90 = !DILocation(line: 89, column: 13, scope: !89)
!91 = !DILocalVariable(name: "service", scope: !89, file: !72, line: 90, type: !92)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !93)
!93 = !{!94, !95, !99, !103}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !92, file: !19, line: 240, baseType: !58, size: 16)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !92, file: !19, line: 241, baseType: !96, size: 16, offset: 16)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 40, baseType: !60)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !92, file: !19, line: 242, baseType: !100, size: 32, offset: 32)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !101)
!101 = !{!102}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !100, file: !19, line: 33, baseType: !48, size: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !92, file: !19, line: 245, baseType: !104, size: 64, offset: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 64, elements: !106)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 90, column: 28, scope: !89)
!109 = !DILocalVariable(name: "listenSocket", scope: !89, file: !72, line: 91, type: !67)
!110 = !DILocation(line: 91, column: 16, scope: !89)
!111 = !DILocalVariable(name: "acceptSocket", scope: !89, file: !72, line: 92, type: !67)
!112 = !DILocation(line: 92, column: 16, scope: !89)
!113 = !DILocalVariable(name: "inputBuffer", scope: !89, file: !72, line: 93, type: !62)
!114 = !DILocation(line: 93, column: 14, scope: !89)
!115 = !DILocation(line: 94, column: 9, scope: !89)
!116 = !DILocation(line: 104, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !89, file: !72, line: 95, column: 9)
!118 = !DILocation(line: 104, column: 26, scope: !117)
!119 = !DILocation(line: 105, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !72, line: 105, column: 17)
!121 = !DILocation(line: 105, column: 30, scope: !120)
!122 = !DILocation(line: 105, column: 17, scope: !117)
!123 = !DILocation(line: 107, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !72, line: 106, column: 13)
!125 = !DILocation(line: 109, column: 13, scope: !117)
!126 = !DILocation(line: 110, column: 21, scope: !117)
!127 = !DILocation(line: 110, column: 32, scope: !117)
!128 = !DILocation(line: 111, column: 21, scope: !117)
!129 = !DILocation(line: 111, column: 30, scope: !117)
!130 = !DILocation(line: 111, column: 37, scope: !117)
!131 = !DILocation(line: 112, column: 32, scope: !117)
!132 = !DILocation(line: 112, column: 21, scope: !117)
!133 = !DILocation(line: 112, column: 30, scope: !117)
!134 = !DILocation(line: 113, column: 22, scope: !135)
!135 = distinct !DILexicalBlock(scope: !117, file: !72, line: 113, column: 17)
!136 = !DILocation(line: 113, column: 36, scope: !135)
!137 = !DILocation(line: 113, column: 17, scope: !135)
!138 = !DILocation(line: 113, column: 81, scope: !135)
!139 = !DILocation(line: 113, column: 17, scope: !117)
!140 = !DILocation(line: 115, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !72, line: 114, column: 13)
!142 = !DILocation(line: 117, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !117, file: !72, line: 117, column: 17)
!144 = !DILocation(line: 117, column: 17, scope: !143)
!145 = !DILocation(line: 117, column: 54, scope: !143)
!146 = !DILocation(line: 117, column: 17, scope: !117)
!147 = !DILocation(line: 119, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !72, line: 118, column: 13)
!149 = !DILocation(line: 121, column: 35, scope: !117)
!150 = !DILocation(line: 121, column: 28, scope: !117)
!151 = !DILocation(line: 121, column: 26, scope: !117)
!152 = !DILocation(line: 122, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !117, file: !72, line: 122, column: 17)
!154 = !DILocation(line: 122, column: 30, scope: !153)
!155 = !DILocation(line: 122, column: 17, scope: !117)
!156 = !DILocation(line: 124, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !72, line: 123, column: 13)
!158 = !DILocation(line: 127, column: 31, scope: !117)
!159 = !DILocation(line: 127, column: 45, scope: !117)
!160 = !DILocation(line: 127, column: 26, scope: !117)
!161 = !DILocation(line: 127, column: 24, scope: !117)
!162 = !DILocation(line: 128, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !117, file: !72, line: 128, column: 17)
!164 = !DILocation(line: 128, column: 28, scope: !163)
!165 = !DILocation(line: 128, column: 44, scope: !163)
!166 = !DILocation(line: 128, column: 47, scope: !163)
!167 = !DILocation(line: 128, column: 58, scope: !163)
!168 = !DILocation(line: 128, column: 17, scope: !117)
!169 = !DILocation(line: 130, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !72, line: 129, column: 13)
!171 = !DILocation(line: 133, column: 25, scope: !117)
!172 = !DILocation(line: 133, column: 13, scope: !117)
!173 = !DILocation(line: 133, column: 37, scope: !117)
!174 = !DILocation(line: 135, column: 25, scope: !117)
!175 = !DILocation(line: 135, column: 20, scope: !117)
!176 = !DILocation(line: 135, column: 18, scope: !117)
!177 = !DILocation(line: 136, column: 9, scope: !117)
!178 = !DILocation(line: 138, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !89, file: !72, line: 138, column: 13)
!180 = !DILocation(line: 138, column: 26, scope: !179)
!181 = !DILocation(line: 138, column: 13, scope: !89)
!182 = !DILocation(line: 140, column: 26, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !72, line: 139, column: 9)
!184 = !DILocation(line: 140, column: 13, scope: !183)
!185 = !DILocation(line: 141, column: 9, scope: !183)
!186 = !DILocation(line: 142, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !89, file: !72, line: 142, column: 13)
!188 = !DILocation(line: 142, column: 26, scope: !187)
!189 = !DILocation(line: 142, column: 13, scope: !89)
!190 = !DILocation(line: 144, column: 26, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !72, line: 143, column: 9)
!192 = !DILocation(line: 144, column: 13, scope: !191)
!193 = !DILocation(line: 145, column: 9, scope: !191)
!194 = !DILocation(line: 153, column: 76, scope: !81)
!195 = !DILocation(line: 153, column: 74, scope: !81)
!196 = !DILocation(line: 154, column: 5, scope: !81)
!197 = !DILocation(line: 155, column: 1, scope: !81)
!198 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_45_good", scope: !72, file: !72, line: 314, type: !82, scopeLine: 315, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!199 = !DILocation(line: 316, column: 5, scope: !198)
!200 = !DILocation(line: 317, column: 5, scope: !198)
!201 = !DILocation(line: 318, column: 1, scope: !198)
!202 = distinct !DISubprogram(name: "main", scope: !72, file: !72, line: 328, type: !203, scopeLine: 329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!203 = !DISubroutineType(types: !204)
!204 = !{!67, !67, !205}
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64)
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!207 = !DILocalVariable(name: "argc", arg: 1, scope: !202, file: !72, line: 328, type: !67)
!208 = !DILocation(line: 328, column: 14, scope: !202)
!209 = !DILocalVariable(name: "argv", arg: 2, scope: !202, file: !72, line: 328, type: !205)
!210 = !DILocation(line: 328, column: 27, scope: !202)
!211 = !DILocation(line: 331, column: 22, scope: !202)
!212 = !DILocation(line: 331, column: 12, scope: !202)
!213 = !DILocation(line: 331, column: 5, scope: !202)
!214 = !DILocation(line: 333, column: 5, scope: !202)
!215 = !DILocation(line: 334, column: 5, scope: !202)
!216 = !DILocation(line: 335, column: 5, scope: !202)
!217 = !DILocation(line: 338, column: 5, scope: !202)
!218 = !DILocation(line: 339, column: 5, scope: !202)
!219 = !DILocation(line: 340, column: 5, scope: !202)
!220 = !DILocation(line: 342, column: 5, scope: !202)
!221 = distinct !DISubprogram(name: "badSink", scope: !72, file: !72, line: 48, type: !82, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!222 = !DILocalVariable(name: "data", scope: !221, file: !72, line: 50, type: !67)
!223 = !DILocation(line: 50, column: 9, scope: !221)
!224 = !DILocation(line: 50, column: 16, scope: !221)
!225 = !DILocalVariable(name: "i", scope: !226, file: !72, line: 52, type: !67)
!226 = distinct !DILexicalBlock(scope: !221, file: !72, line: 51, column: 5)
!227 = !DILocation(line: 52, column: 13, scope: !226)
!228 = !DILocalVariable(name: "buffer", scope: !226, file: !72, line: 53, type: !66)
!229 = !DILocation(line: 53, column: 15, scope: !226)
!230 = !DILocation(line: 53, column: 31, scope: !226)
!231 = !DILocation(line: 53, column: 24, scope: !226)
!232 = !DILocation(line: 54, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !226, file: !72, line: 54, column: 13)
!234 = !DILocation(line: 54, column: 20, scope: !233)
!235 = !DILocation(line: 54, column: 13, scope: !226)
!236 = !DILocation(line: 54, column: 30, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !72, line: 54, column: 29)
!238 = !DILocation(line: 56, column: 16, scope: !239)
!239 = distinct !DILexicalBlock(scope: !226, file: !72, line: 56, column: 9)
!240 = !DILocation(line: 56, column: 14, scope: !239)
!241 = !DILocation(line: 56, column: 21, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !72, line: 56, column: 9)
!243 = !DILocation(line: 56, column: 23, scope: !242)
!244 = !DILocation(line: 56, column: 9, scope: !239)
!245 = !DILocation(line: 58, column: 13, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !72, line: 57, column: 9)
!247 = !DILocation(line: 58, column: 20, scope: !246)
!248 = !DILocation(line: 58, column: 23, scope: !246)
!249 = !DILocation(line: 59, column: 9, scope: !246)
!250 = !DILocation(line: 56, column: 30, scope: !242)
!251 = !DILocation(line: 56, column: 9, scope: !242)
!252 = distinct !{!252, !244, !253, !254}
!253 = !DILocation(line: 59, column: 9, scope: !239)
!254 = !{!"llvm.loop.mustprogress"}
!255 = !DILocation(line: 62, column: 13, scope: !256)
!256 = distinct !DILexicalBlock(scope: !226, file: !72, line: 62, column: 13)
!257 = !DILocation(line: 62, column: 18, scope: !256)
!258 = !DILocation(line: 62, column: 13, scope: !226)
!259 = !DILocation(line: 64, column: 13, scope: !260)
!260 = distinct !DILexicalBlock(scope: !256, file: !72, line: 63, column: 9)
!261 = !DILocation(line: 64, column: 20, scope: !260)
!262 = !DILocation(line: 64, column: 26, scope: !260)
!263 = !DILocation(line: 66, column: 19, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !72, line: 66, column: 13)
!265 = !DILocation(line: 66, column: 17, scope: !264)
!266 = !DILocation(line: 66, column: 24, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !72, line: 66, column: 13)
!268 = !DILocation(line: 66, column: 26, scope: !267)
!269 = !DILocation(line: 66, column: 13, scope: !264)
!270 = !DILocation(line: 68, column: 30, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !72, line: 67, column: 13)
!272 = !DILocation(line: 68, column: 37, scope: !271)
!273 = !DILocation(line: 68, column: 17, scope: !271)
!274 = !DILocation(line: 69, column: 13, scope: !271)
!275 = !DILocation(line: 66, column: 33, scope: !267)
!276 = !DILocation(line: 66, column: 13, scope: !267)
!277 = distinct !{!277, !269, !278, !254}
!278 = !DILocation(line: 69, column: 13, scope: !264)
!279 = !DILocation(line: 70, column: 9, scope: !260)
!280 = !DILocation(line: 73, column: 13, scope: !281)
!281 = distinct !DILexicalBlock(scope: !256, file: !72, line: 72, column: 9)
!282 = !DILocation(line: 75, column: 14, scope: !226)
!283 = !DILocation(line: 75, column: 9, scope: !226)
!284 = !DILocation(line: 77, column: 1, scope: !221)
!285 = distinct !DISubprogram(name: "goodG2B", scope: !72, file: !72, line: 193, type: !82, scopeLine: 194, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!286 = !DILocalVariable(name: "data", scope: !285, file: !72, line: 195, type: !67)
!287 = !DILocation(line: 195, column: 9, scope: !285)
!288 = !DILocation(line: 197, column: 10, scope: !285)
!289 = !DILocation(line: 200, column: 10, scope: !285)
!290 = !DILocation(line: 201, column: 80, scope: !285)
!291 = !DILocation(line: 201, column: 78, scope: !285)
!292 = !DILocation(line: 202, column: 5, scope: !285)
!293 = !DILocation(line: 203, column: 1, scope: !285)
!294 = distinct !DISubprogram(name: "goodG2BSink", scope: !72, file: !72, line: 162, type: !82, scopeLine: 163, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!295 = !DILocalVariable(name: "data", scope: !294, file: !72, line: 164, type: !67)
!296 = !DILocation(line: 164, column: 9, scope: !294)
!297 = !DILocation(line: 164, column: 16, scope: !294)
!298 = !DILocalVariable(name: "i", scope: !299, file: !72, line: 166, type: !67)
!299 = distinct !DILexicalBlock(scope: !294, file: !72, line: 165, column: 5)
!300 = !DILocation(line: 166, column: 13, scope: !299)
!301 = !DILocalVariable(name: "buffer", scope: !299, file: !72, line: 167, type: !66)
!302 = !DILocation(line: 167, column: 15, scope: !299)
!303 = !DILocation(line: 167, column: 31, scope: !299)
!304 = !DILocation(line: 167, column: 24, scope: !299)
!305 = !DILocation(line: 168, column: 13, scope: !306)
!306 = distinct !DILexicalBlock(scope: !299, file: !72, line: 168, column: 13)
!307 = !DILocation(line: 168, column: 20, scope: !306)
!308 = !DILocation(line: 168, column: 13, scope: !299)
!309 = !DILocation(line: 168, column: 30, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !72, line: 168, column: 29)
!311 = !DILocation(line: 170, column: 16, scope: !312)
!312 = distinct !DILexicalBlock(scope: !299, file: !72, line: 170, column: 9)
!313 = !DILocation(line: 170, column: 14, scope: !312)
!314 = !DILocation(line: 170, column: 21, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !72, line: 170, column: 9)
!316 = !DILocation(line: 170, column: 23, scope: !315)
!317 = !DILocation(line: 170, column: 9, scope: !312)
!318 = !DILocation(line: 172, column: 13, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !72, line: 171, column: 9)
!320 = !DILocation(line: 172, column: 20, scope: !319)
!321 = !DILocation(line: 172, column: 23, scope: !319)
!322 = !DILocation(line: 173, column: 9, scope: !319)
!323 = !DILocation(line: 170, column: 30, scope: !315)
!324 = !DILocation(line: 170, column: 9, scope: !315)
!325 = distinct !{!325, !317, !326, !254}
!326 = !DILocation(line: 173, column: 9, scope: !312)
!327 = !DILocation(line: 176, column: 13, scope: !328)
!328 = distinct !DILexicalBlock(scope: !299, file: !72, line: 176, column: 13)
!329 = !DILocation(line: 176, column: 18, scope: !328)
!330 = !DILocation(line: 176, column: 13, scope: !299)
!331 = !DILocation(line: 178, column: 13, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !72, line: 177, column: 9)
!333 = !DILocation(line: 178, column: 20, scope: !332)
!334 = !DILocation(line: 178, column: 26, scope: !332)
!335 = !DILocation(line: 180, column: 19, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !72, line: 180, column: 13)
!337 = !DILocation(line: 180, column: 17, scope: !336)
!338 = !DILocation(line: 180, column: 24, scope: !339)
!339 = distinct !DILexicalBlock(scope: !336, file: !72, line: 180, column: 13)
!340 = !DILocation(line: 180, column: 26, scope: !339)
!341 = !DILocation(line: 180, column: 13, scope: !336)
!342 = !DILocation(line: 182, column: 30, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !72, line: 181, column: 13)
!344 = !DILocation(line: 182, column: 37, scope: !343)
!345 = !DILocation(line: 182, column: 17, scope: !343)
!346 = !DILocation(line: 183, column: 13, scope: !343)
!347 = !DILocation(line: 180, column: 33, scope: !339)
!348 = !DILocation(line: 180, column: 13, scope: !339)
!349 = distinct !{!349, !341, !350, !254}
!350 = !DILocation(line: 183, column: 13, scope: !336)
!351 = !DILocation(line: 184, column: 9, scope: !332)
!352 = !DILocation(line: 187, column: 13, scope: !353)
!353 = distinct !DILexicalBlock(scope: !328, file: !72, line: 186, column: 9)
!354 = !DILocation(line: 189, column: 14, scope: !299)
!355 = !DILocation(line: 189, column: 9, scope: !299)
!356 = !DILocation(line: 191, column: 1, scope: !294)
!357 = distinct !DISubprogram(name: "goodB2G", scope: !72, file: !72, line: 236, type: !82, scopeLine: 237, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!358 = !DILocalVariable(name: "data", scope: !357, file: !72, line: 238, type: !67)
!359 = !DILocation(line: 238, column: 9, scope: !357)
!360 = !DILocation(line: 240, column: 10, scope: !357)
!361 = !DILocalVariable(name: "recvResult", scope: !362, file: !72, line: 246, type: !67)
!362 = distinct !DILexicalBlock(scope: !357, file: !72, line: 241, column: 5)
!363 = !DILocation(line: 246, column: 13, scope: !362)
!364 = !DILocalVariable(name: "service", scope: !362, file: !72, line: 247, type: !92)
!365 = !DILocation(line: 247, column: 28, scope: !362)
!366 = !DILocalVariable(name: "listenSocket", scope: !362, file: !72, line: 248, type: !67)
!367 = !DILocation(line: 248, column: 16, scope: !362)
!368 = !DILocalVariable(name: "acceptSocket", scope: !362, file: !72, line: 249, type: !67)
!369 = !DILocation(line: 249, column: 16, scope: !362)
!370 = !DILocalVariable(name: "inputBuffer", scope: !362, file: !72, line: 250, type: !62)
!371 = !DILocation(line: 250, column: 14, scope: !362)
!372 = !DILocation(line: 251, column: 9, scope: !362)
!373 = !DILocation(line: 261, column: 28, scope: !374)
!374 = distinct !DILexicalBlock(scope: !362, file: !72, line: 252, column: 9)
!375 = !DILocation(line: 261, column: 26, scope: !374)
!376 = !DILocation(line: 262, column: 17, scope: !377)
!377 = distinct !DILexicalBlock(scope: !374, file: !72, line: 262, column: 17)
!378 = !DILocation(line: 262, column: 30, scope: !377)
!379 = !DILocation(line: 262, column: 17, scope: !374)
!380 = !DILocation(line: 264, column: 17, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !72, line: 263, column: 13)
!382 = !DILocation(line: 266, column: 13, scope: !374)
!383 = !DILocation(line: 267, column: 21, scope: !374)
!384 = !DILocation(line: 267, column: 32, scope: !374)
!385 = !DILocation(line: 268, column: 21, scope: !374)
!386 = !DILocation(line: 268, column: 30, scope: !374)
!387 = !DILocation(line: 268, column: 37, scope: !374)
!388 = !DILocation(line: 269, column: 32, scope: !374)
!389 = !DILocation(line: 269, column: 21, scope: !374)
!390 = !DILocation(line: 269, column: 30, scope: !374)
!391 = !DILocation(line: 270, column: 22, scope: !392)
!392 = distinct !DILexicalBlock(scope: !374, file: !72, line: 270, column: 17)
!393 = !DILocation(line: 270, column: 36, scope: !392)
!394 = !DILocation(line: 270, column: 17, scope: !392)
!395 = !DILocation(line: 270, column: 81, scope: !392)
!396 = !DILocation(line: 270, column: 17, scope: !374)
!397 = !DILocation(line: 272, column: 17, scope: !398)
!398 = distinct !DILexicalBlock(scope: !392, file: !72, line: 271, column: 13)
!399 = !DILocation(line: 274, column: 24, scope: !400)
!400 = distinct !DILexicalBlock(scope: !374, file: !72, line: 274, column: 17)
!401 = !DILocation(line: 274, column: 17, scope: !400)
!402 = !DILocation(line: 274, column: 54, scope: !400)
!403 = !DILocation(line: 274, column: 17, scope: !374)
!404 = !DILocation(line: 276, column: 17, scope: !405)
!405 = distinct !DILexicalBlock(scope: !400, file: !72, line: 275, column: 13)
!406 = !DILocation(line: 278, column: 35, scope: !374)
!407 = !DILocation(line: 278, column: 28, scope: !374)
!408 = !DILocation(line: 278, column: 26, scope: !374)
!409 = !DILocation(line: 279, column: 17, scope: !410)
!410 = distinct !DILexicalBlock(scope: !374, file: !72, line: 279, column: 17)
!411 = !DILocation(line: 279, column: 30, scope: !410)
!412 = !DILocation(line: 279, column: 17, scope: !374)
!413 = !DILocation(line: 281, column: 17, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !72, line: 280, column: 13)
!415 = !DILocation(line: 284, column: 31, scope: !374)
!416 = !DILocation(line: 284, column: 45, scope: !374)
!417 = !DILocation(line: 284, column: 26, scope: !374)
!418 = !DILocation(line: 284, column: 24, scope: !374)
!419 = !DILocation(line: 285, column: 17, scope: !420)
!420 = distinct !DILexicalBlock(scope: !374, file: !72, line: 285, column: 17)
!421 = !DILocation(line: 285, column: 28, scope: !420)
!422 = !DILocation(line: 285, column: 44, scope: !420)
!423 = !DILocation(line: 285, column: 47, scope: !420)
!424 = !DILocation(line: 285, column: 58, scope: !420)
!425 = !DILocation(line: 285, column: 17, scope: !374)
!426 = !DILocation(line: 287, column: 17, scope: !427)
!427 = distinct !DILexicalBlock(scope: !420, file: !72, line: 286, column: 13)
!428 = !DILocation(line: 290, column: 25, scope: !374)
!429 = !DILocation(line: 290, column: 13, scope: !374)
!430 = !DILocation(line: 290, column: 37, scope: !374)
!431 = !DILocation(line: 292, column: 25, scope: !374)
!432 = !DILocation(line: 292, column: 20, scope: !374)
!433 = !DILocation(line: 292, column: 18, scope: !374)
!434 = !DILocation(line: 293, column: 9, scope: !374)
!435 = !DILocation(line: 295, column: 13, scope: !436)
!436 = distinct !DILexicalBlock(scope: !362, file: !72, line: 295, column: 13)
!437 = !DILocation(line: 295, column: 26, scope: !436)
!438 = !DILocation(line: 295, column: 13, scope: !362)
!439 = !DILocation(line: 297, column: 26, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !72, line: 296, column: 9)
!441 = !DILocation(line: 297, column: 13, scope: !440)
!442 = !DILocation(line: 298, column: 9, scope: !440)
!443 = !DILocation(line: 299, column: 13, scope: !444)
!444 = distinct !DILexicalBlock(scope: !362, file: !72, line: 299, column: 13)
!445 = !DILocation(line: 299, column: 26, scope: !444)
!446 = !DILocation(line: 299, column: 13, scope: !362)
!447 = !DILocation(line: 301, column: 26, scope: !448)
!448 = distinct !DILexicalBlock(scope: !444, file: !72, line: 300, column: 9)
!449 = !DILocation(line: 301, column: 13, scope: !448)
!450 = !DILocation(line: 302, column: 9, scope: !448)
!451 = !DILocation(line: 310, column: 80, scope: !357)
!452 = !DILocation(line: 310, column: 78, scope: !357)
!453 = !DILocation(line: 311, column: 5, scope: !357)
!454 = !DILocation(line: 312, column: 1, scope: !357)
!455 = distinct !DISubprogram(name: "goodB2GSink", scope: !72, file: !72, line: 206, type: !82, scopeLine: 207, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!456 = !DILocalVariable(name: "data", scope: !455, file: !72, line: 208, type: !67)
!457 = !DILocation(line: 208, column: 9, scope: !455)
!458 = !DILocation(line: 208, column: 16, scope: !455)
!459 = !DILocalVariable(name: "i", scope: !460, file: !72, line: 210, type: !67)
!460 = distinct !DILexicalBlock(scope: !455, file: !72, line: 209, column: 5)
!461 = !DILocation(line: 210, column: 13, scope: !460)
!462 = !DILocalVariable(name: "buffer", scope: !460, file: !72, line: 211, type: !66)
!463 = !DILocation(line: 211, column: 15, scope: !460)
!464 = !DILocation(line: 211, column: 31, scope: !460)
!465 = !DILocation(line: 211, column: 24, scope: !460)
!466 = !DILocation(line: 212, column: 13, scope: !467)
!467 = distinct !DILexicalBlock(scope: !460, file: !72, line: 212, column: 13)
!468 = !DILocation(line: 212, column: 20, scope: !467)
!469 = !DILocation(line: 212, column: 13, scope: !460)
!470 = !DILocation(line: 212, column: 30, scope: !471)
!471 = distinct !DILexicalBlock(scope: !467, file: !72, line: 212, column: 29)
!472 = !DILocation(line: 214, column: 16, scope: !473)
!473 = distinct !DILexicalBlock(scope: !460, file: !72, line: 214, column: 9)
!474 = !DILocation(line: 214, column: 14, scope: !473)
!475 = !DILocation(line: 214, column: 21, scope: !476)
!476 = distinct !DILexicalBlock(scope: !473, file: !72, line: 214, column: 9)
!477 = !DILocation(line: 214, column: 23, scope: !476)
!478 = !DILocation(line: 214, column: 9, scope: !473)
!479 = !DILocation(line: 216, column: 13, scope: !480)
!480 = distinct !DILexicalBlock(scope: !476, file: !72, line: 215, column: 9)
!481 = !DILocation(line: 216, column: 20, scope: !480)
!482 = !DILocation(line: 216, column: 23, scope: !480)
!483 = !DILocation(line: 217, column: 9, scope: !480)
!484 = !DILocation(line: 214, column: 30, scope: !476)
!485 = !DILocation(line: 214, column: 9, scope: !476)
!486 = distinct !{!486, !478, !487, !254}
!487 = !DILocation(line: 217, column: 9, scope: !473)
!488 = !DILocation(line: 219, column: 13, scope: !489)
!489 = distinct !DILexicalBlock(scope: !460, file: !72, line: 219, column: 13)
!490 = !DILocation(line: 219, column: 18, scope: !489)
!491 = !DILocation(line: 219, column: 23, scope: !489)
!492 = !DILocation(line: 219, column: 26, scope: !489)
!493 = !DILocation(line: 219, column: 31, scope: !489)
!494 = !DILocation(line: 219, column: 13, scope: !460)
!495 = !DILocation(line: 221, column: 13, scope: !496)
!496 = distinct !DILexicalBlock(scope: !489, file: !72, line: 220, column: 9)
!497 = !DILocation(line: 221, column: 20, scope: !496)
!498 = !DILocation(line: 221, column: 26, scope: !496)
!499 = !DILocation(line: 223, column: 19, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !72, line: 223, column: 13)
!501 = !DILocation(line: 223, column: 17, scope: !500)
!502 = !DILocation(line: 223, column: 24, scope: !503)
!503 = distinct !DILexicalBlock(scope: !500, file: !72, line: 223, column: 13)
!504 = !DILocation(line: 223, column: 26, scope: !503)
!505 = !DILocation(line: 223, column: 13, scope: !500)
!506 = !DILocation(line: 225, column: 30, scope: !507)
!507 = distinct !DILexicalBlock(scope: !503, file: !72, line: 224, column: 13)
!508 = !DILocation(line: 225, column: 37, scope: !507)
!509 = !DILocation(line: 225, column: 17, scope: !507)
!510 = !DILocation(line: 226, column: 13, scope: !507)
!511 = !DILocation(line: 223, column: 33, scope: !503)
!512 = !DILocation(line: 223, column: 13, scope: !503)
!513 = distinct !{!513, !505, !514, !254}
!514 = !DILocation(line: 226, column: 13, scope: !500)
!515 = !DILocation(line: 227, column: 9, scope: !496)
!516 = !DILocation(line: 230, column: 13, scope: !517)
!517 = distinct !DILexicalBlock(scope: !489, file: !72, line: 229, column: 9)
!518 = !DILocation(line: 232, column: 14, scope: !460)
!519 = !DILocation(line: 232, column: 9, scope: !460)
!520 = !DILocation(line: 234, column: 1, scope: !455)
