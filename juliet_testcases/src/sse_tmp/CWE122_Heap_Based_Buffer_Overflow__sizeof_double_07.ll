; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07_bad() #0 !dbg !19 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store double* null, double** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !29
  %1 = bitcast i8* %call to double*, !dbg !31
  store double* %1, double** %data, align 8, !dbg !32
  %2 = load double*, double** %data, align 8, !dbg !33
  %cmp1 = icmp eq double* %2, null, !dbg !35
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !36

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data, align 8, !dbg !39
  store double 1.700000e+300, double* %3, align 8, !dbg !40
  br label %if.end3, !dbg !41

if.end3:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data, align 8, !dbg !42
  %5 = load double, double* %4, align 8, !dbg !43
  call void @printDoubleLine(double %5), !dbg !44
  %6 = load double*, double** %data, align 8, !dbg !45
  %7 = bitcast double* %6 to i8*, !dbg !45
  call void @free(i8* %7) #5, !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printDoubleLine(double) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store double* null, double** %data, align 8, !dbg !75
  %0 = load i32, i32* @staticFive, align 4, !dbg !76
  %cmp = icmp ne i32 %0, 5, !dbg !78
  br i1 %cmp, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  br label %if.end3, !dbg !82

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !83
  %1 = bitcast i8* %call to double*, !dbg !85
  store double* %1, double** %data, align 8, !dbg !86
  %2 = load double*, double** %data, align 8, !dbg !87
  %cmp1 = icmp eq double* %2, null, !dbg !89
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !90

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %if.else
  %3 = load double*, double** %data, align 8, !dbg !93
  store double 1.700000e+300, double* %3, align 8, !dbg !94
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %4 = load double*, double** %data, align 8, !dbg !95
  %5 = load double, double* %4, align 8, !dbg !96
  call void @printDoubleLine(double %5), !dbg !97
  %6 = load double*, double** %data, align 8, !dbg !98
  %7 = bitcast double* %6 to i8*, !dbg !98
  call void @free(i8* %7) #5, !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !102, metadata !DIExpression()), !dbg !103
  store double* null, double** %data, align 8, !dbg !104
  %0 = load i32, i32* @staticFive, align 4, !dbg !105
  %cmp = icmp eq i32 %0, 5, !dbg !107
  br i1 %cmp, label %if.then, label %if.end3, !dbg !108

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !109
  %1 = bitcast i8* %call to double*, !dbg !111
  store double* %1, double** %data, align 8, !dbg !112
  %2 = load double*, double** %data, align 8, !dbg !113
  %cmp1 = icmp eq double* %2, null, !dbg !115
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !116

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data, align 8, !dbg !119
  store double 1.700000e+300, double* %3, align 8, !dbg !120
  br label %if.end3, !dbg !121

if.end3:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data, align 8, !dbg !122
  %5 = load double, double* %4, align 8, !dbg !123
  call void @printDoubleLine(double %5), !dbg !124
  %6 = load double*, double** %data, align 8, !dbg !125
  %7 = bitcast double* %6 to i8*, !dbg !125
  call void @free(i8* %7) #5, !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 23, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07.c", directory: "/root/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07_bad", scope: !11, file: !11, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 29, type: !6)
!23 = !DILocation(line: 29, column: 14, scope: !19)
!24 = !DILocation(line: 31, column: 10, scope: !19)
!25 = !DILocation(line: 32, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 32, column: 8)
!27 = !DILocation(line: 32, column: 18, scope: !26)
!28 = !DILocation(line: 32, column: 8, scope: !19)
!29 = !DILocation(line: 36, column: 26, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !11, line: 33, column: 5)
!31 = !DILocation(line: 36, column: 16, scope: !30)
!32 = !DILocation(line: 36, column: 14, scope: !30)
!33 = !DILocation(line: 37, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !11, line: 37, column: 13)
!35 = !DILocation(line: 37, column: 18, scope: !34)
!36 = !DILocation(line: 37, column: 13, scope: !30)
!37 = !DILocation(line: 37, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !11, line: 37, column: 27)
!39 = !DILocation(line: 38, column: 10, scope: !30)
!40 = !DILocation(line: 38, column: 15, scope: !30)
!41 = !DILocation(line: 39, column: 5, scope: !30)
!42 = !DILocation(line: 41, column: 22, scope: !19)
!43 = !DILocation(line: 41, column: 21, scope: !19)
!44 = !DILocation(line: 41, column: 5, scope: !19)
!45 = !DILocation(line: 42, column: 10, scope: !19)
!46 = !DILocation(line: 42, column: 5, scope: !19)
!47 = !DILocation(line: 43, column: 1, scope: !19)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_07_good", scope: !11, file: !11, line: 90, type: !20, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DILocation(line: 92, column: 5, scope: !48)
!50 = !DILocation(line: 93, column: 5, scope: !48)
!51 = !DILocation(line: 94, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 106, type: !53, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!12, !12, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !11, line: 106, type: !12)
!59 = !DILocation(line: 106, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !11, line: 106, type: !55)
!61 = !DILocation(line: 106, column: 27, scope: !52)
!62 = !DILocation(line: 109, column: 22, scope: !52)
!63 = !DILocation(line: 109, column: 12, scope: !52)
!64 = !DILocation(line: 109, column: 5, scope: !52)
!65 = !DILocation(line: 111, column: 5, scope: !52)
!66 = !DILocation(line: 112, column: 5, scope: !52)
!67 = !DILocation(line: 113, column: 5, scope: !52)
!68 = !DILocation(line: 116, column: 5, scope: !52)
!69 = !DILocation(line: 117, column: 5, scope: !52)
!70 = !DILocation(line: 118, column: 5, scope: !52)
!71 = !DILocation(line: 120, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 50, type: !20, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocalVariable(name: "data", scope: !72, file: !11, line: 52, type: !6)
!74 = !DILocation(line: 52, column: 14, scope: !72)
!75 = !DILocation(line: 54, column: 10, scope: !72)
!76 = !DILocation(line: 55, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !11, line: 55, column: 8)
!78 = !DILocation(line: 55, column: 18, scope: !77)
!79 = !DILocation(line: 55, column: 8, scope: !72)
!80 = !DILocation(line: 58, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !11, line: 56, column: 5)
!82 = !DILocation(line: 59, column: 5, scope: !81)
!83 = !DILocation(line: 63, column: 26, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !11, line: 61, column: 5)
!85 = !DILocation(line: 63, column: 16, scope: !84)
!86 = !DILocation(line: 63, column: 14, scope: !84)
!87 = !DILocation(line: 64, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !11, line: 64, column: 13)
!89 = !DILocation(line: 64, column: 18, scope: !88)
!90 = !DILocation(line: 64, column: 13, scope: !84)
!91 = !DILocation(line: 64, column: 28, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !11, line: 64, column: 27)
!93 = !DILocation(line: 65, column: 10, scope: !84)
!94 = !DILocation(line: 65, column: 15, scope: !84)
!95 = !DILocation(line: 68, column: 22, scope: !72)
!96 = !DILocation(line: 68, column: 21, scope: !72)
!97 = !DILocation(line: 68, column: 5, scope: !72)
!98 = !DILocation(line: 69, column: 10, scope: !72)
!99 = !DILocation(line: 69, column: 5, scope: !72)
!100 = !DILocation(line: 70, column: 1, scope: !72)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 73, type: !20, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !11, line: 75, type: !6)
!103 = !DILocation(line: 75, column: 14, scope: !101)
!104 = !DILocation(line: 77, column: 10, scope: !101)
!105 = !DILocation(line: 78, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !11, line: 78, column: 8)
!107 = !DILocation(line: 78, column: 18, scope: !106)
!108 = !DILocation(line: 78, column: 8, scope: !101)
!109 = !DILocation(line: 81, column: 26, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !11, line: 79, column: 5)
!111 = !DILocation(line: 81, column: 16, scope: !110)
!112 = !DILocation(line: 81, column: 14, scope: !110)
!113 = !DILocation(line: 82, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !11, line: 82, column: 13)
!115 = !DILocation(line: 82, column: 18, scope: !114)
!116 = !DILocation(line: 82, column: 13, scope: !110)
!117 = !DILocation(line: 82, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !11, line: 82, column: 27)
!119 = !DILocation(line: 83, column: 10, scope: !110)
!120 = !DILocation(line: 83, column: 15, scope: !110)
!121 = !DILocation(line: 84, column: 5, scope: !110)
!122 = !DILocation(line: 86, column: 22, scope: !101)
!123 = !DILocation(line: 86, column: 21, scope: !101)
!124 = !DILocation(line: 86, column: 5, scope: !101)
!125 = !DILocation(line: 87, column: 10, scope: !101)
!126 = !DILocation(line: 87, column: 5, scope: !101)
!127 = !DILocation(line: 88, column: 1, scope: !101)
