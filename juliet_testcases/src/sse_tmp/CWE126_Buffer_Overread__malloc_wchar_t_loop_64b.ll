; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_64b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_64b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_64b_badSink(i8* %dataVoidPtr) #0 !dbg !15 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
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
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !43
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !47
  store i64 %call2, i64* %destLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !52
  %5 = load i64, i64* %destLen, align 8, !dbg !54
  %cmp = icmp ult i64 %4, %5, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !57
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !57
  %9 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !61
  store i32 %8, i32* %arrayidx4, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %10, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !69
  store i32 0, i32* %arrayidx5, align 4, !dbg !70
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !71
  call void @printWLine(i32* %arraydecay6), !dbg !72
  %11 = load i32*, i32** %data, align 8, !dbg !73
  %12 = bitcast i32* %11 to i8*, !dbg !73
  call void @free(i8* %12) #5, !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_64b_goodG2BSink(i8* %dataVoidPtr) #0 !dbg !76 {
entry:
  %dataVoidPtr.addr = alloca i8*, align 8
  %dataPtr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i8* %dataVoidPtr, i8** %dataVoidPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dataVoidPtr.addr, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32*** %dataPtr, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = load i8*, i8** %dataVoidPtr.addr, align 8, !dbg !81
  %1 = bitcast i8* %0 to i32**, !dbg !82
  store i32** %1, i32*** %dataPtr, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  %2 = load i32**, i32*** %dataPtr, align 8, !dbg !85
  %3 = load i32*, i32** %2, align 8, !dbg !86
  store i32* %3, i32** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata i64* %i, metadata !87, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !94
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !95
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !98
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !99
  store i64 %call2, i64* %destLen, align 8, !dbg !100
  store i64 0, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !103

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !104
  %5 = load i64, i64* %destLen, align 8, !dbg !106
  %cmp = icmp ult i64 %4, %5, !dbg !107
  br i1 %cmp, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !109
  %7 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !109
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !109
  %9 = load i64, i64* %i, align 8, !dbg !112
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !113
  store i32 %8, i32* %arrayidx4, align 4, !dbg !114
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !116
  %inc = add i64 %10, 1, !dbg !116
  store i64 %inc, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx5, align 4, !dbg !121
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  call void @printWLine(i32* %arraydecay6), !dbg !123
  %11 = load i32*, i32** %data, align 8, !dbg !124
  %12 = bitcast i32* %11 to i8*, !dbg !124
  call void @free(i8* %12) #5, !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_64b_badSink", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_64b.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !19}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !15, file: !16, line: 23, type: !19)
!21 = !DILocation(line: 23, column: 69, scope: !15)
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
!35 = !DILocalVariable(name: "destLen", scope: !31, file: !16, line: 30, type: !32)
!36 = !DILocation(line: 30, column: 19, scope: !31)
!37 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 31, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 31, column: 17, scope: !31)
!42 = !DILocation(line: 32, column: 17, scope: !31)
!43 = !DILocation(line: 32, column: 9, scope: !31)
!44 = !DILocation(line: 33, column: 9, scope: !31)
!45 = !DILocation(line: 33, column: 21, scope: !31)
!46 = !DILocation(line: 34, column: 26, scope: !31)
!47 = !DILocation(line: 34, column: 19, scope: !31)
!48 = !DILocation(line: 34, column: 17, scope: !31)
!49 = !DILocation(line: 37, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !31, file: !16, line: 37, column: 9)
!51 = !DILocation(line: 37, column: 14, scope: !50)
!52 = !DILocation(line: 37, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !16, line: 37, column: 9)
!54 = !DILocation(line: 37, column: 25, scope: !53)
!55 = !DILocation(line: 37, column: 23, scope: !53)
!56 = !DILocation(line: 37, column: 9, scope: !50)
!57 = !DILocation(line: 39, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !16, line: 38, column: 9)
!59 = !DILocation(line: 39, column: 28, scope: !58)
!60 = !DILocation(line: 39, column: 18, scope: !58)
!61 = !DILocation(line: 39, column: 13, scope: !58)
!62 = !DILocation(line: 39, column: 21, scope: !58)
!63 = !DILocation(line: 40, column: 9, scope: !58)
!64 = !DILocation(line: 37, column: 35, scope: !53)
!65 = !DILocation(line: 37, column: 9, scope: !53)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 40, column: 9, scope: !50)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 41, column: 9, scope: !31)
!70 = !DILocation(line: 41, column: 21, scope: !31)
!71 = !DILocation(line: 42, column: 20, scope: !31)
!72 = !DILocation(line: 42, column: 9, scope: !31)
!73 = !DILocation(line: 43, column: 14, scope: !31)
!74 = !DILocation(line: 43, column: 9, scope: !31)
!75 = !DILocation(line: 45, column: 1, scope: !15)
!76 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_64b_goodG2BSink", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "dataVoidPtr", arg: 1, scope: !76, file: !16, line: 52, type: !19)
!78 = !DILocation(line: 52, column: 73, scope: !76)
!79 = !DILocalVariable(name: "dataPtr", scope: !76, file: !16, line: 55, type: !4)
!80 = !DILocation(line: 55, column: 17, scope: !76)
!81 = !DILocation(line: 55, column: 40, scope: !76)
!82 = !DILocation(line: 55, column: 27, scope: !76)
!83 = !DILocalVariable(name: "data", scope: !76, file: !16, line: 57, type: !5)
!84 = !DILocation(line: 57, column: 15, scope: !76)
!85 = !DILocation(line: 57, column: 24, scope: !76)
!86 = !DILocation(line: 57, column: 23, scope: !76)
!87 = !DILocalVariable(name: "i", scope: !88, file: !16, line: 59, type: !32)
!88 = distinct !DILexicalBlock(scope: !76, file: !16, line: 58, column: 5)
!89 = !DILocation(line: 59, column: 16, scope: !88)
!90 = !DILocalVariable(name: "destLen", scope: !88, file: !16, line: 59, type: !32)
!91 = !DILocation(line: 59, column: 19, scope: !88)
!92 = !DILocalVariable(name: "dest", scope: !88, file: !16, line: 60, type: !38)
!93 = !DILocation(line: 60, column: 17, scope: !88)
!94 = !DILocation(line: 61, column: 17, scope: !88)
!95 = !DILocation(line: 61, column: 9, scope: !88)
!96 = !DILocation(line: 62, column: 9, scope: !88)
!97 = !DILocation(line: 62, column: 21, scope: !88)
!98 = !DILocation(line: 63, column: 26, scope: !88)
!99 = !DILocation(line: 63, column: 19, scope: !88)
!100 = !DILocation(line: 63, column: 17, scope: !88)
!101 = !DILocation(line: 66, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !88, file: !16, line: 66, column: 9)
!103 = !DILocation(line: 66, column: 14, scope: !102)
!104 = !DILocation(line: 66, column: 21, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !16, line: 66, column: 9)
!106 = !DILocation(line: 66, column: 25, scope: !105)
!107 = !DILocation(line: 66, column: 23, scope: !105)
!108 = !DILocation(line: 66, column: 9, scope: !102)
!109 = !DILocation(line: 68, column: 23, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !16, line: 67, column: 9)
!111 = !DILocation(line: 68, column: 28, scope: !110)
!112 = !DILocation(line: 68, column: 18, scope: !110)
!113 = !DILocation(line: 68, column: 13, scope: !110)
!114 = !DILocation(line: 68, column: 21, scope: !110)
!115 = !DILocation(line: 69, column: 9, scope: !110)
!116 = !DILocation(line: 66, column: 35, scope: !105)
!117 = !DILocation(line: 66, column: 9, scope: !105)
!118 = distinct !{!118, !108, !119, !68}
!119 = !DILocation(line: 69, column: 9, scope: !102)
!120 = !DILocation(line: 70, column: 9, scope: !88)
!121 = !DILocation(line: 70, column: 21, scope: !88)
!122 = !DILocation(line: 71, column: 20, scope: !88)
!123 = !DILocation(line: 71, column: 9, scope: !88)
!124 = !DILocation(line: 72, column: 14, scope: !88)
!125 = !DILocation(line: 72, column: 9, scope: !88)
!126 = !DILocation(line: 74, column: 1, scope: !76)
