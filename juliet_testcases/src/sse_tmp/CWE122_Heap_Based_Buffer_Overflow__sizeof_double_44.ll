; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44_bad() #0 !dbg !14 {
entry:
  %data = alloca double*, align 8
  %funcPtr = alloca void (double*)*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (double*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (double*)* @badSink, void (double*)** %funcPtr, align 8, !dbg !24
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
  %3 = load void (double*)*, void (double*)** %funcPtr, align 8, !dbg !37
  %4 = load double*, double** %data, align 8, !dbg !38
  call void %3(double* %4), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(double* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = load double*, double** %data.addr, align 8, !dbg !43
  %1 = load double, double* %0, align 8, !dbg !44
  call void @printDoubleLine(double %1), !dbg !45
  %2 = load double*, double** %data.addr, align 8, !dbg !46
  %3 = bitcast double* %2 to i8*, !dbg !46
  call void @free(i8* %3) #5, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

declare dso_local void @printDoubleLine(double) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca double*, align 8
  %funcPtr = alloca void (double*)*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata void (double*)** %funcPtr, metadata !76, metadata !DIExpression()), !dbg !77
  store void (double*)* @goodG2BSink, void (double*)** %funcPtr, align 8, !dbg !77
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
  %3 = load void (double*)*, void (double*)** %funcPtr, align 8, !dbg !90
  %4 = load double*, double** %data, align 8, !dbg !91
  call void %3(double* %4), !dbg !90
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(double* %data) #0 !dbg !93 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = load double*, double** %data.addr, align 8, !dbg !96
  %1 = load double, double* %0, align 8, !dbg !97
  call void @printDoubleLine(double %1), !dbg !98
  %2 = load double*, double** %data.addr, align 8, !dbg !99
  %3 = bitcast double* %2 to i8*, !dbg !99
  call void @free(i8* %3) #5, !dbg !100
  ret void, !dbg !101
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 14, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 32, column: 12, scope: !14)
!25 = !DILocation(line: 34, column: 10, scope: !14)
!26 = !DILocation(line: 37, column: 22, scope: !14)
!27 = !DILocation(line: 37, column: 12, scope: !14)
!28 = !DILocation(line: 37, column: 10, scope: !14)
!29 = !DILocation(line: 38, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 9)
!31 = !DILocation(line: 38, column: 14, scope: !30)
!32 = !DILocation(line: 38, column: 9, scope: !14)
!33 = !DILocation(line: 38, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 38, column: 23)
!35 = !DILocation(line: 39, column: 6, scope: !14)
!36 = !DILocation(line: 39, column: 11, scope: !14)
!37 = !DILocation(line: 41, column: 5, scope: !14)
!38 = !DILocation(line: 41, column: 13, scope: !14)
!39 = !DILocation(line: 42, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 21, type: !22, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !15, line: 21, type: !4)
!42 = !DILocation(line: 21, column: 30, scope: !40)
!43 = !DILocation(line: 24, column: 22, scope: !40)
!44 = !DILocation(line: 24, column: 21, scope: !40)
!45 = !DILocation(line: 24, column: 5, scope: !40)
!46 = !DILocation(line: 25, column: 10, scope: !40)
!47 = !DILocation(line: 25, column: 5, scope: !40)
!48 = !DILocation(line: 26, column: 1, scope: !40)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_44_good", scope: !15, file: !15, line: 69, type: !16, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 71, column: 5, scope: !49)
!51 = !DILocation(line: 72, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 83, type: !53, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !15, line: 83, type: !55)
!60 = !DILocation(line: 83, column: 14, scope: !52)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !15, line: 83, type: !56)
!62 = !DILocation(line: 83, column: 27, scope: !52)
!63 = !DILocation(line: 86, column: 22, scope: !52)
!64 = !DILocation(line: 86, column: 12, scope: !52)
!65 = !DILocation(line: 86, column: 5, scope: !52)
!66 = !DILocation(line: 88, column: 5, scope: !52)
!67 = !DILocation(line: 89, column: 5, scope: !52)
!68 = !DILocation(line: 90, column: 5, scope: !52)
!69 = !DILocation(line: 93, column: 5, scope: !52)
!70 = !DILocation(line: 94, column: 5, scope: !52)
!71 = !DILocation(line: 95, column: 5, scope: !52)
!72 = !DILocation(line: 97, column: 5, scope: !52)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 58, type: !4)
!75 = !DILocation(line: 58, column: 14, scope: !73)
!76 = !DILocalVariable(name: "funcPtr", scope: !73, file: !15, line: 59, type: !21)
!77 = !DILocation(line: 59, column: 12, scope: !73)
!78 = !DILocation(line: 61, column: 10, scope: !73)
!79 = !DILocation(line: 63, column: 22, scope: !73)
!80 = !DILocation(line: 63, column: 12, scope: !73)
!81 = !DILocation(line: 63, column: 10, scope: !73)
!82 = !DILocation(line: 64, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !15, line: 64, column: 9)
!84 = !DILocation(line: 64, column: 14, scope: !83)
!85 = !DILocation(line: 64, column: 9, scope: !73)
!86 = !DILocation(line: 64, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 64, column: 23)
!88 = !DILocation(line: 65, column: 6, scope: !73)
!89 = !DILocation(line: 65, column: 11, scope: !73)
!90 = !DILocation(line: 66, column: 5, scope: !73)
!91 = !DILocation(line: 66, column: 13, scope: !73)
!92 = !DILocation(line: 67, column: 1, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 49, type: !22, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", arg: 1, scope: !93, file: !15, line: 49, type: !4)
!95 = !DILocation(line: 49, column: 34, scope: !93)
!96 = !DILocation(line: 52, column: 22, scope: !93)
!97 = !DILocation(line: 52, column: 21, scope: !93)
!98 = !DILocation(line: 52, column: 5, scope: !93)
!99 = !DILocation(line: 53, column: 10, scope: !93)
!100 = !DILocation(line: 53, column: 5, scope: !93)
!101 = !DILocation(line: 54, column: 1, scope: !93)
