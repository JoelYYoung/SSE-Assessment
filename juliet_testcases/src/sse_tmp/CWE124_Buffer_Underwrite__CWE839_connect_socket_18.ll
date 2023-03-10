; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_18.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_18.c"
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_18_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  br label %source, !dbg !74

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !75), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !77, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !80, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 -1, i32* %connectSocket, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  br label %do.body, !dbg !107

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !108
  store i32 %call, i32* %connectSocket, align 4, !dbg !110
  %0 = load i32, i32* %connectSocket, align 4, !dbg !111
  %cmp = icmp eq i32 %0, -1, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !115

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !117
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !118
  store i16 2, i16* %sin_family, align 4, !dbg !119
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !120
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !121
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !122
  store i32 %call1, i32* %s_addr, align 4, !dbg !123
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !124
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !125
  store i16 %call2, i16* %sin_port, align 2, !dbg !126
  %2 = load i32, i32* %connectSocket, align 4, !dbg !127
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !129
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !130
  %cmp4 = icmp eq i32 %call3, -1, !dbg !131
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !132

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !133

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !135
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !136
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !137
  %conv = trunc i64 %call7 to i32, !dbg !137
  store i32 %conv, i32* %recvResult, align 4, !dbg !138
  %5 = load i32, i32* %recvResult, align 4, !dbg !139
  %cmp8 = icmp eq i32 %5, -1, !dbg !141
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !142

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !143
  %cmp10 = icmp eq i32 %6, 0, !dbg !144
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !145

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !146

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !148
  %idxprom = sext i32 %7 to i64, !dbg !149
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !150
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !151
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !152
  store i32 %call15, i32* %data, align 4, !dbg !153
  br label %do.end, !dbg !154

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !155
  %cmp16 = icmp ne i32 %8, -1, !dbg !157
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !158

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !159
  %call19 = call i32 @close(i32 %9), !dbg !161
  br label %if.end20, !dbg !162

if.end20:                                         ; preds = %if.then18, %do.end
  br label %sink, !dbg !163

sink:                                             ; preds = %if.end20
  call void @llvm.dbg.label(metadata !164), !dbg !165
  call void @llvm.dbg.declare(metadata i32* %i, metadata !166, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !169, metadata !DIExpression()), !dbg !173
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !173
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !173
  %11 = load i32, i32* %data, align 4, !dbg !174
  %cmp21 = icmp slt i32 %11, 10, !dbg !176
  br i1 %cmp21, label %if.then23, label %if.else, !dbg !177

if.then23:                                        ; preds = %sink
  %12 = load i32, i32* %data, align 4, !dbg !178
  %idxprom24 = sext i32 %12 to i64, !dbg !180
  %arrayidx25 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom24, !dbg !180
  store i32 1, i32* %arrayidx25, align 4, !dbg !181
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.then23
  %13 = load i32, i32* %i, align 4, !dbg !185
  %cmp26 = icmp slt i32 %13, 10, !dbg !187
  br i1 %cmp26, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %14 = load i32, i32* %i, align 4, !dbg !189
  %idxprom28 = sext i32 %14 to i64, !dbg !191
  %arrayidx29 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom28, !dbg !191
  %15 = load i32, i32* %arrayidx29, align 4, !dbg !191
  call void @printIntLine(i32 %15), !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !194
  %inc = add nsw i32 %16, 1, !dbg !194
  store i32 %inc, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  br label %if.end30, !dbg !199

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !200
  br label %if.end30

if.end30:                                         ; preds = %if.else, %for.end
  ret void, !dbg !202
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_18_good() #0 !dbg !203 {
entry:
  call void @goodB2G(), !dbg !204
  call void @goodG2B(), !dbg !205
  ret void, !dbg !206
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !207 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !212, metadata !DIExpression()), !dbg !213
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !214, metadata !DIExpression()), !dbg !215
  %call = call i64 @time(i64* null) #7, !dbg !216
  %conv = trunc i64 %call to i32, !dbg !217
  call void @srand(i32 %conv) #7, !dbg !218
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !219
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_18_good(), !dbg !220
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !221
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !222
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_18_bad(), !dbg !223
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !224
  ret i32 0, !dbg !225
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !226 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !227, metadata !DIExpression()), !dbg !228
  store i32 -1, i32* %data, align 4, !dbg !229
  br label %source, !dbg !230

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !231), !dbg !232
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !233, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !236, metadata !DIExpression()), !dbg !237
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !238, metadata !DIExpression()), !dbg !239
  store i32 -1, i32* %connectSocket, align 4, !dbg !239
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !240, metadata !DIExpression()), !dbg !241
  br label %do.body, !dbg !242

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !243
  store i32 %call, i32* %connectSocket, align 4, !dbg !245
  %0 = load i32, i32* %connectSocket, align 4, !dbg !246
  %cmp = icmp eq i32 %0, -1, !dbg !248
  br i1 %cmp, label %if.then, label %if.end, !dbg !249

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !250

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !252
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !252
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !253
  store i16 2, i16* %sin_family, align 4, !dbg !254
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !255
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !256
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !257
  store i32 %call1, i32* %s_addr, align 4, !dbg !258
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !259
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !260
  store i16 %call2, i16* %sin_port, align 2, !dbg !261
  %2 = load i32, i32* %connectSocket, align 4, !dbg !262
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !264
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !265
  %cmp4 = icmp eq i32 %call3, -1, !dbg !266
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !267

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !268

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !270
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !271
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !272
  %conv = trunc i64 %call7 to i32, !dbg !272
  store i32 %conv, i32* %recvResult, align 4, !dbg !273
  %5 = load i32, i32* %recvResult, align 4, !dbg !274
  %cmp8 = icmp eq i32 %5, -1, !dbg !276
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !277

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !278
  %cmp10 = icmp eq i32 %6, 0, !dbg !279
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !280

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !281

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !283
  %idxprom = sext i32 %7 to i64, !dbg !284
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !284
  store i8 0, i8* %arrayidx, align 1, !dbg !285
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !286
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !287
  store i32 %call15, i32* %data, align 4, !dbg !288
  br label %do.end, !dbg !289

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !290
  %cmp16 = icmp ne i32 %8, -1, !dbg !292
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !293

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !294
  %call19 = call i32 @close(i32 %9), !dbg !296
  br label %if.end20, !dbg !297

if.end20:                                         ; preds = %if.then18, %do.end
  br label %sink, !dbg !298

sink:                                             ; preds = %if.end20
  call void @llvm.dbg.label(metadata !299), !dbg !300
  call void @llvm.dbg.declare(metadata i32* %i, metadata !301, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !304, metadata !DIExpression()), !dbg !305
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !305
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !305
  %11 = load i32, i32* %data, align 4, !dbg !306
  %cmp21 = icmp sge i32 %11, 0, !dbg !308
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !309

land.lhs.true:                                    ; preds = %sink
  %12 = load i32, i32* %data, align 4, !dbg !310
  %cmp23 = icmp slt i32 %12, 10, !dbg !311
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !312

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !313
  %idxprom26 = sext i32 %13 to i64, !dbg !315
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !315
  store i32 1, i32* %arrayidx27, align 4, !dbg !316
  store i32 0, i32* %i, align 4, !dbg !317
  br label %for.cond, !dbg !319

for.cond:                                         ; preds = %for.inc, %if.then25
  %14 = load i32, i32* %i, align 4, !dbg !320
  %cmp28 = icmp slt i32 %14, 10, !dbg !322
  br i1 %cmp28, label %for.body, label %for.end, !dbg !323

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !324
  %idxprom30 = sext i32 %15 to i64, !dbg !326
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !326
  %16 = load i32, i32* %arrayidx31, align 4, !dbg !326
  call void @printIntLine(i32 %16), !dbg !327
  br label %for.inc, !dbg !328

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !329
  %inc = add nsw i32 %17, 1, !dbg !329
  store i32 %inc, i32* %i, align 4, !dbg !329
  br label %for.cond, !dbg !330, !llvm.loop !331

for.end:                                          ; preds = %for.cond
  br label %if.end32, !dbg !333

if.else:                                          ; preds = %land.lhs.true, %sink
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !334
  br label %if.end32

if.end32:                                         ; preds = %if.else, %for.end
  ret void, !dbg !336
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !337 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !338, metadata !DIExpression()), !dbg !339
  store i32 -1, i32* %data, align 4, !dbg !340
  br label %source, !dbg !341

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !342), !dbg !343
  store i32 7, i32* %data, align 4, !dbg !344
  br label %sink, !dbg !345

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !346), !dbg !347
  call void @llvm.dbg.declare(metadata i32* %i, metadata !348, metadata !DIExpression()), !dbg !350
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !351, metadata !DIExpression()), !dbg !352
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !352
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !352
  %1 = load i32, i32* %data, align 4, !dbg !353
  %cmp = icmp slt i32 %1, 10, !dbg !355
  br i1 %cmp, label %if.then, label %if.else, !dbg !356

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !357
  %idxprom = sext i32 %2 to i64, !dbg !359
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !359
  store i32 1, i32* %arrayidx, align 4, !dbg !360
  store i32 0, i32* %i, align 4, !dbg !361
  br label %for.cond, !dbg !363

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !364
  %cmp1 = icmp slt i32 %3, 10, !dbg !366
  br i1 %cmp1, label %for.body, label %for.end, !dbg !367

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !368
  %idxprom2 = sext i32 %4 to i64, !dbg !370
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !370
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !370
  call void @printIntLine(i32 %5), !dbg !371
  br label %for.inc, !dbg !372

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !373
  %inc = add nsw i32 %6, 1, !dbg !373
  store i32 %inc, i32* %i, align 4, !dbg !373
  br label %for.cond, !dbg !374, !llvm.loop !375

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !377

if.else:                                          ; preds = %sink
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !378
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !380
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_18_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_18.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocation(line: 49, column: 5, scope: !65)
!75 = !DILabel(scope: !65, name: "source", file: !66, line: 50)
!76 = !DILocation(line: 50, column: 1, scope: !65)
!77 = !DILocalVariable(name: "recvResult", scope: !78, file: !66, line: 56, type: !71)
!78 = distinct !DILexicalBlock(scope: !65, file: !66, line: 51, column: 5)
!79 = !DILocation(line: 56, column: 13, scope: !78)
!80 = !DILocalVariable(name: "service", scope: !78, file: !66, line: 57, type: !81)
!81 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !82)
!82 = !{!83, !84, !90, !97}
!83 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !81, file: !17, line: 240, baseType: !51, size: 16)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !81, file: !17, line: 241, baseType: !85, size: 16, offset: 16)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !86)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !87, line: 25, baseType: !88)
!87 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !89, line: 40, baseType: !53)
!89 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !81, file: !17, line: 242, baseType: !91, size: 32, offset: 32)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !92)
!92 = !{!93}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !91, file: !17, line: 33, baseType: !94, size: 32)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !87, line: 26, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !89, line: 42, baseType: !5)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !81, file: !17, line: 245, baseType: !98, size: 64, offset: 64)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !99, size: 64, elements: !100)
!99 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!100 = !{!101}
!101 = !DISubrange(count: 8)
!102 = !DILocation(line: 57, column: 28, scope: !78)
!103 = !DILocalVariable(name: "connectSocket", scope: !78, file: !66, line: 58, type: !71)
!104 = !DILocation(line: 58, column: 16, scope: !78)
!105 = !DILocalVariable(name: "inputBuffer", scope: !78, file: !66, line: 59, type: !55)
!106 = !DILocation(line: 59, column: 14, scope: !78)
!107 = !DILocation(line: 60, column: 9, scope: !78)
!108 = !DILocation(line: 70, column: 29, scope: !109)
!109 = distinct !DILexicalBlock(scope: !78, file: !66, line: 61, column: 9)
!110 = !DILocation(line: 70, column: 27, scope: !109)
!111 = !DILocation(line: 71, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !66, line: 71, column: 17)
!113 = !DILocation(line: 71, column: 31, scope: !112)
!114 = !DILocation(line: 71, column: 17, scope: !109)
!115 = !DILocation(line: 73, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !66, line: 72, column: 13)
!117 = !DILocation(line: 75, column: 13, scope: !109)
!118 = !DILocation(line: 76, column: 21, scope: !109)
!119 = !DILocation(line: 76, column: 32, scope: !109)
!120 = !DILocation(line: 77, column: 39, scope: !109)
!121 = !DILocation(line: 77, column: 21, scope: !109)
!122 = !DILocation(line: 77, column: 30, scope: !109)
!123 = !DILocation(line: 77, column: 37, scope: !109)
!124 = !DILocation(line: 78, column: 32, scope: !109)
!125 = !DILocation(line: 78, column: 21, scope: !109)
!126 = !DILocation(line: 78, column: 30, scope: !109)
!127 = !DILocation(line: 79, column: 25, scope: !128)
!128 = distinct !DILexicalBlock(scope: !109, file: !66, line: 79, column: 17)
!129 = !DILocation(line: 79, column: 40, scope: !128)
!130 = !DILocation(line: 79, column: 17, scope: !128)
!131 = !DILocation(line: 79, column: 85, scope: !128)
!132 = !DILocation(line: 79, column: 17, scope: !109)
!133 = !DILocation(line: 81, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !66, line: 80, column: 13)
!135 = !DILocation(line: 85, column: 31, scope: !109)
!136 = !DILocation(line: 85, column: 46, scope: !109)
!137 = !DILocation(line: 85, column: 26, scope: !109)
!138 = !DILocation(line: 85, column: 24, scope: !109)
!139 = !DILocation(line: 86, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !109, file: !66, line: 86, column: 17)
!141 = !DILocation(line: 86, column: 28, scope: !140)
!142 = !DILocation(line: 86, column: 44, scope: !140)
!143 = !DILocation(line: 86, column: 47, scope: !140)
!144 = !DILocation(line: 86, column: 58, scope: !140)
!145 = !DILocation(line: 86, column: 17, scope: !109)
!146 = !DILocation(line: 88, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !140, file: !66, line: 87, column: 13)
!148 = !DILocation(line: 91, column: 25, scope: !109)
!149 = !DILocation(line: 91, column: 13, scope: !109)
!150 = !DILocation(line: 91, column: 37, scope: !109)
!151 = !DILocation(line: 93, column: 25, scope: !109)
!152 = !DILocation(line: 93, column: 20, scope: !109)
!153 = !DILocation(line: 93, column: 18, scope: !109)
!154 = !DILocation(line: 94, column: 9, scope: !109)
!155 = !DILocation(line: 96, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !78, file: !66, line: 96, column: 13)
!157 = !DILocation(line: 96, column: 27, scope: !156)
!158 = !DILocation(line: 96, column: 13, scope: !78)
!159 = !DILocation(line: 98, column: 26, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !66, line: 97, column: 9)
!161 = !DILocation(line: 98, column: 13, scope: !160)
!162 = !DILocation(line: 99, column: 9, scope: !160)
!163 = !DILocation(line: 107, column: 5, scope: !65)
!164 = !DILabel(scope: !65, name: "sink", file: !66, line: 108)
!165 = !DILocation(line: 108, column: 1, scope: !65)
!166 = !DILocalVariable(name: "i", scope: !167, file: !66, line: 110, type: !71)
!167 = distinct !DILexicalBlock(scope: !65, file: !66, line: 109, column: 5)
!168 = !DILocation(line: 110, column: 13, scope: !167)
!169 = !DILocalVariable(name: "buffer", scope: !167, file: !66, line: 111, type: !170)
!170 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !171)
!171 = !{!172}
!172 = !DISubrange(count: 10)
!173 = !DILocation(line: 111, column: 13, scope: !167)
!174 = !DILocation(line: 114, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !167, file: !66, line: 114, column: 13)
!176 = !DILocation(line: 114, column: 18, scope: !175)
!177 = !DILocation(line: 114, column: 13, scope: !167)
!178 = !DILocation(line: 116, column: 20, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !66, line: 115, column: 9)
!180 = !DILocation(line: 116, column: 13, scope: !179)
!181 = !DILocation(line: 116, column: 26, scope: !179)
!182 = !DILocation(line: 118, column: 19, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !66, line: 118, column: 13)
!184 = !DILocation(line: 118, column: 17, scope: !183)
!185 = !DILocation(line: 118, column: 24, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !66, line: 118, column: 13)
!187 = !DILocation(line: 118, column: 26, scope: !186)
!188 = !DILocation(line: 118, column: 13, scope: !183)
!189 = !DILocation(line: 120, column: 37, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !66, line: 119, column: 13)
!191 = !DILocation(line: 120, column: 30, scope: !190)
!192 = !DILocation(line: 120, column: 17, scope: !190)
!193 = !DILocation(line: 121, column: 13, scope: !190)
!194 = !DILocation(line: 118, column: 33, scope: !186)
!195 = !DILocation(line: 118, column: 13, scope: !186)
!196 = distinct !{!196, !188, !197, !198}
!197 = !DILocation(line: 121, column: 13, scope: !183)
!198 = !{!"llvm.loop.mustprogress"}
!199 = !DILocation(line: 122, column: 9, scope: !179)
!200 = !DILocation(line: 125, column: 13, scope: !201)
!201 = distinct !DILexicalBlock(scope: !175, file: !66, line: 124, column: 9)
!202 = !DILocation(line: 128, column: 1, scope: !65)
!203 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_18_good", scope: !66, file: !66, line: 254, type: !67, scopeLine: 255, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!204 = !DILocation(line: 256, column: 5, scope: !203)
!205 = !DILocation(line: 257, column: 5, scope: !203)
!206 = !DILocation(line: 258, column: 1, scope: !203)
!207 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 269, type: !208, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!208 = !DISubroutineType(types: !209)
!209 = !{!71, !71, !210}
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!212 = !DILocalVariable(name: "argc", arg: 1, scope: !207, file: !66, line: 269, type: !71)
!213 = !DILocation(line: 269, column: 14, scope: !207)
!214 = !DILocalVariable(name: "argv", arg: 2, scope: !207, file: !66, line: 269, type: !210)
!215 = !DILocation(line: 269, column: 27, scope: !207)
!216 = !DILocation(line: 272, column: 22, scope: !207)
!217 = !DILocation(line: 272, column: 12, scope: !207)
!218 = !DILocation(line: 272, column: 5, scope: !207)
!219 = !DILocation(line: 274, column: 5, scope: !207)
!220 = !DILocation(line: 275, column: 5, scope: !207)
!221 = !DILocation(line: 276, column: 5, scope: !207)
!222 = !DILocation(line: 279, column: 5, scope: !207)
!223 = !DILocation(line: 280, column: 5, scope: !207)
!224 = !DILocation(line: 281, column: 5, scope: !207)
!225 = !DILocation(line: 283, column: 5, scope: !207)
!226 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 135, type: !67, scopeLine: 136, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!227 = !DILocalVariable(name: "data", scope: !226, file: !66, line: 137, type: !71)
!228 = !DILocation(line: 137, column: 9, scope: !226)
!229 = !DILocation(line: 139, column: 10, scope: !226)
!230 = !DILocation(line: 140, column: 5, scope: !226)
!231 = !DILabel(scope: !226, name: "source", file: !66, line: 141)
!232 = !DILocation(line: 141, column: 1, scope: !226)
!233 = !DILocalVariable(name: "recvResult", scope: !234, file: !66, line: 147, type: !71)
!234 = distinct !DILexicalBlock(scope: !226, file: !66, line: 142, column: 5)
!235 = !DILocation(line: 147, column: 13, scope: !234)
!236 = !DILocalVariable(name: "service", scope: !234, file: !66, line: 148, type: !81)
!237 = !DILocation(line: 148, column: 28, scope: !234)
!238 = !DILocalVariable(name: "connectSocket", scope: !234, file: !66, line: 149, type: !71)
!239 = !DILocation(line: 149, column: 16, scope: !234)
!240 = !DILocalVariable(name: "inputBuffer", scope: !234, file: !66, line: 150, type: !55)
!241 = !DILocation(line: 150, column: 14, scope: !234)
!242 = !DILocation(line: 151, column: 9, scope: !234)
!243 = !DILocation(line: 161, column: 29, scope: !244)
!244 = distinct !DILexicalBlock(scope: !234, file: !66, line: 152, column: 9)
!245 = !DILocation(line: 161, column: 27, scope: !244)
!246 = !DILocation(line: 162, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !66, line: 162, column: 17)
!248 = !DILocation(line: 162, column: 31, scope: !247)
!249 = !DILocation(line: 162, column: 17, scope: !244)
!250 = !DILocation(line: 164, column: 17, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !66, line: 163, column: 13)
!252 = !DILocation(line: 166, column: 13, scope: !244)
!253 = !DILocation(line: 167, column: 21, scope: !244)
!254 = !DILocation(line: 167, column: 32, scope: !244)
!255 = !DILocation(line: 168, column: 39, scope: !244)
!256 = !DILocation(line: 168, column: 21, scope: !244)
!257 = !DILocation(line: 168, column: 30, scope: !244)
!258 = !DILocation(line: 168, column: 37, scope: !244)
!259 = !DILocation(line: 169, column: 32, scope: !244)
!260 = !DILocation(line: 169, column: 21, scope: !244)
!261 = !DILocation(line: 169, column: 30, scope: !244)
!262 = !DILocation(line: 170, column: 25, scope: !263)
!263 = distinct !DILexicalBlock(scope: !244, file: !66, line: 170, column: 17)
!264 = !DILocation(line: 170, column: 40, scope: !263)
!265 = !DILocation(line: 170, column: 17, scope: !263)
!266 = !DILocation(line: 170, column: 85, scope: !263)
!267 = !DILocation(line: 170, column: 17, scope: !244)
!268 = !DILocation(line: 172, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !263, file: !66, line: 171, column: 13)
!270 = !DILocation(line: 176, column: 31, scope: !244)
!271 = !DILocation(line: 176, column: 46, scope: !244)
!272 = !DILocation(line: 176, column: 26, scope: !244)
!273 = !DILocation(line: 176, column: 24, scope: !244)
!274 = !DILocation(line: 177, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !244, file: !66, line: 177, column: 17)
!276 = !DILocation(line: 177, column: 28, scope: !275)
!277 = !DILocation(line: 177, column: 44, scope: !275)
!278 = !DILocation(line: 177, column: 47, scope: !275)
!279 = !DILocation(line: 177, column: 58, scope: !275)
!280 = !DILocation(line: 177, column: 17, scope: !244)
!281 = !DILocation(line: 179, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !275, file: !66, line: 178, column: 13)
!283 = !DILocation(line: 182, column: 25, scope: !244)
!284 = !DILocation(line: 182, column: 13, scope: !244)
!285 = !DILocation(line: 182, column: 37, scope: !244)
!286 = !DILocation(line: 184, column: 25, scope: !244)
!287 = !DILocation(line: 184, column: 20, scope: !244)
!288 = !DILocation(line: 184, column: 18, scope: !244)
!289 = !DILocation(line: 185, column: 9, scope: !244)
!290 = !DILocation(line: 187, column: 13, scope: !291)
!291 = distinct !DILexicalBlock(scope: !234, file: !66, line: 187, column: 13)
!292 = !DILocation(line: 187, column: 27, scope: !291)
!293 = !DILocation(line: 187, column: 13, scope: !234)
!294 = !DILocation(line: 189, column: 26, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !66, line: 188, column: 9)
!296 = !DILocation(line: 189, column: 13, scope: !295)
!297 = !DILocation(line: 190, column: 9, scope: !295)
!298 = !DILocation(line: 198, column: 5, scope: !226)
!299 = !DILabel(scope: !226, name: "sink", file: !66, line: 199)
!300 = !DILocation(line: 199, column: 1, scope: !226)
!301 = !DILocalVariable(name: "i", scope: !302, file: !66, line: 201, type: !71)
!302 = distinct !DILexicalBlock(scope: !226, file: !66, line: 200, column: 5)
!303 = !DILocation(line: 201, column: 13, scope: !302)
!304 = !DILocalVariable(name: "buffer", scope: !302, file: !66, line: 202, type: !170)
!305 = !DILocation(line: 202, column: 13, scope: !302)
!306 = !DILocation(line: 204, column: 13, scope: !307)
!307 = distinct !DILexicalBlock(scope: !302, file: !66, line: 204, column: 13)
!308 = !DILocation(line: 204, column: 18, scope: !307)
!309 = !DILocation(line: 204, column: 23, scope: !307)
!310 = !DILocation(line: 204, column: 26, scope: !307)
!311 = !DILocation(line: 204, column: 31, scope: !307)
!312 = !DILocation(line: 204, column: 13, scope: !302)
!313 = !DILocation(line: 206, column: 20, scope: !314)
!314 = distinct !DILexicalBlock(scope: !307, file: !66, line: 205, column: 9)
!315 = !DILocation(line: 206, column: 13, scope: !314)
!316 = !DILocation(line: 206, column: 26, scope: !314)
!317 = !DILocation(line: 208, column: 19, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !66, line: 208, column: 13)
!319 = !DILocation(line: 208, column: 17, scope: !318)
!320 = !DILocation(line: 208, column: 24, scope: !321)
!321 = distinct !DILexicalBlock(scope: !318, file: !66, line: 208, column: 13)
!322 = !DILocation(line: 208, column: 26, scope: !321)
!323 = !DILocation(line: 208, column: 13, scope: !318)
!324 = !DILocation(line: 210, column: 37, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !66, line: 209, column: 13)
!326 = !DILocation(line: 210, column: 30, scope: !325)
!327 = !DILocation(line: 210, column: 17, scope: !325)
!328 = !DILocation(line: 211, column: 13, scope: !325)
!329 = !DILocation(line: 208, column: 33, scope: !321)
!330 = !DILocation(line: 208, column: 13, scope: !321)
!331 = distinct !{!331, !323, !332, !198}
!332 = !DILocation(line: 211, column: 13, scope: !318)
!333 = !DILocation(line: 212, column: 9, scope: !314)
!334 = !DILocation(line: 215, column: 13, scope: !335)
!335 = distinct !DILexicalBlock(scope: !307, file: !66, line: 214, column: 9)
!336 = !DILocation(line: 218, column: 1, scope: !226)
!337 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 221, type: !67, scopeLine: 222, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!338 = !DILocalVariable(name: "data", scope: !337, file: !66, line: 223, type: !71)
!339 = !DILocation(line: 223, column: 9, scope: !337)
!340 = !DILocation(line: 225, column: 10, scope: !337)
!341 = !DILocation(line: 226, column: 5, scope: !337)
!342 = !DILabel(scope: !337, name: "source", file: !66, line: 227)
!343 = !DILocation(line: 227, column: 1, scope: !337)
!344 = !DILocation(line: 230, column: 10, scope: !337)
!345 = !DILocation(line: 231, column: 5, scope: !337)
!346 = !DILabel(scope: !337, name: "sink", file: !66, line: 232)
!347 = !DILocation(line: 232, column: 1, scope: !337)
!348 = !DILocalVariable(name: "i", scope: !349, file: !66, line: 234, type: !71)
!349 = distinct !DILexicalBlock(scope: !337, file: !66, line: 233, column: 5)
!350 = !DILocation(line: 234, column: 13, scope: !349)
!351 = !DILocalVariable(name: "buffer", scope: !349, file: !66, line: 235, type: !170)
!352 = !DILocation(line: 235, column: 13, scope: !349)
!353 = !DILocation(line: 238, column: 13, scope: !354)
!354 = distinct !DILexicalBlock(scope: !349, file: !66, line: 238, column: 13)
!355 = !DILocation(line: 238, column: 18, scope: !354)
!356 = !DILocation(line: 238, column: 13, scope: !349)
!357 = !DILocation(line: 240, column: 20, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !66, line: 239, column: 9)
!359 = !DILocation(line: 240, column: 13, scope: !358)
!360 = !DILocation(line: 240, column: 26, scope: !358)
!361 = !DILocation(line: 242, column: 19, scope: !362)
!362 = distinct !DILexicalBlock(scope: !358, file: !66, line: 242, column: 13)
!363 = !DILocation(line: 242, column: 17, scope: !362)
!364 = !DILocation(line: 242, column: 24, scope: !365)
!365 = distinct !DILexicalBlock(scope: !362, file: !66, line: 242, column: 13)
!366 = !DILocation(line: 242, column: 26, scope: !365)
!367 = !DILocation(line: 242, column: 13, scope: !362)
!368 = !DILocation(line: 244, column: 37, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !66, line: 243, column: 13)
!370 = !DILocation(line: 244, column: 30, scope: !369)
!371 = !DILocation(line: 244, column: 17, scope: !369)
!372 = !DILocation(line: 245, column: 13, scope: !369)
!373 = !DILocation(line: 242, column: 33, scope: !365)
!374 = !DILocation(line: 242, column: 13, scope: !365)
!375 = distinct !{!375, !367, !376, !198}
!376 = !DILocation(line: 245, column: 13, scope: !362)
!377 = !DILocation(line: 246, column: 9, scope: !358)
!378 = !DILocation(line: 249, column: 13, scope: !379)
!379 = distinct !DILexicalBlock(scope: !354, file: !66, line: 248, column: 9)
!380 = !DILocation(line: 252, column: 1, scope: !337)
