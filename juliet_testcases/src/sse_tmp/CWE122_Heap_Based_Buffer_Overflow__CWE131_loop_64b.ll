; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !13 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
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
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %5, 10, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !48
  %7 = load i32, i32* %arrayidx, align 4, !dbg !48
  %8 = load i32*, i32** %data, align 8, !dbg !49
  %9 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx1 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !49
  store i32 %7, i32* %arrayidx1, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %10, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !58
  %12 = load i32, i32* %arrayidx2, align 4, !dbg !58
  call void @printIntLine(i32 %12), !dbg !59
  %13 = load i32*, i32** %data, align 8, !dbg !60
  %14 = bitcast i32* %13 to i8*, !dbg !60
  call void @free(i8* %14) #5, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !63 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !68
  %1 = bitcast i8* %0 to i32**, !dbg !69
  store i32** %1, i32*** %dataPtr, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !72
  %3 = load i32*, i32** %2, align 8, !dbg !73
  store i32* %3, i32** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !74, metadata !DIExpression()), !dbg !76
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !82
  %cmp = icmp ult i64 %5, 10, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !88
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
  %13 = load i32*, i32** %data, align 8, !dbg !99
  %14 = bitcast i32* %13 to i8*, !dbg !99
  call void @free(i8* %14) #5, !dbg !100
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_64b_badSink", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !13, file: !14, line: 21, type: !17)
!19 = !DILocation(line: 21, column: 72, scope: !13)
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
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 28, column: 13, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !29, file: !14, line: 29, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 46, baseType: !37)
!36 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 29, column: 16, scope: !29)
!39 = !DILocation(line: 31, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !29, file: !14, line: 31, column: 9)
!41 = !DILocation(line: 31, column: 14, scope: !40)
!42 = !DILocation(line: 31, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !14, line: 31, column: 9)
!44 = !DILocation(line: 31, column: 23, scope: !43)
!45 = !DILocation(line: 31, column: 9, scope: !40)
!46 = !DILocation(line: 33, column: 30, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !14, line: 32, column: 9)
!48 = !DILocation(line: 33, column: 23, scope: !47)
!49 = !DILocation(line: 33, column: 13, scope: !47)
!50 = !DILocation(line: 33, column: 18, scope: !47)
!51 = !DILocation(line: 33, column: 21, scope: !47)
!52 = !DILocation(line: 34, column: 9, scope: !47)
!53 = !DILocation(line: 31, column: 30, scope: !43)
!54 = !DILocation(line: 31, column: 9, scope: !43)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 34, column: 9, scope: !40)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 35, column: 22, scope: !29)
!59 = !DILocation(line: 35, column: 9, scope: !29)
!60 = !DILocation(line: 36, column: 14, scope: !29)
!61 = !DILocation(line: 36, column: 9, scope: !29)
!62 = !DILocation(line: 38, column: 1, scope: !13)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_64b_goodG2BSink", scope: !14, file: !14, line: 45, type: !15, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !63, file: !14, line: 45, type: !17)
!65 = !DILocation(line: 45, column: 76, scope: !63)
!66 = !DILocalVariable(name: "dataPtr", scope: !63, file: !14, line: 48, type: !4)
!67 = !DILocation(line: 48, column: 13, scope: !63)
!68 = !DILocation(line: 48, column: 32, scope: !63)
!69 = !DILocation(line: 48, column: 23, scope: !63)
!70 = !DILocalVariable(name: "data", scope: !63, file: !14, line: 50, type: !5)
!71 = !DILocation(line: 50, column: 11, scope: !63)
!72 = !DILocation(line: 50, column: 20, scope: !63)
!73 = !DILocation(line: 50, column: 19, scope: !63)
!74 = !DILocalVariable(name: "source", scope: !75, file: !14, line: 52, type: !30)
!75 = distinct !DILexicalBlock(scope: !63, file: !14, line: 51, column: 5)
!76 = !DILocation(line: 52, column: 13, scope: !75)
!77 = !DILocalVariable(name: "i", scope: !75, file: !14, line: 53, type: !35)
!78 = !DILocation(line: 53, column: 16, scope: !75)
!79 = !DILocation(line: 55, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !14, line: 55, column: 9)
!81 = !DILocation(line: 55, column: 14, scope: !80)
!82 = !DILocation(line: 55, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !14, line: 55, column: 9)
!84 = !DILocation(line: 55, column: 23, scope: !83)
!85 = !DILocation(line: 55, column: 9, scope: !80)
!86 = !DILocation(line: 57, column: 30, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !14, line: 56, column: 9)
!88 = !DILocation(line: 57, column: 23, scope: !87)
!89 = !DILocation(line: 57, column: 13, scope: !87)
!90 = !DILocation(line: 57, column: 18, scope: !87)
!91 = !DILocation(line: 57, column: 21, scope: !87)
!92 = !DILocation(line: 58, column: 9, scope: !87)
!93 = !DILocation(line: 55, column: 30, scope: !83)
!94 = !DILocation(line: 55, column: 9, scope: !83)
!95 = distinct !{!95, !85, !96, !57}
!96 = !DILocation(line: 58, column: 9, scope: !80)
!97 = !DILocation(line: 59, column: 22, scope: !75)
!98 = !DILocation(line: 59, column: 9, scope: !75)
!99 = !DILocation(line: 60, column: 14, scope: !75)
!100 = !DILocation(line: 60, column: 9, scope: !75)
!101 = !DILocation(line: 62, column: 1, scope: !63)
