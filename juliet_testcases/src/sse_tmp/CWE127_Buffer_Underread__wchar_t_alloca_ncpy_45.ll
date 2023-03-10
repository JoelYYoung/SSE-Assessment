; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_goodG2BData = internal global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %5, i32** @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* null) #5, !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 %conv) #5, !dbg !56
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_good(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_bad(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32*, i32** @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_badData, align 8, !dbg !67
  store i32* %0, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !68, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !74
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !75
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !76
  store i32 0, i32* %arrayidx, align 4, !dbg !77
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !78
  %1 = load i32*, i32** %data, align 8, !dbg !79
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !80
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !81
  %call4 = call i32* @wcsncpy(i32* %arraydecay1, i32* %1, i64 %call3) #5, !dbg !82
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx5, align 4, !dbg !84
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  call void @printWLine(i32* %arraydecay6), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 400, align 16, !dbg !93
  %1 = bitcast i8* %0 to i32*, !dbg !94
  store i32* %1, i32** %dataBuffer, align 8, !dbg !92
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !95
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !96
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  store i32* %4, i32** %data, align 8, !dbg !100
  %5 = load i32*, i32** %data, align 8, !dbg !101
  store i32* %5, i32** @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_goodG2BData, align 8, !dbg !102
  call void @goodG2BSink(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32*, i32** @CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_goodG2BData, align 8, !dbg !108
  store i32* %0, i32** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !113
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %call3 = call i64 @wcslen(i32* %arraydecay2) #6, !dbg !119
  %call4 = call i32* @wcsncpy(i32* %arraydecay1, i32* %1, i64 %call3) #5, !dbg !120
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx5, align 4, !dbg !122
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  call void @printWLine(i32* %arraydecay6), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_bad", scope: !14, file: !14, line: 41, type: !22, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 43, type: !6)
!25 = !DILocation(line: 43, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 44, type: !6)
!27 = !DILocation(line: 44, column: 15, scope: !21)
!28 = !DILocation(line: 44, column: 39, scope: !21)
!29 = !DILocation(line: 44, column: 28, scope: !21)
!30 = !DILocation(line: 45, column: 13, scope: !21)
!31 = !DILocation(line: 45, column: 5, scope: !21)
!32 = !DILocation(line: 46, column: 5, scope: !21)
!33 = !DILocation(line: 46, column: 23, scope: !21)
!34 = !DILocation(line: 48, column: 12, scope: !21)
!35 = !DILocation(line: 48, column: 23, scope: !21)
!36 = !DILocation(line: 48, column: 10, scope: !21)
!37 = !DILocation(line: 49, column: 63, scope: !21)
!38 = !DILocation(line: 49, column: 61, scope: !21)
!39 = !DILocation(line: 50, column: 5, scope: !21)
!40 = !DILocation(line: 51, column: 1, scope: !21)
!41 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_ncpy_45_good", scope: !14, file: !14, line: 85, type: !22, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DILocation(line: 87, column: 5, scope: !41)
!43 = !DILocation(line: 88, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 99, type: !45, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DISubroutineType(types: !46)
!46 = !{!9, !9, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !14, line: 99, type: !9)
!51 = !DILocation(line: 99, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !14, line: 99, type: !47)
!53 = !DILocation(line: 99, column: 27, scope: !44)
!54 = !DILocation(line: 102, column: 22, scope: !44)
!55 = !DILocation(line: 102, column: 12, scope: !44)
!56 = !DILocation(line: 102, column: 5, scope: !44)
!57 = !DILocation(line: 104, column: 5, scope: !44)
!58 = !DILocation(line: 105, column: 5, scope: !44)
!59 = !DILocation(line: 106, column: 5, scope: !44)
!60 = !DILocation(line: 109, column: 5, scope: !44)
!61 = !DILocation(line: 110, column: 5, scope: !44)
!62 = !DILocation(line: 111, column: 5, scope: !44)
!63 = !DILocation(line: 113, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocalVariable(name: "data", scope: !64, file: !14, line: 28, type: !6)
!66 = !DILocation(line: 28, column: 15, scope: !64)
!67 = !DILocation(line: 28, column: 22, scope: !64)
!68 = !DILocalVariable(name: "dest", scope: !69, file: !14, line: 30, type: !70)
!69 = distinct !DILexicalBlock(scope: !64, file: !14, line: 29, column: 5)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 100)
!73 = !DILocation(line: 30, column: 17, scope: !69)
!74 = !DILocation(line: 31, column: 17, scope: !69)
!75 = !DILocation(line: 31, column: 9, scope: !69)
!76 = !DILocation(line: 32, column: 9, scope: !69)
!77 = !DILocation(line: 32, column: 21, scope: !69)
!78 = !DILocation(line: 34, column: 17, scope: !69)
!79 = !DILocation(line: 34, column: 23, scope: !69)
!80 = !DILocation(line: 34, column: 36, scope: !69)
!81 = !DILocation(line: 34, column: 29, scope: !69)
!82 = !DILocation(line: 34, column: 9, scope: !69)
!83 = !DILocation(line: 36, column: 9, scope: !69)
!84 = !DILocation(line: 36, column: 21, scope: !69)
!85 = !DILocation(line: 37, column: 20, scope: !69)
!86 = !DILocation(line: 37, column: 9, scope: !69)
!87 = !DILocation(line: 39, column: 1, scope: !64)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 73, type: !22, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!89 = !DILocalVariable(name: "data", scope: !88, file: !14, line: 75, type: !6)
!90 = !DILocation(line: 75, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !14, line: 76, type: !6)
!92 = !DILocation(line: 76, column: 15, scope: !88)
!93 = !DILocation(line: 76, column: 39, scope: !88)
!94 = !DILocation(line: 76, column: 28, scope: !88)
!95 = !DILocation(line: 77, column: 13, scope: !88)
!96 = !DILocation(line: 77, column: 5, scope: !88)
!97 = !DILocation(line: 78, column: 5, scope: !88)
!98 = !DILocation(line: 78, column: 23, scope: !88)
!99 = !DILocation(line: 80, column: 12, scope: !88)
!100 = !DILocation(line: 80, column: 10, scope: !88)
!101 = !DILocation(line: 81, column: 67, scope: !88)
!102 = !DILocation(line: 81, column: 65, scope: !88)
!103 = !DILocation(line: 82, column: 5, scope: !88)
!104 = !DILocation(line: 83, column: 1, scope: !88)
!105 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 58, type: !22, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!106 = !DILocalVariable(name: "data", scope: !105, file: !14, line: 60, type: !6)
!107 = !DILocation(line: 60, column: 15, scope: !105)
!108 = !DILocation(line: 60, column: 22, scope: !105)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !14, line: 62, type: !70)
!110 = distinct !DILexicalBlock(scope: !105, file: !14, line: 61, column: 5)
!111 = !DILocation(line: 62, column: 17, scope: !110)
!112 = !DILocation(line: 63, column: 17, scope: !110)
!113 = !DILocation(line: 63, column: 9, scope: !110)
!114 = !DILocation(line: 64, column: 9, scope: !110)
!115 = !DILocation(line: 64, column: 21, scope: !110)
!116 = !DILocation(line: 66, column: 17, scope: !110)
!117 = !DILocation(line: 66, column: 23, scope: !110)
!118 = !DILocation(line: 66, column: 36, scope: !110)
!119 = !DILocation(line: 66, column: 29, scope: !110)
!120 = !DILocation(line: 66, column: 9, scope: !110)
!121 = !DILocation(line: 68, column: 9, scope: !110)
!122 = !DILocation(line: 68, column: 21, scope: !110)
!123 = !DILocation(line: 69, column: 20, scope: !110)
!124 = !DILocation(line: 69, column: 9, scope: !110)
!125 = !DILocation(line: 71, column: 1, scope: !105)
