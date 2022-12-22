; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_18_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  br label %sink, !dbg !15

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !16), !dbg !17
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !18, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !33
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %sink
  %0 = load i32, i32* %i, align 4, !dbg !39
  %cmp = icmp slt i32 %0, 99, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !43
  %idxprom = sext i32 %1 to i64, !dbg !45
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !45
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !45
  %3 = load i32, i32* %i, align 4, !dbg !46
  %idxprom2 = sext i32 %3 to i64, !dbg !47
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !47
  store i8 %2, i8* %arrayidx3, align 1, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %4, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @printLine(i8* %arraydecay4), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_loop_18_good() #0 !dbg !58 {
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
  call void @CWE126_Buffer_Overread__CWE170_char_loop_18_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE170_char_loop_18_bad(), !dbg !77
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
  br label %sink, !dbg !81

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !82), !dbg !83
  call void @llvm.dbg.declare(metadata [150 x i8]* %src, metadata !84, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32* %i, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 0, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !91
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 149, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  store i32 0, i32* %i, align 4, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %sink
  %0 = load i32, i32* %i, align 4, !dbg !97
  %cmp = icmp slt i32 %0, 99, !dbg !99
  br i1 %cmp, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !101
  %idxprom = sext i32 %1 to i64, !dbg !103
  %arrayidx1 = getelementptr inbounds [150 x i8], [150 x i8]* %src, i64 0, i64 %idxprom, !dbg !103
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !103
  %3 = load i32, i32* %i, align 4, !dbg !104
  %idxprom2 = sext i32 %3 to i64, !dbg !105
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %idxprom2, !dbg !105
  store i8 %2, i8* %arrayidx3, align 1, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !108
  %inc = add nsw i32 %4, 1, !dbg !108
  store i32 %inc, i32* %i, align 4, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !112
  store i8 0, i8* %arrayidx4, align 1, !dbg !113
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !114
  call void @printLine(i8* %arraydecay5), !dbg !115
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_18_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_loop_18.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 5, scope: !11)
!16 = !DILabel(scope: !11, name: "sink", file: !12, line: 25)
!17 = !DILocation(line: 25, column: 1, scope: !11)
!18 = !DILocalVariable(name: "src", scope: !19, file: !12, line: 27, type: !20)
!19 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 1200, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 150)
!24 = !DILocation(line: 27, column: 14, scope: !19)
!25 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 24, scope: !19)
!30 = !DILocalVariable(name: "i", scope: !19, file: !12, line: 28, type: !31)
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !DILocation(line: 28, column: 13, scope: !19)
!33 = !DILocation(line: 30, column: 9, scope: !19)
!34 = !DILocation(line: 31, column: 9, scope: !19)
!35 = !DILocation(line: 31, column: 18, scope: !19)
!36 = !DILocation(line: 32, column: 14, scope: !37)
!37 = distinct !DILexicalBlock(scope: !19, file: !12, line: 32, column: 9)
!38 = !DILocation(line: 32, column: 13, scope: !37)
!39 = !DILocation(line: 32, column: 18, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 32, column: 9)
!41 = !DILocation(line: 32, column: 20, scope: !40)
!42 = !DILocation(line: 32, column: 9, scope: !37)
!43 = !DILocation(line: 34, column: 27, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 33, column: 9)
!45 = !DILocation(line: 34, column: 23, scope: !44)
!46 = !DILocation(line: 34, column: 18, scope: !44)
!47 = !DILocation(line: 34, column: 13, scope: !44)
!48 = !DILocation(line: 34, column: 21, scope: !44)
!49 = !DILocation(line: 35, column: 9, scope: !44)
!50 = !DILocation(line: 32, column: 27, scope: !40)
!51 = !DILocation(line: 32, column: 9, scope: !40)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 35, column: 9, scope: !37)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 37, column: 19, scope: !19)
!56 = !DILocation(line: 37, column: 9, scope: !19)
!57 = !DILocation(line: 39, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_loop_18_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 67, column: 5, scope: !58)
!60 = !DILocation(line: 68, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 79, type: !62, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!31, !31, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !12, line: 79, type: !31)
!67 = !DILocation(line: 79, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !12, line: 79, type: !64)
!69 = !DILocation(line: 79, column: 27, scope: !61)
!70 = !DILocation(line: 82, column: 22, scope: !61)
!71 = !DILocation(line: 82, column: 12, scope: !61)
!72 = !DILocation(line: 82, column: 5, scope: !61)
!73 = !DILocation(line: 84, column: 5, scope: !61)
!74 = !DILocation(line: 85, column: 5, scope: !61)
!75 = !DILocation(line: 86, column: 5, scope: !61)
!76 = !DILocation(line: 89, column: 5, scope: !61)
!77 = !DILocation(line: 90, column: 5, scope: !61)
!78 = !DILocation(line: 91, column: 5, scope: !61)
!79 = !DILocation(line: 93, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 48, column: 5, scope: !80)
!82 = !DILabel(scope: !80, name: "sink", file: !12, line: 49)
!83 = !DILocation(line: 49, column: 1, scope: !80)
!84 = !DILocalVariable(name: "src", scope: !85, file: !12, line: 51, type: !20)
!85 = distinct !DILexicalBlock(scope: !80, file: !12, line: 50, column: 5)
!86 = !DILocation(line: 51, column: 14, scope: !85)
!87 = !DILocalVariable(name: "dest", scope: !85, file: !12, line: 51, type: !26)
!88 = !DILocation(line: 51, column: 24, scope: !85)
!89 = !DILocalVariable(name: "i", scope: !85, file: !12, line: 52, type: !31)
!90 = !DILocation(line: 52, column: 13, scope: !85)
!91 = !DILocation(line: 54, column: 9, scope: !85)
!92 = !DILocation(line: 55, column: 9, scope: !85)
!93 = !DILocation(line: 55, column: 18, scope: !85)
!94 = !DILocation(line: 56, column: 14, scope: !95)
!95 = distinct !DILexicalBlock(scope: !85, file: !12, line: 56, column: 9)
!96 = !DILocation(line: 56, column: 13, scope: !95)
!97 = !DILocation(line: 56, column: 18, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !12, line: 56, column: 9)
!99 = !DILocation(line: 56, column: 20, scope: !98)
!100 = !DILocation(line: 56, column: 9, scope: !95)
!101 = !DILocation(line: 58, column: 27, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 57, column: 9)
!103 = !DILocation(line: 58, column: 23, scope: !102)
!104 = !DILocation(line: 58, column: 18, scope: !102)
!105 = !DILocation(line: 58, column: 13, scope: !102)
!106 = !DILocation(line: 58, column: 21, scope: !102)
!107 = !DILocation(line: 59, column: 9, scope: !102)
!108 = !DILocation(line: 56, column: 27, scope: !98)
!109 = !DILocation(line: 56, column: 9, scope: !98)
!110 = distinct !{!110, !100, !111, !54}
!111 = !DILocation(line: 59, column: 9, scope: !95)
!112 = !DILocation(line: 60, column: 9, scope: !85)
!113 = !DILocation(line: 60, column: 18, scope: !85)
!114 = !DILocation(line: 61, column: 19, scope: !85)
!115 = !DILocation(line: 61, column: 9, scope: !85)
!116 = !DILocation(line: 63, column: 1, scope: !80)
