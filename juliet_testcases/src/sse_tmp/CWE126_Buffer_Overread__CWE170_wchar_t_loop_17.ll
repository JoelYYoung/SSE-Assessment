; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_17_bad() #0 !dbg !11 {
entry:
  %j = alloca i32, align 4
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %j, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %j, align 4, !dbg !18
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %j, align 4, !dbg !21
  %cmp = icmp slt i32 %0, 1, !dbg !23
  br i1 %cmp, label %for.body, label %for.end10, !dbg !24

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !25, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %i, metadata !39, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !41
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !42
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  store i32 0, i32* %i, align 4, !dbg !45
  br label %for.cond1, !dbg !47

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %i, align 4, !dbg !48
  %cmp2 = icmp slt i32 %1, 99, !dbg !50
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !51

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4, !dbg !52
  %idxprom = sext i32 %2 to i64, !dbg !54
  %arrayidx4 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !54
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !54
  %4 = load i32, i32* %i, align 4, !dbg !55
  %idxprom5 = sext i32 %4 to i64, !dbg !56
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom5, !dbg !56
  store i32 %3, i32* %arrayidx6, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body3
  %5 = load i32, i32* %i, align 4, !dbg !59
  %inc = add nsw i32 %5, 1, !dbg !59
  store i32 %inc, i32* %i, align 4, !dbg !59
  br label %for.cond1, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond1
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  call void @printWLine(i32* %arraydecay7), !dbg !65
  br label %for.inc8, !dbg !66

for.inc8:                                         ; preds = %for.end
  %6 = load i32, i32* %j, align 4, !dbg !67
  %inc9 = add nsw i32 %6, 1, !dbg !67
  store i32 %inc9, i32* %j, align 4, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_17_good() #0 !dbg !72 {
entry:
  call void @good1(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #4, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #4, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_17_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_17_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !95 {
entry:
  %k = alloca i32, align 4
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %k, metadata !96, metadata !DIExpression()), !dbg !97
  store i32 0, i32* %k, align 4, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc9, %entry
  %0 = load i32, i32* %k, align 4, !dbg !101
  %cmp = icmp slt i32 %0, 1, !dbg !103
  br i1 %cmp, label %for.body, label %for.end11, !dbg !104

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !105, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32* %i, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !113
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !114
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  store i32 0, i32* %i, align 4, !dbg !117
  br label %for.cond1, !dbg !119

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %i, align 4, !dbg !120
  %cmp2 = icmp slt i32 %1, 99, !dbg !122
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !123

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4, !dbg !124
  %idxprom = sext i32 %2 to i64, !dbg !126
  %arrayidx4 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !126
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !126
  %4 = load i32, i32* %i, align 4, !dbg !127
  %idxprom5 = sext i32 %4 to i64, !dbg !128
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom5, !dbg !128
  store i32 %3, i32* %arrayidx6, align 4, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body3
  %5 = load i32, i32* %i, align 4, !dbg !131
  %inc = add nsw i32 %5, 1, !dbg !131
  store i32 %inc, i32* %i, align 4, !dbg !131
  br label %for.cond1, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond1
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx7, align 4, !dbg !136
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !137
  call void @printWLine(i32* %arraydecay8), !dbg !138
  br label %for.inc9, !dbg !139

for.inc9:                                         ; preds = %for.end
  %6 = load i32, i32* %k, align 4, !dbg !140
  %inc10 = add nsw i32 %6, 1, !dbg !140
  store i32 %inc10, i32* %k, align 4, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !144
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_17_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "j", scope: !11, file: !12, line: 24, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 24, column: 9, scope: !11)
!18 = !DILocation(line: 25, column: 11, scope: !19)
!19 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!20 = !DILocation(line: 25, column: 9, scope: !19)
!21 = !DILocation(line: 25, column: 16, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !12, line: 25, column: 5)
!23 = !DILocation(line: 25, column: 18, scope: !22)
!24 = !DILocation(line: 25, column: 5, scope: !19)
!25 = !DILocalVariable(name: "src", scope: !26, file: !12, line: 28, type: !28)
!26 = distinct !DILexicalBlock(scope: !27, file: !12, line: 27, column: 9)
!27 = distinct !DILexicalBlock(scope: !22, file: !12, line: 26, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 4800, elements: !31)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !30, line: 74, baseType: !16)
!30 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!31 = !{!32}
!32 = !DISubrange(count: 150)
!33 = !DILocation(line: 28, column: 21, scope: !26)
!34 = !DILocalVariable(name: "dest", scope: !26, file: !12, line: 28, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 28, column: 31, scope: !26)
!39 = !DILocalVariable(name: "i", scope: !26, file: !12, line: 29, type: !16)
!40 = !DILocation(line: 29, column: 17, scope: !26)
!41 = !DILocation(line: 31, column: 21, scope: !26)
!42 = !DILocation(line: 31, column: 13, scope: !26)
!43 = !DILocation(line: 32, column: 13, scope: !26)
!44 = !DILocation(line: 32, column: 22, scope: !26)
!45 = !DILocation(line: 33, column: 18, scope: !46)
!46 = distinct !DILexicalBlock(scope: !26, file: !12, line: 33, column: 13)
!47 = !DILocation(line: 33, column: 17, scope: !46)
!48 = !DILocation(line: 33, column: 22, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 33, column: 13)
!50 = !DILocation(line: 33, column: 24, scope: !49)
!51 = !DILocation(line: 33, column: 13, scope: !46)
!52 = !DILocation(line: 35, column: 31, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 34, column: 13)
!54 = !DILocation(line: 35, column: 27, scope: !53)
!55 = !DILocation(line: 35, column: 22, scope: !53)
!56 = !DILocation(line: 35, column: 17, scope: !53)
!57 = !DILocation(line: 35, column: 25, scope: !53)
!58 = !DILocation(line: 36, column: 13, scope: !53)
!59 = !DILocation(line: 33, column: 31, scope: !49)
!60 = !DILocation(line: 33, column: 13, scope: !49)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 36, column: 13, scope: !46)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 38, column: 24, scope: !26)
!65 = !DILocation(line: 38, column: 13, scope: !26)
!66 = !DILocation(line: 40, column: 5, scope: !27)
!67 = !DILocation(line: 25, column: 24, scope: !22)
!68 = !DILocation(line: 25, column: 5, scope: !22)
!69 = distinct !{!69, !24, !70, !63}
!70 = !DILocation(line: 40, column: 5, scope: !19)
!71 = !DILocation(line: 41, column: 1, scope: !11)
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_17_good", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 71, column: 5, scope: !72)
!74 = !DILocation(line: 72, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !76, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!16, !16, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 83, type: !16)
!82 = !DILocation(line: 83, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 83, type: !78)
!84 = !DILocation(line: 83, column: 27, scope: !75)
!85 = !DILocation(line: 86, column: 22, scope: !75)
!86 = !DILocation(line: 86, column: 12, scope: !75)
!87 = !DILocation(line: 86, column: 5, scope: !75)
!88 = !DILocation(line: 88, column: 5, scope: !75)
!89 = !DILocation(line: 89, column: 5, scope: !75)
!90 = !DILocation(line: 90, column: 5, scope: !75)
!91 = !DILocation(line: 93, column: 5, scope: !75)
!92 = !DILocation(line: 94, column: 5, scope: !75)
!93 = !DILocation(line: 95, column: 5, scope: !75)
!94 = !DILocation(line: 97, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "k", scope: !95, file: !12, line: 50, type: !16)
!97 = !DILocation(line: 50, column: 9, scope: !95)
!98 = !DILocation(line: 51, column: 11, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 51, column: 5)
!100 = !DILocation(line: 51, column: 9, scope: !99)
!101 = !DILocation(line: 51, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !12, line: 51, column: 5)
!103 = !DILocation(line: 51, column: 18, scope: !102)
!104 = !DILocation(line: 51, column: 5, scope: !99)
!105 = !DILocalVariable(name: "src", scope: !106, file: !12, line: 54, type: !28)
!106 = distinct !DILexicalBlock(scope: !107, file: !12, line: 53, column: 9)
!107 = distinct !DILexicalBlock(scope: !102, file: !12, line: 52, column: 5)
!108 = !DILocation(line: 54, column: 21, scope: !106)
!109 = !DILocalVariable(name: "dest", scope: !106, file: !12, line: 54, type: !35)
!110 = !DILocation(line: 54, column: 31, scope: !106)
!111 = !DILocalVariable(name: "i", scope: !106, file: !12, line: 55, type: !16)
!112 = !DILocation(line: 55, column: 17, scope: !106)
!113 = !DILocation(line: 57, column: 21, scope: !106)
!114 = !DILocation(line: 57, column: 13, scope: !106)
!115 = !DILocation(line: 58, column: 13, scope: !106)
!116 = !DILocation(line: 58, column: 22, scope: !106)
!117 = !DILocation(line: 59, column: 18, scope: !118)
!118 = distinct !DILexicalBlock(scope: !106, file: !12, line: 59, column: 13)
!119 = !DILocation(line: 59, column: 17, scope: !118)
!120 = !DILocation(line: 59, column: 22, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 59, column: 13)
!122 = !DILocation(line: 59, column: 24, scope: !121)
!123 = !DILocation(line: 59, column: 13, scope: !118)
!124 = !DILocation(line: 61, column: 31, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 60, column: 13)
!126 = !DILocation(line: 61, column: 27, scope: !125)
!127 = !DILocation(line: 61, column: 22, scope: !125)
!128 = !DILocation(line: 61, column: 17, scope: !125)
!129 = !DILocation(line: 61, column: 25, scope: !125)
!130 = !DILocation(line: 62, column: 13, scope: !125)
!131 = !DILocation(line: 59, column: 31, scope: !121)
!132 = !DILocation(line: 59, column: 13, scope: !121)
!133 = distinct !{!133, !123, !134, !63}
!134 = !DILocation(line: 62, column: 13, scope: !118)
!135 = !DILocation(line: 63, column: 13, scope: !106)
!136 = !DILocation(line: 63, column: 22, scope: !106)
!137 = !DILocation(line: 64, column: 24, scope: !106)
!138 = !DILocation(line: 64, column: 13, scope: !106)
!139 = !DILocation(line: 66, column: 5, scope: !107)
!140 = !DILocation(line: 51, column: 24, scope: !102)
!141 = !DILocation(line: 51, column: 5, scope: !102)
!142 = distinct !{!142, !104, !143, !63}
!143 = !DILocation(line: 66, column: 5, scope: !99)
!144 = !DILocation(line: 67, column: 1, scope: !95)
