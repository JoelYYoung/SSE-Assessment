; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_01_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !15, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !32
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !38
  %cmp = icmp slt i32 %0, 99, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !42
  %idxprom = sext i32 %1 to i64, !dbg !44
  %arrayidx1 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !44
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !44
  %3 = load i32, i32* %i, align 4, !dbg !45
  %idxprom2 = sext i32 %3 to i64, !dbg !46
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom2, !dbg !46
  store i32 %2, i32* %arrayidx3, align 4, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %4, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  call void @printWLine(i32* %arraydecay4), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_01_good() #0 !dbg !57 {
entry:
  call void @good1(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #4, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #4, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_01_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_01_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !80 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !81, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %i, metadata !86, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !88
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !89
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  store i32 0, i32* %i, align 4, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !95
  %cmp = icmp slt i32 %0, 99, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !99
  %idxprom = sext i32 %1 to i64, !dbg !101
  %arrayidx1 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !101
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !101
  %3 = load i32, i32* %i, align 4, !dbg !102
  %idxprom2 = sext i32 %3 to i64, !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom2, !dbg !103
  store i32 %2, i32* %arrayidx3, align 4, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !106
  %inc = add nsw i32 %4, 1, !dbg !106
  store i32 %inc, i32* %i, align 4, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx4, align 4, !dbg !111
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* %arraydecay5), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_01_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "src", scope: !16, file: !12, line: 25, type: !17)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 5)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 4800, elements: !21)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 74, baseType: !20)
!19 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{!22}
!22 = !DISubrange(count: 150)
!23 = !DILocation(line: 25, column: 17, scope: !16)
!24 = !DILocalVariable(name: "dest", scope: !16, file: !12, line: 25, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 25, column: 27, scope: !16)
!29 = !DILocalVariable(name: "i", scope: !16, file: !12, line: 26, type: !20)
!30 = !DILocation(line: 26, column: 13, scope: !16)
!31 = !DILocation(line: 28, column: 17, scope: !16)
!32 = !DILocation(line: 28, column: 9, scope: !16)
!33 = !DILocation(line: 29, column: 9, scope: !16)
!34 = !DILocation(line: 29, column: 18, scope: !16)
!35 = !DILocation(line: 30, column: 14, scope: !36)
!36 = distinct !DILexicalBlock(scope: !16, file: !12, line: 30, column: 9)
!37 = !DILocation(line: 30, column: 13, scope: !36)
!38 = !DILocation(line: 30, column: 18, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 30, column: 9)
!40 = !DILocation(line: 30, column: 20, scope: !39)
!41 = !DILocation(line: 30, column: 9, scope: !36)
!42 = !DILocation(line: 32, column: 27, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 31, column: 9)
!44 = !DILocation(line: 32, column: 23, scope: !43)
!45 = !DILocation(line: 32, column: 18, scope: !43)
!46 = !DILocation(line: 32, column: 13, scope: !43)
!47 = !DILocation(line: 32, column: 21, scope: !43)
!48 = !DILocation(line: 33, column: 9, scope: !43)
!49 = !DILocation(line: 30, column: 27, scope: !39)
!50 = !DILocation(line: 30, column: 9, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 33, column: 9, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 35, column: 20, scope: !16)
!55 = !DILocation(line: 35, column: 9, scope: !16)
!56 = !DILocation(line: 37, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_01_good", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 62, column: 5, scope: !57)
!59 = !DILocation(line: 63, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 74, type: !61, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!20, !20, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 74, type: !20)
!67 = !DILocation(line: 74, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 74, type: !63)
!69 = !DILocation(line: 74, column: 27, scope: !60)
!70 = !DILocation(line: 77, column: 22, scope: !60)
!71 = !DILocation(line: 77, column: 12, scope: !60)
!72 = !DILocation(line: 77, column: 5, scope: !60)
!73 = !DILocation(line: 79, column: 5, scope: !60)
!74 = !DILocation(line: 80, column: 5, scope: !60)
!75 = !DILocation(line: 81, column: 5, scope: !60)
!76 = !DILocation(line: 84, column: 5, scope: !60)
!77 = !DILocation(line: 85, column: 5, scope: !60)
!78 = !DILocation(line: 86, column: 5, scope: !60)
!79 = !DILocation(line: 88, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 43, type: !13, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "src", scope: !82, file: !12, line: 46, type: !17)
!82 = distinct !DILexicalBlock(scope: !80, file: !12, line: 45, column: 5)
!83 = !DILocation(line: 46, column: 17, scope: !82)
!84 = !DILocalVariable(name: "dest", scope: !82, file: !12, line: 46, type: !25)
!85 = !DILocation(line: 46, column: 27, scope: !82)
!86 = !DILocalVariable(name: "i", scope: !82, file: !12, line: 47, type: !20)
!87 = !DILocation(line: 47, column: 13, scope: !82)
!88 = !DILocation(line: 49, column: 17, scope: !82)
!89 = !DILocation(line: 49, column: 9, scope: !82)
!90 = !DILocation(line: 50, column: 9, scope: !82)
!91 = !DILocation(line: 50, column: 18, scope: !82)
!92 = !DILocation(line: 51, column: 14, scope: !93)
!93 = distinct !DILexicalBlock(scope: !82, file: !12, line: 51, column: 9)
!94 = !DILocation(line: 51, column: 13, scope: !93)
!95 = !DILocation(line: 51, column: 18, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 51, column: 9)
!97 = !DILocation(line: 51, column: 20, scope: !96)
!98 = !DILocation(line: 51, column: 9, scope: !93)
!99 = !DILocation(line: 53, column: 27, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !12, line: 52, column: 9)
!101 = !DILocation(line: 53, column: 23, scope: !100)
!102 = !DILocation(line: 53, column: 18, scope: !100)
!103 = !DILocation(line: 53, column: 13, scope: !100)
!104 = !DILocation(line: 53, column: 21, scope: !100)
!105 = !DILocation(line: 54, column: 9, scope: !100)
!106 = !DILocation(line: 51, column: 27, scope: !96)
!107 = !DILocation(line: 51, column: 9, scope: !96)
!108 = distinct !{!108, !98, !109, !53}
!109 = !DILocation(line: 54, column: 9, scope: !93)
!110 = !DILocation(line: 55, column: 9, scope: !82)
!111 = !DILocation(line: 55, column: 18, scope: !82)
!112 = !DILocation(line: 56, column: 20, scope: !82)
!113 = !DILocation(line: 56, column: 9, scope: !82)
!114 = !DILocation(line: 58, column: 1, scope: !80)
