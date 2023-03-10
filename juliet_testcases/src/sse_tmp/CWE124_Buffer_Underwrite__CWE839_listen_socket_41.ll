; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_41_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !82, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %listenSocket, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !102, metadata !DIExpression()), !dbg !103
  store i32 -1, i32* %acceptSocket, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  br label %do.body, !dbg !106

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !107
  store i32 %call, i32* %listenSocket, align 4, !dbg !109
  %0 = load i32, i32* %listenSocket, align 4, !dbg !110
  %cmp = icmp eq i32 %0, -1, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !114

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !116
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !117
  store i16 2, i16* %sin_family, align 4, !dbg !118
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !119
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !120
  store i32 0, i32* %s_addr, align 4, !dbg !121
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !122
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !123
  store i16 %call1, i16* %sin_port, align 2, !dbg !124
  %2 = load i32, i32* %listenSocket, align 4, !dbg !125
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !127
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !128
  %cmp3 = icmp eq i32 %call2, -1, !dbg !129
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !130

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !131

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !133
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !135
  %cmp7 = icmp eq i32 %call6, -1, !dbg !136
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !137

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !138

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !141
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !142
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !143
  %cmp11 = icmp eq i32 %6, -1, !dbg !145
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !146

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !147

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !149
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !150
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !151
  %conv = trunc i64 %call14 to i32, !dbg !151
  store i32 %conv, i32* %recvResult, align 4, !dbg !152
  %8 = load i32, i32* %recvResult, align 4, !dbg !153
  %cmp15 = icmp eq i32 %8, -1, !dbg !155
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !156

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !157
  %cmp17 = icmp eq i32 %9, 0, !dbg !158
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !159

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !160

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !162
  %idxprom = sext i32 %10 to i64, !dbg !163
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !163
  store i8 0, i8* %arrayidx, align 1, !dbg !164
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !165
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !166
  store i32 %call22, i32* %data, align 4, !dbg !167
  br label %do.end, !dbg !168

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !169
  %cmp23 = icmp ne i32 %11, -1, !dbg !171
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !172

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !173
  %call26 = call i32 @close(i32 %12), !dbg !175
  br label %if.end27, !dbg !176

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !177
  %cmp28 = icmp ne i32 %13, -1, !dbg !179
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !180

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !181
  %call31 = call i32 @close(i32 %14), !dbg !183
  br label %if.end32, !dbg !184

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !185
  call void @badSink(i32 %15), !dbg !186
  ret void, !dbg !187
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
define internal void @badSink(i32 %data) #0 !dbg !188 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !191, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata i32* %i, metadata !193, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !196, metadata !DIExpression()), !dbg !200
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !200
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !200
  %1 = load i32, i32* %data.addr, align 4, !dbg !201
  %cmp = icmp slt i32 %1, 10, !dbg !203
  br i1 %cmp, label %if.then, label %if.else, !dbg !204

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !205
  %idxprom = sext i32 %2 to i64, !dbg !207
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !207
  store i32 1, i32* %arrayidx, align 4, !dbg !208
  store i32 0, i32* %i, align 4, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !212
  %cmp1 = icmp slt i32 %3, 10, !dbg !214
  br i1 %cmp1, label %for.body, label %for.end, !dbg !215

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !216
  %idxprom2 = sext i32 %4 to i64, !dbg !218
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !218
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !218
  call void @printIntLine(i32 %5), !dbg !219
  br label %for.inc, !dbg !220

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !221
  %inc = add nsw i32 %6, 1, !dbg !221
  store i32 %inc, i32* %i, align 4, !dbg !221
  br label %for.cond, !dbg !222, !llvm.loop !223

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !226

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !227
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !229
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_41_good() #0 !dbg !230 {
entry:
  call void @goodB2G(), !dbg !231
  call void @goodG2B(), !dbg !232
  ret void, !dbg !233
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !234 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !239, metadata !DIExpression()), !dbg !240
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !241, metadata !DIExpression()), !dbg !242
  %call = call i64 @time(i64* null) #7, !dbg !243
  %conv = trunc i64 %call to i32, !dbg !244
  call void @srand(i32 %conv) #7, !dbg !245
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !246
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_41_good(), !dbg !247
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !248
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !249
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_41_bad(), !dbg !250
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !251
  ret i32 0, !dbg !252
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !253 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !254, metadata !DIExpression()), !dbg !255
  store i32 -1, i32* %data, align 4, !dbg !256
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !257, metadata !DIExpression()), !dbg !259
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
  %15 = load i32, i32* %data, align 4, !dbg !347
  call void @goodB2GSink(i32 %15), !dbg !348
  ret void, !dbg !349
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !350 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !351, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.declare(metadata i32* %i, metadata !353, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !356, metadata !DIExpression()), !dbg !357
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !357
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !357
  %1 = load i32, i32* %data.addr, align 4, !dbg !358
  %cmp = icmp sge i32 %1, 0, !dbg !360
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !361

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !362
  %cmp1 = icmp slt i32 %2, 10, !dbg !363
  br i1 %cmp1, label %if.then, label %if.else, !dbg !364

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !365
  %idxprom = sext i32 %3 to i64, !dbg !367
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !367
  store i32 1, i32* %arrayidx, align 4, !dbg !368
  store i32 0, i32* %i, align 4, !dbg !369
  br label %for.cond, !dbg !371

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !372
  %cmp2 = icmp slt i32 %4, 10, !dbg !374
  br i1 %cmp2, label %for.body, label %for.end, !dbg !375

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !376
  %idxprom3 = sext i32 %5 to i64, !dbg !378
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !378
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !378
  call void @printIntLine(i32 %6), !dbg !379
  br label %for.inc, !dbg !380

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !381
  %inc = add nsw i32 %7, 1, !dbg !381
  store i32 %inc, i32* %i, align 4, !dbg !381
  br label %for.cond, !dbg !382, !llvm.loop !383

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !385

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !386
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !388
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !389 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !390, metadata !DIExpression()), !dbg !391
  store i32 -1, i32* %data, align 4, !dbg !392
  store i32 7, i32* %data, align 4, !dbg !393
  %0 = load i32, i32* %data, align 4, !dbg !394
  call void @goodG2BSink(i32 %0), !dbg !395
  ret void, !dbg !396
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !397 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !398, metadata !DIExpression()), !dbg !399
  call void @llvm.dbg.declare(metadata i32* %i, metadata !400, metadata !DIExpression()), !dbg !402
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !403, metadata !DIExpression()), !dbg !404
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !404
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !404
  %1 = load i32, i32* %data.addr, align 4, !dbg !405
  %cmp = icmp slt i32 %1, 10, !dbg !407
  br i1 %cmp, label %if.then, label %if.else, !dbg !408

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !409
  %idxprom = sext i32 %2 to i64, !dbg !411
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !411
  store i32 1, i32* %arrayidx, align 4, !dbg !412
  store i32 0, i32* %i, align 4, !dbg !413
  br label %for.cond, !dbg !415

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !416
  %cmp1 = icmp slt i32 %3, 10, !dbg !418
  br i1 %cmp1, label %for.body, label %for.end, !dbg !419

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !420
  %idxprom2 = sext i32 %4 to i64, !dbg !422
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !422
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !422
  call void @printIntLine(i32 %5), !dbg !423
  br label %for.inc, !dbg !424

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !425
  %inc = add nsw i32 %6, 1, !dbg !425
  store i32 %inc, i32* %i, align 4, !dbg !425
  br label %for.cond, !dbg !426, !llvm.loop !427

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !429

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !430
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !432
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_41_bad", scope: !71, file: !71, line: 67, type: !72, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_41.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 69, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 69, column: 9, scope: !70)
!78 = !DILocation(line: 71, column: 10, scope: !70)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !71, line: 77, type: !76)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 72, column: 5)
!81 = !DILocation(line: 77, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !71, line: 78, type: !83)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !84)
!84 = !{!85, !86, !90, !94}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !83, file: !17, line: 240, baseType: !56, size: 16)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !83, file: !17, line: 241, baseType: !87, size: 16, offset: 16)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !83, file: !17, line: 242, baseType: !91, size: 32, offset: 32)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !92)
!92 = !{!93}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !91, file: !17, line: 33, baseType: !46, size: 32)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !83, file: !17, line: 245, baseType: !95, size: 64, offset: 64)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 64, elements: !97)
!96 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!97 = !{!98}
!98 = !DISubrange(count: 8)
!99 = !DILocation(line: 78, column: 28, scope: !80)
!100 = !DILocalVariable(name: "listenSocket", scope: !80, file: !71, line: 79, type: !76)
!101 = !DILocation(line: 79, column: 16, scope: !80)
!102 = !DILocalVariable(name: "acceptSocket", scope: !80, file: !71, line: 80, type: !76)
!103 = !DILocation(line: 80, column: 16, scope: !80)
!104 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !71, line: 81, type: !60)
!105 = !DILocation(line: 81, column: 14, scope: !80)
!106 = !DILocation(line: 82, column: 9, scope: !80)
!107 = !DILocation(line: 92, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !80, file: !71, line: 83, column: 9)
!109 = !DILocation(line: 92, column: 26, scope: !108)
!110 = !DILocation(line: 93, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !71, line: 93, column: 17)
!112 = !DILocation(line: 93, column: 30, scope: !111)
!113 = !DILocation(line: 93, column: 17, scope: !108)
!114 = !DILocation(line: 95, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !71, line: 94, column: 13)
!116 = !DILocation(line: 97, column: 13, scope: !108)
!117 = !DILocation(line: 98, column: 21, scope: !108)
!118 = !DILocation(line: 98, column: 32, scope: !108)
!119 = !DILocation(line: 99, column: 21, scope: !108)
!120 = !DILocation(line: 99, column: 30, scope: !108)
!121 = !DILocation(line: 99, column: 37, scope: !108)
!122 = !DILocation(line: 100, column: 32, scope: !108)
!123 = !DILocation(line: 100, column: 21, scope: !108)
!124 = !DILocation(line: 100, column: 30, scope: !108)
!125 = !DILocation(line: 101, column: 22, scope: !126)
!126 = distinct !DILexicalBlock(scope: !108, file: !71, line: 101, column: 17)
!127 = !DILocation(line: 101, column: 36, scope: !126)
!128 = !DILocation(line: 101, column: 17, scope: !126)
!129 = !DILocation(line: 101, column: 81, scope: !126)
!130 = !DILocation(line: 101, column: 17, scope: !108)
!131 = !DILocation(line: 103, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !71, line: 102, column: 13)
!133 = !DILocation(line: 105, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !108, file: !71, line: 105, column: 17)
!135 = !DILocation(line: 105, column: 17, scope: !134)
!136 = !DILocation(line: 105, column: 54, scope: !134)
!137 = !DILocation(line: 105, column: 17, scope: !108)
!138 = !DILocation(line: 107, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !71, line: 106, column: 13)
!140 = !DILocation(line: 109, column: 35, scope: !108)
!141 = !DILocation(line: 109, column: 28, scope: !108)
!142 = !DILocation(line: 109, column: 26, scope: !108)
!143 = !DILocation(line: 110, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !108, file: !71, line: 110, column: 17)
!145 = !DILocation(line: 110, column: 30, scope: !144)
!146 = !DILocation(line: 110, column: 17, scope: !108)
!147 = !DILocation(line: 112, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !71, line: 111, column: 13)
!149 = !DILocation(line: 115, column: 31, scope: !108)
!150 = !DILocation(line: 115, column: 45, scope: !108)
!151 = !DILocation(line: 115, column: 26, scope: !108)
!152 = !DILocation(line: 115, column: 24, scope: !108)
!153 = !DILocation(line: 116, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !108, file: !71, line: 116, column: 17)
!155 = !DILocation(line: 116, column: 28, scope: !154)
!156 = !DILocation(line: 116, column: 44, scope: !154)
!157 = !DILocation(line: 116, column: 47, scope: !154)
!158 = !DILocation(line: 116, column: 58, scope: !154)
!159 = !DILocation(line: 116, column: 17, scope: !108)
!160 = !DILocation(line: 118, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !71, line: 117, column: 13)
!162 = !DILocation(line: 121, column: 25, scope: !108)
!163 = !DILocation(line: 121, column: 13, scope: !108)
!164 = !DILocation(line: 121, column: 37, scope: !108)
!165 = !DILocation(line: 123, column: 25, scope: !108)
!166 = !DILocation(line: 123, column: 20, scope: !108)
!167 = !DILocation(line: 123, column: 18, scope: !108)
!168 = !DILocation(line: 124, column: 9, scope: !108)
!169 = !DILocation(line: 126, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !80, file: !71, line: 126, column: 13)
!171 = !DILocation(line: 126, column: 26, scope: !170)
!172 = !DILocation(line: 126, column: 13, scope: !80)
!173 = !DILocation(line: 128, column: 26, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !71, line: 127, column: 9)
!175 = !DILocation(line: 128, column: 13, scope: !174)
!176 = !DILocation(line: 129, column: 9, scope: !174)
!177 = !DILocation(line: 130, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !80, file: !71, line: 130, column: 13)
!179 = !DILocation(line: 130, column: 26, scope: !178)
!180 = !DILocation(line: 130, column: 13, scope: !80)
!181 = !DILocation(line: 132, column: 26, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !71, line: 131, column: 9)
!183 = !DILocation(line: 132, column: 13, scope: !182)
!184 = !DILocation(line: 133, column: 9, scope: !182)
!185 = !DILocation(line: 141, column: 13, scope: !70)
!186 = !DILocation(line: 141, column: 5, scope: !70)
!187 = !DILocation(line: 142, column: 1, scope: !70)
!188 = distinct !DISubprogram(name: "badSink", scope: !71, file: !71, line: 44, type: !189, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!189 = !DISubroutineType(types: !190)
!190 = !{null, !76}
!191 = !DILocalVariable(name: "data", arg: 1, scope: !188, file: !71, line: 44, type: !76)
!192 = !DILocation(line: 44, column: 25, scope: !188)
!193 = !DILocalVariable(name: "i", scope: !194, file: !71, line: 47, type: !76)
!194 = distinct !DILexicalBlock(scope: !188, file: !71, line: 46, column: 5)
!195 = !DILocation(line: 47, column: 13, scope: !194)
!196 = !DILocalVariable(name: "buffer", scope: !194, file: !71, line: 48, type: !197)
!197 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !198)
!198 = !{!199}
!199 = !DISubrange(count: 10)
!200 = !DILocation(line: 48, column: 13, scope: !194)
!201 = !DILocation(line: 51, column: 13, scope: !202)
!202 = distinct !DILexicalBlock(scope: !194, file: !71, line: 51, column: 13)
!203 = !DILocation(line: 51, column: 18, scope: !202)
!204 = !DILocation(line: 51, column: 13, scope: !194)
!205 = !DILocation(line: 53, column: 20, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !71, line: 52, column: 9)
!207 = !DILocation(line: 53, column: 13, scope: !206)
!208 = !DILocation(line: 53, column: 26, scope: !206)
!209 = !DILocation(line: 55, column: 19, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !71, line: 55, column: 13)
!211 = !DILocation(line: 55, column: 17, scope: !210)
!212 = !DILocation(line: 55, column: 24, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !71, line: 55, column: 13)
!214 = !DILocation(line: 55, column: 26, scope: !213)
!215 = !DILocation(line: 55, column: 13, scope: !210)
!216 = !DILocation(line: 57, column: 37, scope: !217)
!217 = distinct !DILexicalBlock(scope: !213, file: !71, line: 56, column: 13)
!218 = !DILocation(line: 57, column: 30, scope: !217)
!219 = !DILocation(line: 57, column: 17, scope: !217)
!220 = !DILocation(line: 58, column: 13, scope: !217)
!221 = !DILocation(line: 55, column: 33, scope: !213)
!222 = !DILocation(line: 55, column: 13, scope: !213)
!223 = distinct !{!223, !215, !224, !225}
!224 = !DILocation(line: 58, column: 13, scope: !210)
!225 = !{!"llvm.loop.mustprogress"}
!226 = !DILocation(line: 59, column: 9, scope: !206)
!227 = !DILocation(line: 62, column: 13, scope: !228)
!228 = distinct !DILexicalBlock(scope: !202, file: !71, line: 61, column: 9)
!229 = !DILocation(line: 65, column: 1, scope: !188)
!230 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_41_good", scope: !71, file: !71, line: 283, type: !72, scopeLine: 284, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!231 = !DILocation(line: 285, column: 5, scope: !230)
!232 = !DILocation(line: 286, column: 5, scope: !230)
!233 = !DILocation(line: 287, column: 1, scope: !230)
!234 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 298, type: !235, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!235 = !DISubroutineType(types: !236)
!236 = !{!76, !76, !237}
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64)
!238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!239 = !DILocalVariable(name: "argc", arg: 1, scope: !234, file: !71, line: 298, type: !76)
!240 = !DILocation(line: 298, column: 14, scope: !234)
!241 = !DILocalVariable(name: "argv", arg: 2, scope: !234, file: !71, line: 298, type: !237)
!242 = !DILocation(line: 298, column: 27, scope: !234)
!243 = !DILocation(line: 301, column: 22, scope: !234)
!244 = !DILocation(line: 301, column: 12, scope: !234)
!245 = !DILocation(line: 301, column: 5, scope: !234)
!246 = !DILocation(line: 303, column: 5, scope: !234)
!247 = !DILocation(line: 304, column: 5, scope: !234)
!248 = !DILocation(line: 305, column: 5, scope: !234)
!249 = !DILocation(line: 308, column: 5, scope: !234)
!250 = !DILocation(line: 309, column: 5, scope: !234)
!251 = !DILocation(line: 310, column: 5, scope: !234)
!252 = !DILocation(line: 312, column: 5, scope: !234)
!253 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 206, type: !72, scopeLine: 207, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!254 = !DILocalVariable(name: "data", scope: !253, file: !71, line: 208, type: !76)
!255 = !DILocation(line: 208, column: 9, scope: !253)
!256 = !DILocation(line: 210, column: 10, scope: !253)
!257 = !DILocalVariable(name: "recvResult", scope: !258, file: !71, line: 216, type: !76)
!258 = distinct !DILexicalBlock(scope: !253, file: !71, line: 211, column: 5)
!259 = !DILocation(line: 216, column: 13, scope: !258)
!260 = !DILocalVariable(name: "service", scope: !258, file: !71, line: 217, type: !83)
!261 = !DILocation(line: 217, column: 28, scope: !258)
!262 = !DILocalVariable(name: "listenSocket", scope: !258, file: !71, line: 218, type: !76)
!263 = !DILocation(line: 218, column: 16, scope: !258)
!264 = !DILocalVariable(name: "acceptSocket", scope: !258, file: !71, line: 219, type: !76)
!265 = !DILocation(line: 219, column: 16, scope: !258)
!266 = !DILocalVariable(name: "inputBuffer", scope: !258, file: !71, line: 220, type: !60)
!267 = !DILocation(line: 220, column: 14, scope: !258)
!268 = !DILocation(line: 221, column: 9, scope: !258)
!269 = !DILocation(line: 231, column: 28, scope: !270)
!270 = distinct !DILexicalBlock(scope: !258, file: !71, line: 222, column: 9)
!271 = !DILocation(line: 231, column: 26, scope: !270)
!272 = !DILocation(line: 232, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !71, line: 232, column: 17)
!274 = !DILocation(line: 232, column: 30, scope: !273)
!275 = !DILocation(line: 232, column: 17, scope: !270)
!276 = !DILocation(line: 234, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !71, line: 233, column: 13)
!278 = !DILocation(line: 236, column: 13, scope: !270)
!279 = !DILocation(line: 237, column: 21, scope: !270)
!280 = !DILocation(line: 237, column: 32, scope: !270)
!281 = !DILocation(line: 238, column: 21, scope: !270)
!282 = !DILocation(line: 238, column: 30, scope: !270)
!283 = !DILocation(line: 238, column: 37, scope: !270)
!284 = !DILocation(line: 239, column: 32, scope: !270)
!285 = !DILocation(line: 239, column: 21, scope: !270)
!286 = !DILocation(line: 239, column: 30, scope: !270)
!287 = !DILocation(line: 240, column: 22, scope: !288)
!288 = distinct !DILexicalBlock(scope: !270, file: !71, line: 240, column: 17)
!289 = !DILocation(line: 240, column: 36, scope: !288)
!290 = !DILocation(line: 240, column: 17, scope: !288)
!291 = !DILocation(line: 240, column: 81, scope: !288)
!292 = !DILocation(line: 240, column: 17, scope: !270)
!293 = !DILocation(line: 242, column: 17, scope: !294)
!294 = distinct !DILexicalBlock(scope: !288, file: !71, line: 241, column: 13)
!295 = !DILocation(line: 244, column: 24, scope: !296)
!296 = distinct !DILexicalBlock(scope: !270, file: !71, line: 244, column: 17)
!297 = !DILocation(line: 244, column: 17, scope: !296)
!298 = !DILocation(line: 244, column: 54, scope: !296)
!299 = !DILocation(line: 244, column: 17, scope: !270)
!300 = !DILocation(line: 246, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !296, file: !71, line: 245, column: 13)
!302 = !DILocation(line: 248, column: 35, scope: !270)
!303 = !DILocation(line: 248, column: 28, scope: !270)
!304 = !DILocation(line: 248, column: 26, scope: !270)
!305 = !DILocation(line: 249, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !270, file: !71, line: 249, column: 17)
!307 = !DILocation(line: 249, column: 30, scope: !306)
!308 = !DILocation(line: 249, column: 17, scope: !270)
!309 = !DILocation(line: 251, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !71, line: 250, column: 13)
!311 = !DILocation(line: 254, column: 31, scope: !270)
!312 = !DILocation(line: 254, column: 45, scope: !270)
!313 = !DILocation(line: 254, column: 26, scope: !270)
!314 = !DILocation(line: 254, column: 24, scope: !270)
!315 = !DILocation(line: 255, column: 17, scope: !316)
!316 = distinct !DILexicalBlock(scope: !270, file: !71, line: 255, column: 17)
!317 = !DILocation(line: 255, column: 28, scope: !316)
!318 = !DILocation(line: 255, column: 44, scope: !316)
!319 = !DILocation(line: 255, column: 47, scope: !316)
!320 = !DILocation(line: 255, column: 58, scope: !316)
!321 = !DILocation(line: 255, column: 17, scope: !270)
!322 = !DILocation(line: 257, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !316, file: !71, line: 256, column: 13)
!324 = !DILocation(line: 260, column: 25, scope: !270)
!325 = !DILocation(line: 260, column: 13, scope: !270)
!326 = !DILocation(line: 260, column: 37, scope: !270)
!327 = !DILocation(line: 262, column: 25, scope: !270)
!328 = !DILocation(line: 262, column: 20, scope: !270)
!329 = !DILocation(line: 262, column: 18, scope: !270)
!330 = !DILocation(line: 263, column: 9, scope: !270)
!331 = !DILocation(line: 265, column: 13, scope: !332)
!332 = distinct !DILexicalBlock(scope: !258, file: !71, line: 265, column: 13)
!333 = !DILocation(line: 265, column: 26, scope: !332)
!334 = !DILocation(line: 265, column: 13, scope: !258)
!335 = !DILocation(line: 267, column: 26, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !71, line: 266, column: 9)
!337 = !DILocation(line: 267, column: 13, scope: !336)
!338 = !DILocation(line: 268, column: 9, scope: !336)
!339 = !DILocation(line: 269, column: 13, scope: !340)
!340 = distinct !DILexicalBlock(scope: !258, file: !71, line: 269, column: 13)
!341 = !DILocation(line: 269, column: 26, scope: !340)
!342 = !DILocation(line: 269, column: 13, scope: !258)
!343 = !DILocation(line: 271, column: 26, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !71, line: 270, column: 9)
!345 = !DILocation(line: 271, column: 13, scope: !344)
!346 = !DILocation(line: 272, column: 9, scope: !344)
!347 = !DILocation(line: 280, column: 17, scope: !253)
!348 = !DILocation(line: 280, column: 5, scope: !253)
!349 = !DILocation(line: 281, column: 1, scope: !253)
!350 = distinct !DISubprogram(name: "goodB2GSink", scope: !71, file: !71, line: 184, type: !189, scopeLine: 185, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!351 = !DILocalVariable(name: "data", arg: 1, scope: !350, file: !71, line: 184, type: !76)
!352 = !DILocation(line: 184, column: 29, scope: !350)
!353 = !DILocalVariable(name: "i", scope: !354, file: !71, line: 187, type: !76)
!354 = distinct !DILexicalBlock(scope: !350, file: !71, line: 186, column: 5)
!355 = !DILocation(line: 187, column: 13, scope: !354)
!356 = !DILocalVariable(name: "buffer", scope: !354, file: !71, line: 188, type: !197)
!357 = !DILocation(line: 188, column: 13, scope: !354)
!358 = !DILocation(line: 190, column: 13, scope: !359)
!359 = distinct !DILexicalBlock(scope: !354, file: !71, line: 190, column: 13)
!360 = !DILocation(line: 190, column: 18, scope: !359)
!361 = !DILocation(line: 190, column: 23, scope: !359)
!362 = !DILocation(line: 190, column: 26, scope: !359)
!363 = !DILocation(line: 190, column: 31, scope: !359)
!364 = !DILocation(line: 190, column: 13, scope: !354)
!365 = !DILocation(line: 192, column: 20, scope: !366)
!366 = distinct !DILexicalBlock(scope: !359, file: !71, line: 191, column: 9)
!367 = !DILocation(line: 192, column: 13, scope: !366)
!368 = !DILocation(line: 192, column: 26, scope: !366)
!369 = !DILocation(line: 194, column: 19, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !71, line: 194, column: 13)
!371 = !DILocation(line: 194, column: 17, scope: !370)
!372 = !DILocation(line: 194, column: 24, scope: !373)
!373 = distinct !DILexicalBlock(scope: !370, file: !71, line: 194, column: 13)
!374 = !DILocation(line: 194, column: 26, scope: !373)
!375 = !DILocation(line: 194, column: 13, scope: !370)
!376 = !DILocation(line: 196, column: 37, scope: !377)
!377 = distinct !DILexicalBlock(scope: !373, file: !71, line: 195, column: 13)
!378 = !DILocation(line: 196, column: 30, scope: !377)
!379 = !DILocation(line: 196, column: 17, scope: !377)
!380 = !DILocation(line: 197, column: 13, scope: !377)
!381 = !DILocation(line: 194, column: 33, scope: !373)
!382 = !DILocation(line: 194, column: 13, scope: !373)
!383 = distinct !{!383, !375, !384, !225}
!384 = !DILocation(line: 197, column: 13, scope: !370)
!385 = !DILocation(line: 198, column: 9, scope: !366)
!386 = !DILocation(line: 201, column: 13, scope: !387)
!387 = distinct !DILexicalBlock(scope: !359, file: !71, line: 200, column: 9)
!388 = !DILocation(line: 204, column: 1, scope: !350)
!389 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 172, type: !72, scopeLine: 173, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!390 = !DILocalVariable(name: "data", scope: !389, file: !71, line: 174, type: !76)
!391 = !DILocation(line: 174, column: 9, scope: !389)
!392 = !DILocation(line: 176, column: 10, scope: !389)
!393 = !DILocation(line: 179, column: 10, scope: !389)
!394 = !DILocation(line: 180, column: 17, scope: !389)
!395 = !DILocation(line: 180, column: 5, scope: !389)
!396 = !DILocation(line: 181, column: 1, scope: !389)
!397 = distinct !DISubprogram(name: "goodG2BSink", scope: !71, file: !71, line: 149, type: !189, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!398 = !DILocalVariable(name: "data", arg: 1, scope: !397, file: !71, line: 149, type: !76)
!399 = !DILocation(line: 149, column: 29, scope: !397)
!400 = !DILocalVariable(name: "i", scope: !401, file: !71, line: 152, type: !76)
!401 = distinct !DILexicalBlock(scope: !397, file: !71, line: 151, column: 5)
!402 = !DILocation(line: 152, column: 13, scope: !401)
!403 = !DILocalVariable(name: "buffer", scope: !401, file: !71, line: 153, type: !197)
!404 = !DILocation(line: 153, column: 13, scope: !401)
!405 = !DILocation(line: 156, column: 13, scope: !406)
!406 = distinct !DILexicalBlock(scope: !401, file: !71, line: 156, column: 13)
!407 = !DILocation(line: 156, column: 18, scope: !406)
!408 = !DILocation(line: 156, column: 13, scope: !401)
!409 = !DILocation(line: 158, column: 20, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !71, line: 157, column: 9)
!411 = !DILocation(line: 158, column: 13, scope: !410)
!412 = !DILocation(line: 158, column: 26, scope: !410)
!413 = !DILocation(line: 160, column: 19, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !71, line: 160, column: 13)
!415 = !DILocation(line: 160, column: 17, scope: !414)
!416 = !DILocation(line: 160, column: 24, scope: !417)
!417 = distinct !DILexicalBlock(scope: !414, file: !71, line: 160, column: 13)
!418 = !DILocation(line: 160, column: 26, scope: !417)
!419 = !DILocation(line: 160, column: 13, scope: !414)
!420 = !DILocation(line: 162, column: 37, scope: !421)
!421 = distinct !DILexicalBlock(scope: !417, file: !71, line: 161, column: 13)
!422 = !DILocation(line: 162, column: 30, scope: !421)
!423 = !DILocation(line: 162, column: 17, scope: !421)
!424 = !DILocation(line: 163, column: 13, scope: !421)
!425 = !DILocation(line: 160, column: 33, scope: !417)
!426 = !DILocation(line: 160, column: 13, scope: !417)
!427 = distinct !{!427, !419, !428, !225}
!428 = !DILocation(line: 163, column: 13, scope: !414)
!429 = !DILocation(line: 164, column: 9, scope: !410)
!430 = !DILocation(line: 167, column: 13, scope: !431)
!431 = distinct !DILexicalBlock(scope: !406, file: !71, line: 166, column: 9)
!432 = !DILocation(line: 170, column: 1, scope: !397)
