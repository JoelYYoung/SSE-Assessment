; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_63b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_63b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_63b_badSink(i32** %dataPtr) #0 !dbg !9 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !20
  %1 = load i32*, i32** %0, align 8, !dbg !21
  store i32* %1, i32** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %3, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !43
  %5 = load i32, i32* %arrayidx, align 4, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !44
  %7 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !44
  store i32 %5, i32* %arrayidx1, align 4, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %8, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !53
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !53
  call void @printIntLine(i32 %10), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_63b_goodG2BSink(i32** %dataPtr) #0 !dbg !56 {
entry:
  %dataPtr.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i32** %dataPtr, i32*** %dataPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataPtr.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32** %data, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = load i32**, i32*** %dataPtr.addr, align 8, !dbg !61
  %1 = load i32*, i32** %0, align 8, !dbg !62
  store i32* %1, i32** %data, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !63, metadata !DIExpression()), !dbg !65
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !65
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !65
  call void @llvm.dbg.declare(metadata i64* %i, metadata !66, metadata !DIExpression()), !dbg !68
  store i64 0, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !72
  %cmp = icmp ult i64 %3, 100, !dbg !74
  br i1 %cmp, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !78
  %5 = load i32, i32* %arrayidx, align 4, !dbg !78
  %6 = load i32*, i32** %data, align 8, !dbg !79
  %7 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !79
  store i32 %5, i32* %arrayidx1, align 4, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %8, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !87
  %arrayidx2 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !87
  %10 = load i32, i32* %arrayidx2, align 4, !dbg !87
  call void @printIntLine(i32 %10), !dbg !88
  ret void, !dbg !89
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_63b_badSink", scope: !10, file: !10, line: 21, type: !11, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_63b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !9, file: !10, line: 21, type: !13)
!17 = !DILocation(line: 21, column: 85, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 23, type: !14)
!19 = !DILocation(line: 23, column: 11, scope: !9)
!20 = !DILocation(line: 23, column: 19, scope: !9)
!21 = !DILocation(line: 23, column: 18, scope: !9)
!22 = !DILocalVariable(name: "source", scope: !23, file: !10, line: 25, type: !24)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 24, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 25, column: 13, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !29, file: !10, line: 27, type: !30)
!29 = distinct !DILexicalBlock(scope: !23, file: !10, line: 26, column: 9)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 46, baseType: !32)
!31 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!32 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 27, column: 20, scope: !29)
!34 = !DILocation(line: 29, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !10, line: 29, column: 13)
!36 = !DILocation(line: 29, column: 18, scope: !35)
!37 = !DILocation(line: 29, column: 25, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 29, column: 13)
!39 = !DILocation(line: 29, column: 27, scope: !38)
!40 = !DILocation(line: 29, column: 13, scope: !35)
!41 = !DILocation(line: 31, column: 34, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !10, line: 30, column: 13)
!43 = !DILocation(line: 31, column: 27, scope: !42)
!44 = !DILocation(line: 31, column: 17, scope: !42)
!45 = !DILocation(line: 31, column: 22, scope: !42)
!46 = !DILocation(line: 31, column: 25, scope: !42)
!47 = !DILocation(line: 32, column: 13, scope: !42)
!48 = !DILocation(line: 29, column: 35, scope: !38)
!49 = !DILocation(line: 29, column: 13, scope: !38)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 32, column: 13, scope: !35)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 33, column: 26, scope: !29)
!54 = !DILocation(line: 33, column: 13, scope: !29)
!55 = !DILocation(line: 36, column: 1, scope: !9)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_63b_goodG2BSink", scope: !10, file: !10, line: 43, type: !11, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "dataPtr", arg: 1, scope: !56, file: !10, line: 43, type: !13)
!58 = !DILocation(line: 43, column: 89, scope: !56)
!59 = !DILocalVariable(name: "data", scope: !56, file: !10, line: 45, type: !14)
!60 = !DILocation(line: 45, column: 11, scope: !56)
!61 = !DILocation(line: 45, column: 19, scope: !56)
!62 = !DILocation(line: 45, column: 18, scope: !56)
!63 = !DILocalVariable(name: "source", scope: !64, file: !10, line: 47, type: !24)
!64 = distinct !DILexicalBlock(scope: !56, file: !10, line: 46, column: 5)
!65 = !DILocation(line: 47, column: 13, scope: !64)
!66 = !DILocalVariable(name: "i", scope: !67, file: !10, line: 49, type: !30)
!67 = distinct !DILexicalBlock(scope: !64, file: !10, line: 48, column: 9)
!68 = !DILocation(line: 49, column: 20, scope: !67)
!69 = !DILocation(line: 51, column: 20, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !10, line: 51, column: 13)
!71 = !DILocation(line: 51, column: 18, scope: !70)
!72 = !DILocation(line: 51, column: 25, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !10, line: 51, column: 13)
!74 = !DILocation(line: 51, column: 27, scope: !73)
!75 = !DILocation(line: 51, column: 13, scope: !70)
!76 = !DILocation(line: 53, column: 34, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !10, line: 52, column: 13)
!78 = !DILocation(line: 53, column: 27, scope: !77)
!79 = !DILocation(line: 53, column: 17, scope: !77)
!80 = !DILocation(line: 53, column: 22, scope: !77)
!81 = !DILocation(line: 53, column: 25, scope: !77)
!82 = !DILocation(line: 54, column: 13, scope: !77)
!83 = !DILocation(line: 51, column: 35, scope: !73)
!84 = !DILocation(line: 51, column: 13, scope: !73)
!85 = distinct !{!85, !75, !86, !52}
!86 = !DILocation(line: 54, column: 13, scope: !70)
!87 = !DILocation(line: 55, column: 26, scope: !67)
!88 = !DILocation(line: 55, column: 13, scope: !67)
!89 = !DILocation(line: 58, column: 1, scope: !56)
