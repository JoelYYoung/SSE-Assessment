; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_17_bad() #0 !dbg !11 {
entry:
  %j = alloca i32, align 4
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %j, metadata !15, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %j, align 4, !dbg !18
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4, !dbg !21
  %cmp = icmp slt i32 %0, 1, !dbg !23
  br i1 %cmp, label %for.body, label %for.end, !dbg !24

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !25, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !39
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !40
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !43
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !44
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !46
  call void @printWLine(i32* %arraydecay4), !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %j, align 4, !dbg !49
  %inc = add nsw i32 %1, 1, !dbg !49
  store i32 %inc, i32* %j, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_17_good() #0 !dbg !55 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #4, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #4, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_17_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_17_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !78 {
entry:
  %k = alloca i32, align 4
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %k, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 0, i32* %k, align 4, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !84
  %cmp = icmp slt i32 %0, 1, !dbg !86
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !88, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !94
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !95
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !98
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !99
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !100
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx4, align 4, !dbg !102
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !103
  call void @printWLine(i32* %arraydecay5), !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %k, align 4, !dbg !106
  %inc = add nsw i32 %1, 1, !dbg !106
  store i32 %inc, i32* %k, align 4, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  ret void, !dbg !110
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_17_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!25 = !DILocalVariable(name: "data", scope: !26, file: !12, line: 28, type: !28)
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
!38 = !DILocation(line: 28, column: 32, scope: !26)
!39 = !DILocation(line: 30, column: 21, scope: !26)
!40 = !DILocation(line: 30, column: 13, scope: !26)
!41 = !DILocation(line: 31, column: 13, scope: !26)
!42 = !DILocation(line: 31, column: 23, scope: !26)
!43 = !DILocation(line: 34, column: 21, scope: !26)
!44 = !DILocation(line: 34, column: 27, scope: !26)
!45 = !DILocation(line: 34, column: 13, scope: !26)
!46 = !DILocation(line: 36, column: 24, scope: !26)
!47 = !DILocation(line: 36, column: 13, scope: !26)
!48 = !DILocation(line: 38, column: 5, scope: !27)
!49 = !DILocation(line: 25, column: 24, scope: !22)
!50 = !DILocation(line: 25, column: 5, scope: !22)
!51 = distinct !{!51, !24, !52, !53}
!52 = !DILocation(line: 38, column: 5, scope: !19)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 39, column: 1, scope: !11)
!55 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_17_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 67, column: 5, scope: !55)
!57 = !DILocation(line: 68, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 79, type: !59, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!16, !16, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 79, type: !16)
!65 = !DILocation(line: 79, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 79, type: !61)
!67 = !DILocation(line: 79, column: 27, scope: !58)
!68 = !DILocation(line: 82, column: 22, scope: !58)
!69 = !DILocation(line: 82, column: 12, scope: !58)
!70 = !DILocation(line: 82, column: 5, scope: !58)
!71 = !DILocation(line: 84, column: 5, scope: !58)
!72 = !DILocation(line: 85, column: 5, scope: !58)
!73 = !DILocation(line: 86, column: 5, scope: !58)
!74 = !DILocation(line: 89, column: 5, scope: !58)
!75 = !DILocation(line: 90, column: 5, scope: !58)
!76 = !DILocation(line: 91, column: 5, scope: !58)
!77 = !DILocation(line: 93, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "k", scope: !78, file: !12, line: 48, type: !16)
!80 = !DILocation(line: 48, column: 9, scope: !78)
!81 = !DILocation(line: 49, column: 11, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !12, line: 49, column: 5)
!83 = !DILocation(line: 49, column: 9, scope: !82)
!84 = !DILocation(line: 49, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 49, column: 5)
!86 = !DILocation(line: 49, column: 18, scope: !85)
!87 = !DILocation(line: 49, column: 5, scope: !82)
!88 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 52, type: !28)
!89 = distinct !DILexicalBlock(scope: !90, file: !12, line: 51, column: 9)
!90 = distinct !DILexicalBlock(scope: !85, file: !12, line: 50, column: 5)
!91 = !DILocation(line: 52, column: 21, scope: !89)
!92 = !DILocalVariable(name: "dest", scope: !89, file: !12, line: 52, type: !35)
!93 = !DILocation(line: 52, column: 32, scope: !89)
!94 = !DILocation(line: 54, column: 21, scope: !89)
!95 = !DILocation(line: 54, column: 13, scope: !89)
!96 = !DILocation(line: 55, column: 13, scope: !89)
!97 = !DILocation(line: 55, column: 23, scope: !89)
!98 = !DILocation(line: 58, column: 21, scope: !89)
!99 = !DILocation(line: 58, column: 27, scope: !89)
!100 = !DILocation(line: 58, column: 13, scope: !89)
!101 = !DILocation(line: 59, column: 13, scope: !89)
!102 = !DILocation(line: 59, column: 22, scope: !89)
!103 = !DILocation(line: 60, column: 24, scope: !89)
!104 = !DILocation(line: 60, column: 13, scope: !89)
!105 = !DILocation(line: 62, column: 5, scope: !90)
!106 = !DILocation(line: 49, column: 24, scope: !85)
!107 = !DILocation(line: 49, column: 5, scope: !85)
!108 = distinct !{!108, !87, !109, !53}
!109 = !DILocation(line: 62, column: 5, scope: !82)
!110 = !DILocation(line: 63, column: 1, scope: !78)
