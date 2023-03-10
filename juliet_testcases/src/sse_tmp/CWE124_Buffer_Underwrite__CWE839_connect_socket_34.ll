; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_34.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType = type { i32 }
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_34_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data21 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType* %myUnion, metadata !73, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !81, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !84, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %connectSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  br label %do.body, !dbg !111

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !112
  store i32 %call, i32* %connectSocket, align 4, !dbg !114
  %0 = load i32, i32* %connectSocket, align 4, !dbg !115
  %cmp = icmp eq i32 %0, -1, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !119

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !121
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !122
  store i16 2, i16* %sin_family, align 4, !dbg !123
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !124
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !125
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !126
  store i32 %call1, i32* %s_addr, align 4, !dbg !127
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !128
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !129
  store i16 %call2, i16* %sin_port, align 2, !dbg !130
  %2 = load i32, i32* %connectSocket, align 4, !dbg !131
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !133
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !134
  %cmp4 = icmp eq i32 %call3, -1, !dbg !135
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !136

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !137

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !139
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !140
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !141
  %conv = trunc i64 %call7 to i32, !dbg !141
  store i32 %conv, i32* %recvResult, align 4, !dbg !142
  %5 = load i32, i32* %recvResult, align 4, !dbg !143
  %cmp8 = icmp eq i32 %5, -1, !dbg !145
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !146

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !147
  %cmp10 = icmp eq i32 %6, 0, !dbg !148
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !149

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !150

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !152
  %idxprom = sext i32 %7 to i64, !dbg !153
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !156
  store i32 %call15, i32* %data, align 4, !dbg !157
  br label %do.end, !dbg !158

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !159
  %cmp16 = icmp ne i32 %8, -1, !dbg !161
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !162

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !163
  %call19 = call i32 @close(i32 %9), !dbg !165
  br label %if.end20, !dbg !166

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !167
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !168
  store i32 %10, i32* %unionFirst, align 4, !dbg !169
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !170, metadata !DIExpression()), !dbg !172
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !173
  %11 = load i32, i32* %unionSecond, align 4, !dbg !173
  store i32 %11, i32* %data21, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata i32* %i, metadata !174, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !177, metadata !DIExpression()), !dbg !181
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !181
  %13 = load i32, i32* %data21, align 4, !dbg !182
  %cmp22 = icmp slt i32 %13, 10, !dbg !184
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !185

if.then24:                                        ; preds = %if.end20
  %14 = load i32, i32* %data21, align 4, !dbg !186
  %idxprom25 = sext i32 %14 to i64, !dbg !188
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !188
  store i32 1, i32* %arrayidx26, align 4, !dbg !189
  store i32 0, i32* %i, align 4, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %if.then24
  %15 = load i32, i32* %i, align 4, !dbg !193
  %cmp27 = icmp slt i32 %15, 10, !dbg !195
  br i1 %cmp27, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  %16 = load i32, i32* %i, align 4, !dbg !197
  %idxprom29 = sext i32 %16 to i64, !dbg !199
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !199
  %17 = load i32, i32* %arrayidx30, align 4, !dbg !199
  call void @printIntLine(i32 %17), !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4, !dbg !202
  %inc = add nsw i32 %18, 1, !dbg !202
  store i32 %inc, i32* %i, align 4, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  br label %if.end31, !dbg !207

if.else:                                          ; preds = %if.end20
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !208
  br label %if.end31

if.end31:                                         ; preds = %if.else, %for.end
  ret void, !dbg !210
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_34_good() #0 !dbg !211 {
entry:
  call void @goodG2B(), !dbg !212
  call void @goodB2G(), !dbg !213
  ret void, !dbg !214
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !215 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !220, metadata !DIExpression()), !dbg !221
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !222, metadata !DIExpression()), !dbg !223
  %call = call i64 @time(i64* null) #7, !dbg !224
  %conv = trunc i64 %call to i32, !dbg !225
  call void @srand(i32 %conv) #7, !dbg !226
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !227
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_34_good(), !dbg !228
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !229
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !230
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_34_bad(), !dbg !231
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !232
  ret i32 0, !dbg !233
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !234 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType* %myUnion, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 -1, i32* %data, align 4, !dbg !239
  store i32 7, i32* %data, align 4, !dbg !240
  %0 = load i32, i32* %data, align 4, !dbg !241
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !242
  store i32 %0, i32* %unionFirst, align 4, !dbg !243
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !244, metadata !DIExpression()), !dbg !246
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !247
  %1 = load i32, i32* %unionSecond, align 4, !dbg !247
  store i32 %1, i32* %data1, align 4, !dbg !246
  call void @llvm.dbg.declare(metadata i32* %i, metadata !248, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !251, metadata !DIExpression()), !dbg !252
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !252
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !252
  %3 = load i32, i32* %data1, align 4, !dbg !253
  %cmp = icmp slt i32 %3, 10, !dbg !255
  br i1 %cmp, label %if.then, label %if.else, !dbg !256

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !257
  %idxprom = sext i32 %4 to i64, !dbg !259
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !259
  store i32 1, i32* %arrayidx, align 4, !dbg !260
  store i32 0, i32* %i, align 4, !dbg !261
  br label %for.cond, !dbg !263

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !264
  %cmp2 = icmp slt i32 %5, 10, !dbg !266
  br i1 %cmp2, label %for.body, label %for.end, !dbg !267

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !268
  %idxprom3 = sext i32 %6 to i64, !dbg !270
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !270
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !270
  call void @printIntLine(i32 %7), !dbg !271
  br label %for.inc, !dbg !272

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !273
  %inc = add nsw i32 %8, 1, !dbg !273
  store i32 %inc, i32* %i, align 4, !dbg !273
  br label %for.cond, !dbg !274, !llvm.loop !275

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !277

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !278
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !280
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !281 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data21 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !282, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.declare(metadata %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType* %myUnion, metadata !284, metadata !DIExpression()), !dbg !285
  store i32 -1, i32* %data, align 4, !dbg !286
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !287, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !290, metadata !DIExpression()), !dbg !291
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !292, metadata !DIExpression()), !dbg !293
  store i32 -1, i32* %connectSocket, align 4, !dbg !293
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !294, metadata !DIExpression()), !dbg !295
  br label %do.body, !dbg !296

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !297
  store i32 %call, i32* %connectSocket, align 4, !dbg !299
  %0 = load i32, i32* %connectSocket, align 4, !dbg !300
  %cmp = icmp eq i32 %0, -1, !dbg !302
  br i1 %cmp, label %if.then, label %if.end, !dbg !303

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !304

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !306
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !306
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !307
  store i16 2, i16* %sin_family, align 4, !dbg !308
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !309
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !310
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !311
  store i32 %call1, i32* %s_addr, align 4, !dbg !312
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !313
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !314
  store i16 %call2, i16* %sin_port, align 2, !dbg !315
  %2 = load i32, i32* %connectSocket, align 4, !dbg !316
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !318
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !319
  %cmp4 = icmp eq i32 %call3, -1, !dbg !320
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !321

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !322

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !324
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !325
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !326
  %conv = trunc i64 %call7 to i32, !dbg !326
  store i32 %conv, i32* %recvResult, align 4, !dbg !327
  %5 = load i32, i32* %recvResult, align 4, !dbg !328
  %cmp8 = icmp eq i32 %5, -1, !dbg !330
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !331

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !332
  %cmp10 = icmp eq i32 %6, 0, !dbg !333
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !334

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !335

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !337
  %idxprom = sext i32 %7 to i64, !dbg !338
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !338
  store i8 0, i8* %arrayidx, align 1, !dbg !339
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !340
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !341
  store i32 %call15, i32* %data, align 4, !dbg !342
  br label %do.end, !dbg !343

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !344
  %cmp16 = icmp ne i32 %8, -1, !dbg !346
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !347

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !348
  %call19 = call i32 @close(i32 %9), !dbg !350
  br label %if.end20, !dbg !351

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !352
  %unionFirst = bitcast %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !353
  store i32 %10, i32* %unionFirst, align 4, !dbg !354
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !355, metadata !DIExpression()), !dbg !357
  %unionSecond = bitcast %union.CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType* %myUnion to i32*, !dbg !358
  %11 = load i32, i32* %unionSecond, align 4, !dbg !358
  store i32 %11, i32* %data21, align 4, !dbg !357
  call void @llvm.dbg.declare(metadata i32* %i, metadata !359, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !362, metadata !DIExpression()), !dbg !363
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !363
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !363
  %13 = load i32, i32* %data21, align 4, !dbg !364
  %cmp22 = icmp sge i32 %13, 0, !dbg !366
  br i1 %cmp22, label %land.lhs.true, label %if.else, !dbg !367

land.lhs.true:                                    ; preds = %if.end20
  %14 = load i32, i32* %data21, align 4, !dbg !368
  %cmp24 = icmp slt i32 %14, 10, !dbg !369
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !370

if.then26:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data21, align 4, !dbg !371
  %idxprom27 = sext i32 %15 to i64, !dbg !373
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !373
  store i32 1, i32* %arrayidx28, align 4, !dbg !374
  store i32 0, i32* %i, align 4, !dbg !375
  br label %for.cond, !dbg !377

for.cond:                                         ; preds = %for.inc, %if.then26
  %16 = load i32, i32* %i, align 4, !dbg !378
  %cmp29 = icmp slt i32 %16, 10, !dbg !380
  br i1 %cmp29, label %for.body, label %for.end, !dbg !381

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !382
  %idxprom31 = sext i32 %17 to i64, !dbg !384
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom31, !dbg !384
  %18 = load i32, i32* %arrayidx32, align 4, !dbg !384
  call void @printIntLine(i32 %18), !dbg !385
  br label %for.inc, !dbg !386

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !387
  %inc = add nsw i32 %19, 1, !dbg !387
  store i32 %inc, i32* %i, align 4, !dbg !387
  br label %for.cond, !dbg !388, !llvm.loop !389

for.end:                                          ; preds = %for.cond
  br label %if.end33, !dbg !391

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !392
  br label %if.end33

if.end33:                                         ; preds = %if.else, %for.end
  ret void, !dbg !394
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_34_bad", scope: !66, file: !66, line: 50, type: !67, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_34.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 52, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 52, column: 9, scope: !65)
!73 = !DILocalVariable(name: "myUnion", scope: !65, file: !66, line: 53, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_34_unionType", file: !66, line: 46, baseType: !75)
!75 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !66, line: 42, size: 32, elements: !76)
!76 = !{!77, !78}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !75, file: !66, line: 44, baseType: !71, size: 32)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !75, file: !66, line: 45, baseType: !71, size: 32)
!79 = !DILocation(line: 53, column: 66, scope: !65)
!80 = !DILocation(line: 55, column: 10, scope: !65)
!81 = !DILocalVariable(name: "recvResult", scope: !82, file: !66, line: 61, type: !71)
!82 = distinct !DILexicalBlock(scope: !65, file: !66, line: 56, column: 5)
!83 = !DILocation(line: 61, column: 13, scope: !82)
!84 = !DILocalVariable(name: "service", scope: !82, file: !66, line: 62, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !86)
!86 = !{!87, !88, !94, !101}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !85, file: !17, line: 240, baseType: !51, size: 16)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !85, file: !17, line: 241, baseType: !89, size: 16, offset: 16)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !91, line: 25, baseType: !92)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !93, line: 40, baseType: !53)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !85, file: !17, line: 242, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !17, line: 33, baseType: !98, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !91, line: 26, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !93, line: 42, baseType: !5)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !85, file: !17, line: 245, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 62, column: 28, scope: !82)
!107 = !DILocalVariable(name: "connectSocket", scope: !82, file: !66, line: 63, type: !71)
!108 = !DILocation(line: 63, column: 16, scope: !82)
!109 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !66, line: 64, type: !55)
!110 = !DILocation(line: 64, column: 14, scope: !82)
!111 = !DILocation(line: 65, column: 9, scope: !82)
!112 = !DILocation(line: 75, column: 29, scope: !113)
!113 = distinct !DILexicalBlock(scope: !82, file: !66, line: 66, column: 9)
!114 = !DILocation(line: 75, column: 27, scope: !113)
!115 = !DILocation(line: 76, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !66, line: 76, column: 17)
!117 = !DILocation(line: 76, column: 31, scope: !116)
!118 = !DILocation(line: 76, column: 17, scope: !113)
!119 = !DILocation(line: 78, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !66, line: 77, column: 13)
!121 = !DILocation(line: 80, column: 13, scope: !113)
!122 = !DILocation(line: 81, column: 21, scope: !113)
!123 = !DILocation(line: 81, column: 32, scope: !113)
!124 = !DILocation(line: 82, column: 39, scope: !113)
!125 = !DILocation(line: 82, column: 21, scope: !113)
!126 = !DILocation(line: 82, column: 30, scope: !113)
!127 = !DILocation(line: 82, column: 37, scope: !113)
!128 = !DILocation(line: 83, column: 32, scope: !113)
!129 = !DILocation(line: 83, column: 21, scope: !113)
!130 = !DILocation(line: 83, column: 30, scope: !113)
!131 = !DILocation(line: 84, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !113, file: !66, line: 84, column: 17)
!133 = !DILocation(line: 84, column: 40, scope: !132)
!134 = !DILocation(line: 84, column: 17, scope: !132)
!135 = !DILocation(line: 84, column: 85, scope: !132)
!136 = !DILocation(line: 84, column: 17, scope: !113)
!137 = !DILocation(line: 86, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !66, line: 85, column: 13)
!139 = !DILocation(line: 90, column: 31, scope: !113)
!140 = !DILocation(line: 90, column: 46, scope: !113)
!141 = !DILocation(line: 90, column: 26, scope: !113)
!142 = !DILocation(line: 90, column: 24, scope: !113)
!143 = !DILocation(line: 91, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !113, file: !66, line: 91, column: 17)
!145 = !DILocation(line: 91, column: 28, scope: !144)
!146 = !DILocation(line: 91, column: 44, scope: !144)
!147 = !DILocation(line: 91, column: 47, scope: !144)
!148 = !DILocation(line: 91, column: 58, scope: !144)
!149 = !DILocation(line: 91, column: 17, scope: !113)
!150 = !DILocation(line: 93, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !144, file: !66, line: 92, column: 13)
!152 = !DILocation(line: 96, column: 25, scope: !113)
!153 = !DILocation(line: 96, column: 13, scope: !113)
!154 = !DILocation(line: 96, column: 37, scope: !113)
!155 = !DILocation(line: 98, column: 25, scope: !113)
!156 = !DILocation(line: 98, column: 20, scope: !113)
!157 = !DILocation(line: 98, column: 18, scope: !113)
!158 = !DILocation(line: 99, column: 9, scope: !113)
!159 = !DILocation(line: 101, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !82, file: !66, line: 101, column: 13)
!161 = !DILocation(line: 101, column: 27, scope: !160)
!162 = !DILocation(line: 101, column: 13, scope: !82)
!163 = !DILocation(line: 103, column: 26, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !66, line: 102, column: 9)
!165 = !DILocation(line: 103, column: 13, scope: !164)
!166 = !DILocation(line: 104, column: 9, scope: !164)
!167 = !DILocation(line: 112, column: 26, scope: !65)
!168 = !DILocation(line: 112, column: 13, scope: !65)
!169 = !DILocation(line: 112, column: 24, scope: !65)
!170 = !DILocalVariable(name: "data", scope: !171, file: !66, line: 114, type: !71)
!171 = distinct !DILexicalBlock(scope: !65, file: !66, line: 113, column: 5)
!172 = !DILocation(line: 114, column: 13, scope: !171)
!173 = !DILocation(line: 114, column: 28, scope: !171)
!174 = !DILocalVariable(name: "i", scope: !175, file: !66, line: 116, type: !71)
!175 = distinct !DILexicalBlock(scope: !171, file: !66, line: 115, column: 9)
!176 = !DILocation(line: 116, column: 17, scope: !175)
!177 = !DILocalVariable(name: "buffer", scope: !175, file: !66, line: 117, type: !178)
!178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !179)
!179 = !{!180}
!180 = !DISubrange(count: 10)
!181 = !DILocation(line: 117, column: 17, scope: !175)
!182 = !DILocation(line: 120, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !175, file: !66, line: 120, column: 17)
!184 = !DILocation(line: 120, column: 22, scope: !183)
!185 = !DILocation(line: 120, column: 17, scope: !175)
!186 = !DILocation(line: 122, column: 24, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !66, line: 121, column: 13)
!188 = !DILocation(line: 122, column: 17, scope: !187)
!189 = !DILocation(line: 122, column: 30, scope: !187)
!190 = !DILocation(line: 124, column: 23, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !66, line: 124, column: 17)
!192 = !DILocation(line: 124, column: 21, scope: !191)
!193 = !DILocation(line: 124, column: 28, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !66, line: 124, column: 17)
!195 = !DILocation(line: 124, column: 30, scope: !194)
!196 = !DILocation(line: 124, column: 17, scope: !191)
!197 = !DILocation(line: 126, column: 41, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !66, line: 125, column: 17)
!199 = !DILocation(line: 126, column: 34, scope: !198)
!200 = !DILocation(line: 126, column: 21, scope: !198)
!201 = !DILocation(line: 127, column: 17, scope: !198)
!202 = !DILocation(line: 124, column: 37, scope: !194)
!203 = !DILocation(line: 124, column: 17, scope: !194)
!204 = distinct !{!204, !196, !205, !206}
!205 = !DILocation(line: 127, column: 17, scope: !191)
!206 = !{!"llvm.loop.mustprogress"}
!207 = !DILocation(line: 128, column: 13, scope: !187)
!208 = !DILocation(line: 131, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !183, file: !66, line: 130, column: 13)
!210 = !DILocation(line: 135, column: 1, scope: !65)
!211 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_34_good", scope: !66, file: !66, line: 263, type: !67, scopeLine: 264, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!212 = !DILocation(line: 265, column: 5, scope: !211)
!213 = !DILocation(line: 266, column: 5, scope: !211)
!214 = !DILocation(line: 267, column: 1, scope: !211)
!215 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 277, type: !216, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!216 = !DISubroutineType(types: !217)
!217 = !{!71, !71, !218}
!218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !219, size: 64)
!219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!220 = !DILocalVariable(name: "argc", arg: 1, scope: !215, file: !66, line: 277, type: !71)
!221 = !DILocation(line: 277, column: 14, scope: !215)
!222 = !DILocalVariable(name: "argv", arg: 2, scope: !215, file: !66, line: 277, type: !218)
!223 = !DILocation(line: 277, column: 27, scope: !215)
!224 = !DILocation(line: 280, column: 22, scope: !215)
!225 = !DILocation(line: 280, column: 12, scope: !215)
!226 = !DILocation(line: 280, column: 5, scope: !215)
!227 = !DILocation(line: 282, column: 5, scope: !215)
!228 = !DILocation(line: 283, column: 5, scope: !215)
!229 = !DILocation(line: 284, column: 5, scope: !215)
!230 = !DILocation(line: 287, column: 5, scope: !215)
!231 = !DILocation(line: 288, column: 5, scope: !215)
!232 = !DILocation(line: 289, column: 5, scope: !215)
!233 = !DILocation(line: 291, column: 5, scope: !215)
!234 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 142, type: !67, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!235 = !DILocalVariable(name: "data", scope: !234, file: !66, line: 144, type: !71)
!236 = !DILocation(line: 144, column: 9, scope: !234)
!237 = !DILocalVariable(name: "myUnion", scope: !234, file: !66, line: 145, type: !74)
!238 = !DILocation(line: 145, column: 66, scope: !234)
!239 = !DILocation(line: 147, column: 10, scope: !234)
!240 = !DILocation(line: 150, column: 10, scope: !234)
!241 = !DILocation(line: 151, column: 26, scope: !234)
!242 = !DILocation(line: 151, column: 13, scope: !234)
!243 = !DILocation(line: 151, column: 24, scope: !234)
!244 = !DILocalVariable(name: "data", scope: !245, file: !66, line: 153, type: !71)
!245 = distinct !DILexicalBlock(scope: !234, file: !66, line: 152, column: 5)
!246 = !DILocation(line: 153, column: 13, scope: !245)
!247 = !DILocation(line: 153, column: 28, scope: !245)
!248 = !DILocalVariable(name: "i", scope: !249, file: !66, line: 155, type: !71)
!249 = distinct !DILexicalBlock(scope: !245, file: !66, line: 154, column: 9)
!250 = !DILocation(line: 155, column: 17, scope: !249)
!251 = !DILocalVariable(name: "buffer", scope: !249, file: !66, line: 156, type: !178)
!252 = !DILocation(line: 156, column: 17, scope: !249)
!253 = !DILocation(line: 159, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !249, file: !66, line: 159, column: 17)
!255 = !DILocation(line: 159, column: 22, scope: !254)
!256 = !DILocation(line: 159, column: 17, scope: !249)
!257 = !DILocation(line: 161, column: 24, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !66, line: 160, column: 13)
!259 = !DILocation(line: 161, column: 17, scope: !258)
!260 = !DILocation(line: 161, column: 30, scope: !258)
!261 = !DILocation(line: 163, column: 23, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !66, line: 163, column: 17)
!263 = !DILocation(line: 163, column: 21, scope: !262)
!264 = !DILocation(line: 163, column: 28, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !66, line: 163, column: 17)
!266 = !DILocation(line: 163, column: 30, scope: !265)
!267 = !DILocation(line: 163, column: 17, scope: !262)
!268 = !DILocation(line: 165, column: 41, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !66, line: 164, column: 17)
!270 = !DILocation(line: 165, column: 34, scope: !269)
!271 = !DILocation(line: 165, column: 21, scope: !269)
!272 = !DILocation(line: 166, column: 17, scope: !269)
!273 = !DILocation(line: 163, column: 37, scope: !265)
!274 = !DILocation(line: 163, column: 17, scope: !265)
!275 = distinct !{!275, !267, !276, !206}
!276 = !DILocation(line: 166, column: 17, scope: !262)
!277 = !DILocation(line: 167, column: 13, scope: !258)
!278 = !DILocation(line: 170, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !254, file: !66, line: 169, column: 13)
!280 = !DILocation(line: 174, column: 1, scope: !234)
!281 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 177, type: !67, scopeLine: 178, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!282 = !DILocalVariable(name: "data", scope: !281, file: !66, line: 179, type: !71)
!283 = !DILocation(line: 179, column: 9, scope: !281)
!284 = !DILocalVariable(name: "myUnion", scope: !281, file: !66, line: 180, type: !74)
!285 = !DILocation(line: 180, column: 66, scope: !281)
!286 = !DILocation(line: 182, column: 10, scope: !281)
!287 = !DILocalVariable(name: "recvResult", scope: !288, file: !66, line: 188, type: !71)
!288 = distinct !DILexicalBlock(scope: !281, file: !66, line: 183, column: 5)
!289 = !DILocation(line: 188, column: 13, scope: !288)
!290 = !DILocalVariable(name: "service", scope: !288, file: !66, line: 189, type: !85)
!291 = !DILocation(line: 189, column: 28, scope: !288)
!292 = !DILocalVariable(name: "connectSocket", scope: !288, file: !66, line: 190, type: !71)
!293 = !DILocation(line: 190, column: 16, scope: !288)
!294 = !DILocalVariable(name: "inputBuffer", scope: !288, file: !66, line: 191, type: !55)
!295 = !DILocation(line: 191, column: 14, scope: !288)
!296 = !DILocation(line: 192, column: 9, scope: !288)
!297 = !DILocation(line: 202, column: 29, scope: !298)
!298 = distinct !DILexicalBlock(scope: !288, file: !66, line: 193, column: 9)
!299 = !DILocation(line: 202, column: 27, scope: !298)
!300 = !DILocation(line: 203, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !298, file: !66, line: 203, column: 17)
!302 = !DILocation(line: 203, column: 31, scope: !301)
!303 = !DILocation(line: 203, column: 17, scope: !298)
!304 = !DILocation(line: 205, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !66, line: 204, column: 13)
!306 = !DILocation(line: 207, column: 13, scope: !298)
!307 = !DILocation(line: 208, column: 21, scope: !298)
!308 = !DILocation(line: 208, column: 32, scope: !298)
!309 = !DILocation(line: 209, column: 39, scope: !298)
!310 = !DILocation(line: 209, column: 21, scope: !298)
!311 = !DILocation(line: 209, column: 30, scope: !298)
!312 = !DILocation(line: 209, column: 37, scope: !298)
!313 = !DILocation(line: 210, column: 32, scope: !298)
!314 = !DILocation(line: 210, column: 21, scope: !298)
!315 = !DILocation(line: 210, column: 30, scope: !298)
!316 = !DILocation(line: 211, column: 25, scope: !317)
!317 = distinct !DILexicalBlock(scope: !298, file: !66, line: 211, column: 17)
!318 = !DILocation(line: 211, column: 40, scope: !317)
!319 = !DILocation(line: 211, column: 17, scope: !317)
!320 = !DILocation(line: 211, column: 85, scope: !317)
!321 = !DILocation(line: 211, column: 17, scope: !298)
!322 = !DILocation(line: 213, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !317, file: !66, line: 212, column: 13)
!324 = !DILocation(line: 217, column: 31, scope: !298)
!325 = !DILocation(line: 217, column: 46, scope: !298)
!326 = !DILocation(line: 217, column: 26, scope: !298)
!327 = !DILocation(line: 217, column: 24, scope: !298)
!328 = !DILocation(line: 218, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !298, file: !66, line: 218, column: 17)
!330 = !DILocation(line: 218, column: 28, scope: !329)
!331 = !DILocation(line: 218, column: 44, scope: !329)
!332 = !DILocation(line: 218, column: 47, scope: !329)
!333 = !DILocation(line: 218, column: 58, scope: !329)
!334 = !DILocation(line: 218, column: 17, scope: !298)
!335 = !DILocation(line: 220, column: 17, scope: !336)
!336 = distinct !DILexicalBlock(scope: !329, file: !66, line: 219, column: 13)
!337 = !DILocation(line: 223, column: 25, scope: !298)
!338 = !DILocation(line: 223, column: 13, scope: !298)
!339 = !DILocation(line: 223, column: 37, scope: !298)
!340 = !DILocation(line: 225, column: 25, scope: !298)
!341 = !DILocation(line: 225, column: 20, scope: !298)
!342 = !DILocation(line: 225, column: 18, scope: !298)
!343 = !DILocation(line: 226, column: 9, scope: !298)
!344 = !DILocation(line: 228, column: 13, scope: !345)
!345 = distinct !DILexicalBlock(scope: !288, file: !66, line: 228, column: 13)
!346 = !DILocation(line: 228, column: 27, scope: !345)
!347 = !DILocation(line: 228, column: 13, scope: !288)
!348 = !DILocation(line: 230, column: 26, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !66, line: 229, column: 9)
!350 = !DILocation(line: 230, column: 13, scope: !349)
!351 = !DILocation(line: 231, column: 9, scope: !349)
!352 = !DILocation(line: 239, column: 26, scope: !281)
!353 = !DILocation(line: 239, column: 13, scope: !281)
!354 = !DILocation(line: 239, column: 24, scope: !281)
!355 = !DILocalVariable(name: "data", scope: !356, file: !66, line: 241, type: !71)
!356 = distinct !DILexicalBlock(scope: !281, file: !66, line: 240, column: 5)
!357 = !DILocation(line: 241, column: 13, scope: !356)
!358 = !DILocation(line: 241, column: 28, scope: !356)
!359 = !DILocalVariable(name: "i", scope: !360, file: !66, line: 243, type: !71)
!360 = distinct !DILexicalBlock(scope: !356, file: !66, line: 242, column: 9)
!361 = !DILocation(line: 243, column: 17, scope: !360)
!362 = !DILocalVariable(name: "buffer", scope: !360, file: !66, line: 244, type: !178)
!363 = !DILocation(line: 244, column: 17, scope: !360)
!364 = !DILocation(line: 246, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !360, file: !66, line: 246, column: 17)
!366 = !DILocation(line: 246, column: 22, scope: !365)
!367 = !DILocation(line: 246, column: 27, scope: !365)
!368 = !DILocation(line: 246, column: 30, scope: !365)
!369 = !DILocation(line: 246, column: 35, scope: !365)
!370 = !DILocation(line: 246, column: 17, scope: !360)
!371 = !DILocation(line: 248, column: 24, scope: !372)
!372 = distinct !DILexicalBlock(scope: !365, file: !66, line: 247, column: 13)
!373 = !DILocation(line: 248, column: 17, scope: !372)
!374 = !DILocation(line: 248, column: 30, scope: !372)
!375 = !DILocation(line: 250, column: 23, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !66, line: 250, column: 17)
!377 = !DILocation(line: 250, column: 21, scope: !376)
!378 = !DILocation(line: 250, column: 28, scope: !379)
!379 = distinct !DILexicalBlock(scope: !376, file: !66, line: 250, column: 17)
!380 = !DILocation(line: 250, column: 30, scope: !379)
!381 = !DILocation(line: 250, column: 17, scope: !376)
!382 = !DILocation(line: 252, column: 41, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !66, line: 251, column: 17)
!384 = !DILocation(line: 252, column: 34, scope: !383)
!385 = !DILocation(line: 252, column: 21, scope: !383)
!386 = !DILocation(line: 253, column: 17, scope: !383)
!387 = !DILocation(line: 250, column: 37, scope: !379)
!388 = !DILocation(line: 250, column: 17, scope: !379)
!389 = distinct !{!389, !381, !390, !206}
!390 = !DILocation(line: 253, column: 17, scope: !376)
!391 = !DILocation(line: 254, column: 13, scope: !372)
!392 = !DILocation(line: 257, column: 17, scope: !393)
!393 = distinct !DILexicalBlock(scope: !365, file: !66, line: 256, column: 13)
!394 = !DILocation(line: 261, column: 1, scope: !281)
