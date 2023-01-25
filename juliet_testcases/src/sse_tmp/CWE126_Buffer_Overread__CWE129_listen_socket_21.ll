; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_21.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !67
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !71
@goodG2BStatic = internal global i32 0, align 4, !dbg !73

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_21_bad() #0 !dbg !81 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i32 -1, i32* %data, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !88, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !91, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %listenSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %acceptSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  br label %do.body, !dbg !115

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !116
  store i32 %call, i32* %listenSocket, align 4, !dbg !118
  %0 = load i32, i32* %listenSocket, align 4, !dbg !119
  %cmp = icmp eq i32 %0, -1, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !123

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !125
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !126
  store i16 2, i16* %sin_family, align 4, !dbg !127
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !128
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !129
  store i32 0, i32* %s_addr, align 4, !dbg !130
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !131
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !132
  store i16 %call1, i16* %sin_port, align 2, !dbg !133
  %2 = load i32, i32* %listenSocket, align 4, !dbg !134
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !136
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !137
  %cmp3 = icmp eq i32 %call2, -1, !dbg !138
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !139

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !140

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !142
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !144
  %cmp7 = icmp eq i32 %call6, -1, !dbg !145
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !146

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !147

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !149
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !150
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !151
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !152
  %cmp11 = icmp eq i32 %6, -1, !dbg !154
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !155

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !156

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !158
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !159
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !160
  %conv = trunc i64 %call14 to i32, !dbg !160
  store i32 %conv, i32* %recvResult, align 4, !dbg !161
  %8 = load i32, i32* %recvResult, align 4, !dbg !162
  %cmp15 = icmp eq i32 %8, -1, !dbg !164
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !165

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !166
  %cmp17 = icmp eq i32 %9, 0, !dbg !167
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !168

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !169

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !171
  %idxprom = sext i32 %10 to i64, !dbg !172
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !172
  store i8 0, i8* %arrayidx, align 1, !dbg !173
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !174
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !175
  store i32 %call22, i32* %data, align 4, !dbg !176
  br label %do.end, !dbg !177

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !178
  %cmp23 = icmp ne i32 %11, -1, !dbg !180
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !181

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !182
  %call26 = call i32 @close(i32 %12), !dbg !184
  br label %if.end27, !dbg !185

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !186
  %cmp28 = icmp ne i32 %13, -1, !dbg !188
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !189

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !190
  %call31 = call i32 @close(i32 %14), !dbg !192
  br label %if.end32, !dbg !193

if.end32:                                         ; preds = %if.then30, %if.end27
  store i32 1, i32* @badStatic, align 4, !dbg !194
  %15 = load i32, i32* %data, align 4, !dbg !195
  call void @badSink(i32 %15), !dbg !196
  ret void, !dbg !197
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
define internal void @badSink(i32 %data) #0 !dbg !198 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !201, metadata !DIExpression()), !dbg !202
  %0 = load i32, i32* @badStatic, align 4, !dbg !203
  %tobool = icmp ne i32 %0, 0, !dbg !203
  br i1 %tobool, label %if.then, label %if.end2, !dbg !205

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !206, metadata !DIExpression()), !dbg !212
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !212
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !212
  %2 = load i32, i32* %data.addr, align 4, !dbg !213
  %cmp = icmp sge i32 %2, 0, !dbg !215
  br i1 %cmp, label %if.then1, label %if.else, !dbg !216

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !217
  %idxprom = sext i32 %3 to i64, !dbg !219
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !219
  %4 = load i32, i32* %arrayidx, align 4, !dbg !219
  call void @printIntLine(i32 %4), !dbg !220
  br label %if.end, !dbg !221

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !222
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !224

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !225
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_21_good() #0 !dbg !226 {
entry:
  call void @goodB2G1(), !dbg !227
  call void @goodB2G2(), !dbg !228
  call void @goodG2B(), !dbg !229
  ret void, !dbg !230
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !231 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !236, metadata !DIExpression()), !dbg !237
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !238, metadata !DIExpression()), !dbg !239
  %call = call i64 @time(i64* null) #7, !dbg !240
  %conv = trunc i64 %call to i32, !dbg !241
  call void @srand(i32 %conv) #7, !dbg !242
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !243
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_21_good(), !dbg !244
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !245
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !246
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_21_bad(), !dbg !247
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !248
  ret i32 0, !dbg !249
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !250 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !251, metadata !DIExpression()), !dbg !252
  store i32 -1, i32* %data, align 4, !dbg !253
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !254, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !257, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !259, metadata !DIExpression()), !dbg !260
  store i32 -1, i32* %listenSocket, align 4, !dbg !260
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !261, metadata !DIExpression()), !dbg !262
  store i32 -1, i32* %acceptSocket, align 4, !dbg !262
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !263, metadata !DIExpression()), !dbg !264
  br label %do.body, !dbg !265

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !266
  store i32 %call, i32* %listenSocket, align 4, !dbg !268
  %0 = load i32, i32* %listenSocket, align 4, !dbg !269
  %cmp = icmp eq i32 %0, -1, !dbg !271
  br i1 %cmp, label %if.then, label %if.end, !dbg !272

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !273

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !275
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !275
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !276
  store i16 2, i16* %sin_family, align 4, !dbg !277
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !278
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !279
  store i32 0, i32* %s_addr, align 4, !dbg !280
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !281
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !282
  store i16 %call1, i16* %sin_port, align 2, !dbg !283
  %2 = load i32, i32* %listenSocket, align 4, !dbg !284
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !286
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !287
  %cmp3 = icmp eq i32 %call2, -1, !dbg !288
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !289

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !290

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !292
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !294
  %cmp7 = icmp eq i32 %call6, -1, !dbg !295
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !296

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !297

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !299
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !300
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !301
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !302
  %cmp11 = icmp eq i32 %6, -1, !dbg !304
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !305

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !306

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !308
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !309
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !310
  %conv = trunc i64 %call14 to i32, !dbg !310
  store i32 %conv, i32* %recvResult, align 4, !dbg !311
  %8 = load i32, i32* %recvResult, align 4, !dbg !312
  %cmp15 = icmp eq i32 %8, -1, !dbg !314
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !315

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !316
  %cmp17 = icmp eq i32 %9, 0, !dbg !317
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !318

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !319

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !321
  %idxprom = sext i32 %10 to i64, !dbg !322
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !322
  store i8 0, i8* %arrayidx, align 1, !dbg !323
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !324
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !325
  store i32 %call22, i32* %data, align 4, !dbg !326
  br label %do.end, !dbg !327

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !328
  %cmp23 = icmp ne i32 %11, -1, !dbg !330
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !331

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !332
  %call26 = call i32 @close(i32 %12), !dbg !334
  br label %if.end27, !dbg !335

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !336
  %cmp28 = icmp ne i32 %13, -1, !dbg !338
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !339

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !340
  %call31 = call i32 @close(i32 %14), !dbg !342
  br label %if.end32, !dbg !343

if.end32:                                         ; preds = %if.then30, %if.end27
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !344
  %15 = load i32, i32* %data, align 4, !dbg !345
  call void @goodB2G1Sink(i32 %15), !dbg !346
  ret void, !dbg !347
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !348 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !349, metadata !DIExpression()), !dbg !350
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !351
  %tobool = icmp ne i32 %0, 0, !dbg !351
  br i1 %tobool, label %if.then, label %if.else, !dbg !353

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !354
  br label %if.end4, !dbg !356

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !357, metadata !DIExpression()), !dbg !360
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !360
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !360
  %2 = load i32, i32* %data.addr, align 4, !dbg !361
  %cmp = icmp sge i32 %2, 0, !dbg !363
  br i1 %cmp, label %land.lhs.true, label %if.else3, !dbg !364

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !365
  %cmp1 = icmp slt i32 %3, 10, !dbg !366
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !367

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !368
  %idxprom = sext i32 %4 to i64, !dbg !370
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !370
  %5 = load i32, i32* %arrayidx, align 4, !dbg !370
  call void @printIntLine(i32 %5), !dbg !371
  br label %if.end, !dbg !372

if.else3:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !373
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !375
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !376 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !377, metadata !DIExpression()), !dbg !378
  store i32 -1, i32* %data, align 4, !dbg !379
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !380, metadata !DIExpression()), !dbg !382
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !383, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !385, metadata !DIExpression()), !dbg !386
  store i32 -1, i32* %listenSocket, align 4, !dbg !386
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !387, metadata !DIExpression()), !dbg !388
  store i32 -1, i32* %acceptSocket, align 4, !dbg !388
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !389, metadata !DIExpression()), !dbg !390
  br label %do.body, !dbg !391

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !392
  store i32 %call, i32* %listenSocket, align 4, !dbg !394
  %0 = load i32, i32* %listenSocket, align 4, !dbg !395
  %cmp = icmp eq i32 %0, -1, !dbg !397
  br i1 %cmp, label %if.then, label %if.end, !dbg !398

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !399

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !401
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !401
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !402
  store i16 2, i16* %sin_family, align 4, !dbg !403
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !404
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !405
  store i32 0, i32* %s_addr, align 4, !dbg !406
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !407
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !408
  store i16 %call1, i16* %sin_port, align 2, !dbg !409
  %2 = load i32, i32* %listenSocket, align 4, !dbg !410
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !412
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !413
  %cmp3 = icmp eq i32 %call2, -1, !dbg !414
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !415

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !416

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !418
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !420
  %cmp7 = icmp eq i32 %call6, -1, !dbg !421
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !422

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !423

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !425
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !426
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !427
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !428
  %cmp11 = icmp eq i32 %6, -1, !dbg !430
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !431

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !432

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !434
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !435
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !436
  %conv = trunc i64 %call14 to i32, !dbg !436
  store i32 %conv, i32* %recvResult, align 4, !dbg !437
  %8 = load i32, i32* %recvResult, align 4, !dbg !438
  %cmp15 = icmp eq i32 %8, -1, !dbg !440
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !441

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !442
  %cmp17 = icmp eq i32 %9, 0, !dbg !443
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !444

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !445

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !447
  %idxprom = sext i32 %10 to i64, !dbg !448
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !448
  store i8 0, i8* %arrayidx, align 1, !dbg !449
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !450
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !451
  store i32 %call22, i32* %data, align 4, !dbg !452
  br label %do.end, !dbg !453

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !454
  %cmp23 = icmp ne i32 %11, -1, !dbg !456
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !457

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !458
  %call26 = call i32 @close(i32 %12), !dbg !460
  br label %if.end27, !dbg !461

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !462
  %cmp28 = icmp ne i32 %13, -1, !dbg !464
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !465

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !466
  %call31 = call i32 @close(i32 %14), !dbg !468
  br label %if.end32, !dbg !469

if.end32:                                         ; preds = %if.then30, %if.end27
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !470
  %15 = load i32, i32* %data, align 4, !dbg !471
  call void @goodB2G2Sink(i32 %15), !dbg !472
  ret void, !dbg !473
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !474 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !475, metadata !DIExpression()), !dbg !476
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !477
  %tobool = icmp ne i32 %0, 0, !dbg !477
  br i1 %tobool, label %if.then, label %if.end3, !dbg !479

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !480, metadata !DIExpression()), !dbg !483
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !483
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !483
  %2 = load i32, i32* %data.addr, align 4, !dbg !484
  %cmp = icmp sge i32 %2, 0, !dbg !486
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !487

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !488
  %cmp1 = icmp slt i32 %3, 10, !dbg !489
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !490

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !491
  %idxprom = sext i32 %4 to i64, !dbg !493
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !493
  %5 = load i32, i32* %arrayidx, align 4, !dbg !493
  call void @printIntLine(i32 %5), !dbg !494
  br label %if.end, !dbg !495

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !496
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3, !dbg !498

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !499
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !500 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !501, metadata !DIExpression()), !dbg !502
  store i32 -1, i32* %data, align 4, !dbg !503
  store i32 7, i32* %data, align 4, !dbg !504
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !505
  %0 = load i32, i32* %data, align 4, !dbg !506
  call void @goodG2BSink(i32 %0), !dbg !507
  ret void, !dbg !508
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !509 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !510, metadata !DIExpression()), !dbg !511
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !512
  %tobool = icmp ne i32 %0, 0, !dbg !512
  br i1 %tobool, label %if.then, label %if.end2, !dbg !514

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !515, metadata !DIExpression()), !dbg !518
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !518
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !518
  %2 = load i32, i32* %data.addr, align 4, !dbg !519
  %cmp = icmp sge i32 %2, 0, !dbg !521
  br i1 %cmp, label %if.then1, label %if.else, !dbg !522

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !523
  %idxprom = sext i32 %3 to i64, !dbg !525
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !525
  %4 = load i32, i32* %arrayidx, align 4, !dbg !525
  call void @printIntLine(i32 %4), !dbg !526
  br label %if.end, !dbg !527

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !528
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !530

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !531
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
!llvm.module.flags = !{!75, !76, !77, !78, !79}
!llvm.ident = !{!80}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !69, line: 45, type: !70, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !66, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_21.c", directory: "/home/joelyang/SSE-Assessment")
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
!47 = !{!48, !53, !7}
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !50, line: 26, baseType: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !52, line: 42, baseType: !7)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !55, line: 178, size: 128, elements: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!56 = !{!57, !61}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !54, file: !55, line: 180, baseType: !58, size: 16)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !59, line: 28, baseType: !60)
!59 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!60 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !54, file: !55, line: 181, baseType: !62, size: 112, offset: 16)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !63, size: 112, elements: !64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !{!65}
!65 = !DISubrange(count: 14)
!66 = !{!0, !67, !71, !73}
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !69, line: 150, type: !70, isLocal: true, isDefinition: true)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_21.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !69, line: 151, type: !70, isLocal: true, isDefinition: true)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !69, line: 152, type: !70, isLocal: true, isDefinition: true)
!75 = !{i32 7, !"Dwarf Version", i32 4}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{i32 7, !"uwtable", i32 1}
!79 = !{i32 7, !"frame-pointer", i32 2}
!80 = !{!"clang version 13.0.0"}
!81 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_21_bad", scope: !69, file: !69, line: 67, type: !82, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!82 = !DISubroutineType(types: !83)
!83 = !{null}
!84 = !{}
!85 = !DILocalVariable(name: "data", scope: !81, file: !69, line: 69, type: !70)
!86 = !DILocation(line: 69, column: 9, scope: !81)
!87 = !DILocation(line: 71, column: 10, scope: !81)
!88 = !DILocalVariable(name: "recvResult", scope: !89, file: !69, line: 77, type: !70)
!89 = distinct !DILexicalBlock(scope: !81, file: !69, line: 72, column: 5)
!90 = !DILocation(line: 77, column: 13, scope: !89)
!91 = !DILocalVariable(name: "service", scope: !89, file: !69, line: 78, type: !92)
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !93)
!93 = !{!94, !95, !99, !103}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !92, file: !19, line: 240, baseType: !58, size: 16)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !92, file: !19, line: 241, baseType: !96, size: 16, offset: 16)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 40, baseType: !60)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !92, file: !19, line: 242, baseType: !100, size: 32, offset: 32)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !101)
!101 = !{!102}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !100, file: !19, line: 33, baseType: !48, size: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !92, file: !19, line: 245, baseType: !104, size: 64, offset: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 64, elements: !106)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 78, column: 28, scope: !89)
!109 = !DILocalVariable(name: "listenSocket", scope: !89, file: !69, line: 79, type: !70)
!110 = !DILocation(line: 79, column: 16, scope: !89)
!111 = !DILocalVariable(name: "acceptSocket", scope: !89, file: !69, line: 80, type: !70)
!112 = !DILocation(line: 80, column: 16, scope: !89)
!113 = !DILocalVariable(name: "inputBuffer", scope: !89, file: !69, line: 81, type: !62)
!114 = !DILocation(line: 81, column: 14, scope: !89)
!115 = !DILocation(line: 82, column: 9, scope: !89)
!116 = !DILocation(line: 92, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !89, file: !69, line: 83, column: 9)
!118 = !DILocation(line: 92, column: 26, scope: !117)
!119 = !DILocation(line: 93, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !69, line: 93, column: 17)
!121 = !DILocation(line: 93, column: 30, scope: !120)
!122 = !DILocation(line: 93, column: 17, scope: !117)
!123 = !DILocation(line: 95, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !69, line: 94, column: 13)
!125 = !DILocation(line: 97, column: 13, scope: !117)
!126 = !DILocation(line: 98, column: 21, scope: !117)
!127 = !DILocation(line: 98, column: 32, scope: !117)
!128 = !DILocation(line: 99, column: 21, scope: !117)
!129 = !DILocation(line: 99, column: 30, scope: !117)
!130 = !DILocation(line: 99, column: 37, scope: !117)
!131 = !DILocation(line: 100, column: 32, scope: !117)
!132 = !DILocation(line: 100, column: 21, scope: !117)
!133 = !DILocation(line: 100, column: 30, scope: !117)
!134 = !DILocation(line: 101, column: 22, scope: !135)
!135 = distinct !DILexicalBlock(scope: !117, file: !69, line: 101, column: 17)
!136 = !DILocation(line: 101, column: 36, scope: !135)
!137 = !DILocation(line: 101, column: 17, scope: !135)
!138 = !DILocation(line: 101, column: 81, scope: !135)
!139 = !DILocation(line: 101, column: 17, scope: !117)
!140 = !DILocation(line: 103, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !69, line: 102, column: 13)
!142 = !DILocation(line: 105, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !117, file: !69, line: 105, column: 17)
!144 = !DILocation(line: 105, column: 17, scope: !143)
!145 = !DILocation(line: 105, column: 54, scope: !143)
!146 = !DILocation(line: 105, column: 17, scope: !117)
!147 = !DILocation(line: 107, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !69, line: 106, column: 13)
!149 = !DILocation(line: 109, column: 35, scope: !117)
!150 = !DILocation(line: 109, column: 28, scope: !117)
!151 = !DILocation(line: 109, column: 26, scope: !117)
!152 = !DILocation(line: 110, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !117, file: !69, line: 110, column: 17)
!154 = !DILocation(line: 110, column: 30, scope: !153)
!155 = !DILocation(line: 110, column: 17, scope: !117)
!156 = !DILocation(line: 112, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !69, line: 111, column: 13)
!158 = !DILocation(line: 115, column: 31, scope: !117)
!159 = !DILocation(line: 115, column: 45, scope: !117)
!160 = !DILocation(line: 115, column: 26, scope: !117)
!161 = !DILocation(line: 115, column: 24, scope: !117)
!162 = !DILocation(line: 116, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !117, file: !69, line: 116, column: 17)
!164 = !DILocation(line: 116, column: 28, scope: !163)
!165 = !DILocation(line: 116, column: 44, scope: !163)
!166 = !DILocation(line: 116, column: 47, scope: !163)
!167 = !DILocation(line: 116, column: 58, scope: !163)
!168 = !DILocation(line: 116, column: 17, scope: !117)
!169 = !DILocation(line: 118, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !69, line: 117, column: 13)
!171 = !DILocation(line: 121, column: 25, scope: !117)
!172 = !DILocation(line: 121, column: 13, scope: !117)
!173 = !DILocation(line: 121, column: 37, scope: !117)
!174 = !DILocation(line: 123, column: 25, scope: !117)
!175 = !DILocation(line: 123, column: 20, scope: !117)
!176 = !DILocation(line: 123, column: 18, scope: !117)
!177 = !DILocation(line: 124, column: 9, scope: !117)
!178 = !DILocation(line: 126, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !89, file: !69, line: 126, column: 13)
!180 = !DILocation(line: 126, column: 26, scope: !179)
!181 = !DILocation(line: 126, column: 13, scope: !89)
!182 = !DILocation(line: 128, column: 26, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !69, line: 127, column: 9)
!184 = !DILocation(line: 128, column: 13, scope: !183)
!185 = !DILocation(line: 129, column: 9, scope: !183)
!186 = !DILocation(line: 130, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !89, file: !69, line: 130, column: 13)
!188 = !DILocation(line: 130, column: 26, scope: !187)
!189 = !DILocation(line: 130, column: 13, scope: !89)
!190 = !DILocation(line: 132, column: 26, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !69, line: 131, column: 9)
!192 = !DILocation(line: 132, column: 13, scope: !191)
!193 = !DILocation(line: 133, column: 9, scope: !191)
!194 = !DILocation(line: 141, column: 15, scope: !81)
!195 = !DILocation(line: 142, column: 13, scope: !81)
!196 = !DILocation(line: 142, column: 5, scope: !81)
!197 = !DILocation(line: 143, column: 1, scope: !81)
!198 = distinct !DISubprogram(name: "badSink", scope: !69, file: !69, line: 47, type: !199, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!199 = !DISubroutineType(types: !200)
!200 = !{null, !70}
!201 = !DILocalVariable(name: "data", arg: 1, scope: !198, file: !69, line: 47, type: !70)
!202 = !DILocation(line: 47, column: 25, scope: !198)
!203 = !DILocation(line: 49, column: 8, scope: !204)
!204 = distinct !DILexicalBlock(scope: !198, file: !69, line: 49, column: 8)
!205 = !DILocation(line: 49, column: 8, scope: !198)
!206 = !DILocalVariable(name: "buffer", scope: !207, file: !69, line: 52, type: !209)
!207 = distinct !DILexicalBlock(scope: !208, file: !69, line: 51, column: 9)
!208 = distinct !DILexicalBlock(scope: !204, file: !69, line: 50, column: 5)
!209 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 320, elements: !210)
!210 = !{!211}
!211 = !DISubrange(count: 10)
!212 = !DILocation(line: 52, column: 17, scope: !207)
!213 = !DILocation(line: 55, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !207, file: !69, line: 55, column: 17)
!215 = !DILocation(line: 55, column: 22, scope: !214)
!216 = !DILocation(line: 55, column: 17, scope: !207)
!217 = !DILocation(line: 57, column: 37, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !69, line: 56, column: 13)
!219 = !DILocation(line: 57, column: 30, scope: !218)
!220 = !DILocation(line: 57, column: 17, scope: !218)
!221 = !DILocation(line: 58, column: 13, scope: !218)
!222 = !DILocation(line: 61, column: 17, scope: !223)
!223 = distinct !DILexicalBlock(scope: !214, file: !69, line: 60, column: 13)
!224 = !DILocation(line: 64, column: 5, scope: !208)
!225 = !DILocation(line: 65, column: 1, scope: !198)
!226 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_21_good", scope: !69, file: !69, line: 388, type: !82, scopeLine: 389, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!227 = !DILocation(line: 390, column: 5, scope: !226)
!228 = !DILocation(line: 391, column: 5, scope: !226)
!229 = !DILocation(line: 392, column: 5, scope: !226)
!230 = !DILocation(line: 393, column: 1, scope: !226)
!231 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 404, type: !232, scopeLine: 405, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!232 = !DISubroutineType(types: !233)
!233 = !{!70, !70, !234}
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!236 = !DILocalVariable(name: "argc", arg: 1, scope: !231, file: !69, line: 404, type: !70)
!237 = !DILocation(line: 404, column: 14, scope: !231)
!238 = !DILocalVariable(name: "argv", arg: 2, scope: !231, file: !69, line: 404, type: !234)
!239 = !DILocation(line: 404, column: 27, scope: !231)
!240 = !DILocation(line: 407, column: 22, scope: !231)
!241 = !DILocation(line: 407, column: 12, scope: !231)
!242 = !DILocation(line: 407, column: 5, scope: !231)
!243 = !DILocation(line: 409, column: 5, scope: !231)
!244 = !DILocation(line: 410, column: 5, scope: !231)
!245 = !DILocation(line: 411, column: 5, scope: !231)
!246 = !DILocation(line: 414, column: 5, scope: !231)
!247 = !DILocation(line: 415, column: 5, scope: !231)
!248 = !DILocation(line: 416, column: 5, scope: !231)
!249 = !DILocation(line: 418, column: 5, scope: !231)
!250 = distinct !DISubprogram(name: "goodB2G1", scope: !69, file: !69, line: 179, type: !82, scopeLine: 180, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!251 = !DILocalVariable(name: "data", scope: !250, file: !69, line: 181, type: !70)
!252 = !DILocation(line: 181, column: 9, scope: !250)
!253 = !DILocation(line: 183, column: 10, scope: !250)
!254 = !DILocalVariable(name: "recvResult", scope: !255, file: !69, line: 189, type: !70)
!255 = distinct !DILexicalBlock(scope: !250, file: !69, line: 184, column: 5)
!256 = !DILocation(line: 189, column: 13, scope: !255)
!257 = !DILocalVariable(name: "service", scope: !255, file: !69, line: 190, type: !92)
!258 = !DILocation(line: 190, column: 28, scope: !255)
!259 = !DILocalVariable(name: "listenSocket", scope: !255, file: !69, line: 191, type: !70)
!260 = !DILocation(line: 191, column: 16, scope: !255)
!261 = !DILocalVariable(name: "acceptSocket", scope: !255, file: !69, line: 192, type: !70)
!262 = !DILocation(line: 192, column: 16, scope: !255)
!263 = !DILocalVariable(name: "inputBuffer", scope: !255, file: !69, line: 193, type: !62)
!264 = !DILocation(line: 193, column: 14, scope: !255)
!265 = !DILocation(line: 194, column: 9, scope: !255)
!266 = !DILocation(line: 204, column: 28, scope: !267)
!267 = distinct !DILexicalBlock(scope: !255, file: !69, line: 195, column: 9)
!268 = !DILocation(line: 204, column: 26, scope: !267)
!269 = !DILocation(line: 205, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !267, file: !69, line: 205, column: 17)
!271 = !DILocation(line: 205, column: 30, scope: !270)
!272 = !DILocation(line: 205, column: 17, scope: !267)
!273 = !DILocation(line: 207, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !69, line: 206, column: 13)
!275 = !DILocation(line: 209, column: 13, scope: !267)
!276 = !DILocation(line: 210, column: 21, scope: !267)
!277 = !DILocation(line: 210, column: 32, scope: !267)
!278 = !DILocation(line: 211, column: 21, scope: !267)
!279 = !DILocation(line: 211, column: 30, scope: !267)
!280 = !DILocation(line: 211, column: 37, scope: !267)
!281 = !DILocation(line: 212, column: 32, scope: !267)
!282 = !DILocation(line: 212, column: 21, scope: !267)
!283 = !DILocation(line: 212, column: 30, scope: !267)
!284 = !DILocation(line: 213, column: 22, scope: !285)
!285 = distinct !DILexicalBlock(scope: !267, file: !69, line: 213, column: 17)
!286 = !DILocation(line: 213, column: 36, scope: !285)
!287 = !DILocation(line: 213, column: 17, scope: !285)
!288 = !DILocation(line: 213, column: 81, scope: !285)
!289 = !DILocation(line: 213, column: 17, scope: !267)
!290 = !DILocation(line: 215, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !285, file: !69, line: 214, column: 13)
!292 = !DILocation(line: 217, column: 24, scope: !293)
!293 = distinct !DILexicalBlock(scope: !267, file: !69, line: 217, column: 17)
!294 = !DILocation(line: 217, column: 17, scope: !293)
!295 = !DILocation(line: 217, column: 54, scope: !293)
!296 = !DILocation(line: 217, column: 17, scope: !267)
!297 = !DILocation(line: 219, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !293, file: !69, line: 218, column: 13)
!299 = !DILocation(line: 221, column: 35, scope: !267)
!300 = !DILocation(line: 221, column: 28, scope: !267)
!301 = !DILocation(line: 221, column: 26, scope: !267)
!302 = !DILocation(line: 222, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !267, file: !69, line: 222, column: 17)
!304 = !DILocation(line: 222, column: 30, scope: !303)
!305 = !DILocation(line: 222, column: 17, scope: !267)
!306 = !DILocation(line: 224, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !69, line: 223, column: 13)
!308 = !DILocation(line: 227, column: 31, scope: !267)
!309 = !DILocation(line: 227, column: 45, scope: !267)
!310 = !DILocation(line: 227, column: 26, scope: !267)
!311 = !DILocation(line: 227, column: 24, scope: !267)
!312 = !DILocation(line: 228, column: 17, scope: !313)
!313 = distinct !DILexicalBlock(scope: !267, file: !69, line: 228, column: 17)
!314 = !DILocation(line: 228, column: 28, scope: !313)
!315 = !DILocation(line: 228, column: 44, scope: !313)
!316 = !DILocation(line: 228, column: 47, scope: !313)
!317 = !DILocation(line: 228, column: 58, scope: !313)
!318 = !DILocation(line: 228, column: 17, scope: !267)
!319 = !DILocation(line: 230, column: 17, scope: !320)
!320 = distinct !DILexicalBlock(scope: !313, file: !69, line: 229, column: 13)
!321 = !DILocation(line: 233, column: 25, scope: !267)
!322 = !DILocation(line: 233, column: 13, scope: !267)
!323 = !DILocation(line: 233, column: 37, scope: !267)
!324 = !DILocation(line: 235, column: 25, scope: !267)
!325 = !DILocation(line: 235, column: 20, scope: !267)
!326 = !DILocation(line: 235, column: 18, scope: !267)
!327 = !DILocation(line: 236, column: 9, scope: !267)
!328 = !DILocation(line: 238, column: 13, scope: !329)
!329 = distinct !DILexicalBlock(scope: !255, file: !69, line: 238, column: 13)
!330 = !DILocation(line: 238, column: 26, scope: !329)
!331 = !DILocation(line: 238, column: 13, scope: !255)
!332 = !DILocation(line: 240, column: 26, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !69, line: 239, column: 9)
!334 = !DILocation(line: 240, column: 13, scope: !333)
!335 = !DILocation(line: 241, column: 9, scope: !333)
!336 = !DILocation(line: 242, column: 13, scope: !337)
!337 = distinct !DILexicalBlock(scope: !255, file: !69, line: 242, column: 13)
!338 = !DILocation(line: 242, column: 26, scope: !337)
!339 = !DILocation(line: 242, column: 13, scope: !255)
!340 = !DILocation(line: 244, column: 26, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !69, line: 243, column: 9)
!342 = !DILocation(line: 244, column: 13, scope: !341)
!343 = !DILocation(line: 245, column: 9, scope: !341)
!344 = !DILocation(line: 253, column: 20, scope: !250)
!345 = !DILocation(line: 254, column: 18, scope: !250)
!346 = !DILocation(line: 254, column: 5, scope: !250)
!347 = !DILocation(line: 255, column: 1, scope: !250)
!348 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !69, file: !69, line: 155, type: !199, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!349 = !DILocalVariable(name: "data", arg: 1, scope: !348, file: !69, line: 155, type: !70)
!350 = !DILocation(line: 155, column: 30, scope: !348)
!351 = !DILocation(line: 157, column: 8, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !69, line: 157, column: 8)
!353 = !DILocation(line: 157, column: 8, scope: !348)
!354 = !DILocation(line: 160, column: 9, scope: !355)
!355 = distinct !DILexicalBlock(scope: !352, file: !69, line: 158, column: 5)
!356 = !DILocation(line: 161, column: 5, scope: !355)
!357 = !DILocalVariable(name: "buffer", scope: !358, file: !69, line: 165, type: !209)
!358 = distinct !DILexicalBlock(scope: !359, file: !69, line: 164, column: 9)
!359 = distinct !DILexicalBlock(scope: !352, file: !69, line: 163, column: 5)
!360 = !DILocation(line: 165, column: 17, scope: !358)
!361 = !DILocation(line: 167, column: 17, scope: !362)
!362 = distinct !DILexicalBlock(scope: !358, file: !69, line: 167, column: 17)
!363 = !DILocation(line: 167, column: 22, scope: !362)
!364 = !DILocation(line: 167, column: 27, scope: !362)
!365 = !DILocation(line: 167, column: 30, scope: !362)
!366 = !DILocation(line: 167, column: 35, scope: !362)
!367 = !DILocation(line: 167, column: 17, scope: !358)
!368 = !DILocation(line: 169, column: 37, scope: !369)
!369 = distinct !DILexicalBlock(scope: !362, file: !69, line: 168, column: 13)
!370 = !DILocation(line: 169, column: 30, scope: !369)
!371 = !DILocation(line: 169, column: 17, scope: !369)
!372 = !DILocation(line: 170, column: 13, scope: !369)
!373 = !DILocation(line: 173, column: 17, scope: !374)
!374 = distinct !DILexicalBlock(scope: !362, file: !69, line: 172, column: 13)
!375 = !DILocation(line: 177, column: 1, scope: !348)
!376 = distinct !DISubprogram(name: "goodB2G2", scope: !69, file: !69, line: 277, type: !82, scopeLine: 278, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!377 = !DILocalVariable(name: "data", scope: !376, file: !69, line: 279, type: !70)
!378 = !DILocation(line: 279, column: 9, scope: !376)
!379 = !DILocation(line: 281, column: 10, scope: !376)
!380 = !DILocalVariable(name: "recvResult", scope: !381, file: !69, line: 287, type: !70)
!381 = distinct !DILexicalBlock(scope: !376, file: !69, line: 282, column: 5)
!382 = !DILocation(line: 287, column: 13, scope: !381)
!383 = !DILocalVariable(name: "service", scope: !381, file: !69, line: 288, type: !92)
!384 = !DILocation(line: 288, column: 28, scope: !381)
!385 = !DILocalVariable(name: "listenSocket", scope: !381, file: !69, line: 289, type: !70)
!386 = !DILocation(line: 289, column: 16, scope: !381)
!387 = !DILocalVariable(name: "acceptSocket", scope: !381, file: !69, line: 290, type: !70)
!388 = !DILocation(line: 290, column: 16, scope: !381)
!389 = !DILocalVariable(name: "inputBuffer", scope: !381, file: !69, line: 291, type: !62)
!390 = !DILocation(line: 291, column: 14, scope: !381)
!391 = !DILocation(line: 292, column: 9, scope: !381)
!392 = !DILocation(line: 302, column: 28, scope: !393)
!393 = distinct !DILexicalBlock(scope: !381, file: !69, line: 293, column: 9)
!394 = !DILocation(line: 302, column: 26, scope: !393)
!395 = !DILocation(line: 303, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !393, file: !69, line: 303, column: 17)
!397 = !DILocation(line: 303, column: 30, scope: !396)
!398 = !DILocation(line: 303, column: 17, scope: !393)
!399 = !DILocation(line: 305, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !69, line: 304, column: 13)
!401 = !DILocation(line: 307, column: 13, scope: !393)
!402 = !DILocation(line: 308, column: 21, scope: !393)
!403 = !DILocation(line: 308, column: 32, scope: !393)
!404 = !DILocation(line: 309, column: 21, scope: !393)
!405 = !DILocation(line: 309, column: 30, scope: !393)
!406 = !DILocation(line: 309, column: 37, scope: !393)
!407 = !DILocation(line: 310, column: 32, scope: !393)
!408 = !DILocation(line: 310, column: 21, scope: !393)
!409 = !DILocation(line: 310, column: 30, scope: !393)
!410 = !DILocation(line: 311, column: 22, scope: !411)
!411 = distinct !DILexicalBlock(scope: !393, file: !69, line: 311, column: 17)
!412 = !DILocation(line: 311, column: 36, scope: !411)
!413 = !DILocation(line: 311, column: 17, scope: !411)
!414 = !DILocation(line: 311, column: 81, scope: !411)
!415 = !DILocation(line: 311, column: 17, scope: !393)
!416 = !DILocation(line: 313, column: 17, scope: !417)
!417 = distinct !DILexicalBlock(scope: !411, file: !69, line: 312, column: 13)
!418 = !DILocation(line: 315, column: 24, scope: !419)
!419 = distinct !DILexicalBlock(scope: !393, file: !69, line: 315, column: 17)
!420 = !DILocation(line: 315, column: 17, scope: !419)
!421 = !DILocation(line: 315, column: 54, scope: !419)
!422 = !DILocation(line: 315, column: 17, scope: !393)
!423 = !DILocation(line: 317, column: 17, scope: !424)
!424 = distinct !DILexicalBlock(scope: !419, file: !69, line: 316, column: 13)
!425 = !DILocation(line: 319, column: 35, scope: !393)
!426 = !DILocation(line: 319, column: 28, scope: !393)
!427 = !DILocation(line: 319, column: 26, scope: !393)
!428 = !DILocation(line: 320, column: 17, scope: !429)
!429 = distinct !DILexicalBlock(scope: !393, file: !69, line: 320, column: 17)
!430 = !DILocation(line: 320, column: 30, scope: !429)
!431 = !DILocation(line: 320, column: 17, scope: !393)
!432 = !DILocation(line: 322, column: 17, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !69, line: 321, column: 13)
!434 = !DILocation(line: 325, column: 31, scope: !393)
!435 = !DILocation(line: 325, column: 45, scope: !393)
!436 = !DILocation(line: 325, column: 26, scope: !393)
!437 = !DILocation(line: 325, column: 24, scope: !393)
!438 = !DILocation(line: 326, column: 17, scope: !439)
!439 = distinct !DILexicalBlock(scope: !393, file: !69, line: 326, column: 17)
!440 = !DILocation(line: 326, column: 28, scope: !439)
!441 = !DILocation(line: 326, column: 44, scope: !439)
!442 = !DILocation(line: 326, column: 47, scope: !439)
!443 = !DILocation(line: 326, column: 58, scope: !439)
!444 = !DILocation(line: 326, column: 17, scope: !393)
!445 = !DILocation(line: 328, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !439, file: !69, line: 327, column: 13)
!447 = !DILocation(line: 331, column: 25, scope: !393)
!448 = !DILocation(line: 331, column: 13, scope: !393)
!449 = !DILocation(line: 331, column: 37, scope: !393)
!450 = !DILocation(line: 333, column: 25, scope: !393)
!451 = !DILocation(line: 333, column: 20, scope: !393)
!452 = !DILocation(line: 333, column: 18, scope: !393)
!453 = !DILocation(line: 334, column: 9, scope: !393)
!454 = !DILocation(line: 336, column: 13, scope: !455)
!455 = distinct !DILexicalBlock(scope: !381, file: !69, line: 336, column: 13)
!456 = !DILocation(line: 336, column: 26, scope: !455)
!457 = !DILocation(line: 336, column: 13, scope: !381)
!458 = !DILocation(line: 338, column: 26, scope: !459)
!459 = distinct !DILexicalBlock(scope: !455, file: !69, line: 337, column: 9)
!460 = !DILocation(line: 338, column: 13, scope: !459)
!461 = !DILocation(line: 339, column: 9, scope: !459)
!462 = !DILocation(line: 340, column: 13, scope: !463)
!463 = distinct !DILexicalBlock(scope: !381, file: !69, line: 340, column: 13)
!464 = !DILocation(line: 340, column: 26, scope: !463)
!465 = !DILocation(line: 340, column: 13, scope: !381)
!466 = !DILocation(line: 342, column: 26, scope: !467)
!467 = distinct !DILexicalBlock(scope: !463, file: !69, line: 341, column: 9)
!468 = !DILocation(line: 342, column: 13, scope: !467)
!469 = !DILocation(line: 343, column: 9, scope: !467)
!470 = !DILocation(line: 351, column: 20, scope: !376)
!471 = !DILocation(line: 352, column: 18, scope: !376)
!472 = !DILocation(line: 352, column: 5, scope: !376)
!473 = !DILocation(line: 353, column: 1, scope: !376)
!474 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !69, file: !69, line: 258, type: !199, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!475 = !DILocalVariable(name: "data", arg: 1, scope: !474, file: !69, line: 258, type: !70)
!476 = !DILocation(line: 258, column: 30, scope: !474)
!477 = !DILocation(line: 260, column: 8, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !69, line: 260, column: 8)
!479 = !DILocation(line: 260, column: 8, scope: !474)
!480 = !DILocalVariable(name: "buffer", scope: !481, file: !69, line: 263, type: !209)
!481 = distinct !DILexicalBlock(scope: !482, file: !69, line: 262, column: 9)
!482 = distinct !DILexicalBlock(scope: !478, file: !69, line: 261, column: 5)
!483 = !DILocation(line: 263, column: 17, scope: !481)
!484 = !DILocation(line: 265, column: 17, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !69, line: 265, column: 17)
!486 = !DILocation(line: 265, column: 22, scope: !485)
!487 = !DILocation(line: 265, column: 27, scope: !485)
!488 = !DILocation(line: 265, column: 30, scope: !485)
!489 = !DILocation(line: 265, column: 35, scope: !485)
!490 = !DILocation(line: 265, column: 17, scope: !481)
!491 = !DILocation(line: 267, column: 37, scope: !492)
!492 = distinct !DILexicalBlock(scope: !485, file: !69, line: 266, column: 13)
!493 = !DILocation(line: 267, column: 30, scope: !492)
!494 = !DILocation(line: 267, column: 17, scope: !492)
!495 = !DILocation(line: 268, column: 13, scope: !492)
!496 = !DILocation(line: 271, column: 17, scope: !497)
!497 = distinct !DILexicalBlock(scope: !485, file: !69, line: 270, column: 13)
!498 = !DILocation(line: 274, column: 5, scope: !482)
!499 = !DILocation(line: 275, column: 1, scope: !474)
!500 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 376, type: !82, scopeLine: 377, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!501 = !DILocalVariable(name: "data", scope: !500, file: !69, line: 378, type: !70)
!502 = !DILocation(line: 378, column: 9, scope: !500)
!503 = !DILocation(line: 380, column: 10, scope: !500)
!504 = !DILocation(line: 383, column: 10, scope: !500)
!505 = !DILocation(line: 384, column: 19, scope: !500)
!506 = !DILocation(line: 385, column: 17, scope: !500)
!507 = !DILocation(line: 385, column: 5, scope: !500)
!508 = !DILocation(line: 386, column: 1, scope: !500)
!509 = distinct !DISubprogram(name: "goodG2BSink", scope: !69, file: !69, line: 356, type: !199, scopeLine: 357, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!510 = !DILocalVariable(name: "data", arg: 1, scope: !509, file: !69, line: 356, type: !70)
!511 = !DILocation(line: 356, column: 29, scope: !509)
!512 = !DILocation(line: 358, column: 8, scope: !513)
!513 = distinct !DILexicalBlock(scope: !509, file: !69, line: 358, column: 8)
!514 = !DILocation(line: 358, column: 8, scope: !509)
!515 = !DILocalVariable(name: "buffer", scope: !516, file: !69, line: 361, type: !209)
!516 = distinct !DILexicalBlock(scope: !517, file: !69, line: 360, column: 9)
!517 = distinct !DILexicalBlock(scope: !513, file: !69, line: 359, column: 5)
!518 = !DILocation(line: 361, column: 17, scope: !516)
!519 = !DILocation(line: 364, column: 17, scope: !520)
!520 = distinct !DILexicalBlock(scope: !516, file: !69, line: 364, column: 17)
!521 = !DILocation(line: 364, column: 22, scope: !520)
!522 = !DILocation(line: 364, column: 17, scope: !516)
!523 = !DILocation(line: 366, column: 37, scope: !524)
!524 = distinct !DILexicalBlock(scope: !520, file: !69, line: 365, column: 13)
!525 = !DILocation(line: 366, column: 30, scope: !524)
!526 = !DILocation(line: 366, column: 17, scope: !524)
!527 = !DILocation(line: 367, column: 13, scope: !524)
!528 = !DILocation(line: 370, column: 17, scope: !529)
!529 = distinct !DILexicalBlock(scope: !520, file: !69, line: 369, column: 13)
!530 = !DILocation(line: 373, column: 5, scope: !517)
!531 = !DILocation(line: 374, column: 1, scope: !509)
