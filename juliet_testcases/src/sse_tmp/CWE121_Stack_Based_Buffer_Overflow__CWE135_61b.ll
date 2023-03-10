; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_61b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [43 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 4
@.str.1 = private unnamed_addr constant [43 x i8] c"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_badSource(i8* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data.addr, align 8, !dbg !17
  %0 = load i8*, i8** %data.addr, align 8, !dbg !18
  ret i8* %0, !dbg !19
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_goodG2BSource(i8* %data) #0 !dbg !20 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.1, i64 0, i64 0), i8** %data.addr, align 8, !dbg !23
  %0 = load i8*, i8** %data.addr, align 8, !dbg !24
  ret i8* %0, !dbg !25
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_goodB2GSource(i8* %data) #0 !dbg !26 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !27, metadata !DIExpression()), !dbg !28
  store i8* bitcast ([43 x i32]* @.str to i8*), i8** %data.addr, align 8, !dbg !29
  %0 = load i8*, i8** %data.addr, align 8, !dbg !30
  ret i8* %0, !dbg !31
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_badSource", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE135_61b.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{!4, !4}
!15 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 27, type: !4)
!16 = !DILocation(line: 27, column: 72, scope: !11)
!17 = !DILocation(line: 30, column: 10, scope: !11)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocation(line: 31, column: 5, scope: !11)
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_goodG2BSource", scope: !12, file: !12, line: 39, type: !13, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocalVariable(name: "data", arg: 1, scope: !20, file: !12, line: 39, type: !4)
!22 = !DILocation(line: 39, column: 76, scope: !20)
!23 = !DILocation(line: 42, column: 10, scope: !20)
!24 = !DILocation(line: 43, column: 12, scope: !20)
!25 = !DILocation(line: 43, column: 5, scope: !20)
!26 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE135_61b_goodB2GSource", scope: !12, file: !12, line: 47, type: !13, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DILocalVariable(name: "data", arg: 1, scope: !26, file: !12, line: 47, type: !4)
!28 = !DILocation(line: 47, column: 76, scope: !26)
!29 = !DILocation(line: 50, column: 10, scope: !26)
!30 = !DILocation(line: 51, column: 12, scope: !26)
!31 = !DILocation(line: 51, column: 5, scope: !26)
