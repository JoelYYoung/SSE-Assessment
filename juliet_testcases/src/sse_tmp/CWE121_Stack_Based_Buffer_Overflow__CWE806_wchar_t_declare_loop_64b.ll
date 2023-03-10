; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !15 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !24
  %1 = bitcast i8* %0 to i32**, !dbg !25
  store i32** %1, i32*** %dataPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !28
  %3 = load i32*, i32** %2, align 8, !dbg !29
  store i32* %3, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !40, metadata !DIExpression()), !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !42
  %call = call i64 @wcslen(i32* %5) #5, !dbg !43
  store i64 %call, i64* %dataLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !48
  %7 = load i64, i64* %dataLen, align 8, !dbg !50
  %cmp = icmp ult i64 %6, %7, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !53
  %9 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !53
  %10 = load i32, i32* %arrayidx, align 4, !dbg !53
  %11 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !57
  store i32 %10, i32* %arrayidx1, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %12, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !65
  store i32 0, i32* %arrayidx2, align 4, !dbg !66
  %13 = load i32*, i32** %data, align 8, !dbg !67
  call void @printWLine(i32* %13), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !70 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !75
  %1 = bitcast i8* %0 to i32**, !dbg !76
  store i32** %1, i32*** %dataPtr, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !79
  %3 = load i32*, i32** %2, align 8, !dbg !80
  store i32* %3, i32** %data, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !81, metadata !DIExpression()), !dbg !83
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !83
  call void @llvm.dbg.declare(metadata i64* %i, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !86, metadata !DIExpression()), !dbg !87
  %5 = load i32*, i32** %data, align 8, !dbg !88
  %call = call i64 @wcslen(i32* %5) #5, !dbg !89
  store i64 %call, i64* %dataLen, align 8, !dbg !90
  store i64 0, i64* %i, align 8, !dbg !91
  br label %for.cond, !dbg !93

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !94
  %7 = load i64, i64* %dataLen, align 8, !dbg !96
  %cmp = icmp ult i64 %6, %7, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !99
  %9 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !99
  %10 = load i32, i32* %arrayidx, align 4, !dbg !99
  %11 = load i64, i64* %i, align 8, !dbg !102
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !103
  store i32 %10, i32* %arrayidx1, align 4, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !106
  %inc = add i64 %12, 1, !dbg !106
  store i64 %inc, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !110
  store i32 0, i32* %arrayidx2, align 4, !dbg !111
  %13 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %13), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_64b_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !15, file: !16, line: 23, type: !19)
!21 = !DILocation(line: 23, column: 89, scope: !15)
!22 = !DILocalVariable(name: "dataPtr", scope: !15, file: !16, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 17, scope: !15)
!24 = !DILocation(line: 26, column: 40, scope: !15)
!25 = !DILocation(line: 26, column: 27, scope: !15)
!26 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !5)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 24, scope: !15)
!29 = !DILocation(line: 28, column: 23, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 30, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 30, column: 17, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !31, file: !16, line: 31, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !38)
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 31, column: 16, scope: !31)
!40 = !DILocalVariable(name: "dataLen", scope: !31, file: !16, line: 31, type: !37)
!41 = !DILocation(line: 31, column: 19, scope: !31)
!42 = !DILocation(line: 32, column: 26, scope: !31)
!43 = !DILocation(line: 32, column: 19, scope: !31)
!44 = !DILocation(line: 32, column: 17, scope: !31)
!45 = !DILocation(line: 34, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !31, file: !16, line: 34, column: 9)
!47 = !DILocation(line: 34, column: 14, scope: !46)
!48 = !DILocation(line: 34, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !16, line: 34, column: 9)
!50 = !DILocation(line: 34, column: 25, scope: !49)
!51 = !DILocation(line: 34, column: 23, scope: !49)
!52 = !DILocation(line: 34, column: 9, scope: !46)
!53 = !DILocation(line: 36, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !16, line: 35, column: 9)
!55 = !DILocation(line: 36, column: 28, scope: !54)
!56 = !DILocation(line: 36, column: 18, scope: !54)
!57 = !DILocation(line: 36, column: 13, scope: !54)
!58 = !DILocation(line: 36, column: 21, scope: !54)
!59 = !DILocation(line: 37, column: 9, scope: !54)
!60 = !DILocation(line: 34, column: 35, scope: !49)
!61 = !DILocation(line: 34, column: 9, scope: !49)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 37, column: 9, scope: !46)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 38, column: 9, scope: !31)
!66 = !DILocation(line: 38, column: 20, scope: !31)
!67 = !DILocation(line: 39, column: 20, scope: !31)
!68 = !DILocation(line: 39, column: 9, scope: !31)
!69 = !DILocation(line: 41, column: 1, scope: !15)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_64b_goodG2BSink", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !70, file: !16, line: 48, type: !19)
!72 = !DILocation(line: 48, column: 93, scope: !70)
!73 = !DILocalVariable(name: "dataPtr", scope: !70, file: !16, line: 51, type: !4)
!74 = !DILocation(line: 51, column: 17, scope: !70)
!75 = !DILocation(line: 51, column: 40, scope: !70)
!76 = !DILocation(line: 51, column: 27, scope: !70)
!77 = !DILocalVariable(name: "data", scope: !70, file: !16, line: 53, type: !5)
!78 = !DILocation(line: 53, column: 15, scope: !70)
!79 = !DILocation(line: 53, column: 24, scope: !70)
!80 = !DILocation(line: 53, column: 23, scope: !70)
!81 = !DILocalVariable(name: "dest", scope: !82, file: !16, line: 55, type: !32)
!82 = distinct !DILexicalBlock(scope: !70, file: !16, line: 54, column: 5)
!83 = !DILocation(line: 55, column: 17, scope: !82)
!84 = !DILocalVariable(name: "i", scope: !82, file: !16, line: 56, type: !37)
!85 = !DILocation(line: 56, column: 16, scope: !82)
!86 = !DILocalVariable(name: "dataLen", scope: !82, file: !16, line: 56, type: !37)
!87 = !DILocation(line: 56, column: 19, scope: !82)
!88 = !DILocation(line: 57, column: 26, scope: !82)
!89 = !DILocation(line: 57, column: 19, scope: !82)
!90 = !DILocation(line: 57, column: 17, scope: !82)
!91 = !DILocation(line: 59, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !82, file: !16, line: 59, column: 9)
!93 = !DILocation(line: 59, column: 14, scope: !92)
!94 = !DILocation(line: 59, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !16, line: 59, column: 9)
!96 = !DILocation(line: 59, column: 25, scope: !95)
!97 = !DILocation(line: 59, column: 23, scope: !95)
!98 = !DILocation(line: 59, column: 9, scope: !92)
!99 = !DILocation(line: 61, column: 23, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !16, line: 60, column: 9)
!101 = !DILocation(line: 61, column: 28, scope: !100)
!102 = !DILocation(line: 61, column: 18, scope: !100)
!103 = !DILocation(line: 61, column: 13, scope: !100)
!104 = !DILocation(line: 61, column: 21, scope: !100)
!105 = !DILocation(line: 62, column: 9, scope: !100)
!106 = !DILocation(line: 59, column: 35, scope: !95)
!107 = !DILocation(line: 59, column: 9, scope: !95)
!108 = distinct !{!108, !98, !109, !64}
!109 = !DILocation(line: 62, column: 9, scope: !92)
!110 = !DILocation(line: 63, column: 9, scope: !82)
!111 = !DILocation(line: 63, column: 20, scope: !82)
!112 = !DILocation(line: 64, column: 20, scope: !82)
!113 = !DILocation(line: 64, column: 9, scope: !82)
!114 = !DILocation(line: 66, column: 1, scope: !70)
