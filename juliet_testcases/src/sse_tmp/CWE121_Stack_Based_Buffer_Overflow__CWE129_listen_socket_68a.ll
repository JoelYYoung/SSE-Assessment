; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_badData = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_goodG2BData = dso_local global i32 0, align 4, !dbg !67
@CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_goodB2GData = dso_local global i32 0, align 4, !dbg !71

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_bad() #0 !dbg !79 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i32 -1, i32* %data, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !86, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !89, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %listenSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %acceptSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  br label %do.body, !dbg !113

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !114
  store i32 %call, i32* %listenSocket, align 4, !dbg !116
  %0 = load i32, i32* %listenSocket, align 4, !dbg !117
  %cmp = icmp eq i32 %0, -1, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !121

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !123
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !124
  store i16 2, i16* %sin_family, align 4, !dbg !125
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !126
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !127
  store i32 0, i32* %s_addr, align 4, !dbg !128
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !129
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !130
  store i16 %call1, i16* %sin_port, align 2, !dbg !131
  %2 = load i32, i32* %listenSocket, align 4, !dbg !132
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !134
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !135
  %cmp3 = icmp eq i32 %call2, -1, !dbg !136
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !137

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !138

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !142
  %cmp7 = icmp eq i32 %call6, -1, !dbg !143
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !144

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !145

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !147
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !148
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !149
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !150
  %cmp11 = icmp eq i32 %6, -1, !dbg !152
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !153

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !154

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !156
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !157
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !158
  %conv = trunc i64 %call14 to i32, !dbg !158
  store i32 %conv, i32* %recvResult, align 4, !dbg !159
  %8 = load i32, i32* %recvResult, align 4, !dbg !160
  %cmp15 = icmp eq i32 %8, -1, !dbg !162
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !163

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !164
  %cmp17 = icmp eq i32 %9, 0, !dbg !165
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !166

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !167

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !169
  %idxprom = sext i32 %10 to i64, !dbg !170
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !172
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !173
  store i32 %call22, i32* %data, align 4, !dbg !174
  br label %do.end, !dbg !175

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !176
  %cmp23 = icmp ne i32 %11, -1, !dbg !178
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !179

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !180
  %call26 = call i32 @close(i32 %12), !dbg !182
  br label %if.end27, !dbg !183

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !184
  %cmp28 = icmp ne i32 %13, -1, !dbg !186
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !187

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !188
  %call31 = call i32 @close(i32 %14), !dbg !190
  br label %if.end32, !dbg !191

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !192
  store i32 %15, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_badData, align 4, !dbg !193
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68b_badSink(), !dbg !194
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

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68b_badSink(...) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_good() #0 !dbg !196 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_good(), !dbg !213
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !214
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !215
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_bad(), !dbg !216
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
  call void @llvm.dbg.declare(metadata i32* %data, metadata !220, metadata !DIExpression()), !dbg !221
  store i32 -1, i32* %data, align 4, !dbg !222
  store i32 7, i32* %data, align 4, !dbg !223
  %0 = load i32, i32* %data, align 4, !dbg !224
  store i32 %0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_goodG2BData, align 4, !dbg !225
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68b_goodG2BSink(), !dbg !226
  ret void, !dbg !227
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68b_goodG2BSink(...) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !228 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  %15 = load i32, i32* %data, align 4, !dbg !322
  store i32 %15, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_goodB2GData, align 4, !dbg !323
  call void (...) @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68b_goodB2GSink(), !dbg !324
  ret void, !dbg !325
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68b_goodB2GSink(...) #5

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
!llvm.module.flags = !{!73, !74, !75, !76, !77}
!llvm.ident = !{!78}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_badData", scope: !2, file: !69, line: 42, type: !70, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !66, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68a.c", directory: "/home/joelyang/SSE-Assessment")
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
!66 = !{!0, !67, !71}
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_goodG2BData", scope: !2, file: !69, line: 43, type: !70, isLocal: false, isDefinition: true)
!69 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68a.c", directory: "/home/joelyang/SSE-Assessment")
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_goodB2GData", scope: !2, file: !69, line: 44, type: !70, isLocal: false, isDefinition: true)
!73 = !{i32 7, !"Dwarf Version", i32 4}
!74 = !{i32 2, !"Debug Info Version", i32 3}
!75 = !{i32 1, !"wchar_size", i32 4}
!76 = !{i32 7, !"uwtable", i32 1}
!77 = !{i32 7, !"frame-pointer", i32 2}
!78 = !{!"clang version 13.0.0"}
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_bad", scope: !69, file: !69, line: 51, type: !80, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!80 = !DISubroutineType(types: !81)
!81 = !{null}
!82 = !{}
!83 = !DILocalVariable(name: "data", scope: !79, file: !69, line: 53, type: !70)
!84 = !DILocation(line: 53, column: 9, scope: !79)
!85 = !DILocation(line: 55, column: 10, scope: !79)
!86 = !DILocalVariable(name: "recvResult", scope: !87, file: !69, line: 61, type: !70)
!87 = distinct !DILexicalBlock(scope: !79, file: !69, line: 56, column: 5)
!88 = !DILocation(line: 61, column: 13, scope: !87)
!89 = !DILocalVariable(name: "service", scope: !87, file: !69, line: 62, type: !90)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !91)
!91 = !{!92, !93, !97, !101}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !90, file: !19, line: 240, baseType: !58, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !90, file: !19, line: 241, baseType: !94, size: 16, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !50, line: 25, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !52, line: 40, baseType: !60)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !90, file: !19, line: 242, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !19, line: 33, baseType: !48, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !90, file: !19, line: 245, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 62, column: 28, scope: !87)
!107 = !DILocalVariable(name: "listenSocket", scope: !87, file: !69, line: 63, type: !70)
!108 = !DILocation(line: 63, column: 16, scope: !87)
!109 = !DILocalVariable(name: "acceptSocket", scope: !87, file: !69, line: 64, type: !70)
!110 = !DILocation(line: 64, column: 16, scope: !87)
!111 = !DILocalVariable(name: "inputBuffer", scope: !87, file: !69, line: 65, type: !62)
!112 = !DILocation(line: 65, column: 14, scope: !87)
!113 = !DILocation(line: 66, column: 9, scope: !87)
!114 = !DILocation(line: 76, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !87, file: !69, line: 67, column: 9)
!116 = !DILocation(line: 76, column: 26, scope: !115)
!117 = !DILocation(line: 77, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !69, line: 77, column: 17)
!119 = !DILocation(line: 77, column: 30, scope: !118)
!120 = !DILocation(line: 77, column: 17, scope: !115)
!121 = !DILocation(line: 79, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !69, line: 78, column: 13)
!123 = !DILocation(line: 81, column: 13, scope: !115)
!124 = !DILocation(line: 82, column: 21, scope: !115)
!125 = !DILocation(line: 82, column: 32, scope: !115)
!126 = !DILocation(line: 83, column: 21, scope: !115)
!127 = !DILocation(line: 83, column: 30, scope: !115)
!128 = !DILocation(line: 83, column: 37, scope: !115)
!129 = !DILocation(line: 84, column: 32, scope: !115)
!130 = !DILocation(line: 84, column: 21, scope: !115)
!131 = !DILocation(line: 84, column: 30, scope: !115)
!132 = !DILocation(line: 85, column: 22, scope: !133)
!133 = distinct !DILexicalBlock(scope: !115, file: !69, line: 85, column: 17)
!134 = !DILocation(line: 85, column: 36, scope: !133)
!135 = !DILocation(line: 85, column: 17, scope: !133)
!136 = !DILocation(line: 85, column: 81, scope: !133)
!137 = !DILocation(line: 85, column: 17, scope: !115)
!138 = !DILocation(line: 87, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !69, line: 86, column: 13)
!140 = !DILocation(line: 89, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !115, file: !69, line: 89, column: 17)
!142 = !DILocation(line: 89, column: 17, scope: !141)
!143 = !DILocation(line: 89, column: 54, scope: !141)
!144 = !DILocation(line: 89, column: 17, scope: !115)
!145 = !DILocation(line: 91, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !141, file: !69, line: 90, column: 13)
!147 = !DILocation(line: 93, column: 35, scope: !115)
!148 = !DILocation(line: 93, column: 28, scope: !115)
!149 = !DILocation(line: 93, column: 26, scope: !115)
!150 = !DILocation(line: 94, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !115, file: !69, line: 94, column: 17)
!152 = !DILocation(line: 94, column: 30, scope: !151)
!153 = !DILocation(line: 94, column: 17, scope: !115)
!154 = !DILocation(line: 96, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !69, line: 95, column: 13)
!156 = !DILocation(line: 99, column: 31, scope: !115)
!157 = !DILocation(line: 99, column: 45, scope: !115)
!158 = !DILocation(line: 99, column: 26, scope: !115)
!159 = !DILocation(line: 99, column: 24, scope: !115)
!160 = !DILocation(line: 100, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !115, file: !69, line: 100, column: 17)
!162 = !DILocation(line: 100, column: 28, scope: !161)
!163 = !DILocation(line: 100, column: 44, scope: !161)
!164 = !DILocation(line: 100, column: 47, scope: !161)
!165 = !DILocation(line: 100, column: 58, scope: !161)
!166 = !DILocation(line: 100, column: 17, scope: !115)
!167 = !DILocation(line: 102, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !161, file: !69, line: 101, column: 13)
!169 = !DILocation(line: 105, column: 25, scope: !115)
!170 = !DILocation(line: 105, column: 13, scope: !115)
!171 = !DILocation(line: 105, column: 37, scope: !115)
!172 = !DILocation(line: 107, column: 25, scope: !115)
!173 = !DILocation(line: 107, column: 20, scope: !115)
!174 = !DILocation(line: 107, column: 18, scope: !115)
!175 = !DILocation(line: 108, column: 9, scope: !115)
!176 = !DILocation(line: 110, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !87, file: !69, line: 110, column: 13)
!178 = !DILocation(line: 110, column: 26, scope: !177)
!179 = !DILocation(line: 110, column: 13, scope: !87)
!180 = !DILocation(line: 112, column: 26, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !69, line: 111, column: 9)
!182 = !DILocation(line: 112, column: 13, scope: !181)
!183 = !DILocation(line: 113, column: 9, scope: !181)
!184 = !DILocation(line: 114, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !87, file: !69, line: 114, column: 13)
!186 = !DILocation(line: 114, column: 26, scope: !185)
!187 = !DILocation(line: 114, column: 13, scope: !87)
!188 = !DILocation(line: 116, column: 26, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !69, line: 115, column: 9)
!190 = !DILocation(line: 116, column: 13, scope: !189)
!191 = !DILocation(line: 117, column: 9, scope: !189)
!192 = !DILocation(line: 125, column: 75, scope: !79)
!193 = !DILocation(line: 125, column: 73, scope: !79)
!194 = !DILocation(line: 126, column: 5, scope: !79)
!195 = !DILocation(line: 127, column: 1, scope: !79)
!196 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_68_good", scope: !69, file: !69, line: 229, type: !80, scopeLine: 230, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!197 = !DILocation(line: 231, column: 5, scope: !196)
!198 = !DILocation(line: 232, column: 5, scope: !196)
!199 = !DILocation(line: 233, column: 1, scope: !196)
!200 = distinct !DISubprogram(name: "main", scope: !69, file: !69, line: 244, type: !201, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !82)
!201 = !DISubroutineType(types: !202)
!202 = !{!70, !70, !203}
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!205 = !DILocalVariable(name: "argc", arg: 1, scope: !200, file: !69, line: 244, type: !70)
!206 = !DILocation(line: 244, column: 14, scope: !200)
!207 = !DILocalVariable(name: "argv", arg: 2, scope: !200, file: !69, line: 244, type: !203)
!208 = !DILocation(line: 244, column: 27, scope: !200)
!209 = !DILocation(line: 247, column: 22, scope: !200)
!210 = !DILocation(line: 247, column: 12, scope: !200)
!211 = !DILocation(line: 247, column: 5, scope: !200)
!212 = !DILocation(line: 249, column: 5, scope: !200)
!213 = !DILocation(line: 250, column: 5, scope: !200)
!214 = !DILocation(line: 251, column: 5, scope: !200)
!215 = !DILocation(line: 254, column: 5, scope: !200)
!216 = !DILocation(line: 255, column: 5, scope: !200)
!217 = !DILocation(line: 256, column: 5, scope: !200)
!218 = !DILocation(line: 258, column: 5, scope: !200)
!219 = distinct !DISubprogram(name: "goodG2B", scope: !69, file: !69, line: 138, type: !80, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!220 = !DILocalVariable(name: "data", scope: !219, file: !69, line: 140, type: !70)
!221 = !DILocation(line: 140, column: 9, scope: !219)
!222 = !DILocation(line: 142, column: 10, scope: !219)
!223 = !DILocation(line: 145, column: 10, scope: !219)
!224 = !DILocation(line: 146, column: 79, scope: !219)
!225 = !DILocation(line: 146, column: 77, scope: !219)
!226 = !DILocation(line: 147, column: 5, scope: !219)
!227 = !DILocation(line: 148, column: 1, scope: !219)
!228 = distinct !DISubprogram(name: "goodB2G", scope: !69, file: !69, line: 151, type: !80, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !82)
!229 = !DILocalVariable(name: "data", scope: !228, file: !69, line: 153, type: !70)
!230 = !DILocation(line: 153, column: 9, scope: !228)
!231 = !DILocation(line: 155, column: 10, scope: !228)
!232 = !DILocalVariable(name: "recvResult", scope: !233, file: !69, line: 161, type: !70)
!233 = distinct !DILexicalBlock(scope: !228, file: !69, line: 156, column: 5)
!234 = !DILocation(line: 161, column: 13, scope: !233)
!235 = !DILocalVariable(name: "service", scope: !233, file: !69, line: 162, type: !90)
!236 = !DILocation(line: 162, column: 28, scope: !233)
!237 = !DILocalVariable(name: "listenSocket", scope: !233, file: !69, line: 163, type: !70)
!238 = !DILocation(line: 163, column: 16, scope: !233)
!239 = !DILocalVariable(name: "acceptSocket", scope: !233, file: !69, line: 164, type: !70)
!240 = !DILocation(line: 164, column: 16, scope: !233)
!241 = !DILocalVariable(name: "inputBuffer", scope: !233, file: !69, line: 165, type: !62)
!242 = !DILocation(line: 165, column: 14, scope: !233)
!243 = !DILocation(line: 166, column: 9, scope: !233)
!244 = !DILocation(line: 176, column: 28, scope: !245)
!245 = distinct !DILexicalBlock(scope: !233, file: !69, line: 167, column: 9)
!246 = !DILocation(line: 176, column: 26, scope: !245)
!247 = !DILocation(line: 177, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !69, line: 177, column: 17)
!249 = !DILocation(line: 177, column: 30, scope: !248)
!250 = !DILocation(line: 177, column: 17, scope: !245)
!251 = !DILocation(line: 179, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !69, line: 178, column: 13)
!253 = !DILocation(line: 181, column: 13, scope: !245)
!254 = !DILocation(line: 182, column: 21, scope: !245)
!255 = !DILocation(line: 182, column: 32, scope: !245)
!256 = !DILocation(line: 183, column: 21, scope: !245)
!257 = !DILocation(line: 183, column: 30, scope: !245)
!258 = !DILocation(line: 183, column: 37, scope: !245)
!259 = !DILocation(line: 184, column: 32, scope: !245)
!260 = !DILocation(line: 184, column: 21, scope: !245)
!261 = !DILocation(line: 184, column: 30, scope: !245)
!262 = !DILocation(line: 185, column: 22, scope: !263)
!263 = distinct !DILexicalBlock(scope: !245, file: !69, line: 185, column: 17)
!264 = !DILocation(line: 185, column: 36, scope: !263)
!265 = !DILocation(line: 185, column: 17, scope: !263)
!266 = !DILocation(line: 185, column: 81, scope: !263)
!267 = !DILocation(line: 185, column: 17, scope: !245)
!268 = !DILocation(line: 187, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !263, file: !69, line: 186, column: 13)
!270 = !DILocation(line: 189, column: 24, scope: !271)
!271 = distinct !DILexicalBlock(scope: !245, file: !69, line: 189, column: 17)
!272 = !DILocation(line: 189, column: 17, scope: !271)
!273 = !DILocation(line: 189, column: 54, scope: !271)
!274 = !DILocation(line: 189, column: 17, scope: !245)
!275 = !DILocation(line: 191, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !271, file: !69, line: 190, column: 13)
!277 = !DILocation(line: 193, column: 35, scope: !245)
!278 = !DILocation(line: 193, column: 28, scope: !245)
!279 = !DILocation(line: 193, column: 26, scope: !245)
!280 = !DILocation(line: 194, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !245, file: !69, line: 194, column: 17)
!282 = !DILocation(line: 194, column: 30, scope: !281)
!283 = !DILocation(line: 194, column: 17, scope: !245)
!284 = !DILocation(line: 196, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !69, line: 195, column: 13)
!286 = !DILocation(line: 199, column: 31, scope: !245)
!287 = !DILocation(line: 199, column: 45, scope: !245)
!288 = !DILocation(line: 199, column: 26, scope: !245)
!289 = !DILocation(line: 199, column: 24, scope: !245)
!290 = !DILocation(line: 200, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !245, file: !69, line: 200, column: 17)
!292 = !DILocation(line: 200, column: 28, scope: !291)
!293 = !DILocation(line: 200, column: 44, scope: !291)
!294 = !DILocation(line: 200, column: 47, scope: !291)
!295 = !DILocation(line: 200, column: 58, scope: !291)
!296 = !DILocation(line: 200, column: 17, scope: !245)
!297 = !DILocation(line: 202, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !291, file: !69, line: 201, column: 13)
!299 = !DILocation(line: 205, column: 25, scope: !245)
!300 = !DILocation(line: 205, column: 13, scope: !245)
!301 = !DILocation(line: 205, column: 37, scope: !245)
!302 = !DILocation(line: 207, column: 25, scope: !245)
!303 = !DILocation(line: 207, column: 20, scope: !245)
!304 = !DILocation(line: 207, column: 18, scope: !245)
!305 = !DILocation(line: 208, column: 9, scope: !245)
!306 = !DILocation(line: 210, column: 13, scope: !307)
!307 = distinct !DILexicalBlock(scope: !233, file: !69, line: 210, column: 13)
!308 = !DILocation(line: 210, column: 26, scope: !307)
!309 = !DILocation(line: 210, column: 13, scope: !233)
!310 = !DILocation(line: 212, column: 26, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !69, line: 211, column: 9)
!312 = !DILocation(line: 212, column: 13, scope: !311)
!313 = !DILocation(line: 213, column: 9, scope: !311)
!314 = !DILocation(line: 214, column: 13, scope: !315)
!315 = distinct !DILexicalBlock(scope: !233, file: !69, line: 214, column: 13)
!316 = !DILocation(line: 214, column: 26, scope: !315)
!317 = !DILocation(line: 214, column: 13, scope: !233)
!318 = !DILocation(line: 216, column: 26, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !69, line: 215, column: 9)
!320 = !DILocation(line: 216, column: 13, scope: !319)
!321 = !DILocation(line: 217, column: 9, scope: !319)
!322 = !DILocation(line: 225, column: 79, scope: !228)
!323 = !DILocation(line: 225, column: 77, scope: !228)
!324 = !DILocation(line: 226, column: 5, scope: !228)
!325 = !DILocation(line: 227, column: 1, scope: !228)
