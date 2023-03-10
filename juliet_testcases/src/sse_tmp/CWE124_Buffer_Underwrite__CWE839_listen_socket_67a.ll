; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_67a.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType = type { i32 }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_67_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType* %myStruct, metadata !78, metadata !DIExpression()), !dbg !83
  store i32 -1, i32* %data, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !88, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !106, metadata !DIExpression()), !dbg !107
  store i32 -1, i32* %listenSocket, align 4, !dbg !107
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !108, metadata !DIExpression()), !dbg !109
  store i32 -1, i32* %acceptSocket, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  br label %do.body, !dbg !112

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !113
  store i32 %call, i32* %listenSocket, align 4, !dbg !115
  %0 = load i32, i32* %listenSocket, align 4, !dbg !116
  %cmp = icmp eq i32 %0, -1, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !120

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !122
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !123
  store i16 2, i16* %sin_family, align 4, !dbg !124
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !125
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !126
  store i32 0, i32* %s_addr, align 4, !dbg !127
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !128
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !129
  store i16 %call1, i16* %sin_port, align 2, !dbg !130
  %2 = load i32, i32* %listenSocket, align 4, !dbg !131
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !133
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !134
  %cmp3 = icmp eq i32 %call2, -1, !dbg !135
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !136

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !137

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !139
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !141
  %cmp7 = icmp eq i32 %call6, -1, !dbg !142
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !143

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !144

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !146
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !147
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !148
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !149
  %cmp11 = icmp eq i32 %6, -1, !dbg !151
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !152

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !153

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !155
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !156
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !157
  %conv = trunc i64 %call14 to i32, !dbg !157
  store i32 %conv, i32* %recvResult, align 4, !dbg !158
  %8 = load i32, i32* %recvResult, align 4, !dbg !159
  %cmp15 = icmp eq i32 %8, -1, !dbg !161
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !162

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !163
  %cmp17 = icmp eq i32 %9, 0, !dbg !164
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !165

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !166

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !168
  %idxprom = sext i32 %10 to i64, !dbg !169
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !169
  store i8 0, i8* %arrayidx, align 1, !dbg !170
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !171
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !172
  store i32 %call22, i32* %data, align 4, !dbg !173
  br label %do.end, !dbg !174

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !175
  %cmp23 = icmp ne i32 %11, -1, !dbg !177
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !178

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !179
  %call26 = call i32 @close(i32 %12), !dbg !181
  br label %if.end27, !dbg !182

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !183
  %cmp28 = icmp ne i32 %13, -1, !dbg !185
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !186

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !187
  %call31 = call i32 @close(i32 %14), !dbg !189
  br label %if.end32, !dbg !190

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !191
  %structFirst = getelementptr inbounds %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType, %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !192
  store i32 %15, i32* %structFirst, align 4, !dbg !193
  %coerce.dive = getelementptr inbounds %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType, %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !194
  %16 = load i32, i32* %coerce.dive, align 4, !dbg !194
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_67b_badSink(i32 %16), !dbg !194
  ret void, !dbg !195
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

declare dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_67b_badSink(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_67_good() #0 !dbg !196 {
entry:
  call void @goodG2B(), !dbg !197
  call void @goodB2G(), !dbg !198
  ret void, !dbg !199
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !200 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !205, metadata !DIExpression()), !dbg !206
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !207, metadata !DIExpression()), !dbg !208
  %call = call i64 @time(i64* null) #7, !dbg !209
  %conv = trunc i64 %call to i32, !dbg !210
  call void @srand(i32 %conv) #7, !dbg !211
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !212
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_67_good(), !dbg !213
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !214
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !215
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_67_bad(), !dbg !216
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !217
  ret i32 0, !dbg !218
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !219 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType* %myStruct, metadata !222, metadata !DIExpression()), !dbg !223
  store i32 -1, i32* %data, align 4, !dbg !224
  store i32 7, i32* %data, align 4, !dbg !225
  %0 = load i32, i32* %data, align 4, !dbg !226
  %structFirst = getelementptr inbounds %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType, %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !227
  store i32 %0, i32* %structFirst, align 4, !dbg !228
  %coerce.dive = getelementptr inbounds %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType, %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !229
  %1 = load i32, i32* %coerce.dive, align 4, !dbg !229
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_67b_goodG2BSink(i32 %1), !dbg !229
  ret void, !dbg !230
}

declare dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_67b_goodG2BSink(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !231 {
entry:
  %data = alloca i32, align 4
  %myStruct = alloca %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !232, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType* %myStruct, metadata !234, metadata !DIExpression()), !dbg !235
  store i32 -1, i32* %data, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !237, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !240, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !242, metadata !DIExpression()), !dbg !243
  store i32 -1, i32* %listenSocket, align 4, !dbg !243
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !244, metadata !DIExpression()), !dbg !245
  store i32 -1, i32* %acceptSocket, align 4, !dbg !245
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !246, metadata !DIExpression()), !dbg !247
  br label %do.body, !dbg !248

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !249
  store i32 %call, i32* %listenSocket, align 4, !dbg !251
  %0 = load i32, i32* %listenSocket, align 4, !dbg !252
  %cmp = icmp eq i32 %0, -1, !dbg !254
  br i1 %cmp, label %if.then, label %if.end, !dbg !255

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !256

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !258
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !258
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !259
  store i16 2, i16* %sin_family, align 4, !dbg !260
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !261
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !262
  store i32 0, i32* %s_addr, align 4, !dbg !263
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !264
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !265
  store i16 %call1, i16* %sin_port, align 2, !dbg !266
  %2 = load i32, i32* %listenSocket, align 4, !dbg !267
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !269
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !270
  %cmp3 = icmp eq i32 %call2, -1, !dbg !271
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !272

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !273

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !275
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !277
  %cmp7 = icmp eq i32 %call6, -1, !dbg !278
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !279

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !280

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !282
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !283
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !284
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !285
  %cmp11 = icmp eq i32 %6, -1, !dbg !287
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !288

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !289

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !291
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !292
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !293
  %conv = trunc i64 %call14 to i32, !dbg !293
  store i32 %conv, i32* %recvResult, align 4, !dbg !294
  %8 = load i32, i32* %recvResult, align 4, !dbg !295
  %cmp15 = icmp eq i32 %8, -1, !dbg !297
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !298

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !299
  %cmp17 = icmp eq i32 %9, 0, !dbg !300
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !301

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !302

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !304
  %idxprom = sext i32 %10 to i64, !dbg !305
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !305
  store i8 0, i8* %arrayidx, align 1, !dbg !306
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !307
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !308
  store i32 %call22, i32* %data, align 4, !dbg !309
  br label %do.end, !dbg !310

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !311
  %cmp23 = icmp ne i32 %11, -1, !dbg !313
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !314

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !315
  %call26 = call i32 @close(i32 %12), !dbg !317
  br label %if.end27, !dbg !318

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !319
  %cmp28 = icmp ne i32 %13, -1, !dbg !321
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !322

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !323
  %call31 = call i32 @close(i32 %14), !dbg !325
  br label %if.end32, !dbg !326

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !327
  %structFirst = getelementptr inbounds %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType, %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !328
  store i32 %15, i32* %structFirst, align 4, !dbg !329
  %coerce.dive = getelementptr inbounds %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType, %struct._CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType* %myStruct, i32 0, i32 0, !dbg !330
  %16 = load i32, i32* %coerce.dive, align 4, !dbg !330
  call void @CWE124_Buffer_Underwrite__CWE839_listen_socket_67b_goodB2GSink(i32 %16), !dbg !330
  ret void, !dbg !331
}

declare dso_local void @CWE124_Buffer_Underwrite__CWE839_listen_socket_67b_goodB2GSink(i32) #5

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_67a.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_67_bad", scope: !71, file: !71, line: 52, type: !72, scopeLine: 53, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_listen_socket_67a.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 54, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 54, column: 9, scope: !70)
!78 = !DILocalVariable(name: "myStruct", scope: !70, file: !71, line: 55, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType", file: !71, line: 45, baseType: !80)
!80 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE124_Buffer_Underwrite__CWE839_listen_socket_67_structType", file: !71, line: 42, size: 32, elements: !81)
!81 = !{!82}
!82 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !80, file: !71, line: 44, baseType: !76, size: 32)
!83 = !DILocation(line: 55, column: 66, scope: !70)
!84 = !DILocation(line: 57, column: 10, scope: !70)
!85 = !DILocalVariable(name: "recvResult", scope: !86, file: !71, line: 63, type: !76)
!86 = distinct !DILexicalBlock(scope: !70, file: !71, line: 58, column: 5)
!87 = !DILocation(line: 63, column: 13, scope: !86)
!88 = !DILocalVariable(name: "service", scope: !86, file: !71, line: 64, type: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !90)
!90 = !{!91, !92, !96, !100}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !89, file: !17, line: 240, baseType: !56, size: 16)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !89, file: !17, line: 241, baseType: !93, size: 16, offset: 16)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !89, file: !17, line: 242, baseType: !97, size: 32, offset: 32)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !98)
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !97, file: !17, line: 33, baseType: !46, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !89, file: !17, line: 245, baseType: !101, size: 64, offset: 64)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 64, elements: !103)
!102 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!103 = !{!104}
!104 = !DISubrange(count: 8)
!105 = !DILocation(line: 64, column: 28, scope: !86)
!106 = !DILocalVariable(name: "listenSocket", scope: !86, file: !71, line: 65, type: !76)
!107 = !DILocation(line: 65, column: 16, scope: !86)
!108 = !DILocalVariable(name: "acceptSocket", scope: !86, file: !71, line: 66, type: !76)
!109 = !DILocation(line: 66, column: 16, scope: !86)
!110 = !DILocalVariable(name: "inputBuffer", scope: !86, file: !71, line: 67, type: !60)
!111 = !DILocation(line: 67, column: 14, scope: !86)
!112 = !DILocation(line: 68, column: 9, scope: !86)
!113 = !DILocation(line: 78, column: 28, scope: !114)
!114 = distinct !DILexicalBlock(scope: !86, file: !71, line: 69, column: 9)
!115 = !DILocation(line: 78, column: 26, scope: !114)
!116 = !DILocation(line: 79, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !71, line: 79, column: 17)
!118 = !DILocation(line: 79, column: 30, scope: !117)
!119 = !DILocation(line: 79, column: 17, scope: !114)
!120 = !DILocation(line: 81, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !71, line: 80, column: 13)
!122 = !DILocation(line: 83, column: 13, scope: !114)
!123 = !DILocation(line: 84, column: 21, scope: !114)
!124 = !DILocation(line: 84, column: 32, scope: !114)
!125 = !DILocation(line: 85, column: 21, scope: !114)
!126 = !DILocation(line: 85, column: 30, scope: !114)
!127 = !DILocation(line: 85, column: 37, scope: !114)
!128 = !DILocation(line: 86, column: 32, scope: !114)
!129 = !DILocation(line: 86, column: 21, scope: !114)
!130 = !DILocation(line: 86, column: 30, scope: !114)
!131 = !DILocation(line: 87, column: 22, scope: !132)
!132 = distinct !DILexicalBlock(scope: !114, file: !71, line: 87, column: 17)
!133 = !DILocation(line: 87, column: 36, scope: !132)
!134 = !DILocation(line: 87, column: 17, scope: !132)
!135 = !DILocation(line: 87, column: 81, scope: !132)
!136 = !DILocation(line: 87, column: 17, scope: !114)
!137 = !DILocation(line: 89, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !71, line: 88, column: 13)
!139 = !DILocation(line: 91, column: 24, scope: !140)
!140 = distinct !DILexicalBlock(scope: !114, file: !71, line: 91, column: 17)
!141 = !DILocation(line: 91, column: 17, scope: !140)
!142 = !DILocation(line: 91, column: 54, scope: !140)
!143 = !DILocation(line: 91, column: 17, scope: !114)
!144 = !DILocation(line: 93, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !71, line: 92, column: 13)
!146 = !DILocation(line: 95, column: 35, scope: !114)
!147 = !DILocation(line: 95, column: 28, scope: !114)
!148 = !DILocation(line: 95, column: 26, scope: !114)
!149 = !DILocation(line: 96, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !114, file: !71, line: 96, column: 17)
!151 = !DILocation(line: 96, column: 30, scope: !150)
!152 = !DILocation(line: 96, column: 17, scope: !114)
!153 = !DILocation(line: 98, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !71, line: 97, column: 13)
!155 = !DILocation(line: 101, column: 31, scope: !114)
!156 = !DILocation(line: 101, column: 45, scope: !114)
!157 = !DILocation(line: 101, column: 26, scope: !114)
!158 = !DILocation(line: 101, column: 24, scope: !114)
!159 = !DILocation(line: 102, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !114, file: !71, line: 102, column: 17)
!161 = !DILocation(line: 102, column: 28, scope: !160)
!162 = !DILocation(line: 102, column: 44, scope: !160)
!163 = !DILocation(line: 102, column: 47, scope: !160)
!164 = !DILocation(line: 102, column: 58, scope: !160)
!165 = !DILocation(line: 102, column: 17, scope: !114)
!166 = !DILocation(line: 104, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !160, file: !71, line: 103, column: 13)
!168 = !DILocation(line: 107, column: 25, scope: !114)
!169 = !DILocation(line: 107, column: 13, scope: !114)
!170 = !DILocation(line: 107, column: 37, scope: !114)
!171 = !DILocation(line: 109, column: 25, scope: !114)
!172 = !DILocation(line: 109, column: 20, scope: !114)
!173 = !DILocation(line: 109, column: 18, scope: !114)
!174 = !DILocation(line: 110, column: 9, scope: !114)
!175 = !DILocation(line: 112, column: 13, scope: !176)
!176 = distinct !DILexicalBlock(scope: !86, file: !71, line: 112, column: 13)
!177 = !DILocation(line: 112, column: 26, scope: !176)
!178 = !DILocation(line: 112, column: 13, scope: !86)
!179 = !DILocation(line: 114, column: 26, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !71, line: 113, column: 9)
!181 = !DILocation(line: 114, column: 13, scope: !180)
!182 = !DILocation(line: 115, column: 9, scope: !180)
!183 = !DILocation(line: 116, column: 13, scope: !184)
!184 = distinct !DILexicalBlock(scope: !86, file: !71, line: 116, column: 13)
!185 = !DILocation(line: 116, column: 26, scope: !184)
!186 = !DILocation(line: 116, column: 13, scope: !86)
!187 = !DILocation(line: 118, column: 26, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !71, line: 117, column: 9)
!189 = !DILocation(line: 118, column: 13, scope: !188)
!190 = !DILocation(line: 119, column: 9, scope: !188)
!191 = !DILocation(line: 127, column: 28, scope: !70)
!192 = !DILocation(line: 127, column: 14, scope: !70)
!193 = !DILocation(line: 127, column: 26, scope: !70)
!194 = !DILocation(line: 128, column: 5, scope: !70)
!195 = !DILocation(line: 129, column: 1, scope: !70)
!196 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_listen_socket_67_good", scope: !71, file: !71, line: 233, type: !72, scopeLine: 234, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!197 = !DILocation(line: 235, column: 5, scope: !196)
!198 = !DILocation(line: 236, column: 5, scope: !196)
!199 = !DILocation(line: 237, column: 1, scope: !196)
!200 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 248, type: !201, scopeLine: 249, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!201 = !DISubroutineType(types: !202)
!202 = !{!76, !76, !203}
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!205 = !DILocalVariable(name: "argc", arg: 1, scope: !200, file: !71, line: 248, type: !76)
!206 = !DILocation(line: 248, column: 14, scope: !200)
!207 = !DILocalVariable(name: "argv", arg: 2, scope: !200, file: !71, line: 248, type: !203)
!208 = !DILocation(line: 248, column: 27, scope: !200)
!209 = !DILocation(line: 251, column: 22, scope: !200)
!210 = !DILocation(line: 251, column: 12, scope: !200)
!211 = !DILocation(line: 251, column: 5, scope: !200)
!212 = !DILocation(line: 253, column: 5, scope: !200)
!213 = !DILocation(line: 254, column: 5, scope: !200)
!214 = !DILocation(line: 255, column: 5, scope: !200)
!215 = !DILocation(line: 258, column: 5, scope: !200)
!216 = !DILocation(line: 259, column: 5, scope: !200)
!217 = !DILocation(line: 260, column: 5, scope: !200)
!218 = !DILocation(line: 262, column: 5, scope: !200)
!219 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 138, type: !72, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!220 = !DILocalVariable(name: "data", scope: !219, file: !71, line: 140, type: !76)
!221 = !DILocation(line: 140, column: 9, scope: !219)
!222 = !DILocalVariable(name: "myStruct", scope: !219, file: !71, line: 141, type: !79)
!223 = !DILocation(line: 141, column: 66, scope: !219)
!224 = !DILocation(line: 143, column: 10, scope: !219)
!225 = !DILocation(line: 146, column: 10, scope: !219)
!226 = !DILocation(line: 147, column: 28, scope: !219)
!227 = !DILocation(line: 147, column: 14, scope: !219)
!228 = !DILocation(line: 147, column: 26, scope: !219)
!229 = !DILocation(line: 148, column: 5, scope: !219)
!230 = !DILocation(line: 149, column: 1, scope: !219)
!231 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 154, type: !72, scopeLine: 155, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!232 = !DILocalVariable(name: "data", scope: !231, file: !71, line: 156, type: !76)
!233 = !DILocation(line: 156, column: 9, scope: !231)
!234 = !DILocalVariable(name: "myStruct", scope: !231, file: !71, line: 157, type: !79)
!235 = !DILocation(line: 157, column: 66, scope: !231)
!236 = !DILocation(line: 159, column: 10, scope: !231)
!237 = !DILocalVariable(name: "recvResult", scope: !238, file: !71, line: 165, type: !76)
!238 = distinct !DILexicalBlock(scope: !231, file: !71, line: 160, column: 5)
!239 = !DILocation(line: 165, column: 13, scope: !238)
!240 = !DILocalVariable(name: "service", scope: !238, file: !71, line: 166, type: !89)
!241 = !DILocation(line: 166, column: 28, scope: !238)
!242 = !DILocalVariable(name: "listenSocket", scope: !238, file: !71, line: 167, type: !76)
!243 = !DILocation(line: 167, column: 16, scope: !238)
!244 = !DILocalVariable(name: "acceptSocket", scope: !238, file: !71, line: 168, type: !76)
!245 = !DILocation(line: 168, column: 16, scope: !238)
!246 = !DILocalVariable(name: "inputBuffer", scope: !238, file: !71, line: 169, type: !60)
!247 = !DILocation(line: 169, column: 14, scope: !238)
!248 = !DILocation(line: 170, column: 9, scope: !238)
!249 = !DILocation(line: 180, column: 28, scope: !250)
!250 = distinct !DILexicalBlock(scope: !238, file: !71, line: 171, column: 9)
!251 = !DILocation(line: 180, column: 26, scope: !250)
!252 = !DILocation(line: 181, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !250, file: !71, line: 181, column: 17)
!254 = !DILocation(line: 181, column: 30, scope: !253)
!255 = !DILocation(line: 181, column: 17, scope: !250)
!256 = !DILocation(line: 183, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !253, file: !71, line: 182, column: 13)
!258 = !DILocation(line: 185, column: 13, scope: !250)
!259 = !DILocation(line: 186, column: 21, scope: !250)
!260 = !DILocation(line: 186, column: 32, scope: !250)
!261 = !DILocation(line: 187, column: 21, scope: !250)
!262 = !DILocation(line: 187, column: 30, scope: !250)
!263 = !DILocation(line: 187, column: 37, scope: !250)
!264 = !DILocation(line: 188, column: 32, scope: !250)
!265 = !DILocation(line: 188, column: 21, scope: !250)
!266 = !DILocation(line: 188, column: 30, scope: !250)
!267 = !DILocation(line: 189, column: 22, scope: !268)
!268 = distinct !DILexicalBlock(scope: !250, file: !71, line: 189, column: 17)
!269 = !DILocation(line: 189, column: 36, scope: !268)
!270 = !DILocation(line: 189, column: 17, scope: !268)
!271 = !DILocation(line: 189, column: 81, scope: !268)
!272 = !DILocation(line: 189, column: 17, scope: !250)
!273 = !DILocation(line: 191, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !268, file: !71, line: 190, column: 13)
!275 = !DILocation(line: 193, column: 24, scope: !276)
!276 = distinct !DILexicalBlock(scope: !250, file: !71, line: 193, column: 17)
!277 = !DILocation(line: 193, column: 17, scope: !276)
!278 = !DILocation(line: 193, column: 54, scope: !276)
!279 = !DILocation(line: 193, column: 17, scope: !250)
!280 = !DILocation(line: 195, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !276, file: !71, line: 194, column: 13)
!282 = !DILocation(line: 197, column: 35, scope: !250)
!283 = !DILocation(line: 197, column: 28, scope: !250)
!284 = !DILocation(line: 197, column: 26, scope: !250)
!285 = !DILocation(line: 198, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !250, file: !71, line: 198, column: 17)
!287 = !DILocation(line: 198, column: 30, scope: !286)
!288 = !DILocation(line: 198, column: 17, scope: !250)
!289 = !DILocation(line: 200, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !286, file: !71, line: 199, column: 13)
!291 = !DILocation(line: 203, column: 31, scope: !250)
!292 = !DILocation(line: 203, column: 45, scope: !250)
!293 = !DILocation(line: 203, column: 26, scope: !250)
!294 = !DILocation(line: 203, column: 24, scope: !250)
!295 = !DILocation(line: 204, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !250, file: !71, line: 204, column: 17)
!297 = !DILocation(line: 204, column: 28, scope: !296)
!298 = !DILocation(line: 204, column: 44, scope: !296)
!299 = !DILocation(line: 204, column: 47, scope: !296)
!300 = !DILocation(line: 204, column: 58, scope: !296)
!301 = !DILocation(line: 204, column: 17, scope: !250)
!302 = !DILocation(line: 206, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !296, file: !71, line: 205, column: 13)
!304 = !DILocation(line: 209, column: 25, scope: !250)
!305 = !DILocation(line: 209, column: 13, scope: !250)
!306 = !DILocation(line: 209, column: 37, scope: !250)
!307 = !DILocation(line: 211, column: 25, scope: !250)
!308 = !DILocation(line: 211, column: 20, scope: !250)
!309 = !DILocation(line: 211, column: 18, scope: !250)
!310 = !DILocation(line: 212, column: 9, scope: !250)
!311 = !DILocation(line: 214, column: 13, scope: !312)
!312 = distinct !DILexicalBlock(scope: !238, file: !71, line: 214, column: 13)
!313 = !DILocation(line: 214, column: 26, scope: !312)
!314 = !DILocation(line: 214, column: 13, scope: !238)
!315 = !DILocation(line: 216, column: 26, scope: !316)
!316 = distinct !DILexicalBlock(scope: !312, file: !71, line: 215, column: 9)
!317 = !DILocation(line: 216, column: 13, scope: !316)
!318 = !DILocation(line: 217, column: 9, scope: !316)
!319 = !DILocation(line: 218, column: 13, scope: !320)
!320 = distinct !DILexicalBlock(scope: !238, file: !71, line: 218, column: 13)
!321 = !DILocation(line: 218, column: 26, scope: !320)
!322 = !DILocation(line: 218, column: 13, scope: !238)
!323 = !DILocation(line: 220, column: 26, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !71, line: 219, column: 9)
!325 = !DILocation(line: 220, column: 13, scope: !324)
!326 = !DILocation(line: 221, column: 9, scope: !324)
!327 = !DILocation(line: 229, column: 28, scope: !231)
!328 = !DILocation(line: 229, column: 14, scope: !231)
!329 = !DILocation(line: 229, column: 26, scope: !231)
!330 = !DILocation(line: 230, column: 5, scope: !231)
!331 = !DILocation(line: 231, column: 1, scope: !231)
