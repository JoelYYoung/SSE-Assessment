; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %dataBuffer, align 8, !dbg !25
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !41, metadata !DIExpression()), !dbg !43
  %5 = load i32*, i32** %data, align 8, !dbg !44
  store i32* %5, i32** %dataCopy, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !46
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !47
  store i32* %6, i32** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !55
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  %7 = load i32*, i32** %data2, align 8, !dbg !58
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !59
  %call6 = call i32* @wcsncpy(i32* %7, i32* %arraydecay5, i64 99) #5, !dbg !60
  %8 = load i32*, i32** %data2, align 8, !dbg !61
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !61
  store i32 0, i32* %arrayidx7, align 4, !dbg !62
  %9 = load i32*, i32** %data2, align 8, !dbg !63
  call void @printWLine(i32* %9), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_31_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #5, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #5, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_31_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_31_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32* null, i32** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !96
  %0 = bitcast i8* %call to i32*, !dbg !97
  store i32* %0, i32** %dataBuffer, align 8, !dbg !95
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  %cmp = icmp eq i32* %1, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !104
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !105
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !108
  store i32* %4, i32** %data, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !110, metadata !DIExpression()), !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  store i32* %5, i32** %dataCopy, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !114, metadata !DIExpression()), !dbg !115
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !116
  store i32* %6, i32** %data2, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !120
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !121
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx4, align 4, !dbg !123
  %7 = load i32*, i32** %data2, align 8, !dbg !124
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !125
  %call6 = call i32* @wcsncpy(i32* %7, i32* %arraydecay5, i64 99) #5, !dbg !126
  %8 = load i32*, i32** %data2, align 8, !dbg !127
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !127
  store i32 0, i32* %arrayidx7, align 4, !dbg !128
  %9 = load i32*, i32** %data2, align 8, !dbg !129
  call void @printWLine(i32* %9), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 28, type: !4)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 5)
!25 = !DILocation(line: 28, column: 19, scope: !24)
!26 = !DILocation(line: 28, column: 43, scope: !24)
!27 = !DILocation(line: 28, column: 32, scope: !24)
!28 = !DILocation(line: 29, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 29, column: 13)
!30 = !DILocation(line: 29, column: 24, scope: !29)
!31 = !DILocation(line: 29, column: 13, scope: !24)
!32 = !DILocation(line: 29, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 33)
!34 = !DILocation(line: 30, column: 17, scope: !24)
!35 = !DILocation(line: 30, column: 9, scope: !24)
!36 = !DILocation(line: 31, column: 9, scope: !24)
!37 = !DILocation(line: 31, column: 27, scope: !24)
!38 = !DILocation(line: 33, column: 16, scope: !24)
!39 = !DILocation(line: 33, column: 27, scope: !24)
!40 = !DILocation(line: 33, column: 14, scope: !24)
!41 = !DILocalVariable(name: "dataCopy", scope: !42, file: !17, line: 36, type: !4)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!43 = !DILocation(line: 36, column: 19, scope: !42)
!44 = !DILocation(line: 36, column: 30, scope: !42)
!45 = !DILocalVariable(name: "data", scope: !42, file: !17, line: 37, type: !4)
!46 = !DILocation(line: 37, column: 19, scope: !42)
!47 = !DILocation(line: 37, column: 26, scope: !42)
!48 = !DILocalVariable(name: "source", scope: !49, file: !17, line: 39, type: !50)
!49 = distinct !DILexicalBlock(scope: !42, file: !17, line: 38, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 39, column: 21, scope: !49)
!54 = !DILocation(line: 40, column: 21, scope: !49)
!55 = !DILocation(line: 40, column: 13, scope: !49)
!56 = !DILocation(line: 41, column: 13, scope: !49)
!57 = !DILocation(line: 41, column: 27, scope: !49)
!58 = !DILocation(line: 43, column: 21, scope: !49)
!59 = !DILocation(line: 43, column: 27, scope: !49)
!60 = !DILocation(line: 43, column: 13, scope: !49)
!61 = !DILocation(line: 45, column: 13, scope: !49)
!62 = !DILocation(line: 45, column: 25, scope: !49)
!63 = !DILocation(line: 46, column: 24, scope: !49)
!64 = !DILocation(line: 46, column: 13, scope: !49)
!65 = !DILocation(line: 51, column: 1, scope: !16)
!66 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_31_good", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 90, column: 5, scope: !66)
!68 = !DILocation(line: 91, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 102, type: !70, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!7, !7, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !17, line: 102, type: !7)
!76 = !DILocation(line: 102, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !17, line: 102, type: !72)
!78 = !DILocation(line: 102, column: 27, scope: !69)
!79 = !DILocation(line: 105, column: 22, scope: !69)
!80 = !DILocation(line: 105, column: 12, scope: !69)
!81 = !DILocation(line: 105, column: 5, scope: !69)
!82 = !DILocation(line: 107, column: 5, scope: !69)
!83 = !DILocation(line: 108, column: 5, scope: !69)
!84 = !DILocation(line: 109, column: 5, scope: !69)
!85 = !DILocation(line: 112, column: 5, scope: !69)
!86 = !DILocation(line: 113, column: 5, scope: !69)
!87 = !DILocation(line: 114, column: 5, scope: !69)
!88 = !DILocation(line: 116, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !17, line: 60, type: !4)
!91 = !DILocation(line: 60, column: 15, scope: !89)
!92 = !DILocation(line: 61, column: 10, scope: !89)
!93 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !17, line: 63, type: !4)
!94 = distinct !DILexicalBlock(scope: !89, file: !17, line: 62, column: 5)
!95 = !DILocation(line: 63, column: 19, scope: !94)
!96 = !DILocation(line: 63, column: 43, scope: !94)
!97 = !DILocation(line: 63, column: 32, scope: !94)
!98 = !DILocation(line: 64, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !17, line: 64, column: 13)
!100 = !DILocation(line: 64, column: 24, scope: !99)
!101 = !DILocation(line: 64, column: 13, scope: !94)
!102 = !DILocation(line: 64, column: 34, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !17, line: 64, column: 33)
!104 = !DILocation(line: 65, column: 17, scope: !94)
!105 = !DILocation(line: 65, column: 9, scope: !94)
!106 = !DILocation(line: 66, column: 9, scope: !94)
!107 = !DILocation(line: 66, column: 27, scope: !94)
!108 = !DILocation(line: 68, column: 16, scope: !94)
!109 = !DILocation(line: 68, column: 14, scope: !94)
!110 = !DILocalVariable(name: "dataCopy", scope: !111, file: !17, line: 71, type: !4)
!111 = distinct !DILexicalBlock(scope: !89, file: !17, line: 70, column: 5)
!112 = !DILocation(line: 71, column: 19, scope: !111)
!113 = !DILocation(line: 71, column: 30, scope: !111)
!114 = !DILocalVariable(name: "data", scope: !111, file: !17, line: 72, type: !4)
!115 = !DILocation(line: 72, column: 19, scope: !111)
!116 = !DILocation(line: 72, column: 26, scope: !111)
!117 = !DILocalVariable(name: "source", scope: !118, file: !17, line: 74, type: !50)
!118 = distinct !DILexicalBlock(scope: !111, file: !17, line: 73, column: 9)
!119 = !DILocation(line: 74, column: 21, scope: !118)
!120 = !DILocation(line: 75, column: 21, scope: !118)
!121 = !DILocation(line: 75, column: 13, scope: !118)
!122 = !DILocation(line: 76, column: 13, scope: !118)
!123 = !DILocation(line: 76, column: 27, scope: !118)
!124 = !DILocation(line: 78, column: 21, scope: !118)
!125 = !DILocation(line: 78, column: 27, scope: !118)
!126 = !DILocation(line: 78, column: 13, scope: !118)
!127 = !DILocation(line: 80, column: 13, scope: !118)
!128 = !DILocation(line: 80, column: 25, scope: !118)
!129 = !DILocation(line: 81, column: 24, scope: !118)
!130 = !DILocation(line: 81, column: 13, scope: !118)
!131 = !DILocation(line: 86, column: 1, scope: !89)
