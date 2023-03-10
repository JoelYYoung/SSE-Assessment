; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !12
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !15
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_bad() #0 !dbg !23 {
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
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_badGlobal, align 4, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_badSource(i32* %3), !dbg !36
  store i32* %call, i32** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = bitcast i32* %arraydecay to i8*, !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  %call1 = call i64 @wcslen(i32* %6) #6, !dbg !46
  %7 = load i32*, i32** %data, align 8, !dbg !47
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %5, i64 %call1, i8* bitcast ([3 x i32]* @.str to i8*), i32* %7) #7, !dbg !48
  %8 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %8), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #7, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #7, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 400, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBuffer, align 8, !dbg !80
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  store i32* %2, i32** %data, align 8, !dbg !84
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_goodG2B1Global, align 4, !dbg !85
  %3 = load i32*, i32** %data, align 8, !dbg !86
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_goodG2B1Source(i32* %3), !dbg !87
  store i32* %call, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !91
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !92
  %5 = bitcast i32* %arraydecay to i8*, !dbg !92
  %6 = load i32*, i32** %data, align 8, !dbg !93
  %call1 = call i64 @wcslen(i32* %6) #6, !dbg !94
  %7 = load i32*, i32** %data, align 8, !dbg !95
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %5, i64 %call1, i8* bitcast ([3 x i32]* @.str to i8*), i32* %7) #7, !dbg !96
  %8 = load i32*, i32** %data, align 8, !dbg !97
  call void @printWLine(i32* %8), !dbg !98
  ret void, !dbg !99
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 400, align 16, !dbg !105
  %1 = bitcast i8* %0 to i32*, !dbg !106
  store i32* %1, i32** %dataBuffer, align 8, !dbg !104
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !107
  store i32* %2, i32** %data, align 8, !dbg !108
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_goodG2B2Global, align 4, !dbg !109
  %3 = load i32*, i32** %data, align 8, !dbg !110
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_goodG2B2Source(i32* %3), !dbg !111
  store i32* %call, i32** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !115
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !116
  %5 = bitcast i32* %arraydecay to i8*, !dbg !116
  %6 = load i32*, i32** %data, align 8, !dbg !117
  %call1 = call i64 @wcslen(i32* %6) #6, !dbg !118
  %7 = load i32*, i32** %data, align 8, !dbg !119
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %5, i64 %call1, i8* bitcast ([3 x i32]* @.str to i8*), i32* %7) #7, !dbg !120
  %8 = load i32*, i32** %data, align 8, !dbg !121
  call void @printWLine(i32* %8), !dbg !122
  ret void, !dbg !123
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_badGlobal", scope: !2, file: !14, line: 30, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_goodG2B1Global", scope: !2, file: !14, line: 54, type: !9, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_goodG2B2Global", scope: !2, file: !14, line: 55, type: !9, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_bad", scope: !14, file: !14, line: 34, type: !24, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 36, type: !6)
!27 = !DILocation(line: 36, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !14, line: 37, type: !6)
!29 = !DILocation(line: 37, column: 15, scope: !23)
!30 = !DILocation(line: 37, column: 39, scope: !23)
!31 = !DILocation(line: 37, column: 28, scope: !23)
!32 = !DILocation(line: 38, column: 12, scope: !23)
!33 = !DILocation(line: 38, column: 10, scope: !23)
!34 = !DILocation(line: 39, column: 85, scope: !23)
!35 = !DILocation(line: 40, column: 92, scope: !23)
!36 = !DILocation(line: 40, column: 12, scope: !23)
!37 = !DILocation(line: 40, column: 10, scope: !23)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 42, type: !40)
!39 = distinct !DILexicalBlock(scope: !23, file: !14, line: 41, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 42, column: 17, scope: !39)
!44 = !DILocation(line: 44, column: 18, scope: !39)
!45 = !DILocation(line: 44, column: 31, scope: !39)
!46 = !DILocation(line: 44, column: 24, scope: !39)
!47 = !DILocation(line: 44, column: 45, scope: !39)
!48 = !DILocation(line: 44, column: 9, scope: !39)
!49 = !DILocation(line: 45, column: 20, scope: !39)
!50 = !DILocation(line: 45, column: 9, scope: !39)
!51 = !DILocation(line: 47, column: 1, scope: !23)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_22_good", scope: !14, file: !14, line: 93, type: !24, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 95, column: 5, scope: !52)
!54 = !DILocation(line: 96, column: 5, scope: !52)
!55 = !DILocation(line: 97, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 109, type: !57, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!9, !9, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !14, line: 109, type: !9)
!63 = !DILocation(line: 109, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !14, line: 109, type: !59)
!65 = !DILocation(line: 109, column: 27, scope: !56)
!66 = !DILocation(line: 112, column: 22, scope: !56)
!67 = !DILocation(line: 112, column: 12, scope: !56)
!68 = !DILocation(line: 112, column: 5, scope: !56)
!69 = !DILocation(line: 114, column: 5, scope: !56)
!70 = !DILocation(line: 115, column: 5, scope: !56)
!71 = !DILocation(line: 116, column: 5, scope: !56)
!72 = !DILocation(line: 119, column: 5, scope: !56)
!73 = !DILocation(line: 120, column: 5, scope: !56)
!74 = !DILocation(line: 121, column: 5, scope: !56)
!75 = !DILocation(line: 123, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 60, type: !24, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 62, type: !6)
!78 = !DILocation(line: 62, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !14, line: 63, type: !6)
!80 = !DILocation(line: 63, column: 15, scope: !76)
!81 = !DILocation(line: 63, column: 39, scope: !76)
!82 = !DILocation(line: 63, column: 28, scope: !76)
!83 = !DILocation(line: 64, column: 12, scope: !76)
!84 = !DILocation(line: 64, column: 10, scope: !76)
!85 = !DILocation(line: 65, column: 90, scope: !76)
!86 = !DILocation(line: 66, column: 97, scope: !76)
!87 = !DILocation(line: 66, column: 12, scope: !76)
!88 = !DILocation(line: 66, column: 10, scope: !76)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !14, line: 68, type: !40)
!90 = distinct !DILexicalBlock(scope: !76, file: !14, line: 67, column: 5)
!91 = !DILocation(line: 68, column: 17, scope: !90)
!92 = !DILocation(line: 70, column: 18, scope: !90)
!93 = !DILocation(line: 70, column: 31, scope: !90)
!94 = !DILocation(line: 70, column: 24, scope: !90)
!95 = !DILocation(line: 70, column: 45, scope: !90)
!96 = !DILocation(line: 70, column: 9, scope: !90)
!97 = !DILocation(line: 71, column: 20, scope: !90)
!98 = !DILocation(line: 71, column: 9, scope: !90)
!99 = !DILocation(line: 73, column: 1, scope: !76)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 78, type: !24, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !14, line: 80, type: !6)
!102 = !DILocation(line: 80, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !14, line: 81, type: !6)
!104 = !DILocation(line: 81, column: 15, scope: !100)
!105 = !DILocation(line: 81, column: 39, scope: !100)
!106 = !DILocation(line: 81, column: 28, scope: !100)
!107 = !DILocation(line: 82, column: 12, scope: !100)
!108 = !DILocation(line: 82, column: 10, scope: !100)
!109 = !DILocation(line: 83, column: 90, scope: !100)
!110 = !DILocation(line: 84, column: 97, scope: !100)
!111 = !DILocation(line: 84, column: 12, scope: !100)
!112 = !DILocation(line: 84, column: 10, scope: !100)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !14, line: 86, type: !40)
!114 = distinct !DILexicalBlock(scope: !100, file: !14, line: 85, column: 5)
!115 = !DILocation(line: 86, column: 17, scope: !114)
!116 = !DILocation(line: 88, column: 18, scope: !114)
!117 = !DILocation(line: 88, column: 31, scope: !114)
!118 = !DILocation(line: 88, column: 24, scope: !114)
!119 = !DILocation(line: 88, column: 45, scope: !114)
!120 = !DILocation(line: 88, column: 9, scope: !114)
!121 = !DILocation(line: 89, column: 20, scope: !114)
!122 = !DILocation(line: 89, column: 9, scope: !114)
!123 = !DILocation(line: 91, column: 1, scope: !100)
