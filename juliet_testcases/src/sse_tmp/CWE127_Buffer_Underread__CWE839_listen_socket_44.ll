; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_44.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_44_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !78, metadata !DIExpression()), !dbg !82
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !82
  store i32 -1, i32* %data, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !84, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !87, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %listenSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %acceptSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  br label %do.body, !dbg !111

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !112
  store i32 %call, i32* %listenSocket, align 4, !dbg !114
  %0 = load i32, i32* %listenSocket, align 4, !dbg !115
  %cmp = icmp eq i32 %0, -1, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !119

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !121
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !122
  store i16 2, i16* %sin_family, align 4, !dbg !123
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !124
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !125
  store i32 0, i32* %s_addr, align 4, !dbg !126
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !127
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !128
  store i16 %call1, i16* %sin_port, align 2, !dbg !129
  %2 = load i32, i32* %listenSocket, align 4, !dbg !130
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !132
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !133
  %cmp3 = icmp eq i32 %call2, -1, !dbg !134
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !135

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !136

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !138
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !140
  %cmp7 = icmp eq i32 %call6, -1, !dbg !141
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !142

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !143

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !145
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !146
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !147
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !148
  %cmp11 = icmp eq i32 %6, -1, !dbg !150
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !151

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !152

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !154
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !156
  %conv = trunc i64 %call14 to i32, !dbg !156
  store i32 %conv, i32* %recvResult, align 4, !dbg !157
  %8 = load i32, i32* %recvResult, align 4, !dbg !158
  %cmp15 = icmp eq i32 %8, -1, !dbg !160
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !161

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !162
  %cmp17 = icmp eq i32 %9, 0, !dbg !163
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !164

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !165

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !167
  %idxprom = sext i32 %10 to i64, !dbg !168
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !170
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !171
  store i32 %call22, i32* %data, align 4, !dbg !172
  br label %do.end, !dbg !173

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !174
  %cmp23 = icmp ne i32 %11, -1, !dbg !176
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !177

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !178
  %call26 = call i32 @close(i32 %12), !dbg !180
  br label %if.end27, !dbg !181

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !182
  %cmp28 = icmp ne i32 %13, -1, !dbg !184
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !185

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !186
  %call31 = call i32 @close(i32 %14), !dbg !188
  br label %if.end32, !dbg !189

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !190
  %16 = load i32, i32* %data, align 4, !dbg !191
  call void %15(i32 %16), !dbg !190
  ret void, !dbg !192
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32 %data) #0 !dbg !193 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !196, metadata !DIExpression()), !dbg !201
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !201
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !201
  %1 = load i32, i32* %data.addr, align 4, !dbg !202
  %cmp = icmp slt i32 %1, 10, !dbg !204
  br i1 %cmp, label %if.then, label %if.else, !dbg !205

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !206
  %idxprom = sext i32 %2 to i64, !dbg !208
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !208
  %3 = load i32, i32* %arrayidx, align 4, !dbg !208
  call void @printIntLine(i32 %3), !dbg !209
  br label %if.end, !dbg !210

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !211
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !213
}

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #2

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #2

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_44_good() #0 !dbg !214 {
entry:
  call void @goodG2B(), !dbg !215
  call void @goodB2G(), !dbg !216
  ret void, !dbg !217
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !218 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !223, metadata !DIExpression()), !dbg !224
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !225, metadata !DIExpression()), !dbg !226
  %call = call i64 @time(i64* null) #7, !dbg !227
  %conv = trunc i64 %call to i32, !dbg !228
  call void @srand(i32 %conv) #7, !dbg !229
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !230
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_44_good(), !dbg !231
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !232
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !233
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_44_bad(), !dbg !234
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !235
  ret i32 0, !dbg !236
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !237 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !238, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !240, metadata !DIExpression()), !dbg !241
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !241
  store i32 -1, i32* %data, align 4, !dbg !242
  store i32 7, i32* %data, align 4, !dbg !243
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !244
  %1 = load i32, i32* %data, align 4, !dbg !245
  call void %0(i32 %1), !dbg !244
  ret void, !dbg !246
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !247 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !248, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !250, metadata !DIExpression()), !dbg !252
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !252
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !252
  %1 = load i32, i32* %data.addr, align 4, !dbg !253
  %cmp = icmp slt i32 %1, 10, !dbg !255
  br i1 %cmp, label %if.then, label %if.else, !dbg !256

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !257
  %idxprom = sext i32 %2 to i64, !dbg !259
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !259
  %3 = load i32, i32* %arrayidx, align 4, !dbg !259
  call void @printIntLine(i32 %3), !dbg !260
  br label %if.end, !dbg !261

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !262
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !264
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !265 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !266, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !268, metadata !DIExpression()), !dbg !269
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !269
  store i32 -1, i32* %data, align 4, !dbg !270
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !271, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !274, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !276, metadata !DIExpression()), !dbg !277
  store i32 -1, i32* %listenSocket, align 4, !dbg !277
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !278, metadata !DIExpression()), !dbg !279
  store i32 -1, i32* %acceptSocket, align 4, !dbg !279
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !280, metadata !DIExpression()), !dbg !281
  br label %do.body, !dbg !282

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !283
  store i32 %call, i32* %listenSocket, align 4, !dbg !285
  %0 = load i32, i32* %listenSocket, align 4, !dbg !286
  %cmp = icmp eq i32 %0, -1, !dbg !288
  br i1 %cmp, label %if.then, label %if.end, !dbg !289

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !290

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !292
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !292
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !293
  store i16 2, i16* %sin_family, align 4, !dbg !294
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !295
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !296
  store i32 0, i32* %s_addr, align 4, !dbg !297
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !298
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !299
  store i16 %call1, i16* %sin_port, align 2, !dbg !300
  %2 = load i32, i32* %listenSocket, align 4, !dbg !301
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !303
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !304
  %cmp3 = icmp eq i32 %call2, -1, !dbg !305
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !306

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !307

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !309
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !311
  %cmp7 = icmp eq i32 %call6, -1, !dbg !312
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !313

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !314

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !316
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !317
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !318
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !319
  %cmp11 = icmp eq i32 %6, -1, !dbg !321
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !322

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !323

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !325
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !326
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !327
  %conv = trunc i64 %call14 to i32, !dbg !327
  store i32 %conv, i32* %recvResult, align 4, !dbg !328
  %8 = load i32, i32* %recvResult, align 4, !dbg !329
  %cmp15 = icmp eq i32 %8, -1, !dbg !331
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !332

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !333
  %cmp17 = icmp eq i32 %9, 0, !dbg !334
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !335

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !336

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !338
  %idxprom = sext i32 %10 to i64, !dbg !339
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !339
  store i8 0, i8* %arrayidx, align 1, !dbg !340
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !341
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !342
  store i32 %call22, i32* %data, align 4, !dbg !343
  br label %do.end, !dbg !344

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !345
  %cmp23 = icmp ne i32 %11, -1, !dbg !347
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !348

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !349
  %call26 = call i32 @close(i32 %12), !dbg !351
  br label %if.end27, !dbg !352

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !353
  %cmp28 = icmp ne i32 %13, -1, !dbg !355
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !356

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !357
  %call31 = call i32 @close(i32 %14), !dbg !359
  br label %if.end32, !dbg !360

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !361
  %16 = load i32, i32* %data, align 4, !dbg !362
  call void %15(i32 %16), !dbg !361
  ret void, !dbg !363
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !364 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !365, metadata !DIExpression()), !dbg !366
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !367, metadata !DIExpression()), !dbg !369
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !369
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !369
  %1 = load i32, i32* %data.addr, align 4, !dbg !370
  %cmp = icmp sge i32 %1, 0, !dbg !372
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !373

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !374
  %cmp1 = icmp slt i32 %2, 10, !dbg !375
  br i1 %cmp1, label %if.then, label %if.else, !dbg !376

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !377
  %idxprom = sext i32 %3 to i64, !dbg !379
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !379
  %4 = load i32, i32* %arrayidx, align 4, !dbg !379
  call void @printIntLine(i32 %4), !dbg !380
  br label %if.end, !dbg !381

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !382
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !384
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
!llvm.module.flags = !{!64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !51, !5}
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !48, line: 26, baseType: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !50, line: 42, baseType: !5)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !53, line: 178, size: 128, elements: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!54 = !{!55, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !52, file: !53, line: 180, baseType: !56, size: 16)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !57, line: 28, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!58 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !52, file: !53, line: 181, baseType: !60, size: 112, offset: 16)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !61, size: 112, elements: !62)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !{!63}
!63 = !DISubrange(count: 14)
!64 = !{i32 7, !"Dwarf Version", i32 4}
!65 = !{i32 2, !"Debug Info Version", i32 3}
!66 = !{i32 1, !"wchar_size", i32 4}
!67 = !{i32 7, !"uwtable", i32 1}
!68 = !{i32 7, !"frame-pointer", i32 2}
!69 = !{!"clang version 13.0.0"}
!70 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_44_bad", scope: !71, file: !71, line: 61, type: !72, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_44.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 63, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 63, column: 9, scope: !70)
!78 = !DILocalVariable(name: "funcPtr", scope: !70, file: !71, line: 65, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DISubroutineType(types: !81)
!81 = !{null, !76}
!82 = !DILocation(line: 65, column: 12, scope: !70)
!83 = !DILocation(line: 67, column: 10, scope: !70)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !71, line: 73, type: !76)
!85 = distinct !DILexicalBlock(scope: !70, file: !71, line: 68, column: 5)
!86 = !DILocation(line: 73, column: 13, scope: !85)
!87 = !DILocalVariable(name: "service", scope: !85, file: !71, line: 74, type: !88)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !89)
!89 = !{!90, !91, !95, !99}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !88, file: !17, line: 240, baseType: !56, size: 16)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !88, file: !17, line: 241, baseType: !92, size: 16, offset: 16)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !88, file: !17, line: 242, baseType: !96, size: 32, offset: 32)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !97)
!97 = !{!98}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !96, file: !17, line: 33, baseType: !46, size: 32)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !88, file: !17, line: 245, baseType: !100, size: 64, offset: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 64, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 8)
!104 = !DILocation(line: 74, column: 28, scope: !85)
!105 = !DILocalVariable(name: "listenSocket", scope: !85, file: !71, line: 75, type: !76)
!106 = !DILocation(line: 75, column: 16, scope: !85)
!107 = !DILocalVariable(name: "acceptSocket", scope: !85, file: !71, line: 76, type: !76)
!108 = !DILocation(line: 76, column: 16, scope: !85)
!109 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !71, line: 77, type: !60)
!110 = !DILocation(line: 77, column: 14, scope: !85)
!111 = !DILocation(line: 78, column: 9, scope: !85)
!112 = !DILocation(line: 88, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !85, file: !71, line: 79, column: 9)
!114 = !DILocation(line: 88, column: 26, scope: !113)
!115 = !DILocation(line: 89, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !71, line: 89, column: 17)
!117 = !DILocation(line: 89, column: 30, scope: !116)
!118 = !DILocation(line: 89, column: 17, scope: !113)
!119 = !DILocation(line: 91, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !71, line: 90, column: 13)
!121 = !DILocation(line: 93, column: 13, scope: !113)
!122 = !DILocation(line: 94, column: 21, scope: !113)
!123 = !DILocation(line: 94, column: 32, scope: !113)
!124 = !DILocation(line: 95, column: 21, scope: !113)
!125 = !DILocation(line: 95, column: 30, scope: !113)
!126 = !DILocation(line: 95, column: 37, scope: !113)
!127 = !DILocation(line: 96, column: 32, scope: !113)
!128 = !DILocation(line: 96, column: 21, scope: !113)
!129 = !DILocation(line: 96, column: 30, scope: !113)
!130 = !DILocation(line: 97, column: 22, scope: !131)
!131 = distinct !DILexicalBlock(scope: !113, file: !71, line: 97, column: 17)
!132 = !DILocation(line: 97, column: 36, scope: !131)
!133 = !DILocation(line: 97, column: 17, scope: !131)
!134 = !DILocation(line: 97, column: 81, scope: !131)
!135 = !DILocation(line: 97, column: 17, scope: !113)
!136 = !DILocation(line: 99, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !71, line: 98, column: 13)
!138 = !DILocation(line: 101, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !113, file: !71, line: 101, column: 17)
!140 = !DILocation(line: 101, column: 17, scope: !139)
!141 = !DILocation(line: 101, column: 54, scope: !139)
!142 = !DILocation(line: 101, column: 17, scope: !113)
!143 = !DILocation(line: 103, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !71, line: 102, column: 13)
!145 = !DILocation(line: 105, column: 35, scope: !113)
!146 = !DILocation(line: 105, column: 28, scope: !113)
!147 = !DILocation(line: 105, column: 26, scope: !113)
!148 = !DILocation(line: 106, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !113, file: !71, line: 106, column: 17)
!150 = !DILocation(line: 106, column: 30, scope: !149)
!151 = !DILocation(line: 106, column: 17, scope: !113)
!152 = !DILocation(line: 108, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !71, line: 107, column: 13)
!154 = !DILocation(line: 111, column: 31, scope: !113)
!155 = !DILocation(line: 111, column: 45, scope: !113)
!156 = !DILocation(line: 111, column: 26, scope: !113)
!157 = !DILocation(line: 111, column: 24, scope: !113)
!158 = !DILocation(line: 112, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !113, file: !71, line: 112, column: 17)
!160 = !DILocation(line: 112, column: 28, scope: !159)
!161 = !DILocation(line: 112, column: 44, scope: !159)
!162 = !DILocation(line: 112, column: 47, scope: !159)
!163 = !DILocation(line: 112, column: 58, scope: !159)
!164 = !DILocation(line: 112, column: 17, scope: !113)
!165 = !DILocation(line: 114, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !71, line: 113, column: 13)
!167 = !DILocation(line: 117, column: 25, scope: !113)
!168 = !DILocation(line: 117, column: 13, scope: !113)
!169 = !DILocation(line: 117, column: 37, scope: !113)
!170 = !DILocation(line: 119, column: 25, scope: !113)
!171 = !DILocation(line: 119, column: 20, scope: !113)
!172 = !DILocation(line: 119, column: 18, scope: !113)
!173 = !DILocation(line: 120, column: 9, scope: !113)
!174 = !DILocation(line: 122, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !85, file: !71, line: 122, column: 13)
!176 = !DILocation(line: 122, column: 26, scope: !175)
!177 = !DILocation(line: 122, column: 13, scope: !85)
!178 = !DILocation(line: 124, column: 26, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !71, line: 123, column: 9)
!180 = !DILocation(line: 124, column: 13, scope: !179)
!181 = !DILocation(line: 125, column: 9, scope: !179)
!182 = !DILocation(line: 126, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !85, file: !71, line: 126, column: 13)
!184 = !DILocation(line: 126, column: 26, scope: !183)
!185 = !DILocation(line: 126, column: 13, scope: !85)
!186 = !DILocation(line: 128, column: 26, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !71, line: 127, column: 9)
!188 = !DILocation(line: 128, column: 13, scope: !187)
!189 = !DILocation(line: 129, column: 9, scope: !187)
!190 = !DILocation(line: 138, column: 5, scope: !70)
!191 = !DILocation(line: 138, column: 13, scope: !70)
!192 = !DILocation(line: 139, column: 1, scope: !70)
!193 = distinct !DISubprogram(name: "badSink", scope: !71, file: !71, line: 44, type: !80, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!194 = !DILocalVariable(name: "data", arg: 1, scope: !193, file: !71, line: 44, type: !76)
!195 = !DILocation(line: 44, column: 25, scope: !193)
!196 = !DILocalVariable(name: "buffer", scope: !197, file: !71, line: 47, type: !198)
!197 = distinct !DILexicalBlock(scope: !193, file: !71, line: 46, column: 5)
!198 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !199)
!199 = !{!200}
!200 = !DISubrange(count: 10)
!201 = !DILocation(line: 47, column: 13, scope: !197)
!202 = !DILocation(line: 50, column: 13, scope: !203)
!203 = distinct !DILexicalBlock(scope: !197, file: !71, line: 50, column: 13)
!204 = !DILocation(line: 50, column: 18, scope: !203)
!205 = !DILocation(line: 50, column: 13, scope: !197)
!206 = !DILocation(line: 52, column: 33, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !71, line: 51, column: 9)
!208 = !DILocation(line: 52, column: 26, scope: !207)
!209 = !DILocation(line: 52, column: 13, scope: !207)
!210 = !DILocation(line: 53, column: 9, scope: !207)
!211 = !DILocation(line: 56, column: 13, scope: !212)
!212 = distinct !DILexicalBlock(scope: !203, file: !71, line: 55, column: 9)
!213 = !DILocation(line: 59, column: 1, scope: !193)
!214 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_44_good", scope: !71, file: !71, line: 270, type: !72, scopeLine: 271, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!215 = !DILocation(line: 272, column: 5, scope: !214)
!216 = !DILocation(line: 273, column: 5, scope: !214)
!217 = !DILocation(line: 274, column: 1, scope: !214)
!218 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 284, type: !219, scopeLine: 285, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!219 = !DISubroutineType(types: !220)
!220 = !{!76, !76, !221}
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!223 = !DILocalVariable(name: "argc", arg: 1, scope: !218, file: !71, line: 284, type: !76)
!224 = !DILocation(line: 284, column: 14, scope: !218)
!225 = !DILocalVariable(name: "argv", arg: 2, scope: !218, file: !71, line: 284, type: !221)
!226 = !DILocation(line: 284, column: 27, scope: !218)
!227 = !DILocation(line: 287, column: 22, scope: !218)
!228 = !DILocation(line: 287, column: 12, scope: !218)
!229 = !DILocation(line: 287, column: 5, scope: !218)
!230 = !DILocation(line: 289, column: 5, scope: !218)
!231 = !DILocation(line: 290, column: 5, scope: !218)
!232 = !DILocation(line: 291, column: 5, scope: !218)
!233 = !DILocation(line: 294, column: 5, scope: !218)
!234 = !DILocation(line: 295, column: 5, scope: !218)
!235 = !DILocation(line: 296, column: 5, scope: !218)
!236 = !DILocation(line: 298, column: 5, scope: !218)
!237 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 163, type: !72, scopeLine: 164, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!238 = !DILocalVariable(name: "data", scope: !237, file: !71, line: 165, type: !76)
!239 = !DILocation(line: 165, column: 9, scope: !237)
!240 = !DILocalVariable(name: "funcPtr", scope: !237, file: !71, line: 166, type: !79)
!241 = !DILocation(line: 166, column: 12, scope: !237)
!242 = !DILocation(line: 168, column: 10, scope: !237)
!243 = !DILocation(line: 171, column: 10, scope: !237)
!244 = !DILocation(line: 172, column: 5, scope: !237)
!245 = !DILocation(line: 172, column: 13, scope: !237)
!246 = !DILocation(line: 173, column: 1, scope: !237)
!247 = distinct !DISubprogram(name: "goodG2BSink", scope: !71, file: !71, line: 146, type: !80, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!248 = !DILocalVariable(name: "data", arg: 1, scope: !247, file: !71, line: 146, type: !76)
!249 = !DILocation(line: 146, column: 29, scope: !247)
!250 = !DILocalVariable(name: "buffer", scope: !251, file: !71, line: 149, type: !198)
!251 = distinct !DILexicalBlock(scope: !247, file: !71, line: 148, column: 5)
!252 = !DILocation(line: 149, column: 13, scope: !251)
!253 = !DILocation(line: 152, column: 13, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !71, line: 152, column: 13)
!255 = !DILocation(line: 152, column: 18, scope: !254)
!256 = !DILocation(line: 152, column: 13, scope: !251)
!257 = !DILocation(line: 154, column: 33, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !71, line: 153, column: 9)
!259 = !DILocation(line: 154, column: 26, scope: !258)
!260 = !DILocation(line: 154, column: 13, scope: !258)
!261 = !DILocation(line: 155, column: 9, scope: !258)
!262 = !DILocation(line: 158, column: 13, scope: !263)
!263 = distinct !DILexicalBlock(scope: !254, file: !71, line: 157, column: 9)
!264 = !DILocation(line: 161, column: 1, scope: !247)
!265 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 192, type: !72, scopeLine: 193, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!266 = !DILocalVariable(name: "data", scope: !265, file: !71, line: 194, type: !76)
!267 = !DILocation(line: 194, column: 9, scope: !265)
!268 = !DILocalVariable(name: "funcPtr", scope: !265, file: !71, line: 195, type: !79)
!269 = !DILocation(line: 195, column: 12, scope: !265)
!270 = !DILocation(line: 197, column: 10, scope: !265)
!271 = !DILocalVariable(name: "recvResult", scope: !272, file: !71, line: 203, type: !76)
!272 = distinct !DILexicalBlock(scope: !265, file: !71, line: 198, column: 5)
!273 = !DILocation(line: 203, column: 13, scope: !272)
!274 = !DILocalVariable(name: "service", scope: !272, file: !71, line: 204, type: !88)
!275 = !DILocation(line: 204, column: 28, scope: !272)
!276 = !DILocalVariable(name: "listenSocket", scope: !272, file: !71, line: 205, type: !76)
!277 = !DILocation(line: 205, column: 16, scope: !272)
!278 = !DILocalVariable(name: "acceptSocket", scope: !272, file: !71, line: 206, type: !76)
!279 = !DILocation(line: 206, column: 16, scope: !272)
!280 = !DILocalVariable(name: "inputBuffer", scope: !272, file: !71, line: 207, type: !60)
!281 = !DILocation(line: 207, column: 14, scope: !272)
!282 = !DILocation(line: 208, column: 9, scope: !272)
!283 = !DILocation(line: 218, column: 28, scope: !284)
!284 = distinct !DILexicalBlock(scope: !272, file: !71, line: 209, column: 9)
!285 = !DILocation(line: 218, column: 26, scope: !284)
!286 = !DILocation(line: 219, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !284, file: !71, line: 219, column: 17)
!288 = !DILocation(line: 219, column: 30, scope: !287)
!289 = !DILocation(line: 219, column: 17, scope: !284)
!290 = !DILocation(line: 221, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !71, line: 220, column: 13)
!292 = !DILocation(line: 223, column: 13, scope: !284)
!293 = !DILocation(line: 224, column: 21, scope: !284)
!294 = !DILocation(line: 224, column: 32, scope: !284)
!295 = !DILocation(line: 225, column: 21, scope: !284)
!296 = !DILocation(line: 225, column: 30, scope: !284)
!297 = !DILocation(line: 225, column: 37, scope: !284)
!298 = !DILocation(line: 226, column: 32, scope: !284)
!299 = !DILocation(line: 226, column: 21, scope: !284)
!300 = !DILocation(line: 226, column: 30, scope: !284)
!301 = !DILocation(line: 227, column: 22, scope: !302)
!302 = distinct !DILexicalBlock(scope: !284, file: !71, line: 227, column: 17)
!303 = !DILocation(line: 227, column: 36, scope: !302)
!304 = !DILocation(line: 227, column: 17, scope: !302)
!305 = !DILocation(line: 227, column: 81, scope: !302)
!306 = !DILocation(line: 227, column: 17, scope: !284)
!307 = !DILocation(line: 229, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !302, file: !71, line: 228, column: 13)
!309 = !DILocation(line: 231, column: 24, scope: !310)
!310 = distinct !DILexicalBlock(scope: !284, file: !71, line: 231, column: 17)
!311 = !DILocation(line: 231, column: 17, scope: !310)
!312 = !DILocation(line: 231, column: 54, scope: !310)
!313 = !DILocation(line: 231, column: 17, scope: !284)
!314 = !DILocation(line: 233, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !310, file: !71, line: 232, column: 13)
!316 = !DILocation(line: 235, column: 35, scope: !284)
!317 = !DILocation(line: 235, column: 28, scope: !284)
!318 = !DILocation(line: 235, column: 26, scope: !284)
!319 = !DILocation(line: 236, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !284, file: !71, line: 236, column: 17)
!321 = !DILocation(line: 236, column: 30, scope: !320)
!322 = !DILocation(line: 236, column: 17, scope: !284)
!323 = !DILocation(line: 238, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !71, line: 237, column: 13)
!325 = !DILocation(line: 241, column: 31, scope: !284)
!326 = !DILocation(line: 241, column: 45, scope: !284)
!327 = !DILocation(line: 241, column: 26, scope: !284)
!328 = !DILocation(line: 241, column: 24, scope: !284)
!329 = !DILocation(line: 242, column: 17, scope: !330)
!330 = distinct !DILexicalBlock(scope: !284, file: !71, line: 242, column: 17)
!331 = !DILocation(line: 242, column: 28, scope: !330)
!332 = !DILocation(line: 242, column: 44, scope: !330)
!333 = !DILocation(line: 242, column: 47, scope: !330)
!334 = !DILocation(line: 242, column: 58, scope: !330)
!335 = !DILocation(line: 242, column: 17, scope: !284)
!336 = !DILocation(line: 244, column: 17, scope: !337)
!337 = distinct !DILexicalBlock(scope: !330, file: !71, line: 243, column: 13)
!338 = !DILocation(line: 247, column: 25, scope: !284)
!339 = !DILocation(line: 247, column: 13, scope: !284)
!340 = !DILocation(line: 247, column: 37, scope: !284)
!341 = !DILocation(line: 249, column: 25, scope: !284)
!342 = !DILocation(line: 249, column: 20, scope: !284)
!343 = !DILocation(line: 249, column: 18, scope: !284)
!344 = !DILocation(line: 250, column: 9, scope: !284)
!345 = !DILocation(line: 252, column: 13, scope: !346)
!346 = distinct !DILexicalBlock(scope: !272, file: !71, line: 252, column: 13)
!347 = !DILocation(line: 252, column: 26, scope: !346)
!348 = !DILocation(line: 252, column: 13, scope: !272)
!349 = !DILocation(line: 254, column: 26, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !71, line: 253, column: 9)
!351 = !DILocation(line: 254, column: 13, scope: !350)
!352 = !DILocation(line: 255, column: 9, scope: !350)
!353 = !DILocation(line: 256, column: 13, scope: !354)
!354 = distinct !DILexicalBlock(scope: !272, file: !71, line: 256, column: 13)
!355 = !DILocation(line: 256, column: 26, scope: !354)
!356 = !DILocation(line: 256, column: 13, scope: !272)
!357 = !DILocation(line: 258, column: 26, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !71, line: 257, column: 9)
!359 = !DILocation(line: 258, column: 13, scope: !358)
!360 = !DILocation(line: 259, column: 9, scope: !358)
!361 = !DILocation(line: 267, column: 5, scope: !265)
!362 = !DILocation(line: 267, column: 13, scope: !265)
!363 = !DILocation(line: 268, column: 1, scope: !265)
!364 = distinct !DISubprogram(name: "goodB2GSink", scope: !71, file: !71, line: 176, type: !80, scopeLine: 177, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!365 = !DILocalVariable(name: "data", arg: 1, scope: !364, file: !71, line: 176, type: !76)
!366 = !DILocation(line: 176, column: 29, scope: !364)
!367 = !DILocalVariable(name: "buffer", scope: !368, file: !71, line: 179, type: !198)
!368 = distinct !DILexicalBlock(scope: !364, file: !71, line: 178, column: 5)
!369 = !DILocation(line: 179, column: 13, scope: !368)
!370 = !DILocation(line: 181, column: 13, scope: !371)
!371 = distinct !DILexicalBlock(scope: !368, file: !71, line: 181, column: 13)
!372 = !DILocation(line: 181, column: 18, scope: !371)
!373 = !DILocation(line: 181, column: 23, scope: !371)
!374 = !DILocation(line: 181, column: 26, scope: !371)
!375 = !DILocation(line: 181, column: 31, scope: !371)
!376 = !DILocation(line: 181, column: 13, scope: !368)
!377 = !DILocation(line: 183, column: 33, scope: !378)
!378 = distinct !DILexicalBlock(scope: !371, file: !71, line: 182, column: 9)
!379 = !DILocation(line: 183, column: 26, scope: !378)
!380 = !DILocation(line: 183, column: 13, scope: !378)
!381 = !DILocation(line: 184, column: 9, scope: !378)
!382 = !DILocation(line: 187, column: 13, scope: !383)
!383 = distinct !DILexicalBlock(scope: !371, file: !71, line: 186, column: 9)
!384 = !DILocation(line: 190, column: 1, scope: !364)
