; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_54a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_54a.c"
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
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_54_bad() #0 !dbg !70 {
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
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_54b_badSink(i32 %15), !dbg !186
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

declare dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_54b_badSink(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_54_good() #0 !dbg !188 {
entry:
  call void @goodG2B(), !dbg !189
  call void @goodB2G(), !dbg !190
  ret void, !dbg !191
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !192 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !197, metadata !DIExpression()), !dbg !198
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !199, metadata !DIExpression()), !dbg !200
  %call = call i64 @time(i64* null) #7, !dbg !201
  %conv = trunc i64 %call to i32, !dbg !202
  call void @srand(i32 %conv) #7, !dbg !203
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !204
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_54_good(), !dbg !205
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !206
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !207
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_54_bad(), !dbg !208
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !209
  ret i32 0, !dbg !210
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !211 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 -1, i32* %data, align 4, !dbg !214
  store i32 7, i32* %data, align 4, !dbg !215
  %0 = load i32, i32* %data, align 4, !dbg !216
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_54b_goodG2BSink(i32 %0), !dbg !217
  ret void, !dbg !218
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_54b_goodG2BSink(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !219 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !220, metadata !DIExpression()), !dbg !221
  store i32 -1, i32* %data, align 4, !dbg !222
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !223, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !226, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !228, metadata !DIExpression()), !dbg !229
  store i32 -1, i32* %listenSocket, align 4, !dbg !229
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !230, metadata !DIExpression()), !dbg !231
  store i32 -1, i32* %acceptSocket, align 4, !dbg !231
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !232, metadata !DIExpression()), !dbg !233
  br label %do.body, !dbg !234

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !235
  store i32 %call, i32* %listenSocket, align 4, !dbg !237
  %0 = load i32, i32* %listenSocket, align 4, !dbg !238
  %cmp = icmp eq i32 %0, -1, !dbg !240
  br i1 %cmp, label %if.then, label %if.end, !dbg !241

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !242

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !244
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !244
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !245
  store i16 2, i16* %sin_family, align 4, !dbg !246
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !247
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !248
  store i32 0, i32* %s_addr, align 4, !dbg !249
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !250
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !251
  store i16 %call1, i16* %sin_port, align 2, !dbg !252
  %2 = load i32, i32* %listenSocket, align 4, !dbg !253
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !255
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !256
  %cmp3 = icmp eq i32 %call2, -1, !dbg !257
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !258

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !259

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !261
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !263
  %cmp7 = icmp eq i32 %call6, -1, !dbg !264
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !265

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !266

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !268
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !269
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !270
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !271
  %cmp11 = icmp eq i32 %6, -1, !dbg !273
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !274

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !275

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !277
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !278
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !279
  %conv = trunc i64 %call14 to i32, !dbg !279
  store i32 %conv, i32* %recvResult, align 4, !dbg !280
  %8 = load i32, i32* %recvResult, align 4, !dbg !281
  %cmp15 = icmp eq i32 %8, -1, !dbg !283
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !284

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !285
  %cmp17 = icmp eq i32 %9, 0, !dbg !286
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !287

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !288

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !290
  %idxprom = sext i32 %10 to i64, !dbg !291
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !291
  store i8 0, i8* %arrayidx, align 1, !dbg !292
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !293
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !294
  store i32 %call22, i32* %data, align 4, !dbg !295
  br label %do.end, !dbg !296

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !297
  %cmp23 = icmp ne i32 %11, -1, !dbg !299
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !300

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !301
  %call26 = call i32 @close(i32 %12), !dbg !303
  br label %if.end27, !dbg !304

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !305
  %cmp28 = icmp ne i32 %13, -1, !dbg !307
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !308

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !309
  %call31 = call i32 @close(i32 %14), !dbg !311
  br label %if.end32, !dbg !312

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data, align 4, !dbg !313
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_54b_goodB2GSink(i32 %15), !dbg !314
  ret void, !dbg !315
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_listen_socket_54b_goodB2GSink(i32) #5

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_54a.c", directory: "/home/joelyang/SSE-Assessment")
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
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_54_bad", scope: !71, file: !71, line: 47, type: !72, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_listen_socket_54a.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{null}
!74 = !{}
!75 = !DILocalVariable(name: "data", scope: !70, file: !71, line: 49, type: !76)
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DILocation(line: 49, column: 9, scope: !70)
!78 = !DILocation(line: 51, column: 10, scope: !70)
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
!185 = !DILocation(line: 121, column: 62, scope: !70)
!186 = !DILocation(line: 121, column: 5, scope: !70)
!187 = !DILocation(line: 122, column: 1, scope: !70)
!188 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_54_good", scope: !71, file: !71, line: 222, type: !72, scopeLine: 223, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!189 = !DILocation(line: 224, column: 5, scope: !188)
!190 = !DILocation(line: 225, column: 5, scope: !188)
!191 = !DILocation(line: 226, column: 1, scope: !188)
!192 = distinct !DISubprogram(name: "main", scope: !71, file: !71, line: 237, type: !193, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !74)
!193 = !DISubroutineType(types: !194)
!194 = !{!76, !76, !195}
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!197 = !DILocalVariable(name: "argc", arg: 1, scope: !192, file: !71, line: 237, type: !76)
!198 = !DILocation(line: 237, column: 14, scope: !192)
!199 = !DILocalVariable(name: "argv", arg: 2, scope: !192, file: !71, line: 237, type: !195)
!200 = !DILocation(line: 237, column: 27, scope: !192)
!201 = !DILocation(line: 240, column: 22, scope: !192)
!202 = !DILocation(line: 240, column: 12, scope: !192)
!203 = !DILocation(line: 240, column: 5, scope: !192)
!204 = !DILocation(line: 242, column: 5, scope: !192)
!205 = !DILocation(line: 243, column: 5, scope: !192)
!206 = !DILocation(line: 244, column: 5, scope: !192)
!207 = !DILocation(line: 247, column: 5, scope: !192)
!208 = !DILocation(line: 248, column: 5, scope: !192)
!209 = !DILocation(line: 249, column: 5, scope: !192)
!210 = !DILocation(line: 251, column: 5, scope: !192)
!211 = distinct !DISubprogram(name: "goodG2B", scope: !71, file: !71, line: 131, type: !72, scopeLine: 132, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!212 = !DILocalVariable(name: "data", scope: !211, file: !71, line: 133, type: !76)
!213 = !DILocation(line: 133, column: 9, scope: !211)
!214 = !DILocation(line: 135, column: 10, scope: !211)
!215 = !DILocation(line: 138, column: 10, scope: !211)
!216 = !DILocation(line: 139, column: 66, scope: !211)
!217 = !DILocation(line: 139, column: 5, scope: !211)
!218 = !DILocation(line: 140, column: 1, scope: !211)
!219 = distinct !DISubprogram(name: "goodB2G", scope: !71, file: !71, line: 145, type: !72, scopeLine: 146, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !74)
!220 = !DILocalVariable(name: "data", scope: !219, file: !71, line: 147, type: !76)
!221 = !DILocation(line: 147, column: 9, scope: !219)
!222 = !DILocation(line: 149, column: 10, scope: !219)
!223 = !DILocalVariable(name: "recvResult", scope: !224, file: !71, line: 155, type: !76)
!224 = distinct !DILexicalBlock(scope: !219, file: !71, line: 150, column: 5)
!225 = !DILocation(line: 155, column: 13, scope: !224)
!226 = !DILocalVariable(name: "service", scope: !224, file: !71, line: 156, type: !83)
!227 = !DILocation(line: 156, column: 28, scope: !224)
!228 = !DILocalVariable(name: "listenSocket", scope: !224, file: !71, line: 157, type: !76)
!229 = !DILocation(line: 157, column: 16, scope: !224)
!230 = !DILocalVariable(name: "acceptSocket", scope: !224, file: !71, line: 158, type: !76)
!231 = !DILocation(line: 158, column: 16, scope: !224)
!232 = !DILocalVariable(name: "inputBuffer", scope: !224, file: !71, line: 159, type: !60)
!233 = !DILocation(line: 159, column: 14, scope: !224)
!234 = !DILocation(line: 160, column: 9, scope: !224)
!235 = !DILocation(line: 170, column: 28, scope: !236)
!236 = distinct !DILexicalBlock(scope: !224, file: !71, line: 161, column: 9)
!237 = !DILocation(line: 170, column: 26, scope: !236)
!238 = !DILocation(line: 171, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !71, line: 171, column: 17)
!240 = !DILocation(line: 171, column: 30, scope: !239)
!241 = !DILocation(line: 171, column: 17, scope: !236)
!242 = !DILocation(line: 173, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !239, file: !71, line: 172, column: 13)
!244 = !DILocation(line: 175, column: 13, scope: !236)
!245 = !DILocation(line: 176, column: 21, scope: !236)
!246 = !DILocation(line: 176, column: 32, scope: !236)
!247 = !DILocation(line: 177, column: 21, scope: !236)
!248 = !DILocation(line: 177, column: 30, scope: !236)
!249 = !DILocation(line: 177, column: 37, scope: !236)
!250 = !DILocation(line: 178, column: 32, scope: !236)
!251 = !DILocation(line: 178, column: 21, scope: !236)
!252 = !DILocation(line: 178, column: 30, scope: !236)
!253 = !DILocation(line: 179, column: 22, scope: !254)
!254 = distinct !DILexicalBlock(scope: !236, file: !71, line: 179, column: 17)
!255 = !DILocation(line: 179, column: 36, scope: !254)
!256 = !DILocation(line: 179, column: 17, scope: !254)
!257 = !DILocation(line: 179, column: 81, scope: !254)
!258 = !DILocation(line: 179, column: 17, scope: !236)
!259 = !DILocation(line: 181, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !254, file: !71, line: 180, column: 13)
!261 = !DILocation(line: 183, column: 24, scope: !262)
!262 = distinct !DILexicalBlock(scope: !236, file: !71, line: 183, column: 17)
!263 = !DILocation(line: 183, column: 17, scope: !262)
!264 = !DILocation(line: 183, column: 54, scope: !262)
!265 = !DILocation(line: 183, column: 17, scope: !236)
!266 = !DILocation(line: 185, column: 17, scope: !267)
!267 = distinct !DILexicalBlock(scope: !262, file: !71, line: 184, column: 13)
!268 = !DILocation(line: 187, column: 35, scope: !236)
!269 = !DILocation(line: 187, column: 28, scope: !236)
!270 = !DILocation(line: 187, column: 26, scope: !236)
!271 = !DILocation(line: 188, column: 17, scope: !272)
!272 = distinct !DILexicalBlock(scope: !236, file: !71, line: 188, column: 17)
!273 = !DILocation(line: 188, column: 30, scope: !272)
!274 = !DILocation(line: 188, column: 17, scope: !236)
!275 = !DILocation(line: 190, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !71, line: 189, column: 13)
!277 = !DILocation(line: 193, column: 31, scope: !236)
!278 = !DILocation(line: 193, column: 45, scope: !236)
!279 = !DILocation(line: 193, column: 26, scope: !236)
!280 = !DILocation(line: 193, column: 24, scope: !236)
!281 = !DILocation(line: 194, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !236, file: !71, line: 194, column: 17)
!283 = !DILocation(line: 194, column: 28, scope: !282)
!284 = !DILocation(line: 194, column: 44, scope: !282)
!285 = !DILocation(line: 194, column: 47, scope: !282)
!286 = !DILocation(line: 194, column: 58, scope: !282)
!287 = !DILocation(line: 194, column: 17, scope: !236)
!288 = !DILocation(line: 196, column: 17, scope: !289)
!289 = distinct !DILexicalBlock(scope: !282, file: !71, line: 195, column: 13)
!290 = !DILocation(line: 199, column: 25, scope: !236)
!291 = !DILocation(line: 199, column: 13, scope: !236)
!292 = !DILocation(line: 199, column: 37, scope: !236)
!293 = !DILocation(line: 201, column: 25, scope: !236)
!294 = !DILocation(line: 201, column: 20, scope: !236)
!295 = !DILocation(line: 201, column: 18, scope: !236)
!296 = !DILocation(line: 202, column: 9, scope: !236)
!297 = !DILocation(line: 204, column: 13, scope: !298)
!298 = distinct !DILexicalBlock(scope: !224, file: !71, line: 204, column: 13)
!299 = !DILocation(line: 204, column: 26, scope: !298)
!300 = !DILocation(line: 204, column: 13, scope: !224)
!301 = !DILocation(line: 206, column: 26, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !71, line: 205, column: 9)
!303 = !DILocation(line: 206, column: 13, scope: !302)
!304 = !DILocation(line: 207, column: 9, scope: !302)
!305 = !DILocation(line: 208, column: 13, scope: !306)
!306 = distinct !DILexicalBlock(scope: !224, file: !71, line: 208, column: 13)
!307 = !DILocation(line: 208, column: 26, scope: !306)
!308 = !DILocation(line: 208, column: 13, scope: !224)
!309 = !DILocation(line: 210, column: 26, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !71, line: 209, column: 9)
!311 = !DILocation(line: 210, column: 13, scope: !310)
!312 = !DILocation(line: 211, column: 9, scope: !310)
!313 = !DILocation(line: 219, column: 66, scope: !219)
!314 = !DILocation(line: 219, column: 5, scope: !219)
!315 = !DILocation(line: 220, column: 1, scope: !219)
