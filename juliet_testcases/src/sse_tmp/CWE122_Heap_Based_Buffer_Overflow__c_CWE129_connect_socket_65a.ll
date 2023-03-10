; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65a.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !73, metadata !DIExpression()), !dbg !77
  store void (i32)* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65b_badSink, void (i32)** %funcPtr, align 8, !dbg !77
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
  %10 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !165
  %11 = load i32, i32* %data, align 4, !dbg !166
  call void %10(i32 %11), !dbg !165
  ret void, !dbg !167
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65b_badSink(i32) #2

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #3

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #5

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #2

declare dso_local i64 @recv(i32, i8*, i64, i32) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65_good() #0 !dbg !168 {
entry:
  call void @goodG2B(), !dbg !169
  call void @goodB2G(), !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !172 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !177, metadata !DIExpression()), !dbg !178
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !179, metadata !DIExpression()), !dbg !180
  %call = call i64 @time(i64* null) #7, !dbg !181
  %conv = trunc i64 %call to i32, !dbg !182
  call void @srand(i32 %conv) #7, !dbg !183
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !184
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65_good(), !dbg !185
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !186
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !187
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65_bad(), !dbg !188
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !189
  ret i32 0, !dbg !190
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !191 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !192, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !194, metadata !DIExpression()), !dbg !195
  store void (i32)* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65b_goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !195
  store i32 -1, i32* %data, align 4, !dbg !196
  store i32 7, i32* %data, align 4, !dbg !197
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !198
  %1 = load i32, i32* %data, align 4, !dbg !199
  call void %0(i32 %1), !dbg !198
  ret void, !dbg !200
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65b_goodG2BSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !201 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !202, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !204, metadata !DIExpression()), !dbg !205
  store void (i32)* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65b_goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !207, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 -1, i32* %connectSocket, align 4, !dbg !213
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !214, metadata !DIExpression()), !dbg !215
  br label %do.body, !dbg !216

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !217
  store i32 %call, i32* %connectSocket, align 4, !dbg !219
  %0 = load i32, i32* %connectSocket, align 4, !dbg !220
  %cmp = icmp eq i32 %0, -1, !dbg !222
  br i1 %cmp, label %if.then, label %if.end, !dbg !223

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !224

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !226
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !226
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !227
  store i16 2, i16* %sin_family, align 4, !dbg !228
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !229
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !230
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !231
  store i32 %call1, i32* %s_addr, align 4, !dbg !232
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !233
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !234
  store i16 %call2, i16* %sin_port, align 2, !dbg !235
  %2 = load i32, i32* %connectSocket, align 4, !dbg !236
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !238
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !239
  %cmp4 = icmp eq i32 %call3, -1, !dbg !240
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !241

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !242

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !244
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !245
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !246
  %conv = trunc i64 %call7 to i32, !dbg !246
  store i32 %conv, i32* %recvResult, align 4, !dbg !247
  %5 = load i32, i32* %recvResult, align 4, !dbg !248
  %cmp8 = icmp eq i32 %5, -1, !dbg !250
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !251

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !252
  %cmp10 = icmp eq i32 %6, 0, !dbg !253
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !254

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !255

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !257
  %idxprom = sext i32 %7 to i64, !dbg !258
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !258
  store i8 0, i8* %arrayidx, align 1, !dbg !259
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !260
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !261
  store i32 %call15, i32* %data, align 4, !dbg !262
  br label %do.end, !dbg !263

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !264
  %cmp16 = icmp ne i32 %8, -1, !dbg !266
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !267

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !268
  %call19 = call i32 @close(i32 %9), !dbg !270
  br label %if.end20, !dbg !271

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !272
  %11 = load i32, i32* %data, align 4, !dbg !273
  call void %10(i32 %11), !dbg !272
  ret void, !dbg !274
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65b_goodB2GSink(i32) #2

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
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65a.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65_bad", scope: !66, file: !66, line: 47, type: !67, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65a.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 49, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 49, column: 9, scope: !65)
!73 = !DILocalVariable(name: "funcPtr", scope: !65, file: !66, line: 51, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DISubroutineType(types: !76)
!76 = !{null, !71}
!77 = !DILocation(line: 51, column: 12, scope: !65)
!78 = !DILocation(line: 53, column: 10, scope: !65)
!79 = !DILocalVariable(name: "recvResult", scope: !80, file: !66, line: 59, type: !71)
!80 = distinct !DILexicalBlock(scope: !65, file: !66, line: 54, column: 5)
!81 = !DILocation(line: 59, column: 13, scope: !80)
!82 = !DILocalVariable(name: "service", scope: !80, file: !66, line: 60, type: !83)
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
!104 = !DILocation(line: 60, column: 28, scope: !80)
!105 = !DILocalVariable(name: "connectSocket", scope: !80, file: !66, line: 61, type: !71)
!106 = !DILocation(line: 61, column: 16, scope: !80)
!107 = !DILocalVariable(name: "inputBuffer", scope: !80, file: !66, line: 62, type: !55)
!108 = !DILocation(line: 62, column: 14, scope: !80)
!109 = !DILocation(line: 63, column: 9, scope: !80)
!110 = !DILocation(line: 73, column: 29, scope: !111)
!111 = distinct !DILexicalBlock(scope: !80, file: !66, line: 64, column: 9)
!112 = !DILocation(line: 73, column: 27, scope: !111)
!113 = !DILocation(line: 74, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !66, line: 74, column: 17)
!115 = !DILocation(line: 74, column: 31, scope: !114)
!116 = !DILocation(line: 74, column: 17, scope: !111)
!117 = !DILocation(line: 76, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !66, line: 75, column: 13)
!119 = !DILocation(line: 78, column: 13, scope: !111)
!120 = !DILocation(line: 79, column: 21, scope: !111)
!121 = !DILocation(line: 79, column: 32, scope: !111)
!122 = !DILocation(line: 80, column: 39, scope: !111)
!123 = !DILocation(line: 80, column: 21, scope: !111)
!124 = !DILocation(line: 80, column: 30, scope: !111)
!125 = !DILocation(line: 80, column: 37, scope: !111)
!126 = !DILocation(line: 81, column: 32, scope: !111)
!127 = !DILocation(line: 81, column: 21, scope: !111)
!128 = !DILocation(line: 81, column: 30, scope: !111)
!129 = !DILocation(line: 82, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !111, file: !66, line: 82, column: 17)
!131 = !DILocation(line: 82, column: 40, scope: !130)
!132 = !DILocation(line: 82, column: 17, scope: !130)
!133 = !DILocation(line: 82, column: 85, scope: !130)
!134 = !DILocation(line: 82, column: 17, scope: !111)
!135 = !DILocation(line: 84, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !66, line: 83, column: 13)
!137 = !DILocation(line: 88, column: 31, scope: !111)
!138 = !DILocation(line: 88, column: 46, scope: !111)
!139 = !DILocation(line: 88, column: 26, scope: !111)
!140 = !DILocation(line: 88, column: 24, scope: !111)
!141 = !DILocation(line: 89, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !111, file: !66, line: 89, column: 17)
!143 = !DILocation(line: 89, column: 28, scope: !142)
!144 = !DILocation(line: 89, column: 44, scope: !142)
!145 = !DILocation(line: 89, column: 47, scope: !142)
!146 = !DILocation(line: 89, column: 58, scope: !142)
!147 = !DILocation(line: 89, column: 17, scope: !111)
!148 = !DILocation(line: 91, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !142, file: !66, line: 90, column: 13)
!150 = !DILocation(line: 94, column: 25, scope: !111)
!151 = !DILocation(line: 94, column: 13, scope: !111)
!152 = !DILocation(line: 94, column: 37, scope: !111)
!153 = !DILocation(line: 96, column: 25, scope: !111)
!154 = !DILocation(line: 96, column: 20, scope: !111)
!155 = !DILocation(line: 96, column: 18, scope: !111)
!156 = !DILocation(line: 97, column: 9, scope: !111)
!157 = !DILocation(line: 99, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !80, file: !66, line: 99, column: 13)
!159 = !DILocation(line: 99, column: 27, scope: !158)
!160 = !DILocation(line: 99, column: 13, scope: !80)
!161 = !DILocation(line: 101, column: 26, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !66, line: 100, column: 9)
!163 = !DILocation(line: 101, column: 13, scope: !162)
!164 = !DILocation(line: 102, column: 9, scope: !162)
!165 = !DILocation(line: 111, column: 5, scope: !65)
!166 = !DILocation(line: 111, column: 13, scope: !65)
!167 = !DILocation(line: 112, column: 1, scope: !65)
!168 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_65_good", scope: !66, file: !66, line: 201, type: !67, scopeLine: 202, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!169 = !DILocation(line: 203, column: 5, scope: !168)
!170 = !DILocation(line: 204, column: 5, scope: !168)
!171 = !DILocation(line: 205, column: 1, scope: !168)
!172 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 216, type: !173, scopeLine: 217, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!173 = !DISubroutineType(types: !174)
!174 = !{!71, !71, !175}
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!177 = !DILocalVariable(name: "argc", arg: 1, scope: !172, file: !66, line: 216, type: !71)
!178 = !DILocation(line: 216, column: 14, scope: !172)
!179 = !DILocalVariable(name: "argv", arg: 2, scope: !172, file: !66, line: 216, type: !175)
!180 = !DILocation(line: 216, column: 27, scope: !172)
!181 = !DILocation(line: 219, column: 22, scope: !172)
!182 = !DILocation(line: 219, column: 12, scope: !172)
!183 = !DILocation(line: 219, column: 5, scope: !172)
!184 = !DILocation(line: 221, column: 5, scope: !172)
!185 = !DILocation(line: 222, column: 5, scope: !172)
!186 = !DILocation(line: 223, column: 5, scope: !172)
!187 = !DILocation(line: 226, column: 5, scope: !172)
!188 = !DILocation(line: 227, column: 5, scope: !172)
!189 = !DILocation(line: 228, column: 5, scope: !172)
!190 = !DILocation(line: 230, column: 5, scope: !172)
!191 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 121, type: !67, scopeLine: 122, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!192 = !DILocalVariable(name: "data", scope: !191, file: !66, line: 123, type: !71)
!193 = !DILocation(line: 123, column: 9, scope: !191)
!194 = !DILocalVariable(name: "funcPtr", scope: !191, file: !66, line: 124, type: !74)
!195 = !DILocation(line: 124, column: 12, scope: !191)
!196 = !DILocation(line: 126, column: 10, scope: !191)
!197 = !DILocation(line: 129, column: 10, scope: !191)
!198 = !DILocation(line: 130, column: 5, scope: !191)
!199 = !DILocation(line: 130, column: 13, scope: !191)
!200 = !DILocation(line: 131, column: 1, scope: !191)
!201 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 136, type: !67, scopeLine: 137, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!202 = !DILocalVariable(name: "data", scope: !201, file: !66, line: 138, type: !71)
!203 = !DILocation(line: 138, column: 9, scope: !201)
!204 = !DILocalVariable(name: "funcPtr", scope: !201, file: !66, line: 139, type: !74)
!205 = !DILocation(line: 139, column: 12, scope: !201)
!206 = !DILocation(line: 141, column: 10, scope: !201)
!207 = !DILocalVariable(name: "recvResult", scope: !208, file: !66, line: 147, type: !71)
!208 = distinct !DILexicalBlock(scope: !201, file: !66, line: 142, column: 5)
!209 = !DILocation(line: 147, column: 13, scope: !208)
!210 = !DILocalVariable(name: "service", scope: !208, file: !66, line: 148, type: !83)
!211 = !DILocation(line: 148, column: 28, scope: !208)
!212 = !DILocalVariable(name: "connectSocket", scope: !208, file: !66, line: 149, type: !71)
!213 = !DILocation(line: 149, column: 16, scope: !208)
!214 = !DILocalVariable(name: "inputBuffer", scope: !208, file: !66, line: 150, type: !55)
!215 = !DILocation(line: 150, column: 14, scope: !208)
!216 = !DILocation(line: 151, column: 9, scope: !208)
!217 = !DILocation(line: 161, column: 29, scope: !218)
!218 = distinct !DILexicalBlock(scope: !208, file: !66, line: 152, column: 9)
!219 = !DILocation(line: 161, column: 27, scope: !218)
!220 = !DILocation(line: 162, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !66, line: 162, column: 17)
!222 = !DILocation(line: 162, column: 31, scope: !221)
!223 = !DILocation(line: 162, column: 17, scope: !218)
!224 = !DILocation(line: 164, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !66, line: 163, column: 13)
!226 = !DILocation(line: 166, column: 13, scope: !218)
!227 = !DILocation(line: 167, column: 21, scope: !218)
!228 = !DILocation(line: 167, column: 32, scope: !218)
!229 = !DILocation(line: 168, column: 39, scope: !218)
!230 = !DILocation(line: 168, column: 21, scope: !218)
!231 = !DILocation(line: 168, column: 30, scope: !218)
!232 = !DILocation(line: 168, column: 37, scope: !218)
!233 = !DILocation(line: 169, column: 32, scope: !218)
!234 = !DILocation(line: 169, column: 21, scope: !218)
!235 = !DILocation(line: 169, column: 30, scope: !218)
!236 = !DILocation(line: 170, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !218, file: !66, line: 170, column: 17)
!238 = !DILocation(line: 170, column: 40, scope: !237)
!239 = !DILocation(line: 170, column: 17, scope: !237)
!240 = !DILocation(line: 170, column: 85, scope: !237)
!241 = !DILocation(line: 170, column: 17, scope: !218)
!242 = !DILocation(line: 172, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !237, file: !66, line: 171, column: 13)
!244 = !DILocation(line: 176, column: 31, scope: !218)
!245 = !DILocation(line: 176, column: 46, scope: !218)
!246 = !DILocation(line: 176, column: 26, scope: !218)
!247 = !DILocation(line: 176, column: 24, scope: !218)
!248 = !DILocation(line: 177, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !218, file: !66, line: 177, column: 17)
!250 = !DILocation(line: 177, column: 28, scope: !249)
!251 = !DILocation(line: 177, column: 44, scope: !249)
!252 = !DILocation(line: 177, column: 47, scope: !249)
!253 = !DILocation(line: 177, column: 58, scope: !249)
!254 = !DILocation(line: 177, column: 17, scope: !218)
!255 = !DILocation(line: 179, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !249, file: !66, line: 178, column: 13)
!257 = !DILocation(line: 182, column: 25, scope: !218)
!258 = !DILocation(line: 182, column: 13, scope: !218)
!259 = !DILocation(line: 182, column: 37, scope: !218)
!260 = !DILocation(line: 184, column: 25, scope: !218)
!261 = !DILocation(line: 184, column: 20, scope: !218)
!262 = !DILocation(line: 184, column: 18, scope: !218)
!263 = !DILocation(line: 185, column: 9, scope: !218)
!264 = !DILocation(line: 187, column: 13, scope: !265)
!265 = distinct !DILexicalBlock(scope: !208, file: !66, line: 187, column: 13)
!266 = !DILocation(line: 187, column: 27, scope: !265)
!267 = !DILocation(line: 187, column: 13, scope: !208)
!268 = !DILocation(line: 189, column: 26, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !66, line: 188, column: 9)
!270 = !DILocation(line: 189, column: 13, scope: !269)
!271 = !DILocation(line: 190, column: 9, scope: !269)
!272 = !DILocation(line: 198, column: 5, scope: !201)
!273 = !DILocation(line: 198, column: 13, scope: !201)
!274 = !DILocation(line: 199, column: 1, scope: !201)
