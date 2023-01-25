; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_42.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_42_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  %0 = load i32, i32* %data, align 4, !dbg !74
  %call = call i32 @badSource(i32 %0), !dbg !75
  store i32 %call, i32* %data, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !77, metadata !DIExpression()), !dbg !82
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !82
  %2 = load i32, i32* %data, align 4, !dbg !83
  %cmp = icmp sge i32 %2, 0, !dbg !85
  br i1 %cmp, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !87
  %idxprom = sext i32 %3 to i64, !dbg !89
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !89
  %4 = load i32, i32* %arrayidx, align 4, !dbg !89
  call void @printIntLine(i32 %4), !dbg !90
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !94
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @badSource(i32 %data) #0 !dbg !95 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !100, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !103, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !126, metadata !DIExpression()), !dbg !127
  store i32 -1, i32* %connectSocket, align 4, !dbg !127
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  br label %do.body, !dbg !130

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !131
  store i32 %call, i32* %connectSocket, align 4, !dbg !133
  %0 = load i32, i32* %connectSocket, align 4, !dbg !134
  %cmp = icmp eq i32 %0, -1, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !138

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !140
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !141
  store i16 2, i16* %sin_family, align 4, !dbg !142
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0)) #7, !dbg !143
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !144
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !145
  store i32 %call1, i32* %s_addr, align 4, !dbg !146
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !147
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !148
  store i16 %call2, i16* %sin_port, align 2, !dbg !149
  %2 = load i32, i32* %connectSocket, align 4, !dbg !150
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !152
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !153
  %cmp4 = icmp eq i32 %call3, -1, !dbg !154
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !155

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !156

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !158
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !160
  %conv = trunc i64 %call7 to i32, !dbg !160
  store i32 %conv, i32* %recvResult, align 4, !dbg !161
  %5 = load i32, i32* %recvResult, align 4, !dbg !162
  %cmp8 = icmp eq i32 %5, -1, !dbg !164
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !165

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !166
  %cmp10 = icmp eq i32 %6, 0, !dbg !167
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !168

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !169

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !171
  %idxprom = sext i32 %7 to i64, !dbg !172
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !172
  store i8 0, i8* %arrayidx, align 1, !dbg !173
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !174
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !175
  store i32 %call15, i32* %data.addr, align 4, !dbg !176
  br label %do.end, !dbg !177

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !178
  %cmp16 = icmp ne i32 %8, -1, !dbg !180
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !181

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !182
  %call19 = call i32 @close(i32 %9), !dbg !184
  br label %if.end20, !dbg !185

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data.addr, align 4, !dbg !186
  ret i32 %10, !dbg !187
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_42_good() #0 !dbg !188 {
entry:
  call void @goodB2G(), !dbg !189
  call void @goodG2B(), !dbg !190
  ret void, !dbg !191
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !192 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !197, metadata !DIExpression()), !dbg !198
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !199, metadata !DIExpression()), !dbg !200
  %call = call i64 @time(i64* null) #7, !dbg !201
  %conv = trunc i64 %call to i32, !dbg !202
  call void @srand(i32 %conv) #7, !dbg !203
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !204
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_42_good(), !dbg !205
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !206
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !207
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_42_bad(), !dbg !208
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !209
  ret i32 0, !dbg !210
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #4

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #4

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #5

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #3

declare dso_local i64 @recv(i32, i8*, i64, i32) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !211 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 -1, i32* %data, align 4, !dbg !214
  %0 = load i32, i32* %data, align 4, !dbg !215
  %call = call i32 @goodB2GSource(i32 %0), !dbg !216
  store i32 %call, i32* %data, align 4, !dbg !217
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !218, metadata !DIExpression()), !dbg !220
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !220
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !220
  %2 = load i32, i32* %data, align 4, !dbg !221
  %cmp = icmp sge i32 %2, 0, !dbg !223
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !224

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !225
  %cmp1 = icmp slt i32 %3, 10, !dbg !226
  br i1 %cmp1, label %if.then, label %if.else, !dbg !227

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !228
  %idxprom = sext i32 %4 to i64, !dbg !230
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !230
  %5 = load i32, i32* %arrayidx, align 4, !dbg !230
  call void @printIntLine(i32 %5), !dbg !231
  br label %if.end, !dbg !232

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !233
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !235
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodB2GSource(i32 %data) #0 !dbg !236 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !237, metadata !DIExpression()), !dbg !238
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
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0)) #7, !dbg !261
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
  store i32 %call15, i32* %data.addr, align 4, !dbg !294
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
  %10 = load i32, i32* %data.addr, align 4, !dbg !304
  ret i32 %10, !dbg !305
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !306 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !307, metadata !DIExpression()), !dbg !308
  store i32 -1, i32* %data, align 4, !dbg !309
  %0 = load i32, i32* %data, align 4, !dbg !310
  %call = call i32 @goodG2BSource(i32 %0), !dbg !311
  store i32 %call, i32* %data, align 4, !dbg !312
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !313, metadata !DIExpression()), !dbg !315
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !315
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !315
  %2 = load i32, i32* %data, align 4, !dbg !316
  %cmp = icmp sge i32 %2, 0, !dbg !318
  br i1 %cmp, label %if.then, label %if.else, !dbg !319

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !320
  %idxprom = sext i32 %3 to i64, !dbg !322
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !322
  %4 = load i32, i32* %arrayidx, align 4, !dbg !322
  call void @printIntLine(i32 %4), !dbg !323
  br label %if.end, !dbg !324

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !325
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !327
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @goodG2BSource(i32 %data) #0 !dbg !328 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !329, metadata !DIExpression()), !dbg !330
  store i32 7, i32* %data.addr, align 4, !dbg !331
  %0 = load i32, i32* %data.addr, align 4, !dbg !332
  ret i32 %0, !dbg !333
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_42.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!5, !46}
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
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_42_bad", scope: !66, file: !66, line: 105, type: !67, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_42.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 107, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 107, column: 9, scope: !65)
!73 = !DILocation(line: 109, column: 10, scope: !65)
!74 = !DILocation(line: 110, column: 22, scope: !65)
!75 = !DILocation(line: 110, column: 12, scope: !65)
!76 = !DILocation(line: 110, column: 10, scope: !65)
!77 = !DILocalVariable(name: "buffer", scope: !78, file: !66, line: 112, type: !79)
!78 = distinct !DILexicalBlock(scope: !65, file: !66, line: 111, column: 5)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 10)
!82 = !DILocation(line: 112, column: 13, scope: !78)
!83 = !DILocation(line: 115, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !66, line: 115, column: 13)
!85 = !DILocation(line: 115, column: 18, scope: !84)
!86 = !DILocation(line: 115, column: 13, scope: !78)
!87 = !DILocation(line: 117, column: 33, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !66, line: 116, column: 9)
!89 = !DILocation(line: 117, column: 26, scope: !88)
!90 = !DILocation(line: 117, column: 13, scope: !88)
!91 = !DILocation(line: 118, column: 9, scope: !88)
!92 = !DILocation(line: 121, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !84, file: !66, line: 120, column: 9)
!94 = !DILocation(line: 124, column: 1, scope: !65)
!95 = distinct !DISubprogram(name: "badSource", scope: !66, file: !66, line: 44, type: !96, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!96 = !DISubroutineType(types: !97)
!97 = !{!71, !71}
!98 = !DILocalVariable(name: "data", arg: 1, scope: !95, file: !66, line: 44, type: !71)
!99 = !DILocation(line: 44, column: 26, scope: !95)
!100 = !DILocalVariable(name: "recvResult", scope: !101, file: !66, line: 51, type: !71)
!101 = distinct !DILexicalBlock(scope: !95, file: !66, line: 46, column: 5)
!102 = !DILocation(line: 51, column: 13, scope: !101)
!103 = !DILocalVariable(name: "service", scope: !101, file: !66, line: 52, type: !104)
!104 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !105)
!105 = !{!106, !107, !113, !120}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !104, file: !17, line: 240, baseType: !51, size: 16)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !104, file: !17, line: 241, baseType: !108, size: 16, offset: 16)
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !109)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !110, line: 25, baseType: !111)
!110 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !112, line: 40, baseType: !53)
!112 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!113 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !104, file: !17, line: 242, baseType: !114, size: 32, offset: 32)
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !115)
!115 = !{!116}
!116 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !114, file: !17, line: 33, baseType: !117, size: 32)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !118)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !110, line: 26, baseType: !119)
!119 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !112, line: 42, baseType: !5)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !104, file: !17, line: 245, baseType: !121, size: 64, offset: 64)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !122, size: 64, elements: !123)
!122 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!123 = !{!124}
!124 = !DISubrange(count: 8)
!125 = !DILocation(line: 52, column: 28, scope: !101)
!126 = !DILocalVariable(name: "connectSocket", scope: !101, file: !66, line: 53, type: !71)
!127 = !DILocation(line: 53, column: 16, scope: !101)
!128 = !DILocalVariable(name: "inputBuffer", scope: !101, file: !66, line: 54, type: !55)
!129 = !DILocation(line: 54, column: 14, scope: !101)
!130 = !DILocation(line: 55, column: 9, scope: !101)
!131 = !DILocation(line: 65, column: 29, scope: !132)
!132 = distinct !DILexicalBlock(scope: !101, file: !66, line: 56, column: 9)
!133 = !DILocation(line: 65, column: 27, scope: !132)
!134 = !DILocation(line: 66, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !66, line: 66, column: 17)
!136 = !DILocation(line: 66, column: 31, scope: !135)
!137 = !DILocation(line: 66, column: 17, scope: !132)
!138 = !DILocation(line: 68, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !66, line: 67, column: 13)
!140 = !DILocation(line: 70, column: 13, scope: !132)
!141 = !DILocation(line: 71, column: 21, scope: !132)
!142 = !DILocation(line: 71, column: 32, scope: !132)
!143 = !DILocation(line: 72, column: 39, scope: !132)
!144 = !DILocation(line: 72, column: 21, scope: !132)
!145 = !DILocation(line: 72, column: 30, scope: !132)
!146 = !DILocation(line: 72, column: 37, scope: !132)
!147 = !DILocation(line: 73, column: 32, scope: !132)
!148 = !DILocation(line: 73, column: 21, scope: !132)
!149 = !DILocation(line: 73, column: 30, scope: !132)
!150 = !DILocation(line: 74, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !132, file: !66, line: 74, column: 17)
!152 = !DILocation(line: 74, column: 40, scope: !151)
!153 = !DILocation(line: 74, column: 17, scope: !151)
!154 = !DILocation(line: 74, column: 85, scope: !151)
!155 = !DILocation(line: 74, column: 17, scope: !132)
!156 = !DILocation(line: 76, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !151, file: !66, line: 75, column: 13)
!158 = !DILocation(line: 80, column: 31, scope: !132)
!159 = !DILocation(line: 80, column: 46, scope: !132)
!160 = !DILocation(line: 80, column: 26, scope: !132)
!161 = !DILocation(line: 80, column: 24, scope: !132)
!162 = !DILocation(line: 81, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !132, file: !66, line: 81, column: 17)
!164 = !DILocation(line: 81, column: 28, scope: !163)
!165 = !DILocation(line: 81, column: 44, scope: !163)
!166 = !DILocation(line: 81, column: 47, scope: !163)
!167 = !DILocation(line: 81, column: 58, scope: !163)
!168 = !DILocation(line: 81, column: 17, scope: !132)
!169 = !DILocation(line: 83, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !66, line: 82, column: 13)
!171 = !DILocation(line: 86, column: 25, scope: !132)
!172 = !DILocation(line: 86, column: 13, scope: !132)
!173 = !DILocation(line: 86, column: 37, scope: !132)
!174 = !DILocation(line: 88, column: 25, scope: !132)
!175 = !DILocation(line: 88, column: 20, scope: !132)
!176 = !DILocation(line: 88, column: 18, scope: !132)
!177 = !DILocation(line: 89, column: 9, scope: !132)
!178 = !DILocation(line: 91, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !101, file: !66, line: 91, column: 13)
!180 = !DILocation(line: 91, column: 27, scope: !179)
!181 = !DILocation(line: 91, column: 13, scope: !101)
!182 = !DILocation(line: 93, column: 26, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !66, line: 92, column: 9)
!184 = !DILocation(line: 93, column: 13, scope: !183)
!185 = !DILocation(line: 94, column: 9, scope: !183)
!186 = !DILocation(line: 102, column: 12, scope: !95)
!187 = !DILocation(line: 102, column: 5, scope: !95)
!188 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_42_good", scope: !66, file: !66, line: 242, type: !67, scopeLine: 243, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!189 = !DILocation(line: 244, column: 5, scope: !188)
!190 = !DILocation(line: 245, column: 5, scope: !188)
!191 = !DILocation(line: 246, column: 1, scope: !188)
!192 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 257, type: !193, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!193 = !DISubroutineType(types: !194)
!194 = !{!71, !71, !195}
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!197 = !DILocalVariable(name: "argc", arg: 1, scope: !192, file: !66, line: 257, type: !71)
!198 = !DILocation(line: 257, column: 14, scope: !192)
!199 = !DILocalVariable(name: "argv", arg: 2, scope: !192, file: !66, line: 257, type: !195)
!200 = !DILocation(line: 257, column: 27, scope: !192)
!201 = !DILocation(line: 260, column: 22, scope: !192)
!202 = !DILocation(line: 260, column: 12, scope: !192)
!203 = !DILocation(line: 260, column: 5, scope: !192)
!204 = !DILocation(line: 262, column: 5, scope: !192)
!205 = !DILocation(line: 263, column: 5, scope: !192)
!206 = !DILocation(line: 264, column: 5, scope: !192)
!207 = !DILocation(line: 267, column: 5, scope: !192)
!208 = !DILocation(line: 268, column: 5, scope: !192)
!209 = !DILocation(line: 269, column: 5, scope: !192)
!210 = !DILocation(line: 271, column: 5, scope: !192)
!211 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 222, type: !67, scopeLine: 223, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!212 = !DILocalVariable(name: "data", scope: !211, file: !66, line: 224, type: !71)
!213 = !DILocation(line: 224, column: 9, scope: !211)
!214 = !DILocation(line: 226, column: 10, scope: !211)
!215 = !DILocation(line: 227, column: 26, scope: !211)
!216 = !DILocation(line: 227, column: 12, scope: !211)
!217 = !DILocation(line: 227, column: 10, scope: !211)
!218 = !DILocalVariable(name: "buffer", scope: !219, file: !66, line: 229, type: !79)
!219 = distinct !DILexicalBlock(scope: !211, file: !66, line: 228, column: 5)
!220 = !DILocation(line: 229, column: 13, scope: !219)
!221 = !DILocation(line: 231, column: 13, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !66, line: 231, column: 13)
!223 = !DILocation(line: 231, column: 18, scope: !222)
!224 = !DILocation(line: 231, column: 23, scope: !222)
!225 = !DILocation(line: 231, column: 26, scope: !222)
!226 = !DILocation(line: 231, column: 31, scope: !222)
!227 = !DILocation(line: 231, column: 13, scope: !219)
!228 = !DILocation(line: 233, column: 33, scope: !229)
!229 = distinct !DILexicalBlock(scope: !222, file: !66, line: 232, column: 9)
!230 = !DILocation(line: 233, column: 26, scope: !229)
!231 = !DILocation(line: 233, column: 13, scope: !229)
!232 = !DILocation(line: 234, column: 9, scope: !229)
!233 = !DILocation(line: 237, column: 13, scope: !234)
!234 = distinct !DILexicalBlock(scope: !222, file: !66, line: 236, column: 9)
!235 = !DILocation(line: 240, column: 1, scope: !211)
!236 = distinct !DISubprogram(name: "goodB2GSource", scope: !66, file: !66, line: 161, type: !96, scopeLine: 162, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!237 = !DILocalVariable(name: "data", arg: 1, scope: !236, file: !66, line: 161, type: !71)
!238 = !DILocation(line: 161, column: 30, scope: !236)
!239 = !DILocalVariable(name: "recvResult", scope: !240, file: !66, line: 168, type: !71)
!240 = distinct !DILexicalBlock(scope: !236, file: !66, line: 163, column: 5)
!241 = !DILocation(line: 168, column: 13, scope: !240)
!242 = !DILocalVariable(name: "service", scope: !240, file: !66, line: 169, type: !104)
!243 = !DILocation(line: 169, column: 28, scope: !240)
!244 = !DILocalVariable(name: "connectSocket", scope: !240, file: !66, line: 170, type: !71)
!245 = !DILocation(line: 170, column: 16, scope: !240)
!246 = !DILocalVariable(name: "inputBuffer", scope: !240, file: !66, line: 171, type: !55)
!247 = !DILocation(line: 171, column: 14, scope: !240)
!248 = !DILocation(line: 172, column: 9, scope: !240)
!249 = !DILocation(line: 182, column: 29, scope: !250)
!250 = distinct !DILexicalBlock(scope: !240, file: !66, line: 173, column: 9)
!251 = !DILocation(line: 182, column: 27, scope: !250)
!252 = !DILocation(line: 183, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !66, line: 183, column: 17)
!254 = !DILocation(line: 183, column: 31, scope: !253)
!255 = !DILocation(line: 183, column: 17, scope: !250)
!256 = !DILocation(line: 185, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !66, line: 184, column: 13)
!258 = !DILocation(line: 187, column: 13, scope: !250)
!259 = !DILocation(line: 188, column: 21, scope: !250)
!260 = !DILocation(line: 188, column: 32, scope: !250)
!261 = !DILocation(line: 189, column: 39, scope: !250)
!262 = !DILocation(line: 189, column: 21, scope: !250)
!263 = !DILocation(line: 189, column: 30, scope: !250)
!264 = !DILocation(line: 189, column: 37, scope: !250)
!265 = !DILocation(line: 190, column: 32, scope: !250)
!266 = !DILocation(line: 190, column: 21, scope: !250)
!267 = !DILocation(line: 190, column: 30, scope: !250)
!268 = !DILocation(line: 191, column: 25, scope: !269)
!269 = distinct !DILexicalBlock(scope: !250, file: !66, line: 191, column: 17)
!270 = !DILocation(line: 191, column: 40, scope: !269)
!271 = !DILocation(line: 191, column: 17, scope: !269)
!272 = !DILocation(line: 191, column: 85, scope: !269)
!273 = !DILocation(line: 191, column: 17, scope: !250)
!274 = !DILocation(line: 193, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !66, line: 192, column: 13)
!276 = !DILocation(line: 197, column: 31, scope: !250)
!277 = !DILocation(line: 197, column: 46, scope: !250)
!278 = !DILocation(line: 197, column: 26, scope: !250)
!279 = !DILocation(line: 197, column: 24, scope: !250)
!280 = !DILocation(line: 198, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !250, file: !66, line: 198, column: 17)
!282 = !DILocation(line: 198, column: 28, scope: !281)
!283 = !DILocation(line: 198, column: 44, scope: !281)
!284 = !DILocation(line: 198, column: 47, scope: !281)
!285 = !DILocation(line: 198, column: 58, scope: !281)
!286 = !DILocation(line: 198, column: 17, scope: !250)
!287 = !DILocation(line: 200, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !281, file: !66, line: 199, column: 13)
!289 = !DILocation(line: 203, column: 25, scope: !250)
!290 = !DILocation(line: 203, column: 13, scope: !250)
!291 = !DILocation(line: 203, column: 37, scope: !250)
!292 = !DILocation(line: 205, column: 25, scope: !250)
!293 = !DILocation(line: 205, column: 20, scope: !250)
!294 = !DILocation(line: 205, column: 18, scope: !250)
!295 = !DILocation(line: 206, column: 9, scope: !250)
!296 = !DILocation(line: 208, column: 13, scope: !297)
!297 = distinct !DILexicalBlock(scope: !240, file: !66, line: 208, column: 13)
!298 = !DILocation(line: 208, column: 27, scope: !297)
!299 = !DILocation(line: 208, column: 13, scope: !240)
!300 = !DILocation(line: 210, column: 26, scope: !301)
!301 = distinct !DILexicalBlock(scope: !297, file: !66, line: 209, column: 9)
!302 = !DILocation(line: 210, column: 13, scope: !301)
!303 = !DILocation(line: 211, column: 9, scope: !301)
!304 = !DILocation(line: 219, column: 12, scope: !236)
!305 = !DILocation(line: 219, column: 5, scope: !236)
!306 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 139, type: !67, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!307 = !DILocalVariable(name: "data", scope: !306, file: !66, line: 141, type: !71)
!308 = !DILocation(line: 141, column: 9, scope: !306)
!309 = !DILocation(line: 143, column: 10, scope: !306)
!310 = !DILocation(line: 144, column: 26, scope: !306)
!311 = !DILocation(line: 144, column: 12, scope: !306)
!312 = !DILocation(line: 144, column: 10, scope: !306)
!313 = !DILocalVariable(name: "buffer", scope: !314, file: !66, line: 146, type: !79)
!314 = distinct !DILexicalBlock(scope: !306, file: !66, line: 145, column: 5)
!315 = !DILocation(line: 146, column: 13, scope: !314)
!316 = !DILocation(line: 149, column: 13, scope: !317)
!317 = distinct !DILexicalBlock(scope: !314, file: !66, line: 149, column: 13)
!318 = !DILocation(line: 149, column: 18, scope: !317)
!319 = !DILocation(line: 149, column: 13, scope: !314)
!320 = !DILocation(line: 151, column: 33, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !66, line: 150, column: 9)
!322 = !DILocation(line: 151, column: 26, scope: !321)
!323 = !DILocation(line: 151, column: 13, scope: !321)
!324 = !DILocation(line: 152, column: 9, scope: !321)
!325 = !DILocation(line: 155, column: 13, scope: !326)
!326 = distinct !DILexicalBlock(scope: !317, file: !66, line: 154, column: 9)
!327 = !DILocation(line: 158, column: 1, scope: !306)
!328 = distinct !DISubprogram(name: "goodG2BSource", scope: !66, file: !66, line: 131, type: !96, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!329 = !DILocalVariable(name: "data", arg: 1, scope: !328, file: !66, line: 131, type: !71)
!330 = !DILocation(line: 131, column: 30, scope: !328)
!331 = !DILocation(line: 135, column: 10, scope: !328)
!332 = !DILocation(line: 136, column: 12, scope: !328)
!333 = !DILocation(line: 136, column: 5, scope: !328)
