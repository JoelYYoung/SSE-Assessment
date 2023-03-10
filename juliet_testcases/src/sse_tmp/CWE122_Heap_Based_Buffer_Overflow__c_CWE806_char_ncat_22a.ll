; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !10
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !14
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_bad() #0 !dbg !22 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_badGlobal, align 4, !dbg !29
  %0 = load i8*, i8** %data, align 8, !dbg !30
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_badSource(i8* %0), !dbg !31
  store i8* %call1, i8** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %2 = load i8*, i8** %data, align 8, !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %call2 = call i64 @strlen(i8* %3) #7, !dbg !42
  %call3 = call i8* @strncat(i8* %arraydecay, i8* %2, i64 %call2) #6, !dbg !43
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !44
  store i8 0, i8* %arrayidx, align 1, !dbg !45
  %4 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %4), !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* %5) #6, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_badSource(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_good() #0 !dbg !51 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !76
  store i8* %call, i8** %data, align 8, !dbg !77
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_goodG2B1Global, align 4, !dbg !78
  %0 = load i8*, i8** %data, align 8, !dbg !79
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_goodG2B1Source(i8* %0), !dbg !80
  store i8* %call1, i8** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !82, metadata !DIExpression()), !dbg !84
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !84
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !85
  %2 = load i8*, i8** %data, align 8, !dbg !86
  %3 = load i8*, i8** %data, align 8, !dbg !87
  %call2 = call i64 @strlen(i8* %3) #7, !dbg !88
  %call3 = call i8* @strncat(i8* %arraydecay, i8* %2, i64 %call2) #6, !dbg !89
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  call void @printLine(i8* %4), !dbg !93
  %5 = load i8*, i8** %data, align 8, !dbg !94
  call void @free(i8* %5) #6, !dbg !95
  ret void, !dbg !96
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_goodG2B1Source(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !101
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_goodG2B2Global, align 4, !dbg !102
  %0 = load i8*, i8** %data, align 8, !dbg !103
  %call1 = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_goodG2B2Source(i8* %0), !dbg !104
  store i8* %call1, i8** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !108
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !109
  %2 = load i8*, i8** %data, align 8, !dbg !110
  %3 = load i8*, i8** %data, align 8, !dbg !111
  %call2 = call i64 @strlen(i8* %3) #7, !dbg !112
  %call3 = call i8* @strncat(i8* %arraydecay, i8* %2, i64 %call2) #6, !dbg !113
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %4 = load i8*, i8** %data, align 8, !dbg !116
  call void @printLine(i8* %4), !dbg !117
  %5 = load i8*, i8** %data, align 8, !dbg !118
  call void @free(i8* %5) #6, !dbg !119
  ret void, !dbg !120
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_goodG2B2Source(i8*) #3

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
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_badGlobal", scope: !2, file: !12, line: 24, type: !13, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_goodG2B1Global", scope: !2, file: !12, line: 49, type: !13, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_goodG2B2Global", scope: !2, file: !12, line: 50, type: !13, isLocal: false, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_bad", scope: !12, file: !12, line: 28, type: !23, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !12, line: 30, type: !6)
!26 = !DILocation(line: 30, column: 12, scope: !22)
!27 = !DILocation(line: 31, column: 20, scope: !22)
!28 = !DILocation(line: 31, column: 10, scope: !22)
!29 = !DILocation(line: 32, column: 72, scope: !22)
!30 = !DILocation(line: 33, column: 79, scope: !22)
!31 = !DILocation(line: 33, column: 12, scope: !22)
!32 = !DILocation(line: 33, column: 10, scope: !22)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !12, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !22, file: !12, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 35, column: 14, scope: !34)
!39 = !DILocation(line: 37, column: 17, scope: !34)
!40 = !DILocation(line: 37, column: 23, scope: !34)
!41 = !DILocation(line: 37, column: 36, scope: !34)
!42 = !DILocation(line: 37, column: 29, scope: !34)
!43 = !DILocation(line: 37, column: 9, scope: !34)
!44 = !DILocation(line: 38, column: 9, scope: !34)
!45 = !DILocation(line: 38, column: 20, scope: !34)
!46 = !DILocation(line: 39, column: 19, scope: !34)
!47 = !DILocation(line: 39, column: 9, scope: !34)
!48 = !DILocation(line: 40, column: 14, scope: !34)
!49 = !DILocation(line: 40, column: 9, scope: !34)
!50 = !DILocation(line: 42, column: 1, scope: !22)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_22_good", scope: !12, file: !12, line: 90, type: !23, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 92, column: 5, scope: !51)
!53 = !DILocation(line: 93, column: 5, scope: !51)
!54 = !DILocation(line: 94, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !56, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!13, !13, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 106, type: !13)
!60 = !DILocation(line: 106, column: 14, scope: !55)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 106, type: !58)
!62 = !DILocation(line: 106, column: 27, scope: !55)
!63 = !DILocation(line: 109, column: 22, scope: !55)
!64 = !DILocation(line: 109, column: 12, scope: !55)
!65 = !DILocation(line: 109, column: 5, scope: !55)
!66 = !DILocation(line: 111, column: 5, scope: !55)
!67 = !DILocation(line: 112, column: 5, scope: !55)
!68 = !DILocation(line: 113, column: 5, scope: !55)
!69 = !DILocation(line: 116, column: 5, scope: !55)
!70 = !DILocation(line: 117, column: 5, scope: !55)
!71 = !DILocation(line: 118, column: 5, scope: !55)
!72 = !DILocation(line: 120, column: 5, scope: !55)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !23, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 57, type: !6)
!75 = !DILocation(line: 57, column: 12, scope: !73)
!76 = !DILocation(line: 58, column: 20, scope: !73)
!77 = !DILocation(line: 58, column: 10, scope: !73)
!78 = !DILocation(line: 59, column: 77, scope: !73)
!79 = !DILocation(line: 60, column: 84, scope: !73)
!80 = !DILocation(line: 60, column: 12, scope: !73)
!81 = !DILocation(line: 60, column: 10, scope: !73)
!82 = !DILocalVariable(name: "dest", scope: !83, file: !12, line: 62, type: !35)
!83 = distinct !DILexicalBlock(scope: !73, file: !12, line: 61, column: 5)
!84 = !DILocation(line: 62, column: 14, scope: !83)
!85 = !DILocation(line: 64, column: 17, scope: !83)
!86 = !DILocation(line: 64, column: 23, scope: !83)
!87 = !DILocation(line: 64, column: 36, scope: !83)
!88 = !DILocation(line: 64, column: 29, scope: !83)
!89 = !DILocation(line: 64, column: 9, scope: !83)
!90 = !DILocation(line: 65, column: 9, scope: !83)
!91 = !DILocation(line: 65, column: 20, scope: !83)
!92 = !DILocation(line: 66, column: 19, scope: !83)
!93 = !DILocation(line: 66, column: 9, scope: !83)
!94 = !DILocation(line: 67, column: 14, scope: !83)
!95 = !DILocation(line: 67, column: 9, scope: !83)
!96 = !DILocation(line: 69, column: 1, scope: !73)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 74, type: !23, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 76, type: !6)
!99 = !DILocation(line: 76, column: 12, scope: !97)
!100 = !DILocation(line: 77, column: 20, scope: !97)
!101 = !DILocation(line: 77, column: 10, scope: !97)
!102 = !DILocation(line: 78, column: 77, scope: !97)
!103 = !DILocation(line: 79, column: 84, scope: !97)
!104 = !DILocation(line: 79, column: 12, scope: !97)
!105 = !DILocation(line: 79, column: 10, scope: !97)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !12, line: 81, type: !35)
!107 = distinct !DILexicalBlock(scope: !97, file: !12, line: 80, column: 5)
!108 = !DILocation(line: 81, column: 14, scope: !107)
!109 = !DILocation(line: 83, column: 17, scope: !107)
!110 = !DILocation(line: 83, column: 23, scope: !107)
!111 = !DILocation(line: 83, column: 36, scope: !107)
!112 = !DILocation(line: 83, column: 29, scope: !107)
!113 = !DILocation(line: 83, column: 9, scope: !107)
!114 = !DILocation(line: 84, column: 9, scope: !107)
!115 = !DILocation(line: 84, column: 20, scope: !107)
!116 = !DILocation(line: 85, column: 19, scope: !107)
!117 = !DILocation(line: 85, column: 9, scope: !107)
!118 = !DILocation(line: 86, column: 14, scope: !107)
!119 = !DILocation(line: 86, column: 9, scope: !107)
!120 = !DILocation(line: 88, column: 1, scope: !97)
