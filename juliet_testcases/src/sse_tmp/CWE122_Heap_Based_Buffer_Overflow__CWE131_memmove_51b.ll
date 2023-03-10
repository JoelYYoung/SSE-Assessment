; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_51b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_51b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !17, metadata !DIExpression()), !dbg !22
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !22
  %1 = load i32*, i32** %data.addr, align 8, !dbg !23
  %2 = bitcast i32* %1 to i8*, !dbg !24
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !24
  %3 = bitcast i32* %arraydecay to i8*, !dbg !24
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 40, i1 false), !dbg !24
  %4 = load i32*, i32** %data.addr, align 8, !dbg !25
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !25
  %5 = load i32, i32* %arrayidx, align 4, !dbg !25
  call void @printIntLine(i32 %5), !dbg !26
  %6 = load i32*, i32** %data.addr, align 8, !dbg !27
  %7 = bitcast i32* %6 to i8*, !dbg !27
  call void @free(i8* %7) #6, !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_51b_goodG2BSink(i32* %data) #0 !dbg !30 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %0 = bitcast [10 x i32]* %source to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !35
  %1 = load i32*, i32** %data.addr, align 8, !dbg !36
  %2 = bitcast i32* %1 to i8*, !dbg !37
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !37
  %3 = bitcast i32* %arraydecay to i8*, !dbg !37
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 40, i1 false), !dbg !37
  %4 = load i32*, i32** %data.addr, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !38
  %5 = load i32, i32* %arrayidx, align 4, !dbg !38
  call void @printIntLine(i32 %5), !dbg !39
  %6 = load i32*, i32** %data.addr, align 8, !dbg !40
  %7 = bitcast i32* %6 to i8*, !dbg !40
  call void @free(i8* %7) #6, !dbg !41
  ret void, !dbg !42
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_51b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!16 = !DILocation(line: 23, column: 74, scope: !9)
!17 = !DILocalVariable(name: "source", scope: !18, file: !10, line: 26, type: !19)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 320, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 10)
!22 = !DILocation(line: 26, column: 13, scope: !18)
!23 = !DILocation(line: 28, column: 17, scope: !18)
!24 = !DILocation(line: 28, column: 9, scope: !18)
!25 = !DILocation(line: 29, column: 22, scope: !18)
!26 = !DILocation(line: 29, column: 9, scope: !18)
!27 = !DILocation(line: 30, column: 14, scope: !18)
!28 = !DILocation(line: 30, column: 9, scope: !18)
!29 = !DILocation(line: 32, column: 1, scope: !9)
!30 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memmove_51b_goodG2BSink", scope: !10, file: !10, line: 39, type: !11, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DILocalVariable(name: "data", arg: 1, scope: !30, file: !10, line: 39, type: !13)
!32 = !DILocation(line: 39, column: 78, scope: !30)
!33 = !DILocalVariable(name: "source", scope: !34, file: !10, line: 42, type: !19)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 41, column: 5)
!35 = !DILocation(line: 42, column: 13, scope: !34)
!36 = !DILocation(line: 44, column: 17, scope: !34)
!37 = !DILocation(line: 44, column: 9, scope: !34)
!38 = !DILocation(line: 45, column: 22, scope: !34)
!39 = !DILocation(line: 45, column: 9, scope: !34)
!40 = !DILocation(line: 46, column: 14, scope: !34)
!41 = !DILocation(line: 46, column: 9, scope: !34)
!42 = !DILocation(line: 48, column: 1, scope: !30)
