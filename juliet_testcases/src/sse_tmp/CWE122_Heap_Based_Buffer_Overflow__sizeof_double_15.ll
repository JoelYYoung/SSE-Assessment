; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store double* null, double** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !21
  %0 = bitcast i8* %call to double*, !dbg !22
  store double* %0, double** %data, align 8, !dbg !23
  %1 = load double*, double** %data, align 8, !dbg !24
  %cmp = icmp eq double* %1, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !30
  store double 1.700000e+300, double* %2, align 8, !dbg !31
  %3 = load double*, double** %data, align 8, !dbg !32
  %4 = load double, double* %3, align 8, !dbg !33
  call void @printDoubleLine(double %4), !dbg !34
  %5 = load double*, double** %data, align 8, !dbg !35
  %6 = bitcast double* %5 to i8*, !dbg !35
  call void @free(i8* %6) #5, !dbg !36
  ret void, !dbg !37
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15_good() #0 !dbg !38 {
entry:
  call void @goodG2B1(), !dbg !39
  call void @goodG2B2(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #5, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #5, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !63 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !64, metadata !DIExpression()), !dbg !65
  store double* null, double** %data, align 8, !dbg !66
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !67
  %0 = bitcast i8* %call to double*, !dbg !68
  store double* %0, double** %data, align 8, !dbg !69
  %1 = load double*, double** %data, align 8, !dbg !70
  %cmp = icmp eq double* %1, null, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !76
  store double 1.700000e+300, double* %2, align 8, !dbg !77
  %3 = load double*, double** %data, align 8, !dbg !78
  %4 = load double, double* %3, align 8, !dbg !79
  call void @printDoubleLine(double %4), !dbg !80
  %5 = load double*, double** %data, align 8, !dbg !81
  %6 = bitcast double* %5 to i8*, !dbg !81
  call void @free(i8* %6) #5, !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !84 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store double* null, double** %data, align 8, !dbg !87
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !88
  %0 = bitcast i8* %call to double*, !dbg !89
  store double* %0, double** %data, align 8, !dbg !90
  %1 = load double*, double** %data, align 8, !dbg !91
  %cmp = icmp eq double* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !97
  store double 1.700000e+300, double* %2, align 8, !dbg !98
  %3 = load double*, double** %data, align 8, !dbg !99
  %4 = load double, double* %3, align 8, !dbg !100
  call void @printDoubleLine(double %4), !dbg !101
  %5 = load double*, double** %data, align 8, !dbg !102
  %6 = bitcast double* %5 to i8*, !dbg !102
  call void @free(i8* %6) #5, !dbg !103
  ret void, !dbg !104
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 14, scope: !14)
!20 = !DILocation(line: 25, column: 10, scope: !14)
!21 = !DILocation(line: 31, column: 26, scope: !14)
!22 = !DILocation(line: 31, column: 16, scope: !14)
!23 = !DILocation(line: 31, column: 14, scope: !14)
!24 = !DILocation(line: 32, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 13)
!26 = !DILocation(line: 32, column: 18, scope: !25)
!27 = !DILocation(line: 32, column: 13, scope: !14)
!28 = !DILocation(line: 32, column: 28, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 32, column: 27)
!30 = !DILocation(line: 33, column: 10, scope: !14)
!31 = !DILocation(line: 33, column: 15, scope: !14)
!32 = !DILocation(line: 41, column: 22, scope: !14)
!33 = !DILocation(line: 41, column: 21, scope: !14)
!34 = !DILocation(line: 41, column: 5, scope: !14)
!35 = !DILocation(line: 42, column: 10, scope: !14)
!36 = !DILocation(line: 42, column: 5, scope: !14)
!37 = !DILocation(line: 43, column: 1, scope: !14)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_15_good", scope: !15, file: !15, line: 97, type: !16, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 99, column: 5, scope: !38)
!40 = !DILocation(line: 100, column: 5, scope: !38)
!41 = !DILocation(line: 101, column: 1, scope: !38)
!42 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 113, type: !43, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !15, line: 113, type: !45)
!50 = !DILocation(line: 113, column: 14, scope: !42)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !15, line: 113, type: !46)
!52 = !DILocation(line: 113, column: 27, scope: !42)
!53 = !DILocation(line: 116, column: 22, scope: !42)
!54 = !DILocation(line: 116, column: 12, scope: !42)
!55 = !DILocation(line: 116, column: 5, scope: !42)
!56 = !DILocation(line: 118, column: 5, scope: !42)
!57 = !DILocation(line: 119, column: 5, scope: !42)
!58 = !DILocation(line: 120, column: 5, scope: !42)
!59 = !DILocation(line: 123, column: 5, scope: !42)
!60 = !DILocation(line: 124, column: 5, scope: !42)
!61 = !DILocation(line: 125, column: 5, scope: !42)
!62 = !DILocation(line: 127, column: 5, scope: !42)
!63 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 50, type: !16, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !15, line: 52, type: !4)
!65 = !DILocation(line: 52, column: 14, scope: !63)
!66 = !DILocation(line: 54, column: 10, scope: !63)
!67 = !DILocation(line: 63, column: 26, scope: !63)
!68 = !DILocation(line: 63, column: 16, scope: !63)
!69 = !DILocation(line: 63, column: 14, scope: !63)
!70 = !DILocation(line: 64, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !63, file: !15, line: 64, column: 13)
!72 = !DILocation(line: 64, column: 18, scope: !71)
!73 = !DILocation(line: 64, column: 13, scope: !63)
!74 = !DILocation(line: 64, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !15, line: 64, column: 27)
!76 = !DILocation(line: 65, column: 10, scope: !63)
!77 = !DILocation(line: 65, column: 15, scope: !63)
!78 = !DILocation(line: 69, column: 22, scope: !63)
!79 = !DILocation(line: 69, column: 21, scope: !63)
!80 = !DILocation(line: 69, column: 5, scope: !63)
!81 = !DILocation(line: 70, column: 10, scope: !63)
!82 = !DILocation(line: 70, column: 5, scope: !63)
!83 = !DILocation(line: 71, column: 1, scope: !63)
!84 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", scope: !84, file: !15, line: 76, type: !4)
!86 = !DILocation(line: 76, column: 14, scope: !84)
!87 = !DILocation(line: 78, column: 10, scope: !84)
!88 = !DILocation(line: 83, column: 26, scope: !84)
!89 = !DILocation(line: 83, column: 16, scope: !84)
!90 = !DILocation(line: 83, column: 14, scope: !84)
!91 = !DILocation(line: 84, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !15, line: 84, column: 13)
!93 = !DILocation(line: 84, column: 18, scope: !92)
!94 = !DILocation(line: 84, column: 13, scope: !84)
!95 = !DILocation(line: 84, column: 28, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 84, column: 27)
!97 = !DILocation(line: 85, column: 10, scope: !84)
!98 = !DILocation(line: 85, column: 15, scope: !84)
!99 = !DILocation(line: 93, column: 22, scope: !84)
!100 = !DILocation(line: 93, column: 21, scope: !84)
!101 = !DILocation(line: 93, column: 5, scope: !84)
!102 = !DILocation(line: 94, column: 10, scope: !84)
!103 = !DILocation(line: 94, column: 5, scope: !84)
!104 = !DILocation(line: 95, column: 1, scope: !84)
