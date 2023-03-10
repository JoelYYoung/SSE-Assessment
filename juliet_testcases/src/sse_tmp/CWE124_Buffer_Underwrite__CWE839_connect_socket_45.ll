; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_45.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@CWE124_Buffer_Underwrite__CWE839_connect_socket_45_badData = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE124_Buffer_Underwrite__CWE839_connect_socket_45_goodG2BData = internal global i32 0, align 4, !dbg !62
@CWE124_Buffer_Underwrite__CWE839_connect_socket_45_goodB2GData = internal global i32 0, align 4, !dbg !66
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_45_bad() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
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
  store i32 %10, i32* @CWE124_Buffer_Underwrite__CWE839_connect_socket_45_badData, align 4, !dbg !168
  call void @badSink(), !dbg !169
  ret void, !dbg !170
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_45_good() #0 !dbg !171 {
entry:
  call void @goodG2B(), !dbg !172
  call void @goodB2G(), !dbg !173
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !175 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !180, metadata !DIExpression()), !dbg !181
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !182, metadata !DIExpression()), !dbg !183
  %call = call i64 @time(i64* null) #7, !dbg !184
  %conv = trunc i64 %call to i32, !dbg !185
  call void @srand(i32 %conv) #7, !dbg !186
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !187
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_45_good(), !dbg !188
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !189
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !190
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_45_bad(), !dbg !191
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !192
  ret i32 0, !dbg !193
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !194 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !195, metadata !DIExpression()), !dbg !196
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__CWE839_connect_socket_45_badData, align 4, !dbg !197
  store i32 %0, i32* %data, align 4, !dbg !196
  call void @llvm.dbg.declare(metadata i32* %i, metadata !198, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !201, metadata !DIExpression()), !dbg !205
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !205
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !205
  %2 = load i32, i32* %data, align 4, !dbg !206
  %cmp = icmp slt i32 %2, 10, !dbg !208
  br i1 %cmp, label %if.then, label %if.else, !dbg !209

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !210
  %idxprom = sext i32 %3 to i64, !dbg !212
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !212
  store i32 1, i32* %arrayidx, align 4, !dbg !213
  store i32 0, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !216

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !217
  %cmp1 = icmp slt i32 %4, 10, !dbg !219
  br i1 %cmp1, label %for.body, label %for.end, !dbg !220

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !221
  %idxprom2 = sext i32 %5 to i64, !dbg !223
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !223
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !223
  call void @printIntLine(i32 %6), !dbg !224
  br label %for.inc, !dbg !225

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !226
  %inc = add nsw i32 %7, 1, !dbg !226
  store i32 %inc, i32* %i, align 4, !dbg !226
  br label %for.cond, !dbg !227, !llvm.loop !228

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !231

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !232
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !234
}

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !235 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !236, metadata !DIExpression()), !dbg !237
  store i32 -1, i32* %data, align 4, !dbg !238
  store i32 7, i32* %data, align 4, !dbg !239
  %0 = load i32, i32* %data, align 4, !dbg !240
  store i32 %0, i32* @CWE124_Buffer_Underwrite__CWE839_connect_socket_45_goodG2BData, align 4, !dbg !241
  call void @goodG2BSink(), !dbg !242
  ret void, !dbg !243
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !244 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !245, metadata !DIExpression()), !dbg !246
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__CWE839_connect_socket_45_goodG2BData, align 4, !dbg !247
  store i32 %0, i32* %data, align 4, !dbg !246
  call void @llvm.dbg.declare(metadata i32* %i, metadata !248, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !251, metadata !DIExpression()), !dbg !252
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !252
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !252
  %2 = load i32, i32* %data, align 4, !dbg !253
  %cmp = icmp slt i32 %2, 10, !dbg !255
  br i1 %cmp, label %if.then, label %if.else, !dbg !256

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !257
  %idxprom = sext i32 %3 to i64, !dbg !259
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !259
  store i32 1, i32* %arrayidx, align 4, !dbg !260
  store i32 0, i32* %i, align 4, !dbg !261
  br label %for.cond, !dbg !263

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !264
  %cmp1 = icmp slt i32 %4, 10, !dbg !266
  br i1 %cmp1, label %for.body, label %for.end, !dbg !267

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !268
  %idxprom2 = sext i32 %5 to i64, !dbg !270
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !270
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !270
  call void @printIntLine(i32 %6), !dbg !271
  br label %for.inc, !dbg !272

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !273
  %inc = add nsw i32 %7, 1, !dbg !273
  store i32 %inc, i32* %i, align 4, !dbg !273
  br label %for.cond, !dbg !274, !llvm.loop !275

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !277

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !278
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !280
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !281 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !282, metadata !DIExpression()), !dbg !283
  store i32 -1, i32* %data, align 4, !dbg !284
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !285, metadata !DIExpression()), !dbg !287
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !288, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !290, metadata !DIExpression()), !dbg !291
  store i32 -1, i32* %connectSocket, align 4, !dbg !291
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !292, metadata !DIExpression()), !dbg !293
  br label %do.body, !dbg !294

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !295
  store i32 %call, i32* %connectSocket, align 4, !dbg !297
  %0 = load i32, i32* %connectSocket, align 4, !dbg !298
  %cmp = icmp eq i32 %0, -1, !dbg !300
  br i1 %cmp, label %if.then, label %if.end, !dbg !301

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !302

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !304
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !304
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !305
  store i16 2, i16* %sin_family, align 4, !dbg !306
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !307
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !308
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !309
  store i32 %call1, i32* %s_addr, align 4, !dbg !310
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !311
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !312
  store i16 %call2, i16* %sin_port, align 2, !dbg !313
  %2 = load i32, i32* %connectSocket, align 4, !dbg !314
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !316
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !317
  %cmp4 = icmp eq i32 %call3, -1, !dbg !318
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !319

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !320

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !322
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !323
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !324
  %conv = trunc i64 %call7 to i32, !dbg !324
  store i32 %conv, i32* %recvResult, align 4, !dbg !325
  %5 = load i32, i32* %recvResult, align 4, !dbg !326
  %cmp8 = icmp eq i32 %5, -1, !dbg !328
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !329

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !330
  %cmp10 = icmp eq i32 %6, 0, !dbg !331
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !332

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !333

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !335
  %idxprom = sext i32 %7 to i64, !dbg !336
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !336
  store i8 0, i8* %arrayidx, align 1, !dbg !337
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !338
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !339
  store i32 %call15, i32* %data, align 4, !dbg !340
  br label %do.end, !dbg !341

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !342
  %cmp16 = icmp ne i32 %8, -1, !dbg !344
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !345

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !346
  %call19 = call i32 @close(i32 %9), !dbg !348
  br label %if.end20, !dbg !349

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !350
  store i32 %10, i32* @CWE124_Buffer_Underwrite__CWE839_connect_socket_45_goodB2GData, align 4, !dbg !351
  call void @goodB2GSink(), !dbg !352
  ret void, !dbg !353
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink() #0 !dbg !354 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !355, metadata !DIExpression()), !dbg !356
  %0 = load i32, i32* @CWE124_Buffer_Underwrite__CWE839_connect_socket_45_goodB2GData, align 4, !dbg !357
  store i32 %0, i32* %data, align 4, !dbg !356
  call void @llvm.dbg.declare(metadata i32* %i, metadata !358, metadata !DIExpression()), !dbg !360
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !361, metadata !DIExpression()), !dbg !362
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !362
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !362
  %2 = load i32, i32* %data, align 4, !dbg !363
  %cmp = icmp sge i32 %2, 0, !dbg !365
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !366

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !367
  %cmp1 = icmp slt i32 %3, 10, !dbg !368
  br i1 %cmp1, label %if.then, label %if.else, !dbg !369

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !370
  %idxprom = sext i32 %4 to i64, !dbg !372
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !372
  store i32 1, i32* %arrayidx, align 4, !dbg !373
  store i32 0, i32* %i, align 4, !dbg !374
  br label %for.cond, !dbg !376

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !377
  %cmp2 = icmp slt i32 %5, 10, !dbg !379
  br i1 %cmp2, label %for.body, label %for.end, !dbg !380

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !381
  %idxprom3 = sext i32 %6 to i64, !dbg !383
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !383
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !383
  call void @printIntLine(i32 %7), !dbg !384
  br label %for.inc, !dbg !385

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !386
  %inc = add nsw i32 %8, 1, !dbg !386
  store i32 %inc, i32* %i, align 4, !dbg !386
  br label %for.cond, !dbg !387, !llvm.loop !388

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !390

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !391
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !393
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!68, !69, !70, !71, !72}
!llvm.ident = !{!73}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_45_badData", scope: !2, file: !64, line: 42, type: !65, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !61, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{!5, !18}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !6, line: 24, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17}
!9 = !DIEnumerator(name: "SOCK_STREAM", value: 1)
!10 = !DIEnumerator(name: "SOCK_DGRAM", value: 2)
!11 = !DIEnumerator(name: "SOCK_RAW", value: 3)
!12 = !DIEnumerator(name: "SOCK_RDM", value: 4)
!13 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5)
!14 = !DIEnumerator(name: "SOCK_DCCP", value: 6)
!15 = !DIEnumerator(name: "SOCK_PACKET", value: 10)
!16 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288)
!17 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048)
!18 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !19, line: 40, baseType: !7, size: 32, elements: !20)
!19 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!20 = !{!21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46}
!21 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!22 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!23 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!24 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!25 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!26 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!27 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!28 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!29 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!30 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!31 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!32 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!33 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!34 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!35 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!36 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!37 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!38 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!39 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!40 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!41 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!42 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!43 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!44 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!45 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!46 = !DIEnumerator(name: "IPPROTO_MAX", value: 256)
!47 = !{!48, !7}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !50, line: 178, size: 128, elements: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!51 = !{!52, !56}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !49, file: !50, line: 180, baseType: !53, size: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !54, line: 28, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!55 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !49, file: !50, line: 181, baseType: !57, size: 112, offset: 16)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 112, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 14)
!61 = !{!0, !62, !66}
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_45_goodG2BData", scope: !2, file: !64, line: 43, type: !65, isLocal: true, isDefinition: true)
!64 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_45.c", directory: "/home/joelyang/SSE-Assessment")
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_45_goodB2GData", scope: !2, file: !64, line: 44, type: !65, isLocal: true, isDefinition: true)
!68 = !{i32 7, !"Dwarf Version", i32 4}
!69 = !{i32 2, !"Debug Info Version", i32 3}
!70 = !{i32 1, !"wchar_size", i32 4}
!71 = !{i32 7, !"uwtable", i32 1}
!72 = !{i32 7, !"frame-pointer", i32 2}
!73 = !{!"clang version 13.0.0"}
!74 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_45_bad", scope: !64, file: !64, line: 72, type: !75, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !74, file: !64, line: 74, type: !65)
!79 = !DILocation(line: 74, column: 9, scope: !74)
!80 = !DILocation(line: 76, column: 10, scope: !74)
!81 = !DILocalVariable(name: "recvResult", scope: !82, file: !64, line: 82, type: !65)
!82 = distinct !DILexicalBlock(scope: !74, file: !64, line: 77, column: 5)
!83 = !DILocation(line: 82, column: 13, scope: !82)
!84 = !DILocalVariable(name: "service", scope: !82, file: !64, line: 83, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !86)
!86 = !{!87, !88, !94, !101}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !85, file: !19, line: 240, baseType: !53, size: 16)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !85, file: !19, line: 241, baseType: !89, size: 16, offset: 16)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !91, line: 25, baseType: !92)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !93, line: 40, baseType: !55)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !85, file: !19, line: 242, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !19, line: 33, baseType: !98, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !91, line: 26, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !93, line: 42, baseType: !7)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !85, file: !19, line: 245, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 83, column: 28, scope: !82)
!107 = !DILocalVariable(name: "connectSocket", scope: !82, file: !64, line: 84, type: !65)
!108 = !DILocation(line: 84, column: 16, scope: !82)
!109 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !64, line: 85, type: !57)
!110 = !DILocation(line: 85, column: 14, scope: !82)
!111 = !DILocation(line: 86, column: 9, scope: !82)
!112 = !DILocation(line: 96, column: 29, scope: !113)
!113 = distinct !DILexicalBlock(scope: !82, file: !64, line: 87, column: 9)
!114 = !DILocation(line: 96, column: 27, scope: !113)
!115 = !DILocation(line: 97, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !64, line: 97, column: 17)
!117 = !DILocation(line: 97, column: 31, scope: !116)
!118 = !DILocation(line: 97, column: 17, scope: !113)
!119 = !DILocation(line: 99, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !64, line: 98, column: 13)
!121 = !DILocation(line: 101, column: 13, scope: !113)
!122 = !DILocation(line: 102, column: 21, scope: !113)
!123 = !DILocation(line: 102, column: 32, scope: !113)
!124 = !DILocation(line: 103, column: 39, scope: !113)
!125 = !DILocation(line: 103, column: 21, scope: !113)
!126 = !DILocation(line: 103, column: 30, scope: !113)
!127 = !DILocation(line: 103, column: 37, scope: !113)
!128 = !DILocation(line: 104, column: 32, scope: !113)
!129 = !DILocation(line: 104, column: 21, scope: !113)
!130 = !DILocation(line: 104, column: 30, scope: !113)
!131 = !DILocation(line: 105, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !113, file: !64, line: 105, column: 17)
!133 = !DILocation(line: 105, column: 40, scope: !132)
!134 = !DILocation(line: 105, column: 17, scope: !132)
!135 = !DILocation(line: 105, column: 85, scope: !132)
!136 = !DILocation(line: 105, column: 17, scope: !113)
!137 = !DILocation(line: 107, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !64, line: 106, column: 13)
!139 = !DILocation(line: 111, column: 31, scope: !113)
!140 = !DILocation(line: 111, column: 46, scope: !113)
!141 = !DILocation(line: 111, column: 26, scope: !113)
!142 = !DILocation(line: 111, column: 24, scope: !113)
!143 = !DILocation(line: 112, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !113, file: !64, line: 112, column: 17)
!145 = !DILocation(line: 112, column: 28, scope: !144)
!146 = !DILocation(line: 112, column: 44, scope: !144)
!147 = !DILocation(line: 112, column: 47, scope: !144)
!148 = !DILocation(line: 112, column: 58, scope: !144)
!149 = !DILocation(line: 112, column: 17, scope: !113)
!150 = !DILocation(line: 114, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !144, file: !64, line: 113, column: 13)
!152 = !DILocation(line: 117, column: 25, scope: !113)
!153 = !DILocation(line: 117, column: 13, scope: !113)
!154 = !DILocation(line: 117, column: 37, scope: !113)
!155 = !DILocation(line: 119, column: 25, scope: !113)
!156 = !DILocation(line: 119, column: 20, scope: !113)
!157 = !DILocation(line: 119, column: 18, scope: !113)
!158 = !DILocation(line: 120, column: 9, scope: !113)
!159 = !DILocation(line: 122, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !82, file: !64, line: 122, column: 13)
!161 = !DILocation(line: 122, column: 27, scope: !160)
!162 = !DILocation(line: 122, column: 13, scope: !82)
!163 = !DILocation(line: 124, column: 26, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !64, line: 123, column: 9)
!165 = !DILocation(line: 124, column: 13, scope: !164)
!166 = !DILocation(line: 125, column: 9, scope: !164)
!167 = !DILocation(line: 133, column: 66, scope: !74)
!168 = !DILocation(line: 133, column: 64, scope: !74)
!169 = !DILocation(line: 134, column: 5, scope: !74)
!170 = !DILocation(line: 135, column: 1, scope: !74)
!171 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_45_good", scope: !64, file: !64, line: 267, type: !75, scopeLine: 268, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!172 = !DILocation(line: 269, column: 5, scope: !171)
!173 = !DILocation(line: 270, column: 5, scope: !171)
!174 = !DILocation(line: 271, column: 1, scope: !171)
!175 = distinct !DISubprogram(name: "main", scope: !64, file: !64, line: 281, type: !176, scopeLine: 282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!176 = !DISubroutineType(types: !177)
!177 = !{!65, !65, !178}
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!180 = !DILocalVariable(name: "argc", arg: 1, scope: !175, file: !64, line: 281, type: !65)
!181 = !DILocation(line: 281, column: 14, scope: !175)
!182 = !DILocalVariable(name: "argv", arg: 2, scope: !175, file: !64, line: 281, type: !178)
!183 = !DILocation(line: 281, column: 27, scope: !175)
!184 = !DILocation(line: 284, column: 22, scope: !175)
!185 = !DILocation(line: 284, column: 12, scope: !175)
!186 = !DILocation(line: 284, column: 5, scope: !175)
!187 = !DILocation(line: 286, column: 5, scope: !175)
!188 = !DILocation(line: 287, column: 5, scope: !175)
!189 = !DILocation(line: 288, column: 5, scope: !175)
!190 = !DILocation(line: 291, column: 5, scope: !175)
!191 = !DILocation(line: 292, column: 5, scope: !175)
!192 = !DILocation(line: 293, column: 5, scope: !175)
!193 = !DILocation(line: 295, column: 5, scope: !175)
!194 = distinct !DISubprogram(name: "badSink", scope: !64, file: !64, line: 48, type: !75, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!195 = !DILocalVariable(name: "data", scope: !194, file: !64, line: 50, type: !65)
!196 = !DILocation(line: 50, column: 9, scope: !194)
!197 = !DILocation(line: 50, column: 16, scope: !194)
!198 = !DILocalVariable(name: "i", scope: !199, file: !64, line: 52, type: !65)
!199 = distinct !DILexicalBlock(scope: !194, file: !64, line: 51, column: 5)
!200 = !DILocation(line: 52, column: 13, scope: !199)
!201 = !DILocalVariable(name: "buffer", scope: !199, file: !64, line: 53, type: !202)
!202 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 320, elements: !203)
!203 = !{!204}
!204 = !DISubrange(count: 10)
!205 = !DILocation(line: 53, column: 13, scope: !199)
!206 = !DILocation(line: 56, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !199, file: !64, line: 56, column: 13)
!208 = !DILocation(line: 56, column: 18, scope: !207)
!209 = !DILocation(line: 56, column: 13, scope: !199)
!210 = !DILocation(line: 58, column: 20, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !64, line: 57, column: 9)
!212 = !DILocation(line: 58, column: 13, scope: !211)
!213 = !DILocation(line: 58, column: 26, scope: !211)
!214 = !DILocation(line: 60, column: 19, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !64, line: 60, column: 13)
!216 = !DILocation(line: 60, column: 17, scope: !215)
!217 = !DILocation(line: 60, column: 24, scope: !218)
!218 = distinct !DILexicalBlock(scope: !215, file: !64, line: 60, column: 13)
!219 = !DILocation(line: 60, column: 26, scope: !218)
!220 = !DILocation(line: 60, column: 13, scope: !215)
!221 = !DILocation(line: 62, column: 37, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !64, line: 61, column: 13)
!223 = !DILocation(line: 62, column: 30, scope: !222)
!224 = !DILocation(line: 62, column: 17, scope: !222)
!225 = !DILocation(line: 63, column: 13, scope: !222)
!226 = !DILocation(line: 60, column: 33, scope: !218)
!227 = !DILocation(line: 60, column: 13, scope: !218)
!228 = distinct !{!228, !220, !229, !230}
!229 = !DILocation(line: 63, column: 13, scope: !215)
!230 = !{!"llvm.loop.mustprogress"}
!231 = !DILocation(line: 64, column: 9, scope: !211)
!232 = !DILocation(line: 67, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !207, file: !64, line: 66, column: 9)
!234 = !DILocation(line: 70, column: 1, scope: !194)
!235 = distinct !DISubprogram(name: "goodG2B", scope: !64, file: !64, line: 166, type: !75, scopeLine: 167, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!236 = !DILocalVariable(name: "data", scope: !235, file: !64, line: 168, type: !65)
!237 = !DILocation(line: 168, column: 9, scope: !235)
!238 = !DILocation(line: 170, column: 10, scope: !235)
!239 = !DILocation(line: 173, column: 10, scope: !235)
!240 = !DILocation(line: 174, column: 70, scope: !235)
!241 = !DILocation(line: 174, column: 68, scope: !235)
!242 = !DILocation(line: 175, column: 5, scope: !235)
!243 = !DILocation(line: 176, column: 1, scope: !235)
!244 = distinct !DISubprogram(name: "goodG2BSink", scope: !64, file: !64, line: 142, type: !75, scopeLine: 143, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!245 = !DILocalVariable(name: "data", scope: !244, file: !64, line: 144, type: !65)
!246 = !DILocation(line: 144, column: 9, scope: !244)
!247 = !DILocation(line: 144, column: 16, scope: !244)
!248 = !DILocalVariable(name: "i", scope: !249, file: !64, line: 146, type: !65)
!249 = distinct !DILexicalBlock(scope: !244, file: !64, line: 145, column: 5)
!250 = !DILocation(line: 146, column: 13, scope: !249)
!251 = !DILocalVariable(name: "buffer", scope: !249, file: !64, line: 147, type: !202)
!252 = !DILocation(line: 147, column: 13, scope: !249)
!253 = !DILocation(line: 150, column: 13, scope: !254)
!254 = distinct !DILexicalBlock(scope: !249, file: !64, line: 150, column: 13)
!255 = !DILocation(line: 150, column: 18, scope: !254)
!256 = !DILocation(line: 150, column: 13, scope: !249)
!257 = !DILocation(line: 152, column: 20, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !64, line: 151, column: 9)
!259 = !DILocation(line: 152, column: 13, scope: !258)
!260 = !DILocation(line: 152, column: 26, scope: !258)
!261 = !DILocation(line: 154, column: 19, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !64, line: 154, column: 13)
!263 = !DILocation(line: 154, column: 17, scope: !262)
!264 = !DILocation(line: 154, column: 24, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !64, line: 154, column: 13)
!266 = !DILocation(line: 154, column: 26, scope: !265)
!267 = !DILocation(line: 154, column: 13, scope: !262)
!268 = !DILocation(line: 156, column: 37, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !64, line: 155, column: 13)
!270 = !DILocation(line: 156, column: 30, scope: !269)
!271 = !DILocation(line: 156, column: 17, scope: !269)
!272 = !DILocation(line: 157, column: 13, scope: !269)
!273 = !DILocation(line: 154, column: 33, scope: !265)
!274 = !DILocation(line: 154, column: 13, scope: !265)
!275 = distinct !{!275, !267, !276, !230}
!276 = !DILocation(line: 157, column: 13, scope: !262)
!277 = !DILocation(line: 158, column: 9, scope: !258)
!278 = !DILocation(line: 161, column: 13, scope: !279)
!279 = distinct !DILexicalBlock(scope: !254, file: !64, line: 160, column: 9)
!280 = !DILocation(line: 164, column: 1, scope: !244)
!281 = distinct !DISubprogram(name: "goodB2G", scope: !64, file: !64, line: 202, type: !75, scopeLine: 203, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!282 = !DILocalVariable(name: "data", scope: !281, file: !64, line: 204, type: !65)
!283 = !DILocation(line: 204, column: 9, scope: !281)
!284 = !DILocation(line: 206, column: 10, scope: !281)
!285 = !DILocalVariable(name: "recvResult", scope: !286, file: !64, line: 212, type: !65)
!286 = distinct !DILexicalBlock(scope: !281, file: !64, line: 207, column: 5)
!287 = !DILocation(line: 212, column: 13, scope: !286)
!288 = !DILocalVariable(name: "service", scope: !286, file: !64, line: 213, type: !85)
!289 = !DILocation(line: 213, column: 28, scope: !286)
!290 = !DILocalVariable(name: "connectSocket", scope: !286, file: !64, line: 214, type: !65)
!291 = !DILocation(line: 214, column: 16, scope: !286)
!292 = !DILocalVariable(name: "inputBuffer", scope: !286, file: !64, line: 215, type: !57)
!293 = !DILocation(line: 215, column: 14, scope: !286)
!294 = !DILocation(line: 216, column: 9, scope: !286)
!295 = !DILocation(line: 226, column: 29, scope: !296)
!296 = distinct !DILexicalBlock(scope: !286, file: !64, line: 217, column: 9)
!297 = !DILocation(line: 226, column: 27, scope: !296)
!298 = !DILocation(line: 227, column: 17, scope: !299)
!299 = distinct !DILexicalBlock(scope: !296, file: !64, line: 227, column: 17)
!300 = !DILocation(line: 227, column: 31, scope: !299)
!301 = !DILocation(line: 227, column: 17, scope: !296)
!302 = !DILocation(line: 229, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !64, line: 228, column: 13)
!304 = !DILocation(line: 231, column: 13, scope: !296)
!305 = !DILocation(line: 232, column: 21, scope: !296)
!306 = !DILocation(line: 232, column: 32, scope: !296)
!307 = !DILocation(line: 233, column: 39, scope: !296)
!308 = !DILocation(line: 233, column: 21, scope: !296)
!309 = !DILocation(line: 233, column: 30, scope: !296)
!310 = !DILocation(line: 233, column: 37, scope: !296)
!311 = !DILocation(line: 234, column: 32, scope: !296)
!312 = !DILocation(line: 234, column: 21, scope: !296)
!313 = !DILocation(line: 234, column: 30, scope: !296)
!314 = !DILocation(line: 235, column: 25, scope: !315)
!315 = distinct !DILexicalBlock(scope: !296, file: !64, line: 235, column: 17)
!316 = !DILocation(line: 235, column: 40, scope: !315)
!317 = !DILocation(line: 235, column: 17, scope: !315)
!318 = !DILocation(line: 235, column: 85, scope: !315)
!319 = !DILocation(line: 235, column: 17, scope: !296)
!320 = !DILocation(line: 237, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !315, file: !64, line: 236, column: 13)
!322 = !DILocation(line: 241, column: 31, scope: !296)
!323 = !DILocation(line: 241, column: 46, scope: !296)
!324 = !DILocation(line: 241, column: 26, scope: !296)
!325 = !DILocation(line: 241, column: 24, scope: !296)
!326 = !DILocation(line: 242, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !296, file: !64, line: 242, column: 17)
!328 = !DILocation(line: 242, column: 28, scope: !327)
!329 = !DILocation(line: 242, column: 44, scope: !327)
!330 = !DILocation(line: 242, column: 47, scope: !327)
!331 = !DILocation(line: 242, column: 58, scope: !327)
!332 = !DILocation(line: 242, column: 17, scope: !296)
!333 = !DILocation(line: 244, column: 17, scope: !334)
!334 = distinct !DILexicalBlock(scope: !327, file: !64, line: 243, column: 13)
!335 = !DILocation(line: 247, column: 25, scope: !296)
!336 = !DILocation(line: 247, column: 13, scope: !296)
!337 = !DILocation(line: 247, column: 37, scope: !296)
!338 = !DILocation(line: 249, column: 25, scope: !296)
!339 = !DILocation(line: 249, column: 20, scope: !296)
!340 = !DILocation(line: 249, column: 18, scope: !296)
!341 = !DILocation(line: 250, column: 9, scope: !296)
!342 = !DILocation(line: 252, column: 13, scope: !343)
!343 = distinct !DILexicalBlock(scope: !286, file: !64, line: 252, column: 13)
!344 = !DILocation(line: 252, column: 27, scope: !343)
!345 = !DILocation(line: 252, column: 13, scope: !286)
!346 = !DILocation(line: 254, column: 26, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !64, line: 253, column: 9)
!348 = !DILocation(line: 254, column: 13, scope: !347)
!349 = !DILocation(line: 255, column: 9, scope: !347)
!350 = !DILocation(line: 263, column: 70, scope: !281)
!351 = !DILocation(line: 263, column: 68, scope: !281)
!352 = !DILocation(line: 264, column: 5, scope: !281)
!353 = !DILocation(line: 265, column: 1, scope: !281)
!354 = distinct !DISubprogram(name: "goodB2GSink", scope: !64, file: !64, line: 179, type: !75, scopeLine: 180, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!355 = !DILocalVariable(name: "data", scope: !354, file: !64, line: 181, type: !65)
!356 = !DILocation(line: 181, column: 9, scope: !354)
!357 = !DILocation(line: 181, column: 16, scope: !354)
!358 = !DILocalVariable(name: "i", scope: !359, file: !64, line: 183, type: !65)
!359 = distinct !DILexicalBlock(scope: !354, file: !64, line: 182, column: 5)
!360 = !DILocation(line: 183, column: 13, scope: !359)
!361 = !DILocalVariable(name: "buffer", scope: !359, file: !64, line: 184, type: !202)
!362 = !DILocation(line: 184, column: 13, scope: !359)
!363 = !DILocation(line: 186, column: 13, scope: !364)
!364 = distinct !DILexicalBlock(scope: !359, file: !64, line: 186, column: 13)
!365 = !DILocation(line: 186, column: 18, scope: !364)
!366 = !DILocation(line: 186, column: 23, scope: !364)
!367 = !DILocation(line: 186, column: 26, scope: !364)
!368 = !DILocation(line: 186, column: 31, scope: !364)
!369 = !DILocation(line: 186, column: 13, scope: !359)
!370 = !DILocation(line: 188, column: 20, scope: !371)
!371 = distinct !DILexicalBlock(scope: !364, file: !64, line: 187, column: 9)
!372 = !DILocation(line: 188, column: 13, scope: !371)
!373 = !DILocation(line: 188, column: 26, scope: !371)
!374 = !DILocation(line: 190, column: 19, scope: !375)
!375 = distinct !DILexicalBlock(scope: !371, file: !64, line: 190, column: 13)
!376 = !DILocation(line: 190, column: 17, scope: !375)
!377 = !DILocation(line: 190, column: 24, scope: !378)
!378 = distinct !DILexicalBlock(scope: !375, file: !64, line: 190, column: 13)
!379 = !DILocation(line: 190, column: 26, scope: !378)
!380 = !DILocation(line: 190, column: 13, scope: !375)
!381 = !DILocation(line: 192, column: 37, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !64, line: 191, column: 13)
!383 = !DILocation(line: 192, column: 30, scope: !382)
!384 = !DILocation(line: 192, column: 17, scope: !382)
!385 = !DILocation(line: 193, column: 13, scope: !382)
!386 = !DILocation(line: 190, column: 33, scope: !378)
!387 = !DILocation(line: 190, column: 13, scope: !378)
!388 = distinct !{!388, !380, !389, !230}
!389 = !DILocation(line: 193, column: 13, scope: !375)
!390 = !DILocation(line: 194, column: 9, scope: !371)
!391 = !DILocation(line: 197, column: 13, scope: !392)
!392 = distinct !DILexicalBlock(scope: !364, file: !64, line: 196, column: 9)
!393 = !DILocation(line: 200, column: 1, scope: !354)
