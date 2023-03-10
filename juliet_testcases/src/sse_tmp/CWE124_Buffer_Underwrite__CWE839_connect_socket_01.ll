; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_01.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_01.c"
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_01_bad() #0 !dbg !65 {
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_01_good() #0 !dbg !197 {
entry:
  call void @goodG2B(), !dbg !198
  call void @goodB2G(), !dbg !199
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !201 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !206, metadata !DIExpression()), !dbg !207
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !208, metadata !DIExpression()), !dbg !209
  %call = call i64 @time(i64* null) #7, !dbg !210
  %conv = trunc i64 %call to i32, !dbg !211
  call void @srand(i32 %conv) #7, !dbg !212
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !213
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_01_good(), !dbg !214
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !215
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !216
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_01_bad(), !dbg !217
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !218
  ret i32 0, !dbg !219
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !220 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !221, metadata !DIExpression()), !dbg !222
  store i32 -1, i32* %data, align 4, !dbg !223
  store i32 7, i32* %data, align 4, !dbg !224
  call void @llvm.dbg.declare(metadata i32* %i, metadata !225, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !228, metadata !DIExpression()), !dbg !229
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !229
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !229
  %1 = load i32, i32* %data, align 4, !dbg !230
  %cmp = icmp slt i32 %1, 10, !dbg !232
  br i1 %cmp, label %if.then, label %if.else, !dbg !233

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !234
  %idxprom = sext i32 %2 to i64, !dbg !236
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !236
  store i32 1, i32* %arrayidx, align 4, !dbg !237
  store i32 0, i32* %i, align 4, !dbg !238
  br label %for.cond, !dbg !240

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !241
  %cmp1 = icmp slt i32 %3, 10, !dbg !243
  br i1 %cmp1, label %for.body, label %for.end, !dbg !244

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !245
  %idxprom2 = sext i32 %4 to i64, !dbg !247
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !247
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !247
  call void @printIntLine(i32 %5), !dbg !248
  br label %for.inc, !dbg !249

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !250
  %inc = add nsw i32 %6, 1, !dbg !250
  store i32 %inc, i32* %i, align 4, !dbg !250
  br label %for.cond, !dbg !251, !llvm.loop !252

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !254

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !255
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !257
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !258 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !259, metadata !DIExpression()), !dbg !260
  store i32 -1, i32* %data, align 4, !dbg !261
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !262, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !265, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !267, metadata !DIExpression()), !dbg !268
  store i32 -1, i32* %connectSocket, align 4, !dbg !268
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !269, metadata !DIExpression()), !dbg !270
  br label %do.body, !dbg !271

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !272
  store i32 %call, i32* %connectSocket, align 4, !dbg !274
  %0 = load i32, i32* %connectSocket, align 4, !dbg !275
  %cmp = icmp eq i32 %0, -1, !dbg !277
  br i1 %cmp, label %if.then, label %if.end, !dbg !278

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !279

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !281
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !281
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !282
  store i16 2, i16* %sin_family, align 4, !dbg !283
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !284
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !285
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !286
  store i32 %call1, i32* %s_addr, align 4, !dbg !287
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !288
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !289
  store i16 %call2, i16* %sin_port, align 2, !dbg !290
  %2 = load i32, i32* %connectSocket, align 4, !dbg !291
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !293
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !294
  %cmp4 = icmp eq i32 %call3, -1, !dbg !295
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !296

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !297

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !299
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !300
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !301
  %conv = trunc i64 %call7 to i32, !dbg !301
  store i32 %conv, i32* %recvResult, align 4, !dbg !302
  %5 = load i32, i32* %recvResult, align 4, !dbg !303
  %cmp8 = icmp eq i32 %5, -1, !dbg !305
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !306

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !307
  %cmp10 = icmp eq i32 %6, 0, !dbg !308
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !309

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !310

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !312
  %idxprom = sext i32 %7 to i64, !dbg !313
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !313
  store i8 0, i8* %arrayidx, align 1, !dbg !314
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !315
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !316
  store i32 %call15, i32* %data, align 4, !dbg !317
  br label %do.end, !dbg !318

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !319
  %cmp16 = icmp ne i32 %8, -1, !dbg !321
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !322

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !323
  %call19 = call i32 @close(i32 %9), !dbg !325
  br label %if.end20, !dbg !326

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !327, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !330, metadata !DIExpression()), !dbg !331
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !331
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !331
  %11 = load i32, i32* %data, align 4, !dbg !332
  %cmp21 = icmp sge i32 %11, 0, !dbg !334
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !335

land.lhs.true:                                    ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !336
  %cmp23 = icmp slt i32 %12, 10, !dbg !337
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !338

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !339
  %idxprom26 = sext i32 %13 to i64, !dbg !341
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !341
  store i32 1, i32* %arrayidx27, align 4, !dbg !342
  store i32 0, i32* %i, align 4, !dbg !343
  br label %for.cond, !dbg !345

for.cond:                                         ; preds = %for.inc, %if.then25
  %14 = load i32, i32* %i, align 4, !dbg !346
  %cmp28 = icmp slt i32 %14, 10, !dbg !348
  br i1 %cmp28, label %for.body, label %for.end, !dbg !349

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !350
  %idxprom30 = sext i32 %15 to i64, !dbg !352
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !352
  %16 = load i32, i32* %arrayidx31, align 4, !dbg !352
  call void @printIntLine(i32 %16), !dbg !353
  br label %for.inc, !dbg !354

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !355
  %inc = add nsw i32 %17, 1, !dbg !355
  store i32 %inc, i32* %i, align 4, !dbg !355
  br label %for.cond, !dbg !356, !llvm.loop !357

for.end:                                          ; preds = %for.cond
  br label %if.end32, !dbg !359

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !360
  br label %if.end32

if.end32:                                         ; preds = %if.else, %for.end
  ret void, !dbg !362
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_01_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_01.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocalVariable(name: "recvResult", scope: !75, file: !66, line: 54, type: !71)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 49, column: 5)
!76 = !DILocation(line: 54, column: 13, scope: !75)
!77 = !DILocalVariable(name: "service", scope: !75, file: !66, line: 55, type: !78)
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
!99 = !DILocation(line: 55, column: 28, scope: !75)
!100 = !DILocalVariable(name: "connectSocket", scope: !75, file: !66, line: 56, type: !71)
!101 = !DILocation(line: 56, column: 16, scope: !75)
!102 = !DILocalVariable(name: "inputBuffer", scope: !75, file: !66, line: 57, type: !55)
!103 = !DILocation(line: 57, column: 14, scope: !75)
!104 = !DILocation(line: 58, column: 9, scope: !75)
!105 = !DILocation(line: 68, column: 29, scope: !106)
!106 = distinct !DILexicalBlock(scope: !75, file: !66, line: 59, column: 9)
!107 = !DILocation(line: 68, column: 27, scope: !106)
!108 = !DILocation(line: 69, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !66, line: 69, column: 17)
!110 = !DILocation(line: 69, column: 31, scope: !109)
!111 = !DILocation(line: 69, column: 17, scope: !106)
!112 = !DILocation(line: 71, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !66, line: 70, column: 13)
!114 = !DILocation(line: 73, column: 13, scope: !106)
!115 = !DILocation(line: 74, column: 21, scope: !106)
!116 = !DILocation(line: 74, column: 32, scope: !106)
!117 = !DILocation(line: 75, column: 39, scope: !106)
!118 = !DILocation(line: 75, column: 21, scope: !106)
!119 = !DILocation(line: 75, column: 30, scope: !106)
!120 = !DILocation(line: 75, column: 37, scope: !106)
!121 = !DILocation(line: 76, column: 32, scope: !106)
!122 = !DILocation(line: 76, column: 21, scope: !106)
!123 = !DILocation(line: 76, column: 30, scope: !106)
!124 = !DILocation(line: 77, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !106, file: !66, line: 77, column: 17)
!126 = !DILocation(line: 77, column: 40, scope: !125)
!127 = !DILocation(line: 77, column: 17, scope: !125)
!128 = !DILocation(line: 77, column: 85, scope: !125)
!129 = !DILocation(line: 77, column: 17, scope: !106)
!130 = !DILocation(line: 79, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !66, line: 78, column: 13)
!132 = !DILocation(line: 83, column: 31, scope: !106)
!133 = !DILocation(line: 83, column: 46, scope: !106)
!134 = !DILocation(line: 83, column: 26, scope: !106)
!135 = !DILocation(line: 83, column: 24, scope: !106)
!136 = !DILocation(line: 84, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !106, file: !66, line: 84, column: 17)
!138 = !DILocation(line: 84, column: 28, scope: !137)
!139 = !DILocation(line: 84, column: 44, scope: !137)
!140 = !DILocation(line: 84, column: 47, scope: !137)
!141 = !DILocation(line: 84, column: 58, scope: !137)
!142 = !DILocation(line: 84, column: 17, scope: !106)
!143 = !DILocation(line: 86, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !66, line: 85, column: 13)
!145 = !DILocation(line: 89, column: 25, scope: !106)
!146 = !DILocation(line: 89, column: 13, scope: !106)
!147 = !DILocation(line: 89, column: 37, scope: !106)
!148 = !DILocation(line: 91, column: 25, scope: !106)
!149 = !DILocation(line: 91, column: 20, scope: !106)
!150 = !DILocation(line: 91, column: 18, scope: !106)
!151 = !DILocation(line: 92, column: 9, scope: !106)
!152 = !DILocation(line: 94, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !75, file: !66, line: 94, column: 13)
!154 = !DILocation(line: 94, column: 27, scope: !153)
!155 = !DILocation(line: 94, column: 13, scope: !75)
!156 = !DILocation(line: 96, column: 26, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !66, line: 95, column: 9)
!158 = !DILocation(line: 96, column: 13, scope: !157)
!159 = !DILocation(line: 97, column: 9, scope: !157)
!160 = !DILocalVariable(name: "i", scope: !161, file: !66, line: 106, type: !71)
!161 = distinct !DILexicalBlock(scope: !65, file: !66, line: 105, column: 5)
!162 = !DILocation(line: 106, column: 13, scope: !161)
!163 = !DILocalVariable(name: "buffer", scope: !161, file: !66, line: 107, type: !164)
!164 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !165)
!165 = !{!166}
!166 = !DISubrange(count: 10)
!167 = !DILocation(line: 107, column: 13, scope: !161)
!168 = !DILocation(line: 110, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !161, file: !66, line: 110, column: 13)
!170 = !DILocation(line: 110, column: 18, scope: !169)
!171 = !DILocation(line: 110, column: 13, scope: !161)
!172 = !DILocation(line: 112, column: 20, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !66, line: 111, column: 9)
!174 = !DILocation(line: 112, column: 13, scope: !173)
!175 = !DILocation(line: 112, column: 26, scope: !173)
!176 = !DILocation(line: 114, column: 19, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !66, line: 114, column: 13)
!178 = !DILocation(line: 114, column: 17, scope: !177)
!179 = !DILocation(line: 114, column: 24, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !66, line: 114, column: 13)
!181 = !DILocation(line: 114, column: 26, scope: !180)
!182 = !DILocation(line: 114, column: 13, scope: !177)
!183 = !DILocation(line: 116, column: 37, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !66, line: 115, column: 13)
!185 = !DILocation(line: 116, column: 30, scope: !184)
!186 = !DILocation(line: 116, column: 17, scope: !184)
!187 = !DILocation(line: 117, column: 13, scope: !184)
!188 = !DILocation(line: 114, column: 33, scope: !180)
!189 = !DILocation(line: 114, column: 13, scope: !180)
!190 = distinct !{!190, !182, !191, !192}
!191 = !DILocation(line: 117, column: 13, scope: !177)
!192 = !{!"llvm.loop.mustprogress"}
!193 = !DILocation(line: 118, column: 9, scope: !173)
!194 = !DILocation(line: 121, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !169, file: !66, line: 120, column: 9)
!196 = !DILocation(line: 124, column: 1, scope: !65)
!197 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_01_good", scope: !66, file: !66, line: 242, type: !67, scopeLine: 243, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!198 = !DILocation(line: 244, column: 5, scope: !197)
!199 = !DILocation(line: 245, column: 5, scope: !197)
!200 = !DILocation(line: 246, column: 1, scope: !197)
!201 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 257, type: !202, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!202 = !DISubroutineType(types: !203)
!203 = !{!71, !71, !204}
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!206 = !DILocalVariable(name: "argc", arg: 1, scope: !201, file: !66, line: 257, type: !71)
!207 = !DILocation(line: 257, column: 14, scope: !201)
!208 = !DILocalVariable(name: "argv", arg: 2, scope: !201, file: !66, line: 257, type: !204)
!209 = !DILocation(line: 257, column: 27, scope: !201)
!210 = !DILocation(line: 260, column: 22, scope: !201)
!211 = !DILocation(line: 260, column: 12, scope: !201)
!212 = !DILocation(line: 260, column: 5, scope: !201)
!213 = !DILocation(line: 262, column: 5, scope: !201)
!214 = !DILocation(line: 263, column: 5, scope: !201)
!215 = !DILocation(line: 264, column: 5, scope: !201)
!216 = !DILocation(line: 267, column: 5, scope: !201)
!217 = !DILocation(line: 268, column: 5, scope: !201)
!218 = !DILocation(line: 269, column: 5, scope: !201)
!219 = !DILocation(line: 271, column: 5, scope: !201)
!220 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 131, type: !67, scopeLine: 132, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!221 = !DILocalVariable(name: "data", scope: !220, file: !66, line: 133, type: !71)
!222 = !DILocation(line: 133, column: 9, scope: !220)
!223 = !DILocation(line: 135, column: 10, scope: !220)
!224 = !DILocation(line: 138, column: 10, scope: !220)
!225 = !DILocalVariable(name: "i", scope: !226, file: !66, line: 140, type: !71)
!226 = distinct !DILexicalBlock(scope: !220, file: !66, line: 139, column: 5)
!227 = !DILocation(line: 140, column: 13, scope: !226)
!228 = !DILocalVariable(name: "buffer", scope: !226, file: !66, line: 141, type: !164)
!229 = !DILocation(line: 141, column: 13, scope: !226)
!230 = !DILocation(line: 144, column: 13, scope: !231)
!231 = distinct !DILexicalBlock(scope: !226, file: !66, line: 144, column: 13)
!232 = !DILocation(line: 144, column: 18, scope: !231)
!233 = !DILocation(line: 144, column: 13, scope: !226)
!234 = !DILocation(line: 146, column: 20, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !66, line: 145, column: 9)
!236 = !DILocation(line: 146, column: 13, scope: !235)
!237 = !DILocation(line: 146, column: 26, scope: !235)
!238 = !DILocation(line: 148, column: 19, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !66, line: 148, column: 13)
!240 = !DILocation(line: 148, column: 17, scope: !239)
!241 = !DILocation(line: 148, column: 24, scope: !242)
!242 = distinct !DILexicalBlock(scope: !239, file: !66, line: 148, column: 13)
!243 = !DILocation(line: 148, column: 26, scope: !242)
!244 = !DILocation(line: 148, column: 13, scope: !239)
!245 = !DILocation(line: 150, column: 37, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !66, line: 149, column: 13)
!247 = !DILocation(line: 150, column: 30, scope: !246)
!248 = !DILocation(line: 150, column: 17, scope: !246)
!249 = !DILocation(line: 151, column: 13, scope: !246)
!250 = !DILocation(line: 148, column: 33, scope: !242)
!251 = !DILocation(line: 148, column: 13, scope: !242)
!252 = distinct !{!252, !244, !253, !192}
!253 = !DILocation(line: 151, column: 13, scope: !239)
!254 = !DILocation(line: 152, column: 9, scope: !235)
!255 = !DILocation(line: 155, column: 13, scope: !256)
!256 = distinct !DILexicalBlock(scope: !231, file: !66, line: 154, column: 9)
!257 = !DILocation(line: 158, column: 1, scope: !220)
!258 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 161, type: !67, scopeLine: 162, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!259 = !DILocalVariable(name: "data", scope: !258, file: !66, line: 163, type: !71)
!260 = !DILocation(line: 163, column: 9, scope: !258)
!261 = !DILocation(line: 165, column: 10, scope: !258)
!262 = !DILocalVariable(name: "recvResult", scope: !263, file: !66, line: 171, type: !71)
!263 = distinct !DILexicalBlock(scope: !258, file: !66, line: 166, column: 5)
!264 = !DILocation(line: 171, column: 13, scope: !263)
!265 = !DILocalVariable(name: "service", scope: !263, file: !66, line: 172, type: !78)
!266 = !DILocation(line: 172, column: 28, scope: !263)
!267 = !DILocalVariable(name: "connectSocket", scope: !263, file: !66, line: 173, type: !71)
!268 = !DILocation(line: 173, column: 16, scope: !263)
!269 = !DILocalVariable(name: "inputBuffer", scope: !263, file: !66, line: 174, type: !55)
!270 = !DILocation(line: 174, column: 14, scope: !263)
!271 = !DILocation(line: 175, column: 9, scope: !263)
!272 = !DILocation(line: 185, column: 29, scope: !273)
!273 = distinct !DILexicalBlock(scope: !263, file: !66, line: 176, column: 9)
!274 = !DILocation(line: 185, column: 27, scope: !273)
!275 = !DILocation(line: 186, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !273, file: !66, line: 186, column: 17)
!277 = !DILocation(line: 186, column: 31, scope: !276)
!278 = !DILocation(line: 186, column: 17, scope: !273)
!279 = !DILocation(line: 188, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !66, line: 187, column: 13)
!281 = !DILocation(line: 190, column: 13, scope: !273)
!282 = !DILocation(line: 191, column: 21, scope: !273)
!283 = !DILocation(line: 191, column: 32, scope: !273)
!284 = !DILocation(line: 192, column: 39, scope: !273)
!285 = !DILocation(line: 192, column: 21, scope: !273)
!286 = !DILocation(line: 192, column: 30, scope: !273)
!287 = !DILocation(line: 192, column: 37, scope: !273)
!288 = !DILocation(line: 193, column: 32, scope: !273)
!289 = !DILocation(line: 193, column: 21, scope: !273)
!290 = !DILocation(line: 193, column: 30, scope: !273)
!291 = !DILocation(line: 194, column: 25, scope: !292)
!292 = distinct !DILexicalBlock(scope: !273, file: !66, line: 194, column: 17)
!293 = !DILocation(line: 194, column: 40, scope: !292)
!294 = !DILocation(line: 194, column: 17, scope: !292)
!295 = !DILocation(line: 194, column: 85, scope: !292)
!296 = !DILocation(line: 194, column: 17, scope: !273)
!297 = !DILocation(line: 196, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !292, file: !66, line: 195, column: 13)
!299 = !DILocation(line: 200, column: 31, scope: !273)
!300 = !DILocation(line: 200, column: 46, scope: !273)
!301 = !DILocation(line: 200, column: 26, scope: !273)
!302 = !DILocation(line: 200, column: 24, scope: !273)
!303 = !DILocation(line: 201, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !273, file: !66, line: 201, column: 17)
!305 = !DILocation(line: 201, column: 28, scope: !304)
!306 = !DILocation(line: 201, column: 44, scope: !304)
!307 = !DILocation(line: 201, column: 47, scope: !304)
!308 = !DILocation(line: 201, column: 58, scope: !304)
!309 = !DILocation(line: 201, column: 17, scope: !273)
!310 = !DILocation(line: 203, column: 17, scope: !311)
!311 = distinct !DILexicalBlock(scope: !304, file: !66, line: 202, column: 13)
!312 = !DILocation(line: 206, column: 25, scope: !273)
!313 = !DILocation(line: 206, column: 13, scope: !273)
!314 = !DILocation(line: 206, column: 37, scope: !273)
!315 = !DILocation(line: 208, column: 25, scope: !273)
!316 = !DILocation(line: 208, column: 20, scope: !273)
!317 = !DILocation(line: 208, column: 18, scope: !273)
!318 = !DILocation(line: 209, column: 9, scope: !273)
!319 = !DILocation(line: 211, column: 13, scope: !320)
!320 = distinct !DILexicalBlock(scope: !263, file: !66, line: 211, column: 13)
!321 = !DILocation(line: 211, column: 27, scope: !320)
!322 = !DILocation(line: 211, column: 13, scope: !263)
!323 = !DILocation(line: 213, column: 26, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !66, line: 212, column: 9)
!325 = !DILocation(line: 213, column: 13, scope: !324)
!326 = !DILocation(line: 214, column: 9, scope: !324)
!327 = !DILocalVariable(name: "i", scope: !328, file: !66, line: 223, type: !71)
!328 = distinct !DILexicalBlock(scope: !258, file: !66, line: 222, column: 5)
!329 = !DILocation(line: 223, column: 13, scope: !328)
!330 = !DILocalVariable(name: "buffer", scope: !328, file: !66, line: 224, type: !164)
!331 = !DILocation(line: 224, column: 13, scope: !328)
!332 = !DILocation(line: 226, column: 13, scope: !333)
!333 = distinct !DILexicalBlock(scope: !328, file: !66, line: 226, column: 13)
!334 = !DILocation(line: 226, column: 18, scope: !333)
!335 = !DILocation(line: 226, column: 23, scope: !333)
!336 = !DILocation(line: 226, column: 26, scope: !333)
!337 = !DILocation(line: 226, column: 31, scope: !333)
!338 = !DILocation(line: 226, column: 13, scope: !328)
!339 = !DILocation(line: 228, column: 20, scope: !340)
!340 = distinct !DILexicalBlock(scope: !333, file: !66, line: 227, column: 9)
!341 = !DILocation(line: 228, column: 13, scope: !340)
!342 = !DILocation(line: 228, column: 26, scope: !340)
!343 = !DILocation(line: 230, column: 19, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !66, line: 230, column: 13)
!345 = !DILocation(line: 230, column: 17, scope: !344)
!346 = !DILocation(line: 230, column: 24, scope: !347)
!347 = distinct !DILexicalBlock(scope: !344, file: !66, line: 230, column: 13)
!348 = !DILocation(line: 230, column: 26, scope: !347)
!349 = !DILocation(line: 230, column: 13, scope: !344)
!350 = !DILocation(line: 232, column: 37, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !66, line: 231, column: 13)
!352 = !DILocation(line: 232, column: 30, scope: !351)
!353 = !DILocation(line: 232, column: 17, scope: !351)
!354 = !DILocation(line: 233, column: 13, scope: !351)
!355 = !DILocation(line: 230, column: 33, scope: !347)
!356 = !DILocation(line: 230, column: 13, scope: !347)
!357 = distinct !{!357, !349, !358, !192}
!358 = !DILocation(line: 233, column: 13, scope: !344)
!359 = !DILocation(line: 234, column: 9, scope: !340)
!360 = !DILocation(line: 237, column: 13, scope: !361)
!361 = distinct !DILexicalBlock(scope: !333, file: !66, line: 236, column: 9)
!362 = !DILocation(line: 240, column: 1, scope: !258)
