; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_61b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_61b_badSource(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** %data.addr, align 8, !dbg !19
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #3, !dbg !20
  %1 = load i32*, i32** %data.addr, align 8, !dbg !21
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !21
  store i32 0, i32* %arrayidx, align 4, !dbg !22
  %2 = load i32*, i32** %data.addr, align 8, !dbg !23
  ret i32* %2, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_61b_goodG2BSource(i32* %data) #0 !dbg !25 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32*, i32** %data.addr, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #3, !dbg !29
  %1 = load i32*, i32** %data.addr, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %2 = load i32*, i32** %data.addr, align 8, !dbg !32
  ret i32* %2, !dbg !33
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_61b_badSource", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_61b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!18 = !DILocation(line: 23, column: 101, scope: !9)
!19 = !DILocation(line: 26, column: 13, scope: !9)
!20 = !DILocation(line: 26, column: 5, scope: !9)
!21 = !DILocation(line: 27, column: 5, scope: !9)
!22 = !DILocation(line: 27, column: 17, scope: !9)
!23 = !DILocation(line: 28, column: 12, scope: !9)
!24 = !DILocation(line: 28, column: 5, scope: !9)
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_61b_goodG2BSource", scope: !10, file: !10, line: 36, type: !11, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DILocalVariable(name: "data", arg: 1, scope: !25, file: !10, line: 36, type: !13)
!27 = !DILocation(line: 36, column: 105, scope: !25)
!28 = !DILocation(line: 39, column: 13, scope: !25)
!29 = !DILocation(line: 39, column: 5, scope: !25)
!30 = !DILocation(line: 40, column: 5, scope: !25)
!31 = !DILocation(line: 40, column: 16, scope: !25)
!32 = !DILocation(line: 41, column: 12, scope: !25)
!33 = !DILocation(line: 41, column: 5, scope: !25)
