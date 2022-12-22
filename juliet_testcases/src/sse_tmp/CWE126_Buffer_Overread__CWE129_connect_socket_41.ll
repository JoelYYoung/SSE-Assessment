; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_41.c"
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
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_41_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  %10 = load i32, i32* %data, align 4, !dbg !160
  call void @badSink(i32 %10), !dbg !161
  ret void, !dbg !162
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
define internal void @badSink(i32 %data) #0 !dbg !163 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !168, metadata !DIExpression()), !dbg !173
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !173
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !173
  %1 = load i32, i32* %data.addr, align 4, !dbg !174
  %cmp = icmp sge i32 %1, 0, !dbg !176
  br i1 %cmp, label %if.then, label %if.else, !dbg !177

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !178
  %idxprom = sext i32 %2 to i64, !dbg !180
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !180
  %3 = load i32, i32* %arrayidx, align 4, !dbg !180
  call void @printIntLine(i32 %3), !dbg !181
  br label %if.end, !dbg !182

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !183
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !185
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_41_good() #0 !dbg !186 {
entry:
  call void @goodB2G(), !dbg !187
  call void @goodG2B(), !dbg !188
  ret void, !dbg !189
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !190 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !195, metadata !DIExpression()), !dbg !196
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !197, metadata !DIExpression()), !dbg !198
  %call = call i64 @time(i64* null) #7, !dbg !199
  %conv = trunc i64 %call to i32, !dbg !200
  call void @srand(i32 %conv) #7, !dbg !201
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !202
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_41_good(), !dbg !203
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !204
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !205
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_41_bad(), !dbg !206
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !207
  ret i32 0, !dbg !208
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !209 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !210, metadata !DIExpression()), !dbg !211
  store i32 -1, i32* %data, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !213, metadata !DIExpression()), !dbg !215
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
  %10 = load i32, i32* %data, align 4, !dbg !278
  call void @goodB2GSink(i32 %10), !dbg !279
  ret void, !dbg !280
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !281 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !282, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !284, metadata !DIExpression()), !dbg !286
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !286
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !286
  %1 = load i32, i32* %data.addr, align 4, !dbg !287
  %cmp = icmp sge i32 %1, 0, !dbg !289
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !290

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !291
  %cmp1 = icmp slt i32 %2, 10, !dbg !292
  br i1 %cmp1, label %if.then, label %if.else, !dbg !293

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !294
  %idxprom = sext i32 %3 to i64, !dbg !296
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !296
  %4 = load i32, i32* %arrayidx, align 4, !dbg !296
  call void @printIntLine(i32 %4), !dbg !297
  br label %if.end, !dbg !298

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !299
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !301
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !302 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !303, metadata !DIExpression()), !dbg !304
  store i32 -1, i32* %data, align 4, !dbg !305
  store i32 7, i32* %data, align 4, !dbg !306
  %0 = load i32, i32* %data, align 4, !dbg !307
  call void @goodG2BSink(i32 %0), !dbg !308
  ret void, !dbg !309
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !310 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !311, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !313, metadata !DIExpression()), !dbg !315
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !315
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !315
  %1 = load i32, i32* %data.addr, align 4, !dbg !316
  %cmp = icmp sge i32 %1, 0, !dbg !318
  br i1 %cmp, label %if.then, label %if.else, !dbg !319

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !320
  %idxprom = sext i32 %2 to i64, !dbg !322
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !322
  %3 = load i32, i32* %arrayidx, align 4, !dbg !322
  call void @printIntLine(i32 %3), !dbg !323
  br label %if.end, !dbg !324

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !325
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !327
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_41.c", directory: "/root/SSE-Assessment")
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
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 175, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 177, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 178, baseType: !55, size: 112, offset: 16)
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
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_41_bad", scope: !66, file: !66, line: 61, type: !67, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_41.c", directory: "/root/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 63, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 63, column: 9, scope: !65)
!73 = !DILocation(line: 65, column: 10, scope: !65)
!74 = !DILocalVariable(name: "recvResult", scope: !75, file: !66, line: 71, type: !71)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 66, column: 5)
!76 = !DILocation(line: 71, column: 13, scope: !75)
!77 = !DILocalVariable(name: "service", scope: !75, file: !66, line: 72, type: !78)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 237, size: 128, elements: !79)
!79 = !{!80, !81, !87, !94}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !78, file: !17, line: 239, baseType: !51, size: 16)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !78, file: !17, line: 240, baseType: !82, size: 16, offset: 16)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !84, line: 25, baseType: !85)
!84 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !86, line: 39, baseType: !53)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !78, file: !17, line: 241, baseType: !88, size: 32, offset: 32)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !89)
!89 = !{!90}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !88, file: !17, line: 33, baseType: !91, size: 32)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !84, line: 26, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !86, line: 41, baseType: !5)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !78, file: !17, line: 244, baseType: !95, size: 64, offset: 64)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 64, elements: !97)
!96 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!97 = !{!98}
!98 = !DISubrange(count: 8)
!99 = !DILocation(line: 72, column: 28, scope: !75)
!100 = !DILocalVariable(name: "connectSocket", scope: !75, file: !66, line: 73, type: !71)
!101 = !DILocation(line: 73, column: 16, scope: !75)
!102 = !DILocalVariable(name: "inputBuffer", scope: !75, file: !66, line: 74, type: !55)
!103 = !DILocation(line: 74, column: 14, scope: !75)
!104 = !DILocation(line: 75, column: 9, scope: !75)
!105 = !DILocation(line: 85, column: 29, scope: !106)
!106 = distinct !DILexicalBlock(scope: !75, file: !66, line: 76, column: 9)
!107 = !DILocation(line: 85, column: 27, scope: !106)
!108 = !DILocation(line: 86, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !66, line: 86, column: 17)
!110 = !DILocation(line: 86, column: 31, scope: !109)
!111 = !DILocation(line: 86, column: 17, scope: !106)
!112 = !DILocation(line: 88, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !66, line: 87, column: 13)
!114 = !DILocation(line: 90, column: 13, scope: !106)
!115 = !DILocation(line: 91, column: 21, scope: !106)
!116 = !DILocation(line: 91, column: 32, scope: !106)
!117 = !DILocation(line: 92, column: 39, scope: !106)
!118 = !DILocation(line: 92, column: 21, scope: !106)
!119 = !DILocation(line: 92, column: 30, scope: !106)
!120 = !DILocation(line: 92, column: 37, scope: !106)
!121 = !DILocation(line: 93, column: 32, scope: !106)
!122 = !DILocation(line: 93, column: 21, scope: !106)
!123 = !DILocation(line: 93, column: 30, scope: !106)
!124 = !DILocation(line: 94, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !106, file: !66, line: 94, column: 17)
!126 = !DILocation(line: 94, column: 40, scope: !125)
!127 = !DILocation(line: 94, column: 17, scope: !125)
!128 = !DILocation(line: 94, column: 85, scope: !125)
!129 = !DILocation(line: 94, column: 17, scope: !106)
!130 = !DILocation(line: 96, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !66, line: 95, column: 13)
!132 = !DILocation(line: 100, column: 31, scope: !106)
!133 = !DILocation(line: 100, column: 46, scope: !106)
!134 = !DILocation(line: 100, column: 26, scope: !106)
!135 = !DILocation(line: 100, column: 24, scope: !106)
!136 = !DILocation(line: 101, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !106, file: !66, line: 101, column: 17)
!138 = !DILocation(line: 101, column: 28, scope: !137)
!139 = !DILocation(line: 101, column: 44, scope: !137)
!140 = !DILocation(line: 101, column: 47, scope: !137)
!141 = !DILocation(line: 101, column: 58, scope: !137)
!142 = !DILocation(line: 101, column: 17, scope: !106)
!143 = !DILocation(line: 103, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !66, line: 102, column: 13)
!145 = !DILocation(line: 106, column: 25, scope: !106)
!146 = !DILocation(line: 106, column: 13, scope: !106)
!147 = !DILocation(line: 106, column: 37, scope: !106)
!148 = !DILocation(line: 108, column: 25, scope: !106)
!149 = !DILocation(line: 108, column: 20, scope: !106)
!150 = !DILocation(line: 108, column: 18, scope: !106)
!151 = !DILocation(line: 109, column: 9, scope: !106)
!152 = !DILocation(line: 111, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !75, file: !66, line: 111, column: 13)
!154 = !DILocation(line: 111, column: 27, scope: !153)
!155 = !DILocation(line: 111, column: 13, scope: !75)
!156 = !DILocation(line: 113, column: 26, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !66, line: 112, column: 9)
!158 = !DILocation(line: 113, column: 13, scope: !157)
!159 = !DILocation(line: 114, column: 9, scope: !157)
!160 = !DILocation(line: 122, column: 13, scope: !65)
!161 = !DILocation(line: 122, column: 5, scope: !65)
!162 = !DILocation(line: 123, column: 1, scope: !65)
!163 = distinct !DISubprogram(name: "badSink", scope: !66, file: !66, line: 44, type: !164, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!164 = !DISubroutineType(types: !165)
!165 = !{null, !71}
!166 = !DILocalVariable(name: "data", arg: 1, scope: !163, file: !66, line: 44, type: !71)
!167 = !DILocation(line: 44, column: 25, scope: !163)
!168 = !DILocalVariable(name: "buffer", scope: !169, file: !66, line: 47, type: !170)
!169 = distinct !DILexicalBlock(scope: !163, file: !66, line: 46, column: 5)
!170 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 320, elements: !171)
!171 = !{!172}
!172 = !DISubrange(count: 10)
!173 = !DILocation(line: 47, column: 13, scope: !169)
!174 = !DILocation(line: 50, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !169, file: !66, line: 50, column: 13)
!176 = !DILocation(line: 50, column: 18, scope: !175)
!177 = !DILocation(line: 50, column: 13, scope: !169)
!178 = !DILocation(line: 52, column: 33, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !66, line: 51, column: 9)
!180 = !DILocation(line: 52, column: 26, scope: !179)
!181 = !DILocation(line: 52, column: 13, scope: !179)
!182 = !DILocation(line: 53, column: 9, scope: !179)
!183 = !DILocation(line: 56, column: 13, scope: !184)
!184 = distinct !DILexicalBlock(scope: !175, file: !66, line: 55, column: 9)
!185 = !DILocation(line: 59, column: 1, scope: !163)
!186 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_41_good", scope: !66, file: !66, line: 239, type: !67, scopeLine: 240, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!187 = !DILocation(line: 241, column: 5, scope: !186)
!188 = !DILocation(line: 242, column: 5, scope: !186)
!189 = !DILocation(line: 243, column: 1, scope: !186)
!190 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 254, type: !191, scopeLine: 255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!191 = !DISubroutineType(types: !192)
!192 = !{!71, !71, !193}
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 64)
!194 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!195 = !DILocalVariable(name: "argc", arg: 1, scope: !190, file: !66, line: 254, type: !71)
!196 = !DILocation(line: 254, column: 14, scope: !190)
!197 = !DILocalVariable(name: "argv", arg: 2, scope: !190, file: !66, line: 254, type: !193)
!198 = !DILocation(line: 254, column: 27, scope: !190)
!199 = !DILocation(line: 257, column: 22, scope: !190)
!200 = !DILocation(line: 257, column: 12, scope: !190)
!201 = !DILocation(line: 257, column: 5, scope: !190)
!202 = !DILocation(line: 259, column: 5, scope: !190)
!203 = !DILocation(line: 260, column: 5, scope: !190)
!204 = !DILocation(line: 261, column: 5, scope: !190)
!205 = !DILocation(line: 264, column: 5, scope: !190)
!206 = !DILocation(line: 265, column: 5, scope: !190)
!207 = !DILocation(line: 266, column: 5, scope: !190)
!208 = !DILocation(line: 268, column: 5, scope: !190)
!209 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 175, type: !67, scopeLine: 176, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!210 = !DILocalVariable(name: "data", scope: !209, file: !66, line: 177, type: !71)
!211 = !DILocation(line: 177, column: 9, scope: !209)
!212 = !DILocation(line: 179, column: 10, scope: !209)
!213 = !DILocalVariable(name: "recvResult", scope: !214, file: !66, line: 185, type: !71)
!214 = distinct !DILexicalBlock(scope: !209, file: !66, line: 180, column: 5)
!215 = !DILocation(line: 185, column: 13, scope: !214)
!216 = !DILocalVariable(name: "service", scope: !214, file: !66, line: 186, type: !78)
!217 = !DILocation(line: 186, column: 28, scope: !214)
!218 = !DILocalVariable(name: "connectSocket", scope: !214, file: !66, line: 187, type: !71)
!219 = !DILocation(line: 187, column: 16, scope: !214)
!220 = !DILocalVariable(name: "inputBuffer", scope: !214, file: !66, line: 188, type: !55)
!221 = !DILocation(line: 188, column: 14, scope: !214)
!222 = !DILocation(line: 189, column: 9, scope: !214)
!223 = !DILocation(line: 199, column: 29, scope: !224)
!224 = distinct !DILexicalBlock(scope: !214, file: !66, line: 190, column: 9)
!225 = !DILocation(line: 199, column: 27, scope: !224)
!226 = !DILocation(line: 200, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !66, line: 200, column: 17)
!228 = !DILocation(line: 200, column: 31, scope: !227)
!229 = !DILocation(line: 200, column: 17, scope: !224)
!230 = !DILocation(line: 202, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !66, line: 201, column: 13)
!232 = !DILocation(line: 204, column: 13, scope: !224)
!233 = !DILocation(line: 205, column: 21, scope: !224)
!234 = !DILocation(line: 205, column: 32, scope: !224)
!235 = !DILocation(line: 206, column: 39, scope: !224)
!236 = !DILocation(line: 206, column: 21, scope: !224)
!237 = !DILocation(line: 206, column: 30, scope: !224)
!238 = !DILocation(line: 206, column: 37, scope: !224)
!239 = !DILocation(line: 207, column: 32, scope: !224)
!240 = !DILocation(line: 207, column: 21, scope: !224)
!241 = !DILocation(line: 207, column: 30, scope: !224)
!242 = !DILocation(line: 208, column: 25, scope: !243)
!243 = distinct !DILexicalBlock(scope: !224, file: !66, line: 208, column: 17)
!244 = !DILocation(line: 208, column: 40, scope: !243)
!245 = !DILocation(line: 208, column: 17, scope: !243)
!246 = !DILocation(line: 208, column: 85, scope: !243)
!247 = !DILocation(line: 208, column: 17, scope: !224)
!248 = !DILocation(line: 210, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !243, file: !66, line: 209, column: 13)
!250 = !DILocation(line: 214, column: 31, scope: !224)
!251 = !DILocation(line: 214, column: 46, scope: !224)
!252 = !DILocation(line: 214, column: 26, scope: !224)
!253 = !DILocation(line: 214, column: 24, scope: !224)
!254 = !DILocation(line: 215, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !224, file: !66, line: 215, column: 17)
!256 = !DILocation(line: 215, column: 28, scope: !255)
!257 = !DILocation(line: 215, column: 44, scope: !255)
!258 = !DILocation(line: 215, column: 47, scope: !255)
!259 = !DILocation(line: 215, column: 58, scope: !255)
!260 = !DILocation(line: 215, column: 17, scope: !224)
!261 = !DILocation(line: 217, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !255, file: !66, line: 216, column: 13)
!263 = !DILocation(line: 220, column: 25, scope: !224)
!264 = !DILocation(line: 220, column: 13, scope: !224)
!265 = !DILocation(line: 220, column: 37, scope: !224)
!266 = !DILocation(line: 222, column: 25, scope: !224)
!267 = !DILocation(line: 222, column: 20, scope: !224)
!268 = !DILocation(line: 222, column: 18, scope: !224)
!269 = !DILocation(line: 223, column: 9, scope: !224)
!270 = !DILocation(line: 225, column: 13, scope: !271)
!271 = distinct !DILexicalBlock(scope: !214, file: !66, line: 225, column: 13)
!272 = !DILocation(line: 225, column: 27, scope: !271)
!273 = !DILocation(line: 225, column: 13, scope: !214)
!274 = !DILocation(line: 227, column: 26, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !66, line: 226, column: 9)
!276 = !DILocation(line: 227, column: 13, scope: !275)
!277 = !DILocation(line: 228, column: 9, scope: !275)
!278 = !DILocation(line: 236, column: 17, scope: !209)
!279 = !DILocation(line: 236, column: 5, scope: !209)
!280 = !DILocation(line: 237, column: 1, scope: !209)
!281 = distinct !DISubprogram(name: "goodB2GSink", scope: !66, file: !66, line: 159, type: !164, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!282 = !DILocalVariable(name: "data", arg: 1, scope: !281, file: !66, line: 159, type: !71)
!283 = !DILocation(line: 159, column: 29, scope: !281)
!284 = !DILocalVariable(name: "buffer", scope: !285, file: !66, line: 162, type: !170)
!285 = distinct !DILexicalBlock(scope: !281, file: !66, line: 161, column: 5)
!286 = !DILocation(line: 162, column: 13, scope: !285)
!287 = !DILocation(line: 164, column: 13, scope: !288)
!288 = distinct !DILexicalBlock(scope: !285, file: !66, line: 164, column: 13)
!289 = !DILocation(line: 164, column: 18, scope: !288)
!290 = !DILocation(line: 164, column: 23, scope: !288)
!291 = !DILocation(line: 164, column: 26, scope: !288)
!292 = !DILocation(line: 164, column: 31, scope: !288)
!293 = !DILocation(line: 164, column: 13, scope: !285)
!294 = !DILocation(line: 166, column: 33, scope: !295)
!295 = distinct !DILexicalBlock(scope: !288, file: !66, line: 165, column: 9)
!296 = !DILocation(line: 166, column: 26, scope: !295)
!297 = !DILocation(line: 166, column: 13, scope: !295)
!298 = !DILocation(line: 167, column: 9, scope: !295)
!299 = !DILocation(line: 170, column: 13, scope: !300)
!300 = distinct !DILexicalBlock(scope: !288, file: !66, line: 169, column: 9)
!301 = !DILocation(line: 173, column: 1, scope: !281)
!302 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 147, type: !67, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!303 = !DILocalVariable(name: "data", scope: !302, file: !66, line: 149, type: !71)
!304 = !DILocation(line: 149, column: 9, scope: !302)
!305 = !DILocation(line: 151, column: 10, scope: !302)
!306 = !DILocation(line: 154, column: 10, scope: !302)
!307 = !DILocation(line: 155, column: 17, scope: !302)
!308 = !DILocation(line: 155, column: 5, scope: !302)
!309 = !DILocation(line: 156, column: 1, scope: !302)
!310 = distinct !DISubprogram(name: "goodG2BSink", scope: !66, file: !66, line: 130, type: !164, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!311 = !DILocalVariable(name: "data", arg: 1, scope: !310, file: !66, line: 130, type: !71)
!312 = !DILocation(line: 130, column: 29, scope: !310)
!313 = !DILocalVariable(name: "buffer", scope: !314, file: !66, line: 133, type: !170)
!314 = distinct !DILexicalBlock(scope: !310, file: !66, line: 132, column: 5)
!315 = !DILocation(line: 133, column: 13, scope: !314)
!316 = !DILocation(line: 136, column: 13, scope: !317)
!317 = distinct !DILexicalBlock(scope: !314, file: !66, line: 136, column: 13)
!318 = !DILocation(line: 136, column: 18, scope: !317)
!319 = !DILocation(line: 136, column: 13, scope: !314)
!320 = !DILocation(line: 138, column: 33, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !66, line: 137, column: 9)
!322 = !DILocation(line: 138, column: 26, scope: !321)
!323 = !DILocation(line: 138, column: 13, scope: !321)
!324 = !DILocation(line: 139, column: 9, scope: !321)
!325 = !DILocation(line: 142, column: 13, scope: !326)
!326 = distinct !DILexicalBlock(scope: !317, file: !66, line: 141, column: 9)
!327 = !DILocation(line: 145, column: 1, scope: !310)
