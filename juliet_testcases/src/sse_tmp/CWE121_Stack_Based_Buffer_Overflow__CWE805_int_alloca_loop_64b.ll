; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !22
  %1 = bitcast i8* %0 to i32**, !dbg !23
  store i32** %1, i32*** %dataPtr, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !26
  %3 = load i32*, i32** %2, align 8, !dbg !27
  store i32* %3, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [100 x i32]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 400, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %5, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !49
  %7 = load i32, i32* %arrayidx, align 4, !dbg !49
  %8 = load i32*, i32** %data, align 8, !dbg !50
  %9 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !50
  store i32 %7, i32* %arrayidx1, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %10, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !59
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !59
  call void @printIntLine(i32 %12), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !62 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !67
  %1 = bitcast i8* %0 to i32**, !dbg !68
  store i32** %1, i32*** %dataPtr, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !71
  %3 = load i32*, i32** %2, align 8, !dbg !72
  store i32* %3, i32** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !73, metadata !DIExpression()), !dbg !75
  %4 = bitcast [100 x i32]* %source to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 400, i1 false), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !82
  %cmp = icmp ult i64 %5, 100, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !88
  %7 = load i32, i32* %arrayidx, align 4, !dbg !88
  %8 = load i32*, i32** %data, align 8, !dbg !89
  %9 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx1 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !89
  store i32 %7, i32* %arrayidx1, align 4, !dbg !91
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !93
  %inc = add i64 %10, 1, !dbg !93
  store i64 %inc, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !97
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !97
  call void @printIntLine(i32 %12), !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 21, type: !17)
!19 = !DILocation(line: 21, column: 84, scope: !13)
!20 = !DILocalVariable(name: "dataPtr", scope: !13, file: !14, line: 24, type: !4)
!21 = !DILocation(line: 24, column: 13, scope: !13)
!22 = !DILocation(line: 24, column: 32, scope: !13)
!23 = !DILocation(line: 24, column: 23, scope: !13)
!24 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 26, type: !5)
!25 = !DILocation(line: 26, column: 11, scope: !13)
!26 = !DILocation(line: 26, column: 20, scope: !13)
!27 = !DILocation(line: 26, column: 19, scope: !13)
!28 = !DILocalVariable(name: "source", scope: !29, file: !14, line: 28, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 27, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 28, column: 13, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !14, line: 30, type: !36)
!35 = distinct !DILexicalBlock(scope: !29, file: !14, line: 29, column: 9)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 30, column: 20, scope: !35)
!40 = !DILocation(line: 32, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !14, line: 32, column: 13)
!42 = !DILocation(line: 32, column: 18, scope: !41)
!43 = !DILocation(line: 32, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !14, line: 32, column: 13)
!45 = !DILocation(line: 32, column: 27, scope: !44)
!46 = !DILocation(line: 32, column: 13, scope: !41)
!47 = !DILocation(line: 34, column: 34, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !14, line: 33, column: 13)
!49 = !DILocation(line: 34, column: 27, scope: !48)
!50 = !DILocation(line: 34, column: 17, scope: !48)
!51 = !DILocation(line: 34, column: 22, scope: !48)
!52 = !DILocation(line: 34, column: 25, scope: !48)
!53 = !DILocation(line: 35, column: 13, scope: !48)
!54 = !DILocation(line: 32, column: 35, scope: !44)
!55 = !DILocation(line: 32, column: 13, scope: !44)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 35, column: 13, scope: !41)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 36, column: 26, scope: !35)
!60 = !DILocation(line: 36, column: 13, scope: !35)
!61 = !DILocation(line: 39, column: 1, scope: !13)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_64b_goodG2BSink", scope: !14, file: !14, line: 46, type: !15, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !62, file: !14, line: 46, type: !17)
!64 = !DILocation(line: 46, column: 88, scope: !62)
!65 = !DILocalVariable(name: "dataPtr", scope: !62, file: !14, line: 49, type: !4)
!66 = !DILocation(line: 49, column: 13, scope: !62)
!67 = !DILocation(line: 49, column: 32, scope: !62)
!68 = !DILocation(line: 49, column: 23, scope: !62)
!69 = !DILocalVariable(name: "data", scope: !62, file: !14, line: 51, type: !5)
!70 = !DILocation(line: 51, column: 11, scope: !62)
!71 = !DILocation(line: 51, column: 20, scope: !62)
!72 = !DILocation(line: 51, column: 19, scope: !62)
!73 = !DILocalVariable(name: "source", scope: !74, file: !14, line: 53, type: !30)
!74 = distinct !DILexicalBlock(scope: !62, file: !14, line: 52, column: 5)
!75 = !DILocation(line: 53, column: 13, scope: !74)
!76 = !DILocalVariable(name: "i", scope: !77, file: !14, line: 55, type: !36)
!77 = distinct !DILexicalBlock(scope: !74, file: !14, line: 54, column: 9)
!78 = !DILocation(line: 55, column: 20, scope: !77)
!79 = !DILocation(line: 57, column: 20, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !14, line: 57, column: 13)
!81 = !DILocation(line: 57, column: 18, scope: !80)
!82 = !DILocation(line: 57, column: 25, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !14, line: 57, column: 13)
!84 = !DILocation(line: 57, column: 27, scope: !83)
!85 = !DILocation(line: 57, column: 13, scope: !80)
!86 = !DILocation(line: 59, column: 34, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !14, line: 58, column: 13)
!88 = !DILocation(line: 59, column: 27, scope: !87)
!89 = !DILocation(line: 59, column: 17, scope: !87)
!90 = !DILocation(line: 59, column: 22, scope: !87)
!91 = !DILocation(line: 59, column: 25, scope: !87)
!92 = !DILocation(line: 60, column: 13, scope: !87)
!93 = !DILocation(line: 57, column: 35, scope: !83)
!94 = !DILocation(line: 57, column: 13, scope: !83)
!95 = distinct !{!95, !85, !96, !58}
!96 = !DILocation(line: 60, column: 13, scope: !80)
!97 = !DILocation(line: 61, column: 26, scope: !77)
!98 = !DILocation(line: 61, column: 13, scope: !77)
!99 = !DILocation(line: 64, column: 1, scope: !62)
