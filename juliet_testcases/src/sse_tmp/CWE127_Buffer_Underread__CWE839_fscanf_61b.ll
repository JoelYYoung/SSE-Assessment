; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_61b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE127_Buffer_Underread__CWE839_fscanf_61b_badSource(i32 %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !16
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data.addr), !dbg !17
  %1 = load i32, i32* %data.addr, align 4, !dbg !18
  ret i32 %1, !dbg !19
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE127_Buffer_Underread__CWE839_fscanf_61b_goodG2BSource(i32 %data) #0 !dbg !20 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 7, i32* %data.addr, align 4, !dbg !23
  %0 = load i32, i32* %data.addr, align 4, !dbg !24
  ret i32 %0, !dbg !25
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @CWE127_Buffer_Underread__CWE839_fscanf_61b_goodB2GSource(i32 %data) #0 !dbg !26 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !29
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data.addr), !dbg !30
  %1 = load i32, i32* %data.addr, align 4, !dbg !31
  ret i32 %1, !dbg !32
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fscanf_61b_badSource", scope: !10, file: !10, line: 22, type: !11, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__CWE839_fscanf_61b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 22, type: !13)
!15 = !DILocation(line: 22, column: 62, scope: !9)
!16 = !DILocation(line: 25, column: 12, scope: !9)
!17 = !DILocation(line: 25, column: 5, scope: !9)
!18 = !DILocation(line: 26, column: 12, scope: !9)
!19 = !DILocation(line: 26, column: 5, scope: !9)
!20 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fscanf_61b_goodG2BSource", scope: !10, file: !10, line: 34, type: !11, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "data", arg: 1, scope: !20, file: !10, line: 34, type: !13)
!22 = !DILocation(line: 34, column: 66, scope: !20)
!23 = !DILocation(line: 38, column: 10, scope: !20)
!24 = !DILocation(line: 39, column: 12, scope: !20)
!25 = !DILocation(line: 39, column: 5, scope: !20)
!26 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__CWE839_fscanf_61b_goodB2GSource", scope: !10, file: !10, line: 43, type: !11, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocalVariable(name: "data", arg: 1, scope: !26, file: !10, line: 43, type: !13)
!28 = !DILocation(line: 43, column: 66, scope: !26)
!29 = !DILocation(line: 46, column: 12, scope: !26)
!30 = !DILocation(line: 46, column: 5, scope: !26)
!31 = !DILocation(line: 47, column: 12, scope: !26)
!32 = !DILocation(line: 47, column: 5, scope: !26)
