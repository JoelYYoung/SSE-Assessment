; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_badGlobal, align 4, !dbg !29
  %0 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_badSource(i32* %0), !dbg !31
  store i32* %call, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !39
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %2 = bitcast i32* %1 to i8*, !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !44
  %4 = load i32*, i32** %data, align 8, !dbg !45
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %5), !dbg !48
  %6 = load i32*, i32** %data, align 8, !dbg !49
  %7 = bitcast i32* %6 to i8*, !dbg !49
  call void @free(i8* %7) #5, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_good() #0 !dbg !52 {
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
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store i32* null, i32** %data, align 8, !dbg !79
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_goodG2B1Global, align 4, !dbg !80
  %0 = load i32*, i32** %data, align 8, !dbg !81
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_goodG2B1Source(i32* %0), !dbg !82
  store i32* %call, i32** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !87
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !88
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  %1 = load i32*, i32** %data, align 8, !dbg !91
  %2 = bitcast i32* %1 to i8*, !dbg !92
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !92
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !92
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !92
  %4 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !93
  store i32 0, i32* %arrayidx3, align 4, !dbg !94
  %5 = load i32*, i32** %data, align 8, !dbg !95
  call void @printWLine(i32* %5), !dbg !96
  %6 = load i32*, i32** %data, align 8, !dbg !97
  %7 = bitcast i32* %6 to i8*, !dbg !97
  call void @free(i8* %7) #5, !dbg !98
  ret void, !dbg !99
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i32* null, i32** %data, align 8, !dbg !103
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_goodG2B2Global, align 4, !dbg !104
  %0 = load i32*, i32** %data, align 8, !dbg !105
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_goodG2B2Source(i32* %0), !dbg !106
  store i32* %call, i32** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !112
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %1 = load i32*, i32** %data, align 8, !dbg !115
  %2 = bitcast i32* %1 to i8*, !dbg !116
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !116
  %4 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx3 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !117
  store i32 0, i32* %arrayidx3, align 4, !dbg !118
  %5 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* %5), !dbg !120
  %6 = load i32*, i32** %data, align 8, !dbg !121
  %7 = bitcast i32* %6 to i8*, !dbg !121
  call void @free(i8* %7) #5, !dbg !122
  ret void, !dbg !123
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_goodG2B2Source(i32*) #2

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
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_goodG2B1Global", scope: !2, file: !10, line: 51, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_goodG2B2Global", scope: !2, file: !10, line: 52, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocation(line: 31, column: 10, scope: !20)
!29 = !DILocation(line: 32, column: 77, scope: !20)
!30 = !DILocation(line: 33, column: 84, scope: !20)
!31 = !DILocation(line: 33, column: 12, scope: !20)
!32 = !DILocation(line: 33, column: 10, scope: !20)
!33 = !DILocalVariable(name: "source", scope: !34, file: !10, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 35, column: 17, scope: !34)
!39 = !DILocation(line: 36, column: 17, scope: !34)
!40 = !DILocation(line: 36, column: 9, scope: !34)
!41 = !DILocation(line: 37, column: 9, scope: !34)
!42 = !DILocation(line: 37, column: 23, scope: !34)
!43 = !DILocation(line: 39, column: 16, scope: !34)
!44 = !DILocation(line: 39, column: 9, scope: !34)
!45 = !DILocation(line: 40, column: 9, scope: !34)
!46 = !DILocation(line: 40, column: 21, scope: !34)
!47 = !DILocation(line: 41, column: 20, scope: !34)
!48 = !DILocation(line: 41, column: 9, scope: !34)
!49 = !DILocation(line: 42, column: 14, scope: !34)
!50 = !DILocation(line: 42, column: 9, scope: !34)
!51 = !DILocation(line: 44, column: 1, scope: !20)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_22_good", scope: !10, file: !10, line: 96, type: !21, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocation(line: 98, column: 5, scope: !52)
!54 = !DILocation(line: 99, column: 5, scope: !52)
!55 = !DILocation(line: 100, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 112, type: !57, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!11, !11, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !10, line: 112, type: !11)
!63 = !DILocation(line: 112, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !10, line: 112, type: !59)
!65 = !DILocation(line: 112, column: 27, scope: !56)
!66 = !DILocation(line: 115, column: 22, scope: !56)
!67 = !DILocation(line: 115, column: 12, scope: !56)
!68 = !DILocation(line: 115, column: 5, scope: !56)
!69 = !DILocation(line: 117, column: 5, scope: !56)
!70 = !DILocation(line: 118, column: 5, scope: !56)
!71 = !DILocation(line: 119, column: 5, scope: !56)
!72 = !DILocation(line: 122, column: 5, scope: !56)
!73 = !DILocation(line: 123, column: 5, scope: !56)
!74 = !DILocation(line: 124, column: 5, scope: !56)
!75 = !DILocation(line: 126, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 57, type: !21, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !10, line: 59, type: !24)
!78 = !DILocation(line: 59, column: 15, scope: !76)
!79 = !DILocation(line: 60, column: 10, scope: !76)
!80 = !DILocation(line: 61, column: 82, scope: !76)
!81 = !DILocation(line: 62, column: 89, scope: !76)
!82 = !DILocation(line: 62, column: 12, scope: !76)
!83 = !DILocation(line: 62, column: 10, scope: !76)
!84 = !DILocalVariable(name: "source", scope: !85, file: !10, line: 64, type: !35)
!85 = distinct !DILexicalBlock(scope: !76, file: !10, line: 63, column: 5)
!86 = !DILocation(line: 64, column: 17, scope: !85)
!87 = !DILocation(line: 65, column: 17, scope: !85)
!88 = !DILocation(line: 65, column: 9, scope: !85)
!89 = !DILocation(line: 66, column: 9, scope: !85)
!90 = !DILocation(line: 66, column: 23, scope: !85)
!91 = !DILocation(line: 68, column: 16, scope: !85)
!92 = !DILocation(line: 68, column: 9, scope: !85)
!93 = !DILocation(line: 69, column: 9, scope: !85)
!94 = !DILocation(line: 69, column: 21, scope: !85)
!95 = !DILocation(line: 70, column: 20, scope: !85)
!96 = !DILocation(line: 70, column: 9, scope: !85)
!97 = !DILocation(line: 71, column: 14, scope: !85)
!98 = !DILocation(line: 71, column: 9, scope: !85)
!99 = !DILocation(line: 73, column: 1, scope: !76)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !10, line: 80, type: !24)
!102 = !DILocation(line: 80, column: 15, scope: !100)
!103 = !DILocation(line: 81, column: 10, scope: !100)
!104 = !DILocation(line: 82, column: 82, scope: !100)
!105 = !DILocation(line: 83, column: 89, scope: !100)
!106 = !DILocation(line: 83, column: 12, scope: !100)
!107 = !DILocation(line: 83, column: 10, scope: !100)
!108 = !DILocalVariable(name: "source", scope: !109, file: !10, line: 85, type: !35)
!109 = distinct !DILexicalBlock(scope: !100, file: !10, line: 84, column: 5)
!110 = !DILocation(line: 85, column: 17, scope: !109)
!111 = !DILocation(line: 86, column: 17, scope: !109)
!112 = !DILocation(line: 86, column: 9, scope: !109)
!113 = !DILocation(line: 87, column: 9, scope: !109)
!114 = !DILocation(line: 87, column: 23, scope: !109)
!115 = !DILocation(line: 89, column: 16, scope: !109)
!116 = !DILocation(line: 89, column: 9, scope: !109)
!117 = !DILocation(line: 90, column: 9, scope: !109)
!118 = !DILocation(line: 90, column: 21, scope: !109)
!119 = !DILocation(line: 91, column: 20, scope: !109)
!120 = !DILocation(line: 91, column: 9, scope: !109)
!121 = !DILocation(line: 92, column: 14, scope: !109)
!122 = !DILocation(line: 92, column: 9, scope: !109)
!123 = !DILocation(line: 94, column: 1, scope: !100)
