; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_18_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  br label %sink, !dbg !15

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !16), !dbg !17
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !18, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i32* %i, metadata !32, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !35
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %sink
  %0 = load i32, i32* %i, align 4, !dbg !41
  %cmp = icmp slt i32 %0, 99, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !45
  %idxprom = sext i32 %1 to i64, !dbg !47
  %arrayidx1 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !47
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !47
  %3 = load i32, i32* %i, align 4, !dbg !48
  %idxprom2 = sext i32 %3 to i64, !dbg !49
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom2, !dbg !49
  store i32 %2, i32* %arrayidx3, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %4, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  call void @printWLine(i32* %arraydecay4), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_18_good() #0 !dbg !60 {
entry:
  call void @good1(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #4, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #4, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_18_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_18_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !83 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  br label %sink, !dbg !84

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !85), !dbg !86
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !87, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32* %i, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !94
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !95
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  store i32 0, i32* %i, align 4, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %sink
  %0 = load i32, i32* %i, align 4, !dbg !101
  %cmp = icmp slt i32 %0, 99, !dbg !103
  br i1 %cmp, label %for.body, label %for.end, !dbg !104

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !105
  %idxprom = sext i32 %1 to i64, !dbg !107
  %arrayidx1 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !107
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !107
  %3 = load i32, i32* %i, align 4, !dbg !108
  %idxprom2 = sext i32 %3 to i64, !dbg !109
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom2, !dbg !109
  store i32 %2, i32* %arrayidx3, align 4, !dbg !110
  br label %for.inc, !dbg !111

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !112
  %inc = add nsw i32 %4, 1, !dbg !112
  store i32 %inc, i32* %i, align 4, !dbg !112
  br label %for.cond, !dbg !113, !llvm.loop !114

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx4, align 4, !dbg !117
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  call void @printWLine(i32* %arraydecay5), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_18_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_18.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 5, scope: !11)
!16 = !DILabel(scope: !11, name: "sink", file: !12, line: 25)
!17 = !DILocation(line: 25, column: 1, scope: !11)
!18 = !DILocalVariable(name: "src", scope: !19, file: !12, line: 27, type: !20)
!19 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 4800, elements: !24)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !23)
!22 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !{!25}
!25 = !DISubrange(count: 150)
!26 = !DILocation(line: 27, column: 17, scope: !19)
!27 = !DILocalVariable(name: "dest", scope: !19, file: !12, line: 27, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 27, column: 27, scope: !19)
!32 = !DILocalVariable(name: "i", scope: !19, file: !12, line: 28, type: !23)
!33 = !DILocation(line: 28, column: 13, scope: !19)
!34 = !DILocation(line: 30, column: 17, scope: !19)
!35 = !DILocation(line: 30, column: 9, scope: !19)
!36 = !DILocation(line: 31, column: 9, scope: !19)
!37 = !DILocation(line: 31, column: 18, scope: !19)
!38 = !DILocation(line: 32, column: 14, scope: !39)
!39 = distinct !DILexicalBlock(scope: !19, file: !12, line: 32, column: 9)
!40 = !DILocation(line: 32, column: 13, scope: !39)
!41 = !DILocation(line: 32, column: 18, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 32, column: 9)
!43 = !DILocation(line: 32, column: 20, scope: !42)
!44 = !DILocation(line: 32, column: 9, scope: !39)
!45 = !DILocation(line: 34, column: 27, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 33, column: 9)
!47 = !DILocation(line: 34, column: 23, scope: !46)
!48 = !DILocation(line: 34, column: 18, scope: !46)
!49 = !DILocation(line: 34, column: 13, scope: !46)
!50 = !DILocation(line: 34, column: 21, scope: !46)
!51 = !DILocation(line: 35, column: 9, scope: !46)
!52 = !DILocation(line: 32, column: 27, scope: !42)
!53 = !DILocation(line: 32, column: 9, scope: !42)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 35, column: 9, scope: !39)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 37, column: 20, scope: !19)
!58 = !DILocation(line: 37, column: 9, scope: !19)
!59 = !DILocation(line: 39, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_18_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 67, column: 5, scope: !60)
!62 = !DILocation(line: 68, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 79, type: !64, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!23, !23, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 79, type: !23)
!70 = !DILocation(line: 79, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 79, type: !66)
!72 = !DILocation(line: 79, column: 27, scope: !63)
!73 = !DILocation(line: 82, column: 22, scope: !63)
!74 = !DILocation(line: 82, column: 12, scope: !63)
!75 = !DILocation(line: 82, column: 5, scope: !63)
!76 = !DILocation(line: 84, column: 5, scope: !63)
!77 = !DILocation(line: 85, column: 5, scope: !63)
!78 = !DILocation(line: 86, column: 5, scope: !63)
!79 = !DILocation(line: 89, column: 5, scope: !63)
!80 = !DILocation(line: 90, column: 5, scope: !63)
!81 = !DILocation(line: 91, column: 5, scope: !63)
!82 = !DILocation(line: 93, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 48, column: 5, scope: !83)
!85 = !DILabel(scope: !83, name: "sink", file: !12, line: 49)
!86 = !DILocation(line: 49, column: 1, scope: !83)
!87 = !DILocalVariable(name: "src", scope: !88, file: !12, line: 51, type: !20)
!88 = distinct !DILexicalBlock(scope: !83, file: !12, line: 50, column: 5)
!89 = !DILocation(line: 51, column: 17, scope: !88)
!90 = !DILocalVariable(name: "dest", scope: !88, file: !12, line: 51, type: !28)
!91 = !DILocation(line: 51, column: 27, scope: !88)
!92 = !DILocalVariable(name: "i", scope: !88, file: !12, line: 52, type: !23)
!93 = !DILocation(line: 52, column: 13, scope: !88)
!94 = !DILocation(line: 54, column: 17, scope: !88)
!95 = !DILocation(line: 54, column: 9, scope: !88)
!96 = !DILocation(line: 55, column: 9, scope: !88)
!97 = !DILocation(line: 55, column: 18, scope: !88)
!98 = !DILocation(line: 56, column: 14, scope: !99)
!99 = distinct !DILexicalBlock(scope: !88, file: !12, line: 56, column: 9)
!100 = !DILocation(line: 56, column: 13, scope: !99)
!101 = !DILocation(line: 56, column: 18, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !12, line: 56, column: 9)
!103 = !DILocation(line: 56, column: 20, scope: !102)
!104 = !DILocation(line: 56, column: 9, scope: !99)
!105 = !DILocation(line: 58, column: 27, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !12, line: 57, column: 9)
!107 = !DILocation(line: 58, column: 23, scope: !106)
!108 = !DILocation(line: 58, column: 18, scope: !106)
!109 = !DILocation(line: 58, column: 13, scope: !106)
!110 = !DILocation(line: 58, column: 21, scope: !106)
!111 = !DILocation(line: 59, column: 9, scope: !106)
!112 = !DILocation(line: 56, column: 27, scope: !102)
!113 = !DILocation(line: 56, column: 9, scope: !102)
!114 = distinct !{!114, !104, !115, !56}
!115 = !DILocation(line: 59, column: 9, scope: !99)
!116 = !DILocation(line: 60, column: 9, scope: !88)
!117 = !DILocation(line: 60, column: 18, scope: !88)
!118 = !DILocation(line: 61, column: 20, scope: !88)
!119 = !DILocation(line: 61, column: 9, scope: !88)
!120 = !DILocation(line: 63, column: 1, scope: !83)
