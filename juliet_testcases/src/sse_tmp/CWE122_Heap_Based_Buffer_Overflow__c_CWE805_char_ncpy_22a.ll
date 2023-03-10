; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  store i8* null, i8** %data, align 8, !dbg !27
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_badGlobal, align 4, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_badSource(i8* %0), !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #5, !dbg !43
  %2 = load i8*, i8** %data, align 8, !dbg !44
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !44
  store i8 0, i8* %arrayidx3, align 1, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %3), !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* %4) #5, !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_good() #0 !dbg !51 {
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
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i8* null, i8** %data, align 8, !dbg !76
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_goodG2B1Global, align 4, !dbg !77
  %0 = load i8*, i8** %data, align 8, !dbg !78
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_goodG2B1Source(i8* %0), !dbg !79
  store i8* %call, i8** %data, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !84
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %1 = load i8*, i8** %data, align 8, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !88
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #5, !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !90
  store i8 0, i8* %arrayidx3, align 1, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  call void @printLine(i8* %3), !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  call void @free(i8* %4) #5, !dbg !95
  ret void, !dbg !96
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i8* null, i8** %data, align 8, !dbg !100
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_goodG2B2Global, align 4, !dbg !101
  %0 = load i8*, i8** %data, align 8, !dbg !102
  %call = call i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_goodG2B2Source(i8* %0), !dbg !103
  store i8* %call, i8** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %1 = load i8*, i8** %data, align 8, !dbg !111
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  %call2 = call i8* @strncpy(i8* %1, i8* %arraydecay1, i64 99) #5, !dbg !113
  %2 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx3 = getelementptr inbounds i8, i8* %2, i64 99, !dbg !114
  store i8 0, i8* %arrayidx3, align 1, !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  call void @printLine(i8* %3), !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  call void @free(i8* %4) #5, !dbg !119
  ret void, !dbg !120
}

declare dso_local i8* @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_goodG2B1Global", scope: !2, file: !10, line: 51, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_goodG2B2Global", scope: !2, file: !10, line: 52, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 30, column: 12, scope: !20)
!27 = !DILocation(line: 31, column: 10, scope: !20)
!28 = !DILocation(line: 32, column: 72, scope: !20)
!29 = !DILocation(line: 33, column: 79, scope: !20)
!30 = !DILocation(line: 33, column: 12, scope: !20)
!31 = !DILocation(line: 33, column: 10, scope: !20)
!32 = !DILocalVariable(name: "source", scope: !33, file: !10, line: 35, type: !34)
!33 = distinct !DILexicalBlock(scope: !20, file: !10, line: 34, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 35, column: 14, scope: !33)
!38 = !DILocation(line: 36, column: 9, scope: !33)
!39 = !DILocation(line: 37, column: 9, scope: !33)
!40 = !DILocation(line: 37, column: 23, scope: !33)
!41 = !DILocation(line: 39, column: 17, scope: !33)
!42 = !DILocation(line: 39, column: 23, scope: !33)
!43 = !DILocation(line: 39, column: 9, scope: !33)
!44 = !DILocation(line: 40, column: 9, scope: !33)
!45 = !DILocation(line: 40, column: 21, scope: !33)
!46 = !DILocation(line: 41, column: 19, scope: !33)
!47 = !DILocation(line: 41, column: 9, scope: !33)
!48 = !DILocation(line: 42, column: 14, scope: !33)
!49 = !DILocation(line: 42, column: 9, scope: !33)
!50 = !DILocation(line: 44, column: 1, scope: !20)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_22_good", scope: !10, file: !10, line: 96, type: !21, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 98, column: 5, scope: !51)
!53 = !DILocation(line: 99, column: 5, scope: !51)
!54 = !DILocation(line: 100, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 112, type: !56, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!11, !11, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !10, line: 112, type: !11)
!60 = !DILocation(line: 112, column: 14, scope: !55)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !10, line: 112, type: !58)
!62 = !DILocation(line: 112, column: 27, scope: !55)
!63 = !DILocation(line: 115, column: 22, scope: !55)
!64 = !DILocation(line: 115, column: 12, scope: !55)
!65 = !DILocation(line: 115, column: 5, scope: !55)
!66 = !DILocation(line: 117, column: 5, scope: !55)
!67 = !DILocation(line: 118, column: 5, scope: !55)
!68 = !DILocation(line: 119, column: 5, scope: !55)
!69 = !DILocation(line: 122, column: 5, scope: !55)
!70 = !DILocation(line: 123, column: 5, scope: !55)
!71 = !DILocation(line: 124, column: 5, scope: !55)
!72 = !DILocation(line: 126, column: 5, scope: !55)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 57, type: !21, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !10, line: 59, type: !24)
!75 = !DILocation(line: 59, column: 12, scope: !73)
!76 = !DILocation(line: 60, column: 10, scope: !73)
!77 = !DILocation(line: 61, column: 77, scope: !73)
!78 = !DILocation(line: 62, column: 84, scope: !73)
!79 = !DILocation(line: 62, column: 12, scope: !73)
!80 = !DILocation(line: 62, column: 10, scope: !73)
!81 = !DILocalVariable(name: "source", scope: !82, file: !10, line: 64, type: !34)
!82 = distinct !DILexicalBlock(scope: !73, file: !10, line: 63, column: 5)
!83 = !DILocation(line: 64, column: 14, scope: !82)
!84 = !DILocation(line: 65, column: 9, scope: !82)
!85 = !DILocation(line: 66, column: 9, scope: !82)
!86 = !DILocation(line: 66, column: 23, scope: !82)
!87 = !DILocation(line: 68, column: 17, scope: !82)
!88 = !DILocation(line: 68, column: 23, scope: !82)
!89 = !DILocation(line: 68, column: 9, scope: !82)
!90 = !DILocation(line: 69, column: 9, scope: !82)
!91 = !DILocation(line: 69, column: 21, scope: !82)
!92 = !DILocation(line: 70, column: 19, scope: !82)
!93 = !DILocation(line: 70, column: 9, scope: !82)
!94 = !DILocation(line: 71, column: 14, scope: !82)
!95 = !DILocation(line: 71, column: 9, scope: !82)
!96 = !DILocation(line: 73, column: 1, scope: !73)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocalVariable(name: "data", scope: !97, file: !10, line: 80, type: !24)
!99 = !DILocation(line: 80, column: 12, scope: !97)
!100 = !DILocation(line: 81, column: 10, scope: !97)
!101 = !DILocation(line: 82, column: 77, scope: !97)
!102 = !DILocation(line: 83, column: 84, scope: !97)
!103 = !DILocation(line: 83, column: 12, scope: !97)
!104 = !DILocation(line: 83, column: 10, scope: !97)
!105 = !DILocalVariable(name: "source", scope: !106, file: !10, line: 85, type: !34)
!106 = distinct !DILexicalBlock(scope: !97, file: !10, line: 84, column: 5)
!107 = !DILocation(line: 85, column: 14, scope: !106)
!108 = !DILocation(line: 86, column: 9, scope: !106)
!109 = !DILocation(line: 87, column: 9, scope: !106)
!110 = !DILocation(line: 87, column: 23, scope: !106)
!111 = !DILocation(line: 89, column: 17, scope: !106)
!112 = !DILocation(line: 89, column: 23, scope: !106)
!113 = !DILocation(line: 89, column: 9, scope: !106)
!114 = !DILocation(line: 90, column: 9, scope: !106)
!115 = !DILocation(line: 90, column: 21, scope: !106)
!116 = !DILocation(line: 91, column: 19, scope: !106)
!117 = !DILocation(line: 91, column: 9, scope: !106)
!118 = !DILocation(line: 92, column: 14, scope: !106)
!119 = !DILocation(line: 92, column: 9, scope: !106)
!120 = !DILocation(line: 94, column: 1, scope: !97)
