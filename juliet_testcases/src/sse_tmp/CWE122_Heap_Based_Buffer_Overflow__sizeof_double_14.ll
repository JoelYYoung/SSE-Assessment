; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store double* null, double** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !25
  %1 = bitcast i8* %call to double*, !dbg !27
  store double* %1, double** %data, align 8, !dbg !28
  %2 = load double*, double** %data, align 8, !dbg !29
  %cmp1 = icmp eq double* %2, null, !dbg !31
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !32

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data, align 8, !dbg !35
  store double 1.700000e+300, double* %3, align 8, !dbg !36
  br label %if.end3, !dbg !37

if.end3:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data, align 8, !dbg !38
  %5 = load double, double* %4, align 8, !dbg !39
  call void @printDoubleLine(double %5), !dbg !40
  %6 = load double*, double** %data, align 8, !dbg !41
  %7 = bitcast double* %6 to i8*, !dbg !41
  call void @free(i8* %7) #5, !dbg !42
  ret void, !dbg !43
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store double* null, double** %data, align 8, !dbg !72
  %0 = load i32, i32* @globalFive, align 4, !dbg !73
  %cmp = icmp ne i32 %0, 5, !dbg !75
  br i1 %cmp, label %if.then, label %if.else, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  br label %if.end3, !dbg !79

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !80
  %1 = bitcast i8* %call to double*, !dbg !82
  store double* %1, double** %data, align 8, !dbg !83
  %2 = load double*, double** %data, align 8, !dbg !84
  %cmp1 = icmp eq double* %2, null, !dbg !86
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !87

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %if.else
  %3 = load double*, double** %data, align 8, !dbg !90
  store double 1.700000e+300, double* %3, align 8, !dbg !91
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %4 = load double*, double** %data, align 8, !dbg !92
  %5 = load double, double* %4, align 8, !dbg !93
  call void @printDoubleLine(double %5), !dbg !94
  %6 = load double*, double** %data, align 8, !dbg !95
  %7 = bitcast double* %6 to i8*, !dbg !95
  call void @free(i8* %7) #5, !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !98 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store double* null, double** %data, align 8, !dbg !101
  %0 = load i32, i32* @globalFive, align 4, !dbg !102
  %cmp = icmp eq i32 %0, 5, !dbg !104
  br i1 %cmp, label %if.then, label %if.end3, !dbg !105

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !106
  %1 = bitcast i8* %call to double*, !dbg !108
  store double* %1, double** %data, align 8, !dbg !109
  %2 = load double*, double** %data, align 8, !dbg !110
  %cmp1 = icmp eq double* %2, null, !dbg !112
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !113

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data, align 8, !dbg !116
  store double 1.700000e+300, double* %3, align 8, !dbg !117
  br label %if.end3, !dbg !118

if.end3:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data, align 8, !dbg !119
  %5 = load double, double* %4, align 8, !dbg !120
  call void @printDoubleLine(double %5), !dbg !121
  %6 = load double*, double** %data, align 8, !dbg !122
  %7 = bitcast double* %6 to i8*, !dbg !122
  call void @free(i8* %7) #5, !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 14, scope: !14)
!20 = !DILocation(line: 25, column: 10, scope: !14)
!21 = !DILocation(line: 26, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 26, column: 8)
!23 = !DILocation(line: 26, column: 18, scope: !22)
!24 = !DILocation(line: 26, column: 8, scope: !14)
!25 = !DILocation(line: 30, column: 26, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 27, column: 5)
!27 = !DILocation(line: 30, column: 16, scope: !26)
!28 = !DILocation(line: 30, column: 14, scope: !26)
!29 = !DILocation(line: 31, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 13)
!31 = !DILocation(line: 31, column: 18, scope: !30)
!32 = !DILocation(line: 31, column: 13, scope: !26)
!33 = !DILocation(line: 31, column: 28, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 31, column: 27)
!35 = !DILocation(line: 32, column: 10, scope: !26)
!36 = !DILocation(line: 32, column: 15, scope: !26)
!37 = !DILocation(line: 33, column: 5, scope: !26)
!38 = !DILocation(line: 35, column: 22, scope: !14)
!39 = !DILocation(line: 35, column: 21, scope: !14)
!40 = !DILocation(line: 35, column: 5, scope: !14)
!41 = !DILocation(line: 36, column: 10, scope: !14)
!42 = !DILocation(line: 36, column: 5, scope: !14)
!43 = !DILocation(line: 37, column: 1, scope: !14)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_14_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 86, column: 5, scope: !44)
!46 = !DILocation(line: 87, column: 5, scope: !44)
!47 = !DILocation(line: 88, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 100, type: !49, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !15, line: 100, type: !51)
!56 = !DILocation(line: 100, column: 14, scope: !48)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !15, line: 100, type: !52)
!58 = !DILocation(line: 100, column: 27, scope: !48)
!59 = !DILocation(line: 103, column: 22, scope: !48)
!60 = !DILocation(line: 103, column: 12, scope: !48)
!61 = !DILocation(line: 103, column: 5, scope: !48)
!62 = !DILocation(line: 105, column: 5, scope: !48)
!63 = !DILocation(line: 106, column: 5, scope: !48)
!64 = !DILocation(line: 107, column: 5, scope: !48)
!65 = !DILocation(line: 110, column: 5, scope: !48)
!66 = !DILocation(line: 111, column: 5, scope: !48)
!67 = !DILocation(line: 112, column: 5, scope: !48)
!68 = !DILocation(line: 114, column: 5, scope: !48)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 44, type: !16, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 46, type: !4)
!71 = !DILocation(line: 46, column: 14, scope: !69)
!72 = !DILocation(line: 48, column: 10, scope: !69)
!73 = !DILocation(line: 49, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !15, line: 49, column: 8)
!75 = !DILocation(line: 49, column: 18, scope: !74)
!76 = !DILocation(line: 49, column: 8, scope: !69)
!77 = !DILocation(line: 52, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 50, column: 5)
!79 = !DILocation(line: 53, column: 5, scope: !78)
!80 = !DILocation(line: 57, column: 26, scope: !81)
!81 = distinct !DILexicalBlock(scope: !74, file: !15, line: 55, column: 5)
!82 = !DILocation(line: 57, column: 16, scope: !81)
!83 = !DILocation(line: 57, column: 14, scope: !81)
!84 = !DILocation(line: 58, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 58, column: 13)
!86 = !DILocation(line: 58, column: 18, scope: !85)
!87 = !DILocation(line: 58, column: 13, scope: !81)
!88 = !DILocation(line: 58, column: 28, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 58, column: 27)
!90 = !DILocation(line: 59, column: 10, scope: !81)
!91 = !DILocation(line: 59, column: 15, scope: !81)
!92 = !DILocation(line: 62, column: 22, scope: !69)
!93 = !DILocation(line: 62, column: 21, scope: !69)
!94 = !DILocation(line: 62, column: 5, scope: !69)
!95 = !DILocation(line: 63, column: 10, scope: !69)
!96 = !DILocation(line: 63, column: 5, scope: !69)
!97 = !DILocation(line: 64, column: 1, scope: !69)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 67, type: !16, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !15, line: 69, type: !4)
!100 = !DILocation(line: 69, column: 14, scope: !98)
!101 = !DILocation(line: 71, column: 10, scope: !98)
!102 = !DILocation(line: 72, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !15, line: 72, column: 8)
!104 = !DILocation(line: 72, column: 18, scope: !103)
!105 = !DILocation(line: 72, column: 8, scope: !98)
!106 = !DILocation(line: 75, column: 26, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 73, column: 5)
!108 = !DILocation(line: 75, column: 16, scope: !107)
!109 = !DILocation(line: 75, column: 14, scope: !107)
!110 = !DILocation(line: 76, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !15, line: 76, column: 13)
!112 = !DILocation(line: 76, column: 18, scope: !111)
!113 = !DILocation(line: 76, column: 13, scope: !107)
!114 = !DILocation(line: 76, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 76, column: 27)
!116 = !DILocation(line: 77, column: 10, scope: !107)
!117 = !DILocation(line: 77, column: 15, scope: !107)
!118 = !DILocation(line: 78, column: 5, scope: !107)
!119 = !DILocation(line: 80, column: 22, scope: !98)
!120 = !DILocation(line: 80, column: 21, scope: !98)
!121 = !DILocation(line: 80, column: 5, scope: !98)
!122 = !DILocation(line: 81, column: 10, scope: !98)
!123 = !DILocation(line: 81, column: 5, scope: !98)
!124 = !DILocation(line: 82, column: 1, scope: !98)
