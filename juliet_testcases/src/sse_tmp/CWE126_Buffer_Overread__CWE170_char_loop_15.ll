; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_15_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !15, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !27, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !36
  %cmp = icmp slt i32 %0, 99, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !40
  %idxprom = sext i32 %1 to i64, !dbg !42
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !42
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !42
  %3 = load i32, i32* %i, align 4, !dbg !43
  %idxprom2 = sext i32 %3 to i64, !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !44
  store i8 %2, i8* %arrayidx3, align 1, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %4, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @printLine(i8* %arraydecay4), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_15_good() #0 !dbg !55 {
entry:
  call void @good1(), !dbg !56
  call void @good2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__CWE170_char_loop_15_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__CWE170_char_loop_15_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !78 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !79, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32* %i, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !86
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  store i32 0, i32* %i, align 4, !dbg !89
  br label %for.cond, !dbg !91

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !92
  %cmp = icmp slt i32 %0, 99, !dbg !94
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !96
  %idxprom = sext i32 %1 to i64, !dbg !98
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !98
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !98
  %3 = load i32, i32* %i, align 4, !dbg !99
  %idxprom2 = sext i32 %3 to i64, !dbg !100
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !100
  store i8 %2, i8* %arrayidx3, align 1, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !103
  %inc = add nsw i32 %4, 1, !dbg !103
  store i32 %inc, i32* %i, align 4, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx4, align 1, !dbg !108
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay5), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !112 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !113, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %i, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !120
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  store i32 0, i32* %i, align 4, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !126
  %cmp = icmp slt i32 %0, 99, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !130
  %idxprom = sext i32 %1 to i64, !dbg !132
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !132
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !132
  %3 = load i32, i32* %i, align 4, !dbg !133
  %idxprom2 = sext i32 %3 to i64, !dbg !134
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !134
  store i8 %2, i8* %arrayidx3, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !137
  %inc = add nsw i32 %4, 1, !dbg !137
  store i32 %inc, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx4, align 1, !dbg !142
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  call void @printLine(i8* %arraydecay5), !dbg !144
  ret void, !dbg !145
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_15_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "src", scope: !16, file: !12, line: 28, type: !17)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1200, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 150)
!21 = !DILocation(line: 28, column: 14, scope: !16)
!22 = !DILocalVariable(name: "dest", scope: !16, file: !12, line: 28, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 28, column: 24, scope: !16)
!27 = !DILocalVariable(name: "i", scope: !16, file: !12, line: 29, type: !28)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DILocation(line: 29, column: 13, scope: !16)
!30 = !DILocation(line: 31, column: 9, scope: !16)
!31 = !DILocation(line: 32, column: 9, scope: !16)
!32 = !DILocation(line: 32, column: 18, scope: !16)
!33 = !DILocation(line: 33, column: 14, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !12, line: 33, column: 9)
!35 = !DILocation(line: 33, column: 13, scope: !34)
!36 = !DILocation(line: 33, column: 18, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 33, column: 9)
!38 = !DILocation(line: 33, column: 20, scope: !37)
!39 = !DILocation(line: 33, column: 9, scope: !34)
!40 = !DILocation(line: 35, column: 27, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 34, column: 9)
!42 = !DILocation(line: 35, column: 23, scope: !41)
!43 = !DILocation(line: 35, column: 18, scope: !41)
!44 = !DILocation(line: 35, column: 13, scope: !41)
!45 = !DILocation(line: 35, column: 21, scope: !41)
!46 = !DILocation(line: 36, column: 9, scope: !41)
!47 = !DILocation(line: 33, column: 27, scope: !37)
!48 = !DILocation(line: 33, column: 9, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 36, column: 9, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 38, column: 19, scope: !16)
!53 = !DILocation(line: 38, column: 9, scope: !16)
!54 = !DILocation(line: 46, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_15_good", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 108, column: 5, scope: !55)
!57 = !DILocation(line: 109, column: 5, scope: !55)
!58 = !DILocation(line: 110, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !60, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!28, !28, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 121, type: !28)
!65 = !DILocation(line: 121, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 121, type: !62)
!67 = !DILocation(line: 121, column: 27, scope: !59)
!68 = !DILocation(line: 124, column: 22, scope: !59)
!69 = !DILocation(line: 124, column: 12, scope: !59)
!70 = !DILocation(line: 124, column: 5, scope: !59)
!71 = !DILocation(line: 126, column: 5, scope: !59)
!72 = !DILocation(line: 127, column: 5, scope: !59)
!73 = !DILocation(line: 128, column: 5, scope: !59)
!74 = !DILocation(line: 131, column: 5, scope: !59)
!75 = !DILocation(line: 132, column: 5, scope: !59)
!76 = !DILocation(line: 133, column: 5, scope: !59)
!77 = !DILocation(line: 135, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "src", scope: !80, file: !12, line: 63, type: !17)
!80 = distinct !DILexicalBlock(scope: !78, file: !12, line: 62, column: 5)
!81 = !DILocation(line: 63, column: 14, scope: !80)
!82 = !DILocalVariable(name: "dest", scope: !80, file: !12, line: 63, type: !23)
!83 = !DILocation(line: 63, column: 24, scope: !80)
!84 = !DILocalVariable(name: "i", scope: !80, file: !12, line: 64, type: !28)
!85 = !DILocation(line: 64, column: 13, scope: !80)
!86 = !DILocation(line: 66, column: 9, scope: !80)
!87 = !DILocation(line: 67, column: 9, scope: !80)
!88 = !DILocation(line: 67, column: 18, scope: !80)
!89 = !DILocation(line: 68, column: 14, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !12, line: 68, column: 9)
!91 = !DILocation(line: 68, column: 13, scope: !90)
!92 = !DILocation(line: 68, column: 18, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 68, column: 9)
!94 = !DILocation(line: 68, column: 20, scope: !93)
!95 = !DILocation(line: 68, column: 9, scope: !90)
!96 = !DILocation(line: 70, column: 27, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !12, line: 69, column: 9)
!98 = !DILocation(line: 70, column: 23, scope: !97)
!99 = !DILocation(line: 70, column: 18, scope: !97)
!100 = !DILocation(line: 70, column: 13, scope: !97)
!101 = !DILocation(line: 70, column: 21, scope: !97)
!102 = !DILocation(line: 71, column: 9, scope: !97)
!103 = !DILocation(line: 68, column: 27, scope: !93)
!104 = !DILocation(line: 68, column: 9, scope: !93)
!105 = distinct !{!105, !95, !106, !51}
!106 = !DILocation(line: 71, column: 9, scope: !90)
!107 = !DILocation(line: 72, column: 9, scope: !80)
!108 = !DILocation(line: 72, column: 18, scope: !80)
!109 = !DILocation(line: 73, column: 19, scope: !80)
!110 = !DILocation(line: 73, column: 9, scope: !80)
!111 = !DILocation(line: 77, column: 1, scope: !78)
!112 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "src", scope: !114, file: !12, line: 86, type: !17)
!114 = distinct !DILexicalBlock(scope: !112, file: !12, line: 85, column: 5)
!115 = !DILocation(line: 86, column: 14, scope: !114)
!116 = !DILocalVariable(name: "dest", scope: !114, file: !12, line: 86, type: !23)
!117 = !DILocation(line: 86, column: 24, scope: !114)
!118 = !DILocalVariable(name: "i", scope: !114, file: !12, line: 87, type: !28)
!119 = !DILocation(line: 87, column: 13, scope: !114)
!120 = !DILocation(line: 89, column: 9, scope: !114)
!121 = !DILocation(line: 90, column: 9, scope: !114)
!122 = !DILocation(line: 90, column: 18, scope: !114)
!123 = !DILocation(line: 91, column: 14, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !12, line: 91, column: 9)
!125 = !DILocation(line: 91, column: 13, scope: !124)
!126 = !DILocation(line: 91, column: 18, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 91, column: 9)
!128 = !DILocation(line: 91, column: 20, scope: !127)
!129 = !DILocation(line: 91, column: 9, scope: !124)
!130 = !DILocation(line: 93, column: 27, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !12, line: 92, column: 9)
!132 = !DILocation(line: 93, column: 23, scope: !131)
!133 = !DILocation(line: 93, column: 18, scope: !131)
!134 = !DILocation(line: 93, column: 13, scope: !131)
!135 = !DILocation(line: 93, column: 21, scope: !131)
!136 = !DILocation(line: 94, column: 9, scope: !131)
!137 = !DILocation(line: 91, column: 27, scope: !127)
!138 = !DILocation(line: 91, column: 9, scope: !127)
!139 = distinct !{!139, !129, !140, !51}
!140 = !DILocation(line: 94, column: 9, scope: !124)
!141 = !DILocation(line: 95, column: 9, scope: !114)
!142 = !DILocation(line: 95, column: 18, scope: !114)
!143 = !DILocation(line: 96, column: 19, scope: !114)
!144 = !DILocation(line: 96, column: 9, scope: !114)
!145 = !DILocation(line: 104, column: 1, scope: !112)
