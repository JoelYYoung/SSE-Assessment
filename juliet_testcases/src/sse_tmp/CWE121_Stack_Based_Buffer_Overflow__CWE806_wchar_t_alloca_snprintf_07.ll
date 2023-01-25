; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  store i32* %2, i32** %data, align 8, !dbg !29
  %3 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %3, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 99) #6, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %7 = load i32*, i32** %data, align 8, !dbg !47
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !48
  %8 = load i32*, i32** %data, align 8, !dbg !49
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !50
  %9 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %9), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_07_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
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
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_07_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_07_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 400, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBuffer, align 8, !dbg !82
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  store i32* %2, i32** %data, align 8, !dbg !86
  %3 = load i32, i32* @staticFive, align 4, !dbg !87
  %cmp = icmp ne i32 %3, 5, !dbg !89
  br i1 %cmp, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !101
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !102
  %7 = load i32*, i32** %data, align 8, !dbg !103
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !104
  %8 = load i32*, i32** %data, align 8, !dbg !105
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !106
  %9 = load i32*, i32** %data, align 8, !dbg !107
  call void @printWLine(i32* %9), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 400, align 16, !dbg !115
  %1 = bitcast i8* %0 to i32*, !dbg !116
  store i32* %1, i32** %dataBuffer, align 8, !dbg !114
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  store i32* %2, i32** %data, align 8, !dbg !118
  %3 = load i32, i32* @staticFive, align 4, !dbg !119
  %cmp = icmp eq i32 %3, 5, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %data, align 8, !dbg !123
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !125
  %5 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  br label %if.end, !dbg !128

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !131
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !132
  %7 = load i32*, i32** %data, align 8, !dbg !133
  %call1 = call i64 @wcslen(i32* %7) #7, !dbg !134
  %8 = load i32*, i32** %data, align 8, !dbg !135
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %8) #6, !dbg !136
  %9 = load i32*, i32** %data, align 8, !dbg !137
  call void @printWLine(i32* %9), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 31, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_07_bad", scope: !12, file: !12, line: 35, type: !20, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 37, type: !6)
!23 = !DILocation(line: 37, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 38, type: !6)
!25 = !DILocation(line: 38, column: 15, scope: !19)
!26 = !DILocation(line: 38, column: 39, scope: !19)
!27 = !DILocation(line: 38, column: 28, scope: !19)
!28 = !DILocation(line: 39, column: 12, scope: !19)
!29 = !DILocation(line: 39, column: 10, scope: !19)
!30 = !DILocation(line: 40, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !19, file: !12, line: 40, column: 8)
!32 = !DILocation(line: 40, column: 18, scope: !31)
!33 = !DILocation(line: 40, column: 8, scope: !19)
!34 = !DILocation(line: 43, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 41, column: 5)
!36 = !DILocation(line: 43, column: 9, scope: !35)
!37 = !DILocation(line: 44, column: 9, scope: !35)
!38 = !DILocation(line: 44, column: 21, scope: !35)
!39 = !DILocation(line: 45, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 47, type: !42)
!41 = distinct !DILexicalBlock(scope: !19, file: !12, line: 46, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 47, column: 17, scope: !41)
!46 = !DILocation(line: 49, column: 18, scope: !41)
!47 = !DILocation(line: 49, column: 31, scope: !41)
!48 = !DILocation(line: 49, column: 24, scope: !41)
!49 = !DILocation(line: 49, column: 45, scope: !41)
!50 = !DILocation(line: 49, column: 9, scope: !41)
!51 = !DILocation(line: 50, column: 20, scope: !41)
!52 = !DILocation(line: 50, column: 9, scope: !41)
!53 = !DILocation(line: 52, column: 1, scope: !19)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_07_good", scope: !12, file: !12, line: 103, type: !20, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 105, column: 5, scope: !54)
!56 = !DILocation(line: 106, column: 5, scope: !54)
!57 = !DILocation(line: 107, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !59, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!9, !9, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !12, line: 119, type: !9)
!65 = !DILocation(line: 119, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !12, line: 119, type: !61)
!67 = !DILocation(line: 119, column: 27, scope: !58)
!68 = !DILocation(line: 122, column: 22, scope: !58)
!69 = !DILocation(line: 122, column: 12, scope: !58)
!70 = !DILocation(line: 122, column: 5, scope: !58)
!71 = !DILocation(line: 124, column: 5, scope: !58)
!72 = !DILocation(line: 125, column: 5, scope: !58)
!73 = !DILocation(line: 126, column: 5, scope: !58)
!74 = !DILocation(line: 129, column: 5, scope: !58)
!75 = !DILocation(line: 130, column: 5, scope: !58)
!76 = !DILocation(line: 131, column: 5, scope: !58)
!77 = !DILocation(line: 133, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !12, line: 61, type: !6)
!80 = !DILocation(line: 61, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !12, line: 62, type: !6)
!82 = !DILocation(line: 62, column: 15, scope: !78)
!83 = !DILocation(line: 62, column: 39, scope: !78)
!84 = !DILocation(line: 62, column: 28, scope: !78)
!85 = !DILocation(line: 63, column: 12, scope: !78)
!86 = !DILocation(line: 63, column: 10, scope: !78)
!87 = !DILocation(line: 64, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !78, file: !12, line: 64, column: 8)
!89 = !DILocation(line: 64, column: 18, scope: !88)
!90 = !DILocation(line: 64, column: 8, scope: !78)
!91 = !DILocation(line: 67, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !12, line: 65, column: 5)
!93 = !DILocation(line: 68, column: 5, scope: !92)
!94 = !DILocation(line: 72, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !12, line: 70, column: 5)
!96 = !DILocation(line: 72, column: 9, scope: !95)
!97 = !DILocation(line: 73, column: 9, scope: !95)
!98 = !DILocation(line: 73, column: 20, scope: !95)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !12, line: 76, type: !42)
!100 = distinct !DILexicalBlock(scope: !78, file: !12, line: 75, column: 5)
!101 = !DILocation(line: 76, column: 17, scope: !100)
!102 = !DILocation(line: 78, column: 18, scope: !100)
!103 = !DILocation(line: 78, column: 31, scope: !100)
!104 = !DILocation(line: 78, column: 24, scope: !100)
!105 = !DILocation(line: 78, column: 45, scope: !100)
!106 = !DILocation(line: 78, column: 9, scope: !100)
!107 = !DILocation(line: 79, column: 20, scope: !100)
!108 = !DILocation(line: 79, column: 9, scope: !100)
!109 = !DILocation(line: 81, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 86, type: !6)
!112 = !DILocation(line: 86, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !12, line: 87, type: !6)
!114 = !DILocation(line: 87, column: 15, scope: !110)
!115 = !DILocation(line: 87, column: 39, scope: !110)
!116 = !DILocation(line: 87, column: 28, scope: !110)
!117 = !DILocation(line: 88, column: 12, scope: !110)
!118 = !DILocation(line: 88, column: 10, scope: !110)
!119 = !DILocation(line: 89, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !12, line: 89, column: 8)
!121 = !DILocation(line: 89, column: 18, scope: !120)
!122 = !DILocation(line: 89, column: 8, scope: !110)
!123 = !DILocation(line: 92, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !12, line: 90, column: 5)
!125 = !DILocation(line: 92, column: 9, scope: !124)
!126 = !DILocation(line: 93, column: 9, scope: !124)
!127 = !DILocation(line: 93, column: 20, scope: !124)
!128 = !DILocation(line: 94, column: 5, scope: !124)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !12, line: 96, type: !42)
!130 = distinct !DILexicalBlock(scope: !110, file: !12, line: 95, column: 5)
!131 = !DILocation(line: 96, column: 17, scope: !130)
!132 = !DILocation(line: 98, column: 18, scope: !130)
!133 = !DILocation(line: 98, column: 31, scope: !130)
!134 = !DILocation(line: 98, column: 24, scope: !130)
!135 = !DILocation(line: 98, column: 45, scope: !130)
!136 = !DILocation(line: 98, column: 9, scope: !130)
!137 = !DILocation(line: 99, column: 20, scope: !130)
!138 = !DILocation(line: 99, column: 9, scope: !130)
!139 = !DILocation(line: 101, column: 1, scope: !110)
