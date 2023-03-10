; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_22b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__CWE839_listen_socket_22_badGlobal = external dso_local global i32, align 4
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is too big.\00", align 1
@CWE127_Buffer_Underread__CWE839_listen_socket_22_goodB2G1Global = external dso_local global i32, align 4
@.str.1 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@CWE127_Buffer_Underread__CWE839_listen_socket_22_goodB2G2Global = external dso_local global i32, align 4
@CWE127_Buffer_Underread__CWE839_listen_socket_22_goodG2BGlobal = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_22_badSink(i32 %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* @CWE127_Buffer_Underread__CWE839_listen_socket_22_badGlobal, align 4, !dbg !16
  %tobool = icmp ne i32 %0, 0, !dbg !16
  br i1 %tobool, label %if.then, label %if.end2, !dbg !18

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !19, metadata !DIExpression()), !dbg !25
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !25
  %2 = load i32, i32* %data.addr, align 4, !dbg !26
  %cmp = icmp slt i32 %2, 10, !dbg !28
  br i1 %cmp, label %if.then1, label %if.else, !dbg !29

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !30
  %idxprom = sext i32 %3 to i64, !dbg !32
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !32
  %4 = load i32, i32* %arrayidx, align 4, !dbg !32
  call void @printIntLine(i32 %4), !dbg !33
  br label %if.end, !dbg !34

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !35
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !37

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_22_goodB2G1Sink(i32 %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i32, i32* @CWE127_Buffer_Underread__CWE839_listen_socket_22_goodB2G1Global, align 4, !dbg !42
  %tobool = icmp ne i32 %0, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.else, !dbg !44

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0)), !dbg !45
  br label %if.end4, !dbg !47

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !48, metadata !DIExpression()), !dbg !51
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !51
  %2 = load i32, i32* %data.addr, align 4, !dbg !52
  %cmp = icmp sge i32 %2, 0, !dbg !54
  br i1 %cmp, label %land.lhs.true, label %if.else3, !dbg !55

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !56
  %cmp1 = icmp slt i32 %3, 10, !dbg !57
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !58

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !59
  %idxprom = sext i32 %4 to i64, !dbg !61
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !61
  %5 = load i32, i32* %arrayidx, align 4, !dbg !61
  call void @printIntLine(i32 %5), !dbg !62
  br label %if.end, !dbg !63

if.else3:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_22_goodB2G2Sink(i32 %data) #0 !dbg !67 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32, i32* @CWE127_Buffer_Underread__CWE839_listen_socket_22_goodB2G2Global, align 4, !dbg !70
  %tobool = icmp ne i32 %0, 0, !dbg !70
  br i1 %tobool, label %if.then, label %if.end3, !dbg !72

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !73, metadata !DIExpression()), !dbg !76
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !76
  %2 = load i32, i32* %data.addr, align 4, !dbg !77
  %cmp = icmp sge i32 %2, 0, !dbg !79
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !80

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !81
  %cmp1 = icmp slt i32 %3, 10, !dbg !82
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !83

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !84
  %idxprom = sext i32 %4 to i64, !dbg !86
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !86
  %5 = load i32, i32* %arrayidx, align 4, !dbg !86
  call void @printIntLine(i32 %5), !dbg !87
  br label %if.end, !dbg !88

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3, !dbg !91

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_listen_socket_22_goodG2BSink(i32 %data) #0 !dbg !93 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = load i32, i32* @CWE127_Buffer_Underread__CWE839_listen_socket_22_goodG2BGlobal, align 4, !dbg !96
  %tobool = icmp ne i32 %0, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.end2, !dbg !98

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !99, metadata !DIExpression()), !dbg !102
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !102
  %2 = load i32, i32* %data.addr, align 4, !dbg !103
  %cmp = icmp slt i32 %2, 10, !dbg !105
  br i1 %cmp, label %if.then1, label %if.else, !dbg !106

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !107
  %idxprom = sext i32 %3 to i64, !dbg !109
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !109
  %4 = load i32, i32* %arrayidx, align 4, !dbg !109
  call void @printIntLine(i32 %4), !dbg !110
  br label %if.end, !dbg !111

if.else:                                          ; preds = %if.then
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !112
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !114

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_22_badSink", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_listen_socket_22b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 25, type: !13)
!15 = !DILocation(line: 25, column: 67, scope: !9)
!16 = !DILocation(line: 27, column: 8, scope: !17)
!17 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 8)
!18 = !DILocation(line: 27, column: 8, scope: !9)
!19 = !DILocalVariable(name: "buffer", scope: !20, file: !10, line: 30, type: !22)
!20 = distinct !DILexicalBlock(scope: !21, file: !10, line: 29, column: 9)
!21 = distinct !DILexicalBlock(scope: !17, file: !10, line: 28, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 30, column: 17, scope: !20)
!26 = !DILocation(line: 33, column: 17, scope: !27)
!27 = distinct !DILexicalBlock(scope: !20, file: !10, line: 33, column: 17)
!28 = !DILocation(line: 33, column: 22, scope: !27)
!29 = !DILocation(line: 33, column: 17, scope: !20)
!30 = !DILocation(line: 35, column: 37, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !10, line: 34, column: 13)
!32 = !DILocation(line: 35, column: 30, scope: !31)
!33 = !DILocation(line: 35, column: 17, scope: !31)
!34 = !DILocation(line: 36, column: 13, scope: !31)
!35 = !DILocation(line: 39, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !27, file: !10, line: 38, column: 13)
!37 = !DILocation(line: 42, column: 5, scope: !21)
!38 = !DILocation(line: 43, column: 1, scope: !9)
!39 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_22_goodB2G1Sink", scope: !10, file: !10, line: 55, type: !11, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !10, line: 55, type: !13)
!41 = !DILocation(line: 55, column: 72, scope: !39)
!42 = !DILocation(line: 57, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !10, line: 57, column: 8)
!44 = !DILocation(line: 57, column: 8, scope: !39)
!45 = !DILocation(line: 60, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !10, line: 58, column: 5)
!47 = !DILocation(line: 61, column: 5, scope: !46)
!48 = !DILocalVariable(name: "buffer", scope: !49, file: !10, line: 65, type: !22)
!49 = distinct !DILexicalBlock(scope: !50, file: !10, line: 64, column: 9)
!50 = distinct !DILexicalBlock(scope: !43, file: !10, line: 63, column: 5)
!51 = !DILocation(line: 65, column: 17, scope: !49)
!52 = !DILocation(line: 67, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !10, line: 67, column: 17)
!54 = !DILocation(line: 67, column: 22, scope: !53)
!55 = !DILocation(line: 67, column: 27, scope: !53)
!56 = !DILocation(line: 67, column: 30, scope: !53)
!57 = !DILocation(line: 67, column: 35, scope: !53)
!58 = !DILocation(line: 67, column: 17, scope: !49)
!59 = !DILocation(line: 69, column: 37, scope: !60)
!60 = distinct !DILexicalBlock(scope: !53, file: !10, line: 68, column: 13)
!61 = !DILocation(line: 69, column: 30, scope: !60)
!62 = !DILocation(line: 69, column: 17, scope: !60)
!63 = !DILocation(line: 70, column: 13, scope: !60)
!64 = !DILocation(line: 73, column: 17, scope: !65)
!65 = distinct !DILexicalBlock(scope: !53, file: !10, line: 72, column: 13)
!66 = !DILocation(line: 77, column: 1, scope: !39)
!67 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_22_goodB2G2Sink", scope: !10, file: !10, line: 80, type: !11, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", arg: 1, scope: !67, file: !10, line: 80, type: !13)
!69 = !DILocation(line: 80, column: 72, scope: !67)
!70 = !DILocation(line: 82, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !10, line: 82, column: 8)
!72 = !DILocation(line: 82, column: 8, scope: !67)
!73 = !DILocalVariable(name: "buffer", scope: !74, file: !10, line: 85, type: !22)
!74 = distinct !DILexicalBlock(scope: !75, file: !10, line: 84, column: 9)
!75 = distinct !DILexicalBlock(scope: !71, file: !10, line: 83, column: 5)
!76 = !DILocation(line: 85, column: 17, scope: !74)
!77 = !DILocation(line: 87, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !10, line: 87, column: 17)
!79 = !DILocation(line: 87, column: 22, scope: !78)
!80 = !DILocation(line: 87, column: 27, scope: !78)
!81 = !DILocation(line: 87, column: 30, scope: !78)
!82 = !DILocation(line: 87, column: 35, scope: !78)
!83 = !DILocation(line: 87, column: 17, scope: !74)
!84 = !DILocation(line: 89, column: 37, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !10, line: 88, column: 13)
!86 = !DILocation(line: 89, column: 30, scope: !85)
!87 = !DILocation(line: 89, column: 17, scope: !85)
!88 = !DILocation(line: 90, column: 13, scope: !85)
!89 = !DILocation(line: 93, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !10, line: 92, column: 13)
!91 = !DILocation(line: 96, column: 5, scope: !75)
!92 = !DILocation(line: 97, column: 1, scope: !67)
!93 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_listen_socket_22_goodG2BSink", scope: !10, file: !10, line: 100, type: !11, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", arg: 1, scope: !93, file: !10, line: 100, type: !13)
!95 = !DILocation(line: 100, column: 71, scope: !93)
!96 = !DILocation(line: 102, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !10, line: 102, column: 8)
!98 = !DILocation(line: 102, column: 8, scope: !93)
!99 = !DILocalVariable(name: "buffer", scope: !100, file: !10, line: 105, type: !22)
!100 = distinct !DILexicalBlock(scope: !101, file: !10, line: 104, column: 9)
!101 = distinct !DILexicalBlock(scope: !97, file: !10, line: 103, column: 5)
!102 = !DILocation(line: 105, column: 17, scope: !100)
!103 = !DILocation(line: 108, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !10, line: 108, column: 17)
!105 = !DILocation(line: 108, column: 22, scope: !104)
!106 = !DILocation(line: 108, column: 17, scope: !100)
!107 = !DILocation(line: 110, column: 37, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !10, line: 109, column: 13)
!109 = !DILocation(line: 110, column: 30, scope: !108)
!110 = !DILocation(line: 110, column: 17, scope: !108)
!111 = !DILocation(line: 111, column: 13, scope: !108)
!112 = !DILocation(line: 114, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !10, line: 113, column: 13)
!114 = !DILocation(line: 117, column: 5, scope: !101)
!115 = !DILocation(line: 118, column: 1, scope: !93)
