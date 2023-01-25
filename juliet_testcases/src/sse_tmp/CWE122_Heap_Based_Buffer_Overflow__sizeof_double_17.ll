; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata double** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store double* null, double** %data, align 8, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !31
  %1 = bitcast i8* %call to double*, !dbg !33
  store double* %1, double** %data, align 8, !dbg !34
  %2 = load double*, double** %data, align 8, !dbg !35
  %cmp1 = icmp eq double* %2, null, !dbg !37
  br i1 %cmp1, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %for.body
  %3 = load double*, double** %data, align 8, !dbg !41
  store double 1.700000e+300, double* %3, align 8, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %4, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  %5 = load double*, double** %data, align 8, !dbg !49
  %6 = load double, double* %5, align 8, !dbg !50
  call void @printDoubleLine(double %6), !dbg !51
  %7 = load double*, double** %data, align 8, !dbg !52
  %8 = bitcast double* %7 to i8*, !dbg !52
  call void @free(i8* %8) #5, !dbg !53
  ret void, !dbg !54
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17_good() #0 !dbg !55 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %h = alloca i32, align 4
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata double** %data, metadata !81, metadata !DIExpression()), !dbg !82
  store double* null, double** %data, align 8, !dbg !83
  store i32 0, i32* %h, align 4, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !87
  %cmp = icmp slt i32 %0, 1, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !91
  %1 = bitcast i8* %call to double*, !dbg !93
  store double* %1, double** %data, align 8, !dbg !94
  %2 = load double*, double** %data, align 8, !dbg !95
  %cmp1 = icmp eq double* %2, null, !dbg !97
  br i1 %cmp1, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %for.body
  %3 = load double*, double** %data, align 8, !dbg !101
  store double 1.700000e+300, double* %3, align 8, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %h, align 4, !dbg !104
  %inc = add nsw i32 %4, 1, !dbg !104
  store i32 %inc, i32* %h, align 4, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %5 = load double*, double** %data, align 8, !dbg !108
  %6 = load double, double* %5, align 8, !dbg !109
  call void @printDoubleLine(double %6), !dbg !110
  %7 = load double*, double** %data, align 8, !dbg !111
  %8 = bitcast double* %7 to i8*, !dbg !111
  call void @free(i8* %8) #5, !dbg !112
  ret void, !dbg !113
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 23, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 23, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 24, type: !4)
!22 = !DILocation(line: 24, column: 14, scope: !14)
!23 = !DILocation(line: 26, column: 10, scope: !14)
!24 = !DILocation(line: 27, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 5)
!26 = !DILocation(line: 27, column: 9, scope: !25)
!27 = !DILocation(line: 27, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 27, column: 5)
!29 = !DILocation(line: 27, column: 18, scope: !28)
!30 = !DILocation(line: 27, column: 5, scope: !25)
!31 = !DILocation(line: 31, column: 26, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 28, column: 5)
!33 = !DILocation(line: 31, column: 16, scope: !32)
!34 = !DILocation(line: 31, column: 14, scope: !32)
!35 = !DILocation(line: 32, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 32, column: 13)
!37 = !DILocation(line: 32, column: 18, scope: !36)
!38 = !DILocation(line: 32, column: 13, scope: !32)
!39 = !DILocation(line: 32, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 32, column: 27)
!41 = !DILocation(line: 33, column: 10, scope: !32)
!42 = !DILocation(line: 33, column: 15, scope: !32)
!43 = !DILocation(line: 34, column: 5, scope: !32)
!44 = !DILocation(line: 27, column: 24, scope: !28)
!45 = !DILocation(line: 27, column: 5, scope: !28)
!46 = distinct !{!46, !30, !47, !48}
!47 = !DILocation(line: 34, column: 5, scope: !25)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 36, column: 22, scope: !14)
!50 = !DILocation(line: 36, column: 21, scope: !14)
!51 = !DILocation(line: 36, column: 5, scope: !14)
!52 = !DILocation(line: 37, column: 10, scope: !14)
!53 = !DILocation(line: 37, column: 5, scope: !14)
!54 = !DILocation(line: 38, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_17_good", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 65, column: 5, scope: !55)
!57 = !DILocation(line: 66, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 78, type: !59, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!19, !19, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 78, type: !19)
!65 = !DILocation(line: 78, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 78, type: !61)
!67 = !DILocation(line: 78, column: 27, scope: !58)
!68 = !DILocation(line: 81, column: 22, scope: !58)
!69 = !DILocation(line: 81, column: 12, scope: !58)
!70 = !DILocation(line: 81, column: 5, scope: !58)
!71 = !DILocation(line: 83, column: 5, scope: !58)
!72 = !DILocation(line: 84, column: 5, scope: !58)
!73 = !DILocation(line: 85, column: 5, scope: !58)
!74 = !DILocation(line: 88, column: 5, scope: !58)
!75 = !DILocation(line: 89, column: 5, scope: !58)
!76 = !DILocation(line: 90, column: 5, scope: !58)
!77 = !DILocation(line: 92, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "h", scope: !78, file: !15, line: 47, type: !19)
!80 = !DILocation(line: 47, column: 9, scope: !78)
!81 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 48, type: !4)
!82 = !DILocation(line: 48, column: 14, scope: !78)
!83 = !DILocation(line: 50, column: 10, scope: !78)
!84 = !DILocation(line: 51, column: 11, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !15, line: 51, column: 5)
!86 = !DILocation(line: 51, column: 9, scope: !85)
!87 = !DILocation(line: 51, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !15, line: 51, column: 5)
!89 = !DILocation(line: 51, column: 18, scope: !88)
!90 = !DILocation(line: 51, column: 5, scope: !85)
!91 = !DILocation(line: 54, column: 26, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 52, column: 5)
!93 = !DILocation(line: 54, column: 16, scope: !92)
!94 = !DILocation(line: 54, column: 14, scope: !92)
!95 = !DILocation(line: 55, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 55, column: 13)
!97 = !DILocation(line: 55, column: 18, scope: !96)
!98 = !DILocation(line: 55, column: 13, scope: !92)
!99 = !DILocation(line: 55, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 55, column: 27)
!101 = !DILocation(line: 56, column: 10, scope: !92)
!102 = !DILocation(line: 56, column: 15, scope: !92)
!103 = !DILocation(line: 57, column: 5, scope: !92)
!104 = !DILocation(line: 51, column: 24, scope: !88)
!105 = !DILocation(line: 51, column: 5, scope: !88)
!106 = distinct !{!106, !90, !107, !48}
!107 = !DILocation(line: 57, column: 5, scope: !85)
!108 = !DILocation(line: 59, column: 22, scope: !78)
!109 = !DILocation(line: 59, column: 21, scope: !78)
!110 = !DILocation(line: 59, column: 5, scope: !78)
!111 = !DILocation(line: 60, column: 10, scope: !78)
!112 = !DILocation(line: 60, column: 5, scope: !78)
!113 = !DILocation(line: 61, column: 1, scope: !78)
