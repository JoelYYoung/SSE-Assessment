; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store double* null, double** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !24
  %0 = bitcast i8* %call1 to double*, !dbg !26
  store double* %0, double** %data, align 8, !dbg !27
  %1 = load double*, double** %data, align 8, !dbg !28
  %cmp = icmp eq double* %1, null, !dbg !30
  br i1 %cmp, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  %2 = load double*, double** %data, align 8, !dbg !34
  store double 1.700000e+300, double* %2, align 8, !dbg !35
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.end, %entry
  %3 = load double*, double** %data, align 8, !dbg !37
  %4 = load double, double* %3, align 8, !dbg !38
  call void @printDoubleLine(double %4), !dbg !39
  %5 = load double*, double** %data, align 8, !dbg !40
  %6 = bitcast double* %5 to i8*, !dbg !40
  call void @free(i8* %6) #5, !dbg !41
  ret void, !dbg !42
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #5, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #5, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !68 {
entry:
  ret i32 1, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store double* null, double** %data, align 8, !dbg !75
  %call = call i32 @staticReturnsFalse(), !dbg !76
  %tobool = icmp ne i32 %call, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  br label %if.end3, !dbg !81

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !82
  %0 = bitcast i8* %call1 to double*, !dbg !84
  store double* %0, double** %data, align 8, !dbg !85
  %1 = load double*, double** %data, align 8, !dbg !86
  %cmp = icmp eq double* %1, null, !dbg !88
  br i1 %cmp, label %if.then2, label %if.end, !dbg !89

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %if.else
  %2 = load double*, double** %data, align 8, !dbg !92
  store double 1.700000e+300, double* %2, align 8, !dbg !93
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  %3 = load double*, double** %data, align 8, !dbg !94
  %4 = load double, double* %3, align 8, !dbg !95
  call void @printDoubleLine(double %4), !dbg !96
  %5 = load double*, double** %data, align 8, !dbg !97
  %6 = bitcast double* %5 to i8*, !dbg !97
  call void @free(i8* %6) #5, !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !100 {
entry:
  ret i32 0, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store double* null, double** %data, align 8, !dbg !105
  %call = call i32 @staticReturnsTrue(), !dbg !106
  %tobool = icmp ne i32 %call, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.end3, !dbg !108

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !109
  %0 = bitcast i8* %call1 to double*, !dbg !111
  store double* %0, double** %data, align 8, !dbg !112
  %1 = load double*, double** %data, align 8, !dbg !113
  %cmp = icmp eq double* %1, null, !dbg !115
  br i1 %cmp, label %if.then2, label %if.end, !dbg !116

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %if.then
  %2 = load double*, double** %data, align 8, !dbg !119
  store double 1.700000e+300, double* %2, align 8, !dbg !120
  br label %if.end3, !dbg !121

if.end3:                                          ; preds = %if.end, %entry
  %3 = load double*, double** %data, align 8, !dbg !122
  %4 = load double, double* %3, align 8, !dbg !123
  call void @printDoubleLine(double %4), !dbg !124
  %5 = load double*, double** %data, align 8, !dbg !125
  %6 = bitcast double* %5 to i8*, !dbg !125
  call void @free(i8* %6) #5, !dbg !126
  ret void, !dbg !127
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !4)
!19 = !DILocation(line: 37, column: 14, scope: !14)
!20 = !DILocation(line: 39, column: 10, scope: !14)
!21 = !DILocation(line: 40, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 8)
!23 = !DILocation(line: 40, column: 8, scope: !14)
!24 = !DILocation(line: 44, column: 26, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 41, column: 5)
!26 = !DILocation(line: 44, column: 16, scope: !25)
!27 = !DILocation(line: 44, column: 14, scope: !25)
!28 = !DILocation(line: 45, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 45, column: 13)
!30 = !DILocation(line: 45, column: 18, scope: !29)
!31 = !DILocation(line: 45, column: 13, scope: !25)
!32 = !DILocation(line: 45, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 45, column: 27)
!34 = !DILocation(line: 46, column: 10, scope: !25)
!35 = !DILocation(line: 46, column: 15, scope: !25)
!36 = !DILocation(line: 47, column: 5, scope: !25)
!37 = !DILocation(line: 49, column: 22, scope: !14)
!38 = !DILocation(line: 49, column: 21, scope: !14)
!39 = !DILocation(line: 49, column: 5, scope: !14)
!40 = !DILocation(line: 50, column: 10, scope: !14)
!41 = !DILocation(line: 50, column: 5, scope: !14)
!42 = !DILocation(line: 51, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_08_good", scope: !15, file: !15, line: 98, type: !16, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 100, column: 5, scope: !43)
!45 = !DILocation(line: 101, column: 5, scope: !43)
!46 = !DILocation(line: 102, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 114, type: !48, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !15, line: 114, type: !50)
!55 = !DILocation(line: 114, column: 14, scope: !47)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !15, line: 114, type: !51)
!57 = !DILocation(line: 114, column: 27, scope: !47)
!58 = !DILocation(line: 117, column: 22, scope: !47)
!59 = !DILocation(line: 117, column: 12, scope: !47)
!60 = !DILocation(line: 117, column: 5, scope: !47)
!61 = !DILocation(line: 119, column: 5, scope: !47)
!62 = !DILocation(line: 120, column: 5, scope: !47)
!63 = !DILocation(line: 121, column: 5, scope: !47)
!64 = !DILocation(line: 124, column: 5, scope: !47)
!65 = !DILocation(line: 125, column: 5, scope: !47)
!66 = !DILocation(line: 126, column: 5, scope: !47)
!67 = !DILocation(line: 128, column: 5, scope: !47)
!68 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 23, type: !69, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!50}
!71 = !DILocation(line: 25, column: 5, scope: !68)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !15, line: 60, type: !4)
!74 = !DILocation(line: 60, column: 14, scope: !72)
!75 = !DILocation(line: 62, column: 10, scope: !72)
!76 = !DILocation(line: 63, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !15, line: 63, column: 8)
!78 = !DILocation(line: 63, column: 8, scope: !72)
!79 = !DILocation(line: 66, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !15, line: 64, column: 5)
!81 = !DILocation(line: 67, column: 5, scope: !80)
!82 = !DILocation(line: 71, column: 26, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !15, line: 69, column: 5)
!84 = !DILocation(line: 71, column: 16, scope: !83)
!85 = !DILocation(line: 71, column: 14, scope: !83)
!86 = !DILocation(line: 72, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 72, column: 13)
!88 = !DILocation(line: 72, column: 18, scope: !87)
!89 = !DILocation(line: 72, column: 13, scope: !83)
!90 = !DILocation(line: 72, column: 28, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 72, column: 27)
!92 = !DILocation(line: 73, column: 10, scope: !83)
!93 = !DILocation(line: 73, column: 15, scope: !83)
!94 = !DILocation(line: 76, column: 22, scope: !72)
!95 = !DILocation(line: 76, column: 21, scope: !72)
!96 = !DILocation(line: 76, column: 5, scope: !72)
!97 = !DILocation(line: 77, column: 10, scope: !72)
!98 = !DILocation(line: 77, column: 5, scope: !72)
!99 = !DILocation(line: 78, column: 1, scope: !72)
!100 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 28, type: !69, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocation(line: 30, column: 5, scope: !100)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !15, line: 83, type: !4)
!104 = !DILocation(line: 83, column: 14, scope: !102)
!105 = !DILocation(line: 85, column: 10, scope: !102)
!106 = !DILocation(line: 86, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !15, line: 86, column: 8)
!108 = !DILocation(line: 86, column: 8, scope: !102)
!109 = !DILocation(line: 89, column: 26, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !15, line: 87, column: 5)
!111 = !DILocation(line: 89, column: 16, scope: !110)
!112 = !DILocation(line: 89, column: 14, scope: !110)
!113 = !DILocation(line: 90, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 90, column: 13)
!115 = !DILocation(line: 90, column: 18, scope: !114)
!116 = !DILocation(line: 90, column: 13, scope: !110)
!117 = !DILocation(line: 90, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 90, column: 27)
!119 = !DILocation(line: 91, column: 10, scope: !110)
!120 = !DILocation(line: 91, column: 15, scope: !110)
!121 = !DILocation(line: 92, column: 5, scope: !110)
!122 = !DILocation(line: 94, column: 22, scope: !102)
!123 = !DILocation(line: 94, column: 21, scope: !102)
!124 = !DILocation(line: 94, column: 5, scope: !102)
!125 = !DILocation(line: 95, column: 10, scope: !102)
!126 = !DILocation(line: 95, column: 5, scope: !102)
!127 = !DILocation(line: 96, column: 1, scope: !102)
