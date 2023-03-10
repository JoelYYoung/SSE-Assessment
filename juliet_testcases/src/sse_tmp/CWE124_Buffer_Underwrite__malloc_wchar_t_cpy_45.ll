; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_goodG2BData = internal global i32* null, align 8, !dbg !13

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !31
  %0 = bitcast i8* %call to i32*, !dbg !32
  store i32* %0, i32** %dataBuffer, align 8, !dbg !30
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !40
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !44
  store i32* %add.ptr, i32** %data, align 8, !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  store i32* %5, i32** @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_badData, align 8, !dbg !47
  call void @badSink(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = load i32*, i32** @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_badData, align 8, !dbg !76
  store i32* %0, i32** %data, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !77, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !83
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !84
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %1 = load i32*, i32** %data, align 8, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !88
  %call2 = call i32* @wcscpy(i32* %1, i32* %arraydecay1) #5, !dbg !89
  %2 = load i32*, i32** %data, align 8, !dbg !90
  call void @printWLine(i32* %2), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i32* null, i32** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !100
  %0 = bitcast i8* %call to i32*, !dbg !101
  store i32* %0, i32** %dataBuffer, align 8, !dbg !99
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %cmp = icmp eq i32* %1, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !109
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  store i32* %4, i32** %data, align 8, !dbg !113
  %5 = load i32*, i32** %data, align 8, !dbg !114
  store i32* %5, i32** @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_goodG2BData, align 8, !dbg !115
  call void @goodG2BSink(), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = load i32*, i32** @CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_goodG2BData, align 8, !dbg !121
  store i32* %0, i32** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !125
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !126
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %1 = load i32*, i32** %data, align 8, !dbg !129
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !130
  %call2 = call i32* @wcscpy(i32* %1, i32* %arraydecay1) #5, !dbg !131
  %2 = load i32*, i32** %data, align 8, !dbg !132
  call void @printWLine(i32* %2), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_badData", scope: !2, file: !15, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_goodG2BData", scope: !2, file: !15, line: 22, type: !6, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_bad", scope: !15, file: !15, line: 41, type: !23, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 43, type: !6)
!26 = !DILocation(line: 43, column: 15, scope: !22)
!27 = !DILocation(line: 44, column: 10, scope: !22)
!28 = !DILocalVariable(name: "dataBuffer", scope: !29, file: !15, line: 46, type: !6)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 45, column: 5)
!30 = !DILocation(line: 46, column: 19, scope: !29)
!31 = !DILocation(line: 46, column: 43, scope: !29)
!32 = !DILocation(line: 46, column: 32, scope: !29)
!33 = !DILocation(line: 47, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !15, line: 47, column: 13)
!35 = !DILocation(line: 47, column: 24, scope: !34)
!36 = !DILocation(line: 47, column: 13, scope: !29)
!37 = !DILocation(line: 47, column: 34, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 47, column: 33)
!39 = !DILocation(line: 48, column: 17, scope: !29)
!40 = !DILocation(line: 48, column: 9, scope: !29)
!41 = !DILocation(line: 49, column: 9, scope: !29)
!42 = !DILocation(line: 49, column: 27, scope: !29)
!43 = !DILocation(line: 51, column: 16, scope: !29)
!44 = !DILocation(line: 51, column: 27, scope: !29)
!45 = !DILocation(line: 51, column: 14, scope: !29)
!46 = !DILocation(line: 53, column: 63, scope: !22)
!47 = !DILocation(line: 53, column: 61, scope: !22)
!48 = !DILocation(line: 54, column: 5, scope: !22)
!49 = !DILocation(line: 55, column: 1, scope: !22)
!50 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_cpy_45_good", scope: !15, file: !15, line: 93, type: !23, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DILocation(line: 95, column: 5, scope: !50)
!52 = !DILocation(line: 96, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 107, type: !54, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DISubroutineType(types: !55)
!55 = !{!9, !9, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !15, line: 107, type: !9)
!60 = !DILocation(line: 107, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !15, line: 107, type: !56)
!62 = !DILocation(line: 107, column: 27, scope: !53)
!63 = !DILocation(line: 110, column: 22, scope: !53)
!64 = !DILocation(line: 110, column: 12, scope: !53)
!65 = !DILocation(line: 110, column: 5, scope: !53)
!66 = !DILocation(line: 112, column: 5, scope: !53)
!67 = !DILocation(line: 113, column: 5, scope: !53)
!68 = !DILocation(line: 114, column: 5, scope: !53)
!69 = !DILocation(line: 117, column: 5, scope: !53)
!70 = !DILocation(line: 118, column: 5, scope: !53)
!71 = !DILocation(line: 119, column: 5, scope: !53)
!72 = !DILocation(line: 121, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 26, type: !23, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 28, type: !6)
!75 = !DILocation(line: 28, column: 15, scope: !73)
!76 = !DILocation(line: 28, column: 22, scope: !73)
!77 = !DILocalVariable(name: "source", scope: !78, file: !15, line: 30, type: !79)
!78 = distinct !DILexicalBlock(scope: !73, file: !15, line: 29, column: 5)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !80)
!80 = !{!81}
!81 = !DISubrange(count: 100)
!82 = !DILocation(line: 30, column: 17, scope: !78)
!83 = !DILocation(line: 31, column: 17, scope: !78)
!84 = !DILocation(line: 31, column: 9, scope: !78)
!85 = !DILocation(line: 32, column: 9, scope: !78)
!86 = !DILocation(line: 32, column: 23, scope: !78)
!87 = !DILocation(line: 34, column: 16, scope: !78)
!88 = !DILocation(line: 34, column: 22, scope: !78)
!89 = !DILocation(line: 34, column: 9, scope: !78)
!90 = !DILocation(line: 35, column: 20, scope: !78)
!91 = !DILocation(line: 35, column: 9, scope: !78)
!92 = !DILocation(line: 39, column: 1, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 77, type: !23, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 79, type: !6)
!95 = !DILocation(line: 79, column: 15, scope: !93)
!96 = !DILocation(line: 80, column: 10, scope: !93)
!97 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !15, line: 82, type: !6)
!98 = distinct !DILexicalBlock(scope: !93, file: !15, line: 81, column: 5)
!99 = !DILocation(line: 82, column: 19, scope: !98)
!100 = !DILocation(line: 82, column: 43, scope: !98)
!101 = !DILocation(line: 82, column: 32, scope: !98)
!102 = !DILocation(line: 83, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !15, line: 83, column: 13)
!104 = !DILocation(line: 83, column: 24, scope: !103)
!105 = !DILocation(line: 83, column: 13, scope: !98)
!106 = !DILocation(line: 83, column: 34, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 83, column: 33)
!108 = !DILocation(line: 84, column: 17, scope: !98)
!109 = !DILocation(line: 84, column: 9, scope: !98)
!110 = !DILocation(line: 85, column: 9, scope: !98)
!111 = !DILocation(line: 85, column: 27, scope: !98)
!112 = !DILocation(line: 87, column: 16, scope: !98)
!113 = !DILocation(line: 87, column: 14, scope: !98)
!114 = !DILocation(line: 89, column: 67, scope: !93)
!115 = !DILocation(line: 89, column: 65, scope: !93)
!116 = !DILocation(line: 90, column: 5, scope: !93)
!117 = !DILocation(line: 91, column: 1, scope: !93)
!118 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 62, type: !23, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !15, line: 64, type: !6)
!120 = !DILocation(line: 64, column: 15, scope: !118)
!121 = !DILocation(line: 64, column: 22, scope: !118)
!122 = !DILocalVariable(name: "source", scope: !123, file: !15, line: 66, type: !79)
!123 = distinct !DILexicalBlock(scope: !118, file: !15, line: 65, column: 5)
!124 = !DILocation(line: 66, column: 17, scope: !123)
!125 = !DILocation(line: 67, column: 17, scope: !123)
!126 = !DILocation(line: 67, column: 9, scope: !123)
!127 = !DILocation(line: 68, column: 9, scope: !123)
!128 = !DILocation(line: 68, column: 23, scope: !123)
!129 = !DILocation(line: 70, column: 16, scope: !123)
!130 = !DILocation(line: 70, column: 22, scope: !123)
!131 = !DILocation(line: 70, column: 9, scope: !123)
!132 = !DILocation(line: 71, column: 20, scope: !123)
!133 = !DILocation(line: 71, column: 9, scope: !123)
!134 = !DILocation(line: 75, column: 1, scope: !118)
