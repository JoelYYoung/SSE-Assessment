; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21_bad() #0 !dbg !23 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store double* null, double** %data, align 8, !dbg !28
  store i32 1, i32* @badStatic, align 4, !dbg !29
  %0 = load double*, double** %data, align 8, !dbg !30
  %call = call double* @badSource(double* %0), !dbg !31
  store double* %call, double** %data, align 8, !dbg !32
  %1 = load double*, double** %data, align 8, !dbg !33
  %2 = load double, double* %1, align 8, !dbg !34
  call void @printDoubleLine(double %2), !dbg !35
  %3 = load double*, double** %data, align 8, !dbg !36
  %4 = bitcast double* %3 to i8*, !dbg !36
  call void @free(i8* %4) #5, !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal double* @badSource(double* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* @badStatic, align 4, !dbg !44
  %tobool = icmp ne i32 %0, 0, !dbg !44
  br i1 %tobool, label %if.then, label %if.end2, !dbg !46

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !47
  %1 = bitcast i8* %call to double*, !dbg !49
  store double* %1, double** %data.addr, align 8, !dbg !50
  %2 = load double*, double** %data.addr, align 8, !dbg !51
  %cmp = icmp eq double* %2, null, !dbg !53
  br i1 %cmp, label %if.then1, label %if.end, !dbg !54

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !55
  unreachable, !dbg !55

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data.addr, align 8, !dbg !57
  store double 1.700000e+300, double* %3, align 8, !dbg !58
  br label %if.end2, !dbg !59

if.end2:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data.addr, align 8, !dbg !60
  ret double* %4, !dbg !61
}

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #5, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #5, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store double* null, double** %data, align 8, !dbg !89
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !90
  %0 = load double*, double** %data, align 8, !dbg !91
  %call = call double* @goodG2B1Source(double* %0), !dbg !92
  store double* %call, double** %data, align 8, !dbg !93
  %1 = load double*, double** %data, align 8, !dbg !94
  %2 = load double, double* %1, align 8, !dbg !95
  call void @printDoubleLine(double %2), !dbg !96
  %3 = load double*, double** %data, align 8, !dbg !97
  %4 = bitcast double* %3 to i8*, !dbg !97
  call void @free(i8* %4) #5, !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal double* @goodG2B1Source(double* %data) #0 !dbg !100 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !103
  %tobool = icmp ne i32 %0, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end2, !dbg !108

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !109
  %1 = bitcast i8* %call to double*, !dbg !111
  store double* %1, double** %data.addr, align 8, !dbg !112
  %2 = load double*, double** %data.addr, align 8, !dbg !113
  %cmp = icmp eq double* %2, null, !dbg !115
  br i1 %cmp, label %if.then1, label %if.end, !dbg !116

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %if.else
  %3 = load double*, double** %data.addr, align 8, !dbg !119
  store double 1.700000e+300, double* %3, align 8, !dbg !120
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load double*, double** %data.addr, align 8, !dbg !121
  ret double* %4, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !124, metadata !DIExpression()), !dbg !125
  store double* null, double** %data, align 8, !dbg !126
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !127
  %0 = load double*, double** %data, align 8, !dbg !128
  %call = call double* @goodG2B2Source(double* %0), !dbg !129
  store double* %call, double** %data, align 8, !dbg !130
  %1 = load double*, double** %data, align 8, !dbg !131
  %2 = load double, double* %1, align 8, !dbg !132
  call void @printDoubleLine(double %2), !dbg !133
  %3 = load double*, double** %data, align 8, !dbg !134
  %4 = bitcast double* %3 to i8*, !dbg !134
  call void @free(i8* %4) #5, !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal double* @goodG2B2Source(double* %data) #0 !dbg !137 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !138, metadata !DIExpression()), !dbg !139
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !140
  %tobool = icmp ne i32 %0, 0, !dbg !140
  br i1 %tobool, label %if.then, label %if.end2, !dbg !142

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !143
  %1 = bitcast i8* %call to double*, !dbg !145
  store double* %1, double** %data.addr, align 8, !dbg !146
  %2 = load double*, double** %data.addr, align 8, !dbg !147
  %cmp = icmp eq double* %2, null, !dbg !149
  br i1 %cmp, label %if.then1, label %if.end, !dbg !150

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !151
  unreachable, !dbg !151

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data.addr, align 8, !dbg !153
  store double 1.700000e+300, double* %3, align 8, !dbg !154
  br label %if.end2, !dbg !155

if.end2:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data.addr, align 8, !dbg !156
  ret double* %4, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !13, line: 22, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !7, !9}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{!0, !11, !15}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !13, line: 54, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !13, line: 55, type: !14, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21_bad", scope: !13, file: !13, line: 37, type: !24, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !13, line: 39, type: !7)
!27 = !DILocation(line: 39, column: 14, scope: !23)
!28 = !DILocation(line: 41, column: 10, scope: !23)
!29 = !DILocation(line: 42, column: 15, scope: !23)
!30 = !DILocation(line: 43, column: 22, scope: !23)
!31 = !DILocation(line: 43, column: 12, scope: !23)
!32 = !DILocation(line: 43, column: 10, scope: !23)
!33 = !DILocation(line: 45, column: 22, scope: !23)
!34 = !DILocation(line: 45, column: 21, scope: !23)
!35 = !DILocation(line: 45, column: 5, scope: !23)
!36 = !DILocation(line: 46, column: 10, scope: !23)
!37 = !DILocation(line: 46, column: 5, scope: !23)
!38 = !DILocation(line: 47, column: 1, scope: !23)
!39 = distinct !DISubprogram(name: "badSource", scope: !13, file: !13, line: 24, type: !40, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DISubroutineType(types: !41)
!41 = !{!7, !7}
!42 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !13, line: 24, type: !7)
!43 = !DILocation(line: 24, column: 36, scope: !39)
!44 = !DILocation(line: 26, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !13, line: 26, column: 8)
!46 = !DILocation(line: 26, column: 8, scope: !39)
!47 = !DILocation(line: 30, column: 26, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !13, line: 27, column: 5)
!49 = !DILocation(line: 30, column: 16, scope: !48)
!50 = !DILocation(line: 30, column: 14, scope: !48)
!51 = !DILocation(line: 31, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !13, line: 31, column: 13)
!53 = !DILocation(line: 31, column: 18, scope: !52)
!54 = !DILocation(line: 31, column: 13, scope: !48)
!55 = !DILocation(line: 31, column: 28, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !13, line: 31, column: 27)
!57 = !DILocation(line: 32, column: 10, scope: !48)
!58 = !DILocation(line: 32, column: 15, scope: !48)
!59 = !DILocation(line: 33, column: 5, scope: !48)
!60 = !DILocation(line: 34, column: 12, scope: !39)
!61 = !DILocation(line: 34, column: 5, scope: !39)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_21_good", scope: !13, file: !13, line: 112, type: !24, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocation(line: 114, column: 5, scope: !62)
!64 = !DILocation(line: 115, column: 5, scope: !62)
!65 = !DILocation(line: 116, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 128, type: !67, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DISubroutineType(types: !68)
!68 = !{!14, !14, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !13, line: 128, type: !14)
!73 = !DILocation(line: 128, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !13, line: 128, type: !69)
!75 = !DILocation(line: 128, column: 27, scope: !66)
!76 = !DILocation(line: 131, column: 22, scope: !66)
!77 = !DILocation(line: 131, column: 12, scope: !66)
!78 = !DILocation(line: 131, column: 5, scope: !66)
!79 = !DILocation(line: 133, column: 5, scope: !66)
!80 = !DILocation(line: 134, column: 5, scope: !66)
!81 = !DILocation(line: 135, column: 5, scope: !66)
!82 = !DILocation(line: 138, column: 5, scope: !66)
!83 = !DILocation(line: 139, column: 5, scope: !66)
!84 = !DILocation(line: 140, column: 5, scope: !66)
!85 = !DILocation(line: 142, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 75, type: !24, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !13, line: 77, type: !7)
!88 = !DILocation(line: 77, column: 14, scope: !86)
!89 = !DILocation(line: 79, column: 10, scope: !86)
!90 = !DILocation(line: 80, column: 20, scope: !86)
!91 = !DILocation(line: 81, column: 27, scope: !86)
!92 = !DILocation(line: 81, column: 12, scope: !86)
!93 = !DILocation(line: 81, column: 10, scope: !86)
!94 = !DILocation(line: 83, column: 22, scope: !86)
!95 = !DILocation(line: 83, column: 21, scope: !86)
!96 = !DILocation(line: 83, column: 5, scope: !86)
!97 = !DILocation(line: 84, column: 10, scope: !86)
!98 = !DILocation(line: 84, column: 5, scope: !86)
!99 = !DILocation(line: 85, column: 1, scope: !86)
!100 = distinct !DISubprogram(name: "goodG2B1Source", scope: !13, file: !13, line: 58, type: !40, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", arg: 1, scope: !100, file: !13, line: 58, type: !7)
!102 = !DILocation(line: 58, column: 41, scope: !100)
!103 = !DILocation(line: 60, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !13, line: 60, column: 8)
!105 = !DILocation(line: 60, column: 8, scope: !100)
!106 = !DILocation(line: 63, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !13, line: 61, column: 5)
!108 = !DILocation(line: 64, column: 5, scope: !107)
!109 = !DILocation(line: 68, column: 26, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !13, line: 66, column: 5)
!111 = !DILocation(line: 68, column: 16, scope: !110)
!112 = !DILocation(line: 68, column: 14, scope: !110)
!113 = !DILocation(line: 69, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !13, line: 69, column: 13)
!115 = !DILocation(line: 69, column: 18, scope: !114)
!116 = !DILocation(line: 69, column: 13, scope: !110)
!117 = !DILocation(line: 69, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !13, line: 69, column: 27)
!119 = !DILocation(line: 70, column: 10, scope: !110)
!120 = !DILocation(line: 70, column: 15, scope: !110)
!121 = !DILocation(line: 72, column: 12, scope: !100)
!122 = !DILocation(line: 72, column: 5, scope: !100)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 100, type: !24, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocalVariable(name: "data", scope: !123, file: !13, line: 102, type: !7)
!125 = !DILocation(line: 102, column: 14, scope: !123)
!126 = !DILocation(line: 104, column: 10, scope: !123)
!127 = !DILocation(line: 105, column: 20, scope: !123)
!128 = !DILocation(line: 106, column: 27, scope: !123)
!129 = !DILocation(line: 106, column: 12, scope: !123)
!130 = !DILocation(line: 106, column: 10, scope: !123)
!131 = !DILocation(line: 108, column: 22, scope: !123)
!132 = !DILocation(line: 108, column: 21, scope: !123)
!133 = !DILocation(line: 108, column: 5, scope: !123)
!134 = !DILocation(line: 109, column: 10, scope: !123)
!135 = !DILocation(line: 109, column: 5, scope: !123)
!136 = !DILocation(line: 110, column: 1, scope: !123)
!137 = distinct !DISubprogram(name: "goodG2B2Source", scope: !13, file: !13, line: 88, type: !40, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!138 = !DILocalVariable(name: "data", arg: 1, scope: !137, file: !13, line: 88, type: !7)
!139 = !DILocation(line: 88, column: 41, scope: !137)
!140 = !DILocation(line: 90, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !13, line: 90, column: 8)
!142 = !DILocation(line: 90, column: 8, scope: !137)
!143 = !DILocation(line: 93, column: 26, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !13, line: 91, column: 5)
!145 = !DILocation(line: 93, column: 16, scope: !144)
!146 = !DILocation(line: 93, column: 14, scope: !144)
!147 = !DILocation(line: 94, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !13, line: 94, column: 13)
!149 = !DILocation(line: 94, column: 18, scope: !148)
!150 = !DILocation(line: 94, column: 13, scope: !144)
!151 = !DILocation(line: 94, column: 28, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !13, line: 94, column: 27)
!153 = !DILocation(line: 95, column: 10, scope: !144)
!154 = !DILocation(line: 95, column: 15, scope: !144)
!155 = !DILocation(line: 96, column: 5, scope: !144)
!156 = !DILocation(line: 97, column: 12, scope: !137)
!157 = !DILocation(line: 97, column: 5, scope: !137)
