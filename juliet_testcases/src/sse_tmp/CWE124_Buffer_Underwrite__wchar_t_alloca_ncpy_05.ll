; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  %4 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %4, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx2, align 4, !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !54
  %7 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !55
  store i32 0, i32* %arrayidx5, align 4, !dbg !56
  %8 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* %8), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_05_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* null) #4, !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 %conv) #4, !dbg !76
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_05_good(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_05_bad(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 400, align 16, !dbg !89
  %1 = bitcast i8* %0 to i32*, !dbg !90
  store i32* %1, i32** %dataBuffer, align 8, !dbg !88
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !91
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !92
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !93
  store i32 0, i32* %arrayidx, align 4, !dbg !94
  %4 = load i32, i32* @staticFalse, align 4, !dbg !95
  %tobool = icmp ne i32 %4, 0, !dbg !95
  br i1 %tobool, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !98
  br label %if.end, !dbg !100

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  store i32* %5, i32** %data, align 8, !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !108
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx2, align 4, !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !111
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !114
  store i32 0, i32* %arrayidx5, align 4, !dbg !115
  %8 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* %8), !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = alloca i8, i64 400, align 16, !dbg !124
  %1 = bitcast i8* %0 to i32*, !dbg !125
  store i32* %1, i32** %dataBuffer, align 8, !dbg !123
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !127
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  %4 = load i32, i32* @staticTrue, align 4, !dbg !130
  %tobool = icmp ne i32 %4, 0, !dbg !130
  br i1 %tobool, label %if.then, label %if.end, !dbg !132

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !133
  store i32* %5, i32** %data, align 8, !dbg !135
  br label %if.end, !dbg !136

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !140
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !141
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !142
  store i32 0, i32* %arrayidx2, align 4, !dbg !143
  %6 = load i32*, i32** %data, align 8, !dbg !144
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !145
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !146
  %7 = load i32*, i32** %data, align 8, !dbg !147
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !147
  store i32 0, i32* %arrayidx5, align 4, !dbg !148
  %8 = load i32*, i32** %data, align 8, !dbg !149
  call void @printWLine(i32* %8), !dbg !150
  ret void, !dbg !151
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
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !14, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !14, line: 26, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_05_bad", scope: !14, file: !14, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !14, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBuffer", scope: !21, file: !14, line: 33, type: !6)
!27 = !DILocation(line: 33, column: 15, scope: !21)
!28 = !DILocation(line: 33, column: 39, scope: !21)
!29 = !DILocation(line: 33, column: 28, scope: !21)
!30 = !DILocation(line: 34, column: 13, scope: !21)
!31 = !DILocation(line: 34, column: 5, scope: !21)
!32 = !DILocation(line: 35, column: 5, scope: !21)
!33 = !DILocation(line: 35, column: 23, scope: !21)
!34 = !DILocation(line: 36, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !14, line: 36, column: 8)
!36 = !DILocation(line: 36, column: 8, scope: !21)
!37 = !DILocation(line: 39, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !14, line: 37, column: 5)
!39 = !DILocation(line: 39, column: 27, scope: !38)
!40 = !DILocation(line: 39, column: 14, scope: !38)
!41 = !DILocation(line: 40, column: 5, scope: !38)
!42 = !DILocalVariable(name: "source", scope: !43, file: !14, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !21, file: !14, line: 41, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 42, column: 17, scope: !43)
!48 = !DILocation(line: 43, column: 17, scope: !43)
!49 = !DILocation(line: 43, column: 9, scope: !43)
!50 = !DILocation(line: 44, column: 9, scope: !43)
!51 = !DILocation(line: 44, column: 23, scope: !43)
!52 = !DILocation(line: 46, column: 17, scope: !43)
!53 = !DILocation(line: 46, column: 23, scope: !43)
!54 = !DILocation(line: 46, column: 9, scope: !43)
!55 = !DILocation(line: 48, column: 9, scope: !43)
!56 = !DILocation(line: 48, column: 21, scope: !43)
!57 = !DILocation(line: 49, column: 20, scope: !43)
!58 = !DILocation(line: 49, column: 9, scope: !43)
!59 = !DILocation(line: 51, column: 1, scope: !21)
!60 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_05_good", scope: !14, file: !14, line: 110, type: !22, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocation(line: 112, column: 5, scope: !60)
!62 = !DILocation(line: 113, column: 5, scope: !60)
!63 = !DILocation(line: 114, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 126, type: !65, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DISubroutineType(types: !66)
!66 = !{!9, !9, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !14, line: 126, type: !9)
!71 = !DILocation(line: 126, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !14, line: 126, type: !67)
!73 = !DILocation(line: 126, column: 27, scope: !64)
!74 = !DILocation(line: 129, column: 22, scope: !64)
!75 = !DILocation(line: 129, column: 12, scope: !64)
!76 = !DILocation(line: 129, column: 5, scope: !64)
!77 = !DILocation(line: 131, column: 5, scope: !64)
!78 = !DILocation(line: 132, column: 5, scope: !64)
!79 = !DILocation(line: 133, column: 5, scope: !64)
!80 = !DILocation(line: 136, column: 5, scope: !64)
!81 = !DILocation(line: 137, column: 5, scope: !64)
!82 = !DILocation(line: 138, column: 5, scope: !64)
!83 = !DILocation(line: 140, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 58, type: !22, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocalVariable(name: "data", scope: !84, file: !14, line: 60, type: !6)
!86 = !DILocation(line: 60, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !14, line: 61, type: !6)
!88 = !DILocation(line: 61, column: 15, scope: !84)
!89 = !DILocation(line: 61, column: 39, scope: !84)
!90 = !DILocation(line: 61, column: 28, scope: !84)
!91 = !DILocation(line: 62, column: 13, scope: !84)
!92 = !DILocation(line: 62, column: 5, scope: !84)
!93 = !DILocation(line: 63, column: 5, scope: !84)
!94 = !DILocation(line: 63, column: 23, scope: !84)
!95 = !DILocation(line: 64, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !84, file: !14, line: 64, column: 8)
!97 = !DILocation(line: 64, column: 8, scope: !84)
!98 = !DILocation(line: 67, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !14, line: 65, column: 5)
!100 = !DILocation(line: 68, column: 5, scope: !99)
!101 = !DILocation(line: 72, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !14, line: 70, column: 5)
!103 = !DILocation(line: 72, column: 14, scope: !102)
!104 = !DILocalVariable(name: "source", scope: !105, file: !14, line: 75, type: !44)
!105 = distinct !DILexicalBlock(scope: !84, file: !14, line: 74, column: 5)
!106 = !DILocation(line: 75, column: 17, scope: !105)
!107 = !DILocation(line: 76, column: 17, scope: !105)
!108 = !DILocation(line: 76, column: 9, scope: !105)
!109 = !DILocation(line: 77, column: 9, scope: !105)
!110 = !DILocation(line: 77, column: 23, scope: !105)
!111 = !DILocation(line: 79, column: 17, scope: !105)
!112 = !DILocation(line: 79, column: 23, scope: !105)
!113 = !DILocation(line: 79, column: 9, scope: !105)
!114 = !DILocation(line: 81, column: 9, scope: !105)
!115 = !DILocation(line: 81, column: 21, scope: !105)
!116 = !DILocation(line: 82, column: 20, scope: !105)
!117 = !DILocation(line: 82, column: 9, scope: !105)
!118 = !DILocation(line: 84, column: 1, scope: !84)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 87, type: !22, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocalVariable(name: "data", scope: !119, file: !14, line: 89, type: !6)
!121 = !DILocation(line: 89, column: 15, scope: !119)
!122 = !DILocalVariable(name: "dataBuffer", scope: !119, file: !14, line: 90, type: !6)
!123 = !DILocation(line: 90, column: 15, scope: !119)
!124 = !DILocation(line: 90, column: 39, scope: !119)
!125 = !DILocation(line: 90, column: 28, scope: !119)
!126 = !DILocation(line: 91, column: 13, scope: !119)
!127 = !DILocation(line: 91, column: 5, scope: !119)
!128 = !DILocation(line: 92, column: 5, scope: !119)
!129 = !DILocation(line: 92, column: 23, scope: !119)
!130 = !DILocation(line: 93, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !119, file: !14, line: 93, column: 8)
!132 = !DILocation(line: 93, column: 8, scope: !119)
!133 = !DILocation(line: 96, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !14, line: 94, column: 5)
!135 = !DILocation(line: 96, column: 14, scope: !134)
!136 = !DILocation(line: 97, column: 5, scope: !134)
!137 = !DILocalVariable(name: "source", scope: !138, file: !14, line: 99, type: !44)
!138 = distinct !DILexicalBlock(scope: !119, file: !14, line: 98, column: 5)
!139 = !DILocation(line: 99, column: 17, scope: !138)
!140 = !DILocation(line: 100, column: 17, scope: !138)
!141 = !DILocation(line: 100, column: 9, scope: !138)
!142 = !DILocation(line: 101, column: 9, scope: !138)
!143 = !DILocation(line: 101, column: 23, scope: !138)
!144 = !DILocation(line: 103, column: 17, scope: !138)
!145 = !DILocation(line: 103, column: 23, scope: !138)
!146 = !DILocation(line: 103, column: 9, scope: !138)
!147 = !DILocation(line: 105, column: 9, scope: !138)
!148 = !DILocation(line: 105, column: 21, scope: !138)
!149 = !DILocation(line: 106, column: 20, scope: !138)
!150 = !DILocation(line: 106, column: 9, scope: !138)
!151 = !DILocation(line: 108, column: 1, scope: !119)
