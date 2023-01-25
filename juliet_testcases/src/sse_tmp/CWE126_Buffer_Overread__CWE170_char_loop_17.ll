; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_17_bad() #0 !dbg !11 {
entry:
  %j = alloca i32, align 4
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %j, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %j, align 4, !dbg !18
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %j, align 4, !dbg !21
  %cmp = icmp slt i32 %0, 1, !dbg !23
  br i1 %cmp, label %for.body, label %for.end10, !dbg !24

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !25, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %i, metadata !38, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !40
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  store i32 0, i32* %i, align 4, !dbg !43
  br label %for.cond1, !dbg !45

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %i, align 4, !dbg !46
  %cmp2 = icmp slt i32 %1, 99, !dbg !48
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !49

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4, !dbg !50
  %idxprom = sext i32 %2 to i64, !dbg !52
  %arrayidx4 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !52
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !52
  %4 = load i32, i32* %i, align 4, !dbg !53
  %idxprom5 = sext i32 %4 to i64, !dbg !54
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom5, !dbg !54
  store i8 %3, i8* %arrayidx6, align 1, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body3
  %5 = load i32, i32* %i, align 4, !dbg !57
  %inc = add nsw i32 %5, 1, !dbg !57
  store i32 %inc, i32* %i, align 4, !dbg !57
  br label %for.cond1, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond1
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  call void @printLine(i8* %arraydecay7), !dbg !63
  br label %for.inc8, !dbg !64

for.inc8:                                         ; preds = %for.end
  %6 = load i32, i32* %j, align 4, !dbg !65
  %inc9 = add nsw i32 %6, 1, !dbg !65
  store i32 %inc9, i32* %j, align 4, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end10:                                        ; preds = %for.cond
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_17_good() #0 !dbg !70 {
entry:
  call void @good1(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__CWE170_char_loop_17_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__CWE170_char_loop_17_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !92 {
entry:
  %k = alloca i32, align 4
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %k, metadata !93, metadata !DIExpression()), !dbg !94
  store i32 0, i32* %k, align 4, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc9, %entry
  %0 = load i32, i32* %k, align 4, !dbg !98
  %cmp = icmp slt i32 %0, 1, !dbg !100
  br i1 %cmp, label %for.body, label %for.end11, !dbg !101

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !102, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32* %i, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !110
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  store i32 0, i32* %i, align 4, !dbg !113
  br label %for.cond1, !dbg !115

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %i, align 4, !dbg !116
  %cmp2 = icmp slt i32 %1, 99, !dbg !118
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !119

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4, !dbg !120
  %idxprom = sext i32 %2 to i64, !dbg !122
  %arrayidx4 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !122
  %3 = load i8, i8* %arrayidx4, align 1, !dbg !122
  %4 = load i32, i32* %i, align 4, !dbg !123
  %idxprom5 = sext i32 %4 to i64, !dbg !124
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom5, !dbg !124
  store i8 %3, i8* %arrayidx6, align 1, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body3
  %5 = load i32, i32* %i, align 4, !dbg !127
  %inc = add nsw i32 %5, 1, !dbg !127
  store i32 %inc, i32* %i, align 4, !dbg !127
  br label %for.cond1, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond1
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx7, align 1, !dbg !132
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !133
  call void @printLine(i8* %arraydecay8), !dbg !134
  br label %for.inc9, !dbg !135

for.inc9:                                         ; preds = %for.end
  %6 = load i32, i32* %k, align 4, !dbg !136
  %inc10 = add nsw i32 %6, 1, !dbg !136
  store i32 %inc10, i32* %k, align 4, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_17_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 1200, elements: !30)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!31}
!31 = !DISubrange(count: 150)
!32 = !DILocation(line: 28, column: 18, scope: !26)
!33 = !DILocalVariable(name: "dest", scope: !26, file: !12, line: 28, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 28, column: 28, scope: !26)
!38 = !DILocalVariable(name: "i", scope: !26, file: !12, line: 29, type: !16)
!39 = !DILocation(line: 29, column: 17, scope: !26)
!40 = !DILocation(line: 31, column: 13, scope: !26)
!41 = !DILocation(line: 32, column: 13, scope: !26)
!42 = !DILocation(line: 32, column: 22, scope: !26)
!43 = !DILocation(line: 33, column: 18, scope: !44)
!44 = distinct !DILexicalBlock(scope: !26, file: !12, line: 33, column: 13)
!45 = !DILocation(line: 33, column: 17, scope: !44)
!46 = !DILocation(line: 33, column: 22, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !12, line: 33, column: 13)
!48 = !DILocation(line: 33, column: 24, scope: !47)
!49 = !DILocation(line: 33, column: 13, scope: !44)
!50 = !DILocation(line: 35, column: 31, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !12, line: 34, column: 13)
!52 = !DILocation(line: 35, column: 27, scope: !51)
!53 = !DILocation(line: 35, column: 22, scope: !51)
!54 = !DILocation(line: 35, column: 17, scope: !51)
!55 = !DILocation(line: 35, column: 25, scope: !51)
!56 = !DILocation(line: 36, column: 13, scope: !51)
!57 = !DILocation(line: 33, column: 31, scope: !47)
!58 = !DILocation(line: 33, column: 13, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 36, column: 13, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 38, column: 23, scope: !26)
!63 = !DILocation(line: 38, column: 13, scope: !26)
!64 = !DILocation(line: 40, column: 5, scope: !27)
!65 = !DILocation(line: 25, column: 24, scope: !22)
!66 = !DILocation(line: 25, column: 5, scope: !22)
!67 = distinct !{!67, !24, !68, !61}
!68 = !DILocation(line: 40, column: 5, scope: !19)
!69 = !DILocation(line: 41, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_17_good", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 71, column: 5, scope: !70)
!72 = !DILocation(line: 72, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !74, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!16, !16, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 83, type: !16)
!79 = !DILocation(line: 83, column: 14, scope: !73)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 83, type: !76)
!81 = !DILocation(line: 83, column: 27, scope: !73)
!82 = !DILocation(line: 86, column: 22, scope: !73)
!83 = !DILocation(line: 86, column: 12, scope: !73)
!84 = !DILocation(line: 86, column: 5, scope: !73)
!85 = !DILocation(line: 88, column: 5, scope: !73)
!86 = !DILocation(line: 89, column: 5, scope: !73)
!87 = !DILocation(line: 90, column: 5, scope: !73)
!88 = !DILocation(line: 93, column: 5, scope: !73)
!89 = !DILocation(line: 94, column: 5, scope: !73)
!90 = !DILocation(line: 95, column: 5, scope: !73)
!91 = !DILocation(line: 97, column: 5, scope: !73)
!92 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "k", scope: !92, file: !12, line: 50, type: !16)
!94 = !DILocation(line: 50, column: 9, scope: !92)
!95 = !DILocation(line: 51, column: 11, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !12, line: 51, column: 5)
!97 = !DILocation(line: 51, column: 9, scope: !96)
!98 = !DILocation(line: 51, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !12, line: 51, column: 5)
!100 = !DILocation(line: 51, column: 18, scope: !99)
!101 = !DILocation(line: 51, column: 5, scope: !96)
!102 = !DILocalVariable(name: "src", scope: !103, file: !12, line: 54, type: !28)
!103 = distinct !DILexicalBlock(scope: !104, file: !12, line: 53, column: 9)
!104 = distinct !DILexicalBlock(scope: !99, file: !12, line: 52, column: 5)
!105 = !DILocation(line: 54, column: 18, scope: !103)
!106 = !DILocalVariable(name: "dest", scope: !103, file: !12, line: 54, type: !34)
!107 = !DILocation(line: 54, column: 28, scope: !103)
!108 = !DILocalVariable(name: "i", scope: !103, file: !12, line: 55, type: !16)
!109 = !DILocation(line: 55, column: 17, scope: !103)
!110 = !DILocation(line: 57, column: 13, scope: !103)
!111 = !DILocation(line: 58, column: 13, scope: !103)
!112 = !DILocation(line: 58, column: 22, scope: !103)
!113 = !DILocation(line: 59, column: 18, scope: !114)
!114 = distinct !DILexicalBlock(scope: !103, file: !12, line: 59, column: 13)
!115 = !DILocation(line: 59, column: 17, scope: !114)
!116 = !DILocation(line: 59, column: 22, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 59, column: 13)
!118 = !DILocation(line: 59, column: 24, scope: !117)
!119 = !DILocation(line: 59, column: 13, scope: !114)
!120 = !DILocation(line: 61, column: 31, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 60, column: 13)
!122 = !DILocation(line: 61, column: 27, scope: !121)
!123 = !DILocation(line: 61, column: 22, scope: !121)
!124 = !DILocation(line: 61, column: 17, scope: !121)
!125 = !DILocation(line: 61, column: 25, scope: !121)
!126 = !DILocation(line: 62, column: 13, scope: !121)
!127 = !DILocation(line: 59, column: 31, scope: !117)
!128 = !DILocation(line: 59, column: 13, scope: !117)
!129 = distinct !{!129, !119, !130, !61}
!130 = !DILocation(line: 62, column: 13, scope: !114)
!131 = !DILocation(line: 63, column: 13, scope: !103)
!132 = !DILocation(line: 63, column: 22, scope: !103)
!133 = !DILocation(line: 64, column: 23, scope: !103)
!134 = !DILocation(line: 64, column: 13, scope: !103)
!135 = !DILocation(line: 66, column: 5, scope: !104)
!136 = !DILocation(line: 51, column: 24, scope: !99)
!137 = !DILocation(line: 51, column: 5, scope: !99)
!138 = distinct !{!138, !101, !139, !61}
!139 = !DILocation(line: 66, column: 5, scope: !96)
!140 = !DILocation(line: 67, column: 1, scope: !92)
