; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_badGlobal = external dso_local global i32, align 4
@CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B1Global = external dso_local global i32, align 4
@.str = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B2Global = external dso_local global i32, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_badSource(double* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_badGlobal, align 4, !dbg !19
  %tobool = icmp ne i32 %0, 0, !dbg !19
  br i1 %tobool, label %if.then, label %if.end2, !dbg !21

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !22
  %1 = bitcast i8* %call to double*, !dbg !24
  store double* %1, double** %data.addr, align 8, !dbg !25
  %2 = load double*, double** %data.addr, align 8, !dbg !26
  %cmp = icmp eq double* %2, null, !dbg !28
  br i1 %cmp, label %if.then1, label %if.end, !dbg !29

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data.addr, align 8, !dbg !32
  store double 1.700000e+300, double* %3, align 8, !dbg !33
  br label %if.end2, !dbg !34

if.end2:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data.addr, align 8, !dbg !35
  ret double* %4, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B1Source(double* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B1Global, align 4, !dbg !40
  %tobool = icmp ne i32 %0, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.else, !dbg !42

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !43
  br label %if.end2, !dbg !45

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !46
  %1 = bitcast i8* %call to double*, !dbg !48
  store double* %1, double** %data.addr, align 8, !dbg !49
  %2 = load double*, double** %data.addr, align 8, !dbg !50
  %cmp = icmp eq double* %2, null, !dbg !52
  br i1 %cmp, label %if.then1, label %if.end, !dbg !53

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !54
  unreachable, !dbg !54

if.end:                                           ; preds = %if.else
  %3 = load double*, double** %data.addr, align 8, !dbg !56
  store double 1.700000e+300, double* %3, align 8, !dbg !57
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  %4 = load double*, double** %data.addr, align 8, !dbg !58
  ret double* %4, !dbg !59
}

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B2Source(double* %data) #0 !dbg !60 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B2Global, align 4, !dbg !63
  %tobool = icmp ne i32 %0, 0, !dbg !63
  br i1 %tobool, label %if.then, label %if.end2, !dbg !65

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !66
  %1 = bitcast i8* %call to double*, !dbg !68
  store double* %1, double** %data.addr, align 8, !dbg !69
  %2 = load double*, double** %data.addr, align 8, !dbg !70
  %cmp = icmp eq double* %2, null, !dbg !72
  br i1 %cmp, label %if.then1, label %if.end, !dbg !73

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %if.then
  %3 = load double*, double** %data.addr, align 8, !dbg !76
  store double 1.700000e+300, double* %3, align 8, !dbg !77
  br label %if.end2, !dbg !78

if.end2:                                          ; preds = %if.end, %entry
  %4 = load double*, double** %data.addr, align 8, !dbg !79
  ret double* %4, !dbg !80
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_badSource", scope: !14, file: !14, line: 24, type: !15, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 24, type: !4)
!18 = !DILocation(line: 24, column: 81, scope: !13)
!19 = !DILocation(line: 26, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 8)
!21 = !DILocation(line: 26, column: 8, scope: !13)
!22 = !DILocation(line: 30, column: 26, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !14, line: 27, column: 5)
!24 = !DILocation(line: 30, column: 16, scope: !23)
!25 = !DILocation(line: 30, column: 14, scope: !23)
!26 = !DILocation(line: 31, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !14, line: 31, column: 13)
!28 = !DILocation(line: 31, column: 18, scope: !27)
!29 = !DILocation(line: 31, column: 13, scope: !23)
!30 = !DILocation(line: 31, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 31, column: 27)
!32 = !DILocation(line: 32, column: 10, scope: !23)
!33 = !DILocation(line: 32, column: 15, scope: !23)
!34 = !DILocation(line: 33, column: 5, scope: !23)
!35 = !DILocation(line: 34, column: 12, scope: !13)
!36 = !DILocation(line: 34, column: 5, scope: !13)
!37 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B1Source", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !14, line: 46, type: !4)
!39 = !DILocation(line: 46, column: 86, scope: !37)
!40 = !DILocation(line: 48, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 48, column: 8)
!42 = !DILocation(line: 48, column: 8, scope: !37)
!43 = !DILocation(line: 51, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !14, line: 49, column: 5)
!45 = !DILocation(line: 52, column: 5, scope: !44)
!46 = !DILocation(line: 56, column: 26, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !14, line: 54, column: 5)
!48 = !DILocation(line: 56, column: 16, scope: !47)
!49 = !DILocation(line: 56, column: 14, scope: !47)
!50 = !DILocation(line: 57, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !14, line: 57, column: 13)
!52 = !DILocation(line: 57, column: 18, scope: !51)
!53 = !DILocation(line: 57, column: 13, scope: !47)
!54 = !DILocation(line: 57, column: 28, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !14, line: 57, column: 27)
!56 = !DILocation(line: 58, column: 10, scope: !47)
!57 = !DILocation(line: 58, column: 15, scope: !47)
!58 = !DILocation(line: 60, column: 12, scope: !37)
!59 = !DILocation(line: 60, column: 5, scope: !37)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B2Source", scope: !14, file: !14, line: 64, type: !15, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", arg: 1, scope: !60, file: !14, line: 64, type: !4)
!62 = !DILocation(line: 64, column: 86, scope: !60)
!63 = !DILocation(line: 66, column: 8, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !14, line: 66, column: 8)
!65 = !DILocation(line: 66, column: 8, scope: !60)
!66 = !DILocation(line: 69, column: 26, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !14, line: 67, column: 5)
!68 = !DILocation(line: 69, column: 16, scope: !67)
!69 = !DILocation(line: 69, column: 14, scope: !67)
!70 = !DILocation(line: 70, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !14, line: 70, column: 13)
!72 = !DILocation(line: 70, column: 18, scope: !71)
!73 = !DILocation(line: 70, column: 13, scope: !67)
!74 = !DILocation(line: 70, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !14, line: 70, column: 27)
!76 = !DILocation(line: 71, column: 10, scope: !67)
!77 = !DILocation(line: 71, column: 15, scope: !67)
!78 = !DILocation(line: 72, column: 5, scope: !67)
!79 = !DILocation(line: 73, column: 12, scope: !60)
!80 = !DILocation(line: 73, column: 5, scope: !60)
