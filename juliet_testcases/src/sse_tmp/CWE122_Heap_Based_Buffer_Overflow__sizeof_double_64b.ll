; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca double**, align 8
  %data = alloca double*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata double*** %dataPtr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !22
  %1 = bitcast i8* %0 to double**, !dbg !23
  store double** %1, double*** %dataPtr, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata double** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load double**, double*** %dataPtr, align 8, !dbg !26
  %3 = load double*, double** %2, align 8, !dbg !27
  store double* %3, double** %data, align 8, !dbg !25
  %4 = load double*, double** %data, align 8, !dbg !28
  %5 = load double, double* %4, align 8, !dbg !29
  call void @printDoubleLine(double %5), !dbg !30
  %6 = load double*, double** %data, align 8, !dbg !31
  %7 = bitcast double* %6 to i8*, !dbg !31
  call void @free(i8* %7) #4, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !34 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca double**, align 8
  %data = alloca double*, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata double*** %dataPtr, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !39
  %1 = bitcast i8* %0 to double**, !dbg !40
  store double** %1, double*** %dataPtr, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata double** %data, metadata !41, metadata !DIExpression()), !dbg !42
  %2 = load double**, double*** %dataPtr, align 8, !dbg !43
  %3 = load double*, double** %2, align 8, !dbg !44
  store double* %3, double** %data, align 8, !dbg !42
  %4 = load double*, double** %data, align 8, !dbg !45
  %5 = load double, double* %4, align 8, !dbg !46
  call void @printDoubleLine(double %5), !dbg !47
  %6 = load double*, double** %data, align 8, !dbg !48
  %7 = bitcast double* %6 to i8*, !dbg !48
  call void @free(i8* %7) #4, !dbg !49
  ret void, !dbg !50
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64b_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 21, type: !17)
!19 = !DILocation(line: 21, column: 74, scope: !13)
!20 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 24, type: !4)
!21 = !DILocation(line: 24, column: 16, scope: !13)
!22 = !DILocation(line: 24, column: 38, scope: !13)
!23 = !DILocation(line: 24, column: 26, scope: !13)
!24 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !5)
!25 = !DILocation(line: 26, column: 14, scope: !13)
!26 = !DILocation(line: 26, column: 23, scope: !13)
!27 = !DILocation(line: 26, column: 22, scope: !13)
!28 = !DILocation(line: 28, column: 22, scope: !13)
!29 = !DILocation(line: 28, column: 21, scope: !13)
!30 = !DILocation(line: 28, column: 5, scope: !13)
!31 = !DILocation(line: 29, column: 10, scope: !13)
!32 = !DILocation(line: 29, column: 5, scope: !13)
!33 = !DILocation(line: 30, column: 1, scope: !13)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_64b_goodG2BSink", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !34, file: !14, line: 37, type: !17)
!36 = !DILocation(line: 37, column: 78, scope: !34)
!37 = !DILocalVariable(name: "dataPtr", scope: !34, file: !14, line: 40, type: !4)
!38 = !DILocation(line: 40, column: 16, scope: !34)
!39 = !DILocation(line: 40, column: 38, scope: !34)
!40 = !DILocation(line: 40, column: 26, scope: !34)
!41 = !DILocalVariable(name: "data", scope: !34, file: !14, line: 42, type: !5)
!42 = !DILocation(line: 42, column: 14, scope: !34)
!43 = !DILocation(line: 42, column: 23, scope: !34)
!44 = !DILocation(line: 42, column: 22, scope: !34)
!45 = !DILocation(line: 44, column: 22, scope: !34)
!46 = !DILocation(line: 44, column: 21, scope: !34)
!47 = !DILocation(line: 44, column: 5, scope: !34)
!48 = !DILocation(line: 45, column: 10, scope: !34)
!49 = !DILocation(line: 45, column: 5, scope: !34)
!50 = !DILocation(line: 46, column: 1, scope: !34)
