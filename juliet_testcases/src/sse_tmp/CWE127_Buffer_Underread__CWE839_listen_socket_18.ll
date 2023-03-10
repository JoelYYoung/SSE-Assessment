; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_18.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_18_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  br label %source, !dbg !79

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !80), !dbg !81
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !82, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !85, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 -1, i32* %listenSocket, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %acceptSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  br label %do.body, !dbg !109

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !110
  store i32 %call, i32* %listenSocket, align 4, !dbg !112
  %0 = load i32, i32* %listenSocket, align 4, !dbg !113
  %cmp = icmp eq i32 %0, -1, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !117

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !119
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !120
  store i16 2, i16* %sin_family, align 4, !dbg !121
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !122
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !123
  store i32 0, i32* %s_addr, align 4, !dbg !124
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !125
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !126
  store i16 %call1, i16* %sin_port, align 2, !dbg !127
  %2 = load i32, i32* %listenSocket, align 4, !dbg !128
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !130
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !131
  %cmp3 = icmp eq i32 %call2, -1, !dbg !132
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !133

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !134

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !136
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !138
  %cmp7 = icmp eq i32 %call6, -1, !dbg !139
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !140

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !141

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !143
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !144
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !145
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !146
  %cmp11 = icmp eq i32 %6, -1, !dbg !148
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !149

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !150

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !152
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !153
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !154
  %conv = trunc i64 %call14 to i32, !dbg !154
  store i32 %conv, i32* %recvResult, align 4, !dbg !155
  %8 = load i32, i32* %recvResult, align 4, !dbg !156
  %cmp15 = icmp eq i32 %8, -1, !dbg !158
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !159

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !160
  %cmp17 = icmp eq i32 %9, 0, !dbg !161
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !162

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !163

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !165
  %idxprom = sext i32 %10 to i64, !dbg !166
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !166
  store i8 0, i8* %arrayidx, align 1, !dbg !167
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !168
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !169
  store i32 %call22, i32* %data, align 4, !dbg !170
  br label %do.end, !dbg !171

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !172
  %cmp23 = icmp ne i32 %11, -1, !dbg !174
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !175

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !176
  %call26 = call i32 @close(i32 %12), !dbg !178
  br label %if.end27, !dbg !179

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !180
  %cmp28 = icmp ne i32 %13, -1, !dbg !182
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !183

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !184
  %call31 = call i32 @close(i32 %14), !dbg !186
  br label %if.end32, !dbg !187

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %sink, !dbg !188

sink:                                             ; preds = %if.end32
  call void @llvm.dbg.label(metadata !189), !dbg !190
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !191, metadata !DIExpression()), !dbg !196
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !196
  %16 = load i32, i32* %data, align 4, !dbg !197
  %cmp33 = icmp slt i32 %16, 10, !dbg !199
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !200

if.then35:                                        ; preds = %sink
  %17 = load i32, i32* %data, align 4, !dbg !201
  %idxprom36 = sext i32 %17 to i64, !dbg !203
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !203
  %18 = load i32, i32* %arrayidx37, align 4, !dbg !203
  call void @printIntLine(i32 %18), !dbg !204
  br label %if.end38, !dbg !205

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !206
  br label %if.end38

if.end38:                                         ; preds = %if.else, %if.then35
  ret void, !dbg !208
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_18_good() #0 !dbg !209 {
entry:
  call void @goodB2G(), !dbg !210
  call void @goodG2B(), !dbg !211
  ret void, !dbg !212
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !213 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !218, metadata !DIExpression()), !dbg !219
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !220, metadata !DIExpression()), !dbg !221
  %call = call i64 @time(i64* null) #7, !dbg !222
  %conv = trunc i64 %call to i32, !dbg !223
  call void @srand(i32 %conv) #7, !dbg !224
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !225
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_18_good(), !dbg !226
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !227
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !228
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_18_bad(), !dbg !229
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !230
  ret i32 0, !dbg !231
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !232 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !233, metadata !DIExpression()), !dbg !234
  store i32 -1, i32* %data, align 4, !dbg !235
  br label %source, !dbg !236

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !237), !dbg !238
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !239, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !242, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !244, metadata !DIExpression()), !dbg !245
  store i32 -1, i32* %listenSocket, align 4, !dbg !245
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !246, metadata !DIExpression()), !dbg !247
  store i32 -1, i32* %acceptSocket, align 4, !dbg !247
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !248, metadata !DIExpression()), !dbg !249
  br label %do.body, !dbg !250

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !251
  store i32 %call, i32* %listenSocket, align 4, !dbg !253
  %0 = load i32, i32* %listenSocket, align 4, !dbg !254
  %cmp = icmp eq i32 %0, -1, !dbg !256
  br i1 %cmp, label %if.then, label %if.end, !dbg !257

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !258

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !260
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !260
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !261
  store i16 2, i16* %sin_family, align 4, !dbg !262
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !263
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !264
  store i32 0, i32* %s_addr, align 4, !dbg !265
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !266
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !267
  store i16 %call1, i16* %sin_port, align 2, !dbg !268
  %2 = load i32, i32* %listenSocket, align 4, !dbg !269
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !271
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !272
  %cmp3 = icmp eq i32 %call2, -1, !dbg !273
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !274

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !275

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !277
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !279
  %cmp7 = icmp eq i32 %call6, -1, !dbg !280
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !281

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !282

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !284
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !285
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !286
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !287
  %cmp11 = icmp eq i32 %6, -1, !dbg !289
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !290

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !291

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !293
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !294
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !295
  %conv = trunc i64 %call14 to i32, !dbg !295
  store i32 %conv, i32* %recvResult, align 4, !dbg !296
  %8 = load i32, i32* %recvResult, align 4, !dbg !297
  %cmp15 = icmp eq i32 %8, -1, !dbg !299
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !300

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !301
  %cmp17 = icmp eq i32 %9, 0, !dbg !302
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !303

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !304

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !306
  %idxprom = sext i32 %10 to i64, !dbg !307
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !307
  store i8 0, i8* %arrayidx, align 1, !dbg !308
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !309
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !310
  store i32 %call22, i32* %data, align 4, !dbg !311
  br label %do.end, !dbg !312

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !313
  %cmp23 = icmp ne i32 %11, -1, !dbg !315
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !316

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !317
  %call26 = call i32 @close(i32 %12), !dbg !319
  br label %if.end27, !dbg !320

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !321
  %cmp28 = icmp ne i32 %13, -1, !dbg !323
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !324

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !325
  %call31 = call i32 @close(i32 %14), !dbg !327
  br label %if.end32, !dbg !328

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %sink, !dbg !329

sink:                                             ; preds = %if.end32
  call void @llvm.dbg.label(metadata !330), !dbg !331
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !332, metadata !DIExpression()), !dbg !334
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !334
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !334
  %16 = load i32, i32* %data, align 4, !dbg !335
  %cmp33 = icmp sge i32 %16, 0, !dbg !337
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !338

land.lhs.true:                                    ; preds = %sink
  %17 = load i32, i32* %data, align 4, !dbg !339
  %cmp35 = icmp slt i32 %17, 10, !dbg !340
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !341

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !342
  %idxprom38 = sext i32 %18 to i64, !dbg !344
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !344
  %19 = load i32, i32* %arrayidx39, align 4, !dbg !344
  call void @printIntLine(i32 %19), !dbg !345
  br label %if.end40, !dbg !346

if.else:                                          ; preds = %land.lhs.true, %sink
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !347
  br label %if.end40

if.end40:                                         ; preds = %if.else, %if.then37
  ret void, !dbg !349
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !350 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !351, metadata !DIExpression()), !dbg !352
  store i32 -1, i32* %data, align 4, !dbg !353
  br label %source, !dbg !354

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !355), !dbg !356
  store i32 7, i32* %data, align 4, !dbg !357
  br label %sink, !dbg !358

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !359), !dbg !360
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !361, metadata !DIExpression()), !dbg !363
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !363
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !363
  %1 = load i32, i32* %data, align 4, !dbg !364
  %cmp = icmp slt i32 %1, 10, !dbg !366
  br i1 %cmp, label %if.then, label %if.else, !dbg !367

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !368
  %idxprom = sext i32 %2 to i64, !dbg !370
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !370
  %3 = load i32, i32* %arrayidx, align 4, !dbg !370
  call void @printIntLine(i32 %3), !dbg !371
  br label %if.end, !dbg !372

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !373
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !375
}

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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !51, !5}
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
!64 = !{i32 7, !"Dwarf Version", i32 4}
!65 = !{i32 2, !"Debug Info Version", i32 3}
!66 = !{i32 1, !"wchar_size", i32 4}
!67 = !{i32 7, !"uwtable", i32 1}
!68 = !{i32 7, !"frame-pointer", i32 2}
!69 = !{!"clang version 13.0.0"}
!70 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_18_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_18.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocation(line: 49, column: 5, scope: !70)
!80 = !DILabel(scope: !70, name: "source", file: !71, line: 50)
!81 = !DILocation(line: 50, column: 1, scope: !70)
!82 = !DILocalVariable(name: "recvResult", scope: !83, file: !71, line: 56, type: !76)
!83 = distinct !DILexicalBlock(scope: !70, file: !71, line: 51, column: 5)
!84 = !DILocation(line: 56, column: 13, scope: !83)
!85 = !DILocalVariable(name: "service", scope: !83, file: !71, line: 57, type: !86)
!86 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !87)
!87 = !{!88, !89, !93, !97}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !86, file: !17, line: 240, baseType: !56, size: 16)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !86, file: !17, line: 241, baseType: !90, size: 16, offset: 16)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !86, file: !17, line: 242, baseType: !94, size: 32, offset: 32)
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !95)
!95 = !{!96}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !94, file: !17, line: 33, baseType: !46, size: 32)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !86, file: !17, line: 245, baseType: !98, size: 64, offset: 64)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !99, size: 64, elements: !100)
!99 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!100 = !{!101}
!101 = !DISubrange(count: 8)
!102 = !DILocation(line: 57, column: 28, scope: !83)
!103 = !DILocalVariable(name: "listenSocket", scope: !83, file: !71, line: 58, type: !76)
!104 = !DILocation(line: 58, column: 16, scope: !83)
!105 = !DILocalVariable(name: "acceptSocket", scope: !83, file: !71, line: 59, type: !76)
!106 = !DILocation(line: 59, column: 16, scope: !83)
!107 = !DILocalVariable(name: "inputBuffer", scope: !83, file: !71, line: 60, type: !60)
!108 = !DILocation(line: 60, column: 14, scope: !83)
!109 = !DILocation(line: 61, column: 9, scope: !83)
!110 = !DILocation(line: 71, column: 28, scope: !111)
!111 = distinct !DILexicalBlock(scope: !83, file: !71, line: 62, column: 9)
!112 = !DILocation(line: 71, column: 26, scope: !111)
!113 = !DILocation(line: 72, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !71, line: 72, column: 17)
!115 = !DILocation(line: 72, column: 30, scope: !114)
!116 = !DILocation(line: 72, column: 17, scope: !111)
!117 = !DILocation(line: 74, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !71, line: 73, column: 13)
!119 = !DILocation(line: 76, column: 13, scope: !111)
!120 = !DILocation(line: 77, column: 21, scope: !111)
!121 = !DILocation(line: 77, column: 32, scope: !111)
!122 = !DILocation(line: 78, column: 21, scope: !111)
!123 = !DILocation(line: 78, column: 30, scope: !111)
!124 = !DILocation(line: 78, column: 37, scope: !111)
!125 = !DILocation(line: 79, column: 32, scope: !111)
!126 = !DILocation(line: 79, column: 21, scope: !111)
!127 = !DILocation(line: 79, column: 30, scope: !111)
!128 = !DILocation(line: 80, column: 22, scope: !129)
!129 = distinct !DILexicalBlock(scope: !111, file: !71, line: 80, column: 17)
!130 = !DILocation(line: 80, column: 36, scope: !129)
!131 = !DILocation(line: 80, column: 17, scope: !129)
!132 = !DILocation(line: 80, column: 81, scope: !129)
!133 = !DILocation(line: 80, column: 17, scope: !111)
!134 = !DILocation(line: 82, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !71, line: 81, column: 13)
!136 = !DILocation(line: 84, column: 24, scope: !137)
!137 = distinct !DILexicalBlock(scope: !111, file: !71, line: 84, column: 17)
!138 = !DILocation(line: 84, column: 17, scope: !137)
!139 = !DILocation(line: 84, column: 54, scope: !137)
!140 = !DILocation(line: 84, column: 17, scope: !111)
!141 = !DILocation(line: 86, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !71, line: 85, column: 13)
!143 = !DILocation(line: 88, column: 35, scope: !111)
!144 = !DILocation(line: 88, column: 28, scope: !111)
!145 = !DILocation(line: 88, column: 26, scope: !111)
!146 = !DILocation(line: 89, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !111, file: !71, line: 89, column: 17)
!148 = !DILocation(line: 89, column: 30, scope: !147)
!149 = !DILocation(line: 89, column: 17, scope: !111)
!150 = !DILocation(line: 91, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !71, line: 90, column: 13)
!152 = !DILocation(line: 94, column: 31, scope: !111)
!153 = !DILocation(line: 94, column: 45, scope: !111)
!154 = !DILocation(line: 94, column: 26, scope: !111)
!155 = !DILocation(line: 94, column: 24, scope: !111)
!156 = !DILocation(line: 95, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !111, file: !71, line: 95, column: 17)
!158 = !DILocation(line: 95, column: 28, scope: !157)
!159 = !DILocation(line: 95, column: 44, scope: !157)
!160 = !DILocation(line: 95, column: 47, scope: !157)
!161 = !DILocation(line: 95, column: 58, scope: !157)
!162 = !DILocation(line: 95, column: 17, scope: !111)
!163 = !DILocation(line: 97, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !71, line: 96, column: 13)
!165 = !DILocation(line: 100, column: 25, scope: !111)
!166 = !DILocation(line: 100, column: 13, scope: !111)
!167 = !DILocation(line: 100, column: 37, scope: !111)
!168 = !DILocation(line: 102, column: 25, scope: !111)
!169 = !DILocation(line: 102, column: 20, scope: !111)
!170 = !DILocation(line: 102, column: 18, scope: !111)
!171 = !DILocation(line: 103, column: 9, scope: !111)
!172 = !DILocation(line: 105, column: 13, scope: !173)
!173 = distinct !DILexicalBlock(scope: !83, file: !71, line: 105, column: 13)
!174 = !DILocation(line: 105, column: 26, scope: !173)
!175 = !DILocation(line: 105, column: 13, scope: !83)
!176 = !DILocation(line: 107, column: 26, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !71, line: 106, column: 9)
!178 = !DILocation(line: 107, column: 13, scope: !177)
!179 = !DILocation(line: 108, column: 9, scope: !177)
!180 = !DILocation(line: 109, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !83, file: !71, line: 109, column: 13)
!182 = !DILocation(line: 109, column: 26, scope: !181)
!183 = !DILocation(line: 109, column: 13, scope: !83)
!184 = !DILocation(line: 111, column: 26, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !71, line: 110, column: 9)
!186 = !DILocation(line: 111, column: 13, scope: !185)
!187 = !DILocation(line: 112, column: 9, scope: !185)
!188 = !DILocation(line: 120, column: 5, scope: !70)
!189 = !DILabel(scope: !70, name: "sink", file: !71, line: 121)
!190 = !DILocation(line: 121, column: 1, scope: !70)
!191 = !DILocalVariable(name: "buffer", scope: !192, file: !71, line: 123, type: !193)
!192 = distinct !DILexicalBlock(scope: !70, file: !71, line: 122, column: 5)
!193 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !194)
!194 = !{!195}
!195 = !DISubrange(count: 10)
!196 = !DILocation(line: 123, column: 13, scope: !192)
!197 = !DILocation(line: 126, column: 13, scope: !198)
!198 = distinct !DILexicalBlock(scope: !192, file: !71, line: 126, column: 13)
!199 = !DILocation(line: 126, column: 18, scope: !198)
!200 = !DILocation(line: 126, column: 13, scope: !192)
!201 = !DILocation(line: 128, column: 33, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !71, line: 127, column: 9)
!203 = !DILocation(line: 128, column: 26, scope: !202)
!204 = !DILocation(line: 128, column: 13, scope: !202)
!205 = !DILocation(line: 129, column: 9, scope: !202)
!206 = !DILocation(line: 132, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !198, file: !71, line: 131, column: 9)
!208 = !DILocation(line: 135, column: 1, scope: !70)
!209 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_18_good", scope: !71, file: !71, line: 262, type: !72, scopeLine: 263, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!210 = !DILocation(line: 264, column: 5, scope: !209)
!211 = !DILocation(line: 265, column: 5, scope: !209)
!212 = !DILocation(line: 266, column: 1, scope: !209)
!213 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 277, type: !214, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!214 = !DISubroutineType(types: !215)
!215 = !{!76, !76, !216}
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64)
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!218 = !DILocalVariable(name: "argc", arg: 1, scope: !213, file: !71, line: 277, type: !76)
!219 = !DILocation(line: 277, column: 14, scope: !213)
!220 = !DILocalVariable(name: "argv", arg: 2, scope: !213, file: !71, line: 277, type: !216)
!221 = !DILocation(line: 277, column: 27, scope: !213)
!222 = !DILocation(line: 280, column: 22, scope: !213)
!223 = !DILocation(line: 280, column: 12, scope: !213)
!224 = !DILocation(line: 280, column: 5, scope: !213)
!225 = !DILocation(line: 282, column: 5, scope: !213)
!226 = !DILocation(line: 283, column: 5, scope: !213)
!227 = !DILocation(line: 284, column: 5, scope: !213)
!228 = !DILocation(line: 287, column: 5, scope: !213)
!229 = !DILocation(line: 288, column: 5, scope: !213)
!230 = !DILocation(line: 289, column: 5, scope: !213)
!231 = !DILocation(line: 291, column: 5, scope: !213)
!232 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 142, type: !72, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!233 = !DILocalVariable(name: "data", scope: !232, file: !71, line: 144, type: !76)
!234 = !DILocation(line: 144, column: 9, scope: !232)
!235 = !DILocation(line: 146, column: 10, scope: !232)
!236 = !DILocation(line: 147, column: 5, scope: !232)
!237 = !DILabel(scope: !232, name: "source", file: !71, line: 148)
!238 = !DILocation(line: 148, column: 1, scope: !232)
!239 = !DILocalVariable(name: "recvResult", scope: !240, file: !71, line: 154, type: !76)
!240 = distinct !DILexicalBlock(scope: !232, file: !71, line: 149, column: 5)
!241 = !DILocation(line: 154, column: 13, scope: !240)
!242 = !DILocalVariable(name: "service", scope: !240, file: !71, line: 155, type: !86)
!243 = !DILocation(line: 155, column: 28, scope: !240)
!244 = !DILocalVariable(name: "listenSocket", scope: !240, file: !71, line: 156, type: !76)
!245 = !DILocation(line: 156, column: 16, scope: !240)
!246 = !DILocalVariable(name: "acceptSocket", scope: !240, file: !71, line: 157, type: !76)
!247 = !DILocation(line: 157, column: 16, scope: !240)
!248 = !DILocalVariable(name: "inputBuffer", scope: !240, file: !71, line: 158, type: !60)
!249 = !DILocation(line: 158, column: 14, scope: !240)
!250 = !DILocation(line: 159, column: 9, scope: !240)
!251 = !DILocation(line: 169, column: 28, scope: !252)
!252 = distinct !DILexicalBlock(scope: !240, file: !71, line: 160, column: 9)
!253 = !DILocation(line: 169, column: 26, scope: !252)
!254 = !DILocation(line: 170, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !71, line: 170, column: 17)
!256 = !DILocation(line: 170, column: 30, scope: !255)
!257 = !DILocation(line: 170, column: 17, scope: !252)
!258 = !DILocation(line: 172, column: 17, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !71, line: 171, column: 13)
!260 = !DILocation(line: 174, column: 13, scope: !252)
!261 = !DILocation(line: 175, column: 21, scope: !252)
!262 = !DILocation(line: 175, column: 32, scope: !252)
!263 = !DILocation(line: 176, column: 21, scope: !252)
!264 = !DILocation(line: 176, column: 30, scope: !252)
!265 = !DILocation(line: 176, column: 37, scope: !252)
!266 = !DILocation(line: 177, column: 32, scope: !252)
!267 = !DILocation(line: 177, column: 21, scope: !252)
!268 = !DILocation(line: 177, column: 30, scope: !252)
!269 = !DILocation(line: 178, column: 22, scope: !270)
!270 = distinct !DILexicalBlock(scope: !252, file: !71, line: 178, column: 17)
!271 = !DILocation(line: 178, column: 36, scope: !270)
!272 = !DILocation(line: 178, column: 17, scope: !270)
!273 = !DILocation(line: 178, column: 81, scope: !270)
!274 = !DILocation(line: 178, column: 17, scope: !252)
!275 = !DILocation(line: 180, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !270, file: !71, line: 179, column: 13)
!277 = !DILocation(line: 182, column: 24, scope: !278)
!278 = distinct !DILexicalBlock(scope: !252, file: !71, line: 182, column: 17)
!279 = !DILocation(line: 182, column: 17, scope: !278)
!280 = !DILocation(line: 182, column: 54, scope: !278)
!281 = !DILocation(line: 182, column: 17, scope: !252)
!282 = !DILocation(line: 184, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !278, file: !71, line: 183, column: 13)
!284 = !DILocation(line: 186, column: 35, scope: !252)
!285 = !DILocation(line: 186, column: 28, scope: !252)
!286 = !DILocation(line: 186, column: 26, scope: !252)
!287 = !DILocation(line: 187, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !252, file: !71, line: 187, column: 17)
!289 = !DILocation(line: 187, column: 30, scope: !288)
!290 = !DILocation(line: 187, column: 17, scope: !252)
!291 = !DILocation(line: 189, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !71, line: 188, column: 13)
!293 = !DILocation(line: 192, column: 31, scope: !252)
!294 = !DILocation(line: 192, column: 45, scope: !252)
!295 = !DILocation(line: 192, column: 26, scope: !252)
!296 = !DILocation(line: 192, column: 24, scope: !252)
!297 = !DILocation(line: 193, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !252, file: !71, line: 193, column: 17)
!299 = !DILocation(line: 193, column: 28, scope: !298)
!300 = !DILocation(line: 193, column: 44, scope: !298)
!301 = !DILocation(line: 193, column: 47, scope: !298)
!302 = !DILocation(line: 193, column: 58, scope: !298)
!303 = !DILocation(line: 193, column: 17, scope: !252)
!304 = !DILocation(line: 195, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !298, file: !71, line: 194, column: 13)
!306 = !DILocation(line: 198, column: 25, scope: !252)
!307 = !DILocation(line: 198, column: 13, scope: !252)
!308 = !DILocation(line: 198, column: 37, scope: !252)
!309 = !DILocation(line: 200, column: 25, scope: !252)
!310 = !DILocation(line: 200, column: 20, scope: !252)
!311 = !DILocation(line: 200, column: 18, scope: !252)
!312 = !DILocation(line: 201, column: 9, scope: !252)
!313 = !DILocation(line: 203, column: 13, scope: !314)
!314 = distinct !DILexicalBlock(scope: !240, file: !71, line: 203, column: 13)
!315 = !DILocation(line: 203, column: 26, scope: !314)
!316 = !DILocation(line: 203, column: 13, scope: !240)
!317 = !DILocation(line: 205, column: 26, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !71, line: 204, column: 9)
!319 = !DILocation(line: 205, column: 13, scope: !318)
!320 = !DILocation(line: 206, column: 9, scope: !318)
!321 = !DILocation(line: 207, column: 13, scope: !322)
!322 = distinct !DILexicalBlock(scope: !240, file: !71, line: 207, column: 13)
!323 = !DILocation(line: 207, column: 26, scope: !322)
!324 = !DILocation(line: 207, column: 13, scope: !240)
!325 = !DILocation(line: 209, column: 26, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !71, line: 208, column: 9)
!327 = !DILocation(line: 209, column: 13, scope: !326)
!328 = !DILocation(line: 210, column: 9, scope: !326)
!329 = !DILocation(line: 218, column: 5, scope: !232)
!330 = !DILabel(scope: !232, name: "sink", file: !71, line: 219)
!331 = !DILocation(line: 219, column: 1, scope: !232)
!332 = !DILocalVariable(name: "buffer", scope: !333, file: !71, line: 221, type: !193)
!333 = distinct !DILexicalBlock(scope: !232, file: !71, line: 220, column: 5)
!334 = !DILocation(line: 221, column: 13, scope: !333)
!335 = !DILocation(line: 223, column: 13, scope: !336)
!336 = distinct !DILexicalBlock(scope: !333, file: !71, line: 223, column: 13)
!337 = !DILocation(line: 223, column: 18, scope: !336)
!338 = !DILocation(line: 223, column: 23, scope: !336)
!339 = !DILocation(line: 223, column: 26, scope: !336)
!340 = !DILocation(line: 223, column: 31, scope: !336)
!341 = !DILocation(line: 223, column: 13, scope: !333)
!342 = !DILocation(line: 225, column: 33, scope: !343)
!343 = distinct !DILexicalBlock(scope: !336, file: !71, line: 224, column: 9)
!344 = !DILocation(line: 225, column: 26, scope: !343)
!345 = !DILocation(line: 225, column: 13, scope: !343)
!346 = !DILocation(line: 226, column: 9, scope: !343)
!347 = !DILocation(line: 229, column: 13, scope: !348)
!348 = distinct !DILexicalBlock(scope: !336, file: !71, line: 228, column: 9)
!349 = !DILocation(line: 232, column: 1, scope: !232)
!350 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 235, type: !72, scopeLine: 236, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!351 = !DILocalVariable(name: "data", scope: !350, file: !71, line: 237, type: !76)
!352 = !DILocation(line: 237, column: 9, scope: !350)
!353 = !DILocation(line: 239, column: 10, scope: !350)
!354 = !DILocation(line: 240, column: 5, scope: !350)
!355 = !DILabel(scope: !350, name: "source", file: !71, line: 241)
!356 = !DILocation(line: 241, column: 1, scope: !350)
!357 = !DILocation(line: 244, column: 10, scope: !350)
!358 = !DILocation(line: 245, column: 5, scope: !350)
!359 = !DILabel(scope: !350, name: "sink", file: !71, line: 246)
!360 = !DILocation(line: 246, column: 1, scope: !350)
!361 = !DILocalVariable(name: "buffer", scope: !362, file: !71, line: 248, type: !193)
!362 = distinct !DILexicalBlock(scope: !350, file: !71, line: 247, column: 5)
!363 = !DILocation(line: 248, column: 13, scope: !362)
!364 = !DILocation(line: 251, column: 13, scope: !365)
!365 = distinct !DILexicalBlock(scope: !362, file: !71, line: 251, column: 13)
!366 = !DILocation(line: 251, column: 18, scope: !365)
!367 = !DILocation(line: 251, column: 13, scope: !362)
!368 = !DILocation(line: 253, column: 33, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !71, line: 252, column: 9)
!370 = !DILocation(line: 253, column: 26, scope: !369)
!371 = !DILocation(line: 253, column: 13, scope: !369)
!372 = !DILocation(line: 254, column: 9, scope: !369)
!373 = !DILocation(line: 257, column: 13, scope: !374)
!374 = distinct !DILexicalBlock(scope: !365, file: !71, line: 256, column: 9)
!375 = !DILocation(line: 260, column: 1, scope: !350)
