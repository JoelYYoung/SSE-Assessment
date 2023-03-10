; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_21.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_21.c"
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
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !67
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !71
@goodG2BStatic = internal global i32 0, align 4, !dbg !73

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_21_bad() #0 !dbg !81 {
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
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !201, metadata !DIExpression()), !dbg !202
  %0 = load i32, i32* @badStatic, align 4, !dbg !203
  %tobool = icmp ne i32 %0, 0, !dbg !203
  br i1 %tobool, label %if.then, label %if.end5, !dbg !205

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !206, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !210, metadata !DIExpression()), !dbg !214
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !214
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !214
  %2 = load i32, i32* %data.addr, align 4, !dbg !215
  %cmp = icmp slt i32 %2, 10, !dbg !217
  br i1 %cmp, label %if.then1, label %if.else, !dbg !218

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !219
  %idxprom = sext i32 %3 to i64, !dbg !221
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !221
  store i32 1, i32* %arrayidx, align 4, !dbg !222
  store i32 0, i32* %i, align 4, !dbg !223
  br label %for.cond, !dbg !225

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !226
  %cmp2 = icmp slt i32 %4, 10, !dbg !228
  br i1 %cmp2, label %for.body, label %for.end, !dbg !229

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !230
  %idxprom3 = sext i32 %5 to i64, !dbg !232
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !232
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !232
  call void @printIntLine(i32 %6), !dbg !233
  br label %for.inc, !dbg !234

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !235
  %inc = add nsw i32 %7, 1, !dbg !235
  store i32 %inc, i32* %i, align 4, !dbg !235
  br label %for.cond, !dbg !236, !llvm.loop !237

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !240

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !241
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !243

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !244
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_21_good() #0 !dbg !245 {
entry:
  call void @goodB2G1(), !dbg !246
  call void @goodB2G2(), !dbg !247
  call void @goodG2B(), !dbg !248
  ret void, !dbg !249
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !250 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !255, metadata !DIExpression()), !dbg !256
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !257, metadata !DIExpression()), !dbg !258
  %call = call i64 @time(i64* null) #7, !dbg !259
  %conv = trunc i64 %call to i32, !dbg !260
  call void @srand(i32 %conv) #7, !dbg !261
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !262
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_21_good(), !dbg !263
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !264
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !265
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_21_bad(), !dbg !266
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !267
  ret i32 0, !dbg !268
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !269 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !270, metadata !DIExpression()), !dbg !271
  store i32 -1, i32* %data, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !273, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !276, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !278, metadata !DIExpression()), !dbg !279
  store i32 -1, i32* %listenSocket, align 4, !dbg !279
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !280, metadata !DIExpression()), !dbg !281
  store i32 -1, i32* %acceptSocket, align 4, !dbg !281
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !282, metadata !DIExpression()), !dbg !283
  br label %do.body, !dbg !284

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !285
  store i32 %call, i32* %listenSocket, align 4, !dbg !287
  %0 = load i32, i32* %listenSocket, align 4, !dbg !288
  %cmp = icmp eq i32 %0, -1, !dbg !290
  br i1 %cmp, label %if.then, label %if.end, !dbg !291

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !292

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !294
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !294
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !295
  store i16 2, i16* %sin_family, align 4, !dbg !296
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !297
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !298
  store i32 0, i32* %s_addr, align 4, !dbg !299
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !300
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !301
  store i16 %call1, i16* %sin_port, align 2, !dbg !302
  %2 = load i32, i32* %listenSocket, align 4, !dbg !303
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !305
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !306
  %cmp3 = icmp eq i32 %call2, -1, !dbg !307
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !308

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !309

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !311
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !313
  %cmp7 = icmp eq i32 %call6, -1, !dbg !314
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !315

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !316

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !318
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !319
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !320
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !321
  %cmp11 = icmp eq i32 %6, -1, !dbg !323
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !324

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !325

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !327
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !328
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !329
  %conv = trunc i64 %call14 to i32, !dbg !329
  store i32 %conv, i32* %recvResult, align 4, !dbg !330
  %8 = load i32, i32* %recvResult, align 4, !dbg !331
  %cmp15 = icmp eq i32 %8, -1, !dbg !333
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !334

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !335
  %cmp17 = icmp eq i32 %9, 0, !dbg !336
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !337

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !338

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !340
  %idxprom = sext i32 %10 to i64, !dbg !341
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !341
  store i8 0, i8* %arrayidx, align 1, !dbg !342
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !343
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !344
  store i32 %call22, i32* %data, align 4, !dbg !345
  br label %do.end, !dbg !346

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !347
  %cmp23 = icmp ne i32 %11, -1, !dbg !349
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !350

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !351
  %call26 = call i32 @close(i32 %12), !dbg !353
  br label %if.end27, !dbg !354

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !355
  %cmp28 = icmp ne i32 %13, -1, !dbg !357
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !358

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !359
  %call31 = call i32 @close(i32 %14), !dbg !361
  br label %if.end32, !dbg !362

if.end32:                                         ; preds = %if.then30, %if.end27
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !363
  %15 = load i32, i32* %data, align 4, !dbg !364
  call void @goodB2G1Sink(i32 %15), !dbg !365
  ret void, !dbg !366
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1Sink(i32 %data) #0 !dbg !367 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !368, metadata !DIExpression()), !dbg !369
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !370
  %tobool = icmp ne i32 %0, 0, !dbg !370
  br i1 %tobool, label %if.then, label %if.else, !dbg !372

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !373
  br label %if.end7, !dbg !375

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !376, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !380, metadata !DIExpression()), !dbg !381
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !381
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !381
  %2 = load i32, i32* %data.addr, align 4, !dbg !382
  %cmp = icmp sge i32 %2, 0, !dbg !384
  br i1 %cmp, label %land.lhs.true, label %if.else6, !dbg !385

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !386
  %cmp1 = icmp slt i32 %3, 10, !dbg !387
  br i1 %cmp1, label %if.then2, label %if.else6, !dbg !388

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !389
  %idxprom = sext i32 %4 to i64, !dbg !391
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !391
  store i32 1, i32* %arrayidx, align 4, !dbg !392
  store i32 0, i32* %i, align 4, !dbg !393
  br label %for.cond, !dbg !395

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !396
  %cmp3 = icmp slt i32 %5, 10, !dbg !398
  br i1 %cmp3, label %for.body, label %for.end, !dbg !399

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !400
  %idxprom4 = sext i32 %6 to i64, !dbg !402
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !402
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !402
  call void @printIntLine(i32 %7), !dbg !403
  br label %for.inc, !dbg !404

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !405
  %inc = add nsw i32 %8, 1, !dbg !405
  store i32 %inc, i32* %i, align 4, !dbg !405
  br label %for.cond, !dbg !406, !llvm.loop !407

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !409

if.else6:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !410
  br label %if.end

if.end:                                           ; preds = %if.else6, %for.end
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !412
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !413 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !414, metadata !DIExpression()), !dbg !415
  store i32 -1, i32* %data, align 4, !dbg !416
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !417, metadata !DIExpression()), !dbg !419
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !420, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !422, metadata !DIExpression()), !dbg !423
  store i32 -1, i32* %listenSocket, align 4, !dbg !423
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !424, metadata !DIExpression()), !dbg !425
  store i32 -1, i32* %acceptSocket, align 4, !dbg !425
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !426, metadata !DIExpression()), !dbg !427
  br label %do.body, !dbg !428

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !429
  store i32 %call, i32* %listenSocket, align 4, !dbg !431
  %0 = load i32, i32* %listenSocket, align 4, !dbg !432
  %cmp = icmp eq i32 %0, -1, !dbg !434
  br i1 %cmp, label %if.then, label %if.end, !dbg !435

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !436

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !438
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !438
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !439
  store i16 2, i16* %sin_family, align 4, !dbg !440
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !441
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !442
  store i32 0, i32* %s_addr, align 4, !dbg !443
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !444
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !445
  store i16 %call1, i16* %sin_port, align 2, !dbg !446
  %2 = load i32, i32* %listenSocket, align 4, !dbg !447
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !449
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !450
  %cmp3 = icmp eq i32 %call2, -1, !dbg !451
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !452

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !453

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !455
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !457
  %cmp7 = icmp eq i32 %call6, -1, !dbg !458
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !459

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !460

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !462
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !463
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !464
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !465
  %cmp11 = icmp eq i32 %6, -1, !dbg !467
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !468

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !469

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !471
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !472
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !473
  %conv = trunc i64 %call14 to i32, !dbg !473
  store i32 %conv, i32* %recvResult, align 4, !dbg !474
  %8 = load i32, i32* %recvResult, align 4, !dbg !475
  %cmp15 = icmp eq i32 %8, -1, !dbg !477
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !478

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !479
  %cmp17 = icmp eq i32 %9, 0, !dbg !480
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !481

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !482

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !484
  %idxprom = sext i32 %10 to i64, !dbg !485
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !485
  store i8 0, i8* %arrayidx, align 1, !dbg !486
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !487
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !488
  store i32 %call22, i32* %data, align 4, !dbg !489
  br label %do.end, !dbg !490

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !491
  %cmp23 = icmp ne i32 %11, -1, !dbg !493
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !494

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !495
  %call26 = call i32 @close(i32 %12), !dbg !497
  br label %if.end27, !dbg !498

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !499
  %cmp28 = icmp ne i32 %13, -1, !dbg !501
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !502

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !503
  %call31 = call i32 @close(i32 %14), !dbg !505
  br label %if.end32, !dbg !506

if.end32:                                         ; preds = %if.then30, %if.end27
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !507
  %15 = load i32, i32* %data, align 4, !dbg !508
  call void @goodB2G2Sink(i32 %15), !dbg !509
  ret void, !dbg !510
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2Sink(i32 %data) #0 !dbg !511 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !512, metadata !DIExpression()), !dbg !513
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !514
  %tobool = icmp ne i32 %0, 0, !dbg !514
  br i1 %tobool, label %if.then, label %if.end6, !dbg !516

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !517, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !521, metadata !DIExpression()), !dbg !522
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !522
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !522
  %2 = load i32, i32* %data.addr, align 4, !dbg !523
  %cmp = icmp sge i32 %2, 0, !dbg !525
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !526

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !527
  %cmp1 = icmp slt i32 %3, 10, !dbg !528
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !529

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !530
  %idxprom = sext i32 %4 to i64, !dbg !532
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !532
  store i32 1, i32* %arrayidx, align 4, !dbg !533
  store i32 0, i32* %i, align 4, !dbg !534
  br label %for.cond, !dbg !536

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4, !dbg !537
  %cmp3 = icmp slt i32 %5, 10, !dbg !539
  br i1 %cmp3, label %for.body, label %for.end, !dbg !540

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !541
  %idxprom4 = sext i32 %6 to i64, !dbg !543
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !543
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !543
  call void @printIntLine(i32 %7), !dbg !544
  br label %for.inc, !dbg !545

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !546
  %inc = add nsw i32 %8, 1, !dbg !546
  store i32 %inc, i32* %i, align 4, !dbg !546
  br label %for.cond, !dbg !547, !llvm.loop !548

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !550

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !551
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end6, !dbg !553

if.end6:                                          ; preds = %if.end, %entry
  ret void, !dbg !554
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !555 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !556, metadata !DIExpression()), !dbg !557
  store i32 -1, i32* %data, align 4, !dbg !558
  store i32 7, i32* %data, align 4, !dbg !559
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !560
  %0 = load i32, i32* %data, align 4, !dbg !561
  call void @goodG2BSink(i32 %0), !dbg !562
  ret void, !dbg !563
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !564 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !565, metadata !DIExpression()), !dbg !566
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !567
  %tobool = icmp ne i32 %0, 0, !dbg !567
  br i1 %tobool, label %if.then, label %if.end5, !dbg !569

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !570, metadata !DIExpression()), !dbg !573
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !574, metadata !DIExpression()), !dbg !575
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !575
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !575
  %2 = load i32, i32* %data.addr, align 4, !dbg !576
  %cmp = icmp slt i32 %2, 10, !dbg !578
  br i1 %cmp, label %if.then1, label %if.else, !dbg !579

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !580
  %idxprom = sext i32 %3 to i64, !dbg !582
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !582
  store i32 1, i32* %arrayidx, align 4, !dbg !583
  store i32 0, i32* %i, align 4, !dbg !584
  br label %for.cond, !dbg !586

for.cond:                                         ; preds = %for.inc, %if.then1
  %4 = load i32, i32* %i, align 4, !dbg !587
  %cmp2 = icmp slt i32 %4, 10, !dbg !589
  br i1 %cmp2, label %for.body, label %for.end, !dbg !590

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !591
  %idxprom3 = sext i32 %5 to i64, !dbg !593
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !593
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !593
  call void @printIntLine(i32 %6), !dbg !594
  br label %for.inc, !dbg !595

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !596
  %inc = add nsw i32 %7, 1, !dbg !596
  store i32 %inc, i32* %i, align 4, !dbg !596
  br label %for.cond, !dbg !597, !llvm.loop !598

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !600

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !601
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %if.end5, !dbg !603

if.end5:                                          ; preds = %if.end, %entry
  ret void, !dbg !604
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_21.c", directory: "/home/joelyang/SSE-Assessment")
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
!68 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !69, line: 156, type: !70, isLocal: true, isDefinition: true)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_21.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !69, line: 157, type: !70, isLocal: true, isDefinition: true)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !69, line: 158, type: !70, isLocal: true, isDefinition: true)
!75 = !{i32 7, !"Dwarf Version", i32 4}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{i32 7, !"uwtable", i32 1}
!79 = !{i32 7, !"frame-pointer", i32 2}
!80 = !{!"clang version 13.0.0"}
!81 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_21_bad", scope: !69, file: !69, line: 73, type: !82, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!82 = !DISubroutineType(types: !83)
!83 = !{null}
!84 = !{}
!85 = !DILocalVariable(name: "data", scope: !81, file: !69, line: 75, type: !70)
!86 = !DILocation(line: 75, column: 9, scope: !81)
!87 = !DILocation(line: 77, column: 10, scope: !81)
!88 = !DILocalVariable(name: "recvResult", scope: !89, file: !69, line: 83, type: !70)
!89 = distinct !DILexicalBlock(scope: !81, file: !69, line: 78, column: 5)
!90 = !DILocation(line: 83, column: 13, scope: !89)
!91 = !DILocalVariable(name: "service", scope: !89, file: !69, line: 84, type: !92)
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
!108 = !DILocation(line: 84, column: 28, scope: !89)
!109 = !DILocalVariable(name: "listenSocket", scope: !89, file: !69, line: 85, type: !70)
!110 = !DILocation(line: 85, column: 16, scope: !89)
!111 = !DILocalVariable(name: "acceptSocket", scope: !89, file: !69, line: 86, type: !70)
!112 = !DILocation(line: 86, column: 16, scope: !89)
!113 = !DILocalVariable(name: "inputBuffer", scope: !89, file: !69, line: 87, type: !62)
!114 = !DILocation(line: 87, column: 14, scope: !89)
!115 = !DILocation(line: 88, column: 9, scope: !89)
!116 = !DILocation(line: 98, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !89, file: !69, line: 89, column: 9)
!118 = !DILocation(line: 98, column: 26, scope: !117)
!119 = !DILocation(line: 99, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !69, line: 99, column: 17)
!121 = !DILocation(line: 99, column: 30, scope: !120)
!122 = !DILocation(line: 99, column: 17, scope: !117)
!123 = !DILocation(line: 101, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !69, line: 100, column: 13)
!125 = !DILocation(line: 103, column: 13, scope: !117)
!126 = !DILocation(line: 104, column: 21, scope: !117)
!127 = !DILocation(line: 104, column: 32, scope: !117)
!128 = !DILocation(line: 105, column: 21, scope: !117)
!129 = !DILocation(line: 105, column: 30, scope: !117)
!130 = !DILocation(line: 105, column: 37, scope: !117)
!131 = !DILocation(line: 106, column: 32, scope: !117)
!132 = !DILocation(line: 106, column: 21, scope: !117)
!133 = !DILocation(line: 106, column: 30, scope: !117)
!134 = !DILocation(line: 107, column: 22, scope: !135)
!135 = distinct !DILexicalBlock(scope: !117, file: !69, line: 107, column: 17)
!136 = !DILocation(line: 107, column: 36, scope: !135)
!137 = !DILocation(line: 107, column: 17, scope: !135)
!138 = !DILocation(line: 107, column: 81, scope: !135)
!139 = !DILocation(line: 107, column: 17, scope: !117)
!140 = !DILocation(line: 109, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !69, line: 108, column: 13)
!142 = !DILocation(line: 111, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !117, file: !69, line: 111, column: 17)
!144 = !DILocation(line: 111, column: 17, scope: !143)
!145 = !DILocation(line: 111, column: 54, scope: !143)
!146 = !DILocation(line: 111, column: 17, scope: !117)
!147 = !DILocation(line: 113, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !69, line: 112, column: 13)
!149 = !DILocation(line: 115, column: 35, scope: !117)
!150 = !DILocation(line: 115, column: 28, scope: !117)
!151 = !DILocation(line: 115, column: 26, scope: !117)
!152 = !DILocation(line: 116, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !117, file: !69, line: 116, column: 17)
!154 = !DILocation(line: 116, column: 30, scope: !153)
!155 = !DILocation(line: 116, column: 17, scope: !117)
!156 = !DILocation(line: 118, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !69, line: 117, column: 13)
!158 = !DILocation(line: 121, column: 31, scope: !117)
!159 = !DILocation(line: 121, column: 45, scope: !117)
!160 = !DILocation(line: 121, column: 26, scope: !117)
!161 = !DILocation(line: 121, column: 24, scope: !117)
!162 = !DILocation(line: 122, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !117, file: !69, line: 122, column: 17)
!164 = !DILocation(line: 122, column: 28, scope: !163)
!165 = !DILocation(line: 122, column: 44, scope: !163)
!166 = !DILocation(line: 122, column: 47, scope: !163)
!167 = !DILocation(line: 122, column: 58, scope: !163)
!168 = !DILocation(line: 122, column: 17, scope: !117)
!169 = !DILocation(line: 124, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !163, file: !69, line: 123, column: 13)
!171 = !DILocation(line: 127, column: 25, scope: !117)
!172 = !DILocation(line: 127, column: 13, scope: !117)
!173 = !DILocation(line: 127, column: 37, scope: !117)
!174 = !DILocation(line: 129, column: 25, scope: !117)
!175 = !DILocation(line: 129, column: 20, scope: !117)
!176 = !DILocation(line: 129, column: 18, scope: !117)
!177 = !DILocation(line: 130, column: 9, scope: !117)
!178 = !DILocation(line: 132, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !89, file: !69, line: 132, column: 13)
!180 = !DILocation(line: 132, column: 26, scope: !179)
!181 = !DILocation(line: 132, column: 13, scope: !89)
!182 = !DILocation(line: 134, column: 26, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !69, line: 133, column: 9)
!184 = !DILocation(line: 134, column: 13, scope: !183)
!185 = !DILocation(line: 135, column: 9, scope: !183)
!186 = !DILocation(line: 136, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !89, file: !69, line: 136, column: 13)
!188 = !DILocation(line: 136, column: 26, scope: !187)
!189 = !DILocation(line: 136, column: 13, scope: !89)
!190 = !DILocation(line: 138, column: 26, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !69, line: 137, column: 9)
!192 = !DILocation(line: 138, column: 13, scope: !191)
!193 = !DILocation(line: 139, column: 9, scope: !191)
!194 = !DILocation(line: 147, column: 15, scope: !81)
!195 = !DILocation(line: 148, column: 13, scope: !81)
!196 = !DILocation(line: 148, column: 5, scope: !81)
!197 = !DILocation(line: 149, column: 1, scope: !81)
!198 = distinct !DISubprogram(name: "badSink", scope: !69, file: !69, line: 47, type: !199, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!199 = !DISubroutineType(types: !200)
!200 = !{null, !70}
!201 = !DILocalVariable(name: "data", arg: 1, scope: !198, file: !69, line: 47, type: !70)
!202 = !DILocation(line: 47, column: 25, scope: !198)
!203 = !DILocation(line: 49, column: 8, scope: !204)
!204 = distinct !DILexicalBlock(scope: !198, file: !69, line: 49, column: 8)
!205 = !DILocation(line: 49, column: 8, scope: !198)
!206 = !DILocalVariable(name: "i", scope: !207, file: !69, line: 52, type: !70)
!207 = distinct !DILexicalBlock(scope: !208, file: !69, line: 51, column: 9)
!208 = distinct !DILexicalBlock(scope: !204, file: !69, line: 50, column: 5)
!209 = !DILocation(line: 52, column: 17, scope: !207)
!210 = !DILocalVariable(name: "buffer", scope: !207, file: !69, line: 53, type: !211)
!211 = !DICompositeType(tag: DW_TAG_array_type, baseType: !70, size: 320, elements: !212)
!212 = !{!213}
!213 = !DISubrange(count: 10)
!214 = !DILocation(line: 53, column: 17, scope: !207)
!215 = !DILocation(line: 56, column: 17, scope: !216)
!216 = distinct !DILexicalBlock(scope: !207, file: !69, line: 56, column: 17)
!217 = !DILocation(line: 56, column: 22, scope: !216)
!218 = !DILocation(line: 56, column: 17, scope: !207)
!219 = !DILocation(line: 58, column: 24, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !69, line: 57, column: 13)
!221 = !DILocation(line: 58, column: 17, scope: !220)
!222 = !DILocation(line: 58, column: 30, scope: !220)
!223 = !DILocation(line: 60, column: 23, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !69, line: 60, column: 17)
!225 = !DILocation(line: 60, column: 21, scope: !224)
!226 = !DILocation(line: 60, column: 28, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !69, line: 60, column: 17)
!228 = !DILocation(line: 60, column: 30, scope: !227)
!229 = !DILocation(line: 60, column: 17, scope: !224)
!230 = !DILocation(line: 62, column: 41, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !69, line: 61, column: 17)
!232 = !DILocation(line: 62, column: 34, scope: !231)
!233 = !DILocation(line: 62, column: 21, scope: !231)
!234 = !DILocation(line: 63, column: 17, scope: !231)
!235 = !DILocation(line: 60, column: 37, scope: !227)
!236 = !DILocation(line: 60, column: 17, scope: !227)
!237 = distinct !{!237, !229, !238, !239}
!238 = !DILocation(line: 63, column: 17, scope: !224)
!239 = !{!"llvm.loop.mustprogress"}
!240 = !DILocation(line: 64, column: 13, scope: !220)
!241 = !DILocation(line: 67, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !216, file: !69, line: 66, column: 13)
!243 = !DILocation(line: 70, column: 5, scope: !208)
!244 = !DILocation(line: 71, column: 1, scope: !198)
!245 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_21_good", scope: !69, file: !69, line: 412, type: !82, scopeLine: 413, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!246 = !DILocation(line: 414, column: 5, scope: !245)
!247 = !DILocation(line: 415, column: 5, scope: !245)
!248 = !DILocation(line: 416, column: 5, scope: !245)
!249 = !DILocation(line: 417, column: 1, scope: !245)
!250 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 428, type: !251, scopeLine: 429, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !84)
!251 = !DISubroutineType(types: !252)
!252 = !{!70, !70, !253}
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!255 = !DILocalVariable(name: "argc", arg: 1, scope: !250, file: !69, line: 428, type: !70)
!256 = !DILocation(line: 428, column: 14, scope: !250)
!257 = !DILocalVariable(name: "argv", arg: 2, scope: !250, file: !69, line: 428, type: !253)
!258 = !DILocation(line: 428, column: 27, scope: !250)
!259 = !DILocation(line: 431, column: 22, scope: !250)
!260 = !DILocation(line: 431, column: 12, scope: !250)
!261 = !DILocation(line: 431, column: 5, scope: !250)
!262 = !DILocation(line: 433, column: 5, scope: !250)
!263 = !DILocation(line: 434, column: 5, scope: !250)
!264 = !DILocation(line: 435, column: 5, scope: !250)
!265 = !DILocation(line: 438, column: 5, scope: !250)
!266 = !DILocation(line: 439, column: 5, scope: !250)
!267 = !DILocation(line: 440, column: 5, scope: !250)
!268 = !DILocation(line: 442, column: 5, scope: !250)
!269 = distinct !DISubprogram(name: "goodB2G1", scope: !69, file: !69, line: 191, type: !82, scopeLine: 192, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!270 = !DILocalVariable(name: "data", scope: !269, file: !69, line: 193, type: !70)
!271 = !DILocation(line: 193, column: 9, scope: !269)
!272 = !DILocation(line: 195, column: 10, scope: !269)
!273 = !DILocalVariable(name: "recvResult", scope: !274, file: !69, line: 201, type: !70)
!274 = distinct !DILexicalBlock(scope: !269, file: !69, line: 196, column: 5)
!275 = !DILocation(line: 201, column: 13, scope: !274)
!276 = !DILocalVariable(name: "service", scope: !274, file: !69, line: 202, type: !92)
!277 = !DILocation(line: 202, column: 28, scope: !274)
!278 = !DILocalVariable(name: "listenSocket", scope: !274, file: !69, line: 203, type: !70)
!279 = !DILocation(line: 203, column: 16, scope: !274)
!280 = !DILocalVariable(name: "acceptSocket", scope: !274, file: !69, line: 204, type: !70)
!281 = !DILocation(line: 204, column: 16, scope: !274)
!282 = !DILocalVariable(name: "inputBuffer", scope: !274, file: !69, line: 205, type: !62)
!283 = !DILocation(line: 205, column: 14, scope: !274)
!284 = !DILocation(line: 206, column: 9, scope: !274)
!285 = !DILocation(line: 216, column: 28, scope: !286)
!286 = distinct !DILexicalBlock(scope: !274, file: !69, line: 207, column: 9)
!287 = !DILocation(line: 216, column: 26, scope: !286)
!288 = !DILocation(line: 217, column: 17, scope: !289)
!289 = distinct !DILexicalBlock(scope: !286, file: !69, line: 217, column: 17)
!290 = !DILocation(line: 217, column: 30, scope: !289)
!291 = !DILocation(line: 217, column: 17, scope: !286)
!292 = !DILocation(line: 219, column: 17, scope: !293)
!293 = distinct !DILexicalBlock(scope: !289, file: !69, line: 218, column: 13)
!294 = !DILocation(line: 221, column: 13, scope: !286)
!295 = !DILocation(line: 222, column: 21, scope: !286)
!296 = !DILocation(line: 222, column: 32, scope: !286)
!297 = !DILocation(line: 223, column: 21, scope: !286)
!298 = !DILocation(line: 223, column: 30, scope: !286)
!299 = !DILocation(line: 223, column: 37, scope: !286)
!300 = !DILocation(line: 224, column: 32, scope: !286)
!301 = !DILocation(line: 224, column: 21, scope: !286)
!302 = !DILocation(line: 224, column: 30, scope: !286)
!303 = !DILocation(line: 225, column: 22, scope: !304)
!304 = distinct !DILexicalBlock(scope: !286, file: !69, line: 225, column: 17)
!305 = !DILocation(line: 225, column: 36, scope: !304)
!306 = !DILocation(line: 225, column: 17, scope: !304)
!307 = !DILocation(line: 225, column: 81, scope: !304)
!308 = !DILocation(line: 225, column: 17, scope: !286)
!309 = !DILocation(line: 227, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !304, file: !69, line: 226, column: 13)
!311 = !DILocation(line: 229, column: 24, scope: !312)
!312 = distinct !DILexicalBlock(scope: !286, file: !69, line: 229, column: 17)
!313 = !DILocation(line: 229, column: 17, scope: !312)
!314 = !DILocation(line: 229, column: 54, scope: !312)
!315 = !DILocation(line: 229, column: 17, scope: !286)
!316 = !DILocation(line: 231, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !312, file: !69, line: 230, column: 13)
!318 = !DILocation(line: 233, column: 35, scope: !286)
!319 = !DILocation(line: 233, column: 28, scope: !286)
!320 = !DILocation(line: 233, column: 26, scope: !286)
!321 = !DILocation(line: 234, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !286, file: !69, line: 234, column: 17)
!323 = !DILocation(line: 234, column: 30, scope: !322)
!324 = !DILocation(line: 234, column: 17, scope: !286)
!325 = !DILocation(line: 236, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !69, line: 235, column: 13)
!327 = !DILocation(line: 239, column: 31, scope: !286)
!328 = !DILocation(line: 239, column: 45, scope: !286)
!329 = !DILocation(line: 239, column: 26, scope: !286)
!330 = !DILocation(line: 239, column: 24, scope: !286)
!331 = !DILocation(line: 240, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !286, file: !69, line: 240, column: 17)
!333 = !DILocation(line: 240, column: 28, scope: !332)
!334 = !DILocation(line: 240, column: 44, scope: !332)
!335 = !DILocation(line: 240, column: 47, scope: !332)
!336 = !DILocation(line: 240, column: 58, scope: !332)
!337 = !DILocation(line: 240, column: 17, scope: !286)
!338 = !DILocation(line: 242, column: 17, scope: !339)
!339 = distinct !DILexicalBlock(scope: !332, file: !69, line: 241, column: 13)
!340 = !DILocation(line: 245, column: 25, scope: !286)
!341 = !DILocation(line: 245, column: 13, scope: !286)
!342 = !DILocation(line: 245, column: 37, scope: !286)
!343 = !DILocation(line: 247, column: 25, scope: !286)
!344 = !DILocation(line: 247, column: 20, scope: !286)
!345 = !DILocation(line: 247, column: 18, scope: !286)
!346 = !DILocation(line: 248, column: 9, scope: !286)
!347 = !DILocation(line: 250, column: 13, scope: !348)
!348 = distinct !DILexicalBlock(scope: !274, file: !69, line: 250, column: 13)
!349 = !DILocation(line: 250, column: 26, scope: !348)
!350 = !DILocation(line: 250, column: 13, scope: !274)
!351 = !DILocation(line: 252, column: 26, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !69, line: 251, column: 9)
!353 = !DILocation(line: 252, column: 13, scope: !352)
!354 = !DILocation(line: 253, column: 9, scope: !352)
!355 = !DILocation(line: 254, column: 13, scope: !356)
!356 = distinct !DILexicalBlock(scope: !274, file: !69, line: 254, column: 13)
!357 = !DILocation(line: 254, column: 26, scope: !356)
!358 = !DILocation(line: 254, column: 13, scope: !274)
!359 = !DILocation(line: 256, column: 26, scope: !360)
!360 = distinct !DILexicalBlock(scope: !356, file: !69, line: 255, column: 9)
!361 = !DILocation(line: 256, column: 13, scope: !360)
!362 = !DILocation(line: 257, column: 9, scope: !360)
!363 = !DILocation(line: 265, column: 20, scope: !269)
!364 = !DILocation(line: 266, column: 18, scope: !269)
!365 = !DILocation(line: 266, column: 5, scope: !269)
!366 = !DILocation(line: 267, column: 1, scope: !269)
!367 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !69, file: !69, line: 161, type: !199, scopeLine: 162, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!368 = !DILocalVariable(name: "data", arg: 1, scope: !367, file: !69, line: 161, type: !70)
!369 = !DILocation(line: 161, column: 30, scope: !367)
!370 = !DILocation(line: 163, column: 8, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !69, line: 163, column: 8)
!372 = !DILocation(line: 163, column: 8, scope: !367)
!373 = !DILocation(line: 166, column: 9, scope: !374)
!374 = distinct !DILexicalBlock(scope: !371, file: !69, line: 164, column: 5)
!375 = !DILocation(line: 167, column: 5, scope: !374)
!376 = !DILocalVariable(name: "i", scope: !377, file: !69, line: 171, type: !70)
!377 = distinct !DILexicalBlock(scope: !378, file: !69, line: 170, column: 9)
!378 = distinct !DILexicalBlock(scope: !371, file: !69, line: 169, column: 5)
!379 = !DILocation(line: 171, column: 17, scope: !377)
!380 = !DILocalVariable(name: "buffer", scope: !377, file: !69, line: 172, type: !211)
!381 = !DILocation(line: 172, column: 17, scope: !377)
!382 = !DILocation(line: 174, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !377, file: !69, line: 174, column: 17)
!384 = !DILocation(line: 174, column: 22, scope: !383)
!385 = !DILocation(line: 174, column: 27, scope: !383)
!386 = !DILocation(line: 174, column: 30, scope: !383)
!387 = !DILocation(line: 174, column: 35, scope: !383)
!388 = !DILocation(line: 174, column: 17, scope: !377)
!389 = !DILocation(line: 176, column: 24, scope: !390)
!390 = distinct !DILexicalBlock(scope: !383, file: !69, line: 175, column: 13)
!391 = !DILocation(line: 176, column: 17, scope: !390)
!392 = !DILocation(line: 176, column: 30, scope: !390)
!393 = !DILocation(line: 178, column: 23, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !69, line: 178, column: 17)
!395 = !DILocation(line: 178, column: 21, scope: !394)
!396 = !DILocation(line: 178, column: 28, scope: !397)
!397 = distinct !DILexicalBlock(scope: !394, file: !69, line: 178, column: 17)
!398 = !DILocation(line: 178, column: 30, scope: !397)
!399 = !DILocation(line: 178, column: 17, scope: !394)
!400 = !DILocation(line: 180, column: 41, scope: !401)
!401 = distinct !DILexicalBlock(scope: !397, file: !69, line: 179, column: 17)
!402 = !DILocation(line: 180, column: 34, scope: !401)
!403 = !DILocation(line: 180, column: 21, scope: !401)
!404 = !DILocation(line: 181, column: 17, scope: !401)
!405 = !DILocation(line: 178, column: 37, scope: !397)
!406 = !DILocation(line: 178, column: 17, scope: !397)
!407 = distinct !{!407, !399, !408, !239}
!408 = !DILocation(line: 181, column: 17, scope: !394)
!409 = !DILocation(line: 182, column: 13, scope: !390)
!410 = !DILocation(line: 185, column: 17, scope: !411)
!411 = distinct !DILexicalBlock(scope: !383, file: !69, line: 184, column: 13)
!412 = !DILocation(line: 189, column: 1, scope: !367)
!413 = distinct !DISubprogram(name: "goodB2G2", scope: !69, file: !69, line: 295, type: !82, scopeLine: 296, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!414 = !DILocalVariable(name: "data", scope: !413, file: !69, line: 297, type: !70)
!415 = !DILocation(line: 297, column: 9, scope: !413)
!416 = !DILocation(line: 299, column: 10, scope: !413)
!417 = !DILocalVariable(name: "recvResult", scope: !418, file: !69, line: 305, type: !70)
!418 = distinct !DILexicalBlock(scope: !413, file: !69, line: 300, column: 5)
!419 = !DILocation(line: 305, column: 13, scope: !418)
!420 = !DILocalVariable(name: "service", scope: !418, file: !69, line: 306, type: !92)
!421 = !DILocation(line: 306, column: 28, scope: !418)
!422 = !DILocalVariable(name: "listenSocket", scope: !418, file: !69, line: 307, type: !70)
!423 = !DILocation(line: 307, column: 16, scope: !418)
!424 = !DILocalVariable(name: "acceptSocket", scope: !418, file: !69, line: 308, type: !70)
!425 = !DILocation(line: 308, column: 16, scope: !418)
!426 = !DILocalVariable(name: "inputBuffer", scope: !418, file: !69, line: 309, type: !62)
!427 = !DILocation(line: 309, column: 14, scope: !418)
!428 = !DILocation(line: 310, column: 9, scope: !418)
!429 = !DILocation(line: 320, column: 28, scope: !430)
!430 = distinct !DILexicalBlock(scope: !418, file: !69, line: 311, column: 9)
!431 = !DILocation(line: 320, column: 26, scope: !430)
!432 = !DILocation(line: 321, column: 17, scope: !433)
!433 = distinct !DILexicalBlock(scope: !430, file: !69, line: 321, column: 17)
!434 = !DILocation(line: 321, column: 30, scope: !433)
!435 = !DILocation(line: 321, column: 17, scope: !430)
!436 = !DILocation(line: 323, column: 17, scope: !437)
!437 = distinct !DILexicalBlock(scope: !433, file: !69, line: 322, column: 13)
!438 = !DILocation(line: 325, column: 13, scope: !430)
!439 = !DILocation(line: 326, column: 21, scope: !430)
!440 = !DILocation(line: 326, column: 32, scope: !430)
!441 = !DILocation(line: 327, column: 21, scope: !430)
!442 = !DILocation(line: 327, column: 30, scope: !430)
!443 = !DILocation(line: 327, column: 37, scope: !430)
!444 = !DILocation(line: 328, column: 32, scope: !430)
!445 = !DILocation(line: 328, column: 21, scope: !430)
!446 = !DILocation(line: 328, column: 30, scope: !430)
!447 = !DILocation(line: 329, column: 22, scope: !448)
!448 = distinct !DILexicalBlock(scope: !430, file: !69, line: 329, column: 17)
!449 = !DILocation(line: 329, column: 36, scope: !448)
!450 = !DILocation(line: 329, column: 17, scope: !448)
!451 = !DILocation(line: 329, column: 81, scope: !448)
!452 = !DILocation(line: 329, column: 17, scope: !430)
!453 = !DILocation(line: 331, column: 17, scope: !454)
!454 = distinct !DILexicalBlock(scope: !448, file: !69, line: 330, column: 13)
!455 = !DILocation(line: 333, column: 24, scope: !456)
!456 = distinct !DILexicalBlock(scope: !430, file: !69, line: 333, column: 17)
!457 = !DILocation(line: 333, column: 17, scope: !456)
!458 = !DILocation(line: 333, column: 54, scope: !456)
!459 = !DILocation(line: 333, column: 17, scope: !430)
!460 = !DILocation(line: 335, column: 17, scope: !461)
!461 = distinct !DILexicalBlock(scope: !456, file: !69, line: 334, column: 13)
!462 = !DILocation(line: 337, column: 35, scope: !430)
!463 = !DILocation(line: 337, column: 28, scope: !430)
!464 = !DILocation(line: 337, column: 26, scope: !430)
!465 = !DILocation(line: 338, column: 17, scope: !466)
!466 = distinct !DILexicalBlock(scope: !430, file: !69, line: 338, column: 17)
!467 = !DILocation(line: 338, column: 30, scope: !466)
!468 = !DILocation(line: 338, column: 17, scope: !430)
!469 = !DILocation(line: 340, column: 17, scope: !470)
!470 = distinct !DILexicalBlock(scope: !466, file: !69, line: 339, column: 13)
!471 = !DILocation(line: 343, column: 31, scope: !430)
!472 = !DILocation(line: 343, column: 45, scope: !430)
!473 = !DILocation(line: 343, column: 26, scope: !430)
!474 = !DILocation(line: 343, column: 24, scope: !430)
!475 = !DILocation(line: 344, column: 17, scope: !476)
!476 = distinct !DILexicalBlock(scope: !430, file: !69, line: 344, column: 17)
!477 = !DILocation(line: 344, column: 28, scope: !476)
!478 = !DILocation(line: 344, column: 44, scope: !476)
!479 = !DILocation(line: 344, column: 47, scope: !476)
!480 = !DILocation(line: 344, column: 58, scope: !476)
!481 = !DILocation(line: 344, column: 17, scope: !430)
!482 = !DILocation(line: 346, column: 17, scope: !483)
!483 = distinct !DILexicalBlock(scope: !476, file: !69, line: 345, column: 13)
!484 = !DILocation(line: 349, column: 25, scope: !430)
!485 = !DILocation(line: 349, column: 13, scope: !430)
!486 = !DILocation(line: 349, column: 37, scope: !430)
!487 = !DILocation(line: 351, column: 25, scope: !430)
!488 = !DILocation(line: 351, column: 20, scope: !430)
!489 = !DILocation(line: 351, column: 18, scope: !430)
!490 = !DILocation(line: 352, column: 9, scope: !430)
!491 = !DILocation(line: 354, column: 13, scope: !492)
!492 = distinct !DILexicalBlock(scope: !418, file: !69, line: 354, column: 13)
!493 = !DILocation(line: 354, column: 26, scope: !492)
!494 = !DILocation(line: 354, column: 13, scope: !418)
!495 = !DILocation(line: 356, column: 26, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !69, line: 355, column: 9)
!497 = !DILocation(line: 356, column: 13, scope: !496)
!498 = !DILocation(line: 357, column: 9, scope: !496)
!499 = !DILocation(line: 358, column: 13, scope: !500)
!500 = distinct !DILexicalBlock(scope: !418, file: !69, line: 358, column: 13)
!501 = !DILocation(line: 358, column: 26, scope: !500)
!502 = !DILocation(line: 358, column: 13, scope: !418)
!503 = !DILocation(line: 360, column: 26, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !69, line: 359, column: 9)
!505 = !DILocation(line: 360, column: 13, scope: !504)
!506 = !DILocation(line: 361, column: 9, scope: !504)
!507 = !DILocation(line: 369, column: 20, scope: !413)
!508 = !DILocation(line: 370, column: 18, scope: !413)
!509 = !DILocation(line: 370, column: 5, scope: !413)
!510 = !DILocation(line: 371, column: 1, scope: !413)
!511 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !69, file: !69, line: 270, type: !199, scopeLine: 271, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!512 = !DILocalVariable(name: "data", arg: 1, scope: !511, file: !69, line: 270, type: !70)
!513 = !DILocation(line: 270, column: 30, scope: !511)
!514 = !DILocation(line: 272, column: 8, scope: !515)
!515 = distinct !DILexicalBlock(scope: !511, file: !69, line: 272, column: 8)
!516 = !DILocation(line: 272, column: 8, scope: !511)
!517 = !DILocalVariable(name: "i", scope: !518, file: !69, line: 275, type: !70)
!518 = distinct !DILexicalBlock(scope: !519, file: !69, line: 274, column: 9)
!519 = distinct !DILexicalBlock(scope: !515, file: !69, line: 273, column: 5)
!520 = !DILocation(line: 275, column: 17, scope: !518)
!521 = !DILocalVariable(name: "buffer", scope: !518, file: !69, line: 276, type: !211)
!522 = !DILocation(line: 276, column: 17, scope: !518)
!523 = !DILocation(line: 278, column: 17, scope: !524)
!524 = distinct !DILexicalBlock(scope: !518, file: !69, line: 278, column: 17)
!525 = !DILocation(line: 278, column: 22, scope: !524)
!526 = !DILocation(line: 278, column: 27, scope: !524)
!527 = !DILocation(line: 278, column: 30, scope: !524)
!528 = !DILocation(line: 278, column: 35, scope: !524)
!529 = !DILocation(line: 278, column: 17, scope: !518)
!530 = !DILocation(line: 280, column: 24, scope: !531)
!531 = distinct !DILexicalBlock(scope: !524, file: !69, line: 279, column: 13)
!532 = !DILocation(line: 280, column: 17, scope: !531)
!533 = !DILocation(line: 280, column: 30, scope: !531)
!534 = !DILocation(line: 282, column: 23, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !69, line: 282, column: 17)
!536 = !DILocation(line: 282, column: 21, scope: !535)
!537 = !DILocation(line: 282, column: 28, scope: !538)
!538 = distinct !DILexicalBlock(scope: !535, file: !69, line: 282, column: 17)
!539 = !DILocation(line: 282, column: 30, scope: !538)
!540 = !DILocation(line: 282, column: 17, scope: !535)
!541 = !DILocation(line: 284, column: 41, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !69, line: 283, column: 17)
!543 = !DILocation(line: 284, column: 34, scope: !542)
!544 = !DILocation(line: 284, column: 21, scope: !542)
!545 = !DILocation(line: 285, column: 17, scope: !542)
!546 = !DILocation(line: 282, column: 37, scope: !538)
!547 = !DILocation(line: 282, column: 17, scope: !538)
!548 = distinct !{!548, !540, !549, !239}
!549 = !DILocation(line: 285, column: 17, scope: !535)
!550 = !DILocation(line: 286, column: 13, scope: !531)
!551 = !DILocation(line: 289, column: 17, scope: !552)
!552 = distinct !DILexicalBlock(scope: !524, file: !69, line: 288, column: 13)
!553 = !DILocation(line: 292, column: 5, scope: !519)
!554 = !DILocation(line: 293, column: 1, scope: !511)
!555 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 400, type: !82, scopeLine: 401, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!556 = !DILocalVariable(name: "data", scope: !555, file: !69, line: 402, type: !70)
!557 = !DILocation(line: 402, column: 9, scope: !555)
!558 = !DILocation(line: 404, column: 10, scope: !555)
!559 = !DILocation(line: 407, column: 10, scope: !555)
!560 = !DILocation(line: 408, column: 19, scope: !555)
!561 = !DILocation(line: 409, column: 17, scope: !555)
!562 = !DILocation(line: 409, column: 5, scope: !555)
!563 = !DILocation(line: 410, column: 1, scope: !555)
!564 = distinct !DISubprogram(name: "goodG2BSink", scope: !69, file: !69, line: 374, type: !199, scopeLine: 375, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !84)
!565 = !DILocalVariable(name: "data", arg: 1, scope: !564, file: !69, line: 374, type: !70)
!566 = !DILocation(line: 374, column: 29, scope: !564)
!567 = !DILocation(line: 376, column: 8, scope: !568)
!568 = distinct !DILexicalBlock(scope: !564, file: !69, line: 376, column: 8)
!569 = !DILocation(line: 376, column: 8, scope: !564)
!570 = !DILocalVariable(name: "i", scope: !571, file: !69, line: 379, type: !70)
!571 = distinct !DILexicalBlock(scope: !572, file: !69, line: 378, column: 9)
!572 = distinct !DILexicalBlock(scope: !568, file: !69, line: 377, column: 5)
!573 = !DILocation(line: 379, column: 17, scope: !571)
!574 = !DILocalVariable(name: "buffer", scope: !571, file: !69, line: 380, type: !211)
!575 = !DILocation(line: 380, column: 17, scope: !571)
!576 = !DILocation(line: 383, column: 17, scope: !577)
!577 = distinct !DILexicalBlock(scope: !571, file: !69, line: 383, column: 17)
!578 = !DILocation(line: 383, column: 22, scope: !577)
!579 = !DILocation(line: 383, column: 17, scope: !571)
!580 = !DILocation(line: 385, column: 24, scope: !581)
!581 = distinct !DILexicalBlock(scope: !577, file: !69, line: 384, column: 13)
!582 = !DILocation(line: 385, column: 17, scope: !581)
!583 = !DILocation(line: 385, column: 30, scope: !581)
!584 = !DILocation(line: 387, column: 23, scope: !585)
!585 = distinct !DILexicalBlock(scope: !581, file: !69, line: 387, column: 17)
!586 = !DILocation(line: 387, column: 21, scope: !585)
!587 = !DILocation(line: 387, column: 28, scope: !588)
!588 = distinct !DILexicalBlock(scope: !585, file: !69, line: 387, column: 17)
!589 = !DILocation(line: 387, column: 30, scope: !588)
!590 = !DILocation(line: 387, column: 17, scope: !585)
!591 = !DILocation(line: 389, column: 41, scope: !592)
!592 = distinct !DILexicalBlock(scope: !588, file: !69, line: 388, column: 17)
!593 = !DILocation(line: 389, column: 34, scope: !592)
!594 = !DILocation(line: 389, column: 21, scope: !592)
!595 = !DILocation(line: 390, column: 17, scope: !592)
!596 = !DILocation(line: 387, column: 37, scope: !588)
!597 = !DILocation(line: 387, column: 17, scope: !588)
!598 = distinct !{!598, !590, !599, !239}
!599 = !DILocation(line: 390, column: 17, scope: !585)
!600 = !DILocation(line: 391, column: 13, scope: !581)
!601 = !DILocation(line: 394, column: 17, scope: !602)
!602 = distinct !DILexicalBlock(scope: !577, file: !69, line: 393, column: 13)
!603 = !DILocation(line: 397, column: 5, scope: !572)
!604 = !DILocation(line: 398, column: 1, scope: !564)
