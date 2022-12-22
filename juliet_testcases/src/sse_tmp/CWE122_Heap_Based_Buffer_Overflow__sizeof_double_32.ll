; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  %dataPtr1 = alloca double**, align 8
  %dataPtr2 = alloca double**, align 8
  %data1 = alloca double*, align 8
  %data2 = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata double*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store double** %data, double*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata double*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store double** %data, double*** %dataPtr2, align 8, !dbg !24
  store double* null, double** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata double** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load double**, double*** %dataPtr1, align 8, !dbg !29
  %1 = load double*, double** %0, align 8, !dbg !30
  store double* %1, double** %data1, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !31
  %2 = bitcast i8* %call to double*, !dbg !32
  store double* %2, double** %data1, align 8, !dbg !33
  %3 = load double*, double** %data1, align 8, !dbg !34
  %cmp = icmp eq double* %3, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  %4 = load double*, double** %data1, align 8, !dbg !40
  store double 1.700000e+300, double* %4, align 8, !dbg !41
  %5 = load double*, double** %data1, align 8, !dbg !42
  %6 = load double**, double*** %dataPtr1, align 8, !dbg !43
  store double* %5, double** %6, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata double** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %7 = load double**, double*** %dataPtr2, align 8, !dbg !48
  %8 = load double*, double** %7, align 8, !dbg !49
  store double* %8, double** %data2, align 8, !dbg !47
  %9 = load double*, double** %data2, align 8, !dbg !50
  %10 = load double, double* %9, align 8, !dbg !51
  call void @printDoubleLine(double %10), !dbg !52
  %11 = load double*, double** %data2, align 8, !dbg !53
  %12 = bitcast double* %11 to i8*, !dbg !53
  call void @free(i8* %12) #5, !dbg !54
  ret void, !dbg !55
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca double*, align 8
  %dataPtr1 = alloca double**, align 8
  %dataPtr2 = alloca double**, align 8
  %data1 = alloca double*, align 8
  %data2 = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata double*** %dataPtr1, metadata !83, metadata !DIExpression()), !dbg !84
  store double** %data, double*** %dataPtr1, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata double*** %dataPtr2, metadata !85, metadata !DIExpression()), !dbg !86
  store double** %data, double*** %dataPtr2, align 8, !dbg !86
  store double* null, double** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata double** %data1, metadata !88, metadata !DIExpression()), !dbg !90
  %0 = load double**, double*** %dataPtr1, align 8, !dbg !91
  %1 = load double*, double** %0, align 8, !dbg !92
  store double* %1, double** %data1, align 8, !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !93
  %2 = bitcast i8* %call to double*, !dbg !94
  store double* %2, double** %data1, align 8, !dbg !95
  %3 = load double*, double** %data1, align 8, !dbg !96
  %cmp = icmp eq double* %3, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  %4 = load double*, double** %data1, align 8, !dbg !102
  store double 1.700000e+300, double* %4, align 8, !dbg !103
  %5 = load double*, double** %data1, align 8, !dbg !104
  %6 = load double**, double*** %dataPtr1, align 8, !dbg !105
  store double* %5, double** %6, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata double** %data2, metadata !107, metadata !DIExpression()), !dbg !109
  %7 = load double**, double*** %dataPtr2, align 8, !dbg !110
  %8 = load double*, double** %7, align 8, !dbg !111
  store double* %8, double** %data2, align 8, !dbg !109
  %9 = load double*, double** %data2, align 8, !dbg !112
  %10 = load double, double* %9, align 8, !dbg !113
  call void @printDoubleLine(double %10), !dbg !114
  %11 = load double*, double** %data2, align 8, !dbg !115
  %12 = bitcast double* %11 to i8*, !dbg !115
  call void @free(i8* %12) #5, !dbg !116
  ret void, !dbg !117
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 14, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 24, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 24, column: 15, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 25, type: !21)
!24 = !DILocation(line: 25, column: 15, scope: !14)
!25 = !DILocation(line: 27, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !15, line: 29, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!28 = !DILocation(line: 29, column: 18, scope: !27)
!29 = !DILocation(line: 29, column: 26, scope: !27)
!30 = !DILocation(line: 29, column: 25, scope: !27)
!31 = !DILocation(line: 32, column: 26, scope: !27)
!32 = !DILocation(line: 32, column: 16, scope: !27)
!33 = !DILocation(line: 32, column: 14, scope: !27)
!34 = !DILocation(line: 33, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !27, file: !15, line: 33, column: 13)
!36 = !DILocation(line: 33, column: 18, scope: !35)
!37 = !DILocation(line: 33, column: 13, scope: !27)
!38 = !DILocation(line: 33, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 33, column: 27)
!40 = !DILocation(line: 34, column: 10, scope: !27)
!41 = !DILocation(line: 34, column: 15, scope: !27)
!42 = !DILocation(line: 35, column: 21, scope: !27)
!43 = !DILocation(line: 35, column: 10, scope: !27)
!44 = !DILocation(line: 35, column: 19, scope: !27)
!45 = !DILocalVariable(name: "data", scope: !46, file: !15, line: 38, type: !4)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 18, scope: !46)
!48 = !DILocation(line: 38, column: 26, scope: !46)
!49 = !DILocation(line: 38, column: 25, scope: !46)
!50 = !DILocation(line: 40, column: 26, scope: !46)
!51 = !DILocation(line: 40, column: 25, scope: !46)
!52 = !DILocation(line: 40, column: 9, scope: !46)
!53 = !DILocation(line: 41, column: 14, scope: !46)
!54 = !DILocation(line: 41, column: 9, scope: !46)
!55 = !DILocation(line: 43, column: 1, scope: !14)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_32_good", scope: !15, file: !15, line: 73, type: !16, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 75, column: 5, scope: !56)
!58 = !DILocation(line: 76, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 87, type: !60, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 87, type: !62)
!67 = !DILocation(line: 87, column: 14, scope: !59)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 87, type: !63)
!69 = !DILocation(line: 87, column: 27, scope: !59)
!70 = !DILocation(line: 90, column: 22, scope: !59)
!71 = !DILocation(line: 90, column: 12, scope: !59)
!72 = !DILocation(line: 90, column: 5, scope: !59)
!73 = !DILocation(line: 92, column: 5, scope: !59)
!74 = !DILocation(line: 93, column: 5, scope: !59)
!75 = !DILocation(line: 94, column: 5, scope: !59)
!76 = !DILocation(line: 97, column: 5, scope: !59)
!77 = !DILocation(line: 98, column: 5, scope: !59)
!78 = !DILocation(line: 99, column: 5, scope: !59)
!79 = !DILocation(line: 101, column: 5, scope: !59)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 50, type: !16, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !15, line: 52, type: !4)
!82 = !DILocation(line: 52, column: 14, scope: !80)
!83 = !DILocalVariable(name: "dataPtr1", scope: !80, file: !15, line: 53, type: !21)
!84 = !DILocation(line: 53, column: 15, scope: !80)
!85 = !DILocalVariable(name: "dataPtr2", scope: !80, file: !15, line: 54, type: !21)
!86 = !DILocation(line: 54, column: 15, scope: !80)
!87 = !DILocation(line: 56, column: 10, scope: !80)
!88 = !DILocalVariable(name: "data", scope: !89, file: !15, line: 58, type: !4)
!89 = distinct !DILexicalBlock(scope: !80, file: !15, line: 57, column: 5)
!90 = !DILocation(line: 58, column: 18, scope: !89)
!91 = !DILocation(line: 58, column: 26, scope: !89)
!92 = !DILocation(line: 58, column: 25, scope: !89)
!93 = !DILocation(line: 60, column: 26, scope: !89)
!94 = !DILocation(line: 60, column: 16, scope: !89)
!95 = !DILocation(line: 60, column: 14, scope: !89)
!96 = !DILocation(line: 61, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !89, file: !15, line: 61, column: 13)
!98 = !DILocation(line: 61, column: 18, scope: !97)
!99 = !DILocation(line: 61, column: 13, scope: !89)
!100 = !DILocation(line: 61, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 61, column: 27)
!102 = !DILocation(line: 62, column: 10, scope: !89)
!103 = !DILocation(line: 62, column: 15, scope: !89)
!104 = !DILocation(line: 63, column: 21, scope: !89)
!105 = !DILocation(line: 63, column: 10, scope: !89)
!106 = !DILocation(line: 63, column: 19, scope: !89)
!107 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 66, type: !4)
!108 = distinct !DILexicalBlock(scope: !80, file: !15, line: 65, column: 5)
!109 = !DILocation(line: 66, column: 18, scope: !108)
!110 = !DILocation(line: 66, column: 26, scope: !108)
!111 = !DILocation(line: 66, column: 25, scope: !108)
!112 = !DILocation(line: 68, column: 26, scope: !108)
!113 = !DILocation(line: 68, column: 25, scope: !108)
!114 = !DILocation(line: 68, column: 9, scope: !108)
!115 = !DILocation(line: 69, column: 14, scope: !108)
!116 = !DILocation(line: 69, column: 9, scope: !108)
!117 = !DILocation(line: 71, column: 1, scope: !80)
