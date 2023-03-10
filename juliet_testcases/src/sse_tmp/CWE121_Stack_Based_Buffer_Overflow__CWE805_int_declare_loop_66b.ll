; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
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
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %3, 100, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !42
  %5 = load i32, i32* %arrayidx1, align 4, !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %7 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !43
  store i32 %5, i32* %arrayidx2, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !47
  %inc = add i64 %8, 1, !dbg !47
  store i64 %inc, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !52
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !52
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !52
  call void @printIntLine(i32 %10), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_66b_goodG2BSink(i32** %dataArray) #0 !dbg !55 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32** %data, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !60
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !60
  store i32* %1, i32** %data, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !61, metadata !DIExpression()), !dbg !63
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !63
  call void @llvm.dbg.declare(metadata i64* %i, metadata !64, metadata !DIExpression()), !dbg !66
  store i64 0, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !70
  %cmp = icmp ult i64 %3, 100, !dbg !72
  br i1 %cmp, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !76
  %5 = load i32, i32* %arrayidx1, align 4, !dbg !76
  %6 = load i32*, i32** %data, align 8, !dbg !77
  %7 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !77
  store i32 %5, i32* %arrayidx2, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %8, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !85
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !85
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_66b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!17 = !DILocation(line: 21, column: 84, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 24, type: !14)
!19 = !DILocation(line: 24, column: 11, scope: !9)
!20 = !DILocation(line: 24, column: 18, scope: !9)
!21 = !DILocalVariable(name: "source", scope: !22, file: !10, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 13, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !28, file: !10, line: 28, type: !29)
!28 = distinct !DILexicalBlock(scope: !22, file: !10, line: 27, column: 9)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !30, line: 46, baseType: !31)
!30 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!31 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 28, column: 20, scope: !28)
!33 = !DILocation(line: 30, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !10, line: 30, column: 13)
!35 = !DILocation(line: 30, column: 18, scope: !34)
!36 = !DILocation(line: 30, column: 25, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 30, column: 13)
!38 = !DILocation(line: 30, column: 27, scope: !37)
!39 = !DILocation(line: 30, column: 13, scope: !34)
!40 = !DILocation(line: 32, column: 34, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 31, column: 13)
!42 = !DILocation(line: 32, column: 27, scope: !41)
!43 = !DILocation(line: 32, column: 17, scope: !41)
!44 = !DILocation(line: 32, column: 22, scope: !41)
!45 = !DILocation(line: 32, column: 25, scope: !41)
!46 = !DILocation(line: 33, column: 13, scope: !41)
!47 = !DILocation(line: 30, column: 35, scope: !37)
!48 = !DILocation(line: 30, column: 13, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 33, column: 13, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 34, column: 26, scope: !28)
!53 = !DILocation(line: 34, column: 13, scope: !28)
!54 = !DILocation(line: 37, column: 1, scope: !9)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_66b_goodG2BSink", scope: !10, file: !10, line: 44, type: !11, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocalVariable(name: "dataArray", arg: 1, scope: !55, file: !10, line: 44, type: !13)
!57 = !DILocation(line: 44, column: 88, scope: !55)
!58 = !DILocalVariable(name: "data", scope: !55, file: !10, line: 46, type: !14)
!59 = !DILocation(line: 46, column: 11, scope: !55)
!60 = !DILocation(line: 46, column: 18, scope: !55)
!61 = !DILocalVariable(name: "source", scope: !62, file: !10, line: 48, type: !23)
!62 = distinct !DILexicalBlock(scope: !55, file: !10, line: 47, column: 5)
!63 = !DILocation(line: 48, column: 13, scope: !62)
!64 = !DILocalVariable(name: "i", scope: !65, file: !10, line: 50, type: !29)
!65 = distinct !DILexicalBlock(scope: !62, file: !10, line: 49, column: 9)
!66 = !DILocation(line: 50, column: 20, scope: !65)
!67 = !DILocation(line: 52, column: 20, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !10, line: 52, column: 13)
!69 = !DILocation(line: 52, column: 18, scope: !68)
!70 = !DILocation(line: 52, column: 25, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !10, line: 52, column: 13)
!72 = !DILocation(line: 52, column: 27, scope: !71)
!73 = !DILocation(line: 52, column: 13, scope: !68)
!74 = !DILocation(line: 54, column: 34, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !10, line: 53, column: 13)
!76 = !DILocation(line: 54, column: 27, scope: !75)
!77 = !DILocation(line: 54, column: 17, scope: !75)
!78 = !DILocation(line: 54, column: 22, scope: !75)
!79 = !DILocation(line: 54, column: 25, scope: !75)
!80 = !DILocation(line: 55, column: 13, scope: !75)
!81 = !DILocation(line: 52, column: 35, scope: !71)
!82 = !DILocation(line: 52, column: 13, scope: !71)
!83 = distinct !{!83, !73, !84, !51}
!84 = !DILocation(line: 55, column: 13, scope: !68)
!85 = !DILocation(line: 56, column: 26, scope: !65)
!86 = !DILocation(line: 56, column: 13, scope: !65)
!87 = !DILocation(line: 59, column: 1, scope: !55)
