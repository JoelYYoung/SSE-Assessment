; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_61a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_61a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_61_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %0 = load i32*, i32** %data, align 8, !dbg !22
  %call = call i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_61b_badSource(i32* %0), !dbg !23
  store i32* %call, i32** %data, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !37
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !38
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !41
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !42
  store i64 %call3, i64* %destLen, align 8, !dbg !43
  store i64 0, i64* %i, align 8, !dbg !44
  br label %for.cond, !dbg !46

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !47
  %2 = load i64, i64* %destLen, align 8, !dbg !49
  %cmp = icmp ult i64 %1, %2, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !52
  %4 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !52
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !52
  %6 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !56
  store i32 %5, i32* %arrayidx5, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %7, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx6, align 4, !dbg !65
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  call void @printWLine(i32* %arraydecay7), !dbg !67
  %8 = load i32*, i32** %data, align 8, !dbg !68
  %9 = bitcast i32* %8 to i8*, !dbg !68
  call void @free(i8* %9) #5, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_61b_badSource(i32*) #2

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_61_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_61_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_61_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i32* null, i32** %data, align 8, !dbg !97
  %0 = load i32*, i32** %data, align 8, !dbg !98
  %call = call i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_61b_goodG2BSource(i32* %0), !dbg !99
  store i32* %call, i32** %data, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i64* %i, metadata !101, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !109
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !113
  store i64 %call3, i64* %destLen, align 8, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !118
  %2 = load i64, i64* %destLen, align 8, !dbg !120
  %cmp = icmp ult i64 %1, %2, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !123
  %4 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx4 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !123
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !123
  %6 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !127
  store i32 %5, i32* %arrayidx5, align 4, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %7, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx6, align 4, !dbg !135
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !136
  call void @printWLine(i32* %arraydecay7), !dbg !137
  %8 = load i32*, i32** %data, align 8, !dbg !138
  %9 = bitcast i32* %8 to i8*, !dbg !138
  call void @free(i8* %9) #5, !dbg !139
  ret void, !dbg !140
}

declare dso_local i32* @CWE126_Buffer_Overread__malloc_wchar_t_loop_61b_goodG2BSource(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_61_bad", scope: !12, file: !12, line: 26, type: !13, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_61a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 28, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 28, column: 15, scope: !11)
!21 = !DILocation(line: 29, column: 10, scope: !11)
!22 = !DILocation(line: 30, column: 70, scope: !11)
!23 = !DILocation(line: 30, column: 12, scope: !11)
!24 = !DILocation(line: 30, column: 10, scope: !11)
!25 = !DILocalVariable(name: "i", scope: !26, file: !12, line: 32, type: !27)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !28)
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 32, column: 16, scope: !26)
!30 = !DILocalVariable(name: "destLen", scope: !26, file: !12, line: 32, type: !27)
!31 = !DILocation(line: 32, column: 19, scope: !26)
!32 = !DILocalVariable(name: "dest", scope: !26, file: !12, line: 33, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 17, scope: !26)
!37 = !DILocation(line: 34, column: 17, scope: !26)
!38 = !DILocation(line: 34, column: 9, scope: !26)
!39 = !DILocation(line: 35, column: 9, scope: !26)
!40 = !DILocation(line: 35, column: 21, scope: !26)
!41 = !DILocation(line: 36, column: 26, scope: !26)
!42 = !DILocation(line: 36, column: 19, scope: !26)
!43 = !DILocation(line: 36, column: 17, scope: !26)
!44 = !DILocation(line: 39, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !26, file: !12, line: 39, column: 9)
!46 = !DILocation(line: 39, column: 14, scope: !45)
!47 = !DILocation(line: 39, column: 21, scope: !48)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 39, column: 9)
!49 = !DILocation(line: 39, column: 25, scope: !48)
!50 = !DILocation(line: 39, column: 23, scope: !48)
!51 = !DILocation(line: 39, column: 9, scope: !45)
!52 = !DILocation(line: 41, column: 23, scope: !53)
!53 = distinct !DILexicalBlock(scope: !48, file: !12, line: 40, column: 9)
!54 = !DILocation(line: 41, column: 28, scope: !53)
!55 = !DILocation(line: 41, column: 18, scope: !53)
!56 = !DILocation(line: 41, column: 13, scope: !53)
!57 = !DILocation(line: 41, column: 21, scope: !53)
!58 = !DILocation(line: 42, column: 9, scope: !53)
!59 = !DILocation(line: 39, column: 35, scope: !48)
!60 = !DILocation(line: 39, column: 9, scope: !48)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 42, column: 9, scope: !45)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 43, column: 9, scope: !26)
!65 = !DILocation(line: 43, column: 21, scope: !26)
!66 = !DILocation(line: 44, column: 20, scope: !26)
!67 = !DILocation(line: 44, column: 9, scope: !26)
!68 = !DILocation(line: 45, column: 14, scope: !26)
!69 = !DILocation(line: 45, column: 9, scope: !26)
!70 = !DILocation(line: 47, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_61_good", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 81, column: 5, scope: !71)
!73 = !DILocation(line: 82, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !75, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!19, !19, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 94, type: !19)
!81 = !DILocation(line: 94, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 94, type: !77)
!83 = !DILocation(line: 94, column: 27, scope: !74)
!84 = !DILocation(line: 97, column: 22, scope: !74)
!85 = !DILocation(line: 97, column: 12, scope: !74)
!86 = !DILocation(line: 97, column: 5, scope: !74)
!87 = !DILocation(line: 99, column: 5, scope: !74)
!88 = !DILocation(line: 100, column: 5, scope: !74)
!89 = !DILocation(line: 101, column: 5, scope: !74)
!90 = !DILocation(line: 104, column: 5, scope: !74)
!91 = !DILocation(line: 105, column: 5, scope: !74)
!92 = !DILocation(line: 106, column: 5, scope: !74)
!93 = !DILocation(line: 108, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 58, type: !16)
!96 = !DILocation(line: 58, column: 15, scope: !94)
!97 = !DILocation(line: 59, column: 10, scope: !94)
!98 = !DILocation(line: 60, column: 74, scope: !94)
!99 = !DILocation(line: 60, column: 12, scope: !94)
!100 = !DILocation(line: 60, column: 10, scope: !94)
!101 = !DILocalVariable(name: "i", scope: !102, file: !12, line: 62, type: !27)
!102 = distinct !DILexicalBlock(scope: !94, file: !12, line: 61, column: 5)
!103 = !DILocation(line: 62, column: 16, scope: !102)
!104 = !DILocalVariable(name: "destLen", scope: !102, file: !12, line: 62, type: !27)
!105 = !DILocation(line: 62, column: 19, scope: !102)
!106 = !DILocalVariable(name: "dest", scope: !102, file: !12, line: 63, type: !33)
!107 = !DILocation(line: 63, column: 17, scope: !102)
!108 = !DILocation(line: 64, column: 17, scope: !102)
!109 = !DILocation(line: 64, column: 9, scope: !102)
!110 = !DILocation(line: 65, column: 9, scope: !102)
!111 = !DILocation(line: 65, column: 21, scope: !102)
!112 = !DILocation(line: 66, column: 26, scope: !102)
!113 = !DILocation(line: 66, column: 19, scope: !102)
!114 = !DILocation(line: 66, column: 17, scope: !102)
!115 = !DILocation(line: 69, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !102, file: !12, line: 69, column: 9)
!117 = !DILocation(line: 69, column: 14, scope: !116)
!118 = !DILocation(line: 69, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 69, column: 9)
!120 = !DILocation(line: 69, column: 25, scope: !119)
!121 = !DILocation(line: 69, column: 23, scope: !119)
!122 = !DILocation(line: 69, column: 9, scope: !116)
!123 = !DILocation(line: 71, column: 23, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !12, line: 70, column: 9)
!125 = !DILocation(line: 71, column: 28, scope: !124)
!126 = !DILocation(line: 71, column: 18, scope: !124)
!127 = !DILocation(line: 71, column: 13, scope: !124)
!128 = !DILocation(line: 71, column: 21, scope: !124)
!129 = !DILocation(line: 72, column: 9, scope: !124)
!130 = !DILocation(line: 69, column: 35, scope: !119)
!131 = !DILocation(line: 69, column: 9, scope: !119)
!132 = distinct !{!132, !122, !133, !63}
!133 = !DILocation(line: 72, column: 9, scope: !116)
!134 = !DILocation(line: 73, column: 9, scope: !102)
!135 = !DILocation(line: 73, column: 21, scope: !102)
!136 = !DILocation(line: 74, column: 20, scope: !102)
!137 = !DILocation(line: 74, column: 9, scope: !102)
!138 = !DILocation(line: 75, column: 14, scope: !102)
!139 = !DILocation(line: 75, column: 9, scope: !102)
!140 = !DILocation(line: 77, column: 1, scope: !94)
