; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_61b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_61b_badSource(i32 %data) #0 !dbg !70 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !78, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !81, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !99, metadata !DIExpression()), !dbg !100
  store i32 -1, i32* %listenSocket, align 4, !dbg !100
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !101, metadata !DIExpression()), !dbg !102
  store i32 -1, i32* %acceptSocket, align 4, !dbg !102
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  br label %do.body, !dbg !105

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !106
  store i32 %call, i32* %listenSocket, align 4, !dbg !108
  %0 = load i32, i32* %listenSocket, align 4, !dbg !109
  %cmp = icmp eq i32 %0, -1, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !113

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !115
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !116
  store i16 2, i16* %sin_family, align 4, !dbg !117
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !118
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !119
  store i32 0, i32* %s_addr, align 4, !dbg !120
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !121
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !122
  store i16 %call1, i16* %sin_port, align 2, !dbg !123
  %2 = load i32, i32* %listenSocket, align 4, !dbg !124
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !126
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !127
  %cmp3 = icmp eq i32 %call2, -1, !dbg !128
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !129

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !130

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !132
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !134
  %cmp7 = icmp eq i32 %call6, -1, !dbg !135
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !136

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !137

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !139
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !140
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !141
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !142
  %cmp11 = icmp eq i32 %6, -1, !dbg !144
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !145

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !146

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !148
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !149
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !150
  %conv = trunc i64 %call14 to i32, !dbg !150
  store i32 %conv, i32* %recvResult, align 4, !dbg !151
  %8 = load i32, i32* %recvResult, align 4, !dbg !152
  %cmp15 = icmp eq i32 %8, -1, !dbg !154
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !155

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !156
  %cmp17 = icmp eq i32 %9, 0, !dbg !157
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !158

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !159

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !161
  %idxprom = sext i32 %10 to i64, !dbg !162
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !162
  store i8 0, i8* %arrayidx, align 1, !dbg !163
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !164
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !165
  store i32 %call22, i32* %data.addr, align 4, !dbg !166
  br label %do.end, !dbg !167

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !168
  %cmp23 = icmp ne i32 %11, -1, !dbg !170
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !171

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !172
  %call26 = call i32 @close(i32 %12), !dbg !174
  br label %if.end27, !dbg !175

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !176
  %cmp28 = icmp ne i32 %13, -1, !dbg !178
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !179

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !180
  %call31 = call i32 @close(i32 %14), !dbg !182
  br label %if.end32, !dbg !183

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data.addr, align 4, !dbg !184
  ret i32 %15, !dbg !185
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_61b_goodG2BSource(i32 %data) #0 !dbg !186 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !187, metadata !DIExpression()), !dbg !188
  store i32 7, i32* %data.addr, align 4, !dbg !189
  %0 = load i32, i32* %data.addr, align 4, !dbg !190
  ret i32 %0, !dbg !191
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_61b_goodB2GSource(i32 %data) #0 !dbg !192 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !193, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !195, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !198, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !200, metadata !DIExpression()), !dbg !201
  store i32 -1, i32* %listenSocket, align 4, !dbg !201
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !202, metadata !DIExpression()), !dbg !203
  store i32 -1, i32* %acceptSocket, align 4, !dbg !203
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !204, metadata !DIExpression()), !dbg !205
  br label %do.body, !dbg !206

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !207
  store i32 %call, i32* %listenSocket, align 4, !dbg !209
  %0 = load i32, i32* %listenSocket, align 4, !dbg !210
  %cmp = icmp eq i32 %0, -1, !dbg !212
  br i1 %cmp, label %if.then, label %if.end, !dbg !213

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !214

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !216
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !216
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !217
  store i16 2, i16* %sin_family, align 4, !dbg !218
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !219
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !220
  store i32 0, i32* %s_addr, align 4, !dbg !221
  %call1 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !222
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !223
  store i16 %call1, i16* %sin_port, align 2, !dbg !224
  %2 = load i32, i32* %listenSocket, align 4, !dbg !225
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !227
  %call2 = call i32 @bind(i32 %2, %struct.sockaddr* %3, i32 16) #7, !dbg !228
  %cmp3 = icmp eq i32 %call2, -1, !dbg !229
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !230

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !231

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !233
  %call6 = call i32 @listen(i32 %4, i32 5) #7, !dbg !235
  %cmp7 = icmp eq i32 %call6, -1, !dbg !236
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !237

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !238

if.end9:                                          ; preds = %if.end5
  %5 = load i32, i32* %listenSocket, align 4, !dbg !240
  %call10 = call i32 @accept(i32 %5, %struct.sockaddr* null, i32* null), !dbg !241
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !242
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !243
  %cmp11 = icmp eq i32 %6, -1, !dbg !245
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !246

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !247

if.end13:                                         ; preds = %if.end9
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !249
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !250
  %call14 = call i64 @recv(i32 %7, i8* %arraydecay, i64 13, i32 0), !dbg !251
  %conv = trunc i64 %call14 to i32, !dbg !251
  store i32 %conv, i32* %recvResult, align 4, !dbg !252
  %8 = load i32, i32* %recvResult, align 4, !dbg !253
  %cmp15 = icmp eq i32 %8, -1, !dbg !255
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !256

lor.lhs.false:                                    ; preds = %if.end13
  %9 = load i32, i32* %recvResult, align 4, !dbg !257
  %cmp17 = icmp eq i32 %9, 0, !dbg !258
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !259

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !260

if.end20:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !262
  %idxprom = sext i32 %10 to i64, !dbg !263
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !263
  store i8 0, i8* %arrayidx, align 1, !dbg !264
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !265
  %call22 = call i32 @atoi(i8* %arraydecay21) #9, !dbg !266
  store i32 %call22, i32* %data.addr, align 4, !dbg !267
  br label %do.end, !dbg !268

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !269
  %cmp23 = icmp ne i32 %11, -1, !dbg !271
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !272

if.then25:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !273
  %call26 = call i32 @close(i32 %12), !dbg !275
  br label %if.end27, !dbg !276

if.end27:                                         ; preds = %if.then25, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !277
  %cmp28 = icmp ne i32 %13, -1, !dbg !279
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !280

if.then30:                                        ; preds = %if.end27
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !281
  %call31 = call i32 @close(i32 %14), !dbg !283
  br label %if.end32, !dbg !284

if.end32:                                         ; preds = %if.then30, %if.end27
  %15 = load i32, i32* %data.addr, align 4, !dbg !285
  ret i32 %15, !dbg !286
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_61b.c", directory: "/home/joelyang/SSE-Assessment")
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
!45 = !{!46, !51}
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
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_61b_badSource", scope: !71, file: !71, line: 44, type: !72, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !75)
!71 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_61b.c", directory: "/home/joelyang/SSE-Assessment")
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !{}
!76 = !DILocalVariable(name: "data", arg: 1, scope: !70, file: !71, line: 44, type: !74)
!77 = !DILocation(line: 44, column: 81, scope: !70)
!78 = !DILocalVariable(name: "recvResult", scope: !79, file: !71, line: 51, type: !74)
!79 = distinct !DILexicalBlock(scope: !70, file: !71, line: 46, column: 5)
!80 = !DILocation(line: 51, column: 13, scope: !79)
!81 = !DILocalVariable(name: "service", scope: !79, file: !71, line: 52, type: !82)
!82 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !17, line: 238, size: 128, elements: !83)
!83 = !{!84, !85, !89, !93}
!84 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !82, file: !17, line: 240, baseType: !56, size: 16)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !82, file: !17, line: 241, baseType: !86, size: 16, offset: 16)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !17, line: 119, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !48, line: 25, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !50, line: 40, baseType: !58)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !82, file: !17, line: 242, baseType: !90, size: 32, offset: 32)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !17, line: 31, size: 32, elements: !91)
!91 = !{!92}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !90, file: !17, line: 33, baseType: !46, size: 32)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !82, file: !17, line: 245, baseType: !94, size: 64, offset: 64)
!94 = !DICompositeType(tag: DW_TAG_array_type, baseType: !95, size: 64, elements: !96)
!95 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!96 = !{!97}
!97 = !DISubrange(count: 8)
!98 = !DILocation(line: 52, column: 28, scope: !79)
!99 = !DILocalVariable(name: "listenSocket", scope: !79, file: !71, line: 53, type: !74)
!100 = !DILocation(line: 53, column: 16, scope: !79)
!101 = !DILocalVariable(name: "acceptSocket", scope: !79, file: !71, line: 54, type: !74)
!102 = !DILocation(line: 54, column: 16, scope: !79)
!103 = !DILocalVariable(name: "inputBuffer", scope: !79, file: !71, line: 55, type: !60)
!104 = !DILocation(line: 55, column: 14, scope: !79)
!105 = !DILocation(line: 56, column: 9, scope: !79)
!106 = !DILocation(line: 66, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !79, file: !71, line: 57, column: 9)
!108 = !DILocation(line: 66, column: 26, scope: !107)
!109 = !DILocation(line: 67, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !71, line: 67, column: 17)
!111 = !DILocation(line: 67, column: 30, scope: !110)
!112 = !DILocation(line: 67, column: 17, scope: !107)
!113 = !DILocation(line: 69, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !71, line: 68, column: 13)
!115 = !DILocation(line: 71, column: 13, scope: !107)
!116 = !DILocation(line: 72, column: 21, scope: !107)
!117 = !DILocation(line: 72, column: 32, scope: !107)
!118 = !DILocation(line: 73, column: 21, scope: !107)
!119 = !DILocation(line: 73, column: 30, scope: !107)
!120 = !DILocation(line: 73, column: 37, scope: !107)
!121 = !DILocation(line: 74, column: 32, scope: !107)
!122 = !DILocation(line: 74, column: 21, scope: !107)
!123 = !DILocation(line: 74, column: 30, scope: !107)
!124 = !DILocation(line: 75, column: 22, scope: !125)
!125 = distinct !DILexicalBlock(scope: !107, file: !71, line: 75, column: 17)
!126 = !DILocation(line: 75, column: 36, scope: !125)
!127 = !DILocation(line: 75, column: 17, scope: !125)
!128 = !DILocation(line: 75, column: 81, scope: !125)
!129 = !DILocation(line: 75, column: 17, scope: !107)
!130 = !DILocation(line: 77, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !71, line: 76, column: 13)
!132 = !DILocation(line: 79, column: 24, scope: !133)
!133 = distinct !DILexicalBlock(scope: !107, file: !71, line: 79, column: 17)
!134 = !DILocation(line: 79, column: 17, scope: !133)
!135 = !DILocation(line: 79, column: 54, scope: !133)
!136 = !DILocation(line: 79, column: 17, scope: !107)
!137 = !DILocation(line: 81, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !71, line: 80, column: 13)
!139 = !DILocation(line: 83, column: 35, scope: !107)
!140 = !DILocation(line: 83, column: 28, scope: !107)
!141 = !DILocation(line: 83, column: 26, scope: !107)
!142 = !DILocation(line: 84, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !107, file: !71, line: 84, column: 17)
!144 = !DILocation(line: 84, column: 30, scope: !143)
!145 = !DILocation(line: 84, column: 17, scope: !107)
!146 = !DILocation(line: 86, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !71, line: 85, column: 13)
!148 = !DILocation(line: 89, column: 31, scope: !107)
!149 = !DILocation(line: 89, column: 45, scope: !107)
!150 = !DILocation(line: 89, column: 26, scope: !107)
!151 = !DILocation(line: 89, column: 24, scope: !107)
!152 = !DILocation(line: 90, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !107, file: !71, line: 90, column: 17)
!154 = !DILocation(line: 90, column: 28, scope: !153)
!155 = !DILocation(line: 90, column: 44, scope: !153)
!156 = !DILocation(line: 90, column: 47, scope: !153)
!157 = !DILocation(line: 90, column: 58, scope: !153)
!158 = !DILocation(line: 90, column: 17, scope: !107)
!159 = !DILocation(line: 92, column: 17, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !71, line: 91, column: 13)
!161 = !DILocation(line: 95, column: 25, scope: !107)
!162 = !DILocation(line: 95, column: 13, scope: !107)
!163 = !DILocation(line: 95, column: 37, scope: !107)
!164 = !DILocation(line: 97, column: 25, scope: !107)
!165 = !DILocation(line: 97, column: 20, scope: !107)
!166 = !DILocation(line: 97, column: 18, scope: !107)
!167 = !DILocation(line: 98, column: 9, scope: !107)
!168 = !DILocation(line: 100, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !79, file: !71, line: 100, column: 13)
!170 = !DILocation(line: 100, column: 26, scope: !169)
!171 = !DILocation(line: 100, column: 13, scope: !79)
!172 = !DILocation(line: 102, column: 26, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !71, line: 101, column: 9)
!174 = !DILocation(line: 102, column: 13, scope: !173)
!175 = !DILocation(line: 103, column: 9, scope: !173)
!176 = !DILocation(line: 104, column: 13, scope: !177)
!177 = distinct !DILexicalBlock(scope: !79, file: !71, line: 104, column: 13)
!178 = !DILocation(line: 104, column: 26, scope: !177)
!179 = !DILocation(line: 104, column: 13, scope: !79)
!180 = !DILocation(line: 106, column: 26, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !71, line: 105, column: 9)
!182 = !DILocation(line: 106, column: 13, scope: !181)
!183 = !DILocation(line: 107, column: 9, scope: !181)
!184 = !DILocation(line: 115, column: 12, scope: !70)
!185 = !DILocation(line: 115, column: 5, scope: !70)
!186 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_61b_goodG2BSource", scope: !71, file: !71, line: 123, type: !72, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !75)
!187 = !DILocalVariable(name: "data", arg: 1, scope: !186, file: !71, line: 123, type: !74)
!188 = !DILocation(line: 123, column: 85, scope: !186)
!189 = !DILocation(line: 127, column: 10, scope: !186)
!190 = !DILocation(line: 128, column: 12, scope: !186)
!191 = !DILocation(line: 128, column: 5, scope: !186)
!192 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_61b_goodB2GSource", scope: !71, file: !71, line: 132, type: !72, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !75)
!193 = !DILocalVariable(name: "data", arg: 1, scope: !192, file: !71, line: 132, type: !74)
!194 = !DILocation(line: 132, column: 85, scope: !192)
!195 = !DILocalVariable(name: "recvResult", scope: !196, file: !71, line: 139, type: !74)
!196 = distinct !DILexicalBlock(scope: !192, file: !71, line: 134, column: 5)
!197 = !DILocation(line: 139, column: 13, scope: !196)
!198 = !DILocalVariable(name: "service", scope: !196, file: !71, line: 140, type: !82)
!199 = !DILocation(line: 140, column: 28, scope: !196)
!200 = !DILocalVariable(name: "listenSocket", scope: !196, file: !71, line: 141, type: !74)
!201 = !DILocation(line: 141, column: 16, scope: !196)
!202 = !DILocalVariable(name: "acceptSocket", scope: !196, file: !71, line: 142, type: !74)
!203 = !DILocation(line: 142, column: 16, scope: !196)
!204 = !DILocalVariable(name: "inputBuffer", scope: !196, file: !71, line: 143, type: !60)
!205 = !DILocation(line: 143, column: 14, scope: !196)
!206 = !DILocation(line: 144, column: 9, scope: !196)
!207 = !DILocation(line: 154, column: 28, scope: !208)
!208 = distinct !DILexicalBlock(scope: !196, file: !71, line: 145, column: 9)
!209 = !DILocation(line: 154, column: 26, scope: !208)
!210 = !DILocation(line: 155, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !71, line: 155, column: 17)
!212 = !DILocation(line: 155, column: 30, scope: !211)
!213 = !DILocation(line: 155, column: 17, scope: !208)
!214 = !DILocation(line: 157, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !71, line: 156, column: 13)
!216 = !DILocation(line: 159, column: 13, scope: !208)
!217 = !DILocation(line: 160, column: 21, scope: !208)
!218 = !DILocation(line: 160, column: 32, scope: !208)
!219 = !DILocation(line: 161, column: 21, scope: !208)
!220 = !DILocation(line: 161, column: 30, scope: !208)
!221 = !DILocation(line: 161, column: 37, scope: !208)
!222 = !DILocation(line: 162, column: 32, scope: !208)
!223 = !DILocation(line: 162, column: 21, scope: !208)
!224 = !DILocation(line: 162, column: 30, scope: !208)
!225 = !DILocation(line: 163, column: 22, scope: !226)
!226 = distinct !DILexicalBlock(scope: !208, file: !71, line: 163, column: 17)
!227 = !DILocation(line: 163, column: 36, scope: !226)
!228 = !DILocation(line: 163, column: 17, scope: !226)
!229 = !DILocation(line: 163, column: 81, scope: !226)
!230 = !DILocation(line: 163, column: 17, scope: !208)
!231 = !DILocation(line: 165, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !226, file: !71, line: 164, column: 13)
!233 = !DILocation(line: 167, column: 24, scope: !234)
!234 = distinct !DILexicalBlock(scope: !208, file: !71, line: 167, column: 17)
!235 = !DILocation(line: 167, column: 17, scope: !234)
!236 = !DILocation(line: 167, column: 54, scope: !234)
!237 = !DILocation(line: 167, column: 17, scope: !208)
!238 = !DILocation(line: 169, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !71, line: 168, column: 13)
!240 = !DILocation(line: 171, column: 35, scope: !208)
!241 = !DILocation(line: 171, column: 28, scope: !208)
!242 = !DILocation(line: 171, column: 26, scope: !208)
!243 = !DILocation(line: 172, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !208, file: !71, line: 172, column: 17)
!245 = !DILocation(line: 172, column: 30, scope: !244)
!246 = !DILocation(line: 172, column: 17, scope: !208)
!247 = !DILocation(line: 174, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !71, line: 173, column: 13)
!249 = !DILocation(line: 177, column: 31, scope: !208)
!250 = !DILocation(line: 177, column: 45, scope: !208)
!251 = !DILocation(line: 177, column: 26, scope: !208)
!252 = !DILocation(line: 177, column: 24, scope: !208)
!253 = !DILocation(line: 178, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !208, file: !71, line: 178, column: 17)
!255 = !DILocation(line: 178, column: 28, scope: !254)
!256 = !DILocation(line: 178, column: 44, scope: !254)
!257 = !DILocation(line: 178, column: 47, scope: !254)
!258 = !DILocation(line: 178, column: 58, scope: !254)
!259 = !DILocation(line: 178, column: 17, scope: !208)
!260 = !DILocation(line: 180, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !254, file: !71, line: 179, column: 13)
!262 = !DILocation(line: 183, column: 25, scope: !208)
!263 = !DILocation(line: 183, column: 13, scope: !208)
!264 = !DILocation(line: 183, column: 37, scope: !208)
!265 = !DILocation(line: 185, column: 25, scope: !208)
!266 = !DILocation(line: 185, column: 20, scope: !208)
!267 = !DILocation(line: 185, column: 18, scope: !208)
!268 = !DILocation(line: 186, column: 9, scope: !208)
!269 = !DILocation(line: 188, column: 13, scope: !270)
!270 = distinct !DILexicalBlock(scope: !196, file: !71, line: 188, column: 13)
!271 = !DILocation(line: 188, column: 26, scope: !270)
!272 = !DILocation(line: 188, column: 13, scope: !196)
!273 = !DILocation(line: 190, column: 26, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !71, line: 189, column: 9)
!275 = !DILocation(line: 190, column: 13, scope: !274)
!276 = !DILocation(line: 191, column: 9, scope: !274)
!277 = !DILocation(line: 192, column: 13, scope: !278)
!278 = distinct !DILexicalBlock(scope: !196, file: !71, line: 192, column: 13)
!279 = !DILocation(line: 192, column: 26, scope: !278)
!280 = !DILocation(line: 192, column: 13, scope: !196)
!281 = !DILocation(line: 194, column: 26, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !71, line: 193, column: 9)
!283 = !DILocation(line: 194, column: 13, scope: !282)
!284 = !DILocation(line: 195, column: 9, scope: !282)
!285 = !DILocation(line: 203, column: 12, scope: !192)
!286 = !DILocation(line: 203, column: 5, scope: !192)
