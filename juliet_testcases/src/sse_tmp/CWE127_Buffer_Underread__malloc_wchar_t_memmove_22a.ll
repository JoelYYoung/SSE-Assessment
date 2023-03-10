; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_22a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_badGlobal, align 4, !dbg !29
  %0 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_badSource(i32* %0), !dbg !31
  store i32* %call, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !39
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !43
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !43
  %2 = load i32*, i32** %data, align 8, !dbg !44
  %3 = bitcast i32* %2 to i8*, !dbg !43
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !43
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  call void @printWLine(i32* %arraydecay4), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #5, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #5, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i32* null, i32** %data, align 8, !dbg !77
  store i32 0, i32* @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_goodG2B1Global, align 4, !dbg !78
  %0 = load i32*, i32** %data, align 8, !dbg !79
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_goodG2B1Source(i32* %0), !dbg !80
  store i32* %call, i32** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !86
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !89
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !89
  %2 = load i32*, i32** %data, align 8, !dbg !90
  %3 = bitcast i32* %2 to i8*, !dbg !89
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !89
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !91
  store i32 0, i32* %arrayidx3, align 4, !dbg !92
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !93
  call void @printWLine(i32* %arraydecay4), !dbg !94
  ret void, !dbg !95
}

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i32* null, i32** %data, align 8, !dbg !99
  store i32 1, i32* @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_goodG2B2Global, align 4, !dbg !100
  %0 = load i32*, i32** %data, align 8, !dbg !101
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_goodG2B2Source(i32* %0), !dbg !102
  store i32* %call, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !107
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !108
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !111
  %1 = bitcast i32* %arraydecay2 to i8*, !dbg !111
  %2 = load i32*, i32** %data, align 8, !dbg !112
  %3 = bitcast i32* %2 to i8*, !dbg !111
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 400, i1 false), !dbg !111
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx3, align 4, !dbg !114
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !115
  call void @printWLine(i32* %arraydecay4), !dbg !116
  ret void, !dbg !117
}

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_goodG2B1Global", scope: !2, file: !10, line: 53, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_memmove_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_goodG2B2Global", scope: !2, file: !10, line: 54, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocation(line: 31, column: 10, scope: !20)
!29 = !DILocation(line: 32, column: 66, scope: !20)
!30 = !DILocation(line: 33, column: 73, scope: !20)
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
!43 = !DILocation(line: 39, column: 9, scope: !34)
!44 = !DILocation(line: 39, column: 23, scope: !34)
!45 = !DILocation(line: 41, column: 9, scope: !34)
!46 = !DILocation(line: 41, column: 21, scope: !34)
!47 = !DILocation(line: 42, column: 20, scope: !34)
!48 = !DILocation(line: 42, column: 9, scope: !34)
!49 = !DILocation(line: 46, column: 1, scope: !20)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_memmove_22_good", scope: !10, file: !10, line: 102, type: !21, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DILocation(line: 104, column: 5, scope: !50)
!52 = !DILocation(line: 105, column: 5, scope: !50)
!53 = !DILocation(line: 106, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 118, type: !55, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!11, !11, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !10, line: 118, type: !11)
!61 = !DILocation(line: 118, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !10, line: 118, type: !57)
!63 = !DILocation(line: 118, column: 27, scope: !54)
!64 = !DILocation(line: 121, column: 22, scope: !54)
!65 = !DILocation(line: 121, column: 12, scope: !54)
!66 = !DILocation(line: 121, column: 5, scope: !54)
!67 = !DILocation(line: 123, column: 5, scope: !54)
!68 = !DILocation(line: 124, column: 5, scope: !54)
!69 = !DILocation(line: 125, column: 5, scope: !54)
!70 = !DILocation(line: 128, column: 5, scope: !54)
!71 = !DILocation(line: 129, column: 5, scope: !54)
!72 = !DILocation(line: 130, column: 5, scope: !54)
!73 = !DILocation(line: 132, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 59, type: !21, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !10, line: 61, type: !24)
!76 = !DILocation(line: 61, column: 15, scope: !74)
!77 = !DILocation(line: 62, column: 10, scope: !74)
!78 = !DILocation(line: 63, column: 71, scope: !74)
!79 = !DILocation(line: 64, column: 78, scope: !74)
!80 = !DILocation(line: 64, column: 12, scope: !74)
!81 = !DILocation(line: 64, column: 10, scope: !74)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !10, line: 66, type: !35)
!83 = distinct !DILexicalBlock(scope: !74, file: !10, line: 65, column: 5)
!84 = !DILocation(line: 66, column: 17, scope: !83)
!85 = !DILocation(line: 67, column: 17, scope: !83)
!86 = !DILocation(line: 67, column: 9, scope: !83)
!87 = !DILocation(line: 68, column: 9, scope: !83)
!88 = !DILocation(line: 68, column: 21, scope: !83)
!89 = !DILocation(line: 70, column: 9, scope: !83)
!90 = !DILocation(line: 70, column: 23, scope: !83)
!91 = !DILocation(line: 72, column: 9, scope: !83)
!92 = !DILocation(line: 72, column: 21, scope: !83)
!93 = !DILocation(line: 73, column: 20, scope: !83)
!94 = !DILocation(line: 73, column: 9, scope: !83)
!95 = !DILocation(line: 77, column: 1, scope: !74)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 82, type: !21, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !10, line: 84, type: !24)
!98 = !DILocation(line: 84, column: 15, scope: !96)
!99 = !DILocation(line: 85, column: 10, scope: !96)
!100 = !DILocation(line: 86, column: 71, scope: !96)
!101 = !DILocation(line: 87, column: 78, scope: !96)
!102 = !DILocation(line: 87, column: 12, scope: !96)
!103 = !DILocation(line: 87, column: 10, scope: !96)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !10, line: 89, type: !35)
!105 = distinct !DILexicalBlock(scope: !96, file: !10, line: 88, column: 5)
!106 = !DILocation(line: 89, column: 17, scope: !105)
!107 = !DILocation(line: 90, column: 17, scope: !105)
!108 = !DILocation(line: 90, column: 9, scope: !105)
!109 = !DILocation(line: 91, column: 9, scope: !105)
!110 = !DILocation(line: 91, column: 21, scope: !105)
!111 = !DILocation(line: 93, column: 9, scope: !105)
!112 = !DILocation(line: 93, column: 23, scope: !105)
!113 = !DILocation(line: 95, column: 9, scope: !105)
!114 = !DILocation(line: 95, column: 21, scope: !105)
!115 = !DILocation(line: 96, column: 20, scope: !105)
!116 = !DILocation(line: 96, column: 9, scope: !105)
!117 = !DILocation(line: 100, column: 1, scope: !96)
