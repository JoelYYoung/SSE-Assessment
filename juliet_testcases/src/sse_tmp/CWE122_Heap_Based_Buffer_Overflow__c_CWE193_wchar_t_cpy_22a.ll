; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_badGlobal, align 4, !dbg !29
  %0 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_badSource(i32* %0), !dbg !31
  store i32* %call, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_bad.source to i8*), i64 44, i1 false), !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wcscpy(i32* %2, i32* %arraydecay) #5, !dbg !41
  %3 = load i32*, i32** %data, align 8, !dbg !42
  call void @printWLine(i32* %3), !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %5 = bitcast i32* %4 to i8*, !dbg !44
  call void @free(i8* %5) #5, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i32* null, i32** %data, align 8, !dbg !74
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_goodG2B1Global, align 4, !dbg !75
  %0 = load i32*, i32** %data, align 8, !dbg !76
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_goodG2B1Source(i32* %0), !dbg !77
  store i32* %call, i32** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !79, metadata !DIExpression()), !dbg !81
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !81
  %2 = load i32*, i32** %data, align 8, !dbg !82
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !83
  %call1 = call i32* @wcscpy(i32* %2, i32* %arraydecay) #5, !dbg !84
  %3 = load i32*, i32** %data, align 8, !dbg !85
  call void @printWLine(i32* %3), !dbg !86
  %4 = load i32*, i32** %data, align 8, !dbg !87
  %5 = bitcast i32* %4 to i8*, !dbg !87
  call void @free(i8* %5) #5, !dbg !88
  ret void, !dbg !89
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_goodG2B2Global, align 4, !dbg !94
  %0 = load i32*, i32** %data, align 8, !dbg !95
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_goodG2B2Source(i32* %0), !dbg !96
  store i32* %call, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !100
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !102
  %call1 = call i32* @wcscpy(i32* %2, i32* %arraydecay) #5, !dbg !103
  %3 = load i32*, i32** %data, align 8, !dbg !104
  call void @printWLine(i32* %3), !dbg !105
  %4 = load i32*, i32** %data, align 8, !dbg !106
  %5 = bitcast i32* %4 to i8*, !dbg !106
  call void @free(i8* %5) #5, !dbg !107
  ret void, !dbg !108
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_badGlobal", scope: !2, file: !10, line: 29, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_goodG2B1Global", scope: !2, file: !10, line: 53, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_goodG2B2Global", scope: !2, file: !10, line: 54, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_bad", scope: !10, file: !10, line: 33, type: !21, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 35, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 35, column: 15, scope: !20)
!28 = !DILocation(line: 36, column: 10, scope: !20)
!29 = !DILocation(line: 37, column: 74, scope: !20)
!30 = !DILocation(line: 38, column: 81, scope: !20)
!31 = !DILocation(line: 38, column: 12, scope: !20)
!32 = !DILocation(line: 38, column: 10, scope: !20)
!33 = !DILocalVariable(name: "source", scope: !34, file: !10, line: 40, type: !35)
!34 = distinct !DILexicalBlock(scope: !20, file: !10, line: 39, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 352, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 40, column: 17, scope: !34)
!39 = !DILocation(line: 42, column: 16, scope: !34)
!40 = !DILocation(line: 42, column: 22, scope: !34)
!41 = !DILocation(line: 42, column: 9, scope: !34)
!42 = !DILocation(line: 43, column: 20, scope: !34)
!43 = !DILocation(line: 43, column: 9, scope: !34)
!44 = !DILocation(line: 44, column: 14, scope: !34)
!45 = !DILocation(line: 44, column: 9, scope: !34)
!46 = !DILocation(line: 46, column: 1, scope: !20)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_22_good", scope: !10, file: !10, line: 92, type: !21, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DILocation(line: 94, column: 5, scope: !47)
!49 = !DILocation(line: 95, column: 5, scope: !47)
!50 = !DILocation(line: 96, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 108, type: !52, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!11, !11, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !10, line: 108, type: !11)
!58 = !DILocation(line: 108, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !10, line: 108, type: !54)
!60 = !DILocation(line: 108, column: 27, scope: !51)
!61 = !DILocation(line: 111, column: 22, scope: !51)
!62 = !DILocation(line: 111, column: 12, scope: !51)
!63 = !DILocation(line: 111, column: 5, scope: !51)
!64 = !DILocation(line: 113, column: 5, scope: !51)
!65 = !DILocation(line: 114, column: 5, scope: !51)
!66 = !DILocation(line: 115, column: 5, scope: !51)
!67 = !DILocation(line: 118, column: 5, scope: !51)
!68 = !DILocation(line: 119, column: 5, scope: !51)
!69 = !DILocation(line: 120, column: 5, scope: !51)
!70 = !DILocation(line: 122, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 59, type: !21, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocalVariable(name: "data", scope: !71, file: !10, line: 61, type: !24)
!73 = !DILocation(line: 61, column: 15, scope: !71)
!74 = !DILocation(line: 62, column: 10, scope: !71)
!75 = !DILocation(line: 63, column: 79, scope: !71)
!76 = !DILocation(line: 64, column: 86, scope: !71)
!77 = !DILocation(line: 64, column: 12, scope: !71)
!78 = !DILocation(line: 64, column: 10, scope: !71)
!79 = !DILocalVariable(name: "source", scope: !80, file: !10, line: 66, type: !35)
!80 = distinct !DILexicalBlock(scope: !71, file: !10, line: 65, column: 5)
!81 = !DILocation(line: 66, column: 17, scope: !80)
!82 = !DILocation(line: 68, column: 16, scope: !80)
!83 = !DILocation(line: 68, column: 22, scope: !80)
!84 = !DILocation(line: 68, column: 9, scope: !80)
!85 = !DILocation(line: 69, column: 20, scope: !80)
!86 = !DILocation(line: 69, column: 9, scope: !80)
!87 = !DILocation(line: 70, column: 14, scope: !80)
!88 = !DILocation(line: 70, column: 9, scope: !80)
!89 = !DILocation(line: 72, column: 1, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 77, type: !21, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !10, line: 79, type: !24)
!92 = !DILocation(line: 79, column: 15, scope: !90)
!93 = !DILocation(line: 80, column: 10, scope: !90)
!94 = !DILocation(line: 81, column: 79, scope: !90)
!95 = !DILocation(line: 82, column: 86, scope: !90)
!96 = !DILocation(line: 82, column: 12, scope: !90)
!97 = !DILocation(line: 82, column: 10, scope: !90)
!98 = !DILocalVariable(name: "source", scope: !99, file: !10, line: 84, type: !35)
!99 = distinct !DILexicalBlock(scope: !90, file: !10, line: 83, column: 5)
!100 = !DILocation(line: 84, column: 17, scope: !99)
!101 = !DILocation(line: 86, column: 16, scope: !99)
!102 = !DILocation(line: 86, column: 22, scope: !99)
!103 = !DILocation(line: 86, column: 9, scope: !99)
!104 = !DILocation(line: 87, column: 20, scope: !99)
!105 = !DILocation(line: 87, column: 9, scope: !99)
!106 = !DILocation(line: 88, column: 14, scope: !99)
!107 = !DILocation(line: 88, column: 9, scope: !99)
!108 = !DILocation(line: 90, column: 1, scope: !90)
