; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_51b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_51b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_51b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i64* %i, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !36
  store i64 %call2, i64* %destLen, align 8, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %1 = load i64, i64* %destLen, align 8, !dbg !43
  %cmp = icmp ult i64 %0, %1, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !46
  %3 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !46
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !46
  %5 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !50
  store i32 %4, i32* %arrayidx4, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %6, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx5, align 4, !dbg !59
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* %arraydecay6), !dbg !61
  %7 = load i32*, i32** %data.addr, align 8, !dbg !62
  %8 = bitcast i32* %7 to i8*, !dbg !62
  call void @free(i8* %8) #5, !dbg !63
  ret void, !dbg !64
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_51b_goodG2BSink(i32* %data) #0 !dbg !65 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i64* %i, metadata !68, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !76
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !79
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !80
  store i64 %call2, i64* %destLen, align 8, !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !85
  %1 = load i64, i64* %destLen, align 8, !dbg !87
  %cmp = icmp ult i64 %0, %1, !dbg !88
  br i1 %cmp, label %for.body, label %for.end, !dbg !89

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !90
  %3 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !90
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !90
  %5 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !94
  store i32 %4, i32* %arrayidx4, align 4, !dbg !95
  br label %for.inc, !dbg !96

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !97
  %inc = add i64 %6, 1, !dbg !97
  store i64 %inc, i64* %i, align 8, !dbg !97
  br label %for.cond, !dbg !98, !llvm.loop !99

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx5, align 4, !dbg !102
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !103
  call void @printWLine(i32* %arraydecay6), !dbg !104
  %7 = load i32*, i32** %data.addr, align 8, !dbg !105
  %8 = bitcast i32* %7 to i8*, !dbg !105
  call void @free(i8* %8) #5, !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_51b_badSink", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_51b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 25, type: !13)
!18 = !DILocation(line: 25, column: 72, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 28, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !15, line: 46, baseType: !22)
!22 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!23 = !DILocation(line: 28, column: 16, scope: !20)
!24 = !DILocalVariable(name: "destLen", scope: !20, file: !10, line: 28, type: !21)
!25 = !DILocation(line: 28, column: 19, scope: !20)
!26 = !DILocalVariable(name: "dest", scope: !20, file: !10, line: 29, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 29, column: 17, scope: !20)
!31 = !DILocation(line: 30, column: 17, scope: !20)
!32 = !DILocation(line: 30, column: 9, scope: !20)
!33 = !DILocation(line: 31, column: 9, scope: !20)
!34 = !DILocation(line: 31, column: 21, scope: !20)
!35 = !DILocation(line: 32, column: 26, scope: !20)
!36 = !DILocation(line: 32, column: 19, scope: !20)
!37 = !DILocation(line: 32, column: 17, scope: !20)
!38 = !DILocation(line: 35, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !20, file: !10, line: 35, column: 9)
!40 = !DILocation(line: 35, column: 14, scope: !39)
!41 = !DILocation(line: 35, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !10, line: 35, column: 9)
!43 = !DILocation(line: 35, column: 25, scope: !42)
!44 = !DILocation(line: 35, column: 23, scope: !42)
!45 = !DILocation(line: 35, column: 9, scope: !39)
!46 = !DILocation(line: 37, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !10, line: 36, column: 9)
!48 = !DILocation(line: 37, column: 28, scope: !47)
!49 = !DILocation(line: 37, column: 18, scope: !47)
!50 = !DILocation(line: 37, column: 13, scope: !47)
!51 = !DILocation(line: 37, column: 21, scope: !47)
!52 = !DILocation(line: 38, column: 9, scope: !47)
!53 = !DILocation(line: 35, column: 35, scope: !42)
!54 = !DILocation(line: 35, column: 9, scope: !42)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 38, column: 9, scope: !39)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 39, column: 9, scope: !20)
!59 = !DILocation(line: 39, column: 21, scope: !20)
!60 = !DILocation(line: 40, column: 20, scope: !20)
!61 = !DILocation(line: 40, column: 9, scope: !20)
!62 = !DILocation(line: 41, column: 14, scope: !20)
!63 = !DILocation(line: 41, column: 9, scope: !20)
!64 = !DILocation(line: 43, column: 1, scope: !9)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_51b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", arg: 1, scope: !65, file: !10, line: 50, type: !13)
!67 = !DILocation(line: 50, column: 76, scope: !65)
!68 = !DILocalVariable(name: "i", scope: !69, file: !10, line: 53, type: !21)
!69 = distinct !DILexicalBlock(scope: !65, file: !10, line: 52, column: 5)
!70 = !DILocation(line: 53, column: 16, scope: !69)
!71 = !DILocalVariable(name: "destLen", scope: !69, file: !10, line: 53, type: !21)
!72 = !DILocation(line: 53, column: 19, scope: !69)
!73 = !DILocalVariable(name: "dest", scope: !69, file: !10, line: 54, type: !27)
!74 = !DILocation(line: 54, column: 17, scope: !69)
!75 = !DILocation(line: 55, column: 17, scope: !69)
!76 = !DILocation(line: 55, column: 9, scope: !69)
!77 = !DILocation(line: 56, column: 9, scope: !69)
!78 = !DILocation(line: 56, column: 21, scope: !69)
!79 = !DILocation(line: 57, column: 26, scope: !69)
!80 = !DILocation(line: 57, column: 19, scope: !69)
!81 = !DILocation(line: 57, column: 17, scope: !69)
!82 = !DILocation(line: 60, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !69, file: !10, line: 60, column: 9)
!84 = !DILocation(line: 60, column: 14, scope: !83)
!85 = !DILocation(line: 60, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !10, line: 60, column: 9)
!87 = !DILocation(line: 60, column: 25, scope: !86)
!88 = !DILocation(line: 60, column: 23, scope: !86)
!89 = !DILocation(line: 60, column: 9, scope: !83)
!90 = !DILocation(line: 62, column: 23, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !10, line: 61, column: 9)
!92 = !DILocation(line: 62, column: 28, scope: !91)
!93 = !DILocation(line: 62, column: 18, scope: !91)
!94 = !DILocation(line: 62, column: 13, scope: !91)
!95 = !DILocation(line: 62, column: 21, scope: !91)
!96 = !DILocation(line: 63, column: 9, scope: !91)
!97 = !DILocation(line: 60, column: 35, scope: !86)
!98 = !DILocation(line: 60, column: 9, scope: !86)
!99 = distinct !{!99, !89, !100, !57}
!100 = !DILocation(line: 63, column: 9, scope: !83)
!101 = !DILocation(line: 64, column: 9, scope: !69)
!102 = !DILocation(line: 64, column: 21, scope: !69)
!103 = !DILocation(line: 65, column: 20, scope: !69)
!104 = !DILocation(line: 65, column: 9, scope: !69)
!105 = !DILocation(line: 66, column: 14, scope: !69)
!106 = !DILocation(line: 66, column: 9, scope: !69)
!107 = !DILocation(line: 68, column: 1, scope: !65)
