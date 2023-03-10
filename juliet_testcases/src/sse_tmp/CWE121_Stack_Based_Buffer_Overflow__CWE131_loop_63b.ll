; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i32*, i32** %0, align 8, !dbg !21
  store i32* %1, i32** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %3, 10, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !42
  %5 = load i32, i32* %arrayidx, align 4, !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %7 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !43
  store i32 %5, i32* %arrayidx1, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !47
  %inc = add i64 %8, 1, !dbg !47
  store i64 %inc, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !52
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !52
  call void @printIntLine(i32 %10), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !55 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !60
  %1 = load i32*, i32** %0, align 8, !dbg !61
  store i32* %1, i32** %data, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !62, metadata !DIExpression()), !dbg !64
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !64
  call void @llvm.dbg.declare(metadata i64* %i, metadata !65, metadata !DIExpression()), !dbg !66
  store i64 0, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !70
  %cmp = icmp ult i64 %3, 10, !dbg !72
  br i1 %cmp, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !76
  %5 = load i32, i32* %arrayidx, align 4, !dbg !76
  %6 = load i32*, i32** %data, align 8, !dbg !77
  %7 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !77
  store i32 %5, i32* %arrayidx1, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %8, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !85
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !85
  call void @printIntLine(i32 %10), !dbg !86
  ret void, !dbg !87
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_63b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!17 = !DILocation(line: 21, column: 74, scope: !9)
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
!28 = !DILocalVariable(name: "i", scope: !23, file: !10, line: 26, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 26, column: 16, scope: !23)
!33 = !DILocation(line: 28, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !23, file: !10, line: 28, column: 9)
!35 = !DILocation(line: 28, column: 14, scope: !34)
!36 = !DILocation(line: 28, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 28, column: 9)
!38 = !DILocation(line: 28, column: 23, scope: !37)
!39 = !DILocation(line: 28, column: 9, scope: !34)
!40 = !DILocation(line: 30, column: 30, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 29, column: 9)
!42 = !DILocation(line: 30, column: 23, scope: !41)
!43 = !DILocation(line: 30, column: 13, scope: !41)
!44 = !DILocation(line: 30, column: 18, scope: !41)
!45 = !DILocation(line: 30, column: 21, scope: !41)
!46 = !DILocation(line: 31, column: 9, scope: !41)
!47 = !DILocation(line: 28, column: 30, scope: !37)
!48 = !DILocation(line: 28, column: 9, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 31, column: 9, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 32, column: 22, scope: !23)
!53 = !DILocation(line: 32, column: 9, scope: !23)
!54 = !DILocation(line: 34, column: 1, scope: !9)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_63b_goodG2BSink", scope: !10, file: !10, line: 41, type: !11, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !55, file: !10, line: 41, type: !13)
!57 = !DILocation(line: 41, column: 78, scope: !55)
!58 = !DILocalVariable(name: "data", scope: !55, file: !10, line: 43, type: !14)
!59 = !DILocation(line: 43, column: 11, scope: !55)
!60 = !DILocation(line: 43, column: 19, scope: !55)
!61 = !DILocation(line: 43, column: 18, scope: !55)
!62 = !DILocalVariable(name: "source", scope: !63, file: !10, line: 45, type: !24)
!63 = distinct !DILexicalBlock(scope: !55, file: !10, line: 44, column: 5)
!64 = !DILocation(line: 45, column: 13, scope: !63)
!65 = !DILocalVariable(name: "i", scope: !63, file: !10, line: 46, type: !29)
!66 = !DILocation(line: 46, column: 16, scope: !63)
!67 = !DILocation(line: 48, column: 16, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !10, line: 48, column: 9)
!69 = !DILocation(line: 48, column: 14, scope: !68)
!70 = !DILocation(line: 48, column: 21, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !10, line: 48, column: 9)
!72 = !DILocation(line: 48, column: 23, scope: !71)
!73 = !DILocation(line: 48, column: 9, scope: !68)
!74 = !DILocation(line: 50, column: 30, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !10, line: 49, column: 9)
!76 = !DILocation(line: 50, column: 23, scope: !75)
!77 = !DILocation(line: 50, column: 13, scope: !75)
!78 = !DILocation(line: 50, column: 18, scope: !75)
!79 = !DILocation(line: 50, column: 21, scope: !75)
!80 = !DILocation(line: 51, column: 9, scope: !75)
!81 = !DILocation(line: 48, column: 30, scope: !71)
!82 = !DILocation(line: 48, column: 9, scope: !71)
!83 = distinct !{!83, !73, !84, !51}
!84 = !DILocation(line: 51, column: 9, scope: !68)
!85 = !DILocation(line: 52, column: 22, scope: !63)
!86 = !DILocation(line: 52, column: 9, scope: !63)
!87 = !DILocation(line: 54, column: 1, scope: !55)
