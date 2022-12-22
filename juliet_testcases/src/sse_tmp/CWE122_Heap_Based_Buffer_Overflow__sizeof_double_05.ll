; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05_bad() #0 !dbg !21 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store double* null, double** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !30
  %1 = bitcast i8* %call to double*, !dbg !32
  store double* %1, double** %data, align 8, !dbg !33
  %2 = load double*, double** %data, align 8, !dbg !34
  %cmp = icmp eq double* %2, null, !dbg !36
  br i1 %cmp, label %if.then1, label %if.end, !dbg !37

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data, align 8, !dbg !40
  store double 1.700000e+300, double* %3, align 8, !dbg !41
  br label %if.end2, !dbg !42

if.end2:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data, align 8, !dbg !43
  %5 = load double, double* %4, align 8, !dbg !44
  call void @printDoubleLine(double %5), !dbg !45
  %6 = load double*, double** %data, align 8, !dbg !46
  %7 = bitcast double* %6 to i8*, !dbg !46
  call void @free(i8* %7) #5, !dbg !47
  ret void, !dbg !48
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05_good() #0 !dbg !49 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store double* null, double** %data, align 8, !dbg !76
  %0 = load i32, i32* @staticFalse, align 4, !dbg !77
  %tobool = icmp ne i32 %0, 0, !dbg !77
  br i1 %tobool, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  br label %if.end2, !dbg !82

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !83
  %1 = bitcast i8* %call to double*, !dbg !85
  store double* %1, double** %data, align 8, !dbg !86
  %2 = load double*, double** %data, align 8, !dbg !87
  %cmp = icmp eq double* %2, null, !dbg !89
  br i1 %cmp, label %if.then1, label %if.end, !dbg !90

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %if.else
  %3 = load double*, double** %data, align 8, !dbg !93
  store double 1.700000e+300, double* %3, align 8, !dbg !94
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !105
  %tobool = icmp ne i32 %0, 0, !dbg !105
  br i1 %tobool, label %if.then, label %if.end2, !dbg !107

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !108
  %1 = bitcast i8* %call to double*, !dbg !110
  store double* %1, double** %data, align 8, !dbg !111
  %2 = load double*, double** %data, align 8, !dbg !112
  %cmp = icmp eq double* %2, null, !dbg !114
  br i1 %cmp, label %if.then1, label %if.end, !dbg !115

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data, align 8, !dbg !118
  store double 1.700000e+300, double* %3, align 8, !dbg !119
  br label %if.end2, !dbg !120

if.end2:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data, align 8, !dbg !121
  %5 = load double, double* %4, align 8, !dbg !122
  call void @printDoubleLine(double %5), !dbg !123
  %6 = load double*, double** %data, align 8, !dbg !124
  %7 = bitcast double* %6 to i8*, !dbg !124
  call void @free(i8* %7) #5, !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 23, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05_bad", scope: !13, file: !13, line: 28, type: !22, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 30, type: !6)
!25 = !DILocation(line: 30, column: 14, scope: !21)
!26 = !DILocation(line: 32, column: 10, scope: !21)
!27 = !DILocation(line: 33, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 33, column: 8)
!29 = !DILocation(line: 33, column: 8, scope: !21)
!30 = !DILocation(line: 37, column: 26, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !13, line: 34, column: 5)
!32 = !DILocation(line: 37, column: 16, scope: !31)
!33 = !DILocation(line: 37, column: 14, scope: !31)
!34 = !DILocation(line: 38, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 38, column: 13)
!36 = !DILocation(line: 38, column: 18, scope: !35)
!37 = !DILocation(line: 38, column: 13, scope: !31)
!38 = !DILocation(line: 38, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !13, line: 38, column: 27)
!40 = !DILocation(line: 39, column: 10, scope: !31)
!41 = !DILocation(line: 39, column: 15, scope: !31)
!42 = !DILocation(line: 40, column: 5, scope: !31)
!43 = !DILocation(line: 42, column: 22, scope: !21)
!44 = !DILocation(line: 42, column: 21, scope: !21)
!45 = !DILocation(line: 42, column: 5, scope: !21)
!46 = !DILocation(line: 43, column: 10, scope: !21)
!47 = !DILocation(line: 43, column: 5, scope: !21)
!48 = !DILocation(line: 44, column: 1, scope: !21)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_05_good", scope: !13, file: !13, line: 91, type: !22, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DILocation(line: 93, column: 5, scope: !49)
!51 = !DILocation(line: 94, column: 5, scope: !49)
!52 = !DILocation(line: 95, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 107, type: !54, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!14, !14, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !13, line: 107, type: !14)
!60 = !DILocation(line: 107, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !13, line: 107, type: !56)
!62 = !DILocation(line: 107, column: 27, scope: !53)
!63 = !DILocation(line: 110, column: 22, scope: !53)
!64 = !DILocation(line: 110, column: 12, scope: !53)
!65 = !DILocation(line: 110, column: 5, scope: !53)
!66 = !DILocation(line: 112, column: 5, scope: !53)
!67 = !DILocation(line: 113, column: 5, scope: !53)
!68 = !DILocation(line: 114, column: 5, scope: !53)
!69 = !DILocation(line: 117, column: 5, scope: !53)
!70 = !DILocation(line: 118, column: 5, scope: !53)
!71 = !DILocation(line: 119, column: 5, scope: !53)
!72 = !DILocation(line: 121, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 51, type: !22, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !13, line: 53, type: !6)
!75 = !DILocation(line: 53, column: 14, scope: !73)
!76 = !DILocation(line: 55, column: 10, scope: !73)
!77 = !DILocation(line: 56, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !13, line: 56, column: 8)
!79 = !DILocation(line: 56, column: 8, scope: !73)
!80 = !DILocation(line: 59, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !13, line: 57, column: 5)
!82 = !DILocation(line: 60, column: 5, scope: !81)
!83 = !DILocation(line: 64, column: 26, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !13, line: 62, column: 5)
!85 = !DILocation(line: 64, column: 16, scope: !84)
!86 = !DILocation(line: 64, column: 14, scope: !84)
!87 = !DILocation(line: 65, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !13, line: 65, column: 13)
!89 = !DILocation(line: 65, column: 18, scope: !88)
!90 = !DILocation(line: 65, column: 13, scope: !84)
!91 = !DILocation(line: 65, column: 28, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !13, line: 65, column: 27)
!93 = !DILocation(line: 66, column: 10, scope: !84)
!94 = !DILocation(line: 66, column: 15, scope: !84)
!95 = !DILocation(line: 69, column: 22, scope: !73)
!96 = !DILocation(line: 69, column: 21, scope: !73)
!97 = !DILocation(line: 69, column: 5, scope: !73)
!98 = !DILocation(line: 70, column: 10, scope: !73)
!99 = !DILocation(line: 70, column: 5, scope: !73)
!100 = !DILocation(line: 71, column: 1, scope: !73)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 74, type: !22, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !13, line: 76, type: !6)
!103 = !DILocation(line: 76, column: 14, scope: !101)
!104 = !DILocation(line: 78, column: 10, scope: !101)
!105 = !DILocation(line: 79, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !13, line: 79, column: 8)
!107 = !DILocation(line: 79, column: 8, scope: !101)
!108 = !DILocation(line: 82, column: 26, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !13, line: 80, column: 5)
!110 = !DILocation(line: 82, column: 16, scope: !109)
!111 = !DILocation(line: 82, column: 14, scope: !109)
!112 = !DILocation(line: 83, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !13, line: 83, column: 13)
!114 = !DILocation(line: 83, column: 18, scope: !113)
!115 = !DILocation(line: 83, column: 13, scope: !109)
!116 = !DILocation(line: 83, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !13, line: 83, column: 27)
!118 = !DILocation(line: 84, column: 10, scope: !109)
!119 = !DILocation(line: 84, column: 15, scope: !109)
!120 = !DILocation(line: 85, column: 5, scope: !109)
!121 = !DILocation(line: 87, column: 22, scope: !101)
!122 = !DILocation(line: 87, column: 21, scope: !101)
!123 = !DILocation(line: 87, column: 5, scope: !101)
!124 = !DILocation(line: 88, column: 10, scope: !101)
!125 = !DILocation(line: 88, column: 5, scope: !101)
!126 = !DILocation(line: 89, column: 1, scope: !101)
