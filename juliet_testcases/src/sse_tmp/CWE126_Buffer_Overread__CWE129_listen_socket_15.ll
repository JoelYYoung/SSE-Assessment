; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_15.c"
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
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_15_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
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
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !185, metadata !DIExpression()), !dbg !190
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !190
  %16 = load i32, i32* %data, align 4, !dbg !191
  %cmp33 = icmp sge i32 %16, 0, !dbg !193
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !194

if.then35:                                        ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !195
  %idxprom36 = sext i32 %17 to i64, !dbg !197
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !197
  %18 = load i32, i32* %arrayidx37, align 4, !dbg !197
  call void @printIntLine(i32 %18), !dbg !198
  br label %if.end38, !dbg !199

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !200
  br label %if.end38

if.end38:                                         ; preds = %if.else, %if.then35
  ret void, !dbg !202
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_15_good() #0 !dbg !203 {
entry:
  call void @goodB2G1(), !dbg !204
  call void @goodB2G2(), !dbg !205
  call void @goodG2B1(), !dbg !206
  call void @goodG2B2(), !dbg !207
  ret void, !dbg !208
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !209 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !214, metadata !DIExpression()), !dbg !215
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !216, metadata !DIExpression()), !dbg !217
  %call = call i64 @time(i64* null) #7, !dbg !218
  %conv = trunc i64 %call to i32, !dbg !219
  call void @srand(i32 %conv) #7, !dbg !220
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !221
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_15_good(), !dbg !222
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !223
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !224
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_15_bad(), !dbg !225
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !226
  ret i32 0, !dbg !227
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !228 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !229, metadata !DIExpression()), !dbg !230
  store i32 -1, i32* %data, align 4, !dbg !231
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !232, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 -1, i32* %listenSocket, align 4, !dbg !238
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !239, metadata !DIExpression()), !dbg !240
  store i32 -1, i32* %acceptSocket, align 4, !dbg !240
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !241, metadata !DIExpression()), !dbg !242
  br label %do.body, !dbg !243

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !244
  store i32 %call, i32* %listenSocket, align 4, !dbg !246
  %0 = load i32, i32* %listenSocket, align 4, !dbg !247
  %cmp = icmp eq i32 %0, -1, !dbg !249
  br i1 %cmp, label %if.then, label %if.end, !dbg !250

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !251

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !253
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !253
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !254
  store i16 2, i16* %sin_family, align 4, !dbg !255
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !256
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !257
  store i32 0, i32* %s_addr, align 4, !dbg !258
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !259
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !260
  store i16 %call1, i16* %sin_port, align 2, !dbg !261
  %2 = load i32, i32* %listenSocket, align 4, !dbg !262
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !264
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !265
  %cmp3 = icmp eq i32 %call2, -1, !dbg !266
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !267

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !268

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !270
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !272
  %cmp7 = icmp eq i32 %call6, -1, !dbg !273
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !274

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !275

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !277
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !278
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !279
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !280
  %cmp11 = icmp eq i32 %6, -1, !dbg !282
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !283

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !284

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !286
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !287
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !288
  %conv = trunc i64 %call14 to i32, !dbg !288
  store i32 %conv, i32* %recvResult, align 4, !dbg !289
  %8 = load i32, i32* %recvResult, align 4, !dbg !290
  %cmp15 = icmp eq i32 %8, -1, !dbg !292
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !293

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !294
  %cmp17 = icmp eq i32 %9, 0, !dbg !295
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !296

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !297

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !299
  %idxprom = sext i32 %10 to i64, !dbg !300
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !300
  store i8 0, i8* %arrayidx, align 1, !dbg !301
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !302
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !303
  store i32 %call22, i32* %data, align 4, !dbg !304
  br label %do.end, !dbg !305

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !306
  %cmp23 = icmp ne i32 %11, -1, !dbg !308
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !309

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !310
  %call26 = call i32 @close(i32 %12), !dbg !312
  br label %if.end27, !dbg !313

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !314
  %cmp28 = icmp ne i32 %13, -1, !dbg !316
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !317

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !318
  %call31 = call i32 @close(i32 %14), !dbg !320
  br label %if.end32, !dbg !321

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !322, metadata !DIExpression()), !dbg !324
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !324
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !324
  %16 = load i32, i32* %data, align 4, !dbg !325
  %cmp33 = icmp sge i32 %16, 0, !dbg !327
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !328

land.lhs.true:                                    ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !329
  %cmp35 = icmp slt i32 %17, 10, !dbg !330
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !331

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !332
  %idxprom38 = sext i32 %18 to i64, !dbg !334
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !334
  %19 = load i32, i32* %arrayidx39, align 4, !dbg !334
  call void @printIntLine(i32 %19), !dbg !335
  br label %if.end40, !dbg !336

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !337
  br label %if.end40

if.end40:                                         ; preds = %if.else, %if.then37
  ret void, !dbg !339
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !340 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !341, metadata !DIExpression()), !dbg !342
  store i32 -1, i32* %data, align 4, !dbg !343
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !344, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !347, metadata !DIExpression()), !dbg !348
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !349, metadata !DIExpression()), !dbg !350
  store i32 -1, i32* %listenSocket, align 4, !dbg !350
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !351, metadata !DIExpression()), !dbg !352
  store i32 -1, i32* %acceptSocket, align 4, !dbg !352
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !353, metadata !DIExpression()), !dbg !354
  br label %do.body, !dbg !355

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !356
  store i32 %call, i32* %listenSocket, align 4, !dbg !358
  %0 = load i32, i32* %listenSocket, align 4, !dbg !359
  %cmp = icmp eq i32 %0, -1, !dbg !361
  br i1 %cmp, label %if.then, label %if.end, !dbg !362

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !363

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !365
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !365
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !366
  store i16 2, i16* %sin_family, align 4, !dbg !367
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !368
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !369
  store i32 0, i32* %s_addr, align 4, !dbg !370
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !371
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !372
  store i16 %call1, i16* %sin_port, align 2, !dbg !373
  %2 = load i32, i32* %listenSocket, align 4, !dbg !374
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !376
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !377
  %cmp3 = icmp eq i32 %call2, -1, !dbg !378
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !379

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !380

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !382
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !384
  %cmp7 = icmp eq i32 %call6, -1, !dbg !385
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !386

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !387

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !389
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !390
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !391
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !392
  %cmp11 = icmp eq i32 %6, -1, !dbg !394
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !395

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !396

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !398
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !399
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !400
  %conv = trunc i64 %call14 to i32, !dbg !400
  store i32 %conv, i32* %recvResult, align 4, !dbg !401
  %8 = load i32, i32* %recvResult, align 4, !dbg !402
  %cmp15 = icmp eq i32 %8, -1, !dbg !404
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !405

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !406
  %cmp17 = icmp eq i32 %9, 0, !dbg !407
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !408

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !409

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !411
  %idxprom = sext i32 %10 to i64, !dbg !412
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !412
  store i8 0, i8* %arrayidx, align 1, !dbg !413
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !414
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !415
  store i32 %call22, i32* %data, align 4, !dbg !416
  br label %do.end, !dbg !417

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !418
  %cmp23 = icmp ne i32 %11, -1, !dbg !420
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !421

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !422
  %call26 = call i32 @close(i32 %12), !dbg !424
  br label %if.end27, !dbg !425

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !426
  %cmp28 = icmp ne i32 %13, -1, !dbg !428
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !429

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !430
  %call31 = call i32 @close(i32 %14), !dbg !432
  br label %if.end32, !dbg !433

if.end32:                                         ; preds = %if.then30, %if.end27
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !434, metadata !DIExpression()), !dbg !436
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !436
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !436
  %16 = load i32, i32* %data, align 4, !dbg !437
  %cmp33 = icmp sge i32 %16, 0, !dbg !439
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !440

land.lhs.true:                                    ; preds = %if.end32
  %17 = load i32, i32* %data, align 4, !dbg !441
  %cmp35 = icmp slt i32 %17, 10, !dbg !442
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !443

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !444
  %idxprom38 = sext i32 %18 to i64, !dbg !446
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !446
  %19 = load i32, i32* %arrayidx39, align 4, !dbg !446
  call void @printIntLine(i32 %19), !dbg !447
  br label %if.end40, !dbg !448

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !449
  br label %if.end40

if.end40:                                         ; preds = %if.else, %if.then37
  ret void, !dbg !451
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !452 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !453, metadata !DIExpression()), !dbg !454
  store i32 -1, i32* %data, align 4, !dbg !455
  store i32 7, i32* %data, align 4, !dbg !456
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !457, metadata !DIExpression()), !dbg !459
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !459
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !459
  %1 = load i32, i32* %data, align 4, !dbg !460
  %cmp = icmp sge i32 %1, 0, !dbg !462
  br i1 %cmp, label %if.then, label %if.else, !dbg !463

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !464
  %idxprom = sext i32 %2 to i64, !dbg !466
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !466
  %3 = load i32, i32* %arrayidx, align 4, !dbg !466
  call void @printIntLine(i32 %3), !dbg !467
  br label %if.end, !dbg !468

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !469
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !471
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !472 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !473, metadata !DIExpression()), !dbg !474
  store i32 -1, i32* %data, align 4, !dbg !475
  store i32 7, i32* %data, align 4, !dbg !476
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !477, metadata !DIExpression()), !dbg !479
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !479
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !479
  %1 = load i32, i32* %data, align 4, !dbg !480
  %cmp = icmp sge i32 %1, 0, !dbg !482
  br i1 %cmp, label %if.then, label %if.else, !dbg !483

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !484
  %idxprom = sext i32 %2 to i64, !dbg !486
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !486
  %3 = load i32, i32* %arrayidx, align 4, !dbg !486
  call void @printIntLine(i32 %3), !dbg !487
  br label %if.end, !dbg !488

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !489
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !491
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_15_bad", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_15.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 46, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 46, column: 9, scope: !70)
!78 = !DILocation(line: 48, column: 10, scope: !70)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !71, line: 57, type: !76)
!80 = distinct !DILexicalBlock(scope: !70, file: !71, line: 52, column: 5)
!81 = !DILocation(line: 57, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !71, line: 58, type: !83)
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
!99 = !DILocation(line: 58, column: 28, scope: !80)
!100 = !DILocalVariable(name: "listenSocket", scope: !80, file: !71, line: 59, type: !76)
!101 = !DILocation(line: 59, column: 16, scope: !80)
!102 = !DILocalVariable(name: "acceptSocket", scope: !80, file: !71, line: 60, type: !76)
!103 = !DILocation(line: 60, column: 16, scope: !80)
!104 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !71, line: 61, type: !60)
!105 = !DILocation(line: 61, column: 14, scope: !80)
!106 = !DILocation(line: 62, column: 9, scope: !80)
!107 = !DILocation(line: 72, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !80, file: !71, line: 63, column: 9)
!109 = !DILocation(line: 72, column: 26, scope: !108)
!110 = !DILocation(line: 73, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !71, line: 73, column: 17)
!112 = !DILocation(line: 73, column: 30, scope: !111)
!113 = !DILocation(line: 73, column: 17, scope: !108)
!114 = !DILocation(line: 75, column: 17, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !71, line: 74, column: 13)
!116 = !DILocation(line: 77, column: 13, scope: !108)
!117 = !DILocation(line: 78, column: 21, scope: !108)
!118 = !DILocation(line: 78, column: 32, scope: !108)
!119 = !DILocation(line: 79, column: 21, scope: !108)
!120 = !DILocation(line: 79, column: 30, scope: !108)
!121 = !DILocation(line: 79, column: 37, scope: !108)
!122 = !DILocation(line: 80, column: 32, scope: !108)
!123 = !DILocation(line: 80, column: 21, scope: !108)
!124 = !DILocation(line: 80, column: 30, scope: !108)
!125 = !DILocation(line: 81, column: 22, scope: !126)
!126 = distinct !DILexicalBlock(scope: !108, file: !71, line: 81, column: 17)
!127 = !DILocation(line: 81, column: 36, scope: !126)
!128 = !DILocation(line: 81, column: 17, scope: !126)
!129 = !DILocation(line: 81, column: 81, scope: !126)
!130 = !DILocation(line: 81, column: 17, scope: !108)
!131 = !DILocation(line: 83, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !126, file: !71, line: 82, column: 13)
!133 = !DILocation(line: 85, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !108, file: !71, line: 85, column: 17)
!135 = !DILocation(line: 85, column: 17, scope: !134)
!136 = !DILocation(line: 85, column: 54, scope: !134)
!137 = !DILocation(line: 85, column: 17, scope: !108)
!138 = !DILocation(line: 87, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !71, line: 86, column: 13)
!140 = !DILocation(line: 89, column: 35, scope: !108)
!141 = !DILocation(line: 89, column: 28, scope: !108)
!142 = !DILocation(line: 89, column: 26, scope: !108)
!143 = !DILocation(line: 90, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !108, file: !71, line: 90, column: 17)
!145 = !DILocation(line: 90, column: 30, scope: !144)
!146 = !DILocation(line: 90, column: 17, scope: !108)
!147 = !DILocation(line: 92, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !71, line: 91, column: 13)
!149 = !DILocation(line: 95, column: 31, scope: !108)
!150 = !DILocation(line: 95, column: 45, scope: !108)
!151 = !DILocation(line: 95, column: 26, scope: !108)
!152 = !DILocation(line: 95, column: 24, scope: !108)
!153 = !DILocation(line: 96, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !108, file: !71, line: 96, column: 17)
!155 = !DILocation(line: 96, column: 28, scope: !154)
!156 = !DILocation(line: 96, column: 44, scope: !154)
!157 = !DILocation(line: 96, column: 47, scope: !154)
!158 = !DILocation(line: 96, column: 58, scope: !154)
!159 = !DILocation(line: 96, column: 17, scope: !108)
!160 = !DILocation(line: 98, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !154, file: !71, line: 97, column: 13)
!162 = !DILocation(line: 101, column: 25, scope: !108)
!163 = !DILocation(line: 101, column: 13, scope: !108)
!164 = !DILocation(line: 101, column: 37, scope: !108)
!165 = !DILocation(line: 103, column: 25, scope: !108)
!166 = !DILocation(line: 103, column: 20, scope: !108)
!167 = !DILocation(line: 103, column: 18, scope: !108)
!168 = !DILocation(line: 104, column: 9, scope: !108)
!169 = !DILocation(line: 106, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !80, file: !71, line: 106, column: 13)
!171 = !DILocation(line: 106, column: 26, scope: !170)
!172 = !DILocation(line: 106, column: 13, scope: !80)
!173 = !DILocation(line: 108, column: 26, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !71, line: 107, column: 9)
!175 = !DILocation(line: 108, column: 13, scope: !174)
!176 = !DILocation(line: 109, column: 9, scope: !174)
!177 = !DILocation(line: 110, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !80, file: !71, line: 110, column: 13)
!179 = !DILocation(line: 110, column: 26, scope: !178)
!180 = !DILocation(line: 110, column: 13, scope: !80)
!181 = !DILocation(line: 112, column: 26, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !71, line: 111, column: 9)
!183 = !DILocation(line: 112, column: 13, scope: !182)
!184 = !DILocation(line: 113, column: 9, scope: !182)
!185 = !DILocalVariable(name: "buffer", scope: !186, file: !71, line: 131, type: !187)
!186 = distinct !DILexicalBlock(scope: !70, file: !71, line: 130, column: 5)
!187 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 320, elements: !188)
!188 = !{!189}
!189 = !DISubrange(count: 10)
!190 = !DILocation(line: 131, column: 13, scope: !186)
!191 = !DILocation(line: 134, column: 13, scope: !192)
!192 = distinct !DILexicalBlock(scope: !186, file: !71, line: 134, column: 13)
!193 = !DILocation(line: 134, column: 18, scope: !192)
!194 = !DILocation(line: 134, column: 13, scope: !186)
!195 = !DILocation(line: 136, column: 33, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !71, line: 135, column: 9)
!197 = !DILocation(line: 136, column: 26, scope: !196)
!198 = !DILocation(line: 136, column: 13, scope: !196)
!199 = !DILocation(line: 137, column: 9, scope: !196)
!200 = !DILocation(line: 140, column: 13, scope: !201)
!201 = distinct !DILexicalBlock(scope: !192, file: !71, line: 139, column: 9)
!202 = !DILocation(line: 149, column: 1, scope: !70)
!203 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_15_good", scope: !71, file: !71, line: 453, type: !72, scopeLine: 454, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!204 = !DILocation(line: 455, column: 5, scope: !203)
!205 = !DILocation(line: 456, column: 5, scope: !203)
!206 = !DILocation(line: 457, column: 5, scope: !203)
!207 = !DILocation(line: 458, column: 5, scope: !203)
!208 = !DILocation(line: 459, column: 1, scope: !203)
!209 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 470, type: !210, scopeLine: 471, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!210 = !DISubroutineType(types: !211)
!211 = !{!76, !76, !212}
!212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !213, size: 64)
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!214 = !DILocalVariable(name: "argc", arg: 1, scope: !209, file: !71, line: 470, type: !76)
!215 = !DILocation(line: 470, column: 14, scope: !209)
!216 = !DILocalVariable(name: "argv", arg: 2, scope: !209, file: !71, line: 470, type: !212)
!217 = !DILocation(line: 470, column: 27, scope: !209)
!218 = !DILocation(line: 473, column: 22, scope: !209)
!219 = !DILocation(line: 473, column: 12, scope: !209)
!220 = !DILocation(line: 473, column: 5, scope: !209)
!221 = !DILocation(line: 475, column: 5, scope: !209)
!222 = !DILocation(line: 476, column: 5, scope: !209)
!223 = !DILocation(line: 477, column: 5, scope: !209)
!224 = !DILocation(line: 480, column: 5, scope: !209)
!225 = !DILocation(line: 481, column: 5, scope: !209)
!226 = !DILocation(line: 482, column: 5, scope: !209)
!227 = !DILocation(line: 484, column: 5, scope: !209)
!228 = distinct !DISubprogram(name: "goodB2G1", scope: !71, file: !71, line: 156, type: !72, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!229 = !DILocalVariable(name: "data", scope: !228, file: !71, line: 158, type: !76)
!230 = !DILocation(line: 158, column: 9, scope: !228)
!231 = !DILocation(line: 160, column: 10, scope: !228)
!232 = !DILocalVariable(name: "recvResult", scope: !233, file: !71, line: 169, type: !76)
!233 = distinct !DILexicalBlock(scope: !228, file: !71, line: 164, column: 5)
!234 = !DILocation(line: 169, column: 13, scope: !233)
!235 = !DILocalVariable(name: "service", scope: !233, file: !71, line: 170, type: !83)
!236 = !DILocation(line: 170, column: 28, scope: !233)
!237 = !DILocalVariable(name: "listenSocket", scope: !233, file: !71, line: 171, type: !76)
!238 = !DILocation(line: 171, column: 16, scope: !233)
!239 = !DILocalVariable(name: "acceptSocket", scope: !233, file: !71, line: 172, type: !76)
!240 = !DILocation(line: 172, column: 16, scope: !233)
!241 = !DILocalVariable(name: "inputBuffer", scope: !233, file: !71, line: 173, type: !60)
!242 = !DILocation(line: 173, column: 14, scope: !233)
!243 = !DILocation(line: 174, column: 9, scope: !233)
!244 = !DILocation(line: 184, column: 28, scope: !245)
!245 = distinct !DILexicalBlock(scope: !233, file: !71, line: 175, column: 9)
!246 = !DILocation(line: 184, column: 26, scope: !245)
!247 = !DILocation(line: 185, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !71, line: 185, column: 17)
!249 = !DILocation(line: 185, column: 30, scope: !248)
!250 = !DILocation(line: 185, column: 17, scope: !245)
!251 = !DILocation(line: 187, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !71, line: 186, column: 13)
!253 = !DILocation(line: 189, column: 13, scope: !245)
!254 = !DILocation(line: 190, column: 21, scope: !245)
!255 = !DILocation(line: 190, column: 32, scope: !245)
!256 = !DILocation(line: 191, column: 21, scope: !245)
!257 = !DILocation(line: 191, column: 30, scope: !245)
!258 = !DILocation(line: 191, column: 37, scope: !245)
!259 = !DILocation(line: 192, column: 32, scope: !245)
!260 = !DILocation(line: 192, column: 21, scope: !245)
!261 = !DILocation(line: 192, column: 30, scope: !245)
!262 = !DILocation(line: 193, column: 22, scope: !263)
!263 = distinct !DILexicalBlock(scope: !245, file: !71, line: 193, column: 17)
!264 = !DILocation(line: 193, column: 36, scope: !263)
!265 = !DILocation(line: 193, column: 17, scope: !263)
!266 = !DILocation(line: 193, column: 81, scope: !263)
!267 = !DILocation(line: 193, column: 17, scope: !245)
!268 = !DILocation(line: 195, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !263, file: !71, line: 194, column: 13)
!270 = !DILocation(line: 197, column: 24, scope: !271)
!271 = distinct !DILexicalBlock(scope: !245, file: !71, line: 197, column: 17)
!272 = !DILocation(line: 197, column: 17, scope: !271)
!273 = !DILocation(line: 197, column: 54, scope: !271)
!274 = !DILocation(line: 197, column: 17, scope: !245)
!275 = !DILocation(line: 199, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !271, file: !71, line: 198, column: 13)
!277 = !DILocation(line: 201, column: 35, scope: !245)
!278 = !DILocation(line: 201, column: 28, scope: !245)
!279 = !DILocation(line: 201, column: 26, scope: !245)
!280 = !DILocation(line: 202, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !245, file: !71, line: 202, column: 17)
!282 = !DILocation(line: 202, column: 30, scope: !281)
!283 = !DILocation(line: 202, column: 17, scope: !245)
!284 = !DILocation(line: 204, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !71, line: 203, column: 13)
!286 = !DILocation(line: 207, column: 31, scope: !245)
!287 = !DILocation(line: 207, column: 45, scope: !245)
!288 = !DILocation(line: 207, column: 26, scope: !245)
!289 = !DILocation(line: 207, column: 24, scope: !245)
!290 = !DILocation(line: 208, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !245, file: !71, line: 208, column: 17)
!292 = !DILocation(line: 208, column: 28, scope: !291)
!293 = !DILocation(line: 208, column: 44, scope: !291)
!294 = !DILocation(line: 208, column: 47, scope: !291)
!295 = !DILocation(line: 208, column: 58, scope: !291)
!296 = !DILocation(line: 208, column: 17, scope: !245)
!297 = !DILocation(line: 210, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !291, file: !71, line: 209, column: 13)
!299 = !DILocation(line: 213, column: 25, scope: !245)
!300 = !DILocation(line: 213, column: 13, scope: !245)
!301 = !DILocation(line: 213, column: 37, scope: !245)
!302 = !DILocation(line: 215, column: 25, scope: !245)
!303 = !DILocation(line: 215, column: 20, scope: !245)
!304 = !DILocation(line: 215, column: 18, scope: !245)
!305 = !DILocation(line: 216, column: 9, scope: !245)
!306 = !DILocation(line: 218, column: 13, scope: !307)
!307 = distinct !DILexicalBlock(scope: !233, file: !71, line: 218, column: 13)
!308 = !DILocation(line: 218, column: 26, scope: !307)
!309 = !DILocation(line: 218, column: 13, scope: !233)
!310 = !DILocation(line: 220, column: 26, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !71, line: 219, column: 9)
!312 = !DILocation(line: 220, column: 13, scope: !311)
!313 = !DILocation(line: 221, column: 9, scope: !311)
!314 = !DILocation(line: 222, column: 13, scope: !315)
!315 = distinct !DILexicalBlock(scope: !233, file: !71, line: 222, column: 13)
!316 = !DILocation(line: 222, column: 26, scope: !315)
!317 = !DILocation(line: 222, column: 13, scope: !233)
!318 = !DILocation(line: 224, column: 26, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !71, line: 223, column: 9)
!320 = !DILocation(line: 224, column: 13, scope: !319)
!321 = !DILocation(line: 225, column: 9, scope: !319)
!322 = !DILocalVariable(name: "buffer", scope: !323, file: !71, line: 247, type: !187)
!323 = distinct !DILexicalBlock(scope: !228, file: !71, line: 246, column: 5)
!324 = !DILocation(line: 247, column: 13, scope: !323)
!325 = !DILocation(line: 249, column: 13, scope: !326)
!326 = distinct !DILexicalBlock(scope: !323, file: !71, line: 249, column: 13)
!327 = !DILocation(line: 249, column: 18, scope: !326)
!328 = !DILocation(line: 249, column: 23, scope: !326)
!329 = !DILocation(line: 249, column: 26, scope: !326)
!330 = !DILocation(line: 249, column: 31, scope: !326)
!331 = !DILocation(line: 249, column: 13, scope: !323)
!332 = !DILocation(line: 251, column: 33, scope: !333)
!333 = distinct !DILexicalBlock(scope: !326, file: !71, line: 250, column: 9)
!334 = !DILocation(line: 251, column: 26, scope: !333)
!335 = !DILocation(line: 251, column: 13, scope: !333)
!336 = !DILocation(line: 252, column: 9, scope: !333)
!337 = !DILocation(line: 255, column: 13, scope: !338)
!338 = distinct !DILexicalBlock(scope: !326, file: !71, line: 254, column: 9)
!339 = !DILocation(line: 260, column: 1, scope: !228)
!340 = distinct !DISubprogram(name: "goodB2G2", scope: !71, file: !71, line: 263, type: !72, scopeLine: 264, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!341 = !DILocalVariable(name: "data", scope: !340, file: !71, line: 265, type: !76)
!342 = !DILocation(line: 265, column: 9, scope: !340)
!343 = !DILocation(line: 267, column: 10, scope: !340)
!344 = !DILocalVariable(name: "recvResult", scope: !345, file: !71, line: 276, type: !76)
!345 = distinct !DILexicalBlock(scope: !340, file: !71, line: 271, column: 5)
!346 = !DILocation(line: 276, column: 13, scope: !345)
!347 = !DILocalVariable(name: "service", scope: !345, file: !71, line: 277, type: !83)
!348 = !DILocation(line: 277, column: 28, scope: !345)
!349 = !DILocalVariable(name: "listenSocket", scope: !345, file: !71, line: 278, type: !76)
!350 = !DILocation(line: 278, column: 16, scope: !345)
!351 = !DILocalVariable(name: "acceptSocket", scope: !345, file: !71, line: 279, type: !76)
!352 = !DILocation(line: 279, column: 16, scope: !345)
!353 = !DILocalVariable(name: "inputBuffer", scope: !345, file: !71, line: 280, type: !60)
!354 = !DILocation(line: 280, column: 14, scope: !345)
!355 = !DILocation(line: 281, column: 9, scope: !345)
!356 = !DILocation(line: 291, column: 28, scope: !357)
!357 = distinct !DILexicalBlock(scope: !345, file: !71, line: 282, column: 9)
!358 = !DILocation(line: 291, column: 26, scope: !357)
!359 = !DILocation(line: 292, column: 17, scope: !360)
!360 = distinct !DILexicalBlock(scope: !357, file: !71, line: 292, column: 17)
!361 = !DILocation(line: 292, column: 30, scope: !360)
!362 = !DILocation(line: 292, column: 17, scope: !357)
!363 = !DILocation(line: 294, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !360, file: !71, line: 293, column: 13)
!365 = !DILocation(line: 296, column: 13, scope: !357)
!366 = !DILocation(line: 297, column: 21, scope: !357)
!367 = !DILocation(line: 297, column: 32, scope: !357)
!368 = !DILocation(line: 298, column: 21, scope: !357)
!369 = !DILocation(line: 298, column: 30, scope: !357)
!370 = !DILocation(line: 298, column: 37, scope: !357)
!371 = !DILocation(line: 299, column: 32, scope: !357)
!372 = !DILocation(line: 299, column: 21, scope: !357)
!373 = !DILocation(line: 299, column: 30, scope: !357)
!374 = !DILocation(line: 300, column: 22, scope: !375)
!375 = distinct !DILexicalBlock(scope: !357, file: !71, line: 300, column: 17)
!376 = !DILocation(line: 300, column: 36, scope: !375)
!377 = !DILocation(line: 300, column: 17, scope: !375)
!378 = !DILocation(line: 300, column: 81, scope: !375)
!379 = !DILocation(line: 300, column: 17, scope: !357)
!380 = !DILocation(line: 302, column: 17, scope: !381)
!381 = distinct !DILexicalBlock(scope: !375, file: !71, line: 301, column: 13)
!382 = !DILocation(line: 304, column: 24, scope: !383)
!383 = distinct !DILexicalBlock(scope: !357, file: !71, line: 304, column: 17)
!384 = !DILocation(line: 304, column: 17, scope: !383)
!385 = !DILocation(line: 304, column: 54, scope: !383)
!386 = !DILocation(line: 304, column: 17, scope: !357)
!387 = !DILocation(line: 306, column: 17, scope: !388)
!388 = distinct !DILexicalBlock(scope: !383, file: !71, line: 305, column: 13)
!389 = !DILocation(line: 308, column: 35, scope: !357)
!390 = !DILocation(line: 308, column: 28, scope: !357)
!391 = !DILocation(line: 308, column: 26, scope: !357)
!392 = !DILocation(line: 309, column: 17, scope: !393)
!393 = distinct !DILexicalBlock(scope: !357, file: !71, line: 309, column: 17)
!394 = !DILocation(line: 309, column: 30, scope: !393)
!395 = !DILocation(line: 309, column: 17, scope: !357)
!396 = !DILocation(line: 311, column: 17, scope: !397)
!397 = distinct !DILexicalBlock(scope: !393, file: !71, line: 310, column: 13)
!398 = !DILocation(line: 314, column: 31, scope: !357)
!399 = !DILocation(line: 314, column: 45, scope: !357)
!400 = !DILocation(line: 314, column: 26, scope: !357)
!401 = !DILocation(line: 314, column: 24, scope: !357)
!402 = !DILocation(line: 315, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !357, file: !71, line: 315, column: 17)
!404 = !DILocation(line: 315, column: 28, scope: !403)
!405 = !DILocation(line: 315, column: 44, scope: !403)
!406 = !DILocation(line: 315, column: 47, scope: !403)
!407 = !DILocation(line: 315, column: 58, scope: !403)
!408 = !DILocation(line: 315, column: 17, scope: !357)
!409 = !DILocation(line: 317, column: 17, scope: !410)
!410 = distinct !DILexicalBlock(scope: !403, file: !71, line: 316, column: 13)
!411 = !DILocation(line: 320, column: 25, scope: !357)
!412 = !DILocation(line: 320, column: 13, scope: !357)
!413 = !DILocation(line: 320, column: 37, scope: !357)
!414 = !DILocation(line: 322, column: 25, scope: !357)
!415 = !DILocation(line: 322, column: 20, scope: !357)
!416 = !DILocation(line: 322, column: 18, scope: !357)
!417 = !DILocation(line: 323, column: 9, scope: !357)
!418 = !DILocation(line: 325, column: 13, scope: !419)
!419 = distinct !DILexicalBlock(scope: !345, file: !71, line: 325, column: 13)
!420 = !DILocation(line: 325, column: 26, scope: !419)
!421 = !DILocation(line: 325, column: 13, scope: !345)
!422 = !DILocation(line: 327, column: 26, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !71, line: 326, column: 9)
!424 = !DILocation(line: 327, column: 13, scope: !423)
!425 = !DILocation(line: 328, column: 9, scope: !423)
!426 = !DILocation(line: 329, column: 13, scope: !427)
!427 = distinct !DILexicalBlock(scope: !345, file: !71, line: 329, column: 13)
!428 = !DILocation(line: 329, column: 26, scope: !427)
!429 = !DILocation(line: 329, column: 13, scope: !345)
!430 = !DILocation(line: 331, column: 26, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !71, line: 330, column: 9)
!432 = !DILocation(line: 331, column: 13, scope: !431)
!433 = !DILocation(line: 332, column: 9, scope: !431)
!434 = !DILocalVariable(name: "buffer", scope: !435, file: !71, line: 350, type: !187)
!435 = distinct !DILexicalBlock(scope: !340, file: !71, line: 349, column: 5)
!436 = !DILocation(line: 350, column: 13, scope: !435)
!437 = !DILocation(line: 352, column: 13, scope: !438)
!438 = distinct !DILexicalBlock(scope: !435, file: !71, line: 352, column: 13)
!439 = !DILocation(line: 352, column: 18, scope: !438)
!440 = !DILocation(line: 352, column: 23, scope: !438)
!441 = !DILocation(line: 352, column: 26, scope: !438)
!442 = !DILocation(line: 352, column: 31, scope: !438)
!443 = !DILocation(line: 352, column: 13, scope: !435)
!444 = !DILocation(line: 354, column: 33, scope: !445)
!445 = distinct !DILexicalBlock(scope: !438, file: !71, line: 353, column: 9)
!446 = !DILocation(line: 354, column: 26, scope: !445)
!447 = !DILocation(line: 354, column: 13, scope: !445)
!448 = !DILocation(line: 355, column: 9, scope: !445)
!449 = !DILocation(line: 358, column: 13, scope: !450)
!450 = distinct !DILexicalBlock(scope: !438, file: !71, line: 357, column: 9)
!451 = !DILocation(line: 367, column: 1, scope: !340)
!452 = distinct !DISubprogram(name: "goodG2B1", scope: !71, file: !71, line: 370, type: !72, scopeLine: 371, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!453 = !DILocalVariable(name: "data", scope: !452, file: !71, line: 372, type: !76)
!454 = !DILocation(line: 372, column: 9, scope: !452)
!455 = !DILocation(line: 374, column: 10, scope: !452)
!456 = !DILocation(line: 384, column: 14, scope: !452)
!457 = !DILocalVariable(name: "buffer", scope: !458, file: !71, line: 391, type: !187)
!458 = distinct !DILexicalBlock(scope: !452, file: !71, line: 390, column: 5)
!459 = !DILocation(line: 391, column: 13, scope: !458)
!460 = !DILocation(line: 394, column: 13, scope: !461)
!461 = distinct !DILexicalBlock(scope: !458, file: !71, line: 394, column: 13)
!462 = !DILocation(line: 394, column: 18, scope: !461)
!463 = !DILocation(line: 394, column: 13, scope: !458)
!464 = !DILocation(line: 396, column: 33, scope: !465)
!465 = distinct !DILexicalBlock(scope: !461, file: !71, line: 395, column: 9)
!466 = !DILocation(line: 396, column: 26, scope: !465)
!467 = !DILocation(line: 396, column: 13, scope: !465)
!468 = !DILocation(line: 397, column: 9, scope: !465)
!469 = !DILocation(line: 400, column: 13, scope: !470)
!470 = distinct !DILexicalBlock(scope: !461, file: !71, line: 399, column: 9)
!471 = !DILocation(line: 409, column: 1, scope: !452)
!472 = distinct !DISubprogram(name: "goodG2B2", scope: !71, file: !71, line: 412, type: !72, scopeLine: 413, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!473 = !DILocalVariable(name: "data", scope: !472, file: !71, line: 414, type: !76)
!474 = !DILocation(line: 414, column: 9, scope: !472)
!475 = !DILocation(line: 416, column: 10, scope: !472)
!476 = !DILocation(line: 422, column: 14, scope: !472)
!477 = !DILocalVariable(name: "buffer", scope: !478, file: !71, line: 433, type: !187)
!478 = distinct !DILexicalBlock(scope: !472, file: !71, line: 432, column: 5)
!479 = !DILocation(line: 433, column: 13, scope: !478)
!480 = !DILocation(line: 436, column: 13, scope: !481)
!481 = distinct !DILexicalBlock(scope: !478, file: !71, line: 436, column: 13)
!482 = !DILocation(line: 436, column: 18, scope: !481)
!483 = !DILocation(line: 436, column: 13, scope: !478)
!484 = !DILocation(line: 438, column: 33, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !71, line: 437, column: 9)
!486 = !DILocation(line: 438, column: 26, scope: !485)
!487 = !DILocation(line: 438, column: 13, scope: !485)
!488 = !DILocation(line: 439, column: 9, scope: !485)
!489 = !DILocation(line: 442, column: 13, scope: !490)
!490 = distinct !DILexicalBlock(scope: !481, file: !71, line: 441, column: 9)
!491 = !DILocation(line: 451, column: 1, scope: !472)
