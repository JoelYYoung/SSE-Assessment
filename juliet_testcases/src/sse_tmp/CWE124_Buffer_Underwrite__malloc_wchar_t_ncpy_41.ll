; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !28
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !29
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %0 = load i32*, i32** %data.addr, align 8, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !33
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #5, !dbg !34
  %1 = load i32*, i32** %data.addr, align 8, !dbg !35
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !35
  store i32 0, i32* %arrayidx3, align 4, !dbg !36
  %2 = load i32*, i32** %data.addr, align 8, !dbg !37
  call void @printWLine(i32* %2), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_bad() #0 !dbg !40 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !43, metadata !DIExpression()), !dbg !44
  store i32* null, i32** %data, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !46, metadata !DIExpression()), !dbg !48
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !49
  %0 = bitcast i8* %call to i32*, !dbg !50
  store i32* %0, i32** %dataBuffer, align 8, !dbg !48
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !51
  %cmp = icmp eq i32* %1, null, !dbg !53
  br i1 %cmp, label %if.then, label %if.end, !dbg !54

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !55
  unreachable, !dbg !55

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !57
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !58
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !59
  store i32 0, i32* %arrayidx, align 4, !dbg !60
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !61
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !62
  store i32* %add.ptr, i32** %data, align 8, !dbg !63
  %5 = load i32*, i32** %data, align 8, !dbg !64
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_badSink(i32* %5), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_goodG2BSink(i32* %data) #0 !dbg !67 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !70, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !73
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !74
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !75
  store i32 0, i32* %arrayidx, align 4, !dbg !76
  %0 = load i32*, i32** %data.addr, align 8, !dbg !77
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !78
  %call2 = call i32* @wcsncpy(i32* %0, i32* %arraydecay1, i64 99) #5, !dbg !79
  %1 = load i32*, i32** %data.addr, align 8, !dbg !80
  %arrayidx3 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !80
  store i32 0, i32* %arrayidx3, align 4, !dbg !81
  %2 = load i32*, i32** %data.addr, align 8, !dbg !82
  call void @printWLine(i32* %2), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #5, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #5, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32* null, i32** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !114
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !115
  %0 = bitcast i8* %call to i32*, !dbg !116
  store i32* %0, i32** %dataBuffer, align 8, !dbg !114
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !117
  %cmp = icmp eq i32* %1, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !123
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !124
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !127
  store i32* %4, i32** %data, align 8, !dbg !128
  %5 = load i32*, i32** %data, align 8, !dbg !129
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_goodG2BSink(i32* %5), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 73, scope: !16)
!22 = !DILocalVariable(name: "source", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 26, column: 17, scope: !23)
!28 = !DILocation(line: 27, column: 17, scope: !23)
!29 = !DILocation(line: 27, column: 9, scope: !23)
!30 = !DILocation(line: 28, column: 9, scope: !23)
!31 = !DILocation(line: 28, column: 23, scope: !23)
!32 = !DILocation(line: 30, column: 17, scope: !23)
!33 = !DILocation(line: 30, column: 23, scope: !23)
!34 = !DILocation(line: 30, column: 9, scope: !23)
!35 = !DILocation(line: 32, column: 9, scope: !23)
!36 = !DILocation(line: 32, column: 21, scope: !23)
!37 = !DILocation(line: 33, column: 20, scope: !23)
!38 = !DILocation(line: 33, column: 9, scope: !23)
!39 = !DILocation(line: 37, column: 1, scope: !16)
!40 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_bad", scope: !17, file: !17, line: 39, type: !41, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !DILocalVariable(name: "data", scope: !40, file: !17, line: 41, type: !4)
!44 = !DILocation(line: 41, column: 15, scope: !40)
!45 = !DILocation(line: 42, column: 10, scope: !40)
!46 = !DILocalVariable(name: "dataBuffer", scope: !47, file: !17, line: 44, type: !4)
!47 = distinct !DILexicalBlock(scope: !40, file: !17, line: 43, column: 5)
!48 = !DILocation(line: 44, column: 19, scope: !47)
!49 = !DILocation(line: 44, column: 43, scope: !47)
!50 = !DILocation(line: 44, column: 32, scope: !47)
!51 = !DILocation(line: 45, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !17, line: 45, column: 13)
!53 = !DILocation(line: 45, column: 24, scope: !52)
!54 = !DILocation(line: 45, column: 13, scope: !47)
!55 = !DILocation(line: 45, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !17, line: 45, column: 33)
!57 = !DILocation(line: 46, column: 17, scope: !47)
!58 = !DILocation(line: 46, column: 9, scope: !47)
!59 = !DILocation(line: 47, column: 9, scope: !47)
!60 = !DILocation(line: 47, column: 27, scope: !47)
!61 = !DILocation(line: 49, column: 16, scope: !47)
!62 = !DILocation(line: 49, column: 27, scope: !47)
!63 = !DILocation(line: 49, column: 14, scope: !47)
!64 = !DILocation(line: 51, column: 62, scope: !40)
!65 = !DILocation(line: 51, column: 5, scope: !40)
!66 = !DILocation(line: 52, column: 1, scope: !40)
!67 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_goodG2BSink", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "data", arg: 1, scope: !67, file: !17, line: 58, type: !4)
!69 = !DILocation(line: 58, column: 77, scope: !67)
!70 = !DILocalVariable(name: "source", scope: !71, file: !17, line: 61, type: !24)
!71 = distinct !DILexicalBlock(scope: !67, file: !17, line: 60, column: 5)
!72 = !DILocation(line: 61, column: 17, scope: !71)
!73 = !DILocation(line: 62, column: 17, scope: !71)
!74 = !DILocation(line: 62, column: 9, scope: !71)
!75 = !DILocation(line: 63, column: 9, scope: !71)
!76 = !DILocation(line: 63, column: 23, scope: !71)
!77 = !DILocation(line: 65, column: 17, scope: !71)
!78 = !DILocation(line: 65, column: 23, scope: !71)
!79 = !DILocation(line: 65, column: 9, scope: !71)
!80 = !DILocation(line: 67, column: 9, scope: !71)
!81 = !DILocation(line: 67, column: 21, scope: !71)
!82 = !DILocation(line: 68, column: 20, scope: !71)
!83 = !DILocation(line: 68, column: 9, scope: !71)
!84 = !DILocation(line: 72, column: 1, scope: !67)
!85 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_41_good", scope: !17, file: !17, line: 90, type: !41, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 92, column: 5, scope: !85)
!87 = !DILocation(line: 93, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 105, type: !89, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!7, !7, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !17, line: 105, type: !7)
!95 = !DILocation(line: 105, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !17, line: 105, type: !91)
!97 = !DILocation(line: 105, column: 27, scope: !88)
!98 = !DILocation(line: 108, column: 22, scope: !88)
!99 = !DILocation(line: 108, column: 12, scope: !88)
!100 = !DILocation(line: 108, column: 5, scope: !88)
!101 = !DILocation(line: 110, column: 5, scope: !88)
!102 = !DILocation(line: 111, column: 5, scope: !88)
!103 = !DILocation(line: 112, column: 5, scope: !88)
!104 = !DILocation(line: 115, column: 5, scope: !88)
!105 = !DILocation(line: 116, column: 5, scope: !88)
!106 = !DILocation(line: 117, column: 5, scope: !88)
!107 = !DILocation(line: 119, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 75, type: !41, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 77, type: !4)
!110 = !DILocation(line: 77, column: 15, scope: !108)
!111 = !DILocation(line: 78, column: 10, scope: !108)
!112 = !DILocalVariable(name: "dataBuffer", scope: !113, file: !17, line: 80, type: !4)
!113 = distinct !DILexicalBlock(scope: !108, file: !17, line: 79, column: 5)
!114 = !DILocation(line: 80, column: 19, scope: !113)
!115 = !DILocation(line: 80, column: 43, scope: !113)
!116 = !DILocation(line: 80, column: 32, scope: !113)
!117 = !DILocation(line: 81, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !113, file: !17, line: 81, column: 13)
!119 = !DILocation(line: 81, column: 24, scope: !118)
!120 = !DILocation(line: 81, column: 13, scope: !113)
!121 = !DILocation(line: 81, column: 34, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !17, line: 81, column: 33)
!123 = !DILocation(line: 82, column: 17, scope: !113)
!124 = !DILocation(line: 82, column: 9, scope: !113)
!125 = !DILocation(line: 83, column: 9, scope: !113)
!126 = !DILocation(line: 83, column: 27, scope: !113)
!127 = !DILocation(line: 85, column: 16, scope: !113)
!128 = !DILocation(line: 85, column: 14, scope: !113)
!129 = !DILocation(line: 87, column: 66, scope: !108)
!130 = !DILocation(line: 87, column: 5, scope: !108)
!131 = !DILocation(line: 88, column: 1, scope: !108)
