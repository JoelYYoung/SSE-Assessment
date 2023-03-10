; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !20
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !20
  store i32* %1, i32** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %4 = bitcast i32* %3 to i8*, !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !28
  %5 = bitcast i32* %arraydecay to i8*, !dbg !28
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !28
  %6 = load i32*, i32** %data, align 8, !dbg !29
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 0, !dbg !29
  %7 = load i32, i32* %arrayidx1, align 4, !dbg !29
  call void @printIntLine(i32 %7), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_66b_goodG2BSink(i32** %dataArray) #0 !dbg !32 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !37
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !37
  store i32* %1, i32** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %4 = bitcast i32* %3 to i8*, !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %5 = bitcast i32* %arraydecay to i8*, !dbg !42
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 0, !dbg !43
  %7 = load i32, i32* %arrayidx1, align 4, !dbg !43
  call void @printIntLine(i32 %7), !dbg !44
  ret void, !dbg !45
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_66b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!17 = !DILocation(line: 21, column: 86, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 24, type: !14)
!19 = !DILocation(line: 24, column: 11, scope: !9)
!20 = !DILocation(line: 24, column: 18, scope: !9)
!21 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 13, scope: !22)
!27 = !DILocation(line: 28, column: 17, scope: !22)
!28 = !DILocation(line: 28, column: 9, scope: !22)
!29 = !DILocation(line: 29, column: 22, scope: !22)
!30 = !DILocation(line: 29, column: 9, scope: !22)
!31 = !DILocation(line: 31, column: 1, scope: !9)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_66b_goodG2BSink", scope: !10, file: !10, line: 38, type: !11, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DILocalVariable(name: "dataArray", arg: 1, scope: !32, file: !10, line: 38, type: !13)
!34 = !DILocation(line: 38, column: 90, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !10, line: 40, type: !14)
!36 = !DILocation(line: 40, column: 11, scope: !32)
!37 = !DILocation(line: 40, column: 18, scope: !32)
!38 = !DILocalVariable(name: "source", scope: !39, file: !10, line: 42, type: !23)
!39 = distinct !DILexicalBlock(scope: !32, file: !10, line: 41, column: 5)
!40 = !DILocation(line: 42, column: 13, scope: !39)
!41 = !DILocation(line: 44, column: 17, scope: !39)
!42 = !DILocation(line: 44, column: 9, scope: !39)
!43 = !DILocation(line: 45, column: 22, scope: !39)
!44 = !DILocation(line: 45, column: 9, scope: !39)
!45 = !DILocation(line: 47, column: 1, scope: !32)
