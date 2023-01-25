; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_31.c"
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_31_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data21 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !167, metadata !DIExpression()), !dbg !172
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !172
  %13 = load i32, i32* %data21, align 4, !dbg !173
  %cmp22 = icmp sge i32 %13, 0, !dbg !175
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !176

if.then24:                                        ; preds = %if.end20
  %14 = load i32, i32* %data21, align 4, !dbg !177
  %idxprom25 = sext i32 %14 to i64, !dbg !179
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !179
  %15 = load i32, i32* %arrayidx26, align 4, !dbg !179
  call void @printIntLine(i32 %15), !dbg !180
  br label %if.end27, !dbg !181

if.else:                                          ; preds = %if.end20
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !182
  br label %if.end27

if.end27:                                         ; preds = %if.else, %if.then24
  ret void, !dbg !184
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_31_good() #0 !dbg !185 {
entry:
  call void @goodG2B(), !dbg !186
  call void @goodB2G(), !dbg !187
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !189 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !194, metadata !DIExpression()), !dbg !195
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !196, metadata !DIExpression()), !dbg !197
  %call = call i64 @time(i64* null) #7, !dbg !198
  %conv = trunc i64 %call to i32, !dbg !199
  call void @srand(i32 %conv) #7, !dbg !200
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !201
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_31_good(), !dbg !202
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !203
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !204
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_31_bad(), !dbg !205
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !206
  ret i32 0, !dbg !207
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !208 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !209, metadata !DIExpression()), !dbg !210
  store i32 -1, i32* %data, align 4, !dbg !211
  store i32 7, i32* %data, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !213, metadata !DIExpression()), !dbg !215
  %0 = load i32, i32* %data, align 4, !dbg !216
  store i32 %0, i32* %dataCopy, align 4, !dbg !215
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !217, metadata !DIExpression()), !dbg !218
  %1 = load i32, i32* %dataCopy, align 4, !dbg !219
  store i32 %1, i32* %data1, align 4, !dbg !218
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !220, metadata !DIExpression()), !dbg !222
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !222
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !222
  %3 = load i32, i32* %data1, align 4, !dbg !223
  %cmp = icmp sge i32 %3, 0, !dbg !225
  br i1 %cmp, label %if.then, label %if.else, !dbg !226

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !227
  %idxprom = sext i32 %4 to i64, !dbg !229
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !229
  %5 = load i32, i32* %arrayidx, align 4, !dbg !229
  call void @printIntLine(i32 %5), !dbg !230
  br label %if.end, !dbg !231

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !232
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !234
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !235 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data21 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !236, metadata !DIExpression()), !dbg !237
  store i32 -1, i32* %data, align 4, !dbg !238
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !239, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !242, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !244, metadata !DIExpression()), !dbg !245
  store i32 -1, i32* %connectSocket, align 4, !dbg !245
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !246, metadata !DIExpression()), !dbg !247
  br label %do.body, !dbg !248

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !249
  store i32 %call, i32* %connectSocket, align 4, !dbg !251
  %0 = load i32, i32* %connectSocket, align 4, !dbg !252
  %cmp = icmp eq i32 %0, -1, !dbg !254
  br i1 %cmp, label %if.then, label %if.end, !dbg !255

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !256

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !258
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !258
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !259
  store i16 2, i16* %sin_family, align 4, !dbg !260
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !261
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !262
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !263
  store i32 %call1, i32* %s_addr, align 4, !dbg !264
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !265
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !266
  store i16 %call2, i16* %sin_port, align 2, !dbg !267
  %2 = load i32, i32* %connectSocket, align 4, !dbg !268
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !270
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !271
  %cmp4 = icmp eq i32 %call3, -1, !dbg !272
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !273

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !274

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !276
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !277
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !278
  %conv = trunc i64 %call7 to i32, !dbg !278
  store i32 %conv, i32* %recvResult, align 4, !dbg !279
  %5 = load i32, i32* %recvResult, align 4, !dbg !280
  %cmp8 = icmp eq i32 %5, -1, !dbg !282
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !283

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !284
  %cmp10 = icmp eq i32 %6, 0, !dbg !285
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !286

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !287

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !289
  %idxprom = sext i32 %7 to i64, !dbg !290
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !290
  store i8 0, i8* %arrayidx, align 1, !dbg !291
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !292
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !293
  store i32 %call15, i32* %data, align 4, !dbg !294
  br label %do.end, !dbg !295

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !296
  %cmp16 = icmp ne i32 %8, -1, !dbg !298
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !299

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !300
  %call19 = call i32 @close(i32 %9), !dbg !302
  br label %if.end20, !dbg !303

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !304, metadata !DIExpression()), !dbg !306
  %10 = load i32, i32* %data, align 4, !dbg !307
  store i32 %10, i32* %dataCopy, align 4, !dbg !306
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !308, metadata !DIExpression()), !dbg !309
  %11 = load i32, i32* %dataCopy, align 4, !dbg !310
  store i32 %11, i32* %data21, align 4, !dbg !309
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !311, metadata !DIExpression()), !dbg !313
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !313
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !313
  %13 = load i32, i32* %data21, align 4, !dbg !314
  %cmp22 = icmp sge i32 %13, 0, !dbg !316
  br i1 %cmp22, label %land.lhs.true, label %if.else, !dbg !317

land.lhs.true:                                    ; preds = %if.end20
  %14 = load i32, i32* %data21, align 4, !dbg !318
  %cmp24 = icmp slt i32 %14, 10, !dbg !319
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !320

if.then26:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data21, align 4, !dbg !321
  %idxprom27 = sext i32 %15 to i64, !dbg !323
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !323
  %16 = load i32, i32* %arrayidx28, align 4, !dbg !323
  call void @printIntLine(i32 %16), !dbg !324
  br label %if.end29, !dbg !325

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !326
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then26
  ret void, !dbg !328
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_31_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!167 = !DILocalVariable(name: "buffer", scope: !168, file: !66, line: 109, type: !169)
!168 = distinct !DILexicalBlock(scope: !161, file: !66, line: 108, column: 9)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 10)
!172 = !DILocation(line: 109, column: 17, scope: !168)
!173 = !DILocation(line: 112, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !168, file: !66, line: 112, column: 17)
!175 = !DILocation(line: 112, column: 22, scope: !174)
!176 = !DILocation(line: 112, column: 17, scope: !168)
!177 = !DILocation(line: 114, column: 37, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !66, line: 113, column: 13)
!179 = !DILocation(line: 114, column: 30, scope: !178)
!180 = !DILocation(line: 114, column: 17, scope: !178)
!181 = !DILocation(line: 115, column: 13, scope: !178)
!182 = !DILocation(line: 118, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !174, file: !66, line: 117, column: 13)
!184 = !DILocation(line: 122, column: 1, scope: !65)
!185 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_31_good", scope: !66, file: !66, line: 236, type: !67, scopeLine: 237, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!186 = !DILocation(line: 238, column: 5, scope: !185)
!187 = !DILocation(line: 239, column: 5, scope: !185)
!188 = !DILocation(line: 240, column: 1, scope: !185)
!189 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 250, type: !190, scopeLine: 251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!190 = !DISubroutineType(types: !191)
!191 = !{!71, !71, !192}
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!194 = !DILocalVariable(name: "argc", arg: 1, scope: !189, file: !66, line: 250, type: !71)
!195 = !DILocation(line: 250, column: 14, scope: !189)
!196 = !DILocalVariable(name: "argv", arg: 2, scope: !189, file: !66, line: 250, type: !192)
!197 = !DILocation(line: 250, column: 27, scope: !189)
!198 = !DILocation(line: 253, column: 22, scope: !189)
!199 = !DILocation(line: 253, column: 12, scope: !189)
!200 = !DILocation(line: 253, column: 5, scope: !189)
!201 = !DILocation(line: 255, column: 5, scope: !189)
!202 = !DILocation(line: 256, column: 5, scope: !189)
!203 = !DILocation(line: 257, column: 5, scope: !189)
!204 = !DILocation(line: 260, column: 5, scope: !189)
!205 = !DILocation(line: 261, column: 5, scope: !189)
!206 = !DILocation(line: 262, column: 5, scope: !189)
!207 = !DILocation(line: 264, column: 5, scope: !189)
!208 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 129, type: !67, scopeLine: 130, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!209 = !DILocalVariable(name: "data", scope: !208, file: !66, line: 131, type: !71)
!210 = !DILocation(line: 131, column: 9, scope: !208)
!211 = !DILocation(line: 133, column: 10, scope: !208)
!212 = !DILocation(line: 136, column: 10, scope: !208)
!213 = !DILocalVariable(name: "dataCopy", scope: !214, file: !66, line: 138, type: !71)
!214 = distinct !DILexicalBlock(scope: !208, file: !66, line: 137, column: 5)
!215 = !DILocation(line: 138, column: 13, scope: !214)
!216 = !DILocation(line: 138, column: 24, scope: !214)
!217 = !DILocalVariable(name: "data", scope: !214, file: !66, line: 139, type: !71)
!218 = !DILocation(line: 139, column: 13, scope: !214)
!219 = !DILocation(line: 139, column: 20, scope: !214)
!220 = !DILocalVariable(name: "buffer", scope: !221, file: !66, line: 141, type: !169)
!221 = distinct !DILexicalBlock(scope: !214, file: !66, line: 140, column: 9)
!222 = !DILocation(line: 141, column: 17, scope: !221)
!223 = !DILocation(line: 144, column: 17, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !66, line: 144, column: 17)
!225 = !DILocation(line: 144, column: 22, scope: !224)
!226 = !DILocation(line: 144, column: 17, scope: !221)
!227 = !DILocation(line: 146, column: 37, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !66, line: 145, column: 13)
!229 = !DILocation(line: 146, column: 30, scope: !228)
!230 = !DILocation(line: 146, column: 17, scope: !228)
!231 = !DILocation(line: 147, column: 13, scope: !228)
!232 = !DILocation(line: 150, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !224, file: !66, line: 149, column: 13)
!234 = !DILocation(line: 154, column: 1, scope: !208)
!235 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 157, type: !67, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!236 = !DILocalVariable(name: "data", scope: !235, file: !66, line: 159, type: !71)
!237 = !DILocation(line: 159, column: 9, scope: !235)
!238 = !DILocation(line: 161, column: 10, scope: !235)
!239 = !DILocalVariable(name: "recvResult", scope: !240, file: !66, line: 167, type: !71)
!240 = distinct !DILexicalBlock(scope: !235, file: !66, line: 162, column: 5)
!241 = !DILocation(line: 167, column: 13, scope: !240)
!242 = !DILocalVariable(name: "service", scope: !240, file: !66, line: 168, type: !78)
!243 = !DILocation(line: 168, column: 28, scope: !240)
!244 = !DILocalVariable(name: "connectSocket", scope: !240, file: !66, line: 169, type: !71)
!245 = !DILocation(line: 169, column: 16, scope: !240)
!246 = !DILocalVariable(name: "inputBuffer", scope: !240, file: !66, line: 170, type: !55)
!247 = !DILocation(line: 170, column: 14, scope: !240)
!248 = !DILocation(line: 171, column: 9, scope: !240)
!249 = !DILocation(line: 181, column: 29, scope: !250)
!250 = distinct !DILexicalBlock(scope: !240, file: !66, line: 172, column: 9)
!251 = !DILocation(line: 181, column: 27, scope: !250)
!252 = !DILocation(line: 182, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !66, line: 182, column: 17)
!254 = !DILocation(line: 182, column: 31, scope: !253)
!255 = !DILocation(line: 182, column: 17, scope: !250)
!256 = !DILocation(line: 184, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !66, line: 183, column: 13)
!258 = !DILocation(line: 186, column: 13, scope: !250)
!259 = !DILocation(line: 187, column: 21, scope: !250)
!260 = !DILocation(line: 187, column: 32, scope: !250)
!261 = !DILocation(line: 188, column: 39, scope: !250)
!262 = !DILocation(line: 188, column: 21, scope: !250)
!263 = !DILocation(line: 188, column: 30, scope: !250)
!264 = !DILocation(line: 188, column: 37, scope: !250)
!265 = !DILocation(line: 189, column: 32, scope: !250)
!266 = !DILocation(line: 189, column: 21, scope: !250)
!267 = !DILocation(line: 189, column: 30, scope: !250)
!268 = !DILocation(line: 190, column: 25, scope: !269)
!269 = distinct !DILexicalBlock(scope: !250, file: !66, line: 190, column: 17)
!270 = !DILocation(line: 190, column: 40, scope: !269)
!271 = !DILocation(line: 190, column: 17, scope: !269)
!272 = !DILocation(line: 190, column: 85, scope: !269)
!273 = !DILocation(line: 190, column: 17, scope: !250)
!274 = !DILocation(line: 192, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !66, line: 191, column: 13)
!276 = !DILocation(line: 196, column: 31, scope: !250)
!277 = !DILocation(line: 196, column: 46, scope: !250)
!278 = !DILocation(line: 196, column: 26, scope: !250)
!279 = !DILocation(line: 196, column: 24, scope: !250)
!280 = !DILocation(line: 197, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !250, file: !66, line: 197, column: 17)
!282 = !DILocation(line: 197, column: 28, scope: !281)
!283 = !DILocation(line: 197, column: 44, scope: !281)
!284 = !DILocation(line: 197, column: 47, scope: !281)
!285 = !DILocation(line: 197, column: 58, scope: !281)
!286 = !DILocation(line: 197, column: 17, scope: !250)
!287 = !DILocation(line: 199, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !281, file: !66, line: 198, column: 13)
!289 = !DILocation(line: 202, column: 25, scope: !250)
!290 = !DILocation(line: 202, column: 13, scope: !250)
!291 = !DILocation(line: 202, column: 37, scope: !250)
!292 = !DILocation(line: 204, column: 25, scope: !250)
!293 = !DILocation(line: 204, column: 20, scope: !250)
!294 = !DILocation(line: 204, column: 18, scope: !250)
!295 = !DILocation(line: 205, column: 9, scope: !250)
!296 = !DILocation(line: 207, column: 13, scope: !297)
!297 = distinct !DILexicalBlock(scope: !240, file: !66, line: 207, column: 13)
!298 = !DILocation(line: 207, column: 27, scope: !297)
!299 = !DILocation(line: 207, column: 13, scope: !240)
!300 = !DILocation(line: 209, column: 26, scope: !301)
!301 = distinct !DILexicalBlock(scope: !297, file: !66, line: 208, column: 9)
!302 = !DILocation(line: 209, column: 13, scope: !301)
!303 = !DILocation(line: 210, column: 9, scope: !301)
!304 = !DILocalVariable(name: "dataCopy", scope: !305, file: !66, line: 219, type: !71)
!305 = distinct !DILexicalBlock(scope: !235, file: !66, line: 218, column: 5)
!306 = !DILocation(line: 219, column: 13, scope: !305)
!307 = !DILocation(line: 219, column: 24, scope: !305)
!308 = !DILocalVariable(name: "data", scope: !305, file: !66, line: 220, type: !71)
!309 = !DILocation(line: 220, column: 13, scope: !305)
!310 = !DILocation(line: 220, column: 20, scope: !305)
!311 = !DILocalVariable(name: "buffer", scope: !312, file: !66, line: 222, type: !169)
!312 = distinct !DILexicalBlock(scope: !305, file: !66, line: 221, column: 9)
!313 = !DILocation(line: 222, column: 17, scope: !312)
!314 = !DILocation(line: 224, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !66, line: 224, column: 17)
!316 = !DILocation(line: 224, column: 22, scope: !315)
!317 = !DILocation(line: 224, column: 27, scope: !315)
!318 = !DILocation(line: 224, column: 30, scope: !315)
!319 = !DILocation(line: 224, column: 35, scope: !315)
!320 = !DILocation(line: 224, column: 17, scope: !312)
!321 = !DILocation(line: 226, column: 37, scope: !322)
!322 = distinct !DILexicalBlock(scope: !315, file: !66, line: 225, column: 13)
!323 = !DILocation(line: 226, column: 30, scope: !322)
!324 = !DILocation(line: 226, column: 17, scope: !322)
!325 = !DILocation(line: 227, column: 13, scope: !322)
!326 = !DILocation(line: 230, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !315, file: !66, line: 229, column: 13)
!328 = !DILocation(line: 234, column: 1, scope: !235)
