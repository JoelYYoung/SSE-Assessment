; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_badData = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodG2BData = internal global i32 0, align 4, !dbg !65
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodB2GData = internal global i32 0, align 4, !dbg !68
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_bad() #0 !dbg !76 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 -1, i32* %data, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !83, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !86, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %connectSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  br label %do.body, !dbg !113

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !114
  store i32 %call, i32* %connectSocket, align 4, !dbg !116
  %0 = load i32, i32* %connectSocket, align 4, !dbg !117
  %cmp = icmp eq i32 %0, -1, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !121

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !123
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !124
  store i16 2, i16* %sin_family, align 4, !dbg !125
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !126
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !127
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !128
  store i32 %call1, i32* %s_addr, align 4, !dbg !129
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !130
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !131
  store i16 %call2, i16* %sin_port, align 2, !dbg !132
  %2 = load i32, i32* %connectSocket, align 4, !dbg !133
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !135
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !136
  %cmp4 = icmp eq i32 %call3, -1, !dbg !137
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !138

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !139

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !141
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !142
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !143
  %conv = trunc i64 %call7 to i32, !dbg !143
  store i32 %conv, i32* %recvResult, align 4, !dbg !144
  %5 = load i32, i32* %recvResult, align 4, !dbg !145
  %cmp8 = icmp eq i32 %5, -1, !dbg !147
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !148

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !149
  %cmp10 = icmp eq i32 %6, 0, !dbg !150
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !151

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !152

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !154
  %idxprom = sext i32 %7 to i64, !dbg !155
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !155
  store i8 0, i8* %arrayidx, align 1, !dbg !156
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !157
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !158
  store i32 %call15, i32* %data, align 4, !dbg !159
  br label %do.end, !dbg !160

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !161
  %cmp16 = icmp ne i32 %8, -1, !dbg !163
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !164

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !165
  %call19 = call i32 @close(i32 %9), !dbg !167
  br label %if.end20, !dbg !168

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !169
  store i32 %10, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_badData, align 4, !dbg !170
  call void @badSink(), !dbg !171
  ret void, !dbg !172
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_good() #0 !dbg !173 {
entry:
  call void @goodG2B(), !dbg !174
  call void @goodB2G(), !dbg !175
  ret void, !dbg !176
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !177 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !182, metadata !DIExpression()), !dbg !183
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !184, metadata !DIExpression()), !dbg !185
  %call = call i64 @time(i64* null) #8, !dbg !186
  %conv = trunc i64 %call to i32, !dbg !187
  call void @srand(i32 %conv) #8, !dbg !188
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !189
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_good(), !dbg !190
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !191
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !192
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_bad(), !dbg !193
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !194
  ret i32 0, !dbg !195
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !196 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !197, metadata !DIExpression()), !dbg !198
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_badData, align 4, !dbg !199
  store i32 %0, i32* %data, align 4, !dbg !198
  call void @llvm.dbg.declare(metadata i32* %i, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !203, metadata !DIExpression()), !dbg !204
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !205
  %1 = bitcast i8* %call to i32*, !dbg !206
  store i32* %1, i32** %buffer, align 8, !dbg !204
  %2 = load i32*, i32** %buffer, align 8, !dbg !207
  %cmp = icmp eq i32* %2, null, !dbg !209
  br i1 %cmp, label %if.then, label %if.end, !dbg !210

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !211
  unreachable, !dbg !211

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !216
  %cmp1 = icmp slt i32 %3, 10, !dbg !218
  br i1 %cmp1, label %for.body, label %for.end, !dbg !219

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !220
  %5 = load i32, i32* %i, align 4, !dbg !222
  %idxprom = sext i32 %5 to i64, !dbg !220
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !220
  store i32 0, i32* %arrayidx, align 4, !dbg !223
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !225
  %inc = add nsw i32 %6, 1, !dbg !225
  store i32 %inc, i32* %i, align 4, !dbg !225
  br label %for.cond, !dbg !226, !llvm.loop !227

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !230
  %cmp2 = icmp sge i32 %7, 0, !dbg !232
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !233

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !234
  %9 = load i32, i32* %data, align 4, !dbg !236
  %idxprom4 = sext i32 %9 to i64, !dbg !234
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !234
  store i32 1, i32* %arrayidx5, align 4, !dbg !237
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond6, !dbg !240

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !241
  %cmp7 = icmp slt i32 %10, 10, !dbg !243
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !244

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !245
  %12 = load i32, i32* %i, align 4, !dbg !247
  %idxprom9 = sext i32 %12 to i64, !dbg !245
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !245
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !245
  call void @printIntLine(i32 %13), !dbg !248
  br label %for.inc11, !dbg !249

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !250
  %inc12 = add nsw i32 %14, 1, !dbg !250
  store i32 %inc12, i32* %i, align 4, !dbg !250
  br label %for.cond6, !dbg !251, !llvm.loop !252

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !254

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !255
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !257
  %16 = bitcast i32* %15 to i8*, !dbg !257
  call void @free(i8* %16) #8, !dbg !258
  ret void, !dbg !259
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #7

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !260 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !261, metadata !DIExpression()), !dbg !262
  store i32 -1, i32* %data, align 4, !dbg !263
  store i32 7, i32* %data, align 4, !dbg !264
  %0 = load i32, i32* %data, align 4, !dbg !265
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodG2BData, align 4, !dbg !266
  call void @goodG2BSink(), !dbg !267
  ret void, !dbg !268
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !269 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !270, metadata !DIExpression()), !dbg !271
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodG2BData, align 4, !dbg !272
  store i32 %0, i32* %data, align 4, !dbg !271
  call void @llvm.dbg.declare(metadata i32* %i, metadata !273, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !276, metadata !DIExpression()), !dbg !277
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !278
  %1 = bitcast i8* %call to i32*, !dbg !279
  store i32* %1, i32** %buffer, align 8, !dbg !277
  %2 = load i32*, i32** %buffer, align 8, !dbg !280
  %cmp = icmp eq i32* %2, null, !dbg !282
  br i1 %cmp, label %if.then, label %if.end, !dbg !283

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !284
  unreachable, !dbg !284

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !286
  br label %for.cond, !dbg !288

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !289
  %cmp1 = icmp slt i32 %3, 10, !dbg !291
  br i1 %cmp1, label %for.body, label %for.end, !dbg !292

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !293
  %5 = load i32, i32* %i, align 4, !dbg !295
  %idxprom = sext i32 %5 to i64, !dbg !293
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !293
  store i32 0, i32* %arrayidx, align 4, !dbg !296
  br label %for.inc, !dbg !297

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !298
  %inc = add nsw i32 %6, 1, !dbg !298
  store i32 %inc, i32* %i, align 4, !dbg !298
  br label %for.cond, !dbg !299, !llvm.loop !300

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !302
  %cmp2 = icmp sge i32 %7, 0, !dbg !304
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !305

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !306
  %9 = load i32, i32* %data, align 4, !dbg !308
  %idxprom4 = sext i32 %9 to i64, !dbg !306
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !306
  store i32 1, i32* %arrayidx5, align 4, !dbg !309
  store i32 0, i32* %i, align 4, !dbg !310
  br label %for.cond6, !dbg !312

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !313
  %cmp7 = icmp slt i32 %10, 10, !dbg !315
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !316

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !317
  %12 = load i32, i32* %i, align 4, !dbg !319
  %idxprom9 = sext i32 %12 to i64, !dbg !317
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !317
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !317
  call void @printIntLine(i32 %13), !dbg !320
  br label %for.inc11, !dbg !321

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !322
  %inc12 = add nsw i32 %14, 1, !dbg !322
  store i32 %inc12, i32* %i, align 4, !dbg !322
  br label %for.cond6, !dbg !323, !llvm.loop !324

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !326

if.else:                                          ; preds = %for.end
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !327
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !329
  %16 = bitcast i32* %15 to i8*, !dbg !329
  call void @free(i8* %16) #8, !dbg !330
  ret void, !dbg !331
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !332 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !333, metadata !DIExpression()), !dbg !334
  store i32 -1, i32* %data, align 4, !dbg !335
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !336, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !339, metadata !DIExpression()), !dbg !340
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !341, metadata !DIExpression()), !dbg !342
  store i32 -1, i32* %connectSocket, align 4, !dbg !342
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !343, metadata !DIExpression()), !dbg !344
  br label %do.body, !dbg !345

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #8, !dbg !346
  store i32 %call, i32* %connectSocket, align 4, !dbg !348
  %0 = load i32, i32* %connectSocket, align 4, !dbg !349
  %cmp = icmp eq i32 %0, -1, !dbg !351
  br i1 %cmp, label %if.then, label %if.end, !dbg !352

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !353

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !355
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !355
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !356
  store i16 2, i16* %sin_family, align 4, !dbg !357
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #8, !dbg !358
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !359
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !360
  store i32 %call1, i32* %s_addr, align 4, !dbg !361
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #9, !dbg !362
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !363
  store i16 %call2, i16* %sin_port, align 2, !dbg !364
  %2 = load i32, i32* %connectSocket, align 4, !dbg !365
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !367
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !368
  %cmp4 = icmp eq i32 %call3, -1, !dbg !369
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !370

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !371

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !373
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !374
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !375
  %conv = trunc i64 %call7 to i32, !dbg !375
  store i32 %conv, i32* %recvResult, align 4, !dbg !376
  %5 = load i32, i32* %recvResult, align 4, !dbg !377
  %cmp8 = icmp eq i32 %5, -1, !dbg !379
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !380

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !381
  %cmp10 = icmp eq i32 %6, 0, !dbg !382
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !383

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !384

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !386
  %idxprom = sext i32 %7 to i64, !dbg !387
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !387
  store i8 0, i8* %arrayidx, align 1, !dbg !388
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !389
  %call15 = call i32 @atoi(i8* %arraydecay14) #10, !dbg !390
  store i32 %call15, i32* %data, align 4, !dbg !391
  br label %do.end, !dbg !392

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !393
  %cmp16 = icmp ne i32 %8, -1, !dbg !395
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !396

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !397
  %call19 = call i32 @close(i32 %9), !dbg !399
  br label %if.end20, !dbg !400

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !401
  store i32 %10, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodB2GData, align 4, !dbg !402
  call void @goodB2GSink(), !dbg !403
  ret void, !dbg !404
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !405 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !406, metadata !DIExpression()), !dbg !407
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodB2GData, align 4, !dbg !408
  store i32 %0, i32* %data, align 4, !dbg !407
  call void @llvm.dbg.declare(metadata i32* %i, metadata !409, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !412, metadata !DIExpression()), !dbg !413
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !414
  %1 = bitcast i8* %call to i32*, !dbg !415
  store i32* %1, i32** %buffer, align 8, !dbg !413
  %2 = load i32*, i32** %buffer, align 8, !dbg !416
  %cmp = icmp eq i32* %2, null, !dbg !418
  br i1 %cmp, label %if.then, label %if.end, !dbg !419

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #11, !dbg !420
  unreachable, !dbg !420

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !422
  br label %for.cond, !dbg !424

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !425
  %cmp1 = icmp slt i32 %3, 10, !dbg !427
  br i1 %cmp1, label %for.body, label %for.end, !dbg !428

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !429
  %5 = load i32, i32* %i, align 4, !dbg !431
  %idxprom = sext i32 %5 to i64, !dbg !429
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !429
  store i32 0, i32* %arrayidx, align 4, !dbg !432
  br label %for.inc, !dbg !433

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !434
  %inc = add nsw i32 %6, 1, !dbg !434
  store i32 %inc, i32* %i, align 4, !dbg !434
  br label %for.cond, !dbg !435, !llvm.loop !436

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !438
  %cmp2 = icmp sge i32 %7, 0, !dbg !440
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !441

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !442
  %cmp3 = icmp slt i32 %8, 10, !dbg !443
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !444

if.then4:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !445
  %10 = load i32, i32* %data, align 4, !dbg !447
  %idxprom5 = sext i32 %10 to i64, !dbg !445
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !445
  store i32 1, i32* %arrayidx6, align 4, !dbg !448
  store i32 0, i32* %i, align 4, !dbg !449
  br label %for.cond7, !dbg !451

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !452
  %cmp8 = icmp slt i32 %11, 10, !dbg !454
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !455

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !456
  %13 = load i32, i32* %i, align 4, !dbg !458
  %idxprom10 = sext i32 %13 to i64, !dbg !456
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !456
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !456
  call void @printIntLine(i32 %14), !dbg !459
  br label %for.inc12, !dbg !460

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !461
  %inc13 = add nsw i32 %15, 1, !dbg !461
  store i32 %inc13, i32* %i, align 4, !dbg !461
  br label %for.cond7, !dbg !462, !llvm.loop !463

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !465

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !466
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !468
  %17 = bitcast i32* %16 to i8*, !dbg !468
  call void @free(i8* %17) #8, !dbg !469
  ret void, !dbg !470
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
!llvm.module.flags = !{!70, !71, !72, !73, !74}
!llvm.ident = !{!75}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_badData", scope: !2, file: !67, line: 42, type: !62, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !64, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45.c", directory: "/root/SSE-Assessment")
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
!64 = !{!0, !65, !68}
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodG2BData", scope: !2, file: !67, line: 43, type: !62, isLocal: true, isDefinition: true)
!67 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45.c", directory: "/root/SSE-Assessment")
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodB2GData", scope: !2, file: !67, line: 44, type: !62, isLocal: true, isDefinition: true)
!70 = !{i32 7, !"Dwarf Version", i32 4}
!71 = !{i32 2, !"Debug Info Version", i32 3}
!72 = !{i32 1, !"wchar_size", i32 4}
!73 = !{i32 7, !"uwtable", i32 1}
!74 = !{i32 7, !"frame-pointer", i32 2}
!75 = !{!"clang version 13.0.0"}
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_bad", scope: !67, file: !67, line: 79, type: !77, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!77 = !DISubroutineType(types: !78)
!78 = !{null}
!79 = !{}
!80 = !DILocalVariable(name: "data", scope: !76, file: !67, line: 81, type: !62)
!81 = !DILocation(line: 81, column: 9, scope: !76)
!82 = !DILocation(line: 83, column: 10, scope: !76)
!83 = !DILocalVariable(name: "recvResult", scope: !84, file: !67, line: 89, type: !62)
!84 = distinct !DILexicalBlock(scope: !76, file: !67, line: 84, column: 5)
!85 = !DILocation(line: 89, column: 13, scope: !84)
!86 = !DILocalVariable(name: "service", scope: !84, file: !67, line: 90, type: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 237, size: 128, elements: !88)
!88 = !{!89, !90, !96, !103}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !19, line: 239, baseType: !53, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !19, line: 240, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !93, line: 25, baseType: !94)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !95, line: 39, baseType: !55)
!95 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !19, line: 241, baseType: !97, size: 32, offset: 32)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !98)
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !97, file: !19, line: 33, baseType: !100, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !93, line: 26, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !95, line: 41, baseType: !7)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !19, line: 244, baseType: !104, size: 64, offset: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 64, elements: !106)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 90, column: 28, scope: !84)
!109 = !DILocalVariable(name: "connectSocket", scope: !84, file: !67, line: 91, type: !62)
!110 = !DILocation(line: 91, column: 16, scope: !84)
!111 = !DILocalVariable(name: "inputBuffer", scope: !84, file: !67, line: 92, type: !57)
!112 = !DILocation(line: 92, column: 14, scope: !84)
!113 = !DILocation(line: 93, column: 9, scope: !84)
!114 = !DILocation(line: 103, column: 29, scope: !115)
!115 = distinct !DILexicalBlock(scope: !84, file: !67, line: 94, column: 9)
!116 = !DILocation(line: 103, column: 27, scope: !115)
!117 = !DILocation(line: 104, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !67, line: 104, column: 17)
!119 = !DILocation(line: 104, column: 31, scope: !118)
!120 = !DILocation(line: 104, column: 17, scope: !115)
!121 = !DILocation(line: 106, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !67, line: 105, column: 13)
!123 = !DILocation(line: 108, column: 13, scope: !115)
!124 = !DILocation(line: 109, column: 21, scope: !115)
!125 = !DILocation(line: 109, column: 32, scope: !115)
!126 = !DILocation(line: 110, column: 39, scope: !115)
!127 = !DILocation(line: 110, column: 21, scope: !115)
!128 = !DILocation(line: 110, column: 30, scope: !115)
!129 = !DILocation(line: 110, column: 37, scope: !115)
!130 = !DILocation(line: 111, column: 32, scope: !115)
!131 = !DILocation(line: 111, column: 21, scope: !115)
!132 = !DILocation(line: 111, column: 30, scope: !115)
!133 = !DILocation(line: 112, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !115, file: !67, line: 112, column: 17)
!135 = !DILocation(line: 112, column: 40, scope: !134)
!136 = !DILocation(line: 112, column: 17, scope: !134)
!137 = !DILocation(line: 112, column: 85, scope: !134)
!138 = !DILocation(line: 112, column: 17, scope: !115)
!139 = !DILocation(line: 114, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !67, line: 113, column: 13)
!141 = !DILocation(line: 118, column: 31, scope: !115)
!142 = !DILocation(line: 118, column: 46, scope: !115)
!143 = !DILocation(line: 118, column: 26, scope: !115)
!144 = !DILocation(line: 118, column: 24, scope: !115)
!145 = !DILocation(line: 119, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !115, file: !67, line: 119, column: 17)
!147 = !DILocation(line: 119, column: 28, scope: !146)
!148 = !DILocation(line: 119, column: 44, scope: !146)
!149 = !DILocation(line: 119, column: 47, scope: !146)
!150 = !DILocation(line: 119, column: 58, scope: !146)
!151 = !DILocation(line: 119, column: 17, scope: !115)
!152 = !DILocation(line: 121, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !146, file: !67, line: 120, column: 13)
!154 = !DILocation(line: 124, column: 25, scope: !115)
!155 = !DILocation(line: 124, column: 13, scope: !115)
!156 = !DILocation(line: 124, column: 37, scope: !115)
!157 = !DILocation(line: 126, column: 25, scope: !115)
!158 = !DILocation(line: 126, column: 20, scope: !115)
!159 = !DILocation(line: 126, column: 18, scope: !115)
!160 = !DILocation(line: 127, column: 9, scope: !115)
!161 = !DILocation(line: 129, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !84, file: !67, line: 129, column: 13)
!163 = !DILocation(line: 129, column: 27, scope: !162)
!164 = !DILocation(line: 129, column: 13, scope: !84)
!165 = !DILocation(line: 131, column: 26, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !67, line: 130, column: 9)
!167 = !DILocation(line: 131, column: 13, scope: !166)
!168 = !DILocation(line: 132, column: 9, scope: !166)
!169 = !DILocation(line: 140, column: 77, scope: !76)
!170 = !DILocation(line: 140, column: 75, scope: !76)
!171 = !DILocation(line: 141, column: 5, scope: !76)
!172 = !DILocation(line: 142, column: 1, scope: !76)
!173 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_good", scope: !67, file: !67, line: 288, type: !77, scopeLine: 289, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!174 = !DILocation(line: 290, column: 5, scope: !173)
!175 = !DILocation(line: 291, column: 5, scope: !173)
!176 = !DILocation(line: 292, column: 1, scope: !173)
!177 = distinct !DISubprogram(name: "main", scope: !67, file: !67, line: 302, type: !178, scopeLine: 303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!178 = !DISubroutineType(types: !179)
!179 = !{!62, !62, !180}
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64)
!181 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!182 = !DILocalVariable(name: "argc", arg: 1, scope: !177, file: !67, line: 302, type: !62)
!183 = !DILocation(line: 302, column: 14, scope: !177)
!184 = !DILocalVariable(name: "argv", arg: 2, scope: !177, file: !67, line: 302, type: !180)
!185 = !DILocation(line: 302, column: 27, scope: !177)
!186 = !DILocation(line: 305, column: 22, scope: !177)
!187 = !DILocation(line: 305, column: 12, scope: !177)
!188 = !DILocation(line: 305, column: 5, scope: !177)
!189 = !DILocation(line: 307, column: 5, scope: !177)
!190 = !DILocation(line: 308, column: 5, scope: !177)
!191 = !DILocation(line: 309, column: 5, scope: !177)
!192 = !DILocation(line: 312, column: 5, scope: !177)
!193 = !DILocation(line: 313, column: 5, scope: !177)
!194 = !DILocation(line: 314, column: 5, scope: !177)
!195 = !DILocation(line: 316, column: 5, scope: !177)
!196 = distinct !DISubprogram(name: "badSink", scope: !67, file: !67, line: 48, type: !77, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!197 = !DILocalVariable(name: "data", scope: !196, file: !67, line: 50, type: !62)
!198 = !DILocation(line: 50, column: 9, scope: !196)
!199 = !DILocation(line: 50, column: 16, scope: !196)
!200 = !DILocalVariable(name: "i", scope: !201, file: !67, line: 52, type: !62)
!201 = distinct !DILexicalBlock(scope: !196, file: !67, line: 51, column: 5)
!202 = !DILocation(line: 52, column: 13, scope: !201)
!203 = !DILocalVariable(name: "buffer", scope: !201, file: !67, line: 53, type: !61)
!204 = !DILocation(line: 53, column: 15, scope: !201)
!205 = !DILocation(line: 53, column: 31, scope: !201)
!206 = !DILocation(line: 53, column: 24, scope: !201)
!207 = !DILocation(line: 54, column: 13, scope: !208)
!208 = distinct !DILexicalBlock(scope: !201, file: !67, line: 54, column: 13)
!209 = !DILocation(line: 54, column: 20, scope: !208)
!210 = !DILocation(line: 54, column: 13, scope: !201)
!211 = !DILocation(line: 54, column: 30, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !67, line: 54, column: 29)
!213 = !DILocation(line: 56, column: 16, scope: !214)
!214 = distinct !DILexicalBlock(scope: !201, file: !67, line: 56, column: 9)
!215 = !DILocation(line: 56, column: 14, scope: !214)
!216 = !DILocation(line: 56, column: 21, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !67, line: 56, column: 9)
!218 = !DILocation(line: 56, column: 23, scope: !217)
!219 = !DILocation(line: 56, column: 9, scope: !214)
!220 = !DILocation(line: 58, column: 13, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !67, line: 57, column: 9)
!222 = !DILocation(line: 58, column: 20, scope: !221)
!223 = !DILocation(line: 58, column: 23, scope: !221)
!224 = !DILocation(line: 59, column: 9, scope: !221)
!225 = !DILocation(line: 56, column: 30, scope: !217)
!226 = !DILocation(line: 56, column: 9, scope: !217)
!227 = distinct !{!227, !219, !228, !229}
!228 = !DILocation(line: 59, column: 9, scope: !214)
!229 = !{!"llvm.loop.mustprogress"}
!230 = !DILocation(line: 62, column: 13, scope: !231)
!231 = distinct !DILexicalBlock(scope: !201, file: !67, line: 62, column: 13)
!232 = !DILocation(line: 62, column: 18, scope: !231)
!233 = !DILocation(line: 62, column: 13, scope: !201)
!234 = !DILocation(line: 64, column: 13, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !67, line: 63, column: 9)
!236 = !DILocation(line: 64, column: 20, scope: !235)
!237 = !DILocation(line: 64, column: 26, scope: !235)
!238 = !DILocation(line: 66, column: 19, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !67, line: 66, column: 13)
!240 = !DILocation(line: 66, column: 17, scope: !239)
!241 = !DILocation(line: 66, column: 24, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !67, line: 66, column: 13)
!243 = !DILocation(line: 66, column: 26, scope: !242)
!244 = !DILocation(line: 66, column: 13, scope: !239)
!245 = !DILocation(line: 68, column: 30, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !67, line: 67, column: 13)
!247 = !DILocation(line: 68, column: 37, scope: !246)
!248 = !DILocation(line: 68, column: 17, scope: !246)
!249 = !DILocation(line: 69, column: 13, scope: !246)
!250 = !DILocation(line: 66, column: 33, scope: !242)
!251 = !DILocation(line: 66, column: 13, scope: !242)
!252 = distinct !{!252, !244, !253, !229}
!253 = !DILocation(line: 69, column: 13, scope: !239)
!254 = !DILocation(line: 70, column: 9, scope: !235)
!255 = !DILocation(line: 73, column: 13, scope: !256)
!256 = distinct !DILexicalBlock(scope: !231, file: !67, line: 72, column: 9)
!257 = !DILocation(line: 75, column: 14, scope: !201)
!258 = !DILocation(line: 75, column: 9, scope: !201)
!259 = !DILocation(line: 77, column: 1, scope: !196)
!260 = distinct !DISubprogram(name: "goodG2B", scope: !67, file: !67, line: 180, type: !77, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!261 = !DILocalVariable(name: "data", scope: !260, file: !67, line: 182, type: !62)
!262 = !DILocation(line: 182, column: 9, scope: !260)
!263 = !DILocation(line: 184, column: 10, scope: !260)
!264 = !DILocation(line: 187, column: 10, scope: !260)
!265 = !DILocation(line: 188, column: 81, scope: !260)
!266 = !DILocation(line: 188, column: 79, scope: !260)
!267 = !DILocation(line: 189, column: 5, scope: !260)
!268 = !DILocation(line: 190, column: 1, scope: !260)
!269 = distinct !DISubprogram(name: "goodG2BSink", scope: !67, file: !67, line: 149, type: !77, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!270 = !DILocalVariable(name: "data", scope: !269, file: !67, line: 151, type: !62)
!271 = !DILocation(line: 151, column: 9, scope: !269)
!272 = !DILocation(line: 151, column: 16, scope: !269)
!273 = !DILocalVariable(name: "i", scope: !274, file: !67, line: 153, type: !62)
!274 = distinct !DILexicalBlock(scope: !269, file: !67, line: 152, column: 5)
!275 = !DILocation(line: 153, column: 13, scope: !274)
!276 = !DILocalVariable(name: "buffer", scope: !274, file: !67, line: 154, type: !61)
!277 = !DILocation(line: 154, column: 15, scope: !274)
!278 = !DILocation(line: 154, column: 31, scope: !274)
!279 = !DILocation(line: 154, column: 24, scope: !274)
!280 = !DILocation(line: 155, column: 13, scope: !281)
!281 = distinct !DILexicalBlock(scope: !274, file: !67, line: 155, column: 13)
!282 = !DILocation(line: 155, column: 20, scope: !281)
!283 = !DILocation(line: 155, column: 13, scope: !274)
!284 = !DILocation(line: 155, column: 30, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !67, line: 155, column: 29)
!286 = !DILocation(line: 157, column: 16, scope: !287)
!287 = distinct !DILexicalBlock(scope: !274, file: !67, line: 157, column: 9)
!288 = !DILocation(line: 157, column: 14, scope: !287)
!289 = !DILocation(line: 157, column: 21, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !67, line: 157, column: 9)
!291 = !DILocation(line: 157, column: 23, scope: !290)
!292 = !DILocation(line: 157, column: 9, scope: !287)
!293 = !DILocation(line: 159, column: 13, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !67, line: 158, column: 9)
!295 = !DILocation(line: 159, column: 20, scope: !294)
!296 = !DILocation(line: 159, column: 23, scope: !294)
!297 = !DILocation(line: 160, column: 9, scope: !294)
!298 = !DILocation(line: 157, column: 30, scope: !290)
!299 = !DILocation(line: 157, column: 9, scope: !290)
!300 = distinct !{!300, !292, !301, !229}
!301 = !DILocation(line: 160, column: 9, scope: !287)
!302 = !DILocation(line: 163, column: 13, scope: !303)
!303 = distinct !DILexicalBlock(scope: !274, file: !67, line: 163, column: 13)
!304 = !DILocation(line: 163, column: 18, scope: !303)
!305 = !DILocation(line: 163, column: 13, scope: !274)
!306 = !DILocation(line: 165, column: 13, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !67, line: 164, column: 9)
!308 = !DILocation(line: 165, column: 20, scope: !307)
!309 = !DILocation(line: 165, column: 26, scope: !307)
!310 = !DILocation(line: 167, column: 19, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !67, line: 167, column: 13)
!312 = !DILocation(line: 167, column: 17, scope: !311)
!313 = !DILocation(line: 167, column: 24, scope: !314)
!314 = distinct !DILexicalBlock(scope: !311, file: !67, line: 167, column: 13)
!315 = !DILocation(line: 167, column: 26, scope: !314)
!316 = !DILocation(line: 167, column: 13, scope: !311)
!317 = !DILocation(line: 169, column: 30, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !67, line: 168, column: 13)
!319 = !DILocation(line: 169, column: 37, scope: !318)
!320 = !DILocation(line: 169, column: 17, scope: !318)
!321 = !DILocation(line: 170, column: 13, scope: !318)
!322 = !DILocation(line: 167, column: 33, scope: !314)
!323 = !DILocation(line: 167, column: 13, scope: !314)
!324 = distinct !{!324, !316, !325, !229}
!325 = !DILocation(line: 170, column: 13, scope: !311)
!326 = !DILocation(line: 171, column: 9, scope: !307)
!327 = !DILocation(line: 174, column: 13, scope: !328)
!328 = distinct !DILexicalBlock(scope: !303, file: !67, line: 173, column: 9)
!329 = !DILocation(line: 176, column: 14, scope: !274)
!330 = !DILocation(line: 176, column: 9, scope: !274)
!331 = !DILocation(line: 178, column: 1, scope: !269)
!332 = distinct !DISubprogram(name: "goodB2G", scope: !67, file: !67, line: 223, type: !77, scopeLine: 224, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!333 = !DILocalVariable(name: "data", scope: !332, file: !67, line: 225, type: !62)
!334 = !DILocation(line: 225, column: 9, scope: !332)
!335 = !DILocation(line: 227, column: 10, scope: !332)
!336 = !DILocalVariable(name: "recvResult", scope: !337, file: !67, line: 233, type: !62)
!337 = distinct !DILexicalBlock(scope: !332, file: !67, line: 228, column: 5)
!338 = !DILocation(line: 233, column: 13, scope: !337)
!339 = !DILocalVariable(name: "service", scope: !337, file: !67, line: 234, type: !87)
!340 = !DILocation(line: 234, column: 28, scope: !337)
!341 = !DILocalVariable(name: "connectSocket", scope: !337, file: !67, line: 235, type: !62)
!342 = !DILocation(line: 235, column: 16, scope: !337)
!343 = !DILocalVariable(name: "inputBuffer", scope: !337, file: !67, line: 236, type: !57)
!344 = !DILocation(line: 236, column: 14, scope: !337)
!345 = !DILocation(line: 237, column: 9, scope: !337)
!346 = !DILocation(line: 247, column: 29, scope: !347)
!347 = distinct !DILexicalBlock(scope: !337, file: !67, line: 238, column: 9)
!348 = !DILocation(line: 247, column: 27, scope: !347)
!349 = !DILocation(line: 248, column: 17, scope: !350)
!350 = distinct !DILexicalBlock(scope: !347, file: !67, line: 248, column: 17)
!351 = !DILocation(line: 248, column: 31, scope: !350)
!352 = !DILocation(line: 248, column: 17, scope: !347)
!353 = !DILocation(line: 250, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !67, line: 249, column: 13)
!355 = !DILocation(line: 252, column: 13, scope: !347)
!356 = !DILocation(line: 253, column: 21, scope: !347)
!357 = !DILocation(line: 253, column: 32, scope: !347)
!358 = !DILocation(line: 254, column: 39, scope: !347)
!359 = !DILocation(line: 254, column: 21, scope: !347)
!360 = !DILocation(line: 254, column: 30, scope: !347)
!361 = !DILocation(line: 254, column: 37, scope: !347)
!362 = !DILocation(line: 255, column: 32, scope: !347)
!363 = !DILocation(line: 255, column: 21, scope: !347)
!364 = !DILocation(line: 255, column: 30, scope: !347)
!365 = !DILocation(line: 256, column: 25, scope: !366)
!366 = distinct !DILexicalBlock(scope: !347, file: !67, line: 256, column: 17)
!367 = !DILocation(line: 256, column: 40, scope: !366)
!368 = !DILocation(line: 256, column: 17, scope: !366)
!369 = !DILocation(line: 256, column: 85, scope: !366)
!370 = !DILocation(line: 256, column: 17, scope: !347)
!371 = !DILocation(line: 258, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !366, file: !67, line: 257, column: 13)
!373 = !DILocation(line: 262, column: 31, scope: !347)
!374 = !DILocation(line: 262, column: 46, scope: !347)
!375 = !DILocation(line: 262, column: 26, scope: !347)
!376 = !DILocation(line: 262, column: 24, scope: !347)
!377 = !DILocation(line: 263, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !347, file: !67, line: 263, column: 17)
!379 = !DILocation(line: 263, column: 28, scope: !378)
!380 = !DILocation(line: 263, column: 44, scope: !378)
!381 = !DILocation(line: 263, column: 47, scope: !378)
!382 = !DILocation(line: 263, column: 58, scope: !378)
!383 = !DILocation(line: 263, column: 17, scope: !347)
!384 = !DILocation(line: 265, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !378, file: !67, line: 264, column: 13)
!386 = !DILocation(line: 268, column: 25, scope: !347)
!387 = !DILocation(line: 268, column: 13, scope: !347)
!388 = !DILocation(line: 268, column: 37, scope: !347)
!389 = !DILocation(line: 270, column: 25, scope: !347)
!390 = !DILocation(line: 270, column: 20, scope: !347)
!391 = !DILocation(line: 270, column: 18, scope: !347)
!392 = !DILocation(line: 271, column: 9, scope: !347)
!393 = !DILocation(line: 273, column: 13, scope: !394)
!394 = distinct !DILexicalBlock(scope: !337, file: !67, line: 273, column: 13)
!395 = !DILocation(line: 273, column: 27, scope: !394)
!396 = !DILocation(line: 273, column: 13, scope: !337)
!397 = !DILocation(line: 275, column: 26, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !67, line: 274, column: 9)
!399 = !DILocation(line: 275, column: 13, scope: !398)
!400 = !DILocation(line: 276, column: 9, scope: !398)
!401 = !DILocation(line: 284, column: 81, scope: !332)
!402 = !DILocation(line: 284, column: 79, scope: !332)
!403 = !DILocation(line: 285, column: 5, scope: !332)
!404 = !DILocation(line: 286, column: 1, scope: !332)
!405 = distinct !DISubprogram(name: "goodB2GSink", scope: !67, file: !67, line: 193, type: !77, scopeLine: 194, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!406 = !DILocalVariable(name: "data", scope: !405, file: !67, line: 195, type: !62)
!407 = !DILocation(line: 195, column: 9, scope: !405)
!408 = !DILocation(line: 195, column: 16, scope: !405)
!409 = !DILocalVariable(name: "i", scope: !410, file: !67, line: 197, type: !62)
!410 = distinct !DILexicalBlock(scope: !405, file: !67, line: 196, column: 5)
!411 = !DILocation(line: 197, column: 13, scope: !410)
!412 = !DILocalVariable(name: "buffer", scope: !410, file: !67, line: 198, type: !61)
!413 = !DILocation(line: 198, column: 15, scope: !410)
!414 = !DILocation(line: 198, column: 31, scope: !410)
!415 = !DILocation(line: 198, column: 24, scope: !410)
!416 = !DILocation(line: 199, column: 13, scope: !417)
!417 = distinct !DILexicalBlock(scope: !410, file: !67, line: 199, column: 13)
!418 = !DILocation(line: 199, column: 20, scope: !417)
!419 = !DILocation(line: 199, column: 13, scope: !410)
!420 = !DILocation(line: 199, column: 30, scope: !421)
!421 = distinct !DILexicalBlock(scope: !417, file: !67, line: 199, column: 29)
!422 = !DILocation(line: 201, column: 16, scope: !423)
!423 = distinct !DILexicalBlock(scope: !410, file: !67, line: 201, column: 9)
!424 = !DILocation(line: 201, column: 14, scope: !423)
!425 = !DILocation(line: 201, column: 21, scope: !426)
!426 = distinct !DILexicalBlock(scope: !423, file: !67, line: 201, column: 9)
!427 = !DILocation(line: 201, column: 23, scope: !426)
!428 = !DILocation(line: 201, column: 9, scope: !423)
!429 = !DILocation(line: 203, column: 13, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !67, line: 202, column: 9)
!431 = !DILocation(line: 203, column: 20, scope: !430)
!432 = !DILocation(line: 203, column: 23, scope: !430)
!433 = !DILocation(line: 204, column: 9, scope: !430)
!434 = !DILocation(line: 201, column: 30, scope: !426)
!435 = !DILocation(line: 201, column: 9, scope: !426)
!436 = distinct !{!436, !428, !437, !229}
!437 = !DILocation(line: 204, column: 9, scope: !423)
!438 = !DILocation(line: 206, column: 13, scope: !439)
!439 = distinct !DILexicalBlock(scope: !410, file: !67, line: 206, column: 13)
!440 = !DILocation(line: 206, column: 18, scope: !439)
!441 = !DILocation(line: 206, column: 23, scope: !439)
!442 = !DILocation(line: 206, column: 26, scope: !439)
!443 = !DILocation(line: 206, column: 31, scope: !439)
!444 = !DILocation(line: 206, column: 13, scope: !410)
!445 = !DILocation(line: 208, column: 13, scope: !446)
!446 = distinct !DILexicalBlock(scope: !439, file: !67, line: 207, column: 9)
!447 = !DILocation(line: 208, column: 20, scope: !446)
!448 = !DILocation(line: 208, column: 26, scope: !446)
!449 = !DILocation(line: 210, column: 19, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !67, line: 210, column: 13)
!451 = !DILocation(line: 210, column: 17, scope: !450)
!452 = !DILocation(line: 210, column: 24, scope: !453)
!453 = distinct !DILexicalBlock(scope: !450, file: !67, line: 210, column: 13)
!454 = !DILocation(line: 210, column: 26, scope: !453)
!455 = !DILocation(line: 210, column: 13, scope: !450)
!456 = !DILocation(line: 212, column: 30, scope: !457)
!457 = distinct !DILexicalBlock(scope: !453, file: !67, line: 211, column: 13)
!458 = !DILocation(line: 212, column: 37, scope: !457)
!459 = !DILocation(line: 212, column: 17, scope: !457)
!460 = !DILocation(line: 213, column: 13, scope: !457)
!461 = !DILocation(line: 210, column: 33, scope: !453)
!462 = !DILocation(line: 210, column: 13, scope: !453)
!463 = distinct !{!463, !455, !464, !229}
!464 = !DILocation(line: 213, column: 13, scope: !450)
!465 = !DILocation(line: 214, column: 9, scope: !446)
!466 = !DILocation(line: 217, column: 13, scope: !467)
!467 = distinct !DILexicalBlock(scope: !439, file: !67, line: 216, column: 9)
!468 = !DILocation(line: 219, column: 14, scope: !410)
!469 = !DILocation(line: 219, column: 9, scope: !410)
!470 = !DILocation(line: 221, column: 1, scope: !405)
