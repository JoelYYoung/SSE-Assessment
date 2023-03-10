; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65_bad() #0 !dbg !13 {
entry:
  %data = alloca double*, align 8
  %funcPtr = alloca void (double*)*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (double*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (double*)* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b_badSink, void (double*)** %funcPtr, align 8, !dbg !23
  store double* null, double** %data, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !25
  %0 = bitcast i8* %call to double*, !dbg !26
  store double* %0, double** %data, align 8, !dbg !27
  %1 = load double*, double** %data, align 8, !dbg !28
  store double 1.700000e+300, double* %1, align 8, !dbg !29
  %2 = load void (double*)*, void (double*)** %funcPtr, align 8, !dbg !30
  %3 = load double*, double** %data, align 8, !dbg !31
  call void %2(double* %3), !dbg !30
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b_badSink(double*) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65_good() #0 !dbg !33 {
entry:
  call void @goodG2B(), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !43, metadata !DIExpression()), !dbg !44
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %call = call i64 @time(i64* null) #4, !dbg !47
  %conv = trunc i64 %call to i32, !dbg !48
  call void @srand(i32 %conv) #4, !dbg !49
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !50
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65_good(), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !52
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65_bad(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !55
  ret i32 0, !dbg !56
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !57 {
entry:
  %data = alloca double*, align 8
  %funcPtr = alloca void (double*)*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata void (double*)** %funcPtr, metadata !60, metadata !DIExpression()), !dbg !61
  store void (double*)* @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b_goodG2BSink, void (double*)** %funcPtr, align 8, !dbg !61
  store double* null, double** %data, align 8, !dbg !62
  %call = call noalias align 16 i8* @malloc(i64 8) #4, !dbg !63
  %0 = bitcast i8* %call to double*, !dbg !64
  store double* %0, double** %data, align 8, !dbg !65
  %1 = load double*, double** %data, align 8, !dbg !66
  store double 1.700000e+300, double* %1, align 8, !dbg !67
  %2 = load void (double*)*, void (double*)** %funcPtr, align 8, !dbg !68
  %3 = load double*, double** %data, align 8, !dbg !69
  call void %2(double* %3), !dbg !68
  ret void, !dbg !70
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b_goodG2BSink(double*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65_bad", scope: !14, file: !14, line: 24, type: !15, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !4)
!18 = !DILocation(line: 26, column: 14, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 28, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 28, column: 12, scope: !13)
!24 = !DILocation(line: 30, column: 10, scope: !13)
!25 = !DILocation(line: 33, column: 22, scope: !13)
!26 = !DILocation(line: 33, column: 12, scope: !13)
!27 = !DILocation(line: 33, column: 10, scope: !13)
!28 = !DILocation(line: 34, column: 6, scope: !13)
!29 = !DILocation(line: 34, column: 11, scope: !13)
!30 = !DILocation(line: 36, column: 5, scope: !13)
!31 = !DILocation(line: 36, column: 13, scope: !13)
!32 = !DILocation(line: 37, column: 1, scope: !13)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65_good", scope: !14, file: !14, line: 58, type: !15, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocation(line: 60, column: 5, scope: !33)
!35 = !DILocation(line: 61, column: 1, scope: !33)
!36 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 73, type: !37, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!39, !39, !40}
!39 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!43 = !DILocalVariable(name: "argc", arg: 1, scope: !36, file: !14, line: 73, type: !39)
!44 = !DILocation(line: 73, column: 14, scope: !36)
!45 = !DILocalVariable(name: "argv", arg: 2, scope: !36, file: !14, line: 73, type: !40)
!46 = !DILocation(line: 73, column: 27, scope: !36)
!47 = !DILocation(line: 76, column: 22, scope: !36)
!48 = !DILocation(line: 76, column: 12, scope: !36)
!49 = !DILocation(line: 76, column: 5, scope: !36)
!50 = !DILocation(line: 78, column: 5, scope: !36)
!51 = !DILocation(line: 79, column: 5, scope: !36)
!52 = !DILocation(line: 80, column: 5, scope: !36)
!53 = !DILocation(line: 83, column: 5, scope: !36)
!54 = !DILocation(line: 84, column: 5, scope: !36)
!55 = !DILocation(line: 85, column: 5, scope: !36)
!56 = !DILocation(line: 87, column: 5, scope: !36)
!57 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", scope: !57, file: !14, line: 48, type: !4)
!59 = !DILocation(line: 48, column: 14, scope: !57)
!60 = !DILocalVariable(name: "funcPtr", scope: !57, file: !14, line: 49, type: !20)
!61 = !DILocation(line: 49, column: 12, scope: !57)
!62 = !DILocation(line: 51, column: 10, scope: !57)
!63 = !DILocation(line: 53, column: 22, scope: !57)
!64 = !DILocation(line: 53, column: 12, scope: !57)
!65 = !DILocation(line: 53, column: 10, scope: !57)
!66 = !DILocation(line: 54, column: 6, scope: !57)
!67 = !DILocation(line: 54, column: 11, scope: !57)
!68 = !DILocation(line: 55, column: 5, scope: !57)
!69 = !DILocation(line: 55, column: 13, scope: !57)
!70 = !DILocation(line: 56, column: 1, scope: !57)
