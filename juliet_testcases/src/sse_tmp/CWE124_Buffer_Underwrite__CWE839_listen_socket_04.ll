; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_04.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_04.c"
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_04_bad() #0 !dbg !70 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !79, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !84, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %listenSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !104, metadata !DIExpression()), !dbg !105
  store i32 -1, i32* %acceptSocket, align 4, !dbg !105
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %do.body, !dbg !108

do.body:                                          ; preds = %entry
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !187, metadata !DIExpression()), !dbg !191
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !192, metadata !DIExpression()), !dbg !196
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !196
  %16 = load i32, i32* %data, align 4, !dbg !197
  %cmp33 = icmp slt i32 %16, 10, !dbg !199
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !200

if.then35:                                        ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !201
  %idxprom36 = sext i32 %17 to i64, !dbg !203
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !203
  store i32 1, i32* %arrayidx37, align 4, !dbg !204
  store i32 0, i32* %i, align 4, !dbg !205
  br label %for.cond, !dbg !207

for.cond:                                         ; preds = %for.inc, %if.then35
  %18 = load i32, i32* %i, align 4, !dbg !208
  %cmp38 = icmp slt i32 %18, 10, !dbg !210
  br i1 %cmp38, label %for.body, label %for.end, !dbg !211

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !212
  %idxprom40 = sext i32 %19 to i64, !dbg !214
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom40, !dbg !214
  %20 = load i32, i32* %arrayidx41, align 4, !dbg !214
  call void @printIntLine(i32 %20), !dbg !215
  br label %for.inc, !dbg !216

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !217
  %inc = add nsw i32 %21, 1, !dbg !217
  store i32 %inc, i32* %i, align 4, !dbg !217
  br label %for.cond, !dbg !218, !llvm.loop !219

for.end:                                          ; preds = %for.cond
  br label %if.end42, !dbg !222

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !223
  br label %if.end42

if.end42:                                         ; preds = %if.else, %for.end
  ret void, !dbg !225
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
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_04_good() #0 !dbg !226 {
entry:
  call void @goodB2G1(), !dbg !227
  call void @goodB2G2(), !dbg !228
  call void @goodG2B1(), !dbg !229
  call void @goodG2B2(), !dbg !230
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
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_04_good(), !dbg !245
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !246
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !247
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_04_bad(), !dbg !248
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !249
  ret i32 0, !dbg !250
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !251 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !255, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %listenSocket, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !264, metadata !DIExpression()), !dbg !265
  store i32 -1, i32* %acceptSocket, align 4, !dbg !265
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !266, metadata !DIExpression()), !dbg !267
  br label %do.body, !dbg !268

do.body:                                          ; preds = %entry
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !347, metadata !DIExpression()), !dbg !351
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !352, metadata !DIExpression()), !dbg !353
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !353
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !353
  %16 = load i32, i32* %data, align 4, !dbg !354
  %cmp33 = icmp sge i32 %16, 0, !dbg !356
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !357

land.lhs.true:                                    ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !358
  %cmp35 = icmp slt i32 %17, 10, !dbg !359
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !360

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !361
  %idxprom38 = sext i32 %18 to i64, !dbg !363
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !363
  store i32 1, i32* %arrayidx39, align 4, !dbg !364
  store i32 0, i32* %i, align 4, !dbg !365
  br label %for.cond, !dbg !367

for.cond:                                         ; preds = %for.inc, %if.then37
  %19 = load i32, i32* %i, align 4, !dbg !368
  %cmp40 = icmp slt i32 %19, 10, !dbg !370
  br i1 %cmp40, label %for.body, label %for.end, !dbg !371

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !372
  %idxprom42 = sext i32 %20 to i64, !dbg !374
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !374
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !374
  call void @printIntLine(i32 %21), !dbg !375
  br label %for.inc, !dbg !376

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !377
  %inc = add nsw i32 %22, 1, !dbg !377
  store i32 %inc, i32* %i, align 4, !dbg !377
  br label %for.cond, !dbg !378, !llvm.loop !379

for.end:                                          ; preds = %for.cond
  br label %if.end44, !dbg !381

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !382
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end
  ret void, !dbg !384
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !385 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !386, metadata !DIExpression()), !dbg !387
  store i32 -1, i32* %data, align 4, !dbg !388
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !389, metadata !DIExpression()), !dbg !393
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !394, metadata !DIExpression()), !dbg !395
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !396, metadata !DIExpression()), !dbg !397
  store i32 -1, i32* %listenSocket, align 4, !dbg !397
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !398, metadata !DIExpression()), !dbg !399
  store i32 -1, i32* %acceptSocket, align 4, !dbg !399
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !400, metadata !DIExpression()), !dbg !401
  br label %do.body, !dbg !402

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !403
  store i32 %call, i32* %listenSocket, align 4, !dbg !405
  %0 = load i32, i32* %listenSocket, align 4, !dbg !406
  %cmp = icmp eq i32 %0, -1, !dbg !408
  br i1 %cmp, label %if.then, label %if.end, !dbg !409

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !410

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !412
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !412
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !413
  store i16 2, i16* %sin_family, align 4, !dbg !414
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !415
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !416
  store i32 0, i32* %s_addr, align 4, !dbg !417
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !418
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !419
  store i16 %call1, i16* %sin_port, align 2, !dbg !420
  %2 = load i32, i32* %listenSocket, align 4, !dbg !421
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !423
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !424
  %cmp3 = icmp eq i32 %call2, -1, !dbg !425
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !426

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !427

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !429
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !431
  %cmp7 = icmp eq i32 %call6, -1, !dbg !432
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !433

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !434

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !436
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !437
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !438
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !439
  %cmp11 = icmp eq i32 %6, -1, !dbg !441
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !442

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !443

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !445
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !446
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !447
  %conv = trunc i64 %call14 to i32, !dbg !447
  store i32 %conv, i32* %recvResult, align 4, !dbg !448
  %8 = load i32, i32* %recvResult, align 4, !dbg !449
  %cmp15 = icmp eq i32 %8, -1, !dbg !451
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !452

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !453
  %cmp17 = icmp eq i32 %9, 0, !dbg !454
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !455

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !456

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !458
  %idxprom = sext i32 %10 to i64, !dbg !459
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !459
  store i8 0, i8* %arrayidx, align 1, !dbg !460
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !461
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !462
  store i32 %call22, i32* %data, align 4, !dbg !463
  br label %do.end, !dbg !464

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !465
  %cmp23 = icmp ne i32 %11, -1, !dbg !467
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !468

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !469
  %call26 = call i32 @close(i32 %12), !dbg !471
  br label %if.end27, !dbg !472

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !473
  %cmp28 = icmp ne i32 %13, -1, !dbg !475
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !476

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !477
  %call31 = call i32 @close(i32 %14), !dbg !479
  br label %if.end32, !dbg !480

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !481, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !486, metadata !DIExpression()), !dbg !487
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !487
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !487
  %16 = load i32, i32* %data, align 4, !dbg !488
  %cmp33 = icmp sge i32 %16, 0, !dbg !490
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !491

land.lhs.true:                                    ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !492
  %cmp35 = icmp slt i32 %17, 10, !dbg !493
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !494

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !495
  %idxprom38 = sext i32 %18 to i64, !dbg !497
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !497
  store i32 1, i32* %arrayidx39, align 4, !dbg !498
  store i32 0, i32* %i, align 4, !dbg !499
  br label %for.cond, !dbg !501

for.cond:                                         ; preds = %for.inc, %if.then37
  %19 = load i32, i32* %i, align 4, !dbg !502
  %cmp40 = icmp slt i32 %19, 10, !dbg !504
  br i1 %cmp40, label %for.body, label %for.end, !dbg !505

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !506
  %idxprom42 = sext i32 %20 to i64, !dbg !508
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !508
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !508
  call void @printIntLine(i32 %21), !dbg !509
  br label %for.inc, !dbg !510

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !511
  %inc = add nsw i32 %22, 1, !dbg !511
  store i32 %inc, i32* %i, align 4, !dbg !511
  br label %for.cond, !dbg !512, !llvm.loop !513

for.end:                                          ; preds = %for.cond
  br label %if.end44, !dbg !515

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !516
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end
  ret void, !dbg !518
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !519 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !520, metadata !DIExpression()), !dbg !521
  store i32 -1, i32* %data, align 4, !dbg !522
  store i32 7, i32* %data, align 4, !dbg !523
  call void @llvm.dbg.declare(metadata i32* %i, metadata !526, metadata !DIExpression()), !dbg !530
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !531, metadata !DIExpression()), !dbg !532
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !532
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !532
  %1 = load i32, i32* %data, align 4, !dbg !533
  %cmp = icmp slt i32 %1, 10, !dbg !535
  br i1 %cmp, label %if.then, label %if.else, !dbg !536

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !537
  %idxprom = sext i32 %2 to i64, !dbg !539
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !539
  store i32 1, i32* %arrayidx, align 4, !dbg !540
  store i32 0, i32* %i, align 4, !dbg !541
  br label %for.cond, !dbg !543

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !544
  %cmp1 = icmp slt i32 %3, 10, !dbg !546
  br i1 %cmp1, label %for.body, label %for.end, !dbg !547

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !548
  %idxprom2 = sext i32 %4 to i64, !dbg !550
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !550
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !550
  call void @printIntLine(i32 %5), !dbg !551
  br label %for.inc, !dbg !552

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !553
  %inc = add nsw i32 %6, 1, !dbg !553
  store i32 %inc, i32* %i, align 4, !dbg !553
  br label %for.cond, !dbg !554, !llvm.loop !555

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !557

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !558
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !560
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !561 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !562, metadata !DIExpression()), !dbg !563
  store i32 -1, i32* %data, align 4, !dbg !564
  store i32 7, i32* %data, align 4, !dbg !565
  call void @llvm.dbg.declare(metadata i32* %i, metadata !568, metadata !DIExpression()), !dbg !572
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !573, metadata !DIExpression()), !dbg !574
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !574
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !574
  %1 = load i32, i32* %data, align 4, !dbg !575
  %cmp = icmp slt i32 %1, 10, !dbg !577
  br i1 %cmp, label %if.then, label %if.else, !dbg !578

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !579
  %idxprom = sext i32 %2 to i64, !dbg !581
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !581
  store i32 1, i32* %arrayidx, align 4, !dbg !582
  store i32 0, i32* %i, align 4, !dbg !583
  br label %for.cond, !dbg !585

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !586
  %cmp1 = icmp slt i32 %3, 10, !dbg !588
  br i1 %cmp1, label %for.body, label %for.end, !dbg !589

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !590
  %idxprom2 = sext i32 %4 to i64, !dbg !592
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !592
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !592
  call void @printIntLine(i32 %5), !dbg !593
  br label %for.inc, !dbg !594

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !595
  %inc = add nsw i32 %6, 1, !dbg !595
  store i32 %inc, i32* %i, align 4, !dbg !595
  br label %for.cond, !dbg !596, !llvm.loop !597

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !599

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !600
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !602
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_04.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_04_bad", scope: !71, file: !71, line: 50, type: !72, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_04.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 52, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 52, column: 9, scope: !70)
!78 = !DILocation(line: 54, column: 10, scope: !70)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !71, line: 62, type: !76)
!80 = distinct !DILexicalBlock(scope: !81, file: !71, line: 57, column: 9)
!81 = distinct !DILexicalBlock(scope: !82, file: !71, line: 56, column: 5)
!82 = distinct !DILexicalBlock(scope: !70, file: !71, line: 55, column: 8)
!83 = !DILocation(line: 62, column: 17, scope: !80)
!84 = !DILocalVariable(name: "service", scope: !80, file: !71, line: 63, type: !85)
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
!101 = !DILocation(line: 63, column: 32, scope: !80)
!102 = !DILocalVariable(name: "listenSocket", scope: !80, file: !71, line: 64, type: !76)
!103 = !DILocation(line: 64, column: 20, scope: !80)
!104 = !DILocalVariable(name: "acceptSocket", scope: !80, file: !71, line: 65, type: !76)
!105 = !DILocation(line: 65, column: 20, scope: !80)
!106 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !71, line: 66, type: !60)
!107 = !DILocation(line: 66, column: 18, scope: !80)
!108 = !DILocation(line: 67, column: 13, scope: !80)
!109 = !DILocation(line: 77, column: 32, scope: !110)
!110 = distinct !DILexicalBlock(scope: !80, file: !71, line: 68, column: 13)
!111 = !DILocation(line: 77, column: 30, scope: !110)
!112 = !DILocation(line: 78, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !71, line: 78, column: 21)
!114 = !DILocation(line: 78, column: 34, scope: !113)
!115 = !DILocation(line: 78, column: 21, scope: !110)
!116 = !DILocation(line: 80, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !71, line: 79, column: 17)
!118 = !DILocation(line: 82, column: 17, scope: !110)
!119 = !DILocation(line: 83, column: 25, scope: !110)
!120 = !DILocation(line: 83, column: 36, scope: !110)
!121 = !DILocation(line: 84, column: 25, scope: !110)
!122 = !DILocation(line: 84, column: 34, scope: !110)
!123 = !DILocation(line: 84, column: 41, scope: !110)
!124 = !DILocation(line: 85, column: 36, scope: !110)
!125 = !DILocation(line: 85, column: 25, scope: !110)
!126 = !DILocation(line: 85, column: 34, scope: !110)
!127 = !DILocation(line: 86, column: 26, scope: !128)
!128 = distinct !DILexicalBlock(scope: !110, file: !71, line: 86, column: 21)
!129 = !DILocation(line: 86, column: 40, scope: !128)
!130 = !DILocation(line: 86, column: 21, scope: !128)
!131 = !DILocation(line: 86, column: 85, scope: !128)
!132 = !DILocation(line: 86, column: 21, scope: !110)
!133 = !DILocation(line: 88, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !128, file: !71, line: 87, column: 17)
!135 = !DILocation(line: 90, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !110, file: !71, line: 90, column: 21)
!137 = !DILocation(line: 90, column: 21, scope: !136)
!138 = !DILocation(line: 90, column: 58, scope: !136)
!139 = !DILocation(line: 90, column: 21, scope: !110)
!140 = !DILocation(line: 92, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !71, line: 91, column: 17)
!142 = !DILocation(line: 94, column: 39, scope: !110)
!143 = !DILocation(line: 94, column: 32, scope: !110)
!144 = !DILocation(line: 94, column: 30, scope: !110)
!145 = !DILocation(line: 95, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !110, file: !71, line: 95, column: 21)
!147 = !DILocation(line: 95, column: 34, scope: !146)
!148 = !DILocation(line: 95, column: 21, scope: !110)
!149 = !DILocation(line: 97, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !71, line: 96, column: 17)
!151 = !DILocation(line: 100, column: 35, scope: !110)
!152 = !DILocation(line: 100, column: 49, scope: !110)
!153 = !DILocation(line: 100, column: 30, scope: !110)
!154 = !DILocation(line: 100, column: 28, scope: !110)
!155 = !DILocation(line: 101, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !110, file: !71, line: 101, column: 21)
!157 = !DILocation(line: 101, column: 32, scope: !156)
!158 = !DILocation(line: 101, column: 48, scope: !156)
!159 = !DILocation(line: 101, column: 51, scope: !156)
!160 = !DILocation(line: 101, column: 62, scope: !156)
!161 = !DILocation(line: 101, column: 21, scope: !110)
!162 = !DILocation(line: 103, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !71, line: 102, column: 17)
!164 = !DILocation(line: 106, column: 29, scope: !110)
!165 = !DILocation(line: 106, column: 17, scope: !110)
!166 = !DILocation(line: 106, column: 41, scope: !110)
!167 = !DILocation(line: 108, column: 29, scope: !110)
!168 = !DILocation(line: 108, column: 24, scope: !110)
!169 = !DILocation(line: 108, column: 22, scope: !110)
!170 = !DILocation(line: 109, column: 13, scope: !110)
!171 = !DILocation(line: 111, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !80, file: !71, line: 111, column: 17)
!173 = !DILocation(line: 111, column: 30, scope: !172)
!174 = !DILocation(line: 111, column: 17, scope: !80)
!175 = !DILocation(line: 113, column: 30, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !71, line: 112, column: 13)
!177 = !DILocation(line: 113, column: 17, scope: !176)
!178 = !DILocation(line: 114, column: 13, scope: !176)
!179 = !DILocation(line: 115, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !80, file: !71, line: 115, column: 17)
!181 = !DILocation(line: 115, column: 30, scope: !180)
!182 = !DILocation(line: 115, column: 17, scope: !80)
!183 = !DILocation(line: 117, column: 30, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !71, line: 116, column: 13)
!185 = !DILocation(line: 117, column: 17, scope: !184)
!186 = !DILocation(line: 118, column: 13, scope: !184)
!187 = !DILocalVariable(name: "i", scope: !188, file: !71, line: 130, type: !76)
!188 = distinct !DILexicalBlock(scope: !189, file: !71, line: 129, column: 9)
!189 = distinct !DILexicalBlock(scope: !190, file: !71, line: 128, column: 5)
!190 = distinct !DILexicalBlock(scope: !70, file: !71, line: 127, column: 8)
!191 = !DILocation(line: 130, column: 17, scope: !188)
!192 = !DILocalVariable(name: "buffer", scope: !188, file: !71, line: 131, type: !193)
!193 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !194)
!194 = !{!195}
!195 = !DISubrange(count: 10)
!196 = !DILocation(line: 131, column: 17, scope: !188)
!197 = !DILocation(line: 134, column: 17, scope: !198)
!198 = distinct !DILexicalBlock(scope: !188, file: !71, line: 134, column: 17)
!199 = !DILocation(line: 134, column: 22, scope: !198)
!200 = !DILocation(line: 134, column: 17, scope: !188)
!201 = !DILocation(line: 136, column: 24, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !71, line: 135, column: 13)
!203 = !DILocation(line: 136, column: 17, scope: !202)
!204 = !DILocation(line: 136, column: 30, scope: !202)
!205 = !DILocation(line: 138, column: 23, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !71, line: 138, column: 17)
!207 = !DILocation(line: 138, column: 21, scope: !206)
!208 = !DILocation(line: 138, column: 28, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !71, line: 138, column: 17)
!210 = !DILocation(line: 138, column: 30, scope: !209)
!211 = !DILocation(line: 138, column: 17, scope: !206)
!212 = !DILocation(line: 140, column: 41, scope: !213)
!213 = distinct !DILexicalBlock(scope: !209, file: !71, line: 139, column: 17)
!214 = !DILocation(line: 140, column: 34, scope: !213)
!215 = !DILocation(line: 140, column: 21, scope: !213)
!216 = !DILocation(line: 141, column: 17, scope: !213)
!217 = !DILocation(line: 138, column: 37, scope: !209)
!218 = !DILocation(line: 138, column: 17, scope: !209)
!219 = distinct !{!219, !211, !220, !221}
!220 = !DILocation(line: 141, column: 17, scope: !206)
!221 = !{!"llvm.loop.mustprogress"}
!222 = !DILocation(line: 142, column: 13, scope: !202)
!223 = !DILocation(line: 145, column: 17, scope: !224)
!224 = distinct !DILexicalBlock(scope: !198, file: !71, line: 144, column: 13)
!225 = !DILocation(line: 149, column: 1, scope: !70)
!226 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_04_good", scope: !71, file: !71, line: 439, type: !72, scopeLine: 440, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!227 = !DILocation(line: 441, column: 5, scope: !226)
!228 = !DILocation(line: 442, column: 5, scope: !226)
!229 = !DILocation(line: 443, column: 5, scope: !226)
!230 = !DILocation(line: 444, column: 5, scope: !226)
!231 = !DILocation(line: 445, column: 1, scope: !226)
!232 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 456, type: !233, scopeLine: 457, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!233 = !DISubroutineType(types: !234)
!234 = !{!76, !76, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!237 = !DILocalVariable(name: "argc", arg: 1, scope: !232, file: !71, line: 456, type: !76)
!238 = !DILocation(line: 456, column: 14, scope: !232)
!239 = !DILocalVariable(name: "argv", arg: 2, scope: !232, file: !71, line: 456, type: !235)
!240 = !DILocation(line: 456, column: 27, scope: !232)
!241 = !DILocation(line: 459, column: 22, scope: !232)
!242 = !DILocation(line: 459, column: 12, scope: !232)
!243 = !DILocation(line: 459, column: 5, scope: !232)
!244 = !DILocation(line: 461, column: 5, scope: !232)
!245 = !DILocation(line: 462, column: 5, scope: !232)
!246 = !DILocation(line: 463, column: 5, scope: !232)
!247 = !DILocation(line: 466, column: 5, scope: !232)
!248 = !DILocation(line: 467, column: 5, scope: !232)
!249 = !DILocation(line: 468, column: 5, scope: !232)
!250 = !DILocation(line: 470, column: 5, scope: !232)
!251 = distinct !DISubprogram(name: "goodB2G1", scope: !71, file: !71, line: 156, type: !72, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!252 = !DILocalVariable(name: "data", scope: !251, file: !71, line: 158, type: !76)
!253 = !DILocation(line: 158, column: 9, scope: !251)
!254 = !DILocation(line: 160, column: 10, scope: !251)
!255 = !DILocalVariable(name: "recvResult", scope: !256, file: !71, line: 168, type: !76)
!256 = distinct !DILexicalBlock(scope: !257, file: !71, line: 163, column: 9)
!257 = distinct !DILexicalBlock(scope: !258, file: !71, line: 162, column: 5)
!258 = distinct !DILexicalBlock(scope: !251, file: !71, line: 161, column: 8)
!259 = !DILocation(line: 168, column: 17, scope: !256)
!260 = !DILocalVariable(name: "service", scope: !256, file: !71, line: 169, type: !85)
!261 = !DILocation(line: 169, column: 32, scope: !256)
!262 = !DILocalVariable(name: "listenSocket", scope: !256, file: !71, line: 170, type: !76)
!263 = !DILocation(line: 170, column: 20, scope: !256)
!264 = !DILocalVariable(name: "acceptSocket", scope: !256, file: !71, line: 171, type: !76)
!265 = !DILocation(line: 171, column: 20, scope: !256)
!266 = !DILocalVariable(name: "inputBuffer", scope: !256, file: !71, line: 172, type: !60)
!267 = !DILocation(line: 172, column: 18, scope: !256)
!268 = !DILocation(line: 173, column: 13, scope: !256)
!269 = !DILocation(line: 183, column: 32, scope: !270)
!270 = distinct !DILexicalBlock(scope: !256, file: !71, line: 174, column: 13)
!271 = !DILocation(line: 183, column: 30, scope: !270)
!272 = !DILocation(line: 184, column: 21, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !71, line: 184, column: 21)
!274 = !DILocation(line: 184, column: 34, scope: !273)
!275 = !DILocation(line: 184, column: 21, scope: !270)
!276 = !DILocation(line: 186, column: 21, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !71, line: 185, column: 17)
!278 = !DILocation(line: 188, column: 17, scope: !270)
!279 = !DILocation(line: 189, column: 25, scope: !270)
!280 = !DILocation(line: 189, column: 36, scope: !270)
!281 = !DILocation(line: 190, column: 25, scope: !270)
!282 = !DILocation(line: 190, column: 34, scope: !270)
!283 = !DILocation(line: 190, column: 41, scope: !270)
!284 = !DILocation(line: 191, column: 36, scope: !270)
!285 = !DILocation(line: 191, column: 25, scope: !270)
!286 = !DILocation(line: 191, column: 34, scope: !270)
!287 = !DILocation(line: 192, column: 26, scope: !288)
!288 = distinct !DILexicalBlock(scope: !270, file: !71, line: 192, column: 21)
!289 = !DILocation(line: 192, column: 40, scope: !288)
!290 = !DILocation(line: 192, column: 21, scope: !288)
!291 = !DILocation(line: 192, column: 85, scope: !288)
!292 = !DILocation(line: 192, column: 21, scope: !270)
!293 = !DILocation(line: 194, column: 21, scope: !294)
!294 = distinct !DILexicalBlock(scope: !288, file: !71, line: 193, column: 17)
!295 = !DILocation(line: 196, column: 28, scope: !296)
!296 = distinct !DILexicalBlock(scope: !270, file: !71, line: 196, column: 21)
!297 = !DILocation(line: 196, column: 21, scope: !296)
!298 = !DILocation(line: 196, column: 58, scope: !296)
!299 = !DILocation(line: 196, column: 21, scope: !270)
!300 = !DILocation(line: 198, column: 21, scope: !301)
!301 = distinct !DILexicalBlock(scope: !296, file: !71, line: 197, column: 17)
!302 = !DILocation(line: 200, column: 39, scope: !270)
!303 = !DILocation(line: 200, column: 32, scope: !270)
!304 = !DILocation(line: 200, column: 30, scope: !270)
!305 = !DILocation(line: 201, column: 21, scope: !306)
!306 = distinct !DILexicalBlock(scope: !270, file: !71, line: 201, column: 21)
!307 = !DILocation(line: 201, column: 34, scope: !306)
!308 = !DILocation(line: 201, column: 21, scope: !270)
!309 = !DILocation(line: 203, column: 21, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !71, line: 202, column: 17)
!311 = !DILocation(line: 206, column: 35, scope: !270)
!312 = !DILocation(line: 206, column: 49, scope: !270)
!313 = !DILocation(line: 206, column: 30, scope: !270)
!314 = !DILocation(line: 206, column: 28, scope: !270)
!315 = !DILocation(line: 207, column: 21, scope: !316)
!316 = distinct !DILexicalBlock(scope: !270, file: !71, line: 207, column: 21)
!317 = !DILocation(line: 207, column: 32, scope: !316)
!318 = !DILocation(line: 207, column: 48, scope: !316)
!319 = !DILocation(line: 207, column: 51, scope: !316)
!320 = !DILocation(line: 207, column: 62, scope: !316)
!321 = !DILocation(line: 207, column: 21, scope: !270)
!322 = !DILocation(line: 209, column: 21, scope: !323)
!323 = distinct !DILexicalBlock(scope: !316, file: !71, line: 208, column: 17)
!324 = !DILocation(line: 212, column: 29, scope: !270)
!325 = !DILocation(line: 212, column: 17, scope: !270)
!326 = !DILocation(line: 212, column: 41, scope: !270)
!327 = !DILocation(line: 214, column: 29, scope: !270)
!328 = !DILocation(line: 214, column: 24, scope: !270)
!329 = !DILocation(line: 214, column: 22, scope: !270)
!330 = !DILocation(line: 215, column: 13, scope: !270)
!331 = !DILocation(line: 217, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !256, file: !71, line: 217, column: 17)
!333 = !DILocation(line: 217, column: 30, scope: !332)
!334 = !DILocation(line: 217, column: 17, scope: !256)
!335 = !DILocation(line: 219, column: 30, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !71, line: 218, column: 13)
!337 = !DILocation(line: 219, column: 17, scope: !336)
!338 = !DILocation(line: 220, column: 13, scope: !336)
!339 = !DILocation(line: 221, column: 17, scope: !340)
!340 = distinct !DILexicalBlock(scope: !256, file: !71, line: 221, column: 17)
!341 = !DILocation(line: 221, column: 30, scope: !340)
!342 = !DILocation(line: 221, column: 17, scope: !256)
!343 = !DILocation(line: 223, column: 30, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !71, line: 222, column: 13)
!345 = !DILocation(line: 223, column: 17, scope: !344)
!346 = !DILocation(line: 224, column: 13, scope: !344)
!347 = !DILocalVariable(name: "i", scope: !348, file: !71, line: 241, type: !76)
!348 = distinct !DILexicalBlock(scope: !349, file: !71, line: 240, column: 9)
!349 = distinct !DILexicalBlock(scope: !350, file: !71, line: 239, column: 5)
!350 = distinct !DILexicalBlock(scope: !251, file: !71, line: 233, column: 8)
!351 = !DILocation(line: 241, column: 17, scope: !348)
!352 = !DILocalVariable(name: "buffer", scope: !348, file: !71, line: 242, type: !193)
!353 = !DILocation(line: 242, column: 17, scope: !348)
!354 = !DILocation(line: 244, column: 17, scope: !355)
!355 = distinct !DILexicalBlock(scope: !348, file: !71, line: 244, column: 17)
!356 = !DILocation(line: 244, column: 22, scope: !355)
!357 = !DILocation(line: 244, column: 27, scope: !355)
!358 = !DILocation(line: 244, column: 30, scope: !355)
!359 = !DILocation(line: 244, column: 35, scope: !355)
!360 = !DILocation(line: 244, column: 17, scope: !348)
!361 = !DILocation(line: 246, column: 24, scope: !362)
!362 = distinct !DILexicalBlock(scope: !355, file: !71, line: 245, column: 13)
!363 = !DILocation(line: 246, column: 17, scope: !362)
!364 = !DILocation(line: 246, column: 30, scope: !362)
!365 = !DILocation(line: 248, column: 23, scope: !366)
!366 = distinct !DILexicalBlock(scope: !362, file: !71, line: 248, column: 17)
!367 = !DILocation(line: 248, column: 21, scope: !366)
!368 = !DILocation(line: 248, column: 28, scope: !369)
!369 = distinct !DILexicalBlock(scope: !366, file: !71, line: 248, column: 17)
!370 = !DILocation(line: 248, column: 30, scope: !369)
!371 = !DILocation(line: 248, column: 17, scope: !366)
!372 = !DILocation(line: 250, column: 41, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !71, line: 249, column: 17)
!374 = !DILocation(line: 250, column: 34, scope: !373)
!375 = !DILocation(line: 250, column: 21, scope: !373)
!376 = !DILocation(line: 251, column: 17, scope: !373)
!377 = !DILocation(line: 248, column: 37, scope: !369)
!378 = !DILocation(line: 248, column: 17, scope: !369)
!379 = distinct !{!379, !371, !380, !221}
!380 = !DILocation(line: 251, column: 17, scope: !366)
!381 = !DILocation(line: 252, column: 13, scope: !362)
!382 = !DILocation(line: 255, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !355, file: !71, line: 254, column: 13)
!384 = !DILocation(line: 259, column: 1, scope: !251)
!385 = distinct !DISubprogram(name: "goodB2G2", scope: !71, file: !71, line: 262, type: !72, scopeLine: 263, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!386 = !DILocalVariable(name: "data", scope: !385, file: !71, line: 264, type: !76)
!387 = !DILocation(line: 264, column: 9, scope: !385)
!388 = !DILocation(line: 266, column: 10, scope: !385)
!389 = !DILocalVariable(name: "recvResult", scope: !390, file: !71, line: 274, type: !76)
!390 = distinct !DILexicalBlock(scope: !391, file: !71, line: 269, column: 9)
!391 = distinct !DILexicalBlock(scope: !392, file: !71, line: 268, column: 5)
!392 = distinct !DILexicalBlock(scope: !385, file: !71, line: 267, column: 8)
!393 = !DILocation(line: 274, column: 17, scope: !390)
!394 = !DILocalVariable(name: "service", scope: !390, file: !71, line: 275, type: !85)
!395 = !DILocation(line: 275, column: 32, scope: !390)
!396 = !DILocalVariable(name: "listenSocket", scope: !390, file: !71, line: 276, type: !76)
!397 = !DILocation(line: 276, column: 20, scope: !390)
!398 = !DILocalVariable(name: "acceptSocket", scope: !390, file: !71, line: 277, type: !76)
!399 = !DILocation(line: 277, column: 20, scope: !390)
!400 = !DILocalVariable(name: "inputBuffer", scope: !390, file: !71, line: 278, type: !60)
!401 = !DILocation(line: 278, column: 18, scope: !390)
!402 = !DILocation(line: 279, column: 13, scope: !390)
!403 = !DILocation(line: 289, column: 32, scope: !404)
!404 = distinct !DILexicalBlock(scope: !390, file: !71, line: 280, column: 13)
!405 = !DILocation(line: 289, column: 30, scope: !404)
!406 = !DILocation(line: 290, column: 21, scope: !407)
!407 = distinct !DILexicalBlock(scope: !404, file: !71, line: 290, column: 21)
!408 = !DILocation(line: 290, column: 34, scope: !407)
!409 = !DILocation(line: 290, column: 21, scope: !404)
!410 = !DILocation(line: 292, column: 21, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !71, line: 291, column: 17)
!412 = !DILocation(line: 294, column: 17, scope: !404)
!413 = !DILocation(line: 295, column: 25, scope: !404)
!414 = !DILocation(line: 295, column: 36, scope: !404)
!415 = !DILocation(line: 296, column: 25, scope: !404)
!416 = !DILocation(line: 296, column: 34, scope: !404)
!417 = !DILocation(line: 296, column: 41, scope: !404)
!418 = !DILocation(line: 297, column: 36, scope: !404)
!419 = !DILocation(line: 297, column: 25, scope: !404)
!420 = !DILocation(line: 297, column: 34, scope: !404)
!421 = !DILocation(line: 298, column: 26, scope: !422)
!422 = distinct !DILexicalBlock(scope: !404, file: !71, line: 298, column: 21)
!423 = !DILocation(line: 298, column: 40, scope: !422)
!424 = !DILocation(line: 298, column: 21, scope: !422)
!425 = !DILocation(line: 298, column: 85, scope: !422)
!426 = !DILocation(line: 298, column: 21, scope: !404)
!427 = !DILocation(line: 300, column: 21, scope: !428)
!428 = distinct !DILexicalBlock(scope: !422, file: !71, line: 299, column: 17)
!429 = !DILocation(line: 302, column: 28, scope: !430)
!430 = distinct !DILexicalBlock(scope: !404, file: !71, line: 302, column: 21)
!431 = !DILocation(line: 302, column: 21, scope: !430)
!432 = !DILocation(line: 302, column: 58, scope: !430)
!433 = !DILocation(line: 302, column: 21, scope: !404)
!434 = !DILocation(line: 304, column: 21, scope: !435)
!435 = distinct !DILexicalBlock(scope: !430, file: !71, line: 303, column: 17)
!436 = !DILocation(line: 306, column: 39, scope: !404)
!437 = !DILocation(line: 306, column: 32, scope: !404)
!438 = !DILocation(line: 306, column: 30, scope: !404)
!439 = !DILocation(line: 307, column: 21, scope: !440)
!440 = distinct !DILexicalBlock(scope: !404, file: !71, line: 307, column: 21)
!441 = !DILocation(line: 307, column: 34, scope: !440)
!442 = !DILocation(line: 307, column: 21, scope: !404)
!443 = !DILocation(line: 309, column: 21, scope: !444)
!444 = distinct !DILexicalBlock(scope: !440, file: !71, line: 308, column: 17)
!445 = !DILocation(line: 312, column: 35, scope: !404)
!446 = !DILocation(line: 312, column: 49, scope: !404)
!447 = !DILocation(line: 312, column: 30, scope: !404)
!448 = !DILocation(line: 312, column: 28, scope: !404)
!449 = !DILocation(line: 313, column: 21, scope: !450)
!450 = distinct !DILexicalBlock(scope: !404, file: !71, line: 313, column: 21)
!451 = !DILocation(line: 313, column: 32, scope: !450)
!452 = !DILocation(line: 313, column: 48, scope: !450)
!453 = !DILocation(line: 313, column: 51, scope: !450)
!454 = !DILocation(line: 313, column: 62, scope: !450)
!455 = !DILocation(line: 313, column: 21, scope: !404)
!456 = !DILocation(line: 315, column: 21, scope: !457)
!457 = distinct !DILexicalBlock(scope: !450, file: !71, line: 314, column: 17)
!458 = !DILocation(line: 318, column: 29, scope: !404)
!459 = !DILocation(line: 318, column: 17, scope: !404)
!460 = !DILocation(line: 318, column: 41, scope: !404)
!461 = !DILocation(line: 320, column: 29, scope: !404)
!462 = !DILocation(line: 320, column: 24, scope: !404)
!463 = !DILocation(line: 320, column: 22, scope: !404)
!464 = !DILocation(line: 321, column: 13, scope: !404)
!465 = !DILocation(line: 323, column: 17, scope: !466)
!466 = distinct !DILexicalBlock(scope: !390, file: !71, line: 323, column: 17)
!467 = !DILocation(line: 323, column: 30, scope: !466)
!468 = !DILocation(line: 323, column: 17, scope: !390)
!469 = !DILocation(line: 325, column: 30, scope: !470)
!470 = distinct !DILexicalBlock(scope: !466, file: !71, line: 324, column: 13)
!471 = !DILocation(line: 325, column: 17, scope: !470)
!472 = !DILocation(line: 326, column: 13, scope: !470)
!473 = !DILocation(line: 327, column: 17, scope: !474)
!474 = distinct !DILexicalBlock(scope: !390, file: !71, line: 327, column: 17)
!475 = !DILocation(line: 327, column: 30, scope: !474)
!476 = !DILocation(line: 327, column: 17, scope: !390)
!477 = !DILocation(line: 329, column: 30, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !71, line: 328, column: 13)
!479 = !DILocation(line: 329, column: 17, scope: !478)
!480 = !DILocation(line: 330, column: 13, scope: !478)
!481 = !DILocalVariable(name: "i", scope: !482, file: !71, line: 342, type: !76)
!482 = distinct !DILexicalBlock(scope: !483, file: !71, line: 341, column: 9)
!483 = distinct !DILexicalBlock(scope: !484, file: !71, line: 340, column: 5)
!484 = distinct !DILexicalBlock(scope: !385, file: !71, line: 339, column: 8)
!485 = !DILocation(line: 342, column: 17, scope: !482)
!486 = !DILocalVariable(name: "buffer", scope: !482, file: !71, line: 343, type: !193)
!487 = !DILocation(line: 343, column: 17, scope: !482)
!488 = !DILocation(line: 345, column: 17, scope: !489)
!489 = distinct !DILexicalBlock(scope: !482, file: !71, line: 345, column: 17)
!490 = !DILocation(line: 345, column: 22, scope: !489)
!491 = !DILocation(line: 345, column: 27, scope: !489)
!492 = !DILocation(line: 345, column: 30, scope: !489)
!493 = !DILocation(line: 345, column: 35, scope: !489)
!494 = !DILocation(line: 345, column: 17, scope: !482)
!495 = !DILocation(line: 347, column: 24, scope: !496)
!496 = distinct !DILexicalBlock(scope: !489, file: !71, line: 346, column: 13)
!497 = !DILocation(line: 347, column: 17, scope: !496)
!498 = !DILocation(line: 347, column: 30, scope: !496)
!499 = !DILocation(line: 349, column: 23, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !71, line: 349, column: 17)
!501 = !DILocation(line: 349, column: 21, scope: !500)
!502 = !DILocation(line: 349, column: 28, scope: !503)
!503 = distinct !DILexicalBlock(scope: !500, file: !71, line: 349, column: 17)
!504 = !DILocation(line: 349, column: 30, scope: !503)
!505 = !DILocation(line: 349, column: 17, scope: !500)
!506 = !DILocation(line: 351, column: 41, scope: !507)
!507 = distinct !DILexicalBlock(scope: !503, file: !71, line: 350, column: 17)
!508 = !DILocation(line: 351, column: 34, scope: !507)
!509 = !DILocation(line: 351, column: 21, scope: !507)
!510 = !DILocation(line: 352, column: 17, scope: !507)
!511 = !DILocation(line: 349, column: 37, scope: !503)
!512 = !DILocation(line: 349, column: 17, scope: !503)
!513 = distinct !{!513, !505, !514, !221}
!514 = !DILocation(line: 352, column: 17, scope: !500)
!515 = !DILocation(line: 353, column: 13, scope: !496)
!516 = !DILocation(line: 356, column: 17, scope: !517)
!517 = distinct !DILexicalBlock(scope: !489, file: !71, line: 355, column: 13)
!518 = !DILocation(line: 360, column: 1, scope: !385)
!519 = distinct !DISubprogram(name: "goodG2B1", scope: !71, file: !71, line: 363, type: !72, scopeLine: 364, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!520 = !DILocalVariable(name: "data", scope: !519, file: !71, line: 365, type: !76)
!521 = !DILocation(line: 365, column: 9, scope: !519)
!522 = !DILocation(line: 367, column: 10, scope: !519)
!523 = !DILocation(line: 377, column: 14, scope: !524)
!524 = distinct !DILexicalBlock(scope: !525, file: !71, line: 374, column: 5)
!525 = distinct !DILexicalBlock(scope: !519, file: !71, line: 368, column: 8)
!526 = !DILocalVariable(name: "i", scope: !527, file: !71, line: 382, type: !76)
!527 = distinct !DILexicalBlock(scope: !528, file: !71, line: 381, column: 9)
!528 = distinct !DILexicalBlock(scope: !529, file: !71, line: 380, column: 5)
!529 = distinct !DILexicalBlock(scope: !519, file: !71, line: 379, column: 8)
!530 = !DILocation(line: 382, column: 17, scope: !527)
!531 = !DILocalVariable(name: "buffer", scope: !527, file: !71, line: 383, type: !193)
!532 = !DILocation(line: 383, column: 17, scope: !527)
!533 = !DILocation(line: 386, column: 17, scope: !534)
!534 = distinct !DILexicalBlock(scope: !527, file: !71, line: 386, column: 17)
!535 = !DILocation(line: 386, column: 22, scope: !534)
!536 = !DILocation(line: 386, column: 17, scope: !527)
!537 = !DILocation(line: 388, column: 24, scope: !538)
!538 = distinct !DILexicalBlock(scope: !534, file: !71, line: 387, column: 13)
!539 = !DILocation(line: 388, column: 17, scope: !538)
!540 = !DILocation(line: 388, column: 30, scope: !538)
!541 = !DILocation(line: 390, column: 23, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !71, line: 390, column: 17)
!543 = !DILocation(line: 390, column: 21, scope: !542)
!544 = !DILocation(line: 390, column: 28, scope: !545)
!545 = distinct !DILexicalBlock(scope: !542, file: !71, line: 390, column: 17)
!546 = !DILocation(line: 390, column: 30, scope: !545)
!547 = !DILocation(line: 390, column: 17, scope: !542)
!548 = !DILocation(line: 392, column: 41, scope: !549)
!549 = distinct !DILexicalBlock(scope: !545, file: !71, line: 391, column: 17)
!550 = !DILocation(line: 392, column: 34, scope: !549)
!551 = !DILocation(line: 392, column: 21, scope: !549)
!552 = !DILocation(line: 393, column: 17, scope: !549)
!553 = !DILocation(line: 390, column: 37, scope: !545)
!554 = !DILocation(line: 390, column: 17, scope: !545)
!555 = distinct !{!555, !547, !556, !221}
!556 = !DILocation(line: 393, column: 17, scope: !542)
!557 = !DILocation(line: 394, column: 13, scope: !538)
!558 = !DILocation(line: 397, column: 17, scope: !559)
!559 = distinct !DILexicalBlock(scope: !534, file: !71, line: 396, column: 13)
!560 = !DILocation(line: 401, column: 1, scope: !519)
!561 = distinct !DISubprogram(name: "goodG2B2", scope: !71, file: !71, line: 404, type: !72, scopeLine: 405, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!562 = !DILocalVariable(name: "data", scope: !561, file: !71, line: 406, type: !76)
!563 = !DILocation(line: 406, column: 9, scope: !561)
!564 = !DILocation(line: 408, column: 10, scope: !561)
!565 = !DILocation(line: 413, column: 14, scope: !566)
!566 = distinct !DILexicalBlock(scope: !567, file: !71, line: 410, column: 5)
!567 = distinct !DILexicalBlock(scope: !561, file: !71, line: 409, column: 8)
!568 = !DILocalVariable(name: "i", scope: !569, file: !71, line: 418, type: !76)
!569 = distinct !DILexicalBlock(scope: !570, file: !71, line: 417, column: 9)
!570 = distinct !DILexicalBlock(scope: !571, file: !71, line: 416, column: 5)
!571 = distinct !DILexicalBlock(scope: !561, file: !71, line: 415, column: 8)
!572 = !DILocation(line: 418, column: 17, scope: !569)
!573 = !DILocalVariable(name: "buffer", scope: !569, file: !71, line: 419, type: !193)
!574 = !DILocation(line: 419, column: 17, scope: !569)
!575 = !DILocation(line: 422, column: 17, scope: !576)
!576 = distinct !DILexicalBlock(scope: !569, file: !71, line: 422, column: 17)
!577 = !DILocation(line: 422, column: 22, scope: !576)
!578 = !DILocation(line: 422, column: 17, scope: !569)
!579 = !DILocation(line: 424, column: 24, scope: !580)
!580 = distinct !DILexicalBlock(scope: !576, file: !71, line: 423, column: 13)
!581 = !DILocation(line: 424, column: 17, scope: !580)
!582 = !DILocation(line: 424, column: 30, scope: !580)
!583 = !DILocation(line: 426, column: 23, scope: !584)
!584 = distinct !DILexicalBlock(scope: !580, file: !71, line: 426, column: 17)
!585 = !DILocation(line: 426, column: 21, scope: !584)
!586 = !DILocation(line: 426, column: 28, scope: !587)
!587 = distinct !DILexicalBlock(scope: !584, file: !71, line: 426, column: 17)
!588 = !DILocation(line: 426, column: 30, scope: !587)
!589 = !DILocation(line: 426, column: 17, scope: !584)
!590 = !DILocation(line: 428, column: 41, scope: !591)
!591 = distinct !DILexicalBlock(scope: !587, file: !71, line: 427, column: 17)
!592 = !DILocation(line: 428, column: 34, scope: !591)
!593 = !DILocation(line: 428, column: 21, scope: !591)
!594 = !DILocation(line: 429, column: 17, scope: !591)
!595 = !DILocation(line: 426, column: 37, scope: !587)
!596 = !DILocation(line: 426, column: 17, scope: !587)
!597 = distinct !{!597, !589, !598, !221}
!598 = !DILocation(line: 429, column: 17, scope: !584)
!599 = !DILocation(line: 430, column: 13, scope: !580)
!600 = !DILocation(line: 433, column: 17, scope: !601)
!601 = distinct !DILexicalBlock(scope: !576, file: !71, line: 432, column: 13)
!602 = !DILocation(line: 437, column: 1, scope: !561)
