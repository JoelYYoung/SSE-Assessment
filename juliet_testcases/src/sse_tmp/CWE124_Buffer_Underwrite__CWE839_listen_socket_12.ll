; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_12.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_12_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i51 = alloca i32, align 4
  %buffer52 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !82, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !86, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %listenSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %acceptSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  br label %do.body, !dbg !110

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !111
  store i32 %call1, i32* %listenSocket, align 4, !dbg !113
  %0 = load i32, i32* %listenSocket, align 4, !dbg !114
  %cmp = icmp eq i32 %0, -1, !dbg !116
  br i1 %cmp, label %if.then2, label %if.end, !dbg !117

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !118

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !120
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !121
  store i16 2, i16* %sin_family, align 4, !dbg !122
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !123
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !124
  store i32 0, i32* %s_addr, align 4, !dbg !125
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !126
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !127
  store i16 %call3, i16* %sin_port, align 2, !dbg !128
  %2 = load i32, i32* %listenSocket, align 4, !dbg !129
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !131
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !132
  %cmp5 = icmp eq i32 %call4, -1, !dbg !133
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !134

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !135

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !137
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !139
  %cmp9 = icmp eq i32 %call8, -1, !dbg !140
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !141

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !142

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !144
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !145
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !146
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !147
  %cmp13 = icmp eq i32 %6, -1, !dbg !149
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !150

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !151

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !153
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !154
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !155
  %conv = trunc i64 %call16 to i32, !dbg !155
  store i32 %conv, i32* %recvResult, align 4, !dbg !156
  %8 = load i32, i32* %recvResult, align 4, !dbg !157
  %cmp17 = icmp eq i32 %8, -1, !dbg !159
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !160

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !161
  %cmp19 = icmp eq i32 %9, 0, !dbg !162
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !163

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !164

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !166
  %idxprom = sext i32 %10 to i64, !dbg !167
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !169
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !170
  store i32 %call24, i32* %data, align 4, !dbg !171
  br label %do.end, !dbg !172

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !173
  %cmp25 = icmp ne i32 %11, -1, !dbg !175
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !176

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !177
  %call28 = call i32 @close(i32 %12), !dbg !179
  br label %if.end29, !dbg !180

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !181
  %cmp30 = icmp ne i32 %13, -1, !dbg !183
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !184

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !185
  %call33 = call i32 @close(i32 %14), !dbg !187
  br label %if.end34, !dbg !188

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end35, !dbg !189

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !190
  br label %if.end35

if.end35:                                         ; preds = %if.else, %if.end34
  %call36 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !192
  %tobool37 = icmp ne i32 %call36, 0, !dbg !192
  br i1 %tobool37, label %if.then38, label %if.else50, !dbg !194

if.then38:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i, metadata !195, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !199, metadata !DIExpression()), !dbg !203
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !203
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !203
  %16 = load i32, i32* %data, align 4, !dbg !204
  %cmp39 = icmp slt i32 %16, 10, !dbg !206
  br i1 %cmp39, label %if.then41, label %if.else48, !dbg !207

if.then41:                                        ; preds = %if.then38
  %17 = load i32, i32* %data, align 4, !dbg !208
  %idxprom42 = sext i32 %17 to i64, !dbg !210
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !210
  store i32 1, i32* %arrayidx43, align 4, !dbg !211
  store i32 0, i32* %i, align 4, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %if.then41
  %18 = load i32, i32* %i, align 4, !dbg !215
  %cmp44 = icmp slt i32 %18, 10, !dbg !217
  br i1 %cmp44, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !219
  %idxprom46 = sext i32 %19 to i64, !dbg !221
  %arrayidx47 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom46, !dbg !221
  %20 = load i32, i32* %arrayidx47, align 4, !dbg !221
  call void @printIntLine(i32 %20), !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !224
  %inc = add nsw i32 %21, 1, !dbg !224
  store i32 %inc, i32* %i, align 4, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  br label %if.end49, !dbg !229

if.else48:                                        ; preds = %if.then38
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !230
  br label %if.end49

if.end49:                                         ; preds = %if.else48, %for.end
  br label %if.end71, !dbg !232

if.else50:                                        ; preds = %if.end35
  call void @llvm.dbg.declare(metadata i32* %i51, metadata !233, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer52, metadata !237, metadata !DIExpression()), !dbg !238
  %22 = bitcast [10 x i32]* %buffer52 to i8*, !dbg !238
  call void @llvm.memset.p0i8.i64(i8* align 16 %22, i8 0, i64 40, i1 false), !dbg !238
  %23 = load i32, i32* %data, align 4, !dbg !239
  %cmp53 = icmp sge i32 %23, 0, !dbg !241
  br i1 %cmp53, label %land.lhs.true, label %if.else69, !dbg !242

land.lhs.true:                                    ; preds = %if.else50
  %24 = load i32, i32* %data, align 4, !dbg !243
  %cmp55 = icmp slt i32 %24, 10, !dbg !244
  br i1 %cmp55, label %if.then57, label %if.else69, !dbg !245

if.then57:                                        ; preds = %land.lhs.true
  %25 = load i32, i32* %data, align 4, !dbg !246
  %idxprom58 = sext i32 %25 to i64, !dbg !248
  %arrayidx59 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer52, i64 0, i64 %idxprom58, !dbg !248
  store i32 1, i32* %arrayidx59, align 4, !dbg !249
  store i32 0, i32* %i51, align 4, !dbg !250
  br label %for.cond60, !dbg !252

for.cond60:                                       ; preds = %for.inc66, %if.then57
  %26 = load i32, i32* %i51, align 4, !dbg !253
  %cmp61 = icmp slt i32 %26, 10, !dbg !255
  br i1 %cmp61, label %for.body63, label %for.end68, !dbg !256

for.body63:                                       ; preds = %for.cond60
  %27 = load i32, i32* %i51, align 4, !dbg !257
  %idxprom64 = sext i32 %27 to i64, !dbg !259
  %arrayidx65 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer52, i64 0, i64 %idxprom64, !dbg !259
  %28 = load i32, i32* %arrayidx65, align 4, !dbg !259
  call void @printIntLine(i32 %28), !dbg !260
  br label %for.inc66, !dbg !261

for.inc66:                                        ; preds = %for.body63
  %29 = load i32, i32* %i51, align 4, !dbg !262
  %inc67 = add nsw i32 %29, 1, !dbg !262
  store i32 %inc67, i32* %i51, align 4, !dbg !262
  br label %for.cond60, !dbg !263, !llvm.loop !264

for.end68:                                        ; preds = %for.cond60
  br label %if.end70, !dbg !266

if.else69:                                        ; preds = %land.lhs.true, %if.else50
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !267
  br label %if.end70

if.end70:                                         ; preds = %if.else69, %for.end68
  br label %if.end71

if.end71:                                         ; preds = %if.end70, %if.end49
  ret void, !dbg !269
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #5

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #3

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #3

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #2

declare dso_local i64 @recv(i32, i8*, i64, i32) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #2

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_12_good() #0 !dbg !270 {
entry:
  call void @goodB2G(), !dbg !271
  call void @goodG2B(), !dbg !272
  ret void, !dbg !273
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !274 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !279, metadata !DIExpression()), !dbg !280
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !281, metadata !DIExpression()), !dbg !282
  %call = call i64 @time(i64* null) #7, !dbg !283
  %conv = trunc i64 %call to i32, !dbg !284
  call void @srand(i32 %conv) #7, !dbg !285
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !286
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_12_good(), !dbg !287
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !288
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !289
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_12_bad(), !dbg !290
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !291
  ret i32 0, !dbg !292
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !293 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %recvResult35 = alloca i32, align 4
  %service36 = alloca %struct.sockaddr_in, align 4
  %listenSocket37 = alloca i32, align 4
  %acceptSocket38 = alloca i32, align 4
  %inputBuffer39 = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i109 = alloca i32, align 4
  %buffer110 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !294, metadata !DIExpression()), !dbg !295
  store i32 -1, i32* %data, align 4, !dbg !296
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !297
  %tobool = icmp ne i32 %call, 0, !dbg !297
  br i1 %tobool, label %if.then, label %if.else, !dbg !299

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !300, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !304, metadata !DIExpression()), !dbg !305
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !306, metadata !DIExpression()), !dbg !307
  store i32 -1, i32* %listenSocket, align 4, !dbg !307
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !308, metadata !DIExpression()), !dbg !309
  store i32 -1, i32* %acceptSocket, align 4, !dbg !309
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !310, metadata !DIExpression()), !dbg !311
  br label %do.body, !dbg !312

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !313
  store i32 %call1, i32* %listenSocket, align 4, !dbg !315
  %0 = load i32, i32* %listenSocket, align 4, !dbg !316
  %cmp = icmp eq i32 %0, -1, !dbg !318
  br i1 %cmp, label %if.then2, label %if.end, !dbg !319

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !320

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !322
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !322
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !323
  store i16 2, i16* %sin_family, align 4, !dbg !324
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !325
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !326
  store i32 0, i32* %s_addr, align 4, !dbg !327
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !328
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !329
  store i16 %call3, i16* %sin_port, align 2, !dbg !330
  %2 = load i32, i32* %listenSocket, align 4, !dbg !331
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !333
  %call4 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !334
  %cmp5 = icmp eq i32 %call4, -1, !dbg !335
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !336

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !337

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !339
  %call8 = call i32 @listen(i32 %4, i32 5) #7, !dbg !341
  %cmp9 = icmp eq i32 %call8, -1, !dbg !342
  br i1 %cmp9, label %if.then10, label %if.end11, !dbg !343

if.then10:                                        ; preds = %if.end7
  br label %do.end, !dbg !344

if.end11:                                         ; preds = %if.end7
  %5 = load i32, i32* %listenSocket, align 4, !dbg !346
  %call12 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !347
  store i32 %call12, i32* %acceptSocket, align 4, !dbg !348
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !349
  %cmp13 = icmp eq i32 %6, -1, !dbg !351
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !352

if.then14:                                        ; preds = %if.end11
  br label %do.end, !dbg !353

if.end15:                                         ; preds = %if.end11
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !355
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !356
  %call16 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !357
  %conv = trunc i64 %call16 to i32, !dbg !357
  store i32 %conv, i32* %recvResult, align 4, !dbg !358
  %8 = load i32, i32* %recvResult, align 4, !dbg !359
  %cmp17 = icmp eq i32 %8, -1, !dbg !361
  br i1 %cmp17, label %if.then21, label %lor.lhs.false, !dbg !362

lor.lhs.false:                                    ; preds = %if.end15
  %9 = load i32, i32* %recvResult, align 4, !dbg !363
  %cmp19 = icmp eq i32 %9, 0, !dbg !364
  br i1 %cmp19, label %if.then21, label %if.end22, !dbg !365

if.then21:                                        ; preds = %lor.lhs.false, %if.end15
  br label %do.end, !dbg !366

if.end22:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !368
  %idxprom = sext i32 %10 to i64, !dbg !369
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !369
  store i8 0, i8* %arrayidx, align 1, !dbg !370
  %arraydecay23 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !371
  %call24 = call i32 @atoi(i8* %arraydecay23) #9, !dbg !372
  store i32 %call24, i32* %data, align 4, !dbg !373
  br label %do.end, !dbg !374

do.end:                                           ; preds = %if.end22, %if.then21, %if.then14, %if.then10, %if.then6, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !375
  %cmp25 = icmp ne i32 %11, -1, !dbg !377
  br i1 %cmp25, label %if.then27, label %if.end29, !dbg !378

if.then27:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !379
  %call28 = call i32 @close(i32 %12), !dbg !381
  br label %if.end29, !dbg !382

if.end29:                                         ; preds = %if.then27, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !383
  %cmp30 = icmp ne i32 %13, -1, !dbg !385
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !386

if.then32:                                        ; preds = %if.end29
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !387
  %call33 = call i32 @close(i32 %14), !dbg !389
  br label %if.end34, !dbg !390

if.end34:                                         ; preds = %if.then32, %if.end29
  br label %if.end91, !dbg !391

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult35, metadata !392, metadata !DIExpression()), !dbg !395
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service36, metadata !396, metadata !DIExpression()), !dbg !397
  call void @llvm.dbg.declare(metadata i32* %listenSocket37, metadata !398, metadata !DIExpression()), !dbg !399
  store i32 -1, i32* %listenSocket37, align 4, !dbg !399
  call void @llvm.dbg.declare(metadata i32* %acceptSocket38, metadata !400, metadata !DIExpression()), !dbg !401
  store i32 -1, i32* %acceptSocket38, align 4, !dbg !401
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer39, metadata !402, metadata !DIExpression()), !dbg !403
  br label %do.body40, !dbg !404

do.body40:                                        ; preds = %if.else
  %call41 = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !405
  store i32 %call41, i32* %listenSocket37, align 4, !dbg !407
  %15 = load i32, i32* %listenSocket37, align 4, !dbg !408
  %cmp42 = icmp eq i32 %15, -1, !dbg !410
  br i1 %cmp42, label %if.then44, label %if.end45, !dbg !411

if.then44:                                        ; preds = %do.body40
  br label %do.end80, !dbg !412

if.end45:                                         ; preds = %do.body40
  %16 = bitcast %struct.sockaddr_in* %service36 to i8*, !dbg !414
  call void @llvm.memset.p0i8.i64(i8* align 4 %16, i8 0, i64 16, i1 false), !dbg !414
  %sin_family46 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service36, i32 0, i32 0, !dbg !415
  store i16 2, i16* %sin_family46, align 4, !dbg !416
  %sin_addr47 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service36, i32 0, i32 2, !dbg !417
  %s_addr48 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr47, i32 0, i32 0, !dbg !418
  store i32 0, i32* %s_addr48, align 4, !dbg !419
  %call49 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !420
  %sin_port50 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service36, i32 0, i32 1, !dbg !421
  store i16 %call49, i16* %sin_port50, align 2, !dbg !422
  %17 = load i32, i32* %listenSocket37, align 4, !dbg !423
  %18 = bitcast %struct.sockaddr_in* %service36 to %struct.sockaddr*, !dbg !425
  %call51 = call i32 @bind(i32 %17, %struct.sockaddr* %18, i32 16) #7, !dbg !426
  %cmp52 = icmp eq i32 %call51, -1, !dbg !427
  br i1 %cmp52, label %if.then54, label %if.end55, !dbg !428

if.then54:                                        ; preds = %if.end45
  br label %do.end80, !dbg !429

if.end55:                                         ; preds = %if.end45
  %19 = load i32, i32* %listenSocket37, align 4, !dbg !431
  %call56 = call i32 @listen(i32 %19, i32 5) #7, !dbg !433
  %cmp57 = icmp eq i32 %call56, -1, !dbg !434
  br i1 %cmp57, label %if.then59, label %if.end60, !dbg !435

if.then59:                                        ; preds = %if.end55
  br label %do.end80, !dbg !436

if.end60:                                         ; preds = %if.end55
  %20 = load i32, i32* %listenSocket37, align 4, !dbg !438
  %call61 = call i32 @accept(i32 %20, %struct.sockaddr* null, i32* null), !dbg !439
  store i32 %call61, i32* %acceptSocket38, align 4, !dbg !440
  %21 = load i32, i32* %acceptSocket38, align 4, !dbg !441
  %cmp62 = icmp eq i32 %21, -1, !dbg !443
  br i1 %cmp62, label %if.then64, label %if.end65, !dbg !444

if.then64:                                        ; preds = %if.end60
  br label %do.end80, !dbg !445

if.end65:                                         ; preds = %if.end60
  %22 = load i32, i32* %acceptSocket38, align 4, !dbg !447
  %arraydecay66 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer39, i64 0, i64 0, !dbg !448
  %call67 = call i64 @recv(i32 %22, i8* %arraydecay66, i64 13, i32 0), !dbg !449
  %conv68 = trunc i64 %call67 to i32, !dbg !449
  store i32 %conv68, i32* %recvResult35, align 4, !dbg !450
  %23 = load i32, i32* %recvResult35, align 4, !dbg !451
  %cmp69 = icmp eq i32 %23, -1, !dbg !453
  br i1 %cmp69, label %if.then74, label %lor.lhs.false71, !dbg !454

lor.lhs.false71:                                  ; preds = %if.end65
  %24 = load i32, i32* %recvResult35, align 4, !dbg !455
  %cmp72 = icmp eq i32 %24, 0, !dbg !456
  br i1 %cmp72, label %if.then74, label %if.end75, !dbg !457

if.then74:                                        ; preds = %lor.lhs.false71, %if.end65
  br label %do.end80, !dbg !458

if.end75:                                         ; preds = %lor.lhs.false71
  %25 = load i32, i32* %recvResult35, align 4, !dbg !460
  %idxprom76 = sext i32 %25 to i64, !dbg !461
  %arrayidx77 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer39, i64 0, i64 %idxprom76, !dbg !461
  store i8 0, i8* %arrayidx77, align 1, !dbg !462
  %arraydecay78 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer39, i64 0, i64 0, !dbg !463
  %call79 = call i32 @atoi(i8* %arraydecay78) #9, !dbg !464
  store i32 %call79, i32* %data, align 4, !dbg !465
  br label %do.end80, !dbg !466

do.end80:                                         ; preds = %if.end75, %if.then74, %if.then64, %if.then59, %if.then54, %if.then44
  %26 = load i32, i32* %listenSocket37, align 4, !dbg !467
  %cmp81 = icmp ne i32 %26, -1, !dbg !469
  br i1 %cmp81, label %if.then83, label %if.end85, !dbg !470

if.then83:                                        ; preds = %do.end80
  %27 = load i32, i32* %listenSocket37, align 4, !dbg !471
  %call84 = call i32 @close(i32 %27), !dbg !473
  br label %if.end85, !dbg !474

if.end85:                                         ; preds = %if.then83, %do.end80
  %28 = load i32, i32* %acceptSocket38, align 4, !dbg !475
  %cmp86 = icmp ne i32 %28, -1, !dbg !477
  br i1 %cmp86, label %if.then88, label %if.end90, !dbg !478

if.then88:                                        ; preds = %if.end85
  %29 = load i32, i32* %acceptSocket38, align 4, !dbg !479
  %call89 = call i32 @close(i32 %29), !dbg !481
  br label %if.end90, !dbg !482

if.end90:                                         ; preds = %if.then88, %if.end85
  br label %if.end91

if.end91:                                         ; preds = %if.end90, %if.end34
  %call92 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !483
  %tobool93 = icmp ne i32 %call92, 0, !dbg !483
  br i1 %tobool93, label %if.then94, label %if.else108, !dbg !485

if.then94:                                        ; preds = %if.end91
  call void @llvm.dbg.declare(metadata i32* %i, metadata !486, metadata !DIExpression()), !dbg !489
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !490, metadata !DIExpression()), !dbg !491
  %30 = bitcast [10 x i32]* %buffer to i8*, !dbg !491
  call void @llvm.memset.p0i8.i64(i8* align 16 %30, i8 0, i64 40, i1 false), !dbg !491
  %31 = load i32, i32* %data, align 4, !dbg !492
  %cmp95 = icmp sge i32 %31, 0, !dbg !494
  br i1 %cmp95, label %land.lhs.true, label %if.else106, !dbg !495

land.lhs.true:                                    ; preds = %if.then94
  %32 = load i32, i32* %data, align 4, !dbg !496
  %cmp97 = icmp slt i32 %32, 10, !dbg !497
  br i1 %cmp97, label %if.then99, label %if.else106, !dbg !498

if.then99:                                        ; preds = %land.lhs.true
  %33 = load i32, i32* %data, align 4, !dbg !499
  %idxprom100 = sext i32 %33 to i64, !dbg !501
  %arrayidx101 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom100, !dbg !501
  store i32 1, i32* %arrayidx101, align 4, !dbg !502
  store i32 0, i32* %i, align 4, !dbg !503
  br label %for.cond, !dbg !505

for.cond:                                         ; preds = %for.inc, %if.then99
  %34 = load i32, i32* %i, align 4, !dbg !506
  %cmp102 = icmp slt i32 %34, 10, !dbg !508
  br i1 %cmp102, label %for.body, label %for.end, !dbg !509

for.body:                                         ; preds = %for.cond
  %35 = load i32, i32* %i, align 4, !dbg !510
  %idxprom104 = sext i32 %35 to i64, !dbg !512
  %arrayidx105 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom104, !dbg !512
  %36 = load i32, i32* %arrayidx105, align 4, !dbg !512
  call void @printIntLine(i32 %36), !dbg !513
  br label %for.inc, !dbg !514

for.inc:                                          ; preds = %for.body
  %37 = load i32, i32* %i, align 4, !dbg !515
  %inc = add nsw i32 %37, 1, !dbg !515
  store i32 %inc, i32* %i, align 4, !dbg !515
  br label %for.cond, !dbg !516, !llvm.loop !517

for.end:                                          ; preds = %for.cond
  br label %if.end107, !dbg !519

if.else106:                                       ; preds = %land.lhs.true, %if.then94
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !520
  br label %if.end107

if.end107:                                        ; preds = %if.else106, %for.end
  br label %if.end130, !dbg !522

if.else108:                                       ; preds = %if.end91
  call void @llvm.dbg.declare(metadata i32* %i109, metadata !523, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer110, metadata !527, metadata !DIExpression()), !dbg !528
  %38 = bitcast [10 x i32]* %buffer110 to i8*, !dbg !528
  call void @llvm.memset.p0i8.i64(i8* align 16 %38, i8 0, i64 40, i1 false), !dbg !528
  %39 = load i32, i32* %data, align 4, !dbg !529
  %cmp111 = icmp sge i32 %39, 0, !dbg !531
  br i1 %cmp111, label %land.lhs.true113, label %if.else128, !dbg !532

land.lhs.true113:                                 ; preds = %if.else108
  %40 = load i32, i32* %data, align 4, !dbg !533
  %cmp114 = icmp slt i32 %40, 10, !dbg !534
  br i1 %cmp114, label %if.then116, label %if.else128, !dbg !535

if.then116:                                       ; preds = %land.lhs.true113
  %41 = load i32, i32* %data, align 4, !dbg !536
  %idxprom117 = sext i32 %41 to i64, !dbg !538
  %arrayidx118 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer110, i64 0, i64 %idxprom117, !dbg !538
  store i32 1, i32* %arrayidx118, align 4, !dbg !539
  store i32 0, i32* %i109, align 4, !dbg !540
  br label %for.cond119, !dbg !542

for.cond119:                                      ; preds = %for.inc125, %if.then116
  %42 = load i32, i32* %i109, align 4, !dbg !543
  %cmp120 = icmp slt i32 %42, 10, !dbg !545
  br i1 %cmp120, label %for.body122, label %for.end127, !dbg !546

for.body122:                                      ; preds = %for.cond119
  %43 = load i32, i32* %i109, align 4, !dbg !547
  %idxprom123 = sext i32 %43 to i64, !dbg !549
  %arrayidx124 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer110, i64 0, i64 %idxprom123, !dbg !549
  %44 = load i32, i32* %arrayidx124, align 4, !dbg !549
  call void @printIntLine(i32 %44), !dbg !550
  br label %for.inc125, !dbg !551

for.inc125:                                       ; preds = %for.body122
  %45 = load i32, i32* %i109, align 4, !dbg !552
  %inc126 = add nsw i32 %45, 1, !dbg !552
  store i32 %inc126, i32* %i109, align 4, !dbg !552
  br label %for.cond119, !dbg !553, !llvm.loop !554

for.end127:                                       ; preds = %for.cond119
  br label %if.end129, !dbg !556

if.else128:                                       ; preds = %land.lhs.true113, %if.else108
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !557
  br label %if.end129

if.end129:                                        ; preds = %if.else128, %for.end127
  br label %if.end130

if.end130:                                        ; preds = %if.end129, %if.end107
  ret void, !dbg !559
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !560 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %i11 = alloca i32, align 4
  %buffer12 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !561, metadata !DIExpression()), !dbg !562
  store i32 -1, i32* %data, align 4, !dbg !563
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !564
  %tobool = icmp ne i32 %call, 0, !dbg !564
  br i1 %tobool, label %if.then, label %if.else, !dbg !566

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !567
  br label %if.end, !dbg !569

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !570
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !572
  %tobool2 = icmp ne i32 %call1, 0, !dbg !572
  br i1 %tobool2, label %if.then3, label %if.else10, !dbg !574

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !575, metadata !DIExpression()), !dbg !578
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !579, metadata !DIExpression()), !dbg !580
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !580
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !580
  %1 = load i32, i32* %data, align 4, !dbg !581
  %cmp = icmp slt i32 %1, 10, !dbg !583
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !584

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !585
  %idxprom = sext i32 %2 to i64, !dbg !587
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !587
  store i32 1, i32* %arrayidx, align 4, !dbg !588
  store i32 0, i32* %i, align 4, !dbg !589
  br label %for.cond, !dbg !591

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !592
  %cmp5 = icmp slt i32 %3, 10, !dbg !594
  br i1 %cmp5, label %for.body, label %for.end, !dbg !595

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !596
  %idxprom6 = sext i32 %4 to i64, !dbg !598
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !598
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !598
  call void @printIntLine(i32 %5), !dbg !599
  br label %for.inc, !dbg !600

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !601
  %inc = add nsw i32 %6, 1, !dbg !601
  store i32 %inc, i32* %i, align 4, !dbg !601
  br label %for.cond, !dbg !602, !llvm.loop !603

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !605

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !606
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end27, !dbg !608

if.else10:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !609, metadata !DIExpression()), !dbg !612
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer12, metadata !613, metadata !DIExpression()), !dbg !614
  %7 = bitcast [10 x i32]* %buffer12 to i8*, !dbg !614
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 40, i1 false), !dbg !614
  %8 = load i32, i32* %data, align 4, !dbg !615
  %cmp13 = icmp slt i32 %8, 10, !dbg !617
  br i1 %cmp13, label %if.then14, label %if.else25, !dbg !618

if.then14:                                        ; preds = %if.else10
  %9 = load i32, i32* %data, align 4, !dbg !619
  %idxprom15 = sext i32 %9 to i64, !dbg !621
  %arrayidx16 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom15, !dbg !621
  store i32 1, i32* %arrayidx16, align 4, !dbg !622
  store i32 0, i32* %i11, align 4, !dbg !623
  br label %for.cond17, !dbg !625

for.cond17:                                       ; preds = %for.inc22, %if.then14
  %10 = load i32, i32* %i11, align 4, !dbg !626
  %cmp18 = icmp slt i32 %10, 10, !dbg !628
  br i1 %cmp18, label %for.body19, label %for.end24, !dbg !629

for.body19:                                       ; preds = %for.cond17
  %11 = load i32, i32* %i11, align 4, !dbg !630
  %idxprom20 = sext i32 %11 to i64, !dbg !632
  %arrayidx21 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer12, i64 0, i64 %idxprom20, !dbg !632
  %12 = load i32, i32* %arrayidx21, align 4, !dbg !632
  call void @printIntLine(i32 %12), !dbg !633
  br label %for.inc22, !dbg !634

for.inc22:                                        ; preds = %for.body19
  %13 = load i32, i32* %i11, align 4, !dbg !635
  %inc23 = add nsw i32 %13, 1, !dbg !635
  store i32 %inc23, i32* %i11, align 4, !dbg !635
  br label %for.cond17, !dbg !636, !llvm.loop !637

for.end24:                                        ; preds = %for.cond17
  br label %if.end26, !dbg !639

if.else25:                                        ; preds = %if.else10
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !640
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %for.end24
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end9
  ret void, !dbg !642
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_12_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_12.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocation(line: 49, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 49, column: 8)
!81 = !DILocation(line: 49, column: 8, scope: !70)
!82 = !DILocalVariable(name: "recvResult", scope: !83, file: !71, line: 56, type: !76)
!83 = distinct !DILexicalBlock(scope: !84, file: !71, line: 51, column: 9)
!84 = distinct !DILexicalBlock(scope: !80, file: !71, line: 50, column: 5)
!85 = !DILocation(line: 56, column: 17, scope: !83)
!86 = !DILocalVariable(name: "service", scope: !83, file: !71, line: 57, type: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !88)
!88 = !{!89, !90, !94, !98}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !17, line: 240, baseType: !56, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !17, line: 241, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !17, line: 242, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !17, line: 33, baseType: !46, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !17, line: 245, baseType: !99, size: 64, offset: 64)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 64, elements: !101)
!100 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!101 = !{!102}
!102 = !DISubrange(count: 8)
!103 = !DILocation(line: 57, column: 32, scope: !83)
!104 = !DILocalVariable(name: "listenSocket", scope: !83, file: !71, line: 58, type: !76)
!105 = !DILocation(line: 58, column: 20, scope: !83)
!106 = !DILocalVariable(name: "acceptSocket", scope: !83, file: !71, line: 59, type: !76)
!107 = !DILocation(line: 59, column: 20, scope: !83)
!108 = !DILocalVariable(name: "inputBuffer", scope: !83, file: !71, line: 60, type: !60)
!109 = !DILocation(line: 60, column: 18, scope: !83)
!110 = !DILocation(line: 61, column: 13, scope: !83)
!111 = !DILocation(line: 71, column: 32, scope: !112)
!112 = distinct !DILexicalBlock(scope: !83, file: !71, line: 62, column: 13)
!113 = !DILocation(line: 71, column: 30, scope: !112)
!114 = !DILocation(line: 72, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !71, line: 72, column: 21)
!116 = !DILocation(line: 72, column: 34, scope: !115)
!117 = !DILocation(line: 72, column: 21, scope: !112)
!118 = !DILocation(line: 74, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !71, line: 73, column: 17)
!120 = !DILocation(line: 76, column: 17, scope: !112)
!121 = !DILocation(line: 77, column: 25, scope: !112)
!122 = !DILocation(line: 77, column: 36, scope: !112)
!123 = !DILocation(line: 78, column: 25, scope: !112)
!124 = !DILocation(line: 78, column: 34, scope: !112)
!125 = !DILocation(line: 78, column: 41, scope: !112)
!126 = !DILocation(line: 79, column: 36, scope: !112)
!127 = !DILocation(line: 79, column: 25, scope: !112)
!128 = !DILocation(line: 79, column: 34, scope: !112)
!129 = !DILocation(line: 80, column: 26, scope: !130)
!130 = distinct !DILexicalBlock(scope: !112, file: !71, line: 80, column: 21)
!131 = !DILocation(line: 80, column: 40, scope: !130)
!132 = !DILocation(line: 80, column: 21, scope: !130)
!133 = !DILocation(line: 80, column: 85, scope: !130)
!134 = !DILocation(line: 80, column: 21, scope: !112)
!135 = !DILocation(line: 82, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !71, line: 81, column: 17)
!137 = !DILocation(line: 84, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !112, file: !71, line: 84, column: 21)
!139 = !DILocation(line: 84, column: 21, scope: !138)
!140 = !DILocation(line: 84, column: 58, scope: !138)
!141 = !DILocation(line: 84, column: 21, scope: !112)
!142 = !DILocation(line: 86, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !138, file: !71, line: 85, column: 17)
!144 = !DILocation(line: 88, column: 39, scope: !112)
!145 = !DILocation(line: 88, column: 32, scope: !112)
!146 = !DILocation(line: 88, column: 30, scope: !112)
!147 = !DILocation(line: 89, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !112, file: !71, line: 89, column: 21)
!149 = !DILocation(line: 89, column: 34, scope: !148)
!150 = !DILocation(line: 89, column: 21, scope: !112)
!151 = !DILocation(line: 91, column: 21, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !71, line: 90, column: 17)
!153 = !DILocation(line: 94, column: 35, scope: !112)
!154 = !DILocation(line: 94, column: 49, scope: !112)
!155 = !DILocation(line: 94, column: 30, scope: !112)
!156 = !DILocation(line: 94, column: 28, scope: !112)
!157 = !DILocation(line: 95, column: 21, scope: !158)
!158 = distinct !DILexicalBlock(scope: !112, file: !71, line: 95, column: 21)
!159 = !DILocation(line: 95, column: 32, scope: !158)
!160 = !DILocation(line: 95, column: 48, scope: !158)
!161 = !DILocation(line: 95, column: 51, scope: !158)
!162 = !DILocation(line: 95, column: 62, scope: !158)
!163 = !DILocation(line: 95, column: 21, scope: !112)
!164 = !DILocation(line: 97, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !71, line: 96, column: 17)
!166 = !DILocation(line: 100, column: 29, scope: !112)
!167 = !DILocation(line: 100, column: 17, scope: !112)
!168 = !DILocation(line: 100, column: 41, scope: !112)
!169 = !DILocation(line: 102, column: 29, scope: !112)
!170 = !DILocation(line: 102, column: 24, scope: !112)
!171 = !DILocation(line: 102, column: 22, scope: !112)
!172 = !DILocation(line: 103, column: 13, scope: !112)
!173 = !DILocation(line: 105, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !83, file: !71, line: 105, column: 17)
!175 = !DILocation(line: 105, column: 30, scope: !174)
!176 = !DILocation(line: 105, column: 17, scope: !83)
!177 = !DILocation(line: 107, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !71, line: 106, column: 13)
!179 = !DILocation(line: 107, column: 17, scope: !178)
!180 = !DILocation(line: 108, column: 13, scope: !178)
!181 = !DILocation(line: 109, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !83, file: !71, line: 109, column: 17)
!183 = !DILocation(line: 109, column: 30, scope: !182)
!184 = !DILocation(line: 109, column: 17, scope: !83)
!185 = !DILocation(line: 111, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !71, line: 110, column: 13)
!187 = !DILocation(line: 111, column: 17, scope: !186)
!188 = !DILocation(line: 112, column: 13, scope: !186)
!189 = !DILocation(line: 120, column: 5, scope: !84)
!190 = !DILocation(line: 125, column: 14, scope: !191)
!191 = distinct !DILexicalBlock(scope: !80, file: !71, line: 122, column: 5)
!192 = !DILocation(line: 127, column: 8, scope: !193)
!193 = distinct !DILexicalBlock(scope: !70, file: !71, line: 127, column: 8)
!194 = !DILocation(line: 127, column: 8, scope: !70)
!195 = !DILocalVariable(name: "i", scope: !196, file: !71, line: 130, type: !76)
!196 = distinct !DILexicalBlock(scope: !197, file: !71, line: 129, column: 9)
!197 = distinct !DILexicalBlock(scope: !193, file: !71, line: 128, column: 5)
!198 = !DILocation(line: 130, column: 17, scope: !196)
!199 = !DILocalVariable(name: "buffer", scope: !196, file: !71, line: 131, type: !200)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !201)
!201 = !{!202}
!202 = !DISubrange(count: 10)
!203 = !DILocation(line: 131, column: 17, scope: !196)
!204 = !DILocation(line: 134, column: 17, scope: !205)
!205 = distinct !DILexicalBlock(scope: !196, file: !71, line: 134, column: 17)
!206 = !DILocation(line: 134, column: 22, scope: !205)
!207 = !DILocation(line: 134, column: 17, scope: !196)
!208 = !DILocation(line: 136, column: 24, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !71, line: 135, column: 13)
!210 = !DILocation(line: 136, column: 17, scope: !209)
!211 = !DILocation(line: 136, column: 30, scope: !209)
!212 = !DILocation(line: 138, column: 23, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !71, line: 138, column: 17)
!214 = !DILocation(line: 138, column: 21, scope: !213)
!215 = !DILocation(line: 138, column: 28, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !71, line: 138, column: 17)
!217 = !DILocation(line: 138, column: 30, scope: !216)
!218 = !DILocation(line: 138, column: 17, scope: !213)
!219 = !DILocation(line: 140, column: 41, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !71, line: 139, column: 17)
!221 = !DILocation(line: 140, column: 34, scope: !220)
!222 = !DILocation(line: 140, column: 21, scope: !220)
!223 = !DILocation(line: 141, column: 17, scope: !220)
!224 = !DILocation(line: 138, column: 37, scope: !216)
!225 = !DILocation(line: 138, column: 17, scope: !216)
!226 = distinct !{!226, !218, !227, !228}
!227 = !DILocation(line: 141, column: 17, scope: !213)
!228 = !{!"llvm.loop.mustprogress"}
!229 = !DILocation(line: 142, column: 13, scope: !209)
!230 = !DILocation(line: 145, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !205, file: !71, line: 144, column: 13)
!232 = !DILocation(line: 148, column: 5, scope: !197)
!233 = !DILocalVariable(name: "i", scope: !234, file: !71, line: 152, type: !76)
!234 = distinct !DILexicalBlock(scope: !235, file: !71, line: 151, column: 9)
!235 = distinct !DILexicalBlock(scope: !193, file: !71, line: 150, column: 5)
!236 = !DILocation(line: 152, column: 17, scope: !234)
!237 = !DILocalVariable(name: "buffer", scope: !234, file: !71, line: 153, type: !200)
!238 = !DILocation(line: 153, column: 17, scope: !234)
!239 = !DILocation(line: 155, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !234, file: !71, line: 155, column: 17)
!241 = !DILocation(line: 155, column: 22, scope: !240)
!242 = !DILocation(line: 155, column: 27, scope: !240)
!243 = !DILocation(line: 155, column: 30, scope: !240)
!244 = !DILocation(line: 155, column: 35, scope: !240)
!245 = !DILocation(line: 155, column: 17, scope: !234)
!246 = !DILocation(line: 157, column: 24, scope: !247)
!247 = distinct !DILexicalBlock(scope: !240, file: !71, line: 156, column: 13)
!248 = !DILocation(line: 157, column: 17, scope: !247)
!249 = !DILocation(line: 157, column: 30, scope: !247)
!250 = !DILocation(line: 159, column: 23, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !71, line: 159, column: 17)
!252 = !DILocation(line: 159, column: 21, scope: !251)
!253 = !DILocation(line: 159, column: 28, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !71, line: 159, column: 17)
!255 = !DILocation(line: 159, column: 30, scope: !254)
!256 = !DILocation(line: 159, column: 17, scope: !251)
!257 = !DILocation(line: 161, column: 41, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !71, line: 160, column: 17)
!259 = !DILocation(line: 161, column: 34, scope: !258)
!260 = !DILocation(line: 161, column: 21, scope: !258)
!261 = !DILocation(line: 162, column: 17, scope: !258)
!262 = !DILocation(line: 159, column: 37, scope: !254)
!263 = !DILocation(line: 159, column: 17, scope: !254)
!264 = distinct !{!264, !256, !265, !228}
!265 = !DILocation(line: 162, column: 17, scope: !251)
!266 = !DILocation(line: 163, column: 13, scope: !247)
!267 = !DILocation(line: 166, column: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !240, file: !71, line: 165, column: 13)
!269 = !DILocation(line: 170, column: 1, scope: !70)
!270 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_12_good", scope: !71, file: !71, line: 438, type: !72, scopeLine: 439, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!271 = !DILocation(line: 440, column: 5, scope: !270)
!272 = !DILocation(line: 441, column: 5, scope: !270)
!273 = !DILocation(line: 442, column: 1, scope: !270)
!274 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 453, type: !275, scopeLine: 454, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!275 = !DISubroutineType(types: !276)
!276 = !{!76, !76, !277}
!277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !278, size: 64)
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!279 = !DILocalVariable(name: "argc", arg: 1, scope: !274, file: !71, line: 453, type: !76)
!280 = !DILocation(line: 453, column: 14, scope: !274)
!281 = !DILocalVariable(name: "argv", arg: 2, scope: !274, file: !71, line: 453, type: !277)
!282 = !DILocation(line: 453, column: 27, scope: !274)
!283 = !DILocation(line: 456, column: 22, scope: !274)
!284 = !DILocation(line: 456, column: 12, scope: !274)
!285 = !DILocation(line: 456, column: 5, scope: !274)
!286 = !DILocation(line: 458, column: 5, scope: !274)
!287 = !DILocation(line: 459, column: 5, scope: !274)
!288 = !DILocation(line: 460, column: 5, scope: !274)
!289 = !DILocation(line: 463, column: 5, scope: !274)
!290 = !DILocation(line: 464, column: 5, scope: !274)
!291 = !DILocation(line: 465, column: 5, scope: !274)
!292 = !DILocation(line: 467, column: 5, scope: !274)
!293 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 179, type: !72, scopeLine: 180, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!294 = !DILocalVariable(name: "data", scope: !293, file: !71, line: 181, type: !76)
!295 = !DILocation(line: 181, column: 9, scope: !293)
!296 = !DILocation(line: 183, column: 10, scope: !293)
!297 = !DILocation(line: 184, column: 8, scope: !298)
!298 = distinct !DILexicalBlock(scope: !293, file: !71, line: 184, column: 8)
!299 = !DILocation(line: 184, column: 8, scope: !293)
!300 = !DILocalVariable(name: "recvResult", scope: !301, file: !71, line: 191, type: !76)
!301 = distinct !DILexicalBlock(scope: !302, file: !71, line: 186, column: 9)
!302 = distinct !DILexicalBlock(scope: !298, file: !71, line: 185, column: 5)
!303 = !DILocation(line: 191, column: 17, scope: !301)
!304 = !DILocalVariable(name: "service", scope: !301, file: !71, line: 192, type: !87)
!305 = !DILocation(line: 192, column: 32, scope: !301)
!306 = !DILocalVariable(name: "listenSocket", scope: !301, file: !71, line: 193, type: !76)
!307 = !DILocation(line: 193, column: 20, scope: !301)
!308 = !DILocalVariable(name: "acceptSocket", scope: !301, file: !71, line: 194, type: !76)
!309 = !DILocation(line: 194, column: 20, scope: !301)
!310 = !DILocalVariable(name: "inputBuffer", scope: !301, file: !71, line: 195, type: !60)
!311 = !DILocation(line: 195, column: 18, scope: !301)
!312 = !DILocation(line: 196, column: 13, scope: !301)
!313 = !DILocation(line: 206, column: 32, scope: !314)
!314 = distinct !DILexicalBlock(scope: !301, file: !71, line: 197, column: 13)
!315 = !DILocation(line: 206, column: 30, scope: !314)
!316 = !DILocation(line: 207, column: 21, scope: !317)
!317 = distinct !DILexicalBlock(scope: !314, file: !71, line: 207, column: 21)
!318 = !DILocation(line: 207, column: 34, scope: !317)
!319 = !DILocation(line: 207, column: 21, scope: !314)
!320 = !DILocation(line: 209, column: 21, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !71, line: 208, column: 17)
!322 = !DILocation(line: 211, column: 17, scope: !314)
!323 = !DILocation(line: 212, column: 25, scope: !314)
!324 = !DILocation(line: 212, column: 36, scope: !314)
!325 = !DILocation(line: 213, column: 25, scope: !314)
!326 = !DILocation(line: 213, column: 34, scope: !314)
!327 = !DILocation(line: 213, column: 41, scope: !314)
!328 = !DILocation(line: 214, column: 36, scope: !314)
!329 = !DILocation(line: 214, column: 25, scope: !314)
!330 = !DILocation(line: 214, column: 34, scope: !314)
!331 = !DILocation(line: 215, column: 26, scope: !332)
!332 = distinct !DILexicalBlock(scope: !314, file: !71, line: 215, column: 21)
!333 = !DILocation(line: 215, column: 40, scope: !332)
!334 = !DILocation(line: 215, column: 21, scope: !332)
!335 = !DILocation(line: 215, column: 85, scope: !332)
!336 = !DILocation(line: 215, column: 21, scope: !314)
!337 = !DILocation(line: 217, column: 21, scope: !338)
!338 = distinct !DILexicalBlock(scope: !332, file: !71, line: 216, column: 17)
!339 = !DILocation(line: 219, column: 28, scope: !340)
!340 = distinct !DILexicalBlock(scope: !314, file: !71, line: 219, column: 21)
!341 = !DILocation(line: 219, column: 21, scope: !340)
!342 = !DILocation(line: 219, column: 58, scope: !340)
!343 = !DILocation(line: 219, column: 21, scope: !314)
!344 = !DILocation(line: 221, column: 21, scope: !345)
!345 = distinct !DILexicalBlock(scope: !340, file: !71, line: 220, column: 17)
!346 = !DILocation(line: 223, column: 39, scope: !314)
!347 = !DILocation(line: 223, column: 32, scope: !314)
!348 = !DILocation(line: 223, column: 30, scope: !314)
!349 = !DILocation(line: 224, column: 21, scope: !350)
!350 = distinct !DILexicalBlock(scope: !314, file: !71, line: 224, column: 21)
!351 = !DILocation(line: 224, column: 34, scope: !350)
!352 = !DILocation(line: 224, column: 21, scope: !314)
!353 = !DILocation(line: 226, column: 21, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !71, line: 225, column: 17)
!355 = !DILocation(line: 229, column: 35, scope: !314)
!356 = !DILocation(line: 229, column: 49, scope: !314)
!357 = !DILocation(line: 229, column: 30, scope: !314)
!358 = !DILocation(line: 229, column: 28, scope: !314)
!359 = !DILocation(line: 230, column: 21, scope: !360)
!360 = distinct !DILexicalBlock(scope: !314, file: !71, line: 230, column: 21)
!361 = !DILocation(line: 230, column: 32, scope: !360)
!362 = !DILocation(line: 230, column: 48, scope: !360)
!363 = !DILocation(line: 230, column: 51, scope: !360)
!364 = !DILocation(line: 230, column: 62, scope: !360)
!365 = !DILocation(line: 230, column: 21, scope: !314)
!366 = !DILocation(line: 232, column: 21, scope: !367)
!367 = distinct !DILexicalBlock(scope: !360, file: !71, line: 231, column: 17)
!368 = !DILocation(line: 235, column: 29, scope: !314)
!369 = !DILocation(line: 235, column: 17, scope: !314)
!370 = !DILocation(line: 235, column: 41, scope: !314)
!371 = !DILocation(line: 237, column: 29, scope: !314)
!372 = !DILocation(line: 237, column: 24, scope: !314)
!373 = !DILocation(line: 237, column: 22, scope: !314)
!374 = !DILocation(line: 238, column: 13, scope: !314)
!375 = !DILocation(line: 240, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !301, file: !71, line: 240, column: 17)
!377 = !DILocation(line: 240, column: 30, scope: !376)
!378 = !DILocation(line: 240, column: 17, scope: !301)
!379 = !DILocation(line: 242, column: 30, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !71, line: 241, column: 13)
!381 = !DILocation(line: 242, column: 17, scope: !380)
!382 = !DILocation(line: 243, column: 13, scope: !380)
!383 = !DILocation(line: 244, column: 17, scope: !384)
!384 = distinct !DILexicalBlock(scope: !301, file: !71, line: 244, column: 17)
!385 = !DILocation(line: 244, column: 30, scope: !384)
!386 = !DILocation(line: 244, column: 17, scope: !301)
!387 = !DILocation(line: 246, column: 30, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !71, line: 245, column: 13)
!389 = !DILocation(line: 246, column: 17, scope: !388)
!390 = !DILocation(line: 247, column: 13, scope: !388)
!391 = !DILocation(line: 255, column: 5, scope: !302)
!392 = !DILocalVariable(name: "recvResult", scope: !393, file: !71, line: 263, type: !76)
!393 = distinct !DILexicalBlock(scope: !394, file: !71, line: 258, column: 9)
!394 = distinct !DILexicalBlock(scope: !298, file: !71, line: 257, column: 5)
!395 = !DILocation(line: 263, column: 17, scope: !393)
!396 = !DILocalVariable(name: "service", scope: !393, file: !71, line: 264, type: !87)
!397 = !DILocation(line: 264, column: 32, scope: !393)
!398 = !DILocalVariable(name: "listenSocket", scope: !393, file: !71, line: 265, type: !76)
!399 = !DILocation(line: 265, column: 20, scope: !393)
!400 = !DILocalVariable(name: "acceptSocket", scope: !393, file: !71, line: 266, type: !76)
!401 = !DILocation(line: 266, column: 20, scope: !393)
!402 = !DILocalVariable(name: "inputBuffer", scope: !393, file: !71, line: 267, type: !60)
!403 = !DILocation(line: 267, column: 18, scope: !393)
!404 = !DILocation(line: 268, column: 13, scope: !393)
!405 = !DILocation(line: 278, column: 32, scope: !406)
!406 = distinct !DILexicalBlock(scope: !393, file: !71, line: 269, column: 13)
!407 = !DILocation(line: 278, column: 30, scope: !406)
!408 = !DILocation(line: 279, column: 21, scope: !409)
!409 = distinct !DILexicalBlock(scope: !406, file: !71, line: 279, column: 21)
!410 = !DILocation(line: 279, column: 34, scope: !409)
!411 = !DILocation(line: 279, column: 21, scope: !406)
!412 = !DILocation(line: 281, column: 21, scope: !413)
!413 = distinct !DILexicalBlock(scope: !409, file: !71, line: 280, column: 17)
!414 = !DILocation(line: 283, column: 17, scope: !406)
!415 = !DILocation(line: 284, column: 25, scope: !406)
!416 = !DILocation(line: 284, column: 36, scope: !406)
!417 = !DILocation(line: 285, column: 25, scope: !406)
!418 = !DILocation(line: 285, column: 34, scope: !406)
!419 = !DILocation(line: 285, column: 41, scope: !406)
!420 = !DILocation(line: 286, column: 36, scope: !406)
!421 = !DILocation(line: 286, column: 25, scope: !406)
!422 = !DILocation(line: 286, column: 34, scope: !406)
!423 = !DILocation(line: 287, column: 26, scope: !424)
!424 = distinct !DILexicalBlock(scope: !406, file: !71, line: 287, column: 21)
!425 = !DILocation(line: 287, column: 40, scope: !424)
!426 = !DILocation(line: 287, column: 21, scope: !424)
!427 = !DILocation(line: 287, column: 85, scope: !424)
!428 = !DILocation(line: 287, column: 21, scope: !406)
!429 = !DILocation(line: 289, column: 21, scope: !430)
!430 = distinct !DILexicalBlock(scope: !424, file: !71, line: 288, column: 17)
!431 = !DILocation(line: 291, column: 28, scope: !432)
!432 = distinct !DILexicalBlock(scope: !406, file: !71, line: 291, column: 21)
!433 = !DILocation(line: 291, column: 21, scope: !432)
!434 = !DILocation(line: 291, column: 58, scope: !432)
!435 = !DILocation(line: 291, column: 21, scope: !406)
!436 = !DILocation(line: 293, column: 21, scope: !437)
!437 = distinct !DILexicalBlock(scope: !432, file: !71, line: 292, column: 17)
!438 = !DILocation(line: 295, column: 39, scope: !406)
!439 = !DILocation(line: 295, column: 32, scope: !406)
!440 = !DILocation(line: 295, column: 30, scope: !406)
!441 = !DILocation(line: 296, column: 21, scope: !442)
!442 = distinct !DILexicalBlock(scope: !406, file: !71, line: 296, column: 21)
!443 = !DILocation(line: 296, column: 34, scope: !442)
!444 = !DILocation(line: 296, column: 21, scope: !406)
!445 = !DILocation(line: 298, column: 21, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !71, line: 297, column: 17)
!447 = !DILocation(line: 301, column: 35, scope: !406)
!448 = !DILocation(line: 301, column: 49, scope: !406)
!449 = !DILocation(line: 301, column: 30, scope: !406)
!450 = !DILocation(line: 301, column: 28, scope: !406)
!451 = !DILocation(line: 302, column: 21, scope: !452)
!452 = distinct !DILexicalBlock(scope: !406, file: !71, line: 302, column: 21)
!453 = !DILocation(line: 302, column: 32, scope: !452)
!454 = !DILocation(line: 302, column: 48, scope: !452)
!455 = !DILocation(line: 302, column: 51, scope: !452)
!456 = !DILocation(line: 302, column: 62, scope: !452)
!457 = !DILocation(line: 302, column: 21, scope: !406)
!458 = !DILocation(line: 304, column: 21, scope: !459)
!459 = distinct !DILexicalBlock(scope: !452, file: !71, line: 303, column: 17)
!460 = !DILocation(line: 307, column: 29, scope: !406)
!461 = !DILocation(line: 307, column: 17, scope: !406)
!462 = !DILocation(line: 307, column: 41, scope: !406)
!463 = !DILocation(line: 309, column: 29, scope: !406)
!464 = !DILocation(line: 309, column: 24, scope: !406)
!465 = !DILocation(line: 309, column: 22, scope: !406)
!466 = !DILocation(line: 310, column: 13, scope: !406)
!467 = !DILocation(line: 312, column: 17, scope: !468)
!468 = distinct !DILexicalBlock(scope: !393, file: !71, line: 312, column: 17)
!469 = !DILocation(line: 312, column: 30, scope: !468)
!470 = !DILocation(line: 312, column: 17, scope: !393)
!471 = !DILocation(line: 314, column: 30, scope: !472)
!472 = distinct !DILexicalBlock(scope: !468, file: !71, line: 313, column: 13)
!473 = !DILocation(line: 314, column: 17, scope: !472)
!474 = !DILocation(line: 315, column: 13, scope: !472)
!475 = !DILocation(line: 316, column: 17, scope: !476)
!476 = distinct !DILexicalBlock(scope: !393, file: !71, line: 316, column: 17)
!477 = !DILocation(line: 316, column: 30, scope: !476)
!478 = !DILocation(line: 316, column: 17, scope: !393)
!479 = !DILocation(line: 318, column: 30, scope: !480)
!480 = distinct !DILexicalBlock(scope: !476, file: !71, line: 317, column: 13)
!481 = !DILocation(line: 318, column: 17, scope: !480)
!482 = !DILocation(line: 319, column: 13, scope: !480)
!483 = !DILocation(line: 328, column: 8, scope: !484)
!484 = distinct !DILexicalBlock(scope: !293, file: !71, line: 328, column: 8)
!485 = !DILocation(line: 328, column: 8, scope: !293)
!486 = !DILocalVariable(name: "i", scope: !487, file: !71, line: 331, type: !76)
!487 = distinct !DILexicalBlock(scope: !488, file: !71, line: 330, column: 9)
!488 = distinct !DILexicalBlock(scope: !484, file: !71, line: 329, column: 5)
!489 = !DILocation(line: 331, column: 17, scope: !487)
!490 = !DILocalVariable(name: "buffer", scope: !487, file: !71, line: 332, type: !200)
!491 = !DILocation(line: 332, column: 17, scope: !487)
!492 = !DILocation(line: 334, column: 17, scope: !493)
!493 = distinct !DILexicalBlock(scope: !487, file: !71, line: 334, column: 17)
!494 = !DILocation(line: 334, column: 22, scope: !493)
!495 = !DILocation(line: 334, column: 27, scope: !493)
!496 = !DILocation(line: 334, column: 30, scope: !493)
!497 = !DILocation(line: 334, column: 35, scope: !493)
!498 = !DILocation(line: 334, column: 17, scope: !487)
!499 = !DILocation(line: 336, column: 24, scope: !500)
!500 = distinct !DILexicalBlock(scope: !493, file: !71, line: 335, column: 13)
!501 = !DILocation(line: 336, column: 17, scope: !500)
!502 = !DILocation(line: 336, column: 30, scope: !500)
!503 = !DILocation(line: 338, column: 23, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !71, line: 338, column: 17)
!505 = !DILocation(line: 338, column: 21, scope: !504)
!506 = !DILocation(line: 338, column: 28, scope: !507)
!507 = distinct !DILexicalBlock(scope: !504, file: !71, line: 338, column: 17)
!508 = !DILocation(line: 338, column: 30, scope: !507)
!509 = !DILocation(line: 338, column: 17, scope: !504)
!510 = !DILocation(line: 340, column: 41, scope: !511)
!511 = distinct !DILexicalBlock(scope: !507, file: !71, line: 339, column: 17)
!512 = !DILocation(line: 340, column: 34, scope: !511)
!513 = !DILocation(line: 340, column: 21, scope: !511)
!514 = !DILocation(line: 341, column: 17, scope: !511)
!515 = !DILocation(line: 338, column: 37, scope: !507)
!516 = !DILocation(line: 338, column: 17, scope: !507)
!517 = distinct !{!517, !509, !518, !228}
!518 = !DILocation(line: 341, column: 17, scope: !504)
!519 = !DILocation(line: 342, column: 13, scope: !500)
!520 = !DILocation(line: 345, column: 17, scope: !521)
!521 = distinct !DILexicalBlock(scope: !493, file: !71, line: 344, column: 13)
!522 = !DILocation(line: 348, column: 5, scope: !488)
!523 = !DILocalVariable(name: "i", scope: !524, file: !71, line: 352, type: !76)
!524 = distinct !DILexicalBlock(scope: !525, file: !71, line: 351, column: 9)
!525 = distinct !DILexicalBlock(scope: !484, file: !71, line: 350, column: 5)
!526 = !DILocation(line: 352, column: 17, scope: !524)
!527 = !DILocalVariable(name: "buffer", scope: !524, file: !71, line: 353, type: !200)
!528 = !DILocation(line: 353, column: 17, scope: !524)
!529 = !DILocation(line: 355, column: 17, scope: !530)
!530 = distinct !DILexicalBlock(scope: !524, file: !71, line: 355, column: 17)
!531 = !DILocation(line: 355, column: 22, scope: !530)
!532 = !DILocation(line: 355, column: 27, scope: !530)
!533 = !DILocation(line: 355, column: 30, scope: !530)
!534 = !DILocation(line: 355, column: 35, scope: !530)
!535 = !DILocation(line: 355, column: 17, scope: !524)
!536 = !DILocation(line: 357, column: 24, scope: !537)
!537 = distinct !DILexicalBlock(scope: !530, file: !71, line: 356, column: 13)
!538 = !DILocation(line: 357, column: 17, scope: !537)
!539 = !DILocation(line: 357, column: 30, scope: !537)
!540 = !DILocation(line: 359, column: 23, scope: !541)
!541 = distinct !DILexicalBlock(scope: !537, file: !71, line: 359, column: 17)
!542 = !DILocation(line: 359, column: 21, scope: !541)
!543 = !DILocation(line: 359, column: 28, scope: !544)
!544 = distinct !DILexicalBlock(scope: !541, file: !71, line: 359, column: 17)
!545 = !DILocation(line: 359, column: 30, scope: !544)
!546 = !DILocation(line: 359, column: 17, scope: !541)
!547 = !DILocation(line: 361, column: 41, scope: !548)
!548 = distinct !DILexicalBlock(scope: !544, file: !71, line: 360, column: 17)
!549 = !DILocation(line: 361, column: 34, scope: !548)
!550 = !DILocation(line: 361, column: 21, scope: !548)
!551 = !DILocation(line: 362, column: 17, scope: !548)
!552 = !DILocation(line: 359, column: 37, scope: !544)
!553 = !DILocation(line: 359, column: 17, scope: !544)
!554 = distinct !{!554, !546, !555, !228}
!555 = !DILocation(line: 362, column: 17, scope: !541)
!556 = !DILocation(line: 363, column: 13, scope: !537)
!557 = !DILocation(line: 366, column: 17, scope: !558)
!558 = distinct !DILexicalBlock(scope: !530, file: !71, line: 365, column: 13)
!559 = !DILocation(line: 370, column: 1, scope: !293)
!560 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 375, type: !72, scopeLine: 376, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!561 = !DILocalVariable(name: "data", scope: !560, file: !71, line: 377, type: !76)
!562 = !DILocation(line: 377, column: 9, scope: !560)
!563 = !DILocation(line: 379, column: 10, scope: !560)
!564 = !DILocation(line: 380, column: 8, scope: !565)
!565 = distinct !DILexicalBlock(scope: !560, file: !71, line: 380, column: 8)
!566 = !DILocation(line: 380, column: 8, scope: !560)
!567 = !DILocation(line: 384, column: 14, scope: !568)
!568 = distinct !DILexicalBlock(scope: !565, file: !71, line: 381, column: 5)
!569 = !DILocation(line: 385, column: 5, scope: !568)
!570 = !DILocation(line: 390, column: 14, scope: !571)
!571 = distinct !DILexicalBlock(scope: !565, file: !71, line: 387, column: 5)
!572 = !DILocation(line: 392, column: 8, scope: !573)
!573 = distinct !DILexicalBlock(scope: !560, file: !71, line: 392, column: 8)
!574 = !DILocation(line: 392, column: 8, scope: !560)
!575 = !DILocalVariable(name: "i", scope: !576, file: !71, line: 395, type: !76)
!576 = distinct !DILexicalBlock(scope: !577, file: !71, line: 394, column: 9)
!577 = distinct !DILexicalBlock(scope: !573, file: !71, line: 393, column: 5)
!578 = !DILocation(line: 395, column: 17, scope: !576)
!579 = !DILocalVariable(name: "buffer", scope: !576, file: !71, line: 396, type: !200)
!580 = !DILocation(line: 396, column: 17, scope: !576)
!581 = !DILocation(line: 399, column: 17, scope: !582)
!582 = distinct !DILexicalBlock(scope: !576, file: !71, line: 399, column: 17)
!583 = !DILocation(line: 399, column: 22, scope: !582)
!584 = !DILocation(line: 399, column: 17, scope: !576)
!585 = !DILocation(line: 401, column: 24, scope: !586)
!586 = distinct !DILexicalBlock(scope: !582, file: !71, line: 400, column: 13)
!587 = !DILocation(line: 401, column: 17, scope: !586)
!588 = !DILocation(line: 401, column: 30, scope: !586)
!589 = !DILocation(line: 403, column: 23, scope: !590)
!590 = distinct !DILexicalBlock(scope: !586, file: !71, line: 403, column: 17)
!591 = !DILocation(line: 403, column: 21, scope: !590)
!592 = !DILocation(line: 403, column: 28, scope: !593)
!593 = distinct !DILexicalBlock(scope: !590, file: !71, line: 403, column: 17)
!594 = !DILocation(line: 403, column: 30, scope: !593)
!595 = !DILocation(line: 403, column: 17, scope: !590)
!596 = !DILocation(line: 405, column: 41, scope: !597)
!597 = distinct !DILexicalBlock(scope: !593, file: !71, line: 404, column: 17)
!598 = !DILocation(line: 405, column: 34, scope: !597)
!599 = !DILocation(line: 405, column: 21, scope: !597)
!600 = !DILocation(line: 406, column: 17, scope: !597)
!601 = !DILocation(line: 403, column: 37, scope: !593)
!602 = !DILocation(line: 403, column: 17, scope: !593)
!603 = distinct !{!603, !595, !604, !228}
!604 = !DILocation(line: 406, column: 17, scope: !590)
!605 = !DILocation(line: 407, column: 13, scope: !586)
!606 = !DILocation(line: 410, column: 17, scope: !607)
!607 = distinct !DILexicalBlock(scope: !582, file: !71, line: 409, column: 13)
!608 = !DILocation(line: 413, column: 5, scope: !577)
!609 = !DILocalVariable(name: "i", scope: !610, file: !71, line: 417, type: !76)
!610 = distinct !DILexicalBlock(scope: !611, file: !71, line: 416, column: 9)
!611 = distinct !DILexicalBlock(scope: !573, file: !71, line: 415, column: 5)
!612 = !DILocation(line: 417, column: 17, scope: !610)
!613 = !DILocalVariable(name: "buffer", scope: !610, file: !71, line: 418, type: !200)
!614 = !DILocation(line: 418, column: 17, scope: !610)
!615 = !DILocation(line: 421, column: 17, scope: !616)
!616 = distinct !DILexicalBlock(scope: !610, file: !71, line: 421, column: 17)
!617 = !DILocation(line: 421, column: 22, scope: !616)
!618 = !DILocation(line: 421, column: 17, scope: !610)
!619 = !DILocation(line: 423, column: 24, scope: !620)
!620 = distinct !DILexicalBlock(scope: !616, file: !71, line: 422, column: 13)
!621 = !DILocation(line: 423, column: 17, scope: !620)
!622 = !DILocation(line: 423, column: 30, scope: !620)
!623 = !DILocation(line: 425, column: 23, scope: !624)
!624 = distinct !DILexicalBlock(scope: !620, file: !71, line: 425, column: 17)
!625 = !DILocation(line: 425, column: 21, scope: !624)
!626 = !DILocation(line: 425, column: 28, scope: !627)
!627 = distinct !DILexicalBlock(scope: !624, file: !71, line: 425, column: 17)
!628 = !DILocation(line: 425, column: 30, scope: !627)
!629 = !DILocation(line: 425, column: 17, scope: !624)
!630 = !DILocation(line: 427, column: 41, scope: !631)
!631 = distinct !DILexicalBlock(scope: !627, file: !71, line: 426, column: 17)
!632 = !DILocation(line: 427, column: 34, scope: !631)
!633 = !DILocation(line: 427, column: 21, scope: !631)
!634 = !DILocation(line: 428, column: 17, scope: !631)
!635 = !DILocation(line: 425, column: 37, scope: !627)
!636 = !DILocation(line: 425, column: 17, scope: !627)
!637 = distinct !{!637, !629, !638, !228}
!638 = !DILocation(line: 428, column: 17, scope: !624)
!639 = !DILocation(line: 429, column: 13, scope: !620)
!640 = !DILocation(line: 432, column: 17, scope: !641)
!641 = distinct !DILexicalBlock(scope: !616, file: !71, line: 431, column: 13)
!642 = !DILocation(line: 436, column: 1, scope: !560)
