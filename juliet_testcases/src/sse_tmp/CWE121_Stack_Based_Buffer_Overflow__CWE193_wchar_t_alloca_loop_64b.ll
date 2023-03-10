; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !15 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
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
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b_badSink.source to i8*), i64 44, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !40, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !42
  %call = call i64 @wcslen(i32* %arraydecay) #5, !dbg !43
  store i64 %call, i64* %sourceLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !48
  %6 = load i64, i64* %sourceLen, align 8, !dbg !50
  %add = add i64 %6, 1, !dbg !51
  %cmp = icmp ult i64 %5, %add, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %7, !dbg !56
  %8 = load i32, i32* %arrayidx, align 4, !dbg !56
  %9 = load i32*, i32** %data, align 8, !dbg !57
  %10 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !57
  store i32 %8, i32* %arrayidx1, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %11, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !66
  call void @printWLine(i32* %12), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !69 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !74
  %1 = bitcast i8* %0 to i32**, !dbg !75
  store i32** %1, i32*** %dataPtr, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !78
  %3 = load i32*, i32** %2, align 8, !dbg !79
  store i32* %3, i32** %data, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !82
  call void @llvm.dbg.declare(metadata i64* %i, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !87
  %call = call i64 @wcslen(i32* %arraydecay) #5, !dbg !88
  store i64 %call, i64* %sourceLen, align 8, !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !93
  %6 = load i64, i64* %sourceLen, align 8, !dbg !95
  %add = add i64 %6, 1, !dbg !96
  %cmp = icmp ult i64 %5, %add, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %7, !dbg !101
  %8 = load i32, i32* %arrayidx, align 4, !dbg !101
  %9 = load i32*, i32** %data, align 8, !dbg !102
  %10 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !102
  store i32 %8, i32* %arrayidx1, align 4, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !106
  %inc = add i64 %11, 1, !dbg !106
  store i64 %inc, i64* %i, align 8, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %12), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b_badSink", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !15, file: !16, line: 28, type: !19)
!21 = !DILocation(line: 28, column: 88, scope: !15)
!22 = !DILocalVariable(name: "dataPtr", scope: !15, file: !16, line: 31, type: !4)
!23 = !DILocation(line: 31, column: 17, scope: !15)
!24 = !DILocation(line: 31, column: 40, scope: !15)
!25 = !DILocation(line: 31, column: 27, scope: !15)
!26 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 33, type: !5)
!27 = !DILocation(line: 33, column: 15, scope: !15)
!28 = !DILocation(line: 33, column: 24, scope: !15)
!29 = !DILocation(line: 33, column: 23, scope: !15)
!30 = !DILocalVariable(name: "source", scope: !31, file: !16, line: 35, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 35, column: 17, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !31, file: !16, line: 36, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !38)
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 36, column: 16, scope: !31)
!40 = !DILocalVariable(name: "sourceLen", scope: !31, file: !16, line: 36, type: !37)
!41 = !DILocation(line: 36, column: 19, scope: !31)
!42 = !DILocation(line: 37, column: 28, scope: !31)
!43 = !DILocation(line: 37, column: 21, scope: !31)
!44 = !DILocation(line: 37, column: 19, scope: !31)
!45 = !DILocation(line: 40, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !31, file: !16, line: 40, column: 9)
!47 = !DILocation(line: 40, column: 14, scope: !46)
!48 = !DILocation(line: 40, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !16, line: 40, column: 9)
!50 = !DILocation(line: 40, column: 25, scope: !49)
!51 = !DILocation(line: 40, column: 35, scope: !49)
!52 = !DILocation(line: 40, column: 23, scope: !49)
!53 = !DILocation(line: 40, column: 9, scope: !46)
!54 = !DILocation(line: 42, column: 30, scope: !55)
!55 = distinct !DILexicalBlock(scope: !49, file: !16, line: 41, column: 9)
!56 = !DILocation(line: 42, column: 23, scope: !55)
!57 = !DILocation(line: 42, column: 13, scope: !55)
!58 = !DILocation(line: 42, column: 18, scope: !55)
!59 = !DILocation(line: 42, column: 21, scope: !55)
!60 = !DILocation(line: 43, column: 9, scope: !55)
!61 = !DILocation(line: 40, column: 41, scope: !49)
!62 = !DILocation(line: 40, column: 9, scope: !49)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 43, column: 9, scope: !46)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 44, column: 20, scope: !31)
!67 = !DILocation(line: 44, column: 9, scope: !31)
!68 = !DILocation(line: 46, column: 1, scope: !15)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_64b_goodG2BSink", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !69, file: !16, line: 53, type: !19)
!71 = !DILocation(line: 53, column: 92, scope: !69)
!72 = !DILocalVariable(name: "dataPtr", scope: !69, file: !16, line: 56, type: !4)
!73 = !DILocation(line: 56, column: 17, scope: !69)
!74 = !DILocation(line: 56, column: 40, scope: !69)
!75 = !DILocation(line: 56, column: 27, scope: !69)
!76 = !DILocalVariable(name: "data", scope: !69, file: !16, line: 58, type: !5)
!77 = !DILocation(line: 58, column: 15, scope: !69)
!78 = !DILocation(line: 58, column: 24, scope: !69)
!79 = !DILocation(line: 58, column: 23, scope: !69)
!80 = !DILocalVariable(name: "source", scope: !81, file: !16, line: 60, type: !32)
!81 = distinct !DILexicalBlock(scope: !69, file: !16, line: 59, column: 5)
!82 = !DILocation(line: 60, column: 17, scope: !81)
!83 = !DILocalVariable(name: "i", scope: !81, file: !16, line: 61, type: !37)
!84 = !DILocation(line: 61, column: 16, scope: !81)
!85 = !DILocalVariable(name: "sourceLen", scope: !81, file: !16, line: 61, type: !37)
!86 = !DILocation(line: 61, column: 19, scope: !81)
!87 = !DILocation(line: 62, column: 28, scope: !81)
!88 = !DILocation(line: 62, column: 21, scope: !81)
!89 = !DILocation(line: 62, column: 19, scope: !81)
!90 = !DILocation(line: 65, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !81, file: !16, line: 65, column: 9)
!92 = !DILocation(line: 65, column: 14, scope: !91)
!93 = !DILocation(line: 65, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !16, line: 65, column: 9)
!95 = !DILocation(line: 65, column: 25, scope: !94)
!96 = !DILocation(line: 65, column: 35, scope: !94)
!97 = !DILocation(line: 65, column: 23, scope: !94)
!98 = !DILocation(line: 65, column: 9, scope: !91)
!99 = !DILocation(line: 67, column: 30, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !16, line: 66, column: 9)
!101 = !DILocation(line: 67, column: 23, scope: !100)
!102 = !DILocation(line: 67, column: 13, scope: !100)
!103 = !DILocation(line: 67, column: 18, scope: !100)
!104 = !DILocation(line: 67, column: 21, scope: !100)
!105 = !DILocation(line: 68, column: 9, scope: !100)
!106 = !DILocation(line: 65, column: 41, scope: !94)
!107 = !DILocation(line: 65, column: 9, scope: !94)
!108 = distinct !{!108, !98, !109, !65}
!109 = !DILocation(line: 68, column: 9, scope: !91)
!110 = !DILocation(line: 69, column: 20, scope: !81)
!111 = !DILocation(line: 69, column: 9, scope: !81)
!112 = !DILocation(line: 71, column: 1, scope: !69)
