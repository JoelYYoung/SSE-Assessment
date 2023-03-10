; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !15 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
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
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !40
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !41
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !47
  %cmp = icmp ult i64 %4, 100, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !53
  %6 = load i32, i32* %arrayidx1, align 4, !dbg !53
  %7 = load i32*, i32** %data, align 8, !dbg !54
  %8 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !54
  store i32 %6, i32* %arrayidx2, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %9, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !63
  store i32 0, i32* %arrayidx3, align 4, !dbg !64
  %11 = load i32*, i32** %data, align 8, !dbg !65
  call void @printWLine(i32* %11), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !68 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !73
  %1 = bitcast i8* %0 to i32**, !dbg !74
  store i32** %1, i32*** %dataPtr, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !77
  %3 = load i32*, i32** %2, align 8, !dbg !78
  store i32* %3, i32** %data, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !85
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !91
  %cmp = icmp ult i64 %4, 100, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %5, !dbg !97
  %6 = load i32, i32* %arrayidx1, align 4, !dbg !97
  %7 = load i32*, i32** %data, align 8, !dbg !98
  %8 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !98
  store i32 %6, i32* %arrayidx2, align 4, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !102
  %inc = add i64 %9, 1, !dbg !102
  store i64 %inc, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !106
  store i32 0, i32* %arrayidx3, align 4, !dbg !107
  %11 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %11), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_64b_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !15, file: !16, line: 23, type: !19)
!21 = !DILocation(line: 23, column: 88, scope: !15)
!22 = !DILocalVariable(name: "dataPtr", scope: !15, file: !16, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 17, scope: !15)
!24 = !DILocation(line: 26, column: 40, scope: !15)
!25 = !DILocation(line: 26, column: 27, scope: !15)
!26 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 28, type: !5)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 24, scope: !15)
!29 = !DILocation(line: 28, column: 23, scope: !15)
!30 = !DILocalVariable(name: "i", scope: !31, file: !16, line: 30, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !33)
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 30, column: 16, scope: !31)
!35 = !DILocalVariable(name: "source", scope: !31, file: !16, line: 31, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 31, column: 17, scope: !31)
!40 = !DILocation(line: 32, column: 17, scope: !31)
!41 = !DILocation(line: 32, column: 9, scope: !31)
!42 = !DILocation(line: 33, column: 9, scope: !31)
!43 = !DILocation(line: 33, column: 23, scope: !31)
!44 = !DILocation(line: 35, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !31, file: !16, line: 35, column: 9)
!46 = !DILocation(line: 35, column: 14, scope: !45)
!47 = !DILocation(line: 35, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !16, line: 35, column: 9)
!49 = !DILocation(line: 35, column: 23, scope: !48)
!50 = !DILocation(line: 35, column: 9, scope: !45)
!51 = !DILocation(line: 37, column: 30, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !16, line: 36, column: 9)
!53 = !DILocation(line: 37, column: 23, scope: !52)
!54 = !DILocation(line: 37, column: 13, scope: !52)
!55 = !DILocation(line: 37, column: 18, scope: !52)
!56 = !DILocation(line: 37, column: 21, scope: !52)
!57 = !DILocation(line: 38, column: 9, scope: !52)
!58 = !DILocation(line: 35, column: 31, scope: !48)
!59 = !DILocation(line: 35, column: 9, scope: !48)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 38, column: 9, scope: !45)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 39, column: 9, scope: !31)
!64 = !DILocation(line: 39, column: 21, scope: !31)
!65 = !DILocation(line: 40, column: 20, scope: !31)
!66 = !DILocation(line: 40, column: 9, scope: !31)
!67 = !DILocation(line: 42, column: 1, scope: !15)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_64b_goodG2BSink", scope: !16, file: !16, line: 49, type: !17, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !68, file: !16, line: 49, type: !19)
!70 = !DILocation(line: 49, column: 92, scope: !68)
!71 = !DILocalVariable(name: "dataPtr", scope: !68, file: !16, line: 52, type: !4)
!72 = !DILocation(line: 52, column: 17, scope: !68)
!73 = !DILocation(line: 52, column: 40, scope: !68)
!74 = !DILocation(line: 52, column: 27, scope: !68)
!75 = !DILocalVariable(name: "data", scope: !68, file: !16, line: 54, type: !5)
!76 = !DILocation(line: 54, column: 15, scope: !68)
!77 = !DILocation(line: 54, column: 24, scope: !68)
!78 = !DILocation(line: 54, column: 23, scope: !68)
!79 = !DILocalVariable(name: "i", scope: !80, file: !16, line: 56, type: !32)
!80 = distinct !DILexicalBlock(scope: !68, file: !16, line: 55, column: 5)
!81 = !DILocation(line: 56, column: 16, scope: !80)
!82 = !DILocalVariable(name: "source", scope: !80, file: !16, line: 57, type: !36)
!83 = !DILocation(line: 57, column: 17, scope: !80)
!84 = !DILocation(line: 58, column: 17, scope: !80)
!85 = !DILocation(line: 58, column: 9, scope: !80)
!86 = !DILocation(line: 59, column: 9, scope: !80)
!87 = !DILocation(line: 59, column: 23, scope: !80)
!88 = !DILocation(line: 61, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !80, file: !16, line: 61, column: 9)
!90 = !DILocation(line: 61, column: 14, scope: !89)
!91 = !DILocation(line: 61, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !16, line: 61, column: 9)
!93 = !DILocation(line: 61, column: 23, scope: !92)
!94 = !DILocation(line: 61, column: 9, scope: !89)
!95 = !DILocation(line: 63, column: 30, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !16, line: 62, column: 9)
!97 = !DILocation(line: 63, column: 23, scope: !96)
!98 = !DILocation(line: 63, column: 13, scope: !96)
!99 = !DILocation(line: 63, column: 18, scope: !96)
!100 = !DILocation(line: 63, column: 21, scope: !96)
!101 = !DILocation(line: 64, column: 9, scope: !96)
!102 = !DILocation(line: 61, column: 31, scope: !92)
!103 = !DILocation(line: 61, column: 9, scope: !92)
!104 = distinct !{!104, !94, !105, !62}
!105 = !DILocation(line: 64, column: 9, scope: !89)
!106 = !DILocation(line: 65, column: 9, scope: !80)
!107 = !DILocation(line: 65, column: 21, scope: !80)
!108 = !DILocation(line: 66, column: 20, scope: !80)
!109 = !DILocation(line: 66, column: 9, scope: !80)
!110 = !DILocation(line: 68, column: 1, scope: !68)
