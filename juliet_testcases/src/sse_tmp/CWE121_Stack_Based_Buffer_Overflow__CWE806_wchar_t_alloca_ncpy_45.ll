; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_goodG2BData = internal global i32* null, align 8, !dbg !12

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  %3 = load i32*, i32** %data, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !33
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_badData, align 8, !dbg !37
  call void @badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #6, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #6, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_badData, align 8, !dbg !66
  store i32* %0, i32** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !67, metadata !DIExpression()), !dbg !72
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !72
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !73
  %2 = load i32*, i32** %data, align 8, !dbg !74
  %3 = load i32*, i32** %data, align 8, !dbg !75
  %call = call i64 @wcslen(i32* %3) #7, !dbg !76
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %2, i64 %call) #6, !dbg !77
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %4 = load i32*, i32** %data, align 8, !dbg !80
  call void @printWLine(i32* %4), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 400, align 16, !dbg !88
  %1 = bitcast i8* %0 to i32*, !dbg !89
  store i32* %1, i32** %dataBuffer, align 8, !dbg !87
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  store i32* %2, i32** %data, align 8, !dbg !91
  %3 = load i32*, i32** %data, align 8, !dbg !92
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #6, !dbg !93
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  %5 = load i32*, i32** %data, align 8, !dbg !96
  store i32* %5, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_goodG2BData, align 8, !dbg !97
  call void @goodG2BSink(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_goodG2BData, align 8, !dbg !103
  store i32* %0, i32** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !106
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !107
  %2 = load i32*, i32** %data, align 8, !dbg !108
  %3 = load i32*, i32** %data, align 8, !dbg !109
  %call = call i64 @wcslen(i32* %3) #7, !dbg !110
  %call1 = call i32* @wcsncpy(i32* %arraydecay, i32* %2, i64 %call) #6, !dbg !111
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %4 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* %4), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_badData", scope: !2, file: !14, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_goodG2BData", scope: !2, file: !14, line: 22, type: !6, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45.c", directory: "/root/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_bad", scope: !14, file: !14, line: 38, type: !22, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 40, type: !6)
!25 = !DILocation(line: 40, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 41, type: !6)
!27 = !DILocation(line: 41, column: 15, scope: !21)
!28 = !DILocation(line: 41, column: 39, scope: !21)
!29 = !DILocation(line: 41, column: 28, scope: !21)
!30 = !DILocation(line: 42, column: 12, scope: !21)
!31 = !DILocation(line: 42, column: 10, scope: !21)
!32 = !DILocation(line: 44, column: 13, scope: !21)
!33 = !DILocation(line: 44, column: 5, scope: !21)
!34 = !DILocation(line: 45, column: 5, scope: !21)
!35 = !DILocation(line: 45, column: 17, scope: !21)
!36 = !DILocation(line: 46, column: 81, scope: !21)
!37 = !DILocation(line: 46, column: 79, scope: !21)
!38 = !DILocation(line: 47, column: 5, scope: !21)
!39 = !DILocation(line: 48, column: 1, scope: !21)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_ncpy_45_good", scope: !14, file: !14, line: 79, type: !22, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocation(line: 81, column: 5, scope: !40)
!42 = !DILocation(line: 82, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 93, type: !44, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!44 = !DISubroutineType(types: !45)
!45 = !{!9, !9, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !14, line: 93, type: !9)
!50 = !DILocation(line: 93, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !14, line: 93, type: !46)
!52 = !DILocation(line: 93, column: 27, scope: !43)
!53 = !DILocation(line: 96, column: 22, scope: !43)
!54 = !DILocation(line: 96, column: 12, scope: !43)
!55 = !DILocation(line: 96, column: 5, scope: !43)
!56 = !DILocation(line: 98, column: 5, scope: !43)
!57 = !DILocation(line: 99, column: 5, scope: !43)
!58 = !DILocation(line: 100, column: 5, scope: !43)
!59 = !DILocation(line: 103, column: 5, scope: !43)
!60 = !DILocation(line: 104, column: 5, scope: !43)
!61 = !DILocation(line: 105, column: 5, scope: !43)
!62 = !DILocation(line: 107, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 26, type: !22, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocalVariable(name: "data", scope: !63, file: !14, line: 28, type: !6)
!65 = !DILocation(line: 28, column: 15, scope: !63)
!66 = !DILocation(line: 28, column: 22, scope: !63)
!67 = !DILocalVariable(name: "dest", scope: !68, file: !14, line: 30, type: !69)
!68 = distinct !DILexicalBlock(scope: !63, file: !14, line: 29, column: 5)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 50)
!72 = !DILocation(line: 30, column: 17, scope: !68)
!73 = !DILocation(line: 32, column: 17, scope: !68)
!74 = !DILocation(line: 32, column: 23, scope: !68)
!75 = !DILocation(line: 32, column: 36, scope: !68)
!76 = !DILocation(line: 32, column: 29, scope: !68)
!77 = !DILocation(line: 32, column: 9, scope: !68)
!78 = !DILocation(line: 33, column: 9, scope: !68)
!79 = !DILocation(line: 33, column: 20, scope: !68)
!80 = !DILocation(line: 34, column: 20, scope: !68)
!81 = !DILocation(line: 34, column: 9, scope: !68)
!82 = !DILocation(line: 36, column: 1, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 67, type: !22, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !14, line: 69, type: !6)
!85 = !DILocation(line: 69, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !14, line: 70, type: !6)
!87 = !DILocation(line: 70, column: 15, scope: !83)
!88 = !DILocation(line: 70, column: 39, scope: !83)
!89 = !DILocation(line: 70, column: 28, scope: !83)
!90 = !DILocation(line: 71, column: 12, scope: !83)
!91 = !DILocation(line: 71, column: 10, scope: !83)
!92 = !DILocation(line: 73, column: 13, scope: !83)
!93 = !DILocation(line: 73, column: 5, scope: !83)
!94 = !DILocation(line: 74, column: 5, scope: !83)
!95 = !DILocation(line: 74, column: 16, scope: !83)
!96 = !DILocation(line: 75, column: 85, scope: !83)
!97 = !DILocation(line: 75, column: 83, scope: !83)
!98 = !DILocation(line: 76, column: 5, scope: !83)
!99 = !DILocation(line: 77, column: 1, scope: !83)
!100 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 55, type: !22, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!101 = !DILocalVariable(name: "data", scope: !100, file: !14, line: 57, type: !6)
!102 = !DILocation(line: 57, column: 15, scope: !100)
!103 = !DILocation(line: 57, column: 22, scope: !100)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !14, line: 59, type: !69)
!105 = distinct !DILexicalBlock(scope: !100, file: !14, line: 58, column: 5)
!106 = !DILocation(line: 59, column: 17, scope: !105)
!107 = !DILocation(line: 61, column: 17, scope: !105)
!108 = !DILocation(line: 61, column: 23, scope: !105)
!109 = !DILocation(line: 61, column: 36, scope: !105)
!110 = !DILocation(line: 61, column: 29, scope: !105)
!111 = !DILocation(line: 61, column: 9, scope: !105)
!112 = !DILocation(line: 62, column: 9, scope: !105)
!113 = !DILocation(line: 62, column: 20, scope: !105)
!114 = !DILocation(line: 63, column: 20, scope: !105)
!115 = !DILocation(line: 63, column: 9, scope: !105)
!116 = !DILocation(line: 65, column: 1, scope: !100)
