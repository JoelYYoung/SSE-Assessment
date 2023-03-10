; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !20
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !20
  store i32* %1, i32** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !31
  store i64 0, i64* %i, align 8, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !35
  %cmp = icmp ult i64 %3, 10, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !39
  %arrayidx1 = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !41
  %5 = load i32, i32* %arrayidx1, align 4, !dbg !41
  %6 = load i32*, i32** %data, align 8, !dbg !42
  %7 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !42
  store i32 %5, i32* %arrayidx2, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !46
  %inc = add i64 %8, 1, !dbg !46
  store i64 %inc, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !51
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !51
  call void @printIntLine(i32 %10), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_66b_goodG2BSink(i32** %dataArray) #0 !dbg !54 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32** %data, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !59
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !59
  store i32* %1, i32** %data, align 8, !dbg !58
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !60, metadata !DIExpression()), !dbg !62
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !62
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !62
  call void @llvm.dbg.declare(metadata i64* %i, metadata !63, metadata !DIExpression()), !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !68
  %cmp = icmp ult i64 %3, 10, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx1 = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %4, !dbg !74
  %5 = load i32, i32* %arrayidx1, align 4, !dbg !74
  %6 = load i32*, i32** %data, align 8, !dbg !75
  %7 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !75
  store i32 %5, i32* %arrayidx2, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %8, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !83
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !83
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !83
  call void @printIntLine(i32 %10), !dbg !84
  ret void, !dbg !85
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_66b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!17 = !DILocation(line: 21, column: 72, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 24, type: !14)
!19 = !DILocation(line: 24, column: 11, scope: !9)
!20 = !DILocation(line: 24, column: 18, scope: !9)
!21 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 320, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 26, column: 13, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !22, file: !10, line: 27, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 46, baseType: !30)
!29 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 27, column: 16, scope: !22)
!32 = !DILocation(line: 29, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !22, file: !10, line: 29, column: 9)
!34 = !DILocation(line: 29, column: 14, scope: !33)
!35 = !DILocation(line: 29, column: 21, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !10, line: 29, column: 9)
!37 = !DILocation(line: 29, column: 23, scope: !36)
!38 = !DILocation(line: 29, column: 9, scope: !33)
!39 = !DILocation(line: 31, column: 30, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !10, line: 30, column: 9)
!41 = !DILocation(line: 31, column: 23, scope: !40)
!42 = !DILocation(line: 31, column: 13, scope: !40)
!43 = !DILocation(line: 31, column: 18, scope: !40)
!44 = !DILocation(line: 31, column: 21, scope: !40)
!45 = !DILocation(line: 32, column: 9, scope: !40)
!46 = !DILocation(line: 29, column: 30, scope: !36)
!47 = !DILocation(line: 29, column: 9, scope: !36)
!48 = distinct !{!48, !38, !49, !50}
!49 = !DILocation(line: 32, column: 9, scope: !33)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 33, column: 22, scope: !22)
!52 = !DILocation(line: 33, column: 9, scope: !22)
!53 = !DILocation(line: 35, column: 1, scope: !9)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_loop_66b_goodG2BSink", scope: !10, file: !10, line: 42, type: !11, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "dataArray", arg: 1, scope: !54, file: !10, line: 42, type: !13)
!56 = !DILocation(line: 42, column: 76, scope: !54)
!57 = !DILocalVariable(name: "data", scope: !54, file: !10, line: 44, type: !14)
!58 = !DILocation(line: 44, column: 11, scope: !54)
!59 = !DILocation(line: 44, column: 18, scope: !54)
!60 = !DILocalVariable(name: "source", scope: !61, file: !10, line: 46, type: !23)
!61 = distinct !DILexicalBlock(scope: !54, file: !10, line: 45, column: 5)
!62 = !DILocation(line: 46, column: 13, scope: !61)
!63 = !DILocalVariable(name: "i", scope: !61, file: !10, line: 47, type: !28)
!64 = !DILocation(line: 47, column: 16, scope: !61)
!65 = !DILocation(line: 49, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !10, line: 49, column: 9)
!67 = !DILocation(line: 49, column: 14, scope: !66)
!68 = !DILocation(line: 49, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !10, line: 49, column: 9)
!70 = !DILocation(line: 49, column: 23, scope: !69)
!71 = !DILocation(line: 49, column: 9, scope: !66)
!72 = !DILocation(line: 51, column: 30, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !10, line: 50, column: 9)
!74 = !DILocation(line: 51, column: 23, scope: !73)
!75 = !DILocation(line: 51, column: 13, scope: !73)
!76 = !DILocation(line: 51, column: 18, scope: !73)
!77 = !DILocation(line: 51, column: 21, scope: !73)
!78 = !DILocation(line: 52, column: 9, scope: !73)
!79 = !DILocation(line: 49, column: 30, scope: !69)
!80 = !DILocation(line: 49, column: 9, scope: !69)
!81 = distinct !{!81, !71, !82, !50}
!82 = !DILocation(line: 52, column: 9, scope: !66)
!83 = !DILocation(line: 53, column: 22, scope: !61)
!84 = !DILocation(line: 53, column: 9, scope: !61)
!85 = !DILocation(line: 55, column: 1, scope: !54)
