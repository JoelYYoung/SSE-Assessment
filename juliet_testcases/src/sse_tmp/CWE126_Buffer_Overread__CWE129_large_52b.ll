; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_52b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_52b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_52b_badSink(i32 %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* %data.addr, align 4, !dbg !16
  call void @CWE126_Buffer_Overread__CWE129_large_52c_badSink(i32 %0), !dbg !17
  ret void, !dbg !18
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE126_Buffer_Overread__CWE129_large_52c_badSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_52b_goodG2BSink(i32 %data) #0 !dbg !19 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32, i32* %data.addr, align 4, !dbg !22
  call void @CWE126_Buffer_Overread__CWE129_large_52c_goodG2BSink(i32 %0), !dbg !23
  ret void, !dbg !24
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_large_52c_goodG2BSink(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_large_52b_goodB2GSink(i32 %data) #0 !dbg !25 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %data.addr, align 4, !dbg !28
  call void @CWE126_Buffer_Overread__CWE129_large_52c_goodB2GSink(i32 %0), !dbg !29
  ret void, !dbg !30
}

declare dso_local void @CWE126_Buffer_Overread__CWE129_large_52c_goodB2GSink(i32) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_52b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_52b_badSink", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_large_52b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 25, type: !13)
!15 = !DILocation(line: 25, column: 59, scope: !9)
!16 = !DILocation(line: 27, column: 54, scope: !9)
!17 = !DILocation(line: 27, column: 5, scope: !9)
!18 = !DILocation(line: 28, column: 1, scope: !9)
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_52b_goodG2BSink", scope: !10, file: !10, line: 37, type: !11, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !10, line: 37, type: !13)
!21 = !DILocation(line: 37, column: 63, scope: !19)
!22 = !DILocation(line: 39, column: 58, scope: !19)
!23 = !DILocation(line: 39, column: 5, scope: !19)
!24 = !DILocation(line: 40, column: 1, scope: !19)
!25 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_large_52b_goodB2GSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DILocalVariable(name: "data", arg: 1, scope: !25, file: !10, line: 45, type: !13)
!27 = !DILocation(line: 45, column: 63, scope: !25)
!28 = !DILocation(line: 47, column: 58, scope: !25)
!29 = !DILocation(line: 47, column: 5, scope: !25)
!30 = !DILocation(line: 48, column: 1, scope: !25)
