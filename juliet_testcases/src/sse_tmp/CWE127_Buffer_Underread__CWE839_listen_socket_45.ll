; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_45.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@CWE127_Buffer_Underread__CWE839_listen_socket_45_badData = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@CWE127_Buffer_Underread__CWE839_listen_socket_45_goodG2BData = internal global i32 0, align 4, !dbg !67
@CWE127_Buffer_Underread__CWE839_listen_socket_45_goodB2GData = internal global i32 0, align 4, !dbg !71
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_45_bad() #0 !dbg !79 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32 -1, i32* %data, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !86, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !89, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %listenSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %acceptSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  br label %do.body, !dbg !113

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !114
  store i32 %call, i32* %listenSocket, align 4, !dbg !116
  %0 = load i32, i32* %listenSocket, align 4, !dbg !117
  %cmp = icmp eq i32 %0, -1, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !121

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !123
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !124
  store i16 2, i16* %sin_family, align 4, !dbg !125
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !126
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !127
  store i32 0, i32* %s_addr, align 4, !dbg !128
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !129
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !130
  store i16 %call1, i16* %sin_port, align 2, !dbg !131
  %2 = load i32, i32* %listenSocket, align 4, !dbg !132
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !134
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !135
  %cmp3 = icmp eq i32 %call2, -1, !dbg !136
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !137

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !138

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !142
  %cmp7 = icmp eq i32 %call6, -1, !dbg !143
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !144

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !145

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !147
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !148
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !149
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !150
  %cmp11 = icmp eq i32 %6, -1, !dbg !152
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !153

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !154

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !156
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !157
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !158
  %conv = trunc i64 %call14 to i32, !dbg !158
  store i32 %conv, i32* %recvResult, align 4, !dbg !159
  %8 = load i32, i32* %recvResult, align 4, !dbg !160
  %cmp15 = icmp eq i32 %8, -1, !dbg !162
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !163

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !164
  %cmp17 = icmp eq i32 %9, 0, !dbg !165
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !166

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !167

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !169
  %idxprom = sext i32 %10 to i64, !dbg !170
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !172
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !173
  store i32 %call22, i32* %data, align 4, !dbg !174
  br label %do.end, !dbg !175

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !176
  %cmp23 = icmp ne i32 %11, -1, !dbg !178
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !179

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !180
  %call26 = call i32 @close(i32 %12), !dbg !182
  br label %if.end27, !dbg !183

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !184
  %cmp28 = icmp ne i32 %13, -1, !dbg !186
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !187

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !188
  %call31 = call i32 @close(i32 %14), !dbg !190
  br label %if.end32, !dbg !191

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !192
  store i32 %15, i32* @CWE127_Buffer_Underread__CWE839_listen_socket_45_badData, align 4, !dbg !193
  call void @badSink(), !dbg !194
  ret void, !dbg !195
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
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_45_good() #0 !dbg !196 {
entry:
  call void @goodG2B(), !dbg !197
  call void @goodB2G(), !dbg !198
  ret void, !dbg !199
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !200 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !205, metadata !DIExpression()), !dbg !206
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !207, metadata !DIExpression()), !dbg !208
  %call = call i64 @time(i64* null) #7, !dbg !209
  %conv = trunc i64 %call to i32, !dbg !210
  call void @srand(i32 %conv) #7, !dbg !211
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !212
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_45_good(), !dbg !213
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !214
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !215
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_45_bad(), !dbg !216
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !217
  ret i32 0, !dbg !218
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !219 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !220, metadata !DIExpression()), !dbg !221
  %0 = load i32, i32* @CWE127_Buffer_Underread__CWE839_listen_socket_45_badData, align 4, !dbg !222
  store i32 %0, i32* %data, align 4, !dbg !221
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !223, metadata !DIExpression()), !dbg !228
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !228
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !228
  %2 = load i32, i32* %data, align 4, !dbg !229
  %cmp = icmp slt i32 %2, 10, !dbg !231
  br i1 %cmp, label %if.then, label %if.else, !dbg !232

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !233
  %idxprom = sext i32 %3 to i64, !dbg !235
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !235
  %4 = load i32, i32* %arrayidx, align 4, !dbg !235
  call void @printIntLine(i32 %4), !dbg !236
  br label %if.end, !dbg !237

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !238
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !240
}

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !241 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !242, metadata !DIExpression()), !dbg !243
  store i32 -1, i32* %data, align 4, !dbg !244
  store i32 7, i32* %data, align 4, !dbg !245
  %0 = load i32, i32* %data, align 4, !dbg !246
  store i32 %0, i32* @CWE127_Buffer_Underread__CWE839_listen_socket_45_goodG2BData, align 4, !dbg !247
  call void @goodG2BSink(), !dbg !248
  ret void, !dbg !249
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !250 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !251, metadata !DIExpression()), !dbg !252
  %0 = load i32, i32* @CWE127_Buffer_Underread__CWE839_listen_socket_45_goodG2BData, align 4, !dbg !253
  store i32 %0, i32* %data, align 4, !dbg !252
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !254, metadata !DIExpression()), !dbg !256
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !256
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !256
  %2 = load i32, i32* %data, align 4, !dbg !257
  %cmp = icmp slt i32 %2, 10, !dbg !259
  br i1 %cmp, label %if.then, label %if.else, !dbg !260

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !261
  %idxprom = sext i32 %3 to i64, !dbg !263
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !263
  %4 = load i32, i32* %arrayidx, align 4, !dbg !263
  call void @printIntLine(i32 %4), !dbg !264
  br label %if.end, !dbg !265

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !266
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !268
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !269 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !270, metadata !DIExpression()), !dbg !271
  store i32 -1, i32* %data, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !273, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !276, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !278, metadata !DIExpression()), !dbg !279
  store i32 -1, i32* %listenSocket, align 4, !dbg !279
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !280, metadata !DIExpression()), !dbg !281
  store i32 -1, i32* %acceptSocket, align 4, !dbg !281
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !282, metadata !DIExpression()), !dbg !283
  br label %do.body, !dbg !284

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !285
  store i32 %call, i32* %listenSocket, align 4, !dbg !287
  %0 = load i32, i32* %listenSocket, align 4, !dbg !288
  %cmp = icmp eq i32 %0, -1, !dbg !290
  br i1 %cmp, label %if.then, label %if.end, !dbg !291

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !292

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !294
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !294
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !295
  store i16 2, i16* %sin_family, align 4, !dbg !296
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !297
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !298
  store i32 0, i32* %s_addr, align 4, !dbg !299
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !300
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !301
  store i16 %call1, i16* %sin_port, align 2, !dbg !302
  %2 = load i32, i32* %listenSocket, align 4, !dbg !303
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !305
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !306
  %cmp3 = icmp eq i32 %call2, -1, !dbg !307
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !308

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !309

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !311
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !313
  %cmp7 = icmp eq i32 %call6, -1, !dbg !314
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !315

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !316

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !318
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !319
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !320
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !321
  %cmp11 = icmp eq i32 %6, -1, !dbg !323
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !324

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !325

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !327
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !328
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !329
  %conv = trunc i64 %call14 to i32, !dbg !329
  store i32 %conv, i32* %recvResult, align 4, !dbg !330
  %8 = load i32, i32* %recvResult, align 4, !dbg !331
  %cmp15 = icmp eq i32 %8, -1, !dbg !333
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !334

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !335
  %cmp17 = icmp eq i32 %9, 0, !dbg !336
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !337

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !338

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !340
  %idxprom = sext i32 %10 to i64, !dbg !341
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !341
  store i8 0, i8* %arrayidx, align 1, !dbg !342
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !343
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !344
  store i32 %call22, i32* %data, align 4, !dbg !345
  br label %do.end, !dbg !346

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !347
  %cmp23 = icmp ne i32 %11, -1, !dbg !349
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !350

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !351
  %call26 = call i32 @close(i32 %12), !dbg !353
  br label %if.end27, !dbg !354

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !355
  %cmp28 = icmp ne i32 %13, -1, !dbg !357
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !358

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !359
  %call31 = call i32 @close(i32 %14), !dbg !361
  br label %if.end32, !dbg !362

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !363
  store i32 %15, i32* @CWE127_Buffer_Underread__CWE839_listen_socket_45_goodB2GData, align 4, !dbg !364
  call void @goodB2GSink(), !dbg !365
  ret void, !dbg !366
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !367 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !368, metadata !DIExpression()), !dbg !369
  %0 = load i32, i32* @CWE127_Buffer_Underread__CWE839_listen_socket_45_goodB2GData, align 4, !dbg !370
  store i32 %0, i32* %data, align 4, !dbg !369
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !371, metadata !DIExpression()), !dbg !373
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !373
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !373
  %2 = load i32, i32* %data, align 4, !dbg !374
  %cmp = icmp sge i32 %2, 0, !dbg !376
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !377

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !378
  %cmp1 = icmp slt i32 %3, 10, !dbg !379
  br i1 %cmp1, label %if.then, label %if.else, !dbg !380

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !381
  %idxprom = sext i32 %4 to i64, !dbg !383
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !383
  %5 = load i32, i32* %arrayidx, align 4, !dbg !383
  call void @printIntLine(i32 %5), !dbg !384
  br label %if.end, !dbg !385

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !386
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !388
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!73, !74, !75, !76, !77}
!llvm.ident = !{!78}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_listen_socket_45_badData", scope: !2, file: !69, line: 42, type: !70, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !66, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_45.c", directory: "/home/joelyang/SSE-Assessment")
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
!66 = !{!0, !67, !71}
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_listen_socket_45_goodG2BData", scope: !2, file: !69, line: 43, type: !70, isLocal: true, isDefinition: true)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_45.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_listen_socket_45_goodB2GData", scope: !2, file: !69, line: 44, type: !70, isLocal: true, isDefinition: true)
!73 = !{i32 7, !"Dwarf Version", i32 4}
!74 = !{i32 2, !"Debug Info Version", i32 3}
!75 = !{i32 1, !"wchar_size", i32 4}
!76 = !{i32 7, !"uwtable", i32 1}
!77 = !{i32 7, !"frame-pointer", i32 2}
!78 = !{!"clang version 13.0.0"}
!79 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_45_bad", scope: !69, file: !69, line: 66, type: !80, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!80 = !DISubroutineType(types: !81)
!81 = !{null}
!82 = !{}
!83 = !DILocalVariable(name: "data", scope: !79, file: !69, line: 68, type: !70)
!84 = !DILocation(line: 68, column: 9, scope: !79)
!85 = !DILocation(line: 70, column: 10, scope: !79)
!86 = !DILocalVariable(name: "recvResult", scope: !87, file: !69, line: 76, type: !70)
!87 = distinct !DILexicalBlock(scope: !79, file: !69, line: 71, column: 5)
!88 = !DILocation(line: 76, column: 13, scope: !87)
!89 = !DILocalVariable(name: "service", scope: !87, file: !69, line: 77, type: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !91)
!91 = !{!92, !93, !97, !101}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !90, file: !19, line: 240, baseType: !58, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !90, file: !19, line: 241, baseType: !94, size: 16, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 40, baseType: !60)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !90, file: !19, line: 242, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !19, line: 33, baseType: !48, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !90, file: !19, line: 245, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 77, column: 28, scope: !87)
!107 = !DILocalVariable(name: "listenSocket", scope: !87, file: !69, line: 78, type: !70)
!108 = !DILocation(line: 78, column: 16, scope: !87)
!109 = !DILocalVariable(name: "acceptSocket", scope: !87, file: !69, line: 79, type: !70)
!110 = !DILocation(line: 79, column: 16, scope: !87)
!111 = !DILocalVariable(name: "inputBuffer", scope: !87, file: !69, line: 80, type: !62)
!112 = !DILocation(line: 80, column: 14, scope: !87)
!113 = !DILocation(line: 81, column: 9, scope: !87)
!114 = !DILocation(line: 91, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !87, file: !69, line: 82, column: 9)
!116 = !DILocation(line: 91, column: 26, scope: !115)
!117 = !DILocation(line: 92, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !69, line: 92, column: 17)
!119 = !DILocation(line: 92, column: 30, scope: !118)
!120 = !DILocation(line: 92, column: 17, scope: !115)
!121 = !DILocation(line: 94, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !69, line: 93, column: 13)
!123 = !DILocation(line: 96, column: 13, scope: !115)
!124 = !DILocation(line: 97, column: 21, scope: !115)
!125 = !DILocation(line: 97, column: 32, scope: !115)
!126 = !DILocation(line: 98, column: 21, scope: !115)
!127 = !DILocation(line: 98, column: 30, scope: !115)
!128 = !DILocation(line: 98, column: 37, scope: !115)
!129 = !DILocation(line: 99, column: 32, scope: !115)
!130 = !DILocation(line: 99, column: 21, scope: !115)
!131 = !DILocation(line: 99, column: 30, scope: !115)
!132 = !DILocation(line: 100, column: 22, scope: !133)
!133 = distinct !DILexicalBlock(scope: !115, file: !69, line: 100, column: 17)
!134 = !DILocation(line: 100, column: 36, scope: !133)
!135 = !DILocation(line: 100, column: 17, scope: !133)
!136 = !DILocation(line: 100, column: 81, scope: !133)
!137 = !DILocation(line: 100, column: 17, scope: !115)
!138 = !DILocation(line: 102, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !69, line: 101, column: 13)
!140 = !DILocation(line: 104, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !115, file: !69, line: 104, column: 17)
!142 = !DILocation(line: 104, column: 17, scope: !141)
!143 = !DILocation(line: 104, column: 54, scope: !141)
!144 = !DILocation(line: 104, column: 17, scope: !115)
!145 = !DILocation(line: 106, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !69, line: 105, column: 13)
!147 = !DILocation(line: 108, column: 35, scope: !115)
!148 = !DILocation(line: 108, column: 28, scope: !115)
!149 = !DILocation(line: 108, column: 26, scope: !115)
!150 = !DILocation(line: 109, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !115, file: !69, line: 109, column: 17)
!152 = !DILocation(line: 109, column: 30, scope: !151)
!153 = !DILocation(line: 109, column: 17, scope: !115)
!154 = !DILocation(line: 111, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !69, line: 110, column: 13)
!156 = !DILocation(line: 114, column: 31, scope: !115)
!157 = !DILocation(line: 114, column: 45, scope: !115)
!158 = !DILocation(line: 114, column: 26, scope: !115)
!159 = !DILocation(line: 114, column: 24, scope: !115)
!160 = !DILocation(line: 115, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !115, file: !69, line: 115, column: 17)
!162 = !DILocation(line: 115, column: 28, scope: !161)
!163 = !DILocation(line: 115, column: 44, scope: !161)
!164 = !DILocation(line: 115, column: 47, scope: !161)
!165 = !DILocation(line: 115, column: 58, scope: !161)
!166 = !DILocation(line: 115, column: 17, scope: !115)
!167 = !DILocation(line: 117, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !69, line: 116, column: 13)
!169 = !DILocation(line: 120, column: 25, scope: !115)
!170 = !DILocation(line: 120, column: 13, scope: !115)
!171 = !DILocation(line: 120, column: 37, scope: !115)
!172 = !DILocation(line: 122, column: 25, scope: !115)
!173 = !DILocation(line: 122, column: 20, scope: !115)
!174 = !DILocation(line: 122, column: 18, scope: !115)
!175 = !DILocation(line: 123, column: 9, scope: !115)
!176 = !DILocation(line: 125, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !87, file: !69, line: 125, column: 13)
!178 = !DILocation(line: 125, column: 26, scope: !177)
!179 = !DILocation(line: 125, column: 13, scope: !87)
!180 = !DILocation(line: 127, column: 26, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !69, line: 126, column: 9)
!182 = !DILocation(line: 127, column: 13, scope: !181)
!183 = !DILocation(line: 128, column: 9, scope: !181)
!184 = !DILocation(line: 129, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !87, file: !69, line: 129, column: 13)
!186 = !DILocation(line: 129, column: 26, scope: !185)
!187 = !DILocation(line: 129, column: 13, scope: !87)
!188 = !DILocation(line: 131, column: 26, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !69, line: 130, column: 9)
!190 = !DILocation(line: 131, column: 13, scope: !189)
!191 = !DILocation(line: 132, column: 9, scope: !189)
!192 = !DILocation(line: 140, column: 64, scope: !79)
!193 = !DILocation(line: 140, column: 62, scope: !79)
!194 = !DILocation(line: 141, column: 5, scope: !79)
!195 = !DILocation(line: 142, column: 1, scope: !79)
!196 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_45_good", scope: !69, file: !69, line: 275, type: !80, scopeLine: 276, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!197 = !DILocation(line: 277, column: 5, scope: !196)
!198 = !DILocation(line: 278, column: 5, scope: !196)
!199 = !DILocation(line: 279, column: 1, scope: !196)
!200 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 289, type: !201, scopeLine: 290, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!201 = !DISubroutineType(types: !202)
!202 = !{!70, !70, !203}
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!205 = !DILocalVariable(name: "argc", arg: 1, scope: !200, file: !69, line: 289, type: !70)
!206 = !DILocation(line: 289, column: 14, scope: !200)
!207 = !DILocalVariable(name: "argv", arg: 2, scope: !200, file: !69, line: 289, type: !203)
!208 = !DILocation(line: 289, column: 27, scope: !200)
!209 = !DILocation(line: 292, column: 22, scope: !200)
!210 = !DILocation(line: 292, column: 12, scope: !200)
!211 = !DILocation(line: 292, column: 5, scope: !200)
!212 = !DILocation(line: 294, column: 5, scope: !200)
!213 = !DILocation(line: 295, column: 5, scope: !200)
!214 = !DILocation(line: 296, column: 5, scope: !200)
!215 = !DILocation(line: 299, column: 5, scope: !200)
!216 = !DILocation(line: 300, column: 5, scope: !200)
!217 = !DILocation(line: 301, column: 5, scope: !200)
!218 = !DILocation(line: 303, column: 5, scope: !200)
!219 = distinct !DISubprogram(name: "badSink", scope: !69, file: !69, line: 48, type: !80, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!220 = !DILocalVariable(name: "data", scope: !219, file: !69, line: 50, type: !70)
!221 = !DILocation(line: 50, column: 9, scope: !219)
!222 = !DILocation(line: 50, column: 16, scope: !219)
!223 = !DILocalVariable(name: "buffer", scope: !224, file: !69, line: 52, type: !225)
!224 = distinct !DILexicalBlock(scope: !219, file: !69, line: 51, column: 5)
!225 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 320, elements: !226)
!226 = !{!227}
!227 = !DISubrange(count: 10)
!228 = !DILocation(line: 52, column: 13, scope: !224)
!229 = !DILocation(line: 55, column: 13, scope: !230)
!230 = distinct !DILexicalBlock(scope: !224, file: !69, line: 55, column: 13)
!231 = !DILocation(line: 55, column: 18, scope: !230)
!232 = !DILocation(line: 55, column: 13, scope: !224)
!233 = !DILocation(line: 57, column: 33, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !69, line: 56, column: 9)
!235 = !DILocation(line: 57, column: 26, scope: !234)
!236 = !DILocation(line: 57, column: 13, scope: !234)
!237 = !DILocation(line: 58, column: 9, scope: !234)
!238 = !DILocation(line: 61, column: 13, scope: !239)
!239 = distinct !DILexicalBlock(scope: !230, file: !69, line: 60, column: 9)
!240 = !DILocation(line: 64, column: 1, scope: !219)
!241 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 167, type: !80, scopeLine: 168, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!242 = !DILocalVariable(name: "data", scope: !241, file: !69, line: 169, type: !70)
!243 = !DILocation(line: 169, column: 9, scope: !241)
!244 = !DILocation(line: 171, column: 10, scope: !241)
!245 = !DILocation(line: 174, column: 10, scope: !241)
!246 = !DILocation(line: 175, column: 68, scope: !241)
!247 = !DILocation(line: 175, column: 66, scope: !241)
!248 = !DILocation(line: 176, column: 5, scope: !241)
!249 = !DILocation(line: 177, column: 1, scope: !241)
!250 = distinct !DISubprogram(name: "goodG2BSink", scope: !69, file: !69, line: 149, type: !80, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!251 = !DILocalVariable(name: "data", scope: !250, file: !69, line: 151, type: !70)
!252 = !DILocation(line: 151, column: 9, scope: !250)
!253 = !DILocation(line: 151, column: 16, scope: !250)
!254 = !DILocalVariable(name: "buffer", scope: !255, file: !69, line: 153, type: !225)
!255 = distinct !DILexicalBlock(scope: !250, file: !69, line: 152, column: 5)
!256 = !DILocation(line: 153, column: 13, scope: !255)
!257 = !DILocation(line: 156, column: 13, scope: !258)
!258 = distinct !DILexicalBlock(scope: !255, file: !69, line: 156, column: 13)
!259 = !DILocation(line: 156, column: 18, scope: !258)
!260 = !DILocation(line: 156, column: 13, scope: !255)
!261 = !DILocation(line: 158, column: 33, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !69, line: 157, column: 9)
!263 = !DILocation(line: 158, column: 26, scope: !262)
!264 = !DILocation(line: 158, column: 13, scope: !262)
!265 = !DILocation(line: 159, column: 9, scope: !262)
!266 = !DILocation(line: 162, column: 13, scope: !267)
!267 = distinct !DILexicalBlock(scope: !258, file: !69, line: 161, column: 9)
!268 = !DILocation(line: 165, column: 1, scope: !250)
!269 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 197, type: !80, scopeLine: 198, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!270 = !DILocalVariable(name: "data", scope: !269, file: !69, line: 199, type: !70)
!271 = !DILocation(line: 199, column: 9, scope: !269)
!272 = !DILocation(line: 201, column: 10, scope: !269)
!273 = !DILocalVariable(name: "recvResult", scope: !274, file: !69, line: 207, type: !70)
!274 = distinct !DILexicalBlock(scope: !269, file: !69, line: 202, column: 5)
!275 = !DILocation(line: 207, column: 13, scope: !274)
!276 = !DILocalVariable(name: "service", scope: !274, file: !69, line: 208, type: !90)
!277 = !DILocation(line: 208, column: 28, scope: !274)
!278 = !DILocalVariable(name: "listenSocket", scope: !274, file: !69, line: 209, type: !70)
!279 = !DILocation(line: 209, column: 16, scope: !274)
!280 = !DILocalVariable(name: "acceptSocket", scope: !274, file: !69, line: 210, type: !70)
!281 = !DILocation(line: 210, column: 16, scope: !274)
!282 = !DILocalVariable(name: "inputBuffer", scope: !274, file: !69, line: 211, type: !62)
!283 = !DILocation(line: 211, column: 14, scope: !274)
!284 = !DILocation(line: 212, column: 9, scope: !274)
!285 = !DILocation(line: 222, column: 28, scope: !286)
!286 = distinct !DILexicalBlock(scope: !274, file: !69, line: 213, column: 9)
!287 = !DILocation(line: 222, column: 26, scope: !286)
!288 = !DILocation(line: 223, column: 17, scope: !289)
!289 = distinct !DILexicalBlock(scope: !286, file: !69, line: 223, column: 17)
!290 = !DILocation(line: 223, column: 30, scope: !289)
!291 = !DILocation(line: 223, column: 17, scope: !286)
!292 = !DILocation(line: 225, column: 17, scope: !293)
!293 = distinct !DILexicalBlock(scope: !289, file: !69, line: 224, column: 13)
!294 = !DILocation(line: 227, column: 13, scope: !286)
!295 = !DILocation(line: 228, column: 21, scope: !286)
!296 = !DILocation(line: 228, column: 32, scope: !286)
!297 = !DILocation(line: 229, column: 21, scope: !286)
!298 = !DILocation(line: 229, column: 30, scope: !286)
!299 = !DILocation(line: 229, column: 37, scope: !286)
!300 = !DILocation(line: 230, column: 32, scope: !286)
!301 = !DILocation(line: 230, column: 21, scope: !286)
!302 = !DILocation(line: 230, column: 30, scope: !286)
!303 = !DILocation(line: 231, column: 22, scope: !304)
!304 = distinct !DILexicalBlock(scope: !286, file: !69, line: 231, column: 17)
!305 = !DILocation(line: 231, column: 36, scope: !304)
!306 = !DILocation(line: 231, column: 17, scope: !304)
!307 = !DILocation(line: 231, column: 81, scope: !304)
!308 = !DILocation(line: 231, column: 17, scope: !286)
!309 = !DILocation(line: 233, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !304, file: !69, line: 232, column: 13)
!311 = !DILocation(line: 235, column: 24, scope: !312)
!312 = distinct !DILexicalBlock(scope: !286, file: !69, line: 235, column: 17)
!313 = !DILocation(line: 235, column: 17, scope: !312)
!314 = !DILocation(line: 235, column: 54, scope: !312)
!315 = !DILocation(line: 235, column: 17, scope: !286)
!316 = !DILocation(line: 237, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !312, file: !69, line: 236, column: 13)
!318 = !DILocation(line: 239, column: 35, scope: !286)
!319 = !DILocation(line: 239, column: 28, scope: !286)
!320 = !DILocation(line: 239, column: 26, scope: !286)
!321 = !DILocation(line: 240, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !286, file: !69, line: 240, column: 17)
!323 = !DILocation(line: 240, column: 30, scope: !322)
!324 = !DILocation(line: 240, column: 17, scope: !286)
!325 = !DILocation(line: 242, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !69, line: 241, column: 13)
!327 = !DILocation(line: 245, column: 31, scope: !286)
!328 = !DILocation(line: 245, column: 45, scope: !286)
!329 = !DILocation(line: 245, column: 26, scope: !286)
!330 = !DILocation(line: 245, column: 24, scope: !286)
!331 = !DILocation(line: 246, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !286, file: !69, line: 246, column: 17)
!333 = !DILocation(line: 246, column: 28, scope: !332)
!334 = !DILocation(line: 246, column: 44, scope: !332)
!335 = !DILocation(line: 246, column: 47, scope: !332)
!336 = !DILocation(line: 246, column: 58, scope: !332)
!337 = !DILocation(line: 246, column: 17, scope: !286)
!338 = !DILocation(line: 248, column: 17, scope: !339)
!339 = distinct !DILexicalBlock(scope: !332, file: !69, line: 247, column: 13)
!340 = !DILocation(line: 251, column: 25, scope: !286)
!341 = !DILocation(line: 251, column: 13, scope: !286)
!342 = !DILocation(line: 251, column: 37, scope: !286)
!343 = !DILocation(line: 253, column: 25, scope: !286)
!344 = !DILocation(line: 253, column: 20, scope: !286)
!345 = !DILocation(line: 253, column: 18, scope: !286)
!346 = !DILocation(line: 254, column: 9, scope: !286)
!347 = !DILocation(line: 256, column: 13, scope: !348)
!348 = distinct !DILexicalBlock(scope: !274, file: !69, line: 256, column: 13)
!349 = !DILocation(line: 256, column: 26, scope: !348)
!350 = !DILocation(line: 256, column: 13, scope: !274)
!351 = !DILocation(line: 258, column: 26, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !69, line: 257, column: 9)
!353 = !DILocation(line: 258, column: 13, scope: !352)
!354 = !DILocation(line: 259, column: 9, scope: !352)
!355 = !DILocation(line: 260, column: 13, scope: !356)
!356 = distinct !DILexicalBlock(scope: !274, file: !69, line: 260, column: 13)
!357 = !DILocation(line: 260, column: 26, scope: !356)
!358 = !DILocation(line: 260, column: 13, scope: !274)
!359 = !DILocation(line: 262, column: 26, scope: !360)
!360 = distinct !DILexicalBlock(scope: !356, file: !69, line: 261, column: 9)
!361 = !DILocation(line: 262, column: 13, scope: !360)
!362 = !DILocation(line: 263, column: 9, scope: !360)
!363 = !DILocation(line: 271, column: 68, scope: !269)
!364 = !DILocation(line: 271, column: 66, scope: !269)
!365 = !DILocation(line: 272, column: 5, scope: !269)
!366 = !DILocation(line: 273, column: 1, scope: !269)
!367 = distinct !DISubprogram(name: "goodB2GSink", scope: !69, file: !69, line: 180, type: !80, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!368 = !DILocalVariable(name: "data", scope: !367, file: !69, line: 182, type: !70)
!369 = !DILocation(line: 182, column: 9, scope: !367)
!370 = !DILocation(line: 182, column: 16, scope: !367)
!371 = !DILocalVariable(name: "buffer", scope: !372, file: !69, line: 184, type: !225)
!372 = distinct !DILexicalBlock(scope: !367, file: !69, line: 183, column: 5)
!373 = !DILocation(line: 184, column: 13, scope: !372)
!374 = !DILocation(line: 186, column: 13, scope: !375)
!375 = distinct !DILexicalBlock(scope: !372, file: !69, line: 186, column: 13)
!376 = !DILocation(line: 186, column: 18, scope: !375)
!377 = !DILocation(line: 186, column: 23, scope: !375)
!378 = !DILocation(line: 186, column: 26, scope: !375)
!379 = !DILocation(line: 186, column: 31, scope: !375)
!380 = !DILocation(line: 186, column: 13, scope: !372)
!381 = !DILocation(line: 188, column: 33, scope: !382)
!382 = distinct !DILexicalBlock(scope: !375, file: !69, line: 187, column: 9)
!383 = !DILocation(line: 188, column: 26, scope: !382)
!384 = !DILocation(line: 188, column: 13, scope: !382)
!385 = !DILocation(line: 189, column: 9, scope: !382)
!386 = !DILocation(line: 192, column: 13, scope: !387)
!387 = distinct !DILexicalBlock(scope: !375, file: !69, line: 191, column: 9)
!388 = !DILocation(line: 195, column: 1, scope: !367)
