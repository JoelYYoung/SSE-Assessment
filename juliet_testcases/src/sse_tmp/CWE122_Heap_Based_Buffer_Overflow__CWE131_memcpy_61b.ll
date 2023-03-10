; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_61b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_61b_badSource(i32* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %call = call noalias align 16 i8* @malloc(i64 10) #4, !dbg !19
  %0 = bitcast i8* %call to i32*, !dbg !20
  store i32* %0, i32** %data.addr, align 8, !dbg !21
  %1 = load i32*, i32** %data.addr, align 8, !dbg !22
  %cmp = icmp eq i32* %1, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !28
  ret i32* %2, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32* @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_61b_goodG2BSource(i32* %data) #0 !dbg !30 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !31, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 40) #4, !dbg !33
  %0 = bitcast i8* %call to i32*, !dbg !34
  store i32* %0, i32** %data.addr, align 8, !dbg !35
  %1 = load i32*, i32** %data.addr, align 8, !dbg !36
  %cmp = icmp eq i32* %1, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #5, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data.addr, align 8, !dbg !42
  ret i32* %2, !dbg !43
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_61b_badSource", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_61b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 21, type: !4)
!18 = !DILocation(line: 21, column: 76, scope: !13)
!19 = !DILocation(line: 24, column: 19, scope: !13)
!20 = !DILocation(line: 24, column: 12, scope: !13)
!21 = !DILocation(line: 24, column: 10, scope: !13)
!22 = !DILocation(line: 25, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 9)
!24 = !DILocation(line: 25, column: 14, scope: !23)
!25 = !DILocation(line: 25, column: 9, scope: !13)
!26 = !DILocation(line: 25, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !14, line: 25, column: 23)
!28 = !DILocation(line: 26, column: 12, scope: !13)
!29 = !DILocation(line: 26, column: 5, scope: !13)
!30 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_61b_goodG2BSource", scope: !14, file: !14, line: 34, type: !15, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocalVariable(name: "data", arg: 1, scope: !30, file: !14, line: 34, type: !4)
!32 = !DILocation(line: 34, column: 80, scope: !30)
!33 = !DILocation(line: 37, column: 19, scope: !30)
!34 = !DILocation(line: 37, column: 12, scope: !30)
!35 = !DILocation(line: 37, column: 10, scope: !30)
!36 = !DILocation(line: 38, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !14, line: 38, column: 9)
!38 = !DILocation(line: 38, column: 14, scope: !37)
!39 = !DILocation(line: 38, column: 9, scope: !30)
!40 = !DILocation(line: 38, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !14, line: 38, column: 23)
!42 = !DILocation(line: 39, column: 12, scope: !30)
!43 = !DILocation(line: 39, column: 5, scope: !30)
