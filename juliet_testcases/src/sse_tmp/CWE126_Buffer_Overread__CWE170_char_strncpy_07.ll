; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 5, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !23, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !36
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !39
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !40
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !41
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  call void @printLine(i8* %arraydecay3), !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_07_good() #0 !dbg !46 {
entry:
  call void @good1(), !dbg !47
  call void @good2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_07_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_07_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !69 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !70
  %cmp = icmp ne i32 %0, 5, !dbg !72
  br i1 %cmp, label %if.then, label %if.else, !dbg !73

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !74
  br label %if.end, !dbg !76

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !77, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !83
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !86
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !87
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !88
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx3, align 1, !dbg !90
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !91
  call void @printLine(i8* %arraydecay4), !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !94 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticFive, align 4, !dbg !95
  %cmp = icmp eq i32 %0, 5, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !99, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !105
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !109
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !110
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx3, align 1, !dbg !112
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  call void @printLine(i8* %arraydecay4), !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 23, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_07.c", directory: "/root/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_07_bad", scope: !8, file: !8, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 29, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !8, line: 29, column: 8)
!21 = !DILocation(line: 29, column: 18, scope: !20)
!22 = !DILocation(line: 29, column: 8, scope: !16)
!23 = !DILocalVariable(name: "data", scope: !24, file: !8, line: 32, type: !26)
!24 = distinct !DILexicalBlock(scope: !25, file: !8, line: 31, column: 9)
!25 = distinct !DILexicalBlock(scope: !20, file: !8, line: 30, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 1200, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 150)
!30 = !DILocation(line: 32, column: 18, scope: !24)
!31 = !DILocalVariable(name: "dest", scope: !24, file: !8, line: 32, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 32, column: 29, scope: !24)
!36 = !DILocation(line: 34, column: 13, scope: !24)
!37 = !DILocation(line: 35, column: 13, scope: !24)
!38 = !DILocation(line: 35, column: 23, scope: !24)
!39 = !DILocation(line: 38, column: 21, scope: !24)
!40 = !DILocation(line: 38, column: 27, scope: !24)
!41 = !DILocation(line: 38, column: 13, scope: !24)
!42 = !DILocation(line: 40, column: 23, scope: !24)
!43 = !DILocation(line: 40, column: 13, scope: !24)
!44 = !DILocation(line: 42, column: 5, scope: !25)
!45 = !DILocation(line: 43, column: 1, scope: !16)
!46 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_07_good", scope: !8, file: !8, line: 92, type: !17, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DILocation(line: 94, column: 5, scope: !46)
!48 = !DILocation(line: 95, column: 5, scope: !46)
!49 = !DILocation(line: 96, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 107, type: !51, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!9, !9, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !8, line: 107, type: !9)
!56 = !DILocation(line: 107, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !8, line: 107, type: !53)
!58 = !DILocation(line: 107, column: 27, scope: !50)
!59 = !DILocation(line: 110, column: 22, scope: !50)
!60 = !DILocation(line: 110, column: 12, scope: !50)
!61 = !DILocation(line: 110, column: 5, scope: !50)
!62 = !DILocation(line: 112, column: 5, scope: !50)
!63 = !DILocation(line: 113, column: 5, scope: !50)
!64 = !DILocation(line: 114, column: 5, scope: !50)
!65 = !DILocation(line: 117, column: 5, scope: !50)
!66 = !DILocation(line: 118, column: 5, scope: !50)
!67 = !DILocation(line: 119, column: 5, scope: !50)
!68 = !DILocation(line: 121, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocation(line: 52, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !69, file: !8, line: 52, column: 8)
!72 = !DILocation(line: 52, column: 18, scope: !71)
!73 = !DILocation(line: 52, column: 8, scope: !69)
!74 = !DILocation(line: 55, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !8, line: 53, column: 5)
!76 = !DILocation(line: 56, column: 5, scope: !75)
!77 = !DILocalVariable(name: "data", scope: !78, file: !8, line: 60, type: !26)
!78 = distinct !DILexicalBlock(scope: !79, file: !8, line: 59, column: 9)
!79 = distinct !DILexicalBlock(scope: !71, file: !8, line: 58, column: 5)
!80 = !DILocation(line: 60, column: 18, scope: !78)
!81 = !DILocalVariable(name: "dest", scope: !78, file: !8, line: 60, type: !32)
!82 = !DILocation(line: 60, column: 29, scope: !78)
!83 = !DILocation(line: 62, column: 13, scope: !78)
!84 = !DILocation(line: 63, column: 13, scope: !78)
!85 = !DILocation(line: 63, column: 23, scope: !78)
!86 = !DILocation(line: 66, column: 21, scope: !78)
!87 = !DILocation(line: 66, column: 27, scope: !78)
!88 = !DILocation(line: 66, column: 13, scope: !78)
!89 = !DILocation(line: 67, column: 13, scope: !78)
!90 = !DILocation(line: 67, column: 22, scope: !78)
!91 = !DILocation(line: 68, column: 23, scope: !78)
!92 = !DILocation(line: 68, column: 13, scope: !78)
!93 = !DILocation(line: 71, column: 1, scope: !69)
!94 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocation(line: 76, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !94, file: !8, line: 76, column: 8)
!97 = !DILocation(line: 76, column: 18, scope: !96)
!98 = !DILocation(line: 76, column: 8, scope: !94)
!99 = !DILocalVariable(name: "data", scope: !100, file: !8, line: 79, type: !26)
!100 = distinct !DILexicalBlock(scope: !101, file: !8, line: 78, column: 9)
!101 = distinct !DILexicalBlock(scope: !96, file: !8, line: 77, column: 5)
!102 = !DILocation(line: 79, column: 18, scope: !100)
!103 = !DILocalVariable(name: "dest", scope: !100, file: !8, line: 79, type: !32)
!104 = !DILocation(line: 79, column: 29, scope: !100)
!105 = !DILocation(line: 81, column: 13, scope: !100)
!106 = !DILocation(line: 82, column: 13, scope: !100)
!107 = !DILocation(line: 82, column: 23, scope: !100)
!108 = !DILocation(line: 85, column: 21, scope: !100)
!109 = !DILocation(line: 85, column: 27, scope: !100)
!110 = !DILocation(line: 85, column: 13, scope: !100)
!111 = !DILocation(line: 86, column: 13, scope: !100)
!112 = !DILocation(line: 86, column: 22, scope: !100)
!113 = !DILocation(line: 87, column: 23, scope: !100)
!114 = !DILocation(line: 87, column: 13, scope: !100)
!115 = !DILocation(line: 89, column: 5, scope: !101)
!116 = !DILocation(line: 90, column: 1, scope: !94)
