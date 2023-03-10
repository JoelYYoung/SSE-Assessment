; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodB2G1Global = dso_local global i32 0, align 4, !dbg !67
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodB2G2Global = dso_local global i32 0, align 4, !dbg !71
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodG2BGlobal = dso_local global i32 0, align 4, !dbg !73
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_bad() #0 !dbg !81 {
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
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !116
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
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !131
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !132
  store i16 %call1, i16* %sin_port, align 2, !dbg !133
  %2 = load i32, i32* %listenSocket, align 4, !dbg !134
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !136
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !137
  %cmp3 = icmp eq i32 %call2, -1, !dbg !138
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !139

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !140

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !142
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !144
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
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !175
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
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_badGlobal, align 4, !dbg !194
  %15 = load i32, i32* %data, align 4, !dbg !195
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_badSink(i32 %15), !dbg !196
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

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_badSink(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_good() #0 !dbg !198 {
entry:
  call void @goodB2G1(), !dbg !199
  call void @goodB2G2(), !dbg !200
  call void @goodG2B(), !dbg !201
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !203 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !208, metadata !DIExpression()), !dbg !209
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !210, metadata !DIExpression()), !dbg !211
  %call = call i64 @time(i64* null) #7, !dbg !212
  %conv = trunc i64 %call to i32, !dbg !213
  call void @srand(i32 %conv) #7, !dbg !214
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !215
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_good(), !dbg !216
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !217
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !218
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_bad(), !dbg !219
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !220
  ret i32 0, !dbg !221
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !222 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !223, metadata !DIExpression()), !dbg !224
  store i32 -1, i32* %data, align 4, !dbg !225
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !226, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !229, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !231, metadata !DIExpression()), !dbg !232
  store i32 -1, i32* %listenSocket, align 4, !dbg !232
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !233, metadata !DIExpression()), !dbg !234
  store i32 -1, i32* %acceptSocket, align 4, !dbg !234
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !235, metadata !DIExpression()), !dbg !236
  br label %do.body, !dbg !237

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !238
  store i32 %call, i32* %listenSocket, align 4, !dbg !240
  %0 = load i32, i32* %listenSocket, align 4, !dbg !241
  %cmp = icmp eq i32 %0, -1, !dbg !243
  br i1 %cmp, label %if.then, label %if.end, !dbg !244

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !245

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !247
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !247
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !248
  store i16 2, i16* %sin_family, align 4, !dbg !249
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !250
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !251
  store i32 0, i32* %s_addr, align 4, !dbg !252
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !253
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !254
  store i16 %call1, i16* %sin_port, align 2, !dbg !255
  %2 = load i32, i32* %listenSocket, align 4, !dbg !256
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !258
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !259
  %cmp3 = icmp eq i32 %call2, -1, !dbg !260
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !261

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !262

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !264
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !266
  %cmp7 = icmp eq i32 %call6, -1, !dbg !267
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !268

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !269

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !271
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !272
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !273
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !274
  %cmp11 = icmp eq i32 %6, -1, !dbg !276
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !277

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !278

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !280
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !281
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !282
  %conv = trunc i64 %call14 to i32, !dbg !282
  store i32 %conv, i32* %recvResult, align 4, !dbg !283
  %8 = load i32, i32* %recvResult, align 4, !dbg !284
  %cmp15 = icmp eq i32 %8, -1, !dbg !286
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !287

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !288
  %cmp17 = icmp eq i32 %9, 0, !dbg !289
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !290

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !291

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !293
  %idxprom = sext i32 %10 to i64, !dbg !294
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !294
  store i8 0, i8* %arrayidx, align 1, !dbg !295
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !296
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !297
  store i32 %call22, i32* %data, align 4, !dbg !298
  br label %do.end, !dbg !299

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !300
  %cmp23 = icmp ne i32 %11, -1, !dbg !302
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !303

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !304
  %call26 = call i32 @close(i32 %12), !dbg !306
  br label %if.end27, !dbg !307

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !308
  %cmp28 = icmp ne i32 %13, -1, !dbg !310
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !311

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !312
  %call31 = call i32 @close(i32 %14), !dbg !314
  br label %if.end32, !dbg !315

if.end32:                                         ; preds = %if.then30, %if.end27
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodB2G1Global, align 4, !dbg !316
  %15 = load i32, i32* %data, align 4, !dbg !317
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodB2G1Sink(i32 %15), !dbg !318
  ret void, !dbg !319
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodB2G1Sink(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !320 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !321, metadata !DIExpression()), !dbg !322
  store i32 -1, i32* %data, align 4, !dbg !323
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !324, metadata !DIExpression()), !dbg !326
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !327, metadata !DIExpression()), !dbg !328
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !329, metadata !DIExpression()), !dbg !330
  store i32 -1, i32* %listenSocket, align 4, !dbg !330
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !331, metadata !DIExpression()), !dbg !332
  store i32 -1, i32* %acceptSocket, align 4, !dbg !332
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !333, metadata !DIExpression()), !dbg !334
  br label %do.body, !dbg !335

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !336
  store i32 %call, i32* %listenSocket, align 4, !dbg !338
  %0 = load i32, i32* %listenSocket, align 4, !dbg !339
  %cmp = icmp eq i32 %0, -1, !dbg !341
  br i1 %cmp, label %if.then, label %if.end, !dbg !342

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !343

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !345
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !345
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !346
  store i16 2, i16* %sin_family, align 4, !dbg !347
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !348
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !349
  store i32 0, i32* %s_addr, align 4, !dbg !350
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !351
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !352
  store i16 %call1, i16* %sin_port, align 2, !dbg !353
  %2 = load i32, i32* %listenSocket, align 4, !dbg !354
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !356
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !357
  %cmp3 = icmp eq i32 %call2, -1, !dbg !358
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !359

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !360

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !362
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !364
  %cmp7 = icmp eq i32 %call6, -1, !dbg !365
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !366

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !367

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !369
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !370
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !371
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !372
  %cmp11 = icmp eq i32 %6, -1, !dbg !374
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !375

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !376

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !378
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !379
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !380
  %conv = trunc i64 %call14 to i32, !dbg !380
  store i32 %conv, i32* %recvResult, align 4, !dbg !381
  %8 = load i32, i32* %recvResult, align 4, !dbg !382
  %cmp15 = icmp eq i32 %8, -1, !dbg !384
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !385

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !386
  %cmp17 = icmp eq i32 %9, 0, !dbg !387
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !388

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !389

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !391
  %idxprom = sext i32 %10 to i64, !dbg !392
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !392
  store i8 0, i8* %arrayidx, align 1, !dbg !393
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !394
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !395
  store i32 %call22, i32* %data, align 4, !dbg !396
  br label %do.end, !dbg !397

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !398
  %cmp23 = icmp ne i32 %11, -1, !dbg !400
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !401

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !402
  %call26 = call i32 @close(i32 %12), !dbg !404
  br label %if.end27, !dbg !405

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !406
  %cmp28 = icmp ne i32 %13, -1, !dbg !408
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !409

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !410
  %call31 = call i32 @close(i32 %14), !dbg !412
  br label %if.end32, !dbg !413

if.end32:                                         ; preds = %if.then30, %if.end27
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodB2G2Global, align 4, !dbg !414
  %15 = load i32, i32* %data, align 4, !dbg !415
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodB2G2Sink(i32 %15), !dbg !416
  ret void, !dbg !417
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodB2G2Sink(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !418 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !419, metadata !DIExpression()), !dbg !420
  store i32 -1, i32* %data, align 4, !dbg !421
  store i32 7, i32* %data, align 4, !dbg !422
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodG2BGlobal, align 4, !dbg !423
  %0 = load i32, i32* %data, align 4, !dbg !424
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodG2BSink(i32 %0), !dbg !425
  ret void, !dbg !426
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodG2BSink(i32) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!75, !76, !77, !78, !79}
!llvm.ident = !{!80}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_badGlobal", scope: !2, file: !69, line: 45, type: !70, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !66, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22a.c", directory: "/home/joelyang/SSE-Assessment")
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
!47 = !{!48, !53, !7}
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
!66 = !{!0, !67, !71, !73}
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodB2G1Global", scope: !2, file: !69, line: 132, type: !70, isLocal: false, isDefinition: true)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22a.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodB2G2Global", scope: !2, file: !69, line: 133, type: !70, isLocal: false, isDefinition: true)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_goodG2BGlobal", scope: !2, file: !69, line: 134, type: !70, isLocal: false, isDefinition: true)
!75 = !{i32 7, !"Dwarf Version", i32 4}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{i32 7, !"uwtable", i32 1}
!79 = !{i32 7, !"frame-pointer", i32 2}
!80 = !{!"clang version 13.0.0"}
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_bad", scope: !69, file: !69, line: 49, type: !82, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!82 = !DISubroutineType(types: !83)
!83 = !{null}
!84 = !{}
!85 = !DILocalVariable(name: "data", scope: !81, file: !69, line: 51, type: !70)
!86 = !DILocation(line: 51, column: 9, scope: !81)
!87 = !DILocation(line: 53, column: 10, scope: !81)
!88 = !DILocalVariable(name: "recvResult", scope: !89, file: !69, line: 59, type: !70)
!89 = distinct !DILexicalBlock(scope: !81, file: !69, line: 54, column: 5)
!90 = !DILocation(line: 59, column: 13, scope: !89)
!91 = !DILocalVariable(name: "service", scope: !89, file: !69, line: 60, type: !92)
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
!108 = !DILocation(line: 60, column: 28, scope: !89)
!109 = !DILocalVariable(name: "listenSocket", scope: !89, file: !69, line: 61, type: !70)
!110 = !DILocation(line: 61, column: 16, scope: !89)
!111 = !DILocalVariable(name: "acceptSocket", scope: !89, file: !69, line: 62, type: !70)
!112 = !DILocation(line: 62, column: 16, scope: !89)
!113 = !DILocalVariable(name: "inputBuffer", scope: !89, file: !69, line: 63, type: !62)
!114 = !DILocation(line: 63, column: 14, scope: !89)
!115 = !DILocation(line: 64, column: 9, scope: !89)
!116 = !DILocation(line: 74, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !89, file: !69, line: 65, column: 9)
!118 = !DILocation(line: 74, column: 26, scope: !117)
!119 = !DILocation(line: 75, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !69, line: 75, column: 17)
!121 = !DILocation(line: 75, column: 30, scope: !120)
!122 = !DILocation(line: 75, column: 17, scope: !117)
!123 = !DILocation(line: 77, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !69, line: 76, column: 13)
!125 = !DILocation(line: 79, column: 13, scope: !117)
!126 = !DILocation(line: 80, column: 21, scope: !117)
!127 = !DILocation(line: 80, column: 32, scope: !117)
!128 = !DILocation(line: 81, column: 21, scope: !117)
!129 = !DILocation(line: 81, column: 30, scope: !117)
!130 = !DILocation(line: 81, column: 37, scope: !117)
!131 = !DILocation(line: 82, column: 32, scope: !117)
!132 = !DILocation(line: 82, column: 21, scope: !117)
!133 = !DILocation(line: 82, column: 30, scope: !117)
!134 = !DILocation(line: 83, column: 22, scope: !135)
!135 = distinct !DILexicalBlock(scope: !117, file: !69, line: 83, column: 17)
!136 = !DILocation(line: 83, column: 36, scope: !135)
!137 = !DILocation(line: 83, column: 17, scope: !135)
!138 = !DILocation(line: 83, column: 81, scope: !135)
!139 = !DILocation(line: 83, column: 17, scope: !117)
!140 = !DILocation(line: 85, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !69, line: 84, column: 13)
!142 = !DILocation(line: 87, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !117, file: !69, line: 87, column: 17)
!144 = !DILocation(line: 87, column: 17, scope: !143)
!145 = !DILocation(line: 87, column: 54, scope: !143)
!146 = !DILocation(line: 87, column: 17, scope: !117)
!147 = !DILocation(line: 89, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !69, line: 88, column: 13)
!149 = !DILocation(line: 91, column: 35, scope: !117)
!150 = !DILocation(line: 91, column: 28, scope: !117)
!151 = !DILocation(line: 91, column: 26, scope: !117)
!152 = !DILocation(line: 92, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !117, file: !69, line: 92, column: 17)
!154 = !DILocation(line: 92, column: 30, scope: !153)
!155 = !DILocation(line: 92, column: 17, scope: !117)
!156 = !DILocation(line: 94, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !69, line: 93, column: 13)
!158 = !DILocation(line: 97, column: 31, scope: !117)
!159 = !DILocation(line: 97, column: 45, scope: !117)
!160 = !DILocation(line: 97, column: 26, scope: !117)
!161 = !DILocation(line: 97, column: 24, scope: !117)
!162 = !DILocation(line: 98, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !117, file: !69, line: 98, column: 17)
!164 = !DILocation(line: 98, column: 28, scope: !163)
!165 = !DILocation(line: 98, column: 44, scope: !163)
!166 = !DILocation(line: 98, column: 47, scope: !163)
!167 = !DILocation(line: 98, column: 58, scope: !163)
!168 = !DILocation(line: 98, column: 17, scope: !117)
!169 = !DILocation(line: 100, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !69, line: 99, column: 13)
!171 = !DILocation(line: 103, column: 25, scope: !117)
!172 = !DILocation(line: 103, column: 13, scope: !117)
!173 = !DILocation(line: 103, column: 37, scope: !117)
!174 = !DILocation(line: 105, column: 25, scope: !117)
!175 = !DILocation(line: 105, column: 20, scope: !117)
!176 = !DILocation(line: 105, column: 18, scope: !117)
!177 = !DILocation(line: 106, column: 9, scope: !117)
!178 = !DILocation(line: 108, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !89, file: !69, line: 108, column: 13)
!180 = !DILocation(line: 108, column: 26, scope: !179)
!181 = !DILocation(line: 108, column: 13, scope: !89)
!182 = !DILocation(line: 110, column: 26, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !69, line: 109, column: 9)
!184 = !DILocation(line: 110, column: 13, scope: !183)
!185 = !DILocation(line: 111, column: 9, scope: !183)
!186 = !DILocation(line: 112, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !89, file: !69, line: 112, column: 13)
!188 = !DILocation(line: 112, column: 26, scope: !187)
!189 = !DILocation(line: 112, column: 13, scope: !89)
!190 = !DILocation(line: 114, column: 26, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !69, line: 113, column: 9)
!192 = !DILocation(line: 114, column: 13, scope: !191)
!193 = !DILocation(line: 115, column: 9, scope: !191)
!194 = !DILocation(line: 123, column: 76, scope: !81)
!195 = !DILocation(line: 124, column: 74, scope: !81)
!196 = !DILocation(line: 124, column: 5, scope: !81)
!197 = !DILocation(line: 125, column: 1, scope: !81)
!198 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_22_good", scope: !69, file: !69, line: 313, type: !82, scopeLine: 314, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!199 = !DILocation(line: 315, column: 5, scope: !198)
!200 = !DILocation(line: 316, column: 5, scope: !198)
!201 = !DILocation(line: 317, column: 5, scope: !198)
!202 = !DILocation(line: 318, column: 1, scope: !198)
!203 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 329, type: !204, scopeLine: 330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!204 = !DISubroutineType(types: !205)
!205 = !{!70, !70, !206}
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !207, size: 64)
!207 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!208 = !DILocalVariable(name: "argc", arg: 1, scope: !203, file: !69, line: 329, type: !70)
!209 = !DILocation(line: 329, column: 14, scope: !203)
!210 = !DILocalVariable(name: "argv", arg: 2, scope: !203, file: !69, line: 329, type: !206)
!211 = !DILocation(line: 329, column: 27, scope: !203)
!212 = !DILocation(line: 332, column: 22, scope: !203)
!213 = !DILocation(line: 332, column: 12, scope: !203)
!214 = !DILocation(line: 332, column: 5, scope: !203)
!215 = !DILocation(line: 334, column: 5, scope: !203)
!216 = !DILocation(line: 335, column: 5, scope: !203)
!217 = !DILocation(line: 336, column: 5, scope: !203)
!218 = !DILocation(line: 339, column: 5, scope: !203)
!219 = !DILocation(line: 340, column: 5, scope: !203)
!220 = !DILocation(line: 341, column: 5, scope: !203)
!221 = !DILocation(line: 343, column: 5, scope: !203)
!222 = distinct !DISubprogram(name: "goodB2G1", scope: !69, file: !69, line: 139, type: !82, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!223 = !DILocalVariable(name: "data", scope: !222, file: !69, line: 141, type: !70)
!224 = !DILocation(line: 141, column: 9, scope: !222)
!225 = !DILocation(line: 143, column: 10, scope: !222)
!226 = !DILocalVariable(name: "recvResult", scope: !227, file: !69, line: 149, type: !70)
!227 = distinct !DILexicalBlock(scope: !222, file: !69, line: 144, column: 5)
!228 = !DILocation(line: 149, column: 13, scope: !227)
!229 = !DILocalVariable(name: "service", scope: !227, file: !69, line: 150, type: !92)
!230 = !DILocation(line: 150, column: 28, scope: !227)
!231 = !DILocalVariable(name: "listenSocket", scope: !227, file: !69, line: 151, type: !70)
!232 = !DILocation(line: 151, column: 16, scope: !227)
!233 = !DILocalVariable(name: "acceptSocket", scope: !227, file: !69, line: 152, type: !70)
!234 = !DILocation(line: 152, column: 16, scope: !227)
!235 = !DILocalVariable(name: "inputBuffer", scope: !227, file: !69, line: 153, type: !62)
!236 = !DILocation(line: 153, column: 14, scope: !227)
!237 = !DILocation(line: 154, column: 9, scope: !227)
!238 = !DILocation(line: 164, column: 28, scope: !239)
!239 = distinct !DILexicalBlock(scope: !227, file: !69, line: 155, column: 9)
!240 = !DILocation(line: 164, column: 26, scope: !239)
!241 = !DILocation(line: 165, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !69, line: 165, column: 17)
!243 = !DILocation(line: 165, column: 30, scope: !242)
!244 = !DILocation(line: 165, column: 17, scope: !239)
!245 = !DILocation(line: 167, column: 17, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !69, line: 166, column: 13)
!247 = !DILocation(line: 169, column: 13, scope: !239)
!248 = !DILocation(line: 170, column: 21, scope: !239)
!249 = !DILocation(line: 170, column: 32, scope: !239)
!250 = !DILocation(line: 171, column: 21, scope: !239)
!251 = !DILocation(line: 171, column: 30, scope: !239)
!252 = !DILocation(line: 171, column: 37, scope: !239)
!253 = !DILocation(line: 172, column: 32, scope: !239)
!254 = !DILocation(line: 172, column: 21, scope: !239)
!255 = !DILocation(line: 172, column: 30, scope: !239)
!256 = !DILocation(line: 173, column: 22, scope: !257)
!257 = distinct !DILexicalBlock(scope: !239, file: !69, line: 173, column: 17)
!258 = !DILocation(line: 173, column: 36, scope: !257)
!259 = !DILocation(line: 173, column: 17, scope: !257)
!260 = !DILocation(line: 173, column: 81, scope: !257)
!261 = !DILocation(line: 173, column: 17, scope: !239)
!262 = !DILocation(line: 175, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !257, file: !69, line: 174, column: 13)
!264 = !DILocation(line: 177, column: 24, scope: !265)
!265 = distinct !DILexicalBlock(scope: !239, file: !69, line: 177, column: 17)
!266 = !DILocation(line: 177, column: 17, scope: !265)
!267 = !DILocation(line: 177, column: 54, scope: !265)
!268 = !DILocation(line: 177, column: 17, scope: !239)
!269 = !DILocation(line: 179, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !265, file: !69, line: 178, column: 13)
!271 = !DILocation(line: 181, column: 35, scope: !239)
!272 = !DILocation(line: 181, column: 28, scope: !239)
!273 = !DILocation(line: 181, column: 26, scope: !239)
!274 = !DILocation(line: 182, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !239, file: !69, line: 182, column: 17)
!276 = !DILocation(line: 182, column: 30, scope: !275)
!277 = !DILocation(line: 182, column: 17, scope: !239)
!278 = !DILocation(line: 184, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !69, line: 183, column: 13)
!280 = !DILocation(line: 187, column: 31, scope: !239)
!281 = !DILocation(line: 187, column: 45, scope: !239)
!282 = !DILocation(line: 187, column: 26, scope: !239)
!283 = !DILocation(line: 187, column: 24, scope: !239)
!284 = !DILocation(line: 188, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !239, file: !69, line: 188, column: 17)
!286 = !DILocation(line: 188, column: 28, scope: !285)
!287 = !DILocation(line: 188, column: 44, scope: !285)
!288 = !DILocation(line: 188, column: 47, scope: !285)
!289 = !DILocation(line: 188, column: 58, scope: !285)
!290 = !DILocation(line: 188, column: 17, scope: !239)
!291 = !DILocation(line: 190, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !285, file: !69, line: 189, column: 13)
!293 = !DILocation(line: 193, column: 25, scope: !239)
!294 = !DILocation(line: 193, column: 13, scope: !239)
!295 = !DILocation(line: 193, column: 37, scope: !239)
!296 = !DILocation(line: 195, column: 25, scope: !239)
!297 = !DILocation(line: 195, column: 20, scope: !239)
!298 = !DILocation(line: 195, column: 18, scope: !239)
!299 = !DILocation(line: 196, column: 9, scope: !239)
!300 = !DILocation(line: 198, column: 13, scope: !301)
!301 = distinct !DILexicalBlock(scope: !227, file: !69, line: 198, column: 13)
!302 = !DILocation(line: 198, column: 26, scope: !301)
!303 = !DILocation(line: 198, column: 13, scope: !227)
!304 = !DILocation(line: 200, column: 26, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !69, line: 199, column: 9)
!306 = !DILocation(line: 200, column: 13, scope: !305)
!307 = !DILocation(line: 201, column: 9, scope: !305)
!308 = !DILocation(line: 202, column: 13, scope: !309)
!309 = distinct !DILexicalBlock(scope: !227, file: !69, line: 202, column: 13)
!310 = !DILocation(line: 202, column: 26, scope: !309)
!311 = !DILocation(line: 202, column: 13, scope: !227)
!312 = !DILocation(line: 204, column: 26, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !69, line: 203, column: 9)
!314 = !DILocation(line: 204, column: 13, scope: !313)
!315 = !DILocation(line: 205, column: 9, scope: !313)
!316 = !DILocation(line: 213, column: 81, scope: !222)
!317 = !DILocation(line: 214, column: 79, scope: !222)
!318 = !DILocation(line: 214, column: 5, scope: !222)
!319 = !DILocation(line: 215, column: 1, scope: !222)
!320 = distinct !DISubprogram(name: "goodB2G2", scope: !69, file: !69, line: 220, type: !82, scopeLine: 221, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!321 = !DILocalVariable(name: "data", scope: !320, file: !69, line: 222, type: !70)
!322 = !DILocation(line: 222, column: 9, scope: !320)
!323 = !DILocation(line: 224, column: 10, scope: !320)
!324 = !DILocalVariable(name: "recvResult", scope: !325, file: !69, line: 230, type: !70)
!325 = distinct !DILexicalBlock(scope: !320, file: !69, line: 225, column: 5)
!326 = !DILocation(line: 230, column: 13, scope: !325)
!327 = !DILocalVariable(name: "service", scope: !325, file: !69, line: 231, type: !92)
!328 = !DILocation(line: 231, column: 28, scope: !325)
!329 = !DILocalVariable(name: "listenSocket", scope: !325, file: !69, line: 232, type: !70)
!330 = !DILocation(line: 232, column: 16, scope: !325)
!331 = !DILocalVariable(name: "acceptSocket", scope: !325, file: !69, line: 233, type: !70)
!332 = !DILocation(line: 233, column: 16, scope: !325)
!333 = !DILocalVariable(name: "inputBuffer", scope: !325, file: !69, line: 234, type: !62)
!334 = !DILocation(line: 234, column: 14, scope: !325)
!335 = !DILocation(line: 235, column: 9, scope: !325)
!336 = !DILocation(line: 245, column: 28, scope: !337)
!337 = distinct !DILexicalBlock(scope: !325, file: !69, line: 236, column: 9)
!338 = !DILocation(line: 245, column: 26, scope: !337)
!339 = !DILocation(line: 246, column: 17, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !69, line: 246, column: 17)
!341 = !DILocation(line: 246, column: 30, scope: !340)
!342 = !DILocation(line: 246, column: 17, scope: !337)
!343 = !DILocation(line: 248, column: 17, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !69, line: 247, column: 13)
!345 = !DILocation(line: 250, column: 13, scope: !337)
!346 = !DILocation(line: 251, column: 21, scope: !337)
!347 = !DILocation(line: 251, column: 32, scope: !337)
!348 = !DILocation(line: 252, column: 21, scope: !337)
!349 = !DILocation(line: 252, column: 30, scope: !337)
!350 = !DILocation(line: 252, column: 37, scope: !337)
!351 = !DILocation(line: 253, column: 32, scope: !337)
!352 = !DILocation(line: 253, column: 21, scope: !337)
!353 = !DILocation(line: 253, column: 30, scope: !337)
!354 = !DILocation(line: 254, column: 22, scope: !355)
!355 = distinct !DILexicalBlock(scope: !337, file: !69, line: 254, column: 17)
!356 = !DILocation(line: 254, column: 36, scope: !355)
!357 = !DILocation(line: 254, column: 17, scope: !355)
!358 = !DILocation(line: 254, column: 81, scope: !355)
!359 = !DILocation(line: 254, column: 17, scope: !337)
!360 = !DILocation(line: 256, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !355, file: !69, line: 255, column: 13)
!362 = !DILocation(line: 258, column: 24, scope: !363)
!363 = distinct !DILexicalBlock(scope: !337, file: !69, line: 258, column: 17)
!364 = !DILocation(line: 258, column: 17, scope: !363)
!365 = !DILocation(line: 258, column: 54, scope: !363)
!366 = !DILocation(line: 258, column: 17, scope: !337)
!367 = !DILocation(line: 260, column: 17, scope: !368)
!368 = distinct !DILexicalBlock(scope: !363, file: !69, line: 259, column: 13)
!369 = !DILocation(line: 262, column: 35, scope: !337)
!370 = !DILocation(line: 262, column: 28, scope: !337)
!371 = !DILocation(line: 262, column: 26, scope: !337)
!372 = !DILocation(line: 263, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !337, file: !69, line: 263, column: 17)
!374 = !DILocation(line: 263, column: 30, scope: !373)
!375 = !DILocation(line: 263, column: 17, scope: !337)
!376 = !DILocation(line: 265, column: 17, scope: !377)
!377 = distinct !DILexicalBlock(scope: !373, file: !69, line: 264, column: 13)
!378 = !DILocation(line: 268, column: 31, scope: !337)
!379 = !DILocation(line: 268, column: 45, scope: !337)
!380 = !DILocation(line: 268, column: 26, scope: !337)
!381 = !DILocation(line: 268, column: 24, scope: !337)
!382 = !DILocation(line: 269, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !337, file: !69, line: 269, column: 17)
!384 = !DILocation(line: 269, column: 28, scope: !383)
!385 = !DILocation(line: 269, column: 44, scope: !383)
!386 = !DILocation(line: 269, column: 47, scope: !383)
!387 = !DILocation(line: 269, column: 58, scope: !383)
!388 = !DILocation(line: 269, column: 17, scope: !337)
!389 = !DILocation(line: 271, column: 17, scope: !390)
!390 = distinct !DILexicalBlock(scope: !383, file: !69, line: 270, column: 13)
!391 = !DILocation(line: 274, column: 25, scope: !337)
!392 = !DILocation(line: 274, column: 13, scope: !337)
!393 = !DILocation(line: 274, column: 37, scope: !337)
!394 = !DILocation(line: 276, column: 25, scope: !337)
!395 = !DILocation(line: 276, column: 20, scope: !337)
!396 = !DILocation(line: 276, column: 18, scope: !337)
!397 = !DILocation(line: 277, column: 9, scope: !337)
!398 = !DILocation(line: 279, column: 13, scope: !399)
!399 = distinct !DILexicalBlock(scope: !325, file: !69, line: 279, column: 13)
!400 = !DILocation(line: 279, column: 26, scope: !399)
!401 = !DILocation(line: 279, column: 13, scope: !325)
!402 = !DILocation(line: 281, column: 26, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !69, line: 280, column: 9)
!404 = !DILocation(line: 281, column: 13, scope: !403)
!405 = !DILocation(line: 282, column: 9, scope: !403)
!406 = !DILocation(line: 283, column: 13, scope: !407)
!407 = distinct !DILexicalBlock(scope: !325, file: !69, line: 283, column: 13)
!408 = !DILocation(line: 283, column: 26, scope: !407)
!409 = !DILocation(line: 283, column: 13, scope: !325)
!410 = !DILocation(line: 285, column: 26, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !69, line: 284, column: 9)
!412 = !DILocation(line: 285, column: 13, scope: !411)
!413 = !DILocation(line: 286, column: 9, scope: !411)
!414 = !DILocation(line: 294, column: 81, scope: !320)
!415 = !DILocation(line: 295, column: 79, scope: !320)
!416 = !DILocation(line: 295, column: 5, scope: !320)
!417 = !DILocation(line: 296, column: 1, scope: !320)
!418 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 301, type: !82, scopeLine: 302, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!419 = !DILocalVariable(name: "data", scope: !418, file: !69, line: 303, type: !70)
!420 = !DILocation(line: 303, column: 9, scope: !418)
!421 = !DILocation(line: 305, column: 10, scope: !418)
!422 = !DILocation(line: 308, column: 10, scope: !418)
!423 = !DILocation(line: 309, column: 80, scope: !418)
!424 = !DILocation(line: 310, column: 78, scope: !418)
!425 = !DILocation(line: 310, column: 5, scope: !418)
!426 = !DILocation(line: 311, column: 1, scope: !418)
