; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63b_badSink(double** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca double**, align 8
  %data = alloca double*, align 8
  store double** %dataPtr, double*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata double** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load double**, double*** %dataPtr.addr, align 8, !dbg !20
  %1 = load double*, double** %0, align 8, !dbg !21
  store double* %1, double** %data, align 8, !dbg !19
  %2 = load double*, double** %data, align 8, !dbg !22
  %3 = load double, double* %2, align 8, !dbg !23
  call void @printDoubleLine(double %3), !dbg !24
  %4 = load double*, double** %data, align 8, !dbg !25
  %5 = bitcast double* %4 to i8*, !dbg !25
  call void @free(i8* %5) #4, !dbg !26
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63b_goodG2BSink(double** %dataPtr) #0 !dbg !28 {
entry:
  %dataPtr.addr = alloca double**, align 8
  %data = alloca double*, align 8
  store double** %dataPtr, double*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata double*** %dataPtr.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata double** %data, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load double**, double*** %dataPtr.addr, align 8, !dbg !33
  %1 = load double*, double** %0, align 8, !dbg !34
  store double* %1, double** %data, align 8, !dbg !32
  %2 = load double*, double** %data, align 8, !dbg !35
  %3 = load double, double* %2, align 8, !dbg !36
  call void @printDoubleLine(double %3), !dbg !37
  %4 = load double*, double** %data, align 8, !dbg !38
  %5 = bitcast double* %4 to i8*, !dbg !38
  call void @free(i8* %5) #4, !dbg !39
  ret void, !dbg !40
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!17 = !DILocation(line: 21, column: 78, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 23, type: !14)
!19 = !DILocation(line: 23, column: 14, scope: !9)
!20 = !DILocation(line: 23, column: 22, scope: !9)
!21 = !DILocation(line: 23, column: 21, scope: !9)
!22 = !DILocation(line: 25, column: 22, scope: !9)
!23 = !DILocation(line: 25, column: 21, scope: !9)
!24 = !DILocation(line: 25, column: 5, scope: !9)
!25 = !DILocation(line: 26, column: 10, scope: !9)
!26 = !DILocation(line: 26, column: 5, scope: !9)
!27 = !DILocation(line: 27, column: 1, scope: !9)
!28 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_63b_goodG2BSink", scope: !10, file: !10, line: 34, type: !11, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !28, file: !10, line: 34, type: !13)
!30 = !DILocation(line: 34, column: 82, scope: !28)
!31 = !DILocalVariable(name: "data", scope: !28, file: !10, line: 36, type: !14)
!32 = !DILocation(line: 36, column: 14, scope: !28)
!33 = !DILocation(line: 36, column: 22, scope: !28)
!34 = !DILocation(line: 36, column: 21, scope: !28)
!35 = !DILocation(line: 38, column: 22, scope: !28)
!36 = !DILocation(line: 38, column: 21, scope: !28)
!37 = !DILocation(line: 38, column: 5, scope: !28)
!38 = !DILocation(line: 39, column: 10, scope: !28)
!39 = !DILocation(line: 39, column: 5, scope: !28)
!40 = !DILocation(line: 40, column: 1, scope: !28)
