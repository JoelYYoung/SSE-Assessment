; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_goodG2BData = internal global i32* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !35
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !36
  store i32* %add.ptr, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %0, i32** @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #4, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #4, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i32*, i32** @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_badData, align 8, !dbg !68
  store i32* %0, i32** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !69, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !72
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !73
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !74
  store i32 0, i32* %arrayidx, align 4, !dbg !75
  %1 = load i32*, i32** %data, align 8, !dbg !76
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !77
  %call2 = call i32* @wcsncpy(i32* %1, i32* %arraydecay1, i64 99) #4, !dbg !78
  %2 = load i32*, i32** %data, align 8, !dbg !79
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !79
  store i32 0, i32* %arrayidx3, align 4, !dbg !80
  %3 = load i32*, i32** %data, align 8, !dbg !81
  call void @printWLine(i32* %3), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !89
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !90
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !93
  store i32* %arraydecay1, i32** %data, align 8, !dbg !94
  %0 = load i32*, i32** %data, align 8, !dbg !95
  store i32* %0, i32** @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_goodG2BData, align 8, !dbg !96
  call void @goodG2BSink(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load i32*, i32** @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_goodG2BData, align 8, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !107
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call2 = call i32* @wcsncpy(i32* %1, i32* %arraydecay1, i64 99) #4, !dbg !112
  %2 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !113
  store i32 0, i32* %arrayidx3, align 4, !dbg !114
  %3 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %3), !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !13, line: 74, baseType: !14)
!13 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_bad", scope: !10, file: !10, line: 41, type: !22, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 43, type: !11)
!25 = !DILocation(line: 43, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !10, line: 44, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 44, column: 13, scope: !21)
!31 = !DILocation(line: 45, column: 13, scope: !21)
!32 = !DILocation(line: 45, column: 5, scope: !21)
!33 = !DILocation(line: 46, column: 5, scope: !21)
!34 = !DILocation(line: 46, column: 23, scope: !21)
!35 = !DILocation(line: 48, column: 12, scope: !21)
!36 = !DILocation(line: 48, column: 23, scope: !21)
!37 = !DILocation(line: 48, column: 10, scope: !21)
!38 = !DILocation(line: 49, column: 65, scope: !21)
!39 = !DILocation(line: 49, column: 63, scope: !21)
!40 = !DILocation(line: 50, column: 5, scope: !21)
!41 = !DILocation(line: 51, column: 1, scope: !21)
!42 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_45_good", scope: !10, file: !10, line: 85, type: !22, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocation(line: 87, column: 5, scope: !42)
!44 = !DILocation(line: 88, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 99, type: !46, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DISubroutineType(types: !47)
!47 = !{!14, !14, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !10, line: 99, type: !14)
!52 = !DILocation(line: 99, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !10, line: 99, type: !48)
!54 = !DILocation(line: 99, column: 27, scope: !45)
!55 = !DILocation(line: 102, column: 22, scope: !45)
!56 = !DILocation(line: 102, column: 12, scope: !45)
!57 = !DILocation(line: 102, column: 5, scope: !45)
!58 = !DILocation(line: 104, column: 5, scope: !45)
!59 = !DILocation(line: 105, column: 5, scope: !45)
!60 = !DILocation(line: 106, column: 5, scope: !45)
!61 = !DILocation(line: 109, column: 5, scope: !45)
!62 = !DILocation(line: 110, column: 5, scope: !45)
!63 = !DILocation(line: 111, column: 5, scope: !45)
!64 = !DILocation(line: 113, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DILocalVariable(name: "data", scope: !65, file: !10, line: 28, type: !11)
!67 = !DILocation(line: 28, column: 15, scope: !65)
!68 = !DILocation(line: 28, column: 22, scope: !65)
!69 = !DILocalVariable(name: "source", scope: !70, file: !10, line: 30, type: !27)
!70 = distinct !DILexicalBlock(scope: !65, file: !10, line: 29, column: 5)
!71 = !DILocation(line: 30, column: 17, scope: !70)
!72 = !DILocation(line: 31, column: 17, scope: !70)
!73 = !DILocation(line: 31, column: 9, scope: !70)
!74 = !DILocation(line: 32, column: 9, scope: !70)
!75 = !DILocation(line: 32, column: 23, scope: !70)
!76 = !DILocation(line: 34, column: 17, scope: !70)
!77 = !DILocation(line: 34, column: 23, scope: !70)
!78 = !DILocation(line: 34, column: 9, scope: !70)
!79 = !DILocation(line: 36, column: 9, scope: !70)
!80 = !DILocation(line: 36, column: 21, scope: !70)
!81 = !DILocation(line: 37, column: 20, scope: !70)
!82 = !DILocation(line: 37, column: 9, scope: !70)
!83 = !DILocation(line: 39, column: 1, scope: !65)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 73, type: !22, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocalVariable(name: "data", scope: !84, file: !10, line: 75, type: !11)
!86 = !DILocation(line: 75, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !10, line: 76, type: !27)
!88 = !DILocation(line: 76, column: 13, scope: !84)
!89 = !DILocation(line: 77, column: 13, scope: !84)
!90 = !DILocation(line: 77, column: 5, scope: !84)
!91 = !DILocation(line: 78, column: 5, scope: !84)
!92 = !DILocation(line: 78, column: 23, scope: !84)
!93 = !DILocation(line: 80, column: 12, scope: !84)
!94 = !DILocation(line: 80, column: 10, scope: !84)
!95 = !DILocation(line: 81, column: 69, scope: !84)
!96 = !DILocation(line: 81, column: 67, scope: !84)
!97 = !DILocation(line: 82, column: 5, scope: !84)
!98 = !DILocation(line: 83, column: 1, scope: !84)
!99 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 58, type: !22, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 60, type: !11)
!101 = !DILocation(line: 60, column: 15, scope: !99)
!102 = !DILocation(line: 60, column: 22, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !10, line: 62, type: !27)
!104 = distinct !DILexicalBlock(scope: !99, file: !10, line: 61, column: 5)
!105 = !DILocation(line: 62, column: 17, scope: !104)
!106 = !DILocation(line: 63, column: 17, scope: !104)
!107 = !DILocation(line: 63, column: 9, scope: !104)
!108 = !DILocation(line: 64, column: 9, scope: !104)
!109 = !DILocation(line: 64, column: 23, scope: !104)
!110 = !DILocation(line: 66, column: 17, scope: !104)
!111 = !DILocation(line: 66, column: 23, scope: !104)
!112 = !DILocation(line: 66, column: 9, scope: !104)
!113 = !DILocation(line: 68, column: 9, scope: !104)
!114 = !DILocation(line: 68, column: 21, scope: !104)
!115 = !DILocation(line: 69, column: 20, scope: !104)
!116 = !DILocation(line: 69, column: 9, scope: !104)
!117 = !DILocation(line: 71, column: 1, scope: !99)
