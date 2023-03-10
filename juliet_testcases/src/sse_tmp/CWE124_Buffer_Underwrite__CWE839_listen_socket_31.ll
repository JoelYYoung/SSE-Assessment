; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_31.c"
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_31_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data33 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !185, metadata !DIExpression()), !dbg !187
  %15 = load i32, i32* %data, align 4, !dbg !188
  store i32 %15, i32* %dataCopy, align 4, !dbg !187
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !189, metadata !DIExpression()), !dbg !190
  %16 = load i32, i32* %dataCopy, align 4, !dbg !191
  store i32 %16, i32* %data33, align 4, !dbg !190
  call void @llvm.dbg.declare(metadata i32* %i, metadata !192, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !195, metadata !DIExpression()), !dbg !199
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !199
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !199
  %18 = load i32, i32* %data33, align 4, !dbg !200
  %cmp34 = icmp slt i32 %18, 10, !dbg !202
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !203

if.then36:                                        ; preds = %if.end32
  %19 = load i32, i32* %data33, align 4, !dbg !204
  %idxprom37 = sext i32 %19 to i64, !dbg !206
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !206
  store i32 1, i32* %arrayidx38, align 4, !dbg !207
  store i32 0, i32* %i, align 4, !dbg !208
  br label %for.cond, !dbg !210

for.cond:                                         ; preds = %for.inc, %if.then36
  %20 = load i32, i32* %i, align 4, !dbg !211
  %cmp39 = icmp slt i32 %20, 10, !dbg !213
  br i1 %cmp39, label %for.body, label %for.end, !dbg !214

for.body:                                         ; preds = %for.cond
  %21 = load i32, i32* %i, align 4, !dbg !215
  %idxprom41 = sext i32 %21 to i64, !dbg !217
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !217
  %22 = load i32, i32* %arrayidx42, align 4, !dbg !217
  call void @printIntLine(i32 %22), !dbg !218
  br label %for.inc, !dbg !219

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %i, align 4, !dbg !220
  %inc = add nsw i32 %23, 1, !dbg !220
  store i32 %inc, i32* %i, align 4, !dbg !220
  br label %for.cond, !dbg !221, !llvm.loop !222

for.end:                                          ; preds = %for.cond
  br label %if.end43, !dbg !225

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !226
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end
  ret void, !dbg !228
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_31_good() #0 !dbg !229 {
entry:
  call void @goodG2B(), !dbg !230
  call void @goodB2G(), !dbg !231
  ret void, !dbg !232
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !233 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !238, metadata !DIExpression()), !dbg !239
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !240, metadata !DIExpression()), !dbg !241
  %call = call i64 @time(i64* null) #7, !dbg !242
  %conv = trunc i64 %call to i32, !dbg !243
  call void @srand(i32 %conv) #7, !dbg !244
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !245
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_31_good(), !dbg !246
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !247
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !248
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_31_bad(), !dbg !249
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !250
  ret i32 0, !dbg !251
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !252 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 -1, i32* %data, align 4, !dbg !255
  store i32 7, i32* %data, align 4, !dbg !256
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !257, metadata !DIExpression()), !dbg !259
  %0 = load i32, i32* %data, align 4, !dbg !260
  store i32 %0, i32* %dataCopy, align 4, !dbg !259
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !261, metadata !DIExpression()), !dbg !262
  %1 = load i32, i32* %dataCopy, align 4, !dbg !263
  store i32 %1, i32* %data1, align 4, !dbg !262
  call void @llvm.dbg.declare(metadata i32* %i, metadata !264, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !267, metadata !DIExpression()), !dbg !268
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !268
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !268
  %3 = load i32, i32* %data1, align 4, !dbg !269
  %cmp = icmp slt i32 %3, 10, !dbg !271
  br i1 %cmp, label %if.then, label %if.else, !dbg !272

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !273
  %idxprom = sext i32 %4 to i64, !dbg !275
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !275
  store i32 1, i32* %arrayidx, align 4, !dbg !276
  store i32 0, i32* %i, align 4, !dbg !277
  br label %for.cond, !dbg !279

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !280
  %cmp2 = icmp slt i32 %5, 10, !dbg !282
  br i1 %cmp2, label %for.body, label %for.end, !dbg !283

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !284
  %idxprom3 = sext i32 %6 to i64, !dbg !286
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !286
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !286
  call void @printIntLine(i32 %7), !dbg !287
  br label %for.inc, !dbg !288

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !289
  %inc = add nsw i32 %8, 1, !dbg !289
  store i32 %inc, i32* %i, align 4, !dbg !289
  br label %for.cond, !dbg !290, !llvm.loop !291

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !293

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !294
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !296
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !297 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data33 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !298, metadata !DIExpression()), !dbg !299
  store i32 -1, i32* %data, align 4, !dbg !300
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !301, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !304, metadata !DIExpression()), !dbg !305
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !306, metadata !DIExpression()), !dbg !307
  store i32 -1, i32* %listenSocket, align 4, !dbg !307
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !308, metadata !DIExpression()), !dbg !309
  store i32 -1, i32* %acceptSocket, align 4, !dbg !309
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !310, metadata !DIExpression()), !dbg !311
  br label %do.body, !dbg !312

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !313
  store i32 %call, i32* %listenSocket, align 4, !dbg !315
  %0 = load i32, i32* %listenSocket, align 4, !dbg !316
  %cmp = icmp eq i32 %0, -1, !dbg !318
  br i1 %cmp, label %if.then, label %if.end, !dbg !319

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !320

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !322
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !322
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !323
  store i16 2, i16* %sin_family, align 4, !dbg !324
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !325
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !326
  store i32 0, i32* %s_addr, align 4, !dbg !327
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !328
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !329
  store i16 %call1, i16* %sin_port, align 2, !dbg !330
  %2 = load i32, i32* %listenSocket, align 4, !dbg !331
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !333
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !334
  %cmp3 = icmp eq i32 %call2, -1, !dbg !335
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !336

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !337

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !339
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !341
  %cmp7 = icmp eq i32 %call6, -1, !dbg !342
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !343

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !344

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !346
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !347
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !348
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !349
  %cmp11 = icmp eq i32 %6, -1, !dbg !351
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !352

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !353

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !355
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !356
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !357
  %conv = trunc i64 %call14 to i32, !dbg !357
  store i32 %conv, i32* %recvResult, align 4, !dbg !358
  %8 = load i32, i32* %recvResult, align 4, !dbg !359
  %cmp15 = icmp eq i32 %8, -1, !dbg !361
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !362

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !363
  %cmp17 = icmp eq i32 %9, 0, !dbg !364
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !365

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !366

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !368
  %idxprom = sext i32 %10 to i64, !dbg !369
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !369
  store i8 0, i8* %arrayidx, align 1, !dbg !370
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !371
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !372
  store i32 %call22, i32* %data, align 4, !dbg !373
  br label %do.end, !dbg !374

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !375
  %cmp23 = icmp ne i32 %11, -1, !dbg !377
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !378

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !379
  %call26 = call i32 @close(i32 %12), !dbg !381
  br label %if.end27, !dbg !382

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !383
  %cmp28 = icmp ne i32 %13, -1, !dbg !385
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !386

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !387
  %call31 = call i32 @close(i32 %14), !dbg !389
  br label %if.end32, !dbg !390

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !391, metadata !DIExpression()), !dbg !393
  %15 = load i32, i32* %data, align 4, !dbg !394
  store i32 %15, i32* %dataCopy, align 4, !dbg !393
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !395, metadata !DIExpression()), !dbg !396
  %16 = load i32, i32* %dataCopy, align 4, !dbg !397
  store i32 %16, i32* %data33, align 4, !dbg !396
  call void @llvm.dbg.declare(metadata i32* %i, metadata !398, metadata !DIExpression()), !dbg !400
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !401, metadata !DIExpression()), !dbg !402
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !402
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !402
  %18 = load i32, i32* %data33, align 4, !dbg !403
  %cmp34 = icmp sge i32 %18, 0, !dbg !405
  br i1 %cmp34, label %land.lhs.true, label %if.else, !dbg !406

land.lhs.true:                                    ; preds = %if.end32
  %19 = load i32, i32* %data33, align 4, !dbg !407
  %cmp36 = icmp slt i32 %19, 10, !dbg !408
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !409

if.then38:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data33, align 4, !dbg !410
  %idxprom39 = sext i32 %20 to i64, !dbg !412
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !412
  store i32 1, i32* %arrayidx40, align 4, !dbg !413
  store i32 0, i32* %i, align 4, !dbg !414
  br label %for.cond, !dbg !416

for.cond:                                         ; preds = %for.inc, %if.then38
  %21 = load i32, i32* %i, align 4, !dbg !417
  %cmp41 = icmp slt i32 %21, 10, !dbg !419
  br i1 %cmp41, label %for.body, label %for.end, !dbg !420

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !421
  %idxprom43 = sext i32 %22 to i64, !dbg !423
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !423
  %23 = load i32, i32* %arrayidx44, align 4, !dbg !423
  call void @printIntLine(i32 %23), !dbg !424
  br label %for.inc, !dbg !425

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !426
  %inc = add nsw i32 %24, 1, !dbg !426
  store i32 %inc, i32* %i, align 4, !dbg !426
  br label %for.cond, !dbg !427, !llvm.loop !428

for.end:                                          ; preds = %for.cond
  br label %if.end45, !dbg !430

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !431
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end
  ret void, !dbg !433
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_31_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_31.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !71, line: 54, type: !76)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 49, column: 5)
!81 = !DILocation(line: 54, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !71, line: 55, type: !83)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !84)
!84 = !{!85, !86, !90, !94}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !83, file: !17, line: 240, baseType: !56, size: 16)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !83, file: !17, line: 241, baseType: !87, size: 16, offset: 16)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !83, file: !17, line: 242, baseType: !91, size: 32, offset: 32)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !92)
!92 = !{!93}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !91, file: !17, line: 33, baseType: !46, size: 32)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !83, file: !17, line: 245, baseType: !95, size: 64, offset: 64)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 64, elements: !97)
!96 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!97 = !{!98}
!98 = !DISubrange(count: 8)
!99 = !DILocation(line: 55, column: 28, scope: !80)
!100 = !DILocalVariable(name: "listenSocket", scope: !80, file: !71, line: 56, type: !76)
!101 = !DILocation(line: 56, column: 16, scope: !80)
!102 = !DILocalVariable(name: "acceptSocket", scope: !80, file: !71, line: 57, type: !76)
!103 = !DILocation(line: 57, column: 16, scope: !80)
!104 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !71, line: 58, type: !60)
!105 = !DILocation(line: 58, column: 14, scope: !80)
!106 = !DILocation(line: 59, column: 9, scope: !80)
!107 = !DILocation(line: 69, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !80, file: !71, line: 60, column: 9)
!109 = !DILocation(line: 69, column: 26, scope: !108)
!110 = !DILocation(line: 70, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !71, line: 70, column: 17)
!112 = !DILocation(line: 70, column: 30, scope: !111)
!113 = !DILocation(line: 70, column: 17, scope: !108)
!114 = !DILocation(line: 72, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !71, line: 71, column: 13)
!116 = !DILocation(line: 74, column: 13, scope: !108)
!117 = !DILocation(line: 75, column: 21, scope: !108)
!118 = !DILocation(line: 75, column: 32, scope: !108)
!119 = !DILocation(line: 76, column: 21, scope: !108)
!120 = !DILocation(line: 76, column: 30, scope: !108)
!121 = !DILocation(line: 76, column: 37, scope: !108)
!122 = !DILocation(line: 77, column: 32, scope: !108)
!123 = !DILocation(line: 77, column: 21, scope: !108)
!124 = !DILocation(line: 77, column: 30, scope: !108)
!125 = !DILocation(line: 78, column: 22, scope: !126)
!126 = distinct !DILexicalBlock(scope: !108, file: !71, line: 78, column: 17)
!127 = !DILocation(line: 78, column: 36, scope: !126)
!128 = !DILocation(line: 78, column: 17, scope: !126)
!129 = !DILocation(line: 78, column: 81, scope: !126)
!130 = !DILocation(line: 78, column: 17, scope: !108)
!131 = !DILocation(line: 80, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !71, line: 79, column: 13)
!133 = !DILocation(line: 82, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !108, file: !71, line: 82, column: 17)
!135 = !DILocation(line: 82, column: 17, scope: !134)
!136 = !DILocation(line: 82, column: 54, scope: !134)
!137 = !DILocation(line: 82, column: 17, scope: !108)
!138 = !DILocation(line: 84, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !71, line: 83, column: 13)
!140 = !DILocation(line: 86, column: 35, scope: !108)
!141 = !DILocation(line: 86, column: 28, scope: !108)
!142 = !DILocation(line: 86, column: 26, scope: !108)
!143 = !DILocation(line: 87, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !108, file: !71, line: 87, column: 17)
!145 = !DILocation(line: 87, column: 30, scope: !144)
!146 = !DILocation(line: 87, column: 17, scope: !108)
!147 = !DILocation(line: 89, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !71, line: 88, column: 13)
!149 = !DILocation(line: 92, column: 31, scope: !108)
!150 = !DILocation(line: 92, column: 45, scope: !108)
!151 = !DILocation(line: 92, column: 26, scope: !108)
!152 = !DILocation(line: 92, column: 24, scope: !108)
!153 = !DILocation(line: 93, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !108, file: !71, line: 93, column: 17)
!155 = !DILocation(line: 93, column: 28, scope: !154)
!156 = !DILocation(line: 93, column: 44, scope: !154)
!157 = !DILocation(line: 93, column: 47, scope: !154)
!158 = !DILocation(line: 93, column: 58, scope: !154)
!159 = !DILocation(line: 93, column: 17, scope: !108)
!160 = !DILocation(line: 95, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !71, line: 94, column: 13)
!162 = !DILocation(line: 98, column: 25, scope: !108)
!163 = !DILocation(line: 98, column: 13, scope: !108)
!164 = !DILocation(line: 98, column: 37, scope: !108)
!165 = !DILocation(line: 100, column: 25, scope: !108)
!166 = !DILocation(line: 100, column: 20, scope: !108)
!167 = !DILocation(line: 100, column: 18, scope: !108)
!168 = !DILocation(line: 101, column: 9, scope: !108)
!169 = !DILocation(line: 103, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !80, file: !71, line: 103, column: 13)
!171 = !DILocation(line: 103, column: 26, scope: !170)
!172 = !DILocation(line: 103, column: 13, scope: !80)
!173 = !DILocation(line: 105, column: 26, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !71, line: 104, column: 9)
!175 = !DILocation(line: 105, column: 13, scope: !174)
!176 = !DILocation(line: 106, column: 9, scope: !174)
!177 = !DILocation(line: 107, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !80, file: !71, line: 107, column: 13)
!179 = !DILocation(line: 107, column: 26, scope: !178)
!180 = !DILocation(line: 107, column: 13, scope: !80)
!181 = !DILocation(line: 109, column: 26, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !71, line: 108, column: 9)
!183 = !DILocation(line: 109, column: 13, scope: !182)
!184 = !DILocation(line: 110, column: 9, scope: !182)
!185 = !DILocalVariable(name: "dataCopy", scope: !186, file: !71, line: 119, type: !76)
!186 = distinct !DILexicalBlock(scope: !70, file: !71, line: 118, column: 5)
!187 = !DILocation(line: 119, column: 13, scope: !186)
!188 = !DILocation(line: 119, column: 24, scope: !186)
!189 = !DILocalVariable(name: "data", scope: !186, file: !71, line: 120, type: !76)
!190 = !DILocation(line: 120, column: 13, scope: !186)
!191 = !DILocation(line: 120, column: 20, scope: !186)
!192 = !DILocalVariable(name: "i", scope: !193, file: !71, line: 122, type: !76)
!193 = distinct !DILexicalBlock(scope: !186, file: !71, line: 121, column: 9)
!194 = !DILocation(line: 122, column: 17, scope: !193)
!195 = !DILocalVariable(name: "buffer", scope: !193, file: !71, line: 123, type: !196)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !197)
!197 = !{!198}
!198 = !DISubrange(count: 10)
!199 = !DILocation(line: 123, column: 17, scope: !193)
!200 = !DILocation(line: 126, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !193, file: !71, line: 126, column: 17)
!202 = !DILocation(line: 126, column: 22, scope: !201)
!203 = !DILocation(line: 126, column: 17, scope: !193)
!204 = !DILocation(line: 128, column: 24, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !71, line: 127, column: 13)
!206 = !DILocation(line: 128, column: 17, scope: !205)
!207 = !DILocation(line: 128, column: 30, scope: !205)
!208 = !DILocation(line: 130, column: 23, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !71, line: 130, column: 17)
!210 = !DILocation(line: 130, column: 21, scope: !209)
!211 = !DILocation(line: 130, column: 28, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !71, line: 130, column: 17)
!213 = !DILocation(line: 130, column: 30, scope: !212)
!214 = !DILocation(line: 130, column: 17, scope: !209)
!215 = !DILocation(line: 132, column: 41, scope: !216)
!216 = distinct !DILexicalBlock(scope: !212, file: !71, line: 131, column: 17)
!217 = !DILocation(line: 132, column: 34, scope: !216)
!218 = !DILocation(line: 132, column: 21, scope: !216)
!219 = !DILocation(line: 133, column: 17, scope: !216)
!220 = !DILocation(line: 130, column: 37, scope: !212)
!221 = !DILocation(line: 130, column: 17, scope: !212)
!222 = distinct !{!222, !214, !223, !224}
!223 = !DILocation(line: 133, column: 17, scope: !209)
!224 = !{!"llvm.loop.mustprogress"}
!225 = !DILocation(line: 134, column: 13, scope: !205)
!226 = !DILocation(line: 137, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !201, file: !71, line: 136, column: 13)
!228 = !DILocation(line: 141, column: 1, scope: !70)
!229 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_31_good", scope: !71, file: !71, line: 280, type: !72, scopeLine: 281, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!230 = !DILocation(line: 282, column: 5, scope: !229)
!231 = !DILocation(line: 283, column: 5, scope: !229)
!232 = !DILocation(line: 284, column: 1, scope: !229)
!233 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 294, type: !234, scopeLine: 295, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!234 = !DISubroutineType(types: !235)
!235 = !{!76, !76, !236}
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64)
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!238 = !DILocalVariable(name: "argc", arg: 1, scope: !233, file: !71, line: 294, type: !76)
!239 = !DILocation(line: 294, column: 14, scope: !233)
!240 = !DILocalVariable(name: "argv", arg: 2, scope: !233, file: !71, line: 294, type: !236)
!241 = !DILocation(line: 294, column: 27, scope: !233)
!242 = !DILocation(line: 297, column: 22, scope: !233)
!243 = !DILocation(line: 297, column: 12, scope: !233)
!244 = !DILocation(line: 297, column: 5, scope: !233)
!245 = !DILocation(line: 299, column: 5, scope: !233)
!246 = !DILocation(line: 300, column: 5, scope: !233)
!247 = !DILocation(line: 301, column: 5, scope: !233)
!248 = !DILocation(line: 304, column: 5, scope: !233)
!249 = !DILocation(line: 305, column: 5, scope: !233)
!250 = !DILocation(line: 306, column: 5, scope: !233)
!251 = !DILocation(line: 308, column: 5, scope: !233)
!252 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 148, type: !72, scopeLine: 149, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!253 = !DILocalVariable(name: "data", scope: !252, file: !71, line: 150, type: !76)
!254 = !DILocation(line: 150, column: 9, scope: !252)
!255 = !DILocation(line: 152, column: 10, scope: !252)
!256 = !DILocation(line: 155, column: 10, scope: !252)
!257 = !DILocalVariable(name: "dataCopy", scope: !258, file: !71, line: 157, type: !76)
!258 = distinct !DILexicalBlock(scope: !252, file: !71, line: 156, column: 5)
!259 = !DILocation(line: 157, column: 13, scope: !258)
!260 = !DILocation(line: 157, column: 24, scope: !258)
!261 = !DILocalVariable(name: "data", scope: !258, file: !71, line: 158, type: !76)
!262 = !DILocation(line: 158, column: 13, scope: !258)
!263 = !DILocation(line: 158, column: 20, scope: !258)
!264 = !DILocalVariable(name: "i", scope: !265, file: !71, line: 160, type: !76)
!265 = distinct !DILexicalBlock(scope: !258, file: !71, line: 159, column: 9)
!266 = !DILocation(line: 160, column: 17, scope: !265)
!267 = !DILocalVariable(name: "buffer", scope: !265, file: !71, line: 161, type: !196)
!268 = !DILocation(line: 161, column: 17, scope: !265)
!269 = !DILocation(line: 164, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !265, file: !71, line: 164, column: 17)
!271 = !DILocation(line: 164, column: 22, scope: !270)
!272 = !DILocation(line: 164, column: 17, scope: !265)
!273 = !DILocation(line: 166, column: 24, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !71, line: 165, column: 13)
!275 = !DILocation(line: 166, column: 17, scope: !274)
!276 = !DILocation(line: 166, column: 30, scope: !274)
!277 = !DILocation(line: 168, column: 23, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !71, line: 168, column: 17)
!279 = !DILocation(line: 168, column: 21, scope: !278)
!280 = !DILocation(line: 168, column: 28, scope: !281)
!281 = distinct !DILexicalBlock(scope: !278, file: !71, line: 168, column: 17)
!282 = !DILocation(line: 168, column: 30, scope: !281)
!283 = !DILocation(line: 168, column: 17, scope: !278)
!284 = !DILocation(line: 170, column: 41, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !71, line: 169, column: 17)
!286 = !DILocation(line: 170, column: 34, scope: !285)
!287 = !DILocation(line: 170, column: 21, scope: !285)
!288 = !DILocation(line: 171, column: 17, scope: !285)
!289 = !DILocation(line: 168, column: 37, scope: !281)
!290 = !DILocation(line: 168, column: 17, scope: !281)
!291 = distinct !{!291, !283, !292, !224}
!292 = !DILocation(line: 171, column: 17, scope: !278)
!293 = !DILocation(line: 172, column: 13, scope: !274)
!294 = !DILocation(line: 175, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !270, file: !71, line: 174, column: 13)
!296 = !DILocation(line: 179, column: 1, scope: !252)
!297 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 182, type: !72, scopeLine: 183, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!298 = !DILocalVariable(name: "data", scope: !297, file: !71, line: 184, type: !76)
!299 = !DILocation(line: 184, column: 9, scope: !297)
!300 = !DILocation(line: 186, column: 10, scope: !297)
!301 = !DILocalVariable(name: "recvResult", scope: !302, file: !71, line: 192, type: !76)
!302 = distinct !DILexicalBlock(scope: !297, file: !71, line: 187, column: 5)
!303 = !DILocation(line: 192, column: 13, scope: !302)
!304 = !DILocalVariable(name: "service", scope: !302, file: !71, line: 193, type: !83)
!305 = !DILocation(line: 193, column: 28, scope: !302)
!306 = !DILocalVariable(name: "listenSocket", scope: !302, file: !71, line: 194, type: !76)
!307 = !DILocation(line: 194, column: 16, scope: !302)
!308 = !DILocalVariable(name: "acceptSocket", scope: !302, file: !71, line: 195, type: !76)
!309 = !DILocation(line: 195, column: 16, scope: !302)
!310 = !DILocalVariable(name: "inputBuffer", scope: !302, file: !71, line: 196, type: !60)
!311 = !DILocation(line: 196, column: 14, scope: !302)
!312 = !DILocation(line: 197, column: 9, scope: !302)
!313 = !DILocation(line: 207, column: 28, scope: !314)
!314 = distinct !DILexicalBlock(scope: !302, file: !71, line: 198, column: 9)
!315 = !DILocation(line: 207, column: 26, scope: !314)
!316 = !DILocation(line: 208, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !314, file: !71, line: 208, column: 17)
!318 = !DILocation(line: 208, column: 30, scope: !317)
!319 = !DILocation(line: 208, column: 17, scope: !314)
!320 = !DILocation(line: 210, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !71, line: 209, column: 13)
!322 = !DILocation(line: 212, column: 13, scope: !314)
!323 = !DILocation(line: 213, column: 21, scope: !314)
!324 = !DILocation(line: 213, column: 32, scope: !314)
!325 = !DILocation(line: 214, column: 21, scope: !314)
!326 = !DILocation(line: 214, column: 30, scope: !314)
!327 = !DILocation(line: 214, column: 37, scope: !314)
!328 = !DILocation(line: 215, column: 32, scope: !314)
!329 = !DILocation(line: 215, column: 21, scope: !314)
!330 = !DILocation(line: 215, column: 30, scope: !314)
!331 = !DILocation(line: 216, column: 22, scope: !332)
!332 = distinct !DILexicalBlock(scope: !314, file: !71, line: 216, column: 17)
!333 = !DILocation(line: 216, column: 36, scope: !332)
!334 = !DILocation(line: 216, column: 17, scope: !332)
!335 = !DILocation(line: 216, column: 81, scope: !332)
!336 = !DILocation(line: 216, column: 17, scope: !314)
!337 = !DILocation(line: 218, column: 17, scope: !338)
!338 = distinct !DILexicalBlock(scope: !332, file: !71, line: 217, column: 13)
!339 = !DILocation(line: 220, column: 24, scope: !340)
!340 = distinct !DILexicalBlock(scope: !314, file: !71, line: 220, column: 17)
!341 = !DILocation(line: 220, column: 17, scope: !340)
!342 = !DILocation(line: 220, column: 54, scope: !340)
!343 = !DILocation(line: 220, column: 17, scope: !314)
!344 = !DILocation(line: 222, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !340, file: !71, line: 221, column: 13)
!346 = !DILocation(line: 224, column: 35, scope: !314)
!347 = !DILocation(line: 224, column: 28, scope: !314)
!348 = !DILocation(line: 224, column: 26, scope: !314)
!349 = !DILocation(line: 225, column: 17, scope: !350)
!350 = distinct !DILexicalBlock(scope: !314, file: !71, line: 225, column: 17)
!351 = !DILocation(line: 225, column: 30, scope: !350)
!352 = !DILocation(line: 225, column: 17, scope: !314)
!353 = !DILocation(line: 227, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !71, line: 226, column: 13)
!355 = !DILocation(line: 230, column: 31, scope: !314)
!356 = !DILocation(line: 230, column: 45, scope: !314)
!357 = !DILocation(line: 230, column: 26, scope: !314)
!358 = !DILocation(line: 230, column: 24, scope: !314)
!359 = !DILocation(line: 231, column: 17, scope: !360)
!360 = distinct !DILexicalBlock(scope: !314, file: !71, line: 231, column: 17)
!361 = !DILocation(line: 231, column: 28, scope: !360)
!362 = !DILocation(line: 231, column: 44, scope: !360)
!363 = !DILocation(line: 231, column: 47, scope: !360)
!364 = !DILocation(line: 231, column: 58, scope: !360)
!365 = !DILocation(line: 231, column: 17, scope: !314)
!366 = !DILocation(line: 233, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !360, file: !71, line: 232, column: 13)
!368 = !DILocation(line: 236, column: 25, scope: !314)
!369 = !DILocation(line: 236, column: 13, scope: !314)
!370 = !DILocation(line: 236, column: 37, scope: !314)
!371 = !DILocation(line: 238, column: 25, scope: !314)
!372 = !DILocation(line: 238, column: 20, scope: !314)
!373 = !DILocation(line: 238, column: 18, scope: !314)
!374 = !DILocation(line: 239, column: 9, scope: !314)
!375 = !DILocation(line: 241, column: 13, scope: !376)
!376 = distinct !DILexicalBlock(scope: !302, file: !71, line: 241, column: 13)
!377 = !DILocation(line: 241, column: 26, scope: !376)
!378 = !DILocation(line: 241, column: 13, scope: !302)
!379 = !DILocation(line: 243, column: 26, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !71, line: 242, column: 9)
!381 = !DILocation(line: 243, column: 13, scope: !380)
!382 = !DILocation(line: 244, column: 9, scope: !380)
!383 = !DILocation(line: 245, column: 13, scope: !384)
!384 = distinct !DILexicalBlock(scope: !302, file: !71, line: 245, column: 13)
!385 = !DILocation(line: 245, column: 26, scope: !384)
!386 = !DILocation(line: 245, column: 13, scope: !302)
!387 = !DILocation(line: 247, column: 26, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !71, line: 246, column: 9)
!389 = !DILocation(line: 247, column: 13, scope: !388)
!390 = !DILocation(line: 248, column: 9, scope: !388)
!391 = !DILocalVariable(name: "dataCopy", scope: !392, file: !71, line: 257, type: !76)
!392 = distinct !DILexicalBlock(scope: !297, file: !71, line: 256, column: 5)
!393 = !DILocation(line: 257, column: 13, scope: !392)
!394 = !DILocation(line: 257, column: 24, scope: !392)
!395 = !DILocalVariable(name: "data", scope: !392, file: !71, line: 258, type: !76)
!396 = !DILocation(line: 258, column: 13, scope: !392)
!397 = !DILocation(line: 258, column: 20, scope: !392)
!398 = !DILocalVariable(name: "i", scope: !399, file: !71, line: 260, type: !76)
!399 = distinct !DILexicalBlock(scope: !392, file: !71, line: 259, column: 9)
!400 = !DILocation(line: 260, column: 17, scope: !399)
!401 = !DILocalVariable(name: "buffer", scope: !399, file: !71, line: 261, type: !196)
!402 = !DILocation(line: 261, column: 17, scope: !399)
!403 = !DILocation(line: 263, column: 17, scope: !404)
!404 = distinct !DILexicalBlock(scope: !399, file: !71, line: 263, column: 17)
!405 = !DILocation(line: 263, column: 22, scope: !404)
!406 = !DILocation(line: 263, column: 27, scope: !404)
!407 = !DILocation(line: 263, column: 30, scope: !404)
!408 = !DILocation(line: 263, column: 35, scope: !404)
!409 = !DILocation(line: 263, column: 17, scope: !399)
!410 = !DILocation(line: 265, column: 24, scope: !411)
!411 = distinct !DILexicalBlock(scope: !404, file: !71, line: 264, column: 13)
!412 = !DILocation(line: 265, column: 17, scope: !411)
!413 = !DILocation(line: 265, column: 30, scope: !411)
!414 = !DILocation(line: 267, column: 23, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !71, line: 267, column: 17)
!416 = !DILocation(line: 267, column: 21, scope: !415)
!417 = !DILocation(line: 267, column: 28, scope: !418)
!418 = distinct !DILexicalBlock(scope: !415, file: !71, line: 267, column: 17)
!419 = !DILocation(line: 267, column: 30, scope: !418)
!420 = !DILocation(line: 267, column: 17, scope: !415)
!421 = !DILocation(line: 269, column: 41, scope: !422)
!422 = distinct !DILexicalBlock(scope: !418, file: !71, line: 268, column: 17)
!423 = !DILocation(line: 269, column: 34, scope: !422)
!424 = !DILocation(line: 269, column: 21, scope: !422)
!425 = !DILocation(line: 270, column: 17, scope: !422)
!426 = !DILocation(line: 267, column: 37, scope: !418)
!427 = !DILocation(line: 267, column: 17, scope: !418)
!428 = distinct !{!428, !420, !429, !224}
!429 = !DILocation(line: 270, column: 17, scope: !415)
!430 = !DILocation(line: 271, column: 13, scope: !411)
!431 = !DILocation(line: 274, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !404, file: !71, line: 273, column: 13)
!433 = !DILocation(line: 278, column: 1, scope: !297)
