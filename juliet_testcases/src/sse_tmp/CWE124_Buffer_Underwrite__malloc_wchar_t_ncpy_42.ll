; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_42.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %call3 = call i32* @wcsncpy(i32* %1, i32* %arraydecay2, i64 99) #5, !dbg !38
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx4 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !39
  store i32 0, i32* %arrayidx4, align 4, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  call void @printWLine(i32* %3), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !44 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !49, metadata !DIExpression()), !dbg !51
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !52
  %0 = bitcast i8* %call to i32*, !dbg !53
  store i32* %0, i32** %dataBuffer, align 8, !dbg !51
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !54
  %cmp = icmp eq i32* %1, null, !dbg !56
  br i1 %cmp, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !58
  unreachable, !dbg !58

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !60
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !61
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !62
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !62
  store i32 0, i32* %arrayidx, align 4, !dbg !63
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !64
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !65
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !66
  %5 = load i32*, i32** %data.addr, align 8, !dbg !67
  ret i32* %5, !dbg !68
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_42_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #5, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #5, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_42_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_42_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i32* null, i32** %data, align 8, !dbg !95
  %0 = load i32*, i32** %data, align 8, !dbg !96
  %call = call i32* @goodG2BSource(i32* %0), !dbg !97
  store i32* %call, i32** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !103
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %1 = load i32*, i32** %data, align 8, !dbg !106
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call3 = call i32* @wcsncpy(i32* %1, i32* %arraydecay2, i64 99) #5, !dbg !108
  %2 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx4 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !109
  store i32 0, i32* %arrayidx4, align 4, !dbg !110
  %3 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* %3), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !114 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !117, metadata !DIExpression()), !dbg !119
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !120
  %0 = bitcast i8* %call to i32*, !dbg !121
  store i32* %0, i32** %dataBuffer, align 8, !dbg !119
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !122
  %cmp = icmp eq i32* %1, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !129
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !132
  store i32* %4, i32** %data.addr, align 8, !dbg !133
  %5 = load i32*, i32** %data.addr, align 8, !dbg !134
  ret i32* %5, !dbg !135
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_42_bad", scope: !17, file: !17, line: 36, type: !18, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 38, type: !5)
!21 = !DILocation(line: 38, column: 15, scope: !16)
!22 = !DILocation(line: 39, column: 10, scope: !16)
!23 = !DILocation(line: 40, column: 22, scope: !16)
!24 = !DILocation(line: 40, column: 12, scope: !16)
!25 = !DILocation(line: 40, column: 10, scope: !16)
!26 = !DILocalVariable(name: "source", scope: !27, file: !17, line: 42, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 42, column: 17, scope: !27)
!32 = !DILocation(line: 43, column: 17, scope: !27)
!33 = !DILocation(line: 43, column: 9, scope: !27)
!34 = !DILocation(line: 44, column: 9, scope: !27)
!35 = !DILocation(line: 44, column: 23, scope: !27)
!36 = !DILocation(line: 46, column: 17, scope: !27)
!37 = !DILocation(line: 46, column: 23, scope: !27)
!38 = !DILocation(line: 46, column: 9, scope: !27)
!39 = !DILocation(line: 48, column: 9, scope: !27)
!40 = !DILocation(line: 48, column: 21, scope: !27)
!41 = !DILocation(line: 49, column: 20, scope: !27)
!42 = !DILocation(line: 49, column: 9, scope: !27)
!43 = !DILocation(line: 53, column: 1, scope: !16)
!44 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !45, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!5, !5}
!47 = !DILocalVariable(name: "data", arg: 1, scope: !44, file: !17, line: 23, type: !5)
!48 = !DILocation(line: 23, column: 38, scope: !44)
!49 = !DILocalVariable(name: "dataBuffer", scope: !50, file: !17, line: 26, type: !5)
!50 = distinct !DILexicalBlock(scope: !44, file: !17, line: 25, column: 5)
!51 = !DILocation(line: 26, column: 19, scope: !50)
!52 = !DILocation(line: 26, column: 43, scope: !50)
!53 = !DILocation(line: 26, column: 32, scope: !50)
!54 = !DILocation(line: 27, column: 13, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !17, line: 27, column: 13)
!56 = !DILocation(line: 27, column: 24, scope: !55)
!57 = !DILocation(line: 27, column: 13, scope: !50)
!58 = !DILocation(line: 27, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !17, line: 27, column: 33)
!60 = !DILocation(line: 28, column: 17, scope: !50)
!61 = !DILocation(line: 28, column: 9, scope: !50)
!62 = !DILocation(line: 29, column: 9, scope: !50)
!63 = !DILocation(line: 29, column: 27, scope: !50)
!64 = !DILocation(line: 31, column: 16, scope: !50)
!65 = !DILocation(line: 31, column: 27, scope: !50)
!66 = !DILocation(line: 31, column: 14, scope: !50)
!67 = !DILocation(line: 33, column: 12, scope: !44)
!68 = !DILocation(line: 33, column: 5, scope: !44)
!69 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_42_good", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 94, column: 5, scope: !69)
!71 = !DILocation(line: 95, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 107, type: !73, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!8, !8, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !17, line: 107, type: !8)
!79 = !DILocation(line: 107, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !17, line: 107, type: !75)
!81 = !DILocation(line: 107, column: 27, scope: !72)
!82 = !DILocation(line: 110, column: 22, scope: !72)
!83 = !DILocation(line: 110, column: 12, scope: !72)
!84 = !DILocation(line: 110, column: 5, scope: !72)
!85 = !DILocation(line: 112, column: 5, scope: !72)
!86 = !DILocation(line: 113, column: 5, scope: !72)
!87 = !DILocation(line: 114, column: 5, scope: !72)
!88 = !DILocation(line: 117, column: 5, scope: !72)
!89 = !DILocation(line: 118, column: 5, scope: !72)
!90 = !DILocation(line: 119, column: 5, scope: !72)
!91 = !DILocation(line: 121, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 73, type: !18, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !17, line: 75, type: !5)
!94 = !DILocation(line: 75, column: 15, scope: !92)
!95 = !DILocation(line: 76, column: 10, scope: !92)
!96 = !DILocation(line: 77, column: 26, scope: !92)
!97 = !DILocation(line: 77, column: 12, scope: !92)
!98 = !DILocation(line: 77, column: 10, scope: !92)
!99 = !DILocalVariable(name: "source", scope: !100, file: !17, line: 79, type: !28)
!100 = distinct !DILexicalBlock(scope: !92, file: !17, line: 78, column: 5)
!101 = !DILocation(line: 79, column: 17, scope: !100)
!102 = !DILocation(line: 80, column: 17, scope: !100)
!103 = !DILocation(line: 80, column: 9, scope: !100)
!104 = !DILocation(line: 81, column: 9, scope: !100)
!105 = !DILocation(line: 81, column: 23, scope: !100)
!106 = !DILocation(line: 83, column: 17, scope: !100)
!107 = !DILocation(line: 83, column: 23, scope: !100)
!108 = !DILocation(line: 83, column: 9, scope: !100)
!109 = !DILocation(line: 85, column: 9, scope: !100)
!110 = !DILocation(line: 85, column: 21, scope: !100)
!111 = !DILocation(line: 86, column: 20, scope: !100)
!112 = !DILocation(line: 86, column: 9, scope: !100)
!113 = !DILocation(line: 90, column: 1, scope: !92)
!114 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 59, type: !45, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", arg: 1, scope: !114, file: !17, line: 59, type: !5)
!116 = !DILocation(line: 59, column: 42, scope: !114)
!117 = !DILocalVariable(name: "dataBuffer", scope: !118, file: !17, line: 62, type: !5)
!118 = distinct !DILexicalBlock(scope: !114, file: !17, line: 61, column: 5)
!119 = !DILocation(line: 62, column: 19, scope: !118)
!120 = !DILocation(line: 62, column: 43, scope: !118)
!121 = !DILocation(line: 62, column: 32, scope: !118)
!122 = !DILocation(line: 63, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !17, line: 63, column: 13)
!124 = !DILocation(line: 63, column: 24, scope: !123)
!125 = !DILocation(line: 63, column: 13, scope: !118)
!126 = !DILocation(line: 63, column: 34, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !17, line: 63, column: 33)
!128 = !DILocation(line: 64, column: 17, scope: !118)
!129 = !DILocation(line: 64, column: 9, scope: !118)
!130 = !DILocation(line: 65, column: 9, scope: !118)
!131 = !DILocation(line: 65, column: 27, scope: !118)
!132 = !DILocation(line: 67, column: 16, scope: !118)
!133 = !DILocation(line: 67, column: 14, scope: !118)
!134 = !DILocation(line: 69, column: 12, scope: !114)
!135 = !DILocation(line: 69, column: 5, scope: !114)
