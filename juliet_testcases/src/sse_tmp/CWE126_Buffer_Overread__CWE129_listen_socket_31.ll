; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_31_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data33 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !192, metadata !DIExpression()), !dbg !197
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !197
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !197
  %18 = load i32, i32* %data33, align 4, !dbg !198
  %cmp34 = icmp sge i32 %18, 0, !dbg !200
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !201

if.then36:                                        ; preds = %if.end32
  %19 = load i32, i32* %data33, align 4, !dbg !202
  %idxprom37 = sext i32 %19 to i64, !dbg !204
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !204
  %20 = load i32, i32* %arrayidx38, align 4, !dbg !204
  call void @printIntLine(i32 %20), !dbg !205
  br label %if.end39, !dbg !206

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !207
  br label %if.end39

if.end39:                                         ; preds = %if.else, %if.then36
  ret void, !dbg !209
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_31_good() #0 !dbg !210 {
entry:
  call void @goodG2B(), !dbg !211
  call void @goodB2G(), !dbg !212
  ret void, !dbg !213
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !214 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !219, metadata !DIExpression()), !dbg !220
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !221, metadata !DIExpression()), !dbg !222
  %call = call i64 @time(i64* null) #7, !dbg !223
  %conv = trunc i64 %call to i32, !dbg !224
  call void @srand(i32 %conv) #7, !dbg !225
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !226
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_31_good(), !dbg !227
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !228
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !229
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_31_bad(), !dbg !230
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !231
  ret i32 0, !dbg !232
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !233 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !234, metadata !DIExpression()), !dbg !235
  store i32 -1, i32* %data, align 4, !dbg !236
  store i32 7, i32* %data, align 4, !dbg !237
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !238, metadata !DIExpression()), !dbg !240
  %0 = load i32, i32* %data, align 4, !dbg !241
  store i32 %0, i32* %dataCopy, align 4, !dbg !240
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !242, metadata !DIExpression()), !dbg !243
  %1 = load i32, i32* %dataCopy, align 4, !dbg !244
  store i32 %1, i32* %data1, align 4, !dbg !243
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !245, metadata !DIExpression()), !dbg !247
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !247
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !247
  %3 = load i32, i32* %data1, align 4, !dbg !248
  %cmp = icmp sge i32 %3, 0, !dbg !250
  br i1 %cmp, label %if.then, label %if.else, !dbg !251

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !252
  %idxprom = sext i32 %4 to i64, !dbg !254
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !254
  %5 = load i32, i32* %arrayidx, align 4, !dbg !254
  call void @printIntLine(i32 %5), !dbg !255
  br label %if.end, !dbg !256

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !257
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !259
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !260 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data33 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !261, metadata !DIExpression()), !dbg !262
  store i32 -1, i32* %data, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !264, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !267, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !269, metadata !DIExpression()), !dbg !270
  store i32 -1, i32* %listenSocket, align 4, !dbg !270
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !271, metadata !DIExpression()), !dbg !272
  store i32 -1, i32* %acceptSocket, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !273, metadata !DIExpression()), !dbg !274
  br label %do.body, !dbg !275

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !276
  store i32 %call, i32* %listenSocket, align 4, !dbg !278
  %0 = load i32, i32* %listenSocket, align 4, !dbg !279
  %cmp = icmp eq i32 %0, -1, !dbg !281
  br i1 %cmp, label %if.then, label %if.end, !dbg !282

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !283

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !285
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !285
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !286
  store i16 2, i16* %sin_family, align 4, !dbg !287
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !288
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !289
  store i32 0, i32* %s_addr, align 4, !dbg !290
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !291
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !292
  store i16 %call1, i16* %sin_port, align 2, !dbg !293
  %2 = load i32, i32* %listenSocket, align 4, !dbg !294
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !296
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !297
  %cmp3 = icmp eq i32 %call2, -1, !dbg !298
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !299

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !300

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !302
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !304
  %cmp7 = icmp eq i32 %call6, -1, !dbg !305
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !306

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !307

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !309
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !310
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !311
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !312
  %cmp11 = icmp eq i32 %6, -1, !dbg !314
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !315

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !316

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !318
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !319
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !320
  %conv = trunc i64 %call14 to i32, !dbg !320
  store i32 %conv, i32* %recvResult, align 4, !dbg !321
  %8 = load i32, i32* %recvResult, align 4, !dbg !322
  %cmp15 = icmp eq i32 %8, -1, !dbg !324
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !325

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !326
  %cmp17 = icmp eq i32 %9, 0, !dbg !327
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !328

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !329

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !331
  %idxprom = sext i32 %10 to i64, !dbg !332
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !332
  store i8 0, i8* %arrayidx, align 1, !dbg !333
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !334
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !335
  store i32 %call22, i32* %data, align 4, !dbg !336
  br label %do.end, !dbg !337

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !338
  %cmp23 = icmp ne i32 %11, -1, !dbg !340
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !341

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !342
  %call26 = call i32 @close(i32 %12), !dbg !344
  br label %if.end27, !dbg !345

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !346
  %cmp28 = icmp ne i32 %13, -1, !dbg !348
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !349

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !350
  %call31 = call i32 @close(i32 %14), !dbg !352
  br label %if.end32, !dbg !353

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !354, metadata !DIExpression()), !dbg !356
  %15 = load i32, i32* %data, align 4, !dbg !357
  store i32 %15, i32* %dataCopy, align 4, !dbg !356
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !358, metadata !DIExpression()), !dbg !359
  %16 = load i32, i32* %dataCopy, align 4, !dbg !360
  store i32 %16, i32* %data33, align 4, !dbg !359
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !361, metadata !DIExpression()), !dbg !363
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !363
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !363
  %18 = load i32, i32* %data33, align 4, !dbg !364
  %cmp34 = icmp sge i32 %18, 0, !dbg !366
  br i1 %cmp34, label %land.lhs.true, label %if.else, !dbg !367

land.lhs.true:                                    ; preds = %if.end32
  %19 = load i32, i32* %data33, align 4, !dbg !368
  %cmp36 = icmp slt i32 %19, 10, !dbg !369
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !370

if.then38:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data33, align 4, !dbg !371
  %idxprom39 = sext i32 %20 to i64, !dbg !373
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !373
  %21 = load i32, i32* %arrayidx40, align 4, !dbg !373
  call void @printIntLine(i32 %21), !dbg !374
  br label %if.end41, !dbg !375

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !376
  br label %if.end41

if.end41:                                         ; preds = %if.else, %if.then38
  ret void, !dbg !378
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_31.c", directory: "/root/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_31_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_31.c", directory: "/root/SSE-Assessment")
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
!192 = !DILocalVariable(name: "buffer", scope: !193, file: !71, line: 122, type: !194)
!193 = distinct !DILexicalBlock(scope: !186, file: !71, line: 121, column: 9)
!194 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !195)
!195 = !{!196}
!196 = !DISubrange(count: 10)
!197 = !DILocation(line: 122, column: 17, scope: !193)
!198 = !DILocation(line: 125, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !193, file: !71, line: 125, column: 17)
!200 = !DILocation(line: 125, column: 22, scope: !199)
!201 = !DILocation(line: 125, column: 17, scope: !193)
!202 = !DILocation(line: 127, column: 37, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !71, line: 126, column: 13)
!204 = !DILocation(line: 127, column: 30, scope: !203)
!205 = !DILocation(line: 127, column: 17, scope: !203)
!206 = !DILocation(line: 128, column: 13, scope: !203)
!207 = !DILocation(line: 131, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !199, file: !71, line: 130, column: 13)
!209 = !DILocation(line: 135, column: 1, scope: !70)
!210 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_31_good", scope: !71, file: !71, line: 262, type: !72, scopeLine: 263, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!211 = !DILocation(line: 264, column: 5, scope: !210)
!212 = !DILocation(line: 265, column: 5, scope: !210)
!213 = !DILocation(line: 266, column: 1, scope: !210)
!214 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 276, type: !215, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!215 = !DISubroutineType(types: !216)
!216 = !{!76, !76, !217}
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !218, size: 64)
!218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!219 = !DILocalVariable(name: "argc", arg: 1, scope: !214, file: !71, line: 276, type: !76)
!220 = !DILocation(line: 276, column: 14, scope: !214)
!221 = !DILocalVariable(name: "argv", arg: 2, scope: !214, file: !71, line: 276, type: !217)
!222 = !DILocation(line: 276, column: 27, scope: !214)
!223 = !DILocation(line: 279, column: 22, scope: !214)
!224 = !DILocation(line: 279, column: 12, scope: !214)
!225 = !DILocation(line: 279, column: 5, scope: !214)
!226 = !DILocation(line: 281, column: 5, scope: !214)
!227 = !DILocation(line: 282, column: 5, scope: !214)
!228 = !DILocation(line: 283, column: 5, scope: !214)
!229 = !DILocation(line: 286, column: 5, scope: !214)
!230 = !DILocation(line: 287, column: 5, scope: !214)
!231 = !DILocation(line: 288, column: 5, scope: !214)
!232 = !DILocation(line: 290, column: 5, scope: !214)
!233 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 142, type: !72, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!234 = !DILocalVariable(name: "data", scope: !233, file: !71, line: 144, type: !76)
!235 = !DILocation(line: 144, column: 9, scope: !233)
!236 = !DILocation(line: 146, column: 10, scope: !233)
!237 = !DILocation(line: 149, column: 10, scope: !233)
!238 = !DILocalVariable(name: "dataCopy", scope: !239, file: !71, line: 151, type: !76)
!239 = distinct !DILexicalBlock(scope: !233, file: !71, line: 150, column: 5)
!240 = !DILocation(line: 151, column: 13, scope: !239)
!241 = !DILocation(line: 151, column: 24, scope: !239)
!242 = !DILocalVariable(name: "data", scope: !239, file: !71, line: 152, type: !76)
!243 = !DILocation(line: 152, column: 13, scope: !239)
!244 = !DILocation(line: 152, column: 20, scope: !239)
!245 = !DILocalVariable(name: "buffer", scope: !246, file: !71, line: 154, type: !194)
!246 = distinct !DILexicalBlock(scope: !239, file: !71, line: 153, column: 9)
!247 = !DILocation(line: 154, column: 17, scope: !246)
!248 = !DILocation(line: 157, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !246, file: !71, line: 157, column: 17)
!250 = !DILocation(line: 157, column: 22, scope: !249)
!251 = !DILocation(line: 157, column: 17, scope: !246)
!252 = !DILocation(line: 159, column: 37, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !71, line: 158, column: 13)
!254 = !DILocation(line: 159, column: 30, scope: !253)
!255 = !DILocation(line: 159, column: 17, scope: !253)
!256 = !DILocation(line: 160, column: 13, scope: !253)
!257 = !DILocation(line: 163, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !249, file: !71, line: 162, column: 13)
!259 = !DILocation(line: 167, column: 1, scope: !233)
!260 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 170, type: !72, scopeLine: 171, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!261 = !DILocalVariable(name: "data", scope: !260, file: !71, line: 172, type: !76)
!262 = !DILocation(line: 172, column: 9, scope: !260)
!263 = !DILocation(line: 174, column: 10, scope: !260)
!264 = !DILocalVariable(name: "recvResult", scope: !265, file: !71, line: 180, type: !76)
!265 = distinct !DILexicalBlock(scope: !260, file: !71, line: 175, column: 5)
!266 = !DILocation(line: 180, column: 13, scope: !265)
!267 = !DILocalVariable(name: "service", scope: !265, file: !71, line: 181, type: !83)
!268 = !DILocation(line: 181, column: 28, scope: !265)
!269 = !DILocalVariable(name: "listenSocket", scope: !265, file: !71, line: 182, type: !76)
!270 = !DILocation(line: 182, column: 16, scope: !265)
!271 = !DILocalVariable(name: "acceptSocket", scope: !265, file: !71, line: 183, type: !76)
!272 = !DILocation(line: 183, column: 16, scope: !265)
!273 = !DILocalVariable(name: "inputBuffer", scope: !265, file: !71, line: 184, type: !60)
!274 = !DILocation(line: 184, column: 14, scope: !265)
!275 = !DILocation(line: 185, column: 9, scope: !265)
!276 = !DILocation(line: 195, column: 28, scope: !277)
!277 = distinct !DILexicalBlock(scope: !265, file: !71, line: 186, column: 9)
!278 = !DILocation(line: 195, column: 26, scope: !277)
!279 = !DILocation(line: 196, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !277, file: !71, line: 196, column: 17)
!281 = !DILocation(line: 196, column: 30, scope: !280)
!282 = !DILocation(line: 196, column: 17, scope: !277)
!283 = !DILocation(line: 198, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !71, line: 197, column: 13)
!285 = !DILocation(line: 200, column: 13, scope: !277)
!286 = !DILocation(line: 201, column: 21, scope: !277)
!287 = !DILocation(line: 201, column: 32, scope: !277)
!288 = !DILocation(line: 202, column: 21, scope: !277)
!289 = !DILocation(line: 202, column: 30, scope: !277)
!290 = !DILocation(line: 202, column: 37, scope: !277)
!291 = !DILocation(line: 203, column: 32, scope: !277)
!292 = !DILocation(line: 203, column: 21, scope: !277)
!293 = !DILocation(line: 203, column: 30, scope: !277)
!294 = !DILocation(line: 204, column: 22, scope: !295)
!295 = distinct !DILexicalBlock(scope: !277, file: !71, line: 204, column: 17)
!296 = !DILocation(line: 204, column: 36, scope: !295)
!297 = !DILocation(line: 204, column: 17, scope: !295)
!298 = !DILocation(line: 204, column: 81, scope: !295)
!299 = !DILocation(line: 204, column: 17, scope: !277)
!300 = !DILocation(line: 206, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !295, file: !71, line: 205, column: 13)
!302 = !DILocation(line: 208, column: 24, scope: !303)
!303 = distinct !DILexicalBlock(scope: !277, file: !71, line: 208, column: 17)
!304 = !DILocation(line: 208, column: 17, scope: !303)
!305 = !DILocation(line: 208, column: 54, scope: !303)
!306 = !DILocation(line: 208, column: 17, scope: !277)
!307 = !DILocation(line: 210, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !303, file: !71, line: 209, column: 13)
!309 = !DILocation(line: 212, column: 35, scope: !277)
!310 = !DILocation(line: 212, column: 28, scope: !277)
!311 = !DILocation(line: 212, column: 26, scope: !277)
!312 = !DILocation(line: 213, column: 17, scope: !313)
!313 = distinct !DILexicalBlock(scope: !277, file: !71, line: 213, column: 17)
!314 = !DILocation(line: 213, column: 30, scope: !313)
!315 = !DILocation(line: 213, column: 17, scope: !277)
!316 = !DILocation(line: 215, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !71, line: 214, column: 13)
!318 = !DILocation(line: 218, column: 31, scope: !277)
!319 = !DILocation(line: 218, column: 45, scope: !277)
!320 = !DILocation(line: 218, column: 26, scope: !277)
!321 = !DILocation(line: 218, column: 24, scope: !277)
!322 = !DILocation(line: 219, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !277, file: !71, line: 219, column: 17)
!324 = !DILocation(line: 219, column: 28, scope: !323)
!325 = !DILocation(line: 219, column: 44, scope: !323)
!326 = !DILocation(line: 219, column: 47, scope: !323)
!327 = !DILocation(line: 219, column: 58, scope: !323)
!328 = !DILocation(line: 219, column: 17, scope: !277)
!329 = !DILocation(line: 221, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !323, file: !71, line: 220, column: 13)
!331 = !DILocation(line: 224, column: 25, scope: !277)
!332 = !DILocation(line: 224, column: 13, scope: !277)
!333 = !DILocation(line: 224, column: 37, scope: !277)
!334 = !DILocation(line: 226, column: 25, scope: !277)
!335 = !DILocation(line: 226, column: 20, scope: !277)
!336 = !DILocation(line: 226, column: 18, scope: !277)
!337 = !DILocation(line: 227, column: 9, scope: !277)
!338 = !DILocation(line: 229, column: 13, scope: !339)
!339 = distinct !DILexicalBlock(scope: !265, file: !71, line: 229, column: 13)
!340 = !DILocation(line: 229, column: 26, scope: !339)
!341 = !DILocation(line: 229, column: 13, scope: !265)
!342 = !DILocation(line: 231, column: 26, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !71, line: 230, column: 9)
!344 = !DILocation(line: 231, column: 13, scope: !343)
!345 = !DILocation(line: 232, column: 9, scope: !343)
!346 = !DILocation(line: 233, column: 13, scope: !347)
!347 = distinct !DILexicalBlock(scope: !265, file: !71, line: 233, column: 13)
!348 = !DILocation(line: 233, column: 26, scope: !347)
!349 = !DILocation(line: 233, column: 13, scope: !265)
!350 = !DILocation(line: 235, column: 26, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !71, line: 234, column: 9)
!352 = !DILocation(line: 235, column: 13, scope: !351)
!353 = !DILocation(line: 236, column: 9, scope: !351)
!354 = !DILocalVariable(name: "dataCopy", scope: !355, file: !71, line: 245, type: !76)
!355 = distinct !DILexicalBlock(scope: !260, file: !71, line: 244, column: 5)
!356 = !DILocation(line: 245, column: 13, scope: !355)
!357 = !DILocation(line: 245, column: 24, scope: !355)
!358 = !DILocalVariable(name: "data", scope: !355, file: !71, line: 246, type: !76)
!359 = !DILocation(line: 246, column: 13, scope: !355)
!360 = !DILocation(line: 246, column: 20, scope: !355)
!361 = !DILocalVariable(name: "buffer", scope: !362, file: !71, line: 248, type: !194)
!362 = distinct !DILexicalBlock(scope: !355, file: !71, line: 247, column: 9)
!363 = !DILocation(line: 248, column: 17, scope: !362)
!364 = !DILocation(line: 250, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !362, file: !71, line: 250, column: 17)
!366 = !DILocation(line: 250, column: 22, scope: !365)
!367 = !DILocation(line: 250, column: 27, scope: !365)
!368 = !DILocation(line: 250, column: 30, scope: !365)
!369 = !DILocation(line: 250, column: 35, scope: !365)
!370 = !DILocation(line: 250, column: 17, scope: !362)
!371 = !DILocation(line: 252, column: 37, scope: !372)
!372 = distinct !DILexicalBlock(scope: !365, file: !71, line: 251, column: 13)
!373 = !DILocation(line: 252, column: 30, scope: !372)
!374 = !DILocation(line: 252, column: 17, scope: !372)
!375 = !DILocation(line: 253, column: 13, scope: !372)
!376 = !DILocation(line: 256, column: 17, scope: !377)
!377 = distinct !DILexicalBlock(scope: !365, file: !71, line: 255, column: 13)
!378 = !DILocation(line: 260, column: 1, scope: !260)
