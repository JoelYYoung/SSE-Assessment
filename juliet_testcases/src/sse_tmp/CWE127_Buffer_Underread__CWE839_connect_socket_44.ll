; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_44.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_44.c"
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
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_44_bad() #0 !dbg !65 {
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
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !169, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !171, metadata !DIExpression()), !dbg !176
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !176
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !176
  %1 = load i32, i32* %data.addr, align 4, !dbg !177
  %cmp = icmp slt i32 %1, 10, !dbg !179
  br i1 %cmp, label %if.then, label %if.else, !dbg !180

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !181
  %idxprom = sext i32 %2 to i64, !dbg !183
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !183
  %3 = load i32, i32* %arrayidx, align 4, !dbg !183
  call void @printIntLine(i32 %3), !dbg !184
  br label %if.end, !dbg !185

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !186
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !188
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
define dso_local void @CWE127_Buffer_Underread__CWE839_connect_socket_44_good() #0 !dbg !189 {
entry:
  call void @goodG2B(), !dbg !190
  call void @goodB2G(), !dbg !191
  ret void, !dbg !192
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !193 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !198, metadata !DIExpression()), !dbg !199
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !200, metadata !DIExpression()), !dbg !201
  %call = call i64 @time(i64* null) #7, !dbg !202
  %conv = trunc i64 %call to i32, !dbg !203
  call void @srand(i32 %conv) #7, !dbg !204
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !205
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_44_good(), !dbg !206
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !207
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !208
  call void @CWE127_Buffer_Underread__CWE839_connect_socket_44_bad(), !dbg !209
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !210
  ret i32 0, !dbg !211
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !212 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !213, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !215, metadata !DIExpression()), !dbg !216
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !216
  store i32 -1, i32* %data, align 4, !dbg !217
  store i32 7, i32* %data, align 4, !dbg !218
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !219
  %1 = load i32, i32* %data, align 4, !dbg !220
  call void %0(i32 %1), !dbg !219
  ret void, !dbg !221
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !222 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !223, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !225, metadata !DIExpression()), !dbg !227
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !227
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !227
  %1 = load i32, i32* %data.addr, align 4, !dbg !228
  %cmp = icmp slt i32 %1, 10, !dbg !230
  br i1 %cmp, label %if.then, label %if.else, !dbg !231

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !232
  %idxprom = sext i32 %2 to i64, !dbg !234
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !234
  %3 = load i32, i32* %arrayidx, align 4, !dbg !234
  call void @printIntLine(i32 %3), !dbg !235
  br label %if.end, !dbg !236

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !237
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !239
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !240 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !241, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !243, metadata !DIExpression()), !dbg !244
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !244
  store i32 -1, i32* %data, align 4, !dbg !245
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !246, metadata !DIExpression()), !dbg !248
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !249, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !251, metadata !DIExpression()), !dbg !252
  store i32 -1, i32* %connectSocket, align 4, !dbg !252
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !253, metadata !DIExpression()), !dbg !254
  br label %do.body, !dbg !255

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !256
  store i32 %call, i32* %connectSocket, align 4, !dbg !258
  %0 = load i32, i32* %connectSocket, align 4, !dbg !259
  %cmp = icmp eq i32 %0, -1, !dbg !261
  br i1 %cmp, label %if.then, label %if.end, !dbg !262

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !263

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !265
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !265
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !266
  store i16 2, i16* %sin_family, align 4, !dbg !267
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !268
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !269
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !270
  store i32 %call1, i32* %s_addr, align 4, !dbg !271
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !272
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !273
  store i16 %call2, i16* %sin_port, align 2, !dbg !274
  %2 = load i32, i32* %connectSocket, align 4, !dbg !275
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !277
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !278
  %cmp4 = icmp eq i32 %call3, -1, !dbg !279
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !280

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !281

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !283
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !284
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !285
  %conv = trunc i64 %call7 to i32, !dbg !285
  store i32 %conv, i32* %recvResult, align 4, !dbg !286
  %5 = load i32, i32* %recvResult, align 4, !dbg !287
  %cmp8 = icmp eq i32 %5, -1, !dbg !289
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !290

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !291
  %cmp10 = icmp eq i32 %6, 0, !dbg !292
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !293

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !294

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !296
  %idxprom = sext i32 %7 to i64, !dbg !297
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !297
  store i8 0, i8* %arrayidx, align 1, !dbg !298
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !299
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !300
  store i32 %call15, i32* %data, align 4, !dbg !301
  br label %do.end, !dbg !302

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !303
  %cmp16 = icmp ne i32 %8, -1, !dbg !305
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !306

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !307
  %call19 = call i32 @close(i32 %9), !dbg !309
  br label %if.end20, !dbg !310

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !311
  %11 = load i32, i32* %data, align 4, !dbg !312
  call void %10(i32 %11), !dbg !311
  ret void, !dbg !313
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !314 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !315, metadata !DIExpression()), !dbg !316
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !317, metadata !DIExpression()), !dbg !319
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !319
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !319
  %1 = load i32, i32* %data.addr, align 4, !dbg !320
  %cmp = icmp sge i32 %1, 0, !dbg !322
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !323

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !324
  %cmp1 = icmp slt i32 %2, 10, !dbg !325
  br i1 %cmp1, label %if.then, label %if.else, !dbg !326

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !327
  %idxprom = sext i32 %3 to i64, !dbg !329
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !329
  %4 = load i32, i32* %arrayidx, align 4, !dbg !329
  call void @printIntLine(i32 %4), !dbg !330
  br label %if.end, !dbg !331

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !332
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !334
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_44_bad", scope: !66, file: !66, line: 61, type: !67, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_connect_socket_44.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 63, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 63, column: 9, scope: !65)
!73 = !DILocalVariable(name: "funcPtr", scope: !65, file: !66, line: 65, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DISubroutineType(types: !76)
!76 = !{null, !71}
!77 = !DILocation(line: 65, column: 12, scope: !65)
!78 = !DILocation(line: 67, column: 10, scope: !65)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !66, line: 73, type: !71)
!80 = distinct !DILexicalBlock(scope: !65, file: !66, line: 68, column: 5)
!81 = !DILocation(line: 73, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !66, line: 74, type: !83)
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
!104 = !DILocation(line: 74, column: 28, scope: !80)
!105 = !DILocalVariable(name: "connectSocket", scope: !80, file: !66, line: 75, type: !71)
!106 = !DILocation(line: 75, column: 16, scope: !80)
!107 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !66, line: 76, type: !55)
!108 = !DILocation(line: 76, column: 14, scope: !80)
!109 = !DILocation(line: 77, column: 9, scope: !80)
!110 = !DILocation(line: 87, column: 29, scope: !111)
!111 = distinct !DILexicalBlock(scope: !80, file: !66, line: 78, column: 9)
!112 = !DILocation(line: 87, column: 27, scope: !111)
!113 = !DILocation(line: 88, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !66, line: 88, column: 17)
!115 = !DILocation(line: 88, column: 31, scope: !114)
!116 = !DILocation(line: 88, column: 17, scope: !111)
!117 = !DILocation(line: 90, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !66, line: 89, column: 13)
!119 = !DILocation(line: 92, column: 13, scope: !111)
!120 = !DILocation(line: 93, column: 21, scope: !111)
!121 = !DILocation(line: 93, column: 32, scope: !111)
!122 = !DILocation(line: 94, column: 39, scope: !111)
!123 = !DILocation(line: 94, column: 21, scope: !111)
!124 = !DILocation(line: 94, column: 30, scope: !111)
!125 = !DILocation(line: 94, column: 37, scope: !111)
!126 = !DILocation(line: 95, column: 32, scope: !111)
!127 = !DILocation(line: 95, column: 21, scope: !111)
!128 = !DILocation(line: 95, column: 30, scope: !111)
!129 = !DILocation(line: 96, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !111, file: !66, line: 96, column: 17)
!131 = !DILocation(line: 96, column: 40, scope: !130)
!132 = !DILocation(line: 96, column: 17, scope: !130)
!133 = !DILocation(line: 96, column: 85, scope: !130)
!134 = !DILocation(line: 96, column: 17, scope: !111)
!135 = !DILocation(line: 98, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !66, line: 97, column: 13)
!137 = !DILocation(line: 102, column: 31, scope: !111)
!138 = !DILocation(line: 102, column: 46, scope: !111)
!139 = !DILocation(line: 102, column: 26, scope: !111)
!140 = !DILocation(line: 102, column: 24, scope: !111)
!141 = !DILocation(line: 103, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !111, file: !66, line: 103, column: 17)
!143 = !DILocation(line: 103, column: 28, scope: !142)
!144 = !DILocation(line: 103, column: 44, scope: !142)
!145 = !DILocation(line: 103, column: 47, scope: !142)
!146 = !DILocation(line: 103, column: 58, scope: !142)
!147 = !DILocation(line: 103, column: 17, scope: !111)
!148 = !DILocation(line: 105, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !142, file: !66, line: 104, column: 13)
!150 = !DILocation(line: 108, column: 25, scope: !111)
!151 = !DILocation(line: 108, column: 13, scope: !111)
!152 = !DILocation(line: 108, column: 37, scope: !111)
!153 = !DILocation(line: 110, column: 25, scope: !111)
!154 = !DILocation(line: 110, column: 20, scope: !111)
!155 = !DILocation(line: 110, column: 18, scope: !111)
!156 = !DILocation(line: 111, column: 9, scope: !111)
!157 = !DILocation(line: 113, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !80, file: !66, line: 113, column: 13)
!159 = !DILocation(line: 113, column: 27, scope: !158)
!160 = !DILocation(line: 113, column: 13, scope: !80)
!161 = !DILocation(line: 115, column: 26, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !66, line: 114, column: 9)
!163 = !DILocation(line: 115, column: 13, scope: !162)
!164 = !DILocation(line: 116, column: 9, scope: !162)
!165 = !DILocation(line: 125, column: 5, scope: !65)
!166 = !DILocation(line: 125, column: 13, scope: !65)
!167 = !DILocation(line: 126, column: 1, scope: !65)
!168 = distinct !DISubprogram(name: "badSink", scope: !66, file: !66, line: 44, type: !75, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!169 = !DILocalVariable(name: "data", arg: 1, scope: !168, file: !66, line: 44, type: !71)
!170 = !DILocation(line: 44, column: 25, scope: !168)
!171 = !DILocalVariable(name: "buffer", scope: !172, file: !66, line: 47, type: !173)
!172 = distinct !DILexicalBlock(scope: !168, file: !66, line: 46, column: 5)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !174)
!174 = !{!175}
!175 = !DISubrange(count: 10)
!176 = !DILocation(line: 47, column: 13, scope: !172)
!177 = !DILocation(line: 50, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !172, file: !66, line: 50, column: 13)
!179 = !DILocation(line: 50, column: 18, scope: !178)
!180 = !DILocation(line: 50, column: 13, scope: !172)
!181 = !DILocation(line: 52, column: 33, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !66, line: 51, column: 9)
!183 = !DILocation(line: 52, column: 26, scope: !182)
!184 = !DILocation(line: 52, column: 13, scope: !182)
!185 = !DILocation(line: 53, column: 9, scope: !182)
!186 = !DILocation(line: 56, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !178, file: !66, line: 55, column: 9)
!188 = !DILocation(line: 59, column: 1, scope: !168)
!189 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_connect_socket_44_good", scope: !66, file: !66, line: 244, type: !67, scopeLine: 245, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!190 = !DILocation(line: 246, column: 5, scope: !189)
!191 = !DILocation(line: 247, column: 5, scope: !189)
!192 = !DILocation(line: 248, column: 1, scope: !189)
!193 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 258, type: !194, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!194 = !DISubroutineType(types: !195)
!195 = !{!71, !71, !196}
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !197, size: 64)
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!198 = !DILocalVariable(name: "argc", arg: 1, scope: !193, file: !66, line: 258, type: !71)
!199 = !DILocation(line: 258, column: 14, scope: !193)
!200 = !DILocalVariable(name: "argv", arg: 2, scope: !193, file: !66, line: 258, type: !196)
!201 = !DILocation(line: 258, column: 27, scope: !193)
!202 = !DILocation(line: 261, column: 22, scope: !193)
!203 = !DILocation(line: 261, column: 12, scope: !193)
!204 = !DILocation(line: 261, column: 5, scope: !193)
!205 = !DILocation(line: 263, column: 5, scope: !193)
!206 = !DILocation(line: 264, column: 5, scope: !193)
!207 = !DILocation(line: 265, column: 5, scope: !193)
!208 = !DILocation(line: 268, column: 5, scope: !193)
!209 = !DILocation(line: 269, column: 5, scope: !193)
!210 = !DILocation(line: 270, column: 5, scope: !193)
!211 = !DILocation(line: 272, column: 5, scope: !193)
!212 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 150, type: !67, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!213 = !DILocalVariable(name: "data", scope: !212, file: !66, line: 152, type: !71)
!214 = !DILocation(line: 152, column: 9, scope: !212)
!215 = !DILocalVariable(name: "funcPtr", scope: !212, file: !66, line: 153, type: !74)
!216 = !DILocation(line: 153, column: 12, scope: !212)
!217 = !DILocation(line: 155, column: 10, scope: !212)
!218 = !DILocation(line: 158, column: 10, scope: !212)
!219 = !DILocation(line: 159, column: 5, scope: !212)
!220 = !DILocation(line: 159, column: 13, scope: !212)
!221 = !DILocation(line: 160, column: 1, scope: !212)
!222 = distinct !DISubprogram(name: "goodG2BSink", scope: !66, file: !66, line: 133, type: !75, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!223 = !DILocalVariable(name: "data", arg: 1, scope: !222, file: !66, line: 133, type: !71)
!224 = !DILocation(line: 133, column: 29, scope: !222)
!225 = !DILocalVariable(name: "buffer", scope: !226, file: !66, line: 136, type: !173)
!226 = distinct !DILexicalBlock(scope: !222, file: !66, line: 135, column: 5)
!227 = !DILocation(line: 136, column: 13, scope: !226)
!228 = !DILocation(line: 139, column: 13, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !66, line: 139, column: 13)
!230 = !DILocation(line: 139, column: 18, scope: !229)
!231 = !DILocation(line: 139, column: 13, scope: !226)
!232 = !DILocation(line: 141, column: 33, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !66, line: 140, column: 9)
!234 = !DILocation(line: 141, column: 26, scope: !233)
!235 = !DILocation(line: 141, column: 13, scope: !233)
!236 = !DILocation(line: 142, column: 9, scope: !233)
!237 = !DILocation(line: 145, column: 13, scope: !238)
!238 = distinct !DILexicalBlock(scope: !229, file: !66, line: 144, column: 9)
!239 = !DILocation(line: 148, column: 1, scope: !222)
!240 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 179, type: !67, scopeLine: 180, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!241 = !DILocalVariable(name: "data", scope: !240, file: !66, line: 181, type: !71)
!242 = !DILocation(line: 181, column: 9, scope: !240)
!243 = !DILocalVariable(name: "funcPtr", scope: !240, file: !66, line: 182, type: !74)
!244 = !DILocation(line: 182, column: 12, scope: !240)
!245 = !DILocation(line: 184, column: 10, scope: !240)
!246 = !DILocalVariable(name: "recvResult", scope: !247, file: !66, line: 190, type: !71)
!247 = distinct !DILexicalBlock(scope: !240, file: !66, line: 185, column: 5)
!248 = !DILocation(line: 190, column: 13, scope: !247)
!249 = !DILocalVariable(name: "service", scope: !247, file: !66, line: 191, type: !83)
!250 = !DILocation(line: 191, column: 28, scope: !247)
!251 = !DILocalVariable(name: "connectSocket", scope: !247, file: !66, line: 192, type: !71)
!252 = !DILocation(line: 192, column: 16, scope: !247)
!253 = !DILocalVariable(name: "inputBuffer", scope: !247, file: !66, line: 193, type: !55)
!254 = !DILocation(line: 193, column: 14, scope: !247)
!255 = !DILocation(line: 194, column: 9, scope: !247)
!256 = !DILocation(line: 204, column: 29, scope: !257)
!257 = distinct !DILexicalBlock(scope: !247, file: !66, line: 195, column: 9)
!258 = !DILocation(line: 204, column: 27, scope: !257)
!259 = !DILocation(line: 205, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !257, file: !66, line: 205, column: 17)
!261 = !DILocation(line: 205, column: 31, scope: !260)
!262 = !DILocation(line: 205, column: 17, scope: !257)
!263 = !DILocation(line: 207, column: 17, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !66, line: 206, column: 13)
!265 = !DILocation(line: 209, column: 13, scope: !257)
!266 = !DILocation(line: 210, column: 21, scope: !257)
!267 = !DILocation(line: 210, column: 32, scope: !257)
!268 = !DILocation(line: 211, column: 39, scope: !257)
!269 = !DILocation(line: 211, column: 21, scope: !257)
!270 = !DILocation(line: 211, column: 30, scope: !257)
!271 = !DILocation(line: 211, column: 37, scope: !257)
!272 = !DILocation(line: 212, column: 32, scope: !257)
!273 = !DILocation(line: 212, column: 21, scope: !257)
!274 = !DILocation(line: 212, column: 30, scope: !257)
!275 = !DILocation(line: 213, column: 25, scope: !276)
!276 = distinct !DILexicalBlock(scope: !257, file: !66, line: 213, column: 17)
!277 = !DILocation(line: 213, column: 40, scope: !276)
!278 = !DILocation(line: 213, column: 17, scope: !276)
!279 = !DILocation(line: 213, column: 85, scope: !276)
!280 = !DILocation(line: 213, column: 17, scope: !257)
!281 = !DILocation(line: 215, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !276, file: !66, line: 214, column: 13)
!283 = !DILocation(line: 219, column: 31, scope: !257)
!284 = !DILocation(line: 219, column: 46, scope: !257)
!285 = !DILocation(line: 219, column: 26, scope: !257)
!286 = !DILocation(line: 219, column: 24, scope: !257)
!287 = !DILocation(line: 220, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !257, file: !66, line: 220, column: 17)
!289 = !DILocation(line: 220, column: 28, scope: !288)
!290 = !DILocation(line: 220, column: 44, scope: !288)
!291 = !DILocation(line: 220, column: 47, scope: !288)
!292 = !DILocation(line: 220, column: 58, scope: !288)
!293 = !DILocation(line: 220, column: 17, scope: !257)
!294 = !DILocation(line: 222, column: 17, scope: !295)
!295 = distinct !DILexicalBlock(scope: !288, file: !66, line: 221, column: 13)
!296 = !DILocation(line: 225, column: 25, scope: !257)
!297 = !DILocation(line: 225, column: 13, scope: !257)
!298 = !DILocation(line: 225, column: 37, scope: !257)
!299 = !DILocation(line: 227, column: 25, scope: !257)
!300 = !DILocation(line: 227, column: 20, scope: !257)
!301 = !DILocation(line: 227, column: 18, scope: !257)
!302 = !DILocation(line: 228, column: 9, scope: !257)
!303 = !DILocation(line: 230, column: 13, scope: !304)
!304 = distinct !DILexicalBlock(scope: !247, file: !66, line: 230, column: 13)
!305 = !DILocation(line: 230, column: 27, scope: !304)
!306 = !DILocation(line: 230, column: 13, scope: !247)
!307 = !DILocation(line: 232, column: 26, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !66, line: 231, column: 9)
!309 = !DILocation(line: 232, column: 13, scope: !308)
!310 = !DILocation(line: 233, column: 9, scope: !308)
!311 = !DILocation(line: 241, column: 5, scope: !240)
!312 = !DILocation(line: 241, column: 13, scope: !240)
!313 = !DILocation(line: 242, column: 1, scope: !240)
!314 = distinct !DISubprogram(name: "goodB2GSink", scope: !66, file: !66, line: 163, type: !75, scopeLine: 164, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!315 = !DILocalVariable(name: "data", arg: 1, scope: !314, file: !66, line: 163, type: !71)
!316 = !DILocation(line: 163, column: 29, scope: !314)
!317 = !DILocalVariable(name: "buffer", scope: !318, file: !66, line: 166, type: !173)
!318 = distinct !DILexicalBlock(scope: !314, file: !66, line: 165, column: 5)
!319 = !DILocation(line: 166, column: 13, scope: !318)
!320 = !DILocation(line: 168, column: 13, scope: !321)
!321 = distinct !DILexicalBlock(scope: !318, file: !66, line: 168, column: 13)
!322 = !DILocation(line: 168, column: 18, scope: !321)
!323 = !DILocation(line: 168, column: 23, scope: !321)
!324 = !DILocation(line: 168, column: 26, scope: !321)
!325 = !DILocation(line: 168, column: 31, scope: !321)
!326 = !DILocation(line: 168, column: 13, scope: !318)
!327 = !DILocation(line: 170, column: 33, scope: !328)
!328 = distinct !DILexicalBlock(scope: !321, file: !66, line: 169, column: 9)
!329 = !DILocation(line: 170, column: 26, scope: !328)
!330 = !DILocation(line: 170, column: 13, scope: !328)
!331 = !DILocation(line: 171, column: 9, scope: !328)
!332 = !DILocation(line: 174, column: 13, scope: !333)
!333 = distinct !DILexicalBlock(scope: !321, file: !66, line: 173, column: 9)
!334 = !DILocation(line: 177, column: 1, scope: !314)
