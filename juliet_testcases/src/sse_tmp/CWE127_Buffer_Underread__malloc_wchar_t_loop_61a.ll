; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %0 = load i32*, i32** %data, align 8, !dbg !22
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_loop_61b_badSource(i32* %0), !dbg !23
  store i32* %call, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !36
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !42
  %cmp = icmp ult i64 %1, 100, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !46
  %3 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx2 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !46
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !46
  %5 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !50
  store i32 %4, i32* %arrayidx3, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %6, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx4, align 4, !dbg !59
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* %arraydecay5), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_loop_61b_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_61_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #4, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #4, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_61_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_61_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i32* null, i32** %data, align 8, !dbg !89
  %0 = load i32*, i32** %data, align 8, !dbg !90
  %call = call i32* @CWE127_Buffer_Underread__malloc_wchar_t_loop_61b_goodG2BSource(i32* %0), !dbg !91
  store i32* %call, i32** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !98
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !99
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  store i64 0, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !105
  %cmp = icmp ult i64 %1, 100, !dbg !107
  br i1 %cmp, label %for.body, label %for.end, !dbg !108

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !109
  %3 = load i64, i64* %i, align 8, !dbg !111
  %arrayidx2 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !109
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !109
  %5 = load i64, i64* %i, align 8, !dbg !112
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !113
  store i32 %4, i32* %arrayidx3, align 4, !dbg !114
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !116
  %inc = add i64 %6, 1, !dbg !116
  store i64 %inc, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !117, !llvm.loop !118

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx4, align 4, !dbg !121
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  call void @printWLine(i32* %arraydecay5), !dbg !123
  ret void, !dbg !124
}

declare dso_local i32* @CWE127_Buffer_Underread__malloc_wchar_t_loop_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !11)
!21 = !DILocation(line: 29, column: 10, scope: !11)
!22 = !DILocation(line: 30, column: 71, scope: !11)
!23 = !DILocation(line: 30, column: 12, scope: !11)
!24 = !DILocation(line: 30, column: 10, scope: !11)
!25 = !DILocalVariable(name: "i", scope: !26, file: !12, line: 32, type: !27)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !28)
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 32, column: 16, scope: !26)
!30 = !DILocalVariable(name: "dest", scope: !26, file: !12, line: 33, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 33, column: 17, scope: !26)
!35 = !DILocation(line: 34, column: 17, scope: !26)
!36 = !DILocation(line: 34, column: 9, scope: !26)
!37 = !DILocation(line: 35, column: 9, scope: !26)
!38 = !DILocation(line: 35, column: 21, scope: !26)
!39 = !DILocation(line: 37, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !26, file: !12, line: 37, column: 9)
!41 = !DILocation(line: 37, column: 14, scope: !40)
!42 = !DILocation(line: 37, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 37, column: 9)
!44 = !DILocation(line: 37, column: 23, scope: !43)
!45 = !DILocation(line: 37, column: 9, scope: !40)
!46 = !DILocation(line: 39, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 38, column: 9)
!48 = !DILocation(line: 39, column: 28, scope: !47)
!49 = !DILocation(line: 39, column: 18, scope: !47)
!50 = !DILocation(line: 39, column: 13, scope: !47)
!51 = !DILocation(line: 39, column: 21, scope: !47)
!52 = !DILocation(line: 40, column: 9, scope: !47)
!53 = !DILocation(line: 37, column: 31, scope: !43)
!54 = !DILocation(line: 37, column: 9, scope: !43)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 40, column: 9, scope: !40)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 42, column: 9, scope: !26)
!59 = !DILocation(line: 42, column: 21, scope: !26)
!60 = !DILocation(line: 43, column: 20, scope: !26)
!61 = !DILocation(line: 43, column: 9, scope: !26)
!62 = !DILocation(line: 47, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_61_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 81, column: 5, scope: !63)
!65 = !DILocation(line: 82, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !67, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!19, !19, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 94, type: !19)
!73 = !DILocation(line: 94, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 94, type: !69)
!75 = !DILocation(line: 94, column: 27, scope: !66)
!76 = !DILocation(line: 97, column: 22, scope: !66)
!77 = !DILocation(line: 97, column: 12, scope: !66)
!78 = !DILocation(line: 97, column: 5, scope: !66)
!79 = !DILocation(line: 99, column: 5, scope: !66)
!80 = !DILocation(line: 100, column: 5, scope: !66)
!81 = !DILocation(line: 101, column: 5, scope: !66)
!82 = !DILocation(line: 104, column: 5, scope: !66)
!83 = !DILocation(line: 105, column: 5, scope: !66)
!84 = !DILocation(line: 106, column: 5, scope: !66)
!85 = !DILocation(line: 108, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 58, type: !16)
!88 = !DILocation(line: 58, column: 15, scope: !86)
!89 = !DILocation(line: 59, column: 10, scope: !86)
!90 = !DILocation(line: 60, column: 75, scope: !86)
!91 = !DILocation(line: 60, column: 12, scope: !86)
!92 = !DILocation(line: 60, column: 10, scope: !86)
!93 = !DILocalVariable(name: "i", scope: !94, file: !12, line: 62, type: !27)
!94 = distinct !DILexicalBlock(scope: !86, file: !12, line: 61, column: 5)
!95 = !DILocation(line: 62, column: 16, scope: !94)
!96 = !DILocalVariable(name: "dest", scope: !94, file: !12, line: 63, type: !31)
!97 = !DILocation(line: 63, column: 17, scope: !94)
!98 = !DILocation(line: 64, column: 17, scope: !94)
!99 = !DILocation(line: 64, column: 9, scope: !94)
!100 = !DILocation(line: 65, column: 9, scope: !94)
!101 = !DILocation(line: 65, column: 21, scope: !94)
!102 = !DILocation(line: 67, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !94, file: !12, line: 67, column: 9)
!104 = !DILocation(line: 67, column: 14, scope: !103)
!105 = !DILocation(line: 67, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !12, line: 67, column: 9)
!107 = !DILocation(line: 67, column: 23, scope: !106)
!108 = !DILocation(line: 67, column: 9, scope: !103)
!109 = !DILocation(line: 69, column: 23, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !12, line: 68, column: 9)
!111 = !DILocation(line: 69, column: 28, scope: !110)
!112 = !DILocation(line: 69, column: 18, scope: !110)
!113 = !DILocation(line: 69, column: 13, scope: !110)
!114 = !DILocation(line: 69, column: 21, scope: !110)
!115 = !DILocation(line: 70, column: 9, scope: !110)
!116 = !DILocation(line: 67, column: 31, scope: !106)
!117 = !DILocation(line: 67, column: 9, scope: !106)
!118 = distinct !{!118, !108, !119, !57}
!119 = !DILocation(line: 70, column: 9, scope: !103)
!120 = !DILocation(line: 72, column: 9, scope: !94)
!121 = !DILocation(line: 72, column: 21, scope: !94)
!122 = !DILocation(line: 73, column: 20, scope: !94)
!123 = !DILocation(line: 73, column: 9, scope: !94)
!124 = !DILocation(line: 77, column: 1, scope: !86)
