; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_41_bad() #0 !dbg !70 {
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
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !191, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !193, metadata !DIExpression()), !dbg !198
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !198
  %1 = load i32, i32* %data.addr, align 4, !dbg !199
  %cmp = icmp sge i32 %1, 0, !dbg !201
  br i1 %cmp, label %if.then, label %if.else, !dbg !202

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !203
  %idxprom = sext i32 %2 to i64, !dbg !205
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !205
  %3 = load i32, i32* %arrayidx, align 4, !dbg !205
  call void @printIntLine(i32 %3), !dbg !206
  br label %if.end, !dbg !207

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !208
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !210
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_41_good() #0 !dbg !211 {
entry:
  call void @goodB2G(), !dbg !212
  call void @goodG2B(), !dbg !213
  ret void, !dbg !214
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !215 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !220, metadata !DIExpression()), !dbg !221
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !222, metadata !DIExpression()), !dbg !223
  %call = call i64 @time(i64* null) #7, !dbg !224
  %conv = trunc i64 %call to i32, !dbg !225
  call void @srand(i32 %conv) #7, !dbg !226
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !227
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_41_good(), !dbg !228
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !229
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !230
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_41_bad(), !dbg !231
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !232
  ret i32 0, !dbg !233
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

declare dso_local void @printIntLine(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !234 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !235, metadata !DIExpression()), !dbg !236
  store i32 -1, i32* %data, align 4, !dbg !237
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !238, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !241, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !243, metadata !DIExpression()), !dbg !244
  store i32 -1, i32* %listenSocket, align 4, !dbg !244
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !245, metadata !DIExpression()), !dbg !246
  store i32 -1, i32* %acceptSocket, align 4, !dbg !246
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !247, metadata !DIExpression()), !dbg !248
  br label %do.body, !dbg !249

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !250
  store i32 %call, i32* %listenSocket, align 4, !dbg !252
  %0 = load i32, i32* %listenSocket, align 4, !dbg !253
  %cmp = icmp eq i32 %0, -1, !dbg !255
  br i1 %cmp, label %if.then, label %if.end, !dbg !256

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !257

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !259
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !259
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !260
  store i16 2, i16* %sin_family, align 4, !dbg !261
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !262
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !263
  store i32 0, i32* %s_addr, align 4, !dbg !264
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !265
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !266
  store i16 %call1, i16* %sin_port, align 2, !dbg !267
  %2 = load i32, i32* %listenSocket, align 4, !dbg !268
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !270
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !271
  %cmp3 = icmp eq i32 %call2, -1, !dbg !272
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !273

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !274

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !276
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !278
  %cmp7 = icmp eq i32 %call6, -1, !dbg !279
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !280

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !281

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !283
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !284
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !285
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !286
  %cmp11 = icmp eq i32 %6, -1, !dbg !288
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !289

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !290

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !292
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !293
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !294
  %conv = trunc i64 %call14 to i32, !dbg !294
  store i32 %conv, i32* %recvResult, align 4, !dbg !295
  %8 = load i32, i32* %recvResult, align 4, !dbg !296
  %cmp15 = icmp eq i32 %8, -1, !dbg !298
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !299

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !300
  %cmp17 = icmp eq i32 %9, 0, !dbg !301
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !302

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !303

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !305
  %idxprom = sext i32 %10 to i64, !dbg !306
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !306
  store i8 0, i8* %arrayidx, align 1, !dbg !307
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !308
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !309
  store i32 %call22, i32* %data, align 4, !dbg !310
  br label %do.end, !dbg !311

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !312
  %cmp23 = icmp ne i32 %11, -1, !dbg !314
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !315

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !316
  %call26 = call i32 @close(i32 %12), !dbg !318
  br label %if.end27, !dbg !319

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !320
  %cmp28 = icmp ne i32 %13, -1, !dbg !322
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !323

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !324
  %call31 = call i32 @close(i32 %14), !dbg !326
  br label %if.end32, !dbg !327

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !328
  call void @goodB2GSink(i32 %15), !dbg !329
  ret void, !dbg !330
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2GSink(i32 %data) #0 !dbg !331 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !332, metadata !DIExpression()), !dbg !333
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !334, metadata !DIExpression()), !dbg !336
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !336
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !336
  %1 = load i32, i32* %data.addr, align 4, !dbg !337
  %cmp = icmp sge i32 %1, 0, !dbg !339
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !340

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !341
  %cmp1 = icmp slt i32 %2, 10, !dbg !342
  br i1 %cmp1, label %if.then, label %if.else, !dbg !343

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !344
  %idxprom = sext i32 %3 to i64, !dbg !346
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !346
  %4 = load i32, i32* %arrayidx, align 4, !dbg !346
  call void @printIntLine(i32 %4), !dbg !347
  br label %if.end, !dbg !348

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !349
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !351
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !352 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !353, metadata !DIExpression()), !dbg !354
  store i32 -1, i32* %data, align 4, !dbg !355
  store i32 7, i32* %data, align 4, !dbg !356
  %0 = load i32, i32* %data, align 4, !dbg !357
  call void @goodG2BSink(i32 %0), !dbg !358
  ret void, !dbg !359
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32 %data) #0 !dbg !360 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !361, metadata !DIExpression()), !dbg !362
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !363, metadata !DIExpression()), !dbg !365
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !365
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !365
  %1 = load i32, i32* %data.addr, align 4, !dbg !366
  %cmp = icmp sge i32 %1, 0, !dbg !368
  br i1 %cmp, label %if.then, label %if.else, !dbg !369

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !370
  %idxprom = sext i32 %2 to i64, !dbg !372
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !372
  %3 = load i32, i32* %arrayidx, align 4, !dbg !372
  call void @printIntLine(i32 %3), !dbg !373
  br label %if.end, !dbg !374

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !375
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !377
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_41_bad", scope: !71, file: !71, line: 61, type: !72, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_41.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 63, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 63, column: 9, scope: !70)
!78 = !DILocation(line: 65, column: 10, scope: !70)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !71, line: 71, type: !76)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 66, column: 5)
!81 = !DILocation(line: 71, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !71, line: 72, type: !83)
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
!99 = !DILocation(line: 72, column: 28, scope: !80)
!100 = !DILocalVariable(name: "listenSocket", scope: !80, file: !71, line: 73, type: !76)
!101 = !DILocation(line: 73, column: 16, scope: !80)
!102 = !DILocalVariable(name: "acceptSocket", scope: !80, file: !71, line: 74, type: !76)
!103 = !DILocation(line: 74, column: 16, scope: !80)
!104 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !71, line: 75, type: !60)
!105 = !DILocation(line: 75, column: 14, scope: !80)
!106 = !DILocation(line: 76, column: 9, scope: !80)
!107 = !DILocation(line: 86, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !80, file: !71, line: 77, column: 9)
!109 = !DILocation(line: 86, column: 26, scope: !108)
!110 = !DILocation(line: 87, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !71, line: 87, column: 17)
!112 = !DILocation(line: 87, column: 30, scope: !111)
!113 = !DILocation(line: 87, column: 17, scope: !108)
!114 = !DILocation(line: 89, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !71, line: 88, column: 13)
!116 = !DILocation(line: 91, column: 13, scope: !108)
!117 = !DILocation(line: 92, column: 21, scope: !108)
!118 = !DILocation(line: 92, column: 32, scope: !108)
!119 = !DILocation(line: 93, column: 21, scope: !108)
!120 = !DILocation(line: 93, column: 30, scope: !108)
!121 = !DILocation(line: 93, column: 37, scope: !108)
!122 = !DILocation(line: 94, column: 32, scope: !108)
!123 = !DILocation(line: 94, column: 21, scope: !108)
!124 = !DILocation(line: 94, column: 30, scope: !108)
!125 = !DILocation(line: 95, column: 22, scope: !126)
!126 = distinct !DILexicalBlock(scope: !108, file: !71, line: 95, column: 17)
!127 = !DILocation(line: 95, column: 36, scope: !126)
!128 = !DILocation(line: 95, column: 17, scope: !126)
!129 = !DILocation(line: 95, column: 81, scope: !126)
!130 = !DILocation(line: 95, column: 17, scope: !108)
!131 = !DILocation(line: 97, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !71, line: 96, column: 13)
!133 = !DILocation(line: 99, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !108, file: !71, line: 99, column: 17)
!135 = !DILocation(line: 99, column: 17, scope: !134)
!136 = !DILocation(line: 99, column: 54, scope: !134)
!137 = !DILocation(line: 99, column: 17, scope: !108)
!138 = !DILocation(line: 101, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !71, line: 100, column: 13)
!140 = !DILocation(line: 103, column: 35, scope: !108)
!141 = !DILocation(line: 103, column: 28, scope: !108)
!142 = !DILocation(line: 103, column: 26, scope: !108)
!143 = !DILocation(line: 104, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !108, file: !71, line: 104, column: 17)
!145 = !DILocation(line: 104, column: 30, scope: !144)
!146 = !DILocation(line: 104, column: 17, scope: !108)
!147 = !DILocation(line: 106, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !71, line: 105, column: 13)
!149 = !DILocation(line: 109, column: 31, scope: !108)
!150 = !DILocation(line: 109, column: 45, scope: !108)
!151 = !DILocation(line: 109, column: 26, scope: !108)
!152 = !DILocation(line: 109, column: 24, scope: !108)
!153 = !DILocation(line: 110, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !108, file: !71, line: 110, column: 17)
!155 = !DILocation(line: 110, column: 28, scope: !154)
!156 = !DILocation(line: 110, column: 44, scope: !154)
!157 = !DILocation(line: 110, column: 47, scope: !154)
!158 = !DILocation(line: 110, column: 58, scope: !154)
!159 = !DILocation(line: 110, column: 17, scope: !108)
!160 = !DILocation(line: 112, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !71, line: 111, column: 13)
!162 = !DILocation(line: 115, column: 25, scope: !108)
!163 = !DILocation(line: 115, column: 13, scope: !108)
!164 = !DILocation(line: 115, column: 37, scope: !108)
!165 = !DILocation(line: 117, column: 25, scope: !108)
!166 = !DILocation(line: 117, column: 20, scope: !108)
!167 = !DILocation(line: 117, column: 18, scope: !108)
!168 = !DILocation(line: 118, column: 9, scope: !108)
!169 = !DILocation(line: 120, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !80, file: !71, line: 120, column: 13)
!171 = !DILocation(line: 120, column: 26, scope: !170)
!172 = !DILocation(line: 120, column: 13, scope: !80)
!173 = !DILocation(line: 122, column: 26, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !71, line: 121, column: 9)
!175 = !DILocation(line: 122, column: 13, scope: !174)
!176 = !DILocation(line: 123, column: 9, scope: !174)
!177 = !DILocation(line: 124, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !80, file: !71, line: 124, column: 13)
!179 = !DILocation(line: 124, column: 26, scope: !178)
!180 = !DILocation(line: 124, column: 13, scope: !80)
!181 = !DILocation(line: 126, column: 26, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !71, line: 125, column: 9)
!183 = !DILocation(line: 126, column: 13, scope: !182)
!184 = !DILocation(line: 127, column: 9, scope: !182)
!185 = !DILocation(line: 135, column: 13, scope: !70)
!186 = !DILocation(line: 135, column: 5, scope: !70)
!187 = !DILocation(line: 136, column: 1, scope: !70)
!188 = distinct !DISubprogram(name: "badSink", scope: !71, file: !71, line: 44, type: !189, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!189 = !DISubroutineType(types: !190)
!190 = !{null, !76}
!191 = !DILocalVariable(name: "data", arg: 1, scope: !188, file: !71, line: 44, type: !76)
!192 = !DILocation(line: 44, column: 25, scope: !188)
!193 = !DILocalVariable(name: "buffer", scope: !194, file: !71, line: 47, type: !195)
!194 = distinct !DILexicalBlock(scope: !188, file: !71, line: 46, column: 5)
!195 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !196)
!196 = !{!197}
!197 = !DISubrange(count: 10)
!198 = !DILocation(line: 47, column: 13, scope: !194)
!199 = !DILocation(line: 50, column: 13, scope: !200)
!200 = distinct !DILexicalBlock(scope: !194, file: !71, line: 50, column: 13)
!201 = !DILocation(line: 50, column: 18, scope: !200)
!202 = !DILocation(line: 50, column: 13, scope: !194)
!203 = !DILocation(line: 52, column: 33, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !71, line: 51, column: 9)
!205 = !DILocation(line: 52, column: 26, scope: !204)
!206 = !DILocation(line: 52, column: 13, scope: !204)
!207 = !DILocation(line: 53, column: 9, scope: !204)
!208 = !DILocation(line: 56, column: 13, scope: !209)
!209 = distinct !DILexicalBlock(scope: !200, file: !71, line: 55, column: 9)
!210 = !DILocation(line: 59, column: 1, scope: !188)
!211 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_41_good", scope: !71, file: !71, line: 265, type: !72, scopeLine: 266, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!212 = !DILocation(line: 267, column: 5, scope: !211)
!213 = !DILocation(line: 268, column: 5, scope: !211)
!214 = !DILocation(line: 269, column: 1, scope: !211)
!215 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 280, type: !216, scopeLine: 281, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!216 = !DISubroutineType(types: !217)
!217 = !{!76, !76, !218}
!218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !219, size: 64)
!219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!220 = !DILocalVariable(name: "argc", arg: 1, scope: !215, file: !71, line: 280, type: !76)
!221 = !DILocation(line: 280, column: 14, scope: !215)
!222 = !DILocalVariable(name: "argv", arg: 2, scope: !215, file: !71, line: 280, type: !218)
!223 = !DILocation(line: 280, column: 27, scope: !215)
!224 = !DILocation(line: 283, column: 22, scope: !215)
!225 = !DILocation(line: 283, column: 12, scope: !215)
!226 = !DILocation(line: 283, column: 5, scope: !215)
!227 = !DILocation(line: 285, column: 5, scope: !215)
!228 = !DILocation(line: 286, column: 5, scope: !215)
!229 = !DILocation(line: 287, column: 5, scope: !215)
!230 = !DILocation(line: 290, column: 5, scope: !215)
!231 = !DILocation(line: 291, column: 5, scope: !215)
!232 = !DILocation(line: 292, column: 5, scope: !215)
!233 = !DILocation(line: 294, column: 5, scope: !215)
!234 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 188, type: !72, scopeLine: 189, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!235 = !DILocalVariable(name: "data", scope: !234, file: !71, line: 190, type: !76)
!236 = !DILocation(line: 190, column: 9, scope: !234)
!237 = !DILocation(line: 192, column: 10, scope: !234)
!238 = !DILocalVariable(name: "recvResult", scope: !239, file: !71, line: 198, type: !76)
!239 = distinct !DILexicalBlock(scope: !234, file: !71, line: 193, column: 5)
!240 = !DILocation(line: 198, column: 13, scope: !239)
!241 = !DILocalVariable(name: "service", scope: !239, file: !71, line: 199, type: !83)
!242 = !DILocation(line: 199, column: 28, scope: !239)
!243 = !DILocalVariable(name: "listenSocket", scope: !239, file: !71, line: 200, type: !76)
!244 = !DILocation(line: 200, column: 16, scope: !239)
!245 = !DILocalVariable(name: "acceptSocket", scope: !239, file: !71, line: 201, type: !76)
!246 = !DILocation(line: 201, column: 16, scope: !239)
!247 = !DILocalVariable(name: "inputBuffer", scope: !239, file: !71, line: 202, type: !60)
!248 = !DILocation(line: 202, column: 14, scope: !239)
!249 = !DILocation(line: 203, column: 9, scope: !239)
!250 = !DILocation(line: 213, column: 28, scope: !251)
!251 = distinct !DILexicalBlock(scope: !239, file: !71, line: 204, column: 9)
!252 = !DILocation(line: 213, column: 26, scope: !251)
!253 = !DILocation(line: 214, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !71, line: 214, column: 17)
!255 = !DILocation(line: 214, column: 30, scope: !254)
!256 = !DILocation(line: 214, column: 17, scope: !251)
!257 = !DILocation(line: 216, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !71, line: 215, column: 13)
!259 = !DILocation(line: 218, column: 13, scope: !251)
!260 = !DILocation(line: 219, column: 21, scope: !251)
!261 = !DILocation(line: 219, column: 32, scope: !251)
!262 = !DILocation(line: 220, column: 21, scope: !251)
!263 = !DILocation(line: 220, column: 30, scope: !251)
!264 = !DILocation(line: 220, column: 37, scope: !251)
!265 = !DILocation(line: 221, column: 32, scope: !251)
!266 = !DILocation(line: 221, column: 21, scope: !251)
!267 = !DILocation(line: 221, column: 30, scope: !251)
!268 = !DILocation(line: 222, column: 22, scope: !269)
!269 = distinct !DILexicalBlock(scope: !251, file: !71, line: 222, column: 17)
!270 = !DILocation(line: 222, column: 36, scope: !269)
!271 = !DILocation(line: 222, column: 17, scope: !269)
!272 = !DILocation(line: 222, column: 81, scope: !269)
!273 = !DILocation(line: 222, column: 17, scope: !251)
!274 = !DILocation(line: 224, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !71, line: 223, column: 13)
!276 = !DILocation(line: 226, column: 24, scope: !277)
!277 = distinct !DILexicalBlock(scope: !251, file: !71, line: 226, column: 17)
!278 = !DILocation(line: 226, column: 17, scope: !277)
!279 = !DILocation(line: 226, column: 54, scope: !277)
!280 = !DILocation(line: 226, column: 17, scope: !251)
!281 = !DILocation(line: 228, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !277, file: !71, line: 227, column: 13)
!283 = !DILocation(line: 230, column: 35, scope: !251)
!284 = !DILocation(line: 230, column: 28, scope: !251)
!285 = !DILocation(line: 230, column: 26, scope: !251)
!286 = !DILocation(line: 231, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !251, file: !71, line: 231, column: 17)
!288 = !DILocation(line: 231, column: 30, scope: !287)
!289 = !DILocation(line: 231, column: 17, scope: !251)
!290 = !DILocation(line: 233, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !71, line: 232, column: 13)
!292 = !DILocation(line: 236, column: 31, scope: !251)
!293 = !DILocation(line: 236, column: 45, scope: !251)
!294 = !DILocation(line: 236, column: 26, scope: !251)
!295 = !DILocation(line: 236, column: 24, scope: !251)
!296 = !DILocation(line: 237, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !251, file: !71, line: 237, column: 17)
!298 = !DILocation(line: 237, column: 28, scope: !297)
!299 = !DILocation(line: 237, column: 44, scope: !297)
!300 = !DILocation(line: 237, column: 47, scope: !297)
!301 = !DILocation(line: 237, column: 58, scope: !297)
!302 = !DILocation(line: 237, column: 17, scope: !251)
!303 = !DILocation(line: 239, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !297, file: !71, line: 238, column: 13)
!305 = !DILocation(line: 242, column: 25, scope: !251)
!306 = !DILocation(line: 242, column: 13, scope: !251)
!307 = !DILocation(line: 242, column: 37, scope: !251)
!308 = !DILocation(line: 244, column: 25, scope: !251)
!309 = !DILocation(line: 244, column: 20, scope: !251)
!310 = !DILocation(line: 244, column: 18, scope: !251)
!311 = !DILocation(line: 245, column: 9, scope: !251)
!312 = !DILocation(line: 247, column: 13, scope: !313)
!313 = distinct !DILexicalBlock(scope: !239, file: !71, line: 247, column: 13)
!314 = !DILocation(line: 247, column: 26, scope: !313)
!315 = !DILocation(line: 247, column: 13, scope: !239)
!316 = !DILocation(line: 249, column: 26, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !71, line: 248, column: 9)
!318 = !DILocation(line: 249, column: 13, scope: !317)
!319 = !DILocation(line: 250, column: 9, scope: !317)
!320 = !DILocation(line: 251, column: 13, scope: !321)
!321 = distinct !DILexicalBlock(scope: !239, file: !71, line: 251, column: 13)
!322 = !DILocation(line: 251, column: 26, scope: !321)
!323 = !DILocation(line: 251, column: 13, scope: !239)
!324 = !DILocation(line: 253, column: 26, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !71, line: 252, column: 9)
!326 = !DILocation(line: 253, column: 13, scope: !325)
!327 = !DILocation(line: 254, column: 9, scope: !325)
!328 = !DILocation(line: 262, column: 17, scope: !234)
!329 = !DILocation(line: 262, column: 5, scope: !234)
!330 = !DILocation(line: 263, column: 1, scope: !234)
!331 = distinct !DISubprogram(name: "goodB2GSink", scope: !71, file: !71, line: 172, type: !189, scopeLine: 173, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!332 = !DILocalVariable(name: "data", arg: 1, scope: !331, file: !71, line: 172, type: !76)
!333 = !DILocation(line: 172, column: 29, scope: !331)
!334 = !DILocalVariable(name: "buffer", scope: !335, file: !71, line: 175, type: !195)
!335 = distinct !DILexicalBlock(scope: !331, file: !71, line: 174, column: 5)
!336 = !DILocation(line: 175, column: 13, scope: !335)
!337 = !DILocation(line: 177, column: 13, scope: !338)
!338 = distinct !DILexicalBlock(scope: !335, file: !71, line: 177, column: 13)
!339 = !DILocation(line: 177, column: 18, scope: !338)
!340 = !DILocation(line: 177, column: 23, scope: !338)
!341 = !DILocation(line: 177, column: 26, scope: !338)
!342 = !DILocation(line: 177, column: 31, scope: !338)
!343 = !DILocation(line: 177, column: 13, scope: !335)
!344 = !DILocation(line: 179, column: 33, scope: !345)
!345 = distinct !DILexicalBlock(scope: !338, file: !71, line: 178, column: 9)
!346 = !DILocation(line: 179, column: 26, scope: !345)
!347 = !DILocation(line: 179, column: 13, scope: !345)
!348 = !DILocation(line: 180, column: 9, scope: !345)
!349 = !DILocation(line: 183, column: 13, scope: !350)
!350 = distinct !DILexicalBlock(scope: !338, file: !71, line: 182, column: 9)
!351 = !DILocation(line: 186, column: 1, scope: !331)
!352 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 160, type: !72, scopeLine: 161, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!353 = !DILocalVariable(name: "data", scope: !352, file: !71, line: 162, type: !76)
!354 = !DILocation(line: 162, column: 9, scope: !352)
!355 = !DILocation(line: 164, column: 10, scope: !352)
!356 = !DILocation(line: 167, column: 10, scope: !352)
!357 = !DILocation(line: 168, column: 17, scope: !352)
!358 = !DILocation(line: 168, column: 5, scope: !352)
!359 = !DILocation(line: 169, column: 1, scope: !352)
!360 = distinct !DISubprogram(name: "goodG2BSink", scope: !71, file: !71, line: 143, type: !189, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!361 = !DILocalVariable(name: "data", arg: 1, scope: !360, file: !71, line: 143, type: !76)
!362 = !DILocation(line: 143, column: 29, scope: !360)
!363 = !DILocalVariable(name: "buffer", scope: !364, file: !71, line: 146, type: !195)
!364 = distinct !DILexicalBlock(scope: !360, file: !71, line: 145, column: 5)
!365 = !DILocation(line: 146, column: 13, scope: !364)
!366 = !DILocation(line: 149, column: 13, scope: !367)
!367 = distinct !DILexicalBlock(scope: !364, file: !71, line: 149, column: 13)
!368 = !DILocation(line: 149, column: 18, scope: !367)
!369 = !DILocation(line: 149, column: 13, scope: !364)
!370 = !DILocation(line: 151, column: 33, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !71, line: 150, column: 9)
!372 = !DILocation(line: 151, column: 26, scope: !371)
!373 = !DILocation(line: 151, column: 13, scope: !371)
!374 = !DILocation(line: 152, column: 9, scope: !371)
!375 = !DILocation(line: 155, column: 13, scope: !376)
!376 = distinct !DILexicalBlock(scope: !367, file: !71, line: 154, column: 9)
!377 = !DILocation(line: 158, column: 1, scope: !360)
