; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  store i32* %3, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_badData, align 8, !dbg !40
  call void @badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_badData, align 8, !dbg !69
  store i32* %0, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !70, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !76
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !77
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %1 = load i32*, i32** %data, align 8, !dbg !80
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !81
  %call2 = call i32* @wcsncpy(i32* %1, i32* %arraydecay1, i64 99) #5, !dbg !82
  %2 = load i32*, i32** %data, align 8, !dbg !83
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !83
  store i32 0, i32* %arrayidx3, align 4, !dbg !84
  %3 = load i32*, i32** %data, align 8, !dbg !85
  call void @printWLine(i32* %3), !dbg !86
  %4 = load i32*, i32** %data, align 8, !dbg !87
  %5 = bitcast i32* %4 to i8*, !dbg !87
  call void @free(i8* %5) #5, !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !94
  %0 = bitcast i8* %call to i32*, !dbg !95
  store i32* %0, i32** %data, align 8, !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  %cmp = icmp eq i32* %1, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %3 = load i32*, i32** %data, align 8, !dbg !105
  store i32* %3, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_goodG2BData, align 8, !dbg !106
  call void @goodG2BSink(), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_goodG2BData, align 8, !dbg !112
  store i32* %0, i32** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !116
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !117
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %1 = load i32*, i32** %data, align 8, !dbg !120
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !121
  %call2 = call i32* @wcsncpy(i32* %1, i32* %arraydecay1, i64 99) #5, !dbg !122
  %2 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !123
  store i32 0, i32* %arrayidx3, align 4, !dbg !124
  %3 = load i32*, i32** %data, align 8, !dbg !125
  call void @printWLine(i32* %3), !dbg !126
  %4 = load i32*, i32** %data, align 8, !dbg !127
  %5 = bitcast i32* %4 to i8*, !dbg !127
  call void @free(i8* %5) #5, !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_badData", scope: !2, file: !15, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_goodG2BData", scope: !2, file: !15, line: 22, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_bad", scope: !15, file: !15, line: 41, type: !23, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 43, type: !6)
!26 = !DILocation(line: 43, column: 15, scope: !22)
!27 = !DILocation(line: 44, column: 10, scope: !22)
!28 = !DILocation(line: 46, column: 23, scope: !22)
!29 = !DILocation(line: 46, column: 12, scope: !22)
!30 = !DILocation(line: 46, column: 10, scope: !22)
!31 = !DILocation(line: 47, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !15, line: 47, column: 9)
!33 = !DILocation(line: 47, column: 14, scope: !32)
!34 = !DILocation(line: 47, column: 9, scope: !22)
!35 = !DILocation(line: 47, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 47, column: 23)
!37 = !DILocation(line: 48, column: 5, scope: !22)
!38 = !DILocation(line: 48, column: 13, scope: !22)
!39 = !DILocation(line: 49, column: 75, scope: !22)
!40 = !DILocation(line: 49, column: 73, scope: !22)
!41 = !DILocation(line: 50, column: 5, scope: !22)
!42 = !DILocation(line: 51, column: 1, scope: !22)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_ncpy_45_good", scope: !15, file: !15, line: 85, type: !23, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DILocation(line: 87, column: 5, scope: !43)
!45 = !DILocation(line: 88, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !47, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DISubroutineType(types: !48)
!48 = !{!9, !9, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !15, line: 99, type: !9)
!53 = !DILocation(line: 99, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !15, line: 99, type: !49)
!55 = !DILocation(line: 99, column: 27, scope: !46)
!56 = !DILocation(line: 102, column: 22, scope: !46)
!57 = !DILocation(line: 102, column: 12, scope: !46)
!58 = !DILocation(line: 102, column: 5, scope: !46)
!59 = !DILocation(line: 104, column: 5, scope: !46)
!60 = !DILocation(line: 105, column: 5, scope: !46)
!61 = !DILocation(line: 106, column: 5, scope: !46)
!62 = !DILocation(line: 109, column: 5, scope: !46)
!63 = !DILocation(line: 110, column: 5, scope: !46)
!64 = !DILocation(line: 111, column: 5, scope: !46)
!65 = !DILocation(line: 113, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !15, line: 28, type: !6)
!68 = !DILocation(line: 28, column: 15, scope: !66)
!69 = !DILocation(line: 28, column: 22, scope: !66)
!70 = !DILocalVariable(name: "source", scope: !71, file: !15, line: 30, type: !72)
!71 = distinct !DILexicalBlock(scope: !66, file: !15, line: 29, column: 5)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 100)
!75 = !DILocation(line: 30, column: 17, scope: !71)
!76 = !DILocation(line: 31, column: 17, scope: !71)
!77 = !DILocation(line: 31, column: 9, scope: !71)
!78 = !DILocation(line: 32, column: 9, scope: !71)
!79 = !DILocation(line: 32, column: 23, scope: !71)
!80 = !DILocation(line: 34, column: 17, scope: !71)
!81 = !DILocation(line: 34, column: 23, scope: !71)
!82 = !DILocation(line: 34, column: 9, scope: !71)
!83 = !DILocation(line: 35, column: 9, scope: !71)
!84 = !DILocation(line: 35, column: 21, scope: !71)
!85 = !DILocation(line: 36, column: 20, scope: !71)
!86 = !DILocation(line: 36, column: 9, scope: !71)
!87 = !DILocation(line: 37, column: 14, scope: !71)
!88 = !DILocation(line: 37, column: 9, scope: !71)
!89 = !DILocation(line: 39, column: 1, scope: !66)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 73, type: !23, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !15, line: 75, type: !6)
!92 = !DILocation(line: 75, column: 15, scope: !90)
!93 = !DILocation(line: 76, column: 10, scope: !90)
!94 = !DILocation(line: 78, column: 23, scope: !90)
!95 = !DILocation(line: 78, column: 12, scope: !90)
!96 = !DILocation(line: 78, column: 10, scope: !90)
!97 = !DILocation(line: 79, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !90, file: !15, line: 79, column: 9)
!99 = !DILocation(line: 79, column: 14, scope: !98)
!100 = !DILocation(line: 79, column: 9, scope: !90)
!101 = !DILocation(line: 79, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 79, column: 23)
!103 = !DILocation(line: 80, column: 5, scope: !90)
!104 = !DILocation(line: 80, column: 13, scope: !90)
!105 = !DILocation(line: 81, column: 79, scope: !90)
!106 = !DILocation(line: 81, column: 77, scope: !90)
!107 = !DILocation(line: 82, column: 5, scope: !90)
!108 = !DILocation(line: 83, column: 1, scope: !90)
!109 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 58, type: !23, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 60, type: !6)
!111 = !DILocation(line: 60, column: 15, scope: !109)
!112 = !DILocation(line: 60, column: 22, scope: !109)
!113 = !DILocalVariable(name: "source", scope: !114, file: !15, line: 62, type: !72)
!114 = distinct !DILexicalBlock(scope: !109, file: !15, line: 61, column: 5)
!115 = !DILocation(line: 62, column: 17, scope: !114)
!116 = !DILocation(line: 63, column: 17, scope: !114)
!117 = !DILocation(line: 63, column: 9, scope: !114)
!118 = !DILocation(line: 64, column: 9, scope: !114)
!119 = !DILocation(line: 64, column: 23, scope: !114)
!120 = !DILocation(line: 66, column: 17, scope: !114)
!121 = !DILocation(line: 66, column: 23, scope: !114)
!122 = !DILocation(line: 66, column: 9, scope: !114)
!123 = !DILocation(line: 67, column: 9, scope: !114)
!124 = !DILocation(line: 67, column: 21, scope: !114)
!125 = !DILocation(line: 68, column: 20, scope: !114)
!126 = !DILocation(line: 68, column: 9, scope: !114)
!127 = !DILocation(line: 69, column: 14, scope: !114)
!128 = !DILocation(line: 69, column: 9, scope: !114)
!129 = !DILocation(line: 71, column: 1, scope: !109)
