; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63a.c"
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63_bad() #0 !dbg !65 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !70, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %data, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !74, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !77, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !100, metadata !DIExpression()), !dbg !101
  store i32 -1, i32* %connectSocket, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  br label %do.body, !dbg !104

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !105
  store i32 %call, i32* %connectSocket, align 4, !dbg !107
  %0 = load i32, i32* %connectSocket, align 4, !dbg !108
  %cmp = icmp eq i32 %0, -1, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !112

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !114
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !115
  store i16 2, i16* %sin_family, align 4, !dbg !116
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !117
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !118
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !119
  store i32 %call1, i32* %s_addr, align 4, !dbg !120
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !121
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !122
  store i16 %call2, i16* %sin_port, align 2, !dbg !123
  %2 = load i32, i32* %connectSocket, align 4, !dbg !124
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !126
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !127
  %cmp4 = icmp eq i32 %call3, -1, !dbg !128
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !129

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !130

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !132
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !133
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !134
  %conv = trunc i64 %call7 to i32, !dbg !134
  store i32 %conv, i32* %recvResult, align 4, !dbg !135
  %5 = load i32, i32* %recvResult, align 4, !dbg !136
  %cmp8 = icmp eq i32 %5, -1, !dbg !138
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !139

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !140
  %cmp10 = icmp eq i32 %6, 0, !dbg !141
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !142

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !143

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !145
  %idxprom = sext i32 %7 to i64, !dbg !146
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !146
  store i8 0, i8* %arrayidx, align 1, !dbg !147
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !148
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !149
  store i32 %call15, i32* %data, align 4, !dbg !150
  br label %do.end, !dbg !151

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !152
  %cmp16 = icmp ne i32 %8, -1, !dbg !154
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !155

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !156
  %call19 = call i32 @close(i32 %9), !dbg !158
  br label %if.end20, !dbg !159

if.end20:                                         ; preds = %if.then18, %do.end
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63b_badSink(i32* %data), !dbg !160
  ret void, !dbg !161
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

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63b_badSink(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63_good() #0 !dbg !162 {
entry:
  call void @goodG2B(), !dbg !163
  call void @goodB2G(), !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !166 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !171, metadata !DIExpression()), !dbg !172
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !173, metadata !DIExpression()), !dbg !174
  %call = call i64 @time(i64* null) #7, !dbg !175
  %conv = trunc i64 %call to i32, !dbg !176
  call void @srand(i32 %conv) #7, !dbg !177
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !178
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63_good(), !dbg !179
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !180
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !181
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63_bad(), !dbg !182
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !183
  ret i32 0, !dbg !184
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !185 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !186, metadata !DIExpression()), !dbg !187
  store i32 -1, i32* %data, align 4, !dbg !188
  store i32 7, i32* %data, align 4, !dbg !189
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63b_goodG2BSink(i32* %data), !dbg !190
  ret void, !dbg !191
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63b_goodG2BSink(i32*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !192 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !193, metadata !DIExpression()), !dbg !194
  store i32 -1, i32* %data, align 4, !dbg !195
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !196, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !201, metadata !DIExpression()), !dbg !202
  store i32 -1, i32* %connectSocket, align 4, !dbg !202
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !203, metadata !DIExpression()), !dbg !204
  br label %do.body, !dbg !205

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !206
  store i32 %call, i32* %connectSocket, align 4, !dbg !208
  %0 = load i32, i32* %connectSocket, align 4, !dbg !209
  %cmp = icmp eq i32 %0, -1, !dbg !211
  br i1 %cmp, label %if.then, label %if.end, !dbg !212

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !213

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !215
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !215
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !216
  store i16 2, i16* %sin_family, align 4, !dbg !217
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !218
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !219
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !220
  store i32 %call1, i32* %s_addr, align 4, !dbg !221
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !222
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !223
  store i16 %call2, i16* %sin_port, align 2, !dbg !224
  %2 = load i32, i32* %connectSocket, align 4, !dbg !225
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !227
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !228
  %cmp4 = icmp eq i32 %call3, -1, !dbg !229
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !230

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !231

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !233
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !234
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !235
  %conv = trunc i64 %call7 to i32, !dbg !235
  store i32 %conv, i32* %recvResult, align 4, !dbg !236
  %5 = load i32, i32* %recvResult, align 4, !dbg !237
  %cmp8 = icmp eq i32 %5, -1, !dbg !239
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !240

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !241
  %cmp10 = icmp eq i32 %6, 0, !dbg !242
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !243

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !244

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !246
  %idxprom = sext i32 %7 to i64, !dbg !247
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !247
  store i8 0, i8* %arrayidx, align 1, !dbg !248
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !249
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !250
  store i32 %call15, i32* %data, align 4, !dbg !251
  br label %do.end, !dbg !252

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !253
  %cmp16 = icmp ne i32 %8, -1, !dbg !255
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !256

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !257
  %call19 = call i32 @close(i32 %9), !dbg !259
  br label %if.end20, !dbg !260

if.end20:                                         ; preds = %if.then18, %do.end
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63b_goodB2GSink(i32* %data), !dbg !261
  ret void, !dbg !262
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63b_goodB2GSink(i32*) #5

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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63a.c", directory: "/home/joelyang/SSE-Assessment")
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
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63_bad", scope: !66, file: !66, line: 47, type: !67, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63a.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{}
!70 = !DILocalVariable(name: "data", scope: !65, file: !66, line: 49, type: !71)
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocation(line: 49, column: 9, scope: !65)
!73 = !DILocation(line: 51, column: 10, scope: !65)
!74 = !DILocalVariable(name: "recvResult", scope: !75, file: !66, line: 57, type: !71)
!75 = distinct !DILexicalBlock(scope: !65, file: !66, line: 52, column: 5)
!76 = !DILocation(line: 57, column: 13, scope: !75)
!77 = !DILocalVariable(name: "service", scope: !75, file: !66, line: 58, type: !78)
!78 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !79)
!79 = !{!80, !81, !87, !94}
!80 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !78, file: !17, line: 240, baseType: !51, size: 16)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !78, file: !17, line: 241, baseType: !82, size: 16, offset: 16)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !84, line: 25, baseType: !85)
!84 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !86, line: 40, baseType: !53)
!86 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !78, file: !17, line: 242, baseType: !88, size: 32, offset: 32)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !89)
!89 = !{!90}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !88, file: !17, line: 33, baseType: !91, size: 32)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !84, line: 26, baseType: !93)
!93 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !86, line: 42, baseType: !5)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !78, file: !17, line: 245, baseType: !95, size: 64, offset: 64)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 64, elements: !97)
!96 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!97 = !{!98}
!98 = !DISubrange(count: 8)
!99 = !DILocation(line: 58, column: 28, scope: !75)
!100 = !DILocalVariable(name: "connectSocket", scope: !75, file: !66, line: 59, type: !71)
!101 = !DILocation(line: 59, column: 16, scope: !75)
!102 = !DILocalVariable(name: "inputBuffer", scope: !75, file: !66, line: 60, type: !55)
!103 = !DILocation(line: 60, column: 14, scope: !75)
!104 = !DILocation(line: 61, column: 9, scope: !75)
!105 = !DILocation(line: 71, column: 29, scope: !106)
!106 = distinct !DILexicalBlock(scope: !75, file: !66, line: 62, column: 9)
!107 = !DILocation(line: 71, column: 27, scope: !106)
!108 = !DILocation(line: 72, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !66, line: 72, column: 17)
!110 = !DILocation(line: 72, column: 31, scope: !109)
!111 = !DILocation(line: 72, column: 17, scope: !106)
!112 = !DILocation(line: 74, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !66, line: 73, column: 13)
!114 = !DILocation(line: 76, column: 13, scope: !106)
!115 = !DILocation(line: 77, column: 21, scope: !106)
!116 = !DILocation(line: 77, column: 32, scope: !106)
!117 = !DILocation(line: 78, column: 39, scope: !106)
!118 = !DILocation(line: 78, column: 21, scope: !106)
!119 = !DILocation(line: 78, column: 30, scope: !106)
!120 = !DILocation(line: 78, column: 37, scope: !106)
!121 = !DILocation(line: 79, column: 32, scope: !106)
!122 = !DILocation(line: 79, column: 21, scope: !106)
!123 = !DILocation(line: 79, column: 30, scope: !106)
!124 = !DILocation(line: 80, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !106, file: !66, line: 80, column: 17)
!126 = !DILocation(line: 80, column: 40, scope: !125)
!127 = !DILocation(line: 80, column: 17, scope: !125)
!128 = !DILocation(line: 80, column: 85, scope: !125)
!129 = !DILocation(line: 80, column: 17, scope: !106)
!130 = !DILocation(line: 82, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !66, line: 81, column: 13)
!132 = !DILocation(line: 86, column: 31, scope: !106)
!133 = !DILocation(line: 86, column: 46, scope: !106)
!134 = !DILocation(line: 86, column: 26, scope: !106)
!135 = !DILocation(line: 86, column: 24, scope: !106)
!136 = !DILocation(line: 87, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !106, file: !66, line: 87, column: 17)
!138 = !DILocation(line: 87, column: 28, scope: !137)
!139 = !DILocation(line: 87, column: 44, scope: !137)
!140 = !DILocation(line: 87, column: 47, scope: !137)
!141 = !DILocation(line: 87, column: 58, scope: !137)
!142 = !DILocation(line: 87, column: 17, scope: !106)
!143 = !DILocation(line: 89, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !66, line: 88, column: 13)
!145 = !DILocation(line: 92, column: 25, scope: !106)
!146 = !DILocation(line: 92, column: 13, scope: !106)
!147 = !DILocation(line: 92, column: 37, scope: !106)
!148 = !DILocation(line: 94, column: 25, scope: !106)
!149 = !DILocation(line: 94, column: 20, scope: !106)
!150 = !DILocation(line: 94, column: 18, scope: !106)
!151 = !DILocation(line: 95, column: 9, scope: !106)
!152 = !DILocation(line: 97, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !75, file: !66, line: 97, column: 13)
!154 = !DILocation(line: 97, column: 27, scope: !153)
!155 = !DILocation(line: 97, column: 13, scope: !75)
!156 = !DILocation(line: 99, column: 26, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !66, line: 98, column: 9)
!158 = !DILocation(line: 99, column: 13, scope: !157)
!159 = !DILocation(line: 100, column: 9, scope: !157)
!160 = !DILocation(line: 108, column: 5, scope: !65)
!161 = !DILocation(line: 109, column: 1, scope: !65)
!162 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_63_good", scope: !66, file: !66, line: 196, type: !67, scopeLine: 197, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!163 = !DILocation(line: 198, column: 5, scope: !162)
!164 = !DILocation(line: 199, column: 5, scope: !162)
!165 = !DILocation(line: 200, column: 1, scope: !162)
!166 = distinct !DISubprogram(name: "main", scope: !66, file: !66, line: 211, type: !167, scopeLine: 212, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !69)
!167 = !DISubroutineType(types: !168)
!168 = !{!71, !71, !169}
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64)
!170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!171 = !DILocalVariable(name: "argc", arg: 1, scope: !166, file: !66, line: 211, type: !71)
!172 = !DILocation(line: 211, column: 14, scope: !166)
!173 = !DILocalVariable(name: "argv", arg: 2, scope: !166, file: !66, line: 211, type: !169)
!174 = !DILocation(line: 211, column: 27, scope: !166)
!175 = !DILocation(line: 214, column: 22, scope: !166)
!176 = !DILocation(line: 214, column: 12, scope: !166)
!177 = !DILocation(line: 214, column: 5, scope: !166)
!178 = !DILocation(line: 216, column: 5, scope: !166)
!179 = !DILocation(line: 217, column: 5, scope: !166)
!180 = !DILocation(line: 218, column: 5, scope: !166)
!181 = !DILocation(line: 221, column: 5, scope: !166)
!182 = !DILocation(line: 222, column: 5, scope: !166)
!183 = !DILocation(line: 223, column: 5, scope: !166)
!184 = !DILocation(line: 225, column: 5, scope: !166)
!185 = distinct !DISubprogram(name: "goodG2B", scope: !66, file: !66, line: 118, type: !67, scopeLine: 119, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!186 = !DILocalVariable(name: "data", scope: !185, file: !66, line: 120, type: !71)
!187 = !DILocation(line: 120, column: 9, scope: !185)
!188 = !DILocation(line: 122, column: 10, scope: !185)
!189 = !DILocation(line: 125, column: 10, scope: !185)
!190 = !DILocation(line: 126, column: 5, scope: !185)
!191 = !DILocation(line: 127, column: 1, scope: !185)
!192 = distinct !DISubprogram(name: "goodB2G", scope: !66, file: !66, line: 132, type: !67, scopeLine: 133, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !69)
!193 = !DILocalVariable(name: "data", scope: !192, file: !66, line: 134, type: !71)
!194 = !DILocation(line: 134, column: 9, scope: !192)
!195 = !DILocation(line: 136, column: 10, scope: !192)
!196 = !DILocalVariable(name: "recvResult", scope: !197, file: !66, line: 142, type: !71)
!197 = distinct !DILexicalBlock(scope: !192, file: !66, line: 137, column: 5)
!198 = !DILocation(line: 142, column: 13, scope: !197)
!199 = !DILocalVariable(name: "service", scope: !197, file: !66, line: 143, type: !78)
!200 = !DILocation(line: 143, column: 28, scope: !197)
!201 = !DILocalVariable(name: "connectSocket", scope: !197, file: !66, line: 144, type: !71)
!202 = !DILocation(line: 144, column: 16, scope: !197)
!203 = !DILocalVariable(name: "inputBuffer", scope: !197, file: !66, line: 145, type: !55)
!204 = !DILocation(line: 145, column: 14, scope: !197)
!205 = !DILocation(line: 146, column: 9, scope: !197)
!206 = !DILocation(line: 156, column: 29, scope: !207)
!207 = distinct !DILexicalBlock(scope: !197, file: !66, line: 147, column: 9)
!208 = !DILocation(line: 156, column: 27, scope: !207)
!209 = !DILocation(line: 157, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !207, file: !66, line: 157, column: 17)
!211 = !DILocation(line: 157, column: 31, scope: !210)
!212 = !DILocation(line: 157, column: 17, scope: !207)
!213 = !DILocation(line: 159, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !66, line: 158, column: 13)
!215 = !DILocation(line: 161, column: 13, scope: !207)
!216 = !DILocation(line: 162, column: 21, scope: !207)
!217 = !DILocation(line: 162, column: 32, scope: !207)
!218 = !DILocation(line: 163, column: 39, scope: !207)
!219 = !DILocation(line: 163, column: 21, scope: !207)
!220 = !DILocation(line: 163, column: 30, scope: !207)
!221 = !DILocation(line: 163, column: 37, scope: !207)
!222 = !DILocation(line: 164, column: 32, scope: !207)
!223 = !DILocation(line: 164, column: 21, scope: !207)
!224 = !DILocation(line: 164, column: 30, scope: !207)
!225 = !DILocation(line: 165, column: 25, scope: !226)
!226 = distinct !DILexicalBlock(scope: !207, file: !66, line: 165, column: 17)
!227 = !DILocation(line: 165, column: 40, scope: !226)
!228 = !DILocation(line: 165, column: 17, scope: !226)
!229 = !DILocation(line: 165, column: 85, scope: !226)
!230 = !DILocation(line: 165, column: 17, scope: !207)
!231 = !DILocation(line: 167, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !226, file: !66, line: 166, column: 13)
!233 = !DILocation(line: 171, column: 31, scope: !207)
!234 = !DILocation(line: 171, column: 46, scope: !207)
!235 = !DILocation(line: 171, column: 26, scope: !207)
!236 = !DILocation(line: 171, column: 24, scope: !207)
!237 = !DILocation(line: 172, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !207, file: !66, line: 172, column: 17)
!239 = !DILocation(line: 172, column: 28, scope: !238)
!240 = !DILocation(line: 172, column: 44, scope: !238)
!241 = !DILocation(line: 172, column: 47, scope: !238)
!242 = !DILocation(line: 172, column: 58, scope: !238)
!243 = !DILocation(line: 172, column: 17, scope: !207)
!244 = !DILocation(line: 174, column: 17, scope: !245)
!245 = distinct !DILexicalBlock(scope: !238, file: !66, line: 173, column: 13)
!246 = !DILocation(line: 177, column: 25, scope: !207)
!247 = !DILocation(line: 177, column: 13, scope: !207)
!248 = !DILocation(line: 177, column: 37, scope: !207)
!249 = !DILocation(line: 179, column: 25, scope: !207)
!250 = !DILocation(line: 179, column: 20, scope: !207)
!251 = !DILocation(line: 179, column: 18, scope: !207)
!252 = !DILocation(line: 180, column: 9, scope: !207)
!253 = !DILocation(line: 182, column: 13, scope: !254)
!254 = distinct !DILexicalBlock(scope: !197, file: !66, line: 182, column: 13)
!255 = !DILocation(line: 182, column: 27, scope: !254)
!256 = !DILocation(line: 182, column: 13, scope: !197)
!257 = !DILocation(line: 184, column: 26, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !66, line: 183, column: 9)
!259 = !DILocation(line: 184, column: 13, scope: !258)
!260 = !DILocation(line: 185, column: 9, scope: !258)
!261 = !DILocation(line: 193, column: 5, scope: !192)
!262 = !DILocation(line: 194, column: 1, scope: !192)
