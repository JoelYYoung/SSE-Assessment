; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  br label %while.body, !dbg !79

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !80, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !84, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %listenSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %acceptSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %do.body, !dbg !108

do.body:                                          ; preds = %while.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !109
  store i32 %call, i32* %listenSocket, align 4, !dbg !111
  %0 = load i32, i32* %listenSocket, align 4, !dbg !112
  %cmp = icmp eq i32 %0, -1, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !116

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !118
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !119
  store i16 2, i16* %sin_family, align 4, !dbg !120
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !121
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !122
  store i32 0, i32* %s_addr, align 4, !dbg !123
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !124
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !125
  store i16 %call1, i16* %sin_port, align 2, !dbg !126
  %2 = load i32, i32* %listenSocket, align 4, !dbg !127
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !129
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !130
  %cmp3 = icmp eq i32 %call2, -1, !dbg !131
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !132

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !133

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !135
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !137
  %cmp7 = icmp eq i32 %call6, -1, !dbg !138
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !139

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !140

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !142
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !143
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !144
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !145
  %cmp11 = icmp eq i32 %6, -1, !dbg !147
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !148

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !149

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !151
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !152
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !153
  %conv = trunc i64 %call14 to i32, !dbg !153
  store i32 %conv, i32* %recvResult, align 4, !dbg !154
  %8 = load i32, i32* %recvResult, align 4, !dbg !155
  %cmp15 = icmp eq i32 %8, -1, !dbg !157
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !158

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !159
  %cmp17 = icmp eq i32 %9, 0, !dbg !160
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !161

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !162

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !164
  %idxprom = sext i32 %10 to i64, !dbg !165
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !167
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !168
  store i32 %call22, i32* %data, align 4, !dbg !169
  br label %do.end, !dbg !170

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !171
  %cmp23 = icmp ne i32 %11, -1, !dbg !173
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !174

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !175
  %call26 = call i32 @close(i32 %12), !dbg !177
  br label %if.end27, !dbg !178

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !179
  %cmp28 = icmp ne i32 %13, -1, !dbg !181
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !182

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !183
  %call31 = call i32 @close(i32 %14), !dbg !185
  br label %if.end32, !dbg !186

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %while.end, !dbg !187

while.end:                                        ; preds = %if.end32
  br label %while.body33, !dbg !188

while.body33:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !189, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !193, metadata !DIExpression()), !dbg !197
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !197
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !197
  %16 = load i32, i32* %data, align 4, !dbg !198
  %cmp34 = icmp sge i32 %16, 0, !dbg !200
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !201

if.then36:                                        ; preds = %while.body33
  %17 = load i32, i32* %data, align 4, !dbg !202
  %idxprom37 = sext i32 %17 to i64, !dbg !204
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !204
  store i32 1, i32* %arrayidx38, align 4, !dbg !205
  store i32 0, i32* %i, align 4, !dbg !206
  br label %for.cond, !dbg !208

for.cond:                                         ; preds = %for.inc, %if.then36
  %18 = load i32, i32* %i, align 4, !dbg !209
  %cmp39 = icmp slt i32 %18, 10, !dbg !211
  br i1 %cmp39, label %for.body, label %for.end, !dbg !212

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !213
  %idxprom41 = sext i32 %19 to i64, !dbg !215
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !215
  %20 = load i32, i32* %arrayidx42, align 4, !dbg !215
  call void @printIntLine(i32 %20), !dbg !216
  br label %for.inc, !dbg !217

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !218
  %inc = add nsw i32 %21, 1, !dbg !218
  store i32 %inc, i32* %i, align 4, !dbg !218
  br label %for.cond, !dbg !219, !llvm.loop !220

for.end:                                          ; preds = %for.cond
  br label %if.end43, !dbg !223

if.else:                                          ; preds = %while.body33
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !224
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end
  br label %while.end44, !dbg !226

while.end44:                                      ; preds = %if.end43
  ret void, !dbg !227
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

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_good() #0 !dbg !228 {
entry:
  call void @goodB2G(), !dbg !229
  call void @goodG2B(), !dbg !230
  ret void, !dbg !231
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !232 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !237, metadata !DIExpression()), !dbg !238
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !239, metadata !DIExpression()), !dbg !240
  %call = call i64 @time(i64* null) #7, !dbg !241
  %conv = trunc i64 %call to i32, !dbg !242
  call void @srand(i32 %conv) #7, !dbg !243
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !244
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_good(), !dbg !245
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !246
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !247
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_bad(), !dbg !248
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !249
  ret i32 0, !dbg !250
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !251 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 -1, i32* %data, align 4, !dbg !254
  br label %while.body, !dbg !255

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !256, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %listenSocket, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !264, metadata !DIExpression()), !dbg !265
  store i32 -1, i32* %acceptSocket, align 4, !dbg !265
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !266, metadata !DIExpression()), !dbg !267
  br label %do.body, !dbg !268

do.body:                                          ; preds = %while.body
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !269
  store i32 %call, i32* %listenSocket, align 4, !dbg !271
  %0 = load i32, i32* %listenSocket, align 4, !dbg !272
  %cmp = icmp eq i32 %0, -1, !dbg !274
  br i1 %cmp, label %if.then, label %if.end, !dbg !275

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !276

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !278
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !278
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !279
  store i16 2, i16* %sin_family, align 4, !dbg !280
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !281
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !282
  store i32 0, i32* %s_addr, align 4, !dbg !283
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !284
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !285
  store i16 %call1, i16* %sin_port, align 2, !dbg !286
  %2 = load i32, i32* %listenSocket, align 4, !dbg !287
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !289
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !290
  %cmp3 = icmp eq i32 %call2, -1, !dbg !291
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !292

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !293

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !295
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !297
  %cmp7 = icmp eq i32 %call6, -1, !dbg !298
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !299

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !300

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !302
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !303
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !304
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !305
  %cmp11 = icmp eq i32 %6, -1, !dbg !307
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !308

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !309

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !311
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !312
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !313
  %conv = trunc i64 %call14 to i32, !dbg !313
  store i32 %conv, i32* %recvResult, align 4, !dbg !314
  %8 = load i32, i32* %recvResult, align 4, !dbg !315
  %cmp15 = icmp eq i32 %8, -1, !dbg !317
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !318

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !319
  %cmp17 = icmp eq i32 %9, 0, !dbg !320
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !321

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !322

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !324
  %idxprom = sext i32 %10 to i64, !dbg !325
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !325
  store i8 0, i8* %arrayidx, align 1, !dbg !326
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !327
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !328
  store i32 %call22, i32* %data, align 4, !dbg !329
  br label %do.end, !dbg !330

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !331
  %cmp23 = icmp ne i32 %11, -1, !dbg !333
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !334

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !335
  %call26 = call i32 @close(i32 %12), !dbg !337
  br label %if.end27, !dbg !338

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !339
  %cmp28 = icmp ne i32 %13, -1, !dbg !341
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !342

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !343
  %call31 = call i32 @close(i32 %14), !dbg !345
  br label %if.end32, !dbg !346

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %while.end, !dbg !347

while.end:                                        ; preds = %if.end32
  br label %while.body33, !dbg !348

while.body33:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !349, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !353, metadata !DIExpression()), !dbg !354
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !354
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !354
  %16 = load i32, i32* %data, align 4, !dbg !355
  %cmp34 = icmp sge i32 %16, 0, !dbg !357
  br i1 %cmp34, label %land.lhs.true, label %if.else, !dbg !358

land.lhs.true:                                    ; preds = %while.body33
  %17 = load i32, i32* %data, align 4, !dbg !359
  %cmp36 = icmp slt i32 %17, 10, !dbg !360
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !361

if.then38:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !362
  %idxprom39 = sext i32 %18 to i64, !dbg !364
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !364
  store i32 1, i32* %arrayidx40, align 4, !dbg !365
  store i32 0, i32* %i, align 4, !dbg !366
  br label %for.cond, !dbg !368

for.cond:                                         ; preds = %for.inc, %if.then38
  %19 = load i32, i32* %i, align 4, !dbg !369
  %cmp41 = icmp slt i32 %19, 10, !dbg !371
  br i1 %cmp41, label %for.body, label %for.end, !dbg !372

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !373
  %idxprom43 = sext i32 %20 to i64, !dbg !375
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !375
  %21 = load i32, i32* %arrayidx44, align 4, !dbg !375
  call void @printIntLine(i32 %21), !dbg !376
  br label %for.inc, !dbg !377

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !378
  %inc = add nsw i32 %22, 1, !dbg !378
  store i32 %inc, i32* %i, align 4, !dbg !378
  br label %for.cond, !dbg !379, !llvm.loop !380

for.end:                                          ; preds = %for.cond
  br label %if.end45, !dbg !382

if.else:                                          ; preds = %land.lhs.true, %while.body33
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !383
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end
  br label %while.end46, !dbg !385

while.end46:                                      ; preds = %if.end45
  ret void, !dbg !386
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !387 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !388, metadata !DIExpression()), !dbg !389
  store i32 -1, i32* %data, align 4, !dbg !390
  br label %while.body, !dbg !391

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !392
  br label %while.end, !dbg !394

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !395

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !396, metadata !DIExpression()), !dbg !399
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !400, metadata !DIExpression()), !dbg !401
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !401
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !401
  %1 = load i32, i32* %data, align 4, !dbg !402
  %cmp = icmp sge i32 %1, 0, !dbg !404
  br i1 %cmp, label %if.then, label %if.else, !dbg !405

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !406
  %idxprom = sext i32 %2 to i64, !dbg !408
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !408
  store i32 1, i32* %arrayidx, align 4, !dbg !409
  store i32 0, i32* %i, align 4, !dbg !410
  br label %for.cond, !dbg !412

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !413
  %cmp2 = icmp slt i32 %3, 10, !dbg !415
  br i1 %cmp2, label %for.body, label %for.end, !dbg !416

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !417
  %idxprom3 = sext i32 %4 to i64, !dbg !419
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !419
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !419
  call void @printIntLine(i32 %5), !dbg !420
  br label %for.inc, !dbg !421

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !422
  %inc = add nsw i32 %6, 1, !dbg !422
  store i32 %inc, i32* %i, align 4, !dbg !422
  br label %for.cond, !dbg !423, !llvm.loop !424

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !426

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !427
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end5, !dbg !429

while.end5:                                       ; preds = %if.end
  ret void, !dbg !430
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocation(line: 49, column: 5, scope: !70)
!80 = !DILocalVariable(name: "recvResult", scope: !81, file: !71, line: 56, type: !76)
!81 = distinct !DILexicalBlock(scope: !82, file: !71, line: 51, column: 9)
!82 = distinct !DILexicalBlock(scope: !70, file: !71, line: 50, column: 5)
!83 = !DILocation(line: 56, column: 17, scope: !81)
!84 = !DILocalVariable(name: "service", scope: !81, file: !71, line: 57, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !86)
!86 = !{!87, !88, !92, !96}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !85, file: !17, line: 240, baseType: !56, size: 16)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !85, file: !17, line: 241, baseType: !89, size: 16, offset: 16)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !85, file: !17, line: 242, baseType: !93, size: 32, offset: 32)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !94)
!94 = !{!95}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !93, file: !17, line: 33, baseType: !46, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !85, file: !17, line: 245, baseType: !97, size: 64, offset: 64)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 64, elements: !99)
!98 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!99 = !{!100}
!100 = !DISubrange(count: 8)
!101 = !DILocation(line: 57, column: 32, scope: !81)
!102 = !DILocalVariable(name: "listenSocket", scope: !81, file: !71, line: 58, type: !76)
!103 = !DILocation(line: 58, column: 20, scope: !81)
!104 = !DILocalVariable(name: "acceptSocket", scope: !81, file: !71, line: 59, type: !76)
!105 = !DILocation(line: 59, column: 20, scope: !81)
!106 = !DILocalVariable(name: "inputBuffer", scope: !81, file: !71, line: 60, type: !60)
!107 = !DILocation(line: 60, column: 18, scope: !81)
!108 = !DILocation(line: 61, column: 13, scope: !81)
!109 = !DILocation(line: 71, column: 32, scope: !110)
!110 = distinct !DILexicalBlock(scope: !81, file: !71, line: 62, column: 13)
!111 = !DILocation(line: 71, column: 30, scope: !110)
!112 = !DILocation(line: 72, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !71, line: 72, column: 21)
!114 = !DILocation(line: 72, column: 34, scope: !113)
!115 = !DILocation(line: 72, column: 21, scope: !110)
!116 = !DILocation(line: 74, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !71, line: 73, column: 17)
!118 = !DILocation(line: 76, column: 17, scope: !110)
!119 = !DILocation(line: 77, column: 25, scope: !110)
!120 = !DILocation(line: 77, column: 36, scope: !110)
!121 = !DILocation(line: 78, column: 25, scope: !110)
!122 = !DILocation(line: 78, column: 34, scope: !110)
!123 = !DILocation(line: 78, column: 41, scope: !110)
!124 = !DILocation(line: 79, column: 36, scope: !110)
!125 = !DILocation(line: 79, column: 25, scope: !110)
!126 = !DILocation(line: 79, column: 34, scope: !110)
!127 = !DILocation(line: 80, column: 26, scope: !128)
!128 = distinct !DILexicalBlock(scope: !110, file: !71, line: 80, column: 21)
!129 = !DILocation(line: 80, column: 40, scope: !128)
!130 = !DILocation(line: 80, column: 21, scope: !128)
!131 = !DILocation(line: 80, column: 85, scope: !128)
!132 = !DILocation(line: 80, column: 21, scope: !110)
!133 = !DILocation(line: 82, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !71, line: 81, column: 17)
!135 = !DILocation(line: 84, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !110, file: !71, line: 84, column: 21)
!137 = !DILocation(line: 84, column: 21, scope: !136)
!138 = !DILocation(line: 84, column: 58, scope: !136)
!139 = !DILocation(line: 84, column: 21, scope: !110)
!140 = !DILocation(line: 86, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !71, line: 85, column: 17)
!142 = !DILocation(line: 88, column: 39, scope: !110)
!143 = !DILocation(line: 88, column: 32, scope: !110)
!144 = !DILocation(line: 88, column: 30, scope: !110)
!145 = !DILocation(line: 89, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !110, file: !71, line: 89, column: 21)
!147 = !DILocation(line: 89, column: 34, scope: !146)
!148 = !DILocation(line: 89, column: 21, scope: !110)
!149 = !DILocation(line: 91, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !71, line: 90, column: 17)
!151 = !DILocation(line: 94, column: 35, scope: !110)
!152 = !DILocation(line: 94, column: 49, scope: !110)
!153 = !DILocation(line: 94, column: 30, scope: !110)
!154 = !DILocation(line: 94, column: 28, scope: !110)
!155 = !DILocation(line: 95, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !110, file: !71, line: 95, column: 21)
!157 = !DILocation(line: 95, column: 32, scope: !156)
!158 = !DILocation(line: 95, column: 48, scope: !156)
!159 = !DILocation(line: 95, column: 51, scope: !156)
!160 = !DILocation(line: 95, column: 62, scope: !156)
!161 = !DILocation(line: 95, column: 21, scope: !110)
!162 = !DILocation(line: 97, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !71, line: 96, column: 17)
!164 = !DILocation(line: 100, column: 29, scope: !110)
!165 = !DILocation(line: 100, column: 17, scope: !110)
!166 = !DILocation(line: 100, column: 41, scope: !110)
!167 = !DILocation(line: 102, column: 29, scope: !110)
!168 = !DILocation(line: 102, column: 24, scope: !110)
!169 = !DILocation(line: 102, column: 22, scope: !110)
!170 = !DILocation(line: 103, column: 13, scope: !110)
!171 = !DILocation(line: 105, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !81, file: !71, line: 105, column: 17)
!173 = !DILocation(line: 105, column: 30, scope: !172)
!174 = !DILocation(line: 105, column: 17, scope: !81)
!175 = !DILocation(line: 107, column: 30, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !71, line: 106, column: 13)
!177 = !DILocation(line: 107, column: 17, scope: !176)
!178 = !DILocation(line: 108, column: 13, scope: !176)
!179 = !DILocation(line: 109, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !81, file: !71, line: 109, column: 17)
!181 = !DILocation(line: 109, column: 30, scope: !180)
!182 = !DILocation(line: 109, column: 17, scope: !81)
!183 = !DILocation(line: 111, column: 30, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !71, line: 110, column: 13)
!185 = !DILocation(line: 111, column: 17, scope: !184)
!186 = !DILocation(line: 112, column: 13, scope: !184)
!187 = !DILocation(line: 120, column: 9, scope: !82)
!188 = !DILocation(line: 122, column: 5, scope: !70)
!189 = !DILocalVariable(name: "i", scope: !190, file: !71, line: 125, type: !76)
!190 = distinct !DILexicalBlock(scope: !191, file: !71, line: 124, column: 9)
!191 = distinct !DILexicalBlock(scope: !70, file: !71, line: 123, column: 5)
!192 = !DILocation(line: 125, column: 17, scope: !190)
!193 = !DILocalVariable(name: "buffer", scope: !190, file: !71, line: 126, type: !194)
!194 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !195)
!195 = !{!196}
!196 = !DISubrange(count: 10)
!197 = !DILocation(line: 126, column: 17, scope: !190)
!198 = !DILocation(line: 129, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !190, file: !71, line: 129, column: 17)
!200 = !DILocation(line: 129, column: 22, scope: !199)
!201 = !DILocation(line: 129, column: 17, scope: !190)
!202 = !DILocation(line: 131, column: 24, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !71, line: 130, column: 13)
!204 = !DILocation(line: 131, column: 17, scope: !203)
!205 = !DILocation(line: 131, column: 30, scope: !203)
!206 = !DILocation(line: 133, column: 23, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !71, line: 133, column: 17)
!208 = !DILocation(line: 133, column: 21, scope: !207)
!209 = !DILocation(line: 133, column: 28, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !71, line: 133, column: 17)
!211 = !DILocation(line: 133, column: 30, scope: !210)
!212 = !DILocation(line: 133, column: 17, scope: !207)
!213 = !DILocation(line: 135, column: 41, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !71, line: 134, column: 17)
!215 = !DILocation(line: 135, column: 34, scope: !214)
!216 = !DILocation(line: 135, column: 21, scope: !214)
!217 = !DILocation(line: 136, column: 17, scope: !214)
!218 = !DILocation(line: 133, column: 37, scope: !210)
!219 = !DILocation(line: 133, column: 17, scope: !210)
!220 = distinct !{!220, !212, !221, !222}
!221 = !DILocation(line: 136, column: 17, scope: !207)
!222 = !{!"llvm.loop.mustprogress"}
!223 = !DILocation(line: 137, column: 13, scope: !203)
!224 = !DILocation(line: 140, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !199, file: !71, line: 139, column: 13)
!226 = !DILocation(line: 143, column: 9, scope: !191)
!227 = !DILocation(line: 145, column: 1, scope: !70)
!228 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_good", scope: !71, file: !71, line: 292, type: !72, scopeLine: 293, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!229 = !DILocation(line: 294, column: 5, scope: !228)
!230 = !DILocation(line: 295, column: 5, scope: !228)
!231 = !DILocation(line: 296, column: 1, scope: !228)
!232 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 307, type: !233, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!233 = !DISubroutineType(types: !234)
!234 = !{!76, !76, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!237 = !DILocalVariable(name: "argc", arg: 1, scope: !232, file: !71, line: 307, type: !76)
!238 = !DILocation(line: 307, column: 14, scope: !232)
!239 = !DILocalVariable(name: "argv", arg: 2, scope: !232, file: !71, line: 307, type: !235)
!240 = !DILocation(line: 307, column: 27, scope: !232)
!241 = !DILocation(line: 310, column: 22, scope: !232)
!242 = !DILocation(line: 310, column: 12, scope: !232)
!243 = !DILocation(line: 310, column: 5, scope: !232)
!244 = !DILocation(line: 312, column: 5, scope: !232)
!245 = !DILocation(line: 313, column: 5, scope: !232)
!246 = !DILocation(line: 314, column: 5, scope: !232)
!247 = !DILocation(line: 317, column: 5, scope: !232)
!248 = !DILocation(line: 318, column: 5, scope: !232)
!249 = !DILocation(line: 319, column: 5, scope: !232)
!250 = !DILocation(line: 321, column: 5, scope: !232)
!251 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 152, type: !72, scopeLine: 153, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!252 = !DILocalVariable(name: "data", scope: !251, file: !71, line: 154, type: !76)
!253 = !DILocation(line: 154, column: 9, scope: !251)
!254 = !DILocation(line: 156, column: 10, scope: !251)
!255 = !DILocation(line: 157, column: 5, scope: !251)
!256 = !DILocalVariable(name: "recvResult", scope: !257, file: !71, line: 164, type: !76)
!257 = distinct !DILexicalBlock(scope: !258, file: !71, line: 159, column: 9)
!258 = distinct !DILexicalBlock(scope: !251, file: !71, line: 158, column: 5)
!259 = !DILocation(line: 164, column: 17, scope: !257)
!260 = !DILocalVariable(name: "service", scope: !257, file: !71, line: 165, type: !85)
!261 = !DILocation(line: 165, column: 32, scope: !257)
!262 = !DILocalVariable(name: "listenSocket", scope: !257, file: !71, line: 166, type: !76)
!263 = !DILocation(line: 166, column: 20, scope: !257)
!264 = !DILocalVariable(name: "acceptSocket", scope: !257, file: !71, line: 167, type: !76)
!265 = !DILocation(line: 167, column: 20, scope: !257)
!266 = !DILocalVariable(name: "inputBuffer", scope: !257, file: !71, line: 168, type: !60)
!267 = !DILocation(line: 168, column: 18, scope: !257)
!268 = !DILocation(line: 169, column: 13, scope: !257)
!269 = !DILocation(line: 179, column: 32, scope: !270)
!270 = distinct !DILexicalBlock(scope: !257, file: !71, line: 170, column: 13)
!271 = !DILocation(line: 179, column: 30, scope: !270)
!272 = !DILocation(line: 180, column: 21, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !71, line: 180, column: 21)
!274 = !DILocation(line: 180, column: 34, scope: !273)
!275 = !DILocation(line: 180, column: 21, scope: !270)
!276 = !DILocation(line: 182, column: 21, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !71, line: 181, column: 17)
!278 = !DILocation(line: 184, column: 17, scope: !270)
!279 = !DILocation(line: 185, column: 25, scope: !270)
!280 = !DILocation(line: 185, column: 36, scope: !270)
!281 = !DILocation(line: 186, column: 25, scope: !270)
!282 = !DILocation(line: 186, column: 34, scope: !270)
!283 = !DILocation(line: 186, column: 41, scope: !270)
!284 = !DILocation(line: 187, column: 36, scope: !270)
!285 = !DILocation(line: 187, column: 25, scope: !270)
!286 = !DILocation(line: 187, column: 34, scope: !270)
!287 = !DILocation(line: 188, column: 26, scope: !288)
!288 = distinct !DILexicalBlock(scope: !270, file: !71, line: 188, column: 21)
!289 = !DILocation(line: 188, column: 40, scope: !288)
!290 = !DILocation(line: 188, column: 21, scope: !288)
!291 = !DILocation(line: 188, column: 85, scope: !288)
!292 = !DILocation(line: 188, column: 21, scope: !270)
!293 = !DILocation(line: 190, column: 21, scope: !294)
!294 = distinct !DILexicalBlock(scope: !288, file: !71, line: 189, column: 17)
!295 = !DILocation(line: 192, column: 28, scope: !296)
!296 = distinct !DILexicalBlock(scope: !270, file: !71, line: 192, column: 21)
!297 = !DILocation(line: 192, column: 21, scope: !296)
!298 = !DILocation(line: 192, column: 58, scope: !296)
!299 = !DILocation(line: 192, column: 21, scope: !270)
!300 = !DILocation(line: 194, column: 21, scope: !301)
!301 = distinct !DILexicalBlock(scope: !296, file: !71, line: 193, column: 17)
!302 = !DILocation(line: 196, column: 39, scope: !270)
!303 = !DILocation(line: 196, column: 32, scope: !270)
!304 = !DILocation(line: 196, column: 30, scope: !270)
!305 = !DILocation(line: 197, column: 21, scope: !306)
!306 = distinct !DILexicalBlock(scope: !270, file: !71, line: 197, column: 21)
!307 = !DILocation(line: 197, column: 34, scope: !306)
!308 = !DILocation(line: 197, column: 21, scope: !270)
!309 = !DILocation(line: 199, column: 21, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !71, line: 198, column: 17)
!311 = !DILocation(line: 202, column: 35, scope: !270)
!312 = !DILocation(line: 202, column: 49, scope: !270)
!313 = !DILocation(line: 202, column: 30, scope: !270)
!314 = !DILocation(line: 202, column: 28, scope: !270)
!315 = !DILocation(line: 203, column: 21, scope: !316)
!316 = distinct !DILexicalBlock(scope: !270, file: !71, line: 203, column: 21)
!317 = !DILocation(line: 203, column: 32, scope: !316)
!318 = !DILocation(line: 203, column: 48, scope: !316)
!319 = !DILocation(line: 203, column: 51, scope: !316)
!320 = !DILocation(line: 203, column: 62, scope: !316)
!321 = !DILocation(line: 203, column: 21, scope: !270)
!322 = !DILocation(line: 205, column: 21, scope: !323)
!323 = distinct !DILexicalBlock(scope: !316, file: !71, line: 204, column: 17)
!324 = !DILocation(line: 208, column: 29, scope: !270)
!325 = !DILocation(line: 208, column: 17, scope: !270)
!326 = !DILocation(line: 208, column: 41, scope: !270)
!327 = !DILocation(line: 210, column: 29, scope: !270)
!328 = !DILocation(line: 210, column: 24, scope: !270)
!329 = !DILocation(line: 210, column: 22, scope: !270)
!330 = !DILocation(line: 211, column: 13, scope: !270)
!331 = !DILocation(line: 213, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !257, file: !71, line: 213, column: 17)
!333 = !DILocation(line: 213, column: 30, scope: !332)
!334 = !DILocation(line: 213, column: 17, scope: !257)
!335 = !DILocation(line: 215, column: 30, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !71, line: 214, column: 13)
!337 = !DILocation(line: 215, column: 17, scope: !336)
!338 = !DILocation(line: 216, column: 13, scope: !336)
!339 = !DILocation(line: 217, column: 17, scope: !340)
!340 = distinct !DILexicalBlock(scope: !257, file: !71, line: 217, column: 17)
!341 = !DILocation(line: 217, column: 30, scope: !340)
!342 = !DILocation(line: 217, column: 17, scope: !257)
!343 = !DILocation(line: 219, column: 30, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !71, line: 218, column: 13)
!345 = !DILocation(line: 219, column: 17, scope: !344)
!346 = !DILocation(line: 220, column: 13, scope: !344)
!347 = !DILocation(line: 228, column: 9, scope: !258)
!348 = !DILocation(line: 230, column: 5, scope: !251)
!349 = !DILocalVariable(name: "i", scope: !350, file: !71, line: 233, type: !76)
!350 = distinct !DILexicalBlock(scope: !351, file: !71, line: 232, column: 9)
!351 = distinct !DILexicalBlock(scope: !251, file: !71, line: 231, column: 5)
!352 = !DILocation(line: 233, column: 17, scope: !350)
!353 = !DILocalVariable(name: "buffer", scope: !350, file: !71, line: 234, type: !194)
!354 = !DILocation(line: 234, column: 17, scope: !350)
!355 = !DILocation(line: 236, column: 17, scope: !356)
!356 = distinct !DILexicalBlock(scope: !350, file: !71, line: 236, column: 17)
!357 = !DILocation(line: 236, column: 22, scope: !356)
!358 = !DILocation(line: 236, column: 27, scope: !356)
!359 = !DILocation(line: 236, column: 30, scope: !356)
!360 = !DILocation(line: 236, column: 35, scope: !356)
!361 = !DILocation(line: 236, column: 17, scope: !350)
!362 = !DILocation(line: 238, column: 24, scope: !363)
!363 = distinct !DILexicalBlock(scope: !356, file: !71, line: 237, column: 13)
!364 = !DILocation(line: 238, column: 17, scope: !363)
!365 = !DILocation(line: 238, column: 30, scope: !363)
!366 = !DILocation(line: 240, column: 23, scope: !367)
!367 = distinct !DILexicalBlock(scope: !363, file: !71, line: 240, column: 17)
!368 = !DILocation(line: 240, column: 21, scope: !367)
!369 = !DILocation(line: 240, column: 28, scope: !370)
!370 = distinct !DILexicalBlock(scope: !367, file: !71, line: 240, column: 17)
!371 = !DILocation(line: 240, column: 30, scope: !370)
!372 = !DILocation(line: 240, column: 17, scope: !367)
!373 = !DILocation(line: 242, column: 41, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !71, line: 241, column: 17)
!375 = !DILocation(line: 242, column: 34, scope: !374)
!376 = !DILocation(line: 242, column: 21, scope: !374)
!377 = !DILocation(line: 243, column: 17, scope: !374)
!378 = !DILocation(line: 240, column: 37, scope: !370)
!379 = !DILocation(line: 240, column: 17, scope: !370)
!380 = distinct !{!380, !372, !381, !222}
!381 = !DILocation(line: 243, column: 17, scope: !367)
!382 = !DILocation(line: 244, column: 13, scope: !363)
!383 = !DILocation(line: 247, column: 17, scope: !384)
!384 = distinct !DILexicalBlock(scope: !356, file: !71, line: 246, column: 13)
!385 = !DILocation(line: 250, column: 9, scope: !351)
!386 = !DILocation(line: 252, column: 1, scope: !251)
!387 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 255, type: !72, scopeLine: 256, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!388 = !DILocalVariable(name: "data", scope: !387, file: !71, line: 257, type: !76)
!389 = !DILocation(line: 257, column: 9, scope: !387)
!390 = !DILocation(line: 259, column: 10, scope: !387)
!391 = !DILocation(line: 260, column: 5, scope: !387)
!392 = !DILocation(line: 264, column: 14, scope: !393)
!393 = distinct !DILexicalBlock(scope: !387, file: !71, line: 261, column: 5)
!394 = !DILocation(line: 265, column: 9, scope: !393)
!395 = !DILocation(line: 267, column: 5, scope: !387)
!396 = !DILocalVariable(name: "i", scope: !397, file: !71, line: 270, type: !76)
!397 = distinct !DILexicalBlock(scope: !398, file: !71, line: 269, column: 9)
!398 = distinct !DILexicalBlock(scope: !387, file: !71, line: 268, column: 5)
!399 = !DILocation(line: 270, column: 17, scope: !397)
!400 = !DILocalVariable(name: "buffer", scope: !397, file: !71, line: 271, type: !194)
!401 = !DILocation(line: 271, column: 17, scope: !397)
!402 = !DILocation(line: 274, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !397, file: !71, line: 274, column: 17)
!404 = !DILocation(line: 274, column: 22, scope: !403)
!405 = !DILocation(line: 274, column: 17, scope: !397)
!406 = !DILocation(line: 276, column: 24, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !71, line: 275, column: 13)
!408 = !DILocation(line: 276, column: 17, scope: !407)
!409 = !DILocation(line: 276, column: 30, scope: !407)
!410 = !DILocation(line: 278, column: 23, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !71, line: 278, column: 17)
!412 = !DILocation(line: 278, column: 21, scope: !411)
!413 = !DILocation(line: 278, column: 28, scope: !414)
!414 = distinct !DILexicalBlock(scope: !411, file: !71, line: 278, column: 17)
!415 = !DILocation(line: 278, column: 30, scope: !414)
!416 = !DILocation(line: 278, column: 17, scope: !411)
!417 = !DILocation(line: 280, column: 41, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !71, line: 279, column: 17)
!419 = !DILocation(line: 280, column: 34, scope: !418)
!420 = !DILocation(line: 280, column: 21, scope: !418)
!421 = !DILocation(line: 281, column: 17, scope: !418)
!422 = !DILocation(line: 278, column: 37, scope: !414)
!423 = !DILocation(line: 278, column: 17, scope: !414)
!424 = distinct !{!424, !416, !425, !222}
!425 = !DILocation(line: 281, column: 17, scope: !411)
!426 = !DILocation(line: 282, column: 13, scope: !407)
!427 = !DILocation(line: 285, column: 17, scope: !428)
!428 = distinct !DILexicalBlock(scope: !403, file: !71, line: 284, column: 13)
!429 = !DILocation(line: 288, column: 9, scope: !398)
!430 = !DILocation(line: 290, column: 1, scope: !387)
