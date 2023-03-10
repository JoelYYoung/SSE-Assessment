; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !29
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  %4 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %4, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !38
  store i32* %add.ptr, i32** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx2, align 4, !dbg !50
  %6 = load i32*, i32** %data, align 8, !dbg !51
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !53
  %7 = load i32*, i32** %data, align 8, !dbg !54
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !54
  store i32 0, i32* %arrayidx5, align 4, !dbg !55
  %8 = load i32*, i32** %data, align 8, !dbg !56
  call void @printWLine(i32* %8), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_07_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #4, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #4, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_07_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_07_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 400, align 16, !dbg !88
  %1 = bitcast i8* %0 to i32*, !dbg !89
  store i32* %1, i32** %dataBuffer, align 8, !dbg !87
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !90
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !91
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  %4 = load i32, i32* @staticFive, align 4, !dbg !94
  %cmp = icmp ne i32 %4, 5, !dbg !96
  br i1 %cmp, label %if.then, label %if.else, !dbg !97

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
  %4 = load i32, i32* @staticFive, align 4, !dbg !130
  %cmp = icmp eq i32 %4, 5, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !134
  store i32* %5, i32** %data, align 8, !dbg !136
  br label %if.end, !dbg !137

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !138, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !141
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !142
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !143
  store i32 0, i32* %arrayidx2, align 4, !dbg !144
  %6 = load i32*, i32** %data, align 8, !dbg !145
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !147
  %7 = load i32*, i32** %data, align 8, !dbg !148
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !148
  store i32 0, i32* %arrayidx5, align 4, !dbg !149
  %8 = load i32*, i32** %data, align 8, !dbg !150
  call void @printWLine(i32* %8), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !19)
!26 = !DILocation(line: 32, column: 39, scope: !19)
!27 = !DILocation(line: 32, column: 28, scope: !19)
!28 = !DILocation(line: 33, column: 13, scope: !19)
!29 = !DILocation(line: 33, column: 5, scope: !19)
!30 = !DILocation(line: 34, column: 5, scope: !19)
!31 = !DILocation(line: 34, column: 23, scope: !19)
!32 = !DILocation(line: 35, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !12, line: 35, column: 8)
!34 = !DILocation(line: 35, column: 18, scope: !33)
!35 = !DILocation(line: 35, column: 8, scope: !19)
!36 = !DILocation(line: 38, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 36, column: 5)
!38 = !DILocation(line: 38, column: 27, scope: !37)
!39 = !DILocation(line: 38, column: 14, scope: !37)
!40 = !DILocation(line: 39, column: 5, scope: !37)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !19, file: !12, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 41, column: 17, scope: !42)
!47 = !DILocation(line: 42, column: 17, scope: !42)
!48 = !DILocation(line: 42, column: 9, scope: !42)
!49 = !DILocation(line: 43, column: 9, scope: !42)
!50 = !DILocation(line: 43, column: 23, scope: !42)
!51 = !DILocation(line: 45, column: 17, scope: !42)
!52 = !DILocation(line: 45, column: 23, scope: !42)
!53 = !DILocation(line: 45, column: 9, scope: !42)
!54 = !DILocation(line: 47, column: 9, scope: !42)
!55 = !DILocation(line: 47, column: 21, scope: !42)
!56 = !DILocation(line: 48, column: 20, scope: !42)
!57 = !DILocation(line: 48, column: 9, scope: !42)
!58 = !DILocation(line: 50, column: 1, scope: !19)
!59 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_07_good", scope: !12, file: !12, line: 109, type: !20, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 111, column: 5, scope: !59)
!61 = !DILocation(line: 112, column: 5, scope: !59)
!62 = !DILocation(line: 113, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 125, type: !64, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!9, !9, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 125, type: !9)
!70 = !DILocation(line: 125, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 125, type: !66)
!72 = !DILocation(line: 125, column: 27, scope: !63)
!73 = !DILocation(line: 128, column: 22, scope: !63)
!74 = !DILocation(line: 128, column: 12, scope: !63)
!75 = !DILocation(line: 128, column: 5, scope: !63)
!76 = !DILocation(line: 130, column: 5, scope: !63)
!77 = !DILocation(line: 131, column: 5, scope: !63)
!78 = !DILocation(line: 132, column: 5, scope: !63)
!79 = !DILocation(line: 135, column: 5, scope: !63)
!80 = !DILocation(line: 136, column: 5, scope: !63)
!81 = !DILocation(line: 137, column: 5, scope: !63)
!82 = !DILocation(line: 139, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 59, type: !6)
!85 = !DILocation(line: 59, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !12, line: 60, type: !6)
!87 = !DILocation(line: 60, column: 15, scope: !83)
!88 = !DILocation(line: 60, column: 39, scope: !83)
!89 = !DILocation(line: 60, column: 28, scope: !83)
!90 = !DILocation(line: 61, column: 13, scope: !83)
!91 = !DILocation(line: 61, column: 5, scope: !83)
!92 = !DILocation(line: 62, column: 5, scope: !83)
!93 = !DILocation(line: 62, column: 23, scope: !83)
!94 = !DILocation(line: 63, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !83, file: !12, line: 63, column: 8)
!96 = !DILocation(line: 63, column: 18, scope: !95)
!97 = !DILocation(line: 63, column: 8, scope: !83)
!98 = !DILocation(line: 66, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 64, column: 5)
!100 = !DILocation(line: 67, column: 5, scope: !99)
!101 = !DILocation(line: 71, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !12, line: 69, column: 5)
!103 = !DILocation(line: 71, column: 14, scope: !102)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 74, type: !43)
!105 = distinct !DILexicalBlock(scope: !83, file: !12, line: 73, column: 5)
!106 = !DILocation(line: 74, column: 17, scope: !105)
!107 = !DILocation(line: 75, column: 17, scope: !105)
!108 = !DILocation(line: 75, column: 9, scope: !105)
!109 = !DILocation(line: 76, column: 9, scope: !105)
!110 = !DILocation(line: 76, column: 23, scope: !105)
!111 = !DILocation(line: 78, column: 17, scope: !105)
!112 = !DILocation(line: 78, column: 23, scope: !105)
!113 = !DILocation(line: 78, column: 9, scope: !105)
!114 = !DILocation(line: 80, column: 9, scope: !105)
!115 = !DILocation(line: 80, column: 21, scope: !105)
!116 = !DILocation(line: 81, column: 20, scope: !105)
!117 = !DILocation(line: 81, column: 9, scope: !105)
!118 = !DILocation(line: 83, column: 1, scope: !83)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocalVariable(name: "data", scope: !119, file: !12, line: 88, type: !6)
!121 = !DILocation(line: 88, column: 15, scope: !119)
!122 = !DILocalVariable(name: "dataBuffer", scope: !119, file: !12, line: 89, type: !6)
!123 = !DILocation(line: 89, column: 15, scope: !119)
!124 = !DILocation(line: 89, column: 39, scope: !119)
!125 = !DILocation(line: 89, column: 28, scope: !119)
!126 = !DILocation(line: 90, column: 13, scope: !119)
!127 = !DILocation(line: 90, column: 5, scope: !119)
!128 = !DILocation(line: 91, column: 5, scope: !119)
!129 = !DILocation(line: 91, column: 23, scope: !119)
!130 = !DILocation(line: 92, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !119, file: !12, line: 92, column: 8)
!132 = !DILocation(line: 92, column: 18, scope: !131)
!133 = !DILocation(line: 92, column: 8, scope: !119)
!134 = !DILocation(line: 95, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !12, line: 93, column: 5)
!136 = !DILocation(line: 95, column: 14, scope: !135)
!137 = !DILocation(line: 96, column: 5, scope: !135)
!138 = !DILocalVariable(name: "source", scope: !139, file: !12, line: 98, type: !43)
!139 = distinct !DILexicalBlock(scope: !119, file: !12, line: 97, column: 5)
!140 = !DILocation(line: 98, column: 17, scope: !139)
!141 = !DILocation(line: 99, column: 17, scope: !139)
!142 = !DILocation(line: 99, column: 9, scope: !139)
!143 = !DILocation(line: 100, column: 9, scope: !139)
!144 = !DILocation(line: 100, column: 23, scope: !139)
!145 = !DILocation(line: 102, column: 17, scope: !139)
!146 = !DILocation(line: 102, column: 23, scope: !139)
!147 = !DILocation(line: 102, column: 9, scope: !139)
!148 = !DILocation(line: 104, column: 9, scope: !139)
!149 = !DILocation(line: 104, column: 21, scope: !139)
!150 = !DILocation(line: 105, column: 20, scope: !139)
!151 = !DILocation(line: 105, column: 9, scope: !139)
!152 = !DILocation(line: 107, column: 1, scope: !119)
