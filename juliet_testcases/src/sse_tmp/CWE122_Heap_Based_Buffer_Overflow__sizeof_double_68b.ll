; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68_badData = external dso_local global double*, align 8
@CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68_goodG2BData = external dso_local global double*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load double*, double** @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68_badData, align 8, !dbg !17
  store double* %0, double** %data, align 8, !dbg !16
  %1 = load double*, double** %data, align 8, !dbg !18
  %2 = load double, double* %1, align 8, !dbg !19
  call void @printDoubleLine(double %2), !dbg !20
  %3 = load double*, double** %data, align 8, !dbg !21
  %4 = bitcast double* %3 to i8*, !dbg !21
  call void @free(i8* %4) #4, !dbg !22
  ret void, !dbg !23
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68b_goodG2BSink() #0 !dbg !24 {
entry:
  %data = alloca double*, align 8
  call void @llvm.dbg.declare(metadata double** %data, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load double*, double** @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68_goodG2BData, align 8, !dbg !27
  store double* %0, double** %data, align 8, !dbg !26
  %1 = load double*, double** %data, align 8, !dbg !28
  %2 = load double, double* %1, align 8, !dbg !29
  call void @printDoubleLine(double %2), !dbg !30
  %3 = load double*, double** %data, align 8, !dbg !31
  %4 = bitcast double* %3 to i8*, !dbg !31
  call void @free(i8* %4) #4, !dbg !32
  ret void, !dbg !33
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68b_badSink", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 28, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!16 = !DILocation(line: 28, column: 14, scope: !9)
!17 = !DILocation(line: 28, column: 21, scope: !9)
!18 = !DILocation(line: 30, column: 22, scope: !9)
!19 = !DILocation(line: 30, column: 21, scope: !9)
!20 = !DILocation(line: 30, column: 5, scope: !9)
!21 = !DILocation(line: 31, column: 10, scope: !9)
!22 = !DILocation(line: 31, column: 5, scope: !9)
!23 = !DILocation(line: 32, column: 1, scope: !9)
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_68b_goodG2BSink", scope: !10, file: !10, line: 39, type: !11, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DILocalVariable(name: "data", scope: !24, file: !10, line: 41, type: !14)
!26 = !DILocation(line: 41, column: 14, scope: !24)
!27 = !DILocation(line: 41, column: 21, scope: !24)
!28 = !DILocation(line: 43, column: 22, scope: !24)
!29 = !DILocation(line: 43, column: 21, scope: !24)
!30 = !DILocation(line: 43, column: 5, scope: !24)
!31 = !DILocation(line: 44, column: 10, scope: !24)
!32 = !DILocation(line: 44, column: 5, scope: !24)
!33 = !DILocation(line: 45, column: 1, scope: !24)
