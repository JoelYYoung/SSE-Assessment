; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_32.c"
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_32_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data34 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !78, metadata !DIExpression()), !dbg !80
  store i32* %data, i32** %dataPtr1, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !81, metadata !DIExpression()), !dbg !82
  store i32* %data, i32** %dataPtr2, align 8, !dbg !82
  store i32 -1, i32* %data, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !84, metadata !DIExpression()), !dbg !86
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !87
  %1 = load i32, i32* %0, align 4, !dbg !88
  store i32 %1, i32* %data1, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !89, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !92, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 -1, i32* %listenSocket, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 -1, i32* %acceptSocket, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  br label %do.body, !dbg !116

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !117
  store i32 %call, i32* %listenSocket, align 4, !dbg !119
  %2 = load i32, i32* %listenSocket, align 4, !dbg !120
  %cmp = icmp eq i32 %2, -1, !dbg !122
  br i1 %cmp, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !124

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !126
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !127
  store i16 2, i16* %sin_family, align 4, !dbg !128
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !129
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !130
  store i32 0, i32* %s_addr, align 4, !dbg !131
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !132
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !133
  store i16 %call2, i16* %sin_port, align 2, !dbg !134
  %4 = load i32, i32* %listenSocket, align 4, !dbg !135
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !137
  %call3 = call i32 @bind(i32 %4, %struct.sockaddr* %5, i32 16) #7, !dbg !138
  %cmp4 = icmp eq i32 %call3, -1, !dbg !139
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !140

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !141

if.end6:                                          ; preds = %if.end
  %6 = load i32, i32* %listenSocket, align 4, !dbg !143
  %call7 = call i32 @listen(i32 %6, i32 5) #7, !dbg !145
  %cmp8 = icmp eq i32 %call7, -1, !dbg !146
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !147

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !148

if.end10:                                         ; preds = %if.end6
  %7 = load i32, i32* %listenSocket, align 4, !dbg !150
  %call11 = call i32 @accept(i32 %7, %struct.sockaddr* null, i32* null), !dbg !151
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !152
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !153
  %cmp12 = icmp eq i32 %8, -1, !dbg !155
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !156

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !157

if.end14:                                         ; preds = %if.end10
  %9 = load i32, i32* %acceptSocket, align 4, !dbg !159
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !160
  %call15 = call i64 @recv(i32 %9, i8* %arraydecay, i64 13, i32 0), !dbg !161
  %conv = trunc i64 %call15 to i32, !dbg !161
  store i32 %conv, i32* %recvResult, align 4, !dbg !162
  %10 = load i32, i32* %recvResult, align 4, !dbg !163
  %cmp16 = icmp eq i32 %10, -1, !dbg !165
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !166

lor.lhs.false:                                    ; preds = %if.end14
  %11 = load i32, i32* %recvResult, align 4, !dbg !167
  %cmp18 = icmp eq i32 %11, 0, !dbg !168
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !169

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !170

if.end21:                                         ; preds = %lor.lhs.false
  %12 = load i32, i32* %recvResult, align 4, !dbg !172
  %idxprom = sext i32 %12 to i64, !dbg !173
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !173
  store i8 0, i8* %arrayidx, align 1, !dbg !174
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !175
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !176
  store i32 %call23, i32* %data1, align 4, !dbg !177
  br label %do.end, !dbg !178

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %13 = load i32, i32* %listenSocket, align 4, !dbg !179
  %cmp24 = icmp ne i32 %13, -1, !dbg !181
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !182

if.then26:                                        ; preds = %do.end
  %14 = load i32, i32* %listenSocket, align 4, !dbg !183
  %call27 = call i32 @close(i32 %14), !dbg !185
  br label %if.end28, !dbg !186

if.end28:                                         ; preds = %if.then26, %do.end
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !187
  %cmp29 = icmp ne i32 %15, -1, !dbg !189
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !190

if.then31:                                        ; preds = %if.end28
  %16 = load i32, i32* %acceptSocket, align 4, !dbg !191
  %call32 = call i32 @close(i32 %16), !dbg !193
  br label %if.end33, !dbg !194

if.end33:                                         ; preds = %if.then31, %if.end28
  %17 = load i32, i32* %data1, align 4, !dbg !195
  %18 = load i32*, i32** %dataPtr1, align 8, !dbg !196
  store i32 %17, i32* %18, align 4, !dbg !197
  call void @llvm.dbg.declare(metadata i32* %data34, metadata !198, metadata !DIExpression()), !dbg !200
  %19 = load i32*, i32** %dataPtr2, align 8, !dbg !201
  %20 = load i32, i32* %19, align 4, !dbg !202
  store i32 %20, i32* %data34, align 4, !dbg !200
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !203, metadata !DIExpression()), !dbg !208
  %21 = bitcast [10 x i32]* %buffer to i8*, !dbg !208
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 40, i1 false), !dbg !208
  %22 = load i32, i32* %data34, align 4, !dbg !209
  %cmp35 = icmp sge i32 %22, 0, !dbg !211
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !212

if.then37:                                        ; preds = %if.end33
  %23 = load i32, i32* %data34, align 4, !dbg !213
  %idxprom38 = sext i32 %23 to i64, !dbg !215
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !215
  %24 = load i32, i32* %arrayidx39, align 4, !dbg !215
  call void @printIntLine(i32 %24), !dbg !216
  br label %if.end40, !dbg !217

if.else:                                          ; preds = %if.end33
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !218
  br label %if.end40

if.end40:                                         ; preds = %if.else, %if.then37
  ret void, !dbg !220
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_32_good() #0 !dbg !221 {
entry:
  call void @goodG2B(), !dbg !222
  call void @goodB2G(), !dbg !223
  ret void, !dbg !224
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !225 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !230, metadata !DIExpression()), !dbg !231
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !232, metadata !DIExpression()), !dbg !233
  %call = call i64 @time(i64* null) #7, !dbg !234
  %conv = trunc i64 %call to i32, !dbg !235
  call void @srand(i32 %conv) #7, !dbg !236
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !237
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_32_good(), !dbg !238
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !239
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !240
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_32_bad(), !dbg !241
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !242
  ret i32 0, !dbg !243
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !244 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !245, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !247, metadata !DIExpression()), !dbg !248
  store i32* %data, i32** %dataPtr1, align 8, !dbg !248
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !249, metadata !DIExpression()), !dbg !250
  store i32* %data, i32** %dataPtr2, align 8, !dbg !250
  store i32 -1, i32* %data, align 4, !dbg !251
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !252, metadata !DIExpression()), !dbg !254
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !255
  %1 = load i32, i32* %0, align 4, !dbg !256
  store i32 %1, i32* %data1, align 4, !dbg !254
  store i32 7, i32* %data1, align 4, !dbg !257
  %2 = load i32, i32* %data1, align 4, !dbg !258
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !259
  store i32 %2, i32* %3, align 4, !dbg !260
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !261, metadata !DIExpression()), !dbg !263
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !264
  %5 = load i32, i32* %4, align 4, !dbg !265
  store i32 %5, i32* %data2, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !266, metadata !DIExpression()), !dbg !268
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !268
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !268
  %7 = load i32, i32* %data2, align 4, !dbg !269
  %cmp = icmp sge i32 %7, 0, !dbg !271
  br i1 %cmp, label %if.then, label %if.else, !dbg !272

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !273
  %idxprom = sext i32 %8 to i64, !dbg !275
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !275
  %9 = load i32, i32* %arrayidx, align 4, !dbg !275
  call void @printIntLine(i32 %9), !dbg !276
  br label %if.end, !dbg !277

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !278
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !280
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !281 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data34 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !282, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !284, metadata !DIExpression()), !dbg !285
  store i32* %data, i32** %dataPtr1, align 8, !dbg !285
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !286, metadata !DIExpression()), !dbg !287
  store i32* %data, i32** %dataPtr2, align 8, !dbg !287
  store i32 -1, i32* %data, align 4, !dbg !288
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !289, metadata !DIExpression()), !dbg !291
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !292
  %1 = load i32, i32* %0, align 4, !dbg !293
  store i32 %1, i32* %data1, align 4, !dbg !291
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !294, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !297, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !299, metadata !DIExpression()), !dbg !300
  store i32 -1, i32* %listenSocket, align 4, !dbg !300
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !301, metadata !DIExpression()), !dbg !302
  store i32 -1, i32* %acceptSocket, align 4, !dbg !302
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !303, metadata !DIExpression()), !dbg !304
  br label %do.body, !dbg !305

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !306
  store i32 %call, i32* %listenSocket, align 4, !dbg !308
  %2 = load i32, i32* %listenSocket, align 4, !dbg !309
  %cmp = icmp eq i32 %2, -1, !dbg !311
  br i1 %cmp, label %if.then, label %if.end, !dbg !312

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !313

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !315
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !315
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !316
  store i16 2, i16* %sin_family, align 4, !dbg !317
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !318
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !319
  store i32 0, i32* %s_addr, align 4, !dbg !320
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !321
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !322
  store i16 %call2, i16* %sin_port, align 2, !dbg !323
  %4 = load i32, i32* %listenSocket, align 4, !dbg !324
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !326
  %call3 = call i32 @bind(i32 %4, %struct.sockaddr* %5, i32 16) #7, !dbg !327
  %cmp4 = icmp eq i32 %call3, -1, !dbg !328
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !329

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !330

if.end6:                                          ; preds = %if.end
  %6 = load i32, i32* %listenSocket, align 4, !dbg !332
  %call7 = call i32 @listen(i32 %6, i32 5) #7, !dbg !334
  %cmp8 = icmp eq i32 %call7, -1, !dbg !335
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !336

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !337

if.end10:                                         ; preds = %if.end6
  %7 = load i32, i32* %listenSocket, align 4, !dbg !339
  %call11 = call i32 @accept(i32 %7, %struct.sockaddr* null, i32* null), !dbg !340
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !341
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !342
  %cmp12 = icmp eq i32 %8, -1, !dbg !344
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !345

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !346

if.end14:                                         ; preds = %if.end10
  %9 = load i32, i32* %acceptSocket, align 4, !dbg !348
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !349
  %call15 = call i64 @recv(i32 %9, i8* %arraydecay, i64 13, i32 0), !dbg !350
  %conv = trunc i64 %call15 to i32, !dbg !350
  store i32 %conv, i32* %recvResult, align 4, !dbg !351
  %10 = load i32, i32* %recvResult, align 4, !dbg !352
  %cmp16 = icmp eq i32 %10, -1, !dbg !354
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !355

lor.lhs.false:                                    ; preds = %if.end14
  %11 = load i32, i32* %recvResult, align 4, !dbg !356
  %cmp18 = icmp eq i32 %11, 0, !dbg !357
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !358

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !359

if.end21:                                         ; preds = %lor.lhs.false
  %12 = load i32, i32* %recvResult, align 4, !dbg !361
  %idxprom = sext i32 %12 to i64, !dbg !362
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !362
  store i8 0, i8* %arrayidx, align 1, !dbg !363
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !364
  %call23 = call i32 @atoi(i8* %arraydecay22) #9, !dbg !365
  store i32 %call23, i32* %data1, align 4, !dbg !366
  br label %do.end, !dbg !367

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then
  %13 = load i32, i32* %listenSocket, align 4, !dbg !368
  %cmp24 = icmp ne i32 %13, -1, !dbg !370
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !371

if.then26:                                        ; preds = %do.end
  %14 = load i32, i32* %listenSocket, align 4, !dbg !372
  %call27 = call i32 @close(i32 %14), !dbg !374
  br label %if.end28, !dbg !375

if.end28:                                         ; preds = %if.then26, %do.end
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !376
  %cmp29 = icmp ne i32 %15, -1, !dbg !378
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !379

if.then31:                                        ; preds = %if.end28
  %16 = load i32, i32* %acceptSocket, align 4, !dbg !380
  %call32 = call i32 @close(i32 %16), !dbg !382
  br label %if.end33, !dbg !383

if.end33:                                         ; preds = %if.then31, %if.end28
  %17 = load i32, i32* %data1, align 4, !dbg !384
  %18 = load i32*, i32** %dataPtr1, align 8, !dbg !385
  store i32 %17, i32* %18, align 4, !dbg !386
  call void @llvm.dbg.declare(metadata i32* %data34, metadata !387, metadata !DIExpression()), !dbg !389
  %19 = load i32*, i32** %dataPtr2, align 8, !dbg !390
  %20 = load i32, i32* %19, align 4, !dbg !391
  store i32 %20, i32* %data34, align 4, !dbg !389
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !392, metadata !DIExpression()), !dbg !394
  %21 = bitcast [10 x i32]* %buffer to i8*, !dbg !394
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 40, i1 false), !dbg !394
  %22 = load i32, i32* %data34, align 4, !dbg !395
  %cmp35 = icmp sge i32 %22, 0, !dbg !397
  br i1 %cmp35, label %land.lhs.true, label %if.else, !dbg !398

land.lhs.true:                                    ; preds = %if.end33
  %23 = load i32, i32* %data34, align 4, !dbg !399
  %cmp37 = icmp slt i32 %23, 10, !dbg !400
  br i1 %cmp37, label %if.then39, label %if.else, !dbg !401

if.then39:                                        ; preds = %land.lhs.true
  %24 = load i32, i32* %data34, align 4, !dbg !402
  %idxprom40 = sext i32 %24 to i64, !dbg !404
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom40, !dbg !404
  %25 = load i32, i32* %arrayidx41, align 4, !dbg !404
  call void @printIntLine(i32 %25), !dbg !405
  br label %if.end42, !dbg !406

if.else:                                          ; preds = %land.lhs.true, %if.end33
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !407
  br label %if.end42

if.end42:                                         ; preds = %if.else, %if.then39
  ret void, !dbg !409
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_32.c", directory: "/root/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_32_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_32.c", directory: "/root/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocalVariable(name: "dataPtr1", scope: !70, file: !71, line: 47, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!80 = !DILocation(line: 47, column: 10, scope: !70)
!81 = !DILocalVariable(name: "dataPtr2", scope: !70, file: !71, line: 48, type: !79)
!82 = !DILocation(line: 48, column: 10, scope: !70)
!83 = !DILocation(line: 50, column: 10, scope: !70)
!84 = !DILocalVariable(name: "data", scope: !85, file: !71, line: 52, type: !76)
!85 = distinct !DILexicalBlock(scope: !70, file: !71, line: 51, column: 5)
!86 = !DILocation(line: 52, column: 13, scope: !85)
!87 = !DILocation(line: 52, column: 21, scope: !85)
!88 = !DILocation(line: 52, column: 20, scope: !85)
!89 = !DILocalVariable(name: "recvResult", scope: !90, file: !71, line: 58, type: !76)
!90 = distinct !DILexicalBlock(scope: !85, file: !71, line: 53, column: 9)
!91 = !DILocation(line: 58, column: 17, scope: !90)
!92 = !DILocalVariable(name: "service", scope: !90, file: !71, line: 59, type: !93)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !94)
!94 = !{!95, !96, !100, !104}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !93, file: !17, line: 239, baseType: !56, size: 16)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !93, file: !17, line: 240, baseType: !97, size: 16, offset: 16)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 39, baseType: !58)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !93, file: !17, line: 241, baseType: !101, size: 32, offset: 32)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !102)
!102 = !{!103}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !101, file: !17, line: 33, baseType: !46, size: 32)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !93, file: !17, line: 244, baseType: !105, size: 64, offset: 64)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 64, elements: !107)
!106 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!107 = !{!108}
!108 = !DISubrange(count: 8)
!109 = !DILocation(line: 59, column: 32, scope: !90)
!110 = !DILocalVariable(name: "listenSocket", scope: !90, file: !71, line: 60, type: !76)
!111 = !DILocation(line: 60, column: 20, scope: !90)
!112 = !DILocalVariable(name: "acceptSocket", scope: !90, file: !71, line: 61, type: !76)
!113 = !DILocation(line: 61, column: 20, scope: !90)
!114 = !DILocalVariable(name: "inputBuffer", scope: !90, file: !71, line: 62, type: !60)
!115 = !DILocation(line: 62, column: 18, scope: !90)
!116 = !DILocation(line: 63, column: 13, scope: !90)
!117 = !DILocation(line: 73, column: 32, scope: !118)
!118 = distinct !DILexicalBlock(scope: !90, file: !71, line: 64, column: 13)
!119 = !DILocation(line: 73, column: 30, scope: !118)
!120 = !DILocation(line: 74, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !71, line: 74, column: 21)
!122 = !DILocation(line: 74, column: 34, scope: !121)
!123 = !DILocation(line: 74, column: 21, scope: !118)
!124 = !DILocation(line: 76, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !71, line: 75, column: 17)
!126 = !DILocation(line: 78, column: 17, scope: !118)
!127 = !DILocation(line: 79, column: 25, scope: !118)
!128 = !DILocation(line: 79, column: 36, scope: !118)
!129 = !DILocation(line: 80, column: 25, scope: !118)
!130 = !DILocation(line: 80, column: 34, scope: !118)
!131 = !DILocation(line: 80, column: 41, scope: !118)
!132 = !DILocation(line: 81, column: 36, scope: !118)
!133 = !DILocation(line: 81, column: 25, scope: !118)
!134 = !DILocation(line: 81, column: 34, scope: !118)
!135 = !DILocation(line: 82, column: 26, scope: !136)
!136 = distinct !DILexicalBlock(scope: !118, file: !71, line: 82, column: 21)
!137 = !DILocation(line: 82, column: 40, scope: !136)
!138 = !DILocation(line: 82, column: 21, scope: !136)
!139 = !DILocation(line: 82, column: 85, scope: !136)
!140 = !DILocation(line: 82, column: 21, scope: !118)
!141 = !DILocation(line: 84, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !71, line: 83, column: 17)
!143 = !DILocation(line: 86, column: 28, scope: !144)
!144 = distinct !DILexicalBlock(scope: !118, file: !71, line: 86, column: 21)
!145 = !DILocation(line: 86, column: 21, scope: !144)
!146 = !DILocation(line: 86, column: 58, scope: !144)
!147 = !DILocation(line: 86, column: 21, scope: !118)
!148 = !DILocation(line: 88, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !71, line: 87, column: 17)
!150 = !DILocation(line: 90, column: 39, scope: !118)
!151 = !DILocation(line: 90, column: 32, scope: !118)
!152 = !DILocation(line: 90, column: 30, scope: !118)
!153 = !DILocation(line: 91, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !118, file: !71, line: 91, column: 21)
!155 = !DILocation(line: 91, column: 34, scope: !154)
!156 = !DILocation(line: 91, column: 21, scope: !118)
!157 = !DILocation(line: 93, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !71, line: 92, column: 17)
!159 = !DILocation(line: 96, column: 35, scope: !118)
!160 = !DILocation(line: 96, column: 49, scope: !118)
!161 = !DILocation(line: 96, column: 30, scope: !118)
!162 = !DILocation(line: 96, column: 28, scope: !118)
!163 = !DILocation(line: 97, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !118, file: !71, line: 97, column: 21)
!165 = !DILocation(line: 97, column: 32, scope: !164)
!166 = !DILocation(line: 97, column: 48, scope: !164)
!167 = !DILocation(line: 97, column: 51, scope: !164)
!168 = !DILocation(line: 97, column: 62, scope: !164)
!169 = !DILocation(line: 97, column: 21, scope: !118)
!170 = !DILocation(line: 99, column: 21, scope: !171)
!171 = distinct !DILexicalBlock(scope: !164, file: !71, line: 98, column: 17)
!172 = !DILocation(line: 102, column: 29, scope: !118)
!173 = !DILocation(line: 102, column: 17, scope: !118)
!174 = !DILocation(line: 102, column: 41, scope: !118)
!175 = !DILocation(line: 104, column: 29, scope: !118)
!176 = !DILocation(line: 104, column: 24, scope: !118)
!177 = !DILocation(line: 104, column: 22, scope: !118)
!178 = !DILocation(line: 105, column: 13, scope: !118)
!179 = !DILocation(line: 107, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !90, file: !71, line: 107, column: 17)
!181 = !DILocation(line: 107, column: 30, scope: !180)
!182 = !DILocation(line: 107, column: 17, scope: !90)
!183 = !DILocation(line: 109, column: 30, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !71, line: 108, column: 13)
!185 = !DILocation(line: 109, column: 17, scope: !184)
!186 = !DILocation(line: 110, column: 13, scope: !184)
!187 = !DILocation(line: 111, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !90, file: !71, line: 111, column: 17)
!189 = !DILocation(line: 111, column: 30, scope: !188)
!190 = !DILocation(line: 111, column: 17, scope: !90)
!191 = !DILocation(line: 113, column: 30, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !71, line: 112, column: 13)
!193 = !DILocation(line: 113, column: 17, scope: !192)
!194 = !DILocation(line: 114, column: 13, scope: !192)
!195 = !DILocation(line: 122, column: 21, scope: !85)
!196 = !DILocation(line: 122, column: 10, scope: !85)
!197 = !DILocation(line: 122, column: 19, scope: !85)
!198 = !DILocalVariable(name: "data", scope: !199, file: !71, line: 125, type: !76)
!199 = distinct !DILexicalBlock(scope: !70, file: !71, line: 124, column: 5)
!200 = !DILocation(line: 125, column: 13, scope: !199)
!201 = !DILocation(line: 125, column: 21, scope: !199)
!202 = !DILocation(line: 125, column: 20, scope: !199)
!203 = !DILocalVariable(name: "buffer", scope: !204, file: !71, line: 127, type: !205)
!204 = distinct !DILexicalBlock(scope: !199, file: !71, line: 126, column: 9)
!205 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !206)
!206 = !{!207}
!207 = !DISubrange(count: 10)
!208 = !DILocation(line: 127, column: 17, scope: !204)
!209 = !DILocation(line: 130, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !204, file: !71, line: 130, column: 17)
!211 = !DILocation(line: 130, column: 22, scope: !210)
!212 = !DILocation(line: 130, column: 17, scope: !204)
!213 = !DILocation(line: 132, column: 37, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !71, line: 131, column: 13)
!215 = !DILocation(line: 132, column: 30, scope: !214)
!216 = !DILocation(line: 132, column: 17, scope: !214)
!217 = !DILocation(line: 133, column: 13, scope: !214)
!218 = !DILocation(line: 136, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !210, file: !71, line: 135, column: 13)
!220 = !DILocation(line: 140, column: 1, scope: !70)
!221 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_32_good", scope: !71, file: !71, line: 277, type: !72, scopeLine: 278, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!222 = !DILocation(line: 279, column: 5, scope: !221)
!223 = !DILocation(line: 280, column: 5, scope: !221)
!224 = !DILocation(line: 281, column: 1, scope: !221)
!225 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 291, type: !226, scopeLine: 292, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!226 = !DISubroutineType(types: !227)
!227 = !{!76, !76, !228}
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64)
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!230 = !DILocalVariable(name: "argc", arg: 1, scope: !225, file: !71, line: 291, type: !76)
!231 = !DILocation(line: 291, column: 14, scope: !225)
!232 = !DILocalVariable(name: "argv", arg: 2, scope: !225, file: !71, line: 291, type: !228)
!233 = !DILocation(line: 291, column: 27, scope: !225)
!234 = !DILocation(line: 294, column: 22, scope: !225)
!235 = !DILocation(line: 294, column: 12, scope: !225)
!236 = !DILocation(line: 294, column: 5, scope: !225)
!237 = !DILocation(line: 296, column: 5, scope: !225)
!238 = !DILocation(line: 297, column: 5, scope: !225)
!239 = !DILocation(line: 298, column: 5, scope: !225)
!240 = !DILocation(line: 301, column: 5, scope: !225)
!241 = !DILocation(line: 302, column: 5, scope: !225)
!242 = !DILocation(line: 303, column: 5, scope: !225)
!243 = !DILocation(line: 305, column: 5, scope: !225)
!244 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 147, type: !72, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!245 = !DILocalVariable(name: "data", scope: !244, file: !71, line: 149, type: !76)
!246 = !DILocation(line: 149, column: 9, scope: !244)
!247 = !DILocalVariable(name: "dataPtr1", scope: !244, file: !71, line: 150, type: !79)
!248 = !DILocation(line: 150, column: 10, scope: !244)
!249 = !DILocalVariable(name: "dataPtr2", scope: !244, file: !71, line: 151, type: !79)
!250 = !DILocation(line: 151, column: 10, scope: !244)
!251 = !DILocation(line: 153, column: 10, scope: !244)
!252 = !DILocalVariable(name: "data", scope: !253, file: !71, line: 155, type: !76)
!253 = distinct !DILexicalBlock(scope: !244, file: !71, line: 154, column: 5)
!254 = !DILocation(line: 155, column: 13, scope: !253)
!255 = !DILocation(line: 155, column: 21, scope: !253)
!256 = !DILocation(line: 155, column: 20, scope: !253)
!257 = !DILocation(line: 158, column: 14, scope: !253)
!258 = !DILocation(line: 159, column: 21, scope: !253)
!259 = !DILocation(line: 159, column: 10, scope: !253)
!260 = !DILocation(line: 159, column: 19, scope: !253)
!261 = !DILocalVariable(name: "data", scope: !262, file: !71, line: 162, type: !76)
!262 = distinct !DILexicalBlock(scope: !244, file: !71, line: 161, column: 5)
!263 = !DILocation(line: 162, column: 13, scope: !262)
!264 = !DILocation(line: 162, column: 21, scope: !262)
!265 = !DILocation(line: 162, column: 20, scope: !262)
!266 = !DILocalVariable(name: "buffer", scope: !267, file: !71, line: 164, type: !205)
!267 = distinct !DILexicalBlock(scope: !262, file: !71, line: 163, column: 9)
!268 = !DILocation(line: 164, column: 17, scope: !267)
!269 = !DILocation(line: 167, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !267, file: !71, line: 167, column: 17)
!271 = !DILocation(line: 167, column: 22, scope: !270)
!272 = !DILocation(line: 167, column: 17, scope: !267)
!273 = !DILocation(line: 169, column: 37, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !71, line: 168, column: 13)
!275 = !DILocation(line: 169, column: 30, scope: !274)
!276 = !DILocation(line: 169, column: 17, scope: !274)
!277 = !DILocation(line: 170, column: 13, scope: !274)
!278 = !DILocation(line: 173, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !270, file: !71, line: 172, column: 13)
!280 = !DILocation(line: 177, column: 1, scope: !244)
!281 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 180, type: !72, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!282 = !DILocalVariable(name: "data", scope: !281, file: !71, line: 182, type: !76)
!283 = !DILocation(line: 182, column: 9, scope: !281)
!284 = !DILocalVariable(name: "dataPtr1", scope: !281, file: !71, line: 183, type: !79)
!285 = !DILocation(line: 183, column: 10, scope: !281)
!286 = !DILocalVariable(name: "dataPtr2", scope: !281, file: !71, line: 184, type: !79)
!287 = !DILocation(line: 184, column: 10, scope: !281)
!288 = !DILocation(line: 186, column: 10, scope: !281)
!289 = !DILocalVariable(name: "data", scope: !290, file: !71, line: 188, type: !76)
!290 = distinct !DILexicalBlock(scope: !281, file: !71, line: 187, column: 5)
!291 = !DILocation(line: 188, column: 13, scope: !290)
!292 = !DILocation(line: 188, column: 21, scope: !290)
!293 = !DILocation(line: 188, column: 20, scope: !290)
!294 = !DILocalVariable(name: "recvResult", scope: !295, file: !71, line: 194, type: !76)
!295 = distinct !DILexicalBlock(scope: !290, file: !71, line: 189, column: 9)
!296 = !DILocation(line: 194, column: 17, scope: !295)
!297 = !DILocalVariable(name: "service", scope: !295, file: !71, line: 195, type: !93)
!298 = !DILocation(line: 195, column: 32, scope: !295)
!299 = !DILocalVariable(name: "listenSocket", scope: !295, file: !71, line: 196, type: !76)
!300 = !DILocation(line: 196, column: 20, scope: !295)
!301 = !DILocalVariable(name: "acceptSocket", scope: !295, file: !71, line: 197, type: !76)
!302 = !DILocation(line: 197, column: 20, scope: !295)
!303 = !DILocalVariable(name: "inputBuffer", scope: !295, file: !71, line: 198, type: !60)
!304 = !DILocation(line: 198, column: 18, scope: !295)
!305 = !DILocation(line: 199, column: 13, scope: !295)
!306 = !DILocation(line: 209, column: 32, scope: !307)
!307 = distinct !DILexicalBlock(scope: !295, file: !71, line: 200, column: 13)
!308 = !DILocation(line: 209, column: 30, scope: !307)
!309 = !DILocation(line: 210, column: 21, scope: !310)
!310 = distinct !DILexicalBlock(scope: !307, file: !71, line: 210, column: 21)
!311 = !DILocation(line: 210, column: 34, scope: !310)
!312 = !DILocation(line: 210, column: 21, scope: !307)
!313 = !DILocation(line: 212, column: 21, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !71, line: 211, column: 17)
!315 = !DILocation(line: 214, column: 17, scope: !307)
!316 = !DILocation(line: 215, column: 25, scope: !307)
!317 = !DILocation(line: 215, column: 36, scope: !307)
!318 = !DILocation(line: 216, column: 25, scope: !307)
!319 = !DILocation(line: 216, column: 34, scope: !307)
!320 = !DILocation(line: 216, column: 41, scope: !307)
!321 = !DILocation(line: 217, column: 36, scope: !307)
!322 = !DILocation(line: 217, column: 25, scope: !307)
!323 = !DILocation(line: 217, column: 34, scope: !307)
!324 = !DILocation(line: 218, column: 26, scope: !325)
!325 = distinct !DILexicalBlock(scope: !307, file: !71, line: 218, column: 21)
!326 = !DILocation(line: 218, column: 40, scope: !325)
!327 = !DILocation(line: 218, column: 21, scope: !325)
!328 = !DILocation(line: 218, column: 85, scope: !325)
!329 = !DILocation(line: 218, column: 21, scope: !307)
!330 = !DILocation(line: 220, column: 21, scope: !331)
!331 = distinct !DILexicalBlock(scope: !325, file: !71, line: 219, column: 17)
!332 = !DILocation(line: 222, column: 28, scope: !333)
!333 = distinct !DILexicalBlock(scope: !307, file: !71, line: 222, column: 21)
!334 = !DILocation(line: 222, column: 21, scope: !333)
!335 = !DILocation(line: 222, column: 58, scope: !333)
!336 = !DILocation(line: 222, column: 21, scope: !307)
!337 = !DILocation(line: 224, column: 21, scope: !338)
!338 = distinct !DILexicalBlock(scope: !333, file: !71, line: 223, column: 17)
!339 = !DILocation(line: 226, column: 39, scope: !307)
!340 = !DILocation(line: 226, column: 32, scope: !307)
!341 = !DILocation(line: 226, column: 30, scope: !307)
!342 = !DILocation(line: 227, column: 21, scope: !343)
!343 = distinct !DILexicalBlock(scope: !307, file: !71, line: 227, column: 21)
!344 = !DILocation(line: 227, column: 34, scope: !343)
!345 = !DILocation(line: 227, column: 21, scope: !307)
!346 = !DILocation(line: 229, column: 21, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !71, line: 228, column: 17)
!348 = !DILocation(line: 232, column: 35, scope: !307)
!349 = !DILocation(line: 232, column: 49, scope: !307)
!350 = !DILocation(line: 232, column: 30, scope: !307)
!351 = !DILocation(line: 232, column: 28, scope: !307)
!352 = !DILocation(line: 233, column: 21, scope: !353)
!353 = distinct !DILexicalBlock(scope: !307, file: !71, line: 233, column: 21)
!354 = !DILocation(line: 233, column: 32, scope: !353)
!355 = !DILocation(line: 233, column: 48, scope: !353)
!356 = !DILocation(line: 233, column: 51, scope: !353)
!357 = !DILocation(line: 233, column: 62, scope: !353)
!358 = !DILocation(line: 233, column: 21, scope: !307)
!359 = !DILocation(line: 235, column: 21, scope: !360)
!360 = distinct !DILexicalBlock(scope: !353, file: !71, line: 234, column: 17)
!361 = !DILocation(line: 238, column: 29, scope: !307)
!362 = !DILocation(line: 238, column: 17, scope: !307)
!363 = !DILocation(line: 238, column: 41, scope: !307)
!364 = !DILocation(line: 240, column: 29, scope: !307)
!365 = !DILocation(line: 240, column: 24, scope: !307)
!366 = !DILocation(line: 240, column: 22, scope: !307)
!367 = !DILocation(line: 241, column: 13, scope: !307)
!368 = !DILocation(line: 243, column: 17, scope: !369)
!369 = distinct !DILexicalBlock(scope: !295, file: !71, line: 243, column: 17)
!370 = !DILocation(line: 243, column: 30, scope: !369)
!371 = !DILocation(line: 243, column: 17, scope: !295)
!372 = !DILocation(line: 245, column: 30, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !71, line: 244, column: 13)
!374 = !DILocation(line: 245, column: 17, scope: !373)
!375 = !DILocation(line: 246, column: 13, scope: !373)
!376 = !DILocation(line: 247, column: 17, scope: !377)
!377 = distinct !DILexicalBlock(scope: !295, file: !71, line: 247, column: 17)
!378 = !DILocation(line: 247, column: 30, scope: !377)
!379 = !DILocation(line: 247, column: 17, scope: !295)
!380 = !DILocation(line: 249, column: 30, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !71, line: 248, column: 13)
!382 = !DILocation(line: 249, column: 17, scope: !381)
!383 = !DILocation(line: 250, column: 13, scope: !381)
!384 = !DILocation(line: 258, column: 21, scope: !290)
!385 = !DILocation(line: 258, column: 10, scope: !290)
!386 = !DILocation(line: 258, column: 19, scope: !290)
!387 = !DILocalVariable(name: "data", scope: !388, file: !71, line: 261, type: !76)
!388 = distinct !DILexicalBlock(scope: !281, file: !71, line: 260, column: 5)
!389 = !DILocation(line: 261, column: 13, scope: !388)
!390 = !DILocation(line: 261, column: 21, scope: !388)
!391 = !DILocation(line: 261, column: 20, scope: !388)
!392 = !DILocalVariable(name: "buffer", scope: !393, file: !71, line: 263, type: !205)
!393 = distinct !DILexicalBlock(scope: !388, file: !71, line: 262, column: 9)
!394 = !DILocation(line: 263, column: 17, scope: !393)
!395 = !DILocation(line: 265, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !393, file: !71, line: 265, column: 17)
!397 = !DILocation(line: 265, column: 22, scope: !396)
!398 = !DILocation(line: 265, column: 27, scope: !396)
!399 = !DILocation(line: 265, column: 30, scope: !396)
!400 = !DILocation(line: 265, column: 35, scope: !396)
!401 = !DILocation(line: 265, column: 17, scope: !393)
!402 = !DILocation(line: 267, column: 37, scope: !403)
!403 = distinct !DILexicalBlock(scope: !396, file: !71, line: 266, column: 13)
!404 = !DILocation(line: 267, column: 30, scope: !403)
!405 = !DILocation(line: 267, column: 17, scope: !403)
!406 = !DILocation(line: 268, column: 13, scope: !403)
!407 = !DILocation(line: 271, column: 17, scope: !408)
!408 = distinct !DILexicalBlock(scope: !396, file: !71, line: 270, column: 13)
!409 = !DILocation(line: 275, column: 1, scope: !281)
