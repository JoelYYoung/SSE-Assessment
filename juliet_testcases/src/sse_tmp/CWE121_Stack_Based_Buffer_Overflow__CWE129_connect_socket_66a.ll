; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !73, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !82, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !105, metadata !DIExpression()), !dbg !106
  store i32 -1, i32* %connectSocket, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  br label %do.body, !dbg !109

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !110
  store i32 %call, i32* %connectSocket, align 4, !dbg !112
  %0 = load i32, i32* %connectSocket, align 4, !dbg !113
  %cmp = icmp eq i32 %0, -1, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !117

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !119
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !120
  store i16 2, i16* %sin_family, align 4, !dbg !121
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !122
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !123
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !124
  store i32 %call1, i32* %s_addr, align 4, !dbg !125
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !126
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !127
  store i16 %call2, i16* %sin_port, align 2, !dbg !128
  %2 = load i32, i32* %connectSocket, align 4, !dbg !129
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !131
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !132
  %cmp4 = icmp eq i32 %call3, -1, !dbg !133
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !134

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !135

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !137
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !138
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !139
  %conv = trunc i64 %call7 to i32, !dbg !139
  store i32 %conv, i32* %recvResult, align 4, !dbg !140
  %5 = load i32, i32* %recvResult, align 4, !dbg !141
  %cmp8 = icmp eq i32 %5, -1, !dbg !143
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !144

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !145
  %cmp10 = icmp eq i32 %6, 0, !dbg !146
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !147

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !148

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !150
  %idxprom = sext i32 %7 to i64, !dbg !151
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !151
  store i8 0, i8* %arrayidx, align 1, !dbg !152
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !153
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !154
  store i32 %call15, i32* %data, align 4, !dbg !155
  br label %do.end, !dbg !156

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !157
  %cmp16 = icmp ne i32 %8, -1, !dbg !159
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !160

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !161
  %call19 = call i32 @close(i32 %9), !dbg !163
  br label %if.end20, !dbg !164

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !165
  %arrayidx21 = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !166
  store i32 %10, i32* %arrayidx21, align 8, !dbg !167
  %arraydecay22 = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !168
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66b_badSink(i32* %arraydecay22), !dbg !169
  ret void, !dbg !170
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #2

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66b_badSink(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66_good() #0 !dbg !171 {
entry:
  call void @goodG2B(), !dbg !172
  call void @goodB2G(), !dbg !173
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !175 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !180, metadata !DIExpression()), !dbg !181
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !182, metadata !DIExpression()), !dbg !183
  %call = call i64 @time(i64* null) #7, !dbg !184
  %conv = trunc i64 %call to i32, !dbg !185
  call void @srand(i32 %conv) #7, !dbg !186
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !187
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66_good(), !dbg !188
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !189
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !190
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66_bad(), !dbg !191
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !192
  ret i32 0, !dbg !193
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !194 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !197, metadata !DIExpression()), !dbg !198
  store i32 -1, i32* %data, align 4, !dbg !199
  store i32 7, i32* %data, align 4, !dbg !200
  %0 = load i32, i32* %data, align 4, !dbg !201
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !202
  store i32 %0, i32* %arrayidx, align 8, !dbg !203
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !204
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66b_goodG2BSink(i32* %arraydecay), !dbg !205
  ret void, !dbg !206
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66b_goodG2BSink(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !207 {
entry:
  %data = alloca i32, align 4
  %dataArray = alloca [5 x i32], align 16
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata [5 x i32]* %dataArray, metadata !210, metadata !DIExpression()), !dbg !211
  store i32 -1, i32* %data, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !213, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 -1, i32* %connectSocket, align 4, !dbg !219
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !220, metadata !DIExpression()), !dbg !221
  br label %do.body, !dbg !222

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !223
  store i32 %call, i32* %connectSocket, align 4, !dbg !225
  %0 = load i32, i32* %connectSocket, align 4, !dbg !226
  %cmp = icmp eq i32 %0, -1, !dbg !228
  br i1 %cmp, label %if.then, label %if.end, !dbg !229

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !230

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !232
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !232
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !233
  store i16 2, i16* %sin_family, align 4, !dbg !234
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !235
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !236
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !237
  store i32 %call1, i32* %s_addr, align 4, !dbg !238
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !239
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !240
  store i16 %call2, i16* %sin_port, align 2, !dbg !241
  %2 = load i32, i32* %connectSocket, align 4, !dbg !242
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !244
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !245
  %cmp4 = icmp eq i32 %call3, -1, !dbg !246
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !247

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !248

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !250
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !251
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !252
  %conv = trunc i64 %call7 to i32, !dbg !252
  store i32 %conv, i32* %recvResult, align 4, !dbg !253
  %5 = load i32, i32* %recvResult, align 4, !dbg !254
  %cmp8 = icmp eq i32 %5, -1, !dbg !256
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !257

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !258
  %cmp10 = icmp eq i32 %6, 0, !dbg !259
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !260

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !261

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !263
  %idxprom = sext i32 %7 to i64, !dbg !264
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !264
  store i8 0, i8* %arrayidx, align 1, !dbg !265
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !266
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !267
  store i32 %call15, i32* %data, align 4, !dbg !268
  br label %do.end, !dbg !269

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !270
  %cmp16 = icmp ne i32 %8, -1, !dbg !272
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !273

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !274
  %call19 = call i32 @close(i32 %9), !dbg !276
  br label %if.end20, !dbg !277

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !278
  %arrayidx21 = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 2, !dbg !279
  store i32 %10, i32* %arrayidx21, align 8, !dbg !280
  %arraydecay22 = getelementptr inbounds [5 x i32], [5 x i32]* %dataArray, i64 0, i64 0, !dbg !281
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66b_goodB2GSink(i32* %arraydecay22), !dbg !282
  ret void, !dbg !283
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66b_goodB2GSink(i32*) #5

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
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !5}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !48, line: 178, size: 128, elements: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!49 = !{!50, !54}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !47, file: !48, line: 180, baseType: !51, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !52, line: 28, baseType: !53)
!52 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!53 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !47, file: !48, line: 181, baseType: !55, size: 112, offset: 16)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 112, elements: !57)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !{!58}
!58 = !DISubrange(count: 14)
!59 = !{i32 7, !"Dwarf Version", i32 4}
!60 = !{i32 2, !"Debug Info Version", i32 3}
!61 = !{i32 1, !"wchar_size", i32 4}
!62 = !{i32 7, !"uwtable", i32 1}
!63 = !{i32 7, !"frame-pointer", i32 2}
!64 = !{!"clang version 13.0.0"}
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66_bad", scope: !66, file: !66, line: 47, type: !67, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66a.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 49, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 49, column: 9, scope: !65)
!73 = !DILocalVariable(name: "dataArray", scope: !65, file: !66, line: 50, type: !74)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 160, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 5)
!77 = !DILocation(line: 50, column: 9, scope: !65)
!78 = !DILocation(line: 52, column: 10, scope: !65)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !66, line: 58, type: !71)
!80 = distinct !DILexicalBlock(scope: !65, file: !66, line: 53, column: 5)
!81 = !DILocation(line: 58, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !66, line: 59, type: !83)
!83 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !84)
!84 = !{!85, !86, !92, !99}
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !83, file: !17, line: 240, baseType: !51, size: 16)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !83, file: !17, line: 241, baseType: !87, size: 16, offset: 16)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !89, line: 25, baseType: !90)
!89 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !91, line: 40, baseType: !53)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !83, file: !17, line: 242, baseType: !93, size: 32, offset: 32)
!93 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !94)
!94 = !{!95}
!95 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !93, file: !17, line: 33, baseType: !96, size: 32)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !89, line: 26, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !91, line: 42, baseType: !5)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !83, file: !17, line: 245, baseType: !100, size: 64, offset: 64)
!100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !101, size: 64, elements: !102)
!101 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!102 = !{!103}
!103 = !DISubrange(count: 8)
!104 = !DILocation(line: 59, column: 28, scope: !80)
!105 = !DILocalVariable(name: "connectSocket", scope: !80, file: !66, line: 60, type: !71)
!106 = !DILocation(line: 60, column: 16, scope: !80)
!107 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !66, line: 61, type: !55)
!108 = !DILocation(line: 61, column: 14, scope: !80)
!109 = !DILocation(line: 62, column: 9, scope: !80)
!110 = !DILocation(line: 72, column: 29, scope: !111)
!111 = distinct !DILexicalBlock(scope: !80, file: !66, line: 63, column: 9)
!112 = !DILocation(line: 72, column: 27, scope: !111)
!113 = !DILocation(line: 73, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !66, line: 73, column: 17)
!115 = !DILocation(line: 73, column: 31, scope: !114)
!116 = !DILocation(line: 73, column: 17, scope: !111)
!117 = !DILocation(line: 75, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !66, line: 74, column: 13)
!119 = !DILocation(line: 77, column: 13, scope: !111)
!120 = !DILocation(line: 78, column: 21, scope: !111)
!121 = !DILocation(line: 78, column: 32, scope: !111)
!122 = !DILocation(line: 79, column: 39, scope: !111)
!123 = !DILocation(line: 79, column: 21, scope: !111)
!124 = !DILocation(line: 79, column: 30, scope: !111)
!125 = !DILocation(line: 79, column: 37, scope: !111)
!126 = !DILocation(line: 80, column: 32, scope: !111)
!127 = !DILocation(line: 80, column: 21, scope: !111)
!128 = !DILocation(line: 80, column: 30, scope: !111)
!129 = !DILocation(line: 81, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !111, file: !66, line: 81, column: 17)
!131 = !DILocation(line: 81, column: 40, scope: !130)
!132 = !DILocation(line: 81, column: 17, scope: !130)
!133 = !DILocation(line: 81, column: 85, scope: !130)
!134 = !DILocation(line: 81, column: 17, scope: !111)
!135 = !DILocation(line: 83, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !66, line: 82, column: 13)
!137 = !DILocation(line: 87, column: 31, scope: !111)
!138 = !DILocation(line: 87, column: 46, scope: !111)
!139 = !DILocation(line: 87, column: 26, scope: !111)
!140 = !DILocation(line: 87, column: 24, scope: !111)
!141 = !DILocation(line: 88, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !111, file: !66, line: 88, column: 17)
!143 = !DILocation(line: 88, column: 28, scope: !142)
!144 = !DILocation(line: 88, column: 44, scope: !142)
!145 = !DILocation(line: 88, column: 47, scope: !142)
!146 = !DILocation(line: 88, column: 58, scope: !142)
!147 = !DILocation(line: 88, column: 17, scope: !111)
!148 = !DILocation(line: 90, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !142, file: !66, line: 89, column: 13)
!150 = !DILocation(line: 93, column: 25, scope: !111)
!151 = !DILocation(line: 93, column: 13, scope: !111)
!152 = !DILocation(line: 93, column: 37, scope: !111)
!153 = !DILocation(line: 95, column: 25, scope: !111)
!154 = !DILocation(line: 95, column: 20, scope: !111)
!155 = !DILocation(line: 95, column: 18, scope: !111)
!156 = !DILocation(line: 96, column: 9, scope: !111)
!157 = !DILocation(line: 98, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !80, file: !66, line: 98, column: 13)
!159 = !DILocation(line: 98, column: 27, scope: !158)
!160 = !DILocation(line: 98, column: 13, scope: !80)
!161 = !DILocation(line: 100, column: 26, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !66, line: 99, column: 9)
!163 = !DILocation(line: 100, column: 13, scope: !162)
!164 = !DILocation(line: 101, column: 9, scope: !162)
!165 = !DILocation(line: 110, column: 20, scope: !65)
!166 = !DILocation(line: 110, column: 5, scope: !65)
!167 = !DILocation(line: 110, column: 18, scope: !65)
!168 = !DILocation(line: 111, column: 75, scope: !65)
!169 = !DILocation(line: 111, column: 5, scope: !65)
!170 = !DILocation(line: 112, column: 1, scope: !65)
!171 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_66_good", scope: !66, file: !66, line: 203, type: !67, scopeLine: 204, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!172 = !DILocation(line: 205, column: 5, scope: !171)
!173 = !DILocation(line: 206, column: 5, scope: !171)
!174 = !DILocation(line: 207, column: 1, scope: !171)
!175 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 218, type: !176, scopeLine: 219, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!176 = !DISubroutineType(types: !177)
!177 = !{!71, !71, !178}
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!180 = !DILocalVariable(name: "argc", arg: 1, scope: !175, file: !66, line: 218, type: !71)
!181 = !DILocation(line: 218, column: 14, scope: !175)
!182 = !DILocalVariable(name: "argv", arg: 2, scope: !175, file: !66, line: 218, type: !178)
!183 = !DILocation(line: 218, column: 27, scope: !175)
!184 = !DILocation(line: 221, column: 22, scope: !175)
!185 = !DILocation(line: 221, column: 12, scope: !175)
!186 = !DILocation(line: 221, column: 5, scope: !175)
!187 = !DILocation(line: 223, column: 5, scope: !175)
!188 = !DILocation(line: 224, column: 5, scope: !175)
!189 = !DILocation(line: 225, column: 5, scope: !175)
!190 = !DILocation(line: 228, column: 5, scope: !175)
!191 = !DILocation(line: 229, column: 5, scope: !175)
!192 = !DILocation(line: 230, column: 5, scope: !175)
!193 = !DILocation(line: 232, column: 5, scope: !175)
!194 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 121, type: !67, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!195 = !DILocalVariable(name: "data", scope: !194, file: !66, line: 123, type: !71)
!196 = !DILocation(line: 123, column: 9, scope: !194)
!197 = !DILocalVariable(name: "dataArray", scope: !194, file: !66, line: 124, type: !74)
!198 = !DILocation(line: 124, column: 9, scope: !194)
!199 = !DILocation(line: 126, column: 10, scope: !194)
!200 = !DILocation(line: 129, column: 10, scope: !194)
!201 = !DILocation(line: 130, column: 20, scope: !194)
!202 = !DILocation(line: 130, column: 5, scope: !194)
!203 = !DILocation(line: 130, column: 18, scope: !194)
!204 = !DILocation(line: 131, column: 79, scope: !194)
!205 = !DILocation(line: 131, column: 5, scope: !194)
!206 = !DILocation(line: 132, column: 1, scope: !194)
!207 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 137, type: !67, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!208 = !DILocalVariable(name: "data", scope: !207, file: !66, line: 139, type: !71)
!209 = !DILocation(line: 139, column: 9, scope: !207)
!210 = !DILocalVariable(name: "dataArray", scope: !207, file: !66, line: 140, type: !74)
!211 = !DILocation(line: 140, column: 9, scope: !207)
!212 = !DILocation(line: 142, column: 10, scope: !207)
!213 = !DILocalVariable(name: "recvResult", scope: !214, file: !66, line: 148, type: !71)
!214 = distinct !DILexicalBlock(scope: !207, file: !66, line: 143, column: 5)
!215 = !DILocation(line: 148, column: 13, scope: !214)
!216 = !DILocalVariable(name: "service", scope: !214, file: !66, line: 149, type: !83)
!217 = !DILocation(line: 149, column: 28, scope: !214)
!218 = !DILocalVariable(name: "connectSocket", scope: !214, file: !66, line: 150, type: !71)
!219 = !DILocation(line: 150, column: 16, scope: !214)
!220 = !DILocalVariable(name: "inputBuffer", scope: !214, file: !66, line: 151, type: !55)
!221 = !DILocation(line: 151, column: 14, scope: !214)
!222 = !DILocation(line: 152, column: 9, scope: !214)
!223 = !DILocation(line: 162, column: 29, scope: !224)
!224 = distinct !DILexicalBlock(scope: !214, file: !66, line: 153, column: 9)
!225 = !DILocation(line: 162, column: 27, scope: !224)
!226 = !DILocation(line: 163, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !66, line: 163, column: 17)
!228 = !DILocation(line: 163, column: 31, scope: !227)
!229 = !DILocation(line: 163, column: 17, scope: !224)
!230 = !DILocation(line: 165, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !227, file: !66, line: 164, column: 13)
!232 = !DILocation(line: 167, column: 13, scope: !224)
!233 = !DILocation(line: 168, column: 21, scope: !224)
!234 = !DILocation(line: 168, column: 32, scope: !224)
!235 = !DILocation(line: 169, column: 39, scope: !224)
!236 = !DILocation(line: 169, column: 21, scope: !224)
!237 = !DILocation(line: 169, column: 30, scope: !224)
!238 = !DILocation(line: 169, column: 37, scope: !224)
!239 = !DILocation(line: 170, column: 32, scope: !224)
!240 = !DILocation(line: 170, column: 21, scope: !224)
!241 = !DILocation(line: 170, column: 30, scope: !224)
!242 = !DILocation(line: 171, column: 25, scope: !243)
!243 = distinct !DILexicalBlock(scope: !224, file: !66, line: 171, column: 17)
!244 = !DILocation(line: 171, column: 40, scope: !243)
!245 = !DILocation(line: 171, column: 17, scope: !243)
!246 = !DILocation(line: 171, column: 85, scope: !243)
!247 = !DILocation(line: 171, column: 17, scope: !224)
!248 = !DILocation(line: 173, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !243, file: !66, line: 172, column: 13)
!250 = !DILocation(line: 177, column: 31, scope: !224)
!251 = !DILocation(line: 177, column: 46, scope: !224)
!252 = !DILocation(line: 177, column: 26, scope: !224)
!253 = !DILocation(line: 177, column: 24, scope: !224)
!254 = !DILocation(line: 178, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !224, file: !66, line: 178, column: 17)
!256 = !DILocation(line: 178, column: 28, scope: !255)
!257 = !DILocation(line: 178, column: 44, scope: !255)
!258 = !DILocation(line: 178, column: 47, scope: !255)
!259 = !DILocation(line: 178, column: 58, scope: !255)
!260 = !DILocation(line: 178, column: 17, scope: !224)
!261 = !DILocation(line: 180, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !255, file: !66, line: 179, column: 13)
!263 = !DILocation(line: 183, column: 25, scope: !224)
!264 = !DILocation(line: 183, column: 13, scope: !224)
!265 = !DILocation(line: 183, column: 37, scope: !224)
!266 = !DILocation(line: 185, column: 25, scope: !224)
!267 = !DILocation(line: 185, column: 20, scope: !224)
!268 = !DILocation(line: 185, column: 18, scope: !224)
!269 = !DILocation(line: 186, column: 9, scope: !224)
!270 = !DILocation(line: 188, column: 13, scope: !271)
!271 = distinct !DILexicalBlock(scope: !214, file: !66, line: 188, column: 13)
!272 = !DILocation(line: 188, column: 27, scope: !271)
!273 = !DILocation(line: 188, column: 13, scope: !214)
!274 = !DILocation(line: 190, column: 26, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !66, line: 189, column: 9)
!276 = !DILocation(line: 190, column: 13, scope: !275)
!277 = !DILocation(line: 191, column: 9, scope: !275)
!278 = !DILocation(line: 199, column: 20, scope: !207)
!279 = !DILocation(line: 199, column: 5, scope: !207)
!280 = !DILocation(line: 199, column: 18, scope: !207)
!281 = !DILocation(line: 200, column: 79, scope: !207)
!282 = !DILocation(line: 200, column: 5, scope: !207)
!283 = !DILocation(line: 201, column: 1, scope: !207)
