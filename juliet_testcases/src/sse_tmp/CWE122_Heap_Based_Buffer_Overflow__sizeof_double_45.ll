; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_badData = internal global double* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_goodG2BData = internal global double* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_bad() #0 !dbg !20 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store double* null, double** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !26
  %0 = bitcast i8* %call to double*, !dbg !27
  store double* %0, double** %data, align 8, !dbg !28
  %1 = load double*, double** %data, align 8, !dbg !29
  %cmp = icmp eq double* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !35
  store double 1.700000e+300, double* %2, align 8, !dbg !36
  %3 = load double*, double** %data, align 8, !dbg !37
  store double* %3, double** @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #5, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #5, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !65 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load double*, double** @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_badData, align 8, !dbg !68
  store double* %0, double** %data, align 8, !dbg !67
  %1 = load double*, double** %data, align 8, !dbg !69
  %2 = load double, double* %1, align 8, !dbg !70
  call void @printDoubleLine(double %2), !dbg !71
  %3 = load double*, double** %data, align 8, !dbg !72
  %4 = bitcast double* %3 to i8*, !dbg !72
  call void @free(i8* %4) #5, !dbg !73
  ret void, !dbg !74
}

declare dso_local void @printDoubleLine(double) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store double* null, double** %data, align 8, !dbg !78
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !79
  %0 = bitcast i8* %call to double*, !dbg !80
  store double* %0, double** %data, align 8, !dbg !81
  %1 = load double*, double** %data, align 8, !dbg !82
  %cmp = icmp eq double* %1, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !88
  store double 1.700000e+300, double* %2, align 8, !dbg !89
  %3 = load double*, double** %data, align 8, !dbg !90
  store double* %3, double** @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_goodG2BData, align 8, !dbg !91
  call void @goodG2BSink(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !94 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = load double*, double** @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_goodG2BData, align 8, !dbg !97
  store double* %0, double** %data, align 8, !dbg !96
  %1 = load double*, double** %data, align 8, !dbg !98
  %2 = load double, double* %1, align 8, !dbg !99
  call void @printDoubleLine(double %2), !dbg !100
  %3 = load double*, double** %data, align 8, !dbg !101
  %4 = bitcast double* %3 to i8*, !dbg !101
  call void @free(i8* %4) #5, !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_badData", scope: !2, file: !13, line: 19, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_goodG2BData", scope: !2, file: !13, line: 20, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45.c", directory: "/root/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_bad", scope: !13, file: !13, line: 32, type: !21, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 34, type: !6)
!24 = !DILocation(line: 34, column: 14, scope: !20)
!25 = !DILocation(line: 36, column: 10, scope: !20)
!26 = !DILocation(line: 39, column: 22, scope: !20)
!27 = !DILocation(line: 39, column: 12, scope: !20)
!28 = !DILocation(line: 39, column: 10, scope: !20)
!29 = !DILocation(line: 40, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !13, line: 40, column: 9)
!31 = !DILocation(line: 40, column: 14, scope: !30)
!32 = !DILocation(line: 40, column: 9, scope: !20)
!33 = !DILocation(line: 40, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !13, line: 40, column: 23)
!35 = !DILocation(line: 41, column: 6, scope: !20)
!36 = !DILocation(line: 41, column: 11, scope: !20)
!37 = !DILocation(line: 42, column: 67, scope: !20)
!38 = !DILocation(line: 42, column: 65, scope: !20)
!39 = !DILocation(line: 43, column: 5, scope: !20)
!40 = !DILocation(line: 44, column: 1, scope: !20)
!41 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_45_good", scope: !13, file: !13, line: 72, type: !21, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 74, column: 5, scope: !41)
!43 = !DILocation(line: 75, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 86, type: !45, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !13, line: 86, type: !47)
!52 = !DILocation(line: 86, column: 14, scope: !44)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !13, line: 86, type: !48)
!54 = !DILocation(line: 86, column: 27, scope: !44)
!55 = !DILocation(line: 89, column: 22, scope: !44)
!56 = !DILocation(line: 89, column: 12, scope: !44)
!57 = !DILocation(line: 89, column: 5, scope: !44)
!58 = !DILocation(line: 91, column: 5, scope: !44)
!59 = !DILocation(line: 92, column: 5, scope: !44)
!60 = !DILocation(line: 93, column: 5, scope: !44)
!61 = !DILocation(line: 96, column: 5, scope: !44)
!62 = !DILocation(line: 97, column: 5, scope: !44)
!63 = !DILocation(line: 98, column: 5, scope: !44)
!64 = !DILocation(line: 100, column: 5, scope: !44)
!65 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 24, type: !21, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocalVariable(name: "data", scope: !65, file: !13, line: 26, type: !6)
!67 = !DILocation(line: 26, column: 14, scope: !65)
!68 = !DILocation(line: 26, column: 21, scope: !65)
!69 = !DILocation(line: 28, column: 22, scope: !65)
!70 = !DILocation(line: 28, column: 21, scope: !65)
!71 = !DILocation(line: 28, column: 5, scope: !65)
!72 = !DILocation(line: 29, column: 10, scope: !65)
!73 = !DILocation(line: 29, column: 5, scope: !65)
!74 = !DILocation(line: 30, column: 1, scope: !65)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 59, type: !21, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !13, line: 61, type: !6)
!77 = !DILocation(line: 61, column: 14, scope: !75)
!78 = !DILocation(line: 63, column: 10, scope: !75)
!79 = !DILocation(line: 65, column: 22, scope: !75)
!80 = !DILocation(line: 65, column: 12, scope: !75)
!81 = !DILocation(line: 65, column: 10, scope: !75)
!82 = !DILocation(line: 66, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !75, file: !13, line: 66, column: 9)
!84 = !DILocation(line: 66, column: 14, scope: !83)
!85 = !DILocation(line: 66, column: 9, scope: !75)
!86 = !DILocation(line: 66, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !13, line: 66, column: 23)
!88 = !DILocation(line: 67, column: 6, scope: !75)
!89 = !DILocation(line: 67, column: 11, scope: !75)
!90 = !DILocation(line: 68, column: 71, scope: !75)
!91 = !DILocation(line: 68, column: 69, scope: !75)
!92 = !DILocation(line: 69, column: 5, scope: !75)
!93 = !DILocation(line: 70, column: 1, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 51, type: !21, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !13, line: 53, type: !6)
!96 = !DILocation(line: 53, column: 14, scope: !94)
!97 = !DILocation(line: 53, column: 21, scope: !94)
!98 = !DILocation(line: 55, column: 22, scope: !94)
!99 = !DILocation(line: 55, column: 21, scope: !94)
!100 = !DILocation(line: 55, column: 5, scope: !94)
!101 = !DILocation(line: 56, column: 10, scope: !94)
!102 = !DILocation(line: 56, column: 5, scope: !94)
!103 = !DILocation(line: 57, column: 1, scope: !94)
