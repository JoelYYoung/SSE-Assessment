; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_65a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_65a.c"
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
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_65_bad() #0 !dbg !70 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !78, metadata !DIExpression()), !dbg !82
  store void (i32)* @CWE127_Buffer_Underread__CWE839_listen_socket_65b_badSink, void (i32)** %funcPtr, align 8, !dbg !82
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
  %15 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !190
  %16 = load i32, i32* %data, align 4, !dbg !191
  call void %15(i32 %16), !dbg !190
  ret void, !dbg !192
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_65b_badSink(i32) #2

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #5

; Function Attrs: nounwind
declare dso_local i32 @bind(i32, %struct.sockaddr*, i32) #3

; Function Attrs: nounwind
declare dso_local i32 @listen(i32, i32) #3

declare dso_local i32 @accept(i32, %struct.sockaddr*, i32*) #2

declare dso_local i64 @recv(i32, i8*, i64, i32) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_65_good() #0 !dbg !193 {
entry:
  call void @goodG2B(), !dbg !194
  call void @goodB2G(), !dbg !195
  ret void, !dbg !196
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !197 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !202, metadata !DIExpression()), !dbg !203
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !204, metadata !DIExpression()), !dbg !205
  %call = call i64 @time(i64* null) #7, !dbg !206
  %conv = trunc i64 %call to i32, !dbg !207
  call void @srand(i32 %conv) #7, !dbg !208
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !209
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_65_good(), !dbg !210
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !211
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !212
  call void @CWE127_Buffer_Underread__CWE839_listen_socket_65_bad(), !dbg !213
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !214
  ret i32 0, !dbg !215
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !216 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !219, metadata !DIExpression()), !dbg !220
  store void (i32)* @CWE127_Buffer_Underread__CWE839_listen_socket_65b_goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !220
  store i32 -1, i32* %data, align 4, !dbg !221
  store i32 7, i32* %data, align 4, !dbg !222
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !223
  %1 = load i32, i32* %data, align 4, !dbg !224
  call void %0(i32 %1), !dbg !223
  ret void, !dbg !225
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_65b_goodG2BSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !226 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !229, metadata !DIExpression()), !dbg !230
  store void (i32)* @CWE127_Buffer_Underread__CWE839_listen_socket_65b_goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !230
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
  %15 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !322
  %16 = load i32, i32* %data, align 4, !dbg !323
  call void %15(i32 %16), !dbg !322
  ret void, !dbg !324
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_65b_goodB2GSink(i32) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!64, !65, !66, !67, !68}
!llvm.ident = !{!69}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_65a.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_65_bad", scope: !71, file: !71, line: 47, type: !72, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_65a.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 49, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 49, column: 9, scope: !70)
!78 = !DILocalVariable(name: "funcPtr", scope: !70, file: !71, line: 51, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DISubroutineType(types: !81)
!81 = !{null, !76}
!82 = !DILocation(line: 51, column: 12, scope: !70)
!83 = !DILocation(line: 53, column: 10, scope: !70)
!84 = !DILocalVariable(name: "recvResult", scope: !85, file: !71, line: 59, type: !76)
!85 = distinct !DILexicalBlock(scope: !70, file: !71, line: 54, column: 5)
!86 = !DILocation(line: 59, column: 13, scope: !85)
!87 = !DILocalVariable(name: "service", scope: !85, file: !71, line: 60, type: !88)
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
!104 = !DILocation(line: 60, column: 28, scope: !85)
!105 = !DILocalVariable(name: "listenSocket", scope: !85, file: !71, line: 61, type: !76)
!106 = !DILocation(line: 61, column: 16, scope: !85)
!107 = !DILocalVariable(name: "acceptSocket", scope: !85, file: !71, line: 62, type: !76)
!108 = !DILocation(line: 62, column: 16, scope: !85)
!109 = !DILocalVariable(name: "inputBuffer", scope: !85, file: !71, line: 63, type: !60)
!110 = !DILocation(line: 63, column: 14, scope: !85)
!111 = !DILocation(line: 64, column: 9, scope: !85)
!112 = !DILocation(line: 74, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !85, file: !71, line: 65, column: 9)
!114 = !DILocation(line: 74, column: 26, scope: !113)
!115 = !DILocation(line: 75, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !71, line: 75, column: 17)
!117 = !DILocation(line: 75, column: 30, scope: !116)
!118 = !DILocation(line: 75, column: 17, scope: !113)
!119 = !DILocation(line: 77, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !71, line: 76, column: 13)
!121 = !DILocation(line: 79, column: 13, scope: !113)
!122 = !DILocation(line: 80, column: 21, scope: !113)
!123 = !DILocation(line: 80, column: 32, scope: !113)
!124 = !DILocation(line: 81, column: 21, scope: !113)
!125 = !DILocation(line: 81, column: 30, scope: !113)
!126 = !DILocation(line: 81, column: 37, scope: !113)
!127 = !DILocation(line: 82, column: 32, scope: !113)
!128 = !DILocation(line: 82, column: 21, scope: !113)
!129 = !DILocation(line: 82, column: 30, scope: !113)
!130 = !DILocation(line: 83, column: 22, scope: !131)
!131 = distinct !DILexicalBlock(scope: !113, file: !71, line: 83, column: 17)
!132 = !DILocation(line: 83, column: 36, scope: !131)
!133 = !DILocation(line: 83, column: 17, scope: !131)
!134 = !DILocation(line: 83, column: 81, scope: !131)
!135 = !DILocation(line: 83, column: 17, scope: !113)
!136 = !DILocation(line: 85, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !71, line: 84, column: 13)
!138 = !DILocation(line: 87, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !113, file: !71, line: 87, column: 17)
!140 = !DILocation(line: 87, column: 17, scope: !139)
!141 = !DILocation(line: 87, column: 54, scope: !139)
!142 = !DILocation(line: 87, column: 17, scope: !113)
!143 = !DILocation(line: 89, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !71, line: 88, column: 13)
!145 = !DILocation(line: 91, column: 35, scope: !113)
!146 = !DILocation(line: 91, column: 28, scope: !113)
!147 = !DILocation(line: 91, column: 26, scope: !113)
!148 = !DILocation(line: 92, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !113, file: !71, line: 92, column: 17)
!150 = !DILocation(line: 92, column: 30, scope: !149)
!151 = !DILocation(line: 92, column: 17, scope: !113)
!152 = !DILocation(line: 94, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !71, line: 93, column: 13)
!154 = !DILocation(line: 97, column: 31, scope: !113)
!155 = !DILocation(line: 97, column: 45, scope: !113)
!156 = !DILocation(line: 97, column: 26, scope: !113)
!157 = !DILocation(line: 97, column: 24, scope: !113)
!158 = !DILocation(line: 98, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !113, file: !71, line: 98, column: 17)
!160 = !DILocation(line: 98, column: 28, scope: !159)
!161 = !DILocation(line: 98, column: 44, scope: !159)
!162 = !DILocation(line: 98, column: 47, scope: !159)
!163 = !DILocation(line: 98, column: 58, scope: !159)
!164 = !DILocation(line: 98, column: 17, scope: !113)
!165 = !DILocation(line: 100, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !71, line: 99, column: 13)
!167 = !DILocation(line: 103, column: 25, scope: !113)
!168 = !DILocation(line: 103, column: 13, scope: !113)
!169 = !DILocation(line: 103, column: 37, scope: !113)
!170 = !DILocation(line: 105, column: 25, scope: !113)
!171 = !DILocation(line: 105, column: 20, scope: !113)
!172 = !DILocation(line: 105, column: 18, scope: !113)
!173 = !DILocation(line: 106, column: 9, scope: !113)
!174 = !DILocation(line: 108, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !85, file: !71, line: 108, column: 13)
!176 = !DILocation(line: 108, column: 26, scope: !175)
!177 = !DILocation(line: 108, column: 13, scope: !85)
!178 = !DILocation(line: 110, column: 26, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !71, line: 109, column: 9)
!180 = !DILocation(line: 110, column: 13, scope: !179)
!181 = !DILocation(line: 111, column: 9, scope: !179)
!182 = !DILocation(line: 112, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !85, file: !71, line: 112, column: 13)
!184 = !DILocation(line: 112, column: 26, scope: !183)
!185 = !DILocation(line: 112, column: 13, scope: !85)
!186 = !DILocation(line: 114, column: 26, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !71, line: 113, column: 9)
!188 = !DILocation(line: 114, column: 13, scope: !187)
!189 = !DILocation(line: 115, column: 9, scope: !187)
!190 = !DILocation(line: 124, column: 5, scope: !70)
!191 = !DILocation(line: 124, column: 13, scope: !70)
!192 = !DILocation(line: 125, column: 1, scope: !70)
!193 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_65_good", scope: !71, file: !71, line: 227, type: !72, scopeLine: 228, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!194 = !DILocation(line: 229, column: 5, scope: !193)
!195 = !DILocation(line: 230, column: 5, scope: !193)
!196 = !DILocation(line: 231, column: 1, scope: !193)
!197 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 242, type: !198, scopeLine: 243, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!198 = !DISubroutineType(types: !199)
!199 = !{!76, !76, !200}
!200 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !201, size: 64)
!201 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!202 = !DILocalVariable(name: "argc", arg: 1, scope: !197, file: !71, line: 242, type: !76)
!203 = !DILocation(line: 242, column: 14, scope: !197)
!204 = !DILocalVariable(name: "argv", arg: 2, scope: !197, file: !71, line: 242, type: !200)
!205 = !DILocation(line: 242, column: 27, scope: !197)
!206 = !DILocation(line: 245, column: 22, scope: !197)
!207 = !DILocation(line: 245, column: 12, scope: !197)
!208 = !DILocation(line: 245, column: 5, scope: !197)
!209 = !DILocation(line: 247, column: 5, scope: !197)
!210 = !DILocation(line: 248, column: 5, scope: !197)
!211 = !DILocation(line: 249, column: 5, scope: !197)
!212 = !DILocation(line: 252, column: 5, scope: !197)
!213 = !DILocation(line: 253, column: 5, scope: !197)
!214 = !DILocation(line: 254, column: 5, scope: !197)
!215 = !DILocation(line: 256, column: 5, scope: !197)
!216 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 134, type: !72, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!217 = !DILocalVariable(name: "data", scope: !216, file: !71, line: 136, type: !76)
!218 = !DILocation(line: 136, column: 9, scope: !216)
!219 = !DILocalVariable(name: "funcPtr", scope: !216, file: !71, line: 137, type: !79)
!220 = !DILocation(line: 137, column: 12, scope: !216)
!221 = !DILocation(line: 139, column: 10, scope: !216)
!222 = !DILocation(line: 142, column: 10, scope: !216)
!223 = !DILocation(line: 143, column: 5, scope: !216)
!224 = !DILocation(line: 143, column: 13, scope: !216)
!225 = !DILocation(line: 144, column: 1, scope: !216)
!226 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 149, type: !72, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!227 = !DILocalVariable(name: "data", scope: !226, file: !71, line: 151, type: !76)
!228 = !DILocation(line: 151, column: 9, scope: !226)
!229 = !DILocalVariable(name: "funcPtr", scope: !226, file: !71, line: 152, type: !79)
!230 = !DILocation(line: 152, column: 12, scope: !226)
!231 = !DILocation(line: 154, column: 10, scope: !226)
!232 = !DILocalVariable(name: "recvResult", scope: !233, file: !71, line: 160, type: !76)
!233 = distinct !DILexicalBlock(scope: !226, file: !71, line: 155, column: 5)
!234 = !DILocation(line: 160, column: 13, scope: !233)
!235 = !DILocalVariable(name: "service", scope: !233, file: !71, line: 161, type: !88)
!236 = !DILocation(line: 161, column: 28, scope: !233)
!237 = !DILocalVariable(name: "listenSocket", scope: !233, file: !71, line: 162, type: !76)
!238 = !DILocation(line: 162, column: 16, scope: !233)
!239 = !DILocalVariable(name: "acceptSocket", scope: !233, file: !71, line: 163, type: !76)
!240 = !DILocation(line: 163, column: 16, scope: !233)
!241 = !DILocalVariable(name: "inputBuffer", scope: !233, file: !71, line: 164, type: !60)
!242 = !DILocation(line: 164, column: 14, scope: !233)
!243 = !DILocation(line: 165, column: 9, scope: !233)
!244 = !DILocation(line: 175, column: 28, scope: !245)
!245 = distinct !DILexicalBlock(scope: !233, file: !71, line: 166, column: 9)
!246 = !DILocation(line: 175, column: 26, scope: !245)
!247 = !DILocation(line: 176, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !71, line: 176, column: 17)
!249 = !DILocation(line: 176, column: 30, scope: !248)
!250 = !DILocation(line: 176, column: 17, scope: !245)
!251 = !DILocation(line: 178, column: 17, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !71, line: 177, column: 13)
!253 = !DILocation(line: 180, column: 13, scope: !245)
!254 = !DILocation(line: 181, column: 21, scope: !245)
!255 = !DILocation(line: 181, column: 32, scope: !245)
!256 = !DILocation(line: 182, column: 21, scope: !245)
!257 = !DILocation(line: 182, column: 30, scope: !245)
!258 = !DILocation(line: 182, column: 37, scope: !245)
!259 = !DILocation(line: 183, column: 32, scope: !245)
!260 = !DILocation(line: 183, column: 21, scope: !245)
!261 = !DILocation(line: 183, column: 30, scope: !245)
!262 = !DILocation(line: 184, column: 22, scope: !263)
!263 = distinct !DILexicalBlock(scope: !245, file: !71, line: 184, column: 17)
!264 = !DILocation(line: 184, column: 36, scope: !263)
!265 = !DILocation(line: 184, column: 17, scope: !263)
!266 = !DILocation(line: 184, column: 81, scope: !263)
!267 = !DILocation(line: 184, column: 17, scope: !245)
!268 = !DILocation(line: 186, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !263, file: !71, line: 185, column: 13)
!270 = !DILocation(line: 188, column: 24, scope: !271)
!271 = distinct !DILexicalBlock(scope: !245, file: !71, line: 188, column: 17)
!272 = !DILocation(line: 188, column: 17, scope: !271)
!273 = !DILocation(line: 188, column: 54, scope: !271)
!274 = !DILocation(line: 188, column: 17, scope: !245)
!275 = !DILocation(line: 190, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !271, file: !71, line: 189, column: 13)
!277 = !DILocation(line: 192, column: 35, scope: !245)
!278 = !DILocation(line: 192, column: 28, scope: !245)
!279 = !DILocation(line: 192, column: 26, scope: !245)
!280 = !DILocation(line: 193, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !245, file: !71, line: 193, column: 17)
!282 = !DILocation(line: 193, column: 30, scope: !281)
!283 = !DILocation(line: 193, column: 17, scope: !245)
!284 = !DILocation(line: 195, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !71, line: 194, column: 13)
!286 = !DILocation(line: 198, column: 31, scope: !245)
!287 = !DILocation(line: 198, column: 45, scope: !245)
!288 = !DILocation(line: 198, column: 26, scope: !245)
!289 = !DILocation(line: 198, column: 24, scope: !245)
!290 = !DILocation(line: 199, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !245, file: !71, line: 199, column: 17)
!292 = !DILocation(line: 199, column: 28, scope: !291)
!293 = !DILocation(line: 199, column: 44, scope: !291)
!294 = !DILocation(line: 199, column: 47, scope: !291)
!295 = !DILocation(line: 199, column: 58, scope: !291)
!296 = !DILocation(line: 199, column: 17, scope: !245)
!297 = !DILocation(line: 201, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !291, file: !71, line: 200, column: 13)
!299 = !DILocation(line: 204, column: 25, scope: !245)
!300 = !DILocation(line: 204, column: 13, scope: !245)
!301 = !DILocation(line: 204, column: 37, scope: !245)
!302 = !DILocation(line: 206, column: 25, scope: !245)
!303 = !DILocation(line: 206, column: 20, scope: !245)
!304 = !DILocation(line: 206, column: 18, scope: !245)
!305 = !DILocation(line: 207, column: 9, scope: !245)
!306 = !DILocation(line: 209, column: 13, scope: !307)
!307 = distinct !DILexicalBlock(scope: !233, file: !71, line: 209, column: 13)
!308 = !DILocation(line: 209, column: 26, scope: !307)
!309 = !DILocation(line: 209, column: 13, scope: !233)
!310 = !DILocation(line: 211, column: 26, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !71, line: 210, column: 9)
!312 = !DILocation(line: 211, column: 13, scope: !311)
!313 = !DILocation(line: 212, column: 9, scope: !311)
!314 = !DILocation(line: 213, column: 13, scope: !315)
!315 = distinct !DILexicalBlock(scope: !233, file: !71, line: 213, column: 13)
!316 = !DILocation(line: 213, column: 26, scope: !315)
!317 = !DILocation(line: 213, column: 13, scope: !233)
!318 = !DILocation(line: 215, column: 26, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !71, line: 214, column: 9)
!320 = !DILocation(line: 215, column: 13, scope: !319)
!321 = !DILocation(line: 216, column: 9, scope: !319)
!322 = !DILocation(line: 224, column: 5, scope: !226)
!323 = !DILocation(line: 224, column: 13, scope: !226)
!324 = !DILocation(line: 225, column: 1, scope: !226)
