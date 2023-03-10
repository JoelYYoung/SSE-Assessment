; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b_badSink(double* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load double*, double** %data.addr, align 8, !dbg !17
  %1 = load double, double* %0, align 8, !dbg !18
  call void @printDoubleLine(double %1), !dbg !19
  %2 = load double*, double** %data.addr, align 8, !dbg !20
  %3 = bitcast double* %2 to i8*, !dbg !20
  call void @free(i8* %3) #4, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printDoubleLine(double) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b_goodG2BSink(double* %data) #0 !dbg !23 {
entry:
  %data.addr = alloca double*, align 8
  store double* %data, double** %data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %data.addr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load double*, double** %data.addr, align 8, !dbg !26
  %1 = load double, double* %0, align 8, !dbg !27
  call void @printDoubleLine(double %1), !dbg !28
  %2 = load double*, double** %data.addr, align 8, !dbg !29
  %3 = bitcast double* %2 to i8*, !dbg !29
  call void @free(i8* %3) #4, !dbg !30
  ret void, !dbg !31
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!16 = !DILocation(line: 21, column: 76, scope: !9)
!17 = !DILocation(line: 24, column: 22, scope: !9)
!18 = !DILocation(line: 24, column: 21, scope: !9)
!19 = !DILocation(line: 24, column: 5, scope: !9)
!20 = !DILocation(line: 25, column: 10, scope: !9)
!21 = !DILocation(line: 25, column: 5, scope: !9)
!22 = !DILocation(line: 26, column: 1, scope: !9)
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__sizeof_double_65b_goodG2BSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!24 = !DILocalVariable(name: "data", arg: 1, scope: !23, file: !10, line: 33, type: !13)
!25 = !DILocation(line: 33, column: 80, scope: !23)
!26 = !DILocation(line: 36, column: 22, scope: !23)
!27 = !DILocation(line: 36, column: 21, scope: !23)
!28 = !DILocation(line: 36, column: 5, scope: !23)
!29 = !DILocation(line: 37, column: 10, scope: !23)
!30 = !DILocation(line: 37, column: 5, scope: !23)
!31 = !DILocation(line: 38, column: 1, scope: !23)
