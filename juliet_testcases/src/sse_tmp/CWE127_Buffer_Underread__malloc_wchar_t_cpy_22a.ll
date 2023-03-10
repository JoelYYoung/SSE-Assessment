; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_22a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_badGlobal, align 4, !dbg !29
  %0 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_badSource(i32* %0), !dbg !31
  store i32* %call, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !39
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !40
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !43
  %1 = load i32*, i32** %data, align 8, !dbg !44
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %1) #4, !dbg !45
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !46
  call void @printWLine(i32* %arraydecay4), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #4, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #4, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i32* null, i32** %data, align 8, !dbg !76
  store i32 0, i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_goodG2B1Global, align 4, !dbg !77
  %0 = load i32*, i32** %data, align 8, !dbg !78
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_goodG2B1Source(i32* %0), !dbg !79
  store i32* %call, i32** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !81, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !84
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !85
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !88
  %1 = load i32*, i32** %data, align 8, !dbg !89
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %1) #4, !dbg !90
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* %arraydecay4), !dbg !92
  ret void, !dbg !93
}

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_goodG2B2Global, align 4, !dbg !98
  %0 = load i32*, i32** %data, align 8, !dbg !99
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_goodG2B2Source(i32* %0), !dbg !100
  store i32* %call, i32** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !105
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !106
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %arraydecay2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %call3 = call i32* @wcscpy(i32* %arraydecay2, i32* %1) #4, !dbg !111
  %arraydecay4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* %arraydecay4), !dbg !113
  ret void, !dbg !114
}

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_goodG2B1Global", scope: !2, file: !10, line: 51, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_goodG2B2Global", scope: !2, file: !10, line: 52, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocation(line: 31, column: 10, scope: !20)
!29 = !DILocation(line: 32, column: 62, scope: !20)
!30 = !DILocation(line: 33, column: 69, scope: !20)
!31 = !DILocation(line: 33, column: 12, scope: !20)
!32 = !DILocation(line: 33, column: 10, scope: !20)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !10, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 200)
!38 = !DILocation(line: 35, column: 17, scope: !34)
!39 = !DILocation(line: 36, column: 17, scope: !34)
!40 = !DILocation(line: 36, column: 9, scope: !34)
!41 = !DILocation(line: 37, column: 9, scope: !34)
!42 = !DILocation(line: 37, column: 23, scope: !34)
!43 = !DILocation(line: 39, column: 16, scope: !34)
!44 = !DILocation(line: 39, column: 22, scope: !34)
!45 = !DILocation(line: 39, column: 9, scope: !34)
!46 = !DILocation(line: 40, column: 20, scope: !34)
!47 = !DILocation(line: 40, column: 9, scope: !34)
!48 = !DILocation(line: 44, column: 1, scope: !20)
!49 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_cpy_22_good", scope: !10, file: !10, line: 96, type: !21, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DILocation(line: 98, column: 5, scope: !49)
!51 = !DILocation(line: 99, column: 5, scope: !49)
!52 = !DILocation(line: 100, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 112, type: !54, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!11, !11, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !10, line: 112, type: !11)
!60 = !DILocation(line: 112, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !10, line: 112, type: !56)
!62 = !DILocation(line: 112, column: 27, scope: !53)
!63 = !DILocation(line: 115, column: 22, scope: !53)
!64 = !DILocation(line: 115, column: 12, scope: !53)
!65 = !DILocation(line: 115, column: 5, scope: !53)
!66 = !DILocation(line: 117, column: 5, scope: !53)
!67 = !DILocation(line: 118, column: 5, scope: !53)
!68 = !DILocation(line: 119, column: 5, scope: !53)
!69 = !DILocation(line: 122, column: 5, scope: !53)
!70 = !DILocation(line: 123, column: 5, scope: !53)
!71 = !DILocation(line: 124, column: 5, scope: !53)
!72 = !DILocation(line: 126, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 57, type: !21, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !10, line: 59, type: !24)
!75 = !DILocation(line: 59, column: 15, scope: !73)
!76 = !DILocation(line: 60, column: 10, scope: !73)
!77 = !DILocation(line: 61, column: 67, scope: !73)
!78 = !DILocation(line: 62, column: 74, scope: !73)
!79 = !DILocation(line: 62, column: 12, scope: !73)
!80 = !DILocation(line: 62, column: 10, scope: !73)
!81 = !DILocalVariable(name: "dest", scope: !82, file: !10, line: 64, type: !35)
!82 = distinct !DILexicalBlock(scope: !73, file: !10, line: 63, column: 5)
!83 = !DILocation(line: 64, column: 17, scope: !82)
!84 = !DILocation(line: 65, column: 17, scope: !82)
!85 = !DILocation(line: 65, column: 9, scope: !82)
!86 = !DILocation(line: 66, column: 9, scope: !82)
!87 = !DILocation(line: 66, column: 23, scope: !82)
!88 = !DILocation(line: 68, column: 16, scope: !82)
!89 = !DILocation(line: 68, column: 22, scope: !82)
!90 = !DILocation(line: 68, column: 9, scope: !82)
!91 = !DILocation(line: 69, column: 20, scope: !82)
!92 = !DILocation(line: 69, column: 9, scope: !82)
!93 = !DILocation(line: 73, column: 1, scope: !73)
!94 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !10, line: 80, type: !24)
!96 = !DILocation(line: 80, column: 15, scope: !94)
!97 = !DILocation(line: 81, column: 10, scope: !94)
!98 = !DILocation(line: 82, column: 67, scope: !94)
!99 = !DILocation(line: 83, column: 74, scope: !94)
!100 = !DILocation(line: 83, column: 12, scope: !94)
!101 = !DILocation(line: 83, column: 10, scope: !94)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !10, line: 85, type: !35)
!103 = distinct !DILexicalBlock(scope: !94, file: !10, line: 84, column: 5)
!104 = !DILocation(line: 85, column: 17, scope: !103)
!105 = !DILocation(line: 86, column: 17, scope: !103)
!106 = !DILocation(line: 86, column: 9, scope: !103)
!107 = !DILocation(line: 87, column: 9, scope: !103)
!108 = !DILocation(line: 87, column: 23, scope: !103)
!109 = !DILocation(line: 89, column: 16, scope: !103)
!110 = !DILocation(line: 89, column: 22, scope: !103)
!111 = !DILocation(line: 89, column: 9, scope: !103)
!112 = !DILocation(line: 90, column: 20, scope: !103)
!113 = !DILocation(line: 90, column: 9, scope: !103)
!114 = !DILocation(line: 94, column: 1, scope: !94)
