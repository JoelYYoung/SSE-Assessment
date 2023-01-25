; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@badStatic = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !62
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !66
@goodG2BStatic = internal global i32 0, align 4, !dbg !68

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_21_bad() #0 !dbg !76 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 -1, i32* %data, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !83, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !86, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %connectSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  br label %do.body, !dbg !113

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !114
  store i32 %call, i32* %connectSocket, align 4, !dbg !116
  %0 = load i32, i32* %connectSocket, align 4, !dbg !117
  %cmp = icmp eq i32 %0, -1, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !121

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !123
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !124
  store i16 2, i16* %sin_family, align 4, !dbg !125
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !126
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !127
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !128
  store i32 %call1, i32* %s_addr, align 4, !dbg !129
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !130
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !131
  store i16 %call2, i16* %sin_port, align 2, !dbg !132
  %2 = load i32, i32* %connectSocket, align 4, !dbg !133
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !135
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !136
  %cmp4 = icmp eq i32 %call3, -1, !dbg !137
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !138

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !139

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !141
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !142
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !143
  %conv = trunc i64 %call7 to i32, !dbg !143
  store i32 %conv, i32* %recvResult, align 4, !dbg !144
  %5 = load i32, i32* %recvResult, align 4, !dbg !145
  %cmp8 = icmp eq i32 %5, -1, !dbg !147
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !148

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !149
  %cmp10 = icmp eq i32 %6, 0, !dbg !150
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !151

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !152

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !154
  %idxprom = sext i32 %7 to i64, !dbg !155
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !155
  store i8 0, i8* %arrayidx, align 1, !dbg !156
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !157
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !158
  store i32 %call15, i32* %data, align 4, !dbg !159
  br label %do.end, !dbg !160

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !161
  %cmp16 = icmp ne i32 %8, -1, !dbg !163
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !164

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !165
  %call19 = call i32 @close(i32 %9), !dbg !167
  br label %if.end20, !dbg !168

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 1, i32* @badStatic, align 4, !dbg !169
  %10 = load i32, i32* %data, align 4, !dbg !170
  call void @badSink(i32 %10), !dbg !171
  ret void, !dbg !172
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
define internal void @badSink(i32 %data) #0 !dbg !173 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !176, metadata !DIExpression()), !dbg !177
  %0 = load i32, i32* @badStatic, align 4, !dbg !178
  %tobool = icmp ne i32 %0, 0, !dbg !178
  br i1 %tobool, label %if.then, label %if.end5, !dbg !180

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !181, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !185, metadata !DIExpression()), !dbg !189
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !189
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !189
  %2 = load i32, i32* %data.addr, align 4, !dbg !190
  %cmp = icmp sge i32 %2, 0, !dbg !192
  br i1 %cmp, label %if.then1, label %if.else, !dbg !193

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !194
  %idxprom = sext i32 %3 to i64, !dbg !196
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !196
  store i32 1, i32* %arrayidx, align 4, !dbg !197
  store i32 0, i32* %i, align 4, !dbg !198
  br label %for.cond, !dbg !200

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !201
  %cmp2 = icmp slt i32 %4, 10, !dbg !203
  br i1 %cmp2, label %for.body, label %for.end, !dbg !204

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !205
  %idxprom3 = sext i32 %5 to i64, !dbg !207
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !207
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !207
  call void @printIntLine(i32 %6), !dbg !208
  br label %for.inc, !dbg !209

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !210
  %inc = add nsw i32 %7, 1, !dbg !210
  store i32 %inc, i32* %i, align 4, !dbg !210
  br label %for.cond, !dbg !211, !llvm.loop !212

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !215

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !216
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !218

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !219
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_21_good() #0 !dbg !220 {
entry:
  call void @goodB2G1(), !dbg !221
  call void @goodB2G2(), !dbg !222
  call void @goodG2B(), !dbg !223
  ret void, !dbg !224
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !225 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !230, metadata !DIExpression()), !dbg !231
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !232, metadata !DIExpression()), !dbg !233
  %call = call i64 @time(i64* null) #7, !dbg !234
  %conv = trunc i64 %call to i32, !dbg !235
  call void @srand(i32 %conv) #7, !dbg !236
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !237
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_21_good(), !dbg !238
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !239
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !240
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_21_bad(), !dbg !241
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !242
  ret i32 0, !dbg !243
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !244 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !245, metadata !DIExpression()), !dbg !246
  store i32 -1, i32* %data, align 4, !dbg !247
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !248, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !251, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !253, metadata !DIExpression()), !dbg !254
  store i32 -1, i32* %connectSocket, align 4, !dbg !254
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !255, metadata !DIExpression()), !dbg !256
  br label %do.body, !dbg !257

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !258
  store i32 %call, i32* %connectSocket, align 4, !dbg !260
  %0 = load i32, i32* %connectSocket, align 4, !dbg !261
  %cmp = icmp eq i32 %0, -1, !dbg !263
  br i1 %cmp, label %if.then, label %if.end, !dbg !264

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !265

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !267
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !267
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !268
  store i16 2, i16* %sin_family, align 4, !dbg !269
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !270
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !271
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !272
  store i32 %call1, i32* %s_addr, align 4, !dbg !273
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !274
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !275
  store i16 %call2, i16* %sin_port, align 2, !dbg !276
  %2 = load i32, i32* %connectSocket, align 4, !dbg !277
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !279
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !280
  %cmp4 = icmp eq i32 %call3, -1, !dbg !281
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !282

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !283

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !285
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !286
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !287
  %conv = trunc i64 %call7 to i32, !dbg !287
  store i32 %conv, i32* %recvResult, align 4, !dbg !288
  %5 = load i32, i32* %recvResult, align 4, !dbg !289
  %cmp8 = icmp eq i32 %5, -1, !dbg !291
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !292

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !293
  %cmp10 = icmp eq i32 %6, 0, !dbg !294
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !295

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !296

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !298
  %idxprom = sext i32 %7 to i64, !dbg !299
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !299
  store i8 0, i8* %arrayidx, align 1, !dbg !300
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !301
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !302
  store i32 %call15, i32* %data, align 4, !dbg !303
  br label %do.end, !dbg !304

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !305
  %cmp16 = icmp ne i32 %8, -1, !dbg !307
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !308

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !309
  %call19 = call i32 @close(i32 %9), !dbg !311
  br label %if.end20, !dbg !312

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !313
  %10 = load i32, i32* %data, align 4, !dbg !314
  call void @goodB2G1Sink(i32 %10), !dbg !315
  ret void, !dbg !316
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !317 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !318, metadata !DIExpression()), !dbg !319
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !320
  %tobool = icmp ne i32 %0, 0, !dbg !320
  br i1 %tobool, label %if.then, label %if.else, !dbg !322

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !323
  br label %if.end7, !dbg !325

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !326, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !330, metadata !DIExpression()), !dbg !331
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !331
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !331
  %2 = load i32, i32* %data.addr, align 4, !dbg !332
  %cmp = icmp sge i32 %2, 0, !dbg !334
  br i1 %cmp, label %land.lhs.true, label %if.else6, !dbg !335

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !336
  %cmp1 = icmp slt i32 %3, 10, !dbg !337
  br i1 %cmp1, label %if.then2, label %if.else6, !dbg !338

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !339
  %idxprom = sext i32 %4 to i64, !dbg !341
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !341
  store i32 1, i32* %arrayidx, align 4, !dbg !342
  store i32 0, i32* %i, align 4, !dbg !343
  br label %for.cond, !dbg !345

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !346
  %cmp3 = icmp slt i32 %5, 10, !dbg !348
  br i1 %cmp3, label %for.body, label %for.end, !dbg !349

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !350
  %idxprom4 = sext i32 %6 to i64, !dbg !352
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !352
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !352
  call void @printIntLine(i32 %7), !dbg !353
  br label %for.inc, !dbg !354

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !355
  %inc = add nsw i32 %8, 1, !dbg !355
  store i32 %inc, i32* %i, align 4, !dbg !355
  br label %for.cond, !dbg !356, !llvm.loop !357

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !359

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !360
  br label %if.end

if.end:                                           ; preds = %if.else6, %for.end
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !362
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !363 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !364, metadata !DIExpression()), !dbg !365
  store i32 -1, i32* %data, align 4, !dbg !366
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !367, metadata !DIExpression()), !dbg !369
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !370, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !372, metadata !DIExpression()), !dbg !373
  store i32 -1, i32* %connectSocket, align 4, !dbg !373
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !374, metadata !DIExpression()), !dbg !375
  br label %do.body, !dbg !376

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !377
  store i32 %call, i32* %connectSocket, align 4, !dbg !379
  %0 = load i32, i32* %connectSocket, align 4, !dbg !380
  %cmp = icmp eq i32 %0, -1, !dbg !382
  br i1 %cmp, label %if.then, label %if.end, !dbg !383

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !384

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !386
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !386
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !387
  store i16 2, i16* %sin_family, align 4, !dbg !388
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !389
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !390
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !391
  store i32 %call1, i32* %s_addr, align 4, !dbg !392
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !393
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !394
  store i16 %call2, i16* %sin_port, align 2, !dbg !395
  %2 = load i32, i32* %connectSocket, align 4, !dbg !396
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !398
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !399
  %cmp4 = icmp eq i32 %call3, -1, !dbg !400
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !401

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !402

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !404
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !405
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !406
  %conv = trunc i64 %call7 to i32, !dbg !406
  store i32 %conv, i32* %recvResult, align 4, !dbg !407
  %5 = load i32, i32* %recvResult, align 4, !dbg !408
  %cmp8 = icmp eq i32 %5, -1, !dbg !410
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !411

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !412
  %cmp10 = icmp eq i32 %6, 0, !dbg !413
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !414

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !415

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !417
  %idxprom = sext i32 %7 to i64, !dbg !418
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !418
  store i8 0, i8* %arrayidx, align 1, !dbg !419
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !420
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !421
  store i32 %call15, i32* %data, align 4, !dbg !422
  br label %do.end, !dbg !423

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !424
  %cmp16 = icmp ne i32 %8, -1, !dbg !426
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !427

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !428
  %call19 = call i32 @close(i32 %9), !dbg !430
  br label %if.end20, !dbg !431

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !432
  %10 = load i32, i32* %data, align 4, !dbg !433
  call void @goodB2G2Sink(i32 %10), !dbg !434
  ret void, !dbg !435
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !436 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !437, metadata !DIExpression()), !dbg !438
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !439
  %tobool = icmp ne i32 %0, 0, !dbg !439
  br i1 %tobool, label %if.then, label %if.end6, !dbg !441

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !442, metadata !DIExpression()), !dbg !445
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !446, metadata !DIExpression()), !dbg !447
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !447
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !447
  %2 = load i32, i32* %data.addr, align 4, !dbg !448
  %cmp = icmp sge i32 %2, 0, !dbg !450
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !451

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !452
  %cmp1 = icmp slt i32 %3, 10, !dbg !453
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !454

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !455
  %idxprom = sext i32 %4 to i64, !dbg !457
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !457
  store i32 1, i32* %arrayidx, align 4, !dbg !458
  store i32 0, i32* %i, align 4, !dbg !459
  br label %for.cond, !dbg !461

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !462
  %cmp3 = icmp slt i32 %5, 10, !dbg !464
  br i1 %cmp3, label %for.body, label %for.end, !dbg !465

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !466
  %idxprom4 = sext i32 %6 to i64, !dbg !468
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !468
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !468
  call void @printIntLine(i32 %7), !dbg !469
  br label %for.inc, !dbg !470

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !471
  %inc = add nsw i32 %8, 1, !dbg !471
  store i32 %inc, i32* %i, align 4, !dbg !471
  br label %for.cond, !dbg !472, !llvm.loop !473

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !475

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !476
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end6, !dbg !478

if.end6:                                          ; preds = %if.end, %entry
  ret void, !dbg !479
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !480 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !481, metadata !DIExpression()), !dbg !482
  store i32 -1, i32* %data, align 4, !dbg !483
  store i32 7, i32* %data, align 4, !dbg !484
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !485
  %0 = load i32, i32* %data, align 4, !dbg !486
  call void @goodG2BSink(i32 %0), !dbg !487
  ret void, !dbg !488
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !489 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !490, metadata !DIExpression()), !dbg !491
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !492
  %tobool = icmp ne i32 %0, 0, !dbg !492
  br i1 %tobool, label %if.then, label %if.end5, !dbg !494

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !495, metadata !DIExpression()), !dbg !498
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !499, metadata !DIExpression()), !dbg !500
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !500
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !500
  %2 = load i32, i32* %data.addr, align 4, !dbg !501
  %cmp = icmp sge i32 %2, 0, !dbg !503
  br i1 %cmp, label %if.then1, label %if.else, !dbg !504

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !505
  %idxprom = sext i32 %3 to i64, !dbg !507
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !507
  store i32 1, i32* %arrayidx, align 4, !dbg !508
  store i32 0, i32* %i, align 4, !dbg !509
  br label %for.cond, !dbg !511

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !512
  %cmp2 = icmp slt i32 %4, 10, !dbg !514
  br i1 %cmp2, label %for.body, label %for.end, !dbg !515

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !516
  %idxprom3 = sext i32 %5 to i64, !dbg !518
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !518
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !518
  call void @printIntLine(i32 %6), !dbg !519
  br label %for.inc, !dbg !520

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !521
  %inc = add nsw i32 %7, 1, !dbg !521
  store i32 %inc, i32* %i, align 4, !dbg !521
  br label %for.cond, !dbg !522, !llvm.loop !523

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !525

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !526
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !528

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !529
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
!llvm.module.flags = !{!70, !71, !72, !73, !74}
!llvm.ident = !{!75}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !64, line: 45, type: !65, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !61, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_21.c", directory: "/home/joelyang/SSE-Assessment")
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
!61 = !{!0, !62, !66, !68}
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !64, line: 143, type: !65, isLocal: true, isDefinition: true)
!64 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_21.c", directory: "/home/joelyang/SSE-Assessment")
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !64, line: 144, type: !65, isLocal: true, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !64, line: 145, type: !65, isLocal: true, isDefinition: true)
!70 = !{i32 7, !"Dwarf Version", i32 4}
!71 = !{i32 2, !"Debug Info Version", i32 3}
!72 = !{i32 1, !"wchar_size", i32 4}
!73 = !{i32 7, !"uwtable", i32 1}
!74 = !{i32 7, !"frame-pointer", i32 2}
!75 = !{!"clang version 13.0.0"}
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_21_bad", scope: !64, file: !64, line: 73, type: !77, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!77 = !DISubroutineType(types: !78)
!78 = !{null}
!79 = !{}
!80 = !DILocalVariable(name: "data", scope: !76, file: !64, line: 75, type: !65)
!81 = !DILocation(line: 75, column: 9, scope: !76)
!82 = !DILocation(line: 77, column: 10, scope: !76)
!83 = !DILocalVariable(name: "recvResult", scope: !84, file: !64, line: 83, type: !65)
!84 = distinct !DILexicalBlock(scope: !76, file: !64, line: 78, column: 5)
!85 = !DILocation(line: 83, column: 13, scope: !84)
!86 = !DILocalVariable(name: "service", scope: !84, file: !64, line: 84, type: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !88)
!88 = !{!89, !90, !96, !103}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !19, line: 240, baseType: !53, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !19, line: 241, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !93, line: 25, baseType: !94)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !95, line: 40, baseType: !55)
!95 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !19, line: 242, baseType: !97, size: 32, offset: 32)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !98)
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !97, file: !19, line: 33, baseType: !100, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !93, line: 26, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !95, line: 42, baseType: !7)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !19, line: 245, baseType: !104, size: 64, offset: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 64, elements: !106)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 84, column: 28, scope: !84)
!109 = !DILocalVariable(name: "connectSocket", scope: !84, file: !64, line: 85, type: !65)
!110 = !DILocation(line: 85, column: 16, scope: !84)
!111 = !DILocalVariable(name: "inputBuffer", scope: !84, file: !64, line: 86, type: !57)
!112 = !DILocation(line: 86, column: 14, scope: !84)
!113 = !DILocation(line: 87, column: 9, scope: !84)
!114 = !DILocation(line: 97, column: 29, scope: !115)
!115 = distinct !DILexicalBlock(scope: !84, file: !64, line: 88, column: 9)
!116 = !DILocation(line: 97, column: 27, scope: !115)
!117 = !DILocation(line: 98, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !64, line: 98, column: 17)
!119 = !DILocation(line: 98, column: 31, scope: !118)
!120 = !DILocation(line: 98, column: 17, scope: !115)
!121 = !DILocation(line: 100, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !64, line: 99, column: 13)
!123 = !DILocation(line: 102, column: 13, scope: !115)
!124 = !DILocation(line: 103, column: 21, scope: !115)
!125 = !DILocation(line: 103, column: 32, scope: !115)
!126 = !DILocation(line: 104, column: 39, scope: !115)
!127 = !DILocation(line: 104, column: 21, scope: !115)
!128 = !DILocation(line: 104, column: 30, scope: !115)
!129 = !DILocation(line: 104, column: 37, scope: !115)
!130 = !DILocation(line: 105, column: 32, scope: !115)
!131 = !DILocation(line: 105, column: 21, scope: !115)
!132 = !DILocation(line: 105, column: 30, scope: !115)
!133 = !DILocation(line: 106, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !115, file: !64, line: 106, column: 17)
!135 = !DILocation(line: 106, column: 40, scope: !134)
!136 = !DILocation(line: 106, column: 17, scope: !134)
!137 = !DILocation(line: 106, column: 85, scope: !134)
!138 = !DILocation(line: 106, column: 17, scope: !115)
!139 = !DILocation(line: 108, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !64, line: 107, column: 13)
!141 = !DILocation(line: 112, column: 31, scope: !115)
!142 = !DILocation(line: 112, column: 46, scope: !115)
!143 = !DILocation(line: 112, column: 26, scope: !115)
!144 = !DILocation(line: 112, column: 24, scope: !115)
!145 = !DILocation(line: 113, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !115, file: !64, line: 113, column: 17)
!147 = !DILocation(line: 113, column: 28, scope: !146)
!148 = !DILocation(line: 113, column: 44, scope: !146)
!149 = !DILocation(line: 113, column: 47, scope: !146)
!150 = !DILocation(line: 113, column: 58, scope: !146)
!151 = !DILocation(line: 113, column: 17, scope: !115)
!152 = !DILocation(line: 115, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !146, file: !64, line: 114, column: 13)
!154 = !DILocation(line: 118, column: 25, scope: !115)
!155 = !DILocation(line: 118, column: 13, scope: !115)
!156 = !DILocation(line: 118, column: 37, scope: !115)
!157 = !DILocation(line: 120, column: 25, scope: !115)
!158 = !DILocation(line: 120, column: 20, scope: !115)
!159 = !DILocation(line: 120, column: 18, scope: !115)
!160 = !DILocation(line: 121, column: 9, scope: !115)
!161 = !DILocation(line: 123, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !84, file: !64, line: 123, column: 13)
!163 = !DILocation(line: 123, column: 27, scope: !162)
!164 = !DILocation(line: 123, column: 13, scope: !84)
!165 = !DILocation(line: 125, column: 26, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !64, line: 124, column: 9)
!167 = !DILocation(line: 125, column: 13, scope: !166)
!168 = !DILocation(line: 126, column: 9, scope: !166)
!169 = !DILocation(line: 134, column: 15, scope: !76)
!170 = !DILocation(line: 135, column: 13, scope: !76)
!171 = !DILocation(line: 135, column: 5, scope: !76)
!172 = !DILocation(line: 136, column: 1, scope: !76)
!173 = distinct !DISubprogram(name: "badSink", scope: !64, file: !64, line: 47, type: !174, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!174 = !DISubroutineType(types: !175)
!175 = !{null, !65}
!176 = !DILocalVariable(name: "data", arg: 1, scope: !173, file: !64, line: 47, type: !65)
!177 = !DILocation(line: 47, column: 25, scope: !173)
!178 = !DILocation(line: 49, column: 8, scope: !179)
!179 = distinct !DILexicalBlock(scope: !173, file: !64, line: 49, column: 8)
!180 = !DILocation(line: 49, column: 8, scope: !173)
!181 = !DILocalVariable(name: "i", scope: !182, file: !64, line: 52, type: !65)
!182 = distinct !DILexicalBlock(scope: !183, file: !64, line: 51, column: 9)
!183 = distinct !DILexicalBlock(scope: !179, file: !64, line: 50, column: 5)
!184 = !DILocation(line: 52, column: 17, scope: !182)
!185 = !DILocalVariable(name: "buffer", scope: !182, file: !64, line: 53, type: !186)
!186 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 320, elements: !187)
!187 = !{!188}
!188 = !DISubrange(count: 10)
!189 = !DILocation(line: 53, column: 17, scope: !182)
!190 = !DILocation(line: 56, column: 17, scope: !191)
!191 = distinct !DILexicalBlock(scope: !182, file: !64, line: 56, column: 17)
!192 = !DILocation(line: 56, column: 22, scope: !191)
!193 = !DILocation(line: 56, column: 17, scope: !182)
!194 = !DILocation(line: 58, column: 24, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !64, line: 57, column: 13)
!196 = !DILocation(line: 58, column: 17, scope: !195)
!197 = !DILocation(line: 58, column: 30, scope: !195)
!198 = !DILocation(line: 60, column: 23, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !64, line: 60, column: 17)
!200 = !DILocation(line: 60, column: 21, scope: !199)
!201 = !DILocation(line: 60, column: 28, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !64, line: 60, column: 17)
!203 = !DILocation(line: 60, column: 30, scope: !202)
!204 = !DILocation(line: 60, column: 17, scope: !199)
!205 = !DILocation(line: 62, column: 41, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !64, line: 61, column: 17)
!207 = !DILocation(line: 62, column: 34, scope: !206)
!208 = !DILocation(line: 62, column: 21, scope: !206)
!209 = !DILocation(line: 63, column: 17, scope: !206)
!210 = !DILocation(line: 60, column: 37, scope: !202)
!211 = !DILocation(line: 60, column: 17, scope: !202)
!212 = distinct !{!212, !204, !213, !214}
!213 = !DILocation(line: 63, column: 17, scope: !199)
!214 = !{!"llvm.loop.mustprogress"}
!215 = !DILocation(line: 64, column: 13, scope: !195)
!216 = !DILocation(line: 67, column: 17, scope: !217)
!217 = distinct !DILexicalBlock(scope: !191, file: !64, line: 66, column: 13)
!218 = !DILocation(line: 70, column: 5, scope: !183)
!219 = !DILocation(line: 71, column: 1, scope: !173)
!220 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_21_good", scope: !64, file: !64, line: 373, type: !77, scopeLine: 374, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!221 = !DILocation(line: 375, column: 5, scope: !220)
!222 = !DILocation(line: 376, column: 5, scope: !220)
!223 = !DILocation(line: 377, column: 5, scope: !220)
!224 = !DILocation(line: 378, column: 1, scope: !220)
!225 = distinct !DISubprogram(name: "main", scope: !64, file: !64, line: 389, type: !226, scopeLine: 390, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!226 = !DISubroutineType(types: !227)
!227 = !{!65, !65, !228}
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64)
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!230 = !DILocalVariable(name: "argc", arg: 1, scope: !225, file: !64, line: 389, type: !65)
!231 = !DILocation(line: 389, column: 14, scope: !225)
!232 = !DILocalVariable(name: "argv", arg: 2, scope: !225, file: !64, line: 389, type: !228)
!233 = !DILocation(line: 389, column: 27, scope: !225)
!234 = !DILocation(line: 392, column: 22, scope: !225)
!235 = !DILocation(line: 392, column: 12, scope: !225)
!236 = !DILocation(line: 392, column: 5, scope: !225)
!237 = !DILocation(line: 394, column: 5, scope: !225)
!238 = !DILocation(line: 395, column: 5, scope: !225)
!239 = !DILocation(line: 396, column: 5, scope: !225)
!240 = !DILocation(line: 399, column: 5, scope: !225)
!241 = !DILocation(line: 400, column: 5, scope: !225)
!242 = !DILocation(line: 401, column: 5, scope: !225)
!243 = !DILocation(line: 403, column: 5, scope: !225)
!244 = distinct !DISubprogram(name: "goodB2G1", scope: !64, file: !64, line: 178, type: !77, scopeLine: 179, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!245 = !DILocalVariable(name: "data", scope: !244, file: !64, line: 180, type: !65)
!246 = !DILocation(line: 180, column: 9, scope: !244)
!247 = !DILocation(line: 182, column: 10, scope: !244)
!248 = !DILocalVariable(name: "recvResult", scope: !249, file: !64, line: 188, type: !65)
!249 = distinct !DILexicalBlock(scope: !244, file: !64, line: 183, column: 5)
!250 = !DILocation(line: 188, column: 13, scope: !249)
!251 = !DILocalVariable(name: "service", scope: !249, file: !64, line: 189, type: !87)
!252 = !DILocation(line: 189, column: 28, scope: !249)
!253 = !DILocalVariable(name: "connectSocket", scope: !249, file: !64, line: 190, type: !65)
!254 = !DILocation(line: 190, column: 16, scope: !249)
!255 = !DILocalVariable(name: "inputBuffer", scope: !249, file: !64, line: 191, type: !57)
!256 = !DILocation(line: 191, column: 14, scope: !249)
!257 = !DILocation(line: 192, column: 9, scope: !249)
!258 = !DILocation(line: 202, column: 29, scope: !259)
!259 = distinct !DILexicalBlock(scope: !249, file: !64, line: 193, column: 9)
!260 = !DILocation(line: 202, column: 27, scope: !259)
!261 = !DILocation(line: 203, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !64, line: 203, column: 17)
!263 = !DILocation(line: 203, column: 31, scope: !262)
!264 = !DILocation(line: 203, column: 17, scope: !259)
!265 = !DILocation(line: 205, column: 17, scope: !266)
!266 = distinct !DILexicalBlock(scope: !262, file: !64, line: 204, column: 13)
!267 = !DILocation(line: 207, column: 13, scope: !259)
!268 = !DILocation(line: 208, column: 21, scope: !259)
!269 = !DILocation(line: 208, column: 32, scope: !259)
!270 = !DILocation(line: 209, column: 39, scope: !259)
!271 = !DILocation(line: 209, column: 21, scope: !259)
!272 = !DILocation(line: 209, column: 30, scope: !259)
!273 = !DILocation(line: 209, column: 37, scope: !259)
!274 = !DILocation(line: 210, column: 32, scope: !259)
!275 = !DILocation(line: 210, column: 21, scope: !259)
!276 = !DILocation(line: 210, column: 30, scope: !259)
!277 = !DILocation(line: 211, column: 25, scope: !278)
!278 = distinct !DILexicalBlock(scope: !259, file: !64, line: 211, column: 17)
!279 = !DILocation(line: 211, column: 40, scope: !278)
!280 = !DILocation(line: 211, column: 17, scope: !278)
!281 = !DILocation(line: 211, column: 85, scope: !278)
!282 = !DILocation(line: 211, column: 17, scope: !259)
!283 = !DILocation(line: 213, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !278, file: !64, line: 212, column: 13)
!285 = !DILocation(line: 217, column: 31, scope: !259)
!286 = !DILocation(line: 217, column: 46, scope: !259)
!287 = !DILocation(line: 217, column: 26, scope: !259)
!288 = !DILocation(line: 217, column: 24, scope: !259)
!289 = !DILocation(line: 218, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !259, file: !64, line: 218, column: 17)
!291 = !DILocation(line: 218, column: 28, scope: !290)
!292 = !DILocation(line: 218, column: 44, scope: !290)
!293 = !DILocation(line: 218, column: 47, scope: !290)
!294 = !DILocation(line: 218, column: 58, scope: !290)
!295 = !DILocation(line: 218, column: 17, scope: !259)
!296 = !DILocation(line: 220, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !290, file: !64, line: 219, column: 13)
!298 = !DILocation(line: 223, column: 25, scope: !259)
!299 = !DILocation(line: 223, column: 13, scope: !259)
!300 = !DILocation(line: 223, column: 37, scope: !259)
!301 = !DILocation(line: 225, column: 25, scope: !259)
!302 = !DILocation(line: 225, column: 20, scope: !259)
!303 = !DILocation(line: 225, column: 18, scope: !259)
!304 = !DILocation(line: 226, column: 9, scope: !259)
!305 = !DILocation(line: 228, column: 13, scope: !306)
!306 = distinct !DILexicalBlock(scope: !249, file: !64, line: 228, column: 13)
!307 = !DILocation(line: 228, column: 27, scope: !306)
!308 = !DILocation(line: 228, column: 13, scope: !249)
!309 = !DILocation(line: 230, column: 26, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !64, line: 229, column: 9)
!311 = !DILocation(line: 230, column: 13, scope: !310)
!312 = !DILocation(line: 231, column: 9, scope: !310)
!313 = !DILocation(line: 239, column: 20, scope: !244)
!314 = !DILocation(line: 240, column: 18, scope: !244)
!315 = !DILocation(line: 240, column: 5, scope: !244)
!316 = !DILocation(line: 241, column: 1, scope: !244)
!317 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !64, file: !64, line: 148, type: !174, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!318 = !DILocalVariable(name: "data", arg: 1, scope: !317, file: !64, line: 148, type: !65)
!319 = !DILocation(line: 148, column: 30, scope: !317)
!320 = !DILocation(line: 150, column: 8, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !64, line: 150, column: 8)
!322 = !DILocation(line: 150, column: 8, scope: !317)
!323 = !DILocation(line: 153, column: 9, scope: !324)
!324 = distinct !DILexicalBlock(scope: !321, file: !64, line: 151, column: 5)
!325 = !DILocation(line: 154, column: 5, scope: !324)
!326 = !DILocalVariable(name: "i", scope: !327, file: !64, line: 158, type: !65)
!327 = distinct !DILexicalBlock(scope: !328, file: !64, line: 157, column: 9)
!328 = distinct !DILexicalBlock(scope: !321, file: !64, line: 156, column: 5)
!329 = !DILocation(line: 158, column: 17, scope: !327)
!330 = !DILocalVariable(name: "buffer", scope: !327, file: !64, line: 159, type: !186)
!331 = !DILocation(line: 159, column: 17, scope: !327)
!332 = !DILocation(line: 161, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !327, file: !64, line: 161, column: 17)
!334 = !DILocation(line: 161, column: 22, scope: !333)
!335 = !DILocation(line: 161, column: 27, scope: !333)
!336 = !DILocation(line: 161, column: 30, scope: !333)
!337 = !DILocation(line: 161, column: 35, scope: !333)
!338 = !DILocation(line: 161, column: 17, scope: !327)
!339 = !DILocation(line: 163, column: 24, scope: !340)
!340 = distinct !DILexicalBlock(scope: !333, file: !64, line: 162, column: 13)
!341 = !DILocation(line: 163, column: 17, scope: !340)
!342 = !DILocation(line: 163, column: 30, scope: !340)
!343 = !DILocation(line: 165, column: 23, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !64, line: 165, column: 17)
!345 = !DILocation(line: 165, column: 21, scope: !344)
!346 = !DILocation(line: 165, column: 28, scope: !347)
!347 = distinct !DILexicalBlock(scope: !344, file: !64, line: 165, column: 17)
!348 = !DILocation(line: 165, column: 30, scope: !347)
!349 = !DILocation(line: 165, column: 17, scope: !344)
!350 = !DILocation(line: 167, column: 41, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !64, line: 166, column: 17)
!352 = !DILocation(line: 167, column: 34, scope: !351)
!353 = !DILocation(line: 167, column: 21, scope: !351)
!354 = !DILocation(line: 168, column: 17, scope: !351)
!355 = !DILocation(line: 165, column: 37, scope: !347)
!356 = !DILocation(line: 165, column: 17, scope: !347)
!357 = distinct !{!357, !349, !358, !214}
!358 = !DILocation(line: 168, column: 17, scope: !344)
!359 = !DILocation(line: 169, column: 13, scope: !340)
!360 = !DILocation(line: 172, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !333, file: !64, line: 171, column: 13)
!362 = !DILocation(line: 176, column: 1, scope: !317)
!363 = distinct !DISubprogram(name: "goodB2G2", scope: !64, file: !64, line: 269, type: !77, scopeLine: 270, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!364 = !DILocalVariable(name: "data", scope: !363, file: !64, line: 271, type: !65)
!365 = !DILocation(line: 271, column: 9, scope: !363)
!366 = !DILocation(line: 273, column: 10, scope: !363)
!367 = !DILocalVariable(name: "recvResult", scope: !368, file: !64, line: 279, type: !65)
!368 = distinct !DILexicalBlock(scope: !363, file: !64, line: 274, column: 5)
!369 = !DILocation(line: 279, column: 13, scope: !368)
!370 = !DILocalVariable(name: "service", scope: !368, file: !64, line: 280, type: !87)
!371 = !DILocation(line: 280, column: 28, scope: !368)
!372 = !DILocalVariable(name: "connectSocket", scope: !368, file: !64, line: 281, type: !65)
!373 = !DILocation(line: 281, column: 16, scope: !368)
!374 = !DILocalVariable(name: "inputBuffer", scope: !368, file: !64, line: 282, type: !57)
!375 = !DILocation(line: 282, column: 14, scope: !368)
!376 = !DILocation(line: 283, column: 9, scope: !368)
!377 = !DILocation(line: 293, column: 29, scope: !378)
!378 = distinct !DILexicalBlock(scope: !368, file: !64, line: 284, column: 9)
!379 = !DILocation(line: 293, column: 27, scope: !378)
!380 = !DILocation(line: 294, column: 17, scope: !381)
!381 = distinct !DILexicalBlock(scope: !378, file: !64, line: 294, column: 17)
!382 = !DILocation(line: 294, column: 31, scope: !381)
!383 = !DILocation(line: 294, column: 17, scope: !378)
!384 = !DILocation(line: 296, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !64, line: 295, column: 13)
!386 = !DILocation(line: 298, column: 13, scope: !378)
!387 = !DILocation(line: 299, column: 21, scope: !378)
!388 = !DILocation(line: 299, column: 32, scope: !378)
!389 = !DILocation(line: 300, column: 39, scope: !378)
!390 = !DILocation(line: 300, column: 21, scope: !378)
!391 = !DILocation(line: 300, column: 30, scope: !378)
!392 = !DILocation(line: 300, column: 37, scope: !378)
!393 = !DILocation(line: 301, column: 32, scope: !378)
!394 = !DILocation(line: 301, column: 21, scope: !378)
!395 = !DILocation(line: 301, column: 30, scope: !378)
!396 = !DILocation(line: 302, column: 25, scope: !397)
!397 = distinct !DILexicalBlock(scope: !378, file: !64, line: 302, column: 17)
!398 = !DILocation(line: 302, column: 40, scope: !397)
!399 = !DILocation(line: 302, column: 17, scope: !397)
!400 = !DILocation(line: 302, column: 85, scope: !397)
!401 = !DILocation(line: 302, column: 17, scope: !378)
!402 = !DILocation(line: 304, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !397, file: !64, line: 303, column: 13)
!404 = !DILocation(line: 308, column: 31, scope: !378)
!405 = !DILocation(line: 308, column: 46, scope: !378)
!406 = !DILocation(line: 308, column: 26, scope: !378)
!407 = !DILocation(line: 308, column: 24, scope: !378)
!408 = !DILocation(line: 309, column: 17, scope: !409)
!409 = distinct !DILexicalBlock(scope: !378, file: !64, line: 309, column: 17)
!410 = !DILocation(line: 309, column: 28, scope: !409)
!411 = !DILocation(line: 309, column: 44, scope: !409)
!412 = !DILocation(line: 309, column: 47, scope: !409)
!413 = !DILocation(line: 309, column: 58, scope: !409)
!414 = !DILocation(line: 309, column: 17, scope: !378)
!415 = !DILocation(line: 311, column: 17, scope: !416)
!416 = distinct !DILexicalBlock(scope: !409, file: !64, line: 310, column: 13)
!417 = !DILocation(line: 314, column: 25, scope: !378)
!418 = !DILocation(line: 314, column: 13, scope: !378)
!419 = !DILocation(line: 314, column: 37, scope: !378)
!420 = !DILocation(line: 316, column: 25, scope: !378)
!421 = !DILocation(line: 316, column: 20, scope: !378)
!422 = !DILocation(line: 316, column: 18, scope: !378)
!423 = !DILocation(line: 317, column: 9, scope: !378)
!424 = !DILocation(line: 319, column: 13, scope: !425)
!425 = distinct !DILexicalBlock(scope: !368, file: !64, line: 319, column: 13)
!426 = !DILocation(line: 319, column: 27, scope: !425)
!427 = !DILocation(line: 319, column: 13, scope: !368)
!428 = !DILocation(line: 321, column: 26, scope: !429)
!429 = distinct !DILexicalBlock(scope: !425, file: !64, line: 320, column: 9)
!430 = !DILocation(line: 321, column: 13, scope: !429)
!431 = !DILocation(line: 322, column: 9, scope: !429)
!432 = !DILocation(line: 330, column: 20, scope: !363)
!433 = !DILocation(line: 331, column: 18, scope: !363)
!434 = !DILocation(line: 331, column: 5, scope: !363)
!435 = !DILocation(line: 332, column: 1, scope: !363)
!436 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !64, file: !64, line: 244, type: !174, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!437 = !DILocalVariable(name: "data", arg: 1, scope: !436, file: !64, line: 244, type: !65)
!438 = !DILocation(line: 244, column: 30, scope: !436)
!439 = !DILocation(line: 246, column: 8, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !64, line: 246, column: 8)
!441 = !DILocation(line: 246, column: 8, scope: !436)
!442 = !DILocalVariable(name: "i", scope: !443, file: !64, line: 249, type: !65)
!443 = distinct !DILexicalBlock(scope: !444, file: !64, line: 248, column: 9)
!444 = distinct !DILexicalBlock(scope: !440, file: !64, line: 247, column: 5)
!445 = !DILocation(line: 249, column: 17, scope: !443)
!446 = !DILocalVariable(name: "buffer", scope: !443, file: !64, line: 250, type: !186)
!447 = !DILocation(line: 250, column: 17, scope: !443)
!448 = !DILocation(line: 252, column: 17, scope: !449)
!449 = distinct !DILexicalBlock(scope: !443, file: !64, line: 252, column: 17)
!450 = !DILocation(line: 252, column: 22, scope: !449)
!451 = !DILocation(line: 252, column: 27, scope: !449)
!452 = !DILocation(line: 252, column: 30, scope: !449)
!453 = !DILocation(line: 252, column: 35, scope: !449)
!454 = !DILocation(line: 252, column: 17, scope: !443)
!455 = !DILocation(line: 254, column: 24, scope: !456)
!456 = distinct !DILexicalBlock(scope: !449, file: !64, line: 253, column: 13)
!457 = !DILocation(line: 254, column: 17, scope: !456)
!458 = !DILocation(line: 254, column: 30, scope: !456)
!459 = !DILocation(line: 256, column: 23, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !64, line: 256, column: 17)
!461 = !DILocation(line: 256, column: 21, scope: !460)
!462 = !DILocation(line: 256, column: 28, scope: !463)
!463 = distinct !DILexicalBlock(scope: !460, file: !64, line: 256, column: 17)
!464 = !DILocation(line: 256, column: 30, scope: !463)
!465 = !DILocation(line: 256, column: 17, scope: !460)
!466 = !DILocation(line: 258, column: 41, scope: !467)
!467 = distinct !DILexicalBlock(scope: !463, file: !64, line: 257, column: 17)
!468 = !DILocation(line: 258, column: 34, scope: !467)
!469 = !DILocation(line: 258, column: 21, scope: !467)
!470 = !DILocation(line: 259, column: 17, scope: !467)
!471 = !DILocation(line: 256, column: 37, scope: !463)
!472 = !DILocation(line: 256, column: 17, scope: !463)
!473 = distinct !{!473, !465, !474, !214}
!474 = !DILocation(line: 259, column: 17, scope: !460)
!475 = !DILocation(line: 260, column: 13, scope: !456)
!476 = !DILocation(line: 263, column: 17, scope: !477)
!477 = distinct !DILexicalBlock(scope: !449, file: !64, line: 262, column: 13)
!478 = !DILocation(line: 266, column: 5, scope: !444)
!479 = !DILocation(line: 267, column: 1, scope: !436)
!480 = distinct !DISubprogram(name: "goodG2B", scope: !64, file: !64, line: 361, type: !77, scopeLine: 362, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!481 = !DILocalVariable(name: "data", scope: !480, file: !64, line: 363, type: !65)
!482 = !DILocation(line: 363, column: 9, scope: !480)
!483 = !DILocation(line: 365, column: 10, scope: !480)
!484 = !DILocation(line: 368, column: 10, scope: !480)
!485 = !DILocation(line: 369, column: 19, scope: !480)
!486 = !DILocation(line: 370, column: 17, scope: !480)
!487 = !DILocation(line: 370, column: 5, scope: !480)
!488 = !DILocation(line: 371, column: 1, scope: !480)
!489 = distinct !DISubprogram(name: "goodG2BSink", scope: !64, file: !64, line: 335, type: !174, scopeLine: 336, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!490 = !DILocalVariable(name: "data", arg: 1, scope: !489, file: !64, line: 335, type: !65)
!491 = !DILocation(line: 335, column: 29, scope: !489)
!492 = !DILocation(line: 337, column: 8, scope: !493)
!493 = distinct !DILexicalBlock(scope: !489, file: !64, line: 337, column: 8)
!494 = !DILocation(line: 337, column: 8, scope: !489)
!495 = !DILocalVariable(name: "i", scope: !496, file: !64, line: 340, type: !65)
!496 = distinct !DILexicalBlock(scope: !497, file: !64, line: 339, column: 9)
!497 = distinct !DILexicalBlock(scope: !493, file: !64, line: 338, column: 5)
!498 = !DILocation(line: 340, column: 17, scope: !496)
!499 = !DILocalVariable(name: "buffer", scope: !496, file: !64, line: 341, type: !186)
!500 = !DILocation(line: 341, column: 17, scope: !496)
!501 = !DILocation(line: 344, column: 17, scope: !502)
!502 = distinct !DILexicalBlock(scope: !496, file: !64, line: 344, column: 17)
!503 = !DILocation(line: 344, column: 22, scope: !502)
!504 = !DILocation(line: 344, column: 17, scope: !496)
!505 = !DILocation(line: 346, column: 24, scope: !506)
!506 = distinct !DILexicalBlock(scope: !502, file: !64, line: 345, column: 13)
!507 = !DILocation(line: 346, column: 17, scope: !506)
!508 = !DILocation(line: 346, column: 30, scope: !506)
!509 = !DILocation(line: 348, column: 23, scope: !510)
!510 = distinct !DILexicalBlock(scope: !506, file: !64, line: 348, column: 17)
!511 = !DILocation(line: 348, column: 21, scope: !510)
!512 = !DILocation(line: 348, column: 28, scope: !513)
!513 = distinct !DILexicalBlock(scope: !510, file: !64, line: 348, column: 17)
!514 = !DILocation(line: 348, column: 30, scope: !513)
!515 = !DILocation(line: 348, column: 17, scope: !510)
!516 = !DILocation(line: 350, column: 41, scope: !517)
!517 = distinct !DILexicalBlock(scope: !513, file: !64, line: 349, column: 17)
!518 = !DILocation(line: 350, column: 34, scope: !517)
!519 = !DILocation(line: 350, column: 21, scope: !517)
!520 = !DILocation(line: 351, column: 17, scope: !517)
!521 = !DILocation(line: 348, column: 37, scope: !513)
!522 = !DILocation(line: 348, column: 17, scope: !513)
!523 = distinct !{!523, !515, !524, !214}
!524 = !DILocation(line: 351, column: 17, scope: !510)
!525 = !DILocation(line: 352, column: 13, scope: !506)
!526 = !DILocation(line: 355, column: 17, scope: !527)
!527 = distinct !DILexicalBlock(scope: !502, file: !64, line: 354, column: 13)
!528 = !DILocation(line: 358, column: 5, scope: !497)
!529 = !DILocation(line: 359, column: 1, scope: !489)
