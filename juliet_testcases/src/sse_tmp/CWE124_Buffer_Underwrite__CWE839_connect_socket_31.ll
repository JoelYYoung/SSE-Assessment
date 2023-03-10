; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_31.c"
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_31_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data21 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !160, metadata !DIExpression()), !dbg !162
  %10 = load i32, i32* %data, align 4, !dbg !163
  store i32 %10, i32* %dataCopy, align 4, !dbg !162
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !164, metadata !DIExpression()), !dbg !165
  %11 = load i32, i32* %dataCopy, align 4, !dbg !166
  store i32 %11, i32* %data21, align 4, !dbg !165
  call void @llvm.dbg.declare(metadata i32* %i, metadata !167, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !170, metadata !DIExpression()), !dbg !174
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !174
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !174
  %13 = load i32, i32* %data21, align 4, !dbg !175
  %cmp22 = icmp slt i32 %13, 10, !dbg !177
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !178

if.then24:                                        ; preds = %if.end20
  %14 = load i32, i32* %data21, align 4, !dbg !179
  %idxprom25 = sext i32 %14 to i64, !dbg !181
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !181
  store i32 1, i32* %arrayidx26, align 4, !dbg !182
  store i32 0, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.then24
  %15 = load i32, i32* %i, align 4, !dbg !186
  %cmp27 = icmp slt i32 %15, 10, !dbg !188
  br i1 %cmp27, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %16 = load i32, i32* %i, align 4, !dbg !190
  %idxprom29 = sext i32 %16 to i64, !dbg !192
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !192
  %17 = load i32, i32* %arrayidx30, align 4, !dbg !192
  call void @printIntLine(i32 %17), !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4, !dbg !195
  %inc = add nsw i32 %18, 1, !dbg !195
  store i32 %inc, i32* %i, align 4, !dbg !195
  br label %for.cond, !dbg !196, !llvm.loop !197

for.end:                                          ; preds = %for.cond
  br label %if.end31, !dbg !200

if.else:                                          ; preds = %if.end20
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !201
  br label %if.end31

if.end31:                                         ; preds = %if.else, %for.end
  ret void, !dbg !203
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_31_good() #0 !dbg !204 {
entry:
  call void @goodG2B(), !dbg !205
  call void @goodB2G(), !dbg !206
  ret void, !dbg !207
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !208 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !213, metadata !DIExpression()), !dbg !214
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !215, metadata !DIExpression()), !dbg !216
  %call = call i64 @time(i64* null) #7, !dbg !217
  %conv = trunc i64 %call to i32, !dbg !218
  call void @srand(i32 %conv) #7, !dbg !219
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !220
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_31_good(), !dbg !221
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !222
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !223
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_31_bad(), !dbg !224
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !225
  ret i32 0, !dbg !226
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !227 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !228, metadata !DIExpression()), !dbg !229
  store i32 -1, i32* %data, align 4, !dbg !230
  store i32 7, i32* %data, align 4, !dbg !231
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !232, metadata !DIExpression()), !dbg !234
  %0 = load i32, i32* %data, align 4, !dbg !235
  store i32 %0, i32* %dataCopy, align 4, !dbg !234
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !236, metadata !DIExpression()), !dbg !237
  %1 = load i32, i32* %dataCopy, align 4, !dbg !238
  store i32 %1, i32* %data1, align 4, !dbg !237
  call void @llvm.dbg.declare(metadata i32* %i, metadata !239, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !242, metadata !DIExpression()), !dbg !243
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !243
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !243
  %3 = load i32, i32* %data1, align 4, !dbg !244
  %cmp = icmp slt i32 %3, 10, !dbg !246
  br i1 %cmp, label %if.then, label %if.else, !dbg !247

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !248
  %idxprom = sext i32 %4 to i64, !dbg !250
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !250
  store i32 1, i32* %arrayidx, align 4, !dbg !251
  store i32 0, i32* %i, align 4, !dbg !252
  br label %for.cond, !dbg !254

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !255
  %cmp2 = icmp slt i32 %5, 10, !dbg !257
  br i1 %cmp2, label %for.body, label %for.end, !dbg !258

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !259
  %idxprom3 = sext i32 %6 to i64, !dbg !261
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !261
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !261
  call void @printIntLine(i32 %7), !dbg !262
  br label %for.inc, !dbg !263

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !264
  %inc = add nsw i32 %8, 1, !dbg !264
  store i32 %inc, i32* %i, align 4, !dbg !264
  br label %for.cond, !dbg !265, !llvm.loop !266

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !268

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !269
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !271
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !272 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data21 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !273, metadata !DIExpression()), !dbg !274
  store i32 -1, i32* %data, align 4, !dbg !275
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !276, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !279, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !281, metadata !DIExpression()), !dbg !282
  store i32 -1, i32* %connectSocket, align 4, !dbg !282
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !283, metadata !DIExpression()), !dbg !284
  br label %do.body, !dbg !285

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !286
  store i32 %call, i32* %connectSocket, align 4, !dbg !288
  %0 = load i32, i32* %connectSocket, align 4, !dbg !289
  %cmp = icmp eq i32 %0, -1, !dbg !291
  br i1 %cmp, label %if.then, label %if.end, !dbg !292

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !293

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !295
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !295
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !296
  store i16 2, i16* %sin_family, align 4, !dbg !297
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !298
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !299
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !300
  store i32 %call1, i32* %s_addr, align 4, !dbg !301
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !302
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !303
  store i16 %call2, i16* %sin_port, align 2, !dbg !304
  %2 = load i32, i32* %connectSocket, align 4, !dbg !305
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !307
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !308
  %cmp4 = icmp eq i32 %call3, -1, !dbg !309
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !310

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !311

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !313
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !314
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !315
  %conv = trunc i64 %call7 to i32, !dbg !315
  store i32 %conv, i32* %recvResult, align 4, !dbg !316
  %5 = load i32, i32* %recvResult, align 4, !dbg !317
  %cmp8 = icmp eq i32 %5, -1, !dbg !319
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !320

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !321
  %cmp10 = icmp eq i32 %6, 0, !dbg !322
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !323

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !324

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !326
  %idxprom = sext i32 %7 to i64, !dbg !327
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !327
  store i8 0, i8* %arrayidx, align 1, !dbg !328
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !329
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !330
  store i32 %call15, i32* %data, align 4, !dbg !331
  br label %do.end, !dbg !332

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !333
  %cmp16 = icmp ne i32 %8, -1, !dbg !335
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !336

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !337
  %call19 = call i32 @close(i32 %9), !dbg !339
  br label %if.end20, !dbg !340

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !341, metadata !DIExpression()), !dbg !343
  %10 = load i32, i32* %data, align 4, !dbg !344
  store i32 %10, i32* %dataCopy, align 4, !dbg !343
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !345, metadata !DIExpression()), !dbg !346
  %11 = load i32, i32* %dataCopy, align 4, !dbg !347
  store i32 %11, i32* %data21, align 4, !dbg !346
  call void @llvm.dbg.declare(metadata i32* %i, metadata !348, metadata !DIExpression()), !dbg !350
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !351, metadata !DIExpression()), !dbg !352
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !352
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !352
  %13 = load i32, i32* %data21, align 4, !dbg !353
  %cmp22 = icmp sge i32 %13, 0, !dbg !355
  br i1 %cmp22, label %land.lhs.true, label %if.else, !dbg !356

land.lhs.true:                                    ; preds = %if.end20
  %14 = load i32, i32* %data21, align 4, !dbg !357
  %cmp24 = icmp slt i32 %14, 10, !dbg !358
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !359

if.then26:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data21, align 4, !dbg !360
  %idxprom27 = sext i32 %15 to i64, !dbg !362
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !362
  store i32 1, i32* %arrayidx28, align 4, !dbg !363
  store i32 0, i32* %i, align 4, !dbg !364
  br label %for.cond, !dbg !366

for.cond:                                         ; preds = %for.inc, %if.then26
  %16 = load i32, i32* %i, align 4, !dbg !367
  %cmp29 = icmp slt i32 %16, 10, !dbg !369
  br i1 %cmp29, label %for.body, label %for.end, !dbg !370

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !371
  %idxprom31 = sext i32 %17 to i64, !dbg !373
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom31, !dbg !373
  %18 = load i32, i32* %arrayidx32, align 4, !dbg !373
  call void @printIntLine(i32 %18), !dbg !374
  br label %for.inc, !dbg !375

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !376
  %inc = add nsw i32 %19, 1, !dbg !376
  store i32 %inc, i32* %i, align 4, !dbg !376
  br label %for.cond, !dbg !377, !llvm.loop !378

for.end:                                          ; preds = %for.cond
  br label %if.end33, !dbg !380

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !381
  br label %if.end33

if.end33:                                         ; preds = %if.else, %for.end
  ret void, !dbg !383
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_31_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!160 = !DILocalVariable(name: "dataCopy", scope: !161, file: !66, line: 106, type: !71)
!161 = distinct !DILexicalBlock(scope: !65, file: !66, line: 105, column: 5)
!162 = !DILocation(line: 106, column: 13, scope: !161)
!163 = !DILocation(line: 106, column: 24, scope: !161)
!164 = !DILocalVariable(name: "data", scope: !161, file: !66, line: 107, type: !71)
!165 = !DILocation(line: 107, column: 13, scope: !161)
!166 = !DILocation(line: 107, column: 20, scope: !161)
!167 = !DILocalVariable(name: "i", scope: !168, file: !66, line: 109, type: !71)
!168 = distinct !DILexicalBlock(scope: !161, file: !66, line: 108, column: 9)
!169 = !DILocation(line: 109, column: 17, scope: !168)
!170 = !DILocalVariable(name: "buffer", scope: !168, file: !66, line: 110, type: !171)
!171 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !172)
!172 = !{!173}
!173 = !DISubrange(count: 10)
!174 = !DILocation(line: 110, column: 17, scope: !168)
!175 = !DILocation(line: 113, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !168, file: !66, line: 113, column: 17)
!177 = !DILocation(line: 113, column: 22, scope: !176)
!178 = !DILocation(line: 113, column: 17, scope: !168)
!179 = !DILocation(line: 115, column: 24, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !66, line: 114, column: 13)
!181 = !DILocation(line: 115, column: 17, scope: !180)
!182 = !DILocation(line: 115, column: 30, scope: !180)
!183 = !DILocation(line: 117, column: 23, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !66, line: 117, column: 17)
!185 = !DILocation(line: 117, column: 21, scope: !184)
!186 = !DILocation(line: 117, column: 28, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !66, line: 117, column: 17)
!188 = !DILocation(line: 117, column: 30, scope: !187)
!189 = !DILocation(line: 117, column: 17, scope: !184)
!190 = !DILocation(line: 119, column: 41, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !66, line: 118, column: 17)
!192 = !DILocation(line: 119, column: 34, scope: !191)
!193 = !DILocation(line: 119, column: 21, scope: !191)
!194 = !DILocation(line: 120, column: 17, scope: !191)
!195 = !DILocation(line: 117, column: 37, scope: !187)
!196 = !DILocation(line: 117, column: 17, scope: !187)
!197 = distinct !{!197, !189, !198, !199}
!198 = !DILocation(line: 120, column: 17, scope: !184)
!199 = !{!"llvm.loop.mustprogress"}
!200 = !DILocation(line: 121, column: 13, scope: !180)
!201 = !DILocation(line: 124, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !176, file: !66, line: 123, column: 13)
!203 = !DILocation(line: 128, column: 1, scope: !65)
!204 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_31_good", scope: !66, file: !66, line: 254, type: !67, scopeLine: 255, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!205 = !DILocation(line: 256, column: 5, scope: !204)
!206 = !DILocation(line: 257, column: 5, scope: !204)
!207 = !DILocation(line: 258, column: 1, scope: !204)
!208 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 268, type: !209, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!209 = !DISubroutineType(types: !210)
!210 = !{!71, !71, !211}
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64)
!212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!213 = !DILocalVariable(name: "argc", arg: 1, scope: !208, file: !66, line: 268, type: !71)
!214 = !DILocation(line: 268, column: 14, scope: !208)
!215 = !DILocalVariable(name: "argv", arg: 2, scope: !208, file: !66, line: 268, type: !211)
!216 = !DILocation(line: 268, column: 27, scope: !208)
!217 = !DILocation(line: 271, column: 22, scope: !208)
!218 = !DILocation(line: 271, column: 12, scope: !208)
!219 = !DILocation(line: 271, column: 5, scope: !208)
!220 = !DILocation(line: 273, column: 5, scope: !208)
!221 = !DILocation(line: 274, column: 5, scope: !208)
!222 = !DILocation(line: 275, column: 5, scope: !208)
!223 = !DILocation(line: 278, column: 5, scope: !208)
!224 = !DILocation(line: 279, column: 5, scope: !208)
!225 = !DILocation(line: 280, column: 5, scope: !208)
!226 = !DILocation(line: 282, column: 5, scope: !208)
!227 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 135, type: !67, scopeLine: 136, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!228 = !DILocalVariable(name: "data", scope: !227, file: !66, line: 137, type: !71)
!229 = !DILocation(line: 137, column: 9, scope: !227)
!230 = !DILocation(line: 139, column: 10, scope: !227)
!231 = !DILocation(line: 142, column: 10, scope: !227)
!232 = !DILocalVariable(name: "dataCopy", scope: !233, file: !66, line: 144, type: !71)
!233 = distinct !DILexicalBlock(scope: !227, file: !66, line: 143, column: 5)
!234 = !DILocation(line: 144, column: 13, scope: !233)
!235 = !DILocation(line: 144, column: 24, scope: !233)
!236 = !DILocalVariable(name: "data", scope: !233, file: !66, line: 145, type: !71)
!237 = !DILocation(line: 145, column: 13, scope: !233)
!238 = !DILocation(line: 145, column: 20, scope: !233)
!239 = !DILocalVariable(name: "i", scope: !240, file: !66, line: 147, type: !71)
!240 = distinct !DILexicalBlock(scope: !233, file: !66, line: 146, column: 9)
!241 = !DILocation(line: 147, column: 17, scope: !240)
!242 = !DILocalVariable(name: "buffer", scope: !240, file: !66, line: 148, type: !171)
!243 = !DILocation(line: 148, column: 17, scope: !240)
!244 = !DILocation(line: 151, column: 17, scope: !245)
!245 = distinct !DILexicalBlock(scope: !240, file: !66, line: 151, column: 17)
!246 = !DILocation(line: 151, column: 22, scope: !245)
!247 = !DILocation(line: 151, column: 17, scope: !240)
!248 = !DILocation(line: 153, column: 24, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !66, line: 152, column: 13)
!250 = !DILocation(line: 153, column: 17, scope: !249)
!251 = !DILocation(line: 153, column: 30, scope: !249)
!252 = !DILocation(line: 155, column: 23, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !66, line: 155, column: 17)
!254 = !DILocation(line: 155, column: 21, scope: !253)
!255 = !DILocation(line: 155, column: 28, scope: !256)
!256 = distinct !DILexicalBlock(scope: !253, file: !66, line: 155, column: 17)
!257 = !DILocation(line: 155, column: 30, scope: !256)
!258 = !DILocation(line: 155, column: 17, scope: !253)
!259 = !DILocation(line: 157, column: 41, scope: !260)
!260 = distinct !DILexicalBlock(scope: !256, file: !66, line: 156, column: 17)
!261 = !DILocation(line: 157, column: 34, scope: !260)
!262 = !DILocation(line: 157, column: 21, scope: !260)
!263 = !DILocation(line: 158, column: 17, scope: !260)
!264 = !DILocation(line: 155, column: 37, scope: !256)
!265 = !DILocation(line: 155, column: 17, scope: !256)
!266 = distinct !{!266, !258, !267, !199}
!267 = !DILocation(line: 158, column: 17, scope: !253)
!268 = !DILocation(line: 159, column: 13, scope: !249)
!269 = !DILocation(line: 162, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !245, file: !66, line: 161, column: 13)
!271 = !DILocation(line: 166, column: 1, scope: !227)
!272 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 169, type: !67, scopeLine: 170, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!273 = !DILocalVariable(name: "data", scope: !272, file: !66, line: 171, type: !71)
!274 = !DILocation(line: 171, column: 9, scope: !272)
!275 = !DILocation(line: 173, column: 10, scope: !272)
!276 = !DILocalVariable(name: "recvResult", scope: !277, file: !66, line: 179, type: !71)
!277 = distinct !DILexicalBlock(scope: !272, file: !66, line: 174, column: 5)
!278 = !DILocation(line: 179, column: 13, scope: !277)
!279 = !DILocalVariable(name: "service", scope: !277, file: !66, line: 180, type: !78)
!280 = !DILocation(line: 180, column: 28, scope: !277)
!281 = !DILocalVariable(name: "connectSocket", scope: !277, file: !66, line: 181, type: !71)
!282 = !DILocation(line: 181, column: 16, scope: !277)
!283 = !DILocalVariable(name: "inputBuffer", scope: !277, file: !66, line: 182, type: !55)
!284 = !DILocation(line: 182, column: 14, scope: !277)
!285 = !DILocation(line: 183, column: 9, scope: !277)
!286 = !DILocation(line: 193, column: 29, scope: !287)
!287 = distinct !DILexicalBlock(scope: !277, file: !66, line: 184, column: 9)
!288 = !DILocation(line: 193, column: 27, scope: !287)
!289 = !DILocation(line: 194, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !66, line: 194, column: 17)
!291 = !DILocation(line: 194, column: 31, scope: !290)
!292 = !DILocation(line: 194, column: 17, scope: !287)
!293 = !DILocation(line: 196, column: 17, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !66, line: 195, column: 13)
!295 = !DILocation(line: 198, column: 13, scope: !287)
!296 = !DILocation(line: 199, column: 21, scope: !287)
!297 = !DILocation(line: 199, column: 32, scope: !287)
!298 = !DILocation(line: 200, column: 39, scope: !287)
!299 = !DILocation(line: 200, column: 21, scope: !287)
!300 = !DILocation(line: 200, column: 30, scope: !287)
!301 = !DILocation(line: 200, column: 37, scope: !287)
!302 = !DILocation(line: 201, column: 32, scope: !287)
!303 = !DILocation(line: 201, column: 21, scope: !287)
!304 = !DILocation(line: 201, column: 30, scope: !287)
!305 = !DILocation(line: 202, column: 25, scope: !306)
!306 = distinct !DILexicalBlock(scope: !287, file: !66, line: 202, column: 17)
!307 = !DILocation(line: 202, column: 40, scope: !306)
!308 = !DILocation(line: 202, column: 17, scope: !306)
!309 = !DILocation(line: 202, column: 85, scope: !306)
!310 = !DILocation(line: 202, column: 17, scope: !287)
!311 = !DILocation(line: 204, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !306, file: !66, line: 203, column: 13)
!313 = !DILocation(line: 208, column: 31, scope: !287)
!314 = !DILocation(line: 208, column: 46, scope: !287)
!315 = !DILocation(line: 208, column: 26, scope: !287)
!316 = !DILocation(line: 208, column: 24, scope: !287)
!317 = !DILocation(line: 209, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !287, file: !66, line: 209, column: 17)
!319 = !DILocation(line: 209, column: 28, scope: !318)
!320 = !DILocation(line: 209, column: 44, scope: !318)
!321 = !DILocation(line: 209, column: 47, scope: !318)
!322 = !DILocation(line: 209, column: 58, scope: !318)
!323 = !DILocation(line: 209, column: 17, scope: !287)
!324 = !DILocation(line: 211, column: 17, scope: !325)
!325 = distinct !DILexicalBlock(scope: !318, file: !66, line: 210, column: 13)
!326 = !DILocation(line: 214, column: 25, scope: !287)
!327 = !DILocation(line: 214, column: 13, scope: !287)
!328 = !DILocation(line: 214, column: 37, scope: !287)
!329 = !DILocation(line: 216, column: 25, scope: !287)
!330 = !DILocation(line: 216, column: 20, scope: !287)
!331 = !DILocation(line: 216, column: 18, scope: !287)
!332 = !DILocation(line: 217, column: 9, scope: !287)
!333 = !DILocation(line: 219, column: 13, scope: !334)
!334 = distinct !DILexicalBlock(scope: !277, file: !66, line: 219, column: 13)
!335 = !DILocation(line: 219, column: 27, scope: !334)
!336 = !DILocation(line: 219, column: 13, scope: !277)
!337 = !DILocation(line: 221, column: 26, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !66, line: 220, column: 9)
!339 = !DILocation(line: 221, column: 13, scope: !338)
!340 = !DILocation(line: 222, column: 9, scope: !338)
!341 = !DILocalVariable(name: "dataCopy", scope: !342, file: !66, line: 231, type: !71)
!342 = distinct !DILexicalBlock(scope: !272, file: !66, line: 230, column: 5)
!343 = !DILocation(line: 231, column: 13, scope: !342)
!344 = !DILocation(line: 231, column: 24, scope: !342)
!345 = !DILocalVariable(name: "data", scope: !342, file: !66, line: 232, type: !71)
!346 = !DILocation(line: 232, column: 13, scope: !342)
!347 = !DILocation(line: 232, column: 20, scope: !342)
!348 = !DILocalVariable(name: "i", scope: !349, file: !66, line: 234, type: !71)
!349 = distinct !DILexicalBlock(scope: !342, file: !66, line: 233, column: 9)
!350 = !DILocation(line: 234, column: 17, scope: !349)
!351 = !DILocalVariable(name: "buffer", scope: !349, file: !66, line: 235, type: !171)
!352 = !DILocation(line: 235, column: 17, scope: !349)
!353 = !DILocation(line: 237, column: 17, scope: !354)
!354 = distinct !DILexicalBlock(scope: !349, file: !66, line: 237, column: 17)
!355 = !DILocation(line: 237, column: 22, scope: !354)
!356 = !DILocation(line: 237, column: 27, scope: !354)
!357 = !DILocation(line: 237, column: 30, scope: !354)
!358 = !DILocation(line: 237, column: 35, scope: !354)
!359 = !DILocation(line: 237, column: 17, scope: !349)
!360 = !DILocation(line: 239, column: 24, scope: !361)
!361 = distinct !DILexicalBlock(scope: !354, file: !66, line: 238, column: 13)
!362 = !DILocation(line: 239, column: 17, scope: !361)
!363 = !DILocation(line: 239, column: 30, scope: !361)
!364 = !DILocation(line: 241, column: 23, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !66, line: 241, column: 17)
!366 = !DILocation(line: 241, column: 21, scope: !365)
!367 = !DILocation(line: 241, column: 28, scope: !368)
!368 = distinct !DILexicalBlock(scope: !365, file: !66, line: 241, column: 17)
!369 = !DILocation(line: 241, column: 30, scope: !368)
!370 = !DILocation(line: 241, column: 17, scope: !365)
!371 = !DILocation(line: 243, column: 41, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !66, line: 242, column: 17)
!373 = !DILocation(line: 243, column: 34, scope: !372)
!374 = !DILocation(line: 243, column: 21, scope: !372)
!375 = !DILocation(line: 244, column: 17, scope: !372)
!376 = !DILocation(line: 241, column: 37, scope: !368)
!377 = !DILocation(line: 241, column: 17, scope: !368)
!378 = distinct !{!378, !370, !379, !199}
!379 = !DILocation(line: 244, column: 17, scope: !365)
!380 = !DILocation(line: 245, column: 13, scope: !361)
!381 = !DILocation(line: 248, column: 17, scope: !382)
!382 = distinct !DILexicalBlock(scope: !354, file: !66, line: 247, column: 13)
!383 = !DILocation(line: 252, column: 1, scope: !272)
