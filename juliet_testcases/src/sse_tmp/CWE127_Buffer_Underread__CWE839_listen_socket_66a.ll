; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_66a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_66_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !78, metadata !DIExpression()), !dbg !82
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
  %15 = load i32, i32* %data, align 4, !dbg !190
  %arrayidx33 = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !191
  store i32 %15, i32* %arrayidx33, align 8, !dbg !192
  %arraydecay34 = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !193
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_66b_badSink(i32* %arraydecay34), !dbg !194
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

declare dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_66b_badSink(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_66_good() #0 !dbg !196 {
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
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_66_good(), !dbg !213
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !214
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !215
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_66_bad(), !dbg !216
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
  %dataArray = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !222, metadata !DIExpression()), !dbg !223
  store i32 -1, i32* %data, align 4, !dbg !224
  store i32 7, i32* %data, align 4, !dbg !225
  %0 = load i32, i32* %data, align 4, !dbg !226
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !227
  store i32 %0, i32* %arrayidx, align 8, !dbg !228
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !229
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_66b_goodG2BSink(i32* %arraydecay), !dbg !230
  ret void, !dbg !231
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_66b_goodG2BSink(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !232 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !233, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !235, metadata !DIExpression()), !dbg !236
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
  %arrayidx33 = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !329
  store i32 %15, i32* %arrayidx33, align 8, !dbg !330
  %arraydecay34 = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !331
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_66b_goodB2GSink(i32* %arraydecay34), !dbg !332
  ret void, !dbg !333
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_66b_goodB2GSink(i32*) #5

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_66_bad", scope: !71, file: !71, line: 47, type: !72, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_66a.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 49, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 49, column: 9, scope: !70)
!78 = !DILocalVariable(name: "dataArray", scope: !70, file: !71, line: 50, type: !79)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !76, size: 160, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 5)
!82 = !DILocation(line: 50, column: 9, scope: !70)
!83 = !DILocation(line: 52, column: 10, scope: !70)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !71, line: 58, type: !76)
!85 = distinct !DILexicalBlock(scope: !70, file: !71, line: 53, column: 5)
!86 = !DILocation(line: 58, column: 13, scope: !85)
!87 = !DILocalVariable(name: "service", scope: !85, file: !71, line: 59, type: !88)
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
!104 = !DILocation(line: 59, column: 28, scope: !85)
!105 = !DILocalVariable(name: "listenSocket", scope: !85, file: !71, line: 60, type: !76)
!106 = !DILocation(line: 60, column: 16, scope: !85)
!107 = !DILocalVariable(name: "acceptSocket", scope: !85, file: !71, line: 61, type: !76)
!108 = !DILocation(line: 61, column: 16, scope: !85)
!109 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !71, line: 62, type: !60)
!110 = !DILocation(line: 62, column: 14, scope: !85)
!111 = !DILocation(line: 63, column: 9, scope: !85)
!112 = !DILocation(line: 73, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !85, file: !71, line: 64, column: 9)
!114 = !DILocation(line: 73, column: 26, scope: !113)
!115 = !DILocation(line: 74, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !71, line: 74, column: 17)
!117 = !DILocation(line: 74, column: 30, scope: !116)
!118 = !DILocation(line: 74, column: 17, scope: !113)
!119 = !DILocation(line: 76, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !71, line: 75, column: 13)
!121 = !DILocation(line: 78, column: 13, scope: !113)
!122 = !DILocation(line: 79, column: 21, scope: !113)
!123 = !DILocation(line: 79, column: 32, scope: !113)
!124 = !DILocation(line: 80, column: 21, scope: !113)
!125 = !DILocation(line: 80, column: 30, scope: !113)
!126 = !DILocation(line: 80, column: 37, scope: !113)
!127 = !DILocation(line: 81, column: 32, scope: !113)
!128 = !DILocation(line: 81, column: 21, scope: !113)
!129 = !DILocation(line: 81, column: 30, scope: !113)
!130 = !DILocation(line: 82, column: 22, scope: !131)
!131 = distinct !DILexicalBlock(scope: !113, file: !71, line: 82, column: 17)
!132 = !DILocation(line: 82, column: 36, scope: !131)
!133 = !DILocation(line: 82, column: 17, scope: !131)
!134 = !DILocation(line: 82, column: 81, scope: !131)
!135 = !DILocation(line: 82, column: 17, scope: !113)
!136 = !DILocation(line: 84, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !71, line: 83, column: 13)
!138 = !DILocation(line: 86, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !113, file: !71, line: 86, column: 17)
!140 = !DILocation(line: 86, column: 17, scope: !139)
!141 = !DILocation(line: 86, column: 54, scope: !139)
!142 = !DILocation(line: 86, column: 17, scope: !113)
!143 = !DILocation(line: 88, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !71, line: 87, column: 13)
!145 = !DILocation(line: 90, column: 35, scope: !113)
!146 = !DILocation(line: 90, column: 28, scope: !113)
!147 = !DILocation(line: 90, column: 26, scope: !113)
!148 = !DILocation(line: 91, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !113, file: !71, line: 91, column: 17)
!150 = !DILocation(line: 91, column: 30, scope: !149)
!151 = !DILocation(line: 91, column: 17, scope: !113)
!152 = !DILocation(line: 93, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !71, line: 92, column: 13)
!154 = !DILocation(line: 96, column: 31, scope: !113)
!155 = !DILocation(line: 96, column: 45, scope: !113)
!156 = !DILocation(line: 96, column: 26, scope: !113)
!157 = !DILocation(line: 96, column: 24, scope: !113)
!158 = !DILocation(line: 97, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !113, file: !71, line: 97, column: 17)
!160 = !DILocation(line: 97, column: 28, scope: !159)
!161 = !DILocation(line: 97, column: 44, scope: !159)
!162 = !DILocation(line: 97, column: 47, scope: !159)
!163 = !DILocation(line: 97, column: 58, scope: !159)
!164 = !DILocation(line: 97, column: 17, scope: !113)
!165 = !DILocation(line: 99, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !71, line: 98, column: 13)
!167 = !DILocation(line: 102, column: 25, scope: !113)
!168 = !DILocation(line: 102, column: 13, scope: !113)
!169 = !DILocation(line: 102, column: 37, scope: !113)
!170 = !DILocation(line: 104, column: 25, scope: !113)
!171 = !DILocation(line: 104, column: 20, scope: !113)
!172 = !DILocation(line: 104, column: 18, scope: !113)
!173 = !DILocation(line: 105, column: 9, scope: !113)
!174 = !DILocation(line: 107, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !85, file: !71, line: 107, column: 13)
!176 = !DILocation(line: 107, column: 26, scope: !175)
!177 = !DILocation(line: 107, column: 13, scope: !85)
!178 = !DILocation(line: 109, column: 26, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !71, line: 108, column: 9)
!180 = !DILocation(line: 109, column: 13, scope: !179)
!181 = !DILocation(line: 110, column: 9, scope: !179)
!182 = !DILocation(line: 111, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !85, file: !71, line: 111, column: 13)
!184 = !DILocation(line: 111, column: 26, scope: !183)
!185 = !DILocation(line: 111, column: 13, scope: !85)
!186 = !DILocation(line: 113, column: 26, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !71, line: 112, column: 9)
!188 = !DILocation(line: 113, column: 13, scope: !187)
!189 = !DILocation(line: 114, column: 9, scope: !187)
!190 = !DILocation(line: 123, column: 20, scope: !70)
!191 = !DILocation(line: 123, column: 5, scope: !70)
!192 = !DILocation(line: 123, column: 18, scope: !70)
!193 = !DILocation(line: 124, column: 63, scope: !70)
!194 = !DILocation(line: 124, column: 5, scope: !70)
!195 = !DILocation(line: 125, column: 1, scope: !70)
!196 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_66_good", scope: !71, file: !71, line: 229, type: !72, scopeLine: 230, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!197 = !DILocation(line: 231, column: 5, scope: !196)
!198 = !DILocation(line: 232, column: 5, scope: !196)
!199 = !DILocation(line: 233, column: 1, scope: !196)
!200 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 244, type: !201, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!201 = !DISubroutineType(types: !202)
!202 = !{!76, !76, !203}
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!205 = !DILocalVariable(name: "argc", arg: 1, scope: !200, file: !71, line: 244, type: !76)
!206 = !DILocation(line: 244, column: 14, scope: !200)
!207 = !DILocalVariable(name: "argv", arg: 2, scope: !200, file: !71, line: 244, type: !203)
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
!219 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 134, type: !72, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!220 = !DILocalVariable(name: "data", scope: !219, file: !71, line: 136, type: !76)
!221 = !DILocation(line: 136, column: 9, scope: !219)
!222 = !DILocalVariable(name: "dataArray", scope: !219, file: !71, line: 137, type: !79)
!223 = !DILocation(line: 137, column: 9, scope: !219)
!224 = !DILocation(line: 139, column: 10, scope: !219)
!225 = !DILocation(line: 142, column: 10, scope: !219)
!226 = !DILocation(line: 143, column: 20, scope: !219)
!227 = !DILocation(line: 143, column: 5, scope: !219)
!228 = !DILocation(line: 143, column: 18, scope: !219)
!229 = !DILocation(line: 144, column: 67, scope: !219)
!230 = !DILocation(line: 144, column: 5, scope: !219)
!231 = !DILocation(line: 145, column: 1, scope: !219)
!232 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 150, type: !72, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!233 = !DILocalVariable(name: "data", scope: !232, file: !71, line: 152, type: !76)
!234 = !DILocation(line: 152, column: 9, scope: !232)
!235 = !DILocalVariable(name: "dataArray", scope: !232, file: !71, line: 153, type: !79)
!236 = !DILocation(line: 153, column: 9, scope: !232)
!237 = !DILocation(line: 155, column: 10, scope: !232)
!238 = !DILocalVariable(name: "recvResult", scope: !239, file: !71, line: 161, type: !76)
!239 = distinct !DILexicalBlock(scope: !232, file: !71, line: 156, column: 5)
!240 = !DILocation(line: 161, column: 13, scope: !239)
!241 = !DILocalVariable(name: "service", scope: !239, file: !71, line: 162, type: !88)
!242 = !DILocation(line: 162, column: 28, scope: !239)
!243 = !DILocalVariable(name: "listenSocket", scope: !239, file: !71, line: 163, type: !76)
!244 = !DILocation(line: 163, column: 16, scope: !239)
!245 = !DILocalVariable(name: "acceptSocket", scope: !239, file: !71, line: 164, type: !76)
!246 = !DILocation(line: 164, column: 16, scope: !239)
!247 = !DILocalVariable(name: "inputBuffer", scope: !239, file: !71, line: 165, type: !60)
!248 = !DILocation(line: 165, column: 14, scope: !239)
!249 = !DILocation(line: 166, column: 9, scope: !239)
!250 = !DILocation(line: 176, column: 28, scope: !251)
!251 = distinct !DILexicalBlock(scope: !239, file: !71, line: 167, column: 9)
!252 = !DILocation(line: 176, column: 26, scope: !251)
!253 = !DILocation(line: 177, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !251, file: !71, line: 177, column: 17)
!255 = !DILocation(line: 177, column: 30, scope: !254)
!256 = !DILocation(line: 177, column: 17, scope: !251)
!257 = !DILocation(line: 179, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !71, line: 178, column: 13)
!259 = !DILocation(line: 181, column: 13, scope: !251)
!260 = !DILocation(line: 182, column: 21, scope: !251)
!261 = !DILocation(line: 182, column: 32, scope: !251)
!262 = !DILocation(line: 183, column: 21, scope: !251)
!263 = !DILocation(line: 183, column: 30, scope: !251)
!264 = !DILocation(line: 183, column: 37, scope: !251)
!265 = !DILocation(line: 184, column: 32, scope: !251)
!266 = !DILocation(line: 184, column: 21, scope: !251)
!267 = !DILocation(line: 184, column: 30, scope: !251)
!268 = !DILocation(line: 185, column: 22, scope: !269)
!269 = distinct !DILexicalBlock(scope: !251, file: !71, line: 185, column: 17)
!270 = !DILocation(line: 185, column: 36, scope: !269)
!271 = !DILocation(line: 185, column: 17, scope: !269)
!272 = !DILocation(line: 185, column: 81, scope: !269)
!273 = !DILocation(line: 185, column: 17, scope: !251)
!274 = !DILocation(line: 187, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !71, line: 186, column: 13)
!276 = !DILocation(line: 189, column: 24, scope: !277)
!277 = distinct !DILexicalBlock(scope: !251, file: !71, line: 189, column: 17)
!278 = !DILocation(line: 189, column: 17, scope: !277)
!279 = !DILocation(line: 189, column: 54, scope: !277)
!280 = !DILocation(line: 189, column: 17, scope: !251)
!281 = !DILocation(line: 191, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !277, file: !71, line: 190, column: 13)
!283 = !DILocation(line: 193, column: 35, scope: !251)
!284 = !DILocation(line: 193, column: 28, scope: !251)
!285 = !DILocation(line: 193, column: 26, scope: !251)
!286 = !DILocation(line: 194, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !251, file: !71, line: 194, column: 17)
!288 = !DILocation(line: 194, column: 30, scope: !287)
!289 = !DILocation(line: 194, column: 17, scope: !251)
!290 = !DILocation(line: 196, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !71, line: 195, column: 13)
!292 = !DILocation(line: 199, column: 31, scope: !251)
!293 = !DILocation(line: 199, column: 45, scope: !251)
!294 = !DILocation(line: 199, column: 26, scope: !251)
!295 = !DILocation(line: 199, column: 24, scope: !251)
!296 = !DILocation(line: 200, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !251, file: !71, line: 200, column: 17)
!298 = !DILocation(line: 200, column: 28, scope: !297)
!299 = !DILocation(line: 200, column: 44, scope: !297)
!300 = !DILocation(line: 200, column: 47, scope: !297)
!301 = !DILocation(line: 200, column: 58, scope: !297)
!302 = !DILocation(line: 200, column: 17, scope: !251)
!303 = !DILocation(line: 202, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !297, file: !71, line: 201, column: 13)
!305 = !DILocation(line: 205, column: 25, scope: !251)
!306 = !DILocation(line: 205, column: 13, scope: !251)
!307 = !DILocation(line: 205, column: 37, scope: !251)
!308 = !DILocation(line: 207, column: 25, scope: !251)
!309 = !DILocation(line: 207, column: 20, scope: !251)
!310 = !DILocation(line: 207, column: 18, scope: !251)
!311 = !DILocation(line: 208, column: 9, scope: !251)
!312 = !DILocation(line: 210, column: 13, scope: !313)
!313 = distinct !DILexicalBlock(scope: !239, file: !71, line: 210, column: 13)
!314 = !DILocation(line: 210, column: 26, scope: !313)
!315 = !DILocation(line: 210, column: 13, scope: !239)
!316 = !DILocation(line: 212, column: 26, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !71, line: 211, column: 9)
!318 = !DILocation(line: 212, column: 13, scope: !317)
!319 = !DILocation(line: 213, column: 9, scope: !317)
!320 = !DILocation(line: 214, column: 13, scope: !321)
!321 = distinct !DILexicalBlock(scope: !239, file: !71, line: 214, column: 13)
!322 = !DILocation(line: 214, column: 26, scope: !321)
!323 = !DILocation(line: 214, column: 13, scope: !239)
!324 = !DILocation(line: 216, column: 26, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !71, line: 215, column: 9)
!326 = !DILocation(line: 216, column: 13, scope: !325)
!327 = !DILocation(line: 217, column: 9, scope: !325)
!328 = !DILocation(line: 225, column: 20, scope: !232)
!329 = !DILocation(line: 225, column: 5, scope: !232)
!330 = !DILocation(line: 225, column: 18, scope: !232)
!331 = !DILocation(line: 226, column: 67, scope: !232)
!332 = !DILocation(line: 226, column: 5, scope: !232)
!333 = !DILocation(line: 227, column: 1, scope: !232)
