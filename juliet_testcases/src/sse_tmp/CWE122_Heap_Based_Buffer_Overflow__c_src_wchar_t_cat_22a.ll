; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !12
@CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !15
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_badGlobal, align 4, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_badSource(i32* %1), !dbg !33
  store i32* %call1, i32** %data, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !41
  %3 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %3) #5, !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* %4), !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  %6 = bitcast i32* %5 to i8*, !dbg !46
  call void @free(i8* %6) #5, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_badSource(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_good() #0 !dbg !49 {
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
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !76
  %0 = bitcast i8* %call to i32*, !dbg !77
  store i32* %0, i32** %data, align 8, !dbg !78
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_goodG2B1Global, align 4, !dbg !79
  %1 = load i32*, i32** %data, align 8, !dbg !80
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_goodG2B1Source(i32* %1), !dbg !81
  store i32* %call1, i32** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !85
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !86
  %3 = load i32*, i32** %data, align 8, !dbg !87
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %3) #5, !dbg !88
  %4 = load i32*, i32** %data, align 8, !dbg !89
  call void @printWLine(i32* %4), !dbg !90
  %5 = load i32*, i32** %data, align 8, !dbg !91
  %6 = bitcast i32* %5 to i8*, !dbg !91
  call void @free(i8* %6) #5, !dbg !92
  ret void, !dbg !93
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_goodG2B1Source(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !97
  %0 = bitcast i8* %call to i32*, !dbg !98
  store i32* %0, i32** %data, align 8, !dbg !99
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_goodG2B2Global, align 4, !dbg !100
  %1 = load i32*, i32** %data, align 8, !dbg !101
  %call1 = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_goodG2B2Source(i32* %1), !dbg !102
  store i32* %call1, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !106
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !107
  %3 = load i32*, i32** %data, align 8, !dbg !108
  %call2 = call i32* @wcscat(i32* %arraydecay, i32* %3) #5, !dbg !109
  %4 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %4), !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !112
  %6 = bitcast i32* %5 to i8*, !dbg !112
  call void @free(i8* %6) #5, !dbg !113
  ret void, !dbg !114
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_goodG2B2Source(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_badGlobal", scope: !2, file: !14, line: 24, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_goodG2B1Global", scope: !2, file: !14, line: 48, type: !9, isLocal: false, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_goodG2B2Global", scope: !2, file: !14, line: 49, type: !9, isLocal: false, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_bad", scope: !14, file: !14, line: 28, type: !24, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 30, type: !6)
!27 = !DILocation(line: 30, column: 15, scope: !23)
!28 = !DILocation(line: 31, column: 23, scope: !23)
!29 = !DILocation(line: 31, column: 12, scope: !23)
!30 = !DILocation(line: 31, column: 10, scope: !23)
!31 = !DILocation(line: 32, column: 71, scope: !23)
!32 = !DILocation(line: 33, column: 78, scope: !23)
!33 = !DILocation(line: 33, column: 12, scope: !23)
!34 = !DILocation(line: 33, column: 10, scope: !23)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !23, file: !14, line: 34, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 17, scope: !36)
!41 = !DILocation(line: 37, column: 16, scope: !36)
!42 = !DILocation(line: 37, column: 22, scope: !36)
!43 = !DILocation(line: 37, column: 9, scope: !36)
!44 = !DILocation(line: 38, column: 20, scope: !36)
!45 = !DILocation(line: 38, column: 9, scope: !36)
!46 = !DILocation(line: 39, column: 14, scope: !36)
!47 = !DILocation(line: 39, column: 9, scope: !36)
!48 = !DILocation(line: 41, column: 1, scope: !23)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_22_good", scope: !14, file: !14, line: 87, type: !24, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DILocation(line: 89, column: 5, scope: !49)
!51 = !DILocation(line: 90, column: 5, scope: !49)
!52 = !DILocation(line: 91, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 103, type: !54, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!9, !9, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 103, type: !9)
!60 = !DILocation(line: 103, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 103, type: !56)
!62 = !DILocation(line: 103, column: 27, scope: !53)
!63 = !DILocation(line: 106, column: 22, scope: !53)
!64 = !DILocation(line: 106, column: 12, scope: !53)
!65 = !DILocation(line: 106, column: 5, scope: !53)
!66 = !DILocation(line: 108, column: 5, scope: !53)
!67 = !DILocation(line: 109, column: 5, scope: !53)
!68 = !DILocation(line: 110, column: 5, scope: !53)
!69 = !DILocation(line: 113, column: 5, scope: !53)
!70 = !DILocation(line: 114, column: 5, scope: !53)
!71 = !DILocation(line: 115, column: 5, scope: !53)
!72 = !DILocation(line: 117, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !24, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 56, type: !6)
!75 = !DILocation(line: 56, column: 15, scope: !73)
!76 = !DILocation(line: 57, column: 23, scope: !73)
!77 = !DILocation(line: 57, column: 12, scope: !73)
!78 = !DILocation(line: 57, column: 10, scope: !73)
!79 = !DILocation(line: 58, column: 76, scope: !73)
!80 = !DILocation(line: 59, column: 83, scope: !73)
!81 = !DILocation(line: 59, column: 12, scope: !73)
!82 = !DILocation(line: 59, column: 10, scope: !73)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !14, line: 61, type: !37)
!84 = distinct !DILexicalBlock(scope: !73, file: !14, line: 60, column: 5)
!85 = !DILocation(line: 61, column: 17, scope: !84)
!86 = !DILocation(line: 63, column: 16, scope: !84)
!87 = !DILocation(line: 63, column: 22, scope: !84)
!88 = !DILocation(line: 63, column: 9, scope: !84)
!89 = !DILocation(line: 64, column: 20, scope: !84)
!90 = !DILocation(line: 64, column: 9, scope: !84)
!91 = !DILocation(line: 65, column: 14, scope: !84)
!92 = !DILocation(line: 65, column: 9, scope: !84)
!93 = !DILocation(line: 67, column: 1, scope: !73)
!94 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 72, type: !24, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !14, line: 74, type: !6)
!96 = !DILocation(line: 74, column: 15, scope: !94)
!97 = !DILocation(line: 75, column: 23, scope: !94)
!98 = !DILocation(line: 75, column: 12, scope: !94)
!99 = !DILocation(line: 75, column: 10, scope: !94)
!100 = !DILocation(line: 76, column: 76, scope: !94)
!101 = !DILocation(line: 77, column: 83, scope: !94)
!102 = !DILocation(line: 77, column: 12, scope: !94)
!103 = !DILocation(line: 77, column: 10, scope: !94)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !14, line: 79, type: !37)
!105 = distinct !DILexicalBlock(scope: !94, file: !14, line: 78, column: 5)
!106 = !DILocation(line: 79, column: 17, scope: !105)
!107 = !DILocation(line: 81, column: 16, scope: !105)
!108 = !DILocation(line: 81, column: 22, scope: !105)
!109 = !DILocation(line: 81, column: 9, scope: !105)
!110 = !DILocation(line: 82, column: 20, scope: !105)
!111 = !DILocation(line: 82, column: 9, scope: !105)
!112 = !DILocation(line: 83, column: 14, scope: !105)
!113 = !DILocation(line: 83, column: 9, scope: !105)
!114 = !DILocation(line: 85, column: 1, scope: !94)
