; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_15.c"
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_15_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !160, metadata !DIExpression()), !dbg !165
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !165
  %11 = load i32, i32* %data, align 4, !dbg !166
  %cmp21 = icmp sge i32 %11, 0, !dbg !168
  br i1 %cmp21, label %if.then23, label %if.else, !dbg !169

if.then23:                                        ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !170
  %idxprom24 = sext i32 %12 to i64, !dbg !172
  %arrayidx25 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom24, !dbg !172
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !172
  call void @printIntLine(i32 %13), !dbg !173
  br label %if.end26, !dbg !174

if.else:                                          ; preds = %if.end20
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !175
  br label %if.end26

if.end26:                                         ; preds = %if.else, %if.then23
  ret void, !dbg !177
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_15_good() #0 !dbg !178 {
entry:
  call void @goodB2G1(), !dbg !179
  call void @goodB2G2(), !dbg !180
  call void @goodG2B1(), !dbg !181
  call void @goodG2B2(), !dbg !182
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !184 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !189, metadata !DIExpression()), !dbg !190
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !191, metadata !DIExpression()), !dbg !192
  %call = call i64 @time(i64* null) #7, !dbg !193
  %conv = trunc i64 %call to i32, !dbg !194
  call void @srand(i32 %conv) #7, !dbg !195
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !196
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_15_good(), !dbg !197
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !198
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !199
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_15_bad(), !dbg !200
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !201
  ret i32 0, !dbg !202
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !203 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !207, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 -1, i32* %connectSocket, align 4, !dbg !213
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !214, metadata !DIExpression()), !dbg !215
  br label %do.body, !dbg !216

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !217
  store i32 %call, i32* %connectSocket, align 4, !dbg !219
  %0 = load i32, i32* %connectSocket, align 4, !dbg !220
  %cmp = icmp eq i32 %0, -1, !dbg !222
  br i1 %cmp, label %if.then, label %if.end, !dbg !223

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !224

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !226
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !226
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !227
  store i16 2, i16* %sin_family, align 4, !dbg !228
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !229
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !230
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !231
  store i32 %call1, i32* %s_addr, align 4, !dbg !232
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !233
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !234
  store i16 %call2, i16* %sin_port, align 2, !dbg !235
  %2 = load i32, i32* %connectSocket, align 4, !dbg !236
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !238
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !239
  %cmp4 = icmp eq i32 %call3, -1, !dbg !240
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !241

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !242

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !244
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !245
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !246
  %conv = trunc i64 %call7 to i32, !dbg !246
  store i32 %conv, i32* %recvResult, align 4, !dbg !247
  %5 = load i32, i32* %recvResult, align 4, !dbg !248
  %cmp8 = icmp eq i32 %5, -1, !dbg !250
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !251

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !252
  %cmp10 = icmp eq i32 %6, 0, !dbg !253
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !254

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !255

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !257
  %idxprom = sext i32 %7 to i64, !dbg !258
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !258
  store i8 0, i8* %arrayidx, align 1, !dbg !259
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !260
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !261
  store i32 %call15, i32* %data, align 4, !dbg !262
  br label %do.end, !dbg !263

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !264
  %cmp16 = icmp ne i32 %8, -1, !dbg !266
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !267

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !268
  %call19 = call i32 @close(i32 %9), !dbg !270
  br label %if.end20, !dbg !271

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !272, metadata !DIExpression()), !dbg !274
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !274
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !274
  %11 = load i32, i32* %data, align 4, !dbg !275
  %cmp21 = icmp sge i32 %11, 0, !dbg !277
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !278

land.lhs.true:                                    ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !279
  %cmp23 = icmp slt i32 %12, 10, !dbg !280
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !281

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !282
  %idxprom26 = sext i32 %13 to i64, !dbg !284
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !284
  %14 = load i32, i32* %arrayidx27, align 4, !dbg !284
  call void @printIntLine(i32 %14), !dbg !285
  br label %if.end28, !dbg !286

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !287
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  ret void, !dbg !289
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !290 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !291, metadata !DIExpression()), !dbg !292
  store i32 -1, i32* %data, align 4, !dbg !293
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !294, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !297, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !299, metadata !DIExpression()), !dbg !300
  store i32 -1, i32* %connectSocket, align 4, !dbg !300
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !301, metadata !DIExpression()), !dbg !302
  br label %do.body, !dbg !303

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !304
  store i32 %call, i32* %connectSocket, align 4, !dbg !306
  %0 = load i32, i32* %connectSocket, align 4, !dbg !307
  %cmp = icmp eq i32 %0, -1, !dbg !309
  br i1 %cmp, label %if.then, label %if.end, !dbg !310

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !311

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !313
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !313
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !314
  store i16 2, i16* %sin_family, align 4, !dbg !315
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !316
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !317
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !318
  store i32 %call1, i32* %s_addr, align 4, !dbg !319
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !320
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !321
  store i16 %call2, i16* %sin_port, align 2, !dbg !322
  %2 = load i32, i32* %connectSocket, align 4, !dbg !323
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !325
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !326
  %cmp4 = icmp eq i32 %call3, -1, !dbg !327
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !328

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !329

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !331
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !332
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !333
  %conv = trunc i64 %call7 to i32, !dbg !333
  store i32 %conv, i32* %recvResult, align 4, !dbg !334
  %5 = load i32, i32* %recvResult, align 4, !dbg !335
  %cmp8 = icmp eq i32 %5, -1, !dbg !337
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !338

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !339
  %cmp10 = icmp eq i32 %6, 0, !dbg !340
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !341

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !342

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !344
  %idxprom = sext i32 %7 to i64, !dbg !345
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !345
  store i8 0, i8* %arrayidx, align 1, !dbg !346
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !347
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !348
  store i32 %call15, i32* %data, align 4, !dbg !349
  br label %do.end, !dbg !350

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !351
  %cmp16 = icmp ne i32 %8, -1, !dbg !353
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !354

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !355
  %call19 = call i32 @close(i32 %9), !dbg !357
  br label %if.end20, !dbg !358

if.end20:                                         ; preds = %if.then18, %do.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !359, metadata !DIExpression()), !dbg !361
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !361
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !361
  %11 = load i32, i32* %data, align 4, !dbg !362
  %cmp21 = icmp sge i32 %11, 0, !dbg !364
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !365

land.lhs.true:                                    ; preds = %if.end20
  %12 = load i32, i32* %data, align 4, !dbg !366
  %cmp23 = icmp slt i32 %12, 10, !dbg !367
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !368

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !369
  %idxprom26 = sext i32 %13 to i64, !dbg !371
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !371
  %14 = load i32, i32* %arrayidx27, align 4, !dbg !371
  call void @printIntLine(i32 %14), !dbg !372
  br label %if.end28, !dbg !373

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !374
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  ret void, !dbg !376
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !377 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !378, metadata !DIExpression()), !dbg !379
  store i32 -1, i32* %data, align 4, !dbg !380
  store i32 7, i32* %data, align 4, !dbg !381
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !382, metadata !DIExpression()), !dbg !384
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !384
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !384
  %1 = load i32, i32* %data, align 4, !dbg !385
  %cmp = icmp sge i32 %1, 0, !dbg !387
  br i1 %cmp, label %if.then, label %if.else, !dbg !388

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !389
  %idxprom = sext i32 %2 to i64, !dbg !391
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !391
  %3 = load i32, i32* %arrayidx, align 4, !dbg !391
  call void @printIntLine(i32 %3), !dbg !392
  br label %if.end, !dbg !393

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !394
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !396
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !397 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !398, metadata !DIExpression()), !dbg !399
  store i32 -1, i32* %data, align 4, !dbg !400
  store i32 7, i32* %data, align 4, !dbg !401
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !402, metadata !DIExpression()), !dbg !404
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !404
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !404
  %1 = load i32, i32* %data, align 4, !dbg !405
  %cmp = icmp sge i32 %1, 0, !dbg !407
  br i1 %cmp, label %if.then, label %if.else, !dbg !408

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !409
  %idxprom = sext i32 %2 to i64, !dbg !411
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !411
  %3 = load i32, i32* %arrayidx, align 4, !dbg !411
  call void @printIntLine(i32 %3), !dbg !412
  br label %if.end, !dbg !413

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !414
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !416
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_15_bad", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_15.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 46, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 46, column: 9, scope: !65)
!73 = !DILocation(line: 48, column: 10, scope: !65)
!74 = !DILocalVariable(name: "recvResult", scope: !75, file: !66, line: 57, type: !71)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 52, column: 5)
!76 = !DILocation(line: 57, column: 13, scope: !75)
!77 = !DILocalVariable(name: "service", scope: !75, file: !66, line: 58, type: !78)
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
!99 = !DILocation(line: 58, column: 28, scope: !75)
!100 = !DILocalVariable(name: "connectSocket", scope: !75, file: !66, line: 59, type: !71)
!101 = !DILocation(line: 59, column: 16, scope: !75)
!102 = !DILocalVariable(name: "inputBuffer", scope: !75, file: !66, line: 60, type: !55)
!103 = !DILocation(line: 60, column: 14, scope: !75)
!104 = !DILocation(line: 61, column: 9, scope: !75)
!105 = !DILocation(line: 71, column: 29, scope: !106)
!106 = distinct !DILexicalBlock(scope: !75, file: !66, line: 62, column: 9)
!107 = !DILocation(line: 71, column: 27, scope: !106)
!108 = !DILocation(line: 72, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !66, line: 72, column: 17)
!110 = !DILocation(line: 72, column: 31, scope: !109)
!111 = !DILocation(line: 72, column: 17, scope: !106)
!112 = !DILocation(line: 74, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !66, line: 73, column: 13)
!114 = !DILocation(line: 76, column: 13, scope: !106)
!115 = !DILocation(line: 77, column: 21, scope: !106)
!116 = !DILocation(line: 77, column: 32, scope: !106)
!117 = !DILocation(line: 78, column: 39, scope: !106)
!118 = !DILocation(line: 78, column: 21, scope: !106)
!119 = !DILocation(line: 78, column: 30, scope: !106)
!120 = !DILocation(line: 78, column: 37, scope: !106)
!121 = !DILocation(line: 79, column: 32, scope: !106)
!122 = !DILocation(line: 79, column: 21, scope: !106)
!123 = !DILocation(line: 79, column: 30, scope: !106)
!124 = !DILocation(line: 80, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !106, file: !66, line: 80, column: 17)
!126 = !DILocation(line: 80, column: 40, scope: !125)
!127 = !DILocation(line: 80, column: 17, scope: !125)
!128 = !DILocation(line: 80, column: 85, scope: !125)
!129 = !DILocation(line: 80, column: 17, scope: !106)
!130 = !DILocation(line: 82, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !66, line: 81, column: 13)
!132 = !DILocation(line: 86, column: 31, scope: !106)
!133 = !DILocation(line: 86, column: 46, scope: !106)
!134 = !DILocation(line: 86, column: 26, scope: !106)
!135 = !DILocation(line: 86, column: 24, scope: !106)
!136 = !DILocation(line: 87, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !106, file: !66, line: 87, column: 17)
!138 = !DILocation(line: 87, column: 28, scope: !137)
!139 = !DILocation(line: 87, column: 44, scope: !137)
!140 = !DILocation(line: 87, column: 47, scope: !137)
!141 = !DILocation(line: 87, column: 58, scope: !137)
!142 = !DILocation(line: 87, column: 17, scope: !106)
!143 = !DILocation(line: 89, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !66, line: 88, column: 13)
!145 = !DILocation(line: 92, column: 25, scope: !106)
!146 = !DILocation(line: 92, column: 13, scope: !106)
!147 = !DILocation(line: 92, column: 37, scope: !106)
!148 = !DILocation(line: 94, column: 25, scope: !106)
!149 = !DILocation(line: 94, column: 20, scope: !106)
!150 = !DILocation(line: 94, column: 18, scope: !106)
!151 = !DILocation(line: 95, column: 9, scope: !106)
!152 = !DILocation(line: 97, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !75, file: !66, line: 97, column: 13)
!154 = !DILocation(line: 97, column: 27, scope: !153)
!155 = !DILocation(line: 97, column: 13, scope: !75)
!156 = !DILocation(line: 99, column: 26, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !66, line: 98, column: 9)
!158 = !DILocation(line: 99, column: 13, scope: !157)
!159 = !DILocation(line: 100, column: 9, scope: !157)
!160 = !DILocalVariable(name: "buffer", scope: !161, file: !66, line: 118, type: !162)
!161 = distinct !DILexicalBlock(scope: !65, file: !66, line: 117, column: 5)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !163)
!163 = !{!164}
!164 = !DISubrange(count: 10)
!165 = !DILocation(line: 118, column: 13, scope: !161)
!166 = !DILocation(line: 121, column: 13, scope: !167)
!167 = distinct !DILexicalBlock(scope: !161, file: !66, line: 121, column: 13)
!168 = !DILocation(line: 121, column: 18, scope: !167)
!169 = !DILocation(line: 121, column: 13, scope: !161)
!170 = !DILocation(line: 123, column: 33, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !66, line: 122, column: 9)
!172 = !DILocation(line: 123, column: 26, scope: !171)
!173 = !DILocation(line: 123, column: 13, scope: !171)
!174 = !DILocation(line: 124, column: 9, scope: !171)
!175 = !DILocation(line: 127, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !167, file: !66, line: 126, column: 9)
!177 = !DILocation(line: 136, column: 1, scope: !65)
!178 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_15_good", scope: !66, file: !66, line: 414, type: !67, scopeLine: 415, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!179 = !DILocation(line: 416, column: 5, scope: !178)
!180 = !DILocation(line: 417, column: 5, scope: !178)
!181 = !DILocation(line: 418, column: 5, scope: !178)
!182 = !DILocation(line: 419, column: 5, scope: !178)
!183 = !DILocation(line: 420, column: 1, scope: !178)
!184 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 431, type: !185, scopeLine: 432, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!185 = !DISubroutineType(types: !186)
!186 = !{!71, !71, !187}
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!189 = !DILocalVariable(name: "argc", arg: 1, scope: !184, file: !66, line: 431, type: !71)
!190 = !DILocation(line: 431, column: 14, scope: !184)
!191 = !DILocalVariable(name: "argv", arg: 2, scope: !184, file: !66, line: 431, type: !187)
!192 = !DILocation(line: 431, column: 27, scope: !184)
!193 = !DILocation(line: 434, column: 22, scope: !184)
!194 = !DILocation(line: 434, column: 12, scope: !184)
!195 = !DILocation(line: 434, column: 5, scope: !184)
!196 = !DILocation(line: 436, column: 5, scope: !184)
!197 = !DILocation(line: 437, column: 5, scope: !184)
!198 = !DILocation(line: 438, column: 5, scope: !184)
!199 = !DILocation(line: 441, column: 5, scope: !184)
!200 = !DILocation(line: 442, column: 5, scope: !184)
!201 = !DILocation(line: 443, column: 5, scope: !184)
!202 = !DILocation(line: 445, column: 5, scope: !184)
!203 = distinct !DISubprogram(name: "goodB2G1", scope: !66, file: !66, line: 143, type: !67, scopeLine: 144, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!204 = !DILocalVariable(name: "data", scope: !203, file: !66, line: 145, type: !71)
!205 = !DILocation(line: 145, column: 9, scope: !203)
!206 = !DILocation(line: 147, column: 10, scope: !203)
!207 = !DILocalVariable(name: "recvResult", scope: !208, file: !66, line: 156, type: !71)
!208 = distinct !DILexicalBlock(scope: !203, file: !66, line: 151, column: 5)
!209 = !DILocation(line: 156, column: 13, scope: !208)
!210 = !DILocalVariable(name: "service", scope: !208, file: !66, line: 157, type: !78)
!211 = !DILocation(line: 157, column: 28, scope: !208)
!212 = !DILocalVariable(name: "connectSocket", scope: !208, file: !66, line: 158, type: !71)
!213 = !DILocation(line: 158, column: 16, scope: !208)
!214 = !DILocalVariable(name: "inputBuffer", scope: !208, file: !66, line: 159, type: !55)
!215 = !DILocation(line: 159, column: 14, scope: !208)
!216 = !DILocation(line: 160, column: 9, scope: !208)
!217 = !DILocation(line: 170, column: 29, scope: !218)
!218 = distinct !DILexicalBlock(scope: !208, file: !66, line: 161, column: 9)
!219 = !DILocation(line: 170, column: 27, scope: !218)
!220 = !DILocation(line: 171, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !66, line: 171, column: 17)
!222 = !DILocation(line: 171, column: 31, scope: !221)
!223 = !DILocation(line: 171, column: 17, scope: !218)
!224 = !DILocation(line: 173, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !66, line: 172, column: 13)
!226 = !DILocation(line: 175, column: 13, scope: !218)
!227 = !DILocation(line: 176, column: 21, scope: !218)
!228 = !DILocation(line: 176, column: 32, scope: !218)
!229 = !DILocation(line: 177, column: 39, scope: !218)
!230 = !DILocation(line: 177, column: 21, scope: !218)
!231 = !DILocation(line: 177, column: 30, scope: !218)
!232 = !DILocation(line: 177, column: 37, scope: !218)
!233 = !DILocation(line: 178, column: 32, scope: !218)
!234 = !DILocation(line: 178, column: 21, scope: !218)
!235 = !DILocation(line: 178, column: 30, scope: !218)
!236 = !DILocation(line: 179, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !218, file: !66, line: 179, column: 17)
!238 = !DILocation(line: 179, column: 40, scope: !237)
!239 = !DILocation(line: 179, column: 17, scope: !237)
!240 = !DILocation(line: 179, column: 85, scope: !237)
!241 = !DILocation(line: 179, column: 17, scope: !218)
!242 = !DILocation(line: 181, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !237, file: !66, line: 180, column: 13)
!244 = !DILocation(line: 185, column: 31, scope: !218)
!245 = !DILocation(line: 185, column: 46, scope: !218)
!246 = !DILocation(line: 185, column: 26, scope: !218)
!247 = !DILocation(line: 185, column: 24, scope: !218)
!248 = !DILocation(line: 186, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !218, file: !66, line: 186, column: 17)
!250 = !DILocation(line: 186, column: 28, scope: !249)
!251 = !DILocation(line: 186, column: 44, scope: !249)
!252 = !DILocation(line: 186, column: 47, scope: !249)
!253 = !DILocation(line: 186, column: 58, scope: !249)
!254 = !DILocation(line: 186, column: 17, scope: !218)
!255 = !DILocation(line: 188, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !249, file: !66, line: 187, column: 13)
!257 = !DILocation(line: 191, column: 25, scope: !218)
!258 = !DILocation(line: 191, column: 13, scope: !218)
!259 = !DILocation(line: 191, column: 37, scope: !218)
!260 = !DILocation(line: 193, column: 25, scope: !218)
!261 = !DILocation(line: 193, column: 20, scope: !218)
!262 = !DILocation(line: 193, column: 18, scope: !218)
!263 = !DILocation(line: 194, column: 9, scope: !218)
!264 = !DILocation(line: 196, column: 13, scope: !265)
!265 = distinct !DILexicalBlock(scope: !208, file: !66, line: 196, column: 13)
!266 = !DILocation(line: 196, column: 27, scope: !265)
!267 = !DILocation(line: 196, column: 13, scope: !208)
!268 = !DILocation(line: 198, column: 26, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !66, line: 197, column: 9)
!270 = !DILocation(line: 198, column: 13, scope: !269)
!271 = !DILocation(line: 199, column: 9, scope: !269)
!272 = !DILocalVariable(name: "buffer", scope: !273, file: !66, line: 221, type: !162)
!273 = distinct !DILexicalBlock(scope: !203, file: !66, line: 220, column: 5)
!274 = !DILocation(line: 221, column: 13, scope: !273)
!275 = !DILocation(line: 223, column: 13, scope: !276)
!276 = distinct !DILexicalBlock(scope: !273, file: !66, line: 223, column: 13)
!277 = !DILocation(line: 223, column: 18, scope: !276)
!278 = !DILocation(line: 223, column: 23, scope: !276)
!279 = !DILocation(line: 223, column: 26, scope: !276)
!280 = !DILocation(line: 223, column: 31, scope: !276)
!281 = !DILocation(line: 223, column: 13, scope: !273)
!282 = !DILocation(line: 225, column: 33, scope: !283)
!283 = distinct !DILexicalBlock(scope: !276, file: !66, line: 224, column: 9)
!284 = !DILocation(line: 225, column: 26, scope: !283)
!285 = !DILocation(line: 225, column: 13, scope: !283)
!286 = !DILocation(line: 226, column: 9, scope: !283)
!287 = !DILocation(line: 229, column: 13, scope: !288)
!288 = distinct !DILexicalBlock(scope: !276, file: !66, line: 228, column: 9)
!289 = !DILocation(line: 234, column: 1, scope: !203)
!290 = distinct !DISubprogram(name: "goodB2G2", scope: !66, file: !66, line: 237, type: !67, scopeLine: 238, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!291 = !DILocalVariable(name: "data", scope: !290, file: !66, line: 239, type: !71)
!292 = !DILocation(line: 239, column: 9, scope: !290)
!293 = !DILocation(line: 241, column: 10, scope: !290)
!294 = !DILocalVariable(name: "recvResult", scope: !295, file: !66, line: 250, type: !71)
!295 = distinct !DILexicalBlock(scope: !290, file: !66, line: 245, column: 5)
!296 = !DILocation(line: 250, column: 13, scope: !295)
!297 = !DILocalVariable(name: "service", scope: !295, file: !66, line: 251, type: !78)
!298 = !DILocation(line: 251, column: 28, scope: !295)
!299 = !DILocalVariable(name: "connectSocket", scope: !295, file: !66, line: 252, type: !71)
!300 = !DILocation(line: 252, column: 16, scope: !295)
!301 = !DILocalVariable(name: "inputBuffer", scope: !295, file: !66, line: 253, type: !55)
!302 = !DILocation(line: 253, column: 14, scope: !295)
!303 = !DILocation(line: 254, column: 9, scope: !295)
!304 = !DILocation(line: 264, column: 29, scope: !305)
!305 = distinct !DILexicalBlock(scope: !295, file: !66, line: 255, column: 9)
!306 = !DILocation(line: 264, column: 27, scope: !305)
!307 = !DILocation(line: 265, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !66, line: 265, column: 17)
!309 = !DILocation(line: 265, column: 31, scope: !308)
!310 = !DILocation(line: 265, column: 17, scope: !305)
!311 = !DILocation(line: 267, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !66, line: 266, column: 13)
!313 = !DILocation(line: 269, column: 13, scope: !305)
!314 = !DILocation(line: 270, column: 21, scope: !305)
!315 = !DILocation(line: 270, column: 32, scope: !305)
!316 = !DILocation(line: 271, column: 39, scope: !305)
!317 = !DILocation(line: 271, column: 21, scope: !305)
!318 = !DILocation(line: 271, column: 30, scope: !305)
!319 = !DILocation(line: 271, column: 37, scope: !305)
!320 = !DILocation(line: 272, column: 32, scope: !305)
!321 = !DILocation(line: 272, column: 21, scope: !305)
!322 = !DILocation(line: 272, column: 30, scope: !305)
!323 = !DILocation(line: 273, column: 25, scope: !324)
!324 = distinct !DILexicalBlock(scope: !305, file: !66, line: 273, column: 17)
!325 = !DILocation(line: 273, column: 40, scope: !324)
!326 = !DILocation(line: 273, column: 17, scope: !324)
!327 = !DILocation(line: 273, column: 85, scope: !324)
!328 = !DILocation(line: 273, column: 17, scope: !305)
!329 = !DILocation(line: 275, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !324, file: !66, line: 274, column: 13)
!331 = !DILocation(line: 279, column: 31, scope: !305)
!332 = !DILocation(line: 279, column: 46, scope: !305)
!333 = !DILocation(line: 279, column: 26, scope: !305)
!334 = !DILocation(line: 279, column: 24, scope: !305)
!335 = !DILocation(line: 280, column: 17, scope: !336)
!336 = distinct !DILexicalBlock(scope: !305, file: !66, line: 280, column: 17)
!337 = !DILocation(line: 280, column: 28, scope: !336)
!338 = !DILocation(line: 280, column: 44, scope: !336)
!339 = !DILocation(line: 280, column: 47, scope: !336)
!340 = !DILocation(line: 280, column: 58, scope: !336)
!341 = !DILocation(line: 280, column: 17, scope: !305)
!342 = !DILocation(line: 282, column: 17, scope: !343)
!343 = distinct !DILexicalBlock(scope: !336, file: !66, line: 281, column: 13)
!344 = !DILocation(line: 285, column: 25, scope: !305)
!345 = !DILocation(line: 285, column: 13, scope: !305)
!346 = !DILocation(line: 285, column: 37, scope: !305)
!347 = !DILocation(line: 287, column: 25, scope: !305)
!348 = !DILocation(line: 287, column: 20, scope: !305)
!349 = !DILocation(line: 287, column: 18, scope: !305)
!350 = !DILocation(line: 288, column: 9, scope: !305)
!351 = !DILocation(line: 290, column: 13, scope: !352)
!352 = distinct !DILexicalBlock(scope: !295, file: !66, line: 290, column: 13)
!353 = !DILocation(line: 290, column: 27, scope: !352)
!354 = !DILocation(line: 290, column: 13, scope: !295)
!355 = !DILocation(line: 292, column: 26, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !66, line: 291, column: 9)
!357 = !DILocation(line: 292, column: 13, scope: !356)
!358 = !DILocation(line: 293, column: 9, scope: !356)
!359 = !DILocalVariable(name: "buffer", scope: !360, file: !66, line: 311, type: !162)
!360 = distinct !DILexicalBlock(scope: !290, file: !66, line: 310, column: 5)
!361 = !DILocation(line: 311, column: 13, scope: !360)
!362 = !DILocation(line: 313, column: 13, scope: !363)
!363 = distinct !DILexicalBlock(scope: !360, file: !66, line: 313, column: 13)
!364 = !DILocation(line: 313, column: 18, scope: !363)
!365 = !DILocation(line: 313, column: 23, scope: !363)
!366 = !DILocation(line: 313, column: 26, scope: !363)
!367 = !DILocation(line: 313, column: 31, scope: !363)
!368 = !DILocation(line: 313, column: 13, scope: !360)
!369 = !DILocation(line: 315, column: 33, scope: !370)
!370 = distinct !DILexicalBlock(scope: !363, file: !66, line: 314, column: 9)
!371 = !DILocation(line: 315, column: 26, scope: !370)
!372 = !DILocation(line: 315, column: 13, scope: !370)
!373 = !DILocation(line: 316, column: 9, scope: !370)
!374 = !DILocation(line: 319, column: 13, scope: !375)
!375 = distinct !DILexicalBlock(scope: !363, file: !66, line: 318, column: 9)
!376 = !DILocation(line: 328, column: 1, scope: !290)
!377 = distinct !DISubprogram(name: "goodG2B1", scope: !66, file: !66, line: 331, type: !67, scopeLine: 332, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!378 = !DILocalVariable(name: "data", scope: !377, file: !66, line: 333, type: !71)
!379 = !DILocation(line: 333, column: 9, scope: !377)
!380 = !DILocation(line: 335, column: 10, scope: !377)
!381 = !DILocation(line: 345, column: 14, scope: !377)
!382 = !DILocalVariable(name: "buffer", scope: !383, file: !66, line: 352, type: !162)
!383 = distinct !DILexicalBlock(scope: !377, file: !66, line: 351, column: 5)
!384 = !DILocation(line: 352, column: 13, scope: !383)
!385 = !DILocation(line: 355, column: 13, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !66, line: 355, column: 13)
!387 = !DILocation(line: 355, column: 18, scope: !386)
!388 = !DILocation(line: 355, column: 13, scope: !383)
!389 = !DILocation(line: 357, column: 33, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !66, line: 356, column: 9)
!391 = !DILocation(line: 357, column: 26, scope: !390)
!392 = !DILocation(line: 357, column: 13, scope: !390)
!393 = !DILocation(line: 358, column: 9, scope: !390)
!394 = !DILocation(line: 361, column: 13, scope: !395)
!395 = distinct !DILexicalBlock(scope: !386, file: !66, line: 360, column: 9)
!396 = !DILocation(line: 370, column: 1, scope: !377)
!397 = distinct !DISubprogram(name: "goodG2B2", scope: !66, file: !66, line: 373, type: !67, scopeLine: 374, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!398 = !DILocalVariable(name: "data", scope: !397, file: !66, line: 375, type: !71)
!399 = !DILocation(line: 375, column: 9, scope: !397)
!400 = !DILocation(line: 377, column: 10, scope: !397)
!401 = !DILocation(line: 383, column: 14, scope: !397)
!402 = !DILocalVariable(name: "buffer", scope: !403, file: !66, line: 394, type: !162)
!403 = distinct !DILexicalBlock(scope: !397, file: !66, line: 393, column: 5)
!404 = !DILocation(line: 394, column: 13, scope: !403)
!405 = !DILocation(line: 397, column: 13, scope: !406)
!406 = distinct !DILexicalBlock(scope: !403, file: !66, line: 397, column: 13)
!407 = !DILocation(line: 397, column: 18, scope: !406)
!408 = !DILocation(line: 397, column: 13, scope: !403)
!409 = !DILocation(line: 399, column: 33, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !66, line: 398, column: 9)
!411 = !DILocation(line: 399, column: 26, scope: !410)
!412 = !DILocation(line: 399, column: 13, scope: !410)
!413 = !DILocation(line: 400, column: 9, scope: !410)
!414 = !DILocation(line: 403, column: 13, scope: !415)
!415 = distinct !DILexicalBlock(scope: !406, file: !66, line: 402, column: 9)
!416 = !DILocation(line: 412, column: 1, scope: !397)
