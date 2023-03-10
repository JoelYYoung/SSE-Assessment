; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_65b.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_65b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_65b_badSink(i32* %data) #0 !dbg !9 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i64* %i, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !29
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !30
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  store i64 0, i64* %i, align 8, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !36
  %cmp = icmp ult i64 %0, 100, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !42
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !42
  %3 = load i32*, i32** %data.addr, align 8, !dbg !43
  %4 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !43
  store i32 %2, i32* %arrayidx2, align 4, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !47
  %inc = add i64 %5, 1, !dbg !47
  store i64 %inc, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !52
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !52
  store i32 0, i32* %arrayidx3, align 4, !dbg !53
  %7 = load i32*, i32** %data.addr, align 8, !dbg !54
  call void @printWLine(i32* %7), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_loop_65b_goodG2BSink(i32* %data) #0 !dbg !57 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %i, metadata !60, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !63, metadata !DIExpression()), !dbg !64
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !65
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !66
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx, align 4, !dbg !68
  store i64 0, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !72
  %cmp = icmp ult i64 %0, 100, !dbg !74
  br i1 %cmp, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !78
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !78
  %3 = load i32*, i32** %data.addr, align 8, !dbg !79
  %4 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !79
  store i32 %2, i32* %arrayidx2, align 4, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %5, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !87
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !87
  store i32 0, i32* %arrayidx3, align 4, !dbg !88
  %7 = load i32*, i32** %data.addr, align 8, !dbg !89
  call void @printWLine(i32* %7), !dbg !90
  ret void, !dbg !91
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_65b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_loop_65b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !15, line: 74, baseType: !16)
!15 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!18 = !DILocation(line: 23, column: 74, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 25, column: 5)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !15, line: 46, baseType: !22)
!22 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!23 = !DILocation(line: 26, column: 16, scope: !20)
!24 = !DILocalVariable(name: "source", scope: !20, file: !10, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 17, scope: !20)
!29 = !DILocation(line: 28, column: 17, scope: !20)
!30 = !DILocation(line: 28, column: 9, scope: !20)
!31 = !DILocation(line: 29, column: 9, scope: !20)
!32 = !DILocation(line: 29, column: 23, scope: !20)
!33 = !DILocation(line: 31, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !20, file: !10, line: 31, column: 9)
!35 = !DILocation(line: 31, column: 14, scope: !34)
!36 = !DILocation(line: 31, column: 21, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 31, column: 9)
!38 = !DILocation(line: 31, column: 23, scope: !37)
!39 = !DILocation(line: 31, column: 9, scope: !34)
!40 = !DILocation(line: 33, column: 30, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 32, column: 9)
!42 = !DILocation(line: 33, column: 23, scope: !41)
!43 = !DILocation(line: 33, column: 13, scope: !41)
!44 = !DILocation(line: 33, column: 18, scope: !41)
!45 = !DILocation(line: 33, column: 21, scope: !41)
!46 = !DILocation(line: 34, column: 9, scope: !41)
!47 = !DILocation(line: 31, column: 31, scope: !37)
!48 = !DILocation(line: 31, column: 9, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 34, column: 9, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 36, column: 9, scope: !20)
!53 = !DILocation(line: 36, column: 21, scope: !20)
!54 = !DILocation(line: 37, column: 20, scope: !20)
!55 = !DILocation(line: 37, column: 9, scope: !20)
!56 = !DILocation(line: 39, column: 1, scope: !9)
!57 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_loop_65b_goodG2BSink", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", arg: 1, scope: !57, file: !10, line: 46, type: !13)
!59 = !DILocation(line: 46, column: 78, scope: !57)
!60 = !DILocalVariable(name: "i", scope: !61, file: !10, line: 49, type: !21)
!61 = distinct !DILexicalBlock(scope: !57, file: !10, line: 48, column: 5)
!62 = !DILocation(line: 49, column: 16, scope: !61)
!63 = !DILocalVariable(name: "source", scope: !61, file: !10, line: 50, type: !25)
!64 = !DILocation(line: 50, column: 17, scope: !61)
!65 = !DILocation(line: 51, column: 17, scope: !61)
!66 = !DILocation(line: 51, column: 9, scope: !61)
!67 = !DILocation(line: 52, column: 9, scope: !61)
!68 = !DILocation(line: 52, column: 23, scope: !61)
!69 = !DILocation(line: 54, column: 16, scope: !70)
!70 = distinct !DILexicalBlock(scope: !61, file: !10, line: 54, column: 9)
!71 = !DILocation(line: 54, column: 14, scope: !70)
!72 = !DILocation(line: 54, column: 21, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !10, line: 54, column: 9)
!74 = !DILocation(line: 54, column: 23, scope: !73)
!75 = !DILocation(line: 54, column: 9, scope: !70)
!76 = !DILocation(line: 56, column: 30, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !10, line: 55, column: 9)
!78 = !DILocation(line: 56, column: 23, scope: !77)
!79 = !DILocation(line: 56, column: 13, scope: !77)
!80 = !DILocation(line: 56, column: 18, scope: !77)
!81 = !DILocation(line: 56, column: 21, scope: !77)
!82 = !DILocation(line: 57, column: 9, scope: !77)
!83 = !DILocation(line: 54, column: 31, scope: !73)
!84 = !DILocation(line: 54, column: 9, scope: !73)
!85 = distinct !{!85, !75, !86, !51}
!86 = !DILocation(line: 57, column: 9, scope: !70)
!87 = !DILocation(line: 59, column: 9, scope: !61)
!88 = !DILocation(line: 59, column: 21, scope: !61)
!89 = !DILocation(line: 60, column: 20, scope: !61)
!90 = !DILocation(line: 60, column: 9, scope: !61)
!91 = !DILocation(line: 62, column: 1, scope: !57)
