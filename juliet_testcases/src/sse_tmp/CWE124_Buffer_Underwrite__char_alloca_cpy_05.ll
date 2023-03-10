; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_cpy_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %3 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %3, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !37
  store i8* %add.ptr, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx1, align 1, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  %call = call i8* @strcpy(i8* %5, i8* %arraydecay2) #5, !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %6), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_cpy_05_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE124_Buffer_Underwrite__char_alloca_cpy_05_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__char_alloca_cpy_05_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 100, align 16, !dbg !82
  store i8* %0, i8** %dataBuffer, align 8, !dbg !81
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !84
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %3 = load i32, i32* @staticFalse, align 4, !dbg !87
  %tobool = icmp ne i32 %3, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !93
  store i8* %4, i8** %data, align 8, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx1, align 1, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !103
  %call = call i8* @strcpy(i8* %5, i8* %arraydecay2) #5, !dbg !104
  %6 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %6), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 100, align 16, !dbg !113
  store i8* %0, i8** %dataBuffer, align 8, !dbg !112
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !115
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %3 = load i32, i32* @staticTrue, align 4, !dbg !118
  %tobool = icmp ne i32 %3, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !121
  store i8* %4, i8** %data, align 8, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !128
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx1, align 1, !dbg !130
  %5 = load i8*, i8** %data, align 8, !dbg !131
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !132
  %call = call i8* @strcpy(i8* %5, i8* %arraydecay2) #5, !dbg !133
  %6 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %6), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_cpy_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 33, scope: !20)
!28 = !DILocation(line: 34, column: 12, scope: !20)
!29 = !DILocation(line: 34, column: 5, scope: !20)
!30 = !DILocation(line: 35, column: 5, scope: !20)
!31 = !DILocation(line: 35, column: 23, scope: !20)
!32 = !DILocation(line: 36, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !20, file: !12, line: 36, column: 8)
!34 = !DILocation(line: 36, column: 8, scope: !20)
!35 = !DILocation(line: 39, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 37, column: 5)
!37 = !DILocation(line: 39, column: 27, scope: !36)
!38 = !DILocation(line: 39, column: 14, scope: !36)
!39 = !DILocation(line: 40, column: 5, scope: !36)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 42, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !12, line: 41, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 42, column: 14, scope: !41)
!46 = !DILocation(line: 43, column: 9, scope: !41)
!47 = !DILocation(line: 44, column: 9, scope: !41)
!48 = !DILocation(line: 44, column: 23, scope: !41)
!49 = !DILocation(line: 46, column: 16, scope: !41)
!50 = !DILocation(line: 46, column: 22, scope: !41)
!51 = !DILocation(line: 46, column: 9, scope: !41)
!52 = !DILocation(line: 47, column: 19, scope: !41)
!53 = !DILocation(line: 47, column: 9, scope: !41)
!54 = !DILocation(line: 49, column: 1, scope: !20)
!55 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_cpy_05_good", scope: !12, file: !12, line: 104, type: !21, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 106, column: 5, scope: !55)
!57 = !DILocation(line: 107, column: 5, scope: !55)
!58 = !DILocation(line: 108, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 120, type: !60, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!13, !13, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 120, type: !13)
!64 = !DILocation(line: 120, column: 14, scope: !59)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 120, type: !62)
!66 = !DILocation(line: 120, column: 27, scope: !59)
!67 = !DILocation(line: 123, column: 22, scope: !59)
!68 = !DILocation(line: 123, column: 12, scope: !59)
!69 = !DILocation(line: 123, column: 5, scope: !59)
!70 = !DILocation(line: 125, column: 5, scope: !59)
!71 = !DILocation(line: 126, column: 5, scope: !59)
!72 = !DILocation(line: 127, column: 5, scope: !59)
!73 = !DILocation(line: 130, column: 5, scope: !59)
!74 = !DILocation(line: 131, column: 5, scope: !59)
!75 = !DILocation(line: 132, column: 5, scope: !59)
!76 = !DILocation(line: 134, column: 5, scope: !59)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 56, type: !21, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 58, type: !6)
!79 = !DILocation(line: 58, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !12, line: 59, type: !6)
!81 = !DILocation(line: 59, column: 12, scope: !77)
!82 = !DILocation(line: 59, column: 33, scope: !77)
!83 = !DILocation(line: 60, column: 12, scope: !77)
!84 = !DILocation(line: 60, column: 5, scope: !77)
!85 = !DILocation(line: 61, column: 5, scope: !77)
!86 = !DILocation(line: 61, column: 23, scope: !77)
!87 = !DILocation(line: 62, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !77, file: !12, line: 62, column: 8)
!89 = !DILocation(line: 62, column: 8, scope: !77)
!90 = !DILocation(line: 65, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !12, line: 63, column: 5)
!92 = !DILocation(line: 66, column: 5, scope: !91)
!93 = !DILocation(line: 70, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !12, line: 68, column: 5)
!95 = !DILocation(line: 70, column: 14, scope: !94)
!96 = !DILocalVariable(name: "source", scope: !97, file: !12, line: 73, type: !42)
!97 = distinct !DILexicalBlock(scope: !77, file: !12, line: 72, column: 5)
!98 = !DILocation(line: 73, column: 14, scope: !97)
!99 = !DILocation(line: 74, column: 9, scope: !97)
!100 = !DILocation(line: 75, column: 9, scope: !97)
!101 = !DILocation(line: 75, column: 23, scope: !97)
!102 = !DILocation(line: 77, column: 16, scope: !97)
!103 = !DILocation(line: 77, column: 22, scope: !97)
!104 = !DILocation(line: 77, column: 9, scope: !97)
!105 = !DILocation(line: 78, column: 19, scope: !97)
!106 = !DILocation(line: 78, column: 9, scope: !97)
!107 = !DILocation(line: 80, column: 1, scope: !77)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 85, type: !6)
!110 = !DILocation(line: 85, column: 12, scope: !108)
!111 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !12, line: 86, type: !6)
!112 = !DILocation(line: 86, column: 12, scope: !108)
!113 = !DILocation(line: 86, column: 33, scope: !108)
!114 = !DILocation(line: 87, column: 12, scope: !108)
!115 = !DILocation(line: 87, column: 5, scope: !108)
!116 = !DILocation(line: 88, column: 5, scope: !108)
!117 = !DILocation(line: 88, column: 23, scope: !108)
!118 = !DILocation(line: 89, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !108, file: !12, line: 89, column: 8)
!120 = !DILocation(line: 89, column: 8, scope: !108)
!121 = !DILocation(line: 92, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 90, column: 5)
!123 = !DILocation(line: 92, column: 14, scope: !122)
!124 = !DILocation(line: 93, column: 5, scope: !122)
!125 = !DILocalVariable(name: "source", scope: !126, file: !12, line: 95, type: !42)
!126 = distinct !DILexicalBlock(scope: !108, file: !12, line: 94, column: 5)
!127 = !DILocation(line: 95, column: 14, scope: !126)
!128 = !DILocation(line: 96, column: 9, scope: !126)
!129 = !DILocation(line: 97, column: 9, scope: !126)
!130 = !DILocation(line: 97, column: 23, scope: !126)
!131 = !DILocation(line: 99, column: 16, scope: !126)
!132 = !DILocation(line: 99, column: 22, scope: !126)
!133 = !DILocation(line: 99, column: 9, scope: !126)
!134 = !DILocation(line: 100, column: 19, scope: !126)
!135 = !DILocation(line: 100, column: 9, scope: !126)
!136 = !DILocation(line: 102, column: 1, scope: !108)
