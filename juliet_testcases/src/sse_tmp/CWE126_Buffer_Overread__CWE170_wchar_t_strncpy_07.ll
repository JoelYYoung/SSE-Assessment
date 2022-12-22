; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 5, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !23, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !37
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !38
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !41
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !42
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !43
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !44
  call void @printWLine(i32* %arraydecay4), !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_07_good() #0 !dbg !48 {
entry:
  call void @good1(), !dbg !49
  call void @good2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #4, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #4, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_07_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_07_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !72 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !73
  %cmp = icmp ne i32 %0, 5, !dbg !75
  br i1 %cmp, label %if.then, label %if.else, !dbg !76

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  br label %if.end, !dbg !79

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !80, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !86
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !87
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !90
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !91
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !92
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !93
  store i32 0, i32* %arrayidx4, align 4, !dbg !94
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !95
  call void @printWLine(i32* %arraydecay5), !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !98 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !99
  %cmp = icmp eq i32 %0, 5, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !103, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !108
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !109
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !110
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !114
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !115
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx4, align 4, !dbg !117
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  call void @printWLine(i32* %arraydecay5), !dbg !119
  br label %if.end, !dbg !120

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 29, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !8, line: 29, column: 8)
!21 = !DILocation(line: 29, column: 18, scope: !20)
!22 = !DILocation(line: 29, column: 8, scope: !16)
!23 = !DILocalVariable(name: "data", scope: !24, file: !8, line: 32, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !8, line: 31, column: 9)
!25 = distinct !DILexicalBlock(scope: !20, file: !8, line: 30, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 4800, elements: !29)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !28, line: 74, baseType: !9)
!28 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!29 = !{!30}
!30 = !DISubrange(count: 150)
!31 = !DILocation(line: 32, column: 21, scope: !24)
!32 = !DILocalVariable(name: "dest", scope: !24, file: !8, line: 32, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 32, column: 32, scope: !24)
!37 = !DILocation(line: 34, column: 21, scope: !24)
!38 = !DILocation(line: 34, column: 13, scope: !24)
!39 = !DILocation(line: 35, column: 13, scope: !24)
!40 = !DILocation(line: 35, column: 23, scope: !24)
!41 = !DILocation(line: 38, column: 21, scope: !24)
!42 = !DILocation(line: 38, column: 27, scope: !24)
!43 = !DILocation(line: 38, column: 13, scope: !24)
!44 = !DILocation(line: 40, column: 24, scope: !24)
!45 = !DILocation(line: 40, column: 13, scope: !24)
!46 = !DILocation(line: 42, column: 5, scope: !25)
!47 = !DILocation(line: 43, column: 1, scope: !16)
!48 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_07_good", scope: !8, file: !8, line: 92, type: !17, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!49 = !DILocation(line: 94, column: 5, scope: !48)
!50 = !DILocation(line: 95, column: 5, scope: !48)
!51 = !DILocation(line: 96, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 107, type: !53, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!9, !9, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !8, line: 107, type: !9)
!59 = !DILocation(line: 107, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !8, line: 107, type: !55)
!61 = !DILocation(line: 107, column: 27, scope: !52)
!62 = !DILocation(line: 110, column: 22, scope: !52)
!63 = !DILocation(line: 110, column: 12, scope: !52)
!64 = !DILocation(line: 110, column: 5, scope: !52)
!65 = !DILocation(line: 112, column: 5, scope: !52)
!66 = !DILocation(line: 113, column: 5, scope: !52)
!67 = !DILocation(line: 114, column: 5, scope: !52)
!68 = !DILocation(line: 117, column: 5, scope: !52)
!69 = !DILocation(line: 118, column: 5, scope: !52)
!70 = !DILocation(line: 119, column: 5, scope: !52)
!71 = !DILocation(line: 121, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocation(line: 52, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !72, file: !8, line: 52, column: 8)
!75 = !DILocation(line: 52, column: 18, scope: !74)
!76 = !DILocation(line: 52, column: 8, scope: !72)
!77 = !DILocation(line: 55, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !8, line: 53, column: 5)
!79 = !DILocation(line: 56, column: 5, scope: !78)
!80 = !DILocalVariable(name: "data", scope: !81, file: !8, line: 60, type: !26)
!81 = distinct !DILexicalBlock(scope: !82, file: !8, line: 59, column: 9)
!82 = distinct !DILexicalBlock(scope: !74, file: !8, line: 58, column: 5)
!83 = !DILocation(line: 60, column: 21, scope: !81)
!84 = !DILocalVariable(name: "dest", scope: !81, file: !8, line: 60, type: !33)
!85 = !DILocation(line: 60, column: 32, scope: !81)
!86 = !DILocation(line: 62, column: 21, scope: !81)
!87 = !DILocation(line: 62, column: 13, scope: !81)
!88 = !DILocation(line: 63, column: 13, scope: !81)
!89 = !DILocation(line: 63, column: 23, scope: !81)
!90 = !DILocation(line: 66, column: 21, scope: !81)
!91 = !DILocation(line: 66, column: 27, scope: !81)
!92 = !DILocation(line: 66, column: 13, scope: !81)
!93 = !DILocation(line: 67, column: 13, scope: !81)
!94 = !DILocation(line: 67, column: 22, scope: !81)
!95 = !DILocation(line: 68, column: 24, scope: !81)
!96 = !DILocation(line: 68, column: 13, scope: !81)
!97 = !DILocation(line: 71, column: 1, scope: !72)
!98 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocation(line: 76, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !98, file: !8, line: 76, column: 8)
!101 = !DILocation(line: 76, column: 18, scope: !100)
!102 = !DILocation(line: 76, column: 8, scope: !98)
!103 = !DILocalVariable(name: "data", scope: !104, file: !8, line: 79, type: !26)
!104 = distinct !DILexicalBlock(scope: !105, file: !8, line: 78, column: 9)
!105 = distinct !DILexicalBlock(scope: !100, file: !8, line: 77, column: 5)
!106 = !DILocation(line: 79, column: 21, scope: !104)
!107 = !DILocalVariable(name: "dest", scope: !104, file: !8, line: 79, type: !33)
!108 = !DILocation(line: 79, column: 32, scope: !104)
!109 = !DILocation(line: 81, column: 21, scope: !104)
!110 = !DILocation(line: 81, column: 13, scope: !104)
!111 = !DILocation(line: 82, column: 13, scope: !104)
!112 = !DILocation(line: 82, column: 23, scope: !104)
!113 = !DILocation(line: 85, column: 21, scope: !104)
!114 = !DILocation(line: 85, column: 27, scope: !104)
!115 = !DILocation(line: 85, column: 13, scope: !104)
!116 = !DILocation(line: 86, column: 13, scope: !104)
!117 = !DILocation(line: 86, column: 22, scope: !104)
!118 = !DILocation(line: 87, column: 24, scope: !104)
!119 = !DILocation(line: 87, column: 13, scope: !104)
!120 = !DILocation(line: 89, column: 5, scope: !105)
!121 = !DILocation(line: 90, column: 1, scope: !98)
