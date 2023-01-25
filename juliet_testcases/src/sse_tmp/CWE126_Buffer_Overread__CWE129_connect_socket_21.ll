; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_21.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_21.c"
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
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !62
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !66
@goodG2BStatic = internal global i32 0, align 4, !dbg !68

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_21_bad() #0 !dbg !76 {
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
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !176, metadata !DIExpression()), !dbg !177
  %0 = load i32, i32* @badStatic, align 4, !dbg !178
  %tobool = icmp ne i32 %0, 0, !dbg !178
  br i1 %tobool, label %if.then, label %if.end2, !dbg !180

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !181, metadata !DIExpression()), !dbg !187
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !187
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !187
  %2 = load i32, i32* %data.addr, align 4, !dbg !188
  %cmp = icmp sge i32 %2, 0, !dbg !190
  br i1 %cmp, label %if.then1, label %if.else, !dbg !191

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !192
  %idxprom = sext i32 %3 to i64, !dbg !194
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !194
  %4 = load i32, i32* %arrayidx, align 4, !dbg !194
  call void @printIntLine(i32 %4), !dbg !195
  br label %if.end, !dbg !196

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !197
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !199

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_21_good() #0 !dbg !201 {
entry:
  call void @goodB2G1(), !dbg !202
  call void @goodB2G2(), !dbg !203
  call void @goodG2B(), !dbg !204
  ret void, !dbg !205
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !206 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !211, metadata !DIExpression()), !dbg !212
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !213, metadata !DIExpression()), !dbg !214
  %call = call i64 @time(i64* null) #7, !dbg !215
  %conv = trunc i64 %call to i32, !dbg !216
  call void @srand(i32 %conv) #7, !dbg !217
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !218
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_21_good(), !dbg !219
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !220
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !221
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_21_bad(), !dbg !222
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !223
  ret i32 0, !dbg !224
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !225 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !226, metadata !DIExpression()), !dbg !227
  store i32 -1, i32* %data, align 4, !dbg !228
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !229, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !232, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !234, metadata !DIExpression()), !dbg !235
  store i32 -1, i32* %connectSocket, align 4, !dbg !235
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !236, metadata !DIExpression()), !dbg !237
  br label %do.body, !dbg !238

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !239
  store i32 %call, i32* %connectSocket, align 4, !dbg !241
  %0 = load i32, i32* %connectSocket, align 4, !dbg !242
  %cmp = icmp eq i32 %0, -1, !dbg !244
  br i1 %cmp, label %if.then, label %if.end, !dbg !245

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !246

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !248
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !248
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !249
  store i16 2, i16* %sin_family, align 4, !dbg !250
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !251
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !252
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !253
  store i32 %call1, i32* %s_addr, align 4, !dbg !254
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !255
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !256
  store i16 %call2, i16* %sin_port, align 2, !dbg !257
  %2 = load i32, i32* %connectSocket, align 4, !dbg !258
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !260
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !261
  %cmp4 = icmp eq i32 %call3, -1, !dbg !262
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !263

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !264

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !266
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !267
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !268
  %conv = trunc i64 %call7 to i32, !dbg !268
  store i32 %conv, i32* %recvResult, align 4, !dbg !269
  %5 = load i32, i32* %recvResult, align 4, !dbg !270
  %cmp8 = icmp eq i32 %5, -1, !dbg !272
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !273

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !274
  %cmp10 = icmp eq i32 %6, 0, !dbg !275
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !276

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !277

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !279
  %idxprom = sext i32 %7 to i64, !dbg !280
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !280
  store i8 0, i8* %arrayidx, align 1, !dbg !281
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !282
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !283
  store i32 %call15, i32* %data, align 4, !dbg !284
  br label %do.end, !dbg !285

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !286
  %cmp16 = icmp ne i32 %8, -1, !dbg !288
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !289

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !290
  %call19 = call i32 @close(i32 %9), !dbg !292
  br label %if.end20, !dbg !293

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !294
  %10 = load i32, i32* %data, align 4, !dbg !295
  call void @goodB2G1Sink(i32 %10), !dbg !296
  ret void, !dbg !297
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !298 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !299, metadata !DIExpression()), !dbg !300
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !301
  %tobool = icmp ne i32 %0, 0, !dbg !301
  br i1 %tobool, label %if.then, label %if.else, !dbg !303

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !304
  br label %if.end4, !dbg !306

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !307, metadata !DIExpression()), !dbg !310
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !310
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !310
  %2 = load i32, i32* %data.addr, align 4, !dbg !311
  %cmp = icmp sge i32 %2, 0, !dbg !313
  br i1 %cmp, label %land.lhs.true, label %if.else3, !dbg !314

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !315
  %cmp1 = icmp slt i32 %3, 10, !dbg !316
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !317

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !318
  %idxprom = sext i32 %4 to i64, !dbg !320
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !320
  %5 = load i32, i32* %arrayidx, align 4, !dbg !320
  call void @printIntLine(i32 %5), !dbg !321
  br label %if.end, !dbg !322

if.else3:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !323
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !325
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !326 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !327, metadata !DIExpression()), !dbg !328
  store i32 -1, i32* %data, align 4, !dbg !329
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !330, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !333, metadata !DIExpression()), !dbg !334
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !335, metadata !DIExpression()), !dbg !336
  store i32 -1, i32* %connectSocket, align 4, !dbg !336
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !337, metadata !DIExpression()), !dbg !338
  br label %do.body, !dbg !339

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !340
  store i32 %call, i32* %connectSocket, align 4, !dbg !342
  %0 = load i32, i32* %connectSocket, align 4, !dbg !343
  %cmp = icmp eq i32 %0, -1, !dbg !345
  br i1 %cmp, label %if.then, label %if.end, !dbg !346

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !347

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !349
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !349
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !350
  store i16 2, i16* %sin_family, align 4, !dbg !351
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !352
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !353
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !354
  store i32 %call1, i32* %s_addr, align 4, !dbg !355
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !356
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !357
  store i16 %call2, i16* %sin_port, align 2, !dbg !358
  %2 = load i32, i32* %connectSocket, align 4, !dbg !359
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !361
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !362
  %cmp4 = icmp eq i32 %call3, -1, !dbg !363
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !364

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !365

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !367
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !368
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !369
  %conv = trunc i64 %call7 to i32, !dbg !369
  store i32 %conv, i32* %recvResult, align 4, !dbg !370
  %5 = load i32, i32* %recvResult, align 4, !dbg !371
  %cmp8 = icmp eq i32 %5, -1, !dbg !373
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !374

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !375
  %cmp10 = icmp eq i32 %6, 0, !dbg !376
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !377

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !378

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !380
  %idxprom = sext i32 %7 to i64, !dbg !381
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !381
  store i8 0, i8* %arrayidx, align 1, !dbg !382
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !383
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !384
  store i32 %call15, i32* %data, align 4, !dbg !385
  br label %do.end, !dbg !386

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !387
  %cmp16 = icmp ne i32 %8, -1, !dbg !389
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !390

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !391
  %call19 = call i32 @close(i32 %9), !dbg !393
  br label %if.end20, !dbg !394

if.end20:                                         ; preds = %if.then18, %do.end
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !395
  %10 = load i32, i32* %data, align 4, !dbg !396
  call void @goodB2G2Sink(i32 %10), !dbg !397
  ret void, !dbg !398
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !399 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !400, metadata !DIExpression()), !dbg !401
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !402
  %tobool = icmp ne i32 %0, 0, !dbg !402
  br i1 %tobool, label %if.then, label %if.end3, !dbg !404

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !405, metadata !DIExpression()), !dbg !408
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !408
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !408
  %2 = load i32, i32* %data.addr, align 4, !dbg !409
  %cmp = icmp sge i32 %2, 0, !dbg !411
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !412

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !413
  %cmp1 = icmp slt i32 %3, 10, !dbg !414
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !415

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !416
  %idxprom = sext i32 %4 to i64, !dbg !418
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !418
  %5 = load i32, i32* %arrayidx, align 4, !dbg !418
  call void @printIntLine(i32 %5), !dbg !419
  br label %if.end, !dbg !420

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !421
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3, !dbg !423

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !424
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !425 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !426, metadata !DIExpression()), !dbg !427
  store i32 -1, i32* %data, align 4, !dbg !428
  store i32 7, i32* %data, align 4, !dbg !429
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !430
  %0 = load i32, i32* %data, align 4, !dbg !431
  call void @goodG2BSink(i32 %0), !dbg !432
  ret void, !dbg !433
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !434 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !435, metadata !DIExpression()), !dbg !436
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !437
  %tobool = icmp ne i32 %0, 0, !dbg !437
  br i1 %tobool, label %if.then, label %if.end2, !dbg !439

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !440, metadata !DIExpression()), !dbg !443
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !443
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !443
  %2 = load i32, i32* %data.addr, align 4, !dbg !444
  %cmp = icmp sge i32 %2, 0, !dbg !446
  br i1 %cmp, label %if.then1, label %if.else, !dbg !447

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !448
  %idxprom = sext i32 %3 to i64, !dbg !450
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !450
  %4 = load i32, i32* %arrayidx, align 4, !dbg !450
  call void @printIntLine(i32 %4), !dbg !451
  br label %if.end, !dbg !452

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !453
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !455

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !456
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_21.c", directory: "/home/joelyang/SSE-Assessment")
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
!63 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !64, line: 137, type: !65, isLocal: true, isDefinition: true)
!64 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_21.c", directory: "/home/joelyang/SSE-Assessment")
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !64, line: 138, type: !65, isLocal: true, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !64, line: 139, type: !65, isLocal: true, isDefinition: true)
!70 = !{i32 7, !"Dwarf Version", i32 4}
!71 = !{i32 2, !"Debug Info Version", i32 3}
!72 = !{i32 1, !"wchar_size", i32 4}
!73 = !{i32 7, !"uwtable", i32 1}
!74 = !{i32 7, !"frame-pointer", i32 2}
!75 = !{!"clang version 13.0.0"}
!76 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_21_bad", scope: !64, file: !64, line: 67, type: !77, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!77 = !DISubroutineType(types: !78)
!78 = !{null}
!79 = !{}
!80 = !DILocalVariable(name: "data", scope: !76, file: !64, line: 69, type: !65)
!81 = !DILocation(line: 69, column: 9, scope: !76)
!82 = !DILocation(line: 71, column: 10, scope: !76)
!83 = !DILocalVariable(name: "recvResult", scope: !84, file: !64, line: 77, type: !65)
!84 = distinct !DILexicalBlock(scope: !76, file: !64, line: 72, column: 5)
!85 = !DILocation(line: 77, column: 13, scope: !84)
!86 = !DILocalVariable(name: "service", scope: !84, file: !64, line: 78, type: !87)
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
!108 = !DILocation(line: 78, column: 28, scope: !84)
!109 = !DILocalVariable(name: "connectSocket", scope: !84, file: !64, line: 79, type: !65)
!110 = !DILocation(line: 79, column: 16, scope: !84)
!111 = !DILocalVariable(name: "inputBuffer", scope: !84, file: !64, line: 80, type: !57)
!112 = !DILocation(line: 80, column: 14, scope: !84)
!113 = !DILocation(line: 81, column: 9, scope: !84)
!114 = !DILocation(line: 91, column: 29, scope: !115)
!115 = distinct !DILexicalBlock(scope: !84, file: !64, line: 82, column: 9)
!116 = !DILocation(line: 91, column: 27, scope: !115)
!117 = !DILocation(line: 92, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !64, line: 92, column: 17)
!119 = !DILocation(line: 92, column: 31, scope: !118)
!120 = !DILocation(line: 92, column: 17, scope: !115)
!121 = !DILocation(line: 94, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !64, line: 93, column: 13)
!123 = !DILocation(line: 96, column: 13, scope: !115)
!124 = !DILocation(line: 97, column: 21, scope: !115)
!125 = !DILocation(line: 97, column: 32, scope: !115)
!126 = !DILocation(line: 98, column: 39, scope: !115)
!127 = !DILocation(line: 98, column: 21, scope: !115)
!128 = !DILocation(line: 98, column: 30, scope: !115)
!129 = !DILocation(line: 98, column: 37, scope: !115)
!130 = !DILocation(line: 99, column: 32, scope: !115)
!131 = !DILocation(line: 99, column: 21, scope: !115)
!132 = !DILocation(line: 99, column: 30, scope: !115)
!133 = !DILocation(line: 100, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !115, file: !64, line: 100, column: 17)
!135 = !DILocation(line: 100, column: 40, scope: !134)
!136 = !DILocation(line: 100, column: 17, scope: !134)
!137 = !DILocation(line: 100, column: 85, scope: !134)
!138 = !DILocation(line: 100, column: 17, scope: !115)
!139 = !DILocation(line: 102, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !64, line: 101, column: 13)
!141 = !DILocation(line: 106, column: 31, scope: !115)
!142 = !DILocation(line: 106, column: 46, scope: !115)
!143 = !DILocation(line: 106, column: 26, scope: !115)
!144 = !DILocation(line: 106, column: 24, scope: !115)
!145 = !DILocation(line: 107, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !115, file: !64, line: 107, column: 17)
!147 = !DILocation(line: 107, column: 28, scope: !146)
!148 = !DILocation(line: 107, column: 44, scope: !146)
!149 = !DILocation(line: 107, column: 47, scope: !146)
!150 = !DILocation(line: 107, column: 58, scope: !146)
!151 = !DILocation(line: 107, column: 17, scope: !115)
!152 = !DILocation(line: 109, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !146, file: !64, line: 108, column: 13)
!154 = !DILocation(line: 112, column: 25, scope: !115)
!155 = !DILocation(line: 112, column: 13, scope: !115)
!156 = !DILocation(line: 112, column: 37, scope: !115)
!157 = !DILocation(line: 114, column: 25, scope: !115)
!158 = !DILocation(line: 114, column: 20, scope: !115)
!159 = !DILocation(line: 114, column: 18, scope: !115)
!160 = !DILocation(line: 115, column: 9, scope: !115)
!161 = !DILocation(line: 117, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !84, file: !64, line: 117, column: 13)
!163 = !DILocation(line: 117, column: 27, scope: !162)
!164 = !DILocation(line: 117, column: 13, scope: !84)
!165 = !DILocation(line: 119, column: 26, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !64, line: 118, column: 9)
!167 = !DILocation(line: 119, column: 13, scope: !166)
!168 = !DILocation(line: 120, column: 9, scope: !166)
!169 = !DILocation(line: 128, column: 15, scope: !76)
!170 = !DILocation(line: 129, column: 13, scope: !76)
!171 = !DILocation(line: 129, column: 5, scope: !76)
!172 = !DILocation(line: 130, column: 1, scope: !76)
!173 = distinct !DISubprogram(name: "badSink", scope: !64, file: !64, line: 47, type: !174, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!174 = !DISubroutineType(types: !175)
!175 = !{null, !65}
!176 = !DILocalVariable(name: "data", arg: 1, scope: !173, file: !64, line: 47, type: !65)
!177 = !DILocation(line: 47, column: 25, scope: !173)
!178 = !DILocation(line: 49, column: 8, scope: !179)
!179 = distinct !DILexicalBlock(scope: !173, file: !64, line: 49, column: 8)
!180 = !DILocation(line: 49, column: 8, scope: !173)
!181 = !DILocalVariable(name: "buffer", scope: !182, file: !64, line: 52, type: !184)
!182 = distinct !DILexicalBlock(scope: !183, file: !64, line: 51, column: 9)
!183 = distinct !DILexicalBlock(scope: !179, file: !64, line: 50, column: 5)
!184 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 320, elements: !185)
!185 = !{!186}
!186 = !DISubrange(count: 10)
!187 = !DILocation(line: 52, column: 17, scope: !182)
!188 = !DILocation(line: 55, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !182, file: !64, line: 55, column: 17)
!190 = !DILocation(line: 55, column: 22, scope: !189)
!191 = !DILocation(line: 55, column: 17, scope: !182)
!192 = !DILocation(line: 57, column: 37, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !64, line: 56, column: 13)
!194 = !DILocation(line: 57, column: 30, scope: !193)
!195 = !DILocation(line: 57, column: 17, scope: !193)
!196 = !DILocation(line: 58, column: 13, scope: !193)
!197 = !DILocation(line: 61, column: 17, scope: !198)
!198 = distinct !DILexicalBlock(scope: !189, file: !64, line: 60, column: 13)
!199 = !DILocation(line: 64, column: 5, scope: !183)
!200 = !DILocation(line: 65, column: 1, scope: !173)
!201 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_21_good", scope: !64, file: !64, line: 349, type: !77, scopeLine: 350, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!202 = !DILocation(line: 351, column: 5, scope: !201)
!203 = !DILocation(line: 352, column: 5, scope: !201)
!204 = !DILocation(line: 353, column: 5, scope: !201)
!205 = !DILocation(line: 354, column: 1, scope: !201)
!206 = distinct !DISubprogram(name: "main", scope: !64, file: !64, line: 365, type: !207, scopeLine: 366, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !79)
!207 = !DISubroutineType(types: !208)
!208 = !{!65, !65, !209}
!209 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !210, size: 64)
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!211 = !DILocalVariable(name: "argc", arg: 1, scope: !206, file: !64, line: 365, type: !65)
!212 = !DILocation(line: 365, column: 14, scope: !206)
!213 = !DILocalVariable(name: "argv", arg: 2, scope: !206, file: !64, line: 365, type: !209)
!214 = !DILocation(line: 365, column: 27, scope: !206)
!215 = !DILocation(line: 368, column: 22, scope: !206)
!216 = !DILocation(line: 368, column: 12, scope: !206)
!217 = !DILocation(line: 368, column: 5, scope: !206)
!218 = !DILocation(line: 370, column: 5, scope: !206)
!219 = !DILocation(line: 371, column: 5, scope: !206)
!220 = !DILocation(line: 372, column: 5, scope: !206)
!221 = !DILocation(line: 375, column: 5, scope: !206)
!222 = !DILocation(line: 376, column: 5, scope: !206)
!223 = !DILocation(line: 377, column: 5, scope: !206)
!224 = !DILocation(line: 379, column: 5, scope: !206)
!225 = distinct !DISubprogram(name: "goodB2G1", scope: !64, file: !64, line: 166, type: !77, scopeLine: 167, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!226 = !DILocalVariable(name: "data", scope: !225, file: !64, line: 168, type: !65)
!227 = !DILocation(line: 168, column: 9, scope: !225)
!228 = !DILocation(line: 170, column: 10, scope: !225)
!229 = !DILocalVariable(name: "recvResult", scope: !230, file: !64, line: 176, type: !65)
!230 = distinct !DILexicalBlock(scope: !225, file: !64, line: 171, column: 5)
!231 = !DILocation(line: 176, column: 13, scope: !230)
!232 = !DILocalVariable(name: "service", scope: !230, file: !64, line: 177, type: !87)
!233 = !DILocation(line: 177, column: 28, scope: !230)
!234 = !DILocalVariable(name: "connectSocket", scope: !230, file: !64, line: 178, type: !65)
!235 = !DILocation(line: 178, column: 16, scope: !230)
!236 = !DILocalVariable(name: "inputBuffer", scope: !230, file: !64, line: 179, type: !57)
!237 = !DILocation(line: 179, column: 14, scope: !230)
!238 = !DILocation(line: 180, column: 9, scope: !230)
!239 = !DILocation(line: 190, column: 29, scope: !240)
!240 = distinct !DILexicalBlock(scope: !230, file: !64, line: 181, column: 9)
!241 = !DILocation(line: 190, column: 27, scope: !240)
!242 = !DILocation(line: 191, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !64, line: 191, column: 17)
!244 = !DILocation(line: 191, column: 31, scope: !243)
!245 = !DILocation(line: 191, column: 17, scope: !240)
!246 = !DILocation(line: 193, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !64, line: 192, column: 13)
!248 = !DILocation(line: 195, column: 13, scope: !240)
!249 = !DILocation(line: 196, column: 21, scope: !240)
!250 = !DILocation(line: 196, column: 32, scope: !240)
!251 = !DILocation(line: 197, column: 39, scope: !240)
!252 = !DILocation(line: 197, column: 21, scope: !240)
!253 = !DILocation(line: 197, column: 30, scope: !240)
!254 = !DILocation(line: 197, column: 37, scope: !240)
!255 = !DILocation(line: 198, column: 32, scope: !240)
!256 = !DILocation(line: 198, column: 21, scope: !240)
!257 = !DILocation(line: 198, column: 30, scope: !240)
!258 = !DILocation(line: 199, column: 25, scope: !259)
!259 = distinct !DILexicalBlock(scope: !240, file: !64, line: 199, column: 17)
!260 = !DILocation(line: 199, column: 40, scope: !259)
!261 = !DILocation(line: 199, column: 17, scope: !259)
!262 = !DILocation(line: 199, column: 85, scope: !259)
!263 = !DILocation(line: 199, column: 17, scope: !240)
!264 = !DILocation(line: 201, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !259, file: !64, line: 200, column: 13)
!266 = !DILocation(line: 205, column: 31, scope: !240)
!267 = !DILocation(line: 205, column: 46, scope: !240)
!268 = !DILocation(line: 205, column: 26, scope: !240)
!269 = !DILocation(line: 205, column: 24, scope: !240)
!270 = !DILocation(line: 206, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !240, file: !64, line: 206, column: 17)
!272 = !DILocation(line: 206, column: 28, scope: !271)
!273 = !DILocation(line: 206, column: 44, scope: !271)
!274 = !DILocation(line: 206, column: 47, scope: !271)
!275 = !DILocation(line: 206, column: 58, scope: !271)
!276 = !DILocation(line: 206, column: 17, scope: !240)
!277 = !DILocation(line: 208, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !271, file: !64, line: 207, column: 13)
!279 = !DILocation(line: 211, column: 25, scope: !240)
!280 = !DILocation(line: 211, column: 13, scope: !240)
!281 = !DILocation(line: 211, column: 37, scope: !240)
!282 = !DILocation(line: 213, column: 25, scope: !240)
!283 = !DILocation(line: 213, column: 20, scope: !240)
!284 = !DILocation(line: 213, column: 18, scope: !240)
!285 = !DILocation(line: 214, column: 9, scope: !240)
!286 = !DILocation(line: 216, column: 13, scope: !287)
!287 = distinct !DILexicalBlock(scope: !230, file: !64, line: 216, column: 13)
!288 = !DILocation(line: 216, column: 27, scope: !287)
!289 = !DILocation(line: 216, column: 13, scope: !230)
!290 = !DILocation(line: 218, column: 26, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !64, line: 217, column: 9)
!292 = !DILocation(line: 218, column: 13, scope: !291)
!293 = !DILocation(line: 219, column: 9, scope: !291)
!294 = !DILocation(line: 227, column: 20, scope: !225)
!295 = !DILocation(line: 228, column: 18, scope: !225)
!296 = !DILocation(line: 228, column: 5, scope: !225)
!297 = !DILocation(line: 229, column: 1, scope: !225)
!298 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !64, file: !64, line: 142, type: !174, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!299 = !DILocalVariable(name: "data", arg: 1, scope: !298, file: !64, line: 142, type: !65)
!300 = !DILocation(line: 142, column: 30, scope: !298)
!301 = !DILocation(line: 144, column: 8, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !64, line: 144, column: 8)
!303 = !DILocation(line: 144, column: 8, scope: !298)
!304 = !DILocation(line: 147, column: 9, scope: !305)
!305 = distinct !DILexicalBlock(scope: !302, file: !64, line: 145, column: 5)
!306 = !DILocation(line: 148, column: 5, scope: !305)
!307 = !DILocalVariable(name: "buffer", scope: !308, file: !64, line: 152, type: !184)
!308 = distinct !DILexicalBlock(scope: !309, file: !64, line: 151, column: 9)
!309 = distinct !DILexicalBlock(scope: !302, file: !64, line: 150, column: 5)
!310 = !DILocation(line: 152, column: 17, scope: !308)
!311 = !DILocation(line: 154, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !64, line: 154, column: 17)
!313 = !DILocation(line: 154, column: 22, scope: !312)
!314 = !DILocation(line: 154, column: 27, scope: !312)
!315 = !DILocation(line: 154, column: 30, scope: !312)
!316 = !DILocation(line: 154, column: 35, scope: !312)
!317 = !DILocation(line: 154, column: 17, scope: !308)
!318 = !DILocation(line: 156, column: 37, scope: !319)
!319 = distinct !DILexicalBlock(scope: !312, file: !64, line: 155, column: 13)
!320 = !DILocation(line: 156, column: 30, scope: !319)
!321 = !DILocation(line: 156, column: 17, scope: !319)
!322 = !DILocation(line: 157, column: 13, scope: !319)
!323 = !DILocation(line: 160, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !312, file: !64, line: 159, column: 13)
!325 = !DILocation(line: 164, column: 1, scope: !298)
!326 = distinct !DISubprogram(name: "goodB2G2", scope: !64, file: !64, line: 251, type: !77, scopeLine: 252, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!327 = !DILocalVariable(name: "data", scope: !326, file: !64, line: 253, type: !65)
!328 = !DILocation(line: 253, column: 9, scope: !326)
!329 = !DILocation(line: 255, column: 10, scope: !326)
!330 = !DILocalVariable(name: "recvResult", scope: !331, file: !64, line: 261, type: !65)
!331 = distinct !DILexicalBlock(scope: !326, file: !64, line: 256, column: 5)
!332 = !DILocation(line: 261, column: 13, scope: !331)
!333 = !DILocalVariable(name: "service", scope: !331, file: !64, line: 262, type: !87)
!334 = !DILocation(line: 262, column: 28, scope: !331)
!335 = !DILocalVariable(name: "connectSocket", scope: !331, file: !64, line: 263, type: !65)
!336 = !DILocation(line: 263, column: 16, scope: !331)
!337 = !DILocalVariable(name: "inputBuffer", scope: !331, file: !64, line: 264, type: !57)
!338 = !DILocation(line: 264, column: 14, scope: !331)
!339 = !DILocation(line: 265, column: 9, scope: !331)
!340 = !DILocation(line: 275, column: 29, scope: !341)
!341 = distinct !DILexicalBlock(scope: !331, file: !64, line: 266, column: 9)
!342 = !DILocation(line: 275, column: 27, scope: !341)
!343 = !DILocation(line: 276, column: 17, scope: !344)
!344 = distinct !DILexicalBlock(scope: !341, file: !64, line: 276, column: 17)
!345 = !DILocation(line: 276, column: 31, scope: !344)
!346 = !DILocation(line: 276, column: 17, scope: !341)
!347 = !DILocation(line: 278, column: 17, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !64, line: 277, column: 13)
!349 = !DILocation(line: 280, column: 13, scope: !341)
!350 = !DILocation(line: 281, column: 21, scope: !341)
!351 = !DILocation(line: 281, column: 32, scope: !341)
!352 = !DILocation(line: 282, column: 39, scope: !341)
!353 = !DILocation(line: 282, column: 21, scope: !341)
!354 = !DILocation(line: 282, column: 30, scope: !341)
!355 = !DILocation(line: 282, column: 37, scope: !341)
!356 = !DILocation(line: 283, column: 32, scope: !341)
!357 = !DILocation(line: 283, column: 21, scope: !341)
!358 = !DILocation(line: 283, column: 30, scope: !341)
!359 = !DILocation(line: 284, column: 25, scope: !360)
!360 = distinct !DILexicalBlock(scope: !341, file: !64, line: 284, column: 17)
!361 = !DILocation(line: 284, column: 40, scope: !360)
!362 = !DILocation(line: 284, column: 17, scope: !360)
!363 = !DILocation(line: 284, column: 85, scope: !360)
!364 = !DILocation(line: 284, column: 17, scope: !341)
!365 = !DILocation(line: 286, column: 17, scope: !366)
!366 = distinct !DILexicalBlock(scope: !360, file: !64, line: 285, column: 13)
!367 = !DILocation(line: 290, column: 31, scope: !341)
!368 = !DILocation(line: 290, column: 46, scope: !341)
!369 = !DILocation(line: 290, column: 26, scope: !341)
!370 = !DILocation(line: 290, column: 24, scope: !341)
!371 = !DILocation(line: 291, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !341, file: !64, line: 291, column: 17)
!373 = !DILocation(line: 291, column: 28, scope: !372)
!374 = !DILocation(line: 291, column: 44, scope: !372)
!375 = !DILocation(line: 291, column: 47, scope: !372)
!376 = !DILocation(line: 291, column: 58, scope: !372)
!377 = !DILocation(line: 291, column: 17, scope: !341)
!378 = !DILocation(line: 293, column: 17, scope: !379)
!379 = distinct !DILexicalBlock(scope: !372, file: !64, line: 292, column: 13)
!380 = !DILocation(line: 296, column: 25, scope: !341)
!381 = !DILocation(line: 296, column: 13, scope: !341)
!382 = !DILocation(line: 296, column: 37, scope: !341)
!383 = !DILocation(line: 298, column: 25, scope: !341)
!384 = !DILocation(line: 298, column: 20, scope: !341)
!385 = !DILocation(line: 298, column: 18, scope: !341)
!386 = !DILocation(line: 299, column: 9, scope: !341)
!387 = !DILocation(line: 301, column: 13, scope: !388)
!388 = distinct !DILexicalBlock(scope: !331, file: !64, line: 301, column: 13)
!389 = !DILocation(line: 301, column: 27, scope: !388)
!390 = !DILocation(line: 301, column: 13, scope: !331)
!391 = !DILocation(line: 303, column: 26, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !64, line: 302, column: 9)
!393 = !DILocation(line: 303, column: 13, scope: !392)
!394 = !DILocation(line: 304, column: 9, scope: !392)
!395 = !DILocation(line: 312, column: 20, scope: !326)
!396 = !DILocation(line: 313, column: 18, scope: !326)
!397 = !DILocation(line: 313, column: 5, scope: !326)
!398 = !DILocation(line: 314, column: 1, scope: !326)
!399 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !64, file: !64, line: 232, type: !174, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!400 = !DILocalVariable(name: "data", arg: 1, scope: !399, file: !64, line: 232, type: !65)
!401 = !DILocation(line: 232, column: 30, scope: !399)
!402 = !DILocation(line: 234, column: 8, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !64, line: 234, column: 8)
!404 = !DILocation(line: 234, column: 8, scope: !399)
!405 = !DILocalVariable(name: "buffer", scope: !406, file: !64, line: 237, type: !184)
!406 = distinct !DILexicalBlock(scope: !407, file: !64, line: 236, column: 9)
!407 = distinct !DILexicalBlock(scope: !403, file: !64, line: 235, column: 5)
!408 = !DILocation(line: 237, column: 17, scope: !406)
!409 = !DILocation(line: 239, column: 17, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !64, line: 239, column: 17)
!411 = !DILocation(line: 239, column: 22, scope: !410)
!412 = !DILocation(line: 239, column: 27, scope: !410)
!413 = !DILocation(line: 239, column: 30, scope: !410)
!414 = !DILocation(line: 239, column: 35, scope: !410)
!415 = !DILocation(line: 239, column: 17, scope: !406)
!416 = !DILocation(line: 241, column: 37, scope: !417)
!417 = distinct !DILexicalBlock(scope: !410, file: !64, line: 240, column: 13)
!418 = !DILocation(line: 241, column: 30, scope: !417)
!419 = !DILocation(line: 241, column: 17, scope: !417)
!420 = !DILocation(line: 242, column: 13, scope: !417)
!421 = !DILocation(line: 245, column: 17, scope: !422)
!422 = distinct !DILexicalBlock(scope: !410, file: !64, line: 244, column: 13)
!423 = !DILocation(line: 248, column: 5, scope: !407)
!424 = !DILocation(line: 249, column: 1, scope: !399)
!425 = distinct !DISubprogram(name: "goodG2B", scope: !64, file: !64, line: 337, type: !77, scopeLine: 338, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!426 = !DILocalVariable(name: "data", scope: !425, file: !64, line: 339, type: !65)
!427 = !DILocation(line: 339, column: 9, scope: !425)
!428 = !DILocation(line: 341, column: 10, scope: !425)
!429 = !DILocation(line: 344, column: 10, scope: !425)
!430 = !DILocation(line: 345, column: 19, scope: !425)
!431 = !DILocation(line: 346, column: 17, scope: !425)
!432 = !DILocation(line: 346, column: 5, scope: !425)
!433 = !DILocation(line: 347, column: 1, scope: !425)
!434 = distinct !DISubprogram(name: "goodG2BSink", scope: !64, file: !64, line: 317, type: !174, scopeLine: 318, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !79)
!435 = !DILocalVariable(name: "data", arg: 1, scope: !434, file: !64, line: 317, type: !65)
!436 = !DILocation(line: 317, column: 29, scope: !434)
!437 = !DILocation(line: 319, column: 8, scope: !438)
!438 = distinct !DILexicalBlock(scope: !434, file: !64, line: 319, column: 8)
!439 = !DILocation(line: 319, column: 8, scope: !434)
!440 = !DILocalVariable(name: "buffer", scope: !441, file: !64, line: 322, type: !184)
!441 = distinct !DILexicalBlock(scope: !442, file: !64, line: 321, column: 9)
!442 = distinct !DILexicalBlock(scope: !438, file: !64, line: 320, column: 5)
!443 = !DILocation(line: 322, column: 17, scope: !441)
!444 = !DILocation(line: 325, column: 17, scope: !445)
!445 = distinct !DILexicalBlock(scope: !441, file: !64, line: 325, column: 17)
!446 = !DILocation(line: 325, column: 22, scope: !445)
!447 = !DILocation(line: 325, column: 17, scope: !441)
!448 = !DILocation(line: 327, column: 37, scope: !449)
!449 = distinct !DILexicalBlock(scope: !445, file: !64, line: 326, column: 13)
!450 = !DILocation(line: 327, column: 30, scope: !449)
!451 = !DILocation(line: 327, column: 17, scope: !449)
!452 = !DILocation(line: 328, column: 13, scope: !449)
!453 = !DILocation(line: 331, column: 17, scope: !454)
!454 = distinct !DILexicalBlock(scope: !445, file: !64, line: 330, column: 13)
!455 = !DILocation(line: 334, column: 5, scope: !442)
!456 = !DILocation(line: 335, column: 1, scope: !434)
