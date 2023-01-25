; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_06.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_06.c"
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_06_bad() #0 !dbg !70 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !79, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !84, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %listenSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %acceptSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %do.body, !dbg !108

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !109
  store i32 %call, i32* %listenSocket, align 4, !dbg !111
  %0 = load i32, i32* %listenSocket, align 4, !dbg !112
  %cmp = icmp eq i32 %0, -1, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !116

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !118
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !119
  store i16 2, i16* %sin_family, align 4, !dbg !120
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !121
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !122
  store i32 0, i32* %s_addr, align 4, !dbg !123
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !124
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !125
  store i16 %call1, i16* %sin_port, align 2, !dbg !126
  %2 = load i32, i32* %listenSocket, align 4, !dbg !127
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !129
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !130
  %cmp3 = icmp eq i32 %call2, -1, !dbg !131
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !132

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !133

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !135
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !137
  %cmp7 = icmp eq i32 %call6, -1, !dbg !138
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !139

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !140

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !142
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !143
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !144
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !145
  %cmp11 = icmp eq i32 %6, -1, !dbg !147
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !148

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !149

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !151
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !152
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !153
  %conv = trunc i64 %call14 to i32, !dbg !153
  store i32 %conv, i32* %recvResult, align 4, !dbg !154
  %8 = load i32, i32* %recvResult, align 4, !dbg !155
  %cmp15 = icmp eq i32 %8, -1, !dbg !157
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !158

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !159
  %cmp17 = icmp eq i32 %9, 0, !dbg !160
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !161

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !162

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !164
  %idxprom = sext i32 %10 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !167
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !168
  store i32 %call22, i32* %data, align 4, !dbg !169
  br label %do.end, !dbg !170

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !171
  %cmp23 = icmp ne i32 %11, -1, !dbg !173
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !174

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !175
  %call26 = call i32 @close(i32 %12), !dbg !177
  br label %if.end27, !dbg !178

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !179
  %cmp28 = icmp ne i32 %13, -1, !dbg !181
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !182

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !183
  %call31 = call i32 @close(i32 %14), !dbg !185
  br label %if.end32, !dbg !186

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !187, metadata !DIExpression()), !dbg !194
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !194
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !194
  %16 = load i32, i32* %data, align 4, !dbg !195
  %cmp33 = icmp sge i32 %16, 0, !dbg !197
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !198

if.then35:                                        ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !199
  %idxprom36 = sext i32 %17 to i64, !dbg !201
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !201
  %18 = load i32, i32* %arrayidx37, align 4, !dbg !201
  call void @printIntLine(i32 %18), !dbg !202
  br label %if.end38, !dbg !203

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !204
  br label %if.end38

if.end38:                                         ; preds = %if.else, %if.then35
  ret void, !dbg !206
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_06_good() #0 !dbg !207 {
entry:
  call void @goodB2G1(), !dbg !208
  call void @goodB2G2(), !dbg !209
  call void @goodG2B1(), !dbg !210
  call void @goodG2B2(), !dbg !211
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
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_06_good(), !dbg !226
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !227
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !228
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_06_bad(), !dbg !229
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !230
  ret i32 0, !dbg !231
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !232 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !236, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !241, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !243, metadata !DIExpression()), !dbg !244
  store i32 -1, i32* %listenSocket, align 4, !dbg !244
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !245, metadata !DIExpression()), !dbg !246
  store i32 -1, i32* %acceptSocket, align 4, !dbg !246
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !247, metadata !DIExpression()), !dbg !248
  br label %do.body, !dbg !249

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !250
  store i32 %call, i32* %listenSocket, align 4, !dbg !252
  %0 = load i32, i32* %listenSocket, align 4, !dbg !253
  %cmp = icmp eq i32 %0, -1, !dbg !255
  br i1 %cmp, label %if.then, label %if.end, !dbg !256

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !257

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !259
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !259
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !260
  store i16 2, i16* %sin_family, align 4, !dbg !261
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !262
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !263
  store i32 0, i32* %s_addr, align 4, !dbg !264
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !265
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !266
  store i16 %call1, i16* %sin_port, align 2, !dbg !267
  %2 = load i32, i32* %listenSocket, align 4, !dbg !268
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !270
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !271
  %cmp3 = icmp eq i32 %call2, -1, !dbg !272
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !273

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !274

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !276
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !278
  %cmp7 = icmp eq i32 %call6, -1, !dbg !279
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !280

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !281

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !283
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !284
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !285
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !286
  %cmp11 = icmp eq i32 %6, -1, !dbg !288
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !289

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !290

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !292
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !293
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !294
  %conv = trunc i64 %call14 to i32, !dbg !294
  store i32 %conv, i32* %recvResult, align 4, !dbg !295
  %8 = load i32, i32* %recvResult, align 4, !dbg !296
  %cmp15 = icmp eq i32 %8, -1, !dbg !298
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !299

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !300
  %cmp17 = icmp eq i32 %9, 0, !dbg !301
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !302

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !303

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !305
  %idxprom = sext i32 %10 to i64, !dbg !306
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !306
  store i8 0, i8* %arrayidx, align 1, !dbg !307
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !308
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !309
  store i32 %call22, i32* %data, align 4, !dbg !310
  br label %do.end, !dbg !311

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !312
  %cmp23 = icmp ne i32 %11, -1, !dbg !314
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !315

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !316
  %call26 = call i32 @close(i32 %12), !dbg !318
  br label %if.end27, !dbg !319

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !320
  %cmp28 = icmp ne i32 %13, -1, !dbg !322
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !323

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !324
  %call31 = call i32 @close(i32 %14), !dbg !326
  br label %if.end32, !dbg !327

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !328, metadata !DIExpression()), !dbg !332
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !332
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !332
  %16 = load i32, i32* %data, align 4, !dbg !333
  %cmp33 = icmp sge i32 %16, 0, !dbg !335
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !336

land.lhs.true:                                    ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !337
  %cmp35 = icmp slt i32 %17, 10, !dbg !338
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !339

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !340
  %idxprom38 = sext i32 %18 to i64, !dbg !342
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !342
  %19 = load i32, i32* %arrayidx39, align 4, !dbg !342
  call void @printIntLine(i32 %19), !dbg !343
  br label %if.end40, !dbg !344

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !345
  br label %if.end40

if.end40:                                         ; preds = %if.else, %if.then37
  ret void, !dbg !347
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !348 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !349, metadata !DIExpression()), !dbg !350
  store i32 -1, i32* %data, align 4, !dbg !351
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !352, metadata !DIExpression()), !dbg !356
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !357, metadata !DIExpression()), !dbg !358
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !359, metadata !DIExpression()), !dbg !360
  store i32 -1, i32* %listenSocket, align 4, !dbg !360
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !361, metadata !DIExpression()), !dbg !362
  store i32 -1, i32* %acceptSocket, align 4, !dbg !362
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !363, metadata !DIExpression()), !dbg !364
  br label %do.body, !dbg !365

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !366
  store i32 %call, i32* %listenSocket, align 4, !dbg !368
  %0 = load i32, i32* %listenSocket, align 4, !dbg !369
  %cmp = icmp eq i32 %0, -1, !dbg !371
  br i1 %cmp, label %if.then, label %if.end, !dbg !372

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !373

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !375
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !375
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !376
  store i16 2, i16* %sin_family, align 4, !dbg !377
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !378
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !379
  store i32 0, i32* %s_addr, align 4, !dbg !380
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !381
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !382
  store i16 %call1, i16* %sin_port, align 2, !dbg !383
  %2 = load i32, i32* %listenSocket, align 4, !dbg !384
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !386
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !387
  %cmp3 = icmp eq i32 %call2, -1, !dbg !388
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !389

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !390

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !392
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !394
  %cmp7 = icmp eq i32 %call6, -1, !dbg !395
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !396

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !397

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !399
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !400
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !401
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !402
  %cmp11 = icmp eq i32 %6, -1, !dbg !404
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !405

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !406

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !408
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !409
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !410
  %conv = trunc i64 %call14 to i32, !dbg !410
  store i32 %conv, i32* %recvResult, align 4, !dbg !411
  %8 = load i32, i32* %recvResult, align 4, !dbg !412
  %cmp15 = icmp eq i32 %8, -1, !dbg !414
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !415

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !416
  %cmp17 = icmp eq i32 %9, 0, !dbg !417
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !418

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !419

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !421
  %idxprom = sext i32 %10 to i64, !dbg !422
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !422
  store i8 0, i8* %arrayidx, align 1, !dbg !423
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !424
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !425
  store i32 %call22, i32* %data, align 4, !dbg !426
  br label %do.end, !dbg !427

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !428
  %cmp23 = icmp ne i32 %11, -1, !dbg !430
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !431

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !432
  %call26 = call i32 @close(i32 %12), !dbg !434
  br label %if.end27, !dbg !435

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !436
  %cmp28 = icmp ne i32 %13, -1, !dbg !438
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !439

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !440
  %call31 = call i32 @close(i32 %14), !dbg !442
  br label %if.end32, !dbg !443

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !444, metadata !DIExpression()), !dbg !448
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !448
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !448
  %16 = load i32, i32* %data, align 4, !dbg !449
  %cmp33 = icmp sge i32 %16, 0, !dbg !451
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !452

land.lhs.true:                                    ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !453
  %cmp35 = icmp slt i32 %17, 10, !dbg !454
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !455

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !456
  %idxprom38 = sext i32 %18 to i64, !dbg !458
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !458
  %19 = load i32, i32* %arrayidx39, align 4, !dbg !458
  call void @printIntLine(i32 %19), !dbg !459
  br label %if.end40, !dbg !460

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !461
  br label %if.end40

if.end40:                                         ; preds = %if.else, %if.then37
  ret void, !dbg !463
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !464 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !465, metadata !DIExpression()), !dbg !466
  store i32 -1, i32* %data, align 4, !dbg !467
  store i32 7, i32* %data, align 4, !dbg !468
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !471, metadata !DIExpression()), !dbg !475
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !475
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !475
  %1 = load i32, i32* %data, align 4, !dbg !476
  %cmp = icmp sge i32 %1, 0, !dbg !478
  br i1 %cmp, label %if.then, label %if.else, !dbg !479

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !480
  %idxprom = sext i32 %2 to i64, !dbg !482
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !482
  %3 = load i32, i32* %arrayidx, align 4, !dbg !482
  call void @printIntLine(i32 %3), !dbg !483
  br label %if.end, !dbg !484

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !485
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !487
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !488 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !489, metadata !DIExpression()), !dbg !490
  store i32 -1, i32* %data, align 4, !dbg !491
  store i32 7, i32* %data, align 4, !dbg !492
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !495, metadata !DIExpression()), !dbg !499
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !499
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !499
  %1 = load i32, i32* %data, align 4, !dbg !500
  %cmp = icmp sge i32 %1, 0, !dbg !502
  br i1 %cmp, label %if.then, label %if.else, !dbg !503

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !504
  %idxprom = sext i32 %2 to i64, !dbg !506
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !506
  %3 = load i32, i32* %arrayidx, align 4, !dbg !506
  call void @printIntLine(i32 %3), !dbg !507
  br label %if.end, !dbg !508

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !509
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !511
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_06_bad", scope: !71, file: !71, line: 49, type: !72, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_06.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 51, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 51, column: 9, scope: !70)
!78 = !DILocation(line: 53, column: 10, scope: !70)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !71, line: 61, type: !76)
!80 = distinct !DILexicalBlock(scope: !81, file: !71, line: 56, column: 9)
!81 = distinct !DILexicalBlock(scope: !82, file: !71, line: 55, column: 5)
!82 = distinct !DILexicalBlock(scope: !70, file: !71, line: 54, column: 8)
!83 = !DILocation(line: 61, column: 17, scope: !80)
!84 = !DILocalVariable(name: "service", scope: !80, file: !71, line: 62, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !86)
!86 = !{!87, !88, !92, !96}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !85, file: !17, line: 240, baseType: !56, size: 16)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !85, file: !17, line: 241, baseType: !89, size: 16, offset: 16)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !85, file: !17, line: 242, baseType: !93, size: 32, offset: 32)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !94)
!94 = !{!95}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !93, file: !17, line: 33, baseType: !46, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !85, file: !17, line: 245, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 62, column: 32, scope: !80)
!102 = !DILocalVariable(name: "listenSocket", scope: !80, file: !71, line: 63, type: !76)
!103 = !DILocation(line: 63, column: 20, scope: !80)
!104 = !DILocalVariable(name: "acceptSocket", scope: !80, file: !71, line: 64, type: !76)
!105 = !DILocation(line: 64, column: 20, scope: !80)
!106 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !71, line: 65, type: !60)
!107 = !DILocation(line: 65, column: 18, scope: !80)
!108 = !DILocation(line: 66, column: 13, scope: !80)
!109 = !DILocation(line: 76, column: 32, scope: !110)
!110 = distinct !DILexicalBlock(scope: !80, file: !71, line: 67, column: 13)
!111 = !DILocation(line: 76, column: 30, scope: !110)
!112 = !DILocation(line: 77, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !71, line: 77, column: 21)
!114 = !DILocation(line: 77, column: 34, scope: !113)
!115 = !DILocation(line: 77, column: 21, scope: !110)
!116 = !DILocation(line: 79, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !71, line: 78, column: 17)
!118 = !DILocation(line: 81, column: 17, scope: !110)
!119 = !DILocation(line: 82, column: 25, scope: !110)
!120 = !DILocation(line: 82, column: 36, scope: !110)
!121 = !DILocation(line: 83, column: 25, scope: !110)
!122 = !DILocation(line: 83, column: 34, scope: !110)
!123 = !DILocation(line: 83, column: 41, scope: !110)
!124 = !DILocation(line: 84, column: 36, scope: !110)
!125 = !DILocation(line: 84, column: 25, scope: !110)
!126 = !DILocation(line: 84, column: 34, scope: !110)
!127 = !DILocation(line: 85, column: 26, scope: !128)
!128 = distinct !DILexicalBlock(scope: !110, file: !71, line: 85, column: 21)
!129 = !DILocation(line: 85, column: 40, scope: !128)
!130 = !DILocation(line: 85, column: 21, scope: !128)
!131 = !DILocation(line: 85, column: 85, scope: !128)
!132 = !DILocation(line: 85, column: 21, scope: !110)
!133 = !DILocation(line: 87, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !71, line: 86, column: 17)
!135 = !DILocation(line: 89, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !110, file: !71, line: 89, column: 21)
!137 = !DILocation(line: 89, column: 21, scope: !136)
!138 = !DILocation(line: 89, column: 58, scope: !136)
!139 = !DILocation(line: 89, column: 21, scope: !110)
!140 = !DILocation(line: 91, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !71, line: 90, column: 17)
!142 = !DILocation(line: 93, column: 39, scope: !110)
!143 = !DILocation(line: 93, column: 32, scope: !110)
!144 = !DILocation(line: 93, column: 30, scope: !110)
!145 = !DILocation(line: 94, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !110, file: !71, line: 94, column: 21)
!147 = !DILocation(line: 94, column: 34, scope: !146)
!148 = !DILocation(line: 94, column: 21, scope: !110)
!149 = !DILocation(line: 96, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !71, line: 95, column: 17)
!151 = !DILocation(line: 99, column: 35, scope: !110)
!152 = !DILocation(line: 99, column: 49, scope: !110)
!153 = !DILocation(line: 99, column: 30, scope: !110)
!154 = !DILocation(line: 99, column: 28, scope: !110)
!155 = !DILocation(line: 100, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !110, file: !71, line: 100, column: 21)
!157 = !DILocation(line: 100, column: 32, scope: !156)
!158 = !DILocation(line: 100, column: 48, scope: !156)
!159 = !DILocation(line: 100, column: 51, scope: !156)
!160 = !DILocation(line: 100, column: 62, scope: !156)
!161 = !DILocation(line: 100, column: 21, scope: !110)
!162 = !DILocation(line: 102, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !71, line: 101, column: 17)
!164 = !DILocation(line: 105, column: 29, scope: !110)
!165 = !DILocation(line: 105, column: 17, scope: !110)
!166 = !DILocation(line: 105, column: 41, scope: !110)
!167 = !DILocation(line: 107, column: 29, scope: !110)
!168 = !DILocation(line: 107, column: 24, scope: !110)
!169 = !DILocation(line: 107, column: 22, scope: !110)
!170 = !DILocation(line: 108, column: 13, scope: !110)
!171 = !DILocation(line: 110, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !80, file: !71, line: 110, column: 17)
!173 = !DILocation(line: 110, column: 30, scope: !172)
!174 = !DILocation(line: 110, column: 17, scope: !80)
!175 = !DILocation(line: 112, column: 30, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !71, line: 111, column: 13)
!177 = !DILocation(line: 112, column: 17, scope: !176)
!178 = !DILocation(line: 113, column: 13, scope: !176)
!179 = !DILocation(line: 114, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !80, file: !71, line: 114, column: 17)
!181 = !DILocation(line: 114, column: 30, scope: !180)
!182 = !DILocation(line: 114, column: 17, scope: !80)
!183 = !DILocation(line: 116, column: 30, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !71, line: 115, column: 13)
!185 = !DILocation(line: 116, column: 17, scope: !184)
!186 = !DILocation(line: 117, column: 13, scope: !184)
!187 = !DILocalVariable(name: "buffer", scope: !188, file: !71, line: 129, type: !191)
!188 = distinct !DILexicalBlock(scope: !189, file: !71, line: 128, column: 9)
!189 = distinct !DILexicalBlock(scope: !190, file: !71, line: 127, column: 5)
!190 = distinct !DILexicalBlock(scope: !70, file: !71, line: 126, column: 8)
!191 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !192)
!192 = !{!193}
!193 = !DISubrange(count: 10)
!194 = !DILocation(line: 129, column: 17, scope: !188)
!195 = !DILocation(line: 132, column: 17, scope: !196)
!196 = distinct !DILexicalBlock(scope: !188, file: !71, line: 132, column: 17)
!197 = !DILocation(line: 132, column: 22, scope: !196)
!198 = !DILocation(line: 132, column: 17, scope: !188)
!199 = !DILocation(line: 134, column: 37, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !71, line: 133, column: 13)
!201 = !DILocation(line: 134, column: 30, scope: !200)
!202 = !DILocation(line: 134, column: 17, scope: !200)
!203 = !DILocation(line: 135, column: 13, scope: !200)
!204 = !DILocation(line: 138, column: 17, scope: !205)
!205 = distinct !DILexicalBlock(scope: !196, file: !71, line: 137, column: 13)
!206 = !DILocation(line: 142, column: 1, scope: !70)
!207 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_06_good", scope: !71, file: !71, line: 408, type: !72, scopeLine: 409, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!208 = !DILocation(line: 410, column: 5, scope: !207)
!209 = !DILocation(line: 411, column: 5, scope: !207)
!210 = !DILocation(line: 412, column: 5, scope: !207)
!211 = !DILocation(line: 413, column: 5, scope: !207)
!212 = !DILocation(line: 414, column: 1, scope: !207)
!213 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 425, type: !214, scopeLine: 426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!214 = !DISubroutineType(types: !215)
!215 = !{!76, !76, !216}
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64)
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!218 = !DILocalVariable(name: "argc", arg: 1, scope: !213, file: !71, line: 425, type: !76)
!219 = !DILocation(line: 425, column: 14, scope: !213)
!220 = !DILocalVariable(name: "argv", arg: 2, scope: !213, file: !71, line: 425, type: !216)
!221 = !DILocation(line: 425, column: 27, scope: !213)
!222 = !DILocation(line: 428, column: 22, scope: !213)
!223 = !DILocation(line: 428, column: 12, scope: !213)
!224 = !DILocation(line: 428, column: 5, scope: !213)
!225 = !DILocation(line: 430, column: 5, scope: !213)
!226 = !DILocation(line: 431, column: 5, scope: !213)
!227 = !DILocation(line: 432, column: 5, scope: !213)
!228 = !DILocation(line: 435, column: 5, scope: !213)
!229 = !DILocation(line: 436, column: 5, scope: !213)
!230 = !DILocation(line: 437, column: 5, scope: !213)
!231 = !DILocation(line: 439, column: 5, scope: !213)
!232 = distinct !DISubprogram(name: "goodB2G1", scope: !71, file: !71, line: 149, type: !72, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!233 = !DILocalVariable(name: "data", scope: !232, file: !71, line: 151, type: !76)
!234 = !DILocation(line: 151, column: 9, scope: !232)
!235 = !DILocation(line: 153, column: 10, scope: !232)
!236 = !DILocalVariable(name: "recvResult", scope: !237, file: !71, line: 161, type: !76)
!237 = distinct !DILexicalBlock(scope: !238, file: !71, line: 156, column: 9)
!238 = distinct !DILexicalBlock(scope: !239, file: !71, line: 155, column: 5)
!239 = distinct !DILexicalBlock(scope: !232, file: !71, line: 154, column: 8)
!240 = !DILocation(line: 161, column: 17, scope: !237)
!241 = !DILocalVariable(name: "service", scope: !237, file: !71, line: 162, type: !85)
!242 = !DILocation(line: 162, column: 32, scope: !237)
!243 = !DILocalVariable(name: "listenSocket", scope: !237, file: !71, line: 163, type: !76)
!244 = !DILocation(line: 163, column: 20, scope: !237)
!245 = !DILocalVariable(name: "acceptSocket", scope: !237, file: !71, line: 164, type: !76)
!246 = !DILocation(line: 164, column: 20, scope: !237)
!247 = !DILocalVariable(name: "inputBuffer", scope: !237, file: !71, line: 165, type: !60)
!248 = !DILocation(line: 165, column: 18, scope: !237)
!249 = !DILocation(line: 166, column: 13, scope: !237)
!250 = !DILocation(line: 176, column: 32, scope: !251)
!251 = distinct !DILexicalBlock(scope: !237, file: !71, line: 167, column: 13)
!252 = !DILocation(line: 176, column: 30, scope: !251)
!253 = !DILocation(line: 177, column: 21, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !71, line: 177, column: 21)
!255 = !DILocation(line: 177, column: 34, scope: !254)
!256 = !DILocation(line: 177, column: 21, scope: !251)
!257 = !DILocation(line: 179, column: 21, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !71, line: 178, column: 17)
!259 = !DILocation(line: 181, column: 17, scope: !251)
!260 = !DILocation(line: 182, column: 25, scope: !251)
!261 = !DILocation(line: 182, column: 36, scope: !251)
!262 = !DILocation(line: 183, column: 25, scope: !251)
!263 = !DILocation(line: 183, column: 34, scope: !251)
!264 = !DILocation(line: 183, column: 41, scope: !251)
!265 = !DILocation(line: 184, column: 36, scope: !251)
!266 = !DILocation(line: 184, column: 25, scope: !251)
!267 = !DILocation(line: 184, column: 34, scope: !251)
!268 = !DILocation(line: 185, column: 26, scope: !269)
!269 = distinct !DILexicalBlock(scope: !251, file: !71, line: 185, column: 21)
!270 = !DILocation(line: 185, column: 40, scope: !269)
!271 = !DILocation(line: 185, column: 21, scope: !269)
!272 = !DILocation(line: 185, column: 85, scope: !269)
!273 = !DILocation(line: 185, column: 21, scope: !251)
!274 = !DILocation(line: 187, column: 21, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !71, line: 186, column: 17)
!276 = !DILocation(line: 189, column: 28, scope: !277)
!277 = distinct !DILexicalBlock(scope: !251, file: !71, line: 189, column: 21)
!278 = !DILocation(line: 189, column: 21, scope: !277)
!279 = !DILocation(line: 189, column: 58, scope: !277)
!280 = !DILocation(line: 189, column: 21, scope: !251)
!281 = !DILocation(line: 191, column: 21, scope: !282)
!282 = distinct !DILexicalBlock(scope: !277, file: !71, line: 190, column: 17)
!283 = !DILocation(line: 193, column: 39, scope: !251)
!284 = !DILocation(line: 193, column: 32, scope: !251)
!285 = !DILocation(line: 193, column: 30, scope: !251)
!286 = !DILocation(line: 194, column: 21, scope: !287)
!287 = distinct !DILexicalBlock(scope: !251, file: !71, line: 194, column: 21)
!288 = !DILocation(line: 194, column: 34, scope: !287)
!289 = !DILocation(line: 194, column: 21, scope: !251)
!290 = !DILocation(line: 196, column: 21, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !71, line: 195, column: 17)
!292 = !DILocation(line: 199, column: 35, scope: !251)
!293 = !DILocation(line: 199, column: 49, scope: !251)
!294 = !DILocation(line: 199, column: 30, scope: !251)
!295 = !DILocation(line: 199, column: 28, scope: !251)
!296 = !DILocation(line: 200, column: 21, scope: !297)
!297 = distinct !DILexicalBlock(scope: !251, file: !71, line: 200, column: 21)
!298 = !DILocation(line: 200, column: 32, scope: !297)
!299 = !DILocation(line: 200, column: 48, scope: !297)
!300 = !DILocation(line: 200, column: 51, scope: !297)
!301 = !DILocation(line: 200, column: 62, scope: !297)
!302 = !DILocation(line: 200, column: 21, scope: !251)
!303 = !DILocation(line: 202, column: 21, scope: !304)
!304 = distinct !DILexicalBlock(scope: !297, file: !71, line: 201, column: 17)
!305 = !DILocation(line: 205, column: 29, scope: !251)
!306 = !DILocation(line: 205, column: 17, scope: !251)
!307 = !DILocation(line: 205, column: 41, scope: !251)
!308 = !DILocation(line: 207, column: 29, scope: !251)
!309 = !DILocation(line: 207, column: 24, scope: !251)
!310 = !DILocation(line: 207, column: 22, scope: !251)
!311 = !DILocation(line: 208, column: 13, scope: !251)
!312 = !DILocation(line: 210, column: 17, scope: !313)
!313 = distinct !DILexicalBlock(scope: !237, file: !71, line: 210, column: 17)
!314 = !DILocation(line: 210, column: 30, scope: !313)
!315 = !DILocation(line: 210, column: 17, scope: !237)
!316 = !DILocation(line: 212, column: 30, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !71, line: 211, column: 13)
!318 = !DILocation(line: 212, column: 17, scope: !317)
!319 = !DILocation(line: 213, column: 13, scope: !317)
!320 = !DILocation(line: 214, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !237, file: !71, line: 214, column: 17)
!322 = !DILocation(line: 214, column: 30, scope: !321)
!323 = !DILocation(line: 214, column: 17, scope: !237)
!324 = !DILocation(line: 216, column: 30, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !71, line: 215, column: 13)
!326 = !DILocation(line: 216, column: 17, scope: !325)
!327 = !DILocation(line: 217, column: 13, scope: !325)
!328 = !DILocalVariable(name: "buffer", scope: !329, file: !71, line: 234, type: !191)
!329 = distinct !DILexicalBlock(scope: !330, file: !71, line: 233, column: 9)
!330 = distinct !DILexicalBlock(scope: !331, file: !71, line: 232, column: 5)
!331 = distinct !DILexicalBlock(scope: !232, file: !71, line: 226, column: 8)
!332 = !DILocation(line: 234, column: 17, scope: !329)
!333 = !DILocation(line: 236, column: 17, scope: !334)
!334 = distinct !DILexicalBlock(scope: !329, file: !71, line: 236, column: 17)
!335 = !DILocation(line: 236, column: 22, scope: !334)
!336 = !DILocation(line: 236, column: 27, scope: !334)
!337 = !DILocation(line: 236, column: 30, scope: !334)
!338 = !DILocation(line: 236, column: 35, scope: !334)
!339 = !DILocation(line: 236, column: 17, scope: !329)
!340 = !DILocation(line: 238, column: 37, scope: !341)
!341 = distinct !DILexicalBlock(scope: !334, file: !71, line: 237, column: 13)
!342 = !DILocation(line: 238, column: 30, scope: !341)
!343 = !DILocation(line: 238, column: 17, scope: !341)
!344 = !DILocation(line: 239, column: 13, scope: !341)
!345 = !DILocation(line: 242, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !334, file: !71, line: 241, column: 13)
!347 = !DILocation(line: 246, column: 1, scope: !232)
!348 = distinct !DISubprogram(name: "goodB2G2", scope: !71, file: !71, line: 249, type: !72, scopeLine: 250, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!349 = !DILocalVariable(name: "data", scope: !348, file: !71, line: 251, type: !76)
!350 = !DILocation(line: 251, column: 9, scope: !348)
!351 = !DILocation(line: 253, column: 10, scope: !348)
!352 = !DILocalVariable(name: "recvResult", scope: !353, file: !71, line: 261, type: !76)
!353 = distinct !DILexicalBlock(scope: !354, file: !71, line: 256, column: 9)
!354 = distinct !DILexicalBlock(scope: !355, file: !71, line: 255, column: 5)
!355 = distinct !DILexicalBlock(scope: !348, file: !71, line: 254, column: 8)
!356 = !DILocation(line: 261, column: 17, scope: !353)
!357 = !DILocalVariable(name: "service", scope: !353, file: !71, line: 262, type: !85)
!358 = !DILocation(line: 262, column: 32, scope: !353)
!359 = !DILocalVariable(name: "listenSocket", scope: !353, file: !71, line: 263, type: !76)
!360 = !DILocation(line: 263, column: 20, scope: !353)
!361 = !DILocalVariable(name: "acceptSocket", scope: !353, file: !71, line: 264, type: !76)
!362 = !DILocation(line: 264, column: 20, scope: !353)
!363 = !DILocalVariable(name: "inputBuffer", scope: !353, file: !71, line: 265, type: !60)
!364 = !DILocation(line: 265, column: 18, scope: !353)
!365 = !DILocation(line: 266, column: 13, scope: !353)
!366 = !DILocation(line: 276, column: 32, scope: !367)
!367 = distinct !DILexicalBlock(scope: !353, file: !71, line: 267, column: 13)
!368 = !DILocation(line: 276, column: 30, scope: !367)
!369 = !DILocation(line: 277, column: 21, scope: !370)
!370 = distinct !DILexicalBlock(scope: !367, file: !71, line: 277, column: 21)
!371 = !DILocation(line: 277, column: 34, scope: !370)
!372 = !DILocation(line: 277, column: 21, scope: !367)
!373 = !DILocation(line: 279, column: 21, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !71, line: 278, column: 17)
!375 = !DILocation(line: 281, column: 17, scope: !367)
!376 = !DILocation(line: 282, column: 25, scope: !367)
!377 = !DILocation(line: 282, column: 36, scope: !367)
!378 = !DILocation(line: 283, column: 25, scope: !367)
!379 = !DILocation(line: 283, column: 34, scope: !367)
!380 = !DILocation(line: 283, column: 41, scope: !367)
!381 = !DILocation(line: 284, column: 36, scope: !367)
!382 = !DILocation(line: 284, column: 25, scope: !367)
!383 = !DILocation(line: 284, column: 34, scope: !367)
!384 = !DILocation(line: 285, column: 26, scope: !385)
!385 = distinct !DILexicalBlock(scope: !367, file: !71, line: 285, column: 21)
!386 = !DILocation(line: 285, column: 40, scope: !385)
!387 = !DILocation(line: 285, column: 21, scope: !385)
!388 = !DILocation(line: 285, column: 85, scope: !385)
!389 = !DILocation(line: 285, column: 21, scope: !367)
!390 = !DILocation(line: 287, column: 21, scope: !391)
!391 = distinct !DILexicalBlock(scope: !385, file: !71, line: 286, column: 17)
!392 = !DILocation(line: 289, column: 28, scope: !393)
!393 = distinct !DILexicalBlock(scope: !367, file: !71, line: 289, column: 21)
!394 = !DILocation(line: 289, column: 21, scope: !393)
!395 = !DILocation(line: 289, column: 58, scope: !393)
!396 = !DILocation(line: 289, column: 21, scope: !367)
!397 = !DILocation(line: 291, column: 21, scope: !398)
!398 = distinct !DILexicalBlock(scope: !393, file: !71, line: 290, column: 17)
!399 = !DILocation(line: 293, column: 39, scope: !367)
!400 = !DILocation(line: 293, column: 32, scope: !367)
!401 = !DILocation(line: 293, column: 30, scope: !367)
!402 = !DILocation(line: 294, column: 21, scope: !403)
!403 = distinct !DILexicalBlock(scope: !367, file: !71, line: 294, column: 21)
!404 = !DILocation(line: 294, column: 34, scope: !403)
!405 = !DILocation(line: 294, column: 21, scope: !367)
!406 = !DILocation(line: 296, column: 21, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !71, line: 295, column: 17)
!408 = !DILocation(line: 299, column: 35, scope: !367)
!409 = !DILocation(line: 299, column: 49, scope: !367)
!410 = !DILocation(line: 299, column: 30, scope: !367)
!411 = !DILocation(line: 299, column: 28, scope: !367)
!412 = !DILocation(line: 300, column: 21, scope: !413)
!413 = distinct !DILexicalBlock(scope: !367, file: !71, line: 300, column: 21)
!414 = !DILocation(line: 300, column: 32, scope: !413)
!415 = !DILocation(line: 300, column: 48, scope: !413)
!416 = !DILocation(line: 300, column: 51, scope: !413)
!417 = !DILocation(line: 300, column: 62, scope: !413)
!418 = !DILocation(line: 300, column: 21, scope: !367)
!419 = !DILocation(line: 302, column: 21, scope: !420)
!420 = distinct !DILexicalBlock(scope: !413, file: !71, line: 301, column: 17)
!421 = !DILocation(line: 305, column: 29, scope: !367)
!422 = !DILocation(line: 305, column: 17, scope: !367)
!423 = !DILocation(line: 305, column: 41, scope: !367)
!424 = !DILocation(line: 307, column: 29, scope: !367)
!425 = !DILocation(line: 307, column: 24, scope: !367)
!426 = !DILocation(line: 307, column: 22, scope: !367)
!427 = !DILocation(line: 308, column: 13, scope: !367)
!428 = !DILocation(line: 310, column: 17, scope: !429)
!429 = distinct !DILexicalBlock(scope: !353, file: !71, line: 310, column: 17)
!430 = !DILocation(line: 310, column: 30, scope: !429)
!431 = !DILocation(line: 310, column: 17, scope: !353)
!432 = !DILocation(line: 312, column: 30, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !71, line: 311, column: 13)
!434 = !DILocation(line: 312, column: 17, scope: !433)
!435 = !DILocation(line: 313, column: 13, scope: !433)
!436 = !DILocation(line: 314, column: 17, scope: !437)
!437 = distinct !DILexicalBlock(scope: !353, file: !71, line: 314, column: 17)
!438 = !DILocation(line: 314, column: 30, scope: !437)
!439 = !DILocation(line: 314, column: 17, scope: !353)
!440 = !DILocation(line: 316, column: 30, scope: !441)
!441 = distinct !DILexicalBlock(scope: !437, file: !71, line: 315, column: 13)
!442 = !DILocation(line: 316, column: 17, scope: !441)
!443 = !DILocation(line: 317, column: 13, scope: !441)
!444 = !DILocalVariable(name: "buffer", scope: !445, file: !71, line: 329, type: !191)
!445 = distinct !DILexicalBlock(scope: !446, file: !71, line: 328, column: 9)
!446 = distinct !DILexicalBlock(scope: !447, file: !71, line: 327, column: 5)
!447 = distinct !DILexicalBlock(scope: !348, file: !71, line: 326, column: 8)
!448 = !DILocation(line: 329, column: 17, scope: !445)
!449 = !DILocation(line: 331, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !445, file: !71, line: 331, column: 17)
!451 = !DILocation(line: 331, column: 22, scope: !450)
!452 = !DILocation(line: 331, column: 27, scope: !450)
!453 = !DILocation(line: 331, column: 30, scope: !450)
!454 = !DILocation(line: 331, column: 35, scope: !450)
!455 = !DILocation(line: 331, column: 17, scope: !445)
!456 = !DILocation(line: 333, column: 37, scope: !457)
!457 = distinct !DILexicalBlock(scope: !450, file: !71, line: 332, column: 13)
!458 = !DILocation(line: 333, column: 30, scope: !457)
!459 = !DILocation(line: 333, column: 17, scope: !457)
!460 = !DILocation(line: 334, column: 13, scope: !457)
!461 = !DILocation(line: 337, column: 17, scope: !462)
!462 = distinct !DILexicalBlock(scope: !450, file: !71, line: 336, column: 13)
!463 = !DILocation(line: 341, column: 1, scope: !348)
!464 = distinct !DISubprogram(name: "goodG2B1", scope: !71, file: !71, line: 344, type: !72, scopeLine: 345, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!465 = !DILocalVariable(name: "data", scope: !464, file: !71, line: 346, type: !76)
!466 = !DILocation(line: 346, column: 9, scope: !464)
!467 = !DILocation(line: 348, column: 10, scope: !464)
!468 = !DILocation(line: 358, column: 14, scope: !469)
!469 = distinct !DILexicalBlock(scope: !470, file: !71, line: 355, column: 5)
!470 = distinct !DILexicalBlock(scope: !464, file: !71, line: 349, column: 8)
!471 = !DILocalVariable(name: "buffer", scope: !472, file: !71, line: 363, type: !191)
!472 = distinct !DILexicalBlock(scope: !473, file: !71, line: 362, column: 9)
!473 = distinct !DILexicalBlock(scope: !474, file: !71, line: 361, column: 5)
!474 = distinct !DILexicalBlock(scope: !464, file: !71, line: 360, column: 8)
!475 = !DILocation(line: 363, column: 17, scope: !472)
!476 = !DILocation(line: 366, column: 17, scope: !477)
!477 = distinct !DILexicalBlock(scope: !472, file: !71, line: 366, column: 17)
!478 = !DILocation(line: 366, column: 22, scope: !477)
!479 = !DILocation(line: 366, column: 17, scope: !472)
!480 = !DILocation(line: 368, column: 37, scope: !481)
!481 = distinct !DILexicalBlock(scope: !477, file: !71, line: 367, column: 13)
!482 = !DILocation(line: 368, column: 30, scope: !481)
!483 = !DILocation(line: 368, column: 17, scope: !481)
!484 = !DILocation(line: 369, column: 13, scope: !481)
!485 = !DILocation(line: 372, column: 17, scope: !486)
!486 = distinct !DILexicalBlock(scope: !477, file: !71, line: 371, column: 13)
!487 = !DILocation(line: 376, column: 1, scope: !464)
!488 = distinct !DISubprogram(name: "goodG2B2", scope: !71, file: !71, line: 379, type: !72, scopeLine: 380, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!489 = !DILocalVariable(name: "data", scope: !488, file: !71, line: 381, type: !76)
!490 = !DILocation(line: 381, column: 9, scope: !488)
!491 = !DILocation(line: 383, column: 10, scope: !488)
!492 = !DILocation(line: 388, column: 14, scope: !493)
!493 = distinct !DILexicalBlock(scope: !494, file: !71, line: 385, column: 5)
!494 = distinct !DILexicalBlock(scope: !488, file: !71, line: 384, column: 8)
!495 = !DILocalVariable(name: "buffer", scope: !496, file: !71, line: 393, type: !191)
!496 = distinct !DILexicalBlock(scope: !497, file: !71, line: 392, column: 9)
!497 = distinct !DILexicalBlock(scope: !498, file: !71, line: 391, column: 5)
!498 = distinct !DILexicalBlock(scope: !488, file: !71, line: 390, column: 8)
!499 = !DILocation(line: 393, column: 17, scope: !496)
!500 = !DILocation(line: 396, column: 17, scope: !501)
!501 = distinct !DILexicalBlock(scope: !496, file: !71, line: 396, column: 17)
!502 = !DILocation(line: 396, column: 22, scope: !501)
!503 = !DILocation(line: 396, column: 17, scope: !496)
!504 = !DILocation(line: 398, column: 37, scope: !505)
!505 = distinct !DILexicalBlock(scope: !501, file: !71, line: 397, column: 13)
!506 = !DILocation(line: 398, column: 30, scope: !505)
!507 = !DILocation(line: 398, column: 17, scope: !505)
!508 = !DILocation(line: 399, column: 13, scope: !505)
!509 = !DILocation(line: 402, column: 17, scope: !510)
!510 = distinct !DILexicalBlock(scope: !501, file: !71, line: 401, column: 13)
!511 = !DILocation(line: 406, column: 1, scope: !488)
