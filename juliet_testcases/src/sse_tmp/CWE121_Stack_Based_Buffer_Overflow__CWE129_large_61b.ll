; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_61b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_61b_badSource(i32 %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 10, i32* %data.addr, align 4, !dbg !16
  %0 = load i32, i32* %data.addr, align 4, !dbg !17
  ret i32 %0, !dbg !18
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_61b_goodG2BSource(i32 %data) #0 !dbg !19 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 7, i32* %data.addr, align 4, !dbg !22
  %0 = load i32, i32* %data.addr, align 4, !dbg !23
  ret i32 %0, !dbg !24
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE121_Stack_Based_Buffer_Overflow__CWE129_large_61b_goodB2GSource(i32 %data) #0 !dbg !25 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 10, i32* %data.addr, align 4, !dbg !28
  %0 = load i32, i32* %data.addr, align 4, !dbg !29
  ret i32 %0, !dbg !30
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_61b_badSource", scope: !10, file: !10, line: 22, type: !11, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_large_61b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 22, type: !13)
!15 = !DILocation(line: 22, column: 72, scope: !9)
!16 = !DILocation(line: 25, column: 10, scope: !9)
!17 = !DILocation(line: 26, column: 12, scope: !9)
!18 = !DILocation(line: 26, column: 5, scope: !9)
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_61b_goodG2BSource", scope: !10, file: !10, line: 34, type: !11, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !10, line: 34, type: !13)
!21 = !DILocation(line: 34, column: 76, scope: !19)
!22 = !DILocation(line: 38, column: 10, scope: !19)
!23 = !DILocation(line: 39, column: 12, scope: !19)
!24 = !DILocation(line: 39, column: 5, scope: !19)
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_large_61b_goodB2GSource", scope: !10, file: !10, line: 43, type: !11, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DILocalVariable(name: "data", arg: 1, scope: !25, file: !10, line: 43, type: !13)
!27 = !DILocation(line: 43, column: 76, scope: !25)
!28 = !DILocation(line: 46, column: 10, scope: !25)
!29 = !DILocation(line: 47, column: 12, scope: !25)
!30 = !DILocation(line: 47, column: 5, scope: !25)
