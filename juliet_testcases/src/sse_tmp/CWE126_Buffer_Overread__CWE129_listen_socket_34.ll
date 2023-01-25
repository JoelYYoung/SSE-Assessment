; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType = type { i32 }
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_34_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data33 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType* %myUnion, metadata !78, metadata !DIExpression()), !dbg !84
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
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !193
  store i32 %15, i32* %unionFirst, align 4, !dbg !194
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !195, metadata !DIExpression()), !dbg !197
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !198
  %16 = load i32, i32* %unionSecond, align 4, !dbg !198
  store i32 %16, i32* %data33, align 4, !dbg !197
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !199, metadata !DIExpression()), !dbg !204
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !204
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !204
  %18 = load i32, i32* %data33, align 4, !dbg !205
  %cmp34 = icmp sge i32 %18, 0, !dbg !207
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !208

if.then36:                                        ; preds = %if.end32
  %19 = load i32, i32* %data33, align 4, !dbg !209
  %idxprom37 = sext i32 %19 to i64, !dbg !211
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !211
  %20 = load i32, i32* %arrayidx38, align 4, !dbg !211
  call void @printIntLine(i32 %20), !dbg !212
  br label %if.end39, !dbg !213

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !214
  br label %if.end39

if.end39:                                         ; preds = %if.else, %if.then36
  ret void, !dbg !216
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_34_good() #0 !dbg !217 {
entry:
  call void @goodG2B(), !dbg !218
  call void @goodB2G(), !dbg !219
  ret void, !dbg !220
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !221 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !226, metadata !DIExpression()), !dbg !227
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !228, metadata !DIExpression()), !dbg !229
  %call = call i64 @time(i64* null) #7, !dbg !230
  %conv = trunc i64 %call to i32, !dbg !231
  call void @srand(i32 %conv) #7, !dbg !232
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !233
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_34_good(), !dbg !234
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !235
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !236
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_34_bad(), !dbg !237
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !238
  ret i32 0, !dbg !239
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !240 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !241, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType* %myUnion, metadata !243, metadata !DIExpression()), !dbg !244
  store i32 -1, i32* %data, align 4, !dbg !245
  store i32 7, i32* %data, align 4, !dbg !246
  %0 = load i32, i32* %data, align 4, !dbg !247
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !248
  store i32 %0, i32* %unionFirst, align 4, !dbg !249
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !250, metadata !DIExpression()), !dbg !252
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !253
  %1 = load i32, i32* %unionSecond, align 4, !dbg !253
  store i32 %1, i32* %data1, align 4, !dbg !252
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !254, metadata !DIExpression()), !dbg !256
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !256
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !256
  %3 = load i32, i32* %data1, align 4, !dbg !257
  %cmp = icmp sge i32 %3, 0, !dbg !259
  br i1 %cmp, label %if.then, label %if.else, !dbg !260

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !261
  %idxprom = sext i32 %4 to i64, !dbg !263
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !263
  %5 = load i32, i32* %arrayidx, align 4, !dbg !263
  call void @printIntLine(i32 %5), !dbg !264
  br label %if.end, !dbg !265

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !266
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !268
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !269 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data33 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !270, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType* %myUnion, metadata !272, metadata !DIExpression()), !dbg !273
  store i32 -1, i32* %data, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !275, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !278, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !280, metadata !DIExpression()), !dbg !281
  store i32 -1, i32* %listenSocket, align 4, !dbg !281
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !282, metadata !DIExpression()), !dbg !283
  store i32 -1, i32* %acceptSocket, align 4, !dbg !283
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !284, metadata !DIExpression()), !dbg !285
  br label %do.body, !dbg !286

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !287
  store i32 %call, i32* %listenSocket, align 4, !dbg !289
  %0 = load i32, i32* %listenSocket, align 4, !dbg !290
  %cmp = icmp eq i32 %0, -1, !dbg !292
  br i1 %cmp, label %if.then, label %if.end, !dbg !293

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !294

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !296
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !296
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !297
  store i16 2, i16* %sin_family, align 4, !dbg !298
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !299
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !300
  store i32 0, i32* %s_addr, align 4, !dbg !301
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !302
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !303
  store i16 %call1, i16* %sin_port, align 2, !dbg !304
  %2 = load i32, i32* %listenSocket, align 4, !dbg !305
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !307
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !308
  %cmp3 = icmp eq i32 %call2, -1, !dbg !309
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !310

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !311

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !313
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !315
  %cmp7 = icmp eq i32 %call6, -1, !dbg !316
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !317

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !318

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !320
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !321
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !322
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !323
  %cmp11 = icmp eq i32 %6, -1, !dbg !325
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !326

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !327

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !329
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !330
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !331
  %conv = trunc i64 %call14 to i32, !dbg !331
  store i32 %conv, i32* %recvResult, align 4, !dbg !332
  %8 = load i32, i32* %recvResult, align 4, !dbg !333
  %cmp15 = icmp eq i32 %8, -1, !dbg !335
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !336

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !337
  %cmp17 = icmp eq i32 %9, 0, !dbg !338
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !339

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !340

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !342
  %idxprom = sext i32 %10 to i64, !dbg !343
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !343
  store i8 0, i8* %arrayidx, align 1, !dbg !344
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !345
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !346
  store i32 %call22, i32* %data, align 4, !dbg !347
  br label %do.end, !dbg !348

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !349
  %cmp23 = icmp ne i32 %11, -1, !dbg !351
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !352

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !353
  %call26 = call i32 @close(i32 %12), !dbg !355
  br label %if.end27, !dbg !356

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !357
  %cmp28 = icmp ne i32 %13, -1, !dbg !359
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !360

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !361
  %call31 = call i32 @close(i32 %14), !dbg !363
  br label %if.end32, !dbg !364

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !365
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !366
  store i32 %15, i32* %unionFirst, align 4, !dbg !367
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !368, metadata !DIExpression()), !dbg !370
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType* %myUnion to i32*, !dbg !371
  %16 = load i32, i32* %unionSecond, align 4, !dbg !371
  store i32 %16, i32* %data33, align 4, !dbg !370
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !372, metadata !DIExpression()), !dbg !374
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !374
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !374
  %18 = load i32, i32* %data33, align 4, !dbg !375
  %cmp34 = icmp sge i32 %18, 0, !dbg !377
  br i1 %cmp34, label %land.lhs.true, label %if.else, !dbg !378

land.lhs.true:                                    ; preds = %if.end32
  %19 = load i32, i32* %data33, align 4, !dbg !379
  %cmp36 = icmp slt i32 %19, 10, !dbg !380
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !381

if.then38:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data33, align 4, !dbg !382
  %idxprom39 = sext i32 %20 to i64, !dbg !384
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !384
  %21 = load i32, i32* %arrayidx40, align 4, !dbg !384
  call void @printIntLine(i32 %21), !dbg !385
  br label %if.end41, !dbg !386

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !387
  br label %if.end41

if.end41:                                         ; preds = %if.else, %if.then38
  ret void, !dbg !389
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_34_bad", scope: !71, file: !71, line: 50, type: !72, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 52, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 52, column: 9, scope: !70)
!78 = !DILocalVariable(name: "myUnion", scope: !70, file: !71, line: 53, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__CWE129_listen_socket_34_unionType", file: !71, line: 46, baseType: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !71, line: 42, size: 32, elements: !81)
!81 = !{!82, !83}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !80, file: !71, line: 44, baseType: !76, size: 32)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !80, file: !71, line: 45, baseType: !76, size: 32)
!84 = !DILocation(line: 53, column: 63, scope: !70)
!85 = !DILocation(line: 55, column: 10, scope: !70)
!86 = !DILocalVariable(name: "recvResult", scope: !87, file: !71, line: 61, type: !76)
!87 = distinct !DILexicalBlock(scope: !70, file: !71, line: 56, column: 5)
!88 = !DILocation(line: 61, column: 13, scope: !87)
!89 = !DILocalVariable(name: "service", scope: !87, file: !71, line: 62, type: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !91)
!91 = !{!92, !93, !97, !101}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !90, file: !17, line: 240, baseType: !56, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !90, file: !17, line: 241, baseType: !94, size: 16, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !90, file: !17, line: 242, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !17, line: 33, baseType: !46, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !90, file: !17, line: 245, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 62, column: 28, scope: !87)
!107 = !DILocalVariable(name: "listenSocket", scope: !87, file: !71, line: 63, type: !76)
!108 = !DILocation(line: 63, column: 16, scope: !87)
!109 = !DILocalVariable(name: "acceptSocket", scope: !87, file: !71, line: 64, type: !76)
!110 = !DILocation(line: 64, column: 16, scope: !87)
!111 = !DILocalVariable(name: "inputBuffer", scope: !87, file: !71, line: 65, type: !60)
!112 = !DILocation(line: 65, column: 14, scope: !87)
!113 = !DILocation(line: 66, column: 9, scope: !87)
!114 = !DILocation(line: 76, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !87, file: !71, line: 67, column: 9)
!116 = !DILocation(line: 76, column: 26, scope: !115)
!117 = !DILocation(line: 77, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !71, line: 77, column: 17)
!119 = !DILocation(line: 77, column: 30, scope: !118)
!120 = !DILocation(line: 77, column: 17, scope: !115)
!121 = !DILocation(line: 79, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !71, line: 78, column: 13)
!123 = !DILocation(line: 81, column: 13, scope: !115)
!124 = !DILocation(line: 82, column: 21, scope: !115)
!125 = !DILocation(line: 82, column: 32, scope: !115)
!126 = !DILocation(line: 83, column: 21, scope: !115)
!127 = !DILocation(line: 83, column: 30, scope: !115)
!128 = !DILocation(line: 83, column: 37, scope: !115)
!129 = !DILocation(line: 84, column: 32, scope: !115)
!130 = !DILocation(line: 84, column: 21, scope: !115)
!131 = !DILocation(line: 84, column: 30, scope: !115)
!132 = !DILocation(line: 85, column: 22, scope: !133)
!133 = distinct !DILexicalBlock(scope: !115, file: !71, line: 85, column: 17)
!134 = !DILocation(line: 85, column: 36, scope: !133)
!135 = !DILocation(line: 85, column: 17, scope: !133)
!136 = !DILocation(line: 85, column: 81, scope: !133)
!137 = !DILocation(line: 85, column: 17, scope: !115)
!138 = !DILocation(line: 87, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !71, line: 86, column: 13)
!140 = !DILocation(line: 89, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !115, file: !71, line: 89, column: 17)
!142 = !DILocation(line: 89, column: 17, scope: !141)
!143 = !DILocation(line: 89, column: 54, scope: !141)
!144 = !DILocation(line: 89, column: 17, scope: !115)
!145 = !DILocation(line: 91, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !71, line: 90, column: 13)
!147 = !DILocation(line: 93, column: 35, scope: !115)
!148 = !DILocation(line: 93, column: 28, scope: !115)
!149 = !DILocation(line: 93, column: 26, scope: !115)
!150 = !DILocation(line: 94, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !115, file: !71, line: 94, column: 17)
!152 = !DILocation(line: 94, column: 30, scope: !151)
!153 = !DILocation(line: 94, column: 17, scope: !115)
!154 = !DILocation(line: 96, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !71, line: 95, column: 13)
!156 = !DILocation(line: 99, column: 31, scope: !115)
!157 = !DILocation(line: 99, column: 45, scope: !115)
!158 = !DILocation(line: 99, column: 26, scope: !115)
!159 = !DILocation(line: 99, column: 24, scope: !115)
!160 = !DILocation(line: 100, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !115, file: !71, line: 100, column: 17)
!162 = !DILocation(line: 100, column: 28, scope: !161)
!163 = !DILocation(line: 100, column: 44, scope: !161)
!164 = !DILocation(line: 100, column: 47, scope: !161)
!165 = !DILocation(line: 100, column: 58, scope: !161)
!166 = !DILocation(line: 100, column: 17, scope: !115)
!167 = !DILocation(line: 102, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !71, line: 101, column: 13)
!169 = !DILocation(line: 105, column: 25, scope: !115)
!170 = !DILocation(line: 105, column: 13, scope: !115)
!171 = !DILocation(line: 105, column: 37, scope: !115)
!172 = !DILocation(line: 107, column: 25, scope: !115)
!173 = !DILocation(line: 107, column: 20, scope: !115)
!174 = !DILocation(line: 107, column: 18, scope: !115)
!175 = !DILocation(line: 108, column: 9, scope: !115)
!176 = !DILocation(line: 110, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !87, file: !71, line: 110, column: 13)
!178 = !DILocation(line: 110, column: 26, scope: !177)
!179 = !DILocation(line: 110, column: 13, scope: !87)
!180 = !DILocation(line: 112, column: 26, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !71, line: 111, column: 9)
!182 = !DILocation(line: 112, column: 13, scope: !181)
!183 = !DILocation(line: 113, column: 9, scope: !181)
!184 = !DILocation(line: 114, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !87, file: !71, line: 114, column: 13)
!186 = !DILocation(line: 114, column: 26, scope: !185)
!187 = !DILocation(line: 114, column: 13, scope: !87)
!188 = !DILocation(line: 116, column: 26, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !71, line: 115, column: 9)
!190 = !DILocation(line: 116, column: 13, scope: !189)
!191 = !DILocation(line: 117, column: 9, scope: !189)
!192 = !DILocation(line: 125, column: 26, scope: !70)
!193 = !DILocation(line: 125, column: 13, scope: !70)
!194 = !DILocation(line: 125, column: 24, scope: !70)
!195 = !DILocalVariable(name: "data", scope: !196, file: !71, line: 127, type: !76)
!196 = distinct !DILexicalBlock(scope: !70, file: !71, line: 126, column: 5)
!197 = !DILocation(line: 127, column: 13, scope: !196)
!198 = !DILocation(line: 127, column: 28, scope: !196)
!199 = !DILocalVariable(name: "buffer", scope: !200, file: !71, line: 129, type: !201)
!200 = distinct !DILexicalBlock(scope: !196, file: !71, line: 128, column: 9)
!201 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !202)
!202 = !{!203}
!203 = !DISubrange(count: 10)
!204 = !DILocation(line: 129, column: 17, scope: !200)
!205 = !DILocation(line: 132, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !200, file: !71, line: 132, column: 17)
!207 = !DILocation(line: 132, column: 22, scope: !206)
!208 = !DILocation(line: 132, column: 17, scope: !200)
!209 = !DILocation(line: 134, column: 37, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !71, line: 133, column: 13)
!211 = !DILocation(line: 134, column: 30, scope: !210)
!212 = !DILocation(line: 134, column: 17, scope: !210)
!213 = !DILocation(line: 135, column: 13, scope: !210)
!214 = !DILocation(line: 138, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !206, file: !71, line: 137, column: 13)
!216 = !DILocation(line: 142, column: 1, scope: !70)
!217 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_34_good", scope: !71, file: !71, line: 271, type: !72, scopeLine: 272, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!218 = !DILocation(line: 273, column: 5, scope: !217)
!219 = !DILocation(line: 274, column: 5, scope: !217)
!220 = !DILocation(line: 275, column: 1, scope: !217)
!221 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 285, type: !222, scopeLine: 286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!222 = !DISubroutineType(types: !223)
!223 = !{!76, !76, !224}
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!226 = !DILocalVariable(name: "argc", arg: 1, scope: !221, file: !71, line: 285, type: !76)
!227 = !DILocation(line: 285, column: 14, scope: !221)
!228 = !DILocalVariable(name: "argv", arg: 2, scope: !221, file: !71, line: 285, type: !224)
!229 = !DILocation(line: 285, column: 27, scope: !221)
!230 = !DILocation(line: 288, column: 22, scope: !221)
!231 = !DILocation(line: 288, column: 12, scope: !221)
!232 = !DILocation(line: 288, column: 5, scope: !221)
!233 = !DILocation(line: 290, column: 5, scope: !221)
!234 = !DILocation(line: 291, column: 5, scope: !221)
!235 = !DILocation(line: 292, column: 5, scope: !221)
!236 = !DILocation(line: 295, column: 5, scope: !221)
!237 = !DILocation(line: 296, column: 5, scope: !221)
!238 = !DILocation(line: 297, column: 5, scope: !221)
!239 = !DILocation(line: 299, column: 5, scope: !221)
!240 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 149, type: !72, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!241 = !DILocalVariable(name: "data", scope: !240, file: !71, line: 151, type: !76)
!242 = !DILocation(line: 151, column: 9, scope: !240)
!243 = !DILocalVariable(name: "myUnion", scope: !240, file: !71, line: 152, type: !79)
!244 = !DILocation(line: 152, column: 63, scope: !240)
!245 = !DILocation(line: 154, column: 10, scope: !240)
!246 = !DILocation(line: 157, column: 10, scope: !240)
!247 = !DILocation(line: 158, column: 26, scope: !240)
!248 = !DILocation(line: 158, column: 13, scope: !240)
!249 = !DILocation(line: 158, column: 24, scope: !240)
!250 = !DILocalVariable(name: "data", scope: !251, file: !71, line: 160, type: !76)
!251 = distinct !DILexicalBlock(scope: !240, file: !71, line: 159, column: 5)
!252 = !DILocation(line: 160, column: 13, scope: !251)
!253 = !DILocation(line: 160, column: 28, scope: !251)
!254 = !DILocalVariable(name: "buffer", scope: !255, file: !71, line: 162, type: !201)
!255 = distinct !DILexicalBlock(scope: !251, file: !71, line: 161, column: 9)
!256 = !DILocation(line: 162, column: 17, scope: !255)
!257 = !DILocation(line: 165, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !255, file: !71, line: 165, column: 17)
!259 = !DILocation(line: 165, column: 22, scope: !258)
!260 = !DILocation(line: 165, column: 17, scope: !255)
!261 = !DILocation(line: 167, column: 37, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !71, line: 166, column: 13)
!263 = !DILocation(line: 167, column: 30, scope: !262)
!264 = !DILocation(line: 167, column: 17, scope: !262)
!265 = !DILocation(line: 168, column: 13, scope: !262)
!266 = !DILocation(line: 171, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !258, file: !71, line: 170, column: 13)
!268 = !DILocation(line: 175, column: 1, scope: !240)
!269 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 178, type: !72, scopeLine: 179, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!270 = !DILocalVariable(name: "data", scope: !269, file: !71, line: 180, type: !76)
!271 = !DILocation(line: 180, column: 9, scope: !269)
!272 = !DILocalVariable(name: "myUnion", scope: !269, file: !71, line: 181, type: !79)
!273 = !DILocation(line: 181, column: 63, scope: !269)
!274 = !DILocation(line: 183, column: 10, scope: !269)
!275 = !DILocalVariable(name: "recvResult", scope: !276, file: !71, line: 189, type: !76)
!276 = distinct !DILexicalBlock(scope: !269, file: !71, line: 184, column: 5)
!277 = !DILocation(line: 189, column: 13, scope: !276)
!278 = !DILocalVariable(name: "service", scope: !276, file: !71, line: 190, type: !90)
!279 = !DILocation(line: 190, column: 28, scope: !276)
!280 = !DILocalVariable(name: "listenSocket", scope: !276, file: !71, line: 191, type: !76)
!281 = !DILocation(line: 191, column: 16, scope: !276)
!282 = !DILocalVariable(name: "acceptSocket", scope: !276, file: !71, line: 192, type: !76)
!283 = !DILocation(line: 192, column: 16, scope: !276)
!284 = !DILocalVariable(name: "inputBuffer", scope: !276, file: !71, line: 193, type: !60)
!285 = !DILocation(line: 193, column: 14, scope: !276)
!286 = !DILocation(line: 194, column: 9, scope: !276)
!287 = !DILocation(line: 204, column: 28, scope: !288)
!288 = distinct !DILexicalBlock(scope: !276, file: !71, line: 195, column: 9)
!289 = !DILocation(line: 204, column: 26, scope: !288)
!290 = !DILocation(line: 205, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !71, line: 205, column: 17)
!292 = !DILocation(line: 205, column: 30, scope: !291)
!293 = !DILocation(line: 205, column: 17, scope: !288)
!294 = !DILocation(line: 207, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !71, line: 206, column: 13)
!296 = !DILocation(line: 209, column: 13, scope: !288)
!297 = !DILocation(line: 210, column: 21, scope: !288)
!298 = !DILocation(line: 210, column: 32, scope: !288)
!299 = !DILocation(line: 211, column: 21, scope: !288)
!300 = !DILocation(line: 211, column: 30, scope: !288)
!301 = !DILocation(line: 211, column: 37, scope: !288)
!302 = !DILocation(line: 212, column: 32, scope: !288)
!303 = !DILocation(line: 212, column: 21, scope: !288)
!304 = !DILocation(line: 212, column: 30, scope: !288)
!305 = !DILocation(line: 213, column: 22, scope: !306)
!306 = distinct !DILexicalBlock(scope: !288, file: !71, line: 213, column: 17)
!307 = !DILocation(line: 213, column: 36, scope: !306)
!308 = !DILocation(line: 213, column: 17, scope: !306)
!309 = !DILocation(line: 213, column: 81, scope: !306)
!310 = !DILocation(line: 213, column: 17, scope: !288)
!311 = !DILocation(line: 215, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !306, file: !71, line: 214, column: 13)
!313 = !DILocation(line: 217, column: 24, scope: !314)
!314 = distinct !DILexicalBlock(scope: !288, file: !71, line: 217, column: 17)
!315 = !DILocation(line: 217, column: 17, scope: !314)
!316 = !DILocation(line: 217, column: 54, scope: !314)
!317 = !DILocation(line: 217, column: 17, scope: !288)
!318 = !DILocation(line: 219, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !314, file: !71, line: 218, column: 13)
!320 = !DILocation(line: 221, column: 35, scope: !288)
!321 = !DILocation(line: 221, column: 28, scope: !288)
!322 = !DILocation(line: 221, column: 26, scope: !288)
!323 = !DILocation(line: 222, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !288, file: !71, line: 222, column: 17)
!325 = !DILocation(line: 222, column: 30, scope: !324)
!326 = !DILocation(line: 222, column: 17, scope: !288)
!327 = !DILocation(line: 224, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !71, line: 223, column: 13)
!329 = !DILocation(line: 227, column: 31, scope: !288)
!330 = !DILocation(line: 227, column: 45, scope: !288)
!331 = !DILocation(line: 227, column: 26, scope: !288)
!332 = !DILocation(line: 227, column: 24, scope: !288)
!333 = !DILocation(line: 228, column: 17, scope: !334)
!334 = distinct !DILexicalBlock(scope: !288, file: !71, line: 228, column: 17)
!335 = !DILocation(line: 228, column: 28, scope: !334)
!336 = !DILocation(line: 228, column: 44, scope: !334)
!337 = !DILocation(line: 228, column: 47, scope: !334)
!338 = !DILocation(line: 228, column: 58, scope: !334)
!339 = !DILocation(line: 228, column: 17, scope: !288)
!340 = !DILocation(line: 230, column: 17, scope: !341)
!341 = distinct !DILexicalBlock(scope: !334, file: !71, line: 229, column: 13)
!342 = !DILocation(line: 233, column: 25, scope: !288)
!343 = !DILocation(line: 233, column: 13, scope: !288)
!344 = !DILocation(line: 233, column: 37, scope: !288)
!345 = !DILocation(line: 235, column: 25, scope: !288)
!346 = !DILocation(line: 235, column: 20, scope: !288)
!347 = !DILocation(line: 235, column: 18, scope: !288)
!348 = !DILocation(line: 236, column: 9, scope: !288)
!349 = !DILocation(line: 238, column: 13, scope: !350)
!350 = distinct !DILexicalBlock(scope: !276, file: !71, line: 238, column: 13)
!351 = !DILocation(line: 238, column: 26, scope: !350)
!352 = !DILocation(line: 238, column: 13, scope: !276)
!353 = !DILocation(line: 240, column: 26, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !71, line: 239, column: 9)
!355 = !DILocation(line: 240, column: 13, scope: !354)
!356 = !DILocation(line: 241, column: 9, scope: !354)
!357 = !DILocation(line: 242, column: 13, scope: !358)
!358 = distinct !DILexicalBlock(scope: !276, file: !71, line: 242, column: 13)
!359 = !DILocation(line: 242, column: 26, scope: !358)
!360 = !DILocation(line: 242, column: 13, scope: !276)
!361 = !DILocation(line: 244, column: 26, scope: !362)
!362 = distinct !DILexicalBlock(scope: !358, file: !71, line: 243, column: 9)
!363 = !DILocation(line: 244, column: 13, scope: !362)
!364 = !DILocation(line: 245, column: 9, scope: !362)
!365 = !DILocation(line: 253, column: 26, scope: !269)
!366 = !DILocation(line: 253, column: 13, scope: !269)
!367 = !DILocation(line: 253, column: 24, scope: !269)
!368 = !DILocalVariable(name: "data", scope: !369, file: !71, line: 255, type: !76)
!369 = distinct !DILexicalBlock(scope: !269, file: !71, line: 254, column: 5)
!370 = !DILocation(line: 255, column: 13, scope: !369)
!371 = !DILocation(line: 255, column: 28, scope: !369)
!372 = !DILocalVariable(name: "buffer", scope: !373, file: !71, line: 257, type: !201)
!373 = distinct !DILexicalBlock(scope: !369, file: !71, line: 256, column: 9)
!374 = !DILocation(line: 257, column: 17, scope: !373)
!375 = !DILocation(line: 259, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !373, file: !71, line: 259, column: 17)
!377 = !DILocation(line: 259, column: 22, scope: !376)
!378 = !DILocation(line: 259, column: 27, scope: !376)
!379 = !DILocation(line: 259, column: 30, scope: !376)
!380 = !DILocation(line: 259, column: 35, scope: !376)
!381 = !DILocation(line: 259, column: 17, scope: !373)
!382 = !DILocation(line: 261, column: 37, scope: !383)
!383 = distinct !DILexicalBlock(scope: !376, file: !71, line: 260, column: 13)
!384 = !DILocation(line: 261, column: 30, scope: !383)
!385 = !DILocation(line: 261, column: 17, scope: !383)
!386 = !DILocation(line: 262, column: 13, scope: !383)
!387 = !DILocation(line: 265, column: 17, scope: !388)
!388 = distinct !DILexicalBlock(scope: !376, file: !71, line: 264, column: 13)
!389 = !DILocation(line: 269, column: 1, scope: !269)
