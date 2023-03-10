; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_61b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE124_Buffer_Underwrite__CWE839_connect_socket_61b_badSource(i32 %data) #0 !dbg !65 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !73, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !76, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !99, metadata !DIExpression()), !dbg !100
  store i32 -1, i32* %connectSocket, align 4, !dbg !100
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  br label %do.body, !dbg !103

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !104
  store i32 %call, i32* %connectSocket, align 4, !dbg !106
  %0 = load i32, i32* %connectSocket, align 4, !dbg !107
  %cmp = icmp eq i32 %0, -1, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !111

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !113
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !114
  store i16 2, i16* %sin_family, align 4, !dbg !115
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !116
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !117
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !118
  store i32 %call1, i32* %s_addr, align 4, !dbg !119
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !120
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !121
  store i16 %call2, i16* %sin_port, align 2, !dbg !122
  %2 = load i32, i32* %connectSocket, align 4, !dbg !123
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !125
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !126
  %cmp4 = icmp eq i32 %call3, -1, !dbg !127
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !128

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !129

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !131
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !132
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !133
  %conv = trunc i64 %call7 to i32, !dbg !133
  store i32 %conv, i32* %recvResult, align 4, !dbg !134
  %5 = load i32, i32* %recvResult, align 4, !dbg !135
  %cmp8 = icmp eq i32 %5, -1, !dbg !137
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !138

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !139
  %cmp10 = icmp eq i32 %6, 0, !dbg !140
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !141

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !142

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !144
  %idxprom = sext i32 %7 to i64, !dbg !145
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !145
  store i8 0, i8* %arrayidx, align 1, !dbg !146
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !147
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !148
  store i32 %call15, i32* %data.addr, align 4, !dbg !149
  br label %do.end, !dbg !150

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !151
  %cmp16 = icmp ne i32 %8, -1, !dbg !153
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !154

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !155
  %call19 = call i32 @close(i32 %9), !dbg !157
  br label %if.end20, !dbg !158

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data.addr, align 4, !dbg !159
  ret i32 %10, !dbg !160
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE124_Buffer_Underwrite__CWE839_connect_socket_61b_goodG2BSource(i32 %data) #0 !dbg !161 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !162, metadata !DIExpression()), !dbg !163
  store i32 7, i32* %data.addr, align 4, !dbg !164
  %0 = load i32, i32* %data.addr, align 4, !dbg !165
  ret i32 %0, !dbg !166
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE124_Buffer_Underwrite__CWE839_connect_socket_61b_goodB2GSource(i32 %data) #0 !dbg !167 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !170, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !175, metadata !DIExpression()), !dbg !176
  store i32 -1, i32* %connectSocket, align 4, !dbg !176
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !177, metadata !DIExpression()), !dbg !178
  br label %do.body, !dbg !179

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !180
  store i32 %call, i32* %connectSocket, align 4, !dbg !182
  %0 = load i32, i32* %connectSocket, align 4, !dbg !183
  %cmp = icmp eq i32 %0, -1, !dbg !185
  br i1 %cmp, label %if.then, label %if.end, !dbg !186

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !187

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !189
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !189
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !190
  store i16 2, i16* %sin_family, align 4, !dbg !191
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !192
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !193
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !194
  store i32 %call1, i32* %s_addr, align 4, !dbg !195
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !196
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !197
  store i16 %call2, i16* %sin_port, align 2, !dbg !198
  %2 = load i32, i32* %connectSocket, align 4, !dbg !199
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !201
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !202
  %cmp4 = icmp eq i32 %call3, -1, !dbg !203
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !204

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !205

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !207
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !208
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !209
  %conv = trunc i64 %call7 to i32, !dbg !209
  store i32 %conv, i32* %recvResult, align 4, !dbg !210
  %5 = load i32, i32* %recvResult, align 4, !dbg !211
  %cmp8 = icmp eq i32 %5, -1, !dbg !213
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !214

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !215
  %cmp10 = icmp eq i32 %6, 0, !dbg !216
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !217

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !218

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !220
  %idxprom = sext i32 %7 to i64, !dbg !221
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !221
  store i8 0, i8* %arrayidx, align 1, !dbg !222
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !223
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !224
  store i32 %call15, i32* %data.addr, align 4, !dbg !225
  br label %do.end, !dbg !226

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !227
  %cmp16 = icmp ne i32 %8, -1, !dbg !229
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !230

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !231
  %call19 = call i32 @close(i32 %9), !dbg !233
  br label %if.end20, !dbg !234

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data.addr, align 4, !dbg !235
  ret i32 %10, !dbg !236
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
!llvm.module.flags = !{!59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !45, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_61b.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46}
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
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_61b_badSource", scope: !66, file: !66, line: 44, type: !67, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !70)
!66 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__CWE839_connect_socket_61b.c", directory: "/home/joelyang/SSE-Assessment")
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !{}
!71 = !DILocalVariable(name: "data", arg: 1, scope: !65, file: !66, line: 44, type: !69)
!72 = !DILocation(line: 44, column: 71, scope: !65)
!73 = !DILocalVariable(name: "recvResult", scope: !74, file: !66, line: 51, type: !69)
!74 = distinct !DILexicalBlock(scope: !65, file: !66, line: 46, column: 5)
!75 = !DILocation(line: 51, column: 13, scope: !74)
!76 = !DILocalVariable(name: "service", scope: !74, file: !66, line: 52, type: !77)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !78)
!78 = !{!79, !80, !86, !93}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !77, file: !17, line: 240, baseType: !51, size: 16)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !77, file: !17, line: 241, baseType: !81, size: 16, offset: 16)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !82)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !83, line: 25, baseType: !84)
!83 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !85, line: 40, baseType: !53)
!85 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!86 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !77, file: !17, line: 242, baseType: !87, size: 32, offset: 32)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !88)
!88 = !{!89}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !87, file: !17, line: 33, baseType: !90, size: 32)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !17, line: 30, baseType: !91)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !83, line: 26, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !85, line: 42, baseType: !5)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !77, file: !17, line: 245, baseType: !94, size: 64, offset: 64)
!94 = !DICompositeType(tag: DW_TAG_array_type, baseType: !95, size: 64, elements: !96)
!95 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!96 = !{!97}
!97 = !DISubrange(count: 8)
!98 = !DILocation(line: 52, column: 28, scope: !74)
!99 = !DILocalVariable(name: "connectSocket", scope: !74, file: !66, line: 53, type: !69)
!100 = !DILocation(line: 53, column: 16, scope: !74)
!101 = !DILocalVariable(name: "inputBuffer", scope: !74, file: !66, line: 54, type: !55)
!102 = !DILocation(line: 54, column: 14, scope: !74)
!103 = !DILocation(line: 55, column: 9, scope: !74)
!104 = !DILocation(line: 65, column: 29, scope: !105)
!105 = distinct !DILexicalBlock(scope: !74, file: !66, line: 56, column: 9)
!106 = !DILocation(line: 65, column: 27, scope: !105)
!107 = !DILocation(line: 66, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !105, file: !66, line: 66, column: 17)
!109 = !DILocation(line: 66, column: 31, scope: !108)
!110 = !DILocation(line: 66, column: 17, scope: !105)
!111 = !DILocation(line: 68, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !66, line: 67, column: 13)
!113 = !DILocation(line: 70, column: 13, scope: !105)
!114 = !DILocation(line: 71, column: 21, scope: !105)
!115 = !DILocation(line: 71, column: 32, scope: !105)
!116 = !DILocation(line: 72, column: 39, scope: !105)
!117 = !DILocation(line: 72, column: 21, scope: !105)
!118 = !DILocation(line: 72, column: 30, scope: !105)
!119 = !DILocation(line: 72, column: 37, scope: !105)
!120 = !DILocation(line: 73, column: 32, scope: !105)
!121 = !DILocation(line: 73, column: 21, scope: !105)
!122 = !DILocation(line: 73, column: 30, scope: !105)
!123 = !DILocation(line: 74, column: 25, scope: !124)
!124 = distinct !DILexicalBlock(scope: !105, file: !66, line: 74, column: 17)
!125 = !DILocation(line: 74, column: 40, scope: !124)
!126 = !DILocation(line: 74, column: 17, scope: !124)
!127 = !DILocation(line: 74, column: 85, scope: !124)
!128 = !DILocation(line: 74, column: 17, scope: !105)
!129 = !DILocation(line: 76, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !66, line: 75, column: 13)
!131 = !DILocation(line: 80, column: 31, scope: !105)
!132 = !DILocation(line: 80, column: 46, scope: !105)
!133 = !DILocation(line: 80, column: 26, scope: !105)
!134 = !DILocation(line: 80, column: 24, scope: !105)
!135 = !DILocation(line: 81, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !105, file: !66, line: 81, column: 17)
!137 = !DILocation(line: 81, column: 28, scope: !136)
!138 = !DILocation(line: 81, column: 44, scope: !136)
!139 = !DILocation(line: 81, column: 47, scope: !136)
!140 = !DILocation(line: 81, column: 58, scope: !136)
!141 = !DILocation(line: 81, column: 17, scope: !105)
!142 = !DILocation(line: 83, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !136, file: !66, line: 82, column: 13)
!144 = !DILocation(line: 86, column: 25, scope: !105)
!145 = !DILocation(line: 86, column: 13, scope: !105)
!146 = !DILocation(line: 86, column: 37, scope: !105)
!147 = !DILocation(line: 88, column: 25, scope: !105)
!148 = !DILocation(line: 88, column: 20, scope: !105)
!149 = !DILocation(line: 88, column: 18, scope: !105)
!150 = !DILocation(line: 89, column: 9, scope: !105)
!151 = !DILocation(line: 91, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !74, file: !66, line: 91, column: 13)
!153 = !DILocation(line: 91, column: 27, scope: !152)
!154 = !DILocation(line: 91, column: 13, scope: !74)
!155 = !DILocation(line: 93, column: 26, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !66, line: 92, column: 9)
!157 = !DILocation(line: 93, column: 13, scope: !156)
!158 = !DILocation(line: 94, column: 9, scope: !156)
!159 = !DILocation(line: 102, column: 12, scope: !65)
!160 = !DILocation(line: 102, column: 5, scope: !65)
!161 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_61b_goodG2BSource", scope: !66, file: !66, line: 110, type: !67, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !70)
!162 = !DILocalVariable(name: "data", arg: 1, scope: !161, file: !66, line: 110, type: !69)
!163 = !DILocation(line: 110, column: 75, scope: !161)
!164 = !DILocation(line: 114, column: 10, scope: !161)
!165 = !DILocation(line: 115, column: 12, scope: !161)
!166 = !DILocation(line: 115, column: 5, scope: !161)
!167 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__CWE839_connect_socket_61b_goodB2GSource", scope: !66, file: !66, line: 119, type: !67, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !70)
!168 = !DILocalVariable(name: "data", arg: 1, scope: !167, file: !66, line: 119, type: !69)
!169 = !DILocation(line: 119, column: 75, scope: !167)
!170 = !DILocalVariable(name: "recvResult", scope: !171, file: !66, line: 126, type: !69)
!171 = distinct !DILexicalBlock(scope: !167, file: !66, line: 121, column: 5)
!172 = !DILocation(line: 126, column: 13, scope: !171)
!173 = !DILocalVariable(name: "service", scope: !171, file: !66, line: 127, type: !77)
!174 = !DILocation(line: 127, column: 28, scope: !171)
!175 = !DILocalVariable(name: "connectSocket", scope: !171, file: !66, line: 128, type: !69)
!176 = !DILocation(line: 128, column: 16, scope: !171)
!177 = !DILocalVariable(name: "inputBuffer", scope: !171, file: !66, line: 129, type: !55)
!178 = !DILocation(line: 129, column: 14, scope: !171)
!179 = !DILocation(line: 130, column: 9, scope: !171)
!180 = !DILocation(line: 140, column: 29, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !66, line: 131, column: 9)
!182 = !DILocation(line: 140, column: 27, scope: !181)
!183 = !DILocation(line: 141, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !66, line: 141, column: 17)
!185 = !DILocation(line: 141, column: 31, scope: !184)
!186 = !DILocation(line: 141, column: 17, scope: !181)
!187 = !DILocation(line: 143, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !66, line: 142, column: 13)
!189 = !DILocation(line: 145, column: 13, scope: !181)
!190 = !DILocation(line: 146, column: 21, scope: !181)
!191 = !DILocation(line: 146, column: 32, scope: !181)
!192 = !DILocation(line: 147, column: 39, scope: !181)
!193 = !DILocation(line: 147, column: 21, scope: !181)
!194 = !DILocation(line: 147, column: 30, scope: !181)
!195 = !DILocation(line: 147, column: 37, scope: !181)
!196 = !DILocation(line: 148, column: 32, scope: !181)
!197 = !DILocation(line: 148, column: 21, scope: !181)
!198 = !DILocation(line: 148, column: 30, scope: !181)
!199 = !DILocation(line: 149, column: 25, scope: !200)
!200 = distinct !DILexicalBlock(scope: !181, file: !66, line: 149, column: 17)
!201 = !DILocation(line: 149, column: 40, scope: !200)
!202 = !DILocation(line: 149, column: 17, scope: !200)
!203 = !DILocation(line: 149, column: 85, scope: !200)
!204 = !DILocation(line: 149, column: 17, scope: !181)
!205 = !DILocation(line: 151, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !200, file: !66, line: 150, column: 13)
!207 = !DILocation(line: 155, column: 31, scope: !181)
!208 = !DILocation(line: 155, column: 46, scope: !181)
!209 = !DILocation(line: 155, column: 26, scope: !181)
!210 = !DILocation(line: 155, column: 24, scope: !181)
!211 = !DILocation(line: 156, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !181, file: !66, line: 156, column: 17)
!213 = !DILocation(line: 156, column: 28, scope: !212)
!214 = !DILocation(line: 156, column: 44, scope: !212)
!215 = !DILocation(line: 156, column: 47, scope: !212)
!216 = !DILocation(line: 156, column: 58, scope: !212)
!217 = !DILocation(line: 156, column: 17, scope: !181)
!218 = !DILocation(line: 158, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !212, file: !66, line: 157, column: 13)
!220 = !DILocation(line: 161, column: 25, scope: !181)
!221 = !DILocation(line: 161, column: 13, scope: !181)
!222 = !DILocation(line: 161, column: 37, scope: !181)
!223 = !DILocation(line: 163, column: 25, scope: !181)
!224 = !DILocation(line: 163, column: 20, scope: !181)
!225 = !DILocation(line: 163, column: 18, scope: !181)
!226 = !DILocation(line: 164, column: 9, scope: !181)
!227 = !DILocation(line: 166, column: 13, scope: !228)
!228 = distinct !DILexicalBlock(scope: !171, file: !66, line: 166, column: 13)
!229 = !DILocation(line: 166, column: 27, scope: !228)
!230 = !DILocation(line: 166, column: 13, scope: !171)
!231 = !DILocation(line: 168, column: 26, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !66, line: 167, column: 9)
!233 = !DILocation(line: 168, column: 13, scope: !232)
!234 = !DILocation(line: 169, column: 9, scope: !232)
!235 = !DILocation(line: 177, column: 12, scope: !167)
!236 = !DILocation(line: 177, column: 5, scope: !167)
