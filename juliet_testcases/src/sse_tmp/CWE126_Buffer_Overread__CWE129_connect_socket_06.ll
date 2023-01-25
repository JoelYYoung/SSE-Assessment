; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_06.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_06_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !74, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !79, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %connectSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  br label %do.body, !dbg !106

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !107
  store i32 %call, i32* %connectSocket, align 4, !dbg !109
  %0 = load i32, i32* %connectSocket, align 4, !dbg !110
  %cmp = icmp eq i32 %0, -1, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !114

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !116
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !117
  store i16 2, i16* %sin_family, align 4, !dbg !118
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !119
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !120
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !121
  store i32 %call1, i32* %s_addr, align 4, !dbg !122
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !123
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !124
  store i16 %call2, i16* %sin_port, align 2, !dbg !125
  %2 = load i32, i32* %connectSocket, align 4, !dbg !126
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !128
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !129
  %cmp4 = icmp eq i32 %call3, -1, !dbg !130
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !131

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !132

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !134
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !135
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !136
  %conv = trunc i64 %call7 to i32, !dbg !136
  store i32 %conv, i32* %recvResult, align 4, !dbg !137
  %5 = load i32, i32* %recvResult, align 4, !dbg !138
  %cmp8 = icmp eq i32 %5, -1, !dbg !140
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !141

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !142
  %cmp10 = icmp eq i32 %6, 0, !dbg !143
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !144

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !145

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !147
  %idxprom = sext i32 %7 to i64, !dbg !148
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !150
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !151
  store i32 %call15, i32* %data, align 4, !dbg !152
  br label %do.end, !dbg !153

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !154
  %cmp16 = icmp ne i32 %8, -1, !dbg !156
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !157

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !158
  %call19 = call i32 @close(i32 %9), !dbg !160
  br label %if.end20, !dbg !161

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !162, metadata !DIExpression()), !dbg !169
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !169
  %11 = load i32, i32* %data, align 4, !dbg !170
  %cmp21 = icmp sge i32 %11, 0, !dbg !172
  br i1 %cmp21, label %if.then23, label %if.else, !dbg !173

if.then23:                                        ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !174
  %idxprom24 = sext i32 %12 to i64, !dbg !176
  %arrayidx25 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom24, !dbg !176
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !176
  call void @printIntLine(i32 %13), !dbg !177
  br label %if.end26, !dbg !178

if.else:                                          ; preds = %if.end20
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !179
  br label %if.end26

if.end26:                                         ; preds = %if.else, %if.then23
  ret void, !dbg !181
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_06_good() #0 !dbg !182 {
entry:
  call void @goodB2G1(), !dbg !183
  call void @goodB2G2(), !dbg !184
  call void @goodG2B1(), !dbg !185
  call void @goodG2B2(), !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !188 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !193, metadata !DIExpression()), !dbg !194
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !195, metadata !DIExpression()), !dbg !196
  %call = call i64 @time(i64* null) #7, !dbg !197
  %conv = trunc i64 %call to i32, !dbg !198
  call void @srand(i32 %conv) #7, !dbg !199
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !200
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_06_good(), !dbg !201
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !202
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !203
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_06_bad(), !dbg !204
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !205
  ret i32 0, !dbg !206
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !207 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !208, metadata !DIExpression()), !dbg !209
  store i32 -1, i32* %data, align 4, !dbg !210
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !211, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 -1, i32* %connectSocket, align 4, !dbg !219
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !220, metadata !DIExpression()), !dbg !221
  br label %do.body, !dbg !222

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !223
  store i32 %call, i32* %connectSocket, align 4, !dbg !225
  %0 = load i32, i32* %connectSocket, align 4, !dbg !226
  %cmp = icmp eq i32 %0, -1, !dbg !228
  br i1 %cmp, label %if.then, label %if.end, !dbg !229

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !230

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !232
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !232
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !233
  store i16 2, i16* %sin_family, align 4, !dbg !234
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !235
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !236
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !237
  store i32 %call1, i32* %s_addr, align 4, !dbg !238
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !239
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !240
  store i16 %call2, i16* %sin_port, align 2, !dbg !241
  %2 = load i32, i32* %connectSocket, align 4, !dbg !242
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !244
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !245
  %cmp4 = icmp eq i32 %call3, -1, !dbg !246
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !247

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !248

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !250
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !251
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !252
  %conv = trunc i64 %call7 to i32, !dbg !252
  store i32 %conv, i32* %recvResult, align 4, !dbg !253
  %5 = load i32, i32* %recvResult, align 4, !dbg !254
  %cmp8 = icmp eq i32 %5, -1, !dbg !256
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !257

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !258
  %cmp10 = icmp eq i32 %6, 0, !dbg !259
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !260

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !261

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !263
  %idxprom = sext i32 %7 to i64, !dbg !264
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !264
  store i8 0, i8* %arrayidx, align 1, !dbg !265
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !266
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !267
  store i32 %call15, i32* %data, align 4, !dbg !268
  br label %do.end, !dbg !269

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !270
  %cmp16 = icmp ne i32 %8, -1, !dbg !272
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !273

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !274
  %call19 = call i32 @close(i32 %9), !dbg !276
  br label %if.end20, !dbg !277

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !278, metadata !DIExpression()), !dbg !282
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !282
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !282
  %11 = load i32, i32* %data, align 4, !dbg !283
  %cmp21 = icmp sge i32 %11, 0, !dbg !285
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !286

land.lhs.true:                                    ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !287
  %cmp23 = icmp slt i32 %12, 10, !dbg !288
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !289

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !290
  %idxprom26 = sext i32 %13 to i64, !dbg !292
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !292
  %14 = load i32, i32* %arrayidx27, align 4, !dbg !292
  call void @printIntLine(i32 %14), !dbg !293
  br label %if.end28, !dbg !294

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !295
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  ret void, !dbg !297
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !298 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !299, metadata !DIExpression()), !dbg !300
  store i32 -1, i32* %data, align 4, !dbg !301
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !302, metadata !DIExpression()), !dbg !306
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !307, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !309, metadata !DIExpression()), !dbg !310
  store i32 -1, i32* %connectSocket, align 4, !dbg !310
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !311, metadata !DIExpression()), !dbg !312
  br label %do.body, !dbg !313

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !314
  store i32 %call, i32* %connectSocket, align 4, !dbg !316
  %0 = load i32, i32* %connectSocket, align 4, !dbg !317
  %cmp = icmp eq i32 %0, -1, !dbg !319
  br i1 %cmp, label %if.then, label %if.end, !dbg !320

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !321

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !323
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !323
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !324
  store i16 2, i16* %sin_family, align 4, !dbg !325
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !326
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !327
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !328
  store i32 %call1, i32* %s_addr, align 4, !dbg !329
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !330
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !331
  store i16 %call2, i16* %sin_port, align 2, !dbg !332
  %2 = load i32, i32* %connectSocket, align 4, !dbg !333
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !335
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !336
  %cmp4 = icmp eq i32 %call3, -1, !dbg !337
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !338

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !339

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !341
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !342
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !343
  %conv = trunc i64 %call7 to i32, !dbg !343
  store i32 %conv, i32* %recvResult, align 4, !dbg !344
  %5 = load i32, i32* %recvResult, align 4, !dbg !345
  %cmp8 = icmp eq i32 %5, -1, !dbg !347
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !348

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !349
  %cmp10 = icmp eq i32 %6, 0, !dbg !350
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !351

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !352

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !354
  %idxprom = sext i32 %7 to i64, !dbg !355
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !355
  store i8 0, i8* %arrayidx, align 1, !dbg !356
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !357
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !358
  store i32 %call15, i32* %data, align 4, !dbg !359
  br label %do.end, !dbg !360

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !361
  %cmp16 = icmp ne i32 %8, -1, !dbg !363
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !364

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !365
  %call19 = call i32 @close(i32 %9), !dbg !367
  br label %if.end20, !dbg !368

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !369, metadata !DIExpression()), !dbg !373
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !373
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !373
  %11 = load i32, i32* %data, align 4, !dbg !374
  %cmp21 = icmp sge i32 %11, 0, !dbg !376
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !377

land.lhs.true:                                    ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !378
  %cmp23 = icmp slt i32 %12, 10, !dbg !379
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !380

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !381
  %idxprom26 = sext i32 %13 to i64, !dbg !383
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !383
  %14 = load i32, i32* %arrayidx27, align 4, !dbg !383
  call void @printIntLine(i32 %14), !dbg !384
  br label %if.end28, !dbg !385

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !386
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  ret void, !dbg !388
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !389 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !390, metadata !DIExpression()), !dbg !391
  store i32 -1, i32* %data, align 4, !dbg !392
  store i32 7, i32* %data, align 4, !dbg !393
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !396, metadata !DIExpression()), !dbg !400
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !400
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !400
  %1 = load i32, i32* %data, align 4, !dbg !401
  %cmp = icmp sge i32 %1, 0, !dbg !403
  br i1 %cmp, label %if.then, label %if.else, !dbg !404

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !405
  %idxprom = sext i32 %2 to i64, !dbg !407
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !407
  %3 = load i32, i32* %arrayidx, align 4, !dbg !407
  call void @printIntLine(i32 %3), !dbg !408
  br label %if.end, !dbg !409

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !410
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !412
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !413 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !414, metadata !DIExpression()), !dbg !415
  store i32 -1, i32* %data, align 4, !dbg !416
  store i32 7, i32* %data, align 4, !dbg !417
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !420, metadata !DIExpression()), !dbg !424
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !424
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !424
  %1 = load i32, i32* %data, align 4, !dbg !425
  %cmp = icmp sge i32 %1, 0, !dbg !427
  br i1 %cmp, label %if.then, label %if.else, !dbg !428

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !429
  %idxprom = sext i32 %2 to i64, !dbg !431
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !431
  %3 = load i32, i32* %arrayidx, align 4, !dbg !431
  call void @printIntLine(i32 %3), !dbg !432
  br label %if.end, !dbg !433

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !434
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !436
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_06_bad", scope: !66, file: !66, line: 49, type: !67, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_06.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 51, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 51, column: 9, scope: !65)
!73 = !DILocation(line: 53, column: 10, scope: !65)
!74 = !DILocalVariable(name: "recvResult", scope: !75, file: !66, line: 61, type: !71)
!75 = distinct !DILexicalBlock(scope: !76, file: !66, line: 56, column: 9)
!76 = distinct !DILexicalBlock(scope: !77, file: !66, line: 55, column: 5)
!77 = distinct !DILexicalBlock(scope: !65, file: !66, line: 54, column: 8)
!78 = !DILocation(line: 61, column: 17, scope: !75)
!79 = !DILocalVariable(name: "service", scope: !75, file: !66, line: 62, type: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !81)
!81 = !{!82, !83, !89, !96}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !80, file: !17, line: 240, baseType: !51, size: 16)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !80, file: !17, line: 241, baseType: !84, size: 16, offset: 16)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !86, line: 25, baseType: !87)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !88, line: 40, baseType: !53)
!88 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !80, file: !17, line: 242, baseType: !90, size: 32, offset: 32)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !91)
!91 = !{!92}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !90, file: !17, line: 33, baseType: !93, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !86, line: 26, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !88, line: 42, baseType: !5)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !80, file: !17, line: 245, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 62, column: 32, scope: !75)
!102 = !DILocalVariable(name: "connectSocket", scope: !75, file: !66, line: 63, type: !71)
!103 = !DILocation(line: 63, column: 20, scope: !75)
!104 = !DILocalVariable(name: "inputBuffer", scope: !75, file: !66, line: 64, type: !55)
!105 = !DILocation(line: 64, column: 18, scope: !75)
!106 = !DILocation(line: 65, column: 13, scope: !75)
!107 = !DILocation(line: 75, column: 33, scope: !108)
!108 = distinct !DILexicalBlock(scope: !75, file: !66, line: 66, column: 13)
!109 = !DILocation(line: 75, column: 31, scope: !108)
!110 = !DILocation(line: 76, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !66, line: 76, column: 21)
!112 = !DILocation(line: 76, column: 35, scope: !111)
!113 = !DILocation(line: 76, column: 21, scope: !108)
!114 = !DILocation(line: 78, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !66, line: 77, column: 17)
!116 = !DILocation(line: 80, column: 17, scope: !108)
!117 = !DILocation(line: 81, column: 25, scope: !108)
!118 = !DILocation(line: 81, column: 36, scope: !108)
!119 = !DILocation(line: 82, column: 43, scope: !108)
!120 = !DILocation(line: 82, column: 25, scope: !108)
!121 = !DILocation(line: 82, column: 34, scope: !108)
!122 = !DILocation(line: 82, column: 41, scope: !108)
!123 = !DILocation(line: 83, column: 36, scope: !108)
!124 = !DILocation(line: 83, column: 25, scope: !108)
!125 = !DILocation(line: 83, column: 34, scope: !108)
!126 = !DILocation(line: 84, column: 29, scope: !127)
!127 = distinct !DILexicalBlock(scope: !108, file: !66, line: 84, column: 21)
!128 = !DILocation(line: 84, column: 44, scope: !127)
!129 = !DILocation(line: 84, column: 21, scope: !127)
!130 = !DILocation(line: 84, column: 89, scope: !127)
!131 = !DILocation(line: 84, column: 21, scope: !108)
!132 = !DILocation(line: 86, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !66, line: 85, column: 17)
!134 = !DILocation(line: 90, column: 35, scope: !108)
!135 = !DILocation(line: 90, column: 50, scope: !108)
!136 = !DILocation(line: 90, column: 30, scope: !108)
!137 = !DILocation(line: 90, column: 28, scope: !108)
!138 = !DILocation(line: 91, column: 21, scope: !139)
!139 = distinct !DILexicalBlock(scope: !108, file: !66, line: 91, column: 21)
!140 = !DILocation(line: 91, column: 32, scope: !139)
!141 = !DILocation(line: 91, column: 48, scope: !139)
!142 = !DILocation(line: 91, column: 51, scope: !139)
!143 = !DILocation(line: 91, column: 62, scope: !139)
!144 = !DILocation(line: 91, column: 21, scope: !108)
!145 = !DILocation(line: 93, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !139, file: !66, line: 92, column: 17)
!147 = !DILocation(line: 96, column: 29, scope: !108)
!148 = !DILocation(line: 96, column: 17, scope: !108)
!149 = !DILocation(line: 96, column: 41, scope: !108)
!150 = !DILocation(line: 98, column: 29, scope: !108)
!151 = !DILocation(line: 98, column: 24, scope: !108)
!152 = !DILocation(line: 98, column: 22, scope: !108)
!153 = !DILocation(line: 99, column: 13, scope: !108)
!154 = !DILocation(line: 101, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !75, file: !66, line: 101, column: 17)
!156 = !DILocation(line: 101, column: 31, scope: !155)
!157 = !DILocation(line: 101, column: 17, scope: !75)
!158 = !DILocation(line: 103, column: 30, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !66, line: 102, column: 13)
!160 = !DILocation(line: 103, column: 17, scope: !159)
!161 = !DILocation(line: 104, column: 13, scope: !159)
!162 = !DILocalVariable(name: "buffer", scope: !163, file: !66, line: 116, type: !166)
!163 = distinct !DILexicalBlock(scope: !164, file: !66, line: 115, column: 9)
!164 = distinct !DILexicalBlock(scope: !165, file: !66, line: 114, column: 5)
!165 = distinct !DILexicalBlock(scope: !65, file: !66, line: 113, column: 8)
!166 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !167)
!167 = !{!168}
!168 = !DISubrange(count: 10)
!169 = !DILocation(line: 116, column: 17, scope: !163)
!170 = !DILocation(line: 119, column: 17, scope: !171)
!171 = distinct !DILexicalBlock(scope: !163, file: !66, line: 119, column: 17)
!172 = !DILocation(line: 119, column: 22, scope: !171)
!173 = !DILocation(line: 119, column: 17, scope: !163)
!174 = !DILocation(line: 121, column: 37, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !66, line: 120, column: 13)
!176 = !DILocation(line: 121, column: 30, scope: !175)
!177 = !DILocation(line: 121, column: 17, scope: !175)
!178 = !DILocation(line: 122, column: 13, scope: !175)
!179 = !DILocation(line: 125, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !171, file: !66, line: 124, column: 13)
!181 = !DILocation(line: 129, column: 1, scope: !65)
!182 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_06_good", scope: !66, file: !66, line: 369, type: !67, scopeLine: 370, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!183 = !DILocation(line: 371, column: 5, scope: !182)
!184 = !DILocation(line: 372, column: 5, scope: !182)
!185 = !DILocation(line: 373, column: 5, scope: !182)
!186 = !DILocation(line: 374, column: 5, scope: !182)
!187 = !DILocation(line: 375, column: 1, scope: !182)
!188 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 386, type: !189, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!189 = !DISubroutineType(types: !190)
!190 = !{!71, !71, !191}
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!193 = !DILocalVariable(name: "argc", arg: 1, scope: !188, file: !66, line: 386, type: !71)
!194 = !DILocation(line: 386, column: 14, scope: !188)
!195 = !DILocalVariable(name: "argv", arg: 2, scope: !188, file: !66, line: 386, type: !191)
!196 = !DILocation(line: 386, column: 27, scope: !188)
!197 = !DILocation(line: 389, column: 22, scope: !188)
!198 = !DILocation(line: 389, column: 12, scope: !188)
!199 = !DILocation(line: 389, column: 5, scope: !188)
!200 = !DILocation(line: 391, column: 5, scope: !188)
!201 = !DILocation(line: 392, column: 5, scope: !188)
!202 = !DILocation(line: 393, column: 5, scope: !188)
!203 = !DILocation(line: 396, column: 5, scope: !188)
!204 = !DILocation(line: 397, column: 5, scope: !188)
!205 = !DILocation(line: 398, column: 5, scope: !188)
!206 = !DILocation(line: 400, column: 5, scope: !188)
!207 = distinct !DISubprogram(name: "goodB2G1", scope: !66, file: !66, line: 136, type: !67, scopeLine: 137, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!208 = !DILocalVariable(name: "data", scope: !207, file: !66, line: 138, type: !71)
!209 = !DILocation(line: 138, column: 9, scope: !207)
!210 = !DILocation(line: 140, column: 10, scope: !207)
!211 = !DILocalVariable(name: "recvResult", scope: !212, file: !66, line: 148, type: !71)
!212 = distinct !DILexicalBlock(scope: !213, file: !66, line: 143, column: 9)
!213 = distinct !DILexicalBlock(scope: !214, file: !66, line: 142, column: 5)
!214 = distinct !DILexicalBlock(scope: !207, file: !66, line: 141, column: 8)
!215 = !DILocation(line: 148, column: 17, scope: !212)
!216 = !DILocalVariable(name: "service", scope: !212, file: !66, line: 149, type: !80)
!217 = !DILocation(line: 149, column: 32, scope: !212)
!218 = !DILocalVariable(name: "connectSocket", scope: !212, file: !66, line: 150, type: !71)
!219 = !DILocation(line: 150, column: 20, scope: !212)
!220 = !DILocalVariable(name: "inputBuffer", scope: !212, file: !66, line: 151, type: !55)
!221 = !DILocation(line: 151, column: 18, scope: !212)
!222 = !DILocation(line: 152, column: 13, scope: !212)
!223 = !DILocation(line: 162, column: 33, scope: !224)
!224 = distinct !DILexicalBlock(scope: !212, file: !66, line: 153, column: 13)
!225 = !DILocation(line: 162, column: 31, scope: !224)
!226 = !DILocation(line: 163, column: 21, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !66, line: 163, column: 21)
!228 = !DILocation(line: 163, column: 35, scope: !227)
!229 = !DILocation(line: 163, column: 21, scope: !224)
!230 = !DILocation(line: 165, column: 21, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !66, line: 164, column: 17)
!232 = !DILocation(line: 167, column: 17, scope: !224)
!233 = !DILocation(line: 168, column: 25, scope: !224)
!234 = !DILocation(line: 168, column: 36, scope: !224)
!235 = !DILocation(line: 169, column: 43, scope: !224)
!236 = !DILocation(line: 169, column: 25, scope: !224)
!237 = !DILocation(line: 169, column: 34, scope: !224)
!238 = !DILocation(line: 169, column: 41, scope: !224)
!239 = !DILocation(line: 170, column: 36, scope: !224)
!240 = !DILocation(line: 170, column: 25, scope: !224)
!241 = !DILocation(line: 170, column: 34, scope: !224)
!242 = !DILocation(line: 171, column: 29, scope: !243)
!243 = distinct !DILexicalBlock(scope: !224, file: !66, line: 171, column: 21)
!244 = !DILocation(line: 171, column: 44, scope: !243)
!245 = !DILocation(line: 171, column: 21, scope: !243)
!246 = !DILocation(line: 171, column: 89, scope: !243)
!247 = !DILocation(line: 171, column: 21, scope: !224)
!248 = !DILocation(line: 173, column: 21, scope: !249)
!249 = distinct !DILexicalBlock(scope: !243, file: !66, line: 172, column: 17)
!250 = !DILocation(line: 177, column: 35, scope: !224)
!251 = !DILocation(line: 177, column: 50, scope: !224)
!252 = !DILocation(line: 177, column: 30, scope: !224)
!253 = !DILocation(line: 177, column: 28, scope: !224)
!254 = !DILocation(line: 178, column: 21, scope: !255)
!255 = distinct !DILexicalBlock(scope: !224, file: !66, line: 178, column: 21)
!256 = !DILocation(line: 178, column: 32, scope: !255)
!257 = !DILocation(line: 178, column: 48, scope: !255)
!258 = !DILocation(line: 178, column: 51, scope: !255)
!259 = !DILocation(line: 178, column: 62, scope: !255)
!260 = !DILocation(line: 178, column: 21, scope: !224)
!261 = !DILocation(line: 180, column: 21, scope: !262)
!262 = distinct !DILexicalBlock(scope: !255, file: !66, line: 179, column: 17)
!263 = !DILocation(line: 183, column: 29, scope: !224)
!264 = !DILocation(line: 183, column: 17, scope: !224)
!265 = !DILocation(line: 183, column: 41, scope: !224)
!266 = !DILocation(line: 185, column: 29, scope: !224)
!267 = !DILocation(line: 185, column: 24, scope: !224)
!268 = !DILocation(line: 185, column: 22, scope: !224)
!269 = !DILocation(line: 186, column: 13, scope: !224)
!270 = !DILocation(line: 188, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !212, file: !66, line: 188, column: 17)
!272 = !DILocation(line: 188, column: 31, scope: !271)
!273 = !DILocation(line: 188, column: 17, scope: !212)
!274 = !DILocation(line: 190, column: 30, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !66, line: 189, column: 13)
!276 = !DILocation(line: 190, column: 17, scope: !275)
!277 = !DILocation(line: 191, column: 13, scope: !275)
!278 = !DILocalVariable(name: "buffer", scope: !279, file: !66, line: 208, type: !166)
!279 = distinct !DILexicalBlock(scope: !280, file: !66, line: 207, column: 9)
!280 = distinct !DILexicalBlock(scope: !281, file: !66, line: 206, column: 5)
!281 = distinct !DILexicalBlock(scope: !207, file: !66, line: 200, column: 8)
!282 = !DILocation(line: 208, column: 17, scope: !279)
!283 = !DILocation(line: 210, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !279, file: !66, line: 210, column: 17)
!285 = !DILocation(line: 210, column: 22, scope: !284)
!286 = !DILocation(line: 210, column: 27, scope: !284)
!287 = !DILocation(line: 210, column: 30, scope: !284)
!288 = !DILocation(line: 210, column: 35, scope: !284)
!289 = !DILocation(line: 210, column: 17, scope: !279)
!290 = !DILocation(line: 212, column: 37, scope: !291)
!291 = distinct !DILexicalBlock(scope: !284, file: !66, line: 211, column: 13)
!292 = !DILocation(line: 212, column: 30, scope: !291)
!293 = !DILocation(line: 212, column: 17, scope: !291)
!294 = !DILocation(line: 213, column: 13, scope: !291)
!295 = !DILocation(line: 216, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !284, file: !66, line: 215, column: 13)
!297 = !DILocation(line: 220, column: 1, scope: !207)
!298 = distinct !DISubprogram(name: "goodB2G2", scope: !66, file: !66, line: 223, type: !67, scopeLine: 224, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!299 = !DILocalVariable(name: "data", scope: !298, file: !66, line: 225, type: !71)
!300 = !DILocation(line: 225, column: 9, scope: !298)
!301 = !DILocation(line: 227, column: 10, scope: !298)
!302 = !DILocalVariable(name: "recvResult", scope: !303, file: !66, line: 235, type: !71)
!303 = distinct !DILexicalBlock(scope: !304, file: !66, line: 230, column: 9)
!304 = distinct !DILexicalBlock(scope: !305, file: !66, line: 229, column: 5)
!305 = distinct !DILexicalBlock(scope: !298, file: !66, line: 228, column: 8)
!306 = !DILocation(line: 235, column: 17, scope: !303)
!307 = !DILocalVariable(name: "service", scope: !303, file: !66, line: 236, type: !80)
!308 = !DILocation(line: 236, column: 32, scope: !303)
!309 = !DILocalVariable(name: "connectSocket", scope: !303, file: !66, line: 237, type: !71)
!310 = !DILocation(line: 237, column: 20, scope: !303)
!311 = !DILocalVariable(name: "inputBuffer", scope: !303, file: !66, line: 238, type: !55)
!312 = !DILocation(line: 238, column: 18, scope: !303)
!313 = !DILocation(line: 239, column: 13, scope: !303)
!314 = !DILocation(line: 249, column: 33, scope: !315)
!315 = distinct !DILexicalBlock(scope: !303, file: !66, line: 240, column: 13)
!316 = !DILocation(line: 249, column: 31, scope: !315)
!317 = !DILocation(line: 250, column: 21, scope: !318)
!318 = distinct !DILexicalBlock(scope: !315, file: !66, line: 250, column: 21)
!319 = !DILocation(line: 250, column: 35, scope: !318)
!320 = !DILocation(line: 250, column: 21, scope: !315)
!321 = !DILocation(line: 252, column: 21, scope: !322)
!322 = distinct !DILexicalBlock(scope: !318, file: !66, line: 251, column: 17)
!323 = !DILocation(line: 254, column: 17, scope: !315)
!324 = !DILocation(line: 255, column: 25, scope: !315)
!325 = !DILocation(line: 255, column: 36, scope: !315)
!326 = !DILocation(line: 256, column: 43, scope: !315)
!327 = !DILocation(line: 256, column: 25, scope: !315)
!328 = !DILocation(line: 256, column: 34, scope: !315)
!329 = !DILocation(line: 256, column: 41, scope: !315)
!330 = !DILocation(line: 257, column: 36, scope: !315)
!331 = !DILocation(line: 257, column: 25, scope: !315)
!332 = !DILocation(line: 257, column: 34, scope: !315)
!333 = !DILocation(line: 258, column: 29, scope: !334)
!334 = distinct !DILexicalBlock(scope: !315, file: !66, line: 258, column: 21)
!335 = !DILocation(line: 258, column: 44, scope: !334)
!336 = !DILocation(line: 258, column: 21, scope: !334)
!337 = !DILocation(line: 258, column: 89, scope: !334)
!338 = !DILocation(line: 258, column: 21, scope: !315)
!339 = !DILocation(line: 260, column: 21, scope: !340)
!340 = distinct !DILexicalBlock(scope: !334, file: !66, line: 259, column: 17)
!341 = !DILocation(line: 264, column: 35, scope: !315)
!342 = !DILocation(line: 264, column: 50, scope: !315)
!343 = !DILocation(line: 264, column: 30, scope: !315)
!344 = !DILocation(line: 264, column: 28, scope: !315)
!345 = !DILocation(line: 265, column: 21, scope: !346)
!346 = distinct !DILexicalBlock(scope: !315, file: !66, line: 265, column: 21)
!347 = !DILocation(line: 265, column: 32, scope: !346)
!348 = !DILocation(line: 265, column: 48, scope: !346)
!349 = !DILocation(line: 265, column: 51, scope: !346)
!350 = !DILocation(line: 265, column: 62, scope: !346)
!351 = !DILocation(line: 265, column: 21, scope: !315)
!352 = !DILocation(line: 267, column: 21, scope: !353)
!353 = distinct !DILexicalBlock(scope: !346, file: !66, line: 266, column: 17)
!354 = !DILocation(line: 270, column: 29, scope: !315)
!355 = !DILocation(line: 270, column: 17, scope: !315)
!356 = !DILocation(line: 270, column: 41, scope: !315)
!357 = !DILocation(line: 272, column: 29, scope: !315)
!358 = !DILocation(line: 272, column: 24, scope: !315)
!359 = !DILocation(line: 272, column: 22, scope: !315)
!360 = !DILocation(line: 273, column: 13, scope: !315)
!361 = !DILocation(line: 275, column: 17, scope: !362)
!362 = distinct !DILexicalBlock(scope: !303, file: !66, line: 275, column: 17)
!363 = !DILocation(line: 275, column: 31, scope: !362)
!364 = !DILocation(line: 275, column: 17, scope: !303)
!365 = !DILocation(line: 277, column: 30, scope: !366)
!366 = distinct !DILexicalBlock(scope: !362, file: !66, line: 276, column: 13)
!367 = !DILocation(line: 277, column: 17, scope: !366)
!368 = !DILocation(line: 278, column: 13, scope: !366)
!369 = !DILocalVariable(name: "buffer", scope: !370, file: !66, line: 290, type: !166)
!370 = distinct !DILexicalBlock(scope: !371, file: !66, line: 289, column: 9)
!371 = distinct !DILexicalBlock(scope: !372, file: !66, line: 288, column: 5)
!372 = distinct !DILexicalBlock(scope: !298, file: !66, line: 287, column: 8)
!373 = !DILocation(line: 290, column: 17, scope: !370)
!374 = !DILocation(line: 292, column: 17, scope: !375)
!375 = distinct !DILexicalBlock(scope: !370, file: !66, line: 292, column: 17)
!376 = !DILocation(line: 292, column: 22, scope: !375)
!377 = !DILocation(line: 292, column: 27, scope: !375)
!378 = !DILocation(line: 292, column: 30, scope: !375)
!379 = !DILocation(line: 292, column: 35, scope: !375)
!380 = !DILocation(line: 292, column: 17, scope: !370)
!381 = !DILocation(line: 294, column: 37, scope: !382)
!382 = distinct !DILexicalBlock(scope: !375, file: !66, line: 293, column: 13)
!383 = !DILocation(line: 294, column: 30, scope: !382)
!384 = !DILocation(line: 294, column: 17, scope: !382)
!385 = !DILocation(line: 295, column: 13, scope: !382)
!386 = !DILocation(line: 298, column: 17, scope: !387)
!387 = distinct !DILexicalBlock(scope: !375, file: !66, line: 297, column: 13)
!388 = !DILocation(line: 302, column: 1, scope: !298)
!389 = distinct !DISubprogram(name: "goodG2B1", scope: !66, file: !66, line: 305, type: !67, scopeLine: 306, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!390 = !DILocalVariable(name: "data", scope: !389, file: !66, line: 307, type: !71)
!391 = !DILocation(line: 307, column: 9, scope: !389)
!392 = !DILocation(line: 309, column: 10, scope: !389)
!393 = !DILocation(line: 319, column: 14, scope: !394)
!394 = distinct !DILexicalBlock(scope: !395, file: !66, line: 316, column: 5)
!395 = distinct !DILexicalBlock(scope: !389, file: !66, line: 310, column: 8)
!396 = !DILocalVariable(name: "buffer", scope: !397, file: !66, line: 324, type: !166)
!397 = distinct !DILexicalBlock(scope: !398, file: !66, line: 323, column: 9)
!398 = distinct !DILexicalBlock(scope: !399, file: !66, line: 322, column: 5)
!399 = distinct !DILexicalBlock(scope: !389, file: !66, line: 321, column: 8)
!400 = !DILocation(line: 324, column: 17, scope: !397)
!401 = !DILocation(line: 327, column: 17, scope: !402)
!402 = distinct !DILexicalBlock(scope: !397, file: !66, line: 327, column: 17)
!403 = !DILocation(line: 327, column: 22, scope: !402)
!404 = !DILocation(line: 327, column: 17, scope: !397)
!405 = !DILocation(line: 329, column: 37, scope: !406)
!406 = distinct !DILexicalBlock(scope: !402, file: !66, line: 328, column: 13)
!407 = !DILocation(line: 329, column: 30, scope: !406)
!408 = !DILocation(line: 329, column: 17, scope: !406)
!409 = !DILocation(line: 330, column: 13, scope: !406)
!410 = !DILocation(line: 333, column: 17, scope: !411)
!411 = distinct !DILexicalBlock(scope: !402, file: !66, line: 332, column: 13)
!412 = !DILocation(line: 337, column: 1, scope: !389)
!413 = distinct !DISubprogram(name: "goodG2B2", scope: !66, file: !66, line: 340, type: !67, scopeLine: 341, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!414 = !DILocalVariable(name: "data", scope: !413, file: !66, line: 342, type: !71)
!415 = !DILocation(line: 342, column: 9, scope: !413)
!416 = !DILocation(line: 344, column: 10, scope: !413)
!417 = !DILocation(line: 349, column: 14, scope: !418)
!418 = distinct !DILexicalBlock(scope: !419, file: !66, line: 346, column: 5)
!419 = distinct !DILexicalBlock(scope: !413, file: !66, line: 345, column: 8)
!420 = !DILocalVariable(name: "buffer", scope: !421, file: !66, line: 354, type: !166)
!421 = distinct !DILexicalBlock(scope: !422, file: !66, line: 353, column: 9)
!422 = distinct !DILexicalBlock(scope: !423, file: !66, line: 352, column: 5)
!423 = distinct !DILexicalBlock(scope: !413, file: !66, line: 351, column: 8)
!424 = !DILocation(line: 354, column: 17, scope: !421)
!425 = !DILocation(line: 357, column: 17, scope: !426)
!426 = distinct !DILexicalBlock(scope: !421, file: !66, line: 357, column: 17)
!427 = !DILocation(line: 357, column: 22, scope: !426)
!428 = !DILocation(line: 357, column: 17, scope: !421)
!429 = !DILocation(line: 359, column: 37, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !66, line: 358, column: 13)
!431 = !DILocation(line: 359, column: 30, scope: !430)
!432 = !DILocation(line: 359, column: 17, scope: !430)
!433 = !DILocation(line: 360, column: 13, scope: !430)
!434 = !DILocation(line: 363, column: 17, scope: !435)
!435 = distinct !DILexicalBlock(scope: !426, file: !66, line: 362, column: 13)
!436 = !DILocation(line: 367, column: 1, scope: !413)
