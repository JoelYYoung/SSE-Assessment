; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !24, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !37
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !41
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !42
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  call void @printLine(i8* %arraydecay3), !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_strncpy_05_good() #0 !dbg !47 {
entry:
  call void @good1(), !dbg !48
  call void @good2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_05_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE126_Buffer_Overread__CWE170_char_strncpy_05_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !70 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticFalse, align 4, !dbg !71
  %tobool = icmp ne i32 %0, 0, !dbg !71
  br i1 %tobool, label %if.then, label %if.else, !dbg !73

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
  %0 = load i32, i32* @staticTrue, align 4, !dbg !95
  %tobool = icmp ne i32 %0, 0, !dbg !95
  br i1 %tobool, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !98, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !102, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !104
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !107
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !108
  %call = call i8* @strncpy(i8* %arraydecay1, i8* %arraydecay2, i64 99) #5, !dbg !109
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx3, align 1, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  call void @printLine(i8* %arraydecay4), !dbg !113
  br label %if.end, !dbg !114

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !115
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_strncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocation(line: 30, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 30, column: 8)
!23 = !DILocation(line: 30, column: 8, scope: !18)
!24 = !DILocalVariable(name: "data", scope: !25, file: !10, line: 33, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !10, line: 32, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !10, line: 31, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 1200, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 150)
!31 = !DILocation(line: 33, column: 18, scope: !25)
!32 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 33, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 29, scope: !25)
!37 = !DILocation(line: 35, column: 13, scope: !25)
!38 = !DILocation(line: 36, column: 13, scope: !25)
!39 = !DILocation(line: 36, column: 23, scope: !25)
!40 = !DILocation(line: 39, column: 21, scope: !25)
!41 = !DILocation(line: 39, column: 27, scope: !25)
!42 = !DILocation(line: 39, column: 13, scope: !25)
!43 = !DILocation(line: 41, column: 23, scope: !25)
!44 = !DILocation(line: 41, column: 13, scope: !25)
!45 = !DILocation(line: 43, column: 5, scope: !26)
!46 = !DILocation(line: 44, column: 1, scope: !18)
!47 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_strncpy_05_good", scope: !10, file: !10, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DILocation(line: 95, column: 5, scope: !47)
!49 = !DILocation(line: 96, column: 5, scope: !47)
!50 = !DILocation(line: 97, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 108, type: !52, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!11, !11, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !10, line: 108, type: !11)
!57 = !DILocation(line: 108, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !10, line: 108, type: !54)
!59 = !DILocation(line: 108, column: 27, scope: !51)
!60 = !DILocation(line: 111, column: 22, scope: !51)
!61 = !DILocation(line: 111, column: 12, scope: !51)
!62 = !DILocation(line: 111, column: 5, scope: !51)
!63 = !DILocation(line: 113, column: 5, scope: !51)
!64 = !DILocation(line: 114, column: 5, scope: !51)
!65 = !DILocation(line: 115, column: 5, scope: !51)
!66 = !DILocation(line: 118, column: 5, scope: !51)
!67 = !DILocation(line: 119, column: 5, scope: !51)
!68 = !DILocation(line: 120, column: 5, scope: !51)
!69 = !DILocation(line: 122, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "good1", scope: !10, file: !10, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocation(line: 53, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !70, file: !10, line: 53, column: 8)
!73 = !DILocation(line: 53, column: 8, scope: !70)
!74 = !DILocation(line: 56, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !10, line: 54, column: 5)
!76 = !DILocation(line: 57, column: 5, scope: !75)
!77 = !DILocalVariable(name: "data", scope: !78, file: !10, line: 61, type: !27)
!78 = distinct !DILexicalBlock(scope: !79, file: !10, line: 60, column: 9)
!79 = distinct !DILexicalBlock(scope: !72, file: !10, line: 59, column: 5)
!80 = !DILocation(line: 61, column: 18, scope: !78)
!81 = !DILocalVariable(name: "dest", scope: !78, file: !10, line: 61, type: !33)
!82 = !DILocation(line: 61, column: 29, scope: !78)
!83 = !DILocation(line: 63, column: 13, scope: !78)
!84 = !DILocation(line: 64, column: 13, scope: !78)
!85 = !DILocation(line: 64, column: 23, scope: !78)
!86 = !DILocation(line: 67, column: 21, scope: !78)
!87 = !DILocation(line: 67, column: 27, scope: !78)
!88 = !DILocation(line: 67, column: 13, scope: !78)
!89 = !DILocation(line: 68, column: 13, scope: !78)
!90 = !DILocation(line: 68, column: 22, scope: !78)
!91 = !DILocation(line: 69, column: 23, scope: !78)
!92 = !DILocation(line: 69, column: 13, scope: !78)
!93 = !DILocation(line: 72, column: 1, scope: !70)
!94 = distinct !DISubprogram(name: "good2", scope: !10, file: !10, line: 75, type: !19, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocation(line: 77, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !94, file: !10, line: 77, column: 8)
!97 = !DILocation(line: 77, column: 8, scope: !94)
!98 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 80, type: !27)
!99 = distinct !DILexicalBlock(scope: !100, file: !10, line: 79, column: 9)
!100 = distinct !DILexicalBlock(scope: !96, file: !10, line: 78, column: 5)
!101 = !DILocation(line: 80, column: 18, scope: !99)
!102 = !DILocalVariable(name: "dest", scope: !99, file: !10, line: 80, type: !33)
!103 = !DILocation(line: 80, column: 29, scope: !99)
!104 = !DILocation(line: 82, column: 13, scope: !99)
!105 = !DILocation(line: 83, column: 13, scope: !99)
!106 = !DILocation(line: 83, column: 23, scope: !99)
!107 = !DILocation(line: 86, column: 21, scope: !99)
!108 = !DILocation(line: 86, column: 27, scope: !99)
!109 = !DILocation(line: 86, column: 13, scope: !99)
!110 = !DILocation(line: 87, column: 13, scope: !99)
!111 = !DILocation(line: 87, column: 22, scope: !99)
!112 = !DILocation(line: 88, column: 23, scope: !99)
!113 = !DILocation(line: 88, column: 13, scope: !99)
!114 = !DILocation(line: 90, column: 5, scope: !100)
!115 = !DILocation(line: 91, column: 1, scope: !94)
