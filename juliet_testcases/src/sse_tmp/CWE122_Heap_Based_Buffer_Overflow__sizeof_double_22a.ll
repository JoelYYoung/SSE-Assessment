; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_bad() #0 !dbg !20 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !23, metadata !DIExpression()), !dbg !26
  store double* null, double** %data, align 8, !dbg !27
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_badGlobal, align 4, !dbg !28
  %0 = load double*, double** %data, align 8, !dbg !29
  %call = call double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_badSource(double* %0), !dbg !30
  store double* %call, double** %data, align 8, !dbg !31
  %1 = load double*, double** %data, align 8, !dbg !32
  %2 = load double, double* %1, align 8, !dbg !33
  call void @printDoubleLine(double %2), !dbg !34
  %3 = load double*, double** %data, align 8, !dbg !35
  %4 = bitcast double* %3 to i8*, !dbg !35
  call void @free(i8* %4) #4, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_badSource(double*) #2

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_good() #0 !dbg !38 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #4, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #4, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !62 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !63, metadata !DIExpression()), !dbg !64
  store double* null, double** %data, align 8, !dbg !65
  store i32 0, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B1Global, align 4, !dbg !66
  %0 = load double*, double** %data, align 8, !dbg !67
  %call = call double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B1Source(double* %0), !dbg !68
  store double* %call, double** %data, align 8, !dbg !69
  %1 = load double*, double** %data, align 8, !dbg !70
  %2 = load double, double* %1, align 8, !dbg !71
  call void @printDoubleLine(double %2), !dbg !72
  %3 = load double*, double** %data, align 8, !dbg !73
  %4 = bitcast double* %3 to i8*, !dbg !73
  call void @free(i8* %4) #4, !dbg !74
  ret void, !dbg !75
}

declare dso_local double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B1Source(double*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !76 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !77, metadata !DIExpression()), !dbg !78
  store double* null, double** %data, align 8, !dbg !79
  store i32 1, i32* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B2Global, align 4, !dbg !80
  %0 = load double*, double** %data, align 8, !dbg !81
  %call = call double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B2Source(double* %0), !dbg !82
  store double* %call, double** %data, align 8, !dbg !83
  %1 = load double*, double** %data, align 8, !dbg !84
  %2 = load double, double* %1, align 8, !dbg !85
  call void @printDoubleLine(double %2), !dbg !86
  %3 = load double*, double** %data, align 8, !dbg !87
  %4 = bitcast double* %3 to i8*, !dbg !87
  call void @free(i8* %4) #4, !dbg !88
  ret void, !dbg !89
}

declare dso_local double* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B2Source(double*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_badGlobal", scope: !2, file: !10, line: 22, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B1Global", scope: !2, file: !10, line: 43, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_goodG2B2Global", scope: !2, file: !10, line: 44, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_bad", scope: !10, file: !10, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 28, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!26 = !DILocation(line: 28, column: 14, scope: !20)
!27 = !DILocation(line: 30, column: 10, scope: !20)
!28 = !DILocation(line: 31, column: 67, scope: !20)
!29 = !DILocation(line: 32, column: 74, scope: !20)
!30 = !DILocation(line: 32, column: 12, scope: !20)
!31 = !DILocation(line: 32, column: 10, scope: !20)
!32 = !DILocation(line: 34, column: 22, scope: !20)
!33 = !DILocation(line: 34, column: 21, scope: !20)
!34 = !DILocation(line: 34, column: 5, scope: !20)
!35 = !DILocation(line: 35, column: 10, scope: !20)
!36 = !DILocation(line: 35, column: 5, scope: !20)
!37 = !DILocation(line: 36, column: 1, scope: !20)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_22_good", scope: !10, file: !10, line: 76, type: !21, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 78, column: 5, scope: !38)
!40 = !DILocation(line: 79, column: 5, scope: !38)
!41 = !DILocation(line: 80, column: 1, scope: !38)
!42 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 92, type: !43, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DISubroutineType(types: !44)
!44 = !{!11, !11, !45}
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !10, line: 92, type: !11)
!49 = !DILocation(line: 92, column: 14, scope: !42)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !10, line: 92, type: !45)
!51 = !DILocation(line: 92, column: 27, scope: !42)
!52 = !DILocation(line: 95, column: 22, scope: !42)
!53 = !DILocation(line: 95, column: 12, scope: !42)
!54 = !DILocation(line: 95, column: 5, scope: !42)
!55 = !DILocation(line: 97, column: 5, scope: !42)
!56 = !DILocation(line: 98, column: 5, scope: !42)
!57 = !DILocation(line: 99, column: 5, scope: !42)
!58 = !DILocation(line: 102, column: 5, scope: !42)
!59 = !DILocation(line: 103, column: 5, scope: !42)
!60 = !DILocation(line: 104, column: 5, scope: !42)
!61 = !DILocation(line: 106, column: 5, scope: !42)
!62 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 49, type: !21, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DILocalVariable(name: "data", scope: !62, file: !10, line: 51, type: !24)
!64 = !DILocation(line: 51, column: 14, scope: !62)
!65 = !DILocation(line: 53, column: 10, scope: !62)
!66 = !DILocation(line: 54, column: 72, scope: !62)
!67 = !DILocation(line: 55, column: 79, scope: !62)
!68 = !DILocation(line: 55, column: 12, scope: !62)
!69 = !DILocation(line: 55, column: 10, scope: !62)
!70 = !DILocation(line: 57, column: 22, scope: !62)
!71 = !DILocation(line: 57, column: 21, scope: !62)
!72 = !DILocation(line: 57, column: 5, scope: !62)
!73 = !DILocation(line: 58, column: 10, scope: !62)
!74 = !DILocation(line: 58, column: 5, scope: !62)
!75 = !DILocation(line: 59, column: 1, scope: !62)
!76 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 64, type: !21, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !10, line: 66, type: !24)
!78 = !DILocation(line: 66, column: 14, scope: !76)
!79 = !DILocation(line: 68, column: 10, scope: !76)
!80 = !DILocation(line: 69, column: 72, scope: !76)
!81 = !DILocation(line: 70, column: 79, scope: !76)
!82 = !DILocation(line: 70, column: 12, scope: !76)
!83 = !DILocation(line: 70, column: 10, scope: !76)
!84 = !DILocation(line: 72, column: 22, scope: !76)
!85 = !DILocation(line: 72, column: 21, scope: !76)
!86 = !DILocation(line: 72, column: 5, scope: !76)
!87 = !DILocation(line: 73, column: 10, scope: !76)
!88 = !DILocation(line: 73, column: 5, scope: !76)
!89 = !DILocation(line: 74, column: 1, scope: !76)
