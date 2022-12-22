; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_01.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_01_bad() #0 !dbg !11 {
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
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_01_good() #0 !dbg !55 {
entry:
  call void @good1(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__CWE170_char_loop_01_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__CWE170_char_loop_01_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !77 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !78, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32* %i, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !85
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  store i32 0, i32* %i, align 4, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !91
  %cmp = icmp slt i32 %0, 99, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !95
  %idxprom = sext i32 %1 to i64, !dbg !97
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !97
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !97
  %3 = load i32, i32* %i, align 4, !dbg !98
  %idxprom2 = sext i32 %3 to i64, !dbg !99
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !99
  store i8 %2, i8* %arrayidx3, align 1, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !102
  %inc = add nsw i32 %4, 1, !dbg !102
  store i32 %inc, i32* %i, align 4, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx4, align 1, !dbg !107
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @printLine(i8* %arraydecay5), !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_01_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_01.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "src", scope: !16, file: !12, line: 25, type: !17)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 5)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1200, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 150)
!21 = !DILocation(line: 25, column: 14, scope: !16)
!22 = !DILocalVariable(name: "dest", scope: !16, file: !12, line: 25, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 25, column: 24, scope: !16)
!27 = !DILocalVariable(name: "i", scope: !16, file: !12, line: 26, type: !28)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DILocation(line: 26, column: 13, scope: !16)
!30 = !DILocation(line: 28, column: 9, scope: !16)
!31 = !DILocation(line: 29, column: 9, scope: !16)
!32 = !DILocation(line: 29, column: 18, scope: !16)
!33 = !DILocation(line: 30, column: 14, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !12, line: 30, column: 9)
!35 = !DILocation(line: 30, column: 13, scope: !34)
!36 = !DILocation(line: 30, column: 18, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 30, column: 9)
!38 = !DILocation(line: 30, column: 20, scope: !37)
!39 = !DILocation(line: 30, column: 9, scope: !34)
!40 = !DILocation(line: 32, column: 27, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 31, column: 9)
!42 = !DILocation(line: 32, column: 23, scope: !41)
!43 = !DILocation(line: 32, column: 18, scope: !41)
!44 = !DILocation(line: 32, column: 13, scope: !41)
!45 = !DILocation(line: 32, column: 21, scope: !41)
!46 = !DILocation(line: 33, column: 9, scope: !41)
!47 = !DILocation(line: 30, column: 27, scope: !37)
!48 = !DILocation(line: 30, column: 9, scope: !37)
!49 = distinct !{!49, !39, !50, !51}
!50 = !DILocation(line: 33, column: 9, scope: !34)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocation(line: 35, column: 19, scope: !16)
!53 = !DILocation(line: 35, column: 9, scope: !16)
!54 = !DILocation(line: 37, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_01_good", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 62, column: 5, scope: !55)
!57 = !DILocation(line: 63, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 74, type: !59, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!28, !28, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 74, type: !28)
!64 = !DILocation(line: 74, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 74, type: !61)
!66 = !DILocation(line: 74, column: 27, scope: !58)
!67 = !DILocation(line: 77, column: 22, scope: !58)
!68 = !DILocation(line: 77, column: 12, scope: !58)
!69 = !DILocation(line: 77, column: 5, scope: !58)
!70 = !DILocation(line: 79, column: 5, scope: !58)
!71 = !DILocation(line: 80, column: 5, scope: !58)
!72 = !DILocation(line: 81, column: 5, scope: !58)
!73 = !DILocation(line: 84, column: 5, scope: !58)
!74 = !DILocation(line: 85, column: 5, scope: !58)
!75 = !DILocation(line: 86, column: 5, scope: !58)
!76 = !DILocation(line: 88, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 43, type: !13, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "src", scope: !79, file: !12, line: 46, type: !17)
!79 = distinct !DILexicalBlock(scope: !77, file: !12, line: 45, column: 5)
!80 = !DILocation(line: 46, column: 14, scope: !79)
!81 = !DILocalVariable(name: "dest", scope: !79, file: !12, line: 46, type: !23)
!82 = !DILocation(line: 46, column: 24, scope: !79)
!83 = !DILocalVariable(name: "i", scope: !79, file: !12, line: 47, type: !28)
!84 = !DILocation(line: 47, column: 13, scope: !79)
!85 = !DILocation(line: 49, column: 9, scope: !79)
!86 = !DILocation(line: 50, column: 9, scope: !79)
!87 = !DILocation(line: 50, column: 18, scope: !79)
!88 = !DILocation(line: 51, column: 14, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !12, line: 51, column: 9)
!90 = !DILocation(line: 51, column: 13, scope: !89)
!91 = !DILocation(line: 51, column: 18, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 51, column: 9)
!93 = !DILocation(line: 51, column: 20, scope: !92)
!94 = !DILocation(line: 51, column: 9, scope: !89)
!95 = !DILocation(line: 53, column: 27, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !12, line: 52, column: 9)
!97 = !DILocation(line: 53, column: 23, scope: !96)
!98 = !DILocation(line: 53, column: 18, scope: !96)
!99 = !DILocation(line: 53, column: 13, scope: !96)
!100 = !DILocation(line: 53, column: 21, scope: !96)
!101 = !DILocation(line: 54, column: 9, scope: !96)
!102 = !DILocation(line: 51, column: 27, scope: !92)
!103 = !DILocation(line: 51, column: 9, scope: !92)
!104 = distinct !{!104, !94, !105, !51}
!105 = !DILocation(line: 54, column: 9, scope: !89)
!106 = !DILocation(line: 55, column: 9, scope: !79)
!107 = !DILocation(line: 55, column: 18, scope: !79)
!108 = !DILocation(line: 56, column: 19, scope: !79)
!109 = !DILocation(line: 56, column: 9, scope: !79)
!110 = !DILocation(line: 58, column: 1, scope: !77)
