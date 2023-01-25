; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_16.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_16_bad() #0 !dbg !11 {
entry:
  %src = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  br label %while.body, !dbg !15

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !33
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !34
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %while.body
  %0 = load i32, i32* %i, align 4, !dbg !40
  %cmp = icmp slt i32 %0, 99, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !44
  %idxprom = sext i32 %1 to i64, !dbg !46
  %arrayidx1 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !46
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !46
  %3 = load i32, i32* %i, align 4, !dbg !47
  %idxprom2 = sext i32 %3 to i64, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom2, !dbg !48
  store i32 %2, i32* %arrayidx3, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %4, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* %arraydecay4), !dbg !57
  br label %while.end, !dbg !58

while.end:                                        ; preds = %for.end
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_16_good() #0 !dbg !60 {
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
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_16_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_loop_16_bad(), !dbg !80
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
  br label %while.body, !dbg !84

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %src, metadata !85, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32* %i, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 0, !dbg !93
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !94
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 149, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  store i32 0, i32* %i, align 4, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %while.body
  %0 = load i32, i32* %i, align 4, !dbg !100
  %cmp = icmp slt i32 %0, 99, !dbg !102
  br i1 %cmp, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !104
  %idxprom = sext i32 %1 to i64, !dbg !106
  %arrayidx1 = getelementptr inbounds [150 x i32], [150 x i32]* %src, i64 0, i64 %idxprom, !dbg !106
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !106
  %3 = load i32, i32* %i, align 4, !dbg !107
  %idxprom2 = sext i32 %3 to i64, !dbg !108
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %idxprom2, !dbg !108
  store i32 %2, i32* %arrayidx3, align 4, !dbg !109
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !111
  %inc = add nsw i32 %4, 1, !dbg !111
  store i32 %inc, i32* %i, align 4, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx4, align 4, !dbg !116
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  call void @printWLine(i32* %arraydecay5), !dbg !118
  br label %while.end, !dbg !119

while.end:                                        ; preds = %for.end
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_16_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 5, scope: !11)
!16 = !DILocalVariable(name: "src", scope: !17, file: !12, line: 27, type: !19)
!17 = distinct !DILexicalBlock(scope: !18, file: !12, line: 26, column: 9)
!18 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 4800, elements: !23)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !22)
!21 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !{!24}
!24 = !DISubrange(count: 150)
!25 = !DILocation(line: 27, column: 21, scope: !17)
!26 = !DILocalVariable(name: "dest", scope: !17, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 31, scope: !17)
!31 = !DILocalVariable(name: "i", scope: !17, file: !12, line: 28, type: !22)
!32 = !DILocation(line: 28, column: 17, scope: !17)
!33 = !DILocation(line: 30, column: 21, scope: !17)
!34 = !DILocation(line: 30, column: 13, scope: !17)
!35 = !DILocation(line: 31, column: 13, scope: !17)
!36 = !DILocation(line: 31, column: 22, scope: !17)
!37 = !DILocation(line: 32, column: 18, scope: !38)
!38 = distinct !DILexicalBlock(scope: !17, file: !12, line: 32, column: 13)
!39 = !DILocation(line: 32, column: 17, scope: !38)
!40 = !DILocation(line: 32, column: 22, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !12, line: 32, column: 13)
!42 = !DILocation(line: 32, column: 24, scope: !41)
!43 = !DILocation(line: 32, column: 13, scope: !38)
!44 = !DILocation(line: 34, column: 31, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !12, line: 33, column: 13)
!46 = !DILocation(line: 34, column: 27, scope: !45)
!47 = !DILocation(line: 34, column: 22, scope: !45)
!48 = !DILocation(line: 34, column: 17, scope: !45)
!49 = !DILocation(line: 34, column: 25, scope: !45)
!50 = !DILocation(line: 35, column: 13, scope: !45)
!51 = !DILocation(line: 32, column: 31, scope: !41)
!52 = !DILocation(line: 32, column: 13, scope: !41)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 35, column: 13, scope: !38)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 37, column: 24, scope: !17)
!57 = !DILocation(line: 37, column: 13, scope: !17)
!58 = !DILocation(line: 39, column: 9, scope: !18)
!59 = !DILocation(line: 41, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_loop_16_good", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 71, column: 5, scope: !60)
!62 = !DILocation(line: 72, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 83, type: !64, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!22, !22, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 83, type: !22)
!70 = !DILocation(line: 83, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 83, type: !66)
!72 = !DILocation(line: 83, column: 27, scope: !63)
!73 = !DILocation(line: 86, column: 22, scope: !63)
!74 = !DILocation(line: 86, column: 12, scope: !63)
!75 = !DILocation(line: 86, column: 5, scope: !63)
!76 = !DILocation(line: 88, column: 5, scope: !63)
!77 = !DILocation(line: 89, column: 5, scope: !63)
!78 = !DILocation(line: 90, column: 5, scope: !63)
!79 = !DILocation(line: 93, column: 5, scope: !63)
!80 = !DILocation(line: 94, column: 5, scope: !63)
!81 = !DILocation(line: 95, column: 5, scope: !63)
!82 = !DILocation(line: 97, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 50, column: 5, scope: !83)
!85 = !DILocalVariable(name: "src", scope: !86, file: !12, line: 53, type: !19)
!86 = distinct !DILexicalBlock(scope: !87, file: !12, line: 52, column: 9)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 51, column: 5)
!88 = !DILocation(line: 53, column: 21, scope: !86)
!89 = !DILocalVariable(name: "dest", scope: !86, file: !12, line: 53, type: !27)
!90 = !DILocation(line: 53, column: 31, scope: !86)
!91 = !DILocalVariable(name: "i", scope: !86, file: !12, line: 54, type: !22)
!92 = !DILocation(line: 54, column: 17, scope: !86)
!93 = !DILocation(line: 56, column: 21, scope: !86)
!94 = !DILocation(line: 56, column: 13, scope: !86)
!95 = !DILocation(line: 57, column: 13, scope: !86)
!96 = !DILocation(line: 57, column: 22, scope: !86)
!97 = !DILocation(line: 58, column: 18, scope: !98)
!98 = distinct !DILexicalBlock(scope: !86, file: !12, line: 58, column: 13)
!99 = !DILocation(line: 58, column: 17, scope: !98)
!100 = !DILocation(line: 58, column: 22, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !12, line: 58, column: 13)
!102 = !DILocation(line: 58, column: 24, scope: !101)
!103 = !DILocation(line: 58, column: 13, scope: !98)
!104 = !DILocation(line: 60, column: 31, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !12, line: 59, column: 13)
!106 = !DILocation(line: 60, column: 27, scope: !105)
!107 = !DILocation(line: 60, column: 22, scope: !105)
!108 = !DILocation(line: 60, column: 17, scope: !105)
!109 = !DILocation(line: 60, column: 25, scope: !105)
!110 = !DILocation(line: 61, column: 13, scope: !105)
!111 = !DILocation(line: 58, column: 31, scope: !101)
!112 = !DILocation(line: 58, column: 13, scope: !101)
!113 = distinct !{!113, !103, !114, !55}
!114 = !DILocation(line: 61, column: 13, scope: !98)
!115 = !DILocation(line: 62, column: 13, scope: !86)
!116 = !DILocation(line: 62, column: 22, scope: !86)
!117 = !DILocation(line: 63, column: 24, scope: !86)
!118 = !DILocation(line: 63, column: 13, scope: !86)
!119 = !DILocation(line: 65, column: 9, scope: !87)
!120 = !DILocation(line: 67, column: 1, scope: !83)
