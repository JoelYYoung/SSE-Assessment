; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_44.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_44_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !73, metadata !DIExpression()), !dbg !77
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !82, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %connectSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  br label %do.body, !dbg !109

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !110
  store i32 %call, i32* %connectSocket, align 4, !dbg !112
  %0 = load i32, i32* %connectSocket, align 4, !dbg !113
  %cmp = icmp eq i32 %0, -1, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !117

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !119
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !120
  store i16 2, i16* %sin_family, align 4, !dbg !121
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !122
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !123
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !124
  store i32 %call1, i32* %s_addr, align 4, !dbg !125
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !126
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !127
  store i16 %call2, i16* %sin_port, align 2, !dbg !128
  %2 = load i32, i32* %connectSocket, align 4, !dbg !129
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !131
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !132
  %cmp4 = icmp eq i32 %call3, -1, !dbg !133
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !134

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !135

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !137
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !138
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !139
  %conv = trunc i64 %call7 to i32, !dbg !139
  store i32 %conv, i32* %recvResult, align 4, !dbg !140
  %5 = load i32, i32* %recvResult, align 4, !dbg !141
  %cmp8 = icmp eq i32 %5, -1, !dbg !143
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !144

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !145
  %cmp10 = icmp eq i32 %6, 0, !dbg !146
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !147

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !148

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !150
  %idxprom = sext i32 %7 to i64, !dbg !151
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !151
  store i8 0, i8* %arrayidx, align 1, !dbg !152
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !153
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !154
  store i32 %call15, i32* %data, align 4, !dbg !155
  br label %do.end, !dbg !156

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !157
  %cmp16 = icmp ne i32 %8, -1, !dbg !159
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !160

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !161
  %call19 = call i32 @close(i32 %9), !dbg !163
  br label %if.end20, !dbg !164

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !165
  %11 = load i32, i32* %data, align 4, !dbg !166
  call void %10(i32 %11), !dbg !165
  ret void, !dbg !167
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !168 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !169, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i32* %i, metadata !171, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !174, metadata !DIExpression()), !dbg !178
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !178
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !178
  %1 = load i32, i32* %data.addr, align 4, !dbg !179
  %cmp = icmp slt i32 %1, 10, !dbg !181
  br i1 %cmp, label %if.then, label %if.else, !dbg !182

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !183
  %idxprom = sext i32 %2 to i64, !dbg !185
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !185
  store i32 1, i32* %arrayidx, align 4, !dbg !186
  store i32 0, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !190
  %cmp1 = icmp slt i32 %3, 10, !dbg !192
  br i1 %cmp1, label %for.body, label %for.end, !dbg !193

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !194
  %idxprom2 = sext i32 %4 to i64, !dbg !196
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !196
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !196
  call void @printIntLine(i32 %5), !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !199
  %inc = add nsw i32 %6, 1, !dbg !199
  store i32 %inc, i32* %i, align 4, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !204

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !205
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !207
}

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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_connect_socket_44_good() #0 !dbg !208 {
entry:
  call void @goodG2B(), !dbg !209
  call void @goodB2G(), !dbg !210
  ret void, !dbg !211
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !212 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !217, metadata !DIExpression()), !dbg !218
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !219, metadata !DIExpression()), !dbg !220
  %call = call i64 @time(i64* null) #7, !dbg !221
  %conv = trunc i64 %call to i32, !dbg !222
  call void @srand(i32 %conv) #7, !dbg !223
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !224
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_44_good(), !dbg !225
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !226
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !227
  call void @CWE124_Buffer_Underwrite__CWE839_connect_socket_44_bad(), !dbg !228
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !229
  ret i32 0, !dbg !230
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !231 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !232, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !234, metadata !DIExpression()), !dbg !235
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !235
  store i32 -1, i32* %data, align 4, !dbg !236
  store i32 7, i32* %data, align 4, !dbg !237
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !238
  %1 = load i32, i32* %data, align 4, !dbg !239
  call void %0(i32 %1), !dbg !238
  ret void, !dbg !240
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !241 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !242, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.declare(metadata i32* %i, metadata !244, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !247, metadata !DIExpression()), !dbg !248
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !248
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !248
  %1 = load i32, i32* %data.addr, align 4, !dbg !249
  %cmp = icmp slt i32 %1, 10, !dbg !251
  br i1 %cmp, label %if.then, label %if.else, !dbg !252

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !253
  %idxprom = sext i32 %2 to i64, !dbg !255
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !255
  store i32 1, i32* %arrayidx, align 4, !dbg !256
  store i32 0, i32* %i, align 4, !dbg !257
  br label %for.cond, !dbg !259

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !260
  %cmp1 = icmp slt i32 %3, 10, !dbg !262
  br i1 %cmp1, label %for.body, label %for.end, !dbg !263

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !264
  %idxprom2 = sext i32 %4 to i64, !dbg !266
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !266
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !266
  call void @printIntLine(i32 %5), !dbg !267
  br label %for.inc, !dbg !268

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !269
  %inc = add nsw i32 %6, 1, !dbg !269
  store i32 %inc, i32* %i, align 4, !dbg !269
  br label %for.cond, !dbg !270, !llvm.loop !271

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !273

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !274
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !276
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !277 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !278, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !280, metadata !DIExpression()), !dbg !281
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !281
  store i32 -1, i32* %data, align 4, !dbg !282
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !283, metadata !DIExpression()), !dbg !285
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !286, metadata !DIExpression()), !dbg !287
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !288, metadata !DIExpression()), !dbg !289
  store i32 -1, i32* %connectSocket, align 4, !dbg !289
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !290, metadata !DIExpression()), !dbg !291
  br label %do.body, !dbg !292

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !293
  store i32 %call, i32* %connectSocket, align 4, !dbg !295
  %0 = load i32, i32* %connectSocket, align 4, !dbg !296
  %cmp = icmp eq i32 %0, -1, !dbg !298
  br i1 %cmp, label %if.then, label %if.end, !dbg !299

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !300

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !302
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !302
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !303
  store i16 2, i16* %sin_family, align 4, !dbg !304
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !305
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !306
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !307
  store i32 %call1, i32* %s_addr, align 4, !dbg !308
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !309
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !310
  store i16 %call2, i16* %sin_port, align 2, !dbg !311
  %2 = load i32, i32* %connectSocket, align 4, !dbg !312
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !314
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !315
  %cmp4 = icmp eq i32 %call3, -1, !dbg !316
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !317

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !318

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !320
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !321
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !322
  %conv = trunc i64 %call7 to i32, !dbg !322
  store i32 %conv, i32* %recvResult, align 4, !dbg !323
  %5 = load i32, i32* %recvResult, align 4, !dbg !324
  %cmp8 = icmp eq i32 %5, -1, !dbg !326
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !327

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !328
  %cmp10 = icmp eq i32 %6, 0, !dbg !329
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !330

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !331

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !333
  %idxprom = sext i32 %7 to i64, !dbg !334
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !334
  store i8 0, i8* %arrayidx, align 1, !dbg !335
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !336
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !337
  store i32 %call15, i32* %data, align 4, !dbg !338
  br label %do.end, !dbg !339

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !340
  %cmp16 = icmp ne i32 %8, -1, !dbg !342
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !343

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !344
  %call19 = call i32 @close(i32 %9), !dbg !346
  br label %if.end20, !dbg !347

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !348
  %11 = load i32, i32* %data, align 4, !dbg !349
  call void %10(i32 %11), !dbg !348
  ret void, !dbg !350
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !351 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !352, metadata !DIExpression()), !dbg !353
  call void @llvm.dbg.declare(metadata i32* %i, metadata !354, metadata !DIExpression()), !dbg !356
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !357, metadata !DIExpression()), !dbg !358
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !358
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !358
  %1 = load i32, i32* %data.addr, align 4, !dbg !359
  %cmp = icmp sge i32 %1, 0, !dbg !361
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !362

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !363
  %cmp1 = icmp slt i32 %2, 10, !dbg !364
  br i1 %cmp1, label %if.then, label %if.else, !dbg !365

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !366
  %idxprom = sext i32 %3 to i64, !dbg !368
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !368
  store i32 1, i32* %arrayidx, align 4, !dbg !369
  store i32 0, i32* %i, align 4, !dbg !370
  br label %for.cond, !dbg !372

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !373
  %cmp2 = icmp slt i32 %4, 10, !dbg !375
  br i1 %cmp2, label %for.body, label %for.end, !dbg !376

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !377
  %idxprom3 = sext i32 %5 to i64, !dbg !379
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !379
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !379
  call void @printIntLine(i32 %6), !dbg !380
  br label %for.inc, !dbg !381

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !382
  %inc = add nsw i32 %7, 1, !dbg !382
  store i32 %inc, i32* %i, align 4, !dbg !382
  br label %for.cond, !dbg !383, !llvm.loop !384

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !386

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !387
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !389
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_44_bad", scope: !66, file: !66, line: 67, type: !67, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_44.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 69, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 69, column: 9, scope: !65)
!73 = !DILocalVariable(name: "funcPtr", scope: !65, file: !66, line: 71, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DISubroutineType(types: !76)
!76 = !{null, !71}
!77 = !DILocation(line: 71, column: 12, scope: !65)
!78 = !DILocation(line: 73, column: 10, scope: !65)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !66, line: 79, type: !71)
!80 = distinct !DILexicalBlock(scope: !65, file: !66, line: 74, column: 5)
!81 = !DILocation(line: 79, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !66, line: 80, type: !83)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !84)
!84 = !{!85, !86, !92, !99}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !83, file: !17, line: 240, baseType: !51, size: 16)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !83, file: !17, line: 241, baseType: !87, size: 16, offset: 16)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !89, line: 25, baseType: !90)
!89 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !91, line: 40, baseType: !53)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !83, file: !17, line: 242, baseType: !93, size: 32, offset: 32)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !94)
!94 = !{!95}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !93, file: !17, line: 33, baseType: !96, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !89, line: 26, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !91, line: 42, baseType: !5)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !83, file: !17, line: 245, baseType: !100, size: 64, offset: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 64, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 8)
!104 = !DILocation(line: 80, column: 28, scope: !80)
!105 = !DILocalVariable(name: "connectSocket", scope: !80, file: !66, line: 81, type: !71)
!106 = !DILocation(line: 81, column: 16, scope: !80)
!107 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !66, line: 82, type: !55)
!108 = !DILocation(line: 82, column: 14, scope: !80)
!109 = !DILocation(line: 83, column: 9, scope: !80)
!110 = !DILocation(line: 93, column: 29, scope: !111)
!111 = distinct !DILexicalBlock(scope: !80, file: !66, line: 84, column: 9)
!112 = !DILocation(line: 93, column: 27, scope: !111)
!113 = !DILocation(line: 94, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !66, line: 94, column: 17)
!115 = !DILocation(line: 94, column: 31, scope: !114)
!116 = !DILocation(line: 94, column: 17, scope: !111)
!117 = !DILocation(line: 96, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !66, line: 95, column: 13)
!119 = !DILocation(line: 98, column: 13, scope: !111)
!120 = !DILocation(line: 99, column: 21, scope: !111)
!121 = !DILocation(line: 99, column: 32, scope: !111)
!122 = !DILocation(line: 100, column: 39, scope: !111)
!123 = !DILocation(line: 100, column: 21, scope: !111)
!124 = !DILocation(line: 100, column: 30, scope: !111)
!125 = !DILocation(line: 100, column: 37, scope: !111)
!126 = !DILocation(line: 101, column: 32, scope: !111)
!127 = !DILocation(line: 101, column: 21, scope: !111)
!128 = !DILocation(line: 101, column: 30, scope: !111)
!129 = !DILocation(line: 102, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !111, file: !66, line: 102, column: 17)
!131 = !DILocation(line: 102, column: 40, scope: !130)
!132 = !DILocation(line: 102, column: 17, scope: !130)
!133 = !DILocation(line: 102, column: 85, scope: !130)
!134 = !DILocation(line: 102, column: 17, scope: !111)
!135 = !DILocation(line: 104, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !66, line: 103, column: 13)
!137 = !DILocation(line: 108, column: 31, scope: !111)
!138 = !DILocation(line: 108, column: 46, scope: !111)
!139 = !DILocation(line: 108, column: 26, scope: !111)
!140 = !DILocation(line: 108, column: 24, scope: !111)
!141 = !DILocation(line: 109, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !111, file: !66, line: 109, column: 17)
!143 = !DILocation(line: 109, column: 28, scope: !142)
!144 = !DILocation(line: 109, column: 44, scope: !142)
!145 = !DILocation(line: 109, column: 47, scope: !142)
!146 = !DILocation(line: 109, column: 58, scope: !142)
!147 = !DILocation(line: 109, column: 17, scope: !111)
!148 = !DILocation(line: 111, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !142, file: !66, line: 110, column: 13)
!150 = !DILocation(line: 114, column: 25, scope: !111)
!151 = !DILocation(line: 114, column: 13, scope: !111)
!152 = !DILocation(line: 114, column: 37, scope: !111)
!153 = !DILocation(line: 116, column: 25, scope: !111)
!154 = !DILocation(line: 116, column: 20, scope: !111)
!155 = !DILocation(line: 116, column: 18, scope: !111)
!156 = !DILocation(line: 117, column: 9, scope: !111)
!157 = !DILocation(line: 119, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !80, file: !66, line: 119, column: 13)
!159 = !DILocation(line: 119, column: 27, scope: !158)
!160 = !DILocation(line: 119, column: 13, scope: !80)
!161 = !DILocation(line: 121, column: 26, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !66, line: 120, column: 9)
!163 = !DILocation(line: 121, column: 13, scope: !162)
!164 = !DILocation(line: 122, column: 9, scope: !162)
!165 = !DILocation(line: 131, column: 5, scope: !65)
!166 = !DILocation(line: 131, column: 13, scope: !65)
!167 = !DILocation(line: 132, column: 1, scope: !65)
!168 = distinct !DISubprogram(name: "badSink", scope: !66, file: !66, line: 44, type: !75, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!169 = !DILocalVariable(name: "data", arg: 1, scope: !168, file: !66, line: 44, type: !71)
!170 = !DILocation(line: 44, column: 25, scope: !168)
!171 = !DILocalVariable(name: "i", scope: !172, file: !66, line: 47, type: !71)
!172 = distinct !DILexicalBlock(scope: !168, file: !66, line: 46, column: 5)
!173 = !DILocation(line: 47, column: 13, scope: !172)
!174 = !DILocalVariable(name: "buffer", scope: !172, file: !66, line: 48, type: !175)
!175 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !176)
!176 = !{!177}
!177 = !DISubrange(count: 10)
!178 = !DILocation(line: 48, column: 13, scope: !172)
!179 = !DILocation(line: 51, column: 13, scope: !180)
!180 = distinct !DILexicalBlock(scope: !172, file: !66, line: 51, column: 13)
!181 = !DILocation(line: 51, column: 18, scope: !180)
!182 = !DILocation(line: 51, column: 13, scope: !172)
!183 = !DILocation(line: 53, column: 20, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !66, line: 52, column: 9)
!185 = !DILocation(line: 53, column: 13, scope: !184)
!186 = !DILocation(line: 53, column: 26, scope: !184)
!187 = !DILocation(line: 55, column: 19, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !66, line: 55, column: 13)
!189 = !DILocation(line: 55, column: 17, scope: !188)
!190 = !DILocation(line: 55, column: 24, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !66, line: 55, column: 13)
!192 = !DILocation(line: 55, column: 26, scope: !191)
!193 = !DILocation(line: 55, column: 13, scope: !188)
!194 = !DILocation(line: 57, column: 37, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !66, line: 56, column: 13)
!196 = !DILocation(line: 57, column: 30, scope: !195)
!197 = !DILocation(line: 57, column: 17, scope: !195)
!198 = !DILocation(line: 58, column: 13, scope: !195)
!199 = !DILocation(line: 55, column: 33, scope: !191)
!200 = !DILocation(line: 55, column: 13, scope: !191)
!201 = distinct !{!201, !193, !202, !203}
!202 = !DILocation(line: 58, column: 13, scope: !188)
!203 = !{!"llvm.loop.mustprogress"}
!204 = !DILocation(line: 59, column: 9, scope: !184)
!205 = !DILocation(line: 62, column: 13, scope: !206)
!206 = distinct !DILexicalBlock(scope: !180, file: !66, line: 61, column: 9)
!207 = !DILocation(line: 65, column: 1, scope: !168)
!208 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_44_good", scope: !66, file: !66, line: 262, type: !67, scopeLine: 263, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!209 = !DILocation(line: 264, column: 5, scope: !208)
!210 = !DILocation(line: 265, column: 5, scope: !208)
!211 = !DILocation(line: 266, column: 1, scope: !208)
!212 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 276, type: !213, scopeLine: 277, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!213 = !DISubroutineType(types: !214)
!214 = !{!71, !71, !215}
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64)
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!217 = !DILocalVariable(name: "argc", arg: 1, scope: !212, file: !66, line: 276, type: !71)
!218 = !DILocation(line: 276, column: 14, scope: !212)
!219 = !DILocalVariable(name: "argv", arg: 2, scope: !212, file: !66, line: 276, type: !215)
!220 = !DILocation(line: 276, column: 27, scope: !212)
!221 = !DILocation(line: 279, column: 22, scope: !212)
!222 = !DILocation(line: 279, column: 12, scope: !212)
!223 = !DILocation(line: 279, column: 5, scope: !212)
!224 = !DILocation(line: 281, column: 5, scope: !212)
!225 = !DILocation(line: 282, column: 5, scope: !212)
!226 = !DILocation(line: 283, column: 5, scope: !212)
!227 = !DILocation(line: 286, column: 5, scope: !212)
!228 = !DILocation(line: 287, column: 5, scope: !212)
!229 = !DILocation(line: 288, column: 5, scope: !212)
!230 = !DILocation(line: 290, column: 5, scope: !212)
!231 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 162, type: !67, scopeLine: 163, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!232 = !DILocalVariable(name: "data", scope: !231, file: !66, line: 164, type: !71)
!233 = !DILocation(line: 164, column: 9, scope: !231)
!234 = !DILocalVariable(name: "funcPtr", scope: !231, file: !66, line: 165, type: !74)
!235 = !DILocation(line: 165, column: 12, scope: !231)
!236 = !DILocation(line: 167, column: 10, scope: !231)
!237 = !DILocation(line: 170, column: 10, scope: !231)
!238 = !DILocation(line: 171, column: 5, scope: !231)
!239 = !DILocation(line: 171, column: 13, scope: !231)
!240 = !DILocation(line: 172, column: 1, scope: !231)
!241 = distinct !DISubprogram(name: "goodG2BSink", scope: !66, file: !66, line: 139, type: !75, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!242 = !DILocalVariable(name: "data", arg: 1, scope: !241, file: !66, line: 139, type: !71)
!243 = !DILocation(line: 139, column: 29, scope: !241)
!244 = !DILocalVariable(name: "i", scope: !245, file: !66, line: 142, type: !71)
!245 = distinct !DILexicalBlock(scope: !241, file: !66, line: 141, column: 5)
!246 = !DILocation(line: 142, column: 13, scope: !245)
!247 = !DILocalVariable(name: "buffer", scope: !245, file: !66, line: 143, type: !175)
!248 = !DILocation(line: 143, column: 13, scope: !245)
!249 = !DILocation(line: 146, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !245, file: !66, line: 146, column: 13)
!251 = !DILocation(line: 146, column: 18, scope: !250)
!252 = !DILocation(line: 146, column: 13, scope: !245)
!253 = !DILocation(line: 148, column: 20, scope: !254)
!254 = distinct !DILexicalBlock(scope: !250, file: !66, line: 147, column: 9)
!255 = !DILocation(line: 148, column: 13, scope: !254)
!256 = !DILocation(line: 148, column: 26, scope: !254)
!257 = !DILocation(line: 150, column: 19, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !66, line: 150, column: 13)
!259 = !DILocation(line: 150, column: 17, scope: !258)
!260 = !DILocation(line: 150, column: 24, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !66, line: 150, column: 13)
!262 = !DILocation(line: 150, column: 26, scope: !261)
!263 = !DILocation(line: 150, column: 13, scope: !258)
!264 = !DILocation(line: 152, column: 37, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !66, line: 151, column: 13)
!266 = !DILocation(line: 152, column: 30, scope: !265)
!267 = !DILocation(line: 152, column: 17, scope: !265)
!268 = !DILocation(line: 153, column: 13, scope: !265)
!269 = !DILocation(line: 150, column: 33, scope: !261)
!270 = !DILocation(line: 150, column: 13, scope: !261)
!271 = distinct !{!271, !263, !272, !203}
!272 = !DILocation(line: 153, column: 13, scope: !258)
!273 = !DILocation(line: 154, column: 9, scope: !254)
!274 = !DILocation(line: 157, column: 13, scope: !275)
!275 = distinct !DILexicalBlock(scope: !250, file: !66, line: 156, column: 9)
!276 = !DILocation(line: 160, column: 1, scope: !241)
!277 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 197, type: !67, scopeLine: 198, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!278 = !DILocalVariable(name: "data", scope: !277, file: !66, line: 199, type: !71)
!279 = !DILocation(line: 199, column: 9, scope: !277)
!280 = !DILocalVariable(name: "funcPtr", scope: !277, file: !66, line: 200, type: !74)
!281 = !DILocation(line: 200, column: 12, scope: !277)
!282 = !DILocation(line: 202, column: 10, scope: !277)
!283 = !DILocalVariable(name: "recvResult", scope: !284, file: !66, line: 208, type: !71)
!284 = distinct !DILexicalBlock(scope: !277, file: !66, line: 203, column: 5)
!285 = !DILocation(line: 208, column: 13, scope: !284)
!286 = !DILocalVariable(name: "service", scope: !284, file: !66, line: 209, type: !83)
!287 = !DILocation(line: 209, column: 28, scope: !284)
!288 = !DILocalVariable(name: "connectSocket", scope: !284, file: !66, line: 210, type: !71)
!289 = !DILocation(line: 210, column: 16, scope: !284)
!290 = !DILocalVariable(name: "inputBuffer", scope: !284, file: !66, line: 211, type: !55)
!291 = !DILocation(line: 211, column: 14, scope: !284)
!292 = !DILocation(line: 212, column: 9, scope: !284)
!293 = !DILocation(line: 222, column: 29, scope: !294)
!294 = distinct !DILexicalBlock(scope: !284, file: !66, line: 213, column: 9)
!295 = !DILocation(line: 222, column: 27, scope: !294)
!296 = !DILocation(line: 223, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !294, file: !66, line: 223, column: 17)
!298 = !DILocation(line: 223, column: 31, scope: !297)
!299 = !DILocation(line: 223, column: 17, scope: !294)
!300 = !DILocation(line: 225, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !297, file: !66, line: 224, column: 13)
!302 = !DILocation(line: 227, column: 13, scope: !294)
!303 = !DILocation(line: 228, column: 21, scope: !294)
!304 = !DILocation(line: 228, column: 32, scope: !294)
!305 = !DILocation(line: 229, column: 39, scope: !294)
!306 = !DILocation(line: 229, column: 21, scope: !294)
!307 = !DILocation(line: 229, column: 30, scope: !294)
!308 = !DILocation(line: 229, column: 37, scope: !294)
!309 = !DILocation(line: 230, column: 32, scope: !294)
!310 = !DILocation(line: 230, column: 21, scope: !294)
!311 = !DILocation(line: 230, column: 30, scope: !294)
!312 = !DILocation(line: 231, column: 25, scope: !313)
!313 = distinct !DILexicalBlock(scope: !294, file: !66, line: 231, column: 17)
!314 = !DILocation(line: 231, column: 40, scope: !313)
!315 = !DILocation(line: 231, column: 17, scope: !313)
!316 = !DILocation(line: 231, column: 85, scope: !313)
!317 = !DILocation(line: 231, column: 17, scope: !294)
!318 = !DILocation(line: 233, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !313, file: !66, line: 232, column: 13)
!320 = !DILocation(line: 237, column: 31, scope: !294)
!321 = !DILocation(line: 237, column: 46, scope: !294)
!322 = !DILocation(line: 237, column: 26, scope: !294)
!323 = !DILocation(line: 237, column: 24, scope: !294)
!324 = !DILocation(line: 238, column: 17, scope: !325)
!325 = distinct !DILexicalBlock(scope: !294, file: !66, line: 238, column: 17)
!326 = !DILocation(line: 238, column: 28, scope: !325)
!327 = !DILocation(line: 238, column: 44, scope: !325)
!328 = !DILocation(line: 238, column: 47, scope: !325)
!329 = !DILocation(line: 238, column: 58, scope: !325)
!330 = !DILocation(line: 238, column: 17, scope: !294)
!331 = !DILocation(line: 240, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !325, file: !66, line: 239, column: 13)
!333 = !DILocation(line: 243, column: 25, scope: !294)
!334 = !DILocation(line: 243, column: 13, scope: !294)
!335 = !DILocation(line: 243, column: 37, scope: !294)
!336 = !DILocation(line: 245, column: 25, scope: !294)
!337 = !DILocation(line: 245, column: 20, scope: !294)
!338 = !DILocation(line: 245, column: 18, scope: !294)
!339 = !DILocation(line: 246, column: 9, scope: !294)
!340 = !DILocation(line: 248, column: 13, scope: !341)
!341 = distinct !DILexicalBlock(scope: !284, file: !66, line: 248, column: 13)
!342 = !DILocation(line: 248, column: 27, scope: !341)
!343 = !DILocation(line: 248, column: 13, scope: !284)
!344 = !DILocation(line: 250, column: 26, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !66, line: 249, column: 9)
!346 = !DILocation(line: 250, column: 13, scope: !345)
!347 = !DILocation(line: 251, column: 9, scope: !345)
!348 = !DILocation(line: 259, column: 5, scope: !277)
!349 = !DILocation(line: 259, column: 13, scope: !277)
!350 = !DILocation(line: 260, column: 1, scope: !277)
!351 = distinct !DISubprogram(name: "goodB2GSink", scope: !66, file: !66, line: 175, type: !75, scopeLine: 176, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!352 = !DILocalVariable(name: "data", arg: 1, scope: !351, file: !66, line: 175, type: !71)
!353 = !DILocation(line: 175, column: 29, scope: !351)
!354 = !DILocalVariable(name: "i", scope: !355, file: !66, line: 178, type: !71)
!355 = distinct !DILexicalBlock(scope: !351, file: !66, line: 177, column: 5)
!356 = !DILocation(line: 178, column: 13, scope: !355)
!357 = !DILocalVariable(name: "buffer", scope: !355, file: !66, line: 179, type: !175)
!358 = !DILocation(line: 179, column: 13, scope: !355)
!359 = !DILocation(line: 181, column: 13, scope: !360)
!360 = distinct !DILexicalBlock(scope: !355, file: !66, line: 181, column: 13)
!361 = !DILocation(line: 181, column: 18, scope: !360)
!362 = !DILocation(line: 181, column: 23, scope: !360)
!363 = !DILocation(line: 181, column: 26, scope: !360)
!364 = !DILocation(line: 181, column: 31, scope: !360)
!365 = !DILocation(line: 181, column: 13, scope: !355)
!366 = !DILocation(line: 183, column: 20, scope: !367)
!367 = distinct !DILexicalBlock(scope: !360, file: !66, line: 182, column: 9)
!368 = !DILocation(line: 183, column: 13, scope: !367)
!369 = !DILocation(line: 183, column: 26, scope: !367)
!370 = !DILocation(line: 185, column: 19, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !66, line: 185, column: 13)
!372 = !DILocation(line: 185, column: 17, scope: !371)
!373 = !DILocation(line: 185, column: 24, scope: !374)
!374 = distinct !DILexicalBlock(scope: !371, file: !66, line: 185, column: 13)
!375 = !DILocation(line: 185, column: 26, scope: !374)
!376 = !DILocation(line: 185, column: 13, scope: !371)
!377 = !DILocation(line: 187, column: 37, scope: !378)
!378 = distinct !DILexicalBlock(scope: !374, file: !66, line: 186, column: 13)
!379 = !DILocation(line: 187, column: 30, scope: !378)
!380 = !DILocation(line: 187, column: 17, scope: !378)
!381 = !DILocation(line: 188, column: 13, scope: !378)
!382 = !DILocation(line: 185, column: 33, scope: !374)
!383 = !DILocation(line: 185, column: 13, scope: !374)
!384 = distinct !{!384, !376, !385, !203}
!385 = !DILocation(line: 188, column: 13, scope: !371)
!386 = !DILocation(line: 189, column: 9, scope: !367)
!387 = !DILocation(line: 192, column: 13, scope: !388)
!388 = distinct !DILexicalBlock(scope: !360, file: !66, line: 191, column: 9)
!389 = !DILocation(line: 195, column: 1, scope: !351)
