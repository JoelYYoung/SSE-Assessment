; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_07.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %0, i8** %dataBuffer, align 8, !dbg !24
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !27
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  %3 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %3, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !34
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !36
  store i8* %add.ptr, i8** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx1, align 1, !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !51
  store i8 0, i8* %arrayidx3, align 1, !dbg !52
  %7 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* %7), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_ncpy_07_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_07_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE124_Buffer_Underwrite__char_alloca_ncpy_07_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 100, align 16, !dbg !83
  store i8* %0, i8** %dataBuffer, align 8, !dbg !82
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !85
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  %3 = load i32, i32* @staticFive, align 4, !dbg !88
  %cmp = icmp ne i32 %3, 5, !dbg !90
  br i1 %cmp, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !95
  store i8* %4, i8** %data, align 8, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx1, align 1, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !105
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !106
  %6 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !107
  store i8 0, i8* %arrayidx3, align 1, !dbg !108
  %7 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %7), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = alloca i8, i64 100, align 16, !dbg !117
  store i8* %0, i8** %dataBuffer, align 8, !dbg !116
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !119
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  %3 = load i32, i32* @staticFive, align 4, !dbg !122
  %cmp = icmp eq i32 %3, 5, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !126
  store i8* %4, i8** %data, align 8, !dbg !128
  br label %if.end, !dbg !129

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !133
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !134
  store i8 0, i8* %arrayidx1, align 1, !dbg !135
  %5 = load i8*, i8** %data, align 8, !dbg !136
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !137
  %call = call i8* @strncpy(i8* %5, i8* %arraydecay2, i64 99) #5, !dbg !138
  %6 = load i8*, i8** %data, align 8, !dbg !139
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !139
  store i8 0, i8* %arrayidx3, align 1, !dbg !140
  %7 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* %7), !dbg !142
  ret void, !dbg !143
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
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_ncpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_07_bad", scope: !10, file: !10, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 31, type: !6)
!22 = !DILocation(line: 31, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocation(line: 32, column: 33, scope: !18)
!26 = !DILocation(line: 33, column: 12, scope: !18)
!27 = !DILocation(line: 33, column: 5, scope: !18)
!28 = !DILocation(line: 34, column: 5, scope: !18)
!29 = !DILocation(line: 34, column: 23, scope: !18)
!30 = !DILocation(line: 35, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !18, file: !10, line: 35, column: 8)
!32 = !DILocation(line: 35, column: 18, scope: !31)
!33 = !DILocation(line: 35, column: 8, scope: !18)
!34 = !DILocation(line: 38, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 36, column: 5)
!36 = !DILocation(line: 38, column: 27, scope: !35)
!37 = !DILocation(line: 38, column: 14, scope: !35)
!38 = !DILocation(line: 39, column: 5, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !40, file: !10, line: 41, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !10, line: 40, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 41, column: 14, scope: !40)
!45 = !DILocation(line: 42, column: 9, scope: !40)
!46 = !DILocation(line: 43, column: 9, scope: !40)
!47 = !DILocation(line: 43, column: 23, scope: !40)
!48 = !DILocation(line: 45, column: 17, scope: !40)
!49 = !DILocation(line: 45, column: 23, scope: !40)
!50 = !DILocation(line: 45, column: 9, scope: !40)
!51 = !DILocation(line: 47, column: 9, scope: !40)
!52 = !DILocation(line: 47, column: 21, scope: !40)
!53 = !DILocation(line: 48, column: 19, scope: !40)
!54 = !DILocation(line: 48, column: 9, scope: !40)
!55 = !DILocation(line: 50, column: 1, scope: !18)
!56 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_ncpy_07_good", scope: !10, file: !10, line: 109, type: !19, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 111, column: 5, scope: !56)
!58 = !DILocation(line: 112, column: 5, scope: !56)
!59 = !DILocation(line: 113, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 125, type: !61, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!11, !11, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !10, line: 125, type: !11)
!65 = !DILocation(line: 125, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !10, line: 125, type: !63)
!67 = !DILocation(line: 125, column: 27, scope: !60)
!68 = !DILocation(line: 128, column: 22, scope: !60)
!69 = !DILocation(line: 128, column: 12, scope: !60)
!70 = !DILocation(line: 128, column: 5, scope: !60)
!71 = !DILocation(line: 130, column: 5, scope: !60)
!72 = !DILocation(line: 131, column: 5, scope: !60)
!73 = !DILocation(line: 132, column: 5, scope: !60)
!74 = !DILocation(line: 135, column: 5, scope: !60)
!75 = !DILocation(line: 136, column: 5, scope: !60)
!76 = !DILocation(line: 137, column: 5, scope: !60)
!77 = !DILocation(line: 139, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 57, type: !19, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !10, line: 59, type: !6)
!80 = !DILocation(line: 59, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !10, line: 60, type: !6)
!82 = !DILocation(line: 60, column: 12, scope: !78)
!83 = !DILocation(line: 60, column: 33, scope: !78)
!84 = !DILocation(line: 61, column: 12, scope: !78)
!85 = !DILocation(line: 61, column: 5, scope: !78)
!86 = !DILocation(line: 62, column: 5, scope: !78)
!87 = !DILocation(line: 62, column: 23, scope: !78)
!88 = !DILocation(line: 63, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !78, file: !10, line: 63, column: 8)
!90 = !DILocation(line: 63, column: 18, scope: !89)
!91 = !DILocation(line: 63, column: 8, scope: !78)
!92 = !DILocation(line: 66, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !10, line: 64, column: 5)
!94 = !DILocation(line: 67, column: 5, scope: !93)
!95 = !DILocation(line: 71, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !89, file: !10, line: 69, column: 5)
!97 = !DILocation(line: 71, column: 14, scope: !96)
!98 = !DILocalVariable(name: "source", scope: !99, file: !10, line: 74, type: !41)
!99 = distinct !DILexicalBlock(scope: !78, file: !10, line: 73, column: 5)
!100 = !DILocation(line: 74, column: 14, scope: !99)
!101 = !DILocation(line: 75, column: 9, scope: !99)
!102 = !DILocation(line: 76, column: 9, scope: !99)
!103 = !DILocation(line: 76, column: 23, scope: !99)
!104 = !DILocation(line: 78, column: 17, scope: !99)
!105 = !DILocation(line: 78, column: 23, scope: !99)
!106 = !DILocation(line: 78, column: 9, scope: !99)
!107 = !DILocation(line: 80, column: 9, scope: !99)
!108 = !DILocation(line: 80, column: 21, scope: !99)
!109 = !DILocation(line: 81, column: 19, scope: !99)
!110 = !DILocation(line: 81, column: 9, scope: !99)
!111 = !DILocation(line: 83, column: 1, scope: !78)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !10, line: 88, type: !6)
!114 = !DILocation(line: 88, column: 12, scope: !112)
!115 = !DILocalVariable(name: "dataBuffer", scope: !112, file: !10, line: 89, type: !6)
!116 = !DILocation(line: 89, column: 12, scope: !112)
!117 = !DILocation(line: 89, column: 33, scope: !112)
!118 = !DILocation(line: 90, column: 12, scope: !112)
!119 = !DILocation(line: 90, column: 5, scope: !112)
!120 = !DILocation(line: 91, column: 5, scope: !112)
!121 = !DILocation(line: 91, column: 23, scope: !112)
!122 = !DILocation(line: 92, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !112, file: !10, line: 92, column: 8)
!124 = !DILocation(line: 92, column: 18, scope: !123)
!125 = !DILocation(line: 92, column: 8, scope: !112)
!126 = !DILocation(line: 95, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !10, line: 93, column: 5)
!128 = !DILocation(line: 95, column: 14, scope: !127)
!129 = !DILocation(line: 96, column: 5, scope: !127)
!130 = !DILocalVariable(name: "source", scope: !131, file: !10, line: 98, type: !41)
!131 = distinct !DILexicalBlock(scope: !112, file: !10, line: 97, column: 5)
!132 = !DILocation(line: 98, column: 14, scope: !131)
!133 = !DILocation(line: 99, column: 9, scope: !131)
!134 = !DILocation(line: 100, column: 9, scope: !131)
!135 = !DILocation(line: 100, column: 23, scope: !131)
!136 = !DILocation(line: 102, column: 17, scope: !131)
!137 = !DILocation(line: 102, column: 23, scope: !131)
!138 = !DILocation(line: 102, column: 9, scope: !131)
!139 = !DILocation(line: 104, column: 9, scope: !131)
!140 = !DILocation(line: 104, column: 21, scope: !131)
!141 = !DILocation(line: 105, column: 19, scope: !131)
!142 = !DILocation(line: 105, column: 9, scope: !131)
!143 = !DILocation(line: 107, column: 1, scope: !112)
