; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01_bad() #0 !dbg !14 {
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #5, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #5, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !63, metadata !DIExpression()), !dbg !64
  store double* null, double** %data, align 8, !dbg !65
  %call = call noalias align 16 i8* @malloc(i64 8) #5, !dbg !66
  %0 = bitcast i8* %call to double*, !dbg !67
  store double* %0, double** %data, align 8, !dbg !68
  %1 = load double*, double** %data, align 8, !dbg !69
  %cmp = icmp eq double* %1, null, !dbg !71
  br i1 %cmp, label %if.then, label %if.end, !dbg !72

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !73
  unreachable, !dbg !73

if.end:                                           ; preds = %entry
  %2 = load double*, double** %data, align 8, !dbg !75
  store double 1.700000e+300, double* %2, align 8, !dbg !76
  %3 = load double*, double** %data, align 8, !dbg !77
  %4 = load double, double* %3, align 8, !dbg !78
  call void @printDoubleLine(double %4), !dbg !79
  %5 = load double*, double** %data, align 8, !dbg !80
  %6 = bitcast double* %5 to i8*, !dbg !80
  call void @free(i8* %6) #5, !dbg !81
  ret void, !dbg !82
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 14, scope: !14)
!20 = !DILocation(line: 25, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 22, scope: !14)
!22 = !DILocation(line: 28, column: 12, scope: !14)
!23 = !DILocation(line: 28, column: 10, scope: !14)
!24 = !DILocation(line: 29, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!26 = !DILocation(line: 29, column: 14, scope: !25)
!27 = !DILocation(line: 29, column: 9, scope: !14)
!28 = !DILocation(line: 29, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 29, column: 23)
!30 = !DILocation(line: 30, column: 6, scope: !14)
!31 = !DILocation(line: 30, column: 11, scope: !14)
!32 = !DILocation(line: 32, column: 22, scope: !14)
!33 = !DILocation(line: 32, column: 21, scope: !14)
!34 = !DILocation(line: 32, column: 5, scope: !14)
!35 = !DILocation(line: 33, column: 10, scope: !14)
!36 = !DILocation(line: 33, column: 5, scope: !14)
!37 = !DILocation(line: 34, column: 1, scope: !14)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_01_good", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 57, column: 5, scope: !38)
!40 = !DILocation(line: 58, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 70, type: !42, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !15, line: 70, type: !44)
!49 = !DILocation(line: 70, column: 14, scope: !41)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !15, line: 70, type: !45)
!51 = !DILocation(line: 70, column: 27, scope: !41)
!52 = !DILocation(line: 73, column: 22, scope: !41)
!53 = !DILocation(line: 73, column: 12, scope: !41)
!54 = !DILocation(line: 73, column: 5, scope: !41)
!55 = !DILocation(line: 75, column: 5, scope: !41)
!56 = !DILocation(line: 76, column: 5, scope: !41)
!57 = !DILocation(line: 77, column: 5, scope: !41)
!58 = !DILocation(line: 80, column: 5, scope: !41)
!59 = !DILocation(line: 81, column: 5, scope: !41)
!60 = !DILocation(line: 82, column: 5, scope: !41)
!61 = !DILocation(line: 84, column: 5, scope: !41)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 41, type: !16, scopeLine: 42, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !15, line: 43, type: !4)
!64 = !DILocation(line: 43, column: 14, scope: !62)
!65 = !DILocation(line: 45, column: 10, scope: !62)
!66 = !DILocation(line: 47, column: 22, scope: !62)
!67 = !DILocation(line: 47, column: 12, scope: !62)
!68 = !DILocation(line: 47, column: 10, scope: !62)
!69 = !DILocation(line: 48, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !62, file: !15, line: 48, column: 9)
!71 = !DILocation(line: 48, column: 14, scope: !70)
!72 = !DILocation(line: 48, column: 9, scope: !62)
!73 = !DILocation(line: 48, column: 24, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 48, column: 23)
!75 = !DILocation(line: 49, column: 6, scope: !62)
!76 = !DILocation(line: 49, column: 11, scope: !62)
!77 = !DILocation(line: 51, column: 22, scope: !62)
!78 = !DILocation(line: 51, column: 21, scope: !62)
!79 = !DILocation(line: 51, column: 5, scope: !62)
!80 = !DILocation(line: 52, column: 10, scope: !62)
!81 = !DILocation(line: 52, column: 5, scope: !62)
!82 = !DILocation(line: 53, column: 1, scope: !62)
