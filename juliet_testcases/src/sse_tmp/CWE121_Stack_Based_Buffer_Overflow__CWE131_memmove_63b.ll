; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i32*, i32** %0, align 8, !dbg !21
  store i32* %1, i32** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !27
  %3 = load i32*, i32** %data, align 8, !dbg !28
  %4 = bitcast i32* %3 to i8*, !dbg !29
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !29
  %5 = bitcast i32* %arraydecay to i8*, !dbg !29
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !29
  %6 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !30
  %7 = load i32, i32* %arrayidx, align 4, !dbg !30
  call void @printIntLine(i32 %7), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !33 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !38
  %1 = load i32*, i32** %0, align 8, !dbg !39
  store i32* %1, i32** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !42
  %3 = load i32*, i32** %data, align 8, !dbg !43
  %4 = bitcast i32* %3 to i8*, !dbg !44
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !44
  %5 = bitcast i32* %arraydecay to i8*, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 40, i1 false), !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !45
  %7 = load i32, i32* %arrayidx, align 4, !dbg !45
  call void @printIntLine(i32 %7), !dbg !46
  ret void, !dbg !47
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_63b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!17 = !DILocation(line: 21, column: 77, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 23, type: !14)
!19 = !DILocation(line: 23, column: 11, scope: !9)
!20 = !DILocation(line: 23, column: 19, scope: !9)
!21 = !DILocation(line: 23, column: 18, scope: !9)
!22 = !DILocalVariable(name: "source", scope: !23, file: !10, line: 25, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 24, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 25, column: 13, scope: !23)
!28 = !DILocation(line: 27, column: 17, scope: !23)
!29 = !DILocation(line: 27, column: 9, scope: !23)
!30 = !DILocation(line: 28, column: 22, scope: !23)
!31 = !DILocation(line: 28, column: 9, scope: !23)
!32 = !DILocation(line: 30, column: 1, scope: !9)
!33 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memmove_63b_goodG2BSink", scope: !10, file: !10, line: 37, type: !11, scopeLine: 38, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !33, file: !10, line: 37, type: !13)
!35 = !DILocation(line: 37, column: 81, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !10, line: 39, type: !14)
!37 = !DILocation(line: 39, column: 11, scope: !33)
!38 = !DILocation(line: 39, column: 19, scope: !33)
!39 = !DILocation(line: 39, column: 18, scope: !33)
!40 = !DILocalVariable(name: "source", scope: !41, file: !10, line: 41, type: !24)
!41 = distinct !DILexicalBlock(scope: !33, file: !10, line: 40, column: 5)
!42 = !DILocation(line: 41, column: 13, scope: !41)
!43 = !DILocation(line: 43, column: 17, scope: !41)
!44 = !DILocation(line: 43, column: 9, scope: !41)
!45 = !DILocation(line: 44, column: 22, scope: !41)
!46 = !DILocation(line: 44, column: 9, scope: !41)
!47 = !DILocation(line: 46, column: 1, scope: !33)
