; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_17.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_17_bad() #0 !dbg !65 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %j, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 -1, i32* %data, align 4, !dbg !77
  store i32 0, i32* %i, align 4, !dbg !78
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !81
  %cmp = icmp slt i32 %0, 1, !dbg !83
  br i1 %cmp, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !85, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !89, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !112, metadata !DIExpression()), !dbg !113
  store i32 -1, i32* %connectSocket, align 4, !dbg !113
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  br label %do.body, !dbg !116

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !117
  store i32 %call, i32* %connectSocket, align 4, !dbg !119
  %1 = load i32, i32* %connectSocket, align 4, !dbg !120
  %cmp1 = icmp eq i32 %1, -1, !dbg !122
  br i1 %cmp1, label %if.then, label %if.end, !dbg !123

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !124

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !126
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !127
  store i16 2, i16* %sin_family, align 4, !dbg !128
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !129
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !130
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !131
  store i32 %call2, i32* %s_addr, align 4, !dbg !132
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !133
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !134
  store i16 %call3, i16* %sin_port, align 2, !dbg !135
  %3 = load i32, i32* %connectSocket, align 4, !dbg !136
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !138
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !139
  %cmp5 = icmp eq i32 %call4, -1, !dbg !140
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !141

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !142

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !144
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !145
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !146
  %conv = trunc i64 %call8 to i32, !dbg !146
  store i32 %conv, i32* %recvResult, align 4, !dbg !147
  %6 = load i32, i32* %recvResult, align 4, !dbg !148
  %cmp9 = icmp eq i32 %6, -1, !dbg !150
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !151

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !152
  %cmp11 = icmp eq i32 %7, 0, !dbg !153
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !154

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !155

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !157
  %idxprom = sext i32 %8 to i64, !dbg !158
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !158
  store i8 0, i8* %arrayidx, align 1, !dbg !159
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !160
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !161
  store i32 %call16, i32* %data, align 4, !dbg !162
  br label %do.end, !dbg !163

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %9 = load i32, i32* %connectSocket, align 4, !dbg !164
  %cmp17 = icmp ne i32 %9, -1, !dbg !166
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !167

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !168
  %call20 = call i32 @close(i32 %10), !dbg !170
  br label %if.end21, !dbg !171

if.end21:                                         ; preds = %if.then19, %do.end
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %if.end21
  %11 = load i32, i32* %i, align 4, !dbg !173
  %inc = add nsw i32 %11, 1, !dbg !173
  store i32 %inc, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !178
  br label %for.cond22, !dbg !180

for.cond22:                                       ; preds = %for.inc32, %for.end
  %12 = load i32, i32* %j, align 4, !dbg !181
  %cmp23 = icmp slt i32 %12, 1, !dbg !183
  br i1 %cmp23, label %for.body25, label %for.end34, !dbg !184

for.body25:                                       ; preds = %for.cond22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !185, metadata !DIExpression()), !dbg !191
  %13 = bitcast [10 x i32]* %buffer to i8*, !dbg !191
  call void @llvm.memset.p0i8.i64(i8* align 16 %13, i8 0, i64 40, i1 false), !dbg !191
  %14 = load i32, i32* %data, align 4, !dbg !192
  %cmp26 = icmp slt i32 %14, 10, !dbg !194
  br i1 %cmp26, label %if.then28, label %if.else, !dbg !195

if.then28:                                        ; preds = %for.body25
  %15 = load i32, i32* %data, align 4, !dbg !196
  %idxprom29 = sext i32 %15 to i64, !dbg !198
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !198
  %16 = load i32, i32* %arrayidx30, align 4, !dbg !198
  call void @printIntLine(i32 %16), !dbg !199
  br label %if.end31, !dbg !200

if.else:                                          ; preds = %for.body25
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !201
  br label %if.end31

if.end31:                                         ; preds = %if.else, %if.then28
  br label %for.inc32, !dbg !203

for.inc32:                                        ; preds = %if.end31
  %17 = load i32, i32* %j, align 4, !dbg !204
  %inc33 = add nsw i32 %17, 1, !dbg !204
  store i32 %inc33, i32* %j, align 4, !dbg !204
  br label %for.cond22, !dbg !205, !llvm.loop !206

for.end34:                                        ; preds = %for.cond22
  ret void, !dbg !208
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
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_17_good() #0 !dbg !209 {
entry:
  call void @goodB2G(), !dbg !210
  call void @goodG2B(), !dbg !211
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
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_17_good(), !dbg !226
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !227
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !228
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_17_bad(), !dbg !229
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !230
  ret i32 0, !dbg !231
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !232 {
entry:
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !233, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata i32* %k, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata i32* %data, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 -1, i32* %data, align 4, !dbg !239
  store i32 0, i32* %i, align 4, !dbg !240
  br label %for.cond, !dbg !242

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !243
  %cmp = icmp slt i32 %0, 1, !dbg !245
  br i1 %cmp, label %for.body, label %for.end, !dbg !246

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !247, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !251, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 -1, i32* %connectSocket, align 4, !dbg !254
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !255, metadata !DIExpression()), !dbg !256
  br label %do.body, !dbg !257

do.body:                                          ; preds = %for.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !258
  store i32 %call, i32* %connectSocket, align 4, !dbg !260
  %1 = load i32, i32* %connectSocket, align 4, !dbg !261
  %cmp1 = icmp eq i32 %1, -1, !dbg !263
  br i1 %cmp1, label %if.then, label %if.end, !dbg !264

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !265

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !267
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !267
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !268
  store i16 2, i16* %sin_family, align 4, !dbg !269
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !270
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !271
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !272
  store i32 %call2, i32* %s_addr, align 4, !dbg !273
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !274
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !275
  store i16 %call3, i16* %sin_port, align 2, !dbg !276
  %3 = load i32, i32* %connectSocket, align 4, !dbg !277
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !279
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !280
  %cmp5 = icmp eq i32 %call4, -1, !dbg !281
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !282

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !283

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !285
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !286
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !287
  %conv = trunc i64 %call8 to i32, !dbg !287
  store i32 %conv, i32* %recvResult, align 4, !dbg !288
  %6 = load i32, i32* %recvResult, align 4, !dbg !289
  %cmp9 = icmp eq i32 %6, -1, !dbg !291
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !292

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !293
  %cmp11 = icmp eq i32 %7, 0, !dbg !294
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !295

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !296

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !298
  %idxprom = sext i32 %8 to i64, !dbg !299
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !299
  store i8 0, i8* %arrayidx, align 1, !dbg !300
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !301
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !302
  store i32 %call16, i32* %data, align 4, !dbg !303
  br label %do.end, !dbg !304

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then
  %9 = load i32, i32* %connectSocket, align 4, !dbg !305
  %cmp17 = icmp ne i32 %9, -1, !dbg !307
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !308

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !309
  %call20 = call i32 @close(i32 %10), !dbg !311
  br label %if.end21, !dbg !312

if.end21:                                         ; preds = %if.then19, %do.end
  br label %for.inc, !dbg !313

for.inc:                                          ; preds = %if.end21
  %11 = load i32, i32* %i, align 4, !dbg !314
  %inc = add nsw i32 %11, 1, !dbg !314
  store i32 %inc, i32* %i, align 4, !dbg !314
  br label %for.cond, !dbg !315, !llvm.loop !316

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %k, align 4, !dbg !318
  br label %for.cond22, !dbg !320

for.cond22:                                       ; preds = %for.inc34, %for.end
  %12 = load i32, i32* %k, align 4, !dbg !321
  %cmp23 = icmp slt i32 %12, 1, !dbg !323
  br i1 %cmp23, label %for.body25, label %for.end36, !dbg !324

for.body25:                                       ; preds = %for.cond22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !325, metadata !DIExpression()), !dbg !328
  %13 = bitcast [10 x i32]* %buffer to i8*, !dbg !328
  call void @llvm.memset.p0i8.i64(i8* align 16 %13, i8 0, i64 40, i1 false), !dbg !328
  %14 = load i32, i32* %data, align 4, !dbg !329
  %cmp26 = icmp sge i32 %14, 0, !dbg !331
  br i1 %cmp26, label %land.lhs.true, label %if.else, !dbg !332

land.lhs.true:                                    ; preds = %for.body25
  %15 = load i32, i32* %data, align 4, !dbg !333
  %cmp28 = icmp slt i32 %15, 10, !dbg !334
  br i1 %cmp28, label %if.then30, label %if.else, !dbg !335

if.then30:                                        ; preds = %land.lhs.true
  %16 = load i32, i32* %data, align 4, !dbg !336
  %idxprom31 = sext i32 %16 to i64, !dbg !338
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom31, !dbg !338
  %17 = load i32, i32* %arrayidx32, align 4, !dbg !338
  call void @printIntLine(i32 %17), !dbg !339
  br label %if.end33, !dbg !340

if.else:                                          ; preds = %land.lhs.true, %for.body25
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !341
  br label %if.end33

if.end33:                                         ; preds = %if.else, %if.then30
  br label %for.inc34, !dbg !343

for.inc34:                                        ; preds = %if.end33
  %18 = load i32, i32* %k, align 4, !dbg !344
  %inc35 = add nsw i32 %18, 1, !dbg !344
  store i32 %inc35, i32* %k, align 4, !dbg !344
  br label %for.cond22, !dbg !345, !llvm.loop !346

for.end36:                                        ; preds = %for.cond22
  ret void, !dbg !348
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !349 {
entry:
  %h = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !350, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.declare(metadata i32* %j, metadata !352, metadata !DIExpression()), !dbg !353
  call void @llvm.dbg.declare(metadata i32* %data, metadata !354, metadata !DIExpression()), !dbg !355
  store i32 -1, i32* %data, align 4, !dbg !356
  store i32 0, i32* %h, align 4, !dbg !357
  br label %for.cond, !dbg !359

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !360
  %cmp = icmp slt i32 %0, 1, !dbg !362
  br i1 %cmp, label %for.body, label %for.end, !dbg !363

for.body:                                         ; preds = %for.cond
  store i32 7, i32* %data, align 4, !dbg !364
  br label %for.inc, !dbg !366

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !367
  %inc = add nsw i32 %1, 1, !dbg !367
  store i32 %inc, i32* %h, align 4, !dbg !367
  br label %for.cond, !dbg !368, !llvm.loop !369

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !371
  br label %for.cond1, !dbg !373

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i32, i32* %j, align 4, !dbg !374
  %cmp2 = icmp slt i32 %2, 1, !dbg !376
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !377

for.body3:                                        ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !378, metadata !DIExpression()), !dbg !381
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !381
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !381
  %4 = load i32, i32* %data, align 4, !dbg !382
  %cmp4 = icmp slt i32 %4, 10, !dbg !384
  br i1 %cmp4, label %if.then, label %if.else, !dbg !385

if.then:                                          ; preds = %for.body3
  %5 = load i32, i32* %data, align 4, !dbg !386
  %idxprom = sext i32 %5 to i64, !dbg !388
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !388
  %6 = load i32, i32* %arrayidx, align 4, !dbg !388
  call void @printIntLine(i32 %6), !dbg !389
  br label %if.end, !dbg !390

if.else:                                          ; preds = %for.body3
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !391
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc5, !dbg !393

for.inc5:                                         ; preds = %if.end
  %7 = load i32, i32* %j, align 4, !dbg !394
  %inc6 = add nsw i32 %7, 1, !dbg !394
  store i32 %inc6, i32* %j, align 4, !dbg !394
  br label %for.cond1, !dbg !395, !llvm.loop !396

for.end7:                                         ; preds = %for.cond1
  ret void, !dbg !398
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_17_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_17.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "i", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocalVariable(name: "j", scope: !65, file: !66, line: 46, type: !71)
!74 = !DILocation(line: 46, column: 11, scope: !65)
!75 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 47, type: !71)
!76 = !DILocation(line: 47, column: 9, scope: !65)
!77 = !DILocation(line: 49, column: 10, scope: !65)
!78 = !DILocation(line: 50, column: 11, scope: !79)
!79 = distinct !DILexicalBlock(scope: !65, file: !66, line: 50, column: 5)
!80 = !DILocation(line: 50, column: 9, scope: !79)
!81 = !DILocation(line: 50, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !66, line: 50, column: 5)
!83 = !DILocation(line: 50, column: 18, scope: !82)
!84 = !DILocation(line: 50, column: 5, scope: !79)
!85 = !DILocalVariable(name: "recvResult", scope: !86, file: !66, line: 57, type: !71)
!86 = distinct !DILexicalBlock(scope: !87, file: !66, line: 52, column: 9)
!87 = distinct !DILexicalBlock(scope: !82, file: !66, line: 51, column: 5)
!88 = !DILocation(line: 57, column: 17, scope: !86)
!89 = !DILocalVariable(name: "service", scope: !86, file: !66, line: 58, type: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !91)
!91 = !{!92, !93, !99, !106}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !90, file: !17, line: 240, baseType: !51, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !90, file: !17, line: 241, baseType: !94, size: 16, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !96, line: 25, baseType: !97)
!96 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !98, line: 40, baseType: !53)
!98 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !90, file: !17, line: 242, baseType: !100, size: 32, offset: 32)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !101)
!101 = !{!102}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !100, file: !17, line: 33, baseType: !103, size: 32)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !96, line: 26, baseType: !105)
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !98, line: 42, baseType: !5)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !90, file: !17, line: 245, baseType: !107, size: 64, offset: 64)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !108, size: 64, elements: !109)
!108 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!109 = !{!110}
!110 = !DISubrange(count: 8)
!111 = !DILocation(line: 58, column: 32, scope: !86)
!112 = !DILocalVariable(name: "connectSocket", scope: !86, file: !66, line: 59, type: !71)
!113 = !DILocation(line: 59, column: 20, scope: !86)
!114 = !DILocalVariable(name: "inputBuffer", scope: !86, file: !66, line: 60, type: !55)
!115 = !DILocation(line: 60, column: 18, scope: !86)
!116 = !DILocation(line: 61, column: 13, scope: !86)
!117 = !DILocation(line: 71, column: 33, scope: !118)
!118 = distinct !DILexicalBlock(scope: !86, file: !66, line: 62, column: 13)
!119 = !DILocation(line: 71, column: 31, scope: !118)
!120 = !DILocation(line: 72, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !66, line: 72, column: 21)
!122 = !DILocation(line: 72, column: 35, scope: !121)
!123 = !DILocation(line: 72, column: 21, scope: !118)
!124 = !DILocation(line: 74, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !66, line: 73, column: 17)
!126 = !DILocation(line: 76, column: 17, scope: !118)
!127 = !DILocation(line: 77, column: 25, scope: !118)
!128 = !DILocation(line: 77, column: 36, scope: !118)
!129 = !DILocation(line: 78, column: 43, scope: !118)
!130 = !DILocation(line: 78, column: 25, scope: !118)
!131 = !DILocation(line: 78, column: 34, scope: !118)
!132 = !DILocation(line: 78, column: 41, scope: !118)
!133 = !DILocation(line: 79, column: 36, scope: !118)
!134 = !DILocation(line: 79, column: 25, scope: !118)
!135 = !DILocation(line: 79, column: 34, scope: !118)
!136 = !DILocation(line: 80, column: 29, scope: !137)
!137 = distinct !DILexicalBlock(scope: !118, file: !66, line: 80, column: 21)
!138 = !DILocation(line: 80, column: 44, scope: !137)
!139 = !DILocation(line: 80, column: 21, scope: !137)
!140 = !DILocation(line: 80, column: 89, scope: !137)
!141 = !DILocation(line: 80, column: 21, scope: !118)
!142 = !DILocation(line: 82, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !66, line: 81, column: 17)
!144 = !DILocation(line: 86, column: 35, scope: !118)
!145 = !DILocation(line: 86, column: 50, scope: !118)
!146 = !DILocation(line: 86, column: 30, scope: !118)
!147 = !DILocation(line: 86, column: 28, scope: !118)
!148 = !DILocation(line: 87, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !118, file: !66, line: 87, column: 21)
!150 = !DILocation(line: 87, column: 32, scope: !149)
!151 = !DILocation(line: 87, column: 48, scope: !149)
!152 = !DILocation(line: 87, column: 51, scope: !149)
!153 = !DILocation(line: 87, column: 62, scope: !149)
!154 = !DILocation(line: 87, column: 21, scope: !118)
!155 = !DILocation(line: 89, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !149, file: !66, line: 88, column: 17)
!157 = !DILocation(line: 92, column: 29, scope: !118)
!158 = !DILocation(line: 92, column: 17, scope: !118)
!159 = !DILocation(line: 92, column: 41, scope: !118)
!160 = !DILocation(line: 94, column: 29, scope: !118)
!161 = !DILocation(line: 94, column: 24, scope: !118)
!162 = !DILocation(line: 94, column: 22, scope: !118)
!163 = !DILocation(line: 95, column: 13, scope: !118)
!164 = !DILocation(line: 97, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !86, file: !66, line: 97, column: 17)
!166 = !DILocation(line: 97, column: 31, scope: !165)
!167 = !DILocation(line: 97, column: 17, scope: !86)
!168 = !DILocation(line: 99, column: 30, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !66, line: 98, column: 13)
!170 = !DILocation(line: 99, column: 17, scope: !169)
!171 = !DILocation(line: 100, column: 13, scope: !169)
!172 = !DILocation(line: 108, column: 5, scope: !87)
!173 = !DILocation(line: 50, column: 24, scope: !82)
!174 = !DILocation(line: 50, column: 5, scope: !82)
!175 = distinct !{!175, !84, !176, !177}
!176 = !DILocation(line: 108, column: 5, scope: !79)
!177 = !{!"llvm.loop.mustprogress"}
!178 = !DILocation(line: 109, column: 11, scope: !179)
!179 = distinct !DILexicalBlock(scope: !65, file: !66, line: 109, column: 5)
!180 = !DILocation(line: 109, column: 9, scope: !179)
!181 = !DILocation(line: 109, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !66, line: 109, column: 5)
!183 = !DILocation(line: 109, column: 18, scope: !182)
!184 = !DILocation(line: 109, column: 5, scope: !179)
!185 = !DILocalVariable(name: "buffer", scope: !186, file: !66, line: 112, type: !188)
!186 = distinct !DILexicalBlock(scope: !187, file: !66, line: 111, column: 9)
!187 = distinct !DILexicalBlock(scope: !182, file: !66, line: 110, column: 5)
!188 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !189)
!189 = !{!190}
!190 = !DISubrange(count: 10)
!191 = !DILocation(line: 112, column: 17, scope: !186)
!192 = !DILocation(line: 115, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !186, file: !66, line: 115, column: 17)
!194 = !DILocation(line: 115, column: 22, scope: !193)
!195 = !DILocation(line: 115, column: 17, scope: !186)
!196 = !DILocation(line: 117, column: 37, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !66, line: 116, column: 13)
!198 = !DILocation(line: 117, column: 30, scope: !197)
!199 = !DILocation(line: 117, column: 17, scope: !197)
!200 = !DILocation(line: 118, column: 13, scope: !197)
!201 = !DILocation(line: 121, column: 17, scope: !202)
!202 = distinct !DILexicalBlock(scope: !193, file: !66, line: 120, column: 13)
!203 = !DILocation(line: 124, column: 5, scope: !187)
!204 = !DILocation(line: 109, column: 24, scope: !182)
!205 = !DILocation(line: 109, column: 5, scope: !182)
!206 = distinct !{!206, !184, !207, !177}
!207 = !DILocation(line: 124, column: 5, scope: !179)
!208 = !DILocation(line: 125, column: 1, scope: !65)
!209 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_17_good", scope: !66, file: !66, line: 245, type: !67, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!210 = !DILocation(line: 247, column: 5, scope: !209)
!211 = !DILocation(line: 248, column: 5, scope: !209)
!212 = !DILocation(line: 249, column: 1, scope: !209)
!213 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 260, type: !214, scopeLine: 261, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!214 = !DISubroutineType(types: !215)
!215 = !{!71, !71, !216}
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64)
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!218 = !DILocalVariable(name: "argc", arg: 1, scope: !213, file: !66, line: 260, type: !71)
!219 = !DILocation(line: 260, column: 14, scope: !213)
!220 = !DILocalVariable(name: "argv", arg: 2, scope: !213, file: !66, line: 260, type: !216)
!221 = !DILocation(line: 260, column: 27, scope: !213)
!222 = !DILocation(line: 263, column: 22, scope: !213)
!223 = !DILocation(line: 263, column: 12, scope: !213)
!224 = !DILocation(line: 263, column: 5, scope: !213)
!225 = !DILocation(line: 265, column: 5, scope: !213)
!226 = !DILocation(line: 266, column: 5, scope: !213)
!227 = !DILocation(line: 267, column: 5, scope: !213)
!228 = !DILocation(line: 270, column: 5, scope: !213)
!229 = !DILocation(line: 271, column: 5, scope: !213)
!230 = !DILocation(line: 272, column: 5, scope: !213)
!231 = !DILocation(line: 274, column: 5, scope: !213)
!232 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 132, type: !67, scopeLine: 133, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!233 = !DILocalVariable(name: "i", scope: !232, file: !66, line: 134, type: !71)
!234 = !DILocation(line: 134, column: 9, scope: !232)
!235 = !DILocalVariable(name: "k", scope: !232, file: !66, line: 134, type: !71)
!236 = !DILocation(line: 134, column: 11, scope: !232)
!237 = !DILocalVariable(name: "data", scope: !232, file: !66, line: 135, type: !71)
!238 = !DILocation(line: 135, column: 9, scope: !232)
!239 = !DILocation(line: 137, column: 10, scope: !232)
!240 = !DILocation(line: 138, column: 11, scope: !241)
!241 = distinct !DILexicalBlock(scope: !232, file: !66, line: 138, column: 5)
!242 = !DILocation(line: 138, column: 9, scope: !241)
!243 = !DILocation(line: 138, column: 16, scope: !244)
!244 = distinct !DILexicalBlock(scope: !241, file: !66, line: 138, column: 5)
!245 = !DILocation(line: 138, column: 18, scope: !244)
!246 = !DILocation(line: 138, column: 5, scope: !241)
!247 = !DILocalVariable(name: "recvResult", scope: !248, file: !66, line: 145, type: !71)
!248 = distinct !DILexicalBlock(scope: !249, file: !66, line: 140, column: 9)
!249 = distinct !DILexicalBlock(scope: !244, file: !66, line: 139, column: 5)
!250 = !DILocation(line: 145, column: 17, scope: !248)
!251 = !DILocalVariable(name: "service", scope: !248, file: !66, line: 146, type: !90)
!252 = !DILocation(line: 146, column: 32, scope: !248)
!253 = !DILocalVariable(name: "connectSocket", scope: !248, file: !66, line: 147, type: !71)
!254 = !DILocation(line: 147, column: 20, scope: !248)
!255 = !DILocalVariable(name: "inputBuffer", scope: !248, file: !66, line: 148, type: !55)
!256 = !DILocation(line: 148, column: 18, scope: !248)
!257 = !DILocation(line: 149, column: 13, scope: !248)
!258 = !DILocation(line: 159, column: 33, scope: !259)
!259 = distinct !DILexicalBlock(scope: !248, file: !66, line: 150, column: 13)
!260 = !DILocation(line: 159, column: 31, scope: !259)
!261 = !DILocation(line: 160, column: 21, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !66, line: 160, column: 21)
!263 = !DILocation(line: 160, column: 35, scope: !262)
!264 = !DILocation(line: 160, column: 21, scope: !259)
!265 = !DILocation(line: 162, column: 21, scope: !266)
!266 = distinct !DILexicalBlock(scope: !262, file: !66, line: 161, column: 17)
!267 = !DILocation(line: 164, column: 17, scope: !259)
!268 = !DILocation(line: 165, column: 25, scope: !259)
!269 = !DILocation(line: 165, column: 36, scope: !259)
!270 = !DILocation(line: 166, column: 43, scope: !259)
!271 = !DILocation(line: 166, column: 25, scope: !259)
!272 = !DILocation(line: 166, column: 34, scope: !259)
!273 = !DILocation(line: 166, column: 41, scope: !259)
!274 = !DILocation(line: 167, column: 36, scope: !259)
!275 = !DILocation(line: 167, column: 25, scope: !259)
!276 = !DILocation(line: 167, column: 34, scope: !259)
!277 = !DILocation(line: 168, column: 29, scope: !278)
!278 = distinct !DILexicalBlock(scope: !259, file: !66, line: 168, column: 21)
!279 = !DILocation(line: 168, column: 44, scope: !278)
!280 = !DILocation(line: 168, column: 21, scope: !278)
!281 = !DILocation(line: 168, column: 89, scope: !278)
!282 = !DILocation(line: 168, column: 21, scope: !259)
!283 = !DILocation(line: 170, column: 21, scope: !284)
!284 = distinct !DILexicalBlock(scope: !278, file: !66, line: 169, column: 17)
!285 = !DILocation(line: 174, column: 35, scope: !259)
!286 = !DILocation(line: 174, column: 50, scope: !259)
!287 = !DILocation(line: 174, column: 30, scope: !259)
!288 = !DILocation(line: 174, column: 28, scope: !259)
!289 = !DILocation(line: 175, column: 21, scope: !290)
!290 = distinct !DILexicalBlock(scope: !259, file: !66, line: 175, column: 21)
!291 = !DILocation(line: 175, column: 32, scope: !290)
!292 = !DILocation(line: 175, column: 48, scope: !290)
!293 = !DILocation(line: 175, column: 51, scope: !290)
!294 = !DILocation(line: 175, column: 62, scope: !290)
!295 = !DILocation(line: 175, column: 21, scope: !259)
!296 = !DILocation(line: 177, column: 21, scope: !297)
!297 = distinct !DILexicalBlock(scope: !290, file: !66, line: 176, column: 17)
!298 = !DILocation(line: 180, column: 29, scope: !259)
!299 = !DILocation(line: 180, column: 17, scope: !259)
!300 = !DILocation(line: 180, column: 41, scope: !259)
!301 = !DILocation(line: 182, column: 29, scope: !259)
!302 = !DILocation(line: 182, column: 24, scope: !259)
!303 = !DILocation(line: 182, column: 22, scope: !259)
!304 = !DILocation(line: 183, column: 13, scope: !259)
!305 = !DILocation(line: 185, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !248, file: !66, line: 185, column: 17)
!307 = !DILocation(line: 185, column: 31, scope: !306)
!308 = !DILocation(line: 185, column: 17, scope: !248)
!309 = !DILocation(line: 187, column: 30, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !66, line: 186, column: 13)
!311 = !DILocation(line: 187, column: 17, scope: !310)
!312 = !DILocation(line: 188, column: 13, scope: !310)
!313 = !DILocation(line: 196, column: 5, scope: !249)
!314 = !DILocation(line: 138, column: 24, scope: !244)
!315 = !DILocation(line: 138, column: 5, scope: !244)
!316 = distinct !{!316, !246, !317, !177}
!317 = !DILocation(line: 196, column: 5, scope: !241)
!318 = !DILocation(line: 197, column: 11, scope: !319)
!319 = distinct !DILexicalBlock(scope: !232, file: !66, line: 197, column: 5)
!320 = !DILocation(line: 197, column: 9, scope: !319)
!321 = !DILocation(line: 197, column: 16, scope: !322)
!322 = distinct !DILexicalBlock(scope: !319, file: !66, line: 197, column: 5)
!323 = !DILocation(line: 197, column: 18, scope: !322)
!324 = !DILocation(line: 197, column: 5, scope: !319)
!325 = !DILocalVariable(name: "buffer", scope: !326, file: !66, line: 200, type: !188)
!326 = distinct !DILexicalBlock(scope: !327, file: !66, line: 199, column: 9)
!327 = distinct !DILexicalBlock(scope: !322, file: !66, line: 198, column: 5)
!328 = !DILocation(line: 200, column: 17, scope: !326)
!329 = !DILocation(line: 202, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !66, line: 202, column: 17)
!331 = !DILocation(line: 202, column: 22, scope: !330)
!332 = !DILocation(line: 202, column: 27, scope: !330)
!333 = !DILocation(line: 202, column: 30, scope: !330)
!334 = !DILocation(line: 202, column: 35, scope: !330)
!335 = !DILocation(line: 202, column: 17, scope: !326)
!336 = !DILocation(line: 204, column: 37, scope: !337)
!337 = distinct !DILexicalBlock(scope: !330, file: !66, line: 203, column: 13)
!338 = !DILocation(line: 204, column: 30, scope: !337)
!339 = !DILocation(line: 204, column: 17, scope: !337)
!340 = !DILocation(line: 205, column: 13, scope: !337)
!341 = !DILocation(line: 208, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !330, file: !66, line: 207, column: 13)
!343 = !DILocation(line: 211, column: 5, scope: !327)
!344 = !DILocation(line: 197, column: 24, scope: !322)
!345 = !DILocation(line: 197, column: 5, scope: !322)
!346 = distinct !{!346, !324, !347, !177}
!347 = !DILocation(line: 211, column: 5, scope: !319)
!348 = !DILocation(line: 212, column: 1, scope: !232)
!349 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 215, type: !67, scopeLine: 216, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!350 = !DILocalVariable(name: "h", scope: !349, file: !66, line: 217, type: !71)
!351 = !DILocation(line: 217, column: 9, scope: !349)
!352 = !DILocalVariable(name: "j", scope: !349, file: !66, line: 217, type: !71)
!353 = !DILocation(line: 217, column: 11, scope: !349)
!354 = !DILocalVariable(name: "data", scope: !349, file: !66, line: 218, type: !71)
!355 = !DILocation(line: 218, column: 9, scope: !349)
!356 = !DILocation(line: 220, column: 10, scope: !349)
!357 = !DILocation(line: 221, column: 11, scope: !358)
!358 = distinct !DILexicalBlock(scope: !349, file: !66, line: 221, column: 5)
!359 = !DILocation(line: 221, column: 9, scope: !358)
!360 = !DILocation(line: 221, column: 16, scope: !361)
!361 = distinct !DILexicalBlock(scope: !358, file: !66, line: 221, column: 5)
!362 = !DILocation(line: 221, column: 18, scope: !361)
!363 = !DILocation(line: 221, column: 5, scope: !358)
!364 = !DILocation(line: 225, column: 14, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !66, line: 222, column: 5)
!366 = !DILocation(line: 226, column: 5, scope: !365)
!367 = !DILocation(line: 221, column: 24, scope: !361)
!368 = !DILocation(line: 221, column: 5, scope: !361)
!369 = distinct !{!369, !363, !370, !177}
!370 = !DILocation(line: 226, column: 5, scope: !358)
!371 = !DILocation(line: 227, column: 11, scope: !372)
!372 = distinct !DILexicalBlock(scope: !349, file: !66, line: 227, column: 5)
!373 = !DILocation(line: 227, column: 9, scope: !372)
!374 = !DILocation(line: 227, column: 16, scope: !375)
!375 = distinct !DILexicalBlock(scope: !372, file: !66, line: 227, column: 5)
!376 = !DILocation(line: 227, column: 18, scope: !375)
!377 = !DILocation(line: 227, column: 5, scope: !372)
!378 = !DILocalVariable(name: "buffer", scope: !379, file: !66, line: 230, type: !188)
!379 = distinct !DILexicalBlock(scope: !380, file: !66, line: 229, column: 9)
!380 = distinct !DILexicalBlock(scope: !375, file: !66, line: 228, column: 5)
!381 = !DILocation(line: 230, column: 17, scope: !379)
!382 = !DILocation(line: 233, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !66, line: 233, column: 17)
!384 = !DILocation(line: 233, column: 22, scope: !383)
!385 = !DILocation(line: 233, column: 17, scope: !379)
!386 = !DILocation(line: 235, column: 37, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !66, line: 234, column: 13)
!388 = !DILocation(line: 235, column: 30, scope: !387)
!389 = !DILocation(line: 235, column: 17, scope: !387)
!390 = !DILocation(line: 236, column: 13, scope: !387)
!391 = !DILocation(line: 239, column: 17, scope: !392)
!392 = distinct !DILexicalBlock(scope: !383, file: !66, line: 238, column: 13)
!393 = !DILocation(line: 242, column: 5, scope: !380)
!394 = !DILocation(line: 227, column: 24, scope: !375)
!395 = !DILocation(line: 227, column: 5, scope: !375)
!396 = distinct !{!396, !377, !397, !177}
!397 = !DILocation(line: 242, column: 5, scope: !372)
!398 = !DILocation(line: 243, column: 1, scope: !349)
