; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_badGlobal, align 4, !dbg !29
  %0 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_badSource(i32* %0), !dbg !31
  store i32* %call, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !39
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !40
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call3 = call i32* @wcscpy(i32* %1, i32* %arraydecay2) #4, !dbg !45
  %2 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* %2), !dbg !47
  %3 = load i32*, i32** %data, align 8, !dbg !48
  %4 = bitcast i32* %3 to i8*, !dbg !48
  call void @free(i8* %4) #4, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_good() #0 !dbg !51 {
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
  %call = call i64 @time(i64* null) #4, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #4, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i32* null, i32** %data, align 8, !dbg !78
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B1Global, align 4, !dbg !79
  %0 = load i32*, i32** %data, align 8, !dbg !80
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B1Source(i32* %0), !dbg !81
  store i32* %call, i32** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !86
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !87
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !91
  %call3 = call i32* @wcscpy(i32* %1, i32* %arraydecay2) #4, !dbg !92
  %2 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* %2), !dbg !94
  %3 = load i32*, i32** %data, align 8, !dbg !95
  %4 = bitcast i32* %3 to i8*, !dbg !95
  call void @free(i8* %4) #4, !dbg !96
  ret void, !dbg !97
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32* null, i32** %data, align 8, !dbg !101
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B2Global, align 4, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B2Source(i32* %0), !dbg !104
  store i32* %call, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !110
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !114
  %call3 = call i32* @wcscpy(i32* %1, i32* %arraydecay2) #4, !dbg !115
  %2 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* %2), !dbg !117
  %3 = load i32*, i32** %data, align 8, !dbg !118
  %4 = bitcast i32* %3 to i8*, !dbg !118
  call void @free(i8* %4) #4, !dbg !119
  ret void, !dbg !120
}

declare dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B1Global", scope: !2, file: !10, line: 50, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_goodG2B2Global", scope: !2, file: !10, line: 51, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocation(line: 31, column: 10, scope: !20)
!29 = !DILocation(line: 32, column: 72, scope: !20)
!30 = !DILocation(line: 33, column: 79, scope: !20)
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
!44 = !DILocation(line: 39, column: 22, scope: !34)
!45 = !DILocation(line: 39, column: 9, scope: !34)
!46 = !DILocation(line: 40, column: 20, scope: !34)
!47 = !DILocation(line: 40, column: 9, scope: !34)
!48 = !DILocation(line: 41, column: 14, scope: !34)
!49 = !DILocation(line: 41, column: 9, scope: !34)
!50 = !DILocation(line: 43, column: 1, scope: !20)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_22_good", scope: !10, file: !10, line: 93, type: !21, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 95, column: 5, scope: !51)
!53 = !DILocation(line: 96, column: 5, scope: !51)
!54 = !DILocation(line: 97, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 109, type: !56, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!11, !11, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !10, line: 109, type: !11)
!62 = !DILocation(line: 109, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !10, line: 109, type: !58)
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
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 56, type: !21, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 58, type: !24)
!77 = !DILocation(line: 58, column: 15, scope: !75)
!78 = !DILocation(line: 59, column: 10, scope: !75)
!79 = !DILocation(line: 60, column: 77, scope: !75)
!80 = !DILocation(line: 61, column: 84, scope: !75)
!81 = !DILocation(line: 61, column: 12, scope: !75)
!82 = !DILocation(line: 61, column: 10, scope: !75)
!83 = !DILocalVariable(name: "source", scope: !84, file: !10, line: 63, type: !35)
!84 = distinct !DILexicalBlock(scope: !75, file: !10, line: 62, column: 5)
!85 = !DILocation(line: 63, column: 17, scope: !84)
!86 = !DILocation(line: 64, column: 17, scope: !84)
!87 = !DILocation(line: 64, column: 9, scope: !84)
!88 = !DILocation(line: 65, column: 9, scope: !84)
!89 = !DILocation(line: 65, column: 23, scope: !84)
!90 = !DILocation(line: 67, column: 16, scope: !84)
!91 = !DILocation(line: 67, column: 22, scope: !84)
!92 = !DILocation(line: 67, column: 9, scope: !84)
!93 = !DILocation(line: 68, column: 20, scope: !84)
!94 = !DILocation(line: 68, column: 9, scope: !84)
!95 = !DILocation(line: 69, column: 14, scope: !84)
!96 = !DILocation(line: 69, column: 9, scope: !84)
!97 = !DILocation(line: 71, column: 1, scope: !75)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 76, type: !21, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !10, line: 78, type: !24)
!100 = !DILocation(line: 78, column: 15, scope: !98)
!101 = !DILocation(line: 79, column: 10, scope: !98)
!102 = !DILocation(line: 80, column: 77, scope: !98)
!103 = !DILocation(line: 81, column: 84, scope: !98)
!104 = !DILocation(line: 81, column: 12, scope: !98)
!105 = !DILocation(line: 81, column: 10, scope: !98)
!106 = !DILocalVariable(name: "source", scope: !107, file: !10, line: 83, type: !35)
!107 = distinct !DILexicalBlock(scope: !98, file: !10, line: 82, column: 5)
!108 = !DILocation(line: 83, column: 17, scope: !107)
!109 = !DILocation(line: 84, column: 17, scope: !107)
!110 = !DILocation(line: 84, column: 9, scope: !107)
!111 = !DILocation(line: 85, column: 9, scope: !107)
!112 = !DILocation(line: 85, column: 23, scope: !107)
!113 = !DILocation(line: 87, column: 16, scope: !107)
!114 = !DILocation(line: 87, column: 22, scope: !107)
!115 = !DILocation(line: 87, column: 9, scope: !107)
!116 = !DILocation(line: 88, column: 20, scope: !107)
!117 = !DILocation(line: 88, column: 9, scope: !107)
!118 = !DILocation(line: 89, column: 14, scope: !107)
!119 = !DILocation(line: 89, column: 9, scope: !107)
!120 = !DILocation(line: 91, column: 1, scope: !98)
