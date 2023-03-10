; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_15.c"
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_15_bad() #0 !dbg !65 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !74, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !77, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %connectSocket, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  br label %do.body, !dbg !104

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !105
  store i32 %call, i32* %connectSocket, align 4, !dbg !107
  %0 = load i32, i32* %connectSocket, align 4, !dbg !108
  %cmp = icmp eq i32 %0, -1, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !112

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !114
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !115
  store i16 2, i16* %sin_family, align 4, !dbg !116
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !117
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !118
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !119
  store i32 %call1, i32* %s_addr, align 4, !dbg !120
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !121
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !122
  store i16 %call2, i16* %sin_port, align 2, !dbg !123
  %2 = load i32, i32* %connectSocket, align 4, !dbg !124
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !126
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !127
  %cmp4 = icmp eq i32 %call3, -1, !dbg !128
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !129

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !130

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !132
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !133
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !134
  %conv = trunc i64 %call7 to i32, !dbg !134
  store i32 %conv, i32* %recvResult, align 4, !dbg !135
  %5 = load i32, i32* %recvResult, align 4, !dbg !136
  %cmp8 = icmp eq i32 %5, -1, !dbg !138
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !139

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !140
  %cmp10 = icmp eq i32 %6, 0, !dbg !141
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !142

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !143

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !145
  %idxprom = sext i32 %7 to i64, !dbg !146
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !148
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !149
  store i32 %call15, i32* %data, align 4, !dbg !150
  br label %do.end, !dbg !151

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !152
  %cmp16 = icmp ne i32 %8, -1, !dbg !154
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !155

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !156
  %call19 = call i32 @close(i32 %9), !dbg !158
  br label %if.end20, !dbg !159

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !160, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !163, metadata !DIExpression()), !dbg !167
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !167
  %11 = load i32, i32* %data, align 4, !dbg !168
  %cmp21 = icmp slt i32 %11, 10, !dbg !170
  br i1 %cmp21, label %if.then23, label %if.else, !dbg !171

if.then23:                                        ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !172
  %idxprom24 = sext i32 %12 to i64, !dbg !174
  %arrayidx25 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom24, !dbg !174
  store i32 1, i32* %arrayidx25, align 4, !dbg !175
  store i32 0, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %if.then23
  %13 = load i32, i32* %i, align 4, !dbg !179
  %cmp26 = icmp slt i32 %13, 10, !dbg !181
  br i1 %cmp26, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %14 = load i32, i32* %i, align 4, !dbg !183
  %idxprom28 = sext i32 %14 to i64, !dbg !185
  %arrayidx29 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom28, !dbg !185
  %15 = load i32, i32* %arrayidx29, align 4, !dbg !185
  call void @printIntLine(i32 %15), !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !188
  %inc = add nsw i32 %16, 1, !dbg !188
  store i32 %inc, i32* %i, align 4, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  br label %if.end30, !dbg !193

if.else:                                          ; preds = %if.end20
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !194
  br label %if.end30

if.end30:                                         ; preds = %if.else, %for.end
  ret void, !dbg !196
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_15_good() #0 !dbg !197 {
entry:
  call void @goodB2G1(), !dbg !198
  call void @goodB2G2(), !dbg !199
  call void @goodG2B1(), !dbg !200
  call void @goodG2B2(), !dbg !201
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !203 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !208, metadata !DIExpression()), !dbg !209
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !210, metadata !DIExpression()), !dbg !211
  %call = call i64 @time(i64* null) #7, !dbg !212
  %conv = trunc i64 %call to i32, !dbg !213
  call void @srand(i32 %conv) #7, !dbg !214
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !215
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_15_good(), !dbg !216
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !217
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !218
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_15_bad(), !dbg !219
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !220
  ret i32 0, !dbg !221
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !222 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !223, metadata !DIExpression()), !dbg !224
  store i32 -1, i32* %data, align 4, !dbg !225
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !226, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !229, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !231, metadata !DIExpression()), !dbg !232
  store i32 -1, i32* %connectSocket, align 4, !dbg !232
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !233, metadata !DIExpression()), !dbg !234
  br label %do.body, !dbg !235

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !236
  store i32 %call, i32* %connectSocket, align 4, !dbg !238
  %0 = load i32, i32* %connectSocket, align 4, !dbg !239
  %cmp = icmp eq i32 %0, -1, !dbg !241
  br i1 %cmp, label %if.then, label %if.end, !dbg !242

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !243

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !245
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !246
  store i16 2, i16* %sin_family, align 4, !dbg !247
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !248
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !249
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !250
  store i32 %call1, i32* %s_addr, align 4, !dbg !251
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !252
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !253
  store i16 %call2, i16* %sin_port, align 2, !dbg !254
  %2 = load i32, i32* %connectSocket, align 4, !dbg !255
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !257
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !258
  %cmp4 = icmp eq i32 %call3, -1, !dbg !259
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !260

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !261

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !263
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !264
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !265
  %conv = trunc i64 %call7 to i32, !dbg !265
  store i32 %conv, i32* %recvResult, align 4, !dbg !266
  %5 = load i32, i32* %recvResult, align 4, !dbg !267
  %cmp8 = icmp eq i32 %5, -1, !dbg !269
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !270

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !271
  %cmp10 = icmp eq i32 %6, 0, !dbg !272
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !273

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !274

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !276
  %idxprom = sext i32 %7 to i64, !dbg !277
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !277
  store i8 0, i8* %arrayidx, align 1, !dbg !278
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !279
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !280
  store i32 %call15, i32* %data, align 4, !dbg !281
  br label %do.end, !dbg !282

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !283
  %cmp16 = icmp ne i32 %8, -1, !dbg !285
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !286

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !287
  %call19 = call i32 @close(i32 %9), !dbg !289
  br label %if.end20, !dbg !290

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !291, metadata !DIExpression()), !dbg !293
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !294, metadata !DIExpression()), !dbg !295
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !295
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !295
  %11 = load i32, i32* %data, align 4, !dbg !296
  %cmp21 = icmp sge i32 %11, 0, !dbg !298
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !299

land.lhs.true:                                    ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !300
  %cmp23 = icmp slt i32 %12, 10, !dbg !301
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !302

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !303
  %idxprom26 = sext i32 %13 to i64, !dbg !305
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !305
  store i32 1, i32* %arrayidx27, align 4, !dbg !306
  store i32 0, i32* %i, align 4, !dbg !307
  br label %for.cond, !dbg !309

for.cond:                                         ; preds = %for.inc, %if.then25
  %14 = load i32, i32* %i, align 4, !dbg !310
  %cmp28 = icmp slt i32 %14, 10, !dbg !312
  br i1 %cmp28, label %for.body, label %for.end, !dbg !313

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !314
  %idxprom30 = sext i32 %15 to i64, !dbg !316
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !316
  %16 = load i32, i32* %arrayidx31, align 4, !dbg !316
  call void @printIntLine(i32 %16), !dbg !317
  br label %for.inc, !dbg !318

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !319
  %inc = add nsw i32 %17, 1, !dbg !319
  store i32 %inc, i32* %i, align 4, !dbg !319
  br label %for.cond, !dbg !320, !llvm.loop !321

for.end:                                          ; preds = %for.cond
  br label %if.end32, !dbg !323

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !324
  br label %if.end32

if.end32:                                         ; preds = %if.else, %for.end
  ret void, !dbg !326
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !327 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !328, metadata !DIExpression()), !dbg !329
  store i32 -1, i32* %data, align 4, !dbg !330
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !331, metadata !DIExpression()), !dbg !333
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !334, metadata !DIExpression()), !dbg !335
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !336, metadata !DIExpression()), !dbg !337
  store i32 -1, i32* %connectSocket, align 4, !dbg !337
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !338, metadata !DIExpression()), !dbg !339
  br label %do.body, !dbg !340

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !341
  store i32 %call, i32* %connectSocket, align 4, !dbg !343
  %0 = load i32, i32* %connectSocket, align 4, !dbg !344
  %cmp = icmp eq i32 %0, -1, !dbg !346
  br i1 %cmp, label %if.then, label %if.end, !dbg !347

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !348

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !350
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !350
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !351
  store i16 2, i16* %sin_family, align 4, !dbg !352
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !353
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !354
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !355
  store i32 %call1, i32* %s_addr, align 4, !dbg !356
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !357
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !358
  store i16 %call2, i16* %sin_port, align 2, !dbg !359
  %2 = load i32, i32* %connectSocket, align 4, !dbg !360
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !362
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !363
  %cmp4 = icmp eq i32 %call3, -1, !dbg !364
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !365

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !366

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !368
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !369
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !370
  %conv = trunc i64 %call7 to i32, !dbg !370
  store i32 %conv, i32* %recvResult, align 4, !dbg !371
  %5 = load i32, i32* %recvResult, align 4, !dbg !372
  %cmp8 = icmp eq i32 %5, -1, !dbg !374
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !375

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !376
  %cmp10 = icmp eq i32 %6, 0, !dbg !377
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !378

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !379

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !381
  %idxprom = sext i32 %7 to i64, !dbg !382
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !382
  store i8 0, i8* %arrayidx, align 1, !dbg !383
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !384
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !385
  store i32 %call15, i32* %data, align 4, !dbg !386
  br label %do.end, !dbg !387

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !388
  %cmp16 = icmp ne i32 %8, -1, !dbg !390
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !391

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !392
  %call19 = call i32 @close(i32 %9), !dbg !394
  br label %if.end20, !dbg !395

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !396, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !399, metadata !DIExpression()), !dbg !400
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !400
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !400
  %11 = load i32, i32* %data, align 4, !dbg !401
  %cmp21 = icmp sge i32 %11, 0, !dbg !403
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !404

land.lhs.true:                                    ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !405
  %cmp23 = icmp slt i32 %12, 10, !dbg !406
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !407

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !408
  %idxprom26 = sext i32 %13 to i64, !dbg !410
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !410
  store i32 1, i32* %arrayidx27, align 4, !dbg !411
  store i32 0, i32* %i, align 4, !dbg !412
  br label %for.cond, !dbg !414

for.cond:                                         ; preds = %for.inc, %if.then25
  %14 = load i32, i32* %i, align 4, !dbg !415
  %cmp28 = icmp slt i32 %14, 10, !dbg !417
  br i1 %cmp28, label %for.body, label %for.end, !dbg !418

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !419
  %idxprom30 = sext i32 %15 to i64, !dbg !421
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !421
  %16 = load i32, i32* %arrayidx31, align 4, !dbg !421
  call void @printIntLine(i32 %16), !dbg !422
  br label %for.inc, !dbg !423

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !424
  %inc = add nsw i32 %17, 1, !dbg !424
  store i32 %inc, i32* %i, align 4, !dbg !424
  br label %for.cond, !dbg !425, !llvm.loop !426

for.end:                                          ; preds = %for.cond
  br label %if.end32, !dbg !428

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !429
  br label %if.end32

if.end32:                                         ; preds = %if.else, %for.end
  ret void, !dbg !431
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !432 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !433, metadata !DIExpression()), !dbg !434
  store i32 -1, i32* %data, align 4, !dbg !435
  store i32 7, i32* %data, align 4, !dbg !436
  call void @llvm.dbg.declare(metadata i32* %i, metadata !437, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !440, metadata !DIExpression()), !dbg !441
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !441
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !441
  %1 = load i32, i32* %data, align 4, !dbg !442
  %cmp = icmp slt i32 %1, 10, !dbg !444
  br i1 %cmp, label %if.then, label %if.else, !dbg !445

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !446
  %idxprom = sext i32 %2 to i64, !dbg !448
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !448
  store i32 1, i32* %arrayidx, align 4, !dbg !449
  store i32 0, i32* %i, align 4, !dbg !450
  br label %for.cond, !dbg !452

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !453
  %cmp1 = icmp slt i32 %3, 10, !dbg !455
  br i1 %cmp1, label %for.body, label %for.end, !dbg !456

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !457
  %idxprom2 = sext i32 %4 to i64, !dbg !459
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !459
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !459
  call void @printIntLine(i32 %5), !dbg !460
  br label %for.inc, !dbg !461

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !462
  %inc = add nsw i32 %6, 1, !dbg !462
  store i32 %inc, i32* %i, align 4, !dbg !462
  br label %for.cond, !dbg !463, !llvm.loop !464

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !466

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !467
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !469
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !470 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !471, metadata !DIExpression()), !dbg !472
  store i32 -1, i32* %data, align 4, !dbg !473
  store i32 7, i32* %data, align 4, !dbg !474
  call void @llvm.dbg.declare(metadata i32* %i, metadata !475, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !478, metadata !DIExpression()), !dbg !479
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !479
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !479
  %1 = load i32, i32* %data, align 4, !dbg !480
  %cmp = icmp slt i32 %1, 10, !dbg !482
  br i1 %cmp, label %if.then, label %if.else, !dbg !483

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !484
  %idxprom = sext i32 %2 to i64, !dbg !486
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !486
  store i32 1, i32* %arrayidx, align 4, !dbg !487
  store i32 0, i32* %i, align 4, !dbg !488
  br label %for.cond, !dbg !490

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !491
  %cmp1 = icmp slt i32 %3, 10, !dbg !493
  br i1 %cmp1, label %for.body, label %for.end, !dbg !494

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !495
  %idxprom2 = sext i32 %4 to i64, !dbg !497
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !497
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !497
  call void @printIntLine(i32 %5), !dbg !498
  br label %for.inc, !dbg !499

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !500
  %inc = add nsw i32 %6, 1, !dbg !500
  store i32 %inc, i32* %i, align 4, !dbg !500
  br label %for.cond, !dbg !501, !llvm.loop !502

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !504

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !505
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !507
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_15_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_15.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocalVariable(name: "recvResult", scope: !75, file: !66, line: 57, type: !71)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 52, column: 5)
!76 = !DILocation(line: 57, column: 13, scope: !75)
!77 = !DILocalVariable(name: "service", scope: !75, file: !66, line: 58, type: !78)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !79)
!79 = !{!80, !81, !87, !94}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !78, file: !17, line: 240, baseType: !51, size: 16)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !78, file: !17, line: 241, baseType: !82, size: 16, offset: 16)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !84, line: 25, baseType: !85)
!84 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !86, line: 40, baseType: !53)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !78, file: !17, line: 242, baseType: !88, size: 32, offset: 32)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !89)
!89 = !{!90}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !88, file: !17, line: 33, baseType: !91, size: 32)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !84, line: 26, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !86, line: 42, baseType: !5)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !78, file: !17, line: 245, baseType: !95, size: 64, offset: 64)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 64, elements: !97)
!96 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!97 = !{!98}
!98 = !DISubrange(count: 8)
!99 = !DILocation(line: 58, column: 28, scope: !75)
!100 = !DILocalVariable(name: "connectSocket", scope: !75, file: !66, line: 59, type: !71)
!101 = !DILocation(line: 59, column: 16, scope: !75)
!102 = !DILocalVariable(name: "inputBuffer", scope: !75, file: !66, line: 60, type: !55)
!103 = !DILocation(line: 60, column: 14, scope: !75)
!104 = !DILocation(line: 61, column: 9, scope: !75)
!105 = !DILocation(line: 71, column: 29, scope: !106)
!106 = distinct !DILexicalBlock(scope: !75, file: !66, line: 62, column: 9)
!107 = !DILocation(line: 71, column: 27, scope: !106)
!108 = !DILocation(line: 72, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !66, line: 72, column: 17)
!110 = !DILocation(line: 72, column: 31, scope: !109)
!111 = !DILocation(line: 72, column: 17, scope: !106)
!112 = !DILocation(line: 74, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !66, line: 73, column: 13)
!114 = !DILocation(line: 76, column: 13, scope: !106)
!115 = !DILocation(line: 77, column: 21, scope: !106)
!116 = !DILocation(line: 77, column: 32, scope: !106)
!117 = !DILocation(line: 78, column: 39, scope: !106)
!118 = !DILocation(line: 78, column: 21, scope: !106)
!119 = !DILocation(line: 78, column: 30, scope: !106)
!120 = !DILocation(line: 78, column: 37, scope: !106)
!121 = !DILocation(line: 79, column: 32, scope: !106)
!122 = !DILocation(line: 79, column: 21, scope: !106)
!123 = !DILocation(line: 79, column: 30, scope: !106)
!124 = !DILocation(line: 80, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !106, file: !66, line: 80, column: 17)
!126 = !DILocation(line: 80, column: 40, scope: !125)
!127 = !DILocation(line: 80, column: 17, scope: !125)
!128 = !DILocation(line: 80, column: 85, scope: !125)
!129 = !DILocation(line: 80, column: 17, scope: !106)
!130 = !DILocation(line: 82, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !66, line: 81, column: 13)
!132 = !DILocation(line: 86, column: 31, scope: !106)
!133 = !DILocation(line: 86, column: 46, scope: !106)
!134 = !DILocation(line: 86, column: 26, scope: !106)
!135 = !DILocation(line: 86, column: 24, scope: !106)
!136 = !DILocation(line: 87, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !106, file: !66, line: 87, column: 17)
!138 = !DILocation(line: 87, column: 28, scope: !137)
!139 = !DILocation(line: 87, column: 44, scope: !137)
!140 = !DILocation(line: 87, column: 47, scope: !137)
!141 = !DILocation(line: 87, column: 58, scope: !137)
!142 = !DILocation(line: 87, column: 17, scope: !106)
!143 = !DILocation(line: 89, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !66, line: 88, column: 13)
!145 = !DILocation(line: 92, column: 25, scope: !106)
!146 = !DILocation(line: 92, column: 13, scope: !106)
!147 = !DILocation(line: 92, column: 37, scope: !106)
!148 = !DILocation(line: 94, column: 25, scope: !106)
!149 = !DILocation(line: 94, column: 20, scope: !106)
!150 = !DILocation(line: 94, column: 18, scope: !106)
!151 = !DILocation(line: 95, column: 9, scope: !106)
!152 = !DILocation(line: 97, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !75, file: !66, line: 97, column: 13)
!154 = !DILocation(line: 97, column: 27, scope: !153)
!155 = !DILocation(line: 97, column: 13, scope: !75)
!156 = !DILocation(line: 99, column: 26, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !66, line: 98, column: 9)
!158 = !DILocation(line: 99, column: 13, scope: !157)
!159 = !DILocation(line: 100, column: 9, scope: !157)
!160 = !DILocalVariable(name: "i", scope: !161, file: !66, line: 118, type: !71)
!161 = distinct !DILexicalBlock(scope: !65, file: !66, line: 117, column: 5)
!162 = !DILocation(line: 118, column: 13, scope: !161)
!163 = !DILocalVariable(name: "buffer", scope: !161, file: !66, line: 119, type: !164)
!164 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !165)
!165 = !{!166}
!166 = !DISubrange(count: 10)
!167 = !DILocation(line: 119, column: 13, scope: !161)
!168 = !DILocation(line: 122, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !161, file: !66, line: 122, column: 13)
!170 = !DILocation(line: 122, column: 18, scope: !169)
!171 = !DILocation(line: 122, column: 13, scope: !161)
!172 = !DILocation(line: 124, column: 20, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !66, line: 123, column: 9)
!174 = !DILocation(line: 124, column: 13, scope: !173)
!175 = !DILocation(line: 124, column: 26, scope: !173)
!176 = !DILocation(line: 126, column: 19, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !66, line: 126, column: 13)
!178 = !DILocation(line: 126, column: 17, scope: !177)
!179 = !DILocation(line: 126, column: 24, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !66, line: 126, column: 13)
!181 = !DILocation(line: 126, column: 26, scope: !180)
!182 = !DILocation(line: 126, column: 13, scope: !177)
!183 = !DILocation(line: 128, column: 37, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !66, line: 127, column: 13)
!185 = !DILocation(line: 128, column: 30, scope: !184)
!186 = !DILocation(line: 128, column: 17, scope: !184)
!187 = !DILocation(line: 129, column: 13, scope: !184)
!188 = !DILocation(line: 126, column: 33, scope: !180)
!189 = !DILocation(line: 126, column: 13, scope: !180)
!190 = distinct !{!190, !182, !191, !192}
!191 = !DILocation(line: 129, column: 13, scope: !177)
!192 = !{!"llvm.loop.mustprogress"}
!193 = !DILocation(line: 130, column: 9, scope: !173)
!194 = !DILocation(line: 133, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !169, file: !66, line: 132, column: 9)
!196 = !DILocation(line: 142, column: 1, scope: !65)
!197 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_15_good", scope: !66, file: !66, line: 444, type: !67, scopeLine: 445, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!198 = !DILocation(line: 446, column: 5, scope: !197)
!199 = !DILocation(line: 447, column: 5, scope: !197)
!200 = !DILocation(line: 448, column: 5, scope: !197)
!201 = !DILocation(line: 449, column: 5, scope: !197)
!202 = !DILocation(line: 450, column: 1, scope: !197)
!203 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 461, type: !204, scopeLine: 462, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!204 = !DISubroutineType(types: !205)
!205 = !{!71, !71, !206}
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !207, size: 64)
!207 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!208 = !DILocalVariable(name: "argc", arg: 1, scope: !203, file: !66, line: 461, type: !71)
!209 = !DILocation(line: 461, column: 14, scope: !203)
!210 = !DILocalVariable(name: "argv", arg: 2, scope: !203, file: !66, line: 461, type: !206)
!211 = !DILocation(line: 461, column: 27, scope: !203)
!212 = !DILocation(line: 464, column: 22, scope: !203)
!213 = !DILocation(line: 464, column: 12, scope: !203)
!214 = !DILocation(line: 464, column: 5, scope: !203)
!215 = !DILocation(line: 466, column: 5, scope: !203)
!216 = !DILocation(line: 467, column: 5, scope: !203)
!217 = !DILocation(line: 468, column: 5, scope: !203)
!218 = !DILocation(line: 471, column: 5, scope: !203)
!219 = !DILocation(line: 472, column: 5, scope: !203)
!220 = !DILocation(line: 473, column: 5, scope: !203)
!221 = !DILocation(line: 475, column: 5, scope: !203)
!222 = distinct !DISubprogram(name: "goodB2G1", scope: !66, file: !66, line: 149, type: !67, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!223 = !DILocalVariable(name: "data", scope: !222, file: !66, line: 151, type: !71)
!224 = !DILocation(line: 151, column: 9, scope: !222)
!225 = !DILocation(line: 153, column: 10, scope: !222)
!226 = !DILocalVariable(name: "recvResult", scope: !227, file: !66, line: 162, type: !71)
!227 = distinct !DILexicalBlock(scope: !222, file: !66, line: 157, column: 5)
!228 = !DILocation(line: 162, column: 13, scope: !227)
!229 = !DILocalVariable(name: "service", scope: !227, file: !66, line: 163, type: !78)
!230 = !DILocation(line: 163, column: 28, scope: !227)
!231 = !DILocalVariable(name: "connectSocket", scope: !227, file: !66, line: 164, type: !71)
!232 = !DILocation(line: 164, column: 16, scope: !227)
!233 = !DILocalVariable(name: "inputBuffer", scope: !227, file: !66, line: 165, type: !55)
!234 = !DILocation(line: 165, column: 14, scope: !227)
!235 = !DILocation(line: 166, column: 9, scope: !227)
!236 = !DILocation(line: 176, column: 29, scope: !237)
!237 = distinct !DILexicalBlock(scope: !227, file: !66, line: 167, column: 9)
!238 = !DILocation(line: 176, column: 27, scope: !237)
!239 = !DILocation(line: 177, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !66, line: 177, column: 17)
!241 = !DILocation(line: 177, column: 31, scope: !240)
!242 = !DILocation(line: 177, column: 17, scope: !237)
!243 = !DILocation(line: 179, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !66, line: 178, column: 13)
!245 = !DILocation(line: 181, column: 13, scope: !237)
!246 = !DILocation(line: 182, column: 21, scope: !237)
!247 = !DILocation(line: 182, column: 32, scope: !237)
!248 = !DILocation(line: 183, column: 39, scope: !237)
!249 = !DILocation(line: 183, column: 21, scope: !237)
!250 = !DILocation(line: 183, column: 30, scope: !237)
!251 = !DILocation(line: 183, column: 37, scope: !237)
!252 = !DILocation(line: 184, column: 32, scope: !237)
!253 = !DILocation(line: 184, column: 21, scope: !237)
!254 = !DILocation(line: 184, column: 30, scope: !237)
!255 = !DILocation(line: 185, column: 25, scope: !256)
!256 = distinct !DILexicalBlock(scope: !237, file: !66, line: 185, column: 17)
!257 = !DILocation(line: 185, column: 40, scope: !256)
!258 = !DILocation(line: 185, column: 17, scope: !256)
!259 = !DILocation(line: 185, column: 85, scope: !256)
!260 = !DILocation(line: 185, column: 17, scope: !237)
!261 = !DILocation(line: 187, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !256, file: !66, line: 186, column: 13)
!263 = !DILocation(line: 191, column: 31, scope: !237)
!264 = !DILocation(line: 191, column: 46, scope: !237)
!265 = !DILocation(line: 191, column: 26, scope: !237)
!266 = !DILocation(line: 191, column: 24, scope: !237)
!267 = !DILocation(line: 192, column: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !237, file: !66, line: 192, column: 17)
!269 = !DILocation(line: 192, column: 28, scope: !268)
!270 = !DILocation(line: 192, column: 44, scope: !268)
!271 = !DILocation(line: 192, column: 47, scope: !268)
!272 = !DILocation(line: 192, column: 58, scope: !268)
!273 = !DILocation(line: 192, column: 17, scope: !237)
!274 = !DILocation(line: 194, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !268, file: !66, line: 193, column: 13)
!276 = !DILocation(line: 197, column: 25, scope: !237)
!277 = !DILocation(line: 197, column: 13, scope: !237)
!278 = !DILocation(line: 197, column: 37, scope: !237)
!279 = !DILocation(line: 199, column: 25, scope: !237)
!280 = !DILocation(line: 199, column: 20, scope: !237)
!281 = !DILocation(line: 199, column: 18, scope: !237)
!282 = !DILocation(line: 200, column: 9, scope: !237)
!283 = !DILocation(line: 202, column: 13, scope: !284)
!284 = distinct !DILexicalBlock(scope: !227, file: !66, line: 202, column: 13)
!285 = !DILocation(line: 202, column: 27, scope: !284)
!286 = !DILocation(line: 202, column: 13, scope: !227)
!287 = !DILocation(line: 204, column: 26, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !66, line: 203, column: 9)
!289 = !DILocation(line: 204, column: 13, scope: !288)
!290 = !DILocation(line: 205, column: 9, scope: !288)
!291 = !DILocalVariable(name: "i", scope: !292, file: !66, line: 227, type: !71)
!292 = distinct !DILexicalBlock(scope: !222, file: !66, line: 226, column: 5)
!293 = !DILocation(line: 227, column: 13, scope: !292)
!294 = !DILocalVariable(name: "buffer", scope: !292, file: !66, line: 228, type: !164)
!295 = !DILocation(line: 228, column: 13, scope: !292)
!296 = !DILocation(line: 230, column: 13, scope: !297)
!297 = distinct !DILexicalBlock(scope: !292, file: !66, line: 230, column: 13)
!298 = !DILocation(line: 230, column: 18, scope: !297)
!299 = !DILocation(line: 230, column: 23, scope: !297)
!300 = !DILocation(line: 230, column: 26, scope: !297)
!301 = !DILocation(line: 230, column: 31, scope: !297)
!302 = !DILocation(line: 230, column: 13, scope: !292)
!303 = !DILocation(line: 232, column: 20, scope: !304)
!304 = distinct !DILexicalBlock(scope: !297, file: !66, line: 231, column: 9)
!305 = !DILocation(line: 232, column: 13, scope: !304)
!306 = !DILocation(line: 232, column: 26, scope: !304)
!307 = !DILocation(line: 234, column: 19, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !66, line: 234, column: 13)
!309 = !DILocation(line: 234, column: 17, scope: !308)
!310 = !DILocation(line: 234, column: 24, scope: !311)
!311 = distinct !DILexicalBlock(scope: !308, file: !66, line: 234, column: 13)
!312 = !DILocation(line: 234, column: 26, scope: !311)
!313 = !DILocation(line: 234, column: 13, scope: !308)
!314 = !DILocation(line: 236, column: 37, scope: !315)
!315 = distinct !DILexicalBlock(scope: !311, file: !66, line: 235, column: 13)
!316 = !DILocation(line: 236, column: 30, scope: !315)
!317 = !DILocation(line: 236, column: 17, scope: !315)
!318 = !DILocation(line: 237, column: 13, scope: !315)
!319 = !DILocation(line: 234, column: 33, scope: !311)
!320 = !DILocation(line: 234, column: 13, scope: !311)
!321 = distinct !{!321, !313, !322, !192}
!322 = !DILocation(line: 237, column: 13, scope: !308)
!323 = !DILocation(line: 238, column: 9, scope: !304)
!324 = !DILocation(line: 241, column: 13, scope: !325)
!325 = distinct !DILexicalBlock(scope: !297, file: !66, line: 240, column: 9)
!326 = !DILocation(line: 246, column: 1, scope: !222)
!327 = distinct !DISubprogram(name: "goodB2G2", scope: !66, file: !66, line: 249, type: !67, scopeLine: 250, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!328 = !DILocalVariable(name: "data", scope: !327, file: !66, line: 251, type: !71)
!329 = !DILocation(line: 251, column: 9, scope: !327)
!330 = !DILocation(line: 253, column: 10, scope: !327)
!331 = !DILocalVariable(name: "recvResult", scope: !332, file: !66, line: 262, type: !71)
!332 = distinct !DILexicalBlock(scope: !327, file: !66, line: 257, column: 5)
!333 = !DILocation(line: 262, column: 13, scope: !332)
!334 = !DILocalVariable(name: "service", scope: !332, file: !66, line: 263, type: !78)
!335 = !DILocation(line: 263, column: 28, scope: !332)
!336 = !DILocalVariable(name: "connectSocket", scope: !332, file: !66, line: 264, type: !71)
!337 = !DILocation(line: 264, column: 16, scope: !332)
!338 = !DILocalVariable(name: "inputBuffer", scope: !332, file: !66, line: 265, type: !55)
!339 = !DILocation(line: 265, column: 14, scope: !332)
!340 = !DILocation(line: 266, column: 9, scope: !332)
!341 = !DILocation(line: 276, column: 29, scope: !342)
!342 = distinct !DILexicalBlock(scope: !332, file: !66, line: 267, column: 9)
!343 = !DILocation(line: 276, column: 27, scope: !342)
!344 = !DILocation(line: 277, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !342, file: !66, line: 277, column: 17)
!346 = !DILocation(line: 277, column: 31, scope: !345)
!347 = !DILocation(line: 277, column: 17, scope: !342)
!348 = !DILocation(line: 279, column: 17, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !66, line: 278, column: 13)
!350 = !DILocation(line: 281, column: 13, scope: !342)
!351 = !DILocation(line: 282, column: 21, scope: !342)
!352 = !DILocation(line: 282, column: 32, scope: !342)
!353 = !DILocation(line: 283, column: 39, scope: !342)
!354 = !DILocation(line: 283, column: 21, scope: !342)
!355 = !DILocation(line: 283, column: 30, scope: !342)
!356 = !DILocation(line: 283, column: 37, scope: !342)
!357 = !DILocation(line: 284, column: 32, scope: !342)
!358 = !DILocation(line: 284, column: 21, scope: !342)
!359 = !DILocation(line: 284, column: 30, scope: !342)
!360 = !DILocation(line: 285, column: 25, scope: !361)
!361 = distinct !DILexicalBlock(scope: !342, file: !66, line: 285, column: 17)
!362 = !DILocation(line: 285, column: 40, scope: !361)
!363 = !DILocation(line: 285, column: 17, scope: !361)
!364 = !DILocation(line: 285, column: 85, scope: !361)
!365 = !DILocation(line: 285, column: 17, scope: !342)
!366 = !DILocation(line: 287, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !361, file: !66, line: 286, column: 13)
!368 = !DILocation(line: 291, column: 31, scope: !342)
!369 = !DILocation(line: 291, column: 46, scope: !342)
!370 = !DILocation(line: 291, column: 26, scope: !342)
!371 = !DILocation(line: 291, column: 24, scope: !342)
!372 = !DILocation(line: 292, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !342, file: !66, line: 292, column: 17)
!374 = !DILocation(line: 292, column: 28, scope: !373)
!375 = !DILocation(line: 292, column: 44, scope: !373)
!376 = !DILocation(line: 292, column: 47, scope: !373)
!377 = !DILocation(line: 292, column: 58, scope: !373)
!378 = !DILocation(line: 292, column: 17, scope: !342)
!379 = !DILocation(line: 294, column: 17, scope: !380)
!380 = distinct !DILexicalBlock(scope: !373, file: !66, line: 293, column: 13)
!381 = !DILocation(line: 297, column: 25, scope: !342)
!382 = !DILocation(line: 297, column: 13, scope: !342)
!383 = !DILocation(line: 297, column: 37, scope: !342)
!384 = !DILocation(line: 299, column: 25, scope: !342)
!385 = !DILocation(line: 299, column: 20, scope: !342)
!386 = !DILocation(line: 299, column: 18, scope: !342)
!387 = !DILocation(line: 300, column: 9, scope: !342)
!388 = !DILocation(line: 302, column: 13, scope: !389)
!389 = distinct !DILexicalBlock(scope: !332, file: !66, line: 302, column: 13)
!390 = !DILocation(line: 302, column: 27, scope: !389)
!391 = !DILocation(line: 302, column: 13, scope: !332)
!392 = !DILocation(line: 304, column: 26, scope: !393)
!393 = distinct !DILexicalBlock(scope: !389, file: !66, line: 303, column: 9)
!394 = !DILocation(line: 304, column: 13, scope: !393)
!395 = !DILocation(line: 305, column: 9, scope: !393)
!396 = !DILocalVariable(name: "i", scope: !397, file: !66, line: 323, type: !71)
!397 = distinct !DILexicalBlock(scope: !327, file: !66, line: 322, column: 5)
!398 = !DILocation(line: 323, column: 13, scope: !397)
!399 = !DILocalVariable(name: "buffer", scope: !397, file: !66, line: 324, type: !164)
!400 = !DILocation(line: 324, column: 13, scope: !397)
!401 = !DILocation(line: 326, column: 13, scope: !402)
!402 = distinct !DILexicalBlock(scope: !397, file: !66, line: 326, column: 13)
!403 = !DILocation(line: 326, column: 18, scope: !402)
!404 = !DILocation(line: 326, column: 23, scope: !402)
!405 = !DILocation(line: 326, column: 26, scope: !402)
!406 = !DILocation(line: 326, column: 31, scope: !402)
!407 = !DILocation(line: 326, column: 13, scope: !397)
!408 = !DILocation(line: 328, column: 20, scope: !409)
!409 = distinct !DILexicalBlock(scope: !402, file: !66, line: 327, column: 9)
!410 = !DILocation(line: 328, column: 13, scope: !409)
!411 = !DILocation(line: 328, column: 26, scope: !409)
!412 = !DILocation(line: 330, column: 19, scope: !413)
!413 = distinct !DILexicalBlock(scope: !409, file: !66, line: 330, column: 13)
!414 = !DILocation(line: 330, column: 17, scope: !413)
!415 = !DILocation(line: 330, column: 24, scope: !416)
!416 = distinct !DILexicalBlock(scope: !413, file: !66, line: 330, column: 13)
!417 = !DILocation(line: 330, column: 26, scope: !416)
!418 = !DILocation(line: 330, column: 13, scope: !413)
!419 = !DILocation(line: 332, column: 37, scope: !420)
!420 = distinct !DILexicalBlock(scope: !416, file: !66, line: 331, column: 13)
!421 = !DILocation(line: 332, column: 30, scope: !420)
!422 = !DILocation(line: 332, column: 17, scope: !420)
!423 = !DILocation(line: 333, column: 13, scope: !420)
!424 = !DILocation(line: 330, column: 33, scope: !416)
!425 = !DILocation(line: 330, column: 13, scope: !416)
!426 = distinct !{!426, !418, !427, !192}
!427 = !DILocation(line: 333, column: 13, scope: !413)
!428 = !DILocation(line: 334, column: 9, scope: !409)
!429 = !DILocation(line: 337, column: 13, scope: !430)
!430 = distinct !DILexicalBlock(scope: !402, file: !66, line: 336, column: 9)
!431 = !DILocation(line: 346, column: 1, scope: !327)
!432 = distinct !DISubprogram(name: "goodG2B1", scope: !66, file: !66, line: 349, type: !67, scopeLine: 350, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!433 = !DILocalVariable(name: "data", scope: !432, file: !66, line: 351, type: !71)
!434 = !DILocation(line: 351, column: 9, scope: !432)
!435 = !DILocation(line: 353, column: 10, scope: !432)
!436 = !DILocation(line: 363, column: 14, scope: !432)
!437 = !DILocalVariable(name: "i", scope: !438, file: !66, line: 370, type: !71)
!438 = distinct !DILexicalBlock(scope: !432, file: !66, line: 369, column: 5)
!439 = !DILocation(line: 370, column: 13, scope: !438)
!440 = !DILocalVariable(name: "buffer", scope: !438, file: !66, line: 371, type: !164)
!441 = !DILocation(line: 371, column: 13, scope: !438)
!442 = !DILocation(line: 374, column: 13, scope: !443)
!443 = distinct !DILexicalBlock(scope: !438, file: !66, line: 374, column: 13)
!444 = !DILocation(line: 374, column: 18, scope: !443)
!445 = !DILocation(line: 374, column: 13, scope: !438)
!446 = !DILocation(line: 376, column: 20, scope: !447)
!447 = distinct !DILexicalBlock(scope: !443, file: !66, line: 375, column: 9)
!448 = !DILocation(line: 376, column: 13, scope: !447)
!449 = !DILocation(line: 376, column: 26, scope: !447)
!450 = !DILocation(line: 378, column: 19, scope: !451)
!451 = distinct !DILexicalBlock(scope: !447, file: !66, line: 378, column: 13)
!452 = !DILocation(line: 378, column: 17, scope: !451)
!453 = !DILocation(line: 378, column: 24, scope: !454)
!454 = distinct !DILexicalBlock(scope: !451, file: !66, line: 378, column: 13)
!455 = !DILocation(line: 378, column: 26, scope: !454)
!456 = !DILocation(line: 378, column: 13, scope: !451)
!457 = !DILocation(line: 380, column: 37, scope: !458)
!458 = distinct !DILexicalBlock(scope: !454, file: !66, line: 379, column: 13)
!459 = !DILocation(line: 380, column: 30, scope: !458)
!460 = !DILocation(line: 380, column: 17, scope: !458)
!461 = !DILocation(line: 381, column: 13, scope: !458)
!462 = !DILocation(line: 378, column: 33, scope: !454)
!463 = !DILocation(line: 378, column: 13, scope: !454)
!464 = distinct !{!464, !456, !465, !192}
!465 = !DILocation(line: 381, column: 13, scope: !451)
!466 = !DILocation(line: 382, column: 9, scope: !447)
!467 = !DILocation(line: 385, column: 13, scope: !468)
!468 = distinct !DILexicalBlock(scope: !443, file: !66, line: 384, column: 9)
!469 = !DILocation(line: 394, column: 1, scope: !432)
!470 = distinct !DISubprogram(name: "goodG2B2", scope: !66, file: !66, line: 397, type: !67, scopeLine: 398, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!471 = !DILocalVariable(name: "data", scope: !470, file: !66, line: 399, type: !71)
!472 = !DILocation(line: 399, column: 9, scope: !470)
!473 = !DILocation(line: 401, column: 10, scope: !470)
!474 = !DILocation(line: 407, column: 14, scope: !470)
!475 = !DILocalVariable(name: "i", scope: !476, file: !66, line: 418, type: !71)
!476 = distinct !DILexicalBlock(scope: !470, file: !66, line: 417, column: 5)
!477 = !DILocation(line: 418, column: 13, scope: !476)
!478 = !DILocalVariable(name: "buffer", scope: !476, file: !66, line: 419, type: !164)
!479 = !DILocation(line: 419, column: 13, scope: !476)
!480 = !DILocation(line: 422, column: 13, scope: !481)
!481 = distinct !DILexicalBlock(scope: !476, file: !66, line: 422, column: 13)
!482 = !DILocation(line: 422, column: 18, scope: !481)
!483 = !DILocation(line: 422, column: 13, scope: !476)
!484 = !DILocation(line: 424, column: 20, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !66, line: 423, column: 9)
!486 = !DILocation(line: 424, column: 13, scope: !485)
!487 = !DILocation(line: 424, column: 26, scope: !485)
!488 = !DILocation(line: 426, column: 19, scope: !489)
!489 = distinct !DILexicalBlock(scope: !485, file: !66, line: 426, column: 13)
!490 = !DILocation(line: 426, column: 17, scope: !489)
!491 = !DILocation(line: 426, column: 24, scope: !492)
!492 = distinct !DILexicalBlock(scope: !489, file: !66, line: 426, column: 13)
!493 = !DILocation(line: 426, column: 26, scope: !492)
!494 = !DILocation(line: 426, column: 13, scope: !489)
!495 = !DILocation(line: 428, column: 37, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !66, line: 427, column: 13)
!497 = !DILocation(line: 428, column: 30, scope: !496)
!498 = !DILocation(line: 428, column: 17, scope: !496)
!499 = !DILocation(line: 429, column: 13, scope: !496)
!500 = !DILocation(line: 426, column: 33, scope: !492)
!501 = !DILocation(line: 426, column: 13, scope: !492)
!502 = distinct !{!502, !494, !503, !192}
!503 = !DILocation(line: 429, column: 13, scope: !489)
!504 = !DILocation(line: 430, column: 9, scope: !485)
!505 = !DILocation(line: 433, column: 13, scope: !506)
!506 = distinct !DILexicalBlock(scope: !481, file: !66, line: 432, column: 9)
!507 = !DILocation(line: 442, column: 1, scope: !470)
