; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store double* null, double** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

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
  br label %if.end7, !dbg !36

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !37
  %3 = bitcast i8* %call3 to double*, !dbg !39
  store double* %3, double** %data, align 8, !dbg !40
  %4 = load double*, double** %data, align 8, !dbg !41
  %cmp4 = icmp eq double* %4, null, !dbg !43
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !44

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !45
  unreachable, !dbg !45

if.end6:                                          ; preds = %if.else
  %5 = load double*, double** %data, align 8, !dbg !47
  store double 1.700000e+300, double* %5, align 8, !dbg !48
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  %6 = load double*, double** %data, align 8, !dbg !49
  %7 = load double, double* %6, align 8, !dbg !50
  call void @printDoubleLine(double %7), !dbg !51
  %8 = load double*, double** %data, align 8, !dbg !52
  %9 = bitcast double* %8 to i8*, !dbg !52
  call void @free(i8* %9) #5, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #5, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #5, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !80, metadata !DIExpression()), !dbg !81
  store double* null, double** %data, align 8, !dbg !82
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !83
  %tobool = icmp ne i32 %call, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !86
  %0 = bitcast i8* %call1 to double*, !dbg !88
  store double* %0, double** %data, align 8, !dbg !89
  %1 = load double*, double** %data, align 8, !dbg !90
  %cmp = icmp eq double* %1, null, !dbg !92
  br i1 %cmp, label %if.then2, label %if.end, !dbg !93

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %if.then
  %2 = load double*, double** %data, align 8, !dbg !96
  store double 1.700000e+300, double* %2, align 8, !dbg !97
  br label %if.end7, !dbg !98

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !99
  %3 = bitcast i8* %call3 to double*, !dbg !101
  store double* %3, double** %data, align 8, !dbg !102
  %4 = load double*, double** %data, align 8, !dbg !103
  %cmp4 = icmp eq double* %4, null, !dbg !105
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !106

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !107
  unreachable, !dbg !107

if.end6:                                          ; preds = %if.else
  %5 = load double*, double** %data, align 8, !dbg !109
  store double 1.700000e+300, double* %5, align 8, !dbg !110
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  %6 = load double*, double** %data, align 8, !dbg !111
  %7 = load double, double* %6, align 8, !dbg !112
  call void @printDoubleLine(double %7), !dbg !113
  %8 = load double*, double** %data, align 8, !dbg !114
  %9 = bitcast double* %8 to i8*, !dbg !114
  call void @free(i8* %9) #5, !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12.c", directory: "/root/SSE-Assessment")
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
!37 = !DILocation(line: 37, column: 26, scope: !38)
!38 = distinct !DILexicalBlock(scope: !22, file: !15, line: 35, column: 5)
!39 = !DILocation(line: 37, column: 16, scope: !38)
!40 = !DILocation(line: 37, column: 14, scope: !38)
!41 = !DILocation(line: 38, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 38, column: 13)
!43 = !DILocation(line: 38, column: 18, scope: !42)
!44 = !DILocation(line: 38, column: 13, scope: !38)
!45 = !DILocation(line: 38, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 38, column: 27)
!47 = !DILocation(line: 39, column: 10, scope: !38)
!48 = !DILocation(line: 39, column: 15, scope: !38)
!49 = !DILocation(line: 42, column: 22, scope: !14)
!50 = !DILocation(line: 42, column: 21, scope: !14)
!51 = !DILocation(line: 42, column: 5, scope: !14)
!52 = !DILocation(line: 43, column: 10, scope: !14)
!53 = !DILocation(line: 43, column: 5, scope: !14)
!54 = !DILocation(line: 44, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_12_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 78, column: 5, scope: !55)
!57 = !DILocation(line: 79, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !59, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 91, type: !61)
!66 = !DILocation(line: 91, column: 14, scope: !58)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 91, type: !62)
!68 = !DILocation(line: 91, column: 27, scope: !58)
!69 = !DILocation(line: 94, column: 22, scope: !58)
!70 = !DILocation(line: 94, column: 12, scope: !58)
!71 = !DILocation(line: 94, column: 5, scope: !58)
!72 = !DILocation(line: 96, column: 5, scope: !58)
!73 = !DILocation(line: 97, column: 5, scope: !58)
!74 = !DILocation(line: 98, column: 5, scope: !58)
!75 = !DILocation(line: 101, column: 5, scope: !58)
!76 = !DILocation(line: 102, column: 5, scope: !58)
!77 = !DILocation(line: 103, column: 5, scope: !58)
!78 = !DILocation(line: 105, column: 5, scope: !58)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 54, type: !4)
!81 = !DILocation(line: 54, column: 14, scope: !79)
!82 = !DILocation(line: 56, column: 10, scope: !79)
!83 = !DILocation(line: 57, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !79, file: !15, line: 57, column: 8)
!85 = !DILocation(line: 57, column: 8, scope: !79)
!86 = !DILocation(line: 60, column: 26, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !15, line: 58, column: 5)
!88 = !DILocation(line: 60, column: 16, scope: !87)
!89 = !DILocation(line: 60, column: 14, scope: !87)
!90 = !DILocation(line: 61, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 61, column: 13)
!92 = !DILocation(line: 61, column: 18, scope: !91)
!93 = !DILocation(line: 61, column: 13, scope: !87)
!94 = !DILocation(line: 61, column: 28, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 61, column: 27)
!96 = !DILocation(line: 62, column: 10, scope: !87)
!97 = !DILocation(line: 62, column: 15, scope: !87)
!98 = !DILocation(line: 63, column: 5, scope: !87)
!99 = !DILocation(line: 67, column: 26, scope: !100)
!100 = distinct !DILexicalBlock(scope: !84, file: !15, line: 65, column: 5)
!101 = !DILocation(line: 67, column: 16, scope: !100)
!102 = !DILocation(line: 67, column: 14, scope: !100)
!103 = !DILocation(line: 68, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 68, column: 13)
!105 = !DILocation(line: 68, column: 18, scope: !104)
!106 = !DILocation(line: 68, column: 13, scope: !100)
!107 = !DILocation(line: 68, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 68, column: 27)
!109 = !DILocation(line: 69, column: 10, scope: !100)
!110 = !DILocation(line: 69, column: 15, scope: !100)
!111 = !DILocation(line: 72, column: 22, scope: !79)
!112 = !DILocation(line: 72, column: 21, scope: !79)
!113 = !DILocation(line: 72, column: 5, scope: !79)
!114 = !DILocation(line: 73, column: 10, scope: !79)
!115 = !DILocation(line: 73, column: 5, scope: !79)
!116 = !DILocation(line: 74, column: 1, scope: !79)
