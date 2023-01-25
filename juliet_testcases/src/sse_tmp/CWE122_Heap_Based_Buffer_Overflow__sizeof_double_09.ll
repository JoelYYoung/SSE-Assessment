; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store double* null, double** %data, align 8, !dbg !20
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end2, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !24
  %1 = bitcast i8* %call to double*, !dbg !26
  store double* %1, double** %data, align 8, !dbg !27
  %2 = load double*, double** %data, align 8, !dbg !28
  %cmp = icmp eq double* %2, null, !dbg !30
  br i1 %cmp, label %if.then1, label %if.end, !dbg !31

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data, align 8, !dbg !34
  store double 1.700000e+300, double* %3, align 8, !dbg !35
  br label %if.end2, !dbg !36

if.end2:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data, align 8, !dbg !37
  %5 = load double, double* %4, align 8, !dbg !38
  call void @printDoubleLine(double %5), !dbg !39
  %6 = load double*, double** %data, align 8, !dbg !40
  %7 = bitcast double* %6 to i8*, !dbg !40
  call void @free(i8* %7) #5, !dbg !41
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09_good() #0 !dbg !43 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !69, metadata !DIExpression()), !dbg !70
  store double* null, double** %data, align 8, !dbg !71
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !72
  %tobool = icmp ne i32 %0, 0, !dbg !72
  br i1 %tobool, label %if.then, label %if.else, !dbg !74

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  br label %if.end2, !dbg !77

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !78
  %1 = bitcast i8* %call to double*, !dbg !80
  store double* %1, double** %data, align 8, !dbg !81
  %2 = load double*, double** %data, align 8, !dbg !82
  %cmp = icmp eq double* %2, null, !dbg !84
  br i1 %cmp, label %if.then1, label %if.end, !dbg !85

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %if.else
  %3 = load double*, double** %data, align 8, !dbg !88
  store double 1.700000e+300, double* %3, align 8, !dbg !89
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load double*, double** %data, align 8, !dbg !90
  %5 = load double, double* %4, align 8, !dbg !91
  call void @printDoubleLine(double %5), !dbg !92
  %6 = load double*, double** %data, align 8, !dbg !93
  %7 = bitcast double* %6 to i8*, !dbg !93
  call void @free(i8* %7) #5, !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store double* null, double** %data, align 8, !dbg !99
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !100
  %tobool = icmp ne i32 %0, 0, !dbg !100
  br i1 %tobool, label %if.then, label %if.end2, !dbg !102

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !103
  %1 = bitcast i8* %call to double*, !dbg !105
  store double* %1, double** %data, align 8, !dbg !106
  %2 = load double*, double** %data, align 8, !dbg !107
  %cmp = icmp eq double* %2, null, !dbg !109
  br i1 %cmp, label %if.then1, label %if.end, !dbg !110

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data, align 8, !dbg !113
  store double 1.700000e+300, double* %3, align 8, !dbg !114
  br label %if.end2, !dbg !115

if.end2:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data, align 8, !dbg !116
  %5 = load double, double* %4, align 8, !dbg !117
  call void @printDoubleLine(double %5), !dbg !118
  %6 = load double*, double** %data, align 8, !dbg !119
  %7 = bitcast double* %6 to i8*, !dbg !119
  call void @free(i8* %7) #5, !dbg !120
  ret void, !dbg !121
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 14, scope: !14)
!20 = !DILocation(line: 25, column: 10, scope: !14)
!21 = !DILocation(line: 26, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 26, column: 8)
!23 = !DILocation(line: 26, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 26, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 27, column: 5)
!26 = !DILocation(line: 30, column: 16, scope: !25)
!27 = !DILocation(line: 30, column: 14, scope: !25)
!28 = !DILocation(line: 31, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 13)
!30 = !DILocation(line: 31, column: 18, scope: !29)
!31 = !DILocation(line: 31, column: 13, scope: !25)
!32 = !DILocation(line: 31, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 31, column: 27)
!34 = !DILocation(line: 32, column: 10, scope: !25)
!35 = !DILocation(line: 32, column: 15, scope: !25)
!36 = !DILocation(line: 33, column: 5, scope: !25)
!37 = !DILocation(line: 35, column: 22, scope: !14)
!38 = !DILocation(line: 35, column: 21, scope: !14)
!39 = !DILocation(line: 35, column: 5, scope: !14)
!40 = !DILocation(line: 36, column: 10, scope: !14)
!41 = !DILocation(line: 36, column: 5, scope: !14)
!42 = !DILocation(line: 37, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_09_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 86, column: 5, scope: !43)
!45 = !DILocation(line: 87, column: 5, scope: !43)
!46 = !DILocation(line: 88, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 100, type: !48, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !15, line: 100, type: !50)
!55 = !DILocation(line: 100, column: 14, scope: !47)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !15, line: 100, type: !51)
!57 = !DILocation(line: 100, column: 27, scope: !47)
!58 = !DILocation(line: 103, column: 22, scope: !47)
!59 = !DILocation(line: 103, column: 12, scope: !47)
!60 = !DILocation(line: 103, column: 5, scope: !47)
!61 = !DILocation(line: 105, column: 5, scope: !47)
!62 = !DILocation(line: 106, column: 5, scope: !47)
!63 = !DILocation(line: 107, column: 5, scope: !47)
!64 = !DILocation(line: 110, column: 5, scope: !47)
!65 = !DILocation(line: 111, column: 5, scope: !47)
!66 = !DILocation(line: 112, column: 5, scope: !47)
!67 = !DILocation(line: 114, column: 5, scope: !47)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 44, type: !16, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !15, line: 46, type: !4)
!70 = !DILocation(line: 46, column: 14, scope: !68)
!71 = !DILocation(line: 48, column: 10, scope: !68)
!72 = !DILocation(line: 49, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !15, line: 49, column: 8)
!74 = !DILocation(line: 49, column: 8, scope: !68)
!75 = !DILocation(line: 52, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !15, line: 50, column: 5)
!77 = !DILocation(line: 53, column: 5, scope: !76)
!78 = !DILocation(line: 57, column: 26, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !15, line: 55, column: 5)
!80 = !DILocation(line: 57, column: 16, scope: !79)
!81 = !DILocation(line: 57, column: 14, scope: !79)
!82 = !DILocation(line: 58, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 58, column: 13)
!84 = !DILocation(line: 58, column: 18, scope: !83)
!85 = !DILocation(line: 58, column: 13, scope: !79)
!86 = !DILocation(line: 58, column: 28, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 58, column: 27)
!88 = !DILocation(line: 59, column: 10, scope: !79)
!89 = !DILocation(line: 59, column: 15, scope: !79)
!90 = !DILocation(line: 62, column: 22, scope: !68)
!91 = !DILocation(line: 62, column: 21, scope: !68)
!92 = !DILocation(line: 62, column: 5, scope: !68)
!93 = !DILocation(line: 63, column: 10, scope: !68)
!94 = !DILocation(line: 63, column: 5, scope: !68)
!95 = !DILocation(line: 64, column: 1, scope: !68)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 67, type: !16, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 69, type: !4)
!98 = !DILocation(line: 69, column: 14, scope: !96)
!99 = !DILocation(line: 71, column: 10, scope: !96)
!100 = !DILocation(line: 72, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !15, line: 72, column: 8)
!102 = !DILocation(line: 72, column: 8, scope: !96)
!103 = !DILocation(line: 75, column: 26, scope: !104)
!104 = distinct !DILexicalBlock(scope: !101, file: !15, line: 73, column: 5)
!105 = !DILocation(line: 75, column: 16, scope: !104)
!106 = !DILocation(line: 75, column: 14, scope: !104)
!107 = !DILocation(line: 76, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 76, column: 13)
!109 = !DILocation(line: 76, column: 18, scope: !108)
!110 = !DILocation(line: 76, column: 13, scope: !104)
!111 = !DILocation(line: 76, column: 28, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 76, column: 27)
!113 = !DILocation(line: 77, column: 10, scope: !104)
!114 = !DILocation(line: 77, column: 15, scope: !104)
!115 = !DILocation(line: 78, column: 5, scope: !104)
!116 = !DILocation(line: 80, column: 22, scope: !96)
!117 = !DILocation(line: 80, column: 21, scope: !96)
!118 = !DILocation(line: 80, column: 5, scope: !96)
!119 = !DILocation(line: 81, column: 10, scope: !96)
!120 = !DILocation(line: 81, column: 5, scope: !96)
!121 = !DILocation(line: 82, column: 1, scope: !96)
