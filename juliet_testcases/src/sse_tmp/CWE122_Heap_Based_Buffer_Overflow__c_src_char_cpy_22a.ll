; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !10
@CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !14
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_badGlobal, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_badSource(i8* %0), !dbg !31
  store i8* %call1, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %2 = load i8*, i8** %data, align 8, !dbg !40
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %2) #5, !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* %3), !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  call void @free(i8* %4) #5, !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_badSource(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_good() #0 !dbg !47 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !72
  store i8* %call, i8** %data, align 8, !dbg !73
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_goodG2B1Global, align 4, !dbg !74
  %0 = load i8*, i8** %data, align 8, !dbg !75
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_goodG2B1Source(i8* %0), !dbg !76
  store i8* %call1, i8** %data, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !78, metadata !DIExpression()), !dbg !80
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !80
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !81
  %2 = load i8*, i8** %data, align 8, !dbg !82
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %2) #5, !dbg !83
  %3 = load i8*, i8** %data, align 8, !dbg !84
  call void @printLine(i8* %3), !dbg !85
  %4 = load i8*, i8** %data, align 8, !dbg !86
  call void @free(i8* %4) #5, !dbg !87
  ret void, !dbg !88
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_goodG2B1Source(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !92
  store i8* %call, i8** %data, align 8, !dbg !93
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_goodG2B2Global, align 4, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_goodG2B2Source(i8* %0), !dbg !96
  store i8* %call1, i8** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !101
  %2 = load i8*, i8** %data, align 8, !dbg !102
  %call2 = call i8* @strcpy(i8* %arraydecay, i8* %2) #5, !dbg !103
  %3 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* %3), !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !106
  call void @free(i8* %4) #5, !dbg !107
  ret void, !dbg !108
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_goodG2B2Source(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_badGlobal", scope: !2, file: !12, line: 24, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_goodG2B1Global", scope: !2, file: !12, line: 48, type: !13, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_goodG2B2Global", scope: !2, file: !12, line: 49, type: !13, isLocal: false, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_bad", scope: !12, file: !12, line: 28, type: !23, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 30, type: !6)
!26 = !DILocation(line: 30, column: 12, scope: !22)
!27 = !DILocation(line: 31, column: 20, scope: !22)
!28 = !DILocation(line: 31, column: 10, scope: !22)
!29 = !DILocation(line: 32, column: 68, scope: !22)
!30 = !DILocation(line: 33, column: 75, scope: !22)
!31 = !DILocation(line: 33, column: 12, scope: !22)
!32 = !DILocation(line: 33, column: 10, scope: !22)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !22, file: !12, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 35, column: 14, scope: !34)
!39 = !DILocation(line: 37, column: 16, scope: !34)
!40 = !DILocation(line: 37, column: 22, scope: !34)
!41 = !DILocation(line: 37, column: 9, scope: !34)
!42 = !DILocation(line: 38, column: 19, scope: !34)
!43 = !DILocation(line: 38, column: 9, scope: !34)
!44 = !DILocation(line: 39, column: 14, scope: !34)
!45 = !DILocation(line: 39, column: 9, scope: !34)
!46 = !DILocation(line: 41, column: 1, scope: !22)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_22_good", scope: !12, file: !12, line: 87, type: !23, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DILocation(line: 89, column: 5, scope: !47)
!49 = !DILocation(line: 90, column: 5, scope: !47)
!50 = !DILocation(line: 91, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !52, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!13, !13, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 103, type: !13)
!56 = !DILocation(line: 103, column: 14, scope: !51)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 103, type: !54)
!58 = !DILocation(line: 103, column: 27, scope: !51)
!59 = !DILocation(line: 106, column: 22, scope: !51)
!60 = !DILocation(line: 106, column: 12, scope: !51)
!61 = !DILocation(line: 106, column: 5, scope: !51)
!62 = !DILocation(line: 108, column: 5, scope: !51)
!63 = !DILocation(line: 109, column: 5, scope: !51)
!64 = !DILocation(line: 110, column: 5, scope: !51)
!65 = !DILocation(line: 113, column: 5, scope: !51)
!66 = !DILocation(line: 114, column: 5, scope: !51)
!67 = !DILocation(line: 115, column: 5, scope: !51)
!68 = !DILocation(line: 117, column: 5, scope: !51)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !23, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 56, type: !6)
!71 = !DILocation(line: 56, column: 12, scope: !69)
!72 = !DILocation(line: 57, column: 20, scope: !69)
!73 = !DILocation(line: 57, column: 10, scope: !69)
!74 = !DILocation(line: 58, column: 73, scope: !69)
!75 = !DILocation(line: 59, column: 80, scope: !69)
!76 = !DILocation(line: 59, column: 12, scope: !69)
!77 = !DILocation(line: 59, column: 10, scope: !69)
!78 = !DILocalVariable(name: "dest", scope: !79, file: !12, line: 61, type: !35)
!79 = distinct !DILexicalBlock(scope: !69, file: !12, line: 60, column: 5)
!80 = !DILocation(line: 61, column: 14, scope: !79)
!81 = !DILocation(line: 63, column: 16, scope: !79)
!82 = !DILocation(line: 63, column: 22, scope: !79)
!83 = !DILocation(line: 63, column: 9, scope: !79)
!84 = !DILocation(line: 64, column: 19, scope: !79)
!85 = !DILocation(line: 64, column: 9, scope: !79)
!86 = !DILocation(line: 65, column: 14, scope: !79)
!87 = !DILocation(line: 65, column: 9, scope: !79)
!88 = !DILocation(line: 67, column: 1, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 72, type: !23, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 74, type: !6)
!91 = !DILocation(line: 74, column: 12, scope: !89)
!92 = !DILocation(line: 75, column: 20, scope: !89)
!93 = !DILocation(line: 75, column: 10, scope: !89)
!94 = !DILocation(line: 76, column: 73, scope: !89)
!95 = !DILocation(line: 77, column: 80, scope: !89)
!96 = !DILocation(line: 77, column: 12, scope: !89)
!97 = !DILocation(line: 77, column: 10, scope: !89)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !12, line: 79, type: !35)
!99 = distinct !DILexicalBlock(scope: !89, file: !12, line: 78, column: 5)
!100 = !DILocation(line: 79, column: 14, scope: !99)
!101 = !DILocation(line: 81, column: 16, scope: !99)
!102 = !DILocation(line: 81, column: 22, scope: !99)
!103 = !DILocation(line: 81, column: 9, scope: !99)
!104 = !DILocation(line: 82, column: 19, scope: !99)
!105 = !DILocation(line: 82, column: 9, scope: !99)
!106 = !DILocation(line: 83, column: 14, scope: !99)
!107 = !DILocation(line: 83, column: 9, scope: !99)
!108 = !DILocation(line: 85, column: 1, scope: !89)
