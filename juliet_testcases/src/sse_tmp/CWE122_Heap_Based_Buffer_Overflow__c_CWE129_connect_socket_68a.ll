; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_badData = dso_local global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_goodG2BData = dso_local global i32 0, align 4, !dbg !62
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_goodB2GData = dso_local global i32 0, align 4, !dbg !66

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_bad() #0 !dbg !74 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32 -1, i32* %data, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !81, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !84, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !107, metadata !DIExpression()), !dbg !108
  store i32 -1, i32* %connectSocket, align 4, !dbg !108
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  br label %do.body, !dbg !111

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !112
  store i32 %call, i32* %connectSocket, align 4, !dbg !114
  %0 = load i32, i32* %connectSocket, align 4, !dbg !115
  %cmp = icmp eq i32 %0, -1, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !119

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !121
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !122
  store i16 2, i16* %sin_family, align 4, !dbg !123
  %call1 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !124
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !125
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !126
  store i32 %call1, i32* %s_addr, align 4, !dbg !127
  %call2 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !128
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !129
  store i16 %call2, i16* %sin_port, align 2, !dbg !130
  %2 = load i32, i32* %connectSocket, align 4, !dbg !131
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !133
  %call3 = call i32 @connect(i32 %2, %struct.sockaddr* %3, i32 16), !dbg !134
  %cmp4 = icmp eq i32 %call3, -1, !dbg !135
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !136

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !137

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !139
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !140
  %call7 = call i64 @recv(i32 %4, i8* %arraydecay, i64 13, i32 0), !dbg !141
  %conv = trunc i64 %call7 to i32, !dbg !141
  store i32 %conv, i32* %recvResult, align 4, !dbg !142
  %5 = load i32, i32* %recvResult, align 4, !dbg !143
  %cmp8 = icmp eq i32 %5, -1, !dbg !145
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !146

lor.lhs.false:                                    ; preds = %if.end6
  %6 = load i32, i32* %recvResult, align 4, !dbg !147
  %cmp10 = icmp eq i32 %6, 0, !dbg !148
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !149

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !150

if.end13:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !152
  %idxprom = sext i32 %7 to i64, !dbg !153
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !155
  %call15 = call i32 @atoi(i8* %arraydecay14) #9, !dbg !156
  store i32 %call15, i32* %data, align 4, !dbg !157
  br label %do.end, !dbg !158

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !159
  %cmp16 = icmp ne i32 %8, -1, !dbg !161
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !162

if.then18:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !163
  %call19 = call i32 @close(i32 %9), !dbg !165
  br label %if.end20, !dbg !166

if.end20:                                         ; preds = %if.then18, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !167
  store i32 %10, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_badData, align 4, !dbg !168
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68b_badSink(), !dbg !169
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

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68b_badSink(...) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_good() #0 !dbg !171 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_good(), !dbg !188
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !189
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !190
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_bad(), !dbg !191
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
  call void @llvm.dbg.declare(metadata i32* %data, metadata !195, metadata !DIExpression()), !dbg !196
  store i32 -1, i32* %data, align 4, !dbg !197
  store i32 7, i32* %data, align 4, !dbg !198
  %0 = load i32, i32* %data, align 4, !dbg !199
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_goodG2BData, align 4, !dbg !200
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68b_goodG2BSink(), !dbg !201
  ret void, !dbg !202
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68b_goodG2BSink(...) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !203 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !204, metadata !DIExpression()), !dbg !205
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
  %10 = load i32, i32* %data, align 4, !dbg !272
  store i32 %10, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_goodB2GData, align 4, !dbg !273
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68b_goodB2GSink(), !dbg !274
  ret void, !dbg !275
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68b_goodB2GSink(...) #5

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
!llvm.module.flags = !{!68, !69, !70, !71, !72}
!llvm.ident = !{!73}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_badData", scope: !2, file: !64, line: 42, type: !65, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !61, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68a.c", directory: "/home/joelyang/SSE-Assessment")
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
!47 = !{!48, !7}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !50, line: 178, size: 128, elements: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!51 = !{!52, !56}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !49, file: !50, line: 180, baseType: !53, size: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !54, line: 28, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!55 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !49, file: !50, line: 181, baseType: !57, size: 112, offset: 16)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 112, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 14)
!61 = !{!0, !62, !66}
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_goodG2BData", scope: !2, file: !64, line: 43, type: !65, isLocal: false, isDefinition: true)
!64 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68a.c", directory: "/home/joelyang/SSE-Assessment")
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_goodB2GData", scope: !2, file: !64, line: 44, type: !65, isLocal: false, isDefinition: true)
!68 = !{i32 7, !"Dwarf Version", i32 4}
!69 = !{i32 2, !"Debug Info Version", i32 3}
!70 = !{i32 1, !"wchar_size", i32 4}
!71 = !{i32 7, !"uwtable", i32 1}
!72 = !{i32 7, !"frame-pointer", i32 2}
!73 = !{!"clang version 13.0.0"}
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_bad", scope: !64, file: !64, line: 51, type: !75, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!75 = !DISubroutineType(types: !76)
!76 = !{null}
!77 = !{}
!78 = !DILocalVariable(name: "data", scope: !74, file: !64, line: 53, type: !65)
!79 = !DILocation(line: 53, column: 9, scope: !74)
!80 = !DILocation(line: 55, column: 10, scope: !74)
!81 = !DILocalVariable(name: "recvResult", scope: !82, file: !64, line: 61, type: !65)
!82 = distinct !DILexicalBlock(scope: !74, file: !64, line: 56, column: 5)
!83 = !DILocation(line: 61, column: 13, scope: !82)
!84 = !DILocalVariable(name: "service", scope: !82, file: !64, line: 62, type: !85)
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !86)
!86 = !{!87, !88, !94, !101}
!87 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !85, file: !19, line: 240, baseType: !53, size: 16)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !85, file: !19, line: 241, baseType: !89, size: 16, offset: 16)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !91, line: 25, baseType: !92)
!91 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !93, line: 40, baseType: !55)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !85, file: !19, line: 242, baseType: !95, size: 32, offset: 32)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !96)
!96 = !{!97}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !95, file: !19, line: 33, baseType: !98, size: 32)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !91, line: 26, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !93, line: 42, baseType: !7)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !85, file: !19, line: 245, baseType: !102, size: 64, offset: 64)
!102 = !DICompositeType(tag: DW_TAG_array_type, baseType: !103, size: 64, elements: !104)
!103 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!104 = !{!105}
!105 = !DISubrange(count: 8)
!106 = !DILocation(line: 62, column: 28, scope: !82)
!107 = !DILocalVariable(name: "connectSocket", scope: !82, file: !64, line: 63, type: !65)
!108 = !DILocation(line: 63, column: 16, scope: !82)
!109 = !DILocalVariable(name: "inputBuffer", scope: !82, file: !64, line: 64, type: !57)
!110 = !DILocation(line: 64, column: 14, scope: !82)
!111 = !DILocation(line: 65, column: 9, scope: !82)
!112 = !DILocation(line: 75, column: 29, scope: !113)
!113 = distinct !DILexicalBlock(scope: !82, file: !64, line: 66, column: 9)
!114 = !DILocation(line: 75, column: 27, scope: !113)
!115 = !DILocation(line: 76, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !64, line: 76, column: 17)
!117 = !DILocation(line: 76, column: 31, scope: !116)
!118 = !DILocation(line: 76, column: 17, scope: !113)
!119 = !DILocation(line: 78, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !64, line: 77, column: 13)
!121 = !DILocation(line: 80, column: 13, scope: !113)
!122 = !DILocation(line: 81, column: 21, scope: !113)
!123 = !DILocation(line: 81, column: 32, scope: !113)
!124 = !DILocation(line: 82, column: 39, scope: !113)
!125 = !DILocation(line: 82, column: 21, scope: !113)
!126 = !DILocation(line: 82, column: 30, scope: !113)
!127 = !DILocation(line: 82, column: 37, scope: !113)
!128 = !DILocation(line: 83, column: 32, scope: !113)
!129 = !DILocation(line: 83, column: 21, scope: !113)
!130 = !DILocation(line: 83, column: 30, scope: !113)
!131 = !DILocation(line: 84, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !113, file: !64, line: 84, column: 17)
!133 = !DILocation(line: 84, column: 40, scope: !132)
!134 = !DILocation(line: 84, column: 17, scope: !132)
!135 = !DILocation(line: 84, column: 85, scope: !132)
!136 = !DILocation(line: 84, column: 17, scope: !113)
!137 = !DILocation(line: 86, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !64, line: 85, column: 13)
!139 = !DILocation(line: 90, column: 31, scope: !113)
!140 = !DILocation(line: 90, column: 46, scope: !113)
!141 = !DILocation(line: 90, column: 26, scope: !113)
!142 = !DILocation(line: 90, column: 24, scope: !113)
!143 = !DILocation(line: 91, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !113, file: !64, line: 91, column: 17)
!145 = !DILocation(line: 91, column: 28, scope: !144)
!146 = !DILocation(line: 91, column: 44, scope: !144)
!147 = !DILocation(line: 91, column: 47, scope: !144)
!148 = !DILocation(line: 91, column: 58, scope: !144)
!149 = !DILocation(line: 91, column: 17, scope: !113)
!150 = !DILocation(line: 93, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !144, file: !64, line: 92, column: 13)
!152 = !DILocation(line: 96, column: 25, scope: !113)
!153 = !DILocation(line: 96, column: 13, scope: !113)
!154 = !DILocation(line: 96, column: 37, scope: !113)
!155 = !DILocation(line: 98, column: 25, scope: !113)
!156 = !DILocation(line: 98, column: 20, scope: !113)
!157 = !DILocation(line: 98, column: 18, scope: !113)
!158 = !DILocation(line: 99, column: 9, scope: !113)
!159 = !DILocation(line: 101, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !82, file: !64, line: 101, column: 13)
!161 = !DILocation(line: 101, column: 27, scope: !160)
!162 = !DILocation(line: 101, column: 13, scope: !82)
!163 = !DILocation(line: 103, column: 26, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !64, line: 102, column: 9)
!165 = !DILocation(line: 103, column: 13, scope: !164)
!166 = !DILocation(line: 104, column: 9, scope: !164)
!167 = !DILocation(line: 112, column: 77, scope: !74)
!168 = !DILocation(line: 112, column: 75, scope: !74)
!169 = !DILocation(line: 113, column: 5, scope: !74)
!170 = !DILocation(line: 114, column: 1, scope: !74)
!171 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_68_good", scope: !64, file: !64, line: 203, type: !75, scopeLine: 204, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!172 = !DILocation(line: 205, column: 5, scope: !171)
!173 = !DILocation(line: 206, column: 5, scope: !171)
!174 = !DILocation(line: 207, column: 1, scope: !171)
!175 = distinct !DISubprogram(name: "main", scope: !64, file: !64, line: 218, type: !176, scopeLine: 219, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !77)
!176 = !DISubroutineType(types: !177)
!177 = !{!65, !65, !178}
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!180 = !DILocalVariable(name: "argc", arg: 1, scope: !175, file: !64, line: 218, type: !65)
!181 = !DILocation(line: 218, column: 14, scope: !175)
!182 = !DILocalVariable(name: "argv", arg: 2, scope: !175, file: !64, line: 218, type: !178)
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
!194 = distinct !DISubprogram(name: "goodG2B", scope: !64, file: !64, line: 125, type: !75, scopeLine: 126, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!195 = !DILocalVariable(name: "data", scope: !194, file: !64, line: 127, type: !65)
!196 = !DILocation(line: 127, column: 9, scope: !194)
!197 = !DILocation(line: 129, column: 10, scope: !194)
!198 = !DILocation(line: 132, column: 10, scope: !194)
!199 = !DILocation(line: 133, column: 81, scope: !194)
!200 = !DILocation(line: 133, column: 79, scope: !194)
!201 = !DILocation(line: 134, column: 5, scope: !194)
!202 = !DILocation(line: 135, column: 1, scope: !194)
!203 = distinct !DISubprogram(name: "goodB2G", scope: !64, file: !64, line: 138, type: !75, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !77)
!204 = !DILocalVariable(name: "data", scope: !203, file: !64, line: 140, type: !65)
!205 = !DILocation(line: 140, column: 9, scope: !203)
!206 = !DILocation(line: 142, column: 10, scope: !203)
!207 = !DILocalVariable(name: "recvResult", scope: !208, file: !64, line: 148, type: !65)
!208 = distinct !DILexicalBlock(scope: !203, file: !64, line: 143, column: 5)
!209 = !DILocation(line: 148, column: 13, scope: !208)
!210 = !DILocalVariable(name: "service", scope: !208, file: !64, line: 149, type: !85)
!211 = !DILocation(line: 149, column: 28, scope: !208)
!212 = !DILocalVariable(name: "connectSocket", scope: !208, file: !64, line: 150, type: !65)
!213 = !DILocation(line: 150, column: 16, scope: !208)
!214 = !DILocalVariable(name: "inputBuffer", scope: !208, file: !64, line: 151, type: !57)
!215 = !DILocation(line: 151, column: 14, scope: !208)
!216 = !DILocation(line: 152, column: 9, scope: !208)
!217 = !DILocation(line: 162, column: 29, scope: !218)
!218 = distinct !DILexicalBlock(scope: !208, file: !64, line: 153, column: 9)
!219 = !DILocation(line: 162, column: 27, scope: !218)
!220 = !DILocation(line: 163, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !64, line: 163, column: 17)
!222 = !DILocation(line: 163, column: 31, scope: !221)
!223 = !DILocation(line: 163, column: 17, scope: !218)
!224 = !DILocation(line: 165, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !64, line: 164, column: 13)
!226 = !DILocation(line: 167, column: 13, scope: !218)
!227 = !DILocation(line: 168, column: 21, scope: !218)
!228 = !DILocation(line: 168, column: 32, scope: !218)
!229 = !DILocation(line: 169, column: 39, scope: !218)
!230 = !DILocation(line: 169, column: 21, scope: !218)
!231 = !DILocation(line: 169, column: 30, scope: !218)
!232 = !DILocation(line: 169, column: 37, scope: !218)
!233 = !DILocation(line: 170, column: 32, scope: !218)
!234 = !DILocation(line: 170, column: 21, scope: !218)
!235 = !DILocation(line: 170, column: 30, scope: !218)
!236 = !DILocation(line: 171, column: 25, scope: !237)
!237 = distinct !DILexicalBlock(scope: !218, file: !64, line: 171, column: 17)
!238 = !DILocation(line: 171, column: 40, scope: !237)
!239 = !DILocation(line: 171, column: 17, scope: !237)
!240 = !DILocation(line: 171, column: 85, scope: !237)
!241 = !DILocation(line: 171, column: 17, scope: !218)
!242 = !DILocation(line: 173, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !237, file: !64, line: 172, column: 13)
!244 = !DILocation(line: 177, column: 31, scope: !218)
!245 = !DILocation(line: 177, column: 46, scope: !218)
!246 = !DILocation(line: 177, column: 26, scope: !218)
!247 = !DILocation(line: 177, column: 24, scope: !218)
!248 = !DILocation(line: 178, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !218, file: !64, line: 178, column: 17)
!250 = !DILocation(line: 178, column: 28, scope: !249)
!251 = !DILocation(line: 178, column: 44, scope: !249)
!252 = !DILocation(line: 178, column: 47, scope: !249)
!253 = !DILocation(line: 178, column: 58, scope: !249)
!254 = !DILocation(line: 178, column: 17, scope: !218)
!255 = !DILocation(line: 180, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !249, file: !64, line: 179, column: 13)
!257 = !DILocation(line: 183, column: 25, scope: !218)
!258 = !DILocation(line: 183, column: 13, scope: !218)
!259 = !DILocation(line: 183, column: 37, scope: !218)
!260 = !DILocation(line: 185, column: 25, scope: !218)
!261 = !DILocation(line: 185, column: 20, scope: !218)
!262 = !DILocation(line: 185, column: 18, scope: !218)
!263 = !DILocation(line: 186, column: 9, scope: !218)
!264 = !DILocation(line: 188, column: 13, scope: !265)
!265 = distinct !DILexicalBlock(scope: !208, file: !64, line: 188, column: 13)
!266 = !DILocation(line: 188, column: 27, scope: !265)
!267 = !DILocation(line: 188, column: 13, scope: !208)
!268 = !DILocation(line: 190, column: 26, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !64, line: 189, column: 9)
!270 = !DILocation(line: 190, column: 13, scope: !269)
!271 = !DILocation(line: 191, column: 9, scope: !269)
!272 = !DILocation(line: 199, column: 81, scope: !203)
!273 = !DILocation(line: 199, column: 79, scope: !203)
!274 = !DILocation(line: 200, column: 5, scope: !203)
!275 = !DILocation(line: 201, column: 1, scope: !203)
