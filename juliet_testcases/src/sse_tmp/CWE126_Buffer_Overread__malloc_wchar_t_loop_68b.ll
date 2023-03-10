; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_68b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__malloc_wchar_t_loop_68_badData = external dso_local global i32*, align 8
@CWE126_Buffer_Overread__malloc_wchar_t_loop_68_goodG2BData = external dso_local global i32*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !13, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** @CWE126_Buffer_Overread__malloc_wchar_t_loop_68_badData, align 8, !dbg !19
  store i32* %0, i32** %data, align 8, !dbg !18
  call void @llvm.dbg.declare(metadata i64* %i, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !32
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !37
  store i64 %call2, i64* %destLen, align 8, !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !42
  %2 = load i64, i64* %destLen, align 8, !dbg !44
  %cmp = icmp ult i64 %1, %2, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %4 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !47
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !47
  %6 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !51
  store i32 %5, i32* %arrayidx4, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %7, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx5, align 4, !dbg !60
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  call void @printWLine(i32* %arraydecay6), !dbg !62
  %8 = load i32*, i32** %data, align 8, !dbg !63
  %9 = bitcast i32* %8 to i8*, !dbg !63
  call void @free(i8* %9) #5, !dbg !64
  ret void, !dbg !65
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_68b_goodG2BSink() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i32*, i32** @CWE126_Buffer_Overread__malloc_wchar_t_loop_68_goodG2BData, align 8, !dbg !69
  store i32* %0, i32** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i64* %i, metadata !70, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !77
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !78
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !81
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !82
  store i64 %call2, i64* %destLen, align 8, !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !87
  %2 = load i64, i64* %destLen, align 8, !dbg !89
  %cmp = icmp ult i64 %1, %2, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !92
  %4 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !92
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !92
  %6 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !96
  store i32 %5, i32* %arrayidx4, align 4, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %7, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx5, align 4, !dbg !104
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  call void @printWLine(i32* %arraydecay6), !dbg !106
  %8 = load i32*, i32** %data, align 8, !dbg !107
  %9 = bitcast i32* %8 to i8*, !dbg !107
  call void @free(i8* %9) #5, !dbg !108
  ret void, !dbg !109
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !16, line: 74, baseType: !17)
!16 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 30, column: 15, scope: !9)
!19 = !DILocation(line: 30, column: 22, scope: !9)
!20 = !DILocalVariable(name: "i", scope: !21, file: !10, line: 32, type: !22)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 46, baseType: !23)
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DILocation(line: 32, column: 16, scope: !21)
!25 = !DILocalVariable(name: "destLen", scope: !21, file: !10, line: 32, type: !22)
!26 = !DILocation(line: 32, column: 19, scope: !21)
!27 = !DILocalVariable(name: "dest", scope: !21, file: !10, line: 33, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 33, column: 17, scope: !21)
!32 = !DILocation(line: 34, column: 17, scope: !21)
!33 = !DILocation(line: 34, column: 9, scope: !21)
!34 = !DILocation(line: 35, column: 9, scope: !21)
!35 = !DILocation(line: 35, column: 21, scope: !21)
!36 = !DILocation(line: 36, column: 26, scope: !21)
!37 = !DILocation(line: 36, column: 19, scope: !21)
!38 = !DILocation(line: 36, column: 17, scope: !21)
!39 = !DILocation(line: 39, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !21, file: !10, line: 39, column: 9)
!41 = !DILocation(line: 39, column: 14, scope: !40)
!42 = !DILocation(line: 39, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !10, line: 39, column: 9)
!44 = !DILocation(line: 39, column: 25, scope: !43)
!45 = !DILocation(line: 39, column: 23, scope: !43)
!46 = !DILocation(line: 39, column: 9, scope: !40)
!47 = !DILocation(line: 41, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !43, file: !10, line: 40, column: 9)
!49 = !DILocation(line: 41, column: 28, scope: !48)
!50 = !DILocation(line: 41, column: 18, scope: !48)
!51 = !DILocation(line: 41, column: 13, scope: !48)
!52 = !DILocation(line: 41, column: 21, scope: !48)
!53 = !DILocation(line: 42, column: 9, scope: !48)
!54 = !DILocation(line: 39, column: 35, scope: !43)
!55 = !DILocation(line: 39, column: 9, scope: !43)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 42, column: 9, scope: !40)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 43, column: 9, scope: !21)
!60 = !DILocation(line: 43, column: 21, scope: !21)
!61 = !DILocation(line: 44, column: 20, scope: !21)
!62 = !DILocation(line: 44, column: 9, scope: !21)
!63 = !DILocation(line: 45, column: 14, scope: !21)
!64 = !DILocation(line: 45, column: 9, scope: !21)
!65 = !DILocation(line: 47, column: 1, scope: !9)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_68b_goodG2BSink", scope: !10, file: !10, line: 54, type: !11, scopeLine: 55, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !10, line: 56, type: !14)
!68 = !DILocation(line: 56, column: 15, scope: !66)
!69 = !DILocation(line: 56, column: 22, scope: !66)
!70 = !DILocalVariable(name: "i", scope: !71, file: !10, line: 58, type: !22)
!71 = distinct !DILexicalBlock(scope: !66, file: !10, line: 57, column: 5)
!72 = !DILocation(line: 58, column: 16, scope: !71)
!73 = !DILocalVariable(name: "destLen", scope: !71, file: !10, line: 58, type: !22)
!74 = !DILocation(line: 58, column: 19, scope: !71)
!75 = !DILocalVariable(name: "dest", scope: !71, file: !10, line: 59, type: !28)
!76 = !DILocation(line: 59, column: 17, scope: !71)
!77 = !DILocation(line: 60, column: 17, scope: !71)
!78 = !DILocation(line: 60, column: 9, scope: !71)
!79 = !DILocation(line: 61, column: 9, scope: !71)
!80 = !DILocation(line: 61, column: 21, scope: !71)
!81 = !DILocation(line: 62, column: 26, scope: !71)
!82 = !DILocation(line: 62, column: 19, scope: !71)
!83 = !DILocation(line: 62, column: 17, scope: !71)
!84 = !DILocation(line: 65, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !71, file: !10, line: 65, column: 9)
!86 = !DILocation(line: 65, column: 14, scope: !85)
!87 = !DILocation(line: 65, column: 21, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !10, line: 65, column: 9)
!89 = !DILocation(line: 65, column: 25, scope: !88)
!90 = !DILocation(line: 65, column: 23, scope: !88)
!91 = !DILocation(line: 65, column: 9, scope: !85)
!92 = !DILocation(line: 67, column: 23, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !10, line: 66, column: 9)
!94 = !DILocation(line: 67, column: 28, scope: !93)
!95 = !DILocation(line: 67, column: 18, scope: !93)
!96 = !DILocation(line: 67, column: 13, scope: !93)
!97 = !DILocation(line: 67, column: 21, scope: !93)
!98 = !DILocation(line: 68, column: 9, scope: !93)
!99 = !DILocation(line: 65, column: 35, scope: !88)
!100 = !DILocation(line: 65, column: 9, scope: !88)
!101 = distinct !{!101, !91, !102, !58}
!102 = !DILocation(line: 68, column: 9, scope: !85)
!103 = !DILocation(line: 69, column: 9, scope: !71)
!104 = !DILocation(line: 69, column: 21, scope: !71)
!105 = !DILocation(line: 70, column: 20, scope: !71)
!106 = !DILocation(line: 70, column: 9, scope: !71)
!107 = !DILocation(line: 71, column: 14, scope: !71)
!108 = !DILocation(line: 71, column: 9, scope: !71)
!109 = !DILocation(line: 73, column: 1, scope: !66)
