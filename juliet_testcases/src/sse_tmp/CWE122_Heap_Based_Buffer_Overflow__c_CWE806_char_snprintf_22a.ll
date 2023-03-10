; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !10
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !14
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_badGlobal, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_badSource(i8* %0), !dbg !31
  store i8* %call1, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %2 = load i8*, i8** %data, align 8, !dbg !40
  %call2 = call i64 @strlen(i8* %2) #7, !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !42
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #6, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %4), !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* %5) #6, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_badSource(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_good() #0 !dbg !49 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #6, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #6, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !74
  store i8* %call, i8** %data, align 8, !dbg !75
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_goodG2B1Global, align 4, !dbg !76
  %0 = load i8*, i8** %data, align 8, !dbg !77
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_goodG2B1Source(i8* %0), !dbg !78
  store i8* %call1, i8** %data, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !80, metadata !DIExpression()), !dbg !82
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !82
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !83
  %2 = load i8*, i8** %data, align 8, !dbg !84
  %call2 = call i64 @strlen(i8* %2) #7, !dbg !85
  %3 = load i8*, i8** %data, align 8, !dbg !86
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #6, !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !88
  call void @printLine(i8* %4), !dbg !89
  %5 = load i8*, i8** %data, align 8, !dbg !90
  call void @free(i8* %5) #6, !dbg !91
  ret void, !dbg !92
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_goodG2B1Source(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !96
  store i8* %call, i8** %data, align 8, !dbg !97
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_goodG2B2Global, align 4, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_goodG2B2Source(i8* %0), !dbg !100
  store i8* %call1, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !105
  %2 = load i8*, i8** %data, align 8, !dbg !106
  %call2 = call i64 @strlen(i8* %2) #7, !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #6, !dbg !109
  %4 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* %4), !dbg !111
  %5 = load i8*, i8** %data, align 8, !dbg !112
  call void @free(i8* %5) #6, !dbg !113
  ret void, !dbg !114
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_goodG2B2Source(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_badGlobal", scope: !2, file: !12, line: 30, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_goodG2B1Global", scope: !2, file: !12, line: 54, type: !13, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_goodG2B2Global", scope: !2, file: !12, line: 55, type: !13, isLocal: false, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_bad", scope: !12, file: !12, line: 34, type: !23, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 36, type: !6)
!26 = !DILocation(line: 36, column: 12, scope: !22)
!27 = !DILocation(line: 37, column: 20, scope: !22)
!28 = !DILocation(line: 37, column: 10, scope: !22)
!29 = !DILocation(line: 38, column: 76, scope: !22)
!30 = !DILocation(line: 39, column: 83, scope: !22)
!31 = !DILocation(line: 39, column: 12, scope: !22)
!32 = !DILocation(line: 39, column: 10, scope: !22)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 41, type: !35)
!34 = distinct !DILexicalBlock(scope: !22, file: !12, line: 40, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 41, column: 14, scope: !34)
!39 = !DILocation(line: 43, column: 18, scope: !34)
!40 = !DILocation(line: 43, column: 31, scope: !34)
!41 = !DILocation(line: 43, column: 24, scope: !34)
!42 = !DILocation(line: 43, column: 44, scope: !34)
!43 = !DILocation(line: 43, column: 9, scope: !34)
!44 = !DILocation(line: 44, column: 19, scope: !34)
!45 = !DILocation(line: 44, column: 9, scope: !34)
!46 = !DILocation(line: 45, column: 14, scope: !34)
!47 = !DILocation(line: 45, column: 9, scope: !34)
!48 = !DILocation(line: 47, column: 1, scope: !22)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_22_good", scope: !12, file: !12, line: 93, type: !23, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DILocation(line: 95, column: 5, scope: !49)
!51 = !DILocation(line: 96, column: 5, scope: !49)
!52 = !DILocation(line: 97, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !54, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!13, !13, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 109, type: !13)
!58 = !DILocation(line: 109, column: 14, scope: !53)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 109, type: !56)
!60 = !DILocation(line: 109, column: 27, scope: !53)
!61 = !DILocation(line: 112, column: 22, scope: !53)
!62 = !DILocation(line: 112, column: 12, scope: !53)
!63 = !DILocation(line: 112, column: 5, scope: !53)
!64 = !DILocation(line: 114, column: 5, scope: !53)
!65 = !DILocation(line: 115, column: 5, scope: !53)
!66 = !DILocation(line: 116, column: 5, scope: !53)
!67 = !DILocation(line: 119, column: 5, scope: !53)
!68 = !DILocation(line: 120, column: 5, scope: !53)
!69 = !DILocation(line: 121, column: 5, scope: !53)
!70 = !DILocation(line: 123, column: 5, scope: !53)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !23, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 62, type: !6)
!73 = !DILocation(line: 62, column: 12, scope: !71)
!74 = !DILocation(line: 63, column: 20, scope: !71)
!75 = !DILocation(line: 63, column: 10, scope: !71)
!76 = !DILocation(line: 64, column: 81, scope: !71)
!77 = !DILocation(line: 65, column: 88, scope: !71)
!78 = !DILocation(line: 65, column: 12, scope: !71)
!79 = !DILocation(line: 65, column: 10, scope: !71)
!80 = !DILocalVariable(name: "dest", scope: !81, file: !12, line: 67, type: !35)
!81 = distinct !DILexicalBlock(scope: !71, file: !12, line: 66, column: 5)
!82 = !DILocation(line: 67, column: 14, scope: !81)
!83 = !DILocation(line: 69, column: 18, scope: !81)
!84 = !DILocation(line: 69, column: 31, scope: !81)
!85 = !DILocation(line: 69, column: 24, scope: !81)
!86 = !DILocation(line: 69, column: 44, scope: !81)
!87 = !DILocation(line: 69, column: 9, scope: !81)
!88 = !DILocation(line: 70, column: 19, scope: !81)
!89 = !DILocation(line: 70, column: 9, scope: !81)
!90 = !DILocation(line: 71, column: 14, scope: !81)
!91 = !DILocation(line: 71, column: 9, scope: !81)
!92 = !DILocation(line: 73, column: 1, scope: !71)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 78, type: !23, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 80, type: !6)
!95 = !DILocation(line: 80, column: 12, scope: !93)
!96 = !DILocation(line: 81, column: 20, scope: !93)
!97 = !DILocation(line: 81, column: 10, scope: !93)
!98 = !DILocation(line: 82, column: 81, scope: !93)
!99 = !DILocation(line: 83, column: 88, scope: !93)
!100 = !DILocation(line: 83, column: 12, scope: !93)
!101 = !DILocation(line: 83, column: 10, scope: !93)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !12, line: 85, type: !35)
!103 = distinct !DILexicalBlock(scope: !93, file: !12, line: 84, column: 5)
!104 = !DILocation(line: 85, column: 14, scope: !103)
!105 = !DILocation(line: 87, column: 18, scope: !103)
!106 = !DILocation(line: 87, column: 31, scope: !103)
!107 = !DILocation(line: 87, column: 24, scope: !103)
!108 = !DILocation(line: 87, column: 44, scope: !103)
!109 = !DILocation(line: 87, column: 9, scope: !103)
!110 = !DILocation(line: 88, column: 19, scope: !103)
!111 = !DILocation(line: 88, column: 9, scope: !103)
!112 = !DILocation(line: 89, column: 14, scope: !103)
!113 = !DILocation(line: 89, column: 9, scope: !103)
!114 = !DILocation(line: 91, column: 1, scope: !93)
