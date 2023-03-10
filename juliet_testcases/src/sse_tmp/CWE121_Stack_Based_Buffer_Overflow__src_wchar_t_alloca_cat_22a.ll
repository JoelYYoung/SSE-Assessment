; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !12
@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !15
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  store i32* %2, i32** %data, align 8, !dbg !33
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_badGlobal, align 4, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_badSource(i32* %3), !dbg !36
  store i32* %call, i32** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %5) #5, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %6), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_good() #0 !dbg !50 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 400, align 16, !dbg !79
  %1 = bitcast i8* %0 to i32*, !dbg !80
  store i32* %1, i32** %dataBuffer, align 8, !dbg !78
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !81
  store i32* %2, i32** %data, align 8, !dbg !82
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_goodG2B1Global, align 4, !dbg !83
  %3 = load i32*, i32** %data, align 8, !dbg !84
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_goodG2B1Source(i32* %3), !dbg !85
  store i32* %call, i32** %data, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !87, metadata !DIExpression()), !dbg !89
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !89
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !90
  %5 = load i32*, i32** %data, align 8, !dbg !91
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %5) #5, !dbg !92
  %6 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* %6), !dbg !94
  ret void, !dbg !95
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 400, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBuffer, align 8, !dbg !100
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  store i32* %2, i32** %data, align 8, !dbg !104
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_goodG2B2Global, align 4, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_goodG2B2Source(i32* %3), !dbg !107
  store i32* %call, i32** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !111
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %5) #5, !dbg !114
  %6 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %6), !dbg !116
  ret void, !dbg !117
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_badGlobal", scope: !2, file: !14, line: 24, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_goodG2B1Global", scope: !2, file: !14, line: 48, type: !9, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_goodG2B2Global", scope: !2, file: !14, line: 49, type: !9, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_bad", scope: !14, file: !14, line: 28, type: !24, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 30, type: !6)
!27 = !DILocation(line: 30, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !14, line: 31, type: !6)
!29 = !DILocation(line: 31, column: 15, scope: !23)
!30 = !DILocation(line: 31, column: 39, scope: !23)
!31 = !DILocation(line: 31, column: 28, scope: !23)
!32 = !DILocation(line: 32, column: 12, scope: !23)
!33 = !DILocation(line: 32, column: 10, scope: !23)
!34 = !DILocation(line: 33, column: 77, scope: !23)
!35 = !DILocation(line: 34, column: 84, scope: !23)
!36 = !DILocation(line: 34, column: 12, scope: !23)
!37 = !DILocation(line: 34, column: 10, scope: !23)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !23, file: !14, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 36, column: 17, scope: !39)
!44 = !DILocation(line: 38, column: 16, scope: !39)
!45 = !DILocation(line: 38, column: 22, scope: !39)
!46 = !DILocation(line: 38, column: 9, scope: !39)
!47 = !DILocation(line: 39, column: 20, scope: !39)
!48 = !DILocation(line: 39, column: 9, scope: !39)
!49 = !DILocation(line: 41, column: 1, scope: !23)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_22_good", scope: !14, file: !14, line: 87, type: !24, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DILocation(line: 89, column: 5, scope: !50)
!52 = !DILocation(line: 90, column: 5, scope: !50)
!53 = !DILocation(line: 91, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 103, type: !55, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!9, !9, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 103, type: !9)
!61 = !DILocation(line: 103, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 103, type: !57)
!63 = !DILocation(line: 103, column: 27, scope: !54)
!64 = !DILocation(line: 106, column: 22, scope: !54)
!65 = !DILocation(line: 106, column: 12, scope: !54)
!66 = !DILocation(line: 106, column: 5, scope: !54)
!67 = !DILocation(line: 108, column: 5, scope: !54)
!68 = !DILocation(line: 109, column: 5, scope: !54)
!69 = !DILocation(line: 110, column: 5, scope: !54)
!70 = !DILocation(line: 113, column: 5, scope: !54)
!71 = !DILocation(line: 114, column: 5, scope: !54)
!72 = !DILocation(line: 115, column: 5, scope: !54)
!73 = !DILocation(line: 117, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !24, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 56, type: !6)
!76 = !DILocation(line: 56, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !14, line: 57, type: !6)
!78 = !DILocation(line: 57, column: 15, scope: !74)
!79 = !DILocation(line: 57, column: 39, scope: !74)
!80 = !DILocation(line: 57, column: 28, scope: !74)
!81 = !DILocation(line: 58, column: 12, scope: !74)
!82 = !DILocation(line: 58, column: 10, scope: !74)
!83 = !DILocation(line: 59, column: 82, scope: !74)
!84 = !DILocation(line: 60, column: 89, scope: !74)
!85 = !DILocation(line: 60, column: 12, scope: !74)
!86 = !DILocation(line: 60, column: 10, scope: !74)
!87 = !DILocalVariable(name: "dest", scope: !88, file: !14, line: 62, type: !40)
!88 = distinct !DILexicalBlock(scope: !74, file: !14, line: 61, column: 5)
!89 = !DILocation(line: 62, column: 17, scope: !88)
!90 = !DILocation(line: 64, column: 16, scope: !88)
!91 = !DILocation(line: 64, column: 22, scope: !88)
!92 = !DILocation(line: 64, column: 9, scope: !88)
!93 = !DILocation(line: 65, column: 20, scope: !88)
!94 = !DILocation(line: 65, column: 9, scope: !88)
!95 = !DILocation(line: 67, column: 1, scope: !74)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 72, type: !24, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 74, type: !6)
!98 = !DILocation(line: 74, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !14, line: 75, type: !6)
!100 = !DILocation(line: 75, column: 15, scope: !96)
!101 = !DILocation(line: 75, column: 39, scope: !96)
!102 = !DILocation(line: 75, column: 28, scope: !96)
!103 = !DILocation(line: 76, column: 12, scope: !96)
!104 = !DILocation(line: 76, column: 10, scope: !96)
!105 = !DILocation(line: 77, column: 82, scope: !96)
!106 = !DILocation(line: 78, column: 89, scope: !96)
!107 = !DILocation(line: 78, column: 12, scope: !96)
!108 = !DILocation(line: 78, column: 10, scope: !96)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !14, line: 80, type: !40)
!110 = distinct !DILexicalBlock(scope: !96, file: !14, line: 79, column: 5)
!111 = !DILocation(line: 80, column: 17, scope: !110)
!112 = !DILocation(line: 82, column: 16, scope: !110)
!113 = !DILocation(line: 82, column: 22, scope: !110)
!114 = !DILocation(line: 82, column: 9, scope: !110)
!115 = !DILocation(line: 83, column: 20, scope: !110)
!116 = !DILocation(line: 83, column: 9, scope: !110)
!117 = !DILocation(line: 85, column: 1, scope: !96)
