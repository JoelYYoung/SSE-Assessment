; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !12
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !15
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_badGlobal, align 4, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_badSource(i32* %1), !dbg !33
  store i32* %call1, i32** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !41
  %3 = bitcast i32* %arraydecay to i8*, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !43
  %5 = load i32*, i32** %data, align 8, !dbg !44
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %3, i64 %call2, i8* bitcast ([3 x i32]* @.str to i8*), i32* %5) #6, !dbg !45
  %6 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %6), !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  %8 = bitcast i32* %7 to i8*, !dbg !48
  call void @free(i8* %8) #6, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_badSource(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !78
  %0 = bitcast i8* %call to i32*, !dbg !79
  store i32* %0, i32** %data, align 8, !dbg !80
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_goodG2B1Global, align 4, !dbg !81
  %1 = load i32*, i32** %data, align 8, !dbg !82
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_goodG2B1Source(i32* %1), !dbg !83
  store i32* %call1, i32** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !87
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !88
  %3 = bitcast i32* %arraydecay to i8*, !dbg !88
  %4 = load i32*, i32** %data, align 8, !dbg !89
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !90
  %5 = load i32*, i32** %data, align 8, !dbg !91
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %3, i64 %call2, i8* bitcast ([3 x i32]* @.str to i8*), i32* %5) #6, !dbg !92
  %6 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* %6), !dbg !94
  %7 = load i32*, i32** %data, align 8, !dbg !95
  %8 = bitcast i32* %7 to i8*, !dbg !95
  call void @free(i8* %8) #6, !dbg !96
  ret void, !dbg !97
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_goodG2B1Source(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !101
  %0 = bitcast i8* %call to i32*, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !103
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_goodG2B2Global, align 4, !dbg !104
  %1 = load i32*, i32** %data, align 8, !dbg !105
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_goodG2B2Source(i32* %1), !dbg !106
  store i32* %call1, i32** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !110
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !111
  %3 = bitcast i32* %arraydecay to i8*, !dbg !111
  %4 = load i32*, i32** %data, align 8, !dbg !112
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !113
  %5 = load i32*, i32** %data, align 8, !dbg !114
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %3, i64 %call2, i8* bitcast ([3 x i32]* @.str to i8*), i32* %5) #6, !dbg !115
  %6 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* %6), !dbg !117
  %7 = load i32*, i32** %data, align 8, !dbg !118
  %8 = bitcast i32* %7 to i8*, !dbg !118
  call void @free(i8* %8) #6, !dbg !119
  ret void, !dbg !120
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_goodG2B2Source(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_badGlobal", scope: !2, file: !14, line: 30, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_goodG2B1Global", scope: !2, file: !14, line: 54, type: !9, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_goodG2B2Global", scope: !2, file: !14, line: 55, type: !9, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_bad", scope: !14, file: !14, line: 34, type: !24, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 36, type: !6)
!27 = !DILocation(line: 36, column: 15, scope: !23)
!28 = !DILocation(line: 37, column: 23, scope: !23)
!29 = !DILocation(line: 37, column: 12, scope: !23)
!30 = !DILocation(line: 37, column: 10, scope: !23)
!31 = !DILocation(line: 38, column: 79, scope: !23)
!32 = !DILocation(line: 39, column: 86, scope: !23)
!33 = !DILocation(line: 39, column: 12, scope: !23)
!34 = !DILocation(line: 39, column: 10, scope: !23)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 41, type: !37)
!36 = distinct !DILexicalBlock(scope: !23, file: !14, line: 40, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 41, column: 17, scope: !36)
!41 = !DILocation(line: 43, column: 18, scope: !36)
!42 = !DILocation(line: 43, column: 31, scope: !36)
!43 = !DILocation(line: 43, column: 24, scope: !36)
!44 = !DILocation(line: 43, column: 45, scope: !36)
!45 = !DILocation(line: 43, column: 9, scope: !36)
!46 = !DILocation(line: 44, column: 20, scope: !36)
!47 = !DILocation(line: 44, column: 9, scope: !36)
!48 = !DILocation(line: 45, column: 14, scope: !36)
!49 = !DILocation(line: 45, column: 9, scope: !36)
!50 = !DILocation(line: 47, column: 1, scope: !23)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_snprintf_22_good", scope: !14, file: !14, line: 93, type: !24, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 95, column: 5, scope: !51)
!53 = !DILocation(line: 96, column: 5, scope: !51)
!54 = !DILocation(line: 97, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 109, type: !56, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!9, !9, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 109, type: !9)
!62 = !DILocation(line: 109, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 109, type: !58)
!64 = !DILocation(line: 109, column: 27, scope: !55)
!65 = !DILocation(line: 112, column: 22, scope: !55)
!66 = !DILocation(line: 112, column: 12, scope: !55)
!67 = !DILocation(line: 112, column: 5, scope: !55)
!68 = !DILocation(line: 114, column: 5, scope: !55)
!69 = !DILocation(line: 115, column: 5, scope: !55)
!70 = !DILocation(line: 116, column: 5, scope: !55)
!71 = !DILocation(line: 119, column: 5, scope: !55)
!72 = !DILocation(line: 120, column: 5, scope: !55)
!73 = !DILocation(line: 121, column: 5, scope: !55)
!74 = !DILocation(line: 123, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 60, type: !24, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !14, line: 62, type: !6)
!77 = !DILocation(line: 62, column: 15, scope: !75)
!78 = !DILocation(line: 63, column: 23, scope: !75)
!79 = !DILocation(line: 63, column: 12, scope: !75)
!80 = !DILocation(line: 63, column: 10, scope: !75)
!81 = !DILocation(line: 64, column: 84, scope: !75)
!82 = !DILocation(line: 65, column: 91, scope: !75)
!83 = !DILocation(line: 65, column: 12, scope: !75)
!84 = !DILocation(line: 65, column: 10, scope: !75)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !14, line: 67, type: !37)
!86 = distinct !DILexicalBlock(scope: !75, file: !14, line: 66, column: 5)
!87 = !DILocation(line: 67, column: 17, scope: !86)
!88 = !DILocation(line: 69, column: 18, scope: !86)
!89 = !DILocation(line: 69, column: 31, scope: !86)
!90 = !DILocation(line: 69, column: 24, scope: !86)
!91 = !DILocation(line: 69, column: 45, scope: !86)
!92 = !DILocation(line: 69, column: 9, scope: !86)
!93 = !DILocation(line: 70, column: 20, scope: !86)
!94 = !DILocation(line: 70, column: 9, scope: !86)
!95 = !DILocation(line: 71, column: 14, scope: !86)
!96 = !DILocation(line: 71, column: 9, scope: !86)
!97 = !DILocation(line: 73, column: 1, scope: !75)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 78, type: !24, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 80, type: !6)
!100 = !DILocation(line: 80, column: 15, scope: !98)
!101 = !DILocation(line: 81, column: 23, scope: !98)
!102 = !DILocation(line: 81, column: 12, scope: !98)
!103 = !DILocation(line: 81, column: 10, scope: !98)
!104 = !DILocation(line: 82, column: 84, scope: !98)
!105 = !DILocation(line: 83, column: 91, scope: !98)
!106 = !DILocation(line: 83, column: 12, scope: !98)
!107 = !DILocation(line: 83, column: 10, scope: !98)
!108 = !DILocalVariable(name: "dest", scope: !109, file: !14, line: 85, type: !37)
!109 = distinct !DILexicalBlock(scope: !98, file: !14, line: 84, column: 5)
!110 = !DILocation(line: 85, column: 17, scope: !109)
!111 = !DILocation(line: 87, column: 18, scope: !109)
!112 = !DILocation(line: 87, column: 31, scope: !109)
!113 = !DILocation(line: 87, column: 24, scope: !109)
!114 = !DILocation(line: 87, column: 45, scope: !109)
!115 = !DILocation(line: 87, column: 9, scope: !109)
!116 = !DILocation(line: 88, column: 20, scope: !109)
!117 = !DILocation(line: 88, column: 9, scope: !109)
!118 = !DILocation(line: 89, column: 14, scope: !109)
!119 = !DILocation(line: 89, column: 9, scope: !109)
!120 = !DILocation(line: 91, column: 1, scope: !98)
