; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_16.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_16_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  br label %while.body, !dbg !15

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !32
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %while.body
  %0 = load i32, i32* %i, align 4, !dbg !38
  %cmp = icmp slt i32 %0, 99, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !42
  %idxprom = sext i32 %1 to i64, !dbg !44
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !44
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !44
  %3 = load i32, i32* %i, align 4, !dbg !45
  %idxprom2 = sext i32 %3 to i64, !dbg !46
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !46
  store i8 %2, i8* %arrayidx3, align 1, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %4, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  call void @printLine(i8* %arraydecay4), !dbg !55
  br label %while.end, !dbg !56

while.end:                                        ; preds = %for.end
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_16_good() #0 !dbg !58 {
entry:
  call void @good1(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #5, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #5, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__CWE170_char_loop_16_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE170_char_loop_16_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !80 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  br label %while.body, !dbg !81

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !82, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32* %i, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !90
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  store i32 0, i32* %i, align 4, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %while.body
  %0 = load i32, i32* %i, align 4, !dbg !96
  %cmp = icmp slt i32 %0, 99, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !100
  %idxprom = sext i32 %1 to i64, !dbg !102
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !102
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !102
  %3 = load i32, i32* %i, align 4, !dbg !103
  %idxprom2 = sext i32 %3 to i64, !dbg !104
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !104
  store i8 %2, i8* %arrayidx3, align 1, !dbg !105
  br label %for.inc, !dbg !106

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !107
  %inc = add nsw i32 %4, 1, !dbg !107
  store i32 %inc, i32* %i, align 4, !dbg !107
  br label %for.cond, !dbg !108, !llvm.loop !109

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx4, align 1, !dbg !112
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  call void @printLine(i8* %arraydecay5), !dbg !114
  br label %while.end, !dbg !115

while.end:                                        ; preds = %for.end
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_16.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_16_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_16.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 5, scope: !11)
!16 = !DILocalVariable(name: "src", scope: !17, file: !12, line: 27, type: !19)
!17 = distinct !DILexicalBlock(scope: !18, file: !12, line: 26, column: 9)
!18 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1200, elements: !21)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !{!22}
!22 = !DISubrange(count: 150)
!23 = !DILocation(line: 27, column: 18, scope: !17)
!24 = !DILocalVariable(name: "dest", scope: !17, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 28, scope: !17)
!29 = !DILocalVariable(name: "i", scope: !17, file: !12, line: 28, type: !30)
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DILocation(line: 28, column: 17, scope: !17)
!32 = !DILocation(line: 30, column: 13, scope: !17)
!33 = !DILocation(line: 31, column: 13, scope: !17)
!34 = !DILocation(line: 31, column: 22, scope: !17)
!35 = !DILocation(line: 32, column: 18, scope: !36)
!36 = distinct !DILexicalBlock(scope: !17, file: !12, line: 32, column: 13)
!37 = !DILocation(line: 32, column: 17, scope: !36)
!38 = !DILocation(line: 32, column: 22, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 32, column: 13)
!40 = !DILocation(line: 32, column: 24, scope: !39)
!41 = !DILocation(line: 32, column: 13, scope: !36)
!42 = !DILocation(line: 34, column: 31, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !12, line: 33, column: 13)
!44 = !DILocation(line: 34, column: 27, scope: !43)
!45 = !DILocation(line: 34, column: 22, scope: !43)
!46 = !DILocation(line: 34, column: 17, scope: !43)
!47 = !DILocation(line: 34, column: 25, scope: !43)
!48 = !DILocation(line: 35, column: 13, scope: !43)
!49 = !DILocation(line: 32, column: 31, scope: !39)
!50 = !DILocation(line: 32, column: 13, scope: !39)
!51 = distinct !{!51, !41, !52, !53}
!52 = !DILocation(line: 35, column: 13, scope: !36)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 37, column: 23, scope: !17)
!55 = !DILocation(line: 37, column: 13, scope: !17)
!56 = !DILocation(line: 39, column: 9, scope: !18)
!57 = !DILocation(line: 41, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_16_good", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 71, column: 5, scope: !58)
!60 = !DILocation(line: 72, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !62, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!30, !30, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 83, type: !30)
!67 = !DILocation(line: 83, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 83, type: !64)
!69 = !DILocation(line: 83, column: 27, scope: !61)
!70 = !DILocation(line: 86, column: 22, scope: !61)
!71 = !DILocation(line: 86, column: 12, scope: !61)
!72 = !DILocation(line: 86, column: 5, scope: !61)
!73 = !DILocation(line: 88, column: 5, scope: !61)
!74 = !DILocation(line: 89, column: 5, scope: !61)
!75 = !DILocation(line: 90, column: 5, scope: !61)
!76 = !DILocation(line: 93, column: 5, scope: !61)
!77 = !DILocation(line: 94, column: 5, scope: !61)
!78 = !DILocation(line: 95, column: 5, scope: !61)
!79 = !DILocation(line: 97, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 50, column: 5, scope: !80)
!82 = !DILocalVariable(name: "src", scope: !83, file: !12, line: 53, type: !19)
!83 = distinct !DILexicalBlock(scope: !84, file: !12, line: 52, column: 9)
!84 = distinct !DILexicalBlock(scope: !80, file: !12, line: 51, column: 5)
!85 = !DILocation(line: 53, column: 18, scope: !83)
!86 = !DILocalVariable(name: "dest", scope: !83, file: !12, line: 53, type: !25)
!87 = !DILocation(line: 53, column: 28, scope: !83)
!88 = !DILocalVariable(name: "i", scope: !83, file: !12, line: 54, type: !30)
!89 = !DILocation(line: 54, column: 17, scope: !83)
!90 = !DILocation(line: 56, column: 13, scope: !83)
!91 = !DILocation(line: 57, column: 13, scope: !83)
!92 = !DILocation(line: 57, column: 22, scope: !83)
!93 = !DILocation(line: 58, column: 18, scope: !94)
!94 = distinct !DILexicalBlock(scope: !83, file: !12, line: 58, column: 13)
!95 = !DILocation(line: 58, column: 17, scope: !94)
!96 = !DILocation(line: 58, column: 22, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !12, line: 58, column: 13)
!98 = !DILocation(line: 58, column: 24, scope: !97)
!99 = !DILocation(line: 58, column: 13, scope: !94)
!100 = !DILocation(line: 60, column: 31, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !12, line: 59, column: 13)
!102 = !DILocation(line: 60, column: 27, scope: !101)
!103 = !DILocation(line: 60, column: 22, scope: !101)
!104 = !DILocation(line: 60, column: 17, scope: !101)
!105 = !DILocation(line: 60, column: 25, scope: !101)
!106 = !DILocation(line: 61, column: 13, scope: !101)
!107 = !DILocation(line: 58, column: 31, scope: !97)
!108 = !DILocation(line: 58, column: 13, scope: !97)
!109 = distinct !{!109, !99, !110, !53}
!110 = !DILocation(line: 61, column: 13, scope: !94)
!111 = !DILocation(line: 62, column: 13, scope: !83)
!112 = !DILocation(line: 62, column: 22, scope: !83)
!113 = !DILocation(line: 63, column: 23, scope: !83)
!114 = !DILocation(line: 63, column: 13, scope: !83)
!115 = !DILocation(line: 65, column: 9, scope: !84)
!116 = !DILocation(line: 67, column: 1, scope: !80)
