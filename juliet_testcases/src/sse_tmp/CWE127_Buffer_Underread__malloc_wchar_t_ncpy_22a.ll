; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_badGlobal, align 4, !dbg !29
  %0 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_badSource(i32* %0), !dbg !31
  store i32* %call, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !39
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !43
  %1 = load i32*, i32** %data, align 8, !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %call4 = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !46
  %call5 = call i32* @wcsncpy(i32* %arraydecay2, i32* %1, i64 %call4) #5, !dbg !47
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx6, align 4, !dbg !49
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  call void @printWLine(i32* %arraydecay7), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32* null, i32** %data, align 8, !dbg !80
  store i32 0, i32* @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_goodG2B1Global, align 4, !dbg !81
  %0 = load i32*, i32** %data, align 8, !dbg !82
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_goodG2B1Source(i32* %0), !dbg !83
  store i32* %call, i32** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !89
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !94
  %call4 = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !95
  %call5 = call i32* @wcsncpy(i32* %arraydecay2, i32* %1, i64 %call4) #5, !dbg !96
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx6, align 4, !dbg !98
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !99
  call void @printWLine(i32* %arraydecay7), !dbg !100
  ret void, !dbg !101
}

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store i32* null, i32** %data, align 8, !dbg !105
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_goodG2B2Global, align 4, !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_goodG2B2Source(i32* %0), !dbg !108
  store i32* %call, i32** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !114
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !118
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call4 = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !120
  %call5 = call i32* @wcsncpy(i32* %arraydecay2, i32* %1, i64 %call4) #5, !dbg !121
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx6, align 4, !dbg !123
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  call void @printWLine(i32* %arraydecay7), !dbg !125
  ret void, !dbg !126
}

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_goodG2B1Global", scope: !2, file: !10, line: 53, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_goodG2B2Global", scope: !2, file: !10, line: 54, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocation(line: 31, column: 10, scope: !20)
!29 = !DILocation(line: 32, column: 63, scope: !20)
!30 = !DILocation(line: 33, column: 70, scope: !20)
!31 = !DILocation(line: 33, column: 12, scope: !20)
!32 = !DILocation(line: 33, column: 10, scope: !20)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !10, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 35, column: 17, scope: !34)
!39 = !DILocation(line: 36, column: 17, scope: !34)
!40 = !DILocation(line: 36, column: 9, scope: !34)
!41 = !DILocation(line: 37, column: 9, scope: !34)
!42 = !DILocation(line: 37, column: 21, scope: !34)
!43 = !DILocation(line: 39, column: 17, scope: !34)
!44 = !DILocation(line: 39, column: 23, scope: !34)
!45 = !DILocation(line: 39, column: 36, scope: !34)
!46 = !DILocation(line: 39, column: 29, scope: !34)
!47 = !DILocation(line: 39, column: 9, scope: !34)
!48 = !DILocation(line: 41, column: 9, scope: !34)
!49 = !DILocation(line: 41, column: 21, scope: !34)
!50 = !DILocation(line: 42, column: 20, scope: !34)
!51 = !DILocation(line: 42, column: 9, scope: !34)
!52 = !DILocation(line: 46, column: 1, scope: !20)
!53 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_22_good", scope: !10, file: !10, line: 102, type: !21, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocation(line: 104, column: 5, scope: !53)
!55 = !DILocation(line: 105, column: 5, scope: !53)
!56 = !DILocation(line: 106, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 118, type: !58, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DISubroutineType(types: !59)
!59 = !{!11, !11, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !10, line: 118, type: !11)
!64 = !DILocation(line: 118, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !10, line: 118, type: !60)
!66 = !DILocation(line: 118, column: 27, scope: !57)
!67 = !DILocation(line: 121, column: 22, scope: !57)
!68 = !DILocation(line: 121, column: 12, scope: !57)
!69 = !DILocation(line: 121, column: 5, scope: !57)
!70 = !DILocation(line: 123, column: 5, scope: !57)
!71 = !DILocation(line: 124, column: 5, scope: !57)
!72 = !DILocation(line: 125, column: 5, scope: !57)
!73 = !DILocation(line: 128, column: 5, scope: !57)
!74 = !DILocation(line: 129, column: 5, scope: !57)
!75 = !DILocation(line: 130, column: 5, scope: !57)
!76 = !DILocation(line: 132, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 59, type: !21, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !10, line: 61, type: !24)
!79 = !DILocation(line: 61, column: 15, scope: !77)
!80 = !DILocation(line: 62, column: 10, scope: !77)
!81 = !DILocation(line: 63, column: 68, scope: !77)
!82 = !DILocation(line: 64, column: 75, scope: !77)
!83 = !DILocation(line: 64, column: 12, scope: !77)
!84 = !DILocation(line: 64, column: 10, scope: !77)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !10, line: 66, type: !35)
!86 = distinct !DILexicalBlock(scope: !77, file: !10, line: 65, column: 5)
!87 = !DILocation(line: 66, column: 17, scope: !86)
!88 = !DILocation(line: 67, column: 17, scope: !86)
!89 = !DILocation(line: 67, column: 9, scope: !86)
!90 = !DILocation(line: 68, column: 9, scope: !86)
!91 = !DILocation(line: 68, column: 21, scope: !86)
!92 = !DILocation(line: 70, column: 17, scope: !86)
!93 = !DILocation(line: 70, column: 23, scope: !86)
!94 = !DILocation(line: 70, column: 36, scope: !86)
!95 = !DILocation(line: 70, column: 29, scope: !86)
!96 = !DILocation(line: 70, column: 9, scope: !86)
!97 = !DILocation(line: 72, column: 9, scope: !86)
!98 = !DILocation(line: 72, column: 21, scope: !86)
!99 = !DILocation(line: 73, column: 20, scope: !86)
!100 = !DILocation(line: 73, column: 9, scope: !86)
!101 = !DILocation(line: 77, column: 1, scope: !77)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 82, type: !21, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !10, line: 84, type: !24)
!104 = !DILocation(line: 84, column: 15, scope: !102)
!105 = !DILocation(line: 85, column: 10, scope: !102)
!106 = !DILocation(line: 86, column: 68, scope: !102)
!107 = !DILocation(line: 87, column: 75, scope: !102)
!108 = !DILocation(line: 87, column: 12, scope: !102)
!109 = !DILocation(line: 87, column: 10, scope: !102)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !10, line: 89, type: !35)
!111 = distinct !DILexicalBlock(scope: !102, file: !10, line: 88, column: 5)
!112 = !DILocation(line: 89, column: 17, scope: !111)
!113 = !DILocation(line: 90, column: 17, scope: !111)
!114 = !DILocation(line: 90, column: 9, scope: !111)
!115 = !DILocation(line: 91, column: 9, scope: !111)
!116 = !DILocation(line: 91, column: 21, scope: !111)
!117 = !DILocation(line: 93, column: 17, scope: !111)
!118 = !DILocation(line: 93, column: 23, scope: !111)
!119 = !DILocation(line: 93, column: 36, scope: !111)
!120 = !DILocation(line: 93, column: 29, scope: !111)
!121 = !DILocation(line: 93, column: 9, scope: !111)
!122 = !DILocation(line: 95, column: 9, scope: !111)
!123 = !DILocation(line: 95, column: 21, scope: !111)
!124 = !DILocation(line: 96, column: 20, scope: !111)
!125 = !DILocation(line: 96, column: 9, scope: !111)
!126 = !DILocation(line: 100, column: 1, scope: !102)
