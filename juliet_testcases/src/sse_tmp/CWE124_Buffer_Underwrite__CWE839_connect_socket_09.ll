; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_09.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_09_bad() #0 !dbg !65 {
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
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !74
  %tobool = icmp ne i32 %0, 0, !dbg !74
  br i1 %tobool, label %if.then, label %if.end22, !dbg !76

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !77, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !81, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %connectSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %do.body, !dbg !108

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !109
  store i32 %call, i32* %connectSocket, align 4, !dbg !111
  %1 = load i32, i32* %connectSocket, align 4, !dbg !112
  %cmp = icmp eq i32 %1, -1, !dbg !114
  br i1 %cmp, label %if.then1, label %if.end, !dbg !115

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !116

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !118
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !119
  store i16 2, i16* %sin_family, align 4, !dbg !120
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !121
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !122
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !123
  store i32 %call2, i32* %s_addr, align 4, !dbg !124
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !125
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !126
  store i16 %call3, i16* %sin_port, align 2, !dbg !127
  %3 = load i32, i32* %connectSocket, align 4, !dbg !128
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !130
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !131
  %cmp5 = icmp eq i32 %call4, -1, !dbg !132
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !133

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !134

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !136
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !137
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !138
  %conv = trunc i64 %call8 to i32, !dbg !138
  store i32 %conv, i32* %recvResult, align 4, !dbg !139
  %6 = load i32, i32* %recvResult, align 4, !dbg !140
  %cmp9 = icmp eq i32 %6, -1, !dbg !142
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !143

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !144
  %cmp11 = icmp eq i32 %7, 0, !dbg !145
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !146

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !147

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !149
  %idxprom = sext i32 %8 to i64, !dbg !150
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !150
  store i8 0, i8* %arrayidx, align 1, !dbg !151
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !152
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !153
  store i32 %call16, i32* %data, align 4, !dbg !154
  br label %do.end, !dbg !155

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !156
  %cmp17 = icmp ne i32 %9, -1, !dbg !158
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !159

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !160
  %call20 = call i32 @close(i32 %10), !dbg !162
  br label %if.end21, !dbg !163

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !164

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !165
  %tobool23 = icmp ne i32 %11, 0, !dbg !165
  br i1 %tobool23, label %if.then24, label %if.end35, !dbg !167

if.then24:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !168, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !172, metadata !DIExpression()), !dbg !176
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !176
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !176
  %13 = load i32, i32* %data, align 4, !dbg !177
  %cmp25 = icmp slt i32 %13, 10, !dbg !179
  br i1 %cmp25, label %if.then27, label %if.else, !dbg !180

if.then27:                                        ; preds = %if.then24
  %14 = load i32, i32* %data, align 4, !dbg !181
  %idxprom28 = sext i32 %14 to i64, !dbg !183
  %arrayidx29 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom28, !dbg !183
  store i32 1, i32* %arrayidx29, align 4, !dbg !184
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.then27
  %15 = load i32, i32* %i, align 4, !dbg !188
  %cmp30 = icmp slt i32 %15, 10, !dbg !190
  br i1 %cmp30, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %16 = load i32, i32* %i, align 4, !dbg !192
  %idxprom32 = sext i32 %16 to i64, !dbg !194
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !194
  %17 = load i32, i32* %arrayidx33, align 4, !dbg !194
  call void @printIntLine(i32 %17), !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4, !dbg !197
  %inc = add nsw i32 %18, 1, !dbg !197
  store i32 %inc, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  br label %if.end34, !dbg !202

if.else:                                          ; preds = %if.then24
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !203
  br label %if.end34

if.end34:                                         ; preds = %if.else, %for.end
  br label %if.end35, !dbg !205

if.end35:                                         ; preds = %if.end34, %if.end22
  ret void, !dbg !206
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_09_good() #0 !dbg !207 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !225
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_09_good(), !dbg !226
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !227
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !228
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_09_bad(), !dbg !229
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !230
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
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !233, metadata !DIExpression()), !dbg !234
  store i32 -1, i32* %data, align 4, !dbg !235
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !236
  %tobool = icmp ne i32 %0, 0, !dbg !236
  br i1 %tobool, label %if.then, label %if.end22, !dbg !238

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !239, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !243, metadata !DIExpression()), !dbg !244
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !245, metadata !DIExpression()), !dbg !246
  store i32 -1, i32* %connectSocket, align 4, !dbg !246
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !247, metadata !DIExpression()), !dbg !248
  br label %do.body, !dbg !249

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !250
  store i32 %call, i32* %connectSocket, align 4, !dbg !252
  %1 = load i32, i32* %connectSocket, align 4, !dbg !253
  %cmp = icmp eq i32 %1, -1, !dbg !255
  br i1 %cmp, label %if.then1, label %if.end, !dbg !256

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !257

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !259
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !259
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !260
  store i16 2, i16* %sin_family, align 4, !dbg !261
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !262
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !263
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !264
  store i32 %call2, i32* %s_addr, align 4, !dbg !265
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !266
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !267
  store i16 %call3, i16* %sin_port, align 2, !dbg !268
  %3 = load i32, i32* %connectSocket, align 4, !dbg !269
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !271
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !272
  %cmp5 = icmp eq i32 %call4, -1, !dbg !273
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !274

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !275

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !277
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !278
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !279
  %conv = trunc i64 %call8 to i32, !dbg !279
  store i32 %conv, i32* %recvResult, align 4, !dbg !280
  %6 = load i32, i32* %recvResult, align 4, !dbg !281
  %cmp9 = icmp eq i32 %6, -1, !dbg !283
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !284

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !285
  %cmp11 = icmp eq i32 %7, 0, !dbg !286
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !287

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !288

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !290
  %idxprom = sext i32 %8 to i64, !dbg !291
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !291
  store i8 0, i8* %arrayidx, align 1, !dbg !292
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !293
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !294
  store i32 %call16, i32* %data, align 4, !dbg !295
  br label %do.end, !dbg !296

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !297
  %cmp17 = icmp ne i32 %9, -1, !dbg !299
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !300

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !301
  %call20 = call i32 @close(i32 %10), !dbg !303
  br label %if.end21, !dbg !304

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !305

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !306
  %tobool23 = icmp ne i32 %11, 0, !dbg !306
  br i1 %tobool23, label %if.then24, label %if.else, !dbg !308

if.then24:                                        ; preds = %if.end22
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !309
  br label %if.end38, !dbg !311

if.else:                                          ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !312, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !316, metadata !DIExpression()), !dbg !317
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !317
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !317
  %13 = load i32, i32* %data, align 4, !dbg !318
  %cmp25 = icmp sge i32 %13, 0, !dbg !320
  br i1 %cmp25, label %land.lhs.true, label %if.else36, !dbg !321

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32, i32* %data, align 4, !dbg !322
  %cmp27 = icmp slt i32 %14, 10, !dbg !323
  br i1 %cmp27, label %if.then29, label %if.else36, !dbg !324

if.then29:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !325
  %idxprom30 = sext i32 %15 to i64, !dbg !327
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !327
  store i32 1, i32* %arrayidx31, align 4, !dbg !328
  store i32 0, i32* %i, align 4, !dbg !329
  br label %for.cond, !dbg !331

for.cond:                                         ; preds = %for.inc, %if.then29
  %16 = load i32, i32* %i, align 4, !dbg !332
  %cmp32 = icmp slt i32 %16, 10, !dbg !334
  br i1 %cmp32, label %for.body, label %for.end, !dbg !335

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !336
  %idxprom34 = sext i32 %17 to i64, !dbg !338
  %arrayidx35 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom34, !dbg !338
  %18 = load i32, i32* %arrayidx35, align 4, !dbg !338
  call void @printIntLine(i32 %18), !dbg !339
  br label %for.inc, !dbg !340

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !341
  %inc = add nsw i32 %19, 1, !dbg !341
  store i32 %inc, i32* %i, align 4, !dbg !341
  br label %for.cond, !dbg !342, !llvm.loop !343

for.end:                                          ; preds = %for.cond
  br label %if.end37, !dbg !345

if.else36:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !346
  br label %if.end37

if.end37:                                         ; preds = %if.else36, %for.end
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.then24
  ret void, !dbg !348
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !349 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !350, metadata !DIExpression()), !dbg !351
  store i32 -1, i32* %data, align 4, !dbg !352
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !353
  %tobool = icmp ne i32 %0, 0, !dbg !353
  br i1 %tobool, label %if.then, label %if.end22, !dbg !355

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !356, metadata !DIExpression()), !dbg !359
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !360, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !362, metadata !DIExpression()), !dbg !363
  store i32 -1, i32* %connectSocket, align 4, !dbg !363
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !364, metadata !DIExpression()), !dbg !365
  br label %do.body, !dbg !366

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !367
  store i32 %call, i32* %connectSocket, align 4, !dbg !369
  %1 = load i32, i32* %connectSocket, align 4, !dbg !370
  %cmp = icmp eq i32 %1, -1, !dbg !372
  br i1 %cmp, label %if.then1, label %if.end, !dbg !373

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !374

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !376
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !376
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !377
  store i16 2, i16* %sin_family, align 4, !dbg !378
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !379
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !380
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !381
  store i32 %call2, i32* %s_addr, align 4, !dbg !382
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !383
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !384
  store i16 %call3, i16* %sin_port, align 2, !dbg !385
  %3 = load i32, i32* %connectSocket, align 4, !dbg !386
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !388
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !389
  %cmp5 = icmp eq i32 %call4, -1, !dbg !390
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !391

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !392

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !394
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !395
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !396
  %conv = trunc i64 %call8 to i32, !dbg !396
  store i32 %conv, i32* %recvResult, align 4, !dbg !397
  %6 = load i32, i32* %recvResult, align 4, !dbg !398
  %cmp9 = icmp eq i32 %6, -1, !dbg !400
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !401

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !402
  %cmp11 = icmp eq i32 %7, 0, !dbg !403
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !404

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !405

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !407
  %idxprom = sext i32 %8 to i64, !dbg !408
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !408
  store i8 0, i8* %arrayidx, align 1, !dbg !409
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !410
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !411
  store i32 %call16, i32* %data, align 4, !dbg !412
  br label %do.end, !dbg !413

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !414
  %cmp17 = icmp ne i32 %9, -1, !dbg !416
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !417

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !418
  %call20 = call i32 @close(i32 %10), !dbg !420
  br label %if.end21, !dbg !421

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !422

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !423
  %tobool23 = icmp ne i32 %11, 0, !dbg !423
  br i1 %tobool23, label %if.then24, label %if.end37, !dbg !425

if.then24:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !426, metadata !DIExpression()), !dbg !429
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !430, metadata !DIExpression()), !dbg !431
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !431
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !431
  %13 = load i32, i32* %data, align 4, !dbg !432
  %cmp25 = icmp sge i32 %13, 0, !dbg !434
  br i1 %cmp25, label %land.lhs.true, label %if.else, !dbg !435

land.lhs.true:                                    ; preds = %if.then24
  %14 = load i32, i32* %data, align 4, !dbg !436
  %cmp27 = icmp slt i32 %14, 10, !dbg !437
  br i1 %cmp27, label %if.then29, label %if.else, !dbg !438

if.then29:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !439
  %idxprom30 = sext i32 %15 to i64, !dbg !441
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !441
  store i32 1, i32* %arrayidx31, align 4, !dbg !442
  store i32 0, i32* %i, align 4, !dbg !443
  br label %for.cond, !dbg !445

for.cond:                                         ; preds = %for.inc, %if.then29
  %16 = load i32, i32* %i, align 4, !dbg !446
  %cmp32 = icmp slt i32 %16, 10, !dbg !448
  br i1 %cmp32, label %for.body, label %for.end, !dbg !449

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !450
  %idxprom34 = sext i32 %17 to i64, !dbg !452
  %arrayidx35 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom34, !dbg !452
  %18 = load i32, i32* %arrayidx35, align 4, !dbg !452
  call void @printIntLine(i32 %18), !dbg !453
  br label %for.inc, !dbg !454

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !455
  %inc = add nsw i32 %19, 1, !dbg !455
  store i32 %inc, i32* %i, align 4, !dbg !455
  br label %for.cond, !dbg !456, !llvm.loop !457

for.end:                                          ; preds = %for.cond
  br label %if.end36, !dbg !459

if.else:                                          ; preds = %land.lhs.true, %if.then24
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !460
  br label %if.end36

if.end36:                                         ; preds = %if.else, %for.end
  br label %if.end37, !dbg !462

if.end37:                                         ; preds = %if.end36, %if.end22
  ret void, !dbg !463
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !464 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !465, metadata !DIExpression()), !dbg !466
  store i32 -1, i32* %data, align 4, !dbg !467
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !468
  %tobool = icmp ne i32 %0, 0, !dbg !468
  br i1 %tobool, label %if.then, label %if.else, !dbg !470

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !471
  br label %if.end, !dbg !473

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !474
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !476
  %tobool1 = icmp ne i32 %1, 0, !dbg !476
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !478

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !479, metadata !DIExpression()), !dbg !482
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !483, metadata !DIExpression()), !dbg !484
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !484
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !484
  %3 = load i32, i32* %data, align 4, !dbg !485
  %cmp = icmp slt i32 %3, 10, !dbg !487
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !488

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !489
  %idxprom = sext i32 %4 to i64, !dbg !491
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !491
  store i32 1, i32* %arrayidx, align 4, !dbg !492
  store i32 0, i32* %i, align 4, !dbg !493
  br label %for.cond, !dbg !495

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !496
  %cmp4 = icmp slt i32 %5, 10, !dbg !498
  br i1 %cmp4, label %for.body, label %for.end, !dbg !499

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !500
  %idxprom5 = sext i32 %6 to i64, !dbg !502
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !502
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !502
  call void @printIntLine(i32 %7), !dbg !503
  br label %for.inc, !dbg !504

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !505
  %inc = add nsw i32 %8, 1, !dbg !505
  store i32 %inc, i32* %i, align 4, !dbg !505
  br label %for.cond, !dbg !506, !llvm.loop !507

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !509

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !510
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !512

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !513
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !514 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !515, metadata !DIExpression()), !dbg !516
  store i32 -1, i32* %data, align 4, !dbg !517
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !518
  %tobool = icmp ne i32 %0, 0, !dbg !518
  br i1 %tobool, label %if.then, label %if.end, !dbg !520

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !521
  br label %if.end, !dbg !523

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !524
  %tobool1 = icmp ne i32 %1, 0, !dbg !524
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !526

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !527, metadata !DIExpression()), !dbg !530
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !531, metadata !DIExpression()), !dbg !532
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !532
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !532
  %3 = load i32, i32* %data, align 4, !dbg !533
  %cmp = icmp slt i32 %3, 10, !dbg !535
  br i1 %cmp, label %if.then3, label %if.else, !dbg !536

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !537
  %idxprom = sext i32 %4 to i64, !dbg !539
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !539
  store i32 1, i32* %arrayidx, align 4, !dbg !540
  store i32 0, i32* %i, align 4, !dbg !541
  br label %for.cond, !dbg !543

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !544
  %cmp4 = icmp slt i32 %5, 10, !dbg !546
  br i1 %cmp4, label %for.body, label %for.end, !dbg !547

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !548
  %idxprom5 = sext i32 %6 to i64, !dbg !550
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !550
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !550
  call void @printIntLine(i32 %7), !dbg !551
  br label %for.inc, !dbg !552

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !553
  %inc = add nsw i32 %8, 1, !dbg !553
  store i32 %inc, i32* %i, align 4, !dbg !553
  br label %for.cond, !dbg !554, !llvm.loop !555

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !557

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !558
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !560

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !561
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_09_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_09.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocation(line: 49, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 49, column: 8)
!76 = !DILocation(line: 49, column: 8, scope: !65)
!77 = !DILocalVariable(name: "recvResult", scope: !78, file: !66, line: 56, type: !71)
!78 = distinct !DILexicalBlock(scope: !79, file: !66, line: 51, column: 9)
!79 = distinct !DILexicalBlock(scope: !75, file: !66, line: 50, column: 5)
!80 = !DILocation(line: 56, column: 17, scope: !78)
!81 = !DILocalVariable(name: "service", scope: !78, file: !66, line: 57, type: !82)
!82 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !83)
!83 = !{!84, !85, !91, !98}
!84 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !82, file: !17, line: 240, baseType: !51, size: 16)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !82, file: !17, line: 241, baseType: !86, size: 16, offset: 16)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !88, line: 25, baseType: !89)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !90, line: 40, baseType: !53)
!90 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !82, file: !17, line: 242, baseType: !92, size: 32, offset: 32)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !93)
!93 = !{!94}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !92, file: !17, line: 33, baseType: !95, size: 32)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !88, line: 26, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !90, line: 42, baseType: !5)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !82, file: !17, line: 245, baseType: !99, size: 64, offset: 64)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 64, elements: !101)
!100 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!101 = !{!102}
!102 = !DISubrange(count: 8)
!103 = !DILocation(line: 57, column: 32, scope: !78)
!104 = !DILocalVariable(name: "connectSocket", scope: !78, file: !66, line: 58, type: !71)
!105 = !DILocation(line: 58, column: 20, scope: !78)
!106 = !DILocalVariable(name: "inputBuffer", scope: !78, file: !66, line: 59, type: !55)
!107 = !DILocation(line: 59, column: 18, scope: !78)
!108 = !DILocation(line: 60, column: 13, scope: !78)
!109 = !DILocation(line: 70, column: 33, scope: !110)
!110 = distinct !DILexicalBlock(scope: !78, file: !66, line: 61, column: 13)
!111 = !DILocation(line: 70, column: 31, scope: !110)
!112 = !DILocation(line: 71, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !66, line: 71, column: 21)
!114 = !DILocation(line: 71, column: 35, scope: !113)
!115 = !DILocation(line: 71, column: 21, scope: !110)
!116 = !DILocation(line: 73, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !66, line: 72, column: 17)
!118 = !DILocation(line: 75, column: 17, scope: !110)
!119 = !DILocation(line: 76, column: 25, scope: !110)
!120 = !DILocation(line: 76, column: 36, scope: !110)
!121 = !DILocation(line: 77, column: 43, scope: !110)
!122 = !DILocation(line: 77, column: 25, scope: !110)
!123 = !DILocation(line: 77, column: 34, scope: !110)
!124 = !DILocation(line: 77, column: 41, scope: !110)
!125 = !DILocation(line: 78, column: 36, scope: !110)
!126 = !DILocation(line: 78, column: 25, scope: !110)
!127 = !DILocation(line: 78, column: 34, scope: !110)
!128 = !DILocation(line: 79, column: 29, scope: !129)
!129 = distinct !DILexicalBlock(scope: !110, file: !66, line: 79, column: 21)
!130 = !DILocation(line: 79, column: 44, scope: !129)
!131 = !DILocation(line: 79, column: 21, scope: !129)
!132 = !DILocation(line: 79, column: 89, scope: !129)
!133 = !DILocation(line: 79, column: 21, scope: !110)
!134 = !DILocation(line: 81, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !66, line: 80, column: 17)
!136 = !DILocation(line: 85, column: 35, scope: !110)
!137 = !DILocation(line: 85, column: 50, scope: !110)
!138 = !DILocation(line: 85, column: 30, scope: !110)
!139 = !DILocation(line: 85, column: 28, scope: !110)
!140 = !DILocation(line: 86, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !110, file: !66, line: 86, column: 21)
!142 = !DILocation(line: 86, column: 32, scope: !141)
!143 = !DILocation(line: 86, column: 48, scope: !141)
!144 = !DILocation(line: 86, column: 51, scope: !141)
!145 = !DILocation(line: 86, column: 62, scope: !141)
!146 = !DILocation(line: 86, column: 21, scope: !110)
!147 = !DILocation(line: 88, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !141, file: !66, line: 87, column: 17)
!149 = !DILocation(line: 91, column: 29, scope: !110)
!150 = !DILocation(line: 91, column: 17, scope: !110)
!151 = !DILocation(line: 91, column: 41, scope: !110)
!152 = !DILocation(line: 93, column: 29, scope: !110)
!153 = !DILocation(line: 93, column: 24, scope: !110)
!154 = !DILocation(line: 93, column: 22, scope: !110)
!155 = !DILocation(line: 94, column: 13, scope: !110)
!156 = !DILocation(line: 96, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !78, file: !66, line: 96, column: 17)
!158 = !DILocation(line: 96, column: 31, scope: !157)
!159 = !DILocation(line: 96, column: 17, scope: !78)
!160 = !DILocation(line: 98, column: 30, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !66, line: 97, column: 13)
!162 = !DILocation(line: 98, column: 17, scope: !161)
!163 = !DILocation(line: 99, column: 13, scope: !161)
!164 = !DILocation(line: 107, column: 5, scope: !79)
!165 = !DILocation(line: 108, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !65, file: !66, line: 108, column: 8)
!167 = !DILocation(line: 108, column: 8, scope: !65)
!168 = !DILocalVariable(name: "i", scope: !169, file: !66, line: 111, type: !71)
!169 = distinct !DILexicalBlock(scope: !170, file: !66, line: 110, column: 9)
!170 = distinct !DILexicalBlock(scope: !166, file: !66, line: 109, column: 5)
!171 = !DILocation(line: 111, column: 17, scope: !169)
!172 = !DILocalVariable(name: "buffer", scope: !169, file: !66, line: 112, type: !173)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !174)
!174 = !{!175}
!175 = !DISubrange(count: 10)
!176 = !DILocation(line: 112, column: 17, scope: !169)
!177 = !DILocation(line: 115, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !66, line: 115, column: 17)
!179 = !DILocation(line: 115, column: 22, scope: !178)
!180 = !DILocation(line: 115, column: 17, scope: !169)
!181 = !DILocation(line: 117, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !66, line: 116, column: 13)
!183 = !DILocation(line: 117, column: 17, scope: !182)
!184 = !DILocation(line: 117, column: 30, scope: !182)
!185 = !DILocation(line: 119, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !66, line: 119, column: 17)
!187 = !DILocation(line: 119, column: 21, scope: !186)
!188 = !DILocation(line: 119, column: 28, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !66, line: 119, column: 17)
!190 = !DILocation(line: 119, column: 30, scope: !189)
!191 = !DILocation(line: 119, column: 17, scope: !186)
!192 = !DILocation(line: 121, column: 41, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !66, line: 120, column: 17)
!194 = !DILocation(line: 121, column: 34, scope: !193)
!195 = !DILocation(line: 121, column: 21, scope: !193)
!196 = !DILocation(line: 122, column: 17, scope: !193)
!197 = !DILocation(line: 119, column: 37, scope: !189)
!198 = !DILocation(line: 119, column: 17, scope: !189)
!199 = distinct !{!199, !191, !200, !201}
!200 = !DILocation(line: 122, column: 17, scope: !186)
!201 = !{!"llvm.loop.mustprogress"}
!202 = !DILocation(line: 123, column: 13, scope: !182)
!203 = !DILocation(line: 126, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !178, file: !66, line: 125, column: 13)
!205 = !DILocation(line: 129, column: 5, scope: !170)
!206 = !DILocation(line: 130, column: 1, scope: !65)
!207 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_09_good", scope: !66, file: !66, line: 394, type: !67, scopeLine: 395, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!208 = !DILocation(line: 396, column: 5, scope: !207)
!209 = !DILocation(line: 397, column: 5, scope: !207)
!210 = !DILocation(line: 398, column: 5, scope: !207)
!211 = !DILocation(line: 399, column: 5, scope: !207)
!212 = !DILocation(line: 400, column: 1, scope: !207)
!213 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 411, type: !214, scopeLine: 412, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!214 = !DISubroutineType(types: !215)
!215 = !{!71, !71, !216}
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64)
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!218 = !DILocalVariable(name: "argc", arg: 1, scope: !213, file: !66, line: 411, type: !71)
!219 = !DILocation(line: 411, column: 14, scope: !213)
!220 = !DILocalVariable(name: "argv", arg: 2, scope: !213, file: !66, line: 411, type: !216)
!221 = !DILocation(line: 411, column: 27, scope: !213)
!222 = !DILocation(line: 414, column: 22, scope: !213)
!223 = !DILocation(line: 414, column: 12, scope: !213)
!224 = !DILocation(line: 414, column: 5, scope: !213)
!225 = !DILocation(line: 416, column: 5, scope: !213)
!226 = !DILocation(line: 417, column: 5, scope: !213)
!227 = !DILocation(line: 418, column: 5, scope: !213)
!228 = !DILocation(line: 421, column: 5, scope: !213)
!229 = !DILocation(line: 422, column: 5, scope: !213)
!230 = !DILocation(line: 423, column: 5, scope: !213)
!231 = !DILocation(line: 425, column: 5, scope: !213)
!232 = distinct !DISubprogram(name: "goodB2G1", scope: !66, file: !66, line: 137, type: !67, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!233 = !DILocalVariable(name: "data", scope: !232, file: !66, line: 139, type: !71)
!234 = !DILocation(line: 139, column: 9, scope: !232)
!235 = !DILocation(line: 141, column: 10, scope: !232)
!236 = !DILocation(line: 142, column: 8, scope: !237)
!237 = distinct !DILexicalBlock(scope: !232, file: !66, line: 142, column: 8)
!238 = !DILocation(line: 142, column: 8, scope: !232)
!239 = !DILocalVariable(name: "recvResult", scope: !240, file: !66, line: 149, type: !71)
!240 = distinct !DILexicalBlock(scope: !241, file: !66, line: 144, column: 9)
!241 = distinct !DILexicalBlock(scope: !237, file: !66, line: 143, column: 5)
!242 = !DILocation(line: 149, column: 17, scope: !240)
!243 = !DILocalVariable(name: "service", scope: !240, file: !66, line: 150, type: !82)
!244 = !DILocation(line: 150, column: 32, scope: !240)
!245 = !DILocalVariable(name: "connectSocket", scope: !240, file: !66, line: 151, type: !71)
!246 = !DILocation(line: 151, column: 20, scope: !240)
!247 = !DILocalVariable(name: "inputBuffer", scope: !240, file: !66, line: 152, type: !55)
!248 = !DILocation(line: 152, column: 18, scope: !240)
!249 = !DILocation(line: 153, column: 13, scope: !240)
!250 = !DILocation(line: 163, column: 33, scope: !251)
!251 = distinct !DILexicalBlock(scope: !240, file: !66, line: 154, column: 13)
!252 = !DILocation(line: 163, column: 31, scope: !251)
!253 = !DILocation(line: 164, column: 21, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !66, line: 164, column: 21)
!255 = !DILocation(line: 164, column: 35, scope: !254)
!256 = !DILocation(line: 164, column: 21, scope: !251)
!257 = !DILocation(line: 166, column: 21, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !66, line: 165, column: 17)
!259 = !DILocation(line: 168, column: 17, scope: !251)
!260 = !DILocation(line: 169, column: 25, scope: !251)
!261 = !DILocation(line: 169, column: 36, scope: !251)
!262 = !DILocation(line: 170, column: 43, scope: !251)
!263 = !DILocation(line: 170, column: 25, scope: !251)
!264 = !DILocation(line: 170, column: 34, scope: !251)
!265 = !DILocation(line: 170, column: 41, scope: !251)
!266 = !DILocation(line: 171, column: 36, scope: !251)
!267 = !DILocation(line: 171, column: 25, scope: !251)
!268 = !DILocation(line: 171, column: 34, scope: !251)
!269 = !DILocation(line: 172, column: 29, scope: !270)
!270 = distinct !DILexicalBlock(scope: !251, file: !66, line: 172, column: 21)
!271 = !DILocation(line: 172, column: 44, scope: !270)
!272 = !DILocation(line: 172, column: 21, scope: !270)
!273 = !DILocation(line: 172, column: 89, scope: !270)
!274 = !DILocation(line: 172, column: 21, scope: !251)
!275 = !DILocation(line: 174, column: 21, scope: !276)
!276 = distinct !DILexicalBlock(scope: !270, file: !66, line: 173, column: 17)
!277 = !DILocation(line: 178, column: 35, scope: !251)
!278 = !DILocation(line: 178, column: 50, scope: !251)
!279 = !DILocation(line: 178, column: 30, scope: !251)
!280 = !DILocation(line: 178, column: 28, scope: !251)
!281 = !DILocation(line: 179, column: 21, scope: !282)
!282 = distinct !DILexicalBlock(scope: !251, file: !66, line: 179, column: 21)
!283 = !DILocation(line: 179, column: 32, scope: !282)
!284 = !DILocation(line: 179, column: 48, scope: !282)
!285 = !DILocation(line: 179, column: 51, scope: !282)
!286 = !DILocation(line: 179, column: 62, scope: !282)
!287 = !DILocation(line: 179, column: 21, scope: !251)
!288 = !DILocation(line: 181, column: 21, scope: !289)
!289 = distinct !DILexicalBlock(scope: !282, file: !66, line: 180, column: 17)
!290 = !DILocation(line: 184, column: 29, scope: !251)
!291 = !DILocation(line: 184, column: 17, scope: !251)
!292 = !DILocation(line: 184, column: 41, scope: !251)
!293 = !DILocation(line: 186, column: 29, scope: !251)
!294 = !DILocation(line: 186, column: 24, scope: !251)
!295 = !DILocation(line: 186, column: 22, scope: !251)
!296 = !DILocation(line: 187, column: 13, scope: !251)
!297 = !DILocation(line: 189, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !240, file: !66, line: 189, column: 17)
!299 = !DILocation(line: 189, column: 31, scope: !298)
!300 = !DILocation(line: 189, column: 17, scope: !240)
!301 = !DILocation(line: 191, column: 30, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !66, line: 190, column: 13)
!303 = !DILocation(line: 191, column: 17, scope: !302)
!304 = !DILocation(line: 192, column: 13, scope: !302)
!305 = !DILocation(line: 200, column: 5, scope: !241)
!306 = !DILocation(line: 201, column: 8, scope: !307)
!307 = distinct !DILexicalBlock(scope: !232, file: !66, line: 201, column: 8)
!308 = !DILocation(line: 201, column: 8, scope: !232)
!309 = !DILocation(line: 204, column: 9, scope: !310)
!310 = distinct !DILexicalBlock(scope: !307, file: !66, line: 202, column: 5)
!311 = !DILocation(line: 205, column: 5, scope: !310)
!312 = !DILocalVariable(name: "i", scope: !313, file: !66, line: 209, type: !71)
!313 = distinct !DILexicalBlock(scope: !314, file: !66, line: 208, column: 9)
!314 = distinct !DILexicalBlock(scope: !307, file: !66, line: 207, column: 5)
!315 = !DILocation(line: 209, column: 17, scope: !313)
!316 = !DILocalVariable(name: "buffer", scope: !313, file: !66, line: 210, type: !173)
!317 = !DILocation(line: 210, column: 17, scope: !313)
!318 = !DILocation(line: 212, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !313, file: !66, line: 212, column: 17)
!320 = !DILocation(line: 212, column: 22, scope: !319)
!321 = !DILocation(line: 212, column: 27, scope: !319)
!322 = !DILocation(line: 212, column: 30, scope: !319)
!323 = !DILocation(line: 212, column: 35, scope: !319)
!324 = !DILocation(line: 212, column: 17, scope: !313)
!325 = !DILocation(line: 214, column: 24, scope: !326)
!326 = distinct !DILexicalBlock(scope: !319, file: !66, line: 213, column: 13)
!327 = !DILocation(line: 214, column: 17, scope: !326)
!328 = !DILocation(line: 214, column: 30, scope: !326)
!329 = !DILocation(line: 216, column: 23, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !66, line: 216, column: 17)
!331 = !DILocation(line: 216, column: 21, scope: !330)
!332 = !DILocation(line: 216, column: 28, scope: !333)
!333 = distinct !DILexicalBlock(scope: !330, file: !66, line: 216, column: 17)
!334 = !DILocation(line: 216, column: 30, scope: !333)
!335 = !DILocation(line: 216, column: 17, scope: !330)
!336 = !DILocation(line: 218, column: 41, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !66, line: 217, column: 17)
!338 = !DILocation(line: 218, column: 34, scope: !337)
!339 = !DILocation(line: 218, column: 21, scope: !337)
!340 = !DILocation(line: 219, column: 17, scope: !337)
!341 = !DILocation(line: 216, column: 37, scope: !333)
!342 = !DILocation(line: 216, column: 17, scope: !333)
!343 = distinct !{!343, !335, !344, !201}
!344 = !DILocation(line: 219, column: 17, scope: !330)
!345 = !DILocation(line: 220, column: 13, scope: !326)
!346 = !DILocation(line: 223, column: 17, scope: !347)
!347 = distinct !DILexicalBlock(scope: !319, file: !66, line: 222, column: 13)
!348 = !DILocation(line: 227, column: 1, scope: !232)
!349 = distinct !DISubprogram(name: "goodB2G2", scope: !66, file: !66, line: 230, type: !67, scopeLine: 231, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!350 = !DILocalVariable(name: "data", scope: !349, file: !66, line: 232, type: !71)
!351 = !DILocation(line: 232, column: 9, scope: !349)
!352 = !DILocation(line: 234, column: 10, scope: !349)
!353 = !DILocation(line: 235, column: 8, scope: !354)
!354 = distinct !DILexicalBlock(scope: !349, file: !66, line: 235, column: 8)
!355 = !DILocation(line: 235, column: 8, scope: !349)
!356 = !DILocalVariable(name: "recvResult", scope: !357, file: !66, line: 242, type: !71)
!357 = distinct !DILexicalBlock(scope: !358, file: !66, line: 237, column: 9)
!358 = distinct !DILexicalBlock(scope: !354, file: !66, line: 236, column: 5)
!359 = !DILocation(line: 242, column: 17, scope: !357)
!360 = !DILocalVariable(name: "service", scope: !357, file: !66, line: 243, type: !82)
!361 = !DILocation(line: 243, column: 32, scope: !357)
!362 = !DILocalVariable(name: "connectSocket", scope: !357, file: !66, line: 244, type: !71)
!363 = !DILocation(line: 244, column: 20, scope: !357)
!364 = !DILocalVariable(name: "inputBuffer", scope: !357, file: !66, line: 245, type: !55)
!365 = !DILocation(line: 245, column: 18, scope: !357)
!366 = !DILocation(line: 246, column: 13, scope: !357)
!367 = !DILocation(line: 256, column: 33, scope: !368)
!368 = distinct !DILexicalBlock(scope: !357, file: !66, line: 247, column: 13)
!369 = !DILocation(line: 256, column: 31, scope: !368)
!370 = !DILocation(line: 257, column: 21, scope: !371)
!371 = distinct !DILexicalBlock(scope: !368, file: !66, line: 257, column: 21)
!372 = !DILocation(line: 257, column: 35, scope: !371)
!373 = !DILocation(line: 257, column: 21, scope: !368)
!374 = !DILocation(line: 259, column: 21, scope: !375)
!375 = distinct !DILexicalBlock(scope: !371, file: !66, line: 258, column: 17)
!376 = !DILocation(line: 261, column: 17, scope: !368)
!377 = !DILocation(line: 262, column: 25, scope: !368)
!378 = !DILocation(line: 262, column: 36, scope: !368)
!379 = !DILocation(line: 263, column: 43, scope: !368)
!380 = !DILocation(line: 263, column: 25, scope: !368)
!381 = !DILocation(line: 263, column: 34, scope: !368)
!382 = !DILocation(line: 263, column: 41, scope: !368)
!383 = !DILocation(line: 264, column: 36, scope: !368)
!384 = !DILocation(line: 264, column: 25, scope: !368)
!385 = !DILocation(line: 264, column: 34, scope: !368)
!386 = !DILocation(line: 265, column: 29, scope: !387)
!387 = distinct !DILexicalBlock(scope: !368, file: !66, line: 265, column: 21)
!388 = !DILocation(line: 265, column: 44, scope: !387)
!389 = !DILocation(line: 265, column: 21, scope: !387)
!390 = !DILocation(line: 265, column: 89, scope: !387)
!391 = !DILocation(line: 265, column: 21, scope: !368)
!392 = !DILocation(line: 267, column: 21, scope: !393)
!393 = distinct !DILexicalBlock(scope: !387, file: !66, line: 266, column: 17)
!394 = !DILocation(line: 271, column: 35, scope: !368)
!395 = !DILocation(line: 271, column: 50, scope: !368)
!396 = !DILocation(line: 271, column: 30, scope: !368)
!397 = !DILocation(line: 271, column: 28, scope: !368)
!398 = !DILocation(line: 272, column: 21, scope: !399)
!399 = distinct !DILexicalBlock(scope: !368, file: !66, line: 272, column: 21)
!400 = !DILocation(line: 272, column: 32, scope: !399)
!401 = !DILocation(line: 272, column: 48, scope: !399)
!402 = !DILocation(line: 272, column: 51, scope: !399)
!403 = !DILocation(line: 272, column: 62, scope: !399)
!404 = !DILocation(line: 272, column: 21, scope: !368)
!405 = !DILocation(line: 274, column: 21, scope: !406)
!406 = distinct !DILexicalBlock(scope: !399, file: !66, line: 273, column: 17)
!407 = !DILocation(line: 277, column: 29, scope: !368)
!408 = !DILocation(line: 277, column: 17, scope: !368)
!409 = !DILocation(line: 277, column: 41, scope: !368)
!410 = !DILocation(line: 279, column: 29, scope: !368)
!411 = !DILocation(line: 279, column: 24, scope: !368)
!412 = !DILocation(line: 279, column: 22, scope: !368)
!413 = !DILocation(line: 280, column: 13, scope: !368)
!414 = !DILocation(line: 282, column: 17, scope: !415)
!415 = distinct !DILexicalBlock(scope: !357, file: !66, line: 282, column: 17)
!416 = !DILocation(line: 282, column: 31, scope: !415)
!417 = !DILocation(line: 282, column: 17, scope: !357)
!418 = !DILocation(line: 284, column: 30, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !66, line: 283, column: 13)
!420 = !DILocation(line: 284, column: 17, scope: !419)
!421 = !DILocation(line: 285, column: 13, scope: !419)
!422 = !DILocation(line: 293, column: 5, scope: !358)
!423 = !DILocation(line: 294, column: 8, scope: !424)
!424 = distinct !DILexicalBlock(scope: !349, file: !66, line: 294, column: 8)
!425 = !DILocation(line: 294, column: 8, scope: !349)
!426 = !DILocalVariable(name: "i", scope: !427, file: !66, line: 297, type: !71)
!427 = distinct !DILexicalBlock(scope: !428, file: !66, line: 296, column: 9)
!428 = distinct !DILexicalBlock(scope: !424, file: !66, line: 295, column: 5)
!429 = !DILocation(line: 297, column: 17, scope: !427)
!430 = !DILocalVariable(name: "buffer", scope: !427, file: !66, line: 298, type: !173)
!431 = !DILocation(line: 298, column: 17, scope: !427)
!432 = !DILocation(line: 300, column: 17, scope: !433)
!433 = distinct !DILexicalBlock(scope: !427, file: !66, line: 300, column: 17)
!434 = !DILocation(line: 300, column: 22, scope: !433)
!435 = !DILocation(line: 300, column: 27, scope: !433)
!436 = !DILocation(line: 300, column: 30, scope: !433)
!437 = !DILocation(line: 300, column: 35, scope: !433)
!438 = !DILocation(line: 300, column: 17, scope: !427)
!439 = !DILocation(line: 302, column: 24, scope: !440)
!440 = distinct !DILexicalBlock(scope: !433, file: !66, line: 301, column: 13)
!441 = !DILocation(line: 302, column: 17, scope: !440)
!442 = !DILocation(line: 302, column: 30, scope: !440)
!443 = !DILocation(line: 304, column: 23, scope: !444)
!444 = distinct !DILexicalBlock(scope: !440, file: !66, line: 304, column: 17)
!445 = !DILocation(line: 304, column: 21, scope: !444)
!446 = !DILocation(line: 304, column: 28, scope: !447)
!447 = distinct !DILexicalBlock(scope: !444, file: !66, line: 304, column: 17)
!448 = !DILocation(line: 304, column: 30, scope: !447)
!449 = !DILocation(line: 304, column: 17, scope: !444)
!450 = !DILocation(line: 306, column: 41, scope: !451)
!451 = distinct !DILexicalBlock(scope: !447, file: !66, line: 305, column: 17)
!452 = !DILocation(line: 306, column: 34, scope: !451)
!453 = !DILocation(line: 306, column: 21, scope: !451)
!454 = !DILocation(line: 307, column: 17, scope: !451)
!455 = !DILocation(line: 304, column: 37, scope: !447)
!456 = !DILocation(line: 304, column: 17, scope: !447)
!457 = distinct !{!457, !449, !458, !201}
!458 = !DILocation(line: 307, column: 17, scope: !444)
!459 = !DILocation(line: 308, column: 13, scope: !440)
!460 = !DILocation(line: 311, column: 17, scope: !461)
!461 = distinct !DILexicalBlock(scope: !433, file: !66, line: 310, column: 13)
!462 = !DILocation(line: 314, column: 5, scope: !428)
!463 = !DILocation(line: 315, column: 1, scope: !349)
!464 = distinct !DISubprogram(name: "goodG2B1", scope: !66, file: !66, line: 318, type: !67, scopeLine: 319, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!465 = !DILocalVariable(name: "data", scope: !464, file: !66, line: 320, type: !71)
!466 = !DILocation(line: 320, column: 9, scope: !464)
!467 = !DILocation(line: 322, column: 10, scope: !464)
!468 = !DILocation(line: 323, column: 8, scope: !469)
!469 = distinct !DILexicalBlock(scope: !464, file: !66, line: 323, column: 8)
!470 = !DILocation(line: 323, column: 8, scope: !464)
!471 = !DILocation(line: 326, column: 9, scope: !472)
!472 = distinct !DILexicalBlock(scope: !469, file: !66, line: 324, column: 5)
!473 = !DILocation(line: 327, column: 5, scope: !472)
!474 = !DILocation(line: 332, column: 14, scope: !475)
!475 = distinct !DILexicalBlock(scope: !469, file: !66, line: 329, column: 5)
!476 = !DILocation(line: 334, column: 8, scope: !477)
!477 = distinct !DILexicalBlock(scope: !464, file: !66, line: 334, column: 8)
!478 = !DILocation(line: 334, column: 8, scope: !464)
!479 = !DILocalVariable(name: "i", scope: !480, file: !66, line: 337, type: !71)
!480 = distinct !DILexicalBlock(scope: !481, file: !66, line: 336, column: 9)
!481 = distinct !DILexicalBlock(scope: !477, file: !66, line: 335, column: 5)
!482 = !DILocation(line: 337, column: 17, scope: !480)
!483 = !DILocalVariable(name: "buffer", scope: !480, file: !66, line: 338, type: !173)
!484 = !DILocation(line: 338, column: 17, scope: !480)
!485 = !DILocation(line: 341, column: 17, scope: !486)
!486 = distinct !DILexicalBlock(scope: !480, file: !66, line: 341, column: 17)
!487 = !DILocation(line: 341, column: 22, scope: !486)
!488 = !DILocation(line: 341, column: 17, scope: !480)
!489 = !DILocation(line: 343, column: 24, scope: !490)
!490 = distinct !DILexicalBlock(scope: !486, file: !66, line: 342, column: 13)
!491 = !DILocation(line: 343, column: 17, scope: !490)
!492 = !DILocation(line: 343, column: 30, scope: !490)
!493 = !DILocation(line: 345, column: 23, scope: !494)
!494 = distinct !DILexicalBlock(scope: !490, file: !66, line: 345, column: 17)
!495 = !DILocation(line: 345, column: 21, scope: !494)
!496 = !DILocation(line: 345, column: 28, scope: !497)
!497 = distinct !DILexicalBlock(scope: !494, file: !66, line: 345, column: 17)
!498 = !DILocation(line: 345, column: 30, scope: !497)
!499 = !DILocation(line: 345, column: 17, scope: !494)
!500 = !DILocation(line: 347, column: 41, scope: !501)
!501 = distinct !DILexicalBlock(scope: !497, file: !66, line: 346, column: 17)
!502 = !DILocation(line: 347, column: 34, scope: !501)
!503 = !DILocation(line: 347, column: 21, scope: !501)
!504 = !DILocation(line: 348, column: 17, scope: !501)
!505 = !DILocation(line: 345, column: 37, scope: !497)
!506 = !DILocation(line: 345, column: 17, scope: !497)
!507 = distinct !{!507, !499, !508, !201}
!508 = !DILocation(line: 348, column: 17, scope: !494)
!509 = !DILocation(line: 349, column: 13, scope: !490)
!510 = !DILocation(line: 352, column: 17, scope: !511)
!511 = distinct !DILexicalBlock(scope: !486, file: !66, line: 351, column: 13)
!512 = !DILocation(line: 355, column: 5, scope: !481)
!513 = !DILocation(line: 356, column: 1, scope: !464)
!514 = distinct !DISubprogram(name: "goodG2B2", scope: !66, file: !66, line: 359, type: !67, scopeLine: 360, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!515 = !DILocalVariable(name: "data", scope: !514, file: !66, line: 361, type: !71)
!516 = !DILocation(line: 361, column: 9, scope: !514)
!517 = !DILocation(line: 363, column: 10, scope: !514)
!518 = !DILocation(line: 364, column: 8, scope: !519)
!519 = distinct !DILexicalBlock(scope: !514, file: !66, line: 364, column: 8)
!520 = !DILocation(line: 364, column: 8, scope: !514)
!521 = !DILocation(line: 368, column: 14, scope: !522)
!522 = distinct !DILexicalBlock(scope: !519, file: !66, line: 365, column: 5)
!523 = !DILocation(line: 369, column: 5, scope: !522)
!524 = !DILocation(line: 370, column: 8, scope: !525)
!525 = distinct !DILexicalBlock(scope: !514, file: !66, line: 370, column: 8)
!526 = !DILocation(line: 370, column: 8, scope: !514)
!527 = !DILocalVariable(name: "i", scope: !528, file: !66, line: 373, type: !71)
!528 = distinct !DILexicalBlock(scope: !529, file: !66, line: 372, column: 9)
!529 = distinct !DILexicalBlock(scope: !525, file: !66, line: 371, column: 5)
!530 = !DILocation(line: 373, column: 17, scope: !528)
!531 = !DILocalVariable(name: "buffer", scope: !528, file: !66, line: 374, type: !173)
!532 = !DILocation(line: 374, column: 17, scope: !528)
!533 = !DILocation(line: 377, column: 17, scope: !534)
!534 = distinct !DILexicalBlock(scope: !528, file: !66, line: 377, column: 17)
!535 = !DILocation(line: 377, column: 22, scope: !534)
!536 = !DILocation(line: 377, column: 17, scope: !528)
!537 = !DILocation(line: 379, column: 24, scope: !538)
!538 = distinct !DILexicalBlock(scope: !534, file: !66, line: 378, column: 13)
!539 = !DILocation(line: 379, column: 17, scope: !538)
!540 = !DILocation(line: 379, column: 30, scope: !538)
!541 = !DILocation(line: 381, column: 23, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !66, line: 381, column: 17)
!543 = !DILocation(line: 381, column: 21, scope: !542)
!544 = !DILocation(line: 381, column: 28, scope: !545)
!545 = distinct !DILexicalBlock(scope: !542, file: !66, line: 381, column: 17)
!546 = !DILocation(line: 381, column: 30, scope: !545)
!547 = !DILocation(line: 381, column: 17, scope: !542)
!548 = !DILocation(line: 383, column: 41, scope: !549)
!549 = distinct !DILexicalBlock(scope: !545, file: !66, line: 382, column: 17)
!550 = !DILocation(line: 383, column: 34, scope: !549)
!551 = !DILocation(line: 383, column: 21, scope: !549)
!552 = !DILocation(line: 384, column: 17, scope: !549)
!553 = !DILocation(line: 381, column: 37, scope: !545)
!554 = !DILocation(line: 381, column: 17, scope: !545)
!555 = distinct !{!555, !547, !556, !201}
!556 = !DILocation(line: 384, column: 17, scope: !542)
!557 = !DILocation(line: 385, column: 13, scope: !538)
!558 = !DILocation(line: 388, column: 17, scope: !559)
!559 = distinct !DILexicalBlock(scope: !534, file: !66, line: 387, column: 13)
!560 = !DILocation(line: 391, column: 5, scope: !529)
!561 = !DILocation(line: 392, column: 1, scope: !514)
