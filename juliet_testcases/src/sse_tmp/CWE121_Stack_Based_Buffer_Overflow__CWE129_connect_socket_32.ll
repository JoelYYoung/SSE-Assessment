; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_32_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data22 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !73, metadata !DIExpression()), !dbg !75
  store i32* %data, i32** %dataPtr1, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !76, metadata !DIExpression()), !dbg !77
  store i32* %data, i32** %dataPtr2, align 8, !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !79, metadata !DIExpression()), !dbg !81
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !82
  %1 = load i32, i32* %0, align 4, !dbg !83
  store i32 %1, i32* %data1, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !84, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !87, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !110, metadata !DIExpression()), !dbg !111
  store i32 -1, i32* %connectSocket, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  br label %do.body, !dbg !114

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !115
  store i32 %call, i32* %connectSocket, align 4, !dbg !117
  %2 = load i32, i32* %connectSocket, align 4, !dbg !118
  %cmp = icmp eq i32 %2, -1, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !122

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !124
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !125
  store i16 2, i16* %sin_family, align 4, !dbg !126
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !127
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !128
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !129
  store i32 %call2, i32* %s_addr, align 4, !dbg !130
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !131
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !132
  store i16 %call3, i16* %sin_port, align 2, !dbg !133
  %4 = load i32, i32* %connectSocket, align 4, !dbg !134
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !136
  %call4 = call i32 @connect(i32 %4, %struct.sockaddr* %5, i32 16), !dbg !137
  %cmp5 = icmp eq i32 %call4, -1, !dbg !138
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !139

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !140

if.end7:                                          ; preds = %if.end
  %6 = load i32, i32* %connectSocket, align 4, !dbg !142
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !143
  %call8 = call i64 @recv(i32 %6, i8* %arraydecay, i64 13, i32 0), !dbg !144
  %conv = trunc i64 %call8 to i32, !dbg !144
  store i32 %conv, i32* %recvResult, align 4, !dbg !145
  %7 = load i32, i32* %recvResult, align 4, !dbg !146
  %cmp9 = icmp eq i32 %7, -1, !dbg !148
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !149

lor.lhs.false:                                    ; preds = %if.end7
  %8 = load i32, i32* %recvResult, align 4, !dbg !150
  %cmp11 = icmp eq i32 %8, 0, !dbg !151
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !152

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !153

if.end14:                                         ; preds = %lor.lhs.false
  %9 = load i32, i32* %recvResult, align 4, !dbg !155
  %idxprom = sext i32 %9 to i64, !dbg !156
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !156
  store i8 0, i8* %arrayidx, align 1, !dbg !157
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !158
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !159
  store i32 %call16, i32* %data1, align 4, !dbg !160
  br label %do.end, !dbg !161

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %10 = load i32, i32* %connectSocket, align 4, !dbg !162
  %cmp17 = icmp ne i32 %10, -1, !dbg !164
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !165

if.then19:                                        ; preds = %do.end
  %11 = load i32, i32* %connectSocket, align 4, !dbg !166
  %call20 = call i32 @close(i32 %11), !dbg !168
  br label %if.end21, !dbg !169

if.end21:                                         ; preds = %if.then19, %do.end
  %12 = load i32, i32* %data1, align 4, !dbg !170
  %13 = load i32*, i32** %dataPtr1, align 8, !dbg !171
  store i32 %12, i32* %13, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata i32* %data22, metadata !173, metadata !DIExpression()), !dbg !175
  %14 = load i32*, i32** %dataPtr2, align 8, !dbg !176
  %15 = load i32, i32* %14, align 4, !dbg !177
  store i32 %15, i32* %data22, align 4, !dbg !175
  call void @llvm.dbg.declare(metadata i32* %i, metadata !178, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !181, metadata !DIExpression()), !dbg !185
  %16 = bitcast [10 x i32]* %buffer to i8*, !dbg !185
  call void @llvm.memset.p0i8.i64(i8* align 16 %16, i8 0, i64 40, i1 false), !dbg !185
  %17 = load i32, i32* %data22, align 4, !dbg !186
  %cmp23 = icmp sge i32 %17, 0, !dbg !188
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !189

if.then25:                                        ; preds = %if.end21
  %18 = load i32, i32* %data22, align 4, !dbg !190
  %idxprom26 = sext i32 %18 to i64, !dbg !192
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !192
  store i32 1, i32* %arrayidx27, align 4, !dbg !193
  store i32 0, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !196

for.cond:                                         ; preds = %for.inc, %if.then25
  %19 = load i32, i32* %i, align 4, !dbg !197
  %cmp28 = icmp slt i32 %19, 10, !dbg !199
  br i1 %cmp28, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !201
  %idxprom30 = sext i32 %20 to i64, !dbg !203
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !203
  %21 = load i32, i32* %arrayidx31, align 4, !dbg !203
  call void @printIntLine(i32 %21), !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !206
  %inc = add nsw i32 %22, 1, !dbg !206
  store i32 %inc, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  br label %if.end32, !dbg !211

if.else:                                          ; preds = %if.end21
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !212
  br label %if.end32

if.end32:                                         ; preds = %if.else, %for.end
  ret void, !dbg !214
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

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_32_good() #0 !dbg !215 {
entry:
  call void @goodG2B(), !dbg !216
  call void @goodB2G(), !dbg !217
  ret void, !dbg !218
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !219 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !224, metadata !DIExpression()), !dbg !225
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !226, metadata !DIExpression()), !dbg !227
  %call = call i64 @time(i64* null) #7, !dbg !228
  %conv = trunc i64 %call to i32, !dbg !229
  call void @srand(i32 %conv) #7, !dbg !230
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !231
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_32_good(), !dbg !232
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !233
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !234
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_32_bad(), !dbg !235
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !236
  ret i32 0, !dbg !237
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !238 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !239, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !241, metadata !DIExpression()), !dbg !242
  store i32* %data, i32** %dataPtr1, align 8, !dbg !242
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !243, metadata !DIExpression()), !dbg !244
  store i32* %data, i32** %dataPtr2, align 8, !dbg !244
  store i32 -1, i32* %data, align 4, !dbg !245
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !246, metadata !DIExpression()), !dbg !248
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !249
  %1 = load i32, i32* %0, align 4, !dbg !250
  store i32 %1, i32* %data1, align 4, !dbg !248
  store i32 7, i32* %data1, align 4, !dbg !251
  %2 = load i32, i32* %data1, align 4, !dbg !252
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !253
  store i32 %2, i32* %3, align 4, !dbg !254
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !255, metadata !DIExpression()), !dbg !257
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !258
  %5 = load i32, i32* %4, align 4, !dbg !259
  store i32 %5, i32* %data2, align 4, !dbg !257
  call void @llvm.dbg.declare(metadata i32* %i, metadata !260, metadata !DIExpression()), !dbg !262
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !263, metadata !DIExpression()), !dbg !264
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !264
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !264
  %7 = load i32, i32* %data2, align 4, !dbg !265
  %cmp = icmp sge i32 %7, 0, !dbg !267
  br i1 %cmp, label %if.then, label %if.else, !dbg !268

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !269
  %idxprom = sext i32 %8 to i64, !dbg !271
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !271
  store i32 1, i32* %arrayidx, align 4, !dbg !272
  store i32 0, i32* %i, align 4, !dbg !273
  br label %for.cond, !dbg !275

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !276
  %cmp3 = icmp slt i32 %9, 10, !dbg !278
  br i1 %cmp3, label %for.body, label %for.end, !dbg !279

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !280
  %idxprom4 = sext i32 %10 to i64, !dbg !282
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !282
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !282
  call void @printIntLine(i32 %11), !dbg !283
  br label %for.inc, !dbg !284

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !285
  %inc = add nsw i32 %12, 1, !dbg !285
  store i32 %inc, i32* %i, align 4, !dbg !285
  br label %for.cond, !dbg !286, !llvm.loop !287

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !289

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !290
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !292
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !293 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data22 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !294, metadata !DIExpression()), !dbg !295
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !296, metadata !DIExpression()), !dbg !297
  store i32* %data, i32** %dataPtr1, align 8, !dbg !297
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !298, metadata !DIExpression()), !dbg !299
  store i32* %data, i32** %dataPtr2, align 8, !dbg !299
  store i32 -1, i32* %data, align 4, !dbg !300
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !301, metadata !DIExpression()), !dbg !303
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !304
  %1 = load i32, i32* %0, align 4, !dbg !305
  store i32 %1, i32* %data1, align 4, !dbg !303
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !306, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !309, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !311, metadata !DIExpression()), !dbg !312
  store i32 -1, i32* %connectSocket, align 4, !dbg !312
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !313, metadata !DIExpression()), !dbg !314
  br label %do.body, !dbg !315

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !316
  store i32 %call, i32* %connectSocket, align 4, !dbg !318
  %2 = load i32, i32* %connectSocket, align 4, !dbg !319
  %cmp = icmp eq i32 %2, -1, !dbg !321
  br i1 %cmp, label %if.then, label %if.end, !dbg !322

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !323

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !325
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !325
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !326
  store i16 2, i16* %sin_family, align 4, !dbg !327
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !328
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !329
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !330
  store i32 %call2, i32* %s_addr, align 4, !dbg !331
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !332
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !333
  store i16 %call3, i16* %sin_port, align 2, !dbg !334
  %4 = load i32, i32* %connectSocket, align 4, !dbg !335
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !337
  %call4 = call i32 @connect(i32 %4, %struct.sockaddr* %5, i32 16), !dbg !338
  %cmp5 = icmp eq i32 %call4, -1, !dbg !339
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !340

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !341

if.end7:                                          ; preds = %if.end
  %6 = load i32, i32* %connectSocket, align 4, !dbg !343
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !344
  %call8 = call i64 @recv(i32 %6, i8* %arraydecay, i64 13, i32 0), !dbg !345
  %conv = trunc i64 %call8 to i32, !dbg !345
  store i32 %conv, i32* %recvResult, align 4, !dbg !346
  %7 = load i32, i32* %recvResult, align 4, !dbg !347
  %cmp9 = icmp eq i32 %7, -1, !dbg !349
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !350

lor.lhs.false:                                    ; preds = %if.end7
  %8 = load i32, i32* %recvResult, align 4, !dbg !351
  %cmp11 = icmp eq i32 %8, 0, !dbg !352
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !353

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !354

if.end14:                                         ; preds = %lor.lhs.false
  %9 = load i32, i32* %recvResult, align 4, !dbg !356
  %idxprom = sext i32 %9 to i64, !dbg !357
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !357
  store i8 0, i8* %arrayidx, align 1, !dbg !358
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !359
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !360
  store i32 %call16, i32* %data1, align 4, !dbg !361
  br label %do.end, !dbg !362

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %10 = load i32, i32* %connectSocket, align 4, !dbg !363
  %cmp17 = icmp ne i32 %10, -1, !dbg !365
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !366

if.then19:                                        ; preds = %do.end
  %11 = load i32, i32* %connectSocket, align 4, !dbg !367
  %call20 = call i32 @close(i32 %11), !dbg !369
  br label %if.end21, !dbg !370

if.end21:                                         ; preds = %if.then19, %do.end
  %12 = load i32, i32* %data1, align 4, !dbg !371
  %13 = load i32*, i32** %dataPtr1, align 8, !dbg !372
  store i32 %12, i32* %13, align 4, !dbg !373
  call void @llvm.dbg.declare(metadata i32* %data22, metadata !374, metadata !DIExpression()), !dbg !376
  %14 = load i32*, i32** %dataPtr2, align 8, !dbg !377
  %15 = load i32, i32* %14, align 4, !dbg !378
  store i32 %15, i32* %data22, align 4, !dbg !376
  call void @llvm.dbg.declare(metadata i32* %i, metadata !379, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !382, metadata !DIExpression()), !dbg !383
  %16 = bitcast [10 x i32]* %buffer to i8*, !dbg !383
  call void @llvm.memset.p0i8.i64(i8* align 16 %16, i8 0, i64 40, i1 false), !dbg !383
  %17 = load i32, i32* %data22, align 4, !dbg !384
  %cmp23 = icmp sge i32 %17, 0, !dbg !386
  br i1 %cmp23, label %land.lhs.true, label %if.else, !dbg !387

land.lhs.true:                                    ; preds = %if.end21
  %18 = load i32, i32* %data22, align 4, !dbg !388
  %cmp25 = icmp slt i32 %18, 10, !dbg !389
  br i1 %cmp25, label %if.then27, label %if.else, !dbg !390

if.then27:                                        ; preds = %land.lhs.true
  %19 = load i32, i32* %data22, align 4, !dbg !391
  %idxprom28 = sext i32 %19 to i64, !dbg !393
  %arrayidx29 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom28, !dbg !393
  store i32 1, i32* %arrayidx29, align 4, !dbg !394
  store i32 0, i32* %i, align 4, !dbg !395
  br label %for.cond, !dbg !397

for.cond:                                         ; preds = %for.inc, %if.then27
  %20 = load i32, i32* %i, align 4, !dbg !398
  %cmp30 = icmp slt i32 %20, 10, !dbg !400
  br i1 %cmp30, label %for.body, label %for.end, !dbg !401

for.body:                                         ; preds = %for.cond
  %21 = load i32, i32* %i, align 4, !dbg !402
  %idxprom32 = sext i32 %21 to i64, !dbg !404
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !404
  %22 = load i32, i32* %arrayidx33, align 4, !dbg !404
  call void @printIntLine(i32 %22), !dbg !405
  br label %for.inc, !dbg !406

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %i, align 4, !dbg !407
  %inc = add nsw i32 %23, 1, !dbg !407
  store i32 %inc, i32* %i, align 4, !dbg !407
  br label %for.cond, !dbg !408, !llvm.loop !409

for.end:                                          ; preds = %for.cond
  br label %if.end34, !dbg !411

if.else:                                          ; preds = %land.lhs.true, %if.end21
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !412
  br label %if.end34

if.end34:                                         ; preds = %if.else, %for.end
  ret void, !dbg !414
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
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !5}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 178, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 180, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 181, baseType: !55, size: 112, offset: 16)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 112, elements: !57)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !{!58}
!58 = !DISubrange(count: 14)
!59 = !{i32 7, !"Dwarf Version", i32 4}
!60 = !{i32 2, !"Debug Info Version", i32 3}
!61 = !{i32 1, !"wchar_size", i32 4}
!62 = !{i32 7, !"uwtable", i32 1}
!63 = !{i32 7, !"frame-pointer", i32 2}
!64 = !{!"clang version 13.0.0"}
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_32_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_32.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocalVariable(name: "dataPtr1", scope: !65, file: !66, line: 47, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!75 = !DILocation(line: 47, column: 10, scope: !65)
!76 = !DILocalVariable(name: "dataPtr2", scope: !65, file: !66, line: 48, type: !74)
!77 = !DILocation(line: 48, column: 10, scope: !65)
!78 = !DILocation(line: 50, column: 10, scope: !65)
!79 = !DILocalVariable(name: "data", scope: !80, file: !66, line: 52, type: !71)
!80 = distinct !DILexicalBlock(scope: !65, file: !66, line: 51, column: 5)
!81 = !DILocation(line: 52, column: 13, scope: !80)
!82 = !DILocation(line: 52, column: 21, scope: !80)
!83 = !DILocation(line: 52, column: 20, scope: !80)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !66, line: 58, type: !71)
!85 = distinct !DILexicalBlock(scope: !80, file: !66, line: 53, column: 9)
!86 = !DILocation(line: 58, column: 17, scope: !85)
!87 = !DILocalVariable(name: "service", scope: !85, file: !66, line: 59, type: !88)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !89)
!89 = !{!90, !91, !97, !104}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !88, file: !17, line: 240, baseType: !51, size: 16)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !88, file: !17, line: 241, baseType: !92, size: 16, offset: 16)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !94, line: 25, baseType: !95)
!94 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !96, line: 40, baseType: !53)
!96 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !88, file: !17, line: 242, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !17, line: 33, baseType: !101, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !94, line: 26, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !96, line: 42, baseType: !5)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !88, file: !17, line: 245, baseType: !105, size: 64, offset: 64)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 64, elements: !107)
!106 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!107 = !{!108}
!108 = !DISubrange(count: 8)
!109 = !DILocation(line: 59, column: 32, scope: !85)
!110 = !DILocalVariable(name: "connectSocket", scope: !85, file: !66, line: 60, type: !71)
!111 = !DILocation(line: 60, column: 20, scope: !85)
!112 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !66, line: 61, type: !55)
!113 = !DILocation(line: 61, column: 18, scope: !85)
!114 = !DILocation(line: 62, column: 13, scope: !85)
!115 = !DILocation(line: 72, column: 33, scope: !116)
!116 = distinct !DILexicalBlock(scope: !85, file: !66, line: 63, column: 13)
!117 = !DILocation(line: 72, column: 31, scope: !116)
!118 = !DILocation(line: 73, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !66, line: 73, column: 21)
!120 = !DILocation(line: 73, column: 35, scope: !119)
!121 = !DILocation(line: 73, column: 21, scope: !116)
!122 = !DILocation(line: 75, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !66, line: 74, column: 17)
!124 = !DILocation(line: 77, column: 17, scope: !116)
!125 = !DILocation(line: 78, column: 25, scope: !116)
!126 = !DILocation(line: 78, column: 36, scope: !116)
!127 = !DILocation(line: 79, column: 43, scope: !116)
!128 = !DILocation(line: 79, column: 25, scope: !116)
!129 = !DILocation(line: 79, column: 34, scope: !116)
!130 = !DILocation(line: 79, column: 41, scope: !116)
!131 = !DILocation(line: 80, column: 36, scope: !116)
!132 = !DILocation(line: 80, column: 25, scope: !116)
!133 = !DILocation(line: 80, column: 34, scope: !116)
!134 = !DILocation(line: 81, column: 29, scope: !135)
!135 = distinct !DILexicalBlock(scope: !116, file: !66, line: 81, column: 21)
!136 = !DILocation(line: 81, column: 44, scope: !135)
!137 = !DILocation(line: 81, column: 21, scope: !135)
!138 = !DILocation(line: 81, column: 89, scope: !135)
!139 = !DILocation(line: 81, column: 21, scope: !116)
!140 = !DILocation(line: 83, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !66, line: 82, column: 17)
!142 = !DILocation(line: 87, column: 35, scope: !116)
!143 = !DILocation(line: 87, column: 50, scope: !116)
!144 = !DILocation(line: 87, column: 30, scope: !116)
!145 = !DILocation(line: 87, column: 28, scope: !116)
!146 = !DILocation(line: 88, column: 21, scope: !147)
!147 = distinct !DILexicalBlock(scope: !116, file: !66, line: 88, column: 21)
!148 = !DILocation(line: 88, column: 32, scope: !147)
!149 = !DILocation(line: 88, column: 48, scope: !147)
!150 = !DILocation(line: 88, column: 51, scope: !147)
!151 = !DILocation(line: 88, column: 62, scope: !147)
!152 = !DILocation(line: 88, column: 21, scope: !116)
!153 = !DILocation(line: 90, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !147, file: !66, line: 89, column: 17)
!155 = !DILocation(line: 93, column: 29, scope: !116)
!156 = !DILocation(line: 93, column: 17, scope: !116)
!157 = !DILocation(line: 93, column: 41, scope: !116)
!158 = !DILocation(line: 95, column: 29, scope: !116)
!159 = !DILocation(line: 95, column: 24, scope: !116)
!160 = !DILocation(line: 95, column: 22, scope: !116)
!161 = !DILocation(line: 96, column: 13, scope: !116)
!162 = !DILocation(line: 98, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !85, file: !66, line: 98, column: 17)
!164 = !DILocation(line: 98, column: 31, scope: !163)
!165 = !DILocation(line: 98, column: 17, scope: !85)
!166 = !DILocation(line: 100, column: 30, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !66, line: 99, column: 13)
!168 = !DILocation(line: 100, column: 17, scope: !167)
!169 = !DILocation(line: 101, column: 13, scope: !167)
!170 = !DILocation(line: 109, column: 21, scope: !80)
!171 = !DILocation(line: 109, column: 10, scope: !80)
!172 = !DILocation(line: 109, column: 19, scope: !80)
!173 = !DILocalVariable(name: "data", scope: !174, file: !66, line: 112, type: !71)
!174 = distinct !DILexicalBlock(scope: !65, file: !66, line: 111, column: 5)
!175 = !DILocation(line: 112, column: 13, scope: !174)
!176 = !DILocation(line: 112, column: 21, scope: !174)
!177 = !DILocation(line: 112, column: 20, scope: !174)
!178 = !DILocalVariable(name: "i", scope: !179, file: !66, line: 114, type: !71)
!179 = distinct !DILexicalBlock(scope: !174, file: !66, line: 113, column: 9)
!180 = !DILocation(line: 114, column: 17, scope: !179)
!181 = !DILocalVariable(name: "buffer", scope: !179, file: !66, line: 115, type: !182)
!182 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !183)
!183 = !{!184}
!184 = !DISubrange(count: 10)
!185 = !DILocation(line: 115, column: 17, scope: !179)
!186 = !DILocation(line: 118, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !179, file: !66, line: 118, column: 17)
!188 = !DILocation(line: 118, column: 22, scope: !187)
!189 = !DILocation(line: 118, column: 17, scope: !179)
!190 = !DILocation(line: 120, column: 24, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !66, line: 119, column: 13)
!192 = !DILocation(line: 120, column: 17, scope: !191)
!193 = !DILocation(line: 120, column: 30, scope: !191)
!194 = !DILocation(line: 122, column: 23, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !66, line: 122, column: 17)
!196 = !DILocation(line: 122, column: 21, scope: !195)
!197 = !DILocation(line: 122, column: 28, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !66, line: 122, column: 17)
!199 = !DILocation(line: 122, column: 30, scope: !198)
!200 = !DILocation(line: 122, column: 17, scope: !195)
!201 = !DILocation(line: 124, column: 41, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !66, line: 123, column: 17)
!203 = !DILocation(line: 124, column: 34, scope: !202)
!204 = !DILocation(line: 124, column: 21, scope: !202)
!205 = !DILocation(line: 125, column: 17, scope: !202)
!206 = !DILocation(line: 122, column: 37, scope: !198)
!207 = !DILocation(line: 122, column: 17, scope: !198)
!208 = distinct !{!208, !200, !209, !210}
!209 = !DILocation(line: 125, column: 17, scope: !195)
!210 = !{!"llvm.loop.mustprogress"}
!211 = !DILocation(line: 126, column: 13, scope: !191)
!212 = !DILocation(line: 129, column: 17, scope: !213)
!213 = distinct !DILexicalBlock(scope: !187, file: !66, line: 128, column: 13)
!214 = !DILocation(line: 133, column: 1, scope: !65)
!215 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_32_good", scope: !66, file: !66, line: 269, type: !67, scopeLine: 270, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!216 = !DILocation(line: 271, column: 5, scope: !215)
!217 = !DILocation(line: 272, column: 5, scope: !215)
!218 = !DILocation(line: 273, column: 1, scope: !215)
!219 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 283, type: !220, scopeLine: 284, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!220 = !DISubroutineType(types: !221)
!221 = !{!71, !71, !222}
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64)
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!224 = !DILocalVariable(name: "argc", arg: 1, scope: !219, file: !66, line: 283, type: !71)
!225 = !DILocation(line: 283, column: 14, scope: !219)
!226 = !DILocalVariable(name: "argv", arg: 2, scope: !219, file: !66, line: 283, type: !222)
!227 = !DILocation(line: 283, column: 27, scope: !219)
!228 = !DILocation(line: 286, column: 22, scope: !219)
!229 = !DILocation(line: 286, column: 12, scope: !219)
!230 = !DILocation(line: 286, column: 5, scope: !219)
!231 = !DILocation(line: 288, column: 5, scope: !219)
!232 = !DILocation(line: 289, column: 5, scope: !219)
!233 = !DILocation(line: 290, column: 5, scope: !219)
!234 = !DILocation(line: 293, column: 5, scope: !219)
!235 = !DILocation(line: 294, column: 5, scope: !219)
!236 = !DILocation(line: 295, column: 5, scope: !219)
!237 = !DILocation(line: 297, column: 5, scope: !219)
!238 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 140, type: !67, scopeLine: 141, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!239 = !DILocalVariable(name: "data", scope: !238, file: !66, line: 142, type: !71)
!240 = !DILocation(line: 142, column: 9, scope: !238)
!241 = !DILocalVariable(name: "dataPtr1", scope: !238, file: !66, line: 143, type: !74)
!242 = !DILocation(line: 143, column: 10, scope: !238)
!243 = !DILocalVariable(name: "dataPtr2", scope: !238, file: !66, line: 144, type: !74)
!244 = !DILocation(line: 144, column: 10, scope: !238)
!245 = !DILocation(line: 146, column: 10, scope: !238)
!246 = !DILocalVariable(name: "data", scope: !247, file: !66, line: 148, type: !71)
!247 = distinct !DILexicalBlock(scope: !238, file: !66, line: 147, column: 5)
!248 = !DILocation(line: 148, column: 13, scope: !247)
!249 = !DILocation(line: 148, column: 21, scope: !247)
!250 = !DILocation(line: 148, column: 20, scope: !247)
!251 = !DILocation(line: 151, column: 14, scope: !247)
!252 = !DILocation(line: 152, column: 21, scope: !247)
!253 = !DILocation(line: 152, column: 10, scope: !247)
!254 = !DILocation(line: 152, column: 19, scope: !247)
!255 = !DILocalVariable(name: "data", scope: !256, file: !66, line: 155, type: !71)
!256 = distinct !DILexicalBlock(scope: !238, file: !66, line: 154, column: 5)
!257 = !DILocation(line: 155, column: 13, scope: !256)
!258 = !DILocation(line: 155, column: 21, scope: !256)
!259 = !DILocation(line: 155, column: 20, scope: !256)
!260 = !DILocalVariable(name: "i", scope: !261, file: !66, line: 157, type: !71)
!261 = distinct !DILexicalBlock(scope: !256, file: !66, line: 156, column: 9)
!262 = !DILocation(line: 157, column: 17, scope: !261)
!263 = !DILocalVariable(name: "buffer", scope: !261, file: !66, line: 158, type: !182)
!264 = !DILocation(line: 158, column: 17, scope: !261)
!265 = !DILocation(line: 161, column: 17, scope: !266)
!266 = distinct !DILexicalBlock(scope: !261, file: !66, line: 161, column: 17)
!267 = !DILocation(line: 161, column: 22, scope: !266)
!268 = !DILocation(line: 161, column: 17, scope: !261)
!269 = !DILocation(line: 163, column: 24, scope: !270)
!270 = distinct !DILexicalBlock(scope: !266, file: !66, line: 162, column: 13)
!271 = !DILocation(line: 163, column: 17, scope: !270)
!272 = !DILocation(line: 163, column: 30, scope: !270)
!273 = !DILocation(line: 165, column: 23, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !66, line: 165, column: 17)
!275 = !DILocation(line: 165, column: 21, scope: !274)
!276 = !DILocation(line: 165, column: 28, scope: !277)
!277 = distinct !DILexicalBlock(scope: !274, file: !66, line: 165, column: 17)
!278 = !DILocation(line: 165, column: 30, scope: !277)
!279 = !DILocation(line: 165, column: 17, scope: !274)
!280 = !DILocation(line: 167, column: 41, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !66, line: 166, column: 17)
!282 = !DILocation(line: 167, column: 34, scope: !281)
!283 = !DILocation(line: 167, column: 21, scope: !281)
!284 = !DILocation(line: 168, column: 17, scope: !281)
!285 = !DILocation(line: 165, column: 37, scope: !277)
!286 = !DILocation(line: 165, column: 17, scope: !277)
!287 = distinct !{!287, !279, !288, !210}
!288 = !DILocation(line: 168, column: 17, scope: !274)
!289 = !DILocation(line: 169, column: 13, scope: !270)
!290 = !DILocation(line: 172, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !266, file: !66, line: 171, column: 13)
!292 = !DILocation(line: 176, column: 1, scope: !238)
!293 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 179, type: !67, scopeLine: 180, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!294 = !DILocalVariable(name: "data", scope: !293, file: !66, line: 181, type: !71)
!295 = !DILocation(line: 181, column: 9, scope: !293)
!296 = !DILocalVariable(name: "dataPtr1", scope: !293, file: !66, line: 182, type: !74)
!297 = !DILocation(line: 182, column: 10, scope: !293)
!298 = !DILocalVariable(name: "dataPtr2", scope: !293, file: !66, line: 183, type: !74)
!299 = !DILocation(line: 183, column: 10, scope: !293)
!300 = !DILocation(line: 185, column: 10, scope: !293)
!301 = !DILocalVariable(name: "data", scope: !302, file: !66, line: 187, type: !71)
!302 = distinct !DILexicalBlock(scope: !293, file: !66, line: 186, column: 5)
!303 = !DILocation(line: 187, column: 13, scope: !302)
!304 = !DILocation(line: 187, column: 21, scope: !302)
!305 = !DILocation(line: 187, column: 20, scope: !302)
!306 = !DILocalVariable(name: "recvResult", scope: !307, file: !66, line: 193, type: !71)
!307 = distinct !DILexicalBlock(scope: !302, file: !66, line: 188, column: 9)
!308 = !DILocation(line: 193, column: 17, scope: !307)
!309 = !DILocalVariable(name: "service", scope: !307, file: !66, line: 194, type: !88)
!310 = !DILocation(line: 194, column: 32, scope: !307)
!311 = !DILocalVariable(name: "connectSocket", scope: !307, file: !66, line: 195, type: !71)
!312 = !DILocation(line: 195, column: 20, scope: !307)
!313 = !DILocalVariable(name: "inputBuffer", scope: !307, file: !66, line: 196, type: !55)
!314 = !DILocation(line: 196, column: 18, scope: !307)
!315 = !DILocation(line: 197, column: 13, scope: !307)
!316 = !DILocation(line: 207, column: 33, scope: !317)
!317 = distinct !DILexicalBlock(scope: !307, file: !66, line: 198, column: 13)
!318 = !DILocation(line: 207, column: 31, scope: !317)
!319 = !DILocation(line: 208, column: 21, scope: !320)
!320 = distinct !DILexicalBlock(scope: !317, file: !66, line: 208, column: 21)
!321 = !DILocation(line: 208, column: 35, scope: !320)
!322 = !DILocation(line: 208, column: 21, scope: !317)
!323 = !DILocation(line: 210, column: 21, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !66, line: 209, column: 17)
!325 = !DILocation(line: 212, column: 17, scope: !317)
!326 = !DILocation(line: 213, column: 25, scope: !317)
!327 = !DILocation(line: 213, column: 36, scope: !317)
!328 = !DILocation(line: 214, column: 43, scope: !317)
!329 = !DILocation(line: 214, column: 25, scope: !317)
!330 = !DILocation(line: 214, column: 34, scope: !317)
!331 = !DILocation(line: 214, column: 41, scope: !317)
!332 = !DILocation(line: 215, column: 36, scope: !317)
!333 = !DILocation(line: 215, column: 25, scope: !317)
!334 = !DILocation(line: 215, column: 34, scope: !317)
!335 = !DILocation(line: 216, column: 29, scope: !336)
!336 = distinct !DILexicalBlock(scope: !317, file: !66, line: 216, column: 21)
!337 = !DILocation(line: 216, column: 44, scope: !336)
!338 = !DILocation(line: 216, column: 21, scope: !336)
!339 = !DILocation(line: 216, column: 89, scope: !336)
!340 = !DILocation(line: 216, column: 21, scope: !317)
!341 = !DILocation(line: 218, column: 21, scope: !342)
!342 = distinct !DILexicalBlock(scope: !336, file: !66, line: 217, column: 17)
!343 = !DILocation(line: 222, column: 35, scope: !317)
!344 = !DILocation(line: 222, column: 50, scope: !317)
!345 = !DILocation(line: 222, column: 30, scope: !317)
!346 = !DILocation(line: 222, column: 28, scope: !317)
!347 = !DILocation(line: 223, column: 21, scope: !348)
!348 = distinct !DILexicalBlock(scope: !317, file: !66, line: 223, column: 21)
!349 = !DILocation(line: 223, column: 32, scope: !348)
!350 = !DILocation(line: 223, column: 48, scope: !348)
!351 = !DILocation(line: 223, column: 51, scope: !348)
!352 = !DILocation(line: 223, column: 62, scope: !348)
!353 = !DILocation(line: 223, column: 21, scope: !317)
!354 = !DILocation(line: 225, column: 21, scope: !355)
!355 = distinct !DILexicalBlock(scope: !348, file: !66, line: 224, column: 17)
!356 = !DILocation(line: 228, column: 29, scope: !317)
!357 = !DILocation(line: 228, column: 17, scope: !317)
!358 = !DILocation(line: 228, column: 41, scope: !317)
!359 = !DILocation(line: 230, column: 29, scope: !317)
!360 = !DILocation(line: 230, column: 24, scope: !317)
!361 = !DILocation(line: 230, column: 22, scope: !317)
!362 = !DILocation(line: 231, column: 13, scope: !317)
!363 = !DILocation(line: 233, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !307, file: !66, line: 233, column: 17)
!365 = !DILocation(line: 233, column: 31, scope: !364)
!366 = !DILocation(line: 233, column: 17, scope: !307)
!367 = !DILocation(line: 235, column: 30, scope: !368)
!368 = distinct !DILexicalBlock(scope: !364, file: !66, line: 234, column: 13)
!369 = !DILocation(line: 235, column: 17, scope: !368)
!370 = !DILocation(line: 236, column: 13, scope: !368)
!371 = !DILocation(line: 244, column: 21, scope: !302)
!372 = !DILocation(line: 244, column: 10, scope: !302)
!373 = !DILocation(line: 244, column: 19, scope: !302)
!374 = !DILocalVariable(name: "data", scope: !375, file: !66, line: 247, type: !71)
!375 = distinct !DILexicalBlock(scope: !293, file: !66, line: 246, column: 5)
!376 = !DILocation(line: 247, column: 13, scope: !375)
!377 = !DILocation(line: 247, column: 21, scope: !375)
!378 = !DILocation(line: 247, column: 20, scope: !375)
!379 = !DILocalVariable(name: "i", scope: !380, file: !66, line: 249, type: !71)
!380 = distinct !DILexicalBlock(scope: !375, file: !66, line: 248, column: 9)
!381 = !DILocation(line: 249, column: 17, scope: !380)
!382 = !DILocalVariable(name: "buffer", scope: !380, file: !66, line: 250, type: !182)
!383 = !DILocation(line: 250, column: 17, scope: !380)
!384 = !DILocation(line: 252, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !380, file: !66, line: 252, column: 17)
!386 = !DILocation(line: 252, column: 22, scope: !385)
!387 = !DILocation(line: 252, column: 27, scope: !385)
!388 = !DILocation(line: 252, column: 30, scope: !385)
!389 = !DILocation(line: 252, column: 35, scope: !385)
!390 = !DILocation(line: 252, column: 17, scope: !380)
!391 = !DILocation(line: 254, column: 24, scope: !392)
!392 = distinct !DILexicalBlock(scope: !385, file: !66, line: 253, column: 13)
!393 = !DILocation(line: 254, column: 17, scope: !392)
!394 = !DILocation(line: 254, column: 30, scope: !392)
!395 = !DILocation(line: 256, column: 23, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !66, line: 256, column: 17)
!397 = !DILocation(line: 256, column: 21, scope: !396)
!398 = !DILocation(line: 256, column: 28, scope: !399)
!399 = distinct !DILexicalBlock(scope: !396, file: !66, line: 256, column: 17)
!400 = !DILocation(line: 256, column: 30, scope: !399)
!401 = !DILocation(line: 256, column: 17, scope: !396)
!402 = !DILocation(line: 258, column: 41, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !66, line: 257, column: 17)
!404 = !DILocation(line: 258, column: 34, scope: !403)
!405 = !DILocation(line: 258, column: 21, scope: !403)
!406 = !DILocation(line: 259, column: 17, scope: !403)
!407 = !DILocation(line: 256, column: 37, scope: !399)
!408 = !DILocation(line: 256, column: 17, scope: !399)
!409 = distinct !{!409, !401, !410, !210}
!410 = !DILocation(line: 259, column: 17, scope: !396)
!411 = !DILocation(line: 260, column: 13, scope: !392)
!412 = !DILocation(line: 263, column: 17, scope: !413)
!413 = distinct !DILexicalBlock(scope: !385, file: !66, line: 262, column: 13)
!414 = !DILocation(line: 267, column: 1, scope: !293)
