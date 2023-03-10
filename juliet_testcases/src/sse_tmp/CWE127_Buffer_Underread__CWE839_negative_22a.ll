; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_22a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__CWE839_negative_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE127_Buffer_Underread__CWE839_negative_22_goodB2G1Global = dso_local global i32 0, align 4, !dbg !8
@CWE127_Buffer_Underread__CWE839_negative_22_goodB2G2Global = dso_local global i32 0, align 4, !dbg !12
@CWE127_Buffer_Underread__CWE839_negative_22_goodG2BGlobal = dso_local global i32 0, align 4, !dbg !14
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_22_bad() #0 !dbg !22 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 -1, i32* %data, align 4, !dbg !27
  store i32 -5, i32* %data, align 4, !dbg !28
  store i32 1, i32* @CWE127_Buffer_Underread__CWE839_negative_22_badGlobal, align 4, !dbg !29
  %0 = load i32, i32* %data, align 4, !dbg !30
  call void @CWE127_Buffer_Underread__CWE839_negative_22_badSink(i32 %0), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE127_Buffer_Underread__CWE839_negative_22_badSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__CWE839_negative_22_good() #0 !dbg !33 {
entry:
  call void @goodB2G1(), !dbg !34
  call void @goodB2G2(), !dbg !35
  call void @goodG2B(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !44, metadata !DIExpression()), !dbg !45
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !46, metadata !DIExpression()), !dbg !47
  %call = call i64 @time(i64* null) #4, !dbg !48
  %conv = trunc i64 %call to i32, !dbg !49
  call void @srand(i32 %conv) #4, !dbg !50
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !51
  call void @CWE127_Buffer_Underread__CWE839_negative_22_good(), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !54
  call void @CWE127_Buffer_Underread__CWE839_negative_22_bad(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !56
  ret i32 0, !dbg !57
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !58 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !59, metadata !DIExpression()), !dbg !60
  store i32 -1, i32* %data, align 4, !dbg !61
  store i32 -5, i32* %data, align 4, !dbg !62
  store i32 0, i32* @CWE127_Buffer_Underread__CWE839_negative_22_goodB2G1Global, align 4, !dbg !63
  %0 = load i32, i32* %data, align 4, !dbg !64
  call void @CWE127_Buffer_Underread__CWE839_negative_22_goodB2G1Sink(i32 %0), !dbg !65
  ret void, !dbg !66
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_negative_22_goodB2G1Sink(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !67 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 -1, i32* %data, align 4, !dbg !70
  store i32 -5, i32* %data, align 4, !dbg !71
  store i32 1, i32* @CWE127_Buffer_Underread__CWE839_negative_22_goodB2G2Global, align 4, !dbg !72
  %0 = load i32, i32* %data, align 4, !dbg !73
  call void @CWE127_Buffer_Underread__CWE839_negative_22_goodB2G2Sink(i32 %0), !dbg !74
  ret void, !dbg !75
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_negative_22_goodB2G2Sink(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 -1, i32* %data, align 4, !dbg !79
  store i32 7, i32* %data, align 4, !dbg !80
  store i32 1, i32* @CWE127_Buffer_Underread__CWE839_negative_22_goodG2BGlobal, align 4, !dbg !81
  %0 = load i32, i32* %data, align 4, !dbg !82
  call void @CWE127_Buffer_Underread__CWE839_negative_22_goodG2BSink(i32 %0), !dbg !83
  ret void, !dbg !84
}

declare dso_local void @CWE127_Buffer_Underread__CWE839_negative_22_goodG2BSink(i32) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_negative_22_badGlobal", scope: !2, file: !10, line: 23, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12, !14}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_negative_22_goodB2G1Global", scope: !2, file: !10, line: 43, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_negative_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_negative_22_goodB2G2Global", scope: !2, file: !10, line: 44, type: !11, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__CWE839_negative_22_goodG2BGlobal", scope: !2, file: !10, line: 45, type: !11, isLocal: false, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_22_bad", scope: !10, file: !10, line: 27, type: !23, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !10, line: 29, type: !11)
!26 = !DILocation(line: 29, column: 9, scope: !22)
!27 = !DILocation(line: 31, column: 10, scope: !22)
!28 = !DILocation(line: 33, column: 10, scope: !22)
!29 = !DILocation(line: 34, column: 59, scope: !22)
!30 = !DILocation(line: 35, column: 57, scope: !22)
!31 = !DILocation(line: 35, column: 5, scope: !22)
!32 = !DILocation(line: 36, column: 1, scope: !22)
!33 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_negative_22_good", scope: !10, file: !10, line: 90, type: !23, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DILocation(line: 92, column: 5, scope: !33)
!35 = !DILocation(line: 93, column: 5, scope: !33)
!36 = !DILocation(line: 94, column: 5, scope: !33)
!37 = !DILocation(line: 95, column: 1, scope: !33)
!38 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 106, type: !39, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{!11, !11, !41}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!43 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!44 = !DILocalVariable(name: "argc", arg: 1, scope: !38, file: !10, line: 106, type: !11)
!45 = !DILocation(line: 106, column: 14, scope: !38)
!46 = !DILocalVariable(name: "argv", arg: 2, scope: !38, file: !10, line: 106, type: !41)
!47 = !DILocation(line: 106, column: 27, scope: !38)
!48 = !DILocation(line: 109, column: 22, scope: !38)
!49 = !DILocation(line: 109, column: 12, scope: !38)
!50 = !DILocation(line: 109, column: 5, scope: !38)
!51 = !DILocation(line: 111, column: 5, scope: !38)
!52 = !DILocation(line: 112, column: 5, scope: !38)
!53 = !DILocation(line: 113, column: 5, scope: !38)
!54 = !DILocation(line: 116, column: 5, scope: !38)
!55 = !DILocation(line: 117, column: 5, scope: !38)
!56 = !DILocation(line: 118, column: 5, scope: !38)
!57 = !DILocation(line: 120, column: 5, scope: !38)
!58 = distinct !DISubprogram(name: "goodB2G1", scope: !10, file: !10, line: 50, type: !23, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocalVariable(name: "data", scope: !58, file: !10, line: 52, type: !11)
!60 = !DILocation(line: 52, column: 9, scope: !58)
!61 = !DILocation(line: 54, column: 10, scope: !58)
!62 = !DILocation(line: 56, column: 10, scope: !58)
!63 = !DILocation(line: 57, column: 64, scope: !58)
!64 = !DILocation(line: 58, column: 62, scope: !58)
!65 = !DILocation(line: 58, column: 5, scope: !58)
!66 = !DILocation(line: 59, column: 1, scope: !58)
!67 = distinct !DISubprogram(name: "goodB2G2", scope: !10, file: !10, line: 64, type: !23, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !10, line: 66, type: !11)
!69 = !DILocation(line: 66, column: 9, scope: !67)
!70 = !DILocation(line: 68, column: 10, scope: !67)
!71 = !DILocation(line: 70, column: 10, scope: !67)
!72 = !DILocation(line: 71, column: 64, scope: !67)
!73 = !DILocation(line: 72, column: 62, scope: !67)
!74 = !DILocation(line: 72, column: 5, scope: !67)
!75 = !DILocation(line: 73, column: 1, scope: !67)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 78, type: !23, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !10, line: 80, type: !11)
!78 = !DILocation(line: 80, column: 9, scope: !76)
!79 = !DILocation(line: 82, column: 10, scope: !76)
!80 = !DILocation(line: 85, column: 10, scope: !76)
!81 = !DILocation(line: 86, column: 63, scope: !76)
!82 = !DILocation(line: 87, column: 61, scope: !76)
!83 = !DILocation(line: 87, column: 5, scope: !76)
!84 = !DILocation(line: 88, column: 1, scope: !76)
