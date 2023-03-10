; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !17 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64*** %dataPtr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !26
  %1 = bitcast i8* %0 to i64**, !dbg !27
  store i64** %1, i64*** %dataPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64** %data, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = load i64**, i64*** %dataPtr, align 8, !dbg !30
  %3 = load i64*, i64** %2, align 8, !dbg !31
  store i64* %3, i64** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %5, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %6, !dbg !53
  %7 = load i64, i64* %arrayidx, align 8, !dbg !53
  %8 = load i64*, i64** %data, align 8, !dbg !54
  %9 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx1 = getelementptr inbounds i64, i64* %8, i64 %9, !dbg !54
  store i64 %7, i64* %arrayidx1, align 8, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %10, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %11 = load i64*, i64** %data, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i64, i64* %11, i64 0, !dbg !63
  %12 = load i64, i64* %arrayidx2, align 8, !dbg !63
  call void @printLongLongLine(i64 %12), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !66 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i64**, align 8
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i64*** %dataPtr, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !71
  %1 = bitcast i8* %0 to i64**, !dbg !72
  store i64** %1, i64*** %dataPtr, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i64** %data, metadata !73, metadata !DIExpression()), !dbg !74
  %2 = load i64**, i64*** %dataPtr, align 8, !dbg !75
  %3 = load i64*, i64** %2, align 8, !dbg !76
  store i64* %3, i64** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !79
  call void @llvm.dbg.declare(metadata i64* %i, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !86
  %cmp = icmp ult i64 %5, 100, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %6, !dbg !92
  %7 = load i64, i64* %arrayidx, align 8, !dbg !92
  %8 = load i64*, i64** %data, align 8, !dbg !93
  %9 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i64, i64* %8, i64 %9, !dbg !93
  store i64 %7, i64* %arrayidx1, align 8, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %10, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %11 = load i64*, i64** %data, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i64, i64* %11, i64 0, !dbg !101
  %12 = load i64, i64* %arrayidx2, align 8, !dbg !101
  call void @printLongLongLine(i64 %12), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_64b_badSink", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !21}
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!22 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !17, file: !18, line: 21, type: !21)
!23 = !DILocation(line: 21, column: 88, scope: !17)
!24 = !DILocalVariable(name: "dataPtr", scope: !17, file: !18, line: 24, type: !4)
!25 = !DILocation(line: 24, column: 17, scope: !17)
!26 = !DILocation(line: 24, column: 40, scope: !17)
!27 = !DILocation(line: 24, column: 27, scope: !17)
!28 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !5)
!29 = !DILocation(line: 26, column: 15, scope: !17)
!30 = !DILocation(line: 26, column: 24, scope: !17)
!31 = !DILocation(line: 26, column: 23, scope: !17)
!32 = !DILocalVariable(name: "source", scope: !33, file: !18, line: 28, type: !34)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 27, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 28, column: 17, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !39, file: !18, line: 30, type: !40)
!39 = distinct !DILexicalBlock(scope: !33, file: !18, line: 29, column: 9)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 46, baseType: !42)
!41 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 30, column: 20, scope: !39)
!44 = !DILocation(line: 32, column: 20, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !18, line: 32, column: 13)
!46 = !DILocation(line: 32, column: 18, scope: !45)
!47 = !DILocation(line: 32, column: 25, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !18, line: 32, column: 13)
!49 = !DILocation(line: 32, column: 27, scope: !48)
!50 = !DILocation(line: 32, column: 13, scope: !45)
!51 = !DILocation(line: 34, column: 34, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !18, line: 33, column: 13)
!53 = !DILocation(line: 34, column: 27, scope: !52)
!54 = !DILocation(line: 34, column: 17, scope: !52)
!55 = !DILocation(line: 34, column: 22, scope: !52)
!56 = !DILocation(line: 34, column: 25, scope: !52)
!57 = !DILocation(line: 35, column: 13, scope: !52)
!58 = !DILocation(line: 32, column: 35, scope: !48)
!59 = !DILocation(line: 32, column: 13, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 35, column: 13, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 36, column: 31, scope: !39)
!64 = !DILocation(line: 36, column: 13, scope: !39)
!65 = !DILocation(line: 39, column: 1, scope: !17)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_64b_goodG2BSink", scope: !18, file: !18, line: 46, type: !19, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !66, file: !18, line: 46, type: !21)
!68 = !DILocation(line: 46, column: 92, scope: !66)
!69 = !DILocalVariable(name: "dataPtr", scope: !66, file: !18, line: 49, type: !4)
!70 = !DILocation(line: 49, column: 17, scope: !66)
!71 = !DILocation(line: 49, column: 40, scope: !66)
!72 = !DILocation(line: 49, column: 27, scope: !66)
!73 = !DILocalVariable(name: "data", scope: !66, file: !18, line: 51, type: !5)
!74 = !DILocation(line: 51, column: 15, scope: !66)
!75 = !DILocation(line: 51, column: 24, scope: !66)
!76 = !DILocation(line: 51, column: 23, scope: !66)
!77 = !DILocalVariable(name: "source", scope: !78, file: !18, line: 53, type: !34)
!78 = distinct !DILexicalBlock(scope: !66, file: !18, line: 52, column: 5)
!79 = !DILocation(line: 53, column: 17, scope: !78)
!80 = !DILocalVariable(name: "i", scope: !81, file: !18, line: 55, type: !40)
!81 = distinct !DILexicalBlock(scope: !78, file: !18, line: 54, column: 9)
!82 = !DILocation(line: 55, column: 20, scope: !81)
!83 = !DILocation(line: 57, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !18, line: 57, column: 13)
!85 = !DILocation(line: 57, column: 18, scope: !84)
!86 = !DILocation(line: 57, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !18, line: 57, column: 13)
!88 = !DILocation(line: 57, column: 27, scope: !87)
!89 = !DILocation(line: 57, column: 13, scope: !84)
!90 = !DILocation(line: 59, column: 34, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !18, line: 58, column: 13)
!92 = !DILocation(line: 59, column: 27, scope: !91)
!93 = !DILocation(line: 59, column: 17, scope: !91)
!94 = !DILocation(line: 59, column: 22, scope: !91)
!95 = !DILocation(line: 59, column: 25, scope: !91)
!96 = !DILocation(line: 60, column: 13, scope: !91)
!97 = !DILocation(line: 57, column: 35, scope: !87)
!98 = !DILocation(line: 57, column: 13, scope: !87)
!99 = distinct !{!99, !89, !100, !62}
!100 = !DILocation(line: 60, column: 13, scope: !84)
!101 = !DILocation(line: 61, column: 31, scope: !81)
!102 = !DILocation(line: 61, column: 13, scope: !81)
!103 = !DILocation(line: 64, column: 1, scope: !66)
