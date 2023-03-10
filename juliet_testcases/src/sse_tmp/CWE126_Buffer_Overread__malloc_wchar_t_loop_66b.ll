; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_66b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_66b_badSink(i32** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !22
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !22
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !22
  store i32* %1, i32** %data, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i64* %i, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !36
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx1, align 4, !dbg !38
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !39
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !40
  store i64 %call3, i64* %destLen, align 8, !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !45
  %3 = load i64, i64* %destLen, align 8, !dbg !47
  %cmp = icmp ult i64 %2, %3, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data, align 8, !dbg !50
  %5 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !50
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !50
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %7, !dbg !54
  store i32 %6, i32* %arrayidx5, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %8, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx6, align 4, !dbg !63
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  call void @printWLine(i32* %arraydecay7), !dbg !65
  %9 = load i32*, i32** %data, align 8, !dbg !66
  %10 = bitcast i32* %9 to i8*, !dbg !66
  call void @free(i8* %10) #5, !dbg !67
  ret void, !dbg !68
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_66b_goodG2BSink(i32** %dataArray) #0 !dbg !69 {
entry:
  %dataArray.addr = alloca i32**, align 8
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32** %dataArray, i32*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %dataArray.addr, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = load i32**, i32*** %dataArray.addr, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 2, !dbg !74
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !74
  store i32* %1, i32** %data, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !82
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !83
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !84
  store i32 0, i32* %arrayidx1, align 4, !dbg !85
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !86
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !87
  store i64 %call3, i64* %destLen, align 8, !dbg !88
  store i64 0, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !92
  %3 = load i64, i64* %destLen, align 8, !dbg !94
  %cmp = icmp ult i64 %2, %3, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data, align 8, !dbg !97
  %5 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !97
  %6 = load i32, i32* %arrayidx4, align 4, !dbg !97
  %7 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %7, !dbg !101
  store i32 %6, i32* %arrayidx5, align 4, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %8, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx6, align 4, !dbg !109
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  call void @printWLine(i32* %arraydecay7), !dbg !111
  %9 = load i32*, i32** %data, align 8, !dbg !112
  %10 = bitcast i32* %9 to i8*, !dbg !112
  call void @free(i8* %10) #5, !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!19 = !DILocation(line: 23, column: 72, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 26, type: !14)
!21 = !DILocation(line: 26, column: 15, scope: !9)
!22 = !DILocation(line: 26, column: 22, scope: !9)
!23 = !DILocalVariable(name: "i", scope: !24, file: !10, line: 28, type: !25)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !26)
!26 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 28, column: 16, scope: !24)
!28 = !DILocalVariable(name: "destLen", scope: !24, file: !10, line: 28, type: !25)
!29 = !DILocation(line: 28, column: 19, scope: !24)
!30 = !DILocalVariable(name: "dest", scope: !24, file: !10, line: 29, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 29, column: 17, scope: !24)
!35 = !DILocation(line: 30, column: 17, scope: !24)
!36 = !DILocation(line: 30, column: 9, scope: !24)
!37 = !DILocation(line: 31, column: 9, scope: !24)
!38 = !DILocation(line: 31, column: 21, scope: !24)
!39 = !DILocation(line: 32, column: 26, scope: !24)
!40 = !DILocation(line: 32, column: 19, scope: !24)
!41 = !DILocation(line: 32, column: 17, scope: !24)
!42 = !DILocation(line: 35, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !24, file: !10, line: 35, column: 9)
!44 = !DILocation(line: 35, column: 14, scope: !43)
!45 = !DILocation(line: 35, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !10, line: 35, column: 9)
!47 = !DILocation(line: 35, column: 25, scope: !46)
!48 = !DILocation(line: 35, column: 23, scope: !46)
!49 = !DILocation(line: 35, column: 9, scope: !43)
!50 = !DILocation(line: 37, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !10, line: 36, column: 9)
!52 = !DILocation(line: 37, column: 28, scope: !51)
!53 = !DILocation(line: 37, column: 18, scope: !51)
!54 = !DILocation(line: 37, column: 13, scope: !51)
!55 = !DILocation(line: 37, column: 21, scope: !51)
!56 = !DILocation(line: 38, column: 9, scope: !51)
!57 = !DILocation(line: 35, column: 35, scope: !46)
!58 = !DILocation(line: 35, column: 9, scope: !46)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 38, column: 9, scope: !43)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 39, column: 9, scope: !24)
!63 = !DILocation(line: 39, column: 21, scope: !24)
!64 = !DILocation(line: 40, column: 20, scope: !24)
!65 = !DILocation(line: 40, column: 9, scope: !24)
!66 = !DILocation(line: 41, column: 14, scope: !24)
!67 = !DILocation(line: 41, column: 9, scope: !24)
!68 = !DILocation(line: 43, column: 1, scope: !9)
!69 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_66b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "dataArray", arg: 1, scope: !69, file: !10, line: 50, type: !13)
!71 = !DILocation(line: 50, column: 76, scope: !69)
!72 = !DILocalVariable(name: "data", scope: !69, file: !10, line: 52, type: !14)
!73 = !DILocation(line: 52, column: 15, scope: !69)
!74 = !DILocation(line: 52, column: 22, scope: !69)
!75 = !DILocalVariable(name: "i", scope: !76, file: !10, line: 54, type: !25)
!76 = distinct !DILexicalBlock(scope: !69, file: !10, line: 53, column: 5)
!77 = !DILocation(line: 54, column: 16, scope: !76)
!78 = !DILocalVariable(name: "destLen", scope: !76, file: !10, line: 54, type: !25)
!79 = !DILocation(line: 54, column: 19, scope: !76)
!80 = !DILocalVariable(name: "dest", scope: !76, file: !10, line: 55, type: !31)
!81 = !DILocation(line: 55, column: 17, scope: !76)
!82 = !DILocation(line: 56, column: 17, scope: !76)
!83 = !DILocation(line: 56, column: 9, scope: !76)
!84 = !DILocation(line: 57, column: 9, scope: !76)
!85 = !DILocation(line: 57, column: 21, scope: !76)
!86 = !DILocation(line: 58, column: 26, scope: !76)
!87 = !DILocation(line: 58, column: 19, scope: !76)
!88 = !DILocation(line: 58, column: 17, scope: !76)
!89 = !DILocation(line: 61, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !76, file: !10, line: 61, column: 9)
!91 = !DILocation(line: 61, column: 14, scope: !90)
!92 = !DILocation(line: 61, column: 21, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !10, line: 61, column: 9)
!94 = !DILocation(line: 61, column: 25, scope: !93)
!95 = !DILocation(line: 61, column: 23, scope: !93)
!96 = !DILocation(line: 61, column: 9, scope: !90)
!97 = !DILocation(line: 63, column: 23, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !10, line: 62, column: 9)
!99 = !DILocation(line: 63, column: 28, scope: !98)
!100 = !DILocation(line: 63, column: 18, scope: !98)
!101 = !DILocation(line: 63, column: 13, scope: !98)
!102 = !DILocation(line: 63, column: 21, scope: !98)
!103 = !DILocation(line: 64, column: 9, scope: !98)
!104 = !DILocation(line: 61, column: 35, scope: !93)
!105 = !DILocation(line: 61, column: 9, scope: !93)
!106 = distinct !{!106, !96, !107, !61}
!107 = !DILocation(line: 64, column: 9, scope: !90)
!108 = !DILocation(line: 65, column: 9, scope: !76)
!109 = !DILocation(line: 65, column: 21, scope: !76)
!110 = !DILocation(line: 66, column: 20, scope: !76)
!111 = !DILocation(line: 66, column: 9, scope: !76)
!112 = !DILocation(line: 67, column: 14, scope: !76)
!113 = !DILocation(line: 67, column: 9, scope: !76)
!114 = !DILocation(line: 69, column: 1, scope: !69)
