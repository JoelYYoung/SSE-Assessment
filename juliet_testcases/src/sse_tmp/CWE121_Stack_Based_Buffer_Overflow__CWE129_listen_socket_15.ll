; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_15.c"
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
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_15_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !82, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %listenSocket, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %acceptSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  br label %do.body, !dbg !106

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !107
  store i32 %call, i32* %listenSocket, align 4, !dbg !109
  %0 = load i32, i32* %listenSocket, align 4, !dbg !110
  %cmp = icmp eq i32 %0, -1, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !114

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !116
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !117
  store i16 2, i16* %sin_family, align 4, !dbg !118
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !119
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !120
  store i32 0, i32* %s_addr, align 4, !dbg !121
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !122
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !123
  store i16 %call1, i16* %sin_port, align 2, !dbg !124
  %2 = load i32, i32* %listenSocket, align 4, !dbg !125
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !127
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !128
  %cmp3 = icmp eq i32 %call2, -1, !dbg !129
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !130

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !131

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !133
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !135
  %cmp7 = icmp eq i32 %call6, -1, !dbg !136
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !137

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !138

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !141
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !142
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !143
  %cmp11 = icmp eq i32 %6, -1, !dbg !145
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !146

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !147

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !149
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !150
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !151
  %conv = trunc i64 %call14 to i32, !dbg !151
  store i32 %conv, i32* %recvResult, align 4, !dbg !152
  %8 = load i32, i32* %recvResult, align 4, !dbg !153
  %cmp15 = icmp eq i32 %8, -1, !dbg !155
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !156

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !157
  %cmp17 = icmp eq i32 %9, 0, !dbg !158
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !159

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !160

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !162
  %idxprom = sext i32 %10 to i64, !dbg !163
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !163
  store i8 0, i8* %arrayidx, align 1, !dbg !164
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !165
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !166
  store i32 %call22, i32* %data, align 4, !dbg !167
  br label %do.end, !dbg !168

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !169
  %cmp23 = icmp ne i32 %11, -1, !dbg !171
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !172

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !173
  %call26 = call i32 @close(i32 %12), !dbg !175
  br label %if.end27, !dbg !176

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !177
  %cmp28 = icmp ne i32 %13, -1, !dbg !179
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !180

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !181
  %call31 = call i32 @close(i32 %14), !dbg !183
  br label %if.end32, !dbg !184

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !185, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !188, metadata !DIExpression()), !dbg !192
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !192
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !192
  %16 = load i32, i32* %data, align 4, !dbg !193
  %cmp33 = icmp sge i32 %16, 0, !dbg !195
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !196

if.then35:                                        ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !197
  %idxprom36 = sext i32 %17 to i64, !dbg !199
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !199
  store i32 1, i32* %arrayidx37, align 4, !dbg !200
  store i32 0, i32* %i, align 4, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %if.then35
  %18 = load i32, i32* %i, align 4, !dbg !204
  %cmp38 = icmp slt i32 %18, 10, !dbg !206
  br i1 %cmp38, label %for.body, label %for.end, !dbg !207

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !208
  %idxprom40 = sext i32 %19 to i64, !dbg !210
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom40, !dbg !210
  %20 = load i32, i32* %arrayidx41, align 4, !dbg !210
  call void @printIntLine(i32 %20), !dbg !211
  br label %for.inc, !dbg !212

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !213
  %inc = add nsw i32 %21, 1, !dbg !213
  store i32 %inc, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !214, !llvm.loop !215

for.end:                                          ; preds = %for.cond
  br label %if.end42, !dbg !218

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !219
  br label %if.end42

if.end42:                                         ; preds = %if.else, %for.end
  ret void, !dbg !221
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

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_15_good() #0 !dbg !222 {
entry:
  call void @goodB2G1(), !dbg !223
  call void @goodB2G2(), !dbg !224
  call void @goodG2B1(), !dbg !225
  call void @goodG2B2(), !dbg !226
  ret void, !dbg !227
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !228 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !233, metadata !DIExpression()), !dbg !234
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !235, metadata !DIExpression()), !dbg !236
  %call = call i64 @time(i64* null) #7, !dbg !237
  %conv = trunc i64 %call to i32, !dbg !238
  call void @srand(i32 %conv) #7, !dbg !239
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !240
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_15_good(), !dbg !241
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !242
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !243
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_15_bad(), !dbg !244
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !245
  ret i32 0, !dbg !246
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !247 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !248, metadata !DIExpression()), !dbg !249
  store i32 -1, i32* %data, align 4, !dbg !250
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !251, metadata !DIExpression()), !dbg !253
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !254, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !256, metadata !DIExpression()), !dbg !257
  store i32 -1, i32* %listenSocket, align 4, !dbg !257
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !258, metadata !DIExpression()), !dbg !259
  store i32 -1, i32* %acceptSocket, align 4, !dbg !259
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !260, metadata !DIExpression()), !dbg !261
  br label %do.body, !dbg !262

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !263
  store i32 %call, i32* %listenSocket, align 4, !dbg !265
  %0 = load i32, i32* %listenSocket, align 4, !dbg !266
  %cmp = icmp eq i32 %0, -1, !dbg !268
  br i1 %cmp, label %if.then, label %if.end, !dbg !269

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !270

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !272
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !272
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !273
  store i16 2, i16* %sin_family, align 4, !dbg !274
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !275
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !276
  store i32 0, i32* %s_addr, align 4, !dbg !277
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !278
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !279
  store i16 %call1, i16* %sin_port, align 2, !dbg !280
  %2 = load i32, i32* %listenSocket, align 4, !dbg !281
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !283
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !284
  %cmp3 = icmp eq i32 %call2, -1, !dbg !285
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !286

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !287

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !289
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !291
  %cmp7 = icmp eq i32 %call6, -1, !dbg !292
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !293

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !294

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !296
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !297
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !298
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !299
  %cmp11 = icmp eq i32 %6, -1, !dbg !301
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !302

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !303

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !305
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !306
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !307
  %conv = trunc i64 %call14 to i32, !dbg !307
  store i32 %conv, i32* %recvResult, align 4, !dbg !308
  %8 = load i32, i32* %recvResult, align 4, !dbg !309
  %cmp15 = icmp eq i32 %8, -1, !dbg !311
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !312

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !313
  %cmp17 = icmp eq i32 %9, 0, !dbg !314
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !315

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !316

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !318
  %idxprom = sext i32 %10 to i64, !dbg !319
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !319
  store i8 0, i8* %arrayidx, align 1, !dbg !320
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !321
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !322
  store i32 %call22, i32* %data, align 4, !dbg !323
  br label %do.end, !dbg !324

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !325
  %cmp23 = icmp ne i32 %11, -1, !dbg !327
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !328

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !329
  %call26 = call i32 @close(i32 %12), !dbg !331
  br label %if.end27, !dbg !332

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !333
  %cmp28 = icmp ne i32 %13, -1, !dbg !335
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !336

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !337
  %call31 = call i32 @close(i32 %14), !dbg !339
  br label %if.end32, !dbg !340

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !341, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !344, metadata !DIExpression()), !dbg !345
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !345
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !345
  %16 = load i32, i32* %data, align 4, !dbg !346
  %cmp33 = icmp sge i32 %16, 0, !dbg !348
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !349

land.lhs.true:                                    ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !350
  %cmp35 = icmp slt i32 %17, 10, !dbg !351
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !352

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !353
  %idxprom38 = sext i32 %18 to i64, !dbg !355
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !355
  store i32 1, i32* %arrayidx39, align 4, !dbg !356
  store i32 0, i32* %i, align 4, !dbg !357
  br label %for.cond, !dbg !359

for.cond:                                         ; preds = %for.inc, %if.then37
  %19 = load i32, i32* %i, align 4, !dbg !360
  %cmp40 = icmp slt i32 %19, 10, !dbg !362
  br i1 %cmp40, label %for.body, label %for.end, !dbg !363

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !364
  %idxprom42 = sext i32 %20 to i64, !dbg !366
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !366
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !366
  call void @printIntLine(i32 %21), !dbg !367
  br label %for.inc, !dbg !368

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !369
  %inc = add nsw i32 %22, 1, !dbg !369
  store i32 %inc, i32* %i, align 4, !dbg !369
  br label %for.cond, !dbg !370, !llvm.loop !371

for.end:                                          ; preds = %for.cond
  br label %if.end44, !dbg !373

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !374
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end
  ret void, !dbg !376
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !377 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !378, metadata !DIExpression()), !dbg !379
  store i32 -1, i32* %data, align 4, !dbg !380
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !381, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !384, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !386, metadata !DIExpression()), !dbg !387
  store i32 -1, i32* %listenSocket, align 4, !dbg !387
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !388, metadata !DIExpression()), !dbg !389
  store i32 -1, i32* %acceptSocket, align 4, !dbg !389
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !390, metadata !DIExpression()), !dbg !391
  br label %do.body, !dbg !392

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !393
  store i32 %call, i32* %listenSocket, align 4, !dbg !395
  %0 = load i32, i32* %listenSocket, align 4, !dbg !396
  %cmp = icmp eq i32 %0, -1, !dbg !398
  br i1 %cmp, label %if.then, label %if.end, !dbg !399

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !400

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !402
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !402
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !403
  store i16 2, i16* %sin_family, align 4, !dbg !404
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !405
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !406
  store i32 0, i32* %s_addr, align 4, !dbg !407
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !408
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !409
  store i16 %call1, i16* %sin_port, align 2, !dbg !410
  %2 = load i32, i32* %listenSocket, align 4, !dbg !411
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !413
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !414
  %cmp3 = icmp eq i32 %call2, -1, !dbg !415
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !416

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !417

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !419
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !421
  %cmp7 = icmp eq i32 %call6, -1, !dbg !422
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !423

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !424

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !426
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !427
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !428
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !429
  %cmp11 = icmp eq i32 %6, -1, !dbg !431
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !432

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !433

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !435
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !436
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !437
  %conv = trunc i64 %call14 to i32, !dbg !437
  store i32 %conv, i32* %recvResult, align 4, !dbg !438
  %8 = load i32, i32* %recvResult, align 4, !dbg !439
  %cmp15 = icmp eq i32 %8, -1, !dbg !441
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !442

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !443
  %cmp17 = icmp eq i32 %9, 0, !dbg !444
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !445

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !446

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !448
  %idxprom = sext i32 %10 to i64, !dbg !449
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !449
  store i8 0, i8* %arrayidx, align 1, !dbg !450
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !451
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !452
  store i32 %call22, i32* %data, align 4, !dbg !453
  br label %do.end, !dbg !454

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !455
  %cmp23 = icmp ne i32 %11, -1, !dbg !457
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !458

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !459
  %call26 = call i32 @close(i32 %12), !dbg !461
  br label %if.end27, !dbg !462

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !463
  %cmp28 = icmp ne i32 %13, -1, !dbg !465
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !466

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !467
  %call31 = call i32 @close(i32 %14), !dbg !469
  br label %if.end32, !dbg !470

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !471, metadata !DIExpression()), !dbg !473
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !474, metadata !DIExpression()), !dbg !475
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !475
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !475
  %16 = load i32, i32* %data, align 4, !dbg !476
  %cmp33 = icmp sge i32 %16, 0, !dbg !478
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !479

land.lhs.true:                                    ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !480
  %cmp35 = icmp slt i32 %17, 10, !dbg !481
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !482

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !483
  %idxprom38 = sext i32 %18 to i64, !dbg !485
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !485
  store i32 1, i32* %arrayidx39, align 4, !dbg !486
  store i32 0, i32* %i, align 4, !dbg !487
  br label %for.cond, !dbg !489

for.cond:                                         ; preds = %for.inc, %if.then37
  %19 = load i32, i32* %i, align 4, !dbg !490
  %cmp40 = icmp slt i32 %19, 10, !dbg !492
  br i1 %cmp40, label %for.body, label %for.end, !dbg !493

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !494
  %idxprom42 = sext i32 %20 to i64, !dbg !496
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !496
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !496
  call void @printIntLine(i32 %21), !dbg !497
  br label %for.inc, !dbg !498

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !499
  %inc = add nsw i32 %22, 1, !dbg !499
  store i32 %inc, i32* %i, align 4, !dbg !499
  br label %for.cond, !dbg !500, !llvm.loop !501

for.end:                                          ; preds = %for.cond
  br label %if.end44, !dbg !503

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !504
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end
  ret void, !dbg !506
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !507 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !508, metadata !DIExpression()), !dbg !509
  store i32 -1, i32* %data, align 4, !dbg !510
  store i32 7, i32* %data, align 4, !dbg !511
  call void @llvm.dbg.declare(metadata i32* %i, metadata !512, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !515, metadata !DIExpression()), !dbg !516
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !516
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !516
  %1 = load i32, i32* %data, align 4, !dbg !517
  %cmp = icmp sge i32 %1, 0, !dbg !519
  br i1 %cmp, label %if.then, label %if.else, !dbg !520

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !521
  %idxprom = sext i32 %2 to i64, !dbg !523
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !523
  store i32 1, i32* %arrayidx, align 4, !dbg !524
  store i32 0, i32* %i, align 4, !dbg !525
  br label %for.cond, !dbg !527

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !528
  %cmp1 = icmp slt i32 %3, 10, !dbg !530
  br i1 %cmp1, label %for.body, label %for.end, !dbg !531

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !532
  %idxprom2 = sext i32 %4 to i64, !dbg !534
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !534
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !534
  call void @printIntLine(i32 %5), !dbg !535
  br label %for.inc, !dbg !536

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !537
  %inc = add nsw i32 %6, 1, !dbg !537
  store i32 %inc, i32* %i, align 4, !dbg !537
  br label %for.cond, !dbg !538, !llvm.loop !539

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !541

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !542
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !544
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !545 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !546, metadata !DIExpression()), !dbg !547
  store i32 -1, i32* %data, align 4, !dbg !548
  store i32 7, i32* %data, align 4, !dbg !549
  call void @llvm.dbg.declare(metadata i32* %i, metadata !550, metadata !DIExpression()), !dbg !552
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !553, metadata !DIExpression()), !dbg !554
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !554
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !554
  %1 = load i32, i32* %data, align 4, !dbg !555
  %cmp = icmp sge i32 %1, 0, !dbg !557
  br i1 %cmp, label %if.then, label %if.else, !dbg !558

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !559
  %idxprom = sext i32 %2 to i64, !dbg !561
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !561
  store i32 1, i32* %arrayidx, align 4, !dbg !562
  store i32 0, i32* %i, align 4, !dbg !563
  br label %for.cond, !dbg !565

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !566
  %cmp1 = icmp slt i32 %3, 10, !dbg !568
  br i1 %cmp1, label %for.body, label %for.end, !dbg !569

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !570
  %idxprom2 = sext i32 %4 to i64, !dbg !572
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !572
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !572
  call void @printIntLine(i32 %5), !dbg !573
  br label %for.inc, !dbg !574

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !575
  %inc = add nsw i32 %6, 1, !dbg !575
  store i32 %inc, i32* %i, align 4, !dbg !575
  br label %for.cond, !dbg !576, !llvm.loop !577

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !579

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !580
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !582
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_15.c", directory: "/root/SSE-Assessment")
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
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !50, line: 41, baseType: !5)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !53, line: 175, size: 128, elements: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!54 = !{!55, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !52, file: !53, line: 177, baseType: !56, size: 16)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !57, line: 28, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!58 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !52, file: !53, line: 178, baseType: !60, size: 112, offset: 16)
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
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_15_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_15.c", directory: "/root/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !71, line: 57, type: !76)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 52, column: 5)
!81 = !DILocation(line: 57, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !71, line: 58, type: !83)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !84)
!84 = !{!85, !86, !90, !94}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !83, file: !17, line: 239, baseType: !56, size: 16)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !83, file: !17, line: 240, baseType: !87, size: 16, offset: 16)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !83, file: !17, line: 241, baseType: !91, size: 32, offset: 32)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !92)
!92 = !{!93}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !91, file: !17, line: 33, baseType: !46, size: 32)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !83, file: !17, line: 244, baseType: !95, size: 64, offset: 64)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 64, elements: !97)
!96 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!97 = !{!98}
!98 = !DISubrange(count: 8)
!99 = !DILocation(line: 58, column: 28, scope: !80)
!100 = !DILocalVariable(name: "listenSocket", scope: !80, file: !71, line: 59, type: !76)
!101 = !DILocation(line: 59, column: 16, scope: !80)
!102 = !DILocalVariable(name: "acceptSocket", scope: !80, file: !71, line: 60, type: !76)
!103 = !DILocation(line: 60, column: 16, scope: !80)
!104 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !71, line: 61, type: !60)
!105 = !DILocation(line: 61, column: 14, scope: !80)
!106 = !DILocation(line: 62, column: 9, scope: !80)
!107 = !DILocation(line: 72, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !80, file: !71, line: 63, column: 9)
!109 = !DILocation(line: 72, column: 26, scope: !108)
!110 = !DILocation(line: 73, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !71, line: 73, column: 17)
!112 = !DILocation(line: 73, column: 30, scope: !111)
!113 = !DILocation(line: 73, column: 17, scope: !108)
!114 = !DILocation(line: 75, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !71, line: 74, column: 13)
!116 = !DILocation(line: 77, column: 13, scope: !108)
!117 = !DILocation(line: 78, column: 21, scope: !108)
!118 = !DILocation(line: 78, column: 32, scope: !108)
!119 = !DILocation(line: 79, column: 21, scope: !108)
!120 = !DILocation(line: 79, column: 30, scope: !108)
!121 = !DILocation(line: 79, column: 37, scope: !108)
!122 = !DILocation(line: 80, column: 32, scope: !108)
!123 = !DILocation(line: 80, column: 21, scope: !108)
!124 = !DILocation(line: 80, column: 30, scope: !108)
!125 = !DILocation(line: 81, column: 22, scope: !126)
!126 = distinct !DILexicalBlock(scope: !108, file: !71, line: 81, column: 17)
!127 = !DILocation(line: 81, column: 36, scope: !126)
!128 = !DILocation(line: 81, column: 17, scope: !126)
!129 = !DILocation(line: 81, column: 81, scope: !126)
!130 = !DILocation(line: 81, column: 17, scope: !108)
!131 = !DILocation(line: 83, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !71, line: 82, column: 13)
!133 = !DILocation(line: 85, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !108, file: !71, line: 85, column: 17)
!135 = !DILocation(line: 85, column: 17, scope: !134)
!136 = !DILocation(line: 85, column: 54, scope: !134)
!137 = !DILocation(line: 85, column: 17, scope: !108)
!138 = !DILocation(line: 87, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !71, line: 86, column: 13)
!140 = !DILocation(line: 89, column: 35, scope: !108)
!141 = !DILocation(line: 89, column: 28, scope: !108)
!142 = !DILocation(line: 89, column: 26, scope: !108)
!143 = !DILocation(line: 90, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !108, file: !71, line: 90, column: 17)
!145 = !DILocation(line: 90, column: 30, scope: !144)
!146 = !DILocation(line: 90, column: 17, scope: !108)
!147 = !DILocation(line: 92, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !71, line: 91, column: 13)
!149 = !DILocation(line: 95, column: 31, scope: !108)
!150 = !DILocation(line: 95, column: 45, scope: !108)
!151 = !DILocation(line: 95, column: 26, scope: !108)
!152 = !DILocation(line: 95, column: 24, scope: !108)
!153 = !DILocation(line: 96, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !108, file: !71, line: 96, column: 17)
!155 = !DILocation(line: 96, column: 28, scope: !154)
!156 = !DILocation(line: 96, column: 44, scope: !154)
!157 = !DILocation(line: 96, column: 47, scope: !154)
!158 = !DILocation(line: 96, column: 58, scope: !154)
!159 = !DILocation(line: 96, column: 17, scope: !108)
!160 = !DILocation(line: 98, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !71, line: 97, column: 13)
!162 = !DILocation(line: 101, column: 25, scope: !108)
!163 = !DILocation(line: 101, column: 13, scope: !108)
!164 = !DILocation(line: 101, column: 37, scope: !108)
!165 = !DILocation(line: 103, column: 25, scope: !108)
!166 = !DILocation(line: 103, column: 20, scope: !108)
!167 = !DILocation(line: 103, column: 18, scope: !108)
!168 = !DILocation(line: 104, column: 9, scope: !108)
!169 = !DILocation(line: 106, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !80, file: !71, line: 106, column: 13)
!171 = !DILocation(line: 106, column: 26, scope: !170)
!172 = !DILocation(line: 106, column: 13, scope: !80)
!173 = !DILocation(line: 108, column: 26, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !71, line: 107, column: 9)
!175 = !DILocation(line: 108, column: 13, scope: !174)
!176 = !DILocation(line: 109, column: 9, scope: !174)
!177 = !DILocation(line: 110, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !80, file: !71, line: 110, column: 13)
!179 = !DILocation(line: 110, column: 26, scope: !178)
!180 = !DILocation(line: 110, column: 13, scope: !80)
!181 = !DILocation(line: 112, column: 26, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !71, line: 111, column: 9)
!183 = !DILocation(line: 112, column: 13, scope: !182)
!184 = !DILocation(line: 113, column: 9, scope: !182)
!185 = !DILocalVariable(name: "i", scope: !186, file: !71, line: 131, type: !76)
!186 = distinct !DILexicalBlock(scope: !70, file: !71, line: 130, column: 5)
!187 = !DILocation(line: 131, column: 13, scope: !186)
!188 = !DILocalVariable(name: "buffer", scope: !186, file: !71, line: 132, type: !189)
!189 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !190)
!190 = !{!191}
!191 = !DISubrange(count: 10)
!192 = !DILocation(line: 132, column: 13, scope: !186)
!193 = !DILocation(line: 135, column: 13, scope: !194)
!194 = distinct !DILexicalBlock(scope: !186, file: !71, line: 135, column: 13)
!195 = !DILocation(line: 135, column: 18, scope: !194)
!196 = !DILocation(line: 135, column: 13, scope: !186)
!197 = !DILocation(line: 137, column: 20, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !71, line: 136, column: 9)
!199 = !DILocation(line: 137, column: 13, scope: !198)
!200 = !DILocation(line: 137, column: 26, scope: !198)
!201 = !DILocation(line: 139, column: 19, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !71, line: 139, column: 13)
!203 = !DILocation(line: 139, column: 17, scope: !202)
!204 = !DILocation(line: 139, column: 24, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !71, line: 139, column: 13)
!206 = !DILocation(line: 139, column: 26, scope: !205)
!207 = !DILocation(line: 139, column: 13, scope: !202)
!208 = !DILocation(line: 141, column: 37, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !71, line: 140, column: 13)
!210 = !DILocation(line: 141, column: 30, scope: !209)
!211 = !DILocation(line: 141, column: 17, scope: !209)
!212 = !DILocation(line: 142, column: 13, scope: !209)
!213 = !DILocation(line: 139, column: 33, scope: !205)
!214 = !DILocation(line: 139, column: 13, scope: !205)
!215 = distinct !{!215, !207, !216, !217}
!216 = !DILocation(line: 142, column: 13, scope: !202)
!217 = !{!"llvm.loop.mustprogress"}
!218 = !DILocation(line: 143, column: 9, scope: !198)
!219 = !DILocation(line: 146, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !194, file: !71, line: 145, column: 9)
!221 = !DILocation(line: 155, column: 1, scope: !70)
!222 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_15_good", scope: !71, file: !71, line: 483, type: !72, scopeLine: 484, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!223 = !DILocation(line: 485, column: 5, scope: !222)
!224 = !DILocation(line: 486, column: 5, scope: !222)
!225 = !DILocation(line: 487, column: 5, scope: !222)
!226 = !DILocation(line: 488, column: 5, scope: !222)
!227 = !DILocation(line: 489, column: 1, scope: !222)
!228 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 500, type: !229, scopeLine: 501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!229 = !DISubroutineType(types: !230)
!230 = !{!76, !76, !231}
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!233 = !DILocalVariable(name: "argc", arg: 1, scope: !228, file: !71, line: 500, type: !76)
!234 = !DILocation(line: 500, column: 14, scope: !228)
!235 = !DILocalVariable(name: "argv", arg: 2, scope: !228, file: !71, line: 500, type: !231)
!236 = !DILocation(line: 500, column: 27, scope: !228)
!237 = !DILocation(line: 503, column: 22, scope: !228)
!238 = !DILocation(line: 503, column: 12, scope: !228)
!239 = !DILocation(line: 503, column: 5, scope: !228)
!240 = !DILocation(line: 505, column: 5, scope: !228)
!241 = !DILocation(line: 506, column: 5, scope: !228)
!242 = !DILocation(line: 507, column: 5, scope: !228)
!243 = !DILocation(line: 510, column: 5, scope: !228)
!244 = !DILocation(line: 511, column: 5, scope: !228)
!245 = !DILocation(line: 512, column: 5, scope: !228)
!246 = !DILocation(line: 514, column: 5, scope: !228)
!247 = distinct !DISubprogram(name: "goodB2G1", scope: !71, file: !71, line: 162, type: !72, scopeLine: 163, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!248 = !DILocalVariable(name: "data", scope: !247, file: !71, line: 164, type: !76)
!249 = !DILocation(line: 164, column: 9, scope: !247)
!250 = !DILocation(line: 166, column: 10, scope: !247)
!251 = !DILocalVariable(name: "recvResult", scope: !252, file: !71, line: 175, type: !76)
!252 = distinct !DILexicalBlock(scope: !247, file: !71, line: 170, column: 5)
!253 = !DILocation(line: 175, column: 13, scope: !252)
!254 = !DILocalVariable(name: "service", scope: !252, file: !71, line: 176, type: !83)
!255 = !DILocation(line: 176, column: 28, scope: !252)
!256 = !DILocalVariable(name: "listenSocket", scope: !252, file: !71, line: 177, type: !76)
!257 = !DILocation(line: 177, column: 16, scope: !252)
!258 = !DILocalVariable(name: "acceptSocket", scope: !252, file: !71, line: 178, type: !76)
!259 = !DILocation(line: 178, column: 16, scope: !252)
!260 = !DILocalVariable(name: "inputBuffer", scope: !252, file: !71, line: 179, type: !60)
!261 = !DILocation(line: 179, column: 14, scope: !252)
!262 = !DILocation(line: 180, column: 9, scope: !252)
!263 = !DILocation(line: 190, column: 28, scope: !264)
!264 = distinct !DILexicalBlock(scope: !252, file: !71, line: 181, column: 9)
!265 = !DILocation(line: 190, column: 26, scope: !264)
!266 = !DILocation(line: 191, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !71, line: 191, column: 17)
!268 = !DILocation(line: 191, column: 30, scope: !267)
!269 = !DILocation(line: 191, column: 17, scope: !264)
!270 = !DILocation(line: 193, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !71, line: 192, column: 13)
!272 = !DILocation(line: 195, column: 13, scope: !264)
!273 = !DILocation(line: 196, column: 21, scope: !264)
!274 = !DILocation(line: 196, column: 32, scope: !264)
!275 = !DILocation(line: 197, column: 21, scope: !264)
!276 = !DILocation(line: 197, column: 30, scope: !264)
!277 = !DILocation(line: 197, column: 37, scope: !264)
!278 = !DILocation(line: 198, column: 32, scope: !264)
!279 = !DILocation(line: 198, column: 21, scope: !264)
!280 = !DILocation(line: 198, column: 30, scope: !264)
!281 = !DILocation(line: 199, column: 22, scope: !282)
!282 = distinct !DILexicalBlock(scope: !264, file: !71, line: 199, column: 17)
!283 = !DILocation(line: 199, column: 36, scope: !282)
!284 = !DILocation(line: 199, column: 17, scope: !282)
!285 = !DILocation(line: 199, column: 81, scope: !282)
!286 = !DILocation(line: 199, column: 17, scope: !264)
!287 = !DILocation(line: 201, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !282, file: !71, line: 200, column: 13)
!289 = !DILocation(line: 203, column: 24, scope: !290)
!290 = distinct !DILexicalBlock(scope: !264, file: !71, line: 203, column: 17)
!291 = !DILocation(line: 203, column: 17, scope: !290)
!292 = !DILocation(line: 203, column: 54, scope: !290)
!293 = !DILocation(line: 203, column: 17, scope: !264)
!294 = !DILocation(line: 205, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !290, file: !71, line: 204, column: 13)
!296 = !DILocation(line: 207, column: 35, scope: !264)
!297 = !DILocation(line: 207, column: 28, scope: !264)
!298 = !DILocation(line: 207, column: 26, scope: !264)
!299 = !DILocation(line: 208, column: 17, scope: !300)
!300 = distinct !DILexicalBlock(scope: !264, file: !71, line: 208, column: 17)
!301 = !DILocation(line: 208, column: 30, scope: !300)
!302 = !DILocation(line: 208, column: 17, scope: !264)
!303 = !DILocation(line: 210, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !300, file: !71, line: 209, column: 13)
!305 = !DILocation(line: 213, column: 31, scope: !264)
!306 = !DILocation(line: 213, column: 45, scope: !264)
!307 = !DILocation(line: 213, column: 26, scope: !264)
!308 = !DILocation(line: 213, column: 24, scope: !264)
!309 = !DILocation(line: 214, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !264, file: !71, line: 214, column: 17)
!311 = !DILocation(line: 214, column: 28, scope: !310)
!312 = !DILocation(line: 214, column: 44, scope: !310)
!313 = !DILocation(line: 214, column: 47, scope: !310)
!314 = !DILocation(line: 214, column: 58, scope: !310)
!315 = !DILocation(line: 214, column: 17, scope: !264)
!316 = !DILocation(line: 216, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !310, file: !71, line: 215, column: 13)
!318 = !DILocation(line: 219, column: 25, scope: !264)
!319 = !DILocation(line: 219, column: 13, scope: !264)
!320 = !DILocation(line: 219, column: 37, scope: !264)
!321 = !DILocation(line: 221, column: 25, scope: !264)
!322 = !DILocation(line: 221, column: 20, scope: !264)
!323 = !DILocation(line: 221, column: 18, scope: !264)
!324 = !DILocation(line: 222, column: 9, scope: !264)
!325 = !DILocation(line: 224, column: 13, scope: !326)
!326 = distinct !DILexicalBlock(scope: !252, file: !71, line: 224, column: 13)
!327 = !DILocation(line: 224, column: 26, scope: !326)
!328 = !DILocation(line: 224, column: 13, scope: !252)
!329 = !DILocation(line: 226, column: 26, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !71, line: 225, column: 9)
!331 = !DILocation(line: 226, column: 13, scope: !330)
!332 = !DILocation(line: 227, column: 9, scope: !330)
!333 = !DILocation(line: 228, column: 13, scope: !334)
!334 = distinct !DILexicalBlock(scope: !252, file: !71, line: 228, column: 13)
!335 = !DILocation(line: 228, column: 26, scope: !334)
!336 = !DILocation(line: 228, column: 13, scope: !252)
!337 = !DILocation(line: 230, column: 26, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !71, line: 229, column: 9)
!339 = !DILocation(line: 230, column: 13, scope: !338)
!340 = !DILocation(line: 231, column: 9, scope: !338)
!341 = !DILocalVariable(name: "i", scope: !342, file: !71, line: 253, type: !76)
!342 = distinct !DILexicalBlock(scope: !247, file: !71, line: 252, column: 5)
!343 = !DILocation(line: 253, column: 13, scope: !342)
!344 = !DILocalVariable(name: "buffer", scope: !342, file: !71, line: 254, type: !189)
!345 = !DILocation(line: 254, column: 13, scope: !342)
!346 = !DILocation(line: 256, column: 13, scope: !347)
!347 = distinct !DILexicalBlock(scope: !342, file: !71, line: 256, column: 13)
!348 = !DILocation(line: 256, column: 18, scope: !347)
!349 = !DILocation(line: 256, column: 23, scope: !347)
!350 = !DILocation(line: 256, column: 26, scope: !347)
!351 = !DILocation(line: 256, column: 31, scope: !347)
!352 = !DILocation(line: 256, column: 13, scope: !342)
!353 = !DILocation(line: 258, column: 20, scope: !354)
!354 = distinct !DILexicalBlock(scope: !347, file: !71, line: 257, column: 9)
!355 = !DILocation(line: 258, column: 13, scope: !354)
!356 = !DILocation(line: 258, column: 26, scope: !354)
!357 = !DILocation(line: 260, column: 19, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !71, line: 260, column: 13)
!359 = !DILocation(line: 260, column: 17, scope: !358)
!360 = !DILocation(line: 260, column: 24, scope: !361)
!361 = distinct !DILexicalBlock(scope: !358, file: !71, line: 260, column: 13)
!362 = !DILocation(line: 260, column: 26, scope: !361)
!363 = !DILocation(line: 260, column: 13, scope: !358)
!364 = !DILocation(line: 262, column: 37, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !71, line: 261, column: 13)
!366 = !DILocation(line: 262, column: 30, scope: !365)
!367 = !DILocation(line: 262, column: 17, scope: !365)
!368 = !DILocation(line: 263, column: 13, scope: !365)
!369 = !DILocation(line: 260, column: 33, scope: !361)
!370 = !DILocation(line: 260, column: 13, scope: !361)
!371 = distinct !{!371, !363, !372, !217}
!372 = !DILocation(line: 263, column: 13, scope: !358)
!373 = !DILocation(line: 264, column: 9, scope: !354)
!374 = !DILocation(line: 267, column: 13, scope: !375)
!375 = distinct !DILexicalBlock(scope: !347, file: !71, line: 266, column: 9)
!376 = !DILocation(line: 272, column: 1, scope: !247)
!377 = distinct !DISubprogram(name: "goodB2G2", scope: !71, file: !71, line: 275, type: !72, scopeLine: 276, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!378 = !DILocalVariable(name: "data", scope: !377, file: !71, line: 277, type: !76)
!379 = !DILocation(line: 277, column: 9, scope: !377)
!380 = !DILocation(line: 279, column: 10, scope: !377)
!381 = !DILocalVariable(name: "recvResult", scope: !382, file: !71, line: 288, type: !76)
!382 = distinct !DILexicalBlock(scope: !377, file: !71, line: 283, column: 5)
!383 = !DILocation(line: 288, column: 13, scope: !382)
!384 = !DILocalVariable(name: "service", scope: !382, file: !71, line: 289, type: !83)
!385 = !DILocation(line: 289, column: 28, scope: !382)
!386 = !DILocalVariable(name: "listenSocket", scope: !382, file: !71, line: 290, type: !76)
!387 = !DILocation(line: 290, column: 16, scope: !382)
!388 = !DILocalVariable(name: "acceptSocket", scope: !382, file: !71, line: 291, type: !76)
!389 = !DILocation(line: 291, column: 16, scope: !382)
!390 = !DILocalVariable(name: "inputBuffer", scope: !382, file: !71, line: 292, type: !60)
!391 = !DILocation(line: 292, column: 14, scope: !382)
!392 = !DILocation(line: 293, column: 9, scope: !382)
!393 = !DILocation(line: 303, column: 28, scope: !394)
!394 = distinct !DILexicalBlock(scope: !382, file: !71, line: 294, column: 9)
!395 = !DILocation(line: 303, column: 26, scope: !394)
!396 = !DILocation(line: 304, column: 17, scope: !397)
!397 = distinct !DILexicalBlock(scope: !394, file: !71, line: 304, column: 17)
!398 = !DILocation(line: 304, column: 30, scope: !397)
!399 = !DILocation(line: 304, column: 17, scope: !394)
!400 = !DILocation(line: 306, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !397, file: !71, line: 305, column: 13)
!402 = !DILocation(line: 308, column: 13, scope: !394)
!403 = !DILocation(line: 309, column: 21, scope: !394)
!404 = !DILocation(line: 309, column: 32, scope: !394)
!405 = !DILocation(line: 310, column: 21, scope: !394)
!406 = !DILocation(line: 310, column: 30, scope: !394)
!407 = !DILocation(line: 310, column: 37, scope: !394)
!408 = !DILocation(line: 311, column: 32, scope: !394)
!409 = !DILocation(line: 311, column: 21, scope: !394)
!410 = !DILocation(line: 311, column: 30, scope: !394)
!411 = !DILocation(line: 312, column: 22, scope: !412)
!412 = distinct !DILexicalBlock(scope: !394, file: !71, line: 312, column: 17)
!413 = !DILocation(line: 312, column: 36, scope: !412)
!414 = !DILocation(line: 312, column: 17, scope: !412)
!415 = !DILocation(line: 312, column: 81, scope: !412)
!416 = !DILocation(line: 312, column: 17, scope: !394)
!417 = !DILocation(line: 314, column: 17, scope: !418)
!418 = distinct !DILexicalBlock(scope: !412, file: !71, line: 313, column: 13)
!419 = !DILocation(line: 316, column: 24, scope: !420)
!420 = distinct !DILexicalBlock(scope: !394, file: !71, line: 316, column: 17)
!421 = !DILocation(line: 316, column: 17, scope: !420)
!422 = !DILocation(line: 316, column: 54, scope: !420)
!423 = !DILocation(line: 316, column: 17, scope: !394)
!424 = !DILocation(line: 318, column: 17, scope: !425)
!425 = distinct !DILexicalBlock(scope: !420, file: !71, line: 317, column: 13)
!426 = !DILocation(line: 320, column: 35, scope: !394)
!427 = !DILocation(line: 320, column: 28, scope: !394)
!428 = !DILocation(line: 320, column: 26, scope: !394)
!429 = !DILocation(line: 321, column: 17, scope: !430)
!430 = distinct !DILexicalBlock(scope: !394, file: !71, line: 321, column: 17)
!431 = !DILocation(line: 321, column: 30, scope: !430)
!432 = !DILocation(line: 321, column: 17, scope: !394)
!433 = !DILocation(line: 323, column: 17, scope: !434)
!434 = distinct !DILexicalBlock(scope: !430, file: !71, line: 322, column: 13)
!435 = !DILocation(line: 326, column: 31, scope: !394)
!436 = !DILocation(line: 326, column: 45, scope: !394)
!437 = !DILocation(line: 326, column: 26, scope: !394)
!438 = !DILocation(line: 326, column: 24, scope: !394)
!439 = !DILocation(line: 327, column: 17, scope: !440)
!440 = distinct !DILexicalBlock(scope: !394, file: !71, line: 327, column: 17)
!441 = !DILocation(line: 327, column: 28, scope: !440)
!442 = !DILocation(line: 327, column: 44, scope: !440)
!443 = !DILocation(line: 327, column: 47, scope: !440)
!444 = !DILocation(line: 327, column: 58, scope: !440)
!445 = !DILocation(line: 327, column: 17, scope: !394)
!446 = !DILocation(line: 329, column: 17, scope: !447)
!447 = distinct !DILexicalBlock(scope: !440, file: !71, line: 328, column: 13)
!448 = !DILocation(line: 332, column: 25, scope: !394)
!449 = !DILocation(line: 332, column: 13, scope: !394)
!450 = !DILocation(line: 332, column: 37, scope: !394)
!451 = !DILocation(line: 334, column: 25, scope: !394)
!452 = !DILocation(line: 334, column: 20, scope: !394)
!453 = !DILocation(line: 334, column: 18, scope: !394)
!454 = !DILocation(line: 335, column: 9, scope: !394)
!455 = !DILocation(line: 337, column: 13, scope: !456)
!456 = distinct !DILexicalBlock(scope: !382, file: !71, line: 337, column: 13)
!457 = !DILocation(line: 337, column: 26, scope: !456)
!458 = !DILocation(line: 337, column: 13, scope: !382)
!459 = !DILocation(line: 339, column: 26, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !71, line: 338, column: 9)
!461 = !DILocation(line: 339, column: 13, scope: !460)
!462 = !DILocation(line: 340, column: 9, scope: !460)
!463 = !DILocation(line: 341, column: 13, scope: !464)
!464 = distinct !DILexicalBlock(scope: !382, file: !71, line: 341, column: 13)
!465 = !DILocation(line: 341, column: 26, scope: !464)
!466 = !DILocation(line: 341, column: 13, scope: !382)
!467 = !DILocation(line: 343, column: 26, scope: !468)
!468 = distinct !DILexicalBlock(scope: !464, file: !71, line: 342, column: 9)
!469 = !DILocation(line: 343, column: 13, scope: !468)
!470 = !DILocation(line: 344, column: 9, scope: !468)
!471 = !DILocalVariable(name: "i", scope: !472, file: !71, line: 362, type: !76)
!472 = distinct !DILexicalBlock(scope: !377, file: !71, line: 361, column: 5)
!473 = !DILocation(line: 362, column: 13, scope: !472)
!474 = !DILocalVariable(name: "buffer", scope: !472, file: !71, line: 363, type: !189)
!475 = !DILocation(line: 363, column: 13, scope: !472)
!476 = !DILocation(line: 365, column: 13, scope: !477)
!477 = distinct !DILexicalBlock(scope: !472, file: !71, line: 365, column: 13)
!478 = !DILocation(line: 365, column: 18, scope: !477)
!479 = !DILocation(line: 365, column: 23, scope: !477)
!480 = !DILocation(line: 365, column: 26, scope: !477)
!481 = !DILocation(line: 365, column: 31, scope: !477)
!482 = !DILocation(line: 365, column: 13, scope: !472)
!483 = !DILocation(line: 367, column: 20, scope: !484)
!484 = distinct !DILexicalBlock(scope: !477, file: !71, line: 366, column: 9)
!485 = !DILocation(line: 367, column: 13, scope: !484)
!486 = !DILocation(line: 367, column: 26, scope: !484)
!487 = !DILocation(line: 369, column: 19, scope: !488)
!488 = distinct !DILexicalBlock(scope: !484, file: !71, line: 369, column: 13)
!489 = !DILocation(line: 369, column: 17, scope: !488)
!490 = !DILocation(line: 369, column: 24, scope: !491)
!491 = distinct !DILexicalBlock(scope: !488, file: !71, line: 369, column: 13)
!492 = !DILocation(line: 369, column: 26, scope: !491)
!493 = !DILocation(line: 369, column: 13, scope: !488)
!494 = !DILocation(line: 371, column: 37, scope: !495)
!495 = distinct !DILexicalBlock(scope: !491, file: !71, line: 370, column: 13)
!496 = !DILocation(line: 371, column: 30, scope: !495)
!497 = !DILocation(line: 371, column: 17, scope: !495)
!498 = !DILocation(line: 372, column: 13, scope: !495)
!499 = !DILocation(line: 369, column: 33, scope: !491)
!500 = !DILocation(line: 369, column: 13, scope: !491)
!501 = distinct !{!501, !493, !502, !217}
!502 = !DILocation(line: 372, column: 13, scope: !488)
!503 = !DILocation(line: 373, column: 9, scope: !484)
!504 = !DILocation(line: 376, column: 13, scope: !505)
!505 = distinct !DILexicalBlock(scope: !477, file: !71, line: 375, column: 9)
!506 = !DILocation(line: 385, column: 1, scope: !377)
!507 = distinct !DISubprogram(name: "goodG2B1", scope: !71, file: !71, line: 388, type: !72, scopeLine: 389, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!508 = !DILocalVariable(name: "data", scope: !507, file: !71, line: 390, type: !76)
!509 = !DILocation(line: 390, column: 9, scope: !507)
!510 = !DILocation(line: 392, column: 10, scope: !507)
!511 = !DILocation(line: 402, column: 14, scope: !507)
!512 = !DILocalVariable(name: "i", scope: !513, file: !71, line: 409, type: !76)
!513 = distinct !DILexicalBlock(scope: !507, file: !71, line: 408, column: 5)
!514 = !DILocation(line: 409, column: 13, scope: !513)
!515 = !DILocalVariable(name: "buffer", scope: !513, file: !71, line: 410, type: !189)
!516 = !DILocation(line: 410, column: 13, scope: !513)
!517 = !DILocation(line: 413, column: 13, scope: !518)
!518 = distinct !DILexicalBlock(scope: !513, file: !71, line: 413, column: 13)
!519 = !DILocation(line: 413, column: 18, scope: !518)
!520 = !DILocation(line: 413, column: 13, scope: !513)
!521 = !DILocation(line: 415, column: 20, scope: !522)
!522 = distinct !DILexicalBlock(scope: !518, file: !71, line: 414, column: 9)
!523 = !DILocation(line: 415, column: 13, scope: !522)
!524 = !DILocation(line: 415, column: 26, scope: !522)
!525 = !DILocation(line: 417, column: 19, scope: !526)
!526 = distinct !DILexicalBlock(scope: !522, file: !71, line: 417, column: 13)
!527 = !DILocation(line: 417, column: 17, scope: !526)
!528 = !DILocation(line: 417, column: 24, scope: !529)
!529 = distinct !DILexicalBlock(scope: !526, file: !71, line: 417, column: 13)
!530 = !DILocation(line: 417, column: 26, scope: !529)
!531 = !DILocation(line: 417, column: 13, scope: !526)
!532 = !DILocation(line: 419, column: 37, scope: !533)
!533 = distinct !DILexicalBlock(scope: !529, file: !71, line: 418, column: 13)
!534 = !DILocation(line: 419, column: 30, scope: !533)
!535 = !DILocation(line: 419, column: 17, scope: !533)
!536 = !DILocation(line: 420, column: 13, scope: !533)
!537 = !DILocation(line: 417, column: 33, scope: !529)
!538 = !DILocation(line: 417, column: 13, scope: !529)
!539 = distinct !{!539, !531, !540, !217}
!540 = !DILocation(line: 420, column: 13, scope: !526)
!541 = !DILocation(line: 421, column: 9, scope: !522)
!542 = !DILocation(line: 424, column: 13, scope: !543)
!543 = distinct !DILexicalBlock(scope: !518, file: !71, line: 423, column: 9)
!544 = !DILocation(line: 433, column: 1, scope: !507)
!545 = distinct !DISubprogram(name: "goodG2B2", scope: !71, file: !71, line: 436, type: !72, scopeLine: 437, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!546 = !DILocalVariable(name: "data", scope: !545, file: !71, line: 438, type: !76)
!547 = !DILocation(line: 438, column: 9, scope: !545)
!548 = !DILocation(line: 440, column: 10, scope: !545)
!549 = !DILocation(line: 446, column: 14, scope: !545)
!550 = !DILocalVariable(name: "i", scope: !551, file: !71, line: 457, type: !76)
!551 = distinct !DILexicalBlock(scope: !545, file: !71, line: 456, column: 5)
!552 = !DILocation(line: 457, column: 13, scope: !551)
!553 = !DILocalVariable(name: "buffer", scope: !551, file: !71, line: 458, type: !189)
!554 = !DILocation(line: 458, column: 13, scope: !551)
!555 = !DILocation(line: 461, column: 13, scope: !556)
!556 = distinct !DILexicalBlock(scope: !551, file: !71, line: 461, column: 13)
!557 = !DILocation(line: 461, column: 18, scope: !556)
!558 = !DILocation(line: 461, column: 13, scope: !551)
!559 = !DILocation(line: 463, column: 20, scope: !560)
!560 = distinct !DILexicalBlock(scope: !556, file: !71, line: 462, column: 9)
!561 = !DILocation(line: 463, column: 13, scope: !560)
!562 = !DILocation(line: 463, column: 26, scope: !560)
!563 = !DILocation(line: 465, column: 19, scope: !564)
!564 = distinct !DILexicalBlock(scope: !560, file: !71, line: 465, column: 13)
!565 = !DILocation(line: 465, column: 17, scope: !564)
!566 = !DILocation(line: 465, column: 24, scope: !567)
!567 = distinct !DILexicalBlock(scope: !564, file: !71, line: 465, column: 13)
!568 = !DILocation(line: 465, column: 26, scope: !567)
!569 = !DILocation(line: 465, column: 13, scope: !564)
!570 = !DILocation(line: 467, column: 37, scope: !571)
!571 = distinct !DILexicalBlock(scope: !567, file: !71, line: 466, column: 13)
!572 = !DILocation(line: 467, column: 30, scope: !571)
!573 = !DILocation(line: 467, column: 17, scope: !571)
!574 = !DILocation(line: 468, column: 13, scope: !571)
!575 = !DILocation(line: 465, column: 33, scope: !567)
!576 = !DILocation(line: 465, column: 13, scope: !567)
!577 = distinct !{!577, !569, !578, !217}
!578 = !DILocation(line: 468, column: 13, scope: !564)
!579 = !DILocation(line: 469, column: 9, scope: !560)
!580 = !DILocation(line: 472, column: 13, scope: !581)
!581 = distinct !DILexicalBlock(scope: !556, file: !71, line: 471, column: 9)
!582 = !DILocation(line: 481, column: 1, scope: !545)
